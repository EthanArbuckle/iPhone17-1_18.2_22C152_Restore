@interface VCPVideoTrackSyncDecoder
- (VCPVideoTrackSyncDecoder)initWithTrack:(id)a3 timerange:(id *)a4;
- (int)decodeSample:(id *)a3 sample:(opaqueCMSampleBuffer *)a4;
- (int)findNextSample:(BOOL)a3 timerange:(id *)a4;
- (int64_t)status;
- (opaqueCMSampleBuffer)copyNextSampleBuffer;
- (void)dealloc;
- (void)decodeTask;
@end

@implementation VCPVideoTrackSyncDecoder

- (VCPVideoTrackSyncDecoder)initWithTrack:(id)a3 timerange:(id *)a4
{
  id v6 = a3;
  v30.receiver = self;
  v30.super_class = (Class)VCPVideoTrackSyncDecoder;
  id v7 = [(VCPVideoTrackDecoder *)&v30 initWithTrack:v6];
  if (v7)
  {
    if (v6) {
      [v6 timeRange];
    }
    else {
      memset(&range, 0, sizeof(range));
    }
    long long v9 = *(_OWORD *)&a4->var0.var3;
    *(_OWORD *)&v27.start.value = *(_OWORD *)&a4->var0.var0;
    *(_OWORD *)&v27.start.epoch = v9;
    *(_OWORD *)&v27.duration.timescale = *(_OWORD *)&a4->var1.var1;
    CMTimeRangeGetIntersection(&v29, &range, &v27);
    long long v11 = *(_OWORD *)&v29.start.epoch;
    long long v10 = *(_OWORD *)&v29.duration.timescale;
    *((_OWORD *)v7 + 2) = *(_OWORD *)&v29.start.value;
    *((_OWORD *)v7 + 3) = v11;
    *((_OWORD *)v7 + 4) = v10;
    *((unsigned char *)v7 + 80) = 0;
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.mediaanalysis.VCPVideoTrackSyncDecoder", 0);
    v13 = (void *)*((void *)v7 + 11);
    *((void *)v7 + 11) = v12;

    v14 = (void *)*((void *)v7 + 12);
    *((void *)v7 + 12) = 0;

    dispatch_semaphore_t v15 = dispatch_semaphore_create(0);
    v16 = (void *)*((void *)v7 + 13);
    *((void *)v7 + 13) = v15;

    dispatch_semaphore_t v17 = dispatch_semaphore_create(0);
    v18 = (void *)*((void *)v7 + 14);
    *((void *)v7 + 14) = v17;

    *((unsigned char *)v7 + 120) = 0;
    *((_DWORD *)v7 + 31) = 0;
    *((unsigned char *)v7 + 128) = 0;
    *((_DWORD *)v7 + 33) = 0;
    *((_DWORD *)v7 + 34) = 0;
    *((void *)v7 + 18) = 0;
    *((void *)v7 + 19) = 0;
    dispatch_semaphore_signal(*((dispatch_semaphore_t *)v7 + 13));
    dispatch_semaphore_signal(*((dispatch_semaphore_t *)v7 + 13));
    v19 = (void *)MEMORY[0x1E4F16378];
    v20 = [*((id *)v7 + 1) asset];
    uint64_t v21 = [v19 assetReaderWithAsset:v20 error:0];
    v22 = (void *)*((void *)v7 + 2);
    *((void *)v7 + 2) = v21;

    uint64_t v23 = [MEMORY[0x1E4F16398] assetReaderSampleReferenceOutputWithTrack:*((void *)v7 + 1)];
    v24 = (void *)*((void *)v7 + 3);
    *((void *)v7 + 3) = v23;

    [*((id *)v7 + 2) addOutput:*((void *)v7 + 3)];
    if ([*((id *)v7 + 2) startReading]) {
      v25 = v7;
    }
    else {
      v25 = 0;
    }
    v8 = v25;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)dealloc
{
  [(AVAssetReader *)self->_assetReader cancelReading];
  if (self->_group)
  {
    self->_cancelDecode = 1;
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_inputSemaphore);
    dispatch_group_wait((dispatch_group_t)self->_group, 0xFFFFFFFFFFFFFFFFLL);
  }
  uint64_t v3 = 0;
  char v4 = 1;
  do
  {
    char v5 = v4;
    id v6 = self->_sampleBuffer[v3];
    if (v6) {
      CFRelease(v6);
    }
    char v4 = 0;
    uint64_t v3 = 1;
  }
  while ((v5 & 1) != 0);
  v7.receiver = self;
  v7.super_class = (Class)VCPVideoTrackSyncDecoder;
  [(VCPVideoTrackSyncDecoder *)&v7 dealloc];
}

