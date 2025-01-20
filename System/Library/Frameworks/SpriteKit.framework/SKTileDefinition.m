@interface SKTileDefinition
+ (BOOL)supportsSecureCoding;
+ (SKTileDefinition)tileDefinitionWithTexture:(SKTexture *)texture;
+ (SKTileDefinition)tileDefinitionWithTexture:(SKTexture *)texture normalTexture:(SKTexture *)normalTexture size:(CGSize)size;
+ (SKTileDefinition)tileDefinitionWithTexture:(SKTexture *)texture size:(CGSize)size;
+ (SKTileDefinition)tileDefinitionWithTextures:(NSArray *)textures normalTextures:(NSArray *)normalTextures size:(CGSize)size timePerFrame:(CGFloat)timePerFrame;
+ (SKTileDefinition)tileDefinitionWithTextures:(NSArray *)textures size:(CGSize)size timePerFrame:(CGFloat)timePerFrame;
- (BOOL)flipHorizontally;
- (BOOL)flipVertically;
- (BOOL)frameDidChange;
- (BOOL)isEqualToNode:(id)a3;
- (BOOL)nextFrameAffectsVertexBuffer;
- (CGFloat)timePerFrame;
- (CGSize)size;
- (NSArray)normalTextures;
- (NSArray)textures;
- (NSMutableDictionary)userData;
- (NSString)name;
- (NSString)uid;
- (NSUInteger)placementWeight;
- (SKTileDefinition)init;
- (SKTileDefinition)initWithCoder:(id)a3;
- (SKTileDefinition)initWithTexture:(SKTexture *)texture;
- (SKTileDefinition)initWithTexture:(SKTexture *)texture normalTexture:(SKTexture *)normalTexture size:(CGSize)size;
- (SKTileDefinition)initWithTexture:(SKTexture *)texture size:(CGSize)size;
- (SKTileDefinition)initWithTextures:(NSArray *)textures normalTextures:(NSArray *)normalTextures size:(CGSize)size timePerFrame:(CGFloat)timePerFrame;
- (SKTileDefinition)initWithTextures:(NSArray *)textures size:(CGSize)size timePerFrame:(CGFloat)timePerFrame;
- (SKTileDefinitionRotation)rotation;
- (SKTileGroupRule)parentRule;
- (double)lastTargetTime;
- (float)currentFrameTime;
- (id)copy;
- (id)copyWithZone:(_NSZone *)a3;
- (unsigned)currentFrameIndex;
- (void)encodeWithCoder:(id)a3;
- (void)setCurrentFrameIndex:(unsigned __int16)a3;
- (void)setCurrentFrameTime:(float)a3;
- (void)setDataWithTexture:(id)a3 normalTexture:(id)a4 tileName:(id)a5 size:(CGSize)a6;
- (void)setDataWithTextures:(id)a3 normalTextures:(id)a4 timePerFrame:(double)a5 tileName:(id)a6 size:(CGSize)a7;
- (void)setFlipHorizontally:(BOOL)flipHorizontally;
- (void)setFlipVertically:(BOOL)flipVertically;
- (void)setFrameDidChange:(BOOL)a3;
- (void)setLastTargetTime:(double)a3;
- (void)setName:(NSString *)name;
- (void)setNextFrameAffectsVertexBuffer:(BOOL)a3;
- (void)setNormalTextures:(NSArray *)normalTextures;
- (void)setParentRule:(id)a3;
- (void)setPlacementWeight:(NSUInteger)placementWeight;
- (void)setRotation:(SKTileDefinitionRotation)rotation;
- (void)setSize:(CGSize)size;
- (void)setTextures:(NSArray *)textures;
- (void)setTimePerFrame:(CGFloat)timePerFrame;
- (void)setUid:(id)a3;
- (void)setUserData:(NSMutableDictionary *)userData;
@end

@implementation SKTileDefinition

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)textures
{
  return (NSArray *)self->_textures;
}

