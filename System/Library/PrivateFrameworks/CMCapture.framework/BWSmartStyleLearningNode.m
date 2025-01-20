@interface BWSmartStyleLearningNode
+ (void)initialize;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_getSampleBufferPresentationTimeStamp:(SEL)a3;
- (BOOL)disableWaitForCoefficientsOnFirstFrame;
- (BOOL)intermediateResourceTrackingAllowedForAttachedMediaKey:(id)a3;
- (BOOL)subjectRelightingEnabled;
- (BWSmartStyleLearningNode)initWithOutputs:(unint64_t)a3 masksRefinerEnabled:(BOOL)a4 propagateMasks:(BOOL)a5;
- (FigCaptureSmartStyle)smartStyle;
- (NSDictionary)cameraInfoByPortType;
- (id)_blitMasksToOutputPools:(id)a3 unstyledSampleBuffer:(opaqueCMSampleBuffer *)a4 currentPTS:(id *)a5;
- (id)_runInferences:(opaqueCMSampleBuffer *)a3 unstyledSampleBuffer:(opaqueCMSampleBuffer *)a4 withMasks:(id)a5 currentPTS:(id *)a6;
- (id)_undistortMasks:(id)a3 unstyledSampleBuffer:(opaqueCMSampleBuffer *)a4 currentPTS:(id *)a5 useIntermediatePools:(BOOL)a6;
- (id)inputInferenceVideoFormatForAttachedMediaKey:(id)a3;
- (id)inputVideoFormatForAttachedMediaKey:(id)a3;
- (id)nodeSubType;
- (id)nodeType;
- (id)outputVideoFormatForAttachedMediaKey:(id)a3;
- (id)preparedOutputPixelBufferPoolForAttachedMediaKey:(id)a3 format:(id)a4;
- (int)_createCoefficientsFromSampleBuffer:(opaqueCMSampleBuffer *)a3 to:(opaqueCMSampleBuffer *)a4;
- (int)_createIdentityCoefficientsFromSampleBuffer:(opaqueCMSampleBuffer *)a3 to:(opaqueCMSampleBuffer *)a4;
- (int)_createSmartStyleContainerFromSampleBuffer:(opaqueCMSampleBuffer *)a3 unstyledThumbnailSampleBuffer:(opaqueCMSampleBuffer *)a4 linearThumbnailSampleBuffer:(opaqueCMSampleBuffer *)a5 to:(opaqueCMSampleBuffer *)a6;
- (int)_extractANSTMasks:(opaqueCMSampleBuffer *)a3 forPTS:(id *)a4;
- (int)_findCorrespondingSmartStyleContainerWithMasks:(id)a3 outputSmartStyleContainer:(opaqueCMSampleBuffer *)a4;
- (int)_getContainerAssetsFromSampleBuffer:(opaqueCMSampleBuffer *)a3 outputUnstyledThumbnailSampleBuffer:(opaqueCMSampleBuffer *)a4 outputLinearThumbnailSampleBuffer:(opaqueCMSampleBuffer *)a5;
- (int)_initVMRefinerInference;
- (int)_loadAndConfigureSmartStyleBundle;
- (int)_runFalsePositiveRejectionOnPixelBuffer:(__CVBuffer *)a3 unrefinedPixelBuffer:(__CVBuffer *)a4;
- (int)processMaskSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (int)processVideoSampleBuffer:(opaqueCMSampleBuffer *)a3 frameEmitted:(BOOL *)a4;
- (opaqueCMSampleBuffer)_unpackSbufFromPrimaryCameraStream:(opaqueCMSampleBuffer *)a3;
- (void)_asynchronouslyDecrementLearnCount;
- (void)_asynchronouslyDecrementRenderCount;
- (void)_asynchronouslyLearnWithContainer:(opaqueCMSampleBuffer *)a3 inputUnstyledSampleBuffer:(opaqueCMSampleBuffer *)a4 withUnrefinedMasks:(id)a5 withStats:(id)a6 withStatsExtended:(id)a7 styleToLearn:(id)a8 shouldBypass:(BOOL)a9;
- (void)_asynchronouslyRenderSampleBuffer:(opaqueCMSampleBuffer *)a3 outputLinearThumbnailSampleBuffer:(opaqueCMSampleBuffer *)a4 outputUnstyledThumbnailSampleBuffer:(opaqueCMSampleBuffer *)a5 synchronizingEvent:(id)a6;
- (void)_asynchronouslySignalEvent:(id)a3;
- (void)_releaseResources;
- (void)_updateCurrentSmartStyleMetadata:(id)a3 onSbuf:(opaqueCMSampleBuffer *)a4;
- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5;
- (void)dealloc;
- (void)didReachEndOfDataForInput:(id)a3;
- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5;
- (void)prepareForCurrentConfigurationToBecomeLive;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
- (void)semanticStyleSceneTypeDidChange:(int)a3;
- (void)setCameraInfoByPortType:(id)a3;
- (void)setDisableWaitForCoefficientsOnFirstFrame:(BOOL)a3;
- (void)setSmartStyle:(id)a3;
- (void)setSubjectRelightingEnabled:(BOOL)a3;
@end

@implementation BWSmartStyleLearningNode

+ (void)initialize
{
}

- (BWSmartStyleLearningNode)initWithOutputs:(unint64_t)a3 masksRefinerEnabled:(BOOL)a4 propagateMasks:(BOOL)a5
{
  char v7 = a3;
  v53[4] = *MEMORY[0x1E4F143B8];
  v51.receiver = self;
  v51.super_class = (Class)BWSmartStyleLearningNode;
  v8 = [(BWNode *)&v51 init];
  if (v8)
  {
    v9 = (void *)[MEMORY[0x1E4F55EF8] configurationForVariant:0];
    v10 = (void *)[MEMORY[0x1E4F55EF8] tuningParametersForVariant:0];
    int v11 = [v10 learningRate];
    if (v11 <= 2) {
      int v12 = 2;
    }
    else {
      int v12 = v11;
    }
    LODWORD(v8->_lastLearnedPortType) = v12;
    HIDWORD(v8->_lastLearnedPortType) = [v9 learningRateFramesPerSecond];
    v8->_learningRate = [v9 learningRateMaxFramesPerSecond];
    [v10 statsUpdateDeltaTimeThreshold];
    v8->_learningFramesPerSecondUnit = v13;
    [v10 anstMasksMatchingTimeInSecondsThreshold];
    v8->_learningMaxFramesPerSecond = v14;
    BYTE4(v8->_previousPTS.epoch) = v7 & 1;
    BYTE5(v8->_previousPTS.epoch) = (v7 & 2) != 0;
    BYTE6(v8->_previousPTS.epoch) = a4;
    HIBYTE(v8->_previousPTS.epoch) = a4;
    v8->_generateCoefficients = 1;
    v8->_propagateMasks = a5;
    v15 = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v8];
    [(BWNodeInput *)v15 setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
    [(BWNodeInput *)v15 setPassthroughMode:1];
    [(BWNodeInput *)v15 setIndefinitelyHeldBufferCount:3];
    if ((int)FigCapturePlatformIdentifier() >= 11)
    {
      v16 = objc_alloc_init(BWNodeInputMediaConfiguration);
      [(BWNodeInputMediaConfiguration *)v16 setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
      [(BWNodeInputMediaConfiguration *)v16 setPassthroughMode:1];
      [(BWNodeInputMediaConfiguration *)v16 setIndefinitelyHeldBufferCount:3];
      [(BWNodeInput *)v15 setMediaConfiguration:v16 forAttachedMediaKey:0x1EFA68BE0];
    }
    if ((int)FigCapturePlatformIdentifier() >= 11)
    {
      v17 = objc_alloc_init(BWNodeInputMediaConfiguration);
      [(BWNodeInputMediaConfiguration *)v17 setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
      [(BWNodeInputMediaConfiguration *)v17 setPassthroughMode:0];
      [(BWNodeInputMediaConfiguration *)v17 setIndefinitelyHeldBufferCount:3];
      [(BWNodeInput *)v15 setMediaConfiguration:v17 forAttachedMediaKey:0x1EFA74960];
    }
    [(BWNode *)v8 addInput:v15];
    v18 = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v8];
    [(BWNodeInput *)v18 setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
    [(BWNodeInput *)v18 setPassthroughMode:0];
    v53[0] = @"HumanFullBodiesMask";
    v53[1] = @"HumanSkinsMask";
    v53[2] = @"HumanHairMask";
    v53[3] = 0x1EFA74700;
    v19 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:4];
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v47 objects:v52 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v48;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v48 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void *)(*((void *)&v47 + 1) + 8 * i);
          v25 = objc_alloc_init(BWNodeInputMediaConfiguration);
          [(BWNodeInputMediaConfiguration *)v25 setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
          [(BWNodeInputMediaConfiguration *)v25 setPassthroughMode:0];
          [(BWNodeInput *)v18 setIndefinitelyHeldBufferCount:3];
          [(BWNodeInput *)v18 setMediaConfiguration:v25 forAttachedMediaKey:v24];
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v47 objects:v52 count:16];
      }
      while (v21);
    }
    [(BWNode *)v8 addInput:v18];
    v26 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v8];
    [(BWNodeOutput *)v26 setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
    [(BWNodeOutput *)v26 setPassthroughMode:1];
    [(BWNode *)v8 addOutput:v26];
    if ([(BWSmartStyleLearningNode *)v8 _loadAndConfigureSmartStyleBundle]) {
      goto LABEL_30;
    }
    v27 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v8->_inputStyleContainerSampleBufferQueue = v27;
    if (!v27) {
      goto LABEL_30;
    }
    v28 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v8->_inputMasksSampleBufferQueue = v28;
    if (!v28) {
      goto LABEL_30;
    }
    v8->_styleUpdateLock._os_unfair_lock_opaque = 0;
    v8->_inputMasksSampleBufferQueueLock._os_unfair_lock_opaque = 0;
    v8->_inputStyleContainerSampleBufferQueueLock._os_unfair_lock_opaque = 0;
    LODWORD(v8->_workQueue) = 0;
    LODWORD(v8->_lastLearnedROI.size.height) = 0;
    v8->_statsUpdateDeltaTimeThreshold = 0.0;
    *(void *)&v8->_timeInSecondsUntilNextStatsUpdate = FigDispatchQueueCreateWithPriority();
    uint64_t v29 = FigDispatchQueueCreateWithPriority();
    v8->_refinerPrepareQueue = (OS_dispatch_queue *)v29;
    if (!v29) {
      goto LABEL_30;
    }
    HIDWORD(v8->_workQueue) = 0;
    v8->_workQueueLock._os_unfair_lock_opaque = 0;
    if (BYTE6(v8->_previousPTS.epoch))
    {
      if ([(BWSmartStyleLearningNode *)v8 _initVMRefinerInference]) {
        goto LABEL_30;
      }
    }
    v30 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v8->_refinedVideoFormatByAttachedMediaKey = v30;
    if (!v30) {
      goto LABEL_30;
    }
    v31 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v8->_processorVideoFormatsByAttachedMediaKeys = v31;
    if (!v31) {
      goto LABEL_30;
    }
    v32 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v8->_processorPixelBufferPoolsByAttachedMediaKeys = v32;
    if (!v32) {
      goto LABEL_30;
    }
    v33 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v8->_intermediateVideoFormatsByAttachedMediaKeys = v33;
    if (!v33) {
      goto LABEL_30;
    }
    id v34 = +[FigCaptureSmartStyle identityStyle];
    if (!v34) {
      goto LABEL_30;
    }
    v35 = v34;
    uint64_t v36 = [v34 cast];
    [v35 intensity];
    int v38 = v37;
    [v35 toneBias];
    int v40 = v39;
    [v35 colorBias];
    LODWORD(v42) = v41;
    LODWORD(v43) = v38;
    LODWORD(v44) = v40;
    v45 = +[FigCaptureSmartStyle styleWithCast:v36 intensity:v43 toneBias:v44 colorBias:v42];
    *(void *)&v8->_bypassStyleEngineForStandardStyle = v45;
    if (v45)
    {
      v8->_semanticStyleSceneLock._os_unfair_lock_opaque = 0;
      v8->_semanticStyleSceneType = 0;
      LOBYTE(v8->_mostRecentLearnedSkyMaskSampleBuffer) = 1;
    }
    else
    {
LABEL_30:
      fig_log_get_emitter();
      FigDebugAssert3();
      return 0;
    }
  }
  return v8;
}

- (void)setSubjectRelightingEnabled:(BOOL)a3
{
  BYTE2(self->_mostRecentLearnedSkyMaskSampleBuffer) = a3;
}

- (void)setDisableWaitForCoefficientsOnFirstFrame:(BOOL)a3
{
  BYTE1(self->_mostRecentLearnedSkyMaskSampleBuffer) = a3;
}

- (void)setSmartStyle:(id)a3
{
  if (a3 && ([a3 isEqual:*(void *)&self->_bypassStyleEngineForStandardStyle] & 1) == 0)
  {
    uint64_t v5 = [a3 cast];
    [a3 intensity];
    int v7 = v6;
    [a3 toneBias];
    int v9 = v8;
    [a3 colorBias];
    LODWORD(v11) = v10;
    LODWORD(v12) = v7;
    LODWORD(v13) = v9;
    unsigned int v14 = +[FigCaptureSmartStyle styleWithCast:v5 intensity:v12 toneBias:v13 colorBias:v11];
    if (!v14) {
      goto LABEL_8;
    }
    v15 = v14;
    os_unfair_lock_lock(&self->_styleUpdateLock);

    uint64_t v16 = [(FigCaptureSmartStyle *)v15 cast];
    [(FigCaptureSmartStyle *)v15 intensity];
    int v18 = v17;
    [(FigCaptureSmartStyle *)v15 toneBias];
    int v20 = v19;
    [(FigCaptureSmartStyle *)v15 colorBias];
    LODWORD(v22) = v21;
    LODWORD(v23) = v18;
    LODWORD(v24) = v20;
    *(void *)&self->_bypassStyleEngineForStandardStyle = +[FigCaptureSmartStyle styleWithCast:v16 intensity:v23 toneBias:v24 colorBias:v22];
    os_unfair_lock_unlock(&self->_styleUpdateLock);
    if (*(void *)&self->_bypassStyleEngineForStandardStyle)
    {
      os_unfair_lock_lock((os_unfair_lock_t)&self->_statsUpdateDeltaTimeThreshold);
      LODWORD(self->_anstMasksMatchingTimeInSecondsThreshold) = self->_timingLock._os_unfair_lock_opaque;
      os_unfair_lock_unlock((os_unfair_lock_t)&self->_statsUpdateDeltaTimeThreshold);
    }
    else
    {
LABEL_8:
      fig_log_get_emitter();
      FigDebugAssert3();
    }
  }
}

- (void)setCameraInfoByPortType:(id)a3
{
  intermediatePixelBufferPoolsByAttachedMediaKeys = self->_intermediatePixelBufferPoolsByAttachedMediaKeys;
  if (intermediatePixelBufferPoolsByAttachedMediaKeys) {

  }
  self->_intermediatePixelBufferPoolsByAttachedMediaKeys = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:a3];
}

- (NSDictionary)cameraInfoByPortType
{
  return &self->_intermediatePixelBufferPoolsByAttachedMediaKeys->super;
}

- (void)_releaseResources
{
  self->_smartStyleProcessor = 0;
  self->_inferenceScheduler = 0;

  self->_metalContext = 0;
}

- (void)dealloc
{
  dispatch_sync(*(dispatch_queue_t *)&self->_timeInSecondsUntilNextStatsUpdate, &__block_literal_global_44);
  dispatch_sync((dispatch_queue_t)self->_refinerPrepareQueue, &__block_literal_global_32);
  [(BWSmartStyleLearningNode *)self _releaseResources];

  initialCoefficientsPixelBuffer = self->_initialCoefficientsPixelBuffer;
  if (initialCoefficientsPixelBuffer) {
    CFRelease(initialCoefficientsPixelBuffer);
  }
  identityCoefficientsPixelBuffer = self->_identityCoefficientsPixelBuffer;
  if (identityCoefficientsPixelBuffer) {
    CFRelease(identityCoefficientsPixelBuffer);
  }

  learnedCoefficientsSampleBuffer = self->_learnedCoefficientsSampleBuffer;
  if (learnedCoefficientsSampleBuffer) {
    CFRelease(learnedCoefficientsSampleBuffer);
  }
  int v6 = *(const void **)&self->_mostRecentMasksLock._os_unfair_lock_opaque;
  if (v6) {
    CFRelease(v6);
  }
  mostRecentLearnedPersonMaskSampleBuffer = self->_mostRecentLearnedPersonMaskSampleBuffer;
  if (mostRecentLearnedPersonMaskSampleBuffer) {
    CFRelease(mostRecentLearnedPersonMaskSampleBuffer);
  }
  mostRecentLearnedSkinMaskSampleBuffer = self->_mostRecentLearnedSkinMaskSampleBuffer;
  if (mostRecentLearnedSkinMaskSampleBuffer) {
    CFRelease(mostRecentLearnedSkinMaskSampleBuffer);
  }
  int v9 = *(NSObject **)&self->_timeInSecondsUntilNextStatsUpdate;
  if (v9)
  {
    dispatch_release(v9);
    *(void *)&self->_timeInSecondsUntilNextStatsUpdate = 0;
  }
  refinerPrepareQueue = self->_refinerPrepareQueue;
  if (refinerPrepareQueue)
  {
    dispatch_release(refinerPrepareQueue);
    self->_refinerPrepareQueue = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)BWSmartStyleLearningNode;
  [(BWNode *)&v11 dealloc];
}

- (id)nodeType
{
  return @"Effect";
}

