@interface HMIVideoAssetWriter
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentFragmentStartTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastAudioPresentationTimeStamp;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastVideoPresentationTimeStamp;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)preferredOutputSegmentInterval;
- (AVAssetWriter)assetWriter;
- (AVAssetWriterInput)audioInput;
- (AVAssetWriterInput)videoInput;
- (BOOL)allowRecoveryFromInsufficientAudioTrim;
- (BOOL)dropSamplesUntilSync;
- (BOOL)dropTrimDurationAttachments;
- (HMIVideoAssetWriter)initWithVideoFormat:(opaqueCMFormatDescription *)a3 audioFormat:(opaqueCMFormatDescription *)a4;
- (HMIVideoAssetWriter)initWithVideoFormat:(opaqueCMFormatDescription *)a3 audioFormat:(opaqueCMFormatDescription *)a4 initialFragmentSequenceNumber:(unint64_t)a5 preferredOutputSegmentInterval:(id *)a6;
- (HMIVideoAssetWriterDelegate)delegate;
- (NSString)logIdentifier;
- (OS_dispatch_queue)delegateQueue;
- (OS_dispatch_queue)workQueue;
- (id)assetWriterDidOutputSeparableSegment;
- (opaqueCMFormatDescription)audioFormat;
- (opaqueCMFormatDescription)videoFormat;
- (void)_appendSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (void)_ensureFirstAudioSampleBufferHasSufficientPrimingTrim:(opaqueCMSampleBuffer *)a3;
- (void)_failWithDescription:(id)a3;
- (void)_flushAutomatically:(opaqueCMSampleBuffer *)a3;
- (void)_removeTrimDurationAttachmentsFromAudioSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (void)_startWritingAtStartTime:(id *)a3;
- (void)assetWriter:(id)a3 didOutputSegmentData:(id)a4 segmentType:(int64_t)a5 segmentReport:(id)a6;
- (void)dealloc;
- (void)flush;
- (void)flushWithCompletionHandler:(id)a3;
- (void)handleSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (void)setAssetWriter:(id)a3;
- (void)setAssetWriterDidOutputSeparableSegment:(id)a3;
- (void)setCurrentFragmentStartTime:(id *)a3;
- (void)setDelegate:(id)a3;
- (void)setDropSamplesUntilSync:(BOOL)a3;
- (void)setDropTrimDurationAttachments:(BOOL)a3;
- (void)setLastAudioPresentationTimeStamp:(id *)a3;
- (void)setLastVideoPresentationTimeStamp:(id *)a3;
- (void)setLogIdentifier:(id)a3;
- (void)setPreferredOutputSegmentInterval:(id *)a3;
@end

@implementation HMIVideoAssetWriter

- (HMIVideoAssetWriter)initWithVideoFormat:(opaqueCMFormatDescription *)a3 audioFormat:(opaqueCMFormatDescription *)a4
{
  long long v5 = *MEMORY[0x263F01088];
  uint64_t v6 = *(void *)(MEMORY[0x263F01088] + 16);
  return [(HMIVideoAssetWriter *)self initWithVideoFormat:a3 audioFormat:a4 initialFragmentSequenceNumber:1 preferredOutputSegmentInterval:&v5];
}

