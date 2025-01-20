@interface BWIntermediateJPEGCompressor
+ (void)initialize;
- (BWIntermediateJPEGCompressor)initWithCompressionQuality:(float)a3 compressionRate:(float)a4 jpegSurfacePoolLowWaterBufferCount:(int)a5 jpegSurfacePoolHighWaterBufferCount:(int)a6 compressedBufferPoolAllocationTimeoutMS:(unint64_t)a7 name:(id)a8;
- (opaqueCMSampleBuffer)newJPEGSampleBufferFromUncompressedSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (uint64_t)_setupJPEGCompressionOptions;
- (uint64_t)_setupJPEGCompressionSession;
- (uint64_t)_setupJPEGContainerOptions;
- (uint64_t)_setupJPEGEncodeResourcesForSourcePixelBuffer:(uint64_t)result;
- (uint64_t)_setupJPEGFormatDescriptionFromSourceBuffer:(uint64_t)result;
- (uint64_t)_setupJPEGSurfacePool;
- (void)_releaseResources;
- (void)dealloc;
- (void)flush;
@end

@implementation BWIntermediateJPEGCompressor

- (BWIntermediateJPEGCompressor)initWithCompressionQuality:(float)a3 compressionRate:(float)a4 jpegSurfacePoolLowWaterBufferCount:(int)a5 jpegSurfacePoolHighWaterBufferCount:(int)a6 compressedBufferPoolAllocationTimeoutMS:(unint64_t)a7 name:(id)a8
{
  if (a4 == 0.0)
  {
    if (a3 >= 0.0 && a3 < 1.0) {
      goto LABEL_10;
    }
    v14 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v15 = *MEMORY[0x1E4F1C3C8];
    v16 = @"Must have 0 < compressionQuality < 1";
LABEL_14:
    objc_exception_throw((id)[v14 exceptionWithName:v15 reason:v16 userInfo:0]);
  }
  if (a4 < 0.0)
  {
    v14 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v15 = *MEMORY[0x1E4F1C3C8];
    v16 = @"Must have compressionRate > 0";
    goto LABEL_14;
  }
  if (a3 != 0.0)
  {
    v14 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v15 = *MEMORY[0x1E4F1C3C8];
    v16 = @"Must have compressionQuality be 0 when using compressionRate";
    goto LABEL_14;
  }
LABEL_10:
  v22.receiver = self;
  v22.super_class = (Class)BWIntermediateJPEGCompressor;
  v18 = [(BWIntermediateJPEGCompressor *)&v22 init];
  if (v18)
  {
    v18->_name = (NSString *)a8;
    v18->_compressionQuality = a3;
    v18->_compressionRate = a4;
    v18->_jpegSurfacePoolLowWaterBufferCount = a5;
    v18->_jpegSurfacePoolHighWaterBufferCount = a6;
    v18->_compressedBufferPoolAllocationTimeoutMS = a7;
    v19 = objc_alloc_init(BWStats);
    v18->_overallWaitStats = v19;
    [(BWStats *)v19 setUnitDesignator:@"ms"];
    v20 = [[BWMovingWindowStats alloc] initWithWindowSize:128];
    v18->_recentWaitStats = v20;
    [(BWStats *)v20 setUnitDesignator:@"ms"];
  }
  return v18;
}

