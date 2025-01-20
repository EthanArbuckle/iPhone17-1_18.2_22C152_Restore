@interface SKTileMapNode
+ (BOOL)supportsSecureCoding;
+ (SKTileMapNode)tileMapNodeWithTileSet:(SKTileSet *)tileSet columns:(NSUInteger)columns rows:(NSUInteger)rows tileSize:(CGSize)tileSize;
+ (SKTileMapNode)tileMapNodeWithTileSet:(SKTileSet *)tileSet columns:(NSUInteger)columns rows:(NSUInteger)rows tileSize:(CGSize)tileSize fillWithTileGroup:(SKTileGroup *)tileGroup;
+ (SKTileMapNode)tileMapNodeWithTileSet:(SKTileSet *)tileSet columns:(NSUInteger)columns rows:(NSUInteger)rows tileSize:(CGSize)tileSize tileGroupLayout:(NSArray *)tileGroupLayout;
+ (id)debugHierarchyPropertyDescriptions;
+ (id)debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)Mutable;
- (BOOL)enableAutomapping;
- (BOOL)isEqualToNode:(id)a3;
- (BOOL)shouldUnarchiveTileSet;
- (CGFloat)colorBlendFactor;
- (CGPoint)anchorPoint;
- (CGPoint)centerOfTileAtColumn:(NSUInteger)column row:(NSUInteger)row;
- (CGSize)mapSize;
- (CGSize)tileSize;
- (NSString)tileSetName;
- (NSUInteger)numberOfColumns;
- (NSUInteger)numberOfRows;
- (NSUInteger)tileColumnIndexFromPosition:(CGPoint)position;
- (NSUInteger)tileRowIndexFromPosition:(CGPoint)position;
- (SKAttributeValue)valueForAttributeNamed:(NSString *)key;
- (SKBlendMode)blendMode;
- (SKShader)shader;
- (SKTileDefinition)tileDefinitionAtColumn:(NSUInteger)column row:(NSUInteger)row;
- (SKTileGroup)tileGroupAtColumn:(NSUInteger)column row:(NSUInteger)row;
- (SKTileMapNode)init;
- (SKTileMapNode)initWithCoder:(id)a3;
- (SKTileMapNode)initWithTileSet:(SKTileSet *)tileSet columns:(NSUInteger)columns rows:(NSUInteger)rows tileSize:(CGSize)tileSize;
- (SKTileMapNode)initWithTileSet:(SKTileSet *)tileSet columns:(NSUInteger)columns rows:(NSUInteger)rows tileSize:(CGSize)tileSize fillWithTileGroup:(SKTileGroup *)tileGroup;
- (SKTileMapNode)initWithTileSet:(SKTileSet *)tileSet columns:(NSUInteger)columns rows:(NSUInteger)rows tileSize:(CGSize)tileSize tileGroupLayout:(NSArray *)tileGroupLayout;
- (SKTileSet)tileSet;
- (UIColor)color;
- (double)alpha;
- (id)copy;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createTileStampFromColumn:(unint64_t)a3 row:(unint64_t)a4 withWidth:(unint64_t)a5 height:(unint64_t)a6 addToTileSet:(BOOL)a7;
- (id)tileDefinitionForTileID:(unsigned int)a3;
- (uint32_t)lightingBitMask;
- (unsigned)getTileIDWithTileGroup:(id)a3 andTileDefinition:(id)a4;
- (void)_didMakeBackingNode;
- (void)_makeBackingNode;
- (void)applyTileStamp:(id)a3 inColumn:(int64_t)a4 row:(int64_t)a5;
- (void)calculateSize;
- (void)clearModifiedTileTracking;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)fillArray:(unsigned int *)a3 withTilesFromColumn:(unint64_t)a4 row:(unint64_t)a5 forWidth:(unint64_t)a6 height:(unint64_t)a7;
- (void)fillArrayWithTiles:(unsigned int *)a3;
- (void)fillWithTileDefinition:(id)a3;
- (void)fillWithTileGroup:(SKTileGroup *)tileGroup;
- (void)forceRedraw;
- (void)getTileModifiedData:(int64_t *)a3 outMinRowModified:(int64_t *)a4 outMaxColumnModified:(int64_t *)a5 outmaxRowModified:(int64_t *)a6;
- (void)rebuildTileSprites;
- (void)removeAllTiles;
- (void)setAlpha:(double)a3;
- (void)setAnchorPoint:(CGPoint)anchorPoint;
- (void)setBlendMode:(SKBlendMode)blendMode;
- (void)setColor:(UIColor *)color;
- (void)setColorBlendFactor:(CGFloat)colorBlendFactor;
- (void)setColumns:(unint64_t)a3 andRows:(int64_t)a4;
- (void)setEnableAutomapping:(BOOL)enableAutomapping;
- (void)setLightingBitMask:(uint32_t)lightingBitMask;
- (void)setNumberOfColumns:(NSUInteger)numberOfColumns;
- (void)setNumberOfRows:(NSUInteger)numberOfRows;
- (void)setRawTiles:(unsigned int *)a3 rows:(unint64_t)a4 columns:(unint64_t)a5;
- (void)setShader:(SKShader *)shader;
- (void)setStartData:(unint64_t)a3 rows:(unint64_t)a4 tileSize:(CGSize)a5 tileSet:(id)a6;
- (void)setTileGroup:(SKTileGroup *)tileGroup andTileDefinition:(SKTileDefinition *)tileDefinition forColumn:(NSUInteger)column row:(NSUInteger)row;
- (void)setTileGroup:(SKTileGroup *)tileGroup forColumn:(NSUInteger)column row:(NSUInteger)row;
- (void)setTileGroup:(id)a3 andTileDefinition:(id)a4 forTileIndicies:(id)a5;
- (void)setTileGroup:(id)a3 forTileIndicies:(id)a4;
- (void)setTileGroupWithoutUpdate:(id)a3 forColumn:(unint64_t)a4 row:(unint64_t)a5;
- (void)setTileGroupWithoutUpdate:(id)a3 tileDefinition:(id)a4 forColumn:(unint64_t)a5 row:(unint64_t)a6;
- (void)setTileSet:(SKTileSet *)tileSet;
- (void)setTileSetName:(id)a3;
- (void)setTileSize:(CGSize)tileSize;
- (void)setTilesFromArray:(unsigned int *)a3;
- (void)setTilesFromArray:(unsigned int *)a3 fromColumn:(unint64_t)a4 row:(unint64_t)a5 forWidth:(unint64_t)a6 height:(unint64_t)a7;
- (void)setValue:(SKAttributeValue *)value forAttributeNamed:(NSString *)key;
- (void)updateTileDefinitionWithoutAutomappingAtX:(unint64_t)a3 y:(unint64_t)a4;
- (void)updateTileGroupsAtX:(unint64_t)a3 y:(unint64_t)a4;
- (void)validateAllTiles;
@end

@implementation SKTileMapNode

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSUInteger)numberOfColumns
{
  return *((unsigned int *)self->_skcTileMapNode + 151);
}

- (void)setNumberOfColumns:(NSUInteger)numberOfColumns
{
  NSUInteger v5 = [(SKTileMapNode *)self numberOfRows];

  [(SKTileMapNode *)self setColumns:numberOfColumns andRows:v5];
}

- (NSUInteger)numberOfRows
{
  return *((unsigned int *)self->_skcTileMapNode + 152);
}

- (void)setNumberOfRows:(NSUInteger)numberOfRows
{
  NSUInteger v5 = [(SKTileMapNode *)self numberOfColumns];

  [(SKTileMapNode *)self setColumns:v5 andRows:numberOfRows];
}

