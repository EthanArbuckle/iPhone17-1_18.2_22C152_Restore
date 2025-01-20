@interface BWVISProcessorControllerConfiguration
- (BOOL)applyFrameCropOffset;
- (BOOL)attachEstimatedMotionVector;
- (BOOL)attachStabilizedOutputCameraTrajectory;
- (BOOL)attachStabilizedTrajectoryHomography;
- (BOOL)blurBorderPixels;
- (BOOL)disableTransformLimitsForPredeterminedTrajectory;
- (BOOL)enableRollingShutterCorrectionOnly;
- (BOOL)frameRateConversionEnabled;
- (BOOL)lowResImageUsedByVideoEncoderEnabled;
- (BOOL)onlyGenerateTransformsParameters;
- (BOOL)p3ToBT2020ConversionEnabled;
- (BOOL)smartStyleRenderingEnabled;
- (BOOL)smartStyleReversibilityEnabled;
- (BOOL)sphereCorrectionEnabled;
- (BOOL)sphereVideoEnabled;
- (BOOL)useCameraGeometry;
- (BOOL)useISPMotionData;
- (BOOL)videoStabilizationDisabled;
- (BOOL)zoomSmoothingEnabled;
- (BWFigCaptureISPProcessingSession)ispProcessingSession;
- (BWPixelBufferPool)outputDepthPixelBufferPool;
- (BWPixelBufferPool)outputPixelBufferPool;
- (CGRect)livePhotoCleanOutputRect;
- (NSArray)distortionCompensationEnabledPortTypes;
- (NSArray)distortionCorrectionEnabledPortTypes;
- (NSData)cameraExtrinsicMatrix;
- (NSDictionary)cameraInfoByPortType;
- (NSDictionary)inputPixelBufferAttributes;
- (NSDictionary)outputAttachmentsPixelBufferPools;
- (NSDictionary)outputPixelBufferAttributes;
- (NSDictionary)sensorIDDict;
- (NSDictionary)videoGreenGhostMitigationParameters;
- (NSDictionary)videoSTFParameters;
- (OS_dispatch_semaphore)emitSampleBufferSemaphore;
- (float)cinematicLookAheadTime;
- (float)minDistanceForBravoParallaxShift;
- (int)gpuPriority;
- (int)motionBlurShimmerMitigationMethod;
- (int)smoothingMethod;
- (int)transformPlatform;
- (int)videoStabilizationStrength;
- (unint64_t)smartStyleMemoryPoolId;
- (unsigned)cinematicLookAheadFrameCount;
- (unsigned)extendedOutputRowsToFill;
- (unsigned)metalSubmissionAndCompletionQueuePriority;
- (void)dealloc;
- (void)setApplyFrameCropOffset:(BOOL)a3;
- (void)setAttachEstimatedMotionVector:(BOOL)a3;
- (void)setAttachStabilizedOutputCameraTrajectory:(BOOL)a3;
- (void)setAttachStabilizedTrajectoryHomography:(BOOL)a3;
- (void)setBlurBorderPixels:(BOOL)a3;
- (void)setCameraExtrinsicMatrix:(id)a3;
- (void)setCameraInfoByPortType:(id)a3;
- (void)setCinematicLookAheadFrameCount:(unsigned int)a3;
- (void)setCinematicLookAheadTime:(float)a3;
- (void)setDisableTransformLimitsForPredeterminedTrajectory:(BOOL)a3;
- (void)setDistortionCompensationEnabledPortTypes:(id)a3;
- (void)setDistortionCorrectionEnabledPortTypes:(id)a3;
- (void)setEmitSampleBufferSemaphore:(id)a3;
- (void)setEnableRollingShutterCorrectionOnly:(BOOL)a3;
- (void)setExtendedOutputRowsToFill:(unsigned int)a3;
- (void)setFrameRateConversionEnabled:(BOOL)a3;
- (void)setGpuPriority:(int)a3;
- (void)setInputPixelBufferAttributes:(id)a3;
- (void)setIspProcessingSession:(id)a3;
- (void)setLivePhotoCleanOutputRect:(CGRect)a3;
- (void)setLowResImageUsedByVideoEncoderEnabled:(BOOL)a3;
- (void)setMetalSubmissionAndCompletionQueuePriority:(unsigned int)a3;
- (void)setMinDistanceForBravoParallaxShift:(float)a3;
- (void)setMotionBlurShimmerMitigationMethod:(int)a3;
- (void)setOnlyGenerateTransformsParameters:(BOOL)a3;
- (void)setOutputAttachmentsPixelBufferPools:(id)a3;
- (void)setOutputDepthPixelBufferPool:(id)a3;
- (void)setOutputPixelBufferAttributes:(id)a3;
- (void)setOutputPixelBufferPool:(id)a3;
- (void)setP3ToBT2020ConversionEnabled:(BOOL)a3;
- (void)setSensorIDDict:(id)a3;
- (void)setSmartStyleMemoryPoolId:(unint64_t)a3;
- (void)setSmartStyleRenderingEnabled:(BOOL)a3;
- (void)setSmartStyleReversibilityEnabled:(BOOL)a3;
- (void)setSmoothingMethod:(int)a3;
- (void)setSphereCorrectionEnabled:(BOOL)a3;
- (void)setSphereVideoEnabled:(BOOL)a3;
- (void)setTransformPlatform:(int)a3;
- (void)setUseCameraGeometry:(BOOL)a3;
- (void)setUseISPMotionData:(BOOL)a3;
- (void)setVideoGreenGhostMitigationParameters:(id)a3;
- (void)setVideoSTFParameters:(id)a3;
- (void)setVideoStabilizationDisabled:(BOOL)a3;
- (void)setVideoStabilizationStrength:(int)a3;
- (void)setZoomSmoothingEnabled:(BOOL)a3;
@end

