@interface OpticalFlowAnalyzer
- ($3EBD9E1B7FBE9902CA366ED728B89DC8)analyzeOpticalFlowForward:(SEL)a3 backward:(__CVBuffer *)a4 flowResFrame:(__CVBuffer *)a5;
- ($3EBD9E1B7FBE9902CA366ED728B89DC8)calcFlowStatisticsForwardFlowTexture:(SEL)a3 backwardFlowTexture:(id)a4 faceHandLegRectangles:(id)a5 frameTexture:(id)a6;
- ($3EBD9E1B7FBE9902CA366ED728B89DC8)processGPUOutputs:(SEL)a3 blockWidth:(id *)a4 blockHeight:(unint64_t)a5 faceHandLegBoundingBoxBlocks:(unint64_t)a6;
- ($599F175E452E455E49EC8439362DB023)analyzeBackwarpForward:(SEL)a3 backward:(__CVBuffer *)a4 flowResFirst:(__CVBuffer *)a5 flowResSecond:(__CVBuffer *)a6;
- ($599F175E452E455E49EC8439362DB023)calcBackwarpStatisticsForwardLossTexture:(SEL)a3 backwardLossTexture:(id)a4 faceHandLegRectangles:(id)a5;
- ($599F175E452E455E49EC8439362DB023)processBackwarpStats:(SEL)a3 blockWidth:(id *)a4 blockHeight:(unint64_t)a5 faceHandLegBoundingBoxBlocks:(unint64_t)a6;
- ($E2C29196C7A5C696474C6955C5A9CE06)analyzeFlowRandomnessWithPrevFlowBackward:(__CVBuffer *)a3 forward:(__CVBuffer *)a4 lastFrameDuration:(id *)a5 lastNumberOfFrames:(unint64_t)a6 flowResFrame:(__CVBuffer *)a7;
- ($E2C29196C7A5C696474C6955C5A9CE06)calcCrossFlowStatisticsPrevBackwardFlowTexture:(id)a3 forwardFlowTexture:(id)a4 frameTexture:(id)a5 flowScaleBuffer:(id)a6;
- ($E2C29196C7A5C696474C6955C5A9CE06)processGPUOutputsRandomness:(id *)a3 blockWidth:(unint64_t)a4 blockHeight:(unint64_t)a5;
- ($E2C29196C7A5C696474C6955C5A9CE06)safeThresholdWithtimeGap:(id *)a3 isDownsampled:(BOOL)a4;
- (BOOL)animalFaceDetectionEnabled;
- (BOOL)bodyDetectionEnabled;
- (BOOL)checkSafetyByBlockConsistency:(id *)a3;
- (BOOL)checkSafetyByScoreAndArea:(id *)a3;
- (BOOL)checkSafetyByStripConsistency:(id *)a3;
- (BOOL)detectCameraRotation;
- (BOOL)detectStaticBackground;
- (BOOL)handDetectionEnabled;
- (BOOL)humanDetectionEnabled;
- (BOOL)inputScaling;
- (BOOL)isContinuousDrops;
- (BOOL)isSafeToInterpolate;
- (BOOL)isSafeToInterpolateForInteractiveMode;
- (BOOL)isSmallDrops;
- (BOOL)opticalFlowDownsampling;
- (BOOL)shouldRunBackwarpGating;
- (BOOL)shouldRunCrossFlowAnalysis;
- (BOOL)shouldRunDetection;
- (BOOL)shouldRunFlowAnalysis;
- (BOOL)visualizationEnabled;
- (FRCScaler)scaler;
- (OpticalFlowAnalyzer)init;
- (char)backwarpLossMap;
- (char)consistencyMap;
- (char)deformationBinaryMap;
- (float)computeBackwarpConfidenceFromScore:(float)a3 scoreThreshold:(float)a4 scoreHighThreshold:(float)a5 areaRatio:(float)a6 areaRatioThreshold:(float)a7 areaRatioHighThreshold:(float)a8 large_area:(BOOL)a9;
- (float)computeConsistencyConfidenceFromScore:(float)a3 scoreThreshold:(float)a4 areaRatio:(float)a5 areaRatioThreshold:(float)a6;
- (float)confidenceScore;
- (float)confidenceScoreOnDemand;
- (float)flowConsistencyFrameScore;
- (float)flowConsistencyROIScore;
- (id)extractFaceHandLegInfoFromBuffer:(__CVBuffer *)a3;
- (id)findFaceHandLegBlocksFromRectangles:(id)a3 blockWidth:(unint64_t)a4 blockHeight:(unint64_t)a5;
- (int)backwarpBlockRanges;
- (int)deformationBlockRanges;
- (int)detectDominantDirectionInROI:(unsigned int *)a3;
- (int64_t)detectSpecialMotion;
- (int64_t)inputRotation;
- (int64_t)retimingRecipe;
- (int64_t)usage;
- (unint64_t)gatingCause;
- (unint64_t)useCase;
- (unsigned)averageMagnitude:(unsigned int *)a3;
- (unsigned)timesDidRunDetection;
- (void)analyzeAggregatedStatistics:(id *)a3;
- (void)analyzeDeformation;
- (void)analyzeMotionHistograms;
- (void)calcMotionHistogramForwardFlowTexture:(id)a3 frameTexture:(id)a4;
- (void)calcStripConsistency:(float *)a3 stripSize:(unint64_t)a4 numStrips:(unsigned int)a5;
- (void)convertOctantDirectionHistogram:(int *)a3 toPerpendicularQuadrantHistogram:(unsigned int *)a4;
- (void)dealloc;
- (void)detectDominantDirection;
- (void)isSafeToInterpolateForBackwarpGatingWithFlowForward:(__CVBuffer *)a3 flowBackward:(__CVBuffer *)a4 flowResFirst:(__CVBuffer *)a5 flowResSecond:(__CVBuffer *)a6;
- (void)isSafeToInterpolateForConsistencyGatingWithFlowForward:(__CVBuffer *)a3 flowBackward:(__CVBuffer *)a4 flowResFrame:(__CVBuffer *)a5;
- (void)isSafeToInterpolateForDeformationGating;
- (void)isSafeToInterpolateForRandomnessGatingWithPrevFlowBackward:(__CVBuffer *)a3 flowForward:(__CVBuffer *)a4 lastFrameDuration:(id *)a5 lastNumberOfFrames:(unint64_t)a6 flowResFrame:(__CVBuffer *)a7;
- (void)modulateGatingParametersFromMotionHistogramsAnalysis;
- (void)modulateGatingParametersWithFlowForward:(__CVBuffer *)a3 flowResFrame:(__CVBuffer *)a4;
- (void)prepareGatingFrameDropDetector:(id)a3 numberOfFrames:(unint64_t)a4 timeGap:(id *)a5 isContinuousDrops:(BOOL)a6 enableFlowAnalysis:(BOOL)a7 enableCrossFlowAnalysis:(BOOL)a8 cleanRectFirst:(CGRect)a9 cleanRectSecond:(CGRect)a10;
- (void)printFaceHandLegRectangles:(id)a3;
- (void)printSideHistograms;
- (void)printStripScores:(id *)a3;
- (void)processGPUOutputsHistograms:(id *)a3 blockWidth:(unint64_t)a4 blockHeight:(unint64_t)a5;
- (void)processGPUOutputsHistogramsForDeformation:(id *)a3 blockWidth:(unint64_t)a4 blockHeight:(unint64_t)a5;
- (void)reset;
- (void)runDetectionFromFirstBuffer:(__CVBuffer *)a3 secondBuffer:(__CVBuffer *)a4;
- (void)runGatingWithPrevFlowBackward:(__CVBuffer *)a3 flowForward:(__CVBuffer *)a4 flowBackward:(__CVBuffer *)a5 lastFrameDuration:(id *)a6 lastNumberOfFrames:(unint64_t)a7 flowResFrame:(__CVBuffer *)a8 flowResFirst:(__CVBuffer *)a9 flowResSecond:(__CVBuffer *)a10;
- (void)setAnimalFaceDetectionEnabled:(BOOL)a3;
- (void)setBackwarpBlockRanges:(int *)a3;
- (void)setBackwarpLossMap:(char *)a3;
- (void)setBodyDetectionEnabled:(BOOL)a3;
- (void)setConsistencyMap:(char *)a3;
- (void)setDeformationBinaryMap:(char *)a3;
- (void)setDeformationBlockRanges:(int *)a3;
- (void)setDetectorsFromDefaults;
- (void)setHandDetectionEnabled:(BOOL)a3;
- (void)setHumanDetectionEnabled:(BOOL)a3;
- (void)setInputRotation:(int64_t)a3;
- (void)setInputScaling:(BOOL)a3;
- (void)setIsContinuousDrops:(BOOL)a3;
- (void)setIsSmallDrops:(BOOL)a3;
- (void)setOpticalFlowDownsampling:(BOOL)a3;
- (void)setRetimingRecipe:(int64_t)a3;
- (void)setScaler:(id)a3;
- (void)setShouldRunBackwarpGating:(BOOL)a3;
- (void)setShouldRunCrossFlowAnalysis:(BOOL)a3;
- (void)setShouldRunDetection:(BOOL)a3;
- (void)setShouldRunFlowAnalysis:(BOOL)a3;
- (void)setTimesDidRunDetection:(unsigned __int8)a3;
- (void)setUsage:(int64_t)a3;
- (void)setUseCase:(unint64_t)a3;
- (void)setVisualizationEnabled:(BOOL)a3;
- (void)setupMetal;
- (void)updateGatingStats;
@end

@implementation OpticalFlowAnalyzer

- (OpticalFlowAnalyzer)init
{
  v8.receiver = self;
  v8.super_class = (Class)OpticalFlowAnalyzer;
  v2 = [(FRCMetalBase *)&v8 init];
  v3 = v2;
  if (v2)
  {
    [(OpticalFlowAnalyzer *)v2 setupMetal];
    os_log_t v4 = os_log_create("com.apple.FRC", "FlowAnalyzer");
    logger = v3->_logger;
    v3->_logger = (OS_os_log *)v4;

    v3->_handDetectionEnabled = 0;
    v3->_bodyDetectionEnabled = 1;
    v3->_humanDetectionEnabled = 1;
    v3->_animalFaceDetectionEnabled = 1;
    v3->_confidenceScore = 1.0;
    v3->_confidenceScoreOnDemand = 1.0;
    [(OpticalFlowAnalyzer *)v3 setDetectorsFromDefaults];
    v6 = v3;
  }

  return v3;
}

- (void)dealloc
{
  CVPixelBufferRelease(self->_donwsampledSourceBuffer);
  NSLog(&cfstr_FlowanalysisDe.isa, self->_timesDidRunDetection);
  v3.receiver = self;
  v3.super_class = (Class)OpticalFlowAnalyzer;
  [(OpticalFlowAnalyzer *)&v3 dealloc];
}

- (void)setDetectorsFromDefaults
{
  Boolean keyExistsAndHasValidFormat = 1;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"HandDetection", @"com.apple.FRC", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    self->_handDetectionEnabled = AppBooleanValue != 0;
  }
  int v4 = CFPreferencesGetAppBooleanValue(@"BodyDetection", @"com.apple.FRC", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    self->_bodyDetectionEnabled = v4 != 0;
  }
  int v5 = CFPreferencesGetAppBooleanValue(@"HumanDetection", @"com.apple.FRC", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    self->_humanDetectionEnabled = v5 != 0;
  }
  int v6 = CFPreferencesGetAppBooleanValue(@"AnimalFaceDetection", @"com.apple.FRC", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    self->_animalFaceDetectionEnabled = v6 != 0;
  }
}

- (void)setupMetal
{
  objc_super v3 = [(FRCMetalBase *)self createKernel:@"calcFlowStatistics"];
  flowStatisticsKernel = self->_flowStatisticsKernel;
  self->_flowStatisticsKernel = v3;

  int v5 = [(FRCMetalBase *)self createKernel:@"calcCrossFlowStatistics"];
  crossFlowStatisticsKernel = self->_crossFlowStatisticsKernel;
  self->_crossFlowStatisticsKernel = v5;

  v7 = [(FRCMetalBase *)self createKernel:@"calcMotionHistograms"];
  motionHistogramsKernel = self->_motionHistogramsKernel;
  self->_motionHistogramsKernel = v7;

  self->_backwarpStatisticsKernel = [(FRCMetalBase *)self createKernel:@"calcBackwarpStatistics"];
  MEMORY[0x1F41817F8]();
}

- (void)reset
{
  self->_isSmallDrops = 0;
  self->_isContinuousDrops = 0;
  self->_shouldRunFlowAnalysis = 0;
  self->_shouldRunCrossFlowAnalysis = 0;
  self->_shouldRunDetection = 0;
  self->_shouldRunBackwarpGating = 0;
  self->_timesDidRunDetection = 0;
  self->_consistentFlowRandomness = 0.0;
  self->_signErrFlowRandomness = 0.0;
  self->_signAreaFlowRandomness = 0.0;
  self->_zigzagFlowRandomness = 0.0;
  self->_prevFlowRandomnessErr = -1.0;
  self->_prevFlowRandomnessArea = -1.0;
  self->_flowDeformation = 0.0;
  self->_flowDeformationSum = 0.0;
  self->_safeToInterpolate = ($D54059585259B9431709135F4CA7D32D)16843009;
  self->_isSafeToInterpolateForInteractiveMode = 1;
  self->_isLargeRandomnessErr = 0;
  self->_flowConsistencyFrameScore = 0.0;
  self->_flowConsistencyROIScore = 0.0;
  self->_confidenceScore = 1.0;
  self->_confidenceScoreOnDemand = 1.0;
  self->_deformationBinaryMap = 0;
  self->_deformationBlockRanges = 0;
  self->_consistencyMap = 0;
  self->_backwarpLossMap = 0;
  self->_backwarpBlockRanges = 0;
  self->_visualizationEnabled = 0;
  self->_cleanRectFlow8x8.origin.x = 0.0;
  self->_cleanRectFlow8x8.origin.y = 0.0;
  self->_cleanRectFlow8x8.size = (CGSize)xmmword_1DC85A2F0;
  id v90 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.FRC"];
  v89 = [v90 pathForResource:@"GatingParameters" ofType:@"json"];
  v88 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithContentsOfFile:");
  objc_super v3 = objc_msgSend(MEMORY[0x1E4F28D90], "JSONObjectWithData:options:error:");
  int v4 = [v3 objectForKeyedSubscript:@"consistencyAreaThreshold"];
  [v4 floatValue];
  self->jsonConsistencyAreaThreshold = v5;

  int v6 = [v3 objectForKeyedSubscript:@"consistencyROIAreaPercentageThreshold"];
  [v6 floatValue];
  self->jsonConsistencyROIAreaPercentageThreshold = v7;

  objc_super v8 = [v3 objectForKeyedSubscript:@"consistencyAreaPercentageThreshold"];
  [v8 floatValue];
  self->jsonConsistencyAreaPercentageThreshold = v9;

  uint64_t v10 = 0;
  self->jsonConsistencyFrameScoreThresholdOnDemand = 27.0;
  self->jsonConsistencyAreaPercentageThresholdOnDemand = 5.0;
  do
  {
    v11 = [v3 objectForKeyedSubscript:@"consistencySafeThresholdsForDownsampled"];
    v12 = [v11 objectAtIndexedSubscript:v10];
    [v12 floatValue];
    self->jsonConsistencySafeThresholdsForDownsampled[v10] = v13;

    v14 = [v3 objectForKeyedSubscript:@"consistencySafeThresholdsForNonDownsampled"];
    v15 = [v14 objectAtIndexedSubscript:v10];
    [v15 floatValue];
    self->jsonConsistencySafeThresholdsForNonDownsampled[v10] = v16;

    v17 = [v3 objectForKeyedSubscript:@"consistencySafeThresholdsForDownsampledDelta"];
    v18 = [v17 objectAtIndexedSubscript:v10];
    [v18 floatValue];
    self->jsonConsistencySafeThresholdsForDownsampledDelta[v10] = v19;

    v20 = [v3 objectForKeyedSubscript:@"consistencySafeThresholdsForNonDownsampledDelta"];
    v21 = [v20 objectAtIndexedSubscript:v10];
    [v21 floatValue];
    self->jsonConsistencySafeThresholdsForNonDownsampledDelta[v10] = v22;

    ++v10;
  }
  while (v10 != 8);
  unint64_t useCase = self->_useCase;
  float v24 = 3.0;
  if (!useCase) {
    float v24 = 5.5;
  }
  float v25 = 23.5;
  if (!useCase) {
    float v25 = 20.5;
  }
  self->jsonConsistencyVerticalStripAreaPercentageThreshold = v24;
  self->jsonConsistencyVerticalStripScoreThreshold = v25;
  self->jsonConsistencyHorizontalStripAreaPercentageThreshold = 9.0;
  self->jsonConsistencyHorizontalStripScoreThreshold = 17.5;
  self->consistencySafeThresholdsScale = 0.0;
  self->consistencySafeThresholdsScaleForLargeRandomnessErr = 0.0;
  v26 = [v3 objectForKeyedSubscript:@"randomnessScoreThreshold"];
  [v26 floatValue];
  self->jsonRandomnessScoreThreshold = v27;

  v28 = [v3 objectForKeyedSubscript:@"randomnessScoreThresholdLow"];
  [v28 floatValue];
  self->jsonRandomnessScoreThresholdLow = v29;

  v30 = [v3 objectForKeyedSubscript:@"randomnessAreaThreshold"];
  [v30 floatValue];
  self->jsonRandomnessAreaThreshold = v31;

  v32 = [v3 objectForKeyedSubscript:@"randomnessAreaPercentageThresholdHigh"];
  [v32 floatValue];
  self->jsonRandomnessAreaPercentageThresholdHigh = v33;

  v34 = [v3 objectForKeyedSubscript:@"randomnessAreaPercentageThresholdLow"];
  [v34 floatValue];
  self->jsonRandomnessAreaPercentageThresholdLow = v35;

  v36 = [v3 objectForKeyedSubscript:@"randomnessErrThreshold"];
  [v36 floatValue];
  self->jsonRandomnessErrThreshold = v37;

  v38 = [v3 objectForKeyedSubscript:@"randomnessAreaScale"];
  [v38 floatValue];
  self->jsonRandomnessAreaScale = v39;

  self->randomnessAreaScale = 1.0;
  v40 = [v3 objectForKeyedSubscript:@"randomnessErrorChangeRatioThreshold"];
  [v40 floatValue];
  self->jsonRandomnessErrorChangeRatioThreshold = v41;

  v42 = [v3 objectForKeyedSubscript:@"randomnessAreaChangeRatioThreshold"];
  [v42 floatValue];
  self->jsonRandomnessAreaChangeRatioThreshold = v43;

  v44 = [v3 objectForKeyedSubscript:@"randomnessErrorChangeRatioThresholdForCameraMotion"];
  [v44 floatValue];
  self->jsonRandomnessErrorChangeRatioThresholdForCameraMotion = v45;

  v46 = [v3 objectForKeyedSubscript:@"randomnessAreaChangeRatioThresholdForCameraMotion"];
  [v46 floatValue];
  self->jsonRandomnessAreaChangeRatioThresholdForCameraMotion = v47;

  v48 = [v3 objectForKeyedSubscript:@"randomnessErrorChangeRatioThresholdForStatic"];
  [v48 floatValue];
  self->jsonRandomnessErrorChangeRatioThresholdForStatic = v49;

  v50 = [v3 objectForKeyedSubscript:@"randomnessAreaChangeRatioThresholdForStatic"];
  [v50 floatValue];
  self->jsonRandomnessAreaChangeRatioThresholdForStatic = v51;

  self->randomnessErrorChangeRatioThreshold = self->jsonRandomnessErrorChangeRatioThreshold;
  self->randomnessAreaChangeRatioThreshold = self->jsonRandomnessAreaChangeRatioThreshold;
  v52 = [v3 objectForKeyedSubscript:@"consistentRandomFlowThreshold"];
  [v52 floatValue];
  self->jsonConsistentRandomFlowThreshold = v53;

  v54 = [v3 objectForKeyedSubscript:@"consistentRandomFlowResetAreaChangeRatio"];
  [v54 floatValue];
  self->jsonConsistentRandomFlowResetAreaChangeRatio = v55;

  v56 = [v3 objectForKeyedSubscript:@"zigzagRandomFlowThreshold"];
  [v56 floatValue];
  self->jsonZigzagRandomFlowThreshold = v57;

  v58 = [v3 objectForKeyedSubscript:@"deformationRatioThreshold"];
  [v58 floatValue];
  self->jsonDeformationRatioThreshold = v59;

  v60 = [v3 objectForKeyedSubscript:@"deformationFlowThreshold"];
  [v60 floatValue];
  self->jsonDeformationFlowThreshold = v61;

  v62 = [v3 objectForKeyedSubscript:@"deformationFlowSumThreshold"];
  [v62 floatValue];
  self->jsonDeformationFlowSumThreshold = v63;

  v64 = [v3 objectForKeyedSubscript:@"histogramsAnalysisLargeObjectSizeThreshold"];
  [v64 floatValue];
  self->jsonHistogramsAnalysisLargeObjectSizeThreshold = v65;

  v66 = [v3 objectForKeyedSubscript:@"histogramsAnalysisSmallObjectSizeThreshold"];
  [v66 floatValue];
  self->jsonHistogramsAnalysisSmallObjectSizeThreshold = v67;

  v68 = [v3 objectForKeyedSubscript:@"sideMotionDominanceThreshold"];
  [v68 floatValue];
  self->jsonSideMotionDominanceThreshold = v69;

  v70 = [v3 objectForKeyedSubscript:@"sideMotionPixelCountThreshold"];
  self->jsonSideMotionPixelCountThreshold = [v70 intValue];

  for (uint64_t i = 0; i != 12; ++i)
  {
    v72 = [v3 objectForKeyedSubscript:@"consistencySafeThresholdsForDownsampledSloMo"];
    v73 = [v72 objectAtIndexedSubscript:i];
    [v73 floatValue];
    self->jsonConsistencySafeThresholdsForDownsampledSloMo[i] = v74;

    v75 = [v3 objectForKeyedSubscript:@"consistencySafeThresholdsForNonDownsampledSloMo"];
    v76 = [v75 objectAtIndexedSubscript:i];
    [v76 floatValue];
    self->jsonConsistencySafeThresholdsForNonDownsampledSloMo[i] = v77;
  }
  v78 = [v3 objectForKeyedSubscript:@"deformationFlowThresholdForSloMo"];
  [v78 floatValue];
  self->jsonDeformationFlowThresholdForSloMo = v79;

  v80 = [v3 objectForKeyedSubscript:@"deformationFlowSumThresholdForSloMo"];
  [v80 floatValue];
  self->jsonDeformationFlowSumThresholdForSloMo = v81;

  v82 = [v3 objectForKeyedSubscript:@"backwarpAreaPercentageThreshold"];
  [v82 floatValue];
  self->jsonBackwarpAreaPercentageThreshold = v83;

  v84 = [v3 objectForKeyedSubscript:@"backwarpFrameScoreThreshold"];
  [v84 floatValue];
  self->jsonBackwarpFrameScoreThreshold = v85;

  v86 = [v3 objectForKeyedSubscript:@"backwarpROIScoreThreshold"];
  [v86 floatValue];
  self->jsonBackwarpROIScoreThreshold = v87;

  self->jsonBackwarpScoreHighThreshold = 40.0;
  self->jsonBackwarpAreaPercentageHighThreshold = 45.0;
  self->jsonBackwarpAreaThreshold = 450.0;
  self->jsonBackwarpFrameScoreThresholdOnDemand = 27.0;
  self->jsonBackwarpAreaPercentageThresholdOnDemand = 5.0;
  CVPixelBufferRelease(self->_donwsampledSourceBuffer);
  self->_donwsampledSourceBuffer = 0;
}

