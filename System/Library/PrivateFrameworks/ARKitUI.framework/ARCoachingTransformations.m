@interface ARCoachingTransformations
+ (__n128)translate:;
+ (double)lookAt:(float32x4_t)a1 center:(float32x4_t)a2 up:(float32x4_t)a3;
+ (float)degreesToRadians:(float)a3;
+ (float)ortho2d:(float)a1 right:(float)a2 bottom:top:near:far:;
+ (float)perspective_fov:(float)a3 aspect:near:far:;
+ (float32x2_t)rotate:(float)a1 axis:(float32x4_t)a2;
+ (float64x2_t)fromMatrix:(int32x4_t)a3@<Q1>;
@end

@implementation ARCoachingTransformations

+ (float)degreesToRadians:(float)a3
{
  return a3 * 0.017453;
}

+ (__n128)translate:
{
  return *(__n128 *)MEMORY[0x263EF89A8];
}

+ (float32x2_t)rotate:(float)a1 axis:(float32x4_t)a2
{
  __float2 v2 = __sincospif_stret(a1 * 0.0055556);
  int32x4_t v3 = (int32x4_t)vmulq_f32(a2, a2);
  v3.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v3, 2), vadd_f32(*(float32x2_t *)v3.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v3.i8, 1))).u32[0];
  float32x2_t v4 = vrsqrte_f32((float32x2_t)v3.u32[0]);
  float32x2_t v5 = vmul_f32(v4, vrsqrts_f32((float32x2_t)v3.u32[0], vmul_f32(v4, v4)));
  _Q3 = vmulq_n_f32(a2, vmul_f32(v5, vrsqrts_f32((float32x2_t)v3.u32[0], vmul_f32(v5, v5))).f32[0]);
  _Q6 = vmulq_n_f32(_Q3, 1.0 - v2.__cosval);
  _S2 = _Q3.i32[1];
  float32x2_t result = vmla_n_f32((float32x2_t)__PAIR64__(vmulq_n_f32(_Q3, *(float *)&v2).u32[2], LODWORD(v2.__cosval)), *(float32x2_t *)_Q3.f32, _Q6.f32[0]);
  _Q3.i32[0] = _Q3.i32[2];
  __asm
  {
    FMLA            S17, S2, V6.S[1]
    FMLA            S5, S3, V6.S[1]
    FMLA            S18, S3, V6.S[1]
    FMLA            S1, S3, V6.S[2]
  }
  return result;
}

+ (float)perspective_fov:(float)a3 aspect:near:far:
{
  *(float *)&a2 = *(float *)&a2 * 0.5;
  [a1 degreesToRadians:a2];
  return (float)(1.0 / tanf(v4)) / a3;
}

