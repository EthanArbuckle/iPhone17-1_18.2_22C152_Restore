@interface VISRotationCorrectionEstimator
- (VISRotationCorrectionEstimator)initWithTimeScale:(float)a3;
- (__n128)estimatedCorrection;
- (__n128)updateWithRotation:(double)a3 atTime:;
- (void)reset;
@end

@implementation VISRotationCorrectionEstimator

- (VISRotationCorrectionEstimator)initWithTimeScale:(float)a3
{
  v11.receiver = self;
  v11.super_class = (Class)VISRotationCorrectionEstimator;
  v4 = [(VISRotationCorrectionEstimator *)&v11 init];
  v5 = v4;
  if (v4)
  {
    v4->_timeScale = a3 * 0.70711;
    v6 = objc_alloc_init(HighPassIIR2FilterFloat3);
    highPassFilter1 = v5->highPassFilter1;
    v5->highPassFilter1 = v6;

    v8 = objc_alloc_init(HighPassIIR2FilterFloat3);
    highPassFilter2 = v5->highPassFilter2;
    v5->highPassFilter2 = v8;

    [(VISRotationCorrectionEstimator *)v5 reset];
  }
  return v5;
}

- (void)reset
{
  self->_isInitialized = 0;
  self->_prevTime = 0.0;
  *(_OWORD *)self->_anon_20 = xmmword_1A5F0C8C0;
  *(_OWORD *)self->_accumulatedCorrection = 0u;
  *(_OWORD *)self->_estimatedCorrection = 0u;
  [(HighPassIIR2FilterFloat3 *)self->highPassFilter1 reset];
  highPassFilter2 = self->highPassFilter2;
  [(HighPassIIR2FilterFloat3 *)highPassFilter2 reset];
}

- (__n128)updateWithRotation:(double)a3 atTime:
{
  double v4 = *(double *)(a1 + 16);
  if (v4 <= a3)
  {
    if (*(unsigned char *)(a1 + 12))
    {
      float32x4_t v7 = *(float32x4_t *)(a1 + 32);
    }
    else
    {
      double v4 = a3 + -0.03333;
      *(double *)(a1 + 16) = a3 + -0.03333;
      *(float32x4_t *)(a1 + 32) = a2;
      *(unsigned char *)(a1 + 12) = 1;
      float32x4_t v7 = a2;
    }
    *(double *)&int32x2_t v8 = a3 - v4;
    *(float *)v8.i32 = *(double *)v8.i32;
    int32x2_t v34 = v8;
    float32x4_t v9 = vmulq_f32(v7, (float32x4_t)xmmword_1A5EFDE50);
    int32x4_t v10 = (int32x4_t)vnegq_f32(a2);
    int8x16_t v11 = (int8x16_t)vtrn2q_s32((int32x4_t)a2, vtrn1q_s32((int32x4_t)a2, v10));
    float32x4_t v12 = vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)a2, (int8x16_t)v10, 8uLL), *(float32x2_t *)v9.f32, 1), (float32x4_t)vextq_s8(v11, v11, 8uLL), v9.f32[0]);
    float32x4_t v13 = (float32x4_t)vrev64q_s32((int32x4_t)a2);
    v13.i32[0] = v10.i32[1];
    v13.i32[3] = v10.i32[2];
    float32x4_t v14 = vaddq_f32(v12, vmlaq_laneq_f32(vmulq_laneq_f32(a2, v9, 3), v13, v9, 2));
    int8x16_t v15 = (int8x16_t)vmulq_f32(v14, v14);
    float32x2_t v16 = vadd_f32(*(float32x2_t *)v15.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v15, v15, 8uLL));
    if (vaddv_f32(v16) == 0.0)
    {
      float32x4_t v17 = (float32x4_t)xmmword_1A5F0C8C0;
    }
    else
    {
      unsigned __int32 v18 = vadd_f32(v16, (float32x2_t)vdup_lane_s32((int32x2_t)v16, 1)).u32[0];
      float32x2_t v19 = vrsqrte_f32((float32x2_t)v18);
      float32x2_t v20 = vmul_f32(v19, vrsqrts_f32((float32x2_t)v18, vmul_f32(v19, v19)));
      float32x4_t v17 = vmulq_n_f32(v14, vmul_f32(v20, vrsqrts_f32((float32x2_t)v18, vmul_f32(v20, v20))).f32[0]);
    }
    float32x4_t v21 = vmulq_f32(v17, v17);
    LODWORD(v22) = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v21, 2), vaddq_f32(v21, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v21.f32, 1))).u32[0];
    float32x2_t v23 = vrsqrte_f32((float32x2_t)LODWORD(v22));
    float32x2_t v24 = vmul_f32(v23, vrsqrts_f32((float32x2_t)LODWORD(v22), vmul_f32(v23, v23)));
    float32x4_t v32 = vmulq_n_f32(v17, vmul_f32(v24, vrsqrts_f32((float32x2_t)LODWORD(v22), vmul_f32(v24, v24))).f32[0]);
    float v25 = atan2f(sqrtf(v22), v17.f32[3]);
    float32x4_t v26 = (float32x4_t)vdupq_lane_s32(v34, 0);
    *(void *)&double v27 = vdivq_f32(vmulq_n_f32(v32, v25 + v25), v26).u64[0];
    v26.f32[0] = *(float *)(a1 + 8) / (float)(*(float *)(a1 + 8) + *(float *)v34.i32);
    [*(id *)(a1 + 64) updateValue:v27 withPole:*(double *)v26.i64];
    v28 = *(void **)(a1 + 72);
    [*(id *)(a1 + 64) filteredValue];
    objc_msgSend(v28, "updateValue:withPole:");
    v32.f32[0] = *(float *)(a1 + 8)
               / (float)(*(float *)(a1 + 8) + (float)((float)(*(float *)v34.i32 / 400.0) * 0.70711));
    [*(id *)(a1 + 72) filteredValue];
    v30.i64[0] = 0xBF000000BF000000;
    v30.i64[1] = 0xBF000000BF000000;
    float32x4_t v31 = vmlaq_n_f32(vmulq_f32(vmulq_n_f32(vmulq_n_f32(v29, *(float *)v34.i32), v32.f32[0] + 1.0), v30), *(float32x4_t *)(a1 + 48), v32.f32[0]);
    *(float32x4_t *)(a1 + 80) = v31;
    *(double *)(a1 + 16) = a3;
    *(float32x4_t *)(a1 + 48) = v31;
    __n128 result = (__n128)a2;
    *(float32x4_t *)(a1 + 32) = a2;
  }
  else
  {
    [(id)a1 reset];
  }
  return result;
}

- (__n128)estimatedCorrection
{
  return a1[5];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->highPassFilter2, 0);
  objc_storeStrong((id *)&self->highPassFilter1, 0);
}

@end