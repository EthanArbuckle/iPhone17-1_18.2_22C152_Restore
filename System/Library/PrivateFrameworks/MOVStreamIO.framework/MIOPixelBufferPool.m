@interface MIOPixelBufferPool
+ (id)createMIOPixelBufferPoolWithWidth:(unint64_t)a3 height:(unint64_t)a4 pixelFormat:(unsigned int)a5;
+ (id)createMIOPixelBufferPoolWithWidth:(unint64_t)a3 height:(unint64_t)a4 pixelFormat:(unsigned int)a5 exactBytesPerRow:(unint64_t)a6 minBufferCount:(unint64_t)a7;
+ (id)createMIOPixelBufferPoolWithWidth:(unint64_t)a3 height:(unint64_t)a4 pixelFormat:(unsigned int)a5 exactBytesPerRow:(unint64_t)a6 minBufferCount:(unint64_t)a7 bufferCacheMode:(int)a8;
+ (id)createMIOPixelBufferPoolWithWidth:(unint64_t)a3 height:(unint64_t)a4 pixelFormat:(unsigned int)a5 exactBytesPerRows:(id)a6 minBufferCount:(unint64_t)a7;
+ (id)createMIOPixelBufferPoolWithWidth:(unint64_t)a3 height:(unint64_t)a4 pixelFormat:(unsigned int)a5 exactBytesPerRows:(id)a6 minBufferCount:(unint64_t)a7 bufferCacheMode:(int)a8;
+ (id)createMIOPixelBufferPoolWithWidth:(unint64_t)a3 height:(unint64_t)a4 pixelFormat:(unsigned int)a5 extendedPixelsPerRow:(unint64_t)a6 minBufferCount:(unint64_t)a7;
+ (id)createMIOPixelBufferPoolWithWidth:(unint64_t)a3 height:(unint64_t)a4 pixelFormat:(unsigned int)a5 extendedPixelsPerRow:(unint64_t)a6 minBufferCount:(unint64_t)a7 bufferCacheMode:(int)a8;
+ (id)createMIOPixelBufferPoolWithWidth:(unint64_t)a3 height:(unint64_t)a4 pixelFormat:(unsigned int)a5 minBufferCount:(unint64_t)a6;
+ (id)createMIOPixelBufferPoolWithWidth:(unint64_t)a3 height:(unint64_t)a4 pixelFormat:(unsigned int)a5 minBufferCount:(unint64_t)a6 bufferCacheMode:(int)a7;
+ (id)createMIOPixelBufferPoolWithWidth:(unint64_t)a3 height:(unint64_t)a4 pixelFormat:(unsigned int)a5 minBufferCount:(unint64_t)a6 maxBufferCount:(unint64_t)a7 bufferCacheMode:(int)a8;
+ (id)createNewL008MIOPixelBufferPoolWithReferencePixelBuffer:(__CVBuffer *)a3 minBufferCount:(unint64_t)a4 bufferCacheMode:(int)a5;
+ (id)createNewL010MIOPixelBufferPoolWithReferencePixelBuffer:(__CVBuffer *)a3 minBufferCount:(unint64_t)a4 bufferCacheMode:(int)a5;
+ (id)makeBufferConfigDict:(unint64_t)a3 height:(unint64_t)a4 pixelFormat:(unsigned int)a5 bufferCacheMode:(int)a6;
- (MIOPixelBufferPool)initWithPixelBuffer:(__CVBuffer *)a3 bufferAttributes:(__CFDictionary *)a4 poolAttributes:(__CFDictionary *)a5 error:(id *)a6;
- (NSDictionary)poolAttributes;
- (__CVBuffer)getPixelBuffer;
- (__CVPixelBufferPool)pixelBufferPool;
- (double)getMaximumBufferAge;
- (unint64_t)getAllocationThreshold;
- (unint64_t)getMinimumBufferCount;
- (void)dealloc;
- (void)flush;
- (void)setPixelBufferPool:(__CVPixelBufferPool *)a3;
- (void)setPoolAttributes:(id)a3;
@end

