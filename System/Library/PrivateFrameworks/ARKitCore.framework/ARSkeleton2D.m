@interface ARSkeleton2D
+ (BOOL)supportsSecureCoding;
- (ARSkeleton2D)initWithCoder:(id)a3;
- (ARSkeleton2D)initWithDetectedSkeleton:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isJointTracked:(int64_t)a3;
- (const)jointLandmarks;
- (id)definition;
- (simd_float2)landmarkForJointNamed:(ARSkeletonJointName)jointName;
- (unint64_t)jointCount;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ARSkeleton2D

- (id)definition
{
  return +[ARSkeletonDefinition defaultBody2DSkeletonDefinition];
}

- (ARSkeleton2D)initWithDetectedSkeleton:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ARSkeleton2D;
  v6 = [(ARSkeleton *)&v9 initPrivate];
  v7 = (ARSkeleton2D *)v6;
  if (v6) {
    objc_storeStrong(v6 + 3, a3);
  }

  return v7;
}

- (const)jointLandmarks
{
  return (const simd_float2 *)[(ABPK2DDetectionResult *)self->_skeleton joints];
}

- (unint64_t)jointCount
{
  return [(ABPK2DDetectionResult *)self->_skeleton jointCount];
}

- (BOOL)isJointTracked:(int64_t)a3
{
  if (a3 < 0) {
    return 0;
  }
  if ([(ABPK2DDetectionResult *)self->_skeleton jointCount] - 1 >= (unint64_t)a3) {
    return *(_DWORD *)([(ABPK2DDetectionResult *)self->_skeleton jointTrackingStates] + 4 * a3) != 0;
  }
  return 0;
}

- (simd_float2)landmarkForJointNamed:(ARSkeletonJointName)jointName
{
  v4 = jointName;
  id v5 = [(ARSkeleton2D *)self definition];
  unint64_t v6 = [v5 indexForJointName:v4];

  if (v6 >= [(ARSkeleton2D *)self jointCount]) {
    return (simd_float2)vdup_n_s32(0x7FC00000u);
  }
  return [(ARSkeleton2D *)self jointLandmarks][8 * v6];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (ARSkeleton2D)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ARSkeleton2D;
  id v5 = [(ARSkeleton *)&v9 initPrivate];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"skeleton"];
    skeleton = v5->_skeleton;
    v5->_skeleton = (ABPK2DDetectionResult *)v6;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v5 = [(ABPK2DDetectionResult *)self->_skeleton isEqual:v4[3]];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (void).cxx_destruct
{
}

@end