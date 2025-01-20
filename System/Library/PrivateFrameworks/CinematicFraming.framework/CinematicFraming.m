void sub_1DD5871E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_1DD5879F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1DD5882D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD588934(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD588DEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD5890D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD5892C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD589650(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD58977C(_Unwind_Exception *a1)
{
  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1DD58986C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD5898C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)VCProcessor;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
}

void sub_1DD589F74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_1DD58A684(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD58AA30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

float32x2_t warpPoint(uint64_t a1, uint64_t a2, float32x2_t a3)
{
  float32x2_t v4 = *(float32x2_t *)(a1 + 16);
  v4.i32[1] = HIDWORD(*(void *)(a1 + 32));
  float32x2_t v5 = *(float32x2_t *)(a1 + 48);
  float32x2_t v6 = *(float32x2_t *)a1;
  float32x2_t v7 = vmla_f32(vneg_f32(v5), *(float32x2_t *)a1, a3);
  float32x2_t v8 = vmul_f32(v7, v7);
  v8.f32[0] = vaddv_f32(v8) * 0.25;
  float32x2_t v9 = vdiv_f32(vadd_f32(v5, vmla_n_f32(v7, vsub_f32(vmul_f32(v7, vdiv_f32(vmul_f32(v4, v4), vmla_f32(vneg_f32((float32x2_t)vdup_lane_s32((int32x2_t)v8, 0)), v4, v4))), v7), COERCE_FLOAT(*(void *)(a1 + 344)))), *(float32x2_t *)a1);
  if (*(unsigned char *)(a1 + 256))
  {
    float32x2_t v10 = vmul_f32(v6, v9);
    float32x2_t v11 = *(float32x2_t *)(a1 + 264);
    float32x2_t v12 = vsub_f32(v10, v11);
    float v13 = vaddv_f32(vmul_f32(v12, v12));
    if (sqrtf(v13) <= (float)*(int *)(a1 + 308))
    {
      float v14 = v13 * *(float *)(a1 + 112);
      float32x2_t v9 = vdiv_f32(vadd_f32(v11, vmul_n_f32(v12, 1.0/ (float)((float)((float)(*(float *)(a1 + 312)+ (float)((float)(*(float *)(a1 + 316)+ (float)((float)(*(float *)(a1 + 320)+ (float)((float)(*(float *)(a1 + 324)+ (float)((float)(*(float *)(a1 + 328) + (float)((float)(*(float *)(a1 + 332) + (float)((float)(*(float *)(a1 + 336) + (float)((float)(*(float *)(a1 + 340) + (float)(v14 * 0.0)) * v14)) * v14)) * v14))* v14))* v14))* v14))* v14))* 0.01)+ 1.0))), v6);
    }
    else
    {
      float32x2_t v9 = (float32x2_t)vdup_n_s32(0x7FC00000u);
    }
  }
  float32x2_t v15 = vmul_f32(v6, v9);
  float32x4_t v16 = vaddq_f32(*(float32x4_t *)(a1 + 96), vmlaq_lane_f32(vmulq_n_f32(*(float32x4_t *)(a1 + 64), v15.f32[0]), *(float32x4_t *)(a1 + 80), v15, 1));
  float32x4_t v17 = vaddq_f32(*(float32x4_t *)(a1 + 240), vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(*(float32x4_t *)(a1 + 192), v16.f32[0]), *(float32x4_t *)(a1 + 208), *(float32x2_t *)v16.f32, 1), *(float32x4_t *)(a1 + 224), v16, 2));
  float32x4_t v18 = vaddq_f32(*(float32x4_t *)(a2 + 176), vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(*(float32x4_t *)(a2 + 128), v17.f32[0]), *(float32x4_t *)(a2 + 144), *(float32x2_t *)v17.f32, 1), *(float32x4_t *)(a2 + 160), v17, 2));
  float32x4_t v19 = *(float32x4_t *)(a2 + 16);
  float32x4_t v20 = *(float32x4_t *)(a2 + 48);
  int32x4_t v21 = (int32x4_t)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v19, v18.f32[0]), *(float32x4_t *)(a2 + 32), *(float32x2_t *)v18.f32, 1), v20, v18, 2);
  float32x2_t v22 = *(float32x2_t *)a2;
  float32x2_t v23 = vdiv_f32(vdiv_f32(*(float32x2_t *)v21.i8, (float32x2_t)vdup_laneq_s32(v21, 2)), *(float32x2_t *)a2);
  if (*(unsigned char *)(a2 + 256))
  {
    float32x2_t v24 = vmul_f32(v22, v23);
    float32x2_t v25 = *(float32x2_t *)(a2 + 264);
    float32x2_t v26 = vsub_f32(v24, v25);
    float v27 = vaddv_f32(vmul_f32(v26, v26));
    if (sqrtf(v27) <= (float)*(int *)(a2 + 272))
    {
      float v28 = v27 * *(float *)(a2 + 112);
      float32x2_t v23 = vdiv_f32(vadd_f32(v25, vmul_n_f32(v26, 1.0/ (float)((float)((float)(*(float *)(a2 + 276)+ (float)((float)(*(float *)(a2 + 280)+ (float)((float)(*(float *)(a2 + 284)+ (float)((float)(*(float *)(a2 + 288)+ (float)((float)(*(float *)(a2 + 292) + (float)((float)(*(float *)(a2 + 296) + (float)((float)(*(float *)(a2 + 300) + (float)((float)(*(float *)(a2 + 304) + (float)(v28 * 0.0)) * v28)) * v28)) * v28))* v28))* v28))* v28))* v28))* 0.01)+ 1.0))), v22);
    }
    else
    {
      float32x2_t v23 = (float32x2_t)vdup_n_s32(0x7FC00000u);
    }
  }
  v19.i32[1] = HIDWORD(*(void *)(a2 + 32));
  float32x2_t v34 = *(float32x2_t *)v19.f32;
  long long v35 = *(_OWORD *)(a2 + 48);
  float32x2_t v29 = vmla_f32(vneg_f32(*(float32x2_t *)v20.f32), v22, v23);
  v23.f32[0] = sqrtf(vaddv_f32(vmul_f32(v29, v29)));
  float32x2_t v30 = (float32x2_t)vdup_lane_s32((int32x2_t)v23, 0);
  LODWORD(v31) = v23.i32[0];
  HIDWORD(v31) = v23.i32[0];
  simd_float4 v32 = _simd_atan2_f4((simd_float4)v31, (simd_float4)v19.u64[0]);
  *(float32x2_t *)v32.f32 = vmul_f32(*(float32x2_t *)v32.f32, (float32x2_t)0x3F0000003F000000);
  return vdiv_f32(vadd_f32(*(float32x2_t *)&v35, vmla_n_f32(v29, vsub_f32(vmul_f32(v29, vdiv_f32(vmul_f32(vadd_f32(v34, v34), (float32x2_t)*(_OWORD *)&_simd_tan_f4(v32)), v30)), v29), COERCE_FLOAT(*(void *)(a2 + 344)))), v22);
}

