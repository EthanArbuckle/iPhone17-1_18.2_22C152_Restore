@interface GLKEffectPropertyFog
+ (void)setStaticMasksWithVshRoot:(id)a3 fshRoot:(id)a4;
- (BOOL)includeFshShaderTextForRootNode:(id)a3;
- (BOOL)includeVshShaderTextForRootNode:(id)a3;
- (GLBOOLean)enabled;
- (GLKEffectPropertyFog)init;
- (GLKVector4)color;
- (GLfloat)density;
- (GLfloat)end;
- (GLfloat)start;
- (GLint)mode;
- (id)description;
- (int)colorLoc;
- (int)densityLoc;
- (int)endLoc;
- (int)modeLoc;
- (int)startLoc;
- (void)bind;
- (void)dealloc;
- (void)dirtyAllUniforms;
- (void)initializeMasks;
- (void)setColor:(GLKVector4)color;
- (void)setColorLoc:(int)a3;
- (void)setDensity:(GLfloat)density;
- (void)setDensityLoc:(int)a3;
- (void)setEnabled:(GLBOOLean)enabled;
- (void)setEnd:(GLfloat)end;
- (void)setEndLoc:(int)a3;
- (void)setMode:(GLint)mode;
- (void)setModeLoc:(int)a3;
- (void)setShaderBindings;
- (void)setStart:(GLfloat)start;
- (void)setStartLoc:(int)a3;
@end

@implementation GLKEffectPropertyFog

