@interface BWDetectedObjectsInfoRingBuffer
- (BWDetectedObjectsInfoRingBuffer)initWithRingBufferDepth:(int)a3;
- (float)secondsSinceLastObjectDetected;
- (id)objectsForPTS:(id *)a3;
- (void)addObjectsFromSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (void)dealloc;
- (void)flush;
- (void)transferObjectsToSampleBuffer:(opaqueCMSampleBuffer *)a3 totalSensorCropRect:(CGRect)a4;
@end

@implementation BWDetectedObjectsInfoRingBuffer

- (BWDetectedObjectsInfoRingBuffer)initWithRingBufferDepth:(int)a3
{
  if (a3 <= 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"depth must be at least 1" userInfo:0]);
  }
  v6.receiver = self;
  v6.super_class = (Class)BWDetectedObjectsInfoRingBuffer;
  v4 = [(BWDetectedObjectsInfoRingBuffer *)&v6 init];
  if (v4)
  {
    v4->_mutex = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
    v4->_ringBuffer = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a3];
    v4->_depth = a3;
  }
  return v4;
}

- (void)addObjectsFromSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  pthread_mutex_lock((pthread_mutex_t *)self->_mutex);
  ringBuffer = self->_ringBuffer;
  unint64_t depth = self->_depth;
  CMTimeValue value = *MEMORY[0x1E4F1F9F8];
  CMTimeFlags flags = *(_DWORD *)(MEMORY[0x1E4F1F9F8] + 12);
  CMTimeScale timescale = *(_DWORD *)(MEMORY[0x1E4F1F9F8] + 8);
  CMTimeEpoch epoch = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  v9 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  if (v9)
  {
    v10 = (void *)[v9 objectForKeyedSubscript:*MEMORY[0x1E4F53DC8]];
    if (v10)
    {
      v11 = v10;
      if (ringBuffer)
      {
        v12 = (void *)[v10 copy];
        [(NSMutableArray *)ringBuffer insertObject:v12 atIndex:0];
        if ([(NSMutableArray *)ringBuffer count] > depth) {
          [(NSMutableArray *)ringBuffer removeLastObject];
        }
      }
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:&v30 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v25;
        uint64_t v16 = *MEMORY[0x1E4F54348];
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v25 != v15) {
              objc_enumerationMutation(v11);
            }
            v18 = objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", *(void *)(*((void *)&v24 + 1) + 8 * i)), "objectForKeyedSubscript:", v16);
            if (v18)
            {
              memset(&v23, 0, sizeof(v23));
              [v18 longLongValue];
              int64_t v19 = FigHostTimeToNanoseconds();
              CMTimeMake(&v23, v19, 1000000000);
              CMTime time1 = v23;
              time2.CMTimeValue value = value;
              time2.CMTimeScale timescale = timescale;
              time2.CMTimeFlags flags = flags;
              time2.CMTimeEpoch epoch = epoch;
              if (CMTimeCompare(&time1, &time2) >= 1)
              {
                CMTimeValue value = v23.value;
                CMTimeFlags flags = v23.flags;
                CMTimeScale timescale = v23.timescale;
                CMTimeEpoch epoch = v23.epoch;
              }
            }
          }
          uint64_t v14 = [v11 countByEnumeratingWithState:&v24 objects:&v30 count:16];
        }
        while (v14);
      }
    }
    else
    {
      CMTimeValue value = *MEMORY[0x1E4F1F9F0];
      CMTimeFlags flags = *(_DWORD *)(MEMORY[0x1E4F1F9F0] + 12);
      CMTimeScale timescale = *(_DWORD *)(MEMORY[0x1E4F1F9F0] + 8);
      CMTimeEpoch epoch = *(void *)(MEMORY[0x1E4F1F9F0] + 16);
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  if ((~flags & 0x11) != 0)
  {
    if (flags)
    {
      int numConsecutiveFramesWithObjects = self->_numConsecutiveFramesWithObjects;
      self->_int numConsecutiveFramesWithObjects = numConsecutiveFramesWithObjects + 1;
      if (numConsecutiveFramesWithObjects >= 3)
      {
        self->_lastStableObjectPTS.CMTimeValue value = value;
        self->_lastStableObjectPTS.CMTimeScale timescale = timescale;
        self->_lastStableObjectPTS.CMTimeFlags flags = flags;
        self->_lastStableObjectPTS.CMTimeEpoch epoch = epoch;
      }
    }
    else
    {
      self->_int numConsecutiveFramesWithObjects = 0;
    }
  }
  CMSampleBufferGetPresentationTimeStamp(&v30, a3);
  self->_lastUpdatePTS = ($95D729B680665BEAEFA1D6FCA8238556)v30;
  pthread_mutex_unlock((pthread_mutex_t *)self->_mutex);
}

