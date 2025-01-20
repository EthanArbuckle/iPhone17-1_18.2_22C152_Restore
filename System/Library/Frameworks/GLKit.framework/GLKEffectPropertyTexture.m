@interface GLKEffectPropertyTexture
+ (void)clearAllTexturingMasks:(GLKBigInt_s *)a3 fshMask:(GLKBigInt_s *)a4;
+ (void)setStaticMasksWithVshRoot:(id)a3 fshRoot:(id)a4;
- (BOOL)includeFshShaderTextForRootNode:(id)a3;
- (BOOL)includeVshShaderTextForRootNode:(id)a3;
- (GLBOOLean)enabled;
- (GLKBigInt_s)allFshMasks;
- (GLKEffectPropertyTexGen)texGenR;
- (GLKEffectPropertyTexGen)texGenS;
- (GLKEffectPropertyTexGen)texGenT;
- (GLKEffectPropertyTexture)init;
- (GLKTextureEnvMode)envMode;
- (GLKTextureTarget)target;
- (GLuint)name;
- (NSMutableArray)texGenArray;
- (NSString)filePath;
- (char)unit2dNameString;
- (char)unitCubeNameString;
- (id)description;
- (int)textureIndex;
- (int)unit2dLoc;
- (int)unitCubeLoc;
- (unsigned)matrixEnabled;
- (unsigned)normalizedNormalsMask;
- (unsigned)useTexCoordAttribMask;
- (unsigned)vNormalEyeMask;
- (unsigned)vPositionEyeMask;
- (void)bind;
- (void)dealloc;
- (void)dirtyAllUniforms;
- (void)initializeMasks;
- (void)setEnabled:(GLBOOLean)enabled;
- (void)setEnvMode:(GLKTextureEnvMode)envMode;
- (void)setMatrixEnabled:(unsigned __int8)a3;
- (void)setName:(GLuint)name;
- (void)setShaderBindings;
- (void)setTarget:(GLKTextureTarget)target;
- (void)setTextureIndex:(int)a3;
- (void)setUnit2dLoc:(int)a3;
- (void)setUnit2dNameString:(char *)a3;
- (void)setUnitCubeLoc:(int)a3;
- (void)setUnitCubeNameString:(char *)a3;
@end

@implementation GLKEffectPropertyTexture

