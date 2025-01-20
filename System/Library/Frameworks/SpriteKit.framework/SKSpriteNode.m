@interface SKSpriteNode
+ (BOOL)supportsSecureCoding;
+ (SKSpriteNode)spriteNodeWithColor:(UIColor *)color size:(CGSize)size;
+ (SKSpriteNode)spriteNodeWithImageNamed:(NSString *)name;
+ (SKSpriteNode)spriteNodeWithImageNamed:(NSString *)name normalMapped:(BOOL)generateNormalMap;
+ (SKSpriteNode)spriteNodeWithTexture:(SKTexture *)texture;
+ (SKSpriteNode)spriteNodeWithTexture:(SKTexture *)texture normalMap:(SKTexture *)normalMap;
+ (SKSpriteNode)spriteNodeWithTexture:(SKTexture *)texture size:(CGSize)size;
+ (id)debugHierarchyPropertyDescriptions;
+ (id)debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6;
- (BOOL)_pathFromTextureToPoints:(SKSpriteNode *)self outSize:(SEL)a2 accuracy:;
- (BOOL)isEqualToNode:(id)a3;
- (BOOL)repeatTexture;
- (BOOL)shouldRepeatTexture;
- (CGFloat)colorBlendFactor;
- (CGPoint)anchorPoint;
- (CGRect)centerRect;
- (CGSize)repeatTextureSize;
- (CGSize)size;
- (NSString)description;
- (SKAttributeValue)valueForAttributeNamed:(NSString *)key;
- (SKBlendMode)blendMode;
- (SKShader)shader;
- (SKSpriteNode)init;
- (SKSpriteNode)initWithCoder:(NSCoder *)aDecoder;
- (SKSpriteNode)initWithColor:(UIColor *)color size:(CGSize)size;
- (SKSpriteNode)initWithImageNamed:(NSString *)name;
- (SKSpriteNode)initWithTexture:(SKTexture *)texture;
- (SKSpriteNode)initWithTexture:(SKTexture *)texture color:(UIColor *)color size:(CGSize)size;
- (SKTexture)normalTexture;
- (SKTexture)texture;
- (SKWarpGeometry)warpGeometry;
- (UIColor)color;
- (id)copy;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)subdivisionLevels;
- (uint32_t)lightingBitMask;
- (uint32_t)shadowCastBitMask;
- (uint32_t)shadowedBitMask;
- (void)_didMakeBackingNode;
- (void)_makeBackingNode;
- (void)encodeWithCoder:(id)a3;
- (void)scaleToSize:(CGSize)size;
- (void)setAnchorPoint:(CGPoint)anchorPoint;
- (void)setBlendMode:(SKBlendMode)blendMode;
- (void)setBounds:(CGRect)a3;
- (void)setCenterRect:(CGRect)centerRect;
- (void)setColor:(UIColor *)color;
- (void)setColorBlendFactor:(CGFloat)colorBlendFactor;
- (void)setLightingBitMask:(uint32_t)lightingBitMask;
- (void)setNormalTexture:(SKTexture *)normalTexture;
- (void)setShader:(SKShader *)shader;
- (void)setShadowCastBitMask:(uint32_t)shadowCastBitMask;
- (void)setShadowedBitMask:(uint32_t)shadowedBitMask;
- (void)setShouldRepeatTexture:(BOOL)a3;
- (void)setSize:(CGSize)size;
- (void)setSubdivisionLevels:(int64_t)a3;
- (void)setTexture:(SKTexture *)texture;
- (void)setValue:(SKAttributeValue *)value forAttributeNamed:(NSString *)key;
- (void)setWarpGeometry:(id)a3;
@end

@implementation SKSpriteNode

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKSpriteNode)initWithTexture:(SKTexture *)texture color:(UIColor *)color size:(CGSize)size
{
  double height = size.height;
  double width = size.width;
  v9 = texture;
  v10 = color;
  v15.receiver = self;
  v15.super_class = (Class)SKSpriteNode;
  v11 = [(SKNode *)&v15 init];
  if (v11)
  {
    if (width < 0.0 || height < 0.0)
    {
      v12 = (void *)MEMORY[0x263EFF940];
      v16.double width = width;
      v16.double height = height;
      v13 = NSStringFromCGSize(v16);
      [v12 raise:*MEMORY[0x263EFF4A0], @"Invalid size specified: %@", v13 format];
    }
    [(SKSpriteNode *)v11 setColor:v10];
    -[SKSpriteNode setSize:](v11, "setSize:", width, height);
    [(SKSpriteNode *)v11 setTexture:v9];
    [(SKSpriteNode *)v11 setLightingBitMask:0];
    [(SKSpriteNode *)v11 setShadowCastBitMask:0];
    [(SKSpriteNode *)v11 setShadowedBitMask:0];
  }

  return v11;
}

- (void)_makeBackingNode
{
}

- (void)_didMakeBackingNode
{
  v3.receiver = self;
  v3.super_class = (Class)SKSpriteNode;
  [(SKNode *)&v3 _didMakeBackingNode];
  self->_skcSpriteNode = [(SKNode *)self _backingNode];
}

- (SKSpriteNode)init
{
  objc_super v3 = [MEMORY[0x263F1C550] colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.0];
  v4 = -[SKSpriteNode initWithTexture:color:size:](self, "initWithTexture:color:size:", 0, v3, *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));

  return v4;
}

