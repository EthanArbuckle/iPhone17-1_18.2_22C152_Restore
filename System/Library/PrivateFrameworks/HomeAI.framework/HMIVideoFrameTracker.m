@interface HMIVideoFrameTracker
+ (__CVBuffer)resizePixelBuffer:(__CVBuffer *)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)approximationInterval;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)expirationInterval;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)trackAnalysisPTS;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)trackInterval;
- (HMIBackgroundEstimator)backgroundEstimator;
- (HMIHTMLReport)report;
- (HMIMotionDetector)motionDetector;
- (HMIVideoFrameTracker)initWithConfiguration:(id)a3 workQueue:(id)a4;
- (HMIVideoFrameTrackerDelegate)delegate;
- (HMIVideoFrameTrackerFrameCandidate)candidate;
- (NSMutableArray)reportBuffer;
- (__CFArray)resizedSampleBuffers;
- (id)_motionDetectionsFromTarget:(opaqueCMSampleBuffer *)a3 reference:(opaqueCMSampleBuffer *)a4 dynamicConfiguration:(id)a5 motionScore:(float *)a6;
- (id)_tracksFromTarget:(opaqueCMSampleBuffer *)a3 reference:(opaqueCMSampleBuffer *)a4 background:(opaqueCMSampleBuffer *)a5 dynamicConfiguration:(id)a6 motionDetections:(id)a7;
- (opaqueCMSampleBuffer)_backgroundAtTimeStamp:(id *)a3;
- (opaqueCMSampleBuffer)background;
- (opaqueCMSampleBuffer)prepareSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (unint64_t)maxCandidates;
- (unint64_t)numCandidates;
- (void)_addCandidateForTarget:(opaqueCMSampleBuffer *)a3 motionScore:(float)a4 motionDetections:(id)a5 tracks:(id)a6;
- (void)_appendTarget:(opaqueCMSampleBuffer *)a3 timeStamp:(id *)a4 motionDetections:(id)a5;
- (void)_drainCandidateThatExpiredBefore:(id *)a3;
- (void)_drainResizedBuffersThatExpiredBefore:(id *)a3;
- (void)_synthesizeMotionDetectionWithTarget:(opaqueCMSampleBuffer *)a3;
- (void)_visualizeFrames:(id)a3 targetEvents:(id)a4 backgroundEvents:(id)a5 regionOfInterest:(CGRect)a6;
- (void)_visualizeTargetEvents:(id)a3 backgroundEvents:(id)a4 regionOfInterest:(CGRect)a5 targetTimeStamp:(id *)a6;
- (void)_visualizeTargetsThatExpiredBefore:(id *)a3;
- (void)dealloc;
- (void)flush;
- (void)handleFrameAnalyzerResult:(id)a3;
- (void)handleSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (void)handleSampleBuffer:(opaqueCMSampleBuffer *)a3 reference:(opaqueCMSampleBuffer *)a4;
- (void)setBackground:(opaqueCMSampleBuffer *)a3;
- (void)setBackgroundEstimator:(id)a3;
- (void)setCandidate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setNumCandidates:(unint64_t)a3;
- (void)setTrackAnalysisPTS:(id *)a3;
@end

@implementation HMIVideoFrameTracker

