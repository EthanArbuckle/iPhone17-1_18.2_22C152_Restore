@interface BWIrisMovieInfo
+ (BWIrisMovieInfo)irisMovieInfoWithFigCaptureMovieFileRecordingSettings:(id)a3 stillImageCaptureTime:(id *)a4 stillImageCaptureHostTime:(id *)a5 stillImageCaptureAbsoluteStartTime:(double)a6 stillImageRequestSettings:(id)a7 stillImageCaptureSettings:(id)a8 originalPhotoRecording:(BOOL)a9 semanticStyle:(id)a10;
+ (id)emptyIrisMovieInfoWithFigCaptureMovieFileRecordingSettings:(id)a3;
+ (id)livePhotoMetadataStillImageKeyFrameSettingsIDForSettingsID:(int64_t)a3 isOriginalPhotoRecording:(BOOL)a4;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)audioOffset;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)beginTrimMasterPTS;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)masterMovieStartTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)momentCaptureMovieRecordingMasterEndTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)movieEndTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)movieEndingVideoPTS;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)movieStartTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)movieTrimEndTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)movieTrimStartTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)stillImageCaptureHostTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)stillImageCaptureTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)stillTimeOffsetToAudioPrerollStartTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)stillTimeOffsetToAudioPrerollStopTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)stillTimeOffsetToVideoPrerollStartTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)stillTimeOffsetToVideoPrerollStopTime;
- (BOOL)containsTrims;
- (BOOL)isFinalEnqueuedIrisRequest;
- (BOOL)isFinalReferenceMovie;
- (BOOL)isMomentCaptureMovieRecording;
- (BOOL)isOriginalPhotoRecording;
- (BOOL)isOverlappingRequest;
- (BOOL)isTransitionVitalityScoreValid;
- (BOOL)isVitalityScoreValid;
- (BOOL)limitStillImageTransformDuringVitalityPlayback;
- (BOOL)movieStartTimeRequiresCutting;
- (BOOL)requiresSubjectRelightingCalculation;
- (BOOL)spatialOverCaptureExpected;
- (BOOL)stillImageEncoderKeyFrameEmitted;
- (BOOL)stillImageVISKeyFrameTagged;
- (BWStats)fileCoordinatorToWriterMovingWindowLatencyStats;
- (BWStats)stagingNodeOverallVideoFrameReceptionStats;
- (BWStats)stagingNodeValveActiveVideoFrameReceptionStats;
- (BWStats)videoFrameDurationStats;
- (BWStillImageCaptureSettings)stillImageCaptureSettings;
- (BWSubjectRelightingCalculatorResult)subjectRelightingResult;
- (CGSize)nonDestructiveCropSize;
- (FigCaptureIrisStillImageSettings)stillImageRequestSettings;
- (FigCaptureMovieFileRecordingSettings)settings;
- (FigCaptureSemanticStyle)semanticStyle;
- (NSArray)movieLevelMetadataForSDOFOriginalMovie;
- (NSDictionary)transitionVitalityFeatures;
- (NSNumber)irisSequenceAdjusterRecipeIdentifier;
- (NSString)livePhotoMetadataStillImageKeyFrameSettingsID;
- (NSURL)masterMovieURL;
- (NSURL)outputMovieURL;
- (NSURL)outputURLForSDOFOriginalMovie;
- (NSURL)spatialOverCaptureMasterMovieURL;
- (NSURL)spatialOverCaptureOutputMovieURL;
- (NSURL)spatialOverCaptureTemporaryMovieURL;
- (NSURL)temporaryMovieURL;
- (NSURL)temporaryURLForSDOFOriginalMovie;
- (char)_initWithFigCaptureMovieFileRecordingSettings:(uint64_t)a3 stillImageCaptureTime:(long long *)a4 stillImageCaptureHostTime:(void *)a5 stillImageCaptureAbsoluteStartTime:(void *)a6 stillImageRequestSettings:(char)a7 stillImageCaptureSettings:(void *)a8 originalPhotoRecording:(double)a9 semanticStyle:;
- (double)processingTimeInMilliseconds;
- (double)stillImageCaptureAbsoluteStartTime;
- (float)targetFrameRate;
- (float)transitionVitalityScoreV1;
- (float)vitalityScore;
- (id)copyMovieInfosForRequestedSDOFVariants;
- (id)copySpatialOverCaptureVariant;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)maxSystemPressureLevel;
- (int)numberOfRequestedVariants;
- (int)stillImageCaptureLuxLevel;
- (int)stillImageCaptureType;
- (int64_t)enqueuedHostTime;
- (unint64_t)numberOfFramesDropped;
- (unsigned)requestedSDOFVariants;
- (unsigned)vitalityScoringVersion;
- (void)_initWithFigCaptureMovieFileRecordingSettings:(void *)a1;
- (void)dealloc;
- (void)setAudioOffset:(id *)a3;
- (void)setBeginTrimMasterPTS:(id *)a3;
- (void)setEnqueuedHostTime:(int64_t)a3;
- (void)setFileCoordinatorToWriterMovingWindowLatencyStats:(id)a3;
- (void)setFinalEnqueuedIrisRequest:(BOOL)a3;
- (void)setFinalReferenceMovie:(BOOL)a3;
- (void)setIrisSequenceAdjusterRecipeIdentifier:(id)a3;
- (void)setIsOverlappingRequest:(BOOL)a3;
- (void)setLimitStillImageTransformDuringVitalityPlayback:(BOOL)a3;
- (void)setMasterMovieStartTime:(id *)a3;
- (void)setMasterMovieURL:(id)a3;
- (void)setMaxSystemPressureLevel:(int)a3;
- (void)setMomentCaptureMovieRecording:(BOOL)a3;
- (void)setMomentCaptureMovieRecordingMasterEndTime:(id *)a3;
- (void)setMomentCaptureRecordingStillImageCaptureHostTimeOverride:(id *)a3 stillImageCaptureTimeOverride:(id *)a4;
- (void)setMovieEndTime:(id *)a3;
- (void)setMovieEndingVideoPTS:(id *)a3;
- (void)setMovieLevelMetadataForSDOFOriginalMovie:(id)a3;
- (void)setMovieStartTime:(id *)a3;
- (void)setMovieStartTimeRequiresCutting:(BOOL)a3;
- (void)setMovieTrimEndTime:(id *)a3;
- (void)setMovieTrimStartTime:(id *)a3;
- (void)setNonDestructiveCropSize:(CGSize)a3;
- (void)setNumberOfFramesDropped:(unint64_t)a3;
- (void)setOriginalPhotoRecording:(BOOL)a3;
- (void)setOutputMovieURL:(id)a3;
- (void)setOutputURLForSDOFOriginalMovie:(id)a3;
- (void)setProcessingTimeInMilliseconds:(double)a3;
- (void)setRequestedSDOFVariants:(unsigned int)a3;
- (void)setSpatialOverCaptureExpected:(BOOL)a3;
- (void)setSpatialOverCaptureMasterMovieURL:(id)a3;
- (void)setSpatialOverCaptureOutputMovieURL:(id)a3;
- (void)setSpatialOverCaptureTemporaryMovieURL:(id)a3;
- (void)setStagingNodeOverallVideoFrameReceptionStats:(id)a3;
- (void)setStagingNodeValveActiveVideoFrameReceptionStats:(id)a3;
- (void)setStillImageCaptureLuxLevel:(int)a3;
- (void)setStillImageCaptureTime:(id *)a3;
- (void)setStillImageEncoderKeyFrameEmitted:(BOOL)a3;
- (void)setStillImageVISKeyFrameTagged:(BOOL)a3;
- (void)setStillTimeOffsetToAudioPrerollStartTime:(id *)a3;
- (void)setStillTimeOffsetToAudioPrerollStopTime:(id *)a3;
- (void)setStillTimeOffsetToVideoPrerollStartTime:(id *)a3;
- (void)setStillTimeOffsetToVideoPrerollStopTime:(id *)a3;
- (void)setSubjectRelightingResult:(id)a3;
- (void)setTargetFrameRate:(float)a3;
- (void)setTemporaryMovieURL:(id)a3;
- (void)setTemporaryURLForSDOFOriginalMovie:(id)a3;
- (void)setTransitionVitalityFeatures:(id)a3;
- (void)setTransitionVitalityScoreV1:(float)a3;
- (void)setTransitionVitalityScoreValid:(BOOL)a3;
- (void)setVideoFrameDurationStats:(id)a3;
- (void)setVitalityScore:(float)a3;
- (void)setVitalityScoreValid:(BOOL)a3;
- (void)setVitalityScoringVersion:(unsigned int)a3;
@end

