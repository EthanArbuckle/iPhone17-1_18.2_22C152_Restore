@interface HRTFEnrollmentEarPoseStatus
+ (BOOL)supportsSecureCoding;
- (CGRect)earBoundingBox;
- (HRTFEnrollmentEarPoseStatus)initWithCoder:(id)a3;
- (HRTFEnrollmentEarPoseStatus)initWithLeftYawPose:(id)a3 rightYawPose:(id)a4 leftpitchPose:(id)a5 rightpitchPose:(id)a6 earSide:(unint64_t)a7 yawAngle:(double)a8 pitchAngle:(double)a9 earBoundingBox:(CGRect)a10 earCaptureStatus:(int)a11;
- (HRTFEnrollmentPoseStatus)leftStatus;
- (HRTFEnrollmentPoseStatus)rightStatus;
- (int)earCaptureStatus;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HRTFEnrollmentEarPoseStatus

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HRTFEnrollmentEarPoseStatus)initWithLeftYawPose:(id)a3 rightYawPose:(id)a4 leftpitchPose:(id)a5 rightpitchPose:(id)a6 earSide:(unint64_t)a7 yawAngle:(double)a8 pitchAngle:(double)a9 earBoundingBox:(CGRect)a10 earCaptureStatus:(int)a11
{
  CGFloat height = a10.size.height;
  CGFloat width = a10.size.width;
  CGFloat y = a10.origin.y;
  CGFloat x = a10.origin.x;
  id v23 = a3;
  id v24 = a4;
  id v25 = a5;
  id v26 = a6;
  v39.receiver = self;
  v39.super_class = (Class)HRTFEnrollmentEarPoseStatus;
  v27 = [(HRTFEnrollmentEarPoseStatus *)&v39 init];
  if (v27)
  {
    v28 = [HRTFEnrollmentPoseStatus alloc];
    if (a7) {
      double v29 = -100.0;
    }
    else {
      double v29 = a8;
    }
    if (a7) {
      double v30 = -100.0;
    }
    else {
      double v30 = a9;
    }
    v31 = [(HRTFEnrollmentPoseStatus *)v28 initWithYawPose:v23 pitchPose:v25 isEarTracking:a11 == 0 yawAngle:v29 pitchAngle:v30];
    leftStatus = v27->_leftStatus;
    v27->_leftStatus = v31;

    v33 = [HRTFEnrollmentPoseStatus alloc];
    if (a7 == 1) {
      double v34 = a8;
    }
    else {
      double v34 = -100.0;
    }
    if (a7 == 1) {
      double v35 = a9;
    }
    else {
      double v35 = -100.0;
    }
    v36 = [(HRTFEnrollmentPoseStatus *)v33 initWithYawPose:v24 pitchPose:v26 isEarTracking:a11 == 0 yawAngle:v34 pitchAngle:v35];
    rightStatus = v27->_rightStatus;
    v27->_rightStatus = v36;

    v27->_earBoundingBox.origin.CGFloat x = x;
    v27->_earBoundingBox.origin.CGFloat y = y;
    v27->_earBoundingBox.size.CGFloat width = width;
    v27->_earBoundingBox.size.CGFloat height = height;
    v27->_earCaptureStatus = a11;
  }

  return v27;
}

- (void)encodeWithCoder:(id)a3
{
  leftStatus = self->_leftStatus;
  id v5 = a3;
  [v5 encodeObject:leftStatus forKey:@"LeftEarStatus"];
  [v5 encodeObject:self->_rightStatus forKey:@"RightEarStatus"];
  [v5 encodeDouble:@"EarBoundingBox.origin.x" forKey:self->_earBoundingBox.origin.x];
  [v5 encodeDouble:@"EarBoundingBox.origin.y" forKey:self->_earBoundingBox.origin.y];
  [v5 encodeDouble:@"EarBoundingBox.size.width" forKey:self->_earBoundingBox.size.width];
  [v5 encodeDouble:@"EarBoundingBox.size.height" forKey:self->_earBoundingBox.size.height];
  [v5 encodeInt32:self->_earCaptureStatus forKey:@"EarCaptureStatusKey"];
}

- (HRTFEnrollmentEarPoseStatus)initWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 containsValueForKey:@"LeftEarStatus"]
    && [v4 containsValueForKey:@"RightEarStatus"]
    && [v4 containsValueForKey:@"EarBoundingBox.origin.x"]
    && [v4 containsValueForKey:@"EarBoundingBox.origin.y"]
    && [v4 containsValueForKey:@"EarBoundingBox.size.width"]
    && [v4 containsValueForKey:@"EarBoundingBox.size.height"]
    && [v4 containsValueForKey:@"EarCaptureStatusKey"])
  {
    v16.receiver = self;
    v16.super_class = (Class)HRTFEnrollmentEarPoseStatus;
    id v5 = [(HRTFEnrollmentEarPoseStatus *)&v16 init];
    if (v5)
    {
      uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LeftEarStatus"];
      leftStatus = v5->_leftStatus;
      v5->_leftStatus = (HRTFEnrollmentPoseStatus *)v6;

      uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RightEarStatus"];
      rightStatus = v5->_rightStatus;
      v5->_rightStatus = (HRTFEnrollmentPoseStatus *)v8;

      [v4 decodeDoubleForKey:@"EarBoundingBox.origin.x"];
      v5->_earBoundingBox.origin.CGFloat x = v10;
      [v4 decodeDoubleForKey:@"EarBoundingBox.origin.y"];
      v5->_earBoundingBox.origin.CGFloat y = v11;
      [v4 decodeDoubleForKey:@"EarBoundingBox.size.width"];
      v5->_earBoundingBox.size.CGFloat width = v12;
      [v4 decodeDoubleForKey:@"EarBoundingBox.size.height"];
      v5->_earBoundingBox.size.CGFloat height = v13;
      v5->_earCaptureStatus = [v4 decodeInt32ForKey:@"EarCaptureStatusKey"];
    }
    self = v5;
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (HRTFEnrollmentPoseStatus)leftStatus
{
  return (HRTFEnrollmentPoseStatus *)objc_getProperty(self, a2, 8, 1);
}

- (HRTFEnrollmentPoseStatus)rightStatus
{
  return (HRTFEnrollmentPoseStatus *)objc_getProperty(self, a2, 16, 1);
}

- (CGRect)earBoundingBox
{
  objc_copyStruct(v6, &self->_earBoundingBox, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

- (int)earCaptureStatus
{
  return self->_earCaptureStatus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightStatus, 0);
  objc_storeStrong((id *)&self->_leftStatus, 0);
}

@end