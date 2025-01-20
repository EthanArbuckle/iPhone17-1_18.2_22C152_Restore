@interface BWDeferredMetadataCache
- (BWDeferredMetadataCache)initWithCaptureStream:(id)a3 atomicTransactions:(BOOL)a4;
- (int)numberOfExpectedSampleBuffersForEachPTS;
- (void)addMetadataAttachmentToSampleBuffer:(opaqueCMSampleBuffer *)a3 withDutyCycleMetadataCache:(id)a4;
- (void)dealloc;
- (void)flush;
- (void)setNumberOfExpectedSampleBuffersForEachPTS:(int)a3;
@end

@implementation BWDeferredMetadataCache

- (void)setNumberOfExpectedSampleBuffersForEachPTS:(int)a3
{
  if (a3 <= 1) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], @"Can't set the expected number of sample buffers for each PTS to a number smaller than 2 (if you don't expect multiple per PTS, why use to cache"), 0 reason userInfo];
  }
  if (self->_numberOfExpectedSampleBuffersForEachPTS != a3) {
    self->_numberOfExpectedSampleBuffersForEachPTS = a3;
  }
}

- (BWDeferredMetadataCache)initWithCaptureStream:(id)a3 atomicTransactions:(BOOL)a4
{
  if (a3)
  {
    BOOL v4 = a4;
    v8.receiver = self;
    v8.super_class = (Class)BWDeferredMetadataCache;
    v6 = [(BWDeferredMetadataCache *)&v8 init];
    if (v6)
    {
      v6->_stream = (BWFigCaptureStream *)a3;
      if (v4) {
        v6->_lock = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
      }
      v6->_numberOfExpectedSampleBuffersForEachPTS = 2;
    }
  }
  else
  {

    return 0;
  }
  return v6;
}

- (void)dealloc
{
  dmc_removeAllCacheEntries((uint64_t)self->_cache);
  FigSimpleMutexDestroy();

  v3.receiver = self;
  v3.super_class = (Class)BWDeferredMetadataCache;
  [(BWDeferredMetadataCache *)&v3 dealloc];
}

- (void)addMetadataAttachmentToSampleBuffer:(opaqueCMSampleBuffer *)a3 withDutyCycleMetadataCache:(id)a4
{
  if (a3)
  {
    memset(&v28, 0, sizeof(v28));
    CMSampleBufferGetPresentationTimeStamp(&v28, a3);
    lock = self->_lock;
    if (lock) {
      pthread_mutex_lock((pthread_mutex_t *)lock);
    }
    uint64_t v8 = 0;
    CMTime v27 = v28;
    while (1)
    {
      if (self->_cache[v8].metadataDict)
      {
        CMTime time1 = (CMTime)self->_cache[v8].pts;
        CMTime time2 = v27;
        if (!CMTimeCompare(&time1, &time2)) {
          break;
        }
      }
      if (++v8 == 5)
      {
        if (![(BWFigCaptureStream *)self->_stream addAttachmentsToSampleBuffer:a3 options:0])
        {
          if (a4) {
            FigCaptureMetadataUtilitiesAddMissingDutyCycleMetadata(a3, a4);
          }
          memset(&time1, 0, sizeof(time1));
          CMSampleBufferGetPresentationTimeStamp(&time1, a3);
          CFDictionaryRef v9 = (const __CFDictionary *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
          if (v9 && (time1.flags & 1) != 0)
          {
            CFDictionaryRef v10 = v9;
            uint64_t v11 = 0;
            p_age = &self->_cache[0].age;
            int v13 = -1;
            uint64_t v14 = MEMORY[0x1E4F1F9F8];
            do
            {
              v15 = *(const void **)(p_age - 5);
              if (v15)
              {
                int v16 = ++*p_age;
                if (v16 >= 5)
                {
                  v17 = p_age - 17;
                  *(_OWORD *)v17 = *(_OWORD *)v14;
                  *((void *)v17 + 2) = *(void *)(v14 + 16);
                  CFRelease(v15);
                  *(void *)(p_age - 5) = 0;
                  *(_DWORD *)(p_age - 1) = 0;
                  if (v13 == -1) {
                    int v13 = v11;
                  }
                }
              }
              else
              {
                int v13 = v11;
              }
              ++v11;
              p_age += 20;
            }
            while (v11 != 5);
            if (v13 < 0) {
              -[BWDeferredMetadataCache addMetadataAttachmentToSampleBuffer:withDutyCycleMetadataCache:]();
            }
            v18 = &self->_cache[v13];
            v18->useCount = 1;
            CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, v10);
            v18->pts = ($95D729B680665BEAEFA1D6FCA8238556)time1;
            v18->metadataDict = MutableCopy;
            v18->age = 0;
          }
        }
        goto LABEL_29;
      }
    }
    v20 = (const void **)((char *)&self->super.isa + v8 * 40);
    signed __int16 v21 = self->_cache[v8].useCount + 1;
    self->_cache[v8].useCount = v21;
    if (self->_numberOfExpectedSampleBuffersForEachPTS <= v21)
    {
      dmc_attachMetadataDictToSampleBufferAndPixelBufferAndCleanupPrivateCaptureStreamAttachments(a3, v20[7]);
      uint64_t v24 = MEMORY[0x1E4F1F9F8];
      *((_OWORD *)v20 + 2) = *MEMORY[0x1E4F1F9F8];
      v20[6] = *(const void **)(v24 + 16);
      v25 = v20[7];
      if (v25)
      {
        CFRelease(v25);
        v20[7] = 0;
      }
      *((_WORD *)v20 + 32) = 0;
      self->_cache[v8].age = 0;
    }
    else
    {
      CFMutableDictionaryRef v22 = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, (CFDictionaryRef)v20[7]);
      if (v22)
      {
        CFMutableDictionaryRef v23 = v22;
        dmc_attachMetadataDictToSampleBufferAndPixelBufferAndCleanupPrivateCaptureStreamAttachments(a3, v22);
        CFRelease(v23);
      }
    }
LABEL_29:
    v26 = self->_lock;
    if (v26) {
      pthread_mutex_unlock((pthread_mutex_t *)v26);
    }
  }
}

- (void)flush
{
  lock = self->_lock;
  if (lock) {
    pthread_mutex_lock((pthread_mutex_t *)lock);
  }
  dmc_removeAllCacheEntries((uint64_t)self->_cache);
  BOOL v4 = self->_lock;
  if (v4)
  {
    pthread_mutex_unlock((pthread_mutex_t *)v4);
  }
}

- (int)numberOfExpectedSampleBuffersForEachPTS
{
  return self->_numberOfExpectedSampleBuffersForEachPTS;
}

- (void)addMetadataAttachmentToSampleBuffer:withDutyCycleMetadataCache:.cold.1()
{
  __assert_rtn("dmc_addCacheEntryForSampleBuffer", "BWMultiStreamCameraSourceNodeUtilities.m", 270, "cacheIndexToUse >= 0");
}

@end