@implementation MIOPixelBufferPool

+ (id)makeBufferConfigDict:(unint64_t)a3 height:(unint64_t)a4 pixelFormat:(unsigned int)a5 bufferCacheMode:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v7 = *(void *)&a5;
  v10 = [MEMORY[0x263EFF9A0] dictionary];
  v11 = [NSNumber numberWithUnsignedLong:a3];
  [v10 setObject:v11 forKey:*MEMORY[0x263F04240]];

  v12 = [NSNumber numberWithUnsignedLong:a4];
  [v10 setObject:v12 forKey:*MEMORY[0x263F04118]];

  v13 = [NSNumber numberWithUnsignedInt:v7];
  [v10 setObject:v13 forKey:*MEMORY[0x263F04180]];

  v14 = NSDictionary;
  v15 = [NSNumber numberWithInt:v6];
  v16 = [v14 dictionaryWithObject:v15 forKey:*MEMORY[0x263F0ED58]];

  [v10 setObject:v16 forKey:*MEMORY[0x263F04130]];

  return v10;
}

- (MIOPixelBufferPool)initWithPixelBuffer:(__CVBuffer *)a3 bufferAttributes:(__CFDictionary *)a4 poolAttributes:(__CFDictionary *)a5 error:(id *)a6
{
  extraColumnsOnLeft[3] = *MEMORY[0x263EF8340];
  v34.receiver = self;
  v34.super_class = (Class)MIOPixelBufferPool;
  v10 = [(MIOPixelBufferPool *)&v34 init];
  if (!v10) {
    goto LABEL_17;
  }
  v11 = [MEMORY[0x263EFF9A0] dictionary];
  if (a3)
  {
    v12 = [NSNumber numberWithUnsignedLong:CVPixelBufferGetHeight(a3)];
    [v11 setObject:v12 forKey:*MEMORY[0x263F04118]];

    v13 = [NSNumber numberWithUnsignedLong:CVPixelBufferGetWidth(a3)];
    [v11 setObject:v13 forKey:*MEMORY[0x263F04240]];

    v14 = [NSNumber numberWithUnsignedInt:CVPixelBufferGetPixelFormatType(a3)];
    [v11 setObject:v14 forKey:*MEMORY[0x263F04180]];

    v15 = [NSNumber numberWithUnsignedLong:CVPixelBufferGetBytesPerRow(a3)];
    [v11 setObject:v15 forKey:*MEMORY[0x263F04078]];

    extraColumnsOnLeft[0] = 0;
    size_t extraRowsOnTop = 0;
    size_t extraColumnsOnRight = 0;
    size_t extraRowsOnBottom = 0;
    CVPixelBufferGetExtendedPixels(a3, extraColumnsOnLeft, &extraColumnsOnRight, &extraRowsOnTop, &extraRowsOnBottom);
    v16 = [NSNumber numberWithUnsignedLong:extraColumnsOnLeft[0]];
    [v11 setObject:v16 forKey:*MEMORY[0x263F040E8]];

    v17 = [NSNumber numberWithUnsignedLong:extraColumnsOnRight];
    [v11 setObject:v17 forKey:*MEMORY[0x263F040F8]];

    v18 = [NSNumber numberWithUnsignedLong:extraRowsOnTop];
    [v11 setObject:v18 forKey:*MEMORY[0x263F04100]];

    v19 = [NSNumber numberWithUnsignedLong:extraRowsOnBottom];
    [v11 setObject:v19 forKey:*MEMORY[0x263F040D8]];
  }
  else if (a6)
  {
    uint64_t v22 = 0;
    size_t v23 = *MEMORY[0x263F04118];
    extraColumnsOnLeft[0] = *MEMORY[0x263F04240];
    extraColumnsOnLeft[1] = v23;
    extraColumnsOnLeft[2] = *MEMORY[0x263F04180];
    while (1)
    {
      v24 = (void *)extraColumnsOnLeft[v22];
      if ((!a4 || !CFDictionaryContainsKey(a4, (const void *)extraColumnsOnLeft[v22]))
        && (!a5 || !CFDictionaryContainsKey(a5, v24)))
      {
        break;
      }
      if (++v22 == 3)
      {
        *a6 = 0;
        goto LABEL_4;
      }
    }
    id v28 = v24;
    v29 = (void *)MEMORY[0x263F087E8];
    v30 = objc_msgSend(@"Minimum PixelBufferPool attributes not satistfied, missing key: ", "stringByAppendingString:", v28);
    *a6 = [v29 mioPixelBufferPoolErrorWithMessage:v30 code:1];
  }
LABEL_4:
  if (a4) {
    [v11 addEntriesFromDictionary:a4];
  }
  uint64_t v20 = CVPixelBufferPoolCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], a5, (CFDictionaryRef)v11, &v10->_pixelBufferPool);
  if (!v20)
  {
    uint64_t v25 = CVPixelBufferPoolGetAttributes(v10->_pixelBufferPool);
    poolAttributes = v10->_poolAttributes;
    v10->_poolAttributes = (NSDictionary *)v25;

LABEL_17:
    v21 = v10;
    goto LABEL_18;
  }
  NSLog(&cfstr_ErrorCreatingU.isa, v20);

  v21 = 0;
