@interface SKPhysicsGrid
+ (id)gridFromOccupancyArray:(const char *)a3 width:(int)a4 height:(int)a5;
+ (id)gridFromTexture:(id)a3 alphaThreshold:(float)a4 accuracy:(float)a5;
+ (id)vectorGridFromTexture:(id)a3 accuracy:(float)a4;
- (float)height;
- (float)width;
- (void)spritesFromGrid:(id)a3 gridSize:(CGSize)a4 zPosition:(double)a5 edgeColor:(id)a6 interiorColor:(id)a7 spriteSize:(CGSize)a8 physicsBody:(id)a9;
- (void)spritesFromGrid:(id)a3 xDivisions:(int)a4 zPosition:(double)a5 spriteSize:(CGSize)a6 texture:(id)a7 physicsBody:(id)a8;
@end

@implementation SKPhysicsGrid

+ (id)gridFromOccupancyArray:(const char *)a3 width:(int)a4 height:(int)a5
{
  return (id)[MEMORY[0x263F5E558] gridFromOccupancyArray:a3 bytePitch:1 width:*(void *)&a4 height:*(void *)&a5];
}

+ (id)gridFromTexture:(id)a3 alphaThreshold:(float)a4 accuracy:(float)a5
{
  id v7 = a3;
  v8 = v7;
  LODWORD(v9) = 981668463;
  LODWORD(v10) = 1.0;
  if (a5 <= 1.0) {
    *(float *)&double v10 = a5;
  }
  if (a5 >= 0.001) {
    float v11 = *(float *)&v10;
  }
  else {
    float v11 = 0.001;
  }
  v12 = (CGImage *)objc_msgSend(v7, "_newTextureFromGLCache", v9, v10);
  v13 = v12;
  if (v12)
  {
    DataProvider = CGImageGetDataProvider(v12);
    CFDataRef v15 = CGDataProviderCopyData(DataProvider);
    BytePtr = CFDataGetBytePtr(v15);
    size_t Width = CGImageGetWidth(v13);
    size_t Height = CGImageGetHeight(v13);
    *(float *)&double v19 = a4;
    *(float *)&double v20 = v11;
    v21 = [MEMORY[0x263F5E558] gridFromRGBAU8PixelData:BytePtr imageWidth:(int)(float)Width imageHeight:(int)(float)Height alphaThreshold:v19 accuracy:v20];
    CGImageRelease(v13);
    CFRelease(v15);
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

+ (id)vectorGridFromTexture:(id)a3 accuracy:(float)a4
{
  id v5 = a3;
  v6 = v5;
  LODWORD(v7) = 981668463;
  LODWORD(v8) = 1.0;
  if (a4 <= 1.0) {
    *(float *)&double v8 = a4;
  }
  if (a4 >= 0.001) {
    float v9 = *(float *)&v8;
  }
  else {
    float v9 = 0.001;
  }
  double v10 = (CGImage *)objc_msgSend(v5, "_createCGImage", v7, v8);
  float v11 = v10;
  if (v10)
  {
    DataProvider = CGImageGetDataProvider(v10);
    CFDataRef v13 = CGDataProviderCopyData(DataProvider);
    BytePtr = CFDataGetBytePtr(v13);
    size_t Width = CGImageGetWidth(v11);
    size_t Height = CGImageGetHeight(v11);
    *(float *)&double v17 = v9;
    v18 = [MEMORY[0x263F5E558] vectorGridFromRGBAU8PixelData:BytePtr imageWidth:(int)(float)Width imageHeight:(int)(float)Height accuracy:v17];
    CGImageRelease(v11);
    CFRelease(v13);
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (void)spritesFromGrid:(id)a3 gridSize:(CGSize)a4 zPosition:(double)a5 edgeColor:(id)a6 interiorColor:(id)a7 spriteSize:(CGSize)a8 physicsBody:(id)a9
{
  double height = a8.height;
  double width = a8.width;
  double v15 = a4.height;
  double v16 = a4.width;
  id v36 = a3;
  id v18 = a6;
  id v19 = a7;
  id v20 = a9;
  if (v36)
  {
    [(SKPhysicsGrid *)self height];
    float v22 = v21;
    [(SKPhysicsGrid *)self width];
    float v24 = v23;
    v25 = self;
    if ((int)v22 >= 1)
    {
      uint64_t v26 = 0;
      int v27 = (int)v24;
      do
      {
        if (v27 >= 1)
        {
          uint64_t v28 = 0;
          do
          {
            int v29 = [(SKPhysicsGrid *)v25 gridDataAtX:v28 y:v26 z:1];
            if (v29)
            {
              if (v29 == 2) {
                id v30 = v19;
              }
              else {
                id v30 = v18;
              }
              v31 = +[SKSpriteNode spriteNodeWithColor:size:](SKSpriteNode, "spriteNodeWithColor:size:", v30, width, height);
              [(SKPhysicsGrid *)v25 width];
              float v33 = v32;
              [(SKPhysicsGrid *)v25 height];
              objc_msgSend(v31, "setPosition:", v16 * (float)((float)(int)v28 / v33), v15 * (float)((float)(int)v26 / v34));
              [v31 setZPosition:a5];
              v35 = (void *)[v20 copy];
              [v31 setPhysicsBody:v35];

              [v36 addChild:v31];
            }
            uint64_t v28 = (v28 + 5);
          }
          while ((int)v28 < v27);
        }
        uint64_t v26 = (v26 + 5);
      }
      while ((int)v26 < (int)v22);
    }
  }
  else
  {
    NSLog(&cfstr_CanTCreateGrid.isa);
  }
}

- (void)spritesFromGrid:(id)a3 xDivisions:(int)a4 zPosition:(double)a5 spriteSize:(CGSize)a6 texture:(id)a7 physicsBody:(id)a8
{
  double height = a6.height;
  double width = a6.width;
  id v31 = a3;
  id v12 = a7;
  id v13 = a8;
  HIDWORD(v26) = a4;
  if (a4 >= 1 && v31 && v12)
  {
    float v14 = height / width;
    double v15 = self;
    *(float *)&uint64_t v26 = v14;
    if (v14 > 0.0)
    {
      float v16 = 1.0 / (float)a4;
      float v17 = 0.0;
      do
      {
        uint64_t v18 = (int)v17;
        float v28 = v17;
        double v19 = v17;
        double v20 = height * v17;
        int v21 = HIDWORD(v26);
        float v22 = 0.0;
        do
        {
          float v22 = v16 + v22;
          if (-[SKPhysicsGrid isGridRegionOccupied:y:width:height:](v15, "isGridRegionOccupied:y:width:height:", (int)v22, v18, (int)v16, (int)v16, v26))
          {
            float v23 = +[SKTexture textureWithRect:inTexture:](SKTexture, "textureWithRect:inTexture:", v12, v22, v19, v16, v16);
            float v24 = +[SKSpriteNode spriteNodeWithTexture:size:](SKSpriteNode, "spriteNodeWithTexture:size:", v23, width * v16, height * v16);
            objc_msgSend(v24, "setPosition:", width * v22, v20);
            [v24 setZPosition:a5];
            v25 = (void *)[v13 copy];
            [v24 setPhysicsBody:v25];

            [v31 addChild:v24];
          }
          --v21;
        }
        while (v21);
        float v17 = v16 + v28;
      }
      while ((float)(v16 + v28) < *(float *)&v26);
    }
  }
  else
  {
    NSLog(&cfstr_CanTCreateGrid_0.isa);
  }
}

- (float)width
{
  return self->_width;
}

- (float)height
{
  return self->_height;
}

@end