- (SKSpriteNode)initWithCoder:(NSCoder *)aDecoder
{
  v4 = aDecoder;
  v5 = self;
  v43.receiver = v5;
  v43.super_class = (Class)SKSpriteNode;
  v6 = [(SKNode *)&v43 initWithCoder:v4];
  v7 = v6;
  if (v6) {
    BOOL v8 = v6 == v5;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8)
  {
    v9 = [(NSCoder *)v4 decodeObjectOfClass:objc_opt_class() forKey:@"_shader"];
    [(SKSpriteNode *)v5 setShader:v9];

    v10 = [(NSCoder *)v4 decodeObjectOfClass:objc_opt_class() forKey:@"_normalTexture"];
    [(SKSpriteNode *)v5 setNormalTexture:v10];

    [(SKSpriteNode *)v5 setLightingBitMask:[(NSCoder *)v4 decodeInt32ForKey:@"_lightingBitMask"]];
    [(SKSpriteNode *)v5 setShadowCastBitMask:[(NSCoder *)v4 decodeInt32ForKey:@"_shadowCastBitMask"]];
    [(SKSpriteNode *)v5 setShadowedBitMask:[(NSCoder *)v4 decodeInt32ForKey:@"_shadowedBitMask"]];
    v11 = [(NSCoder *)v4 decodeObjectOfClass:objc_opt_class() forKey:@"_centerRect"];
    if (v11)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        CGRect v44 = CGRectFromString(v11);
      }
      else {
        [(NSString *)v11 CGRectValue];
      }
      -[SKSpriteNode setCenterRect:](v5, "setCenterRect:", v44.origin.x, v44.origin.y, v44.size.width, v44.size.height);
    }
    v12 = [(NSCoder *)v4 decodeObjectOfClass:objc_opt_class() forKey:@"_texture"];
    [(SKSpriteNode *)v5 setTexture:v12];

    v13 = [(NSCoder *)v4 decodeObjectOfClass:objc_opt_class() forKey:@"_bounds"];
    [v13 CGRectValue];
    double v15 = v14;
    double v17 = v16;

    skcSpriteNode = (SKCNode *)v5->_skcSpriteNode;
    *(float *)&unsigned int v19 = v15;
    *(float *)&unsigned int v20 = v17;
    long long v42 = __PAIR64__(v20, v19);
    SKCNode::setSize(skcSpriteNode, &v42);
    v21 = [(NSCoder *)v4 decodeObjectOfClass:objc_opt_class() forKey:@"_colorMix"];
    [v21 doubleValue];
    -[SKSpriteNode setColorBlendFactor:](v5, "setColorBlendFactor:");

    v22 = [(NSCoder *)v4 decodeObjectOfClass:objc_opt_class() forKey:@"_blendMode"];
    -[SKSpriteNode setBlendMode:](v5, "setBlendMode:", (int)[v22 intValue]);

    v23 = [(NSCoder *)v4 decodeObjectOfClass:objc_opt_class() forKey:@"_baseColorR"];
    [v23 doubleValue];
    double v25 = v24;
    v26 = [(NSCoder *)v4 decodeObjectOfClass:objc_opt_class() forKey:@"_baseColorG"];
    [v26 doubleValue];
    double v28 = v27;
    v29 = [(NSCoder *)v4 decodeObjectOfClass:objc_opt_class() forKey:@"_baseColorB"];
    [v29 doubleValue];
    double v31 = v30;
    v32 = [(NSCoder *)v4 decodeObjectOfClass:objc_opt_class() forKey:@"_baseColorA"];
    [v32 doubleValue];
    float v34 = v33;

    *(float *)&double v25 = v25;
    LODWORD(v35) = LODWORD(v25);
    *(float *)&double v28 = v28;
    LODWORD(v36) = LODWORD(v28);
    *(float *)&double v31 = v31;
    LODWORD(v37) = LODWORD(v31);
    *(float *)&double v38 = v34;
    v39 = objc_msgSend(MEMORY[0x263F1C550], "colorWithComponentRGBA:", v35, v36, v37, v38);
    [(SKSpriteNode *)v5 setColor:v39];

    v40 = [(NSCoder *)v4 decodeObjectOfClass:objc_opt_class() forKey:@"_warpGeometry"];
    [(SKSpriteNode *)v5 setWarpGeometry:v40];

    [(SKSpriteNode *)v5 setSubdivisionLevels:[(NSCoder *)v4 decodeIntegerForKey:@"_subdivisionLevels"]];
  }

  return v7;
}

- (SKSpriteNode)initWithImageNamed:(NSString *)name
{
  v4 = +[SKTexture textureWithImageNamed:name];
  v5 = [(SKSpriteNode *)self initWithTexture:v4];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)SKSpriteNode;
  [(SKNode *)&v25 encodeWithCoder:v4];
  skcSpriteNode = (float32x4_t *)self->_skcSpriteNode;
  float32x4_t v23 = skcSpriteNode[21];
  unint64_t v6 = vmlsq_f32((float32x4_t)SKCNode::getTranslation((__n128 *)skcSpriteNode), skcSpriteNode[22], v23).u64[0];
  v7 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", *(float *)&v6, *((float *)&v6 + 1), v23.f32[0], v23.f32[1]);
  [v4 encodeObject:v7 forKey:@"_bounds"];

  BOOL v8 = objc_msgSend(NSNumber, "numberWithLong:", -[SKSpriteNode blendMode](self, "blendMode"));
  [v4 encodeObject:v8 forKey:@"_blendMode"];

  v9 = [(SKSpriteNode *)self shader];
  [v4 encodeObject:v9 forKey:@"_shader"];

  v10 = [(SKSpriteNode *)self normalTexture];
  [v4 encodeObject:v10 forKey:@"_normalTexture"];

  objc_msgSend(v4, "encodeInt32:forKey:", -[SKSpriteNode lightingBitMask](self, "lightingBitMask"), @"_lightingBitMask");
  objc_msgSend(v4, "encodeInt32:forKey:", -[SKSpriteNode shadowCastBitMask](self, "shadowCastBitMask"), @"_shadowCastBitMask");
  objc_msgSend(v4, "encodeInt32:forKey:", -[SKSpriteNode shadowedBitMask](self, "shadowedBitMask"), @"_shadowedBitMask");
  v11 = [(SKSpriteNode *)self texture];
  [v4 encodeObject:v11 forKey:@"_texture"];

  v12 = NSNumber;
  [(SKSpriteNode *)self colorBlendFactor];
  v13 = objc_msgSend(v12, "numberWithDouble:");
  [v4 encodeObject:v13 forKey:@"_colorMix"];

  double v14 = (void *)MEMORY[0x263F08D40];
  [(SKSpriteNode *)self anchorPoint];
  double v15 = objc_msgSend(v14, "valueWithCGPoint:");
  [v4 encodeObject:v15 forKey:@"_anchorPoint"];

  long long v24 = *((_OWORD *)self->_skcSpriteNode + 19);
  double v16 = objc_msgSend(NSNumber, "numberWithDouble:", *(float *)&v24, (void)v24);
  [v4 encodeObject:v16 forKey:@"_baseColorR"];

  double v17 = [NSNumber numberWithDouble:*((float *)&v24 + 1)];
  [v4 encodeObject:v17 forKey:@"_baseColorG"];

  v18 = [NSNumber numberWithDouble:*((float *)&v24 + 2)];
  [v4 encodeObject:v18 forKey:@"_baseColorB"];

  unsigned int v19 = [NSNumber numberWithDouble:*((float *)&v24 + 3)];
  [v4 encodeObject:v19 forKey:@"_baseColorA"];

  unsigned int v20 = (void *)MEMORY[0x263F08D40];
  [(SKSpriteNode *)self centerRect];
  v21 = objc_msgSend(v20, "valueWithCGRect:");
  [v4 encodeObject:v21 forKey:@"_centerRect"];

  v22 = [(SKSpriteNode *)self warpGeometry];
  [v4 encodeObject:v22 forKey:@"_warpGeometry"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[SKSpriteNode subdivisionLevels](self, "subdivisionLevels"), @"_subdivisionLevels");
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(SKSpriteNode *)self anchorPoint];
  double v9 = v8;
  double v11 = v10;
  -[SKSpriteNode setSize:](self, "setSize:", width, height);

  -[SKNode setPosition:](self, "setPosition:", x + v9 * width, y + v11 * height);
}

