@interface AutoLoopStabilizer
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)GetPreciseReferenceTimeFromHomographies:(SEL)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)firstFrameTimeAfterDrop;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastFrameTimeAfterDrop;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)maxAllowedTrimTimeEnd;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)maxAllowedTrimTimeStart;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)minimumFrameDuration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)refFrameTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)trimLength;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)trimStart;
- ($4C6D1E162277694FB76656457146213A)determinePreciseTimeRange;
- (AVAsset)movieAssetIn;
- (AutoLoopStabilizer)init;
- (BOOL)CheckForTripodOKInHomographies:(const void *)a3 firstIndex:(unint64_t)a4 lastIndex:(unint64_t)a5 refIndex:(unint64_t)a6 cropRectOut:(CGRect *)a7 minConfidence:(float)a8 confidenceOut:(float *)a9;
- (BOOL)CropRectValid:(const CGRect *)a3;
- (BOOL)ICShouldBeCanceled;
- (BOOL)didDrop;
- (BOOL)disableGPUStabilization;
- (BOOL)doLoopClosureCorrection;
- (BOOL)drawFeaturesFlag;
- (BOOL)getNaturalTimeScaleForVideoTrackInAsset;
- (BOOL)onlyProcessForHighQualityTripod;
- (BOOL)optimizeProcessingForMemory;
- (BOOL)tripodOKWithTrimming:(const void *)a3 frameTimes:(const void *)a4 minConfidence:(float)a5;
- (BOOL)updateStabilizerStatus;
- (BOOL)useLimitedTime;
- (CGRect)cropRect;
- (CGSize)inputMovieDimensions;
- (NSArray)presentationTimesOfFramesToSkip;
- (NSArray)skipFrameTimes;
- (NSDictionary)featuresDictionary;
- (NSString)currentStatusString;
- (NSURL)statsFileOutURL;
- (float)CropRatio:(const CGRect *)a3;
- (float)alwaysAcceptedTripodCropRatio;
- (float)confidenceHighQualityThreshold;
- (float)cropRatioMinimum;
- (float)lastTripodQuality;
- (float)minAllowedRemainingTripodCrop;
- (float)minConfidenceForTripodAccept;
- (float)minimumHighQualityConfidenceValue;
- (float)necessaryCropGainFractionPerDroppedFrame;
- (float)progressValue;
- (id)getVideoTrack;
- (id)statusUpdateBlock;
- (int)FindAcceptableTripodSegmentForInput:(const void *)a3 frameTimes:(const void *)a4;
- (int)analysisResult;
- (int)analyzeForAutoloopWithDirect:(BOOL)a3 toAnalysisOutput:(void *)a4;
- (int)canceledAnalysis;
- (int)lastStabilizationResult;
- (int)naturalTimeScale;
- (int)processStabilizationAnalysis:(void *)a3 forcePassThru:(BOOL)a4 forceSmoothing:(BOOL)a5 forceSequentialTripod:(BOOL)a6;
- (int)processStabilizationAnalysisForCinematicL1:(void *)a3;
- (int64_t)droppedEndFrameCount;
- (int64_t)droppedStartFrameCount;
- (unint64_t)FindFrameIndexForReferenceTimeInHomographies:(const void *)a3;
- (unint64_t)frameSearchLength;
- (void)ICReportProgress:(float)a3;
- (void)dealloc;
- (void)icCorrectionResultRef;
- (void)setAlwaysAcceptedTripodCropRatio:(float)a3;
- (void)setCanceledAnalysis:(int)a3;
- (void)setConfidenceHighQualityThreshold:(float)a3;
- (void)setCropRatioMinimum:(float)a3;
- (void)setCurrentStatusString:(id)a3;
- (void)setDidDrop:(BOOL)a3;
- (void)setDisableGPUStabilization:(BOOL)a3;
- (void)setDoLoopClosureCorrection:(BOOL)a3;
- (void)setDrawFeaturesFlag:(BOOL)a3;
- (void)setDroppedEndFrameCount:(int64_t)a3;
- (void)setDroppedStartFrameCount:(int64_t)a3;
- (void)setFeaturesDictionary:(id)a3;
- (void)setFirstFrameTimeAfterDrop:(id *)a3;
- (void)setFrameSearchLength:(unint64_t)a3;
- (void)setLastFrameTimeAfterDrop:(id *)a3;
- (void)setMaxAllowedTrimTimeEnd:(id *)a3;
- (void)setMaxAllowedTrimTimeStart:(id *)a3;
- (void)setMinAllowedRemainingTripodCrop:(float)a3;
- (void)setMinConfidenceForTripodAccept:(float)a3;
- (void)setMinimumFrameDuration:(id *)a3;
- (void)setMinimumHighQualityConfidenceValue:(float)a3;
- (void)setMovieAssetIn:(id)a3;
- (void)setNaturalTimeScale:(int)a3;
- (void)setNecessaryCropGainFractionPerDroppedFrame:(float)a3;
- (void)setOnlyProcessForHighQualityTripod:(BOOL)a3;
- (void)setOptimizeProcessingForMemory:(BOOL)a3;
- (void)setPresentationTimesOfFramesToSkip:(id)a3;
- (void)setProgressValue:(float)a3;
- (void)setRefFrameTime:(id *)a3;
- (void)setSkipFrameTimes:(id)a3;
- (void)setStatsFileOutURL:(id)a3;
- (void)setStatusUpdateBlock:(id)a3;
- (void)setTrimLength:(id *)a3;
- (void)setTrimStart:(id *)a3;
- (void)setUseLimitedTime:(BOOL)a3;
@end

@implementation AutoLoopStabilizer

- (AutoLoopStabilizer)init
{
  v19.receiver = self;
  v19.super_class = (Class)AutoLoopStabilizer;
  v2 = [(AutoLoopStabilizer *)&v19 init];
  v3 = v2;
  if (v2)
  {
    *(void *)(v2 + 60) = 4294967294;
    v4 = (long long *)MEMORY[0x1E4F1F9F0];
    long long v17 = *MEMORY[0x1E4F1F9F0];
    uint64_t v18 = *(void *)(MEMORY[0x1E4F1F9F0] + 16);
    [v2 setRefFrameTime:&v17];
    long long v15 = *MEMORY[0x1E4F1F9F8];
    uint64_t v16 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    [v3 setMinimumFrameDuration:&v15];
    v5 = (long long *)MEMORY[0x1E4F1FA48];
    long long v13 = *MEMORY[0x1E4F1FA48];
    uint64_t v14 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    [v3 setMaxAllowedTrimTimeStart:&v13];
    long long v11 = *v5;
    uint64_t v12 = *((void *)v5 + 2);
    [v3 setMaxAllowedTrimTimeEnd:&v11];
    *((_DWORD *)v3 + 14) = -8888;
    v3[10] = 1;
    *(_OWORD *)(v3 + 24) = xmmword_1DD3E83A0;
    *((void *)v3 + 5) = 0x3F59999A3F266666;
    [v3 setUseLimitedTime:0];
    long long v9 = *v4;
    uint64_t v10 = *((void *)v4 + 2);
    [v3 setTrimStart:&v9];
    long long v7 = *v4;
    uint64_t v8 = *((void *)v4 + 2);
    [v3 setTrimLength:&v7];
    [v3 setDisableGPUStabilization:0];
    [v3 setOptimizeProcessingForMemory:0];
  }
  return (AutoLoopStabilizer *)v3;
}