- (void)setTextures:(NSArray *)textures
{
  v6 = textures;
  [(SKTileDefinition *)self willChangeValueForKey:@"images"];
  v4 = [MEMORY[0x263EFF980] arrayWithArray:v6];
  v5 = self->_textures;
  self->_textures = v4;

  [(SKTileDefinition *)self didChangeValueForKey:@"images"];
}

- (NSArray)normalTextures
{
  return (NSArray *)self->_normals;
}

- (SKTileDefinitionRotation)rotation
{
  return self->_orientation & 3;
}

- (void)setRotation:(SKTileDefinitionRotation)rotation
{
  self->_orientation = self->_orientation & 0xFFFFFFFFFFFFFFFCLL | rotation & 3;
}

- (BOOL)flipVertically
{
  return (LOBYTE(self->_orientation) >> 2) & 1;
}

- (void)setFlipVertically:(BOOL)flipVertically
{
  uint64_t v3 = 4;
  if (!flipVertically) {
    uint64_t v3 = 0;
  }
  self->_orientation = self->_orientation & 0xFFFFFFFFFFFFFFFBLL | v3;
}

- (BOOL)flipHorizontally
{
  return (LOBYTE(self->_orientation) >> 3) & 1;
}

- (void)setFlipHorizontally:(BOOL)flipHorizontally
{
  uint64_t v3 = 8;
  if (!flipHorizontally) {
    uint64_t v3 = 0;
  }
  self->_orientation = self->_orientation & 0xFFFFFFFFFFFFFFF7 | v3;
}

- (void)setNormalTextures:(NSArray *)normalTextures
{
  v6 = normalTextures;
  [(SKTileDefinition *)self willChangeValueForKey:@"normalTextures"];
  v4 = [MEMORY[0x263EFF980] arrayWithArray:v6];
  normals = self->_normals;
  self->_normals = v4;

  [(SKTileDefinition *)self didChangeValueForKey:@"normalTextures"];
}

- (SKTileDefinition)initWithCoder:(id)a3
{
  v29[7] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)SKTileDefinition;
  v5 = [(SKTileDefinition *)&v26 init];
  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    v29[0] = objc_opt_class();
    v29[1] = objc_opt_class();
    v29[2] = objc_opt_class();
    v29[3] = objc_opt_class();
    v29[4] = objc_opt_class();
    v29[5] = objc_opt_class();
    v29[6] = objc_opt_class();
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:7];
    [v6 addObjectsFromArray:v7];

    v8 = [v4 allowedClasses];
    [v6 unionSet:v8];

    v9 = (void *)MEMORY[0x263EFFA08];
    v28[0] = objc_opt_class();
    v28[1] = objc_opt_class();
    v28[2] = objc_opt_class();
    v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:3];
    v11 = [v9 setWithArray:v10];
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"_textures"];
    textures = v5->_textures;
    v5->_textures = (NSMutableArray *)v12;

    v14 = (void *)MEMORY[0x263EFFA08];
    v27[0] = objc_opt_class();
    v27[1] = objc_opt_class();
    v27[2] = objc_opt_class();
    v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:3];
    v16 = [v14 setWithArray:v15];
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"_normals"];
    normals = v5->_normals;
    v5->_normals = (NSMutableArray *)v17;

    v19 = [v4 decodeObjectOfClasses:v6 forKey:@"_userData"];
    [(SKTileDefinition *)v5 setUserData:v19];

    v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_uuid"];
    [(SKTileDefinition *)v5 setUid:v20];

    v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_name"];
    [(SKTileDefinition *)v5 setName:v21];

    [v4 decodeDoubleForKey:@"_width"];
    double v23 = v22;
    [v4 decodeDoubleForKey:@"_height"];
    -[SKTileDefinition setSize:](v5, "setSize:", v23, v24);
    [v4 decodeDoubleForKey:@"_timePerFrame"];
    -[SKTileDefinition setTimePerFrame:](v5, "setTimePerFrame:");
    -[SKTileDefinition setPlacementWeight:](v5, "setPlacementWeight:", [v4 decodeIntegerForKey:@"_placementWeight"]);
    v5->_orientation = [v4 decodeIntegerForKey:@"_orientation"];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  [v8 encodeObject:self->_textures forKey:@"_textures"];
  [v8 encodeObject:self->_normals forKey:@"_normals"];
  id v4 = [(SKTileDefinition *)self userData];
  [v8 encodeObject:v4 forKey:@"_userData"];

  v5 = [(SKTileDefinition *)self uid];
  [v8 encodeObject:v5 forKey:@"_uid"];

  id v6 = [(SKTileDefinition *)self name];
  [v8 encodeObject:v6 forKey:@"_name"];

  [(SKTileDefinition *)self size];
  objc_msgSend(v8, "encodeDouble:forKey:", @"_width");
  [(SKTileDefinition *)self size];
  [v8 encodeDouble:@"_height" forKey:v7];
  [(SKTileDefinition *)self timePerFrame];
  objc_msgSend(v8, "encodeDouble:forKey:", @"_timePerFrame");
  objc_msgSend(v8, "encodeInteger:forKey:", -[SKTileDefinition placementWeight](self, "placementWeight"), @"_placementWeight");
  [v8 encodeInteger:self->_orientation forKey:@"_orientation"];
}

