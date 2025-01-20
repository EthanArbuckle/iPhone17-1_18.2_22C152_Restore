@interface GLKEffectPropertyLight
+ (void)setStaticMasksWithVshRoot:(id)a3 fshRoot:(id)a4;
- (BOOL)includeFshShaderTextForRootNode:(id)a3;
- (BOOL)includeVshShaderTextForRootNode:(id)a3;
- (GLBOOLean)enabled;
- (GLKBigInt_s)allFshMasks;
- (GLKBigInt_s)allVshMasks;
- (GLKEffectPropertyLight)initWithTransform:(id)a3 lightingType:(int)a4 firstLight:(unsigned __int8)a5;
- (GLKEffectPropertyTransform)transform;
- (GLKVector3)spotDirection;
- (GLKVector4)ambientColor;
- (GLKVector4)diffuseColor;
- (GLKVector4)position;
- (GLKVector4)specularColor;
- (GLfloat)constantAttenuation;
- (GLfloat)linearAttenuation;
- (GLfloat)quadraticAttenuation;
- (GLfloat)spotCutoff;
- (GLfloat)spotExponent;
- (_GLKVector3)normalizedSpotDirectionEye;
- (_GLKVector4)positionEye;
- (float)spotCutoffDegrees;
- (id)description;
- (int)ambientLoc;
- (int)ambientTermLoc;
- (int)constantAttenuationLoc;
- (int)diffuseLoc;
- (int)lightIndex;
- (int)lightingType;
- (int)linearAttenuationLoc;
- (int)normalizeLoc;
- (int)normalizedSpotDirectionEyeLoc;
- (int)positionEyeLoc;
- (int)quadraticAttenuationLoc;
- (int)specularLoc;
- (int)spotCutoffLoc;
- (int)spotExponentLoc;
- (unint64_t)effectDirtyUniforms;
- (unsigned)firstLight;
- (unsigned)isAttenuated;
- (unsigned)isSpot;
- (unsigned)positionEyeStale;
- (void)bind;
- (void)dealloc;
- (void)dirtyAllUniforms;
- (void)initializeMasks;
- (void)setAmbientColor:(GLKVector4)ambientColor;
- (void)setAmbientLoc:(int)a3;
- (void)setAmbientTermLoc:(int)a3;
- (void)setConstantAttenuation:(GLfloat)constantAttenuation;
- (void)setConstantAttenuationLoc:(int)a3;
- (void)setDiffuseColor:(GLKVector4)diffuseColor;
- (void)setDiffuseLoc:(int)a3;
- (void)setEffectDirtyUniforms:(unint64_t *)a3;
- (void)setEnabled:(GLBOOLean)enabled;
- (void)setFirstLight:(unsigned __int8)a3;
- (void)setGLDefaults;
- (void)setLightIndex:(int)a3;
- (void)setLightingType:(int)a3;
- (void)setLinearAttenuation:(GLfloat)linearAttenuation;
- (void)setLinearAttenuationLoc:(int)a3;
- (void)setNormalize:(unsigned __int8)a3;
- (void)setNormalizeLoc:(int)a3;
- (void)setNormalizedSpotDirectionEye:(_GLKVector3)a3;
- (void)setNormalizedSpotDirectionEyeLoc:(int)a3;
- (void)setPosition:(GLKVector4)position;
- (void)setPositionEye:(_GLKVector4)a3;
- (void)setPositionEyeLoc:(int)a3;
- (void)setPositionEyeStale:(unsigned __int8)a3;
- (void)setQuadraticAttenuation:(GLfloat)quadraticAttenuation;
- (void)setQuadraticAttenuationLoc:(int)a3;
- (void)setShaderBindings;
- (void)setSpecularColor:(GLKVector4)specularColor;
- (void)setSpecularLoc:(int)a3;
- (void)setSpotCutoff:(GLfloat)spotCutoff;
- (void)setSpotCutoffDegrees:(float)a3;
- (void)setSpotCutoffLoc:(int)a3;
- (void)setSpotDirection:(GLKVector3)spotDirection;
- (void)setSpotExponent:(GLfloat)spotExponent;
- (void)setSpotExponentLoc:(int)a3;
- (void)setTransform:(GLKEffectPropertyTransform *)transform;
@end

@implementation GLKEffectPropertyLight

