@interface ARUISpritesStaticBufferFactory
+ (id)spriteIndexBufferWithDevice:(id)a3;
+ (id)spritePositionsBufferWithDevice:(id)a3;
+ (void)clearCaches;
@end

@implementation ARUISpritesStaticBufferFactory

+ (id)spritePositionsBufferWithDevice:(id)a3
{
  v3 = (void *)__spriteVertexBuffer;
  if (!__spriteVertexBuffer)
  {
    id v4 = a3;
    v5 = malloc_type_malloc(0x80uLL, 0x10000406D1CE384uLL);
    *(_OWORD *)v5 = xmmword_21E189AF0;
    v5[2] = 0x3F80000000000000;
    *((_OWORD *)v5 + 2) = xmmword_21E189B00;
    __asm { FMOV            V0.2S, #1.0 }
    v5[6] = _D0;
    *((_OWORD *)v5 + 4) = xmmword_21E189B10;
    v5[10] = 0;
    *((_OWORD *)v5 + 6) = xmmword_21E189B20;
    v5[14] = 1065353216;
    uint64_t v11 = [v4 newBufferWithBytes:v5 length:128 options:0];

    v12 = (void *)__spriteVertexBuffer;
    __spriteVertexBuffer = v11;

    [(id)__spriteVertexBuffer setLabel:@"Sprite verticies"];
    free(v5);
    v3 = (void *)__spriteVertexBuffer;
  }

  return v3;
}

+ (id)spriteIndexBufferWithDevice:(id)a3
{
  v3 = (void *)__spriteIndexBuffer;
  if (!__spriteIndexBuffer)
  {
    id v4 = a3;
    v5 = malloc_type_malloc(0xCuLL, 0x1000040BDFB0063uLL);
    *(void *)v5 = 0x1000200010000;
    v5[2] = 196610;
    uint64_t v6 = [v4 newBufferWithBytes:v5 length:12 options:0];

    v7 = (void *)__spriteIndexBuffer;
    __spriteIndexBuffer = v6;

    [(id)__spriteIndexBuffer setLabel:@"Sprite indicies"];
    free(v5);
    v3 = (void *)__spriteIndexBuffer;
  }

  return v3;
}

+ (void)clearCaches
{
  v2 = (void *)__spriteVertexBuffer;
  if (__spriteVertexBuffer)
  {
    __spriteVertexBuffer = 0;
  }
  v3 = (void *)__spriteIndexBuffer;
  if (__spriteIndexBuffer)
  {
    __spriteIndexBuffer = 0;
  }
}

@end