@interface BWQuickTimeMovieFileSinkNode
+ (void)initialize;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastFileDuration;
- (BOOL)cinematicVideoEnabled;
- (BOOL)irisMovieProcessingSuspended;
- (BOOL)irisSampleReferenceMoviesEnabled;
- (BOOL)stereoVideoCaptureEnabled;
- (BWQuickTimeMovieFileSinkNode)initWithNumberOfVideoInputs:(unint64_t)a3 numberOfAuxiliaryPictureInputs:(unint64_t)a4 numberOfAudioInputs:(unint64_t)a5 numberOfMetadataInputs:(unint64_t)a6 cameraInfoByPortType:(id)a7 pipelineIndex:(unint64_t)a8 sinkID:(id)a9;
- (BWQuickTimeMovieFileSinkNode)initWithSinkID:(id)a3;
- (CMTime)_finalizeAudioVideoDurationsAndFindWrittenEndingPTSFromEndingPTS:(uint64_t)a3@<X8>;
- (CMTime)_printBufferEvent:(CMTime *)result forNodeInputIndex:(CMSampleBufferRef)sbuf eventName:;
- (NSArray)movieLevelMetadata;
- (NSArray)nonCriticalAudioVideoTrackInputIndices;
- (NSArray)structuralDependentTrackReferenceListForMetadataInputs;
- (NSArray)taggedMediaCharacteristicsForInputs;
- (NSArray)trackReferenceListForAudioInputs;
- (NSArray)trackReferenceListForAudioRemixInputs;
- (NSArray)trackReferenceListForMetadataInputs;
- (NSArray)trackReferenceListForRenderMetadataInputs;
- (NSArray)trackReferenceListForVideoInputs;
- _handleSpatialAggressorsSeenMarkerBuffer:(_DWORD *)result;
- (__CFString)_computeMovieRecordingVideoSTFStatistics;
- (double)_resetVideoSTFAnalytics;
- (float)_collectVideoSTFAnalyticsFromSbuf:(float *)result;
- (id)_collectVideoStabilizationAnalyticsFromDictionary:(id *)result;
- (id)clientApplicationID;
- (id)irisMotionAnalysisRingBuffer;
- (id)irisStillImageMovieMetadataCache;
- (id)nodeSubType;
- (id)videoOrientationTimeMachine;
- (int)pipelineTraceID;
- (int64_t)maximumAllowedInFlightCompressedBytes;
- (uint64_t)_addMovieSegmentMetadataTrackUsingMovieSettings:(unsigned int *)a3 withVideoTimeScales:;
- (uint64_t)_adjustMaxFileDurationForMovieTimeScale:(uint64_t)a1;
- (uint64_t)_adjustedMinFreeDiskSpaceLimitForEstimatedMovieSizeOverhead:(uint64_t)result;
- (uint64_t)_checkFreeSpaceForEstimatedMovieSizeOverhead:(uint64_t)result;
- (uint64_t)_doStartRecordingAtTime:(void *)a3 withSettings:(void *)a4 sensorVideoPort:(void *)a5 captureDeviceType:;
- (uint64_t)_driveStateMachineWithBuffer:(uint64_t)a3 forInputIndex:(int)a4 sampleBufferAlreadyAtHeadOfQueue:;
- (uint64_t)_driveStateMachineWithPauseMarkerBuffer:(uint64_t)a3 forInputIndex:(void *)a4 inputStagingQueue:(int)a5 sampleBufferAlreadyAtHeadOfQueue:;
- (uint64_t)_driveStateMachineWithResumeMarkerBuffer:(uint64_t)a3 forInputIndex:(void *)a4 inputStagingQueue:(int)a5 sampleBufferAlreadyAtHeadOfQueue:;
- (uint64_t)_driveStateMachineWithStartMarkerBuffer:(uint64_t)a3 forInputIndex:(void *)a4 inputStagingQueue:(int)a5 sampleBufferAlreadyAtHeadOfQueue:;
- (uint64_t)_driveStateMachineWithStopOrFlushMarkerBuffer:(const void *)a3 requiredAction:(uint64_t)a4 forInputIndex:(void *)a5 inputStagingQueue:(int)a6 sampleBufferAlreadyAtHeadOfQueue:;
- (uint64_t)_endingPTSForTrack:(uint64_t)a3@<X2> endingPTS:(uint64_t)a4@<X3> writtenEndingPTS:(uint64_t)a5@<X4> validatedEndingPTS:(int)a6@<W5> isIrisMasterMovie:(uint64_t)a7@<X8>;
- (uint64_t)_findMarkers:(uint64_t)a3@<X8>;
- (uint64_t)_findWrittenStartingPTS;
- (uint64_t)_getCurrentFileSize:(CMTime *)a3 currentHostTime:;
- (uint64_t)_handleFormatWriterErrorOccurredCallback:(void *)a3 userInfo:;
- (uint64_t)_handleStreamForcedOffMarkerBuffer:(uint64_t)result;
- (uint64_t)_initAnalyticsDataInIrisMovieInfo:(uint64_t)result;
- (uint64_t)_isLastFallbackAudioTrack:(void *)a1;
- (uint64_t)_moveOrDeleteTemporaryIrisMovie:(char)a3 recordingSucceeded:;
- (uint64_t)_preAllocateIfNeededForURL:(void *)a3 settings:;
- (uint64_t)_preprocessingForFirstAudioBuffer:(uint64_t)a3 forInputIndex:;
- (uint64_t)_preprocessingForFirstAuxiliaryBuffer:(uint64_t)a3 forInputIndex:;
- (uint64_t)_preprocessingForFirstVideoBuffer:(uint64_t)a3 forInputIndex:;
- (uint64_t)_setTrackMatrixProperty:(uint64_t)a3 forInputIndex:(void *)a4 fileSettings:(void *)a5 metadata:;
- (uint64_t)_setTrackReferenceListForMetadataInputs:(id *)a3 inOutTrackReferenceListForMetadataInputs:;
- (uint64_t)_startUpFormatWriterAtTime:(void *)a3 withSettings:;
- (uint64_t)_validateTrackReferenceListForInputs:(uint64_t)a3 ofType:;
- (uint64_t)_validatedEndingPTSFromEndingPTS:(uint64_t)a3@<X8>;
- (uint64_t)_verifyMovieTiming:(uint64_t)result;
- (uint64_t)_writeStillImageTimeMetadataSampleForCaptureTime:(void *)a3 stillImageTransformData:(uint64_t)a4 referenceDimensions:(uint64_t)a5 toTrackWithID:(int32_t)a6 usingTrackTimeScale:;
- (unint64_t)_computeMotionAnalysisStatisticFromRange:(uint64_t)a3 calculation:;
- (unint64_t)_computeTransitionVitalityScore:(unint64_t)a1;
- (unint64_t)lastFileSize;
- (unsigned)_updateMovieFileMemoryAnalytics;
- (void)_addStereoMovieLevelMetadataToSettingsMovieLevelMetadata:(uint64_t)a1;
- (void)_buildIrisRefMovieGeneratorAndWriteFirstIrisAsRefMovie;
- (void)_clearProvidedTrackFormatDescriptions;
- (void)_collectCoreAnalyticsData:(uint64_t)a1;
- (void)_debugAudioUsingSampleBuffer:(uint64_t)a1;
- (void)_determineWhichInputsWeExpectToSeeSamplesFor;
- (void)_doEndRecordingAtTime:(uint64_t)a3 earlyTerminationErrCode:;
- (void)_driveStateMachineWithMediaBuffer:(uint64_t)a3 forInputIndex:(void *)a4 inputStagingQueue:(char)a5 sampleBufferAlreadyAtHeadOfQueue:;
- (void)_findStartMarkersWithMatchedStagedSetting:(void *)a3@<X2> sensorVideoPort:(void *)a4@<X3> captureDeviceType:(void *)a5@<X8>;
- (void)_finishIrisMovieGeneration;
- (void)_fixVitalityScoreWithMotionAnalysis:(unint64_t)a1;
- (void)_forceEarlyTerminationWithErrorCode:(uint64_t)a1;
- (void)_generateThumbnailSurfaceFromPixelBuffer:(char)a3 physicallyMirroredHorizontallyUpstream:;
- (void)_handleIrisMovieRequest:(uint64_t)a1;
- (void)_preprocessingForFirstMetadataBuffer:(uint64_t)a3 forInputIndex:;
- (void)_processIrisRequest:(uint64_t)a1;
- (void)_submitMovieFileCoreAnalyticsEvent;
- (void)_updateTrackFormatDescriptionsAtURL:(void *)a1;
- (void)_validTrackReferencesForReferenceInputIndexes:(uint64_t)a1;
- (void)_validateTaggedMediaCharacteristicsForInputIndexes:(uint64_t)a1;
- (void)_writeBuffer:(uint64_t)a3 forInputIndex:;
- (void)_writeIrisRefMovieWithInfo:(void *)a1;
- (void)_writeMovieSegmentMetadataForSegmentStartPTS:(long long *)a3 segmentDuration:;
- (void)_writeVideoTrackLevelMetadataForSampleBuffer:(uint64_t)a3 inputIndex:;
- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5;
- (void)dealloc;
- (void)didReachEndOfDataForInput:(id)a3;
- (void)handleDroppedSample:(id)a3 forInput:(id)a4;
- (void)prepareForCurrentConfigurationToBecomeLive;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
- (void)setCinematicVideoEnabled:(BOOL)a3;
- (void)setClientApplicationID:(id)a3;
- (void)setIrisMotionAnalysisRingBuffer:(id)a3;
- (void)setIrisMovieProcessingSuspended:(BOOL)a3;
- (void)setIrisSampleReferenceMoviesEnabled:(BOOL)a3;
- (void)setIrisStillImageMovieMetadataCache:(id)a3;
- (void)setMaximumAllowedInFlightCompressedBytes:(int64_t)a3;
- (void)setMovieLevelMetadata:(id)a3;
- (void)setNonCriticalAudioVideoTrackInputIndices:(id)a3;
- (void)setPipelineTraceID:(int)a3;
- (void)setStereoVideoCaptureEnabled:(BOOL)a3;
- (void)setStructuralDependentTrackReferenceListForMetadataInputs:(id)a3;
- (void)setTaggedMediaCharacteristicsForInputs:(id)a3;
- (void)setTrackReferenceListForAudioInputs:(id)a3;
- (void)setTrackReferenceListForAudioRemixInputs:(id)a3;
- (void)setTrackReferenceListForMetadataInputs:(id)a3;
- (void)setTrackReferenceListForRenderMetadataInputs:(id)a3;
- (void)setTrackReferenceListForVideoInputs:(id)a3;
- (void)setVideoOrientationTimeMachine:(id)a3;
- (void)setupOverCaptureQualityMetricsForLivePhotoHistory:(int)a3;
- (void)setupRingBufferForStabilizedTrajectoryHomographies:(int)a3;
@end

@implementation BWQuickTimeMovieFileSinkNode

- (void)setIrisStillImageMovieMetadataCache:(id)a3
{
  irisStillImageMovieMetadataCache = self->_irisStillImageMovieMetadataCache;
  if (irisStillImageMovieMetadataCache != a3)
  {

    self->_irisStillImageMovieMetadataCache = (BWIrisStillImageMovieMetadataCache *)a3;
  }
}

- (void)setupRingBufferForStabilizedTrajectoryHomographies:(int)a3
{
  if (self->_irisStabilizedTrajectoryHomographyRingBuffer) {
    -[BWQuickTimeMovieFileSinkNode setupRingBufferForStabilizedTrajectoryHomographies:]();
  }
  if (a3 >= 1)
  {
    v4 = [[BWObjectRingBuffer alloc] initWithCapacity:*(void *)&a3];
    self->_irisStabilizedTrajectoryHomographyRingBuffer = v4;
    [(BWObjectRingBuffer *)v4 setEnforceAscending:1];
  }
}

- (void)setVideoOrientationTimeMachine:(id)a3
{
  videoOrientationTimeMachine = self->_videoOrientationTimeMachine;
  if (videoOrientationTimeMachine != a3)
  {

    self->_videoOrientationTimeMachine = (BWVideoOrientationTimeMachine *)a3;
  }
}

- (void)setTrackReferenceListForMetadataInputs:(id)a3
{
}

- (void)setStereoVideoCaptureEnabled:(BOOL)a3
{
  self->_stereoVideoCaptureEnabled = a3;
}

- (void)setPipelineTraceID:(int)a3
{
  self->_pipelineTraceID = a3;
}

- (void)setNonCriticalAudioVideoTrackInputIndices:(id)a3
{
}

- (void)setMaximumAllowedInFlightCompressedBytes:(int64_t)a3
{
  self->_maximumAllowedInFlightCompressedBytes = a3;
}

- (void)setIrisSampleReferenceMoviesEnabled:(BOOL)a3
{
  self->_irisSampleReferenceMoviesEnabled = a3;
}

- (void)setIrisMotionAnalysisRingBuffer:(id)a3
{
  self->_irisMotionAnalysisRingBuffer = (BWInferenceResultRingBuffers *)a3;
}

- (void)setClientApplicationID:(id)a3
{
  if (!-[NSString isEqualToString:](self->_clientApplicationID, "isEqualToString:"))
  {

    self->_clientApplicationID = (NSString *)[a3 copy];
  }
}

- (void)setCinematicVideoEnabled:(BOOL)a3
{
  self->_cinematicVideoEnabled = a3;
}

- (uint64_t)_setTrackReferenceListForMetadataInputs:(id *)a3 inOutTrackReferenceListForMetadataInputs:
{
  if (result)
  {
    uint64_t v5 = result;
    -[BWQuickTimeMovieFileSinkNode _validateTrackReferenceListForInputs:ofType:](result, a2, @"metadata");
    pthread_mutex_lock(*(pthread_mutex_t **)(v5 + 824));

    uint64_t v6 = [a2 count];
    if (v6) {
      uint64_t v6 = [a2 copy];
    }
    *a3 = (id)v6;
    v7 = *(pthread_mutex_t **)(v5 + 824);
    return pthread_mutex_unlock(v7);
  }
  return result;
}

- (void)setStructuralDependentTrackReferenceListForMetadataInputs:(id)a3
{
  -[BWQuickTimeMovieFileSinkNode _validateTrackReferenceListForInputs:ofType:]((uint64_t)self, a3, @"structural dependent metadata");
  pthread_mutex_lock((pthread_mutex_t *)self->_propertyMutex);

  self->_structuralDependentTrackReferenceListForMetadataInputs = (NSArray *)[a3 copy];
  propertyMutex = self->_propertyMutex;
  pthread_mutex_unlock((pthread_mutex_t *)propertyMutex);
}

- (uint64_t)_validateTrackReferenceListForInputs:(uint64_t)a3 ofType:
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v5 = result;
    if ([a2 count] && (objc_msgSend(a2, "count") & 1) == 0)
    {
      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      result = [a2 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (!result) {
        return result;
      }
      uint64_t v6 = result;
      uint64_t v7 = *(void *)v13;
      while (1)
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(a2);
          }
          if (*(void *)(v5 + 552) <= (unint64_t)[*(id *)(*((void *)&v12 + 1) + 8 * v8) unsignedIntValue])
          {
            v9 = (void *)MEMORY[0x1E4F1CA00];
            uint64_t v10 = *MEMORY[0x1E4F1C3C8];
            uint64_t v11 = [NSString stringWithFormat:@"invalid input index in track reference list for %@ inputs", a3];
            goto LABEL_14;
          }
          ++v8;
        }
        while (v6 != v8);
        result = [a2 countByEnumeratingWithState:&v12 objects:v16 count:16];
        uint64_t v6 = result;
        if (!result) {
          return result;
        }
      }
    }
    v9 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v10 = *MEMORY[0x1E4F1C3C8];
    uint64_t v11 = [NSString stringWithFormat:@"invalid track reference list for %@ inputs", a3];
LABEL_14:
    objc_exception_throw((id)[v9 exceptionWithName:v10 reason:v11 userInfo:0]);
  }
  return result;
}

- (BWQuickTimeMovieFileSinkNode)initWithNumberOfVideoInputs:(unint64_t)a3 numberOfAuxiliaryPictureInputs:(unint64_t)a4 numberOfAudioInputs:(unint64_t)a5 numberOfMetadataInputs:(unint64_t)a6 cameraInfoByPortType:(id)a7 pipelineIndex:(unint64_t)a8 sinkID:(id)a9
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  unint64_t v9 = a4 + a3;
  unint64_t v10 = a6 + a5;
  unint64_t v11 = a6 + a5 + a4 + a3;
  if (!v11) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Need at least 1 input" userInfo:0]);
  }
  unint64_t v13 = a6;
  unint64_t v14 = a4;
  unint64_t v15 = a3;
  v61.receiver = self;
  v61.super_class = (Class)BWQuickTimeMovieFileSinkNode;
  v16 = [(BWSinkNode *)&v61 initWithSinkID:a9];
  if (v16)
  {
    size_t v48 = v11;
    unint64_t v49 = a8;
    uint64_t v17 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:v10 + v15];
    if (v15)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        v19 = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v16 index:i];
        v20 = objc_alloc_init(BWVideoFormatRequirements);
        [(BWNodeInput *)v19 setFormatRequirements:v20];

        [v16 addInput:v19];
        objc_msgSend(v17, "addObject:", objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", 0));
      }
    }
    for (; v14; --v14)
    {
      v21 = [[BWNodeInput alloc] initWithMediaType:1635088502 node:v16 index:v15];
      v22 = objc_alloc_init(BWVideoFormatRequirements);
      [(BWNodeInput *)v21 setFormatRequirements:v22];

      [v16 addInput:v21];
      objc_msgSend(v17, "addObject:", objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", 0));
      ++v15;
    }
    if (a5)
    {
      unint64_t v23 = a5;
      do
      {
        v24 = [[BWNodeInput alloc] initWithMediaType:1936684398 node:v16 index:v15];
        [v16 addInput:v24];
        objc_msgSend(v17, "addObject:", objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", 0));
        ++v15;

        --v23;
      }
      while (v23);
    }
    for (; v13; --v13)
    {
      v25 = [[BWNodeInput alloc] initWithMediaType:1835365473 node:v16 index:v15];
      [v16 addInput:v25];
      objc_msgSend(v17, "addObject:", objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", 0));
      ++v15;
    }
    *((void *)v16 + 197) = v15;
    *((void *)v16 + 88) = 0;
    size_t v26 = v48 + 1;
    *((void *)v16 + 76) = malloc_type_calloc(v48 + 1, 4uLL, 0x100004052888210uLL);
    *((void *)v16 + 77) = malloc_type_calloc(v48, 1uLL, 0x100004077774924uLL);
    *((void *)v16 + 78) = malloc_type_calloc(v48, 1uLL, 0x100004077774924uLL);
    *((void *)v16 + 79) = malloc_type_calloc(v48 + 1, 1uLL, 0x100004077774924uLL);
    *((void *)v16 + 80) = malloc_type_calloc(v48, 8uLL, 0x6004044C4A2DFuLL);
    *((void *)v16 + 71) = FigDispatchQueueCreateWithPriority();
    *((void *)v16 + 91) = v9;
    *((void *)v16 + 93) = a5;
    if (a5)
    {
      v16[737] = 0;
      v16[738] = 0;
    }
    *((void *)v16 + 22) = 0;
    v27 = (_OWORD *)MEMORY[0x1E4F1FA48];
    *((void *)v16 + 31) = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    *(_OWORD *)(v16 + 232) = *v27;
    *((void *)v16 + 49) = v17;
    *((void *)v16 + 69) = v48;
    *((void *)v16 + 70) = 1;
    *((_DWORD *)v16 + 146) = 0;
    *((void *)v16 + 51) = 0;
    v16[713] = 0;
    v16[712] = 0;
    v16[716] = 0;
    *((_DWORD *)v16 + 180) = 0;
    *((void *)v16 + 56) = malloc_type_malloc(24 * v26, 0x1000040504FFAC1uLL);
    *((void *)v16 + 57) = malloc_type_malloc(24 * v26, 0x1000040504FFAC1uLL);
    uint64_t v28 = *((void *)v16 + 91);
    if (v28)
    {
      *((void *)v16 + 58) = malloc_type_malloc(24 * v28, 0x1000040504FFAC1uLL);
      uint64_t v28 = *((void *)v16 + 91);
    }
    uint64_t v29 = *((void *)v16 + 93) + v28;
    if (v29)
    {
      *((void *)v16 + 59) = malloc_type_malloc(24 * v29, 0x1000040504FFAC1uLL);
      *((void *)v16 + 60) = malloc_type_malloc(24 * (*((void *)v16 + 93) + *((void *)v16 + 91)), 0x1000040504FFAC1uLL);
    }
    CMTimeMake(&v60, 0, 1);
    long long v30 = *(_OWORD *)&v60.value;
    *((void *)v16 + 102) = v60.epoch;
    *((_OWORD *)v16 + 50) = v30;
    if (!*((void *)v16 + 100))
    {
      uint64_t v31 = MEMORY[0x1E4F1F9F8];
      *((_OWORD *)v16 + 50) = *MEMORY[0x1E4F1F9F8];
      *((void *)v16 + 102) = *(void *)(v31 + 16);
    }
    *((void *)v16 + 103) = FigSimpleMutexCreate();
    *((void *)v16 + 82) = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    *((void *)v16 + 84) = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    *((void *)v16 + 85) = FigDispatchQueueCreateWithPriority();
    *((void *)v16 + 118) = v49;
    *((_DWORD *)v16 + 238) = 81;
    *((_DWORD *)v16 + 95) = 0;
    *((void *)v16 + 127) = 0;
    *((void *)v16 + 128) = 0;
    *((void *)v16 + 129) = 0;
    *((void *)v16 + 130) = 0;
    *((void *)v16 + 131) = 0;
    *((void *)v16 + 132) = objc_alloc_init(BWMovieFileOutputAnalyticsPayload);
    *((void *)v16 + 190) = objc_alloc_init(BWVideoStabilizationAnalyticsPayload);
    *((void *)v16 + 158) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    *((void *)v16 + 159) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    *((void *)v16 + 170) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    *((void *)v16 + 171) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v16[1280] = 0;
    *((void *)v16 + 114) = 0;
    *((void *)v16 + 115) = 0;
    *((void *)v16 + 162) = 0;
    *((void *)v16 + 161) = 0;
    *((_DWORD *)v16 + 326) = 0;
    *((void *)v16 + 164) = 0;
    *((void *)v16 + 165) = -1;
    *((_DWORD *)v16 + 333) = 0;
    *((_DWORD *)v16 + 332) = 0;
    *((void *)v16 + 110) = 0x3FF199999999999ALL;
    if (a7)
    {
      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      v32 = (void *)[a7 allValues];
      uint64_t v33 = [v32 countByEnumeratingWithState:&v56 objects:v63 count:16];
      if (v33)
      {
        uint64_t v34 = v33;
        uint64_t v35 = *(void *)v57;
        uint64_t v36 = *MEMORY[0x1E4F52C80];
        double v37 = INFINITY;
        do
        {
          for (uint64_t j = 0; j != v34; ++j)
          {
            if (*(void *)v57 != v35) {
              objc_enumerationMutation(v32);
            }
            objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v56 + 1) + 8 * j), "objectForKeyedSubscript:", v36), "doubleValue");
            if (v39 > 0.0 && v39 < v37)
            {
              *((double *)v16 + 110) = v39 * 1.1;
              double v37 = v39;
            }
          }
          uint64_t v34 = [v32 countByEnumeratingWithState:&v56 objects:v63 count:16];
        }
        while (v34);
      }
      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      v41 = (void *)[a7 allKeys];
      uint64_t v42 = [v41 countByEnumeratingWithState:&v52 objects:v62 count:16];
      if (v42)
      {
        uint64_t v43 = v42;
        int v44 = 0;
        uint64_t v45 = *(void *)v53;
        while (2)
        {
          for (uint64_t k = 0; k != v43; ++k)
          {
            if (*(void *)v53 != v45) {
              objc_enumerationMutation(v41);
            }
            if (BWCaptureDevicePositionFromPortType(*(void **)(*((void *)&v52 + 1) + 8 * k)) == 1)
            {
              if (v44 > 0)
              {
                *((void *)v16 + 173) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
                goto LABEL_47;
              }
              int v44 = 1;
            }
          }
          uint64_t v43 = [v41 countByEnumeratingWithState:&v52 objects:v62 count:16];
          if (v43) {
            continue;
          }
          break;
        }
      }
    }
LABEL_47:
    *((void *)v16 + 192) = 0;
    if (FigVirtualCaptureCardGetSingleton()) {
      FigDebugAssert3();
    }
  }
  return (BWQuickTimeMovieFileSinkNode *)v16;
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

- (BWQuickTimeMovieFileSinkNode)initWithSinkID:(id)a3
{
  return [(BWQuickTimeMovieFileSinkNode *)self initWithNumberOfVideoInputs:1 numberOfAuxiliaryPictureInputs:0 numberOfAudioInputs:0 numberOfMetadataInputs:0 cameraInfoByPortType:0 pipelineIndex:0 sinkID:a3];
}

- (void)dealloc
{
  free(self->_parentPath);
  if (self->_formatWriter)
  {
    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterRemoveObserver(LocalCenter, self, 0, self->_formatWriter);
    uint64_t FigBaseObject = FigFormatWriterGetFigBaseObject();
    if (FigBaseObject)
    {
      uint64_t v6 = FigBaseObject;
      uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 8);
      uint64_t v8 = v7 ? v7 : 0;
      unint64_t v9 = *(void (**)(uint64_t))(v8 + 24);
      if (v9) {
        v9(v6);
      }
    }
    formatWriter = self->_formatWriter;
    if (formatWriter)
    {
      CFRelease(formatWriter);
      self->_formatWriter = 0;
    }
  }
  byteStream = self->_byteStream;
  if (byteStream)
  {
    CFRelease(byteStream);
    self->_byteStream = 0;
  }
  free(self->_trackIDs);

  thumbnailSurface = self->_thumbnailSurface;
  if (thumbnailSurface) {
    CFRelease(thumbnailSurface);
  }
  if (self->_irisMovieProcessingSuspended)
  {
    uint64_t v17 = v2;
    LODWORD(v15) = 0;
    FigDebugAssert3();
  }
  if ([(NSMutableArray *)self->_flushingIrisMovieGenerators count])
  {
    uint64_t v18 = v2;
    LODWORD(v16) = 0;
    FigDebugAssert3();
  }
  irisMovieGenerator = self->_irisMovieGenerator;
  if (irisMovieGenerator)
  {
    uint64_t v18 = v2;
    LODWORD(v16) = 0;
    FigDebugAssert3();
    irisMovieGenerator = self->_irisMovieGenerator;
  }

  free(self->_smallestWrittenPTSs);
  free(self->_largestWrittenPTSs);
  free(self->_largestWrittenVideoDTSs);
  free(self->_secondLargestWrittenAudioVideoPTSs);
  free(self->_lastWrittenAudioVideoDurations);
  free(self->_expectingToSeeSamplesForInput);
  free(self->_haveSeenSamplesForTrack);
  free(self->_finalDurationNeedsToBeWrittenForTrack);
  -[BWQuickTimeMovieFileSinkNode _clearProvidedTrackFormatDescriptions]((uint64_t)self);
  free(self->_providedTrackFormatDescriptions);
  free(self->_debugABL);
  FigSimpleMutexDestroy();

  self->_virtualCaptureCard = 0;
  movieSegmentMetadataFormatDescription = self->_movieSegmentMetadataFormatDescription;
  if (movieSegmentMetadataFormatDescription) {
    CFRelease(movieSegmentMetadataFormatDescription);
  }
  v19.receiver = self;
  v19.super_class = (Class)BWQuickTimeMovieFileSinkNode;
  [(BWSinkNode *)&v19 dealloc];
}

- (void)_clearProvidedTrackFormatDescriptions
{
  if (a1 && *(void *)(a1 + 552))
  {
    unint64_t v2 = 0;
    do
    {
      v3 = *(const void **)(*(void *)(a1 + 640) + 8 * v2);
      if (v3)
      {
        CFRelease(v3);
        *(void *)(*(void *)(a1 + 640) + 8 * v2) = 0;
      }
      ++v2;
    }
    while (v2 < *(void *)(a1 + 552));
  }
}

- (id)nodeSubType
{
  return @"QuickTimeMovie";
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  self->_gmLoggingPreamble = (NSString *)objc_msgSend([NSString alloc], "initWithFormat:", @"%p", self);
  self->_limitedGMErrorLogger = [[BWLimitedGMErrorLogger alloc] initWithName:self->_gmLoggingPreamble maxLoggingCount:10];
  v3 = [[BWMovingWindowStats alloc] initWithWindowSize:128];
  self->_capturePipelineLatencyStats = v3;
  [(BWStats *)v3 setMultiplier:0.000001];
  [(BWStats *)self->_capturePipelineLatencyStats setUnitDesignator:@"ms"];
  v4.receiver = self;
  v4.super_class = (Class)BWQuickTimeMovieFileSinkNode;
  [(BWNode *)&v4 prepareForCurrentConfigurationToBecomeLive];
}

- (BOOL)irisSampleReferenceMoviesEnabled
{
  return self->_irisSampleReferenceMoviesEnabled;
}

- (id)irisMotionAnalysisRingBuffer
{
  return self->_irisMotionAnalysisRingBuffer;
}

- (id)irisStillImageMovieMetadataCache
{
  return self->_irisStillImageMovieMetadataCache;
}

- (id)videoOrientationTimeMachine
{
  return self->_videoOrientationTimeMachine;
}

- (void)setupOverCaptureQualityMetricsForLivePhotoHistory:(int)a3
{
  self->_overCaptureQualityMetadataRingBuffer = [[BWObjectRingBufferThreadSafe alloc] initWithCapacity:*(void *)&a3];
  self->_overCaptureQualityMetrics = objc_alloc_init(BWVideoQualityMetrics);
}

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  v5.receiver = self;
  v5.super_class = (Class)BWQuickTimeMovieFileSinkNode;
  [(BWSinkNode *)&v5 configurationWithID:a3 updatedFormat:a4 didBecomeLiveForInput:a5];
}

- (void)didReachEndOfDataForInput:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if ([(BWNode *)self allInputsHaveReachedState:0])
  {
    unsigned int recordingState = self->_recordingState;
    if (recordingState <= 6)
    {
      if (((1 << recordingState) & 0x76) != 0)
      {
        -[BWQuickTimeMovieFileSinkNode _doEndRecordingAtTime:earlyTerminationErrCode:]((uint64_t)self, MEMORY[0x1E4F1F9F8], 4294950882);
      }
      else if (self->_firstIrisMovieInfo)
      {
        uint64_t v6 = [(BWFileSinkNode *)self recordingStatusDelegate];
        if (v6)
        {
          uint64_t v7 = v6;
          [(BWIrisMovieInfo *)self->_firstIrisMovieInfo setMasterMovieURL:0];
          if (dword_1EB4C5090)
          {
            int v23 = 0;
            os_log_type_t type = OS_LOG_TYPE_DEFAULT;
            os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          [(BWNodeFileWriterStatusDelegate *)v7 fileWriter:self writerPipelineIndex:self->_pipelineIndex stoppedRecordingSampleDataForSettingsID:[(FigCaptureRecordingSettings *)[(BWIrisMovieInfo *)self->_firstIrisMovieInfo settings] settingsID]];
          -[BWQuickTimeMovieFileSinkNode _initAnalyticsDataInIrisMovieInfo:]((uint64_t)self, self->_firstIrisMovieInfo);
          LOBYTE(v16) = 0;
          [(BWNodeFileWriterStatusDelegate *)v7 fileWriter:self writerPipelineIndex:self->_pipelineIndex stoppedRecordingForSettings:[(BWIrisMovieInfo *)self->_firstIrisMovieInfo settings] withError:4294950878 thumbnailSurface:0 irisMovieInfo:self->_firstIrisMovieInfo debugMetadataSidecarFileURL:0 recordingSucceeded:v16];
        }

        self->_firstIrisMovieInfo = 0;
      }
    }
    -[BWQuickTimeMovieFileSinkNode _finishIrisMovieGeneration]((uint64_t)self);
    self->_unsigned int recordingState = 0;
    [(BWLimitedGMErrorLogger *)self->_limitedGMErrorLogger resetCurrentLoggingCounter];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    stagingQueues = self->_stagingQueues;
    uint64_t v10 = [(NSArray *)stagingQueues countByEnumeratingWithState:&v18 objects:v24 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(stagingQueues);
          }
          [*(id *)(*((void *)&v18 + 1) + 8 * i) removeAllObjects];
        }
        uint64_t v11 = [(NSArray *)stagingQueues countByEnumeratingWithState:&v18 objects:v24 count:16];
      }
      while (v11);
    }

    self->_settings = 0;
    self->_currentRecordingStateSettingsID = 0;
    -[BWQuickTimeMovieFileSinkNode _clearProvidedTrackFormatDescriptions]((uint64_t)self);
  }
  v17.receiver = self;
  v17.super_class = (Class)BWQuickTimeMovieFileSinkNode;
  [(BWSinkNode *)&v17 didReachEndOfDataForInput:a3];
}

- (uint64_t)_initAnalyticsDataInIrisMovieInfo:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    objc_msgSend(a2, "setFileCoordinatorToWriterMovingWindowLatencyStats:", -[BWStats initWithStats:]([BWStats alloc], "initWithStats:", *(void *)(result + 960)));
    [a2 setMaxSystemPressureLevel:*(unsigned int *)(v3 + 1332)];
    [a2 setIrisSequenceAdjusterRecipeIdentifier:*(void *)(v3 + 1344)];
    [a2 setVideoFrameDurationStats:*(void *)(v3 + 1336)];
    uint64_t v4 = *(void *)(v3 + 912);
    return [a2 setNumberOfFramesDropped:v4];
  }
  return result;
}

- (void)_doEndRecordingAtTime:(uint64_t)a3 earlyTerminationErrCode:
{
  uint64_t v205 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  mach_absolute_time();
  objc_super v5 = &OBJC_IVAR___BWPreviewStitcherNode__wantWideFallbackDueToTeleAEAF;
  if (dword_1EB4C5090)
  {
    LODWORD(v196) = 0;
    type[0] = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend((id)objc_msgSend((id)a1, "recordingStatusDelegate", sampleTimingArray, v153), "fileWriter:writerPipelineIndex:stoppedRecordingSampleDataForSettingsID:", a1, *(void *)(a1 + 944), objc_msgSend(*(id *)(a1 + 400), "settingsID"));
  int v7 = [*(id *)(a1 + 400) isIrisRecording];
  if (v7) {
    BOOL v8 = *(void *)(a1 + 648) != 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (*(unsigned char *)(a1 + 714)) {
    BOOL v9 = *(unsigned char *)(a1 + 715) != 0;
  }
  else {
    BOOL v9 = 0;
  }
  if ([*(id *)(a1 + 400) isIrisMovieRecording]
    && *(void *)(a1 + 944)
    && (double v10 = *(double *)(a1 + 872), v10 != 0.0)
    && v10 < *(double *)(a1 + 880))
  {
    a3 = 4294951866;
    int v11 = 1;
  }
  else
  {
    int v11 = 0;
  }
  if (*(unsigned char *)(a1 + 716))
  {
    a3 = *(unsigned int *)(a1 + 720);
    int v11 = 1;
  }
  if (v8 && *(void *)(a1 + 944)) {
    v11 |= [*(id *)(a1 + 648) spatialOverCaptureExpected] ^ 1;
  }
  int v163 = !v8;
  BOOL v164 = v8;
  uint64_t v12 = &OBJC_IVAR___BWPreviewStitcherNode__wantWideFallbackDueToTeleAEAF;
  uint64_t v13 = *(void *)(a1 + 592);
  if ((v11 & 1) == 0 && v13)
  {
    unsigned int v159 = a3;
    BOOL v14 = v8;
    if (!*(unsigned char *)(a1 + 713)) {
      BOOL v14 = 0;
    }
    int v162 = v11;
    if (v14 && *(int *)(a1 + 688) >= 1)
    {
      uint64_t v15 = *(void **)(a1 + 648);
      if (v15) {
        [v15 movieStartTime];
      }
      else {
        memset(&time2, 0, sizeof(time2));
      }
      *(_OWORD *)&time.duration.value = *(_OWORD *)(a1 + 424);
      time.duration.CMTimeEpoch epoch = *(void *)(a1 + 440);
      if (CMTimeCompare(&time.duration, &time2))
      {
        uint64_t v154 = v169;
        LODWORD(sampleTimingArraya) = 0;
        FigDebugAssert3();
      }
      id v16 = *(id *)(a1 + 888);
      if (v16)
      {
        id v16 = (id)objc_msgSend(v16, "copyAndClearStillImageTransformDataForSettingsID:", objc_msgSend(*(id *)(a1 + 648), "livePhotoMetadataStillImageKeyFrameSettingsID"));
        if (!v16)
        {
          LODWORD(v196) = 0;
          type[0] = OS_LOG_TYPE_DEFAULT;
          objc_super v17 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
          id v16 = (id)[MEMORY[0x1E4F1C9B8] data];
        }
      }
      long long v18 = *(void **)(a1 + 648);
      if (v18) {
        [v18 stillImageCaptureTime];
      }
      else {
        memset(&v198, 0, sizeof(v198));
      }
      int v19 = -[BWQuickTimeMovieFileSinkNode _writeStillImageTimeMetadataSampleForCaptureTime:stillImageTransformData:referenceDimensions:toTrackWithID:usingTrackTimeScale:](a1, &v198, v16, *(void *)(a1 + 896), *(unsigned int *)(a1 + 688), *(_DWORD *)(a1 + 692));
      if (v19)
      {
        uint64_t v154 = v169;
        LODWORD(sampleTimingArraya) = v19;
        FigDebugAssert3();
      }
    }
    int v158 = v7;
    int v20 = v7 & v163;
    long long v196 = 0uLL;
    CMTimeEpoch v197 = 0;
    *(_OWORD *)&time.duration.value = *(_OWORD *)&a2->value;
    time.duration.CMTimeEpoch epoch = a2->epoch;
    [(BWQuickTimeMovieFileSinkNode *)(CMTime *)a1 _finalizeAudioVideoDurationsAndFindWrittenEndingPTSFromEndingPTS:(uint64_t)&v196];
    memset(type, 0, sizeof(type));
    CMTimeEpoch v195 = 0;
    *(_OWORD *)&time.duration.value = *(_OWORD *)&a2->value;
    time.duration.CMTimeEpoch epoch = a2->epoch;
    [(BWQuickTimeMovieFileSinkNode *)a1 _validatedEndingPTSFromEndingPTS:(uint64_t)type];
    long long v21 = &OBJC_IVAR___BWPreviewStitcherNode__wantWideFallbackDueToTeleAEAF;
    if (!*(unsigned char *)(a1 + 713) || (BYTE12(v196) & 1) == 0) {
      goto LABEL_45;
    }
    v22 = &OBJC_IVAR___BWPreviewStitcherNode__wantWideFallbackDueToTeleAEAF;
    if (*(unsigned char *)(a1 + 1596))
    {
      *(_OWORD *)&time.duration.value = *(_OWORD *)(a1 + 1584);
      time.duration.CMTimeEpoch epoch = *(void *)(a1 + 1600);
      -[BWQuickTimeMovieFileSinkNode _writeMovieSegmentMetadataForSegmentStartPTS:segmentDuration:](a1, (long long *)&time.duration.value, MEMORY[0x1E4F1F9F8]);
      *(unsigned char *)(*(void *)(a1 + 632) + *(void *)(a1 + 1576)) = 1;
    }
    if (!(*(void *)(a1 + 560) + *(void *)(a1 + 552)))
    {
LABEL_45:
      if (*(unsigned char *)(a1 + 713))
      {
        char v23 = (type[12] & 1) != 0 ? v20 : 1;
        if ((v23 & 1) == 0)
        {
          memset(&rhs, 0, sizeof(rhs));
          int32_t v24 = *(_DWORD *)(a1 + 376);
          *(_OWORD *)&time.duration.value = *(_OWORD *)type;
          time.duration.CMTimeEpoch epoch = v195;
          CMTimeConvertScale(&rhs, &time.duration, v24, kCMTimeRoundingMethod_RoundTowardZero);
          uint64_t v25 = *(void *)(a1 + v21[379]);
          CMTime v193 = rhs;
          uint64_t v26 = *(void *)(CMBaseObjectGetVTable() + 16);
          if (v26) {
            uint64_t v27 = v26;
          }
          else {
            uint64_t v27 = 0;
          }
          v41 = *(uint64_t (**)(uint64_t, CMSampleTimingInfo *))(v27 + 64);
          if (v41)
          {
            time.duration = v193;
            int v42 = v41(v25, &time);
            if (!v42) {
              goto LABEL_75;
            }
          }
          else
          {
            int v42 = -12782;
          }
          uint64_t v154 = v169;
          LODWORD(sampleTimingArraya) = v42;
          FigDebugAssert3();
        }
      }
LABEL_75:
      LocalCenter = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterRemoveObserver(LocalCenter, (const void *)a1, 0, *(const void **)(a1 + v21[379]));
      uint64_t v44 = *(void *)(a1 + v21[379]);
      uint64_t v45 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v45) {
        uint64_t v46 = v45;
      }
      else {
        uint64_t v46 = 0;
      }
      v47 = *(uint64_t (**)(uint64_t, void))(v46 + 40);
      objc_super v5 = &OBJC_IVAR___BWPreviewStitcherNode__wantWideFallbackDueToTeleAEAF;
      a3 = v159;
      if (v47)
      {
        int v48 = v47(v44, 0);
        if (!v48) {
          goto LABEL_83;
        }
      }
      else
      {
        int v48 = -12782;
      }
      uint64_t v154 = v169;
      LODWORD(sampleTimingArraya) = v48;
      FigDebugAssert3();
LABEL_83:
      if (v164 && [*(id *)(a1 + 648) containsTrims])
      {
        uint64_t v49 = BWTrackEditListArrayForRegularTrackInIrisTrimmedMovie(*(void **)(a1 + 648));
        if (*(void *)(a1 + 552))
        {
          uint64_t v50 = v49;
          unint64_t v51 = 0;
          uint64_t v52 = *MEMORY[0x1E4F32DC8];
          do
          {
            if (*(unsigned char *)(*(void *)(a1 + 616) + v51))
            {
              uint64_t v53 = *(void *)(a1 + v21[379]);
              uint64_t v54 = *(unsigned int *)(*(void *)(a1 + 608) + 4 * v51);
              uint64_t v55 = *(void *)(CMBaseObjectGetVTable() + 16);
              if (v55) {
                uint64_t v56 = v55;
              }
              else {
                uint64_t v56 = 0;
              }
              long long v57 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v56 + 24);
              if (!v57)
              {
                int v58 = -12782;
LABEL_95:
                uint64_t v154 = v169;
                LODWORD(sampleTimingArraya) = v58;
                FigDebugAssert3();
                long long v21 = &OBJC_IVAR___BWPreviewStitcherNode__wantWideFallbackDueToTeleAEAF;
                goto LABEL_96;
              }
              int v58 = v57(v53, v54, v52, v50);
              long long v21 = &OBJC_IVAR___BWPreviewStitcherNode__wantWideFallbackDueToTeleAEAF;
              if (v58) {
                goto LABEL_95;
              }
            }
LABEL_96:
            ++v51;
          }
          while (v51 < *(void *)(a1 + 552));
        }
        objc_super v5 = &OBJC_IVAR___BWPreviewStitcherNode__wantWideFallbackDueToTeleAEAF;
        a3 = v159;
        if (*(_DWORD *)(a1 + 688))
        {
          uint64_t v59 = BWTrackEditListArrayForStillImageDisplayTimeTrackInIrisTrimmedMovie(*(void **)(a1 + 648), *(_DWORD *)(a1 + 692));
          uint64_t v60 = *(void *)(a1 + v21[379]);
          uint64_t v61 = *(unsigned int *)(a1 + 688);
          uint64_t v62 = *(void *)(CMBaseObjectGetVTable() + 16);
          if (v62) {
            uint64_t v63 = v62;
          }
          else {
            uint64_t v63 = 0;
          }
          uint64_t v64 = *(uint64_t (**)(uint64_t, uint64_t, void, uint64_t))(v63 + 24);
          if (v64)
          {
            int v65 = v64(v60, v61, *MEMORY[0x1E4F32DC8], v59);
            if (!v65) {
              goto LABEL_106;
            }
          }
          else
          {
            int v65 = -12782;
          }
          uint64_t v154 = v169;
          LODWORD(sampleTimingArraya) = v65;
          FigDebugAssert3();
        }
      }
LABEL_106:
      uint64_t v66 = *(void *)(a1 + v21[379]);
      uint64_t v67 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v67) {
        uint64_t v68 = v67;
      }
      else {
        uint64_t v68 = 0;
      }
      v69 = *(uint64_t (**)(uint64_t, void))(v68 + 48);
      if (v69)
      {
        int v70 = v69(v66, 0);
        if (!v70)
        {
LABEL_114:
          v71 = (long long *)MEMORY[0x1E4F1F9F8];
          uint64_t v72 = -[BWQuickTimeMovieFileSinkNode _getCurrentFileSize:currentHostTime:](a1, 1, MEMORY[0x1E4F1F9F8]);
          CMTime v193 = *(CMTime *)(a1 + 232);
          if (*(unsigned char *)(a1 + 436) & 1) != 0 && (type[12])
          {
            *(_OWORD *)&time.duration.value = *(_OWORD *)type;
            time.duration.CMTimeEpoch epoch = v195;
            CMTime rhs = *(CMTime *)(a1 + 424);
            if (CMTimeCompare(&time.duration, &rhs) >= 1)
            {
              *(_OWORD *)&time.duration.value = *(_OWORD *)type;
              time.duration.CMTimeEpoch epoch = v195;
              CMTime rhs = *(CMTime *)(a1 + 424);
              CMTimeSubtract(&v188, &time.duration, &rhs);
              CMTimeConvertScale(&v193, &v188, *(_DWORD *)(a1 + 376), kCMTimeRoundingMethod_RoundHalfAwayFromZero);
            }
          }
          pthread_mutex_lock(*(pthread_mutex_t **)(a1 + 824));
          *(void *)(a1 + 176) = v72;
          *(CMTime *)(a1 + 232) = v193;
          pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + 824));
          uint64_t v73 = *(void *)(a1 + 728);
          if (v73)
          {
            v74 = *(long long **)(a1 + 448);
            long long v191 = *v74;
            CMTimeEpoch v192 = *((void *)v74 + 2);
            v75 = *(long long **)(a1 + 456);
            long long v189 = *v75;
            CMTimeEpoch v190 = *((void *)v75 + 2);
            uint64_t v76 = *(void *)(a1 + 480);
            *(_OWORD *)target = *(_OWORD *)v76;
            CMTimeEpoch v187 = *(void *)(v76 + 16);
            v77 = *(long long **)(a1 + 464);
            long long v184 = *v77;
            CMTimeEpoch v78 = *((void *)v77 + 2);
          }
          else
          {
            long long v191 = *v71;
            CMTimeEpoch v78 = *((void *)v71 + 2);
            CMTimeEpoch v192 = v78;
            long long v189 = v191;
            CMTimeEpoch v190 = v78;
            *(_OWORD *)target = v191;
            CMTimeEpoch v187 = v78;
            long long v184 = v191;
          }
          CMTimeEpoch v185 = v78;
          if (*(void *)(a1 + 744))
          {
            uint64_t v79 = 3 * v73;
            uint64_t v80 = *(void *)(a1 + 448) + 8 * v79;
            long long v182 = *(_OWORD *)v80;
            uint64_t v183 = *(void *)(v80 + 16);
            uint64_t v81 = *(void *)(a1 + 456) + 8 * v79;
            long long v180 = *(_OWORD *)v81;
            uint64_t v82 = *(void *)(a1 + 480);
            uint64_t v181 = *(void *)(v81 + 16);
            v83 = (long long *)(v82 + 8 * v79);
            long long v178 = *v83;
            uint64_t v84 = *((void *)v83 + 2);
          }
          else
          {
            long long v182 = *v71;
            uint64_t v84 = *((void *)v71 + 2);
            uint64_t v183 = v84;
            long long v180 = v182;
            uint64_t v181 = v84;
            long long v178 = v182;
          }
          uint64_t v179 = v84;
          int v11 = v162;
          memset(v177, 0, sizeof(v177));
          [(BWQuickTimeMovieFileSinkNode *)a1 _findWrittenStartingPTS];
          if (!dword_1EB4C5090) {
            goto LABEL_132;
          }
          int v176 = 0;
          os_log_type_t v175 = OS_LOG_TYPE_DEFAULT;
          v85 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
          int v86 = dword_1EB4C5090;
          int v11 = v162;
          if (*(void *)(a1 + 968))
          {
            if (!dword_1EB4C5090
              || (int v176 = 0,
                  os_log_type_t v175 = OS_LOG_TYPE_DEFAULT,
                  v87 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(),
                  os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT),
                  fig_log_call_emit_and_clean_up_after_send_and_compose(),
                  int v11 = v162,
                  !dword_1EB4C5090))
            {
LABEL_132:
              uint64_t v12 = &OBJC_IVAR___BWPreviewStitcherNode__wantWideFallbackDueToTeleAEAF;
              uint64_t v13 = *(void *)(a1 + 592);
              BOOL v9 = 1;
              int v7 = v158;
              goto LABEL_133;
            }
            int v176 = 0;
            os_log_type_t v175 = OS_LOG_TYPE_DEFAULT;
            v88 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
            int v86 = dword_1EB4C5090;
            int v11 = v162;
          }
          if (v86)
          {
            int v176 = 0;
            os_log_type_t v175 = OS_LOG_TYPE_DEFAULT;
            v89 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
            int v11 = v162;
            if (dword_1EB4C5090)
            {
              int v176 = 0;
              os_log_type_t v175 = OS_LOG_TYPE_DEFAULT;
              v90 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT);
              fig_log_call_emit_and_clean_up_after_send_and_compose();
              int v11 = v162;
            }
          }
          goto LABEL_132;
        }
      }
      else
      {
        int v70 = -12782;
      }
      uint64_t v154 = v169;
      LODWORD(sampleTimingArraya) = v70;
      FigDebugAssert3();
      goto LABEL_114;
    }
    unint64_t v28 = 0;
    CFAllocatorRef v161 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFStringRef v157 = (const __CFString *)*MEMORY[0x1E4F1F270];
    uint64_t v29 = 12;
    uint64_t v30 = MEMORY[0x1E4F1FA70];
    v156 = (const void *)*MEMORY[0x1E4F1CFD0];
    while (1)
    {
      if ((*(unsigned char *)(*(void *)(a1 + 456) + v29) & 1) == 0) {
        goto LABEL_67;
      }
      target[0] = 0;
      long long v31 = *(_OWORD *)(v30 + 48);
      *(_OWORD *)&time.presentationTimeStamp.timescale = *(_OWORD *)(v30 + 32);
      *(_OWORD *)&time.decodeTimeStamp.value = v31;
      time.decodeTimeStamp.CMTimeEpoch epoch = *(void *)(v30 + 64);
      long long v32 = *(_OWORD *)(v30 + 16);
      *(_OWORD *)&time.duration.value = *(_OWORD *)v30;
      *(_OWORD *)&time.duration.CMTimeEpoch epoch = v32;
      CMTime v193 = *a2;
      long long v191 = v196;
      CMTimeEpoch v192 = v197;
      long long v189 = *(_OWORD *)type;
      CMTimeEpoch v190 = v195;
      [(BWQuickTimeMovieFileSinkNode *)a1 _endingPTSForTrack:(uint64_t)&v193 endingPTS:(uint64_t)&v191 writtenEndingPTS:(uint64_t)&v189 validatedEndingPTS:v20 isIrisMasterMovie:(uint64_t)&rhs];
      time.presentationTimeStamp = rhs;
      time.decodeTimeStamp = rhs;
      OSStatus v33 = CMSampleBufferCreate(v161, 0, 1u, 0, 0, 0, 0, 1, &time, 0, 0, (CMSampleBufferRef *)target);
      if (v33)
      {
        uint64_t v154 = v169;
        LODWORD(sampleTimingArraya) = v33;
        FigDebugAssert3();
      }
      if (!target[0]) {
        goto LABEL_67;
      }
      CMSetAttachment(target[0], v157, v156, 1u);
      if (*(unsigned char *)(*(void *)(a1 + v22[314]) + v28))
      {
        uint64_t v34 = *(void *)(a1 + v21[379]);
        uint64_t v35 = *(unsigned int *)(*(void *)(a1 + 608) + 4 * v28);
        CMAttachmentBearerRef v36 = target[0];
        uint64_t v37 = *(void *)(CMBaseObjectGetVTable() + 16);
        if (v37) {
          uint64_t v38 = v37;
        }
        else {
          uint64_t v38 = 0;
        }
        double v39 = *(uint64_t (**)(uint64_t, uint64_t, CMAttachmentBearerRef))(v38 + 32);
        if (!v39)
        {
          int v40 = -12782;
LABEL_65:
          uint64_t v154 = v169;
          LODWORD(sampleTimingArraya) = v40;
          FigDebugAssert3();
          long long v21 = &OBJC_IVAR___BWPreviewStitcherNode__wantWideFallbackDueToTeleAEAF;
          v22 = &OBJC_IVAR___BWPreviewStitcherNode__wantWideFallbackDueToTeleAEAF;
          goto LABEL_66;
        }
        int v40 = v39(v34, v35, v36);
        long long v21 = &OBJC_IVAR___BWPreviewStitcherNode__wantWideFallbackDueToTeleAEAF;
        v22 = &OBJC_IVAR___BWPreviewStitcherNode__wantWideFallbackDueToTeleAEAF;
        if (v40) {
          goto LABEL_65;
        }
      }
LABEL_66:
      CFRelease(target[0]);
LABEL_67:
      ++v28;
      v29 += 24;
      if (v28 >= *(void *)(a1 + 560) + *(void *)(a1 + 552)) {
        goto LABEL_45;
      }
    }
  }
LABEL_133:
  if (!v13) {
    goto LABEL_146;
  }
  if (v11)
  {
    v91 = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterRemoveObserver(v91, (const void *)a1, 0, *(const void **)(a1 + 592));
  }
  uint64_t FigBaseObject = FigFormatWriterGetFigBaseObject();
  if (!FigBaseObject)
  {
    int v96 = -12780;
LABEL_145:
    uint64_t v154 = v169;
    LODWORD(sampleTimingArraya) = v96;
    FigDebugAssert3();
    goto LABEL_146;
  }
  uint64_t v93 = FigBaseObject;
  uint64_t v94 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v94) {
    uint64_t v95 = v94;
  }
  else {
    uint64_t v95 = 0;
  }
  v97 = *(uint64_t (**)(uint64_t))(v95 + 24);
  if (!v97)
  {
    int v96 = -12782;
    goto LABEL_145;
  }
  int v96 = v97(v93);
  if (v96) {
    goto LABEL_145;
  }
LABEL_146:
  if (*(void *)(a1 + 1536) && [*(id *)(a1 + v5[368]) usesVirtualCaptureCard])
  {
    uint64_t v98 = *(void *)(a1 + 1536);
    v99 = *(uint64_t (**)(uint64_t))(*(void *)(CMBaseObjectGetVTable() + 16) + 24);
    if (v99)
    {
      int v100 = v99(v98);
      if (!v100) {
        goto LABEL_153;
      }
    }
    else
    {
      int v100 = -12782;
    }
    uint64_t v154 = v169;
    LODWORD(sampleTimingArraya) = v100;
    FigDebugAssert3();
  }
LABEL_153:
  -[BWQuickTimeMovieFileSinkNode _updateMovieFileMemoryAnalytics]((unsigned __int8 *)a1);
  if (v11)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "removeItemAtURL:error:", objc_msgSend(*(id *)(a1 + v5[368]), "outputURL"), 0);
    BOOL v9 = 0;
    goto LABEL_196;
  }
  if (*(void *)(a1 + 592))
  {
    if ((v7 ^ 1 | v164) != 1)
    {
LABEL_190:
      if (*(unsigned char *)(a1 + 713))
      {
        uint64_t v115 = *(void *)(a1 + 552);
        if (v115)
        {
          v116 = *(void **)(a1 + 640);
          while (!*v116)
          {
            ++v116;
            if (!--v115) {
              goto LABEL_199;
            }
          }
          -[BWQuickTimeMovieFileSinkNode _updateTrackFormatDescriptionsAtURL:]((void *)a1, [*(id *)(a1 + v5[368]) outputURL]);
        }
      }
LABEL_199:
      if (((v7 ^ 1 | v163) & 1) == 0)
      {
        v117 = (void *)[*(id *)(a1 + 648) masterMovieURL];
        v118 = (void *)[*(id *)(a1 + v5[368]) outputURL];
        v119 = (void *)[*(id *)(a1 + 648) outputMovieURL];
        if ([v117 isEqual:v118])
        {
          if (([v118 isEqual:v119] & 1) == 0)
          {
            BOOL v167 = v9;
            *(void *)&long long v196 = 0;
            MetadataSidecarFileURL = FigCaptureMetadataUtilitiesCreateMetadataSidecarFileURL(v118);
            v121 = FigCaptureMetadataUtilitiesCreateMetadataSidecarFileURL(v119);
            objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "moveItemAtURL:toURL:error:", MetadataSidecarFileURL, v121, &v196);

            *(void *)&long long v196 = 0;
            objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "moveItemAtURL:toURL:error:", v118, v119, &v196);
            [*(id *)(a1 + 648) setMasterMovieURL:0];
            [*(id *)(a1 + 648) setTemporaryMovieURL:0];
            memset(&time, 0, 24);
            v122 = *(void **)(a1 + 648);
            if (v122) {
              [v122 movieStartTime];
            }
            else {
              memset(&lhs, 0, sizeof(lhs));
            }
            CMTime rhs = *(CMTime *)(a1 + 232);
            CMTimeAdd(&time.duration, &lhs, &rhs);
            BOOL v9 = v167;
            if (([*(id *)(a1 + 648) containsTrims] & 1) == 0)
            {
              long long v172 = *(_OWORD *)&time.duration.value;
              CMTimeEpoch epoch = time.duration.epoch;
              [*(id *)(a1 + 648) setMovieTrimEndTime:&v172];
            }
            long long v170 = *(_OWORD *)&time.duration.value;
            CMTimeEpoch v171 = time.duration.epoch;
            objc_msgSend(*(id *)(a1 + 648), "setMovieEndTime:", &v170, sampleTimingArraya, v154);
          }
        }
      }
      if ((v7 & 1) == 0)
      {
        uint64_t v12 = &OBJC_IVAR___BWPreviewStitcherNode__wantWideFallbackDueToTeleAEAF;
        if (!*(void *)(a1 + 944)) {
          -[BWQuickTimeMovieFileSinkNode _submitMovieFileCoreAnalyticsEvent](a1);
        }
        goto LABEL_233;
      }
      uint64_t v12 = &OBJC_IVAR___BWPreviewStitcherNode__wantWideFallbackDueToTeleAEAF;
      goto LABEL_210;
    }
    BOOL v166 = v9;
    v101 = (void *)[(id)a1 movieLevelMetadata];
    id MovieLevelMetadataWithSpatialAggressorsSeenMetadata = v101;
    if (*(unsigned char *)(a1 + 1492))
    {
      id MovieLevelMetadataWithSpatialAggressorsSeenMetadata = (id)FigCaptureMetadataUtilitiesCreateMovieLevelMetadataWithSpatialAggressorsSeenMetadata(v101, *(_DWORD *)(a1 + 1496) > 1u);
      id v103 = MovieLevelMetadataWithSpatialAggressorsSeenMetadata;
    }
    if (v164)
    {
      if ([*(id *)(a1 + 648) isVitalityScoreValid])
      {
        uint64_t v104 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 648), "settings"), "movieLevelMetadata");
        if (*(void *)(a1 + 944)
          && objc_msgSend((id)objc_msgSend(*(id *)(a1 + 648), "settings"), "spatialOverCaptureMovieURL"))
        {
          uint64_t v104 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 648), "settings"), "spatialOverCaptureMovieLevelMetadata");
        }
        if ((objc_msgSend(MovieLevelMetadataWithSpatialAggressorsSeenMetadata, "isEqual:", v104, sampleTimingArraya, v154) & 1) == 0)-[BWQuickTimeMovieFileSinkNode _doEndRecordingAtTime:earlyTerminationErrCode:](); {
        -[BWQuickTimeMovieFileSinkNode _fixVitalityScoreWithMotionAnalysis:](a1, *(void **)(a1 + 648));
        }
        [*(id *)(a1 + 648) vitalityScore];
        id MovieLevelMetadataWithSpatialAggressorsSeenMetadata = (id)FigCaptureMetadataUtilitiesCreateMovieLevelMetadataWithVitalityScore(MovieLevelMetadataWithSpatialAggressorsSeenMetadata, [*(id *)(a1 + 648) vitalityScoringVersion], v105);
      }
      if (*(void *)(a1 + 888)) {
        id MovieLevelMetadataWithSpatialAggressorsSeenMetadata = (id)FigCaptureMetadataUtilitiesCreateMovieLevelMetadataWithVitalityDisabledIfRequired(MovieLevelMetadataWithSpatialAggressorsSeenMetadata);
      }
      if (objc_msgSend(*(id *)(a1 + 648), "limitStillImageTransformDuringVitalityPlayback", sampleTimingArraya))id MovieLevelMetadataWithSpatialAggressorsSeenMetadata = (id)FigCaptureMetadataUtilitiesCreateMovieLevelMetadataWithLimitStillImageTransformFlagIfRequired(MovieLevelMetadataWithSpatialAggressorsSeenMetadata); {
      if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 648), "subjectRelightingResult"), "relightingRequired"))
      }
      {
        objc_msgSend((id)objc_msgSend(*(id *)(a1 + 648), "subjectRelightingResult"), "curveParameter");
        id MovieLevelMetadataWithSpatialAggressorsSeenMetadata = (id)FigCaptureMetadataUtilitiesCreateMovieLevelMetadataWithSubjectRelightingAppliedCurveParameter(MovieLevelMetadataWithSpatialAggressorsSeenMetadata, v106);
      }
      int has_internal_diagnostics = os_variant_has_internal_diagnostics();
      if (*(void *)(a1 + 848))
      {
        int v108 = *(void *)(a1 + 840) ? has_internal_diagnostics : 0;
        if (v108 == 1) {
          -[BWQuickTimeMovieFileSinkNode _computeTransitionVitalityScore:](a1, *(void **)(a1 + 648));
        }
      }
      if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 648), "stillImageRequestSettings"), "smartStyle")) {
        id MovieLevelMetadataWithSpatialAggressorsSeenMetadata = (id)FigCaptureMetadataUtilitiesCreateMovieLevelMetadataWithSmartStyleMetadata(MovieLevelMetadataWithSpatialAggressorsSeenMetadata, objc_msgSend((id)objc_msgSend(*(id *)(a1 + 648), "stillImageRequestSettings"), "smartStyle"), objc_msgSend((id)objc_msgSend(*(id *)(a1 + 648), "settings"), "smartStyleRenderingBypassed"));
      }
    }
    v109 = *(void **)(a1 + 864);
    if (v109)
    {
      [v109 computeQualityScore];
      float v111 = v110;
      id MovieLevelMetadataWithSpatialAggressorsSeenMetadata = (id)FigCaptureMetadataUtilitiesCreateMovieLevelMetadataWithSpatialOverCaptureQualityScore(MovieLevelMetadataWithSpatialAggressorsSeenMetadata, [*(id *)(a1 + 864) qualityScoringVersion], v111);
    }
    if (MovieLevelMetadataWithSpatialAggressorsSeenMetadata
      && (objc_msgSend(MovieLevelMetadataWithSpatialAggressorsSeenMetadata, "isEqual:", objc_msgSend(*(id *)(a1 + v5[368]), "movieLevelMetadata")) & 1) == 0)
    {
      v112 = (const void *)FigMetadataRewriterDictionaryCreateFromFigMetadataPropertyArray();
      [*(id *)(a1 + v5[368]) outputURL];
      int v113 = FigRewriteMetadata();
      if (v113)
      {
        uint64_t v154 = v169;
        LODWORD(sampleTimingArraya) = v113;
        FigDebugAssert3();
        if (!v112) {
          goto LABEL_187;
        }
        goto LABEL_186;
      }
      if (v112) {
LABEL_186:
      }
        CFRelease(v112);
    }
LABEL_187:
    BOOL v9 = v166;
    if (*(unsigned char *)(a1 + 714))
    {
      [*(id *)(a1 + v5[368]) outputURL];
      int v114 = FigConsolidateMovieFragments();
      if (v114)
      {
        uint64_t v154 = v169;
        LODWORD(sampleTimingArraya) = v114;
        FigDebugAssert3();
      }
    }
    goto LABEL_190;
  }
LABEL_196:
  if (!v7)
  {
LABEL_233:
    id v123 = 0;
    goto LABEL_234;
  }
LABEL_210:
  if (v164)
  {
    id v123 = *(id *)(a1 + 648);

    *(void *)(a1 + 648) = 0;
  }
  else
  {
    v124 = *(void **)(a1 + 664);
    if (v124)
    {
      id v125 = v124;
      v126 = &OBJC_IVAR___BWPreviewStitcherNode__wantWideFallbackDueToTeleAEAF;
      pthread_mutex_lock(*(pthread_mutex_t **)(a1 + 824));
      [*(id *)(a1 + 672) addObject:*(void *)(a1 + 664)];
      BOOL v168 = v9;
      if (dword_1EB4C5090)
      {
        unsigned int v160 = a3;
        LODWORD(v196) = 0;
        type[0] = OS_LOG_TYPE_DEFAULT;
        v127 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        unsigned int v128 = v196;
        if (os_log_type_enabled(v127, type[0])) {
          unsigned int v129 = v128;
        }
        else {
          unsigned int v129 = v128 & 0xFFFFFFFE;
        }
        if (v129)
        {
          uint64_t v130 = *(void *)(a1 + 992);
          uint64_t v131 = *(void *)(a1 + 664);
          int v132 = [*(id *)(a1 + 672) count];
          LODWORD(rhs.value) = 136315906;
          *(CMTimeValue *)((char *)&rhs.value + 4) = (CMTimeValue)"-[BWQuickTimeMovieFileSinkNode _doEndRecordingAtTime:e"
                                                                  "arlyTerminationErrCode:]";
          LOWORD(rhs.flags) = 2112;
          *(void *)((char *)&rhs.flags + 2) = v130;
          HIWORD(rhs.epoch) = 2048;
          uint64_t v202 = v131;
          v126 = &OBJC_IVAR___BWPreviewStitcherNode__wantWideFallbackDueToTeleAEAF;
          __int16 v203 = 1024;
          int v204 = v132;
          LODWORD(v154) = 38;
          sampleTimingArraya = (CMSampleTimingInfo *)&rhs;
          _os_log_send_and_compose_impl();
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        a3 = v160;
        uint64_t v12 = &OBJC_IVAR___BWPreviewStitcherNode__wantWideFallbackDueToTeleAEAF;
        BOOL v9 = v168;
      }

      *(void *)(a1 + 664) = 0;
      pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + v126[337]));
      objc_super v5 = &OBJC_IVAR___BWPreviewStitcherNode__wantWideFallbackDueToTeleAEAF;
      if ([v125 flushAsync])
      {
        pthread_mutex_lock(*(pthread_mutex_t **)(a1 + v126[337]));
        [*(id *)(a1 + 672) removeObjectIdenticalTo:v125];
        if (dword_1EB4C5090)
        {
          uint64_t v133 = a3;
          LODWORD(v196) = 0;
          type[0] = OS_LOG_TYPE_DEFAULT;
          v134 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          unsigned int v135 = v196;
          if (os_log_type_enabled(v134, type[0])) {
            unsigned int v136 = v135;
          }
          else {
            unsigned int v136 = v135 & 0xFFFFFFFE;
          }
          if (v136)
          {
            uint64_t v137 = *(void *)(a1 + 992);
            int v138 = [*(id *)(a1 + 672) count];
            LODWORD(rhs.value) = 136315906;
            *(CMTimeValue *)((char *)&rhs.value + 4) = (CMTimeValue)"-[BWQuickTimeMovieFileSinkNode _doEndRecordingAtTime"
                                                                    ":earlyTerminationErrCode:]";
            LOWORD(rhs.flags) = 2112;
            *(void *)((char *)&rhs.flags + 2) = v137;
            HIWORD(rhs.epoch) = 2048;
            uint64_t v202 = (uint64_t)v125;
            __int16 v203 = 1024;
            int v204 = v138;
            LODWORD(v154) = 38;
            sampleTimingArraya = (CMSampleTimingInfo *)&rhs;
            _os_log_send_and_compose_impl();
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
          a3 = v133;
          uint64_t v12 = &OBJC_IVAR___BWPreviewStitcherNode__wantWideFallbackDueToTeleAEAF;
          BOOL v9 = v168;
          v126 = &OBJC_IVAR___BWPreviewStitcherNode__wantWideFallbackDueToTeleAEAF;
        }
        pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + v126[337]));
      }

      goto LABEL_233;
    }
    id v123 = 0;
    objc_super v5 = &OBJC_IVAR___BWPreviewStitcherNode__wantWideFallbackDueToTeleAEAF;
  }
LABEL_234:
  v139 = *(const void **)(a1 + v12[379]);
  if (v139)
  {
    CFRelease(v139);
    *(void *)(a1 + v12[379]) = 0;
  }
  v140 = *(const void **)(a1 + 600);
  if (v140)
  {
    CFRelease(v140);
    *(void *)(a1 + 600) = 0;
  }
  bzero(*(void **)(a1 + 608), 4 * (*(void *)(a1 + 560) + *(void *)(a1 + 552)));
  [*(id *)(a1 + 1056) reset];
  *(_DWORD *)(a1 + 380) = 0;
  *(void *)(a1 + 1016) = 0;
  *(void *)(a1 + 1024) = 0;
  *(void *)(a1 + 1032) = 0;
  *(void *)(a1 + 1040) = 0;
  *(void *)(a1 + 1048) = 0;

  *(void *)(a1 + 968) = 0;
  *(void *)(a1 + 976) = 0;

  *(void *)(a1 + 984) = 0;
  *(unsigned char *)(a1 + 1280) = 0;
  *(unsigned char *)(a1 + 1352) = 0;
  [*(id *)(a1 + 1512) reset];
  *(unsigned char *)(a1 + 712) = 0;
  *(unsigned char *)(a1 + 713) = 0;
  *(unsigned char *)(a1 + 716) = 0;
  *(_DWORD *)(a1 + 720) = 0;
  dispatch_sync(*(dispatch_queue_t *)(a1 + 568), &__block_literal_global_30);
  if (v123)
  {
    if (v9)
    {
      unsigned int v141 = -[BWQuickTimeMovieFileSinkNode _verifyMovieTiming:](a1, v123);
      LOBYTE(v9) = v141 == 0;
      if (v141) {
        a3 = v141;
      }
      else {
        a3 = a3;
      }
    }
    -[BWQuickTimeMovieFileSinkNode _moveOrDeleteTemporaryIrisMovie:recordingSucceeded:](a1, v123, v9);
  }
  uint64_t v142 = objc_msgSend((id)a1, "recordingStatusDelegate", sampleTimingArraya, v154);
  if (v142)
  {
    v143 = (void *)v142;
    unsigned int v144 = qtmfsn_movieRecordingIsProRes(*(void **)(a1 + v5[368]));
    if (*(unsigned char *)(a1 + 1456) || v144)
    {
      uint64_t v145 = *(void *)(a1 + 912);
      if (v145)
      {
        if (!a3)
        {
          if (v145 == *(void *)(a1 + 920))
          {
            LODWORD(v196) = 0;
            type[0] = OS_LOG_TYPE_DEFAULT;
            v146 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            unsigned int v147 = v196;
            if (os_log_type_enabled(v146, type[0])) {
              unsigned int v148 = v147;
            }
            else {
              unsigned int v148 = v147 & 0xFFFFFFFE;
            }
            if (v148)
            {
              uint64_t v149 = [(id)a1 name];
              LODWORD(rhs.value) = 136315906;
              *(CMTimeValue *)((char *)&rhs.value + 4) = (CMTimeValue)"-[BWQuickTimeMovieFileSinkNode _doEndRecordingAtTi"
                                                                      "me:earlyTerminationErrCode:]";
              LOWORD(rhs.flags) = 2048;
              *(void *)((char *)&rhs.flags + 2) = a1;
              HIWORD(rhs.epoch) = 2112;
              uint64_t v202 = v149;
              __int16 v203 = 1024;
              int v204 = -15437;
              LODWORD(v155) = 38;
              _os_log_send_and_compose_impl();
            }
            fig_log_call_emit_and_clean_up_after_send_and_compose();
            a3 = 4294951859;
          }
          else if (FigDebugIsInternalBuild())
          {
            a3 = 4294951861;
          }
          else
          {
            a3 = 0;
          }
        }
      }
    }
    -[BWQuickTimeMovieFileSinkNode _initAnalyticsDataInIrisMovieInfo:](a1, v123);
    LOBYTE(v155) = v9;
    [v143 fileWriter:a1 writerPipelineIndex:*(void *)(a1 + 944) stoppedRecordingForSettings:*(void *)(a1 + v5[368]) withError:a3 thumbnailSurface:*(void *)(a1 + 576) irisMovieInfo:v123 debugMetadataSidecarFileURL:0 recordingSucceeded:v155];
  }
  v150 = *(const void **)(a1 + 576);
  if (v150)
  {
    CFRelease(v150);
    *(void *)(a1 + 576) = 0;
  }
}

- (void)_finishIrisMovieGeneration
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    pthread_mutex_lock(*(pthread_mutex_t **)(a1 + 824));
    v1 = (void *)[*(id *)(a1 + 672) copy];
    [*(id *)(a1 + 672) removeAllObjects];
    unint64_t v2 = v1;
    pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + 824));
    if (v1)
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      uint64_t v3 = [v1 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v3)
      {
        uint64_t v4 = v3;
        uint64_t v5 = *(void *)v17;
        do
        {
          for (uint64_t i = 0; i != v4; ++i)
          {
            if (*(void *)v17 != v5) {
              objc_enumerationMutation(v1);
            }
            int v7 = *(void **)(*((void *)&v16 + 1) + 8 * i);
            if (objc_msgSend(v7, "suspended", v11, v13)) {
              [v7 setSuspended:0];
            }
            if (dword_1EB4C5090)
            {
              os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
              fig_log_call_emit_and_clean_up_after_send_and_compose();
            }
            objc_msgSend(v7, "flush", v12, v14);
            if (dword_1EB4C5090)
            {
              BOOL v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
              fig_log_call_emit_and_clean_up_after_send_and_compose();
            }
          }
          unint64_t v2 = v1;
          uint64_t v4 = [v1 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v4);
      }
    }
    if (dword_1EB4C5090)
    {
      double v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  if (!a3) {
    return;
  }
  uint64_t v5 = a3;
  memset(&v63, 0, sizeof(v63));
  double v7 = BWGetOriginalPresentationTimeStampFromBuffer(a3, (uint64_t)&v63);
  if (*MEMORY[0x1E4F1EBA8] == 1)
  {
    [(BWQuickTimeMovieFileSinkNode *)self pipelineTraceID];
    CMTime time = v63;
    CMTimeGetSeconds(&time);
    kdebug_trace();
  }
  uint64_t v8 = [a4 index];
  BOOL v9 = &OBJC_IVAR___BWPreviewStitcherNode__wantWideFallbackDueToTeleAEAF;
  if (BWSampleBufferIsMarkerBuffer(v5))
  {
    if ((CMGetAttachment(v5, @"IrisMovieRequest", 0)
       || qtmfsn_bufferSpecifiesFileWriterAction(v5, @"StreamForcedOff")
       || qtmfsn_bufferSpecifiesFileWriterAction(v5, @"SpatialAggressorsSeen"))
      && v8 != self->_masterInputIndex)
    {
      return;
    }
    if ([a4 index] == self->_masterInputIndex)
    {
      double v10 = (void *)CMGetAttachment(v5, @"RecordingFrameDropsCountDueToISP", 0);
      if (v10)
      {
        uint64_t v11 = v10;
        id v12 = a4;
        analyticsPayload = self->_analyticsPayload;
        uint64_t v14 = v5;
        int v15 = [v10 intValue];
        uint64_t v16 = [(BWMovieFileOutputAnalyticsPayload *)analyticsPayload numberOfISPFrames] + v15;
        uint64_t v5 = v14;
        [(BWMovieFileOutputAnalyticsPayload *)analyticsPayload setNumberOfISPFrames:v16];
        a4 = v12;
        BOOL v9 = &OBJC_IVAR___BWPreviewStitcherNode__wantWideFallbackDueToTeleAEAF;
        -[BWMovieFileOutputAnalyticsPayload setNumberOfISPFramesDropped:](self->_analyticsPayload, "setNumberOfISPFramesDropped:", -[BWMovieFileOutputAnalyticsPayload numberOfISPFramesDropped](self->_analyticsPayload, "numberOfISPFramesDropped")+ (int)[v11 intValue]);
        CMRemoveAttachment(v5, @"RecordingFrameDropsCountDueToISP");
      }
    }
  }
  id v57 = a4;
  if (self->_numVideoTracks
    && [a4 index] == self->_masterInputIndex
    && !BWSampleBufferIsMarkerBuffer(v5))
  {
    [(BWMovieFileOutputAnalyticsPayload *)self->_analyticsPayload setNumberOfISPFrames:[(BWMovieFileOutputAnalyticsPayload *)self->_analyticsPayload numberOfISPFrames] + 1];
    objc_msgSend((id)CMGetAttachment(v5, @"UIZoomFactor", 0), "floatValue");
    float v18 = v17;
    [(BWMovieFileOutputAnalyticsPayload *)self->_analyticsPayload minUIZoomDuringVideoRecording];
    if (v18 < *(float *)&v19)
    {
      *(float *)&double v19 = v18;
      [(BWMovieFileOutputAnalyticsPayload *)self->_analyticsPayload setMinUIZoomDuringVideoRecording:v19];
    }
    [(BWMovieFileOutputAnalyticsPayload *)self->_analyticsPayload maxUIZoomDuringVideoRecording];
    if (v18 > *(float *)&v20)
    {
      *(float *)&double v20 = v18;
      [(BWMovieFileOutputAnalyticsPayload *)self->_analyticsPayload setMaxUIZoomDuringVideoRecording:v20];
    }
    if (self->_capturePipelineLatencyStats)
    {
      unint64_t v21 = (unint64_t)CMGetAttachment(v5, @"IrisStagingNodeEmissionTimeStamp", 0);
      unint64_t v22 = (unint64_t)CMGetAttachment(v5, @"FileCoordinatorEmissionTimeStamp", 0);
      if (v21 | v22)
      {
        char v23 = (void *)v22;
        HostTimeClocuint64_t k = CMClockGetHostTimeClock();
        CMClockGetTime(&v62, HostTimeClock);
        CMTimeConvertScale(&v61, &v62, 1000000000, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
        CMTimeValue value = v61.value;
        if (v21)
        {
          double v26 = (double)(value - [(id)v21 longLongValue]);
          [(BWStats *)self->_irisVideoLatencyStats addDataPoint:v26];
          [(BWMovingWindowStats *)self->_recentIrisVideoLatencyStats addDataPoint:v26];
        }
        if (v23)
        {
          double v27 = (double)(value - [v23 longLongValue]);
          [(BWMovingWindowStats *)self->_capturePipelineLatencyStats addDataPoint:v27];
          [(BWStats *)self->_videoLatencyStats addDataPoint:v27];
        }
      }
    }
    unint64_t v28 = (void *)CMGetAttachment(v5, (CFStringRef)*MEMORY[0x1E4F53070], 0);
    uint64_t v29 = v28;
    if (self->_irisVideoFrameDurationStats)
    {
      objc_msgSend((id)objc_msgSend(v28, "objectForKeyedSubscript:", *MEMORY[0x1E4F54140]), "doubleValue");
      if (v30 > 0.0) {
        -[BWStats addDataPoint:](self->_irisVideoFrameDurationStats, "addDataPoint:");
      }
    }
    long long v31 = (void *)[v29 objectForKeyedSubscript:0x1EFA40A20];
    if ((int)[v31 intValue] >= 1 && !self->_irisRetimingRecipeIdentifier) {
      self->_irisRetimingRecipeIdentifier = (NSNumber *)v31;
    }
    if (self->_cinematicVideoEnabled && self->_recordingState == 1)
    {
      long long v32 = (void *)CMGetAttachment(v5, @"CinematicVideoMovieFileRecordingStats", 0);
      if (v32)
      {
        OSStatus v33 = v32;
        self->_cinematicVideoMovieRecordingStats.countOfSoftFocusRequests += objc_msgSend((id)objc_msgSend(v32, "objectForKeyedSubscript:", 0x1EFA73420), "unsignedIntValue");
        self->_cinematicVideoMovieRecordingStats.countOfHardFocusRequests += objc_msgSend((id)objc_msgSend(v33, "objectForKeyedSubscript:", 0x1EFA73400), "unsignedIntValue");
        self->_cinematicVideoMovieRecordingStats.countOfFixedPlaneFocusRequests += objc_msgSend((id)objc_msgSend(v33, "objectForKeyedSubscript:", 0x1EFA733E0), "unsignedIntValue");
        self->_cinematicVideoMovieRecordingStats.countOfTapToTrackFailures += objc_msgSend((id)objc_msgSend(v33, "objectForKeyedSubscript:", 0x1EFA73440), "unsignedIntValue");
        self->_cinematicVideoMovieRecordingStats.countOfFixedTaxonomyFocusDecisions += objc_msgSend((id)objc_msgSend(v33, "objectForKeyedSubscript:", 0x1EFA73460), "unsignedIntValue");
        self->_cinematicVideoMovieRecordingStats.countOfNonTaxonomyFocusDecisions += objc_msgSend((id)objc_msgSend(v33, "objectForKeyedSubscript:", 0x1EFA73480), "unsignedIntValue");
        self->_cinematicVideoMovieRecordingStats.countOfCustomFocusDecisions += objc_msgSend((id)objc_msgSend(v33, "objectForKeyedSubscript:", 0x1EFA734A0), "unsignedIntValue");
        self->_cinematicVideoMovieRecordingStats.countOfAutoFocusDecisions += objc_msgSend((id)objc_msgSend(v33, "objectForKeyedSubscript:", 0x1EFA734C0), "unsignedIntValue");
        CMRemoveAttachment(v5, @"CinematicVideoMovieFileRecordingStats");
      }
    }
  }
  char v60 = 0;
  uint64_t v59 = v5;
  do
  {
    int recordingState = self->_recordingState;
    if (!-[BWQuickTimeMovieFileSinkNode _driveStateMachineWithBuffer:forInputIndex:sampleBufferAlreadyAtHeadOfQueue:]((uint64_t)self, v59, v8, v60 & 1))
    {
      uint64_t v34 = 0;
      continue;
    }
    if (!self->_numInputs)
    {
      uint64_t v34 = 0;
LABEL_56:
      uint64_t v41 = v9[310];
      id v42 = [(NSArray *)self->_stagingQueues objectAtIndex:*(Class *)((char *)&self->super.super.super.super.isa + v41)];
      uint64_t v8 = *(uint64_t *)((char *)&self->super.super.super.super.isa + v41);
      uint64_t v59 = (opaqueCMSampleBuffer *)[v42 firstObject];
      char v60 = 1;
      continue;
    }
    uint64_t v34 = 0;
    unint64_t v35 = 0;
    do
    {
      id v36 = [(NSArray *)self->_stagingQueues objectAtIndex:v35];
      uint64_t v37 = v36;
      while ([v36 count])
      {
        uint64_t v38 = (void *)[v37 firstObject];
        if (BWSampleBufferIsMarkerBuffer(v38))
        {
          double v39 = (void *)CMGetAttachment(v38, @"IrisMovieRequest", 0);
          if (v39)
          {
            -[BWQuickTimeMovieFileSinkNode _handleIrisMovieRequest:]((uint64_t)self, v39);
          }
          else if (qtmfsn_bufferSpecifiesFileWriterAction(v38, @"StreamForcedOff"))
          {
            -[BWQuickTimeMovieFileSinkNode _handleStreamForcedOffMarkerBuffer:]((uint64_t)self);
          }
          else
          {
            if (!qtmfsn_bufferSpecifiesFileWriterAction(v38, @"SpatialAggressorsSeen"))
            {
              ++v34;
              break;
            }
            -[BWQuickTimeMovieFileSinkNode _handleSpatialAggressorsSeenMarkerBuffer:](self, v38);
          }
        }
        else
        {
          -[BWQuickTimeMovieFileSinkNode _writeBuffer:forInputIndex:]((uint64_t)self, (opaqueCMSampleBuffer *)v38, v35);
        }
        [v37 removeObjectAtIndex:0];
        id v36 = v37;
      }
      ++v35;
      unint64_t numInputs = self->_numInputs;
    }
    while (v35 < numInputs);
    BOOL v9 = &OBJC_IVAR___BWPreviewStitcherNode__wantWideFallbackDueToTeleAEAF;
    if (v34 == numInputs) {
      goto LABEL_56;
    }
  }
  while (v34 == self->_numInputs);
  if (self->_numVideoTracks
    && (Class)[v57 index] == *(Class *)((char *)&self->super.super.super.super.isa + v9[310])
    && !BWSampleBufferIsMarkerBuffer(v5))
  {
    int v43 = objc_msgSend((id)CMGetAttachment(v5, (CFStringRef)*MEMORY[0x1E4F55D38], 0), "intValue");
    int v44 = v43;
    if (v43 >= self->_maxSystemPressureLevel)
    {
      self->_maxSystemPressureLevel = v43;
      self->_factorsContributingToMaxSystemPressureLevel |= objc_msgSend((id)CMGetAttachment(v5, (CFStringRef)*MEMORY[0x1E4F55D40], 0), "intValue");
    }
    if (v44 >= 3 && self->_timeToCriticalSystemPressureInMS == -1)
    {
      mach_absolute_time();
      self->_timeToCriticalSystemPressureInMS = FigHostTimeToNanoseconds() / 0xF4240uLL;
    }
    if (v44 != self->_currentSystemPressureLevel)
    {
      uint64_t v45 = mach_absolute_time();
      int64_t timeOfLastSystemPressureChange = self->_timeOfLastSystemPressureChange;
      if (!timeOfLastSystemPressureChange) {
        int64_t timeOfLastSystemPressureChange = self->_recordingStartTime;
      }
      self->_int64_t timeOfLastSystemPressureChange = timeOfLastSystemPressureChange;
      self->_accumulatedSystemPressureLevel += FigHostTimeToNanoseconds() / 0xF4240uLL * v44;
      self->_int64_t timeOfLastSystemPressureChange = v45;
      self->_currentSystemPressureLevel = v44;
    }
  }
  int v47 = self->_recordingState;
  if ((!v47 && recordingState || v47 == 2 && recordingState != 2) && self->_numInputs)
  {
    unint64_t v48 = 0;
    do
    {
      id v49 = [(NSArray *)self->_stagingQueues objectAtIndex:v48];
      for (uint64_t i = v49; [v49 count]; v49 = i)
      {
        unint64_t v51 = (void *)[i firstObject];
        uint64_t v52 = v51;
        int v53 = self->_recordingState;
        if (!v53)
        {
          if (qtmfsn_bufferSpecifiesFileWriterAction(v51, @"Start")) {
            break;
          }
          int v53 = self->_recordingState;
        }
        if (v53 == 2 && (qtmfsn_bufferSpecifiesFileWriterAction(v52, @"Resume") & 1) != 0) {
          break;
        }
        -[BWQuickTimeMovieFileSinkNode _printBufferEvent:forNodeInputIndex:eventName:]((CMTime *)self, (CMSampleBufferRef)v52);
        [i removeObjectAtIndex:0];
      }
      ++v48;
      unint64_t v54 = self->_numInputs;
    }
    while (v48 < v54);
    if (v54)
    {
      uint64_t v55 = 0;
      while (1)
      {
        id v56 = [(NSArray *)self->_stagingQueues objectAtIndex:v55];
        if ([v56 count]) {
          break;
        }
        if (++v55 >= self->_numInputs) {
          return;
        }
      }
      -[BWQuickTimeMovieFileSinkNode _driveStateMachineWithBuffer:forInputIndex:sampleBufferAlreadyAtHeadOfQueue:]((uint64_t)self, (opaqueCMSampleBuffer *)[v56 firstObject], v55, 1);
    }
  }
}

- (uint64_t)_driveStateMachineWithBuffer:(uint64_t)a3 forInputIndex:(int)a4 sampleBufferAlreadyAtHeadOfQueue:
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v7 = result;
    uint64_t v8 = objc_msgSend(*(id *)(result + 392), "objectAtIndex:");
    if (!BWSampleBufferIsMarkerBuffer(a2))
    {
      if (!*(unsigned char *)(v7 + 716)) {
        -[BWQuickTimeMovieFileSinkNode _driveStateMachineWithMediaBuffer:forInputIndex:inputStagingQueue:sampleBufferAlreadyAtHeadOfQueue:]((CMTime *)v7, a2, a3, v8, a4);
      }
      return 0;
    }
    BOOL v9 = (void *)CMGetAttachment(a2, @"RecordingSettings", 0);
    if (v9) {
      uint64_t v35 = [v9 settingsID];
    }
    else {
      uint64_t v35 = 0;
    }
    if (a4)
    {
      if (!dword_1EB4C5090) {
        goto LABEL_13;
      }
    }
    else if (!dword_1EB4C5090)
    {
      goto LABEL_13;
    }
    unsigned int v37 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
LABEL_13:
    if ((qtmfsn_bufferSpecifiesFileWriterAction(a2, @"Stop") & 1) != 0
      || qtmfsn_bufferSpecifiesFileWriterAction(a2, @"Flush"))
    {
      uint64_t v11 = objc_msgSend((id)CMGetAttachment(a2, @"FramesDroppedDueToFormatWriterQueueFull", 0), "unsignedLongLongValue");
      *(void *)(v7 + 920) = v11;
      if (v11)
      {
        unsigned int v37 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        id v12 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        unsigned int v13 = v37;
        if (os_log_type_enabled(v12, type)) {
          unsigned int v14 = v13;
        }
        else {
          unsigned int v14 = v13 & 0xFFFFFFFE;
        }
        if (v14)
        {
          uint64_t v15 = [(id)v7 name];
          int v38 = 136315650;
          double v39 = "-[BWQuickTimeMovieFileSinkNode _driveStateMachineWithBuffer:forInputIndex:sampleBufferAlreadyAtHeadOfQueue:]";
          __int16 v40 = 2048;
          uint64_t v41 = v7;
          __int16 v42 = 2112;
          uint64_t v43 = v15;
          LODWORD(v34) = 32;
          OSStatus v33 = &v38;
          _os_log_send_and_compose_impl();
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
    }
    if (qtmfsn_bufferSpecifiesFileWriterAction(a2, @"Stop"))
    {
      CFTypeRef v16 = CMGetAttachment(a2, @"TrackFormatDescription", 0);
      if (v16)
      {
        uint64_t v17 = *(void *)(v7 + 640);
        float v18 = *(const void **)(v17 + 8 * a3);
        *(void *)(v17 + 8 * a3) = v16;
        CFRetain(v16);
        if (v18) {
          CFRelease(v18);
        }
      }
    }
    if ((a4 & 1) == 0 && [v8 count])
    {
      if (dword_1EB4C5090)
      {
        unsigned int v37 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        double v19 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        unsigned int v20 = v37;
        if (os_log_type_enabled(v19, type)) {
          unsigned int v21 = v20;
        }
        else {
          unsigned int v21 = v20 & 0xFFFFFFFE;
        }
        if (v21)
        {
          unint64_t v22 = v8;
          uint64_t v23 = *(void *)(v7 + 992);
          CFTypeRef v24 = CMGetAttachment(a2, @"FileWriterAction", 0);
          int v38 = 136316162;
          double v39 = "-[BWQuickTimeMovieFileSinkNode _driveStateMachineWithBuffer:forInputIndex:sampleBufferAlreadyAtHeadOfQueue:]";
          __int16 v40 = 2112;
          uint64_t v41 = v23;
          uint64_t v8 = v22;
          __int16 v42 = 2112;
          uint64_t v43 = (uint64_t)v24;
          __int16 v44 = 2048;
          uint64_t v45 = v35;
          __int16 v46 = 1024;
          int v47 = a3;
          LODWORD(v34) = 48;
          OSStatus v33 = &v38;
          _os_log_send_and_compose_impl();
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      objc_msgSend(v8, "addObject:", a2, v33, v34);
      return 0;
    }
    uint64_t v25 = (void *)CMGetAttachment(a2, @"IrisMovieRequest", 0);
    if (v25)
    {
      -[BWQuickTimeMovieFileSinkNode _handleIrisMovieRequest:](v7, v25);
      return 0;
    }
    if (qtmfsn_bufferSpecifiesFileWriterAction(a2, @"Start")) {
      return -[BWQuickTimeMovieFileSinkNode _driveStateMachineWithStartMarkerBuffer:forInputIndex:inputStagingQueue:sampleBufferAlreadyAtHeadOfQueue:](v7, a2, v26, v8, a4);
    }
    if (qtmfsn_bufferSpecifiesFileWriterAction(a2, @"Stop"))
    {
      uint64_t v28 = v7;
      uint64_t v29 = a2;
      double v30 = @"Stop";
    }
    else
    {
      if (!qtmfsn_bufferSpecifiesFileWriterAction(a2, @"Flush"))
      {
        if (qtmfsn_bufferSpecifiesFileWriterAction(a2, @"Pause")) {
          return -[BWQuickTimeMovieFileSinkNode _driveStateMachineWithPauseMarkerBuffer:forInputIndex:inputStagingQueue:sampleBufferAlreadyAtHeadOfQueue:](v7, a2, v31, v8, a4);
        }
        if (qtmfsn_bufferSpecifiesFileWriterAction(a2, @"Resume")) {
          return -[BWQuickTimeMovieFileSinkNode _driveStateMachineWithResumeMarkerBuffer:forInputIndex:inputStagingQueue:sampleBufferAlreadyAtHeadOfQueue:](v7, a2, v32, v8, a4);
        }
        if (!qtmfsn_bufferSpecifiesFileWriterAction(a2, @"Terminate"))
        {
          if (qtmfsn_bufferSpecifiesFileWriterAction(a2, @"StreamForcedOff"))
          {
            -[BWQuickTimeMovieFileSinkNode _handleStreamForcedOffMarkerBuffer:](v7);
            return 0;
          }
          if (qtmfsn_bufferSpecifiesFileWriterAction(a2, @"SpatialAggressorsSeen"))
          {
            -[BWQuickTimeMovieFileSinkNode _handleSpatialAggressorsSeenMarkerBuffer:]((_DWORD *)v7, a2);
            return 0;
          }
        }
        -[BWQuickTimeMovieFileSinkNode _printBufferEvent:forNodeInputIndex:eventName:]((CMTime *)v7, a2);
        return 0;
      }
      uint64_t v28 = v7;
      uint64_t v29 = a2;
      double v30 = @"Flush";
    }
    return -[BWQuickTimeMovieFileSinkNode _driveStateMachineWithStopOrFlushMarkerBuffer:requiredAction:forInputIndex:inputStagingQueue:sampleBufferAlreadyAtHeadOfQueue:](v28, v29, v30, v27, v8, a4);
  }
  return result;
}

- (void)_handleIrisMovieRequest:(uint64_t)a1
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  if ([a2 requestedSDOFVariants])
  {
    if ((int)[a2 numberOfRequestedVariants] >= 2)
    {
      uint64_t v4 = (void *)[a2 copyMovieInfosForRequestedSDOFVariants];
      long long v14 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v15;
        do
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v15 != v7) {
              objc_enumerationMutation(v4);
            }
            -[BWQuickTimeMovieFileSinkNode _handleIrisMovieRequest:](a1, *(void *)(*((void *)&v14 + 1) + 8 * i));
          }
          uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
        }
        while (v6);
      }

      return;
    }
    if ([a2 isFinalEnqueuedIrisRequest]) {
      [a2 setFinalReferenceMovie:1];
    }
  }
  if (*(unsigned char *)(a1 + 716) || !*(_DWORD *)(a1 + 584))
  {
    uint64_t v9 = [(id)a1 recordingStatusDelegate];
    if (v9)
    {
      double v10 = (void *)v9;
      id v11 = a2;
      if (*(void *)(a1 + 944))
      {
        id v11 = a2;
        if (objc_msgSend((id)objc_msgSend(a2, "settings"), "spatialOverCaptureMovieURL")) {
          id v11 = (id)[a2 copySpatialOverCaptureVariant];
        }
      }
      if (*(unsigned char *)(a1 + 716)) {
        uint64_t v12 = *(unsigned int *)(a1 + 720);
      }
      else {
        uint64_t v12 = 4294951860;
      }
      -[BWQuickTimeMovieFileSinkNode _initAnalyticsDataInIrisMovieInfo:](a1, v11);
      LOBYTE(v13) = 0;
      objc_msgSend(v10, "fileWriter:writerPipelineIndex:stoppedRecordingForSettings:withError:thumbnailSurface:irisMovieInfo:debugMetadataSidecarFileURL:recordingSucceeded:", a1, *(void *)(a1 + 944), objc_msgSend(a2, "settings"), v12, 0, v11, 0, v13);
    }
  }
  else
  {
    -[BWQuickTimeMovieFileSinkNode _processIrisRequest:](a1, a2);
  }
}

- (uint64_t)_handleStreamForcedOffMarkerBuffer:(uint64_t)result
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    if (*(_DWORD *)(result + 584))
    {
      *(unsigned char *)(result + 716) = 1;
      *(_DWORD *)(result + 720) = -15431;
      [*(id *)(result + 664) setStreamForcedOffErrorCode:*(unsigned int *)(result + 720)];
      [*(id *)(v1 + 664) setVitalInputStreamHasBeenForcedOff:1];
      long long v10 = 0u;
      long long v11 = 0u;
      long long v8 = 0u;
      long long v9 = 0u;
      unint64_t v2 = *(void **)(v1 + 392);
      result = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (result)
      {
        uint64_t v3 = result;
        uint64_t v4 = *(void *)v9;
        do
        {
          uint64_t v5 = 0;
          do
          {
            if (*(void *)v9 != v4) {
              objc_enumerationMutation(v2);
            }
            for (uint64_t i = *(void **)(*((void *)&v8 + 1) + 8 * v5); ; [i removeObjectAtIndex:0])
            {
              uint64_t v7 = (const void *)[i firstObject];
              if (!v7 || BWSampleBufferIsMarkerBuffer(v7)) {
                break;
              }
            }
            ++v5;
          }
          while (v5 != v3);
          result = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
          uint64_t v3 = result;
        }
        while (result);
      }
    }
  }
  return result;
}

- _handleSpatialAggressorsSeenMarkerBuffer:(_DWORD *)result
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    unint64_t v2 = result;
    if (result[146])
    {
      result[374] |= objc_msgSend((id)CMGetAttachment(target, @"StereoVideoCaptureStatus", 0), "intValue");
      objc_msgSend((id)CMGetAttachment(target, @"StereoVideoCaptureDuration", 0), "floatValue");
      v2[375] = v4;
      objc_msgSend((id)CMGetAttachment(target, @"StereoVideoCaptureStatusPercentageOfFramesWithAggressiveLuxLevel", 0), "floatValue");
      v2[376] = v5;
      result = (_DWORD *)objc_msgSend((id)CMGetAttachment(target, @"StereoVideoCaptureStatusPercentageOfFramesWithAggressiveFocusDistance", 0), "floatValue");
      v2[377] = v6;
      if (dword_1EB4C5090)
      {
        int v9 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        return (_DWORD *)fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
    }
  }
  return result;
}

- (void)_writeBuffer:(uint64_t)a3 forInputIndex:
{
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  int v7 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)a1, "inputs"), "objectAtIndex:", a3), "mediaType");
  if (!*(_DWORD *)(*(void *)(a1 + 608) + 4 * a3)) {
    return;
  }
  int v8 = v7;
  uint64_t v9 = *(void *)(a1 + 624);
  if (!*(unsigned char *)(v9 + a3))
  {
    if (v7 == 1986618469)
    {
      -[BWQuickTimeMovieFileSinkNode _writeVideoTrackLevelMetadataForSampleBuffer:inputIndex:]((void *)a1, a2, a3);
      *(unsigned char *)(*(void *)(a1 + 624) + a3) = 1;
      -[BWQuickTimeMovieFileSinkNode _preprocessingForFirstVideoBuffer:forInputIndex:](a1, a2, a3);
    }
    else
    {
      *(unsigned char *)(v9 + a3) = 1;
      switch(v7)
      {
        case 1936684398:
          -[BWQuickTimeMovieFileSinkNode _preprocessingForFirstAudioBuffer:forInputIndex:](a1, a2, a3);
          break;
        case 1835365473:
          -[BWQuickTimeMovieFileSinkNode _preprocessingForFirstMetadataBuffer:forInputIndex:]((void *)a1, a2, a3);
          break;
        case 1635088502:
          -[BWQuickTimeMovieFileSinkNode _preprocessingForFirstAuxiliaryBuffer:forInputIndex:](a1, a2, a3);
          break;
      }
    }
    if (*(void *)(a1 + 704) == a3)
    {
      if (*(_DWORD *)(a1 + 376)) {
        int32_t v10 = *(_DWORD *)(a1 + 376);
      }
      else {
        int32_t v10 = 600;
      }
      -[BWQuickTimeMovieFileSinkNode _adjustMaxFileDurationForMovieTimeScale:](a1, v10);
    }
  }
  memset(&v94, 0, sizeof(v94));
  CMSampleBufferGetOutputPresentationTimeStamp(&v94, a2);
  memset(&v93, 0, sizeof(v93));
  CMSampleBufferGetOutputDuration(&v93, a2);
  if (v8 != 1835365473)
  {
    BOOL v14 = v8 == 1986618469;
    if (*(void *)(a1 + 856)) {
      BOOL v15 = v8 == 1986618469;
    }
    else {
      BOOL v15 = 0;
    }
    if (v15)
    {
      id v16 = +[BWVideoQualityMetrics filterMetadata:CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E4F53070], 0)];
      [*(id *)(a1 + 864) processMetadata:v16];
      long long v17 = *(void **)(a1 + 856);
      CMTime time1 = v94;
      [v17 appendObject:v16 forTime:&time1];
      pthread_mutex_lock(*(pthread_mutex_t **)(a1 + 824));
      float v18 = *(void **)(a1 + 664);
      if (v18)
      {
        uint64_t v19 = *(void *)(a1 + 856);
        CMTime time1 = v94;
        [v18 updateOverCaptureQualityScoresForMoviesEndingBefore:&time1 fromMetadataRingBuffer:v19];
      }
      pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + 824));
      BOOL v14 = 1;
    }
    if (*(void *)(a1 + 944)) {
      BOOL v20 = !v14;
    }
    else {
      BOOL v20 = 1;
    }
    if (!v20)
    {
      unsigned int v21 = (void *)CMGetAttachment(a2, @"TotalZoomFactor", 0);
      if (v21)
      {
        unint64_t v22 = v21;
        [v21 doubleValue];
        if (v23 > *(double *)(a1 + 872))
        {
          [v22 doubleValue];
          *(void *)(a1 + 872) = v24;
        }
      }
    }
    if (*(void *)(a1 + 848)) {
      BOOL v25 = v14;
    }
    else {
      BOOL v25 = 0;
    }
    if (v25)
    {
      CFTypeRef v26 = CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E4F55CE8], 0);
      if (v26)
      {
        CFTypeRef v27 = v26;
        uint64_t v28 = *(void **)(a1 + 848);
        CMTime time1 = v94;
        [v28 appendObject:v27 forTime:&time1];
      }
    }
LABEL_37:
    CMTime v92 = *(CMTime *)(a1 + 232);
    if (*(void *)(a1 + 704) == a3)
    {
      if ((*(unsigned char *)(a1 + 436) & 1) == 0) {
        *(CMTime *)(a1 + 424) = v94;
      }
      CMTime time1 = v94;
      if (v93.flags)
      {
        CMTime lhs = v94;
        CMTime rhs = v93;
        CMTimeAdd(&time1, &lhs, &rhs);
      }
      CMTime lhs = time1;
      CMTime rhs = *(CMTime *)(a1 + 424);
      if (CMTimeCompare(&lhs, &rhs) >= 1)
      {
        CMTime lhs = time1;
        CMTime rhs = *(CMTime *)(a1 + 424);
        CMTimeSubtract(&v92, &lhs, &rhs);
      }
      if (*(unsigned char *)(a1 + 340))
      {
        CMTime lhs = v92;
        CMTime rhs = *(CMTime *)(a1 + 328);
        if ((CMTimeCompare(&lhs, &rhs) & 0x80000000) == 0)
        {
          int v29 = 0;
          CMTime v92 = *(CMTime *)(a1 + 232);
          uint64_t v30 = 4294950883;
          goto LABEL_88;
        }
      }
    }
    -[BWQuickTimeMovieFileSinkNode _printBufferEvent:forNodeInputIndex:eventName:]((CMTime *)a1, a2);
    uint64_t v31 = *(void *)(a1 + 592);
    uint64_t v32 = *(unsigned int *)(*(void *)(a1 + 608) + 4 * a3);
    uint64_t v33 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v33) {
      uint64_t v34 = v33;
    }
    else {
      uint64_t v34 = 0;
    }
    uint64_t v35 = *(uint64_t (**)(uint64_t, uint64_t, opaqueCMSampleBuffer *))(v34 + 32);
    if (v35)
    {
      uint64_t v36 = v35(v31, v32, a2);
      if (!v36)
      {
        *(unsigned char *)(*(void *)(a1 + 632) + a3) = (v93.flags & 1) == 0;
        if (*(void *)(a1 + 944) | a3) {
          BOOL v37 = 0;
        }
        else {
          BOOL v37 = v14;
        }
        if (v37) {
          -[BWQuickTimeMovieFileSinkNode _collectCoreAnalyticsData:](a1, a2);
        }
        uint64_t v38 = *(void *)(a1 + 448) + 24 * a3;
        CMTime time1 = v94;
        long long v39 = *(_OWORD *)v38;
        lhs.CMTimeEpoch epoch = *(void *)(v38 + 16);
        *(_OWORD *)&lhs.CMTimeValue value = v39;
        if (CMTimeCompare(&time1, &lhs) < 0)
        {
          uint64_t v40 = *(void *)(a1 + 448) + 24 * a3;
          CMTimeEpoch epoch = v94.epoch;
          *(_OWORD *)uint64_t v40 = *(_OWORD *)&v94.value;
          *(void *)(v40 + 16) = epoch;
          if (*(void *)(a1 + 704) == a3)
          {
            pthread_mutex_lock(*(pthread_mutex_t **)(a1 + 824));
            __int16 v42 = *(void **)(a1 + 664);
            if (v42)
            {
              CMTime v90 = v94;
              [v42 setActualMovieStartTime:&v90];
            }
            pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + 824));
          }
        }
        if (v8 != 1986618469)
        {
          if (v8 == 1936684398)
          {
            uint64_t v50 = *(void *)(a1 + 456) + 24 * a3;
            CMTime time1 = v94;
            long long v51 = *(_OWORD *)v50;
            lhs.CMTimeEpoch epoch = *(void *)(v50 + 16);
            *(_OWORD *)&lhs.CMTimeValue value = v51;
            if (CMTimeCompare(&time1, &lhs) >= 1)
            {
              uint64_t v52 = *(void *)(a1 + 480) + 24 * a3;
              CMTimeEpoch v53 = v93.epoch;
              *(_OWORD *)uint64_t v52 = *(_OWORD *)&v93.value;
              *(void *)(v52 + 16) = v53;
              if ((*(unsigned char *)(*(void *)(a1 + 480) + 24 * a3 + 12) & 1) == 0)
              {
                uint64_t v54 = *(void *)(a1 + 456) + 24 * a3;
                uint64_t v55 = *(void *)(v54 + 16);
                uint64_t v56 = *(void *)(a1 + 472) + 24 * a3;
                *(_OWORD *)uint64_t v56 = *(_OWORD *)v54;
                *(void *)(v56 + 16) = v55;
              }
              uint64_t v30 = 0;
              uint64_t v57 = *(void *)(a1 + 456) + 24 * a3;
              long long v58 = *(_OWORD *)&v94.value;
              *(void *)(v57 + 16) = v94.epoch;
              *(_OWORD *)uint64_t v57 = v58;
              goto LABEL_87;
            }
            goto LABEL_86;
          }
          if (v8 != 1635088502)
          {
            uint64_t v59 = *(void *)(a1 + 456) + 24 * a3;
            CMTime time1 = v94;
            long long v60 = *(_OWORD *)v59;
            lhs.CMTimeEpoch epoch = *(void *)(v59 + 16);
            *(_OWORD *)&lhs.CMTimeValue value = v60;
            if (CMTimeCompare(&time1, &lhs) >= 1)
            {
              uint64_t v30 = 0;
              uint64_t v61 = *(void *)(a1 + 456) + 24 * a3;
              CMTimeEpoch v62 = v94.epoch;
              *(_OWORD *)uint64_t v61 = *(_OWORD *)&v94.value;
              *(void *)(v61 + 16) = v62;
LABEL_87:
              int v29 = 1;
LABEL_88:
              memset(&rhs, 0, sizeof(rhs));
              HostTimeClocuint64_t k = CMClockGetHostTimeClock();
              CMClockGetTime(&rhs, HostTimeClock);
              CMTime time1 = rhs;
              uint64_t v71 = -[BWQuickTimeMovieFileSinkNode _getCurrentFileSize:currentHostTime:](a1, 0, &time1);
              pthread_mutex_lock(*(pthread_mutex_t **)(a1 + 824));
              *(void *)(a1 + 176) = v71;
              *(CMTime *)(a1 + 232) = v92;
              if (v29) {
                uint64_t v30 = *(unsigned int *)(a1 + 724);
              }
              pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + 824));
              if (!*(void *)(a1 + 984)) {
                goto LABEL_104;
              }
              if (*(void *)(a1 + 704) != a3) {
                goto LABEL_104;
              }
              CMTime time1 = *(CMTime *)(a1 + 280);
              CMTime lhs = rhs;
              if (CMTimeCompare(&time1, &lhs) > 0) {
                goto LABEL_104;
              }
              if (*(void *)(a1 + 968))
              {
                if (!dword_1EB4C5090
                  || (LODWORD(v87) = 0,
                      os_log_type_t type = OS_LOG_TYPE_DEFAULT,
                      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(),
                      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT),
                      fig_log_call_emit_and_clean_up_after_send_and_compose(),
                      !dword_1EB4C5090))
                {
LABEL_103:
                  CMTimeMake(&v88, 5 * rhs.timescale, rhs.timescale);
                  CMTime lhs = rhs;
                  CMTimeAdd(&time1, &lhs, &v88);
                  *(CMTime *)(a1 + 280) = time1;
LABEL_104:
                  if (!v30)
                  {
                    CMTime time1 = *(CMTime *)(a1 + 256);
                    CMTime lhs = *(CMTime *)(a1 + 232);
                    if (CMTimeCompare(&time1, &lhs) > 0) {
                      goto LABEL_112;
                    }
                    id v87 = 0;
                    uint64_t FigBaseObject = FigFormatWriterGetFigBaseObject();
                    uint64_t v76 = *(void *)(CMBaseObjectGetVTable() + 8);
                    if (v76) {
                      uint64_t v77 = v76;
                    }
                    else {
                      uint64_t v77 = 0;
                    }
                    CMTimeEpoch v78 = *(void (**)(uint64_t, void, void, id *))(v77 + 48);
                    if (v78)
                    {
                      v78(FigBaseObject, *MEMORY[0x1E4F32D48], *MEMORY[0x1E4F1CF80], &v87);
                      id v79 = v87;
                    }
                    else
                    {
                      id v79 = 0;
                    }
                    *(void *)(a1 + 208) = objc_msgSend(v79, "longLongValue", v82, v83);

                    if (!*(void *)(a1 + 208))
                    {
                      *(void *)(a1 + 208) = (uint64_t)((double)(unint64_t)v71 * 0.1);
                      if (qtmfsn_movieRecordingIsProRes(*(void **)(a1 + 400)))
                      {
                        CMTime time1 = *(CMTime *)(a1 + 232);
                        uint64_t v80 = vcvtd_n_s64_f64(CMTimeGetSeconds(&time1), 0xAuLL);
                        *(void *)(a1 + 208) = v80;
                      }
                      else
                      {
                        uint64_t v80 = *(void *)(a1 + 208);
                      }
                      if (v80 < 1000000) {
                        *(void *)(a1 + 208) = 1000000;
                      }
                    }
                    if (qtmfsn_movieRecordingIsProRes(*(void **)(a1 + 400)))
                    {
                      uint64_t v81 = *(void *)(a1 + 208) + *(void *)(a1 + 1552);
                      *(void *)(a1 + 208) = v81;
                    }
                    else
                    {
                      uint64_t v81 = *(void *)(a1 + 208);
                    }
                    *(void *)(a1 + 208) = v81 + 2 * (v71 - *(void *)(a1 + 224));
                    *(void *)(a1 + 224) = v71;
                    uint64_t v30 = -[BWQuickTimeMovieFileSinkNode _checkFreeSpaceForEstimatedMovieSizeOverhead:](a1, *(void *)(a1 + 208));
                    CMTimeMake(&v86, *(int *)(a1 + 240), *(_DWORD *)(a1 + 240));
                    CMTime lhs = *(CMTime *)(a1 + 256);
                    CMTimeAdd(&time1, &lhs, &v86);
                    *(CMTime *)(a1 + 256) = time1;
                    if (!v30)
                    {
LABEL_112:
                      unint64_t v74 = *(void *)(a1 + 184);
                      if (!v74 || *(void *)(a1 + 208) + v71 < v74)
                      {
LABEL_107:
                        if (*(unsigned char *)(a1 + 737))
                        {
                          if (*(void *)(a1 + 704) == a3) {
                            -[BWQuickTimeMovieFileSinkNode _debugAudioUsingSampleBuffer:](a1, a2);
                          }
                        }
                        return;
                      }
                      uint64_t v30 = 4294950884;
                    }
                  }
                  -[BWQuickTimeMovieFileSinkNode _forceEarlyTerminationWithErrorCode:](a1, v30);
LABEL_106:
                  [*(id *)(a1 + 1000) logErrorNumber:v30, objc_msgSend(NSString, "stringWithFormat:", @"when writing media for index %d", a3, v83) errorString];
                  goto LABEL_107;
                }
                LODWORD(v87) = 0;
                os_log_type_t type = OS_LOG_TYPE_DEFAULT;
                v85 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT);
                fig_log_call_emit_and_clean_up_after_send_and_compose();
              }
              if (dword_1EB4C5090)
              {
                LODWORD(v87) = 0;
                os_log_type_t type = OS_LOG_TYPE_DEFAULT;
                uint64_t v72 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT);
                fig_log_call_emit_and_clean_up_after_send_and_compose();
                if (dword_1EB4C5090)
                {
                  LODWORD(v87) = 0;
                  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
                  uint64_t v73 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                  os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT);
                  fig_log_call_emit_and_clean_up_after_send_and_compose();
                }
              }
              goto LABEL_103;
            }
LABEL_86:
            uint64_t v30 = 0;
            goto LABEL_87;
          }
        }
        uint64_t v43 = *(void *)(a1 + 456) + 24 * a3;
        CMTime time1 = v94;
        long long v44 = *(_OWORD *)v43;
        lhs.CMTimeEpoch epoch = *(void *)(v43 + 16);
        *(_OWORD *)&lhs.CMTimeValue value = v44;
        int32_t v45 = CMTimeCompare(&time1, &lhs);
        uint64_t v46 = *(void *)(a1 + 472) + 24 * a3;
        if (v45 < 1)
        {
          CMTime time1 = v94;
          long long v63 = *(_OWORD *)v46;
          lhs.CMTimeEpoch epoch = *(void *)(v46 + 16);
          *(_OWORD *)&lhs.CMTimeValue value = v63;
          if (CMTimeCompare(&time1, &lhs) < 1)
          {
LABEL_82:
            memset(&time1, 0, sizeof(time1));
            CMSampleBufferGetDecodeTimeStamp(&time1, a2);
            if ((time1.flags & 1) == 0) {
              CMTime time1 = v94;
            }
            uint64_t v66 = *(void *)(a1 + 464) + 24 * a3;
            CMTime lhs = time1;
            long long v67 = *(_OWORD *)v66;
            rhs.CMTimeEpoch epoch = *(void *)(v66 + 16);
            *(_OWORD *)&rhs.CMTimeValue value = v67;
            if (CMTimeCompare(&lhs, &rhs) >= 1)
            {
              uint64_t v68 = *(void *)(a1 + 464) + 24 * a3;
              CMTimeEpoch v69 = time1.epoch;
              *(_OWORD *)uint64_t v68 = *(_OWORD *)&time1.value;
              *(void *)(v68 + 16) = v69;
            }
            goto LABEL_86;
          }
          int v47 = (void *)(a1 + 472);
        }
        else
        {
          int v47 = (void *)(a1 + 456);
          uint64_t v48 = *(void *)(a1 + 456) + 24 * a3;
          uint64_t v49 = *(void *)(v48 + 16);
          *(_OWORD *)uint64_t v46 = *(_OWORD *)v48;
          *(void *)(v46 + 16) = v49;
        }
        uint64_t v64 = *v47 + 24 * a3;
        long long v65 = *(_OWORD *)&v94.value;
        *(void *)(v64 + 16) = v94.epoch;
        *(_OWORD *)uint64_t v64 = v65;
        goto LABEL_82;
      }
      uint64_t v30 = v36;
    }
    else
    {
      uint64_t v30 = 4294954514;
    }
    uint64_t v83 = v3;
    FigDebugAssert3();
    goto LABEL_106;
  }
  id v11 = *(id *)(a1 + 1544);
  if (!v11)
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    *(void *)(a1 + 1544) = v11;
  }
  CMTimeValue v12 = objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", a3)), "longLongValue");
  if (v94.value > v12)
  {
    uint64_t v13 = objc_msgSend(NSNumber, "numberWithLongLong:");
    objc_msgSend(*(id *)(a1 + 1544), "setObject:forKeyedSubscript:", v13, objc_msgSend(NSNumber, "numberWithUnsignedInteger:", a3));
    BOOL v14 = 0;
    goto LABEL_37;
  }
}

- (CMTime)_printBufferEvent:(CMTime *)result forNodeInputIndex:(CMSampleBufferRef)sbuf eventName:
{
  if (result && (byte_1EB4C5080 & 0x20) != 0)
  {
    uint64_t v3 = (uint64_t)result;
    FormatDescription = CMSampleBufferGetFormatDescription(sbuf);
    CMFormatDescriptionGetMediaType(FormatDescription);
    memset(&v12, 0, sizeof(v12));
    CMSampleBufferGetDecodeTimeStamp(&v12, sbuf);
    memset(&v11, 0, sizeof(v11));
    CMSampleBufferGetPresentationTimeStamp(&v11, sbuf);
    memset(&v10, 0, sizeof(v10));
    CMSampleBufferGetDuration(&v10, sbuf);
    size_t sizeArrayOut = 0;
    CMItemCount sizeArrayEntriesNeededOut = 0;
    if (!BWSampleBufferIsMarkerBuffer(sbuf)
      && !CMSampleBufferGetSampleSizeArray(sbuf, 0, 0, &sizeArrayEntriesNeededOut)
      && sizeArrayEntriesNeededOut == 1)
    {
      CMSampleBufferGetSampleSizeArray(sbuf, 1, &sizeArrayOut, 0);
    }
    result = (CMTime *)qtmfsn_stringForRecordingState(*(unsigned int *)(v3 + 584));
    if (v10.flags)
    {
      memset(&v7, 0, sizeof(v7));
      CMTime lhs = v11;
      CMTime v5 = v10;
      return CMTimeAdd(&v7, &lhs, &v5);
    }
  }
  return result;
}

- (void)handleDroppedSample:(id)a3 forInput:(id)a4
{
  if (![a4 index] && self->_numVideoTracks)
  {
    if (*MEMORY[0x1E4F1EBA8] == 1) {
      kdebug_trace();
    }
    if ([a3 reason] != 0x1EFA67EA0
      && (__CFString *)[a3 reason] != @"VideoDeviceDiscontinuity"
      && (__CFString *)[a3 reason] != @"HighFrameRateAutoFocusDiscontinuity")
    {
      [(BWMovieFileOutputAnalyticsPayload *)self->_analyticsPayload setNumberOfISPFrames:[(BWMovieFileOutputAnalyticsPayload *)self->_analyticsPayload numberOfISPFrames] + 1];
      ++self->_totalNumberOfFramesDropped;
    }
    if (qtmfsn_movieRecordingIsProRes(self->_settings))
    {
      if ([a3 reason] == 0x1EFA680C0) {
        uint64_t v6 = 4294951859;
      }
      else {
        uint64_t v6 = 4294951861;
      }
      CMTime v7 = [(BWFileSinkNode *)self recordingStatusDelegate];
      if (v7)
      {
        int v8 = v7;
        os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        [(BWNodeFileWriterStatusDelegate *)v8 fileWriter:self frameDroppedForSettingsID:[(FigCaptureRecordingSettings *)self->_settings settingsID] withError:v6];
      }
    }
  }
}

- (void)_processIrisRequest:(uint64_t)a1
{
  if (!a1) {
    return;
  }
  if (dword_1EB4C5090)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (!*(void *)(a1 + 944)) {
    goto LABEL_19;
  }
  if (!*(void *)(a1 + 648) && !*(void *)(a1 + 664))
  {
    char v5 = 0;
LABEL_13:
    if (objc_msgSend((id)objc_msgSend(a2, "settings", v17, v18), "spatialOverCaptureMovieURL"))
    {
      a2 = (id)[a2 copySpatialOverCaptureVariant];
      if (!dword_1EB4C5090)
      {
LABEL_19:
        int v8 = 0;
        goto LABEL_20;
      }
    }
    else if (v5 & 1) != 0 || ([a2 spatialOverCaptureExpected])
    {
      goto LABEL_19;
    }
    CMTime v7 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    goto LABEL_19;
  }
  if (objc_msgSend(a2, "spatialOverCaptureExpected", v17, v18))
  {
    char v5 = 1;
    goto LABEL_13;
  }
  if (dword_1EB4C5090)
  {
    uint64_t v6 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    int v8 = 1;
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  else
  {
    int v8 = 1;
  }
LABEL_20:
  if (*(void *)(a1 + 664))
  {
    if (v8) {
      return;
    }
    goto LABEL_41;
  }
  if (*(void *)(a1 + 648))
  {
    int v9 = v8 ^ 1;
  }
  else
  {
    *(void *)(a1 + 648) = a2;
    int v10 = [a2 requestedSDOFVariants];
    if ([a2 isMomentCaptureMovieRecording]
      && ([a2 isFinalEnqueuedIrisRequest] & 1) == 0)
    {
      if (dword_1EB4C5090)
      {
        CMTime v11 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
    }
    else if (!v10)
    {
      return;
    }
    int v9 = 0;
  }
  if (!*(void *)(a1 + 664))
  {
    int v12 = *(_DWORD *)(a1 + 584);
    if (v12 == 4 || v12 == 1) {
      -[BWQuickTimeMovieFileSinkNode _buildIrisRefMovieGeneratorAndWriteFirstIrisAsRefMovie](a1);
    }
  }
  if (v9)
  {
    if (*(void *)(a1 + 664))
    {
LABEL_41:
      -[BWQuickTimeMovieFileSinkNode _writeIrisRefMovieWithInfo:]((void *)a1, a2);
      return;
    }
    int v14 = *(_DWORD *)(a1 + 584);
    if (v14 == 3 || v14 == 0)
    {
      [*(id *)(a1 + 656) addObject:a2];
      if (dword_1EB4C5090) {
        goto LABEL_51;
      }
    }
    else if (dword_1EB4C5090)
    {
LABEL_51:
      id v16 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
}

- (unint64_t)lastFileSize
{
  pthread_mutex_lock((pthread_mutex_t *)self->_propertyMutex);
  unint64_t currFileSize = self->_currFileSize;
  pthread_mutex_unlock((pthread_mutex_t *)self->_propertyMutex);
  return currFileSize;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastFileDuration
{
  retstr->var0 = 0;
  *(void *)&retstr->var1 = 0;
  retstr->var3 = 0;
  pthread_mutex_lock((pthread_mutex_t *)self->_propertyMutex);
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = self->_currFileDuration;
  propertyMutex = self->_propertyMutex;
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)pthread_mutex_unlock((pthread_mutex_t *)propertyMutex);
}

- (NSArray)movieLevelMetadata
{
  pthread_mutex_lock((pthread_mutex_t *)self->_propertyMutex);
  if (self->_movieLevelMetadata) {
    uint64_t v3 = (NSArray *)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithArray:");
  }
  else {
    uint64_t v3 = 0;
  }
  pthread_mutex_unlock((pthread_mutex_t *)self->_propertyMutex);
  return v3;
}

- (void)setMovieLevelMetadata:(id)a3
{
  pthread_mutex_lock((pthread_mutex_t *)self->_propertyMutex);

  self->_movieLevelMetadata = (NSArray *)[a3 copy];
  propertyMutex = self->_propertyMutex;
  pthread_mutex_unlock((pthread_mutex_t *)propertyMutex);
}

- (NSArray)trackReferenceListForMetadataInputs
{
  pthread_mutex_lock((pthread_mutex_t *)self->_propertyMutex);
  if (self->_trackReferenceListForMetadataInputs) {
    uint64_t v3 = (NSArray *)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithArray:");
  }
  else {
    uint64_t v3 = 0;
  }
  pthread_mutex_unlock((pthread_mutex_t *)self->_propertyMutex);
  return v3;
}

- (NSArray)structuralDependentTrackReferenceListForMetadataInputs
{
  pthread_mutex_lock((pthread_mutex_t *)self->_propertyMutex);
  if (self->_structuralDependentTrackReferenceListForMetadataInputs) {
    uint64_t v3 = (NSArray *)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithArray:");
  }
  else {
    uint64_t v3 = 0;
  }
  pthread_mutex_unlock((pthread_mutex_t *)self->_propertyMutex);
  return v3;
}

- (NSArray)trackReferenceListForRenderMetadataInputs
{
  pthread_mutex_lock((pthread_mutex_t *)self->_propertyMutex);
  if (self->_trackReferenceListForRenderMetadataInputs) {
    uint64_t v3 = (NSArray *)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithArray:");
  }
  else {
    uint64_t v3 = 0;
  }
  pthread_mutex_unlock((pthread_mutex_t *)self->_propertyMutex);
  return v3;
}

- (void)setTrackReferenceListForRenderMetadataInputs:(id)a3
{
}

- (NSArray)trackReferenceListForVideoInputs
{
  pthread_mutex_lock((pthread_mutex_t *)self->_propertyMutex);
  if (self->_trackReferenceListForVideoInputs) {
    uint64_t v3 = (NSArray *)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithArray:");
  }
  else {
    uint64_t v3 = 0;
  }
  pthread_mutex_unlock((pthread_mutex_t *)self->_propertyMutex);
  return v3;
}

- (void)setTrackReferenceListForVideoInputs:(id)a3
{
  -[BWQuickTimeMovieFileSinkNode _validateTrackReferenceListForInputs:ofType:]((uint64_t)self, a3, @"video");
  pthread_mutex_lock((pthread_mutex_t *)self->_propertyMutex);

  self->_trackReferenceListForVideoInputs = (NSArray *)[a3 copy];
  propertyMutex = self->_propertyMutex;
  pthread_mutex_unlock((pthread_mutex_t *)propertyMutex);
}

- (NSArray)trackReferenceListForAudioInputs
{
  pthread_mutex_lock((pthread_mutex_t *)self->_propertyMutex);
  if (self->_trackReferenceListForAudioInputs) {
    uint64_t v3 = (NSArray *)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithArray:");
  }
  else {
    uint64_t v3 = 0;
  }
  pthread_mutex_unlock((pthread_mutex_t *)self->_propertyMutex);
  return v3;
}

- (void)setTrackReferenceListForAudioInputs:(id)a3
{
  -[BWQuickTimeMovieFileSinkNode _validateTrackReferenceListForInputs:ofType:]((uint64_t)self, a3, @"audio");
  pthread_mutex_lock((pthread_mutex_t *)self->_propertyMutex);

  self->_trackReferenceListForAudioInputs = (NSArray *)[a3 copy];
  propertyMutex = self->_propertyMutex;
  pthread_mutex_unlock((pthread_mutex_t *)propertyMutex);
}

- (void)setTrackReferenceListForAudioRemixInputs:(id)a3
{
  -[BWQuickTimeMovieFileSinkNode _validateTrackReferenceListForInputs:ofType:]((uint64_t)self, a3, @"audio remix");
  pthread_mutex_lock((pthread_mutex_t *)self->_propertyMutex);

  self->_trackReferenceListForAudioRemixInputs = (NSArray *)[a3 copy];
  propertyMutex = self->_propertyMutex;
  pthread_mutex_unlock((pthread_mutex_t *)propertyMutex);
}

- (NSArray)taggedMediaCharacteristicsForInputs
{
  pthread_mutex_lock((pthread_mutex_t *)self->_propertyMutex);
  if (self->_taggedMediaCharacteristicsForInputs) {
    uint64_t v3 = (NSArray *)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithArray:");
  }
  else {
    uint64_t v3 = 0;
  }
  pthread_mutex_unlock((pthread_mutex_t *)self->_propertyMutex);
  return v3;
}

- (void)setTaggedMediaCharacteristicsForInputs:(id)a3
{
  if (![a3 count] || (objc_msgSend(a3, "count") & 1) != 0)
  {
    int v8 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v9 = *MEMORY[0x1E4F1C3C8];
    int v10 = @"invalid tagged characteristics list for inputs";
    goto LABEL_13;
  }
  if ([a3 count])
  {
    unint64_t v5 = 0;
    while (1)
    {
      if (self->_numInputs <= objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", v5), "unsignedIntValue"))
      {
        int v8 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v9 = *MEMORY[0x1E4F1C3C8];
        int v10 = @"invalid input index in tagged characteristics list for inputs";
        goto LABEL_13;
      }
      unint64_t v6 = v5 + 1;
      if (![a3 objectAtIndexedSubscript:v6]) {
        break;
      }
      unint64_t v5 = v6 + 1;
      if (v5 >= [a3 count]) {
        goto LABEL_8;
      }
    }
    int v8 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v9 = *MEMORY[0x1E4F1C3C8];
    int v10 = @"invalid value %@ in tagged characteristics list for inputs";
LABEL_13:
    objc_exception_throw((id)[v8 exceptionWithName:v9 reason:v10 userInfo:0]);
  }
LABEL_8:
  pthread_mutex_lock((pthread_mutex_t *)self->_propertyMutex);

  self->_taggedMediaCharacteristicsForInputs = (NSArray *)[a3 copy];
  propertyMutex = self->_propertyMutex;
  pthread_mutex_unlock((pthread_mutex_t *)propertyMutex);
}

- (BOOL)irisMovieProcessingSuspended
{
  return self->_irisMovieProcessingSuspended;
}

- (void)setIrisMovieProcessingSuspended:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  pthread_mutex_lock((pthread_mutex_t *)self->_propertyMutex);
  if (self->_irisMovieProcessingSuspended == v3)
  {
    propertyMutex = self->_propertyMutex;
    pthread_mutex_unlock((pthread_mutex_t *)propertyMutex);
  }
  else
  {
    self->_irisMovieProcessingSuspended = v3;
    unint64_t v6 = self->_irisMovieGenerator;
    CMTime v7 = (void *)[(NSMutableArray *)self->_flushingIrisMovieGenerators copy];
    pthread_mutex_unlock((pthread_mutex_t *)self->_propertyMutex);
    if (v7)
    {
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v15;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v15 != v10) {
              objc_enumerationMutation(v7);
            }
            int v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
            [v12 setSuspended:v3];
            if (!v3) {
              [v12 flushAsync];
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
        }
        while (v9);
      }

      if (dword_1EB4C5090)
      {
        os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
    }
    if (v6)
    {
      [(BWIrisMovieGenerator *)v6 setSuspended:v3];
    }
  }
}

- (id)clientApplicationID
{
  return self->_clientApplicationID;
}

- (int)pipelineTraceID
{
  return self->_pipelineTraceID;
}

- (int64_t)maximumAllowedInFlightCompressedBytes
{
  return self->_maximumAllowedInFlightCompressedBytes;
}

- (void)_findStartMarkersWithMatchedStagedSetting:(void *)a3@<X2> sensorVideoPort:(void *)a4@<X3> captureDeviceType:(void *)a5@<X8>
{
  if (!a1)
  {
    *a5 = 0;
    a5[1] = 0;
    a5[2] = 0;
    return;
  }
  unint64_t v6 = a4;
  memset(&v39, 0, sizeof(v39));
  if (!*(void *)(a1 + 552))
  {
    uint64_t v10 = 0;
    goto LABEL_25;
  }
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  unint64_t v11 = 0;
  do
  {
    int v12 = objc_msgSend(*(id *)(a1 + 392), "objectAtIndex:", v11, v32, v33);
    if (![v12 count]) {
      goto LABEL_15;
    }
    uint64_t v13 = (void *)[v12 objectAtIndexedSubscript:0];
    if (!BWSampleBufferIsMarkerBuffer(v13)
      || (qtmfsn_bufferSpecifiesFileWriterAction(v13, @"Start") & 1) == 0)
    {
      uint64_t v33 = v34;
      LODWORD(v32) = 0;
LABEL_21:
      FigDebugAssert3();
      goto LABEL_15;
    }
    CFTypeRef v14 = CMGetAttachment(v13, @"RecordingSettings", 0);
    if (!v14)
    {
      uint64_t v33 = v34;
      LODWORD(v32) = 0;
      goto LABEL_21;
    }
    CFTypeRef v15 = v14;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v33 = v34;
      LODWORD(v32) = 0;
      goto LABEL_21;
    }
    if (v10)
    {
      if ([v10 isEqual:v15])
      {
        ++v9;
        goto LABEL_15;
      }
      uint64_t v33 = v34;
      LODWORD(v32) = 0;
      goto LABEL_21;
    }

    *(void *)(a1 + 928) = 0;
    long long v16 = (void *)CMGetAttachment(v13, @"TemporalScalabilityProperties", 0);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      *(void *)(a1 + 928) = v16;
    }
    ++v9;
    CMSampleBufferGetPresentationTimeStamp(&v39, (CMSampleBufferRef)v13);
    uint64_t v10 = (void *)v15;
LABEL_15:
    ++v11;
    unint64_t v17 = *(void *)(a1 + 552);
  }
  while (v11 < v17);
  BOOL v18 = v9 == v17;
  unint64_t v6 = a4;
  a3 = v35;
  if (!v18)
  {

    *(void *)(a1 + 928) = 0;
    uint64_t v19 = MEMORY[0x1E4F1F9F8];
    *(_OWORD *)a5 = *MEMORY[0x1E4F1F9F8];
    CMTimeEpoch epoch = *(void *)(v19 + 16);
    goto LABEL_44;
  }
LABEL_25:
  unsigned int v21 = (const void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 392), "objectAtIndex:", *(void *)(a1 + 704), v32), "firstObject");
  unint64_t v22 = (void *)CMGetAttachment(v21, @"RecordingMaxVideoFrameRate", 0);
  if (v22)
  {
    [v22 floatValue];
    goto LABEL_29;
  }
  if (*(void *)(a1 + 728))
  {
    int v23 = 1131413504;
LABEL_29:
    *(_DWORD *)(a1 + 384) = v23;
  }
  uint64_t v24 = (void *)CMGetAttachment(v21, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  *a3 = (id)[v24 objectForKeyedSubscript:*MEMORY[0x1E4F54128]];
  *unint64_t v6 = (id)[v24 objectForKeyedSubscript:*MEMORY[0x1E4F53DE0]];
  -[BWQuickTimeMovieFileSinkNode _determineWhichInputsWeExpectToSeeSamplesFor](a1);
  if (*(void *)(a1 + 552))
  {
    unint64_t v25 = 0;
    do
    {
      CFTypeRef v26 = (void *)[*(id *)(a1 + 392) objectAtIndex:v25];
      CFTypeRef v27 = CMGetAttachment((CMAttachmentBearerRef)[v26 firstObject], @"TrackFormatDescription", 0);
      uint64_t v28 = *(void *)(a1 + 640);
      int v29 = *(const void **)(v28 + 8 * v25);
      *(void *)(v28 + 8 * v25) = v27;
      if (v27) {
        CFRetain(v27);
      }
      if (v29) {
        CFRelease(v29);
      }
      [v26 removeObjectAtIndex:0];
      ++v25;
    }
    while (v25 < *(void *)(a1 + 552));
  }
  id v30 = (id)[v10 copy];
  *a2 = v30;
  if (*(void *)(a1 + 944))
  {
    uint64_t v31 = [v30 spatialOverCaptureMovieURL];
    id v30 = *a2;
    if (v31)
    {
      objc_msgSend(*a2, "setOutputURL:", objc_msgSend(v30, "spatialOverCaptureMovieURL"));
      objc_msgSend(*a2, "setMovieLevelMetadata:", objc_msgSend(*a2, "spatialOverCaptureMovieLevelMetadata"));
      id v30 = *a2;
    }
  }
  [v30 setSpatialOverCaptureMovieURL:0];
  [*a2 setSpatialOverCaptureMovieLevelMetadata:0];
  if (*(unsigned char *)(a1 + 1492))
  {
    -[BWQuickTimeMovieFileSinkNode _addStereoMovieLevelMetadataToSettingsMovieLevelMetadata:](a1, *a2);
    if (!*(void *)(a1 + 1512)) {
      *(void *)(a1 + 1512) = objc_alloc_init(BWStereoVideoCaptureAnalyticsPayload);
    }
  }
  *(_OWORD *)a5 = *(_OWORD *)&v39.value;
  CMTimeEpoch epoch = v39.epoch;
LABEL_44:
  a5[2] = epoch;
}

- (void)_determineWhichInputsWeExpectToSeeSamplesFor
{
  if (a1)
  {
    bzero(*(void **)(a1 + 616), *(void *)(a1 + 552));
    if (*(void *)(a1 + 552))
    {
      unint64_t v2 = 0;
      CFTypeRef v3 = (CFTypeRef)*MEMORY[0x1E4F1CFD0];
      do
      {
        *(unsigned char *)(*(void *)(a1 + 616) + v2) = CMGetAttachment((CMAttachmentBearerRef)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 392), "objectAtIndexedSubscript:", v2), "objectAtIndexedSubscript:", 0), @"FileWriterStartActionModifier_NoDataWillBeProvidedForThisRecording", 0) != v3;
        ++v2;
      }
      while (v2 < *(void *)(a1 + 552));
    }
  }
}

- (void)_addStereoMovieLevelMetadataToSettingsMovieLevelMetadata:(uint64_t)a1
{
  if (a1)
  {
    id MovieLevelMetadataWithSpatialVersionMetadata = (id)FigCaptureMetadataUtilitiesCreateMovieLevelMetadataWithSpatialVersionMetadata((void *)[a2 movieLevelMetadata], @"1.0");
    [a2 setMovieLevelMetadata:MovieLevelMetadataWithSpatialVersionMetadata];
  }
}

- (uint64_t)_findMarkers:(uint64_t)a3@<X8>
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (!result)
  {
    *(void *)a3 = 0;
    *(void *)(a3 + 8) = 0;
    *(void *)(a3 + 16) = 0;
    return result;
  }
  uint64_t v4 = result;
  CMTimeValue value = *MEMORY[0x1E4F1F9F8];
  CMTimeFlags flags = *(_DWORD *)(MEMORY[0x1E4F1F9F8] + 12);
  CMTimeScale timescale = *(_DWORD *)(MEMORY[0x1E4F1F9F8] + 8);
  CMTimeEpoch epoch = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  if (!*(void *)(result + 552)) {
    goto LABEL_20;
  }
  uint64_t v8 = 0;
  unint64_t v9 = 0;
  do
  {
    uint64_t v10 = objc_msgSend(*(id *)(v4 + 392), "objectAtIndex:", v9, v14, v15);
    result = [v10 count];
    if (!result) {
      goto LABEL_11;
    }
    unint64_t v11 = (opaqueCMSampleBuffer *)[v10 firstObject];
    if (BWSampleBufferIsMarkerBuffer(v11)
      && (qtmfsn_bufferSpecifiesFileWriterAction(v11, a2) & 1) != 0)
    {
      memset(&v20, 0, sizeof(v20));
      result = (uint64_t)CMSampleBufferGetPresentationTimeStamp(&v20, v11);
      if ((flags & 1) == 0)
      {
        CMTimeValue value = v20.value;
        CMTimeFlags flags = v20.flags;
        CMTimeScale timescale = v20.timescale;
        CMTimeEpoch epoch = v20.epoch;
LABEL_10:
        ++v8;
        goto LABEL_11;
      }
      time1.CMTimeScale timescale = timescale;
      time1.CMTimeFlags flags = flags;
      time1.CMTimeEpoch epoch = epoch;
      CMTime time2 = v20;
      time1.CMTimeValue value = value;
      result = CMTimeCompare(&time1, &time2);
      if (!result) {
        goto LABEL_10;
      }
      uint64_t v15 = v16;
      LODWORD(v14) = 0;
    }
    else
    {
      uint64_t v15 = v16;
      LODWORD(v14) = 0;
    }
    result = FigDebugAssert3();
LABEL_11:
    ++v9;
    unint64_t v12 = *(void *)(v4 + 552);
  }
  while (v9 < v12);
  if (v8 == v12)
  {
    if (v12)
    {
      unint64_t v13 = 0;
      do
        result = objc_msgSend((id)objc_msgSend(*(id *)(v4 + 392), "objectAtIndex:", v13++, v14), "removeObjectAtIndex:", 0);
      while (v13 < *(void *)(v4 + 552));
    }
LABEL_20:
    *(void *)a3 = value;
    *(_DWORD *)(a3 + 8) = timescale;
    *(_DWORD *)(a3 + 12) = flags;
    *(void *)(a3 + 16) = epoch;
  }
  else
  {
    *(_OWORD *)a3 = *MEMORY[0x1E4F1F9F8];
    *(void *)(a3 + 16) = v17;
  }
  return result;
}

- (uint64_t)_handleFormatWriterErrorOccurredCallback:(void *)a3 userInfo:
{
  if (result)
  {
    uint64_t v4 = result;
    pthread_mutex_lock(*(pthread_mutex_t **)(result + 824));
    *(_DWORD *)(v4 + 724) = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F32BD8]), "integerValue");
    if (!*(_DWORD *)(v4 + 724)) {
      *(_DWORD *)(v4 + 724) = -1;
    }
    unint64_t v5 = *(pthread_mutex_t **)(v4 + 824);
    return pthread_mutex_unlock(v5);
  }
  return result;
}

- (uint64_t)_isLastFallbackAudioTrack:(void *)a1
{
  if (!a1) {
    return 0;
  }
  uint64_t v3 = [NSNumber numberWithUnsignedInt:(a2 - 1)];
  uint64_t v4 = (void *)[a1 trackReferenceListForAudioInputs];
  if ((unint64_t)[v4 count] < 2
    || ([v4 count] & 1) != 0
    || ![v4 count])
  {
    return 1;
  }
  unint64_t v5 = 0;
  do
  {
    uint64_t v6 = [v4 objectAtIndex:v5];
    BOOL v7 = v6 != v3;
    if (v6 == v3) {
      break;
    }
    v5 += 2;
  }
  while ([v4 count] > v5);
  return v7;
}

- (uint64_t)_startUpFormatWriterAtTime:(void *)a3 withSettings:
{
  v303[1] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  CFDictionaryRef theDict = 0;
  bzero(*(void **)(a1 + 624), *(void *)(a1 + 552));
  bzero(*(void **)(a1 + 632), *(void *)(a1 + 560) + *(void *)(a1 + 552));
  *(unsigned char *)(a1 + 714) = 0;
  *(unsigned char *)(a1 + 715) = 0;
  *(void *)(a1 + 176) = 0;
  uint64_t v6 = (long long *)MEMORY[0x1E4F1FA48];
  CMTimeEpoch v7 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  *(void *)(a1 + 248) = v7;
  long long v8 = *v6;
  *(_OWORD *)(a1 + 232) = *v6;
  long long v283 = v8;
  *(_OWORD *)(a1 + 256) = v8;
  *(void *)(a1 + 272) = v7;
  HostTimeClocuint64_t k = CMClockGetHostTimeClock();
  CMClockGetTime(&time, HostTimeClock);
  *(CMTime *)(a1 + 352) = time;
  uint64_t v10 = *(void *)(a1 + 368);
  *(_OWORD *)(a1 + 280) = *(_OWORD *)(a1 + 352);
  *(void *)(a1 + 296) = v10;
  *(_DWORD *)(a1 + 376) = 600;
  *(_DWORD *)(a1 + 688) = 0;
  *(_DWORD *)(a1 + 692) = 0;
  [(id)a1 setMovieLevelMetadata:0];
  *(void *)(a1 + 192) = 0;
  *(void *)(a1 + 200) = 0;
  v270 = a3;
  if (qtmfsn_movieRecordingIsProRes(a3)) {
    BWGetCurrentTotalNANDReadAndWriteBytes((uint64_t *)(a1 + 192), (uint64_t *)(a1 + 200));
  }
  CMTimeMake(&time, 0, 1);
  *(CMTime *)(a1 + 304) = time;
  uint64_t v11 = a1;
  if (!*(void *)(a1 + 304))
  {
    uint64_t v12 = MEMORY[0x1E4F1F9F8];
    *(_OWORD *)(a1 + 304) = *MEMORY[0x1E4F1F9F8];
    *(void *)(a1 + 320) = *(void *)(v12 + 16);
  }
  *(void *)(a1 + 184) = 0;
  *(void *)(a1 + 216) = 0;
  uint64_t FigBaseObject = FigFormatWriterGetFigBaseObject();
  uint64_t v14 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v14) {
    uint64_t v15 = v14;
  }
  else {
    uint64_t v15 = 0;
  }
  uint64_t v16 = *(uint64_t (**)(uint64_t, void))(v15 + 48);
  if (!v16)
  {
    uint64_t v23 = 4294954514;
LABEL_16:
    LODWORD(v252) = v23;
    FigDebugAssert3();
    uint64_t v24 = 0;
    objc_msgSend(*(id *)(v11 + 1000), "logErrorNumber:errorString:", v23, @"starting format writer", v252, v285);
    goto LABEL_215;
  }
  CFAllocatorRef allocator = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  uint64_t v17 = v16(FigBaseObject, *MEMORY[0x1E4F32CF0]);
  if (v17)
  {
    uint64_t v23 = v17;
    goto LABEL_16;
  }
  uint64_t v276 = a1;
  if (theDict)
  {
    Value = CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x1E4F32FD8]);
    uint64_t v19 = (void *)MEMORY[0x1E4F33080];
    if (Value)
    {
      uint64_t v20 = FigMetadataWriterGetFigBaseObject();
      uint64_t v21 = *(void *)(CMBaseObjectGetVTable() + 8);
      if (v21) {
        uint64_t v22 = v21;
      }
      else {
        uint64_t v22 = 0;
      }
      unint64_t v25 = *(uint64_t (**)(uint64_t, void, void *))(v22 + 56);
      if (v25) {
        uint64_t v23 = v25(v20, *v19, &unk_1EFAFE5F8);
      }
      else {
        uint64_t v23 = 4294954514;
      }
    }
    else
    {
      uint64_t v23 = 0;
    }
    if (CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x1E4F32FD0]))
    {
      uint64_t v26 = FigMetadataWriterGetFigBaseObject();
      uint64_t v27 = *(void *)(CMBaseObjectGetVTable() + 8);
      if (v27) {
        uint64_t v28 = v27;
      }
      else {
        uint64_t v28 = 0;
      }
      int v29 = *(uint64_t (**)(uint64_t, void, void *))(v28 + 56);
      if (v29) {
        uint64_t v23 = v29(v26, *v19, &unk_1EFAFE5F8);
      }
      else {
        uint64_t v23 = 4294954514;
      }
    }
  }
  else
  {
    uint64_t v23 = 0;
  }
  memset(&v296, 0, sizeof(v296));
  if (a3)
  {
    [a3 movieFragmentInterval];
    uint64_t v30 = a1;
    if (v296.flags)
    {
      CMTime time = v296;
      CFDictionaryRef v31 = CMTimeCopyAsDictionary(&time, allocator);
      uint64_t v32 = FigFormatWriterGetFigBaseObject();
      uint64_t v33 = *(void *)(CMBaseObjectGetVTable() + 8);
      uint64_t v34 = v33 ? v33 : 0;
      uint64_t v35 = *(uint64_t (**)(uint64_t, void, CFDictionaryRef))(v34 + 56);
      uint64_t v23 = v35 ? v35(v32, *MEMORY[0x1E4F32D00], v31) : 4294954514;
      uint64_t v30 = a1;
      *(unsigned char *)(a1 + 714) = v23 == 0;
      if (v31) {
        CFRelease(v31);
      }
    }
  }
  else
  {
    uint64_t v30 = a1;
  }
  uint64_t v268 = a2;
  [a3 outputURL];
  int IsFileOnExternalStorageDevice = FigFileIsFileOnExternalStorageDevice();
  BOOL v37 = (void *)MEMORY[0x1E4F1CFD0];
  if (IsFileOnExternalStorageDevice)
  {
    memset(&time, 0, sizeof(time));
    CMTimeMakeWithSeconds(&time, 1.0, 1);
    CMTime time2 = time;
    CFDictionaryRef v38 = CMTimeCopyAsDictionary(&time2, allocator);
    if (!v38) {
      goto LABEL_52;
    }
    CFDictionaryRef v39 = v38;
    uint64_t v40 = FigFormatWriterGetFigBaseObject();
    uint64_t v41 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v41) {
      uint64_t v42 = v41;
    }
    else {
      uint64_t v42 = 0;
    }
    uint64_t v43 = *(uint64_t (**)(uint64_t, void, CFDictionaryRef))(v42 + 56);
    if (v43)
    {
      int v44 = v43(v40, *MEMORY[0x1E4F32CC8], v39);
      uint64_t v30 = a1;
      if (!v44)
      {
LABEL_51:
        CFRelease(v39);
LABEL_52:
        uint64_t v45 = FigFormatWriterGetFigBaseObject();
        uint64_t v46 = *(void *)(CMBaseObjectGetVTable() + 8);
        if (v46) {
          uint64_t v47 = v46;
        }
        else {
          uint64_t v47 = 0;
        }
        uint64_t v48 = *(uint64_t (**)(uint64_t, __CFString *, void))(v47 + 56);
        if (v48)
        {
          int v49 = v48(v45, @"JoinWritingThreadToNewWorkgroup", *v37);
          if (!v49)
          {
LABEL_60:
            uint64_t v23 = 0;
            goto LABEL_61;
          }
        }
        else
        {
          int v49 = -12782;
        }
        uint64_t v254 = v285;
        LODWORD(v252) = v49;
        FigDebugAssert3();
        goto LABEL_60;
      }
    }
    else
    {
      int v44 = -12782;
    }
    uint64_t v254 = v285;
    LODWORD(v252) = v44;
    FigDebugAssert3();
    uint64_t v30 = a1;
    goto LABEL_51;
  }
LABEL_61:
  if ((*(unsigned char *)(v30 + 316) & 1) == 0)
  {
    if (a3) {
      [a3 maxDuration];
    }
    else {
      memset(&time, 0, sizeof(time));
    }
    *(CMTime *)(v30 + 304) = time;
    if (*(unsigned char *)(v30 + 316))
    {
      CMTime time = *(CMTime *)(v30 + 304);
      *(_OWORD *)&time2.CMTimeValue value = v283;
      time2.CMTimeEpoch epoch = v7;
      if (!CMTimeCompare(&time, &time2))
      {
        uint64_t v50 = MEMORY[0x1E4F1F9F8];
        *(_OWORD *)(v30 + 304) = *MEMORY[0x1E4F1F9F8];
        *(void *)(v30 + 320) = *(void *)(v50 + 16);
      }
    }
  }
  if (!*(void *)(v30 + 184))
  {
    *(void *)(v30 + 184) = [a3 maxFileSize];
    [a3 outputURL];
    if (FigFileIsFileOnExternalStorageDevice())
    {
      uint64_t v55 = (void *)[a3 outputURL];
      uint64_t v56 = *MEMORY[0x1E4F1C888];
      v303[0] = *MEMORY[0x1E4F1C888];
      uint64_t v57 = objc_msgSend(v55, "resourceValuesForKeys:error:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v303, 1), 0);
      if (v57)
      {
        long long v58 = (void *)[v57 objectForKeyedSubscript:v56];
        if (v58)
        {
          uint64_t v59 = v58;
          unint64_t v60 = *(void *)(v30 + 184);
          unint64_t v61 = [v58 longLongValue];
          if (v60)
          {
            if (v60 >= v61) {
              unint64_t v61 = [v59 longLongValue];
            }
            else {
              unint64_t v61 = *(void *)(v30 + 184);
            }
          }
          *(void *)(v30 + 184) = v61;
        }
      }
    }
  }
  if (!*(void *)(v30 + 216)) {
    *(void *)(v30 + 216) = [a3 minFreeDiskSpaceLimit];
  }
  uint64_t v51 = objc_msgSend(a3, "movieLevelMetadata", v252, v254);
  [(id)v30 setMovieLevelMetadata:v51];
  if (v51)
  {
    uint64_t v52 = FigFormatWriterGetFigBaseObject();
    uint64_t v53 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v53) {
      uint64_t v54 = v53;
    }
    else {
      uint64_t v54 = 0;
    }
    CMTimeEpoch v62 = *(uint64_t (**)(uint64_t, void, uint64_t))(v54 + 56);
    if (v62)
    {
      uint64_t v23 = v62(v52, *MEMORY[0x1E4F32CE8], v51);
      if (!v23)
      {
        uint64_t v30 = a1;
        goto LABEL_84;
      }
    }
    else
    {
      uint64_t v23 = 4294954514;
    }
    uint64_t v256 = v285;
    LODWORD(v253) = v23;
    FigDebugAssert3();
    uint64_t v24 = 0;
LABEL_213:
    uint64_t v30 = v276;
    goto LABEL_214;
  }
LABEL_84:
  uint64_t v63 = *(void *)(v30 + 320);
  *(_OWORD *)(v30 + 328) = *(_OWORD *)(v30 + 304);
  *(void *)(v30 + 344) = v63;
  *(void *)(v30 + 208) = 1000000;
  *(void *)(v30 + 224) = 0;
  uint64_t v64 = (void *)[(id)v30 trackReferenceListForMetadataInputs];
  long long v65 = v64;
  if (*(void *)(v30 + 728))
  {
    if ([v64 count]) {
      uint64_t v24 = (unsigned int *)malloc_type_calloc(*(void *)(v30 + 728), 4uLL, 0x100004052888210uLL);
    }
    else {
      uint64_t v24 = 0;
    }
  }
  else
  {
    uint64_t v24 = 0;
  }
  v269 = v24;
  if (!*(void *)(v30 + 552))
  {
LABEL_201:
    if ([a3 isIrisRecording])
    {
      uint64_t v164 = v268;
      if (v24 && (int)*v24 >= 1 && ([a3 isIrisMovieRecording] & 1) == 0)
      {
        uint64_t v165 = FigFormatWriterAddTrack(*(void *)(v30 + 592), 1835365473, v30 + 688);
        if (v165)
        {
          uint64_t v23 = v165;
          uint64_t v256 = v285;
          LODWORD(v253) = v165;
          goto LABEL_329;
        }
        qtmfsn_setTrackProperties(*(void *)(v30 + 592), *(unsigned int *)(v30 + 688), 1835365473, a3);
        *(_DWORD *)(v30 + 692) = *v24;
        uint64_t v166 = FigFormatWriterSetTrackProperty(*(void *)(v30 + 592), *(unsigned int *)(v30 + 688), *MEMORY[0x1E4F32E60], [NSNumber numberWithInt:*(unsigned int *)(v30 + 692)]);
        if (v166)
        {
          uint64_t v23 = v166;
          LODWORD(v253) = v166;
          FigDebugAssert3();
          objc_msgSend(*(id *)(v30 + 1000), "logErrorNumber:errorString:", v23, @"starting format writer", v253, v285);
          goto LABEL_215;
        }
        uint64_t v167 = FigFormatWriterSetTrackProperty(*(void *)(v30 + 592), *(unsigned int *)(v30 + 688), *MEMORY[0x1E4F32E20], *MEMORY[0x1E4F1CFC8]);
        if (v167)
        {
          uint64_t v23 = v167;
          uint64_t v256 = v285;
          LODWORD(v253) = v167;
          goto LABEL_329;
        }
        if (*(void *)(v30 + 888)) {
          BOOL v168 = (void *)[MEMORY[0x1E4F1C9B8] data];
        }
        else {
          BOOL v168 = 0;
        }
        int32_t v170 = *(_DWORD *)(v30 + 692);
        *(_OWORD *)&time.CMTimeValue value = v283;
        time.CMTimeEpoch epoch = v7;
        QuickTimeMovieStillImageTimeSampleBuffer = FigCaptureMetadataUtilitiesCreateQuickTimeMovieStillImageTimeSampleBuffer((uint64_t)&time, v168, *(void *)(v30 + 896), v170);
        if (!QuickTimeMovieStillImageTimeSampleBuffer)
        {
          LODWORD(v253) = 0;
          FigDebugAssert3();
          uint64_t v23 = 4294954586;
          objc_msgSend(*(id *)(v30 + 1000), "logErrorNumber:errorString:", 4294954586, @"starting format writer", v253, v285);
          goto LABEL_215;
        }
        long long v172 = QuickTimeMovieStillImageTimeSampleBuffer;
        uint64_t v173 = *(void *)(v30 + 592);
        uint64_t v174 = *(unsigned int *)(v30 + 688);
        uint64_t v175 = *MEMORY[0x1E4F32E00];
        CMFormatDescriptionRef FormatDescription = CMSampleBufferGetFormatDescription(QuickTimeMovieStillImageTimeSampleBuffer);
        uint64_t v23 = FigFormatWriterSetTrackProperty(v173, v174, v175, [MEMORY[0x1E4F1C978] arrayWithObjects:&FormatDescription count:1]);
        CFRelease(v172);
        if (v23)
        {
          uint64_t v256 = v285;
          LODWORD(v253) = v23;
          goto LABEL_212;
        }
        uint64_t v30 = v276;
        a3 = v270;
      }
    }
    else
    {
      uint64_t v164 = v268;
    }
    if (([a3 isIrisRecording] & 1) == 0)
    {
      uint64_t v176 = -[BWQuickTimeMovieFileSinkNode _addMovieSegmentMetadataTrackUsingMovieSettings:withVideoTimeScales:](v30, a3, v24);
      uint64_t v23 = v176;
      if (v176)
      {
        uint64_t v256 = v285;
        LODWORD(v253) = v176;
        goto LABEL_329;
      }
    }
    v177 = (void *)[(id)v30 structuralDependentTrackReferenceListForMetadataInputs];
    long long v178 = (void *)[(id)v30 trackReferenceListForRenderMetadataInputs];
    uint64_t v179 = (void *)[(id)v30 trackReferenceListForVideoInputs];
    long long v180 = (void *)[(id)v30 trackReferenceListForAudioInputs];
    uint64_t v181 = [(id)v30 trackReferenceListForAudioRemixInputs];
    uint64_t v182 = v30;
    uint64_t v183 = (void *)v181;
    if (!v65)
    {
      BOOL v184 = *(int *)(v182 + 688) <= 0 && v179 == 0;
      BOOL v185 = v184 && v180 == 0;
      if (v185 && v181 == 0)
      {
        uint64_t v24 = v269;
        CMTime v193 = v270;
        goto LABEL_275;
      }
    }
    CMTimeEpoch v187 = -[BWQuickTimeMovieFileSinkNode _validTrackReferencesForReferenceInputIndexes:](v182, v65);
    if (*(int *)(v182 + 688) >= 1)
    {
      objc_msgSend(v187, "addObject:", objc_msgSend(NSNumber, "numberWithInt:"));
      objc_msgSend(v187, "addObject:", objc_msgSend(NSNumber, "numberWithInt:", **(unsigned int **)(v182 + 608)));
    }
    if ([v183 count]) {
      objc_msgSend(v187, "addObjectsFromArray:", -[BWQuickTimeMovieFileSinkNode _validTrackReferencesForReferenceInputIndexes:](v276, v183));
    }
    CMTime v188 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithCapacity:3];
    if ([v187 count])
    {
      [v188 setObject:v187 forKeyedSubscript:*MEMORY[0x1E4F34AE8]];
      if ([v177 count])
      {
        long long v189 = -[BWQuickTimeMovieFileSinkNode _validTrackReferencesForReferenceInputIndexes:](v276, v177);
        if ([v189 count]) {
          [v188 setObject:v189 forKeyedSubscript:*MEMORY[0x1E4F34AF8]];
        }
      }
    }
    if ([v178 count])
    {
      CMTimeEpoch v190 = -[BWQuickTimeMovieFileSinkNode _validTrackReferencesForReferenceInputIndexes:](v276, v178);
      if ([v190 count]) {
        [v188 setObject:v190 forKeyedSubscript:*MEMORY[0x1E4F34AF0]];
      }
    }
    if ([v179 count])
    {
      long long v191 = -[BWQuickTimeMovieFileSinkNode _validTrackReferencesForReferenceInputIndexes:](v276, v179);
      if ([v191 count]) {
        [v188 setObject:v191 forKeyedSubscript:@"vmap"];
      }
    }
    uint64_t v24 = v269;
    if ([v180 count])
    {
      CMTimeEpoch v192 = -[BWQuickTimeMovieFileSinkNode _validTrackReferencesForReferenceInputIndexes:](v276, v180);
      if ([v192 count]) {
        [v188 setObject:v192 forKeyedSubscript:@"fall"];
      }
    }
    CMTime v193 = v270;
    if (![v188 count])
    {
LABEL_275:
      uint64_t v30 = v276;
      v199 = objc_msgSend((id)v276, "taggedMediaCharacteristicsForInputs", v253, v255);
      if ([v199 count])
      {
        v200 = -[BWQuickTimeMovieFileSinkNode _validateTaggedMediaCharacteristicsForInputIndexes:](v276, v199);
        long long v290 = 0u;
        long long v291 = 0u;
        long long v292 = 0u;
        long long v293 = 0u;
        id obja = v200;
        uint64_t v282 = [v200 countByEnumeratingWithState:&v290 objects:v300 count:16];
        if (v282)
        {
          uint64_t v280 = *(void *)v291;
          uint64_t v272 = *MEMORY[0x1E4F32E80];
          keya = (void *)*MEMORY[0x1E4F32FD8];
          uint64_t v201 = *MEMORY[0x1E4F34B08];
          uint64_t v202 = *MEMORY[0x1E4F34B00];
          while (1)
          {
            uint64_t v203 = 0;
            do
            {
              if (*(void *)v291 != v280) {
                objc_enumerationMutation(obja);
              }
              uint64_t v284 = v203;
              int v204 = *(void **)(*((void *)&v290 + 1) + 8 * v203);
              time.CMTimeValue value = 0;
              uint64_t v205 = *(void *)(v30 + 592);
              uint64_t v206 = objc_msgSend(v204, "unsignedIntValue", v253, v256);
              uint64_t v207 = *(void *)(CMBaseObjectGetVTable() + 16);
              if (v207) {
                uint64_t v208 = v207;
              }
              else {
                uint64_t v208 = 0;
              }
              v209 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, const __CFAllocator *, CMTime *))(v208 + 16);
              if (!v209)
              {
                int v210 = -12782;
LABEL_288:
                uint64_t v256 = v285;
                LODWORD(v253) = v210;
                FigDebugAssert3();
                goto LABEL_289;
              }
              int v210 = v209(v205, v206, v272, allocator, &time);
              if (v210) {
                goto LABEL_288;
              }
LABEL_289:
              if (!time.value) {
                goto LABEL_308;
              }
              v211 = CFDictionaryGetValue((CFDictionaryRef)time.value, keya);
              if (!v211) {
                goto LABEL_306;
              }
              v212 = v211;
              long long v288 = 0u;
              long long v289 = 0u;
              long long v286 = 0u;
              long long v287 = 0u;
              v213 = (void *)[obja objectForKeyedSubscript:v204];
              uint64_t v214 = [v213 countByEnumeratingWithState:&v286 objects:v299 count:16];
              if (!v214) {
                goto LABEL_306;
              }
              uint64_t v215 = v214;
              uint64_t v216 = *(void *)v287;
              do
              {
                for (uint64_t i = 0; i != v215; ++i)
                {
                  if (*(void *)v287 != v216) {
                    objc_enumerationMutation(v213);
                  }
                  uint64_t v218 = *(void *)(*((void *)&v286 + 1) + 8 * i);
                  uint64_t v219 = *(void *)(CMBaseObjectGetVTable() + 16);
                  if (v219) {
                    uint64_t v220 = v219;
                  }
                  else {
                    uint64_t v220 = 0;
                  }
                  v221 = *(uint64_t (**)(const void *, uint64_t, uint64_t, uint64_t, void))(v220 + 8);
                  if (v221)
                  {
                    int v222 = v221(v212, v201, v202, v218, 0);
                    if (!v222) {
                      continue;
                    }
                  }
                  else
                  {
                    int v222 = -12782;
                  }
                  uint64_t v256 = v285;
                  LODWORD(v253) = v222;
                  FigDebugAssert3();
                }
                uint64_t v215 = [v213 countByEnumeratingWithState:&v286 objects:v299 count:16];
              }
              while (v215);
LABEL_306:
              uint64_t v30 = v276;
              if (time.value) {
                CFRelease((CFTypeRef)time.value);
              }
LABEL_308:
              uint64_t v203 = v284 + 1;
            }
            while (v284 + 1 != v282);
            uint64_t v282 = [obja countByEnumeratingWithState:&v290 objects:v300 count:16];
            if (!v282)
            {
              uint64_t v23 = 0;
              uint64_t v24 = v269;
              CMTime v193 = v270;
              uint64_t v164 = v268;
              break;
            }
          }
        }
      }
      if (*(unsigned char *)(v164 + 12))
      {
        uint64_t v223 = *(void *)(v30 + 592);
        CMTime time2 = *(CMTime *)v164;
        uint64_t v224 = *(void *)(CMBaseObjectGetVTable() + 16);
        if (v224) {
          uint64_t v225 = v224;
        }
        else {
          uint64_t v225 = 0;
        }
        v226 = *(uint64_t (**)(uint64_t, CMTime *))(v225 + 56);
        if (v226)
        {
          CMTime time = time2;
          uint64_t v23 = v226(v223, &time);
          if (!v23)
          {
            *(unsigned char *)(v30 + 712) = 1;
            goto LABEL_318;
          }
        }
        else
        {
          uint64_t v23 = 4294954514;
        }
        uint64_t v256 = v285;
        LODWORD(v253) = v23;
        goto LABEL_329;
      }
LABEL_318:
      uint64_t v227 = *(void *)(v164 + 16);
      *(_OWORD *)(v30 + 424) = *(_OWORD *)v164;
      *(void *)(v30 + 440) = v227;
      if ((objc_msgSend(v193, "isIrisRecording", v253) & 1) == 0)
      {
        uint64_t v228 = *(void *)(v30 + 440);
        *(_OWORD *)(v30 + 1584) = *(_OWORD *)(v30 + 424);
        *(void *)(v30 + 1600) = v228;
      }
      v229 = (long long *)MEMORY[0x1E4F1FA08];
      if (*(void *)(v30 + 560) + *(void *)(v30 + 552))
      {
        uint64_t v230 = 0;
        unint64_t v231 = 0;
        long long v232 = *MEMORY[0x1E4F1FA10];
        uint64_t v233 = *(void *)(MEMORY[0x1E4F1FA10] + 16);
        long long v234 = *MEMORY[0x1E4F1FA08];
        uint64_t v235 = *(void *)(MEMORY[0x1E4F1FA08] + 16);
        do
        {
          uint64_t v236 = *(void *)(v30 + 448) + v230;
          *(_OWORD *)uint64_t v236 = v232;
          *(void *)(v236 + 16) = v233;
          uint64_t v237 = *(void *)(v30 + 456) + v230;
          *(_OWORD *)uint64_t v237 = v234;
          *(void *)(v237 + 16) = v235;
          ++v231;
          v230 += 24;
        }
        while (v231 < *(void *)(v30 + 560) + *(void *)(v30 + 552));
      }
      if (*(void *)(v30 + 728))
      {
        uint64_t v238 = 0;
        unint64_t v239 = 0;
        long long v240 = *v229;
        uint64_t v241 = *((void *)v229 + 2);
        do
        {
          uint64_t v242 = *(void *)(v30 + 464) + v238;
          *(_OWORD *)uint64_t v242 = v240;
          *(void *)(v242 + 16) = v241;
          ++v239;
          unint64_t v243 = *(void *)(v30 + 728);
          v238 += 24;
        }
        while (v239 < v243);
      }
      else
      {
        unint64_t v243 = 0;
      }
      if (*(void *)(v30 + 744) + v243)
      {
        uint64_t v244 = 0;
        unint64_t v245 = 0;
        long long v246 = *v229;
        uint64_t v247 = *((void *)v229 + 2);
        long long v248 = *MEMORY[0x1E4F1F9F8];
        uint64_t v249 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
        do
        {
          uint64_t v250 = *(void *)(v30 + 472) + v244;
          *(_OWORD *)uint64_t v250 = v246;
          *(void *)(v250 + 16) = v247;
          uint64_t v251 = *(void *)(v30 + 480) + v244;
          *(_OWORD *)uint64_t v251 = v248;
          *(void *)(v251 + 16) = v249;
          ++v245;
          v244 += 24;
        }
        while (v245 < *(void *)(v30 + 744) + *(void *)(v30 + 728));
      }
      *(unsigned char *)(v30 + 713) = 1;
      *(void *)(v30 + 912) = 0;
      *(void *)(v30 + 920) = 0;
      [*(id *)(v30 + 1544) removeAllObjects];
      if (v23) {
        goto LABEL_214;
      }
      goto LABEL_215;
    }
    uint64_t v194 = FigFormatWriterGetFigBaseObject();
    uint64_t v195 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v195) {
      uint64_t v196 = v195;
    }
    else {
      uint64_t v196 = 0;
    }
    CMTimeEpoch v197 = *(uint64_t (**)(uint64_t, void, void *))(v196 + 56);
    if (v197)
    {
      int v198 = v197(v194, *MEMORY[0x1E4F32D50], v188);
      if (!v198)
      {
LABEL_273:
        uint64_t v23 = 0;
        goto LABEL_275;
      }
    }
    else
    {
      int v198 = -12782;
    }
    uint64_t v255 = v285;
    LODWORD(v253) = v198;
    FigDebugAssert3();
    goto LABEL_273;
  }
  uint64_t v66 = 0;
  int v271 = 0;
  char v281 = 0;
  uint64_t v279 = *MEMORY[0x1E4F32E00];
  obuint64_t j = (id)*MEMORY[0x1E4F32E60];
  uint64_t v265 = *MEMORY[0x1E4F32E20];
  key = (void *)*MEMORY[0x1E4F1CFC8];
  uint64_t v257 = *MEMORY[0x1E4F32E98];
  long long v67 = &OBJC_IVAR___BWPreviewStitcherNode__wantWideFallbackDueToTeleAEAF;
  v260 = (void *)*v37;
  uint64_t v261 = *MEMORY[0x1E4F32DA8];
  uint64_t v262 = *MEMORY[0x1E4F32DD8];
  uint64_t v259 = *MEMORY[0x1E4F32E48];
  uint64_t v258 = *MEMORY[0x1E4F32DF8];
  uint64_t v267 = *MEMORY[0x1E4F44930];
  uint64_t v266 = *MEMORY[0x1E4F44938];
  uint64_t v264 = *MEMORY[0x1E4F32E10];
  uint64_t v263 = *MEMORY[0x1E4F32E18];
  while (!*(unsigned char *)(*(void *)(v30 + v67[312]) + v66))
  {
LABEL_200:
    if ((unint64_t)++v66 >= *(void *)(v30 + 552)) {
      goto LABEL_201;
    }
  }
  uint64_t v68 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)v30, "inputs"), "objectAtIndex:", v66), "mediaType");
  uint64_t v69 = v30;
  uint64_t v70 = *(void *)(v30 + 592);
  uint64_t v71 = *(void *)(v69 + 608);
  uint64_t v72 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v72) {
    uint64_t v73 = v72;
  }
  else {
    uint64_t v73 = 0;
  }
  unint64_t v74 = *(uint64_t (**)(uint64_t, uint64_t, void, uint64_t))(v73 + 8);
  if (!v74)
  {
    uint64_t v23 = 4294954514;
LABEL_211:
    uint64_t v256 = v285;
    LODWORD(v253) = v23;
    goto LABEL_212;
  }
  uint64_t v75 = v74(v70, v68, 0, v71 + 4 * v66);
  if (v75)
  {
    uint64_t v23 = v75;
    goto LABEL_211;
  }
  uint64_t v30 = v276;
  qtmfsn_setTrackProperties(*(void *)(v276 + 592), *(unsigned int *)(*(void *)(v276 + 608) + 4 * v66), v68, a3);
  if (!*(void *)(*(void *)(v276 + 640) + 8 * v66)) {
    goto LABEL_107;
  }
  uint64_t v76 = *(void *)(v276 + 592);
  uint64_t v77 = *(unsigned int *)(*(void *)(v276 + 608) + 4 * v66);
  uint64_t v302 = *(void *)(*(void *)(v276 + 640) + 8 * v66);
  uint64_t v78 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v302 count:1];
  uint64_t v79 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v79) {
    uint64_t v80 = v79;
  }
  else {
    uint64_t v80 = 0;
  }
  uint64_t v81 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v80 + 24);
  if (!v81)
  {
    uint64_t v23 = 4294954514;
LABEL_221:
    uint64_t v256 = v285;
    LODWORD(v253) = v23;
    goto LABEL_338;
  }
  uint64_t v82 = v81(v76, v77, v279, v78);
  if (v82)
  {
    uint64_t v23 = v82;
    goto LABEL_221;
  }
  uint64_t v30 = v276;
  uint64_t v83 = *(const void **)(*(void *)(v276 + 640) + 8 * v66);
  uint64_t v24 = v269;
  a3 = v270;
  if (v83)
  {
    CFRelease(v83);
    *(void *)(*(void *)(v276 + 640) + 8 * v66) = 0;
  }
LABEL_107:
  uint64_t v23 = 0;
  if ((int)v68 > 1936684397)
  {
    if (v68 == 1936684398)
    {
      if ([a3 isIrisRecording])
      {
        CMTimeMake(&v294, 10, 1);
        CFDictionaryRef v94 = CMTimeCopyAsDictionary(&v294, allocator);
        uint64_t v95 = v30;
        uint64_t v96 = *(void *)(v30 + 592);
        uint64_t v97 = *(unsigned int *)(*(void *)(v95 + 608) + 4 * v66);
        uint64_t v98 = *(void *)(CMBaseObjectGetVTable() + 16);
        if (v98) {
          uint64_t v99 = v98;
        }
        else {
          uint64_t v99 = 0;
        }
        v116 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, CFDictionaryRef))(v99 + 24);
        if (!v116)
        {
          CFRelease(v94);
          uint64_t v23 = 4294954514;
LABEL_348:
          uint64_t v256 = v285;
          LODWORD(v253) = v23;
          goto LABEL_212;
        }
        uint64_t v23 = v116(v96, v97, v257, v94);
        CFRelease(v94);
        uint64_t v30 = v276;
        a3 = v270;
        if (v23) {
          goto LABEL_348;
        }
      }
      ++v271;
      if (![*(id *)(v30 + 528) count]) {
        goto LABEL_198;
      }
      uint64_t v117 = *(void *)(v30 + 592);
      uint64_t v118 = *(unsigned int *)(*(void *)(v30 + 608) + 4 * v66);
      uint64_t v119 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v119) {
        uint64_t v120 = v119;
      }
      else {
        uint64_t v120 = 0;
      }
      v121 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, void *))(v120 + 24);
      if (v121)
      {
        uint64_t v122 = v121(v117, v118, v261, &unk_1EFAFE610);
        if (!v122)
        {
          int v123 = -[BWQuickTimeMovieFileSinkNode _isLastFallbackAudioTrack:]((void *)v30, v271);
          uint64_t v124 = v30;
          uint64_t v125 = *(void *)(v30 + 592);
          if (v123) {
            v126 = v260;
          }
          else {
            v126 = key;
          }
          uint64_t v127 = *(unsigned int *)(*(void *)(v124 + 608) + 4 * v66);
          uint64_t v128 = *(void *)(CMBaseObjectGetVTable() + 16);
          if (v128) {
            uint64_t v129 = v128;
          }
          else {
            uint64_t v129 = 0;
          }
          uint64_t v130 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, void *))(v129 + 24);
          if (v130)
          {
            uint64_t v131 = v130(v125, v127, v262, v126);
            if (!v131)
            {
              uint64_t v30 = v276;
              uint64_t v132 = FigFormatWriterSetTrackProperty(*(void *)(v276 + 592), *(unsigned int *)(*(void *)(v276 + 608) + 4 * v66), v259, @"und");
              if (!v132)
              {
                uint64_t v133 = FigFormatWriterSetTrackProperty(*(void *)(v276 + 592), *(unsigned int *)(*(void *)(v276 + 608) + 4 * v66), v258, @"und");
                uint64_t v23 = v133;
                if (v133)
                {
                  uint64_t v256 = v285;
                  LODWORD(v253) = v133;
                  goto LABEL_329;
                }
                goto LABEL_199;
              }
              uint64_t v23 = v132;
              uint64_t v256 = v285;
              LODWORD(v253) = v132;
              goto LABEL_329;
            }
            uint64_t v23 = v131;
          }
          else
          {
            uint64_t v23 = 4294954514;
          }
          uint64_t v256 = v285;
          LODWORD(v253) = v23;
          goto LABEL_212;
        }
        uint64_t v23 = v122;
      }
      else
      {
        uint64_t v23 = 4294954514;
      }
      uint64_t v256 = v285;
      LODWORD(v253) = v23;
      goto LABEL_329;
    }
    if (v68 != 1986618469) {
      goto LABEL_199;
    }
LABEL_115:
    if (*(float *)(v30 + 384) < 120.0) {
      uint64_t v87 = 600;
    }
    else {
      uint64_t v87 = 2400;
    }
    uint64_t v88 = v30;
    uint64_t v89 = *(void *)(v30 + 592);
    uint64_t v90 = *(unsigned int *)(*(void *)(v88 + 608) + 4 * v66);
    uint64_t v91 = [NSNumber numberWithInt:v87];
    uint64_t v92 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v92) {
      uint64_t v93 = v92;
    }
    else {
      uint64_t v93 = 0;
    }
    int v100 = *(uint64_t (**)(uint64_t, uint64_t, id, uint64_t))(v93 + 24);
    if (v100)
    {
      uint64_t v101 = v100(v89, v90, obj, v91);
      if (!v101)
      {
        uint64_t v30 = v276;
        uint64_t v24 = v269;
        a3 = v270;
        if (v269) {
          v269[v66] = v87;
        }
        if (v66 == *(void *)(v276 + 704)) {
          *(_DWORD *)(v276 + 376) = v87;
        }
        if (![v270 isIrisRecording]) {
          goto LABEL_136;
        }
        uint64_t v102 = *(void *)(v276 + 592);
        uint64_t v103 = *(unsigned int *)(*(void *)(v276 + 608) + 4 * v66);
        uint64_t v104 = *(void *)(CMBaseObjectGetVTable() + 16);
        if (v104) {
          uint64_t v105 = v104;
        }
        else {
          uint64_t v105 = 0;
        }
        float v106 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, void *))(v105 + 24);
        if (v106)
        {
          uint64_t v107 = v106(v102, v103, v265, key);
          if (!v107)
          {
LABEL_136:
            if ((v281 & 1) == 0 || ![v270 isIrisRecording])
            {
LABEL_168:
              uint64_t v136 = [*(id *)(v276 + 928) objectForKeyedSubscript:v267];
              uint64_t v137 = [*(id *)(v276 + 928) objectForKeyedSubscript:v266];
              if (v136)
              {
                uint64_t v138 = *(void *)(v276 + 592);
                uint64_t v139 = *(unsigned int *)(*(void *)(v276 + 608) + 4 * v66);
                uint64_t v140 = *(void *)(CMBaseObjectGetVTable() + 16);
                if (v140) {
                  uint64_t v141 = v140;
                }
                else {
                  uint64_t v141 = 0;
                }
                uint64_t v142 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v141 + 24);
                if (v142)
                {
                  uint64_t v143 = v142(v138, v139, v264, v136);
                  a3 = v270;
                  if (!v143) {
                    goto LABEL_174;
                  }
                  uint64_t v23 = v143;
                }
                else
                {
                  uint64_t v23 = 4294954514;
                }
                uint64_t v256 = v285;
                LODWORD(v253) = v23;
                goto LABEL_212;
              }
LABEL_174:
              if (!v137)
              {
                uint64_t v23 = 0;
LABEL_181:
                char v281 = 1;
                uint64_t v30 = v276;
                goto LABEL_199;
              }
              uint64_t v144 = *(void *)(v276 + 592);
              uint64_t v145 = *(unsigned int *)(*(void *)(v276 + 608) + 4 * v66);
              uint64_t v146 = *(void *)(CMBaseObjectGetVTable() + 16);
              if (v146) {
                uint64_t v147 = v146;
              }
              else {
                uint64_t v147 = 0;
              }
              unsigned int v148 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v147 + 24);
              if (v148)
              {
                uint64_t v23 = v148(v144, v145, v263, v137);
                if (v23) {
                  goto LABEL_229;
                }
                goto LABEL_181;
              }
              uint64_t v23 = 4294954514;
LABEL_229:
              uint64_t v256 = v285;
              LODWORD(v253) = v23;
LABEL_212:
              FigDebugAssert3();
              goto LABEL_213;
            }
            uint64_t v108 = *(void *)(v276 + 592);
            uint64_t v109 = *(unsigned int *)(*(void *)(v276 + 608) + 4 * v66);
            uint64_t v110 = *(void *)(CMBaseObjectGetVTable() + 16);
            if (v110) {
              uint64_t v111 = v110;
            }
            else {
              uint64_t v111 = 0;
            }
            v134 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, void *))(v111 + 24);
            if (v134)
            {
              uint64_t v135 = v134(v108, v109, v262, key);
              if (!v135) {
                goto LABEL_168;
              }
              uint64_t v23 = v135;
            }
            else
            {
              uint64_t v23 = 4294954514;
            }
            uint64_t v256 = v285;
            LODWORD(v253) = v23;
LABEL_329:
            FigDebugAssert3();
            goto LABEL_214;
          }
          uint64_t v23 = v107;
        }
        else
        {
          uint64_t v23 = 4294954514;
        }
        uint64_t v256 = v285;
        LODWORD(v253) = v23;
        goto LABEL_329;
      }
      uint64_t v23 = v101;
    }
    else
    {
      uint64_t v23 = 4294954514;
    }
    uint64_t v256 = v285;
    LODWORD(v253) = v23;
    goto LABEL_338;
  }
  if (v68 == 1635088502) {
    goto LABEL_115;
  }
  if (v68 != 1835365473)
  {
LABEL_199:
    long long v67 = &OBJC_IVAR___BWPreviewStitcherNode__wantWideFallbackDueToTeleAEAF;
    goto LABEL_200;
  }
  if (v24 && (unint64_t v84 = *(void *)(v30 + 728), v85 = [v65 count], v85 >= 2))
  {
    unint64_t v112 = v85 >> 1;
    uint64_t v113 = 1;
    while (1)
    {
      int v114 = (void *)[v65 objectAtIndexedSubscript:v113 - 1];
      uint64_t v115 = (void *)[v65 objectAtIndexedSubscript:v113];
      if (v66 == [v114 unsignedIntValue]
        && v84 > [v115 unsignedIntValue])
      {
        break;
      }
      v113 += 2;
      if (!--v112)
      {
        uint64_t v86 = 10000;
        goto LABEL_185;
      }
    }
    int v149 = v269[[v115 unsignedIntValue]];
    if (v149 <= 0) {
      uint64_t v86 = 10000;
    }
    else {
      uint64_t v86 = v149;
    }
LABEL_185:
    uint64_t v30 = v276;
  }
  else
  {
    uint64_t v86 = 10000;
  }
  uint64_t v150 = v30;
  uint64_t v151 = *(void *)(v30 + 592);
  uint64_t v152 = *(unsigned int *)(*(void *)(v150 + 608) + 4 * v66);
  uint64_t v153 = [NSNumber numberWithInt:v86];
  uint64_t v154 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v154) {
    uint64_t v155 = v154;
  }
  else {
    uint64_t v155 = 0;
  }
  v156 = *(uint64_t (**)(uint64_t, uint64_t, id, uint64_t))(v155 + 24);
  if (!v156)
  {
    uint64_t v23 = 4294954514;
    goto LABEL_337;
  }
  uint64_t v157 = v156(v151, v152, obj, v153);
  if (!v157)
  {
    uint64_t v158 = *(void *)(v276 + 592);
    uint64_t v159 = *(unsigned int *)(*(void *)(v276 + 608) + 4 * v66);
    uint64_t v160 = *(void *)(CMBaseObjectGetVTable() + 16);
    a3 = v270;
    if (v160) {
      uint64_t v161 = v160;
    }
    else {
      uint64_t v161 = 0;
    }
    uint64_t v24 = v269;
    int v162 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, void *))(v161 + 24);
    if (v162)
    {
      uint64_t v163 = v162(v158, v159, v265, key);
      if (!v163)
      {
        uint64_t v30 = v276;
        if (v66 == *(void *)(v276 + 704))
        {
          uint64_t v23 = 0;
          *(_DWORD *)(v276 + 376) = v86;
          goto LABEL_199;
        }
LABEL_198:
        uint64_t v23 = 0;
        goto LABEL_199;
      }
      uint64_t v23 = v163;
    }
    else
    {
      uint64_t v23 = 4294954514;
    }
    uint64_t v256 = v285;
    LODWORD(v253) = v23;
    goto LABEL_212;
  }
  uint64_t v23 = v157;
LABEL_337:
  uint64_t v256 = v285;
  LODWORD(v253) = v23;
LABEL_338:
  FigDebugAssert3();
  uint64_t v30 = v276;
  uint64_t v24 = v269;
LABEL_214:
  objc_msgSend(*(id *)(v30 + 1000), "logErrorNumber:errorString:", v23, @"starting format writer", v253, v256);
LABEL_215:
  if (theDict) {
    CFRelease(theDict);
  }
  free(v24);
  return v23;
}

- (uint64_t)_addMovieSegmentMetadataTrackUsingMovieSettings:(unsigned int *)a3 withVideoTimeScales:
{
  v46[3] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  if (!*(void *)(a1 + 1560))
  {
    uint64_t v6 = *MEMORY[0x1E4F1F108];
    uint64_t v7 = *MEMORY[0x1E4F1F168];
    uint64_t v8 = *MEMORY[0x1E4F1F0F8];
    v45[0] = *MEMORY[0x1E4F1F108];
    v45[1] = v8;
    uint64_t v9 = *MEMORY[0x1E4F1F0B0];
    v46[0] = v7;
    v46[1] = v9;
    v45[2] = *MEMORY[0x1E4F1F118];
    uint64_t v43 = *MEMORY[0x1E4F1F120];
    uint64_t v44 = *MEMORY[0x1E4F1CFC8];
    v46[2] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
    uint64_t v10 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:v45 count:3];
    CFArrayRef v11 = (const __CFArray *)objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObjects:", v10, 0);
    uint64_t v12 = CMMetadataFormatDescriptionCreateWithMetadataSpecifications((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0x6D656278u, v11, (CMMetadataFormatDescriptionRef *)(a1 + 1560));
    if (v12)
    {
      uint64_t v25 = v12;
      goto LABEL_14;
    }
    [v10 objectForKeyedSubscript:v6];
    [v10 objectForKeyedSubscript:v8];
    [v10 objectForKeyedSubscript:*MEMORY[0x1E4F1F100]];
    *(_DWORD *)(a1 + 1568) = FigMetadataFormatDescriptionGetLocalIDForMetadataIdentifyingFactors();
  }
  uint64_t v13 = *(void *)(a1 + 592);
  uint64_t v14 = *(void *)(a1 + 608);
  uint64_t v15 = *(void *)(a1 + 1576);
  uint64_t v16 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v16) {
    uint64_t v17 = v16;
  }
  else {
    uint64_t v17 = 0;
  }
  BOOL v18 = *(uint64_t (**)(uint64_t, uint64_t, void, uint64_t))(v17 + 8);
  if (v18)
  {
    uint64_t v19 = v18(v13, 1835365473, 0, v14 + 4 * v15);
    if (v19)
    {
      uint64_t v25 = v19;
      goto LABEL_14;
    }
    qtmfsn_setTrackProperties(*(void *)(a1 + 592), *(unsigned int *)(*(void *)(a1 + 608) + 4 * *(void *)(a1 + 1576)), 1835365473, a2);
    if (a3)
    {
      uint64_t v20 = *(void *)(a1 + 592);
      uint64_t v21 = *(unsigned int *)(*(void *)(a1 + 608) + 4 * *(void *)(a1 + 1576));
      uint64_t v22 = [NSNumber numberWithInt:*a3];
      uint64_t v23 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v23) {
        uint64_t v24 = v23;
      }
      else {
        uint64_t v24 = 0;
      }
      uint64_t v28 = *(uint64_t (**)(uint64_t, uint64_t, void, uint64_t))(v24 + 24);
      if (!v28)
      {
        uint64_t v25 = 4294954514;
        goto LABEL_14;
      }
      uint64_t v29 = v28(v20, v21, *MEMORY[0x1E4F32E60], v22);
      if (v29)
      {
        uint64_t v25 = v29;
        goto LABEL_14;
      }
      unsigned int v27 = *a3;
    }
    else
    {
      unsigned int v27 = 0;
    }
    *(_DWORD *)(a1 + 1572) = v27;
    uint64_t v30 = *(void *)(a1 + 592);
    uint64_t v31 = *(unsigned int *)(*(void *)(a1 + 608) + 4 * *(void *)(a1 + 1576));
    uint64_t v32 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v32) {
      uint64_t v33 = v32;
    }
    else {
      uint64_t v33 = 0;
    }
    uint64_t v34 = *(uint64_t (**)(uint64_t, uint64_t, void, void))(v33 + 24);
    if (v34)
    {
      uint64_t v35 = v34(v30, v31, *MEMORY[0x1E4F32E20], *MEMORY[0x1E4F1CFC8]);
      if (v35)
      {
        uint64_t v25 = v35;
      }
      else
      {
        uint64_t v36 = *(void *)(a1 + 592);
        uint64_t v37 = *(unsigned int *)(*(void *)(a1 + 608) + 4 * *(void *)(a1 + 1576));
        uint64_t v42 = *(void *)(a1 + 1560);
        uint64_t v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v42 count:1];
        uint64_t v39 = *(void *)(CMBaseObjectGetVTable() + 16);
        if (v39) {
          uint64_t v40 = v39;
        }
        else {
          uint64_t v40 = 0;
        }
        uint64_t v41 = *(uint64_t (**)(uint64_t, uint64_t, void, uint64_t))(v40 + 24);
        if (v41)
        {
          uint64_t v25 = v41(v36, v37, *MEMORY[0x1E4F32E00], v38);
          if (!v25) {
            return v25;
          }
        }
        else
        {
          uint64_t v25 = 4294954514;
        }
      }
    }
    else
    {
      uint64_t v25 = 4294954514;
    }
  }
  else
  {
    uint64_t v25 = 4294954514;
  }
LABEL_14:
  FigDebugAssert3();
  return v25;
}

- (void)_validTrackReferencesForReferenceInputIndexes:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  uint64_t v4 = (void *)[MEMORY[0x1E4F1CA48] array];
  unint64_t v5 = [a2 count];
  if (v5 >= 2)
  {
    unint64_t v6 = v5 >> 1;
    uint64_t v7 = 1;
    do
    {
      unsigned int v8 = objc_msgSend((id)objc_msgSend(a2, "objectAtIndexedSubscript:", v7 - 1), "unsignedIntValue");
      unsigned int v9 = objc_msgSend((id)objc_msgSend(a2, "objectAtIndexedSubscript:", v7), "unsignedIntValue");
      uint64_t v10 = *(void *)(a1 + 616);
      if (*(unsigned char *)(v10 + v8))
      {
        uint64_t v11 = v9;
        if (*(unsigned char *)(v10 + v9))
        {
          objc_msgSend(v4, "addObject:", objc_msgSend(NSNumber, "numberWithInt:", *(unsigned int *)(*(void *)(a1 + 608) + 4 * v8)));
          objc_msgSend(v4, "addObject:", objc_msgSend(NSNumber, "numberWithInt:", *(unsigned int *)(*(void *)(a1 + 608) + 4 * v11)));
        }
      }
      v7 += 2;
      --v6;
    }
    while (v6);
  }
  return v4;
}

- (void)_validateTaggedMediaCharacteristicsForInputIndexes:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  uint64_t v4 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  if ([a2 count])
  {
    unint64_t v5 = 0;
    do
    {
      unsigned int v6 = objc_msgSend((id)objc_msgSend(a2, "objectAtIndexedSubscript:", v5), "unsignedIntValue");
      unint64_t v7 = v5 + 1;
      uint64_t v8 = [a2 objectAtIndexedSubscript:v7];
      if (*(unsigned char *)(*(void *)(a1 + 616) + v6))
      {
        uint64_t v9 = v8;
        uint64_t v10 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(a1 + 608) + 4 * v6)];
        if (![v4 objectForKeyedSubscript:v10]) {
          objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", 1), v10);
        }
        objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", v10), "addObject:", v9);
      }
      unint64_t v5 = v7 + 1;
    }
    while (v5 < [a2 count]);
  }
  return v4;
}

- (uint64_t)_preAllocateIfNeededForURL:(void *)a3 settings:
{
  if (!a1) {
    return 0;
  }
  unint64_t v5 = (void *)[a3 videoSettings];
  uint64_t v6 = objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", @"AVVideoWidthKey"), "unsignedIntegerValue");
  uint64_t v7 = objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", @"AVVideoHeightKey"), "unsignedIntegerValue");
  if (v6 != 3840 || v7 != 2160)
  {
    FigFileIsFileOnExternalStorageDevice();
    return 0;
  }
  float v8 = *(float *)(a1 + 384);
  uint64_t v9 = 0;
  if (FigFileIsFileOnExternalStorageDevice() && v8 >= 100.0)
  {
    uint64_t v22 = 0;
    uint64_t v10 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "URLByDeletingLastPathComponent"), "URLByDeletingLastPathComponent"), "URLByDeletingLastPathComponent");
    uint64_t v11 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "attributesOfFileSystemForPath:error:", objc_msgSend(v10, "path"), &v22);
    uint64_t v12 = 0;
    if (v11)
    {
      if (!v22)
      {
        uint64_t v12 = (void *)[v11 objectForKey:*MEMORY[0x1E4F283A0]];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          FigDebugAssert3();
          return FigSignalErrorAt();
        }
      }
    }
    if ([v12 longLongValue] <= 0x8000000001)
    {
      uint64_t v14 = [v12 longLongValue];
      if (v14 >= 0) {
        uint64_t v15 = v14;
      }
      else {
        uint64_t v15 = v14 + 1;
      }
      uint64_t v13 = v15 >> 1;
    }
    else
    {
      uint64_t v13 = 0x4000000000;
    }
    uint64_t v21 = 0;
    uint64_t v16 = *(void *)(a1 + 600);
    uint64_t v17 = *(void **)(CMBaseObjectGetVTable() + 16);
    if (v17) {
      BOOL v18 = v17;
    }
    else {
      BOOL v18 = 0;
    }
    if (*v18 < 3uLL || (uint64_t v19 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t *))v18[6]) == 0)
    {
      uint64_t v9 = 4294954514;
LABEL_25:
      FigDebugAssert3();
      return v9;
    }
    uint64_t v9 = v19(v16, v13, 2, &v21);
    if (v9) {
      goto LABEL_25;
    }
  }
  return v9;
}

- (uint64_t)_doStartRecordingAtTime:(void *)a3 withSettings:(void *)a4 sensorVideoPort:(void *)a5 captureDeviceType:
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  if ([a4 isEqualToString:*MEMORY[0x1E4F52DF8]]) {
    char v11 = 1;
  }
  else {
    char v11 = [a4 isEqualToString:*MEMORY[0x1E4F52E10]];
  }
  *(unsigned char *)(a1 + 696) = v11;
  *(unsigned char *)(a1 + 697) = BWDeviceTypeIsExtensionDeviceType([a5 integerValue]);
  uint64_t v12 = (void *)[a3 outputFileType];
  if (([v12 isEqual:*MEMORY[0x1E4F32B00]] & 1) == 0)
  {
LABEL_71:
    FigDebugAssert3();
    return 0;
  }
  int v13 = [a3 isIrisRecording];
  unint64_t v61 = (void *)[a3 outputURL];
  uint64_t v54 = a2;
  if (*(void *)(a1 + 1536) && [a3 usesVirtualCaptureCard])
  {
    uint64_t v14 = *(void *)(a1 + 1536);
    uint64_t v15 = [a3 outputURL];
    uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(CMBaseObjectGetVTable() + 16) + 16);
    if (v16)
    {
      uint64_t v17 = v16(v14, v15);
      if (!v17)
      {
        uint64_t CMBaseObject = FigVirtualCaptureCardGetCMBaseObject();
        uint64_t v19 = *(void *)(CMBaseObjectGetVTable() + 8);
        if (v19) {
          uint64_t v20 = v19;
        }
        else {
          uint64_t v20 = 0;
        }
        uint64_t v22 = *(uint64_t (**)(uint64_t, void, void, void **))(v20 + 48);
        if (v22)
        {
          uint64_t v23 = v22(CMBaseObject, *MEMORY[0x1E4F22060], 0, &v61);
          if (!v23) {
            goto LABEL_17;
          }
          uint64_t v21 = v23;
        }
        else
        {
          uint64_t v21 = 4294954514;
        }
        uint64_t v53 = v5;
        LODWORD(v51) = 0;
LABEL_42:
        FigDebugAssert3();
        goto LABEL_62;
      }
      uint64_t v21 = v17;
    }
    else
    {
      uint64_t v21 = 4294954514;
    }
    uint64_t v53 = v5;
    LODWORD(v51) = 0;
    goto LABEL_42;
  }
LABEL_17:
  CFAllocatorRef v24 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  uint64_t v25 = CMByteStreamCreateForFileURL();
  if (v25)
  {
    uint64_t v21 = v25;
    uint64_t v53 = v5;
    LODWORD(v51) = v25;
    goto LABEL_42;
  }
  if (-[BWQuickTimeMovieFileSinkNode _preAllocateIfNeededForURL:settings:](a1, v61, a3))
  {
    unsigned int v60 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  BOOL v27 = +[BWAudioFormat compressionOptionTrimSampleBufferDurationsIsRequiredForAudioSettings:](BWAudioFormat, "compressionOptionTrimSampleBufferDurationsIsRequiredForAudioSettings:", objc_msgSend(a3, "audioSettings", v51, v52));
  id v28 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v28 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F32C98]];
  if (v27) {
    [v28 setObject:*MEMORY[0x1E4F32C08] forKeyedSubscript:*MEMORY[0x1E4F32C00]];
  }
  uint64_t v29 = FigMovieFormatWriterCreateWithByteStream();
  if (v29)
  {
    uint64_t v21 = v29;
    uint64_t v53 = v5;
    LODWORD(v51) = v29;
    goto LABEL_42;
  }
  *(_DWORD *)(a1 + 724) = 0;
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterAddObserver(LocalCenter, (const void *)a1, (CFNotificationCallback)qtmfsn_formatWriterErrorOccurredCallback, (CFStringRef)*MEMORY[0x1E4F32BE8], *(const void **)(a1 + 592), CFNotificationSuspensionBehaviorDeliverImmediately);
  if (v13)
  {
    uint64_t v31 = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver(v31, (const void *)a1, (CFNotificationCallback)qtmfsn_formatWriterDidWriteFragment, (CFStringRef)*MEMORY[0x1E4F32BF8], *(const void **)(a1 + 592), CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  long long v67 = *v54;
  uint64_t v68 = *((void *)v54 + 2);
  uint64_t v32 = -[BWQuickTimeMovieFileSinkNode _startUpFormatWriterAtTime:withSettings:](a1, (uint64_t)&v67, a3);
  if (v32)
  {
    uint64_t v21 = v32;
    uint64_t v53 = v5;
    LODWORD(v51) = v32;
    goto LABEL_42;
  }
  uint64_t v33 = *(unsigned char **)(a1 + 416);
  if (v33)
  {
    *uint64_t v33 = 0;
    goto LABEL_29;
  }
  uint64_t v34 = malloc_type_malloc(0x400uLL, 0xEEDC5567uLL);
  *(void *)(a1 + 416) = v34;
  if (!v34) {
    goto LABEL_71;
  }
LABEL_29:
  CFURLRef PathComponent = CFURLCreateCopyDeletingLastPathComponent(v24, (CFURLRef)[a3 outputURL]);
  int v36 = CFURLGetFileSystemRepresentation(PathComponent, 1u, *(UInt8 **)(a1 + 416), 1024);
  if (!v36)
  {
    uint64_t v21 = 4294966296;
    goto LABEL_58;
  }

  *(void *)(a1 + 400) = a3;
  if ([*(id *)(a1 + 656) count]) {
    BOOL v37 = 1;
  }
  else {
    BOOL v37 = [*(id *)(a1 + 648) requestedSDOFVariants] != 0;
  }
  if ([*(id *)(a1 + 648) isMomentCaptureMovieRecording]
    && ([*(id *)(a1 + 648) isFinalEnqueuedIrisRequest] & 1) == 0)
  {
    if (dword_1EB4C5090)
    {
      unsigned int v60 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      uint64_t v38 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  else if (!v37)
  {
    uint64_t v21 = 0;
    goto LABEL_58;
  }
  -[BWQuickTimeMovieFileSinkNode _buildIrisRefMovieGeneratorAndWriteFirstIrisAsRefMovie](a1);
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  uint64_t v39 = *(void **)(a1 + 656);
  uint64_t v40 = [v39 countByEnumeratingWithState:&v55 objects:v62 count:16];
  if (v40)
  {
    uint64_t v41 = v40;
    uint64_t v42 = *(void *)v56;
    do
    {
      for (uint64_t i = 0; i != v41; ++i)
      {
        if (*(void *)v56 != v42) {
          objc_enumerationMutation(v39);
        }
        -[BWQuickTimeMovieFileSinkNode _writeIrisRefMovieWithInfo:]((void *)a1, *(void **)(*((void *)&v55 + 1) + 8 * i));
      }
      uint64_t v41 = [v39 countByEnumeratingWithState:&v55 objects:v62 count:16];
    }
    while (v41);
  }
  objc_msgSend(*(id *)(a1 + 656), "removeAllObjects", v51, v53);
  if (dword_1EB4C5090)
  {
    unsigned int v60 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    uint64_t v44 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v45 = v60;
    if (os_log_type_enabled(v44, type)) {
      unsigned int v46 = v45;
    }
    else {
      unsigned int v46 = v45 & 0xFFFFFFFE;
    }
    if (v46)
    {
      uint64_t v47 = *(void *)(a1 + 992);
      int v63 = 136315394;
      uint64_t v64 = "-[BWQuickTimeMovieFileSinkNode _doStartRecordingAtTime:withSettings:sensorVideoPort:captureDeviceType:]";
      __int16 v65 = 2112;
      uint64_t v66 = v47;
      LODWORD(v53) = 22;
      uint64_t v51 = &v63;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  uint64_t v21 = 0;
LABEL_58:
  if (PathComponent) {
    CFRelease(PathComponent);
  }
  if (v36) {
    return 0;
  }
LABEL_62:
  objc_msgSend(*(id *)(a1 + 1000), "logErrorNumber:errorString:", v21, @"starting recording", v51, v53);
  uint64_t v48 = *(const void **)(a1 + 592);
  if (v48)
  {
    CFRelease(v48);
    *(void *)(a1 + 592) = 0;
  }
  bzero(*(void **)(a1 + 608), 4 * (*(void *)(a1 + 560) + *(void *)(a1 + 552)));
  int v49 = *(const void **)(a1 + 600);
  if (v49)
  {
    CFRelease(v49);
    *(void *)(a1 + 600) = 0;
  }
  return v21;
}

- (void)_buildIrisRefMovieGeneratorAndWriteFirstIrisAsRefMovie
{
  __assert_rtn("-[BWQuickTimeMovieFileSinkNode _buildIrisRefMovieGeneratorAndWriteFirstIrisAsRefMovie]", "BWQuickTimeMovieFileSinkNode.m", 6799, "_irisMovieGenerator == nil");
}

- (void)_writeIrisRefMovieWithInfo:(void *)a1
{
  if (a1)
  {
    uint64_t v9 = 0;
    uint64_t v10 = &v9;
    uint64_t v11 = 0x3052000000;
    uint64_t v12 = __Block_byref_object_copy__11;
    uint64_t v4 = a1[83];
    int v13 = __Block_byref_object_dispose__11;
    uint64_t v14 = v4;
    -[BWQuickTimeMovieFileSinkNode _fixVitalityScoreWithMotionAnalysis:]((unint64_t)a1, a2);
    int has_internal_diagnostics = os_variant_has_internal_diagnostics();
    if (a1[106])
    {
      if (a1[105]) {
        int v6 = has_internal_diagnostics;
      }
      else {
        int v6 = 0;
      }
      if (v6 == 1) {
        -[BWQuickTimeMovieFileSinkNode _computeTransitionVitalityScore:]((unint64_t)a1, a2);
      }
    }
    -[BWQuickTimeMovieFileSinkNode _initAnalyticsDataInIrisMovieInfo:]((uint64_t)a1, a2);
    uint64_t v7 = (void *)v10[5];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __59__BWQuickTimeMovieFileSinkNode__writeIrisRefMovieWithInfo___block_invoke;
    v8[3] = &unk_1E5C257D8;
    v8[4] = a1;
    v8[5] = &v9;
    [v7 writeMovieWithInfo:a2 completionHandler:v8];
    _Block_object_dispose(&v9, 8);
  }
}

- (void)_generateThumbnailSurfaceFromPixelBuffer:(char)a3 physicallyMirroredHorizontallyUpstream:
{
  if (a1)
  {
    int v6 = objc_msgSend((id)objc_msgSend((id)a1, "inputs"), "objectAtIndexedSubscript:", *(void *)(a1 + 704));
    int v7 = objc_msgSend((id)objc_msgSend(v6, "format"), "width");
    int v8 = objc_msgSend((id)objc_msgSend(v6, "format"), "height");
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      int v9 = [*(id *)(a1 + 400) videoOrientation];
    }
    else {
      int v9 = 0;
    }
    CFRetain(a2);
    uint64_t v10 = *(NSObject **)(a1 + 568);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __112__BWQuickTimeMovieFileSinkNode__generateThumbnailSurfaceFromPixelBuffer_physicallyMirroredHorizontallyUpstream___block_invoke;
    v11[3] = &unk_1E5C25738;
    v11[4] = a1;
    v11[5] = a2;
    char v15 = a3;
    int v12 = v9;
    int v13 = v7;
    int v14 = v8;
    dispatch_async(v10, v11);
  }
}

void __112__BWQuickTimeMovieFileSinkNode__generateThumbnailSurfaceFromPixelBuffer_physicallyMirroredHorizontallyUpstream___block_invoke(uint64_t a1)
{
  uint64_t v4 = a1 + 32;
  unint64_t v2 = *(unsigned __int8 **)(a1 + 32);
  uint64_t v3 = *(__CVBuffer **)(v4 + 8);
  int v5 = v2[696];
  unsigned int v6 = *(_DWORD *)(a1 + 48);
  int v7 = v2[697];
  int v8 = *(unsigned __int8 *)(a1 + 60);
  objc_msgSend((id)objc_msgSend(v2, "graph"), "clientExpectsCameraMountedInLandscapeOrientation");
  uint64_t v38 = *(void *)(a1 + 32);
  uint64_t v9 = *(unsigned int *)(a1 + 52);
  uint64_t v10 = *(unsigned int *)(a1 + 56);
  CVPixelBufferRef pixelBuffer = 0;
  uint64_t v11 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  int v12 = FigCapturePlatformMountsCamerasInLandscapeOrientation();
  int v13 = 0;
  if (v6 && v12)
  {
    if (FigCaptureCameraRequires180DegreesRotation(v5 != 0, v7 != 0))
    {
      if (v6 - 3 >= 2) {
        int v13 = 0;
      }
      else {
        int v13 = 180;
      }
    }
    else
    {
      if (v7) {
        BOOL v14 = 1;
      }
      else {
        BOOL v14 = v6 >= 3;
      }
      if (v14 || v5 == 0) {
        int v13 = 0;
      }
      else {
        int v13 = 180;
      }
    }
  }
  int Width = CVPixelBufferGetWidth(v3);
  int Height = CVPixelBufferGetHeight(v3);
  int v18 = MGGetSInt32Answer();
  uint64_t v19 = MGGetSInt32Answer();
  if (v18 < (int)v9 || (int)v19 < (int)v10)
  {
    FigCaptureMakeRectWithAspectRatioInsideDimensions(v18 | (unint64_t)(v19 << 32), 1, (float)(int)v9 / (float)(int)v10);
    uint64_t v9 = (int)v20;
    uint64_t v10 = (int)v21;
  }
  uint64_t v22 = BWCreateIOSurfaceBackedCVPixelBuffer(v9, v10, 875704422, &pixelBuffer, @"MovieFileSink: Scaled Thumbnail");
  if (v22)
  {
    uint64_t v36 = v22;
LABEL_58:
    FigDebugAssert3();
    goto LABEL_49;
  }
  uint64_t v23 = *MEMORY[0x1E4F45118];
  [v11 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:*MEMORY[0x1E4F45118]];
  if (BWPixelBufferIsHDR(v3))
  {
    id v24 = +[BWVideoFormat pixelBufferAttachmentsForColorSpaceProperties:3];
    uint64_t v25 = [v24 objectForKeyedSubscript:*MEMORY[0x1E4F24C18]];
    [v11 setObject:v25 forKeyedSubscript:*MEMORY[0x1E4F45100]];
    uint64_t v26 = [v24 objectForKeyedSubscript:*MEMORY[0x1E4F24A90]];
    [v11 setObject:v26 forKeyedSubscript:*MEMORY[0x1E4F450E0]];
    uint64_t v27 = [v24 objectForKeyedSubscript:*MEMORY[0x1E4F24BC8]];
    [v11 setObject:v27 forKeyedSubscript:*MEMORY[0x1E4F450F8]];
    uint64_t v28 = MEMORY[0x1E4F1CC38];
    uint64_t v29 = v11;
    uint64_t v30 = v23;
LABEL_26:
    [v29 setObject:v28 forKeyedSubscript:v30];
    goto LABEL_27;
  }
  uint64_t v31 = CVBufferCopyAttachments(v3, kCVAttachmentMode_ShouldPropagate);
  if (v31) {
    uint64_t v31 = (void *)CFAutorelease(v31);
  }
  uint64_t v32 = (void *)[v31 objectForKeyedSubscript:*MEMORY[0x1E4F24C18]];
  if ([v32 isEqualToString:*MEMORY[0x1E4F24C48]])
  {
    uint64_t v28 = *MEMORY[0x1E4F24C40];
    uint64_t v30 = *MEMORY[0x1E4F45100];
    uint64_t v29 = v11;
    goto LABEL_26;
  }
LABEL_27:
  CVPixelBufferGetWidth(pixelBuffer);
  CVPixelBufferGetHeight(pixelBuffer);
  if (!v8 && !v13)
  {
    VTPixelTransferSessionRef pixelTransferSessionOut = 0;
    uint64_t v33 = VTPixelTransferSessionCreate(0, &pixelTransferSessionOut);
    if (pixelTransferSessionOut)
    {
      v41.origin.x = 0.0;
      v41.origin.y = 0.0;
      v41.size.width = (double)Width;
      v41.size.height = (double)Height;
      if (CGRectIsNull(v41))
      {
        CFDictionaryRef DictionaryRepresentation = 0;
      }
      else
      {
        v42.origin.x = 0.0;
        v42.origin.y = 0.0;
        v42.size.width = (double)Width;
        v42.size.height = (double)Height;
        CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v42);
      }
      [v11 setObject:DictionaryRepresentation forKeyedSubscript:*MEMORY[0x1E4F45170]];
      uint64_t v36 = VTSessionSetProperties(pixelTransferSessionOut, (CFDictionaryRef)v11);
      if (DictionaryRepresentation) {
        CFRelease(DictionaryRepresentation);
      }
      if (v36) {
        goto LABEL_58;
      }
      uint64_t v36 = VTPixelTransferSessionTransferImage(pixelTransferSessionOut, v3, pixelBuffer);
      VTPixelTransferSessionInvalidate(pixelTransferSessionOut);
      goto LABEL_44;
    }
LABEL_38:
    uint64_t v36 = v33;
    goto LABEL_45;
  }
  VTPixelTransferSessionRef pixelTransferSessionOut = 0;
  uint64_t v33 = VTPixelRotationSessionCreate(0, &pixelTransferSessionOut);
  if (!pixelTransferSessionOut) {
    goto LABEL_38;
  }
  [v11 setObject:FigCaptureVTRotationFromDegrees(v13) forKeyedSubscript:*MEMORY[0x1E4F450C0]];
  if (v8) {
    [v11 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F45098]];
  }
  if ([v11 count])
  {
    uint64_t v35 = VTSessionSetProperties(pixelTransferSessionOut, (CFDictionaryRef)v11);
    if (v35)
    {
      uint64_t v36 = v35;
      goto LABEL_58;
    }
  }
  uint64_t v36 = VTPixelRotationSessionRotateSubImage();
  VTPixelRotationSessionInvalidate(pixelTransferSessionOut);
LABEL_44:
  CFRelease(pixelTransferSessionOut);
LABEL_45:
  if (v36) {
    goto LABEL_58;
  }
  IOSurface = CVPixelBufferGetIOSurface(pixelBuffer);
  if (IOSurface) {
    IOSurface = CFRetain(IOSurface);
  }
  uint64_t v36 = 0;
  *(void *)(v38 + 576) = IOSurface;
LABEL_49:
  if (pixelBuffer) {
    CFRelease(pixelBuffer);
  }
  if (v36) {
    [*(id *)(*(void *)(a1 + 32) + 1000) logErrorNumber:v36 errorString:@"creating thumbnail"];
  }
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

- (uint64_t)_verifyMovieTiming:(uint64_t)result
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    if (a2)
    {
      [a2 stillImageCaptureTime];
      [a2 movieEndTime];
      if (CMTimeCompare(&time1, &time2) > 0) {
        goto LABEL_8;
      }
      [a2 stillImageCaptureTime];
      [a2 movieStartTime];
    }
    else
    {
      memset(&time1, 0, sizeof(time1));
      memset(&time2, 0, sizeof(time2));
      if (CMTimeCompare(&time1, &time2) > 0) {
        goto LABEL_8;
      }
      memset(&v5, 0, sizeof(v5));
      memset(&v4, 0, sizeof(v4));
    }
    if ((CMTimeCompare(&v5, &v4) & 0x80000000) == 0) {
      return 0;
    }
LABEL_8:
    if (![a2 isMomentCaptureMovieRecording]) {
      return 4294950346;
    }
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    return 0;
  }
  return result;
}

- (uint64_t)_moveOrDeleteTemporaryIrisMovie:(char)a3 recordingSucceeded:
{
  if (result)
  {
    result = [a2 temporaryMovieURL];
    if (result)
    {
      if (a3)
      {
        uint64_t v7 = 0;
        return objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "moveItemAtURL:toURL:error:", objc_msgSend(a2, "temporaryMovieURL"), objc_msgSend(a2, "outputMovieURL"), &v7);
      }
      else
      {
        CMTime v5 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
        uint64_t v6 = [a2 temporaryMovieURL];
        return [v5 removeItemAtURL:v6 error:0];
      }
    }
  }
  return result;
}

- (uint64_t)_findWrittenStartingPTS
{
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = MEMORY[0x1E4F1FA10];
    *(_OWORD *)a2 = *MEMORY[0x1E4F1FA10];
    *(void *)(a2 + 16) = *(void *)(v4 + 16);
    if (*(void *)(result + 552))
    {
      uint64_t v5 = 0;
      unint64_t v6 = 0;
      do
      {
        uint64_t v7 = (long long *)(*(void *)(v3 + 448) + v5);
        CMTime time1 = *(CMTime *)a2;
        long long v8 = *v7;
        v11.CMTimeEpoch epoch = *((void *)v7 + 2);
        *(_OWORD *)&v11.CMTimeValue value = v8;
        result = CMTimeCompare(&time1, &v11);
        if ((int)result >= 1)
        {
          uint64_t v9 = *(void *)(v3 + 448) + v5;
          *(_OWORD *)a2 = *(_OWORD *)v9;
          *(void *)(a2 + 16) = *(void *)(v9 + 16);
        }
        ++v6;
        v5 += 24;
      }
      while (v6 < *(void *)(v3 + 552));
    }
    if ((~*(_DWORD *)(a2 + 12) & 5) == 0)
    {
      uint64_t v10 = MEMORY[0x1E4F1F9F8];
      *(_OWORD *)a2 = *MEMORY[0x1E4F1F9F8];
      *(void *)(a2 + 16) = *(void *)(v10 + 16);
    }
  }
  else
  {
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
    *(void *)(a2 + 16) = 0;
  }
  return result;
}

- (CMTime)_finalizeAudioVideoDurationsAndFindWrittenEndingPTSFromEndingPTS:(uint64_t)a3@<X8>
{
  if (result)
  {
    uint64_t v4 = a2;
    uint64_t v5 = result;
    if ((*(_DWORD *)(a2 + 12) & 5) == 1)
    {
      *(_OWORD *)a3 = *(_OWORD *)a2;
      uint64_t v6 = *(void *)(a2 + 16);
    }
    else
    {
      uint64_t v7 = MEMORY[0x1E4F1FA08];
      *(_OWORD *)a3 = *MEMORY[0x1E4F1FA08];
      uint64_t v6 = *(void *)(v7 + 16);
    }
    *(void *)(a3 + 16) = v6;
    uint64_t v8 = *(void *)&result[30].timescale;
    uint64_t v9 = &OBJC_IVAR___BWPreviewStitcherNode__wantWideFallbackDueToTeleAEAF;
    int v10 = 744;
    if (result[31].value + v8)
    {
      uint64_t v11 = 0;
      unint64_t v12 = 0;
      int v13 = &OBJC_IVAR___BWPreviewStitcherNode__wantWideFallbackDueToTeleAEAF;
      int v14 = 480;
      char v15 = &OBJC_IVAR___BWPreviewStitcherNode__wantWideFallbackDueToTeleAEAF;
      while (1)
      {
        uint64_t v16 = *(CMTimeValue *)((char *)&v5->value + v14);
        if (*(unsigned char *)(v16 + v11 + 12)) {
          goto LABEL_11;
        }
        CMTimeValue value = v5[19].value;
        if ((~*(_DWORD *)(value + v11 + 12) & 9) != 0)
        {
          int v18 = (long long *)(*(CMTimeValue *)((char *)&v5->value + v15[334]) + v11);
          if ((~*((_DWORD *)v18 + 3) & 9) != 0) {
            break;
          }
        }
LABEL_14:
        uint64_t v8 = *(void *)&v5[30].timescale;
        ++v12;
        v11 += 24;
        if (v12 >= *(CMTimeValue *)((char *)&v5->value + v10) + v8)
        {
          uint64_t v4 = a2;
          goto LABEL_16;
        }
      }
      uint64_t v19 = v13;
      double v20 = v9;
      double v21 = v15;
      uint64_t v22 = v16 + v11;
      long long v23 = *(_OWORD *)(value + v11);
      lhs.CMTimeEpoch epoch = *(void *)(value + v11 + 16);
      *(_OWORD *)&lhs.CMTimeValue value = v23;
      long long v24 = *v18;
      rhs.CMTimeEpoch epoch = *((void *)v18 + 2);
      *(_OWORD *)&rhs.CMTimeValue value = v24;
      CMTimeSubtract(&time1, &lhs, &rhs);
      long long v25 = *(_OWORD *)&time1.value;
      *(void *)(v22 + 16) = time1.epoch;
      *(_OWORD *)uint64_t v22 = v25;
      char v15 = v21;
      uint64_t v9 = v20;
      int v13 = v19;
      uint64_t v16 = *(CMTimeValue *)((char *)&v5->value + v19[335]);
LABEL_11:
      memset(&time1, 0, sizeof(time1));
      uint64_t v26 = (long long *)(v5[19].value + v11);
      long long v27 = *v26;
      lhs.CMTimeEpoch epoch = *((void *)v26 + 2);
      *(_OWORD *)&lhs.CMTimeValue value = v27;
      long long v28 = *(_OWORD *)(v16 + v11);
      rhs.CMTimeEpoch epoch = *(void *)(v16 + v11 + 16);
      *(_OWORD *)&rhs.CMTimeValue value = v28;
      CMTimeAdd(&time1, &lhs, &rhs);
      CMTime lhs = *(CMTime *)a3;
      CMTime rhs = time1;
      result = (CMTime *)CMTimeCompare(&lhs, &rhs);
      int v14 = v13[335];
      if ((result & 0x80000000) != 0) {
        *(CMTime *)a3 = time1;
      }
      int v10 = v9[318];
      goto LABEL_14;
    }
LABEL_16:
    if (v8)
    {
      uint64_t v29 = 0;
      unint64_t v30 = 0;
      do
      {
        uint64_t v31 = (long long *)(*(void *)&v5[19].timescale + v29);
        CMTime time1 = *(CMTime *)a3;
        long long v32 = *v31;
        lhs.CMTimeEpoch epoch = *((void *)v31 + 2);
        *(_OWORD *)&lhs.CMTimeValue value = v32;
        result = (CMTime *)CMTimeCompare(&time1, &lhs);
        if ((result & 0x80000000) != 0)
        {
          uint64_t v33 = *(void *)&v5[19].timescale + v29;
          *(_OWORD *)a3 = *(_OWORD *)v33;
          *(void *)(a3 + 16) = *(void *)(v33 + 16);
        }
        ++v30;
        unint64_t v34 = *(void *)&v5[30].timescale;
        v29 += 24;
      }
      while (v30 < v34);
      int v10 = v9[318];
    }
    else
    {
      unint64_t v34 = 0;
    }
    unint64_t v35 = *(CMTimeValue *)((char *)&v5->value + v10) + v34;
    if (v35 < v5[23].value)
    {
      uint64_t v36 = 24 * v35;
      do
      {
        uint64_t v37 = v5[19].value + v36;
        CMTime time1 = *(CMTime *)a3;
        long long v38 = *(_OWORD *)v37;
        lhs.CMTimeEpoch epoch = *(void *)(v37 + 16);
        *(_OWORD *)&lhs.CMTimeValue value = v38;
        result = (CMTime *)CMTimeCompare(&time1, &lhs);
        if ((result & 0x80000000) != 0)
        {
          uint64_t v39 = v5[19].value + v36;
          int32_t v40 = *(_DWORD *)(v39 + 8);
          if (v40 <= 999) {
            int64_t v41 = 1;
          }
          else {
            int64_t v41 = v40 / 0x3E8u;
          }
          CMTimeMake(&v44, v41, v40);
          long long v42 = *(_OWORD *)v39;
          lhs.CMTimeEpoch epoch = *(void *)(v39 + 16);
          *(_OWORD *)&lhs.CMTimeValue value = v42;
          result = CMTimeAdd(&time1, &lhs, &v44);
          *(CMTime *)a3 = time1;
        }
        ++v35;
        v36 += 24;
      }
      while (v35 < v5[23].value);
    }
    if ((~*(_DWORD *)(a3 + 12) & 9) == 0)
    {
      *(_OWORD *)a3 = *(_OWORD *)v4;
      *(void *)(a3 + 16) = *(void *)(v4 + 16);
    }
  }
  else
  {
    *(void *)a3 = 0;
    *(void *)(a3 + 8) = 0;
    *(void *)(a3 + 16) = 0;
  }
  return result;
}

- (uint64_t)_validatedEndingPTSFromEndingPTS:(uint64_t)a3@<X8>
{
  if (!result)
  {
    *(void *)a3 = 0;
    *(void *)(a3 + 8) = 0;
    *(void *)(a3 + 16) = 0;
    return result;
  }
  if ((*(_DWORD *)(a2 + 12) & 5) == 1)
  {
    *(_OWORD *)a3 = *(_OWORD *)a2;
    uint64_t v4 = *(void *)(a2 + 16);
LABEL_13:
    *(void *)(a3 + 16) = v4;
    return result;
  }
  uint64_t v5 = result;
  uint64_t v6 = MEMORY[0x1E4F1FA10];
  *(_OWORD *)a3 = *MEMORY[0x1E4F1FA10];
  uint64_t v7 = *(void *)(result + 728);
  *(void *)(a3 + 16) = *(void *)(v6 + 16);
  if (*(void *)(result + 744) + v7)
  {
    uint64_t v8 = 0;
    unint64_t v9 = 0;
    do
    {
      result = objc_msgSend(*(id *)(v5 + 1608), "containsObject:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v9));
      if ((result & 1) == 0)
      {
        int v10 = (long long *)(*(void *)(v5 + 480) + v8);
        if (*((unsigned char *)v10 + 12))
        {
          memset(&v17, 0, sizeof(v17));
          uint64_t v11 = (long long *)(*(void *)(v5 + 456) + v8);
          long long v12 = *v11;
          lhs.CMTimeEpoch epoch = *((void *)v11 + 2);
          *(_OWORD *)&lhs.CMTimeValue value = v12;
          long long v13 = *v10;
          v15.CMTimeEpoch epoch = *((void *)v10 + 2);
          *(_OWORD *)&v15.CMTimeValue value = v13;
          CMTimeAdd(&v17, &lhs, &v15);
          CMTime lhs = *(CMTime *)a3;
          CMTime v15 = v17;
          result = CMTimeCompare(&lhs, &v15);
          if ((int)result >= 1) {
            *(CMTime *)a3 = v17;
          }
        }
      }
      ++v9;
      v8 += 24;
    }
    while (v9 < *(void *)(v5 + 744) + *(void *)(v5 + 728));
  }
  if ((~*(_DWORD *)(a3 + 12) & 5) == 0)
  {
    uint64_t v14 = MEMORY[0x1E4F1F9F8];
    *(_OWORD *)a3 = *MEMORY[0x1E4F1F9F8];
    uint64_t v4 = *(void *)(v14 + 16);
    goto LABEL_13;
  }
  return result;
}

- (uint64_t)_endingPTSForTrack:(uint64_t)a3@<X2> endingPTS:(uint64_t)a4@<X3> writtenEndingPTS:(uint64_t)a5@<X4> validatedEndingPTS:(int)a6@<W5> isIrisMasterMovie:(uint64_t)a7@<X8>
{
  if (result)
  {
    uint64_t v10 = result;
    *(_OWORD *)a7 = *(_OWORD *)a4;
    *(void *)(a7 + 16) = *(void *)(a4 + 16);
    if ((*(unsigned char *)(a3 + 12) & 1) != 0 || a6) && (*(unsigned char *)(a5 + 12))
    {
      uint64_t v11 = *(void *)(result + 456) + 24 * a2;
      CMTime time1 = *(CMTime *)a5;
      long long v12 = *(_OWORD *)v11;
      v17.CMTimeEpoch epoch = *(void *)(v11 + 16);
      *(_OWORD *)&v17.CMTimeValue value = v12;
      result = CMTimeCompare(&time1, &v17);
      if ((int)result >= 1)
      {
        *(_OWORD *)a7 = *(_OWORD *)a5;
        *(void *)(a7 + 16) = *(void *)(a5 + 16);
      }
    }
    if (*(void *)(v10 + 728) > a2)
    {
      uint64_t v13 = *(void *)(v10 + 464);
      if (*(unsigned char *)(v13 + 24 * a2 + 12))
      {
        uint64_t v14 = (long long *)(v13 + 24 * a2);
        CMTime time1 = *(CMTime *)a7;
        long long v15 = *v14;
        v17.CMTimeEpoch epoch = *((void *)v14 + 2);
        *(_OWORD *)&v17.CMTimeValue value = v15;
        result = CMTimeCompare(&time1, &v17);
        if ((result & 0x80000000) != 0)
        {
          uint64_t v16 = *(void *)(v10 + 464) + 24 * a2;
          *(_OWORD *)a7 = *(_OWORD *)v16;
          *(void *)(a7 + 16) = *(void *)(v16 + 16);
        }
      }
    }
  }
  else
  {
    *(void *)a7 = 0;
    *(void *)(a7 + 8) = 0;
    *(void *)(a7 + 16) = 0;
  }
  return result;
}

- (unint64_t)_computeMotionAnalysisStatisticFromRange:(uint64_t)a3 calculation:
{
  if (result)
  {
    unint64_t v4 = result;
    CMTime v19 = *a2;
    memset(&v18, 0, sizeof(v18));
    CMTime lhs = *a2;
    CMTime rhs = a2[1];
    CMTimeAdd(&v18, &lhs, &rhs);
    uint64_t v5 = *(void **)(v4 + 840);
    CMTime lhs = v19;
    CMTime rhs = v18;
    uint64_t v6 = (void *)[v5 retrieveInferencesForType:2001 beginning:&lhs until:&rhs];
    result = [v6 count];
    if (result >= 2)
    {
      for (unint64_t i = 1; i < result; ++i)
      {
        uint64_t v8 = (void *)[v6 objectAtIndexedSubscript:i];
        unint64_t v9 = objc_msgSend((id)objc_msgSend(v8, "inferences"), "objectForKeyedSubscript:", getVCPCaptureAnalysisSubjectMotionScoreKey());
        uint64_t v10 = objc_msgSend((id)objc_msgSend(v8, "inferences"), "objectForKeyedSubscript:", getVCPCaptureAnalysisMotionDivScoreKey());
        float v11 = -1.0;
        float v12 = -1.0;
        if (v9)
        {
          [v9 floatValue];
          float v12 = v13;
        }
        if (v10)
        {
          [v10 floatValue];
          float v11 = v14;
        }
        if (v8) {
          [v8 timestamp];
        }
        else {
          memset(v15, 0, sizeof(v15));
        }
        (*(void (**)(uint64_t, void *, float, float))(a3 + 16))(a3, v15, v12, v11);
        result = [v6 count];
      }
    }
  }
  return result;
}

- (void)_fixVitalityScoreWithMotionAnalysis:(unint64_t)a1
{
  if (a1)
  {
    if (*(void *)(a1 + 840))
    {
      if ([a2 isVitalityScoreValid])
      {
        [a2 vitalityScore];
        if (v4 < 0.5)
        {
          memset(&v23, 0, sizeof(v23));
          if (a2) {
            [a2 movieTrimStartTime];
          }
          memset(&v22, 0, sizeof(v22));
          CMTimeMake(&time, 5, 1000);
          CMTimeConvertScale(&v22, &time, v23.timescale, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
          uint64_t v17 = 0;
          CMTime v18 = &v17;
          uint64_t v19 = 0x2020000000;
          uint64_t v20 = 0;
          uint64_t v13 = 0;
          float v14 = (float *)&v13;
          uint64_t v15 = 0x2020000000;
          int v16 = 0;
          CMTime lhs = v23;
          CMTime rhs = v22;
          CMTimeSubtract(&start, &lhs, &rhs);
          if (a2) {
            [a2 movieTrimEndTime];
          }
          else {
            memset(&end, 0, sizeof(end));
          }
          CMTimeRangeFromTimeToTime(&v12, &start, &end);
          v7[0] = MEMORY[0x1E4F143A8];
          v7[1] = 3221225472;
          v7[2] = __68__BWQuickTimeMovieFileSinkNode__fixVitalityScoreWithMotionAnalysis___block_invoke;
          v7[3] = &unk_1E5C25760;
          v7[4] = &v13;
          v7[5] = &v17;
          -[BWQuickTimeMovieFileSinkNode _computeMotionAnalysisStatisticFromRange:calculation:](a1, &v12.start, (uint64_t)v7);
          unint64_t v6 = v18[3];
          if (!v6 || (double v5 = sqrtf(v14[6] / (float)v6), v5 >= 0.23))
          {
            LODWORD(v5) = 1.0;
            [a2 setVitalityScore:v5];
          }
          _Block_object_dispose(&v13, 8);
          _Block_object_dispose(&v17, 8);
        }
      }
    }
  }
}

float __68__BWQuickTimeMovieFileSinkNode__fixVitalityScoreWithMotionAnalysis___block_invoke(uint64_t a1, float result)
{
  if (result >= 0.0)
  {
    uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
    result = *(float *)(v2 + 24) + (float)(result * result);
    *(float *)(v2 + 24) = result;
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
  return result;
}

- (unint64_t)_computeTransitionVitalityScore:(unint64_t)a1
{
  unint64_t v2 = a1;
  if (a1)
  {
    if (*(void *)(a1 + 840) && *(void *)(a1 + 848))
    {
      memset(&v37, 0, sizeof(v37));
      if (a2) {
        [a2 stillImageCaptureTime];
      }
      memset(&v36, 0, sizeof(v36));
      CMTimeMake(&time, 650, 1000);
      CMTimeConvertScale(&v36, &time, v37.timescale, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
      memset(&v34, 0, sizeof(v34));
      CMTime lhs = v37;
      CMTime rhs = v36;
      CMTimeSubtract(&time1, &lhs, &rhs);
      if (a2) {
        [a2 movieTrimStartTime];
      }
      else {
        memset(&time2, 0, sizeof(time2));
      }
      CMTimeMaximum(&v34, &time1, &time2);
      memset(&v31, 0, sizeof(v31));
      CMTimeMake(&v30, 5, 1000);
      CMTimeConvertScale(&v31, &v30, v34.timescale, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
      lhs.CMTimeValue value = 0;
      *(void *)&lhs.CMTimeScale timescale = &lhs;
      lhs.CMTimeEpoch epoch = 0x2020000000;
      uint64_t v29 = 0;
      rhs.CMTimeValue value = 0;
      *(void *)&rhs.CMTimeScale timescale = &rhs;
      rhs.CMTimeEpoch epoch = 0x2020000000;
      int v27 = 0;
      CMTime v23 = v34;
      CMTime v22 = v31;
      CMTimeSubtract(&start, &v23, &v22);
      CMTime v23 = v37;
      CMTime v22 = v31;
      CMTimeAdd(&end, &v23, &v22);
      CMTimeRangeFromTimeToTime(&v25, &start, &end);
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __64__BWQuickTimeMovieFileSinkNode__computeTransitionVitalityScore___block_invoke;
      v20[3] = &unk_1E5C25760;
      v20[4] = &rhs;
      v20[5] = &lhs;
      -[BWQuickTimeMovieFileSinkNode _computeMotionAnalysisStatisticFromRange:calculation:](v2, &v25.start, (uint64_t)v20);
      unint64_t v4 = *(void *)(*(void *)&lhs.timescale + 24);
      if (v4) {
        float v5 = sqrtf(*(float *)(*(void *)&rhs.timescale + 24) / (float)v4);
      }
      else {
        float v5 = 0.0;
      }
      unint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
      uint64_t v7 = [MEMORY[0x1E4F28E78] string];
      uint64_t v8 = *(void **)(v2 + 848);
      CMTime v23 = v34;
      CMTime v22 = v31;
      CMTimeSubtract(&v19, &v23, &v22);
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __64__BWQuickTimeMovieFileSinkNode__computeTransitionVitalityScore___block_invoke_2;
      v16[3] = &unk_1E5C25788;
      CMTime v17 = v37;
      CMTime v18 = v31;
      v16[4] = v6;
      v16[5] = v7;
      [v8 enumerateObjectsStartingAt:&v19 usingBlock:v16];
      [v6 count];
      v23.CMTimeValue value = 0x7FF8000000000000;
      v22.CMTimeValue value = 0x7FF8000000000000;
      FigDisplayedVitalityClassify(v6, [*(id *)(v2 + 1056) width], (double *)(int)objc_msgSend(*(id *)(v2 + 1056), "height"), (double *)&v23.value, (double *)&v22.value, v5);
      double v10 = v9;
      float v11 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v12 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(HIDWORD(v22.value), LODWORD(v5))));
      uint64_t v13 = [NSNumber numberWithDouble:*(double *)&v23.value];
      objc_msgSend(a2, "setTransitionVitalityFeatures:", objc_msgSend(v11, "dictionaryWithObjectsAndKeys:", v12, @"motionAnalysisRMS", v13, @"thetaMax", objc_msgSend(NSNumber, "numberWithDouble:", *(double *)&v22.value), @"deltaF", 0));
      unint64_t v2 = 1;
      *(float *)&double v14 = v10;
      [a2 setTransitionVitalityScoreV1:v14];
      [a2 setTransitionVitalityScoreValid:1];

      _Block_object_dispose(&rhs, 8);
      _Block_object_dispose(&lhs, 8);
    }
    else
    {
      return 0;
    }
  }
  return v2;
}

uint64_t __64__BWQuickTimeMovieFileSinkNode__computeTransitionVitalityScore___block_invoke(uint64_t result, double a2, float a3)
{
  if (a3 >= 0.0)
  {
    *(float *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(float *)(*(void *)(*(void *)(result + 32)
                                                                                          + 8)
                                                                              + 24)
                                                                   + (float)(a3 * a3);
    if (a3 > 0.0) {
      ++*(void *)(*(void *)(*(void *)(result + 40) + 8) + 24);
    }
  }
  return result;
}

uint64_t __64__BWQuickTimeMovieFileSinkNode__computeTransitionVitalityScore___block_invoke_2(uint64_t a1, uint64_t a2, CMTime *a3)
{
  CMTime lhs = *(CMTime *)(a1 + 48);
  CMTime v7 = *(CMTime *)(a1 + 72);
  CMTimeAdd(&time2, &lhs, &v7);
  CMTime lhs = *a3;
  uint64_t result = CMTimeCompare(&lhs, &time2);
  if ((int)result <= 0) {
    return [*(id *)(a1 + 32) addObject:a2];
  }
  return result;
}

- (uint64_t)_writeStillImageTimeMetadataSampleForCaptureTime:(void *)a3 stillImageTransformData:(uint64_t)a4 referenceDimensions:(uint64_t)a5 toTrackWithID:(int32_t)a6 usingTrackTimeScale:
{
  if (!a1) {
    return 0;
  }
  CMTime lhs = *a2;
  CMSampleBufferRef v33 = 0;
  CMSampleBufferRef QuickTimeMovieStillImageTimeSampleBuffer = FigCaptureMetadataUtilitiesCreateQuickTimeMovieStillImageTimeSampleBuffer((uint64_t)&lhs, a3, a4, a6);
  if (!QuickTimeMovieStillImageTimeSampleBuffer)
  {
    LODWORD(sampleTimingArray) = 0;
    FigDebugAssert3();
    uint64_t v23 = 4294954586;
    objc_msgSend(*(id *)(a1 + 1000), "logErrorNumber:errorString:", 4294954586, @"writing still image metadata", sampleTimingArray, v6);
    return v23;
  }
  double v10 = QuickTimeMovieStillImageTimeSampleBuffer;
  uint64_t v11 = *(void *)(a1 + 592);
  uint64_t v12 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v12) {
    uint64_t v13 = v12;
  }
  else {
    uint64_t v13 = 0;
  }
  double v14 = *(uint64_t (**)(uint64_t, uint64_t, opaqueCMSampleBuffer *))(v13 + 32);
  if (!v14)
  {
    uint64_t v23 = 4294954514;
LABEL_13:
    uint64_t v27 = v6;
    LODWORD(sampleTimingArray) = v23;
LABEL_14:
    FigDebugAssert3();
    objc_msgSend(*(id *)(a1 + 1000), "logErrorNumber:errorString:", v23, @"writing still image metadata", sampleTimingArray, v27);
    goto LABEL_15;
  }
  uint64_t v15 = v14(v11, a5, v10);
  if (v15)
  {
    uint64_t v23 = v15;
    goto LABEL_13;
  }
  memset(&v31, 0, sizeof(v31));
  CMSampleBufferGetPresentationTimeStamp(&v31, v10);
  memset(&v30, 0, sizeof(v30));
  CMSampleBufferGetDuration(&v30, v10);
  long long v16 = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 48);
  *(_OWORD *)&v29.presentationTimeStamp.CMTimeScale timescale = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 32);
  *(_OWORD *)&v29.decodeTimeStamp.CMTimeValue value = v16;
  v29.decodeTimeStamp.CMTimeEpoch epoch = *(void *)(MEMORY[0x1E4F1FA70] + 64);
  long long v17 = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 16);
  *(_OWORD *)&v29.duration.CMTimeValue value = *MEMORY[0x1E4F1FA70];
  *(_OWORD *)&v29.duration.CMTimeEpoch epoch = v17;
  CMTime lhs = v31;
  CMTime rhs = v30;
  CMTimeAdd(&v29.presentationTimeStamp, &lhs, &rhs);
  v29.decodeTimeStamp = v29.presentationTimeStamp;
  uint64_t v18 = CMSampleBufferCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 1u, 0, 0, 0, 0, 1, &v29, 0, 0, &v33);
  if (v18)
  {
    uint64_t v23 = v18;
    uint64_t v27 = v6;
    LODWORD(sampleTimingArray) = v18;
    goto LABEL_14;
  }
  if (v33)
  {
    CMSetAttachment(v33, (CFStringRef)*MEMORY[0x1E4F1F270], (CFTypeRef)*MEMORY[0x1E4F1CFD0], 1u);
    uint64_t v19 = *(void *)(a1 + 592);
    CMSampleBufferRef v20 = v33;
    uint64_t v21 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v21) {
      uint64_t v22 = v21;
    }
    else {
      uint64_t v22 = 0;
    }
    CMTimeRange v25 = *(uint64_t (**)(uint64_t, uint64_t, CMSampleBufferRef))(v22 + 32);
    if (!v25)
    {
      uint64_t v23 = 4294954514;
LABEL_24:
      uint64_t v27 = v6;
      LODWORD(sampleTimingArray) = v23;
      goto LABEL_14;
    }
    uint64_t v23 = v25(v19, a5, v20);
    if (v23) {
      goto LABEL_24;
    }
  }
  else
  {
    uint64_t v23 = 0;
  }
LABEL_15:
  CFRelease(v10);
  if (v33) {
    CFRelease(v33);
  }
  return v23;
}

- (void)_writeMovieSegmentMetadataForSegmentStartPTS:(long long *)a3 segmentDuration:
{
  if (a1)
  {
    CFTypeRef v26 = 0;
    CMSampleBufferRef v25 = 0;
    CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    if (!FigBoxedMetadataCreateForConstruction())
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29128], "UUID"), "UUIDString");
      if (FigBoxedMetadataAppendCFTypedValue()) {
        FigDebugAssert3();
      }
      if (!FigBoxedMetadataEndConstruction())
      {
        BlockBuffer = (OpaqueCMBlockBuffer *)FigBoxedMetadataGetBlockBuffer();
        long long v8 = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 32);
        long long v9 = *a3;
        *(_OWORD *)&sampleTimingArray.duration.CMTimeEpoch epoch = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 16);
        *(_OWORD *)&sampleTimingArray.presentationTimeStamp.CMTimeScale timescale = v8;
        *(_OWORD *)&sampleTimingArray.decodeTimeStamp.CMTimeValue value = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 48);
        *(_OWORD *)&sampleTimingArray.presentationTimeStamp.CMTimeValue value = *a2;
        CMTimeEpoch v10 = *((void *)a2 + 2);
        sampleTimingArray.decodeTimeStamp.CMTimeEpoch epoch = *(void *)(MEMORY[0x1E4F1FA70] + 64);
        sampleTimingArray.presentationTimeStamp.CMTimeEpoch epoch = v10;
        *(_OWORD *)&sampleTimingArray.duration.CMTimeValue value = v9;
        sampleTimingArray.duration.CMTimeEpoch epoch = *((void *)a3 + 2);
        size_t sampleSizeArray = CMBlockBufferGetDataLength(BlockBuffer);
        if (!CMSampleBufferCreate(v6, BlockBuffer, 1u, 0, 0, *(CMFormatDescriptionRef *)(a1 + 1560), 1, 1, &sampleTimingArray, 1, &sampleSizeArray, &v25))
        {
          -[BWQuickTimeMovieFileSinkNode _printBufferEvent:forNodeInputIndex:eventName:]((CMTime *)a1, v25);
          uint64_t v11 = *(void *)(a1 + 592);
          uint64_t v12 = *(unsigned int *)(*(void *)(a1 + 608) + 4 * *(void *)(a1 + 1576));
          CMSampleBufferRef v13 = v25;
          uint64_t v14 = *(void *)(CMBaseObjectGetVTable() + 16);
          if (v14) {
            uint64_t v15 = v14;
          }
          else {
            uint64_t v15 = 0;
          }
          long long v16 = *(unsigned int (**)(uint64_t, uint64_t, CMSampleBufferRef))(v15 + 32);
          if (!v16 || v16(v11, v12, v13))
          {
            FigDebugAssert3();
          }
          else
          {
            uint64_t v17 = *(void *)(a1 + 448);
            uint64_t v18 = *(void *)(a1 + 1576);
            if ((*(unsigned char *)(v17 + 24 * v18 + 12) & 1) == 0)
            {
              uint64_t v19 = v17 + 24 * v18;
              long long v20 = *a2;
              *(void *)(v19 + 16) = *((void *)a2 + 2);
              *(_OWORD *)uint64_t v19 = v20;
              uint64_t v18 = *(void *)(a1 + 1576);
            }
            uint64_t v21 = *(void *)(a1 + 456) + 24 * v18;
            uint64_t v22 = *((void *)a2 + 2);
            *(_OWORD *)uint64_t v21 = *a2;
            *(void *)(v21 + 16) = v22;
          }
        }
      }
    }
    if (v25) {
      CFRelease(v25);
    }
    if (v26) {
      CFRelease(v26);
    }
  }
}

- (uint64_t)_getCurrentFileSize:(CMTime *)a3 currentHostTime:
{
  if (!a1) {
    return 0;
  }
  uint64_t v5 = *(void *)(a1 + 176);
  uint64_t valuePtr = v5;
  if ((a2 & 1) != 0 || (time1 = *(CMTime *)(a1 + 352), CMTime time2 = *a3, CMTimeCompare(&time1, &time2) <= 0))
  {
    CFNumberRef number = 0;
    if (*(void *)(a1 + 592))
    {
      uint64_t FigBaseObject = FigFormatWriterGetFigBaseObject();
      uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 8);
      if (v7) {
        uint64_t v8 = v7;
      }
      else {
        uint64_t v8 = 0;
      }
      long long v9 = *(unsigned int (**)(uint64_t, void, void, CFNumberRef *))(v8 + 48);
      if (!v9 || v9(FigBaseObject, *MEMORY[0x1E4F32CC0], *MEMORY[0x1E4F1CF80], &number))
      {
        FigDebugAssert3();
      }
      else
      {
        CFNumberGetValue(number, kCFNumberSInt64Type, &valuePtr);
        CFRelease(number);
      }
    }
    CMTimeMake(&rhs, a3->timescale / 3, a3->timescale);
    CMTime time2 = *a3;
    CMTimeAdd(&time1, &time2, &rhs);
    *(CMTime *)(a1 + 352) = time1;
    return valuePtr;
  }
  return v5;
}

- (unsigned)_updateMovieFileMemoryAnalytics
{
  if (result)
  {
    uint64_t v1 = result;
    unint64_t v2 = objc_msgSend((id)objc_msgSend(result, "graph"), "memoryAnalyticsPayload");
    objc_msgSend(v2, "setQuickTakeVideo:", objc_msgSend(*((id *)v1 + 50), "isIrisMovieRecording"));
    if ([*((id *)v1 + 50) isIrisRecording]) {
      uint64_t v3 = [*((id *)v1 + 50) isIrisMovieRecording] ^ 1;
    }
    else {
      uint64_t v3 = 0;
    }
    [v2 setLivePhoto:v3];
    [v2 setCinematicVideo:v1[1456]];
    unsigned int v4 = *((_DWORD *)v1 + 224);
    unsigned int v5 = *((_DWORD *)v1 + 225);
    if ((int)v5 >= (int)v4) {
      uint64_t v6 = v4;
    }
    else {
      uint64_t v6 = v5;
    }
    [v2 setVideoMinDimension:v6];
    LODWORD(v7) = vcvtas_u32_f32(*((float *)v1 + 96));
    [v2 setVideoMaxFrameRate:v7];
    objc_msgSend(v2, "setHdrVideo:", objc_msgSend(*((id *)v1 + 132), "hdrVideo"));
    objc_msgSend(v2, "setColorSpace:", objc_msgSend(*((id *)v1 + 132), "colorSpace"));
    [v2 setProResVideo:qtmfsn_movieRecordingIsProRes(*((void **)v1 + 50))];
    uint64_t v8 = [v2 videoRecordingCount] + 1;
    return (unsigned __int8 *)[v2 setVideoRecordingCount:v8];
  }
  return result;
}

- (void)_updateTrackFormatDescriptionsAtURL:(void *)a1
{
  v34[1] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  CFTypeRef cf = 0;
  uint64_t v3 = *MEMORY[0x1E4F1CF80];
  uint64_t v30 = *MEMORY[0x1E4F32B00];
  if (FigMutableMovieCreateWithURL())
  {
LABEL_33:
    FigDebugAssert3();
    goto LABEL_34;
  }
  if (!a1[69])
  {
LABEL_26:
    CFTypeRef v21 = cf;
    uint64_t v22 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v22) {
      uint64_t v23 = v22;
    }
    else {
      uint64_t v23 = 0;
    }
    long long v24 = *(unsigned int (**)(CFTypeRef, uint64_t, uint64_t, void, void))(v23 + 16);
    if (v24 && !v24(v21, v30, a2, 0, 0)) {
      goto LABEL_34;
    }
    goto LABEL_33;
  }
  uint64_t v4 = 0;
  uint64_t v5 = *MEMORY[0x1E4F33180];
  while (1)
  {
    uint64_t v6 = *(void *)(a1[80] + 8 * v4);
    if (!v6) {
      goto LABEL_25;
    }
    uint64_t v7 = *(unsigned int *)(a1[76] + 4 * v4);
    CFArrayRef theArray = 0;
    CFTypeRef v8 = cf;
    uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v9) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = 0;
    }
    uint64_t v11 = *(unsigned int (**)(CFTypeRef, uint64_t, uint64_t, uint64_t, CFArrayRef *))(v10 + 48);
    if (!v11 || v11(v8, v7, v5, v3, &theArray)) {
      goto LABEL_33;
    }
    if (!theArray) {
      goto LABEL_34;
    }
    CFIndex Count = CFArrayGetCount(theArray);
    if (!Count) {
      break;
    }
    CFIndex v13 = Count;
    if (Count >= 1)
    {
      for (CFIndex i = 0; i != v13; ++i)
        CFArrayGetValueAtIndex(theArray, i);
    }
    CFTypeRef v15 = cf;
    v34[0] = v6;
    uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:1];
    uint64_t v17 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v17) {
      uint64_t v18 = v17;
    }
    else {
      uint64_t v18 = 0;
    }
    uint64_t v19 = *(unsigned int (**)(CFTypeRef, uint64_t, uint64_t, uint64_t))(v18 + 56);
    if (!v19 || v19(v15, v7, v5, v16)) {
      goto LABEL_33;
    }
    if (theArray) {
      CFRelease(theArray);
    }
    long long v20 = *(const void **)(a1[80] + 8 * v4);
    if (v20)
    {
      CFRelease(v20);
      *(void *)(a1[80] + 8 * v4) = 0;
    }
LABEL_25:
    if (a1[69] <= (unint64_t)++v4) {
      goto LABEL_26;
    }
  }
  if (theArray) {
    CFRelease(theArray);
  }
LABEL_34:
  if (cf)
  {
    uint64_t FigBaseObject = FigMutableMovieGetFigBaseObject();
    if (FigBaseObject)
    {
      uint64_t v26 = FigBaseObject;
      uint64_t v27 = *(void *)(CMBaseObjectGetVTable() + 8);
      if (v27) {
        uint64_t v28 = v27;
      }
      else {
        uint64_t v28 = 0;
      }
      CMSampleTimingInfo v29 = *(void (**)(uint64_t))(v28 + 24);
      if (v29) {
        v29(v26);
      }
    }
    CFRelease(cf);
  }
}

- (void)_submitMovieFileCoreAnalyticsEvent
{
  v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "io_service_t BWDADiskCopyIOMedia(DADiskRef)"), @"BWQuickTimeMovieFileSinkNode.m", 105, @"%s", dlerror());
  __break(1u);
}

- (__CFString)_computeMovieRecordingVideoSTFStatistics
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t result = (__CFString *)[result[12].data videoSTFEnabled];
    LOBYTE(v1[44].isa) = (_BYTE)result;
    if (LOBYTE(v1[44].isa))
    {
      int data_high = HIDWORD(v1[43].data);
      if (data_high >= 1)
      {
        *(float *)&v1[44].data = (float)((float)SLODWORD(v1[43].data) / (float)data_high) * 100.0;
        int data_high = HIDWORD(v1[43].data);
      }
      if (SLODWORD(v1[43].data) < data_high)
      {
        uint64_t length_low = SLODWORD(v1[43].length);
        if (length_low >= 4) {
          uint64_t result = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"%d", SLODWORD(v1[43].length));
        }
        else {
          uint64_t result = off_1E5C25848[length_low];
        }
        v1[44].info = (uint64_t)result;
      }
    }
  }
  return result;
}

- (void)_debugAudioUsingSampleBuffer:(uint64_t)a1
{
  if (a1)
  {
    if (!*(unsigned char *)(a1 + 738))
    {
      CMFormatDescriptionRef FormatDescription = CMSampleBufferGetFormatDescription(sbuf);
      StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription(FormatDescription);
      if (StreamBasicDescription)
      {
        uint64_t v6 = *(void *)&StreamBasicDescription->mBitsPerChannel;
        long long v7 = *(_OWORD *)&StreamBasicDescription->mBytesPerPacket;
        *(_OWORD *)(a1 + 752) = *(_OWORD *)&StreamBasicDescription->mSampleRate;
        *(_OWORD *)(a1 + 768) = v7;
        *(void *)(a1 + 784) = v6;
        *(unsigned char *)(a1 + 738) = 1;
        free(*(void **)(a1 + 792));
        *(void *)(a1 + 792) = 0;
      }
    }
    if (*(unsigned char *)(a1 + 738)
      && *(_DWORD *)(a1 + 760) == 1819304813
      && ((~*(_DWORD *)(a1 + 764) & 9) == 0 || (*(_DWORD *)(a1 + 764) & 0xC) == 12))
    {
      if (!*(void *)(a1 + 792))
      {
        uint64_t v9 = malloc_type_calloc(1uLL, 16 * (*(_DWORD *)(a1 + 780) - 1) + 24, 0x4CDD505EuLL);
        *(void *)(a1 + 792) = v9;
        _DWORD *v9 = *(_DWORD *)(a1 + 780);
        uint64_t v10 = *(_DWORD **)(a1 + 792);
        if (*v10)
        {
          unint64_t v11 = 0;
          uint64_t v12 = 2;
          do
          {
            v10[v12] = 1;
            ++v11;
            uint64_t v10 = *(_DWORD **)(a1 + 792);
            v12 += 4;
          }
          while (v11 < *v10);
        }
      }
      DataBuffer = CMSampleBufferGetDataBuffer(sbuf);
      uint64_t v19 = 0;
      size_t totalLengthOut = 0;
      if (!CMBlockBufferGetDataPointer(DataBuffer, 0, 0, &totalLengthOut, &v19))
      {
        uint64_t v14 = *(_DWORD **)(a1 + 792);
        if (*v14)
        {
          uint64_t v15 = 0;
          unint64_t v16 = 0;
          uint64_t v17 = v19;
          uint64_t v18 = totalLengthOut / *v14;
          do
          {
            v14[v15 + 3] = v18;
            *(void *)(*(void *)(a1 + 792) + v15 * 4 + 16) = v17;
            uint64_t v17 = &v19[v18];
            v19 += v18;
            ++v16;
            uint64_t v14 = *(_DWORD **)(a1 + 792);
            v15 += 4;
          }
          while (v16 < *v14);
        }
      }
    }
  }
}

- (uint64_t)_preprocessingForFirstVideoBuffer:(uint64_t)a3 forInputIndex:
{
  if (!result) {
    return result;
  }
  uint64_t v5 = result;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = *(void **)(v5 + 400);
    if (v6)
    {
      long long v7 = (void *)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E4F53070], 0);
      CFTypeRef v8 = (void *)[v7 objectForKeyedSubscript:*MEMORY[0x1E4F54128]];
      if ([v8 isEqualToString:*MEMORY[0x1E4F52DF8]])
      {
        uint64_t v9 = 2;
      }
      else if ([v8 isEqualToString:*MEMORY[0x1E4F52E10]])
      {
        uint64_t v9 = 2;
      }
      else
      {
        uint64_t v9 = 1;
      }
      *(_OWORD *)(v5 + 1064) = 0u;
      *(_OWORD *)(v5 + 1080) = 0u;
      *(_OWORD *)(v5 + 1096) = 0u;
      *(_OWORD *)(v5 + 1112) = 0u;
      *(_OWORD *)(v5 + 1128) = 0u;
      *(_OWORD *)(v5 + 1144) = 0u;
      *(_OWORD *)(v5 + 1160) = 0u;
      *(_OWORD *)(v5 + 1176) = 0u;
      *(_OWORD *)(v5 + 1192) = 0u;
      *(_OWORD *)(v5 + 1208) = 0u;
      *(_OWORD *)(v5 + 1224) = 0u;
      *(_OWORD *)(v5 + 1240) = 0u;
      *(void *)(v5 + 1256) = 0;
      [*(id *)(v5 + 1264) removeAllObjects];
      [*(id *)(v5 + 1272) removeAllObjects];
      *(void *)(v5 + 1312) = mach_absolute_time();
      *(void *)(v5 + 1288) = 0;
      *(void *)(v5 + 1296) = 0;
      *(_DWORD *)(v5 + 1304) = 0;
      *(void *)(v5 + 1320) = -1;
      *(_DWORD *)(v5 + 1328) = 0;
      *(_DWORD *)(v5 + 1332) = 0;
      [*(id *)(v5 + 1360) removeAllObjects];
      [*(id *)(v5 + 1368) removeAllObjects];
      [*(id *)(v5 + 1360) setObject:*(void *)(v5 + 1368) forKeyedSubscript:0x1EFA73A60];
      unint64_t v11 = (void *)[v7 objectForKeyedSubscript:0x1EFA73A00];
      objc_msgSend(*(id *)(v5 + 1360), "setObject:forKeyedSubscript:", objc_msgSend(v11, "objectForKeyedSubscript:", 0x1EFA73A40), 0x1EFA73A40);
      *(_DWORD *)(v5 + 1376) = objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", 0x1EFA73A20), "intValue");
      objc_msgSend(*(id *)(v5 + 1520), "reset", -[BWQuickTimeMovieFileSinkNode _resetVideoSTFAnalytics](v5));
      *(unsigned char *)(v5 + 1528) = 0;
      CMFormatDescriptionRef FormatDescription = CMSampleBufferGetFormatDescription((CMSampleBufferRef)a2);
      CMVideoDimensions Dimensions = CMVideoFormatDescriptionGetDimensions(FormatDescription);
      [*(id *)(v5 + 1056) setHeight:HIDWORD(*(unint64_t *)&Dimensions)];
      [*(id *)(v5 + 1056) setWidth:Dimensions];
      *(CMVideoDimensions *)(v5 + 896) = Dimensions;
      objc_msgSend((id)CMGetAttachment(a2, @"UIZoomFactor", 0), "floatValue");
      objc_msgSend(*(id *)(v5 + 1056), "setStartingUIZoom:");
      [*(id *)(v5 + 1056) setDevicePosition:v9];
      objc_msgSend(*(id *)(v5 + 1056), "setVideoOrientation:", objc_msgSend(v6, "videoOrientation"));
      objc_msgSend(*(id *)(v5 + 1056), "setVideoMirrored:", objc_msgSend(v6, "videoMirrored"));
      uint64_t v14 = (void *)[v7 objectForKeyedSubscript:*MEMORY[0x1E4F53D68]];
      if (v14) {
        objc_msgSend(*(id *)(v5 + 1056), "setCameraPosture:", objc_msgSend(v14, "intValue"));
      }
      [*(id *)(v5 + 1056) setClientApplicationID:*(void *)(v5 + 1008)];
      uint64_t v10 = -[BWQuickTimeMovieFileSinkNode _setTrackMatrixProperty:forInputIndex:fileSettings:metadata:]((void *)v5, (opaqueCMSampleBuffer *)a2, a3, v6, v7);
      uint64_t v15 = (__CVBuffer *)CMGetAttachment(a2, @"FileCompletionScaledThumbnailSourcePixelBuffer", 0);
      if (v15)
      {
        unint64_t v16 = v15;
        -[BWQuickTimeMovieFileSinkNode _generateThumbnailSurfaceFromPixelBuffer:physicallyMirroredHorizontallyUpstream:](v5, v15, objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", @"MirroredHorizontal"), "BOOLValue"));
        [*(id *)(v5 + 1056) setHdrVideo:BWPixelBufferIsHDR(v16)];
        [*(id *)(v5 + 1056) setColorSpace:BWPixelBufferColorSpace(v16)];
      }
      CMSetAttachment(a2, @"FileCompletionScaledThumbnailSourcePixelBuffer", 0, 1u);
      goto LABEL_16;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  uint64_t v10 = 0;
LABEL_16:

  *(void *)(v5 + 1336) = 0;
  *(void *)(v5 + 1344) = 0;
  if ([v6 isIrisRecording])
  {
    uint64_t v17 = objc_alloc_init(BWStats);
    *(void *)(v5 + 968) = v17;
    [(BWStats *)v17 setMultiplier:0.000001];
    [*(id *)(v5 + 968) setUnitDesignator:@"ms"];
    uint64_t v18 = [[BWMovingWindowStats alloc] initWithWindowSize:128];
    *(void *)(v5 + 976) = v18;
    [(BWStats *)v18 setMultiplier:0.000001];
    [*(id *)(v5 + 976) setUnitDesignator:@"ms"];
    uint64_t v19 = [[BWStats alloc] initWithMedianCalculationEnabled:1 maxNumberOfSamplesForMedianCalculation:0];
    *(void *)(v5 + 1336) = v19;
    [(BWStats *)v19 setMultiplier:1000.0];
    [*(id *)(v5 + 1336) setUnitDesignator:@"ms"];
  }
  long long v20 = objc_alloc_init(BWStats);
  *(void *)(v5 + 984) = v20;
  [(BWStats *)v20 setMultiplier:0.000001];
  uint64_t result = [*(id *)(v5 + 984) setUnitDesignator:@"ms"];
  if (v10)
  {
    CFTypeRef v21 = *(void **)(v5 + 1000);
    return [v21 logErrorNumber:v10 errorString:@"preprocess video"];
  }
  return result;
}

- (double)_resetVideoSTFAnalytics
{
  if (a1)
  {
    *(_DWORD *)(a1 + 1396) = 0;
    *(_DWORD *)(a1 + 1392) = 0;
    *(_DWORD *)(a1 + 1400) = 3;
    double result = 0.0;
    *(_OWORD *)(a1 + 1408) = 0u;
    *(_OWORD *)(a1 + 1424) = 0u;
    *(_OWORD *)(a1 + 1440) = 0u;
  }
  return result;
}

- (uint64_t)_setTrackMatrixProperty:(uint64_t)a3 forInputIndex:(void *)a4 fileSettings:(void *)a5 metadata:
{
  if (!a1) {
    return 0;
  }
  uint64_t v10 = (void *)[a5 objectForKeyedSubscript:*MEMORY[0x1E4F54128]];
  int v11 = ([v10 isEqualToString:*MEMORY[0x1E4F52DF8]] & 1) != 0
      ? 1
      : [v10 isEqualToString:*MEMORY[0x1E4F52E10]];
  BOOL IsExtensionDeviceType = BWDeviceTypeIsExtensionDeviceType(objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E4F53DE0]), "integerValue"));
  unsigned int v13 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", @"MirroredHorizontal"), "BOOLValue");
  int v14 = (v13 & 1) != 0 ? 0 : [a4 videoMirrored];
  int v15 = [a4 videoOrientation];
  CMFormatDescriptionRef FormatDescription = CMSampleBufferGetFormatDescription(a2);
  uint64_t Dimensions = (uint64_t)CMVideoFormatDescriptionGetDimensions(FormatDescription);
  objc_msgSend((id)objc_msgSend(a1, "graph"), "clientExpectsCameraMountedInLandscapeOrientation");
  uint64_t v18 = BWBuildVideoTrackMatrix(v15, v14, v13, v11, IsExtensionDeviceType, 0, Dimensions);
  if (!v18) {
    return 0;
  }
  uint64_t v19 = v18;
  uint64_t v20 = a1[74];
  uint64_t v21 = *(unsigned int *)(a1[76] + 4 * a3);
  uint64_t v22 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v22) {
    uint64_t v23 = v22;
  }
  else {
    uint64_t v23 = 0;
  }
  CMSampleBufferRef v25 = *(uint64_t (**)(uint64_t, uint64_t, void, uint64_t))(v23 + 24);
  if (!v25)
  {
    uint64_t v24 = 4294954514;
LABEL_17:
    FigDebugAssert3();
    FigDebugAssert3();
    return v24;
  }
  uint64_t v24 = v25(v20, v21, *MEMORY[0x1E4F32F00], v19);
  if (v24) {
    goto LABEL_17;
  }
  return v24;
}

- (uint64_t)_preprocessingForFirstAuxiliaryBuffer:(uint64_t)a3 forInputIndex:
{
  if (result)
  {
    uint64_t v5 = (void *)result;
    objc_opt_class();
    double result = objc_opt_isKindOfClass();
    if (result)
    {
      uint64_t v6 = (void *)v5[50];
      if (v6)
      {
        long long v7 = (void *)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E4F53070], 0);
        double result = -[BWQuickTimeMovieFileSinkNode _setTrackMatrixProperty:forInputIndex:fileSettings:metadata:](v5, (opaqueCMSampleBuffer *)a2, a3, v6, v7);
        if (result)
        {
          uint64_t v8 = result;
          uint64_t v9 = (void *)v5[125];
          return [v9 logErrorNumber:v8 errorString:@"preprocess auxiliary"];
        }
      }
    }
  }
  return result;
}

- (uint64_t)_preprocessingForFirstAudioBuffer:(uint64_t)a3 forInputIndex:
{
  if (!result) {
    return result;
  }
  uint64_t v4 = result;
  CMFormatDescriptionRef FormatDescription = CMSampleBufferGetFormatDescription(sbuf);
  StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription(FormatDescription);
  if (!StreamBasicDescription
    || (double v7 = StreamBasicDescription->mSampleRate + 0.5, v8 = (int)v7, !v8))
  {
    FigDebugAssert3();
    uint64_t v16 = 0xFFFFFFFFLL;
LABEL_25:
    uint64_t v23 = *(void **)(v4 + 1000);
    return [v23 logErrorNumber:v16 errorString:@"preprocess audio"];
  }
  uint64_t v9 = *(void *)(v4 + 592);
  uint64_t v10 = *(unsigned int *)(*(void *)(v4 + 608) + 4 * a3);
  uint64_t v11 = *MEMORY[0x1E4F32E60];
  uint64_t v12 = [NSNumber numberWithInt:(int)v7];
  uint64_t v13 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v13) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = 0;
  }
  int v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 24);
  if (v15)
  {
    double result = v15(v9, v10, v11, v12);
    uint64_t v16 = result;
    if (!result) {
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v16 = 4294954514;
  }
  double result = FigDebugAssert3();
LABEL_12:
  if (*(_DWORD *)(v4 + 1572)) {
    goto LABEL_22;
  }
  uint64_t v17 = *(void *)(v4 + 592);
  uint64_t v18 = *(unsigned int *)(*(void *)(v4 + 608) + 4 * *(void *)(v4 + 1576));
  uint64_t v19 = [NSNumber numberWithInt:v8];
  uint64_t v20 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v20) {
    uint64_t v21 = v20;
  }
  else {
    uint64_t v21 = 0;
  }
  uint64_t v22 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v21 + 24);
  if (!v22)
  {
    uint64_t v16 = 4294954514;
LABEL_20:
    double result = FigDebugAssert3();
    goto LABEL_21;
  }
  double result = v22(v17, v18, v11, v19);
  uint64_t v16 = result;
  if (result) {
    goto LABEL_20;
  }
LABEL_21:
  *(_DWORD *)(v4 + 1572) = v8;
LABEL_22:
  if (*(void *)(v4 + 704) == a3) {
    *(_DWORD *)(v4 + 376) = v8;
  }
  if (v16) {
    goto LABEL_25;
  }
  return result;
}

- (void)_preprocessingForFirstMetadataBuffer:(uint64_t)a3 forInputIndex:
{
  v13[1] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v4 = result;
    if (!*(void *)(result[80] + 8 * a3))
    {
      uint64_t v5 = result[74];
      uint64_t v6 = *(unsigned int *)(result[76] + 4 * a3);
      v13[0] = CMSampleBufferGetFormatDescription(sbuf);
      uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
      uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v8) {
        uint64_t v9 = v8;
      }
      else {
        uint64_t v9 = 0;
      }
      uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, void, uint64_t))(v9 + 24);
      if (v10)
      {
        double result = (void *)v10(v5, v6, *MEMORY[0x1E4F32E00], v7);
        if (!result) {
          return result;
        }
        uint64_t v11 = (uint64_t)result;
      }
      else
      {
        uint64_t v11 = 4294954514;
      }
      LODWORD(v12) = v11;
      FigDebugAssert3();
      return objc_msgSend((id)v4[125], "logErrorNumber:errorString:", v11, @"preprocess metadata", v12, v3);
    }
  }
  return result;
}

- (uint64_t)_checkFreeSpaceForEstimatedMovieSizeOverhead:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    uint64_t SInt64 = BWGetFreeDiskSpaceAtPath(*(const char **)(result + 416));
    if (*(void *)(v3 + 1536) && [*(id *)(v3 + 400) usesVirtualCaptureCard])
    {
      CFTypeRef cf = 0;
      uint64_t CMBaseObject = FigVirtualCaptureCardGetCMBaseObject();
      uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 8);
      if (v6) {
        uint64_t v7 = v6;
      }
      else {
        uint64_t v7 = 0;
      }
      uint64_t v8 = *(unsigned int (**)(uint64_t, void, void, CFTypeRef *))(v7 + 48);
      if (!v8 || v8(CMBaseObject, *MEMORY[0x1E4F22058], 0, &cf))
      {
        FigDebugAssert3();
        uint64_t SInt64 = 0;
      }
      else
      {
        uint64_t SInt64 = FigCFNumberGetSInt64();
      }
      if (cf) {
        CFRelease(cf);
      }
    }
    if (SInt64 <= -[BWQuickTimeMovieFileSinkNode _adjustedMinFreeDiskSpaceLimitForEstimatedMovieSizeOverhead:](v3, a2)) {
      return 4294950885;
    }
    else {
      return 0;
    }
  }
  return result;
}

- (uint64_t)_adjustedMinFreeDiskSpaceLimitForEstimatedMovieSizeOverhead:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    int v4 = [*(id *)(result + 664) numberOfPendingReferenceMovies];
    if (qtmfsn_minFreeDiskSpaceLimit_onceToken != -1) {
      dispatch_once(&qtmfsn_minFreeDiskSpaceLimit_onceToken, &__block_literal_global_599);
    }
    uint64_t v5 = qtmfsn_minFreeDiskSpaceLimit_sMinFreeDiskSpaceLimit + 10485760 * v4;
    if (*(void *)(v3 + 216)) {
      uint64_t v6 = *(void *)(v3 + 216);
    }
    else {
      uint64_t v6 = qtmfsn_minFreeDiskSpaceLimit_sMinFreeDiskSpaceLimit + 10485760 * v4;
    }
    if (v6 > v5) {
      uint64_t v5 = v6;
    }
    return v5 + a2;
  }
  return result;
}

- (void)_writeVideoTrackLevelMetadataForSampleBuffer:(uint64_t)a3 inputIndex:
{
  values[3] = *(void **)MEMORY[0x1E4F143B8];
  if (a1)
  {
    CFDictionaryRef MetadataAttachments = FigCaptureMetadataUtilitiesCreateMetadataAttachments(a2, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                            objc_msgSend((id)objc_msgSend(a1, "graph"), "clientExpectsCameraMountedInLandscapeOrientation"));
    uint64_t v35 = a3;
    CFDictionaryRef cf = MetadataAttachments;
    CMTime v34 = a1;
    if (MetadataAttachments
      && (CFDictionaryRef MetadataAttachments = (const __CFDictionary *)CFDictionaryGetValue(MetadataAttachments, (const void *)*MEMORY[0x1E4F2F800])) != 0)
    {
      CFDictionaryRef v7 = MetadataAttachments;
      uint64_t v8 = (__CFString *)CFDictionaryGetValue(MetadataAttachments, (const void *)*MEMORY[0x1E4F2F890]);
      CFDictionaryRef MetadataAttachments = (const __CFDictionary *)CFDictionaryGetValue(v7, (const void *)*MEMORY[0x1E4F2F848]);
    }
    else
    {
      uint64_t v8 = 0;
    }
    uint64_t v9 = @"Unknown";
    if (v8) {
      uint64_t v10 = v8;
    }
    else {
      uint64_t v10 = @"Unknown";
    }
    if (MetadataAttachments) {
      uint64_t v9 = (__CFString *)MetadataAttachments;
    }
    CMTimeValue value = v9;
    CFTypeRef v11 = CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E4F53070], 0);
    int valuePtr = 0;
    int v32 = FigCaptureWritePackedValueForModuleAndCalibrationValidationStatusesFromMetadata((uint64_t)v11, &valuePtr);
    CFAllocatorRef v12 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    uint64_t v13 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E4F1D540];
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 4, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    int v15 = (const void *)*MEMORY[0x1E4F33028];
    uint64_t v16 = (const void *)*MEMORY[0x1E4F344A8];
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F33028], (const void *)*MEMORY[0x1E4F344A8]);
    uint64_t v17 = (const void *)*MEMORY[0x1E4F33020];
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F33020], @"com.apple.quicktime.camera.lens_model");
    CFLocaleRef v18 = CFLocaleCopyCurrent();
    uint64_t v19 = (const void *)*MEMORY[0x1E4F33038];
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F33038], v18);
    uint64_t v20 = (const void *)*MEMORY[0x1E4F33060];
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F33060], v10);
    uint64_t v21 = CFDictionaryCreateMutable(v12, 4, MEMORY[0x1E4F1D530], v13);
    CFDictionarySetValue(v21, v15, v16);
    CFDictionarySetValue(v21, v17, @"com.apple.quicktime.camera.focal_length.35mm_equivalent");
    CFDictionarySetValue(v21, v19, v18);
    CFRelease(v18);
    CFDictionarySetValue(v21, v20, value);
    if (v32)
    {
      CFIndex v22 = 3;
      uint64_t v23 = CFDictionaryCreateMutable(v12, 3, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      CFDictionarySetValue(v23, v15, v16);
      CFDictionarySetValue(v23, v17, @"com.apple.quicktime.apple-maker-note.91");
      CFNumberRef v24 = CFNumberCreate(v12, kCFNumberSInt32Type, &valuePtr);
      CFDictionarySetValue(v23, v20, v24);
      CFRelease(v24);
    }
    else
    {
      uint64_t v23 = 0;
      CFIndex v22 = 2;
    }
    values[0] = Mutable;
    values[1] = v21;
    values[2] = v23;
    CFArrayRef v25 = CFArrayCreate(v12, (const void **)values, v22, MEMORY[0x1E4F1D510]);
    CFRelease(Mutable);
    CFRelease(v21);
    if (v23) {
      CFRelease(v23);
    }
    uint64_t v26 = CFDictionaryCreateMutable(v12, 2, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    CFDictionaryAddValue(v26, (const void *)*MEMORY[0x1E4F33070], v25);
    CFRelease(v25);
    CFDictionaryAddValue(v26, (const void *)*MEMORY[0x1E4F33068], (const void *)*MEMORY[0x1E4F32FD0]);
    uint64_t v27 = v34[74];
    uint64_t v28 = *(unsigned int *)(v34[76] + 4 * v35);
    uint64_t v29 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v29) {
      uint64_t v30 = v29;
    }
    else {
      uint64_t v30 = 0;
    }
    CMTime v31 = *(unsigned int (**)(uint64_t, uint64_t, void, __CFDictionary *))(v30 + 24);
    if (!v31 || v31(v27, v28, *MEMORY[0x1E4F32E78], v26)) {
      FigDebugAssert3();
    }
    CFRelease(v26);
    if (cf) {
      CFRelease(cf);
    }
  }
}

- (uint64_t)_adjustMaxFileDurationForMovieTimeScale:(uint64_t)a1
{
  if (a1)
  {
    *(unsigned char *)(a1 + 736) = 0;
    uint64_t v3 = (CMTime *)(a1 + 328);
    CMTimeMakeWithSeconds(&time1, 2147483650.0 / (double)preferredTimescale + -60.0, preferredTimescale);
    CMTime *v3 = time1;
    if ((*(_DWORD *)(a1 + 316) & 0x1D) == 1)
    {
      CMTime time1 = *(CMTime *)(a1 + 304);
      CMTime v6 = *(CMTime *)(a1 + 328);
      if (CMTimeCompare(&time1, &v6) < 0)
      {
        uint64_t v4 = *(void *)(a1 + 320);
        *(_OWORD *)(a1 + 328) = *(_OWORD *)(a1 + 304);
        *(void *)(a1 + 344) = v4;
      }
    }
  }
  return 0;
}

- (void)_collectCoreAnalyticsData:(uint64_t)a1
{
  if (!a1) {
    return;
  }
  CMAttachmentBearerRef v2 = target;
  uint64_t v4 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  uint64_t v5 = (void *)[v4 objectForKeyedSubscript:*MEMORY[0x1E4F54128]];
  if ([v5 isEqualToString:*MEMORY[0x1E4F52DF8]]) {
    ++*(void *)(a1 + 1016);
  }
  char v6 = [v5 isEqualToString:*MEMORY[0x1E4F52E10]];
  CFDictionaryRef v7 = (uint64_t *)MEMORY[0x1E4F52DD8];
  if (v6)
  {
    uint64_t v8 = &OBJC_IVAR___BWQuickTimeMovieFileSinkNode__numVideoFramesPortTypeFront;
  }
  else if ([v5 isEqualToString:*MEMORY[0x1E4F52DD8]])
  {
    uint64_t v8 = &OBJC_IVAR___BWQuickTimeMovieFileSinkNode__numVideoFramesPortTypeBack;
  }
  else if ([v5 isEqualToString:*MEMORY[0x1E4F52DF0]])
  {
    uint64_t v8 = &OBJC_IVAR___BWQuickTimeMovieFileSinkNode__numVideoFramesPortTypeTelephoto;
  }
  else
  {
    if (![v5 isEqualToString:*MEMORY[0x1E4F52DE8]]) {
      goto LABEL_13;
    }
    uint64_t v8 = &OBJC_IVAR___BWQuickTimeMovieFileSinkNode__numVideoFramesPortTypeSuperWide;
  }
  ++*(void *)(a1 + *v8);
LABEL_13:
  uint64_t v9 = (void *)[v4 objectForKeyedSubscript:*MEMORY[0x1E4F53DD8]];
  if (v9)
  {
    uint64_t v10 = v9;
    float v11 = *(float *)(a1 + 1064);
    float v12 = (float)*(unsigned int *)(a1 + 1180);
    objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E4F53928]), "floatValue");
    *(float *)(a1 + 1064) = (float)(v13 + (float)(v11 * v12)) / (float)(*(_DWORD *)(a1 + 1180) + 1);
    float v14 = *(float *)(a1 + 1068);
    float v15 = (float)*(unsigned int *)(a1 + 1180);
    objc_msgSend((id)objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E4F53930]), "floatValue");
    *(float *)(a1 + 1068) = (float)(v16 + (float)(v14 * v15)) / (float)++*(_DWORD *)(a1 + 1180);
  }
  uint64_t v17 = (void *)[v4 objectForKeyedSubscript:*MEMORY[0x1E4F54270]];
  CFLocaleRef v18 = (void *)[v4 objectForKeyedSubscript:*MEMORY[0x1E4F53CC8]];
  uint64_t v19 = (void *)[v4 objectForKeyedSubscript:*MEMORY[0x1E4F54298]];
  uint64_t v20 = (void *)[v4 objectForKeyedSubscript:*MEMORY[0x1E4F542A0]];
  uint64_t v21 = *v7;
  if ([v5 isEqualToString:v21])
  {
    if (v17 && v18)
    {
      CMAttachmentBearerRef v136 = v2;
      CFIndex v22 = (void *)[v17 objectForKeyedSubscript:*MEMORY[0x1E4F54DD8]];
      if (v22)
      {
        uint64_t v23 = v22;
        float v24 = *(float *)(a1 + 1072);
        [v22 floatValue];
        if (v24 <= (float)(v25 * 0.0039062))
        {
          [v23 floatValue];
          float v26 = v38 * 0.0039062;
        }
        else
        {
          float v26 = *(float *)(a1 + 1072);
        }
        *(float *)(a1 + 1072) = v26;
      }
      uint64_t v39 = (void *)[v17 objectForKeyedSubscript:*MEMORY[0x1E4F54E18]];
      if (v39)
      {
        [v39 floatValue];
        *(float *)(a1 + 1080) = *(float *)(a1 + 1080) + (float)((float)(v40 * 0.0039062) * (float)(v40 * 0.0039062));
      }
      int64_t v41 = (void *)[v17 objectForKeyedSubscript:*MEMORY[0x1E4F54DF0]];
      if (v41)
      {
        long long v42 = v41;
        if (*(_DWORD *)(a1 + 1184)
          && (float v43 = *(float *)(a1 + 1112), [v41 floatValue], v43 < (float)(v44 * 0.0039062)))
        {
          float v45 = *(float *)(a1 + 1112);
        }
        else
        {
          [v42 floatValue];
          float v45 = v46 * 0.0039062;
        }
        *(float *)(a1 + 1112) = v45;
      }
      uint64_t v47 = (void *)[v17 objectForKeyedSubscript:*MEMORY[0x1E4F54E10]];
      if (v47)
      {
        [v47 floatValue];
        *(float *)(a1 + 1120) = v48 + *(float *)(a1 + 1120);
      }
      int v49 = (void *)[v17 objectForKeyedSubscript:*MEMORY[0x1E4F54E00]];
      if (v49)
      {
        [v49 floatValue];
        float v51 = v50;
        float v52 = *(float *)(a1 + 1128);
        if (v52 <= v51) {
          float v52 = v51;
        }
        *(float *)(a1 + 1128) = v52;
      }
      else
      {
        float v51 = 0.0;
      }
      uint64_t v53 = (void *)[v18 objectForKeyedSubscript:*MEMORY[0x1E4F53698]];
      if (v53)
      {
        uint64_t v54 = v53;
        float v55 = *(float *)(a1 + 1088);
        [v53 floatValue];
        if (v55 <= v56) {
          [v54 floatValue];
        }
        else {
          int v57 = *(_DWORD *)(a1 + 1088);
        }
        *(_DWORD *)(a1 + 1088) = v57;
      }
      long long v58 = (void *)[v18 objectForKeyedSubscript:*MEMORY[0x1E4F536D0]];
      if (v58)
      {
        [v58 floatValue];
        *(float *)(a1 + 1100) = *(float *)(a1 + 1100) + (float)(v59 * v59);
      }
      unsigned int v60 = (void *)[v18 objectForKeyedSubscript:*MEMORY[0x1E4F536B8]];
      CMAttachmentBearerRef v2 = v136;
      if (v60)
      {
        [v60 floatValue];
        *(float *)(a1 + 1140) = v61 + *(float *)(a1 + 1140);
      }
      CMTimeEpoch v62 = (void *)[v18 objectForKeyedSubscript:*MEMORY[0x1E4F536A8]];
      if (v62)
      {
        [v62 floatValue];
        float v64 = *(float *)(a1 + 1152);
        if (v64 <= v63) {
          float v64 = v63;
        }
        *(float *)(a1 + 1152) = v64;
      }
      else
      {
        float v63 = 0.0;
      }
      float v65 = v51 + v63;
      if (*(float *)(a1 + 1168) > v65) {
        float v65 = *(float *)(a1 + 1168);
      }
      *(float *)(a1 + 1168) = v65;
      ++*(_DWORD *)(a1 + 1184);
    }
    if (v20)
    {
      *(unsigned char *)(a1 + 1196) = 1;
      uint64_t v138 = 0;
      uint64_t v139 = 0;
      [v20 getBytes:&v138 length:16];
      if (!(_WORD)v138)
      {
        *(_DWORD *)(a1 + 1200) += WORD1(v138);
        *(_DWORD *)(a1 + 1204) += WORD2(v138);
        *(_DWORD *)(a1 + 1208) += HIWORD(v138);
        *(_DWORD *)(a1 + 1212) += (unsigned __int16)v139;
        *(_DWORD *)(a1 + 1216) += WORD1(v139);
        *(_DWORD *)(a1 + 1224) += WORD2(v139);
        *(_DWORD *)(a1 + 1228) += HIWORD(v139);
      }
    }
    else if (v19)
    {
      *(unsigned char *)(a1 + 1196) = 0;
      LODWORD(v139) = 0;
      uint64_t v138 = 0;
      [v19 getBytes:&v138 length:12];
      *(_DWORD *)(a1 + 1200) += (unsigned __int16)v138;
      *(_DWORD *)(a1 + 1204) += WORD1(v138);
      *(_DWORD *)(a1 + 1208) += WORD2(v138);
      *(_DWORD *)(a1 + 1212) += HIWORD(v138);
      *(_DWORD *)(a1 + 1216) += (unsigned __int16)v139;
      *(_DWORD *)(a1 + 1220) += WORD1(v139);
    }
  }
  else
  {
    uint64_t v21 = *MEMORY[0x1E4F52DF0];
    if (![v5 isEqualToString:*MEMORY[0x1E4F52DF0]])
    {
      uint64_t v32 = *MEMORY[0x1E4F52DE8];
      if (![v5 isEqualToString:*MEMORY[0x1E4F52DE8]]) {
        goto LABEL_115;
      }
      if (v18)
      {
        CMSampleBufferRef v33 = (void *)[v18 objectForKeyedSubscript:*MEMORY[0x1E4F53698]];
        if (v33)
        {
          CMTime v34 = v33;
          float v35 = *(float *)(a1 + 1096);
          [v33 floatValue];
          if (v35 <= v36) {
            [v34 floatValue];
          }
          else {
            int v37 = *(_DWORD *)(a1 + 1096);
          }
          *(_DWORD *)(a1 + 1096) = v37;
        }
        uint64_t v127 = (void *)[v18 objectForKeyedSubscript:*MEMORY[0x1E4F536D0]];
        if (v127)
        {
          [v127 floatValue];
          *(float *)(a1 + 1108) = *(float *)(a1 + 1108) + (float)(v128 * v128);
        }
        uint64_t v129 = (void *)[v18 objectForKeyedSubscript:*MEMORY[0x1E4F536B8]];
        if (v129)
        {
          [v129 floatValue];
          *(float *)(a1 + 1148) = v130 + *(float *)(a1 + 1148);
        }
        uint64_t v131 = (void *)[v18 objectForKeyedSubscript:*MEMORY[0x1E4F536A8]];
        if (v131)
        {
          uint64_t v132 = v131;
          float v133 = *(float *)(a1 + 1160);
          [v131 floatValue];
          if (v133 <= v134) {
            [v132 floatValue];
          }
          else {
            int v135 = *(_DWORD *)(a1 + 1160);
          }
          *(_DWORD *)(a1 + 1160) = v135;
        }
        ++*(_DWORD *)(a1 + 1192);
      }
      if ([*(id *)(a1 + 1272) objectForKeyedSubscript:v32]) {
        goto LABEL_115;
      }
      uint64_t v94 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F53CD8]];
      uint64_t v95 = *(void **)(a1 + 1272);
      uint64_t v96 = v32;
      goto LABEL_114;
    }
    if (v17 && v18)
    {
      CMAttachmentBearerRef v137 = v2;
      uint64_t v27 = (void *)[v17 objectForKeyedSubscript:*MEMORY[0x1E4F54DD8]];
      if (v27)
      {
        uint64_t v28 = v27;
        float v29 = *(float *)(a1 + 1076);
        [v27 floatValue];
        if (v29 <= (float)(v30 * 0.0039062))
        {
          [v28 floatValue];
          float v31 = v66 * 0.0039062;
        }
        else
        {
          float v31 = *(float *)(a1 + 1076);
        }
        *(float *)(a1 + 1076) = v31;
      }
      long long v67 = (void *)[v17 objectForKeyedSubscript:*MEMORY[0x1E4F54E18]];
      if (v67)
      {
        [v67 floatValue];
        *(float *)(a1 + 1084) = *(float *)(a1 + 1084) + (float)((float)(v68 * 0.0039062) * (float)(v68 * 0.0039062));
      }
      uint64_t v69 = (void *)[v17 objectForKeyedSubscript:*MEMORY[0x1E4F54DF0]];
      if (v69)
      {
        uint64_t v70 = v69;
        if (*(_DWORD *)(a1 + 1188)
          && (float v71 = *(float *)(a1 + 1116), [v69 floatValue], v71 < (float)(v72 * 0.0039062)))
        {
          float v73 = *(float *)(a1 + 1116);
        }
        else
        {
          [v70 floatValue];
          float v73 = v74 * 0.0039062;
        }
        *(float *)(a1 + 1116) = v73;
      }
      uint64_t v75 = (void *)[v17 objectForKeyedSubscript:*MEMORY[0x1E4F54E10]];
      if (v75)
      {
        [v75 floatValue];
        *(float *)(a1 + 1124) = v76 + *(float *)(a1 + 1124);
      }
      uint64_t v77 = (void *)[v17 objectForKeyedSubscript:*MEMORY[0x1E4F54E00]];
      if (v77)
      {
        [v77 floatValue];
        float v79 = v78;
        float v80 = *(float *)(a1 + 1132);
        if (v80 <= v79) {
          float v80 = v79;
        }
        *(float *)(a1 + 1132) = v80;
      }
      else
      {
        float v79 = 0.0;
      }
      uint64_t v81 = (void *)[v18 objectForKeyedSubscript:*MEMORY[0x1E4F53698]];
      if (v81)
      {
        uint64_t v82 = v81;
        float v83 = *(float *)(a1 + 1092);
        [v81 floatValue];
        if (v83 <= v84) {
          [v82 floatValue];
        }
        else {
          int v85 = *(_DWORD *)(a1 + 1092);
        }
        *(_DWORD *)(a1 + 1092) = v85;
      }
      uint64_t v86 = (void *)[v18 objectForKeyedSubscript:*MEMORY[0x1E4F536D0]];
      if (v86)
      {
        [v86 floatValue];
        *(float *)(a1 + 1104) = *(float *)(a1 + 1104) + (float)(v87 * v87);
      }
      uint64_t v88 = (void *)[v18 objectForKeyedSubscript:*MEMORY[0x1E4F536B8]];
      CMAttachmentBearerRef v2 = v137;
      if (v88)
      {
        [v88 floatValue];
        *(float *)(a1 + 1144) = v89 + *(float *)(a1 + 1144);
      }
      uint64_t v90 = (void *)[v18 objectForKeyedSubscript:*MEMORY[0x1E4F536A8]];
      if (v90)
      {
        [v90 floatValue];
        float v92 = *(float *)(a1 + 1156);
        if (v92 <= v91) {
          float v92 = v91;
        }
        *(float *)(a1 + 1156) = v92;
      }
      else
      {
        float v91 = 0.0;
      }
      float v93 = v79 + v91;
      if (*(float *)(a1 + 1172) > v93) {
        float v93 = *(float *)(a1 + 1172);
      }
      *(float *)(a1 + 1172) = v93;
      ++*(_DWORD *)(a1 + 1188);
    }
    if (v20)
    {
      *(unsigned char *)(a1 + 1196) = 1;
      uint64_t v138 = 0;
      uint64_t v139 = 0;
      [v20 getBytes:&v138 length:16];
      if (!(_WORD)v138)
      {
        *(_DWORD *)(a1 + 1232) += WORD1(v138);
        *(_DWORD *)(a1 + 1236) += WORD2(v138);
        *(_DWORD *)(a1 + 1240) += HIWORD(v138);
        *(_DWORD *)(a1 + 1244) += (unsigned __int16)v139;
        *(_DWORD *)(a1 + 1248) += WORD1(v139);
        *(_DWORD *)(a1 + 1256) += WORD2(v139);
        *(_DWORD *)(a1 + 1260) += HIWORD(v139);
      }
    }
    else if (v19)
    {
      *(unsigned char *)(a1 + 1196) = 0;
      LODWORD(v139) = 0;
      uint64_t v138 = 0;
      [v19 getBytes:&v138 length:12];
      *(_DWORD *)(a1 + 1232) += (unsigned __int16)v138;
      *(_DWORD *)(a1 + 1236) += WORD1(v138);
      *(_DWORD *)(a1 + 1240) += WORD2(v138);
      *(_DWORD *)(a1 + 1244) += HIWORD(v138);
      *(_DWORD *)(a1 + 1248) += (unsigned __int16)v139;
      *(_DWORD *)(a1 + 1252) += WORD1(v139);
    }
  }
  if (![*(id *)(a1 + 1264) objectForKeyedSubscript:v21]) {
    objc_msgSend(*(id *)(a1 + 1264), "setObject:forKeyedSubscript:", objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E4F54280]), v21);
  }
  if ([*(id *)(a1 + 1272) objectForKeyedSubscript:v21]) {
    goto LABEL_115;
  }
  uint64_t v94 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F53CD8]];
  uint64_t v95 = *(void **)(a1 + 1272);
  uint64_t v96 = v21;
LABEL_114:
  [v95 setObject:v94 forKeyedSubscript:v96];
LABEL_115:
  if (v17 && v18)
  {
    uint64_t v97 = (void *)[v17 objectForKeyedSubscript:*MEMORY[0x1E4F54E08]];
    float v98 = 0.0;
    float v99 = 0.0;
    if (v97)
    {
      [v97 floatValue];
      float v99 = v100;
      float v101 = *(float *)(a1 + 1136);
      if (v101 <= v99) {
        float v101 = v99;
      }
      *(float *)(a1 + 1136) = v101;
    }
    uint64_t v102 = (void *)[v18 objectForKeyedSubscript:*MEMORY[0x1E4F536B0]];
    if (v102)
    {
      [v102 floatValue];
      float v98 = v103;
      float v104 = *(float *)(a1 + 1164);
      if (v104 <= v98) {
        float v104 = v98;
      }
      *(float *)(a1 + 1164) = v104;
    }
    float v105 = *(float *)(a1 + 1176);
    if (v105 <= (float)(v99 + v98)) {
      float v105 = v99 + v98;
    }
    *(float *)(a1 + 1176) = v105;
  }
  float v106 = (void *)[v4 objectForKeyedSubscript:0x1EFA73A00];
  if (v106)
  {
    uint64_t v107 = (void *)[v106 objectForKeyedSubscript:0x1EFA73A20];
    if (v107)
    {
      uint64_t v108 = [v107 intValue];
      if (v108 != *(_DWORD *)(a1 + 1376))
      {
        uint64_t v109 = v108;
        uint64_t v110 = objc_msgSend(*(id *)(a1 + 1368), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", v108));
        if (v110) {
          uint64_t v111 = [v110 intValue] + 1;
        }
        else {
          uint64_t v111 = 1;
        }
        uint64_t v112 = [NSNumber numberWithInt:v111];
        objc_msgSend(*(id *)(a1 + 1368), "setObject:forKeyedSubscript:", v112, objc_msgSend(NSNumber, "numberWithInt:", v109));
        *(_DWORD *)(a1 + 1376) = v109;
      }
    }
  }
  if (!*(unsigned char *)(a1 + 1280)) {
    *(unsigned char *)(a1 + 1280) = objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E4F53CC0]), "BOOLValue");
  }
  if (*(void *)(a1 + 1384))
  {
    uint64_t v113 = (void *)CMGetAttachment(v2, @"LastPortType", 0);
    if (v113)
    {
      int v114 = v113;
      if (([v113 isEqualToString:v5] & 1) == 0)
      {
        if (![*(id *)(a1 + 1384) objectForKeyedSubscript:v114]) {
          [*(id *)(a1 + 1384) setObject:objc_alloc_init(MEMORY[0x1E4F1CA60]) forKeyedSubscript:v114];
        }
        int v115 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 1384), "objectForKeyedSubscript:", v114), "objectForKeyedSubscript:", v5), "intValue");
        objc_msgSend((id)objc_msgSend(*(id *)(a1 + 1384), "objectForKeyedSubscript:", v114), "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", (v115 + 1)), v5);
      }
    }
  }
  if ([*(id *)(a1 + 400) videoSTFEnabled]) {
    -[BWQuickTimeMovieFileSinkNode _collectVideoSTFAnalyticsFromSbuf:]((float *)a1, v2);
  }
  CFStringRef v116 = (const __CFString *)*MEMORY[0x1E4F55CC8];
  uint64_t v117 = (void *)CMGetAttachment(v2, (CFStringRef)*MEMORY[0x1E4F55CC8], 0);
  if (v117)
  {
    -[BWQuickTimeMovieFileSinkNode _collectVideoStabilizationAnalyticsFromDictionary:]((id *)a1, v117);
    CMRemoveAttachment(v2, v116);
  }
  if (!*(unsigned char *)(a1 + 1352))
  {
    uint64_t v118 = (void *)[v4 objectForKeyedSubscript:*MEMORY[0x1E4F53238]];
    if (v118)
    {
      uint64_t v119 = v118;
      uint64_t v120 = (void *)[v118 objectForKeyedSubscript:@"RearCameraAssembly"];
      if (v120) {
        objc_msgSend(*(id *)(a1 + 1056), "setCoreRepairStatusRearCameraAssembly:", objc_msgSend(v120, "intValue"));
      }
      v121 = (void *)[v119 objectForKeyedSubscript:@"FrontCameraAssembly"];
      if (v121) {
        objc_msgSend(*(id *)(a1 + 1056), "setCoreRepairStatusFrontCameraAssembly:", objc_msgSend(v121, "intValue"));
      }
    }
    uint64_t v122 = (void *)[v4 objectForKeyedSubscript:*MEMORY[0x1E4F53200]];
    if (v122)
    {
      int v123 = v122;
      uint64_t v124 = (void *)[v122 objectForKeyedSubscript:0x1EFA76E20];
      if (v124) {
        objc_msgSend(*(id *)(a1 + 1056), "setCalibrationValidationStatusCmCl:", objc_msgSend(v124, "intValue"));
      }
      uint64_t v125 = (void *)[v123 objectForKeyedSubscript:@"CmPMValidationStatus"];
      if (v125) {
        objc_msgSend(*(id *)(a1 + 1056), "setCalibrationValidationStatusCmPM:", objc_msgSend(v125, "intValue"));
      }
      v126 = (void *)[v123 objectForKeyedSubscript:@"FCClValidationStatus"];
      if (v126) {
        objc_msgSend(*(id *)(a1 + 1056), "setCalibrationValidationStatusFCCl:", objc_msgSend(v126, "intValue"));
      }
    }
    *(unsigned char *)(a1 + 1352) = 1;
  }
}

- (void)_forceEarlyTerminationWithErrorCode:(uint64_t)a1
{
  if (a1)
  {
    *(_DWORD *)(a1 + 584) = 0;
    -[BWQuickTimeMovieFileSinkNode _doEndRecordingAtTime:earlyTerminationErrCode:](a1, MEMORY[0x1E4F1F9F8], a2);
    [*(id *)(a1 + 1000) resetCurrentLoggingCounter];

    *(void *)(a1 + 400) = 0;
    *(void *)(a1 + 408) = 0;
    -[BWQuickTimeMovieFileSinkNode _clearProvidedTrackFormatDescriptions](a1);
  }
}

- (float)_collectVideoSTFAnalyticsFromSbuf:(float *)result
{
  if (result)
  {
    if (target)
    {
      CMAttachmentBearerRef v2 = result;
      ++*((_DWORD *)result + 349);
      double result = (float *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F55CF0], 0);
      if (result)
      {
        uint64_t v3 = result;
        if (!*((_DWORD *)v2 + 358)) {
          *((_DWORD *)v2 + 358) = objc_msgSend((id)objc_msgSend(result, "objectForKeyedSubscript:", *MEMORY[0x1E4F556E0]), "intValue");
        }
        if (*((_DWORD *)v2 + 350) == 3) {
          *((_DWORD *)v2 + 350) = objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E4F556E8]), "longValue");
        }
        double result = (float *)objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E4F55700]), "BOOLValue");
        if (result)
        {
          ++*((_DWORD *)v2 + 348);
          switch(objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E4F556F8]), "intValue"))
          {
            case 0u:
              ++*((_DWORD *)v2 + 359);
              break;
            case 1u:
              ++*((_DWORD *)v2 + 360);
              break;
            case 2u:
              ++*((_DWORD *)v2 + 361);
              break;
            case 3u:
              ++*((_DWORD *)v2 + 362);
              break;
            case 4u:
              ++*((_DWORD *)v2 + 363);
              break;
            default:
              break;
          }
          double result = (float *)objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E4F556F0]), "floatValue");
          if (v2[357] < v4) {
            v2[357] = v4;
          }
        }
      }
    }
  }
  return result;
}

- (id)_collectVideoStabilizationAnalyticsFromDictionary:(id *)result
{
  if (result)
  {
    if (a2)
    {
      uint64_t v3 = result;
      objc_msgSend(result[190], "setAverageLuxValue:", objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E4F55728]), "intValue"));
      objc_msgSend(v3[190], "setVideoType:", objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E4F55758]));
      double result = (id *)[a2 objectForKeyedSubscript:*MEMORY[0x1E4F55750]];
      if (result)
      {
        [v3[190] setSigmaHistogram:result];
        double result = (id *)[a2 objectForKeyedSubscript:*MEMORY[0x1E4F55730]];
        if (result)
        {
          float v4 = result;
          if ([result count])
          {
            uint64_t v5 = 0;
            uint64_t v6 = *MEMORY[0x1E4F55740];
            uint64_t v7 = *MEMORY[0x1E4F55748];
            uint64_t v8 = *MEMORY[0x1E4F55738];
            while (1)
            {
              double result = (id *)[v4 objectAtIndex:v5];
              if (!result) {
                break;
              }
              uint64_t v9 = result;
              int v10 = objc_msgSend((id)objc_msgSend(result, "objectForKeyedSubscript:", v6), "intValue");
              uint64_t v11 = objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", v7), "intValue");
              double result = (id *)[v9 objectForKeyedSubscript:v8];
              if (!result) {
                break;
              }
              [v3[190] setOverscanHistogram:off_1E5C257A8[v10] BinningFactor:v11 Histogram:result];
              if ([v4 count] <= (unint64_t)++v5) {
                goto LABEL_10;
              }
            }
          }
          else
          {
LABEL_10:
            double result = (id *)[v4 count];
            if (result) {
              *((unsigned char *)v3 + 1528) = 1;
            }
          }
        }
      }
    }
  }
  return result;
}

- (uint64_t)_driveStateMachineWithStartMarkerBuffer:(uint64_t)a3 forInputIndex:(void *)a4 inputStagingQueue:(int)a5 sampleBufferAlreadyAtHeadOfQueue:
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    switch(*(_DWORD *)(a1 + 584))
    {
      case 0:
        *(_DWORD *)(a1 + 584) = 3;
        [*(id *)(a1 + 1000) resetCurrentLoggingCounter];
        int v10 = (void *)CMGetAttachment(sbuf, @"RecordingSettings", 0);
        if (v10) {
          *(void *)(a1 + 408) = [v10 settingsID];
        }
        goto LABEL_13;
      case 1:
      case 2:
        -[BWQuickTimeMovieFileSinkNode _printBufferEvent:forNodeInputIndex:eventName:]((CMTime *)a1, sbuf);
        if (!a5) {
          return 0;
        }
        goto LABEL_6;
      case 3:
LABEL_13:
        *(void *)(a1 + 872) = 0;
        *(_DWORD *)(a1 + 1496) = *(unsigned char *)(a1 + 1492) == 0;
        *(_DWORD *)(a1 + 1500) = 0;
        *(_DWORD *)(a1 + 1504) = 0;
        *(_DWORD *)(a1 + 1508) = 0;
        if ((a5 & 1) == 0) {
          [a4 addObject:sbuf];
        }
        -[BWQuickTimeMovieFileSinkNode _printBufferEvent:forNodeInputIndex:eventName:]((CMTime *)a1, sbuf);
        uint64_t v11 = (void *)[(id)a1 recordingStatusDelegate];
        uint64_t v39 = 0;
        id v40 = 0;
        uint64_t v37 = 0;
        float v38 = 0;
        long long v36 = 0uLL;
        [(BWQuickTimeMovieFileSinkNode *)a1 _findStartMarkersWithMatchedStagedSetting:&v39 sensorVideoPort:&v38 captureDeviceType:&v36];
        uint64_t v9 = BYTE12(v36) & 1;
        float v12 = v39;
        id v13 = v40;
        float v14 = v38;
        if (BYTE12(v36))
        {
          long long v34 = v36;
          uint64_t v35 = v37;
          uint64_t v15 = -[BWQuickTimeMovieFileSinkNode _doStartRecordingAtTime:withSettings:sensorVideoPort:captureDeviceType:](a1, &v34, v40, v39, v38);
          if (v15)
          {
            uint64_t v16 = v15;
            *(_DWORD *)(a1 + 584) = 0;
            [*(id *)(a1 + 1000) resetCurrentLoggingCounter];
            if (v11)
            {
              objc_msgSend(v11, "fileWriter:writerPipelineIndex:stoppedRecordingSampleDataForSettingsID:", a1, *(void *)(a1 + 944), objc_msgSend(v13, "settingsID"));
              uint64_t v17 = *(void **)(a1 + 648);
              if (v17)
              {
                [v17 setMasterMovieURL:0];
                LOBYTE(v26) = 0;
                objc_msgSend(v11, "fileWriter:writerPipelineIndex:stoppedRecordingForSettings:withError:thumbnailSurface:irisMovieInfo:debugMetadataSidecarFileURL:recordingSucceeded:", a1, *(void *)(a1 + 944), objc_msgSend(*(id *)(a1 + 648), "settings"), v16, 0, *(void *)(a1 + 648), 0, v26);

                *(void *)(a1 + 648) = 0;
              }
              else if ([*(id *)(a1 + 656) count])
              {
                uint64_t v27 = v12;
                uint64_t v28 = v14;
                unsigned int v29 = v9;
                long long v32 = 0u;
                long long v33 = 0u;
                long long v30 = 0u;
                long long v31 = 0u;
                uint64_t v20 = *(void **)(a1 + 656);
                uint64_t v21 = [v20 countByEnumeratingWithState:&v30 objects:v41 count:16];
                if (v21)
                {
                  uint64_t v22 = v21;
                  uint64_t v23 = *(void *)v31;
                  do
                  {
                    for (uint64_t i = 0; i != v22; ++i)
                    {
                      if (*(void *)v31 != v23) {
                        objc_enumerationMutation(v20);
                      }
                      LOBYTE(v26) = 0;
                      objc_msgSend(v11, "fileWriter:writerPipelineIndex:stoppedRecordingForSettings:withError:thumbnailSurface:irisMovieInfo:debugMetadataSidecarFileURL:recordingSucceeded:", a1, *(void *)(a1 + 944), objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * i), "settings"), v16, 0, *(void *)(*((void *)&v30 + 1) + 8 * i), 0, v26);
                    }
                    uint64_t v22 = [v20 countByEnumeratingWithState:&v30 objects:v41 count:16];
                  }
                  while (v22);
                }
                [*(id *)(a1 + 656) removeAllObjects];
                uint64_t v9 = v29;
                float v12 = v27;
                float v14 = v28;
              }
              else
              {
                LOBYTE(v26) = 0;
                [v11 fileWriter:a1 writerPipelineIndex:*(void *)(a1 + 944) stoppedRecordingForSettings:v13 withError:v16 thumbnailSurface:0 irisMovieInfo:0 debugMetadataSidecarFileURL:0 recordingSucceeded:v26];
              }
            }
            *(void *)(a1 + 408) = 0;
          }
          else
          {
            *(_DWORD *)(a1 + 584) = 1;
            [*(id *)(a1 + 864) reset];
            if (v11)
            {
              uint64_t v18 = *(void *)(a1 + 400);
              uint64_t v19 = *(void *)(a1 + 944);
              long long v34 = v36;
              uint64_t v35 = v37;
              [v11 fileWriter:a1 startedRecordingForSettings:v18 writerPipelineIndex:v19 startPTS:&v34];
            }
          }
        }

        return v9;
      case 4:
      case 5:
      case 6:
        if (a5)
        {
          -[BWQuickTimeMovieFileSinkNode _printBufferEvent:forNodeInputIndex:eventName:]((CMTime *)a1, sbuf);
LABEL_6:
          [a4 removeObjectAtIndex:0];
        }
        else
        {
          if ([a4 count]) {
            [a4 addObject:sbuf];
          }
          -[BWQuickTimeMovieFileSinkNode _printBufferEvent:forNodeInputIndex:eventName:]((CMTime *)a1, sbuf);
        }
        return 0;
      default:
        return 0;
    }
  }
  return 0;
}

- (uint64_t)_driveStateMachineWithStopOrFlushMarkerBuffer:(const void *)a3 requiredAction:(uint64_t)a4 forInputIndex:(void *)a5 inputStagingQueue:(int)a6 sampleBufferAlreadyAtHeadOfQueue:
{
  if (a1)
  {
    uint64_t v11 = (void *)CMGetAttachment(target, @"FileWriterStopErrorCode", 0);
    if (v11)
    {
      uint64_t v12 = [v11 intValue];
      if (v12 == -16418)
      {
        if (!*(_DWORD *)(a1 + 584))
        {
          *(_DWORD *)(a1 + 584) = 4;
          id v13 = (void *)CMGetAttachment(target, @"RecordingSettings", 0);
          *(void *)(a1 + 400) = v13;
          id v14 = v13;
        }
        char v15 = 1;
        uint64_t v16 = 4294950878;
LABEL_10:
        switch(*(_DWORD *)(a1 + 584))
        {
          case 0:
          case 2:
            -[BWQuickTimeMovieFileSinkNode _printBufferEvent:forNodeInputIndex:eventName:]((CMTime *)a1, (CMSampleBufferRef)target);
            if (!a6) {
              return 0;
            }
            goto LABEL_14;
          case 1:
            *(_DWORD *)(a1 + 584) = 4;
            goto LABEL_21;
          case 3:
          case 5:
          case 6:
            if (a6)
            {
              -[BWQuickTimeMovieFileSinkNode _printBufferEvent:forNodeInputIndex:eventName:]((CMTime *)a1, (CMSampleBufferRef)target);
LABEL_14:
              [a5 removeObjectAtIndex:0];
            }
            else
            {
              if ([a5 count]) {
                [a5 addObject:target];
              }
              -[BWQuickTimeMovieFileSinkNode _printBufferEvent:forNodeInputIndex:eventName:]((CMTime *)a1, (CMSampleBufferRef)target);
            }
            return 0;
          case 4:
LABEL_21:
            if (a6)
            {
              uint64_t v19 = @"reusing already staged %@ marker";
            }
            else
            {
              [a5 addObject:target];
              uint64_t v19 = @"staging %@ marker";
            }
            objc_msgSend(NSString, "stringWithFormat:", v19, a3);
            -[BWQuickTimeMovieFileSinkNode _printBufferEvent:forNodeInputIndex:eventName:]((CMTime *)a1, (CMSampleBufferRef)target);
            memset(&v25, 0, sizeof(v25));
            [(BWQuickTimeMovieFileSinkNode *)a1 _findMarkers:(uint64_t)&v25];
            uint64_t v17 = v25.flags & 1;
            if (v25.flags)
            {
              *(_DWORD *)(a1 + 584) = 0;
              [*(id *)(a1 + 1000) resetCurrentLoggingCounter];
              if (v15)
              {
                uint64_t v20 = (void *)[(id)a1 recordingStatusDelegate];
                if (v20)
                {
                  uint64_t v21 = v20;
                  objc_msgSend(v20, "fileWriter:writerPipelineIndex:stoppedRecordingSampleDataForSettingsID:", a1, *(void *)(a1 + 944), objc_msgSend(*(id *)(a1 + 400), "settingsID"));
                  LOBYTE(v23) = 0;
                  [v21 fileWriter:a1 writerPipelineIndex:*(void *)(a1 + 944) stoppedRecordingForSettings:*(void *)(a1 + 400) withError:4294950878 thumbnailSurface:0 irisMovieInfo:0 debugMetadataSidecarFileURL:0 recordingSucceeded:v23];
                }
                uint64_t v22 = *(const void **)(a1 + 576);
                if (v22)
                {
                  CFRelease(v22);
                  *(void *)(a1 + 576) = 0;
                }
              }
              else
              {
                if (CFEqual(a3, @"Flush")) {
                  CMTime v25 = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F8];
                }
                CMTime v24 = v25;
                -[BWQuickTimeMovieFileSinkNode _doEndRecordingAtTime:earlyTerminationErrCode:](a1, &v24, v16);
              }

              *(void *)(a1 + 400) = 0;
              *(void *)(a1 + 408) = 0;
              -[BWQuickTimeMovieFileSinkNode _clearProvidedTrackFormatDescriptions](a1);
            }
            return v17;
          default:
            return 0;
        }
      }
      uint64_t v16 = v12;
    }
    else
    {
      uint64_t v16 = 0;
    }
    char v15 = 0;
    goto LABEL_10;
  }
  return 0;
}

- (uint64_t)_driveStateMachineWithPauseMarkerBuffer:(uint64_t)a3 forInputIndex:(void *)a4 inputStagingQueue:(int)a5 sampleBufferAlreadyAtHeadOfQueue:
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  switch(*(_DWORD *)(a1 + 584))
  {
    case 0:
    case 2:
      -[BWQuickTimeMovieFileSinkNode _printBufferEvent:forNodeInputIndex:eventName:]((CMTime *)a1, sbuf);
      if (!a5) {
        return 0;
      }
      goto LABEL_6;
    case 1:
      *(_DWORD *)(a1 + 584) = 5;
      ++*(_DWORD *)(a1 + 380);
      goto LABEL_13;
    case 3:
    case 4:
    case 6:
      if (a5)
      {
        -[BWQuickTimeMovieFileSinkNode _printBufferEvent:forNodeInputIndex:eventName:]((CMTime *)a1, sbuf);
LABEL_6:
        [a4 removeObjectAtIndex:0];
      }
      else
      {
        if ([a4 count]) {
          [a4 addObject:sbuf];
        }
        -[BWQuickTimeMovieFileSinkNode _printBufferEvent:forNodeInputIndex:eventName:]((CMTime *)a1, sbuf);
      }
      return 0;
    case 5:
LABEL_13:
      if ((a5 & 1) == 0) {
        [a4 addObject:sbuf];
      }
      -[BWQuickTimeMovieFileSinkNode _printBufferEvent:forNodeInputIndex:eventName:]((CMTime *)a1, sbuf);
      memset(&v36, 0, sizeof(v36));
      [(BWQuickTimeMovieFileSinkNode *)a1 _findMarkers:(uint64_t)&v36];
      uint64_t v10 = v36.flags & 1;
      if ((v36.flags & 1) == 0) {
        return v10;
      }
      *(_DWORD *)(a1 + 584) = 2;
      if (*(unsigned char *)(a1 + 1596))
      {
        memset(&v37, 0, sizeof(v37));
        CMTime lhs = v36;
        CMTime rhs = *(CMTime *)(a1 + 1584);
        CMTimeSubtract(&v37, &lhs, &rhs);
        CMTime lhs = *(CMTime *)(a1 + 1584);
        CMTime rhs = v37;
        -[BWQuickTimeMovieFileSinkNode _writeMovieSegmentMetadataForSegmentStartPTS:segmentDuration:](a1, (long long *)&lhs.value, (long long *)&rhs.value);
        uint64_t v12 = MEMORY[0x1E4F1F9F8];
        *(_OWORD *)(a1 + 1584) = *MEMORY[0x1E4F1F9F8];
        *(void *)(a1 + 1600) = *(void *)(v12 + 16);
      }
      uint64_t v13 = *(void *)(a1 + 744);
      if (!v13) {
        goto LABEL_24;
      }
      unint64_t v14 = *(void *)(a1 + 728);
      if (v14 >= v14 + v13) {
        goto LABEL_24;
      }
      uint64_t v15 = 24 * v14 + 12;
      break;
    default:
      return 0;
  }
  while (!*(unsigned char *)(*(void *)(a1 + 616) + v14) || (~*(_DWORD *)(*(void *)(a1 + 448) + v15) & 5) != 0)
  {
    ++v14;
    v15 += 24;
    if (!--v13)
    {
LABEL_24:
      if (dword_1EB4C5090)
      {
        LODWORD(rhs.value) = 0;
        os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        unsigned int value = rhs.value;
        if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT)) {
          unsigned int v18 = value;
        }
        else {
          unsigned int v18 = value & 0xFFFFFFFE;
        }
        if (v18)
        {
          LODWORD(lhs.value) = 136315138;
          *(CMTimeValue *)((char *)&lhs.value + 4) = (CMTimeValue)"-[BWQuickTimeMovieFileSinkNode _driveStateMachineWithP"
                                                                  "auseMarkerBuffer:forInputIndex:inputStagingQueue:sampl"
                                                                  "eBufferAlreadyAtHeadOfQueue:]";
          LODWORD(v34) = 12;
          p_CMTime lhs = &lhs;
          _os_log_send_and_compose_impl();
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      uint64_t v19 = *(void *)(a1 + 592);
      uint64_t v20 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v20) {
        uint64_t v21 = v20;
      }
      else {
        uint64_t v21 = 0;
      }
      uint64_t v22 = *(uint64_t (**)(uint64_t, void))(v21 + 40);
      if (v22)
      {
        int v23 = v22(v19, 0);
        if (!v23)
        {
          uint64_t v24 = *(void *)(a1 + 592);
          uint64_t v25 = *(void *)(CMBaseObjectGetVTable() + 16);
          if (v25) {
            uint64_t v26 = v25;
          }
          else {
            uint64_t v26 = 0;
          }
          uint64_t v27 = *(uint64_t (**)(uint64_t, void))(v26 + 48);
          if (v27)
          {
            int v28 = v27(v24, 0);
            if (!v28) {
              goto LABEL_47;
            }
          }
          else
          {
            int v28 = -12782;
          }
          uint64_t v34 = v5;
          LODWORD(p_lhs) = v28;
          goto LABEL_46;
        }
      }
      else
      {
        int v23 = -12782;
      }
      uint64_t v34 = v5;
      LODWORD(p_lhs) = v23;
LABEL_46:
      FigDebugAssert3();
      goto LABEL_47;
    }
  }
  if (dword_1EB4C5090)
  {
    LODWORD(rhs.value) = 0;
    long long v30 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v31 = rhs.value;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT)) {
      unsigned int v32 = v31;
    }
    else {
      unsigned int v32 = v31 & 0xFFFFFFFE;
    }
    if (v32)
    {
      LODWORD(lhs.value) = 136315394;
      *(CMTimeValue *)((char *)&lhs.value + 4) = (CMTimeValue)"-[BWQuickTimeMovieFileSinkNode _driveStateMachineWithPause"
                                                              "MarkerBuffer:forInputIndex:inputStagingQueue:sampleBufferA"
                                                              "lreadyAtHeadOfQueue:]";
      LOWORD(lhs.flags) = 1024;
      *(CMTimeFlags *)((char *)&lhs.flags + 2) = v14;
      LODWORD(v34) = 18;
      p_CMTime lhs = &lhs;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
LABEL_47:
  unsigned int v29 = objc_msgSend((id)a1, "recordingStatusDelegate", p_lhs, v34);
  if (v29) {
    objc_msgSend(v29, "fileWriter:pausedRecordingForSettingsID:", a1, objc_msgSend(*(id *)(a1 + 400), "settingsID"));
  }
  return v10;
}

- (uint64_t)_driveStateMachineWithResumeMarkerBuffer:(uint64_t)a3 forInputIndex:(void *)a4 inputStagingQueue:(int)a5 sampleBufferAlreadyAtHeadOfQueue:
{
  if (a1)
  {
    switch(*(_DWORD *)(a1 + 584))
    {
      case 0:
      case 1:
        -[BWQuickTimeMovieFileSinkNode _printBufferEvent:forNodeInputIndex:eventName:]((CMTime *)a1, sbuf);
        if (!a5) {
          return 0;
        }
        goto LABEL_6;
      case 2:
        *(_DWORD *)(a1 + 584) = 6;
        goto LABEL_13;
      case 3:
      case 4:
      case 5:
        if (a5)
        {
          -[BWQuickTimeMovieFileSinkNode _printBufferEvent:forNodeInputIndex:eventName:]((CMTime *)a1, sbuf);
LABEL_6:
          [a4 removeObjectAtIndex:0];
        }
        else
        {
          if ([a4 count]) {
            [a4 addObject:sbuf];
          }
          -[BWQuickTimeMovieFileSinkNode _printBufferEvent:forNodeInputIndex:eventName:]((CMTime *)a1, sbuf);
        }
        return 0;
      case 6:
LABEL_13:
        if ((a5 & 1) == 0) {
          [a4 addObject:sbuf];
        }
        -[BWQuickTimeMovieFileSinkNode _printBufferEvent:forNodeInputIndex:eventName:]((CMTime *)a1, sbuf);
        long long v13 = 0uLL;
        uint64_t v14 = 0;
        [(BWQuickTimeMovieFileSinkNode *)a1 _findMarkers:(uint64_t)&v13];
        uint64_t v9 = BYTE12(v13) & 1;
        if (BYTE12(v13))
        {
          uint64_t v11 = (void *)CMGetAttachment(sbuf, @"FileWriterStopErrorCode", 0);
          if (!v11 || ![v11 intValue])
          {
            *(_OWORD *)(a1 + 1584) = v13;
            *(void *)(a1 + 1600) = v14;
          }
          *(_DWORD *)(a1 + 584) = 1;
          uint64_t v12 = (void *)[(id)a1 recordingStatusDelegate];
          if (v12) {
            objc_msgSend(v12, "fileWriter:resumedRecordingForSettingsID:", a1, objc_msgSend(*(id *)(a1 + 400), "settingsID"));
          }
        }
        return v9;
      default:
        return 0;
    }
  }
  return 0;
}

- (void)_driveStateMachineWithMediaBuffer:(uint64_t)a3 forInputIndex:(void *)a4 inputStagingQueue:(char)a5 sampleBufferAlreadyAtHeadOfQueue:
{
  if (a1)
  {
    if (a5)
    {
      -[BWQuickTimeMovieFileSinkNode _printBufferEvent:forNodeInputIndex:eventName:](a1, sbuf);
      [a4 removeObjectAtIndex:0];
    }
    else
    {
      switch(a1[24].timescale)
      {
        case 0:
        case 2:
          goto LABEL_11;
        case 1:
          goto LABEL_16;
        case 3:
        case 6:
          if (![a4 count]) {
            goto LABEL_11;
          }
          goto LABEL_10;
        case 4:
        case 5:
          if ([a4 count])
          {
LABEL_10:
            [a4 addObject:sbuf];
LABEL_11:
            -[BWQuickTimeMovieFileSinkNode _printBufferEvent:forNodeInputIndex:eventName:](a1, sbuf);
          }
          else
          {
            -[BWQuickTimeMovieFileSinkNode _printBufferEvent:forNodeInputIndex:eventName:](a1, sbuf);
LABEL_16:
            -[BWQuickTimeMovieFileSinkNode _writeBuffer:forInputIndex:]((uint64_t)a1, sbuf, a3);
          }
          break;
        default:
          return;
      }
    }
  }
}

uint64_t __59__BWQuickTimeMovieFileSinkNode__writeIrisRefMovieWithInfo___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3 = a3;
  char v6 = a3 == 0;
  if (a2)
  {
    if (a3)
    {
      char v6 = 0;
    }
    else
    {
      uint64_t v3 = -[BWQuickTimeMovieFileSinkNode _verifyMovieTiming:](*(void *)(a1 + 32), a2);
      char v6 = v3 == 0;
    }
    -[BWQuickTimeMovieFileSinkNode _moveOrDeleteTemporaryIrisMovie:recordingSucceeded:](*(void *)(a1 + 32), a2, v6);
    if (!*(unsigned char *)(*(void *)(a1 + 32) + 832))
    {
      if ([a2 isFinalReferenceMovie]) {
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "removeItemAtURL:error:", objc_msgSend(a2, "masterMovieURL"), 0);
      }
    }
  }
  uint64_t v7 = (void *)[*(id *)(a1 + 32) recordingStatusDelegate];
  if (v7)
  {
    LOBYTE(v10) = v6;
    objc_msgSend(v7, "fileWriter:writerPipelineIndex:stoppedRecordingForSettings:withError:thumbnailSurface:irisMovieInfo:debugMetadataSidecarFileURL:recordingSucceeded:", *(void *)(a1 + 32), *(void *)(*(void *)(a1 + 32) + 944), objc_msgSend(a2, "settings"), v3, 0, a2, 0, v10);
  }
  uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) numberOfPendingReferenceMovies];
  if (!result)
  {
    pthread_mutex_lock(*(pthread_mutex_t **)(*(void *)(a1 + 32) + 824));
    [*(id *)(*(void *)(a1 + 32) + 672) removeObjectIdenticalTo:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
    if (dword_1EB4C5090)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    return pthread_mutex_unlock(*(pthread_mutex_t **)(*(void *)(a1 + 32) + 824));
  }
  return result;
}

- (BOOL)cinematicVideoEnabled
{
  return self->_cinematicVideoEnabled;
}

- (BOOL)stereoVideoCaptureEnabled
{
  return self->_stereoVideoCaptureEnabled;
}

- (NSArray)nonCriticalAudioVideoTrackInputIndices
{
  return self->_nonCriticalAudioVideoTrackInputIndices;
}

- (NSArray)trackReferenceListForAudioRemixInputs
{
  return self->_trackReferenceListForAudioRemixInputs;
}

- (void)setupRingBufferForStabilizedTrajectoryHomographies:.cold.1()
{
  __assert_rtn("-[BWQuickTimeMovieFileSinkNode setupRingBufferForStabilizedTrajectoryHomographies:]", "BWQuickTimeMovieFileSinkNode.m", 827, "_irisStabilizedTrajectoryHomographyRingBuffer == nil");
}

- (void)_doEndRecordingAtTime:earlyTerminationErrCode:.cold.1()
{
}

@end