- (void)dealloc
{
  ICDestroyResult();
  self->icCorrectionResultRef = 0;
  v3.receiver = self;
  v3.super_class = (Class)AutoLoopStabilizer;
  [(AutoLoopStabilizer *)&v3 dealloc];
}

- (unint64_t)FindFrameIndexForReferenceTimeInHomographies:(const void *)a3
{
  CMTime time1 = (CMTime)self->refFrameTime;
  CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F0];
  int32_t v5 = CMTimeCompare(&time1, &time2);
  unint64_t v6 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 3);
  if (!v5) {
    return v6 >> 1;
  }
  p_refFrameTime = &self->refFrameTime;
  unint64_t v8 = -1431655765 * ((uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 3);
  uint64_t v9 = 24 * v6 - 24;
  while ((int)v8 >= 1)
  {
    --v8;
    uint64_t v10 = *(void *)a3 + v9;
    CMTimeEpoch v11 = *(void *)(v10 + 16);
    *(_OWORD *)&v14.value = *(_OWORD *)v10;
    v14.epoch = v11;
    $95D729B680665BEAEFA1D6FCA8238556 v13 = *p_refFrameTime;
    v9 -= 24;
    if (CMTimeCompare(&v14, (CMTime *)&v13) <= 0) {
      return v8;
    }
  }
  return 0;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)GetPreciseReferenceTimeFromHomographies:(SEL)a3
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(void *)&MEMORY[0x1E4F1F9F0];
  if (*((void *)a4 + 1) != *(void *)a4)
  {
    self = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[$3CC8671D27C23BF42ADDB32F2B5E48AE FindFrameIndexForReferenceTimeInHomographies:](self, "FindFrameIndexForReferenceTimeInHomographies:");
    uint64_t v6 = *(void *)a4 + 24 * (void)self;
    *(_OWORD *)&retstr->var0 = *(_OWORD *)v6;
    retstr->var3 = *(void *)(v6 + 16);
  }
  return self;
}

- (float)CropRatio:(const CGRect *)a3
{
  float32x2_t v3 = vcvt_f32_f64(vdivq_f64((float64x2_t)a3->size, (float64x2_t)self->inputMovieDimensions));
  if (v3.f32[0] >= v3.f32[1]) {
    v3.f32[0] = v3.f32[1];
  }
  return v3.f32[0];
}

- (BOOL)CropRectValid:(const CGRect *)a3
{
  double width = a3->size.width;
  double height = a3->size.height;
  if (width < 1.0 || height < 1.0) {
    return 0;
  }
  CGFloat x = a3->origin.x;
  CGFloat y = a3->origin.y;
  v9.size.double width = self->inputMovieDimensions.width;
  v9.size.double height = self->inputMovieDimensions.height;
  v9.origin.CGFloat x = 0.0;
  v9.origin.CGFloat y = 0.0;
  return CGRectIntersectsRect(*(CGRect *)(&width - 2), v9);
}

- (id)getVideoTrack
{
  v2 = [(AutoLoopStabilizer *)self movieAssetIn];
  float32x2_t v3 = [v2 tracksWithMediaType:*MEMORY[0x1E4F15C18]];

  if (v3)
  {
    v4 = [v3 objectAtIndex:0];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)getNaturalTimeScaleForVideoTrackInAsset
{
  float32x2_t v3 = [(AutoLoopStabilizer *)self getVideoTrack];
  v4 = v3;
  if (v3)
  {
    -[AutoLoopStabilizer setNaturalTimeScale:](self, "setNaturalTimeScale:", [v3 naturalTimeScale]);
    [v4 minFrameDuration];
    long long v6 = v8;
    uint64_t v7 = v9;
    [(AutoLoopStabilizer *)self setMinimumFrameDuration:&v6];
  }

  return v4 != 0;
}

- ($4C6D1E162277694FB76656457146213A)determinePreciseTimeRange
{
  uint64_t v5 = MEMORY[0x1E4F1F9F0];
  long long v6 = *MEMORY[0x1E4F1F9F0];
  *(_OWORD *)&retstr->var0.$3CC8671D27C23BF42ADDB32F2B5E48AE var0 = *MEMORY[0x1E4F1F9F0];
  int64_t v7 = *(void *)(v5 + 16);
  retstr->var0.var3 = v7;
  *(_OWORD *)&retstr->var1.$3CC8671D27C23BF42ADDB32F2B5E48AE var0 = v6;
  retstr->var1.var3 = v7;
  long long v8 = [(AutoLoopStabilizer *)self getVideoTrack];
  uint64_t v9 = v8;
  if (v8)
  {
    [v8 timeRange];
    long long v10 = *(_OWORD *)&v29[16];
    long long v31 = *(_OWORD *)v29;
    *(_OWORD *)v32 = *(_OWORD *)&v29[16];
    long long v11 = v30;
    *(_OWORD *)&v32[16] = v30;
    *(_OWORD *)&retstr->var0.$3CC8671D27C23BF42ADDB32F2B5E48AE var0 = *(_OWORD *)v29;
    *(_OWORD *)&retstr->var0.var3 = v10;
    *(_OWORD *)&retstr->var1.var1 = v11;
    if ([(AutoLoopStabilizer *)self useLimitedTime])
    {
      memset(v29, 0, 24);
      *(_OWORD *)&lhs.value = v31;
      lhs.CMTimeEpoch epoch = *(void *)v32;
      CMTime rhs = *(CMTime *)&v32[8];
      CMTimeAdd((CMTime *)v29, &lhs, &rhs);
      [(AutoLoopStabilizer *)self trimStart];
      *(_OWORD *)&time2.value = v31;
      time2.CMTimeEpoch epoch = *(void *)v32;
      if (CMTimeCompare(&time1, &time2) < 1)
      {
        *(_OWORD *)&retstr->var0.$3CC8671D27C23BF42ADDB32F2B5E48AE var0 = v31;
        CMTimeEpoch epoch = *(void *)v32;
      }
      else
      {
        [(AutoLoopStabilizer *)self trimStart];
        *(_OWORD *)&retstr->var0.$3CC8671D27C23BF42ADDB32F2B5E48AE var0 = *(_OWORD *)&v24.value;
        CMTimeEpoch epoch = v24.epoch;
      }
      retstr->var0.var3 = epoch;
      memset(&v24, 0, sizeof(v24));
      *(_OWORD *)&v23.value = *(_OWORD *)&retstr->var0.var0;
      v23.CMTimeEpoch epoch = epoch;
      [(AutoLoopStabilizer *)self trimLength];
      CMTimeAdd(&v24, &v23, &v22);
      CMTime v20 = v24;
      CMTime v19 = *(CMTime *)v29;
      int32_t v13 = CMTimeCompare(&v20, &v19);
      CMTime v14 = &v24;
      if (v13 > 0) {
        CMTime v14 = (CMTime *)v29;
      }
      CMTime v21 = *v14;
      CMTime v17 = v21;
      $3CC8671D27C23BF42ADDB32F2B5E48AE var0 = retstr->var0;
      CMTimeSubtract(&v18, &v17, (CMTime *)&var0);
      retstr->var1 = ($3CC8671D27C23BF42ADDB32F2B5E48AE)v18;
    }
  }

  return result;
}

- (BOOL)CheckForTripodOKInHomographies:(const void *)a3 firstIndex:(unint64_t)a4 lastIndex:(unint64_t)a5 refIndex:(unint64_t)a6 cropRectOut:(CGRect *)a7 minConfidence:(float)a8 confidenceOut:(float *)a9
{
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v15 = [NSNumber numberWithInt:a4];
  [v14 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F6F3C8]];

  uint64_t v16 = [NSNumber numberWithInt:a5];
  [v14 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4F6F3F8]];

  CMTime v17 = [NSNumber numberWithInt:a6];
  [v14 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F6F408]];

  CMTime v18 = [NSNumber numberWithBool:1];
  CMTime v19 = (void *)MEMORY[0x1E4F6F410];
  [v14 setObject:v18 forKeyedSubscript:*MEMORY[0x1E4F6F410]];

  char CanDoTripod = ICCalcCanDoTripod();
  id v21 = 0;
  CMTime v22 = [v21 objectForKeyedSubscript:*v19];
  [v22 floatValue];
  float v24 = v23;

  if (a9) {
    *a9 = v24;
  }
  if (v24 >= a8) {
    BOOL v25 = CanDoTripod;
  }
  else {
    BOOL v25 = 0;
  }

  return v25;
}

