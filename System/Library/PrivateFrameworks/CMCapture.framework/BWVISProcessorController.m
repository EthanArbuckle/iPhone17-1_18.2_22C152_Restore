@interface BWVISProcessorController
- (BOOL)flipHorizontalOrientationEnabled;
- (BOOL)longPressModeEnabled;
- (BOOL)smartStyleReversibilityProcessingEnabled;
- (BWVISProcessorControllerConfiguration)configuration;
- (BWVISProcessorDelegate)delegate;
- (int)enqueueBufferForProcessing:(opaqueCMSampleBuffer *)a3;
- (int)finishPendingProcessing;
- (int)prepareToProcess;
- (void)dealloc;
- (void)didCompleteProcessingOfBuffer:(opaqueCMSampleBuffer *)a3 withStatus:(int)a4;
- (void)setConfiguration:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFlipHorizontalOrientationEnabled:(BOOL)a3;
- (void)setLongPressModeEnabled:(BOOL)a3;
- (void)setSmartStyleReversibilityProcessingEnabled:(BOOL)a3;
- (void)willStartProcessingBuffer:(opaqueCMSampleBuffer *)a3 withStatus:(int)a4;
@end

@implementation BWVISProcessorController

- (int)prepareToProcess
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (self->_buffersEnqueued) {
    goto LABEL_27;
  }
  if (!self->_configuration) {
    goto LABEL_29;
  }
  visProcessor = self->_visProcessor;
  if (visProcessor)
  {

    self->_visProcessor = 0;
    self->_visConfiguration = 0;
  }
  uint64_t v4 = [+[FigCaptureCameraParameters sharedInstance] videoStabilizationProcessorVersion];
  if (!v4)
  {
LABEL_29:
    int v24 = -12780;
    goto LABEL_31;
  }
  uint64_t v5 = v4;
  v6 = BWLoadProcessorBundle(@"VideoStabilization", v4);
  if (!v6) {
    goto LABEL_28;
  }
  v7 = v6;
  v8 = (VISConfiguration *)objc_alloc_init((Class)[v6 classNamed:objc_msgSend(NSString, "stringWithFormat:", @"VISConfigurationV%d", v5)]);
  self->_visConfiguration = v8;
  if (!v8
    || (v9 = (VISProcessor *)objc_alloc_init((Class)[v7 classNamed:objc_msgSend(NSString, "stringWithFormat:", @"VISProcessorV%d", v5)]), (self->_visProcessor = v9) == 0))
  {
LABEL_27:
    int v24 = -12782;
LABEL_31:

    self->_visProcessor = 0;
    self->_visConfiguration = 0;
    return v24;
  }
  [(VISProcessor *)v9 setDelegate:self];
  [(VISConfiguration *)self->_visConfiguration setIspProcessingSession:[(BWFigCaptureISPProcessingSession *)[(BWVISProcessorControllerConfiguration *)self->_configuration ispProcessingSession] figCaptureISPProcessingSession]];
  [(VISConfiguration *)self->_visConfiguration setExtendedOutputRowsToFill:[(BWVISProcessorControllerConfiguration *)self->_configuration extendedOutputRowsToFill]];
  [(VISConfiguration *)self->_visConfiguration setInputPixelBufferAttributes:[(BWVISProcessorControllerConfiguration *)self->_configuration inputPixelBufferAttributes]];
  [(VISConfiguration *)self->_visConfiguration setOutputPixelBufferAttributes:[(BWVISProcessorControllerConfiguration *)self->_configuration outputPixelBufferAttributes]];
  [(VISConfiguration *)self->_visConfiguration setTransformPlatform:*((unsigned int *)&xmmword_1A5DBD230+ [(BWVISProcessorControllerConfiguration *)self->_configuration transformPlatform])];
  [(VISConfiguration *)self->_visConfiguration setBlurBorderPixels:[(BWVISProcessorControllerConfiguration *)self->_configuration blurBorderPixels]];
  [(VISConfiguration *)self->_visConfiguration setSmoothingMethod:dword_1A5DBD240[[(BWVISProcessorControllerConfiguration *)self->_configuration smoothingMethod]]];
  [(VISConfiguration *)self->_visConfiguration setMotionBlurShimmerMitigationMethod:dword_1A5DBD258[[(BWVISProcessorControllerConfiguration *)self->_configuration motionBlurShimmerMitigationMethod]]];
  [(VISConfiguration *)self->_visConfiguration setSphereCorrectionEnabled:[(BWVISProcessorControllerConfiguration *)self->_configuration sphereCorrectionEnabled]];
  [(VISConfiguration *)self->_visConfiguration setUseISPMotionData:[(BWVISProcessorControllerConfiguration *)self->_configuration useISPMotionData]];
  [(VISConfiguration *)self->_visConfiguration setCinematicLookAheadFrameCount:[(BWVISProcessorControllerConfiguration *)self->_configuration cinematicLookAheadFrameCount]];
  [(BWVISProcessorControllerConfiguration *)self->_configuration cinematicLookAheadTime];
  -[VISConfiguration setCinematicLookAheadTime:](self->_visConfiguration, "setCinematicLookAheadTime:");
  [(BWVISProcessorControllerConfiguration *)self->_configuration livePhotoCleanOutputRect];
  -[VISConfiguration setLivePhotoCleanOutputRect:](self->_visConfiguration, "setLivePhotoCleanOutputRect:");
  [(VISConfiguration *)self->_visConfiguration setAttachStabilizedOutputCameraTrajectory:[(BWVISProcessorControllerConfiguration *)self->_configuration attachStabilizedOutputCameraTrajectory]];
  [(VISConfiguration *)self->_visConfiguration setAttachStabilizedTrajectoryHomography:[(BWVISProcessorControllerConfiguration *)self->_configuration attachStabilizedTrajectoryHomography]];
  [(VISConfiguration *)self->_visConfiguration setAttachEstimatedMotionVector:[(BWVISProcessorControllerConfiguration *)self->_configuration attachEstimatedMotionVector]];
  [(VISConfiguration *)self->_visConfiguration setOnlyGenerateTransformsParameters:[(BWVISProcessorControllerConfiguration *)self->_configuration onlyGenerateTransformsParameters]];
  [(VISConfiguration *)self->_visConfiguration setEmitSampleBufferSemaphore:[(BWVISProcessorControllerConfiguration *)self->_configuration emitSampleBufferSemaphore]];
  [(VISConfiguration *)self->_visConfiguration setSensorIDDict:[(BWVISProcessorControllerConfiguration *)self->_configuration sensorIDDict]];
  [(VISConfiguration *)self->_visConfiguration setCameraInfoByPortType:[(BWVISProcessorControllerConfiguration *)self->_configuration cameraInfoByPortType]];
  [(VISConfiguration *)self->_visConfiguration setSphereVideoEnabled:[(BWVISProcessorControllerConfiguration *)self->_configuration sphereVideoEnabled]];
  [(VISConfiguration *)self->_visConfiguration setFrameRateConversionEnabled:[(BWVISProcessorControllerConfiguration *)self->_configuration frameRateConversionEnabled]];
  [(VISConfiguration *)self->_visConfiguration setSmartStyleRenderingEnabled:[(BWVISProcessorControllerConfiguration *)self->_configuration smartStyleRenderingEnabled]];
  [(VISConfiguration *)self->_visConfiguration setSmartStyleReversibilityEnabled:[(BWVISProcessorControllerConfiguration *)self->_configuration smartStyleReversibilityEnabled]];
  [(VISConfiguration *)self->_visConfiguration setSmartStyleMemoryPoolId:[(BWVISProcessorControllerConfiguration *)self->_configuration smartStyleMemoryPoolId]];
  [(VISConfiguration *)self->_visConfiguration setVideoStabilizationDisabled:[(BWVISProcessorControllerConfiguration *)self->_configuration videoStabilizationDisabled]];
  [(VISConfiguration *)self->_visConfiguration setP3ToBT2020ConversionEnabled:[(BWVISProcessorControllerConfiguration *)self->_configuration p3ToBT2020ConversionEnabled]];
  [(VISConfiguration *)self->_visConfiguration setGpuPriority:[(BWVISProcessorControllerConfiguration *)self->_configuration gpuPriority]];
  [(VISConfiguration *)self->_visConfiguration setMetalSubmissionAndCompletionQueuePriority:[(BWVISProcessorControllerConfiguration *)self->_configuration metalSubmissionAndCompletionQueuePriority]];
  [(VISConfiguration *)self->_visConfiguration setOutputPixelBufferPool:[(BWPixelBufferPool *)[(BWVISProcessorControllerConfiguration *)self->_configuration outputPixelBufferPool] cvPixelBufferPool]];
  [(VISConfiguration *)self->_visConfiguration setOutputAuxAttributes:[(BWPixelBufferPool *)[(BWVISProcessorControllerConfiguration *)self->_configuration outputPixelBufferPool] cvPixelBufferPoolAuxAttributes]];
  [(VISConfiguration *)self->_visConfiguration setOutputDepthPixelBufferPool:[(BWPixelBufferPool *)[(BWVISProcessorControllerConfiguration *)self->_configuration outputDepthPixelBufferPool] cvPixelBufferPool]];
  [(VISConfiguration *)self->_visConfiguration setOutputDepthAuxAttributes:[(BWPixelBufferPool *)[(BWVISProcessorControllerConfiguration *)self->_configuration outputDepthPixelBufferPool] cvPixelBufferPoolAuxAttributes]];
  [(VISConfiguration *)self->_visConfiguration setDistortionCorrectionEnabledPortTypes:[(BWVISProcessorControllerConfiguration *)self->_configuration distortionCorrectionEnabledPortTypes]];
  [(VISConfiguration *)self->_visConfiguration setDistortionCompensationEnabledPortTypes:[(BWVISProcessorControllerConfiguration *)self->_configuration distortionCompensationEnabledPortTypes]];
  [(BWVISProcessorControllerConfiguration *)self->_configuration minDistanceForBravoParallaxShift];
  -[VISConfiguration setMinDistanceForBravoParallaxShift:](self->_visConfiguration, "setMinDistanceForBravoParallaxShift:");
  [(VISConfiguration *)self->_visConfiguration setVideoSTFParameters:[(BWVISProcessorControllerConfiguration *)self->_configuration videoSTFParameters]];
  [(VISConfiguration *)self->_visConfiguration setVideoGreenGhostMitigationParameters:[(BWVISProcessorControllerConfiguration *)self->_configuration videoGreenGhostMitigationParameters]];
  [(VISConfiguration *)self->_visConfiguration setCameraExtrinsicMatrix:[(BWVISProcessorControllerConfiguration *)self->_configuration cameraExtrinsicMatrix]];
  [(VISConfiguration *)self->_visConfiguration setEnableRollingShutterCorrectionOnly:[(BWVISProcessorControllerConfiguration *)self->_configuration enableRollingShutterCorrectionOnly]];
  [(VISConfiguration *)self->_visConfiguration setDisableTransformLimitsForPredeterminedTrajectory:[(BWVISProcessorControllerConfiguration *)self->_configuration disableTransformLimitsForPredeterminedTrajectory]];
  [(VISConfiguration *)self->_visConfiguration setUseCameraGeometry:[(BWVISProcessorControllerConfiguration *)self->_configuration useCameraGeometry]];
  if (![(NSDictionary *)[(BWVISProcessorControllerConfiguration *)self->_configuration outputAttachmentsPixelBufferPools] count])goto LABEL_20; {
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  if (!v10 || (v11 = v10, (id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60])) == 0))
  {
LABEL_28:
    int v24 = -12786;
    goto LABEL_31;
  }
  v13 = v12;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v14 = [(BWVISProcessorControllerConfiguration *)self->_configuration outputAttachmentsPixelBufferPools];
  uint64_t v15 = [(NSDictionary *)v14 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v28 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        id v20 = [(NSDictionary *)[(BWVISProcessorControllerConfiguration *)self->_configuration outputAttachmentsPixelBufferPools] objectForKeyedSubscript:v19];
        objc_msgSend(v11, "setObject:forKeyedSubscript:", objc_msgSend(v20, "cvPixelBufferPool"), v19);
        objc_msgSend(v13, "setObject:forKeyedSubscript:", objc_msgSend(v20, "cvPixelBufferPoolAuxAttributes"), v19);
      }
      uint64_t v16 = [(NSDictionary *)v14 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v16);
  }
  [(VISConfiguration *)self->_visConfiguration setOutputAttachmentsPixelBufferPools:v11];
  [(VISConfiguration *)self->_visConfiguration setOutputAttachmentsAuxAttributes:v13];