- (id)nodeSubType
{
  return @"SmartStyleLearning";
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5
{
  v70[1] = *MEMORY[0x1E4F143B8];
  if (!a3 || !a4) {
    goto LABEL_46;
  }
  unsigned int v9 = LODWORD(self->_lastLearnedPortType) * (self->_learningRate / HIDWORD(self->_lastLearnedPortType));
  unsigned int v10 = v9 + 2;
  objc_msgSend((id)objc_msgSend((id)-[CMISmartStyleProcessor configuration](self->_smartStyleProcessor, "configuration"), "styleEngineConfiguration"), "thumbnailSize");
  double v12 = v11;
  double v14 = v13;
  if ([(NSArray *)[(BWNode *)self inputs] objectAtIndexedSubscript:0] != a4
    || ![a5 isEqualToString:@"PrimaryFormat"])
  {
    if (([a5 isEqualToString:@"HumanFullBodiesMask"] & 1) == 0
      && ([a5 isEqualToString:@"HumanSkinsMask"] & 1) == 0
      && ![a5 isEqualToString:0x1EFA74700])
    {
      if (([a5 isEqualToString:@"HumanHairMask"] & 1) == 0
        && ([a5 isEqualToString:0x1EFA74960] & 1) == 0)
      {
        v60.receiver = self;
        v60.super_class = (Class)BWSmartStyleLearningNode;
        [(BWNode *)&v60 didSelectFormat:a3 forInput:a4 forAttachedMediaKey:a5];
      }
      return;
    }
    v46 = &OBJC_IVAR___FigCaptureSessionParsedConfiguration__parsedDepthDataSinkConfigurations;
    long long v47 = &OBJC_IVAR___FigCaptureSessionParsedConfiguration__parsedDepthDataSinkConfigurations;
    if ((BYTE6(self->_previousPTS.epoch) || self->_generateCoefficients || self->_propagateMasks)
      && !self->_networkOutputMaskVideoFormat
      && !self->_inferenceEngine)
    {
      long long v48 = objc_alloc_init(BWVideoFormatRequirements);
      if (!v48) {
        goto LABEL_46;
      }
      long long v49 = v48;
      -[BWVideoFormatRequirements setWidth:](v48, "setWidth:", [a3 width]);
      -[BWVideoFormatRequirements setHeight:](v49, "setHeight:", [a3 height]);
      [(BWVideoFormatRequirements *)v49 setBytesPerRowAlignment:64];
      [(BWVideoFormatRequirements *)v49 setSupportedPixelFormats:&unk_1EFB031D0];
      v63 = v49;
      self->_networkOutputMaskVideoFormat = (BWVideoFormat *)+[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v63 count:1]);
      v46 = &OBJC_IVAR___FigCaptureSessionParsedConfiguration__parsedDepthDataSinkConfigurations;
      long long v47 = &OBJC_IVAR___FigCaptureSessionParsedConfiguration__parsedDepthDataSinkConfigurations;
      if (BYTE6(self->_previousPTS.epoch))
      {
        long long v50 = objc_alloc_init(BWVideoFormatRequirements);
        if (!v50)
        {
          fig_log_get_emitter();
          goto LABEL_55;
        }
        objc_super v51 = v50;
        -[BWVideoFormatRequirements setWidth:](v50, "setWidth:", [a3 width]);
        -[BWVideoFormatRequirements setHeight:](v51, "setHeight:", [a3 height]);
        [(BWVideoFormatRequirements *)v51 setBytesPerRowAlignment:64];
        [(BWVideoFormatRequirements *)v51 setSupportedPixelFormats:&unk_1EFB031E8];
        v62 = v51;
        self->_inferenceEngine = (BWInferenceEngine *)+[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v62 count:1]);
        [(BWVideoFormat *)self->_anstMaskVideoFormat setObject:self->_networkOutputMaskVideoFormat forKeyedSubscript:0x1EFA6A780];
        [(BWVideoFormat *)self->_anstMaskVideoFormat setObject:self->_networkOutputMaskVideoFormat forKeyedSubscript:0x1EFA6A7A0];
        [(BWVideoFormat *)self->_anstMaskVideoFormat setObject:self->_networkOutputMaskVideoFormat forKeyedSubscript:0x1EFA6A7C0];
        [(BWVideoFormat *)self->_anstMaskVideoFormat setObject:self->_inferenceEngine forKeyedSubscript:0x1EFA6A7E0];
        [(BWVideoFormat *)self->_anstMaskVideoFormat setObject:self->_inferenceEngine forKeyedSubscript:0x1EFA6A800];
        [(BWVideoFormat *)self->_anstMaskVideoFormat setObject:self->_inferenceEngine forKeyedSubscript:0x1EFA6A820];
        [(NSMutableDictionary *)self->_refinedVideoFormatByAttachedMediaKey setObject:self->_inferenceEngine forKeyedSubscript:@"HumanHairMask"];
        [(NSMutableDictionary *)self->_processorPixelBufferPoolsByAttachedMediaKeys setObject:self->_inferenceEngine forKeyedSubscript:@"HumanFullBodiesMask"];
        [(NSMutableDictionary *)self->_processorPixelBufferPoolsByAttachedMediaKeys setObject:self->_inferenceEngine forKeyedSubscript:@"HumanSkinsMask"];
        [(NSMutableDictionary *)self->_processorPixelBufferPoolsByAttachedMediaKeys setObject:self->_inferenceEngine forKeyedSubscript:@"HumanHairMask"];
        [(NSMutableDictionary *)self->_processorPixelBufferPoolsByAttachedMediaKeys setObject:self->_inferenceEngine forKeyedSubscript:0x1EFA74700];
        v46 = &OBJC_IVAR___FigCaptureSessionParsedConfiguration__parsedDepthDataSinkConfigurations;
        long long v47 = &OBJC_IVAR___FigCaptureSessionParsedConfiguration__parsedDepthDataSinkConfigurations;
      }
    }
    uint64_t v52 = v47[888];
    if (*((unsigned char *)&self->super.super.isa + v52))
    {
      v53 = -[BWVideoFormatRequirements initWithPixelBufferAttributes:]([BWVideoFormatRequirements alloc], "initWithPixelBufferAttributes:", [a3 pixelBufferAttributes]);
      v54 = objc_alloc_init(BWNodeOutputMediaConfiguration);
      if (!v54)
      {
        fig_log_get_emitter();
        goto LABEL_55;
      }
      v55 = v54;
      [(BWNodeOutputMediaConfiguration *)v54 setFormatRequirements:v53];
      [(BWNodeOutputMediaConfiguration *)v55 setPassthroughMode:0];
      [(BWNodeOutputMediaConfiguration *)v55 setProvidesPixelBufferPool:1];
      [(BWNodeOutputMediaConfiguration *)v55 setOwningNodeRetainedBufferCount:v10 + self->_generateCoefficients + *((unsigned __int8 *)&self->super.super.isa + v52)];
      [(BWNodeOutputMediaConfiguration *)v55 setOwningNodeIndefinitelyHeldBufferCount:1];
      [(BWNodeOutput *)self->super._output setMediaConfiguration:v55 forAttachedMediaKey:a5];
      v61 = v53;
      id v56 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v61 count:1]);
      uint64_t v57 = 296;
    }
    else
    {
      if (!self->_generateCoefficients && !BYTE6(self->_previousPTS.epoch)) {
        return;
      }
      uint64_t v58 = v46[932];
      [(NSMutableDictionary *)self->_refinedVideoFormatByAttachedMediaKey setObject:*(Class *)((char *)&self->super.super.isa + v58) forKeyedSubscript:a5];
      id v56 = *(Class *)((char *)&self->super.super.isa + v58);
      uint64_t v57 = 312;
    }
    [*(id *)((char *)&self->super.super.isa + v57) setObject:v56 forKeyedSubscript:a5];
    return;
  }
  unsigned int v59 = v9 + 2;
  [(BWNodeOutput *)self->super._output setFormat:a3];
  v15 = objc_alloc_init(BWVideoFormatRequirements);
  if (!v15)
  {
LABEL_46:
    fig_log_get_emitter();
    goto LABEL_55;
  }
  uint64_t v16 = v15;
  int v17 = NSNumber;
  uint64_t v18 = FigCaptureUncompressedPixelFormatForPixelFormat([a3 pixelFormat]);
  unsigned int v19 = FigCaptureUnPackedPixelFormatForPixelFormat(v18);
  if ((v19 & 0xFFFFFFEF) == 0x34323066) {
    uint64_t v20 = 1111970369;
  }
  else {
    uint64_t v20 = v19;
  }
  v70[0] = [v17 numberWithInt:v20];
  -[BWVideoFormatRequirements setSupportedPixelFormats:](v16, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:v70 count:1]);
  objc_msgSend((id)-[CMISmartStyleProcessor configuration](self->_smartStyleProcessor, "configuration"), "intermediateStyleRendererThumbnailSize");
  [(BWVideoFormatRequirements *)v16 setWidth:(unint64_t)v21];
  objc_msgSend((id)-[CMISmartStyleProcessor configuration](self->_smartStyleProcessor, "configuration"), "intermediateStyleRendererThumbnailSize");
  [(BWVideoFormatRequirements *)v16 setHeight:(unint64_t)v22];
  [(BWVideoFormatRequirements *)v16 setWidthAlignment:16];
  [(BWVideoFormatRequirements *)v16 setHeightAlignment:16];
  v69 = v16;
  id v23 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v69 count:1]);
  [(NSMutableDictionary *)self->_refinedVideoFormatByAttachedMediaKey setObject:v23 forKeyedSubscript:0x1EFA74880];
  [(NSMutableDictionary *)self->_processorPixelBufferPoolsByAttachedMediaKeys setObject:v23 forKeyedSubscript:0x1EFA74880];
  double v24 = objc_alloc_init(BWVideoFormatRequirements);
  if (!v24)
  {
    fig_log_get_emitter();
    goto LABEL_55;
  }
  v25 = v24;
  v26 = NSNumber;
  uint64_t v27 = FigCaptureUncompressedPixelFormatForPixelFormat([a3 pixelFormat]);
  unsigned int v28 = FigCaptureUnPackedPixelFormatForPixelFormat(v27);
  if ((v28 & 0xFFFFFFEF) == 0x34323066) {
    uint64_t v29 = 1111970369;
  }
  else {
    uint64_t v29 = v28;
  }
  uint64_t v68 = [v26 numberWithInt:v29];
  -[BWVideoFormatRequirements setSupportedPixelFormats:](v25, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v68 count:1]);
  [(BWVideoFormatRequirements *)v25 setWidth:(unint64_t)v12];
  [(BWVideoFormatRequirements *)v25 setHeight:(unint64_t)v14];
  [(BWVideoFormatRequirements *)v25 setWidthAlignment:16];
  [(BWVideoFormatRequirements *)v25 setHeightAlignment:16];
  v67 = v25;
  id v30 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v67 count:1]);
  [(NSMutableDictionary *)self->_refinedVideoFormatByAttachedMediaKey setObject:v30 forKeyedSubscript:0x1EFA748A0];
  [(NSMutableDictionary *)self->_processorPixelBufferPoolsByAttachedMediaKeys setObject:v30 forKeyedSubscript:0x1EFA748A0];
  v31 = objc_alloc_init(BWVideoFormatRequirements);
  if (!v31)
  {
    fig_log_get_emitter();
    goto LABEL_55;
  }
  v32 = v31;
  [(BWVideoFormatRequirements *)v31 setSupportedPixelFormats:&unk_1EFB031B8];
  [(BWVideoFormatRequirements *)v32 setWidth:(unint64_t)v12];
  [(BWVideoFormatRequirements *)v32 setHeight:(unint64_t)v14];
  [(BWVideoFormatRequirements *)v32 setWidthAlignment:16];
  [(BWVideoFormatRequirements *)v32 setHeightAlignment:16];
  v66 = v32;
  id v33 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v66 count:1]);
  [(NSMutableDictionary *)self->_refinedVideoFormatByAttachedMediaKey setObject:v33 forKeyedSubscript:0x1EFA748E0];
  [(NSMutableDictionary *)self->_processorPixelBufferPoolsByAttachedMediaKeys setObject:v33 forKeyedSubscript:0x1EFA748E0];
  if (BYTE4(self->_previousPTS.epoch))
  {
    id v34 = objc_alloc_init(BWVideoFormatRequirements);
    if (!v34)
    {
      fig_log_get_emitter();
      goto LABEL_55;
    }
    v35 = v34;
    uint64_t v36 = objc_msgSend((id)-[CMISmartStyleProcessor configuration](self->_smartStyleProcessor, "configuration"), "pixelBufferAttributesWithCapacityForLearntCoefficients");
    uint64_t v65 = [v36 objectForKeyedSubscript:*MEMORY[0x1E4F24D70]];
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v35, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v65 count:1]);
    int v37 = objc_msgSend((id)-[CMISmartStyleProcessor configuration](self->_smartStyleProcessor, "configuration"), "pixelBufferAttributesWithCapacityForLearntCoefficients");
    -[BWVideoFormatRequirements setWidth:](v35, "setWidth:", objc_msgSend((id)objc_msgSend(v37, "objectForKeyedSubscript:", *MEMORY[0x1E4F24E10]), "unsignedIntValue"));
    int v38 = objc_msgSend((id)-[CMISmartStyleProcessor configuration](self->_smartStyleProcessor, "configuration"), "pixelBufferAttributesWithCapacityForLearntCoefficients");
    -[BWVideoFormatRequirements setHeight:](v35, "setHeight:", objc_msgSend((id)objc_msgSend(v38, "objectForKeyedSubscript:", *MEMORY[0x1E4F24D08]), "unsignedIntValue"));
    [(BWVideoFormatRequirements *)v35 setWidthAlignment:16];
    [(BWVideoFormatRequirements *)v35 setHeightAlignment:16];
    int v39 = objc_alloc_init(BWNodeOutputMediaConfiguration);
    if (!v39) {
      goto LABEL_52;
    }
    int v40 = v39;
    [(BWNodeOutputMediaConfiguration *)v39 setFormatRequirements:v35];
    [(BWNodeOutputMediaConfiguration *)v40 setPassthroughMode:0];
    [(BWNodeOutputMediaConfiguration *)v40 setProvidesPixelBufferPool:1];
    [(BWNodeOutputMediaConfiguration *)v40 setOwningNodeRetainedBufferCount:v9 + 3];
    [(BWNodeOutputMediaConfiguration *)v40 setOwningNodeIndefinitelyHeldBufferCount:1];
    [(BWNodeOutput *)self->super._output setMediaConfiguration:v40 forAttachedMediaKey:0x1EFA74840];
    int v41 = objc_alloc_init(BWNodeOutputMediaConfiguration);
    if (!v41) {
      goto LABEL_52;
    }
    double v42 = v41;
    [(BWNodeOutputMediaConfiguration *)v41 setFormatRequirements:v25];
    [(BWNodeOutputMediaConfiguration *)v42 setPassthroughMode:0];
    [(BWNodeOutputMediaConfiguration *)v42 setProvidesPixelBufferPool:1];
    [(BWNodeOutputMediaConfiguration *)v42 setOwningNodeRetainedBufferCount:v59];
    [(BWNodeOutputMediaConfiguration *)v42 setOwningNodeIndefinitelyHeldBufferCount:3];
    [(BWNodeOutput *)self->super._output setMediaConfiguration:v42 forAttachedMediaKey:0x1EFA748A0];
    double v43 = objc_alloc_init(BWNodeOutputMediaConfiguration);
    if (!v43)
    {
LABEL_52:
      fig_log_get_emitter();
      goto LABEL_55;
    }
    double v44 = v43;
    [(BWNodeOutputMediaConfiguration *)v43 setFormatRequirements:v32];
    [(BWNodeOutputMediaConfiguration *)v44 setPassthroughMode:0];
    [(BWNodeOutputMediaConfiguration *)v44 setProvidesPixelBufferPool:1];
    [(BWNodeOutputMediaConfiguration *)v44 setOwningNodeRetainedBufferCount:v59];
    [(BWNodeOutputMediaConfiguration *)v44 setOwningNodeIndefinitelyHeldBufferCount:3];
    [(BWNodeOutput *)self->super._output setMediaConfiguration:v44 forAttachedMediaKey:0x1EFA748E0];
  }
  if (BYTE6(self->_previousPTS.epoch))
  {
    [(BWVideoFormat *)self->_anstMaskVideoFormat setObject:[(NSMutableDictionary *)self->_refinedVideoFormatByAttachedMediaKey objectForKeyedSubscript:0x1EFA74880] forKeyedSubscript:@"PrimaryFormat"];
    v45 = -[BWVideoFormatRequirements initWithPixelBufferAttributes:]([BWInferenceVideoFormatRequirements alloc], "initWithPixelBufferAttributes:", objc_msgSend((id)-[BWVideoFormat objectForKeyedSubscript:](self->_anstMaskVideoFormat, "objectForKeyedSubscript:", @"PrimaryFormat"), "pixelBufferAttributes"));
    [(BWInferenceVideoFormatRequirements *)v45 setIncludesInvalidContent:1];
    v64 = v45;
    if (-[BWInferenceScheduler prepareForInputInferenceVideoFormat:attachedMediaKey:](self->_inferenceScheduler, "prepareForInputInferenceVideoFormat:attachedMediaKey:", +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v64 count:1]), @"PrimaryFormat"))
    {
      fig_log_get_emitter();
LABEL_55:
      FigDebugAssert3();
    }
  }
}

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  if ([(NSArray *)[(BWNode *)self inputs] objectAtIndexedSubscript:0] == a5)
  {
    output = self->super._output;
    [(BWNodeOutput *)output makeConfiguredFormatLive];
  }
}

- (void)didReachEndOfDataForInput:(id)a3
{
  if ([(NSArray *)[(BWNode *)self inputs] objectAtIndexedSubscript:0] == a3)
  {
    dispatch_sync(*(dispatch_queue_t *)&self->_timeInSecondsUntilNextStatsUpdate, &__block_literal_global_66);
    dispatch_sync((dispatch_queue_t)self->_refinerPrepareQueue, &__block_literal_global_68_0);
    [(BWNodeOutput *)self->super._output markEndOfLiveOutput];
    os_unfair_lock_lock(&self->_inputMasksSampleBufferQueueLock);
    [(NSMutableArray *)self->_inputMasksSampleBufferQueue removeAllObjects];
    os_unfair_lock_unlock(&self->_inputMasksSampleBufferQueueLock);
    os_unfair_lock_lock(&self->_inputStyleContainerSampleBufferQueueLock);
    [(NSMutableArray *)self->_inputStyleContainerSampleBufferQueue removeAllObjects];
    os_unfair_lock_unlock(&self->_inputStyleContainerSampleBufferQueueLock);
    learnedCoefficientsSampleBuffer = self->_learnedCoefficientsSampleBuffer;
    if (learnedCoefficientsSampleBuffer)
    {
      CFRelease(learnedCoefficientsSampleBuffer);
      self->_learnedCoefficientsSampleBuffer = 0;
    }
    identityCoefficientsPixelBuffer = self->_identityCoefficientsPixelBuffer;
    if (identityCoefficientsPixelBuffer)
    {
      CFRelease(identityCoefficientsPixelBuffer);
      self->_identityCoefficientsPixelBuffer = 0;
    }
    initialCoefficientsPixelBuffer = self->_initialCoefficientsPixelBuffer;
    if (initialCoefficientsPixelBuffer)
    {
      CFRelease(initialCoefficientsPixelBuffer);
      self->_initialCoefficientsPixelBuffer = 0;
    }
    [(BWSmartStyleLearningNode *)self _releaseResources];
  }
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = MEMORY[0x1E4F1F9F8];
  *(_OWORD *)(&self->_preLTMThumbnailFound + 3) = *MEMORY[0x1E4F1F9F8];
  *(void *)&self->_previousPTS.flags = *(void *)(v3 + 16);
  v79.receiver = self;
  v79.super_class = (Class)BWSmartStyleLearningNode;
  [(BWNode *)&v79 prepareForCurrentConfigurationToBecomeLive];
  LOBYTE(self->_cameraInfoByPortType) = BYTE1(self->_mostRecentLearnedSkyMaskSampleBuffer) ^ 1;
  os_unfair_lock_lock((os_unfair_lock_t)&self->_statsUpdateDeltaTimeThreshold);
  self->_timingLock._os_unfair_lock_opaque = 0;
  self->_anstMasksMatchingTimeInSecondsThreshold = 0.0;
  os_unfair_lock_unlock((os_unfair_lock_t)&self->_statsUpdateDeltaTimeThreshold);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__BWSmartStyleLearningNode_prepareForCurrentConfigurationToBecomeLive__block_invoke;
  block[3] = &unk_1E5C24430;
  block[4] = self;
  dispatch_async((dispatch_queue_t)self->_refinerPrepareQueue, block);
  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  refinedVideoFormatByAttachedMediaKey = self->_refinedVideoFormatByAttachedMediaKey;
  uint64_t v5 = [(NSMutableDictionary *)refinedVideoFormatByAttachedMediaKey countByEnumeratingWithState:&v74 objects:v82 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v75;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v75 != v7) {
          objc_enumerationMutation(refinedVideoFormatByAttachedMediaKey);
        }
        uint64_t v9 = *(void *)(*((void *)&v74 + 1) + 8 * i);
        if ([(BWNodeOutput *)self->super._output mediaConfigurationForAttachedMediaKey:v9])
        {
          id v10 = (id)objc_msgSend(-[BWNodeOutput mediaPropertiesForAttachedMediaKey:](self->super._output, "mediaPropertiesForAttachedMediaKey:", v9), "preparedPixelBufferPool");
          if (!v10)
          {
            fig_log_get_emitter();
LABEL_50:
            FigDebugAssert3();
            double v21 = 0;
            goto LABEL_51;
          }
          double v11 = v10;
          [(NSMutableDictionary *)self->_processorVideoFormatsByAttachedMediaKeys setObject:v10 forKeyedSubscript:v9];
        }
      }
      uint64_t v6 = [(NSMutableDictionary *)refinedVideoFormatByAttachedMediaKey countByEnumeratingWithState:&v74 objects:v82 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  obuint64_t j = self->_processorPixelBufferPoolsByAttachedMediaKeys;
  uint64_t v12 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v70 objects:v81 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v71;
    while (2)
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v71 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void *)(*((void *)&v70 + 1) + 8 * j);
        uint64_t v17 = [(NSMutableDictionary *)self->_refinedVideoFormatByAttachedMediaKey objectForKeyedSubscript:v16];
        uint64_t v18 = [BWPixelBufferPool alloc];
        uint64_t v19 = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:](v18, "initWithVideoFormat:capacity:name:memoryPool:", v17, 3, [NSString stringWithFormat:@"SmartStyleLearningNode_%@_Pool", v16], -[BWNodeOutput memoryPool](self->super._output, "memoryPool"));
        if (!v19)
        {
          fig_log_get_emitter();
          goto LABEL_50;
        }
        uint64_t v20 = (void *)v19;
        [(NSMutableDictionary *)self->_intermediateVideoFormatsByAttachedMediaKeys setObject:v19 forKeyedSubscript:v16];
      }
      uint64_t v13 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v70 objects:v81 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
  if (BYTE6(self->_previousPTS.epoch))
  {
    v69[0] = MEMORY[0x1E4F143A8];
    v69[1] = 3221225472;
    v69[2] = __70__BWSmartStyleLearningNode_prepareForCurrentConfigurationToBecomeLive__block_invoke_2;
    v69[3] = &unk_1E5C24430;
    v69[4] = self;
    dispatch_async(*(dispatch_queue_t *)&self->_timeInSecondsUntilNextStatsUpdate, v69);
  }
  os_unfair_lock_lock(&self->_styleUpdateLock);
  double v21 = (FigCaptureSmartStyle *)[*(id *)&self->_bypassStyleEngineForStandardStyle copy];
  os_unfair_lock_unlock(&self->_styleUpdateLock);
  if (!v21)
  {
    LODWORD(v22) = 1.0;
    double v21 = +[FigCaptureSmartStyle styleWithCast:FigSmartStyleCastTypeStandard intensity:v22 toneBias:0.0 colorBias:0.0];
    if (!v21) {
      goto LABEL_52;
    }
  }
  id v23 = (void *)MEMORY[0x1E4F55EF0];
  uint64_t v24 = [(FigCaptureSmartStyle *)v21 cast];
  [(FigCaptureSmartStyle *)v21 toneBias];
  int v26 = v25;
  [(FigCaptureSmartStyle *)v21 colorBias];
  int v28 = v27;
  [(FigCaptureSmartStyle *)v21 intensity];
  LODWORD(v30) = v29;
  LODWORD(v31) = 1.0;
  LODWORD(v32) = v26;
  LODWORD(v33) = v28;
  [v23 calculateStartupPriorCCMforCast:v24 tone:v32 color:v33 intensity:v30 priorStrength:v31];
  long long v64 = v34;
  *(_OWORD *)obja = v35;
  long long v67 = v36;
  uint64_t v37 = [MEMORY[0x1E4F55F18] configurationForUseCase:1];
  if (!v37
    || (int v38 = (void *)v37,
        (id v39 = -[BWNodeOutput mediaPropertiesForAttachedMediaKey:](self->super._output, "mediaPropertiesForAttachedMediaKey:", 0x1EFA74840)) == 0)|| (v40 = (__CVBuffer *)objc_msgSend((id)objc_msgSend(v39, "preparedPixelBufferPool"), "newPixelBuffer")) == 0)
  {
LABEL_52:
    fig_log_get_emitter();
    goto LABEL_54;
  }
  int v41 = v40;
  v80[0] = v64;
  v80[1] = *(_OWORD *)obja;
  v80[2] = v67;
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(v40);
  OSType v43 = PixelFormatType;
  if (PixelFormatType == 1278226534 || PixelFormatType == 1278226536)
  {
    [v38 spotlightCount];
    int32x2_t v45 = v44;
    [v38 spotlightCount];
    int32x2_t v68 = v46;
    int v47 = [v38 weightPlaneCount];
    int v48 = [v38 createAndSolveGlobalLinearSystem];
    if (!CVPixelBufferLockBaseAddress(v41, 0))
    {
      BaseAddress = (char *)CVPixelBufferGetBaseAddress(v41);
      uint64_t v50 = (vmul_lane_s32(v45, v68, 1).u32[0] + v48) * v47;
      if (v43 == 1278226536)
      {
        if ((int)v50 >= 1)
        {
          for (uint64_t k = 0; k != v50; ++k)
          {
            uint64_t v52 = 0;
            v53 = BaseAddress;
            do
            {
              for (uint64_t m = 0; m != 3; ++m)
              {
                _S0 = *(_DWORD *)((unint64_t)&v80[m] & 0xFFFFFFFFFFFFFFF3 | (4 * (v52 & 3)));
                __asm { FCVT            H0, S0 }
                *(_WORD *)&v53[2 * m] = _S0;
              }
              ++v52;
              v53 += 6;
            }
            while (v52 != 4);
            BaseAddress += 24;
          }
        }
      }
      else if ((int)v50 >= 1)
      {
        for (uint64_t n = 0; n != v50; ++n)
        {
          uint64_t v61 = 0;
          v62 = BaseAddress;
          do
          {
            for (iuint64_t i = 0; ii != 3; ++ii)
              *(_DWORD *)&v62[4 * ii] = *(_DWORD *)((unint64_t)&v80[ii] & 0xFFFFFFFFFFFFFFF3 | (4 * (v61 & 3)));
            ++v61;
            v62 += 12;
          }
          while (v61 != 4);
          BaseAddress += 48;
        }
      }
      if (!CVPixelBufferUnlockBaseAddress(v41, 0)) {
        goto LABEL_47;
      }
    }
    fig_log_get_emitter();
    FigDebugAssert3();
    fig_log_get_emitter();
LABEL_54:
    FigDebugAssert3();
    goto LABEL_51;
  }
  fig_log_get_emitter();
  FigDebugAssert3();