void sub_1DD58AED0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD58B094(_Unwind_Exception *a1)
{
  float32x2_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1DD58B1A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1DD58B370(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD58B4C4(_Unwind_Exception *a1)
{
  float32x2_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1DD58B72C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double zRotationForOrientation(int a1, int a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0.0;
  }
  uint64_t v2 = 0;
  if (a2) {
    int v3 = 4;
  }
  else {
    int v3 = 3;
  }
  if (a2) {
    int v4 = 3;
  }
  else {
    int v4 = 4;
  }
  v8[0] = v3;
  v8[1] = 1;
  v8[2] = v4;
  v8[3] = 2;
  do
    int v5 = v8[v2++];
  while (v5 != a1);
  double result = (double)((int)v2 - 1) * 1.57079633;
  *(float *)&double result = result;
  if (*(float *)&result > 3.14159265)
  {
    float v7 = *(float *)&result + -6.28318531;
    *(float *)&double result = v7;
  }
  return result;
}

void sub_1DD58BB94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t isViewFrustumContained(VCCamera *a1, VCCamera *a2, float a3)
{
  int v5 = a1;
  float32x2_t v6 = a2;
  uint64_t v7 = 0;
  float32x2_t v8 = (float32x2_t)vdup_lane_s32((int32x2_t)COERCE_UNSIGNED_INT(a3 + 0.0), 0);
  float32x2_t v9 = (float32x2_t)vdup_lane_s32((int32x2_t)COERCE_UNSIGNED_INT(1.0 - a3), 0);
  LOBYTE(v10) = 1;
  do
  {
    float32x2_t v11 = warpPoint((uint64_t)[(VCCamera *)v5 model], (uint64_t)[(VCCamera *)v6 model], (float32x2_t)qword_1DD5AD010[v7]);
    uint32x2_t v12 = (uint32x2_t)vand_s8((int8x8_t)vcge_f32(v11, v8), (int8x8_t)vcge_f32(v9, v11));
    uint64_t v10 = v10 & (vpmin_u32(v12, v12).i32[0] < 0);
    if ([(VCCamera *)v6 hasGeometricDistortionCalibration]
      && [(VCCamera *)v6 geometricDistortionCalibrationMaxRadius] >= 1)
    {
      [(VCCamera *)v6 sensorSize];
      float32x2_t v14 = v13;
      [(VCCamera *)v6 geometricDistortionCenter];
      float32x2_t v16 = v15;
      int v17 = [(VCCamera *)v6 geometricDistortionCalibrationMaxRadius];
      float32x2_t v18 = vsub_f32(vmul_f32(v11, v14), v16);
      if (sqrtf(vaddv_f32(vmul_f32(v18, v18))) < (float)v17) {
        uint64_t v10 = v10;
      }
      else {
        uint64_t v10 = 0;
      }
    }
    ++v7;
  }
  while (v7 != 8);

  return v10;
}

void sub_1DD58BF60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD58C47C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD58C5DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD58C794(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD58C91C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD58CA84(_Unwind_Exception *a1)
{
  uint64_t v7 = v6;

  _Unwind_Resume(a1);
}

void sub_1DD58CDB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD58D1C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1DD58D5A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1DD58D9C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_1DD58DAFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD58DD2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

float ApplyMotionConstraints(float result, float a2, float a3)
{
  if (a2 >= result) {
    double result = a2;
  }
  if (result >= a3) {
    return a3;
  }
  return result;
}

float CombineMotionConstraints(float result, double a2, float a3)
{
  if (result <= a3) {
    return a3;
  }
  return result;
}

float ComputeSizeVelocityConstraints(void *a1)
{
  id v1 = a1;
  [v1 zoomInSpeedMultiplier];
  float v3 = v2 * -0.3;
  [v1 zoomOutSpeedMultiplier];

  return v3;
}

float ComputeSizeFrameEdgeConstraints@<S0>(void *a1@<X0>, uint64_t a2@<X8>, CGFloat a3@<D0>, CGFloat a4@<D1>, CGFloat a5@<D2>, CGFloat a6@<D3>)
{
  id v11 = a1;
  [v11 zoomAccelerationMultiplier];
  double v13 = v12 * 0.425;
  CGRectGetVerticalRightMargin(a3, a4, a5, a6);
  double v15 = v14;
  CGRectGetRightMargin(a3, a4, a5, a6);
  double v17 = v16 + v16;
  double LeftMargin = CGRectGetLeftMargin(a3, a4, a5, a6);
  if (v17 >= LeftMargin + LeftMargin) {
    double v19 = CGRectGetLeftMargin(a3, a4, a5, a6);
  }
  else {
    CGRectGetRightMargin(a3, a4, a5, a6);
  }
  float v20 = v13;
  if (v15 >= v19 + v19)
  {
    CGRectGetRightMargin(a3, a4, a5, a6);
    double v23 = v22 + v22;
    double v24 = CGRectGetLeftMargin(a3, a4, a5, a6);
    if (v23 >= v24 + v24) {
      double v25 = CGRectGetLeftMargin(a3, a4, a5, a6);
    }
    else {
      CGRectGetRightMargin(a3, a4, a5, a6);
    }
    double v21 = v25 + v25;
  }
  else
  {
    CGRectGetVerticalRightMargin(a3, a4, a5, a6);
  }
  float v26 = v21;
  v48.origin.x = a3;
  v48.origin.y = a4;
  v48.size.width = a5;
  v48.size.height = a6;
  CGRectGetWidth(v48);
  v49.origin.x = a3;
  v49.origin.y = a4;
  v49.size.width = a5;
  v49.size.height = a6;
  CGRectGetWidth(v49);
  v50.origin.x = a3;
  v50.origin.y = a4;
  v50.size.width = a5;
  v50.size.height = a6;
  float Width = CGRectGetWidth(v50);
  float v28 = (float)(v26 + v26) * v20;
  if (v28 < 0.0) {
    float v28 = 0.0;
  }
  float v29 = sqrtf(v28);
  if (v29 > 100000000.0) {
    float v29 = 100000000.0;
  }
  float v30 = (float)(Width + Width) * v20;
  if (v30 < 0.0) {
    float v30 = 0.0;
  }
  float v31 = sqrtf(v30);
  if (v31 > 100000000.0) {
    float v31 = 100000000.0;
  }
  *(float *)a2 = -v20;
  *(float *)(a2 + 4) = v20;
  *(float *)(a2 + 8) = -v31;
  *(float *)(a2 + 12) = v29;
  *(void *)(a2 + 16) = 0x4CBEBC20CCBEBC20;
  [v11 viewportMinimumFOV];
  float v47 = v32;

  v51.origin.x = a3;
  v51.origin.y = a4;
  v51.size.width = a5;
  v51.size.height = a6;
  CGFloat v33 = CGRectGetMidX(v51) * -2.0 + 2.0;
  v52.origin.x = a3;
  v52.origin.y = a4;
  v52.size.width = a5;
  v52.size.height = a6;
  CGFloat MidX = CGRectGetMidX(v52);
  CGFloat v35 = MidX + MidX;
  v53.origin.x = a3;
  v53.origin.y = a4;
  v53.size.width = a5;
  v53.size.height = a6;
  CGFloat v36 = CGRectGetMidX(v53);
  double v37 = v36 * -2.0 + 2.0;
  double v38 = v36 + v36;
  if (v33 >= v35) {
    double v39 = v38;
  }
  else {
    double v39 = v37;
  }
  v54.origin.x = a3;
  v54.origin.y = a4;
  v54.size.width = a5;
  v54.size.height = a6;
  if (v39 >= 1.0 - CGRectGetMinY(v54))
  {
    v58.origin.x = a3;
    v58.origin.y = a4;
    v58.size.width = a5;
    v58.size.height = a6;
    double v44 = 1.0 - CGRectGetMinY(v58);
  }
  else
  {
    v55.origin.x = a3;
    v55.origin.y = a4;
    v55.size.width = a5;
    v55.size.height = a6;
    CGFloat v40 = CGRectGetMidX(v55) * -2.0 + 2.0;
    v56.origin.x = a3;
    v56.origin.y = a4;
    v56.size.width = a5;
    v56.size.height = a6;
    CGFloat v41 = CGRectGetMidX(v56);
    CGFloat v42 = v41 + v41;
    v57.origin.x = a3;
    v57.origin.y = a4;
    v57.size.width = a5;
    v57.size.height = a6;
    double v43 = CGRectGetMidX(v57);
    if (v40 >= v42) {
      double v44 = v43 + v43;
    }
    else {
      double v44 = v43 * -2.0 + 2.0;
    }
  }
  float v45 = logf(v47);
  float result = log(v44);
  *(float *)(a2 + 16) = v45;
  *(float *)(a2 + 20) = result;
  return result;
}

float ComputeSizeEaseInAccelerationConstraintsForVelocityAndDisplacement(void *a1, float a2, float a3)
{
  id v5 = a1;
  [v5 zoomEaseInCurveB];
  float v7 = v6;
  [v5 zoomEaseInCurveA];
  float v9 = v8;
  [v5 zoomEaseInCurveB];
  [v5 zoomEaseInCurveA];
  float v10 = fabsf(a2);
  if (a3 >= 0.0) {
    float v11 = -100000000.0;
  }
  else {
    float v11 = -(float)(v7 - (float)((float)(fabsf(sqrtf(v10)) * a3) * v9));
  }
  [v5 zoomAccelerationMultiplier];
  float v13 = v11 * v12;
  [v5 zoomAccelerationMultiplier];

  return v13;
}

float ComputeXVelocityConstraints(void *a1, double a2, double a3, double a4)
{
  double v4 = a4 / 3.0;
  [a1 horizontalSpeedMultiplier];
  float v6 = v4 * v5;
  return -v6;
}

float ComputeYVelocityConstraints(void *a1, double a2, double a3, double a4, double a5)
{
  double v5 = a5 / 3.0;
  [a1 verticalSpeedMultiplier];
  float v7 = v5 * v6;
  return -v7;
}

float ComputeXFrameEdgeConstraints@<S0>(void *a1@<X0>, uint64_t a2@<X8>, CGFloat a3@<D0>, CGFloat a4@<D1>, CGFloat a5@<D2>, CGFloat a6@<D3>, CGFloat a7@<D4>, CGFloat a8@<D5>, CGFloat a9@<D6>, CGFloat a10@<D7>)
{
  [a1 horizontalAccelerationMultiplier];
  float v39 = v19;
  v41.origin.x = a3;
  v41.origin.y = a4;
  v41.size.width = a5;
  CGFloat rect = a6;
  v41.size.height = a6;
  double MinX = CGRectGetMinX(v41);
  v42.origin.x = a7;
  v42.origin.y = a8;
  v42.size.width = a9;
  v42.size.height = a10;
  BOOL v21 = MinX - CGRectGetMinX(v42) < 0.0;
  float v22 = 0.0;
  if (!v21)
  {
    v43.origin.x = a3;
    v43.origin.y = a4;
    v43.size.width = a5;
    v43.size.height = rect;
    double v23 = CGRectGetMinX(v43);
    v44.origin.x = a7;
    v44.origin.y = a8;
    v44.size.width = a9;
    v44.size.height = a10;
    float v24 = v23 - CGRectGetMinX(v44);
    float v22 = (float)(v24 * 100.0) + (float)(v24 * 100.0);
  }
  float v38 = v22;
  v45.origin.x = a7;
  v45.origin.y = a8;
  v45.size.width = a9;
  v45.size.height = a10;
  double MaxX = CGRectGetMaxX(v45);
  v46.origin.x = a3;
  v46.origin.y = a4;
  v46.size.width = a5;
  v46.size.height = rect;
  CGFloat v26 = CGRectGetMaxX(v46);
  float v27 = 0.0;
  if (MaxX - v26 >= 0.0)
  {
    v47.origin.x = a7;
    v47.origin.y = a8;
    v47.size.width = a9;
    v47.size.height = a10;
    double v28 = CGRectGetMaxX(v47);
    v48.origin.x = a3;
    v48.origin.y = a4;
    v48.size.width = a5;
    v48.size.height = rect;
    float v29 = v28 - CGRectGetMaxX(v48);
    float v27 = (float)(v29 * 100.0) + (float)(v29 * 100.0);
  }
  float v30 = a5 * 0.6 * v39;
  float v31 = v27 * v30;
  BOOL v21 = (float)(v27 * v30) < 0.0;
  float v32 = 0.0;
  if (v21) {
    float v31 = 0.0;
  }
  float v33 = sqrtf(v31);
  if (v33 > 100000000.0) {
    float v33 = 100000000.0;
  }
  if ((float)(v38 * v30) >= 0.0) {
    float v32 = v38 * v30;
  }
  float v34 = sqrtf(v32);
  if (v34 > 100000000.0) {
    float v34 = 100000000.0;
  }
  *(float *)a2 = -v30;
  *(float *)(a2 + 4) = v30;
  *(float *)(a2 + 8) = -v34;
  *(float *)(a2 + 12) = v33;
  *(void *)(a2 + 16) = 0x4CBEBC20CCBEBC20;
  v49.origin.x = a7;
  v49.origin.y = a8;
  v49.size.width = a9;
  v49.size.height = a10;
  CGFloat v35 = a5 * 0.5;
  float v36 = v35 + CGRectGetMinX(v49);
  v50.origin.x = a7;
  v50.origin.y = a8;
  v50.size.width = a9;
  v50.size.height = a10;
  float result = CGRectGetMaxX(v50) - v35;
  *(float *)(a2 + 16) = v36;
  *(float *)(a2 + 20) = result;
  return result;
}

float ComputeYFrameEdgeConstraints@<S0>(void *a1@<X0>, uint64_t a2@<X8>, CGFloat a3@<D0>, CGFloat a4@<D1>, CGFloat a5@<D2>, CGFloat a6@<D3>, CGFloat a7@<D4>, CGFloat a8@<D5>, CGFloat a9@<D6>, CGFloat a10@<D7>)
{
  [a1 verticalAccelerationMultiplier];
  float v38 = v19;
  v40.origin.x = a3;
  v40.origin.y = a4;
  v40.size.width = a5;
  double rect = a6;
  v40.size.height = a6;
  double MinY = CGRectGetMinY(v40);
  v41.origin.x = a7;
  v41.origin.y = a8;
  v41.size.width = a9;
  v41.size.height = a10;
  BOOL v21 = MinY - CGRectGetMinY(v41) < 0.0;
  float v22 = 0.0;
  if (!v21)
  {
    v42.origin.x = a3;
    v42.origin.y = a4;
    v42.size.width = a5;
    v42.size.height = rect;
    double v23 = CGRectGetMinY(v42);
    v43.origin.x = a7;
    v43.origin.y = a8;
    v43.size.width = a9;
    v43.size.height = a10;
    float v24 = v23 - CGRectGetMinY(v43);
    float v22 = (float)(v24 * 10000.0) + (float)(v24 * 10000.0);
  }
  float v37 = v22;
  v44.origin.x = a7;
  v44.origin.y = a8;
  v44.size.width = a9;
  v44.size.height = a10;
  double MaxY = CGRectGetMaxY(v44);
  v45.origin.x = a3;
  v45.origin.y = a4;
  v45.size.width = a5;
  v45.size.height = rect;
  CGFloat v26 = CGRectGetMaxY(v45);
  float v27 = 0.0;
  if (MaxY - v26 >= 0.0)
  {
    v46.origin.x = a7;
    v46.origin.y = a8;
    v46.size.width = a9;
    v46.size.height = a10;
    double v28 = CGRectGetMaxY(v46);
    v47.origin.x = a3;
    v47.origin.y = a4;
    v47.size.width = a5;
    v47.size.height = rect;
    float v29 = v28 - CGRectGetMaxY(v47);
    float v27 = (float)(v29 * 10000.0) + (float)(v29 * 10000.0);
  }
  float v30 = a5 * 0.6 * v38;
  float v31 = v27 * v30;
  BOOL v21 = (float)(v27 * v30) < 0.0;
  float v32 = 0.0;
  if (v21) {
    float v31 = 0.0;
  }
  float v33 = sqrtf(v31);
  if (v33 > 100000000.0) {
    float v33 = 100000000.0;
  }
  if ((float)(v37 * v30) >= 0.0) {
    float v32 = v37 * v30;
  }
  float v34 = sqrtf(v32);
  if (v34 > 100000000.0) {
    float v34 = 100000000.0;
  }
  *(float *)a2 = -v30;
  *(float *)(a2 + 4) = v30;
  *(float *)(a2 + 8) = -v34;
  *(float *)(a2 + 12) = v33;
  *(void *)(a2 + 16) = 0x4CBEBC20CCBEBC20;
  v48.origin.x = a7;
  v48.origin.y = a8;
  v48.size.width = a9;
  v48.size.height = a10;
  float v35 = CGRectGetMinY(v48);
  v49.origin.x = a7;
  v49.origin.y = a8;
  v49.size.width = a9;
  v49.size.height = a10;
  float result = CGRectGetMaxY(v49) - rect;
  *(float *)(a2 + 16) = v35;
  *(float *)(a2 + 20) = result;
  return result;
}

float ComputeXEaseInAccelerationConstraintsForVelocityAndDisplacement(void *a1, float a2, float a3, float a4)
{
  id v7 = a1;
  [v7 xEaseInCurveB];
  float v9 = v8;
  [v7 xEaseInCurveA];
  float v11 = v10;

  float v12 = fabsf(a2 / a4);
  if ((float)(a3 / a4) >= 0.0) {
    float v13 = -100000000.0;
  }
  else {
    float v13 = -(float)(v9 - (float)((float)((float)(a3 / a4) * fabsf(sqrtf(v12))) * v11));
  }
  return v13 * a4;
}

float ComputeYEaseInAccelerationConstraintsForVelocityAndDisplacement(void *a1, float a2, float a3, float a4)
{
  id v7 = a1;
  [v7 yEaseInCurveB];
  float v9 = v8;
  [v7 yEaseInCurveA];
  float v11 = v10;

  float v12 = fabsf(a2 / a4);
  if ((float)(a3 / a4) >= 0.0) {
    float v13 = -100000000.0;
  }
  else {
    float v13 = -(float)(v9 - (float)((float)((float)(a3 / a4) * fabsf(sqrtf(v12))) * v11));
  }
  return v13 * a4;
}

float PlistReadFloat(void *a1, void *a2, float a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = [v5 objectForKey:v6];

  if (v7)
  {
    float v8 = [v5 objectForKeyedSubscript:v6];
    [v8 floatValue];
    a3 = v9;
  }
  return a3;
}

void _estimateGaussianWeights(int a1, float *a2, float a3)
{
  float v3 = (float)(a3 * a3) + (float)(a3 * a3);
  if (v3 >= 0.00000011921) {
    float v4 = 1.0 / v3;
  }
  else {
    float v4 = 8388600.0;
  }
  int v5 = a1 - 1;
  if (a1 < 1) {
    int v5 = a1;
  }
  if ((a1 & 0x80000000) == 0)
  {
    id v6 = a2;
    int v7 = v5 >> 1;
    int v8 = -(v5 >> 1);
    if (v5 >> 1 >= 0) {
      int v9 = v5 >> 1;
    }
    else {
      int v9 = -v7;
    }
    float v10 = 0.0;
    int v11 = -(v5 >> 1);
    float v12 = a2;
    do
    {
      int v13 = v8;
      do
      {
        float v14 = expf(-(float)((float)((float)(v11 * v11) + (float)(v13 * v13)) * v4));
        *v12++ = v14;
        float v10 = v10 + v14;
        ++v13;
      }
      while (v9 + 1 != v13);
      BOOL v15 = v11++ == v9;
    }
    while (!v15);
    do
    {
      int v16 = v7 + v9 + 1;
      do
      {
        *id v6 = *v6 / v10;
        ++v6;
        --v16;
      }
      while (v16);
      BOOL v15 = v8++ == v9;
    }
    while (!v15);
  }
}

void sub_1DD593E50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void _getLineToRectIntersectionPoints(int8x8_t *a1, float32x2_t a2, float32x2_t a3, double a4, double a5, double a6, double a7)
{
  v12.f32[0] = a4;
  __int32 v21 = v12.i32[0];
  float32_t v13 = a5;
  v12.f32[1] = v13;
  v14.f32[0] = a4 + a6;
  float32x2_t v18 = v12;
  __int32 v19 = v14.i32[0];
  v14.f32[1] = v13;
  float32x2_t v17 = v14;
  *a1 = _getlineToLineIntersectionPoint(a2, a3, v12, v14);
  *(float *)&unsigned int v15 = a5 + a7;
  unsigned int v16 = v15;
  float32x2_t v20 = (float32x2_t)__PAIR64__(v15, v19);
  a1[1] = _getlineToLineIntersectionPoint(a2, a3, v17, v20);
  float32x2_t v22 = (float32x2_t)__PAIR64__(v16, v21);
  a1[2] = _getlineToLineIntersectionPoint(a2, a3, v20, v22);
  a1[3] = _getlineToLineIntersectionPoint(a2, a3, v22, v18);
}

__n64 simd_matrix3x3(float32x4_t a1)
{
  _Q2 = a1;
  _S3 = a1.i32[1];
  _S4 = a1.i32[2];
  __asm { FMLS            S0, S4, V2.S[2] }
  _S6 = _Q2.i32[3];
  __asm { FMLA            S0, S6, V2.S[3] }
  float v9 = vmlas_n_f32(vmuls_lane_f32(a1.f32[2], _Q2, 3), a1.f32[1], _Q2.f32[0]);
  __asm
  {
    FMLA            S5, S3, V2.S[1]
    FMLA            S5, S6, V2.S[3]
    FMLS            S5, S2, V2.S[0]
    FMLA            S18, S4, V2.S[1]
    FMLA            S6, S4, V2.S[2]
    FMLS            S6, S2, V2.S[0]
    FMLS            S6, S3, V2.S[1]
  }
  result.n64_f32[1] = v9 + v9;
  return result;
}

void __destructor_8_s0_s8_s32(uint64_t a1)
{
  float v2 = *(void **)(a1 + 32);
}

int8x8_t _getlineToLineIntersectionPoint(float32x2_t a1, float32x2_t a2, float32x2_t a3, float32x2_t a4)
{
  LODWORD(v4) = vsub_f32(a1, a3).u32[0];
  float v5 = a3.f32[1];
  float32x2_t v6 = vsub_f32(a3, a4);
  float v7 = -(float)(a1.f32[1] - v5);
  float v8 = vmlas_n_f32(v7 * v6.f32[0], v6.f32[1], v4);
  float32x2_t v9 = vsub_f32(a1, a2);
  v6.f32[0] = vmlas_n_f32((float)-v9.f32[1] * v6.f32[0], v6.f32[1], v9.f32[0]);
  float v10 = v8 / v6.f32[0];
  float v11 = vmlas_n_f32(v7 * v9.f32[0], v9.f32[1], v4) / v6.f32[0];
  BOOL v14 = v10 > 1.0 || v10 < 0.0 || v11 < 0.0 || v11 > 1.0;
  float32x2_t v15 = vsub_f32(a2, a1);
  if (v14) {
    unsigned int v16 = 0;
  }
  else {
    unsigned int v16 = -1;
  }
  return vbsl_s8((int8x8_t)vdup_n_s32(v16), (int8x8_t)vmla_n_f32(a1, v15, v10), (int8x8_t)vdup_n_s32(0x7F7FFFFFu));
}

double CGRectSafeIntersection(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  CGFloat MinX = CGRectGetMinX(*(CGRect *)&a1);
  v25.origin.x = a5;
  v25.origin.y = a6;
  v25.size.width = a7;
  v25.size.height = a8;
  double v16 = fmax(MinX, CGRectGetMinX(v25));
  v26.origin.x = a1;
  v26.origin.y = a2;
  v26.size.width = a3;
  v26.size.height = a4;
  float v17 = fmin(v16, CGRectGetMaxX(v26));
  *(float *)&CGFloat MinX = v17;
  v27.origin.x = a1;
  v27.origin.y = a2;
  v27.size.width = a3;
  v27.size.height = a4;
  double MinY = CGRectGetMinY(v27);
  v28.size.height = a8;
  v28.origin.x = a5;
  v28.origin.y = a6;
  v28.size.width = a7;
  fmax(MinY, CGRectGetMinY(v28));
  v29.origin.x = a1;
  v29.origin.y = a2;
  v29.size.width = a3;
  v29.size.height = a4;
  CGRectGetMaxY(v29);
  v30.origin.x = a1;
  v30.origin.y = a2;
  v30.size.width = a3;
  v30.size.height = a4;
  double MaxX = CGRectGetMaxX(v30);
  v31.origin.x = a5;
  v31.origin.y = a6;
  v31.size.width = a7;
  v31.size.height = a8;
  fmin(MaxX, CGRectGetMaxX(v31));
  v32.origin.x = a1;
  v32.origin.y = a2;
  v32.size.width = a3;
  v32.size.height = a4;
  CGRectGetMinX(v32);
  v33.origin.x = a1;
  v33.origin.y = a2;
  v33.size.width = a3;
  v33.size.height = a4;
  CGRectGetMaxY(v33);
  v34.origin.x = a5;
  v34.origin.y = a6;
  v34.size.width = a7;
  v34.size.height = a8;
  CGRectGetMaxY(v34);
  v35.origin.x = a1;
  v35.origin.y = a2;
  v35.size.width = a3;
  v35.size.height = a4;
  CGRectGetMinY(v35);
  return *(float *)&MinX;
}

float ComputeSizeToFitSubjectsInDeadband(float result, double a2, double _D2, double a4, double a5, double _D5, double a7)
{
  *(float *)&a7 = vmlas_n_f32(*(float *)&a4, result, *(float *)&_D2);
  float v8 = *((float *)&a2 + 1);
  float v9 = *((float *)&_D2 + 1);
  __asm { FMLS            S5, S0, V2.S[1] }
  v13.f32[0] = fmaxf(*(float *)&a2, *(float *)&a7);
  v13.i32[1] = fminf(*((float *)&a2 + 1), *(float *)&_D5);
  _NF = *(float *)&_D5 < *(float *)&a2;
  float32x2_t v14 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)&_D5, 0);
  if (!_NF) {
    float32x2_t v14 = v13;
  }
  double v15 = COERCE_DOUBLE(vdup_lane_s32(*(int32x2_t *)&a7, 0));
  if (*((float *)&a2 + 1) < *(float *)&a7)
  {
    float v9 = *((float *)&_D2 + 1);
    *(double *)&float32x2_t v14 = v15;
  }
  double v16 = 1.0 - *(float *)&_D2;
  _D7 = result * (v16 - v9) + 0.001;
  if (_D7 <= vsub_f32((float32x2_t)vdup_lane_s32((int32x2_t)v14, 1), v14).f32[0])
  {
    __asm { FMLS            S7, S0, V2.S[1] }
    _NF = *(float *)&_D7 < *(float *)&a2;
    v18.f32[0] = fmaxf(*(float *)&a2, *(float *)&a7);
    v18.i32[1] = fminf(*((float *)&a2 + 1), *(float *)&_D7);
    double v19 = COERCE_DOUBLE(vdup_lane_s32(*(int32x2_t *)&_D7, 0));
    double v20 = COERCE_DOUBLE(vdup_lane_s32(*(int32x2_t *)&a7, 0));
    if (_NF) {
      *(double *)&float32x2_t v18 = v19;
    }
    float v21 = *((float *)&_D2 + 1);
    _NF = *((float *)&a2 + 1) < *(float *)&a7;
    if (*((float *)&a2 + 1) < *(float *)&a7) {
      *(double *)&float32x2_t v18 = v20;
    }
    float32x2_t v23 = (float32x2_t)vdup_lane_s32((int32x2_t)v18, 1);
    if (!_NF) {
      float v21 = *((float *)&_D2 + 1);
    }
    float32x2_t v24 = vsub_f32(v23, v18);
    double v25 = v16 - v21;
    __n64 result = v24.f32[0] / v25;
    *(float *)&double v16 = *(float *)&a4 + (float)(result * *(float *)&_D2);
    *(float *)&double v20 = *((float *)&a4 + 1) - (float)(result * v21);
    _NF = *(float *)&v20 < *(float *)&a2;
    *(float *)&double v26 = fmaxf(*(float *)&a2, *(float *)&v16);
    HIDWORD(v26) = fminf(*((float *)&a2 + 1), *(float *)&v20);
    double v27 = COERCE_DOUBLE(vdup_lane_s32(*(int32x2_t *)&v20, 0));
    if (!_NF) {
      double v27 = v26;
    }
    double v28 = COERCE_DOUBLE(vdup_lane_s32(*(int32x2_t *)&v16, 0));
    if (*((float *)&a2 + 1) < *(float *)&v16) {
      *(double *)&float32x2_t v29 = v28;
    }
    else {
      *(double *)&float32x2_t v29 = v27;
    }
    if (fabsf(vsub_f32(vsub_f32((float32x2_t)vdup_lane_s32((int32x2_t)v29, 1), v29), v24).f32[0]) >= 0.001)
    {
      LODWORD(v30) = vdiv_f32(vsub_f32(*(float32x2_t *)&a2, *(float32x2_t *)&a4), *(float32x2_t *)&_D2).u32[0];
      float v31 = (float)(*((float *)&a4 + 1) - *((float *)&a2 + 1)) / v21;
      float v32 = fmaxf(v30, v31);
      *(float *)&double v28 = *(float *)&a4 + (float)(v32 * *(float *)&_D2);
      *(float *)v7.i32 = *((float *)&a4 + 1) - (float)(v32 * v21);
      _NF = *(float *)v7.i32 < *(float *)&a2;
      *(float *)&double v33 = fmaxf(*(float *)&a2, *(float *)&v28);
      HIDWORD(v33) = fminf(*((float *)&a2 + 1), *(float *)v7.i32);
      double v34 = COERCE_DOUBLE(vdup_lane_s32(v7, 0));
      if (!_NF) {
        double v34 = v33;
      }
      double v35 = COERCE_DOUBLE(vdup_lane_s32(*(int32x2_t *)&v28, 0));
      if (*((float *)&a2 + 1) < *(float *)&v28) {
        *(double *)&float32x2_t v36 = v35;
      }
      else {
        *(double *)&float32x2_t v36 = v34;
      }
      double v37 = vsub_f32((float32x2_t)vdup_lane_s32((int32x2_t)v36, 1), v36).f32[0];
      if (v30 < v31)
      {
        float v38 = *(float *)&_D2;
      }
      else
      {
        float v30 = (float)(*((float *)&a4 + 1) - *((float *)&a2 + 1)) / v21;
        float v38 = v21;
      }
      if (v32 * v25 + 0.001 > v37)
      {
        float v39 = v38;
      }
      else
      {
        float v30 = v32;
        float v39 = *(float *)&_D2 + v21;
      }
      *(float *)&_D2 = *(float *)&a4 + (float)(v30 * *(float *)&_D2);
      *(float *)&a4 = *((float *)&a4 + 1) - (float)(v30 * v21);
      _NF = *(float *)&a4 < *(float *)&a2;
      *(float *)&a2 = fmaxf(*(float *)&a2, *(float *)&_D2);
      HIDWORD(a2) = fminf(*((float *)&a2 + 1), *(float *)&a4);
      double v41 = COERCE_DOUBLE(vdup_lane_s32(*(int32x2_t *)&a4, 0));
      if (_NF) {
        a2 = v41;
      }
      double v42 = COERCE_DOUBLE(vdup_lane_s32(*(int32x2_t *)&_D2, 0));
      if (v8 < *(float *)&_D2) {
        a2 = v42;
      }
      float v43 = (vsub_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)&a2, 1), *(float32x2_t *)&a2).f32[0] - v30 * v25)
          / (v25 + v39);
      return v30 + v43;
    }
  }
  return result;
}