- (BOOL)tripodOKWithTrimming:(const void *)a3 frameTimes:(const void *)a4 minConfidence:(float)a5
{
  if (!a3)
  {
    LOBYTE(v11) = 0;
    return v11;
  }
  if (*(void *)a4 == *((void *)a4 + 1)) {
    goto LABEL_31;
  }
  float v67 = 0.0;
  [(AutoLoopStabilizer *)self setDidDrop:0];
  [(AutoLoopStabilizer *)self maxAllowedTrimTimeStart];
  uint64_t v9 = (CMTime *)MEMORY[0x1E4F1FA48];
  CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
  if (CMTimeCompare(&time1, &time2) <= 0)
  {
    [(AutoLoopStabilizer *)self maxAllowedTrimTimeEnd];
    CMTime v63 = *v9;
    BOOL v10 = CMTimeCompare(&v64, &v63) > 0;
  }
  else
  {
    BOOL v10 = 1;
  }
  self->droppedStartFrameCount = 0;
  self->droppedEndFrameCount = 0;
  unint64_t v12 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a4 + 1) - *(void *)a4) >> 3) - 1;
  unint64_t v13 = [(AutoLoopStabilizer *)self FindFrameIndexForReferenceTimeInHomographies:a4];
  *(float *)&double v14 = a5;
  if ([(AutoLoopStabilizer *)self CheckForTripodOKInHomographies:a3 firstIndex:0 lastIndex:v12 refIndex:v13 cropRectOut:v68 minConfidence:&v67 confidenceOut:v14])
  {
    [(AutoLoopStabilizer *)self CropRatio:v68];
    float v15 = v67;
LABEL_9:
    self->_lastTripodQualitCGFloat y = v15;
    if (v15 >= a5)
    {
      LOBYTE(v11) = 1;
    }
    else
    {
      LOBYTE(v11) = 0;
      self->_lastTripodQualitCGFloat y = 0.0;
    }
    return v11;
  }
  if (!v10)
  {
LABEL_31:
    LOBYTE(v11) = 0;
    return v11;
  }
  float v62 = 0.0;
  CMTime v61 = *(CMTime *)(*((void *)a4 + 1) - 24);
  memset(&v60, 0, sizeof(v60));
  CMTime lhs = v61;
  [(AutoLoopStabilizer *)self maxAllowedTrimTimeEnd];
  CMTimeSubtract(&v60, &lhs, &rhs);
  uint64_t v16 = (*((void *)a4 + 1) - *(void *)a4) / 24;
  uint64_t v17 = 24 * v16 - 48;
  while (1)
  {
    uint64_t v18 = v16;
    CMTime v19 = *(CMTime **)a4;
    if (v18 < 2) {
      break;
    }
    CMTime v57 = v60;
    CMTime v20 = (char *)v19 + v17;
    CMTimeEpoch v21 = *((void *)v20 + 2);
    *(_OWORD *)&v56.value = *(_OWORD *)v20;
    v56.CMTimeEpoch epoch = v21;
    int32_t v22 = CMTimeCompare(&v57, &v56);
    v17 -= 24;
    uint64_t v16 = v18 - 1;
    if ((v22 & 0x80000000) == 0)
    {
      CMTime v19 = *(CMTime **)a4;
      break;
    }
  }
  CMTime v55 = *v19;
  memset(&v54, 0, sizeof(v54));
  CMTime v53 = v55;
  [(AutoLoopStabilizer *)self maxAllowedTrimTimeStart];
  CMTimeAdd(&v54, &v53, &v52);
  uint64_t v24 = 0;
  unint64_t v25 = v18 - 1;
  int64_t v26 = (v18 - 1) & ~((v18 - 1) >> 63);
  uint64_t v27 = 24;
  while (v26 != v24)
  {
    CMTime v51 = v54;
    ++v24;
    uint64_t v28 = *(void *)a4 + v27;
    CMTimeEpoch v29 = *(void *)(v28 + 16);
    *(_OWORD *)&v50.value = *(_OWORD *)v28;
    v50.CMTimeEpoch epoch = v29;
    v27 += 24;
    if (CMTimeCompare(&v51, &v50) <= 0)
    {
      int64_t v26 = v24 - 1;
      break;
    }
  }
  if (v26 >= v13) {
    int64_t v26 = v13;
  }
  if (v25 <= v13) {
    unint64_t v30 = v13;
  }
  else {
    unint64_t v30 = v25;
  }
  *(float *)&double v23 = a5;
  BOOL v11 = [(AutoLoopStabilizer *)self CheckForTripodOKInHomographies:a3 firstIndex:v26 lastIndex:v30 refIndex:v13 cropRectOut:v68 minConfidence:&v62 confidenceOut:v23];
  if (v11)
  {
    float v15 = v62;
    float v49 = 0.0;
    if (v26)
    {
      *(float *)&double v31 = a5;
      if ([(AutoLoopStabilizer *)self CheckForTripodOKInHomographies:a3 firstIndex:v26 - 1 lastIndex:v30 refIndex:v13 cropRectOut:v68 minConfidence:&v49 confidenceOut:v31])
      {
        while (1)
        {
          float v15 = v49;
          int64_t v32 = v26 - 2;
          if (v26 < 2) {
            break;
          }
          *(float *)&double v31 = a5;
          --v26;
          if (![(AutoLoopStabilizer *)self CheckForTripodOKInHomographies:a3 firstIndex:v32 lastIndex:v30 refIndex:v13 cropRectOut:v68 minConfidence:&v49 confidenceOut:v31])goto LABEL_35; {
        }
          }
        int64_t v26 = 0;
      }
    }
LABEL_35:
    v33 = *(CMTime **)a4;
    unint64_t v34 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a4 + 1) - *(void *)a4) >> 3);
    if (v30 < v34 - 1)
    {
      *(float *)&double v31 = a5;
      BOOL v35 = [(AutoLoopStabilizer *)self CheckForTripodOKInHomographies:a3 firstIndex:v26 lastIndex:v30 + 1 refIndex:v13 cropRectOut:v68 minConfidence:&v49 confidenceOut:v31];
      v33 = *(CMTime **)a4;
      uint64_t v37 = *((void *)a4 + 1);
      if (v35)
      {
        if (v13 <= v25) {
          unint64_t v38 = v25;
        }
        else {
          unint64_t v38 = v13;
        }
        while (1)
        {
          unint64_t v30 = v38 + 1;
          float v15 = v49;
          unint64_t v34 = 0xAAAAAAAAAAAAAAABLL * ((v37 - (uint64_t)v33) >> 3);
          if (v38 + 1 >= v34 - 1) {
            break;
          }
          *(float *)&double v36 = a5;
          BOOL v39 = [(AutoLoopStabilizer *)self CheckForTripodOKInHomographies:a3 firstIndex:v26 lastIndex:v38 + 2 refIndex:v13 cropRectOut:v68 minConfidence:&v49 confidenceOut:v36];
          v33 = *(CMTime **)a4;
          uint64_t v37 = *((void *)a4 + 1);
          unint64_t v38 = v30;
          if (!v39) {
            goto LABEL_42;
          }
        }
      }
      else
      {
LABEL_42:
        unint64_t v34 = 0xAAAAAAAAAAAAAAABLL * ((v37 - (uint64_t)v33) >> 3);
      }
    }
    self->droppedStartFrameCount = v26;
    self->droppedEndFrameCount = v34 + ~v30;
    v40 = &v33[v26];
    long long v41 = *(_OWORD *)&v40->value;
    CMTimeEpoch epoch = v40->epoch;
    long long v47 = v41;
    [(AutoLoopStabilizer *)self setFirstFrameTimeAfterDrop:&v47];
    uint64_t v42 = *(void *)a4 + 24 * v30;
    uint64_t v43 = *(void *)(v42 + 16);
    long long v45 = *(_OWORD *)v42;
    uint64_t v46 = v43;
    [(AutoLoopStabilizer *)self setLastFrameTimeAfterDrop:&v45];
    [(AutoLoopStabilizer *)self setDidDrop:1];
    goto LABEL_9;
  }
  return v11;
}

