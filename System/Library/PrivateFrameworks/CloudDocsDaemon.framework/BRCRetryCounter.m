@interface BRCRetryCounter
- (BRCRetryCounter)initWithThrottleHash:(int64_t)a3;
- (int64_t)latestRetry;
- (int64_t)throttleHash;
- (unsigned)retryCount;
- (void)incrementRetry;
- (void)schedule;
@end

@implementation BRCRetryCounter

- (BRCRetryCounter)initWithThrottleHash:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BRCRetryCounter;
  v4 = [(BRCRetryCounter *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_throttleHash = a3;
    [(BRCRetryCounter *)v4 incrementRetry];
  }
  return v5;
}

- (void)schedule
{
  self->_scheduled = 1;
}

- (void)incrementRetry
{
  self->_latestRetry = brc_current_date_nsec();
  self->_scheduled = 0;
}

- (unsigned)retryCount
{
  return self->_retryCount;
}

- (int64_t)latestRetry
{
  return self->_latestRetry;
}

- (int64_t)throttleHash
{
  return self->_throttleHash;
}

@end