- (HMIVideoAssetWriter)initWithVideoFormat:(opaqueCMFormatDescription *)a3 audioFormat:(opaqueCMFormatDescription *)a4 initialFragmentSequenceNumber:(unint64_t)a5 preferredOutputSegmentInterval:(id *)a6
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  v43.receiver = self;
  v43.super_class = (Class)HMIVideoAssetWriter;
  v10 = [(HMIVideoAssetWriter *)&v43 init];
  if (!v10) {
    goto LABEL_11;
  }
  v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v12 = dispatch_queue_create("HMIVideoAssetWriter", v11);
  v13 = (void *)*((void *)v10 + 7);
  *((void *)v10 + 7) = v12;

  v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v15 = dispatch_queue_create("HMIVideoAssetWriterOutput", v14);
  v16 = (void *)*((void *)v10 + 8);
  *((void *)v10 + 8) = v15;

  *((void *)v10 + 9) = CFRetain(a3);
  if (a4) {
    CFTypeRef v17 = CFRetain(a4);
  }
  else {
    CFTypeRef v17 = 0;
  }
  *((void *)v10 + 10) = v17;
  v10[26] = 1;
  *((_WORD *)v10 + 12) = 1;
  *((void *)v10 + 1) = 0;
  int64_t var3 = a6->var3;
  *((_OWORD *)v10 + 7) = *(_OWORD *)&a6->var0;
  *((void *)v10 + 16) = var3;
  uint64_t v19 = MEMORY[0x263F01090];
  long long v20 = *MEMORY[0x263F01090];
  *(_OWORD *)(v10 + 136) = *MEMORY[0x263F01090];
  uint64_t v21 = *(void *)(v19 + 16);
  *((void *)v10 + 19) = v21;
  *((_OWORD *)v10 + 10) = v20;
  *((void *)v10 + 22) = v21;
  *(_OWORD *)(v10 + 184) = v20;
  *((void *)v10 + 25) = v21;
  if (!objc_opt_class())
  {
    id v40 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"UTType class is not available." userInfo:0];
    objc_exception_throw(v40);
  }
  id v22 = objc_alloc(MEMORY[0x263EFA518]);
  v23 = [MEMORY[0x263F1D928] typeWithIdentifier:*MEMORY[0x263EF9888]];
  v24 = (void *)[v22 initWithContentType:v23];

  [v24 setDelegate:v10];
  [v24 setOutputFileTypeProfile:*MEMORY[0x263EF9890]];
  long long v41 = *MEMORY[0x263F01088];
  uint64_t v42 = *(void *)(MEMORY[0x263F01088] + 16);
  [v24 setPreferredOutputSegmentInterval:&v41];
  [v24 setInitialMovieFragmentSequenceNumber:a5];
  [v24 setProducesCombinableFragments:1];
  id v25 = objc_alloc(MEMORY[0x263EFA520]);
  v26 = (void *)[v25 initWithMediaType:*MEMORY[0x263EF9D48] outputSettings:0 sourceFormatHint:a3];
  [v26 setExpectsMediaDataInRealTime:1];
  [v26 setMediaTimeScale:1000];
  if (![v24 canAddInput:v26])
  {
    v31 = (void *)MEMORY[0x22A641C70]();
    v32 = v10;
    v33 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      v34 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v45 = v34;
      _os_log_impl(&dword_225DC6000, v33, OS_LOG_TYPE_ERROR, "%{public}@Cannot add video input.", buf, 0xCu);
    }
    goto LABEL_18;
  }
  [v24 addInput:v26];
  objc_storeStrong((id *)v10 + 12, v26);
  if (a4)
  {
    v27 = [MEMORY[0x263EFA520] assetWriterInputWithMediaType:*MEMORY[0x263EF9CE8] outputSettings:0 sourceFormatHint:a4];
    [v27 setExpectsMediaDataInRealTime:1];
    if ([v24 canAddInput:v27])
    {
      [v24 addInput:v27];
      v28 = (void *)*((void *)v10 + 13);
      *((void *)v10 + 13) = v27;

      goto LABEL_10;
    }
    v35 = (void *)MEMORY[0x22A641C70]();
    v36 = v10;
    v37 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      v38 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v45 = v38;
      _os_log_impl(&dword_225DC6000, v37, OS_LOG_TYPE_ERROR, "%{public}@Cannot add audio input.", buf, 0xCu);
    }

LABEL_18:
    v30 = 0;
    goto LABEL_19;
  }
LABEL_10:
  v29 = (void *)*((void *)v10 + 6);
  *((void *)v10 + 6) = v24;

LABEL_11:
  v30 = v10;
LABEL_19:

  return v30;
}

- (void)dealloc
{
  CFRelease(self->_videoFormat);
  audioFormat = self->_audioFormat;
  if (audioFormat) {
    CFRelease(audioFormat);
  }
  v4.receiver = self;
  v4.super_class = (Class)HMIVideoAssetWriter;
  [(HMIVideoAssetWriter *)&v4 dealloc];
}

