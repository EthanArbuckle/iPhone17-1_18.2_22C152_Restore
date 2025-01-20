@interface ARUIRingUniforms
- (ARUIRingUniforms)initWithRing:(id)a3 inContext:(id)a4;
- (__n128)uniforms;
- (__n128)vertexAttributes;
- (void)_updateUniformsWithRing:(id)a3 inContext:(id)a4;
- (void)_updateVertexAttributesWithRing:(id)a3 inContext:(id)a4;
- (void)uniformsBytes;
- (void)vertexAttributesBytes;
@end

@implementation ARUIRingUniforms

- (void)vertexAttributesBytes
{
  return self->_anon_10;
}

- (void)uniformsBytes
{
  return &self[1];
}

- (ARUIRingUniforms)initWithRing:(id)a3 inContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ARUIRingUniforms;
  v8 = [(ARUIRingUniforms *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(ARUIRingUniforms *)v8 _updateVertexAttributesWithRing:v6 inContext:v7];
    [(ARUIRingUniforms *)v9 _updateUniformsWithRing:v6 inContext:v7];
  }

  return v9;
}

- (void)_updateVertexAttributesWithRing:(id)a3 inContext:(id)a4
{
  id v54 = a3;
  id v6 = a4;
  [v54 diameter];
  [v54 thickness];
  [v54 zRotation];
  float v8 = v7;
  [v6 screenScale];
  float v10 = v9;
  [v54 scale];
  float v12 = v11;
  float v13 = v10 * v11;
  [v6 drawableDiameter];
  float v15 = v14 / v13;
  [v6 skewAdjustmentMatrix];
  float32x4_t v50 = v17;
  float32x4_t v52 = v16;
  float32x4_t v46 = v19;
  float32x4_t v48 = v18;
  [v54 translation];
  *(float *)v20.i32 = v12 * v15;
  v21.i32[1] = vneg_f32(v21).i32[1];
  float32x2_t v22 = vdiv_f32(v21, (float32x2_t)vdup_lane_s32(v20, 0));
  *(double *)&long long v23 = matrix_float4x4_zRotation_and_translation(v8, COERCE_DOUBLE(vadd_f32(v22, v22)));
  uint64_t v24 = 0;
  long long v55 = v23;
  long long v56 = v25;
  long long v57 = v26;
  long long v58 = v27;
  float32x4_t v59 = 0u;
  float32x4_t v60 = 0u;
  float32x4_t v61 = 0u;
  float32x4_t v62 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v59 + v24) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v52, COERCE_FLOAT(*(long long *)((char *)&v55 + v24))), v50, *(float32x2_t *)((char *)&v55 + v24), 1), v48, *(float32x4_t *)((char *)&v55 + v24), 2), v46, *(float32x4_t *)((char *)&v55 + v24), 3);
    v24 += 16;
  }
  while (v24 != 64);
  float32x4_t v51 = v60;
  float32x4_t v53 = v59;
  float32x4_t v47 = v62;
  float32x4_t v49 = v61;
  matrix_float4x4_uniform_scale();
  uint64_t v28 = 0;
  long long v55 = v29;
  long long v56 = v30;
  long long v57 = v31;
  long long v58 = v32;
  float32x4_t v59 = 0u;
  float32x4_t v60 = 0u;
  float32x4_t v61 = 0u;
  float32x4_t v62 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v59 + v28) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v53, COERCE_FLOAT(*(long long *)((char *)&v55 + v28))), v51, *(float32x2_t *)((char *)&v55 + v28), 1), v49, *(float32x4_t *)((char *)&v55 + v28), 2), v47, *(float32x4_t *)((char *)&v55 + v28), 3);
    v28 += 16;
  }
  while (v28 != 64);
  float32x4_t v44 = v60;
  float32x4_t v45 = v59;
  float32x4_t v42 = v62;
  float32x4_t v43 = v61;
  matrix_float4x4_uniform_scale();
  uint64_t v33 = 0;
  long long v55 = v34;
  long long v56 = v35;
  long long v57 = v36;
  long long v58 = v37;
  float32x4_t v59 = 0u;
  float32x4_t v60 = 0u;
  float32x4_t v61 = 0u;
  float32x4_t v62 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v59 + v33) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v53, COERCE_FLOAT(*(long long *)((char *)&v55 + v33))), v51, *(float32x2_t *)((char *)&v55 + v33), 1), v49, *(float32x4_t *)((char *)&v55 + v33), 2), v47, *(float32x4_t *)((char *)&v55 + v33), 3);
    v33 += 16;
  }
  while (v33 != 64);
  float32x4_t v38 = v59;
  float32x4_t v39 = v60;
  float32x4_t v40 = v61;
  float32x4_t v41 = v62;
  *(float32x4_t *)self->_anon_10 = v45;
  *(float32x4_t *)&self->_anon_10[16] = v44;
  *(float32x4_t *)&self->_anon_10[32] = v43;
  *(float32x4_t *)&self->_anon_10[48] = v42;
  *(float32x4_t *)&self->_anon_10[64] = v38;
  *(float32x4_t *)&self->_anon_10[80] = v39;
  *(float32x4_t *)&self->_anon_10[96] = v40;
  *(float32x4_t *)&self->_anon_10[112] = v41;
}

