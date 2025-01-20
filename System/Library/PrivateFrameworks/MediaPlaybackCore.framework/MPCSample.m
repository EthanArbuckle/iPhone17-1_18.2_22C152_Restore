@interface MPCSample
- (MPCSample)initWithLevel:(double)a3 time:(double)a4 state:(int64_t)a5;
- (double)level;
- (double)time;
- (int)number;
- (int)thermalLevel;
- (int64_t)state;
- (void)setThermalLevel:(int)a3;
@end

@implementation MPCSample

- (int)thermalLevel
{
  return self->_thermalLevel;
}

- (int64_t)state
{
  return self->_state;
}

- (double)time
{
  return self->_time;
}

- (double)level
{
  return self->_level;
}

- (int)number
{
  return self->_number;
}

- (void)setThermalLevel:(int)a3
{
  self->_thermalLevel = a3;
}

- (MPCSample)initWithLevel:(double)a3 time:(double)a4 state:(int64_t)a5
{
  v10.receiver = self;
  v10.super_class = (Class)MPCSample;
  result = [(MPCSample *)&v10 init];
  int v9 = initWithLevel_time_state__number;
  if (result)
  {
    result->_level = a3;
    result->_time = a4;
    result->_number = v9;
    result->_state = a5;
  }
  initWithLevel_time_state__number = v9 + 1;
  return result;
}

@end