- (GLKEffectPropertyLight)initWithTransform:(id)a3 lightingType:(int)a4 firstLight:(unsigned __int8)a5
{
  v11.receiver = self;
  v11.super_class = (Class)GLKEffectPropertyLight;
  v8 = [(GLKEffectProperty *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(GLKEffectPropertyLight *)v8 setTransform:a3];
    v9->_enabled = 0;
    v9->_quadraticAttenuationLoc = -1;
    v9->_linearAttenuationLoc = -1;
    v9->_constantAttenuationLoc = -1;
    v9->_spotCutoffLoc = -1;
    v9->_spotExponentLoc = -1;
    v9->_normalizedSpotDirectionEyeLoc = -1;
    v9->_specularLoc = -1;
    v9->_diffuseLoc = -1;
    v9->_ambientTermLoc = -1;
    v9->_ambientLoc = -1;
    v9->_positionEyeLoc = -1;
    v9->_normalizeLoc = -1;
    v9->_lightIndex = -1;
    v9->_lightingType = a4;
    v9->_effectDirtyUniforms = 0;
    v9->_firstLight = a5;
    [(GLKEffectPropertyLight *)v9 setGLDefaults];
  }
  return v9;
}

- (void)dirtyAllUniforms
{
}

- (void)setGLDefaults
{
  self->_position = (_GLKVector4)xmmword_2187C1500;
  self->_positionEye = (_GLKVector4)xmmword_2187C1500;
  float v4 = 0.0;
  LODWORD(v2) = 1.0;
  -[GLKEffectPropertyLight setAmbientColor:](self, "setAmbientColor:", 0.0, 0.0, 0.0, v2);
  if (self->_firstLight) {
    float v4 = 1.0;
  }
  LODWORD(v8) = 1.0;
  *(float *)&double v5 = v4;
  *(float *)&double v6 = v4;
  *(float *)&double v7 = v4;
  -[GLKEffectPropertyLight setDiffuseColor:](self, "setDiffuseColor:", v5, v6, v7, v8);
  LODWORD(v9) = 1.0;
  *(float *)&double v10 = v4;
  *(float *)&double v11 = v4;
  *(float *)&double v12 = v4;
  -[GLKEffectPropertyLight setSpecularColor:](self, "setSpecularColor:", v10, v11, v12, v9);
  *(void *)&self->_spotDirection.x = 0;
  self->_spotDirection.z = -1.0;
  *(void *)&self->_normalizedSpotDirectionEye.x = 0;
  self->_normalizedSpotDirectionEye.z = -1.0;
  self->_spotExponent = 0.0;
  self->_spotCutoff = 3.1416;
  self->_spotCutoffDegrees = 180.0;
  self->_constantAttenuation = 1.0;
  self->_linearAttenuation = 0.0;
  self->_quadraticAttenuation = 0.0;
}

- (void)initializeMasks
{
  *(void *)self->super._prv = [*((id *)self->super._prv + 4) vshMask];
  *((void *)self->super._prv + 2) = [*((id *)self->super._prv + 4) fshMask];
  _setMasks((uint64_t)self);
  uint64_t v3 = *((void *)self->super._prv + 4);
  if (v3)
  {
    _lightStateChanged(v3);
    _vPositionEyeMask(*((void *)self->super._prv + 4));
    _normalizedNormalsMask(*((void *)self->super._prv + 4));
    _modelviewMatrixMask(*((void *)self->super._prv + 4));
  }

  [(GLKEffectProperty *)self setMasksInitialized:1];
}

- (void)setShaderBindings
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  GLint params = 0;
  glGetIntegerv(0x8B8Du, &params);
  snprintf(__str, 0x3FuLL, "light_positionEye[%d]", self->_lightIndex);
  self->_positionEyeLoc = glGetUniformLocation(params, __str);
  snprintf(__str, 0x3FuLL, "light_ambientColor[%d]", self->_lightIndex);
  self->_ambientLoc = glGetUniformLocation(params, __str);
  snprintf(__str, 0x3FuLL, "light_diffuseColor[%d]", self->_lightIndex);
  self->_diffuseLoc = glGetUniformLocation(params, __str);
  snprintf(__str, 0x3FuLL, "light_specularColor[%d]", self->_lightIndex);
  self->_specularLoc = glGetUniformLocation(params, __str);
  snprintf(__str, 0x3FuLL, "light_normalizedSpotDirectionEye[%d]", self->_lightIndex);
  self->_normalizedSpotDirectionEyeLoc = glGetUniformLocation(params, __str);
  snprintf(__str, 0x3FuLL, "light_spotExponent[%d]", self->_lightIndex);
  self->_spotExponentLoc = glGetUniformLocation(params, __str);
  snprintf(__str, 0x3FuLL, "light_spotCutoffAngle[%d]", self->_lightIndex);
  self->_spotCutoffLoc = glGetUniformLocation(params, __str);
  snprintf(__str, 0x3FuLL, "light_constantAttenuation[%d]", self->_lightIndex);
  self->_constantAttenuationLoc = glGetUniformLocation(params, __str);
  snprintf(__str, 0x3FuLL, "light_linearAttenuation[%d]", self->_lightIndex);
  self->_linearAttenuationLoc = glGetUniformLocation(params, __str);
  snprintf(__str, 0x3FuLL, "light_quadraticAttenuation[%d]", self->_lightIndex);
  self->_quadraticAttenuationLoc = glGetUniformLocation(params, __str);
  snprintf(__str, 0x3FuLL, "ambientTerm[%d]", self->_lightIndex);
  self->_ambientTermLoc = glGetUniformLocation(params, __str);
  self->_normalizeLoc = glGetUniformLocation(params, "normalizeNormal");
  [(GLKEffectPropertyLight *)self dirtyAllUniforms];
}

