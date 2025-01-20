@interface BWDetectedFacesRingBuffer
- (BWDetectedFacesRingBuffer)initWithDepth:(int)a3;
- (float)secondsSinceLastFaceDetected;
- (void)addFacesFromSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (void)dealloc;
- (void)flush;
- (void)transferFacesToSampleBuffer:(opaqueCMSampleBuffer *)a3 totalSensorCropRect:(CGRect)a4;
@end

@implementation BWDetectedFacesRingBuffer

- (BWDetectedFacesRingBuffer)initWithDepth:(int)a3
{
  if (a3 <= 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"depth must be at least 1" userInfo:0]);
  }
  v6.receiver = self;
  v6.super_class = (Class)BWDetectedFacesRingBuffer;
  v4 = [(BWDetectedFacesRingBuffer *)&v6 init];
  if (v4)
  {
    v4->_mutex = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
    v4->_ringBuffer = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a3];
    v4->_depth = a3;
  }
  return v4;
}

- (void)addFacesFromSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
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
    v10 = (void *)[v9 objectForKeyedSubscript:*MEMORY[0x1E4F53DC0]];
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
      if ([v11 count])
      {
        v13 = (void *)[v11 objectAtIndexedSubscript:0];
        objc_msgSend((id)objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E4F54348]), "longLongValue");
        int64_t v14 = FigHostTimeToNanoseconds();
        CMTimeMake(&v16, v14, 1000000000);
        CMTimeValue value = v16.value;
        CMTimeFlags flags = v16.flags;
        CMTimeScale timescale = v16.timescale;
        CMTimeEpoch epoch = v16.epoch;
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
      int numConsecutiveFramesWithFaces = self->_numConsecutiveFramesWithFaces;
      self->_int numConsecutiveFramesWithFaces = numConsecutiveFramesWithFaces + 1;
      if (numConsecutiveFramesWithFaces >= 3)
      {
        self->_lastStableFacePTS.CMTimeValue value = value;
        self->_lastStableFacePTS.CMTimeScale timescale = timescale;
        self->_lastStableFacePTS.CMTimeFlags flags = flags;
        self->_lastStableFacePTS.CMTimeEpoch epoch = epoch;
      }
    }
    else
    {
      self->_int numConsecutiveFramesWithFaces = 0;
    }
  }
  CMSampleBufferGetPresentationTimeStamp(&v16, a3);
  self->_lastUpdatePTS = ($95D729B680665BEAEFA1D6FCA8238556)v16;
  pthread_mutex_unlock((pthread_mutex_t *)self->_mutex);
}

