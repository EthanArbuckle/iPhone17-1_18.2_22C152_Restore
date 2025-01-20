@interface HMIBackgroundEstimator
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)backgroundChangeInterval;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)backgroundChangeResetInterval;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)backgroundChangeTimeStamp;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)backgroundExpireInterval;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)backgroundTimeStamp;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)foregroundTimeStamp;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)motionValidInterval;
- (BOOL)_adjustBackgroundAtAttribute:(const char *)a3 backgroundChanged:(BOOL)a4 timeStamp:(id *)a5;
- (BOOL)_invalidateBackgroundForPixelBuffer:(__CVBuffer *)a3 timeStamp:(id *)a4;
- (BOOL)_updateBackgroundFromPixelBuffer:(__CVBuffer *)a3 timeStamp:(id *)a4;
- (BOOL)adjustBrightness;
- (BOOL)hasNewBackground;
- (CGSize)imageSize;
- (CGSize)modelSize;
- (HMIBackgroundEstimator)initWithConfiguration:(id)a3;
- (HMIVideoAnalyzerConfiguration)configuration;
- (NSMutableArray)motionDetections;
- (NSMutableArray)motionTimeStamps;
- (NSMutableDictionary)inactiveTracks;
- (NSMutableDictionary)tracks;
- (float)_intersectionOverUnionFromBlob:(id)a3 boundingBox:(CGRect)a4 assignment:(unsigned __int16 *)a5;
- (float)runningMean;
- (float)runningStd;
- (id)_blobsFromAssignment:(unsigned __int16 *)a3 timeStamp:(id *)a4;
- (id)_exportInternalStateForPixelBuffer:(__CVBuffer *)a3 exportMode:(unint64_t)a4;
- (id)_foregroundBlobsFromBlobs:(id)a3 backgroundChanged:(BOOL *)a4;
- (id)_predictForegroundFromPixelBuffer:(__CVBuffer *)a3 timeStamp:(id *)a4;
- (id)_stationaryTracks:(id)a3 timeStamp:(id *)a4;
- (id)analyzePixelBuffer:(__CVBuffer *)a3 timeStamp:(id *)a4;
- (id)visualizeBackgroundMean;
- (id)visualizeBackgroundStd;
- (id)visualizeForegroundAssignment;
- (id)visualizeForegroundDiffForPixelBuffer:(__CVBuffer *)a3;
- (unint64_t)minSampleSize;
- (unint64_t)numImages;
- (unint64_t)numTracks;
- (unsigned)assignment;
- (void)_copyFromOutputBuffer:(const float *)a3 toPixelBuffer:(__CVBuffer *)a4;
- (void)_copyFromPixelBuffer:(__CVBuffer *)a3 toInputBuffer:(float *)a4 translateCol:(int)a5 translateRow:(int)a6;
- (void)_correctRunningMeanBrightnessAtAttribute:(const char *)a3;
- (void)_ensureInternalBuffersForPixelBuffer:(__CVBuffer *)a3;
- (void)_expireMotionDetectionsAtTimeStamp:(id *)a3;
- (void)_foregroundDifferencesFromPixelBuffer:(__CVBuffer *)a3 differences:(float *)a4;
- (void)_foregroundPixelsFromPixelBuffer:(__CVBuffer *)a3 attribute:(char *)a4 assignment:(unsigned __int16 *)a5 useChromaOnly:(BOOL)a6;
- (void)_setAssignment:(unsigned __int16 *)a3 greaterThanType:(unsigned __int16)a4 value:(unsigned __int16)a5 boundingBox:(CGRect)a6 scale:(float)a7;
- (void)_updateCurrentTracks:(id)a3 inactiveTracks:(id)a4 blobs:(id)a5 timeStamp:(id *)a6;
- (void)_updateRunningMean:(float *)a3 runningSquaredMean:(float *)a4 fromInputBuffer:(const float *)a5 decay:(float)a6;
- (void)_updateRunningStd:(float *)a3 withAuxBuffer:(float *)a4 runningMean:(const float *)a5 runningSquaredMean:(const float *)a6;
- (void)assignBackgroundEvents:(id)a3 timeStamp:(id *)a4;
- (void)assignForegroundEvents:(id)a3 timeStamp:(id *)a4;
- (void)dealloc;
- (void)handleMotionDetection:(id)a3 inFrame:(opaqueCMSampleBuffer *)a4;
- (void)reset;
- (void)setAdjustBrightness:(BOOL)a3;
- (void)setAssignment:(unsigned __int16 *)a3;
- (void)setBackgroundChangeTimeStamp:(id *)a3;
- (void)setBackgroundTimeStamp:(id *)a3;
- (void)setForegroundTimeStamp:(id *)a3;
- (void)setImageSize:(CGSize)a3;
- (void)setModelSize:(CGSize)a3;
- (void)setNumImages:(unint64_t)a3;
- (void)setNumTracks:(unint64_t)a3;
- (void)setRunningMean:(float *)a3;
- (void)setRunningStd:(float *)a3;
@end

@implementation HMIBackgroundEstimator

- (HMIBackgroundEstimator)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)HMIBackgroundEstimator;
  v6 = [(HMIBackgroundEstimator *)&v22 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    v7->_numTracks = 0;
    uint64_t v8 = [MEMORY[0x263EFF9A0] dictionary];
    tracks = v7->_tracks;
    v7->_tracks = (NSMutableDictionary *)v8;

    uint64_t v10 = [MEMORY[0x263EFF9A0] dictionary];
    inactiveTracks = v7->_inactiveTracks;
    v7->_inactiveTracks = (NSMutableDictionary *)v10;

    v7->_minSampleSize = 4;
    CMTimeMakeWithSeconds(&v21, 180.0, 1000);
    CMTimeEpoch epoch = v21.epoch;
    *(_OWORD *)&v7->_backgroundExpireInterval.value = *(_OWORD *)&v21.value;
    v7->_backgroundExpireInterval.CMTimeEpoch epoch = epoch;
    CMTimeMakeWithSeconds(&v21, 7.0, 1000);
    CMTimeEpoch v13 = v21.epoch;
    *(_OWORD *)&v7->_backgroundChangeInterval.value = *(_OWORD *)&v21.value;
    v7->_backgroundChangeInterval.CMTimeEpoch epoch = v13;
    CMTimeMakeWithSeconds(&v21, 30.0, 1000);
    CMTimeEpoch v14 = v21.epoch;
    *(_OWORD *)&v7->_backgroundChangeResetInterval.value = *(_OWORD *)&v21.value;
    v7->_backgroundChangeResetInterval.CMTimeEpoch epoch = v14;
    v7->_assignment = 0;
    v7->_runningMean = 0;
    v7->_runningStd = 0;
    uint64_t v15 = [MEMORY[0x263EFF980] array];
    motionDetections = v7->_motionDetections;
    v7->_motionDetections = (NSMutableArray *)v15;

    uint64_t v17 = [MEMORY[0x263EFF980] array];
    motionTimeStamps = v7->_motionTimeStamps;
    v7->_motionTimeStamps = (NSMutableArray *)v17;

    CMTimeMakeWithSeconds(&v21, 1.0, 1000);
    CMTimeEpoch v19 = v21.epoch;
    *(_OWORD *)&v7->_motionValidInterval.value = *(_OWORD *)&v21.value;
    v7->_motionValidInterval.CMTimeEpoch epoch = v19;
    [(HMIBackgroundEstimator *)v7 reset];
  }

  return v7;
}

- (void)reset
{
  self->_numImages = 0;
  v3 = (CGSize *)MEMORY[0x263F001B0];
  self->_imageSize = (CGSize)*MEMORY[0x263F001B0];
  self->_modelSize = *v3;
  uint64_t v4 = MEMORY[0x263F010E0];
  int64_t v5 = *(void *)(MEMORY[0x263F010E0] + 16);
  *(_OWORD *)&self->_foregroundTimeStamp.value = *MEMORY[0x263F010E0];
  self->_foregroundTimeStamp.CMTimeEpoch epoch = v5;
  int64_t v6 = *(void *)(v4 + 16);
  *(_OWORD *)&self->_backgroundTimeStamp.value = *(_OWORD *)v4;
  self->_backgroundTimeStamp.CMTimeEpoch epoch = v6;
  int64_t v7 = *(void *)(v4 + 16);
  *(_OWORD *)&self->_backgroundChangeTimeStamp.value = *(_OWORD *)v4;
  self->_backgroundChangeTimeStamp.CMTimeEpoch epoch = v7;
  self->_adjustBrightness = 0;
  [(NSMutableDictionary *)self->_tracks removeAllObjects];
  [(NSMutableDictionary *)self->_inactiveTracks removeAllObjects];
  assignment = self->_assignment;
  if (assignment)
  {
    free(assignment);
    self->_assignment = 0;
  }
  runningMean = self->_runningMean;
  if (runningMean)
  {
    free(runningMean);
    self->_runningMean = 0;
  }
  runningStd = self->_runningStd;
  if (runningStd)
  {
    free(runningStd);
    self->_runningStd = 0;
  }
}

- (void)dealloc
{
  [(HMIBackgroundEstimator *)self reset];
  v3.receiver = self;
  v3.super_class = (Class)HMIBackgroundEstimator;
  [(HMIBackgroundEstimator *)&v3 dealloc];
}

