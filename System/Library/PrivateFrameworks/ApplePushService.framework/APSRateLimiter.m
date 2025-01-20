@interface APSRateLimiter
- (APSRateLimiter)initWithLimit:(int64_t)a3 timeLimit:(double)a4;
- (BOOL)_checkIsExpired;
- (BOOL)isUnderLimit;
- (BOOL)isUnset;
- (double)startInterval;
- (double)timeLimit;
- (id)description;
- (int64_t)limit;
- (int64_t)notedCount;
- (void)clear;
- (void)note;
- (void)setLimit:(int64_t)a3;
- (void)setNotedCount:(int64_t)a3;
- (void)setStartInterval:(double)a3;
- (void)setTimeLimit:(double)a3;
@end

@implementation APSRateLimiter

- (APSRateLimiter)initWithLimit:(int64_t)a3 timeLimit:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)APSRateLimiter;
  result = [(APSRateLimiter *)&v7 init];
  if (result)
  {
    result->_limit = a3;
    result->_timeLimit = a4;
  }
  return result;
}

- (BOOL)_checkIsExpired
{
  +[NSDate timeIntervalSinceReferenceDate];
  double v4 = v3 - self->_startInterval;
  [(APSRateLimiter *)self timeLimit];
  if (v4 > v5)
  {
    self->_startInterval = -1.0;
    self->_notedCount = 0;
  }
  return v4 > v5;
}

- (void)note
{
  if ([(APSRateLimiter *)self _checkIsExpired] || self->_startInterval == -1.0)
  {
    +[NSDate timeIntervalSinceReferenceDate];
    self->_startInterval = v3;
  }
  ++self->_notedCount;
}

- (BOOL)isUnderLimit
{
  BOOL result = [(APSRateLimiter *)self _checkIsExpired];
  if (self->_notedCount < self->_limit) {
    return 1;
  }
  return result;
}

- (void)clear
{
  self->_startInterval = -1.0;
  self->_notedCount = 0;
}

- (BOOL)isUnset
{
  if (self->_notedCount) {
    return [(APSRateLimiter *)self _checkIsExpired];
  }
  else {
    return 1;
  }
}

- (id)description
{
  if (self->_startInterval == -1.0)
  {
    double v4 = 0.0;
  }
  else
  {
    +[NSDate timeIntervalSinceReferenceDate];
    double v4 = v3 - self->_startInterval;
  }
  return +[NSString stringWithFormat:@"<%@: %p> limit: %ld timeLimit: %f notedCount: %ld timeSinceStartInterval: %f", objc_opt_class(), self, self->_limit, *(void *)&self->_timeLimit, self->_notedCount, *(void *)&v4];
}

- (int64_t)limit
{
  return self->_limit;
}

- (void)setLimit:(int64_t)a3
{
  self->_limit = a3;
}

- (double)timeLimit
{
  return self->_timeLimit;
}

- (void)setTimeLimit:(double)a3
{
  self->_timeLimit = a3;
}

- (double)startInterval
{
  return self->_startInterval;
}

- (void)setStartInterval:(double)a3
{
  self->_startInterval = a3;
}

- (int64_t)notedCount
{
  return self->_notedCount;
}

- (void)setNotedCount:(int64_t)a3
{
  self->_notedCount = a3;
}

@end