LABEL_47:
  self->_initialStyle = v21;
  self->_initialCoefficientsPixelBuffer = v41;
LABEL_51:
}

uint64_t __70__BWSmartStyleLearningNode_prepareForCurrentConfigurationToBecomeLive__block_invoke(uint64_t a1)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  if ([*(id *)(*(void *)(a1 + 32) + 112) setup])
  {
    fig_log_get_emitter();
    return FigDebugAssert3();
  }
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 244)) {
    uint64_t v3 = 9;
  }
  else {
    uint64_t v3 = 8;
  }
  v4 = *(void **)(v2 + 112);
  id v5 = objc_alloc(MEMORY[0x1E4F55EB8]);
  v15 = @"ProcessingType";
  v16[0] = [NSNumber numberWithUnsignedInt:v3];
  uint64_t v6 = objc_msgSend(v5, "initWithMaxInputDimensions:inputPixelFormat:maxOutputDimensions:cmiResourceEnabled:processorSpecificOptions:", 0, 0, 0, 0, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1));
  if (!v6)
  {
    uint64_t v9 = 0;
    uint64_t v12 = 0;
    int v8 = 0;
    id v7 = 0;
LABEL_23:
    int v13 = -12786;
    goto LABEL_12;
  }
  id v7 = (id)[v4 externalMemoryDescriptorForConfiguration:v6];
  if (!v7)
  {
    uint64_t v9 = 0;
    uint64_t v12 = 0;
    int v8 = 0;
    goto LABEL_23;
  }
  int v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F55F48]), "initWithDevice:allocatorType:", objc_msgSend((id)objc_msgSend(v4, "metalCommandQueue"), "device"), objc_msgSend(v7, "allocatorType"));
  if (!v8)
  {
    uint64_t v9 = 0;
    goto LABEL_22;
  }
  uint64_t v9 = objc_opt_new();
  if (!v9)
  {
LABEL_22:
    uint64_t v12 = 0;
    goto LABEL_23;
  }
  objc_msgSend(v9, "setMemSize:", objc_msgSend(v7, "memSize"));
  [v9 setWireMemory:1];
  [v9 setLabel:@"BWSmartStyleLearningNode-FigMetalAllocatorBackend"];
  objc_msgSend(v9, "setMemoryPoolId:", -[BWMemoryPool poolIdentifier](+[BWMemoryPool sharedMemoryPool](BWMemoryPool, "sharedMemoryPool"), "poolIdentifier"));
  int v10 = [v8 setupWithDescriptor:v9];
  if (v10)
  {
    int v13 = v10;
    uint64_t v12 = 0;
    goto LABEL_12;
  }
  double v11 = objc_opt_new();
  uint64_t v12 = v11;
  if (!v11) {
    goto LABEL_23;
  }
  [v11 setAllocatorBackend:v8];
  [v4 setExternalMemoryResource:v12];
  int v13 = 0;
LABEL_12:

  if (v13 || (uint64_t result = [*(id *)(*(void *)(a1 + 32) + 112) prepareToProcess:v3], result))
  {
    fig_log_get_emitter();
    return FigDebugAssert3();
  }
  return result;
}

void __70__BWSmartStyleLearningNode_prepareForCurrentConfigurationToBecomeLive__block_invoke_2(uint64_t a1)
{
  int v2 = [*(id *)(*(void *)(a1 + 32) + 264) prepareForInferenceWithFormatProvider:*(void *)(a1 + 32) pixelBufferPoolProvider:*(void *)(a1 + 32)];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 252));
  *(unsigned char *)(*(void *)(a1 + 32) + 249) = v2 == 0;
  uint64_t v3 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 252);
  os_unfair_lock_unlock(v3);
}

- (int)processMaskSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (self
    && (-[BWSmartStyleLearningNode _getSampleBufferPresentationTimeStamp:](self, "_getSampleBufferPresentationTimeStamp:"), CMTimeEpoch epoch = time.epoch, value = time.value, flags = time.flags, timescale = time.timescale, (time.flags & 1) != 0))
  {
    if (*MEMORY[0x1E4F1EBA8] == 1)
    {
      time.CMTimeValue value = value;
      time.CMTimeScale timescale = timescale;
      CMTimeGetSeconds(&time);
      kdebug_trace();
    }
    time.CMTimeValue value = value;
    time.CMTimeScale timescale = timescale;
    time.CMTimeFlags flags = flags;
    time.CMTimeEpoch epoch = epoch;
    int v7 = [(BWSmartStyleLearningNode *)self _extractANSTMasks:a3 forPTS:&time];
    if (v7)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
  return v7;
}

- (int)processVideoSampleBuffer:(opaqueCMSampleBuffer *)a3 frameEmitted:(BOOL *)a4
{
  uint64_t v115 = *MEMORY[0x1E4F143B8];
  v108 = 0;
  CFTypeRef v109 = 0;
  CFTypeRef v106 = 0;
  CFTypeRef v107 = 0;
  CFTypeRef v104 = 0;
  CFTypeRef v105 = 0;
  CFTypeRef v103 = 0;
  id v5 = &OBJC_IVAR___FigCaptureSessionParsedConfiguration__parsedDepthDataSinkConfigurations;
  uint64_t v6 = &OBJC_IVAR___FigCaptureSessionParsedConfiguration__parsedDepthDataSinkConfigurations;
  int v7 = &OBJC_IVAR___FigCaptureSessionParsedConfiguration__parsedDepthDataSinkConfigurations;
  int v8 = &OBJC_IVAR___FigCaptureSessionParsedConfiguration__parsedDepthDataSinkConfigurations;
  if (!self
    || (-[BWSmartStyleLearningNode _getSampleBufferPresentationTimeStamp:](self, "_getSampleBufferPresentationTimeStamp:"), CMTimeEpoch epoch = time.duration.epoch, value = time.duration.value, flags = time.duration.flags, timescale = time.duration.timescale, (time.duration.flags & 1) == 0))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v92 = 0;
    int v15 = 0;
    goto LABEL_116;
  }
  CMTimeFlags v90 = time.duration.flags;
  if (*MEMORY[0x1E4F1EBA8] == 1)
  {
    time.duration.CMTimeValue value = value;
    time.duration.CMTimeScale timescale = timescale;
    CMTimeGetSeconds(&time.duration);
    kdebug_trace();
    CMTimeFlags flags = v90;
  }
  int v13 = &self->_preLTMThumbnailFound + 3;
  v89 = a4;
  if (self->_previousPTS.timescale)
  {
    time.duration.CMTimeValue value = value;
    time.duration.CMTimeScale timescale = timescale;
    time.duration.CMTimeFlags flags = flags;
    time.duration.CMTimeEpoch epoch = epoch;
    double Seconds = CMTimeGetSeconds(&time.duration);
    *(_OWORD *)&time.duration.CMTimeValue value = *(_OWORD *)v13;
    time.duration.CMTimeEpoch epoch = *(void *)&self->_previousPTS.flags;
    Float64 v17 = CMTimeGetSeconds(&time.duration);
    CMTimeFlags flags = v90;
    float v14 = Seconds - v17;
  }
  else
  {
    float v14 = 1.0 / (float)HIDWORD(self->_lastLearnedPortType);
  }
  *(void *)int v13 = value;
  HIDWORD(self->_previousPTS.value) = timescale;
  self->_previousPTS.CMTimeScale timescale = flags;
  CMTimeEpoch v85 = epoch;
  *(void *)&self->_previousPTS.CMTimeFlags flags = epoch;
  uint64_t v18 = [(BWSmartStyleLearningNode *)self _unpackSbufFromPrimaryCameraStream:a3];
  CFTypeRef v19 = CMGetAttachment(v18, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  if (!v19)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v92 = 0;
    int v15 = 0;
    goto LABEL_105;
  }
  uint64_t v20 = (void *)v19;
  os_unfair_lock_lock(&self->_styleUpdateLock);
  if (LOBYTE(self->_mostRecentLearnedSkyMaskSampleBuffer)
    && (double v21 = (void *)[*(id *)&self->_bypassStyleEngineForStandardStyle cast],
        [v21 isEqual:FigSmartStyleCastTypeStandard])
    && ([*(id *)&self->_bypassStyleEngineForStandardStyle toneBias], v22 == 0.0))
  {
    [*(id *)&self->_bypassStyleEngineForStandardStyle colorBias];
    BOOL v24 = v23 == 0.0;
  }
  else
  {
    BOOL v24 = 0;
  }
  uint64_t v25 = [*(id *)&self->_bypassStyleEngineForStandardStyle dictionaryRepresentation];
  p_styleUpdateLocuint64_t k = &self->_styleUpdateLock;
  os_unfair_lock_unlock(&self->_styleUpdateLock);
  [(BWSmartStyleLearningNode *)self _updateCurrentSmartStyleMetadata:v25 onSbuf:a3];
  os_unfair_lock_lock((os_unfair_lock_t)&self->_statsUpdateDeltaTimeThreshold);
  locuint64_t k = (os_unfair_lock_s *)&self->_statsUpdateDeltaTimeThreshold;
  float v26 = *(float *)&self->_timingLock._os_unfair_lock_opaque;
  float anstMasksMatchingTimeInSecondsThreshold = self->_anstMasksMatchingTimeInSecondsThreshold;
  os_unfair_lock_unlock((os_unfair_lock_t)&self->_statsUpdateDeltaTimeThreshold);
  int v28 = (void *)[v20 objectForKeyedSubscript:*MEMORY[0x1E4F54128]];
  int v29 = v28;
  if (*(void *)&self->_firstFrame)
  {
    if (objc_msgSend(v28, "isEqualToString:")) {
      goto LABEL_20;
    }
    double v30 = *(void **)&self->_firstFrame;
  }
  else
  {
    double v30 = 0;
  }

  *(void *)&self->_firstFrame = v29;
  LOBYTE(self->_cameraInfoByPortType) = 1;
  float v26 = 0.0;
  float anstMasksMatchingTimeInSecondsThreshold = 0.0;
LABEL_20:
  int v31 = [(BWSmartStyleLearningNode *)self _getContainerAssetsFromSampleBuffer:v18 outputUnstyledThumbnailSampleBuffer:&v106 outputLinearThumbnailSampleBuffer:&v105];
  if (v31)
  {
    int v15 = v31;
    fig_log_get_emitter();
    FigDebugAssert3();
    v92 = 0;
    goto LABEL_105;
  }
  BWSampleBufferSetAttachedMedia(v18, 0x1EFA748A0, (uint64_t)v106);
  BWSampleBufferSetAttachedMedia(v18, 0x1EFA748E0, (uint64_t)v105);
  os_unfair_lock_lock((os_unfair_lock_t)&self->_workQueue);
  learnedCoefficientsSampleBuffer = self->_learnedCoefficientsSampleBuffer;
  if (learnedCoefficientsSampleBuffer)
  {
    BWSampleBufferSetAttachedMedia(v18, 0x1EFA74840, (uint64_t)learnedCoefficientsSampleBuffer);
    DictionaryRepresentatiouint64_t n = CGRectCreateDictionaryRepresentation(*(CGRect *)&self->_srlStats);
    [v20 setObject:DictionaryRepresentation forKeyedSubscript:*MEMORY[0x1E4F534F8]];
    [v20 setObject:self->_smartStyleLearned forKeyedSubscript:*MEMORY[0x1E4F53518]];
    srlCurveParameter = self->_srlCurveParameter;
    if (!srlCurveParameter) {
      srlCurveParameter = (NSNumber *)(id)objc_opt_new();
    }
    [v20 setObject:srlCurveParameter forKeyedSubscript:*MEMORY[0x1E4F53520]];
    uint64_t v35 = [*(id *)&self->_workQueueLearnCount dictionaryRepresentation];
    [v20 setObject:v35 forKeyedSubscript:*MEMORY[0x1E4F53500]];
    goto LABEL_31;
  }
  CFTypeRef cf = 0;
  CFTypeRef v102 = 0;
  memset(&time, 0, sizeof(time));
  OSStatus SampleTimingInfoArray = CMSampleBufferGetSampleTimingInfoArray(v18, 1, &time, 0);
  if (SampleTimingInfoArray)
  {
    int v15 = SampleTimingInfoArray;
    fig_log_get_emitter();
LABEL_145:
    FigDebugAssert3();
    uint64_t v6 = &OBJC_IVAR___FigCaptureSessionParsedConfiguration__parsedDepthDataSinkConfigurations;
    id v5 = &OBJC_IVAR___FigCaptureSessionParsedConfiguration__parsedDepthDataSinkConfigurations;
    v92 = 0;
    goto LABEL_116;
  }
  initialCoefficientsPixelBuffer = self->_initialCoefficientsPixelBuffer;
  CMSampleTimingInfo sampleTiming = time;
  int v38 = BWSampleBufferCreateFromPixelBufferWithTimingInfo(initialCoefficientsPixelBuffer, &sampleTiming, &v102, (CMSampleBufferRef *)&cf);
  if (v38)
  {
    int v15 = v38;
    fig_log_get_emitter();
    goto LABEL_145;
  }
  v116.origin.x = 0.0;
  v116.origin.y = 0.0;
  v116.size.width = 1.0;
  v116.size.height = 1.0;
  DictionaryRepresentatiouint64_t n = CGRectCreateDictionaryRepresentation(v116);
  BWSampleBufferSetAttachedMedia(v18, 0x1EFA74840, (uint64_t)cf);
  [v20 setObject:DictionaryRepresentation forKeyedSubscript:*MEMORY[0x1E4F534F8]];
  id v39 = [(FigCaptureSmartStyle *)self->_initialStyle dictionaryRepresentation];
  [v20 setObject:v39 forKeyedSubscript:*MEMORY[0x1E4F53500]];
  if (cf) {
    CFRelease(cf);
  }
  if (v102) {
    CFRelease(v102);
  }
LABEL_31:

  os_unfair_lock_unlock((os_unfair_lock_t)&self->_workQueue);
  int v40 = objc_msgSend((id)-[FigMetalContext device](self->_metalContext, "device"), "newSharedEvent");
  if (!v40)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v92 = 0;
    int v15 = -12786;
    goto LABEL_104;
  }
  BOOL v83 = v24;
  v92 = v40;
  CMSetAttachment(v18, (CFStringRef)*MEMORY[0x1E4F53158], v40, 1u);
  if (BYTE5(self->_previousPTS.epoch) && self->_currentImageStats && self->_currentImageStatsExtended)
  {
    objc_msgSend(v20, "setObject:forKeyedSubscript:");
    [v20 setObject:self->_currentImageStatsExtended forKeyedSubscript:*MEMORY[0x1E4F534E0]];
  }
  os_unfair_lock_lock(&self->_semanticStyleSceneLock);
  uint64_t v41 = [NSNumber numberWithInt:self->_semanticStyleSceneType];
  [v20 setObject:v41 forKeyedSubscript:*MEMORY[0x1E4F534B0]];
  os_unfair_lock_unlock(&self->_semanticStyleSceneLock);
  os_unfair_lock_lock((os_unfair_lock_t)&self->_lastLearnedROI.size.height);
  int v42 = BYTE4(self->_lastLearnedROI.size.height);
  if (BYTE4(self->_lastLearnedROI.size.height) && self->_propagateMasks)
  {
    BWSampleBufferSetAttachedMedia(v18, @"HumanFullBodiesMask", *(void *)&self->_mostRecentMasksLock._os_unfair_lock_opaque);
    BWSampleBufferSetAttachedMedia(v18, @"HumanSkinsMask", (uint64_t)self->_mostRecentLearnedPersonMaskSampleBuffer);
    BWSampleBufferSetAttachedMedia(v18, 0x1EFA74700, (uint64_t)self->_mostRecentLearnedSkinMaskSampleBuffer);
    BYTE4(self->_lastLearnedROI.size.height) = 0;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&self->_lastLearnedROI.size.height);
  uint64_t v43 = [NSNumber numberWithBool:v42 != 0];
  [v20 setObject:v43 forKeyedSubscript:*MEMORY[0x1E4F534F0]];
  if (v42 && self->_propagateMasks) {
    BWSynchronizeSmartStyleAttachedMediaPTS(v18);
  }
  int CopyIncludingMetadata = BWCMSampleBufferCreateCopyIncludingMetadata(v18, (CMSampleBufferRef *)&v107);
  if (CopyIncludingMetadata)
  {
    int v15 = CopyIncludingMetadata;
    fig_log_get_emitter();
    FigDebugAssert3();
    int v8 = &OBJC_IVAR___FigCaptureSessionParsedConfiguration__parsedDepthDataSinkConfigurations;
    int v7 = &OBJC_IVAR___FigCaptureSessionParsedConfiguration__parsedDepthDataSinkConfigurations;
    goto LABEL_104;
  }
  BWSampleBufferRemoveAttachedMedia(v18, 0x1EFA74960);
  os_unfair_lock_lock((os_unfair_lock_t)&self->_workQueue);
  int workQueue_high = HIDWORD(self->_workQueue);
  os_unfair_lock_unlock((os_unfair_lock_t)&self->_workQueue);
  if (workQueue_high > 1)
  {
    time.duration.CMTimeValue value = value;
    time.duration.CMTimeScale timescale = timescale;
    time.duration.CMTimeFlags flags = v90;
    time.duration.CMTimeEpoch epoch = v85;
    id v52 = +[BWDroppedSample newDroppedSampleWithReason:0x1EFA68120 pts:&time];
    LODWORD(v102) = 0;
    LOBYTE(cf) = 0;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v54 = v102;
    if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, (os_log_type_t)cf)) {
      unsigned int v55 = v54;
    }
    else {
      unsigned int v55 = v54 & 0xFFFFFFFE;
    }
    if (v55)
    {
      if (v52) {
        [v52 pts];
      }
      else {
        memset(&v100, 0, sizeof(v100));
      }
      id v5 = &OBJC_IVAR___FigCaptureSessionParsedConfiguration__parsedDepthDataSinkConfigurations;
      *(double *)&CMTimeValue v59 = CMTimeGetSeconds(&v100);
      LODWORD(sampleTiming.duration.value) = 136315650;
      *(CMTimeValue *)((char *)&sampleTiming.duration.value + 4) = (CMTimeValue)"-[BWSmartStyleLearningNode processVideoS"
                                                                                "ampleBuffer:frameEmitted:]";
      LOWORD(sampleTiming.duration.flags) = 2112;
      *(void *)((char *)&sampleTiming.duration.flags + 2) = self;
      HIWORD(sampleTiming.duration.epoch) = 2048;
      sampleTiming.presentationTimeStamp.CMTimeValue value = v59;
      _os_log_send_and_compose_impl();
    }
    else
    {
      id v5 = &OBJC_IVAR___FigCaptureSessionParsedConfiguration__parsedDepthDataSinkConfigurations;
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    [(BWNodeOutput *)self->super._output emitDroppedSample:v52];

    int v15 = 0;
    BOOL *v89 = 1;
    int v8 = &OBJC_IVAR___FigCaptureSessionParsedConfiguration__parsedDepthDataSinkConfigurations;
    int v7 = &OBJC_IVAR___FigCaptureSessionParsedConfiguration__parsedDepthDataSinkConfigurations;
LABEL_115:
    uint64_t v6 = &OBJC_IVAR___FigCaptureSessionParsedConfiguration__parsedDepthDataSinkConfigurations;
    goto LABEL_116;
  }
  [(BWNodeOutput *)self->super._output emitSampleBuffer:a3];
  BOOL *v89 = 1;
  int v46 = [(BWSmartStyleLearningNode *)self _createSmartStyleContainerFromSampleBuffer:v107 unstyledThumbnailSampleBuffer:v106 linearThumbnailSampleBuffer:v105 to:&v109];
  int v8 = &OBJC_IVAR___FigCaptureSessionParsedConfiguration__parsedDepthDataSinkConfigurations;
  int v7 = &OBJC_IVAR___FigCaptureSessionParsedConfiguration__parsedDepthDataSinkConfigurations;
  if (v46)
  {
    int v15 = v46;
    fig_log_get_emitter();
LABEL_142:
    FigDebugAssert3();
    goto LABEL_104;
  }
  os_unfair_lock_lock(&self->_inputStyleContainerSampleBufferQueueLock);
  [(NSMutableArray *)self->_inputStyleContainerSampleBufferQueue addObject:v109];
  os_unfair_lock_unlock(&self->_inputStyleContainerSampleBufferQueueLock);
  uint64_t AttachedMedia = BWSampleBufferGetAttachedMedia(v107, 0x1EFA68BE0);
  p_inputStyleContainerSampleBufferQueueLocuint64_t k = &self->_inputStyleContainerSampleBufferQueueLock;
  if (v26 > 0.0)
  {
    uint64_t v50 = 0;
    currentImageStats = 0;
    uint64_t v57 = 0;
    p_statsUpdateDeltaTimeThreshold = &self->_statsUpdateDeltaTimeThreshold;
    goto LABEL_87;
  }
  uint64_t v86 = AttachedMedia;
  if (BYTE6(self->_previousPTS.epoch))
  {
    os_unfair_lock_lock((os_unfair_lock_t)&self->_gdcAttachmentsEnabled);
    BOOL generateImageStats = self->_generateImageStats;
    os_unfair_lock_unlock((os_unfair_lock_t)&self->_gdcAttachmentsEnabled);
    p_inputMasksSampleBufferQueueLocuint64_t k = &self->_inputMasksSampleBufferQueueLock;
    os_unfair_lock_lock(&self->_inputMasksSampleBufferQueueLock);
    if (generateImageStats)
    {
      uint64_t v50 = [(NSMutableArray *)self->_inputMasksSampleBufferQueue lastObject];
      uint64_t v51 = v86;
      if (v50) {
        [(BWSmartStyleLearningNode *)self _findCorrespondingSmartStyleContainerWithMasks:v50 outputSmartStyleContainer:&v108];
      }
      goto LABEL_74;
    }
  }
  else
  {
    p_inputMasksSampleBufferQueueLocuint64_t k = &self->_inputMasksSampleBufferQueueLock;
    os_unfair_lock_lock(&self->_inputMasksSampleBufferQueueLock);
  }
  long long v98 = 0u;
  long long v99 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  inputMasksSampleBufferQueue = self->_inputMasksSampleBufferQueue;
  uint64_t v61 = [(NSMutableArray *)inputMasksSampleBufferQueue countByEnumeratingWithState:&v96 objects:v110 count:16];
  if (v61)
  {
    uint64_t v62 = v61;
    uint64_t v63 = *(void *)v97;
LABEL_64:
    uint64_t v64 = 0;
    while (1)
    {
      if (*(void *)v97 != v63) {
        objc_enumerationMutation(inputMasksSampleBufferQueue);
      }
      uint64_t v50 = *(void *)(*((void *)&v96 + 1) + 8 * v64);
      if (![(BWSmartStyleLearningNode *)self _findCorrespondingSmartStyleContainerWithMasks:v50 outputSmartStyleContainer:&v108])break; {
      if (v62 == ++v64)
      }
      {
        uint64_t v62 = [(NSMutableArray *)inputMasksSampleBufferQueue countByEnumeratingWithState:&v96 objects:v110 count:16];
        if (v62) {
          goto LABEL_64;
        }
        uint64_t v50 = 0;
        break;
      }
    }
    int v8 = &OBJC_IVAR___FigCaptureSessionParsedConfiguration__parsedDepthDataSinkConfigurations;
    int v7 = &OBJC_IVAR___FigCaptureSessionParsedConfiguration__parsedDepthDataSinkConfigurations;
  }
  else
  {
    uint64_t v50 = 0;
  }
  uint64_t v51 = v86;