- (CGSize)tileSize
{
  double width = self->_tileSize.width;
  double height = self->_tileSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setTileSize:(CGSize)tileSize
{
  self->_tileSize = tileSize;
  [(SKTileMapNode *)self calculateSize];
  skcTileMapNode = (SKCTileMapNode **)self->_skcTileMapNode;

  SKCTileMapNode::forceRedraw(skcTileMapNode, 0);
}

- (CGSize)mapSize
{
  float64x2_t v2 = vcvtq_f64_f32(*(float32x2_t *)((char *)self->_skcTileMapNode + 336));
  double v3 = v2.f64[1];
  result.double width = v2.f64[0];
  result.double height = v3;
  return result;
}

- (SKTileSet)tileSet
{
  return self->_tileSet;
}

- (void)setTileSet:(SKTileSet *)tileSet
{
  p_tileSet = &self->_tileSet;
  v8 = tileSet;
  if (*p_tileSet != v8)
  {
    objc_storeStrong((id *)&self->_tileSet, tileSet);
    SKCTileMapNode::setTileSetType((uint64_t)self->_skcTileMapNode, [(SKTileSet *)v8 type]);
    if (*p_tileSet)
    {
      [(SKTileSet *)*p_tileSet defaultTileSize];
    }
    else
    {
      double v6 = *MEMORY[0x263F001B0];
      double v7 = *(double *)(MEMORY[0x263F001B0] + 8);
    }
    -[SKTileMapNode setTileSize:](self, "setTileSize:", v6, v7);
    [(SKTileMapNode *)self calculateSize];
    [(SKTileMapNode *)self rebuildTileSprites];
    SKCTileMapNode::forceRedraw((SKCTileMapNode **)self->_skcTileMapNode, 1);
  }
}

- (CGFloat)colorBlendFactor
{
  return *((float *)self->_skcTileMapNode + 80);
}

- (void)setColorBlendFactor:(CGFloat)colorBlendFactor
{
  skcTileMapNode = self->_skcTileMapNode;
  float v4 = colorBlendFactor;
  float v5 = fminf(fmaxf(v4, 0.0), 1.0);
  (*(void (**)(void *, float *))(*(void *)skcTileMapNode + 192))(skcTileMapNode, &v5);
}

- (UIColor)color
{
  skcTileMapNode = self->_skcTileMapNode;
  LODWORD(v2) = skcTileMapNode[76];
  LODWORD(v3) = skcTileMapNode[77];
  LODWORD(v4) = skcTileMapNode[78];
  LODWORD(v5) = skcTileMapNode[79];
  return (UIColor *)objc_msgSend(MEMORY[0x263F1C550], "colorWithComponentRGBA:", v2, v3, v4, v5);
}

- (void)setColor:(UIColor *)color
{
  double v4 = color;
  [(UIColor *)v4 componentRGBA];
  skcTileMapNode = self->_skcTileMapNode;
  DWORD1(v7) = v6;
  *((void *)&v7 + 1) = __PAIR64__(v9, v8);
  long long v10 = v7;
  (*(void (**)(void *, long long *))(*(void *)skcTileMapNode + 184))(skcTileMapNode, &v10);
}

- (SKBlendMode)blendMode
{
  return *((void *)self->_skcTileMapNode + 36);
}

- (void)setBlendMode:(SKBlendMode)blendMode
{
}

- (CGPoint)anchorPoint
{
  float64x2_t v2 = vcvtq_f64_f32(*(float32x2_t *)((char *)self->_skcTileMapNode + 352));
  double v3 = v2.f64[1];
  result.x = v2.f64[0];
  result.y = v3;
  return result;
}

- (void)setAnchorPoint:(CGPoint)anchorPoint
{
  *(float *)&unsigned int v4 = anchorPoint.x;
  *(float *)&unsigned int v5 = anchorPoint.y;
  long long v6 = __PAIR64__(v5, v4);
  SKCNode::setAnchor((SKCNode *)self->_skcTileMapNode, &v6);
  SKCTileMapNode::forceRedraw((SKCTileMapNode **)self->_skcTileMapNode, 0);
}

- (SKShader)shader
{
  return (SKShader *)*((id *)self->_skcTileMapNode + 71);
}

- (void)setShader:(SKShader *)shader
{
  unsigned int v4 = shader;
  [*((id *)self->_skcTileMapNode + 71) _removeTargetNode:self];
  SKCTileMapNode::setShader((id *)self->_skcTileMapNode, v4);
  [(SKShader *)v4 _addTargetNode:self];
}

- (void)setLightingBitMask:(uint32_t)lightingBitMask
{
  *((_DWORD *)self->_skcTileMapNode + 140) = lightingBitMask;
}

- (uint32_t)lightingBitMask
{
  return *((_DWORD *)self->_skcTileMapNode + 140);
}

- (void)_makeBackingNode
{
}

- (void)_didMakeBackingNode
{
  v3.receiver = self;
  v3.super_class = (Class)SKTileMapNode;
  [(SKNode *)&v3 _didMakeBackingNode];
  self->_skcTileMapNode = [(SKNode *)self _backingNode];
}

- (BOOL)enableAutomapping
{
  return self->_enableAutomapping;
}

- (void)setEnableAutomapping:(BOOL)enableAutomapping
{
  if (self->_enableAutomapping != enableAutomapping)
  {
    self->_enableAutomapping = enableAutomapping;
    if (enableAutomapping) {
      [(SKTileMapNode *)self rebuildTileSprites];
    }
  }
}

- (double)alpha
{
  return *((float *)self->_skcTileMapNode + 81);
}

- (void)setAlpha:(double)a3
{
  skcTileMapNode = (SKCNode *)self->_skcTileMapNode;
  float v5 = a3;
  float v6 = v5;
  SKCNode::setAlpha(skcTileMapNode, &v6);
  SKCTileMapNode::forceRedraw((SKCTileMapNode **)self->_skcTileMapNode, 0);
}

- (SKTileMapNode)initWithCoder:(id)a3
{
  id v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)SKTileMapNode;
  float v5 = [(SKNode *)&v41 initWithCoder:v4];
  float v6 = v5;
  if (v5)
  {
    [(SKTileMapNode *)v5 commonInit];
    uint64_t v7 = [v4 decodeIntegerForKey:@"_currentColumns"];
    uint64_t v8 = [v4 decodeIntegerForKey:@"_currentRows"];
    [v4 decodeDoubleForKey:@"_tileWidth"];
    v6->_tileSize.double width = v9;
    [v4 decodeDoubleForKey:@"_tileHeight"];
    v6->_tileSize.double height = v10;
    if ([(SKTileMapNode *)v6 shouldUnarchiveTileSet])
    {
      v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_tileSetName"];
      [(SKTileMapNode *)v6 setTileSetName:v11];

      v12 = [(SKTileMapNode *)v6 tileSetName];

      if (v12)
      {
        v13 = [(SKTileMapNode *)v6 tileSetName];
        uint64_t v14 = +[SKTileSet tileSetNamed:v13];
        tileSet = v6->_tileSet;
        v6->_tileSet = (SKTileSet *)v14;
      }
      v16 = v6->_tileSet;
      if (!v16)
      {
        uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_tileSet"];
        v18 = v6->_tileSet;
        v6->_tileSet = (SKTileSet *)v17;

        v16 = v6->_tileSet;
      }
      SKCTileMapNode::setTileSetType((uint64_t)v6->_skcTileMapNode, [(SKTileSet *)v16 type]);
    }
    v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_baseColorR"];
    [v19 doubleValue];
    double v21 = v20;
    v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_baseColorG"];
    [v22 doubleValue];
    double v24 = v23;
    v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_baseColorB"];
    [v25 doubleValue];
    double v27 = v26;
    v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_baseColorA"];
    [v28 doubleValue];
    float v30 = v29;

    *(float *)&double v21 = v21;
    LODWORD(v31) = LODWORD(v21);
    *(float *)&double v24 = v24;
    LODWORD(v32) = LODWORD(v24);
    *(float *)&double v27 = v27;
    LODWORD(v33) = LODWORD(v27);
    *(float *)&double v34 = v30;
    v35 = objc_msgSend(MEMORY[0x263F1C550], "colorWithComponentRGBA:", v31, v32, v33, v34);
    [(SKTileMapNode *)v6 setColor:v35];

    [v4 decodeDoubleForKey:@"_colorBlendFactor"];
    -[SKTileMapNode setColorBlendFactor:](v6, "setColorBlendFactor:");
    v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_blendMode"];
    -[SKTileMapNode setBlendMode:](v6, "setBlendMode:", (int)[v36 intValue]);

    v37 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_shader"];
    [(SKTileMapNode *)v6 setShader:v37];

    -[SKTileMapNode setLightingBitMask:](v6, "setLightingBitMask:", [v4 decodeInt32ForKey:@"_lightingBitMask"]);
    v6->_enableAutomapping = [v4 decodeBoolForKey:@"_enableAutomapping"];
    uint64_t v40 = 0;
    v38 = (const unsigned int *)[v4 decodeBytesForKey:@"_rawTiles" returnedLength:&v40];
    [(SKTileMapNode *)v6 calculateSize];
    [(SKTileMapNode *)v6 setColumns:v7 andRows:v8];
    if (v40 == 4 * v7 * v8) {
      SKCTileMapNode::setRawTiles((SKCTileMapNode *)v6->_skcTileMapNode, v38, v7, v8);
    }
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SKTileMapNode;
  [(SKNode *)&v20 encodeWithCoder:v4];
  NSUInteger v5 = [(SKTileMapNode *)self numberOfColumns];
  NSUInteger v6 = [(SKTileMapNode *)self numberOfRows];
  [v4 encodeInteger:v5 forKey:@"_currentColumns"];
  [v4 encodeInteger:v6 forKey:@"_currentRows"];
  [v4 encodeDouble:@"_tileWidth" forKey:self->_tileSize.width];
  [v4 encodeDouble:@"_tileHeight" forKey:self->_tileSize.height];
  uint64_t v7 = [(SKTileMapNode *)self tileSetName];
  [v4 encodeObject:v7 forKey:@"_tileSetName"];

  [v4 encodeObject:self->_tileSet forKey:@"_tileSet"];
  long long v19 = *((_OWORD *)self->_skcTileMapNode + 19);
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithDouble:", *(float *)&v19, (void)v19);
  [v4 encodeObject:v8 forKey:@"_baseColorR"];

  CGFloat v9 = [NSNumber numberWithDouble:*((float *)&v19 + 1)];
  [v4 encodeObject:v9 forKey:@"_baseColorG"];

  CGFloat v10 = [NSNumber numberWithDouble:*((float *)&v19 + 2)];
  [v4 encodeObject:v10 forKey:@"_baseColorB"];

  v11 = [NSNumber numberWithDouble:*((float *)&v19 + 3)];
  [v4 encodeObject:v11 forKey:@"_baseColorA"];

  v12 = NSNumber;
  [(SKTileMapNode *)self colorBlendFactor];
  v13 = objc_msgSend(v12, "numberWithDouble:");
  [v4 encodeObject:v13 forKey:@"_colorMix"];

  uint64_t v14 = objc_msgSend(NSNumber, "numberWithLong:", -[SKTileMapNode blendMode](self, "blendMode"));
  [v4 encodeObject:v14 forKey:@"_blendMode"];

  v15 = [(SKTileMapNode *)self shader];
  [v4 encodeObject:v15 forKey:@"_shader"];

  objc_msgSend(v4, "encodeInt32:forKey:", -[SKTileMapNode lightingBitMask](self, "lightingBitMask"), @"_lightingBitMask");
  [v4 encodeBool:self->_enableAutomapping forKey:@"_enableAutomapping"];
  v16 = (void *)MEMORY[0x263F08D40];
  [(SKTileMapNode *)self anchorPoint];
  uint64_t v17 = objc_msgSend(v16, "valueWithCGPoint:");
  [v4 encodeObject:v17 forKey:@"_anchorPoint"];

  RawTilesCopy = SKCTileMapNode::getRawTilesCopy((SKCTileMapNode *)self->_skcTileMapNode);
  [v4 encodeBytes:RawTilesCopy length:4 * v5 * v6 forKey:@"_rawTiles"];
  if (RawTilesCopy) {
    free(RawTilesCopy);
  }
}

- (BOOL)isEqualToNode:(id)a3
{
  id v4 = (SKTileMapNode *)a3;
  if (v4 == self)
  {
    char v31 = 1;
    goto LABEL_30;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v31 = 0;
    goto LABEL_30;
  }
  NSUInteger v5 = v4;
  v36.receiver = self;
  v36.super_class = (Class)SKTileMapNode;
  if (![(SKNode *)&v36 isEqualToNode:v5]) {
    goto LABEL_26;
  }
  NSUInteger v6 = [(SKTileMapNode *)self numberOfColumns];
  if (v6 != [(SKTileMapNode *)v5 numberOfColumns]) {
    goto LABEL_26;
  }
  NSUInteger v7 = [(SKTileMapNode *)self numberOfRows];
  if (v7 != [(SKTileMapNode *)v5 numberOfRows]) {
    goto LABEL_26;
  }
  double width = self->_tileSize.width;
  if (width != v5->_tileSize.width || width != v5->_tileSize.height) {
    goto LABEL_26;
  }
  tileSetName = self->_tileSetName;
  if (!tileSetName)
  {
    CGFloat v10 = [(SKTileMapNode *)v5 tileSetName];

    if (!v10) {
      goto LABEL_12;
    }
    tileSetName = self->_tileSetName;
  }
  v11 = [(SKTileMapNode *)v5 tileSetName];
  BOOL v12 = [(NSString *)tileSetName isEqualToString:v11];

  if (!v12) {
    goto LABEL_26;
  }
LABEL_12:
  tileSet = self->_tileSet;
  if (tileSet) {
    goto LABEL_15;
  }
  uint64_t v14 = [(SKTileMapNode *)v5 tileSet];

  if (v14)
  {
    tileSet = self->_tileSet;
LABEL_15:
    v15 = [(SKTileMapNode *)v5 tileSet];
    BOOL v16 = [(SKTileSet *)tileSet isEqualToNode:v15];

    if (!v16) {
      goto LABEL_26;
    }
  }
  float32x4_t v17 = vsubq_f32(*((float32x4_t *)self->_skcTileMapNode + 19), *((float32x4_t *)v5->_skcTileMapNode + 19));
  if ((v17.i32[0] & 0x60000000) != 0
    && (v17.i32[1] & 0x60000000) != 0
    && (v17.i32[2] & 0x60000000) != 0
    && (v17.i32[3] & 0x60000000) != 0)
  {
    [(SKTileMapNode *)self colorBlendFactor];
    double v19 = v18;
    [(SKTileMapNode *)v5 colorBlendFactor];
    float v20 = v19;
    *(float *)&double v21 = v21;
    if ((COERCE_UNSIGNED_INT(v20 - *(float *)&v21) & 0x60000000) != 0)
    {
      SKBlendMode v22 = [(SKTileMapNode *)self blendMode];
      if (v22 == [(SKTileMapNode *)v5 blendMode])
      {
        BOOL v23 = [(SKTileMapNode *)self enableAutomapping];
        if (v23 == [(SKTileMapNode *)v5 enableAutomapping])
        {
          uint32_t v24 = [(SKTileMapNode *)self lightingBitMask];
          if (v24 == [(SKTileMapNode *)v5 lightingBitMask])
          {
            [(SKTileMapNode *)self anchorPoint];
            double v26 = v25;
            double v28 = v27;
            [(SKTileMapNode *)v5 anchorPoint];
            if (v26 != v30 || v28 != v29)
            {
              double v33 = [(SKTileMapNode *)self shader];
              double v34 = [(SKTileMapNode *)v5 shader];
              char v35 = [v33 isEqualToShader:v34];

              char v31 = v35 ^ 1;
              goto LABEL_27;
            }
          }
        }
      }
    }
  }
LABEL_26:
  char v31 = 0;
LABEL_27:

LABEL_30:
  return v31;
}

- (void)setRawTiles:(unsigned int *)a3 rows:(unint64_t)a4 columns:(unint64_t)a5
{
}

- (id)copy
{
  uint64_t v3 = MEMORY[0x21052E6F0](self, a2);

  return [(SKTileMapNode *)self copyWithZone:v3];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SKTileMapNode;
  id v4 = [(SKNode *)&v7 copyWithZone:a3];
  RawTilesCopy = SKCTileMapNode::getRawTilesCopy((SKCTileMapNode *)self->_skcTileMapNode);
  SKCTileMapNode::setRawTiles(v4[18], RawTilesCopy, [(SKTileMapNode *)self numberOfColumns], [(SKTileMapNode *)self numberOfRows]);
  if (RawTilesCopy) {
    free(RawTilesCopy);
  }
  return v4;
}

- (void)setStartData:(unint64_t)a3 rows:(unint64_t)a4 tileSize:(CGSize)a5 tileSet:(id)a6
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  id v12 = a6;
  objc_storeStrong((id *)&self->_tileSet, a6);
  SKCTileMapNode::setTileSetType((uint64_t)self->_skcTileMapNode, (SKTileSetType)[v12 type]);
  self->_tileSize.CGFloat width = width;
  self->_tileSize.CGFloat height = height;
  self->_enableAutomapping = 1;
  [(SKNode *)self setName:@"Default Tile Map"];
  [(SKTileMapNode *)self setLightingBitMask:0];
  [(SKTileMapNode *)self calculateSize];
  [(SKTileMapNode *)self setColumns:a3 andRows:a4];
}