- (HMIVideoFrameTracker)initWithConfiguration:(id)a3 workQueue:(id)a4
{
  id v6 = a3;
  v31.receiver = self;
  v31.super_class = (Class)HMIVideoFrameTracker;
  v7 = [(HMIVideoAnalyzerProcessingNode *)&v31 initWithConfiguration:v6 workQueue:a4];
  if (v7)
  {
    CMTimeMakeWithSeconds(&v30, 2.0, 1000);
    long long v8 = *(_OWORD *)&v30.value;
    *((void *)v7 + 18) = v30.epoch;
    *((_OWORD *)v7 + 8) = v8;
    v9 = (void *)*((void *)v7 + 10);
    *((void *)v7 + 10) = 0;

    *((void *)v7 + 9) = 0;
    v10 = +[HMIPreference sharedInstance];
    v11 = [v10 numberPreferenceForKey:@"videoFrameTrackerMaxCandidates" defaultValue:&unk_26D9A9510];
    *((void *)v7 + 8) = [v11 unsignedIntegerValue];

    v12 = objc_alloc_init(HMIMotionDetector);
    v13 = (void *)*((void *)v7 + 7);
    *((void *)v7 + 7) = v12;

    CMTimeMakeWithSeconds(&v30, 3.0, 1000);
    long long v14 = *(_OWORD *)&v30.value;
    *((void *)v7 + 21) = v30.epoch;
    *(_OWORD *)(v7 + 152) = v14;
    uint64_t v15 = MEMORY[0x263F010E0];
    *((_OWORD *)v7 + 11) = *MEMORY[0x263F010E0];
    *((void *)v7 + 24) = *(void *)(v15 + 16);
    *((void *)v7 + 12) = 0;
    CMTimeMake(&v30, 100, 1000);
    long long v16 = *(_OWORD *)&v30.value;
    *((void *)v7 + 27) = v30.epoch;
    *(_OWORD *)(v7 + 200) = v16;
    *((void *)v7 + 13) = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
    if ([v6 saveAnalyzerResultsToDisk])
    {
      id v17 = objc_alloc_init(MEMORY[0x263F08790]);
      [v17 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss"];
      v18 = [MEMORY[0x263EFF910] now];
      v19 = [v17 stringFromDate:v18];

      v20 = NSString;
      v21 = [MEMORY[0x263F08C38] UUID];
      v22 = [v21 UUIDString];
      v23 = [v22 substringToIndex:4];
      v24 = [v20 stringWithFormat:@"/tmp/TrackerReport-%@-%@.html", v19, v23];

      v25 = [[HMIHTMLReport alloc] initWithTitle:@"Tracker" outputPath:v24];
      v26 = (void *)*((void *)v7 + 14);
      *((void *)v7 + 14) = v25;

      uint64_t v27 = [MEMORY[0x263EFF980] array];
      v28 = (void *)*((void *)v7 + 15);
      *((void *)v7 + 15) = v27;
    }
  }

  return (HMIVideoFrameTracker *)v7;
}

- (void)flush
{
  v3 = [(HMIVideoAnalyzerProcessingNode *)self workQueue];
  dispatch_assert_queue_not_V2(v3);

  v4 = [(HMIVideoAnalyzerProcessingNode *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __29__HMIVideoFrameTracker_flush__block_invoke;
  block[3] = &unk_26477B7D8;
  block[4] = self;
  dispatch_sync(v4, block);
}

void __29__HMIVideoFrameTracker_flush__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  long long v3 = *MEMORY[0x263F010B8];
  uint64_t v4 = *(void *)(MEMORY[0x263F010B8] + 16);
  [v2 _drainCandidateThatExpiredBefore:&v3];
  CFArrayRemoveAllValues(*(CFMutableArrayRef *)(*(void *)(a1 + 32) + 104));
}

- (void)dealloc
{
  background = self->_background;
  if (background) {
    CFRelease(background);
  }
  CFRelease(self->_resizedSampleBuffers);
  uint64_t v4 = [(HMIVideoFrameTracker *)self report];

  if (v4)
  {
    long long v6 = *MEMORY[0x263F010B8];
    uint64_t v7 = *(void *)(MEMORY[0x263F010B8] + 16);
    [(HMIVideoFrameTracker *)self _visualizeTargetsThatExpiredBefore:&v6];
  }
  v5.receiver = self;
  v5.super_class = (Class)HMIVideoFrameTracker;
  [(HMIVideoFrameTracker *)&v5 dealloc];
}

- (void)handleSampleBuffer:(opaqueCMSampleBuffer *)a3 reference:(opaqueCMSampleBuffer *)a4
{
  uint64_t v7 = [(HMIVideoAnalyzerProcessingNode *)self workQueue];
  dispatch_assert_queue_V2(v7);

  long long v8 = [(HMIVideoAnalyzerProcessingNode *)self dynamicConfiguration];

  if (v8)
  {
    v9 = +[HMIPreference sharedInstance];
    int v10 = [v9 hasPreferenceForKey:@"syntheticEvents"];

    if (v10)
    {
      [(HMIVideoFrameTracker *)self _synthesizeMotionDetectionWithTarget:a3];
    }
    else
    {
      memset(&v26, 0, sizeof(v26));
      CMSampleBufferGetPresentationTimeStamp(&v26, a3);
      memset(&v25, 0, sizeof(v25));
      CMSampleBufferGetPresentationTimeStamp(&v25, a4);
      v11 = [(HMIVideoFrameTracker *)self prepareSampleBuffer:a3];
      int v24 = 0;
      v12 = [(HMIVideoAnalyzerProcessingNode *)self dynamicConfiguration];
      v13 = [(HMIVideoFrameTracker *)self _motionDetectionsFromTarget:v11 reference:a4 dynamicConfiguration:v12 motionScore:&v24];

      long long v14 = [(HMIVideoAnalyzerProcessingNode *)self dynamicConfiguration];
      uint64_t v15 = [(HMIVideoFrameTracker *)self _tracksFromTarget:v11 reference:a4 background:a3 dynamicConfiguration:v14 motionDetections:v13];

      LODWORD(v16) = v24;
      [(HMIVideoFrameTracker *)self _addCandidateForTarget:a3 motionScore:v13 motionDetections:v15 tracks:v16];
      id v17 = [(HMIVideoFrameTracker *)self report];

      if (v17)
      {
        CMTime lhs = v26;
        [(HMIVideoFrameTracker *)self _appendTarget:v11 timeStamp:&lhs motionDetections:v13];
      }
      CMTime lhs = v26;
      $95D729B680665BEAEFA1D6FCA8238556 expirationInterval = self->_expirationInterval;
      CMTimeSubtract(&v22, &lhs, (CMTime *)&expirationInterval);
      [(HMIVideoFrameTracker *)self _drainCandidateThatExpiredBefore:&v22];
      CMTime lhs = v25;
      [(HMIVideoFrameTracker *)self _drainResizedBuffersThatExpiredBefore:&lhs];
      CFRelease(v11);
    }
  }
  else
  {
    v18 = (HMIVideoFrameTracker *)_HMFPreconditionFailure();
    [(HMIVideoFrameTracker *)v18 handleSampleBuffer:v20];
  }
}

- (void)handleSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  objc_super v5 = [(HMIVideoAnalyzerProcessingNode *)self workQueue];
  dispatch_assert_queue_V2(v5);

  memset(&v9, 0, sizeof(v9));
  CMSampleBufferGetPresentationTimeStamp(&v9, a3);
  CMTime lhs = v9;
  $95D729B680665BEAEFA1D6FCA8238556 expirationInterval = self->_expirationInterval;
  CMTimeSubtract(&v8, &lhs, (CMTime *)&expirationInterval);
  [(HMIVideoFrameTracker *)self _drainCandidateThatExpiredBefore:&v8];
}

- (void)handleFrameAnalyzerResult:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(HMIVideoAnalyzerProcessingNode *)self workQueue];
  dispatch_assert_queue_V2(v5);

  long long v6 = [(HMIVideoFrameTracker *)self backgroundEstimator];

  if (v6)
  {
    uint64_t v7 = [(HMIVideoFrameTracker *)self backgroundEstimator];
    CMTime v8 = [v4 events];
    CMTime v9 = [v4 frame];
    int v10 = v9;
    if (v9) {
      [v9 presentationTimeStamp];
    }
    else {
      memset(v28, 0, sizeof(v28));
    }
    [v7 assignForegroundEvents:v8 timeStamp:v28];

    v11 = [(HMIVideoFrameTracker *)self backgroundEstimator];
    v12 = [v4 backgroundEvents];
    if (v4) {
      [v4 backgroundTimeStamp];
    }
    else {
      memset(v27, 0, sizeof(v27));
    }
    [v11 assignBackgroundEvents:v12 timeStamp:v27];
  }
  v13 = [(HMIVideoFrameTracker *)self report];

  if (v13)
  {
    long long v14 = [v4 events];
    uint64_t v15 = [v4 backgroundEvents];
    [v4 regionOfInterest];
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    int v24 = [v4 frame];
    CMTime v25 = v24;
    if (v24) {
      [v24 presentationTimeStamp];
    }
    else {
      memset(v26, 0, sizeof(v26));
    }
    -[HMIVideoFrameTracker _visualizeTargetEvents:backgroundEvents:regionOfInterest:targetTimeStamp:](self, "_visualizeTargetEvents:backgroundEvents:regionOfInterest:targetTimeStamp:", v14, v15, v26, v17, v19, v21, v23);
  }
}