- (void)_startWritingAtStartTime:(id *)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v21 = *a3;
  [(HMIVideoAssetWriter *)self setCurrentFragmentStartTime:&v21];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v20 = *a3;
  long long v5 = [(HMIVideoAssetWriter *)self assetWriter];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v19 = v20;
  [v5 setInitialSegmentStartTime:&v19];

  uint64_t v6 = [(HMIVideoAssetWriter *)self assetWriter];
  char v7 = [v6 startWriting];

  v8 = (void *)MEMORY[0x22A641C70]();
  v9 = self;
  v10 = HMFGetOSLogHandle();
  v11 = v10;
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      dispatch_queue_t v12 = HMFGetLogIdentifier();
      $3CC8671D27C23BF42ADDB32F2B5E48AE buf = *a3;
      v13 = HMICMTimeDescription((CMTime *)&buf);
      LODWORD(buf.var0) = 138543618;
      *(int64_t *)((char *)&buf.var0 + 4) = (int64_t)v12;
      LOWORD(buf.var2) = 2112;
      *(void *)((char *)&buf.var2 + 2) = v13;
      _os_log_impl(&dword_225DC6000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Started writing at %@", (uint8_t *)&buf, 0x16u);
    }
    v9->super.super._status = 2;
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v14 = HMFGetLogIdentifier();
      dispatch_queue_t v15 = [(HMIVideoAssetWriter *)v9 assetWriter];
      uint64_t v16 = [v15 status];
      CFTypeRef v17 = [(HMIVideoAssetWriter *)v9 assetWriter];
      v18 = [v17 error];
      LODWORD(buf.var0) = 138543874;
      *(int64_t *)((char *)&buf.var0 + 4) = (int64_t)v14;
      LOWORD(buf.var2) = 2048;
      *(void *)((char *)&buf.var2 + 2) = v16;
      HIWORD(buf.var3) = 2112;
      v23 = v18;
      _os_log_impl(&dword_225DC6000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to start writing, assetWriter.status: %ld, assetWriter:.error: %@", (uint8_t *)&buf, 0x20u);
    }
  }
}

- (void)assetWriter:(id)a3 didOutputSegmentData:(id)a4 segmentType:(int64_t)a5 segmentReport:(id)a6
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = (void *)MEMORY[0x22A641C70]();
  v14 = (void *)MEMORY[0x22A641C70]();
  dispatch_queue_t v15 = self;
  uint64_t v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    CFTypeRef v17 = HMFGetLogIdentifier();
    *(_DWORD *)$3CC8671D27C23BF42ADDB32F2B5E48AE buf = 138543618;
    v27 = v17;
    __int16 v28 = 2048;
    int64_t v29 = a5;
    _os_log_impl(&dword_225DC6000, v16, OS_LOG_TYPE_DEBUG, "%{public}@didOutputSegmentData segmentType: %ld", buf, 0x16u);
  }
  if (a5 == 2)
  {
    $3CC8671D27C23BF42ADDB32F2B5E48AE v20 = [(HMIVideoAssetWriter *)v15 delegateQueue];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __82__HMIVideoAssetWriter_assetWriter_didOutputSegmentData_segmentType_segmentReport___block_invoke_2;
    v21[3] = &unk_26477E978;
    v21[4] = v15;
    $3CC8671D27C23BF42ADDB32F2B5E48AE v19 = &v22;
    id v22 = v11;
    v23 = v12;
    dispatch_async(v20, v21);

    v18 = v23;
    goto LABEL_7;
  }
  if (a5 == 1)
  {
    v18 = [(HMIVideoAssetWriter *)v15 delegateQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __82__HMIVideoAssetWriter_assetWriter_didOutputSegmentData_segmentType_segmentReport___block_invoke;
    block[3] = &unk_26477B788;
    block[4] = v15;
    $3CC8671D27C23BF42ADDB32F2B5E48AE v19 = &v25;
    id v25 = v11;
    dispatch_async(v18, block);
LABEL_7:
  }
}

void __82__HMIVideoAssetWriter_assetWriter_didOutputSegmentData_segmentType_segmentReport___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) delegate];
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = (void *)[*(id *)(a1 + 40) copy];
  [v4 assetWriter:v2 didOutputInitializationSegment:v3];
}

void __82__HMIVideoAssetWriter_assetWriter_didOutputSegmentData_segmentType_segmentReport___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = (void *)[*(id *)(a1 + 40) copy];
  [v2 assetWriter:v3 didOutputSeparableSegment:v4 segmentReport:*(void *)(a1 + 48)];

  long long v5 = [*(id *)(a1 + 32) assetWriterDidOutputSeparableSegment];

  if (v5)
  {
    uint64_t v6 = [*(id *)(a1 + 32) assetWriterDidOutputSeparableSegment];
    v6[2]();
  }
}