- (SKTileMapNode)init
{
  v5.receiver = self;
  v5.super_class = (Class)SKTileMapNode;
  float64x2_t v2 = [(SKNode *)&v5 init];
  uint64_t v3 = v2;
  if (v2)
  {
    [(SKTileMapNode *)v2 commonInit];
    -[SKTileMapNode setStartData:rows:tileSize:tileSet:](v3, "setStartData:rows:tileSize:tileSet:", 0, 0, 0, *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
  }
  return v3;
}

- (SKTileMapNode)initWithTileSet:(SKTileSet *)tileSet columns:(NSUInteger)columns rows:(NSUInteger)rows tileSize:(CGSize)tileSize
{
  double height = tileSize.height;
  double width = tileSize.width;
  v11 = tileSet;
  v15.receiver = self;
  v15.super_class = (Class)SKTileMapNode;
  id v12 = [(SKNode *)&v15 init];
  v13 = v12;
  if (v12)
  {
    [(SKTileMapNode *)v12 commonInit];
    -[SKTileMapNode setStartData:rows:tileSize:tileSet:](v13, "setStartData:rows:tileSize:tileSet:", columns, rows, v11, width, height);
  }

  return v13;
}

- (SKTileMapNode)initWithTileSet:(SKTileSet *)tileSet columns:(NSUInteger)columns rows:(NSUInteger)rows tileSize:(CGSize)tileSize fillWithTileGroup:(SKTileGroup *)tileGroup
{
  double height = tileSize.height;
  double width = tileSize.width;
  v13 = tileSet;
  uint64_t v14 = tileGroup;
  v18.receiver = self;
  v18.super_class = (Class)SKTileMapNode;
  objc_super v15 = [(SKNode *)&v18 init];
  BOOL v16 = v15;
  if (v15)
  {
    [(SKTileMapNode *)v15 commonInit];
    -[SKTileMapNode setStartData:rows:tileSize:tileSet:](v16, "setStartData:rows:tileSize:tileSet:", columns, rows, v13, width, height);
    [(SKTileMapNode *)v16 fillWithTileGroup:v14];
  }

  return v16;
}

- (SKTileMapNode)initWithTileSet:(SKTileSet *)tileSet columns:(NSUInteger)columns rows:(NSUInteger)rows tileSize:(CGSize)tileSize tileGroupLayout:(NSArray *)tileGroupLayout
{
  double height = tileSize.height;
  double width = tileSize.width;
  v13 = tileSet;
  uint64_t v14 = tileGroupLayout;
  v29.receiver = self;
  v29.super_class = (Class)SKTileMapNode;
  objc_super v15 = [(SKNode *)&v29 init];
  BOOL v16 = v15;
  if (v15)
  {
    [(SKTileMapNode *)v15 commonInit];
    -[SKTileMapNode setStartData:rows:tileSize:tileSet:](v16, "setStartData:rows:tileSize:tileSet:", columns, rows, v13, width, height);
    double v28 = v13;
    uint64_t v17 = (rows * columns);
    if (v17)
    {
      for (unint64_t i = 0; i != v17; ++i)
      {
        if ([(NSArray *)v14 count] <= i)
        {
          __int16 v26 = 0x7FFF;
        }
        else
        {
          double v19 = [(SKTileMapNode *)v16 tileSet];
          float v20 = [v19 tileGroups];
          double v21 = [(NSArray *)v14 objectAtIndexedSubscript:i];
          unint64_t v22 = [v20 indexOfObject:v21];

          BOOL v23 = [(SKTileMapNode *)v16 tileSet];
          uint32_t v24 = [v23 tileGroups];
          unint64_t v25 = [v24 count];

          if (v22 >= v25) {
            __int16 v26 = 0x7FFF;
          }
          else {
            __int16 v26 = v22;
          }
        }
        SKCTileMapNode::setTile((SKCTileMapNode *)v16->_skcTileMapNode, i, ((v26 & 0x7FFF) << 16) | 0xFFFF);
      }
    }
    v13 = v28;
    [(SKTileMapNode *)v16 rebuildTileSprites];
  }

  return v16;
}

+ (SKTileMapNode)tileMapNodeWithTileSet:(SKTileSet *)tileSet columns:(NSUInteger)columns rows:(NSUInteger)rows tileSize:(CGSize)tileSize
{
  double height = tileSize.height;
  double width = tileSize.width;
  CGFloat v10 = tileSet;
  v11 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithTileSet:columns:rows:tileSize:", v10, columns, rows, width, height);

  return (SKTileMapNode *)v11;
}

+ (SKTileMapNode)tileMapNodeWithTileSet:(SKTileSet *)tileSet columns:(NSUInteger)columns rows:(NSUInteger)rows tileSize:(CGSize)tileSize fillWithTileGroup:(SKTileGroup *)tileGroup
{
  double height = tileSize.height;
  double width = tileSize.width;
  id v12 = tileSet;
  v13 = tileGroup;
  uint64_t v14 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithTileSet:columns:rows:tileSize:fillWithTileGroup:", v12, columns, rows, v13, width, height);

  return (SKTileMapNode *)v14;
}

+ (SKTileMapNode)tileMapNodeWithTileSet:(SKTileSet *)tileSet columns:(NSUInteger)columns rows:(NSUInteger)rows tileSize:(CGSize)tileSize tileGroupLayout:(NSArray *)tileGroupLayout
{
  double height = tileSize.height;
  double width = tileSize.width;
  id v12 = tileSet;
  v13 = tileGroupLayout;
  uint64_t v14 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithTileSet:columns:rows:tileSize:tileGroupLayout:", v12, columns, rows, v13, width, height);

  return (SKTileMapNode *)v14;
}

- (void)dealloc
{
  [(SKTileMapNode *)self removeAllTiles];
  v3.receiver = self;
  v3.super_class = (Class)SKTileMapNode;
  [(SKNode *)&v3 dealloc];
}

- (unsigned)getTileIDWithTileGroup:(id)a3 andTileDefinition:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  tileSet = self->_tileSet;
  if (!tileSet)
  {
    int v12 = 0xFFFF;
    LOWORD(v10) = 0x7FFF;
    goto LABEL_10;
  }
  if (v6)
  {
    CGFloat v9 = [(SKTileSet *)tileSet tileGroups];
    uint64_t v10 = [v9 indexOfObject:v6];

    if (v10 == 0x7FFFFFFFFFFFFFFFLL) {
      LOWORD(v10) = 0x7FFF;
    }
    if (v7) {
      goto LABEL_6;
    }
LABEL_9:
    int v12 = 0xFFFF;
    goto LABEL_10;
  }
  LOWORD(v10) = 0x7FFF;
  if (!v7) {
    goto LABEL_9;
  }
LABEL_6:
  v11 = [(SKTileSet *)self->_tileSet tileDefinitions];
  LOWORD(v12) = [v11 indexOfObject:v7];

  int v12 = (unsigned __int16)v12;
LABEL_10:

  return v12 & 0x8000FFFF | ((v10 & 0x7FFF) << 16);
}

- (void)fillWithTileDefinition:(id)a3
{
  id v13 = a3;
  if (v13
    && (tileSet = self->_tileSet) != 0
    && ([(SKTileSet *)tileSet tileDefinitions],
        objc_super v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    id v6 = [(SKTileSet *)self->_tileSet tileDefinitions];
    unint64_t v7 = [v6 indexOfObject:v13];

    uint64_t v8 = [(SKTileSet *)self->_tileSet tileDefinitions];
    unint64_t v9 = [v8 count];

    if (v7 >= v9) {
      unsigned int v10 = 0x7FFFFFFF;
    }
    else {
      unsigned int v10 = (unsigned __int16)v7 | 0x7FFF0000;
    }
  }
  else
  {
    unsigned int v10 = 0x7FFFFFFF;
  }
  uint64_t v11 = (*((_DWORD *)self->_skcTileMapNode + 152) * *((_DWORD *)self->_skcTileMapNode + 151));
  if (v11)
  {
    for (uint64_t i = 0; i != v11; ++i)
      SKCTileMapNode::setTile((SKCTileMapNode *)self->_skcTileMapNode, i, v10);
  }
  [(SKTileMapNode *)self updateTileGroupsAtX:0 y:0];
}

- (void)fillWithTileGroup:(SKTileGroup *)tileGroup
{
  double v19 = tileGroup;
  if (!v19) {
    goto LABEL_7;
  }
  id v4 = [(SKTileMapNode *)self tileSet];
  if (!v4) {
    goto LABEL_7;
  }
  objc_super v5 = [(SKTileMapNode *)self tileSet];
  id v6 = [v5 tileGroups];

  if (v6)
  {
    unint64_t v7 = [(SKTileMapNode *)self tileSet];
    uint64_t v8 = [v7 tileGroups];
    unint64_t v9 = [v8 indexOfObject:v19];

    unsigned int v10 = [(SKTileSet *)self->_tileSet tileGroups];
    unint64_t v11 = [v10 count];

    if (v9 >= v11) {
      unsigned int v12 = 0x7FFFFFFF;
    }
    else {
      unsigned int v12 = ((v9 & 0x7FFF) << 16) | 0xFFFF;
    }
  }
  else
  {
LABEL_7:
    unsigned int v12 = 0x7FFFFFFF;
  }
  skcTileMapNode = self->_skcTileMapNode;
  int v14 = skcTileMapNode[152];
  int v15 = v14 * skcTileMapNode[151];
  if (v15)
  {
    for (unsigned int i = 0; i != v15; ++i)
      SKCTileMapNode::setTile((SKCTileMapNode *)self->_skcTileMapNode, i, v12);
    skcTileMapNode = self->_skcTileMapNode;
    int v14 = skcTileMapNode[152];
  }
  if (v14)
  {
    unint64_t v17 = 0;
    do
    {
      if (skcTileMapNode[151])
      {
        unint64_t v18 = 0;
        do
        {
          [(SKTileMapNode *)self updateTileDefinitionWithoutAutomappingAtX:v18++ y:v17];
          skcTileMapNode = self->_skcTileMapNode;
        }
        while (v18 < skcTileMapNode[151]);
      }
      ++v17;
    }
    while (v17 < skcTileMapNode[152]);
  }
}

- (SKTileDefinition)tileDefinitionAtColumn:(NSUInteger)column row:(NSUInteger)row
{
  int v5 = column;
  if ([(SKTileMapNode *)self numberOfColumns] <= column) {
    goto LABEL_7;
  }
  if ([(SKTileMapNode *)self numberOfRows] <= row) {
    goto LABEL_7;
  }
  uint64_t v7 = [(SKTileMapNode *)self tileSet];
  if (!v7) {
    goto LABEL_7;
  }
  uint64_t v8 = (void *)v7;
  unint64_t v9 = [(SKTileMapNode *)self tileSet];
  unsigned int v10 = [v9 tileDefinitions];

  if (!v10) {
    goto LABEL_7;
  }
  unsigned __int16 RawTile = SKCTileMapNode::getRawTile((SKCTileMapNode *)self->_skcTileMapNode, v5 + *((_DWORD *)self->_skcTileMapNode + 151) * (int)row);
  unsigned int v12 = [(SKTileMapNode *)self tileSet];
  id v13 = [v12 tileDefinitions];
  unint64_t v14 = [v13 count];

  if (v14 > RawTile)
  {
    int v15 = [(SKTileMapNode *)self tileSet];
    BOOL v16 = [v15 tileDefinitions];
    unint64_t v17 = [v16 objectAtIndex:RawTile];
  }
  else
  {
LABEL_7:
    unint64_t v17 = 0;
  }

  return (SKTileDefinition *)v17;
}

- (SKTileGroup)tileGroupAtColumn:(NSUInteger)column row:(NSUInteger)row
{
  int v5 = column;
  if ([(SKTileMapNode *)self numberOfColumns] <= column) {
    goto LABEL_7;
  }
  if ([(SKTileMapNode *)self numberOfRows] <= row) {
    goto LABEL_7;
  }
  uint64_t v7 = [(SKTileMapNode *)self tileSet];
  if (!v7) {
    goto LABEL_7;
  }
  uint64_t v8 = (void *)v7;
  unint64_t v9 = [(SKTileMapNode *)self tileSet];
  unsigned int v10 = [v9 tileGroups];

  if (!v10) {
    goto LABEL_7;
  }
  unsigned int RawTile = SKCTileMapNode::getRawTile((SKCTileMapNode *)self->_skcTileMapNode, v5 + *((_DWORD *)self->_skcTileMapNode + 151) * (int)row);
  unsigned int v12 = [(SKTileMapNode *)self tileSet];
  id v13 = [v12 tileGroups];
  unint64_t v14 = [v13 count];
  unint64_t v15 = HIWORD(RawTile) & 0x7FFF;

  if (v14 > v15)
  {
    BOOL v16 = [(SKTileMapNode *)self tileSet];
    unint64_t v17 = [v16 tileGroups];
    unint64_t v18 = [v17 objectAtIndex:v15];
  }
  else
  {
LABEL_7:
    unint64_t v18 = 0;
  }

  return (SKTileGroup *)v18;
}

- (void)setTileGroup:(SKTileGroup *)tileGroup forColumn:(NSUInteger)column row:(NSUInteger)row
{
  double v19 = tileGroup;
  if ([(SKTileMapNode *)self numberOfColumns] > column
    && [(SKTileMapNode *)self numberOfRows] > row)
  {
    if (!v19) {
      goto LABEL_9;
    }
    uint64_t v8 = [(SKTileMapNode *)self tileSet];
    if (!v8) {
      goto LABEL_9;
    }
    unint64_t v9 = [(SKTileMapNode *)self tileSet];
    unsigned int v10 = [v9 tileGroups];

    if (v10)
    {
      unint64_t v11 = [(SKTileMapNode *)self tileSet];
      unsigned int v12 = v19;
      id v13 = v11;
      unint64_t v14 = [v13 tileGroups];
      unint64_t v15 = [v14 indexOfObject:v12];

      BOOL v16 = [v13 tileGroups];
      unint64_t v17 = [v16 count];

      if (v15 >= v17) {
        unsigned int v18 = 0x7FFFFFFF;
      }
      else {
        unsigned int v18 = ((v15 & 0x7FFF) << 16) | 0xFFFF;
      }
    }
    else
    {
LABEL_9:
      unsigned int v18 = 0x7FFFFFFF;
    }
    SKCTileMapNode::setTile((SKCTileMapNode *)self->_skcTileMapNode, column + *((_DWORD *)self->_skcTileMapNode + 151) * row, v18);
    [(SKTileMapNode *)self updateTileGroupsAtX:column y:row];
  }
}

- (void)setTileGroup:(SKTileGroup *)tileGroup andTileDefinition:(SKTileDefinition *)tileDefinition forColumn:(NSUInteger)column row:(NSUInteger)row
{
  double v32 = tileGroup;
  unsigned int v10 = tileDefinition;
  if ([(SKTileMapNode *)self numberOfColumns] > column
    && [(SKTileMapNode *)self numberOfRows] > row)
  {
    unint64_t v11 = [(SKTileMapNode *)self tileSet];
    if (v11)
    {
      unsigned int v12 = [(SKTileMapNode *)self tileSet];
      id v13 = [v12 tileGroups];
      if (v13)
      {
        unint64_t v14 = [(SKTileMapNode *)self tileSet];
        unint64_t v15 = [v14 tileDefinitions];

        if (v15)
        {
          if (v32)
          {
            BOOL v16 = [(SKTileMapNode *)self tileSet];
            unint64_t v17 = v32;
            id v18 = v16;
            double v19 = [v18 tileGroups];
            unint64_t v20 = [v19 indexOfObject:v17];

            double v21 = [v18 tileGroups];
            unint64_t v22 = [v21 count];

            if (v20 >= v22) {
              int v23 = 2147418112;
            }
            else {
              int v23 = (v20 & 0x7FFF) << 16;
            }
          }
          else
          {
            int v23 = 2147418112;
          }
          uint32_t v24 = [(SKTileMapNode *)self tileSet];
          unint64_t v25 = v10;
          id v26 = v24;
          double v27 = [v26 tileDefinitions];
          unint64_t v28 = [v27 indexOfObject:v25];

          objc_super v29 = [v26 tileDefinitions];
          unint64_t v30 = [v29 count];

          int v31 = (unsigned __int16)v28;
          if (v28 >= v30) {
            int v31 = 0xFFFF;
          }
          SKCTileMapNode::setTile((SKCTileMapNode *)self->_skcTileMapNode, column + *((_DWORD *)self->_skcTileMapNode + 151) * row, v31 | v23);
          [(SKTileMapNode *)self updateTileGroupsAtX:column y:row];
        }
      }
      else
      {
      }
    }
  }
}

- (void)setTileGroupWithoutUpdate:(id)a3 forColumn:(unint64_t)a4 row:(unint64_t)a5
{
  id v20 = a3;
  if ([(SKTileMapNode *)self numberOfColumns] > a4
    && [(SKTileMapNode *)self numberOfRows] > a5)
  {
    uint64_t v8 = [(SKTileMapNode *)self tileSet];
    if (v8)
    {
      unint64_t v9 = [(SKTileMapNode *)self tileSet];
      unsigned int v10 = [v9 tileGroups];

      if (v10)
      {
        unint64_t v11 = [(SKTileMapNode *)self tileSet];
        id v12 = v20;
        id v13 = v11;
        unint64_t v14 = [v13 tileGroups];
        unint64_t v15 = [v14 indexOfObject:v12];

        BOOL v16 = [v13 tileGroups];
        unint64_t v17 = [v16 count];

        int v18 = [(SKTileMapNode *)self numberOfColumns];
        if (v15 >= v17) {
          unsigned int v19 = 0x7FFFFFFF;
        }
        else {
          unsigned int v19 = ((v15 & 0x7FFF) << 16) | 0xFFFF;
        }
        SKCTileMapNode::setTile((SKCTileMapNode *)self->_skcTileMapNode, a4 + v18 * a5, v19);
      }
    }
  }
}

- (void)setTileGroupWithoutUpdate:(id)a3 tileDefinition:(id)a4 forColumn:(unint64_t)a5 row:(unint64_t)a6
{
  id v33 = a3;
  id v10 = a4;
  if ([(SKTileMapNode *)self numberOfColumns] > a5
    && [(SKTileMapNode *)self numberOfRows] > a6)
  {
    unint64_t v11 = [(SKTileMapNode *)self tileSet];
    if (v11)
    {
      id v12 = [(SKTileMapNode *)self tileSet];
      id v13 = [v12 tileGroups];
      if (v13)
      {
        unint64_t v14 = [(SKTileMapNode *)self tileSet];
        unint64_t v15 = [v14 tileDefinitions];

        if (v15)
        {
          BOOL v16 = [(SKTileMapNode *)self tileSet];
          id v17 = v33;
          id v18 = v16;
          unsigned int v19 = [v18 tileGroups];
          unint64_t v20 = [v19 indexOfObject:v17];

          double v21 = [v18 tileGroups];
          unint64_t v32 = [v21 count];

          unint64_t v22 = [(SKTileMapNode *)self tileSet];
          id v23 = v10;
          id v24 = v22;
          unint64_t v25 = [v24 tileDefinitions];
          unint64_t v26 = [v25 indexOfObject:v23];

          double v27 = [v24 tileDefinitions];
          unint64_t v28 = [v27 count];

          int v29 = [(SKTileMapNode *)self numberOfColumns];
          int v30 = (v20 & 0x7FFF) << 16;
          if (v20 >= v32) {
            int v30 = 2147418112;
          }
          int v31 = (unsigned __int16)v26;
          if (v26 >= v28) {
            int v31 = 0xFFFF;
          }
          SKCTileMapNode::setTile((SKCTileMapNode *)self->_skcTileMapNode, a5 + v29 * a6, v31 | v30);
        }
      }
      else
      {
      }
    }
  }
}

- (void)setTileGroup:(id)a3 forTileIndicies:(id)a4
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    goto LABEL_7;
  }
  uint64_t v8 = [(SKTileMapNode *)self tileSet];
  if (!v8) {
    goto LABEL_7;
  }
  unint64_t v9 = [(SKTileMapNode *)self tileSet];
  id v10 = [v9 tileGroups];

  if (v10)
  {
    unint64_t v11 = [(SKTileMapNode *)self tileSet];
    id v12 = v6;
    id v13 = v11;
    unint64_t v14 = [v13 tileGroups];
    unint64_t v15 = [v14 indexOfObject:v12];

    BOOL v16 = [v13 tileGroups];
    unint64_t v17 = [v16 count];

    if (v15 >= v17) {
      unsigned int v18 = 0x7FFFFFFF;
    }
    else {
      unsigned int v18 = ((v15 & 0x7FFF) << 16) | 0xFFFF;
    }
  }
  else
  {
LABEL_7:
    unsigned int v18 = 0x7FFFFFFF;
  }
  NSUInteger v19 = [(SKTileMapNode *)self numberOfColumns];
  NSUInteger v20 = [(SKTileMapNode *)self numberOfRows];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v21 = v7;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v39 objects:v44 count:16];
  unint64_t v23 = v20 * v19;
  if (v22)
  {
    uint64_t v24 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v40 != v24) {
          objc_enumerationMutation(v21);
        }
        unint64_t v26 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        if (v26)
        {
          unint64_t v27 = [v26 unsignedIntegerValue];
          if (v27 < v23) {
            SKCTileMapNode::setTile((SKCTileMapNode *)self->_skcTileMapNode, v27, v18);
          }
        }
      }
      uint64_t v22 = [v21 countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v22);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v28 = v21;
  uint64_t v29 = [v28 countByEnumeratingWithState:&v35 objects:v43 count:16];
  if (v29)
  {
    uint64_t v30 = *(void *)v36;
    do
    {
      for (uint64_t j = 0; j != v29; ++j)
      {
        if (*(void *)v36 != v30) {
          objc_enumerationMutation(v28);
        }
        unint64_t v32 = *(void **)(*((void *)&v35 + 1) + 8 * j);
        if (v32)
        {
          unint64_t v33 = objc_msgSend(v32, "unsignedIntegerValue", (void)v35);
          if (v33 < v23)
          {
            NSUInteger v34 = [(SKTileMapNode *)self numberOfColumns];
            [(SKTileMapNode *)self updateTileGroupsAtX:v33 % v34 y:v33 / v34 * v34 / [(SKTileMapNode *)self numberOfRows]];
          }
        }
      }
      uint64_t v29 = [v28 countByEnumeratingWithState:&v35 objects:v43 count:16];
    }
    while (v29);
  }
}