LABEL_18:

  return v21;
}

- (__CVBuffer)getPixelBuffer
{
  CVPixelBufferPoolRetain(self->_pixelBufferPool);
  CVPixelBufferRef pixelBufferOut = 0;
  v3 = [(NSDictionary *)self->_poolAttributes valueForKey:@"BufferPoolAllocationThreshold"];

  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  pixelBufferPool = self->_pixelBufferPool;
  if (v3) {
    CVReturn v6 = CVPixelBufferPoolCreatePixelBufferWithAuxAttributes(v4, pixelBufferPool, (CFDictionaryRef)self->_poolAttributes, &pixelBufferOut);
  }
  else {
    CVReturn v6 = CVPixelBufferPoolCreatePixelBuffer(v4, pixelBufferPool, &pixelBufferOut);
  }
  CVReturn v7 = v6;
  CVPixelBufferPoolRelease(self->_pixelBufferPool);
  if (v7) {
    return 0;
  }
  else {
    return pixelBufferOut;
  }
}

- (unint64_t)getMinimumBufferCount
{
  v2 = [(NSDictionary *)self->_poolAttributes objectForKeyedSubscript:*MEMORY[0x263F041C0]];
  unint64_t v3 = [v2 unsignedLongValue];

  return v3;
}

- (double)getMaximumBufferAge
{
  v2 = [(NSDictionary *)self->_poolAttributes objectForKeyedSubscript:*MEMORY[0x263F041B0]];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (unint64_t)getAllocationThreshold
{
  v2 = [(NSDictionary *)self->_poolAttributes objectForKeyedSubscript:*MEMORY[0x263F041A8]];
  unint64_t v3 = [v2 unsignedLongValue];

  return v3;
}

- (void)dealloc
{
  CVPixelBufferPoolFlush(self->_pixelBufferPool, 1uLL);
  CVPixelBufferPoolRelease(self->_pixelBufferPool);
  v3.receiver = self;
  v3.super_class = (Class)MIOPixelBufferPool;
  [(MIOPixelBufferPool *)&v3 dealloc];
}

- (void)flush
{
  pixelBufferPool = self->_pixelBufferPool;
  if (pixelBufferPool) {
    CVPixelBufferPoolFlush(pixelBufferPool, 1uLL);
  }
}

+ (id)createMIOPixelBufferPoolWithWidth:(unint64_t)a3 height:(unint64_t)a4 pixelFormat:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  v8 = [MIOPixelBufferPool alloc];
  v9 = +[MIOPixelBufferPool makeBufferConfigDict:a3 height:a4 pixelFormat:v5 bufferCacheMode:0];
  v10 = [NSDictionary dictionaryWithDictionary:v9];
  v11 = v8;
  v12 = [(MIOPixelBufferPool *)v11 initWithPixelBuffer:0 bufferAttributes:v10 poolAttributes:0 error:0];

  return v12;
}