- (opaqueCMSampleBuffer)prepareSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  objc_super v5 = [(HMIVideoAnalyzerProcessingNode *)self workQueue];
  dispatch_assert_queue_V2(v5);

  memset(&v17, 0, sizeof(v17));
  CMSampleBufferGetPresentationTimeStamp(&v17, a3);
  if (CFArrayGetCount([(HMIVideoFrameTracker *)self resizedSampleBuffers]) < 1) {
    goto LABEL_6;
  }
  CFIndex v6 = 0;
  while (1)
  {
    ValueAtIndex = (opaqueCMSampleBuffer *)CFArrayGetValueAtIndex([(HMIVideoFrameTracker *)self resizedSampleBuffers], v6);
    memset(&v16, 0, sizeof(v16));
    CMSampleBufferGetPresentationTimeStamp(&v16, ValueAtIndex);
    CMTime time1 = v17;
    CMTime time2 = v16;
    if ((CMTimeCompare(&time1, &time2) & 0x80000000) == 0)
    {
      CMTime time1 = v16;
      CMTime time2 = (CMTime)self->_approximationInterval;
      CMTimeAdd(&v13, &time1, &time2);
      CMTime time1 = v17;
      if (CMTimeCompare(&time1, &v13) < 0) {
        break;
      }
    }
    if (++v6 >= CFArrayGetCount([(HMIVideoFrameTracker *)self resizedSampleBuffers])) {
      goto LABEL_6;
    }
  }
  CopyWithPixelBuffer = CFRetain(ValueAtIndex);
  if (!CopyWithPixelBuffer)
  {
LABEL_6:
    CMTime v8 = +[HMIVideoFrameTracker resizePixelBuffer:CMSampleBufferGetImageBuffer(a3)];
    if (v8)
    {
      CMTime v9 = v8;
      CopyWithPixelBuffer = HMICMSampleBufferCreateCopyWithPixelBuffer(a3, v8);
      CVPixelBufferRelease(v9);
      CFArrayAppendValue([(HMIVideoFrameTracker *)self resizedSampleBuffers], CopyWithPixelBuffer);
      v11 = [(HMIVideoFrameTracker *)self resizedSampleBuffers];
      v18.length = CFArrayGetCount([(HMIVideoFrameTracker *)self resizedSampleBuffers]);
      v18.location = 0;
      CFArraySortValues(v11, v18, (CFComparatorFunction)HMICMSampleBufferTimeAscendingComparator, 0);
    }
    else
    {
      return 0;
    }
  }
  return (opaqueCMSampleBuffer *)CopyWithPixelBuffer;
}