- (BOOL)isEqualToNode:(id)a3
{
  id v4 = (SKTileDefinition *)a3;
  v5 = v4;
  if (self != v4)
  {
    id v6 = v4;
    if (self->_orientation != v6->_orientation) {
      goto LABEL_21;
    }
    [(SKTileDefinition *)self size];
    double v8 = v7;
    [(SKTileDefinition *)v6 size];
    if (v8 != v9) {
      goto LABEL_21;
    }
    [(SKTileDefinition *)self size];
    double v11 = v10;
    [(SKTileDefinition *)v6 size];
    if (v11 != v12) {
      goto LABEL_21;
    }
    v13 = [(SKTileDefinition *)self name];
    if (v13)
    {
    }
    else
    {
      v15 = [(SKTileDefinition *)v6 name];

      if (!v15)
      {
LABEL_10:
        if (self->_placementWeight == v6->_placementWeight)
        {
          float timePerFrame = self->_timePerFrame;
          float v20 = v6->_timePerFrame;
          if ((COERCE_UNSIGNED_INT(timePerFrame - v20) & 0x60000000) == 0)
          {
            v21 = [(SKTileDefinition *)self uid];
            if (v21)
            {
            }
            else
            {
              double v22 = [(SKTileDefinition *)v6 uid];

              if (!v22) {
                goto LABEL_16;
              }
            }
            double v23 = [(SKTileDefinition *)self uid];
            double v24 = [(SKTileDefinition *)v6 uid];
            char v25 = [v23 isEqualToString:v24];

            if (v25)
            {
LABEL_16:
              unint64_t v26 = 0;
              while ([(NSMutableArray *)self->_textures count] > v26)
              {
                if ([(NSMutableArray *)v6->_textures count] <= v26) {
                  goto LABEL_21;
                }
                v27 = [(NSMutableArray *)self->_textures objectAtIndexedSubscript:v26];
                v28 = [(NSMutableArray *)v6->_textures objectAtIndexedSubscript:v26];
                char v29 = [v27 isEqualToTexture:v28];

                BOOL v14 = 0;
                ++v26;
                if ((v29 & 1) == 0) {
                  goto LABEL_22;
                }
              }
              unint64_t v31 = 0;
              do
              {
                unint64_t v32 = [(NSMutableArray *)self->_normals count];
                BOOL v14 = v32 <= v31;
                if (v32 <= v31) {
                  break;
                }
                if ([(NSMutableArray *)v6->_normals count] <= v31) {
                  break;
                }
                v33 = [(NSMutableArray *)self->_normals objectAtIndexedSubscript:v31];
                v34 = [(NSMutableArray *)v6->_normals objectAtIndexedSubscript:v31];
                char v35 = [v33 isEqualToTexture:v34];

                ++v31;
              }
              while ((v35 & 1) != 0);
              goto LABEL_22;
            }
          }
        }
LABEL_21:
        BOOL v14 = 0;
LABEL_22:

        goto LABEL_23;
      }
    }
    v16 = [(SKTileDefinition *)self name];
    uint64_t v17 = [(SKTileDefinition *)v6 name];
    char v18 = [v16 isEqualToString:v17];

    if ((v18 & 1) == 0) {
      goto LABEL_21;
    }
    goto LABEL_10;
  }
  BOOL v14 = 1;
LABEL_23:

  return v14;
}

