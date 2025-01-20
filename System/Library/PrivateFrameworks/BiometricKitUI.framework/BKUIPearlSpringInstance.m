@interface BKUIPearlSpringInstance
- (BKUIPearlSpringInstance)initWithInitialRotation:(BKUIPearlSpringInstance *)self color:(SEL)a2;
- (BOOL)grayscale;
- (__n128)target;
- (__n128)value;
- (__n128)velocity;
- (double)color;
- (double)createAxisRotationMatrix:(float32x4_t)a1;
- (float32x4_t)matrix;
- (unint64_t)axisOrientation;
- (unint64_t)springState;
- (void)setAxisOrientation:(unint64_t)a3;
- (void)setGrayscale:(BOOL)a3;
- (void)setParameters:(FLSpringParameters)a3;
- (void)setSpringState:(unint64_t)a3;
- (void)setTarget:(BKUIPearlSpringInstance *)self;
- (void)setValue:(BKUIPearlSpringInstance *)self;
- (void)step:(double)a3;
@end

@implementation BKUIPearlSpringInstance

- (BKUIPearlSpringInstance)initWithInitialRotation:(BKUIPearlSpringInstance *)self color:(SEL)a2
{
  long long v20 = v3;
  double v21 = v2;
  v22.receiver = self;
  v22.super_class = (Class)BKUIPearlSpringInstance;
  v4 = [(BKUIPearlSpringInstance *)&v22 init];
  if (v4)
  {
    for (uint64_t i = 8; i != 32; i += 8)
    {
      v6 = (objc_class *)objc_alloc_init(MEMORY[0x1E4F50568]);
      v7 = *(Class *)((char *)&v4->super.isa + i);
      *(Class *)((char *)&v4->super.isa + i) = v6;
    }
    __asm { FMOV            V0.2S, #1.0 }
    *(void *)&v4->_scale = _D0;
    v4->_axisOrientation = 0;
    v4->_springState = 0;
    [(BKUIPearlSpringInstance *)v4 createAxisRotationMatrix:v21];
    *(_OWORD *)v4->_anon_30 = v13;
    *(_OWORD *)&v4->_anon_30[16] = v14;
    *(_OWORD *)&v4->_anon_30[32] = v15;
    *(_OWORD *)&v4->_anon_30[48] = v16;
    long long v17 = *(_OWORD *)&v4->_anon_30[16];
    *(_OWORD *)v4->_anon_70 = *(_OWORD *)v4->_anon_30;
    *(_OWORD *)&v4->_anon_70[16] = v17;
    long long v18 = *(_OWORD *)&v4->_anon_30[48];
    *(_OWORD *)&v4->_anon_70[32] = *(_OWORD *)&v4->_anon_30[32];
    *(_OWORD *)&v4->_anon_70[48] = v18;
    *(_OWORD *)v4->_color = v20;
  }
  return v4;
}

- (double)createAxisRotationMatrix:(float32x4_t)a1
{
  __float2 v1 = __sincosf_stret((float)(1.5708 * a1.f32[0]) * 0.5);
  float32x4_t v2 = vmulq_n_f32((float32x4_t)xmmword_1E4BD13A0, v1.__sinval);
  v2.i32[3] = LODWORD(v1.__cosval);
  float32x4_t v33 = v2;
  __float2 v3 = __sincosf_stret(vmuls_lane_f32(1.5708, *(float32x2_t *)a1.f32, 1) * 0.5);
  float32x4_t v4 = vmulq_n_f32((float32x4_t)xmmword_1E4BD13B0, v3.__sinval);
  v4.i32[3] = LODWORD(v3.__cosval);
  float32x4_t v32 = v4;
  __float2 v5 = __sincosf_stret(vmuls_lane_f32(1.5708, a1, 2) * 0.5);
  float32x4_t v6 = vmulq_n_f32((float32x4_t)xmmword_1E4BD13C0, v5.__sinval);
  int32x4_t v7 = (int32x4_t)vnegq_f32(v32);
  int8x16_t v8 = (int8x16_t)vtrn2q_s32((int32x4_t)v32, vtrn1q_s32((int32x4_t)v32, v7));
  float32x4_t v9 = vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v32, (int8x16_t)v7, 8uLL), *(float32x2_t *)v6.f32, 1), (float32x4_t)vextq_s8(v8, v8, 8uLL), v6.f32[0]);
  float32x4_t v10 = (float32x4_t)vrev64q_s32((int32x4_t)v32);
  v10.i32[0] = v7.i32[1];
  v10.i32[3] = v7.i32[2];
  float32x4_t v11 = vaddq_f32(vmlaq_laneq_f32(vmulq_n_f32(v32, v5.__cosval), v10, v6, 2), v9);
  _Q1 = (int32x4_t)vnegq_f32(v33);
  int8x16_t v13 = (int8x16_t)vtrn2q_s32((int32x4_t)v33, vtrn1q_s32((int32x4_t)v33, _Q1));
  _Q4 = (float32x4_t)vrev64q_s32((int32x4_t)v33);
  _Q4.i32[0] = _Q1.i32[1];
  _Q4.i32[3] = _Q1.i32[2];
  _Q3 = vaddq_f32(vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v33, (int8x16_t)_Q1, 8uLL), *(float32x2_t *)v11.f32, 1), (float32x4_t)vextq_s8(v13, v13, 8uLL), v11.f32[0]), vmlaq_laneq_f32(vmulq_laneq_f32(v33, v11, 3), _Q4, v11, 2));
  _Q4.i32[0] = _Q3.i32[1];
  _S5 = _Q3.i32[2];
  __asm { FMLS            S1, S5, V3.S[2] }
  _S7 = _Q3.i32[3];
  __asm { FMLA            S1, S7, V3.S[3] }
  v11.f32[0] = vmlas_n_f32(vmuls_lane_f32(_Q3.f32[2], _Q3, 3), _Q3.f32[1], _Q3.f32[0]);
  double result = COERCE_DOUBLE(__PAIR64__(v11.f32[0] + v11.f32[0], _Q1.u32[0]));
  __asm
  {
    FMLA            S6, S4, V3.S[1]
    FMLA            S6, S7, V3.S[3]
    FMLS            S6, S3, V3.S[0]
    FMLA            S18, S5, V3.S[1]
    FMLA            S17, S3, V3.S[2]
    FMLA            S16, S5, V3.S[1]
    FMLA            S7, S5, V3.S[2]
    FMLS            S7, S3, V3.S[0]
    FMLS            S7, S4, V3.S[1]
  }
  return result;
}