@implementation BWIrisMovieInfo

+ (id)emptyIrisMovieInfoWithFigCaptureMovieFileRecordingSettings:(id)a3
{
  v3 = -[BWIrisMovieInfo _initWithFigCaptureMovieFileRecordingSettings:]([BWIrisMovieInfo alloc], a3);
  return v3;
}

- (void)_initWithFigCaptureMovieFileRecordingSettings:(void *)a1
{
  if (!a1) {
    return 0;
  }
  v5.receiver = a1;
  v5.super_class = (Class)BWIrisMovieInfo;
  v3 = objc_msgSendSuper2(&v5, sel_init);
  if (v3) {
    v3[1] = a2;
  }
  return v3;
}

+ (BWIrisMovieInfo)irisMovieInfoWithFigCaptureMovieFileRecordingSettings:(id)a3 stillImageCaptureTime:(id *)a4 stillImageCaptureHostTime:(id *)a5 stillImageCaptureAbsoluteStartTime:(double)a6 stillImageRequestSettings:(id)a7 stillImageCaptureSettings:(id)a8 originalPhotoRecording:(BOOL)a9 semanticStyle:(id)a10
{
  v17 = [BWIrisMovieInfo alloc];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v21 = *a4;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v20 = *a5;
  v18 = -[BWIrisMovieInfo _initWithFigCaptureMovieFileRecordingSettings:stillImageCaptureTime:stillImageCaptureHostTime:stillImageCaptureAbsoluteStartTime:stillImageRequestSettings:stillImageCaptureSettings:originalPhotoRecording:semanticStyle:](v17, a3, (uint64_t)&v21, (long long *)&v20.var0, a7, a8, a9, a10, a6);
  return (BWIrisMovieInfo *)v18;
}

- (char)_initWithFigCaptureMovieFileRecordingSettings:(uint64_t)a3 stillImageCaptureTime:(long long *)a4 stillImageCaptureHostTime:(void *)a5 stillImageCaptureAbsoluteStartTime:(void *)a6 stillImageRequestSettings:(char)a7 stillImageCaptureSettings:(void *)a8 originalPhotoRecording:(double)a9 semanticStyle:
{
  if (!a1) {
    return 0;
  }
  v26.receiver = a1;
  v26.super_class = (Class)BWIrisMovieInfo;
  v17 = (char *)objc_msgSendSuper2(&v26, sel_init);
  if (v17)
  {
    *((void *)v17 + 1) = a2;
    uint64_t v18 = *(void *)(a3 + 16);
    *(_OWORD *)(v17 + 60) = *(_OWORD *)a3;
    *(void *)(v17 + 76) = v18;
    long long v19 = *a4;
    *(void *)(v17 + 100) = *((void *)a4 + 2);
    *(_OWORD *)(v17 + 84) = v19;
    *((double *)v17 + 14) = a9;
    *((void *)v17 + 15) = a5;
    *((void *)v17 + 16) = a6;
    *((void *)v17 + 2) = (id)[*((id *)v17 + 1) outputURL];
    id v20 = (id)[*((id *)v17 + 1) spatialOverCaptureMovieURL];
    *((void *)v17 + 6) = v20;
    v17[56] = v20 != 0;
    uint64_t v21 = MEMORY[0x1E4F1FA10];
    *(_OWORD *)(v17 + 140) = *MEMORY[0x1E4F1FA10];
    *(void *)(v17 + 156) = *(void *)(v21 + 16);
    v17[493] = a7;
    uint64_t v22 = MEMORY[0x1E4F1F9F8];
    long long v23 = *MEMORY[0x1E4F1F9F8];
    *(_OWORD *)(v17 + 308) = *MEMORY[0x1E4F1F9F8];
    uint64_t v24 = *(void *)(v22 + 16);
    *(void *)(v17 + 324) = v24;
    *(_OWORD *)(v17 + 356) = v23;
    *(void *)(v17 + 372) = v24;
    *(_OWORD *)(v17 + 380) = v23;
    *(void *)(v17 + 396) = v24;
    *(_OWORD *)(v17 + 404) = v23;
    *(void *)(v17 + 420) = v24;
    *(void *)(v17 + 444) = v24;
    *(_OWORD *)(v17 + 428) = v23;
    *((void *)v17 + 73) = a8;
    *((void *)v17 + 79) = 0;
  }
  return v17;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWIrisMovieInfo;
  [(BWIrisMovieInfo *)&v3 dealloc];
}