- (void)setTileGroup:(id)a3 andTileDefinition:(id)a4 forTileIndicies:(id)a5
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v48 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(SKTileMapNode *)self tileSet];
  if (v10)
  {
    unint64_t v11 = [(SKTileMapNode *)self tileSet];
    id v12 = [v11 tileGroups];
    if (v12)
    {
      id v13 = [(SKTileMapNode *)self tileSet];
      unint64_t v14 = [v13 tileDefinitions];

      if (v14)
      {
        unint64_t v15 = [(SKTileMapNode *)self tileSet];
        id v16 = v48;
        id v17 = v15;
        unsigned int v18 = [v17 tileGroups];
        unint64_t v19 = [v18 indexOfObject:v16];

        NSUInteger v20 = [v17 tileGroups];
        unint64_t v21 = [v20 count];

        uint64_t v22 = [(SKTileMapNode *)self tileSet];
        id v23 = v8;
        id v24 = v22;
        unint64_t v25 = [v24 tileDefinitions];
        unint64_t v26 = [v25 indexOfObject:v23];

        unint64_t v27 = [v24 tileDefinitions];
        unint64_t v28 = [v27 count];

        if (v26 >= v28) {
          int v29 = 0xFFFF;
        }
        else {
          int v29 = (unsigned __int16)v26;
        }
        if (v19 >= v21) {
          int v30 = 2147418112;
        }
        else {
          int v30 = (v19 & 0x7FFF) << 16;
        }
        NSUInteger v31 = [(SKTileMapNode *)self numberOfColumns];
        NSUInteger v32 = [(SKTileMapNode *)self numberOfRows];
        long long v55 = 0u;
        long long v56 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        id v33 = v9;
        uint64_t v34 = [v33 countByEnumeratingWithState:&v53 objects:v58 count:16];
        unint64_t v35 = v32 * v31;
        if (v34)
        {
          unsigned int v36 = v29 | v30;
          uint64_t v37 = *(void *)v54;
          do
          {
            for (uint64_t i = 0; i != v34; ++i)
            {
              if (*(void *)v54 != v37) {
                objc_enumerationMutation(v33);
              }
              long long v39 = *(void **)(*((void *)&v53 + 1) + 8 * i);
              if (v39)
              {
                unint64_t v40 = [v39 unsignedIntegerValue];
                if (v40 < v35) {
                  SKCTileMapNode::setTile((SKCTileMapNode *)self->_skcTileMapNode, v40, v36);
                }
              }
            }
            uint64_t v34 = [v33 countByEnumeratingWithState:&v53 objects:v58 count:16];
          }
          while (v34);
        }

        long long v51 = 0u;
        long long v52 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        id v41 = v33;
        uint64_t v42 = [v41 countByEnumeratingWithState:&v49 objects:v57 count:16];
        if (v42)
        {
          uint64_t v43 = *(void *)v50;
          do
          {
            for (uint64_t j = 0; j != v42; ++j)
            {
              if (*(void *)v50 != v43) {
                objc_enumerationMutation(v41);
              }
              uint64_t v45 = *(void **)(*((void *)&v49 + 1) + 8 * j);
              if (v45)
              {
                unint64_t v46 = [v45 unsignedIntegerValue];
                if (v46 < v35)
                {
                  NSUInteger v47 = [(SKTileMapNode *)self numberOfColumns];
                  [(SKTileMapNode *)self updateTileGroupsAtX:v46 % v47 y:v46 / v47 * v47 / [(SKTileMapNode *)self numberOfRows]];
                }
              }
            }
            uint64_t v42 = [v41 countByEnumeratingWithState:&v49 objects:v57 count:16];
          }
          while (v42);
        }
      }
    }
    else
    {
    }
  }
}

- (void)validateAllTiles
{
  if ([(SKTileMapNode *)self numberOfRows])
  {
    unint64_t v3 = 0;
    do
    {
      if ([(SKTileMapNode *)self numberOfColumns])
      {
        unint64_t v4 = 0;
        do
          [(SKTileMapNode *)self updateTileGroupsAtX:v4++ y:v3];
        while (v4 < [(SKTileMapNode *)self numberOfColumns]);
      }
      ++v3;
    }
    while (v3 < [(SKTileMapNode *)self numberOfRows]);
  }
}

- (void)fillArrayWithTiles:(unsigned int *)a3
{
}

- (void)fillArray:(unsigned int *)a3 withTilesFromColumn:(unint64_t)a4 row:(unint64_t)a5 forWidth:(unint64_t)a6 height:(unint64_t)a7
{
}

- (void)setTilesFromArray:(unsigned int *)a3
{
}

- (void)setTilesFromArray:(unsigned int *)a3 fromColumn:(unint64_t)a4 row:(unint64_t)a5 forWidth:(unint64_t)a6 height:(unint64_t)a7
{
}

- (void)clearModifiedTileTracking
{
}

- (void)getTileModifiedData:(int64_t *)a3 outMinRowModified:(int64_t *)a4 outMaxColumnModified:(int64_t *)a5 outmaxRowModified:(int64_t *)a6
{
  skcTileMapNode = (int *)self->_skcTileMapNode;
  *a3 = skcTileMapNode[156];
  *a4 = skcTileMapNode[157];
  *a5 = skcTileMapNode[158];
  *a6 = skcTileMapNode[159];
}

- (void)removeAllTiles
{
  skcTileMapNode = (SKCTileMapNode *)self->_skcTileMapNode;
  if (skcTileMapNode && *((_DWORD *)skcTileMapNode + 151))
  {
    if (*((_DWORD *)skcTileMapNode + 152)) {
      SKCTileMapNode::setAllTiles(skcTileMapNode, 0x7FFFFFFFu);
    }
  }
}

- (void)rebuildTileSprites
{
  skcTileMapNode = self->_skcTileMapNode;
  if (skcTileMapNode[152])
  {
    unint64_t v4 = 0;
    do
    {
      if (skcTileMapNode[151])
      {
        unint64_t v5 = 0;
        do
        {
          [(SKTileMapNode *)self updateTileGroupsAtX:v5++ y:v4];
          skcTileMapNode = self->_skcTileMapNode;
        }
        while (v5 < skcTileMapNode[151]);
      }
      ++v4;
    }
    while (v4 < skcTileMapNode[152]);
  }
}

- (void)updateTileDefinitionWithoutAutomappingAtX:(unint64_t)a3 y:(unint64_t)a4
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  skcTileMapNode = (SKCTileMapNode *)self->_skcTileMapNode;
  unsigned int v6 = a3 + *((_DWORD *)skcTileMapNode + 151) * a4;
  unsigned int RawTile = SKCTileMapNode::getRawTile(skcTileMapNode, v6);
  uint64_t v8 = HIWORD(RawTile) & 0x7FFF;
  if (v8 != 0x7FFF)
  {
    unsigned __int16 v9 = RawTile;
    id v10 = [(SKTileSet *)self->_tileSet tileGroups];
    unint64_t v11 = [v10 count];

    if (v11 > v8)
    {
      id v12 = [(SKTileSet *)self->_tileSet tileDefinitions];
      unint64_t v13 = [v12 count];

      if (v9 == 0xFFFF || v13 <= v9)
      {
        unint64_t v15 = [(SKTileSet *)self->_tileSet tileGroups];
        id v16 = [v15 objectAtIndexedSubscript:v8];

        if (!v16) {
          goto LABEL_35;
        }
        id v17 = [v16 rules];
        if (!v17) {
          goto LABEL_35;
        }
        unsigned int v18 = [v16 rules];
        uint64_t v19 = [v18 count];

        if (!v19) {
          goto LABEL_35;
        }
        NSUInteger v20 = [v16 rules];
        unint64_t v21 = [v20 firstObject];

        unint64_t v35 = v21;
        unsigned int v36 = [v21 tileDefinitions];
        if ([v36 count] == 1)
        {
          uint64_t v22 = [v36 firstObject];
        }
        else
        {
          if (![v36 count])
          {
            id v30 = 0;
LABEL_34:
            SKCTileMapNode::setTile((SKCTileMapNode *)self->_skcTileMapNode, v6, [(SKTileMapNode *)self getTileIDWithTileGroup:v16 andTileDefinition:v30]);

LABEL_35:
            return;
          }
          long long v43 = 0u;
          long long v44 = 0u;
          long long v41 = 0u;
          long long v42 = 0u;
          id v23 = v36;
          uint64_t v24 = [v23 countByEnumeratingWithState:&v41 objects:v46 count:16];
          if (v24)
          {
            uint64_t v25 = 0;
            uint64_t v26 = *(void *)v42;
            do
            {
              for (uint64_t i = 0; i != v24; ++i)
              {
                if (*(void *)v42 != v26) {
                  objc_enumerationMutation(v23);
                }
                v25 += [*(id *)(*((void *)&v41 + 1) + 8 * i) placementWeight];
              }
              uint64_t v24 = [v23 countByEnumeratingWithState:&v41 objects:v46 count:16];
            }
            while (v24);

            if (v25)
            {
              uint32_t v28 = arc4random_uniform(v25);
              long long v39 = 0u;
              long long v40 = 0u;
              long long v37 = 0u;
              long long v38 = 0u;
              id v29 = v23;
              id v30 = (id)[v29 countByEnumeratingWithState:&v37 objects:v45 count:16];
              if (v30)
              {
                unint64_t v31 = v28;
                uint64_t v32 = *(void *)v38;
                while (2)
                {
                  for (uint64_t j = 0; j != v30; uint64_t j = (char *)j + 1)
                  {
                    if (*(void *)v38 != v32) {
                      objc_enumerationMutation(v29);
                    }
                    uint64_t v34 = *(void **)(*((void *)&v37 + 1) + 8 * (void)j);
                    if (v31 < [v34 placementWeight])
                    {
                      id v30 = v34;
                      goto LABEL_38;
                    }
                    v31 -= [v34 placementWeight];
                  }
                  id v30 = (id)[v29 countByEnumeratingWithState:&v37 objects:v45 count:16];
                  if (v30) {
                    continue;
                  }
                  break;
                }
              }
LABEL_38:

              goto LABEL_34;
            }
          }
          else
          {
          }
          uint64_t v22 = objc_msgSend(v23, "objectAtIndexedSubscript:", arc4random_uniform(objc_msgSend(v23, "count")));
        }
        id v30 = (id)v22;
        goto LABEL_34;
      }
    }
  }
}