- (BOOL)updateStabilizerStatus
{
  statusUpdateBlock = (uint64_t (**)(float))self->_statusUpdateBlock;
  if (statusUpdateBlock) {
    return statusUpdateBlock[2](self->progressValue);
  }
  else {
    return 1;
  }
}

- (void)ICReportProgress:(float)a3
{
  if (![(AutoLoopStabilizer *)self updateStabilizerStatus]) {
    self->canceledAnalysis = 1;
  }
}

- (BOOL)ICShouldBeCanceled
{
  return self->canceledAnalysis != 0;
}

- (int)analyzeForAutoloopWithDirect:(BOOL)a3 toAnalysisOutput:(void *)a4
{
  if (a3) {
    NSLog(&cfstr_ErrorDodirectt.isa, a2);
  }
  self->canceledAnalysis = 0;
  long long v6 = (void *)MEMORY[0x1E01B4410](self, a2);
  int64_t v7 = [(AutoLoopStabilizer *)self statsFileOutURL];

  if (v7)
  {
    long long v8 = [(AutoLoopStabilizer *)self statsFileOutURL];
    id v9 = [v8 path];
    [v9 cStringUsingEncoding:4];
  }
  [(AutoLoopStabilizer *)self getNaturalTimeScaleForVideoTrackInAsset];
  memset(v66, 0, sizeof(v66));
  long long v65 = 0u;
  [(AutoLoopStabilizer *)self determinePreciseTimeRange];
  currentStatusString = self->currentStatusString;
  self->currentStatusString = (NSString *)@"Stabilizing: sequential analyze";

  self->canceledAnalysis = ![(AutoLoopStabilizer *)self updateStabilizerStatus];
  if (self->canceledAnalysis)
  {
    BOOL v11 = 0;
    int v12 = -8888;
  }
  else
  {
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    double v14 = objc_msgSend(NSNumber, "numberWithBool:", -[AutoLoopStabilizer disableGPUStabilization](self, "disableGPUStabilization"));
    [v13 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F6F330]];

    float v15 = objc_msgSend(NSNumber, "numberWithBool:", -[AutoLoopStabilizer optimizeProcessingForMemory](self, "optimizeProcessingForMemory"));
    [v13 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F6F378]];

    if ((BYTE12(v65) & 1) != 0
      && (BYTE4(v66[1]) & 1) != 0
      && !*((void *)&v66[1] + 1)
      && (*((void *)&v66[0] + 1) & 0x8000000000000000) == 0)
    {
      long long v63 = v65;
      uint64_t v64 = *(void *)&v66[0];
      uint64_t v16 = [MEMORY[0x1E4F29238] valueWithCMTime:&v63];
      [v13 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4F6F3B8]];

      long long v61 = *(_OWORD *)((char *)v66 + 8);
      uint64_t v62 = *((void *)&v66[1] + 1);
      uint64_t v17 = [MEMORY[0x1E4F29238] valueWithCMTime:&v61];
      [v13 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F6F3B0]];
    }
    if (self->doLoopClosureCorrection)
    {
      long long v56 = v65;
      *(_OWORD *)CMTime v57 = v66[0];
      *(_OWORD *)&v57[16] = v66[1];
      int32_t v18 = [(AutoLoopStabilizer *)self naturalTimeScale];
      [(AutoLoopStabilizer *)self minimumFrameDuration];
      [(AutoLoopStabilizer *)self maxAllowedTrimTimeStart];
      [(AutoLoopStabilizer *)self maxAllowedTrimTimeEnd];
      memset(&v105, 0, sizeof(v105));
      lhs.CMTimeEpoch epoch = *(void *)v57;
      *(_OWORD *)&lhs.value = v56;
      CMTime rhs = *(CMTime *)&v57[8];
      CMTimeAdd(&v105, &lhs, &rhs);
      memset(&v102, 0, sizeof(v102));
      CMTimeMakeWithSeconds(&v102, 1.0, v18);
      memset(&v101, 0, sizeof(v101));
      CMTime time1 = v102;
      CMTime time = v55;
      CMTimeMultiply(&time2, &time, 15);
      CMTimeMaximum(&v101, &time1, &time2);
      *(_OWORD *)&v97.value = v56;
      v97.CMTimeEpoch epoch = *(void *)v57;
      CMTime v95 = v55;
      CMTimeMultiply(&v96, &v95, 2);
      CMTimeAdd(&v107, &v97, &v96);
      CMTime v94 = v105;
      CMTime v92 = v55;
      CMTimeMultiply(&v93, &v92, 3);
      CMTimeSubtract(&v106, &v94, &v93);
      __p = 0;
      v59 = 0;
      CMTime v60 = 0;
      CMTime v91 = v107;
      CMTime v90 = v106;
      if (CMTimeCompare(&v91, &v90) < 0)
      {
        CMTime v88 = v106;
        CMTime v87 = v107;
        CMTimeSubtract(&v89, &v88, &v87);
        CMTime v86 = v101;
        if ((CMTimeCompare(&v89, &v86) & 0x80000000) == 0)
        {
          CMTime start = v107;
          CMTime v82 = v106;
          CMTime v81 = v107;
          CMTimeSubtract(&duration, &v82, &v81);
          CMTimeRangeMake(&v85, &start, &duration);
          unint64_t v19 = 0xAAAAAAAAAAAAAAABLL * ((v59 - (unsigned char *)__p) >> 4) + 1;
          if (v19 > 0x555555555555555) {
            sub_1DD3A9B50();
          }
          if (0x5555555555555556 * ((v60 - (unsigned char *)__p) >> 4) > v19) {
            unint64_t v19 = 0x5555555555555556 * ((v60 - (unsigned char *)__p) >> 4);
          }
          if (0xAAAAAAAAAAAAAAABLL * ((v60 - (unsigned char *)__p) >> 4) >= 0x2AAAAAAAAAAAAAALL) {
            unint64_t v20 = 0x555555555555555;
          }
          else {
            unint64_t v20 = v19;
          }
          if (v20) {
            CMTimeEpoch v21 = (char *)sub_1DD3AC17C((uint64_t)&v60, v20);
          }
          else {
            CMTimeEpoch v21 = 0;
          }
          int32_t v22 = &v21[16 * ((v59 - (unsigned char *)__p) >> 4)];
          long long v23 = *(_OWORD *)&v85.start.value;
          long long v24 = *(_OWORD *)&v85.duration.timescale;
          *((_OWORD *)v22 + 1) = *(_OWORD *)&v85.start.epoch;
          *((_OWORD *)v22 + 2) = v24;
          *(_OWORD *)int32_t v22 = v23;
          __p = v22;
          CMTime v60 = &v21[48 * v20];
          v59 = v22 + 48;
        }
      }
      *(_OWORD *)&v80.value = v56;
      v80.CMTimeEpoch epoch = *(void *)v57;
      CMTime v79 = v54;
      CMTimeAdd(&v85.start, &v80, &v79);
      CMTime v107 = v85.start;
      CMTime v78 = v105;
      CMTime v77 = v53;
      CMTimeSubtract(&v85.start, &v78, &v77);
      CMTime v106 = v85.start;
      CMTime v76 = v107;
      CMTime v75 = v85.start;
      if (CMTimeCompare(&v76, &v75) < 0)
      {
        CMTime v73 = v106;
        CMTime v72 = v107;
        CMTimeSubtract(&v74, &v73, &v72);
        CMTime v71 = v101;
        if ((CMTimeCompare(&v74, &v71) & 0x80000000) == 0)
        {
          CMTime v70 = v107;
          CMTime v68 = v106;
          CMTime v67 = v107;
          CMTimeSubtract(&v69, &v68, &v67);
          CMTimeRangeMake(&v85, &v70, &v69);
          unint64_t v25 = v59;
          if (v59 >= v60)
          {
            CMTimeEpoch v29 = (char *)__p;
            unint64_t v30 = 0xAAAAAAAAAAAAAAABLL * ((v59 - (unsigned char *)__p) >> 4) + 1;
            if (v30 > 0x555555555555555) {
              sub_1DD3A9B50();
            }
            if (0x5555555555555556 * ((v60 - (unsigned char *)__p) >> 4) > v30) {
              unint64_t v30 = 0x5555555555555556 * ((v60 - (unsigned char *)__p) >> 4);
            }
            if (0xAAAAAAAAAAAAAAABLL * ((v60 - (unsigned char *)__p) >> 4) >= 0x2AAAAAAAAAAAAAALL) {
              unint64_t v31 = 0x555555555555555;
            }
            else {
              unint64_t v31 = v30;
            }
            if (v31)
            {
              int64_t v32 = (char *)sub_1DD3AC17C((uint64_t)&v60, v31);
              CMTimeEpoch v29 = (char *)__p;
              unint64_t v25 = v59;
            }
            else
            {
              int64_t v32 = 0;
            }
            v33 = &v32[16 * ((v59 - (unsigned char *)__p) >> 4)];
            long long v34 = *(_OWORD *)&v85.start.value;
            long long v35 = *(_OWORD *)&v85.duration.timescale;
            *((_OWORD *)v33 + 1) = *(_OWORD *)&v85.start.epoch;
            *((_OWORD *)v33 + 2) = v35;
            double v36 = &v32[48 * v31];
            *(_OWORD *)v33 = v34;
            uint64_t v28 = v33 + 48;
            if (v25 == v29)
            {
              BOOL v39 = v33;
            }
            else
            {
              do
              {
                long long v37 = *((_OWORD *)v25 - 3);
                long long v38 = *((_OWORD *)v25 - 1);
                BOOL v39 = v33 - 48;
                *((_OWORD *)v33 - 2) = *((_OWORD *)v25 - 2);
                *((_OWORD *)v33 - 1) = v38;
                *((_OWORD *)v33 - 3) = v37;
                v25 -= 48;
                v33 -= 48;
              }
              while (v25 != v29);
            }
            __p = v39;
            v59 = v28;
            CMTime v60 = v36;
            if (v29) {
              operator delete(v29);
            }
          }
          else
          {
            long long v26 = *(_OWORD *)&v85.start.value;
            long long v27 = *(_OWORD *)&v85.duration.timescale;
            *((_OWORD *)v59 + 1) = *(_OWORD *)&v85.start.epoch;
            *((_OWORD *)v25 + 2) = v27;
            *(_OWORD *)unint64_t v25 = v26;
            uint64_t v28 = v25 + 48;
          }
          v59 = v28;
        }
      }
      v40 = (char *)__p;
      if (__p != v59)
      {
        id v41 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        uint64_t v42 = (char *)__p;
        uint64_t v43 = v59;
        do
        {
          long long v45 = *((_OWORD *)v42 + 1);
          long long v44 = *((_OWORD *)v42 + 2);
          v52[0] = *(_OWORD *)v42;
          v52[1] = v45;
          v52[2] = v44;
          uint64_t v46 = [MEMORY[0x1E4F29238] valueWithCMTimeRange:v52];
          [v41 addObject:v46];

          v42 += 48;
        }
        while (v42 != v43);
        [v13 setObject:v41 forKeyedSubscript:*MEMORY[0x1E4F6F370]];

        v40 = (char *)__p;
      }
      if (v40)
      {
        v59 = v40;
        operator delete(v40);
      }
    }
    LODWORD(v85.start.value) = 0;
    long long v47 = [(AutoLoopStabilizer *)self movieAssetIn];
    BOOL v11 = (void *)ICAnalyzeInputMotion();

    int v12 = 2 * (LODWORD(v85.start.value) == 0);
  }
  if (self->canceledAnalysis) {
    int v48 = -1;
  }
  else {
    int v48 = v12;
  }
  if ((v48 - 1) > 0xFFFFFFFD)
  {
    ICDestroyResult();
  }
  else
  {
    float v49 = ICGetResultStats();
    CMTime v50 = [v49 objectForKeyedSubscript:*MEMORY[0x1E4F6F3A8]];
    [v50 getValue:&self->inputMovieDimensions size:16];
    *a4 = v11;
  }
  self->_analysisResult = v48;
  return v48;
}