+ (__CVBuffer)resizePixelBuffer:(__CVBuffer *)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  double Size = HMICVPixelBufferGetSize(a3);
  double v6 = v5;
  unint64_t v7 = HMIAspectRatioMake((int)Size, (int)v5);
  if (HMIAspectRatioEqualToAspectRatio(v7, 0x900000010))
  {
    double v8 = 180.0;
LABEL_14:
    uint64_t v10 = 0x4074000000000000;
    goto LABEL_15;
  }
  if (HMIAspectRatioEqualToAspectRatio(v7, 0x1000000009))
  {
    double v8 = 320.0;
    double v9 = 180.0;
    goto LABEL_16;
  }
  if (HMIAspectRatioEqualToAspectRatio(v7, 0x300000004))
  {
    double v8 = 240.0;
    goto LABEL_14;
  }
  if ((HMIAspectRatioEqualToAspectRatio(v7, 0x400000003) & 1) == 0)
  {
    if (HMIAspectRatioEqualToAspectRatio(v7, 0x100000001))
    {
      double v9 = 240.0;
      double v8 = 240.0;
      goto LABEL_16;
    }
    v11 = (void *)MEMORY[0x22A641C70]();
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      CMTime v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      CFRange v18 = v13;
      __int16 v19 = 1024;
      int v20 = v7;
      __int16 v21 = 1024;
      int v22 = HIDWORD(v7);
      _os_log_impl(&dword_225DC6000, v12, OS_LOG_TYPE_ERROR, "%{public}@Unsupported aspect ratio: (%d, %d)", buf, 0x18u);
    }
    double v8 = (double)(int)(float)(320.0 / (float)((float)(int)v7 / (float)SHIDWORD(v7)));
    goto LABEL_14;
  }
  double v8 = 320.0;
  uint64_t v10 = 0x406E000000000000;
LABEL_15:
  double v9 = *(double *)&v10;
LABEL_16:
  BOOL v14 = Size == v9 && v6 == v8;
  if (v14 && CVPixelBufferGetPixelFormatType(a3) == 875704438) {
    return CVPixelBufferRetain(a3);
  }
  uint64_t v16 = 0;
  return +[HMIVisionUtilities resizePixelBuffer:size:pixelFormat:options:error:](HMIVisionUtilities, "resizePixelBuffer:size:pixelFormat:options:error:", a3, 875704438, 8, &v16, v9, v8);
}

- (void)_addCandidateForTarget:(opaqueCMSampleBuffer *)a3 motionScore:(float)a4 motionDetections:(id)a5 tracks:(id)a6
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v10 = a5;
  id v11 = a6;
  v12 = [HMIVideoFrameTrackerFrameCandidate alloc];
  *(float *)&double v13 = a4;
  BOOL v14 = [(HMIVideoFrameTrackerFrameCandidate *)v12 initWithSampleBuffer:a3 score:v10 motionDetections:v11 tracks:v13];
  uint64_t v15 = (void *)MEMORY[0x22A641C70]();
  uint64_t v16 = self;
  CMTime v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    CFRange v18 = HMFGetLogIdentifier();
    int v26 = 138543618;
    uint64_t v27 = v18;
    __int16 v28 = 2112;
    v29 = v14;
    _os_log_impl(&dword_225DC6000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Adding Candidate: %@", (uint8_t *)&v26, 0x16u);
  }
  ++v16->_numCandidates;
  uint64_t v19 = [(HMIVideoFrameTracker *)v16 candidate];
  if (!v19) {
    goto LABEL_5;
  }
  int v20 = (void *)v19;
  __int16 v21 = [(HMIVideoFrameTracker *)v16 candidate];
  [v21 score];
  float v23 = v22;
  [(HMIVideoFrameTrackerFrameCandidate *)v14 score];
  float v25 = v24;

  if (v23 < v25) {
LABEL_5:
  }
    objc_storeStrong((id *)&v16->_candidate, v14);
}

