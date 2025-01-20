@interface ASVHitTestResult
- (ASVHitTestResult)initWithType:(int64_t)a3 worldPosition:imagePoint:assetPosition:cameraPosition:;
- (BOOL)isRealPlane;
- (BOOL)isSynthesizedVeritcalPlane;
- (__n128)assetPosition;
- (__n128)cameraPosition;
- (__n128)synthesizedPlaneNormal;
- (__n128)worldPosition;
- (double)cameraToPosition;
- (double)imagePoint;
- (float)distanceFromAsset;
- (float)distanceFromCamera;
- (int64_t)type;
- (void)setSynthesizedPlaneNormal:(ASVHitTestResult *)self;
- (void)setType:(int64_t)a3;
@end

@implementation ASVHitTestResult

- (ASVHitTestResult)initWithType:(int64_t)a3 worldPosition:imagePoint:assetPosition:cameraPosition:
{
  long long v11 = v5;
  long long v12 = v6;
  uint64_t v7 = v4;
  long long v10 = v3;
  v13.receiver = self;
  v13.super_class = (Class)ASVHitTestResult;
  result = [(ASVHitTestResult *)&v13 init];
  if (result)
  {
    result->_type = a3;
    *(void *)result->_imagePoint = v7;
    *(_OWORD *)result->_worldPosition = v10;
    *(_OWORD *)result->_assetPosition = v11;
    *(_OWORD *)result->_cameraPosition = v12;
    *(_OWORD *)result->_synthesizedPlaneNormal = kASVInvalidPosition;
  }
  return result;
}

- (float)distanceFromAsset
{
  [(ASVHitTestResult *)self assetPosition];
  if ((ASVPositionIsValid() & 1) == 0) {
    return -1.0;
  }
  [(ASVHitTestResult *)self assetPosition];
  float32x4_t v8 = v3;
  [(ASVHitTestResult *)self worldPosition];
  float32x4_t v5 = vsubq_f32(v8, v4);
  float32x4_t v6 = vmulq_f32(v5, v5);
  return sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v6, 2), vaddq_f32(v6, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v6.f32, 1))).f32[0]);
}

- (float)distanceFromCamera
{
  [(ASVHitTestResult *)self cameraToPosition];
  float32x4_t v3 = vmulq_f32(v2, v2);
  return sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v3, 2), vaddq_f32(v3, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v3.f32, 1))).f32[0]);
}

- (double)cameraToPosition
{
  [a1 worldPosition];
  float32x4_t v5 = v2;
  [a1 cameraPosition];
  *(void *)&double result = vsubq_f32(v5, v3).u64[0];
  return result;
}

- (BOOL)isRealPlane
{
  return [(ASVHitTestResult *)self type] == 2 || [(ASVHitTestResult *)self type] == 1;
}

- (BOOL)isSynthesizedVeritcalPlane
{
  if (self->_type != 3) {
    return 0;
  }
  float32x4_t v2 = vmulq_f32(*(float32x4_t *)self->_synthesizedPlaneNormal, (float32x4_t)xmmword_1E29A3B90);
  return acosf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v2, 2), vaddq_f32(v2, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v2.f32, 1))).f32[0]) > 0.785398163;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (__n128)worldPosition
{
  return a1[2];
}

- (__n128)assetPosition
{
  return a1[3];
}

- (__n128)cameraPosition
{
  return a1[4];
}

- (double)imagePoint
{
  return *(double *)(a1 + 16);
}

- (__n128)synthesizedPlaneNormal
{
  return a1[5];
}

- (void)setSynthesizedPlaneNormal:(ASVHitTestResult *)self
{
  *(_OWORD *)self->_synthesizedPlaneNormal = v2;
}

@end