LABEL_74:
  os_unfair_lock_unlock(p_inputMasksSampleBufferQueueLock);
  p_statsUpdateDeltaTimeThreshold = &self->_statsUpdateDeltaTimeThreshold;
  os_unfair_lock_lock(lock);
  uint64_t v65 = v8[878];
  *(float *)&self->_timingLock._uint32_t os_unfair_lock_opaque = (float)*(unsigned int *)((char *)&self->super.super.isa + v65)
                                                      / (float)*(unsigned int *)((char *)&self->super.super.isa + v7[879]);
  os_unfair_lock_unlock(lock);
  BOOL v66 = *(_DWORD *)((char *)&self->super.super.isa + v65) >= 4u && v51 == 0;
  if (v66 && ![v20 objectForKeyedSubscript:*MEMORY[0x1E4F54018]])
  {
    os_unfair_lock_lock(lock);
    *(float *)&self->_timingLock._uint32_t os_unfair_lock_opaque = *(float *)&self->_timingLock._os_unfair_lock_opaque * 0.5;
    os_unfair_lock_unlock(lock);
  }
  currentImageStats = 0;
  if (BYTE5(self->_previousPTS.epoch) && anstMasksMatchingTimeInSecondsThreshold <= 0.0)
  {

    long long v67 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    self->_currentImageStats = v67;
    if (!v67
      || (int32x2_t v68 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]),
          (self->_currentImageStatsExtended = v68) == 0))
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      int v15 = -12780;
      goto LABEL_104;
    }
    uint64_t v57 = v68;
    currentImageStats = self->_currentImageStats;
    p_statsUpdateDeltaTimeThreshold = &self->_statsUpdateDeltaTimeThreshold;
    os_unfair_lock_lock(lock);
    LODWORD(self->_anstMasksMatchingTimeInSecondsThreshold) = self->_learningFramesPerSecondUnit;
    os_unfair_lock_unlock(lock);
  }
  else
  {
    uint64_t v57 = 0;
  }
LABEL_87:
  os_unfair_lock_lock((os_unfair_lock_t)p_statsUpdateDeltaTimeThreshold);
  *(float *)&self->_timingLock._uint32_t os_unfair_lock_opaque = *(float *)&self->_timingLock._os_unfair_lock_opaque - v14;
  self->_float anstMasksMatchingTimeInSecondsThreshold = self->_anstMasksMatchingTimeInSecondsThreshold - v14;
  os_unfair_lock_unlock((os_unfair_lock_t)p_statsUpdateDeltaTimeThreshold);
  int v69 = BWCMSampleBufferCreateCopyIncludingMetadata((CMSampleBufferRef)v105, (CMSampleBufferRef *)&v104);
  if (v69
    || (int v69 = BWCMSampleBufferCreateCopyIncludingMetadata((CMSampleBufferRef)v106, (CMSampleBufferRef *)&v103)) != 0)
  {
    int v15 = v69;
    fig_log_get_emitter();
    goto LABEL_142;
  }
  os_unfair_lock_lock((os_unfair_lock_t)&self->_workQueue);
  ++HIDWORD(self->_workQueue);
  os_unfair_lock_unlock((os_unfair_lock_t)&self->_workQueue);
  if (v107) {
    CFRetain(v107);
  }
  if (v104) {
    CFRetain(v104);
  }
  if (v103)
  {
    CFRetain(v103);
    CFTypeRef v70 = v103;
  }
  else
  {
    CFTypeRef v70 = 0;
  }
  refinerPrepareQueue = self->_refinerPrepareQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__BWSmartStyleLearningNode_processVideoSampleBuffer_frameEmitted___block_invoke;
  block[3] = &unk_1E5C26E48;
  block[6] = v107;
  block[7] = v104;
  block[8] = v70;
  block[4] = self;
  void block[5] = v92;
  dispatch_async(refinerPrepareQueue, block);
  os_unfair_lock_lock((os_unfair_lock_t)&self->_workQueue);
  uint32_t os_unfair_lock_opaque = self->_workQueueLock._os_unfair_lock_opaque;
  os_unfair_lock_unlock((os_unfair_lock_t)&self->_workQueue);
  if (v26 > 0.0)
  {
    int v15 = 0;
LABEL_104:
    uint64_t v6 = &OBJC_IVAR___FigCaptureSessionParsedConfiguration__parsedDepthDataSinkConfigurations;
LABEL_105:
    id v5 = &OBJC_IVAR___FigCaptureSessionParsedConfiguration__parsedDepthDataSinkConfigurations;
    goto LABEL_116;
  }
  if (os_unfair_lock_opaque)
  {
    LODWORD(v102) = 0;
    LOBYTE(cf) = 0;
    long long v73 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v74 = v102;
    if (os_log_type_enabled(v73, (os_log_type_t)cf)) {
      unsigned int v75 = v74;
    }
    else {
      unsigned int v75 = v74 & 0xFFFFFFFE;
    }
    if (v75)
    {
      LODWORD(sampleTiming.duration.value) = 136315138;
      *(CMTimeValue *)((char *)&sampleTiming.duration.value + 4) = (CMTimeValue)"-[BWSmartStyleLearningNode processVideoS"
                                                                                "ampleBuffer:frameEmitted:]";
      _os_log_send_and_compose_impl();
    }
    id v5 = &OBJC_IVAR___FigCaptureSessionParsedConfiguration__parsedDepthDataSinkConfigurations;
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    int v15 = 0;
    *(float *)&self->_timingLock._uint32_t os_unfair_lock_opaque = v14;
    goto LABEL_115;
  }
  if (v108) {
    long long v76 = v108;
  }
  else {
    long long v76 = (opaqueCMSampleBuffer *)v109;
  }
  time.duration.CMTimeValue value = 0;
  v88 = v76;
  int v15 = BWCMSampleBufferCreateCopyIncludingMetadata(v76, (CMSampleBufferRef *)&time);
  if (v15)
  {
    fig_log_get_emitter();
    goto LABEL_142;
  }
  os_unfair_lock_lock(p_styleUpdateLock);
  uint64_t v77 = *(void *)&self->_bypassStyleEngineForStandardStyle;
  os_unfair_lock_unlock(p_styleUpdateLock);
  os_unfair_lock_lock((os_unfair_lock_t)&self->_workQueue);
  ++self->_workQueueLock._os_unfair_lock_opaque;
  os_unfair_lock_unlock((os_unfair_lock_t)&self->_workQueue);
  if (time.duration.value) {
    CFRetain((CFTypeRef)time.duration.value);
  }
  uint64_t v6 = &OBJC_IVAR___FigCaptureSessionParsedConfiguration__parsedDepthDataSinkConfigurations;
  id v5 = &OBJC_IVAR___FigCaptureSessionParsedConfiguration__parsedDepthDataSinkConfigurations;
  if (v107)
  {
    CFRetain(v107);
    CFTypeRef v78 = v107;
  }
  else
  {
    CFTypeRef v78 = 0;
  }
  v82 = self->_refinerPrepareQueue;
  v93[0] = MEMORY[0x1E4F143A8];
  v93[1] = 3221225472;
  v93[2] = __66__BWSmartStyleLearningNode_processVideoSampleBuffer_frameEmitted___block_invoke_91;
  v93[3] = &unk_1E5C26E70;
  v93[10] = v78;
  v93[11] = v108;
  v93[4] = self;
  v93[5] = v50;
  v93[6] = currentImageStats;
  v93[7] = v57;
  v93[8] = v77;
  v93[9] = time.duration.value;
  BOOL v94 = v83;
  dispatch_async(v82, v93);
  os_unfair_lock_lock(p_inputStyleContainerSampleBufferQueueLock);
  [(NSMutableArray *)self->_inputStyleContainerSampleBufferQueue removeObject:v88];
  os_unfair_lock_unlock(p_inputStyleContainerSampleBufferQueueLock);
  if (v108)
  {
    os_unfair_lock_lock(&self->_inputMasksSampleBufferQueueLock);
    [(NSMutableArray *)self->_inputMasksSampleBufferQueue removeObject:v50];
    os_unfair_lock_unlock(&self->_inputMasksSampleBufferQueueLock);
  }
  int v8 = &OBJC_IVAR___FigCaptureSessionParsedConfiguration__parsedDepthDataSinkConfigurations;
  int v7 = &OBJC_IVAR___FigCaptureSessionParsedConfiguration__parsedDepthDataSinkConfigurations;
  if (time.duration.value) {
    CFRelease((CFTypeRef)time.duration.value);
  }
LABEL_116:
  if (v109) {
    CFRelease(v109);
  }
  if (v105) {
    CFRelease(v105);
  }
  if (v106) {
    CFRelease(v106);
  }
  if (v107) {
    CFRelease(v107);
  }
  if (v104) {
    CFRelease(v104);
  }
  if (v103) {
    CFRelease(v103);
  }

  objc_super v79 = (os_unfair_lock_s *)((char *)self + v5[893]);
  os_unfair_lock_lock(v79);
  uint64_t v80 = v6[889];
  if ([*(id *)((char *)&self->super.super.isa + v80) count] >= (unint64_t)(*(_DWORD *)((char *)&self->super.super.isa + v8[878])
                                                                                                * (self->_learningRate
                                                                                                 / *(_DWORD *)((char *)&self->super.super.isa + v7[879]))))
    [*(id *)((char *)&self->super.super.isa + v80) removeObjectAtIndex:0];
  os_unfair_lock_unlock(v79);
  return v15;
}

uint64_t __66__BWSmartStyleLearningNode_processVideoSampleBuffer_frameEmitted___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _asynchronouslyRenderSampleBuffer:*(void *)(a1 + 48) outputLinearThumbnailSampleBuffer:*(void *)(a1 + 56) outputUnstyledThumbnailSampleBuffer:*(void *)(a1 + 64) synchronizingEvent:*(void *)(a1 + 40)];
  int v2 = *(const void **)(a1 + 48);
  if (v2) {
    CFRelease(v2);
  }
  uint64_t v3 = *(const void **)(a1 + 56);
  if (v3) {
    CFRelease(v3);
  }
  v4 = *(const void **)(a1 + 64);
  if (v4) {
    CFRelease(v4);
  }
  id v5 = *(void **)(a1 + 32);
  return [v5 _asynchronouslyDecrementRenderCount];
}

uint64_t __66__BWSmartStyleLearningNode_processVideoSampleBuffer_frameEmitted___block_invoke_91(uint64_t a1)
{
  int v2 = *(void **)(a1 + 32);
  if (*(void *)(a1 + 88)) {
    uint64_t v3 = *(void *)(a1 + 40);
  }
  else {
    uint64_t v3 = 0;
  }
  LOBYTE(v8) = *(unsigned char *)(a1 + 96);
  [v2 _asynchronouslyLearnWithContainer:*(void *)(a1 + 72) inputUnstyledSampleBuffer:*(void *)(a1 + 80) withUnrefinedMasks:v3 withStats:*(void *)(a1 + 48) withStatsExtended:*(void *)(a1 + 56) styleToLearn:*(void *)(a1 + 64) shouldBypass:v8];
  v4 = *(const void **)(a1 + 72);
  if (v4) {
    CFRelease(v4);
  }
  id v5 = *(const void **)(a1 + 80);
  if (v5) {
    CFRelease(v5);
  }
  uint64_t v6 = *(void **)(a1 + 32);
  return [v6 _asynchronouslyDecrementLearnCount];
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  char v7 = 0;
  if (!a3 || !a4) {
    goto LABEL_16;
  }
  if (!*(void *)&self->_bypassStyleEngineForStandardStyle) {
    goto LABEL_8;
  }
  if ([(NSArray *)[(BWNode *)self inputs] objectAtIndexedSubscript:1] == a4)
  {
    if (![(BWSmartStyleLearningNode *)self processMaskSampleBuffer:a3]) {
      goto LABEL_8;
    }
LABEL_16:
    fig_log_get_emitter();
    goto LABEL_17;
  }
  if ([(BWSmartStyleLearningNode *)self processVideoSampleBuffer:a3 frameEmitted:&v7])
  {
    fig_log_get_emitter();
LABEL_17:
    FigDebugAssert3();
  }
LABEL_8:
  if (!v7
    && [(NSArray *)[(BWNode *)self inputs] objectAtIndexedSubscript:0] == a4)
  {
    [(BWNodeOutput *)self->super._output emitSampleBuffer:a3];
    os_unfair_lock_lock(&self->_inputStyleContainerSampleBufferQueueLock);
    if ([(NSMutableArray *)self->_inputStyleContainerSampleBufferQueue count] >= (unint64_t)(LODWORD(self->_lastLearnedPortType) * (self->_learningRate / HIDWORD(self->_lastLearnedPortType)))) {
      [(NSMutableArray *)self->_inputStyleContainerSampleBufferQueue removeObjectAtIndex:0];
    }
    os_unfair_lock_unlock(&self->_inputStyleContainerSampleBufferQueueLock);
  }
  os_unfair_lock_lock(&self->_inputMasksSampleBufferQueueLock);
  if ((unint64_t)[(NSMutableArray *)self->_inputMasksSampleBufferQueue count] >= 3) {
    [(NSMutableArray *)self->_inputMasksSampleBufferQueue removeObjectAtIndex:0];
  }
  os_unfair_lock_unlock(&self->_inputMasksSampleBufferQueueLock);
}

- (id)_runInferences:(opaqueCMSampleBuffer *)a3 unstyledSampleBuffer:(opaqueCMSampleBuffer *)a4 withMasks:(id)a5 currentPTS:(id *)a6
{
  v40[2] = *MEMORY[0x1E4F143B8];
  CMSampleBufferRef v35 = 0;
  CMSampleBufferRef v36 = 0;
  CMVideoFormatDescriptionRef formatDescriptionOut = 0;
  CMSampleBufferRef v34 = 0;
  memset(&timingArrayOut, 0, sizeof(timingArrayOut));
  memset(&v31, 0, sizeof(v31));
  uint64_t v10 = *MEMORY[0x1E4F55B20];
  uint64_t v11 = [a5 objectForKeyedSubscript:*MEMORY[0x1E4F55B20]];
  uint64_t v12 = &unk_1E5C29000;
  if (!v11)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v15 = 0;
    uint64_t AttachedMedia = 0;
LABEL_46:
    float v22 = 0;
    goto LABEL_21;
  }
  int v13 = (void *)v11;
  uint64_t AttachedMedia = (const void *)BWSampleBufferGetAttachedMedia(a3, 0x1EFA74880);
  if (!AttachedMedia) {
    goto LABEL_35;
  }
  int v15 = (opaqueCMSampleBuffer *)[v13 objectForKeyedSubscript:@"HumanFullBodiesMask"];
  if (!v15)
  {
    fig_log_get_emitter();
LABEL_45:
    FigDebugAssert3();
    goto LABEL_46;
  }
  uint64_t v29 = v10;
  uint64_t v16 = [v13 objectForKeyedSubscript:@"HumanSkinsMask"];
  if (!v16
    || (uint64_t v17 = v16, v28 = a6, (v18 = [v13 objectForKeyedSubscript:@"HumanHairMask"]) == 0)
    || (v19 = v18, (uint64_t v20 = (opaqueCMSampleBuffer *)[v13 objectForKeyedSubscript:0x1EFA74700]) == 0))
  {
LABEL_35:
    fig_log_get_emitter();
LABEL_43:
    FigDebugAssert3();
    int v15 = 0;
    goto LABEL_46;
  }
  double v21 = v20;
  if (CMSampleBufferGetSampleTimingInfoArray(v20, 1, &timingArrayOut, 0))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v15 = 0;
    float v22 = 0;
    uint64_t v12 = (void *)&unk_1E5C29000;
    goto LABEL_21;
  }
  if (CMSampleBufferGetSampleTimingInfoArray(a4, 1, &v31, 0)) {
    goto LABEL_42;
  }
  BWSampleBufferSetAttachedMedia(AttachedMedia, 0x1EFA6A780, (uint64_t)v15);
  BWSampleBufferSetAttachedMedia(AttachedMedia, 0x1EFA6A7C0, v17);
  BWSampleBufferSetAttachedMedia(AttachedMedia, 0x1EFA6A7A0, v19);
  if ([(BWInferenceScheduler *)self->_inferenceScheduler performInferencesOnSampleBuffer:AttachedMedia attachingResultsToSampleBuffer:AttachedMedia])goto LABEL_42; {
  BWSampleBufferRemoveAttachedMedia(AttachedMedia, 0x1EFA6A780);
  }
  BWSampleBufferRemoveAttachedMedia(AttachedMedia, 0x1EFA6A7C0);
  BWSampleBufferRemoveAttachedMedia(AttachedMedia, 0x1EFA6A7A0);
  int v15 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(AttachedMedia, 0x1EFA6A7E0);
  if (!v15) {
    goto LABEL_44;
  }
  float v22 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(AttachedMedia, 0x1EFA6A820);
  if (!v22) {
    goto LABEL_47;
  }
  CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(v15);
  if (!ImageBuffer)
  {
LABEL_42:
    fig_log_get_emitter();
    goto LABEL_43;
  }
  BOOL v24 = ImageBuffer;
  int v15 = CMSampleBufferGetImageBuffer(v22);
  if (!v15)
  {
LABEL_44:
    fig_log_get_emitter();
    goto LABEL_45;
  }
  float v22 = (opaqueCMSampleBuffer *)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_intermediateVideoFormatsByAttachedMediaKeys, "objectForKeyedSubscript:", 0x1EFA74700), "newPixelBuffer");
  if (v22)
  {
    if (!objc_msgSend((id)-[CMISmartStyleProcessor utilities](self->_smartStyleProcessor, "utilities"), "blitPixelBuffer:toPixelBuffer:", CMSampleBufferGetImageBuffer(v21), v22))
    {
      CFAllocatorRef v25 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      if (!CMVideoFormatDescriptionCreateForImageBuffer((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v24, &formatDescriptionOut))
      {
        CMSampleTimingInfo time = v31;
        if (!BWSampleBufferCreateFromPixelBufferWithTimingInfo(v24, &time, (CFTypeRef *)&formatDescriptionOut, &v36))
        {
          CMSampleTimingInfo time = v31;
          if (!BWSampleBufferCreateFromPixelBufferWithTimingInfo(v15, &time, (CFTypeRef *)&formatDescriptionOut, &v35))
          {
            CMSampleTimingInfo time = timingArrayOut;
            if (!BWSampleBufferCreateFromPixelBufferWithTimingInfo(v22, &time, (CFTypeRef *)&formatDescriptionOut, &v34))
            {
              v39[0] = *MEMORY[0x1E4F530C0];
              *(_OWORD *)&time.duration.CMTimeValue value = *(_OWORD *)&v28->var0;
              time.duration.CMTimeEpoch epoch = v28->var3;
              CFDictionaryRef v26 = CMTimeCopyAsDictionary(&time.duration, v25);
              v39[1] = v29;
              v40[0] = v26;
              v37[0] = @"HumanFullBodiesMask";
              v37[1] = @"HumanSkinsMask";
              v38[0] = v36;
              v38[1] = v35;
              v37[2] = 0x1EFA74700;
              v38[2] = v34;
              v40[1] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:3];
              int v15 = (opaqueCMSampleBuffer *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:2];
              goto LABEL_21;
            }
          }
        }
        fig_log_get_emitter();
        goto LABEL_51;
      }
    }
  }
