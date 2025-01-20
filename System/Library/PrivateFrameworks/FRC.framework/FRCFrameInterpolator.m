@interface FRCFrameInterpolator
+ (int64_t)getUsageFromSizeWidth:(unint64_t)a3 height:(unint64_t)a4;
+ (void)getInputFrameSizeForUsage:(int64_t)a3 width:(unint64_t *)a4 height:(unint64_t *)a5;
- (BOOL)checkFrameFormatConsistencyFirstFrame:(id)a3 secondFrame:(id)a4 outputFrames:(id)a5;
- (BOOL)checkStreamingBufferConsistencyFirstFrame:(id)a3 secondFrame:(id)a4;
- (BOOL)configureSynthesis;
- (BOOL)forceFrameOutput;
- (BOOL)forceSingleStageFlow;
- (BOOL)gated;
- (BOOL)inputScaling;
- (BOOL)interpolateBetweenFirstFrame:(id)a3 secondFrame:(id)a4 timeScales:(id)a5 outputFrames:(id)a6 withError:(id *)a7;
- (BOOL)legacyNormalizationMode;
- (BOOL)linearSplatting;
- (BOOL)lowMemoryMode;
- (BOOL)opticalFlowAdaptationLayer;
- (BOOL)secondLevelFlow;
- (BOOL)shallDumpDebugInfoForCurrPts:(id *)a3 prevPts:(id *)a4;
- (BOOL)shallReusePreviousFlowPts0:(id *)a3 Pts1:(id *)a4;
- (BOOL)singleDropRecoveryEnabled;
- (BOOL)singleFlow;
- (BOOL)streamingMode;
- (BOOL)synthesisTemporalSmoothing;
- (BOOL)tilingEnabled;
- (BOOL)twoLayerSynthesis;
- (BOOL)twoLayerSynthesisQuarterSizeDC;
- (BOOL)twoStageFlow;
- (BOOL)updateGatingResult;
- (BOOL)useFlowConsistencyMap;
- (CGAffineTransform)preferredTransform;
- (FRCFrameInterpolator)init;
- (FRCFrameInterpolator)initWithMode:(int64_t)a3;
- (NSDictionary)sessionStatistics;
- (__CVBuffer)synthesisFrameForTimeScale:(float)a3 outputSize:(CGSize)a4 outputPixelFormat:(unsigned int)a5 scalerEnabled:(BOOL)a6 frameIndex:(unint64_t)a7 lastFrame:(BOOL)a8;
- (float)sessionConfidence;
- (id)createOutputFramesWithWidth:(unint64_t)a3 height:(unint64_t)a4 pixelFormat:(unsigned int)a5 numberOframes:(unint64_t)a6;
- (id)errorWithErrorCode:(int64_t)a3;
- (id)interpolateBetweenFirstFrame:(id)a3 secondFrame:(id)a4 numberOfFrames:(unint64_t)a5 withError:(id *)a6;
- (id)interpolateBetweenFirstFrame:(id)a3 secondFrame:(id)a4 timeScales:(id)a5 outputSize:(CGSize)a6 outputPixelFormat:(unsigned int)a7 withError:(id *)a8;
- (id)interpolateBetweenFirstFrame:(id)a3 secondFrame:(id)a4 timeScales:(id)a5 withError:(id *)a6;
- (id)interpolateRecursiveFirstFrame:(id)a3 secondFrame:(id)a4 timeScale:(id)a5 withError:(id *)a6;
- (id)normalizeTimingFromTimeScales:(id)a3 newBeginIdx:(int)a4 newEndIdx:(int)a5;
- (id)selectFrameInsertionPointsFromTimingList:(id)a3 metadataList:(id)a4 withError:(id *)a5;
- (id)selectFrameInsertionPointsFromTimingList:(id)a3 preModifiedTimingList:(id)a4;
- (id)synthesis;
- (id)synthesizeInterpolatedFrames:(id)a3 second:(id)a4 normalizedFirst:(__CVBuffer *)a5 normalizedSecond:(__CVBuffer *)a6 timeScales:(id)a7 outputSize:(CGSize)a8 outputPixelFormat:(unsigned int)a9 scalerEnabled:(BOOL)a10;
- (int)closestNumIdxInArray:(id)a3 target:(double)a4;
- (int64_t)adjustUsage:(int64_t)a3;
- (int64_t)endSession;
- (int64_t)gatingLevel;
- (int64_t)getFrameRotation:(int64_t)a3;
- (int64_t)opticalFlowRevision;
- (int64_t)qualityMode;
- (int64_t)recommendation;
- (int64_t)startSessionWithUsage:(int64_t)a3;
- (int64_t)state;
- (int64_t)usage;
- (unint64_t)opticalFlowDownsampling;
- (unint64_t)synthesisMode;
- (unint64_t)useCase;
- (void)allocateInternalBuffers;
- (void)configureGating;
- (void)constructSessionStatisticsWithSessionDuration:(double)a3;
- (void)dealloc;
- (void)getPixelAttributesForBuffer:(__CVBuffer *)a3;
- (void)initSubModules;
- (void)overwriteQualityModeFromDefaults;
- (void)pauseGatingForNextPair;
- (void)preserveCMAttachmentFirstFrame:(id)a3 secondFrame:(id)a4;
- (void)releaseInternalBuffers;
- (void)restoreCMAttachmentToFirstFrame:(id)a3 secondFrame:(id)a4 interpolatedFrames:(id)a5;
- (void)setCrossFlowAnalysisFromDefaults;
- (void)setFlowAnalysisFromDefaults;
- (void)setForceFrameOutput:(BOOL)a3;
- (void)setForceSingleStageFlow:(BOOL)a3;
- (void)setGatingLevel:(int64_t)a3;
- (void)setInputScaling:(BOOL)a3;
- (void)setLegacyNormalizationMode:(BOOL)a3;
- (void)setLinearSplatting:(BOOL)a3;
- (void)setLiteSynthesisDebugFromDefaults;
- (void)setLowMemoryMode:(BOOL)a3;
- (void)setNormalizationModeFromDefaults;
- (void)setOpticalFlowAdaptationLayer:(BOOL)a3;
- (void)setOpticalFlowDownsampling:(unint64_t)a3;
- (void)setOpticalFlowRevision:(int64_t)a3;
- (void)setPreferredTransform:(CGAffineTransform *)a3;
- (void)setPropertiesFromDefaults;
- (void)setQualityMode:(int64_t)a3;
- (void)setSecondLevelFlow:(BOOL)a3;
- (void)setSingleDropRecoveryEnabled:(BOOL)a3;
- (void)setSingleFlow:(BOOL)a3;
- (void)setStreamingMode:(BOOL)a3;
- (void)setSynthesis:(id)a3;
- (void)setSynthesisMode:(unint64_t)a3;
- (void)setSynthesisOptionsFromDefaults;
- (void)setSynthesisTemporalSmoothing:(BOOL)a3;
- (void)setTilingEnabled:(BOOL)a3;
- (void)setTwoLayerSynthesis:(BOOL)a3;
- (void)setTwoLayerSynthesisQuarterSizeDC:(BOOL)a3;
- (void)setTwoStageFlow:(BOOL)a3;
- (void)setUsage:(int64_t)a3;
- (void)setUseCase:(unint64_t)a3;
- (void)setUseFlowConsistencyMap:(BOOL)a3;
- (void)updateBackwardFlow;
- (void)updateLastFramePts:(id *)a3 duration:(id *)a4 toInterpolate:(unint64_t)a5;
- (void)updateRecommendation;
@end

@implementation FRCFrameInterpolator

- (FRCFrameInterpolator)init
{
  return [(FRCFrameInterpolator *)self initWithMode:1];
}

- (FRCFrameInterpolator)initWithMode:(int64_t)a3
{
  v22.receiver = self;
  v22.super_class = (Class)FRCFrameInterpolator;
  v4 = [(FRCFrameInterpolator *)&v22 init];
  v5 = v4;
  if (v4)
  {
    v4->_usage = a3;
    uint64_t v6 = MEMORY[0x1E4F1DAB8];
    long long v7 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v4->_preferredTransform.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v4->_preferredTransform.c = v7;
    *(_OWORD *)&v4->_preferredTransform.tx = *(_OWORD *)(v6 + 32);
    v4->_RGBAFormat = 1111970369;
    FRCGetInputFrameSizeForUsage(a3, (uint64_t *)&v4->_width, (uint64_t *)&v4->_height);
    dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
    completion_semaphore = v5->_completion_semaphore;
    v5->_completion_semaphore = (OS_dispatch_semaphore *)v8;

    dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
    postProcessingComletionSemaphore = v5->_postProcessingComletionSemaphore;
    v5->_postProcessingComletionSemaphore = (OS_dispatch_semaphore *)v10;

    dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
    initializationSemaphore = v5->_initializationSemaphore;
    v5->_initializationSemaphore = (OS_dispatch_semaphore *)v12;

    v5->_state = 0;
    dispatch_group_t v14 = dispatch_group_create();
    dispatchGroup = v5->_dispatchGroup;
    v5->_dispatchGroup = (OS_dispatch_group *)v14;

    dispatch_queue_t v16 = dispatch_queue_create("Concurrent Task Queue", MEMORY[0x1E4F14430]);
    concurrentQueue = v5->_concurrentQueue;
    v5->_concurrentQueue = (OS_dispatch_queue *)v16;

    v5->_synthesisTemporalSmoothing = 1;
    v5->_opticalFlowRevision = 1;
    v5->_singleDropRecoveryEnabled = 1;
    os_log_t v18 = os_log_create("com.apple.FRC", "FrameInterpolator");
    logger = v5->_logger;
    v5->_logger = (OS_os_log *)v18;

    NSLog(&cfstr_InitializingFr.isa);
    [(FRCFrameInterpolator *)v5 initSubModules];
    v20 = v5;
  }

  return v5;
}

- (void)initSubModules
{
  kdebug_trace();
  v3 = objc_alloc_init(OpticalFlow);
  opticalFlow = self->_opticalFlow;
  self->_opticalFlow = v3;

  v5 = [[Synthesis alloc] initWithMode:self->_usage];
  deepSynthesis = self->_deepSynthesis;
  self->_deepSynthesis = v5;

  long long v7 = objc_alloc_init(FRCScaler);
  scaler = self->_scaler;
  self->_scaler = v7;

  if (self->_opticalFlow && self->_deepSynthesis && self->_scaler) {
    int64_t v9 = 1;
  }
  else {
    int64_t v9 = 3;
  }
  self->_state = v9;
  kdebug_trace();
}

- (int64_t)getFrameRotation:(int64_t)a3
{
  if ((a3 & 0x1000) != 0) {
    return 2;
  }
  long long v4 = *(_OWORD *)&self->_preferredTransform.c;
  *(_OWORD *)&v8.a = *(_OWORD *)&self->_preferredTransform.a;
  *(_OWORD *)&v8.c = v4;
  *(_OWORD *)&v8.tx = *(_OWORD *)&self->_preferredTransform.tx;
  if (!CGAffineTransformIsIdentity(&v8)
    && (float v5 = atan2(self->_preferredTransform.b, self->_preferredTransform.a),
        float v6 = (float)(v5 * 180.0) / 3.14159265,
        v6 == 180.0))
  {
    return 3;
  }
  else
  {
    return 0;
  }
}