- (BOOL)isSafeToInterpolate
{
  return self->_safeToInterpolate.consistency
      && self->_safeToInterpolate.randomness
      && self->_safeToInterpolate.deformation
      && self->_safeToInterpolate.backwarp;
}

- (unint64_t)gatingCause
{
  if (!self->_safeToInterpolate.consistency) {
    return 6;
  }
  if (!self->_safeToInterpolate.randomness) {
    return 7;
  }
  if (!self->_safeToInterpolate.deformation) {
    return 8;
  }
  if (self->_safeToInterpolate.backwarp) {
    return 0;
  }
  return 9;
}

- (void)prepareGatingFrameDropDetector:(id)a3 numberOfFrames:(unint64_t)a4 timeGap:(id *)a5 isContinuousDrops:(BOOL)a6 enableFlowAnalysis:(BOOL)a7 enableCrossFlowAnalysis:(BOOL)a8 cleanRectFirst:(CGRect)a9 cleanRectSecond:(CGRect)a10
{
  BOOL v10 = a8;
  BOOL v11 = a7;
  double height = a10.size.height;
  double width = a10.size.width;
  double y = a10.origin.y;
  double x = a10.origin.x;
  double v19 = a9.size.height;
  double v20 = a9.size.width;
  double v21 = a9.origin.y;
  double v22 = a9.origin.x;
  id v24 = a3;
  self->_unint64_t framesToInterpolate = a4;
  int64_t var3 = a5->var3;
  *(_OWORD *)&self->_timeGap.value = *(_OWORD *)&a5->var0;
  self->_timeGap.epoch = var3;
  self->_BOOL isContinuousDrops = a6;
  unint64_t framesToInterpolate = self->_framesToInterpolate;
  if (framesToInterpolate >= 2)
  {
    CMTimeMake(&time2, 10, 600);
    CMTime time1 = (CMTime)self->_timeGap;
    if (CMTimeCompare(&time1, &time2) > 0)
    {
      BOOL v27 = 1;
      goto LABEL_6;
    }
    unint64_t framesToInterpolate = self->_framesToInterpolate;
  }
  BOOL v27 = framesToInterpolate > 4;
LABEL_6:
  if ([v24 retimingRecipe]) {
    BOOL v28 = (unint64_t)[v24 numberOfInsertionPoints] < 5;
  }
  else {
    BOOL v28 = 1;
  }
  self->_BOOL isSmallDrops = v28;
  if (v11)
  {
    if ([v24 numberOfInsertionPoints]) {
      BOOL v29 = 1;
    }
    else {
      BOOL v29 = self->_useCase == 1;
    }
  }
  else
  {
    BOOL v29 = 0;
  }
  self->_shouldRunFlowAnalysis = v29;
  if (v10)
  {
    BOOL isContinuousDrops = self->_isContinuousDrops;
    if (isContinuousDrops) {
      BOOL isContinuousDrops = self->_useCase == 0;
    }
  }
  else
  {
    BOOL isContinuousDrops = 0;
  }
  self->_shouldRunCrossFlowAnalysis = isContinuousDrops;
  if (self->_shouldRunFlowAnalysis)
  {
    unint64_t useCase = self->_useCase;
    if (useCase == 1)
    {
      unint64_t v34 = self->_framesToInterpolate;
      self->_shouldRunDetection = v34 > 2;
      BOOL isSmallDrops = v34 - 4 < 6;
      uint64_t v33 = 911;
    }
    else
    {
      if (useCase) {
        goto LABEL_28;
      }
      if (v27 || (BOOL isSmallDrops = self->_isSmallDrops)) {
        BOOL isSmallDrops = self->_timesDidRunDetection < 2u;
      }
      uint64_t v33 = 910;
    }
    *((unsigned char *)&self->super.super.isa + v33) = isSmallDrops;
  }
  else
  {
    self->_shouldRunDetection = 0;
    self->_shouldRunBackwarpGating = 0;
  }
LABEL_28:
  if (self->_useCase)
  {
    float v35 = fmax(v22, x) * 0.0625;
    CGFloat v36 = (float)(floorf(v35) + 1.0);
    float v37 = fmax(v21, y) * 0.0625;
    CGFloat v38 = (float)(floorf(v37) + 1.0);
    float v39 = fmin(v20 + v22, width + x) * 0.0625;
    CGFloat v40 = floorf(v39) - v36;
    float v41 = fmin(v19 + v21, height + y) * 0.0625;
    self->_cleanRectFlow8x8.origin.double x = v36;
    self->_cleanRectFlow8x8.origin.double y = v38;
    CGFloat v42 = floorf(v41) - v38;
    self->_cleanRectFlow8x8.size.double width = v40;
    self->_cleanRectFlow8x8.size.double height = v42;
    printf("cleanRectFlow8x8: (x, y, width, height) = (%f, %f, %f, %f)\n", v36, v38, v40, v42);
  }
}

- (void)runGatingWithPrevFlowBackward:(__CVBuffer *)a3 flowForward:(__CVBuffer *)a4 flowBackward:(__CVBuffer *)a5 lastFrameDuration:(id *)a6 lastNumberOfFrames:(unint64_t)a7 flowResFrame:(__CVBuffer *)a8 flowResFirst:(__CVBuffer *)a9 flowResSecond:(__CVBuffer *)a10
{
  [(OpticalFlowAnalyzer *)self modulateGatingParametersWithFlowForward:a4 flowResFrame:a8];
  if (self->_shouldRunCrossFlowAnalysis)
  {
    kdebug_trace();
    long long v17 = *(_OWORD *)&a6->var0;
    int64_t var3 = a6->var3;
    [(OpticalFlowAnalyzer *)self isSafeToInterpolateForRandomnessGatingWithPrevFlowBackward:a3 flowForward:a4 lastFrameDuration:&v17 lastNumberOfFrames:a7 flowResFrame:a8];
    kdebug_trace();
  }
  if (self->_shouldRunFlowAnalysis)
  {
    kdebug_trace();
    [(OpticalFlowAnalyzer *)self isSafeToInterpolateForConsistencyGatingWithFlowForward:a4 flowBackward:a5 flowResFrame:a8];
    [(OpticalFlowAnalyzer *)self isSafeToInterpolateForBackwarpGatingWithFlowForward:a4 flowBackward:a5 flowResFirst:a9 flowResSecond:a10];
    [(OpticalFlowAnalyzer *)self isSafeToInterpolateForDeformationGating];
    kdebug_trace();
  }
}

- (void)isSafeToInterpolateForConsistencyGatingWithFlowForward:(__CVBuffer *)a3 flowBackward:(__CVBuffer *)a4 flowResFrame:(__CVBuffer *)a5
{
  float v55 = 0;
  *(_OWORD *)float v53 = 0u;
  *(_OWORD *)v54 = 0u;
  *(_OWORD *)float v51 = 0u;
  *(_OWORD *)v52 = 0u;
  *(_OWORD *)float v49 = 0u;
  *(_OWORD *)v50 = 0u;
  *(_OWORD *)float v47 = 0u;
  *(_OWORD *)v48 = 0u;
  long long v45 = 0u;
  *(_OWORD *)v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  memset(v42, 0, sizeof(v42));
  float v9 = (void *)MEMORY[0x1E01A5320](self, a2);
  [(OpticalFlowAnalyzer *)self analyzeOpticalFlowForward:a3 backward:a4 flowResFrame:a5];
  if (!self->_useCase && self->_isLargeRandomnessErr)
  {
    int64_t retimingRecipe = self->_retimingRecipe;
    if (retimingRecipe < 3 || retimingRecipe == 1000)
    {
      if (self->consistencySafeThresholdsScale <= 0.0) {
        self->consistencySafeThresholdsScaleForLargeRandomnessErr = self->consistencySafeThresholdsScaleForLargeRandomnessErr
      }
                                                                  + 1.0;
      if (self->_prevFlowRandomnessErr >= self->jsonRandomnessErrThreshold) {
        self->consistencySafeThresholdsScaleForLargeRandomnessErr = self->consistencySafeThresholdsScaleForLargeRandomnessErr
      }
                                                                  + 0.5;
      if (self->_prevFlowRandomnessArea >= self->jsonRandomnessAreaPercentageThresholdHigh) {
        self->consistencySafeThresholdsScaleForLargeRandomnessErr = self->consistencySafeThresholdsScaleForLargeRandomnessErr
      }
                                                                  + 0.5;
    }
  }
  float v10 = *((float *)&v43 + 3);
  float v11 = *(float *)&v44;
  p_timeGap = &self->_timeGap;
  BOOL opticalFlowDownsampling = self->_opticalFlowDownsampling;
  CMTime time1 = (CMTime)self->_timeGap;
  [(OpticalFlowAnalyzer *)self safeThresholdWithtimeGap:&time1 isDownsampled:opticalFlowDownsampling];
  float v18 = *(float *)&v14;
  float v19 = *(float *)&v15;
  unint64_t useCase = self->_useCase;
  if (useCase != 1)
  {
    if (useCase) {
      goto LABEL_57;
    }
    if ((v10 > self->jsonConsistencyAreaPercentageThreshold || self->_retimingRecipe == 3) && *(float *)&v14 > 0.0)
    {
      double v21 = @"[FlowAnalysis] Interpolation is gated (consistency) - frame";
    }
    else if (self->_isSmallDrops && (float)((float)(self->consistencySafeThresholdsScale * 4.0) + 35.0) > 0.0)
    {
      double v21 = @"[FlowAnalysis] Interpolation is gated (consistency) - frameForSmallDrops";
    }
    else if (*(float *)&v15 <= 100.0)
    {
      if (100.0 < 25.0 && self->_isSmallDrops)
      {
        double v21 = @"[FlowAnalysis] Interpolation is gated (consistency) - roiForSmallDrops";
      }
      else if (!self->_motionHistogramsAnalysis.hasCameraRotaion {
             || (CMTimeMake(&v40, 80, 600),
      }
                 *(_OWORD *)&time1.value = *(_OWORD *)&p_timeGap->value,
                 time1.epoch = self->_timeGap.epoch,
                 CMTimeCompare(&time1, &v40) < 0)
             && self->_retimingRecipe)
      {
        if ([(OpticalFlowAnalyzer *)self checkSafetyByScoreAndArea:v42])
        {
          if ([(OpticalFlowAnalyzer *)self checkSafetyByStripConsistency:v42])
          {
            if ([(OpticalFlowAnalyzer *)self checkSafetyByBlockConsistency:v42]) {
              goto LABEL_57;
            }
            double v21 = @"[FlowAnalysis] Interpolation is gated (consistency) - block";
          }
          else
          {
            double v21 = @"[FlowAnalysis] Interpolation is gated (consistency) - strip";
          }
        }
        else
        {
          double v21 = @"[FlowAnalysis] Interpolation is gated (consistency) - area";
        }
      }
      else
      {
        double v21 = @"[FlowAnalysis] Interpolation is gated (consistency) - rotation";
      }
    }
    else
    {
      double v21 = @"[FlowAnalysis] Interpolation is gated (consistency) - roi";
    }
    goto LABEL_54;
  }
  float v23 = *(float *)&v16;
  float v38 = v11;
  *(float *)&double v17 = self->jsonConsistencyAreaPercentageThreshold;
  LODWORD(v14) = 0;
  *(float *)&double v15 = v18;
  *(float *)&double v16 = v10;
  [(OpticalFlowAnalyzer *)self computeConsistencyConfidenceFromScore:v14 scoreThreshold:v15 areaRatio:v16 areaRatioThreshold:v17];
  float v25 = v24;
  *(float *)&double v26 = self->jsonConsistencyAreaPercentageThresholdOnDemand;
  LODWORD(v27) = 0;
  *(float *)&double v28 = v23;
  *(float *)&double v29 = v10;
  [(OpticalFlowAnalyzer *)self computeConsistencyConfidenceFromScore:v27 scoreThreshold:v28 areaRatio:v29 areaRatioThreshold:v26];
  float v32 = *(float *)&v34;
  LODWORD(v33) = 1.0;
  LODWORD(v34) = 1.0;
  if (*((float *)&v43 + 1) != *((float *)&v43 + 2))
  {
    *(float *)&double v31 = self->jsonConsistencyROIAreaPercentageThreshold;
    LODWORD(v34) = 1120403456;
    *(float *)&double v30 = v19;
    *(float *)&double v33 = v10;
    [(OpticalFlowAnalyzer *)self computeConsistencyConfidenceFromScore:v34 scoreThreshold:v30 areaRatio:v33 areaRatioThreshold:v31];
    LODWORD(v33) = 1.0;
  }
  float v35 = fmin(fminf(v25, *(float *)&v34), 1.0);
  if (v35 < *(float *)&v33) {
    NSLog(&cfstr_Autobahnflowan.isa, v35);
  }
  self->_confidenceScore = fminf(v35, self->_confidenceScore);
  float v36 = fmin(v32, 1.0);
  if (v36 < 1.0) {
    NSLog(&cfstr_Autobahnflowan_0.isa, v36);
  }
  self->_confidenceScoreOnDemand = fminf(v36, self->_confidenceScoreOnDemand);
  if (v10 > self->jsonConsistencyAreaPercentageThreshold && v18 > 0.0)
  {
    self->_safeToInterpolate.consistencdouble y = 0;
    if (self->_framesToInterpolate < 4)
    {
      NSLog(&cfstr_Autobahnflowan_2.isa);
      goto LABEL_57;
    }
    double v21 = @"[AutobahnFlowAnalysis] Interpolation is gated (consistency) - frame for recommendation only";
    if (v10 <= self->jsonConsistencyAreaPercentageThresholdOnDemand || v23 <= 0.0) {
      goto LABEL_56;
    }
    double v21 = @"[AutobahnFlowAnalysis] Interpolation is gated (consistency) - frame for both";
    float v37 = &OBJC_IVAR___OpticalFlowAnalyzer__isSafeToInterpolateForInteractiveMode;
LABEL_55:
    *((unsigned char *)&self->super.super.isa + *v37) = 0;
LABEL_56:
    NSLog(&v21->isa);
    goto LABEL_57;
  }
  CMTimeMake(&time2, 40, 600);
  *(_OWORD *)&time1.value = *(_OWORD *)&p_timeGap->value;
  time1.epoch = self->_timeGap.epoch;
  if (CMTimeCompare(&time1, &time2) >= 1
    && ![(OpticalFlowAnalyzer *)self checkSafetyByStripConsistency:v42])
  {
    double v21 = @"[AutobahnFlowAnalysis] Interpolation is gated (consistency) - strip for recommendation only";
    goto LABEL_54;
  }
  if (v38 > self->jsonConsistencyROIAreaPercentageThreshold && v19 > 100.0)
  {
    double v21 = @"[AutobahnFlowAnalysis] Interpolation is gated (consistency) - roi for recommendation only";
LABEL_54:
    float v37 = &OBJC_IVAR___OpticalFlowAnalyzer__safeToInterpolate;
    goto LABEL_55;
  }
LABEL_57:
  self->_flowConsistencyFrameScore = 0.0;
  self->_flowConsistencyROIScore = 100.0;
  if (v46[0]) {
    free(v46[0]);
  }
  if (v47[0]) {
    free(v47[0]);
  }
  if (v48[0]) {
    free(v48[0]);
  }
  if (v49[0]) {
    free(v49[0]);
  }
  if (v50[0]) {
    free(v50[0]);
  }
  if (v51[0]) {
    free(v51[0]);
  }
  if (v52[0]) {
    free(v52[0]);
  }
  if (v53[0]) {
    free(v53[0]);
  }
  if (v54[0]) {
    free(v54[0]);
  }
  if (v55) {
    free(v55);
  }
}