- (int)FindAcceptableTripodSegmentForInput:(const void *)a3 frameTimes:(const void *)a4
{
  *(float *)&double v4 = self->confidenceHighQualityThreshold;
  if (-[AutoLoopStabilizer tripodOKWithTrimming:frameTimes:minConfidence:](self, "tripodOKWithTrimming:frameTimes:minConfidence:", v4))
  {
    return 1;
  }
  if (self->onlyProcessForHighQualityTripod) {
    return -3;
  }
  *(float *)&double v8 = self->minConfidenceForTripodAccept;
  if (![(AutoLoopStabilizer *)self tripodOKWithTrimming:a3 frameTimes:a4 minConfidence:v8])return -3; {
  if (self->_lastTripodQuality >= self->minimumHighQualityConfidenceValue)
  }
    return 1;
  return 2;
}

- (int)processStabilizationAnalysis:(void *)a3 forcePassThru:(BOOL)a4 forceSmoothing:(BOOL)a5 forceSequentialTripod:(BOOL)a6
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 0;
  }
  BOOL v10 = self;
  featuresDictionarCGFloat y = self->featuresDictionary;
  self->featuresDictionarCGFloat y = 0;

  v10->_lastTripodQualitCGFloat y = 0.0;
  ICDestroyResult();
  v10->icCorrectionResultRef = 0;
  long long v63 = v10;
  if (!a4)
  {
    uint64_t v62 = ICGetResultFramePresentationTimes();
    __p = 0;
    CMTime v70 = 0;
    CMTime v71 = 0;
    sub_1DD3ABBB0(&__p, [v62 count]);
    BOOL v60 = a6;
    char v61 = a5;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    id v14 = v62;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v65 objects:v72 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v66;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v66 != v16) {
            objc_enumerationMutation(v14);
          }
          CMTimeMakeFromDictionary(&v64, *(CFDictionaryRef *)(*((void *)&v65 + 1) + 8 * i));
          int32_t v18 = v70;
          if (v70 >= (void *)v71)
          {
            unint64_t v21 = 0xAAAAAAAAAAAAAAABLL * (((char *)v70 - (unsigned char *)__p) >> 3);
            unint64_t v22 = v21 + 1;
            if (v21 + 1 > 0xAAAAAAAAAAAAAAALL) {
              sub_1DD3A9B50();
            }
            if (0x5555555555555556 * ((v71 - (unsigned char *)__p) >> 3) > v22) {
              unint64_t v22 = 0x5555555555555556 * ((v71 - (unsigned char *)__p) >> 3);
            }
            if (0xAAAAAAAAAAAAAAABLL * ((v71 - (unsigned char *)__p) >> 3) >= 0x555555555555555) {
              unint64_t v23 = 0xAAAAAAAAAAAAAAALL;
            }
            else {
              unint64_t v23 = v22;
            }
            if (v23) {
              long long v24 = (char *)sub_1DD3A9BF8((uint64_t)&v71, v23);
            }
            else {
              long long v24 = 0;
            }
            unint64_t v25 = &v24[24 * v21];
            long long v26 = *(_OWORD *)&v64.value;
            *((void *)v25 + 2) = v64.epoch;
            *(_OWORD *)unint64_t v25 = v26;
            uint64_t v28 = (char *)__p;
            long long v27 = (char *)v70;
            CMTimeEpoch v29 = v25;
            if (v70 != __p)
            {
              do
              {
                long long v30 = *(_OWORD *)(v27 - 24);
                *((void *)v29 - 1) = *((void *)v27 - 1);
                *(_OWORD *)(v29 - 24) = v30;
                v29 -= 24;
                v27 -= 24;
              }
              while (v27 != v28);
              long long v27 = (char *)__p;
            }
            unint64_t v20 = v25 + 24;
            __p = v29;
            CMTime v70 = v25 + 24;
            CMTime v71 = &v24[24 * v23];
            if (v27) {
              operator delete(v27);
            }
          }
          else
          {
            long long v19 = *(_OWORD *)&v64.value;
            v70[2] = v64.epoch;
            *int32_t v18 = v19;
            unint64_t v20 = (void *)v18 + 3;
          }
          CMTime v70 = v20;
        }
        uint64_t v15 = [v14 countByEnumeratingWithState:&v65 objects:v72 count:16];
      }
      while (v15);
    }

    if (v61)
    {
      int v12 = -2;
    }
    else
    {
      int v31 = [(AutoLoopStabilizer *)v63 FindAcceptableTripodSegmentForInput:a3 frameTimes:&__p];
      int v12 = v31;
      if (v60 || (v31 - 1) <= 1)
      {
        long long v37 = __p;
        double v36 = (char *)v70;
        int64_t droppedStartFrameCount = v63->droppedStartFrameCount;
        int64_t droppedEndFrameCount = v63->droppedEndFrameCount;
        id v40 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        id v41 = [NSNumber numberWithInt:droppedStartFrameCount];
        [v40 setObject:v41 forKeyedSubscript:*MEMORY[0x1E4F6F3C8]];

        uint64_t v42 = [NSNumber numberWithInt:~droppedEndFrameCount - 0x5555555555555555 * ((v36 - v37) >> 3)];
        [v40 setObject:v42 forKeyedSubscript:*MEMORY[0x1E4F6F3F8]];

        uint64_t v43 = objc_msgSend(NSNumber, "numberWithInt:", -[AutoLoopStabilizer FindFrameIndexForReferenceTimeInHomographies:](v63, "FindFrameIndexForReferenceTimeInHomographies:", &__p));
        [v40 setObject:v43 forKeyedSubscript:*MEMORY[0x1E4F6F408]];

        LODWORD(v64.value) = 0;
        v63->icCorrectionResultRef = (void *)ICCalcTripodCorrections();
        if (ICGetCorrectionResultCropData() && !CGRectIsEmpty(v63->cropRect))
        {
          long long v44 = (void *)MEMORY[0x1E4F1CA60];
          long long v45 = [NSNumber numberWithBool:1];
          uint64_t v46 = (void *)MEMORY[0x1E4F6F418];
          long long v47 = [v44 dictionaryWithObject:v45 forKey:*MEMORY[0x1E4F6F418]];

          int v48 = ICGetResultOptionalData();
          uint64_t v49 = [v48 objectForKeyedSubscript:*v46];
          CMTime v50 = v63->featuresDictionary;
          v63->featuresDictionarCGFloat y = (NSDictionary *)v49;
        }
        else
        {
          int v12 = 0;
        }

        goto LABEL_44;
      }
    }
    if (!v63->onlyProcessForHighQualityTripod)
    {
      ICGetResultConfidence();
      BOOL v33 = v32 == 0.0;
      LODWORD(v64.value) = 0;
      v63->icCorrectionResultRef = (void *)ICCalcSmoothingCorrections();
      if (LODWORD(v64.value) || !ICGetCorrectionResultCropData()) {
        goto LABEL_38;
      }
      [(AutoLoopStabilizer *)v63 CropRatio:&v63->cropRect];
      char v34 = v33 & ~v61;
      if (v35 < v63->cropRatioMinimum) {
        char v34 = 1;
      }
      if (v34)
      {
LABEL_38:
        ICDestroyResult();
        v63->icCorrectionResultRef = 0;
      }
      else
      {
        CMTime v53 = (void *)MEMORY[0x1E4F1CA60];
        CMTime v54 = [NSNumber numberWithBool:1];
        CMTime v55 = (void *)MEMORY[0x1E4F6F418];
        long long v56 = [v53 dictionaryWithObject:v54 forKey:*MEMORY[0x1E4F6F418]];

        CMTime v57 = ICGetResultOptionalData();
        uint64_t v58 = [v57 objectForKeyedSubscript:*v55];
        v59 = v63->featuresDictionary;
        v63->featuresDictionarCGFloat y = (NSDictionary *)v58;

        int v12 = 3;
      }
    }