LABEL_47:
  fig_log_get_emitter();
LABEL_51:
  FigDebugAssert3();
  int v15 = 0;
LABEL_21:
  BWSampleBufferRemoveAttachedMedia(AttachedMedia, 0x1EFA6A7E0);
  BWSampleBufferRemoveAttachedMedia(AttachedMedia, v12[482]);
  BWSampleBufferRemoveAttachedMedia(AttachedMedia, 0x1EFA6A800);
  if (v22) {
    CFRelease(v22);
  }
  if (v36) {
    CFRelease(v36);
  }
  if (v35) {
    CFRelease(v35);
  }
  if (v34) {
    CFRelease(v34);
  }
  if (formatDescriptionOut) {
    CFRelease(formatDescriptionOut);
  }
  return v15;
}

- (int)_findCorrespondingSmartStyleContainerWithMasks:(id)a3 outputSmartStyleContainer:(opaqueCMSampleBuffer *)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  int result = -12784;
  if (!a3 || !a4) {
    return result;
  }
  *a4 = 0;
  memset(&v21, 0, sizeof(v21));
  CMTimeMakeFromDictionary(&v21, (CFDictionaryRef)[a3 objectForKeyedSubscript:*MEMORY[0x1E4F530C0]]);
  if ((v21.flags & 1) == 0)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return -12784;
  }
  int v7 = BYTE6(self->_previousPTS.epoch);
  os_unfair_lock_lock(&self->_inputStyleContainerSampleBufferQueueLock);
  if (!v7)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    inputStyleContainerSampleBufferQueue = self->_inputStyleContainerSampleBufferQueue;
    uint64_t v9 = [(NSMutableArray *)inputStyleContainerSampleBufferQueue countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(inputStyleContainerSampleBufferQueue);
          }
          int v13 = *(opaqueCMSampleBuffer **)(*((void *)&v17 + 1) + 8 * i);
          memset(&v16, 0, sizeof(v16));
          [(BWSmartStyleLearningNode *)self _getSampleBufferPresentationTimeStamp:v13];
          CMTime time = v21;
          double Seconds = CMTimeGetSeconds(&time);
          CMTime time = v16;
          if (vabdd_f64(Seconds, CMTimeGetSeconds(&time)) <= *(float *)&self->_learningMaxFramesPerSecond)
          {
            *a4 = v13;
            goto LABEL_17;
          }
        }
        uint64_t v10 = [(NSMutableArray *)inputStyleContainerSampleBufferQueue countByEnumeratingWithState:&v17 objects:v22 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
    os_unfair_lock_unlock(&self->_inputStyleContainerSampleBufferQueueLock);
    return -12784;
  }
  *a4 = (opaqueCMSampleBuffer *)[(NSMutableArray *)self->_inputStyleContainerSampleBufferQueue lastObject];
LABEL_17:
  os_unfair_lock_unlock(&self->_inputStyleContainerSampleBufferQueueLock);
  return 0;
}

- (int)_loadAndConfigureSmartStyleBundle
{
  uint64_t v3 = NSClassFromString((NSString *)objc_msgSend(NSString, "stringWithFormat:", @"CMISmartStyleV%d", 1));
  self->_smartStyleClass = v3;
  if (v3)
  {
    v4 = BWLoadProcessorBundle(@"SmartStyle", 1);
    if (v4
      && (id v5 = (FigMetalContext *)[objc_alloc(MEMORY[0x1E4F55F60]) initWithoutLibraryUsingOptionalCommandQueue:0], (self->_metalContext = v5) != 0))
    {
      uint64_t v6 = (void *)FigDispatchQueueCreateWithPriority();
      if (v6)
      {
        int v7 = (void *)[(FigMetalContext *)self->_metalContext commandQueue];
        if (v7)
        {
          uint64_t v8 = v7;
          [v7 setSubmissionQueue:v6];
          [v8 setCompletionQueue:v6];
          [v8 setGPUPriority:4];
          uint64_t v9 = (objc_class *)[v4 classNamed:objc_msgSend(NSString, "stringWithFormat:", @"CMISmartStyleProcessorV%d", 1)];
          uint64_t v10 = (CMISmartStyleProcessor *)objc_msgSend([v9 alloc], "initWithOptionalMetalCommandQueue:", -[FigMetalContext commandQueue](self->_metalContext, "commandQueue"));
          self->_smartStyleProcessor = v10;
          if (v10)
          {
            [(CMISmartStyleProcessor *)v10 setInstanceLabel:@"LearningNode"];
            [(CMISmartStyleProcessor *)self->_smartStyleProcessor setUseLiveMetalAllocations:1];
            [(CMISmartStyleProcessor *)self->_smartStyleProcessor setConfiguration:[(objc_class *)v9 getDefaultProcessorConfigurationForStreaming]];
            if ([(CMISmartStyleProcessor *)self->_smartStyleProcessor configuration])
            {
              uint64_t v11 = (objc_class *)[v4 classNamed:objc_msgSend(NSString, "stringWithFormat:", @"CMISmartStyleProcessorInputOutputV%d", 1)];
              self->_smartStyleProcessorInputOutputClass = v11;
              if (v11)
              {

                return 0;
              }
            }
          }
        }
      }
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
    v4 = 0;
  }

  self->_smartStyleProcessor = 0;
  return -12786;
}

- (int)_extractANSTMasks:(opaqueCMSampleBuffer *)a3 forPTS:(id *)a4
{
  v28[2] = *MEMORY[0x1E4F143B8];
  if (a3
    && (uint64_t v8 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a3, @"HumanFullBodiesMask")) != 0
    && (uint64_t v9 = v8, CMSampleBufferGetImageBuffer(v8))
    && (uint64_t v10 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a3, @"HumanHairMask")) != 0
    && (uint64_t v11 = v10, CMSampleBufferGetImageBuffer(v10))
    && (uint64_t v12 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a3, @"HumanSkinsMask")) != 0
    && (int v13 = v12, CMSampleBufferGetImageBuffer(v12)))
  {
    float v14 = self;
    uint64_t AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a3, 0x1EFA74700);
    if (AttachedMedia)
    {
      CMTime v16 = AttachedMedia;
      if (CMSampleBufferGetImageBuffer(AttachedMedia))
      {
        long long v17 = v14;
        p_inputMasksSampleBufferQueueLocuint64_t k = &v14->_inputMasksSampleBufferQueueLock;
        os_unfair_lock_lock(p_inputMasksSampleBufferQueueLock);
        inputMasksSampleBufferQueue = v17->_inputMasksSampleBufferQueue;
        v27[0] = *MEMORY[0x1E4F530C0];
        CFAllocatorRef v20 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
        CMTime time = (CMTime)*a4;
        v28[0] = CMTimeCopyAsDictionary(&time, v20);
        v27[1] = *MEMORY[0x1E4F55B20];
        v25[0] = @"HumanFullBodiesMask";
        v25[1] = @"HumanHairMask";
        v26[0] = v9;
        v26[1] = v11;
        v25[2] = @"HumanSkinsMask";
        v25[3] = 0x1EFA74700;
        v26[2] = v13;
        v26[3] = v16;
        v28[1] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:4];
        -[NSMutableArray addObject:](inputMasksSampleBufferQueue, "addObject:", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:2]);
        os_unfair_lock_unlock(p_inputMasksSampleBufferQueueLock);
        return 0;
      }
    }
    fig_log_get_emitter();
    uint64_t v23 = v4;
    LODWORD(v22) = 0;
    FigDebugAssert3();
    self = v14;
  }
  else
  {
    fig_log_get_emitter();
    uint64_t v23 = v4;
    LODWORD(v22) = 0;
    FigDebugAssert3();
  }
  os_unfair_lock_lock(&self->_inputMasksSampleBufferQueueLock);
  [(NSMutableArray *)self->_inputMasksSampleBufferQueue removeAllObjects];
  os_unfair_lock_unlock(&self->_inputMasksSampleBufferQueueLock);
  return -12780;
}

- (id)_blitMasksToOutputPools:(id)a3 unstyledSampleBuffer:(opaqueCMSampleBuffer *)a4 currentPTS:(id *)a5
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  CFTypeRef cf = 0;
  CMVideoFormatDescriptionRef formatDescriptionOut = 0;
  id v36 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v10 = *MEMORY[0x1E4F55B20];
  uint64_t v11 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F55B20]];
  if (v11 && (uint64_t v12 = (void *)v11, CMGetAttachment(a4, (CFStringRef)*MEMORY[0x1E4F53070], 0)))
  {
    uint64_t v34 = v10;
    CMSampleBufferRef v35 = a5;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v39 objects:v47 count:16];
    CFAllocatorRef v14 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    if (v13)
    {
      uint64_t v15 = v13;
      uint64_t v16 = *(void *)v40;
      while (2)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v40 != v16) {
            objc_enumerationMutation(v12);
          }
          long long v18 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          if (([v18 isEqualToString:@"HumanHairMask"] & 1) == 0)
          {
            memset(&timingArrayOut, 0, sizeof(timingArrayOut));
            long long v19 = (opaqueCMSampleBuffer *)[v12 objectForKeyedSubscript:v18];
            if (!v19) {
              goto LABEL_27;
            }
            CFAllocatorRef v20 = v19;
            CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(v19);
            if (!ImageBuffer) {
              goto LABEL_27;
            }
            CVImageBufferRef v22 = ImageBuffer;
            OSStatus SampleTimingInfoArray = CMSampleBufferGetSampleTimingInfoArray(v20, 1, &timingArrayOut, 0);
            if (SampleTimingInfoArray)
            {
              OSStatus v29 = SampleTimingInfoArray;
              fig_log_get_emitter();
              uint64_t v33 = v5;
              LODWORD(v32) = v29;
              goto LABEL_28;
            }
            uint64_t v24 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_processorVideoFormatsByAttachedMediaKeys, "objectForKeyedSubscript:", v18), "newPixelBuffer");
            if (!v24)
            {
LABEL_27:
              fig_log_get_emitter();
              uint64_t v33 = v5;
              LODWORD(v32) = 0;
              goto LABEL_28;
            }
            CFAllocatorRef v25 = (void *)v24;
            int v26 = objc_msgSend((id)-[CMISmartStyleProcessor utilities](self->_smartStyleProcessor, "utilities"), "blitPixelBuffer:toPixelBuffer:", v22, v24);
            if (v26
              || (int v26 = CMVideoFormatDescriptionCreateForImageBuffer(v14, (CVImageBufferRef)v25, &formatDescriptionOut)) != 0
              || (CMSampleTimingInfo sampleTiming = timingArrayOut,
                  (int v26 = BWSampleBufferCreateFromPixelBufferWithTimingInfo((CVImageBufferRef)v25, &sampleTiming, (CFTypeRef *)&formatDescriptionOut, (CMSampleBufferRef *)&cf)) != 0))
            {
              int v30 = v26;
              fig_log_get_emitter();
              uint64_t v33 = v5;
              LODWORD(v32) = v30;
              FigDebugAssert3();
              CFRelease(v25);
              goto LABEL_30;
            }
            [v36 setObject:cf forKeyedSubscript:v18];
            CFRelease(v25);
            if (formatDescriptionOut) {
              CFRelease(formatDescriptionOut);
            }
            if (cf) {
              CFRelease(cf);
            }
            CFTypeRef cf = 0;
            CMVideoFormatDescriptionRef formatDescriptionOut = 0;
          }
        }
        uint64_t v15 = [v12 countByEnumeratingWithState:&v39 objects:v47 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }
    v45[0] = *MEMORY[0x1E4F530C0];
    *(_OWORD *)&timingArrayOut.duration.CMTimeValue value = *(_OWORD *)&v35->var0;
    timingArrayOut.duration.CMTimeEpoch epoch = v35->var3;
    CFDictionaryRef v27 = CMTimeCopyAsDictionary(&timingArrayOut.duration, v14);
    v45[1] = v34;
    v46[0] = v27;
    v46[1] = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v36];
    int v28 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:v45 count:2];
  }
  else
  {
    fig_log_get_emitter();
    uint64_t v33 = v5;
    LODWORD(v32) = 0;
LABEL_28:
    FigDebugAssert3();
LABEL_30:
    int v28 = 0;
  }
  if (formatDescriptionOut) {
    CFRelease(formatDescriptionOut);
  }
  if (cf) {
    CFRelease(cf);
  }
  objc_msgSend(v36, "removeAllObjects", v32, v33);

  return v28;
}

- (id)_undistortMasks:(id)a3 unstyledSampleBuffer:(opaqueCMSampleBuffer *)a4 currentPTS:(id *)a5 useIntermediatePools:(BOOL)a6
{
  BOOL v7 = a6;
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  CMVideoFormatDescriptionRef formatDescriptionOut = 0;
  CFTypeRef cf = 0;
  memset(&timingArrayOut, 0, sizeof(timingArrayOut));
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v12 = *MEMORY[0x1E4F55B20];
  uint64_t v13 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F55B20]];
  if (v13
    && (CFAllocatorRef v14 = (void *)v13, (v15 = (void *)CMGetAttachment(a4, (CFStringRef)*MEMORY[0x1E4F53070], 0)) != 0)
    && (uint64_t v16 = v15,
        (v46 = -[NSMutableDictionary objectForKeyedSubscript:](self->_intermediatePixelBufferPoolsByAttachedMediaKeys, "objectForKeyedSubscript:", [v15 objectForKeyedSubscript:*MEMORY[0x1E4F54128]])) != 0)&& (CVImageBufferRef v45 = CMSampleBufferGetImageBuffer(a4)) != 0)
  {
    int32x2_t v44 = v16;
    uint64_t v40 = v12;
    long long v41 = a5;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    uint64_t v17 = [v14 countByEnumeratingWithState:&v49 objects:v58 count:16];
    CFAllocatorRef allocator = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v50;
      CFAllocatorRef v20 = &OBJC_IVAR___BWSmartStyleLearningNode__intermediatePixelBufferPoolsByAttachedMediaKeys;
      if (!v7) {
        CFAllocatorRef v20 = &OBJC_IVAR___BWSmartStyleLearningNode__processorPixelBufferPoolsByAttachedMediaKeys;
      }
      uint64_t v43 = v20;
      while (2)
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v50 != v19) {
            objc_enumerationMutation(v14);
          }
          CVImageBufferRef v22 = *(void **)(*((void *)&v49 + 1) + 8 * i);
          if (([v22 isEqualToString:@"HumanHairMask"] & 1) == 0)
          {
            uint64_t v23 = (void *)[*(id *)((char *)&self->super.super.isa + *v43) objectForKeyedSubscript:v22];
            if (!v23)
            {
              fig_log_get_emitter();
              uint64_t v39 = v6;
              LODWORD(v38) = 0;
LABEL_40:
              FigDebugAssert3();
              uint64_t v33 = 0;
              goto LABEL_41;
            }
            uint64_t v24 = (opaqueCMSampleBuffer *)[v14 objectForKeyedSubscript:v22];
            if (!v24)
            {
              fig_log_get_emitter();
              uint64_t v39 = v6;
              LODWORD(v38) = 0;
              goto LABEL_31;
            }
            CFAllocatorRef v25 = v24;
            int v26 = v11;
            CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(v24);
            if (!ImageBuffer)
            {
              fig_log_get_emitter();
              uint64_t v39 = v6;
              LODWORD(v38) = 0;
              goto LABEL_34;
            }
            CVImageBufferRef v28 = ImageBuffer;
            OSStatus SampleTimingInfoArray = CMSampleBufferGetSampleTimingInfoArray(v25, 1, &timingArrayOut, 0);
            if (SampleTimingInfoArray)
            {
              OSStatus v34 = SampleTimingInfoArray;
              fig_log_get_emitter();
              uint64_t v39 = v6;
              LODWORD(v38) = v34;
LABEL_34:
              FigDebugAssert3();
              uint64_t v33 = 0;
              uint64_t v23 = 0;
LABEL_38:
              id v11 = v26;
              goto LABEL_41;
            }
            uint64_t v23 = (void *)[v23 newPixelBuffer];
            if (!v23)
            {
              fig_log_get_emitter();
              uint64_t v39 = v6;
              LODWORD(v38) = 0;
LABEL_37:
              FigDebugAssert3();
              uint64_t v33 = 0;
              goto LABEL_38;
            }
            int v30 = objc_msgSend((id)-[CMISmartStyleProcessor utilities](self->_smartStyleProcessor, "utilities"), "undistortMask:inputPixelBuffer:inputMetadata:cameraInfo:toPixelBuffer:", v28, v45, v44, v46, v23);
            if (v30)
            {
              int v35 = v30;
              fig_log_get_emitter();
              uint64_t v39 = v6;
              LODWORD(v38) = v35;
              goto LABEL_37;
            }
            id v11 = v26;
            if (!formatDescriptionOut
              && (int v31 = CMVideoFormatDescriptionCreateForImageBuffer(allocator, (CVImageBufferRef)v23, &formatDescriptionOut)) != 0|| (time = timingArrayOut, (int v31 = BWSampleBufferCreateFromPixelBufferWithTimingInfo((CVImageBufferRef)v23, &time, (CFTypeRef *)&formatDescriptionOut, (CMSampleBufferRef *)&cf)) != 0))
            {
              int v36 = v31;
              fig_log_get_emitter();
              uint64_t v39 = v6;
              LODWORD(v38) = v36;
              goto LABEL_40;
            }
            [v26 setObject:cf forKeyedSubscript:v22];
            CFRelease(v23);
            if (cf) {
              CFRelease(cf);
            }
            CFTypeRef cf = 0;
          }
        }
        uint64_t v18 = [v14 countByEnumeratingWithState:&v49 objects:v58 count:16];
        if (v18) {
          continue;
        }
        break;
      }
    }
    v56[0] = *MEMORY[0x1E4F530C0];
    *(_OWORD *)&time.duration.CMTimeValue value = *(_OWORD *)&v41->var0;
    time.duration.CMTimeEpoch epoch = v41->var3;
    CFDictionaryRef v32 = CMTimeCopyAsDictionary(&time.duration, allocator);
    v56[1] = v40;
    v57[0] = v32;
    v57[1] = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v11];
    uint64_t v33 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:v56 count:2];
  }
  else
  {
    fig_log_get_emitter();
    uint64_t v39 = v6;
    LODWORD(v38) = 0;
LABEL_31:
    FigDebugAssert3();
    uint64_t v33 = 0;
  }
  uint64_t v23 = 0;
LABEL_41:
  objc_msgSend(v11, "removeAllObjects", v38, v39);
  if (v11) {
    CFRelease(v11);
  }
  if (v23) {
    CFRelease(v23);
  }
  if (cf) {
    CFRelease(cf);
  }
  if (formatDescriptionOut) {
    CFRelease(formatDescriptionOut);
  }
  return v33;
}