- (void)_drainCandidateThatExpiredBefore:(id *)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  double v5 = [(HMIVideoFrameTracker *)self candidate];
  double v6 = v5;
  if (v5)
  {
    memset(&v26, 0, sizeof(v26));
    CMSampleBufferGetPresentationTimeStamp(&v26, (CMSampleBufferRef)[v5 sbuf]);
    unint64_t v7 = [(HMIVideoFrameTracker *)self numCandidates];
    if (v7 >= [(HMIVideoFrameTracker *)self maxCandidates]
      || (time1 = v26, CMTime time2 = (CMTime)*a3, CMTimeCompare(&time1, &time2) < 0))
    {
      [v6 score];
      float v9 = v8;
      if (v8 <= 0.0)
      {
        id v10 = [v6 tracks];
        if ([v10 count])
        {
          CMTime time1 = v26;
          CMTime time2 = (CMTime)self->_trackAnalysisPTS;
          int32_t v11 = CMTimeCompare(&time1, &time2);

          if ((v11 & 0x80000000) == 0) {
            goto LABEL_7;
          }
        }
        else
        {
        }
LABEL_12:
        candidate = self->_candidate;
        self->_candidate = 0;

        self->_numCandidates = 0;
        goto LABEL_13;
      }
LABEL_7:
      v12 = (void *)MEMORY[0x22A641C70]();
      double v13 = self;
      BOOL v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v15 = HMFGetLogIdentifier();
        LODWORD(time1.value) = 138543618;
        *(CMTimeValue *)((char *)&time1.value + 4) = (CMTimeValue)v15;
        LOWORD(time1.flags) = 2112;
        *(void *)((char *)&time1.flags + 2) = v6;
        _os_log_impl(&dword_225DC6000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Selected: %@", (uint8_t *)&time1, 0x16u);
      }
      uint64_t v16 = [(HMIVideoFrameTracker *)v13 delegate];
      uint64_t v17 = [v6 sbuf];
      CMTime time1 = v26;
      uint64_t v18 = [(HMIVideoFrameTracker *)v13 _backgroundAtTimeStamp:&time1];
      uint64_t v19 = [v6 motionDetections];
      int v20 = [v6 tracks];
      [v16 frameTracker:v13 didTrackFrame:v17 background:v18 motionDetections:v19 tracks:v20];

      if (v9 <= 0.0)
      {
        CMTime time2 = v26;
        long long v21 = *(_OWORD *)&v13->_trackInterval.value;
        v24.epoch = v13->_trackInterval.epoch;
        *(_OWORD *)&v24.value = v21;
        CMTimeAdd(&time1, &time2, &v24);
        long long v22 = *(_OWORD *)&time1.value;
        v13->_trackAnalysisPTS.epoch = time1.epoch;
        *(_OWORD *)&v13->_trackAnalysisPTS.value = v22;
      }
      goto LABEL_12;
    }
  }
LABEL_13:
}

- (void)_drainResizedBuffersThatExpiredBefore:(id *)a3
{
  if (CFArrayGetCount([(HMIVideoFrameTracker *)self resizedSampleBuffers]) >= 1)
  {
    do
    {
      ValueAtIndex = (opaqueCMSampleBuffer *)CFArrayGetValueAtIndex([(HMIVideoFrameTracker *)self resizedSampleBuffers], 0);
      memset(&v8, 0, sizeof(v8));
      CMSampleBufferGetPresentationTimeStamp(&v8, ValueAtIndex);
      CMTime time1 = v8;
      $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = *a3;
      if ((CMTimeCompare(&time1, (CMTime *)&v6) & 0x80000000) == 0) {
        break;
      }
      CFArrayRemoveValueAtIndex([(HMIVideoFrameTracker *)self resizedSampleBuffers], 0);
    }
    while (CFArrayGetCount([(HMIVideoFrameTracker *)self resizedSampleBuffers]) > 0);
  }
}

- (void)_synthesizeMotionDetectionWithTarget:(opaqueCMSampleBuffer *)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  double v5 = (void *)MEMORY[0x22A641C70](self, a2);
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = self;
  unint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    CMTime v8 = HMFGetLogIdentifier();
    float v9 = HMICMSampleBufferTinyDescription(a3);
    *(_DWORD *)buf = 138543618;
    CMTime v24 = v8;
    __int16 v25 = 2112;
    CMTime v26 = v9;
    _os_log_impl(&dword_225DC6000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Synthesizing Motion Detections, Target: %@", buf, 0x16u);
  }
  double v10 = *MEMORY[0x263F001B0];
  double v11 = *(double *)(MEMORY[0x263F001B0] + 8);
  v12 = [HMIMotionDetection alloc];
  uint64_t v13 = MEMORY[0x263EFFA68];
  LODWORD(v14) = 1148846080;
  uint64_t v15 = -[HMIMotionDetection initWithBoundingBox:size:motionVectors:motionScore:motionMode:](v12, "initWithBoundingBox:size:motionVectors:motionScore:motionMode:", MEMORY[0x263EFFA68], 2, 0.1, 0.1, 0.8, 0.8, v10, v11, v14);
  uint64_t v16 = [HMIMotionDetection alloc];
  LODWORD(v17) = 1148846080;
  uint64_t v18 = -[HMIMotionDetection initWithBoundingBox:size:motionVectors:motionScore:motionMode:](v16, "initWithBoundingBox:size:motionVectors:motionScore:motionMode:", v13, 1, 0.1, 0.1, 0.8, 0.8, v10, v11, v17, v15);
  v22[1] = v18;
  uint64_t v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:2];

  int v20 = [(HMIVideoFrameTracker *)v6 delegate];
  long long v21 = [MEMORY[0x263EFFA08] set];
  [v20 frameTracker:v6 didTrackFrame:a3 background:0 motionDetections:v19 tracks:v21];
}