LABEL_20:
  if ([(BWVISProcessorControllerConfiguration *)self->_configuration videoStabilizationStrength] >= 3)
  {
    [(VISConfiguration *)self->_visConfiguration setMotionBlurShimmerMitigationMethod:3];
    LODWORD(v21) = 1113325568;
    [(VISConfiguration *)self->_visConfiguration setHorizonCorrectionThreshold:v21];
    if ([(BWVISProcessorControllerConfiguration *)self->_configuration videoStabilizationStrength] == 4)uint64_t v22 = 2; {
    else
    }
      uint64_t v22 = 1;
    [(VISConfiguration *)self->_visConfiguration setHorizonCorrectionMode:v22];
  }
  [(VISConfiguration *)self->_visConfiguration setZoomSmoothingEnabled:[(BWVISProcessorControllerConfiguration *)self->_configuration zoomSmoothingEnabled]];
  [(VISConfiguration *)self->_visConfiguration setApplyFrameCropOffset:[(BWVISProcessorControllerConfiguration *)self->_configuration applyFrameCropOffset]];
  [(VISProcessor *)self->_visProcessor setConfiguration:self->_visConfiguration];
  int v23 = [(VISProcessor *)self->_visProcessor prepareToProcess:0];
  int v24 = 0;
  if (v23)
  {
    int v26 = v23;
    fig_log_get_emitter();
    FigDebugAssert3();
    int v24 = v26;
    goto LABEL_31;
  }
  return v24;
}

