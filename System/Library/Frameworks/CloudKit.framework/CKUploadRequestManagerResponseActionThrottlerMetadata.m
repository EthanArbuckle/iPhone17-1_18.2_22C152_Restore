@interface CKUploadRequestManagerResponseActionThrottlerMetadata
- (double)lastRunTime;
- (int64_t)repeatCount;
- (unint64_t)totalThrottleCount;
- (void)setLastRunTime:(double)a3;
- (void)setRepeatCount:(int64_t)a3;
- (void)setTotalThrottleCount:(unint64_t)a3;
@end

@implementation CKUploadRequestManagerResponseActionThrottlerMetadata

- (double)lastRunTime
{
  return self->_lastRunTime;
}

- (void)setLastRunTime:(double)a3
{
  self->_lastRunTime = a3;
}

- (int64_t)repeatCount
{
  return self->_repeatCount;
}

- (void)setRepeatCount:(int64_t)a3
{
  self->_repeatCount = a3;
}

- (unint64_t)totalThrottleCount
{
  return self->_totalThrottleCount;
}

- (void)setTotalThrottleCount:(unint64_t)a3
{
  self->_totalThrottleCount = a3;
}

@end