- (opaqueCMSampleBuffer)newJPEGSampleBufferFromUncompressedSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  v24 = 0;
  CFTypeRef v25 = 0;
  CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(a3);
  if (!ImageBuffer)
  {
    FigSignalErrorAt();
    v9 = 0;
    goto LABEL_17;
  }
  v6 = ImageBuffer;
  memset(&timingInfoOut, 0, sizeof(timingInfoOut));
  if (CMSampleBufferGetSampleTimingInfo(a3, 0, &timingInfoOut))
  {
LABEL_22:
    v9 = 0;
    goto LABEL_15;
  }
  if (self->_setupIsComplete
    || !-[BWIntermediateJPEGCompressor _setupJPEGEncodeResourcesForSourcePixelBuffer:]((uint64_t)self, v6))
  {
    if (!self->_backPressureSemaphore)
    {
      v9 = 0;
LABEL_12:
      if (!CMPhotoCompressionSessionOpenEmptyContainer()
        && !CMPhotoCompressionSessionAddImage())
      {
        int v19 = 0;
        size_t v18 = 0;
        if (!CMPhotoCompressionSessionCloseContainerAndCopyBacking()) {
          goto LABEL_17;
        }
      }
      goto LABEL_15;
    }
    unint64_t compressedBufferPoolAllocationTimeoutMS = self->_compressedBufferPoolAllocationTimeoutMS;
    if (compressedBufferPoolAllocationTimeoutMS == -1) {
      dispatch_time_t v8 = -1;
    }
    else {
      dispatch_time_t v8 = dispatch_time(0, 1000000 * compressedBufferPoolAllocationTimeoutMS);
    }
    ++self->_numberOfTimesWaitedOnBackPressureSemaphore;
    HostTimeClock = CMClockGetHostTimeClock();
    CMClockGetTime(&time, HostTimeClock);
    double Seconds = CMTimeGetSeconds(&time);
    if (!dispatch_semaphore_wait((dispatch_semaphore_t)self->_backPressureSemaphore, v8))
    {
      v12 = CMClockGetHostTimeClock();
      CMClockGetTime(&v21, v12);
      Float64 v13 = (CMTimeGetSeconds(&v21) - Seconds) * 1000.0;
      [(BWMovingWindowStats *)self->_recentWaitStats addDataPoint:v13];
      [(BWStats *)self->_overallWaitStats addDataPoint:v13];
      v14 = [BWIntermediateJPEGCompressedBufferAssociatedSemaphore alloc];
      name = self->_name;
      backPressureSemaphore = self->_backPressureSemaphore;
      CMSampleBufferGetPresentationTimeStamp(&v20, a3);
      v9 = [(BWIntermediateJPEGCompressedBufferAssociatedSemaphore *)v14 initWithSemaphore:backPressureSemaphore name:name presentationTimeStamp:&v20];
      goto LABEL_12;
    }
    goto LABEL_22;
  }
  v9 = 0;
LABEL_15:
  if (CMPhotoCompressionSessionIsContainerOpen()) {
    CMPhotoCompressionSessionCloseContainer();
  }
LABEL_17:
  if (v25) {
    CFRelease(v25);
  }
  if (v9) {
    CFRelease(v9);
  }
  return v24;
}

- (uint64_t)_setupJPEGFormatDescriptionFromSourceBuffer:(uint64_t)result
{
  v20[3] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = result;
    FormatDescription = CMSampleBufferGetFormatDescription(sbuf);
    CFDictionaryRef Extensions = CMFormatDescriptionGetExtensions(FormatDescription);
    if (Extensions)
    {
      uint64_t v6 = *MEMORY[0x1E4F24BC8];
      v20[0] = *MEMORY[0x1E4F24C18];
      v20[1] = v6;
      v20[2] = *MEMORY[0x1E4F24A90];
      v7 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:3];
      dispatch_time_t v8 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
      long long v15 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v16;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v16 != v11) {
              objc_enumerationMutation(v7);
            }
            objc_msgSend(v8, "setObject:forKeyedSubscript:", -[__CFDictionary objectForKeyedSubscript:](Extensions, "objectForKeyedSubscript:", *(void *)(*((void *)&v15 + 1) + 8 * v12)), *(void *)(*((void *)&v15 + 1) + 8 * v12));
            ++v12;
          }
          while (v10 != v12);
          uint64_t v10 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        }
        while (v10);
      }
      if ([v8 count]) {
        CFDictionaryRef Extensions = (CFDictionaryRef)v8;
      }
      else {
        CFDictionaryRef Extensions = 0;
      }
    }
    Float64 v13 = CMSampleBufferGetFormatDescription(sbuf);
    CMVideoDimensions Dimensions = CMVideoFormatDescriptionGetDimensions(v13);
    return CMVideoFormatDescriptionCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0x6A706567u, Dimensions.width, Dimensions.height, Extensions, (CMVideoFormatDescriptionRef *)(v3 + 104));
  }
  return result;
}