- (SKSpriteNode)initWithColor:(UIColor *)color size:(CGSize)size
{
  return -[SKSpriteNode initWithTexture:color:size:](self, "initWithTexture:color:size:", 0, color, size.width, size.height);
}

- (SKSpriteNode)initWithTexture:(SKTexture *)texture
{
  id v4 = texture;
  v5 = [MEMORY[0x263F1C550] colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.0];
  [(SKTexture *)v4 size];
  unint64_t v6 = -[SKSpriteNode initWithTexture:color:size:](self, "initWithTexture:color:size:", v4, v5);

  return v6;
}

+ (SKSpriteNode)spriteNodeWithImageNamed:(NSString *)name
{
  objc_super v3 = name;
  id v4 = objc_opt_class();
  v5 = +[SKTexture textureWithImageNamed:v3];
  unint64_t v6 = [v4 spriteNodeWithTexture:v5];

  return (SKSpriteNode *)v6;
}

+ (SKSpriteNode)spriteNodeWithImageNamed:(NSString *)name normalMapped:(BOOL)generateNormalMap
{
  BOOL v4 = generateNormalMap;
  v5 = +[SKTexture textureWithImageNamed:name];
  unint64_t v6 = [(id)objc_opt_class() spriteNodeWithTexture:v5];
  if (v4)
  {
    v7 = [v5 textureByGeneratingNormalMap];
    [v6 setNormalTexture:v7];
  }

  return (SKSpriteNode *)v6;
}

+ (SKSpriteNode)spriteNodeWithTexture:(SKTexture *)texture
{
  objc_super v3 = texture;
  BOOL v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithTexture:v3];

  return (SKSpriteNode *)v4;
}

+ (SKSpriteNode)spriteNodeWithTexture:(SKTexture *)texture size:(CGSize)size
{
  double height = size.height;
  double width = size.width;
  unint64_t v6 = texture;
  v7 = [(id)objc_opt_class() spriteNodeWithTexture:v6];
  if (width < 0.0 || height < 0.0)
  {
    double v8 = (void *)MEMORY[0x263EFF940];
    v12.double width = width;
    v12.double height = height;
    double v9 = NSStringFromCGSize(v12);
    [v8 raise:*MEMORY[0x263EFF4A0], @"Invalid bounds specified: %@", v9 format];
  }
  objc_msgSend(v7, "setSize:", width, height);

  return (SKSpriteNode *)v7;
}

+ (SKSpriteNode)spriteNodeWithTexture:(SKTexture *)texture normalMap:(SKTexture *)normalMap
{
  v5 = texture;
  unint64_t v6 = normalMap;
  v7 = [(id)objc_opt_class() spriteNodeWithTexture:v5];
  [v7 setNormalTexture:v6];

  return (SKSpriteNode *)v7;
}

+ (SKSpriteNode)spriteNodeWithColor:(UIColor *)color size:(CGSize)size
{
  double height = size.height;
  double width = size.width;
  unint64_t v6 = color;
  v7 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithColor:size:", v6, width, height);

  return (SKSpriteNode *)v7;
}

- (NSString)description
{
  BOOL v4 = NSString;
  v5 = [(SKNode *)self name];
  unint64_t v6 = [(SKSpriteNode *)self texture];
  if (v6)
  {
    v2 = [(SKSpriteNode *)self texture];
    v7 = [v2 description];
  }
  else
  {
    v7 = @"'nil'";
  }
  [(SKNode *)self position];
  double v8 = NSStringFromCGPoint(v19);
  [(SKNode *)self xScale];
  uint64_t v10 = v9;
  [(SKNode *)self yScale];
  uint64_t v12 = v11;
  [(SKSpriteNode *)self size];
  v13 = NSStringFromCGSize(v20);
  [(SKSpriteNode *)self anchorPoint];
  double v14 = NSStringFromCGPoint(v21);
  [(SKNode *)self zRotation];
  double v16 = [v4 stringWithFormat:@"<SKSpriteNode> name:'%@' texture:[%@] position:%@ scale:{%.2f, %.2f} size:%@ anchor:%@ rotation:%.2f", v5, v7, v8, v10, v12, v13, v14, v15];

  if (v6)
  {
  }

  return (NSString *)v16;
}

- (SKTexture)texture
{
  return (SKTexture *)v2;
}

- (void)setTexture:(SKTexture *)texture
{
  BOOL v4 = texture;
  skcNode = self->super._skcNode;
  unint64_t v6 = v4;
  if (skcNode)
  {
    BOOL v4 = v6;
  }
  SKCSpriteNode::setPrimaryTexture((id *)skcNode, v4);
}

- (void)setNormalTexture:(SKTexture *)normalTexture
{
  BOOL v4 = normalTexture;
  skcNode = self->super._skcNode;
  unint64_t v6 = v4;
  if (skcNode)
  {
    BOOL v4 = v6;
  }
  SKCSpriteNode::setSecondaryTexture((id *)skcNode, v4);
}

- (SKTexture)normalTexture
{
  return (SKTexture *)v2;
}

- (void)setShader:(SKShader *)shader
{
  BOOL v4 = shader;
  [*((id *)self->_skcSpriteNode + 74) _removeTargetNode:self];
  SKCSpriteNode::setShader((id *)self->_skcSpriteNode, v4);
  [(SKShader *)v4 _addTargetNode:self];
}

- (SKShader)shader
{
  return (SKShader *)*((id *)self->_skcSpriteNode + 74);
}

- (CGFloat)colorBlendFactor
{
  return *((float *)self->_skcSpriteNode + 80);
}

- (void)setColorBlendFactor:(CGFloat)colorBlendFactor
{
  skcSpriteNode = self->_skcSpriteNode;
  float v4 = colorBlendFactor;
  float v5 = fminf(fmaxf(v4, 0.0), 1.0);
  (*(void (**)(void *, float *))(*(void *)skcSpriteNode + 192))(skcSpriteNode, &v5);
}