- (void)transferFacesToSampleBuffer:(opaqueCMSampleBuffer *)a3 totalSensorCropRect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  pthread_mutex_lock((pthread_mutex_t *)self->_mutex);
  ringBuffer = self->_ringBuffer;
  memset(&v30, 0, sizeof(v30));
  CMSampleBufferGetPresentationTimeStamp(&v30, a3);
  CMTimeValue value = v30.value;
  CMTimeScale timescale = v30.timescale;
  uint64_t v40 = *(void *)&v30.flags;
  int epoch_high = HIDWORD(v30.epoch);
  int v13 = [(NSMutableArray *)ringBuffer count];
  memset(&v39, 0, sizeof(v39));
  CMTimeMake(&v39, 1, 1000);
  memset(&v38, 0, sizeof(v38));
  lhs.start.CMTimeValue value = value;
  lhs.start.CMTimeScale timescale = timescale;
  *(void *)&lhs.start.CMTimeFlags flags = v40;
  HIDWORD(lhs.start.epoch) = epoch_high;
  CMTime rhs = v39;
  CMTimeSubtract(&start, &lhs.start, &rhs);
  lhs.CMTime start = v39;
  CMTimeMultiply(&duration, &lhs.start, 2);
  CMTimeRangeMake(&v38, &start, &duration);
  if (v13 < 1)
  {
    int v16 = -1;
    LODWORD(v14) = -1;
    goto LABEL_12;
  }
  v28 = a3;
  uint64_t v14 = 0;
  uint64_t v29 = *MEMORY[0x1E4F54348];
  uint64_t v15 = v13;
  int v16 = -1;
  while (1)
  {
    v17 = (void *)[(NSMutableArray *)ringBuffer objectAtIndexedSubscript:v14];
    if ([v17 count]) {
      break;
    }
LABEL_9:
    if (v15 == ++v14) {
      goto LABEL_16;
    }
  }
  v18 = (void *)[v17 objectAtIndexedSubscript:0];
  memset(&rhs, 0, sizeof(rhs));
  objc_msgSend((id)objc_msgSend(v18, "objectForKeyedSubscript:", v29), "longLongValue");
  int64_t v19 = FigHostTimeToNanoseconds();
  CMTimeMake(&time, v19, 1000000000);
  CMTimeConvertScale(&rhs, &time, timescale, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
  lhs.start.CMTimeValue value = value;
  lhs.start.CMTimeScale timescale = timescale;
  *(void *)&lhs.start.CMTimeFlags flags = v40;
  HIDWORD(lhs.start.epoch) = epoch_high;
  CMTime time2 = rhs;
  CMTimeSubtract(&v33, &lhs.start, &time2);
  float Seconds = CMTimeGetSeconds(&v33);
  if (fabsf(Seconds) > 0.5) {
    goto LABEL_16;
  }
  CMTimeRange lhs = v38;
  CMTime time2 = rhs;
  if (!CMTimeRangeContainsTime(&lhs, &time2))
  {
    lhs.CMTime start = rhs;
    time2.CMTimeValue value = value;
    time2.CMTimeScale timescale = timescale;
    *(void *)&time2.CMTimeFlags flags = v40;
    HIDWORD(time2.epoch) = epoch_high;
    int32_t v21 = CMTimeCompare(&lhs.start, &time2);
    if (v21)
    {
      if (v21 < 1) {
        goto LABEL_17;
      }
      int v16 = v14;
      goto LABEL_9;
    }
  }
  if (v17)
  {
    a3 = v28;
    goto LABEL_24;
  }
LABEL_16:
  LODWORD(v14) = -1;
LABEL_17:
  a3 = v28;
  if (v14 == -1 && (v16 & 0x80000000) == 0)
  {
    uint64_t v22 = [(NSMutableArray *)ringBuffer lastObject];
    goto LABEL_23;
  }
  if (v16 == -1 && (v14 & 0x80000000) == 0)
  {
    uint64_t v22 = [(NSMutableArray *)ringBuffer firstObject];
    goto LABEL_23;
  }
LABEL_12:
  if (((v14 | v16) & 0x80000000) == 0)
  {
    uint64_t v22 = [(NSMutableArray *)ringBuffer objectAtIndexedSubscript:(v14 + v16) >> 1];
LABEL_23:
    v17 = (void *)v22;
    if (v22)
    {
LABEL_24:
      v23 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
      if ([v17 count])
      {
        int v24 = objc_msgSend((id)objc_msgSend(v23, "objectForKeyedSubscript:", *MEMORY[0x1E4F54168]), "intValue");
        int v25 = objc_msgSend((id)objc_msgSend(v23, "objectForKeyedSubscript:", *MEMORY[0x1E4F54160]), "intValue");
        if (v25 && v24)
        {
          int v26 = v25;
          v43.origin.CGFloat x = x;
          v43.origin.CGFloat y = y;
          v43.size.CGFloat width = width;
          v43.size.CGFloat height = height;
          if (CGRectIsEmpty(v43)) {
            goto LABEL_29;
          }
          v47.origin.CGFloat x = 0.0;
          v47.origin.CGFloat y = 0.0;
          v44.origin.CGFloat x = x;
          v44.origin.CGFloat y = y;
          v44.size.CGFloat width = width;
          v44.size.CGFloat height = height;
          v47.size.CGFloat width = (double)v24;
          v47.size.CGFloat height = (double)v26;
          if (CGRectEqualToRect(v44, v47))
          {
LABEL_29:
            [v23 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F53DC0]];
          }
          else
          {
            CGAffineTransformMakeScale((CGAffineTransform *)&v38, 1.0 / (double)v24, 1.0 / (double)v26);
            v45.origin.CGFloat x = x;
            v45.origin.CGFloat y = y;
            v45.size.CGFloat width = width;
            v45.size.CGFloat height = height;
            CGRect v46 = CGRectApplyAffineTransform(v45, (CGAffineTransform *)&v38);
            FacesArrayForCropRect = FigCaptureMetadataUtilitiesCreateFacesArrayForCropRect(v17, v46.origin.x, v46.origin.y, v46.size.width);
            [v23 setObject:FacesArrayForCropRect forKeyedSubscript:*MEMORY[0x1E4F53DC0]];
          }
        }
        else
        {
          fig_log_get_emitter();
          FigDebugAssert3();
        }
      }
    }
  }
  pthread_mutex_unlock((pthread_mutex_t *)self->_mutex);
}

- (void)dealloc
{
  FigSimpleMutexDestroy();
  v3.receiver = self;
  v3.super_class = (Class)BWDetectedFacesRingBuffer;
  [(BWDetectedFacesRingBuffer *)&v3 dealloc];
}

- (void)flush
{
  pthread_mutex_lock((pthread_mutex_t *)self->_mutex);
  [(NSMutableArray *)self->_ringBuffer removeAllObjects];
  muteCGFloat x = self->_mutex;
  pthread_mutex_unlock((pthread_mutex_t *)mutex);
}

- (float)secondsSinceLastFaceDetected
{
  pthread_mutex_lock((pthread_mutex_t *)self->_mutex);
  CMTimeFlags flags = self->_lastStableFacePTS.flags;
  float Seconds = -1.0;
  if (flags)
  {
    CMTimeFlags v5 = self->_lastUpdatePTS.flags;
    if (v5)
    {
      CMTimeValue value = self->_lastUpdatePTS.value;
      rhs.CMTimeEpoch epoch = self->_lastStableFacePTS.epoch;
      lhs.CMTimeValue value = value;
      lhs.CMTimeScale timescale = self->_lastUpdatePTS.timescale;
      lhs.CMTimeFlags flags = v5;
      CMTimeValue v7 = self->_lastStableFacePTS.value;
      lhs.CMTimeEpoch epoch = self->_lastUpdatePTS.epoch;
      rhs.CMTimeValue value = v7;
      rhs.CMTimeScale timescale = self->_lastStableFacePTS.timescale;
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