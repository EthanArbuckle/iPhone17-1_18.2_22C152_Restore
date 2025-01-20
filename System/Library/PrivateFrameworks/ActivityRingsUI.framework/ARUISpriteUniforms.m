@interface ARUISpriteUniforms
- ($3BA783FF50B239963188BE194EBFFEBA)uniforms;
- (ARUISpriteUniforms)initWithSprite:(id)a3 inContext:(id)a4;
- (__n128)vertexAttributes;
- (void)_updateUniformsWithSprite:(id)a3;
- (void)_updateVertexAttributesWithSprite:(id)a3 inContet:(id)a4;
- (void)uniformsBytes;
- (void)vertexAttributesBytes;
@end

@implementation ARUISpriteUniforms

- (void)vertexAttributesBytes
{
  return &self[1];
}

- (void)uniformsBytes
{
  return self->_anon_10;
}

- (ARUISpriteUniforms)initWithSprite:(id)a3 inContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ARUISpriteUniforms;
  v8 = [(ARUISpriteUniforms *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(ARUISpriteUniforms *)v8 _updateVertexAttributesWithSprite:v6 inContet:v7];
    [(ARUISpriteUniforms *)v9 _updateUniformsWithSprite:v6];
  }

  return v9;
}

- (void)_updateVertexAttributesWithSprite:(id)a3 inContet:(id)a4
{
  id v32 = a3;
  id v6 = a4;
  [v6 skewAdjustmentMatrix];
  float32x4_t v30 = v8;
  float32x4_t v31 = v7;
  float32x4_t v28 = v10;
  float32x4_t v29 = v9;
  [v6 drawableDiameter];
  [v6 screenScale];
  [v32 translation];
  [v32 translation];
  *(double *)v11.i64 = matrix_float4x4_translation();
  float32x4_t v26 = v12;
  float32x4_t v27 = v11;
  float32x4_t v24 = v14;
  float32x4_t v25 = v13;
  [v32 size];
  matrix_float4x4_uniform_scale();
  uint64_t v15 = 0;
  long long v33 = v16;
  long long v34 = v17;
  long long v35 = v18;
  long long v36 = v19;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  do
  {
    *(long long *)((char *)&v37 + v15) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v27, COERCE_FLOAT(*(long long *)((char *)&v33 + v15))), v26, *(float32x2_t *)((char *)&v33 + v15), 1), v25, *(float32x4_t *)((char *)&v33 + v15), 2), v24, *(float32x4_t *)((char *)&v33 + v15), 3);
    v15 += 16;
  }
  while (v15 != 64);
  uint64_t v20 = 0;
  long long v33 = v37;
  long long v34 = v38;
  long long v35 = v39;
  long long v36 = v40;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  do
  {
    *(long long *)((char *)&v37 + v20) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v31, COERCE_FLOAT(*(long long *)((char *)&v33 + v20))), v30, *(float32x2_t *)((char *)&v33 + v20), 1), v29, *(float32x4_t *)((char *)&v33 + v20), 2), v28, *(float32x4_t *)((char *)&v33 + v20), 3);
    v20 += 16;
  }
  while (v20 != 64);
  long long v21 = v38;
  long long v22 = v39;
  long long v23 = v40;
  *(_OWORD *)&self[1].super.isa = v37;
  *(_OWORD *)self[1]._anon_10 = v21;
  *(_OWORD *)&self[1]._anon_10[16] = v22;
  *(_OWORD *)&self[2].super.isa = v23;
}

- (void)_updateUniformsWithSprite:(id)a3
{
  id v4 = a3;
  [v4 textureRect];
  *(_OWORD *)self->_anon_10 = v5;
  [v4 opacity];
  int v7 = v6;

  *(_DWORD *)&self->_anon_10[16] = v7;
}

- (__n128)vertexAttributes
{
  return a1[3];
}

- ($3BA783FF50B239963188BE194EBFFEBA)uniforms
{
  long long v3 = *(_OWORD *)self->_anon_10;
  long long v4 = *(_OWORD *)&self->_anon_10[16];
  _OWORD *v2 = v3;
  v2[1] = v4;
  return ($3BA783FF50B239963188BE194EBFFEBA)v3;
}

@end