- (GLKEffectPropertyTexture)init
{
  v5.receiver = self;
  v5.super_class = (Class)GLKEffectPropertyTexture;
  v2 = [(GLKEffectProperty *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_target = 3553;
    v2->_texGenR = 0;
    v2->_texGenT = 0;
    v2->_texGenS = 0;
    v2->_texGenArray = 0;
    [(GLKEffectPropertyTexture *)v2 setUnit2dNameString:0];
    [(GLKEffectPropertyTexture *)v3 setUnitCubeNameString:0];
    v3->_enabled = 1;
    v3->_matrixEnabled = 0;
    v3->_envMode = 1;
    v3->_textureIndex = -1;
    v3->_name = 0;
  }
  return v3;
}

- (void)dirtyAllUniforms
{
}

- (GLKEffectPropertyTexGen)texGenS
{
  result = self->_texGenS;
  if (!result)
  {
    if (!self->_texGenArray) {
      self->_texGenArray = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    }
    v4 = [[GLKEffectPropertyTexGen alloc] initWithMode:0 coord:0];
    self->_texGenS = v4;
    [(GLKEffectPropertyTexGen *)v4 setTextureIndex:self->_textureIndex];
    [(GLKEffectProperty *)self->_texGenS setEffect:*((void *)self->super._prv + 4)];
    _texGenSMask((uint64_t)self);
    _reflectionMapMask((uint64_t)self);
    [(NSMutableArray *)self->_texGenArray addObject:self->_texGenS];
    return self->_texGenS;
  }
  return result;
}

- (GLKEffectPropertyTexGen)texGenT
{
  result = self->_texGenT;
  if (!result)
  {
    if (!self->_texGenArray) {
      self->_texGenArray = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    }
    v4 = [[GLKEffectPropertyTexGen alloc] initWithMode:0 coord:1];
    self->_texGenT = v4;
    [(GLKEffectPropertyTexGen *)v4 setTextureIndex:self->_textureIndex];
    [(GLKEffectProperty *)self->_texGenT setEffect:*((void *)self->super._prv + 4)];
    _texGenTMask((uint64_t)self);
    _reflectionMapMask((uint64_t)self);
    [(NSMutableArray *)self->_texGenArray addObject:self->_texGenT];
    return self->_texGenT;
  }
  return result;
}

- (GLKEffectPropertyTexGen)texGenR
{
  result = self->_texGenR;
  if (!result)
  {
    if (!self->_texGenArray) {
      self->_texGenArray = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    }
    v4 = [[GLKEffectPropertyTexGen alloc] initWithMode:0 coord:2];
    self->_texGenR = v4;
    [(GLKEffectPropertyTexGen *)v4 setTextureIndex:self->_textureIndex];
    [(GLKEffectProperty *)self->_texGenR setEffect:*((void *)self->super._prv + 4)];
    _texGenRMask((uint64_t)self);
    _reflectionMapMask((uint64_t)self);
    [(NSMutableArray *)self->_texGenArray addObject:self->_texGenR];
    return self->_texGenR;
  }
  return result;
}

- (void)setTextureIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v21 = *MEMORY[0x263EF8340];
  self->_uint64_t textureIndex = a3;
  snprintf(__str, 0x3FuLL, "unit2d[%d]", a3);
  [(GLKEffectPropertyTexture *)self setUnit2dNameString:__str];
  snprintf(__str, 0x3FuLL, "unitCube[%d]", self->_textureIndex);
  [(GLKEffectPropertyTexture *)self setUnitCubeNameString:__str];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  texGenArray = self->_texGenArray;
  uint64_t v6 = [(NSMutableArray *)texGenArray countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(texGenArray);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * i) setTextureIndex:v3];
      }
      uint64_t v7 = [(NSMutableArray *)texGenArray countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
  _setMasks_0((uint64_t)self);
  _normalizedNormalsMask(*((void *)self->super._prv + 4));
  _vNormalEyeMask(*((void *)self->super._prv + 4));
  _texturingEnabledMask(*((void *)self->super._prv + 4));
  _vPositionEyeMask(*((void *)self->super._prv + 4));
  _useTexCoordAttribMask(*((void *)self->super._prv + 4));
  uint64_t v10 = 0;
  self->_allFshMasks.n0 = 0;
  self->_allFshMasks.n1 = 0;
  uint64_t v11 = _staticFshVPositionMask_0;
  self->_allFshMasks.n0 = _staticFshVPositionMask_0;
  uint64_t v12 = _staticFshVPositionMask_1;
  self->_allFshMasks.n1 = _staticFshVPositionMask_1;
  uint64_t textureIndex = self->_textureIndex;
  v14.n0 = v11;
  v14.n1 = v12;
  do
  {
    GLKBigInt_s v14 = (GLKBigInt_s)vorrq_s8((int8x16_t)v14, *(int8x16_t *)&_staticFshMasks_1[2 * textureIndex + v10]);
    self->_allFshMasks = v14;
    v10 += 6;
  }
  while (v10 != 144);
  [(GLKEffectProperty *)self setDirtyUniforms:0x200000];
}

- (void)setShaderBindings
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  GLint params = 0;
  glGetIntegerv(0x8B8Du, &params);
  self->_unit2dLoc = glGetUniformLocation(params, self->_unit2dNameString);
  self->_unitCubeLoc = glGetUniformLocation(params, self->_unitCubeNameString);
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  texGenArray = self->_texGenArray;
  uint64_t v4 = [(NSMutableArray *)texGenArray countByEnumeratingWithState:&v8 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(texGenArray);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * i) setShaderBindings];
      }
      uint64_t v5 = [(NSMutableArray *)texGenArray countByEnumeratingWithState:&v8 objects:v13 count:16];
    }
    while (v5);
  }
  [(GLKEffectProperty *)self setDirtyUniforms:0x200000];
}

