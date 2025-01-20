@interface ASVDeceleration
- (ASVDeceleration)initWithVelocity:(float)a3 minEndDelta:(float)a4;
- (BOOL)isDecelerating;
- (double)currentTime;
- (double)previousTime;
- (double)startTime;
- (float)decelerationDelta;
- (float)minEndDelta;
- (float)velocity;
- (int64_t)frameCount;
- (void)setCurrentTime:(double)a3;
- (void)setFrameCount:(int64_t)a3;
- (void)setIsDecelerating:(BOOL)a3;
- (void)setMinEndDelta:(float)a3;
- (void)setPreviousTime:(double)a3;
- (void)setStartTime:(double)a3;
- (void)setVelocity:(float)a3;
@end

@implementation ASVDeceleration

- (ASVDeceleration)initWithVelocity:(float)a3 minEndDelta:(float)a4
{
  v10.receiver = self;
  v10.super_class = (Class)ASVDeceleration;
  v6 = [(ASVDeceleration *)&v10 init];
  v7 = v6;
  if (v6)
  {
    v6->_velocity = a3;
    v6->_minEndDelta = a4;
    CFTimeInterval v8 = CACurrentMediaTime();
    v7->_startTime = v8;
    v7->_currentTime = v8;
    v7->_previousTime = -1.0;
    v7->_frameCount = -1;
    v7->_isDecelerating = 1;
  }
  return v7;
}

- (float)decelerationDelta
{
  return 0.0;
}

- (float)velocity
{
  return self->_velocity;
}

- (void)setVelocity:(float)a3
{
  self->_velocity = a3;
}

- (float)minEndDelta
{
  return self->_minEndDelta;
}

- (void)setMinEndDelta:(float)a3
{
  self->_minEndDelta = a3;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (double)currentTime
{
  return self->_currentTime;
}

- (void)setCurrentTime:(double)a3
{
  self->_currentTime = a3;
}

- (double)previousTime
{
  return self->_previousTime;
}

- (void)setPreviousTime:(double)a3
{
  self->_previousTime = a3;
}

- (int64_t)frameCount
{
  return self->_frameCount;
}

- (void)setFrameCount:(int64_t)a3
{
  self->_frameCount = a3;
}

- (BOOL)isDecelerating
{
  return self->_isDecelerating;
}

- (void)setIsDecelerating:(BOOL)a3
{
  self->_isDecelerating = a3;
}

@end