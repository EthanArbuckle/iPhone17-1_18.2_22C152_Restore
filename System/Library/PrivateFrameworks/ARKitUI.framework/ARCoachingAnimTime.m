@interface ARCoachingAnimTime
- (ARCoachingAnimTime)init;
- (double)absoluteTime;
- (double)delta;
- (double)deltaPercentage;
- (double)duration;
- (double)oscillatingTime;
- (double)startTime;
- (void)setAbsoluteTime:(double)a3;
- (void)setDuration:(double)a3;
- (void)setStartTime:(double)a3;
@end

@implementation ARCoachingAnimTime

- (double)absoluteTime
{
  return self->_absoluteTime;
}

- (void)setAbsoluteTime:(double)a3
{
  self->_absoluteTime = a3;
  [(ARCoachingAnimTime *)self startTime];
  double v6 = a3 - v5;
  self->_delta = a3 - v5;
  [(ARCoachingAnimTime *)self duration];
  self->_deltaPercentage = fmin(fmax(v6 / v7, 0.0), 1.0);
  *(float *)&double v7 = a3 * 5.0;
  self->_oscillatingTime = sinf(*(float *)&v7) * 0.5 + 0.5;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  [(ARCoachingAnimTime *)self absoluteTime];
  if (v5 > a3) {
    -[ARCoachingAnimTime setStartTime:]();
  }
  self->_startTime = a3;
}

- (double)oscillatingTime
{
  return self->_oscillatingTime;
}

- (double)delta
{
  return self->_delta;
}

- (double)deltaPercentage
{
  return self->_deltaPercentage;
}

- (ARCoachingAnimTime)init
{
  v5.receiver = self;
  v5.super_class = (Class)ARCoachingAnimTime;
  v2 = [(ARCoachingAnimTime *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(ARCoachingAnimTime *)v2 setDuration:1.0];
    v3->_deltaPercentage = 0.0;
    *(_OWORD *)&v3->_oscillatingTime = 0u;
    *(_OWORD *)&v3->_absoluteTime = 0u;
  }
  return v3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (void)setStartTime:.cold.1()
{
  __assert_rtn("-[ARCoachingAnimTime setStartTime:]", "ARCoachingGlyphRenderSupport.mm", 226, "startTime >= self.absoluteTime");
}

@end