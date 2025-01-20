@interface GLKBaseEffect
- (BOOL)perPixelLightingEnabled;
- (BOOL)perVertexLightingEnabled;
- (GLBOOLean)colorMaterialEnabled;
- (GLBOOLean)lightModelTwoSided;
- (GLBOOLean)useConstantColor;
- (GLKBaseEffect)init;
- (GLKEffect)effect;
- (GLKEffectPropertyConstantColor)constantColorProp;
- (GLKEffectPropertyFog)fog;
- (GLKEffectPropertyLight)light0;
- (GLKEffectPropertyLight)light1;
- (GLKEffectPropertyLight)light2;
- (GLKEffectPropertyMaterial)material;
- (GLKEffectPropertyTexture)texture2d0;
- (GLKEffectPropertyTexture)texture2d1;
- (GLKEffectPropertyTransform)transform;
- (GLKLightingType)lightingType;
- (GLKVector4)constantColor;
- (GLKVector4)lightModelAmbientColor;
- (NSArray)textureOrder;
- (NSMutableArray)propertyArray;
- (NSString)label;
- (id)description;
- (unsigned)effectStale;
- (unsigned)programName;
- (unsigned)propertyArrayStale;
- (void)dealloc;
- (void)prepareToDraw;
- (void)setColorMaterialEnabled:(GLBOOLean)colorMaterialEnabled;
- (void)setConstantColor:(GLKVector4)constantColor;
- (void)setEffect:(id)a3;
- (void)setEffectStale:(unsigned __int8)a3;
- (void)setLabel:(NSString *)label;
- (void)setLightModelAmbientColor:(GLKVector4)lightModelAmbientColor;
- (void)setLightModelTwoSided:(GLBOOLean)lightModelTwoSided;
- (void)setLightingType:(GLKLightingType)lightingType;
- (void)setProgramName:(unsigned int)a3;
- (void)setPropertyArrayStale:(unsigned __int8)a3;
- (void)setTextureOrder:(NSArray *)textureOrder;
- (void)setUseConstantColor:(GLBOOLean)useConstantColor;
- (void)updateBaseEffect;
@end

@implementation GLKBaseEffect

- (GLKBaseEffect)init
{
  v5.receiver = self;
  v5.super_class = (Class)GLKBaseEffect;
  v2 = [(GLKBaseEffect *)&v5 init];
  if (v2)
  {
    v2->_propertyArray = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v2->_transform = objc_alloc_init(GLKEffectPropertyTransform);
    v3 = objc_alloc_init(GLKEffectPropertyConstantColor);
    v2->_constantColorProp = v3;
    [(NSMutableArray *)v2->_propertyArray addObject:v3];
    *(_WORD *)&v2->_colorMaterialEnabled = 0;
    v2->_lightModelAmbientColor = (_GLKVector4)xmmword_2187C14B0;
    v2->_lightingType = 0;
    v2->_fog = 0;
    *(_OWORD *)&v2->_light0 = 0u;
    *(_OWORD *)&v2->_light2 = 0u;
    *(_OWORD *)&v2->_texture2d0 = 0u;
    v2->_textureOrder = 0;
    *(_DWORD *)&v2->_lightModelTwoSided = 16843008;
    -[GLKBaseEffect setLabel:](v2, "setLabel:", [NSString stringWithFormat:@"GLKBaseEffect"]);
    v2->_effect = 0;
  }
  return v2;
}

