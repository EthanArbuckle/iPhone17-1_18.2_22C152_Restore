@interface ARFrame(ARFrame_SmartHitTest)
- (ASVRealHitTestResult)smartHitTestResultForImagePoint:()ARFrame_SmartHitTest assetPosition:maxDistance:;
- (__n128)cameraPosition;
- (float)hitTestResultDistanceFromCamera:()ARFrame_SmartHitTest;
- (uint64_t)hitTestResult:()ARFrame_SmartHitTest isPlaneOfType:;
@end

@implementation ARFrame(ARFrame_SmartHitTest)

- (__n128)cameraPosition
{
  v1 = [a1 camera];
  [v1 transform];
  long long v4 = v2;

  return (__n128)v4;
}

- (uint64_t)hitTestResult:()ARFrame_SmartHitTest isPlaneOfType:
{
  id v5 = a3;
  if ([v5 type] == a4)
  {
    v6 = [v5 anchor];
    uint64_t v7 = [v6 isMemberOfClass:objc_opt_class()];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (float)hitTestResultDistanceFromCamera:()ARFrame_SmartHitTest
{
  [a3 worldPosition];
  float32x4_t v9 = v4;
  [a1 cameraPosition];
  float32x4_t v6 = vsubq_f32(v9, v5);
  float32x4_t v7 = vmulq_f32(v6, v6);
  return sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v7, 2), vaddq_f32(v7, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v7.f32, 1))).f32[0]);
}

- (ASVRealHitTestResult)smartHitTestResultForImagePoint:()ARFrame_SmartHitTest assetPosition:maxDistance:
{
  double v7 = float2ToPoint(*(float32x2_t *)&a2);
  double v9 = v8;
  v10 = objc_msgSend(a1, "hitTest:types:", 32);
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __91__ARFrame_ARFrame_SmartHitTest__smartHitTestResultForImagePoint_assetPosition_maxDistance___block_invoke;
  v33[3] = &unk_1E6DD7498;
  v33[4] = a1;
  float v34 = a4;
  uint64_t v11 = [v10 indexOfObjectPassingTest:v33];
  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = objc_msgSend(a1, "hitTest:types:", 16, v7, v9);
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __91__ARFrame_ARFrame_SmartHitTest__smartHitTestResultForImagePoint_assetPosition_maxDistance___block_invoke_2;
    v31[3] = &unk_1E6DD7498;
    v31[4] = a1;
    float v32 = a4;
    uint64_t v13 = [v12 indexOfObjectPassingTest:v31];
    if (v13 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v14 = objc_msgSend(a1, "hitTest:types:", 2, v7, v9);
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __91__ARFrame_ARFrame_SmartHitTest__smartHitTestResultForImagePoint_assetPosition_maxDistance___block_invoke_3;
      v29[3] = &unk_1E6DD7498;
      v29[4] = a1;
      float v30 = a4;
      uint64_t v15 = [v14 indexOfObjectPassingTest:v29];
      if (v15 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v16 = 0;
      }
      else
      {
        uint64_t v23 = v15;
        v24 = [ASVRealHitTestResult alloc];
        v25 = [v14 objectAtIndexedSubscript:v23];
        [a1 cameraPosition];
        v16 = [(ASVRealHitTestResult *)v24 initWithHitTestResult:v25 imagePoint:a2 assetPosition:a3 cameraPosition:v26];
      }
    }
    else
    {
      uint64_t v20 = v13;
      v21 = [ASVRealHitTestResult alloc];
      v14 = [v12 objectAtIndexedSubscript:v20];
      [a1 cameraPosition];
      v16 = [(ASVRealHitTestResult *)v21 initWithHitTestResult:v14 imagePoint:a2 assetPosition:a3 cameraPosition:v22];
    }
  }
  else
  {
    uint64_t v17 = v11;
    v18 = [ASVRealHitTestResult alloc];
    v12 = [v10 objectAtIndexedSubscript:v17];
    [a1 cameraPosition];
    v16 = [(ASVRealHitTestResult *)v18 initWithHitTestResult:v12 imagePoint:a2 assetPosition:a3 cameraPosition:v19];
  }

  return v16;
}

@end