+ (void)setStaticMasksWithVshRoot:(id)a3 fshRoot:(id)a4
{
  uint64_t v6 = 0;
  uint64_t v7 = &unk_267BDA938;
  do
  {
    *(v7 - 1) = +[GLKShaderBlockNode maskForLabel:root:index:](GLKShaderBlockNode, "maskForLabel:root:index:", objc_msgSend(NSString, "stringWithFormat:", @"texturing%d", v6), a4, v6);
    *uint64_t v7 = v8;
    ++v6;
    v7 += 2;
  }
  while (v6 != 3);
  long long v9 = &unk_267BDA968;
  for (uint64_t i = 1; i != 24; ++i)
  {
    uint64_t v11 = 0;
    uint64_t v12 = _fshMaskStr[i];
    v13 = v9;
    do
    {
      *(v13 - 1) = +[GLKShaderBlockNode maskForLabel:v12 root:a4 index:v11];
      void *v13 = v14;
      ++v11;
      v13 += 2;
    }
    while (v11 != 3);
    v9 += 6;
  }
  _staticFshVPositionMask_0 = +[GLKShaderBlockNode maskForLabel:@"v_position" root:a4 index:0];
  _staticFshVPositionMask_1 = v15;
  _staticVshVPositionMask_0 = +[GLKShaderBlockNode maskForLabel:@"v_position" root:a3 index:0];
  _staticVshVPositionMask_1 = v16;
}

+ (void)clearAllTexturingMasks:(GLKBigInt_s *)a3 fshMask:(GLKBigInt_s *)a4
{
  uint64_t v4 = 0;
  int8x16_t v5 = (int8x16_t)__PAIR128__(_staticFshVPositionMask_1, _staticFshVPositionMask_0);
  *(int8x16_t *)a3 = vbicq_s8(*(int8x16_t *)a3, (int8x16_t)__PAIR128__(_staticVshVPositionMask_1, _staticVshVPositionMask_0));
  GLKBigInt_s v6 = (GLKBigInt_s)vbicq_s8(*(int8x16_t *)a4, v5);
  *a4 = v6;
  uint64_t v7 = &_staticFshMasks_1;
  do
  {
    for (uint64_t i = 0; i != 144; i += 6)
    {
      GLKBigInt_s v6 = (GLKBigInt_s)vbicq_s8((int8x16_t)v6, *(int8x16_t *)&v7[i]);
      *a4 = v6;
    }
    ++v4;
    v7 += 2;
  }
  while (v4 != 3);
}

- (BOOL)includeVshShaderTextForRootNode:(id)a3
{
  uint64_t v3 = *((void *)a3 + 1);
  BOOL result = v3 != _staticVshVPositionMask_0
        || (uint64_t v4 = *((void *)a3 + 2), v4 != _staticVshVPositionMask_1)
        || (int8x16_t v5 = *(void **)self->super._prv, (*v5 & v3) != 0)
        || (v4 & v5[1]) != 0;
  return result;
}

- (BOOL)includeFshShaderTextForRootNode:(id)a3
{
  BOOL result = (*(_OWORD *)&self->_allFshMasks & *(_OWORD *)((unsigned char *)a3 + 8)) == 0
        || (uint64_t v3 = (void *)*((void *)self->super._prv + 2), (*v3 & *((void *)a3 + 1)) != 0)
        || (*((void *)a3 + 2) & v3[1]) != 0;
  return result;
}

- (void)setUnit2dNameString:(char *)a3
{
  unit2dNameString = self->_unit2dNameString;
  if (unit2dNameString)
  {
    free(unit2dNameString);
    self->_unit2dNameString = 0;
  }
  if (a3) {
    self->_unit2dNameString = strdup(a3);
  }
}

- (void)setUnitCubeNameString:(char *)a3
{
  unitCubeNameString = self->_unitCubeNameString;
  if (unitCubeNameString)
  {
    free(unitCubeNameString);
    self->_unitCubeNameString = 0;
  }
  if (a3) {
    self->_unitCubeNameString = strdup(a3);
  }
}