- (void)setTextureOrder:(NSArray *)textureOrder
{
  v3 = self->_textureOrder;
  if (v3 != textureOrder)
  {
    if (!textureOrder)
    {

      v10 = 0;
LABEL_13:
      self->_textureOrder = v10;
      self->_effectStale = 1;
      return;
    }
    NSUInteger v6 = [(NSArray *)textureOrder count];
    v7 = self->_textureOrder;
    if (!v7 || [(NSArray *)v7 count] != v6) {
      goto LABEL_12;
    }
    if (v6)
    {
      uint64_t v8 = 0;
      while (1)
      {
        id v9 = [(NSArray *)textureOrder objectAtIndex:v8];
        if (v9 != [(NSArray *)self->_textureOrder objectAtIndex:v8]) {
          break;
        }
        if (v6 == ++v8) {
          return;
        }
      }
      if (v6 != v8)
      {
LABEL_12:

        v10 = textureOrder;
        goto LABEL_13;
      }
    }
  }
}

- (GLKEffectPropertyLight)light0
{
  result = self->_light0;
  if (!result)
  {
    v4 = [[GLKEffectPropertyLight alloc] initWithTransform:self->_transform lightingType:self->_lightingType firstLight:1];
    self->_light0 = v4;
    [(NSMutableArray *)self->_propertyArray addObject:v4];
    self->_material = [(GLKBaseEffect *)self material];
    *(_WORD *)&self->_propertyArrayStale = 257;
    return self->_light0;
  }
  return result;
}

- (GLKEffectPropertyLight)light1
{
  result = self->_light1;
  if (!result)
  {
    v4 = [[GLKEffectPropertyLight alloc] initWithTransform:self->_transform lightingType:self->_lightingType firstLight:0];
    self->_light1 = v4;
    [(NSMutableArray *)self->_propertyArray addObject:v4];
    self->_material = [(GLKBaseEffect *)self material];
    *(_WORD *)&self->_propertyArrayStale = 257;
    return self->_light1;
  }
  return result;
}

- (GLKEffectPropertyLight)light2
{
  result = self->_light2;
  if (!result)
  {
    v4 = [[GLKEffectPropertyLight alloc] initWithTransform:self->_transform lightingType:self->_lightingType firstLight:0];
    self->_light2 = v4;
    [(NSMutableArray *)self->_propertyArray addObject:v4];
    self->_material = [(GLKBaseEffect *)self material];
    *(_WORD *)&self->_propertyArrayStale = 257;
    return self->_light2;
  }
  return result;
}

- (GLKEffectPropertyMaterial)material
{
  result = self->_material;
  if (!result)
  {
    v4 = objc_alloc_init(GLKEffectPropertyMaterial);
    self->_material = v4;
    [(NSMutableArray *)self->_propertyArray addObject:v4];
    result = [(GLKBaseEffect *)self material];
    self->_material = result;
    *(_WORD *)&self->_propertyArrayStale = 257;
  }
  return result;
}

- (GLKEffectPropertyTexture)texture2d0
{
  result = self->_texture2d0;
  if (!result)
  {
    v4 = objc_alloc_init(GLKEffectPropertyTexture);
    self->_texture2d0 = v4;
    [(NSMutableArray *)self->_propertyArray addObject:v4];
    *(_WORD *)&self->_propertyArrayStale = 257;
    return self->_texture2d0;
  }
  return result;
}

- (GLKEffectPropertyTexture)texture2d1
{
  result = self->_texture2d1;
  if (!result)
  {
    v4 = objc_alloc_init(GLKEffectPropertyTexture);
    self->_texture2d1 = v4;
    [(NSMutableArray *)self->_propertyArray addObject:v4];
    *(_WORD *)&self->_propertyArrayStale = 257;
    return self->_texture2d1;
  }
  return result;
}

- (GLKEffectPropertyFog)fog
{
  result = self->_fog;
  if (!result)
  {
    v4 = objc_alloc_init(GLKEffectPropertyFog);
    self->_fog = v4;
    [(NSMutableArray *)self->_propertyArray addObject:v4];
    *(_WORD *)&self->_propertyArrayStale = 257;
    return self->_fog;
  }
  return result;
}

- (void)setConstantColor:(GLKVector4)constantColor
{
}