- (void)transferObjectsToSampleBuffer:(opaqueCMSampleBuffer *)a3 totalSensorCropRect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  pthread_mutex_lock((pthread_mutex_t *)self->_mutex);
  ringBuffer = self->_ringBuffer;
  memset(&v20, 0, sizeof(v20));
  CMSampleBufferGetPresentationTimeStamp(&v20, a3);
  *(_OWORD *)&v19.a = *(_OWORD *)&v20.value;
  *(void *)&v19.c = v20.epoch;
  uint64_t DetectedObjectsInfoClosestToPTS = doirb_findDetectedObjectsInfoClosestToPTS(ringBuffer, (CMTime *)&v19);
  if (DetectedObjectsInfoClosestToPTS)
  {
    v12 = (const void *)DetectedObjectsInfoClosestToPTS;
    uint64_t v13 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
    int v14 = objc_msgSend((id)objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E4F54168]), "intValue");
    int v15 = objc_msgSend((id)objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E4F54160]), "intValue");
    if (v15) {
      BOOL v16 = v14 == 0;
    }
    else {
      BOOL v16 = 1;
    }
    if (v16)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    else
    {
      int v17 = v15;
      v21.origin.CGFloat x = x;
      v21.origin.CGFloat y = y;
      v21.size.CGFloat width = width;
      v21.size.CGFloat height = height;
      if (CGRectIsEmpty(v21)) {
        goto LABEL_8;
      }
      v25.origin.CGFloat x = 0.0;
      v25.origin.CGFloat y = 0.0;
      v22.origin.CGFloat x = x;
      v22.origin.CGFloat y = y;
      v22.size.CGFloat width = width;
      v22.size.CGFloat height = height;
      v25.size.CGFloat width = (double)v14;
      v25.size.CGFloat height = (double)v17;
      if (CGRectEqualToRect(v22, v25))
      {
LABEL_8:
        [v13 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F53DC8]];
      }
      else
      {
        CGAffineTransformMakeScale(&v19, 1.0 / (double)v14, 1.0 / (double)v17);
        v23.origin.CGFloat x = x;
        v23.origin.CGFloat y = y;
        v23.size.CGFloat width = width;
        v23.size.CGFloat height = height;
        CGRect v24 = CGRectApplyAffineTransform(v23, &v19);
        DetectedObjectsInfoForCropRect = FigCaptureMetadataUtilitiesCreateDetectedObjectsInfoForCropRect(v12, v24.origin.x, v24.origin.y, v24.size.width);
        [v13 setObject:DetectedObjectsInfoForCropRect forKeyedSubscript:*MEMORY[0x1E4F53DC8]];
      }
    }
  }
  pthread_mutex_unlock((pthread_mutex_t *)self->_mutex);
}

- (void)dealloc
{
  FigSimpleMutexDestroy();
  v3.receiver = self;
  v3.super_class = (Class)BWDetectedObjectsInfoRingBuffer;
  [(BWDetectedObjectsInfoRingBuffer *)&v3 dealloc];
}

- (void)flush
{
  pthread_mutex_lock((pthread_mutex_t *)self->_mutex);
  [(NSMutableArray *)self->_ringBuffer removeAllObjects];
  muteCGFloat x = self->_mutex;
  pthread_mutex_unlock((pthread_mutex_t *)mutex);
}

- (id)objectsForPTS:(id *)a3
{
  pthread_mutex_lock((pthread_mutex_t *)self->_mutex);
  ringBuffer = self->_ringBuffer;
  CMTime v8 = *(CMTime *)a3;
  uint64_t DetectedObjectsInfoClosestToPTS = (void *)doirb_findDetectedObjectsInfoClosestToPTS(ringBuffer, &v8);
  pthread_mutex_unlock((pthread_mutex_t *)self->_mutex);
  return DetectedObjectsInfoClosestToPTS;
}

- (float)secondsSinceLastObjectDetected
{
  pthread_mutex_lock((pthread_mutex_t *)self->_mutex);
  CMTimeFlags flags = self->_lastStableObjectPTS.flags;
  float Seconds = -1.0;
  if (flags)
  {
    CMTimeFlags v5 = self->_lastUpdatePTS.flags;
    if (v5)
    {
      CMTimeValue value = self->_lastUpdatePTS.value;
      rhs.CMTimeEpoch epoch = self->_lastStableObjectPTS.epoch;
      lhs.CMTimeValue value = value;
      lhs.CMTimeScale timescale = self->_lastUpdatePTS.timescale;
      lhs.CMTimeFlags flags = v5;
      CMTimeValue v7 = self->_lastStableObjectPTS.value;
      lhs.CMTimeEpoch epoch = self->_lastUpdatePTS.epoch;
      rhs.CMTimeValue value = v7;
      rhs.CMTimeScale timescale = self->_lastStableObjectPTS.timescale;
      rhs.CMTimeFlags flags = flags;
      CMTimeSubtract(&time, &lhs, &rhs);
      float Seconds = CMTimeGetSeconds(&time);
      if (Seconds < 0.0) {
        float Seconds = 0.0;
      }
    }
  }
  pthread_mutex_unlock((pthread_mutex_t *)self->_mutex);
  return Seconds;
}

@end