- (void)setEnabled:(GLBOOLean)enabled
{
  int v3 = enabled;
  if (self->_enabled != enabled || [(GLKEffectProperty *)self masksInitialized])
  {
    self->_enabled = v3;
    uint64_t textureIndex = self->_textureIndex;
    GLKBigInt_s v6 = (int8x16_t *)*((void *)self->super._prv + 2);
    uint64_t v7 = _staticFshMasks_1[2 * textureIndex];
    if (v3)
    {
      uint64_t v8 = v6->i64[1] | _staticFshMasks_1[2 * textureIndex + 1];
      v6->i64[0] |= v7;
      v6->i64[1] = v8;
    }
    else
    {
      *GLKBigInt_s v6 = vbicq_s8(*v6, *(int8x16_t *)&_staticFshMasks_1[2 * textureIndex]);
    }
    _reflectionMapMask((uint64_t)self);
    _texGenSMask((uint64_t)self);
    _texGenTMask((uint64_t)self);
    _texGenRMask((uint64_t)self);
    _normalizedNormalsMask(*((void *)self->super._prv + 4));
    _vNormalEyeMask(*((void *)self->super._prv + 4));
    _texturingEnabledMask(*((void *)self->super._prv + 4));
    _vPositionEyeMask(*((void *)self->super._prv + 4));
    uint64_t v9 = *((void *)self->super._prv + 4);
    _useTexCoordAttribMask(v9);
  }
}

- (void)initializeMasks
{
  texGenS = self->_texGenS;
  if (texGenS)
  {
    [(GLKEffectProperty *)texGenS setEffect:*((void *)self->super._prv + 4)];
    [(GLKEffectPropertyTexGen *)self->_texGenS initializeMasks];
  }
  texGenT = self->_texGenT;
  if (texGenT)
  {
    [(GLKEffectProperty *)texGenT setEffect:*((void *)self->super._prv + 4)];
    [(GLKEffectPropertyTexGen *)self->_texGenT initializeMasks];
  }
  texGenR = self->_texGenR;
  if (texGenR)
  {
    [(GLKEffectProperty *)texGenR setEffect:*((void *)self->super._prv + 4)];
    [(GLKEffectPropertyTexGen *)self->_texGenR initializeMasks];
  }
  *(void *)self->super._prv = [*((id *)self->super._prv + 4) vshMask];
  *((void *)self->super._prv + 2) = [*((id *)self->super._prv + 4) fshMask];
  _setMasks_0((uint64_t)self);
  _normalizedNormalsMask(*((void *)self->super._prv + 4));
  _vNormalEyeMask(*((void *)self->super._prv + 4));
  _texturingEnabledMask(*((void *)self->super._prv + 4));
  _vPositionEyeMask(*((void *)self->super._prv + 4));
  _useTexCoordAttribMask(*((void *)self->super._prv + 4));

  [(GLKEffectProperty *)self setMasksInitialized:1];
}

- (void)setEnvMode:(GLKTextureEnvMode)envMode
{
  if (self->_envMode != envMode)
  {
    self->_envMode = envMode;
    _envModeMask((uint64_t)self);
  }
}

- (void)setTarget:(GLKTextureTarget)target
{
  if (self->_target == target) {
    return;
  }
  self->_target = target;
  if (target == GLKTextureTargetCubeMap)
  {
    uint64_t v7 = (int8x16_t *)&_staticFshMasks_1[2 * self->_textureIndex];
    *(int8x16_t *)*((void *)self->super._prv + 2) = vorrq_s8(*(int8x16_t *)*((void *)self->super._prv + 2), v7[30]);
    int8x16_t v5 = (void *)*((void *)self->super._prv + 2);
    *v5 &= ~v7[27].i64[0];
    GLKBigInt_s v6 = &v7[27].i64[1];
    goto LABEL_6;
  }
  if (target == GLKTextureTarget2D)
  {
    uint64_t v4 = (int8x16_t *)&_staticFshMasks_1[2 * self->_textureIndex];
    *(int8x16_t *)*((void *)self->super._prv + 2) = vorrq_s8(*(int8x16_t *)*((void *)self->super._prv + 2), v4[27]);
    int8x16_t v5 = (void *)*((void *)self->super._prv + 2);
    *v5 &= ~v4[30].i64[0];
    GLKBigInt_s v6 = &v4[30].i64[1];
LABEL_6:
    v5[1] &= ~*v6;
  }
  _reflectionMapMask((uint64_t)self);
  unint64_t v8 = [(GLKEffectProperty *)self dirtyUniforms] | 0x200000;

  [(GLKEffectProperty *)self setDirtyUniforms:v8];
}