- (void)updateTileGroupsAtX:(unint64_t)a3 y:(unint64_t)a4
{
  v153[8] = *MEMORY[0x263EF8340];
  if ([(SKTileMapNode *)self enableAutomapping])
  {
    long long v145 = 0u;
    long long v146 = 0u;
    long long v144 = 0u;
    unint64_t v7 = a3 + *((unsigned int *)self->_skcTileMapNode + 151) * a4;
    LODWORD(v119) = v7;
    std::deque<unsigned int>::push_back(&v144, &v119);
    unint64_t v112 = v7;
    unsigned int RawTile = SKCTileMapNode::getRawTile((SKCTileMapNode *)self->_skcTileMapNode, v7);
    unsigned __int16 v9 = [(SKTileSet *)self->_tileSet tileDefinitions];
    [v9 count];

    uint64_t v10 = *((void *)&v146 + 1);
    if (!*((void *)&v146 + 1)) {
      goto LABEL_168;
    }
    int v113 = 0;
    int v105 = HIWORD(RawTile) & 0x7FFF;
    while (1)
    {
      uint64_t v11 = *(unsigned int *)(*(void *)(*((void *)&v144 + 1) + (((unint64_t)v146 >> 7) & 0x1FFFFFFFFFFFFF8))
                            + 4 * (v146 & 0x3FF));
      *(void *)&long long v146 = v146 + 1;
      *((void *)&v146 + 1) = v10 - 1;
      if ((unint64_t)v146 >= 0x800)
      {
        operator delete(**((void ***)&v144 + 1));
        *((void *)&v144 + 1) += 8;
        *(void *)&long long v146 = v146 - 1024;
      }
      skcTileMapNode = (unsigned int *)self->_skcTileMapNode;
      unint64_t v13 = skcTileMapNode[151];
      unsigned int v115 = SKCTileMapNode::getRawTile((SKCTileMapNode *)skcTileMapNode, v11);
      SKTileSetType v14 = [(SKTileSet *)self->_tileSet type];
      uint64_t v117 = v11 % v13;
      unint64_t v116 = (v11 - v117) / v13;
      *(void *)v111 = v11;
      if (v14 >= SKTileSetTypeHexagonalFlat)
      {
        if (v14 == SKTileSetTypeHexagonalPointy)
        {
          BOOL v15 = (((v11 - v117) / v13) & 1) == 0;
          if (v116) {
            id v16 = (int *)&kHexPointyOddRowXOffsets;
          }
          else {
            id v16 = (int *)&kHexPointyEvenRowXOffsets;
          }
          id v17 = (int *)&kHexPointyOddRowYOffsets;
          unsigned int v18 = (int *)&kHexPointyEvenRowYOffsets;
          goto LABEL_18;
        }
        if (v14 == SKTileSetTypeHexagonalFlat)
        {
          BOOL v15 = (v117 & 1) == 0;
          if (v117) {
            id v16 = (int *)&kHexFlatOddColumnXOffsets;
          }
          else {
            id v16 = (int *)&kHexFlatEvenColumnXOffsets;
          }
          id v17 = (int *)&kHexFlatOddColumnYOffsets;
          unsigned int v18 = (int *)&kHexFlatEvenColumnYOffsets;
LABEL_18:
          if (v15) {
            uint64_t v19 = v18;
          }
          else {
            uint64_t v19 = v17;
          }
          uint64_t v20 = 6;
          goto LABEL_22;
        }
      }
      uint64_t v19 = &kYOffsets;
      id v16 = &kXOffsets;
      uint64_t v20 = 8;
LABEL_22:
      unint64_t v107 = HIWORD(v115) & 0x7FFF;
      if (v107 == 0x7FFF) {
        goto LABEL_29;
      }
      unint64_t v21 = [(SKTileSet *)self->_tileSet tileGroups];
      BOOL v22 = [v21 count] > v107;

      if (!v22)
      {
        SKCTileMapNode::setTile((SKCTileMapNode *)self->_skcTileMapNode, v111[0], 0x7FFFFFFFu);
LABEL_29:
        if (v112 != *(void *)v111) {
          goto LABEL_155;
        }
        do
        {
LABEL_30:
          int v29 = *v16;
          v16 += 2;
          unsigned int v30 = v117 + v29;
          int v32 = *v19;
          v19 += 2;
          int v31 = v32;
          id v33 = self->_skcTileMapNode;
          unsigned int v34 = v33[151];
          if (v30 < v34)
          {
            unsigned int v35 = v31 + v116;
            if (v33[152] > v35)
            {
              unint64_t v119 = v30 + v34 * v35;
              unsigned int v36 = (void *)(*((void *)&v144 + 1) + 8 * ((unint64_t)v146 >> 10));
              if ((void)v145 == *((void *)&v144 + 1))
              {
                long long v37 = 0;
                long long v39 = 0;
                long long v38 = (void *)(*((void *)&v144 + 1) + 8 * ((*((void *)&v146 + 1) + (void)v146) >> 10));
              }
              else
              {
                long long v37 = (_DWORD *)(*v36 + 4 * (v146 & 0x3FF));
                long long v38 = (void *)(*((void *)&v144 + 1) + 8 * ((*((void *)&v146 + 1) + (void)v146) >> 10));
                long long v39 = (_DWORD *)(*v38 + 4 * ((*((void *)&v146 + 1) + v146) & 0x3FF));
              }
              std::__find_segment_if[abi:ne180100]<std::__deque_iterator<unsigned int,unsigned int *,unsigned int &,unsigned int **,long,1024l>,std::__find_segment<unsigned long>,std::__identity>(v36, v37, v38, v39, &v119);
              if ((void)v145 == *((void *)&v144 + 1)) {
                uint64_t v41 = 0;
              }
              else {
                uint64_t v41 = *(void *)(*((void *)&v144 + 1)
              }
                                + (((*((void *)&v146 + 1) + (void)v146) >> 7) & 0x1FFFFFFFFFFFFF8))
                    + 4 * ((*((void *)&v146 + 1) + v146) & 0x3FF);
              if (v41 == v40)
              {
                unint64_t v42 = v119;
                if ((v113 & (v119 == v112)) != 0)
                {
                  int v113 = 1;
                }
                else
                {
                  int v118 = v119;
                  std::deque<unsigned int>::push_back(&v144, &v118);
                  v113 |= v42 == v112;
                }
              }
            }
          }
          --v20;
        }
        while (v20);
        goto LABEL_155;
      }
      id v23 = [(SKTileSet *)self->_tileSet tileGroups];
      v114 = [v23 objectAtIndexedSubscript:v107];

      if ([v114 type] == 1
        || ([v114 rules],
            uint64_t v24 = objc_claimAutoreleasedReturnValue(),
            BOOL v25 = [v24 count] == 1,
            v24,
            v25))
      {
        uint64_t v26 = [v114 rules];
        unint64_t v27 = [v26 firstObject];
        id v108 = [v27 tileDefinitions];

        if ([v108 count] == 1)
        {
          uint64_t v28 = [v108 firstObject];
          goto LABEL_100;
        }
        if (![v108 count])
        {
          id v54 = 0;
          goto LABEL_154;
        }
        long long v142 = 0u;
        long long v143 = 0u;
        long long v140 = 0u;
        long long v141 = 0u;
        id v43 = v108;
        uint64_t v44 = [v43 countByEnumeratingWithState:&v140 objects:v152 count:16];
        if (v44)
        {
          uint64_t v45 = 0;
          uint64_t v46 = *(void *)v141;
          do
          {
            for (uint64_t i = 0; i != v44; ++i)
            {
              if (*(void *)v141 != v46) {
                objc_enumerationMutation(v43);
              }
              v45 += [*(id *)(*((void *)&v140 + 1) + 8 * i) placementWeight];
            }
            uint64_t v44 = [v43 countByEnumeratingWithState:&v140 objects:v152 count:16];
          }
          while (v44);

          if (v45)
          {
            uint32_t v48 = arc4random_uniform(v45);
            long long v138 = 0u;
            long long v139 = 0u;
            long long v136 = 0u;
            long long v137 = 0u;
            obuint64_t j = v43;
            uint64_t v49 = [obj countByEnumeratingWithState:&v136 objects:v151 count:16];
            if (v49)
            {
              unint64_t v50 = v48;
              uint64_t v51 = *(void *)v137;
              while (2)
              {
                for (uint64_t j = 0; j != v49; ++j)
                {
                  if (*(void *)v137 != v51) {
                    objc_enumerationMutation(obj);
                  }
                  long long v53 = *(void **)(*((void *)&v136 + 1) + 8 * j);
                  if (v50 < [v53 placementWeight])
                  {
                    id v54 = v53;
                    goto LABEL_116;
                  }
                  v50 -= [v53 placementWeight];
                }
                uint64_t v49 = [obj countByEnumeratingWithState:&v136 objects:v151 count:16];
                if (v49) {
                  continue;
                }
                break;
              }
            }
            id v54 = 0;
LABEL_116:

            goto LABEL_101;
          }
        }
        else
        {
        }
        uint64_t v28 = objc_msgSend(v43, "objectAtIndexedSubscript:", arc4random_uniform(objc_msgSend(v43, "count")));
LABEL_100:
        id v54 = (id)v28;
LABEL_101:
        if (!v54) {
          goto LABEL_154;
        }
        unsigned int v78 = [(SKTileMapNode *)self getTileIDWithTileGroup:v114 andTileDefinition:v54];
        long long v134 = 0u;
        long long v135 = 0u;
        long long v132 = 0u;
        long long v133 = 0u;
        id obja = v108;
        uint64_t v79 = [obja countByEnumeratingWithState:&v132 objects:v150 count:16];
        if (v79)
        {
          uint64_t v80 = *(void *)v133;
          while (2)
          {
            for (uint64_t k = 0; k != v79; ++k)
            {
              if (*(void *)v133 != v80) {
                objc_enumerationMutation(obja);
              }
              if (*(void *)(*((void *)&v132 + 1) + 8 * k)
                && v115 == -[SKTileMapNode getTileIDWithTileGroup:andTileDefinition:](self, "getTileIDWithTileGroup:andTileDefinition:", v114))
              {
                v82 = obja;
                goto LABEL_153;
              }
            }
            uint64_t v79 = [obja countByEnumeratingWithState:&v132 objects:v150 count:16];
            if (v79) {
              continue;
            }
            break;
          }
        }

        if (v78 != v115)
        {
          SKCTileMapNode::setTile((SKCTileMapNode *)self->_skcTileMapNode, v111[0], v78);
          goto LABEL_162;
        }
LABEL_112:
        id v108 = obja;
        goto LABEL_154;
      }
      for (uint64_t m = 0; m != v20; ++m)
      {
        unsigned int v56 = v19[2 * m] + v116;
        int v57 = v117 + v16[2 * m];
        if (v57 >= 0)
        {
          v58 = (SKCTileMapNode *)self->_skcTileMapNode;
          unsigned int v59 = *((_DWORD *)v58 + 151);
          if (v57 < v59)
          {
            if ((v56 & 0x80000000) != 0)
            {
              unsigned int v62 = v59 + v59 * v56 + v57;
            }
            else
            {
              unsigned int v60 = v57 + v59 * v56;
              unsigned int v61 = v57 + v59 * (v56 - 1);
              if (*((_DWORD *)v58 + 152) <= v56) {
                unsigned int v62 = v61;
              }
              else {
                unsigned int v62 = v60;
              }
            }
LABEL_75:
            unsigned int v63 = SKCTileMapNode::getRawTile(v58, v62);
            goto LABEL_76;
          }
        }
        unsigned int v63 = v115;
        if ((v56 & 0x80000000) == 0)
        {
          v58 = (SKCTileMapNode *)self->_skcTileMapNode;
          unsigned int v63 = v115;
          if (*((_DWORD *)v58 + 152) > v56)
          {
            int v64 = v57 + *((_DWORD *)v58 + 151) * v56;
            if (v57 < 0) {
              unsigned int v62 = v64 + 1;
            }
            else {
              unsigned int v62 = v64 - 1;
            }
            goto LABEL_75;
          }
        }
LABEL_76:
        v153[m] = HIWORD(v63) & 0x7FFF;
      }
      id obja = [(SKTileSet *)self->_tileSet findTileDefinitionsForGroup:v114 withGroupAdjacency:v153];
      if ([obja count] == 1)
      {
        uint64_t v65 = [obja firstObject];
        goto LABEL_119;
      }
      if (![obja count]) {
        goto LABEL_133;
      }
      long long v130 = 0u;
      long long v131 = 0u;
      long long v128 = 0u;
      long long v129 = 0u;
      id v66 = obja;
      uint64_t v67 = [v66 countByEnumeratingWithState:&v128 objects:v149 count:16];
      if (v67)
      {
        uint64_t v68 = 0;
        uint64_t v69 = *(void *)v129;
        do
        {
          for (uint64_t n = 0; n != v67; ++n)
          {
            if (*(void *)v129 != v69) {
              objc_enumerationMutation(v66);
            }
            v68 += [*(id *)(*((void *)&v128 + 1) + 8 * n) placementWeight];
          }
          uint64_t v67 = [v66 countByEnumeratingWithState:&v128 objects:v149 count:16];
        }
        while (v67);

        if (v68)
        {
          uint32_t v71 = arc4random_uniform(v68);
          long long v126 = 0u;
          long long v127 = 0u;
          long long v124 = 0u;
          long long v125 = 0u;
          id v72 = v66;
          uint64_t v73 = [v72 countByEnumeratingWithState:&v124 objects:v148 count:16];
          if (v73)
          {
            unint64_t v74 = v71;
            uint64_t v106 = *(void *)v125;
            while (2)
            {
              for (iuint64_t i = 0; ii != v73; ++ii)
              {
                if (*(void *)v125 != v106) {
                  objc_enumerationMutation(v72);
                }
                v76 = *(void **)(*((void *)&v124 + 1) + 8 * ii);
                if (v74 < [v76 placementWeight])
                {
                  v77 = v72;
                  id v54 = v76;
                  goto LABEL_164;
                }
                v74 -= [v76 placementWeight];
              }
              uint64_t v73 = [v72 countByEnumeratingWithState:&v124 objects:v148 count:16];
              if (v73) {
                continue;
              }
              break;
            }
          }
          v77 = v72;
          id v54 = 0;
LABEL_164:

          goto LABEL_120;
        }
      }
      else
      {
      }
      uint64_t v65 = objc_msgSend(v66, "objectAtIndexedSubscript:", arc4random_uniform(objc_msgSend(v66, "count")));
LABEL_119:
      id v54 = (id)v65;
LABEL_120:
      if (!v54)
      {
LABEL_133:
        if (v107 != v105 || v112 != *(void *)v111)
        {
          if (!v114
            || ([(SKTileSet *)self->_tileSet defaultTileGroup],
                v101 = objc_claimAutoreleasedReturnValue(),
                BOOL v102 = v114 == v101,
                v101,
                v102))
          {
            SKCTileMapNode::setTile((SKCTileMapNode *)self->_skcTileMapNode, v111[0], [(SKTileMapNode *)self getTileIDWithTileGroup:0 andTileDefinition:0]);
          }
          else
          {
            v103 = (SKCTileMapNode *)self->_skcTileMapNode;
            v104 = [(SKTileSet *)self->_tileSet defaultTileGroup];
            SKCTileMapNode::setTile(v103, v111[0], [(SKTileMapNode *)self getTileIDWithTileGroup:v104 andTileDefinition:0]);
          }
          id v54 = 0;
LABEL_162:

          goto LABEL_30;
        }
        id v54 = [(SKTileSet *)self->_tileSet getCenterTileDefinitionForGroup:v114 withRequiredOutputGroupAdjacency:v153];
        v87 = v153;
        id v88 = v54;
        do
        {
          int v89 = *(unsigned __int16 *)v87;
          if (v89 != 0x7FFF)
          {
            unsigned int v90 = v117 + *v16;
            v91 = (SKCTileMapNode *)self->_skcTileMapNode;
            unsigned int v92 = *((_DWORD *)v91 + 151);
            if (v90 >= v92 || (unsigned int v93 = *v19 + v116, *((_DWORD *)v91 + 152) <= v93))
            {
              void *v87 = 0x7FFFLL;
            }
            else
            {
              unint64_t v119 = v90 + v92 * v93;
              SKCTileMapNode::setTile(v91, v90 + v92 * v93, (v89 << 16) | 0xFFFF);
              v94 = (void *)(*((void *)&v144 + 1) + 8 * ((unint64_t)v146 >> 10));
              if ((void)v145 == *((void *)&v144 + 1))
              {
                v95 = 0;
                v97 = 0;
                v96 = (void *)(*((void *)&v144 + 1) + 8 * ((*((void *)&v146 + 1) + (void)v146) >> 10));
              }
              else
              {
                v95 = (_DWORD *)(*v94 + 4 * (v146 & 0x3FF));
                v96 = (void *)(*((void *)&v144 + 1) + 8 * ((*((void *)&v146 + 1) + (void)v146) >> 10));
                v97 = (_DWORD *)(*v96 + 4 * ((*((void *)&v146 + 1) + v146) & 0x3FF));
              }
              std::__find_segment_if[abi:ne180100]<std::__deque_iterator<unsigned int,unsigned int *,unsigned int &,unsigned int **,long,1024l>,std::__find_segment<unsigned long>,std::__identity>(v94, v95, v96, v97, &v119);
              if ((void)v145 == *((void *)&v144 + 1)) {
                uint64_t v99 = 0;
              }
              else {
                uint64_t v99 = *(void *)(*((void *)&v144 + 1)
              }
                                + (((*((void *)&v146 + 1) + (void)v146) >> 7) & 0x1FFFFFFFFFFFFF8))
                    + 4 * ((*((void *)&v146 + 1) + v146) & 0x3FF);
              if (v99 == v98)
              {
                unint64_t v100 = v119;
                if ((v113 & (v119 == v112)) != 0)
                {
                  int v113 = 1;
                }
                else
                {
                  int v118 = v119;
                  std::deque<unsigned int>::push_back(&v144, &v118);
                  v113 |= v100 == v112;
                }
                id v54 = v88;
              }
            }
          }
          ++v87;
          v16 += 2;
          v19 += 2;
          --v20;
        }
        while (v20);
        goto LABEL_112;
      }
      unsigned int v83 = [(SKTileMapNode *)self getTileIDWithTileGroup:v114 andTileDefinition:v54];
      long long v122 = 0u;
      long long v123 = 0u;
      long long v120 = 0u;
      long long v121 = 0u;
      id v108 = obja;
      uint64_t v84 = [v108 countByEnumeratingWithState:&v120 objects:v147 count:16];
      if (v84)
      {
        uint64_t v85 = *(void *)v121;
        while (2)
        {
          for (juint64_t j = 0; jj != v84; ++jj)
          {
            if (*(void *)v121 != v85) {
              objc_enumerationMutation(v108);
            }
            if (*(void *)(*((void *)&v120 + 1) + 8 * jj)
              && v115 == -[SKTileMapNode getTileIDWithTileGroup:andTileDefinition:](self, "getTileIDWithTileGroup:andTileDefinition:", v114))
            {
              v82 = v108;
LABEL_153:
              id v108 = v82;

              goto LABEL_154;
            }
          }
          uint64_t v84 = [v108 countByEnumeratingWithState:&v120 objects:v147 count:16];
          if (v84) {
            continue;
          }
          break;
        }
      }

      if (v83 != v115)
      {
        SKCTileMapNode::setTile((SKCTileMapNode *)self->_skcTileMapNode, v111[0], v83);
        goto LABEL_162;
      }
LABEL_154:

LABEL_155:
      uint64_t v10 = *((void *)&v146 + 1);
      if (!*((void *)&v146 + 1))
      {
LABEL_168:
        std::deque<unsigned int>::~deque[abi:ne180100](&v144);
        return;
      }
    }
  }

  [(SKTileMapNode *)self updateTileDefinitionWithoutAutomappingAtX:a3 y:a4];
}