- (int64_t)adjustUsage:(int64_t)a3
{
  [(OpticalFlow *)self->_opticalFlow setTwoStageFlow:[(FRCFrameInterpolator *)self twoStageFlow]];
  [(OpticalFlow *)self->_opticalFlow setDownsampling:[(FRCFrameInterpolator *)self opticalFlowDownsampling]];
  self->_inputRotation = [(FRCFrameInterpolator *)self getFrameRotation:a3];
  int64_t QuarterSizeUsage = a3 & 0xFFF;
  if (QuarterSizeUsage == 7) {
    goto LABEL_39;
  }
  if (QuarterSizeUsage == 6)
  {
    *(_WORD *)&self->_secondLevelFlow = 0;
    goto LABEL_21;
  }
  if (QuarterSizeUsage)
  {
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    FRCGetInputFrameSizeForUsage(QuarterSizeUsage, &v8, &v7);
    if ((unint64_t)(v7 * v8) >> 10 < 0x7E9) {
      goto LABEL_17;
    }
    if (self->_qualityMode || self->_useCase)
    {
      if (!self->_inputScaling)
      {
        [(OpticalFlow *)self->_opticalFlow setDownsampling:1];
        goto LABEL_17;
      }
    }
    else
    {
      self->_inputScaling = 1;
      [(FRCFrameInterpolator *)self setTilingEnabled:1];
    }
  }
  else
  {
LABEL_39:
    if (self->_qualityMode || self->_useCase)
    {
      if (!self->_inputScaling)
      {
        [(OpticalFlow *)self->_opticalFlow setTwoStageFlow:1];
        goto LABEL_17;
      }
    }
    else
    {
      self->_inputScaling = 1;
    }
  }
  int64_t QuarterSizeUsage = getQuarterSizeUsage(QuarterSizeUsage);
LABEL_17:
  if ((self->_secondLevelFlow || self->_inputScaling) && QuarterSizeUsage != 2) {
    [(FRCFrameInterpolator *)self setTilingEnabled:0];
  }
LABEL_21:
  if ([(OpticalFlow *)self->_opticalFlow twoStageFlow]) {
    [(OpticalFlow *)self->_opticalFlow setDownsampling:0];
  }
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  FRCGetInputFrameSizeForUsage(QuarterSizeUsage, &v8, &v7);
  if ((unint64_t)(v7 * v8) >> 12 <= 0xE0)
  {
    self->_secondLevelFlow = 0;
    if (self->_synthesisMode == 1) {
      self->_synthesisMode = 0;
    }
  }
  if ((unint64_t)(self->_qualityMode - 3) > 1)
  {
    if (self->_synthesisMode == 10) {
      *(_WORD *)&self->_tilingEnabled = 0;
    }
  }
  else
  {
    self->_synthesisMode = 3;
  }
  [self->_deepSynthesis setTilingEnabled:self->_tilingEnabled];
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  FRCGetInputFrameSizeForUsage(QuarterSizeUsage, &v8, &v7);
  if ((unint64_t)(v7 * v8) >= 0x7E9000)
  {
    if (!self->_synthesisMode)
    {
      NSLog(&cfstr_ErrorHighQuali.isa);
      return -1;
    }
    [(OpticalFlow *)self->_opticalFlow setTwoStageFlow:1];
  }
  if (self->_forceSingleStageFlow) {
    [(OpticalFlow *)self->_opticalFlow setTwoStageFlow:0];
  }
  return QuarterSizeUsage;
}

- (int64_t)startSessionWithUsage:(int64_t)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  kdebug_trace();
  [(FRCFrameInterpolator *)self overwriteQualityModeFromDefaults];
  int64_t state = self->_state;
  if (!state)
  {
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_initializationSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    int64_t state = self->_state;
  }
  if (state == 3) {
    return -22007;
  }
  if (a3 == -1)
  {
    NSLog(&cfstr_ErrorInvalidUs.isa);
    return -22002;
  }
  if (state == 2)
  {
    NSLog(&cfstr_ErrorSessionIs.isa);
    return -22004;
  }
  int64_t qualityMode = self->_qualityMode;
  if (qualityMode == 2)
  {
    self->_unint64_t synthesisMode = 1;
  }
  else if ((unint64_t)(qualityMode - 3) <= 1)
  {
    self->_opticalFlowAdaptationLayer = 1;
  }
  if (self->_useCase == 1) {
    self->_lowMemoryMode = 1;
  }
  int64_t v8 = [(FRCFrameInterpolator *)self adjustUsage:a3];
  self->_int64_t usage = v8;
  if (v8 == -1) {
    return -22002;
  }
  BOOL legacyNormalizationMode = self->_legacyNormalizationMode;
  dispatch_semaphore_t v10 = [FRCImageProcessor alloc];
  int64_t usage = self->_usage;
  if (legacyNormalizationMode) {
    dispatch_semaphore_t v12 = [(FRCImageProcessor *)v10 initLegacyModeWithUsage:usage];
  }
  else {
    dispatch_semaphore_t v12 = [(FRCImageProcessor *)v10 initWithUsage:usage];
  }
  imageProcessor = self->_imageProcessor;
  self->_imageProcessor = v12;

  [(FRCImageProcessor *)self->_imageProcessor setInputRotation:self->_inputRotation];
  FRCGetInputFrameSizeForUsage(self->_usage, (uint64_t *)&self->_width, (uint64_t *)&self->_height);
  if (!self->_qualityMode && self->_useCase == 1 || self->_opticalFlowAdaptationLayer) {
    [(OpticalFlow *)self->_opticalFlow setUseAdaptationLayer:1];
  }
  [(OpticalFlow *)self->_opticalFlow setRevision:self->_opticalFlowRevision];
  [(OpticalFlow *)self->_opticalFlow setWaitForCompletion:self->_lowMemoryMode];
  if (![(OpticalFlow *)self->_opticalFlow switchUsageTo:self->_usage])
  {
    logger = self->_logger;
    if (os_log_type_enabled(logger, OS_LOG_TYPE_ERROR)) {
      -[FRCFrameInterpolator startSessionWithUsage:](logger);
    }
    return -22007;
  }
  if (![(FRCFrameInterpolator *)self configureSynthesis])
  {
    os_log_t v18 = self->_logger;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[FRCFrameInterpolator startSessionWithUsage:](v18);
    }
    return -22007;
  }
  [(OpticalFlow *)self->_opticalFlow setSkipLastLevel:self->_secondLevelFlow];
  dispatch_group_t v14 = objc_alloc_init(FRCFrameDropDetector);
  frameDropDetector = self->_frameDropDetector;
  self->_frameDropDetector = v14;

  [(FRCFrameDropDetector *)self->_frameDropDetector setSingleDropRecoveryEnabled:[(FRCFrameInterpolator *)self singleDropRecoveryEnabled]];
  int64_t gatingLevel = self->_gatingLevel;
  switch(gatingLevel)
  {
    case 2:
      self->_gatingEnabled = 1;
      self->_forceFrameOutput = 1;
      break;
    case 1:
      self->_gatingEnabled = 0;
      break;
    case 0:
      self->_gatingEnabled = self->_useCase != 2;
      break;
  }
  [(FRCFrameInterpolator *)self allocateInternalBuffers];
  BOOL v19 = 1;
  self->_enableCrossFlowAnalysis = 1;
  uint64_t v20 = MEMORY[0x1E4F1F9F8];
  long long v21 = *MEMORY[0x1E4F1F9F8];
  *(_OWORD *)&self->_lastFramePts.value = *MEMORY[0x1E4F1F9F8];
  int64_t v22 = *(void *)(v20 + 16);
  self->_lastFramePts.epoch = v22;
  *(_OWORD *)&self->_lastFrameDuration.value = v21;
  self->_lastFrameDuration.epoch = v22;
  self->_lastFramesToInterpolate = 0;
  *(_OWORD *)&self->_ptsForLiteDebugging.value = v21;
  self->_ptsForLiteDebugging.epoch = v22;
  self->_concurrentOpticalFlow = 1;
  *(_WORD *)&self->_onDemandOpticalFlowBuffersAllocation = 257;
  self->_int64_t state = 2;
  [(FRCFrameInterpolator *)self setPropertiesFromDefaults];
  [(FRCFrameInterpolator *)self configureGating];
  if (!self->_qualityMode)
  {
    self->_concurrentOpticalFlow = 1;
LABEL_42:
    self->_onDemandOpticalFlowBuffersAllocation = v19;
    goto LABEL_43;
  }
  unint64_t synthesisMode = self->_synthesisMode;
  if (synthesisMode != 10)
  {
    if (synthesisMode == 3)
    {
      BOOL v19 = 0;
      self->_concurrentOpticalFlow = 1;
    }
    else
    {
      self->_concurrentOpticalFlow = 1;
      BOOL v19 = (unint64_t)FRCGetNumberOfPixelsForUsage(a3) > 0x1FA400;
    }
    goto LABEL_42;
  }
LABEL_43:
  self->_onDemandSynthesisBufferAllocation = v19;
  if (self->_lowMemoryMode)
  {
    BOOL v24 = self->_gatingLevel == 0;
    self->_onDemandOpticalFlowBuffersAllocation = v24;
    self->_onDemandSynthesisBufferAllocation = v24;
    [(FRCSynthesis *)self->_synthesis setFramePipeline:0];
  }
  [(OpticalFlow *)self->_opticalFlow setConcurrentDualFlowProcessing:self->_concurrentOpticalFlow];
  if (self->_onDemandOpticalFlowBuffersAllocation) {
    self->_streamingMode = 0;
  }
  else {
    [(OpticalFlow *)self->_opticalFlow allocateResources];
  }
  if (!self->_onDemandSynthesisBufferAllocation) {
    [(FRCSynthesis *)self->_synthesis allocateResources];
  }
  NSLog(&cfstr_FrcSessionStar.isa, self->_usage, self->_width, self->_height, self->_qualityMode, self->_tilingEnabled, [(OpticalFlow *)self->_opticalFlow downsampling], self->_synthesisMode, self->_concurrentOpticalFlow, [(OpticalFlow *)self->_opticalFlow twoStageFlow], [(FRCImageProcessor *)self->_imageProcessor selfNormalization], [(FRCSynthesis *)self->_synthesis temporalFiltering], [(FRCSynthesis *)self->_synthesis linearSplatting], [(OpticalFlow *)self->_opticalFlow useAdaptationLayer], [(OpticalFlow *)self->_opticalFlow revision]);
  v25 = self->_logger;
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t useCase = self->_useCase;
    *(_DWORD *)buf = 67109120;
    int v33 = useCase;
    _os_log_impl(&dword_1DC827000, v25, OS_LOG_TYPE_DEFAULT, "Use case: %d", buf, 8u);
  }
  if (self->_lowMemoryMode)
  {
    v27 = self->_logger;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DC827000, v27, OS_LOG_TYPE_DEFAULT, "Low Memory Mode", buf, 2u);
    }
  }
  if (self->_streamingMode) {
    NSLog(&cfstr_FrcStreamingMo.isa);
  }
  v28 = [MEMORY[0x1E4F1C9C8] date];
  startTime = self->_startTime;
  self->_startTime = v28;

  self->_gated = 0;
  self->_totalFramesInterpolated = 0;
  self->_totalFramePairsProcessed = 0;
  sessionStatistics = self->_sessionStatistics;
  self->_sessionStatistics = 0;

  self->_sessionResult = -1;
  uint64_t v31 = MEMORY[0x1E4F1FA48];
  *(_OWORD *)&self->_maxTimeGap.value = *MEMORY[0x1E4F1FA48];
  self->_maxTimeGap.epoch = *(void *)(v31 + 16);
  self->_recommendation = 0;
  self->_shouldGatedForInteractive = 0;
  *(void *)&self->_maxPixelMeanDiff = 0;
  self->_firstPairInSession = 1;
  kdebug_trace();
  return -22000;
}

- (BOOL)configureSynthesis
{
  p_synthesis = &self->_synthesis;
  int64_t usage = self->_usage;
  [(FRCSynthesis *)self->_synthesis setFramePipeline:1];
  if (p_synthesis[67] == (FRCSynthesis *)10)
  {
    deepSynthesis = [[LiteSynthesis alloc] initWithMode:[(FRCFrameInterpolator *)self usage]];
    liteSynthesis = self->_liteSynthesis;
    self->_liteSynthesis = deepSynthesis;
  }
  else
  {
    deepSynthesis = (LiteSynthesis *)self->_deepSynthesis;
  }
  objc_storeStrong((id *)p_synthesis, deepSynthesis);
  int64_t qualityMode = self->_qualityMode;
  if (qualityMode == 3)
  {
    BOOL v8 = 0;
    goto LABEL_8;
  }
  if (qualityMode == 4)
  {
    BOOL v8 = 1;
LABEL_8:
    self->_unint64_t synthesisMode = 3;
    self->_useFlowConsistencyMap = v8;
    self->_twoLayerSynthesis = v8;
  }
  [(FRCFrameInterpolator *)self setSynthesisOptionsFromDefaults];
  if (self->_qualityMode || self->_useCase != 1)
  {
    if (self->_synthesisMode == 10) {
      goto LABEL_17;
    }
  }
  else
  {
    self->_unint64_t synthesisMode = 3;
  }
  -[FRCSynthesis setSynthesisMode:](self->_synthesis, "setSynthesisMode:");
  [(FRCSynthesis *)self->_synthesis setFlowLevel:1];
  [(FRCSynthesis *)self->_synthesis setLinearSplatting:self->_linearSplatting];
  if (self->_secondLevelFlow)
  {
    [(FRCFrameInterpolator *)self setTilingEnabled:0];
    if (self->_synthesisMode != 3 && ([(FRCSynthesis *)*p_synthesis linearSplatting] & 1) == 0) {
      int64_t usage = getQuarterSizeUsage(self->_usage);
    }
  }
LABEL_17:
  if (self->_qualityMode == 2) {
    [(FRCSynthesis *)self->_synthesis setTemporalFiltering:self->_synthesisTemporalSmoothing];
  }
  if (self->_synthesisMode == 3)
  {
    [(FRCSynthesis *)self->_synthesis setUseFlowConsistencyMap:self->_useFlowConsistencyMap];
    [(FRCSynthesis *)self->_synthesis setTwoLayerFlowSplatting:self->_twoLayerSynthesis];
    [(FRCSynthesis *)self->_synthesis setTwoLayerQuarterSizeDC:self->_twoLayerSynthesisQuarterSizeDC];
  }
  int64_t v9 = *p_synthesis;
  return [(FRCSynthesis *)v9 switchUsageTo:usage];
}

