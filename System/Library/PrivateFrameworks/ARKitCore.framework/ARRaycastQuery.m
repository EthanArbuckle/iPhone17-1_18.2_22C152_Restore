@interface ARRaycastQuery
- (ARRaycastQuery)initWithOrigin:(simd_float3)origin direction:(simd_float3)direction allowingTarget:(ARRaycastTarget)target alignment:(ARRaycastTargetAlignment)alignment;
- (ARRaycastTarget)target;
- (ARRaycastTargetAlignment)targetAlignment;
- (BOOL)isEqual:(id)a3;
- (id)description;
- (simd_float3)direction;
- (simd_float3)origin;
@end

@implementation ARRaycastQuery

- (ARRaycastQuery)initWithOrigin:(simd_float3)origin direction:(simd_float3)direction allowingTarget:(ARRaycastTarget)target alignment:(ARRaycastTargetAlignment)alignment
{
  v11.receiver = self;
  v11.super_class = (Class)ARRaycastQuery;
  result = [(ARRaycastQuery *)&v11 init];
  if (result)
  {
    *(simd_float3 *)result->_origin = origin;
    *(simd_float3 *)result->_direction = direction;
    result->_target = target;
    result->_targetAlignment = alignment;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    [(ARRaycastQuery *)self origin];
    float32x4_t v16 = v6;
    [v5 origin];
    uint32x4_t v8 = (uint32x4_t)vceqq_f32(v16, v7);
    v8.i32[3] = v8.i32[2];
    if ((vminvq_u32(v8) & 0x80000000) != 0
      && ([(ARRaycastQuery *)self direction],
          float32x4_t v17 = v9,
          [v5 direction],
          uint32x4_t v11 = (uint32x4_t)vceqq_f32(v17, v10),
          v11.i32[3] = v11.i32[2],
          (vminvq_u32(v11) & 0x80000000) != 0)
      && (ARRaycastTarget v12 = -[ARRaycastQuery target](self, "target"), v12 == [v5 target]))
    {
      ARRaycastTargetAlignment v13 = [(ARRaycastQuery *)self targetAlignment];
      BOOL v14 = v13 == [v5 targetAlignment];
    }
    else
    {
      BOOL v14 = 0;
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (id)description
{
  ARRaycastTargetAlignment v3 = [(ARRaycastQuery *)self targetAlignment];
  if ((unint64_t)v3 > ARRaycastTargetAlignmentAny) {
    id v4 = 0;
  }
  else {
    id v4 = off_1E6186BE8[v3];
  }
  ARRaycastTarget v5 = [(ARRaycastQuery *)self target];
  switch(v5)
  {
    case ARRaycastTargetEstimatedPlane:
      float32x4_t v6 = @"estimatedPlane";
      goto LABEL_12;
    case ARRaycastTargetExistingPlaneInfinite:
      [NSString stringWithFormat:@"existingPlaneInfinite (%@)", v4];
      goto LABEL_10;
    case ARRaycastTargetExistingPlaneGeometry:
      [NSString stringWithFormat:@"existingPlaneGeometry (%@)", v4];
LABEL_10:
      float32x4_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
  }
  float32x4_t v6 = 0;
LABEL_12:
  float32x4_t v7 = NSString;
  uint32x4_t v8 = (objc_class *)objc_opt_class();
  float32x4_t v9 = NSStringFromClass(v8);
  [(ARRaycastQuery *)self origin];
  uint32x4_t v11 = ARVector3Description(v10);
  [(ARRaycastQuery *)self direction];
  ARRaycastTargetAlignment v13 = ARVector3Description(v12);
  BOOL v14 = [v7 stringWithFormat:@"<%@: %p origin=%@ direction=%@ target=%@>", v9, self, v11, v13, v6];

  return v14;
}

- (simd_float3)origin
{
  return *(simd_float3 *)self->_origin;
}

- (simd_float3)direction
{
  return *(simd_float3 *)self->_direction;
}

- (ARRaycastTarget)target
{
  return self->_target;
}

- (ARRaycastTargetAlignment)targetAlignment
{
  return self->_targetAlignment;
}

@end