- (void)setTransform:(GLKEffectPropertyTransform *)transform
{
  if (transform)
  {
    uint64_t v5 = self->_transform;
    if (v5 != transform)
    {

      self->_transform = transform;
    }
  }
}

- (void)setSpotDirection:(GLKVector3)spotDirection
{
  p_spotDirection = &self->_spotDirection;
  self->_spotDirection.float x = x;
  self->_spotDirection.float y = y;
  self->_spotDirection.float z = z;
  transform = self->_transform;
  if (transform)
  {
    [(GLKEffectPropertyTransform *)transform normalMatrix];
    float x = p_spotDirection->x;
    float y = p_spotDirection->y;
    float z = p_spotDirection->z;
    float32x2_t v9 = *(float32x2_t *)&v19[0];
    float32x2_t v10 = *(float32x2_t *)((char *)v19 + 12);
    float32x2_t v11 = *(float32x2_t *)((char *)&v19[1] + 8);
    float v12 = *((float *)v19 + 2);
    float v13 = *((float *)&v19[1] + 1);
    float v14 = v20[0];
  }
  else
  {
    v20[0] = 0.0;
    memset(v19, 0, sizeof(v19));
    float32x2_t v11 = 0;
    float v14 = 0.0;
    float v13 = 0.0;
    float v12 = 0.0;
    float32x2_t v9 = 0;
    float32x2_t v10 = 0;
  }
  float32x2_t v15 = vmul_n_f32(v10, y);
  float v16 = (float)((float)(y * v13) + (float)(v12 * x)) + (float)(v14 * z);
  float32x2_t v17 = vmla_n_f32(vmla_n_f32(v15, v9, x), v11, z);
  float v18 = 1.0 / sqrtf(vmlas_n_f32(COERCE_FLOAT(vmul_f32(v17, v17).i32[1]), v17.f32[0], v17.f32[0]) + (float)(v16 * v16));
  *(float32x2_t *)&self->_normalizedSpotDirectionEye.float x = vmul_n_f32(v17, v18);
  self->_normalizedSpotDirectionEye.float z = v16 * v18;
  [(GLKEffectProperty *)self setDirtyUniforms:[(GLKEffectProperty *)self dirtyUniforms] | 0x4000000000];
}

- (void)setSpecularColor:(GLKVector4)specularColor
{
  v7.i64[0] = __PAIR64__(LODWORD(v4), LODWORD(v3));
  v7.i64[1] = __PAIR64__(LODWORD(v6), LODWORD(v5));
  int8x16_t v8 = (int8x16_t)vceqq_f32(v7, (float32x4_t)self->_specularColor);
  *(int8x8_t *)v8.i8 = vand_s8((int8x8_t)*(_OWORD *)&vextq_s8(v8, v8, 8uLL), vand_s8(*(int8x8_t *)v8.i8, (int8x8_t)0x100000001));
  if (!vand_s8((int8x8_t)vdup_lane_s32(*(int32x2_t *)v8.i8, 1), *(int8x8_t *)v8.i8).u32[0])
  {
    self->_specularColor.float x = v3;
    self->_specularColor.float y = v4;
    self->_specularColor.float z = v5;
    self->_specularColor.w = v6;
    unint64_t v10 = [(GLKEffectProperty *)self dirtyUniforms] | 0x2000000000;
    [(GLKEffectProperty *)self setDirtyUniforms:v10];
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
    self->_diffuseColor.float x = v3;
    self->_diffuseColor.float y = v4;
    self->_diffuseColor.float z = v5;
    self->_diffuseColor.w = v6;
    unint64_t v10 = [(GLKEffectProperty *)self dirtyUniforms] | 0x100000000;
    [(GLKEffectProperty *)self setDirtyUniforms:v10];
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
    self->_ambientColor.float x = v3;
    self->_ambientColor.float y = v4;
    self->_ambientColor.float z = v5;
    self->_ambientColor.w = v6;
    [(GLKEffectProperty *)self setDirtyUniforms:[(GLKEffectProperty *)self dirtyUniforms] | 0x40000000];
    effectDirtyUniforms = self->_effectDirtyUniforms;
    if (effectDirtyUniforms) {
      *effectDirtyUniforms |= 0x40000000uLL;
    }
  }
}

