@interface MDLTransformOrientOp
- (BOOL)IsInverseOp;
- (BOOL)inverse;
- (MDLAnimatedQuaternion)animatedValue;
- (MDLTransformOrientOp)initWithName:(id)a3 inverse:(BOOL)a4 data:(id)a5;
- (NSString)name;
- (double)double4x4AtTime:(uint64_t)a3@<X2>;
- (double)float4x4AtTime:(uint64_t)a3;
- (void)setInverse:(BOOL)a3;
@end

@implementation MDLTransformOrientOp

- (MDLTransformOrientOp)initWithName:(id)a3 inverse:(BOOL)a4 data:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MDLTransformOrientOp;
  v11 = [(MDLTransformOrientOp *)&v15 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_animatedValue, a5);
    objc_storeStrong((id *)&v12->_name, a3);
    v12->_inverse = a4;
    v13 = v12;
  }

  return v12;
}

- (BOOL)IsInverseOp
{
  return self->_inverse;
}

- (double)float4x4AtTime:(uint64_t)a3
{
  objc_msgSend_floatQuaternionAtTime_(*(void **)(a1 + 24), a2, a3);
  v15.columns[1] = v15.columns[0];
  v15.columns[3].f32[0] = vmulq_f32((float32x4_t)v15.columns[0], (float32x4_t)v15.columns[0]).f32[0];
  float v4 = v15.columns[0].f32[1];
  float v5 = vmuls_lane_f32(v15.columns[0].f32[1], *(float32x2_t *)v15.columns[0].f32, 1);
  float v6 = vmuls_lane_f32(v15.columns[0].f32[2], (float32x4_t)v15.columns[0], 2);
  float v7 = vmuls_lane_f32(v15.columns[0].f32[3], (float32x4_t)v15.columns[0], 3);
  float v8 = vmuls_lane_f32(v15.columns[1].f32[0], *(float32x2_t *)v15.columns[1].f32, 1);
  float v9 = vmuls_lane_f32(v15.columns[0].f32[2], (float32x4_t)v15.columns[0], 3);
  float v10 = vmuls_lane_f32(v15.columns[1].f32[0], (float32x4_t)v15.columns[1], 2);
  float v11 = vmuls_lane_f32(v15.columns[0].f32[1], (float32x4_t)v15.columns[0], 3);
  v15.columns[2].i32[3] = 0;
  v15.columns[0].i32[3] = 0;
  v15.columns[0].f32[0] = (float)(v15.columns[3].f32[0] - (float)(v5 + v6)) + v7;
  v15.columns[0].f32[1] = (float)(v8 + v9) + (float)(v8 + v9);
  float v12 = (float)(v8 - v9) + (float)(v8 - v9);
  float v13 = vmuls_lane_f32(v4, (float32x4_t)v15.columns[1], 2);
  float v14 = vmuls_lane_f32(v15.columns[1].f32[0], (float32x4_t)v15.columns[1], 3);
  v15.columns[1].i32[3] = 0;
  v15.columns[1].f32[0] = v12;
  v15.columns[1].f32[1] = (float)(v5 + v7) - (float)(v6 + v15.columns[3].f32[0]);
  v15.columns[2].f32[0] = (float)(v10 + v11) + (float)(v10 + v11);
  v15.columns[2].f32[1] = (float)(v13 - v14) + (float)(v13 - v14);
  v15.columns[2].f32[2] = (float)(v6 + v7) - (float)(v15.columns[3].f32[0] + v5);
  v15.columns[3] = (simd_float4)xmmword_20B1E75C0;
  if (*(unsigned char *)(a1 + 8))
  {
    v15.columns[0].f32[2] = (float)(v10 - v11) + (float)(v10 - v11);
    v15.columns[1].f32[2] = (float)(v13 + v14) + (float)(v13 + v14);
    v15.columns[0].i64[0] = (unint64_t)__invert_f4(v15);
  }
  return *(double *)v15.columns[0].i64;
}

- (double)double4x4AtTime:(uint64_t)a3@<X2>
{
  float v6 = *(void **)(a1 + 24);
  if (v6)
  {
    objc_msgSend_doubleQuaternionAtTime_(v6, a2, a3);
    float64x2_t v7 = v25;
    float64x2_t v8 = v26;
  }
  else
  {
    float64x2_t v7 = 0uLL;
    float64x2_t v8 = 0uLL;
  }
  double v9 = vmuld_n_f64(v7.f64[0], v7.f64[0]);
  double v10 = vmuld_lane_f64(v7.f64[1], v7, 1);
  double v11 = vmuld_n_f64(v8.f64[0], v8.f64[0]);
  double v12 = vmuld_lane_f64(v8.f64[1], v8, 1);
  *(double *)&long long v17 = v9 - (v10 + v11) + v12;
  double v13 = vmuld_lane_f64(v7.f64[0], v7, 1);
  double v14 = vmuld_lane_f64(v8.f64[0], v8, 1);
  double v15 = vmuld_n_f64(v7.f64[0], v8.f64[0]);
  double v16 = vmuld_lane_f64(v7.f64[1], v8, 1);
  *((double *)&v17 + 1) = v13 + v14 + v13 + v14;
  *((void *)&v18 + 1) = 0;
  *((void *)&v19 + 1) = 0;
  *(double *)&long long v20 = v13 - v14 + v13 - v14;
  double v21 = vmuld_lane_f64(v8.f64[0], v7, 1);
  double v22 = vmuld_lane_f64(v7.f64[0], v8, 1);
  v7.f64[1] = 0.0;
  if (*(unsigned char *)(a1 + 8))
  {
    __invert_d4();
  }
  else
  {
    *(_OWORD *)a4 = v17;
    *(double *)&long long v19 = v15 - v16 + v15 - v16;
    *(_OWORD *)(a4 + 16) = v19;
    *((double *)&v20 + 1) = v10 + v12 - (v11 + v9);
    *(_OWORD *)(a4 + 32) = v20;
    v7.f64[0] = v21 + v22 + v21 + v22;
    *(float64x2_t *)(a4 + 48) = v7;
    *((double *)&v23 + 1) = v21 - v22 + v21 - v22;
    *(double *)&long long v23 = v15 + v16 + v15 + v16;
    *(_OWORD *)(a4 + 64) = v23;
    *(double *)&long long v18 = v11 + v12 - (v9 + v10);
    *(_OWORD *)(a4 + 80) = v18;
    *(void *)(a4 + 96) = 0;
    *(void *)(a4 + 104) = 0;
    double result = 0.0;
    *(_OWORD *)(a4 + 112) = xmmword_20B1E7940;
  }
  return result;
}

- (NSString)name
{
  return self->_name;
}

- (MDLAnimatedQuaternion)animatedValue
{
  return self->_animatedValue;
}

- (BOOL)inverse
{
  return self->_inverse;
}

- (void)setInverse:(BOOL)a3
{
  self->_inverse = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animatedValue, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end