- (int)stillImageCaptureType
{
  v2 = [(BWIrisMovieInfo *)self stillImageCaptureSettings];
  return [(BWStillImageCaptureSettings *)v2 captureType];
}

- (void)setMomentCaptureRecordingStillImageCaptureHostTimeOverride:(id *)a3 stillImageCaptureTimeOverride:(id *)a4
{
  long long v4 = *(_OWORD *)&a3->var0;
  *(void *)&self->_stillImageCaptureHostTime.flags = a3->var3;
  *(_OWORD *)((char *)&self->_stillImageCaptureTime.epoch + 4) = v4;
  long long v5 = *(_OWORD *)&a4->var0;
  *(void *)&self->_stillImageCaptureTime.flags = a4->var3;
  *(_OWORD *)(&self->_spatialOverCaptureExpected + 4) = v5;
  self->_stillImageCaptureAbsoluteStartTime = CFAbsoluteTimeGetCurrent();
}

- (BOOL)containsTrims
{
  *(_OWORD *)&time1.value = *(_OWORD *)(&self->_movieStartTimeRequiresCutting + 4);
  time1.epoch = *(void *)&self->_movieStartTime.flags;
  *(_OWORD *)&v4.value = *(_OWORD *)((char *)&self->_movieEndingVideoPTS.epoch + 4);
  v4.epoch = *(void *)&self->_movieTrimStartTime.flags;
  if (CMTimeCompare(&time1, &v4)) {
    return 1;
  }
  CMTime time1 = *(CMTime *)((char *)&self->_movieStartTime.epoch + 4);
  CMTime v4 = *(CMTime *)((char *)&self->_movieTrimStartTime.epoch + 4);
  return CMTimeCompare(&time1, &v4) != 0;
}

- (int)numberOfRequestedVariants
{
  uint8x8_t v2 = (uint8x8_t)vcnt_s8((int8x8_t)self->_requestedSDOFVariants);
  v2.i16[0] = vaddlv_u8(v2);
  if (self->_requestedSDOFVariants) {
    return v2.i32[0];
  }
  else {
    return 1;
  }
}

- (id)copyMovieInfosForRequestedSDOFVariants
{
  if (!self->_requestedSDOFVariants) {
    return 0;
  }
  if ([(BWIrisMovieInfo *)self numberOfRequestedVariants] != 1)
  {
    if ([(BWIrisMovieInfo *)self numberOfRequestedVariants] == 2)
    {
      long long v5 = (void *)[(BWIrisMovieInfo *)self copy];
      [v5 setRequestedSDOFVariants:2];
      [v5 setOriginalPhotoRecording:1];
      [v5 setFinalEnqueuedIrisRequest:0];
      [v5 setFinalReferenceMovie:0];
      objc_msgSend(v5, "setOutputMovieURL:", objc_msgSend(v5, "outputURLForSDOFOriginalMovie"));
      objc_msgSend(v5, "setTemporaryMovieURL:", objc_msgSend(v5, "temporaryURLForSDOFOriginalMovie"));
      if ([v5 movieLevelMetadataForSDOFOriginalMovie])
      {
        objc_msgSend((id)objc_msgSend(v5, "settings"), "setMovieLevelMetadata:", objc_msgSend(v5, "movieLevelMetadataForSDOFOriginalMovie"));
        [v5 setMovieLevelMetadataForSDOFOriginalMovie:0];
      }
      [v5 setOutputURLForSDOFOriginalMovie:0];
      [v5 setTemporaryURLForSDOFOriginalMovie:0];
      objc_super v3 = (void *)[(BWIrisMovieInfo *)self copy];
      [v3 setRequestedSDOFVariants:1];
      [v3 setOutputURLForSDOFOriginalMovie:0];
      [v3 setTemporaryURLForSDOFOriginalMovie:0];
      [v3 setMovieLevelMetadataForSDOFOriginalMovie:0];
      CMTime v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v5, v3, 0);

      goto LABEL_8;
    }
    return 0;
  }
  objc_super v3 = (void *)[(BWIrisMovieInfo *)self copy];
  CMTime v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v3, 0);
LABEL_8:

  return v4;
}

- (id)copySpatialOverCaptureVariant
{
  objc_super v3 = (void *)[(BWIrisMovieInfo *)self copy];
  objc_msgSend(v3, "setOutputMovieURL:", -[BWIrisMovieInfo spatialOverCaptureOutputMovieURL](self, "spatialOverCaptureOutputMovieURL"));
  objc_msgSend(v3, "setTemporaryMovieURL:", -[BWIrisMovieInfo spatialOverCaptureTemporaryMovieURL](self, "spatialOverCaptureTemporaryMovieURL"));
  objc_msgSend(v3, "setMasterMovieURL:", -[BWIrisMovieInfo spatialOverCaptureMasterMovieURL](self, "spatialOverCaptureMasterMovieURL"));
  objc_msgSend((id)objc_msgSend(v3, "settings"), "setMovieLevelMetadata:", -[FigCaptureMovieFileRecordingSettings spatialOverCaptureMovieLevelMetadata](-[BWIrisMovieInfo settings](self, "settings"), "spatialOverCaptureMovieLevelMetadata"));
  return v3;
}

