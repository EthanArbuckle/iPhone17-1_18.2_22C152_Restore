@interface BWPhotoDecompressor
- (BWPhotoDecompressor)initWithOutputPixelBufferPool:(id)a3;
- (BWPhotoDecompressor)initWithPoolSize:(int)a3 outputPixelFormat:(unsigned int)a4 outputLargestDimension:(int)a5;
- (BWPixelBufferPool)outputPixelBufferPool;
- (CFDictionaryRef)_setCVColorProperties:(CMSampleBufferRef)sbuf fromSourceBuffer:;
- _initWithPoolSize:(int)a3 outputPixelFormat:(void *)a4 outputPixelBufferPool:(int)a5 outputLargestDimension:;
- (__CVBuffer)_newUncompressedSampleBufferFromSampleBuffer:(__CVBuffer *)result pixelBufferTrackingTag:(opaqueCMSampleBuffer *)a2;
- (__CVBuffer)newUncompressedPixelBufferFromSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (opaqueCMSampleBuffer)newUncompressedSampleBufferFromSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (uint64_t)_newUncompressedPixelBufferFromSampleBuffer:(uint64_t)result pixelBufferTrackingTag:(CMSampleBufferRef)sbuf;
- (uint64_t)_setupDecompressionOptions;
- (uint64_t)_setupDecompressionSession;
- (uint64_t)_setupDecompressionSurfacePool;
- (uint64_t)_setupResources;
- (void)_releaseResources;
- (void)dealloc;
- (void)flush;
@end

@implementation BWPhotoDecompressor

- (BWPhotoDecompressor)initWithPoolSize:(int)a3 outputPixelFormat:(unsigned int)a4 outputLargestDimension:(int)a5
{
  if (a3 < 1 || !a4)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
    v8 = @"poolSize must be greater than 0, outputPixelFormat must not be 0";
    goto LABEL_9;
  }
  if (a5 < 0)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
    v8 = @"outputLargestDimension must be 0 or greater";
LABEL_9:
    objc_exception_throw((id)[v6 exceptionWithName:v7 reason:v8 userInfo:0]);
  }
  return (BWPhotoDecompressor *)-[BWPhotoDecompressor _initWithPoolSize:outputPixelFormat:outputPixelBufferPool:outputLargestDimension:](self, a3, a4, 0, a5);
}

- _initWithPoolSize:(int)a3 outputPixelFormat:(void *)a4 outputPixelBufferPool:(int)a5 outputLargestDimension:
{
  if (!a1) {
    return 0;
  }
  v12.receiver = a1;
  v12.super_class = (Class)BWPhotoDecompressor;
  v9 = objc_msgSendSuper2(&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    v9[2] = a2;
    v9[3] = a3;
    *((void *)v9 + 2) = a4;
    v10[6] = a5;
    *((unsigned char *)v10 + 72) = 0;
  }
  return v10;
}

- (BWPhotoDecompressor)initWithOutputPixelBufferPool:(id)a3
{
  if (!a3) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"outputPixelPool must not be nil" userInfo:0]);
  }
  int v5 = [a3 capacity];
  int v6 = [a3 pixelFormat];
  return (BWPhotoDecompressor *)-[BWPhotoDecompressor _initWithPoolSize:outputPixelFormat:outputPixelBufferPool:outputLargestDimension:](self, v5, v6, a3, 0);
}

- (void)dealloc
{
  -[BWPhotoDecompressor _releaseResources]((uint64_t)self);

  v3.receiver = self;
  v3.super_class = (Class)BWPhotoDecompressor;
  [(BWPhotoDecompressor *)&v3 dealloc];
}

- (void)_releaseResources
{
  if (a1)
  {
    if (*(void *)(a1 + 48))
    {
      CMPhotoDecompressionSessionReleaseHardwareResources();
      CMPhotoDecompressionSessionFlushCachedBuffers();
      v2 = *(const void **)(a1 + 48);
      if (v2)
      {
        CFRelease(v2);
        *(void *)(a1 + 48) = 0;
      }
    }
    objc_super v3 = *(const void **)(a1 + 40);
    if (v3)
    {
      CFRelease(v3);
      *(void *)(a1 + 40) = 0;
    }

    *(void *)(a1 + 56) = 0;
    v4 = *(const void **)(a1 + 64);
    if (v4)
    {
      CFRelease(v4);
      *(void *)(a1 + 64) = 0;
    }
    *(unsigned char *)(a1 + 28) = 0;
  }
}