@implementation BWVISProcessorControllerConfiguration

- (void)setZoomSmoothingEnabled:(BOOL)a3
{
  self->_zoomSmoothingEnabled = a3;
}

- (void)setVideoStabilizationStrength:(int)a3
{
  self->_videoStabilizationStrength = a3;
}

- (void)setUseISPMotionData:(BOOL)a3
{
  self->_useISPMotionData = a3;
}

- (void)setUseCameraGeometry:(BOOL)a3
{
  self->_useCameraGeometry = a3;
}

- (void)setSphereCorrectionEnabled:(BOOL)a3
{
  self->_sphereCorrectionEnabled = a3;
}

- (void)setSmoothingMethod:(int)a3
{
  self->_smoothingMethod = a3;
}

- (void)setSensorIDDict:(id)a3
{
}

- (void)setMotionBlurShimmerMitigationMethod:(int)a3
{
  self->_motionBlurShimmerMitigationMethod = a3;
}

- (void)setMinDistanceForBravoParallaxShift:(float)a3
{
  self->_minDistanceForBravoParallaxShift = a3;
}

- (void)setMetalSubmissionAndCompletionQueuePriority:(unsigned int)a3
{
  self->_metalSubmissionAndCompletionQueuePriority = a3;
}

- (void)setLivePhotoCleanOutputRect:(CGRect)a3
{
  self->_livePhotoCleanOutputRect = a3;
}

- (void)setIspProcessingSession:(id)a3
{
}

- (void)setEnableRollingShutterCorrectionOnly:(BOOL)a3
{
  self->_enableRollingShutterCorrectionOnly = a3;
}

- (void)setDisableTransformLimitsForPredeterminedTrajectory:(BOOL)a3
{
  self->_disableTransformLimitsForPredeterminedTrajectory = a3;
}

- (void)setCinematicLookAheadTime:(float)a3
{
  self->_cinematicLookAheadTime = a3;
}

- (void)setCinematicLookAheadFrameCount:(unsigned int)a3
{
  self->_cinematicLookAheadFrameCount = a3;
}

- (void)setCameraInfoByPortType:(id)a3
{
}

- (void)setBlurBorderPixels:(BOOL)a3
{
  self->_blurBorderPixels = a3;
}

- (void)setAttachStabilizedOutputCameraTrajectory:(BOOL)a3
{
  self->_attachStabilizedOutputCameraTrajectory = a3;
}