- (int)_createCoefficientsFromSampleBuffer:(opaqueCMSampleBuffer *)a3 to:(opaqueCMSampleBuffer *)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  CFTypeRef v18 = 0;
  CMSampleBufferRef v19 = 0;
  memset(&timingArrayOut, 0, sizeof(timingArrayOut));
  CMTimeValue value = *MEMORY[0x1E4F1FA48];
  CMTimeFlags flags = *(_DWORD *)(MEMORY[0x1E4F1FA48] + 12);
  CMTimeScale timescale = *(_DWORD *)(MEMORY[0x1E4F1FA48] + 8);
  CMTimeEpoch epoch = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  uint64_t v6 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (!a3 || !a4)
  {
    fig_log_get_emitter();
LABEL_28:
    FigDebugAssert3();
    goto LABEL_29;
  }
  uint64_t v8 = self;
  *a4 = 0;
  if (!self)
  {
    CMTimeFlags flags = 0;
    CMTimeEpoch epoch = 0;
    CMTimeScale timescale = 0;
    CMTimeValue value = 0;
LABEL_15:
    int v14 = -12780;
    goto LABEL_16;
  }
  -[BWSmartStyleLearningNode _getSampleBufferPresentationTimeStamp:](self, "_getSampleBufferPresentationTimeStamp:");
  CMTimeEpoch epoch = time.duration.epoch;
  CMTimeValue value = time.duration.value;
  CMTimeFlags flags = time.duration.flags;
  CMTimeScale timescale = time.duration.timescale;
  if ((time.duration.flags & 1) == 0)
  {
LABEL_29:
    uint64_t v8 = 0;
    goto LABEL_15;
  }
  if (*v6 == 1)
  {
    time.duration.CMTimeValue value = value;
    time.duration.CMTimeScale timescale = timescale;
    CMTimeGetSeconds(&time.duration);
    kdebug_trace();
  }
  id v10 = [(BWNodeOutput *)v8->super._output mediaPropertiesForAttachedMediaKey:0x1EFA74840];
  if (!v10)
  {
    fig_log_get_emitter();
    goto LABEL_28;
  }
  uint64_t v8 = (BWSmartStyleLearningNode *)objc_msgSend((id)objc_msgSend(v10, "livePixelBufferPool"), "newPixelBuffer");
  if (v8)
  {
    OSStatus SampleTimingInfoArray = CMSampleBufferGetSampleTimingInfoArray(a3, 1, &timingArrayOut, 0);
    if (SampleTimingInfoArray)
    {
      int v14 = SampleTimingInfoArray;
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    else
    {
      CMSampleTimingInfo time = timingArrayOut;
      int v12 = BWSampleBufferCreateFromPixelBufferWithTimingInfo((CVImageBufferRef)v8, &time, &v18, &v19);
      if (v12)
      {
        int v14 = v12;
      }
      else
      {
        uint64_t v13 = v19;
        if (v19) {
          uint64_t v13 = (opaqueCMSampleBuffer *)CFRetain(v19);
        }
        int v14 = 0;
        *a4 = v13;
      }
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v14 = -12786;
  }
LABEL_16:
  if (*v6 == 1)
  {
    time.duration.CMTimeValue value = value;
    time.duration.CMTimeScale timescale = timescale;
    time.duration.CMTimeFlags flags = flags;
    time.duration.CMTimeEpoch epoch = epoch;
    CMTimeGetSeconds(&time.duration);
    kdebug_trace();
  }
  if (v19) {
    CFRelease(v19);
  }
  if (v8) {
    CFRelease(v8);
  }
  if (v18) {
    CFRelease(v18);
  }
  return v14;
}

- (int)_createIdentityCoefficientsFromSampleBuffer:(opaqueCMSampleBuffer *)a3 to:(opaqueCMSampleBuffer *)a4
{
  CFTypeRef v18 = 0;
  CMSampleBufferRef v19 = 0;
  memset(&timingArrayOut, 0, sizeof(timingArrayOut));
  if (!a3 || !a4)
  {
    fig_log_get_emitter();
LABEL_25:
    FigDebugAssert3();
LABEL_26:
    uint64_t v13 = 0;
    int v10 = -12780;
    goto LABEL_14;
  }
  *a4 = 0;
  if (!self) {
    goto LABEL_26;
  }
  -[BWSmartStyleLearningNode _getSampleBufferPresentationTimeStamp:](self, "_getSampleBufferPresentationTimeStamp:");
  if ((sampleTiming.duration.flags & 1) == 0) {
    goto LABEL_26;
  }
  OSStatus SampleTimingInfoArray = CMSampleBufferGetSampleTimingInfoArray(a3, 1, &timingArrayOut, 0);
  if (SampleTimingInfoArray)
  {
    int v10 = SampleTimingInfoArray;
    fig_log_get_emitter();
LABEL_28:
    FigDebugAssert3();
    goto LABEL_29;
  }
  identityCoefficientsPixelBuffer = self->_identityCoefficientsPixelBuffer;
  if (identityCoefficientsPixelBuffer) {
    goto LABEL_9;
  }
  id v9 = [(BWNodeOutput *)self->super._output mediaPropertiesForAttachedMediaKey:0x1EFA74840];
  if (!v9)
  {
    fig_log_get_emitter();
    goto LABEL_25;
  }
  self->_identityCoefficientsPixelBuffer = (__CVBuffer *)objc_msgSend((id)objc_msgSend(v9, "livePixelBufferPool"), "newPixelBuffer");
  int v10 = objc_msgSend((id)-[CMISmartStyleProcessor utilities](self->_smartStyleProcessor, "utilities"), "createIdentityTransformCoefficients:", self->_identityCoefficientsPixelBuffer);
  identityCoefficientsPixelBuffer = self->_identityCoefficientsPixelBuffer;
  if (!identityCoefficientsPixelBuffer)
  {
    fig_log_get_emitter();
    goto LABEL_28;
  }
LABEL_9:
  CMSampleTimingInfo sampleTiming = timingArrayOut;
  int v11 = BWSampleBufferCreateFromPixelBufferWithTimingInfo(identityCoefficientsPixelBuffer, &sampleTiming, &v18, &v19);
  if (v11)
  {
    int v10 = v11;
LABEL_29:
    uint64_t v13 = 0;
    goto LABEL_14;
  }
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v13 = v12;
  if (v12)
  {
    [v12 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F534E8]];
    CMSetAttachment(v19, (CFStringRef)*MEMORY[0x1E4F53070], v13, 1u);
    int v14 = v19;
    if (v19) {
      int v14 = (opaqueCMSampleBuffer *)CFRetain(v19);
    }
    int v10 = 0;
    *a4 = v14;
  }
  else
  {
    int v10 = -12786;
  }
LABEL_14:
  if (v19) {
    CFRelease(v19);
  }
  if (v18) {
    CFRelease(v18);
  }

  return v10;
}

- (int)_runFalsePositiveRejectionOnPixelBuffer:(__CVBuffer *)a3 unrefinedPixelBuffer:(__CVBuffer *)a4
{
  if (a3)
  {
    int v4 = (int)a4;
    if (!a4
      || (int v4 = objc_msgSend((id)-[CMISmartStyleProcessor utilities](self->_smartStyleProcessor, "utilities"), "runFPRejectionOnMask:originalMask:", a3, a4)) != 0)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
  return v4;
}

- (int)_createSmartStyleContainerFromSampleBuffer:(opaqueCMSampleBuffer *)a3 unstyledThumbnailSampleBuffer:(opaqueCMSampleBuffer *)a4 linearThumbnailSampleBuffer:(opaqueCMSampleBuffer *)a5 to:(opaqueCMSampleBuffer *)a6
{
  CMAttachmentBearerRef target = 0;
  int v6 = -12780;
  if (a3 && a4 && a5 && a6)
  {
    *a6 = 0;
    CFStringRef v11 = (const __CFString *)*MEMORY[0x1E4F53070];
    CFTypeRef v12 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
    if (!v12)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      return 0;
    }
    uint64_t v13 = v12;
    memset(&timingArrayOut, 0, sizeof(timingArrayOut));
    OSStatus SampleTimingInfoArray = CMSampleBufferGetSampleTimingInfoArray(a3, 1, &timingArrayOut, 0);
    if (SampleTimingInfoArray)
    {
      int v6 = SampleTimingInfoArray;
      fig_log_get_emitter();
      FigDebugAssert3();
      return v6;
    }
    OSStatus v15 = CMSampleBufferCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 1u, 0, 0, 0, 0, 1, &timingArrayOut, 0, 0, (CMSampleBufferRef *)&target);
    CMAttachmentBearerRef v16 = target;
    if (v15)
    {
      int v6 = -12786;
      if (!target) {
        return v6;
      }
      goto LABEL_12;
    }
    CMSetAttachment(target, v11, v13, 1u);
    BWSampleBufferSetAttachedMedia(target, 0x1EFA748A0, (uint64_t)a4);
    BWSampleBufferSetAttachedMedia(target, 0x1EFA748E0, (uint64_t)a5);
    CMAttachmentBearerRef v16 = target;
    if (target)
    {
      uint64_t v17 = (opaqueCMSampleBuffer *)CFRetain(target);
      CMAttachmentBearerRef v16 = target;
    }
    else
    {
      uint64_t v17 = 0;
    }
    int v6 = 0;
    *a6 = v17;
    if (v16) {
LABEL_12:
    }
      CFRelease(v16);
  }
  return v6;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_getSampleBufferPresentationTimeStamp:(SEL)a3
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(void *)&MEMORY[0x1E4F1F9F8];
  if (a4)
  {
    int v6 = (void *)CMGetAttachment(a4, (CFStringRef)*MEMORY[0x1E4F53070], 0);
    if (v6 && (BOOL v7 = v6, v8 = *MEMORY[0x1E4F530C0], [v6 objectForKeyedSubscript:*MEMORY[0x1E4F530C0]])) {
      int result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMakeFromDictionary(&v10, (CFDictionaryRef)[v7 objectForKeyedSubscript:v8]);
    }
    else {
      int result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMSampleBufferGetPresentationTimeStamp(&v10, a4);
    }
    *(CMTime *)retstr = v10;
  }
  else
  {
    fig_log_get_emitter();
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)FigDebugAssert3();
  }
  return result;
}

- (opaqueCMSampleBuffer)_unpackSbufFromPrimaryCameraStream:(opaqueCMSampleBuffer *)a3
{
  uint64_t v3 = a3;
  uint64_t AttachedMedia = BWSampleBufferGetAttachedMedia(a3, @"SynchronizedSlaveFrame");
  if (AttachedMedia)
  {
    uint64_t v5 = (const void *)AttachedMedia;
    CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F53070];
    BOOL v7 = (void *)CMGetAttachment(v3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
    uint64_t v8 = (void *)CMGetAttachment(v5, v6, 0);
    uint64_t v9 = *MEMORY[0x1E4F542E0];
    if ((objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E4F542E0]), "BOOLValue") & 1) == 0)
    {
      if (objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", v9), "BOOLValue")) {
        return (opaqueCMSampleBuffer *)v5;
      }
    }
  }
  return v3;
}

- (void)_updateCurrentSmartStyleMetadata:(id)a3 onSbuf:(opaqueCMSampleBuffer *)a4
{
  CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F53070];
  BOOL v7 = (void *)CMGetAttachment(a4, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  uint64_t v8 = *MEMORY[0x1E4F534C8];
  [v7 setObject:a3 forKeyedSubscript:*MEMORY[0x1E4F534C8]];
  uint64_t AttachedMedia = (const void *)BWSampleBufferGetAttachedMedia(a4, @"SynchronizedSlaveFrame");
  if (AttachedMedia)
  {
    CMTime v10 = (void *)CMGetAttachment(AttachedMedia, v6, 0);
    [v10 setObject:a3 forKeyedSubscript:v8];
  }
}

- (int)_initVMRefinerInference
{
  *(_DWORD *)&self->_gdcAttachmentsEnabled = 0;
  uint64_t v3 = objc_alloc_init(BWInferenceScheduler);
  *(void *)&self->_inferenceLock._uint32_t os_unfair_lock_opaque = v3;
  if (v3
    && (v4 = [[BWInferenceEngine alloc] initWithScheduler:*(void *)&self->_inferenceLock._os_unfair_lock_opaque priority:6], (self->_inferenceScheduler = (BWInferenceScheduler *)v4) != 0)&& (uint64_t v5 = [[BWInferenceConfiguration alloc] initWithInferenceType:118], [(BWInferenceConfiguration *)v5 setPriority:6], v5))
  {
    if ([(BWInferenceScheduler *)self->_inferenceScheduler addInferenceOfType:118 version:BWInferenceVersionMakeMajor(1) & 0xFFFFFFFFFFFFLL configuration:v5])
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      return -12780;
    }
    else
    {
      CFStringRef v6 = (BWVideoFormat *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      self->_anstMaskVideoFormat = v6;
      if (!v6)
      {
        fig_log_get_emitter();
        FigDebugAssert3();
      }
      return 0;
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return -12786;
  }
}

- (int)_getContainerAssetsFromSampleBuffer:(opaqueCMSampleBuffer *)a3 outputUnstyledThumbnailSampleBuffer:(opaqueCMSampleBuffer *)a4 outputLinearThumbnailSampleBuffer:(opaqueCMSampleBuffer *)a5
{
  memset(&timingArrayOut, 0, sizeof(timingArrayOut));
  CFTypeRef cf = 0;
  CFTypeRef v20 = 0;
  if (!a3 || !a4 || !a5)
  {
    fig_log_get_emitter();
LABEL_34:
    FigDebugAssert3();
LABEL_35:
    int v16 = -12780;
    goto LABEL_25;
  }
  *a4 = 0;
  *a5 = 0;
  if (!self) {
    goto LABEL_35;
  }
  -[BWSmartStyleLearningNode _getSampleBufferPresentationTimeStamp:](self, "_getSampleBufferPresentationTimeStamp:");
  if ((sampleTiming.duration.flags & 1) == 0) {
    goto LABEL_35;
  }
  OSStatus SampleTimingInfoArray = CMSampleBufferGetSampleTimingInfoArray(a3, 1, &timingArrayOut, 0);
  if (SampleTimingInfoArray)
  {
    int v16 = SampleTimingInfoArray;
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_25;
  }
  if (!CMSampleBufferGetImageBuffer(a3))
  {
    fig_log_get_emitter();
    goto LABEL_34;
  }
  CMTime v10 = (__CVBuffer *)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_processorVideoFormatsByAttachedMediaKeys, "objectForKeyedSubscript:", 0x1EFA748A0), "newPixelBuffer");
  if (!v10) {
    goto LABEL_36;
  }
  CFStringRef v11 = v10;
  CMSampleTimingInfo sampleTiming = timingArrayOut;
  int v12 = BWSampleBufferCreateFromPixelBufferWithTimingInfo(v10, &sampleTiming, &v20, (CMSampleBufferRef *)&cf);
  if (v12)
  {
LABEL_30:
    int v16 = v12;
    CFRelease(v11);
    goto LABEL_25;
  }
  uint64_t v13 = (opaqueCMSampleBuffer *)cf;
  if (cf) {
    uint64_t v13 = (opaqueCMSampleBuffer *)CFRetain(cf);
  }
  *a4 = v13;
  CFRelease(v11);
  if (v20)
  {
    CFRelease(v20);
    CFTypeRef v20 = 0;
  }
  if (cf)
  {
    CFRelease(cf);
    CFTypeRef cf = 0;
  }
  int v14 = (__CVBuffer *)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_processorVideoFormatsByAttachedMediaKeys, "objectForKeyedSubscript:", 0x1EFA748E0), "newPixelBuffer");
  if (!v14)
  {
LABEL_36:
    fig_log_get_emitter();
    FigDebugAssert3();
    int v16 = -12786;
    goto LABEL_25;
  }
  CFStringRef v11 = v14;
  CMSampleTimingInfo sampleTiming = timingArrayOut;
  int v12 = BWSampleBufferCreateFromPixelBufferWithTimingInfo(v14, &sampleTiming, &v20, (CMSampleBufferRef *)&cf);
  if (v12) {
    goto LABEL_30;
  }
  OSStatus v15 = (opaqueCMSampleBuffer *)cf;
  if (cf) {
    OSStatus v15 = (opaqueCMSampleBuffer *)CFRetain(cf);
  }
  *a5 = v15;
  CFRelease(v11);
  if (v20)
  {
    CFRelease(v20);
    CFTypeRef v20 = 0;
  }
  if (cf)
  {
    CFRelease(cf);
    int v16 = 0;
    CFTypeRef cf = 0;
  }
  else
  {
    int v16 = 0;
  }
LABEL_25:
  if (v20) {
    CFRelease(v20);
  }
  if (cf) {
    CFRelease(cf);
  }
  return v16;
}

- (void)_asynchronouslyRenderSampleBuffer:(opaqueCMSampleBuffer *)a3 outputLinearThumbnailSampleBuffer:(opaqueCMSampleBuffer *)a4 outputUnstyledThumbnailSampleBuffer:(opaqueCMSampleBuffer *)a5 synchronizingEvent:(id)a6
{
  if (!a3
    || !a4
    || !a5
    || (uint64_t AttachedMedia = BWSampleBufferGetAttachedMedia(a3, 0x1EFA68BE0),
        int v12 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a3, 0x1EFA74960),
        (CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(a3)) == 0)
    || (int v14 = ImageBuffer, (v15 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0)) == 0))
  {
    fig_log_get_emitter();
LABEL_45:
    FigDebugAssert3();
    return;
  }
  int v16 = v15;
  sbuf = (opaqueCMSampleBuffer *)AttachedMedia;
  if (self->_generateCoefficients)
  {
    uint64_t v17 = (void *)[v15 objectForKeyedSubscript:*MEMORY[0x1E4F54128]];
    unsigned int v44 = [v17 isEqualToString:*MEMORY[0x1E4F52DE8]];
  }
  else
  {
    unsigned int v44 = 0;
  }
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v52 = 0u;
  CFTypeRef v18 = (CFStringRef *)MEMORY[0x1E4F24A90];
  if (v12)
  {
    CMSampleBufferRef v19 = CMSampleBufferGetImageBuffer(v12);
    unsigned int v20 = v44;
    if (!v19) {
      unsigned int v20 = 0;
    }
    unsigned int v43 = v20;
    if (v20 == 1
      && objc_msgSend(MEMORY[0x1E4F55EB0], "getGDCParams:cameraInfo:metadata:", &v52, -[NSMutableDictionary objectForKeyedSubscript:](self->_intermediatePixelBufferPoolsByAttachedMediaKeys, "objectForKeyedSubscript:", objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E4F54128])), v16))
    {
      goto LABEL_44;
    }
    CFStringRef v21 = *v18;
    CFTypeRef v22 = CVBufferCopyAttachment(v14, *v18, 0);
    CVBufferSetAttachment(v19, v21, v22, kCVAttachmentMode_ShouldPropagate);
    if (v22) {
      CFRelease(v22);
    }
    CFStringRef v23 = (const __CFString *)*MEMORY[0x1E4F24BC8];
    CFTypeRef v24 = CVBufferCopyAttachment(v14, (CFStringRef)*MEMORY[0x1E4F24BC8], 0);
    CVBufferSetAttachment(v19, v23, v24, kCVAttachmentMode_ShouldPropagate);
    if (v24) {
      CFRelease(v24);
    }
    CFStringRef v25 = (const __CFString *)*MEMORY[0x1E4F24C18];
    CFTypeRef v26 = CVBufferCopyAttachment(v14, (CFStringRef)*MEMORY[0x1E4F24C18], 0);
    CVBufferSetAttachment(v19, v25, v26, kCVAttachmentMode_ShouldPropagate);
    if (v26) {
      CFRelease(v26);
    }
    int v14 = v19;
  }
  else
  {
    unsigned int v43 = 0;
  }
  CVImageBufferRef v27 = CMSampleBufferGetImageBuffer(a5);
  if (!v27)
  {
LABEL_44:
    fig_log_get_emitter();
    goto LABEL_45;
  }
  CVImageBufferRef v28 = v27;
  OSStatus v29 = (void *)[(CMISmartStyleProcessor *)self->_smartStyleProcessor utilities];
  long long v49 = v56;
  long long v50 = v57;
  long long v51 = v58;
  long long v45 = v52;
  long long v46 = v53;
  long long v47 = v54;
  long long v48 = v55;
  if ([v29 downScalePixelBuffer:v14 toPixelBuffer:v28 propagateAttachments:1 gdcParams:&v45 applyGDC:v43]|| (CVImageBufferRef v30 = CMSampleBufferGetImageBuffer(a4)) == 0)
  {
LABEL_41:
    fig_log_get_emitter();
    goto LABEL_45;
  }
  int v31 = v30;
  CFStringRef v32 = *v18;
  CFTypeRef v33 = CVBufferCopyAttachment(v28, *v18, 0);
  CFStringRef v34 = (const __CFString *)*MEMORY[0x1E4F24C18];
  CFTypeRef v35 = CVBufferCopyAttachment(v28, (CFStringRef)*MEMORY[0x1E4F24C18], 0);
  CVBufferSetAttachment(v31, v32, v33, kCVAttachmentMode_ShouldPropagate);
  CVBufferSetAttachment(v31, (CFStringRef)*MEMORY[0x1E4F24BC8], (CFTypeRef)*MEMORY[0x1E4F24BE8], kCVAttachmentMode_ShouldPropagate);
  CVBufferSetAttachment(v31, v34, v35, kCVAttachmentMode_ShouldPropagate);
  if (v33) {
    CFRelease(v33);
  }
  if (v35) {
    CFRelease(v35);
  }
  if (sbuf)
  {
    CVImageBufferRef v36 = CMSampleBufferGetImageBuffer(sbuf);
    if (v36)
    {
      CVImageBufferRef v37 = v36;
      uint64_t v38 = (void *)[(CMISmartStyleProcessor *)self->_smartStyleProcessor utilities];
      int v39 = objc_msgSend(v38, "createLinearThumbnailFromMetadata:preLTMThumbnailPixelBuffer:postLTMThumbnailPixelBuffer:cameraInfo:applyGDC:cropToPreLTMBounds:toPixelBuffer:", v16, v37, v28, -[NSMutableDictionary objectForKeyedSubscript:](self->_intermediatePixelBufferPoolsByAttachedMediaKeys, "objectForKeyedSubscript:", objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E4F54128])), v44, 0, v31);
      goto LABEL_35;
    }
    goto LABEL_41;
  }
  uint64_t v40 = [v16 objectForKeyedSubscript:*MEMORY[0x1E4F54018]];
  long long v41 = (void *)[(CMISmartStyleProcessor *)self->_smartStyleProcessor utilities];
  if (v40)
  {
    int v39 = objc_msgSend(v41, "createLinearThumbnailFromMetadata:postLTMThumbnailPixelBuffer:cameraInfo:applyGDC:cropToPreLTMBounds:toPixelBuffer:", v16, v28, -[NSMutableDictionary objectForKeyedSubscript:](self->_intermediatePixelBufferPoolsByAttachedMediaKeys, "objectForKeyedSubscript:", objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E4F54128])), v44, 0, v31);
  }
  else
  {
    long long v49 = v56;
    long long v50 = v57;
    long long v51 = v58;
    long long v45 = v52;
    long long v46 = v53;
    long long v47 = v54;
    long long v48 = v55;
    int v39 = [v41 downScalePixelBuffer:v14 toPixelBuffer:v31 propagateAttachments:1 gdcParams:&v45 applyGDC:v43];
  }