+ (double)lookAt:(float32x4_t)a1 center:(float32x4_t)a2 up:(float32x4_t)a3
{
  float32x4_t v3 = vsubq_f32(a2, a1);
  int32x4_t v4 = (int32x4_t)vmulq_f32(v3, v3);
  v4.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v4, 2), vadd_f32(*(float32x2_t *)v4.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v4.i8, 1))).u32[0];
  float32x2_t v5 = vrsqrte_f32((float32x2_t)v4.u32[0]);
  float32x2_t v6 = vmul_f32(v5, vrsqrts_f32((float32x2_t)v4.u32[0], vmul_f32(v5, v5)));
  float32x4_t v7 = vmulq_n_f32(v3, vmul_f32(v6, vrsqrts_f32((float32x2_t)v4.u32[0], vmul_f32(v6, v6))).f32[0]);
  float32x4_t v8 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v7, (int32x4_t)v7), (int8x16_t)v7, 0xCuLL);
  float32x4_t v9 = vmlaq_f32(vmulq_f32(v8, vnegq_f32(a3)), v7, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)a3, (int32x4_t)a3), (int8x16_t)a3, 0xCuLL));
  int32x4_t v10 = (int32x4_t)vmulq_f32(v9, v9);
  v10.i32[0] = vadd_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)v10.i8, 1), vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v10, 2), *(float32x2_t *)v10.i8)).u32[0];
  float32x4_t v11 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v9, (int32x4_t)v9), (int8x16_t)v9, 0xCuLL);
  *(float32x2_t *)v9.f32 = vrsqrte_f32((float32x2_t)v10.u32[0]);
  *(float32x2_t *)v9.f32 = vmul_f32(*(float32x2_t *)v9.f32, vrsqrts_f32((float32x2_t)v10.u32[0], vmul_f32(*(float32x2_t *)v9.f32, *(float32x2_t *)v9.f32)));
  float32x4_t v12 = vmulq_n_f32(v11, vmul_f32(*(float32x2_t *)v9.f32, vrsqrts_f32((float32x2_t)v10.u32[0], vmul_f32(*(float32x2_t *)v9.f32, *(float32x2_t *)v9.f32))).f32[0]);
  int32x4_t v13 = (int32x4_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v12, (int32x4_t)v12), (int8x16_t)v12, 0xCuLL), vnegq_f32(v7)), v12, v8);
  v8.i32[0] = v12.i32[0];
  v8.i32[1] = vdupq_laneq_s32(v13, 2).u32[0];
  __asm { FMOV            V3.4S, #1.0 }
  return *(double *)v8.i64;
}

+ (float)ortho2d:(float)a1 right:(float)a2 bottom:top:near:far:
{
  return (float)(1.0 / (float)(a2 - a1)) + (float)(1.0 / (float)(a2 - a1));
}