- (void)_flushAutomatically:(opaqueCMSampleBuffer *)a3
{
  if (HMICMSampleBufferIsVideo(a3))
  {
    [(HMIVideoAssetWriter *)self currentFragmentStartTime];
    if (v18)
    {
      [(HMIVideoAssetWriter *)self preferredOutputSegmentInterval];
      if ((v17 & 1) == 0
        || ([(HMIVideoAssetWriter *)self preferredOutputSegmentInterval],
            (v16 & 0x10) == 0))
      {
        if (HMICMSampleBufferIsSync(a3))
        {
          memset(&v15, 0, sizeof(v15));
          CMSampleBufferGetPresentationTimeStamp(&v15, a3);
          memset(&v14, 0, sizeof(v14));
          [(HMIVideoAssetWriter *)self currentFragmentStartTime];
          CMTime lhs = v15;
          CMTimeSubtract(&v14, &lhs, &rhs);
          memset(&lhs, 0, sizeof(lhs));
          [(HMIVideoAssetWriter *)self preferredOutputSegmentInterval];
          CMTime v9 = v14;
          CMTimeSubtract(&time, &v9, &v10);
          CMTimeAbsoluteValue(&lhs, &time);
          memset(&v9, 0, sizeof(v9));
          [(HMIVideoAssetWriter *)self preferredOutputSegmentInterval];
          CMTimeMultiplyByRatio(&v9, &v8, 1, 10);
          CMTime time1 = lhs;
          CMTime time2 = v9;
          if (CMTimeCompare(&time1, &time2) <= 0)
          {
            [(HMIVideoAssetWriter *)self flushWithCompletionHandler:&__block_literal_global_38];
            CMTime v5 = v15;
            [(HMIVideoAssetWriter *)self setCurrentFragmentStartTime:&v5];
          }
        }
      }
    }
  }
}

- (void)handleSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  -[HMIVideoAssetWriter _flushAutomatically:](self, "_flushAutomatically:");
  CFRetain(a3);
  CMTime v5 = [(HMIVideoAssetWriter *)self workQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __42__HMIVideoAssetWriter_handleSampleBuffer___block_invoke;
  v6[3] = &unk_26477D798;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);
}

void __42__HMIVideoAssetWriter_handleSampleBuffer___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _appendSampleBuffer:*(void *)(a1 + 40)];
  uint64_t v2 = *(const void **)(a1 + 40);
  CFRelease(v2);
}

- (void)_removeTrimDurationAttachmentsFromAudioSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  if (HMICMSampleBufferIsAudio(a3))
  {
    CMRemoveAttachment(a3, (CFStringRef)*MEMORY[0x263F01068]);
    CFStringRef v4 = (const __CFString *)*MEMORY[0x263F01060];
    CMRemoveAttachment(a3, v4);
  }
  else
  {
    CMTime v5 = (HMIVideoAssetWriter *)_HMFPreconditionFailure();
    [(HMIVideoAssetWriter *)v5 _ensureFirstAudioSampleBufferHasSufficientPrimingTrim:v7];
  }
}

- (void)_ensureFirstAudioSampleBufferHasSufficientPrimingTrim:(opaqueCMSampleBuffer *)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (!HMICMSampleBufferIsAudio(a3)) {
    _HMFPreconditionFailure();
  }
  StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription([(HMIVideoAssetWriter *)self audioFormat]);
  if (StreamBasicDescription)
  {
    SEL v6 = StreamBasicDescription;
    CMTime v22 = *(CMTime *)*(void *)&MEMORY[0x263F010E0];
    CMAttachmentMode attachmentModeOut = 0;
    CFStringRef v7 = (const __CFString *)*MEMORY[0x263F01068];
    CFDictionaryRef v8 = (const __CFDictionary *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x263F01068], &attachmentModeOut);
    if (v8) {
      CMTimeMakeFromDictionary(&v22, v8);
    }
    int32_t mSampleRate = (int)v6->mSampleRate;
    CMTime time = v22;
    CMTimeConvertScale(&v20, &time, mSampleRate, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
    int64_t v10 = v6->mFramesPerPacket >> (v6->mFormatID == 1633772389);
    if (v20.value < v10)
    {
      memset(&v19, 0, sizeof(v19));
      id v11 = CMTimeMake(&v19, v10, (int)v6->mSampleRate);
      id v12 = (void *)MEMORY[0x22A641C70](v11);
      v13 = self;
      CMTime v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        CMTime v15 = HMFGetLogIdentifier();
        CMTime time = v22;
        char v16 = HMICMTimeDescription(&time);
        CMTime time = v19;
        char v17 = HMICMTimeDescription(&time);
        LODWORD(time.value) = 138543874;
        *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v15;
        LOWORD(time.flags) = 2112;
        *(void *)((char *)&time.flags + 2) = v16;
        HIWORD(time.epoch) = 2112;
        uint64_t v24 = v17;
        _os_log_impl(&dword_225DC6000, v14, OS_LOG_TYPE_ERROR, "%{public}@Trying to recover by adjusting trim duration from %@ to the minimum trim duration: %@", (uint8_t *)&time, 0x20u);
      }
      CMTime time = v19;
      CFDictionaryRef v18 = CMTimeCopyAsDictionary(&time, 0);
      CMSetAttachment(a3, v7, v18, 1u);
      CFRelease(v18);
    }
  }
}