LABEL_35:
  if (a6)
  {
    if (!v39) {
      -[BWSmartStyleLearningNode _asynchronouslySignalEvent:](self, "_asynchronouslySignalEvent:");
    }
  }
}

- (void)_asynchronouslyLearnWithContainer:(opaqueCMSampleBuffer *)a3 inputUnstyledSampleBuffer:(opaqueCMSampleBuffer *)a4 withUnrefinedMasks:(id)a5 withStats:(id)a6 withStatsExtended:(id)a7 styleToLearn:(id)a8 shouldBypass:(BOOL)a9
{
  uint64_t v167 = *MEMORY[0x1E4F143B8];
  CFTypeRef v163 = 0;
  CMSampleBufferRef v164 = 0;
  CMSampleBufferRef v162 = 0;
  uint64_t v15 = MEMORY[0x1E4F1FA48];
  uint64_t v165 = *MEMORY[0x1E4F1FA48];
  unsigned int v166 = *(_DWORD *)(MEMORY[0x1E4F1FA48] + 8);
  long long v16 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
  long long v160 = *MEMORY[0x1E4F1DB20];
  long long v161 = v16;
  id v145 = a5;
  id v17 = a5;
  CFTypeRef v18 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (!a3)
  {
    unsigned int v20 = *(_DWORD *)(v15 + 12);
    uint64_t v19 = *(void *)(v15 + 16);
    fig_log_get_emitter();
    FigDebugAssert3();
LABEL_173:
    CFTypeRef cf = 0;
    CMSampleBufferRef sbufa = 0;
    CFTypeRef v26 = 0;
    CVImageBufferRef v27 = 0;
    a8 = 0;
LABEL_200:
    LOBYTE(ImageBuffer) = 0;
    goto LABEL_153;
  }
  if (!self)
  {
    a3 = 0;
    CFTypeRef cf = 0;
    CMSampleBufferRef sbufa = 0;
    uint64_t v19 = 0;
    unsigned int v20 = 0;
    CFTypeRef v26 = 0;
    CVImageBufferRef v27 = 0;
    a8 = 0;
    LOBYTE(ImageBuffer) = 0;
    unsigned int v166 = 0;
    uint64_t v165 = 0;
    goto LABEL_153;
  }
  [(BWSmartStyleLearningNode *)self _getSampleBufferPresentationTimeStamp:a3];
  uint64_t v19 = *(void *)&time[16];
  uint64_t v165 = *(void *)time;
  unsigned int v20 = *(_DWORD *)&time[12];
  unsigned int v166 = *(_DWORD *)&time[8];
  if ((time[12] & 1) == 0)
  {
    a3 = 0;
    goto LABEL_173;
  }
  if (*v18 == 1)
  {
    *(void *)CMSampleTimingInfo time = v165;
    *(_DWORD *)&time[8] = v166;
    CMTimeGetSeconds((CMTime *)time);
    kdebug_trace();
  }
  unsigned int v141 = v20;
  CFTypeRef v21 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  if (!v21)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    a3 = 0;
    CMSampleBufferRef sbufa = 0;
    CFTypeRef v26 = 0;
    CVImageBufferRef v27 = 0;
    a8 = 0;
LABEL_176:
    CFTypeRef cf = 0;
    LOBYTE(ImageBuffer) = 0;
    goto LABEL_42;
  }
  if (!a8)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    a3 = 0;
    CMSampleBufferRef sbufa = 0;
    CFTypeRef v26 = 0;
    CVImageBufferRef v27 = 0;
    goto LABEL_176;
  }
  CFTypeRef v22 = (void *)v21;
  v132 = a3;
  id v133 = a8;
  id v130 = a6;
  uint64_t AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a4, 0x1EFA74960);
  CFTypeRef v24 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a4, 0x1EFA68BE0);
  uint64_t v139 = v19;
  v134 = v24;
  if (v24)
  {
    CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(v24);
    if (!ImageBuffer)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      a3 = 0;
      CFTypeRef cf = 0;
      CMSampleBufferRef sbufa = 0;
      CFTypeRef v26 = 0;
      CVImageBufferRef v27 = 0;
      a8 = 0;
LABEL_210:
      CFTypeRef v18 = (_DWORD *)MEMORY[0x1E4F1EBA8];
      goto LABEL_42;
    }
    objc_msgSend((id)-[CMISmartStyleProcessor utilities](self->_smartStyleProcessor, "utilities"), "getPreLTMValidROIFromMetadata:inputPreLTMThumbnailPixelBuffer:outputRect:", v22, ImageBuffer, &v160);
  }
  else
  {
    long long v160 = 0uLL;
    __asm { FMOV            V0.2D, #1.0 }
    long long v161 = _Q0;
  }
  CFTypeRef v33 = CMSampleBufferGetImageBuffer(a4);
  if (self->_generateCoefficients)
  {
    CFStringRef v34 = (void *)[v22 objectForKeyedSubscript:*MEMORY[0x1E4F54128]];
    uint64_t v35 = [v34 isEqualToString:*MEMORY[0x1E4F52DE8]];
  }
  else
  {
    uint64_t v35 = 0;
  }
  id v128 = a7;
  long long v158 = 0u;
  long long v159 = 0u;
  long long v156 = 0u;
  long long v157 = 0u;
  long long v154 = 0u;
  long long v155 = 0u;
  long long v153 = 0u;
  CVImageBufferRef v36 = (CFStringRef *)MEMORY[0x1E4F24A90];
  CVImageBufferRef v37 = (CFStringRef *)MEMORY[0x1E4F24BC8];
  v136 = v22;
  v129 = AttachedMedia;
  if (AttachedMedia)
  {
    uint64_t v38 = CMSampleBufferGetImageBuffer(AttachedMedia);
    if (v38) {
      unsigned int v39 = v35;
    }
    else {
      unsigned int v39 = 0;
    }
    unsigned int v137 = v39;
    if (v39 == 1)
    {
      uint64_t v40 = (void *)MEMORY[0x1E4F55EB0];
      uint64_t v41 = -[NSMutableDictionary objectForKeyedSubscript:](self->_intermediatePixelBufferPoolsByAttachedMediaKeys, "objectForKeyedSubscript:", [v22 objectForKeyedSubscript:*MEMORY[0x1E4F54128]]);
      CVImageBufferRef v36 = (CFStringRef *)MEMORY[0x1E4F24A90];
      if ([v40 getGDCParams:&v153 cameraInfo:v41 metadata:v22])
      {
        fig_log_get_emitter();
        FigDebugAssert3();
        a3 = 0;
        CMSampleBufferRef sbufa = 0;
        CFTypeRef v26 = 0;
        goto LABEL_190;
      }
    }
    CFStringRef v42 = *v36;
    CFTypeRef v43 = CVBufferCopyAttachment(v33, *v36, 0);
    CVBufferSetAttachment(v38, v42, v43, kCVAttachmentMode_ShouldPropagate);
    if (v43) {
      CFRelease(v43);
    }
    CFStringRef v44 = *v37;
    CFTypeRef v45 = CVBufferCopyAttachment(v33, *v37, 0);
    CVBufferSetAttachment(v38, v44, v45, kCVAttachmentMode_ShouldPropagate);
    if (v45) {
      CFRelease(v45);
    }
    CFTypeRef v33 = v38;
    CFTypeRef v22 = v136;
  }
  else
  {
    unsigned int v137 = 0;
  }
  objc_msgSend((id)-[CMISmartStyleProcessor configuration](self->_smartStyleProcessor, "configuration"), "intermediateStyleRendererThumbnailSize");
  double v47 = v46;
  double v49 = v48;
  objc_msgSend((id)objc_msgSend((id)-[CMISmartStyleProcessor configuration](self->_smartStyleProcessor, "configuration"), "styleEngineConfiguration"), "thumbnailSize");
  if (v47 == v51 && v49 == v50)
  {
    CFTypeRef v26 = 0;
    goto LABEL_32;
  }
  CFTypeRef v26 = (__CVBuffer *)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_intermediateVideoFormatsByAttachedMediaKeys, "objectForKeyedSubscript:", 0x1EFA74880), "newPixelBuffer");
  if (!v26)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    a3 = 0;
    CMSampleBufferRef sbufa = 0;
LABEL_190:
    CVImageBufferRef v27 = 0;
    a8 = 0;
    CFTypeRef cf = 0;
    goto LABEL_191;
  }
LABEL_32:
  a8 = (id)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_intermediateVideoFormatsByAttachedMediaKeys, "objectForKeyedSubscript:", 0x1EFA748A0), "newPixelBuffer");
  CFTypeRef cf = v26;
  if (!a8)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    a3 = 0;
    CMSampleBufferRef sbufa = 0;
    CFTypeRef v26 = 0;
    CVImageBufferRef v27 = 0;
LABEL_191:
    LOBYTE(ImageBuffer) = 0;
    CFTypeRef v18 = (_DWORD *)MEMORY[0x1E4F1EBA8];
    uint64_t v19 = v139;
    unsigned int v20 = v141;
    goto LABEL_153;
  }
  CVImageBufferRef v27 = (__CVBuffer *)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_intermediateVideoFormatsByAttachedMediaKeys, "objectForKeyedSubscript:", 0x1EFA748E0), "newPixelBuffer");
  if (!v27)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_41;
  }
  CVPixelBufferGetWidth(v33);
  CVPixelBufferGetHeight(v33);
  FigCaptureMetadataUtilitiesDenormalizeCropRect(*(double *)&v160, *((double *)&v160 + 1), *(double *)&v161, *((double *)&v161 + 1));
  double v53 = v52;
  double v55 = v54;
  double v57 = v56;
  double v59 = v58;
  objc_super v60 = (void *)[(CMISmartStyleProcessor *)self->_smartStyleProcessor utilities];
  if (v26)
  {
    long long v150 = v157;
    long long v151 = v158;
    long long v152 = v159;
    *(_OWORD *)CMSampleTimingInfo time = v153;
    *(_OWORD *)&time[16] = v154;
    long long v148 = v155;
    long long v149 = v156;
    if (objc_msgSend(v60, "downScalePixelBuffer:toPixelBuffer:inputROI:gdcParams:applyGDC:", v33, v26, time, v137, v53, v55, v57, v59))
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      a3 = 0;
      CMSampleBufferRef sbufa = 0;
      CFTypeRef v26 = 0;
      LOBYTE(ImageBuffer) = 0;
      CFTypeRef v18 = (_DWORD *)MEMORY[0x1E4F1EBA8];
      unsigned int v20 = v141;
      uint64_t v19 = v139;
      goto LABEL_153;
    }
    uint64_t v61 = (void *)[(CMISmartStyleProcessor *)self->_smartStyleProcessor utilities];
    long long v150 = v157;
    long long v151 = v158;
    long long v152 = v159;
    *(_OWORD *)CMSampleTimingInfo time = v153;
    *(_OWORD *)&time[16] = v154;
    long long v148 = v155;
    long long v149 = v156;
    if ([v61 downScalePixelBuffer:v26 toPixelBuffer:a8 propagateAttachments:1 gdcParams:time applyGDC:0])
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      a3 = 0;
      CMSampleBufferRef sbufa = 0;
LABEL_188:
      CFTypeRef v26 = 0;
      LOBYTE(ImageBuffer) = 0;
      CFTypeRef v18 = (_DWORD *)MEMORY[0x1E4F1EBA8];
      uint64_t v19 = v139;
      goto LABEL_42;
    }
  }
  else
  {
    long long v150 = v157;
    long long v151 = v158;
    long long v152 = v159;
    *(_OWORD *)CMSampleTimingInfo time = v153;
    *(_OWORD *)&time[16] = v154;
    long long v148 = v155;
    long long v149 = v156;
    if (objc_msgSend(v60, "downScalePixelBuffer:toPixelBuffer:inputROI:gdcParams:applyGDC:", v33, a8, time, v137, v53, v55, v57, v59))
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      a3 = 0;
      CFTypeRef cf = 0;
      CMSampleBufferRef sbufa = 0;
      goto LABEL_188;
    }
  }
  if (v134)
  {
    CVImageBufferRef v62 = CMSampleBufferGetImageBuffer(v134);
    uint64_t v63 = (void *)[(CMISmartStyleProcessor *)self->_smartStyleProcessor utilities];
    if (objc_msgSend(v63, "createLinearThumbnailFromMetadata:preLTMThumbnailPixelBuffer:postLTMThumbnailPixelBuffer:cameraInfo:applyGDC:cropToPreLTMBounds:toPixelBuffer:", v22, v62, a8, -[NSMutableDictionary objectForKeyedSubscript:](self->_intermediatePixelBufferPoolsByAttachedMediaKeys, "objectForKeyedSubscript:", objc_msgSend(v22, "objectForKeyedSubscript:", *MEMORY[0x1E4F54128])), v35, 1, v27))
    {
LABEL_41:
      a3 = 0;
      CMSampleBufferRef sbufa = 0;
      CFTypeRef v26 = 0;
      LOBYTE(ImageBuffer) = 0;
      CFTypeRef v18 = (_DWORD *)MEMORY[0x1E4F1EBA8];
      uint64_t v19 = v139;
LABEL_42:
      unsigned int v20 = v141;
      goto LABEL_153;
    }
  }
  else
  {
    uint64_t v64 = [v22 objectForKeyedSubscript:*MEMORY[0x1E4F54018]];
    uint64_t v65 = (void *)[(CMISmartStyleProcessor *)self->_smartStyleProcessor utilities];
    if (v64)
    {
      if (objc_msgSend(v65, "createLinearThumbnailFromMetadata:postLTMThumbnailPixelBuffer:cameraInfo:applyGDC:cropToPreLTMBounds:toPixelBuffer:", v22, a8, -[NSMutableDictionary objectForKeyedSubscript:](self->_intermediatePixelBufferPoolsByAttachedMediaKeys, "objectForKeyedSubscript:", objc_msgSend(v22, "objectForKeyedSubscript:", *MEMORY[0x1E4F54128])), v35, 0, v27))goto LABEL_41; {
    }
      }
    else
    {
      long long v150 = v157;
      long long v151 = v158;
      long long v152 = v159;
      *(_OWORD *)CMSampleTimingInfo time = v153;
      *(_OWORD *)&time[16] = v154;
      long long v148 = v155;
      long long v149 = v156;
      if ([v65 downScalePixelBuffer:v33 toPixelBuffer:v27 propagateAttachments:1 gdcParams:time applyGDC:v137])goto LABEL_41; {
    }
      }
  }
  CFStringRef v66 = (const __CFString *)*MEMORY[0x1E4F24A90];
  CFTypeRef v67 = CVBufferCopyAttachment((CVBufferRef)a8, (CFStringRef)*MEMORY[0x1E4F24A90], 0);
  CFStringRef v68 = (const __CFString *)*MEMORY[0x1E4F24C18];
  CFTypeRef v69 = CVBufferCopyAttachment((CVBufferRef)a8, (CFStringRef)*MEMORY[0x1E4F24C18], 0);
  CVBufferSetAttachment(v27, v66, v67, kCVAttachmentMode_ShouldPropagate);
  CVBufferSetAttachment(v27, (CFStringRef)*MEMORY[0x1E4F24BC8], (CFTypeRef)*MEMORY[0x1E4F24BE8], kCVAttachmentMode_ShouldPropagate);
  CVBufferSetAttachment(v27, v68, v69, kCVAttachmentMode_ShouldPropagate);
  if (v67) {
    CFRelease(v67);
  }
  unint64_t v70 = (unint64_t)v145;
  if (v69) {
    CFRelease(v69);
  }
  v131 = v27;
  if (!BYTE6(self->_previousPTS.epoch) || !v145 || !self->_generateImageStats)
  {
    if (!v145)
    {
      CVImageBufferRef v140 = 0;
      CMSampleBufferRef v135 = 0;
      CVImageBufferRef v138 = 0;
      unint64_t v72 = 0;
      CVImageBufferRef v77 = 0;
      CVImageBufferRef ImageBuffer = 0;
      CVImageBufferRef v78 = 0;
      uint64_t v19 = v139;
      goto LABEL_102;
    }
    CVImageBufferRef v140 = 0;
    long long v76 = 0;
    CVImageBufferRef v138 = 0;
    uint64_t v19 = v139;
    if (v35) {
      goto LABEL_87;
    }
    goto LABEL_91;
  }
  memset(&timingArrayOut, 0, sizeof(timingArrayOut));
  CFTypeRef v26 = (__CVBuffer *)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_intermediateVideoFormatsByAttachedMediaKeys, "objectForKeyedSubscript:", 0x1EFA74880), "newPixelBuffer");
  if (!v26) {
    goto LABEL_197;
  }
  long long v71 = (void *)[(CMISmartStyleProcessor *)self->_smartStyleProcessor utilities];
  long long v150 = v157;
  long long v151 = v158;
  long long v152 = v159;
  *(_OWORD *)CMSampleTimingInfo time = v153;
  *(_OWORD *)&time[16] = v154;
  long long v148 = v155;
  long long v149 = v156;
  if ([v71 downScalePixelBuffer:v33 toPixelBuffer:v26 propagateAttachments:1 gdcParams:time applyGDC:v137])
  {
LABEL_197:
    fig_log_get_emitter();
    FigDebugAssert3();
    CFTypeRef v18 = (_DWORD *)MEMORY[0x1E4F1EBA8];
    uint64_t v19 = v139;
LABEL_199:
    unsigned int v20 = v141;
    a3 = 0;
    CMSampleBufferRef sbufa = 0;
    goto LABEL_200;
  }
  [(FigMetalContext *)self->_metalContext waitForSchedule];
  uint64_t v19 = v139;
  if (CMSampleBufferGetSampleTimingInfoArray(a4, 1, &timingArrayOut, 0)
    || (long long v148 = *(_OWORD *)&timingArrayOut.presentationTimeStamp.timescale,
        long long v149 = *(_OWORD *)&timingArrayOut.decodeTimeStamp.value,
        *(void *)&long long v150 = timingArrayOut.decodeTimeStamp.epoch,
        *(_OWORD *)CMSampleTimingInfo time = *(_OWORD *)&timingArrayOut.duration.value,
        *(_OWORD *)&time[16] = *(_OWORD *)&timingArrayOut.duration.epoch,
        BWSampleBufferCreateFromPixelBufferWithTimingInfo(v26, (CMSampleTimingInfo *)time, &v163, &v162))
    || !v162)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    CFTypeRef v18 = (_DWORD *)MEMORY[0x1E4F1EBA8];
    goto LABEL_199;
  }
  BWSampleBufferSetAttachedMedia(v132, 0x1EFA74880, (uint64_t)v162);
  *(void *)CMSampleTimingInfo time = v165;
  *(void *)&time[8] = __PAIR64__(v141, v166);
  *(void *)&time[16] = v139;
  unint64_t v70 = (unint64_t)v145;
  unint64_t v72 = [(BWSmartStyleLearningNode *)self _runInferences:v132 unstyledSampleBuffer:a4 withMasks:v145 currentPTS:time];
  if (!v72)
  {
    fig_log_get_emitter();
    uint64_t v127 = v9;
    LODWORD(v126) = 0;
    FigDebugAssert3();
  }
  id v73 = (id)v72;
  CFRelease(v26);
  if (v163)
  {
    CFRelease(v163);
    CFTypeRef v163 = 0;
  }
  if (v162)
  {
    CFRelease(v162);
    CMSampleBufferRef v162 = 0;
  }
  if (!v72)
  {
    CVImageBufferRef v140 = 0;
    long long v76 = 0;
    CVImageBufferRef v138 = 0;
    if (v35) {
      goto LABEL_87;
    }
LABEL_91:
    if (!self->_propagateMasks)
    {
      unint64_t v72 = 0;
      goto LABEL_95;
    }
    *(void *)CMSampleTimingInfo time = v165;
    *(void *)&time[8] = __PAIR64__(v141, v166);
    *(void *)&time[16] = v19;
    id v87 = [(BWSmartStyleLearningNode *)self _blitMasksToOutputPools:v70 unstyledSampleBuffer:a4 currentPTS:time];
    unint64_t v72 = 0;
    if (!v87) {
      goto LABEL_95;
    }
LABEL_93:

    unint64_t v70 = (unint64_t)v87;
    goto LABEL_95;
  }
  BOOL propagateMasks = self->_propagateMasks;
  if (v35)
  {
    *(void *)CMSampleTimingInfo time = v165;
    *(void *)&time[8] = __PAIR64__(v141, v166);
    *(void *)&time[16] = v139;
    id v75 = -[BWSmartStyleLearningNode _undistortMasks:unstyledSampleBuffer:currentPTS:useIntermediatePools:](self, "_undistortMasks:unstyledSampleBuffer:currentPTS:useIntermediatePools:", v72, a4, time, !propagateMasks, v126, v127);
  }
  else
  {
    if (!self->_propagateMasks) {
      goto LABEL_78;
    }
    *(void *)CMSampleTimingInfo time = v165;
    *(void *)&time[8] = __PAIR64__(v141, v166);
    *(void *)&time[16] = v139;
    id v75 = [(BWSmartStyleLearningNode *)self _blitMasksToOutputPools:v72 unstyledSampleBuffer:a4 currentPTS:time];
  }
  objc_super v79 = v75;
  if (v75)
  {

    unint64_t v72 = v79;
  }
