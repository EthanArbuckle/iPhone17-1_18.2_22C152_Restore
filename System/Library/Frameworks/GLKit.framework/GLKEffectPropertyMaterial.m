@interface GLKEffectPropertyMaterial
+ (void)setStaticMasksWithVshRoot:(id)a3 fshRoot:(id)a4;
- (BOOL)includeFshShaderTextForRootNode:(id)a3;
- (BOOL)includeVshShaderTextForRootNode:(id)a3;
- (GLKBigInt_s)_colorMaterialEnabledMask;
- (GLKEffectPropertyMaterial)init;
- (GLKVector4)ambientColor;
- (GLKVector4)diffuseColor;
- (GLKVector4)emissiveColor;
- (GLKVector4)specularColor;
- (GLfloat)shininess;
- (id)description;
- (int)_ambientColorLoc;
- (int)_diffuseColorLoc;
- (int)_emissiveColorLoc;
- (int)_shininessLoc;
- (int)_specularColorLoc;
- (unint64_t)effectDirtyUniforms;
- (void)bind;
- (void)dealloc;
- (void)dirtyAllUniforms;
- (void)initializeMasks;
- (void)setAmbientColor:(GLKVector4)ambientColor;
- (void)setDiffuseColor:(GLKVector4)diffuseColor;
- (void)setEffectDirtyUniforms:(unint64_t *)a3;
- (void)setEmissiveColor:(GLKVector4)emissiveColor;
- (void)setShaderBindings;
- (void)setShininess:(GLfloat)shininess;
- (void)setSpecularColor:(GLKVector4)specularColor;
- (void)set_ambientColorLoc:(int)a3;
- (void)set_colorMaterialEnabledMask:(GLKBigInt_s)a3;
- (void)set_diffuseColorLoc:(int)a3;
- (void)set_emissiveColorLoc:(int)a3;
- (void)set_shininessLoc:(int)a3;
- (void)set_specularColorLoc:(int)a3;
@end

@implementation GLKEffectPropertyMaterial

- (GLKEffectPropertyMaterial)init
{
  v3.receiver = self;
  v3.super_class = (Class)GLKEffectPropertyMaterial;
  result = [(GLKEffectProperty *)&v3 init];
  if (result)
  {
    result->_ambientColor = (_GLKVector4)xmmword_2187C14B0;
    result->_diffuseColor = (_GLKVector4)xmmword_2187C1520;
    result->_specularColor = (_GLKVector4)xmmword_2187C1530;
    result->_emissiveColor = (_GLKVector4)xmmword_2187C1530;
    result->_shininess = 0.0;
    result->_effectDirtyUniforms = 0;
    result->_colorMaterialEnabledMask.n0 = 0;
    result->_colorMaterialEnabledMask.n1 = 0;
  }
  return result;
}

- (void)dirtyAllUniforms
{
}

- (void)setEffectDirtyUniforms:(unint64_t *)a3
{
  if (self->_effectDirtyUniforms != a3)
  {
    self->_effectDirtyUniforms = a3;
    *a3 |= 0x5000000uLL;
  }
}

- (void)setAmbientColor:(GLKVector4)ambientColor
{
  v7.i64[0] = __PAIR64__(LODWORD(v4), LODWORD(v3));
  v7.i64[1] = __PAIR64__(LODWORD(v6), LODWORD(v5));
  int8x16_t v8 = (int8x16_t)vceqq_f32(v7, (float32x4_t)self->_ambientColor);
  *(int8x8_t *)v8.i8 = vand_s8((int8x8_t)*(_OWORD *)&vextq_s8(v8, v8, 8uLL), vand_s8(*(int8x8_t *)v8.i8, (int8x8_t)0x100000001));
  if (!vand_s8((int8x8_t)vdup_lane_s32(*(int32x2_t *)v8.i8, 1), *(int8x8_t *)v8.i8).u32[0])
  {
    self->_ambientColor.x = v3;
    self->_ambientColor.y = v4;
    self->_ambientColor.z = v5;
    self->_ambientColor.w = v6;
    [(GLKEffectProperty *)self setDirtyUniforms:[(GLKEffectProperty *)self dirtyUniforms] | 0x1000000];
    effectDirtyUniforms = self->_effectDirtyUniforms;
    if (effectDirtyUniforms) {
      *effectDirtyUniforms |= 0x1000000uLL;
    }
  }
}