- (int64_t)status
{
  if (self->_decodeError) {
    return 3;
  }
  int outputFrameIdx = self->_outputFrameIdx;
  if (dispatch_group_wait((dispatch_group_t)self->_group, 0)) {
    return 1;
  }
  int v5 = outputFrameIdx & 1;
  if (outputFrameIdx < 0) {
    int v5 = -v5;
  }
  if (self->_sampleBuffer[v5]) {
    return 1;
  }
  else {
    return 2;
  }
}

- (int)findNextSample:(BOOL)a3 timerange:(id *)a4
{
  objc_super v7 = 0;
  long long v8 = *MEMORY[0x1E4F1FA20];
  long long v9 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 32);
  *(_OWORD *)&a4->var0.var3 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
  *(_OWORD *)&a4->var1.var1 = v9;
  *(_OWORD *)&a4->var0.var0 = v8;
  key = (void *)*MEMORY[0x1E4F1F200];
  CFTypeRef cf2 = (CFTypeRef)*MEMORY[0x1E4F1CFD0];
  long long v10 = (CMTime *)MEMORY[0x1E4F1FA48];
  while (1)
  {
    if (v7) {
      CFRelease(v7);
    }
    long long v11 = (opaqueCMSampleBuffer *)[(AVAssetReaderSampleReferenceOutput *)self->_trackReader copyNextSampleBuffer];
    if (!v11) {
      break;
    }
    objc_super v7 = v11;
    memset(&v28, 0, sizeof(v28));
    CMSampleBufferGetOutputPresentationTimeStamp(&start, v11);
    CMSampleBufferGetOutputDuration(&duration, v7);
    CMTimeRangeMake(&v28, &start, &duration);
    long long v12 = *(_OWORD *)&self->_timerange.start.epoch;
    *(_OWORD *)&range.start.value = *(_OWORD *)&self->_timerange.start.value;
    *(_OWORD *)&range.start.epoch = v12;
    *(_OWORD *)&range.duration.timescale = *(_OWORD *)&self->_timerange.duration.timescale;
    CMTimeRange otherRange = v28;
    CMTimeRangeGetIntersection(&v25, &range, &otherRange);
    CMTimeRange v28 = v25;
    if ((v25.start.flags & 1) != 0
      && (v28.duration.flags & 1) != 0
      && !v28.duration.epoch
      && (v28.duration.value & 0x8000000000000000) == 0)
    {
      v25.CMTime start = v28.duration;
      CMTime time2 = *v10;
      if (CMTimeCompare(&v25.start, &time2) >= 1)
      {
        if (a3
          || (CFArrayRef SampleAttachmentsArray = CMSampleBufferGetSampleAttachmentsArray(v7, 0)) != 0
          && (CFArrayRef v14 = SampleAttachmentsArray, CFArrayGetCount(SampleAttachmentsArray))
          && ((CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v14, 0),
               (Value = CFDictionaryGetValue(ValueAtIndex, key)) == 0)
           || (dispatch_semaphore_t v17 = Value, v18 = CFGetTypeID(Value), v18 != CFBooleanGetTypeID())
           || !CFEqual(v17, cf2)))
        {
          long long v19 = *(_OWORD *)&v28.start.epoch;
          *(_OWORD *)&a4->var0.var0 = *(_OWORD *)&v28.start.value;
          *(_OWORD *)&a4->var0.var3 = v19;
          *(_OWORD *)&a4->var1.var1 = *(_OWORD *)&v28.duration.timescale;
          CFRelease(v7);
          return 0;
        }
      }
    }
  }
  if ([(AVAssetReader *)self->_assetReader status] == AVAssetReaderStatusCompleted) {
    return 0;
  }
  else {
    return -19;
  }
}