- (id)analyzePixelBuffer:(__CVBuffer *)a3 timeStamp:(id *)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  if (CVPixelBufferGetPixelFormatType(a3) != 875704438 && CVPixelBufferGetPixelFormatType(a3) != 875704422) {
    _HMFPreconditionFailure();
  }
  long long v24 = *(_OWORD *)&a4->var0;
  int64_t var3 = a4->var3;
  if ([(HMIBackgroundEstimator *)self _invalidateBackgroundForPixelBuffer:a3 timeStamp:&v24])
  {
    [(HMIBackgroundEstimator *)self reset];
    long long v22 = *(_OWORD *)&a4->var0;
    int64_t v23 = a4->var3;
    [(HMIBackgroundEstimator *)self setBackgroundChangeTimeStamp:&v22];
  }
  [(HMIBackgroundEstimator *)self _ensureInternalBuffersForPixelBuffer:a3];
  unint64_t v7 = [(HMIBackgroundEstimator *)self numImages];
  if (v7 >= [(HMIBackgroundEstimator *)self minSampleSize])
  {
    long long v20 = *(_OWORD *)&a4->var0;
    int64_t v21 = a4->var3;
    uint64_t v15 = [(HMIBackgroundEstimator *)self _predictForegroundFromPixelBuffer:a3 timeStamp:&v20];
  }
  else
  {
    long long v18 = *(_OWORD *)&a4->var0;
    int64_t v19 = a4->var3;
    if (![(HMIBackgroundEstimator *)self _updateBackgroundFromPixelBuffer:a3 timeStamp:&v18])
    {
      uint64_t v8 = (void *)MEMORY[0x22A641C70]();
      v9 = self;
      HMFGetOSLogHandle();
      uint64_t v10 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        id v11 = (id)objc_claimAutoreleasedReturnValue();
        $3CC8671D27C23BF42ADDB32F2B5E48AE v17 = *a4;
        Float64 Seconds = CMTimeGetSeconds((CMTime *)&v17);
        uint64_t v13 = [(HMIBackgroundEstimator *)v9 numImages];
        uint64_t v14 = [(HMIBackgroundEstimator *)v9 minSampleSize];
        *(_DWORD *)buf = 138544130;
        id v27 = v11;
        __int16 v28 = 2048;
        Float64 v29 = Seconds;
        __int16 v30 = 2048;
        uint64_t v31 = v13;
        __int16 v32 = 2048;
        uint64_t v33 = v14;
        _os_log_impl(&dword_225DC6000, v10, OS_LOG_TYPE_ERROR, "%{public}@BackgroundEstimator(PTS:%.2f) Unable to update background model (%lu/%lu)", buf, 0x2Au);
      }
    }
    uint64_t v15 = [MEMORY[0x263EFFA08] set];
  }
  return v15;
}

- (BOOL)hasNewBackground
{
  unint64_t v3 = [(HMIBackgroundEstimator *)self numImages];
  if (v3 != [(HMIBackgroundEstimator *)self minSampleSize]) {
    return 0;
  }
  [(HMIBackgroundEstimator *)self foregroundTimeStamp];
  CMTime v5 = *(CMTime *)*(void *)&MEMORY[0x263F010E0];
  return CMTimeCompare(&time1, &v5) == 0;
}

- (void)assignBackgroundEvents:(id)a3 timeStamp:(id *)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  [(HMIBackgroundEstimator *)self backgroundTimeStamp];
  CMTime time2 = *(CMTime *)a4;
  if (!CMTimeCompare(&time1, &time2))
  {
    if ([(HMIBackgroundEstimator *)self assignment])
    {
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __59__HMIBackgroundEstimator_assignBackgroundEvents_timeStamp___block_invoke;
      v12[3] = &unk_26477BEC8;
      v12[4] = self;
      objc_msgSend(v6, "na_each:", v12);
    }
    else
    {
      unint64_t v7 = (void *)MEMORY[0x22A641C70]();
      uint64_t v8 = self;
      HMFGetOSLogHandle();
      v9 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        id v10 = (id)objc_claimAutoreleasedReturnValue();
        [(HMIBackgroundEstimator *)v8 backgroundTimeStamp];
        Float64 Seconds = CMTimeGetSeconds(&time);
        *(_DWORD *)buf = 138543618;
        id v17 = v10;
        __int16 v18 = 2048;
        Float64 v19 = Seconds;
        _os_log_impl(&dword_225DC6000, v9, OS_LOG_TYPE_ERROR, "%{public}@Background model assignment is NULL %.2f", buf, 0x16u);
      }
    }
  }
}

void __59__HMIBackgroundEstimator_assignBackgroundEvents_timeStamp___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = objc_opt_class();
  BOOL v4 = v3 != objc_opt_class();
  CMTime v5 = *(void **)(a1 + 32);
  uint64_t v6 = [v5 assignment];
  [v7 boundingBox];
  objc_msgSend(v5, "_setAssignment:greaterThanType:value:boundingBox:scale:", v6, 1, v4);
}

- (void)assignForegroundEvents:(id)a3 timeStamp:(id *)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if ([(HMIBackgroundEstimator *)self assignment])
  {
    id v7 = objc_msgSend(v6, "na_filter:", &__block_literal_global_7);
    uint64_t v8 = [(HMIBackgroundEstimator *)self tracks];
    v9 = [v8 allValues];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __59__HMIBackgroundEstimator_assignForegroundEvents_timeStamp___block_invoke_2;
    v19[3] = &unk_26477BF38;
    long long v22 = *(_OWORD *)&a4->var0;
    int64_t var3 = a4->var3;
    id v10 = v7;
    id v20 = v10;
    int64_t v21 = self;
    objc_msgSend(v9, "na_each:", v19);

    id v11 = [(HMIBackgroundEstimator *)self tracks];
    v12 = [v11 allValues];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __59__HMIBackgroundEstimator_assignForegroundEvents_timeStamp___block_invoke_4;
    v18[3] = &unk_26477BF60;
    v18[4] = self;
    objc_msgSend(v12, "na_each:", v18);
  }
  else
  {
    uint64_t v13 = (void *)MEMORY[0x22A641C70]();
    uint64_t v14 = self;
    HMFGetOSLogHandle();
    uint64_t v15 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      [(HMIBackgroundEstimator *)v14 backgroundTimeStamp];
      Float64 Seconds = CMTimeGetSeconds(&time);
      *(_DWORD *)buf = 138543618;
      id v26 = v16;
      __int16 v27 = 2048;
      Float64 v28 = Seconds;
      _os_log_impl(&dword_225DC6000, v15, OS_LOG_TYPE_ERROR, "%{public}@Background model assignment is NULL %.2f", buf, 0x16u);
    }
  }
}

BOOL __59__HMIBackgroundEstimator_assignForegroundEvents_timeStamp___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  if (v4 == v5)
  {
    Float64 v19 = [v3 confidence];
    [v19 value];
    if (v6 > 0.41)
    {
      BOOL v7 = 1;
LABEL_18:

      goto LABEL_19;
    }
  }
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  if (v8 == v9
    && ([v3 confidence],
        __int16 v18 = objc_claimAutoreleasedReturnValue(),
        [v18 value],
        v10 > 0.44))
  {

    BOOL v7 = 1;
  }
  else
  {
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    if (v11 == v12
      && ([v3 confidence],
          v2 = objc_claimAutoreleasedReturnValue(),
          [v2 value],
          v13 > 0.42))
    {

      BOOL v7 = 1;
    }
    else
    {
      uint64_t v14 = objc_opt_class();
      if (v14 == objc_opt_class())
      {
        uint64_t v15 = [v3 confidence];
        [v15 value];
        BOOL v7 = v16 > 0.24;
      }
      else
      {
        BOOL v7 = 0;
      }
      if (v11 == v12) {
    }
      }
    if (v8 == v9) {
  }
    }
  if (v4 == v5) {
    goto LABEL_18;
  }
LABEL_19:

  return v7;
}

void __59__HMIBackgroundEstimator_assignForegroundEvents_timeStamp___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v8 = *(_OWORD *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 64);
  uint64_t v4 = [v3 blobAtTimeStamp:&v8];
  if (v4)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __59__HMIBackgroundEstimator_assignForegroundEvents_timeStamp___block_invoke_3;
    v6[3] = &unk_26477BF10;
    uint64_t v5 = *(void **)(a1 + 32);
    v6[4] = *(void *)(a1 + 40);
    id v7 = v3;
    objc_msgSend(v5, "na_each:", v6);
  }
}

void __59__HMIBackgroundEstimator_assignForegroundEvents_timeStamp___block_invoke_3(uint64_t a1, void *a2)
{
  id v15 = a2;
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = [*(id *)(a1 + 40) lastBlob];
  [v15 boundingBox];
  objc_msgSend(v3, "_intersectionOverUnionFromBlob:boundingBox:assignment:", v4, objc_msgSend(*(id *)(a1 + 32), "assignment"), v5, v6, v7, v8);
  float v10 = v9;

  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  float v13 = 0.1;
  if (v11 != v12) {
    float v13 = 0.5;
  }
  if (v10 > v13)
  {
    uint64_t v14 = [*(id *)(a1 + 40) eventClasses];
    [v14 addObject:objc_opt_class()];
  }
}

void __59__HMIBackgroundEstimator_assignForegroundEvents_timeStamp___block_invoke_4(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = [v8 eventClasses];
  int v4 = [v3 containsObject:objc_opt_class()];

  if (v4)
  {
    double v5 = *(void **)(a1 + 32);
    uint64_t v6 = [v5 assignment];
    double v7 = [v8 lastBlob];
    [v7 boundingBox];
    objc_msgSend(v5, "_setAssignment:greaterThanType:value:boundingBox:scale:", v6, 1, 0);
  }
}

- (void)handleMotionDetection:(id)a3 inFrame:(opaqueCMSampleBuffer *)a4
{
  uint64_t v6 = +[HMIMotionDetection firstMotionDetectionInArray:a3 withMode:2];
  memset(&v11, 0, sizeof(v11));
  CMSampleBufferGetPresentationTimeStamp(&v11, a4);
  if (v6)
  {
    double v7 = [v6 motionVectors];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __56__HMIBackgroundEstimator_handleMotionDetection_inFrame___block_invoke;
    v9[3] = &unk_26477BF88;
    v9[4] = self;
    CMTime v10 = v11;
    objc_msgSend(v7, "na_each:", v9);
  }
  CMTime v8 = v11;
  [(HMIBackgroundEstimator *)self _expireMotionDetectionsAtTimeStamp:&v8];
}

void __56__HMIBackgroundEstimator_handleMotionDetection_inFrame___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [*(id *)(a1 + 32) motionTimeStamps];
  long long v14 = *(_OWORD *)(a1 + 40);
  uint64_t v15 = *(void *)(a1 + 56);
  double v5 = [MEMORY[0x263F08D40] valueWithCMTime:&v14];
  [v4 addObject:v5];

  uint64_t v6 = [*(id *)(a1 + 32) motionDetections];
  double v7 = (void *)MEMORY[0x263F08D40];
  [v3 boundingBox];
  v13[0] = v8;
  v13[1] = v9;
  v13[2] = v10;
  v13[3] = v11;
  uint64_t v12 = [v7 valueWithBytes:v13 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
  [v6 addObject:v12];
}