float DetermineNewDeadbandMinComponent(double a1, double a2, double _D2, float a4, float _S4)
{
  float v5 = *(float *)&a1;
  double v6 = vaddv_f32(*(float32x2_t *)&a1) * 0.5;
  double v7 = _S4 * 0.5;
  *(float *)&a1 = v6 - v7;
  float v8 = v6 + v7;
  double v9 = *((float *)&a2 + 1);
  double v10 = v8 + 0.001;
  if (*(float *)&a2 + 0.001 <= *(float *)&a1)
  {
    if (v10 > v9) {
      *(float *)&a1 = fmaxf(*((float *)&a2 + 1) - (float)(v8 - *(float *)&a1), *(float *)&a2);
    }
  }
  else if (v10 <= v9)
  {
    *(float *)&a1 = fminf(*((float *)&a2 + 1) - (float)(v8 - *(float *)&a1), *(float *)&a2);
  }
  float v11 = *(float *)&a1 + _S4;
  double v12 = *((float *)&a1 + 1);
  double v13 = (float)(*(float *)&a1 + _S4) + 0.001;
  if (v5 + 0.001 <= *(float *)&a1)
  {
    if (v13 > v12) {
      *(float *)&a1 = fmaxf(*((float *)&a1 + 1) - (float)(v11 - *(float *)&a1), v5);
    }
  }
  else if (v13 <= v12)
  {
    *(float *)&a1 = fminf(*((float *)&a1 + 1) - (float)(v11 - *(float *)&a1), v5);
  }
  float v14 = vmlas_n_f32(a4, _S4, *(float *)&_D2);
  __asm { FMLS            S3, S4, V2.S[1] }
  float v20 = *(float *)&a1 + _S4;
  double v21 = _S3;
  double v22 = v20 + 0.001;
  if (v14 + 0.001 <= *(float *)&a1)
  {
    if (v22 > v21) {
      *(float *)&a1 = fmaxf(_S3 - (float)(v20 - *(float *)&a1), v14);
    }
  }
  else if (v22 <= v21)
  {
    *(float *)&a1 = fminf(_S3 - (float)(v20 - *(float *)&a1), v14);
  }
  return *(float *)&a1;
}