- (void)setPosition:(GLKVector4)position
{
  float v7 = v4;
  transform = self->_transform;
  if (transform)
  {
    float v34 = v5;
    float v36 = v6;
    float v30 = v3;
    float v32 = v4;
    [(GLKEffectPropertyTransform *)transform modelviewMatrix];
    float v3 = v30;
    float v7 = v32;
    float v5 = v34;
    float v6 = v36;
    float32x4_t v10 = v38;
    float32x4_t v11 = v39;
    float32x4_t v12 = v40;
    float32x4_t v13 = v41;
  }
  else
  {
    float32x4_t v13 = 0uLL;
    float32x4_t v12 = 0uLL;
    float32x4_t v11 = 0uLL;
    float32x4_t v10 = 0uLL;
  }
  float32x4_t v14 = vaddq_f32(vaddq_f32(vmulq_n_f32(v10, v3), vmulq_n_f32(v11, v7)), vaddq_f32(vmulq_n_f32(v12, v5), vmulq_n_f32(v13, v6)));
  if (v14.f32[3] == 0.0)
  {
    float32x4_t v15 = vmulq_f32(v14, v14);
    v15.i64[0] = vpaddq_f32(v15, v15).u64[0];
    *(float32x2_t *)v15.f32 = vpadd_f32(*(float32x2_t *)v15.f32, *(float32x2_t *)v15.f32);
    v15.f32[0] = 1.0 / sqrtf(v15.f32[0]);
    float32x4_t v16 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v15.f32, 0);
  }
  else
  {
    float32x4_t v17 = (float32x4_t)vdupq_laneq_s32((int32x4_t)v14, 3);
    float32x4_t v18 = vrecpeq_f32(v17);
    float32x4_t v19 = vmulq_f32(v18, vrecpsq_f32(v17, v18));
    float32x4_t v16 = vmulq_f32(vrecpsq_f32(v17, v19), v19);
  }
  _GLKVector4 v20 = (_GLKVector4)vmulq_f32(v14, v16);
  if (v20.x != self->_positionEye.x) {
    goto LABEL_12;
  }
  if (v20.y != self->_positionEye.y) {
    goto LABEL_12;
  }
  if (v20.z != self->_positionEye.z) {
    goto LABEL_12;
  }
  if (v20.w != self->_positionEye.w) {
    goto LABEL_12;
  }
  float v35 = v5;
  float v37 = v6;
  float v31 = v3;
  float v33 = v7;
  _GLKVector4 v29 = v20;
  int v21 = [(GLKEffectProperty *)self masksInitialized];
  _GLKVector4 v20 = v29;
  float v3 = v31;
  float v7 = v33;
  float v5 = v35;
  float v6 = v37;
  if (!v21)
  {
LABEL_12:
    self->_position.float x = v3;
    self->_position.float y = v7;
    self->_position.float z = v5;
    self->_position.w = v6;
    self->_positionEye = v20;
    _vPositionEyeMask(*((void *)self->super._prv + 4));
    _modelviewMatrixMask(*((void *)self->super._prv + 4));
    int v22 = [(GLKEffectPropertyLight *)self isSpot];
    prv = self->super._prv;
    v24 = *(int8x16_t **)prv;
    lightIndefloat x = self->_lightIndex;
    uint64_t v26 = 6;
    if (v22) {
      uint64_t v27 = 6;
    }
    else {
      uint64_t v27 = 12;
    }
    if (v22) {
      uint64_t v26 = 12;
    }
    int8x16_t *v24 = vorrq_s8(*v24, *(int8x16_t *)&_staticVshMasks_0[2 * lightIndex + v27]);
    v28 = (int8x16_t *)*((void *)prv + 2);
    int8x16_t *v28 = vorrq_s8(*v28, *(int8x16_t *)&_staticFshMasks[2 * lightIndex + v27]);
    int8x16_t *v24 = vbicq_s8(*v24, *(int8x16_t *)&_staticVshMasks_0[2 * lightIndex + v26]);
    int8x16_t *v28 = vbicq_s8(*v28, *(int8x16_t *)&_staticFshMasks[2 * lightIndex + v26]);
    _attenuateMask((uint64_t)self);
    _positionalLightMask((uint64_t)self);
    _directionalLightMask((uint64_t)self);
    [(GLKEffectProperty *)self setDirtyUniforms:[(GLKEffectProperty *)self dirtyUniforms] | 0x800000000];
  }
}

- (void)setNormalize:(unsigned __int8)a3
{
}