- (uint64_t)_setupJPEGEncodeResourcesForSourcePixelBuffer:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = result;
    if (*(float *)(result + 44) <= 0.0)
    {
      *(void *)(result + 24) = 0;
    }
    else
    {
      size_t Width = CVPixelBufferGetWidth(pixelBuffer);
      *(void *)(v2 + 24) = (*MEMORY[0x1E4F14B00]
                            + (unint64_t)((double)(CVPixelBufferGetHeight(pixelBuffer) * Width)
                                               * 1.5
                                               / *(float *)(v2 + 44))
                            - 1) & -*MEMORY[0x1E4F14B00];
    }
    if (*(void *)(v2 + 64))
    {
      __int16 v5 = 0;
    }
    else
    {
      __int16 v5 = -[BWIntermediateJPEGCompressor _setupJPEGSurfacePool](v2);
      if (!*(void *)(v2 + 64)) {
        goto LABEL_19;
      }
      if (*(void *)(v2 + 32)) {
        *(void *)(v2 + 16) = dispatch_semaphore_create(*(int *)(v2 + 56));
      }
    }
    if (*(void *)(v2 + 72)
      || (__int16 v5 = -[BWIntermediateJPEGCompressor _setupJPEGCompressionSession](v2), *(void *)(v2 + 72)))
    {
      if (*(void *)(v2 + 80)
        || (__int16 v5 = -[BWIntermediateJPEGCompressor _setupJPEGContainerOptions](v2), *(void *)(v2 + 80)))
      {
        if (*(void *)(v2 + 96)
          || (__int16 v5 = -[BWIntermediateJPEGCompressor _setupJPEGCompressionOptions](v2), *(void *)(v2 + 96)))
        {
          *(unsigned char *)(v2 + 60) = 1;
          return v5;
        }
      }
    }
LABEL_19:
    FigSignalErrorAt();
    return v5;
  }
  return result;
}

- (uint64_t)_setupJPEGCompressionOptions
{
  v17[1] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    if (*(float *)(result + 40) == 0.0)
    {
      uint64_t v14 = *MEMORY[0x1E4F56340];
      uint64_t v15 = [NSNumber numberWithUnsignedLong:*(void *)(result + 24)];
      uint64_t v2 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
      uint64_t v3 = 10;
    }
    else
    {
      uint64_t v16 = *MEMORY[0x1E4F56358];
      v17[0] = objc_msgSend(NSNumber, "numberWithFloat:");
      uint64_t v2 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
      uint64_t v3 = 3;
    }
    *(void *)(v1 + 88) = [v2 mutableCopy];
    uint64_t v4 = *MEMORY[0x1E4F56140];
    v12[0] = *MEMORY[0x1E4F560B8];
    v12[1] = v4;
    v13[0] = &unk_1EFAFDF68;
    v13[1] = &unk_1EFAFDF80;
    uint64_t v5 = *MEMORY[0x1E4F560E8];
    v12[2] = *MEMORY[0x1E4F56160];
    v12[3] = v5;
    v13[2] = MEMORY[0x1E4F1CC38];
    v13[3] = MEMORY[0x1E4F1CC28];
    uint64_t v6 = *MEMORY[0x1E4F56128];
    v12[4] = *MEMORY[0x1E4F56188];
    v12[5] = v6;
    v13[4] = MEMORY[0x1E4F1CC38];
    v13[5] = MEMORY[0x1E4F1CC38];
    uint64_t v7 = *MEMORY[0x1E4F560F0];
    v13[6] = MEMORY[0x1E4F1CC38];
    uint64_t v8 = *MEMORY[0x1E4F56158];
    v12[6] = v7;
    v12[7] = v8;
    uint64_t v9 = [NSNumber numberWithInt:v3];
    v12[8] = *MEMORY[0x1E4F56150];
    uint64_t v10 = *(void *)(v1 + 88);
    v13[7] = v9;
    v13[8] = v10;
    CFTypeRef v11 = (CFTypeRef)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:9];
    if (v11) {
      CFTypeRef v11 = CFRetain(v11);
    }
    *(void *)(v1 + 96) = v11;
    if (v11) {
      return 0;
    }
    else {
      return 4294954510;
    }
  }
  return result;
}

- (uint64_t)_setupJPEGSurfacePool
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    if (*(void *)(result + 24))
    {
      LODWORD(v15[0]) = *(void *)(result + 24);
      uint64_t v2 = (void *)MEMORY[0x1E4F1C9B8];
      uint64_t v3 = 4;
    }
    else
    {
      v15[0] = xmmword_1A5EFD6A8;
      v15[1] = unk_1A5EFD6B8;
      v15[2] = xmmword_1A5EFD6C8;
      uint64_t v16 = 0xA0000000800000;
      uint64_t v2 = (void *)MEMORY[0x1E4F1C9B8];
      uint64_t v3 = 56;
    }
    uint64_t v4 = [v2 dataWithBytes:v15 length:v3];
    BOOL v5 = FigCapturePlatformIOSurfaceWiringAssertionEnabled() != 0;
    uint64_t v13 = *MEMORY[0x1E4F563A8];
    v12[0] = objc_msgSend(NSNumber, "numberWithInt:", *(unsigned int *)(v1 + 52), *MEMORY[0x1E4F56388]);
    v11[1] = *MEMORY[0x1E4F56360];
    uint64_t v6 = [NSNumber numberWithInt:*(unsigned int *)(v1 + 56)];
    uint64_t v7 = *MEMORY[0x1E4F56368];
    v12[1] = v6;
    v12[2] = MEMORY[0x1E4F1CC38];
    uint64_t v8 = *MEMORY[0x1E4F56390];
    v11[2] = v7;
    v11[3] = v8;
    uint64_t v9 = *MEMORY[0x1E4F56380];
    v12[3] = v4;
    v12[4] = &unk_1EFAFDF20;
    uint64_t v10 = *MEMORY[0x1E4F56378];
    v11[4] = v9;
    v11[5] = v10;
    v12[5] = [NSNumber numberWithBool:v5];
    v11[6] = *MEMORY[0x1E4F56370];
    v12[6] = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[BWMemoryPool poolIdentifier](+[BWMemoryPool sharedMemoryPool](BWMemoryPool, "sharedMemoryPool"), "poolIdentifier"));
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:7];
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    return CMPhotoSurfacePoolCreate();
  }
  return result;
}

