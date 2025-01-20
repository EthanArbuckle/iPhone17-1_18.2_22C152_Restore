@interface _IMTimingInstance
+ (id)createTimingInstanceWithStartTime:(float)a3;
- (BOOL)isRunning;
- (_IMTimingInstance)init;
- (double)totalTime;
- (id)description;
- (void)setIsRunning:(BOOL)a3;
- (void)setTotalTime:(double)a3;
- (void)startUsingTime:(double)a3;
- (void)stopUsingTime:(double)a3;
@end

@implementation _IMTimingInstance

- (void)startUsingTime:(double)a3
{
  self->_startTiming = a3;
  self->_stopTiming = a3;
  self->_isRunning = 1;
}

- (void)stopUsingTime:(double)a3
{
  if (self->_isRunning)
  {
    double v3 = self->_totalTime + a3 - self->_startTiming;
    self->_stopTiming = a3;
    self->_totalTime = v3;
  }
  self->_isRunning = 0;
}

+ (id)createTimingInstanceWithStartTime:(float)a3
{
  v4 = objc_alloc_init(_IMTimingInstance);
  if (v4)
  {
    v4->_startTiming = a3;
    v4->_stopTiming = a3;
    v4->_totalTime = 0.0;
    v4->_isRunning = 0;
  }
  return v4;
}

- (_IMTimingInstance)init
{
  v3.receiver = self;
  v3.super_class = (Class)_IMTimingInstance;
  result = [(_IMTimingInstance *)&v3 init];
  if (result)
  {
    result->_startTiming = 0.0;
    result->_stopTiming = 0.0;
    result->_isRunning = 0;
    result->_totalTime = 0.0;
  }
  return result;
}

- (id)description
{
  return (id)objc_msgSend_stringWithFormat_(NSString, a2, @"%f (%f)", v2, self->_stopTiming - self->_startTiming, *(void *)&self->_totalTime);
}

- (double)totalTime
{
  return self->_totalTime;
}

- (void)setTotalTime:(double)a3
{
  self->_totalTime = a3;
}

- (BOOL)isRunning
{
  return self->_isRunning;
}

- (void)setIsRunning:(BOOL)a3
{
  self->_isRunning = a3;
}

@end