- (float)computeConsistencyConfidenceFromScore:(float)a3 scoreThreshold:(float)a4 areaRatio:(float)a5 areaRatioThreshold:(float)a6
{
  double v8 = 1.5;
  if (a5 < a6) {
    double v8 = expf((float)(1.0 - (float)(a5 / a6)) * 15.0) * 1.5;
  }
  float v9 = 4.0;
  if (a3 >= a4) {
    float v9 = 1.0;
  }
  return v8 / (float)(expf((float)((float)(a4 / a3) + -1.0) * v9) + 1.0);
}

- ($3EBD9E1B7FBE9902CA366ED728B89DC8)analyzeOpticalFlowForward:(SEL)a3 backward:(__CVBuffer *)a4 flowResFrame:(__CVBuffer *)a5
{
  float v10 = createTexturesFromCVPixelBuffer(a4, self->super._device, 1, 2uLL);
  float v11 = createTexturesFromCVPixelBuffer(a5, self->super._device, 1, 2uLL);
  createRGBATextureFromCVPixelBuffer(a6, self->super._device);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  v12 = [(NSArray *)self->_firstFaceHandLegRectangles arrayByAddingObjectsFromArray:self->_secondFaceHandLegRectangles];
  *(_OWORD *)&retstr->var0.var0 = 0u;
  *(_OWORD *)&retstr->var0.int64_t var3 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var10 = 0u;
  *(_OWORD *)&retstr->var12 = 0u;
  *(_OWORD *)&retstr->var14 = 0u;
  *(_OWORD *)&retstr->var16 = 0u;
  *(_OWORD *)&retstr->var18 = 0u;
  *(_OWORD *)&retstr->var20 = 0u;
  *(_OWORD *)&retstr->var22 = 0u;
  *(_OWORD *)&retstr->var24 = 0u;
  *(_OWORD *)&retstr->var26 = 0u;
  *(_OWORD *)&retstr->var28 = 0u;
  retstr->var30 = 0;
  [(OpticalFlowAnalyzer *)self calcFlowStatisticsForwardFlowTexture:v10 backwardFlowTexture:v11 faceHandLegRectangles:v12 frameTexture:v15];
  unint64_t framesToInterpolate = self->_framesToInterpolate;
  retstr->var0 = ($3CC8671D27C23BF42ADDB32F2B5E48AE)self->_timeGap;
  retstr->var1 = framesToInterpolate;
  [(OpticalFlowAnalyzer *)self analyzeAggregatedStatistics:retstr];

  return result;
}

- ($3EBD9E1B7FBE9902CA366ED728B89DC8)calcFlowStatisticsForwardFlowTexture:(SEL)a3 backwardFlowTexture:(id)a4 faceHandLegRectangles:(id)a5 frameTexture:(id)a6
{
  id v24 = a6;
  id v12 = a7;
  id v13 = a5;
  id v14 = a4;
  unint64_t v15 = (unint64_t)([v14 width] + 7) >> 3;
  unint64_t v16 = (unint64_t)([v14 height] + 7) >> 3;
  double v17 = (void *)[(MTLDevice *)self->super._device newBufferWithLength:4 * v15 * v16 options:0];
  float v18 = [(MTLCommandQueue *)self->super._commandQueue commandBuffer];
  float v19 = [v18 computeCommandEncoder];
  [v19 setComputePipelineState:self->_flowStatisticsKernel];
  [v19 setTexture:v14 atIndex:0];

  [v19 setTexture:v13 atIndex:1];
  [v19 setTexture:v12 atIndex:2];

  [v19 setBuffer:v17 offset:0 atIndex:0];
  v27[0] = v15;
  v27[1] = v16;
  v27[2] = 1;
  int64x2_t v25 = vdupq_n_s64(8uLL);
  uint64_t v26 = 1;
  [v19 dispatchThreadgroups:v27 threadsPerThreadgroup:&v25];
  [v19 endEncoding];
  [v18 commit];
  [v18 waitUntilCompleted];
  id v20 = v17;
  uint64_t v21 = [v20 contents];
  if (v24)
  {
    double v22 = [(OpticalFlowAnalyzer *)self findFaceHandLegBlocksFromRectangles:v24 blockWidth:v15 blockHeight:v16];
  }
  else
  {
    double v22 = 0;
  }
  retstr->var30 = 0;
  *(_OWORD *)&retstr->var26 = 0u;
  *(_OWORD *)&retstr->var28 = 0u;
  *(_OWORD *)&retstr->var22 = 0u;
  *(_OWORD *)&retstr->var24 = 0u;
  *(_OWORD *)&retstr->var18 = 0u;
  *(_OWORD *)&retstr->var20 = 0u;
  *(_OWORD *)&retstr->var14 = 0u;
  *(_OWORD *)&retstr->var16 = 0u;
  *(_OWORD *)&retstr->var10 = 0u;
  *(_OWORD *)&retstr->var12 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  *(_OWORD *)&retstr->var0.int64_t var3 = 0u;
  [(OpticalFlowAnalyzer *)self processGPUOutputs:v21 blockWidth:v15 blockHeight:v16 faceHandLegBoundingBoxBlocks:v22];

  return result;
}

- (id)findFaceHandLegBlocksFromRectangles:(id)a3 blockWidth:(unint64_t)a4 blockHeight:(unint64_t)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  double v8 = [MEMORY[0x1E4F1CA48] array];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v25;
    double v13 = (double)a5;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(v9);
        }
        unint64_t v15 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        objc_msgSend(v15, "boundingBox", (void)v24);
        double v22 = +[FRCFaceHandLegBlock faceHandLegBlockWithRect:numberOfBlocks:category:](FRCFaceHandLegBlock, "faceHandLegBlockWithRect:numberOfBlocks:category:", ((int)(v18 * (double)a4 + 0.5) + 1) * ((int)(v19 * v13 + 0.5) + 1), [v15 category], (double)(int)(v16 * (double)a4), (double)(int)((1.0 - v17 - v19) * v13), (double)v20, (double)v21);
        [v8 addObject:v22];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v11);
  }

  return v8;
}

- ($3EBD9E1B7FBE9902CA366ED728B89DC8)processGPUOutputs:(SEL)a3 blockWidth:(id *)a4 blockHeight:(unint64_t)a5 faceHandLegBoundingBoxBlocks:(unint64_t)a6
{
  id v105 = a7;
  unint64_t v10 = (a5 + 1) >> 1;
  unint64_t v11 = (a6 + 1) >> 1;
  unint64_t v12 = (a5 + 11) / 0xC;
  unint64_t v13 = (a5 + 3) >> 2;
  unint64_t v14 = (a6 + 3) >> 2;
  size_t v15 = v14 * v13;
  unint64_t v75 = (a5 + 5) / 6;
  unint64_t v76 = v13;
  size_t v16 = v11 * v75;
  unint64_t v77 = v10;
  size_t v17 = (a6 + 5) / 6 * v10;
  size_t v18 = v14 * v12;
  unint64_t v19 = (a6 + 11) / 0xC;
  size_t v20 = v19 * v13;
  unint64_t v101 = v12;
  size_t v21 = v19 * v12;
  unint64_t v74 = (a5 + 23) / 0x18;
  unint64_t v71 = v11 * v10;
  v93 = (float *)malloc_type_calloc(v11 * v10, 4uLL, 0x100004052888210uLL);
  unint64_t v70 = v15;
  v92 = (float *)malloc_type_calloc(v15, 4uLL, 0x100004052888210uLL);
  v91 = (float *)malloc_type_calloc(v16, 4uLL, 0x100004052888210uLL);
  unint64_t v69 = v17;
  id v90 = (float *)malloc_type_calloc(v17, 4uLL, 0x100004052888210uLL);
  unint64_t v68 = v18;
  v89 = (float *)malloc_type_calloc(v18, 4uLL, 0x100004052888210uLL);
  unint64_t v67 = v20;
  v88 = (float *)malloc_type_calloc(v20, 4uLL, 0x100004052888210uLL);
  unint64_t v66 = v21;
  float v87 = (float *)malloc_type_calloc(v21, 4uLL, 0x100004052888210uLL);
  size_t v65 = (a6 + 23) / 0x18 * v74;
  double v22 = self;
  v86 = (float *)malloc_type_calloc(v65, 4uLL, 0x100004052888210uLL);
  float v85 = (float *)malloc_type_calloc(0xCuLL, 4uLL, 0x100004052888210uLL);
  v84 = (float *)malloc_type_calloc(8uLL, 4uLL, 0x100004052888210uLL);
  size_t v23 = [v105 count];
  long long v24 = (float *)malloc_type_calloc(v23, 4uLL, 0x100004052888210uLL);
  if (self->_visualizationEnabled) {
    self->_consistencyMap = (char *)malloc_type_calloc(a6 * a5, 1uLL, 0x100004077774924uLL);
  }
  unint64_t v83 = (a6 + 7) >> 3;
  v80 = self;
  unint64_t v81 = a5;
  if (a6)
  {
    unint64_t v103 = 0;
    uint64_t v25 = 0;
    unint64_t v26 = 0;
    uint64_t v73 = (int)a5;
    float v27 = 0.0;
    float v28 = 0.0;
    float v29 = 0.0;
    float v30 = 0.0;
    unint64_t v78 = a6;
    float v79 = v24;
    do
    {
      if (a5)
      {
        unint64_t v31 = 0;
        p_cleanRectFlow8x8 = &v22->_cleanRectFlow8x8;
        uint64_t v100 = v103 * v73;
        uint64_t v33 = v103 >> 1;
        unint64_t v99 = v77 * v33;
        uint64_t v34 = v103 >> 2;
        unint64_t v98 = v76 * v34;
        unint64_t v97 = v75 * v33;
        unint64_t v96 = v101 * v34;
        unint64_t v35 = v103 / 0xCuLL;
        unint64_t v94 = v101 * v35;
        unint64_t v95 = v76 * v35;
        do
        {
          v107.double x = (double)(int)v31;
          v107.double y = (double)(int)v103;
          if (CGRectContainsPoint(*p_cleanRectFlow8x8, v107))
          {
            float var0 = a4[v31 + v100].var0;
            if (v22->_visualizationEnabled) {
              v22->_consistencyMap[v31 + v100] = (int)var0;
            }
            if ((float)(v22->jsonConsistencyAreaThreshold * 64.0) / 5.0 < var0) {
              float v29 = v29 + 1.0;
            }
            float v37 = v105;
            if (v23)
            {
              uint64_t v102 = v25;
              unint64_t v38 = v26;
              uint64_t v39 = 0;
              BOOL v40 = 0;
              while (1)
              {
                float v41 = [v37 objectAtIndexedSubscript:v39];
                [v41 rect];
                v108.double x = (double)(int)v31;
                v108.double y = (double)(int)v103;
                BOOL v42 = CGRectContainsPoint(v109, v108);

                if (v42) {
                  break;
                }
                BOOL v40 = v23 <= ++v39;
                float v37 = v105;
                if (v23 == v39)
                {
                  BOOL v40 = 1;
                  float v43 = var0;
                  double v22 = v80;
                  a5 = v81;
                  goto LABEL_21;
                }
              }
              double v22 = v80;
              v79[v39] = var0 + v79[v39];
              if ((float)(v80->jsonConsistencyAreaThreshold * 64.0) / 5.0 < var0) {
                float v28 = v28 + 1.0;
              }
              float v43 = -0.0;
              a5 = v81;
LABEL_21:
              unint64_t v26 = v38;
              uint64_t v25 = v102;
            }
            else
            {
              BOOL v40 = 1;
              float v43 = var0;
            }
            ++v26;
            float v30 = v30 + var0;
            float v27 = v27 + v43;
            uint64_t v44 = v31 >> 1;
            v25 += v40;
            v93[v99 + v44] = var0 + v93[v99 + v44];
            uint64_t v45 = v31 >> 2;
            v92[v98 + v45] = var0 + v92[v98 + v45];
            v91[v97 + v31 / 6uLL] = var0 + v91[v97 + v31 / 6uLL];
            v90[v77 * (v103 / 6uLL) + v44] = var0 + v90[v77 * (v103 / 6uLL) + v44];
            v89[v96 + v31 / 0xCuLL] = var0 + v89[v96 + v31 / 0xCuLL];
            v88[v95 + v45] = var0 + v88[v95 + v45];
            v87[v94 + v31 / 0xCuLL] = var0 + v87[v94 + v31 / 0xCuLL];
            v86[v74 * (v103 / 0x18uLL) + v31 / 0x18uLL] = var0
                                                                                    + v86[v74
                                                                                        * (v103
                                                                                         / 0x18uLL)
                                                                                        + v31 / 0x18uLL];
            v85[v31 / v101] = var0 + v85[v31 / v101];
            v84[v103 / v83] = var0 + v84[v103 / v83];
          }
          ++v31;
        }
        while (v31 != a5);
      }
      a6 = v78;
      ++v103;
      long long v24 = v79;
    }
    while (v103 != v78);
  }
  else
  {
    unint64_t v26 = 0;
    uint64_t v25 = 0;
    float v30 = 0.0;
    float v29 = 0.0;
    float v28 = 0.0;
    float v27 = 0.0;
  }
  unint64_t v46 = v26;
  float v47 = (float)v26;
  v48 = (float *)malloc_type_calloc(v23, 4uLL, 0x100004052888210uLL);
  float v49 = 0.0;
  float v50 = 0.0;
  if (v23)
  {
    for (uint64_t i = 0; i != v23; ++i)
    {
      float v52 = v24[i];
      float v53 = [v105 objectAtIndexedSubscript:i];
      v48[i] = v52 / (float)(int)([v53 numberOfBlocks] << 6);

      v54 = [v105 objectAtIndexedSubscript:i];
      float v55 = (float)(unint64_t)[v54 numberOfBlocks] / v47;

      v56 = [v105 objectAtIndexedSubscript:i];
      uint64_t v57 = [v56 category];

      float v58 = 64.0;
      if (v57 == 2) {
        float v58 = 128.0;
      }
      float v59 = fmin((float)(v55 * v58), 1.0);
      if ((float)(v48[i] * v59) > v50)
      {
        float v50 = v48[i] * v59;
        float v49 = v59;
      }
    }
  }
  float v104 = v50;
  if (v25) {
    float v60 = v27 / (float)(unint64_t)(v25 << 6);
  }
  else {
    float v60 = 0.0;
  }
  float v61 = v30 / (float)(v46 << 6);
  float v62 = log10(100.0 / v61) * 10.0;
  float v63 = log10(100.0 / (float)(v104 + (float)((float)(1.0 - v49) * v60))) * 10.0;
  [(OpticalFlowAnalyzer *)v80 calcStripConsistency:v85 stripSize:(a6 * v101) << 6 numStrips:12];
  [(OpticalFlowAnalyzer *)v80 calcStripConsistency:v84 stripSize:(v81 * v83) << 6 numStrips:8];
  *(_OWORD *)&retstr->var2 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var0.float var0 = 0u;
  *(_OWORD *)&retstr->var0.int64_t var3 = 0u;
  retstr->var2 = v61;
  retstr->int64_t var3 = v62;
  retstr->var4 = v63;
  retstr->var5 = (float)(v29 * 100.0) / v47;
  retstr->var6 = (float)(v28 * 100.0) / v47;
  *(void *)&retstr->var10 = 0;
  retstr->var11 = v71;
  retstr->var12 = v93;
  retstr->var13 = v70;
  retstr->var16 = v90;
  retstr->var17 = v16;
  retstr->var14 = v92;
  retstr->var15 = v69;
  retstr->var20 = v88;
  retstr->var21 = v68;
  retstr->var18 = v91;
  retstr->var19 = v67;
  retstr->var22 = v89;
  retstr->var23 = v66;
  retstr->var24 = v87;
  retstr->var25 = v65;
  retstr->var26 = v86;
  retstr->var27 = 12;
  retstr->var28 = v85;
  retstr->var29 = 8;
  retstr->var30 = v84;
  free(v48);
  free(v24);

  return result;
}

- (void)calcStripConsistency:(float *)a3 stripSize:(unint64_t)a4 numStrips:(unsigned int)a5
{
  if (a5)
  {
    float v6 = (float)a4;
    uint64_t v7 = a5;
    do
    {
      float v8 = *a3 / v6;
      if (v8 == 0.0) {
        float v9 = 100.0;
      }
      else {
        float v9 = log10(100.0 / v8) * 10.0;
      }
      *a3++ = v9;
      --v7;
    }
    while (v7);
  }
}

- (void)analyzeAggregatedStatistics:(id *)a3
{
  CMTime time = (CMTime)a3->var0;
  double Seconds = CMTimeGetSeconds(&time);
  unint64_t var11 = a3->var11;
  float v7 = 0.0;
  float v8 = 0.0;
  if (var11)
  {
    var12 = a3->var12;
    do
    {
      float v10 = *var12 * 0.0039062;
      *var12++ = v10;
      float v8 = fmaxf(v8, v10);
      --var11;
    }
    while (var11);
  }
  unint64_t var13 = a3->var13;
  if (var13)
  {
    var14 = a3->var14;
    float v7 = 0.0;
    do
    {
      float v13 = *var14 * 0.00097656;
      *var14++ = v13;
      float v7 = fmaxf(v7, v13);
      --var13;
    }
    while (var13);
  }
  unint64_t var17 = a3->var17;
  double v15 = 0.0;
  double v16 = 0.0;
  if (var17)
  {
    var18 = a3->var18;
    float v18 = 0.0;
    do
    {
      float v19 = *var18 / 768.0;
      *var18++ = v19;
      float v18 = fmaxf(v18, v19);
      --var17;
    }
    while (var17);
    double v16 = v18;
  }
  unint64_t var15 = a3->var15;
  if (var15)
  {
    var16 = a3->var16;
    float v22 = 0.0;
    do
    {
      float v23 = *var16 / 768.0;
      *var16++ = v23;
      float v22 = fmaxf(v22, v23);
      --var15;
    }
    while (var15);
    double v15 = v22;
  }
  unint64_t var21 = a3->var21;
  double v25 = 0.0;
  double v26 = 0.0;
  if (var21)
  {
    var22 = a3->var22;
    float v28 = 0.0;
    do
    {
      float v29 = *var22 / 3072.0;
      *var22++ = v29;
      float v28 = fmaxf(v28, v29);
      --var21;
    }
    while (var21);
    double v26 = v28;
  }
  unint64_t var19 = a3->var19;
  if (var19)
  {
    var20 = a3->var20;
    float v32 = 0.0;
    do
    {
      float v33 = *var20 / 3072.0;
      *var20++ = v33;
      float v32 = fmaxf(v32, v33);
      --var19;
    }
    while (var19);
    double v25 = v32;
  }
  unint64_t var23 = a3->var23;
  float v35 = 0.0;
  float v36 = 0.0;
  if (var23)
  {
    var24 = a3->var24;
    do
    {
      float v38 = *var24 / 9216.0;
      *var24++ = v38;
      float v36 = fmaxf(v36, v38);
      --var23;
    }
    while (var23);
  }
  unint64_t var25 = a3->var25;
  if (var25)
  {
    var26 = a3->var26;
    float v35 = 0.0;
    do
    {
      float v41 = *var26 / 36864.0;
      *var26++ = v41;
      float v35 = fmaxf(v35, v41);
      --var25;
    }
    while (var25);
  }
  float v42 = Seconds * 1000.0;
  a3->var7 = v8;
  a3->var8 = v7;
  a3->var9 = v36;
  a3->var10 = v35;
  printf("[FlowAnalysis] Insert %ld frames, Duration: %6.2f msec, Error: %.3f, Score: %.3f, ROI_Score: %.3f, Area_Ratio: %.3f, ROI_Area_Ratio: %.3f, 16x16 Max: %.3f, 32x32 Max: %.3f, 48x16 Max: %.3f, 16x48 Max: %.3f, 96x32 Max: %.3f, 32x96 Max: %.3f, 96x96 Max: %.3f, 192x192 Max: %.3f\n", a3->var1, v42, a3->var2, a3->var3, a3->var4, a3->var5, a3->var6, v8, v7, v16, v15, v26, v25, v36, v35);
  [(OpticalFlowAnalyzer *)self printStripScores:a3];
  fflush((FILE *)*MEMORY[0x1E4F143D8]);
}

