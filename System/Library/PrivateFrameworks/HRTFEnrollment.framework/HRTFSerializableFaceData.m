@interface HRTFSerializableFaceData
+ (BOOL)supportsSecureCoding;
- (BOOL)rollAngleAvailable;
- (BOOL)yawAngleAvailable;
- (CGRect)bounds;
- (HRTFSerializableFaceData)initWithCoder:(id)a3;
- (HRTFSerializableFaceData)initWithFaceObject:(id)a3;
- (double)rollAngle;
- (double)yawAngle;
- (int64_t)faceID;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HRTFSerializableFaceData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HRTFSerializableFaceData)initWithFaceObject:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HRTFSerializableFaceData;
  v5 = [(HRTFSerializableFaceData *)&v13 init];
  if (v5)
  {
    [v4 bounds];
    v5->_bounds.origin.x = v6;
    v5->_bounds.origin.y = v7;
    v5->_bounds.size.width = v8;
    v5->_bounds.size.height = v9;
    v5->_faceID = [v4 faceID];
    v5->_yawAngleAvailable = [v4 hasYawAngle];
    [v4 yawAngle];
    v5->_yawAngle = v10;
    v5->_rollAngleAvailable = [v4 hasRollAngle];
    [v4 rollAngle];
    v5->_rollAngle = v11;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  id v4 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:&self->_bounds length:32];
  [v8 encodeObject:v4 forKey:@"Bounds"];
  v5 = [NSNumber numberWithInteger:self->_faceID];
  [v8 encodeObject:v5 forKey:@"FaceID"];

  if (self->_yawAngleAvailable)
  {
    CGFloat v6 = [NSNumber numberWithDouble:self->_yawAngle];
    [v8 encodeObject:v6 forKey:@"YawAngle"];
  }
  if (self->_rollAngleAvailable)
  {
    CGFloat v7 = [NSNumber numberWithDouble:self->_rollAngle];
    [v8 encodeObject:v7 forKey:@"RollAngle"];
  }
}

- (HRTFSerializableFaceData)initWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 containsValueForKey:@"Bounds"]
    && [v4 containsValueForKey:@"FaceID"])
  {
    v17.receiver = self;
    v17.super_class = (Class)HRTFSerializableFaceData;
    v5 = [(HRTFSerializableFaceData *)&v17 init];
    if (v5)
    {
      CGFloat v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Bounds"];
      if ([v6 length] != 32) {
        -[HRTFSerializableFaceData initWithCoder:]();
      }
      id v7 = v6;
      id v8 = (_OWORD *)[v7 bytes];
      long long v9 = v8[1];
      *(_OWORD *)(v5 + 8) = *v8;
      *(_OWORD *)(v5 + 24) = v9;
      double v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FaceID"];
      *((void *)v5 + 5) = [v10 integerValue];
      if ([v4 containsValueForKey:@"YawAngle"])
      {
        v5[64] = 1;
        double v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"YawAngle"];

        [v11 doubleValue];
        *((void *)v5 + 6) = v12;
        double v10 = v11;
      }
      if ([v4 containsValueForKey:@"RollAngle"])
      {
        v5[65] = 1;
        objc_super v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RollAngle"];

        [v13 doubleValue];
        *((void *)v5 + 7) = v14;
        double v10 = v13;
      }
    }
    self = v5;
    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (CGRect)bounds
{
  double x = self->_bounds.origin.x;
  double y = self->_bounds.origin.y;
  double width = self->_bounds.size.width;
  double height = self->_bounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (int64_t)faceID
{
  return self->_faceID;
}

- (double)yawAngle
{
  return self->_yawAngle;
}

- (double)rollAngle
{
  return self->_rollAngle;
}

- (BOOL)yawAngleAvailable
{
  return self->_yawAngleAvailable;
}

- (BOOL)rollAngleAvailable
{
  return self->_rollAngleAvailable;
}

- (void)initWithCoder:.cold.1()
{
  __assert_rtn("-[HRTFSerializableFaceData initWithCoder:]", "HRTFSerializableFaceData.m", 62, "data.length == sizeof(CGRect)");
}

@end