- (void)setApplyFrameCropOffset:(BOOL)a3
{
  self->_applyFrameCropOffset = a3;
}

- (BOOL)useCameraGeometry
{
  return self->_useCameraGeometry;
}

- (void)setOnlyGenerateTransformsParameters:(BOOL)a3
{
  self->_onlyGenerateTransformsParameters = a3;
}

- (void)setAttachStabilizedTrajectoryHomography:(BOOL)a3
{
  self->_attachStabilizedTrajectoryHomography = a3;
}

- (void)setAttachEstimatedMotionVector:(BOOL)a3
{
  self->_attachEstimatedMotionVector = a3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWVISProcessorControllerConfiguration;
  [(BWVISProcessorControllerConfiguration *)&v3 dealloc];
}

- (int)transformPlatform
{
  return self->_transformPlatform;
}

- (void)setTransformPlatform:(int)a3
{
  self->_transformPlatform = a3;
}

- (int)smoothingMethod
{
  return self->_smoothingMethod;
}

- (int)motionBlurShimmerMitigationMethod
{
  return self->_motionBlurShimmerMitigationMethod;
}

- (BWFigCaptureISPProcessingSession)ispProcessingSession
{
  return self->_ispProcessingSession;
}

- (NSDictionary)inputPixelBufferAttributes
{
  return self->_inputPixelBufferAttributes;
}

- (void)setInputPixelBufferAttributes:(id)a3
{
}

- (NSDictionary)outputPixelBufferAttributes
{
  return self->_outputPixelBufferAttributes;
}

- (void)setOutputPixelBufferAttributes:(id)a3
{
}

- (BWPixelBufferPool)outputPixelBufferPool
{
  return self->_outputPixelBufferPool;
}

- (void)setOutputPixelBufferPool:(id)a3
{
}

- (BWPixelBufferPool)outputDepthPixelBufferPool
{
  return self->_outputDepthPixelBufferPool;
}

- (void)setOutputDepthPixelBufferPool:(id)a3
{
}

- (NSDictionary)outputAttachmentsPixelBufferPools
{
  return self->_outputAttachmentsPixelBufferPools;
}

- (void)setOutputAttachmentsPixelBufferPools:(id)a3
{
}

- (NSDictionary)sensorIDDict
{
  return self->_sensorIDDict;
}

- (float)cinematicLookAheadTime
{
  return self->_cinematicLookAheadTime;
}

- (unsigned)cinematicLookAheadFrameCount
{
  return self->_cinematicLookAheadFrameCount;
}

- (BOOL)useISPMotionData
{
  return self->_useISPMotionData;
}

- (BOOL)sphereCorrectionEnabled
{
  return self->_sphereCorrectionEnabled;
}

- (BOOL)sphereVideoEnabled
{
  return self->_sphereVideoEnabled;
}

- (void)setSphereVideoEnabled:(BOOL)a3
{
  self->_sphereVideoEnabled = a3;
}

- (BOOL)frameRateConversionEnabled
{
  return self->_frameRateConversionEnabled;
}

- (void)setFrameRateConversionEnabled:(BOOL)a3
{
  self->_frameRateConversionEnabled = a3;
}

- (BOOL)smartStyleRenderingEnabled
{
  return self->_smartStyleRenderingEnabled;
}

- (void)setSmartStyleRenderingEnabled:(BOOL)a3
{
  self->_smartStyleRenderingEnabled = a3;
}

- (BOOL)smartStyleReversibilityEnabled
{
  return self->_smartStyleReversibilityEnabled;
}

- (void)setSmartStyleReversibilityEnabled:(BOOL)a3
{
  self->_smartStyleReversibilityEnabled = a3;
}

- (unint64_t)smartStyleMemoryPoolId
{
  return self->_smartStyleMemoryPoolId;
}

- (void)setSmartStyleMemoryPoolId:(unint64_t)a3
{
  self->_smartStyleMemoryPoolId = a3;
}

- (BOOL)lowResImageUsedByVideoEncoderEnabled
{
  return self->_lowResImageUsedByVideoEncoderEnabled;
}