- (void)printStripScores:(id *)a3
{
  printf("[FlowAnalysis] Vertical Strip Score: ");
  if (a3->var27)
  {
    uint64_t v4 = 0;
    unsigned int v5 = 1;
    do
    {
      printf("%.3f", a3->var28[v4]);
      unint64_t var27 = a3->var27;
      if (var27 - 1 != v4)
      {
        printf(", ");
        unint64_t var27 = a3->var27;
      }
      uint64_t v4 = v5;
      BOOL v7 = var27 > v5++;
    }
    while (v7);
  }
  putchar(10);
  printf("[FlowAnalysis] Horizontal Strip Score: ");
  if (a3->var29)
  {
    uint64_t v8 = 0;
    unsigned int v9 = 1;
    do
    {
      printf("%.3f", a3->var30[v8]);
      unint64_t var29 = a3->var29;
      if (var29 - 1 != v8)
      {
        printf(", ");
        unint64_t var29 = a3->var29;
      }
      uint64_t v8 = v9;
      BOOL v7 = var29 > v9++;
    }
    while (v7);
  }
  putchar(10);
}

- (void)runDetectionFromFirstBuffer:(__CVBuffer *)a3 secondBuffer:(__CVBuffer *)a4
{
  firstFaceHandLegRectangles = self->_firstFaceHandLegRectangles;
  self->_firstFaceHandLegRectangles = 0;

  secondFaceHandLegRectangles = self->_secondFaceHandLegRectangles;
  self->_secondFaceHandLegRectangles = 0;

  if (self->_shouldRunDetection)
  {
    kdebug_trace();
    unsigned int v9 = [(OpticalFlowAnalyzer *)self extractFaceHandLegInfoFromBuffer:a3];
    float v10 = self->_firstFaceHandLegRectangles;
    self->_firstFaceHandLegRectangles = v9;

    unint64_t v11 = [(OpticalFlowAnalyzer *)self extractFaceHandLegInfoFromBuffer:a4];
    unint64_t v12 = self->_secondFaceHandLegRectangles;
    self->_secondFaceHandLegRectangles = v11;

    ++self->_timesDidRunDetection;
    kdebug_trace();
  }
}

- (id)extractFaceHandLegInfoFromBuffer:(__CVBuffer *)a3
{
  objc_super v3 = a3;
  uint64_t v132 = *MEMORY[0x1E4F143B8];
  size_t Width = CVPixelBufferGetWidth(a3);
  size_t Height = CVPixelBufferGetHeight(v3);
  size_t v7 = Height;
  if (Height < 0x438)
  {
    if (Height < 0x21C)
    {
      if (self->_inputRotation != 3)
      {
        unint64_t v87 = Height;
        unint64_t v88 = Width;
        goto LABEL_9;
      }
    }
    else
    {
      size_t Width = ((Width >> 1) + 1) & 0xFFFFFFFFFFFFFFFELL;
      size_t v7 = ((Height >> 1) + 1) & 0x7FFFFFFFFFFFFFFELL;
    }
  }
  else
  {
    size_t Width = (Width + 3) >> 2;
    size_t v7 = (Height + 3) >> 2;
  }
  donwsampledSourceBuffer = self->_donwsampledSourceBuffer;
  if (!donwsampledSourceBuffer)
  {
    donwsampledSourceBuffer = createPixelBuffer(Width, v7, 0x42475241u, 0);
    self->_donwsampledSourceBuffer = donwsampledSourceBuffer;
  }
  unint64_t v87 = v7;
  unint64_t v88 = Width;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scaler);
  [WeakRetained downScaleFrameSource:v3 destination:donwsampledSourceBuffer rotate:self->_inputRotation waitForCompletion:0];

  objc_super v3 = donwsampledSourceBuffer;
LABEL_9:
  float v10 = [MEMORY[0x1E4F1C9E8] dictionary];
  unint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F45890]) initWithCVPixelBuffer:v3 options:v10];
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v14 = objc_alloc_init(MEMORY[0x1E4F457A8]);
  id v125 = 0;
  [v14 setRevision:3737841666 error:&v125];
  id v15 = v125;
  unint64_t v95 = v14;
  [v13 addObject:v14];
  if (self->_handDetectionEnabled)
  {
    id v16 = objc_alloc_init(MEMORY[0x1E4F457B8]);
    id v124 = v15;
    [v16 setRevision:1 error:&v124];
    id v17 = v124;

    NSLog(&cfstr_FlowanalysisHa.isa);
    [v13 addObject:v16];
    id v15 = v17;
  }
  else
  {
    id v16 = 0;
  }
  if (self->_bodyDetectionEnabled)
  {
    id v18 = objc_alloc_init(MEMORY[0x1E4F457B0]);
    id v123 = v15;
    [v18 setRevision:1 error:&v123];
    id v19 = v123;

    NSLog(&cfstr_FlowanalysisBo.isa);
    unint64_t v94 = v18;
    [v13 addObject:v18];
    id v15 = v19;
  }
  else
  {
    unint64_t v94 = 0;
  }
  if (self->_humanDetectionEnabled)
  {
    id v20 = objc_alloc_init(MEMORY[0x1E4F457C0]);
    id v122 = v15;
    [v20 setRevision:3737841664 error:&v122];
    id v21 = v122;

    NSLog(&cfstr_FlowanalysisHu.isa);
    v93 = v20;
    [v13 addObject:v20];
    id v15 = v21;
  }
  else
  {
    v93 = 0;
  }
  if (self->_animalFaceDetectionEnabled && self->_useCase == 1)
  {
    id v22 = objc_alloc_init(MEMORY[0x1E4F458F0]);
    id v121 = v15;
    [v22 setRevision:1 error:&v121];
    id v23 = v121;

    v92 = v22;
    [v13 addObject:v22];
    id v15 = v23;
  }
  else
  {
    v92 = 0;
  }
  id v120 = v15;
  id v90 = v11;
  v91 = v13;
  int v24 = [v11 performRequests:v13 error:&v120];
  id v89 = v120;

  if (v24)
  {
    double v25 = [v95 results];
    uint64_t v26 = [v25 count];

    id v85 = v16;
    v86 = v10;
    if (v26)
    {
      float v27 = self;
      float v28 = [v95 results];
      long long v116 = 0u;
      long long v117 = 0u;
      long long v118 = 0u;
      long long v119 = 0u;
      uint64_t v29 = [v28 countByEnumeratingWithState:&v116 objects:v131 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v117;
        do
        {
          for (uint64_t i = 0; i != v30; ++i)
          {
            if (*(void *)v117 != v31) {
              objc_enumerationMutation(v28);
            }
            float v33 = *(void **)(*((void *)&v116 + 1) + 8 * i);
            [v33 boundingBox];
            double v35 = v34;
            double v37 = v36;
            double v39 = v38;
            double v41 = v40;
            float v42 = [v33 roll];
            float v43 = [v33 yaw];
            uint64_t v44 = +[FRCFaceHandLegRectangle faceRectangleWithBoundingBox:roll:yaw:](FRCFaceHandLegRectangle, "faceRectangleWithBoundingBox:roll:yaw:", v42, v43, v35, v37, v39, v41);

            [v12 addObject:v44];
          }
          uint64_t v30 = [v28 countByEnumeratingWithState:&v116 objects:v131 count:16];
        }
        while (v30);
      }

      self = v27;
      id v16 = v85;
      float v10 = v86;
    }
    uint64_t v45 = [v16 results];
    uint64_t v46 = [v45 count];

    if (v46)
    {
      float v47 = [v16 results];
      long long v112 = 0u;
      long long v113 = 0u;
      long long v114 = 0u;
      long long v115 = 0u;
      uint64_t v48 = [v47 countByEnumeratingWithState:&v112 objects:v130 count:16];
      if (v48)
      {
        uint64_t v49 = v48;
        uint64_t v50 = *(void *)v113;
        do
        {
          for (uint64_t j = 0; j != v49; ++j)
          {
            if (*(void *)v113 != v50) {
              objc_enumerationMutation(v47);
            }
            float v52 = +[FRCFaceHandLegRectangle handRectangleWithObservation:*(void *)(*((void *)&v112 + 1) + 8 * j)];
            [v12 addObject:v52];
          }
          uint64_t v49 = [v47 countByEnumeratingWithState:&v112 objects:v130 count:16];
        }
        while (v49);
      }
    }
    float v53 = [v94 results];
    uint64_t v54 = [v53 count];

    if (v54)
    {
      v84 = self;
      float v55 = objc_alloc_init(FRCBodyBoundingBoxDetector);
      v56 = [v94 results];
      long long v108 = 0u;
      long long v109 = 0u;
      long long v110 = 0u;
      long long v111 = 0u;
      uint64_t v57 = [v56 countByEnumeratingWithState:&v108 objects:v129 count:16];
      if (v57)
      {
        uint64_t v59 = v57;
        uint64_t v60 = *(void *)v109;
        do
        {
          for (uint64_t k = 0; k != v59; ++k)
          {
            if (*(void *)v109 != v60) {
              objc_enumerationMutation(v56);
            }
            *(float *)&double v58 = (float)v88 / (float)v87;
            float v62 = -[FRCBodyBoundingBoxDetector createBodyRectanglesWithObservation:frameAspectRatio:](v55, "createBodyRectanglesWithObservation:frameAspectRatio:", *(void *)(*((void *)&v108 + 1) + 8 * k), v58, v84);
            long long v104 = 0u;
            long long v105 = 0u;
            long long v106 = 0u;
            long long v107 = 0u;
            uint64_t v63 = [v62 countByEnumeratingWithState:&v104 objects:v128 count:16];
            if (v63)
            {
              uint64_t v64 = v63;
              uint64_t v65 = *(void *)v105;
              do
              {
                for (uint64_t m = 0; m != v64; ++m)
                {
                  if (*(void *)v105 != v65) {
                    objc_enumerationMutation(v62);
                  }
                  [v12 addObject:*(void *)(*((void *)&v104 + 1) + 8 * m)];
                }
                uint64_t v64 = [v62 countByEnumeratingWithState:&v104 objects:v128 count:16];
              }
              while (v64);
            }
          }
          uint64_t v59 = [v56 countByEnumeratingWithState:&v108 objects:v129 count:16];
        }
        while (v59);
      }

      self = v84;
      id v16 = v85;
      float v10 = v86;
    }
    unint64_t v67 = objc_msgSend(v93, "results", v84);
    uint64_t v68 = [v67 count];

    if (v68)
    {
      unint64_t v69 = [v93 results];
      long long v100 = 0u;
      long long v101 = 0u;
      long long v102 = 0u;
      long long v103 = 0u;
      uint64_t v70 = [v69 countByEnumeratingWithState:&v100 objects:v127 count:16];
      if (v70)
      {
        uint64_t v71 = v70;
        uint64_t v72 = *(void *)v101;
        do
        {
          for (uint64_t n = 0; n != v71; ++n)
          {
            if (*(void *)v101 != v72) {
              objc_enumerationMutation(v69);
            }
            [*(id *)(*((void *)&v100 + 1) + 8 * n) boundingBox];
            unint64_t v74 = +[FRCFaceHandLegRectangle humanRectangleWithBoundingBox:](FRCFaceHandLegRectangle, "humanRectangleWithBoundingBox:");
            [v12 addObject:v74];
          }
          uint64_t v71 = [v69 countByEnumeratingWithState:&v100 objects:v127 count:16];
        }
        while (v71);
      }
    }
    unint64_t v75 = [v92 results];
    uint64_t v76 = [v75 count];

    if (v76)
    {
      unint64_t v77 = [v92 results];
      long long v96 = 0u;
      long long v97 = 0u;
      long long v98 = 0u;
      long long v99 = 0u;
      uint64_t v78 = [v77 countByEnumeratingWithState:&v96 objects:v126 count:16];
      if (v78)
      {
        uint64_t v79 = v78;
        uint64_t v80 = *(void *)v97;
        do
        {
          for (iuint64_t i = 0; ii != v79; ++ii)
          {
            if (*(void *)v97 != v80) {
              objc_enumerationMutation(v77);
            }
            [*(id *)(*((void *)&v96 + 1) + 8 * ii) boundingBox];
            v82 = +[FRCFaceHandLegRectangle animalFaceRectangleWithBoundingBox:](FRCFaceHandLegRectangle, "animalFaceRectangleWithBoundingBox:");
            [v12 addObject:v82];
          }
          uint64_t v79 = [v77 countByEnumeratingWithState:&v96 objects:v126 count:16];
        }
        while (v79);
      }
    }
  }

  [(OpticalFlowAnalyzer *)self printFaceHandLegRectangles:v12];
  return v12;
}

- (void)printFaceHandLegRectangles:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  NSLog(&cfstr_FlowanalysisFa.isa, [v3 count]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    int v7 = 0;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v4);
        }
        float v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        [v10 boundingBox];
        printf("\tCount %d\tCategory %lu\t(%.3f,%.3f)\t%.3f x %.3f\n", v7 + i, [v10 category], v11, v12, v13, v14);
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      v7 += i;
    }
    while (v6);
  }

  fflush((FILE *)*MEMORY[0x1E4F143D8]);
}

- ($E2C29196C7A5C696474C6955C5A9CE06)safeThresholdWithtimeGap:(id *)a3 isDownsampled:(BOOL)a4
{
  BOOL v4 = a4;
  CMTime v30 = *(CMTime *)a3;
  float v6 = CMTimeGetSeconds(&v30) * 1000.0;
  unint64_t useCase = self->_useCase;
  if (useCase == 1)
  {
    float v18 = (float)(v6 + -66.0) / 40.0;
    if (v18 > 11.0) {
      float v18 = 11.0;
    }
    float v19 = fmaxf(v18, 9.0);
    float v20 = (float)((float)(v6 + -117.0) * 3.0) / 100.0;
    if (v20 > 8.0) {
      float v20 = 8.0;
    }
    float v21 = fmaxf(v20, 0.0);
    if (v6 < 426.0) {
      float v22 = v21;
    }
    else {
      float v22 = v19;
    }
    id v23 = &OBJC_IVAR___OpticalFlowAnalyzer_jsonConsistencySafeThresholdsForNonDownsampledSloMo;
    if (v4) {
      id v23 = &OBJC_IVAR___OpticalFlowAnalyzer_jsonConsistencySafeThresholdsForDownsampledSloMo;
    }
    float v17 = *(float *)((char *)&self->super.super.isa + 4 * (int)v22 + *v23);
    float v9 = fminf(self->jsonConsistencyFrameScoreThresholdOnDemand, v17);
    goto LABEL_30;
  }
  if (useCase)
  {
    float v24 = (float)(v6 + -66.0) / 40.0;
    if (v24 > 11.0) {
      float v24 = 11.0;
    }
    float v25 = fmaxf(v24, 9.0);
    float v26 = 8.0;
    if ((float)((float)((float)(v6 + -117.0) * 3.0) / 100.0) <= 8.0) {
      float v26 = (float)((float)(v6 + -117.0) * 3.0) / 100.0;
    }
    float v9 = 0.0;
    float v27 = fmaxf(v26, 0.0);
    if (v6 < 426.0) {
      float v28 = v27;
    }
    else {
      float v28 = v25;
    }
    uint64_t v29 = &OBJC_IVAR___OpticalFlowAnalyzer_jsonConsistencySafeThresholdsForNonDownsampledSloMo;
    if (v4) {
      uint64_t v29 = &OBJC_IVAR___OpticalFlowAnalyzer_jsonConsistencySafeThresholdsForDownsampledSloMo;
    }
    float v17 = *(float *)((char *)&self->super.super.isa + 4 * (int)v28 + *v29);
LABEL_30:
    float v16 = v17;
    goto LABEL_31;
  }
  float v8 = (float)((float)(v6 + -50.0) * 3.0) / 100.0;
  if (v8 > 7.0) {
    float v8 = 7.0;
  }
  float v9 = 0.0;
  int v10 = (int)fmaxf(v8, 0.0);
  double v11 = &OBJC_IVAR___OpticalFlowAnalyzer_jsonConsistencySafeThresholdsForNonDownsampled;
  if (v4) {
    double v11 = &OBJC_IVAR___OpticalFlowAnalyzer_jsonConsistencySafeThresholdsForDownsampled;
  }
  double v12 = &OBJC_IVAR___OpticalFlowAnalyzer_jsonConsistencySafeThresholdsForDownsampledDelta;
  if (!v4) {
    double v12 = &OBJC_IVAR___OpticalFlowAnalyzer_jsonConsistencySafeThresholdsForNonDownsampledDelta;
  }
  float v13 = *(float *)((char *)&self->super.super.isa + 4 * v10 + *v11);
  float v14 = *(float *)((char *)&self->super.super.isa + 4 * v10 + *v12);
  float consistencySafeThresholdsScale = self->consistencySafeThresholdsScale;
  float v16 = v13
      + (float)((float)(consistencySafeThresholdsScale + self->consistencySafeThresholdsScaleForLargeRandomnessErr) * v14);
  float v17 = v13 + fmax(consistencySafeThresholdsScale, 0.0) * v14;
LABEL_31:
  result.var2 = v9;
  result.var1 = v17;
  result.float var0 = v16;
  return result;
}

