@interface MDLStereoscopicCamera
- (MDLStereoscopicCamera)init;
- (float)interPupillaryDistance;
- (float)leftVergence;
- (float)overlap;
- (float)rightVergence;
- (matrix_float4x4)leftProjectionMatrix;
- (matrix_float4x4)leftViewMatrix;
- (matrix_float4x4)rightProjectionMatrix;
- (matrix_float4x4)rightViewMatrix;
- (void)setInterPupillaryDistance:(float)interPupillaryDistance;
- (void)setLeftVergence:(float)leftVergence;
- (void)setOverlap:(float)overlap;
- (void)setRightVergence:(float)rightVergence;
@end

@implementation MDLStereoscopicCamera

- (MDLStereoscopicCamera)init
{
  v6.receiver = self;
  v6.super_class = (Class)MDLStereoscopicCamera;
  v2 = [(MDLCamera *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_interPupillaryDistance = 63.0;
    v4 = v2;
  }

  return v3;
}

- (matrix_float4x4)leftViewMatrix
{
  double v2 = sub_20B148F40((uint64_t)self->super._camera, (float)(self->_interPupillaryDistance * -0.01) / self->super._worldToMetersConversionScale);
  result.columns[3].i64[1] = v9;
  result.columns[3].i64[0] = v8;
  result.columns[2].i64[1] = v7;
  result.columns[2].i64[0] = v6;
  result.columns[1].i64[1] = v5;
  result.columns[1].i64[0] = v4;
  result.columns[0].i64[1] = v3;
  *(double *)result.columns[0].i64 = v2;
  return result;
}

- (matrix_float4x4)rightViewMatrix
{
  double v2 = sub_20B148F40((uint64_t)self->super._camera, (float)(self->_interPupillaryDistance * 0.01) / self->super._worldToMetersConversionScale);
  result.columns[3].i64[1] = v9;
  result.columns[3].i64[0] = v8;
  result.columns[2].i64[1] = v7;
  result.columns[2].i64[0] = v6;
  result.columns[1].i64[1] = v5;
  result.columns[1].i64[0] = v4;
  result.columns[0].i64[1] = v3;
  *(double *)result.columns[0].i64 = v2;
  return result;
}

- (matrix_float4x4)leftProjectionMatrix
{
  float v2 = sub_20B148F88((uint64_t)self->super._camera, (float)(self->_interPupillaryDistance * -0.01) / self->super._worldToMetersConversionScale);
  result.columns[3].i64[1] = v10;
  result.columns[3].i64[0] = v9;
  result.columns[2].i64[1] = v8;
  result.columns[2].i64[0] = v7;
  result.columns[1].i64[1] = v6;
  result.columns[1].i64[0] = v5;
  result.columns[0].i64[1] = v4;
  result.columns[0].f32[1] = v3;
  result.columns[0].f32[0] = v2;
  return result;
}

- (matrix_float4x4)rightProjectionMatrix
{
  float v2 = sub_20B148F88((uint64_t)self->super._camera, (float)(self->_interPupillaryDistance * 0.01) / self->super._worldToMetersConversionScale);
  result.columns[3].i64[1] = v10;
  result.columns[3].i64[0] = v9;
  result.columns[2].i64[1] = v8;
  result.columns[2].i64[0] = v7;
  result.columns[1].i64[1] = v6;
  result.columns[1].i64[0] = v5;
  result.columns[0].i64[1] = v4;
  result.columns[0].f32[1] = v3;
  result.columns[0].f32[0] = v2;
  return result;
}

- (float)interPupillaryDistance
{
  return self->_interPupillaryDistance;
}

- (void)setInterPupillaryDistance:(float)interPupillaryDistance
{
  self->_interPupillaryDistance = interPupillaryDistance;
}

- (float)leftVergence
{
  return self->_leftVergence;
}

- (void)setLeftVergence:(float)leftVergence
{
  self->_leftVergence = leftVergence;
}

- (float)rightVergence
{
  return self->_rightVergence;
}

- (void)setRightVergence:(float)rightVergence
{
  self->_rightVergence = rightVergence;
}

- (float)overlap
{
  return self->_overlap;
}

- (void)setOverlap:(float)overlap
{
  self->_overlap = overlap;
}

@end