- (BOOL)_invalidateBackgroundForPixelBuffer:(__CVBuffer *)a3 timeStamp:(id *)a4
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  CMTime time1 = *(CMTime *)a4;
  [(HMIBackgroundEstimator *)self backgroundTimeStamp];
  if (CMTimeCompare(&time1, &time2) < 0)
  {
    uint64_t v29 = (void *)MEMORY[0x22A641C70]();
    __int16 v30 = self;
    HMFGetOSLogHandle();
    uint64_t v31 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      id v32 = (id)objc_claimAutoreleasedReturnValue();
      CMTime v55 = (CMTime)*a4;
      Float64 Seconds = CMTimeGetSeconds(&v55);
      [(HMIBackgroundEstimator *)v30 backgroundTimeStamp];
      Float64 v34 = CMTimeGetSeconds(&v54);
      *(_DWORD *)buf = 138543874;
      id v59 = v32;
      __int16 v60 = 2048;
      Float64 v61 = Seconds;
      __int16 v62 = 2048;
      Float64 v63 = v34;
      _os_log_impl(&dword_225DC6000, v31, OS_LOG_TYPE_DEBUG, "%{public}@BackgroundEstimator(PTS:%.2f) Reset background model due to past timestamp %.2f", buf, 0x20u);
    }
    return 1;
  }
  CMTime v53 = (CMTime)*a4;
  [(HMIBackgroundEstimator *)self backgroundTimeStamp];
  [(HMIBackgroundEstimator *)self backgroundExpireInterval];
  CMTimeAdd(&v52, &lhs, &rhs);
  if (CMTimeCompare(&v53, &v52) >= 1)
  {
    double v7 = [(HMIBackgroundEstimator *)self motionDetections];
    int v8 = objc_msgSend(v7, "hmf_isEmpty");

    if (v8)
    {
      uint64_t v9 = (void *)MEMORY[0x22A641C70]();
      uint64_t v10 = self;
      HMFGetOSLogHandle();
      uint64_t v11 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        id v12 = (id)objc_claimAutoreleasedReturnValue();
        CMTime time = (CMTime)*a4;
        Float64 v13 = CMTimeGetSeconds(&time);
        [(HMIBackgroundEstimator *)v10 backgroundTimeStamp];
        Float64 v14 = CMTimeGetSeconds(&v48);
        *(_DWORD *)buf = 138543874;
        id v59 = v12;
        __int16 v60 = 2048;
        Float64 v61 = v13;
        __int16 v62 = 2048;
        Float64 v63 = v14;
        _os_log_impl(&dword_225DC6000, v11, OS_LOG_TYPE_DEBUG, "%{public}@BackgroundEstimator(PTS:%.2f) Reset outdated background model %.2f", buf, 0x20u);
      }
      return 1;
    }
  }
  [(HMIBackgroundEstimator *)self imageSize];
  double v16 = v15;
  if (v18 != HMICVPixelBufferGetSize(a3) || v16 != v17)
  {
    v35 = (void *)MEMORY[0x22A641C70]();
    v36 = self;
    HMFGetOSLogHandle();
    v37 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    {
      v38 = HMFGetLogIdentifier();
      CMTime v47 = (CMTime)*a4;
      Float64 v39 = CMTimeGetSeconds(&v47);
      *(_DWORD *)buf = 138543618;
      id v59 = v38;
      __int16 v60 = 2048;
      Float64 v61 = v39;
      _os_log_impl(&dword_225DC6000, v37, OS_LOG_TYPE_DEBUG, "%{public}@BackgroundEstimator(PTS:%.2f) Reset background model due to image size change", buf, 0x16u);
    }
    return 1;
  }
  CMTime v46 = (CMTime)*a4;
  [(HMIBackgroundEstimator *)self backgroundChangeTimeStamp];
  [(HMIBackgroundEstimator *)self backgroundChangeResetInterval];
  CMTimeAdd(&v45, &v44, &v43);
  if (CMTimeCompare(&v46, &v45) >= 1)
  {
    Float64 v19 = [(HMIBackgroundEstimator *)self motionDetections];
    int v20 = objc_msgSend(v19, "hmf_isEmpty");

    if (v20)
    {
      int64_t v21 = (void *)MEMORY[0x22A641C70]();
      long long v22 = self;
      HMFGetOSLogHandle();
      int64_t v23 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        long long v24 = HMFGetLogIdentifier();
        CMTime v42 = (CMTime)*a4;
        Float64 v25 = CMTimeGetSeconds(&v42);
        *(_DWORD *)buf = 138543618;
        id v59 = v24;
        __int16 v60 = 2048;
        Float64 v61 = v25;
        _os_log_impl(&dword_225DC6000, v23, OS_LOG_TYPE_INFO, "%{public}@BackgroundEstimator(PTS:%.2f) Reset background model due to very large foreground object", buf, 0x16u);
      }
      [(HMIBackgroundEstimator *)v22 backgroundTimeStamp];
      double v26 = CMTimeGetSeconds(&v41);
      __int16 v27 = [(HMIBackgroundEstimator *)v22 configuration];
      Float64 v28 = [v27 camera];
      +[HMIAnalytics videoPackageAnalyzerDidResetReferenceImageWithInterval:v28 camera:v26];

      return 1;
    }
  }
  return 0;
}

- (BOOL)_updateBackgroundFromPixelBuffer:(__CVBuffer *)a3 timeStamp:(id *)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  if (self->_runningMean && self->_runningStd)
  {
    $3CC8671D27C23BF42ADDB32F2B5E48AE v23 = *a4;
    [(HMIBackgroundEstimator *)self setBackgroundTimeStamp:&v23];
    [(HMIBackgroundEstimator *)self modelSize];
    double v8 = v7;
    [(HMIBackgroundEstimator *)self modelSize];
    uint64_t v10 = malloc_type_malloc(4 * (unint64_t)(v8 * 3.0 * v9), 0x100004052888210uLL);
    for (uint64_t i = 0; i != 5; ++i)
    {
      [(HMIBackgroundEstimator *)self _copyFromPixelBuffer:a3 toInputBuffer:v10 translateCol:kHMIBackgroundEstimatorTranslateCol[i] translateRow:kHMIBackgroundEstimatorTranslateRow[i]];
      unint64_t v12 = [(HMIBackgroundEstimator *)self numImages];
      Float64 v13 = [(HMIBackgroundEstimator *)self runningMean];
      Float64 v14 = [(HMIBackgroundEstimator *)self runningStd];
      *(float *)&double v15 = (float)(i + 5 * v12) / (float)((float)(i + 5 * v12) + 1.0);
      [(HMIBackgroundEstimator *)self _updateRunningMean:v13 runningSquaredMean:v14 fromInputBuffer:v10 decay:v15];
    }
    ++self->_numImages;
    unint64_t v16 = [(HMIBackgroundEstimator *)self numImages];
    if (v16 == [(HMIBackgroundEstimator *)self minSampleSize]) {
      [(HMIBackgroundEstimator *)self _updateRunningStd:[(HMIBackgroundEstimator *)self runningStd] withAuxBuffer:v10 runningMean:[(HMIBackgroundEstimator *)self runningMean] runningSquaredMean:[(HMIBackgroundEstimator *)self runningStd]];
    }
    free(v10);
    return 1;
  }
  else
  {
    double v18 = (void *)MEMORY[0x22A641C70]();
    Float64 v19 = self;
    HMFGetOSLogHandle();
    int v20 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      int64_t v21 = HMFGetLogIdentifier();
      CMTime time = (CMTime)*a4;
      Float64 Seconds = CMTimeGetSeconds(&time);
      *(_DWORD *)buf = 138543618;
      double v26 = v21;
      __int16 v27 = 2048;
      Float64 v28 = Seconds;
      _os_log_impl(&dword_225DC6000, v20, OS_LOG_TYPE_ERROR, "%{public}@BackgroundEstimator(PTS:%.2f) Unable to alloc buffer", buf, 0x16u);
    }
    return 0;
  }
}

- (id)_predictForegroundFromPixelBuffer:(__CVBuffer *)a3 timeStamp:(id *)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  if (self->_runningMean && self->_runningStd && self->_assignment)
  {
    $3CC8671D27C23BF42ADDB32F2B5E48AE v34 = *a4;
    [(HMIBackgroundEstimator *)self _expireMotionDetectionsAtTimeStamp:&v34];
    long long v32 = *(_OWORD *)&a4->var0;
    int64_t var3 = a4->var3;
    [(HMIBackgroundEstimator *)self setForegroundTimeStamp:&v32];
    [(HMIBackgroundEstimator *)self modelSize];
    double v8 = v7;
    [(HMIBackgroundEstimator *)self modelSize];
    uint64_t v10 = malloc_type_calloc((unint64_t)(v8 * v9), 1uLL, 0x100004077774924uLL);
    [(HMIBackgroundEstimator *)self _foregroundPixelsFromPixelBuffer:a3 attribute:v10 assignment:[(HMIBackgroundEstimator *)self assignment] useChromaOnly:[(HMIBackgroundEstimator *)self adjustBrightness]];
    uint64_t v11 = [(HMIBackgroundEstimator *)self assignment];
    long long v30 = *(_OWORD *)&a4->var0;
    int64_t v31 = a4->var3;
    unint64_t v12 = [(HMIBackgroundEstimator *)self _blobsFromAssignment:v11 timeStamp:&v30];
    buf[0] = 0;
    Float64 v13 = [(HMIBackgroundEstimator *)self _foregroundBlobsFromBlobs:v12 backgroundChanged:buf];
    Float64 v14 = [(HMIBackgroundEstimator *)self tracks];
    double v15 = [(HMIBackgroundEstimator *)self inactiveTracks];
    long long v28 = *(_OWORD *)&a4->var0;
    int64_t v29 = a4->var3;
    [(HMIBackgroundEstimator *)self _updateCurrentTracks:v14 inactiveTracks:v15 blobs:v13 timeStamp:&v28];

    long long v26 = *(_OWORD *)&a4->var0;
    int64_t v27 = a4->var3;
    LODWORD(v14) = [(HMIBackgroundEstimator *)self _adjustBackgroundAtAttribute:v10 backgroundChanged:buf[0] timeStamp:&v26];
    free(v10);
    if (v14)
    {
      unint64_t v16 = [MEMORY[0x263EFFA08] set];
    }
    else
    {
      long long v22 = [(HMIBackgroundEstimator *)self tracks];
      long long v24 = *(_OWORD *)&a4->var0;
      int64_t v25 = a4->var3;
      unint64_t v16 = [(HMIBackgroundEstimator *)self _stationaryTracks:v22 timeStamp:&v24];
    }
  }
  else
  {
    double v17 = (void *)MEMORY[0x22A641C70]();
    double v18 = self;
    HMFGetOSLogHandle();
    Float64 v19 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      int v20 = HMFGetLogIdentifier();
      CMTime time = (CMTime)*a4;
      Float64 Seconds = CMTimeGetSeconds(&time);
      *(_DWORD *)buf = 138543618;
      v37 = v20;
      __int16 v38 = 2048;
      Float64 v39 = Seconds;
      _os_log_impl(&dword_225DC6000, v19, OS_LOG_TYPE_ERROR, "%{public}@BackgroundEstimator(PTS:%.2f) No background model", buf, 0x16u);
    }
    unint64_t v16 = [MEMORY[0x263EFFA08] set];
  }
  return v16;
}