- (uint64_t)_setupJPEGContainerOptions
{
  v5[2] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = *MEMORY[0x1E4F56048];
    v4[0] = *MEMORY[0x1E4F56058];
    v4[1] = v2;
    v5[0] = &unk_1EFAFDF38;
    v5[1] = &unk_1EFAFDF50;
    CFTypeRef v3 = (CFTypeRef)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:2];
    if (v3) {
      CFTypeRef v3 = CFRetain(v3);
    }
    *(void *)(v1 + 80) = v3;
    if (v3) {
      return 0;
    }
    else {
      return 4294954510;
    }
  }
  return result;
}

- (uint64_t)_setupJPEGCompressionSession
{
  v5[4] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = *MEMORY[0x1E4F561B8];
    v4[0] = *MEMORY[0x1E4F561C0];
    v4[1] = v1;
    uint64_t v2 = *(void *)(result + 64);
    v5[0] = MEMORY[0x1E4F1CC38];
    v5[1] = v2;
    uint64_t v3 = *MEMORY[0x1E4F561A0];
    void v4[2] = *MEMORY[0x1E4F561B0];
    v4[3] = v3;
    v5[2] = MEMORY[0x1E4F1CC28];
    void v5[3] = MEMORY[0x1E4F1CC38];
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:4];
    return CMPhotoCompressionSessionCreate();
  }
  return result;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (void)dealloc
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (dword_1EB4C5050)
  {
    int v7 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    if (dword_1EB4C5050)
    {
      int v7 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      uint64_t v4 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }

  -[BWIntermediateJPEGCompressor _releaseResources]((uint64_t)self);
  v5.receiver = self;
  v5.super_class = (Class)BWIntermediateJPEGCompressor;
  [(BWIntermediateJPEGCompressor *)&v5 dealloc];
}

- (void)_releaseResources
{
  if (a1)
  {
    if (*(void *)(a1 + 72))
    {
      CMPhotoCompressionSessionReleaseHardwareResources();
      CMPhotoCompressionSessionFlushCachedBuffers();
      CMPhotoCompressionSessionInvalidate();
      uint64_t v2 = *(const void **)(a1 + 72);
      if (v2)
      {
        CFRelease(v2);
        *(void *)(a1 + 72) = 0;
      }
    }
    uint64_t v3 = *(const void **)(a1 + 64);
    if (v3)
    {
      CFRelease(v3);
      *(void *)(a1 + 64) = 0;
    }
    uint64_t v4 = *(const void **)(a1 + 80);
    if (v4)
    {
      CFRelease(v4);
      *(void *)(a1 + 80) = 0;
    }

    *(void *)(a1 + 88) = 0;
    objc_super v5 = *(const void **)(a1 + 96);
    if (v5)
    {
      CFRelease(v5);
      *(void *)(a1 + 96) = 0;
    }
    uint64_t v6 = *(const void **)(a1 + 104);
    if (v6)
    {
      CFRelease(v6);
      *(void *)(a1 + 104) = 0;
    }

    *(void *)(a1 + 16) = 0;
    *(_DWORD *)(a1 + 48) = 0;
    *(unsigned char *)(a1 + 60) = 0;
  }
}

- (void)flush
{
  if (self->_compressionSession)
  {
    CMPhotoCompressionSessionReleaseHardwareResources();
    CMPhotoCompressionSessionFlushCachedBuffers();
  }
  CMPhotoSurfacePoolDiscardCaches();
}

@end