- (void)step:(double)a3
{
  for (uint64_t i = 8; i != 32; i += 8)
    [*(id *)((char *)&self->super.isa + i) step:a3];
  self->_alphaFactor = self->_alphaDecay * self->_alphaFactor;
  float v6 = self->_scale + (float)(self->_scaleDest - self->_scale) * 0.05;
  self->_scale = v6;
}

- (void)setParameters:(FLSpringParameters)a3
{
  double var3 = a3.var3;
  double var2 = a3.var2;
  double var1 = a3.var1;
  double var0 = a3.var0;
  for (uint64_t i = 8; i != 32; i += 8)
    objc_msgSend(*(id *)((char *)&self->super.isa + i), "setParameters:", var0, var1, var2, var3);
}

- (void)setSpringState:(unint64_t)a3
{
  if (!a3)
  {
    float v3 = *(float *)"33s?";
    uint64_t v4 = 204;
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    self->_scaleDest = 0.3;
    float v3 = 1.0;
    uint64_t v4 = 192;
LABEL_5:
    *(_DWORD *)((char *)&self->super.isa + v4) = 1065353216;
    self->_alphaDecay = v3;
  }
  self->_springState = a3;
}

- (void)setTarget:(BKUIPearlSpringInstance *)self
{
  unint64_t axisOrientation = self->_axisOrientation;
  if (axisOrientation == 1)
  {
    if (self->_springState) {
      long long v2 = xmmword_1E4BD13E0;
    }
    else {
      LODWORD(v2) = 0;
    }
  }
  else if (axisOrientation == 2)
  {
    if (self->_springState) {
      long long v2 = xmmword_1E4BD13F0;
    }
    else {
      DWORD1(v2) = 0;
    }
  }
  uint64_t v5 = 0;
  long long v6 = v2;
  do
  {
    long long v7 = v2;
    -[FLSpring setTarget:](self->springs[v5], "setTarget:", *(float *)((unint64_t)&v7 & 0xFFFFFFFFFFFFFFF3 | (4 * (v5 & 3))), v6, v2);
    long long v2 = v6;
    ++v5;
  }
  while (v5 != 3);
  *(_OWORD *)self->_target = v6;
}

- (void)setValue:(BKUIPearlSpringInstance *)self
{
  unint64_t axisOrientation = self->_axisOrientation;
  if (axisOrientation == 1)
  {
    *(float *)&long long v3 = 0.0 * *(float *)&v2;
    DWORD1(v3) = DWORD1(v2);
    goto LABEL_5;
  }
  if (axisOrientation == 2)
  {
    long long v3 = v2;
    DWORD1(v3) = vmuls_lane_f32(0.0, *(float32x2_t *)&v2, 1);
LABEL_5:
    DWORD2(v3) = DWORD2(v2);
    long long v2 = v3;
  }
  uint64_t v6 = 0;
  long long v7 = v2;
  do
  {
    long long v8 = v2;
    -[FLSpring setValue:](self->springs[v6], "setValue:", *(float *)((unint64_t)&v8 & 0xFFFFFFFFFFFFFFF3 | (4 * (v6 & 3))), v7, v2);
    long long v2 = v7;
    ++v6;
  }
  while (v6 != 3);
  *(_OWORD *)self->_value = v7;
}