- (GLKVector4)constantColor
{
  uint64_t v2 = [(GLKEffectPropertyConstantColor *)self->_constantColorProp color];
  *(void *)&result.v[2] = v3;
  *(void *)&result.x = v2;
  return result;
}

- (void)setLightModelAmbientColor:(GLKVector4)lightModelAmbientColor
{
  v7.i64[0] = __PAIR64__(LODWORD(v4), LODWORD(v3));
  v7.i64[1] = __PAIR64__(LODWORD(v6), LODWORD(v5));
  int8x16_t v8 = (int8x16_t)vceqq_f32(v7, (float32x4_t)self->_lightModelAmbientColor);
  *(int8x8_t *)v8.i8 = vand_s8((int8x8_t)*(_OWORD *)&vextq_s8(v8, v8, 8uLL), vand_s8(*(int8x8_t *)v8.i8, (int8x8_t)0x100000001));
  if (!vand_s8((int8x8_t)vdup_lane_s32(*(int32x2_t *)v8.i8, 1), *(int8x8_t *)v8.i8).u32[0])
  {
    self->_lightModelAmbientColor.x = v3;
    self->_lightModelAmbientColor.y = v4;
    self->_lightModelAmbientColor.z = v5;
    self->_lightModelAmbientColor.w = v6;
    effect = self->_effect;
    if (effect) {
      -[GLKEffect setLightModelAmbientColor:](effect, "setLightModelAmbientColor:", *(void *)&lightModelAmbientColor.x, *(void *)&lightModelAmbientColor.v[2]);
    }
  }
}

- (void)setColorMaterialEnabled:(GLBOOLean)colorMaterialEnabled
{
  if (self->_colorMaterialEnabled != colorMaterialEnabled)
  {
    self->_colorMaterialEnabled = colorMaterialEnabled;
    effect = self->_effect;
    if (effect) {
      -[GLKEffect setColorMaterialEnabled:](effect, "setColorMaterialEnabled:");
    }
  }
}

- (void)setLightModelTwoSided:(GLBOOLean)lightModelTwoSided
{
  if (self->_lightModelTwoSided != lightModelTwoSided)
  {
    self->_lightModelTwoSided = lightModelTwoSided;
    effect = self->_effect;
    if (effect) {
      -[GLKEffect setLightModelTwoSided:](effect, "setLightModelTwoSided:");
    }
  }
}

- (void)setLightingType:(GLKLightingType)lightingType
{
  if (self->_lightingType != lightingType)
  {
    uint64_t v3 = *(void *)&lightingType;
    light0 = self->_light0;
    if (light0) {
      [(GLKEffectPropertyLight *)light0 setLightingType:*(void *)&lightingType];
    }
    light1 = self->_light1;
    if (light1) {
      [(GLKEffectPropertyLight *)light1 setLightingType:v3];
    }
    light2 = self->_light2;
    if (light2) {
      [(GLKEffectPropertyLight *)light2 setLightingType:v3];
    }
    self->_lightingType = v3;
    self->_effectStale = 1;
  }
}

- (void)setUseConstantColor:(GLBOOLean)useConstantColor
{
  if (self->_useConstantColor != useConstantColor)
  {
    self->_useConstantColor = useConstantColor;
    self->_effectStale = 1;
  }
}

- (BOOL)perVertexLightingEnabled
{
  if (self->_lightingType) {
    return 0;
  }
  if ([(GLKEffectPropertyLight *)self->_light0 enabled]
    || [(GLKEffectPropertyLight *)self->_light1 enabled])
  {
    return 1;
  }
  return [(GLKEffectPropertyLight *)self->_light2 enabled] != 0;
}

- (BOOL)perPixelLightingEnabled
{
  if (self->_lightingType != 1) {
    return 0;
  }
  if ([(GLKEffectPropertyLight *)self->_light0 enabled]
    || [(GLKEffectPropertyLight *)self->_light1 enabled])
  {
    return 1;
  }
  return [(GLKEffectPropertyLight *)self->_light2 enabled] != 0;
}