LABEL_78:
  uint64_t v80 = *MEMORY[0x1E4F55B20];
  v81 = (opaqueCMSampleBuffer *)objc_msgSend((id)objc_msgSend((id)v72, "objectForKeyedSubscript:", *MEMORY[0x1E4F55B20], v126), "objectForKeyedSubscript:", @"HumanFullBodiesMask");
  if (!v81
    || (CVImageBufferRef v140 = CMSampleBufferGetImageBuffer(v81)) == 0
    || (v82 = (opaqueCMSampleBuffer *)objc_msgSend((id)objc_msgSend((id)v72, "objectForKeyedSubscript:", v80), "objectForKeyedSubscript:", @"HumanSkinsMask")) == 0|| (v83 = CMSampleBufferGetImageBuffer(v82)) == 0|| (long long v76 = v83, (v84 = (opaqueCMSampleBuffer *)objc_msgSend((id)objc_msgSend((id)v72, "objectForKeyedSubscript:", v80), "objectForKeyedSubscript:", 0x1EFA74700)) == 0)|| (v85 = CMSampleBufferGetImageBuffer(v84)) == 0)
  {
    CMSampleBufferRef sbufa = (CMSampleBufferRef)v72;
    fig_log_get_emitter();
    goto LABEL_209;
  }
  CVImageBufferRef v138 = v85;
  if ((v35 & 1) == 0)
  {
    if (v72) {
      goto LABEL_95;
    }
    goto LABEL_91;
  }
  if (v72)
  {
    BOOL v86 = 1;
    goto LABEL_88;
  }
LABEL_87:
  unint64_t v72 = 0;
  BOOL v86 = !self->_propagateMasks;
LABEL_88:
  *(void *)CMSampleTimingInfo time = v165;
  *(void *)&time[8] = __PAIR64__(v141, v166);
  *(void *)&time[16] = v19;
  id v87 = -[BWSmartStyleLearningNode _undistortMasks:unstyledSampleBuffer:currentPTS:useIntermediatePools:](self, "_undistortMasks:unstyledSampleBuffer:currentPTS:useIntermediatePools:", v70, a4, time, v86, v126);
  if (v87) {
    goto LABEL_93;
  }
LABEL_95:
  uint64_t v88 = *MEMORY[0x1E4F55B20];
  v89 = (opaqueCMSampleBuffer *)objc_msgSend((id)objc_msgSend((id)v70, "objectForKeyedSubscript:", *MEMORY[0x1E4F55B20], v126), "objectForKeyedSubscript:", @"HumanFullBodiesMask");
  if (!v89)
  {
    CMSampleBufferRef sbufa = (CMSampleBufferRef)v72;
    id v145 = (id)v70;
    fig_log_get_emitter();
LABEL_209:
    FigDebugAssert3();
    a3 = 0;
    CFTypeRef v26 = 0;
    LOBYTE(ImageBuffer) = 0;
    goto LABEL_210;
  }
  CVImageBufferRef v90 = CMSampleBufferGetImageBuffer(v89);
  if (!v90) {
    goto LABEL_186;
  }
  CVImageBufferRef v78 = v90;
  v91 = (opaqueCMSampleBuffer *)objc_msgSend((id)objc_msgSend((id)v70, "objectForKeyedSubscript:", v88), "objectForKeyedSubscript:", @"HumanSkinsMask");
  if (!v91) {
    goto LABEL_186;
  }
  CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(v91);
  if (!ImageBuffer)
  {
    CMSampleBufferRef sbufa = (CMSampleBufferRef)v72;
    id v145 = (id)v70;
    fig_log_get_emitter();
    FigDebugAssert3();
    a3 = 0;
    CFTypeRef v26 = 0;
LABEL_203:
    CFTypeRef v18 = (_DWORD *)MEMORY[0x1E4F1EBA8];
LABEL_207:
    unsigned int v20 = v141;
    CVImageBufferRef v27 = v131;
    goto LABEL_153;
  }
  v92 = (opaqueCMSampleBuffer *)objc_msgSend((id)objc_msgSend((id)v70, "objectForKeyedSubscript:", v88), "objectForKeyedSubscript:", 0x1EFA74700);
  if (!v92 || (v135 = v76, (CVImageBufferRef v93 = CMSampleBufferGetImageBuffer(v92)) == 0))
  {
LABEL_186:
    CMSampleBufferRef sbufa = (CMSampleBufferRef)v72;
    id v145 = (id)v70;
    fig_log_get_emitter();
LABEL_202:
    FigDebugAssert3();
    a3 = 0;
    CFTypeRef v26 = 0;
    LOBYTE(ImageBuffer) = 0;
    goto LABEL_203;
  }
  CVImageBufferRef v77 = v93;
LABEL_102:
  CMSampleBufferRef sbufa = (CMSampleBufferRef)v72;
  id v145 = (id)v70;
  if (HIBYTE(self->_previousPTS.epoch)
    && v140
    && v78
    && [(BWSmartStyleLearningNode *)self _runFalsePositiveRejectionOnPixelBuffer:v140 unrefinedPixelBuffer:v78])
  {
    goto LABEL_201;
  }
  if (v72 | v70)
  {
    if (v72) {
      unint64_t v70 = v72;
    }
    uint64_t v94 = *MEMORY[0x1E4F55B20];
    uint64_t v95 = objc_msgSend((id)objc_msgSend((id)v70, "objectForKeyedSubscript:", *MEMORY[0x1E4F55B20]), "objectForKeyedSubscript:", @"HumanFullBodiesMask");
    if (!v95) {
      goto LABEL_204;
    }
    long long v96 = (const void *)v95;
    CFTypeRef v26 = (__CVBuffer *)objc_msgSend((id)objc_msgSend((id)v70, "objectForKeyedSubscript:", v94), "objectForKeyedSubscript:", @"HumanSkinsMask");
    if (!v26)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      a3 = 0;
LABEL_206:
      LOBYTE(ImageBuffer) = 0;
      CFTypeRef v18 = (_DWORD *)MEMORY[0x1E4F1EBA8];
      uint64_t v19 = v139;
      goto LABEL_207;
    }
    uint64_t v97 = objc_msgSend((id)objc_msgSend((id)v70, "objectForKeyedSubscript:", v94), "objectForKeyedSubscript:", 0x1EFA74700);
    if (!v97) {
      goto LABEL_204;
    }
    long long v98 = (const void *)v97;
    os_unfair_lock_lock((os_unfair_lock_t)&self->_lastLearnedROI.size.height);
    BYTE4(self->_lastLearnedROI.size.height) = 1;
    long long v99 = *(const void **)&self->_mostRecentMasksLock._os_unfair_lock_opaque;
    if (v99) {
      CFRelease(v99);
    }
    *(void *)&self->_mostRecentMasksLock._uint32_t os_unfair_lock_opaque = CFRetain(v96);
    mostRecentLearnedPersonMaskSampleBuffer = self->_mostRecentLearnedPersonMaskSampleBuffer;
    if (mostRecentLearnedPersonMaskSampleBuffer) {
      CFRelease(mostRecentLearnedPersonMaskSampleBuffer);
    }
    self->_mostRecentLearnedPersonMaskSampleBuffer = (opaqueCMSampleBuffer *)CFRetain(v26);
    mostRecentLearnedSkinMaskSampleBuffer = self->_mostRecentLearnedSkinMaskSampleBuffer;
    if (mostRecentLearnedSkinMaskSampleBuffer) {
      CFRelease(mostRecentLearnedSkinMaskSampleBuffer);
    }
    self->_mostRecentLearnedSkinMaskSampleBuffer = (opaqueCMSampleBuffer *)CFRetain(v98);
    os_unfair_lock_unlock((os_unfair_lock_t)&self->_lastLearnedROI.size.height);
    uint64_t v19 = v139;
  }
  if (!a9)
  {
    if (BYTE4(self->_previousPTS.epoch))
    {
      if ([(BWSmartStyleLearningNode *)self _createCoefficientsFromSampleBuffer:v132 to:&v164]|| (CVImageBufferRef v102 = CMSampleBufferGetImageBuffer(v164)) == 0)
      {
LABEL_204:
        fig_log_get_emitter();
        FigDebugAssert3();
        a3 = 0;
LABEL_205:
        CFTypeRef v26 = 0;
        goto LABEL_206;
      }
    }
    else
    {
      CVImageBufferRef v102 = 0;
    }
    if (v129)
    {
      CFTypeRef v103 = CMSampleBufferGetImageBuffer(v129);
    }
    else if (cf)
    {
      CFTypeRef v103 = cf;
    }
    else
    {
      CFTypeRef v103 = a8;
    }
    CFTypeRef v104 = (opaqueCMSampleBuffer *)objc_alloc_init(self->_smartStyleProcessorInputOutputClass);
    a3 = v104;
    if (v104)
    {
      CFTypeRef v105 = cf ? cf : (__CVBuffer *)a8;
      [(opaqueCMSampleBuffer *)v104 setInputUnstyledPixelBuffer:v105];
      [(opaqueCMSampleBuffer *)a3 setInputUnstyledThumbnailPixelBuffer:a8];
      [(opaqueCMSampleBuffer *)a3 setInputLinearPixelBuffer:v131];
      [(opaqueCMSampleBuffer *)a3 setInputMetadataDict:v136];
      [(opaqueCMSampleBuffer *)a3 setInputLinearMetadataDict:v136];
      CVImageBufferRef v106 = v140 ? v140 : v78;
      [(opaqueCMSampleBuffer *)a3 setInputPersonMaskPixelBuffer:v106];
      CVPixelBufferGetWidth((CVPixelBufferRef)[(opaqueCMSampleBuffer *)a3 inputPersonMaskPixelBuffer]);
      CVPixelBufferGetHeight((CVPixelBufferRef)[(opaqueCMSampleBuffer *)a3 inputPersonMaskPixelBuffer]);
      FigCaptureMetadataUtilitiesDenormalizeCropRect(*(double *)&v160, *((double *)&v160 + 1), *(double *)&v161, *((double *)&v161 + 1));
      -[opaqueCMSampleBuffer setInputPersonMaskCropRect:](a3, "setInputPersonMaskCropRect:");
      CVImageBufferRef v107 = v138 ? v138 : v77;
      [(opaqueCMSampleBuffer *)a3 setInputSkyMaskPixelBuffer:v107];
      CVPixelBufferGetWidth((CVPixelBufferRef)[(opaqueCMSampleBuffer *)a3 inputSkyMaskPixelBuffer]);
      CVPixelBufferGetHeight((CVPixelBufferRef)[(opaqueCMSampleBuffer *)a3 inputSkyMaskPixelBuffer]);
      FigCaptureMetadataUtilitiesDenormalizeCropRect(*(double *)&v160, *((double *)&v160 + 1), *(double *)&v161, *((double *)&v161 + 1));
      -[opaqueCMSampleBuffer setInputSkyMaskCropRect:](a3, "setInputSkyMaskCropRect:");
      CMSampleBufferRef v108 = v135 ? v135 : ImageBuffer;
      [(opaqueCMSampleBuffer *)a3 setInputSkinMaskPixelBuffer:v108];
      CVPixelBufferGetWidth((CVPixelBufferRef)[(opaqueCMSampleBuffer *)a3 inputSkinMaskPixelBuffer]);
      CVPixelBufferGetHeight((CVPixelBufferRef)[(opaqueCMSampleBuffer *)a3 inputSkinMaskPixelBuffer]);
      FigCaptureMetadataUtilitiesDenormalizeCropRect(*(double *)&v160, *((double *)&v160 + 1), *(double *)&v161, *((double *)&v161 + 1));
      -[opaqueCMSampleBuffer setInputSkinMaskCropRect:](a3, "setInputSkinMaskCropRect:");
      [(opaqueCMSampleBuffer *)a3 setOutputLearnedStyleCoefficientsPixelBuffer:v102];
      [(opaqueCMSampleBuffer *)a3 setInputSmartStyle:objc_alloc_init(self->_smartStyleClass)];
      objc_msgSend((id)-[opaqueCMSampleBuffer inputSmartStyle](a3, "inputSmartStyle"), "setCastType:", objc_msgSend(v133, "cast"));
      [v133 intensity];
      int v110 = v109;
      v111 = (void *)[(opaqueCMSampleBuffer *)a3 inputSmartStyle];
      LODWORD(v112) = v110;
      [v111 setCastIntensity:v112];
      [v133 toneBias];
      int v114 = v113;
      uint64_t v115 = (void *)[(opaqueCMSampleBuffer *)a3 inputSmartStyle];
      LODWORD(v116) = v114;
      [v115 setToneBias:v116];
      [v133 colorBias];
      int v118 = v117;
      v119 = (void *)[(opaqueCMSampleBuffer *)a3 inputSmartStyle];
      LODWORD(v120) = v118;
      [v119 setColorBias:v120];
      [(opaqueCMSampleBuffer *)a3 setInputTuningType:*MEMORY[0x1E4F55E98]];
      [(opaqueCMSampleBuffer *)a3 setInputSRLPixelBuffer:v103];
      os_unfair_lock_lock(&self->_semanticStyleSceneLock);
      [(opaqueCMSampleBuffer *)a3 setSemanticStyleSceneType:self->_semanticStyleSceneType];
      os_unfair_lock_unlock(&self->_semanticStyleSceneLock);
      [(opaqueCMSampleBuffer *)a3 setOutputImageStatistics:v130];
      [(opaqueCMSampleBuffer *)a3 setOutputImageStatisticsExtended:v128];
      [(opaqueCMSampleBuffer *)a3 setSubjectRelightingEnabled:BYTE2(self->_mostRecentLearnedSkyMaskSampleBuffer)];
      [(CMISmartStyleProcessor *)self->_smartStyleProcessor setInputOutput:a3];
      if (![(CMISmartStyleProcessor *)self->_smartStyleProcessor process])
      {
        [(FigMetalContext *)self->_metalContext waitForSchedule];
        CFTypeRef v18 = (_DWORD *)MEMORY[0x1E4F1EBA8];
        uint64_t v19 = v139;
        goto LABEL_147;
      }
    }
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_205;
  }
  if ([(BWSmartStyleLearningNode *)self _createIdentityCoefficientsFromSampleBuffer:v132 to:&v164])
  {
LABEL_201:
    fig_log_get_emitter();
    goto LABEL_202;
  }
  a3 = 0;
  CFTypeRef v18 = (_DWORD *)MEMORY[0x1E4F1EBA8];
LABEL_147:
  unsigned int v20 = v141;
  CVImageBufferRef v27 = v131;
  os_unfair_lock_lock((os_unfair_lock_t)&self->_workQueue);
  learnedCoefficientsSampleBuffer = self->_learnedCoefficientsSampleBuffer;
  if (learnedCoefficientsSampleBuffer) {
    CFRelease(learnedCoefficientsSampleBuffer);
  }
  self->_learnedCoefficientsSampleBuffer = v164;

  *(void *)&self->_workQueueLearnCount = v133;
  if (a3)
  {
    id v122 = objc_alloc(NSNumber);
    [(opaqueCMSampleBuffer *)a3 outputSRLCurveParameter];
    v123 = (FigCaptureSmartStyle *)objc_msgSend(v122, "initWithFloat:");
  }
  else
  {
    v123 = 0;
  }
  self->_smartStyleLearned = v123;

  self->_srlCurveParameter = (NSNumber *)(id)[(opaqueCMSampleBuffer *)a3 outputSRLStats];
  long long v124 = v161;
  *(_OWORD *)&self->_srlStats = v160;
  *(_OWORD *)&self->_lastLearnedROI.origin.y = v124;
  os_unfair_lock_unlock((os_unfair_lock_t)&self->_workQueue);
  CFTypeRef v26 = 0;
  LOBYTE(ImageBuffer) = 1;
LABEL_153:
  if (v163) {
    CFRelease(v163);
  }
  if (v162) {
    CFRelease(v162);
  }
  if (v26) {
    CFRelease(v26);
  }
  if (a8) {
    CFRelease(a8);
  }
  if (cf) {
    CFRelease(cf);
  }
  if (v27) {
    CFRelease(v27);
  }

  if ((ImageBuffer & 1) == 0)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&self->_workQueue);
    v125 = self->_learnedCoefficientsSampleBuffer;
    if (v125)
    {
      CFRelease(v125);
      self->_learnedCoefficientsSampleBuffer = 0;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&self->_workQueue);
  }
  if (*v18 == 1)
  {
    *(void *)CMSampleTimingInfo time = v165;
    *(void *)&time[8] = __PAIR64__(v20, v166);
    *(void *)&time[16] = v19;
    CMTimeGetSeconds((CMTime *)time);
    kdebug_trace();
  }
}

- (void)_asynchronouslySignalEvent:(id)a3
{
  uint64_t v5 = (void *)[(FigMetalContext *)self->_metalContext commandBuffer];
  if (v5)
  {
    CFStringRef v6 = v5;
    [v5 setLabel:@"asynchronouslySignalEvent"];
    [v6 encodeSignalEvent:a3 value:1];
    metalContext = self->_metalContext;
    [(FigMetalContext *)metalContext forceCommit];
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
}

- (void)_asynchronouslyDecrementRenderCount
{
  objc_initWeak(&location, self);
  uint64_t v3 = (void *)[(FigMetalContext *)self->_metalContext commandBuffer];
  int v4 = v3;
  if (v3)
  {
    [v3 setLabel:@"asynchronouslyDecrementRenderCount"];
    uint64_t v5 = MEMORY[0x1E4F143A8];
    uint64_t v6 = 3221225472;
    BOOL v7 = __63__BWSmartStyleLearningNode__asynchronouslyDecrementRenderCount__block_invoke;
    uint64_t v8 = &unk_1E5C26E98;
    objc_copyWeak(&v9, &location);
    [v4 addCompletedHandler:&v5];
    [(FigMetalContext *)self->_metalContext forceCommit];
    objc_destroyWeak(&v9);
  }
  objc_destroyWeak(&location);
}

void __63__BWSmartStyleLearningNode__asynchronouslyDecrementRenderCount__block_invoke(uint64_t a1)
{
  Weauint64_t k = (os_unfair_lock_s *)objc_loadWeak((id *)(a1 + 32));
  if (Weak)
  {
    int v2 = Weak;
    uint64_t v3 = Weak + 100;
    os_unfair_lock_lock(Weak + 100);
    --v2[101]._os_unfair_lock_opaque;
    os_unfair_lock_unlock(v3);
  }
}

- (void)_asynchronouslyDecrementLearnCount
{
  objc_initWeak(&location, self);
  uint64_t v3 = (void *)[(FigMetalContext *)self->_metalContext commandBuffer];
  int v4 = v3;
  if (v3)
  {
    [v3 setLabel:@"asynchronouslyDecrementLearnCount"];
    uint64_t v5 = MEMORY[0x1E4F143A8];
    uint64_t v6 = 3221225472;
    BOOL v7 = __62__BWSmartStyleLearningNode__asynchronouslyDecrementLearnCount__block_invoke;
    uint64_t v8 = &unk_1E5C26E98;
    objc_copyWeak(&v9, &location);
    [v4 addCompletedHandler:&v5];
    [(FigMetalContext *)self->_metalContext forceCommit];
    objc_destroyWeak(&v9);
  }
  objc_destroyWeak(&location);
}

void __62__BWSmartStyleLearningNode__asynchronouslyDecrementLearnCount__block_invoke(uint64_t a1)
{
  Weauint64_t k = (os_unfair_lock_s *)objc_loadWeak((id *)(a1 + 32));
  if (Weak)
  {
    int v2 = Weak;
    uint64_t v3 = Weak + 100;
    os_unfair_lock_lock(Weak + 100);
    --v2[102]._os_unfair_lock_opaque;
    os_unfair_lock_unlock(v3);
  }
}

- (id)inputInferenceVideoFormatForAttachedMediaKey:(id)a3
{
  return 0;
}

- (id)inputVideoFormatForAttachedMediaKey:(id)a3
{
  return (id)[(BWVideoFormat *)self->_anstMaskVideoFormat objectForKeyedSubscript:a3];
}

- (BOOL)intermediateResourceTrackingAllowedForAttachedMediaKey:(id)a3
{
  return 0;
}

- (id)outputVideoFormatForAttachedMediaKey:(id)a3
{
  return (id)[(BWVideoFormat *)self->_anstMaskVideoFormat objectForKeyedSubscript:a3];
}

- (id)preparedOutputPixelBufferPoolForAttachedMediaKey:(id)a3 format:(id)a4
{
  if (objc_msgSend(a3, "isEqualToString:", 0x1EFA6A7E0, a4))
  {
    uint64_t v6 = BWAttachedMediaKey_HumanFullBodiesMask;
  }
  else if ([a3 isEqualToString:0x1EFA6A820])
  {
    uint64_t v6 = BWAttachedMediaKey_HumanSkinsMask;
  }
  else
  {
    if (![a3 isEqualToString:0x1EFA6A800]) {
      return 0;
    }
    uint64_t v6 = BWAttachedMediaKey_HumanHairMask;
  }
  intermediateVideoFormatsByAttachedMediaKeys = self->_intermediateVideoFormatsByAttachedMediaKeys;
  uint64_t v8 = *v6;
  return (id)[(NSMutableDictionary *)intermediateVideoFormatsByAttachedMediaKeys objectForKeyedSubscript:v8];
}

- (void)semanticStyleSceneTypeDidChange:(int)a3
{
  p_semanticStyleSceneLocuint64_t k = &self->_semanticStyleSceneLock;
  os_unfair_lock_lock(&self->_semanticStyleSceneLock);
  self->_semanticStyleSceneType = a3;
  os_unfair_lock_unlock(p_semanticStyleSceneLock);
}

- (FigCaptureSmartStyle)smartStyle
{
  return *(FigCaptureSmartStyle **)&self->_bypassStyleEngineForStandardStyle;
}

- (BOOL)disableWaitForCoefficientsOnFirstFrame
{
  return BYTE1(self->_mostRecentLearnedSkyMaskSampleBuffer);
}

- (BOOL)subjectRelightingEnabled
{
  return BYTE2(self->_mostRecentLearnedSkyMaskSampleBuffer);
}

@end