- (int)decodeSample:(id *)a3 sample:(opaqueCMSampleBuffer *)a4
{
  *a4 = 0;
  objc_super v7 = (void *)MEMORY[0x1C186D320](self, a2);
  long long v8 = (void *)MEMORY[0x1E4F16378];
  long long v9 = [(AVAssetTrack *)self->super._track asset];
  id v22 = 0;
  long long v10 = [v8 assetReaderWithAsset:v9 error:&v22];
  id v11 = v22;

  if (v10) {
    BOOL v12 = v11 == 0;
  }
  else {
    BOOL v12 = 0;
  }
  if (!v12)
  {
    v13 = 0;
LABEL_9:
    int v18 = -18;
    goto LABEL_10;
  }
  long long v14 = *(_OWORD *)&a3->var0.var3;
  v21[0] = *(_OWORD *)&a3->var0.var0;
  v21[1] = v14;
  v21[2] = *(_OWORD *)&a3->var1.var1;
  [v10 setTimeRange:v21];
  dispatch_semaphore_t v15 = (void *)MEMORY[0x1E4F163A0];
  track = self->super._track;
  dispatch_semaphore_t v17 = [(VCPVideoTrackDecoder *)self settings];
  v13 = [v15 assetReaderTrackOutputWithTrack:track outputSettings:v17];

  if (!v13) {
    goto LABEL_9;
  }
  [v13 setAppliesPreferredTrackTransform:1];
  if (![v10 canAddOutput:v13]) {
    goto LABEL_9;
  }
  [v10 addOutput:v13];
  if ([v10 status]) {
    goto LABEL_9;
  }
  if ([v10 startReading])
  {
    v20 = (opaqueCMSampleBuffer *)[v13 copyNextSampleBuffer];
    *a4 = v20;
    if (v20) {
      int v18 = 0;
    }
    else {
      int v18 = -19;
    }
  }
  else
  {
    int v18 = -19;
  }
LABEL_10:
  if ([v10 status] == 1) {
    [v10 cancelReading];
  }

  return v18;
}

