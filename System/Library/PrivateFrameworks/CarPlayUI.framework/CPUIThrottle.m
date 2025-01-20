@interface CPUIThrottle
- (BOOL)incrementAttempts;
- (BOOL)isThrottled;
- (CPUIThrottle)initWithBase:(double)a3;
- (CPUIThrottle)initWithBase:(double)a3 factor:(double)a4 max:(double)a5;
- (NSDate)throttleDate;
- (NSDate)unthrottleDate;
- (double)base;
- (double)factor;
- (double)max;
- (unint64_t)attempts;
- (void)unthrottle;
@end

@implementation CPUIThrottle

- (CPUIThrottle)initWithBase:(double)a3
{
  return [(CPUIThrottle *)self initWithBase:a3 factor:2.0 max:a3 * 10.0];
}

- (CPUIThrottle)initWithBase:(double)a3 factor:(double)a4 max:(double)a5
{
  v9.receiver = self;
  v9.super_class = (Class)CPUIThrottle;
  result = [(CPUIThrottle *)&v9 init];
  if (result)
  {
    result->_base = a3;
    result->_factor = a4;
    result->_max = a5;
    result->_attempts = 0;
  }
  return result;
}

- (BOOL)isThrottled
{
  v3 = [(CPUIThrottle *)self unthrottleDate];

  if (!v3) {
    return 0;
  }
  v4 = [MEMORY[0x263EFF910] date];
  v5 = [(CPUIThrottle *)self unthrottleDate];
  BOOL v6 = [v4 compare:v5] == -1;

  return v6;
}

- (void)unthrottle
{
  throttleDate = self->_throttleDate;
  self->_throttleDate = 0;
  self->_attempts = 0;

  unthrottleDate = self->_unthrottleDate;
  self->_unthrottleDate = 0;
}

- (BOOL)incrementAttempts
{
  unint64_t v3 = self->_attempts + 1;
  self->_attempts = v3;
  double base = self->_base;
  double v5 = base * pow(self->_factor, (double)v3);
  if (v5 >= base)
  {
    double base = v5;
    if (v5 > self->_max) {
      double base = self->_max;
    }
  }
  BOOL v6 = [(CPUIThrottle *)self isThrottled];
  if (!v6)
  {
    self->_attempts = 1;
    v7 = [MEMORY[0x263EFF910] date];
    throttleDate = self->_throttleDate;
    self->_throttleDate = v7;
  }
  objc_super v9 = [(NSDate *)self->_throttleDate dateByAddingTimeInterval:base];
  unthrottleDate = self->_unthrottleDate;
  self->_unthrottleDate = v9;

  return !v6;
}

- (NSDate)unthrottleDate
{
  return self->_unthrottleDate;
}

- (NSDate)throttleDate
{
  return self->_throttleDate;
}

- (unint64_t)attempts
{
  return self->_attempts;
}

- (double)base
{
  return self->_base;
}

- (double)factor
{
  return self->_factor;
}

- (double)max
{
  return self->_max;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_throttleDate, 0);
  objc_storeStrong((id *)&self->_unthrottleDate, 0);
}

@end