- (void)setColumns:(unint64_t)a3 andRows:(int64_t)a4
{
  RawTilesCopy = SKCTileMapNode::getRawTilesCopy((SKCTileMapNode *)self->_skcTileMapNode);
  uint64_t v8 = 0;
  BOOL v9 = a4 > 0;
  if (a3 && a4 >= 1)
  {
    uint64_t v8 = (char *)malloc_type_malloc(4 * a3 * a4, 0xBDB0CCBFuLL);
    memset(v8, 255, 4 * a3 * a4);
  }
  skcTileMapNode = (unsigned int *)self->_skcTileMapNode;
  unint64_t v11 = skcTileMapNode[151];
  if (v11)
  {
    unint64_t v12 = skcTileMapNode[152];
    if (v12)
    {
      unint64_t v13 = 0;
      BOOL v14 = 1;
      BOOL v15 = v8;
      unint64_t v16 = skcTileMapNode[151];
      int v17 = 1;
      int v18 = 1;
      do
      {
        v18 &= v14;
        v17 &= v9;
        BOOL v19 = v16 != 0;
        if (v16 | a3)
        {
          unint64_t v20 = 0;
          int v21 = 1;
          BOOL v22 = a3 != 0;
          int v23 = 1;
          while (1)
          {
            v23 &= v19;
            v21 &= v22;
            if (v23 & v18 & v21 & v17)
            {
              *(_DWORD *)&v15[4 * v20] = RawTilesCopy[v20 + v13 * v16];
              unint64_t v11 = skcTileMapNode[151];
            }
            BOOL v22 = ++v20 < a3;
            unint64_t v16 = v11;
            BOOL v19 = v20 < v11;
            if (v20 >= v11)
            {
              unint64_t v16 = v11;
              if (v20 >= a3) {
                break;
              }
            }
          }
          unint64_t v12 = skcTileMapNode[152];
          unint64_t v16 = v11;
        }
        else
        {
          unint64_t v16 = 0;
        }
        BOOL v9 = (uint64_t)++v13 < a4;
        v15 += 4 * a3;
        BOOL v14 = v13 < v12;
      }
      while (v13 < v12 || (uint64_t)v13 < a4);
    }
  }
  SKCTileMapNode::setRawTiles((SKCTileMapNode *)skcTileMapNode, (const unsigned int *)v8, a3, a4);
  free(v8);
  if (RawTilesCopy) {
    free(RawTilesCopy);
  }

  [(SKTileMapNode *)self calculateSize];
}

- (void)calculateSize
{
  uint64_t v3 = [(SKTileMapNode *)self tileSet];
  if (!v3
    || (unint64_t v4 = (void *)v3,
        [(SKTileMapNode *)self tileSet],
        unint64_t v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 type],
        v5,
        v4,
        !v6))
  {
    skcTileMapNode = (SKCNode *)self->_skcTileMapNode;
    double v27 = (double)[(SKTileMapNode *)self numberOfColumns];
    [(SKTileMapNode *)self tileSize];
    *(float *)&double v28 = v28 * v27;
    unsigned int v52 = LODWORD(v28);
    double v29 = (double)[(SKTileMapNode *)self numberOfRows];
    [(SKTileMapNode *)self tileSize];
    *(float *)&unsigned int v31 = v30 * v29;
    long long v55 = __PAIR64__(v31, v52);
    int v32 = skcTileMapNode;
LABEL_6:
    SKCNode::setSize(v32, &v55);
    return;
  }
  unint64_t v7 = [(SKTileMapNode *)self tileSet];
  uint64_t v8 = [v7 type];

  if (v8 == 1)
  {
    NSUInteger v9 = [(SKTileMapNode *)self numberOfColumns];
    double v10 = (double)([(SKTileMapNode *)self numberOfRows] + v9);
    [(SKTileMapNode *)self tileSize];
    *(float *)&double v11 = v11 * v10 * 0.5;
    unsigned int v51 = LODWORD(v11);
    NSUInteger v12 = [(SKTileMapNode *)self numberOfColumns];
    double v13 = (double)([(SKTileMapNode *)self numberOfRows] + v12);
    [(SKTileMapNode *)self tileSize];
    *(float *)&unsigned int v15 = v14 * v13 * 0.5;
    long long v55 = __PAIR64__(v15, v51);
    SKCNode::setSize((SKCNode *)self->_skcTileMapNode, &v55);
    [(SKTileMapNode *)self tileSize];
    *(float *)&double v10 = v16;
    [(SKTileMapNode *)self tileSize];
    *(float *)&double v13 = v17;
    self->_isoHeightScalar = *(float *)&v10 / *(float *)&v13;
    unint64_t v18 = [(SKTileMapNode *)self numberOfColumns];
    LODWORD(v19) = 0;
    *((float *)&v19 + 1) = self->_isoHeightScalar * (float)((float)(*(float *)&v13 * 0.5) * (float)v18);
    *(void *)self->_isoOrigiuint64_t n = v19;
    *(float *)&uint64_t v20 = *(float *)&v10 * 0.5;
    *(float *)&uint64_t v21 = *(float *)&v10 * 0.5;
    *((float *)&v21 + 1) = (float)(*(float *)&v13 * -0.5) * self->_isoHeightScalar;
    *(void *)self->_isoColumnVector = v21;
    *((float *)&v20 + 1) = (float)(*(float *)&v13 * 0.5) * self->_isoHeightScalar;
    *(void *)self->_isoRowVector = v20;
    p_isoColumnWidth = &self->_isoColumnWidth;
    self->_isoColumnWidth = sqrtf(vaddv_f32(vmul_f32(*(float32x2_t *)self->_isoColumnVector, *(float32x2_t *)self->_isoColumnVector)));
    p_isoRowHeight = &self->_isoRowHeight;
    self->_isoRowHeight = sqrtf(vaddv_f32(vmul_f32(*(float32x2_t *)self->_isoRowVector, *(float32x2_t *)self->_isoRowVector)));
    float32x2_t v24 = vld1_dup_f32(p_isoColumnWidth);
    *(float32x2_t *)self->_isoColumnVector = vdiv_f32(*(float32x2_t *)self->_isoColumnVector, v24);
    float32x2_t v25 = vld1_dup_f32(p_isoRowHeight);
    *(float32x2_t *)self->_isoRowVector = vdiv_f32(*(float32x2_t *)self->_isoRowVector, v25);
    return;
  }
  id v33 = [(SKTileMapNode *)self tileSet];
  uint64_t v34 = [v33 type];

  if (v34 == 2)
  {
    float width = self->_tileSize.width;
    float v36 = width * 0.5;
    self->_hexRadius = v36;
    self->_tileSize.float height = (float)(v36 * 1.7321);
    float v37 = floorf((float)[(SKTileMapNode *)self numberOfColumns] * 0.5);
    float v38 = self->_tileSize.width;
    float v53 = (float)(self->_hexRadius * (float)(v37 + -1.0)) + (float)(v38 * v37);
    if (([(SKTileMapNode *)self numberOfColumns] & 1) == 0) {
      float v53 = v53 + (float)(self->_hexRadius * 1.5);
    }
    float height = self->_tileSize.height;
    unint64_t v40 = [(SKTileMapNode *)self numberOfRows];
    *(float *)&unint64_t v41 = v53;
    *((float *)&v41 + 1) = (float)((float)v40 + 0.5) * height;
    long long v55 = v41;
LABEL_17:
    int v32 = (SKCNode *)self->_skcTileMapNode;
    goto LABEL_6;
  }
  unint64_t v42 = [(SKTileMapNode *)self tileSet];
  uint64_t v43 = [v42 type];

  if (v43 == 3)
  {
    float v44 = self->_tileSize.height;
    float v45 = v44 * 0.5;
    self->_hexRadius = v45;
    self->_tileSize.float width = (float)(v45 * 1.7321);
    float v46 = floorf((float)[(SKTileMapNode *)self numberOfRows] * 0.5);
    float v47 = self->_tileSize.width;
    float v54 = (float)((float)[(SKTileMapNode *)self numberOfColumns] + 0.5) * v47;
    float v48 = self->_tileSize.height;
    float v50 = (float)(self->_hexRadius * (float)(v46 + -1.0)) + (float)(v48 * v46);
    if ([(SKTileMapNode *)self numberOfRows]) {
      float v49 = v50;
    }
    else {
      float v49 = v50 + (float)(self->_hexRadius * 1.5);
    }
    long long v55 = __PAIR64__(LODWORD(v49), LODWORD(v54));
    goto LABEL_17;
  }
}