LABEL_44:
    if (__p)
    {
      CMTime v70 = __p;
      operator delete(__p);
    }

    BOOL v10 = v63;
    if (v63->icCorrectionResultRef) {
      goto LABEL_49;
    }
    goto LABEL_47;
  }
  int v12 = -2;
LABEL_47:
  if (!v10->onlyProcessForHighQualityTripod)
  {
    LODWORD(__p) = 0;
    v63->icCorrectionResultRef = (void *)ICCalcPassThruCorrections();
    ICGetCorrectionResultCropData();
    int v12 = 4;
    BOOL v10 = v63;
  }
LABEL_49:
  int v51 = [(AutoLoopStabilizer *)v10 CropRectValid:&v10->cropRect];
  if (v12 == -3) {
    int v52 = 1;
  }
  else {
    int v52 = v51;
  }
  if (v52) {
    int result = v12;
  }
  else {
    int result = 0;
  }
  v63->_lastStabilizationResult = result;
  return result;
}

- (int)processStabilizationAnalysisForCinematicL1:(void *)a3
{
  if (!a3) {
    return 0;
  }
  featuresDictionarCGFloat y = self->featuresDictionary;
  self->featuresDictionarCGFloat y = 0;

  self->_lastTripodQualitCGFloat y = 0.0;
  ICDestroyResult();
  self->icCorrectionResultRef = 0;
  ICGetResultConfidence();
  if (v5 != 0.0
    && (self->icCorrectionResultRef = (void *)ICCalcCinematicL1Corrections(),
        ICGetCorrectionResultCropData()
     && ([(AutoLoopStabilizer *)self CropRatio:&self->cropRect], v6 >= self->cropRatioMinimum)))
  {
    int v7 = 5;
  }
  else
  {
    int v7 = -2;
  }
  if (!self->icCorrectionResultRef)
  {
    self->icCorrectionResultRef = (void *)ICCalcPassThruCorrections();
    ICGetCorrectionResultCropData();
    int v7 = 4;
  }
  if ([(AutoLoopStabilizer *)self CropRectValid:&self->cropRect]) {
    int result = v7;
  }
  else {
    int result = 0;
  }
  self->_lastStabilizationResult = result;
  return result;
}

