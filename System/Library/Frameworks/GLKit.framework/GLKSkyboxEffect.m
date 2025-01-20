@interface GLKSkyboxEffect
- (GLKEffect)effect;
- (GLKEffectPropertyTexture)textureCubeMap;
- (GLKEffectPropertyTransform)transform;
- (GLKSkyboxEffect)init;
- (GLKVector3)center;
- (GLfloat)xSize;
- (GLfloat)ySize;
- (GLfloat)zSize;
- (NSMutableArray)propertyArray;
- (NSString)label;
- (id)description;
- (unsigned)centerChanged;
- (unsigned)effectStale;
- (unsigned)positionVBO;
- (unsigned)programName;
- (unsigned)texCoordVBO;
- (unsigned)vao;
- (void)createAndBindVAOWithPositions:(float *)a3 texCoords:(float *)a4;
- (void)dealloc;
- (void)draw;
- (void)prepareToDraw;
- (void)setCenter:(GLKVector3)center;
- (void)setCenterChanged:(unsigned __int8)a3;
- (void)setEffect:(id)a3;
- (void)setEffectStale:(unsigned __int8)a3;
- (void)setLabel:(NSString *)label;
- (void)setPositionVBO:(unsigned int)a3;
- (void)setProgramName:(unsigned int)a3;
- (void)setTexCoordVBO:(unsigned int)a3;
- (void)setVao:(unsigned int)a3;
- (void)setXSize:(GLfloat)xSize;
- (void)setYSize:(GLfloat)ySize;
- (void)setZSize:(GLfloat)zSize;
- (void)updateSkyboxEffect;
@end

@implementation GLKSkyboxEffect

- (GLKSkyboxEffect)init
{
  v11.receiver = self;
  v11.super_class = (Class)GLKSkyboxEffect;
  v2 = [(GLKSkyboxEffect *)&v11 init];
  v3 = (GLKSkyboxEffect *)v2;
  if (v2)
  {
    *((_DWORD *)v2 + 15) = 0;
    __asm { FMOV            V0.2S, #1.0 }
    *((void *)v2 + 3) = _D0;
    *((void *)v2 + 11) = 0;
    *(_OWORD *)(v2 + 8) = xmmword_2187C1530;
    *((void *)v2 + 10) = objc_alloc_init(MEMORY[0x263EFF980]);
    v3->_transform = objc_alloc_init(GLKEffectPropertyTransform);
    v9 = objc_alloc_init(GLKEffectPropertyTexture);
    v3->_textureCubeMap = v9;
    [(GLKEffectPropertyTexture *)v9 setTarget:34067];
    [(GLKEffectPropertyTexture *)v3->_textureCubeMap setEnvMode:0];
    [(NSMutableArray *)[(GLKSkyboxEffect *)v3 propertyArray] addObject:v3->_transform];
    [(NSMutableArray *)[(GLKSkyboxEffect *)v3 propertyArray] addObject:v3->_textureCubeMap];
    v3->_effect = [[GLKEffect alloc] initWithPropertyArray:v3->_propertyArray];
    v3->_effectStale = 1;
  }
  return v3;
}

- (void)createAndBindVAOWithPositions:(float *)a3 texCoords:(float *)a4
{
  GLint params = 0;
  glGetIntegerv(0x8894u, &params);
  if (self->_vao)
  {
    glBindVertexArrayOES();
  }
  else
  {
    glGenVertexArraysOES();
    glBindVertexArrayOES();
    glGenBuffers(1, &self->_texCoordVBO);
    glBindBuffer(0x8892u, self->_texCoordVBO);
    glBufferData(0x8892u, 288, a4, 0x88E8u);
    glVertexAttribPointer(3u, 3, 0x1406u, 0, 0, 0);
  }
  glGenBuffers(1, &self->_positionVBO);
  glBindBuffer(0x8892u, self->_positionVBO);
  glBufferData(0x8892u, 288, a3, 0x88E8u);
  glVertexAttribPointer(0, 3, 0x1406u, 0, 0, 0);
  glBindBuffer(0x8892u, params);
}

- (void)setXSize:(GLfloat)xSize
{
  if (self->_xSize != xSize)
  {
    self->_xSize = xSize;
    self->_effectStale = 1;
  }
}

- (void)setYSize:(GLfloat)ySize
{
  if (self->_ySize != ySize)
  {
    self->_ySize = ySize;
    self->_effectStale = 1;
  }
}

- (void)setZSize:(GLfloat)zSize
{
  if (self->_zSize != zSize)
  {
    self->_zSize = zSize;
    self->_effectStale = 1;
  }
}

- (void)setCenter:(GLKVector3)center
{
  if (self->_center.x != v3 || self->_center.y != v4 || self->_center.z != v5)
  {
    self->_center.x = v3;
    self->_center.y = v4;
    self->_center.z = v5;
    self->_effectStale = 1;
  }
}

- (void)updateSkyboxEffect
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (self->_effectStale == 1)
  {
    if (self->_vao) {
      glDeleteBuffers(1, &self->_positionVBO);
    }
    uint64_t v3 = 0;
    p_zSize = &self->_zSize;
    p_xSize = &self->_xSize;
    float32x4_t v6 = vld1q_dup_f32(p_xSize);
    p_ySize = &self->_ySize;
    float64x2_t v8 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(self->_center.x), 0);
    float32x4_t v9 = vld1q_dup_f32(p_ySize);
    float64x2_t v10 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(self->_center.y), 0);
    float32x4_t v11 = vld1q_dup_f32(p_zSize);
    float64x2_t v12 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(self->_center.z), 0);
    __asm { FMOV            V6.2D, #0.5 }
    do
    {
      v18 = (const float *)((char *)&texCoords + v3);
      float32x4x3_t v25 = vld3q_f32(v18);
      float32x4_t v19 = vmulq_f32(v25.val[0], v6);
      v26.val[0] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vmlaq_f64(v8, _Q6, vcvtq_f64_f32(*(float32x2_t *)v19.f32))), vmlaq_f64(v8, _Q6, vcvt_hight_f64_f32(v19)));
      float32x4_t v20 = vmulq_f32(v25.val[1], v9);
      v26.val[1] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vmlaq_f64(v10, _Q6, vcvtq_f64_f32(*(float32x2_t *)v20.f32))), vmlaq_f64(v10, _Q6, vcvt_hight_f64_f32(v20)));
      float32x4_t v21 = vmulq_f32(v25.val[2], v11);
      v26.val[2] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vmlaq_f64(v12, _Q6, vcvtq_f64_f32(*(float32x2_t *)v21.f32))), vmlaq_f64(v12, _Q6, vcvt_hight_f64_f32(v21)));
      v22 = (float *)&v23[v3];
      vst3q_f32(v22, v26);
      v3 += 48;
    }
    while (v3 != 288);
    [(GLKEffect *)self->_effect setLabel:[(GLKSkyboxEffect *)self label]];
    [(GLKSkyboxEffect *)self createAndBindVAOWithPositions:v23 texCoords:&texCoords];
    self->_effectStale = 0;
  }
}

