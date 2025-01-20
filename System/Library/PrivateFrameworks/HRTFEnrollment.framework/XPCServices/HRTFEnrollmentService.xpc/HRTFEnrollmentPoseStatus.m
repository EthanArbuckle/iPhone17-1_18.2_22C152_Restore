@interface HRTFEnrollmentPoseStatus
+ (BOOL)supportsSecureCoding;
- (CGRect)faceBoundingBox;
- (HRTFEnrollmentPoseStatus)initWithCoder:(id)a3;
- (HRTFEnrollmentPoseStatus)initWithCurrentYawPose:(id)a3 pitchPose:(id)a4 yawAngle:(double)a5 pitchAngle:(double)a6 faceBoundingBox:(CGRect)a7;
- (HRTFEnrollmentPoseStatus)initWithYawPose:(id)a3 pitchPose:(id)a4 isEarTracking:(unsigned __int8)a5 yawAngle:(double)a6 pitchAngle:(double)a7;
- (NSArray)pitchAngles;
- (NSArray)remainingPitchAngles;
- (NSArray)remainingYawAngles;
- (NSArray)yawAngles;
- (double)currentPitchAngle;
- (double)currentYawAngle;
- (unsigned)hasPitchAngle;
- (unsigned)hasYawAngle;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HRTFEnrollmentPoseStatus

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HRTFEnrollmentPoseStatus)initWithYawPose:(id)a3 pitchPose:(id)a4 isEarTracking:(unsigned __int8)a5 yawAngle:(double)a6 pitchAngle:(double)a7
{
  id v12 = a3;
  id v13 = a4;
  v59.receiver = self;
  v59.super_class = (Class)HRTFEnrollmentPoseStatus;
  v14 = [(HRTFEnrollmentPoseStatus *)&v59 init];
  if (v14)
  {
    v49 = v14;
    v15 = (NSArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v12, "count"));
    v16 = [v12 allKeys];
    v17 = objc_msgSend(v16, "sortedArrayUsingSelector:");

    v18 = v14;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id obj = v17;
    id v19 = [obj countByEnumeratingWithState:&v55 objects:v61 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v56;
      do
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v56 != v21) {
            objc_enumerationMutation(obj);
          }
          v23 = *(void **)(*((void *)&v55 + 1) + 8 * i);
          v24 = [HRTFEnrollmentCaptureAngle alloc];
          [v23 doubleValue];
          double v26 = v25;
          v27 = [v12 objectForKeyedSubscript:v23];
          v28 = -[HRTFEnrollmentCaptureAngle initWithAngle:captured:](v24, "initWithAngle:captured:", [v27 BOOLValue], v26);

          [(NSArray *)v15 addObject:v28];
        }
        id v20 = [obj countByEnumeratingWithState:&v55 objects:v61 count:16];
      }
      while (v20);
    }

    yawAngles = v18->_yawAngles;
    v18->_yawAngles = v15;
    v30 = v15;

    CGSize size = CGRectZero.size;
    v18->_faceBoundingBox.origin = CGRectZero.origin;
    v18->_faceBoundingBox.CGSize size = size;
    id v32 = objc_alloc((Class)NSMutableArray);

    v33 = (NSArray *)objc_msgSend(v32, "initWithCapacity:", objc_msgSend(v13, "count"));
    v34 = [v13 allKeys];
    v35 = [v34 sortedArrayUsingSelector:"compare:"];

    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v36 = v35;
    id v37 = [v36 countByEnumeratingWithState:&v51 objects:v60 count:16];
    if (v37)
    {
      id v38 = v37;
      uint64_t v39 = *(void *)v52;
      do
      {
        for (j = 0; j != v38; j = (char *)j + 1)
        {
          if (*(void *)v52 != v39) {
            objc_enumerationMutation(v36);
          }
          v41 = *(void **)(*((void *)&v51 + 1) + 8 * (void)j);
          v42 = [HRTFEnrollmentCaptureAngle alloc];
          [v41 doubleValue];
          double v44 = v43;
          v45 = [v13 objectForKeyedSubscript:v41];
          v46 = -[HRTFEnrollmentCaptureAngle initWithAngle:captured:](v42, "initWithAngle:captured:", [v45 BOOLValue], v44);

          [(NSArray *)v33 addObject:v46];
        }
        id v38 = [v36 countByEnumeratingWithState:&v51 objects:v60 count:16];
      }
      while (v38);
    }

    v14 = v49;
    pitchAngles = v49->_pitchAngles;
    v49->_pitchAngles = v33;

    v49->_currentYawAngle = a6;
    v49->_currentPitchAngle = a7;
    v49->_hasYawAngle = a5;
    v49->_hasPitchAngle = a5;
  }
  return v14;
}