- (id)_motionDetectionsFromTarget:(opaqueCMSampleBuffer *)a3 reference:(opaqueCMSampleBuffer *)a4 dynamicConfiguration:(id)a5 motionScore:(float *)a6
{
  id v10 = a5;
  char v11 = [v10 eventTriggers];
  if ([v10 eventTriggers])
  {
    v12 = [v10 activityZones];
  }
  else
  {
    v12 = (void *)MEMORY[0x263EFFA68];
  }
  int v19 = 0;
  uint64_t v13 = [(HMIVideoFrameTracker *)self motionDetector];
  CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(a4);
  uint64_t v15 = [v13 detectWithGlobalMotionScore:&v19 referencePixelBuffer:ImageBuffer targetPixelBuffer:CMSampleBufferGetImageBuffer(a3) activityZones:v12 detectorMode:v11 & 1 | 2];

  uint64_t v16 = +[HMIMotionDetection firstMotionDetectionInArray:v15 withMode:2];
  [v16 motionScore];
  *(_DWORD *)a6 = v17;

  return v15;
}

- (id)_tracksFromTarget:(opaqueCMSampleBuffer *)a3 reference:(opaqueCMSampleBuffer *)a4 background:(opaqueCMSampleBuffer *)a5 dynamicConfiguration:(id)a6 motionDetections:(id)a7
{
  id v12 = a7;
  if (([a6 eventTriggers] & 0x10) != 0)
  {
    uint64_t v15 = [(HMIVideoFrameTracker *)self backgroundEstimator];

    if (!v15)
    {
      uint64_t v16 = [HMIBackgroundEstimator alloc];
      int v17 = [(HMIVideoAnalyzerProcessingNode *)self configuration];
      uint64_t v18 = [(HMIBackgroundEstimator *)v16 initWithConfiguration:v17];
      [(HMIVideoFrameTracker *)self setBackgroundEstimator:v18];

      int v19 = [(HMIVideoFrameTracker *)self backgroundEstimator];
      CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(a4);
      CMSampleBufferGetPresentationTimeStamp(&v31, a4);
      id v21 = (id)[v19 analyzePixelBuffer:ImageBuffer timeStamp:&v31];
    }
    memset(&v30, 0, sizeof(v30));
    CMSampleBufferGetPresentationTimeStamp(&v30, a3);
    long long v22 = [(HMIVideoFrameTracker *)self backgroundEstimator];
    [v22 handleMotionDetection:v12 inFrame:a3];

    float v23 = [(HMIVideoFrameTracker *)self backgroundEstimator];
    CVImageBufferRef v24 = CMSampleBufferGetImageBuffer(a3);
    CMTime v29 = v30;
    double v14 = [v23 analyzePixelBuffer:v24 timeStamp:&v29];

    __int16 v25 = [(HMIVideoFrameTracker *)self backgroundEstimator];
    int v26 = [v25 hasNewBackground];

    if (v26)
    {
      background = self->_background;
      if (background) {
        CFRelease(background);
      }
      self->_background = (opaqueCMSampleBuffer *)CFRetain(a5);
    }
  }
  else
  {
    if ([(HMIVideoFrameTracker *)self background])
    {
      CFRelease(self->_background);
      self->_background = 0;
    }
    uint64_t v13 = [(HMIVideoFrameTracker *)self backgroundEstimator];

    if (v13) {
      [(HMIVideoFrameTracker *)self setBackgroundEstimator:0];
    }
    double v14 = [MEMORY[0x263EFFA08] set];
  }

  return v14;
}

- (opaqueCMSampleBuffer)_backgroundAtTimeStamp:(id *)a3
{
  result = [(HMIVideoFrameTracker *)self background];
  if (result)
  {
    CMSampleBufferGetPresentationTimeStamp(&time2, [(HMIVideoFrameTracker *)self background]);
    $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = *a3;
    if (CMTimeCompare((CMTime *)&v6, &time2) < 1) {
      return 0;
    }
    else {
      return [(HMIVideoFrameTracker *)self background];
    }
  }
  return result;
}