+ (id)createMIOPixelBufferPoolWithWidth:(unint64_t)a3 height:(unint64_t)a4 pixelFormat:(unsigned int)a5 minBufferCount:(unint64_t)a6
{
  uint64_t v7 = *(void *)&a5;
  v19[1] = *MEMORY[0x263EF8340];
  v10 = [MIOPixelBufferPool alloc];
  v11 = +[MIOPixelBufferPool makeBufferConfigDict:a3 height:a4 pixelFormat:v7 bufferCacheMode:0];
  v12 = [NSDictionary dictionaryWithDictionary:v11];
  uint64_t v18 = *MEMORY[0x263F041C0];
  v13 = [NSNumber numberWithUnsignedLong:a6];
  v19[0] = v13;
  v14 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];

  v15 = v10;
  v16 = [(MIOPixelBufferPool *)v15 initWithPixelBuffer:0 bufferAttributes:v12 poolAttributes:v14 error:0];

  return v16;
}

+ (id)createMIOPixelBufferPoolWithWidth:(unint64_t)a3 height:(unint64_t)a4 pixelFormat:(unsigned int)a5 minBufferCount:(unint64_t)a6 bufferCacheMode:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  uint64_t v9 = *(void *)&a5;
  v21[1] = *MEMORY[0x263EF8340];
  v12 = [MIOPixelBufferPool alloc];
  v13 = +[MIOPixelBufferPool makeBufferConfigDict:a3 height:a4 pixelFormat:v9 bufferCacheMode:v7];
  v14 = [NSDictionary dictionaryWithDictionary:v13];
  uint64_t v20 = *MEMORY[0x263F041C0];
  v15 = [NSNumber numberWithUnsignedLong:a6];
  v21[0] = v15;
  v16 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];

  v17 = v12;
  uint64_t v18 = [(MIOPixelBufferPool *)v17 initWithPixelBuffer:0 bufferAttributes:v14 poolAttributes:v16 error:0];

  return v18;
}

+ (id)createMIOPixelBufferPoolWithWidth:(unint64_t)a3 height:(unint64_t)a4 pixelFormat:(unsigned int)a5 extendedPixelsPerRow:(unint64_t)a6 minBufferCount:(unint64_t)a7
{
  return (id)[a1 createMIOPixelBufferPoolWithWidth:a3 height:a4 pixelFormat:*(void *)&a5 extendedPixelsPerRow:a6 minBufferCount:a7 bufferCacheMode:0];
}

+ (id)createMIOPixelBufferPoolWithWidth:(unint64_t)a3 height:(unint64_t)a4 pixelFormat:(unsigned int)a5 extendedPixelsPerRow:(unint64_t)a6 minBufferCount:(unint64_t)a7 bufferCacheMode:(int)a8
{
  uint64_t v8 = *(void *)&a8;
  uint64_t v11 = *(void *)&a5;
  v24[1] = *MEMORY[0x263EF8340];
  v14 = [MIOPixelBufferPool alloc];
  v15 = +[MIOPixelBufferPool makeBufferConfigDict:a3 height:a4 pixelFormat:v11 bufferCacheMode:v8];
  v16 = [NSNumber numberWithUnsignedLong:a6];
  [v15 setObject:v16 forKey:*MEMORY[0x263F040F8]];

  v17 = [NSDictionary dictionaryWithDictionary:v15];
  uint64_t v23 = *MEMORY[0x263F041C0];
  uint64_t v18 = [NSNumber numberWithUnsignedLong:a7];
  v24[0] = v18;
  v19 = [NSDictionary dictionaryWithObjects:v24 forKeys:&v23 count:1];

  uint64_t v20 = v14;
  v21 = [(MIOPixelBufferPool *)v20 initWithPixelBuffer:0 bufferAttributes:v17 poolAttributes:v19 error:0];

  return v21;
}