uint64_t PixelFormatIs420(int a1)
{
  uint64_t result = 1;
  if (a1 > 792229423)
  {
    if (a1 <= 875704437)
    {
      if (a1 == 792229424) {
        return result;
      }
      int v3 = 875704422;
      goto LABEL_14;
    }
    if (a1 != 875704438 && a1 != 2084070960)
    {
      int v3 = 2084075056;
LABEL_14:
      if (a1 != v3) {
        return 0;
      }
    }
  }
  else
  {
    if (a1 <= 758670895)
    {
      if (a1 == 641230384) {
        return result;
      }
      int v3 = 641234480;
      goto LABEL_14;
    }
    if (a1 != 758670896 && a1 != 758674992)
    {
      int v3 = 792225328;
      goto LABEL_14;
    }
  }
  return result;
}

uint64_t cachedTexturesFromPixelBuffer(__CVBuffer *a1, uint64_t a2, __CVMetalTextureCache *a3)
{
  v28[1] = *MEMORY[0x1E4F143B8];
  CVMetalTextureRef image = 0;
  if (!a1 || !a2)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    CFDictionaryRef v7 = 0;
    uint64_t v8 = 4294954516;
    goto LABEL_41;
  }
  *(_DWORD *)a2 = 0;
  signed int PixelFormatType = CVPixelBufferGetPixelFormatType(a1);
  CFDictionaryRef v7 = 0;
  uint64_t v8 = 4294954514;
  if (PixelFormatType > 792229423)
  {
    if (PixelFormatType <= 875704437)
    {
      if (PixelFormatType == 792229424) {
        goto LABEL_17;
      }
      int v9 = 875704422;
    }
    else
    {
      if (PixelFormatType == 875704438 || PixelFormatType == 2084075056) {
        goto LABEL_17;
      }
      int v9 = 2084070960;
    }
  }
  else if (PixelFormatType <= 758670895)
  {
    if (PixelFormatType == 641230384) {
      goto LABEL_17;
    }
    int v9 = 641234480;
  }
  else
  {
    if (PixelFormatType == 758670896 || PixelFormatType == 758674992) {
      goto LABEL_17;
    }
    int v9 = 792225328;
  }
  if (PixelFormatType != v9) {
    goto LABEL_41;
  }
LABEL_17:
  unsigned int WidthOfPlane = CVPixelBufferGetWidthOfPlane(a1, 0);
  unsigned int HeightOfPlane = CVPixelBufferGetHeightOfPlane(a1, 0);
  uint64_t v12 = *MEMORY[0x1E4F24C88];
  uint64_t v27 = *MEMORY[0x1E4F24C88];
  v28[0] = &unk_1F38CCC00;
  CFDictionaryRef v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
  CFAllocatorRef v13 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  if (CVMetalTextureCacheCreateTextureFromImage((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a3, a1, v7, MTLPixelFormatR8Unorm, WidthOfPlane, HeightOfPlane, 0, &image)|| (CVMetalTextureGetTexture(image), uint64_t v14 = objc_claimAutoreleasedReturnValue(), v15 = *(void **)(a2 + 8), *(void *)(a2 + 8) = v14, v15, !*(void *)(a2 + 8)))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    uint64_t v8 = 4294954510;
    goto LABEL_41;
  }
  ++*(_DWORD *)a2;
  if (image) {
    CFRelease(image);
  }
  signed int v16 = CVPixelBufferGetPixelFormatType(a1);
  uint64_t v8 = 4294954514;
  if (v16 > 792229423)
  {
    if (v16 <= 875704437)
    {
      if (v16 == 792229424) {
        goto LABEL_35;
      }
      int v17 = 875704422;
    }
    else
    {
      if (v16 == 875704438 || v16 == 2084075056) {
        goto LABEL_35;
      }
      int v17 = 2084070960;
    }
LABEL_34:
    if (v16 != v17) {
      goto LABEL_41;
    }
    goto LABEL_35;
  }
  if (v16 <= 758670895)
  {
    if (v16 == 641230384) {
      goto LABEL_35;
    }
    int v17 = 641234480;
    goto LABEL_34;
  }
  if (v16 != 758670896 && v16 != 758674992)
  {
    int v17 = 792225328;
    goto LABEL_34;
  }
LABEL_35:
  unsigned int v18 = CVPixelBufferGetWidthOfPlane(a1, 1uLL);
  unsigned int v19 = CVPixelBufferGetHeightOfPlane(a1, 1uLL);
  uint64_t v25 = v12;
  double v26 = &unk_1F38CCC00;
  CFDictionaryRef v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];

  if (CVMetalTextureCacheCreateTextureFromImage(v13, a3, a1, v20, MTLPixelFormatRG8Unorm, v18, v19, 1uLL, &image)
    || (CVMetalTextureGetTexture(image),
        uint64_t v21 = objc_claimAutoreleasedReturnValue(),
        double v22 = *(void **)(a2 + 16),
        *(void *)(a2 + 16) = v21,
        v22,
        !*(void *)(a2 + 16)))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    uint64_t v8 = 4294954510;
  }
  else
  {
    ++*(_DWORD *)a2;
    if (image) {
      CFRelease(image);
    }
    uint64_t v8 = 0;
  }
  CFDictionaryRef v7 = v20;
LABEL_41:

  return v8;
}

uint64_t computeNumberOfCCWRotationsFromInputToFramingSpaceForCameraOrientation(int a1, int a2, int a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 4;
  }
  uint64_t v3 = 0;
  if (a2) {
    int v4 = 4;
  }
  else {
    int v4 = 3;
  }
  if (a2) {
    int v5 = 3;
  }
  else {
    int v5 = 4;
  }
  v10[0] = v4;
  v10[1] = 2;
  v10[2] = v5;
  v10[3] = 1;
  do
    int v6 = v10[v3++];
  while (v6 != a1);
  int v7 = v3 - 1;
  if (a3) {
    int v8 = v3 - 1;
  }
  else {
    int v8 = v3 + 1;
  }
  if (!a2) {
    int v8 = v7;
  }
  return (4 - v8);
}