- (BOOL)_adjustBackgroundAtAttribute:(const char *)a3 backgroundChanged:(BOOL)a4 timeStamp:(id *)a5
{
  if (!a4)
  {
    $3CC8671D27C23BF42ADDB32F2B5E48AE v13 = *a5;
    [(HMIBackgroundEstimator *)self setBackgroundChangeTimeStamp:&v13];
  }
  if (![(HMIBackgroundEstimator *)self adjustBrightness])
  {
    CMTime time1 = (CMTime)*a5;
    [(HMIBackgroundEstimator *)self backgroundChangeTimeStamp];
    [(HMIBackgroundEstimator *)self backgroundChangeInterval];
    CMTimeAdd(&time2, &lhs, &rhs);
    if (CMTimeCompare(&time1, &time2) >= 1) {
      [(HMIBackgroundEstimator *)self setAdjustBrightness:1];
    }
  }
  return a4 & ~[(HMIBackgroundEstimator *)self adjustBrightness];
}

- (void)_expireMotionDetectionsAtTimeStamp:(id *)a3
{
  while (1)
  {
    double v5 = [(HMIBackgroundEstimator *)self motionTimeStamps];
    if (objc_msgSend(v5, "hmf_isEmpty")) {
      break;
    }
    CMTime time1 = (CMTime)*a3;
    uint64_t v6 = [(HMIBackgroundEstimator *)self motionTimeStamps];
    double v7 = [v6 firstObject];
    double v8 = v7;
    if (v7) {
      [v7 CMTimeValue];
    }
    else {
      memset(&lhs, 0, sizeof(lhs));
    }
    [(HMIBackgroundEstimator *)self motionValidInterval];
    CMTimeAdd(&time2, &lhs, &rhs);
    int32_t v9 = CMTimeCompare(&time1, &time2);

    if (v9 < 1) {
      return;
    }
    uint64_t v10 = [(HMIBackgroundEstimator *)self motionTimeStamps];
    objc_msgSend(v10, "hmf_removeFirstObject");

    uint64_t v11 = [(HMIBackgroundEstimator *)self motionDetections];
    objc_msgSend(v11, "hmf_removeFirstObject");
  }
}

- (id)_foregroundBlobsFromBlobs:(id)a3 backgroundChanged:(BOOL *)a4
{
  id v5 = a3;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x5012000000;
  v11[3] = __Block_byref_object_copy__1;
  v11[4] = __Block_byref_object_dispose__1;
  v11[5] = &unk_225F58031;
  long long v6 = *(_OWORD *)(MEMORY[0x263F001A0] + 16);
  long long v12 = *MEMORY[0x263F001A0];
  long long v13 = v6;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __70__HMIBackgroundEstimator__foregroundBlobsFromBlobs_backgroundChanged___block_invoke;
  v10[3] = &unk_26477BFB0;
  v10[4] = v11;
  double v7 = objc_msgSend(v5, "na_filter:", v10);
  unint64_t v8 = [v7 count];
  *a4 = v8 < [v5 count];
  _Block_object_dispose(v11, 8);

  return v7;
}

BOOL __70__HMIBackgroundEstimator__foregroundBlobsFromBlobs_backgroundChanged___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(double **)(*(void *)(a1 + 32) + 8);
  CGFloat v5 = v4[6];
  CGFloat v6 = v4[7];
  CGFloat v7 = v4[8];
  CGFloat v8 = v4[9];
  [v3 boundingBox];
  v20.origin.x = v9;
  v20.origin.y = v10;
  v20.size.width = v11;
  v20.size.height = v12;
  v19.origin.x = v5;
  v19.origin.y = v6;
  v19.size.width = v7;
  v19.size.height = v8;
  *(CGRect *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = CGRectUnion(v19, v20);
  [v3 boundingBox];
  BOOL v17 = HMICGRectArea(v13, v14, v15, v16) < 0.600000024;

  return v17;
}

- (void)_updateCurrentTracks:(id)a3 inactiveTracks:(id)a4 blobs:(id)a5 timeStamp:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v30 = a5;
  int64_t v31 = [v10 allValues];
  long long v28 = [v30 allObjects];
  CGFloat v12 = [MEMORY[0x263EFF980] array];
  v48[0] = MEMORY[0x263EF8330];
  v48[1] = 3221225472;
  v48[2] = __78__HMIBackgroundEstimator__updateCurrentTracks_inactiveTracks_blobs_timeStamp___block_invoke;
  v48[3] = &unk_26477C000;
  id v13 = v28;
  id v49 = v13;
  id v14 = v12;
  id v50 = v14;
  [v31 enumerateObjectsUsingBlock:v48];
  int64_t v29 = objc_msgSend(MEMORY[0x263F089C8], "indexSetWithIndexesInRange:", 0, objc_msgSend(v10, "count"));
  double v15 = objc_msgSend(MEMORY[0x263F089C8], "indexSetWithIndexesInRange:", 0, objc_msgSend(v30, "count"));
  double v16 = objc_msgSend(v14, "sortedArrayUsingComparator:", &__block_literal_global_2, v15);
  v43[0] = MEMORY[0x263EF8330];
  v43[1] = 3221225472;
  v43[2] = __78__HMIBackgroundEstimator__updateCurrentTracks_inactiveTracks_blobs_timeStamp___block_invoke_3;
  v43[3] = &unk_26477C028;
  id v17 = v29;
  id v44 = v17;
  id v18 = v15;
  id v45 = v18;
  id v19 = v31;
  id v46 = v19;
  id v20 = v13;
  id v47 = v20;
  objc_msgSend(v16, "na_each:", v43);

  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __78__HMIBackgroundEstimator__updateCurrentTracks_inactiveTracks_blobs_timeStamp___block_invoke_4;
  v38[3] = &unk_26477C050;
  id v21 = v19;
  id v39 = v21;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v42 = *a6;
  id v22 = v11;
  id v40 = v22;
  id v23 = v10;
  id v41 = v23;
  [v17 enumerateIndexesUsingBlock:v38];
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __78__HMIBackgroundEstimator__updateCurrentTracks_inactiveTracks_blobs_timeStamp___block_invoke_5;
  v35[3] = &unk_26477C078;
  v35[4] = self;
  id v24 = v23;
  id v36 = v24;
  id v25 = v20;
  id v37 = v25;
  [v18 enumerateIndexesUsingBlock:v35];
  long long v26 = [v22 allValues];
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __78__HMIBackgroundEstimator__updateCurrentTracks_inactiveTracks_blobs_timeStamp___block_invoke_6;
  v32[3] = &unk_26477C0A0;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v34 = *a6;
  id v27 = v22;
  id v33 = v27;
  objc_msgSend(v26, "na_each:", v32);
}

void __78__HMIBackgroundEstimator__updateCurrentTracks_inactiveTracks_blobs_timeStamp___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __78__HMIBackgroundEstimator__updateCurrentTracks_inactiveTracks_blobs_timeStamp___block_invoke_2;
  v8[3] = &unk_26477BFD8;
  id v9 = v5;
  CGFloat v6 = *(void **)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  uint64_t v11 = a3;
  id v7 = v5;
  [v6 enumerateObjectsUsingBlock:v8];
}

void __78__HMIBackgroundEstimator__updateCurrentTracks_inactiveTracks_blobs_timeStamp___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v11 = a2;
  objc_msgSend(*(id *)(a1 + 32), "similarityToBlob:");
  float v6 = v5;
  if (v5 > 0.0)
  {
    id v7 = *(void **)(a1 + 40);
    CGFloat v8 = [HMIPairwiseMatch alloc];
    *(float *)&double v9 = v6;
    id v10 = [(HMIPairwiseMatch *)v8 initWithFirstIndex:*(void *)(a1 + 48) secondIndex:a3 score:v9];
    [v7 addObject:v10];
  }
}

void __78__HMIBackgroundEstimator__updateCurrentTracks_inactiveTracks_blobs_timeStamp___block_invoke_3(id *a1, void *a2)
{
  id v5 = a2;
  if (objc_msgSend(a1[4], "containsIndex:", objc_msgSend(v5, "firstIndex"))
    && objc_msgSend(a1[5], "containsIndex:", objc_msgSend(v5, "secondIndex")))
  {
    id v3 = objc_msgSend(a1[6], "objectAtIndexedSubscript:", objc_msgSend(v5, "firstIndex"));
    int v4 = objc_msgSend(a1[7], "objectAtIndexedSubscript:", objc_msgSend(v5, "secondIndex"));
    [v3 appendBlob:v4];

    objc_msgSend(a1[4], "removeIndex:", objc_msgSend(v5, "firstIndex"));
    objc_msgSend(a1[5], "removeIndex:", objc_msgSend(v5, "secondIndex"));
  }
}

void __78__HMIBackgroundEstimator__updateCurrentTracks_inactiveTracks_blobs_timeStamp___block_invoke_4(uint64_t a1, uint64_t a2)
{
  int v4 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
  long long v15 = *(_OWORD *)(a1 + 56);
  uint64_t v16 = *(void *)(a1 + 72);
  int v5 = [v4 isLostAtTimeStamp:&v15];

  if (v5)
  {
    float v6 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
    id v7 = NSNumber;
    CGFloat v8 = *(void **)(a1 + 40);
    double v9 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
    id v10 = objc_msgSend(v7, "numberWithUnsignedInteger:", objc_msgSend(v9, "trackIndex"));
    [v8 setObject:v6 forKeyedSubscript:v10];

    id v11 = *(void **)(a1 + 48);
    CGFloat v12 = NSNumber;
    id v13 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
    id v14 = objc_msgSend(v12, "numberWithUnsignedInteger:", objc_msgSend(v13, "trackIndex"));
    [v11 removeObjectForKey:v14];
  }
}

