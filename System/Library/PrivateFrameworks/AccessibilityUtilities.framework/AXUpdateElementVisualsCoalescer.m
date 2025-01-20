@interface AXUpdateElementVisualsCoalescer
- (AXUpdateElementVisualsCoalescer)init;
- (NSTimer)timer;
- (double)lastProgressTime;
- (double)progressInterval;
- (double)threshold;
- (id)updateVisualsSequenceDidBeginHandler;
- (id)updateVisualsSequenceDidFinishHandler;
- (id)updateVisualsSequenceInProgressHandler;
- (void)_timerDidFire:(id)a3;
- (void)dealloc;
- (void)notifyUpdateElementVisualsEventDidOccur;
- (void)setLastProgressTime:(double)a3;
- (void)setProgressInterval:(double)a3;
- (void)setThreshold:(double)a3;
- (void)setTimer:(id)a3;
- (void)setUpdateVisualsSequenceDidBeginHandler:(id)a3;
- (void)setUpdateVisualsSequenceDidFinishHandler:(id)a3;
- (void)setUpdateVisualsSequenceInProgressHandler:(id)a3;
@end

@implementation AXUpdateElementVisualsCoalescer

- (AXUpdateElementVisualsCoalescer)init
{
  v3.receiver = self;
  v3.super_class = (Class)AXUpdateElementVisualsCoalescer;
  result = [(AXUpdateElementVisualsCoalescer *)&v3 init];
  if (result)
  {
    *(_OWORD *)&result->_threshold = xmmword_18D4309C0;
    result->_lastProgressTime = -1.0;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3 = [(AXUpdateElementVisualsCoalescer *)self timer];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)AXUpdateElementVisualsCoalescer;
  [(AXUpdateElementVisualsCoalescer *)&v4 dealloc];
}

- (void)notifyUpdateElementVisualsEventDidOccur
{
  objc_super v3 = [(AXUpdateElementVisualsCoalescer *)self timer];

  if (v3)
  {
    objc_super v4 = [(AXUpdateElementVisualsCoalescer *)self timer];
    [v4 invalidate];

    [(AXUpdateElementVisualsCoalescer *)self setTimer:0];
  }
  else
  {
    v5 = [(AXUpdateElementVisualsCoalescer *)self updateVisualsSequenceDidBeginHandler];

    if (v5)
    {
      v6 = [(AXUpdateElementVisualsCoalescer *)self updateVisualsSequenceDidBeginHandler];
      v6[2]();
    }
  }
  v7 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__timerDidFire_ selector:0 userInfo:0 repeats:self->_threshold];
  [(AXUpdateElementVisualsCoalescer *)self setTimer:v7];

  v8 = [(AXUpdateElementVisualsCoalescer *)self updateVisualsSequenceInProgressHandler];
  if (v8)
  {
    double progressInterval = self->_progressInterval;

    if (progressInterval > 0.0)
    {
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      double v11 = v10;
      double lastProgressTime = self->_lastProgressTime;
      if (lastProgressTime > 0.0)
      {
        if (v11 - lastProgressTime <= self->_progressInterval) {
          return;
        }
        v13 = [(AXUpdateElementVisualsCoalescer *)self updateVisualsSequenceInProgressHandler];
        v13[2]();
      }
      self->_double lastProgressTime = v11;
    }
  }
}

- (void)_timerDidFire:(id)a3
{
  objc_super v4 = [(AXUpdateElementVisualsCoalescer *)self updateVisualsSequenceDidFinishHandler];

  if (v4)
  {
    v5 = [(AXUpdateElementVisualsCoalescer *)self updateVisualsSequenceDidFinishHandler];
    v5[2]();
  }
  v6 = [(AXUpdateElementVisualsCoalescer *)self timer];
  [v6 invalidate];

  [(AXUpdateElementVisualsCoalescer *)self setTimer:0];
}

- (double)threshold
{
  return self->_threshold;
}

- (void)setThreshold:(double)a3
{
  self->_threshold = a3;
}

- (double)progressInterval
{
  return self->_progressInterval;
}

- (void)setProgressInterval:(double)a3
{
  self->_double progressInterval = a3;
}

- (id)updateVisualsSequenceDidBeginHandler
{
  return self->_updateVisualsSequenceDidBeginHandler;
}

- (void)setUpdateVisualsSequenceDidBeginHandler:(id)a3
{
}

- (id)updateVisualsSequenceDidFinishHandler
{
  return self->_updateVisualsSequenceDidFinishHandler;
}

- (void)setUpdateVisualsSequenceDidFinishHandler:(id)a3
{
}

- (id)updateVisualsSequenceInProgressHandler
{
  return self->_updateVisualsSequenceInProgressHandler;
}

- (void)setUpdateVisualsSequenceInProgressHandler:(id)a3
{
}

- (NSTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (double)lastProgressTime
{
  return self->_lastProgressTime;
}

- (void)setLastProgressTime:(double)a3
{
  self->_double lastProgressTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong(&self->_updateVisualsSequenceInProgressHandler, 0);
  objc_storeStrong(&self->_updateVisualsSequenceDidFinishHandler, 0);

  objc_storeStrong(&self->_updateVisualsSequenceDidBeginHandler, 0);
}

@end