- (void)setDiffuseColor:(GLKVector4)diffuseColor
{
  v7.i64[0] = __PAIR64__(LODWORD(v4), LODWORD(v3));
  v7.i64[1] = __PAIR64__(LODWORD(v6), LODWORD(v5));
  int8x16_t v8 = (int8x16_t)vceqq_f32(v7, (float32x4_t)self->_diffuseColor);
  *(int8x8_t *)v8.i8 = vand_s8((int8x8_t)*(_OWORD *)&vextq_s8(v8, v8, 8uLL), vand_s8(*(int8x8_t *)v8.i8, (int8x8_t)0x100000001));
  if (!vand_s8((int8x8_t)vdup_lane_s32(*(int32x2_t *)v8.i8, 1), *(int8x8_t *)v8.i8).u32[0])
  {
    self->_diffuseColor.x = v3;
    self->_diffuseColor.y = v4;
    self->_diffuseColor.z = v5;
    self->_diffuseColor.w = v6;
    unint64_t v10 = [(GLKEffectProperty *)self dirtyUniforms] | 0x2000000;
    [(GLKEffectProperty *)self setDirtyUniforms:v10];
  }
}

- (void)setEmissiveColor:(GLKVector4)emissiveColor
{
  v7.i64[0] = __PAIR64__(LODWORD(v4), LODWORD(v3));
  v7.i64[1] = __PAIR64__(LODWORD(v6), LODWORD(v5));
  int8x16_t v8 = (int8x16_t)vceqq_f32(v7, (float32x4_t)self->_emissiveColor);
  *(int8x8_t *)v8.i8 = vand_s8((int8x8_t)*(_OWORD *)&vextq_s8(v8, v8, 8uLL), vand_s8(*(int8x8_t *)v8.i8, (int8x8_t)0x100000001));
  if (!vand_s8((int8x8_t)vdup_lane_s32(*(int32x2_t *)v8.i8, 1), *(int8x8_t *)v8.i8).u32[0])
  {
    self->_emissiveColor.x = v3;
    self->_emissiveColor.y = v4;
    self->_emissiveColor.z = v5;
    self->_emissiveColor.w = v6;
    [(GLKEffectProperty *)self setDirtyUniforms:[(GLKEffectProperty *)self dirtyUniforms] | 0x4000000];
    effectDirtyUniforms = self->_effectDirtyUniforms;
    if (effectDirtyUniforms) {
      *effectDirtyUniforms |= 0x4000000uLL;
    }
  }
}

- (void)initializeMasks
{
  *(void *)self->super._prv = [*((id *)self->super._prv + 4) vshMask];
  *((void *)self->super._prv + 2) = [*((id *)self->super._prv + 4) fshMask];
  float v3 = &_staticFshMasks_0;
  float v4 = &_staticVshMasks_1;
  if (self->_specularColor.x == 0.0
    && self->_specularColor.y == 0.0
    && self->_specularColor.z == 0.0
    && self->_specularColor.w == 1.0)
  {
    float v5 = &qword_267BDA918;
    float v6 = &qword_267BDA908;
    float32x4_t v7 = &_staticFshMasks_0;
    float v3 = &qword_267BDA910;
    int8x16_t v8 = &qword_267BDA8F8;
    v9 = &qword_267BDA8E8;
    unint64_t v10 = &_staticVshMasks_1;
    float v4 = &qword_267BDA8F0;
  }
  else
  {
    float v5 = &qword_267BDA908;
    int8x16_t v8 = &qword_267BDA8E8;
    float v6 = &qword_267BDA918;
    float32x4_t v7 = &qword_267BDA910;
    v9 = &qword_267BDA8F8;
    unint64_t v10 = &qword_267BDA8F0;
  }
  prv = self->super._prv;
  v12 = *(int8x16_t **)prv;
  uint64_t v13 = *(void *)(*(void *)prv + 8) | *v9;
  v12->i64[0] = **(void **)prv | *v10;
  v12->i64[1] = v13;
  v14 = (int8x16_t *)*((void *)prv + 2);
  uint64_t v15 = v14->i64[1] | *v6;
  v14->i64[0] |= *v7;
  v14->i64[1] = v15;
  v16.i64[0] = *v4;
  v16.i64[1] = *v8;
  int8x16_t *v12 = vbicq_s8(*v12, v16);
  v16.i64[0] = *v3;
  v16.i64[1] = *v5;
  int8x16_t *v14 = vbicq_s8(*v14, v16);

  [(GLKEffectProperty *)self setMasksInitialized:1];
}