- (void)dealloc
{
  [(VISProcessor *)self->_visProcessor finishProcessing];
  [(VISProcessor *)self->_visProcessor purgeResources];

  v3.receiver = self;
  v3.super_class = (Class)BWVISProcessorController;
  [(BWVISProcessorController *)&v3 dealloc];
}

- (int)enqueueBufferForProcessing:(opaqueCMSampleBuffer *)a3
{
  if (!self->_visProcessor) {
    return -12780;
  }
  id Weak = objc_loadWeak((id *)&self->_delegate);
  int v6 = -12780;
  if (a3 && Weak)
  {
    if (!self->_buffersEnqueued)
    {
      [(VISProcessor *)self->_visProcessor setLongPressModeEnabled:self->_longPressModeEnabled];
      [(VISProcessor *)self->_visProcessor setFlipHorizontalOrientationEnabled:self->_flipHorizontalOrientationEnabled];
      [(VISProcessor *)self->_visProcessor setSmartStyleReversibilityProcessingEnabled:self->_smartStyleReversibilityProcessingEnabled];
    }
    int v6 = [(VISProcessor *)self->_visProcessor enqueueBufferForProcessing:a3];
    if (v6)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    else
    {
      self->_buffersEnqueued = 1;
    }
  }
  return v6;
}