- (void)decodeTask
{
  memset(&v21, 0, sizeof(v21));
  long long v3 = *(_OWORD *)&self->_timerange.start.epoch;
  *(_OWORD *)&range.start.value = *(_OWORD *)&self->_timerange.start.value;
  *(_OWORD *)&range.start.epoch = v3;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&self->_timerange.duration.timescale;
  CMTimeRangeGetEnd(&v21, &range);
  char v4 = (long long *)MEMORY[0x1E4F1FA20];
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
  long long v17 = *MEMORY[0x1E4F1FA20];
  long long v18 = v5;
  long long v19 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 32);
  CMSampleBufferRef originalSBuf = 0;
  int v6 = [(VCPVideoTrackSyncDecoder *)self findNextSample:1 timerange:&v17];
  if (!v6)
  {
    if (BYTE12(v17))
    {
      while (1)
      {
        int v6 = 0;
        if ((BYTE4(v19) & 1) == 0 || *((void *)&v19 + 1) || (*((void *)&v18 + 1) & 0x8000000000000000) != 0) {
          break;
        }
        dispatch_semaphore_wait((dispatch_semaphore_t)self->_inputSemaphore, 0xFFFFFFFFFFFFFFFFLL);
        if (self->_cancelDecode) {
          goto LABEL_3;
        }
        long long v7 = v4[1];
        long long v13 = *v4;
        long long v14 = v7;
        long long v15 = v4[2];
        OSStatus v8 = [(VCPVideoTrackSyncDecoder *)self findNextSample:0 timerange:&v13];
        if (v8) {
          goto LABEL_22;
        }
        v12[0] = v17;
        v12[1] = v18;
        v12[2] = v19;
        OSStatus v8 = [(VCPVideoTrackSyncDecoder *)self decodeSample:v12 sample:&originalSBuf];
        if (v8) {
          goto LABEL_22;
        }
        if (BYTE12(v13))
        {
          long long v9 = (CMTime *)&v13;
          if ((BYTE4(v15) & (*((void *)&v15 + 1) == 0) & (v14 >= 0)) == 0) {
            long long v9 = &v21;
          }
        }
        else
        {
          long long v9 = &v21;
        }
        CMTime lhs = *v9;
        memset(&v11, 0, sizeof(v11));
        *(_OWORD *)&rhs.value = v17;
        rhs.epoch = v18;
        CMTimeSubtract(&v11.duration, &lhs, &rhs);
        *(_OWORD *)&v11.presentationTimeStamp.value = v17;
        v11.presentationTimeStamp.epoch = v18;
        *(_OWORD *)&v11.decodeTimeStamp.value = v17;
        v11.decodeTimeStamp.epoch = v18;
        int v10 = self->_decodedFrames >= 0 ? self->_decodedFrames & 1 : -(self->_decodedFrames & 1);
        OSStatus v8 = CMSampleBufferCreateCopyWithNewTiming(0, originalSBuf, 1, &v11, &self->_sampleBuffer[v10]);
        if (v8)
        {
LABEL_22:
          int v6 = v8;
          break;
        }
        if (originalSBuf)
        {
          CFRelease(originalSBuf);
          CMSampleBufferRef originalSBuf = 0;
        }
        dispatch_semaphore_signal((dispatch_semaphore_t)self->_outputSemaphore);
        long long v17 = v13;
        long long v18 = v14;
        long long v19 = v15;
        ++self->_decodedFrames;
        if ((BYTE12(v17) & 1) == 0) {
          goto LABEL_3;
        }
      }
    }
    else
    {
LABEL_3:
      int v6 = 0;
    }
    if (originalSBuf) {
      CFRelease(originalSBuf);
    }
  }
  self->_decodeError = v6;
  self->_decodeFinished = 1;
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_outputSemaphore);
}

- (opaqueCMSampleBuffer)copyNextSampleBuffer
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_launchOnce)
  {
    dispatch_group_t v3 = dispatch_group_create();
    group = v2->_group;
    v2->_group = (OS_dispatch_group *)v3;

    long long v5 = v2->_group;
    queue = v2->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__VCPVideoTrackSyncDecoder_copyNextSampleBuffer__block_invoke;
    block[3] = &unk_1E6296FF8;
    block[4] = v2;
    dispatch_group_async(v5, queue, block);
    v2->_launchOnce = 1;
  }
  objc_sync_exit(v2);

  if (v2->_decodeError || v2->_decodeFinished && v2->_outputFrameIdx >= v2->_decodedFrames) {
    return 0;
  }
  dispatch_semaphore_wait((dispatch_semaphore_t)v2->_outputSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  if (v2->_decodeError) {
    return 0;
  }
  int outputFrameIdx = v2->_outputFrameIdx;
  if (v2->_decodeFinished && outputFrameIdx >= v2->_decodedFrames) {
    return 0;
  }
  int v10 = v2->_outputFrameIdx & 1;
  if (outputFrameIdx < 0) {
    int v10 = -v10;
  }
  long long v7 = v2->_sampleBuffer[v10];
  v2->_sampleBuffer[v10] = 0;
  v2->_int outputFrameIdx = outputFrameIdx + 1;
  dispatch_semaphore_signal((dispatch_semaphore_t)v2->_inputSemaphore);
  return v7;
}

uint64_t __48__VCPVideoTrackSyncDecoder_copyNextSampleBuffer__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) decodeTask];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputSemaphore, 0);
  objc_storeStrong((id *)&self->_inputSemaphore, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_trackReader, 0);
  objc_storeStrong((id *)&self->_assetReader, 0);
}

@end