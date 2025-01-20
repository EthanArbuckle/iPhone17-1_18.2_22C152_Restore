@interface FigCapturePixelConverter
+ (void)initialize;
- (BWVideoFormat)outputFormat;
- (FigCapturePixelConverter)init;
- (FigCapturePixelConverter)initWithPrefetchPool:(BOOL)a3;
- (int)convertPixelBuffer:(__CVBuffer *)a3 cropRect:(CGRect)a4 allocateOutputFromBufferPool:(BOOL)a5 outputPixelBuffer:(__CVBuffer *)a6;
- (int)convertSampleBuffer:(opaqueCMSampleBuffer *)a3 cropRect:(CGRect)a4 outputSampleBuffer:(opaqueCMSampleBuffer *)a5;
- (int)updateOutputPixelFormat:(unsigned int)a3 dimensions:(id)a4 poolCapacity:(int)a5 colorSpaceProperties:(int)a6 alwaysUseHardwareForConversion:(BOOL)a7;
- (uint64_t)_buildBufferPool;
- (uint64_t)_buildTransferSession;
- (void)_purgeResources;
- (void)dealloc;
@end

@implementation FigCapturePixelConverter

- (FigCapturePixelConverter)init
{
  return [(FigCapturePixelConverter *)self initWithPrefetchPool:0];
}

- (FigCapturePixelConverter)initWithPrefetchPool:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)FigCapturePixelConverter;
  result = [(FigCapturePixelConverter *)&v5 init];
  if (result) {
    result->_prefetchPool = a3;
  }
  return result;
}

+ (void)initialize
{
}

- (void)dealloc
{
  -[FigCapturePixelConverter _purgeResources]((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)FigCapturePixelConverter;
  [(FigCapturePixelConverter *)&v3 dealloc];
}

- (void)_purgeResources
{
  if (a1)
  {

    *(void *)(a1 + 24) = 0;
    *(void *)(a1 + 32) = 0;
    v2 = *(const void **)(a1 + 40);
    if (v2)
    {
      CFRelease(v2);
      *(void *)(a1 + 40) = 0;
    }
    objc_super v3 = *(const void **)(a1 + 8);
    if (v3)
    {
      CFRelease(v3);
      *(void *)(a1 + 8) = 0;
    }
  }
}

- (int)updateOutputPixelFormat:(unsigned int)a3 dimensions:(id)a4 poolCapacity:(int)a5 colorSpaceProperties:(int)a6 alwaysUseHardwareForConversion:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v8 = *(void *)&a6;
  uint64_t v11 = *(void *)&a3;
  v21[1] = *MEMORY[0x1E4F143B8];
  if (!self->_pool
    || self->_poolCapacity != a5
    || (outputFormat = self->_outputFormat) == 0
    || [(BWVideoFormat *)outputFormat pixelFormat] != a3
    || [(BWVideoFormat *)self->_outputFormat width] != a4.var0
    || [(BWVideoFormat *)self->_outputFormat height] != *(uint64_t *)&a4 >> 32
    || [(BWVideoFormat *)self->_outputFormat colorSpaceProperties] != v8
    || self->_alwaysUseHardwareForConversion != v7)
  {
    -[FigCapturePixelConverter _purgeResources]((uint64_t)self);
    self->_alwaysUseHardwareForConversion = v7;
    self->_poolCapacity = a5;
    v15 = objc_alloc_init(BWVideoFormatRequirements);
    v21[0] = [NSNumber numberWithUnsignedInt:v11];
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v15, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1]);
    [(BWVideoFormatRequirements *)v15 setWidth:a4.var0];
    [(BWVideoFormatRequirements *)v15 setHeight:*(uint64_t *)&a4 >> 32];
    [(BWVideoFormatRequirements *)v15 setPlaneAlignment:*MEMORY[0x1E4F14B00]];
    [(BWVideoFormatRequirements *)v15 setBytesPerRowAlignment:64];
    [(BWVideoFormatRequirements *)v15 setSupportedCacheModes:+[BWVideoFormatRequirements cacheModesForCacheProfile:2]];
    uint64_t v20 = [NSNumber numberWithInt:v8];
    -[BWVideoFormatRequirements setSupportedColorSpaceProperties:](v15, "setSupportedColorSpaceProperties:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1]);
    v19 = v15;
    v16 = (BWVideoFormat *)+[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1]);
    self->_outputFormat = v16;
    if (v16)
    {
      int v17 = -[FigCapturePixelConverter _buildBufferPool]((uint64_t)self);
      if (v17)
      {
        int v14 = v17;
        fig_log_get_emitter();
      }
      else
      {
        int v14 = -[FigCapturePixelConverter _buildTransferSession]((uint64_t)self);
        if (!v14) {
          return v14;
        }
        fig_log_get_emitter();
      }
      FigDebugAssert3();
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      int v14 = -12780;
    }
    -[FigCapturePixelConverter _purgeResources]((uint64_t)self);
    return v14;
  }
  return 0;
}