- (id)copy
{
  uint64_t v3 = MEMORY[0x21052E6F0](self, a2);

  return [(SKTileDefinition *)self copyWithZone:v3];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = v4;
  if (v4)
  {
    [v4 setTextures:self->_textures];
    [v5 setNormalTextures:self->_normals];
    id v6 = [(SKTileDefinition *)self uid];
    [v5 setUid:v6];

    [(SKTileDefinition *)self size];
    objc_msgSend(v5, "setSize:");
    [(SKTileDefinition *)self timePerFrame];
    objc_msgSend(v5, "setTimePerFrame:");
    objc_msgSend(v5, "setPlacementWeight:", -[SKTileDefinition placementWeight](self, "placementWeight"));
  }
  return v5;
}

- (void)setDataWithTexture:(id)a3 normalTexture:(id)a4 tileName:(id)a5 size:(CGSize)a6
{
  double height = a6.height;
  double width = a6.width;
  id v17 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = [MEMORY[0x263EFF980] array];
  textures = self->_textures;
  self->_textures = v13;

  if (v17) {
    [(NSMutableArray *)self->_textures addObject:v17];
  }
  v15 = [MEMORY[0x263EFF980] array];
  normals = self->_normals;
  self->_normals = v15;

  if (v11) {
    [(NSMutableArray *)self->_normals addObject:v11];
  }
  [v17 setFilteringMode:0];
  self->_float timePerFrame = 0.0;
  [(SKTileDefinition *)self setName:v12];
  -[SKTileDefinition setSize:](self, "setSize:", width, height);
  [(SKTileDefinition *)self setPlacementWeight:1];
}

- (void)setDataWithTextures:(id)a3 normalTextures:(id)a4 timePerFrame:(double)a5 tileName:(id)a6 size:(CGSize)a7
{
  double height = a7.height;
  double width = a7.width;
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  v16 = [MEMORY[0x263EFF980] arrayWithArray:v13];
  textures = self->_textures;
  self->_textures = v16;

  char v18 = [MEMORY[0x263EFF980] arrayWithArray:v14];
  normals = self->_normals;
  self->_normals = v18;

  self->_float timePerFrame = a5;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  float v20 = self->_textures;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v27;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v27 != v22) {
          objc_enumerationMutation(v20);
        }
        objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * v23++), "setFilteringMode:", 0, (void)v26);
      }
      while (v21 != v23);
      uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v21);
  }

  [(SKTileDefinition *)self setName:v15];
  double v24 = [MEMORY[0x263F08C38] UUID];
  char v25 = [v24 UUIDString];
  [(SKTileDefinition *)self setUid:v25];

  -[SKTileDefinition setSize:](self, "setSize:", width, height);
  self->_orientation = 0;
}