- (void)setEnabled:(GLBOOLean)enabled
{
  if (self->_enabled != enabled || ![(GLKEffectProperty *)self masksInitialized])
  {
    self->_enabled = enabled;
    _lightStateChanged(*((void *)self->super._prv + 4));
    _setMasks((uint64_t)self);
    _vPositionEyeMask(*((void *)self->super._prv + 4));
    _normalizedNormalsMask(*((void *)self->super._prv + 4));
    uint64_t v5 = *((void *)self->super._prv + 4);
    _modelviewMatrixMask(v5);
  }
}

- (void)setLightingType:(int)a3
{
  if (self->_lightingType != a3 || ![(GLKEffectProperty *)self masksInitialized])
  {
    self->_lightingType = a3;
    _lightStateChanged(*((void *)self->super._prv + 4));
    _setMasks((uint64_t)self);
  }
}

- (void)setSpotExponent:(GLfloat)spotExponent
{
  if (self->_spotExponent != spotExponent)
  {
    self->_spotExponent = spotExponent;
    unint64_t v4 = [(GLKEffectProperty *)self dirtyUniforms] | 0x8000000000;
    [(GLKEffectProperty *)self setDirtyUniforms:v4];
  }
}

- (void)setQuadraticAttenuation:(GLfloat)quadraticAttenuation
{
  if (self->_quadraticAttenuation != quadraticAttenuation)
  {
    self->_quadraticAttenuation = quadraticAttenuation;
    _attenuateMask((uint64_t)self);
    _modelviewMatrixMask(*((void *)self->super._prv + 4));
    unint64_t v4 = [(GLKEffectProperty *)self dirtyUniforms] | 0x1000000000;
    [(GLKEffectProperty *)self setDirtyUniforms:v4];
  }
}

- (void)setLinearAttenuation:(GLfloat)linearAttenuation
{
  if (self->_linearAttenuation != linearAttenuation)
  {
    self->_linearAttenuation = linearAttenuation;
    _attenuateMask((uint64_t)self);
    _modelviewMatrixMask(*((void *)self->super._prv + 4));
    unint64_t v4 = [(GLKEffectProperty *)self dirtyUniforms] | 0x400000000;
    [(GLKEffectProperty *)self setDirtyUniforms:v4];
  }
}

- (void)setConstantAttenuation:(GLfloat)constantAttenuation
{
  if (self->_constantAttenuation != constantAttenuation)
  {
    self->_constantAttenuation = constantAttenuation;
    _attenuateMask((uint64_t)self);
    _modelviewMatrixMask(*((void *)self->super._prv + 4));
    unint64_t v4 = [(GLKEffectProperty *)self dirtyUniforms] | 0x80000000;
    [(GLKEffectProperty *)self setDirtyUniforms:v4];
  }
}

- (void)setSpotCutoff:(GLfloat)spotCutoff
{
  if (self->_spotCutoffDegrees != spotCutoff)
  {
    self->_spotCutoffDegrees = spotCutoff;
    float v4 = spotCutoff * 0.0174532925;
    self->_spotCutoff = v4;
    int v5 = [(GLKEffectPropertyLight *)self isSpot];
    lightIndefloat x = self->_lightIndex;
    uint64_t v7 = 6;
    if (v5) {
      uint64_t v8 = 6;
    }
    else {
      uint64_t v8 = 12;
    }
    *(int8x16_t *)*(void *)self->super._prv = vorrq_s8(*(int8x16_t *)*(void *)self->super._prv, *(int8x16_t *)&_staticVshMasks_0[2 * lightIndex + v8]);
    *(int8x16_t *)*((void *)self->super._prv + 2) = vorrq_s8(*(int8x16_t *)*((void *)self->super._prv + 2), *(int8x16_t *)&_staticFshMasks[2 * lightIndex + v8]);
    if (v5) {
      uint64_t v7 = 12;
    }
    *(int8x16_t *)*(void *)self->super._prv = vbicq_s8(*(int8x16_t *)*(void *)self->super._prv, *(int8x16_t *)&_staticVshMasks_0[2 * lightIndex + v7]);
    *(int8x16_t *)*((void *)self->super._prv + 2) = vbicq_s8(*(int8x16_t *)*((void *)self->super._prv + 2), *(int8x16_t *)&_staticFshMasks[2 * lightIndex + v7]);
    unint64_t v9 = [(GLKEffectProperty *)self dirtyUniforms] | 0x10000000000;
    [(GLKEffectProperty *)self setDirtyUniforms:v9];
  }
}

- (GLfloat)spotCutoff
{
  return self->_spotCutoffDegrees;
}