- (void)isSafeToInterpolateForRandomnessGatingWithPrevFlowBackward:(__CVBuffer *)a3 flowForward:(__CVBuffer *)a4 lastFrameDuration:(id *)a5 lastNumberOfFrames:(unint64_t)a6 flowResFrame:(__CVBuffer *)a7
{
  float v13 = (void *)MEMORY[0x1E01A5320](self, a2);
  CMTime time1 = *(CMTime *)a5;
  [(OpticalFlowAnalyzer *)self analyzeFlowRandomnessWithPrevFlowBackward:a3 forward:a4 lastFrameDuration:&time1 lastNumberOfFrames:a6 flowResFrame:a7];
  float v15 = v14;
  float v17 = v16;
  float v19 = v18;
  if (v17 >= self->jsonRandomnessScoreThreshold) {
    goto LABEL_9;
  }
  float randomnessAreaScale = self->randomnessAreaScale;
  float jsonRandomnessAreaPercentageThresholdHigh = self->jsonRandomnessAreaPercentageThresholdHigh;
  float jsonRandomnessAreaPercentageThresholdLow = self->jsonRandomnessAreaPercentageThresholdLow;
  if ((float)(v19 * randomnessAreaScale) >= jsonRandomnessAreaPercentageThresholdHigh)
  {
    float v24 = jsonRandomnessAreaPercentageThresholdHigh - jsonRandomnessAreaPercentageThresholdLow;
LABEL_7:
    p_float consistentFlowRandomness = &self->_consistentFlowRandomness;
    float consistentFlowRandomness = self->_consistentFlowRandomness;
    goto LABEL_8;
  }
  if ((float)(v19 * randomnessAreaScale) >= jsonRandomnessAreaPercentageThresholdLow)
  {
    float v24 = -(float)(jsonRandomnessAreaPercentageThresholdLow - (float)(v19 * randomnessAreaScale));
    goto LABEL_7;
  }
  p_float consistentFlowRandomness = &self->_consistentFlowRandomness;
  float v24 = self->_consistentFlowRandomness;
  float consistentFlowRandomness = 0.0;
LABEL_8:
  float *p_consistentFlowRandomness = v24 + consistentFlowRandomness;
LABEL_9:
  if (v15 < self->jsonRandomnessErrThreshold
    || v19 < self->jsonRandomnessAreaPercentageThresholdLow
    || (time1 = (CMTime)*a5, time2 = (CMTime)self->_timeGap, v26 = CMTimeCompare(&time1, &time2), float v27 = 3.0, v26)
    && (unint64_t)(self->_motionHistogramsAnalysis.hasSpecialMotion - 3) <= 1)
  {
    BOOL v28 = 0;
    float v27 = 2.0;
    uint64_t v29 = "NO";
  }
  else
  {
    uint64_t v29 = "YES";
    BOOL v28 = 1;
  }
  self->_isLargeRandomnessErr = v28;
  float prevFlowRandomnessErr = self->_prevFlowRandomnessErr;
  if (prevFlowRandomnessErr != -1.0)
  {
    float v31 = fmaxf(prevFlowRandomnessErr, v15);
    float prevFlowRandomnessArea = self->_prevFlowRandomnessArea;
    float v33 = fmaxf(prevFlowRandomnessArea, v19);
    float v34 = fminf(prevFlowRandomnessArea, v19);
    if (v33 >= 10.0 && v33 > (float)(v34 * self->jsonConsistentRandomFlowResetAreaChangeRatio)) {
      self->_float consistentFlowRandomness = 0.0;
    }
    if (v31 > 1.0)
    {
      BOOL v35 = v33 >= 5.0;
      if (v33 > (float)(v34 * 20.0)) {
        BOOL v35 = 1;
      }
      if (v34 >= 1.0) {
        BOOL v35 = 0;
      }
      BOOL v36 = v33 >= 0.5 && v34 < 10.0;
      if (v36 && !v35)
      {
        float v37 = fminf(prevFlowRandomnessErr, v15);
        if (v31 <= (float)(v37 * self->randomnessErrorChangeRatioThreshold))
        {
          BOOL v40 = 0;
          self->_float signErrFlowRandomness = 0.0;
          if (v33 <= (float)(v34 * self->randomnessAreaChangeRatioThreshold))
          {
            self->_float signAreaFlowRandomness = 0.0;
            goto LABEL_54;
          }
        }
        else
        {
          float signErrFlowRandomness = self->_signErrFlowRandomness;
          BOOL v42 = v31 == v15;
          float v39 = -1.0;
          if (v42) {
            float v39 = 1.0;
          }
          BOOL v40 = signErrFlowRandomness != v39;
          self->_float signErrFlowRandomness = v39;
          if (v33 <= (float)(v34 * self->randomnessAreaChangeRatioThreshold))
          {
            self->_float signAreaFlowRandomness = 0.0;
            if (signErrFlowRandomness == v39) {
              goto LABEL_54;
            }
            goto LABEL_52;
          }
        }
        float signAreaFlowRandomness = self->_signAreaFlowRandomness;
        if (v33 == v19)
        {
          BOOL v42 = signAreaFlowRandomness == 1.0;
          float v43 = 1.0;
        }
        else
        {
          BOOL v42 = signAreaFlowRandomness == -1.0;
          float v43 = -1.0;
        }
        self->_float signAreaFlowRandomness = v43;
        char v44 = !v42 || v40;
        if (v42) {
          BOOL v40 = 0;
        }
        if (v44)
        {
          if (v33 > 10.0 && v40 && v37 > 1.0 && v34 > 2.0)
          {
            float v45 = self->_zigzagFlowRandomness + v27;
LABEL_53:
            self->_zigzagFlowRandomness = v45;
            goto LABEL_54;
          }
LABEL_52:
          float v45 = self->_zigzagFlowRandomness + 1.0;
          goto LABEL_53;
        }
      }
    }
  }
LABEL_54:
  float v46 = self->_consistentFlowRandomness;
  if (v17 < self->jsonRandomnessScoreThresholdLow)
  {
    float v46 = v46 + 10.0;
    self->_float consistentFlowRandomness = v46;
  }
  printf("[CrossFlowAnalysis] [Optical Flow Downsampling: %d, Consistent: %.3f, Zigzag: %.3f, isLargeRandomnessErr: %s]\n", self->_opticalFlowDownsampling, v46, self->_zigzagFlowRandomness, v29);
  if (self->_consistentFlowRandomness > self->jsonConsistentRandomFlowThreshold)
  {
    float v47 = @"[CrossFlowAnalysis] Interpolation is gated (randomness) - consistent";
LABEL_60:
    self->_safeToInterpolate.randomness = 0;
    NSLog(&v47->isa);
    goto LABEL_61;
  }
  if (self->_zigzagFlowRandomness > self->jsonZigzagRandomFlowThreshold)
  {
    float v47 = @"[CrossFlowAnalysis] Interpolation is gated (randomness) - zigzag";
    goto LABEL_60;
  }
LABEL_61:
  self->_float prevFlowRandomnessErr = v15;
  self->_float prevFlowRandomnessArea = v19;
}

- ($E2C29196C7A5C696474C6955C5A9CE06)analyzeFlowRandomnessWithPrevFlowBackward:(__CVBuffer *)a3 forward:(__CVBuffer *)a4 lastFrameDuration:(id *)a5 lastNumberOfFrames:(unint64_t)a6 flowResFrame:(__CVBuffer *)a7
{
  double v12 = createTexturesFromCVPixelBuffer(a3, self->super._device, 1, 2uLL);
  float v13 = createTexturesFromCVPixelBuffer(a4, self->super._device, 1, 2uLL);
  float v14 = createRGBATextureFromCVPixelBuffer(a7, self->super._device);
  id v15 = (id) [(MTLDevice *)self->super._device newBufferWithLength:8 options:0];
  float v16 = (float *)[v15 contents];
  int64_t value = self->_timeGap.value;
  float v18 = fmin((double)a5->var0, (double)value) / (fmin((double)a6, (double)self->_framesToInterpolate) + 1.0);
  float v19 = v18 + v18;
  *float v16 = v19 / (float)a5->var0;
  v16[1] = v19 / (float)value;
  [(OpticalFlowAnalyzer *)self calcCrossFlowStatisticsPrevBackwardFlowTexture:v12 forwardFlowTexture:v13 frameTexture:v14 flowScaleBuffer:v15];
  float v21 = v20;
  float v23 = v22;
  float v25 = v24;
  printf("[CrossFlowAnalysis] lastFrameDuration: %lld, currentFrameDuration: %lld, lastFramesToInterpolate: %ld, framesToInterpolate: %ld, Error: %.3f, Score: %.3f, Area: %.3f\n", a5->var0, self->_timeGap.value, a6, self->_framesToInterpolate, v20, v22, v24);

  float v26 = v21;
  float v27 = v23;
  float v28 = v25;
  result.var2 = v28;
  result.var1 = v27;
  result.float var0 = v26;
  return result;
}

- ($E2C29196C7A5C696474C6955C5A9CE06)calcCrossFlowStatisticsPrevBackwardFlowTexture:(id)a3 forwardFlowTexture:(id)a4 frameTexture:(id)a5 flowScaleBuffer:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  unint64_t v14 = (unint64_t)([v12 width] + 7) >> 3;
  unint64_t v15 = (unint64_t)([v12 height] + 7) >> 3;
  float v16 = (void *)[(MTLDevice *)self->super._device newBufferWithLength:4 * v14 * v15 options:0];
  float v17 = [(MTLCommandQueue *)self->super._commandQueue commandBuffer];
  float v18 = [v17 computeCommandEncoder];
  [v18 setComputePipelineState:self->_crossFlowStatisticsKernel];
  [v18 setTexture:v13 atIndex:0];

  [v18 setTexture:v12 atIndex:1];
  [v18 setTexture:v11 atIndex:2];

  [v18 setBuffer:v10 offset:0 atIndex:0];
  [v18 setBuffer:v16 offset:0 atIndex:1];
  v31[0] = v14;
  v31[1] = v15;
  v31[2] = 1;
  int64x2_t v29 = vdupq_n_s64(8uLL);
  uint64_t v30 = 1;
  [v18 dispatchThreadgroups:v31 threadsPerThreadgroup:&v29];
  [v18 endEncoding];
  [v17 commit];
  [v17 waitUntilCompleted];
  id v19 = v16;
  -[OpticalFlowAnalyzer processGPUOutputsRandomness:blockWidth:blockHeight:](self, "processGPUOutputsRandomness:blockWidth:blockHeight:", [v19 contents], v14, v15);
  float v21 = v20;
  float v23 = v22;
  float v25 = v24;

  float v26 = v21;
  float v27 = v23;
  float v28 = v25;
  result.var2 = v28;
  result.var1 = v27;
  result.float var0 = v26;
  return result;
}

- ($E2C29196C7A5C696474C6955C5A9CE06)processGPUOutputsRandomness:(id *)a3 blockWidth:(unint64_t)a4 blockHeight:(unint64_t)a5
{
  if (a5)
  {
    uint64_t v9 = 0;
    unint64_t v10 = 0;
    uint64_t v18 = 4 * (int)a4;
    float v11 = 0.0;
    float v12 = 0.0;
    do
    {
      if (a4)
      {
        uint64_t v13 = 0;
        do
        {
          v19.double x = (double)(int)v13;
          v19.double y = (double)(int)v9;
          if (CGRectContainsPoint(self->_cleanRectFlow8x8, v19))
          {
            ++v10;
            float var0 = a3[v13].var0;
            float v11 = v11 + var0;
            if (var0 > (float)(self->jsonRandomnessAreaThreshold * 64.0)) {
              float v12 = v12 + 1.0;
            }
          }
          ++v13;
        }
        while (a4 != v13);
      }
      ++v9;
      a3 = ($3BA783FF50B239963188BE194EBFFEBA *)((char *)a3 + v18);
    }
    while (v9 != a5);
  }
  else
  {
    unint64_t v10 = 0;
    float v12 = 0.0;
    float v11 = 0.0;
  }
  float v15 = log10(100.0 / (float)(v11 / (float)(v10 << 6))) * 10.0;
  float v16 = (float)(v12 * 100.0) / (float)v10;
  float v17 = v11 / (float)(v10 << 6);
  result.var2 = v16;
  result.var1 = v15;
  result.float var0 = v17;
  return result;
}

- (void)modulateGatingParametersWithFlowForward:(__CVBuffer *)a3 flowResFrame:(__CVBuffer *)a4
{
  float v6 = createTexturesFromCVPixelBuffer(a3, self->super._device, 1, 2uLL);
  createRGBATextureFromCVPixelBuffer(a4, self->super._device);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [(OpticalFlowAnalyzer *)self calcMotionHistogramForwardFlowTexture:v6 frameTexture:v8];
  uint64_t v7 = [v6 width];
  self->_size = [v6 height] * v7;
  [(OpticalFlowAnalyzer *)self analyzeMotionHistograms];
  [(OpticalFlowAnalyzer *)self analyzeDeformation];
  [(OpticalFlowAnalyzer *)self modulateGatingParametersFromMotionHistogramsAnalysis];
  fflush((FILE *)*MEMORY[0x1E4F143D8]);
}

- (void)calcMotionHistogramForwardFlowTexture:(id)a3 frameTexture:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = (unint64_t)([v7 width] + 7) >> 3;
  unint64_t v9 = (unint64_t)([v7 height] + 7) >> 3;
  unint64_t v10 = (void *)[(MTLDevice *)self->super._device newBufferWithLength:(v8 * v9) << 6 options:0];
  float v11 = (void *)[(MTLDevice *)self->super._device newBufferWithLength:(v8 * v9) << 6 options:0];
  float v12 = [(MTLCommandQueue *)self->super._commandQueue commandBuffer];
  uint64_t v13 = [v12 computeCommandEncoder];
  [v13 setComputePipelineState:self->_motionHistogramsKernel];
  [v13 setTexture:v7 atIndex:0];

  [v13 setTexture:v6 atIndex:1];
  [v13 setBuffer:v10 offset:0 atIndex:0];
  [v13 setBuffer:v11 offset:0 atIndex:1];
  v20[0] = v8;
  v20[1] = v9;
  v20[2] = 1;
  int64x2_t v18 = vdupq_n_s64(8uLL);
  uint64_t v19 = 1;
  [v13 dispatchThreadgroups:v20 threadsPerThreadgroup:&v18];
  [v13 endEncoding];
  [v12 commit];
  [v12 waitUntilCompleted];
  id v17 = v10;
  uint64_t v14 = [v17 contents];
  id v15 = v11;
  uint64_t v16 = [v15 contents];
  [(OpticalFlowAnalyzer *)self processGPUOutputsHistograms:v14 blockWidth:v8 blockHeight:v9];
  [(OpticalFlowAnalyzer *)self processGPUOutputsHistogramsForDeformation:v16 blockWidth:v8 blockHeight:v9];
  printf("[MotionHistograms] magnitude: [%d, %d, %d, %d, %d, %d, %d, %d] direction: [%d, %d, %d, %d, %d, %d, %d, %d] direction_top_left: [%d, %d, %d, %d] direction_top_right: [%d, %d, %d, %d] direction_bottom_left: [%d, %d, %d, %d] direction_bottom_right: [%d, %d, %d, %d]\n", self->_motionHistograms.frameMagnitude[0], self->_motionHistograms.frameMagnitude[1], self->_motionHistograms.frameMagnitude[2], self->_motionHistograms.frameMagnitude[3], self->_motionHistograms.frameMagnitude[4], self->_motionHistograms.frameMagnitude[5], self->_motionHistograms.frameMagnitude[6], self->_motionHistograms.frameMagnitude[7], self->_motionHistograms.frameDirection[0], self->_motionHistograms.frameDirection[1], self->_motionHistograms.frameDirection[2], self->_motionHistograms.frameDirection[3], self->_motionHistograms.frameDirection[4], self->_motionHistograms.frameDirection[5], self->_motionHistograms.frameDirection[6], self->_motionHistograms.frameDirection[7],
    self->_motionHistograms.topLeftDirection[0],
    self->_motionHistograms.topLeftDirection[1],
    self->_motionHistograms.topLeftDirection[2],
    self->_motionHistograms.topLeftDirection[3],
    self->_motionHistograms.topRightDirection[0],
    self->_motionHistograms.topRightDirection[1],
    self->_motionHistograms.topRightDirection[2],
    self->_motionHistograms.topRightDirection[3],
    self->_motionHistograms.bottomLeftDirection[0],
    self->_motionHistograms.bottomLeftDirection[1],
    self->_motionHistograms.bottomLeftDirection[2],
    self->_motionHistograms.bottomLeftDirection[3],
    self->_motionHistograms.bottomRightDirection[0],
    self->_motionHistograms.bottomRightDirection[1],
    self->_motionHistograms.bottomRightDirection[2],
    self->_motionHistograms.bottomRightDirection[3]);
}

- (unsigned)averageMagnitude:(unsigned int *)a3
{
  unint64_t v3 = 0;
  int32x4_t v4 = 0uLL;
  int32x4_t v5 = 0uLL;
  do
  {
    int32x4_t v6 = *(int32x4_t *)&a3[v3 / 4];
    int32x4_t v4 = vmlaq_s32(v4, (int32x4_t)xmmword_1DC85A338[v3 / 0x10], v6);
    int32x4_t v5 = vaddq_s32(v6, v5);
    v3 += 16;
  }
  while (v3 != 32);
  return vaddvq_s32(v4) / vaddvq_s32(v5);
}

- (void)convertOctantDirectionHistogram:(int *)a3 toPerpendicularQuadrantHistogram:(unsigned int *)a4
{
  for (uint64_t i = 0; i != 8; *a4++ += a3[i & 6] + v5)
  {
    int v5 = a3[i + 1];
    i += 2;
  }
}