- (void)_appendTarget:(opaqueCMSampleBuffer *)a3 timeStamp:(id *)a4 motionDetections:(id)a5
{
  id v8 = a5;
  float v9 = [MEMORY[0x263EFF980] array];
  id v10 = [HMIVideoFrame alloc];
  CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(a3);
  $3CC8671D27C23BF42ADDB32F2B5E48AE v29 = *a4;
  id v12 = [(HMIVideoFrame *)v10 initWithPixelBuffer:ImageBuffer presentationTimeStamp:&v29];
  [v9 addObject:v12];
  uint64_t v13 = [(HMIVideoFrameTracker *)self motionDetector];
  [(HMIVideoFrame *)v12 size];
  double v15 = v14;
  double v17 = v16;
  if (v12) {
    [(HMIVideoFrame *)v12 presentationTimeStamp];
  }
  else {
    memset(v28, 0, sizeof(v28));
  }
  uint64_t v18 = objc_msgSend(v13, "visualizeMotionDetections:frameSize:timeStamp:", v8, v28, v15, v17);
  [v9 addObject:v18];

  int v19 = [(HMIVideoFrameTracker *)self backgroundEstimator];

  if (v19)
  {
    int v20 = [(HMIVideoFrameTracker *)self backgroundEstimator];
    id v21 = [v20 visualizeBackgroundMean];
    [v9 addObject:v21];

    long long v22 = [(HMIVideoFrameTracker *)self backgroundEstimator];
    float v23 = [v22 visualizeBackgroundStd];
    [v9 addObject:v23];

    CVImageBufferRef v24 = [(HMIVideoFrameTracker *)self backgroundEstimator];
    __int16 v25 = [v24 visualizeForegroundAssignment];
    [v9 addObject:v25];
  }
  int v26 = [(HMIVideoFrameTracker *)self reportBuffer];
  uint64_t v27 = (void *)[v9 copy];
  [v26 addObject:v27];
}

- (void)_visualizeTargetsThatExpiredBefore:(id *)a3
{
  double v5 = [MEMORY[0x263EFFA08] set];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = [MEMORY[0x263EFFA08] set];
  double v7 = *MEMORY[0x263F001A0];
  double v8 = *(double *)(MEMORY[0x263F001A0] + 8);
  double v9 = *(double *)(MEMORY[0x263F001A0] + 16);
  double v10 = *(double *)(MEMORY[0x263F001A0] + 24);
  $3CC8671D27C23BF42ADDB32F2B5E48AE v11 = *a3;
  -[HMIVideoFrameTracker _visualizeTargetEvents:backgroundEvents:regionOfInterest:targetTimeStamp:](self, "_visualizeTargetEvents:backgroundEvents:regionOfInterest:targetTimeStamp:", v5, v6, &v11, v7, v8, v9, v10);
}

- (void)_visualizeTargetEvents:(id)a3 backgroundEvents:(id)a4 regionOfInterest:(CGRect)a5 targetTimeStamp:(id *)a6
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v13 = a3;
  id v14 = a4;
  double v15 = [(HMIVideoFrameTracker *)self reportBuffer];
  uint64_t v16 = [v15 count];

  if (v16)
  {
    double v17 = *MEMORY[0x263F001A0];
    double v18 = *(double *)(MEMORY[0x263F001A0] + 8);
    double v19 = *(double *)(MEMORY[0x263F001A0] + 16);
    double v20 = *(double *)(MEMORY[0x263F001A0] + 24);
    while (1)
    {
      id v21 = [(HMIVideoFrameTracker *)self reportBuffer];
      long long v22 = [v21 firstObject];

      float v23 = [v22 firstObject];
      CVImageBufferRef v24 = v23;
      if (v23) {
        [v23 presentationTimeStamp];
      }
      else {
        memset(&time1, 0, sizeof(time1));
      }
      $3CC8671D27C23BF42ADDB32F2B5E48AE v31 = *a6;
      int32_t v25 = CMTimeCompare(&time1, (CMTime *)&v31);

      if (v25 >= 1) {
        break;
      }
      if (v25)
      {
        int v26 = [MEMORY[0x263EFFA08] set];
        uint64_t v27 = [MEMORY[0x263EFFA08] set];
        -[HMIVideoFrameTracker _visualizeFrames:targetEvents:backgroundEvents:regionOfInterest:](self, "_visualizeFrames:targetEvents:backgroundEvents:regionOfInterest:", v22, v26, v27, v17, v18, v19, v20);
      }
      else
      {
        -[HMIVideoFrameTracker _visualizeFrames:targetEvents:backgroundEvents:regionOfInterest:](self, "_visualizeFrames:targetEvents:backgroundEvents:regionOfInterest:", v22, v13, v14, x, y, width, height);
      }
      uint64_t v28 = [(HMIVideoFrameTracker *)self reportBuffer];
      objc_msgSend(v28, "hmf_removeFirstObject");

      $3CC8671D27C23BF42ADDB32F2B5E48AE v29 = [(HMIVideoFrameTracker *)self reportBuffer];
      uint64_t v30 = [v29 count];

      if (!v30) {
        goto LABEL_13;
      }
    }
  }
LABEL_13:
}

