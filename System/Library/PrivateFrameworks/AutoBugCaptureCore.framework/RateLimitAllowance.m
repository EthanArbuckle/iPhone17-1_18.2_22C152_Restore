@interface RateLimitAllowance
- (NSDate)lastCheckedAt;
- (double)allowance;
- (void)setAllowance:(double)a3;
- (void)setLastCheckedAt:(id)a3;
@end

@implementation RateLimitAllowance

- (NSDate)lastCheckedAt
{
  return self->_lastCheckedAt;
}

- (void)setLastCheckedAt:(id)a3
{
}

- (double)allowance
{
  return self->_allowance;
}

- (void)setAllowance:(double)a3
{
  self->_allowance = a3;
}

- (void).cxx_destruct
{
}

@end