double rotatePointCCW(int a1, double a2, double a3)
{
  if (a1)
  {
    float v5 = (double)a1 * 1.57079633;
    __float2 v6 = __sincosf_stret(v5 * 0.5);
    float32x4_t v7 = vmulq_n_f32((float32x4_t)xmmword_1DD5ACF90, v6.__sinval);
    float32x4_t v8 = v7;
    v8.i32[3] = LODWORD(v6.__cosval);
    float v9 = a2;
    float v10 = a3;
    float32x4_t v11 = vmulq_f32(v8, (float32x4_t)xmmword_1DD5AD000);
    int32x4_t v12 = (int32x4_t)vnegq_f32(v11);
    int8x16_t v13 = (int8x16_t)vtrn2q_s32((int32x4_t)v11, vtrn1q_s32((int32x4_t)v11, v12));
    float32x4_t v14 = vmlaq_n_f32(vmulq_n_f32((float32x4_t)vextq_s8((int8x16_t)v11, (int8x16_t)v12, 8uLL), v10), (float32x4_t)vextq_s8(v13, v13, 8uLL), v9);
    float32x4_t v15 = (float32x4_t)vrev64q_s32((int32x4_t)v11);
    v15.i32[0] = v12.i32[1];
    v15.i32[3] = v12.i32[2];
    float32x4_t v16 = vmlaq_f32(v14, (float32x4_t)0, v15);
    int32x4_t v17 = (int32x4_t)vnegq_f32(v16);
    int8x16_t v18 = (int8x16_t)vtrn2q_s32((int32x4_t)v16, vtrn1q_s32((int32x4_t)v16, v17));
    float32x4_t v19 = vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v16, (int8x16_t)v17, 8uLL), *(float32x2_t *)v7.f32, 1), (float32x4_t)vextq_s8(v18, v18, 8uLL), v7.f32[0]);
    float32x4_t v20 = (float32x4_t)vrev64q_s32((int32x4_t)v16);
    v20.i32[0] = v17.i32[1];
    v20.i32[3] = v17.i32[2];
    return vaddq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(v16, v8, 3), v20, v7, 2), v19).f32[0];
  }
  return a2;
}

CGFloat rotateRectCCW(int a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  if (a1)
  {
    float v9 = (double)a1 * 1.57079633;
    __float2 v10 = __sincosf_stret(v9 * 0.5);
    float32x4_t v11 = vmulq_n_f32((float32x4_t)xmmword_1DD5ACF90, v10.__sinval);
    float32x4_t v55 = v11;
    v11.i32[3] = LODWORD(v10.__cosval);
    float32x4_t v54 = v11;
    *(CGFloat *)v11.i64 = a2;
    CGFloat v12 = a3;
    CGFloat v13 = a4;
    CGFloat v14 = a5;
    double MinX = CGRectGetMinX(*(CGRect *)v11.f32);
    v56.origin.x = a2;
    v56.origin.y = a3;
    v56.size.width = a4;
    v56.size.height = a5;
    double MaxX = CGRectGetMaxX(v56);
    v57.origin.x = a2;
    v57.origin.y = a3;
    v57.size.width = a4;
    v57.size.height = a5;
    double MinY = CGRectGetMinY(v57);
    v58.origin.x = a2;
    v58.origin.y = a3;
    v58.size.width = a4;
    v58.size.height = a5;
    CGFloat MaxY = CGRectGetMaxY(v58);
    float v19 = MinX;
    float v20 = MinY;
    float32x4_t v21 = vmulq_f32(v54, (float32x4_t)xmmword_1DD5AD000);
    int32x4_t v22 = (int32x4_t)vnegq_f32(v21);
    int8x16_t v23 = (int8x16_t)vtrn2q_s32((int32x4_t)v21, vtrn1q_s32((int32x4_t)v21, v22));
    float32x4_t v24 = (float32x4_t)vextq_s8(v23, v23, 8uLL);
    float32x4_t v25 = (float32x4_t)vextq_s8((int8x16_t)v21, (int8x16_t)v22, 8uLL);
    float32x4_t v26 = vmulq_n_f32(v25, v20);
    float32x4_t v27 = (float32x4_t)vrev64q_s32((int32x4_t)v21);
    v27.i32[0] = v22.i32[1];
    v27.i32[3] = v22.i32[2];
    float32x4_t v28 = vmlaq_f32(vmlaq_n_f32(v26, v24, v19), (float32x4_t)0, v27);
    int32x4_t v29 = (int32x4_t)vnegq_f32(v28);
    int8x16_t v30 = (int8x16_t)vtrn2q_s32((int32x4_t)v28, vtrn1q_s32((int32x4_t)v28, v29));
    float32x4_t v31 = (float32x4_t)vrev64q_s32((int32x4_t)v28);
    v31.i32[0] = v29.i32[1];
    v31.i32[3] = v29.i32[2];
    float32x4_t v32 = vaddq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(v28, v54, 3), v31, v55, 2), vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v28, (int8x16_t)v29, 8uLL), *(float32x2_t *)v55.f32, 1), (float32x4_t)vextq_s8(v30, v30, 8uLL), v55.f32[0]));
    *(float *)v29.i32 = MaxX;
    float32x4_t v33 = vmlaq_f32(vmlaq_n_f32(v26, v24, *(float *)v29.i32), (float32x4_t)0, v27);
    int32x4_t v34 = (int32x4_t)vnegq_f32(v33);
    int8x16_t v35 = (int8x16_t)vtrn2q_s32((int32x4_t)v33, vtrn1q_s32((int32x4_t)v33, v34));
    float32x4_t v36 = (float32x4_t)vrev64q_s32((int32x4_t)v33);
    v36.i32[0] = v34.i32[1];
    v36.i32[3] = v34.i32[2];
    float32x4_t v37 = vaddq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(v33, v54, 3), v36, v55, 2), vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v33, (int8x16_t)v34, 8uLL), *(float32x2_t *)v55.f32, 1), (float32x4_t)vextq_s8(v35, v35, 8uLL), v55.f32[0]));
    *(float *)&CGFloat MaxY = MaxY;
    float32x4_t v38 = vmulq_n_f32(v25, *(float *)&MaxY);
    float32x4_t v39 = vmlaq_f32(vmlaq_n_f32(v38, v24, v19), (float32x4_t)0, v27);
    int32x4_t v40 = (int32x4_t)vnegq_f32(v39);
    int8x16_t v41 = (int8x16_t)vtrn2q_s32((int32x4_t)v39, vtrn1q_s32((int32x4_t)v39, v40));
    float32x4_t v42 = vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v39, (int8x16_t)v40, 8uLL), *(float32x2_t *)v55.f32, 1), (float32x4_t)vextq_s8(v41, v41, 8uLL), v55.f32[0]);
    float32x4_t v43 = (float32x4_t)vrev64q_s32((int32x4_t)v39);
    v43.i32[0] = v40.i32[1];
    v43.i32[3] = v40.i32[2];
    float32x4_t v44 = vaddq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(v39, v54, 3), v43, v55, 2), v42);
    float32x4_t v45 = vmlaq_f32(vmlaq_n_f32(v38, v24, *(float *)v29.i32), (float32x4_t)0, v27);
    int32x4_t v46 = (int32x4_t)vnegq_f32(v45);
    int8x16_t v47 = (int8x16_t)vtrn2q_s32((int32x4_t)v45, vtrn1q_s32((int32x4_t)v45, v46));
    float32x4_t v48 = vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v45, (int8x16_t)v46, 8uLL), *(float32x2_t *)v55.f32, 1), (float32x4_t)vextq_s8(v47, v47, 8uLL), v55.f32[0]);
    float32x4_t v49 = (float32x4_t)vrev64q_s32((int32x4_t)v45);
    v49.i32[0] = v46.i32[1];
    v49.i32[3] = v46.i32[2];
    float32x4_t v50 = vaddq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(v45, v54, 3), v49, v55, 2), v48);
    v32.i32[3] = 0;
    v37.i32[3] = 0;
    float32x4_t v51 = vminnmq_f32(v32, v37);
    v44.i32[3] = 0;
    v50.i32[3] = 0;
    v51.i32[3] = 0;
    float32x4_t v52 = vminnmq_f32(v44, v50);
    v52.i32[3] = 0;
    return vminnmq_f32(v51, v52).f32[0];
  }
  return a2;
}

double rotateRectInImageCCW(int a1, double a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  double v8 = a2;
  if (a1)
  {
    int v9 = a1;
    double MinX = CGRectGetMinX(*(CGRect *)&a2);
    v28.origin.x = v8;
    v28.origin.y = a3;
    v28.size.width = a4;
    v28.size.height = a5;
    double MaxX = CGRectGetMaxX(v28);
    v29.origin.x = v8;
    v29.origin.y = a3;
    v29.size.width = a4;
    v29.size.height = a5;
    double MinY = CGRectGetMinY(v29);
    v30.origin.x = v8;
    v30.origin.y = a3;
    v30.size.width = a4;
    v30.size.height = a5;
    double MaxY = CGRectGetMaxY(v30);
    if (v9 < 1)
    {
      double v16 = MinX;
      double v19 = MaxX;
    }
    else
    {
      int v14 = v9;
      double v15 = MinY;
      double v16 = MinX;
      do
      {
        double v17 = v16;
        double v16 = v15;
        double v15 = 1.0 - v17;
        --v14;
      }
      while (v14);
      int v18 = v9;
      double v19 = MaxX;
      do
      {
        double v20 = v19;
        double v19 = MinY;
        double MinY = 1.0 - v20;
        --v18;
      }
      while (v18);
      int v21 = v9;
      double v22 = MaxY;
      do
      {
        double v23 = MinX;
        double MinX = v22;
        double v22 = 1.0 - v23;
        --v21;
      }
      while (v21);
      do
      {
        double v24 = MaxX;
        double MaxX = MaxY;
        double MaxY = 1.0 - v24;
        --v9;
      }
      while (v9);
    }
    if (MinX >= MaxX) {
      double v25 = MaxX;
    }
    else {
      double v25 = MinX;
    }
    if (v16 >= v19) {
      double v26 = v19;
    }
    else {
      double v26 = v16;
    }
    if (v26 >= v25) {
      return v25;
    }
    else {
      return v26;
    }
  }
  return v8;
}

float32x2_t distortPoint(float32x2_t *a1, float32x2_t a2)
{
  float32x2_t v2 = a1[9];
  float32x2_t v3 = vsub_f32(a2, v2);
  float v4 = a1[10].f32[0] * vaddv_f32(vmul_f32(v3, v3));
  return vmla_n_f32(v2, v3, 1.0/ (float)((float)((float)(a1[15].f32[0]+ (float)((float)(a1[15].f32[1]+ (float)((float)(a1[16].f32[0]+ (float)((float)(a1[16].f32[1]+ (float)((float)(a1[17].f32[0]+ (float)((float)(a1[17].f32[1] + (float)((float)(a1[18].f32[0] + (float)(a1[18].f32[1] * v4)) * v4)) * v4))* v4))* v4))* v4))* v4))* 0.01)+ 1.0));
}