- (UIColor)color
{
  skcSpriteNode = self->_skcSpriteNode;
  LODWORD(v2) = skcSpriteNode[76];
  LODWORD(v3) = skcSpriteNode[77];
  LODWORD(v4) = skcSpriteNode[78];
  LODWORD(v5) = skcSpriteNode[79];
  return (UIColor *)objc_msgSend(MEMORY[0x263F1C550], "colorWithComponentRGBA:", v2, v3, v4, v5);
}

- (void)setColor:(UIColor *)color
{
  double v4 = color;
  [(UIColor *)v4 componentRGBA];
  skcSpriteNode = self->_skcSpriteNode;
  DWORD1(v7) = v6;
  *((void *)&v7 + 1) = __PAIR64__(v9, v8);
  long long v10 = v7;
  (*(void (**)(void *, long long *))(*(void *)skcSpriteNode + 184))(skcSpriteNode, &v10);
}

- (CGPoint)anchorPoint
{
  float64x2_t v2 = vcvtq_f64_f32(*(float32x2_t *)((char *)self->_skcSpriteNode + 352));
  double v3 = v2.f64[1];
  result.double x = v2.f64[0];
  result.double y = v3;
  return result;
}

- (void)setAnchorPoint:(CGPoint)anchorPoint
{
  *(float *)&unsigned int v3 = anchorPoint.x;
  *(float *)&unsigned int v4 = anchorPoint.y;
  long long v5 = __PAIR64__(v4, v3);
  SKCNode::setAnchor((SKCNode *)self->_skcSpriteNode, &v5);
}

- (CGSize)size
{
  float64x2_t v2 = vcvtq_f64_f32(vmul_f32(*(float32x2_t *)((char *)self->_skcSpriteNode + 336), (float32x2_t)(SKCNode::getScale((__n128 *)self->_skcSpriteNode).n128_u64[0] & 0x7FFFFFFF7FFFFFFFLL)));
  double v3 = v2.f64[1];
  result.double width = v2.f64[0];
  result.double height = v3;
  return result;
}