- (int64_t)endSession
{
  if (self->_state == 2)
  {
    if (!self->_gated)
    {
      if ([(FRCFrameDropDetector *)self->_frameDropDetector numberOfInsertionPoints]
        && (unint64_t totalFramePairsProcessed = self->_totalFramePairsProcessed,
            totalFramePairsProcessed < [(FRCFrameDropDetector *)self->_frameDropDetector numberOfInsertionPoints]))
      {
        int64_t v4 = 3;
      }
      else
      {
        int64_t v4 = 0;
      }
      self->_sessionResult = v4;
    }
    [(FRCFrameInterpolator *)self updateRecommendation];
    [(OpticalFlow *)self->_opticalFlow releaseResources];
    [(FRCSynthesis *)self->_synthesis releaseResources];
    [(FRCFrameInterpolator *)self releaseInternalBuffers];
    float v6 = [MEMORY[0x1E4F1C9C8] date];
    [v6 timeIntervalSinceDate:self->_startTime];
    double v8 = v7;

    [(FRCFrameInterpolator *)self constructSessionStatisticsWithSessionDuration:v8];
    frameDropDetector = self->_frameDropDetector;
    self->_frameDropDetector = 0;

    self->_int64_t state = 1;
    imageProcessor = self->_imageProcessor;
    self->_imageProcessor = 0;

    self->_double sessionConfidence = 1.0;
    flowAnalyzer = self->_flowAnalyzer;
    if (flowAnalyzer)
    {
      if (self->_gatingLevel == 2) {
        [(OpticalFlowAnalyzer *)flowAnalyzer confidenceScoreOnDemand];
      }
      else {
        [(OpticalFlowAnalyzer *)flowAnalyzer confidenceScore];
      }
      self->_double sessionConfidence = v12;
    }
    v13 = self->_flowAnalyzer;
    self->_flowAnalyzer = 0;

    self->_gatingPaused = 0;
    unint64_t totalFramesInterpolated = self->_totalFramesInterpolated;
    double sessionConfidence = self->_sessionConfidence;
    if (self->_gated) {
      NSLog(&cfstr_SessionEndedGa.isa, totalFramesInterpolated, *(void *)&v8, *(void *)&sessionConfidence);
    }
    else {
      NSLog(&cfstr_SessionEndedLd.isa, totalFramesInterpolated, *(void *)&v8, *(void *)&sessionConfidence);
    }
    return -22000;
  }
  else
  {
    NSLog(&cfstr_ErrorSessionSe.isa, a2);
    return -22003;
  }
}

- (void)dealloc
{
  [(FRCFrameInterpolator *)self releaseInternalBuffers];
  opticalFlow = self->_opticalFlow;
  self->_opticalFlow = 0;

  deepSynthesis = self->_deepSynthesis;
  self->_deepSynthesis = 0;

  liteSynthesis = self->_liteSynthesis;
  self->_liteSynthesis = 0;

  synthesis = self->_synthesis;
  self->_synthesis = 0;

  imageProcessor = self->_imageProcessor;
  self->_imageProcessor = 0;

  scaler = self->_scaler;
  self->_scaler = 0;

  v9.receiver = self;
  v9.super_class = (Class)FRCFrameInterpolator;
  [(FRCFrameInterpolator *)&v9 dealloc];
}

- (void)allocateInternalBuffers
{
  size_t width = self->_width;
  size_t height = self->_height;
  size_t v8 = height;
  size_t v9 = width;
  if (self->_secondLevelFlow)
  {
    __int16 QuarterSizeUsage = getQuarterSizeUsage(self->_usage);
    FRCGetInputFrameSizeForUsage(QuarterSizeUsage, (uint64_t *)&v9, (uint64_t *)&v8);
    size_t width = v9;
    size_t height = (v8 + 7) & 0xFFFFFFFFFFFFFFF8;
  }
  self->_flowForward = createPixelBuffer(width >> 1, height, 0x4C303068u, 0);
  PixelBuffer = createPixelBuffer(width >> 1, height, 0x4C303068u, 0);
  self->_flowBackward = PixelBuffer;
  if (self->_gatingEnabled)
  {
    if (self->_inputScaling)
    {
      height *= 2;
      self->_flowForwardGating = createPixelBuffer(width, height, 0x4C303068u, 0);
      self->_flowBackwardGating = createPixelBuffer(width, height, 0x4C303068u, 0);
      size_t v7 = width;
    }
    else
    {
      self->_flowForwardGating = self->_flowForward;
      self->_flowBackwardGating = PixelBuffer;
      size_t v7 = width >> 1;
    }
    self->_prevFlowBackwardGating = createPixelBuffer(v7, height, 0x4C303068u, 0);
  }
}

- (void)releaseInternalBuffers
{
  p_flowForward = &self->_flowForward;
  flowForward = self->_flowForward;
  if (flowForward) {
    CVPixelBufferRelease(flowForward);
  }
  flowBackward = self->_flowBackward;
  if (flowBackward) {
    CVPixelBufferRelease(flowBackward);
  }
  if (self->_gatingEnabled && self->_inputScaling)
  {
    CVPixelBufferRelease(self->_flowForwardGating);
    CVPixelBufferRelease(self->_flowBackwardGating);
  }
  prevFlowBackwardGating = self->_prevFlowBackwardGating;
  if (prevFlowBackwardGating) {
    CVPixelBufferRelease(prevFlowBackwardGating);
  }
  p_flowForward[4] = 0;
  *(_OWORD *)p_flowForward = 0u;
  *((_OWORD *)p_flowForward + 1) = 0u;
  outputPixelBufferPool = self->_outputPixelBufferPool;
  if (outputPixelBufferPool)
  {
    CFRelease(outputPixelBufferPool);
    self->_outputPixelBufferPool = 0;
  }
  quarterResRGB = self->_quarterResRGB;
  if (quarterResRGB)
  {
    CVPixelBufferRelease(quarterResRGB);
    self->_quarterResRGB = 0;
  }
}

- (void)getPixelAttributesForBuffer:(__CVBuffer *)a3
{
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  CFDictionaryRef v15 = CVPixelFormatDescriptionCreateWithPixelFormatType((CFAllocatorRef)*MEMORY[0x1E4F1CF80], PixelFormatType);
  float v6 = [(__CFDictionary *)v15 objectForKeyedSubscript:*MEMORY[0x1E4F24E50]];
  self->_fullRange = [v6 isEqualToString:*MEMORY[0x1E4F24E58]];
  size_t v7 = [(__CFDictionary *)v15 objectForKeyedSubscript:*MEMORY[0x1E4F24E20]];
  self->_unint64_t bitDepth = (int)[v7 intValue];

  size_t v8 = [(__CFDictionary *)v15 objectForKeyedSubscript:*MEMORY[0x1E4F24EB8]];
  self->_isYUV = [v8 BOOLValue];

  BOOL v9 = !self->_inputScaling && self->_inputRotation == 0;
  if (self->_isYUV)
  {
    if (!self->_fullRange) {
      BOOL v9 = 1;
    }
    BOOL v10 = !v9 || self->_bitDepth == 16;
  }
  else
  {
    BOOL v10 = 0;
  }
  self->_removeCMAttachment = v10;
  v11 = [(__CFDictionary *)v15 objectForKeyedSubscript:*MEMORY[0x1E4F24EB0]];
  int v12 = [v11 BOOLValue];

  if (self->_isYUV)
  {
    unint64_t bitDepth = self->_bitDepth;
    if (bitDepth == 10)
    {
      unsigned int v14 = 1999843442;
    }
    else if (bitDepth == 8)
    {
      if (self->_qualityMode == 4) {
        unsigned int v14 = 759318337;
      }
      else {
        unsigned int v14 = 1111970369;
      }
    }
    else
    {
      unsigned int v14 = 1380411457;
    }
    self->_RGBAFormat = v14;
  }
  else if (v12)
  {
    self->_RGBAFormat = CVPixelBufferGetPixelFormatType(a3);
  }
}

- (id)createOutputFramesWithWidth:(unint64_t)a3 height:(unint64_t)a4 pixelFormat:(unsigned int)a5 numberOframes:(unint64_t)a6
{
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  PixelBuffer = createPixelBuffer(a3, a4, a5, 0);
  v11 = [FRCFrame alloc];
  CMTimeMake(&v14, 0, 0);
  int v12 = [(FRCFrame *)v11 initWithBuffer:PixelBuffer presentationTimeStamp:&v14];
  CVPixelBufferRelease(PixelBuffer);
  [v9 addObject:v12];

  return v9;
}

- (id)interpolateBetweenFirstFrame:(id)a3 secondFrame:(id)a4 numberOfFrames:(unint64_t)a5 withError:(id *)a6
{
  id v10 = a4;
  id v11 = a3;
  int v12 = uniformTimeScales(a5);
  v13 = [(FRCFrameInterpolator *)self interpolateBetweenFirstFrame:v11 secondFrame:v10 timeScales:v12 withError:a6];

  return v13;
}

- (id)interpolateBetweenFirstFrame:(id)a3 secondFrame:(id)a4 timeScales:(id)a5 withError:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  unint64_t synthesisMode = self->_synthesisMode;
  if ((unint64_t)[v12 count] < 0xA || synthesisMode)
  {
    uint64_t PixelFormatType = CVPixelBufferGetPixelFormatType((CVPixelBufferRef)[v10 buffer]);
    size_t Width = CVPixelBufferGetWidth((CVPixelBufferRef)[v10 buffer]);
    uint64_t v14 = -[FRCFrameInterpolator interpolateBetweenFirstFrame:secondFrame:timeScales:outputSize:outputPixelFormat:withError:](self, "interpolateBetweenFirstFrame:secondFrame:timeScales:outputSize:outputPixelFormat:withError:", v10, v11, v12, PixelFormatType, a6, (double)Width, (double)CVPixelBufferGetHeight((CVPixelBufferRef)[v10 buffer]));
  }
  else
  {
    uint64_t v14 = [(FRCFrameInterpolator *)self interpolateRecursiveFirstFrame:v10 secondFrame:v11 timeScale:v12 withError:a6];
  }
  v17 = (void *)v14;

  return v17;
}

- (id)errorWithErrorCode:(int64_t)a3
{
  if ((unint64_t)(a3 + 22009) > 6) {
    int64_t v4 = &stru_1F37D1328;
  }
  else {
    int64_t v4 = off_1E6CA4370[a3 + 22009];
  }
  float v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v4 forKey:*MEMORY[0x1E4F28568]];
  float v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.FRC" code:a3 userInfo:v5];

  return v6;
}

- (BOOL)interpolateBetweenFirstFrame:(id)a3 secondFrame:(id)a4 timeScales:(id)a5 outputFrames:(id)a6 withError:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  BOOL v16 = [(FRCFrameInterpolator *)self checkFrameFormatConsistencyFirstFrame:v12 secondFrame:v13 outputFrames:v15];
  uint64_t v17 = [v14 count];
  if (v17 == [v15 count])
  {
    if (v16)
    {
      objc_storeStrong((id *)&self->_outputFrameListFromClient, a6);
      os_log_t v18 = [(FRCFrameInterpolator *)self interpolateBetweenFirstFrame:v12 secondFrame:v13 timeScales:v14 withError:a7];
      outputFrameListFromClient = self->_outputFrameListFromClient;
      self->_outputFrameListFromClient = 0;

      BOOL v20 = v18 != 0;
      goto LABEL_8;
    }
  }
  else
  {
    NSLog(&cfstr_ErrorTheNumber.isa);
  }
  if (a7)
  {
    [(FRCFrameInterpolator *)self errorWithErrorCode:-22005];
    BOOL v20 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v20 = 0;
  }
LABEL_8:

  return v20;
}

