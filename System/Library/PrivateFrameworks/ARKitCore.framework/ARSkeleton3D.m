@interface ARSkeleton3D
+ (BOOL)supportsSecureCoding;
- (ARCoreRESkeletonResult)coreRESkeleton;
- (ARSkeleton3D)initWithCoder:(id)a3;
- (ARSkeleton3D)initWithCoreRESkeletonResult:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isJointTracked:(int64_t)a3;
- (const)jointLocalTransforms;
- (const)jointModelTransforms;
- (id)definition;
- (simd_float4x4)localTransformForJointName:(ARSkeletonJointName)jointName;
- (simd_float4x4)modelTransformForJointName:(ARSkeletonJointName)jointName;
- (unint64_t)jointCount;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ARSkeleton3D

- (id)definition
{
  return +[ARSkeletonDefinition defaultBody3DSkeletonDefinition];
}

- (ARSkeleton3D)initWithCoreRESkeletonResult:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ARSkeleton3D;
  v6 = [(ARSkeleton *)&v9 initPrivate];
  v7 = (ARSkeleton3D *)v6;
  if (v6) {
    objc_storeStrong(v6 + 3, a3);
  }

  return v7;
}

- (unint64_t)jointCount
{
  v2 = [(ARSkeleton3D *)self definition];
  v3 = [v2 jointNames];
  unint64_t v4 = [v3 count];

  return v4;
}

- (const)jointModelTransforms
{
  return (const simd_float4x4 *)[(ARCoreRESkeletonResult *)self->_skeleton jointModelTransforms];
}

- (const)jointLocalTransforms
{
  return (const simd_float4x4 *)[(ARCoreRESkeletonResult *)self->_skeleton jointLocalTransforms];
}

- (ARCoreRESkeletonResult)coreRESkeleton
{
  return self->_skeleton;
}

- (BOOL)isJointTracked:(int64_t)a3
{
  if (a3 < 0 || [(ARCoreRESkeletonResult *)self->_skeleton jointTransformCount] - 1 < a3) {
    return 0;
  }
  skeleton = self->_skeleton;
  return [(ARCoreRESkeletonResult *)skeleton isJointTracked:a3];
}

- (simd_float4x4)modelTransformForJointName:(ARSkeletonJointName)jointName
{
  unint64_t v4 = jointName;
  id v5 = [(ARSkeleton3D *)self definition];
  unint64_t v6 = [v5 indexForJointName:v4];

  if (v6 >= [(ARSkeleton3D *)self jointCount])
  {
    int32x4_t v8 = vdupq_n_s32(0x7FC00000u);
    simd_float4 v9 = (simd_float4)v8;
    simd_float4 v10 = (simd_float4)v8;
    simd_float4 v11 = (simd_float4)v8;
  }
  else
  {
    v7 = [(ARSkeleton3D *)self jointModelTransforms] + (v6 << 6);
    int32x4_t v8 = (int32x4_t)v7->columns[0];
    simd_float4 v9 = v7->columns[1];
    simd_float4 v10 = v7->columns[2];
    simd_float4 v11 = v7->columns[3];
  }
  result.columns[3] = v11;
  result.columns[2] = v10;
  result.columns[1] = v9;
  result.columns[0] = (simd_float4)v8;
  return result;
}

- (simd_float4x4)localTransformForJointName:(ARSkeletonJointName)jointName
{
  unint64_t v4 = jointName;
  id v5 = [(ARSkeleton3D *)self definition];
  unint64_t v6 = [v5 indexForJointName:v4];

  if (v6 >= [(ARSkeleton3D *)self jointCount])
  {
    int32x4_t v8 = vdupq_n_s32(0x7FC00000u);
    simd_float4 v9 = (simd_float4)v8;
    simd_float4 v10 = (simd_float4)v8;
    simd_float4 v11 = (simd_float4)v8;
  }
  else
  {
    v7 = [(ARSkeleton3D *)self jointLocalTransforms] + (v6 << 6);
    int32x4_t v8 = (int32x4_t)v7->columns[0];
    simd_float4 v9 = v7->columns[1];
    simd_float4 v10 = v7->columns[2];
    simd_float4 v11 = v7->columns[3];
  }
  result.columns[3] = v11;
  result.columns[2] = v10;
  result.columns[1] = v9;
  result.columns[0] = (simd_float4)v8;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (ARSkeleton3D)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ARSkeleton3D;
  id v5 = [(ARSkeleton *)&v9 initPrivate];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"skeleton"];
    skeleton = v5->_skeleton;
    v5->_skeleton = (ARCoreRESkeletonResult *)v6;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(ARCoreRESkeletonResult *)self->_skeleton isEqual:v4[3]];

  return v5;
}

- (void).cxx_destruct
{
}

@end