- (void)setMatrixEnabled:(unsigned __int8)a3
{
  if (self->_matrixEnabled != a3)
  {
    self->_matrixEnabled = a3;
    int v3 = (int8x16_t *)*((void *)self->super._prv + 2);
    uint64_t v4 = (int8x16_t *)&_staticFshMasks_1[2 * self->_textureIndex];
    uint64_t v5 = v4[42].i64[0];
    if (a3)
    {
      uint64_t v6 = v3->i64[1] | v4[42].i64[1];
      v3->i64[0] |= v5;
      v3->i64[1] = v6;
    }
    else
    {
      int8x16_t *v3 = vbicq_s8(*v3, v4[42]);
    }
  }
}

- (unsigned)normalizedNormalsMask
{
  unsigned __int8 result = 0;
  if (self->_enabled)
  {
    texGenS = self->_texGenS;
    if (texGenS)
    {
      if ([(GLKEffectPropertyTexGen *)texGenS mode] == 2
        || [(GLKEffectPropertyTexGen *)self->_texGenS mode] == 3)
      {
        return 1;
      }
    }
    texGenT = self->_texGenT;
    if (texGenT)
    {
      if ([(GLKEffectPropertyTexGen *)texGenT mode] == 2
        || [(GLKEffectPropertyTexGen *)self->_texGenT mode] == 3)
      {
        return 1;
      }
    }
    texGenR = self->_texGenR;
    if (texGenR)
    {
      if ([(GLKEffectPropertyTexGen *)texGenR mode] == 2
        || [(GLKEffectPropertyTexGen *)self->_texGenR mode] == 3)
      {
        return 1;
      }
    }
  }
  return result;
}

- (unsigned)vPositionEyeMask
{
  if (!self->_enabled) {
    goto LABEL_15;
  }
  texGenS = self->_texGenS;
  if (!texGenS) {
    goto LABEL_19;
  }
  if ([(GLKEffectPropertyTexGen *)texGenS mode] == 2
    || [(GLKEffectPropertyTexGen *)self->_texGenS mode] == 3)
  {
    goto LABEL_13;
  }
  int v4 = [(GLKEffectPropertyTexGen *)self->_texGenS mode];
  if (v4 != 1)
  {
LABEL_19:
    texGenT = self->_texGenT;
    if (!texGenT) {
      goto LABEL_10;
    }
    if ([(GLKEffectPropertyTexGen *)texGenT mode] == 2
      || [(GLKEffectPropertyTexGen *)self->_texGenT mode] == 3)
    {
      goto LABEL_13;
    }
    int v4 = [(GLKEffectPropertyTexGen *)self->_texGenT mode];
    if (v4 != 1)
    {
LABEL_10:
      texGenR = self->_texGenR;
      if (texGenR)
      {
        if ([(GLKEffectPropertyTexGen *)texGenR mode] == 2
          || [(GLKEffectPropertyTexGen *)self->_texGenR mode] == 3)
        {
LABEL_13:
          LOBYTE(v4) = 1;
          return v4;
        }
        int v4 = [(GLKEffectPropertyTexGen *)self->_texGenR mode];
        if (v4 == 1) {
          return v4;
        }
      }
LABEL_15:
      LOBYTE(v4) = 0;
    }
  }
  return v4;
}

- (unsigned)vNormalEyeMask
{
  unsigned __int8 result = 0;
  if (self->_enabled)
  {
    texGenS = self->_texGenS;
    if (texGenS)
    {
      if ([(GLKEffectPropertyTexGen *)texGenS mode] == 2
        || [(GLKEffectPropertyTexGen *)self->_texGenS mode] == 3)
      {
        return 1;
      }
    }
    texGenT = self->_texGenT;
    if (texGenT)
    {
      if ([(GLKEffectPropertyTexGen *)texGenT mode] == 2
        || [(GLKEffectPropertyTexGen *)self->_texGenT mode] == 3)
      {
        return 1;
      }
    }
    texGenR = self->_texGenR;
    if (texGenR)
    {
      if ([(GLKEffectPropertyTexGen *)texGenR mode] == 2
        || [(GLKEffectPropertyTexGen *)self->_texGenR mode] == 3)
      {
        return 1;
      }
    }
  }
  return result;
}