- (void)flush
{
  if (self->_decompressionSession)
  {
    CMPhotoDecompressionSessionReleaseHardwareResources();
    CMPhotoDecompressionSessionFlushCachedBuffers();
  }
  CMPhotoSurfacePoolDiscardCaches();
  outputPixelBufferPool = self->_outputPixelBufferPool;
  [(BWPixelBufferPool *)outputPixelBufferPool flushToMinimumCapacity:0];
}

- (BWPixelBufferPool)outputPixelBufferPool
{
  return self->_outputPixelBufferPool;
}

- (__CVBuffer)newUncompressedPixelBufferFromSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  return (__CVBuffer *)-[BWPhotoDecompressor _newUncompressedPixelBufferFromSampleBuffer:pixelBufferTrackingTag:]((uint64_t)self, a3);
}

- (uint64_t)_newUncompressedPixelBufferFromSampleBuffer:(uint64_t)result pixelBufferTrackingTag:(CMSampleBufferRef)sbuf
{
  if (result)
  {
    uint64_t v2 = result;
    CMSampleBufferGetDataBuffer(sbuf);
    if (*(unsigned char *)(v2 + 28) || !-[BWPhotoDecompressor _setupResources](v2)) {
      CMPhotoDecompressionSessionCreateContainer();
    }
    return 0;
  }
  return result;
}

- (uint64_t)_setupResources
{
  if (!a1) {
    return 0;
  }
  if (*(void *)(a1 + 16) && !*(unsigned char *)(a1 + 72) || *(void *)(a1 + 40))
  {
    uint64_t v2 = 0;
  }
  else
  {
    uint64_t v2 = -[BWPhotoDecompressor _setupDecompressionSurfacePool](a1);
    if (!*(void *)(a1 + 40))
    {
LABEL_13:
      FigSignalErrorAt();
      return v2;
    }
  }
  if (!*(void *)(a1 + 48))
  {
    uint64_t v2 = -[BWPhotoDecompressor _setupDecompressionSession](a1);
    if (!*(void *)(a1 + 48)) {
      goto LABEL_13;
    }
  }
  if (!*(void *)(a1 + 56))
  {
    uint64_t v2 = -[BWPhotoDecompressor _setupDecompressionOptions](a1);
    if (!*(void *)(a1 + 56)) {
      goto LABEL_13;
    }
  }
  *(unsigned char *)(a1 + 28) = 1;
  return v2;
}

- (CFDictionaryRef)_setCVColorProperties:(CMSampleBufferRef)sbuf fromSourceBuffer:
{
  v18[3] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    FormatDescription = CMSampleBufferGetFormatDescription(sbuf);
    result = CMFormatDescriptionGetExtensions(FormatDescription);
    if (result)
    {
      CFDictionaryRef v5 = result;
      uint64_t v6 = *MEMORY[0x1E4F24BC8];
      v18[0] = *MEMORY[0x1E4F24C18];
      v18[1] = v6;
      v18[2] = *MEMORY[0x1E4F24A90];
      uint64_t v7 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:3];
      long long v13 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      result = (CFDictionaryRef)[v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (result)
      {
        CFDictionaryRef v8 = result;
        uint64_t v9 = *(void *)v14;
        do
        {
          CFDictionaryRef v10 = 0;
          do
          {
            if (*(void *)v14 != v9) {
              objc_enumerationMutation(v7);
            }
            CFStringRef v11 = *(const __CFString **)(*((void *)&v13 + 1) + 8 * (void)v10);
            objc_super v12 = (const void *)[(__CFDictionary *)v5 objectForKeyedSubscript:v11];
            if (v12) {
              CVBufferSetAttachment(a2, v11, v12, kCVAttachmentMode_ShouldPropagate);
            }
            CFDictionaryRef v10 = (CFDictionaryRef)((char *)v10 + 1);
          }
          while (v8 != v10);
          result = (CFDictionaryRef)[v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
          CFDictionaryRef v8 = result;
        }
        while (result);
      }
    }
  }
  return result;
}