+ (void)setStaticMasksWithVshRoot:(id)a3 fshRoot:(id)a4
{
  uint64_t v6 = 0;
  uint64_t v7 = &unk_267BDA778;
  uint64_t v8 = &unk_267BDA628;
  do
  {
    uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"lighting%d", v6);
    *(v8 - 1) = +[GLKShaderBlockNode maskForLabel:v9 root:a3 index:v6];
    void *v8 = v10;
    *(v7 - 1) = +[GLKShaderBlockNode maskForLabel:v9 root:a4 index:v6];
    *uint64_t v7 = v11;
    ++v6;
    v7 += 2;
    v8 += 2;
  }
  while (v6 != 3);
  float32x4_t v12 = &unk_267BDA658;
  for (uint64_t i = 1; i != 7; ++i)
  {
    uint64_t v14 = 0;
    float32x4_t v15 = _maskStrs_0[i];
    float32x4_t v16 = v12;
    do
    {
      *(v16 - 1) = +[GLKShaderBlockNode maskForLabel:v15 root:a3 index:v14];
      *float32x4_t v16 = v17;
      ++v14;
      v16 += 2;
    }
    while (v14 != 3);
    v12 += 6;
  }
  float32x4_t v18 = &unk_267BDA7A8;
  for (uint64_t j = 1; j != 7; ++j)
  {
    uint64_t v20 = 0;
    int v21 = _maskStrs_0[j];
    int v22 = v18;
    do
    {
      *(v22 - 1) = +[GLKShaderBlockNode maskForLabel:v21 root:a4 index:v20];
      *int v22 = v23;
      ++v20;
      v22 += 2;
    }
    while (v20 != 3);
    v18 += 6;
  }
}

- (BOOL)includeVshShaderTextForRootNode:(id)a3
{
  BOOL result = (*(_OWORD *)((unsigned char *)a3 + 8) & *(_OWORD *)&self->_allVshMasks) == 0
        || (float v3 = *(void **)self->super._prv, (*v3 & *((void *)a3 + 1)) != 0)
        || (*((void *)a3 + 2) & v3[1]) != 0;
  return result;
}

- (BOOL)includeFshShaderTextForRootNode:(id)a3
{
  BOOL result = (*(_OWORD *)((unsigned char *)a3 + 8) & *(_OWORD *)&self->_allFshMasks) == 0
        || (float v3 = (void *)*((void *)self->super._prv + 2), (*v3 & *((void *)a3 + 1)) != 0)
        || (*((void *)a3 + 2) & v3[1]) != 0;
  return result;
}

- (unsigned)isSpot
{
  return self->_spotCutoff != 3.1416 && self->_position.w != 0.0;
}

- (unsigned)isAttenuated
{
  [(GLKEffectPropertyLight *)self position];
  unsigned __int8 result = 0;
  if (v3 != 0.0)
  {
    [(GLKEffectPropertyLight *)self constantAttenuation];
    if (v4 != 1.0) {
      return 1;
    }
    [(GLKEffectPropertyLight *)self linearAttenuation];
    if (v5 != 0.0) {
      return 1;
    }
    [(GLKEffectPropertyLight *)self quadraticAttenuation];
    if (v6 != 0.0) {
      return 1;
    }
  }
  return result;
}

- (void)bind
{
  if ([(GLKEffectPropertyLight *)self enabled] && [(GLKEffectProperty *)self dirtyUniforms])
  {
    glUniform1i(self->_normalizeLoc, 1);
    if (([(GLKEffectProperty *)self dirtyUniforms] & 0x800000000) != 0) {
      glUniform4fv(self->_positionEyeLoc, 1, &self->_positionEye.x);
    }
    if (([(GLKEffectProperty *)self dirtyUniforms] & 0x40000000) != 0) {
      glUniform4fv(self->_ambientLoc, 1, &self->_ambientColor.x);
    }
    if (([(GLKEffectProperty *)self dirtyUniforms] & 0x100000000) != 0) {
      glUniform4fv(self->_diffuseLoc, 1, &self->_diffuseColor.x);
    }
    if (([(GLKEffectProperty *)self dirtyUniforms] & 0x2000000000) != 0) {
      glUniform4fv(self->_specularLoc, 1, &self->_specularColor.x);
    }
    if (self->_position.w != 0.0)
    {
      if (([(GLKEffectProperty *)self dirtyUniforms] & 0x4000000000) != 0) {
        glUniform3fv(self->_normalizedSpotDirectionEyeLoc, 1, &self->_normalizedSpotDirectionEye.x);
      }
      if (([(GLKEffectProperty *)self dirtyUniforms] & 0x8000000000) != 0) {
        glUniform1f(self->_spotExponentLoc, self->_spotExponent);
      }
      if (([(GLKEffectProperty *)self dirtyUniforms] & 0x10000000000) != 0) {
        glUniform1f(self->_spotCutoffLoc, self->_spotCutoff);
      }
      if (([(GLKEffectProperty *)self dirtyUniforms] & 0x80000000) != 0) {
        glUniform1f(self->_constantAttenuationLoc, self->_constantAttenuation);
      }
      if (([(GLKEffectProperty *)self dirtyUniforms] & 0x400000000) != 0) {
        glUniform1f(self->_linearAttenuationLoc, self->_linearAttenuation);
      }
      if (([(GLKEffectProperty *)self dirtyUniforms] & 0x1000000000) != 0) {
        glUniform1f(self->_quadraticAttenuationLoc, self->_quadraticAttenuation);
      }
    }
    [(GLKEffectProperty *)self setDirtyUniforms:0];
  }
}