void __78__HMIBackgroundEstimator__updateCurrentTracks_inactiveTracks_blobs_timeStamp___block_invoke_5(uint64_t a1, uint64_t a2)
{
  int v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v4 numTracks];
  [v4 setNumTracks:v5 + 1];
  float v6 = [HMIVideoAnalyzerTrack alloc];
  id v10 = [*(id *)(a1 + 48) objectAtIndexedSubscript:a2];
  id v7 = -[HMIVideoAnalyzerTrack initWithBlob:trackIndex:](v6, "initWithBlob:trackIndex:");
  CGFloat v8 = *(void **)(a1 + 40);
  double v9 = [NSNumber numberWithUnsignedInteger:v5];
  [v8 setObject:v7 forKeyedSubscript:v9];
}

void __78__HMIBackgroundEstimator__updateCurrentTracks_inactiveTracks_blobs_timeStamp___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v6 = *(_OWORD *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 56);
  if ([v3 isExpiredAtTimeStamp:&v6])
  {
    int v4 = *(void **)(a1 + 32);
    uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "trackIndex"));
    [v4 removeObjectForKey:v5];
  }
}

- (id)_stationaryTracks:(id)a3 timeStamp:(id *)a4
{
  long long v6 = (void *)MEMORY[0x263EFFA08];
  uint64_t v7 = [a3 allValues];
  CGFloat v8 = [v6 setWithArray:v7];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __54__HMIBackgroundEstimator__stationaryTracks_timeStamp___block_invoke;
  v13[3] = &__block_descriptor_56_e31_B16__0__HMIVideoAnalyzerTrack_8l;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v14 = *a4;
  double v9 = objc_msgSend(v8, "na_filter:", v13);

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __54__HMIBackgroundEstimator__stationaryTracks_timeStamp___block_invoke_2;
  v12[3] = &unk_26477C110;
  v12[4] = self;
  id v10 = objc_msgSend(v9, "na_filter:", v12);

  return v10;
}

uint64_t __54__HMIBackgroundEstimator__stationaryTracks_timeStamp___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v6 = *(_OWORD *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 48);
  if ([v3 isStationaryAtTimeStamp:&v6]) {
    uint64_t v4 = [v3 isClassified] ^ 1;
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

uint64_t __54__HMIBackgroundEstimator__stationaryTracks_timeStamp___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) motionDetections];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __54__HMIBackgroundEstimator__stationaryTracks_timeStamp___block_invoke_3;
  v8[3] = &unk_26477C0E8;
  id v5 = v3;
  id v9 = v5;
  uint64_t v6 = objc_msgSend(v4, "na_any:", v8) ^ 1;

  return v6;
}

BOOL __54__HMIBackgroundEstimator__stationaryTracks_timeStamp___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) lastBlob];
  [v4 boundingBox];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  [v3 rectValue];
  v20.origin.x = v13;
  v20.origin.y = v14;
  v20.size.width = v15;
  v20.size.height = v16;
  v19.origin.x = v6;
  v19.origin.y = v8;
  v19.size.width = v10;
  v19.size.height = v12;
  BOOL v17 = CGRectIntersectsRect(v19, v20);

  return v17;
}

- (void)_ensureInternalBuffersForPixelBuffer:(__CVBuffer *)a3
{
  if (!self->_runningMean || !self->_runningStd || !self->_assignment)
  {
    size_t v5 = (CVPixelBufferGetWidth(a3) + 1) >> 1;
    size_t v6 = (CVPixelBufferGetHeight(a3) + 1) >> 1;
    self->_imageSize.width = HMICVPixelBufferGetSize(a3);
    self->_imageSize.height = v7;
    self->_modelSize.width = (double)v5;
    self->_modelSize.height = (double)v6;
    self->_runningMean = (float *)malloc_type_calloc(3 * v6 * v5, 4uLL, 0x100004052888210uLL);
    self->_runningStd = (float *)malloc_type_calloc(3 * v6 * v5, 4uLL, 0x100004052888210uLL);
    CGFloat v8 = (unsigned __int16 *)malloc_type_malloc(2 * v6 * v5, 0x1000040BDFB0063uLL);
    self->_assignment = v8;
    memset(v8, 2, 2 * v6 * v5);
  }
}

- (void)_copyFromPixelBuffer:(__CVBuffer *)a3 toInputBuffer:(float *)a4 translateCol:(int)a5 translateRow:(int)a6
{
  [(HMIBackgroundEstimator *)self modelSize];
  unint64_t v12 = (unint64_t)v11;
  [(HMIBackgroundEstimator *)self modelSize];
  unint64_t v14 = (unint64_t)v13;
  unint64_t v15 = (unint64_t)v13 * v12;
  unint64_t v16 = a5 & ~(a5 >> 31);
  unint64_t v17 = -a5 & ~(-a5 >> 31);
  if (a5) {
    memcpy(a4, self->_runningMean, 12 * v15);
  }
  CVPixelBufferLockBaseAddress(a3, 1uLL);
  size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
  BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(a3, 0);
  CVPixelBufferRef pixelBuffer = a3;
  CGRect v19 = (char *)CVPixelBufferGetBaseAddressOfPlane(a3, 1uLL);
  if (v16 <= v17) {
    uint64_t v20 = -a5 & ~(-a5 >> 31);
  }
  else {
    uint64_t v20 = a5 & ~(a5 >> 31);
  }
  if (v14)
  {
    vDSP_Length v21 = v12 - v20;
    id v22 = &a4[v16];
    unint64_t v23 = v15;
    int v24 = v14 - 1;
    unint64_t v25 = v17;
    long long v26 = &v19[2 * v17];
    uint64_t v35 = 2 * v23;
    uint64_t v27 = 4 * v12;
    uint64_t v28 = v23;
    int64_t v29 = BaseAddressOfPlane;
    int v30 = -a6;
    int64_t v31 = &v29[2 * v25];
    do
    {
      if (v30 >= v24) {
        int v32 = v24;
      }
      else {
        int v32 = v30;
      }
      size_t v33 = BytesPerRowOfPlane * (v32 & ~(v32 >> 31));
      vDSP_vfltu8((const unsigned __int8 *)&v31[2 * v33], 2, v22, 1, v21);
      vDSP_vfltu8((const unsigned __int8 *)&v26[v33], 2, &v22[v28], 1, v21);
      vDSP_vfltu8((const unsigned __int8 *)&v26[v33 + 1], 2, &v22[v35], 1, v21);
      id v22 = (float *)((char *)v22 + v27);
      ++v30;
      --v14;
    }
    while (v14);
  }
  CVPixelBufferUnlockBaseAddress(pixelBuffer, 1uLL);
}

- (void)_copyFromOutputBuffer:(const float *)a3 toPixelBuffer:(__CVBuffer *)a4
{
  if (CVPixelBufferGetPixelFormatType(a4) == 875704422)
  {
    [(HMIBackgroundEstimator *)self modelSize];
    double v8 = v7;
    [(HMIBackgroundEstimator *)self modelSize];
    unint64_t v10 = (unint64_t)v9;
    CVPixelBufferLockBaseAddress(a4, 0);
    size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a4, 0);
    BaseAddressOfPlane = (unsigned __int8 *)CVPixelBufferGetBaseAddressOfPlane(a4, 0);
    CVPixelBufferRef pixelBuffer = a4;
    double v13 = (unsigned __int8 *)CVPixelBufferGetBaseAddressOfPlane(a4, 1uLL);
    if (v10)
    {
      unint64_t v14 = v13;
      unint64_t v15 = v10 * (unint64_t)v8;
      uint64_t v22 = 2 * v15;
      unint64_t v16 = v15;
      do
      {
        vDSP_vfixru8(a3, 1, BaseAddressOfPlane, 2, (unint64_t)v8);
        vDSP_vfixru8(a3, 1, BaseAddressOfPlane + 1, 2, (unint64_t)v8);
        vDSP_vfixru8(a3, 1, &BaseAddressOfPlane[BytesPerRowOfPlane], 2, (unint64_t)v8);
        vDSP_vfixru8(a3, 1, &BaseAddressOfPlane[BytesPerRowOfPlane + 1], 2, (unint64_t)v8);
        vDSP_vfixru8(&a3[v16], 1, v14, 2, (unint64_t)v8);
        vDSP_vfixru8(&a3[v22], 1, v14 + 1, 2, (unint64_t)v8);
        v14 += BytesPerRowOfPlane;
        a3 += (unint64_t)v8;
        BaseAddressOfPlane += 2 * BytesPerRowOfPlane;
        --v10;
      }
      while (v10);
    }
    CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
  }
  else
  {
    unint64_t v17 = (HMIBackgroundEstimator *)_HMFPreconditionFailure();
    [(HMIBackgroundEstimator *)v17 _intersectionOverUnionFromBlob:v19 boundingBox:v24 assignment:v20];
  }
}