- (void)setLowResImageUsedByVideoEncoderEnabled:(BOOL)a3
{
  self->_lowResImageUsedByVideoEncoderEnabled = a3;
}

- (BOOL)videoStabilizationDisabled
{
  return self->_videoStabilizationDisabled;
}

- (void)setVideoStabilizationDisabled:(BOOL)a3
{
  self->_videoStabilizationDisabled = a3;
}

- (BOOL)blurBorderPixels
{
  return self->_blurBorderPixels;
}

- (CGRect)livePhotoCleanOutputRect
{
  double x = self->_livePhotoCleanOutputRect.origin.x;
  double y = self->_livePhotoCleanOutputRect.origin.y;
  double width = self->_livePhotoCleanOutputRect.size.width;
  double height = self->_livePhotoCleanOutputRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)onlyGenerateTransformsParameters
{
  return self->_onlyGenerateTransformsParameters;
}

- (BOOL)attachStabilizedOutputCameraTrajectory
{
  return self->_attachStabilizedOutputCameraTrajectory;
}

- (BOOL)attachStabilizedTrajectoryHomography
{
  return self->_attachStabilizedTrajectoryHomography;
}

- (BOOL)attachEstimatedMotionVector
{
  return self->_attachEstimatedMotionVector;
}

- (BOOL)p3ToBT2020ConversionEnabled
{
  return self->_p3ToBT2020ConversionEnabled;
}

- (void)setP3ToBT2020ConversionEnabled:(BOOL)a3
{
  self->_p3ToBT2020ConversionEnabled = a3;
}

- (int)gpuPriority
{
  return self->_gpuPriority;
}

- (void)setGpuPriority:(int)a3
{
  self->_gpuPrioritdouble y = a3;
}

- (unsigned)metalSubmissionAndCompletionQueuePriority
{
  return self->_metalSubmissionAndCompletionQueuePriority;
}

- (unsigned)extendedOutputRowsToFill
{
  return self->_extendedOutputRowsToFill;
}

- (void)setExtendedOutputRowsToFill:(unsigned int)a3
{
  self->_extendedOutputRowsToFill = a3;
}

- (OS_dispatch_semaphore)emitSampleBufferSemaphore
{
  return self->_emitSampleBufferSemaphore;
}

- (void)setEmitSampleBufferSemaphore:(id)a3
{
}

- (NSDictionary)cameraInfoByPortType
{
  return self->_cameraInfoByPortType;
}

- (NSArray)distortionCorrectionEnabledPortTypes
{
  return self->_distortionCorrectionEnabledPortTypes;
}

- (void)setDistortionCorrectionEnabledPortTypes:(id)a3
{
}

- (NSArray)distortionCompensationEnabledPortTypes
{
  return self->_distortionCompensationEnabledPortTypes;
}

- (void)setDistortionCompensationEnabledPortTypes:(id)a3
{
}

- (float)minDistanceForBravoParallaxShift
{
  return self->_minDistanceForBravoParallaxShift;
}

- (NSDictionary)videoSTFParameters
{
  return self->_videoSTFParameters;
}

- (void)setVideoSTFParameters:(id)a3
{
}

- (NSDictionary)videoGreenGhostMitigationParameters
{
  return self->_videoGreenGhostMitigationParameters;
}

- (void)setVideoGreenGhostMitigationParameters:(id)a3
{
}

- (int)videoStabilizationStrength
{
  return self->_videoStabilizationStrength;
}

- (BOOL)zoomSmoothingEnabled
{
  return self->_zoomSmoothingEnabled;
}

- (BOOL)applyFrameCropOffset
{
  return self->_applyFrameCropOffset;
}

- (NSData)cameraExtrinsicMatrix
{
  return self->_cameraExtrinsicMatrix;
}

- (void)setCameraExtrinsicMatrix:(id)a3
{
}

- (BOOL)enableRollingShutterCorrectionOnly
{
  return self->_enableRollingShutterCorrectionOnly;
}

- (BOOL)disableTransformLimitsForPredeterminedTrajectory
{
  return self->_disableTransformLimitsForPredeterminedTrajectory;
}

@end