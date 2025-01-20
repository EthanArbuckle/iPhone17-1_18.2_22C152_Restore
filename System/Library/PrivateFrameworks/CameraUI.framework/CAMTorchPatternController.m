@interface CAMTorchPatternController
- (BOOL)_isPerforming;
- (CADisplayLink)_displayLink;
- (CAMTorchPattern)_currentPattern;
- (CAMTorchPatternController)initWithCaptureController:(id)a3;
- (CUCaptureController)_captureController;
- (double)_startTime;
- (double)stepInterval;
- (void)_applyTorchLevel:(float)a3;
- (void)_resetTorchLevel;
- (void)_setPerforming:(BOOL)a3;
- (void)blink;
- (void)displayLinkFired:(id)a3;
- (void)doubleBlink;
- (void)setStepInterval:(double)a3;
- (void)startPerformingPattern:(id)a3;
- (void)stopPerformingPattern;
@end

@implementation CAMTorchPatternController

- (CAMTorchPatternController)initWithCaptureController:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CAMTorchPatternController;
  v6 = [(CAMTorchPatternController *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->__captureController, a3);
    v8 = v7;
  }

  return v7;
}

- (void)startPerformingPattern:(id)a3
{
  id v5 = a3;
  if (![(CAMTorchPatternController *)self _isPerforming])
  {
    objc_storeStrong((id *)&self->__currentPattern, a3);
    self->__startTime = CACurrentMediaTime();
    -[CAMTorchPattern setStartTime:](self->__currentPattern, "setStartTime:");
    [(CAMTorchPatternController *)self _setPerforming:1];
  }
}

- (void)stopPerformingPattern
{
  if ([(CAMTorchPatternController *)self _isPerforming])
  {
    [(CAMTorchPatternController *)self _resetTorchLevel];
    currentPattern = self->__currentPattern;
    self->__currentPattern = 0;

    [(CAMTorchPatternController *)self _setPerforming:0];
  }
}

- (void)_resetTorchLevel
{
  id v2 = [(CAMTorchPatternController *)self _captureController];
  [v2 changeToTorchMode:0];
}

- (void)_applyTorchLevel:(float)a3
{
  if (a3 >= 0.01)
  {
    id v5 = [(CAMTorchPatternController *)self _captureController];
    *(float *)&double v4 = a3;
    [v5 changeToTorchLevel:v4];
  }
  else
  {
    [(CAMTorchPatternController *)self _resetTorchLevel];
  }
}

- (void)blink
{
  [(CAMTorchPatternController *)self _setPerforming:1];
  v3 = [[CAMTorchPattern alloc] initWithType:2];
  currentPattern = self->__currentPattern;
  self->__currentPattern = v3;

  self->__startTime = CACurrentMediaTime();
  id v5 = self->__currentPattern;
  -[CAMTorchPattern setStartTime:](v5, "setStartTime:");
}

- (void)doubleBlink
{
  [(CAMTorchPatternController *)self _setPerforming:1];
  v3 = [[CAMTorchPattern alloc] initWithType:3];
  currentPattern = self->__currentPattern;
  self->__currentPattern = v3;

  self->__startTime = CACurrentMediaTime();
  id v5 = self->__currentPattern;
  -[CAMTorchPattern setStartTime:](v5, "setStartTime:");
}

- (void)_setPerforming:(BOOL)a3
{
  if (self->__performing != a3)
  {
    self->__performing = a3;
    if (a3)
    {
      double v4 = [MEMORY[0x263F15780] displayLinkWithTarget:self selector:sel_displayLinkFired_];
      displayLink = self->__displayLink;
      self->__displayLink = v4;

      v6 = self->__displayLink;
      v7 = [MEMORY[0x263EFF9F0] mainRunLoop];
      [(CADisplayLink *)v6 addToRunLoop:v7 forMode:*MEMORY[0x263EFF588]];

      v8 = self->__displayLink;
      [(CADisplayLink *)v8 setPaused:0];
    }
    else
    {
      [(CADisplayLink *)self->__displayLink setPaused:1];
      [(CADisplayLink *)self->__displayLink invalidate];
      v9 = self->__displayLink;
      self->__displayLink = 0;
    }
  }
}

- (void)displayLinkFired:(id)a3
{
  [(CAMTorchPattern *)self->__currentPattern updateAtTime:CACurrentMediaTime() - self->__startTime];
  [(CAMTorchPattern *)self->__currentPattern torchLevel];
  -[CAMTorchPatternController _applyTorchLevel:](self, "_applyTorchLevel:");
}

- (double)stepInterval
{
  return self->_stepInterval;
}

- (void)setStepInterval:(double)a3
{
  self->_stepInterval = a3;
}

- (CUCaptureController)_captureController
{
  return self->__captureController;
}

- (BOOL)_isPerforming
{
  return self->__performing;
}

- (CAMTorchPattern)_currentPattern
{
  return self->__currentPattern;
}

- (double)_startTime
{
  return self->__startTime;
}

- (CADisplayLink)_displayLink
{
  return self->__displayLink;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__displayLink, 0);
  objc_storeStrong((id *)&self->__currentPattern, 0);
  objc_storeStrong((id *)&self->__captureController, 0);
}

@end