- (AVAsset)movieAssetIn
{
  return self->movieAssetIn;
}

- (void)setMovieAssetIn:(id)a3
{
}

- (NSURL)statsFileOutURL
{
  return self->statsFileOutURL;
}

- (void)setStatsFileOutURL:(id)a3
{
}

- (unint64_t)frameSearchLength
{
  return self->frameSearchLength;
}

- (void)setFrameSearchLength:(unint64_t)a3
{
  self->frameSearchLength = a3;
}

- (NSString)currentStatusString
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setCurrentStatusString:(id)a3
{
}

- (float)progressValue
{
  return self->progressValue;
}

- (void)setProgressValue:(float)a3
{
  self->progressValue = a3;
}

- (BOOL)drawFeaturesFlag
{
  return self->drawFeaturesFlag;
}

- (void)setDrawFeaturesFlag:(BOOL)a3
{
  self->drawFeaturesFlag = a3;
}

- (int64_t)droppedStartFrameCount
{
  return self->droppedStartFrameCount;
}

- (void)setDroppedStartFrameCount:(int64_t)a3
{
  self->int64_t droppedStartFrameCount = a3;
}

- (int64_t)droppedEndFrameCount
{
  return self->droppedEndFrameCount;
}

- (void)setDroppedEndFrameCount:(int64_t)a3
{
  self->int64_t droppedEndFrameCount = a3;
}

- (void)icCorrectionResultRef
{
  return self->icCorrectionResultRef;
}

- (CGRect)cropRect
{
  double x = self->cropRect.origin.x;
  double y = self->cropRect.origin.y;
  double width = self->cropRect.size.width;
  double height = self->cropRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGSize)inputMovieDimensions
{
  double width = self->inputMovieDimensions.width;
  double height = self->inputMovieDimensions.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)refFrameTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 176);
  return self;
}