- (uint64_t)_buildBufferPool
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    int v2 = *(_DWORD *)(result + 48);
    if (v2 >= 1)
    {
      if (v2 == 1)
      {
        uint64_t v3 = 0;
      }
      else
      {
        uint64_t v8 = *MEMORY[0x1E4F24D20];
        uint64_t v6 = *MEMORY[0x1E4F2F100];
        BOOL v7 = &unk_1EFB00368;
        v9[0] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v7 forKeys:&v6 count:1];
        uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
      }
      LOBYTE(v5) = 0;
      v4 = [[BWPixelBufferPool alloc] initWithVideoFormat:*(void *)(v1 + 32) capacity:*(int *)(v1 + 48) name:@"CapturePixelConverter" memoryPool:0 additionalPixelBufferAttributes:v3 providesBackPressure:0 reportSlowBackPressureAllocations:v5];
      *(void *)(v1 + 24) = v4;
      if (!v4)
      {
        fig_log_get_emitter();
        FigDebugAssert3();
        return 4294954510;
      }
      if (*(unsigned char *)(v1 + 52)) {
        [(BWPixelBufferPool *)v4 prefetchWithCompletionHandler:0];
      }
    }
    return 0;
  }
  return result;
}

- (uint64_t)_buildTransferSession
{
  if (a1)
  {
    int v2 = (VTSessionRef *)(a1 + 8);
    uint64_t v3 = VTPixelTransferSessionCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (VTPixelTransferSessionRef *)(a1 + 8));
    if (v3)
    {
      uint64_t v12 = v3;
      fig_log_get_emitter();
      FigDebugAssert3();
      return v12;
    }
    uint64_t v4 = [*(id *)(a1 + 32) colorSpaceProperties];
    if (*(_DWORD *)(a1 + 48) == 1 && !*(unsigned char *)(a1 + 16))
    {
      uint64_t v5 = (const void *)*MEMORY[0x1E4F1CFC8];
      VTSessionSetProperty(*v2, (CFStringRef)*MEMORY[0x1E4F45120], (CFTypeRef)*MEMORY[0x1E4F1CFC8]);
      if (!v4) {
        VTSessionSetProperty(*v2, (CFStringRef)*MEMORY[0x1E4F45118], v5);
      }
    }
    id v6 = +[BWVideoFormat pixelBufferAttachmentsForColorSpaceProperties:v4];
    if (v6)
    {
      BOOL v7 = v6;
      id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v9 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F24C18]];
      [v8 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F45100]];
      uint64_t v10 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F24A90]];
      [v8 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F450E0]];
      uint64_t v11 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F24BC8]];
      [v8 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F450F8]];
      VTSessionSetProperties(*v2, (CFDictionaryRef)v8);
    }
  }
  return 0;
}

