@interface GLKEffectPropertyTexGen
- (GLKEffectPropertyTexGen)init;
- (GLKEffectPropertyTexGen)initWithMode:(int)a3 coord:(int)a4;
- (char)modeNameString;
- (char)planeNameString;
- (float)eyePlaneByInvModelview;
- (float)plane;
- (int)coord;
- (int)eyePlaneByInvModelviewLoc;
- (int)mode;
- (int)modeLoc;
- (int)planeLoc;
- (unsigned)textureIndex;
- (void)bind;
- (void)dealloc;
- (void)dirtyAllUniforms;
- (void)initializeMasks;
- (void)setEyePlaneByInvModelview:(float *)a3;
- (void)setEyePlaneByInvModelviewLoc:(int)a3;
- (void)setMode:(int)a3;
- (void)setModeLoc:(int)a3;
- (void)setModeNameString:(char *)a3;
- (void)setPlane:(float *)a3;
- (void)setPlaneLoc:(int)a3;
- (void)setPlaneNameString:(char *)a3;
- (void)setShaderBindings;
- (void)setTextureIndex:(unsigned int)a3;
@end

@implementation GLKEffectPropertyTexGen

- (GLKEffectPropertyTexGen)init
{
  return 0;
}

- (GLKEffectPropertyTexGen)initWithMode:(int)a3 coord:(int)a4
{
  uint64_t v5 = *(void *)&a3;
  v11.receiver = self;
  v11.super_class = (Class)GLKEffectPropertyTexGen;
  v6 = [(GLKEffectProperty *)&v11 init];
  v7 = v6;
  if (v6)
  {
    v6->_planeLoc = -1;
    v6->_modeLoc = -1;
    v6->_plane = (float *)malloc_type_malloc(0x10uLL, 0x100004052888210uLL);
    [(GLKEffectPropertyTexGen *)v7 setMode:v5];
    v7->_coord = a4;
    v7->_planeNameString = 0;
    v7->_modeNameString = 0;
    v7->_textureIndex = 0;
    if (a4 == 1)
    {
      plane = v7->_plane;
      plane[3] = 0.0;
      *(void *)(plane + 1) = 1065353216;
      goto LABEL_6;
    }
    if (!a4)
    {
      v8 = v7->_plane;
      float *v8 = 1.0;
      *((void *)v8 + 1) = 0;
      plane = v8 + 1;
LABEL_6:
      float *plane = 0.0;
    }
  }
  return v7;
}

- (void)dirtyAllUniforms
{
}

- (void)setMode:(int)a3
{
  if (self->_mode != a3 || ![(GLKEffectProperty *)self masksInitialized])
  {
    self->_mode = a3;
    _normalizedNormalsMask(*((void *)self->super._prv + 4));
    _vNormalEyeMask(*((void *)self->super._prv + 4));
    _vPositionEyeMask(*((void *)self->super._prv + 4));
    _useTexCoordAttribMask(*((void *)self->super._prv + 4));
    unint64_t v5 = [(GLKEffectProperty *)self dirtyUniforms] | 0x400000;
    [(GLKEffectProperty *)self setDirtyUniforms:v5];
  }
}

- (void)setPlane:(float *)a3
{
  plane = self->_plane;
  if (*a3 != *plane || a3[1] != plane[1] || a3[2] != plane[2] || a3[3] != plane[3])
  {
    *(_OWORD *)plane = *(_OWORD *)a3;
    unint64_t v5 = [(GLKEffectProperty *)self dirtyUniforms] | 0x800000;
    [(GLKEffectProperty *)self setDirtyUniforms:v5];
  }
}

- (void)setModeNameString:(char *)a3
{
  modeNameString = self->_modeNameString;
  if (modeNameString) {
    free(modeNameString);
  }
  self->_modeNameString = strdup(a3);
}

- (void)setPlaneNameString:(char *)a3
{
  planeNameString = self->_planeNameString;
  if (planeNameString) {
    free(planeNameString);
  }
  self->_planeNameString = strdup(a3);
}

- (void)setTextureIndex:(unsigned int)a3
{
  self->_textureIndex = a3;
}

- (void)setShaderBindings
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  GLint params = 0;
  glGetIntegerv(0x8B8Du, &params);
  snprintf(__str, 0x3FuLL, "textures[%d].texGen[%d].mode", self->_textureIndex, self->_coord);
  [(GLKEffectPropertyTexGen *)self setModeNameString:__str];
  snprintf(__str, 0x3FuLL, "textures[%d].texGen[%d].plane", self->_textureIndex, self->_coord);
  [(GLKEffectPropertyTexGen *)self setPlaneNameString:__str];
  self->_modeLoc = glGetUniformLocation(params, [(GLKEffectPropertyTexGen *)self modeNameString]);
  self->_planeLoc = glGetUniformLocation(params, [(GLKEffectPropertyTexGen *)self planeNameString]);
  [(GLKEffectPropertyTexGen *)self dirtyAllUniforms];
}

- (void)initializeMasks
{
  _normalizedNormalsMask(*((void *)self->super._prv + 4));
  _vNormalEyeMask(*((void *)self->super._prv + 4));
  _vPositionEyeMask(*((void *)self->super._prv + 4));
  _useTexCoordAttribMask(*((void *)self->super._prv + 4));

  [(GLKEffectProperty *)self setMasksInitialized:1];
}

- (void)bind
{
  if ([(GLKEffectProperty *)self dirtyUniforms])
  {
    if (([(GLKEffectProperty *)self dirtyUniforms] & 0x400000) != 0) {
      glUniform1i(self->_modeLoc, self->_mode);
    }
    if (([(GLKEffectProperty *)self dirtyUniforms] & 0x800000) != 0) {
      glUniform4fv(self->_planeLoc, 1, self->_plane);
    }
    [(GLKEffectProperty *)self setDirtyUniforms:0];
  }
}

- (void)dealloc
{
  free(self->_plane);
  modeNameString = self->_modeNameString;
  if (modeNameString) {
    free(modeNameString);
  }
  planeNameString = self->_planeNameString;
  if (planeNameString) {
    free(planeNameString);
  }
  v5.receiver = self;
  v5.super_class = (Class)GLKEffectPropertyTexGen;
  [(GLKEffectProperty *)&v5 dealloc];
}

- (int)mode
{
  return self->_mode;
}

- (float)plane
{
  return self->_plane;
}

- (int)coord
{
  return self->_coord;
}

- (float)eyePlaneByInvModelview
{
  return self->_eyePlaneByInvModelview;
}

- (void)setEyePlaneByInvModelview:(float *)a3
{
  self->_eyePlaneByInvModelview = a3;
}

- (int)modeLoc
{
  return self->_modeLoc;
}

- (void)setModeLoc:(int)a3
{
  self->_modeLoc = a3;
}

- (int)planeLoc
{
  return self->_planeLoc;
}

- (void)setPlaneLoc:(int)a3
{
  self->_planeLoc = a3;
}

- (int)eyePlaneByInvModelviewLoc
{
  return self->_eyePlaneByInvModelviewLoc;
}

- (void)setEyePlaneByInvModelviewLoc:(int)a3
{
  self->_eyePlaneByInvModelviewLoc = a3;
}

- (char)modeNameString
{
  return self->_modeNameString;
}

- (char)planeNameString
{
  return self->_planeNameString;
}

- (unsigned)textureIndex
{
  return self->_textureIndex;
}

@end