- (id)description
{
  if (FigIsItOKToLogURLs()) {
    uint64_t v21 = [(NSURL *)self->_outputMovieURL lastPathComponent];
  }
  else {
    uint64_t v21 = @"<redacted>";
  }
  objc_super v3 = (void *)[MEMORY[0x1E4F28E78] string];
  uint64_t v27 = objc_opt_class();
  int64_t v4 = [(FigCaptureRecordingSettings *)self->_settings settingsID];
  CMTime time = *(CMTime *)((char *)&self->_stillTimeOffsetToAudioPrerollStopInMilliseconds.epoch + 4);
  Float64 Seconds = CMTimeGetSeconds(&time);
  CMTime time = *(CMTime *)(&self->_movieStartTimeRequiresCutting + 4);
  Float64 v25 = CMTimeGetSeconds(&time);
  CMTime time = *(CMTime *)((char *)&self->_movieStartTime.epoch + 4);
  Float64 v24 = CMTimeGetSeconds(&time);
  CMTime time = *(CMTime *)((char *)&self->_movieEndingVideoPTS.epoch + 4);
  Float64 v23 = CMTimeGetSeconds(&time);
  CMTime time = *(CMTime *)((char *)&self->_movieTrimStartTime.epoch + 4);
  Float64 v22 = CMTimeGetSeconds(&time);
  CMTime time = *(CMTime *)(&self->_spatialOverCaptureExpected + 4);
  Float64 v5 = CMTimeGetSeconds(&time);
  CMTime time = *(CMTime *)((char *)&self->_movieEndTime.epoch + 4);
  Float64 v6 = CMTimeGetSeconds(&time);
  CMTime time = *(CMTime *)(&self->_movieStartTimeRequiresCutting + 4);
  CMTime rhs = *(CMTime *)((char *)&self->_stillTimeOffsetToAudioPrerollStopInMilliseconds.epoch + 4);
  CMTimeSubtract(&v34, &time, &rhs);
  Float64 v7 = CMTimeGetSeconds(&v34);
  CMTime time = *(CMTime *)((char *)&self->_movieStartTime.epoch + 4);
  CMTime rhs = *(CMTime *)(&self->_movieStartTimeRequiresCutting + 4);
  CMTimeSubtract(&v32, &time, &rhs);
  Float64 v8 = CMTimeGetSeconds(&v32);
  CMTime time = *(CMTime *)((char *)&self->_movieEndingVideoPTS.epoch + 4);
  CMTime rhs = *(CMTime *)(&self->_movieStartTimeRequiresCutting + 4);
  CMTimeSubtract(&v31, &time, &rhs);
  Float64 v9 = CMTimeGetSeconds(&v31);
  CMTime time = *(CMTime *)((char *)&self->_movieTrimStartTime.epoch + 4);
  CMTime rhs = *(CMTime *)(&self->_movieStartTimeRequiresCutting + 4);
  CMTimeSubtract(&v30, &time, &rhs);
  Float64 v10 = CMTimeGetSeconds(&v30);
  CMTime time = *(CMTime *)(&self->_spatialOverCaptureExpected + 4);
  CMTime rhs = *(CMTime *)(&self->_movieStartTimeRequiresCutting + 4);
  CMTimeSubtract(&v29, &time, &rhs);
  Float64 v11 = CMTimeGetSeconds(&v29);
  CMTime time = *(CMTime *)(&self->_spatialOverCaptureExpected + 4);
  CMTime rhs = *(CMTime *)((char *)&self->_movieEndingVideoPTS.epoch + 4);
  CMTimeSubtract(&v28, &time, &rhs);
  Float64 v12 = CMTimeGetSeconds(&v28);
  v13 = [(NSURL *)self->_masterMovieURL lastPathComponent];
  v14 = [(NSURL *)self->_temporaryMovieURL lastPathComponent];
  BOOL finalReferenceMovie = self->_finalReferenceMovie;
  BOOL finalEnqueuedIrisRequest = self->_finalEnqueuedIrisRequest;
  BOOL stillImageEncoderKeyFrameEmitted = self->_stillImageEncoderKeyFrameEmitted;
  BOOL stillImageVISKeyFrameTagged = self->_stillImageVISKeyFrameTagged;
  CMTime time = *(CMTime *)((char *)&self->_beginTrimMasterPTS.epoch + 4);
  objc_msgSend(v3, "appendFormat:", @"%@ %p: captureID:%lld, [Capture - master:%.4f movie:%.4f-%.4f trim:%.4f-%.4f still:%.4f endingVideoPTS:%.4f] [Movie - master:%.4f movie:0.-%.4f trim:%.4f-%.4f still:%.4f/%.4f] url:%@, master:%@, temporary:%@, isFinalReference:%d isFinalInSequence:%d keyFrameEmitted:%d stillImageVISKeyFrameTagged:%d audio offset: %.4f originalPhotoRecording:%d", v27, self, v4, *(void *)&Seconds, *(void *)&v25, *(void *)&v24, *(void *)&v23, *(void *)&v22, *(void *)&v5, *(void *)&v6, *(void *)&v7, *(void *)&v8, *(void *)&v9, *(void *)&v10, *(void *)&v11, *(void *)&v12,
    v21,
    v13,
    v14,
    finalReferenceMovie,
    finalEnqueuedIrisRequest,
    stillImageEncoderKeyFrameEmitted,
    stillImageVISKeyFrameTagged,
    CMTimeGetSeconds(&time),
    self->_originalPhotoRecording);
  objc_msgSend(v3, "appendFormat:", @" isMomentCaptureMovieRecording:%d", self->_isMomentCaptureMovieRecording);
  if (self->_requestedSDOFVariants)
  {
    if (FigIsItOKToLogURLs()) {
      long long v19 = [(NSURL *)self->_outputURLForSDOFOriginalMovie lastPathComponent];
    }
    else {
      long long v19 = @"<redacted>";
    }
    [v3 appendFormat:@" requestedSDOFVariants:0x%x originalSDOFURL:%@", self->_requestedSDOFVariants, v19];
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  Float64 v5 = (void *)[(FigCaptureMovieFileRecordingSettings *)self->_settings copy];
  Float64 v6 = +[BWIrisMovieInfo allocWithZone:a3];
  double stillImageCaptureAbsoluteStartTime = self->_stillImageCaptureAbsoluteStartTime;
  stillImageRequestSettings = self->_stillImageRequestSettings;
  stillImageCaptureSettings = self->_stillImageCaptureSettings;
  char originalPhotoRecording = self->_originalPhotoRecording;
  semanticStyle = self->_semanticStyle;
  long long v68 = *(_OWORD *)(&self->_spatialOverCaptureExpected + 4);
  uint64_t v69 = *(void *)&self->_stillImageCaptureTime.flags;
  long long v66 = *(_OWORD *)((char *)&self->_stillImageCaptureTime.epoch + 4);
  uint64_t v67 = *(void *)&self->_stillImageCaptureHostTime.flags;
  Float64 v12 = -[BWIrisMovieInfo _initWithFigCaptureMovieFileRecordingSettings:stillImageCaptureTime:stillImageCaptureHostTime:stillImageCaptureAbsoluteStartTime:stillImageRequestSettings:stillImageCaptureSettings:originalPhotoRecording:semanticStyle:](v6, v5, (uint64_t)&v68, &v66, stillImageRequestSettings, stillImageCaptureSettings, originalPhotoRecording, semanticStyle, stillImageCaptureAbsoluteStartTime);

  objc_msgSend(v12, "setOutputMovieURL:", -[BWIrisMovieInfo outputMovieURL](self, "outputMovieURL"));
  objc_msgSend(v12, "setTemporaryMovieURL:", -[BWIrisMovieInfo temporaryMovieURL](self, "temporaryMovieURL"));
  objc_msgSend(v12, "setSpatialOverCaptureOutputMovieURL:", -[BWIrisMovieInfo spatialOverCaptureOutputMovieURL](self, "spatialOverCaptureOutputMovieURL"));
  objc_msgSend(v12, "setSpatialOverCaptureTemporaryMovieURL:", -[BWIrisMovieInfo spatialOverCaptureTemporaryMovieURL](self, "spatialOverCaptureTemporaryMovieURL"));
  objc_msgSend(v12, "setSpatialOverCaptureMasterMovieURL:", -[BWIrisMovieInfo spatialOverCaptureMasterMovieURL](self, "spatialOverCaptureMasterMovieURL"));
  objc_msgSend(v12, "setSpatialOverCaptureExpected:", -[BWIrisMovieInfo spatialOverCaptureExpected](self, "spatialOverCaptureExpected"));
  objc_msgSend(v12, "setMomentCaptureMovieRecording:", -[BWIrisMovieInfo isMomentCaptureMovieRecording](self, "isMomentCaptureMovieRecording"));
  [(BWIrisMovieInfo *)self momentCaptureMovieRecordingMasterEndTime];
  long long v62 = v64;
  uint64_t v63 = v65;
  [v12 setMomentCaptureMovieRecordingMasterEndTime:&v62];
  [(BWIrisMovieInfo *)self nonDestructiveCropSize];
  objc_msgSend(v12, "setNonDestructiveCropSize:");
  objc_msgSend(v12, "setMovieStartTimeRequiresCutting:", -[BWIrisMovieInfo movieStartTimeRequiresCutting](self, "movieStartTimeRequiresCutting"));
  [(BWIrisMovieInfo *)self movieStartTime];
  long long v58 = v60;
  uint64_t v59 = v61;
  [v12 setMovieStartTime:&v58];
  [(BWIrisMovieInfo *)self movieEndTime];
  long long v54 = v56;
  uint64_t v55 = v57;
  [v12 setMovieEndTime:&v54];
  [(BWIrisMovieInfo *)self movieEndingVideoPTS];
  long long v50 = v52;
  uint64_t v51 = v53;
  [v12 setMovieEndingVideoPTS:&v50];
  [(BWIrisMovieInfo *)self movieTrimStartTime];
  long long v46 = v48;
  uint64_t v47 = v49;
  [v12 setMovieTrimStartTime:&v46];
  [(BWIrisMovieInfo *)self movieTrimEndTime];
  long long v42 = v44;
  uint64_t v43 = v45;
  [v12 setMovieTrimEndTime:&v42];
  [(BWIrisMovieInfo *)self beginTrimMasterPTS];
  long long v38 = v40;
  uint64_t v39 = v41;
  [v12 setBeginTrimMasterPTS:&v38];
  [(BWIrisMovieInfo *)self audioOffset];
  long long v34 = v36;
  uint64_t v35 = v37;
  [v12 setAudioOffset:&v34];
  [(BWIrisMovieInfo *)self stillTimeOffsetToVideoPrerollStartTime];
  long long v30 = v32;
  uint64_t v31 = v33;
  [v12 setStillTimeOffsetToVideoPrerollStartTime:&v30];
  [(BWIrisMovieInfo *)self stillTimeOffsetToVideoPrerollStopTime];
  long long v26 = v28;
  uint64_t v27 = v29;
  [v12 setStillTimeOffsetToVideoPrerollStopTime:&v26];
  [(BWIrisMovieInfo *)self stillTimeOffsetToAudioPrerollStartTime];
  long long v22 = v24;
  uint64_t v23 = v25;
  [v12 setStillTimeOffsetToAudioPrerollStartTime:&v22];
  [(BWIrisMovieInfo *)self stillTimeOffsetToAudioPrerollStopTime];
  long long v18 = v20;
  uint64_t v19 = v21;
  [v12 setStillTimeOffsetToAudioPrerollStopTime:&v18];
  [(BWIrisMovieInfo *)self masterMovieStartTime];
  long long v14 = v16;
  uint64_t v15 = v17;
  [v12 setMasterMovieStartTime:&v14];
  objc_msgSend(v12, "setMasterMovieURL:", -[BWIrisMovieInfo masterMovieURL](self, "masterMovieURL"));
  objc_msgSend(v12, "setFinalReferenceMovie:", -[BWIrisMovieInfo isFinalReferenceMovie](self, "isFinalReferenceMovie"));
  objc_msgSend(v12, "setStillImageEncoderKeyFrameEmitted:", -[BWIrisMovieInfo stillImageEncoderKeyFrameEmitted](self, "stillImageEncoderKeyFrameEmitted"));
  objc_msgSend(v12, "setStillImageVISKeyFrameTagged:", -[BWIrisMovieInfo stillImageVISKeyFrameTagged](self, "stillImageVISKeyFrameTagged"));
  objc_msgSend(v12, "setFinalEnqueuedIrisRequest:", -[BWIrisMovieInfo isFinalEnqueuedIrisRequest](self, "isFinalEnqueuedIrisRequest"));
  objc_msgSend(v12, "setIsOverlappingRequest:", -[BWIrisMovieInfo isOverlappingRequest](self, "isOverlappingRequest"));
  objc_msgSend(v12, "setRequestedSDOFVariants:", -[BWIrisMovieInfo requestedSDOFVariants](self, "requestedSDOFVariants"));
  objc_msgSend(v12, "setTemporaryURLForSDOFOriginalMovie:", -[BWIrisMovieInfo temporaryURLForSDOFOriginalMovie](self, "temporaryURLForSDOFOriginalMovie"));
  objc_msgSend(v12, "setOutputURLForSDOFOriginalMovie:", -[BWIrisMovieInfo outputURLForSDOFOriginalMovie](self, "outputURLForSDOFOriginalMovie"));
  objc_msgSend(v12, "setMovieLevelMetadataForSDOFOriginalMovie:", -[BWIrisMovieInfo movieLevelMetadataForSDOFOriginalMovie](self, "movieLevelMetadataForSDOFOriginalMovie"));
  objc_msgSend(v12, "setVitalityScoreValid:", -[BWIrisMovieInfo isVitalityScoreValid](self, "isVitalityScoreValid"));
  [(BWIrisMovieInfo *)self vitalityScore];
  objc_msgSend(v12, "setVitalityScore:");
  objc_msgSend(v12, "setVitalityScoringVersion:", -[BWIrisMovieInfo vitalityScoringVersion](self, "vitalityScoringVersion"));
  objc_msgSend(v12, "setTransitionVitalityScoreValid:", -[BWIrisMovieInfo isTransitionVitalityScoreValid](self, "isTransitionVitalityScoreValid"));
  [(BWIrisMovieInfo *)self transitionVitalityScoreV1];
  objc_msgSend(v12, "setTransitionVitalityScoreV1:");
  objc_msgSend(v12, "setLimitStillImageTransformDuringVitalityPlayback:", -[BWIrisMovieInfo limitStillImageTransformDuringVitalityPlayback](self, "limitStillImageTransformDuringVitalityPlayback"));
  objc_msgSend(v12, "setSubjectRelightingResult:", -[BWIrisMovieInfo subjectRelightingResult](self, "subjectRelightingResult"));
  objc_msgSend(v12, "setStagingNodeOverallVideoFrameReceptionStats:", -[BWIrisMovieInfo stagingNodeOverallVideoFrameReceptionStats](self, "stagingNodeOverallVideoFrameReceptionStats"));
  objc_msgSend(v12, "setStagingNodeValveActiveVideoFrameReceptionStats:", -[BWIrisMovieInfo stagingNodeValveActiveVideoFrameReceptionStats](self, "stagingNodeValveActiveVideoFrameReceptionStats"));
  objc_msgSend(v12, "setFileCoordinatorToWriterMovingWindowLatencyStats:", -[BWIrisMovieInfo fileCoordinatorToWriterMovingWindowLatencyStats](self, "fileCoordinatorToWriterMovingWindowLatencyStats"));
  return v12;
}

- (BOOL)requiresSubjectRelightingCalculation
{
  int v3 = ![(BWIrisMovieInfo *)self isMomentCaptureMovieRecording];
  int64_t v4 = [(FigCaptureStillImageSettings *)[(BWIrisMovieInfo *)self stillImageRequestSettings] smartStyle];
  if (v4) {
    return [(FigCaptureSmartStyle *)v4 isIdentity] & v3;
  }
  return v3;
}

- (NSString)livePhotoMetadataStillImageKeyFrameSettingsID
{
  int v3 = objc_opt_class();
  int64_t v4 = [(FigCaptureRecordingSettings *)self->_settings settingsID];
  BOOL originalPhotoRecording = self->_originalPhotoRecording;
  return (NSString *)[v3 livePhotoMetadataStillImageKeyFrameSettingsIDForSettingsID:v4 isOriginalPhotoRecording:originalPhotoRecording];
}

+ (id)livePhotoMetadataStillImageKeyFrameSettingsIDForSettingsID:(int64_t)a3 isOriginalPhotoRecording:(BOOL)a4
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"captureID:%lld:%d", a3, a4);
}