- (SKTileDefinition)init
{
  v5.receiver = self;
  v5.super_class = (Class)SKTileDefinition;
  v2 = [(SKTileDefinition *)&v5 init];
  uint64_t v3 = v2;
  if (v2) {
    -[SKTileDefinition setDataWithTexture:normalTexture:tileName:size:](v2, "setDataWithTexture:normalTexture:tileName:size:", 0, 0, 0, *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
  }
  return v3;
}

- (SKTileDefinition)initWithTexture:(SKTexture *)texture
{
  id v4 = texture;
  v7.receiver = self;
  v7.super_class = (Class)SKTileDefinition;
  objc_super v5 = [(SKTileDefinition *)&v7 init];
  if (v5)
  {
    [(SKTexture *)v4 size];
    -[SKTileDefinition setDataWithTexture:normalTexture:tileName:size:](v5, "setDataWithTexture:normalTexture:tileName:size:", v4, 0, 0);
  }

  return v5;
}

- (SKTileDefinition)initWithTexture:(SKTexture *)texture size:(CGSize)size
{
  double height = size.height;
  double width = size.width;
  objc_super v7 = texture;
  v11.receiver = self;
  v11.super_class = (Class)SKTileDefinition;
  double v8 = [(SKTileDefinition *)&v11 init];
  double v9 = v8;
  if (v8) {
    -[SKTileDefinition setDataWithTexture:normalTexture:tileName:size:](v8, "setDataWithTexture:normalTexture:tileName:size:", v7, 0, 0, width, height);
  }

  return v9;
}

- (SKTileDefinition)initWithTexture:(SKTexture *)texture normalTexture:(SKTexture *)normalTexture size:(CGSize)size
{
  double height = size.height;
  double width = size.width;
  double v9 = texture;
  double v10 = normalTexture;
  v14.receiver = self;
  v14.super_class = (Class)SKTileDefinition;
  objc_super v11 = [(SKTileDefinition *)&v14 init];
  id v12 = v11;
  if (v11) {
    -[SKTileDefinition setDataWithTexture:normalTexture:tileName:size:](v11, "setDataWithTexture:normalTexture:tileName:size:", v9, v10, 0, width, height);
  }

  return v12;
}

- (SKTileDefinition)initWithTextures:(NSArray *)textures size:(CGSize)size timePerFrame:(CGFloat)timePerFrame
{
  double height = size.height;
  double width = size.width;
  double v9 = textures;
  v13.receiver = self;
  v13.super_class = (Class)SKTileDefinition;
  double v10 = [(SKTileDefinition *)&v13 init];
  objc_super v11 = v10;
  if (v10) {
    -[SKTileDefinition setDataWithTextures:normalTextures:timePerFrame:tileName:size:](v10, "setDataWithTextures:normalTextures:timePerFrame:tileName:size:", v9, MEMORY[0x263EFFA68], 0, timePerFrame, width, height);
  }

  return v11;
}

- (SKTileDefinition)initWithTextures:(NSArray *)textures normalTextures:(NSArray *)normalTextures size:(CGSize)size timePerFrame:(CGFloat)timePerFrame
{
  double height = size.height;
  double width = size.width;
  objc_super v11 = textures;
  id v12 = normalTextures;
  v16.receiver = self;
  v16.super_class = (Class)SKTileDefinition;
  objc_super v13 = [(SKTileDefinition *)&v16 init];
  objc_super v14 = v13;
  if (v13) {
    -[SKTileDefinition setDataWithTextures:normalTextures:timePerFrame:tileName:size:](v13, "setDataWithTextures:normalTextures:timePerFrame:tileName:size:", v11, v12, 0, timePerFrame, width, height);
  }

  return v14;
}

+ (SKTileDefinition)tileDefinitionWithTexture:(SKTexture *)texture
{
  uint64_t v3 = texture;
  id v4 = [[SKTileDefinition alloc] initWithTexture:v3];

  return v4;
}

+ (SKTileDefinition)tileDefinitionWithTexture:(SKTexture *)texture size:(CGSize)size
{
  double height = size.height;
  double width = size.width;
  id v6 = texture;
  objc_super v7 = -[SKTileDefinition initWithTexture:size:]([SKTileDefinition alloc], "initWithTexture:size:", v6, width, height);

  return v7;
}

+ (SKTileDefinition)tileDefinitionWithTexture:(SKTexture *)texture normalTexture:(SKTexture *)normalTexture size:(CGSize)size
{
  double height = size.height;
  double width = size.width;
  double v8 = texture;
  double v9 = normalTexture;
  double v10 = -[SKTileDefinition initWithTexture:normalTexture:size:]([SKTileDefinition alloc], "initWithTexture:normalTexture:size:", v8, v9, width, height);

  return v10;
}

+ (SKTileDefinition)tileDefinitionWithTextures:(NSArray *)textures size:(CGSize)size timePerFrame:(CGFloat)timePerFrame
{
  double height = size.height;
  double width = size.width;
  double v8 = textures;
  double v9 = -[SKTileDefinition initWithTextures:size:timePerFrame:]([SKTileDefinition alloc], "initWithTextures:size:timePerFrame:", v8, width, height, timePerFrame);

  return v9;
}

+ (SKTileDefinition)tileDefinitionWithTextures:(NSArray *)textures normalTextures:(NSArray *)normalTextures size:(CGSize)size timePerFrame:(CGFloat)timePerFrame
{
  double height = size.height;
  double width = size.width;
  double v10 = textures;
  objc_super v11 = normalTextures;
  id v12 = -[SKTileDefinition initWithTextures:normalTextures:size:timePerFrame:]([SKTileDefinition alloc], "initWithTextures:normalTextures:size:timePerFrame:", v10, v11, width, height, timePerFrame);

  return v12;
}

- (NSMutableDictionary)userData
{
  return self->_userData;
}

- (void)setUserData:(NSMutableDictionary *)userData
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(NSString *)name
{
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSize:(CGSize)size
{
  self->_size = size;
}

- (CGFloat)timePerFrame
{
  return self->_timePerFrame;
}

- (void)setTimePerFrame:(CGFloat)timePerFrame
{
  self->_float timePerFrame = timePerFrame;
}

- (NSUInteger)placementWeight
{
  return self->_placementWeight;
}

- (void)setPlacementWeight:(NSUInteger)placementWeight
{
  self->_placementWeight = placementWeight;
}

- (SKTileGroupRule)parentRule
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentRule);

  return (SKTileGroupRule *)WeakRetained;
}