- (void)setSpecularColor:(GLKVector4)specularColor
{
  v7.i64[0] = __PAIR64__(LODWORD(v4), LODWORD(v3));
  v7.i64[1] = __PAIR64__(LODWORD(v6), LODWORD(v5));
  int8x16_t v8 = (int8x16_t)vceqq_f32(v7, (float32x4_t)self->_specularColor);
  *(int8x8_t *)v8.i8 = vand_s8((int8x8_t)*(_OWORD *)&vextq_s8(v8, v8, 8uLL), vand_s8(*(int8x8_t *)v8.i8, (int8x8_t)0x100000001));
  if (!vand_s8((int8x8_t)vdup_lane_s32(*(int32x2_t *)v8.i8, 1), *(int8x8_t *)v8.i8).u32[0])
  {
    self->_specularColor.x = v3;
    self->_specularColor.y = v4;
    self->_specularColor.z = v5;
    self->_specularColor.w = v6;
    unint64_t v10 = (int8x16_t *)&_staticFshMasks_0;
    v11 = &qword_267BDA918;
    v12 = (int8x16_t *)&_staticVshMasks_1;
    uint64_t v13 = &qword_267BDA910;
    v14 = &qword_267BDA8F8;
    uint64_t v15 = &qword_267BDA8F0;
    if (v3 == 0.0 && v4 == 0.0 && v5 == 0.0 && v6 == 1.0)
    {
      uint64_t v15 = &_staticVshMasks_1;
      v14 = &qword_267BDA8E8;
      uint64_t v13 = &_staticFshMasks_0;
      v11 = &qword_267BDA908;
      v12 = (int8x16_t *)&qword_267BDA8F0;
      unint64_t v10 = (int8x16_t *)&qword_267BDA910;
    }
    int8x16_t v16 = *(void **)self->super._prv;
    uint64_t v17 = v16[1] | *v14;
    *v16 |= *v15;
    prv = self->super._prv;
    v16[1] = v17;
    v19 = (void *)*((void *)prv + 2);
    uint64_t v20 = v19[1] | *v11;
    *v19 |= *v13;
    v21 = (int8x16_t **)self->super._prv;
    v19[1] = v20;
    int8x16_t **v21 = vbicq_s8(**v21, *v12);
    *(int8x16_t *)*((void *)self->super._prv + 2) = vbicq_s8(*(int8x16_t *)*((void *)self->super._prv + 2), *v10);
    unint64_t v22 = [(GLKEffectProperty *)self dirtyUniforms] | 0x10000000;
    [(GLKEffectProperty *)self setDirtyUniforms:v22];
  }
}

- (void)setShininess:(GLfloat)shininess
{
  if (self->_shininess != shininess)
  {
    self->_shininess = shininess;
    unint64_t v4 = [(GLKEffectProperty *)self dirtyUniforms] | 0x8000000;
    [(GLKEffectProperty *)self setDirtyUniforms:v4];
  }
}

- (void)setShaderBindings
{
  GLint params = 0;
  glGetIntegerv(0x8B8Du, &params);
  self->_ambientColorLoc = glGetUniformLocation(params, "material.ambientColor");
  self->_diffuseColorLoc = glGetUniformLocation(params, "material.diffuseColor");
  self->_specularColorLoc = glGetUniformLocation(params, "material.specularColor");
  self->_emissiveColorLoc = glGetUniformLocation(params, "material.emissiveColor");
  self->_shininessLoc = glGetUniformLocation(params, "material.shininess");
  [(GLKEffectPropertyMaterial *)self dirtyAllUniforms];
}

+ (void)setStaticMasksWithVshRoot:(id)a3 fshRoot:(id)a4
{
  uint64_t v6 = 0;
  _allVshMasks_0 = 0uLL;
  _allFshMasks_0 = 0uLL;
  char v7 = 1;
  do
  {
    char v8 = v7;
    v9 = &_staticVshMasks_1[2 * v6];
    uint64_t v10 = +[GLKShaderBlockNode maskForLabel:root:index:](GLKShaderBlockNode, "maskForLabel:root:index:", _maskStrs_1[v6], a3, [a3 index]);
    char v7 = 0;
    uint64_t *v9 = v10;
    v9[1] = v11;
    *(void *)&_allVshMasks_0 = _allVshMasks_0 | v10;
    *((void *)&_allVshMasks_0 + 1) |= v11;
    uint64_t v6 = 1;
  }
  while ((v8 & 1) != 0);
  uint64_t v12 = 0;
  char v13 = 1;
  do
  {
    char v14 = v13;
    uint64_t v15 = &_staticFshMasks_0[2 * v12];
    uint64_t v16 = +[GLKShaderBlockNode maskForLabel:root:index:](GLKShaderBlockNode, "maskForLabel:root:index:", _maskStrs_1[v12], a4, [a4 index]);
    char v13 = 0;
    *uint64_t v15 = v16;
    v15[1] = v17;
    *(void *)&_allFshMasks_0 = _allFshMasks_0 | v16;
    *((void *)&_allFshMasks_0 + 1) |= v17;
    uint64_t v12 = 1;
  }
  while ((v14 & 1) != 0);
}

- (BOOL)includeVshShaderTextForRootNode:(id)a3
{
  BOOL result = (_allVshMasks_0 & *(_OWORD *)((unsigned char *)a3 + 8)) == 0
        || (float v3 = *(void **)self->super._prv, (*v3 & *((void *)a3 + 1)) != 0)
        || (*((void *)a3 + 2) & v3[1]) != 0;
  return result;
}