- (FigCaptureMovieFileRecordingSettings)settings
{
  return self->_settings;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)stillImageCaptureTime
{
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[2].var2;
  retstr->var3 = *(int64_t *)((char *)&self[3].var0 + 4);
  return self;
}

- (void)setStillImageCaptureTime:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  *(void *)&self->_stillImageCaptureTime.flags = a3->var3;
  *(_OWORD *)(&self->_spatialOverCaptureExpected + 4) = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)stillImageCaptureHostTime
{
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[3].var2;
  retstr->var3 = *(int64_t *)((char *)&self[4].var0 + 4);
  return self;
}

- (double)stillImageCaptureAbsoluteStartTime
{
  return self->_stillImageCaptureAbsoluteStartTime;
}

- (FigCaptureIrisStillImageSettings)stillImageRequestSettings
{
  return self->_stillImageRequestSettings;
}

- (BWStillImageCaptureSettings)stillImageCaptureSettings
{
  return self->_stillImageCaptureSettings;
}

- (BOOL)isMomentCaptureMovieRecording
{
  return self->_isMomentCaptureMovieRecording;
}

- (void)setMomentCaptureMovieRecording:(BOOL)a3
{
  self->_isMomentCaptureMovieRecording = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)momentCaptureMovieRecordingMasterEndTime
{
  *(_OWORD *)&retstr->var0 = *(_OWORD *)((char *)&self[5].var3 + 4);
  retstr->var3 = *(void *)&self[6].var2;
  return self;
}

