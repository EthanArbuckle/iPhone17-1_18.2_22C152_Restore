@interface GKLimitedPresentationConfig
- (BOOL)enabled;
- (GKLimitedPresentationConfig)init;
- (double)minTimeBetweenAppearances;
- (double)resetPeriod;
- (int64_t)initialLimit;
- (int64_t)limit;
- (void)setEnabled:(BOOL)a3;
- (void)setInitialLimit:(int64_t)a3;
- (void)setLimit:(int64_t)a3;
- (void)setMinTimeBetweenAppearances:(double)a3;
- (void)setResetPeriod:(double)a3;
@end

@implementation GKLimitedPresentationConfig

- (GKLimitedPresentationConfig)init
{
  v3.receiver = self;
  v3.super_class = (Class)GKLimitedPresentationConfig;
  result = [(GKLimitedPresentationConfig *)&v3 init];
  if (result)
  {
    result->_limit = -1;
    result->_initialLimit = -1;
    *(_OWORD *)&result->_resetPeriod = xmmword_1C2EBD030;
    result->_enabled = 1;
  }
  return result;
}

- (int64_t)initialLimit
{
  if (self->_initialLimit < 0) {
    return [(GKLimitedPresentationConfig *)self limit];
  }
  else {
    return self->_initialLimit;
  }
}

- (int64_t)limit
{
  return self->_limit;
}

- (void)setLimit:(int64_t)a3
{
  self->_limit = a3;
}

- (void)setInitialLimit:(int64_t)a3
{
  self->_initialLimit = a3;
}

- (double)resetPeriod
{
  return self->_resetPeriod;
}

- (void)setResetPeriod:(double)a3
{
  self->_resetPeriod = a3;
}

- (double)minTimeBetweenAppearances
{
  return self->_minTimeBetweenAppearances;
}

- (void)setMinTimeBetweenAppearances:(double)a3
{
  self->_minTimeBetweenAppearances = a3;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

@end