- (int)convertSampleBuffer:(opaqueCMSampleBuffer *)a3 cropRect:(CGRect)a4 outputSampleBuffer:(opaqueCMSampleBuffer *)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(a3);
  if (!a3)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return -12780;
  }
  v13 = ImageBuffer;
  int v14 = [(BWPixelBufferPool *)self->_pool newPixelBuffer];
  if (!v14)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return -12786;
  }
  v15 = v14;
  v20.origin.CGFloat x = x;
  v20.origin.CGFloat y = y;
  v20.size.CGFloat width = width;
  v20.size.CGFloat height = height;
  if (CGRectIsEmpty(v20))
  {
    CFDictionaryRef DictionaryRepresentation = 0;
  }
  else
  {
    v21.origin.CGFloat x = x;
    v21.origin.CGFloat y = y;
    v21.size.CGFloat width = width;
    v21.size.CGFloat height = height;
    CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v21);
  }
  OSStatus v17 = VTSessionSetProperty(self->_transferSession, (CFStringRef)*MEMORY[0x1E4F45170], DictionaryRepresentation);
  if (v17 || (OSStatus v17 = VTPixelTransferSessionTransferImage(self->_transferSession, v13, v15)) != 0)
  {
    int CopyWithNewPixelBuffer = v17;
    fig_log_get_emitter();
  }
  else
  {
    int CopyWithNewPixelBuffer = BWCMSampleBufferCreateCopyWithNewPixelBuffer(a3, v15, (CFTypeRef *)&self->_outputFormatDescription, a5);
    if (!CopyWithNewPixelBuffer) {
      goto LABEL_9;
    }
    fig_log_get_emitter();
  }
  FigDebugAssert3();
LABEL_9:
  CFRelease(v15);
  if (DictionaryRepresentation) {
    CFRelease(DictionaryRepresentation);
  }
  return CopyWithNewPixelBuffer;
}

- (int)convertPixelBuffer:(__CVBuffer *)a3 cropRect:(CGRect)a4 allocateOutputFromBufferPool:(BOOL)a5 outputPixelBuffer:(__CVBuffer *)a6
{
  CVPixelBufferRef destinationBuffer = 0;
  if (!a3)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    CFDictionaryRef DictionaryRepresentation = 0;
    int v14 = -12780;
    goto LABEL_13;
  }
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  if (a5)
  {
    CVPixelBufferRef destinationBuffer = [(BWPixelBufferPool *)self->_pool newPixelBuffer];
    if (!destinationBuffer)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      CFDictionaryRef DictionaryRepresentation = 0;
      int v14 = -12786;
      goto LABEL_13;
    }
  }
  else
  {
    int v15 = BWCreateIOSurfaceBackedCVPixelBuffer([(BWVideoFormat *)self->_outputFormat width], [(BWVideoFormat *)self->_outputFormat height], [(BWVideoFormat *)self->_outputFormat pixelFormat], &destinationBuffer, @"PixelConverter Output");
    if (v15)
    {
      int v14 = v15;
      fig_log_get_emitter();
      FigDebugAssert3();
      CFDictionaryRef DictionaryRepresentation = 0;
      goto LABEL_13;
    }
  }
  v20.origin.CGFloat x = x;
  v20.origin.CGFloat y = y;
  v20.size.CGFloat width = width;
  v20.size.CGFloat height = height;
  if (CGRectIsEmpty(v20))
  {
    CFDictionaryRef DictionaryRepresentation = 0;
  }
  else
  {
    v21.origin.CGFloat x = x;
    v21.origin.CGFloat y = y;
    v21.size.CGFloat width = width;
    v21.size.CGFloat height = height;
    CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v21);
  }
  OSStatus v16 = VTSessionSetProperty(self->_transferSession, (CFStringRef)*MEMORY[0x1E4F45170], DictionaryRepresentation);
  if (v16 || (OSStatus v16 = VTPixelTransferSessionTransferImage(self->_transferSession, a3, destinationBuffer)) != 0)
  {
    int v14 = v16;
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  else
  {
    CVPixelBufferRef v17 = destinationBuffer;
    *a6 = destinationBuffer;
    if (!v17)
    {
      int v14 = 0;
      if (!DictionaryRepresentation) {
        return v14;
      }
      goto LABEL_16;
    }
    CFRetain(v17);
    int v14 = 0;
  }
LABEL_13:
  if (destinationBuffer) {
    CFRelease(destinationBuffer);
  }
  if (DictionaryRepresentation) {
LABEL_16:
  }
    CFRelease(DictionaryRepresentation);
  return v14;
}

- (BWVideoFormat)outputFormat
{
  return self->_outputFormat;
}

@end