- (id)interpolateBetweenFirstFrame:(id)a3 secondFrame:(id)a4 timeScales:(id)a5 outputSize:(CGSize)a6 outputPixelFormat:(unsigned int)a7 withError:(id *)a8
{
  double height = a6.height;
  double width = a6.width;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  if (self->_state != 2)
  {
    NSLog(&cfstr_SessionIsNotSt.isa);
    if (a8)
    {
      BOOL v20 = self;
      uint64_t v21 = -22003;
LABEL_18:
      [(FRCFrameInterpolator *)v20 errorWithErrorCode:v21];
      id v22 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_76;
    }
LABEL_19:
    id v22 = 0;
    goto LABEL_76;
  }
  if (![v15 buffer] || !objc_msgSend(v16, "buffer"))
  {
    NSLog(&cfstr_InputBufferIsN.isa);
    goto LABEL_16;
  }
  if (!v17)
  {
    NSLog(&cfstr_TimescaleIsNul.isa);
LABEL_16:
    if (a8)
    {
      BOOL v20 = self;
      uint64_t v21 = -22009;
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  if (self->_streamingMode
    && ![(FRCFrameInterpolator *)self checkStreamingBufferConsistencyFirstFrame:v15 secondFrame:v16])
  {
    self->_streamingMode = 0;
  }
  -[FRCFrameInterpolator getPixelAttributesForBuffer:](self, "getPixelAttributesForBuffer:", [v15 buffer]);
  outputPixelBufferPool = self->_outputPixelBufferPool;
  if (!outputPixelBufferPool || self->_outputPixelFormat != a7)
  {
    CVPixelBufferPoolRelease(outputPixelBufferPool);
    self->_outputPixelBufferPool = createPixelBufferPool((unint64_t)width, (unint64_t)height, a7, 0);
  }
  self->_outputPixelFormat = a7;
  unint64_t v19 = [v17 count];
  ++self->_totalFramePairsProcessed;
  memset(&v87, 0, sizeof(v87));
  if (v16) {
    [v16 presentationTimeStamp];
  }
  else {
    memset(&lhs, 0, sizeof(lhs));
  }
  if (v15) {
    [v15 presentationTimeStamp];
  }
  else {
    memset(&rhs, 0, sizeof(rhs));
  }
  CMTimeSubtract(&v87, &lhs, &rhs);
  CMTime time1 = (CMTime)self->_maxTimeGap;
  CMTime time2 = v87;
  CMTimeMaximum(&lastFramePts, &time1, &time2);
  self->_maxTimeGap = ($95D729B680665BEAEFA1D6FCA8238556)lastFramePts;
  BOOL gatingEnabled = self->_gatingEnabled;
  if (self->_gatingEnabled) {
    BOOL gatingEnabled = !self->_gatingPaused;
  }
  BOOL v25 = (self->_gatingLevel != 2 || v19 > 3) && gatingEnabled;
  if (self->_useCase)
  {
    self->_cleanRectFirst = CVImageBufferGetCleanRect((CVImageBufferRef)[v15 buffer]);
    self->_cleanRectSecond = CVImageBufferGetCleanRect((CVImageBufferRef)[v16 buffer]);
  }
  unint64_t v52 = v19;
  if (v25)
  {
    flowAnalyzer = self->_flowAnalyzer;
    frameDropDetector = self->_frameDropDetector;
    if (v15) {
      [v15 presentationTimeStamp];
    }
    else {
      memset(&v84, 0, sizeof(v84));
    }
    CMTime lastFramePts = (CMTime)self->_lastFramePts;
    int32_t v28 = CMTimeCompare(&lastFramePts, &v84);
    BOOL v29 = self->_gatingEnabled;
    BOOL v30 = self->_gatingEnabled && self->_enableCrossFlowAnalysis;
    CMTime lastFramePts = v87;
    -[OpticalFlowAnalyzer prepareGatingFrameDropDetector:numberOfFrames:timeGap:isContinuousDrops:enableFlowAnalysis:enableCrossFlowAnalysis:cleanRectFirst:cleanRectSecond:](flowAnalyzer, "prepareGatingFrameDropDetector:numberOfFrames:timeGap:isContinuousDrops:enableFlowAnalysis:enableCrossFlowAnalysis:cleanRectFirst:cleanRectSecond:", frameDropDetector, v52, &lastFramePts, v28 == 0, v29, v30, self->_cleanRectFirst.origin.x, self->_cleanRectFirst.origin.y, self->_cleanRectFirst.size.width, self->_cleanRectFirst.size.height, self->_cleanRectSecond.origin.x, self->_cleanRectSecond.origin.y, self->_cleanRectSecond.size.width, self->_cleanRectSecond.size.height);
  }
  kdebug_trace();
  unint64_t v31 = self->_width;
  BOOL v51 = v31 != CVPixelBufferGetWidth((CVPixelBufferRef)[v15 buffer]) || self->_isYUV;
  [(FRCFrameInterpolator *)self preserveCMAttachmentFirstFrame:v15 secondFrame:v16];
  if (!v15)
  {
    memset(v83, 0, sizeof(v83));
    if (v16) {
      goto LABEL_48;
    }
LABEL_50:
    memset(v82, 0, sizeof(v82));
    goto LABEL_51;
  }
  [v15 presentationTimeStamp];
  if (!v16) {
    goto LABEL_50;
  }
LABEL_48:
  [v16 presentationTimeStamp];
LABEL_51:
  BOOL v32 = [(FRCFrameInterpolator *)self shallReusePreviousFlowPts0:v83 Pts1:v82];
  if (self->_streamingMode && !self->_firstPairInSession)
  {
    -[FRCImageProcessor preProcessFirstInput:secondInput:waitForCompletion:](self->_imageProcessor, "preProcessFirstInput:secondInput:waitForCompletion:", 0, [v16 buffer], 0);
    char v33 = 1;
  }
  else
  {
    -[FRCImageProcessor preProcessFirstInput:secondInput:waitForCompletion:](self->_imageProcessor, "preProcessFirstInput:secondInput:waitForCompletion:", [v15 buffer], objc_msgSend(v16, "buffer"), 0);
    char v33 = 0;
  }
  dispatchGroup = self->_dispatchGroup;
  concurrentQueue = self->_concurrentQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __115__FRCFrameInterpolator_interpolateBetweenFirstFrame_secondFrame_timeScales_outputSize_outputPixelFormat_withError___block_invoke;
  block[3] = &unk_1E6CA42B0;
  block[4] = self;
  char v80 = v33;
  BOOL v81 = v32;
  dispatch_group_async(dispatchGroup, concurrentQueue, block);
  time1.value = 0;
  *(void *)&time1.timescale = &time1;
  time1.epoch = 0x2020000000;
  uint64_t v78 = 0;
  time2.value = 0;
  *(void *)&time2.timescale = &time2;
  time2.epoch = 0x2020000000;
  uint64_t v76 = 0;
  if (v25)
  {
    v36 = self->_dispatchGroup;
    v37 = self->_concurrentQueue;
    v73[0] = MEMORY[0x1E4F143A8];
    v73[1] = 3221225472;
    v73[2] = __115__FRCFrameInterpolator_interpolateBetweenFirstFrame_secondFrame_timeScales_outputSize_outputPixelFormat_withError___block_invoke_2;
    v73[3] = &unk_1E6CA42D8;
    v73[4] = self;
    id v38 = v15;
    id v74 = v38;
    dispatch_group_async(v36, v37, v73);
    if (!self->_gatingLevel)
    {
      v39 = self->_dispatchGroup;
      v40 = self->_concurrentQueue;
      v70[0] = MEMORY[0x1E4F143A8];
      v70[1] = 3221225472;
      v70[2] = __115__FRCFrameInterpolator_interpolateBetweenFirstFrame_secondFrame_timeScales_outputSize_outputPixelFormat_withError___block_invoke_3;
      v70[3] = &unk_1E6CA4300;
      v70[4] = self;
      id v71 = v38;
      id v72 = v16;
      dispatch_group_async(v39, v40, v70);
    }
    if ((void)[(OpticalFlow *)self->_opticalFlow imageFeatures][464]
      && (void)[(OpticalFlow *)self->_opticalFlow imageFeatures][944])
    {
      CVPixelBufferRef v41 = CVPixelBufferRetain((CVPixelBufferRef)[(OpticalFlow *)self->_opticalFlow imageFeatures][464]);
      *(void *)(*(void *)&time1.timescale + 24) = v41;
      CVPixelBufferRef v42 = CVPixelBufferRetain((CVPixelBufferRef)[(OpticalFlow *)self->_opticalFlow imageFeatures][944]);
      *(void *)(*(void *)&time2.timescale + 24) = v42;
    }
    else
    {
      v43 = self->_dispatchGroup;
      v44 = self->_concurrentQueue;
      v69[0] = MEMORY[0x1E4F143A8];
      v69[1] = 3221225472;
      v69[2] = __115__FRCFrameInterpolator_interpolateBetweenFirstFrame_secondFrame_timeScales_outputSize_outputPixelFormat_withError___block_invoke_4;
      v69[3] = &unk_1E6CA4328;
      v69[4] = self;
      v69[5] = &time1;
      v69[6] = &time2;
      dispatch_group_async(v43, v44, v69);
    }
  }
  dispatch_group_wait((dispatch_group_t)self->_dispatchGroup, 0xFFFFFFFFFFFFFFFFLL);
  lastFramePts.value = 0;
  *(void *)&lastFramePts.timescale = &lastFramePts;
  lastFramePts.epoch = 0x3032000000;
  v66 = __Block_byref_object_copy__0;
  v67 = __Block_byref_object_dispose__0;
  id v68 = 0;
  v45 = self->_dispatchGroup;
  v46 = self->_concurrentQueue;
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __115__FRCFrameInterpolator_interpolateBetweenFirstFrame_secondFrame_timeScales_outputSize_outputPixelFormat_withError___block_invoke_104;
  v56[3] = &unk_1E6CA4350;
  p_CMTime lastFramePts = &lastFramePts;
  v56[4] = self;
  id v57 = v15;
  id v47 = v16;
  id v58 = v47;
  id v59 = v17;
  double v61 = width;
  double v62 = height;
  unsigned int v63 = a7;
  BOOL v64 = v51;
  dispatch_group_async(v45, v46, v56);
  if (v25)
  {
    v48 = self->_dispatchGroup;
    v49 = self->_concurrentQueue;
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __115__FRCFrameInterpolator_interpolateBetweenFirstFrame_secondFrame_timeScales_outputSize_outputPixelFormat_withError___block_invoke_2_105;
    v55[3] = &unk_1E6CA4328;
    v55[4] = self;
    v55[5] = &time1;
    v55[6] = &time2;
    dispatch_group_async(v48, v49, v55);
  }
  dispatch_group_wait((dispatch_group_t)self->_dispatchGroup, 0xFFFFFFFFFFFFFFFFLL);
  if (v16) {
    [v47 presentationTimeStamp];
  }
  else {
    memset(v54, 0, sizeof(v54));
  }
  CMTime v53 = v87;
  [(FRCFrameInterpolator *)self updateLastFramePts:v54 duration:&v53 toInterpolate:v52];
  if (v25)
  {
    if ([(FRCFrameInterpolator *)self updateGatingResult])
    {
      if (a8)
      {
        *a8 = [(FRCFrameInterpolator *)self errorWithErrorCode:-22006];
      }
      if (!self->_forceFrameOutput)
      {
        [*(id *)(*(void *)&lastFramePts.timescale + 40) removeAllObjects];
        id v22 = 0;
        goto LABEL_75;
      }
    }
    [(FRCFrameInterpolator *)self updateBackwardFlow];
  }
  self->_firstPairInSession = 0;
  self->_gatingPaused = 0;
  kdebug_trace();
  id v22 = *(id *)(*(void *)&lastFramePts.timescale + 40);
LABEL_75:

  _Block_object_dispose(&lastFramePts, 8);
  _Block_object_dispose(&time2, 8);
  _Block_object_dispose(&time1, 8);
LABEL_76:

  return v22;
}

uint64_t __115__FRCFrameInterpolator_interpolateBetweenFirstFrame_secondFrame_timeScales_outputSize_outputPixelFormat_withError___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  if (*(unsigned char *)(a1 + 40))
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = [*(id *)(v2 + 440) normalizedFirst];
    uint64_t v2 = *(void *)(a1 + 32);
  }
  objc_msgSend(v3, "opticalFlowFirstFrame:secondFrame:flowForward:flowBackward:reUseFlow:", v4, objc_msgSend(*(id *)(v2 + 440), "normalizedSecond"), *(void *)(*(void *)(a1 + 32) + 56), *(void *)(*(void *)(a1 + 32) + 64), *(unsigned __int8 *)(a1 + 41));
  return kdebug_trace();
}

uint64_t __115__FRCFrameInterpolator_interpolateBetweenFirstFrame_secondFrame_timeScales_outputSize_outputPixelFormat_withError___block_invoke_2(uint64_t a1)
{
  size_t Width = CVPixelBufferGetWidth(*(CVPixelBufferRef *)(*(void *)(a1 + 32) + 56));
  size_t Height = CVPixelBufferGetHeight(*(CVPixelBufferRef *)(*(void *)(a1 + 32) + 56));
  size_t v4 = Height >> 1;
  uint64_t v5 = *(void *)(a1 + 32);
  if (!*(void *)(v5 + 544) && *(unsigned char *)(v5 + 493))
  {
    Width *= 2;
    size_t v4 = Height & 0xFFFFFFFFFFFFFFFELL;
  }
  if (!*(void *)(v5 + 464))
  {
    *(void *)(*(void *)(a1 + 32) + 464) = createPixelBuffer(Width, v4, *(_DWORD *)(v5 + 432), 0);
    uint64_t v5 = *(void *)(a1 + 32);
  }
  float v6 = *(void **)(v5 + 40);
  uint64_t v7 = [*(id *)(a1 + 40) buffer];
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(v8 + 464);
  uint64_t v10 = *(void *)(v8 + 296);
  return [v6 downScaleFrameSource:v7 destination:v9 rotate:v10 waitForCompletion:0];
}

