@interface ARUIGridSpriteGenerator
+ (id)generatorWithSpriteCount:(unint64_t)a3 framesPerSprite:(unint64_t)a4 rowsPerSprite:(unint64_t)a5 columnsPerSprite:(unint64_t)a6;
- (ARUIGridSpriteGenerator)initWithSpriteCount:(unint64_t)a3 framesPerSprite:(unint64_t)a4 rowsPerSprite:(unint64_t)a5 columnsPerSprite:(unint64_t)a6;
- (__n64)originForSpriteAtIndex:(unint64_t)a3;
- (float32x2_t)frameSize;
- (id)generateSprites;
- (id)spriteAtIndex:(unint64_t)a3;
@end

@implementation ARUIGridSpriteGenerator

- (id)generateSprites
{
  v3 = [MEMORY[0x263EFF980] arrayWithCapacity:self->_spriteCount];
  if (self->_spriteCount)
  {
    unint64_t v4 = 0;
    do
    {
      v5 = [(ARUIGridSpriteGenerator *)self spriteAtIndex:v4];
      [v3 addObject:v5];

      ++v4;
    }
    while (v4 < self->_spriteCount);
  }

  return v3;
}

- (id)spriteAtIndex:(unint64_t)a3
{
  v5 = [ARUISprite alloc];
  unint64_t framesPerSprite = self->_framesPerSprite;
  unint64_t columnsPerSprite = self->_columnsPerSprite;
  [(ARUIGridSpriteGenerator *)self originForSpriteAtIndex:a3];
  double v9 = v8;
  [(ARUIGridSpriteGenerator *)self frameSize];
  v11 = [(ARUISprite *)v5 initWithFrameCount:framesPerSprite frameColumns:columnsPerSprite firstFrameOrigin:v9 frameSize:v10];

  return v11;
}

- (__n64)originForSpriteAtIndex:(unint64_t)a3
{
  result.n64_u32[0] = 0;
  result.n64_f32[1] = (float)a3 / (float)*(unint64_t *)(a1 + 8);
  return result;
}

- (float32x2_t)frameSize
{
  v1.i64[0] = a1[3];
  v1.i64[1] = a1[4] * a1[1];
  __asm { FMOV            V1.2D, #1.0 }
  return vcvt_f32_f64(vdivq_f64(_Q1, vcvtq_f64_u64(v1)));
}

+ (id)generatorWithSpriteCount:(unint64_t)a3 framesPerSprite:(unint64_t)a4 rowsPerSprite:(unint64_t)a5 columnsPerSprite:(unint64_t)a6
{
  v6 = [[ARUIGridSpriteGenerator alloc] initWithSpriteCount:a3 framesPerSprite:a4 rowsPerSprite:a5 columnsPerSprite:a6];

  return v6;
}

- (ARUIGridSpriteGenerator)initWithSpriteCount:(unint64_t)a3 framesPerSprite:(unint64_t)a4 rowsPerSprite:(unint64_t)a5 columnsPerSprite:(unint64_t)a6
{
  v11.receiver = self;
  v11.super_class = (Class)ARUIGridSpriteGenerator;
  __n64 result = [(ARUIGridSpriteGenerator *)&v11 init];
  if (result)
  {
    result->_spriteCount = a3;
    result->_unint64_t framesPerSprite = a4;
    result->_unint64_t columnsPerSprite = a6;
    result->_rowsPerSprite = a5;
  }
  return result;
}

@end