- (int)finishPendingProcessing
{
  if (!objc_loadWeak((id *)&self->_delegate)) {
    return -12780;
  }
  int v3 = [(VISProcessor *)self->_visProcessor finishProcessing];
  if (v3)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  else
  {
    self->_buffersEnqueued = 0;
  }
  return v3;
}

- (void)willStartProcessingBuffer:(opaqueCMSampleBuffer *)a3 withStatus:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id Weak = objc_loadWeak((id *)&self->_delegate);
  [Weak willStartProcessingBuffer:a3 withStatus:v4];
}

- (void)didCompleteProcessingOfBuffer:(opaqueCMSampleBuffer *)a3 withStatus:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id Weak = objc_loadWeak((id *)&self->_delegate);
  [Weak didCompleteProcessingOfBuffer:a3 withStatus:v4];
}

- (BOOL)longPressModeEnabled
{
  return self->_longPressModeEnabled;
}

- (void)setLongPressModeEnabled:(BOOL)a3
{
  self->_longPressModeEnabled = a3;
}

- (BOOL)flipHorizontalOrientationEnabled
{
  return self->_flipHorizontalOrientationEnabled;
}

- (void)setFlipHorizontalOrientationEnabled:(BOOL)a3
{
  self->_flipHorizontalOrientationEnabled = a3;
}

- (BOOL)smartStyleReversibilityProcessingEnabled
{
  return self->_smartStyleReversibilityProcessingEnabled;
}

- (void)setSmartStyleReversibilityProcessingEnabled:(BOOL)a3
{
  self->_smartStyleReversibilityProcessingEnabled = a3;
}

- (BWVISProcessorControllerConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (BWVISProcessorDelegate)delegate
{
  return (BWVISProcessorDelegate *)objc_loadWeak((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end