- (float)_intersectionOverUnionFromBlob:(id)a3 boundingBox:(CGRect)a4 assignment:(unsigned __int16 *)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v11 = a3;
  [(HMIBackgroundEstimator *)self modelSize];
  double v13 = v12;
  [(HMIBackgroundEstimator *)self modelSize];
  double v15 = v14;
  v60.origin.CGFloat x = x;
  v60.origin.CGFloat y = y;
  v60.size.double width = width;
  v60.size.double height = height;
  CGFloat MinX = CGRectGetMinX(v60);
  int v17 = (int)v13;
  int v18 = (int)v13 - 1;
  double v19 = MinX * (double)(int)v13;
  double v20 = (double)v18;
  if (v19 > (double)v18) {
    double v19 = (double)v18;
  }
  double v56 = v19;
  v61.origin.CGFloat x = x;
  v61.origin.CGFloat y = y;
  v61.size.double width = width;
  v61.size.double height = height;
  CGFloat MinY = CGRectGetMinY(v61);
  double v22 = (double)(int)v15;
  int v23 = (int)v15 - 1;
  double v24 = MinY * v22;
  double v25 = (double)v23;
  if (v24 > (double)v23) {
    double v24 = (double)v23;
  }
  double v58 = v24;
  v62.origin.CGFloat x = x;
  v62.origin.CGFloat y = y;
  v62.size.double width = width;
  v62.size.double height = height;
  double v26 = CGRectGetMaxX(v62) * (double)v17;
  if (v26 > v20) {
    double v26 = v20;
  }
  double v55 = v26;
  v63.origin.CGFloat x = x;
  v63.origin.CGFloat y = y;
  v63.size.double width = width;
  v63.size.double height = height;
  CGFloat MaxY = CGRectGetMaxY(v63);
  int v28 = (int)fmax(v58, 0.0);
  double v29 = MaxY * v22;
  if (v29 > v25) {
    double v29 = v25;
  }
  int v30 = (int)fmax(v29, 0.0);
  int v31 = v30 - v28;
  if (v30 < v28) {
    int v31 = v30 - v28 + 3;
  }
  LODWORD(v32) = v31 >> 2;
  if ((int)v32 <= 1) {
    uint64_t v32 = 1;
  }
  else {
    uint64_t v32 = v32;
  }
  unint64_t v59 = v32;
  float v33 = 0.0;
  float v34 = 0.0;
  if ((int)(v28 + (v32 >> 1)) < v30)
  {
    int v35 = (int)fmax(v56, 0.0);
    double v36 = fmax(v55, 0.0);
    int v37 = (int)v36 - v35;
    if ((int)v36 < v35) {
      v37 += 3;
    }
    int v38 = v37 >> 2;
    if (v38 <= 1) {
      uint64_t v39 = 1;
    }
    else {
      uint64_t v39 = v38;
    }
    uint64_t v40 = (int)(v35 + (v39 >> 1));
    int v57 = (int)v36;
    uint64_t v41 = (int)v36;
    int64_t v42 = (v59 >> 1) + v28;
    uint64_t v43 = v17;
    int64_t v44 = v30;
    id v45 = &a5[v42 * v43];
    uint64_t v46 = 2 * v43 * v59;
    do
    {
      uint64_t v47 = v40;
      if ((int)v40 < v57)
      {
        do
        {
          int v48 = v45[v47];
          if (v48 == [v11 blobID]) {
            float v33 = v33 + 1.0;
          }
          float v34 = v34 + 1.0;
          v47 += v39;
        }
        while (v47 < v41);
      }
      v42 += v59;
      id v45 = (unsigned __int16 *)((char *)v45 + v46);
    }
    while (v42 < v44);
  }
  [v11 blobArea];
  float v49 = width * height;
  float v50 = (float)(v33 * v49) / v34;
  float v52 = (float)(v51 + v49) - v50;
  if (v52 < 0.000000001) {
    float v52 = 0.000000001;
  }
  float v53 = v50 / v52;

  return v53;
}

- (void)_setAssignment:(unsigned __int16 *)a3 greaterThanType:(unsigned __int16)a4 value:(unsigned __int16)a5 boundingBox:(CGRect)a6 scale:(float)a7
{
  CGFloat height = a6.size.height;
  CGFloat width = a6.size.width;
  CGFloat y = a6.origin.y;
  CGFloat x = a6.origin.x;
  unsigned int v13 = a4;
  double v15 = self;
  [(HMIBackgroundEstimator *)self modelSize];
  double v45 = v16;
  [(HMIBackgroundEstimator *)v15 modelSize];
  LODWORD(v15) = (int)v17;
  v46.origin.CGFloat x = x;
  v46.origin.CGFloat y = y;
  v46.size.CGFloat width = width;
  v46.size.CGFloat height = height;
  double v44 = CGRectGetWidth(v46);
  v47.origin.CGFloat x = x;
  v47.origin.CGFloat y = y;
  v47.size.CGFloat width = width;
  v47.size.CGFloat height = height;
  double v43 = a7;
  float v18 = CGRectGetHeight(v47) * a7;
  v48.origin.CGFloat x = x;
  v48.origin.CGFloat y = y;
  v48.size.CGFloat width = width;
  v48.size.CGFloat height = height;
  double MinX = CGRectGetMinX(v48);
  int v19 = v15 - 1;
  double v20 = (double)(int)v15;
  v49.origin.CGFloat x = x;
  v49.origin.CGFloat y = y;
  v49.size.CGFloat width = width;
  v49.size.CGFloat height = height;
  double v21 = v18;
  double v22 = (CGRectGetMinY(v49) - v18) * (double)(int)v15;
  double v23 = (double)((int)v15 - 1);
  if (v22 > v23) {
    double v22 = (double)v19;
  }
  int v24 = (int)fmax(v22, 0.0);
  v50.origin.CGFloat x = x;
  v50.origin.CGFloat y = y;
  v50.size.CGFloat width = width;
  v50.size.CGFloat height = height;
  double MaxX = CGRectGetMaxX(v50);
  v51.origin.CGFloat x = x;
  v51.origin.CGFloat y = y;
  v51.size.CGFloat width = width;
  v51.size.CGFloat height = height;
  double v26 = (CGRectGetMaxY(v51) + v21) * v20;
  if (v26 > v23) {
    double v26 = (double)v19;
  }
  int v27 = (int)fmax(v26, 0.0);
  if (v24 <= v27)
  {
    float v28 = v44 * v43;
    double v29 = v28;
    int v30 = (int)v45;
    double v31 = (MaxX + v29) * (double)(int)v45;
    double v32 = (double)((int)v45 - 1);
    if (v31 > v32) {
      double v31 = (double)(v30 - 1);
    }
    int v33 = (int)fmax(v31, 0.0);
    double v34 = (MinX - v29) * (double)v30;
    if (v34 > v32) {
      double v34 = (double)(v30 - 1);
    }
    int v35 = (int)fmax(v34, 0.0);
    uint64_t v36 = v24;
    int v37 = v27 + 1;
    int v38 = &a3[v35 + v24 * (uint64_t)v30];
    uint64_t v39 = 2 * v30;
    do
    {
      int v40 = v33 - v35 + 1;
      uint64_t v41 = v38;
      if (v35 <= v33)
      {
        do
        {
          if (*v41 > v13) {
            *uint64_t v41 = a5;
          }
          ++v41;
          --v40;
        }
        while (v40);
      }
      ++v36;
      int v38 = (unsigned __int16 *)((char *)v38 + v39);
    }
    while (v37 != v36);
  }
}

- (void)_updateRunningMean:(float *)a3 runningSquaredMean:(float *)a4 fromInputBuffer:(const float *)a5 decay:(float)a6
{
  float __B = a6;
  [(HMIBackgroundEstimator *)self modelSize];
  double v12 = v11;
  [(HMIBackgroundEstimator *)self modelSize];
  float __D = 1.0 - a6;
  if ((float)(1.0 - a6) != 0.0)
  {
    vDSP_Length __N = (unint64_t)(v12 * 3.0 * v13);
    vDSP_vsmsma(a3, 1, &__B, a5, 1, &__D, a3, 1, __N);
    float v15 = __B / __D;
    vDSP_vsmul(a4, 1, &v15, a4, 1, __N);
    vDSP_vma(a5, 1, a5, 1, a4, 1, a4, 1, __N);
    vDSP_vsmul(a4, 1, &__D, a4, 1, __N);
  }
}

- (void)_updateRunningStd:(float *)a3 withAuxBuffer:(float *)a4 runningMean:(const float *)a5 runningSquaredMean:(const float *)a6
{
  [(HMIBackgroundEstimator *)self modelSize];
  double v12 = v11 * 3.0;
  [(HMIBackgroundEstimator *)self modelSize];
  unint64_t __N = (unint64_t)(v12 * v13);
  vDSP_vsq(a5, 1, a4, 1, __N);
  float __D = -1.0;
  float __B = 1.0;
  vDSP_vsmsma(a6, 1, &__B, a4, 1, &__D, a3, 1, __N);
  float v16 = 0.0;
  vDSP_vthr(a3, 1, &v16, a3, 1, __N);
  int v15 = __N;
  vvsqrtf(a3, a3, &v15);
}

- (void)_correctRunningMeanBrightnessAtAttribute:(const char *)a3
{
  [(HMIBackgroundEstimator *)self modelSize];
  double v6 = v5;
  [(HMIBackgroundEstimator *)self modelSize];
  if ((unint64_t)(v6 * v7))
  {
    unint64_t v8 = 0;
    do
    {
      char v9 = a3[v8];
      if (v9)
      {
        runningMean = self->_runningMean;
        float v11 = runningMean[v8] + 15.0;
        if (v11 > 255.0) {
          float v11 = 255.0;
        }
        runningMean[v8] = fmaxf(v11, 0.0);
        char v9 = a3[v8];
      }
      if ((v9 & 2) != 0)
      {
        double v12 = self->_runningMean;
        float v13 = v12[v8] + -15.0;
        if (v13 > 255.0) {
          float v13 = 255.0;
        }
        v12[v8] = fmaxf(v13, 0.0);
      }
      ++v8;
      [(HMIBackgroundEstimator *)self modelSize];
      double v15 = v14;
      [(HMIBackgroundEstimator *)self modelSize];
    }
    while (v8 < (unint64_t)(v15 * v16));
  }
}

