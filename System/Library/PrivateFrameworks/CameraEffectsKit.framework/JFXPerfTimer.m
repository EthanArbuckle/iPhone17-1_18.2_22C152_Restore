@interface JFXPerfTimer
- (JFXPerfTimer)init;
- (double)elapsedTime;
- (double)elapsedTimeMS;
- (double)end;
- (void)start;
@end

@implementation JFXPerfTimer

- (JFXPerfTimer)init
{
  v5.receiver = self;
  v5.super_class = (Class)JFXPerfTimer;
  v2 = [(JFXPerfTimer *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_start = 0.0;
    v2->_end = 0.0;
    [(JFXPerfTimer *)v2 start];
  }
  return v3;
}

- (void)start
{
  self->_start = JTGetHostTime();
}

- (double)end
{
  self->_end = JTGetHostTime();
  [(JFXPerfTimer *)self elapsedTimeMS];
  return result;
}

- (double)elapsedTime
{
  return self->_end - self->_start;
}

- (double)elapsedTimeMS
{
  [(JFXPerfTimer *)self elapsedTime];
  return v2 * 1000.0;
}

@end