- (void)setSize:(CGSize)size
{
  double height = size.height;
  double width = size.width;
  __n128 Scale = SKCNode::getScale((__n128 *)self->_skcSpriteNode);
  v7.i32[0] = 0;
  *(float *)&unsigned int v8 = width;
  *(float *)&unsigned int v9 = height;
  unint64_t v10 = __PAIR64__(v9, v8);
  int32x4_t v11 = (int32x4_t)vandq_s8((int8x16_t)vclezq_f32((float32x4_t)Scale), (int8x16_t)xmmword_20AE9B2A0);
  v11.i32[0] = vaddvq_s32(v11);
  v12.i64[0] = 0xF0F0F0F0F0F0F0FLL;
  v12.i64[1] = 0xF0F0F0F0F0F0F0FLL;
  v7.i64[0] = vceqq_s8(vandq_s8((int8x16_t)v11, v12), vandq_s8(v7, v12)).u64[0];
  int8x16_t v13 = vdupq_lane_s8(*(int8x8_t *)v7.i8, 0);
  int8x16_t v14 = (int8x16_t)vdupq_n_s64(v7.i8[0] & 0xF | (unint64_t)(16 * (v13.i8[1] & 0xF)) | ((v13.i8[2] & 0xF) << 8) & 0xFFF | ((v13.i8[3] & 0xFu) << 12) | ((unint64_t)(v13.i8[4] & 0xF) << 16) & 0xFFFFFFFFFF0FFFFFLL | ((unint64_t)(v13.i8[5] & 0xF) << 20) | ((unint64_t)(v13.i8[6] & 0xF) << 24) | ((unint64_t)(v13.i8[7] & 0xF) << 28) | ((unint64_t)(v13.i8[8] & 0xF) << 32) | ((unint64_t)(v13.i8[9] & 0xF) << 36) | ((unint64_t)(v13.i8[10] & 0xF) << 40) | ((unint64_t)(v13.i8[11] & 0xF) << 44) | ((unint64_t)(v13.i8[12] & 0xF) << 48) | ((unint64_t)(v13.i8[13] & 0xF) << 52) | ((unint64_t)(v13.i8[14] & 0xF) << 56) | ((unint64_t)v13.u8[15] << 60));
  __asm { FMOV            V3.4S, #1.0 }
  float32x4_t v20 = vdivq_f32((float32x4_t)v10, (float32x4_t)vbslq_s8(v14, (int8x16_t)Scale, _Q3));
  SKCNode::setSize((SKCNode *)self->_skcSpriteNode, &v20);
}

- (void)scaleToSize:(CGSize)size
{
  skcSpriteNode = (SKCNode *)self->_skcSpriteNode;
  long long v4 = *((_OWORD *)skcSpriteNode + 21);
  int32x2_t v5 = vceqz_s32((int32x2_t)vand_s8((int8x8_t)vrev64_s32(*(int32x2_t *)&v4), (int8x8_t)0x6000000060000000));
  if (((v5.i32[1] | v5.i32[0]) & 1) == 0)
  {
    CGFloat height = size.height;
    *(float32x2_t *)&size.double width = vdiv_f32(vcvt_f32_f64((float64x2_t)size), *(float32x2_t *)&v4);
    SKCNode::setScale(skcSpriteNode, (__n128)size);
  }
}

- (CGRect)centerRect
{
  skcSpriteNode = (float *)self->_skcSpriteNode;
  double v3 = skcSpriteNode[144];
  double v4 = skcSpriteNode[145];
  double v5 = skcSpriteNode[146];
  double v6 = skcSpriteNode[147];
  result.size.CGFloat height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (void)setCenterRect:(CGRect)centerRect
{
  CGFloat height = centerRect.size.height;
  CGFloat y = centerRect.origin.y;
  *((float32x4_t *)self->_skcSpriteNode + 36) = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64((float64x2_t)centerRect.origin), (float64x2_t)centerRect.size);
}

- (void)setWarpGeometry:(id)a3
{
}

- (SKWarpGeometry)warpGeometry
{
  return (SKWarpGeometry *)*((id *)self->_skcSpriteNode + 77);
}

- (void)setSubdivisionLevels:(int64_t)a3
{
}

- (int64_t)subdivisionLevels
{
  return *((unsigned int *)self->_skcSpriteNode + 156);
}

- (BOOL)repeatTexture
{
  return 0;
}

- (CGSize)repeatTextureSize
{
  double v2 = *MEMORY[0x263F001B0];
  double v3 = *(double *)(MEMORY[0x263F001B0] + 8);
  result.CGFloat height = v3;
  result.double width = v2;
  return result;
}

- (void)setLightingBitMask:(uint32_t)lightingBitMask
{
  *((_DWORD *)self->_skcSpriteNode + 140) = lightingBitMask;
}

- (uint32_t)lightingBitMask
{
  return *((_DWORD *)self->_skcSpriteNode + 140);
}

- (void)setShadowCastBitMask:(uint32_t)shadowCastBitMask
{
  *((_DWORD *)self->_skcSpriteNode + 141) = shadowCastBitMask;
}

- (uint32_t)shadowCastBitMask
{
  return *((_DWORD *)self->_skcSpriteNode + 141);
}

- (void)setShadowedBitMask:(uint32_t)shadowedBitMask
{
  *((_DWORD *)self->_skcSpriteNode + 142) = shadowedBitMask;
}

- (uint32_t)shadowedBitMask
{
  return *((_DWORD *)self->_skcSpriteNode + 142);
}

- (SKBlendMode)blendMode
{
  return *((void *)self->_skcSpriteNode + 36);
}

- (void)setBlendMode:(SKBlendMode)blendMode
{
}

- (id)copy
{
  uint64_t v3 = MEMORY[0x21052E6F0](self, a2);

  return [(SKSpriteNode *)self copyWithZone:v3];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SKSpriteNode;
  id v4 = [(SKNode *)&v10 copyWithZone:a3];
  double v5 = [(SKSpriteNode *)self texture];
  [v4 setTexture:v5];

  [(SKSpriteNode *)self size];
  objc_msgSend(v4, "setSize:");
  double v6 = [(SKSpriteNode *)self color];
  [v4 setColor:v6];

  [(SKSpriteNode *)self colorBlendFactor];
  objc_msgSend(v4, "setColorBlendFactor:");
  objc_msgSend(v4, "setBlendMode:", -[SKSpriteNode blendMode](self, "blendMode"));
  objc_msgSend(v4, "setLightingBitMask:", -[SKSpriteNode lightingBitMask](self, "lightingBitMask"));
  objc_msgSend(v4, "setShadowCastBitMask:", -[SKSpriteNode shadowCastBitMask](self, "shadowCastBitMask"));
  objc_msgSend(v4, "setShadowedBitMask:", -[SKSpriteNode shadowedBitMask](self, "shadowedBitMask"));
  int8x16_t v7 = [(SKSpriteNode *)self normalTexture];
  [v4 setNormalTexture:v7];

  unsigned int v8 = [(SKSpriteNode *)self shader];
  [v4 setShader:v8];

  [(SKSpriteNode *)self centerRect];
  objc_msgSend(v4, "setCenterRect:");
  return v4;
}

- (BOOL)isEqualToNode:(id)a3
{
  unsigned int v8 = (SKSpriteNode *)a3;
  if (self == v8)
  {
    LOBYTE(v15) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unsigned int v9 = v8;
      v48.receiver = self;
      v48.super_class = (Class)SKSpriteNode;
      if ([(SKNode *)&v48 isEqualToNode:v9])
      {
        [(SKSpriteNode *)self size];
        double v11 = v10;
        double v13 = v12;
        [(SKSpriteNode *)v9 size];
        LOBYTE(v15) = 0;
        if (v11 == v16 && v13 == v14)
        {
          [(SKSpriteNode *)self anchorPoint];
          double v18 = v17;
          double v20 = v19;
          [(SKSpriteNode *)v9 anchorPoint];
          SKBlendMode v15 = SKBlendModeAlpha;
          if (v18 == v22 && v20 == v21)
          {
            float32x4_t v23 = [(SKSpriteNode *)self texture];
            long long v24 = [v23 imageNameOrPath];
            if (v24
              || ([(SKSpriteNode *)v9 texture],
                  v45 = objc_claimAutoreleasedReturnValue(),
                  [v45 imageNameOrPath],
                  (SKBlendMode v15 = objc_claimAutoreleasedReturnValue()) != SKBlendModeAlpha))
            {
              id v4 = [(SKSpriteNode *)self texture];
              double v5 = [v4 imageNameOrPath];
              double v6 = [(SKSpriteNode *)v9 texture];
              uint64_t v3 = [v6 imageNameOrPath];
              if (![v5 isEqualToString:v3])
              {
                v47 = (void *)v15;
                LOBYTE(v15) = 0;
                goto LABEL_23;
              }
              int v46 = 1;
            }
            else
            {
              int v46 = 0;
            }
            v47 = (void *)v15;
            [(SKSpriteNode *)self centerRect];
            CGFloat v27 = v26;
            CGFloat v29 = v28;
            CGFloat v31 = v30;
            CGFloat v33 = v32;
            [(SKSpriteNode *)v9 centerRect];
            v50.origin.double x = v34;
            v50.origin.CGFloat y = v35;
            v50.size.double width = v36;
            v50.size.CGFloat height = v37;
            v49.origin.double x = v27;
            v49.origin.CGFloat y = v29;
            v49.size.double width = v31;
            v49.size.CGFloat height = v33;
            if (CGRectEqualToRect(v49, v50)
              && ([(SKSpriteNode *)self colorBlendFactor],
                  double v39 = v38,
                  [(SKSpriteNode *)v9 colorBlendFactor],
                  float v40 = v39,
                  *(float *)&double v41 = v41,
                  (COERCE_UNSIGNED_INT(v40 - *(float *)&v41) & 0x60000000) == 0))
            {
              id v44 = [(SKSpriteNode *)self color];
              long long v42 = (CGColor *)[v44 CGColor];
              id v43 = [(SKSpriteNode *)v9 color];
              if (!CGColorEqualToColor(v42, (CGColorRef)[v43 CGColor]))
              {

                LOBYTE(v15) = 0;
                if (!v46) {
                  goto LABEL_24;
                }
                goto LABEL_23;
              }
              SKBlendMode v15 = [(SKSpriteNode *)self blendMode];
              LOBYTE(v15) = v15 == [(SKSpriteNode *)v9 blendMode];
            }
            else
            {
              LOBYTE(v15) = 0;
            }
            if ((v46 & 1) == 0)
            {
LABEL_24:
              if (!v24)
              {
              }
              goto LABEL_15;
            }
LABEL_23:

            goto LABEL_24;
          }
        }
      }
      else
      {
        LOBYTE(v15) = 0;
      }
LABEL_15:

      goto LABEL_16;
    }
    LOBYTE(v15) = 0;
  }
LABEL_16:

  return v15;
}