- (HRTFEnrollmentPoseStatus)initWithCurrentYawPose:(id)a3 pitchPose:(id)a4 yawAngle:(double)a5 pitchAngle:(double)a6 faceBoundingBox:(CGRect)a7
{
  CGFloat height = a7.size.height;
  CGFloat width = a7.size.width;
  CGFloat y = a7.origin.y;
  CGFloat x = a7.origin.x;
  id v15 = a4;
  id v16 = a3;
  v17 = [[HRTFEnrollmentPoseStatus alloc] initWithYawPose:v16 pitchPose:v15 isEarTracking:0 yawAngle:-100.0 pitchAngle:-100.0];

  if (v17)
  {
    v17->_currentYawAngle = a5;
    v17->_currentPitchAngle = a6;
    *(_WORD *)&v17->_hasYawAngle = 257;
    v17->_faceBoundingBox.origin.CGFloat x = x;
    v17->_faceBoundingBox.origin.CGFloat y = y;
    v17->_faceBoundingBox.size.CGFloat width = width;
    v17->_faceBoundingBox.size.CGFloat height = height;
  }
  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  yawAngles = self->_yawAngles;
  id v5 = a3;
  [v5 encodeObject:yawAngles forKey:@"YawAngles"];
  [v5 encodeObject:self->_pitchAngles forKey:@"PitchAngles"];
  [v5 encodeDouble:@"CurrentYaw" forKey:self->_currentYawAngle];
  [v5 encodeDouble:@"CurrentPitch" forKey:self->_currentPitchAngle];
  [v5 encodeBool:self->_hasYawAngle != 0 forKey:@"HasYaw"];
  [v5 encodeBool:self->_hasPitchAngle != 0 forKey:@"HasPitch"];
  [v5 encodeDouble:@"FaceBoundingBox.origin.x" forKey:self->_faceBoundingBox.origin.x];
  [v5 encodeDouble:@"FaceBoundingBox.origin.y" forKey:self->_faceBoundingBox.origin.y];
  [v5 encodeDouble:@"FaceBoundingBox.size.width" forKey:self->_faceBoundingBox.size.width];
  [v5 encodeDouble:@"FaceBoundingBox.size.height" forKey:self->_faceBoundingBox.size.height];
}

- (HRTFEnrollmentPoseStatus)initWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 containsValueForKey:@"YawAngles"]
    && [v4 containsValueForKey:@"PitchAngles"]
    && [v4 containsValueForKey:@"CurrentYaw"]
    && [v4 containsValueForKey:@"CurrentPitch"]
    && [v4 containsValueForKey:@"HasYaw"]
    && [v4 containsValueForKey:@"HasPitch"]
    && [v4 containsValueForKey:@"FaceBoundingBox.origin.x"]
    && [v4 containsValueForKey:@"FaceBoundingBox.origin.y"]
    && [v4 containsValueForKey:@"FaceBoundingBox.size.width"]
    && [v4 containsValueForKey:@"FaceBoundingBox.size.height"])
  {
    v20.receiver = self;
    v20.super_class = (Class)HRTFEnrollmentPoseStatus;
    id v5 = [(HRTFEnrollmentPoseStatus *)&v20 init];
    if (v5)
    {
      v21[0] = objc_opt_class();
      v21[1] = objc_opt_class();
      v6 = +[NSArray arrayWithObjects:v21 count:2];
      v7 = +[NSSet setWithArray:v6];

      uint64_t v8 = [v4 decodeObjectOfClasses:v7 forKey:@"YawAngles"];
      yawAngles = v5->_yawAngles;
      v5->_yawAngles = (NSArray *)v8;

      uint64_t v10 = [v4 decodeObjectOfClasses:v7 forKey:@"PitchAngles"];
      pitchAngles = v5->_pitchAngles;
      v5->_pitchAngles = (NSArray *)v10;

      v5->_hasYawAngle = [v4 decodeBoolForKey:@"HasYaw"];
      v5->_hasPitchAngle = [v4 decodeBoolForKey:@"HasPitch"];
      [v4 decodeDoubleForKey:@"CurrentYaw"];
      v5->_currentYawAngle = v12;
      [v4 decodeDoubleForKey:@"CurrentPitch"];
      v5->_currentPitchAngle = v13;
      [v4 decodeDoubleForKey:@"FaceBoundingBox.origin.x"];
      v5->_faceBoundingBox.origin.CGFloat x = v14;
      [v4 decodeDoubleForKey:@"FaceBoundingBox.origin.y"];
      v5->_faceBoundingBox.origin.CGFloat y = v15;
      [v4 decodeDoubleForKey:@"FaceBoundingBox.size.width"];
      v5->_faceBoundingBox.size.CGFloat width = v16;
      [v4 decodeDoubleForKey:@"FaceBoundingBox.size.height"];
      v5->_faceBoundingBox.size.CGFloat height = v17;
    }
    self = v5;
    v18 = self;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (NSArray)remainingYawAngles
{
  if ([(NSArray *)self->_yawAngles count])
  {
    id v3 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSArray count](self->_yawAngles, "count"));
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v4 = self->_yawAngles;
    id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v14;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if ((objc_msgSend(v9, "captured", (void)v13) & 1) == 0)
          {
            [v9 angle];
            uint64_t v10 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
            [v3 addObject:v10];
          }
        }
        id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v6);
    }

    if ([v3 count]) {
      id v11 = v3;
    }
    else {
      id v11 = 0;
    }
  }
  else
  {
    id v11 = 0;
  }
  return (NSArray *)v11;
}

- (NSArray)remainingPitchAngles
{
  if ([(NSArray *)self->_pitchAngles count])
  {
    id v3 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSArray count](self->_pitchAngles, "count"));
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v4 = self->_pitchAngles;
    id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v14;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if ((objc_msgSend(v9, "captured", (void)v13) & 1) == 0)
          {
            [v9 angle];
            uint64_t v10 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
            [v3 addObject:v10];
          }
        }
        id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v6);
    }

    if ([v3 count]) {
      id v11 = v3;
    }
    else {
      id v11 = 0;
    }
  }
  else
  {
    id v11 = 0;
  }
  return (NSArray *)v11;
}

- (NSArray)yawAngles
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)pitchAngles
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (double)currentYawAngle
{
  return self->_currentYawAngle;
}

- (unsigned)hasYawAngle
{
  return self->_hasYawAngle;
}

- (double)currentPitchAngle
{
  return self->_currentPitchAngle;
}

- (unsigned)hasPitchAngle
{
  return self->_hasPitchAngle;
}

- (CGRect)faceBoundingBox
{
  objc_copyStruct(v6, &self->_faceBoundingBox, 32, 1, 0);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pitchAngles, 0);
  objc_storeStrong((id *)&self->_yawAngles, 0);
}

@end