- (void)_visualizeFrames:(id)a3 targetEvents:(id)a4 backgroundEvents:(id)a5 regionOfInterest:(CGRect)a6
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  id v13 = a3;
  uint64_t v26 = MEMORY[0x263EF8330];
  uint64_t v27 = 3221225472;
  uint64_t v28 = __88__HMIVideoFrameTracker__visualizeFrames_targetEvents_backgroundEvents_regionOfInterest___block_invoke;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v29 = &unk_26477E398;
  id v30 = v13;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v31 = self;
  id v14 = v13;
  id v15 = a5;
  id v16 = a4;
  double v17 = (void (**)(void, void, void, void, double, double, double, double))MEMORY[0x22A641EE0](&v26);
  ((void (**)(void, void, id, __CFString *, double, double, double, double))v17)[2](v17, 0, v16, @"Target", x, y, width, height);

  ((void (**)(void, uint64_t, id, __CFString *, double, double, double, double))v17)[2](v17, 2, v15, @"Mean", x, y, width, height);
  double v18 = objc_msgSend(MEMORY[0x263EFFA08], "set", v26, v27, v28, v29);
  double v19 = *MEMORY[0x263F001A0];
  double v20 = *(double *)(MEMORY[0x263F001A0] + 8);
  double v21 = *(double *)(MEMORY[0x263F001A0] + 16);
  double v22 = *(double *)(MEMORY[0x263F001A0] + 24);
  ((void (**)(void, uint64_t, void *, __CFString *, double, double, double, double))v17)[2](v17, 3, v18, @"Std", *MEMORY[0x263F001A0], v20, v21, v22);

  float v23 = [MEMORY[0x263EFFA08] set];
  ((void (**)(void, uint64_t, void *, __CFString *, double, double, double, double))v17)[2](v17, 1, v23, @"Motion", v19, v20, v21, v22);

  CVImageBufferRef v24 = [MEMORY[0x263EFFA08] set];
  ((void (**)(void, uint64_t, void *, __CFString *, double, double, double, double))v17)[2](v17, 4, v24, @"Assign", v19, v20, v21, v22);

  int32_t v25 = [(HMIVideoFrameTracker *)self report];
  [v25 appendText:&stru_26D98B6C8];
}

void __88__HMIVideoFrameTracker__visualizeFrames_targetEvents_backgroundEvents_regionOfInterest___block_invoke(uint64_t a1, unint64_t a2, void *a3, void *a4, double a5, double a6, double a7, double a8)
{
  id v15 = a3;
  id v16 = a4;
  if ([*(id *)(a1 + 32) count] > a2)
  {
    double v17 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
    double v18 = v17;
    if (v17) {
      [v17 presentationTimeStamp];
    }
    else {
      memset(&time, 0, sizeof(time));
    }
    Float64 Seconds = CMTimeGetSeconds(&time);

    double v20 = [*(id *)(a1 + 40) report];
    double v21 = [HMIVideoAnalyzerFrameResult alloc];
    double v22 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
    float v23 = -[HMIVideoAnalyzerFrameResult initWithFrame:events:regionOfInterest:](v21, "initWithFrame:events:regionOfInterest:", v22, v15, a5, a6, a7, a8);
    CVImageBufferRef v24 = [NSString stringWithFormat:@"%.2f %@", *(void *)&Seconds, v16];
    [v20 appendFrameResult:v23 frameTruth:0 description:v24];
  }
}

- (HMIVideoFrameTrackerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMIVideoFrameTrackerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (HMIMotionDetector)motionDetector
{
  return (HMIMotionDetector *)objc_getProperty(self, a2, 56, 1);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)expirationInterval
{
  objc_copyStruct(retstr, &self->_expirationInterval, 24, 1, 0);
  return result;
}

- (unint64_t)maxCandidates
{
  return self->_maxCandidates;
}

- (unint64_t)numCandidates
{
  return self->_numCandidates;
}

- (void)setNumCandidates:(unint64_t)a3
{
  self->_numCandidates = a3;
}

- (HMIVideoFrameTrackerFrameCandidate)candidate
{
  return (HMIVideoFrameTrackerFrameCandidate *)objc_getProperty(self, a2, 80, 1);
}

- (void)setCandidate:(id)a3
{
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)trackInterval
{
  objc_copyStruct(retstr, &self->_trackInterval, 24, 1, 0);
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)trackAnalysisPTS
{
  objc_copyStruct(retstr, &self->_trackAnalysisPTS, 24, 1, 0);
  return result;
}

- (void)setTrackAnalysisPTS:(id *)a3
{
}

- (HMIBackgroundEstimator)backgroundEstimator
{
  return (HMIBackgroundEstimator *)objc_getProperty(self, a2, 88, 1);
}

- (void)setBackgroundEstimator:(id)a3
{
}

- (opaqueCMSampleBuffer)background
{
  return self->_background;
}

- (void)setBackground:(opaqueCMSampleBuffer *)a3
{
  self->_background = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)approximationInterval
{
  objc_copyStruct(retstr, &self->_approximationInterval, 24, 1, 0);
  return result;
}

- (__CFArray)resizedSampleBuffers
{
  return self->_resizedSampleBuffers;
}

- (HMIHTMLReport)report
{
  return (HMIHTMLReport *)objc_getProperty(self, a2, 112, 1);
}

- (NSMutableArray)reportBuffer
{
  return (NSMutableArray *)objc_getProperty(self, a2, 120, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportBuffer, 0);
  objc_storeStrong((id *)&self->_report, 0);
  objc_storeStrong((id *)&self->_backgroundEstimator, 0);
  objc_storeStrong((id *)&self->_candidate, 0);
  objc_storeStrong((id *)&self->_motionDetector, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end