- (void)_appendSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  CMTime v5 = [(HMIVideoAssetWriter *)self workQueue];
  dispatch_assert_queue_V2(v5);

  if (self->super.super._status == 4)
  {
    SEL v6 = (void *)MEMORY[0x22A641C70]();
    CFStringRef v7 = self;
    CFDictionaryRef v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      CMTime v9 = HMFGetLogIdentifier();
      int64_t v10 = HMICMSampleBufferFormattedDescription(a3, 0);
      LODWORD(buf.value) = 138543618;
      *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v9;
      LOWORD(buf.flags) = 2112;
      *(void *)((char *)&buf.flags + 2) = v10;
      _os_log_impl(&dword_225DC6000, v8, OS_LOG_TYPE_ERROR, "%{public}@Asset writer has failed fatally, ignoring %@", (uint8_t *)&buf, 0x16u);
    }
    return;
  }
  memset(&v59, 0, sizeof(v59));
  CMSampleBufferGetPresentationTimeStamp(&v59, a3);
  id v11 = [(HMIVideoAssetWriter *)self assetWriter];
  BOOL v12 = [v11 status] == 0;

  if (v12)
  {
    CMTime buf = v59;
    [(HMIVideoAssetWriter *)self _startWritingAtStartTime:&buf];
    self->_dropSamplesUntilSync = 1;
    self->_dropTrimDurationAttachments = 0;
    $3CC8671D27C23BF42ADDB32F2B5E48AE v21 = [(HMIVideoAssetWriter *)self assetWriter];
    CMTime buf = *(CMTime *)*(void *)&MEMORY[0x263F010E0];
    [v21 startSessionAtSourceTime:&buf];

LABEL_11:
    if (HMICMSampleBufferIsVideo(a3))
    {
      CMTime v22 = [(HMIVideoAssetWriter *)self videoInput];
    }
    else
    {
      if (!HMICMSampleBufferIsAudio(a3)) {
        goto LABEL_20;
      }
      CMTime v22 = [(HMIVideoAssetWriter *)self audioInput];
    }
    v23 = v22;
    if (v22)
    {
      if ([v22 isReadyForMoreMediaData])
      {
        uint64_t v24 = [v23 mediaType];
        int v25 = [v24 isEqualToString:*MEMORY[0x263EF9D48]];

        if (!v25)
        {
LABEL_30:
          if (HMICMSampleBufferIsAudio(a3))
          {
            if (self->_dropTrimDurationAttachments)
            {
              [(HMIVideoAssetWriter *)self _removeTrimDurationAttachmentsFromAudioSampleBuffer:a3];
            }
            else
            {
              self->_dropTrimDurationAttachments = 1;
              if ([(HMIVideoAssetWriter *)self allowRecoveryFromInsufficientAudioTrim])
              {
                [(HMIVideoAssetWriter *)self _ensureFirstAudioSampleBufferHasSufficientPrimingTrim:a3];
              }
            }
          }
          if ([v23 appendSampleBuffer:a3])
          {
            if (HMICMSampleBufferIsVideo(a3))
            {
              CMSampleBufferGetPresentationTimeStamp(&v58, a3);
              CMTime v57 = v58;
              [(HMIVideoAssetWriter *)self setLastVideoPresentationTimeStamp:&v57];
            }
            else if (HMICMSampleBufferIsAudio(a3))
            {
              CMSampleBufferGetPresentationTimeStamp(&v56, a3);
              CMTime v55 = v56;
              [(HMIVideoAssetWriter *)self setLastAudioPresentationTimeStamp:&v55];
            }
            [(HMIVideoAssetWriter *)self lastVideoPresentationTimeStamp];
            if (v54)
            {
              [(HMIVideoAssetWriter *)self lastAudioPresentationTimeStamp];
              if (v53)
              {
                memset(&buf, 0, sizeof(buf));
                [(HMIVideoAssetWriter *)self lastVideoPresentationTimeStamp];
                [(HMIVideoAssetWriter *)self lastAudioPresentationTimeStamp];
                CMTimeSubtract(&buf, &lhs, &rhs);
                CMTime time = buf;
                if (fabs(CMTimeGetSeconds(&time)) > 1.0)
                {
                  v45 = (void *)MEMORY[0x22A641C70]();
                  uint64_t v46 = self;
                  HMFGetOSLogHandle();
                  v47 = (id)objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
                  {
                    HMFGetLogIdentifier();
                    id v48 = (id)objc_claimAutoreleasedReturnValue();
                    CMTime time = buf;
                    Float64 Seconds = CMTimeGetSeconds(&time);
                    *(_DWORD *)v60 = 138543618;
                    id v61 = v48;
                    __int16 v62 = 2048;
                    Float64 v63 = Seconds;
                    _os_log_impl(&dword_225DC6000, v47, OS_LOG_TYPE_DEBUG, "%{public}@Video / Audio Drift (video is ahead by) %+4.3f", v60, 0x16u);
                  }
                }
              }
            }
          }
          else
          {
            v38 = (void *)MEMORY[0x22A641C70]();
            v39 = self;
            HMFGetOSLogHandle();
            id v40 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              id v41 = (id)objc_claimAutoreleasedReturnValue();
              HMICMSampleBufferFormattedDescription(a3, 0);
              id v42 = (id)objc_claimAutoreleasedReturnValue();
              objc_super v43 = [(HMIVideoAssetWriter *)v39 assetWriter];
              v44 = [v43 error];
              LODWORD(buf.value) = 138543874;
              *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v41;
              LOWORD(buf.flags) = 2112;
              *(void *)((char *)&buf.flags + 2) = v42;
              HIWORD(buf.epoch) = 2112;
              v65 = v44;
              _os_log_impl(&dword_225DC6000, v40, OS_LOG_TYPE_ERROR, "%{public}@Dropped    %@ because of input error %@", (uint8_t *)&buf, 0x20u);
            }
          }
          goto LABEL_49;
        }
        if (HMICMSampleBufferIsSync(a3))
        {
          self->_dropSamplesUntilSync = 0;
          goto LABEL_30;
        }
        if (!self->_dropSamplesUntilSync) {
          goto LABEL_30;
        }
        v31 = (void *)MEMORY[0x22A641C70]();
        v32 = self;
        v33 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        {
          v36 = HMFGetLogIdentifier();
          v37 = HMICMSampleBufferFormattedDescription(a3, 0);
          LODWORD(buf.value) = 138543618;
          *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v36;
          LOWORD(buf.flags) = 2112;
          *(void *)((char *)&buf.flags + 2) = v37;
          _os_log_impl(&dword_225DC6000, v33, OS_LOG_TYPE_DEBUG, "%{public}@Dropped    %@ because asset writer is waiting for a sync sample.", (uint8_t *)&buf, 0x16u);
        }
      }
      else
      {
        v31 = (void *)MEMORY[0x22A641C70]();
        v32 = self;
        v33 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          v34 = HMFGetLogIdentifier();
          v35 = HMICMSampleBufferFormattedDescription(a3, 0);
          LODWORD(buf.value) = 138543874;
          *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v34;
          LOWORD(buf.flags) = 2112;
          *(void *)((char *)&buf.flags + 2) = v35;
          HIWORD(buf.epoch) = 2112;
          v65 = v23;
          _os_log_impl(&dword_225DC6000, v33, OS_LOG_TYPE_ERROR, "%{public}@Dropped    %@ because an input %@ is not ready for more media data.", (uint8_t *)&buf, 0x20u);
        }
      }