- (BOOL)_pathFromTextureToPoints:(SKSpriteNode *)self outSize:(SEL)a2 accuracy:
{
  BOOL v5 = 0;
  if (v2)
  {
    double v6 = v3;
    if (v3)
    {
      int v7 = v4;
      unsigned int v8 = v2;
      double v10 = [(SKSpriteNode *)self texture];
      [(SKSpriteNode *)self size];
      double v12 = v11;
      double v14 = v13;
      LODWORD(v11) = 998277249;
      double v15 = v12;
      double v16 = v14;
      LODWORD(v14) = v7;
      double v17 = +[SKPhysicsBody bodyWithTexture:alphaThreshold:size:accuracy:](SKPhysicsBody, "bodyWithTexture:alphaThreshold:size:accuracy:", v10, v11, v15, v16, v14);

      uint64_t v18 = [v17 volume];
      uint64_t v19 = v18;
      BOOL v5 = v18 != 0;
      if (v18)
      {
        int64_t v20 = *(void *)(v18 + 16) - *(void *)(v18 + 8);
        int64_t *v6 = v20 >> 3;
        *unsigned int v8 = malloc_type_malloc(v20, 0x100004000313F17uLL);
        uint64_t v21 = *(void *)(v19 + 8);
        if (*(void *)(v19 + 16) != v21)
        {
          unint64_t v22 = 0;
          do
          {
            *((void *)*v8 + v22) = *(void *)(v21 + 8 * v22);
            ++v22;
            uint64_t v21 = *(void *)(v19 + 8);
          }
          while (v22 < (*(void *)(v19 + 16) - v21) >> 3);
        }
        PKPath::~PKPath((PKPath *)v19);
        MEMORY[0x21052EA30]();
      }
    }
  }
  return v5;
}

- (SKAttributeValue)valueForAttributeNamed:(NSString *)key
{
  v5.receiver = self;
  v5.super_class = (Class)SKSpriteNode;
  uint64_t v3 = [(SKNode *)&v5 valueForAttributeNamed:key];

  return (SKAttributeValue *)v3;
}

- (void)setValue:(SKAttributeValue *)value forAttributeNamed:(NSString *)key
{
  v4.receiver = self;
  v4.super_class = (Class)SKSpriteNode;
  [(SKNode *)&v4 setValue:value forAttributeNamed:key];
}

