class Particle {
  PVector pos;
  ArrayList<PVector> trace;
  
  //float scaleSize = 2;

  Particle(PVector p) {
    pos = p;
    
    pos.mult(scaleSize);
    pos.sub(new PVector(width*(scaleSize-1)/2, height*(scaleSize-1)/2));
    
    trace = new ArrayList<PVector>();
    trace.add(new PVector(pos.x, pos.y));
  }

  void run() {
    if (pos.x >=0 && pos.x <= width && pos.y >=0 && pos.y <= height) {
      move();
    }
    display();
  }

  void display() {
    float a=map(mouseX,0,600,0.2,3);
    //stroke(0);
    //noFill();
    strokeWeight(a);
    //point(pos.x, pos.y);
    beginShape();
    for(int i = 0; i < trace.size()-1; i ++){
      color  cc = img.get(floor(trace.get(i).x), floor(trace.get(i).y));
      stroke(cc,45);
      line(trace.get(i).x, trace.get(i).y,trace.get(i+1).x,trace.get(i+1).y);
    }
    endShape();
  }

  void move() {
    PVector v = PVector.sub(pos, new PVector(width/2, height/2));
    v.normalize().mult(5);
    pos.add(v);
    
    trace.add(new PVector(pos.x, pos.y));
  }
}