- (unsigned)useTexCoordAttribMask
{
  unsigned __int8 result = 0;
  if (self->_enabled)
  {
    texGenS = self->_texGenS;
    if (!texGenS
      || [(GLKEffectPropertyTexGen *)texGenS mode] != 2
      && [(GLKEffectPropertyTexGen *)self->_texGenS mode] != 3)
    {
      return 1;
    }
    texGenT = self->_texGenT;
    if (!texGenT
      || [(GLKEffectPropertyTexGen *)texGenT mode] != 2
      && [(GLKEffectPropertyTexGen *)self->_texGenT mode] != 3)
    {
      return 1;
    }
    texGenR = self->_texGenR;
    if (!texGenR
      || [(GLKEffectPropertyTexGen *)texGenR mode] != 2
      && [(GLKEffectPropertyTexGen *)self->_texGenR mode] != 3)
    {
      return 1;
    }
  }
  return result;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  [v3 appendFormat:@"%@ = %p\n{\n", objc_msgSend((id)objc_opt_class(), "description"), self];
  objc_msgSend(v3, "appendFormat:", @"\tenabled =\t\t%d\n", self->_enabled);
  objc_msgSend(v3, "appendFormat:", @"\tname =   \t\t%d\n", self->_name);
  unsigned int target = self->_target;
  if (target == 3553)
  {
    uint64_t v5 = @"\ttarget = \t\tGLKTextureTarget2D\n";
  }
  else
  {
    if (target != 34067) {
      goto LABEL_6;
    }
    uint64_t v5 = @"\ttarget = \t\tGLKTextureTargetCubeMap\n";
  }
  [v3 appendFormat:v5];
LABEL_6:
  uint64_t envMode = self->_envMode;
  if (envMode <= 2) {
    [v3 appendFormat:off_26433A120[envMode]];
  }
  [v3 appendFormat:@"}"];
  return v3;
}

- (void)bind
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (self->_enabled)
  {
    glActiveTexture(self->_textureIndex + 33984);
    glBindTexture(self->_target, self->_name);
    if ([(GLKEffectProperty *)self dirtyUniforms])
    {
      if (([(GLKEffectProperty *)self dirtyUniforms] & 0x200000) != 0)
      {
        if (self->_target == 3553) {
          id v3 = &OBJC_IVAR___GLKEffectPropertyTexture__unit2dLoc;
        }
        else {
          id v3 = &OBJC_IVAR___GLKEffectPropertyTexture__unitCubeLoc;
        }
        glUniform1i(*(_DWORD *)((char *)&self->super.super.isa + *v3), self->_textureIndex);
      }
      [(GLKEffectProperty *)self setDirtyUniforms:0];
    }
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    texGenArray = self->_texGenArray;
    uint64_t v5 = [(NSMutableArray *)texGenArray countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(texGenArray);
          }
          [*(id *)(*((void *)&v9 + 1) + 8 * i) bind];
        }
        uint64_t v6 = [(NSMutableArray *)texGenArray countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (void)dealloc
{
  unitCubeNameString = self->_unitCubeNameString;
  if (unitCubeNameString) {
    free(unitCubeNameString);
  }
  unit2dNameString = self->_unit2dNameString;
  if (unit2dNameString) {
    free(unit2dNameString);
  }

  v5.receiver = self;
  v5.super_class = (Class)GLKEffectPropertyTexture;
  [(GLKEffectProperty *)&v5 dealloc];
}

- (GLKTextureTarget)target
{
  return self->_target;
}

- (GLBOOLean)enabled
{
  return self->_enabled;
}

- (NSString)filePath
{
  return self->_filePath;
}

- (int)textureIndex
{
  return self->_textureIndex;
}

- (unsigned)matrixEnabled
{
  return self->_matrixEnabled;
}

- (GLKTextureEnvMode)envMode
{
  return self->_envMode;
}

- (char)unit2dNameString
{
  return self->_unit2dNameString;
}

- (char)unitCubeNameString
{
  return self->_unitCubeNameString;
}

- (GLuint)name
{
  return self->_name;
}

- (void)setName:(GLuint)name
{
  self->_name = name;
}

- (int)unit2dLoc
{
  return self->_unit2dLoc;
}

- (void)setUnit2dLoc:(int)a3
{
  self->_unit2dLoc = a3;
}

- (int)unitCubeLoc
{
  return self->_unitCubeLoc;
}

- (void)setUnitCubeLoc:(int)a3
{
  self->_unitCubeLoc = a3;
}

- (NSMutableArray)texGenArray
{
  return self->_texGenArray;
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