- (void)_foregroundPixelsFromPixelBuffer:(__CVBuffer *)a3 attribute:(char *)a4 assignment:(unsigned __int16 *)a5 useChromaOnly:(BOOL)a6
{
  BOOL v6 = a6;
  size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
  [(HMIBackgroundEstimator *)self modelSize];
  double v13 = v12;
  [(HMIBackgroundEstimator *)self modelSize];
  double v15 = v14;
  [(HMIBackgroundEstimator *)self modelSize];
  unint64_t v17 = (unint64_t)(v15 * v16);
  CVPixelBufferLockBaseAddress(a3, 1uLL);
  BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(a3, 0);
  int v19 = CVPixelBufferGetBaseAddressOfPlane(a3, 1uLL);
  if (v17)
  {
    unint64_t v21 = 0;
    unint64_t v22 = (unint64_t)v13;
    uint64_t v23 = v17;
    uint64_t v24 = 2 * v17;
    do
    {
      if (a5[v21] >= 2u)
      {
        if (v6)
        {
          runningMean = self->_runningMean;
          runningStd = self->_runningStd;
          unint64_t v27 = v21 / v22 * BytesPerRowOfPlane;
          unint64_t v28 = v21 % v22;
LABEL_13:
          unint64_t v31 = v27 + 2 * v28;
          LOBYTE(v20) = v19[v31];
          float v32 = (float)LODWORD(v20) - runningMean[v23 + v21];
          if (v32 < 0.0) {
            float v32 = -v32;
          }
          float v33 = runningStd[v23 + v21];
          float v20 = v32 + (float)(v33 * -2.0);
          LOBYTE(v33) = v19[v31 + 1];
          float v34 = (float)LODWORD(v33) - runningMean[v24 + v21];
          if (v34 < 0.0) {
            float v34 = -v34;
          }
          float v35 = v34 + (float)(runningStd[v24 + v21] * -2.0);
          if (v20 < v35) {
            float v20 = v35;
          }
          if (v20 <= 6.0) {
            unsigned __int16 v36 = 3;
          }
          else {
            unsigned __int16 v36 = 2;
          }
          a5[v21] = v36;
          goto LABEL_23;
        }
        unint64_t v27 = v21 / v22 * BytesPerRowOfPlane;
        unint64_t v28 = v21 % v22;
        LOBYTE(v20) = BaseAddressOfPlane[2 * v27 + 2 * (v21 % v22)];
        runningMean = self->_runningMean;
        float v20 = (float)LODWORD(v20) - runningMean[v21];
        float v29 = -v20;
        if (v20 >= 0.0) {
          float v29 = v20;
        }
        runningStd = self->_runningStd;
        if ((float)(v29 + (float)(runningStd[v21] * -2.0)) <= 15.0) {
          goto LABEL_13;
        }
        a5[v21] = 2;
        if (v20 > 0.0) {
          char v30 = 1;
        }
        else {
          char v30 = 2;
        }
        a4[v21] = v30;
      }
LABEL_23:
      ++v21;
    }
    while (v17 != v21);
  }
  CVPixelBufferUnlockBaseAddress(a3, 1uLL);
}

- (void)_foregroundDifferencesFromPixelBuffer:(__CVBuffer *)a3 differences:(float *)a4
{
  size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
  [(HMIBackgroundEstimator *)self modelSize];
  double v9 = v8;
  [(HMIBackgroundEstimator *)self modelSize];
  double v11 = v10;
  [(HMIBackgroundEstimator *)self modelSize];
  unint64_t v13 = (unint64_t)(v11 * v12);
  CVPixelBufferLockBaseAddress(a3, 1uLL);
  BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(a3, 0);
  double v15 = CVPixelBufferGetBaseAddressOfPlane(a3, 1uLL);
  if (v13)
  {
    unint64_t v17 = 0;
    runningMean = self->_runningMean;
    runningStd = self->_runningStd;
    unint64_t v20 = (unint64_t)v9;
    do
    {
      unint64_t v21 = v17 / v20 * BytesPerRowOfPlane;
      unint64_t v22 = v21 + 2 * (v17 % v20);
      LOBYTE(v16) = BaseAddressOfPlane[2 * v21 + 2 * (v17 % v20)];
      float v23 = (float)LODWORD(v16) - runningMean[v17];
      if (v23 < 0.0) {
        float v23 = -v23;
      }
      float v24 = runningStd[v17];
      float v25 = v23 + (float)(v24 * -2.0);
      LOBYTE(v24) = v15[v22];
      float v26 = (float)LODWORD(v24) - runningMean[v13 + v17];
      if (v26 < 0.0) {
        float v26 = -v26;
      }
      float v27 = runningStd[v13 + v17];
      float v28 = v26 + (float)(v27 * -2.0);
      LOBYTE(v27) = v15[v22 + 1];
      float v29 = (float)LODWORD(v27) - runningMean[2 * v13 + v17];
      if (v29 < 0.0) {
        float v29 = -v29;
      }
      float v30 = v29 + (float)(runningStd[2 * v13 + v17] * -2.0);
      float v31 = v25 + -15.0;
      if (v31 < 0.0) {
        float v31 = 0.0;
      }
      a4[v17] = v31;
      float v32 = v28 + -6.0;
      if ((float)(v28 + -6.0) < 0.0) {
        float v32 = 0.0;
      }
      a4[v13 + v17] = v32;
      float v16 = v30 + -6.0;
      if ((float)(v30 + -6.0) < 0.0) {
        float v16 = 0.0;
      }
      a4[2 * v13 + v17++] = v16;
    }
    while (v13 != v17);
  }
  CVPixelBufferUnlockBaseAddress(a3, 1uLL);
}