+ (float64x2_t)fromMatrix:(int32x4_t)a3@<Q1>
{
  float v4 = a4.n128_f32[2] + (float)(*(float *)a2.i32 + *(float *)&a3.i32[1]);
  if (v4 >= 0.0)
  {
    float v14 = sqrtf(v4 + 1.0);
    float32_t v15 = v14 + v14;
    float32x2_t v16 = vrecpe_f32((float32x2_t)COERCE_UNSIGNED_INT(v14 + v14));
    float32x2_t v17 = vmul_f32(v16, vrecps_f32((float32x2_t)COERCE_UNSIGNED_INT(v14 + v14), v16));
    v17.i32[0] = vmul_f32(v17, vrecps_f32((float32x2_t)COERCE_UNSIGNED_INT(v14 + v14), v17)).u32[0];
    float32x2_t v28 = vmul_n_f32(vsub_f32((float32x2_t)vzip1_s32((int32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)a3, (int8x16_t)a3, 8uLL), (int32x2_t)a4.n128_u64[0]), (float32x2_t)vext_s8((int8x8_t)a4.n128_u64[0], (int8x8_t)*(_OWORD *)&vextq_s8((int8x16_t)a2, (int8x16_t)a2, 8uLL), 4uLL)), v17.f32[0]);
    v18.i32[0] = vsub_f32((float32x2_t)*(_OWORD *)&vdupq_lane_s32(*(int32x2_t *)a2.i8, 1), *(float32x2_t *)a3.i8).u32[0];
    v18.f32[1] = v15;
    v17.i32[1] = 0.25;
    float32x2_t v30 = vmul_f32(v18, v17);
  }
  else if (*(float *)a2.i32 < *(float *)&a3.i32[1] || *(float *)a2.i32 < a4.n128_f32[2])
  {
    float v6 = 1.0 - *(float *)a2.i32;
    if (*(float *)&a3.i32[1] >= a4.n128_f32[2])
    {
      float v31 = sqrtf(*(float *)&a3.i32[1] + (float)(v6 - a4.n128_f32[2]));
      *(float *)&unsigned int v32 = v31 + v31;
      float32x2_t v33 = vrecpe_f32((float32x2_t)v32);
      float32x2_t v34 = vmul_f32(v33, vrecps_f32((float32x2_t)v32, v33));
      v35.i32[0] = vmul_f32(v34, vrecps_f32((float32x2_t)v32, v34)).u32[0];
      v34.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_lane_s32(*(int32x2_t *)a2.i8, 1), *(float32x2_t *)a3.i8).u32[0];
      v34.i32[1] = v32;
      float32x2_t v36 = (float32x2_t)vrev64_s32((int32x2_t)a4.n128_u64[0]);
      v37.i32[0] = vadd_f32(v36, (float32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)a3, (int8x16_t)a3, 8uLL)).u32[0];
      v37.i32[1] = vsub_f32(v36, (float32x2_t)vdup_laneq_s32(a2, 2)).i32[1];
      float32x2_t v30 = vmul_n_f32(v37, v35.f32[0]);
      v35.i32[1] = 0.25;
      float32x2_t v28 = vmul_f32(v34, v35);
    }
    else
    {
      float32x2_t v7 = (float32x2_t)__PAIR64__(a2.u32[1], COERCE_UNSIGNED_INT(sqrtf(a4.n128_f32[2] + (float)(v6 - *(float *)&a3.i32[1]))));
      float32x2_t v8 = vadd_f32((float32x2_t)vzip1_s32((int32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)a2, (int8x16_t)a2, 8uLL), (int32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)a3, (int8x16_t)a3, 8uLL)), (float32x2_t)a4.n128_u64[0]);
      float32x2_t v9 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)a3.i8, 0);
      float32x2_t v10 = vsub_f32(*(float32x2_t *)a2.i8, v9);
      v9.i32[0] = 2.0;
      v9.i32[0] = vmul_f32(v7, v9).u32[0];
      v9.i32[1] = v10.i32[1];
      float32x2_t v11 = vrecpe_f32((float32x2_t)v9.u32[0]);
      float32x2_t v12 = vmul_f32(v11, vrecps_f32((float32x2_t)v9.u32[0], v11));
      v10.i32[0] = vmul_f32(v12, vrecps_f32((float32x2_t)v9.u32[0], v12)).u32[0];
      float32x2_t v28 = vmul_n_f32(v8, v10.f32[0]);
      __asm { FMOV            V2.2S, #0.25 }
      _D2.i32[1] = v10.i32[0];
      float32x2_t v30 = vmul_f32(v9, _D2);
    }
  }
  else
  {
    float32x2_t v19 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)a3.i8, 0);
    float32x2_t v20 = vadd_f32(*(float32x2_t *)a2.i8, v19);
    v19.i32[0] = 2.0;
    v19.i32[0] = vmul_f32((float32x2_t)__PAIR64__(a2.u32[1], COERCE_UNSIGNED_INT(sqrtf(*(float *)a2.i32 + (float)((float)(1.0 - *(float *)&a3.i32[1])- a4.n128_f32[2])))), v19).u32[0];
    v19.i32[1] = v20.i32[1];
    float32x2_t v21 = vrecpe_f32((float32x2_t)v19.u32[0]);
    float32x2_t v22 = vmul_f32(v21, vrecps_f32((float32x2_t)v19.u32[0], v21));
    LODWORD(v23) = vmul_f32(v22, vrecps_f32((float32x2_t)v19.u32[0], v22)).u32[0];
    __asm { FMOV            V5.2S, #0.25 }
    _D5.f32[1] = v23;
    float32x2_t v28 = vmul_f32(v19, _D5);
    v29.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)a2, (int8x16_t)a2, 8uLL), (float32x2_t)a4.n128_u64[0]).u32[0];
    v29.i32[1] = vsub_f32((float32x2_t)vdup_laneq_s32(a3, 2), *(float32x2_t *)&a4).i32[1];
    float32x2_t v30 = vmul_n_f32(v29, v23);
  }
  float64x2_t result = vcvtq_f64_f32(v30);
  *a1 = vcvtq_f64_f32(v28);
  a1[1] = result;
  return result;
}

@end