- (BOOL)includeFshShaderTextForRootNode:(id)a3
{
  BOOL result = (_allFshMasks_0 & *(_OWORD *)((unsigned char *)a3 + 8)) == 0
        || (float v3 = (void *)*((void *)self->super._prv + 2), (*v3 & *((void *)a3 + 1)) != 0)
        || (*((void *)a3 + 2) & v3[1]) != 0;
  return result;
}

- (void)bind
{
  if ([(GLKEffectProperty *)self dirtyUniforms])
  {
    if (([(GLKEffectProperty *)self dirtyUniforms] & 0x1000000) != 0) {
      glUniform4fv(self->_ambientColorLoc, 1, &self->_ambientColor.x);
    }
    if (([(GLKEffectProperty *)self dirtyUniforms] & 0x2000000) != 0) {
      glUniform4fv(self->_diffuseColorLoc, 1, &self->_diffuseColor.x);
    }
    if (([(GLKEffectProperty *)self dirtyUniforms] & 0x10000000) != 0) {
      glUniform4fv(self->_specularColorLoc, 1, &self->_specularColor.x);
    }
    if (([(GLKEffectProperty *)self dirtyUniforms] & 0x4000000) != 0) {
      glUniform4fv(self->_emissiveColorLoc, 1, &self->_emissiveColor.x);
    }
    if (([(GLKEffectProperty *)self dirtyUniforms] & 0x8000000) != 0) {
      glUniform1f(self->_shininessLoc, self->_shininess);
    }
    [(GLKEffectProperty *)self setDirtyUniforms:0];
  }
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  *(void *)&v5.x = [v3 appendFormat:@"%@ = %p\n{\n", objc_msgSend((id)objc_opt_class(), "description"), self];
  *(void *)&v6.x = [v3 appendFormat:@"\tambientColor =   %@\n", NSStringFromGLKVector4(v5)];
  *(void *)&v7.x = [v3 appendFormat:@"\tdiffuseColor =   %@\n", NSStringFromGLKVector4(v6)];
  *(void *)&v8.x = [v3 appendFormat:@"\tspecularColor =  %@\n", NSStringFromGLKVector4(v7)];
  [v3 appendFormat:@"\temissiveColor =  %@\n", NSStringFromGLKVector4(v8)];
  objc_msgSend(v3, "appendFormat:", @"\tshininess =      %6.4f\n", self->_shininess);
  [v3 appendFormat:@"}"];
  return v3;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)GLKEffectPropertyMaterial;
  [(GLKEffectProperty *)&v2 dealloc];
}

- (GLKVector4)ambientColor
{
  *(void *)&result.v[2] = a2;
  *(void *)&result.x = self;
  return result;
}

- (GLKVector4)diffuseColor
{
  *(void *)&result.v[2] = a2;
  *(void *)&result.x = self;
  return result;
}

- (GLKVector4)specularColor
{
  *(void *)&result.v[2] = a2;
  *(void *)&result.x = self;
  return result;
}

- (GLKVector4)emissiveColor
{
  *(void *)&result.v[2] = a2;
  *(void *)&result.x = self;
  return result;
}

- (GLfloat)shininess
{
  return self->_shininess;
}

- (unint64_t)effectDirtyUniforms
{
  return self->_effectDirtyUniforms;
}

- (int)_ambientColorLoc
{
  return self->_ambientColorLoc;
}

- (void)set_ambientColorLoc:(int)a3
{
  self->_ambientColorLoc = a3;
}

- (int)_diffuseColorLoc
{
  return self->_diffuseColorLoc;
}

- (void)set_diffuseColorLoc:(int)a3
{
  self->_diffuseColorLoc = a3;
}

- (int)_specularColorLoc
{
  return self->_specularColorLoc;
}

- (void)set_specularColorLoc:(int)a3
{
  self->_specularColorLoc = a3;
}

- (int)_emissiveColorLoc
{
  return self->_emissiveColorLoc;
}

- (void)set_emissiveColorLoc:(int)a3
{
  self->_emissiveColorLoc = a3;
}

- (int)_shininessLoc
{
  return self->_shininessLoc;
}

- (void)set_shininessLoc:(int)a3
{
  self->_shininessLoc = a3;
}

- (GLKBigInt_s)_colorMaterialEnabledMask
{
  p_colorMaterialEnabledMask = &self->_colorMaterialEnabledMask;
  unint64_t n0 = self->_colorMaterialEnabledMask.n0;
  unint64_t n1 = p_colorMaterialEnabledMask->n1;
  result.unint64_t n1 = n1;
  result.unint64_t n0 = n0;
  return result;
}

- (void)set_colorMaterialEnabledMask:(GLKBigInt_s)a3
{
  self->_colorMaterialEnabledMask = a3;
}

@end