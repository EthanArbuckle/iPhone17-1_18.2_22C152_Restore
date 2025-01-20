@interface CHHapticParameterCurveControlPoint
- (CHHapticParameterCurveControlPoint)init;
- (CHHapticParameterCurveControlPoint)initWithRelativeTime:(NSTimeInterval)time value:(float)value;
- (NSTimeInterval)relativeTime;
- (float)value;
- (void)setRelativeTime:(NSTimeInterval)relativeTime;
- (void)setValue:(float)value;
@end

@implementation CHHapticParameterCurveControlPoint

- (CHHapticParameterCurveControlPoint)init
{
  return 0;
}

- (CHHapticParameterCurveControlPoint)initWithRelativeTime:(NSTimeInterval)time value:(float)value
{
  v7.receiver = self;
  v7.super_class = (Class)CHHapticParameterCurveControlPoint;
  result = [(CHHapticParameterCurveControlPoint *)&v7 init];
  if (result)
  {
    result->_time = time;
    result->_value = value;
  }
  return result;
}

- (NSTimeInterval)relativeTime
{
  return self->_time;
}

- (void)setRelativeTime:(NSTimeInterval)relativeTime
{
  self->_time = relativeTime;
}

- (float)value
{
  return self->_value;
}

- (void)setValue:(float)value
{
  self->_value = value;
}

@end