uint64_t __115__FRCFrameInterpolator_interpolateBetweenFirstFrame_secondFrame_timeScales_outputSize_outputPixelFormat_withError___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 48);
  uint64_t v3 = [*(id *)(a1 + 40) buffer];
  uint64_t v4 = [*(id *)(a1 + 48) buffer];
  return [v2 runDetectionFromFirstBuffer:v3 secondBuffer:v4];
}

uint64_t __115__FRCFrameInterpolator_interpolateBetweenFirstFrame_secondFrame_timeScales_outputSize_outputPixelFormat_withError___block_invoke_4(void *a1)
{
  size_t Width = CVPixelBufferGetWidth(*(CVPixelBufferRef *)(a1[4] + 56));
  size_t v3 = 3 * (CVPixelBufferGetHeight(*(CVPixelBufferRef *)(a1[4] + 56)) >> 1);
  *(void *)(*(void *)(a1[5] + 8) + 24) = createPixelBuffer(Width, v3, 0x4C303068u, 0);
  *(void *)(*(void *)(a1[6] + 8) + 24) = createPixelBuffer(Width, v3, 0x4C303068u, 0);
  objc_msgSend(*(id *)(a1[4] + 8), "subsampleInput:to:forUsage:", objc_msgSend(*(id *)(a1[4] + 440), "normalizedFirst"), *(void *)(*(void *)(a1[5] + 8) + 24), getQuarterSizeUsage(*(void *)(a1[4] + 512)));
  uint64_t v4 = a1[4];
  uint64_t v5 = *(void **)(v4 + 8);
  uint64_t v6 = [*(id *)(v4 + 440) normalizedSecond];
  uint64_t v7 = *(void *)(*(void *)(a1[6] + 8) + 24);
  uint64_t QuarterSizeUsage = getQuarterSizeUsage(*(void *)(a1[4] + 512));
  return [v5 subsampleInput:v6 to:v7 forUsage:QuarterSizeUsage];
}

uint64_t __115__FRCFrameInterpolator_interpolateBetweenFirstFrame_secondFrame_timeScales_outputSize_outputPixelFormat_withError___block_invoke_104(uint64_t a1)
{
  uint64_t v2 = *(id **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = [v2[55] normalizedFirst];
  uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 440) normalizedSecond];
  LOBYTE(v11) = *(unsigned char *)(a1 + 92);
  uint64_t v7 = objc_msgSend(v2, "synthesizeInterpolatedFrames:second:normalizedFirst:normalizedSecond:timeScales:outputSize:outputPixelFormat:scalerEnabled:", v3, v4, v5, v6, *(void *)(a1 + 56), *(unsigned int *)(a1 + 88), *(double *)(a1 + 72), *(double *)(a1 + 80), v11);
  uint64_t v8 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  [*(id *)(a1 + 32) restoreCMAttachmentToFirstFrame:*(void *)(a1 + 40) secondFrame:*(void *)(a1 + 48) interpolatedFrames:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) count];
  *(void *)(*(void *)(a1 + 32) + 360) += result;
  return result;
}

uint64_t __115__FRCFrameInterpolator_interpolateBetweenFirstFrame_secondFrame_timeScales_outputSize_outputPixelFormat_withError___block_invoke_2_105(void *a1)
{
  kdebug_trace();
  uint64_t v2 = a1[4];
  if (*(unsigned char *)(v2 + 493))
  {
    [*(id *)(v2 + 8) upscaleInputFlow:*(void *)(v2 + 56) outFlow:*(void *)(v2 + 72)];
    [*(id *)(a1[4] + 8) upscaleInputFlow:*(void *)(a1[4] + 64) outFlow:*(void *)(a1[4] + 80)];
  }
  else
  {
    *(void *)(v2 + 72) = *(void *)(v2 + 56);
    *(void *)(a1[4] + 80) = *(void *)(a1[4] + 64);
  }
  uint64_t v3 = a1[4];
  uint64_t v4 = *(void **)(v3 + 48);
  uint64_t v6 = *(void *)(v3 + 80);
  uint64_t v5 = *(void *)(v3 + 88);
  uint64_t v7 = *(void *)(v3 + 72);
  uint64_t v8 = *(void *)(v3 + 464);
  uint64_t v9 = *(void *)(*(void *)(a1[5] + 8) + 24);
  uint64_t v10 = *(void *)(*(void *)(a1[6] + 8) + 24);
  long long v15 = *(_OWORD *)(v3 + 216);
  uint64_t v11 = *(void *)(v3 + 240);
  uint64_t v16 = *(void *)(v3 + 232);
  [v4 runGatingWithPrevFlowBackward:v5 flowForward:v7 flowBackward:v6 lastFrameDuration:&v15 lastNumberOfFrames:v11 flowResFrame:v8 flowResFirst:v9 flowResSecond:v10];
  id v12 = *(__CVBuffer **)(*(void *)(a1[5] + 8) + 24);
  if (v12)
  {
    CVPixelBufferRelease(v12);
    *(void *)(*(void *)(a1[5] + 8) + 24) = 0;
  }
  id v13 = *(__CVBuffer **)(*(void *)(a1[6] + 8) + 24);
  if (v13)
  {
    CVPixelBufferRelease(v13);
    *(void *)(*(void *)(a1[6] + 8) + 24) = 0;
  }
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1[4] + 464));
  *(void *)(a1[4] + 464) = 0;
  [*(id *)(a1[4] + 48) updateGatingStats];
  return kdebug_trace();
}

- (BOOL)updateGatingResult
{
  if ([(OpticalFlowAnalyzer *)self->_flowAnalyzer isSafeToInterpolate])
  {
    BOOL v3 = 0;
  }
  else
  {
    BOOL v3 = 1;
    self->_gated = 1;
    self->_sessionResult = 2;
    if (self->_useCase == 1)
    {
      if ([(OpticalFlowAnalyzer *)self->_flowAnalyzer isSafeToInterpolateForInteractiveMode])
      {
        int64_t gatingLevel = self->_gatingLevel;
        if (gatingLevel == 2)
        {
          char v5 = 0;
          self->_gated = 0;
        }
        else
        {
          char v5 = 1;
        }
      }
      else
      {
        char v5 = 1;
        self->_shouldGatedForInteractive = 1;
        int64_t gatingLevel = self->_gatingLevel;
      }
      if (gatingLevel == 2) {
        BOOL v3 = 0;
      }
      else {
        BOOL v3 = v5;
      }
    }
  }
  if (self->_useCase == 1)
  {
    [(FRCImageProcessor *)self->_imageProcessor secondFramePixelMean];
    float v7 = v6;
    [(FRCImageProcessor *)self->_imageProcessor firstFramePixelMean];
    float v9 = v7 - v8;
    [(FRCImageProcessor *)self->_imageProcessor firstFramePixelMean];
    float v11 = v9 / v10;
    float maxPixelMeanChange = self->_maxPixelMeanChange;
    if (v11 > maxPixelMeanChange)
    {
      self->_maxPixelMeanDiff = v9;
      self->_float maxPixelMeanChange = v11;
      float maxPixelMeanChange = v11;
    }
    if (!self->_gatingLevel && maxPixelMeanChange > 0.09)
    {
      NSLog(&cfstr_Frameinterpola_0.isa);
      self->_gated = 1;
      self->_sessionResult = 4;
    }
  }
  return v3;
}

- (BOOL)checkFrameFormatConsistencyFirstFrame:(id)a3 secondFrame:(id)a4 outputFrames:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v30 = a5;
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType((CVPixelBufferRef)[v7 buffer]);
  size_t Width = CVPixelBufferGetWidth((CVPixelBufferRef)[v7 buffer]);
  size_t Height = CVPixelBufferGetHeight((CVPixelBufferRef)[v7 buffer]);
  OSType v12 = CVPixelBufferGetPixelFormatType((CVPixelBufferRef)[v8 buffer]);
  size_t v13 = CVPixelBufferGetWidth((CVPixelBufferRef)[v8 buffer]);
  size_t v14 = CVPixelBufferGetHeight((CVPixelBufferRef)[v8 buffer]);
  if (v12 == PixelFormatType && v13 == Width && v14 == Height)
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v15 = v30;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      id v28 = v8;
      id v29 = v7;
      uint64_t v18 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v32 != v18) {
            objc_enumerationMutation(v15);
          }
          BOOL v20 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          OSType v21 = CVPixelBufferGetPixelFormatType((CVPixelBufferRef)[v20 buffer]);
          size_t v22 = CVPixelBufferGetWidth((CVPixelBufferRef)[v20 buffer]);
          size_t v23 = CVPixelBufferGetHeight((CVPixelBufferRef)[v20 buffer]);
          if (v21 != PixelFormatType || v22 != Width || v23 != Height)
          {
            NSLog(&cfstr_ErrorInputAndO.isa);
            BOOL v26 = 0;
            goto LABEL_21;
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v17);
      BOOL v26 = 1;
LABEL_21:
      id v8 = v28;
      id v7 = v29;
    }
    else
    {
      BOOL v26 = 1;
    }
  }
  else
  {
    NSLog(&cfstr_ErrorFirstfram.isa);
    BOOL v26 = 0;
  }

  return v26;
}

- (__CVBuffer)synthesisFrameForTimeScale:(float)a3 outputSize:(CGSize)a4 outputPixelFormat:(unsigned int)a5 scalerEnabled:(BOOL)a6 frameIndex:(unint64_t)a7 lastFrame:(BOOL)a8
{
  double height = a4.height;
  double width = a4.width;
  id v15 = (__CVBuffer *)[(FRCSynthesis *)self->_synthesis synthesizeFrameForTimeScale:a7 frameIndex:a6];
  CVPixelBufferRef pixelBufferOut = 0;
  outputFrameListFromClient = self->_outputFrameListFromClient;
  if (outputFrameListFromClient)
  {
    uint64_t v17 = [(NSArray *)outputFrameListFromClient objectAtIndexedSubscript:a7];
    CVPixelBufferRef pixelBufferOut = CVPixelBufferRetain((CVPixelBufferRef)[v17 buffer]);
  }
  else
  {
    outputPixelBufferPool = self->_outputPixelBufferPool;
    if (outputPixelBufferPool) {
      CVPixelBufferPoolCreatePixelBuffer(0, outputPixelBufferPool, &pixelBufferOut);
    }
    else {
      CVPixelBufferRef pixelBufferOut = createPixelBuffer((unint64_t)width, (unint64_t)height, a5, 0);
    }
  }
  if (self->_removeCMAttachment)
  {
    CMRemoveAllAttachments(pixelBufferOut);
    if (a8) {
      goto LABEL_11;
    }
  }
  else
  {
    CMSetAttachments(pixelBufferOut, self->_anchorFrameCMAttachment, 1u);
    if (a8) {
      goto LABEL_11;
    }
  }
  if (([(FRCSynthesis *)self->_synthesis frameSyncRequired] & 1) == 0)
  {
    BOOL lowMemoryMode = self->_lowMemoryMode;
    goto LABEL_13;
  }
LABEL_11:
  BOOL lowMemoryMode = 1;
LABEL_13:
  *(float *)&double v19 = a3;
  [(FRCImageProcessor *)self->_imageProcessor postProcessNormalizedFrame:v15 output:pixelBufferOut timeScale:lowMemoryMode waitForCompletion:v19];
  CVPixelBufferRelease(v15);
  return pixelBufferOut;
}

- (int)closestNumIdxInArray:(id)a3 target:(double)a4
{
  id v5 = a3;
  int v6 = [v5 count];
  int v7 = v6 - 1;
  if (v6 < 3)
  {
    int v8 = 0;
LABEL_12:
    uint64_t v17 = [v5 objectAtIndexedSubscript:v8];
    [v17 doubleValue];
    double v19 = vabdd_f64(a4, v18);
    BOOL v20 = [v5 objectAtIndexedSubscript:v7];
    [v20 doubleValue];
    double v22 = vabdd_f64(v21, a4);

    if (v19 <= v22) {
      int v10 = v8;
    }
    else {
      int v10 = v7;
    }
  }
  else
  {
    int v8 = 0;
    while (1)
    {
      int v9 = v7 - v8;
      if (v7 < v8) {
        ++v9;
      }
      int v10 = v8 + (v9 >> 1);
      float v11 = [v5 objectAtIndexedSubscript:v10];
      [v11 doubleValue];
      double v13 = v12;

      if (v13 == a4) {
        break;
      }
      size_t v14 = [v5 objectAtIndexedSubscript:v10];
      [v14 doubleValue];
      double v16 = v15;

      if (v16 > a4) {
        int v7 = v10;
      }
      else {
        int v8 = v10;
      }
      if (v8 >= v7 - 1) {
        goto LABEL_12;
      }
    }
  }

  return v10;
}

