@interface AMSMediaTokenServiceThrottler
- (AMSMediaTokenServiceThrottler)initWithBaseSleepInterval:(double)a3 maxSleepInterval:(double)a4;
- (BOOL)shouldThrottle;
- (NSDate)throttleDate;
- (double)_calculateThrottleInterval;
- (double)baseSleepInterval;
- (double)maxSleepInterval;
- (unint64_t)attemptNumber;
- (void)reset;
- (void)setAttemptNumber:(unint64_t)a3;
- (void)setBaseSleepInterval:(double)a3;
- (void)setMaxSleepInterval:(double)a3;
- (void)setThrottleDate:(id)a3;
- (void)throttle;
@end

@implementation AMSMediaTokenServiceThrottler

- (void)setMaxSleepInterval:(double)a3
{
  self->_maxSleepInterval = a3;
}

- (void)setBaseSleepInterval:(double)a3
{
  self->_baseSleepInterval = a3;
}

- (AMSMediaTokenServiceThrottler)initWithBaseSleepInterval:(double)a3 maxSleepInterval:(double)a4
{
  v9.receiver = self;
  v9.super_class = (Class)AMSMediaTokenServiceThrottler;
  v6 = [(AMSMediaTokenServiceThrottler *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_baseSleepInterval = a3;
    v6->_maxSleepInterval = a4;
    [(AMSMediaTokenServiceThrottler *)v6 reset];
  }
  return v7;
}

- (void)setAttemptNumber:(unint64_t)a3
{
  self->_attemptNumber = a3;
}

- (void)reset
{
  [(AMSMediaTokenServiceThrottler *)self setThrottleDate:0];
  [(AMSMediaTokenServiceThrottler *)self setAttemptNumber:0];
}

- (void)setThrottleDate:(id)a3
{
}

- (void).cxx_destruct
{
}

- (BOOL)shouldThrottle
{
  v2 = [(AMSMediaTokenServiceThrottler *)self throttleDate];
  [v2 timeIntervalSinceNow];
  BOOL v4 = v3 > 0.0;

  return v4;
}

- (void)throttle
{
  [(AMSMediaTokenServiceThrottler *)self _calculateThrottleInterval];
  BOOL v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:v3];
  [(AMSMediaTokenServiceThrottler *)self setThrottleDate:v4];

  unint64_t v5 = [(AMSMediaTokenServiceThrottler *)self attemptNumber] + 1;
  [(AMSMediaTokenServiceThrottler *)self setAttemptNumber:v5];
}

- (double)_calculateThrottleInterval
{
  double v3 = (double)[(AMSMediaTokenServiceThrottler *)self attemptNumber];
  [(AMSMediaTokenServiceThrottler *)self baseSleepInterval];
  double v5 = exp2(v4 * v3);
  [(AMSMediaTokenServiceThrottler *)self maxSleepInterval];
  if (v5 < v6) {
    double v6 = v5;
  }
  return (double)arc4random_uniform(v6);
}

- (double)baseSleepInterval
{
  return self->_baseSleepInterval;
}

- (double)maxSleepInterval
{
  return self->_maxSleepInterval;
}

- (unint64_t)attemptNumber
{
  return self->_attemptNumber;
}

- (NSDate)throttleDate
{
  return self->_throttleDate;
}

@end