- (void)setLightIndex:(int)a3
{
  if (self->_lightIndex != a3)
  {
    uint64_t v3 = 0;
    self->_lightIndefloat x = a3;
    GLKBigInt_s v4 = (GLKBigInt_s)0;
    self->_allVshMasks = 0u;
    do
    {
      GLKBigInt_s v4 = (GLKBigInt_s)vorrq_s8((int8x16_t)v4, *(int8x16_t *)&_staticVshMasks_0[2 * a3 + v3]);
      self->_allVshMasks = v4;
      v3 += 6;
    }
    while (v3 != 42);
    uint64_t v5 = 0;
    GLKBigInt_s v6 = (GLKBigInt_s)0;
    self->_allFshMasks = 0u;
    do
    {
      GLKBigInt_s v6 = (GLKBigInt_s)vorrq_s8((int8x16_t)v6, *(int8x16_t *)&_staticFshMasks[2 * a3 + v5]);
      self->_allFshMasks = v6;
      v5 += 6;
    }
    while (v5 != 42);
  }
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  [v3 appendFormat:@"%@ = %p\n{\n", objc_msgSend((id)objc_opt_class(), "description"), self];
  *(void *)&v6.float x = objc_msgSend(v3, "appendFormat:", @"\tenabled =        %d\n", self->_enabled);
  *(void *)&v7.float x = [v3 appendFormat:@"\tposition =       %@\n", NSStringFromGLKVector4(v6)];
  *(void *)&v8.float x = [v3 appendFormat:@"\tambientColor =   %@\n", NSStringFromGLKVector4(v7)];
  *(void *)&v9.float x = [v3 appendFormat:@"\tdiffuseColor =   %@\n", NSStringFromGLKVector4(v8)];
  *(void *)&v5.float x = [v3 appendFormat:@"\tspecularColor =  %@\n", NSStringFromGLKVector4(v9)];
  [v3 appendFormat:@"\tspotDirection =  %@\n", NSStringFromGLKVector3(v5)];
  objc_msgSend(v3, "appendFormat:", @"\tspotExponent =   %-6.4f\n", self->_spotExponent);
  objc_msgSend(v3, "appendFormat:", @"\tspotCutoff =     %-6.4f\n", self->_spotCutoff);
  objc_msgSend(v3, "appendFormat:", @"\tconstantAtten =  %-6.4f\n", self->_constantAttenuation);
  objc_msgSend(v3, "appendFormat:", @"\tlinearAtten =    %-6.4f\n", self->_linearAttenuation);
  objc_msgSend(v3, "appendFormat:", @"\tquadraticAtten = %-6.4f\n", self->_linearAttenuation);
  [v3 appendFormat:@"\ttransform =      %@\n", -[GLKEffectPropertyTransform description](self->_transform, "description")];
  [v3 appendFormat:@"}"];
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)GLKEffectPropertyLight;
  [(GLKEffectProperty *)&v3 dealloc];
}

- (GLBOOLean)enabled
{
  return self->_enabled;
}

- (GLKVector4)position
{
  *(void *)&result.v[2] = a2;
  *(void *)&result.float x = self;
  return result;
}

- (_GLKVector4)positionEye
{
  *(void *)&result.v[2] = a2;
  *(void *)&result.float x = self;
  return result;
}

- (void)setPositionEye:(_GLKVector4)a3
{
  self->_positionEye.float x = v3;
  self->_positionEye.float y = v4;
  self->_positionEye.float z = v5;
  self->_positionEye.w = v6;
}

- (GLKVector4)ambientColor
{
  *(void *)&result.v[2] = a2;
  *(void *)&result.float x = self;
  return result;
}

- (GLKVector4)diffuseColor
{
  *(void *)&result.v[2] = a2;
  *(void *)&result.float x = self;
  return result;
}

- (GLKVector4)specularColor
{
  *(void *)&result.v[2] = a2;
  *(void *)&result.float x = self;
  return result;
}

- (GLKVector3)spotDirection
{
  result.float z = *(float *)&a2;
  *(void *)&result.float x = self;
  return result;
}