- (id)normalizeTimingFromTimeScales:(id)a3 newBeginIdx:(int)a4 newEndIdx:(int)a5
{
  id v7 = a3;
  int v8 = v7;
  if (a4 == -1)
  {
    double v11 = 0.0;
  }
  else
  {
    int v9 = [v7 objectAtIndexedSubscript:a4];
    [v9 doubleValue];
    double v11 = v10;
  }
  double v12 = 1.0;
  if ([v8 count] != a5)
  {
    double v13 = [v8 objectAtIndexedSubscript:a5];
    [v13 doubleValue];
    double v12 = v14;
  }
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (a4 + 1 < a5)
  {
    double v16 = v12 - v11;
    uint64_t v17 = a4 + 1;
    int v18 = ~a4 + a5;
    do
    {
      double v19 = [v8 objectAtIndexedSubscript:v17];
      [v19 doubleValue];
      double v21 = (v20 - v11) / v16;

      double v22 = [NSNumber numberWithDouble:v21];
      [v15 addObject:v22];

      ++v17;
      --v18;
    }
    while (v18);
  }

  return v15;
}

- (id)interpolateRecursiveFirstFrame:(id)a3 secondFrame:(id)a4 timeScale:(id)a5 withError:(id *)a6
{
  double v10 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v11 = a5;
  id v80 = a4;
  id v12 = a3;
  id v69 = objc_alloc_init(v10);
  uint64_t v13 = [(FRCFrameInterpolator *)self closestNumIdxInArray:v11 target:0.5];
  LODWORD(a4) = v13;
  uint64_t v75 = v13;
  uint64_t v14 = [(FRCFrameInterpolator *)self closestNumIdxInArray:v11 target:0.25];
  LODWORD(v10) = v14;
  uint64_t v72 = v14;
  uint64_t v15 = [(FRCFrameInterpolator *)self closestNumIdxInArray:v11 target:0.75];
  int v16 = v15;
  uint64_t v79 = v15;
  uint64_t v17 = (void *)MEMORY[0x1E4F1C978];
  int v18 = [v11 objectAtIndexedSubscript:(int)a4];
  double v19 = [v17 arrayWithObject:v18];
  id v71 = [(FRCFrameInterpolator *)self interpolateBetweenFirstFrame:v12 secondFrame:v80 timeScales:v19 withError:a6];

  double v20 = [v71 firstObject];
  [v69 insertObject:v20 atIndex:0];

  BOOL gatingEnabled = self->_gatingEnabled;
  self->_BOOL gatingEnabled = 0;
  uint64_t v73 = (int)v10;
  double v21 = objc_msgSend(v11, "objectAtIndexedSubscript:");
  [v21 doubleValue];
  double v23 = v22;
  uint64_t v74 = (int)a4;
  BOOL v24 = [v11 objectAtIndexedSubscript:(int)a4];
  [v24 doubleValue];
  double v26 = v23 / v25;

  uint64_t v76 = v16;
  v27 = objc_msgSend(v11, "objectAtIndexedSubscript:");
  [v27 doubleValue];
  double v29 = v28;
  id v30 = [v11 objectAtIndexedSubscript:(int)a4];
  [v30 doubleValue];
  double v32 = v29 - v31;
  v70 = v11;
  long long v33 = [v11 objectAtIndexedSubscript:(int)a4];
  [v33 doubleValue];
  double v35 = v32 / (1.0 - v34);

  uint64_t v36 = [v69 objectAtIndexedSubscript:0];
  v37 = (void *)MEMORY[0x1E4F1C978];
  id v38 = [NSNumber numberWithDouble:v26];
  v39 = [v37 arrayWithObject:v38];
  v40 = [(FRCFrameInterpolator *)self interpolateBetweenFirstFrame:v12 secondFrame:v36 timeScales:v39 withError:a6];

  CVPixelBufferRef v41 = [v40 firstObject];
  [v69 insertObject:v41 atIndex:0];

  CVPixelBufferRef v42 = [v69 objectAtIndexedSubscript:1];
  v43 = (void *)MEMORY[0x1E4F1C978];
  v44 = [NSNumber numberWithDouble:v35];
  v45 = [v43 arrayWithObject:v44];
  v46 = [(FRCFrameInterpolator *)self interpolateBetweenFirstFrame:v42 secondFrame:v80 timeScales:v45 withError:a6];

  id v47 = [v46 firstObject];
  [v69 insertObject:v47 atIndex:2];

  v48 = [(FRCFrameInterpolator *)self normalizeTimingFromTimeScales:v11 newBeginIdx:0xFFFFFFFFLL newEndIdx:v72];
  v49 = [v69 objectAtIndexedSubscript:0];
  v50 = [(FRCFrameInterpolator *)self interpolateBetweenFirstFrame:v12 secondFrame:v49 timeScales:v48 withError:a6];

  BOOL v51 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, objc_msgSend(v50, "count"));
  [v69 insertObjects:v50 atIndexes:v51];

  unint64_t v52 = [(FRCFrameInterpolator *)self normalizeTimingFromTimeScales:v11 newBeginIdx:v72 newEndIdx:v75];

  CMTime v53 = [v69 objectAtIndexedSubscript:v73];
  uint64_t v54 = (int)v72 + 1;
  v55 = [v69 objectAtIndexedSubscript:v54];
  v56 = [(FRCFrameInterpolator *)self interpolateBetweenFirstFrame:v53 secondFrame:v55 timeScales:v52 withError:a6];

  id v57 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v54, objc_msgSend(v56, "count"));
  [v69 insertObjects:v56 atIndexes:v57];

  id v58 = [(FRCFrameInterpolator *)self normalizeTimingFromTimeScales:v70 newBeginIdx:v75 newEndIdx:v79];

  id v59 = [v69 objectAtIndexedSubscript:v74];
  uint64_t v60 = (int)v75 + 1;
  double v61 = [v69 objectAtIndexedSubscript:v60];
  double v62 = [(FRCFrameInterpolator *)self interpolateBetweenFirstFrame:v59 secondFrame:v61 timeScales:v58 withError:a6];

  unsigned int v63 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v60, objc_msgSend(v62, "count"));
  [v69 insertObjects:v62 atIndexes:v63];

  BOOL v64 = -[FRCFrameInterpolator normalizeTimingFromTimeScales:newBeginIdx:newEndIdx:](self, "normalizeTimingFromTimeScales:newBeginIdx:newEndIdx:", v70, v79, [v70 count]);

  v65 = [v69 objectAtIndexedSubscript:v76];
  v66 = [(FRCFrameInterpolator *)self interpolateBetweenFirstFrame:v65 secondFrame:v80 timeScales:v64 withError:a6];

  v67 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", (int)v79 + 1, objc_msgSend(v66, "count"));
  [v69 insertObjects:v66 atIndexes:v67];

  self->_BOOL gatingEnabled = gatingEnabled;
  return v69;
}

- (id)synthesizeInterpolatedFrames:(id)a3 second:(id)a4 normalizedFirst:(__CVBuffer *)a5 normalizedSecond:(__CVBuffer *)a6 timeScales:(id)a7 outputSize:(CGSize)a8 outputPixelFormat:(unsigned int)a9 scalerEnabled:(BOOL)a10
{
  double height = a8.height;
  double width = a8.width;
  id v17 = a3;
  id v18 = a4;
  id v19 = a7;
  kdebug_trace();
  if (self->_onDemandSynthesisBufferAllocation) {
    [(FRCSynthesis *)self->_synthesis allocateResources];
  }
  uint64_t v20 = [v19 count];
  memset(&v57, 0, sizeof(v57));
  if (v17) {
    [v17 presentationTimeStamp];
  }
  memset(&v56, 0, sizeof(v56));
  if (v18)
  {
    [v18 presentationTimeStamp];
    if (v17)
    {
LABEL_7:
      [v17 presentationTimeStamp];
      CMTimeSubtract(&v56, &lhs, &rhs);
      [v17 presentationTimeStamp];
      goto LABEL_10;
    }
  }
  else
  {
    memset(&lhs, 0, sizeof(lhs));
    if (v17) {
      goto LABEL_7;
    }
  }
  memset(&rhs, 0, sizeof(rhs));
  CMTimeSubtract(&v56, &lhs, &rhs);
  memset(v53, 0, sizeof(v53));
LABEL_10:
  id v35 = v18;
  if (v18) {
    objc_msgSend(v18, "presentationTimeStamp", v18);
  }
  else {
    memset(v52, 0, sizeof(v52));
  }
  -[LiteSynthesis setEnableMemDump:](self->_liteSynthesis, "setEnableMemDump:", -[FRCFrameInterpolator shallDumpDebugInfoForCurrPts:prevPts:](self, "shallDumpDebugInfoForCurrPts:prevPts:", v53, v52, v35));
  [(FRCSynthesis *)self->_synthesis createFeaturesFromFirstImage:a5 secondImage:a6 flowForward:self->_flowForward flowBackward:self->_flowBackward];
  id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v20)
  {
    for (uint64_t i = 0; i != v20; ++i)
    {
      double v23 = [v19 objectAtIndexedSubscript:i];
      [v23 floatValue];
      float v25 = v24;

      *(float *)&double v26 = v25;
      v27 = -[FRCFrameInterpolator synthesisFrameForTimeScale:outputSize:outputPixelFormat:scalerEnabled:frameIndex:lastFrame:](self, "synthesisFrameForTimeScale:outputSize:outputPixelFormat:scalerEnabled:frameIndex:lastFrame:", a9, a10, i, v20 - 1 == i, v26, width, height);
      memset(&v51, 0, sizeof(v51));
      CMTime time = v56;
      CMTimeMultiplyByFloat64(&v50, &time, v25);
      if (v17)
      {
        [v17 presentationTimeStamp];
        int32_t v28 = v47;
      }
      else
      {
        int32_t v28 = 0;
        uint64_t v46 = 0;
        uint64_t v47 = 0;
        uint64_t v48 = 0;
      }
      CMTimeConvertScale(&v51, &v50, v28, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
      memset(&time, 0, sizeof(time));
      CMTime v44 = v57;
      CMTime v43 = v51;
      CMTimeAdd(&v45, &v44, &v43);
      if (v17)
      {
        [v17 presentationTimeStamp];
        int32_t v29 = v41;
      }
      else
      {
        int32_t v29 = 0;
        uint64_t v40 = 0;
        uint64_t v41 = 0;
        uint64_t v42 = 0;
      }
      CMTimeConvertScale(&time, &v45, v29, kCMTimeRoundingMethod_QuickTime);
      id v30 = [FRCFrame alloc];
      CMTime v44 = time;
      double v31 = [(FRCFrame *)v30 initWithBuffer:v27 presentationTimeStamp:&v44];
      CVPixelBufferRelease(v27);
      [v21 addObject:v31];
      outputFrameListFromClient = self->_outputFrameListFromClient;
      if (outputFrameListFromClient)
      {
        CMTime v39 = time;
        long long v33 = [(NSArray *)outputFrameListFromClient objectAtIndexedSubscript:i];
        CMTime v38 = v39;
        [v33 setPresentationTimeStamp:&v38];
      }
    }
  }
  [(FRCSynthesis *)self->_synthesis releaseFeatures];
  if (self->_onDemandSynthesisBufferAllocation) {
    [(FRCSynthesis *)self->_synthesis releaseResources];
  }
  kdebug_trace();

  return v21;
}

- (id)selectFrameInsertionPointsFromTimingList:(id)a3 preModifiedTimingList:(id)a4
{
  id v5 = a3;
  if (self->_state == 2)
  {
    int v6 = [(FRCFrameDropDetector *)self->_frameDropDetector selectFrameInsertionPointsFromTimingList:v5 metadataList:0 sloMo:[(FRCFrameInterpolator *)self useCase] == 2 withError:0];
    if (!v6)
    {
      self->_gated = 1;
      self->_sessionResult = 1;
    }
  }
  else
  {
    NSLog(&cfstr_SessionIsNotSt_0.isa);
    int v6 = 0;
  }

  return v6;
}

- (id)selectFrameInsertionPointsFromTimingList:(id)a3 metadataList:(id)a4 withError:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (self->_state == 2)
  {
    double v10 = [(FRCFrameDropDetector *)self->_frameDropDetector selectFrameInsertionPointsFromTimingList:v8 metadataList:v9 sloMo:[(FRCFrameInterpolator *)self useCase] == 2 withError:a5];
    [(OpticalFlowAnalyzer *)self->_flowAnalyzer setRetimingRecipe:[(FRCFrameDropDetector *)self->_frameDropDetector retimingRecipe]];
    if (!v10)
    {
      self->_gated = 1;
      self->_sessionResult = 1;
    }
  }
  else
  {
    NSLog(&cfstr_SessionIsNotSt_0.isa);
    if (a5)
    {
      [(FRCFrameInterpolator *)self errorWithErrorCode:-22003];
      double v10 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      double v10 = 0;
    }
  }

  return v10;
}