- (void)setRefFrameTime:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->refFrameTime.CMTimeEpoch epoch = a3->var3;
  *(_OWORD *)&self->refFrameTime.value = v3;
}

- (int)canceledAnalysis
{
  return self->canceledAnalysis;
}

- (void)setCanceledAnalysis:(int)a3
{
  self->canceledAnalysis = a3;
}

- (float)necessaryCropGainFractionPerDroppedFrame
{
  return self->necessaryCropGainFractionPerDroppedFrame;
}

- (void)setNecessaryCropGainFractionPerDroppedFrame:(float)a3
{
  self->necessaryCropGainFractionPerDroppedFrame = a3;
}

- (float)minConfidenceForTripodAccept
{
  return self->minConfidenceForTripodAccept;
}

- (void)setMinConfidenceForTripodAccept:(float)a3
{
  self->minConfidenceForTripodAccept = a3;
}

- (float)confidenceHighQualityThreshold
{
  return self->confidenceHighQualityThreshold;
}

- (void)setConfidenceHighQualityThreshold:(float)a3
{
  self->confidenceHighQualityThreshold = a3;
}

- (float)minimumHighQualityConfidenceValue
{
  return self->minimumHighQualityConfidenceValue;
}

- (void)setMinimumHighQualityConfidenceValue:(float)a3
{
  self->minimumHighQualityConfidenceValue = a3;
}

- (float)cropRatioMinimum
{
  return self->cropRatioMinimum;
}

- (void)setCropRatioMinimum:(float)a3
{
  self->cropRatioMinimum = a3;
}

- (BOOL)onlyProcessForHighQualityTripod
{
  return self->onlyProcessForHighQualityTripod;
}

- (void)setOnlyProcessForHighQualityTripod:(BOOL)a3
{
  self->onlyProcessForHighQualityTripod = a3;
}

- (float)alwaysAcceptedTripodCropRatio
{
  return self->alwaysAcceptedTripodCropRatio;
}

- (void)setAlwaysAcceptedTripodCropRatio:(float)a3
{
  self->alwaysAcceptedTripodCropRatio = a3;
}

- (BOOL)doLoopClosureCorrection
{
  return self->doLoopClosureCorrection;
}

- (void)setDoLoopClosureCorrection:(BOOL)a3
{
  self->doLoopClosureCorrection = a3;
}

- (NSDictionary)featuresDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 128, 1);
}

- (void)setFeaturesDictionary:(id)a3
{
}

- (float)minAllowedRemainingTripodCrop
{
  return self->_minAllowedRemainingTripodCrop;
}

- (void)setMinAllowedRemainingTripodCrop:(float)a3
{
  self->_minAllowedRemainingTripodCrop = a3;
}

- (id)statusUpdateBlock
{
  return self->_statusUpdateBlock;
}

- (void)setStatusUpdateBlock:(id)a3
{
}

- (BOOL)useLimitedTime
{
  return self->_useLimitedTime;
}

- (void)setUseLimitedTime:(BOOL)a3
{
  self->_useLimitedTime = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)trimStart
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 200);
  return self;
}

- (void)setTrimStart:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_trimStart.CMTimeEpoch epoch = a3->var3;
  *(_OWORD *)&self->_trimStart.value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)trimLength
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 224);
  return self;
}

- (void)setTrimLength:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_trimLength.CMTimeEpoch epoch = a3->var3;
  *(_OWORD *)&self->_trimLength.value = v3;
}

- (int)naturalTimeScale
{
  return self->_naturalTimeScale;
}

- (void)setNaturalTimeScale:(int)a3
{
  self->_naturalTimeScale = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)minimumFrameDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 248);
  return self;
}

- (void)setMinimumFrameDuration:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_minimumFrameDuration.CMTimeEpoch epoch = a3->var3;
  *(_OWORD *)&self->_minimumFrameDuration.value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)maxAllowedTrimTimeStart
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 272);
  return self;
}

- (void)setMaxAllowedTrimTimeStart:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_maxAllowedTrimTimeStart.CMTimeEpoch epoch = a3->var3;
  *(_OWORD *)&self->_maxAllowedTrimTimeStart.value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)maxAllowedTrimTimeEnd
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 296);
  return self;
}

- (void)setMaxAllowedTrimTimeEnd:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_maxAllowedTrimTimeEnd.CMTimeEpoch epoch = a3->var3;
  *(_OWORD *)&self->_maxAllowedTrimTimeEnd.value = v3;
}

- (NSArray)presentationTimesOfFramesToSkip
{
  return (NSArray *)objc_getProperty(self, a2, 144, 1);
}

- (void)setPresentationTimesOfFramesToSkip:(id)a3
{
}

- (int)analysisResult
{
  return self->_analysisResult;
}

- (int)lastStabilizationResult
{
  return self->_lastStabilizationResult;
}

- (NSArray)skipFrameTimes
{
  return self->_skipFrameTimes;
}

- (void)setSkipFrameTimes:(id)a3
{
}

- (BOOL)disableGPUStabilization
{
  return self->_disableGPUStabilization;
}

- (void)setDisableGPUStabilization:(BOOL)a3
{
  self->_disableGPUStabilization = a3;
}

- (BOOL)optimizeProcessingForMemory
{
  return self->_optimizeProcessingForMemory;
}

- (void)setOptimizeProcessingForMemory:(BOOL)a3
{
  self->_optimizeProcessingForMemordouble y = a3;
}

- (BOOL)didDrop
{
  return self->_didDrop;
}

- (void)setDidDrop:(BOOL)a3
{
  self->_didDrop = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)firstFrameTimeAfterDrop
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 320);
  return self;
}

- (void)setFirstFrameTimeAfterDrop:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_firstFrameTimeAfterDrop.CMTimeEpoch epoch = a3->var3;
  *(_OWORD *)&self->_firstFrameTimeAfterDrop.value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastFrameTimeAfterDrop
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 344);
  return self;
}

- (void)setLastFrameTimeAfterDrop:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_lastFrameTimeAfterDrop.CMTimeEpoch epoch = a3->var3;
  *(_OWORD *)&self->_lastFrameTimeAfterDrop.value = v3;
}

- (float)lastTripodQuality
{
  return self->_lastTripodQuality;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_skipFrameTimes, 0);
  objc_storeStrong((id *)&self->_presentationTimesOfFramesToSkip, 0);
  objc_storeStrong(&self->_statusUpdateBlock, 0);
  objc_storeStrong((id *)&self->featuresDictionary, 0);
  objc_storeStrong((id *)&self->currentStatusString, 0);
  objc_storeStrong((id *)&self->statsFileOutURL, 0);

  objc_storeStrong((id *)&self->movieAssetIn, 0);
}

@end