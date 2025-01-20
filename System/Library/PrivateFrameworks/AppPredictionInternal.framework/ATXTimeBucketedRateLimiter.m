@interface ATXTimeBucketedRateLimiter
- (ATXTimeBucketedRateLimiter)initWithMaxCount:(unint64_t)a3 perPeriod:(double)a4;
- (BOOL)tryToIncrementCountAndReturnSuccess;
- (NSDate)now;
- (void)_resetBucketIfNeeded;
- (void)setNow:(id)a3;
@end

@implementation ATXTimeBucketedRateLimiter

- (BOOL)tryToIncrementCountAndReturnSuccess
{
  v2 = self;
  objc_sync_enter(v2);
  [(ATXTimeBucketedRateLimiter *)v2 _resetBucketIfNeeded];
  unint64_t countForCurrentBucket = v2->_countForCurrentBucket;
  unint64_t maxCount = v2->_maxCount;
  if (countForCurrentBucket != maxCount) {
    v2->_unint64_t countForCurrentBucket = countForCurrentBucket + 1;
  }
  BOOL v5 = countForCurrentBucket != maxCount;
  objc_sync_exit(v2);

  return v5;
}

- (void)_resetBucketIfNeeded
{
  endOfCurrentBucket = self->_endOfCurrentBucket;
  v4 = [(ATXTimeBucketedRateLimiter *)self now];
  BOOL v5 = [(NSDate *)endOfCurrentBucket earlierDate:v4];
  v6 = self->_endOfCurrentBucket;

  if (v5 == v6)
  {
    self->_unint64_t countForCurrentBucket = 0;
    id v9 = [(ATXTimeBucketedRateLimiter *)self now];
    v7 = [v9 dateByAddingTimeInterval:self->_period];
    v8 = self->_endOfCurrentBucket;
    self->_endOfCurrentBucket = v7;
  }
}

- (NSDate)now
{
  now = self->_now;
  if (now) {
    v3 = now;
  }
  else {
    v3 = (NSDate *)objc_opt_new();
  }
  return v3;
}

- (ATXTimeBucketedRateLimiter)initWithMaxCount:(unint64_t)a3 perPeriod:(double)a4
{
  v11.receiver = self;
  v11.super_class = (Class)ATXTimeBucketedRateLimiter;
  v6 = [(ATXTimeBucketedRateLimiter *)&v11 init];
  v7 = v6;
  if (v6)
  {
    v6->_unint64_t maxCount = a3;
    v6->_period = a4;
    v6->_unint64_t countForCurrentBucket = 0;
    uint64_t v8 = [MEMORY[0x1E4F1C9C8] distantPast];
    endOfCurrentBucket = v7->_endOfCurrentBucket;
    v7->_endOfCurrentBucket = (NSDate *)v8;
  }
  return v7;
}

- (void)setNow:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_now, 0);
  objc_storeStrong((id *)&self->_endOfCurrentBucket, 0);
}

@end