+ (id)createMIOPixelBufferPoolWithWidth:(unint64_t)a3 height:(unint64_t)a4 pixelFormat:(unsigned int)a5 minBufferCount:(unint64_t)a6 maxBufferCount:(unint64_t)a7 bufferCacheMode:(int)a8
{
  uint64_t v8 = *(void *)&a8;
  uint64_t v11 = *(void *)&a5;
  void v24[2] = *MEMORY[0x263EF8340];
  v14 = [MIOPixelBufferPool alloc];
  v15 = +[MIOPixelBufferPool makeBufferConfigDict:a3 height:a4 pixelFormat:v11 bufferCacheMode:v8];
  v16 = [NSDictionary dictionaryWithDictionary:v15];
  v23[0] = *MEMORY[0x263F041C0];
  v17 = [NSNumber numberWithUnsignedLong:a6];
  v24[0] = v17;
  v23[1] = *MEMORY[0x263F041A8];
  uint64_t v18 = [NSNumber numberWithUnsignedLong:a7];
  v24[1] = v18;
  v19 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];

  uint64_t v20 = v14;
  v21 = [(MIOPixelBufferPool *)v20 initWithPixelBuffer:0 bufferAttributes:v16 poolAttributes:v19 error:0];

  return v21;
}

+ (id)createMIOPixelBufferPoolWithWidth:(unint64_t)a3 height:(unint64_t)a4 pixelFormat:(unsigned int)a5 exactBytesPerRow:(unint64_t)a6 minBufferCount:(unint64_t)a7
{
  return +[MIOPixelBufferPool createMIOPixelBufferPoolWithWidth:a3 height:a4 pixelFormat:*(void *)&a5 exactBytesPerRow:a6 minBufferCount:a7 bufferCacheMode:0];
}

+ (id)createMIOPixelBufferPoolWithWidth:(unint64_t)a3 height:(unint64_t)a4 pixelFormat:(unsigned int)a5 exactBytesPerRow:(unint64_t)a6 minBufferCount:(unint64_t)a7 bufferCacheMode:(int)a8
{
  uint64_t v8 = *(void *)&a8;
  uint64_t v11 = *(void *)&a5;
  v24[1] = *MEMORY[0x263EF8340];
  v14 = [MIOPixelBufferPool alloc];
  v15 = +[MIOPixelBufferPool makeBufferConfigDict:a3 height:a4 pixelFormat:v11 bufferCacheMode:v8];
  v16 = [NSNumber numberWithUnsignedLong:a6];
  [v15 setObject:v16 forKey:*MEMORY[0x263F040C8]];

  v17 = [NSDictionary dictionaryWithDictionary:v15];
  uint64_t v23 = *MEMORY[0x263F041C0];
  uint64_t v18 = [NSNumber numberWithUnsignedLong:a7];
  v24[0] = v18;
  v19 = [NSDictionary dictionaryWithObjects:v24 forKeys:&v23 count:1];

  uint64_t v20 = v14;
  v21 = [(MIOPixelBufferPool *)v20 initWithPixelBuffer:0 bufferAttributes:v17 poolAttributes:v19 error:0];

  return v21;
}

+ (id)createMIOPixelBufferPoolWithWidth:(unint64_t)a3 height:(unint64_t)a4 pixelFormat:(unsigned int)a5 exactBytesPerRows:(id)a6 minBufferCount:(unint64_t)a7
{
  uint64_t v7 = [a1 createMIOPixelBufferPoolWithWidth:a3 height:a4 pixelFormat:*(void *)&a5 exactBytesPerRows:a6 minBufferCount:a7 bufferCacheMode:0];

  return v7;
}

