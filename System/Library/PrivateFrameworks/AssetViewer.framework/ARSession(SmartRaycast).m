@interface ARSession(SmartRaycast)
- (ASVRealHitTestResult)smartRaycastResultForImagePoint:()SmartRaycast assetPosition:maxDistance:;
- (__n128)cameraPosition;
- (float)raycastResultDistanceFromCamera:()SmartRaycast;
@end

@implementation ARSession(SmartRaycast)

- (__n128)cameraPosition
{
  v1 = [a1 currentFrame];
  v2 = [v1 camera];
  [v2 transform];
  long long v5 = v3;

  return (__n128)v5;
}

- (float)raycastResultDistanceFromCamera:()SmartRaycast
{
  [a3 worldPosition];
  float32x4_t v9 = v4;
  [a1 cameraPosition];
  float32x4_t v6 = vsubq_f32(v9, v5);
  float32x4_t v7 = vmulq_f32(v6, v6);
  return sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v7, 2), vaddq_f32(v7, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v7.f32, 1))).f32[0]);
}

- (ASVRealHitTestResult)smartRaycastResultForImagePoint:()SmartRaycast assetPosition:maxDistance:
{
  float32x4_t v9 = [a1 currentFrame];
  v10 = [v9 camera];
  uint64_t v11 = [v10 trackingState];

  if (v11 == 2)
  {
    double v12 = float2ToPoint(a3);
    double v14 = v13;
    v15 = [a1 currentFrame];
    v16 = objc_msgSend(v15, "raycastQueryFromPoint:allowingTarget:alignment:", 2, 2, v12, v14);

    v17 = [a1 raycast:v16];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __85__ARSession_SmartRaycast__smartRaycastResultForImagePoint_assetPosition_maxDistance___block_invoke;
    v26[3] = &unk_1E6DD79D8;
    v26[4] = a1;
    v26[5] = a2;
    float v27 = a5;
    uint64_t v18 = [v17 indexOfObjectPassingTest:v26];
    if (v18 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v19 = 0;
    }
    else
    {
      uint64_t v20 = v18;
      v21 = [ASVRealHitTestResult alloc];
      v22 = [v17 objectAtIndexedSubscript:v20];
      [a1 cameraPosition];
      v19 = [(ASVRealHitTestResult *)v21 initWithRaycastResult:v22 imagePoint:*(double *)&a3 assetPosition:a4 cameraPosition:v23];
    }
  }
  else
  {
    v19 = 0;
  }
  return v19;
}

@end