LABEL_49:

      return;
    }
LABEL_20:
    v26 = (void *)MEMORY[0x22A641C70]();
    v27 = self;
    __int16 v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      int64_t v29 = HMFGetLogIdentifier();
      uint64_t v30 = HMICMSampleBufferFormattedDescription(a3, 0);
      LODWORD(buf.value) = 138543618;
      *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v29;
      LOWORD(buf.flags) = 2112;
      *(void *)((char *)&buf.flags + 2) = v30;
      _os_log_impl(&dword_225DC6000, v28, OS_LOG_TYPE_ERROR, "%{public}@Dropped   %@ because an input for the media type was not found.", (uint8_t *)&buf, 0x16u);
    }
    v23 = 0;
    goto LABEL_49;
  }
  v13 = [(HMIVideoAssetWriter *)self assetWriter];
  BOOL v14 = [v13 status] == 3;

  if (!v14) {
    goto LABEL_11;
  }
  CMTime v15 = (void *)MEMORY[0x22A641C70]();
  char v16 = self;
  char v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    CFDictionaryRef v18 = HMFGetLogIdentifier();
    CMTime v19 = [(HMIVideoAssetWriter *)v16 assetWriter];
    CMTime v20 = [v19 error];
    LODWORD(buf.value) = 138543618;
    *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v18;
    LOWORD(buf.flags) = 2112;
    *(void *)((char *)&buf.flags + 2) = v20;
    _os_log_impl(&dword_225DC6000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to write to asset writer, error %@", (uint8_t *)&buf, 0x16u);
  }
  [(HMIVideoAssetWriter *)v16 _failWithDescription:@"Underlying asset writer has failed."];
}