+ (id)createMIOPixelBufferPoolWithWidth:(unint64_t)a3 height:(unint64_t)a4 pixelFormat:(unsigned int)a5 exactBytesPerRows:(id)a6 minBufferCount:(unint64_t)a7 bufferCacheMode:(int)a8
{
  uint64_t v9 = *(void *)&a5;
  v22[1] = *MEMORY[0x263EF8340];
  id v12 = a6;
  v13 = [MIOPixelBufferPool alloc];
  v14 = +[MIOPixelBufferPool makeBufferConfigDict:a3 height:a4 pixelFormat:v9 bufferCacheMode:0];
  [v14 setObject:v12 forKey:*MEMORY[0x263F040C8]];
  v15 = [NSDictionary dictionaryWithDictionary:v14];
  uint64_t v21 = *MEMORY[0x263F041C0];
  v16 = [NSNumber numberWithUnsignedLong:a7];
  v22[0] = v16;
  v17 = [NSDictionary dictionaryWithObjects:v22 forKeys:&v21 count:1];

  uint64_t v18 = v13;
  v19 = [(MIOPixelBufferPool *)v18 initWithPixelBuffer:0 bufferAttributes:v15 poolAttributes:v17 error:0];

  return v19;
}

+ (id)createNewL010MIOPixelBufferPoolWithReferencePixelBuffer:(__CVBuffer *)a3 minBufferCount:(unint64_t)a4 bufferCacheMode:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  void v24[2] = *MEMORY[0x263EF8340];
  uint64_t v8 = [MIOPixelBufferPool alloc];
  uint64_t v9 = *MEMORY[0x263F04180];
  v24[0] = &unk_26CB7D2D8;
  uint64_t v10 = *MEMORY[0x263F04130];
  v23[0] = v9;
  v23[1] = v10;
  uint64_t v21 = *MEMORY[0x263F0ED58];
  uint64_t v11 = [NSNumber numberWithInt:v5];
  uint64_t v22 = v11;
  id v12 = [NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
  v24[1] = v12;
  v13 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];

  uint64_t v19 = *MEMORY[0x263F041C0];
  v14 = [NSNumber numberWithUnsignedLong:a4];
  uint64_t v20 = v14;
  v15 = [NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];

  v16 = v8;
  v17 = [(MIOPixelBufferPool *)v16 initWithPixelBuffer:a3 bufferAttributes:v13 poolAttributes:v15 error:0];

  return v17;
}

+ (id)createNewL008MIOPixelBufferPoolWithReferencePixelBuffer:(__CVBuffer *)a3 minBufferCount:(unint64_t)a4 bufferCacheMode:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  void v24[2] = *MEMORY[0x263EF8340];
  uint64_t v8 = [MIOPixelBufferPool alloc];
  uint64_t v9 = *MEMORY[0x263F04180];
  v24[0] = &unk_26CB7D2F0;
  uint64_t v10 = *MEMORY[0x263F04130];
  v23[0] = v9;
  v23[1] = v10;
  uint64_t v21 = *MEMORY[0x263F0ED58];
  uint64_t v11 = [NSNumber numberWithInt:v5];
  uint64_t v22 = v11;
  id v12 = [NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
  v24[1] = v12;
  v13 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];

  uint64_t v19 = *MEMORY[0x263F041C0];
  v14 = [NSNumber numberWithUnsignedLong:a4];
  uint64_t v20 = v14;
  v15 = [NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];

  v16 = v8;
  v17 = [(MIOPixelBufferPool *)v16 initWithPixelBuffer:a3 bufferAttributes:v13 poolAttributes:v15 error:0];

  return v17;
}

- (__CVPixelBufferPool)pixelBufferPool
{
  return self->_pixelBufferPool;
}

- (void)setPixelBufferPool:(__CVPixelBufferPool *)a3
{
  self->_pixelBufferPool = a3;
}

- (NSDictionary)poolAttributes
{
  return self->_poolAttributes;
}

- (void)setPoolAttributes:(id)a3
{
}

- (void).cxx_destruct
{
}

@end