+ (id)debugHierarchyPropertyDescriptions
{
  v28[13] = *MEMORY[0x263EF8340];
  double v2 = (const CFDictionaryKeyCallBacks *)MEMORY[0x263EFFB78];
  uint64_t v3 = (const CFDictionaryValueCallBacks *)MEMORY[0x263EFFF90];
  Mutable = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(Mutable, @"propertyName", @"anchorPoint");
  CFDictionaryAddValue(Mutable, @"propertyRuntimeType", @"CGPoint");
  CFDictionaryAddValue(Mutable, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypePoint");
  CFDictionaryAddValue(Mutable, @"propertyFormat", @"CGf, CGf");
  double v26 = Mutable;
  v28[0] = Mutable;
  objc_super v5 = CFDictionaryCreateMutable(0, 7, v2, v3);
  CFDictionaryAddValue(v5, @"propertyName", @"centerRect");
  CFDictionaryAddValue(v5, @"propertyRuntimeType", @"CGRect");
  CFDictionaryAddValue(v5, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeRect");
  CFDictionaryAddValue(v5, @"propertyFormat", @"CGf, CGf, CGf, CGf");
  objc_super v25 = v5;
  v28[1] = v5;
  double v6 = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(v6, @"propertyName", @"shader");
  CFDictionaryAddValue(v6, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeObjectInfo");
  CFDictionaryAddValue(v6, @"propertyFormat", @"objectInfo");
  long long v24 = v6;
  v28[2] = v6;
  int v7 = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(v7, @"propertyName", @"size");
  CFDictionaryAddValue(v7, @"propertyRuntimeType", @"CGSize");
  CFDictionaryAddValue(v7, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeSize");
  CFDictionaryAddValue(v7, @"propertyFormat", @"CGf, CGf");
  float32x4_t v23 = v7;
  v28[3] = v7;
  unsigned int v8 = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(v8, @"propertyName", @"lightingBitMask");
  CFDictionaryAddValue(v8, @"propertyRuntimeType", @"unsigned long");
  CFDictionaryAddValue(v8, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v8, @"propertyFormat", @"ul");
  v28[4] = v8;
  unsigned int v9 = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(v9, @"propertyName", @"shadowCastBitMask");
  CFDictionaryAddValue(v9, @"propertyRuntimeType", @"unsigned long");
  CFDictionaryAddValue(v9, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v9, @"propertyFormat", @"ul");
  v28[5] = v9;
  double v10 = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(v10, @"propertyName", @"shadowedBitMask");
  CFDictionaryAddValue(v10, @"propertyRuntimeType", @"unsigned long");
  CFDictionaryAddValue(v10, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v10, @"propertyFormat", @"ul");
  v28[6] = v10;
  double v11 = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(v11, @"propertyName", @"colorBlendFactor");
  CFDictionaryAddValue(v11, @"propertyRuntimeType", @"CGFloat");
  CFDictionaryAddValue(v11, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v11, @"propertyFormat", @"CGf");
  v28[7] = v11;
  double v12 = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(v12, @"propertyName", @"color");
  CFDictionaryAddValue(v12, @"propertyRuntimeType", @"CGColor");
  CFDictionaryAddValue(v12, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeColor");
  CFDictionaryAddValue(v12, @"propertyFormat", @"color");
  v28[8] = v12;
  double v13 = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(v13, @"propertyName", @"blendMode");
  CFDictionaryAddValue(v13, @"propertyRuntimeType", @"SKBlendMode");
  CFDictionaryAddValue(v13, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeEnum");
  CFDictionaryAddValue(v13, @"propertyFormat", @"integer");
  v28[9] = v13;
  double v14 = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(v14, @"propertyName", @"texture");
  CFDictionaryAddValue(v14, @"propertyRuntimeType", @"CGImage");
  CFDictionaryAddValue(v14, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeImage");
  CFDictionaryAddValue(v14, @"propertyFormat", @"public.data");
  uint64_t valuePtr = 1;
  CFNumberRef v15 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v14, @"propertyOptions", v15);
  CFRelease(v15);
  v28[10] = v14;
  double v16 = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(v16, @"propertyName", @"normalTexture");
  CFDictionaryAddValue(v16, @"propertyRuntimeType", @"CGImage");
  CFDictionaryAddValue(v16, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeImage");
  CFDictionaryAddValue(v16, @"propertyFormat", @"public.data");
  uint64_t valuePtr = 1;
  CFNumberRef v17 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v16, @"propertyOptions", v17);
  CFRelease(v17);
  v28[11] = v16;
  uint64_t v18 = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(v18, @"propertyName", @"visualRepresentation");
  CFDictionaryAddValue(v18, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeCustom");
  uint64_t valuePtr = 8;
  CFNumberRef v19 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v18, @"visibility", v19);
  CFRelease(v19);
  uint64_t valuePtr = 1;
  CFNumberRef v20 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v18, @"propertyOptions", v20);
  CFRelease(v20);
  v28[12] = v18;
  uint64_t v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:13];

  return v21;
}

+ (id)debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6
{
  keys[3] = *(void **)MEMORY[0x263EF8340];
  id v9 = a3;
  id v87 = a4;
  if ([v9 isEqualToString:@"texture"])
  {
    double v10 = [v87 texture];

    if (v10)
    {
      double v11 = [v87 texture];
      double v12 = (CGImage *)[v11 CGImage];

      if (v12)
      {
        int valuePtr = 1065353216;
        Mutable = CFDataCreateMutable(0, 0);
        uint64_t v14 = *MEMORY[0x263F01AE0];
        CFNumberRef v15 = CGImageDestinationCreateWithData(Mutable, (CFStringRef)*MEMORY[0x263F01AE0], 1uLL, 0);
        CFAllocatorRef v16 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
        CFNumberRef v17 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberFloatType, &valuePtr);
        keys[0] = *(void **)MEMORY[0x263F0EFE8];
        values[0] = v17;
        CFDictionaryRef v18 = CFDictionaryCreate(v16, (const void **)keys, (const void **)values, 1, 0, 0);
        CGImageDestinationAddImage(v15, v12, v18);
        CGImageDestinationFinalize(v15);
        CFRelease(v18);
        CFRelease(v17);
        CFRelease(v15);
        v95 = @"propertyFormat";
        uint64_t v96 = v14;
        *a5 = [NSDictionary dictionaryWithObjects:&v96 forKeys:&v95 count:1];
      }
      else
      {
        Mutable = 0;
      }
LABEL_24:
      CGImageRelease(v12);
      goto LABEL_77;
    }
    goto LABEL_9;
  }
  if ([v9 isEqualToString:@"normalTexture"])
  {
    CFNumberRef v19 = [v87 normalTexture];

    if (v19)
    {
      CFNumberRef v20 = [v87 normalTexture];
      double v12 = (CGImage *)[v20 CGImage];

      if (v12)
      {
        int valuePtr = 1065353216;
        Mutable = CFDataCreateMutable(0, 0);
        uint64_t v21 = *MEMORY[0x263F01AE0];
        unint64_t v22 = CGImageDestinationCreateWithData(Mutable, (CFStringRef)*MEMORY[0x263F01AE0], 1uLL, 0);
        CFAllocatorRef v23 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
        CFNumberRef v24 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberFloatType, &valuePtr);
        keys[0] = *(void **)MEMORY[0x263F0EFE8];
        values[0] = v24;
        CFDictionaryRef v25 = CFDictionaryCreate(v23, (const void **)keys, (const void **)values, 1, 0, 0);
        CGImageDestinationAddImage(v22, v12, v25);
        CGImageDestinationFinalize(v22);
        CFRelease(v25);
        CFRelease(v24);
        CFRelease(v22);
        v93 = @"propertyFormat";
        uint64_t v94 = v21;
        *a5 = [NSDictionary dictionaryWithObjects:&v94 forKeys:&v93 count:1];
      }
      else
      {
        Mutable = 0;
      }
      goto LABEL_24;
    }
LABEL_9:
    Mutable = 0;
    goto LABEL_77;
  }
  if ([v9 isEqualToString:@"color"])
  {
    id v26 = [v87 color];
    CGFloat v27 = (CGColor *)[v26 CGColor];
    if (v27)
    {
      Mutable = CFDictionaryCreateMutable(0, 20, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
      space = CGColorGetColorSpace(v27);
      CFStringRef value = CGColorSpaceCopyName(space);
      size_t NumberOfComponents = CGColorGetNumberOfComponents(v27);
      uint64_t v29 = NumberOfComponents << 32;
      CFIndex v30 = (int)NumberOfComponents;
      if (NumberOfComponents << 32)
      {
        CGFloat v31 = CFStringCreateMutable(0, 0);
        CFIndex numValues = (CFIndex)v26;
        CFIndex v32 = v30 - 1;
        if ((unint64_t)v30 <= 1) {
          uint64_t v33 = 1;
        }
        else {
          uint64_t v33 = v30;
        }
        do
        {
          CFStringAppend(v31, @"CGf");
          if (v32) {
            CFStringAppend(v31, @", ");
          }
          --v32;
          --v33;
        }
        while (v33);
        id v26 = (id)numValues;
      }
      else
      {
        CGFloat v31 = &stru_26BEEFD10;
      }
      Components = CGColorGetComponents(v27);
      double v38 = (const void **)malloc_type_malloc(v29 >> 29, 0x6004044C4A2DFuLL);
      double v39 = v38;
      if (v29 >= 1)
      {
        if (v30 <= 1) {
          uint64_t v40 = 1;
        }
        else {
          uint64_t v40 = v30;
        }
        double v41 = (CFNumberRef *)v38;
        do
        {
          *v41++ = CFNumberCreate(0, kCFNumberCGFloatType, Components++);
          --v40;
        }
        while (v40);
      }
      CFArrayRef v42 = CFArrayCreate(0, v39, v30, MEMORY[0x263EFFF70]);
      if (v29 >= 1)
      {
        if (v30 <= 1) {
          uint64_t v43 = 1;
        }
        else {
          uint64_t v43 = v30;
        }
        id v44 = v39;
        do
        {
          CFRelease(*v44++);
          --v43;
        }
        while (v43);
      }
      free(v39);
      CGColorSpaceGetModel(space);
      if (v42) {
        CFDictionaryAddValue(Mutable, @"componentValues", v42);
      }
      if (v31) {
        CFDictionaryAddValue(Mutable, @"componentValuesFormat", v31);
      }
      if (value) {
        CFDictionaryAddValue(Mutable, @"colorSpaceName", value);
      }
      if (v42) {
        CFRelease(v42);
      }
      if (value) {
        CFRelease(value);
      }
      if (v31) {
        CFRelease(v31);
      }
    }
    else
    {
      Mutable = 0;
    }

    goto LABEL_77;
  }
  if ([v9 isEqualToString:@"visualRepresentation"])
  {
    CGFloat v34 = [v87 texture];
    if (v34)
    {

LABEL_57:
      Mutable = [v87 createDebugHierarchyVisualRepresentation];
      v91[0] = @"propertyRuntimeType";
      v91[1] = @"propertyFormat";
      uint64_t v46 = *MEMORY[0x263F01AE0];
      v92[0] = @"SKTexture";
      v92[1] = v46;
      v91[2] = @"propertyLogicalType";
      v92[2] = @"DebugHierarchyLogicalPropertyTypeImage";
      *a5 = [NSDictionary dictionaryWithObjects:v92 forKeys:v91 count:3];
      goto LABEL_77;
    }
    v45 = [v87 shader];

    if (v45) {
      goto LABEL_57;
    }
    id v63 = [v87 color];
    v64 = (CGColor *)[v63 CGColor];
    if (v64)
    {
      v65 = CFDictionaryCreateMutable(0, 20, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
      ColorSpace = CGColorGetColorSpace(v64);
      CFStringRef valueb = CGColorSpaceCopyName(ColorSpace);
      size_t v66 = CGColorGetNumberOfComponents(v64);
      uint64_t numValuesa = (int)v66;
      int64_t spacea = v66 << 32;
      if (v66 << 32)
      {
        v67 = CFStringCreateMutable(0, 0);
        id v78 = v63;
        uint64_t v68 = numValuesa - 1;
        if ((unint64_t)numValuesa <= 1) {
          uint64_t v69 = 1;
        }
        else {
          uint64_t v69 = numValuesa;
        }
        do
        {
          CFStringAppend(v67, @"CGf");
          if (v68) {
            CFStringAppend(v67, @", ");
          }
          --v68;
          --v69;
        }
        while (v69);
        id v63 = v78;
      }
      else
      {
        v67 = &stru_26BEEFD10;
      }
      v70 = CGColorGetComponents(v64);
      v71 = (const void **)malloc_type_malloc(spacea >> 29, 0x6004044C4A2DFuLL);
      v72 = v71;
      if (spacea >= 1)
      {
        if (numValuesa <= 1) {
          uint64_t v73 = 1;
        }
        else {
          uint64_t v73 = numValuesa;
        }
        v74 = (CFNumberRef *)v71;
        do
        {
          *v74++ = CFNumberCreate(0, kCFNumberCGFloatType, v70++);
          --v73;
        }
        while (v73);
      }
      CFArrayRef v75 = CFArrayCreate(0, v72, numValuesa, MEMORY[0x263EFFF70]);
      if (spacea >= 1)
      {
        if (numValuesa <= 1) {
          uint64_t v76 = 1;
        }
        else {
          uint64_t v76 = numValuesa;
        }
        v77 = v72;
        do
        {
          CFRelease(*v77++);
          --v76;
        }
        while (v76);
      }
      free(v72);
      CGColorSpaceGetModel(ColorSpace);
      if (v75) {
        CFDictionaryAddValue(v65, @"componentValues", v75);
      }
      if (v67) {
        CFDictionaryAddValue(v65, @"componentValuesFormat", v67);
      }
      if (valueb) {
        CFDictionaryAddValue(v65, @"colorSpaceName", valueb);
      }
      if (v75) {
        CFRelease(v75);
      }
      if (valueb) {
        CFRelease(valueb);
      }
      if (v67) {
        CFRelease(v67);
      }
    }
    else
    {
      v65 = 0;
    }

    v89[0] = @"propertyRuntimeType";
    v89[1] = @"propertyFormat";
    v90[0] = @"CGColorRef";
    v90[1] = @"color";
    v89[2] = @"propertyLogicalType";
    v90[2] = @"DebugHierarchyLogicalPropertyTypeColor";
    *a5 = [NSDictionary dictionaryWithObjects:v90 forKeys:v89 count:3];
    Mutable = v65;
  }
  else
  {
    id valuea = v87;
    id v35 = v9;
    if (![v35 length]) {
      goto LABEL_67;
    }
    NSSelectorFromString((NSString *)v35);
    if (objc_opt_respondsToSelector())
    {
      CGFloat v36 = (NSString *)v35;
    }
    else
    {
      if ((unint64_t)[v35 length] < 2)
      {
        CGRect v50 = [v35 uppercaseString];
      }
      else
      {
        v47 = [v35 substringToIndex:1];
        objc_super v48 = [v47 uppercaseString];
        CGRect v49 = [v35 substringFromIndex:1];
        CGRect v50 = [v48 stringByAppendingString:v49];
      }
      v51 = [@"is" stringByAppendingString:v50];
      NSSelectorFromString(v51);
      CGFloat v36 = (objc_opt_respondsToSelector() & 1) != 0 ? v51 : 0;
    }
    if (v36)
    {
      Mutable = [valuea valueForKey:v36];
    }
    else
    {
LABEL_67:
      if (a6)
      {
        id v52 = valuea;
        v53 = (__CFString *)v35;
        if (v52)
        {
          id v54 = v52;
          v55 = [NSString stringWithFormat:@"%@", v52];
        }
        else
        {
          id v54 = 0;
          v55 = &stru_26BEEFD10;
        }
        if (v53) {
          v56 = v53;
        }
        else {
          v56 = &stru_26BEEFD10;
        }
        v57 = v56;
        values[0] = @"propertyName";
        values[1] = @"objectDescription";
        values[2] = @"errorDescription";
        keys[0] = v57;
        keys[1] = v55;
        keys[2] = &stru_26BEEFD10;
        v58 = [NSDictionary dictionaryWithObjects:keys forKeys:values count:3];
        v59 = v54;
        v60 = [MEMORY[0x263F087E8] errorWithDomain:@"DebugHierarchyErrorDomain" code:100 userInfo:v58];

        id v61 = v60;
        *a6 = v61;
      }
      CGFloat v36 = 0;
      Mutable = 0;
    }
  }
LABEL_77:

  return Mutable;
}

- (BOOL)shouldRepeatTexture
{
  return self->_shouldRepeatTexture;
}

- (void)setShouldRepeatTexture:(BOOL)a3
{
  self->_shouldRepeatTexture = a3;
}

- (void).cxx_destruct
{
}

@end