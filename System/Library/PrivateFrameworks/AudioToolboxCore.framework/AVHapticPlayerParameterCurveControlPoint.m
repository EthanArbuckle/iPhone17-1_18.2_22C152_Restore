@interface AVHapticPlayerParameterCurveControlPoint
+ (BOOL)supportsSecureCoding;
- (AVHapticPlayerParameterCurveControlPoint)initWithCoder:(id)a3;
- (AVHapticPlayerParameterCurveControlPoint)initWithTime:(double)a3 value:(float)a4;
- (double)time;
- (float)value;
- (void)encodeWithCoder:(id)a3;
- (void)setTime:(double)a3;
- (void)setValue:(float)a3;
@end

@implementation AVHapticPlayerParameterCurveControlPoint

- (void)setValue:(float)a3
{
  self->_value = a3;
}

- (float)value
{
  return self->_value;
}

- (void)setTime:(double)a3
{
  self->_time = a3;
}

- (double)time
{
  return self->_time;
}

- (AVHapticPlayerParameterCurveControlPoint)initWithCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeDoubleForKey:@"time"];
  self->_time = v5;
  [v4 decodeFloatForKey:@"value"];
  self->_value = v6;

  return self;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeDouble:@"time" forKey:self->_time];
  *(float *)&double v4 = self->_value;
  [v5 encodeFloat:@"value" forKey:v4];
}

- (AVHapticPlayerParameterCurveControlPoint)initWithTime:(double)a3 value:(float)a4
{
  v10.receiver = self;
  v10.super_class = (Class)AVHapticPlayerParameterCurveControlPoint;
  float v6 = [(AVHapticPlayerParameterCurveControlPoint *)&v10 init];
  v7 = v6;
  if (v6)
  {
    [(AVHapticPlayerParameterCurveControlPoint *)v6 setTime:a3];
    *(float *)&double v8 = a4;
    [(AVHapticPlayerParameterCurveControlPoint *)v7 setValue:v8];
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end