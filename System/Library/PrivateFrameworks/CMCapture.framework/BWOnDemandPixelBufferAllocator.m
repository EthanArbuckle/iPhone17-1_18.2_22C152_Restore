@interface BWOnDemandPixelBufferAllocator
+ (id)onDemandAllocatorWithDimensions:(id)a3 pixelFormat:(unsigned int)a4 name:(id)a5 memoryPool:(id)a6;
+ (void)initialize;
- ($2825F4736939C4A6D3AD43837233062D)dimensions;
- (BOOL)usesMemoryPool;
- (BWOnDemandPixelBufferAllocator)initWithVideoFormat:(id)a3 name:(id)a4 memoryPool:(id)a5 additionalPixelBufferAttributes:(id)a6;
- (NSString)description;
- (NSString)name;
- (__CVBuffer)newPixelBuffer;
- (unint64_t)height;
- (unint64_t)sliceCount;
- (unint64_t)width;
- (unsigned)pixelFormat;
- (void)dealloc;
@end

@implementation BWOnDemandPixelBufferAllocator

+ (void)initialize
{
}

- (BWOnDemandPixelBufferAllocator)initWithVideoFormat:(id)a3 name:(id)a4 memoryPool:(id)a5 additionalPixelBufferAttributes:(id)a6
{
  v23[4] = *MEMORY[0x1E4F143B8];
  if (([a3 memoryPoolUseAllowed] & 1) == 0)
  {
    uint64_t v18 = [NSString stringWithFormat:@"Memory pool use disallowed with video format: %@", a3];
    goto LABEL_11;
  }
  if (!a5)
  {
    uint64_t v18 = [NSString stringWithFormat:@"No memory pool provided for video format: %@", a3];
LABEL_11:
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v18 userInfo:0]);
  }
  v19.receiver = self;
  v19.super_class = (Class)BWOnDemandPixelBufferAllocator;
  v10 = [(BWOnDemandPixelBufferAllocator *)&v19 init];
  if (v10)
  {
    v10->_videoFormat = (BWVideoFormat *)a3;
    v10->_memoryPool = (BWMemoryPool *)a5;
    v22[0] = *MEMORY[0x1E4F24D70];
    v23[0] = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a3, "pixelFormat"));
    v22[1] = *MEMORY[0x1E4F24E10];
    v23[1] = objc_msgSend(NSNumber, "numberWithUnsignedLong:", objc_msgSend(a3, "width"));
    v22[2] = *MEMORY[0x1E4F24D08];
    v23[2] = objc_msgSend(NSNumber, "numberWithUnsignedLong:", objc_msgSend(a3, "height"));
    v22[3] = *MEMORY[0x1E4F24D20];
    v20[0] = *MEMORY[0x1E4F2EFC0];
    uint64_t v11 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(a5, "poolIdentifier"));
    uint64_t v12 = *MEMORY[0x1E4F2EFE8];
    v21[0] = v11;
    v21[1] = &unk_1EFB00380;
    uint64_t v13 = *MEMORY[0x1E4F2F130];
    v20[1] = v12;
    v20[2] = v13;
    v21[2] = MEMORY[0x1E4F1CC38];
    v23[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:3];
    v14 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:4];
    if ([a6 count])
    {
      v15 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v14];
      [v15 addEntriesFromDictionary:a6];
      v16 = (NSDictionary *)[v15 copy];
    }
    else
    {
      v16 = v14;
    }
    v10->_pixelBufferAttributes = v16;
  }
  return v10;
}

+ (id)onDemandAllocatorWithDimensions:(id)a3 pixelFormat:(unsigned int)a4 name:(id)a5 memoryPool:(id)a6
{
  uint64_t v8 = *(void *)&a4;
  v15[1] = *MEMORY[0x1E4F143B8];
  id v10 = +[BWVideoFormatRequirements formatRequirements];
  [v10 setWidth:a3.var0];
  [v10 setHeight:*(uint64_t *)&a3 >> 32];
  v15[0] = [NSNumber numberWithUnsignedInt:v8];
  objc_msgSend(v10, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v15, 1));
  if (!v10)
  {
    fig_log_get_emitter();
LABEL_6:
    FigDebugAssert3();
    uint64_t v12 = 0;
    return v12;
  }
  uint64_t v11 = [BWOnDemandPixelBufferAllocator alloc];
  id v14 = v10;
  uint64_t v12 = -[BWOnDemandPixelBufferAllocator initWithVideoFormat:name:memoryPool:additionalPixelBufferAttributes:](v11, "initWithVideoFormat:name:memoryPool:additionalPixelBufferAttributes:", +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1]), a5, a6, 0);
  if (!v12)
  {
    fig_log_get_emitter();
    goto LABEL_6;
  }
  return v12;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWOnDemandPixelBufferAllocator;
  [(BWOnDemandPixelBufferAllocator *)&v3 dealloc];
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@ %p>", objc_opt_class(), self];
}

- (__CVBuffer)newPixelBuffer
{
  CVPixelBufferRef pixelBufferOut = 0;
  if (CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], [(BWOnDemandPixelBufferAllocator *)self width], [(BWOnDemandPixelBufferAllocator *)self height], [(BWOnDemandPixelBufferAllocator *)self pixelFormat], (CFDictionaryRef)self->_pixelBufferAttributes, &pixelBufferOut))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  return pixelBufferOut;
}

- (unsigned)pixelFormat
{
  return [(BWVideoFormat *)self->_videoFormat pixelFormat];
}

- (unint64_t)width
{
  return [(BWVideoFormat *)self->_videoFormat width];
}

- (unint64_t)height
{
  return [(BWVideoFormat *)self->_videoFormat height];
}

- ($2825F4736939C4A6D3AD43837233062D)dimensions
{
  unsigned int v3 = [(BWVideoFormat *)self->_videoFormat width];
  return ($2825F4736939C4A6D3AD43837233062D)(v3 | ((unint64_t)[(BWVideoFormat *)self->_videoFormat height] << 32));
}

- (unint64_t)sliceCount
{
  return [(BWVideoFormat *)self->_videoFormat sliceCount];
}

- (BOOL)usesMemoryPool
{
  return 1;
}

- (NSString)name
{
  return self->_name;
}

@end