- (void)_updateUniformsWithRing:(id)a3 inContext:(id)a4
{
  id v53 = a3;
  id v6 = a4;
  [v53 diameter];
  float v8 = v7;
  [v53 thickness];
  float v10 = v9;
  [v6 screenScale];
  float v52 = v11;
  [v53 scale];
  float v13 = v12;
  [v53 translation];
  float32x2_t v15 = v14;
  [v6 drawableSize];
  float32x2_t v17 = v16;
  [v53 percentage];
  float v19 = v18;
  [v53 zRotation];
  float v21 = v20;
  int v22 = [v6 opaque];

  if (v22)
  {
    [v53 topColorPremultipliedVector];
    *(_OWORD *)&self[1].super.isa = v23;
    [v53 bottomColorPremultipliedVector];
  }
  else
  {
    [v53 topColorVector];
    *(_OWORD *)&self[1].super.isa = v25;
    [v53 bottomColorVector];
  }
  *(_OWORD *)self[1]._anon_10 = v24;
  [v53 emptyOpacity];
  *(_DWORD *)&self[1]._anon_10[80] = v26;
  [v53 trackOpacity];
  *(_DWORD *)&self[1]._anon_10[88] = v27;
  [v53 opacity];
  *(_DWORD *)&self[1]._anon_10[92] = v28;
  *(float *)&self[1]._anon_10[64] = v19;
  BOOL v29 = ARUIFloatGreater(v19, 0.5);
  double v30 = v19;
  float v31 = 2.0;
  if (v29)
  {
    float v32 = 2.0 / ((v30 + -0.5) * 2.0 + 1.0);
    float v31 = v32;
  }
  long long v33 = *(_OWORD *)&self[1]._anon_10[64];
  *((float *)&v33 + 1) = (float)(v10 * (float)(v52 * v13)) * 0.5;
  float v34 = v8 * 0.2;
  *(double *)&float32x2_t v35 = (float)(v8 * (float)(v52 * v13)) * 0.5 - *((float *)&v33 + 1);
  v35.f32[0] = *(double *)&v35;
  float32x2_t v51 = v35;
  *((void *)&v33 + 1) = __PAIR64__(LODWORD(v31), v35.u32[0]);
  *(float *)&self[1]._anon_10[84] = v34;
  *(_OWORD *)&self[1]._anon_10[64] = v33;
  float v36 = v30 * 6.28318531;
  __float2 v37 = __sincosf_stret(v36);
  *(double *)v38.i64 = matrix_float4x4_zRotation_and_translation(-v21, 0.0);
  *(float32x4_t *)&self[1]._anon_10[32] = vaddq_f32(v41, vmlaq_f32(vmlsq_lane_f32(vmulq_f32(v38, (float32x4_t)0), v39, v51, 0), (float32x4_t)0, v40));
  *(float32x4_t *)&self[1]._anon_10[48] = vaddq_f32(v41, vmlaq_f32(vmlaq_n_f32(vmulq_n_f32(v38, v37.__sinval * v51.f32[0]), v39, -(float)(v37.__cosval * v51.f32[0])), (float32x4_t)0, v40));
  __asm { FMOV            V1.2D, #0.5 }
  *(float32x2_t *)v38.f32 = vcvt_f32_f64(vaddq_f64(vmulq_f64(vcvtq_f64_f32(v17), _Q1), vcvtq_f64_f32(vmul_n_f32(v15, v52))));
  v38.i64[1] = 0x3F80000000000000;
  *(float32x4_t *)&self[1]._anon_10[16] = v38;
  float v47 = v21 + v30 * 6.28318531;
  __float2 v48 = __sincosf_stret(v21 + 0.0);
  __float2 v49 = __sincosf_stret(v47);
  *(void *)&long long v50 = __PAIR64__(LODWORD(v48.__sinval), LODWORD(v48.__cosval));
  *((void *)&v50 + 1) = __PAIR64__(LODWORD(v49.__sinval), LODWORD(v49.__cosval));
  *(_OWORD *)&self[1]._anon_10[96] = v50;
}

- (__n128)vertexAttributes
{
  long long v2 = *(_OWORD *)(a1 + 96);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(a2 + 80) = v2;
  long long v3 = *(_OWORD *)(a1 + 128);
  *(_OWORD *)(a2 + 96) = *(_OWORD *)(a1 + 112);
  *(_OWORD *)(a2 + 112) = v3;
  long long v4 = *(_OWORD *)(a1 + 32);
  *(_OWORD *)a2 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(a2 + 16) = v4;
  __n128 result = *(__n128 *)(a1 + 48);
  long long v6 = *(_OWORD *)(a1 + 64);
  *(__n128 *)(a2 + 32) = result;
  *(_OWORD *)(a2 + 48) = v6;
  return result;
}

- (__n128)uniforms
{
  long long v2 = *(_OWORD *)(a1 + 224);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 208);
  *(_OWORD *)(a2 + 80) = v2;
  long long v3 = *(_OWORD *)(a1 + 256);
  *(_OWORD *)(a2 + 96) = *(_OWORD *)(a1 + 240);
  *(_OWORD *)(a2 + 112) = v3;
  long long v4 = *(_OWORD *)(a1 + 160);
  *(_OWORD *)a2 = *(_OWORD *)(a1 + 144);
  *(_OWORD *)(a2 + 16) = v4;
  __n128 result = *(__n128 *)(a1 + 176);
  long long v6 = *(_OWORD *)(a1 + 192);
  *(__n128 *)(a2 + 32) = result;
  *(_OWORD *)(a2 + 48) = v6;
  return result;
}

@end