- (NSUInteger)tileColumnIndexFromPosition:(CGPoint)position
{
  double y = position.y;
  double x = position.x;
  long long v41 = *((_OWORD *)self->_skcTileMapNode + 21);
  uint64_t v4 = [(SKTileMapNode *)self tileSet];
  if (!v4
    || (unint64_t v5 = (void *)v4,
        [(SKTileMapNode *)self tileSet],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = [v6 type],
        v6,
        v5,
        !v7))
  {
    [(SKTileMapNode *)self anchorPoint];
    double v17 = x + v16 * *(float *)&v41;
    [(SKTileMapNode *)self tileSize];
    return vcvtmd_u64_f64(v17 / v18);
  }
  uint64_t v8 = [(SKTileMapNode *)self tileSet];
  uint64_t v9 = [v8 type];

  if (v9 == 1)
  {
    float v10 = x;
    [(SKTileMapNode *)self anchorPoint];
    *(float *)&double v11 = v11 * *(float *)&v41;
    float v38 = v10 + *(float *)&v11;
    float v12 = y;
    [(SKTileMapNode *)self anchorPoint];
    float v14 = v13 * *((float *)&v41 + 1);
    *(float *)&double v13 = v38;
    *((float *)&v13 + 1) = self->_isoHeightScalar * (float)(v12 + v14);
    return vcvtms_u32_f32(vaddv_f32(vmul_f32(*(float32x2_t *)self->_isoColumnVector, vsub_f32(*(float32x2_t *)&v13, *(float32x2_t *)self->_isoOrigin)))/ self->_isoColumnWidth);
  }
  uint64_t v19 = [(SKTileMapNode *)self tileSet];
  uint64_t v20 = [v19 type];

  if (v20 == 2)
  {
    v21.f64[0] = x;
    v21.f64[1] = y;
    float32x2_t v22 = vcvt_f32_f64(v21);
    [(SKTileMapNode *)self anchorPoint];
    float64_t v39 = v23;
    [(SKTileMapNode *)self anchorPoint];
    v24.f64[0] = v39;
    v24.f64[1] = v25;
    float32x2_t v44 = vadd_f32(v22, vcvt_f32_f64(vmulq_f64(v24, vcvtq_f64_f32(*(float32x2_t *)&v41))));
    float hexRadius = self->_hexRadius;
    int v43 = -1;
    float height = self->_tileSize.height;
    double v28 = &v43;
    double v29 = (int *)v42;
LABEL_10:
    getHexIndexFromPoint(&v44, v28, v29, hexRadius, height);
    return v43;
  }
  double v30 = [(SKTileMapNode *)self tileSet];
  uint64_t v31 = [v30 type];

  if (v31 == 3)
  {
    v32.f64[0] = y;
    v32.f64[1] = x;
    float32x2_t v33 = vcvt_f32_f64(v32);
    [(SKTileMapNode *)self anchorPoint];
    float64_t v40 = v34;
    [(SKTileMapNode *)self anchorPoint];
    v35.f64[1] = v40;
    float32x2_t v44 = vadd_f32(v33, vcvt_f32_f64(vmulq_f64(v35, vcvtq_f64_f32((float32x2_t)vrev64_s32(*(int32x2_t *)&v41)))));
    float hexRadius = self->_hexRadius;
    int v43 = -1;
    float height = self->_tileSize.width;
    double v28 = (int *)v42;
    double v29 = &v43;
    goto LABEL_10;
  }
  return -1;
}

- (NSUInteger)tileRowIndexFromPosition:(CGPoint)position
{
  double x = position.x;
  double y = position.y;
  long long v41 = *((_OWORD *)self->_skcTileMapNode + 21);
  uint64_t v4 = [(SKTileMapNode *)self tileSet];
  if (!v4
    || (unint64_t v5 = (void *)v4,
        [(SKTileMapNode *)self tileSet],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = [v6 type],
        v6,
        v5,
        !v7))
  {
    [(SKTileMapNode *)self anchorPoint];
    double v17 = y + v16 * *((float *)&v41 + 1);
    [(SKTileMapNode *)self tileSize];
    return vcvtmd_u64_f64(v17 / v18);
  }
  uint64_t v8 = [(SKTileMapNode *)self tileSet];
  uint64_t v9 = [v8 type];

  if (v9 == 1)
  {
    float v10 = x;
    [(SKTileMapNode *)self anchorPoint];
    *(float *)&double v11 = v11 * *(float *)&v41;
    float v37 = v10 + *(float *)&v11;
    float v12 = y;
    [(SKTileMapNode *)self anchorPoint];
    float v14 = v13 * *((float *)&v41 + 1);
    *(float *)&double v13 = v37;
    *((float *)&v13 + 1) = self->_isoHeightScalar * (float)(v12 + v14);
    return vcvtms_u32_f32(vaddv_f32(vmul_f32(*(float32x2_t *)self->_isoRowVector, vsub_f32(*(float32x2_t *)&v13, *(float32x2_t *)self->_isoOrigin)))/ self->_isoRowHeight);
  }
  uint64_t v19 = [(SKTileMapNode *)self tileSet];
  uint64_t v20 = [v19 type];

  if (v20 == 2)
  {
    v21.f64[0] = x;
    v21.f64[1] = y;
    float32x2_t v22 = vcvt_f32_f64(v21);
    [(SKTileMapNode *)self anchorPoint];
    float64_t v39 = v23;
    [(SKTileMapNode *)self anchorPoint];
    v24.f64[0] = v39;
    v24.f64[1] = v25;
    float32x2_t v44 = vadd_f32(v22, vcvt_f32_f64(vmulq_f64(v24, vcvtq_f64_f32(*(float32x2_t *)&v41))));
    float hexRadius = self->_hexRadius;
    int v42 = -1;
    float height = self->_tileSize.height;
    double v28 = (int *)v43;
    double v29 = &v42;
LABEL_10:
    getHexIndexFromPoint(&v44, v28, v29, hexRadius, height);
    return v42;
  }
  double v30 = [(SKTileMapNode *)self tileSet];
  uint64_t v31 = [v30 type];

  if (v31 == 3)
  {
    v32.f64[0] = y;
    v32.f64[1] = x;
    float32x2_t v33 = vcvt_f32_f64(v32);
    [(SKTileMapNode *)self anchorPoint];
    float64_t v40 = v34;
    [(SKTileMapNode *)self anchorPoint];
    v35.f64[1] = v40;
    float32x2_t v44 = vadd_f32(v33, vcvt_f32_f64(vmulq_f64(v35, vcvtq_f64_f32((float32x2_t)vrev64_s32(*(int32x2_t *)&v41)))));
    float hexRadius = self->_hexRadius;
    int v42 = -1;
    float height = self->_tileSize.width;
    double v28 = &v42;
    double v29 = (int *)v43;
    goto LABEL_10;
  }
  return -1;
}

- (CGPoint)centerOfTileAtColumn:(NSUInteger)column row:(NSUInteger)row
{
  double v7 = *MEMORY[0x263F00148];
  double v8 = *(double *)(MEMORY[0x263F00148] + 8);
  long long v35 = *((_OWORD *)self->_skcTileMapNode + 21);
  uint64_t v9 = [(SKTileMapNode *)self tileSet];
  if (v9
    && (float v10 = (void *)v9,
        [(SKTileMapNode *)self tileSet],
        double v11 = objc_claimAutoreleasedReturnValue(),
        uint64_t v12 = [v11 type],
        v11,
        v10,
        v12))
  {
    double v13 = [(SKTileMapNode *)self tileSet];
    uint64_t v14 = [v13 type];

    if (v14 == 1)
    {
      float32x2_t v15 = vmla_n_f32(vmla_n_f32(*(float32x2_t *)self->_isoOrigin, vmul_n_f32(*(float32x2_t *)self->_isoColumnVector, self->_isoColumnWidth), (float)column + 0.5), vmul_n_f32(*(float32x2_t *)self->_isoRowVector, self->_isoRowHeight), (float)row + 0.5);
      double v7 = v15.f32[0];
      double v8 = (float)(v15.f32[1] / self->_isoHeightScalar);
    }
    else
    {
      double v23 = [(SKTileMapNode *)self tileSet];
      uint64_t v24 = [v23 type];

      if (v24 == 2)
      {
        double v25 = (double)column * self->_hexRadius;
        [(SKTileMapNode *)self tileSize];
        double v7 = v26 * 0.5 + v25 * 1.5;
        [(SKTileMapNode *)self tileSize];
        double v8 = ((double)row + 0.5) * v27;
        if (column)
        {
          [(SKTileMapNode *)self tileSize];
          double v8 = v8 + v28 * 0.5;
        }
      }
      else
      {
        double v29 = [(SKTileMapNode *)self tileSet];
        uint64_t v30 = [v29 type];

        if (v30 == 3)
        {
          [(SKTileMapNode *)self tileSize];
          double v7 = ((double)column + 0.5) * v31;
          double v32 = (double)row * self->_hexRadius;
          [(SKTileMapNode *)self tileSize];
          double v8 = v33 * 0.5 + v32 * 1.5;
          if (row)
          {
            [(SKTileMapNode *)self tileSize];
            double v7 = v7 + v34 * 0.5;
          }
        }
      }
    }
  }
  else
  {
    [(SKTileMapNode *)self tileSize];
    double v7 = ((double)column + 0.5) * v16;
    [(SKTileMapNode *)self tileSize];
    double v8 = ((double)row + 0.5) * v17;
  }
  [(SKTileMapNode *)self anchorPoint];
  double v19 = v7 - v18 * *(float *)&v35;
  [(SKTileMapNode *)self anchorPoint];
  double v21 = v8 - v20 * *((float *)&v35 + 1);
  double v22 = v19;
  result.double y = v21;
  result.double x = v22;
  return result;
}

- (id)createTileStampFromColumn:(unint64_t)a3 row:(unint64_t)a4 withWidth:(unint64_t)a5 height:(unint64_t)a6 addToTileSet:(BOOL)a7
{
  uint64_t v12 = [(SKTileMapNode *)self tileSet];
  if (!v12 || !self->_skcTileMapNode || [(SKTileMapNode *)self numberOfColumns] <= a3)
  {

    goto LABEL_18;
  }
  unint64_t v13 = [(SKTileMapNode *)self numberOfRows];

  if (v13 <= a4)
  {
LABEL_18:
    double v19 = 0;
    goto LABEL_19;
  }
  BOOL v27 = a7;
  if (a5 + a3 >= [(SKTileMapNode *)self numberOfColumns]) {
    a5 = [(SKTileMapNode *)self numberOfColumns] - a3;
  }
  unint64_t v14 = a6 + a4;
  if (a6 + a4 >= [(SKTileMapNode *)self numberOfRows])
  {
    unint64_t v14 = [(SKTileMapNode *)self numberOfRows];
    a6 = v14 - a4;
  }
  unint64_t v26 = a6;
  double v28 = malloc_type_malloc(4 * a5 * a6, 0x5B3CDE6EuLL);
  bzero(v28, 4 * a5 * a6);
  if (v14 > a4)
  {
    float32x2_t v15 = v28;
    do
    {
      double v16 = v15;
      int v17 = a3;
      unint64_t v18 = a5;
      if (a5 + a3 > a3)
      {
        do
        {
          *v16++ = SKCTileMapNode::getRawTile((SKCTileMapNode *)self->_skcTileMapNode, v17+ a4 * [(SKTileMapNode *)self numberOfColumns]);
          ++v17;
          --v18;
        }
        while (v18);
      }
      ++a4;
      v15 += a5;
    }
    while (a4 != v14);
  }
  double v19 = +[SKTileStamp tileStampWithWidth:height:tileData:](SKTileStamp, "tileStampWithWidth:height:tileData:", a5, v26, v28, v26);
  if (v27)
  {
    double v20 = (void *)MEMORY[0x263EFF980];
    double v21 = [(SKTileMapNode *)self tileSet];
    double v22 = [v21 stamps];
    double v23 = [v20 arrayWithArray:v22];

    [v23 addObject:v19];
    uint64_t v24 = [(SKTileMapNode *)self tileSet];
    [v24 setStamps:v23];
  }
  free(v28);
LABEL_19:

  return v19;
}