float32x2_t undistortPoint(float32x2_t *a1, float32x2_t a2)
{
  float32x2_t v3 = a1[9];
  float32x2_t v4 = vsub_f32(a2, v3);
  float32x2_t v5 = *a1;
  int v6 = (int)COERCE_FLOAT(*a1);
  if (v6 >= 0) {
    int v7 = (int)COERCE_FLOAT(*a1);
  }
  else {
    int v7 = v6 + 1;
  }
  LODWORD(v8) = HIDWORD(*(unint64_t *)a1);
  v9.i32[0] = (int)COERCE_FLOAT(*a1);
  v9.i32[1] = (int)v5.f32[1];
  int v10 = a1[10].i32[1];
  float32x2_t v11 = vmul_f32(vcvt_f32_s32(v9), (float32x2_t)0x3F0000003F000000);
  float32x2_t v12 = vmul_f32(v11, v11);
  v12.f32[0] = sqrtf(vaddv_f32(v12));
  int v13 = (int)(float)(v12.f32[0] - (float)v10);
  int v14 = v7 >> 1;
  if (v12.f32[0] <= (float)v10) {
    int v13 = 0;
  }
  BOOL v15 = __OFSUB__(v14, v10);
  int v16 = v14 - v10;
  if ((v16 < 0) ^ v15 | (v16 == 0)) {
    int v16 = v13;
  }
  else {
    LODWORD(v8) = HIDWORD(*(unint64_t *)a1);
  }
  float v17 = vsub_f32(v5, v3).f32[0] - (float)v16;
  if (v17 <= (float)(v3.f32[0] - (float)v16)) {
    float v17 = v3.f32[0] - (float)v16;
  }
  float v18 = v8 - v3.f32[1];
  if (v18 <= v3.f32[1]) {
    LODWORD(v18) = HIDWORD(*(void *)&a1[9]);
  }
  if (v17 > v18) {
    float v18 = v17;
  }
  float v19 = vaddv_f32(vmul_f32(v4, v4));
  v12.f32[0] = sqrtf(v19);
  if (v12.f32[0] > v18)
  {
    float32x2_t v4 = vmul_n_f32(vdiv_f32(v4, (float32x2_t)vdup_lane_s32((int32x2_t)v12, 0)), v18);
    float v19 = vaddv_f32(vmul_f32(v4, v4));
  }
  float v20 = a1[10].f32[0] * v19;
  return vmla_n_f32(v3, v4, 1.0/ (float)((float)((float)(a1[11].f32[0]+ (float)((float)(a1[11].f32[1]+ (float)((float)(a1[12].f32[0]+ (float)((float)(a1[12].f32[1]+ (float)((float)(a1[13].f32[0]+ (float)((float)(a1[13].f32[1] + (float)((float)(a1[14].f32[0] + (float)(a1[14].f32[1] * v20)) * v20)) * v20))* v20))* v20))* v20))* v20))* 0.01)+ 1.0));
}

uint64_t isCinematicFramingFrontCamera(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:*MEMORY[0x1E4F52E10]]) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = [v1 isEqualToString:*MEMORY[0x1E4F52DF8]];
  }

  return v2;
}

uint64_t isCinematicFramingAllowedCamera(void *a1)
{
  id v1 = a1;
  if (([v1 isEqualToString:*MEMORY[0x1E4F52E10]] & 1) != 0
    || ([v1 isEqualToString:*MEMORY[0x1E4F52DF8]] & 1) != 0
    || ([v1 isEqualToString:*MEMORY[0x1E4F52DD8]] & 1) != 0)
  {
    uint64_t v2 = 1;
  }
  else
  {
    uint64_t v2 = [v1 isEqualToString:*MEMORY[0x1E4F52DE8]];
  }

  return v2;
}

uint64_t isDeskCamAllowedCamera(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:*MEMORY[0x1E4F52E10]]) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = [v1 isEqualToString:*MEMORY[0x1E4F52DE8]];
  }

  return v2;
}

BOOL _isRectAlmostEqual(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8, float a9)
{
  CGRect v27 = CGRectIntersection(*(CGRect *)&a1, *(CGRect *)&a5);
  float v24 = v27.size.width * v27.size.height;
  if (v24 == 0.0) {
    return 0;
  }
  v28.origin.x = a1;
  v28.origin.y = a2;
  v28.size.width = a3;
  v28.size.height = a4;
  v30.origin.x = a5;
  v30.origin.y = a6;
  v30.size.width = a7;
  v30.size.height = a8;
  CGRect v29 = CGRectUnion(v28, v30);
  *(float *)&v29.origin.x = v29.size.width * v29.size.height;
  return (float)(v24 / *(float *)&v29.origin.x) >= a9;
}

id getVisionCoreProcessingDescriptorClass()
{
  uint64_t v4 = 0;
  float32x2_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getVisionCoreProcessingDescriptorClass_softClass;
  uint64_t v7 = getVisionCoreProcessingDescriptorClass_softClass;
  if (!getVisionCoreProcessingDescriptorClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getVisionCoreProcessingDescriptorClass_block_invoke;
    v3[3] = &unk_1E6CCF870;
    v3[4] = &v4;
    __getVisionCoreProcessingDescriptorClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1DD5A0498(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getVisionCoreInferenceNetworkIdentifierCamGaze()
{
  uint64_t v4 = 0;
  float32x2_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  v0 = (void **)getVisionCoreInferenceNetworkIdentifierCamGazeSymbolLoc_ptr;
  uint64_t v7 = getVisionCoreInferenceNetworkIdentifierCamGazeSymbolLoc_ptr;
  if (!getVisionCoreInferenceNetworkIdentifierCamGazeSymbolLoc_ptr)
  {
    id v1 = (void *)VisionCoreLibrary();
    v5[3] = (uint64_t)dlsym(v1, "VisionCoreInferenceNetworkIdentifierCamGaze");
    getVisionCoreInferenceNetworkIdentifierCamGazeSymbolLoc_ptr = v5[3];
    v0 = (void **)v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0) {
    getVisionCoreInferenceNetworkIdentifierCamGaze_cold_1();
  }
  uint64_t v2 = *v0;

  return v2;
}

void sub_1DD5A05A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t VisionCoreLibraryCore()
{
  if (!VisionCoreLibraryCore_frameworkLibrary) {
    VisionCoreLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return VisionCoreLibraryCore_frameworkLibrary;
}

uint64_t __VisionCoreLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  VisionCoreLibraryCore_frameworkLibrary = result;
  return result;
}

id getVisionCoreResourceVersionClass()
{
  uint64_t v4 = 0;
  float32x2_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getVisionCoreResourceVersionClass_softClass;
  uint64_t v7 = getVisionCoreResourceVersionClass_softClass;
  if (!getVisionCoreResourceVersionClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getVisionCoreResourceVersionClass_block_invoke;
    v3[3] = &unk_1E6CCF870;
    v3[4] = &v4;
    __getVisionCoreResourceVersionClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1DD5A0F00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getVisionCoreResourceVersionClass_block_invoke(uint64_t a1)
{
  VisionCoreLibrary();
  Class result = objc_getClass("VisionCoreResourceVersion");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getVisionCoreResourceVersionClass_block_invoke_cold_1();
  }
  getVisionCoreResourceVersionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t VisionCoreLibrary()
{
  id v1 = 0;
  uint64_t result = VisionCoreLibraryCore();
  if (!result) {
    VisionCoreLibrary_cold_1(&v1);
  }
  return result;
}

Class __getVisionCoreProcessingDescriptorClass_block_invoke(uint64_t a1)
{
  VisionCoreLibrary();
  Class result = objc_getClass("VisionCoreProcessingDescriptor");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getVisionCoreProcessingDescriptorClass_block_invoke_cold_1();
  }
  getVisionCoreProcessingDescriptorClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getVisionCoreInferenceNetworkIdentifierCamGazeSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)VisionCoreLibrary();
  Class result = dlsym(v2, "VisionCoreInferenceNetworkIdentifierCamGaze");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVisionCoreInferenceNetworkIdentifierCamGazeSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 24);
  return result;
}

float RectToState@<S0>(uint64_t a1@<X8>, CGFloat a2@<D0>, CGFloat a3@<D1>, CGFloat a4@<D2>, CGFloat a5@<D3>)
{
  float MinX = CGRectGetMinX(*(CGRect *)&a2);
  *(float *)a1 = MinX;
  v13.origin.x = a2;
  v13.origin.y = a3;
  v13.size.width = a4;
  v13.size.height = a5;
  float MinY = CGRectGetMinY(v13);
  *(float *)(a1 + 4) = MinY;
  v14.origin.x = a2;
  v14.origin.y = a3;
  v14.size.width = a4;
  v14.size.height = a5;
  float result = CGRectGetWidth(v14);
  *(float *)(a1 + 8) = result;
  *(void *)(a1 + 16) = 0;
  *(_DWORD *)(a1 + 12) = 0;
  return result;
}

__n128 PivotDescriptionsToState@<Q0>(void *a1@<X0>, uint64_t a2@<X8>, __n128 _Q0@<Q0>, __n128 a4@<Q1>, float _S2@<S2>, float a6@<S3>)
{
  _S9 = _S2;
  __n128 v25 = _Q0;
  unsigned __int32 v9 = _Q0.n128_u32[2];
  __asm { FMLS            S1, S2, V0.S[2] }
  *(_DWORD *)a2 = _S1;
  float v15 = _Q0.n128_f32[1];
  id v16 = a1;
  LODWORD(v17) = v9;
  [v16 getHeightForWidth:v17];
  *(_DWORD *)(a2 + 8) = v25.n128_u32[2];
  *(float *)(a2 + 4) = v15 - (float)(v18 * a6);
  _D1 = __PAIR64__(v25.n128_u32[1], a4.n128_u32[2]);
  __asm { FMLS            S0, S9, V2.S[2] }
  *(_DWORD *)(a2 + 12) = _S0;
  LODWORD(v21) = v9;
  objc_msgSend(v16, "getHeightDerivativeForWidth:widthDerivative:", v21, COERCE_DOUBLE(__PAIR64__(v25.n128_u32[1], a4.n128_u32[2])));
  float v23 = v22;

  *(float *)(a2 + 16) = a4.n128_f32[1] - (float)(v23 * a6);
  __n128 result = a4;
  *(_DWORD *)(a2 + 20) = a4.n128_u32[2];
  return result;
}

float ComputeTPivot(float a1, float a2, float a3, float a4, float a5)
{
  float v5 = a2 - a1;
  float v6 = a4 - a3;
  if (vabds_f32(v5, v6) >= 0.001)
  {
    float v7 = v5 - v6;
    float v8 = (float)(a3 - a1) / v7;
    a5 = 1.0;
    BOOL v9 = v8 >= 1.0 || v8 <= 0.0;
    float v10 = a1 - a3;
    float v11 = (float)(v10 + (float)(v7 * v8)) * (float)(v10 + (float)(v7 * v8));
    if (v9) {
      float v11 = *(float *)"(knN";
    }
    if ((float)((float)(v10 + (float)(v7 * 0.0)) * (float)(v10 + (float)(v7 * 0.0))) < v11)
    {
      float v8 = 0.0;
      float v11 = (float)(v10 + (float)(v7 * 0.0)) * (float)(v10 + (float)(v7 * 0.0));
    }
    if ((float)((float)(v10 + v7) * (float)(v10 + v7)) >= v11) {
      return v8;
    }
  }
  return a5;
}

uint64_t __filterTracksThatCanFitInView_block_invoke(uint64_t a1, void *a2, void *a3)
{
  long long v21 = *(_OWORD *)(a1 + 64);
  uint64_t v22 = *(void *)(a1 + 80);
  id v5 = a3;
  [a2 faceBoundingBoxForFramingAtTime:&v21];
  float v10 = distanceToViewport(v6, v7, v8, v9, *(CGFloat *)(a1 + 32), *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 48), *(CGFloat *)(a1 + 56));
  long long v21 = *(_OWORD *)(a1 + 64);
  uint64_t v22 = *(void *)(a1 + 80);
  [v5 faceBoundingBoxForFramingAtTime:&v21];
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;

  float v19 = distanceToViewport(v12, v14, v16, v18, *(CGFloat *)(a1 + 32), *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 48), *(CGFloat *)(a1 + 56));
  if (v10 < v19) {
    return -1;
  }
  else {
    return v10 != v19;
  }
}