- (void)configureGating
{
  if (self->_gatingEnabled)
  {
    BOOL v3 = objc_alloc_init(OpticalFlowAnalyzer);
    flowAnalyzer = self->_flowAnalyzer;
    self->_flowAnalyzer = v3;

    [(OpticalFlowAnalyzer *)self->_flowAnalyzer setScaler:self->_scaler];
    [(OpticalFlowAnalyzer *)self->_flowAnalyzer setUsage:self->_usage];
    [(OpticalFlowAnalyzer *)self->_flowAnalyzer setInputScaling:self->_inputScaling];
    [(OpticalFlowAnalyzer *)self->_flowAnalyzer setOpticalFlowDownsampling:[(OpticalFlow *)self->_opticalFlow downsampling] != 0];
    [(OpticalFlowAnalyzer *)self->_flowAnalyzer setInputRotation:self->_inputRotation];
    [(OpticalFlowAnalyzer *)self->_flowAnalyzer setUseCase:self->_useCase];
    [(OpticalFlowAnalyzer *)self->_flowAnalyzer reset];
  }
  frameDropDetector = self->_frameDropDetector;
  if (frameDropDetector)
  {
    BOOL v6 = self->_gatingEnabled && !self->_forceFrameOutput;
    [(FRCFrameDropDetector *)frameDropDetector setGatingEnabled:v6];
  }
}

- (void)setPropertiesFromDefaults
{
  [(FRCFrameInterpolator *)self setFlowAnalysisFromDefaults];
  [(FRCFrameInterpolator *)self setLiteSynthesisDebugFromDefaults];
  [(FRCFrameInterpolator *)self setNormalizationModeFromDefaults];
  [(FRCFrameInterpolator *)self setCrossFlowAnalysisFromDefaults];
}

- (void)overwriteQualityModeFromDefaults
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.FRC"];
  uint64_t v4 = [v3 objectForKey:@"QualityMode"];
  if (!v4) {
    goto LABEL_19;
  }
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v4;
    _os_log_impl(&dword_1DC827000, logger, OS_LOG_TYPE_DEFAULT, "Forcing to %@", (uint8_t *)&v11, 0xCu);
  }
  if ([v4 caseInsensitiveCompare:@"kFRCHighPerformanceMode"])
  {
    if ([v4 caseInsensitiveCompare:@"kFRCHighQualityMode"])
    {
      if ([v4 caseInsensitiveCompare:@"kFRCLowLatencyMode"])
      {
        if ([v4 caseInsensitiveCompare:@"kFRCHighPerformanceModeV2"])
        {
          if ([v4 caseInsensitiveCompare:@"kFRCHighPerformanceModeV3"]) {
            goto LABEL_15;
          }
          int64_t v6 = 4;
        }
        else
        {
          int64_t v6 = 3;
        }
      }
      else
      {
        int64_t v6 = 2;
      }
    }
    else
    {
      int64_t v6 = 1;
    }
  }
  else
  {
    int64_t v6 = 0;
  }
  self->_int64_t qualityMode = v6;
LABEL_15:
  id v7 = [v3 objectForKey:@"LowMemoryMode"];
  id v8 = v7;
  if (v7)
  {
    self->_BOOL lowMemoryMode = [v7 BOOLValue];
    id v9 = self->_logger;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      BOOL lowMemoryMode = self->_lowMemoryMode;
      int v11 = 67109120;
      LODWORD(v12) = lowMemoryMode;
      _os_log_impl(&dword_1DC827000, v9, OS_LOG_TYPE_DEFAULT, "Setting lowMemoryMode to %d", (uint8_t *)&v11, 8u);
    }
  }

LABEL_19:
}

- (void)setFlowAnalysisFromDefaults
{
  Boolean keyExistsAndHasValidFormat = 1;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"ForceFrameOutput", @"com.apple.FRC", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
  {
    self->_forceFrameOutput = AppBooleanValue != 0;
    if (!AppBooleanValue) {
      goto LABEL_7;
    }
  }
  else if (!self->_forceFrameOutput)
  {
    goto LABEL_7;
  }
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int64_t v6 = 0;
    _os_log_impl(&dword_1DC827000, logger, OS_LOG_TYPE_DEFAULT, "Frame Output forced.", v6, 2u);
  }
LABEL_7:
  int v5 = CFPreferencesGetAppBooleanValue(@"FlowAnalysis", @"com.apple.FRC", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    self->_BOOL gatingEnabled = v5 != 0;
  }
}

- (void)setCrossFlowAnalysisFromDefaults
{
  Boolean keyExistsAndHasValidFormat = 1;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"CrossFlowAnalysis", @"com.apple.FRC", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    self->_enableCrossFlowAnalysis = AppBooleanValue != 0;
  }
}

- (void)setLiteSynthesisDebugFromDefaults
{
  Boolean keyExistsAndHasValidFormat = 1;
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"PtsForLiteDebug", @"com.apple.FRC", &keyExistsAndHasValidFormat);
  int v4 = keyExistsAndHasValidFormat;
  p_ptsForLiteDebugging = &self->_ptsForLiteDebugging;
  if (keyExistsAndHasValidFormat)
  {
    CMTimeMake(&v8, AppIntegerValue, 9600);
    *(_OWORD *)&p_ptsForLiteDebugging->value = *(_OWORD *)&v8.value;
    CMTimeEpoch epoch = v8.epoch;
  }
  else
  {
    uint64_t v7 = MEMORY[0x1E4F1F9F8];
    *(_OWORD *)&p_ptsForLiteDebugging->value = *MEMORY[0x1E4F1F9F8];
    CMTimeEpoch epoch = *(void *)(v7 + 16);
  }
  self->_ptsForLiteDebugging.CMTimeEpoch epoch = epoch;
  [(LiteSynthesis *)self->_liteSynthesis setTextureFromCVPixelBuffer:v4 != 0];
}

- (void)setNormalizationModeFromDefaults
{
  Boolean keyExistsAndHasValidFormat = 1;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"SelfNorm", @"com.apple.FRC", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v4 = AppBooleanValue == 0;
  }
  else {
    BOOL v4 = 0;
  }
  uint64_t v5 = !v4;
  [(FRCImageProcessor *)self->_imageProcessor setSelfNormalization:v5];
}

- (void)setSynthesisOptionsFromDefaults
{
  Boolean keyExistsAndHasValidFormat = 1;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"UseFlowConsistencyMap", @"com.apple.FRC", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    self->_useFlowConsistencyMap = AppBooleanValue != 0;
  }
  int v4 = CFPreferencesGetAppBooleanValue(@"UseTwoLayerSynthesis", @"com.apple.FRC", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    self->_twoLayerSynthesis = v4 != 0;
  }
  int v5 = CFPreferencesGetAppBooleanValue(@"TwoLayerSynthesisQuarterSizeDC", @"com.apple.FRC", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    self->_twoLayerSynthesisQuarterSizeDC = v5 != 0;
  }
}

- (BOOL)shallReusePreviousFlowPts0:(id *)a3 Pts1:(id *)a4
{
  int32_t var1 = a4->var1;
  memset(&v14, 0, sizeof(v14));
  CMTime lhs = *(CMTime *)a4;
  CMTime rhs = *(CMTime *)a3;
  CMTimeSubtract(&v14, &lhs, &rhs);
  memset(&lhs, 0, sizeof(lhs));
  CMTime rhs = v14;
  CMTime time1 = (CMTime)self->_lastFrameDuration;
  CMTimeSubtract(&time, &rhs, &time1);
  CMTimeAbsoluteValue(&lhs, &time);
  memset(&rhs, 0, sizeof(rhs));
  CMTimeMakeWithSeconds(&rhs, 0.000520833333, var1);
  if (self->_singleFlow && (time1 = (CMTime)self->_lastFramePts, CMTime v9 = (CMTime)*a3, !CMTimeCompare(&time1, &v9)))
  {
    CMTime time1 = lhs;
    CMTime v9 = rhs;
    return CMTimeCompare(&time1, &v9) >> 31;
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

+ (void)getInputFrameSizeForUsage:(int64_t)a3 width:(unint64_t *)a4 height:(unint64_t *)a5
{
}

+ (int64_t)getUsageFromSizeWidth:(unint64_t)a3 height:(unint64_t)a4
{
  return FRCGetUsageFromSize(a3, a4);
}

- (void)preserveCMAttachmentFirstFrame:(id)a3 secondFrame:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  self->_anchorFrameCMAttachment = CMCopyDictionaryOfAttachments(0, (CMAttachmentBearerRef)[v7 buffer], 1u);
  if (self->_removeCMAttachment)
  {
    CMRemoveAllAttachments((CMAttachmentBearerRef)[v7 buffer]);
    CMRemoveAllAttachments((CMAttachmentBearerRef)[v6 buffer]);
  }
}

- (void)restoreCMAttachmentToFirstFrame:(id)a3 secondFrame:(id)a4 interpolatedFrames:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  if (self->_removeCMAttachment)
  {
    CMSetAttachments((CMAttachmentBearerRef)[a3 buffer], self->_anchorFrameCMAttachment, 1u);
    CMSetAttachments((CMAttachmentBearerRef)[v8 buffer], self->_anchorFrameCMAttachment, 1u);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v16 != v13) {
            objc_enumerationMutation(v10);
          }
          CMSetAttachments((CMAttachmentBearerRef)objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "buffer", (void)v15), self->_anchorFrameCMAttachment, 1u);
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v12);
    }
  }
  CFRelease(self->_anchorFrameCMAttachment);
}

- (void)constructSessionStatisticsWithSessionDuration:(double)a3
{
  int v5 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v6 = [NSNumber numberWithInt:LODWORD(self->_usage)];
  [(NSDictionary *)v5 setObject:v6 forKeyedSubscript:@"FRCUsage"];

  id v7 = [NSNumber numberWithInt:LODWORD(self->_qualityMode)];
  [(NSDictionary *)v5 setObject:v7 forKeyedSubscript:@"FRCProcessingMode"];

  id v8 = [NSNumber numberWithInt:LODWORD(self->_totalFramesInterpolated)];
  [(NSDictionary *)v5 setObject:v8 forKeyedSubscript:@"FRCTotalInterpolatedFrames"];

  id v9 = [NSNumber numberWithInt:(int)a3];
  [(NSDictionary *)v5 setObject:v9 forKeyedSubscript:@"FRCProcessingTime"];

  if (self->_gatingEnabled)
  {
    id v10 = [NSNumber numberWithInt:LODWORD(self->_sessionResult)];
    [(NSDictionary *)v5 setObject:v10 forKeyedSubscript:@"FRCGatingStatus"];

    uint64_t v11 = objc_msgSend(NSNumber, "numberWithInt:", -[FRCFrameDropDetector retimingRecipe](self->_frameDropDetector, "retimingRecipe"));
    [(NSDictionary *)v5 setObject:v11 forKeyedSubscript:@"FRCLivePhotoRetimingRecipe"];

    uint64_t v12 = objc_msgSend(NSNumber, "numberWithInt:", -[FRCFrameDropDetector numberOfInsertionPoints](self->_frameDropDetector, "numberOfInsertionPoints"));
    [(NSDictionary *)v5 setObject:v12 forKeyedSubscript:@"FRCLivePhotoNumberOfGaps"];

    int64_t sessionResult = self->_sessionResult;
    switch(sessionResult)
    {
      case 4:
        long long v16 = [NSNumber numberWithInt:10];
        [(NSDictionary *)v5 setObject:v16 forKeyedSubscript:@"FRCGatingCause"];

        long long v17 = [NSNumber numberWithInt:(int)(self->_maxPixelMeanDiff * 1000.0)];
        [(NSDictionary *)v5 setObject:v17 forKeyedSubscript:@"FRCMaximumPixelMeanDiff"];

        CMTime v14 = [NSNumber numberWithInt:(int)(self->_maxPixelMeanChange * 1000.0)];
        long long v15 = &FRCMaximumPixelMeanChangeKey;
        goto LABEL_8;
      case 2:
        long long v18 = objc_msgSend(NSNumber, "numberWithInt:", -[OpticalFlowAnalyzer gatingCause](self->_flowAnalyzer, "gatingCause"));
        [(NSDictionary *)v5 setObject:v18 forKeyedSubscript:@"FRCGatingCause"];

        $95D729B680665BEAEFA1D6FCA8238556 maxTimeGap = self->_maxTimeGap;
        id v19 = [NSNumber numberWithInt:(int)(CMTimeGetSeconds((CMTime *)&maxTimeGap) * 1000.0)];
        [(NSDictionary *)v5 setObject:v19 forKeyedSubscript:@"FRCLivePhotoBurstDropDuration"];

        uint64_t v20 = NSNumber;
        [(OpticalFlowAnalyzer *)self->_flowAnalyzer flowConsistencyFrameScore];
        double v22 = [v20 numberWithInt:(int)v21];
        [(NSDictionary *)v5 setObject:v22 forKeyedSubscript:@"FRCFlowConsistencyFrameScore"];

        double v23 = NSNumber;
        [(OpticalFlowAnalyzer *)self->_flowAnalyzer flowConsistencyROIScore];
        CMTime v14 = [v23 numberWithInt:(int)v24];
        long long v15 = FRCFlowConsistencyRegionScoreKey;
        goto LABEL_8;
      case 1:
        CMTime v14 = objc_msgSend(NSNumber, "numberWithInt:", -[FRCFrameDropDetector gatingCause](self->_frameDropDetector, "gatingCause"));
        long long v15 = FRCGatingCauseKey;
LABEL_8:
        [(NSDictionary *)v5 setObject:v14 forKeyedSubscript:*v15];

        break;
    }
  }
  sessionStatistics = self->_sessionStatistics;
  self->_sessionStatistics = v5;
}