- (void)updateBaseEffect
{
  effect = self->_effect;
  if (effect)
  {
    if (self->_propertyArrayStale)
    {

      self->_effect = [[GLKEffect alloc] initWithPropertyArray:self->_propertyArray];
    }
  }
  else
  {
    [(NSMutableArray *)self->_propertyArray insertObject:self->_transform atIndex:0];
    float v4 = [[GLKEffect alloc] initWithPropertyArray:self->_propertyArray];
    self->_effect = v4;
    *(float *)&double v5 = self->_lightModelAmbientColor.x;
    *(float *)&double v6 = self->_lightModelAmbientColor.y;
    *(float *)&double v7 = self->_lightModelAmbientColor.z;
    *(float *)&double v8 = self->_lightModelAmbientColor.w;
    -[GLKEffect setLightModelAmbientColor:](v4, "setLightModelAmbientColor:", v5, v6, v7, v8);
    [(GLKEffect *)self->_effect setColorMaterialEnabled:self->_colorMaterialEnabled];
    [(GLKEffect *)self->_effect setLightModelTwoSided:self->_lightModelTwoSided];
  }
  [(GLKEffect *)self->_effect setLabel:[(GLKBaseEffect *)self label]];
  [(GLKEffectPropertyConstantColor *)self->_constantColorProp setEnabled:self->_useConstantColor];
  if (self->_textureOrder)
  {
    id v9 = self->_effect;
    -[GLKEffect setTextureOrder:](v9, "setTextureOrder:");
  }
}