- (void)setMomentCaptureMovieRecordingMasterEndTime:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  *(void *)&self->_momentCaptureMovieRecordingMasterEndTime.flags = a3->var3;
  *(_OWORD *)(&self->_isMomentCaptureMovieRecording + 4) = v3;
}

- (CGSize)nonDestructiveCropSize
{
  double width = self->_nonDestructiveCropSize.width;
  double height = self->_nonDestructiveCropSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setNonDestructiveCropSize:(CGSize)a3
{
  self->_nonDestructiveCropSize = a3;
}

- (BOOL)movieStartTimeRequiresCutting
{
  return self->_movieStartTimeRequiresCutting;
}

- (void)setMovieStartTimeRequiresCutting:(BOOL)a3
{
  self->_movieStartTimeRequiresCutting = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)movieStartTime
{
  *(_OWORD *)&retstr->var0 = *(_OWORD *)((char *)&self[7].var3 + 4);
  retstr->var3 = *(void *)&self[8].var2;
  return self;
}

- (void)setMovieStartTime:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  *(void *)&self->_movieStartTime.flags = a3->var3;
  *(_OWORD *)(&self->_movieStartTimeRequiresCutting + 4) = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)movieEndTime
{
  *(_OWORD *)&retstr->var0 = *(_OWORD *)((char *)&self[8].var3 + 4);
  retstr->var3 = *(void *)&self[9].var2;
  return self;
}