- (_GLKVector3)normalizedSpotDirectionEye
{
  result.float z = *(float *)&a2;
  *(void *)&result.float x = self;
  return result;
}

- (void)setNormalizedSpotDirectionEye:(_GLKVector3)a3
{
  self->_normalizedSpotDirectionEye.float x = v3;
  self->_normalizedSpotDirectionEye.float y = v4;
  self->_normalizedSpotDirectionEye.float z = v5;
}

- (GLfloat)spotExponent
{
  return self->_spotExponent;
}

- (float)spotCutoffDegrees
{
  return self->_spotCutoffDegrees;
}

- (void)setSpotCutoffDegrees:(float)a3
{
  self->_spotCutoffDegrees = a3;
}

- (GLfloat)constantAttenuation
{
  return self->_constantAttenuation;
}

- (GLfloat)linearAttenuation
{
  return self->_linearAttenuation;
}

- (GLfloat)quadraticAttenuation
{
  return self->_quadraticAttenuation;
}

- (unint64_t)effectDirtyUniforms
{
  return self->_effectDirtyUniforms;
}

- (void)setEffectDirtyUniforms:(unint64_t *)a3
{
  self->_effectDirtyUniforms = a3;
}

- (GLKEffectPropertyTransform)transform
{
  return self->_transform;
}

- (unsigned)positionEyeStale
{
  return self->_positionEyeStale;
}

- (void)setPositionEyeStale:(unsigned __int8)a3
{
  self->_positionEyeStale = a3;
}

- (int)positionEyeLoc
{
  return self->_positionEyeLoc;
}

- (void)setPositionEyeLoc:(int)a3
{
  self->_positionEyeLoc = a3;
}

- (int)ambientLoc
{
  return self->_ambientLoc;
}

- (void)setAmbientLoc:(int)a3
{
  self->_ambientLoc = a3;
}

- (int)diffuseLoc
{
  return self->_diffuseLoc;
}

- (void)setDiffuseLoc:(int)a3
{
  self->_diffuseLoc = a3;
}

- (int)specularLoc
{
  return self->_specularLoc;
}

- (void)setSpecularLoc:(int)a3
{
  self->_specularLoc = a3;
}

- (int)normalizedSpotDirectionEyeLoc
{
  return self->_normalizedSpotDirectionEyeLoc;
}

- (void)setNormalizedSpotDirectionEyeLoc:(int)a3
{
  self->_normalizedSpotDirectionEyeLoc = a3;
}

- (int)spotExponentLoc
{
  return self->_spotExponentLoc;
}

- (void)setSpotExponentLoc:(int)a3
{
  self->_spotExponentLoc = a3;
}

- (int)spotCutoffLoc
{
  return self->_spotCutoffLoc;
}

- (void)setSpotCutoffLoc:(int)a3
{
  self->_spotCutoffLoc = a3;
}

- (int)constantAttenuationLoc
{
  return self->_constantAttenuationLoc;
}

- (void)setConstantAttenuationLoc:(int)a3
{
  self->_constantAttenuationLoc = a3;
}

- (int)linearAttenuationLoc
{
  return self->_linearAttenuationLoc;
}

- (void)setLinearAttenuationLoc:(int)a3
{
  self->_linearAttenuationLoc = a3;
}

- (int)quadraticAttenuationLoc
{
  return self->_quadraticAttenuationLoc;
}

- (void)setQuadraticAttenuationLoc:(int)a3
{
  self->_quadraticAttenuationLoc = a3;
}

- (int)normalizeLoc
{
  return self->_normalizeLoc;
}

- (void)setNormalizeLoc:(int)a3
{
  self->_normalizeLoc = a3;
}

- (int)ambientTermLoc
{
  return self->_ambientTermLoc;
}

- (void)setAmbientTermLoc:(int)a3
{
  self->_ambientTermLoc = a3;
}

- (int)lightIndex
{
  return self->_lightIndex;
}

- (int)lightingType
{
  return self->_lightingType;
}

- (unsigned)firstLight
{
  return self->_firstLight;
}

- (void)setFirstLight:(unsigned __int8)a3
{
  self->_firstLight = a3;
}

- (GLKBigInt_s)allVshMasks
{
  p_allVshMasks = &self->_allVshMasks;
  unint64_t n0 = self->_allVshMasks.n0;
  unint64_t n1 = p_allVshMasks->n1;
  result.unint64_t n1 = n1;
  result.unint64_t n0 = n0;
  return result;
}

- (GLKBigInt_s)allFshMasks
{
  p_allFshMasks = &self->_allFshMasks;
  unint64_t n0 = self->_allFshMasks.n0;
  unint64_t n1 = p_allFshMasks->n1;
  result.unint64_t n1 = n1;
  result.unint64_t n0 = n0;
  return result;
}

@end