- (void)prepareToDraw
{
  [(GLKSkyboxEffect *)self updateSkyboxEffect];
  glBindVertexArrayOES();
  glEnableVertexAttribArray(0);
  glEnableVertexAttribArray(3u);
  effect = self->_effect;

  [(GLKEffect *)effect bind];
}

- (void)draw
{
  [(GLKSkyboxEffect *)self updateSkyboxEffect];
  for (GLint i = 0; i != 24; i += 4)
    glDrawArrays(5u, i, 4);
}

- (void)dealloc
{
  glDeleteBuffers(1, &self->_positionVBO);
  glDeleteBuffers(1, &self->_texCoordVBO);
  glDeleteVertexArraysOES();
  v3.receiver = self;
  v3.super_class = (Class)GLKSkyboxEffect;
  [(GLKSkyboxEffect *)&v3 dealloc];
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  objc_msgSend(v3, "appendFormat:", @"self = %p\n{\n", self);
  [v3 appendFormat:@"center = { %6.3f, %6.3f, %6.3f }\n", self->_center.x, self->_center.y, self->_center.z];
  objc_msgSend(v3, "appendFormat:", @"xSize = %6.3f\n", self->_xSize);
  objc_msgSend(v3, "appendFormat:", @"ySize = %6.3f\n", self->_ySize);
  objc_msgSend(v3, "appendFormat:", @"zSize = %6.3f\n", self->_zSize);
  objc_msgSend(v3, "appendFormat:", @"textureCubeMap = %p\n", -[GLKSkyboxEffect textureCubeMap](self, "textureCubeMap"));
  [v3 appendFormat:@"%@\n", -[GLKEffectPropertyTexture description](-[GLKSkyboxEffect textureCubeMap](self, "textureCubeMap"), "description")];
  [v3 appendString:@"}"];
  return v3;
}

- (GLKVector3)center
{
  result.z = *(float *)&a2;
  *(void *)&result.x = self;
  return result;
}

- (GLfloat)xSize
{
  return self->_xSize;
}

- (GLfloat)ySize
{
  return self->_ySize;
}

- (GLfloat)zSize
{
  return self->_zSize;
}

- (GLKEffectPropertyTexture)textureCubeMap
{
  return self->_textureCubeMap;
}

- (unsigned)vao
{
  return self->_vao;
}

- (void)setVao:(unsigned int)a3
{
  self->_vao = a3;
}

- (unsigned)positionVBO
{
  return self->_positionVBO;
}

- (void)setPositionVBO:(unsigned int)a3
{
  self->_positionVBO = a3;
}

- (unsigned)texCoordVBO
{
  return self->_texCoordVBO;
}

- (void)setTexCoordVBO:(unsigned int)a3
{
  self->_texCoordVBO = a3;
}

- (NSMutableArray)propertyArray
{
  return self->_propertyArray;
}

- (unsigned)effectStale
{
  return self->_effectStale;
}

- (void)setEffectStale:(unsigned __int8)a3
{
  self->_effectStale = a3;
}

- (GLKEffect)effect
{
  return self->_effect;
}

- (void)setEffect:(id)a3
{
  self->_effect = (GLKEffect *)a3;
}

- (unsigned)programName
{
  return self->_programName;
}

- (void)setProgramName:(unsigned int)a3
{
  self->_programName = a3;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(NSString *)label
{
}

- (GLKEffectPropertyTransform)transform
{
  return self->_transform;
}

- (unsigned)centerChanged
{
  return self->_centerChanged;
}

- (void)setCenterChanged:(unsigned __int8)a3
{
  self->_centerChanged = a3;
}

@end