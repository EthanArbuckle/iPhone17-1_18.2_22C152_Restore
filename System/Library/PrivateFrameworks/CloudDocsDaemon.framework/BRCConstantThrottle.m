@interface BRCConstantThrottle
- (BRCConstantThrottle)initWithName:(id)a3 andRetryBackoff:(double)a4;
- (int64_t)nsecsToNextRetry:(int64_t)a3 now:(int64_t)a4 increment:(BOOL)a5;
- (int64_t)nsecsToNextRetry:(int64_t)a3 retryCount:(unsigned int *)a4 now:(int64_t)a5;
@end

@implementation BRCConstantThrottle

- (BRCConstantThrottle)initWithName:(id)a3 andRetryBackoff:(double)a4
{
  v6.receiver = self;
  v6.super_class = (Class)BRCConstantThrottle;
  v4 = [(BRCThrottleBase *)&v6 _initWithName:a3];
  if (v4) {
    v4->_retryBackoff = brc_interval_to_nsec();
  }
  return v4;
}

- (int64_t)nsecsToNextRetry:(int64_t)a3 now:(int64_t)a4 increment:(BOOL)a5
{
  return self->_retryBackoff;
}

- (int64_t)nsecsToNextRetry:(int64_t)a3 retryCount:(unsigned int *)a4 now:(int64_t)a5
{
  return self->_retryBackoff;
}

@end