- (void)setMovieEndTime:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  *(void *)&self->_movieEndTime.flags = a3->var3;
  *(_OWORD *)((char *)&self->_movieStartTime.epoch + 4) = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)movieEndingVideoPTS
{
  *(_OWORD *)&retstr->var0 = *(_OWORD *)((char *)&self[9].var3 + 4);
  retstr->var3 = *(void *)&self[10].var2;
  return self;
}

- (void)setMovieEndingVideoPTS:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  *(void *)&self->_movieEndingVideoPTS.flags = a3->var3;
  *(_OWORD *)((char *)&self->_movieEndTime.epoch + 4) = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)movieTrimStartTime
{
  *(_OWORD *)&retstr->var0 = *(_OWORD *)((char *)&self[10].var3 + 4);
  retstr->var3 = *(void *)&self[11].var2;
  return self;
}

- (void)setMovieTrimStartTime:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  *(void *)&self->_movieTrimStartTime.flags = a3->var3;
  *(_OWORD *)((char *)&self->_movieEndingVideoPTS.epoch + 4) = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)movieTrimEndTime
{
  *(_OWORD *)&retstr->var0 = *(_OWORD *)((char *)&self[11].var3 + 4);
  retstr->var3 = *(void *)&self[12].var2;
  return self;
}

- (void)setMovieTrimEndTime:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  *(void *)&self->_movieTrimEndTime.flags = a3->var3;
  *(_OWORD *)((char *)&self->_movieTrimStartTime.epoch + 4) = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)beginTrimMasterPTS
{
  *(_OWORD *)&retstr->var0 = *(_OWORD *)((char *)&self[12].var3 + 4);
  retstr->var3 = *(void *)&self[13].var2;
  return self;
}

- (void)setBeginTrimMasterPTS:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  *(void *)&self->_beginTrimMasterPTS.flags = a3->var3;
  *(_OWORD *)((char *)&self->_movieTrimEndTime.epoch + 4) = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)masterMovieStartTime
{
  *(_OWORD *)&retstr->var0 = *(_OWORD *)((char *)&self[18].var3 + 4);
  retstr->var3 = *(void *)&self[19].var2;
  return self;
}

- (void)setMasterMovieStartTime:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  *(void *)&self->_masterMovieStartTime.flags = a3->var3;
  *(_OWORD *)((char *)&self->_stillTimeOffsetToAudioPrerollStopInMilliseconds.epoch + 4) = v3;
}

- (NSURL)outputMovieURL
{
  return self->_outputMovieURL;
}

- (void)setOutputMovieURL:(id)a3
{
}

- (NSURL)temporaryMovieURL
{
  return self->_temporaryMovieURL;
}

- (void)setTemporaryMovieURL:(id)a3
{
}

- (NSURL)masterMovieURL
{
  return self->_masterMovieURL;
}

- (void)setMasterMovieURL:(id)a3
{
}

- (NSURL)spatialOverCaptureMasterMovieURL
{
  return self->_spatialOverCaptureMasterMovieURL;
}

- (void)setSpatialOverCaptureMasterMovieURL:(id)a3
{
}

- (NSURL)spatialOverCaptureTemporaryMovieURL
{
  return self->_spatialOverCaptureTemporaryMovieURL;
}

- (void)setSpatialOverCaptureTemporaryMovieURL:(id)a3
{
}

- (NSURL)spatialOverCaptureOutputMovieURL
{
  return self->_spatialOverCaptureOutputMovieURL;
}

- (void)setSpatialOverCaptureOutputMovieURL:(id)a3
{
}

- (BOOL)spatialOverCaptureExpected
{
  return self->_spatialOverCaptureExpected;
}

- (void)setSpatialOverCaptureExpected:(BOOL)a3
{
  self->_spatialOverCaptureExpected = a3;
}

- (BOOL)isFinalReferenceMovie
{
  return self->_finalReferenceMovie;
}

- (void)setFinalReferenceMovie:(BOOL)a3
{
  self->_BOOL finalReferenceMovie = a3;
}

- (BOOL)isFinalEnqueuedIrisRequest
{
  return self->_finalEnqueuedIrisRequest;
}

- (void)setFinalEnqueuedIrisRequest:(BOOL)a3
{
  self->_BOOL finalEnqueuedIrisRequest = a3;
}

- (BOOL)isOverlappingRequest
{
  return self->_isOverlappingRequest;
}

- (void)setIsOverlappingRequest:(BOOL)a3
{
  self->_isOverlappingRequest = a3;
}

- (BOOL)stillImageEncoderKeyFrameEmitted
{
  return self->_stillImageEncoderKeyFrameEmitted;
}

- (void)setStillImageEncoderKeyFrameEmitted:(BOOL)a3
{
  self->_BOOL stillImageEncoderKeyFrameEmitted = a3;
}

- (BOOL)stillImageVISKeyFrameTagged
{
  return self->_stillImageVISKeyFrameTagged;
}

- (void)setStillImageVISKeyFrameTagged:(BOOL)a3
{
  self->_BOOL stillImageVISKeyFrameTagged = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)audioOffset
{
  *(_OWORD *)&retstr->var0 = *(_OWORD *)((char *)&self[13].var3 + 4);
  retstr->var3 = *(void *)&self[14].var2;
  return self;
}

- (void)setAudioOffset:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  *(void *)&self->_audioOffset.flags = a3->var3;
  *(_OWORD *)((char *)&self->_beginTrimMasterPTS.epoch + 4) = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)stillTimeOffsetToVideoPrerollStartTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 656);
  return self;
}

- (void)setStillTimeOffsetToVideoPrerollStartTime:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_stillTimeOffsetToVideoPrerollStartTime.epoch = a3->var3;
  *(_OWORD *)&self->_stillTimeOffsetToVideoPrerollStartTime.value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)stillTimeOffsetToVideoPrerollStopTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 680);
  return self;
}