- (void)flushWithCompletionHandler:(id)a3
{
  id v4 = a3;
  CMTime v5 = [(HMIVideoAssetWriter *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __50__HMIVideoAssetWriter_flushWithCompletionHandler___block_invoke;
  v7[3] = &unk_26477BD58;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __50__HMIVideoAssetWriter_flushWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) status] == 4)
  {
    uint64_t v2 = (void *)MEMORY[0x22A641C70]();
    id v3 = *(id *)(a1 + 32);
    id v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      CMTime v5 = HMFGetLogIdentifier();
      *(_DWORD *)CMTime buf = 138543362;
      v32 = v5;
      id v6 = "%{public}@Asset writer has failed fatally, ignoring flush.";
      CFStringRef v7 = v4;
      os_log_type_t v8 = OS_LOG_TYPE_ERROR;
LABEL_7:
      _os_log_impl(&dword_225DC6000, v7, v8, v6, buf, 0xCu);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if ([*(id *)(a1 + 32) dropSamplesUntilSync])
  {
    uint64_t v2 = (void *)MEMORY[0x22A641C70]();
    id v3 = *(id *)(a1 + 32);
    id v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      CMTime v5 = HMFGetLogIdentifier();
      *(_DWORD *)CMTime buf = 138543362;
      v32 = v5;
      id v6 = "%{public}@We don't have anything to flush, ignoring flush.";
      CFStringRef v7 = v4;
      os_log_type_t v8 = OS_LOG_TYPE_DEBUG;
      goto LABEL_7;
    }
LABEL_8:

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    return;
  }
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  uint64_t v25 = MEMORY[0x263EF8330];
  uint64_t v26 = 3221225472;
  v27 = __50__HMIVideoAssetWriter_flushWithCompletionHandler___block_invoke_20;
  __int16 v28 = &unk_26477E9A0;
  id v30 = *(id *)(a1 + 40);
  int64_t v10 = v9;
  int64_t v29 = v10;
  [*(id *)(a1 + 32) setAssetWriterDidOutputSeparableSegment:&v25];
  id v11 = objc_msgSend(*(id *)(a1 + 32), "assetWriter", v25, v26, v27, v28);
  [v11 flushSegment];

  dispatch_time_t v12 = dispatch_time(0, 2000000000);
  intptr_t v13 = dispatch_semaphore_wait(v10, v12);
  BOOL v14 = (void *)MEMORY[0x22A641C70](v13);
  id v15 = *(id *)(a1 + 32);
  char v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    char v17 = HMFGetLogIdentifier();
    CFDictionaryRef v18 = [*(id *)(a1 + 32) assetWriter];
    uint64_t v19 = [v18 status];
    CMTime v20 = [*(id *)(a1 + 32) assetWriter];
    $3CC8671D27C23BF42ADDB32F2B5E48AE v21 = [v20 error];
    *(_DWORD *)CMTime buf = 138543874;
    v32 = v17;
    __int16 v33 = 2048;
    uint64_t v34 = v19;
    __int16 v35 = 2112;
    v36 = v21;
    _os_log_impl(&dword_225DC6000, v16, OS_LOG_TYPE_INFO, "%{public}@Finished waiting for flushSegment, assetWriter.status: %ld, assetWriter.error: %@", buf, 0x20u);
  }
  CMTime v22 = [*(id *)(a1 + 32) assetWriter];
  uint64_t v23 = [v22 status];

  uint64_t v24 = *(void **)(a1 + 32);
  if (v23 == 3) {
    [v24 _failWithDescription:@"Failed to flush segment."];
  }
  else {
    [v24 setDropSamplesUntilSync:1];
  }
  [*(id *)(a1 + 32) setAssetWriterDidOutputSeparableSegment:0];
}