- (GLKEffectPropertyFog)init
{
  v5.receiver = self;
  v5.super_class = (Class)GLKEffectPropertyFog;
  v2 = [(GLKEffectProperty *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_enabled = 0;
    v2->_mode = 0;
    *(void *)&v2->_color.x = 0;
    *(void *)&v2->_color.v[2] = 0;
    v2->_density = 1.0;
    v2->_end = 1.0;
    v2->_start = 0.0;
    [(GLKEffectProperty *)v2 setMasksInitialized:0];
  }
  return v3;
}

- (void)dirtyAllUniforms
{
}

- (void)initializeMasks
{
  *(void *)self->super._prv = [*((id *)self->super._prv + 4) vshMask];
  *((void *)self->super._prv + 2) = [*((id *)self->super._prv + 4) fshMask];
  prv = self->super._prv;
  v4 = *(int8x16_t **)prv;
  if (self->_enabled)
  {
    uint64_t v5 = v4->i64[1] | *((void *)&_staticVshMasks + 1);
    v4->i64[0] |= _staticVshMasks;
    v4->i64[1] = v5;
    v6 = (void *)*((void *)prv + 2);
    uint64_t v7 = v6[1] | _staticFshMasks_1;
    *v6 |= _staticFshMasks_0;
    v6[1] = v7;
  }
  else
  {
    int8x16_t *v4 = vbicq_s8(*v4, (int8x16_t)_staticVshMasks);
    *(int8x16_t *)*((void *)prv + 2) = vbicq_s8(*(int8x16_t *)*((void *)prv + 2), (int8x16_t)__PAIR128__(_staticFshMasks_1, _staticFshMasks_0));
  }
  uint64_t mode = self->_mode;
  if (mode <= 2)
  {
    v9 = *(&off_264339F88 + mode);
    v10 = *(&off_264339FA0 + mode);
    v11 = *(&off_264339FB8 + mode);
    v12 = *(&off_264339FD0 + mode);
    v13 = *(&off_264339FE8 + mode);
    v14 = *(&off_26433A000 + mode);
    uint64_t v15 = v4->i64[0] | *v9;
    uint64_t v16 = v4->i64[1] | *v10;
    v4->i64[0] = v15;
    v4->i64[1] = v16;
    uint64_t v17 = v15 & ~*v11;
    uint64_t v18 = v16 & ~*v12;
    v4->i64[0] = v17;
    v4->i64[1] = v18;
    uint64_t v19 = v18 & ~*v14;
    v4->i64[0] = v17 & ~*v13;
    v4->i64[1] = v19;
  }

  [(GLKEffectProperty *)self setMasksInitialized:1];
}

- (void)setEnabled:(GLBOOLean)enabled
{
  int v3 = enabled;
  if (self->_enabled != enabled || ![(GLKEffectProperty *)self masksInitialized])
  {
    self->_enabled = v3;
    uint64_t v5 = *(int8x16_t **)self->super._prv;
    if (v3)
    {
      uint64_t v6 = v5->i64[1] | *((void *)&_staticVshMasks + 1);
      v5->i64[0] |= _staticVshMasks;
      prv = self->super._prv;
      v5->i64[1] = v6;
      v8 = (void *)*((void *)prv + 2);
      uint64_t v9 = v8[1] | _staticFshMasks_1;
      *v8 |= _staticFshMasks_0;
      v8[1] = v9;
    }
    else
    {
      *uint64_t v5 = vbicq_s8(*v5, (int8x16_t)_staticVshMasks);
      *(int8x16_t *)*((void *)self->super._prv + 2) = vbicq_s8(*(int8x16_t *)*((void *)self->super._prv + 2), (int8x16_t)__PAIR128__(_staticFshMasks_1, _staticFshMasks_0));
    }
  }
}

- (void)setMode:(GLint)mode
{
  if (self->_mode == mode)
  {
    if ([(GLKEffectProperty *)self masksInitialized] || mode >= 3) {
      return;
    }
  }
  else if (mode > 2)
  {
    return;
  }
  uint64_t v5 = (int8x16_t *)*(&off_264339FB8 + mode);
  uint64_t v6 = (uint64_t *)*(&off_264339FE8 + mode);
  uint64_t v7 = *(void **)self->super._prv;
  v8 = (uint64_t *)*(&off_26433A000 + mode);
  uint64_t v9 = v7[1] | *(void *)*(&off_264339FA0 + mode);
  *v7 |= *(void *)*(&off_264339F88 + mode);
  v7[1] = v9;
  *(int8x16_t *)*(void *)self->super._prv = vbicq_s8(*(int8x16_t *)*(void *)self->super._prv, *v5);
  v10.i64[0] = *v6;
  v10.i64[1] = *v8;
  *(int8x16_t *)*(void *)self->super._prv = vbicq_s8(*(int8x16_t *)*(void *)self->super._prv, v10);
  self->_uint64_t mode = mode;
  unint64_t v11 = [(GLKEffectProperty *)self dirtyUniforms] | 0x2000;

  [(GLKEffectProperty *)self setDirtyUniforms:v11];
}

- (void)setDensity:(GLfloat)density
{
  if (self->_density != density)
  {
    self->_density = density;
    unint64_t v4 = [(GLKEffectProperty *)self dirtyUniforms] | 0x4000;
    [(GLKEffectProperty *)self setDirtyUniforms:v4];
  }
}

- (void)setStart:(GLfloat)start
{
  if (self->_start != start)
  {
    self->_start = start;
    unint64_t v4 = [(GLKEffectProperty *)self dirtyUniforms] | 0x8000;
    [(GLKEffectProperty *)self setDirtyUniforms:v4];
  }
}

- (void)setEnd:(GLfloat)end
{
  if (self->_end != end)
  {
    self->_end = end;
    unint64_t v4 = [(GLKEffectProperty *)self dirtyUniforms] | 0x10000;
    [(GLKEffectProperty *)self setDirtyUniforms:v4];
  }
}

- (void)setColor:(GLKVector4)color
{
  v7.i64[0] = __PAIR64__(LODWORD(v4), LODWORD(v3));
  v7.i64[1] = __PAIR64__(LODWORD(v6), LODWORD(v5));
  int8x16_t v8 = (int8x16_t)vceqq_f32(v7, (float32x4_t)self->_color);
  *(int8x8_t *)v8.i8 = vand_s8((int8x8_t)*(_OWORD *)&vextq_s8(v8, v8, 8uLL), vand_s8(*(int8x8_t *)v8.i8, (int8x8_t)0x100000001));
  if (!vand_s8((int8x8_t)vdup_lane_s32(*(int32x2_t *)v8.i8, 1), *(int8x8_t *)v8.i8).u32[0])
  {
    self->_color.x = v3;
    self->_color.y = v4;
    self->_color.z = v5;
    self->_color.w = v6;
    unint64_t v10 = [(GLKEffectProperty *)self dirtyUniforms] | 0x1000;
    [(GLKEffectProperty *)self setDirtyUniforms:v10];
  }
}

- (BOOL)includeVshShaderTextForRootNode:(id)a3
{
  BOOL result = (_allVshMasks & *(_OWORD *)((unsigned char *)a3 + 8)) == 0
        || (float v3 = *(void **)self->super._prv, (*v3 & *((void *)a3 + 1)) != 0)
        || (*((void *)a3 + 2) & v3[1]) != 0;
  return result;
}

- (BOOL)includeFshShaderTextForRootNode:(id)a3
{
  BOOL result = (_allFshMasks & *(_OWORD *)((unsigned char *)a3 + 8)) == 0
        || (float v3 = (void *)*((void *)self->super._prv + 2), (*v3 & *((void *)a3 + 1)) != 0)
        || (*((void *)a3 + 2) & v3[1]) != 0;
  return result;
}

+ (void)setStaticMasksWithVshRoot:(id)a3 fshRoot:(id)a4
{
  uint64_t v6 = 0;
  _allVshMasks = 0uLL;
  _allFshMasks = 0uLL;
  float32x4_t v7 = (void *)&_staticVshMasks + 1;
  do
  {
    uint64_t v8 = +[GLKShaderBlockNode maskForLabel:root:index:](GLKShaderBlockNode, "maskForLabel:root:index:", _maskStrs[v6], a3, [a3 index]);
    *(v7 - 1) = v8;
    *float32x4_t v7 = v9;
    *(void *)&_allVshMasks = _allVshMasks | v8;
    *((void *)&_allVshMasks + 1) |= v9;
    ++v6;
    v7 += 2;
  }
  while (v6 != 4);
  _staticFshMasks_0 = +[GLKShaderBlockNode maskForLabel:root:index:](GLKShaderBlockNode, "maskForLabel:root:index:", @"fog enabled", a4, [a4 index]);
  _staticFshMasks_1 = v10;
  *(void *)&_allFshMasks = _allFshMasks | _staticFshMasks_0;
  *((void *)&_allFshMasks + 1) |= v10;
}

- (void)setShaderBindings
{
  GLint params = 0;
  glGetIntegerv(0x8B8Du, &params);
  self->_modeLoc = glGetUniformLocation(params, "fog.mode");
  self->_colorLoc = glGetUniformLocation(params, "fog.color");
  self->_densityLoc = glGetUniformLocation(params, "fog.density");
  self->_startLoc = glGetUniformLocation(params, "fog.start");
  self->_endLoc = glGetUniformLocation(params, "fog.end");
  [(GLKEffectPropertyFog *)self dirtyAllUniforms];
}

- (void)bind
{
  if ([(GLKEffectProperty *)self dirtyUniforms])
  {
    if (([(GLKEffectProperty *)self dirtyUniforms] & 0x1000) != 0) {
      glUniform4fv(self->_colorLoc, 1, &self->_color.x);
    }
    if (([(GLKEffectProperty *)self dirtyUniforms] & 0x2000) != 0) {
      glUniform1i(self->_modeLoc, self->_mode);
    }
    if (([(GLKEffectProperty *)self dirtyUniforms] & 0x4000) != 0) {
      glUniform1f(self->_densityLoc, self->_density);
    }
    if (([(GLKEffectProperty *)self dirtyUniforms] & 0x8000) != 0) {
      glUniform1f(self->_startLoc, self->_start);
    }
    if (([(GLKEffectProperty *)self dirtyUniforms] & 0x10000) != 0) {
      glUniform1f(self->_endLoc, self->_end);
    }
    [(GLKEffectProperty *)self setDirtyUniforms:0];
  }
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  [v3 appendFormat:@"%@ = %p\n{\n", objc_msgSend((id)objc_opt_class(), "description"), self];
  objc_msgSend(v3, "appendFormat:", @"\tenabled = %d\n", self->_enabled);
  int mode = self->_mode;
  float v5 = @"GLKFogModeLinear";
  if (mode == 1) {
    float v5 = @"GLKFogModeExp2";
  }
  if (mode) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = @"GLKFogModeExp";
  }
  *(void *)&v8.x = [v3 appendFormat:@"\tint mode =    %@\n", v6];
  [v3 appendFormat:@"\tcolor =   %@\n", NSStringFromGLKVector4(v8)];
  objc_msgSend(v3, "appendFormat:", @"\tdensity = %6.4f\n", self->_density);
  objc_msgSend(v3, "appendFormat:", @"\tstart =   %6.4f\n", self->_start);
  objc_msgSend(v3, "appendFormat:", @"\tend =     %6.4f\n", self->_end);
  [v3 appendFormat:@"}"];
  return v3;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)GLKEffectPropertyFog;
  [(GLKEffectProperty *)&v2 dealloc];
}

- (GLBOOLean)enabled
{
  return self->_enabled;
}

- (GLint)mode
{
  return self->_mode;
}

- (GLKVector4)color
{
  *(void *)&result.v[2] = a2;
  *(void *)&result.x = self;
  return result;
}

- (GLfloat)density
{
  return self->_density;
}

- (GLfloat)start
{
  return self->_start;
}

- (GLfloat)end
{
  return self->_end;
}

- (int)modeLoc
{
  return self->_modeLoc;
}

- (void)setModeLoc:(int)a3
{
  self->_modeLoc = a3;
}

- (int)colorLoc
{
  return self->_colorLoc;
}

- (void)setColorLoc:(int)a3
{
  self->_colorLoc = a3;
}

- (int)densityLoc
{
  return self->_densityLoc;
}

- (void)setDensityLoc:(int)a3
{
  self->_densityLoc = a3;
}

- (int)startLoc
{
  return self->_startLoc;
}

- (void)setStartLoc:(int)a3
{
  self->_startLoc = a3;
}

- (int)endLoc
{
  return self->_endLoc;
}

- (void)setEndLoc:(int)a3
{
  self->_endLoc = a3;
}

@end