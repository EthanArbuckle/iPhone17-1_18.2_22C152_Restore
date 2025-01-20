@interface ARRaycastResult
- (ARAnchor)anchor;
- (ARRaycastTarget)target;
- (ARRaycastTargetAlignment)targetAlignment;
- (NSUUID)anchorIdentifier;
- (__n128)initWithWorldTransform:(__n128)a3 target:(__n128)a4 targetAlignment:(__n128)a5;
- (__n128)localTransform;
- (__n128)setLocalTransform:(__n128)a3;
- (id)_description:(BOOL)a3;
- (id)description;
- (simd_float4x4)worldTransform;
- (void)setAnchor:(id)a3;
- (void)setAnchorIdentifier:(id)a3;
- (void)setTarget:(int64_t)a3;
@end

@implementation ARRaycastResult

- (__n128)initWithWorldTransform:(__n128)a3 target:(__n128)a4 targetAlignment:(__n128)a5
{
  v16.receiver = a1;
  v16.super_class = (Class)ARRaycastResult;
  v10 = [(ARRaycastResult *)&v16 init];
  if (v10)
  {
    *(__n128 *)v10->_anon_30 = a2;
    *(__n128 *)&v10->_anon_30[16] = a3;
    __n128 result = a5;
    *(__n128 *)&v10->_anon_30[32] = a4;
    *(__n128 *)&v10->_anon_30[48] = a5;
    *(__n128 *)&v10[1].super.isa = a2;
    *(__n128 *)&v10[1]._targetAlignment = a3;
    *(__n128 *)&v10[1]._anchorIdentifier = a4;
    *(__n128 *)v10[1]._anon_30 = a5;
    v10->_target = a7;
    v10->_targetAlignment = a8;
  }
  return result;
}

- (id)_description:(BOOL)a3
{
  BOOL v3 = a3;
  ARRaycastTargetAlignment v5 = [(ARRaycastResult *)self targetAlignment];
  if ((unint64_t)v5 > ARRaycastTargetAlignmentAny) {
    v6 = 0;
  }
  else {
    v6 = off_1E6186FD0[v5];
  }
  ARRaycastTarget v7 = [(ARRaycastResult *)self target];
  switch(v7)
  {
    case ARRaycastTargetEstimatedPlane:
      v8 = @"estimatedPlane";
      goto LABEL_12;
    case ARRaycastTargetExistingPlaneInfinite:
      [NSString stringWithFormat:@"existingPlaneInfinite (%@)", v6];
      goto LABEL_10;
    case ARRaycastTargetExistingPlaneGeometry:
      [NSString stringWithFormat:@"existingPlaneGeometry (%@)", v6];
LABEL_10:
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
  }
  v8 = 0;
LABEL_12:
  v9 = NSString;
  v10 = (objc_class *)objc_opt_class();
  v11 = NSStringFromClass(v10);
  [(ARRaycastResult *)self worldTransform];
  objc_super v16 = ARMatrix4x4Description(v3, v12, v13, v14, v15);
  v17 = [v9 stringWithFormat:@"<%@: %p target=%@ worldTransform=%@>", v11, self, v8, v16];

  return v17;
}

- (id)description
{
  return [(ARRaycastResult *)self _description:0];
}

- (simd_float4x4)worldTransform
{
  simd_float4 v2 = *(simd_float4 *)self->_anon_30;
  simd_float4 v3 = *(simd_float4 *)&self->_anon_30[16];
  simd_float4 v4 = *(simd_float4 *)&self->_anon_30[32];
  simd_float4 v5 = *(simd_float4 *)&self->_anon_30[48];
  result.columns[3] = v5;
  result.columns[2] = v4;
  result.columns[1] = v3;
  result.columns[0] = v2;
  return result;
}

- (ARRaycastTarget)target
{
  return self->_target;
}

- (void)setTarget:(int64_t)a3
{
  self->_target = a3;
}

- (ARRaycastTargetAlignment)targetAlignment
{
  return self->_targetAlignment;
}

- (ARAnchor)anchor
{
  return self->_anchor;
}

- (void)setAnchor:(id)a3
{
}

- (__n128)localTransform
{
  return a1[7];
}

- (__n128)setLocalTransform:(__n128)a3
{
  result[7] = a2;
  result[8] = a3;
  result[9] = a4;
  result[10] = a5;
  return result;
}

- (NSUUID)anchorIdentifier
{
  return self->_anchorIdentifier;
}

- (void)setAnchorIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anchorIdentifier, 0);
  objc_storeStrong((id *)&self->_anchor, 0);
}

@end