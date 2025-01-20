@interface NTKLilypadCrownHandler
- (NTKLilypadCrownHandler)init;
- (float)amplitudeForThread:(int)a3 atTime:(double)a4;
- (void)beginWaveAtThread:(int)a3 atTime:(double)a4;
- (void)pluckThread:(int)a3 withAmplitude:(float)a4 atTime:(double)a5;
- (void)reset;
@end

@implementation NTKLilypadCrownHandler

- (NTKLilypadCrownHandler)init
{
  v5.receiver = self;
  v5.super_class = (Class)NTKLilypadCrownHandler;
  v2 = [(NTKLilypadCrownHandler *)&v5 init];
  v3 = v2;
  if (v2) {
    [(NTKLilypadCrownHandler *)v2 reset];
  }
  return v3;
}

- (void)reset
{
  uint64_t v2 = 0;
  int64x2_t v3 = vdupq_n_s64(0xFFEFFFFFFFFFFFFFLL);
  do
  {
    v4 = (_OWORD *)((char *)self + v2);
    v4[3] = v3;
    v4[4] = v3;
    v4[1] = v3;
    v4[2] = v3;
    v4[68] = 0uLL;
    v4[67] = 0uLL;
    v4[66] = 0uLL;
    v2 += 64;
    v4[65] = 0uLL;
  }
  while (v2 != 1024);
}

- (void)pluckThread:(int)a3 withAmplitude:(float)a4 atTime:(double)a5
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if (a3 <= 0xF)
  {
    v8 = &self->pluckTimes[64 * (unint64_t)a3];
    if (a5 - *(double *)v8 > 1.5)
    {
      int8x16_t v10 = *((int8x16_t *)v8 + 2);
      int64x2_t v9 = *((int64x2_t *)v8 + 3);
      int8x16_t v11 = *((int8x16_t *)v8 + 1);
      int8x16_t v12 = vextq_s8(v10, (int8x16_t)v9, 8uLL);
      v9.i64[0] = vdupq_laneq_s64(v9, 1).u64[0];
      *(double *)&v9.i64[1] = a5;
      *(int8x16_t *)v8 = vextq_s8(*(int8x16_t *)v8, v11, 8uLL);
      *((int8x16_t *)v8 + 1) = vextq_s8(v11, v10, 8uLL);
      *((int8x16_t *)v8 + 2) = v12;
      *((int64x2_t *)v8 + 3) = v9;
      v13 = (int64x2_t *)((char *)self + 64 * (unint64_t)a3);
      int64x2_t v14 = v13[68];
      int8x16_t v15 = (int8x16_t)v13[67];
      int8x16_t v16 = (int8x16_t)v13[66];
      int8x16_t v17 = vextq_s8(v16, v15, 8uLL);
      int8x16_t v18 = vextq_s8((int8x16_t)v13[65], v16, 8uLL);
      int8x16_t v19 = vextq_s8(v15, (int8x16_t)v14, 8uLL);
      v14.i64[0] = vdupq_laneq_s64(v14, 1).u64[0];
      *(double *)&v14.i64[1] = a4;
      v13[67] = (int64x2_t)v19;
      v13[65] = (int64x2_t)v18;
      v13[66] = (int64x2_t)v17;
      v13[68] = v14;
    }
  }
}

- (void)beginWaveAtThread:(int)a3 atTime:(double)a4
{
  uint64_t v5 = *(void *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  float v7 = 1.0;
  LODWORD(v8) = 1.0;
  [(NTKLilypadCrownHandler *)self pluckThread:v5 withAmplitude:v8 atTime:a4];
  int v10 = 0;
  uint64_t v11 = (v5 + 1);
  int v12 = v5 - 1;
  double v13 = 1.0;
  do
  {
    if (v12 + v10 >= 0)
    {
      *(float *)&double v9 = v7;
      [(NTKLilypadCrownHandler *)self pluckThread:(v12 + v10) withAmplitude:v9 atTime:a4 + v13 * 0.0166];
    }
    if ((int)v11 <= 15)
    {
      *(float *)&double v9 = v7;
      [(NTKLilypadCrownHandler *)self pluckThread:v11 withAmplitude:v9 atTime:a4 + v13 * 0.0166];
    }
    float v7 = v7 * 0.75;
    double v13 = v13 + 1.0;
    --v10;
    uint64_t v11 = (v11 + 1);
  }
  while (v10 != -15);
}

- (float)amplitudeForThread:(int)a3 atTime:(double)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  float result = 0.0;
  if (a3 <= 0xF)
  {
    float64x2_t v7 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&a4, 0);
    double v8 = (float64x2_t *)((char *)self + 64 * (unint64_t)a3);
    float64x2_t v9 = vsubq_f64(v7, v8[4]);
    float64x2_t v10 = vsubq_f64(v7, v8[3]);
    float64x2_t v11 = vsubq_f64(v7, v8[2]);
    float64x2_t v12 = vsubq_f64(v7, v8[1]);
    float64x2_t v13 = (float64x2_t)vdupq_n_s64(0xBFC3333333333333);
    float64x2_t v14 = vaddq_f64(v12, v13);
    float64x2_t v15 = vaddq_f64(v11, v13);
    float64x2_t v16 = vaddq_f64(v10, v13);
    float64x2_t v17 = vaddq_f64(v9, v13);
    float64x2_t v18 = (float64x2_t)vdupq_n_s64(0x3FC3333333333333uLL);
    int8x16_t v19 = (int8x16_t)vcgtq_f64(v18, v9);
    int8x16_t v20 = (int8x16_t)vcgtq_f64(v18, v10);
    int8x16_t v21 = (int8x16_t)vcgtq_f64(v18, v11);
    int8x16_t v22 = (int8x16_t)vcgtq_f64(v18, v12);
    int8x16_t v23 = (int8x16_t)vdupq_n_s64(0x4072C00000000000uLL);
    __asm { FMOV            V17.2D, #1.5 }
    simd_double2 v33 = (simd_double2)vmulq_f64(vmulq_f64(v17, vnegq_f64(v17)), (float64x2_t)vbslq_s8(v19, v23, _Q17));
    simd_double2 v29 = (simd_double2)vmulq_f64(vmulq_f64(v16, vnegq_f64(v16)), (float64x2_t)vbslq_s8(v20, v23, _Q17));
    simd_double2 x = (simd_double2)vmulq_f64(vmulq_f64(v15, vnegq_f64(v15)), (float64x2_t)vbslq_s8(v21, v23, _Q17));
    simd_double2 v35 = _simd_exp_d2((simd_double2)vmulq_f64(vmulq_f64(v14, vnegq_f64(v14)), (float64x2_t)vbslq_s8(v22, v23, _Q17)));
    float64x2_t xa = (float64x2_t)_simd_exp_d2(x);
    float64x2_t v30 = (float64x2_t)_simd_exp_d2(v29);
    return vaddvq_f64(vaddq_f64(vaddq_f64(vmulq_f64(v8[65], (float64x2_t)v35), vmulq_f64(v8[67], v30)), vaddq_f64(vmulq_f64(v8[66], xa), vmulq_f64(v8[68], (float64x2_t)_simd_exp_d2(v33)))));
  }
  return result;
}

@end