- (void)setStillTimeOffsetToVideoPrerollStopTime:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_stillTimeOffsetToVideoPrerollStopTime.epoch = a3->var3;
  *(_OWORD *)&self->_stillTimeOffsetToVideoPrerollStopTime.value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)stillTimeOffsetToAudioPrerollStartTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 704);
  return self;
}

- (void)setStillTimeOffsetToAudioPrerollStartTime:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_stillTimeOffsetToAudioPrerollStartTime.epoch = a3->var3;
  *(_OWORD *)&self->_stillTimeOffsetToAudioPrerollStartTime.value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)stillTimeOffsetToAudioPrerollStopTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 728);
  return self;
}

- (void)setStillTimeOffsetToAudioPrerollStopTime:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_stillTimeOffsetToAudioPrerollStopTime.epoch = a3->var3;
  *(_OWORD *)&self->_stillTimeOffsetToAudioPrerollStopTime.value = v3;
}

- (BOOL)isOriginalPhotoRecording
{
  return self->_originalPhotoRecording;
}

- (void)setOriginalPhotoRecording:(BOOL)a3
{
  self->_BOOL originalPhotoRecording = a3;
}

- (unsigned)requestedSDOFVariants
{
  return self->_requestedSDOFVariants;
}

- (void)setRequestedSDOFVariants:(unsigned int)a3
{
  self->_requestedSDOFVariants = a3;
}

- (NSURL)temporaryURLForSDOFOriginalMovie
{
  return self->_temporaryURLForSDOFOriginalMovie;
}

- (void)setTemporaryURLForSDOFOriginalMovie:(id)a3
{
}

- (NSURL)outputURLForSDOFOriginalMovie
{
  return self->_outputURLForSDOFOriginalMovie;
}

- (void)setOutputURLForSDOFOriginalMovie:(id)a3
{
}

- (NSArray)movieLevelMetadataForSDOFOriginalMovie
{
  return self->_movieLevelMetadataForSDOFOriginalMovie;
}

- (void)setMovieLevelMetadataForSDOFOriginalMovie:(id)a3
{
}

- (BWStats)stagingNodeOverallVideoFrameReceptionStats
{
  return self->_stagingNodeOverallVideoFrameReceptionStats;
}

- (void)setStagingNodeOverallVideoFrameReceptionStats:(id)a3
{
}

- (BWStats)stagingNodeValveActiveVideoFrameReceptionStats
{
  return self->_stagingNodeValveActiveVideoFrameReceptionStats;
}

- (void)setStagingNodeValveActiveVideoFrameReceptionStats:(id)a3
{
}

- (BWStats)fileCoordinatorToWriterMovingWindowLatencyStats
{
  return self->_fileCoordinatorToWriterMovingWindowLatencyStats;
}

- (void)setFileCoordinatorToWriterMovingWindowLatencyStats:(id)a3
{
}

- (int)stillImageCaptureLuxLevel
{
  return self->_stillImageCaptureLuxLevel;
}

- (void)setStillImageCaptureLuxLevel:(int)a3
{
  self->_stillImageCaptureLuxLevel = a3;
}

- (int)maxSystemPressureLevel
{
  return self->_maxSystemPressureLevel;
}

- (void)setMaxSystemPressureLevel:(int)a3
{
  self->_maxSystemPressureLevel = a3;
}

- (NSNumber)irisSequenceAdjusterRecipeIdentifier
{
  return self->_irisSequenceAdjusterRecipeIdentifier;
}

- (void)setIrisSequenceAdjusterRecipeIdentifier:(id)a3
{
}

- (float)targetFrameRate
{
  return self->_targetFrameRate;
}

- (void)setTargetFrameRate:(float)a3
{
  self->_targetFrameRate = a3;
}

- (BWStats)videoFrameDurationStats
{
  return self->_videoFrameDurationStats;
}

- (void)setVideoFrameDurationStats:(id)a3
{
}

- (unint64_t)numberOfFramesDropped
{
  return self->_numberOfFramesDropped;
}

- (void)setNumberOfFramesDropped:(unint64_t)a3
{
  self->_numberOfFramesDropped = a3;
}

- (double)processingTimeInMilliseconds
{
  return self->_processingTimeInMilliseconds;
}

- (void)setProcessingTimeInMilliseconds:(double)a3
{
  self->_processingTimeInMilliseconds = a3;
}

- (BOOL)isVitalityScoreValid
{
  return self->_vitalityScoreValid;
}

- (void)setVitalityScoreValid:(BOOL)a3
{
  self->_vitalityScoreValid = a3;
}

- (float)vitalityScore
{
  return self->_vitalityScore;
}

- (void)setVitalityScore:(float)a3
{
  self->_vitalityScore = a3;
}

- (unsigned)vitalityScoringVersion
{
  return self->_vitalityScoringVersion;
}

- (void)setVitalityScoringVersion:(unsigned int)a3
{
  self->_vitalityScoringVersion = a3;
}

- (BOOL)isTransitionVitalityScoreValid
{
  return self->_transitionVitalityScoreValid;
}

- (void)setTransitionVitalityScoreValid:(BOOL)a3
{
  self->_transitionVitalityScoreValid = a3;
}

- (float)transitionVitalityScoreV1
{
  return self->_transitionVitalityScoreV1;
}

- (void)setTransitionVitalityScoreV1:(float)a3
{
  self->_transitionVitalityScoreV1 = a3;
}

- (BOOL)limitStillImageTransformDuringVitalityPlayback
{
  return self->_limitStillImageTransformDuringVitalityPlayback;
}

- (void)setLimitStillImageTransformDuringVitalityPlayback:(BOOL)a3
{
  self->_limitStillImageTransformDuringVitalityPlayback = a3;
}

- (BWSubjectRelightingCalculatorResult)subjectRelightingResult
{
  return self->_subjectRelightingResult;
}

- (void)setSubjectRelightingResult:(id)a3
{
}

- (FigCaptureSemanticStyle)semanticStyle
{
  return self->_semanticStyle;
}

- (NSDictionary)transitionVitalityFeatures
{
  return self->_transitionVitalityFeatures;
}

- (void)setTransitionVitalityFeatures:(id)a3
{
}

- (int64_t)enqueuedHostTime
{
  return self->_enqueuedHostTime;
}

- (void)setEnqueuedHostTime:(int64_t)a3
{
  self->_enqueuedHostTime = a3;
}

@end