- (void)setParentRule:(id)a3
{
}

- (NSString)uid
{
  return self->_uid;
}

- (void)setUid:(id)a3
{
}

- (unsigned)currentFrameIndex
{
  return self->_currentFrameIndex;
}

- (void)setCurrentFrameIndex:(unsigned __int16)a3
{
  self->_currentFrameIndex = a3;
}

- (double)lastTargetTime
{
  return self->_lastTargetTime;
}

- (void)setLastTargetTime:(double)a3
{
  self->_lastTargetTime = a3;
}

- (float)currentFrameTime
{
  return self->_currentFrameTime;
}

- (void)setCurrentFrameTime:(float)a3
{
  self->_currentFrameTime = a3;
}

- (BOOL)frameDidChange
{
  return self->_frameDidChange;
}

- (void)setFrameDidChange:(BOOL)a3
{
  self->_frameDidChange = a3;
}

- (BOOL)nextFrameAffectsVertexBuffer
{
  return self->_nextFrameAffectsVertexBuffer;
}

- (void)setNextFrameAffectsVertexBuffer:(BOOL)a3
{
  self->_nextFrameAffectsVertexBuffer = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uid, 0);
  objc_destroyWeak((id *)&self->_parentRule);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_userData, 0);
  objc_storeStrong((id *)&self->_normals, 0);

  objc_storeStrong((id *)&self->_textures, 0);
}

@end