float distanceToViewport(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  v28.origin.x = a5;
  v28.origin.y = a6;
  v28.size.width = a7;
  v28.size.height = a8;
  float MidX = CGRectGetMidX(v28);
  float v26 = MidX;
  double MaxX = MidX;
  v29.origin.x = a1;
  v29.origin.y = a2;
  v29.size.width = a3;
  v29.size.height = a4;
  double MinX = MaxX;
  if (CGRectGetMinX(v29) <= MaxX)
  {
    v30.origin.x = a1;
    v30.origin.y = a2;
    v30.size.width = a3;
    v30.size.height = a4;
    double MinX = CGRectGetMinX(v30);
  }
  v31.origin.x = a1;
  v31.origin.y = a2;
  v31.size.width = a3;
  v31.size.height = a4;
  if (MinX <= CGRectGetMaxX(v31))
  {
    v34.origin.x = a1;
    v34.origin.y = a2;
    v34.size.width = a3;
    v34.size.height = a4;
    double MaxX = CGRectGetMaxX(v34);
    CGFloat v17 = a8;
  }
  else
  {
    v32.origin.x = a1;
    v32.origin.y = a2;
    v32.size.width = a3;
    v32.size.height = a4;
    CGFloat v17 = a8;
    if (CGRectGetMinX(v32) <= MaxX)
    {
      v33.origin.x = a1;
      v33.origin.y = a2;
      v33.size.width = a3;
      v33.size.height = a4;
      double MaxX = CGRectGetMinX(v33);
    }
  }
  v35.origin.x = a5;
  v35.origin.y = a6;
  v35.size.width = a7;
  v35.size.height = v17;
  float MidY = CGRectGetMidY(v35);
  double MaxY = MidY;
  v36.origin.x = a1;
  v36.origin.y = a2;
  v36.size.width = a3;
  v36.size.height = a4;
  double MinY = MidY;
  if (CGRectGetMinY(v36) <= MidY)
  {
    v37.origin.x = a1;
    v37.origin.y = a2;
    v37.size.width = a3;
    v37.size.height = a4;
    double MinY = CGRectGetMinY(v37);
  }
  v38.origin.x = a1;
  v38.origin.y = a2;
  v38.size.width = a3;
  v38.size.height = a4;
  if (MinY <= CGRectGetMaxY(v38))
  {
    v41.origin.x = a1;
    v41.origin.y = a2;
    v41.size.width = a3;
    v41.size.height = a4;
    double MaxY = CGRectGetMaxY(v41);
    float v21 = v26;
  }
  else
  {
    v39.origin.x = a1;
    v39.origin.y = a2;
    v39.size.width = a3;
    v39.size.height = a4;
    float v21 = v26;
    if (CGRectGetMinY(v39) <= MaxY)
    {
      v40.origin.x = a1;
      v40.origin.y = a2;
      v40.size.width = a3;
      v40.size.height = a4;
      double MaxY = CGRectGetMinY(v40);
    }
  }
  float v22 = MaxX;
  float v23 = MaxY;
  return (float)((float)(MidY - v23) * (float)(MidY - v23)) + (float)((float)(v21 - v22) * (float)(v21 - v22));
}

void sub_1DD5A2E64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD5A2FB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1DD5A31A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t SpringAnimation<double,6ul>::update(uint64_t result, double a2, double a3, double a4, __n128 a5)
{
  a5.n128_f64[0] = a2;
  uint64_t v5 = result;
  if (a2 > 0.00833333333)
  {
    do
    {
      __n128 v36 = a5;
      __n128 result = SpringAnimation<double,6ul>::update(v5, 0.00833333333);
      a5.n128_u64[1] = v36.n128_u64[1];
      a5.n128_f64[0] = v36.n128_f64[0] + -0.00833333333;
    }
    while (v36.n128_f64[0] + -0.00833333333 > 0.00833333333);
  }
  uint64_t v6 = 0;
  long long v43 = 0u;
  long long v44 = 0u;
  CGFloat v7 = (_OWORD *)(v5 + 72);
  long long v42 = 0u;
  do
  {
    *(long long *)((char *)&v42 + v6) = (__int128)vsubq_f64(*(float64x2_t *)(v5 + v6 + 72), *(float64x2_t *)(v5 + v6 + 24));
    v6 += 16;
  }
  while (v6 != 48);
  uint64_t v8 = 0;
  double v9 = *(double *)v5;
  int64x2_t v10 = vdupq_lane_s64(COERCE__INT64(-*(double *)v5), 0);
  do
    v38[v8++] = v10;
  while (v8 != 3);
  uint64_t v11 = 0;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v39 = 0u;
  do
  {
    *(long long *)((char *)&v39 + v11 * 16) = (__int128)vmulq_f64((float64x2_t)v38[v11], *(float64x2_t *)((char *)&v42 + v11 * 16));
    ++v11;
  }
  while (v11 != 3);
  uint64_t v12 = 0;
  uint64_t v13 = *(uint64_t *)(v5 + 8);
  double v14 = sqrt(v9 * *(double *)&v13);
  int64x2_t v15 = vdupq_lane_s64(COERCE__INT64(-(*(double *)(v5 + 16) * (v14 + v14))), 0);
  do
    v37[v12++] = v15;
  while (v12 != 3);
  uint64_t v16 = 0;
  CGFloat v17 = (_OWORD *)(v5 + 120);
  memset(v38, 0, sizeof(v38));
  do
  {
    v38[v16] = vmulq_f64((float64x2_t)v37[v16], (float64x2_t)v17[v16]);
    ++v16;
  }
  while (v16 != 3);
  uint64_t v18 = 0;
  memset(v37, 0, sizeof(v37));
  do
  {
    v37[v18] = vaddq_f64(*(float64x2_t *)((char *)&v39 + v18 * 16), (float64x2_t)v38[v18]);
    ++v18;
  }
  while (v18 != 3);
  uint64_t v19 = 0;
  int64x2_t v20 = vdupq_lane_s64(v13, 0);
  do
  {
    *(long long *)((char *)&v39 + v19) = (__int128)v20;
    v19 += 16;
  }
  while (v19 != 48);
  uint64_t v21 = 0;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v42 = 0u;
  do
  {
    *(long long *)((char *)&v42 + v21 * 16) = (__int128)vdivq_f64((float64x2_t)v37[v21], *(float64x2_t *)((char *)&v39 + v21 * 16));
    ++v21;
  }
  while (v21 != 3);
  uint64_t v22 = 0;
  int64x2_t v23 = vdupq_lane_s64(a5.n128_i64[0], 0);
  do
    v38[v22++] = v23;
  while (v22 != 3);
  uint64_t v24 = 0;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v39 = 0u;
  do
  {
    *(long long *)((char *)&v39 + v24 * 16) = (__int128)vmulq_f64((float64x2_t)v38[v24], *(float64x2_t *)((char *)&v42 + v24 * 16));
    ++v24;
  }
  while (v24 != 3);
  for (uint64_t i = 0; i != 3; ++i)
    v17[i] = vaddq_f64(*(float64x2_t *)((char *)&v39 + i * 16), (float64x2_t)v17[i]);
  uint64_t v26 = 0;
  int64x2_t v27 = vdupq_lane_s64(a5.n128_i64[0], 0);
  do
    v38[v26++] = v27;
  while (v26 != 3);
  uint64_t v28 = 0;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v39 = 0u;
  do
  {
    *(long long *)((char *)&v39 + v28 * 16) = (__int128)vmulq_f64((float64x2_t)v38[v28], (float64x2_t)v17[v28]);
    ++v28;
  }
  while (v28 != 3);
  for (uint64_t j = 0; j != 3; ++j)
    v7[j] = vaddq_f64(*(float64x2_t *)((char *)&v39 + j * 16), (float64x2_t)v7[j]);
  uint64_t v30 = 0;
  *(double *)(v5 + 168) = a5.n128_f64[0] + *(double *)(v5 + 168);
  double v31 = 0.0;
  do
  {
    double v31 = v31 + *(double *)((char *)v37 + v30) * *(double *)((char *)v37 + v30);
    v30 += 8;
  }
  while (v30 != 48);
  uint64_t v32 = 0;
  double v33 = 0.0;
  double v34 = sqrt(v31);
  do
  {
    double v33 = v33 + *(double *)((char *)v17 + v32) * *(double *)((char *)v17 + v32);
    v32 += 8;
  }
  while (v32 != 48);
  if (v34 < 0.01 && sqrt(v33) < 0.01)
  {
    long long v35 = *(_OWORD *)(v5 + 40);
    *CGFloat v7 = *(_OWORD *)(v5 + 24);
    *(_OWORD *)(v5 + 88) = v35;
    *(_OWORD *)(v5 + 104) = *(_OWORD *)(v5 + 56);
    *CGFloat v17 = 0u;
    *(_OWORD *)(v5 + 136) = 0u;
    *(_OWORD *)(v5 + 152) = 0u;
    *(void *)(v5 + 168) = 0;
  }
  return result;
}

void sub_1DD5A36BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD5A3808(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double CGRectGetLeftMargin(double a1, double a2, double a3, double a4)
{
  if (CGRectGetMinX(*(CGRect *)&a1) < 0.0) {
    return 0.0;
  }
  double v9 = a1;
  double v10 = a2;
  double v11 = a3;
  double v12 = a4;

  return CGRectGetMinX(*(CGRect *)&v9);
}

void CGRectGetRightMargin(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  if (1.0 - CGRectGetMaxX(*(CGRect *)&a1) >= 0.0)
  {
    v8.origin.x = a1;
    v8.origin.y = a2;
    v8.size.width = a3;
    v8.size.height = a4;
    CGRectGetMaxX(v8);
  }
}

void CGRectGetVerticalRightMargin(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  if (1.0 - CGRectGetMaxY(*(CGRect *)&a1) >= 0.0)
  {
    v8.origin.x = a1;
    v8.origin.y = a2;
    v8.size.width = a3;
    v8.size.height = a4;
    CGRectGetMaxY(v8);
  }
}

id defaultCalibrationDictionaryForPennsylvania()
{
  if (defaultCalibrationDictionaryForPennsylvania_onceToken != -1) {
    dispatch_once(&defaultCalibrationDictionaryForPennsylvania_onceToken, &__block_literal_global);
  }
  v0 = (void *)defaultCalibrationDictionaryForPennsylvania_paCalibrationDictionary;

  return v0;
}

void __defaultCalibrationDictionaryForPennsylvania_block_invoke()
{
  v6[7] = *MEMORY[0x1E4F143B8];
  v5[0] = @"IntrinsicMatrixReferenceDimensions";
  v5[1] = @"PixelSize";
  v6[0] = &unk_1F38CCCF0;
  v6[1] = &unk_1F38CCDE0;
  v6[2] = &unk_1F38CCD18;
  v5[2] = @"LensDistortionCenter";
  v5[3] = @"IntrinsicMatrix";
  v0 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:&_block_invoke_intrinsicBytes length:48];
  v6[3] = v0;
  v5[4] = @"LensDistortionCoefficients";
  id v1 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:&_block_invoke_lensDistortionCoefficients length:32];
  v6[4] = v1;
  v5[5] = @"InverseLensDistortionCoefficients";
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:&_block_invoke_inverseLensDistortionCoefficients length:32];
  v5[6] = @"DistortionCalibrationValidMaxRadiusInPixels";
  v6[5] = v2;
  v6[6] = &unk_1F38CCC48;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:7];
  uint64_t v4 = (void *)defaultCalibrationDictionaryForPennsylvania_paCalibrationDictionary;
  defaultCalibrationDictionaryForPennsylvania_paCalibrationDictionary = v3;
}

id defaultCalibrationDictionaryForPictou()
{
  if (defaultCalibrationDictionaryForPictou_onceToken != -1) {
    dispatch_once(&defaultCalibrationDictionaryForPictou_onceToken, &__block_literal_global_50);
  }
  v0 = (void *)defaultCalibrationDictionaryForPictou_ptCalibrationDictionary;

  return v0;
}

void __defaultCalibrationDictionaryForPictou_block_invoke()
{
  v6[7] = *MEMORY[0x1E4F143B8];
  v5[0] = @"IntrinsicMatrixReferenceDimensions";
  v5[1] = @"PixelSize";
  v6[0] = &unk_1F38CCD40;
  v6[1] = &unk_1F38CCDE0;
  v6[2] = &unk_1F38CCD68;
  v5[2] = @"LensDistortionCenter";
  v5[3] = @"IntrinsicMatrix";
  v0 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:&_block_invoke_2_intrinsicBytes length:48];
  v6[3] = v0;
  v5[4] = @"LensDistortionCoefficients";
  id v1 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:&_block_invoke_2_lensDistortionCoefficients length:32];
  v6[4] = v1;
  v5[5] = @"InverseLensDistortionCoefficients";
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:&_block_invoke_2_inverseLensDistortionCoefficients length:32];
  v5[6] = @"DistortionCalibrationValidMaxRadiusInPixels";
  v6[5] = v2;
  v6[6] = &unk_1F38CCC78;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:7];
  uint64_t v4 = (void *)defaultCalibrationDictionaryForPictou_ptCalibrationDictionary;
  defaultCalibrationDictionaryForPictou_ptCalibrationDictionary = v3;
}