- (void)processGPUOutputsHistograms:(id *)a3 blockWidth:(unint64_t)a4 blockHeight:(unint64_t)a5
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v52 = 0uLL;
  long long v51 = 0uLL;
  memset(v50, 0, sizeof(v50));
  memset(v49, 0, sizeof(v49));
  long long v48 = 0uLL;
  long long v47 = 0uLL;
  memset(v46, 0, sizeof(v46));
  int32x4_t v34 = 0u;
  int32x4_t v29 = 0u;
  int32x4_t v26 = 0u;
  memset(v45, 0, sizeof(v45));
  int32x4_t v37 = 0u;
  if (a5)
  {
    unint64_t v5 = a4;
    unint64_t v6 = 0;
    unint64_t v36 = a5 / 5uLL;
    unint64_t v35 = a4 / 5uLL;
    unint64_t v40 = a5 >> 1;
    unint64_t v38 = a4 >> 1;
    unint64_t v32 = a5 - v36;
    unint64_t v33 = a4 - v35;
    uint64_t v25 = (int)a4;
    uint64_t v27 = (uint64_t)(int)a4 << 6;
    int32x4_t v37 = 0uLL;
    id v7 = a3;
    int32x4_t v34 = 0uLL;
    int32x4_t v29 = 0uLL;
    int32x4_t v26 = 0uLL;
    do
    {
      unint64_t v43 = v6;
      float v31 = v7;
      if (v5)
      {
        unint64_t v8 = 0;
        double v9 = (double)(int)v6;
        unint64_t v42 = v6 * v25;
        BOOL v30 = v40 <= v6;
        do
        {
          v58.double x = (double)(int)v8;
          v58.double y = v9;
          if (CGRectContainsPoint(self->_cleanRectFlow8x8, v58))
          {
            uint64_t v10 = 0;
            unint64_t v11 = v8 + v42;
            do
            {
              *(long long *)((char *)&v55 + v10 * 4) = (__int128)vaddq_s32(*(int32x4_t *)((char *)&v55 + v10 * 4), *(int32x4_t *)&v7->var0[v10]);
              v10 += 4;
            }
            while (v10 != 8);
            if (a3[v8 + v42].var0[0] <= 57)
            {
              for (uint64_t i = 0; i != 8; i += 4)
                *(long long *)((char *)&v53 + i * 4) = (__int128)vaddq_s32(*(int32x4_t *)((char *)&v53 + i * 4), *(int32x4_t *)&v7->var1[i]);
              if (v40 <= v43 || v38 <= v8)
              {
                if (v40 <= v43 || v38 > v8)
                {
                  char v15 = !v30;
                  if (v38 <= v8) {
                    char v15 = 1;
                  }
                  if (v15)
                  {
                    if (v40 <= v43 && v38 <= v8)
                    {
                      var1 = a3[v11].var1;
                      float32x4x2_t v62 = vld2q_f32((const float *)var1);
                      int32x4_t v26 = vaddq_s32(vaddq_s32((int32x4_t)v62.val[1], (int32x4_t)v62.val[0]), v26);
                    }
                  }
                  else
                  {
                    uint64_t v16 = a3[v11].var1;
                    float32x4x2_t v61 = vld2q_f32((const float *)v16);
                    int32x4_t v29 = vaddq_s32(vaddq_s32((int32x4_t)v61.val[1], (int32x4_t)v61.val[0]), v29);
                  }
                }
                else
                {
                  uint64_t v14 = a3[v11].var1;
                  float32x4x2_t v60 = vld2q_f32((const float *)v14);
                  int32x4_t v34 = vaddq_s32(vaddq_s32((int32x4_t)v60.val[1], (int32x4_t)v60.val[0]), v34);
                }
              }
              else
              {
                uint64_t v13 = a3[v11].var1;
                float32x4x2_t v59 = vld2q_f32((const float *)v13);
                int32x4_t v37 = vaddq_s32(vaddq_s32((int32x4_t)v59.val[1], (int32x4_t)v59.val[0]), v37);
              }
              if (v8 >= v35)
              {
                if (v33 < v8)
                {
                  [(OpticalFlowAnalyzer *)self convertOctantDirectionHistogram:a3[v11].var1 toPerpendicularQuadrantHistogram:&v51];
                  for (unint64_t j = 0; j != 8; j += 4)
                    v49[j / 4] = vaddq_s32((int32x4_t)v49[j / 4], *(int32x4_t *)&v7->var0[j]);
                }
              }
              else
              {
                [(OpticalFlowAnalyzer *)self convertOctantDirectionHistogram:a3[v11].var1 toPerpendicularQuadrantHistogram:&v52];
                for (unint64_t k = 0; k != 8; k += 4)
                  v50[k / 4] = vaddq_s32((int32x4_t)v50[k / 4], *(int32x4_t *)&v7->var0[k]);
              }
              if (v43 >= v36)
              {
                if (v32 < v43)
                {
                  [(OpticalFlowAnalyzer *)self convertOctantDirectionHistogram:a3[v11].var1 toPerpendicularQuadrantHistogram:&v47];
                  for (unint64_t m = 0; m != 8; m += 4)
                    v45[m / 4] = vaddq_s32((int32x4_t)v45[m / 4], *(int32x4_t *)&v7->var0[m]);
                }
              }
              else
              {
                [(OpticalFlowAnalyzer *)self convertOctantDirectionHistogram:a3[v11].var1 toPerpendicularQuadrantHistogram:&v48];
                for (unint64_t n = 0; n != 8; n += 4)
                  v46[n / 4] = vaddq_s32((int32x4_t)v46[n / 4], *(int32x4_t *)&v7->var0[n]);
              }
            }
            unint64_t v5 = a4;
          }
          ++v8;
          ++v7;
        }
        while (v8 != v5);
      }
      unint64_t v6 = v43 + 1;
      id v7 = ($D94FD548DE103586A417D0DA94597CA6 *)((char *)v31 + v27);
    }
    while (v43 + 1 != a5);
  }
  *(void *)&long long v22 = -1;
  *((void *)&v22 + 1) = -1;
  *(_OWORD *)self->_motionHistograms.frameDirectiounint64_t n = v22;
  *(_OWORD *)&self->_motionHistograms.frameDirection[4] = v22;
  *(_OWORD *)self->_motionHistograms.topLeftDirectiounint64_t n = v22;
  *(_OWORD *)self->_motionHistograms.topRightDirectiounint64_t n = v22;
  *(_OWORD *)self->_motionHistograms.bottomLeftDirectiounint64_t n = v22;
  *(_OWORD *)self->_motionHistograms.bottomRightDirectiounint64_t n = v22;
  *(_OWORD *)&self->_motionHistograms.numLowMotionOppositeDirectionBlocks = v22;
  *(_OWORD *)&self->_motionHistograms.leftSideDirection[2] = v22;
  *(_OWORD *)&self->_motionHistograms.rightSideDirection[2] = v22;
  *(_OWORD *)self->_motionHistograms.topSideDirectiounint64_t n = v22;
  *(void *)&self->_motionHistograms.topSideAverageMagnitude = -1;
  long long v23 = v56;
  *(_OWORD *)self->_motionHistograms.frameMagnitude = v55;
  *(_OWORD *)&self->_motionHistograms.frameMagnitude[4] = v23;
  long long v24 = v54;
  *(_OWORD *)self->_motionHistograms.frameDirectiounint64_t n = v53;
  *(_OWORD *)&self->_motionHistograms.frameDirection[4] = v24;
  *(int32x4_t *)self->_motionHistograms.topLeftDirectiounint64_t n = v37;
  *(int32x4_t *)self->_motionHistograms.topRightDirectiounint64_t n = v34;
  *(int32x4_t *)self->_motionHistograms.bottomLeftDirectiounint64_t n = v29;
  *(int32x4_t *)self->_motionHistograms.bottomRightDirectiounint64_t n = v26;
  *(_OWORD *)self->_motionHistograms.leftSideDirectiounint64_t n = v52;
  *(_OWORD *)self->_motionHistograms.rightSideDirectiounint64_t n = v51;
  *(_OWORD *)self->_motionHistograms.topSideDirectiounint64_t n = v48;
  *(_OWORD *)self->_motionHistograms.bottomSideDirectiounint64_t n = v22;
  *(_OWORD *)self->_motionHistograms.bottomSideDirectiounint64_t n = v47;
  self->_motionHistograms.leftSideAverageMagnitude = -[OpticalFlowAnalyzer averageMagnitude:](self, "averageMagnitude:", v50, a4);
  self->_motionHistograms.rightSideAverageMagnitude = [(OpticalFlowAnalyzer *)self averageMagnitude:v49];
  self->_motionHistograms.topSideAverageMagnitude = [(OpticalFlowAnalyzer *)self averageMagnitude:v46];
  self->_motionHistograms.bottomSideAverageMagnitude = [(OpticalFlowAnalyzer *)self averageMagnitude:v45];
}

- (void)processGPUOutputsHistogramsForDeformation:(id *)a3 blockWidth:(unint64_t)a4 blockHeight:(unint64_t)a5
{
  double v9 = (int *)malloc_type_calloc(4uLL, 4uLL, 0x100004052888210uLL);
  self->_deformationBlockRanges = v9;
  *double v9 = a4;
  v9[1] = -1;
  v9[2] = a5;
  v9[3] = -1;
  if (self->_visualizationEnabled) {
    self->_deformationBinaryMap = (char *)malloc_type_calloc(a5 * a4, 1uLL, 0x100004077774924uLL);
  }
  uint64_t v10 = (char *)malloc_type_calloc(a5 * a4, 1uLL, 0x100004077774924uLL);
  uint64_t v11 = (int)a4;
  char v44 = v10;
  if (a5)
  {
    unint64_t v12 = 0;
    unint64_t v46 = a5 - 5;
    uint64_t v13 = &a3->var1[7];
    uint64_t v14 = v10;
    unint64_t v49 = a5;
    do
    {
      uint64_t v15 = v11;
      if (a4)
      {
        unint64_t v16 = 0;
        id v17 = v13;
        do
        {
          v51.double x = (double)(int)v16;
          v51.double y = (double)(int)v12;
          if (CGRectContainsPoint(self->_cleanRectFlow8x8, v51)
            && *(v17 - 15) >= 58
            && (self->_useCase || v16 >= 5 && v46 > v12 && v12 >= 5 && a4 - 5 > v16))
          {
            int v19 = *(v17 - 7);
            int v18 = *(v17 - 6);
            int v21 = *(v17 - 5);
            int v20 = *(v17 - 4);
            int v22 = v18 + v19 + v21;
            int v23 = *(v17 - 3);
            if (v22 + v20 + v23)
            {
              int v24 = *(v17 - 2);
              if (v21 + v18 + v20 + v23 + v24)
              {
                int v25 = *(v17 - 1);
                if (v20 + v21 + v23 + v24 + v25)
                {
                  int v26 = *v17;
                  if (v23 + v20 + v24 + v25 + *v17)
                  {
                    if (v24 + v23 + v25 + v26 + v19
                      && v24 + v19 + v25 + v26 + v18
                      && v18 + v19 + v25 + v26 + v21
                      && v22 + v26 + v20)
                    {
                      v14[v16] = 1;
                    }
                  }
                }
              }
            }
          }
          ++v16;
          v17 += 16;
        }
        while (a4 != v16);
      }
      ++v12;
      uint64_t v11 = v15;
      v14 += v15;
      v13 += 16 * (uint64_t)(int)a4;
    }
    while (v12 != v49);
    uint64_t v48 = v49 - 1;
    if (v49 - 1 < 2)
    {
      unsigned int v50 = 0;
      goto LABEL_46;
    }
  }
  else
  {
    uint64_t v48 = -1;
  }
  unsigned int v50 = 0;
  unint64_t v45 = a4 - 1;
  uint64_t v47 = v11;
  unint64_t v27 = a4 - 2;
  float v28 = &v44[v11 - a4];
  int32x4_t v29 = &v44[a4 + (int)a4];
  uint64_t v30 = 1;
  uint64_t v31 = v11;
  unint64_t v32 = &v44[(int)a4];
  do
  {
    if (v45 >= 2)
    {
      uint64_t v33 = 0;
      do
      {
        uint64_t v34 = v33 + 1;
        v52.double x = (double)((int)v33 + 1);
        v52.double y = (double)(int)v30;
        if (CGRectContainsPoint(self->_cleanRectFlow8x8, v52)
          && v32[v33 + 1]
          && v28[v33 + 1]
           + v28[v33]
           + v28[v33 + 2]
           + v32[v33]
           + v32[v33 + 2]
           + v29[v33]
           + v29[v33 + 1]
           + v29[v33 + 2] >= 3)
        {
          deformationBlockRanges = self->_deformationBlockRanges;
          if (v34 < *deformationBlockRanges) {
            int *deformationBlockRanges = v34;
          }
          if (v34 > deformationBlockRanges[1]) {
            deformationBlockRanges[1] = v34;
          }
          if (v30 < deformationBlockRanges[2]) {
            deformationBlockRanges[2] = v30;
          }
          if (v30 > deformationBlockRanges[3]) {
            deformationBlockRanges[3] = v30;
          }
          ++v50;
          if (self->_visualizationEnabled) {
            self->_deformationBinaryMap[v31 + 1 + v33] = -1;
          }
        }
        ++v33;
      }
      while (v27 != v34);
    }
    ++v30;
    v32 += v47;
    v28 += v47;
    v31 += v47;
    v29 += v47;
  }
  while (v30 != v48);
LABEL_46:
  free(v44);
  self->_motionHistograms.numLowMotionOppositeDirectionBlocks = v50;
  unint64_t v36 = self->_deformationBlockRanges;
  int v37 = v36[1];
  int v38 = v37 - *v36;
  if (v37 < *v36 || (v40 = v36[2], int v39 = v36[3], v41 = __OFSUB__(v39, v40), v42 = v39 - v40, (v42 < 0) ^ v41)) {
    unsigned int v43 = 0;
  }
  else {
    unsigned int v43 = v38 + 1 + (v38 + 1) * v42;
  }
  self->_motionHistograms.areaLowMotionOppositeDirectionBlocks = v43;
}

- (void)analyzeMotionHistograms
{
  p_motionHistogramsAnalysis = &self->_motionHistogramsAnalysis;
  *(void *)&long long v4 = -1;
  *((void *)&v4 + 1) = -1;
  *(_OWORD *)&self->_motionHistogramsAnalysis.hasStaticBackground = v4;
  *(_OWORD *)&self->_motionHistogramsAnalysis.hasSpecialMotiounint64_t n = v4;
  self->_motionHistogramsAnalysis.hasStaticBackground = [(OpticalFlowAnalyzer *)self detectStaticBackground];
  [(OpticalFlowAnalyzer *)self detectDominantDirection];
  p_motionHistogramsAnalysis->hasSpecialMotiounint64_t n = [(OpticalFlowAnalyzer *)self detectSpecialMotion];
  p_motionHistogramsAnalysis->hasCameraRotaiounint64_t n = [(OpticalFlowAnalyzer *)self detectCameraRotation];
  printf("[MotionHistograms] has_static_background: %d, dominant_direction: %d, relative_dominant_direction: %d, has_special_motion: %ld\n", p_motionHistogramsAnalysis->hasStaticBackground, p_motionHistogramsAnalysis->dominantDirection, p_motionHistogramsAnalysis->relativeDominantDirection, p_motionHistogramsAnalysis->hasSpecialMotion);
}

- (BOOL)detectStaticBackground
{
  return self->_motionHistograms.frameMagnitude[0] > 2
                                                   * (vaddvq_s32(*(int32x4_t *)&self->_motionHistograms.frameMagnitude[1])
                                                    + self->_motionHistograms.frameMagnitude[5]
                                                    + self->_motionHistograms.frameMagnitude[6]
                                                    + self->_motionHistograms.frameMagnitude[7]);
}

- (void)detectDominantDirection
{
  uint64_t v2 = 0;
  int v3 = 0;
  unsigned int v4 = 0;
  unsigned int v5 = 0;
  unsigned int v6 = 0;
  int v7 = -1;
  int v8 = -1;
  int v9 = -1;
  do
  {
    unsigned int v10 = self->_motionHistograms.frameDirection[v2];
    if (v10 > v6) {
      unsigned int v6 = self->_motionHistograms.frameDirection[v2];
    }
    if (v10 <= v5)
    {
      unsigned int v11 = v5;
    }
    else
    {
      int v7 = v2;
      unsigned int v6 = v5;
      unsigned int v11 = self->_motionHistograms.frameDirection[v2];
    }
    if (v10 > v4) {
      int v12 = v2;
    }
    else {
      int v12 = v8;
    }
    if (v10 <= v4)
    {
      unsigned int v13 = v4;
    }
    else
    {
      int v7 = v8;
      unsigned int v6 = v5;
      unsigned int v11 = v4;
      unsigned int v13 = self->_motionHistograms.frameDirection[v2];
    }
    if (v10 <= v3)
    {
      int v8 = v12;
    }
    else
    {
      int v7 = v8;
      int v8 = v9;
    }
    if (v10 <= v3)
    {
      unsigned int v5 = v11;
    }
    else
    {
      int v9 = v2;
      unsigned int v6 = v5;
      unsigned int v5 = v4;
    }
    if (v10 > v3) {
      unsigned int v4 = v3;
    }
    else {
      unsigned int v4 = v13;
    }
    if (v10 > v3) {
      int v3 = self->_motionHistograms.frameDirection[v2];
    }
    ++v2;
  }
  while (v2 != 8);
  if ((v9 & 0x80000000) == 0)
  {
    float size = (float)self->_size;
    float v15 = size / self->jsonHistogramsAnalysisSmallObjectSizeThreshold;
    float v16 = size / self->jsonHistogramsAnalysisLargeObjectSizeThreshold;
    if (v3 > (int)(3 * v4))
    {
      float v17 = (float)v3;
      if (v15 < (float)v3) {
        goto LABEL_61;
      }
    }
    if ((v8 & 0x80000000) == 0)
    {
      int v18 = v9 - v8 >= 0 ? v9 - v8 : v8 - v9;
      int v19 = v3 + v4;
      BOOL v20 = v18 == 1 || v18 == 7;
      BOOL v21 = v20;
      if (v3 > (int)(3 * v5) && (v18 == 7 || v18 == 1))
      {
        float v17 = (float)v19;
        if (v15 < (float)v19) {
          goto LABEL_61;
        }
      }
      if ((v7 & 0x80000000) == 0 && v3 > (int)(3 * v6))
      {
        int v22 = v9 - v7;
        if (v9 - v7 < 0) {
          int v22 = v7 - v9;
        }
        if (v22 == 1 || v22 == 7) {
          int v24 = v21 + 1;
        }
        else {
          int v24 = v21;
        }
        int v25 = v8 - v7;
        if (v25 < 0) {
          int v25 = -v25;
        }
        if (v25 == 1 || v25 == 7) {
          ++v24;
        }
        if (v24 == 2)
        {
          float v17 = (float)(int)(v19 + v5);
          if (v15 < v17)
          {
LABEL_61:
            self->_motionHistogramsAnalysis.relativeDominantDirectiounint64_t n = v9;
            if (v16 < v17) {
              self->_motionHistogramsAnalysis.dominantDirectiounint64_t n = v9;
            }
          }
        }
      }
    }
  }
}

- (int64_t)detectSpecialMotion
{
  p_motionHistograms = &self->_motionHistograms;
  int v4 = [(OpticalFlowAnalyzer *)self detectDominantDirectionInROI:self->_motionHistograms.topLeftDirection];
  int v5 = [(OpticalFlowAnalyzer *)self detectDominantDirectionInROI:p_motionHistograms->topRightDirection];
  int v6 = [(OpticalFlowAnalyzer *)self detectDominantDirectionInROI:p_motionHistograms->bottomLeftDirection];
  int v7 = [(OpticalFlowAnalyzer *)self detectDominantDirectionInROI:p_motionHistograms->bottomRightDirection];
  if (v4 == 2) {
    int v8 = 3;
  }
  else {
    int v8 = 0;
  }
  if (v5 == 3) {
    int v9 = 3;
  }
  else {
    int v9 = 0;
  }
  BOOL v10 = v5 == -1;
  if (v6 == 1) {
    int v11 = 3;
  }
  else {
    int v11 = 0;
  }
  if (v7) {
    int v12 = 0;
  }
  else {
    int v12 = 3;
  }
  BOOL v13 = v4 == -1;
  if (v4 == -1) {
    int v14 = v10 + 1;
  }
  else {
    int v14 = v5 == -1;
  }
  BOOL v15 = v6 == -1;
  int v16 = v14 + v8 + v9 + v11;
  if (v6 == -1) {
    int v17 = v16 + 1;
  }
  else {
    int v17 = v16;
  }
  BOOL v18 = v7 == -1;
  unsigned int v19 = v17 + v12;
  if (v7 == -1) {
    ++v19;
  }
  if (v19 > 6) {
    return 1;
  }
  if (v4) {
    int v21 = 0;
  }
  else {
    int v21 = 3;
  }
  int v22 = v21 + v13;
  if (v5 == 1) {
    int v23 = 3;
  }
  else {
    int v23 = 0;
  }
  int v24 = v22 + v23 + v10;
  if (v6 == 3) {
    int v25 = 3;
  }
  else {
    int v25 = 0;
  }
  int v26 = v25 + v15;
  if (v7 == 2) {
    int v27 = 3;
  }
  else {
    int v27 = 0;
  }
  if ((v24 + v26 + v27 + v18) > 6) {
    return 2;
  }
  int64_t v20 = 3;
  if (v4 == 1) {
    int v28 = 3;
  }
  else {
    int v28 = 0;
  }
  int v29 = v28 + v13;
  if (v5 == 2) {
    int v30 = 3;
  }
  else {
    int v30 = 0;
  }
  int v31 = v29 + v30 + v10;
  if (v6) {
    int v32 = 0;
  }
  else {
    int v32 = 3;
  }
  int v33 = v32 + v15;
  if (v7 == 3) {
    int v34 = 3;
  }
  else {
    int v34 = 0;
  }
  if ((v31 + v33 + v34 + v18) <= 9)
  {
    if (v4 == 3) {
      int v35 = 3;
    }
    else {
      int v35 = 0;
    }
    int v36 = v35 + v13;
    if (v5) {
      int v37 = 0;
    }
    else {
      int v37 = 3;
    }
    int v38 = v36 + v37 + v10;
    if (v6 == 2) {
      int v39 = 3;
    }
    else {
      int v39 = 0;
    }
    int v40 = v39 + v15;
    if (v7 == 1) {
      int v41 = 3;
    }
    else {
      int v41 = 0;
    }
    return 4 * ((v38 + v40 + v41 + v18) > 9);
  }
  return v20;
}

