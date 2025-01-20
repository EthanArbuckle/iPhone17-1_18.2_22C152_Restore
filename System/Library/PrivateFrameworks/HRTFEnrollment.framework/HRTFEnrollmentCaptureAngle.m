@interface HRTFEnrollmentCaptureAngle
+ (BOOL)supportsSecureCoding;
- (BOOL)captured;
- (HRTFEnrollmentCaptureAngle)initWithAngle:(double)a3 captured:(BOOL)a4;
- (HRTFEnrollmentCaptureAngle)initWithCoder:(id)a3;
- (double)angle;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HRTFEnrollmentCaptureAngle

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HRTFEnrollmentCaptureAngle)initWithAngle:(double)a3 captured:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)HRTFEnrollmentCaptureAngle;
  result = [(HRTFEnrollmentCaptureAngle *)&v7 init];
  if (result)
  {
    result->_angle = a3;
    result->_captured = a4;
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  double angle = self->_angle;
  id v5 = a3;
  [v5 encodeDouble:@"CaptureAngle" forKey:angle];
  [v5 encodeBool:self->_captured forKey:@"Captured"];
}

- (HRTFEnrollmentCaptureAngle)initWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 containsValueForKey:@"CaptureAngle"]
    && [v4 containsValueForKey:@"Captured"])
  {
    v11.receiver = self;
    v11.super_class = (Class)HRTFEnrollmentCaptureAngle;
    id v5 = [(HRTFEnrollmentCaptureAngle *)&v11 init];
    if (v5)
    {
      v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CaptureAngle"];
      [v6 doubleValue];
      v5->_double angle = v7;
      v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Captured"];

      v5->_captured = [v8 BOOLValue];
    }
    self = v5;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (double)angle
{
  return self->_angle;
}

- (BOOL)captured
{
  return self->_captured;
}

@end