- (id)_blobsFromAssignment:(unsigned __int16 *)a3 timeStamp:(id *)a4
{
  double v5 = self;
  uint64_t v101 = *MEMORY[0x263EF8340];
  {
    __asm { FMOV            V1.2D, #-1.0 }
    long long v85 = _Q1;
    long long v86 = xmmword_225F2DDC0;
    long long v87 = xmmword_225F2DDD0;
    long long v88 = xmmword_225F2DDE0;
    long long v89 = xmmword_225F2DDF0;
    long long v90 = xmmword_225F2DE00;
    __asm { FMOV            V1.2D, #1.0 }
    long long v91 = xmmword_225F2DE10;
    long long v92 = _Q1;
    __asm { FMOV            V0.2D, #-3.0 }
    long long v93 = _Q0;
    long long v94 = xmmword_225F2DE20;
    long long v95 = xmmword_225F2DE30;
    long long v96 = xmmword_225F2DE40;
    long long v97 = xmmword_225F2DE50;
    long long v98 = xmmword_225F2DE60;
    __asm { FMOV            V1.2D, #3.0 }
    long long v99 = xmmword_225F2DE70;
    long long v100 = _Q1;
    std::vector<CGPoint>::vector[abi:ne180100](-[HMIBackgroundEstimator _blobsFromAssignment:timeStamp:]::neighbors, &v85, 0x10uLL);
    double v5 = self;
  }
  [(HMIBackgroundEstimator *)v5 modelSize];
  double v7 = v6;
  [(HMIBackgroundEstimator *)v5 modelSize];
  double v9 = v8;
  v75 = [MEMORY[0x263EFF9C0] set];
  int v10 = (int)v7;
  int v11 = (int)v9;
  uint64_t v12 = ((int)v9 * (int)v7);
  if ((int)v12 >= 1)
  {
    uint64_t v13 = 0;
    unsigned __int16 v14 = 5;
    do
    {
      if (a3[v13] == 2)
      {
        __p = 0;
        v83 = 0;
        v84 = 0;
        long long v86 = 0u;
        long long v87 = 0u;
        long long v85 = 0u;
        v81.n128_f64[0] = (double)((int)v13 % v10);
        v81.n128_f64[1] = (double)((int)v13 / v10);
        double v15 = (__n128 *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)&v84, 1uLL);
        *double v15 = v81;
        float v18 = (__n128 *)__p;
        unint64_t v17 = v83;
        int v19 = v15;
        if (v83 != __p)
        {
          do
          {
            v19[-1] = v17[-1];
            --v19;
            --v17;
          }
          while (v17 != v18);
          unint64_t v17 = (__n128 *)__p;
        }
        unint64_t v20 = v15 + 1;
        __p = v19;
        v83 = v15 + 1;
        v84 = &v15[v16];
        if (v17) {
          operator delete(v17);
        }
        v83 = v20;
        std::deque<CGPoint>::push_back(&v85, &v81);
        uint64_t v77 = v13;
        a3[(int)v81.n128_f64[0] + (int)v81.n128_f64[1] * v10] = 4;
        while (*((void *)&v87 + 1))
        {
          unint64_t v21 = (double *)(*(void *)(*((void *)&v85 + 1) + (((unint64_t)v87 >> 5) & 0x7FFFFFFFFFFFFF8))
                         + 16 * v87);
          double v22 = *v21;
          double v23 = v21[1];
          *(void *)&long long v87 = v87 + 1;
          --*((void *)&v87 + 1);
          if ((unint64_t)v87 >= 0x200)
          {
            operator delete(**((void ***)&v85 + 1));
            *((void *)&v85 + 1) += 8;
            *(void *)&long long v87 = v87 - 256;
          }
          a3[(int)v22 + (int)v23 * v10] = v14;
          float v25 = (double *)-[HMIBackgroundEstimator _blobsFromAssignment:timeStamp:]::neighbors[0];
          float v24 = (double *)unk_26811D158;
          while (v25 != v24)
          {
            int v26 = (int)(v22 + (double)(int)*v25);
            if ((v26 & 0x80000000) == 0 && v26 < v10)
            {
              int v27 = (int)(v23 + (double)(int)v25[1]);
              if ((v27 & 0x80000000) == 0 && v27 < v11)
              {
                int v28 = v26 + v27 * v10;
                if (a3[v28] == 2)
                {
                  v80.n128_f64[0] = (double)v26;
                  v80.n128_f64[1] = (double)v27;
                  float v29 = v83;
                  if (v83 >= v84)
                  {
                    uint64_t v31 = ((char *)v83 - (unsigned char *)__p) >> 4;
                    unint64_t v32 = v31 + 1;
                    if ((unint64_t)(v31 + 1) >> 60) {
                      std::vector<int>::__throw_length_error[abi:ne180100]();
                    }
                    uint64_t v33 = (char *)v84 - (unsigned char *)__p;
                    if (((char *)v84 - (unsigned char *)__p) >> 3 > v32) {
                      unint64_t v32 = v33 >> 3;
                    }
                    if ((unint64_t)v33 >= 0x7FFFFFFFFFFFFFF0) {
                      unint64_t v34 = 0xFFFFFFFFFFFFFFFLL;
                    }
                    else {
                      unint64_t v34 = v32;
                    }
                    if (v34) {
                      float v35 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)&v84, v34);
                    }
                    else {
                      float v35 = 0;
                    }
                    unsigned __int16 v36 = (__n128 *)&v35[16 * v31];
                    __n128 *v36 = v80;
                    int v38 = (__n128 *)__p;
                    int v37 = v83;
                    uint64_t v39 = v36;
                    if (v83 != __p)
                    {
                      do
                      {
                        v39[-1] = v37[-1];
                        --v39;
                        --v37;
                      }
                      while (v37 != v38);
                      int v37 = (__n128 *)__p;
                    }
                    float v30 = v36 + 1;
                    __p = v39;
                    v83 = v36 + 1;
                    v84 = (__n128 *)&v35[16 * v34];
                    if (v37) {
                      operator delete(v37);
                    }
                  }
                  else
                  {
                    __n128 *v83 = v80;
                    float v30 = v29 + 1;
                  }
                  v83 = v30;
                  std::deque<CGPoint>::push_back(&v85, &v80);
                  a3[v28] = 4;
                }
              }
            }
            v25 += 2;
          }
        }
        int v40 = (double *)__p;
        if ((unint64_t)((char *)v83 - (unsigned char *)__p) >= 0x90)
        {
          if (__p == v83)
          {
            int v42 = 0;
            int v41 = 0;
            int v43 = v11 - 1;
            int v44 = v10 - 1;
          }
          else
          {
            int v41 = 0;
            int v42 = 0;
            int v43 = v11 - 1;
            int v44 = v10 - 1;
            do
            {
              double v45 = *v40;
              double v46 = v40[1];
              v40 += 2;
              if (v41 <= (int)v45) {
                int v41 = (int)v45;
              }
              if (v42 <= (int)v46) {
                int v42 = (int)v46;
              }
              if (v44 >= (int)v45) {
                int v44 = (int)v45;
              }
              if (v43 >= (int)v46) {
                int v43 = (int)v46;
              }
            }
            while (v40 != (double *)v83);
          }
          HMICGRectNormalizedFromPixel(v10, v11, (double)v44, (double)v43, (double)(v41 - v44 + 1), (double)(v42 - v43 + 1));
          double v48 = v47;
          double v50 = v49;
          double v52 = v51;
          double v54 = v53;
          double v56 = __p;
          double v55 = v83;
          [(HMIBackgroundEstimator *)self modelSize];
          double v58 = v57;
          [(HMIBackgroundEstimator *)self modelSize];
          double v60 = v59;
          CGRect v61 = [HMIVideoAnalyzerBlob alloc];
          *(float *)&double v62 = (float)(unint64_t)(((char *)v55 - v56) >> 4) / (v58 * v60);
          long long v78 = *(_OWORD *)&a4->var0;
          int64_t var3 = a4->var3;
          CGRect v63 = -[HMIVideoAnalyzerBlob initWithBoundingBox:timeStamp:blobArea:blobID:](v61, "initWithBoundingBox:timeStamp:blobArea:blobID:", &v78, v14, v48, v50, v52, v54, v62);
          [v75 addObject:v63];
        }
        std::deque<CGPoint>::~deque[abi:ne180100](&v85);
        uint64_t v13 = v77;
        if (__p)
        {
          v83 = (__n128 *)__p;
          operator delete(__p);
        }
        ++v14;
        uint64_t v12 = (v11 * v10);
      }
      ++v13;
    }
    while (v13 != v12);
  }
  uint64_t v64 = (void *)[v75 copy];

  return v64;
}

- (id)visualizeBackgroundMean
{
  return [(HMIBackgroundEstimator *)self _exportInternalStateForPixelBuffer:0 exportMode:0];
}

- (id)visualizeBackgroundStd
{
  return [(HMIBackgroundEstimator *)self _exportInternalStateForPixelBuffer:0 exportMode:1];
}

- (id)visualizeForegroundDiffForPixelBuffer:(__CVBuffer *)a3
{
  return [(HMIBackgroundEstimator *)self _exportInternalStateForPixelBuffer:a3 exportMode:2];
}

- (id)visualizeForegroundAssignment
{
  return [(HMIBackgroundEstimator *)self _exportInternalStateForPixelBuffer:0 exportMode:3];
}

- (id)_exportInternalStateForPixelBuffer:(__CVBuffer *)a3 exportMode:(unint64_t)a4
{
  long long v28 = 0uLL;
  uint64_t v29 = 0;
  [(HMIBackgroundEstimator *)self foregroundTimeStamp];
  CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x263F010E0];
  if (CMTimeCompare(&time1, &time2)) {
    [(HMIBackgroundEstimator *)self foregroundTimeStamp];
  }
  else {
    [(HMIBackgroundEstimator *)self backgroundTimeStamp];
  }
  [(HMIBackgroundEstimator *)self modelSize];
  double v8 = v7;
  [(HMIBackgroundEstimator *)self modelSize];
  double v10 = v9;
  [(HMIBackgroundEstimator *)self modelSize];
  double v12 = v11 + v11;
  [(HMIBackgroundEstimator *)self modelSize];
  unsigned __int16 v14 = +[HMIVisionUtilities createPixelBufferWithSize:pixelFormat:useIOSurface:](HMIVisionUtilities, "createPixelBufferWithSize:pixelFormat:useIOSurface:", 875704422, 0, (double)(unint64_t)v12, (double)(unint64_t)(v13 + v13));
  if (v14)
  {
    double v15 = [HMIVideoFrame alloc];
    long long v24 = v28;
    uint64_t v25 = v29;
    uint64_t v16 = [(HMIVideoFrame *)v15 initWithPixelBuffer:v14 presentationTimeStamp:&v24];
    CVPixelBufferRelease(v14);
  }
  else
  {
    uint64_t v16 = 0;
  }
  if ([(HMIBackgroundEstimator *)self runningMean]
    && [(HMIBackgroundEstimator *)self runningStd]
    && [(HMIBackgroundEstimator *)self assignment])
  {
    unint64_t v17 = (unint64_t)(v8 * v10);
    switch(a4)
    {
      case 0uLL:
        float v18 = [(HMIBackgroundEstimator *)self runningMean];
        goto LABEL_15;
      case 1uLL:
        float v18 = [(HMIBackgroundEstimator *)self runningStd];
LABEL_15:
        unint64_t v20 = v18;
        int v19 = 0;
        break;
      case 2uLL:
        int v19 = (float *)malloc_type_calloc(3 * v17, 4uLL, 0x100004052888210uLL);
        [(HMIBackgroundEstimator *)self _foregroundDifferencesFromPixelBuffer:a3 differences:v19];
        unint64_t v20 = v19;
        break;
      case 3uLL:
        int v19 = (float *)malloc_type_calloc(3 * v17, 4uLL, 0x100004052888210uLL);
        float __A = 128.0;
        vDSP_vfill(&__A, &v19[v17], 1, 2 * v17);
        if (v17)
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if ([(HMIBackgroundEstimator *)self assignment][2 * i] >= 5u) {
              v19[i] = 255.0;
            }
            if ([(HMIBackgroundEstimator *)self assignment][2 * i] == 1) {
              v19[2 * v17 + i] = 255.0;
            }
            if (![(HMIBackgroundEstimator *)self assignment][2 * i]) {
              v19[v17 + i] = 255.0;
            }
          }
        }
        unint64_t v20 = v19;
        break;
      default:
        int v19 = 0;
        unint64_t v20 = 0;
        break;
    }
    [(HMIBackgroundEstimator *)self _copyFromOutputBuffer:v20 toPixelBuffer:v14];
    if (v19) {
      free(v19);
    }
  }
  return v16;
}

- (HMIVideoAnalyzerConfiguration)configuration
{
  return (HMIVideoAnalyzerConfiguration *)objc_getProperty(self, a2, 16, 1);
}

- (NSMutableDictionary)tracks
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (NSMutableDictionary)inactiveTracks
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (unint64_t)minSampleSize
{
  return self->_minSampleSize;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)backgroundExpireInterval
{
  objc_copyStruct(retstr, &self->_backgroundExpireInterval, 24, 1, 0);
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)backgroundChangeInterval
{
  objc_copyStruct(retstr, &self->_backgroundChangeInterval, 24, 1, 0);
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)backgroundChangeResetInterval
{
  objc_copyStruct(retstr, &self->_backgroundChangeResetInterval, 24, 1, 0);
  return result;
}

- (unsigned)assignment
{
  return self->_assignment;
}

- (void)setAssignment:(unsigned __int16 *)a3
{
  self->_assignment = a3;
}

- (float)runningMean
{
  return self->_runningMean;
}

- (void)setRunningMean:(float *)a3
{
  self->_runningMean = a3;
}

- (float)runningStd
{
  return self->_runningStd;
}

- (void)setRunningStd:(float *)a3
{
  self->_runningStd = a3;
}

- (unint64_t)numImages
{
  return self->_numImages;
}

- (void)setNumImages:(unint64_t)a3
{
  self->_numImages = a3;
}

- (unint64_t)numTracks
{
  return self->_numTracks;
}

- (void)setNumTracks:(unint64_t)a3
{
  self->_numTracks = a3;
}

- (CGSize)imageSize
{
  objc_copyStruct(v4, &self->_imageSize, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.CGFloat height = v3;
  result.CGFloat width = v2;
  return result;
}

- (void)setImageSize:(CGSize)a3
{
  CGSize v3 = a3;
  objc_copyStruct(&self->_imageSize, &v3, 16, 1, 0);
}

- (CGSize)modelSize
{
  objc_copyStruct(v4, &self->_modelSize, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.CGFloat height = v3;
  result.CGFloat width = v2;
  return result;
}

- (void)setModelSize:(CGSize)a3
{
  CGSize v3 = a3;
  objc_copyStruct(&self->_modelSize, &v3, 16, 1, 0);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)foregroundTimeStamp
{
  objc_copyStruct(retstr, &self->_foregroundTimeStamp, 24, 1, 0);
  return result;
}

- (void)setForegroundTimeStamp:(id *)a3
{
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)backgroundTimeStamp
{
  objc_copyStruct(retstr, &self->_backgroundTimeStamp, 24, 1, 0);
  return result;
}

- (void)setBackgroundTimeStamp:(id *)a3
{
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)backgroundChangeTimeStamp
{
  objc_copyStruct(retstr, &self->_backgroundChangeTimeStamp, 24, 1, 0);
  return result;
}

- (void)setBackgroundChangeTimeStamp:(id *)a3
{
}

- (BOOL)adjustBrightness
{
  return self->_adjustBrightness;
}

- (void)setAdjustBrightness:(BOOL)a3
{
  self->_adjustBrightness = a3;
}

- (NSMutableArray)motionDetections
{
  return (NSMutableArray *)objc_getProperty(self, a2, 88, 1);
}

- (NSMutableArray)motionTimeStamps
{
  return (NSMutableArray *)objc_getProperty(self, a2, 96, 1);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)motionValidInterval
{
  objc_copyStruct(retstr, &self->_motionValidInterval, 24, 1, 0);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_motionTimeStamps, 0);
  objc_storeStrong((id *)&self->_motionDetections, 0);
  objc_storeStrong((id *)&self->_inactiveTracks, 0);
  objc_storeStrong((id *)&self->_tracks, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end