- (int)detectDominantDirectionInROI:(unsigned int *)a3
{
  unsigned int v3 = a3[1];
  unsigned int v5 = a3[2];
  unsigned int v4 = a3[3];
  signed int v6 = v3 + *a3 + v5 + v4;
  if (v6 <= self->_size / 0x14) {
    return -1;
  }
  int v7 = v6 + (v6 < 0);
  if (*a3 > (int)(v3 + *a3 + v5 + v4) / 2) {
    return 0;
  }
  unsigned int v9 = v7 >> 1;
  if (v3 > v7 >> 1) {
    return 1;
  }
  if (v5 > v9) {
    return 2;
  }
  if (v4 <= v9) {
    return -1;
  }
  return 3;
}

- (void)analyzeDeformation
{
  p_motionHistograms = &self->_motionHistograms;
  float v4 = (float)(LODWORD(self->_size) >> 6);
  float areaLowMotionOppositeDirectionBlocks = (float)self->_motionHistograms.areaLowMotionOppositeDirectionBlocks;
  float v6 = 0.0;
  if ((float)(v4 * 0.06) < areaLowMotionOppositeDirectionBlocks)
  {
    float numLowMotionOppositeDirectionBlocks = (float)self->_motionHistograms.numLowMotionOppositeDirectionBlocks;
    if ((float)(v4 * 0.007) <= numLowMotionOppositeDirectionBlocks) {
      float v6 = numLowMotionOppositeDirectionBlocks / areaLowMotionOppositeDirectionBlocks;
    }
  }
  printf("[FlowAnalysis] deformationRatio: %.3f\n", v6);
  if (v6 > self->jsonDeformationRatioThreshold) {
    self->_flowDeformatiounint64_t n = self->_flowDeformation + 1.0;
  }
  self->_flowDeformationSuunint64_t m = v6 + self->_flowDeformationSum;
  printf("[MotionHistograms] low motion opposite direction blocks: num: %d, area: %d, total_area: %d\n", p_motionHistograms->numLowMotionOppositeDirectionBlocks, p_motionHistograms->areaLowMotionOppositeDirectionBlocks, SLODWORD(self->_size) / 64);
}

- (void)isSafeToInterpolateForDeformationGating
{
  printf("[FlowAnalysis] [Deformation: %.3f, DeformationSum: %.3f]\n", self->_flowDeformation, self->_flowDeformationSum);
  fflush((FILE *)*MEMORY[0x1E4F143D8]);
  unint64_t useCase = self->_useCase;
  if (useCase == 1)
  {
    float v5 = 1.5 / (exp((float)(self->_flowDeformationSum - self->jsonDeformationFlowSumThresholdForSloMo) * 5.0) + 1.0);
    float v6 = fmin(v5, 1.0);
    if (v6 < 1.0) {
      NSLog(&cfstr_Autobahnflowan_5.isa, v6);
    }
    self->_confidenceScore = fminf(v6, self->_confidenceScore);
    if (self->_flowDeformation > self->jsonDeformationFlowThresholdForSloMo
      && self->_flowDeformationSum > self->jsonDeformationFlowSumThresholdForSloMo)
    {
      float v4 = @"[AutobahnFlowAnalysis] Interpolation is gated (deformation) for recommendation only";
      goto LABEL_11;
    }
  }
  else if (!useCase {
         && self->_flowDeformation > self->jsonDeformationFlowThreshold
  }
         && self->_flowDeformationSum > self->jsonDeformationFlowSumThreshold)
  {
    float v4 = @"[FlowAnalysis] Interpolation is gated (deformation)";
LABEL_11:
    self->_safeToInterpolate.deformatiounint64_t n = 0;
    NSLog(&v4->isa);
  }
}

- (void)modulateGatingParametersFromMotionHistogramsAnalysis
{
  if (self->_isContinuousDrops)
  {
    BOOL v2 = !self->_prevMotionHistogramsAnalysis.hasStaticBackground
      && self->_prevMotionHistogramsAnalysis.dominantDirection >= 0;
    dominantDirectiounint64_t n = self->_motionHistogramsAnalysis.dominantDirection;
    relativeDominantDirectiounint64_t n = self->_motionHistogramsAnalysis.relativeDominantDirection;
    BOOL v5 = self->_motionHistogramsAnalysis.hasStaticBackground || dominantDirection < 0;
    int v6 = v5;
    int v7 = self->_prevMotionHistogramsAnalysis.dominantDirection;
    int v8 = self->_prevMotionHistogramsAnalysis.relativeDominantDirection;
    unsigned int v9 = v8 - relativeDominantDirection;
    if (v8 - relativeDominantDirection < 0) {
      unsigned int v9 = relativeDominantDirection - v8;
    }
    if (!v2
      || (v6 & 1) != 0
      || (v7 - dominantDirection >= 0 ? (unsigned int v10 = v7 - dominantDirection) : (unsigned int v10 = dominantDirection - v7),
          (v11 = 1, BOOL v5 = v10 > 7, v12 = (1 << v10) & 0x83, !v5) ? (v13 = v12 == 0) : (v13 = 1),
          v13))
    {
      if (v2 && self->_motionHistogramsAnalysis.hasSpecialMotion > 0) {
        goto LABEL_37;
      }
      hasSpecialMotiounint64_t n = self->_prevMotionHistogramsAnalysis.hasSpecialMotion;
      if (hasSpecialMotion < 1) {
        int v6 = 1;
      }
      if (v6 != 1)
      {
LABEL_37:
        BOOL v11 = 1;
      }
      else
      {
        int64_t v15 = self->_motionHistogramsAnalysis.hasSpecialMotion;
        BOOL v11 = hasSpecialMotion == v15 && v15 > 0;
      }
    }
    self->_hasCameraMotiounint64_t n = v11;
    if (v8 < 0)
    {
      BOOL v17 = 0;
      BOOL v23 = 0;
      p_hasDominantMovingLargeObjects = &self->_hasDominantMovingLargeObjects;
      self->_hasDominantMovingLargeObjects = 0;
      if (relativeDominantDirection < 0) {
        goto LABEL_53;
      }
    }
    else if (relativeDominantDirection < 0)
    {
      BOOL v17 = 0;
      p_hasDominantMovingLargeObjects = &self->_hasDominantMovingLargeObjects;
      self->_hasDominantMovingLargeObjects = 0;
    }
    else
    {
      BOOL v17 = v9 < 2;
      BOOL v18 = v9 > 7;
      if (v9 == 7) {
        BOOL v17 = 1;
      }
      int v19 = (1 << v9) & 0x83;
      BOOL v21 = !v18 && v19 != 0 && (v7 | dominantDirection) >= 0;
      p_hasDominantMovingLargeObjects = &self->_hasDominantMovingLargeObjects;
      self->_hasDominantMovingLargeObjects = v21;
    }
    BOOL v23 = (v7 & dominantDirection) == -1;
LABEL_53:
    self->_hasDominantMovingSmallObjects = v23;
    BOOL hasStaticBackground = self->_prevMotionHistogramsAnalysis.hasStaticBackground;
    if (self->_prevMotionHistogramsAnalysis.hasStaticBackground) {
      BOOL hasStaticBackground = self->_motionHistogramsAnalysis.hasStaticBackground;
    }
    self->_BOOL hasStaticBackground = hasStaticBackground;
    float jsonRandomnessAreaScale = 1.0;
    if (v17) {
      float jsonRandomnessAreaScale = self->jsonRandomnessAreaScale;
    }
    self->float randomnessAreaScale = jsonRandomnessAreaScale;
    hasCameraMotiounint64_t n = self->_hasCameraMotion;
    BOOL v27 = *p_hasDominantMovingLargeObjects;
    if (hasCameraMotion || v27)
    {
      self->float consistencySafeThresholdsScale = -1.0;
      self->randomnessErrorChangeRatioThreshold = self->jsonRandomnessErrorChangeRatioThresholdForCameraMotion;
      uint64_t v28 = 408;
    }
    else if (hasStaticBackground && self->_hasDominantMovingSmallObjects)
    {
      BOOL v27 = 0;
      self->float consistencySafeThresholdsScale = 1.0;
      self->randomnessErrorChangeRatioThreshold = self->jsonRandomnessErrorChangeRatioThresholdForStatic;
      uint64_t v28 = 416;
    }
    else
    {
      BOOL v27 = 0;
      self->float consistencySafeThresholdsScale = 0.0;
      self->randomnessErrorChangeRatioThreshold = self->jsonRandomnessErrorChangeRatioThreshold;
      uint64_t v28 = 400;
    }
    self->randomnessAreaChangeRatioThreshold = *(float *)((char *)&self->super.super.isa + v28);
    printf("[MotionHistograms] has_camera_motion: %d, has_dominant_moving_large_objects: %d, has_dominant_moving_small_objects: %d, has_static_background: %d\n", hasCameraMotion, v27, self->_hasDominantMovingSmallObjects, hasStaticBackground);
    return;
  }
  if (self->_isSmallDrops && (self->_motionHistogramsAnalysis.dominantDirection & 0x80000000) == 0) {
    self->float consistencySafeThresholdsScale = -1.0;
  }
}

- (void)printSideHistograms
{
  p_motionHistograms = &self->_motionHistograms;
  printf("[MotionHistograms] left side directions: [%d, %d, %d, %d], average_magnitude:%d\n", self->_motionHistograms.leftSideDirection[0], self->_motionHistograms.leftSideDirection[1], self->_motionHistograms.leftSideDirection[2], self->_motionHistograms.leftSideDirection[3], self->_motionHistograms.leftSideAverageMagnitude);
  printf("[MotionHistograms] right side directions: [%d, %d, %d, %d], average_magnitude:%d\n", p_motionHistograms->rightSideDirection[0], p_motionHistograms->rightSideDirection[1], p_motionHistograms->rightSideDirection[2], p_motionHistograms->rightSideDirection[3], p_motionHistograms->rightSideAverageMagnitude);
  printf("[MotionHistograms] top side directions: [%d, %d, %d, %d], average_magnitude:%d\n", p_motionHistograms->topSideDirection[0], p_motionHistograms->topSideDirection[1], p_motionHistograms->topSideDirection[2], p_motionHistograms->topSideDirection[3], p_motionHistograms->topSideAverageMagnitude);
  printf("[MotionHistograms] bottom side directions: [%d, %d, %d, %d], average_magnitude:%d\n", p_motionHistograms->bottomSideDirection[0], p_motionHistograms->bottomSideDirection[1], p_motionHistograms->bottomSideDirection[2], p_motionHistograms->bottomSideDirection[3], p_motionHistograms->bottomSideAverageMagnitude);
}

- (BOOL)detectCameraRotation
{
  [(OpticalFlowAnalyzer *)self printSideHistograms];
  unsigned int v3 = vaddvq_s32(*(int32x4_t *)self->_motionHistograms.leftSideDirection);
  unsigned int v4 = vaddvq_s32(*(int32x4_t *)self->_motionHistograms.rightSideDirection);
  unsigned int jsonSideMotionPixelCountThreshold = self->jsonSideMotionPixelCountThreshold;
  if (v3 < jsonSideMotionPixelCountThreshold || v4 < jsonSideMotionPixelCountThreshold) {
    return 0;
  }
  uint64_t v7 = 0;
  int v8 = 0;
  int v9 = 0;
  unsigned int v10 = self->_motionHistograms.leftSideDirection[0];
  unsigned int v11 = self->_motionHistograms.rightSideDirection[0];
  do
  {
    int v12 = &self->_motionHistograms.frameMagnitude[v7++];
    if (v12[35] > v10)
    {
      int v9 = v7;
      unsigned int v10 = v12[35];
    }
    unsigned int v13 = v12[39];
    if (v13 > v11)
    {
      int v8 = v7;
      unsigned int v11 = v13;
    }
  }
  while (v7 != 3);
  float jsonSideMotionDominanceThreshold = self->jsonSideMotionDominanceThreshold;
  if ((float)((float)v10 / (float)v3) < jsonSideMotionDominanceThreshold
    || (float)((float)v11 / (float)v4) < jsonSideMotionDominanceThreshold)
  {
    return 0;
  }
  if (!v9 && v8 == 2) {
    return 1;
  }
  return v9 == 2 && v8 == 0;
}

- (BOOL)checkSafetyByScoreAndArea:(id *)a3
{
  float var3 = a3->var3;
  float var5 = a3->var5;
  CMTimeMake(&time2, 80, 600);
  CMTime time1 = (CMTime)a3->var0;
  if (CMTimeCompare(&time1, &time2) < 0 || !self->_hasDominantMovingLargeObjects)
  {
    CMTimeMake(&v13, 40, 600);
    CMTime time1 = (CMTime)a3->var0;
    if (CMTimeCompare(&time1, &v13)) {
      return 1;
    }
    if (var3 <= 26.0 || var3 >= 30.0) {
      return 1;
    }
    float v9 = 2.4;
  }
  else
  {
    BOOL v7 = var3 > 30.0 && var3 < 32.0;
    if (v7 && var5 > 1.1 && var5 < 1.7) {
      return 0;
    }
    if (var3 <= 26.5 || var3 >= 30.0) {
      return 1;
    }
    float v9 = 1.9;
  }
  return var5 <= v9 || var5 >= 5.0;
}

- (BOOL)checkSafetyByStripConsistency:(id *)a3
{
  float var5 = a3->var5;
  var28 = a3->var28;
  float v11 = *var28;
  unint64_t v12 = a3->var27 - 1;
  if (v12 >= 2)
  {
    unsigned int v13 = 2;
    uint64_t v14 = 1;
    do
    {
      if (var28[v14] < v11) {
        float v11 = var28[v14];
      }
      uint64_t v14 = v13;
      BOOL v15 = v12 > v13++;
    }
    while (v15);
  }
  *(float *)&double v4 = self->jsonConsistencyVerticalStripScoreThreshold;
  *(float *)&double v6 = self->jsonConsistencyVerticalStripAreaPercentageThreshold;
  *(float *)&double v3 = v11;
  *(float *)&double v5 = a3->var5;
  [(OpticalFlowAnalyzer *)self computeConsistencyConfidenceFromScore:v3 scoreThreshold:v4 areaRatio:v5 areaRatioThreshold:v6];
  float v20 = *(float *)&v16;
  BOOL v21 = var5 <= self->jsonConsistencyVerticalStripAreaPercentageThreshold
     || v11 >= self->jsonConsistencyVerticalStripScoreThreshold;
  unint64_t var29 = a3->var29;
  var30 = a3->var30;
  float v24 = *var30;
  if (var29 >= 2)
  {
    unsigned int v25 = 2;
    uint64_t v26 = 1;
    do
    {
      if (var30[v26] < v24) {
        float v24 = var30[v26];
      }
      uint64_t v26 = v25;
      BOOL v15 = var29 > v25++;
    }
    while (v15);
  }
  *(float *)&double v17 = self->jsonConsistencyHorizontalStripScoreThreshold;
  *(float *)&double v19 = self->jsonConsistencyHorizontalStripAreaPercentageThreshold;
  *(float *)&double v16 = v24;
  *(float *)&double v18 = var5;
  [(OpticalFlowAnalyzer *)self computeConsistencyConfidenceFromScore:v16 scoreThreshold:v17 areaRatio:v18 areaRatioThreshold:v19];
  if (var5 > self->jsonConsistencyHorizontalStripAreaPercentageThreshold
    && v24 < self->jsonConsistencyHorizontalStripScoreThreshold)
  {
    BOOL v21 = 0;
  }
  float v28 = fmin(fminf(v20, v27), 1.0);
  if (v28 < 1.0) {
    NSLog(&cfstr_FlowanalysisCo.isa, v28);
  }
  self->_confidenceScore = fminf(v28, self->_confidenceScore);
  return v21;
}

- (BOOL)checkSafetyByBlockConsistency:(id *)a3
{
  if (!self->_hasCameraMotion
    || !self->_hasDominantMovingLargeObjects
    || self->_hasDominantMovingSmallObjects
    || self->_hasStaticBackground)
  {
    return 1;
  }
  float var9 = a3->var9;
  float var10 = a3->var10;
  CMTimeMake(&time2, 80, 600);
  CMTime time1 = (CMTime)a3->var0;
  if (CMTimeCompare(&time1, &time2) < 0)
  {
    CMTimeMake(&v8, 40, 600);
    CMTime time1 = (CMTime)a3->var0;
    if (CMTimeCompare(&time1, &v8) || var9 <= 1.5 || var9 >= 2.6 || var10 <= 0.4) {
      return 1;
    }
  }
  else
  {
    if (var9 <= 1.6) {
      return 1;
    }
    if (var9 >= 2.6 || var10 <= 0.5) {
      return 1;
    }
  }
  return var10 >= 1.2;
}

- (void)updateGatingStats
{
  long long v3 = *(_OWORD *)&self->_motionHistogramsAnalysis.hasSpecialMotion;
  *(_OWORD *)&self->_prevMotionHistogramsAnalysis.BOOL hasStaticBackground = *(_OWORD *)&self->_motionHistogramsAnalysis.hasStaticBackground;
  *(_OWORD *)&self->_prevMotionHistogramsAnalysis.hasSpecialMotiounint64_t n = v3;
  self->consistencySafeThresholdsScaleForLargeRandomnessErr = 0.0;
  if (self->_visualizationEnabled)
  {
    free(self->_deformationBinaryMap);
    free(self->_consistencyMap);
    free(self->_backwarpLossMap);
  }
  free(self->_deformationBlockRanges);
  if (self->_shouldRunBackwarpGating)
  {
    backwarpBlockRanges = self->_backwarpBlockRanges;
    free(backwarpBlockRanges);
  }
}