- (BOOL)shallDumpDebugInfoForCurrPts:(id *)a3 prevPts:(id *)a4
{
  CMTime time1 = (CMTime)self->_ptsForLiteDebugging;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v11 = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(void *)&MEMORY[0x1E4F1F9F8];
  int32_t v7 = CMTimeCompare(&time1, (CMTime *)&v11);
  if (v7)
  {
    long long v9 = *(_OWORD *)&self->_ptsForLiteDebugging.value;
    p_ptsForLiteDebugging = (CMTime *)&self->_ptsForLiteDebugging;
    *(_OWORD *)&time1.value = v9;
    time1.CMTimeEpoch epoch = p_ptsForLiteDebugging->epoch;
    $3CC8671D27C23BF42ADDB32F2B5E48AE v11 = *a3;
    if (CMTimeCompare(&time1, (CMTime *)&v11) < 1)
    {
      LOBYTE(v7) = 0;
    }
    else
    {
      CMTime time1 = *p_ptsForLiteDebugging;
      $3CC8671D27C23BF42ADDB32F2B5E48AE v11 = *a4;
      LOBYTE(v7) = CMTimeCompare(&time1, (CMTime *)&v11) < 1;
    }
  }
  return v7;
}

- (void)updateLastFramePts:(id *)a3 duration:(id *)a4 toInterpolate:(unint64_t)a5
{
  long long v5 = *(_OWORD *)&a3->var0;
  self->_lastFramePts.CMTimeEpoch epoch = a3->var3;
  *(_OWORD *)&self->_lastFramePts.value = v5;
  int64_t var3 = a4->var3;
  *(_OWORD *)&self->_lastFrameDuration.value = *(_OWORD *)&a4->var0;
  self->_lastFrameDuration.CMTimeEpoch epoch = var3;
  self->_lastFramesToInterpolate = a5;
}

- (void)updateBackwardFlow
{
  flowBackwardGating = self->_flowBackwardGating;
  prevFlowBackwardGating = self->_prevFlowBackwardGating;
  self->_flowBackwardGating = prevFlowBackwardGating;
  self->_prevFlowBackwardGating = flowBackwardGating;
  if (!self->_inputScaling) {
    self->_flowBackward = prevFlowBackwardGating;
  }
}

- (void)updateRecommendation
{
  if (self->_useCase != 1)
  {
    self->_int64_t recommendation = 0;
    return;
  }
  if (self->_totalFramesInterpolated)
  {
    if (self->_shouldGatedForInteractive)
    {
      int64_t v3 = 4;
    }
    else
    {
      int64_t gatingLevel = self->_gatingLevel;
      if (gatingLevel)
      {
        if (gatingLevel != 2) {
          goto LABEL_8;
        }
        int64_t v3 = 3;
      }
      else if (self->_gated)
      {
        int64_t v3 = 2;
      }
      else
      {
        int64_t v3 = 1;
      }
    }
    self->_int64_t recommendation = v3;
  }
  else
  {
    self->_int64_t recommendation = 0;
  }
LABEL_8:
  NSLog(&cfstr_Frameinterpola_1.isa, a2, self->_maxPixelMeanDiff, self->_maxPixelMeanChange);
  int64_t recommendation = self->_recommendation;
  if ((unint64_t)(recommendation - 1) > 3) {
    long long v5 = @"Unknown";
  }
  else {
    long long v5 = off_1E6CA43A8[recommendation - 1];
  }
  NSLog(&cfstr_Recommendation.isa, recommendation, [(__CFString *)v5 UTF8String]);
}

- (id)synthesis
{
  return self->_synthesis;
}

- (BOOL)checkStreamingBufferConsistencyFirstFrame:(id)a3 secondFrame:(id)a4
{
  id v6 = a4;
  if (self->_firstPairInSession
    || (IOSurface = CVPixelBufferGetIOSurface((CVPixelBufferRef)[a3 buffer]),
        uint64_t ID = IOSurfaceGetID(IOSurface),
        previousSecondIOSurfaceuint64_t ID = self->_previousSecondIOSurfaceID,
        ID == previousSecondIOSurfaceID))
  {
    BOOL v10 = 1;
  }
  else
  {
    NSLog(&cfstr_Frameinterpola_2.isa, ID, previousSecondIOSurfaceID);
    NSLog(&cfstr_Frameinterpola_3.isa);
    BOOL v10 = 0;
  }
  $3CC8671D27C23BF42ADDB32F2B5E48AE v11 = CVPixelBufferGetIOSurface((CVPixelBufferRef)[v6 buffer]);
  self->_previousSecondIOSurfaceuint64_t ID = IOSurfaceGetID(v11);

  return v10;
}

- (void)pauseGatingForNextPair
{
  self->_gatingPaused = 1;
}

- (int64_t)usage
{
  return self->_usage;
}

- (void)setUsage:(int64_t)a3
{
  self->_int64_t usage = a3;
}

- (int64_t)qualityMode
{
  return self->_qualityMode;
}

- (void)setQualityMode:(int64_t)a3
{
  self->_int64_t qualityMode = a3;
}

- (CGAffineTransform)preferredTransform
{
  long long v3 = *(_OWORD *)&self[12].tx;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[12].c;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[13].a;
  return self;
}

- (void)setPreferredTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_preferredTransform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_preferredTransform.tx = v4;
  *(_OWORD *)&self->_preferredTransform.a = v3;
}

- (int64_t)state
{
  return self->_state;
}

- (BOOL)gated
{
  return self->_gated;
}

- (float)sessionConfidence
{
  return self->_sessionConfidence;
}

- (NSDictionary)sessionStatistics
{
  return self->_sessionStatistics;
}

- (unint64_t)useCase
{
  return self->_useCase;
}

- (void)setUseCase:(unint64_t)a3
{
  self->_unint64_t useCase = a3;
}

- (int64_t)gatingLevel
{
  return self->_gatingLevel;
}

- (void)setGatingLevel:(int64_t)a3
{
  self->_int64_t gatingLevel = a3;
}

- (int64_t)recommendation
{
  return self->_recommendation;
}

- (BOOL)streamingMode
{
  return self->_streamingMode;
}

- (void)setStreamingMode:(BOOL)a3
{
  self->_streamingMode = a3;
}

- (BOOL)tilingEnabled
{
  return self->_tilingEnabled;
}

- (void)setTilingEnabled:(BOOL)a3
{
  self->_tilingEnabled = a3;
}

- (BOOL)secondLevelFlow
{
  return self->_secondLevelFlow;
}

- (void)setSecondLevelFlow:(BOOL)a3
{
  self->_secondLevelFlow = a3;
}

- (unint64_t)synthesisMode
{
  return self->_synthesisMode;
}

- (void)setSynthesisMode:(unint64_t)a3
{
  self->_unint64_t synthesisMode = a3;
}

- (BOOL)inputScaling
{
  return self->_inputScaling;
}

- (void)setInputScaling:(BOOL)a3
{
  self->_inputScaling = a3;
}

- (unint64_t)opticalFlowDownsampling
{
  return self->_opticalFlowDownsampling;
}

- (void)setOpticalFlowDownsampling:(unint64_t)a3
{
  self->_opticalFlowDownsampling = a3;
}

- (BOOL)singleFlow
{
  return self->_singleFlow;
}

- (void)setSingleFlow:(BOOL)a3
{
  self->_singleFlow = a3;
}

- (BOOL)twoStageFlow
{
  return self->_twoStageFlow;
}

- (void)setTwoStageFlow:(BOOL)a3
{
  self->_twoStageFlow = a3;
}

- (BOOL)opticalFlowAdaptationLayer
{
  return self->_opticalFlowAdaptationLayer;
}

- (void)setOpticalFlowAdaptationLayer:(BOOL)a3
{
  self->_opticalFlowAdaptationLayer = a3;
}

- (int64_t)opticalFlowRevision
{
  return self->_opticalFlowRevision;
}

- (void)setOpticalFlowRevision:(int64_t)a3
{
  self->_opticalFlowRevision = a3;
}

- (BOOL)forceFrameOutput
{
  return self->_forceFrameOutput;
}

- (void)setForceFrameOutput:(BOOL)a3
{
  self->_forceFrameOutput = a3;
}

- (BOOL)forceSingleStageFlow
{
  return self->_forceSingleStageFlow;
}

- (void)setForceSingleStageFlow:(BOOL)a3
{
  self->_forceSingleStageFlow = a3;
}

- (BOOL)synthesisTemporalSmoothing
{
  return self->_synthesisTemporalSmoothing;
}

- (void)setSynthesisTemporalSmoothing:(BOOL)a3
{
  self->_synthesisTemporalSmoothing = a3;
}

- (BOOL)linearSplatting
{
  return self->_linearSplatting;
}

- (void)setLinearSplatting:(BOOL)a3
{
  self->_linearSplatting = a3;
}

- (BOOL)lowMemoryMode
{
  return self->_lowMemoryMode;
}

- (void)setLowMemoryMode:(BOOL)a3
{
  self->_BOOL lowMemoryMode = a3;
}

- (BOOL)useFlowConsistencyMap
{
  return self->_useFlowConsistencyMap;
}

- (void)setUseFlowConsistencyMap:(BOOL)a3
{
  self->_useFlowConsistencyMap = a3;
}

- (BOOL)twoLayerSynthesis
{
  return self->_twoLayerSynthesis;
}

- (void)setTwoLayerSynthesis:(BOOL)a3
{
  self->_twoLayerSynthesis = a3;
}

- (BOOL)twoLayerSynthesisQuarterSizeDC
{
  return self->_twoLayerSynthesisQuarterSizeDC;
}

- (void)setTwoLayerSynthesisQuarterSizeDC:(BOOL)a3
{
  self->_twoLayerSynthesisQuarterSizeDC = a3;
}

- (void)setSynthesis:(id)a3
{
}

- (BOOL)legacyNormalizationMode
{
  return self->_legacyNormalizationMode;
}

- (void)setLegacyNormalizationMode:(BOOL)a3
{
  self->_BOOL legacyNormalizationMode = a3;
}

- (BOOL)singleDropRecoveryEnabled
{
  return self->_singleDropRecoveryEnabled;
}

- (void)setSingleDropRecoveryEnabled:(BOOL)a3
{
  self->_singleDropRecoveryEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionStatistics, 0);
  objc_storeStrong((id *)&self->_outputFrameListFromClient, 0);
  objc_storeStrong((id *)&self->_imageProcessor, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_concurrentQueue, 0);
  objc_storeStrong((id *)&self->_dispatchGroup, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_initializationSemaphore, 0);
  objc_storeStrong((id *)&self->_postProcessingComletionSemaphore, 0);
  objc_storeStrong((id *)&self->_frameDropDetector, 0);
  objc_storeStrong((id *)&self->_completion_semaphore, 0);
  objc_storeStrong((id *)&self->_flowAnalyzer, 0);
  objc_storeStrong((id *)&self->_scaler, 0);
  objc_storeStrong((id *)&self->_synthesis, 0);
  objc_storeStrong((id *)&self->_liteSynthesis, 0);
  objc_storeStrong((id *)&self->_deepSynthesis, 0);
  objc_storeStrong((id *)&self->_opticalFlow, 0);
}

- (void)startSessionWithUsage:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DC827000, log, OS_LOG_TYPE_ERROR, "Failed to initialize Synthesis", v1, 2u);
}

- (void)startSessionWithUsage:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DC827000, log, OS_LOG_TYPE_ERROR, "Failed to initialize OpticalFlow", v1, 2u);
}

@end