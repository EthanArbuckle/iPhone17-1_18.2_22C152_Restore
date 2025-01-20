@interface AVDisplayLink
- (CADisplayLink)displayLink;
- (double)runningTime;
- (double)startTime;
- (id)linkFired;
- (id)observer;
- (void)invalidate;
- (void)linkFired:(id)a3;
- (void)setDisplayLink:(id)a3;
- (void)setLinkFired:(id)a3;
- (void)setObserver:(id)a3;
- (void)setStartTime:(double)a3;
- (void)startDisplayLinkUpdatesForObserver:(id)a3 framesPerSecond:(int64_t)a4 usingBlock:(id)a5;
@end

@implementation AVDisplayLink

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_observer);
  objc_storeStrong((id *)&self->_displayLink, 0);

  objc_storeStrong(&self->_linkFired, 0);
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setObserver:(id)a3
{
}

- (id)observer
{
  id WeakRetained = objc_loadWeakRetained(&self->_observer);

  return WeakRetained;
}

- (void)setDisplayLink:(id)a3
{
}

- (CADisplayLink)displayLink
{
  return self->_displayLink;
}

- (void)setLinkFired:(id)a3
{
}

- (id)linkFired
{
  return self->_linkFired;
}

- (double)runningTime
{
  v3 = [(AVDisplayLink *)self displayLink];
  if (v3)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    [(AVDisplayLink *)self startTime];
    double v6 = Current - v5;
  }
  else
  {
    double v6 = 0.0;
  }

  return v6;
}

- (void)linkFired:(id)a3
{
  id v6 = [(AVDisplayLink *)self observer];
  v4 = [(AVDisplayLink *)self linkFired];

  if (v4 && v6)
  {
    double v5 = [(AVDisplayLink *)self linkFired];
    ((void (**)(void, id, AVDisplayLink *))v5)[2](v5, v6, self);
  }
  else
  {
    [(AVDisplayLink *)self invalidate];
  }
}

- (void)invalidate
{
  v3 = [(AVDisplayLink *)self displayLink];
  [v3 invalidate];

  [(AVDisplayLink *)self setDisplayLink:0];

  [(AVDisplayLink *)self setLinkFired:0];
}

- (void)startDisplayLinkUpdatesForObserver:(id)a3 framesPerSecond:(int64_t)a4 usingBlock:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  [(AVDisplayLink *)self invalidate];
  [(AVDisplayLink *)self setObserver:v9];

  [(AVDisplayLink *)self setLinkFired:v8];
  v10 = [MEMORY[0x1E4F39B68] displayLinkWithTarget:self selector:sel_linkFired_];
  [(AVDisplayLink *)self setDisplayLink:v10];

  v11 = [(AVDisplayLink *)self displayLink];
  [v11 setPreferredFramesPerSecond:a4];

  [(AVDisplayLink *)self setStartTime:CFAbsoluteTimeGetCurrent()];
  id v13 = [(AVDisplayLink *)self displayLink];
  v12 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
  [v13 addToRunLoop:v12 forMode:*MEMORY[0x1E4F1C4B0]];
}

@end