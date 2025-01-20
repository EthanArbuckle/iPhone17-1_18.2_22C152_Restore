@interface AVHapticParameterCurveValue
- (double)time;
- (float)value;
- (void)setTime:(double)a3;
- (void)setValue:(float)a3;
@end

@implementation AVHapticParameterCurveValue

- (double)time
{
  return self->_time;
}

- (void)setTime:(double)a3
{
  self->_time = a3;
}

- (float)value
{
  return self->_value;
}

- (void)setValue:(float)a3
{
  self->_value = a3;
}

@end