- (opaqueCMSampleBuffer)newUncompressedSampleBufferFromSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  return -[BWPhotoDecompressor _newUncompressedSampleBufferFromSampleBuffer:pixelBufferTrackingTag:]((__CVBuffer *)self, a3);
}

- (__CVBuffer)_newUncompressedSampleBufferFromSampleBuffer:(__CVBuffer *)result pixelBufferTrackingTag:(opaqueCMSampleBuffer *)a2
{
  if (result)
  {
    objc_super v3 = result;
    CMSampleBufferRef v5 = 0;
    result = (__CVBuffer *)-[BWPhotoDecompressor _newUncompressedPixelBufferFromSampleBuffer:pixelBufferTrackingTag:]((uint64_t)result, a2);
    if (result)
    {
      v4 = result;
      BWCMSampleBufferCreateCopyWithNewPixelBuffer(a2, result, (CFTypeRef *)v3 + 8, &v5);
      CFRelease(v4);
      return v5;
    }
  }
  return result;
}

- (uint64_t)_setupDecompressionSurfacePool
{
  v8[2] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    BOOL v2 = FigCapturePlatformIOSurfaceWiringAssertionEnabled() != 0;
    uint64_t v3 = *(unsigned int *)(v1 + 8);
    v7[0] = *MEMORY[0x1E4F563A0];
    v5[0] = *MEMORY[0x1E4F56388];
    v6[0] = [NSNumber numberWithInt:v3];
    v5[1] = *MEMORY[0x1E4F56360];
    v6[1] = [NSNumber numberWithInt:v3];
    v5[2] = *MEMORY[0x1E4F56378];
    v6[2] = [NSNumber numberWithBool:v2];
    v5[3] = *MEMORY[0x1E4F56370];
    v6[3] = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[BWMemoryPool poolIdentifier](+[BWMemoryPool sharedMemoryPool](BWMemoryPool, "sharedMemoryPool"), "poolIdentifier"));
    uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:4];
    v7[1] = *MEMORY[0x1E4F56380];
    v8[0] = v4;
    v8[1] = &unk_1EFAFE430;
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];
    return CMPhotoSurfacePoolCreate();
  }
  return result;
}

- (uint64_t)_setupDecompressionSession
{
  v3[1] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = *(void *)(result + 40);
    if (v1)
    {
      uint64_t v2 = *MEMORY[0x1E4F562F0];
      v3[0] = v1;
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:&v2 count:1];
    }
    return CMPhotoDecompressionSessionCreate();
  }
  return result;
}

- (uint64_t)_setupDecompressionOptions
{
  v8[4] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    id v2 = objc_alloc(MEMORY[0x1E4F1CA60]);
    uint64_t v3 = *MEMORY[0x1E4F56298];
    v7[0] = *MEMORY[0x1E4F562A0];
    v7[1] = v3;
    v8[0] = MEMORY[0x1E4F1CC38];
    v8[1] = MEMORY[0x1E4F1CC28];
    void v7[2] = *MEMORY[0x1E4F562B0];
    uint64_t v4 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(v1 + 12)];
    v7[3] = *MEMORY[0x1E4F56270];
    v8[2] = v4;
    void v8[3] = &unk_1EFAFE448;
    uint64_t v5 = objc_msgSend(v2, "initWithDictionary:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v8, v7, 4));
    *(void *)(v1 + 56) = v5;
    if (*(int *)(v1 + 24) >= 1)
    {
      uint64_t v6 = objc_msgSend(NSNumber, "numberWithInt:");
      [*(id *)(v1 + 56) setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F562A8]];
      uint64_t v5 = *(void *)(v1 + 56);
    }
    if (v5) {
      return 0;
    }
    else {
      return 4294954510;
    }
  }
  return result;
}

@end