intptr_t __50__HMIVideoAssetWriter_flushWithCompletionHandler___block_invoke_20(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(NSObject **)(a1 + 32);
  return dispatch_semaphore_signal(v2);
}

- (void)flush
{
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __28__HMIVideoAssetWriter_flush__block_invoke;
  v6[3] = &unk_26477B940;
  dispatch_semaphore_t v7 = v3;
  id v4 = v3;
  [(HMIVideoAssetWriter *)self flushWithCompletionHandler:v6];
  dispatch_time_t v5 = dispatch_time(0, 2000000000);
  dispatch_semaphore_wait(v4, v5);
}

intptr_t __28__HMIVideoAssetWriter_flush__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_failWithDescription:(id)a3
{
  self->super.super._status = 4;
  id v5 = [MEMORY[0x263F087E8] hmiErrorWithCode:-1 description:a3];
  HMIErrorLog(self, v5);
  id v4 = [(HMIVideoAssetWriter *)self delegate];
  [v4 assetWriter:self didFailWithError:v5];
}

- (HMIVideoAssetWriterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMIVideoAssetWriterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLogIdentifier:(id)a3
{
}

- (AVAssetWriter)assetWriter
{
  return (AVAssetWriter *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAssetWriter:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 56, 1);
}

- (OS_dispatch_queue)delegateQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 64, 1);
}

- (opaqueCMFormatDescription)videoFormat
{
  return self->_videoFormat;
}

- (opaqueCMFormatDescription)audioFormat
{
  return self->_audioFormat;
}

- (BOOL)dropSamplesUntilSync
{
  return self->_dropSamplesUntilSync;
}

- (void)setDropSamplesUntilSync:(BOOL)a3
{
  self->_dropSamplesUntilSync = a3;
}

- (BOOL)dropTrimDurationAttachments
{
  return self->_dropTrimDurationAttachments;
}

- (void)setDropTrimDurationAttachments:(BOOL)a3
{
  self->_dropTrimDurationAttachments = a3;
}

- (BOOL)allowRecoveryFromInsufficientAudioTrim
{
  return self->_allowRecoveryFromInsufficientAudioTrim;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)preferredOutputSegmentInterval
{
  objc_copyStruct(retstr, &self->_preferredOutputSegmentInterval, 24, 1, 0);
  return result;
}

- (void)setPreferredOutputSegmentInterval:(id *)a3
{
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentFragmentStartTime
{
  objc_copyStruct(retstr, &self->_currentFragmentStartTime, 24, 1, 0);
  return result;
}

- (void)setCurrentFragmentStartTime:(id *)a3
{
}

- (id)assetWriterDidOutputSeparableSegment
{
  return objc_getProperty(self, a2, 88, 1);
}

- (void)setAssetWriterDidOutputSeparableSegment:(id)a3
{
}

- (AVAssetWriterInput)videoInput
{
  return (AVAssetWriterInput *)objc_getProperty(self, a2, 96, 1);
}

- (AVAssetWriterInput)audioInput
{
  return (AVAssetWriterInput *)objc_getProperty(self, a2, 104, 1);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastVideoPresentationTimeStamp
{
  objc_copyStruct(retstr, &self->_lastVideoPresentationTimeStamp, 24, 1, 0);
  return result;
}

- (void)setLastVideoPresentationTimeStamp:(id *)a3
{
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastAudioPresentationTimeStamp
{
  objc_copyStruct(retstr, &self->_lastAudioPresentationTimeStamp, 24, 1, 0);
  return result;
}

- (void)setLastAudioPresentationTimeStamp:(id *)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioInput, 0);
  objc_storeStrong((id *)&self->_videoInput, 0);
  objc_storeStrong(&self->_assetWriterDidOutputSeparableSegment, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_assetWriter, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end