- (void)prepareToDraw
{
  if (self->_effectStale)
  {
    [(GLKBaseEffect *)self updateBaseEffect];
    *(_WORD *)&self->_propertyArrayStale = 0;
  }
  effect = self->_effect;

  [(GLKEffect *)effect bind];
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  [v3 appendFormat:@"self = %p - %@\n{\n", self, self->_label];
  if (self->_lightingType) {
    float v4 = "GLKLightingTypePerPixel";
  }
  else {
    float v4 = "GLKLightingTypePerVertex";
  }
  objc_msgSend(v3, "appendFormat:", @"lightingType:       %s\n", v4);
  if (self->_lightModelTwoSided) {
    double v5 = "GL_TRUE";
  }
  else {
    double v5 = "GL_FALSE";
  }
  objc_msgSend(v3, "appendFormat:", @"lightModelTwoSided: %s\n", v5);
  if (self->_transform) {
    [v3 appendFormat:@"%@\n", -[GLKEffectPropertyTransform description](-[GLKBaseEffect transform](self, "transform"), "description")];
  }
  else {
    objc_msgSend(v3, "appendFormat:", @"transform = \t\t\tNULL\n", v12);
  }
  if (self->_light0)
  {
    objc_msgSend(v3, "appendFormat:", @"light0 = %p\n", -[GLKBaseEffect light0](self, "light0"));
    [v3 appendFormat:@"%@\n", -[GLKEffectPropertyLight description](-[GLKBaseEffect light0](self, "light0"), "description")];
  }
  else
  {
    objc_msgSend(v3, "appendFormat:", @"light0 = \tNULL\n", v13);
  }
  if (self->_light1)
  {
    objc_msgSend(v3, "appendFormat:", @"light1 = %p\n", -[GLKBaseEffect light1](self, "light1"));
    [v3 appendFormat:@"%@\n", -[GLKEffectPropertyLight description](-[GLKBaseEffect light1](self, "light1"), "description")];
  }
  else
  {
    objc_msgSend(v3, "appendFormat:", @"light1 = \tNULL\n", v14);
  }
  if (self->_light2)
  {
    objc_msgSend(v3, "appendFormat:", @"light2 = %p\n", -[GLKBaseEffect light2](self, "light2"));
    [v3 appendFormat:@"%@\n", -[GLKEffectPropertyLight description](-[GLKBaseEffect light2](self, "light2"), "description")];
  }
  else
  {
    objc_msgSend(v3, "appendFormat:", @"light2 = \tNULL\n", v15);
  }
  if (self->_material)
  {
    objc_msgSend(v3, "appendFormat:", @"material = %p\n", -[GLKBaseEffect material](self, "material"));
    [v3 appendFormat:@"%@\n", -[GLKEffectPropertyMaterial description](-[GLKBaseEffect material](self, "material"), "description")];
  }
  else
  {
    objc_msgSend(v3, "appendFormat:", @"material = \tNULL\n", v16);
  }
  if (self->_texture2d0)
  {
    objc_msgSend(v3, "appendFormat:", @"texture2d0 = %p\n", -[GLKBaseEffect texture2d0](self, "texture2d0"));
    [v3 appendFormat:@"%@\n", -[GLKEffectPropertyTexture description](-[GLKBaseEffect texture2d0](self, "texture2d0"), "description")];
  }
  else
  {
    objc_msgSend(v3, "appendFormat:", @"texture2d0 = \t\tNULL\n", v17);
  }
  if (self->_texture2d1)
  {
    objc_msgSend(v3, "appendFormat:", @"texture2d1 = %p\n", -[GLKBaseEffect texture2d1](self, "texture2d1"));
    [v3 appendFormat:@"%@\n", -[GLKEffectPropertyTexture description](-[GLKBaseEffect texture2d1](self, "texture2d1"), "description")];
  }
  else
  {
    objc_msgSend(v3, "appendFormat:", @"texture2d1 = \t\tNULL\n", v18);
  }
  constantColorProp = self->_constantColorProp;
  if (constantColorProp)
  {
    [(GLKEffectPropertyConstantColor *)constantColorProp color];
    objc_msgSend(v3, "appendFormat:", @"constantColor = {%f,%f,%f,%f}\n", v9, v10, v7, v8);
  }
  else
  {
    objc_msgSend(v3, "appendFormat:", @"constantColor = \tNULL\n", v19, v21, v22, v23);
  }
  if (self->_fog)
  {
    objc_msgSend(v3, "appendFormat:", @"fog = %p\n", -[GLKBaseEffect fog](self, "fog"));
    [v3 appendFormat:@"%@\n", -[GLKEffectPropertyFog description](-[GLKBaseEffect fog](self, "fog"), "description")];
  }
  else
  {
    objc_msgSend(v3, "appendFormat:", @"fog = \t\t\t\tNULL\n", v20);
  }
  [v3 appendFormat:@"}"];
  return v3;
}

- (void)dealloc
{
  effect = self->_effect;
  if (effect) {

  }
  v4.receiver = self;
  v4.super_class = (Class)GLKBaseEffect;
  [(GLKBaseEffect *)&v4 dealloc];
}

- (GLBOOLean)colorMaterialEnabled
{
  return self->_colorMaterialEnabled;
}

- (GLBOOLean)lightModelTwoSided
{
  return self->_lightModelTwoSided;
}

- (GLKEffectPropertyTransform)transform
{
  return self->_transform;
}

- (GLKLightingType)lightingType
{
  return self->_lightingType;
}

- (GLKVector4)lightModelAmbientColor
{
  *(void *)&result.v[2] = a2;
  *(void *)&result.x = self;
  return result;
}

- (NSArray)textureOrder
{
  return self->_textureOrder;
}

- (GLKEffectPropertyConstantColor)constantColorProp
{
  return self->_constantColorProp;
}

- (GLBOOLean)useConstantColor
{
  return self->_useConstantColor;
}

- (unsigned)propertyArrayStale
{
  return self->_propertyArrayStale;
}

- (void)setPropertyArrayStale:(unsigned __int8)a3
{
  self->_propertyArrayStale = a3;
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

@end