- (void)applyTileStamp:(id)a3 inColumn:(int64_t)a4 row:(int64_t)a5
{
  id v30 = a3;
  double v7 = [(SKTileMapNode *)self tileSet];
  if (v7
    && self->_skcTileMapNode
    && (int64_t)[(SKTileMapNode *)self numberOfColumns] > a4
    && (int64_t)[(SKTileMapNode *)self numberOfRows] > a5
    && [v30 numberOfColumns] + a4 >= 1)
  {
    uint64_t v8 = [v30 numberOfRows] + a5;

    if (v8 >= 1)
    {
      uint64_t v28 = [v30 tileData];
      uint64_t v29 = 0;
      int64_t v9 = a5;
      double v31 = self;
      while (v9 < (int64_t)[(SKTileMapNode *)self numberOfRows]
           && v9 < [v30 numberOfRows] + a5)
      {
        if ((v9 & 0x8000000000000000) == 0)
        {
          for (uint64_t i = 0; ; ++i)
          {
            uint64_t v11 = a4 + i;
            if (a4 + i >= (int64_t)[(SKTileMapNode *)self numberOfColumns]
              || v11 >= [v30 numberOfColumns] + a4)
            {
              break;
            }
            if ((v11 & 0x8000000000000000) == 0)
            {
              uint64_t v12 = [v30 numberOfColumns];
              int v13 = [(SKTileMapNode *)v31 numberOfColumns];
              unint64_t v14 = *(unsigned int *)(v28 + 4 * (i + v29 * v12));
              float32x2_t v15 = [(SKTileMapNode *)v31 tileSet];
              double v16 = [v15 tileGroups];
              unint64_t v17 = [v16 count];

              unint64_t v18 = [(SKTileMapNode *)v31 tileSet];
              double v19 = [v18 tileDefinitions];
              int v20 = v13;
              uint64_t v21 = i;
              unint64_t v22 = [v19 count];

              int v23 = v14 & 0x7FFF0000;
              if (v17 <= ((v14 >> 16) & 0x7FFF)) {
                int v23 = 2147418112;
              }
              if (v22 <= (unsigned __int16)v14) {
                int v24 = 0xFFFF;
              }
              else {
                int v24 = (unsigned __int16)v14;
              }
              uint64_t i = v21;
              SKCTileMapNode::setTile((SKCTileMapNode *)v31->_skcTileMapNode, a4 + v21 + v9 * v20, v24 | v23);
            }
            self = v31;
          }
        }
        ++v9;
        ++v29;
      }
      if ([(SKTileMapNode *)self enableAutomapping])
      {
        for (int64_t j = a5;
              j < (int64_t)[(SKTileMapNode *)self numberOfRows]
           && j < [v30 numberOfRows] + a5;
              ++j)
        {
          if ((j & 0x8000000000000000) == 0)
          {
            for (int64_t k = a4;
                  k < (int64_t)[(SKTileMapNode *)self numberOfColumns]
               && k < [v30 numberOfColumns] + a4;
                  ++k)
            {
              if ((k & 0x8000000000000000) == 0) {
                [(SKTileMapNode *)self updateTileGroupsAtX:k y:j];
              }
            }
          }
        }
      }
    }
  }
  else
  {
  }
}

- (id)tileDefinitionForTileID:(unsigned int)a3
{
  tileSet = self->_tileSet;
  if (tileSet
    && (unsigned __int16 v5 = a3,
        [(SKTileSet *)tileSet tileDefinitions],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        unint64_t v7 = [v6 count],
        v6,
        v7 > v5))
  {
    uint64_t v8 = [(SKTileSet *)self->_tileSet tileDefinitions];
    int64_t v9 = [v8 objectAtIndexedSubscript:v5];
  }
  else
  {
    int64_t v9 = 0;
  }

  return v9;
}

- (BOOL)shouldUnarchiveTileSet
{
  return 1;
}

- (void)forceRedraw
{
  skcTileMapNode = (SKCTileMapNode **)self->_skcTileMapNode;
  if (skcTileMapNode) {
    SKCTileMapNode::forceRedraw(skcTileMapNode, 1);
  }
}

- (SKAttributeValue)valueForAttributeNamed:(NSString *)key
{
  v5.receiver = self;
  v5.super_class = (Class)SKTileMapNode;
  uint64_t v3 = [(SKNode *)&v5 valueForAttributeNamed:key];

  return (SKAttributeValue *)v3;
}

- (void)setValue:(SKAttributeValue *)value forAttributeNamed:(NSString *)key
{
  v4.receiver = self;
  v4.super_class = (Class)SKTileMapNode;
  [(SKNode *)&v4 setValue:value forAttributeNamed:key];
}

+ (id)debugHierarchyPropertyDescriptions
{
  v26[13] = *MEMORY[0x263EF8340];
  float64x2_t v2 = (const CFDictionaryKeyCallBacks *)MEMORY[0x263EFFB78];
  uint64_t v3 = (const CFDictionaryValueCallBacks *)MEMORY[0x263EFFF90];
  Mutable = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(Mutable, @"propertyName", @"anchorPoint");
  CFDictionaryAddValue(Mutable, @"propertyRuntimeType", @"CGPoint");
  CFDictionaryAddValue(Mutable, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypePoint");
  CFDictionaryAddValue(Mutable, @"propertyFormat", @"CGf, CGf");
  int v24 = Mutable;
  v26[0] = Mutable;
  objc_super v5 = CFDictionaryCreateMutable(0, 7, v2, v3);
  CFDictionaryAddValue(v5, @"propertyName", @"color");
  CFDictionaryAddValue(v5, @"propertyRuntimeType", @"CGColor");
  CFDictionaryAddValue(v5, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeColor");
  CFDictionaryAddValue(v5, @"propertyFormat", @"color");
  int v23 = v5;
  v26[1] = v5;
  uint64_t v6 = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(v6, @"propertyName", @"colorBlendFactor");
  CFDictionaryAddValue(v6, @"propertyRuntimeType", @"CGFloat");
  CFDictionaryAddValue(v6, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v6, @"propertyFormat", @"CGf");
  unint64_t v22 = v6;
  v26[2] = v6;
  unint64_t v7 = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(v7, @"propertyName", @"enableAutomapping");
  CFDictionaryAddValue(v7, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v7, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v7, @"propertyFormat", @"b");
  uint64_t v21 = v7;
  v26[3] = v7;
  uint64_t v8 = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(v8, @"propertyName", @"lightingBitMask");
  CFDictionaryAddValue(v8, @"propertyRuntimeType", @"unsigned long");
  CFDictionaryAddValue(v8, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v8, @"propertyFormat", @"ul");
  v26[4] = v8;
  int64_t v9 = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(v9, @"propertyName", @"mapSize");
  CFDictionaryAddValue(v9, @"propertyRuntimeType", @"CGSize");
  CFDictionaryAddValue(v9, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeSize");
  CFDictionaryAddValue(v9, @"propertyFormat", @"CGf, CGf");
  v26[5] = v9;
  float v10 = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(v10, @"propertyName", @"numberOfColumns");
  CFDictionaryAddValue(v10, @"propertyRuntimeType", @"NSUInteger");
  CFDictionaryAddValue(v10, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v10, @"propertyFormat", @"uinteger");
  v26[6] = v10;
  uint64_t v11 = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(v11, @"propertyName", @"numberOfRows");
  CFDictionaryAddValue(v11, @"propertyRuntimeType", @"NSUInteger");
  CFDictionaryAddValue(v11, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v11, @"propertyFormat", @"uinteger");
  v26[7] = v11;
  uint64_t v12 = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(v12, @"propertyName", @"shader");
  CFDictionaryAddValue(v12, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeObjectInfo");
  CFDictionaryAddValue(v12, @"propertyFormat", @"objectInfo");
  v26[8] = v12;
  int v13 = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(v13, @"propertyName", @"tileSet");
  CFDictionaryAddValue(v13, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeObjectInfo");
  CFDictionaryAddValue(v13, @"propertyFormat", @"objectInfo");
  v26[9] = v13;
  unint64_t v14 = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(v14, @"propertyName", @"tileSize");
  CFDictionaryAddValue(v14, @"propertyRuntimeType", @"CGSize");
  CFDictionaryAddValue(v14, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeSize");
  CFDictionaryAddValue(v14, @"propertyFormat", @"CGf, CGf");
  v26[10] = v14;
  float32x2_t v15 = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(v15, @"propertyName", @"blendMode");
  CFDictionaryAddValue(v15, @"propertyRuntimeType", @"SKBlendMode");
  CFDictionaryAddValue(v15, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeEnum");
  CFDictionaryAddValue(v15, @"propertyFormat", @"integer");
  v26[11] = v15;
  double v16 = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(v16, @"propertyName", @"visualRepresentation");
  CFDictionaryAddValue(v16, @"propertyRuntimeType", @"CGImage");
  CFDictionaryAddValue(v16, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeImage");
  CFDictionaryAddValue(v16, @"propertyFormat", @"public.data");
  uint64_t valuePtr = 8;
  CFNumberRef v17 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v16, @"visibility", v17);
  CFRelease(v17);
  uint64_t valuePtr = 1;
  CFNumberRef v18 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v16, @"propertyOptions", v18);
  CFRelease(v18);
  v26[12] = v16;
  double v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:13];

  return v19;
}

+ (id)debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)Mutable
{
  v50[3] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v46 = a4;
  if ([v9 isEqualToString:@"visualRepresentation"])
  {
    Mutable = [v46 createDebugHierarchyVisualRepresentation];
    float v47 = @"propertyFormat";
    uint64_t v48 = *MEMORY[0x263F01AE0];
    *a5 = [NSDictionary dictionaryWithObjects:&v48 forKeys:&v47 count:1];
    goto LABEL_61;
  }
  if (![v9 isEqualToString:@"color"])
  {
    id v18 = v46;
    double v19 = (NSString *)v9;
    if ([(NSString *)v19 length])
    {
      NSSelectorFromString(v19);
      if (objc_opt_respondsToSelector())
      {
        int v20 = v19;
        if (v20)
        {
LABEL_16:
          Mutable = [v18 valueForKey:v20];
LABEL_60:

          goto LABEL_61;
        }
      }
      else
      {
        if ([(NSString *)v19 length] < 2)
        {
          int v24 = [(NSString *)v19 uppercaseString];
        }
        else
        {
          uint64_t v21 = [(NSString *)v19 substringToIndex:1];
          unint64_t v22 = [v21 uppercaseString];
          int v23 = [(NSString *)v19 substringFromIndex:1];
          int v24 = [v22 stringByAppendingString:v23];
        }
        double v33 = [@"is" stringByAppendingString:v24];
        NSSelectorFromString(v33);
        if (objc_opt_respondsToSelector()) {
          int v20 = v33;
        }
        else {
          int v20 = 0;
        }

        if (v20) {
          goto LABEL_16;
        }
      }
    }
    if (Mutable)
    {
      id v34 = v18;
      long long v35 = v19;
      if (v34)
      {
        float v36 = [NSString stringWithFormat:@"%@", v34];
      }
      else
      {
        float v36 = &stru_26BEEFD10;
      }
      if (v35) {
        float v37 = v35;
      }
      else {
        float v37 = &stru_26BEEFD10;
      }
      float v38 = v37;
      v49[0] = @"propertyName";
      v49[1] = @"objectDescription";
      v50[0] = v38;
      v50[1] = v36;
      v49[2] = @"errorDescription";
      v50[2] = &stru_26BEEFD10;
      float64_t v39 = [NSDictionary dictionaryWithObjects:v50 forKeys:v49 count:3];
      float64_t v40 = [MEMORY[0x263F087E8] errorWithDomain:@"DebugHierarchyErrorDomain" code:100 userInfo:v39];

      id v41 = v40;
      __CFDictionary *Mutable = v41;

      int v20 = 0;
      Mutable = 0;
    }
    else
    {
      int v20 = 0;
    }
    goto LABEL_60;
  }
  id v10 = [v46 color];
  uint64_t v11 = (CGColor *)[v10 CGColor];
  if (v11)
  {
    Mutable = (id *)CFDictionaryCreateMutable(0, 20, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
    space = CGColorGetColorSpace(v11);
    CFStringRef value = CGColorSpaceCopyName(space);
    size_t NumberOfComponents = CGColorGetNumberOfComponents(v11);
    uint64_t v13 = NumberOfComponents << 32;
    CFIndex v14 = (int)NumberOfComponents;
    if (NumberOfComponents << 32)
    {
      float32x2_t v15 = CFStringCreateMutable(0, 0);
      id v43 = v10;
      CFIndex v16 = v14 - 1;
      if ((unint64_t)v14 <= 1) {
        uint64_t v17 = 1;
      }
      else {
        uint64_t v17 = v14;
      }
      do
      {
        CFStringAppend(v15, @"CGf");
        if (v16) {
          CFStringAppend(v15, @", ");
        }
        --v16;
        --v17;
      }
      while (v17);
      id v10 = v43;
    }
    else
    {
      float32x2_t v15 = &stru_26BEEFD10;
    }
    Components = CGColorGetComponents(v11);
    unint64_t v26 = (const void **)malloc_type_malloc(v13 >> 29, 0x6004044C4A2DFuLL);
    BOOL v27 = v26;
    if (v13 >= 1)
    {
      if (v14 <= 1) {
        uint64_t v28 = 1;
      }
      else {
        uint64_t v28 = v14;
      }
      uint64_t v29 = (CFNumberRef *)v26;
      do
      {
        *v29++ = CFNumberCreate(0, kCFNumberCGFloatType, Components++);
        --v28;
      }
      while (v28);
    }
    CFArrayRef v30 = CFArrayCreate(0, v27, v14, MEMORY[0x263EFFF70]);
    if (v13 >= 1)
    {
      if (v14 <= 1) {
        uint64_t v31 = 1;
      }
      else {
        uint64_t v31 = v14;
      }
      double v32 = v27;
      do
      {
        CFRelease(*v32++);
        --v31;
      }
      while (v31);
    }
    free(v27);
    CGColorSpaceGetModel(space);
    if (v30) {
      CFDictionaryAddValue((CFMutableDictionaryRef)Mutable, @"componentValues", v30);
    }
    if (v15) {
      CFDictionaryAddValue((CFMutableDictionaryRef)Mutable, @"componentValuesFormat", v15);
    }
    if (value) {
      CFDictionaryAddValue((CFMutableDictionaryRef)Mutable, @"colorSpaceName", value);
    }
    if (v30) {
      CFRelease(v30);
    }
    if (value) {
      CFRelease(value);
    }
    if (v15) {
      CFRelease(v15);
    }
  }
  else
  {
    Mutable = 0;
  }

LABEL_61:

  return Mutable;
}

- (NSString)tileSetName
{
  return self->_tileSetName;
}

- (void)setTileSetName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tileSetName, 0);

  objc_storeStrong((id *)&self->_tileSet, 0);
}

@end