void sub_1DD5A7868(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double warpPointInputImageToFramingSpaceInLandscapeLeft(uint64_t a1, float32x2_t a2)
{
  float32x2_t v3 = vmul_f32(*(float32x2_t *)a1, a2);
  if (*(unsigned char *)(a1 + 64))
  {
    long long v4 = *(_OWORD *)(a1 + 112);
    v12[6] = *(_OWORD *)(a1 + 96);
    v12[7] = v4;
    long long v5 = *(_OWORD *)(a1 + 144);
    v12[8] = *(_OWORD *)(a1 + 128);
    v12[9] = v5;
    long long v6 = *(_OWORD *)(a1 + 48);
    v12[2] = *(_OWORD *)(a1 + 32);
    v12[3] = v6;
    long long v7 = *(_OWORD *)(a1 + 80);
    v12[4] = *(_OWORD *)(a1 + 64);
    v12[5] = v7;
    long long v8 = *(_OWORD *)(a1 + 16);
    v12[0] = *(_OWORD *)a1;
    v12[1] = v8;
    float32x2_t v3 = undistortPoint((float32x2_t *)v12, v3);
  }
  float v9 = (float)(v3.f32[1] - *(float *)(a1 + 40)) / *(float *)(a1 + 36);
  float v11 = atanf((float)(v3.f32[0] - COERCE_FLOAT(*(void *)(a1 + 24))) / COERCE_FLOAT(*(_OWORD *)(a1 + 16)));
  return COERCE_DOUBLE(__PAIR64__(COERCE_UNSIGNED_INT(atanf(v9)), LODWORD(v11)));
}

void getVisionCoreInferenceNetworkIdentifierCamGaze_cold_1()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"NSString *getVisionCoreInferenceNetworkIdentifierCamGaze(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SubjectSelectionSession.m", 32, @"%s", dlerror());

  __break(1u);
}

void __getVisionCoreResourceVersionClass_block_invoke_cold_1()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getVisionCoreResourceVersionClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SubjectSelectionSession.m", 31, @"Unable to find class %s", "VisionCoreResourceVersion");

  __break(1u);
}

void VisionCoreLibrary_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  float32x2_t v3 = [NSString stringWithUTF8String:"void *VisionCoreLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SubjectSelectionSession.m", 29, @"%s", *a1);

  __break(1u);
}

void __getVisionCoreProcessingDescriptorClass_block_invoke_cold_1()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getVisionCoreProcessingDescriptorClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SubjectSelectionSession.m", 30, @"Unable to find class %s", "VisionCoreProcessingDescriptor");

  __break(1u);
  CFPropertyListCreateDeepCopy(v2, v3, v4);
}

CFPropertyListRef CFPropertyListCreateDeepCopy(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFOptionFlags mutabilityOption)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7F28](allocator, propertyList, mutabilityOption);
}

void CFRelease(CFTypeRef cf)
{
}

CFDictionaryRef CGPointCreateDictionaryRepresentation(CGPoint point)
{
  return (CFDictionaryRef)MEMORY[0x1F40DB200]((__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1F40DB228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB230]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CFDictionaryRef CGRectCreateDictionaryRepresentation(CGRect a1)
{
  return (CFDictionaryRef)MEMORY[0x1F40DB238]((__n128)a1.origin, *(__n128 *)&a1.origin.y, (__n128)a1.size, *(__n128 *)&a1.size.height);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB248]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x1F40DB250]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x1F40DB268]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x1F40DB270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x1F40DB280]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x1F40DB288]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x1F40DB298]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x1F40DB2A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x1F40DB2A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2B8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB2C8]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x1F40DB2E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGRect *rect)
{
  return MEMORY[0x1F40DB2F0](dict, rect);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB310]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CMTime *__cdecl CMTimeAdd(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x1F40DC088](retstr, lhs, rhs);
}

int32_t CMTimeCompare(CMTime *time1, CMTime *time2)
{
  return MEMORY[0x1F40DC0C8](time1, time2);
}

CFDictionaryRef CMTimeCopyAsDictionary(CMTime *time, CFAllocatorRef allocator)
{
  return (CFDictionaryRef)MEMORY[0x1F40DC0E0](time, allocator);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  MEMORY[0x1F40DC100](time);
  return result;
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x1F40DC108](retstr, value, *(void *)&timescale);
}

CMTime *__cdecl CMTimeMakeFromDictionary(CMTime *__return_ptr retstr, CFDictionaryRef dictionaryRepresentation)
{
  return (CMTime *)MEMORY[0x1F40DC110](retstr, dictionaryRepresentation);
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x1F40DC120](retstr, *(void *)&preferredTimescale, seconds);
}

CMTime *__cdecl CMTimeSubtract(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x1F40DC1F0](retstr, lhs, rhs);
}

CFTypeRef CVBufferCopyAttachment(CVBufferRef buffer, CFStringRef key, CVAttachmentMode *attachmentMode)
{
  return (CFTypeRef)MEMORY[0x1F40DFB48](buffer, key, attachmentMode);
}

void CVBufferSetAttachment(CVBufferRef buffer, CFStringRef key, CFTypeRef value, CVAttachmentMode attachmentMode)
{
}

CVReturn CVMetalTextureCacheCreate(CFAllocatorRef allocator, CFDictionaryRef cacheAttributes, id metalDevice, CFDictionaryRef textureAttributes, CVMetalTextureCacheRef *cacheOut)
{
  return MEMORY[0x1F40DFC78](allocator, cacheAttributes, metalDevice, textureAttributes, cacheOut);
}

CVReturn CVMetalTextureCacheCreateTextureFromImage(CFAllocatorRef allocator, CVMetalTextureCacheRef textureCache, CVImageBufferRef sourceImage, CFDictionaryRef textureAttributes, MTLPixelFormat pixelFormat, size_t width, size_t height, size_t planeIndex, CVMetalTextureRef *textureOut)
{
  return MEMORY[0x1F40DFC80](allocator, textureCache, sourceImage, textureAttributes, pixelFormat, width, height, planeIndex);
}

void CVMetalTextureCacheFlush(CVMetalTextureCacheRef textureCache, CVOptionFlags options)
{
}

id CVMetalTextureGetTexture(CVMetalTextureRef image)
{
  return (id)MEMORY[0x1F40DFC98](image);
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1F40DFCE0](allocator, width, height, *(void *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD68](pixelBuffer);
}

size_t CVPixelBufferGetHeightOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x1F40DFD70](pixelBuffer, planeIndex);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD80](pixelBuffer);
}

size_t CVPixelBufferGetPlaneCount(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD88](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD98](pixelBuffer);
}

size_t CVPixelBufferGetWidthOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x1F40DFDA0](pixelBuffer, planeIndex);
}

uint64_t FigDebugAssert3()
{
  return MEMORY[0x1F40DD2C8]();
}

uint64_t FigMetalDecRef()
{
  return MEMORY[0x1F410D4B8]();
}

uint64_t FigMetalIncRef()
{
  return MEMORY[0x1F410D4C0]();
}

uint64_t FigSignalErrorAt()
{
  return MEMORY[0x1F40DE320]();
}

uint64_t MTLPixelFormatGetInfoForDevice()
{
  return MEMORY[0x1F40EDE38]();
}

OSStatus VTPixelTransferSessionCreate(CFAllocatorRef allocator, VTPixelTransferSessionRef *pixelTransferSessionOut)
{
  return MEMORY[0x1F41034D0](allocator, pixelTransferSessionOut);
}

void VTPixelTransferSessionInvalidate(VTPixelTransferSessionRef session)
{
}

OSStatus VTPixelTransferSessionTransferImage(VTPixelTransferSessionRef session, CVPixelBufferRef sourceBuffer, CVPixelBufferRef destinationBuffer)
{
  return MEMORY[0x1F41034F0](session, sourceBuffer, destinationBuffer);
}

OSStatus VTSessionSetProperty(VTSessionRef session, CFStringRef propertyKey, CFTypeRef propertyValue)
{
  return MEMORY[0x1F4103538](session, propertyKey, propertyValue);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void std::terminate(void)
{
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1F417EF48](a1);
}

simd_float3x3 __invert_f3(simd_float3x3 a1)
{
  MEMORY[0x1F40C9BF8]((__n128)a1.columns[0], (__n128)a1.columns[1], (__n128)a1.columns[2]);
  result.columns[2].i64[1] = v6;
  result.columns[2].i64[0] = v5;
  result.columns[1].i64[1] = v4;
  result.columns[1].i64[0] = v3;
  result.columns[0].i64[1] = v2;
  result.columns[0].i64[0] = v1;
  return result;
}

simd_float4x4 __invert_f4(simd_float4x4 a1)
{
  MEMORY[0x1F40C9C00]((__n128)a1.columns[0], (__n128)a1.columns[1], (__n128)a1.columns[2], (__n128)a1.columns[3]);
  result.columns[3].i64[1] = v8;
  result.columns[3].i64[0] = v7;
  result.columns[2].i64[1] = v6;
  result.columns[2].i64[0] = v5;
  result.columns[1].i64[1] = v4;
  result.columns[1].i64[0] = v3;
  result.columns[0].i64[1] = v2;
  result.columns[0].i64[0] = v1;
  return result;
}

__float2 __sincosf_stret(float a1)
{
  MEMORY[0x1F40C9C88](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

simd_float4 _simd_atan2_f4(simd_float4 y, simd_float4 x)
{
  MEMORY[0x1F40CA148]((__n128)y, (__n128)x);
  return result;
}

simd_float4 _simd_tan_f4(simd_float4 x)
{
  MEMORY[0x1F40CA198]((__n128)x);
  return result;
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

float asinf(float a1)
{
  MEMORY[0x1F40CA3D8](a1);
  return result;
}

float atan2f(float a1, float a2)
{
  MEMORY[0x1F40CA468](a1, a2);
  return result;
}

float atanf(float a1)
{
  MEMORY[0x1F40CA470](a1);
  return result;
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

uint64_t espresso_context_destroy()
{
  return MEMORY[0x1F4118648]();
}

uint64_t espresso_create_context()
{
  return MEMORY[0x1F4118668]();
}

uint64_t espresso_create_plan()
{
  return MEMORY[0x1F4118678]();
}

uint64_t espresso_network_bind_buffer()
{
  return MEMORY[0x1F41186E0]();
}

uint64_t espresso_network_bind_cvpixelbuffer()
{
  return MEMORY[0x1F41186F8]();
}

uint64_t espresso_plan_add_network()
{
  return MEMORY[0x1F41187D8]();
}

uint64_t espresso_plan_build()
{
  return MEMORY[0x1F41187F0]();
}

uint64_t espresso_plan_destroy()
{
  return MEMORY[0x1F4118818]();
}

uint64_t espresso_plan_execute_sync()
{
  return MEMORY[0x1F4118828]();
}

uint64_t espresso_plan_set_priority()
{
  return MEMORY[0x1F4118858]();
}

float expf(float a1)
{
  MEMORY[0x1F40CBFF8](a1);
  return result;
}

uint64_t fig_log_get_emitter()
{
  return MEMORY[0x1F40DED68]();
}

void free(void *a1)
{
}

long double log(long double __x)
{
  MEMORY[0x1F40CC878](__x);
  return result;
}

float log2f(float a1)
{
  MEMORY[0x1F40CC8B0](a1);
  return result;
}

float logf(float a1)
{
  MEMORY[0x1F40CC8C0](a1);
  return result;
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

float powf(float a1, float a2)
{
  MEMORY[0x1F40CD828](a1, a2);
  return result;
}

float tanf(float a1)
{
  MEMORY[0x1F40CE428](a1);
  return result;
}