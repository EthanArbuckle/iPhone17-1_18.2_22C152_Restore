@interface ARFrame(ARFrame_NormalizedImagePoint)
- (float32x2_t)normalizedImagePointForScreenPoint:()ARFrame_NormalizedImagePoint viewportSize:orientation:;
@end

@implementation ARFrame(ARFrame_NormalizedImagePoint)

- (float32x2_t)normalizedImagePointForScreenPoint:()ARFrame_NormalizedImagePoint viewportSize:orientation:
{
  float v4 = *(float *)&a2 / a3;
  float v8 = v4;
  float v5 = *((float *)&a2 + 1) / a4;
  float v7 = v5;
  [a1 displayTransformForOrientation:a3 viewportSize:a4];
  *(float32x2_t *)v9.columns[0].f32 = vcvt_f32_f64((float64x2_t)0);
  v9.columns[0] = (simd_float3)v9.columns[0].u64[0];
  v9.columns[1] = (simd_float3)v9.columns[0].u64[0];
  v9.columns[2].i64[0] = v9.columns[0].i64[0];
  v9.columns[2].i64[1] = COERCE_UNSIGNED_INT(1.0);
  simd_float3x3 v10 = __invert_f3(v9);
  return vadd_f32(*(float32x2_t *)v10.columns[2].f32, (float32x2_t)*(_OWORD *)&vmlaq_n_f32(vmulq_n_f32((float32x4_t)v10.columns[0], v8), (float32x4_t)v10.columns[1], v7));
}

@end