- (__n128)value
{
  [*(id *)(a1 + 8) value];
  float64_t v10 = v2;
  [*(id *)(a1 + 16) value];
  v3.f64[0] = v10;
  v3.f64[1] = v4;
  *(float32x2_t *)&long long v5 = vcvt_f32_f64(v3);
  long long v11 = v5;
  [*(id *)(a1 + 24) value];
  float v7 = v6;
  long long v8 = v11;
  *((float *)&v8 + 2) = v7;
  *(_OWORD *)(a1 + 32) = v8;
  result.n128_u64[0] = v8;
  result.n128_u32[2] = DWORD2(v8);
  return result;
}

- (float32x4_t)matrix
{
  float32x4_t v15 = *(float32x4_t *)(a1 + 32);
  [(id)a1 value];
  uint32x4_t v3 = (uint32x4_t)vceqq_f32(v15, v2);
  v3.i32[3] = v3.i32[2];
  if ((vminvq_u32(v3) & 0x80000000) != 0)
  {
    return *(float32x4_t *)(a1 + 48);
  }
  else
  {
    objc_msgSend((id)a1, "createAxisRotationMatrix:");
    uint64_t v8 = 0;
    long long v9 = *(_OWORD *)(a1 + 128);
    long long v10 = *(_OWORD *)(a1 + 144);
    long long v11 = *(_OWORD *)(a1 + 160);
    v16[0] = *(_OWORD *)(a1 + 112);
    v16[1] = v9;
    v16[2] = v10;
    v16[3] = v11;
    do
    {
      v17[v8] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(result, COERCE_FLOAT(v16[v8])), v5, *(float32x2_t *)&v16[v8], 1), v6, (float32x4_t)v16[v8], 2), v7, (float32x4_t)v16[v8], 3);
      ++v8;
    }
    while (v8 != 4);
    result.i64[0] = *(void *)&v17[0];
    long long v12 = v17[1];
    long long v13 = v17[2];
    long long v14 = v17[3];
    *(_OWORD *)(a1 + 48) = v17[0];
    *(_OWORD *)(a1 + 64) = v12;
    *(_OWORD *)(a1 + 80) = v13;
    *(_OWORD *)(a1 + 96) = v14;
  }
  return result;
}

- (__n128)velocity
{
  [a1[1] velocity];
  float64_t v7 = v2;
  [a1[2] velocity];
  v3.f64[0] = v7;
  v3.f64[1] = v4;
  *(float32x2_t *)&long long v5 = vcvt_f32_f64(v3);
  long long v8 = v5;
  [a1[3] velocity];
  return (__n128)v8;
}

- (double)color
{
  [(float32x4_t *)a1 velocity];
  float32x4_t v3 = vmulq_f32(v2, v2);
  a1[12].f32[0] = fmaxf(a1[12].f32[0], fminf(sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v3, 2), vaddq_f32(v3, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v3.f32, 1))).f32[0]), 1.0));
  if ([(float32x4_t *)a1 grayscale]) {
    unsigned int v4 = -1;
  }
  else {
    unsigned int v4 = 0;
  }
  if ([(float32x4_t *)a1 grayscale])unsigned int v5 = -1; {
  else
  }
    unsigned int v5 = 0;
  float32x4_t v6 = vmlaq_n_f32(v8, vsubq_f32((float32x4_t)vbslq_s8((int8x16_t)vdupq_n_s32(v5), (int8x16_t)vdupq_n_s32(0x3F4CCCCDu), (int8x16_t)xmmword_1E4BD1410), v8), a1[12].f32[0]);
  v6.i32[3] = a1[12].i32[0];
  *(void *)&double result = vmulq_f32(a1[11], v6).u64[0];
  return result;
}

- (unint64_t)axisOrientation
{
  return self->_axisOrientation;
}

- (void)setAxisOrientation:(unint64_t)a3
{
  self->_unint64_t axisOrientation = a3;
}

- (unint64_t)springState
{
  return self->_springState;
}

- (__n128)target
{
  return a1[15];
}

- (BOOL)grayscale
{
  return self->_grayscale;
}

- (void)setGrayscale:(BOOL)a3
{
  self->_grayscale = a3;
}

- (void).cxx_destruct
{
  uint64_t v3 = 24;
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + v3), 0);
    v3 -= 8;
  }
  while (v3);
}

@end