- (void)isSafeToInterpolateForBackwarpGatingWithFlowForward:(__CVBuffer *)a3 flowBackward:(__CVBuffer *)a4 flowResFirst:(__CVBuffer *)a5 flowResSecond:(__CVBuffer *)a6
{
  if (self->_shouldRunBackwarpGating)
  {
    float v11 = (void *)MEMORY[0x1E01A5320]();
    [(OpticalFlowAnalyzer *)self analyzeBackwarpForward:a3 backward:a4 flowResFirst:a5 flowResSecond:a6];
    float v18 = v37 == v38 ? 100.0 : v38;
    if (self->_useCase == 1)
    {
      *(float *)&double v13 = self->jsonBackwarpFrameScoreThreshold;
      *(float *)&double v14 = self->jsonBackwarpScoreHighThreshold;
      *(float *)&double v16 = self->jsonBackwarpAreaPercentageThreshold;
      *(float *)&double v17 = self->jsonBackwarpAreaPercentageHighThreshold;
      *(float *)&double v12 = v37;
      *(float *)&double v15 = v39;
      [(OpticalFlowAnalyzer *)self computeBackwarpConfidenceFromScore:v40 >= self->jsonBackwarpAreaThreshold scoreThreshold:v12 scoreHighThreshold:v13 areaRatio:v14 areaRatioThreshold:v15 areaRatioHighThreshold:v16 large_area:v17];
      float v20 = v19;
      *(float *)&double v21 = self->jsonBackwarpFrameScoreThresholdOnDemand;
      *(float *)&double v22 = self->jsonBackwarpScoreHighThreshold;
      *(float *)&double v23 = self->jsonBackwarpAreaPercentageThresholdOnDemand;
      *(float *)&double v24 = self->jsonBackwarpAreaPercentageHighThreshold;
      *(float *)&double v25 = v37;
      *(float *)&double v26 = v39;
      [(OpticalFlowAnalyzer *)self computeBackwarpConfidenceFromScore:v40 >= self->jsonBackwarpAreaThreshold scoreThreshold:v25 scoreHighThreshold:v21 areaRatio:v22 areaRatioThreshold:v26 areaRatioHighThreshold:v23 large_area:v24];
      float v32 = *(float *)&v33;
      LODWORD(v33) = 1.0;
      if (v37 != v38)
      {
        *(float *)&double v27 = self->jsonBackwarpROIScoreThreshold;
        *(float *)&double v28 = self->jsonBackwarpScoreHighThreshold;
        *(float *)&double v30 = self->jsonBackwarpAreaPercentageThreshold;
        *(float *)&double v31 = self->jsonBackwarpAreaPercentageHighThreshold;
        *(float *)&double v33 = v38;
        *(float *)&double v29 = v39;
        [(OpticalFlowAnalyzer *)self computeBackwarpConfidenceFromScore:v40 >= self->jsonBackwarpAreaThreshold scoreThreshold:v33 scoreHighThreshold:v27 areaRatio:v28 areaRatioThreshold:v29 areaRatioHighThreshold:v30 large_area:v31];
      }
      float v34 = fmin(fminf(v20, *(float *)&v33), 1.0);
      if (v34 < 1.0) {
        NSLog(&cfstr_Autobahnflowan_7.isa, v34);
      }
      self->_confidenceScore = fminf(v34, self->_confidenceScore);
      float v35 = fmin(v32, 1.0);
      if (v35 < 1.0) {
        NSLog(&cfstr_Autobahnflowan_8.isa, v35);
      }
      self->_confidenceScoreOnDemand = fminf(v35, self->_confidenceScoreOnDemand);
      if (v39 > self->jsonBackwarpAreaPercentageThreshold
        && (v37 < self->jsonBackwarpFrameScoreThreshold || v18 < self->jsonBackwarpROIScoreThreshold))
      {
        self->_safeToInterpolate.backwarp = 0;
        if (v39 <= self->jsonBackwarpAreaPercentageThresholdOnDemand
          || v37 >= self->jsonBackwarpFrameScoreThresholdOnDemand)
        {
          if (v39 <= self->jsonBackwarpAreaPercentageHighThreshold || v37 >= self->jsonBackwarpScoreHighThreshold)
          {
LABEL_24:
            NSLog(&cfstr_Autobahnflowan_10.isa);
            return;
          }
          BOOL v36 = v40 < self->jsonBackwarpAreaThreshold;
        }
        else
        {
          BOOL v36 = 0;
        }
        if (self->_framesToInterpolate >= 4 && !v36)
        {
          self->_isSafeToInterpolateForInteractiveMode = 0;
          NSLog(&cfstr_Autobahnflowan_9.isa);
          return;
        }
        goto LABEL_24;
      }
    }
  }
}

- (float)computeBackwarpConfidenceFromScore:(float)a3 scoreThreshold:(float)a4 scoreHighThreshold:(float)a5 areaRatio:(float)a6 areaRatioThreshold:(float)a7 areaRatioHighThreshold:(float)a8 large_area:(BOOL)a9
{
  if (a6 >= a7)
  {
    float v11 = 1.0;
    if (a6 >= a8 && a9) {
      float v11 = (exp(((float)(a6 - a8) * 0.1 + 1.0) * (float)((float)(a4 / fmaxf(a3, a5)) + -1.0)) + 1.0) * 0.5;
    }
  }
  else
  {
    float v11 = expf((float)(1.0 - (float)(a6 / a7)) * 15.0);
  }
  float v13 = 4.0;
  if (a3 >= a4) {
    float v13 = 1.0;
  }
  return v11 * 1.5 / (float)(expf((float)((float)(a4 / a3) + -1.0) * v13) + 1.0);
}

- ($599F175E452E455E49EC8439362DB023)analyzeBackwarpForward:(SEL)a3 backward:(__CVBuffer *)a4 flowResFirst:(__CVBuffer *)a5 flowResSecond:(__CVBuffer *)a6
{
  size_t Width = CVPixelBufferGetWidth(a4);
  size_t v14 = CVPixelBufferGetHeight(a4) >> 1;
  double v15 = createTexturesFromCVPixelBuffer(a4, self->super._device, 1, 2uLL);
  double v16 = createTexturesFromCVPixelBuffer(a5, self->super._device, 1, 2uLL);
  double v17 = createTexturesFromCVPixelBuffer(a6, self->super._device, 1, 3uLL);
  float v18 = createTexturesFromCVPixelBuffer(a7, self->super._device, 1, 3uLL);
  float v19 = createTextures(self->super._device, Width, v14, 1, 1uLL);
  float v20 = createTextures(self->super._device, Width, v14, 1, 1uLL);
  double v25 = [[Backwarp alloc] initWithDevice:self->super._device interleaved:0];
  LODWORD(v21) = 1.0;
  [(Backwarp *)v25 calcBackwarpLoss:v17 second:v18 flow:v15 timeScale:v19 destination:v21];
  LODWORD(v22) = 1.0;
  [(Backwarp *)v25 calcBackwarpLoss:v18 second:v17 flow:v16 timeScale:v20 destination:v22];
  double v23 = [(NSArray *)self->_firstFaceHandLegRectangles arrayByAddingObjectsFromArray:self->_secondFaceHandLegRectangles];
  *(void *)&retstr->float var0 = 0;
  *(void *)&retstr->var2 = 0;
  retstr->var4 = 0.0;
  [(OpticalFlowAnalyzer *)self calcBackwarpStatisticsForwardLossTexture:v19 backwardLossTexture:v20 faceHandLegRectangles:v23];
  printf("[FlowAnalysis] Backwarp Loss Error: %.3f, Score: %.3f, ROI_Score: %.3f, Area_Ratio: %.3f, Area: %.3f\n", retstr->var0, retstr->var1, retstr->var2, retstr->var3, retstr->var4);

  return result;
}

- ($599F175E452E455E49EC8439362DB023)calcBackwarpStatisticsForwardLossTexture:(SEL)a3 backwardLossTexture:(id)a4 faceHandLegRectangles:(id)a5
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  unint64_t v13 = (unint64_t)([v12 width] + 7) >> 3;
  unint64_t v14 = (unint64_t)([v12 height] + 7) >> 3;
  double v15 = (void *)[(MTLDevice *)self->super._device newBufferWithLength:4 * v13 * v14 options:0];
  double v16 = [(MTLCommandQueue *)self->super._commandQueue commandBuffer];
  double v17 = [v16 computeCommandEncoder];
  [v17 setComputePipelineState:self->_backwarpStatisticsKernel];
  [v17 setTexture:v12 atIndex:0];

  [v17 setTexture:v11 atIndex:1];
  [v17 setBuffer:v15 offset:0 atIndex:0];
  v24[0] = v13;
  v24[1] = v14;
  v24[2] = 1;
  int64x2_t v22 = vdupq_n_s64(8uLL);
  uint64_t v23 = 1;
  [v17 dispatchThreadgroups:v24 threadsPerThreadgroup:&v22];
  [v17 endEncoding];
  [v16 commit];
  [v16 waitUntilCompleted];
  id v18 = v15;
  uint64_t v19 = [v18 contents];
  if (v10)
  {
    float v20 = [(OpticalFlowAnalyzer *)self findFaceHandLegBlocksFromRectangles:v10 blockWidth:v13 blockHeight:v14];
  }
  else
  {
    float v20 = 0;
  }
  *(void *)&retstr->float var0 = 0;
  *(void *)&retstr->var2 = 0;
  retstr->var4 = 0.0;
  [(OpticalFlowAnalyzer *)self processBackwarpStats:v19 blockWidth:v13 blockHeight:v14 faceHandLegBoundingBoxBlocks:v20];

  return result;
}

- ($599F175E452E455E49EC8439362DB023)processBackwarpStats:(SEL)a3 blockWidth:(id *)a4 blockHeight:(unint64_t)a5 faceHandLegBoundingBoxBlocks:(unint64_t)a6
{
  id v67 = a7;
  size_t v10 = [v67 count];
  id v11 = (float *)malloc_type_calloc(v10, 4uLL, 0x100004052888210uLL);
  id v12 = (int *)malloc_type_calloc(4uLL, 4uLL, 0x100004052888210uLL);
  self->_backwarpBlockRanges = v12;
  int *v12 = a5;
  v12[1] = -1;
  v12[2] = a6;
  v12[3] = -1;
  unint64_t v13 = 0x1EAA9B000uLL;
  if (self->_visualizationEnabled) {
    self->_backwarpLossMap = (char *)malloc_type_calloc(a6 * a5, 1uLL, 0x100004077774924uLL);
  }
  float v58 = 0.0;
  if (a6)
  {
    uint64_t v14 = 0;
    unint64_t v15 = 0;
    uint64_t v16 = 0;
    uint64_t v59 = (int)a5;
    unint64_t v60 = a6;
    float v17 = 0.0;
    float v18 = 0.0;
    float v19 = 0.0;
    unint64_t v61 = a5;
    float32x4x2_t v62 = self;
    do
    {
      if (a5)
      {
        uint64_t v20 = 0;
        p_cleanRectFlow8x8 = &self->_cleanRectFlow8x8;
        double v22 = (double)(int)v14;
        uint64_t v65 = v14 * v59;
        uint64_t v63 = v14;
        do
        {
          v69.double x = (double)(int)v20;
          v69.double y = v22;
          if (CGRectContainsPoint(*p_cleanRectFlow8x8, v69))
          {
            float var0 = a4[v20 + v65].var0;
            if (self->_visualizationEnabled) {
              (*(unsigned char **)((char *)&self->super.super.isa + *(int *)(v13 + 2708)))[v20 + v65] = (int)var0;
            }
            if (var0 > 32.0)
            {
              backwarpBlockRanges = self->_backwarpBlockRanges;
              if (v20 < *backwarpBlockRanges) {
                int *backwarpBlockRanges = v20;
              }
              if (v20 > backwarpBlockRanges[1]) {
                backwarpBlockRanges[1] = v20;
              }
              if (v14 < backwarpBlockRanges[2]) {
                backwarpBlockRanges[2] = v14;
              }
              float v18 = v18 + 1.0;
              if (v14 > backwarpBlockRanges[3]) {
                backwarpBlockRanges[3] = v14;
              }
            }
            double v25 = v67;
            if (v10)
            {
              uint64_t v26 = v16;
              unint64_t v27 = v15;
              uint64_t v28 = 0;
              char v29 = 0;
              do
              {
                double v30 = [v25 objectAtIndexedSubscript:v28];
                [v30 rect];
                v70.double x = (double)(int)v20;
                v70.double y = v22;
                BOOL v31 = CGRectContainsPoint(v71, v70);

                if (v31)
                {
                  v11[v28] = var0 + v11[v28];
                  char v29 = 1;
                }
                ++v28;
                double v25 = v67;
              }
              while (v10 != v28);
              uint64_t v16 = v26 + ((v29 & 1) == 0);
              if (v29) {
                float v32 = -0.0;
              }
              else {
                float v32 = var0;
              }
              unint64_t v15 = v27;
              a5 = v61;
              self = v62;
              unint64_t v13 = 0x1EAA9B000;
              uint64_t v14 = v63;
            }
            else
            {
              ++v16;
              float v32 = var0;
            }
            ++v15;
            float v17 = v17 + var0;
            float v19 = v19 + v32;
          }
          ++v20;
        }
        while (v20 != a5);
      }
      ++v14;
    }
    while (v14 != v60);
  }
  else
  {
    uint64_t v16 = 0;
    unint64_t v15 = 0;
    float v19 = 0.0;
    float v18 = 0.0;
    float v17 = 0.0;
  }
  double v33 = self->_backwarpBlockRanges;
  int v34 = *v33;
  int v35 = v33[1];
  int v36 = v35 - *v33;
  if (v35 >= *v33)
  {
    int v38 = v33[2];
    int v39 = v33[3];
    float v37 = 0.0;
    if (v39 >= v38)
    {
      float v58 = (float)(v36 + 1 + (v36 + 1) * (v39 - v38));
      float v37 = (float)(v18 * 100.0) / v58;
      printf("[FlowAnalysis] Backwarp ranges (%d, %d, %d, %d)\n", v34, v35, v38, v39);
    }
  }
  else
  {
    float v37 = 0.0;
  }
  float v66 = v37;
  float v40 = (float *)malloc_type_calloc(v10, 4uLL, 0x100004052888210uLL);
  float v41 = 0.0;
  float v42 = 0.0;
  if (v10)
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      float v44 = v11[i];
      unint64_t v45 = [v67 objectAtIndexedSubscript:i];
      v40[i] = v44 / (float)(int)([v45 numberOfBlocks] << 6);

      unint64_t v46 = [v67 objectAtIndexedSubscript:i];
      float v47 = (float)(unint64_t)[v46 numberOfBlocks] / (float)v15;

      uint64_t v48 = [v67 objectAtIndexedSubscript:i];
      uint64_t v49 = [v48 category];

      float v50 = 64.0;
      if (v49 == 2) {
        float v50 = 128.0;
      }
      float v51 = fmin((float)(v47 * v50), 1.0);
      if ((float)(v40[i] * v51) > v41)
      {
        float v41 = v40[i] * v51;
        float v42 = v51;
      }
    }
  }
  if (v16) {
    float v52 = v19 / (float)(unint64_t)(v16 << 6);
  }
  else {
    float v52 = 0.0;
  }
  float v53 = v17 / (float)(v15 << 6);
  float v54 = log10(100.0 / v53) * 10.0;
  float v55 = log10(100.0 / (float)(v41 + (float)((float)(1.0 - v42) * v52))) * 10.0;
  retstr->float var0 = v53;
  retstr->var1 = v54;
  retstr->var2 = v55;
  retstr->float var3 = v66;
  retstr->var4 = v58;
  free(v40);
  free(v11);

  return result;
}

- (int64_t)usage
{
  return self->_usage;
}

- (void)setUsage:(int64_t)a3
{
  self->_usage = a3;
}

- (BOOL)inputScaling
{
  return self->_inputScaling;
}

- (void)setInputScaling:(BOOL)a3
{
  self->_inputScaling = a3;
}

- (BOOL)opticalFlowDownsampling
{
  return self->_opticalFlowDownsampling;
}

- (void)setOpticalFlowDownsampling:(BOOL)a3
{
  self->_BOOL opticalFlowDownsampling = a3;
}

- (int64_t)inputRotation
{
  return self->_inputRotation;
}

- (void)setInputRotation:(int64_t)a3
{
  self->_inputRotatiounint64_t n = a3;
}

- (unint64_t)useCase
{
  return self->_useCase;
}

- (void)setUseCase:(unint64_t)a3
{
  self->_unint64_t useCase = a3;
}

- (BOOL)isSmallDrops
{
  return self->_isSmallDrops;
}

- (void)setIsSmallDrops:(BOOL)a3
{
  self->_BOOL isSmallDrops = a3;
}

- (BOOL)isContinuousDrops
{
  return self->_isContinuousDrops;
}

- (void)setIsContinuousDrops:(BOOL)a3
{
  self->_BOOL isContinuousDrops = a3;
}

- (BOOL)shouldRunFlowAnalysis
{
  return self->_shouldRunFlowAnalysis;
}

- (void)setShouldRunFlowAnalysis:(BOOL)a3
{
  self->_shouldRunFlowAnalysis = a3;
}

- (BOOL)shouldRunCrossFlowAnalysis
{
  return self->_shouldRunCrossFlowAnalysis;
}

- (void)setShouldRunCrossFlowAnalysis:(BOOL)a3
{
  self->_shouldRunCrossFlowAnalysis = a3;
}

- (BOOL)shouldRunDetection
{
  return self->_shouldRunDetection;
}

- (void)setShouldRunDetection:(BOOL)a3
{
  self->_shouldRunDetectiounint64_t n = a3;
}

- (BOOL)shouldRunBackwarpGating
{
  return self->_shouldRunBackwarpGating;
}

- (void)setShouldRunBackwarpGating:(BOOL)a3
{
  self->_shouldRunBackwarpGating = a3;
}

- (unsigned)timesDidRunDetection
{
  return self->_timesDidRunDetection;
}

- (void)setTimesDidRunDetection:(unsigned __int8)a3
{
  self->_timesDidRunDetectiounint64_t n = a3;
}

- (FRCScaler)scaler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scaler);
  return (FRCScaler *)WeakRetained;
}

- (void)setScaler:(id)a3
{
}

- (BOOL)isSafeToInterpolateForInteractiveMode
{
  return self->_isSafeToInterpolateForInteractiveMode;
}

- (BOOL)handDetectionEnabled
{
  return self->_handDetectionEnabled;
}

- (void)setHandDetectionEnabled:(BOOL)a3
{
  self->_handDetectionEnabled = a3;
}

- (BOOL)bodyDetectionEnabled
{
  return self->_bodyDetectionEnabled;
}

- (void)setBodyDetectionEnabled:(BOOL)a3
{
  self->_bodyDetectionEnabled = a3;
}

- (BOOL)humanDetectionEnabled
{
  return self->_humanDetectionEnabled;
}

- (void)setHumanDetectionEnabled:(BOOL)a3
{
  self->_humanDetectionEnabled = a3;
}

- (BOOL)animalFaceDetectionEnabled
{
  return self->_animalFaceDetectionEnabled;
}

- (void)setAnimalFaceDetectionEnabled:(BOOL)a3
{
  self->_animalFaceDetectionEnabled = a3;
}

- (int64_t)retimingRecipe
{
  return self->_retimingRecipe;
}

- (void)setRetimingRecipe:(int64_t)a3
{
  self->_int64_t retimingRecipe = a3;
}

- (float)flowConsistencyFrameScore
{
  return self->_flowConsistencyFrameScore;
}

- (float)flowConsistencyROIScore
{
  return self->_flowConsistencyROIScore;
}

- (float)confidenceScore
{
  return self->_confidenceScore;
}

- (float)confidenceScoreOnDemand
{
  return self->_confidenceScoreOnDemand;
}

- (char)deformationBinaryMap
{
  return self->_deformationBinaryMap;
}

- (void)setDeformationBinaryMap:(char *)a3
{
  self->_deformationBinaryMap = a3;
}

- (int)deformationBlockRanges
{
  return self->_deformationBlockRanges;
}

- (void)setDeformationBlockRanges:(int *)a3
{
  self->_deformationBlockRanges = a3;
}

- (char)consistencyMap
{
  return self->_consistencyMap;
}

- (void)setConsistencyMap:(char *)a3
{
  self->_consistencyMap = a3;
}

- (char)backwarpLossMap
{
  return self->_backwarpLossMap;
}

- (void)setBackwarpLossMap:(char *)a3
{
  self->_backwarpLossMap = a3;
}

- (int)backwarpBlockRanges
{
  return self->_backwarpBlockRanges;
}

- (void)setBackwarpBlockRanges:(int *)a3
{
  self->_backwarpBlockRanges = a3;
}

- (BOOL)visualizationEnabled
{
  return self->_visualizationEnabled;
}

- (void)setVisualizationEnabled:(BOOL)a3
{
  self->_visualizationEnabled = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scaler);
  objc_storeStrong((id *)&self->_secondFaceHandLegRectangles, 0);
  objc_storeStrong((id *)&self->_firstFaceHandLegRectangles, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_backwarpStatisticsKernel, 0);
  objc_storeStrong((id *)&self->_motionHistogramsKernel, 0);
  objc_storeStrong((id *)&self->_crossFlowStatisticsKernel, 0);
  objc_storeStrong((id *)&self->_flowStatisticsKernel, 0);
}

@end