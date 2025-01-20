@interface BWFigVideoCaptureStream
+ (void)initialize;
- ($115C4C562B26FF47E01F9F4EA65B5887)clientAuditToken;
- ($2825F4736939C4A6D3AD43837233062D)activeSensorDimensions;
- ($2825F4736939C4A6D3AD43837233062D)physicalSensorDimensions;
- ($2825F4736939C4A6D3AD43837233062D)sensorDimensions;
- ($2825F4736939C4A6D3AD43837233062D)videoCaptureDimensions;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastStillImagePTS;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)maxExposureDuration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)maxExposureDurationClientOverride;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)maxExposureDurationFrameworkOverride;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)updateMaxExposureDuration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)updateMaxExposureDurationClientOverride:(SEL)a3;
- (BOOL)aeStatisticsEnabled;
- (BOOL)avoidsSphereRecentering;
- (BOOL)backgroundBlurEnabled;
- (BOOL)backgroundReplacementEnabled;
- (BOOL)blackenFramesForContinuityDisplayConnected;
- (BOOL)cinematicFramingEnabled;
- (BOOL)cinematicVideoEnabled;
- (BOOL)clientProcessHasAccessToCamera;
- (BOOL)colorSpaceIsAppleLog;
- (BOOL)continuityCameraIsWired;
- (BOOL)depthDataDeliveryEnabled;
- (BOOL)digitalFlashEnabled;
- (BOOL)enablesSphereWhenAvailable;
- (BOOL)eyeDetectionRequired;
- (BOOL)faceDetectionEnabled;
- (BOOL)firmwareTimeMachineEnabledWhenConfiguredAsSlave;
- (BOOL)focusBlurMapEnabled;
- (BOOL)gesturesEnabled;
- (BOOL)hasFocus;
- (BOOL)hasOpticalCenterOffsetCalibratedForNarrowerFieldOfView;
- (BOOL)hasSphere;
- (BOOL)highlightRecoveryEnabled;
- (BOOL)highlightRecoveryEnabledWhenConfiguredAsMasterOrSingleStream;
- (BOOL)highlightRecoveryEnabledWhenConfiguredAsSlave;
- (BOOL)highlightRecoverySuspended;
- (BOOL)isCMIOZoomFactorSupported;
- (BOOL)isDeskCamActive;
- (BOOL)isMultipleSensorRawBufferPoolsSupported;
- (BOOL)isNondisruptiveFastSwitchingSupported;
- (BOOL)isStationary;
- (BOOL)isSynchronizationMaster;
- (BOOL)keypointDetectionEnabled;
- (BOOL)lowLightVideoEnabled;
- (BOOL)motionDataDeliveryEnabled;
- (BOOL)motionDataInvalid;
- (BOOL)objectDetectionStartupDeferred;
- (BOOL)overCaptureEnabled;
- (BOOL)pixelFormatIsTenBit;
- (BOOL)providesPreBracketedEV0;
- (BOOL)rawBufferCompandingEnabled;
- (BOOL)rawFocusScoresEnabled;
- (BOOL)reactionEffectsEnabled;
- (BOOL)sourceNodeShouldDiscardStillImageSampleBuffer:(opaqueCMSampleBuffer *)a3 sensorRawOutput:(BOOL)a4;
- (BOOL)sphereEnabled;
- (BOOL)sphereVideoEnabled;
- (BOOL)sphereVideoSupported;
- (BOOL)started;
- (BOOL)stillImageCaptureEnabled;
- (BOOL)stillImageKeypointDetectionEnabled;
- (BOOL)streamingRequiredWhenConfiguredAsSlave;
- (BOOL)studioLightingEnabled;
- (BOOL)suspended;
- (BOOL)suspendingSupported;
- (BOOL)synchronizedStreamsEnabled;
- (BOOL)timeLapseEnabled;
- (BOOL)timeMachineEnabled;
- (BOOL)unifiedBracketingEnabled;
- (BOOL)usePinholeCameraFocalLengthInIntrinsicMatrixCalculation;
- (BOOL)usesStillFusionReferenceFramePTSForDidCaptureCallback;
- (BOOL)variableFrameRateVideoEnabled;
- (BOOL)videoHDRFusionEnabled;
- (BOOL)videoHDRImageStatisticsEnabled;
- (BOOL)visionDataRequiredWhenConfiguredAsSlave;
- (BOOL)visualIntelligenceCameraEnabled;
- (BOOL)zeroShutterLagEnabled;
- (BWFaceDetector)faceDetector;
- (BWFigCaptureStream)stream;
- (BWFigVideoCaptureStream)initWithCaptureStream:(id)a3 parentDevice:(id)a4 attributes:(id)a5 sensorIDDictionary:(id)a6 synchronizedStreamsGroup:(id)a7 applicationID:(id)a8 clientAuditToken:(id *)a9 tccIdentity:(id)a10 mediaEnvironment:(id)a11 error:(int *)a12;
- (BWFigVideoCaptureStreamDelegate)delegate;
- (BWFigVideoCaptureStreamStillImageCaptureDelegate)stillImageCaptureDelegate;
- (BWObjectDetector)objectDetector;
- (BWSecureMetadataOutputConfigurator)secureMetadataOutputConfigurator;
- (CGPoint)opticalCenterOffset;
- (CGPoint)opticalCenterOffsetCalibratedForNarrowerFieldOfView;
- (CGPoint)opticalCenterOffsetCalibratedForNarrowerFieldOfViewInPhysicalSensorDimensions;
- (CGPoint)opticalCenterOffsetInPhysicalSensorDimensions;
- (CGPoint)previewShift;
- (CGPoint)previewShiftAtBaseZoom;
- (CGRect)centerStageRectOfInterest;
- (NSArray)nondisruptiveSwitchingZoomFactors;
- (NSArray)supportedFormats;
- (NSArray)supportedOutputs;
- (NSData)cameraPoseMatrix;
- (NSData)cameraViewMatrix;
- (NSData)cameraViewMatrixCalibratedForNarrowerFieldOfView;
- (NSData)flashCalibrationData;
- (NSDictionary)faceDetectionConfiguration;
- (NSDictionary)geometricDistortionCoefficients;
- (NSDictionary)geometricDistortionCoefficientsCalibratedForNarrowerFieldOfView;
- (NSDictionary)moduleInfo;
- (NSDictionary)sensorColorCalibrationData;
- (NSDictionary)sensorIDDictionary;
- (NSDictionary)zoomFactorToNondisruptiveSwitchingFormatIndexSIFRBinned;
- (NSDictionary)zoomFactorToNondisruptiveSwitchingFormatIndexSIFRNonBinned;
- (NSNumber)calibrationValidRadiusForFullFieldOfView;
- (NSNumber)calibrationValidRadiusForNarrowerFieldOfView;
- (NSSet)detectedObjectTypes;
- (NSString)description;
- (NSString)mediaEnvironment;
- (NSString)nonLocalizedName;
- (NSString)portType;
- (NSString)sensorIDString;
- (NSString)uniqueID;
- (OS_tcc_identity)tccIdentity;
- _updateAutoFocusPositionSensorModeForSampleBuffer:(_DWORD *)result;
- (__CFString)currentNonLowPowerSphereMode;
- (__CFString)currentSphereMode;
- (double)_convertOpticalCenterOffsetToPhysicalSensorDimensions:(uint64_t)a1;
- (double)_convertOpticalCenterToOpticalCenterOffset:(double)a3 error:(double)a4;
- (float)activeStillImageScaleFactor;
- (float)aeMaxGain;
- (float)averageFrameRate;
- (float)baseZoomFactor;
- (float)baseZoomFactorAfterGDC;
- (float)calibratedRotationAngle;
- (float)cmioZoomFactor;
- (float)exifFocalLengthMultiplier;
- (float)focalLength;
- (float)gravityFactor;
- (float)lensFNumber;
- (float)maxEIT;
- (float)maximumFrameRate;
- (float)maximumFrameRateForSensorRawOutputBufferPoolRequirements;
- (float)maximumSupportedFrameRate;
- (float)minimumFrameRate;
- (float)minimumSupportedFrameRate;
- (float)momentCaptureVideoRecordingAEMaxGain;
- (float)pixelSize;
- (float)pixelsPerMicron;
- (float)streamingFrameRateForZoomPIPOverlay;
- (id)_setMaxExposureDuration:(double)a3;
- (id)noiseReductionAndSharpeningConfigurationForType:(int)a3 gain:(float)a4;
- (id)noiseReductionAndSharpeningConfigurationForType:(int)a3 gain:(float)a4 qSub:(BOOL)a5;
- (id)stillImageBufferTimeMachineHandler;
- (int)activeFormatIndex;
- (int)activeNondisruptiveSwitchingCommandID;
- (int)activeNondisruptiveSwitchingFormatIndex;
- (int)activeQuadraBinningFactor;
- (int)activeStillImageCaptureType;
- (int)autoFocusPositionSensorMode;
- (int)centerStageFramingMode;
- (int)completedNondisruptiveSwitchingCommandID;
- (int)continuityCameraClientDeviceClass;
- (int)deviceType;
- (int)fastSwitchingMainFormatIndex;
- (int)lastStillImageCaptureType;
- (int)mainToSIFRFrameRateRatio;
- (int)masterToSlaveFrameRateRatio;
- (int)multiBandNoiseReductionMode;
- (int)setActiveFormatIndex:(int)a3;
- (int)setActiveNondisruptiveSwitchingFormatIndex:(int)a3;
- (int)setActiveNondisruptiveSwitchingFormatIndex:(int)a3 maximumAllowedFrameRate:(int)a4 minimumFrameRate:(int)a5 maximumFrameRate:(int)a6;
- (int)setSuspended:(BOOL)a3;
- (int)sourceNodeWillEmitDepthSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (int)sourceNodeWillEmitPointCloudSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (int)sourceNodeWillEmitStillImageSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (int)sourceNodeWillEmitVideoSampleBuffer:(opaqueCMSampleBuffer *)a3 drivesCameraControls:(BOOL)a4 deliversStills:(BOOL)a5;
- (int)sphereThermalLevel;
- (int)start;
- (int)stop;
- (int)synchronizedStreamsGroupDidUpdateActiveNondisruptiveSwitchingFormatIndex:(int)a3 activeNondisruptiveSwitchingCommandID:(int)a4 maximumAllowedFrameRate:(int)a5 minimumFrameRate:(int)a6 maximumFrameRate:(int)a7;
- (int)timeMachineCapacity;
- (int)videoStabilizationStrength;
- (uint64_t)_activeFormatIndexWithNondisruptiveSwitching;
- (uint64_t)_addBracketecCaptureSequenceNumberToMetadataIfNeededForStillImageSampleBuffer:(uint64_t)result;
- (uint64_t)_aeTables;
- (uint64_t)_configureKeypointDetection;
- (uint64_t)_handleStillImageSampleBuffer:(uint64_t)a3 withError:(uint64_t)a4 fromTimeMachine:;
- (uint64_t)_propagateFaceAndObjectDetectionSettings;
- (uint64_t)_setHighlightRecoveryEnabled:(uint64_t)result;
- (uint64_t)_updateAETables;
- (uint64_t)_updateMasterSlavePropertiesOnStream;
- (uint64_t)_updateSuspendStateForInfraredDepthStream;
- (unsigned)reactionCount;
- (unsigned)sensorInterfaceRawPixelFormat;
- (void)_captureStreamFaceDetectionConfiguration;
- (void)_captureStreamObjectDetectionConfiguration;
- (void)_logStreamingPowerEvent:(uint64_t)a1;
- (void)_prepareForStillImageCaptureWithStillImageSettings:(char)a3 fromCMTimeMachine:;
- (void)_recomputeOpticalCenterOffsets;
- (void)_resetStillImageCaptureState;
- (void)_serviceTimeMachineWithSampleBuffer:(uint64_t)a1;
- (void)_setLowPowerSphereModeEnabled:(uint64_t)a1;
- (void)_updateMotionDataStatus:(uint64_t)a1;
- (void)_updateSphereMode;
- (void)captureStillImageFromTimeMachineWithStillImageSettings:(id)a3;
- (void)captureStreamDidStart;
- (void)captureStreamDidStop;
- (void)dealloc;
- (void)didBecomeMasterStream;
- (void)didBecomeSlaveStream;
- (void)failedToCaptureStillImageFromFirmwareWithError:(int)a3;
- (void)performReactionEffect:(id)a3;
- (void)prepareForStillImageCaptureFromFirmwareWithStillImageSettings:(id)a3;
- (void)resignStreamStartStopDelegate;
- (void)serviceNondisruptiveSwitchingFormatForZoomFactor:(float)a3 frameStatistics:(id)a4 imageControlMode:(int)a5 stillImageDigitalFlashMode:(int)a6 isStationary:(BOOL)a7 binnedSIFROnSecondaryStreamAllowed:(BOOL)a8 ignoreZoomFactorAndQuadraSubPixelSceneMonitoring:(BOOL)a9 ultraHighResolutionZeroShutterLagEnabled:(BOOL)a10;
- (void)setAeMaxGain:(float)a3;
- (void)setAeStatisticsEnabled:(BOOL)a3;
- (void)setAvoidsSphereRecentering:(BOOL)a3;
- (void)setBackgroundBlurEnabled:(BOOL)a3;
- (void)setBackgroundReplacementEnabled:(BOOL)a3;
- (void)setBaseZoomFactor:(float)a3;
- (void)setBaseZoomFactorAfterGDC:(float)a3;
- (void)setBlackenFramesForContinuityDisplayConnected:(BOOL)a3;
- (void)setCenterStageFramingMode:(int)a3;
- (void)setCenterStageRectOfInterest:(CGRect)a3;
- (void)setCinematicFramingEnabled:(BOOL)a3;
- (void)setCinematicVideoEnabled:(BOOL)a3;
- (void)setCmioZoomFactor:(float)a3;
- (void)setColorSpaceIsAppleLog:(BOOL)a3;
- (void)setCompletedNondisruptiveSwitchingCommandID:(int)a3;
- (void)setContinuityCameraClientDeviceClass:(int)a3;
- (void)setContinuityCameraIsWired:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDepthDataDeliveryEnabled:(BOOL)a3;
- (void)setDeskCamActive:(BOOL)a3;
- (void)setDetectedObjectTypes:(id)a3;
- (void)setDigitalFlashEnabled:(BOOL)a3;
- (void)setEnablesSphereWhenAvailable:(BOOL)a3;
- (void)setEyeDetectionRequired:(BOOL)a3;
- (void)setFaceDetectionConfiguration:(id)a3;
- (void)setFaceDetectionEnabled:(BOOL)a3;
- (void)setFaceDetector:(id)a3;
- (void)setFastSwitchingMainFormatIndex:(int)a3;
- (void)setFirmwareTimeMachineEnabledWhenConfiguredAsSlave:(BOOL)a3;
- (void)setFocusBlurMapEnabled:(BOOL)a3;
- (void)setGesturesEnabled:(BOOL)a3;
- (void)setHighlightRecoveryEnabledWhenConfiguredAsMasterOrSingleStream:(BOOL)a3;
- (void)setHighlightRecoveryEnabledWhenConfiguredAsSlave:(BOOL)a3;
- (void)setHighlightRecoverySuspended:(BOOL)a3;
- (void)setIsStationary:(BOOL)a3;
- (void)setKeypointDetectionEnabled:(BOOL)a3;
- (void)setLowLightVideoEnabled:(BOOL)a3;
- (void)setMainToSIFRFrameRateRatio:(int)a3;
- (void)setMasterToSlaveFrameRateRatio:(int)a3;
- (void)setMaxExposureDurationClientOverride:(id *)a3;
- (void)setMaxExposureDurationFrameworkOverride:(id *)a3;
- (void)setMaximumFrameRate:(float)a3;
- (void)setMaximumFrameRateForSensorRawOutputBufferPoolRequirements:(float)a3;
- (void)setMaximumSupportedFrameRate:(float)a3;
- (void)setMinimumFrameRate:(float)a3;
- (void)setMinimumSupportedFrameRate:(float)a3;
- (void)setMomentCaptureVideoRecordingAEMaxGain:(float)a3;
- (void)setMotionDataDeliveryEnabled:(BOOL)a3;
- (void)setMultiBandNoiseReductionMode:(int)a3;
- (void)setObjectDetectionStartupDeferred:(BOOL)a3;
- (void)setObjectDetector:(id)a3;
- (void)setOverCaptureEnabled:(BOOL)a3;
- (void)setPhysicalSensorDimensions:(id)a3;
- (void)setPixelFormatIsTenBit:(BOOL)a3;
- (void)setPreviewShift:(CGPoint)a3;
- (void)setPreviewShiftAtBaseZoom:(CGPoint)a3;
- (void)setRawFocusScoresEnabled:(BOOL)a3;
- (void)setReactionEffectsEnabled:(BOOL)a3;
- (void)setReactionsInProgressChangedHandler:(id)a3;
- (void)setRuntimeUpdates:(id)a3;
- (void)setSensorDimensions:(id)a3;
- (void)setSphereThermalLevel:(int)a3;
- (void)setSphereVideoEnabled:(BOOL)a3;
- (void)setStillImageBufferTimeMachineHandler:(id)a3;
- (void)setStillImageCaptureDelegate:(id)a3;
- (void)setStillImageCaptureEnabled:(BOOL)a3;
- (void)setStillImageKeypointDetectionEnabled:(BOOL)a3;
- (void)setStreamingFrameRateForZoomPIPOverlay:(float)a3;
- (void)setStreamingRequiredWhenConfiguredAsSlave:(BOOL)a3;
- (void)setStudioLightingEnabled:(BOOL)a3;
- (void)setTemporalNoiseReductionConfigurationBand0Enabled:(BOOL)a3 rawEnabled:(BOOL)a4 modulation:(int)a5 adaptiveOverscanEnabled:(BOOL)a6 strengthHighEnabled:(BOOL)a7;
- (void)setTimeLapseEnabled:(BOOL)a3;
- (void)setTimeMachineEnabled:(BOOL)a3;
- (void)setUnifiedBracketingEnabled:(BOOL)a3;
- (void)setUsesStillFusionReferenceFramePTSForDidCaptureCallback:(BOOL)a3;
- (void)setVariableFrameRateVideoEnabled:(BOOL)a3;
- (void)setVideoCaptureDimensions:(id)a3;
- (void)setVideoHDRFusionEnabled:(BOOL)a3;
- (void)setVideoHDRImageStatisticsEnabled:(BOOL)a3;
- (void)setVideoStabilizationStrength:(int)a3;
- (void)setVisionDataKeypointDetectionThreshold:(float)a3;
- (void)setVisionDataRequiredWhenConfiguredAsSlave:(BOOL)a3;
- (void)setVisionDataSuspended:(BOOL)a3;
- (void)setVisualIntelligenceCameraEnabled:(BOOL)a3;
- (void)setZeroShutterLagEnabled:(BOOL)a3;
- (void)setZoomFactorToNondisruptiveSwitchingFormatIndexSIFRBinned:(id)a3 zoomFactorToNondisruptiveSwitchingFormatIndexSIFRNonBinned:(id)a4 ultraHighResolutionNondisruptiveStreamingFormatIndex:(int)a5 mainFormatSIFRBinningFactor:(int)a6 quadraSubPixelSwitchingParameters:(id)a7;
- (void)sourceNodeDidDropFrameWithPTS:(id *)a3;
- (void)sourceNodeDidStartStreaming;
- (void)sourceNodeDidStopStreaming:(BOOL)a3;
- (void)sourceNodeFailedToStartStreaming;
- (void)sourceNodeWillDiscardVideoSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (void)sourceNodeWillEmitDetectedFacesSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (void)sourceNodeWillEmitStillImageQuadraBufferProcessingError:(int)a3;
- (void)sourceNodeWillStartStreaming;
- (void)sourceNodeWillStopStreaming;
- (void)triggerVisionDataBurst;
- (void)updateClientAuditToken:(id *)a3;
- (void)willBecomeMasterStream;
- (void)willBecomeSlaveStream;
- (void)willCaptureStillImageFromFirmware;
@end

@implementation BWFigVideoCaptureStream

- (void)setStudioLightingEnabled:(BOOL)a3
{
  BYTE5(self->_centerStageRectOfInterest.size.width) = a3;
}

- (void)setReactionEffectsEnabled:(BOOL)a3
{
  BYTE6(self->_centerStageRectOfInterest.size.width) = a3;
}

- (void)setBackgroundReplacementEnabled:(BOOL)a3
{
  LOBYTE(self->_centerStageRectOfInterest.size.height) = a3;
}

- (void)setBackgroundBlurEnabled:(BOOL)a3
{
  BYTE4(self->_centerStageRectOfInterest.size.width) = a3;
}

- (NSArray)supportedFormats
{
  return self->_supportedFormats;
}

- (float)pixelSize
{
  return self->_pixelSize;
}

- (void)setPreviewShiftAtBaseZoom:(CGPoint)a3
{
  CGPoint v3 = a3;
  objc_copyStruct(&self->_previewShift, &v3, 16, 1, 0);
}

- (void)setPreviewShift:(CGPoint)a3
{
  if (a3.x != *(double *)&self->_nondisruptiveSwitchingFormatSelector
    || a3.y != *(double *)&self->_mainFormatSIFRBinningFactor)
  {
    *(CGPoint *)&self->_nondisruptiveSwitchingFormatSelector = a3;
    -[BWFigVideoCaptureStreamDelegate captureStream:didUpdatePreviewShift:](self->_delegate, "captureStream:didUpdatePreviewShift:", self);
  }
}

- (BOOL)usePinholeCameraFocalLengthInIntrinsicMatrixCalculation
{
  return self->_usePinholeCameraFocalLengthInIntrinsicMatrixCalculation;
}

- (int)deviceType
{
  return self->_deviceType;
}

- (BOOL)isSynchronizationMaster
{
  return BYTE4(self->_lastFaceDetectionEnabled);
}

- (int)activeNondisruptiveSwitchingCommandID
{
  v2 = self;
  p_activeNondisruptiveSwitchingFormatIndexLock = &self->_activeNondisruptiveSwitchingFormatIndexLock;
  os_unfair_lock_lock(&self->_activeNondisruptiveSwitchingFormatIndexLock);
  LODWORD(v2) = v2->_activeNondisruptiveSwitchingCommandID;
  os_unfair_lock_unlock(p_activeNondisruptiveSwitchingFormatIndexLock);
  return (int)v2;
}

- (void)setCompletedNondisruptiveSwitchingCommandID:(int)a3
{
  self->_completedNondisruptiveSwitchingCommandID = a3;
}

- (int)completedNondisruptiveSwitchingCommandID
{
  return self->_completedNondisruptiveSwitchingCommandID;
}

- (NSString)portType
{
  return self->_portType;
}

- (BOOL)streamingRequiredWhenConfiguredAsSlave
{
  return BYTE4(self->_synchronizedStreamsGroup);
}

- (void)setMasterToSlaveFrameRateRatio:(int)a3
{
  if (LODWORD(self->_synchronizedStreamsGroup) != a3)
  {
    LODWORD(self->_synchronizedStreamsGroup) = a3;
    -[BWFigVideoCaptureStream _updateMasterSlavePropertiesOnStream]((uint64_t)self);
    if ([(BWFigVideoCaptureStream *)self suspendingSupported])
    {
      if ([(NSString *)self->_portType isEqualToString:*MEMORY[0x1E4F52E00]])
      {
        -[BWFigVideoCaptureStream _updateSuspendStateForInfraredDepthStream]((uint64_t)self);
      }
    }
  }
}

- (BOOL)firmwareTimeMachineEnabledWhenConfiguredAsSlave
{
  return BYTE6(self->_synchronizedStreamsGroup);
}

- (int)masterToSlaveFrameRateRatio
{
  return (int)self->_synchronizedStreamsGroup;
}

- (float)streamingFrameRateForZoomPIPOverlay
{
  return self->_averageFrameRate;
}

- (uint64_t)_setHighlightRecoveryEnabled:(uint64_t)result
{
  if (result)
  {
    char v2 = a2;
    uint64_t v3 = result;
    if (*(unsigned char *)(result + 795)) {
      uint64_t v4 = 0;
    }
    else {
      uint64_t v4 = a2;
    }
    result = objc_msgSend(*(id *)(result + 8), "setPropertyIfSupported:value:", *MEMORY[0x1E4F549A0], objc_msgSend(NSNumber, "numberWithBool:", v4));
    if (!result) {
      *(unsigned char *)(v3 + 796) = v2;
    }
  }
  return result;
}

- (uint64_t)_updateMasterSlavePropertiesOnStream
{
  if (result)
  {
    uint64_t v1 = result;
    if (*(unsigned char *)(result + 336))
    {
      -[BWFigVideoCaptureStream _setLowPowerSphereModeEnabled:](result, *(unsigned char *)(result + 756) == 0);
      uint64_t v2 = 798;
    }
    else
    {
      if ([*(id *)(result + 440) lowPowerSphereModeEnabled])
      {
        [*(id *)(v1 + 440) setLowPowerSphereModeEnabled:0];
        -[BWFigVideoCaptureStream _updateSphereMode](v1);
      }
      uint64_t v2 = 797;
    }
    unsigned int v3 = *(unsigned __int8 *)(v1 + v2);
    return -[BWFigVideoCaptureStream _setHighlightRecoveryEnabled:](v1, v3);
  }
  return result;
}

- (float)maximumFrameRate
{
  return self->_maximumFrameRate;
}

- (float)minimumFrameRate
{
  return self->_minimumFrameRate;
}

- (BOOL)suspendingSupported
{
  return !BYTE4(self->_lastFaceDetectionEnabled) && LOBYTE(self->_stillImageBufferTimeMachineHandler) == 0;
}

- (void)_setLowPowerSphereModeEnabled:(uint64_t)a1
{
  if (a1 && [*(id *)(a1 + 440) lowPowerSphereModeEnabled] != a2)
  {
    [*(id *)(a1 + 440) setLowPowerSphereModeEnabled:a2];
    -[BWFigVideoCaptureStream _updateSphereMode](a1);
  }
}

- (uint64_t)_updateSuspendStateForInfraredDepthStream
{
  if (result)
  {
    uint64_t v1 = (_DWORD *)result;
    unsigned int v2 = objc_msgSend((id)objc_msgSend(*(id *)(result + 8), "getPropertyIfSupported:error:", *MEMORY[0x1E4F54BF0], 0), "BOOLValue") ^ 1;
    if (v1[188] == 0x7FFFFFFF) {
      uint64_t v3 = v2;
    }
    else {
      uint64_t v3 = 0;
    }
    return [v1 setSuspended:v3];
  }
  return result;
}

- (int)setSuspended:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  int v42 = 0;
  if (![(BWFigVideoCaptureStream *)self suspendingSupported])
  {
    FigDebugAssert3();
    return -12782;
  }
  if (self->_suspended != v3)
  {
    if (self->_started)
    {
      uint64_t v5 = *(void *)&self->_faceAndObjectDetectionLock._os_unfair_lock_opaque;
      if (v3)
      {

        self->_cachedVideoOutputsEnabled = (NSDictionary *)[(BWFigCaptureStream *)self->_stream copyProperty:*MEMORY[0x1E4F54CD8] error:&v42];
        if (!v42)
        {
          id v6 = [(BWFigCaptureStream *)self->_stream getProperty:*MEMORY[0x1E4F54CB8] error:&v42];
          if (!v42)
          {
            v7 = v6;
            uint64_t v31 = v5;
            BOOL v32 = v3;
            v8 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
            long long v38 = 0u;
            long long v39 = 0u;
            long long v40 = 0u;
            long long v41 = 0u;
            v9 = [(NSDictionary *)self->_cachedVideoOutputsEnabled allKeys];
            uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v38 objects:v43 count:16];
            if (v10)
            {
              uint64_t v11 = v10;
              uint64_t v12 = *(void *)v39;
              uint64_t v13 = *MEMORY[0x1E4F55398];
              uint64_t v14 = *MEMORY[0x1E4F55430];
              uint64_t v35 = *MEMORY[0x1E4F553C0];
              uint64_t v34 = *MEMORY[0x1E4F55370];
              uint64_t v33 = *MEMORY[0x1E4F55350];
              do
              {
                for (uint64_t i = 0; i != v11; ++i)
                {
                  if (*(void *)v39 != v12) {
                    objc_enumerationMutation(v9);
                  }
                  v16 = *(void **)(*((void *)&v38 + 1) + 8 * i);
                  if (objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_cachedVideoOutputsEnabled, "objectForKeyedSubscript:", v16), "BOOLValue"))
                  {
                    -[NSDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", (id)objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", v16), "mutableCopy"), v16);
                    objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", v16), "setObject:forKeyedSubscript:", 0, v13);
                    if ([v16 isEqualToString:v14])
                    {
                      objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", v16), "setObject:forKeyedSubscript:", 0, v35);
                      objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", v16), "setObject:forKeyedSubscript:", 0, v34);
                      objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", v16), "setObject:forKeyedSubscript:", 0, v33);
                    }
                  }
                }
                uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v38 objects:v43 count:16];
              }
              while (v11);
            }

            self->_cachedVideoOutputConfigurations = v8;
            if (!v31) {
              [(BWFigVideoCaptureStreamDelegate *)self->_delegate captureStreamWillStopStreaming:self];
            }
            int v42 = [(BWFigCaptureStream *)self->_stream stop];
            BOOL v3 = v32;
            if (!v42)
            {
              if (!v31) {
                [(BWFigVideoCaptureStreamDelegate *)self->_delegate captureStreamDidStopStreaming:self];
              }
              self->_streamHasBeenSuspended = 1;
              goto LABEL_31;
            }
          }
        }
LABEL_39:
        FigDebugAssert3();
        return v42;
      }
      if (self->_streamHasBeenSuspended)
      {
        int v42 = [(BWFigCaptureStream *)self->_stream setProperty:*MEMORY[0x1E4F54CB8] value:self->_cachedVideoOutputConfigurations];
        if (v42) {
          goto LABEL_39;
        }
        int v42 = [(BWFigCaptureStream *)self->_stream setProperty:*MEMORY[0x1E4F54CD8] value:self->_cachedVideoOutputsEnabled];
        if (v42) {
          goto LABEL_39;
        }
      }
      if (v5)
      {
        int v42 = [(BWFigVideoCaptureStream *)self start];
        if (v42) {
          goto LABEL_39;
        }
      }
      else
      {
        [(BWFigVideoCaptureStreamDelegate *)self->_delegate captureStreamWillStartStreaming:self];
        int v42 = [(BWFigVideoCaptureStream *)self start];
        if (v42) {
          goto LABEL_39;
        }
        [(BWFigVideoCaptureStreamDelegate *)self->_delegate captureStreamDidStartStreaming:self];
      }
    }
LABEL_31:
    os_unfair_lock_lock(&self->_streamStateLock);
    if (self->_started)
    {
      if (v3)
      {
        id v17 = +[BWCameraStreamingMonitor sharedCameraStreamingMonitor];
        uint64_t deviceType = self->_deviceType;
        int64_t epoch = self->_lastValidPTS.epoch;
        tccIdentity = self->_tccIdentity;
        mediaEnvironment = self->_mediaEnvironment;
        long long v22 = *(_OWORD *)&self->_clientAuditToken.val[4];
        long long v36 = *(_OWORD *)self->_clientAuditToken.val;
        long long v37 = v22;
        [v17 setStreaming:0 deviceType:deviceType streamUniqueID:epoch clientAuditToken:&v36 tccIdentity:tccIdentity mediaEnvironment:mediaEnvironment completionHandler:0];
      }
      else
      {
        os_unfair_lock_lock(&self->_cameraAccessLock);
        BOOL clientProcessHasAccessToCamera = self->_clientProcessHasAccessToCamera;
        os_unfair_lock_unlock(&self->_cameraAccessLock);
        if (clientProcessHasAccessToCamera)
        {
          id v24 = +[BWCameraStreamingMonitor sharedCameraStreamingMonitor];
          uint64_t v25 = self->_deviceType;
          int64_t v26 = self->_lastValidPTS.epoch;
          v27 = self->_tccIdentity;
          v28 = self->_mediaEnvironment;
          long long v29 = *(_OWORD *)&self->_clientAuditToken.val[4];
          long long v36 = *(_OWORD *)self->_clientAuditToken.val;
          long long v37 = v29;
          [v24 setStreaming:1 deviceType:v25 streamUniqueID:v26 clientAuditToken:&v36 tccIdentity:v27 mediaEnvironment:v28 completionHandler:0];
        }
      }
    }
    self->_suspended = v3;
    os_unfair_lock_unlock(&self->_streamStateLock);
  }
  return v42;
}

- (BOOL)isCMIOZoomFactorSupported
{
  return [(NSDictionary *)[(BWFigCaptureStream *)self->_stream supportedProperties] objectForKeyedSubscript:@"CMIOVideoZoomFactor"] != 0;
}

- (void)setRawFocusScoresEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *MEMORY[0x1E4F548E8];
  if ([(NSDictionary *)self->_supportedProperties objectForKeyedSubscript:*MEMORY[0x1E4F548E8]])
  {
    if (v3)
    {
      v7[0] = *MEMORY[0x1E4F544F8];
      uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
    }
    else
    {
      uint64_t v6 = MEMORY[0x1E4F1CBF0];
    }
    if (![(BWFigCaptureStream *)self->_stream setProperty:v5 value:v6]) {
      BYTE2(self->_multiBandNoiseReductionMode) = v3;
    }
  }
}

- (void)setAeStatisticsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = *MEMORY[0x1E4F54750];
  if ([(NSDictionary *)self->_supportedProperties objectForKeyedSubscript:*MEMORY[0x1E4F54750]])
  {
    if (!-[BWFigCaptureStream setProperty:value:](self->_stream, "setProperty:value:", v5, [NSNumber numberWithBool:v3]))BYTE1(self->_multiBandNoiseReductionMode) = v3; {
  }
    }
}

- (BOOL)isMultipleSensorRawBufferPoolsSupported
{
  unsigned int v2 = [(BWFigCaptureStream *)self->_stream supportedProperties];
  return [(NSDictionary *)v2 objectForKeyedSubscript:*MEMORY[0x1E4F54B90]] != 0;
}

- (void)setOverCaptureEnabled:(BOOL)a3
{
}

- (float)baseZoomFactorAfterGDC
{
  float result = self->_baseZoomFactorAfterGDC;
  if (result == 0.0) {
    return self->_baseZoomFactor;
  }
  return result;
}

- (NSDictionary)zoomFactorToNondisruptiveSwitchingFormatIndexSIFRBinned
{
  return *(NSDictionary **)&self->_centerStageFramingMode;
}

- (int)setActiveNondisruptiveSwitchingFormatIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([(BWFigVideoCaptureStream *)self isNondisruptiveFastSwitchingSupported])
  {
    uint64_t maximumSupportedFrameRate = (int)self->_maximumSupportedFrameRate;
    uint64_t minimumFrameRate = (int)self->_minimumFrameRate;
    uint64_t maximumFrameRate = (int)self->_maximumFrameRate;
  }
  else
  {
    uint64_t maximumSupportedFrameRate = 0;
    uint64_t minimumFrameRate = 0;
    uint64_t maximumFrameRate = 0;
  }
  return [(BWFigVideoCaptureStream *)self setActiveNondisruptiveSwitchingFormatIndex:v3 maximumAllowedFrameRate:maximumSupportedFrameRate minimumFrameRate:minimumFrameRate maximumFrameRate:maximumFrameRate];
}

- (int)setActiveNondisruptiveSwitchingFormatIndex:(int)a3 maximumAllowedFrameRate:(int)a4 minimumFrameRate:(int)a5 maximumFrameRate:(int)a6
{
  if (self->_activeFormatIndex < 0) {
    return -12782;
  }
  uint64_t v6 = *(void *)&a6;
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a4;
  uint64_t v9 = *(void *)&a3;
  if (a3 > -2)
  {
    os_unfair_lock_lock(&self->_activeNondisruptiveSwitchingFormatIndexLock);
    if (v9 == -1)
    {
      int fastSwitchingMainFormatIndex = self->_fastSwitchingMainFormatIndex;
      if (fastSwitchingMainFormatIndex < 0)
      {
        uint64_t v9 = 0xFFFFFFFFLL;
      }
      else
      {
        unsigned int activeFormatIndex = self->_activeFormatIndex;
        if (fastSwitchingMainFormatIndex == activeFormatIndex) {
          uint64_t v9 = 0xFFFFFFFFLL;
        }
        else {
          uint64_t v9 = activeFormatIndex;
        }
      }
    }
  }
  else
  {
    if ([(NSArray *)self->_supportedFormats count] <= a3) {
      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A8] reason:@"Can't set active nondisruptive switching format index: because the specified format is outside the supported format range. Use -supportedNondisruptiveSwitchingFormats." userInfo:0]);
    }
    os_unfair_lock_lock(&self->_activeNondisruptiveSwitchingFormatIndexLock);
  }
  int activeNondisruptiveSwitchingFormatIndex = self->_activeNondisruptiveSwitchingFormatIndex;
  if (v9 == activeNondisruptiveSwitchingFormatIndex) {
    goto LABEL_16;
  }
  if (activeNondisruptiveSwitchingFormatIndex != -1) {
    goto LABEL_17;
  }
  int activeFastSwitchingMainFormatIndex = self->_activeFastSwitchingMainFormatIndex;
  if (activeFastSwitchingMainFormatIndex < 0) {
    int activeFastSwitchingMainFormatIndex = self->_activeFormatIndex;
  }
  if (v9 == activeFastSwitchingMainFormatIndex)
  {
LABEL_16:
    int v15 = 0;
  }
  else
  {
LABEL_17:
    if (v9 == -1) {
      uint64_t v16 = *MEMORY[0x1E4F1D260];
    }
    else {
      uint64_t v16 = [NSNumber numberWithInt:v9];
    }
    uint64_t v17 = (self->_activeNondisruptiveSwitchingCommandID + 1);
    v18 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
    [v18 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4F52EC0]];
    uint64_t v19 = [NSNumber numberWithInt:v17];
    [v18 setObject:v19 forKeyedSubscript:*MEMORY[0x1E4F52E90]];
    if (v8 && v7 && v6)
    {
      uint64_t v20 = [NSNumber numberWithInt:v8];
      [v18 setObject:v20 forKeyedSubscript:*MEMORY[0x1E4F52EF8]];
      uint64_t v21 = [NSNumber numberWithInt:v7];
      [v18 setObject:v21 forKeyedSubscript:*MEMORY[0x1E4F52F08]];
      uint64_t v22 = [NSNumber numberWithInt:v6];
      [v18 setObject:v22 forKeyedSubscript:*MEMORY[0x1E4F52F00]];
    }
    int v23 = v9;
    if (v9 == -1) {
      int v23 = self->_activeFormatIndex;
    }
    id v24 = [(NSArray *)self->_supportedFormats objectAtIndexedSubscript:v23];
    if (objc_msgSend((id)objc_msgSend(v24, "objectForKeyedSubscript:", *MEMORY[0x1E4F552E0]), "BOOLValue"))
    {
      v29.x = FigCaptureMetadataUtilitiesDenormalizePoint(self->_previewShift.x, self->_previewShift.y, (double)self->_sensorDimensions.height);
      [v18 setObject:CGPointCreateDictionaryRepresentation(v29) forKeyedSubscript:*MEMORY[0x1E4F52F30]];
    }
    int v25 = [(BWFigCaptureStream *)self->_stream setProperty:*MEMORY[0x1E4F54B10] value:v18];
    if (v25)
    {
      int v15 = v25;
      FigDebugAssert3();
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    else
    {
      if (dword_1EB4C5010)
      {
        int64_t v26 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      int v15 = 0;
      self->_int activeNondisruptiveSwitchingFormatIndex = v9;
      self->_activeNondisruptiveSwitchingCommandID = v17;
    }
  }
  os_unfair_lock_unlock(&self->_activeNondisruptiveSwitchingFormatIndexLock);
  return v15;
}

- (NSDictionary)zoomFactorToNondisruptiveSwitchingFormatIndexSIFRNonBinned
{
  return *(NSDictionary **)&self->_backgroundReplacementEnabled;
}

- (void)setBaseZoomFactorAfterGDC:(float)a3
{
  if (self->_baseZoomFactorAfterGDC != a3) {
    self->_baseZoomFactorAfterGDC = a3;
  }
}

- (BOOL)started
{
  return self->_started;
}

- (void)_updateSphereMode
{
  if (a1)
  {
    unsigned int v2 = *(void **)(a1 + 440);
    if (v2)
    {
      uint64_t v3 = (void *)[v2 currentSphereMode];
      if (([v3 isEqualToString:*(void *)(a1 + 448)] & 1) == 0)
      {
        if ([*(id *)(a1 + 8) setProperty:*MEMORY[0x1E4F54BD0] value:v3])
        {
          FigDebugAssert3();
          return;
        }

        *(void *)(a1 + 448) = v3;
      }
      char v4 = [v3 isEqualToString:*MEMORY[0x1E4F54E88]] ^ 1;
    }
    else
    {
      char v4 = 0;
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 432));
    *(unsigned char *)(a1 + 436) = v4;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 432));
  }
}

- (void)setMinimumFrameRate:(float)a3
{
  int v5 = -[BWFigCaptureStream setProperty:value:](self->_stream, "setProperty:value:", @"MinimumFrameRate", [NSNumber numberWithUnsignedInt:a3]);
  if (v5)
  {
    if (v5 == -12780) {
      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], objc_msgSend(NSString, "stringWithFormat:", @"Can't set min frame rate: because the frame rate is not in range (%d). Use -supportedFormats.", 4294954516), 0 reason userInfo]);
    }
  }
  else if (self->_minimumFrameRate != a3)
  {
    self->_uint64_t minimumFrameRate = a3;
    if (self->_started)
    {
      [(BWFigVideoCaptureStream *)self maxExposureDuration];
      memset(&v6, 0, sizeof(v6));
      [(BWFigVideoCaptureStream *)(id *)&self->super.isa _setMaxExposureDuration:0.0];
    }
  }
}

- (void)setMaximumFrameRate:(float)a3
{
  int v5 = -[BWFigCaptureStream setProperty:value:](self->_stream, "setProperty:value:", @"MaximumFrameRate", [NSNumber numberWithUnsignedInt:a3]);
  if (v5)
  {
    if (v5 == -12780) {
      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], objc_msgSend(NSString, "stringWithFormat:", @"Can't set max frame rate: because the frame rate is not in range (%d). Use -supportedFormats.", 4294954516), 0 reason userInfo]);
    }
  }
  else
  {
    self->_uint64_t maximumFrameRate = a3;
    *(float *)&double v6 = a3;
    [(BWSphereModeSelector *)self->_sphereModeSelector setMaximumFrameRate:v6];
    -[BWFigVideoCaptureStream _updateSphereMode]((uint64_t)self);
  }
}

- (void)setFaceDetectionEnabled:(BOOL)a3
{
  int v3 = a3;
  p_lastFaceDetectionEnabled = &self->_lastFaceDetectionEnabled;
  os_unfair_lock_lock((os_unfair_lock_t)&self->_lastFaceDetectionEnabled);
  if (LOBYTE(self->_faceDetectionConfiguration) != v3)
  {
    LOBYTE(self->_faceDetectionConfiguration) = v3;
    -[BWFigVideoCaptureStream _propagateFaceAndObjectDetectionSettings]((uint64_t)self);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)p_lastFaceDetectionEnabled);
}

- (void)setMotionDataDeliveryEnabled:(BOOL)a3
{
  if (self->_motionDataDeliveryEnabled != a3)
  {
    BOOL v3 = a3;
    if (!-[BWFigCaptureStream setProperty:value:](self->_stream, "setProperty:value:", *MEMORY[0x1E4F549C0], objc_msgSend(NSNumber, "numberWithBool:")))self->_motionDataDeliveryEnabled = v3; {
  }
    }
}

- (void)setVideoHDRImageStatisticsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = *MEMORY[0x1E4F54988];
  if ([(NSDictionary *)self->_supportedProperties objectForKeyedSubscript:*MEMORY[0x1E4F54988]])
  {
    if (!-[BWFigCaptureStream setProperty:value:](self->_stream, "setProperty:value:", v5, [NSNumber numberWithBool:v3]))self->_keypointDetectionConfigured = v3; {
  }
    }
}

- (void)setVideoHDRFusionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = *MEMORY[0x1E4F54980];
  if ([(NSDictionary *)self->_supportedProperties objectForKeyedSubscript:*MEMORY[0x1E4F54980]])
  {
    if (!-[BWFigCaptureStream setProperty:value:](self->_stream, "setProperty:value:", v5, [NSNumber numberWithBool:v3]))HIBYTE(self->_keypointDetectionConfiguration) = v3; {
  }
    }
}

- (void)setVideoCaptureDimensions:(id)a3
{
  *($2825F4736939C4A6D3AD43837233062D *)&self->_timeLapseEnabled = a3;
}

- (void)setStillImageKeypointDetectionEnabled:(BOOL)a3
{
  if (a3) {
    -[BWFigVideoCaptureStream _configureKeypointDetection]((uint64_t)self);
  }
  BYTE2(self->_keypointDetectionConfiguration) = a3;
}

- (void)setPixelFormatIsTenBit:(BOOL)a3
{
  self->_keypointDetectionEnabled = a3;
}

- (void)setObjectDetectionStartupDeferred:(BOOL)a3
{
  int v3 = a3;
  if (!self->_started || !a3)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&self->_lastFaceDetectionEnabled);
    if (LOBYTE(self->_detectedObjectTypes) != v3)
    {
      LOBYTE(self->_detectedObjectTypes) = v3;
      -[BWFigVideoCaptureStream _propagateFaceAndObjectDetectionSettings]((uint64_t)self);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&self->_lastFaceDetectionEnabled);
  }
}

- (void)setMultiBandNoiseReductionMode:(int)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *MEMORY[0x1E4F54B08];
  if ([(NSDictionary *)self->_supportedProperties objectForKeyedSubscript:*MEMORY[0x1E4F54B08]]&& ![(NSString *)self->_portType isEqualToString:*MEMORY[0x1E4F52E00]])
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if (a3 == 2)
    {
      uint64_t v10 = *MEMORY[0x1E4F543C8];
      v15[0] = *MEMORY[0x1E4F543B8];
      v15[1] = v10;
      v16[0] = MEMORY[0x1E4F1CC38];
      v16[1] = MEMORY[0x1E4F1CC38];
      uint64_t v7 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v8 = v16;
      uint64_t v9 = v15;
      uint64_t v11 = 2;
    }
    else
    {
      if (a3 == 1)
      {
        uint64_t v17 = *MEMORY[0x1E4F543B8];
        v18[0] = MEMORY[0x1E4F1CC38];
        uint64_t v7 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v8 = v18;
        uint64_t v9 = &v17;
      }
      else
      {
        uint64_t v13 = *MEMORY[0x1E4F543B8];
        uint64_t v14 = MEMORY[0x1E4F1CC28];
        uint64_t v7 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v8 = &v14;
        uint64_t v9 = &v13;
      }
      uint64_t v11 = 1;
    }
    uint64_t v12 = [v7 dictionaryWithObjects:v8 forKeys:v9 count:v11];
    [v6 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F543D8]];
    if (![(BWFigCaptureStream *)self->_stream setProperty:v5 value:v6]) {
      LODWORD(self->_stillImageNoiseAndSharpeningParameters) = a3;
    }
  }
}

- (void)setMinimumSupportedFrameRate:(float)a3
{
  self->_minimumSupportedFrameRate = a3;
}

- (void)setMaximumFrameRateForSensorRawOutputBufferPoolRequirements:(float)a3
{
  self->_maximumFrameRateForSensorRawOutputBufferPoolRequirements = a3;
}

- (void)setMaxExposureDurationFrameworkOverride:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  *(int64_t *)((char *)&self->_maxExposureDurationFrameworkOverride.value + 4) = a3->var3;
  *(_OWORD *)&self->_maxExposureDurationClientOverride.flags = v3;
}

- (void)setMaxExposureDurationClientOverride:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  *(int64_t *)((char *)&self->_maxExposureDurationClientOverride.value + 4) = a3->var3;
  *(_OWORD *)&self->_digitalFlashEnabled = v3;
}

- (void)setMainToSIFRFrameRateRatio:(int)a3
{
  if (!-[BWFigCaptureStream setPropertyIfSupported:value:](self->_stream, "setPropertyIfSupported:value:", *MEMORY[0x1E4F54A88], objc_msgSend(NSNumber, "numberWithInt:")))LODWORD(self->_stillImageCaptureDelegateDispatchGroup) = a3; {
}
  }

- (void)setLowLightVideoEnabled:(BOOL)a3
{
  *(&self->_maxExposureDurationHasBeenSet + 1) = a3;
}

- (void)setKeypointDetectionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(NSDictionary *)self->_supportedProperties objectForKeyedSubscript:*MEMORY[0x1E4F549D0]])
  {
    if (v3) {
      -[BWFigVideoCaptureStream _configureKeypointDetection]((uint64_t)self);
    }
    if (!-[BWFigCaptureStream setProperty:value:](self->_stream, "setProperty:value:", *MEMORY[0x1E4F549D8], [NSNumber numberWithBool:v3]))BYTE1(self->_keypointDetectionConfiguration) = v3; {
  }
    }
}

- (void)setHighlightRecoveryEnabledWhenConfiguredAsSlave:(BOOL)a3
{
  BYTE6(self->_keypointDetectionConfiguration) = a3;
}

- (void)setHighlightRecoveryEnabledWhenConfiguredAsMasterOrSingleStream:(BOOL)a3
{
  BYTE5(self->_keypointDetectionConfiguration) = a3;
  -[BWFigVideoCaptureStream _setHighlightRecoveryEnabled:]((uint64_t)self, a3);
}

- (void)setFocusBlurMapEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = *MEMORY[0x1E4F54938];
  if ([(NSDictionary *)self->_supportedProperties objectForKeyedSubscript:*MEMORY[0x1E4F54938]])
  {
    if (!-[BWFigCaptureStream setProperty:value:](self->_stream, "setProperty:value:", v5, [NSNumber numberWithBool:v3]))HIBYTE(self->_multiBandNoiseReductionMode) = v3; {
  }
    }
}

- (void)setEyeDetectionRequired:(BOOL)a3
{
  int v3 = a3;
  p_lastFaceDetectionEnabled = &self->_lastFaceDetectionEnabled;
  os_unfair_lock_lock((os_unfair_lock_t)&self->_lastFaceDetectionEnabled);
  if (BYTE1(self->_faceDetectionConfiguration) != v3)
  {
    BYTE1(self->_faceDetectionConfiguration) = v3;
    -[BWFigVideoCaptureStream _propagateFaceAndObjectDetectionSettings]((uint64_t)self);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)p_lastFaceDetectionEnabled);
}

- (void)setColorSpaceIsAppleLog:(BOOL)a3
{
  self->_stillImageKeypointDetectionEnabled = a3;
}

- (void)setAeMaxGain:(float)a3
{
  *(float *)&self->_maxExposureDurationFrameworkOverride.int64_t epoch = a3;
}

- (double)_convertOpticalCenterOffsetToPhysicalSensorDimensions:(uint64_t)a1
{
  if (!a1) {
    return 0.0;
  }
  int v3 = (void *)[*(id *)(a1 + 96) objectAtIndexedSubscript:(int)-[BWFigVideoCaptureStream _activeFormatIndexWithNondisruptiveSwitching]((os_unfair_lock_s *)a1)];
  char v4 = objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", @"VideoIsBinned"), "BOOLValue");
  unsigned int v5 = objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E4F552C8]), "intValue");
  if (v5 <= 1) {
    int v6 = 1;
  }
  else {
    int v6 = v5;
  }
  int v7 = v6 << v4;
  if (v7 <= 1) {
    int v7 = 1;
  }
  return a2 * (double)v7;
}

- (BOOL)hasSphere
{
  return self->_sphereModeSelector != 0;
}

- (BOOL)hasFocus
{
  return self->_hasFocus;
}

- (int)activeQuadraBinningFactor
{
  unsigned int active = -[BWFigVideoCaptureStream _activeFormatIndexWithNondisruptiveSwitching]((os_unfair_lock_s *)self);
  if ((active & 0x80000000) != 0) {
    return -1;
  }
  id v4 = [(NSArray *)self->_supportedFormats objectAtIndexedSubscript:active];
  unsigned int v5 = (void *)[v4 objectForKeyedSubscript:*MEMORY[0x1E4F552C8]];
  return [v5 intValue];
}

- (uint64_t)_activeFormatIndexWithNondisruptiveSwitching
{
  if (!a1) {
    return 0;
  }
  unsigned int v2 = a1 + 29;
  os_unfair_lock_lock(a1 + 29);
  uint64_t os_unfair_lock_opaque = a1[30]._os_unfair_lock_opaque;
  if ((os_unfair_lock_opaque & 0x80000000) != 0) {
    uint64_t os_unfair_lock_opaque = a1[28]._os_unfair_lock_opaque;
  }
  os_unfair_lock_unlock(v2);
  return os_unfair_lock_opaque;
}

- (__CFString)currentNonLowPowerSphereMode
{
  return [(BWSphereModeSelector *)self->_sphereModeSelector currentNonLowPowerSphereMode];
}

- (NSArray)nondisruptiveSwitchingZoomFactors
{
  return (NSArray *)self->_zoomFactorToNondisruptiveSwitchingFormatIndexSIFRBinned;
}

- (float)exifFocalLengthMultiplier
{
  return self->_exifFocalLengthMultiplier;
}

- (float)lensFNumber
{
  return self->_lensFNumber;
}

- (float)focalLength
{
  return self->_focalLength;
}

- (BWSecureMetadataOutputConfigurator)secureMetadataOutputConfigurator
{
  float result = *(BWSecureMetadataOutputConfigurator **)&self->_deskCamActive;
  if (!result)
  {
    float result = objc_alloc_init(BWSecureMetadataOutputConfigurator);
    *(void *)&self->_deskCamActive = result;
  }
  return result;
}

- (unsigned)sensorInterfaceRawPixelFormat
{
  return self->_sensorInterfaceRawPixelFormat;
}

- ($2825F4736939C4A6D3AD43837233062D)sensorDimensions
{
  return *($2825F4736939C4A6D3AD43837233062D *)&self->_aeMaxGain;
}

- (BOOL)isNondisruptiveFastSwitchingSupported
{
  unsigned int v2 = [(BWFigCaptureStream *)self->_stream supportedProperties];
  return [(NSDictionary *)v2 objectForKeyedSubscript:*MEMORY[0x1E4F54AC8]] != 0;
}

- (BWFigVideoCaptureStream)initWithCaptureStream:(id)a3 parentDevice:(id)a4 attributes:(id)a5 sensorIDDictionary:(id)a6 synchronizedStreamsGroup:(id)a7 applicationID:(id)a8 clientAuditToken:(id *)a9 tccIdentity:(id)a10 mediaEnvironment:(id)a11 error:(int *)a12
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  int GravityFactor = 0;
  v80.receiver = self;
  v80.super_class = (Class)BWFigVideoCaptureStream;
  v18 = [(BWFigVideoCaptureStream *)&v80 init];
  if (!v18) {
    goto LABEL_62;
  }
  if (a3)
  {
    *((void *)v18 + 1) = a3;
    *((void *)v18 + 4) = (id)[a3 portType];
    *((void *)v18 + 2) = a4;
    *((void *)v18 + 11) = (id)[*((id *)v18 + 1) supportedProperties];
    if (GravityFactor) {
      goto LABEL_78;
    }
    *((void *)v18 + 12) = [*((id *)v18 + 1) copyProperty:@"SupportedFormatsArray" error:&GravityFactor];
    if (GravityFactor) {
      goto LABEL_78;
    }
    *((void *)v18 + 18) = [*((id *)v18 + 1) copyPropertyIfSupported:*MEMORY[0x1E4F54AE8] error:&GravityFactor];
    if (GravityFactor) {
      goto LABEL_78;
    }
    uint64_t v19 = (void *)[*((id *)v18 + 1) getPropertyIfSupported:*MEMORY[0x1E4F54930] error:&GravityFactor];
    if (GravityFactor) {
      goto LABEL_78;
    }
    [v19 floatValue];
    *((_DWORD *)v18 + 67) = v20;
    uint64_t v21 = (void *)[*((id *)v18 + 1) getPropertyIfSupported:*MEMORY[0x1E4F54A18] error:&GravityFactor];
    if (GravityFactor) {
      goto LABEL_78;
    }
    [v21 floatValue];
    *((_DWORD *)v18 + 68) = v22;
    int v23 = (void *)[*((id *)v18 + 1) getPropertyIfSupported:*MEMORY[0x1E4F54978] error:&GravityFactor];
    if (GravityFactor) {
      goto LABEL_78;
    }
    if (v23) {
      *((void *)v18 + 43) = (id)fvcs_ambientViewingEnvironment([v23 intValue]);
    }
    long long v24 = *(_OWORD *)&a9->var0[4];
    v79[0] = *(_OWORD *)a9->var0;
    v79[1] = v24;
    *((_DWORD *)v18 + 90) = FigCaptureGetPIDFromAuditToken(v79);
    *((void *)v18 + 46) = [a8 copy];
    long long v25 = *(_OWORD *)&a9->var0[4];
    *(_OWORD *)(v18 + 376) = *(_OWORD *)a9->var0;
    *(_OWORD *)(v18 + 392) = v25;
    *((_DWORD *)v18 + 102) = 0;
    *((void *)v18 + 52) = a10;
    *((void *)v18 + 53) = a11;
    *((void *)v18 + 40) = (id)[a5 objectForKeyedSubscript:@"NonLocalizedName"];
    *((_DWORD *)v18 + 83) = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", @"DeviceType"), "intValue");
    *((void *)v18 + 141) = (id)[a5 objectForKeyedSubscript:@"UniqueID"];
    *((void *)v18 + 14) = 0xFFFFFFFFLL;
    *((_DWORD *)v18 + 30) = -1;
    *(void *)(v18 + 132) = -1;
    unint64_t v26 = objc_msgSend((id)objc_msgSend(a7, "activePortTypes"), "count");
    v18[741] = v26 > 1;
    if (v26 > 1)
    {
      BOOL v27 = objc_msgSend((id)objc_msgSend(a7, "syncGroup"), "synchronizationMaster") == (void)a3;
      int v28 = v18[741];
      v18[740] = v27;
      if (v28) {
        uint64_t v29 = [a7 syncGroup];
      }
      else {
        uint64_t v29 = 0;
      }
    }
    else
    {
      uint64_t v29 = 0;
      v18[740] = 0;
    }
    *((void *)v18 + 93) = v29;
    *((_DWORD *)v18 + 108) = 0;
    *((_DWORD *)v18 + 88) = 0;
    *((_DWORD *)v18 + 120) = 0;
    if (objc_msgSend((id)objc_msgSend(*((id *)v18 + 18), "objectForKeyedSubscript:", *MEMORY[0x1E4F52F18]), "intValue")&& objc_msgSend((id)objc_msgSend(*((id *)v18 + 18), "objectForKeyedSubscript:", *MEMORY[0x1E4F52F10]), "intValue"))
    {
      v18[160] = 1;
    }
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(a7, "baseZoomFactorsByPortType"), "objectForKeyedSubscript:", *((void *)v18 + 4)), "floatValue");
    if (v30 == 0.0) {
      float v30 = 1.0;
    }
    *((float *)v18 + 46) = v30;
    if (v18[741])
    {
      uint64_t v31 = (void *)[*((id *)v18 + 1) getProperty:*MEMORY[0x1E4F54C10] error:&GravityFactor];
      if (GravityFactor) {
        goto LABEL_78;
      }
      *((_DWORD *)v18 + 188) = objc_msgSend((id)objc_msgSend(v31, "objectForKeyedSubscript:", *MEMORY[0x1E4F550E0]), "intValue");
    }
    if (objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", @"Sphere"), "BOOLValue"))
    {
      BOOL v32 = [BWSphereModeSelector alloc];
      uint64_t v33 = *((void *)v18 + 4);
      uint64_t v34 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", @"SphereStillActivePreview"), "BOOLValue");
      uint64_t v35 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", @"SphereVideo"), "BOOLValue");
      objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", @"SphereVideoMaxFrameRate"), "floatValue");
      *((void *)v18 + 55) = -[BWSphereModeSelector initWithPortType:stillActivePreviewSupported:sphereVideoSupported:sphereVideoMaxFrameRate:](v32, "initWithPortType:stillActivePreviewSupported:sphereVideoSupported:sphereVideoMaxFrameRate:", v33, v34, v35);
      long long v36 = (void *)[*((id *)v18 + 1) getPropertyIfSupported:*MEMORY[0x1E4F54C00] error:0];
      int v37 = [v36 containsObject:*MEMORY[0x1E4F54EB0]];
      if (v37) {
        LOBYTE(v37) = [v36 containsObject:*MEMORY[0x1E4F54EA8]];
      }
      v18[456] = v37;
    }
    *((_DWORD *)v18 + 115) = -1;
    *((_DWORD *)v18 + 117) = 3;
    id v38 = a6;
    *((void *)v18 + 21) = v38;
    v18[152] = objc_msgSend((id)objc_msgSend(v38, "objectForKeyedSubscript:", @"usePinholeCameraFocalLengthInIntrinsicMatrixCalculation"), "BOOLValue");
    objc_msgSend((id)objc_msgSend(*((id *)v18 + 21), "objectForKeyedSubscript:", @"ExifFocalLengthMultiplier"), "floatValue");
    *((_DWORD *)v18 + 39) = v39;
    long long v40 = (void *)[*((id *)v18 + 1) getProperty:*MEMORY[0x1E4F54B38] error:&GravityFactor];
    int v41 = GravityFactor;
    if (!GravityFactor)
    {
      int v42 = v40;
      [v40 floatValue];
      if (v43 > 0.0)
      {
        [v42 floatValue];
        if (v44 < 100.0)
        {
          [v42 floatValue];
          *((float *)v18 + 65) = v45;
          if (v45 <= 0.0) {
            float v46 = 1.0;
          }
          else {
            float v46 = 1.0 / v45;
          }
          *((float *)v18 + 66) = v46;
          v47 = (void *)[*((id *)v18 + 1) getPropertyIfSupported:*MEMORY[0x1E4F54B78] error:&GravityFactor];
          if (v47)
          {
            v48 = v47;
            int v49 = objc_msgSend((id)objc_msgSend(v47, "objectForKeyedSubscript:", *MEMORY[0x1E4F52F88]), "intValue");
            int v50 = objc_msgSend((id)objc_msgSend(v48, "objectForKeyedSubscript:", *MEMORY[0x1E4F52F50]), "intValue");
            *((_DWORD *)v18 + 233) = v49;
            *((_DWORD *)v18 + 234) = v50;
          }
          *((void *)v18 + 37) = [*((id *)v18 + 1) copyPropertyIfSupported:*MEMORY[0x1E4F54810] error:&GravityFactor];
          *((void *)v18 + 38) = [*((id *)v18 + 1) copyPropertyIfSupported:*MEMORY[0x1E4F54808] error:&GravityFactor];
          objc_msgSend((id)objc_msgSend(*((id *)v18 + 1), "getPropertyIfSupported:error:", *MEMORY[0x1E4F54800], &GravityFactor), "floatValue");
          *((_DWORD *)v18 + 82) = v51;
          uint64_t v52 = *MEMORY[0x1E4F54820];
          if ([*((id *)v18 + 11) objectForKeyedSubscript:*MEMORY[0x1E4F54820]])
          {
            v53 = (void *)[*((id *)v18 + 1) copyProperty:v52 error:&GravityFactor];
            *((void *)v18 + 35) = v53;
            v54 = BWInvertRowMajorViewMatrixData(v53);
          }
          else
          {
            *((void *)v18 + 35) = (id)[a7 cameraViewMatrixForPortType:*((void *)v18 + 4)];
            v54 = (void *)[a7 cameraPoseMatrixForPortType:*((void *)v18 + 4)];
          }
          *((void *)v18 + 39) = v54;
          if (objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", @"Focus"), "BOOLValue"))
          {
            int GravityFactor = FigMotionGetGravityFactor(*((const __CFDictionary **)v18 + 18), *((CFDictionaryRef *)v18 + 21), (_DWORD *)v18 + 69);
            if (GravityFactor) {
              goto LABEL_78;
            }
          }
          *((_DWORD *)v18 + 184) = 0;
          uint64_t v55 = *MEMORY[0x1E4F54998];
          if ([*((id *)v18 + 11) objectForKeyedSubscript:*MEMORY[0x1E4F54998]])
          {
            int GravityFactor = [*((id *)v18 + 1) setProperty:v55 value:MEMORY[0x1E4F1CC28]];
            if (GravityFactor) {
              goto LABEL_78;
            }
          }
          uint64_t v56 = *MEMORY[0x1E4F54B48];
          if ([*((id *)v18 + 11) objectForKeyedSubscript:*MEMORY[0x1E4F54B48]]
            && ([*((id *)v18 + 4) isEqualToString:*MEMORY[0x1E4F52E00]] & 1) == 0
            && (objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", @"RawBufferCompandingDisabled"), "BOOLValue") & 1) == 0)
          {
            int GravityFactor = [*((id *)v18 + 1) setProperty:v56 value:MEMORY[0x1E4F1CC38]];
            if (GravityFactor) {
              goto LABEL_78;
            }
            v18[76] = 1;
          }
          long long v77 = 0u;
          long long v78 = 0u;
          long long v75 = 0u;
          long long v76 = 0u;
          v57 = (void *)*((void *)v18 + 12);
          uint64_t v58 = [v57 countByEnumeratingWithState:&v75 objects:v86 count:16];
          uint64_t v59 = *MEMORY[0x1E4F55318];
          if (v58)
          {
            uint64_t v60 = v58;
            uint64_t v61 = *(void *)v76;
            uint64_t v62 = *MEMORY[0x1E4F55428];
            uint64_t v63 = *MEMORY[0x1E4F550C8];
            while (2)
            {
              for (uint64_t i = 0; i != v60; ++i)
              {
                if (*(void *)v76 != v61) {
                  objc_enumerationMutation(v57);
                }
                int v65 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v75 + 1) + 8 * i), "objectForKeyedSubscript:", v59), "objectForKeyedSubscript:", v62), "objectForKeyedSubscript:", v63), "intValue");
                if (v65)
                {
                  if (v18[76])
                  {
                    if (v65 > 1735549491)
                    {
                      if (v65 == 1919379252)
                      {
                        int v65 = 1919378232;
                      }
                      else if (v65 == 1735549492)
                      {
                        int v65 = 1735549752;
                      }
                    }
                    else if (v65 == 1650943796)
                    {
                      int v65 = 1650942776;
                    }
                    else if (v65 == 1734505012)
                    {
                      int v65 = 1734501176;
                    }
                  }
                  *((_DWORD *)v18 + 20) = v65;
                  goto LABEL_59;
                }
              }
              uint64_t v60 = [v57 countByEnumeratingWithState:&v75 objects:v86 count:16];
              if (v60) {
                continue;
              }
              break;
            }
          }
LABEL_59:
          *((void *)v18 + 13) = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*((id *)v18 + 12), "firstObject"), "objectForKeyedSubscript:", v59), "allKeys");
          uint64_t v66 = *MEMORY[0x1E4F54B08];
          if (![*((id *)v18 + 11) objectForKeyedSubscript:*MEMORY[0x1E4F54B08]]) {
            goto LABEL_61;
          }
          uint64_t v67 = MEMORY[0x1E4F1CC28];
          *((void *)v18 + 103) = [[BWNoiseReductionAndSharpeningParameters alloc] initWithPortType:*((void *)v18 + 4) sensorIDDictionary:*((void *)v18 + 21)];
          v68 = (void *)*((void *)v18 + 1);
          uint64_t v69 = *MEMORY[0x1E4F543D8];
          uint64_t v83 = v67;
          uint64_t v84 = v69;
          uint64_t v82 = *MEMORY[0x1E4F543B8];
          uint64_t v85 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v83 forKeys:&v82 count:1];
          int GravityFactor = objc_msgSend(v68, "setProperty:value:", v66, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v85, &v84, 1));
          if (!GravityFactor)
          {
LABEL_61:
            *(_OWORD *)(v18 + 1032) = *MEMORY[0x1E4F1DAD8];
            *((_DWORD *)v18 + 266) = 0;
            uint64_t v70 = MEMORY[0x1E4F1F9F8];
            long long v71 = *MEMORY[0x1E4F1F9F8];
            *(_OWORD *)(v18 + 1068) = *MEMORY[0x1E4F1F9F8];
            uint64_t v72 = *(void *)(v70 + 16);
            *(void *)(v18 + 1084) = v72;
            *(_OWORD *)(v18 + 1092) = v71;
            *(void *)(v18 + 1108) = v72;
            *((_DWORD *)v18 + 279) = 0;
LABEL_62:
            int v73 = GravityFactor;
            goto LABEL_63;
          }
LABEL_78:
          FigDebugAssert3();
          goto LABEL_62;
        }
      }
      int v41 = -12783;
      int GravityFactor = -12783;
    }
    *a12 = v41;
    goto LABEL_64;
  }
  int v73 = FigSignalErrorAt();
  int GravityFactor = v73;
LABEL_63:
  *a12 = v73;
  if (v73)
  {
LABEL_64:

    return 0;
  }
  return (BWFigVideoCaptureStream *)v18;
}

- (NSDictionary)sensorIDDictionary
{
  return self->_sensorIDDictionary;
}

- (void)setReactionsInProgressChangedHandler:(id)a3
{
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (BWFigVideoCaptureStreamDelegate *)a3;
}

- (NSDictionary)sensorColorCalibrationData
{
  int v15 = 0;
  if (!self->_stream
    || ((portType = self->_portType, id v4 = [(BWFigVideoCaptureStream *)self sensorIDString], portType)
      ? (BOOL v5 = v4 == 0)
      : (BOOL v5 = 1),
        v5))
  {
    FigDebugAssert3();
    return 0;
  }
  float result = (NSDictionary *)objc_msgSend(-[FigCaptureCameraParameters sensorIDDictionaryForPortType:sensorIDString:](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "sensorIDDictionaryForPortType:sensorIDString:", portType, v4), "objectForKeyedSubscript:", @"ModuleConfig");
  if (result)
  {
    int v7 = result;
    float result = (NSDictionary *)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](result, "objectForKeyedSubscript:", @"AutoWhiteBalance"), "objectForKeyedSubscript:", @"IdealColorCalibrations");
    uint64_t v14 = result;
    if (result)
    {
      float result = [(NSDictionary *)v7 objectForKeyedSubscript:@"AutoWhiteBalance"];
      uint64_t v13 = result;
      if (result)
      {
        float result = [(BWFigCaptureStream *)self->_stream getPropertyIfSupported:*MEMORY[0x1E4F54790] error:0];
        uint64_t v12 = result;
        if (result)
        {
          SEL v8 = NSSelectorFromString(&cfstr_Getcolorcalibr.isa);
          if (objc_opt_respondsToSelector())
          {
            int v11 = 0;
            uint64_t v10 = &v15;
            uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1CA18], "invocationWithMethodSignature:", objc_msgSend(MEMORY[0x1E4F57D20], "methodSignatureForSelector:", v8));
            [v9 setSelector:v8];
            [v9 setTarget:objc_opt_class()];
            [v9 setArgument:&v14 atIndex:2];
            [v9 setArgument:&v12 atIndex:3];
            [v9 setArgument:&v10 atIndex:4];
            [v9 setArgument:&v13 atIndex:5];
            [v9 invoke];
            [v9 getReturnValue:&v11];
            return v15;
          }
          return 0;
        }
      }
    }
  }
  return result;
}

- (NSString)sensorIDString
{
  return (NSString *)+[FigCaptureCameraParameters sensorIDStringFromModuleInfo:self->_moduleInfo];
}

- (void)setZoomFactorToNondisruptiveSwitchingFormatIndexSIFRBinned:(id)a3 zoomFactorToNondisruptiveSwitchingFormatIndexSIFRNonBinned:(id)a4 ultraHighResolutionNondisruptiveStreamingFormatIndex:(int)a5 mainFormatSIFRBinningFactor:(int)a6 quadraSubPixelSwitchingParameters:(id)a7
{
  uint64_t v8 = *(void *)&a6;
  uint64_t v9 = *(void *)&a5;

  *(void *)&self->_centerStageFramingMode = a3;
  *(void *)&self->_backgroundReplacementEnabled = a4;
  LODWORD(self->_nondisruptiveSwitchingZoomFactors) = v8;
  if (v8 == 2) {
    id v13 = a3;
  }
  else {
    id v13 = a4;
  }
  uint64_t v14 = objc_msgSend((id)objc_msgSend(v13, "allKeys"), "sortedArrayUsingSelector:", sel_compare_);
  objc_msgSend((id)objc_msgSend(v14, "firstObject"), "floatValue");
  if (v15 == self->_baseZoomFactor)
  {
    if ((unint64_t)[v14 count] < 2) {
      uint64_t v14 = 0;
    }
    else {
      uint64_t v14 = objc_msgSend(v14, "subarrayWithRange:", 1, objc_msgSend(v14, "count") - 1);
    }
  }

  self->_zoomFactorToNondisruptiveSwitchingFormatIndexSIFRBinned = (NSDictionary *)v14;
  self->_zoomFactorToNondisruptiveSwitchingFormatIndexSIFRNonBinned = 0;
  if (*(void *)&self->_centerStageFramingMode || *(void *)&self->_backgroundReplacementEnabled)
  {
    uint64_t v16 = [BWNondisruptiveSwitchingFormatSelector alloc];
    *(float *)&double v17 = self->_baseZoomFactor;
    self->_zoomFactorToNondisruptiveSwitchingFormatIndexSIFRNonBinned = (NSDictionary *)[(BWNondisruptiveSwitchingFormatSelector *)v16 initWithPortType:self->_portType quadraSubPixelSwitchingParameters:a7 baseZoomFactor:*(void *)&self->_centerStageFramingMode zoomFactorToNondisruptiveSwitchingFormatIndexSIFRBinned:*(void *)&self->_backgroundReplacementEnabled zoomFactorToNondisruptiveSwitchingFormatIndexSIFRNonBinned:v9 ultraHighResolutionNondisruptiveStreamingFormatIndex:v8 mainFormatSIFRBinningFactor:v17];
  }
}

- (BWFigCaptureStream)stream
{
  return self->_stream;
}

- (float)baseZoomFactor
{
  return self->_baseZoomFactor;
}

- (NSDictionary)moduleInfo
{
  return self->_moduleInfo;
}

- (NSData)cameraViewMatrixCalibratedForNarrowerFieldOfView
{
  return self->_cameraViewMatrixCalibratedForNarrowerFieldOfView;
}

- (CGPoint)opticalCenterOffset
{
  objc_copyStruct(v4, &self->_opticalCenterOffset, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)opticalCenterOffsetInPhysicalSensorDimensions
{
  objc_copyStruct(v4, &self->_opticalCenterOffsetInPhysicalSensorDimensions, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (BOOL)hasOpticalCenterOffsetCalibratedForNarrowerFieldOfView
{
  return self->_hasOpticalCenterOffsetCalibratedForNarrowerFieldOfView;
}

- (NSDictionary)geometricDistortionCoefficients
{
  return *(NSDictionary **)&self->_masterToSlaveFrameRateRatio;
}

- (NSDictionary)geometricDistortionCoefficientsCalibratedForNarrowerFieldOfView
{
  return self->_geometricDistortionCoefficients;
}

- (NSData)flashCalibrationData
{
  double v3 = [(BWFigCaptureStream *)self->_stream getPropertyIfSupported:*MEMORY[0x1E4F54920] error:0];
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [(NSData *)v3 bytes];
    if (v5)
    {
      int v6 = (_DWORD *)v5;
      if ([(NSString *)self->_portType isEqualToString:*MEMORY[0x1E4F52DE8]])
      {
        if (*v6 == 1)
        {
          portType = self->_portType;
          uint64_t v8 = [(BWFigVideoCaptureStream *)self sensorIDString];
          if (portType && v8)
          {
            uint64_t v9 = objc_msgSend(-[FigCaptureCameraParameters sensorIDDictionaryForPortType:sensorIDString:](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "sensorIDDictionaryForPortType:sensorIDString:", portType, v8), "objectForKeyedSubscript:", @"ModuleConfig");
            if (v9) {
              [MEMORY[0x1E4F57D20] calculateSTRBKeyFromWideCamera:v6 moduleConfig:v9];
            }
          }
          else
          {
            FigDebugAssert3();
          }
        }
      }
    }
  }
  return v4;
}

- (NSData)cameraViewMatrix
{
  return self->_cameraViewMatrix;
}

- (NSData)cameraPoseMatrix
{
  return self->_cameraPoseMatrix;
}

- (NSNumber)calibrationValidRadiusForNarrowerFieldOfView
{
  return self->_calibrationValidRadiusForNarrowerFieldOfView;
}

- (NSNumber)calibrationValidRadiusForFullFieldOfView
{
  return self->_calibrationValidRadiusForFullFieldOfView;
}

- (float)calibratedRotationAngle
{
  return self->_calibratedRotationAngle;
}

- (void)setTemporalNoiseReductionConfigurationBand0Enabled:(BOOL)a3 rawEnabled:(BOOL)a4 modulation:(int)a5 adaptiveOverscanEnabled:(BOOL)a6 strengthHighEnabled:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  uint64_t v9 = *(void *)&a5;
  BOOL v10 = a4;
  BOOL v11 = a3;
  v39[2] = *MEMORY[0x1E4F143B8];
  id v13 = [(BWFigCaptureStream *)self->_stream supportedProperties];
  uint64_t v14 = *MEMORY[0x1E4F54C20];
  if ([(NSDictionary *)v13 objectForKeyedSubscript:*MEMORY[0x1E4F54C20]])
  {
    id v15 = [(BWFigCaptureStream *)self->_stream getProperty:v14 error:0];
    uint64_t v16 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v17 = *MEMORY[0x1E4F55108];
    if ([v15 containsObject:*MEMORY[0x1E4F55108]]) {
      objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v11), v17);
    }
    uint64_t v18 = *MEMORY[0x1E4F55128];
    if ([v15 containsObject:*MEMORY[0x1E4F55128]]) {
      objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v10), v18);
    }
    uint64_t v19 = *MEMORY[0x1E4F55130];
    if ([v15 containsObject:*MEMORY[0x1E4F55130]]) {
      objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v7), v19);
    }
    uint64_t v20 = *MEMORY[0x1E4F55110];
    if ([v15 containsObject:*MEMORY[0x1E4F55110]]) {
      objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", v9), v20);
    }
    uint64_t v21 = *MEMORY[0x1E4F55118];
    int v22 = [v15 containsObject:*MEMORY[0x1E4F55118]];
    if (v9)
    {
      if (v22)
      {
        int v23 = +[FigCaptureCameraParameters sharedInstance];
        long long v24 = [(NSDictionary *)self->_sensorIDDictionary objectForKeyedSubscript:@"TemporalNoiseReductionParameters"];
        if (v24
          || (long long v24 = [(FigCaptureCameraParameters *)v23 temporalNoiseReductionParameters]) != 0)
        {
          int height_high = HIDWORD(self->_centerStageRectOfInterest.size.height);
          unint64_t v26 = height_high <= 2
              ? @"Band0StrengthModulationEnterThreshold"
              : @"ActionCamBand0StrengthModulationEnterThreshold";
          BOOL v27 = height_high <= 2
              ? @"Band0StrengthModulationExitThreshold"
              : @"ActionCamBand0StrengthModulationExitThreshold";
          id v28 = [(NSDictionary *)v24 objectForKeyedSubscript:v26];
          uint64_t v29 = [(NSDictionary *)v24 objectForKeyedSubscript:v27];
          if (v29)
          {
            if (v28)
            {
              float v30 = (void *)v29;
              [v28 floatValue];
              int v32 = v31;
              [v30 floatValue];
              int v34 = v33;
              v38[0] = *MEMORY[0x1E4F550F8];
              LODWORD(v35) = v32;
              v39[0] = [NSNumber numberWithFloat:v35];
              v38[1] = *MEMORY[0x1E4F55100];
              LODWORD(v36) = v34;
              v39[1] = [NSNumber numberWithFloat:v36];
              objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v39, v38, 2), v21);
            }
          }
        }
      }
    }
    uint64_t v37 = *MEMORY[0x1E4F55120];
    if ([v15 containsObject:*MEMORY[0x1E4F55120]]) {
      objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v8), v37);
    }
    if (![(BWFigCaptureStream *)self->_stream setProperty:*MEMORY[0x1E4F54C18] value:v16]) {
      HIDWORD(self->_stillImageNoiseAndSharpeningParameters) = v9;
    }
  }
}

- (void)willBecomeSlaveStream
{
}

- (void)didBecomeSlaveStream
{
  self->_isSlave = 1;
  -[BWFigVideoCaptureStream _updateMasterSlavePropertiesOnStream]((uint64_t)self);
}

- (CGPoint)opticalCenterOffsetCalibratedForNarrowerFieldOfView
{
  objc_copyStruct(v4, &self->_opticalCenterOffsetCalibratedForNarrowerFieldOfView, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)opticalCenterOffsetCalibratedForNarrowerFieldOfViewInPhysicalSensorDimensions
{
  objc_copyStruct(v4, &self->_opticalCenterOffsetCalibratedForNarrowerFieldOfViewInPhysicalSensorDimensions, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)didBecomeMasterStream
{
}

- (BOOL)videoHDRFusionEnabled
{
  return HIBYTE(self->_keypointDetectionConfiguration);
}

- (float)maximumSupportedFrameRate
{
  return self->_maximumSupportedFrameRate;
}

- (float)maximumFrameRateForSensorRawOutputBufferPoolRequirements
{
  return self->_maximumFrameRateForSensorRawOutputBufferPoolRequirements;
}

- (BOOL)enablesSphereWhenAvailable
{
  return [(BWSphereModeSelector *)self->_sphereModeSelector enablesSphereWhenAvailable];
}

- (void)setMomentCaptureVideoRecordingAEMaxGain:(float)a3
{
  *((float *)&self->_maxExposureDurationFrameworkOverride.epoch + 1) = a3;
}

- (BOOL)sphereVideoSupported
{
  return [(BWSphereModeSelector *)self->_sphereModeSelector sphereVideoSupported];
}

- (void)setVisualIntelligenceCameraEnabled:(BOOL)a3
{
}

- (void)setDepthDataDeliveryEnabled:(BOOL)a3
{
}

- (void)setAvoidsSphereRecentering:(BOOL)a3
{
}

- (void)serviceNondisruptiveSwitchingFormatForZoomFactor:(float)a3 frameStatistics:(id)a4 imageControlMode:(int)a5 stillImageDigitalFlashMode:(int)a6 isStationary:(BOOL)a7 binnedSIFROnSecondaryStreamAllowed:(BOOL)a8 ignoreZoomFactorAndQuadraSubPixelSceneMonitoring:(BOOL)a9 ultraHighResolutionZeroShutterLagEnabled:(BOOL)a10
{
  if (*(void *)&self->_centerStageFramingMode || *(void *)&self->_backgroundReplacementEnabled)
  {
    BYTE1(v12) = a10;
    LOBYTE(v12) = a9;
    uint64_t v11 = -[NSDictionary formatIndexForZoomFactor:frameStatistics:imageControlMode:stillImageDigitalFlashMode:isStationary:isSecondaryStream:binnedSIFROnSecondaryStreamAllowed:ignoreZoomFactorAndQuadraSubPixelSceneMonitoring:ultraHighResolutionZeroShutterLagEnabled:](self->_zoomFactorToNondisruptiveSwitchingFormatIndexSIFRNonBinned, "formatIndexForZoomFactor:frameStatistics:imageControlMode:stillImageDigitalFlashMode:isStationary:isSecondaryStream:binnedSIFROnSecondaryStreamAllowed:ignoreZoomFactorAndQuadraSubPixelSceneMonitoring:ultraHighResolutionZeroShutterLagEnabled:", a4, *(void *)&a5, *(void *)&a6, a7, self->_isSlave, a8, v12);
    [(BWFigVideoCaptureStream *)self setActiveNondisruptiveSwitchingFormatIndex:v11];
  }
  else
  {
    FigDebugAssert3();
  }
}

- (void)updateClientAuditToken:(id *)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  p_streamStateLock = &self->_streamStateLock;
  os_unfair_lock_lock(&self->_streamStateLock);
  long long v6 = *(_OWORD *)&self->_clientAuditToken.val[4];
  long long v24 = *(_OWORD *)self->_clientAuditToken.val;
  long long v25 = v6;
  long long v7 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)self->_clientAuditToken.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&self->_clientAuditToken.val[4] = v7;
  long long v8 = *(_OWORD *)&a3->var0[4];
  long long v22 = *(_OWORD *)a3->var0;
  long long v23 = v8;
  self->_clientPID = FigCaptureGetPIDFromAuditToken(&v22);
  long long v9 = *(_OWORD *)&self->_clientAuditToken.val[4];
  long long v22 = *(_OWORD *)self->_clientAuditToken.val;
  long long v23 = v9;
  if (self->_started && !self->_suspended)
  {
    id v10 = +[BWCameraStreamingMonitor sharedCameraStreamingMonitor];
    uint64_t deviceType = self->_deviceType;
    int64_t epoch = self->_lastValidPTS.epoch;
    tccIdentity = self->_tccIdentity;
    mediaEnvironment = self->_mediaEnvironment;
    long long v20 = v22;
    long long v21 = v23;
    [v10 setStreaming:1 deviceType:deviceType streamUniqueID:epoch clientAuditToken:&v20 tccIdentity:tccIdentity mediaEnvironment:mediaEnvironment completionHandler:0];
    id v15 = +[BWCameraStreamingMonitor sharedCameraStreamingMonitor];
    uint64_t v16 = self->_deviceType;
    int64_t v17 = self->_lastValidPTS.epoch;
    uint64_t v18 = self->_tccIdentity;
    uint64_t v19 = self->_mediaEnvironment;
    long long v20 = v24;
    long long v21 = v25;
    [v15 setStreaming:0 deviceType:v16 streamUniqueID:v17 clientAuditToken:&v20 tccIdentity:v18 mediaEnvironment:v19 completionHandler:0];
  }
  os_unfair_lock_unlock(p_streamStateLock);
}

- (int)sourceNodeWillEmitPointCloudSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  [(BWFigVideoCaptureStreamDelegate *)self->_delegate captureStream:self willEmitPointCloudSampleBuffer:a3];
  return figVideoCaptureStream_blackenFrameIfNecessary((uint64_t)self, a3);
}

- (int)sourceNodeWillEmitVideoSampleBuffer:(opaqueCMSampleBuffer *)a3 drivesCameraControls:(BOOL)a4 deliversStills:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  CMTimeValue value = *MEMORY[0x1E4F1F9F8];
  CMTimeScale timescale = *(_DWORD *)(MEMORY[0x1E4F1F9F8] + 8);
  if (a4)
  {
    if ([(BWFigVideoCaptureStream *)self sphereEnabled]) {
      -[BWFigVideoCaptureStream _updateMotionDataStatus:]((uint64_t)self, a3);
    }
    -[BWFigVideoCaptureStream _updateAutoFocusPositionSensorModeForSampleBuffer:](self, a3);
  }
  [(BWFigVideoCaptureStreamDelegate *)self->_delegate captureStream:self willEmitVideoSampleBuffer:a3 drivesCameraControls:v6];
  if (HIDWORD(self->_stillImageNoiseAndSharpeningParameters)) {
    objc_msgSend((id)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0), "setObject:forKeyedSubscript:", MEMORY[0x1E4F1CC38], *MEMORY[0x1E4F54320]);
  }
  fvcs_removeSampleBufferPixelBufferMetadata(a3);
  int v9 = figVideoCaptureStream_blackenFrameIfNecessary((uint64_t)self, a3);
  if (v9)
  {
    FigDebugAssert3();
  }
  else
  {
    if (self->_keypointDetectionEnabled
      && self->_ambientViewingEnvironment
      && !self->_stillImageKeypointDetectionEnabled)
    {
      ImageBuffer = CMSampleBufferGetImageBuffer(a3);
      CVBufferSetAttachment(ImageBuffer, (CFStringRef)*MEMORY[0x1E4F249F0], self->_ambientViewingEnvironment, kCVAttachmentMode_ShouldPropagate);
    }
    if (self->_timeMachine && v5) {
      -[BWFigVideoCaptureStream _serviceTimeMachineWithSampleBuffer:]((uint64_t)self, a3);
    }
    ++HIDWORD(self->_lastValidPTS.value);
    CMSampleBufferGetPresentationTimeStamp(&v14, a3);
    CMTimeValue value = v14.value;
    uint32_t flags = v14.flags;
    CMTimeScale timescale = v14.timescale;
    if (v14.flags)
    {
      CMTimeEpoch epoch = v14.epoch;
      if ((self->_averageFrameRateCalculationLock._os_unfair_lock_opaque & 1) == 0)
      {
        HIDWORD(self->_previewShiftAtBaseZoom.y) = timescale;
        *(void *)((char *)&self->_previewShiftAtBaseZoom.x + 4) = value;
        self->_averageFrameRateCalculationLock._uint64_t os_unfair_lock_opaque = flags;
        *(void *)(&self->_averageFrameRateCalculationLock + 1) = epoch;
      }
      self->_firstValidPTS.uint32_t flags = timescale;
      *(int64_t *)((char *)&self->_firstValidPTS.value + 4) = value;
      LODWORD(self->_firstValidPTS.epoch) = flags;
      *(int64_t *)((char *)&self->_firstValidPTS.epoch + 4) = epoch;
    }
  }
  return v9;
}

- _updateAutoFocusPositionSensorModeForSampleBuffer:(_DWORD *)result
{
  if (result)
  {
    double v2 = result;
    CGPoint result = (_DWORD *)objc_msgSend((id)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0), "objectForKeyedSubscript:", *MEMORY[0x1E4F53CD8]);
    if (result)
    {
      CGPoint result = (_DWORD *)[result intValue];
      v2[212] = result;
    }
  }
  return result;
}

- (void)_updateMotionDataStatus:(uint64_t)a1
{
  if (a1)
  {
    double v3 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0);
    if (v3 && (id v4 = (void *)[v3 objectForKeyedSubscript:*MEMORY[0x1E4F53FA0]]) != 0)
    {
      unsigned int v5 = [v4 unsignedIntValue];
      if ((v5 & 9) != 0) {
        LOBYTE(v6) = 1;
      }
      else {
        int v6 = (v5 >> 1) & 1;
      }
    }
    else
    {
      LOBYTE(v6) = 0;
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 432));
    *(unsigned char *)(a1 + 437) = v6;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 432));
  }
}

- (void)setFastSwitchingMainFormatIndex:(int)a3
{
  self->_int fastSwitchingMainFormatIndex = a3;
}

- (int)setActiveFormatIndex:(int)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (self->_activeFormatIndex == a3) {
    return 0;
  }
  uint64_t v3 = *(void *)&a3;
  if (a3 < 0 || [(NSArray *)self->_supportedFormats count] <= a3) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A8] reason:@"Can't set active format index: because the specified format is outside the supported format range. Use -supportedFormats." userInfo:0]);
  }
  int fastSwitchingMainFormatIndex = self->_fastSwitchingMainFormatIndex;
  if (fastSwitchingMainFormatIndex < 0)
  {
    int v8 = -[BWFigCaptureStream setProperty:value:](self->_stream, "setProperty:value:", @"FormatIndex", [NSNumber numberWithInt:v3]);
    int v19 = v8;
    if (!v8)
    {
      self->_unsigned int activeFormatIndex = v3;
      goto LABEL_13;
    }
    int v15 = v8;
LABEL_25:
    FigDebugAssert3();
    return v15;
  }
  if (self->_activeFastSwitchingMainFormatIndex != fastSwitchingMainFormatIndex
    && self->_activeFormatIndex != fastSwitchingMainFormatIndex)
  {
    int v6 = -[BWFigCaptureStream setProperty:value:](self->_stream, "setProperty:value:", @"FormatIndex", objc_msgSend(NSNumber, "numberWithInt:"));
    if (v6)
    {
      int v15 = v6;
      goto LABEL_25;
    }
    int fastSwitchingMainFormatIndex = self->_fastSwitchingMainFormatIndex;
  }
  self->_int activeFastSwitchingMainFormatIndex = fastSwitchingMainFormatIndex;
  self->_unsigned int activeFormatIndex = v3;
  int v7 = [(BWFigVideoCaptureStream *)self setActiveNondisruptiveSwitchingFormatIndex:v3];
  int v19 = v7;
  if (v7)
  {
    int v15 = v7;
    goto LABEL_25;
  }
  LODWORD(v3) = self->_activeFormatIndex;
LABEL_13:
  id v9 = [(NSArray *)self->_supportedFormats objectAtIndexedSubscript:(int)v3];
  LODWORD(v10) = objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E4F55300]), "intValue");
  LODWORD(v11) = objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E4F552F8]), "intValue");
  self->_aeMaxGain = v10;
  self->_momentCaptureVideoRecordingAEMaxGain = v11;
  -[BWFigVideoCaptureStream _recomputeOpticalCenterOffsets]((uint64_t)self);

  *(void *)&self->_masterToSlaveFrameRateRatio = [(BWFigCaptureStream *)self->_stream copyPropertyIfSupported:*MEMORY[0x1E4F54960] error:&v19];
  if (v19)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    int v19 = 0;
  }

  self->_geometricDistortionCoefficients = (NSDictionary *)[(BWFigCaptureStream *)self->_stream copyPropertyIfSupported:*MEMORY[0x1E4F54968] error:&v19];
  if (v19)
  {
    id v13 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    int v19 = 0;
  }

  self->_cameraViewMatrixCalibratedForNarrowerFieldOfView = (NSData *)[(BWFigCaptureStream *)self->_stream copyPropertyIfSupported:*MEMORY[0x1E4F54828] error:&v19];
  if (v19)
  {
    CMTime v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    int v19 = 0;
  }
  -[BWFigVideoCaptureStreamDelegate captureStreamDidChangeActiveFormatIndex:](self->_delegate, "captureStreamDidChangeActiveFormatIndex:", self, v17, v18);
  return v19;
}

- (int)activeFormatIndex
{
  return self->_activeFormatIndex;
}

- (void)_recomputeOpticalCenterOffsets
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    int v15 = 0;
    long long v13 = *MEMORY[0x1E4F1DAD8];
    CGPoint point = (CGPoint)*MEMORY[0x1E4F1DAD8];
    CFDictionaryRef v2 = (const __CFDictionary *)[*(id *)(a1 + 8) getPropertyIfSupported:*MEMORY[0x1E4F54B20] error:0];
    if (v2)
    {
      CGPointMakeWithDictionaryRepresentation(v2, &point);
    }
    else
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    double v4 = [(BWFigVideoCaptureStream *)a1 _convertOpticalCenterToOpticalCenterOffset:point.x error:point.y];
    *(double *)(a1 + 192) = v4;
    *(void *)(a1 + 200) = v5;
    *(double *)(a1 + 208) = -[BWFigVideoCaptureStream _convertOpticalCenterOffsetToPhysicalSensorDimensions:](a1, v4);
    *(void *)(a1 + 216) = v6;
    CFDictionaryRef v7 = (const __CFDictionary *)[*(id *)(a1 + 8) getPropertyIfSupported:*MEMORY[0x1E4F54B28] error:&v15];
    if (v7)
    {
      CGPointMakeWithDictionaryRepresentation(v7, &point);
      double v8 = [(BWFigVideoCaptureStream *)a1 _convertOpticalCenterToOpticalCenterOffset:point.x error:point.y];
      *(double *)(a1 + 224) = v8;
      *(void *)(a1 + 232) = v9;
      *(double *)(a1 + 240) = -[BWFigVideoCaptureStream _convertOpticalCenterOffsetToPhysicalSensorDimensions:](a1, v8);
      *(void *)(a1 + 248) = v10;
      char v11 = 1;
    }
    else
    {
      if (v15)
      {
        uint64_t v12 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      char v11 = 0;
      *(_OWORD *)(a1 + 224) = v13;
      *(_OWORD *)(a1 + 240) = v13;
    }
    *(unsigned char *)(a1 + 256) = v11;
  }
}

- (double)_convertOpticalCenterToOpticalCenterOffset:(double)a3 error:(double)a4
{
  if (!a1) {
    return 0.0;
  }
  double result = *MEMORY[0x1E4F1DAD8];
  int v6 = *(_DWORD *)(a1 + 916);
  if (v6 >= 1 && *(int *)(a1 + 920) >= 1 && (a3 != result || a4 != *(double *)(MEMORY[0x1E4F1DAD8] + 8))) {
    double result = a3 - (double)v6 * 0.5;
  }
  if (a2) {
    *a2 = 0;
  }
  return result;
}

- (NSArray)supportedOutputs
{
  return self->_supportedOutputs;
}

- (BOOL)sphereEnabled
{
  CFDictionaryRef v2 = self;
  p_sphereLock = &self->_sphereLock;
  os_unfair_lock_lock(&self->_sphereLock);
  LOBYTE(v2) = v2->_sphereEnabled;
  os_unfair_lock_unlock(p_sphereLock);
  return (char)v2;
}

- (CGPoint)previewShift
{
  nondisruptiveSwitchingFormatSelector = self->_nondisruptiveSwitchingFormatSelector;
  double v3 = *(double *)&self->_mainFormatSIFRBinningFactor;
  result.y = v3;
  result.x = *(double *)&nondisruptiveSwitchingFormatSelector;
  return result;
}

- (void)setStreamingRequiredWhenConfiguredAsSlave:(BOOL)a3
{
  if (BYTE4(self->_synchronizedStreamsGroup) != a3)
  {
    BYTE4(self->_synchronizedStreamsGroup) = a3;
    -[BWFigVideoCaptureStream _updateMasterSlavePropertiesOnStream]((uint64_t)self);
  }
}

- (void)setFirmwareTimeMachineEnabledWhenConfiguredAsSlave:(BOOL)a3
{
  BYTE6(self->_synchronizedStreamsGroup) = a3;
}

- (void)setFaceDetectionConfiguration:(id)a3
{
  p_lastFaceDetectionEnabled = &self->_lastFaceDetectionEnabled;
  os_unfair_lock_lock((os_unfair_lock_t)&self->_lastFaceDetectionEnabled);
  if (([*(id *)&self->_objectDetectionStartupDeferred isEqualToDictionary:a3] & 1) == 0)
  {

    *(void *)&self->_objectDetectionStartupDeferred = [a3 copy];
    -[BWFigVideoCaptureStream _propagateFaceAndObjectDetectionSettings]((uint64_t)self);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)p_lastFaceDetectionEnabled);
}

- (uint64_t)_propagateFaceAndObjectDetectionSettings
{
  if (result)
  {
    uint64_t v1 = result;
    int v2 = *(unsigned __int8 *)(result + 688);
    uint64_t v3 = *MEMORY[0x1E4F54B18];
    if ([*(id *)(result + 88) objectForKeyedSubscript:*MEMORY[0x1E4F54B18]])
    {
      if (v2) {
        double v4 = (void *)MEMORY[0x1E4F1CC08];
      }
      else {
        double v4 = -[BWFigVideoCaptureStream _captureStreamObjectDetectionConfiguration](v1);
      }
      CGPoint result = [*(id *)(v1 + 712) isEqualToDictionary:v4];
      if ((result & 1) == 0)
      {
        CFDictionaryRef v7 = (id *)(v1 + 712);
LABEL_16:
        [*(id *)(v1 + 8) setProperty:v3 value:v4];

        CGPoint result = v4;
        id *v7 = (id)result;
      }
    }
    else
    {
      uint64_t v3 = *MEMORY[0x1E4F54910];
      CGPoint result = [*(id *)(v1 + 88) objectForKeyedSubscript:*MEMORY[0x1E4F54910]];
      if (result)
      {
        uint64_t v5 = -[BWFigVideoCaptureStream _captureStreamFaceDetectionConfiguration](v1);
        if (([*(id *)(v1 + 720) isEqualToDictionary:v5] & 1) == 0)
        {
          [*(id *)(v1 + 8) setProperty:*MEMORY[0x1E4F54908] value:v5];

          *(void *)(v1 + 720) = v5;
        }
        BOOL v6 = !v2 && (unint64_t)(*(unsigned char *)(v1 + 704) != 0);
        double v4 = (void *)[NSNumber numberWithBool:v6];
        CGPoint result = [*(id *)(v1 + 728) isEqualToNumber:v4];
        if ((result & 1) == 0)
        {
          CFDictionaryRef v7 = (id *)(v1 + 728);
          goto LABEL_16;
        }
      }
    }
  }
  return result;
}

- (void)_captureStreamObjectDetectionConfiguration
{
  if (!a1) {
    return 0;
  }
  int v2 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  BOOL v3 = (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 696), "objectForKeyedSubscript:", *MEMORY[0x1E4F53948]), "BOOLValue") & 1) != 0
    || *(unsigned char *)(a1 + 705) != 0;
  int v4 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 696), "objectForKeyedSubscript:", *MEMORY[0x1E4F53940]), "BOOLValue");
  int v5 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 696), "objectForKeyedSubscript:", *MEMORY[0x1E4F53958]), "BOOLValue");
  if (v3 | v4 | v5) {
    uint64_t v6 = 6;
  }
  else {
    uint64_t v6 = 10;
  }
  if (([*(id *)(a1 + 680) containsObject:*MEMORY[0x1E4F538C8]] & 1) != 0 || *(unsigned char *)(a1 + 704))
  {
    uint64_t v7 = [NSNumber numberWithUnsignedInt:v6];
    [v2 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F54490]];
  }
  if ([*(id *)(a1 + 680) containsObject:*MEMORY[0x1E4F538D8]])
  {
    uint64_t v8 = [NSNumber numberWithUnsignedInt:(2 * v6)];
    [v2 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F544A0]];
  }
  if ([*(id *)(a1 + 680) containsObject:*MEMORY[0x1E4F538E0]])
  {
    uint64_t v9 = [NSNumber numberWithUnsignedInt:v6];
    [v2 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F544A8]];
  }
  if ([*(id *)(a1 + 680) containsObject:*MEMORY[0x1E4F538C0]])
  {
    uint64_t v10 = [NSNumber numberWithUnsignedInt:v6];
    [v2 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F54488]];
  }
  if ([*(id *)(a1 + 680) containsObject:*MEMORY[0x1E4F538D0]])
  {
    uint64_t v11 = [NSNumber numberWithUnsignedInt:v6];
    [v2 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F54498]];
  }
  if ([*(id *)(a1 + 680) containsObject:*MEMORY[0x1E4F538B0]])
  {
    uint64_t v12 = [NSNumber numberWithUnsignedInt:v6];
    [v2 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F54478]];
  }
  if ([*(id *)(a1 + 680) containsObject:*MEMORY[0x1E4F538B8]])
  {
    uint64_t v13 = [NSNumber numberWithUnsignedInt:v6];
    [v2 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F54480]];
  }
  if ([*(id *)(a1 + 680) containsObject:*MEMORY[0x1E4F538A0]])
  {
    uint64_t v14 = [NSNumber numberWithUnsignedInt:v6];
    [v2 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F54468]];
  }
  if ([*(id *)(a1 + 680) containsObject:*MEMORY[0x1E4F538A8]])
  {
    uint64_t v15 = [NSNumber numberWithUnsignedInt:v6];
    [v2 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F54470]];
  }
  if ([*(id *)(a1 + 680) containsObject:*MEMORY[0x1E4F538E8]])
  {
    uint64_t v16 = [NSNumber numberWithUnsignedInt:v6];
    [v2 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4F544B0]];
  }
  if ([*(id *)(a1 + 680) containsObject:*MEMORY[0x1E4F538F0]])
  {
    uint64_t v17 = [NSNumber numberWithUnsignedInt:v6];
    [v2 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F544B8]];
    if (!v3)
    {
LABEL_31:
      if (!v5) {
        goto LABEL_32;
      }
      goto LABEL_36;
    }
  }
  else if (!v3)
  {
    goto LABEL_31;
  }
  [v2 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F54458]];
  if (!v5)
  {
LABEL_32:
    if (!v4) {
      return v2;
    }
    goto LABEL_37;
  }
LABEL_36:
  [v2 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F54460]];
  if (v4) {
LABEL_37:
  }
    [v2 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F54450]];
  return v2;
}

- (void)willBecomeMasterStream
{
  self->_isSlave = 0;
  [(BWStillImageTimeMachine *)self->_timeMachine resume];
  -[BWFigVideoCaptureStream _updateMasterSlavePropertiesOnStream]((uint64_t)self);
}

- (void)setCinematicFramingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  LOBYTE(self->_videoCaptureDimensions.height) = a3;
  if ([(NSDictionary *)self->_supportedProperties objectForKeyedSubscript:@"CMIOCinematicFramingEnabled"])
  {
    stream = self->_stream;
    uint64_t v6 = [NSNumber numberWithBool:v3];
    [(BWFigCaptureStream *)stream setPropertyIfSupported:@"CMIOCinematicFramingEnabled" value:v6];
  }
}

- (BOOL)suspended
{
  return self->_suspended;
}

- (int)start
{
  return [(BWFigCaptureStream *)self->_stream start];
}

- (void)sourceNodeWillStartStreaming
{
  if (LOBYTE(self->_stillImageBufferTimeMachineHandler))
  {
    *(void *)&self->_stillImageCaptureEnabled = FigDispatchQueueCreateWithPriority();
    self->_stillImageCaptureDelegate = (BWFigVideoCaptureStreamStillImageCaptureDelegate *)dispatch_group_create();
    [(BWFigCaptureStream *)self->_stream registerForNotification:*MEMORY[0x1E4F54440] listener:self callback:fvcs_handleStillImageCaptureFailureNotification];
    [(BWFigCaptureStream *)self->_stream registerForNotification:*MEMORY[0x1E4F54430] listener:self callback:fvcs_handleFlashNotification];
    [(BWFigCaptureStream *)self->_stream registerForNotification:*MEMORY[0x1E4F54410] listener:self callback:fvcs_handleFlashNotification];
    if (self->_timeMachineEnabled) {
      self->_timeMachine = [[BWStillImageTimeMachine alloc] initWithCapacity:self->_timeMachineCapacity];
    }
    if ([(BWSphereModeSelector *)self->_sphereModeSelector enablesSphereWhenAvailable]) {
      [(BWFigVideoCaptureStream *)self setMotionDataDeliveryEnabled:1];
    }
  }
  [(BWFigVideoCaptureStream *)self maxExposureDuration];
  memset(&v3, 0, sizeof(v3));
  [(BWFigVideoCaptureStream *)(id *)&self->super.isa _setMaxExposureDuration:0.0];
  -[BWFigVideoCaptureStream _updateAETables]((uint64_t)self);
  *(_DWORD *)&self->_unifiedBracketingEnabled = 0;
  LOBYTE(self->_uniqueID) = 0;
  os_unfair_lock_lock((os_unfair_lock_t)&self->_lastFaceDetectionEnabled);
  -[BWFigVideoCaptureStream _propagateFaceAndObjectDetectionSettings]((uint64_t)self);
  os_unfair_lock_unlock((os_unfair_lock_t)&self->_lastFaceDetectionEnabled);
  [(NSDictionary *)self->_zoomFactorToNondisruptiveSwitchingFormatIndexSIFRNonBinned setVideoStabilizationStrength:HIDWORD(self->_centerStageRectOfInterest.size.height)];
  [(BWFigVideoCaptureStreamDelegate *)self->_delegate captureStreamWillStartStreaming:self];
  [(BWFigCaptureStream *)self->_stream setStartStopDelegate:self];
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)maxExposureDuration
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)((char *)self + 852);
  if ((retstr->var2 & 1) == 0) {
    *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)((char *)self + 876);
  }
  return self;
}

- (void)setObjectDetector:(id)a3
{
}

- (void)setMaximumSupportedFrameRate:(float)a3
{
  if (![(BWFigCaptureStream *)self->_stream streaming])
  {
    *(float *)&double v5 = a3;
    -[BWFigCaptureStream setPropertyIfSupported:value:](self->_stream, "setPropertyIfSupported:value:", @"MaximumAllowedFrameRate", [NSNumber numberWithFloat:v5]);
LABEL_6:
    self->_uint64_t maximumSupportedFrameRate = a3;
    return;
  }
  if (self->_maximumSupportedFrameRate == a3) {
    goto LABEL_6;
  }
  objc_msgSend(-[BWFigCaptureStream getPropertyIfSupported:error:](self->_stream, "getPropertyIfSupported:error:", @"MaximumAllowedFrameRate", 0), "floatValue");
  if (v6 == a3) {
    goto LABEL_6;
  }
}

- (void)setFaceDetector:(id)a3
{
}

- (uint64_t)_updateAETables
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = *MEMORY[0x1E4F54758];
    CGPoint result = [*(id *)(result + 88) objectForKeyedSubscript:*MEMORY[0x1E4F54758]];
    if (result)
    {
      CMTime v3 = *(void **)(v1 + 8);
      uint64_t v4 = -[BWFigVideoCaptureStream _aeTables](v1);
      return [v3 setProperty:v2 value:v4];
    }
  }
  return result;
}

- (id)_setMaxExposureDuration:(double)a3
{
  if (result)
  {
    uint64_t v4 = result;
    CMTimeFlags flags = a2->flags;
    if ((flags & 1) == 0)
    {
      if (!*((unsigned char *)result + 900)) {
        return result;
      }
      [result minimumFrameRate];
      if (v6 <= 1.0)
      {
        int32_t v8 = 1;
      }
      else
      {
        [v4 minimumFrameRate];
        int32_t v8 = (int)v7;
      }
      CMTimeMake(&v10, 1, v8);
      HIDWORD(a3) = HIDWORD(v10.value);
      *a2 = v10;
    }
    *(float *)&a3 = (float)((float)a2->value / (float)a2->timescale) * 1000.0;
    float v9 = ceilf(*(float *)&a3);
    if ((flags & 1) == 0) {
      *(float *)&a3 = v9;
    }
    CGPoint result = (id *)objc_msgSend(v4[1], "setProperty:value:", *MEMORY[0x1E4F54AB8], objc_msgSend(NSNumber, "numberWithFloat:", a3));
    if (!result) {
      *((unsigned char *)v4 + 900) = 1;
    }
  }
  return result;
}

- (void)captureStreamDidStart
{
}

- (void)_logStreamingPowerEvent:(uint64_t)a1
{
  if (a1)
  {
    char v2 = a2;
    if (a2)
    {
      memset(v16, 0, sizeof(v16));
      int v17 = 0;
      LOBYTE(v16[0]) = *(unsigned char *)(a1 + 801);
      DWORD1(v16[0]) = *(_DWORD *)(a1 + 68);
      BYTE8(v16[0]) = *(unsigned char *)(a1 + 796);
      *(long long *)((char *)v16 + 12) = *(_OWORD *)(a1 + 916);
      BYTE12(v16[1]) = *(unsigned char *)(a1 + 980);
      *(_WORD *)((char *)&v16[1] + 13) = *(_WORD *)(a1 + 981);
      HIBYTE(v16[1]) = *(unsigned char *)(a1 + 984);
      LOBYTE(v17) = *(unsigned char *)(a1 + 940);
      int v4 = *(_DWORD *)(a1 + 360);
      double v5 = *(const void **)(a1 + 368);
      int v6 = *(_DWORD *)(a1 + 332);
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = [MEMORY[0x1E4F1C9C8] date];
      [(id)a1 averageFrameRate];
      FigCaptureLogCameraStreamingPowerEvent(v4, v5, v6, v2, v7, v8, [(id)a1 continuityCameraIsWired], objc_msgSend((id)a1, "isDeskCamActive"), v9, v16);
    }
    else
    {
      int v10 = *(_DWORD *)(a1 + 360);
      uint64_t v11 = *(const void **)(a1 + 368);
      int v12 = *(_DWORD *)(a1 + 332);
      uint64_t v13 = *(void *)(a1 + 32);
      uint64_t v14 = [MEMORY[0x1E4F1C9C8] date];
      [(id)a1 averageFrameRate];
      FigCaptureLogCameraStreamingPowerEvent(v10, v11, v12, v2, v13, v14, [(id)a1 continuityCameraIsWired], objc_msgSend((id)a1, "isDeskCamActive"), v15, 0);
    }
  }
}

- (BOOL)isDeskCamActive
{
  return self->_numberOfBuffersEmitted;
}

- (BOOL)continuityCameraIsWired
{
  return BYTE1(self->_numberOfBuffersEmitted);
}

- (float)averageFrameRate
{
  p_previewShiftAtBaseZoom = &self->_previewShiftAtBaseZoom;
  os_unfair_lock_lock((os_unfair_lock_t)&self->_previewShiftAtBaseZoom);
  float v4 = 0.0;
  if (self->_firstValidPTS.epoch & 1) != 0 && (self->_averageFrameRateCalculationLock._os_unfair_lock_opaque)
  {
    if (HIDWORD(self->_lastValidPTS.value))
    {
      CMTime lhs = *(CMTime *)((char *)&self->_firstValidPTS + 4);
      CMTime v7 = *(CMTime *)((char *)&self->_previewShiftAtBaseZoom.x + 4);
      CMTimeSubtract(&time, &lhs, &v7);
      float Seconds = CMTimeGetSeconds(&time);
      if (Seconds != INFINITY) {
        float v4 = (float)HIDWORD(self->_lastValidPTS.value) / Seconds;
      }
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)p_previewShiftAtBaseZoom);
  if (v4 == INFINITY) {
    return 0.0;
  }
  else {
    return v4;
  }
}

- (uint64_t)_aeTables
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    if (*(unsigned char *)(result + 915))
    {
      uint64_t v1 = 5;
    }
    else
    {
      if (*(unsigned char *)(result + 914))
      {
        long long v10 = 0u;
        long long v11 = 0u;
        long long v8 = 0u;
        long long v9 = 0u;
        char v2 = objc_msgSend(*(id *)(result + 744), "activeStreams", 0);
        uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v14 count:16];
        if (v3)
        {
          uint64_t v4 = v3;
          uint64_t v5 = *(void *)v9;
          uint64_t v6 = *MEMORY[0x1E4F52DF0];
          while (2)
          {
            for (uint64_t i = 0; i != v4; ++i)
            {
              if (*(void *)v9 != v5) {
                objc_enumerationMutation(v2);
              }
              if (objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * i), "portType"), "isEqualToString:", v6))
              {
                uint64_t v1 = 6;
                goto LABEL_17;
              }
            }
            uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v14 count:16];
            uint64_t v1 = 1;
            if (v4) {
              continue;
            }
            goto LABEL_17;
          }
        }
      }
      else if (!*(unsigned char *)(result + 913))
      {
        if (*(unsigned char *)(result + 840))
        {
          uint64_t v1 = 2;
        }
        else
        {
          if (!*(unsigned char *)(result + 912)) {
            return 0;
          }
          uint64_t v1 = 3;
        }
        goto LABEL_17;
      }
      uint64_t v1 = 1;
    }
LABEL_17:
    int v12 = &unk_1EFAFF018;
    uint64_t v13 = [NSNumber numberWithInt:v1];
    return [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  }
  return result;
}

- (void)sourceNodeDidStartStreaming
{
  p_streamStateLock = &self->_streamStateLock;
  os_unfair_lock_lock(&self->_streamStateLock);
  if (!self->_suspended)
  {
    id v4 = +[BWCameraStreamingMonitor sharedCameraStreamingMonitor];
    uint64_t deviceType = self->_deviceType;
    int64_t epoch = self->_lastValidPTS.epoch;
    tccIdentity = self->_tccIdentity;
    mediaEnvironment = self->_mediaEnvironment;
    long long v9 = *(_OWORD *)&self->_clientAuditToken.val[4];
    v10[0] = *(_OWORD *)self->_clientAuditToken.val;
    v10[1] = v9;
    [v4 setStreaming:1 deviceType:deviceType streamUniqueID:epoch clientAuditToken:v10 tccIdentity:tccIdentity mediaEnvironment:mediaEnvironment completionHandler:0];
  }
  self->_started = 1;
  os_unfair_lock_unlock(p_streamStateLock);
  [(BWFigVideoCaptureStreamDelegate *)self->_delegate captureStreamDidStartStreaming:self];
}

- (OS_tcc_identity)tccIdentity
{
  return self->_tccIdentity;
}

- (NSString)mediaEnvironment
{
  return self->_mediaEnvironment;
}

- (void)setUsesStillFusionReferenceFramePTSForDidCaptureCallback:(BOOL)a3
{
  BYTE4(self->_largestStillImagePTS.epoch) = a3;
}

- (void)setTimeMachineEnabled:(BOOL)a3
{
  if (self->_started) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"Can't invoke timeMachineEnabled: while streaming" userInfo:0]);
  }
  self->_timeMachineEnabled = a3;
}

- (void)setVideoStabilizationStrength:(int)a3
{
  HIDWORD(self->_centerStageRectOfInterest.size.height) = a3;
}

- (void)sourceNodeWillEmitDetectedFacesSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  p_cameraAccessLock = &self->_cameraAccessLock;
  os_unfair_lock_lock(&self->_cameraAccessLock);
  if (self->_clientProcessHasAccessToCamera)
  {
    BOOL blackenFramesForContinuityDisplayConnected = self->_blackenFramesForContinuityDisplayConnected;
    os_unfair_lock_unlock(p_cameraAccessLock);
    if (!blackenFramesForContinuityDisplayConnected) {
      return;
    }
  }
  else
  {
    os_unfair_lock_unlock(p_cameraAccessLock);
  }
  CMTime v7 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  if (v7)
  {
    long long v8 = v7;
    [v7 setObject:0 forKeyedSubscript:*MEMORY[0x1E4F53DC0]];
    uint64_t v9 = *MEMORY[0x1E4F53DC8];
    [v8 setObject:0 forKeyedSubscript:v9];
  }
  else
  {
    FigDebugAssert3();
  }
}

- (void)setDetectedObjectTypes:(id)a3
{
  p_lastFaceDetectionEnabled = &self->_lastFaceDetectionEnabled;
  os_unfair_lock_lock((os_unfair_lock_t)&self->_lastFaceDetectionEnabled);
  if (([*(id *)&self->_lastDigitalFlashSphereOffsetOpticalCenter.y isEqualToSet:a3] & 1) == 0)
  {

    *(void *)&self->_lastDigitalFlashSphereOffsetOpticalCenter.y = [a3 copy];
    -[BWFigVideoCaptureStream _propagateFaceAndObjectDetectionSettings]((uint64_t)self);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)p_lastFaceDetectionEnabled);
}

- (BOOL)synchronizedStreamsEnabled
{
  return BYTE5(self->_lastFaceDetectionEnabled) & 1;
}

- (NSString)uniqueID
{
  return (NSString *)self->_lastValidPTS.epoch;
}

- (int)lastStillImageCaptureType
{
  return self->_lastStillImageCaptureType;
}

- (void)setBlackenFramesForContinuityDisplayConnected:(BOOL)a3
{
  int v3 = a3;
  p_cameraAccessLock = &self->_cameraAccessLock;
  os_unfair_lock_lock(&self->_cameraAccessLock);
  int blackenFramesForContinuityDisplayConnected = self->_blackenFramesForContinuityDisplayConnected;
  self->_int blackenFramesForContinuityDisplayConnected = v3;
  if (blackenFramesForContinuityDisplayConnected != v3)
  {
    if (v3)
    {
      if (dword_1EB4C5010) {
        goto LABEL_6;
      }
    }
    else if (dword_1EB4C5010)
    {
LABEL_6:
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  os_unfair_lock_unlock(p_cameraAccessLock);
}

- (void)setStillImageCaptureEnabled:(BOOL)a3
{
  if (self->_started) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"Can't invoke setStillImageCaptureEnabled: while streaming" userInfo:0]);
  }
  LOBYTE(self->_stillImageBufferTimeMachineHandler) = a3;
}

- (void)setSphereThermalLevel:(int)a3
{
  [(BWSphereModeSelector *)self->_sphereModeSelector setSystemThermalLevel:*(void *)&a3];
  -[BWFigVideoCaptureStream _updateSphereMode]((uint64_t)self);
}

- (NSString)nonLocalizedName
{
  return self->_nonLocalizedName;
}

- (void)setEnablesSphereWhenAvailable:(BOOL)a3
{
  [(BWSphereModeSelector *)self->_sphereModeSelector setEnablesSphereWhenAvailable:a3];
  -[BWFigVideoCaptureStream _updateSphereMode]((uint64_t)self);
}

- (void)setSphereVideoEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  [(BWSphereModeSelector *)self->_sphereModeSelector setSphereVideoRecenteringEnabled:0];
  [(BWSphereModeSelector *)self->_sphereModeSelector setSphereVideoEnabled:v3];
  -[BWFigVideoCaptureStream _updateSphereMode]((uint64_t)self);
}

- (void)setVariableFrameRateVideoEnabled:(BOOL)a3
{
  *(&self->_maxExposureDurationHasBeenSet + 3) = a3;
  -[BWSphereModeSelector setVariableFrameRateVideoEnabled:](self->_sphereModeSelector, "setVariableFrameRateVideoEnabled:");
}

- (void)setStreamingFrameRateForZoomPIPOverlay:(float)a3
{
  self->_averageFrameRate = a3;
}

- (void)setContinuityCameraIsWired:(BOOL)a3
{
  BYTE1(self->_numberOfBuffersEmitted) = a3;
}

- (void)setContinuityCameraClientDeviceClass:(int)a3
{
  HIDWORD(self->_uniqueID) = a3;
}

- (void)setDigitalFlashEnabled:(BOOL)a3
{
  LOBYTE(self->_band0StrengthModulation) = a3;
}

- (void)setZeroShutterLagEnabled:(BOOL)a3
{
  if (BYTE1(self->_band0StrengthModulation) != a3)
  {
    BYTE1(self->_band0StrengthModulation) = a3;
    -[BWSphereModeSelector setZeroShutterLagEnabled:](self->_sphereModeSelector, "setZeroShutterLagEnabled:");
  }
}

- (void)setUnifiedBracketingEnabled:(BOOL)a3
{
  if (LOBYTE(self->_multiBandNoiseReductionMode) != a3) {
    LOBYTE(self->_multiBandNoiseReductionMode) = a3;
  }
}

- (void)setCinematicVideoEnabled:(BOOL)a3
{
  *(&self->_maxExposureDurationHasBeenSet + 2) = a3;
}

- (void)setHighlightRecoverySuspended:(BOOL)a3
{
  if (BYTE4(self->_keypointDetectionConfiguration)) {
    BOOL v5 = !a3;
  }
  else {
    BOOL v5 = 0;
  }
  if (!-[BWFigCaptureStream setPropertyIfSupported:value:](self->_stream, "setPropertyIfSupported:value:", *MEMORY[0x1E4F549A0], [NSNumber numberWithBool:v5]))BYTE3(self->_keypointDetectionConfiguration) = a3; {
}
  }

- (void)setBaseZoomFactor:(float)a3
{
  self->_baseZoomFactor = a3;
}

- (void)setStillImageCaptureDelegate:(id)a3
{
  self->_streamNotificationDispatchQueue = (OS_dispatch_queue *)a3;
}

- (int)continuityCameraClientDeviceClass
{
  return HIDWORD(self->_uniqueID);
}

- (float)maxEIT
{
  memset(&v6[32], 0, 24);
  if (!self || ([(BWFigVideoCaptureStream *)self maxExposureDuration], (v6[44] & 1) == 0))
  {
    if (self->_started)
    {
      int64_t v3 = (int)objc_msgSend(-[BWFigCaptureStream getProperty:error:](self->_stream, "getProperty:error:", *MEMORY[0x1E4F54AB8], 0), "intValue");
      int32_t maximumSupportedFrameRate = 1000;
    }
    else
    {
      int32_t maximumSupportedFrameRate = (int)self->_maximumSupportedFrameRate;
      int64_t v3 = 1;
    }
    CMTimeMake((CMTime *)v6, v3, maximumSupportedFrameRate);
    *(CMTime *)&v6[32] = *(CMTime *)v6;
  }
  *(CMTime *)uint64_t v6 = *(CMTime *)&v6[32];
  return CMTimeGetSeconds((CMTime *)v6) * *(float *)&self->_maxExposureDurationFrameworkOverride.epoch;
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

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWFigVideoCaptureStream;
  [(BWFigVideoCaptureStream *)&v3 dealloc];
}

- (NSString)description
{
  objc_super v3 = NSString;
  uint64_t v4 = objc_opt_class();
  return (NSString *)[v3 stringWithFormat:@"<%@: %p> %@", v4, self, BWPortTypeToDisplayString(self->_portType, v5)];
}

- (void)captureStreamDidStop
{
}

- (int)synchronizedStreamsGroupDidUpdateActiveNondisruptiveSwitchingFormatIndex:(int)a3 activeNondisruptiveSwitchingCommandID:(int)a4 maximumAllowedFrameRate:(int)a5 minimumFrameRate:(int)a6 maximumFrameRate:(int)a7
{
  if (self->_activeFormatIndex < 0) {
    return -12782;
  }
  p_activeNondisruptiveSwitchingFormatIndexLock = &self->_activeNondisruptiveSwitchingFormatIndexLock;
  os_unfair_lock_lock(&self->_activeNondisruptiveSwitchingFormatIndexLock);
  self->_int activeNondisruptiveSwitchingFormatIndex = a3;
  self->_activeNondisruptiveSwitchingCommandID = a4;
  os_unfair_lock_unlock(p_activeNondisruptiveSwitchingFormatIndexLock);
  int result = 0;
  if (a5 && a6 && a7)
  {
    int result = [(BWFigVideoCaptureStream *)self isNondisruptiveFastSwitchingSupported];
    if (result)
    {
      int result = 0;
      self->_int32_t maximumSupportedFrameRate = (float)a5;
      self->_uint64_t minimumFrameRate = (float)a6;
      self->_uint64_t maximumFrameRate = (float)a7;
    }
  }
  return result;
}

- (int)activeNondisruptiveSwitchingFormatIndex
{
  char v2 = self;
  p_activeNondisruptiveSwitchingFormatIndexLock = &self->_activeNondisruptiveSwitchingFormatIndexLock;
  os_unfair_lock_lock(&self->_activeNondisruptiveSwitchingFormatIndexLock);
  LODWORD(v2) = v2->_activeNondisruptiveSwitchingFormatIndex;
  os_unfair_lock_unlock(p_activeNondisruptiveSwitchingFormatIndexLock);
  return (int)v2;
}

- ($2825F4736939C4A6D3AD43837233062D)activeSensorDimensions
{
  unsigned int v3 = [(BWFigVideoCaptureStream *)self activeNondisruptiveSwitchingFormatIndex];
  if ((v3 & 0x80000000) != 0)
  {
    float aeMaxGain = self->_aeMaxGain;
    uint64_t momentCaptureVideoRecordingAEMaxGain_low = LODWORD(self->_momentCaptureVideoRecordingAEMaxGain);
  }
  else
  {
    id v4 = [(NSArray *)self->_supportedFormats objectAtIndexedSubscript:v3];
    LODWORD(aeMaxGain) = objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E4F55300]), "intValue");
    uint64_t momentCaptureVideoRecordingAEMaxGain_low = objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E4F552F8]), "intValue");
  }
  return ($2825F4736939C4A6D3AD43837233062D)(LODWORD(aeMaxGain) | (unint64_t)(momentCaptureVideoRecordingAEMaxGain_low << 32));
}

- (BOOL)rawBufferCompandingEnabled
{
  return self->_rawBufferCompandingEnabled;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)updateMaxExposureDurationClientOverride:(SEL)a3
{
  if (LOBYTE(self[1].var0)
    && (uint64_t v6 = self,
        p_var2 = &self[35].var2,
        CMTime time1 = *(CMTime *)a4,
        CMTime v10 = *(CMTime *)((char *)self + 852),
        self = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeCompare(&time1, &v10),
        self))
  {
    long long v8 = *(_OWORD *)&a4->var0;
    *((void *)p_var2 + 2) = a4->var3;
    *(_OWORD *)p_var2 = v8;
    *(void *)&retstr->var1 = 0;
    retstr->var3 = 0;
    retstr->var0 = 0;
    [($3CC8671D27C23BF42ADDB32F2B5E48AE *)v6 maxExposureDuration];
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)[(BWFigVideoCaptureStream *)(id *)v6 _setMaxExposureDuration:*(double *)&retstr->var0];
  }
  else
  {
    uint64_t v9 = MEMORY[0x1E4F1F9F0];
    *(_OWORD *)&retstr->var0 = *MEMORY[0x1E4F1F9F0];
    retstr->var3 = *(void *)(v9 + 16);
  }
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)updateMaxExposureDuration
{
  retstr->var0 = 0;
  *(void *)&retstr->var1 = 0;
  retstr->var3 = 0;
  if (self)
  {
    unsigned int v3 = (id *)self;
    [($3CC8671D27C23BF42ADDB32F2B5E48AE *)self maxExposureDuration];
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)[(BWFigVideoCaptureStream *)v3 _setMaxExposureDuration:*(double *)&retstr->var0];
  }
  return self;
}

- (__CFString)currentSphereMode
{
  return [(BWSphereModeSelector *)self->_sphereModeSelector currentSphereMode];
}

- (BOOL)avoidsSphereRecentering
{
  return [(BWSphereModeSelector *)self->_sphereModeSelector avoidsSphereRecentering];
}

- (BOOL)sphereVideoEnabled
{
  return [(BWSphereModeSelector *)self->_sphereModeSelector sphereVideoEnabled];
}

- (BOOL)depthDataDeliveryEnabled
{
  return [(BWSphereModeSelector *)self->_sphereModeSelector depthDataDeliveryEnabled];
}

- (BOOL)motionDataDeliveryEnabled
{
  return self->_motionDataDeliveryEnabled == 1;
}

- (BOOL)motionDataInvalid
{
  char v2 = self;
  p_sphereLock = &self->_sphereLock;
  os_unfair_lock_lock(&self->_sphereLock);
  LOBYTE(v2) = v2->_motionDataInvalid;
  os_unfair_lock_unlock(p_sphereLock);
  return (char)v2;
}

- (int)sphereThermalLevel
{
  return [(BWSphereModeSelector *)self->_sphereModeSelector systemThermalLevel];
}

- (void)setIsStationary:(BOOL)a3
{
  self->_isStationary = a3;
  sphereModeSelector = self->_sphereModeSelector;
  if (sphereModeSelector)
  {
    BOOL v5 = a3;
    if ([(BWSphereModeSelector *)sphereModeSelector tripodModeEnabled] != a3)
    {
      [(BWSphereModeSelector *)self->_sphereModeSelector setTripodModeEnabled:v5];
      -[BWFigVideoCaptureStream _updateSphereMode]((uint64_t)self);
    }
  }
}

- (BOOL)isStationary
{
  return self->_isStationary;
}

- (BOOL)faceDetectionEnabled
{
  return (BOOL)self->_faceDetectionConfiguration;
}

- (BOOL)eyeDetectionRequired
{
  return BYTE1(self->_faceDetectionConfiguration);
}

- (NSDictionary)faceDetectionConfiguration
{
  p_lastFaceDetectionEnabled = &self->_lastFaceDetectionEnabled;
  os_unfair_lock_lock((os_unfair_lock_t)&self->_lastFaceDetectionEnabled);
  id v4 = (NSDictionary *)(id)[*(id *)&self->_objectDetectionStartupDeferred copy];
  os_unfair_lock_unlock((os_unfair_lock_t)p_lastFaceDetectionEnabled);
  return v4;
}

- (NSSet)detectedObjectTypes
{
  char v2 = (void *)[*(id *)&self->_lastDigitalFlashSphereOffsetOpticalCenter.y copy];
  return (NSSet *)v2;
}

- (BOOL)objectDetectionStartupDeferred
{
  return (BOOL)self->_detectedObjectTypes;
}

- (void)_captureStreamFaceDetectionConfiguration
{
  if (!a1) {
    return 0;
  }
  char v2 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v3 = *MEMORY[0x1E4F53948];
  BOOL v4 = (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 696), "objectForKeyedSubscript:", *MEMORY[0x1E4F53948]), "BOOLValue") & 1) == 0
    && *(unsigned char *)(a1 + 705) == 0;
  uint64_t v5 = *MEMORY[0x1E4F53940];
  int v6 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 696), "objectForKeyedSubscript:", *MEMORY[0x1E4F53940]), "BOOLValue");
  CMTime v7 = *(void **)(a1 + 696);
  uint64_t v8 = *MEMORY[0x1E4F53958];
  int v9 = objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E4F53958]), "BOOLValue");
  int v10 = v9;
  if (v4)
  {
    if (!v9) {
      goto LABEL_7;
    }
LABEL_10:
    [v2 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v8];
    if (v6) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
  [v2 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v3];
  if (v10) {
    goto LABEL_10;
  }
LABEL_7:
  if (v6)
  {
LABEL_8:
    [v2 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v5];
LABEL_12:
    uint64_t v11 = [NSNumber numberWithUnsignedInt:6];
    [v2 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F53950]];
    return v2;
  }
LABEL_11:
  if ((!v4 | v10) == 1) {
    goto LABEL_12;
  }
  return v2;
}

- (int)stop
{
  int v3 = [*(id *)&self->_faceAndObjectDetectionLock._os_unfair_lock_opaque stopSupported];
  uint64_t v4 = 8;
  if (v3) {
    uint64_t v4 = 744;
  }
  uint64_t v5 = *(Class *)((char *)&self->super.isa + v4);
  return [v5 stop];
}

- (void)sourceNodeFailedToStartStreaming
{
}

- (void)sourceNodeWillStopStreaming
{
  p_streamStateLock = &self->_streamStateLock;
  os_unfair_lock_lock(&self->_streamStateLock);
  if (!self->_suspended)
  {
    [(BWFigVideoCaptureStreamDelegate *)self->_delegate captureStreamWillStopCameraStreamingMonitor];
    id v4 = +[BWCameraStreamingMonitor sharedCameraStreamingMonitor];
    uint64_t deviceType = self->_deviceType;
    int64_t epoch = self->_lastValidPTS.epoch;
    tccIdentity = self->_tccIdentity;
    mediaEnvironment = self->_mediaEnvironment;
    long long v9 = *(_OWORD *)&self->_clientAuditToken.val[4];
    v10[0] = *(_OWORD *)self->_clientAuditToken.val;
    v10[1] = v9;
    [v4 setStreaming:0 deviceType:deviceType streamUniqueID:epoch clientAuditToken:v10 tccIdentity:tccIdentity mediaEnvironment:mediaEnvironment completionHandler:0];
  }
  os_unfair_lock_unlock(p_streamStateLock);
  [(BWFigVideoCaptureStreamDelegate *)self->_delegate captureStreamWillStopStreaming:self];
}

- (void)sourceNodeDidStopStreaming:(BOOL)a3
{
  self->_started = 0;

  self->_timeMachine = 0;
  if (LOBYTE(self->_stillImageBufferTimeMachineHandler))
  {
    -[BWFigVideoCaptureStream _resetStillImageCaptureState]((uint64_t)self);
    [(BWFigCaptureStream *)self->_stream unregisterForNotification:*MEMORY[0x1E4F54430] listener:self];
    [(BWFigCaptureStream *)self->_stream unregisterForNotification:*MEMORY[0x1E4F54410] listener:self];
    [(BWFigCaptureStream *)self->_stream unregisterForNotification:*MEMORY[0x1E4F54440] listener:self];
    stillImageCaptureDelegate = self->_stillImageCaptureDelegate;
    if (stillImageCaptureDelegate)
    {
      dispatch_group_wait(stillImageCaptureDelegate, 0xFFFFFFFFFFFFFFFFLL);
      int v6 = self->_stillImageCaptureDelegate;
    }
    else
    {
      int v6 = 0;
    }

    self->_stillImageCaptureDelegate = 0;
    *(void *)&self->_stillImageCaptureEnabled = 0;
  }
  [(BWFigVideoCaptureStreamDelegate *)self->_delegate captureStreamDidStopStreaming:self];
  if (!a3)
  {
    [(BWFigVideoCaptureStream *)self resignStreamStartStopDelegate];
  }
}

- (void)_resetStillImageCaptureState
{
  if (a1)
  {
    [*(id *)(a1 + 472) resume];
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    *(unsigned char *)(a1 + 484) = 0;
    char v2 = *(void **)(a1 + 488);
    int v3 = *(void **)(a1 + 496);
    *(void *)(a1 + 488) = 0;
    *(void *)(a1 + 496) = 0;
    id v4 = *(void **)(a1 + 560);
    *(void *)(a1 + 560) = 0;
    uint64_t v5 = MEMORY[0x1E4F1F9F8];
    *(_OWORD *)(a1 + 568) = *MEMORY[0x1E4F1F9F8];
    *(void *)(a1 + 584) = *(void *)(v5 + 16);
    *(void *)(a1 + 592) = 0;
    *(_DWORD *)(a1 + 600) = 0;
    id v6 = *(id *)(a1 + 656);
    *(void *)(a1 + 656) = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (void)resignStreamStartStopDelegate
{
}

- (void)_serviceTimeMachineWithSampleBuffer:(uint64_t)a1
{
  if (!a1) {
    return;
  }
  id v4 = (os_unfair_lock_s *)(a1 + 480);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
  if (!*(unsigned char *)(a1 + 484)) {
    goto LABEL_6;
  }
  if (!+[BWStillImageTimeMachine afComplete:a2])
  {
    int v5 = *(_DWORD *)(a1 + 592);
    if (v5 < 30)
    {
      *(_DWORD *)(a1 + 592) = v5 + 1;
LABEL_6:
      os_unfair_lock_unlock(v4);
      id v6 = *(void **)(a1 + 472);
      [v6 insertFrame:a2];
      return;
    }
  }
  *(unsigned char *)(a1 + 484) = 0;
  os_unfair_lock_unlock(v4);
  [*(id *)(a1 + 472) drain];
  CFTypeRef cf = 0;
  BWCMSampleBufferCreateCopyIncludingMetadata(a2, (CMSampleBufferRef *)&cf);
  -[BWFigVideoCaptureStream _handleStillImageSampleBuffer:withError:fromTimeMachine:](a1, (void *)cf, 0, 1);
  if (cf) {
    CFRelease(cf);
  }
}

- (void)sourceNodeWillDiscardVideoSampleBuffer:(opaqueCMSampleBuffer *)a3
{
}

- (BOOL)sourceNodeShouldDiscardStillImageSampleBuffer:(opaqueCMSampleBuffer *)a3 sensorRawOutput:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  p_stillImageCaptureStateLock = &self->_stillImageCaptureStateLock;
  os_unfair_lock_lock(&self->_stillImageCaptureStateLock);
  int epoch_high = HIDWORD(self->_stillCaptureReferenceFramePTS.epoch);
  os_unfair_lock_unlock(p_stillImageCaptureStateLock);
  if (!epoch_high) {
    return 1;
  }
  -[BWFigVideoCaptureStream _addBracketecCaptureSequenceNumberToMetadataIfNeededForStillImageSampleBuffer:]((uint64_t)self, a3);
  if (![(NSString *)self->_portType isEqualToString:*MEMORY[0x1E4F52E00]])
  {
    id v9 = [(BWStillImageCaptureStreamSettings *)self->_activeResolvedStillImageCaptureStreamSettings captureFrameInfoForFrame:a3];
    if (v9)
    {
      int v10 = v9;
      CFStringRef v11 = (const __CFString *)*MEMORY[0x1E4F53070];
      int v12 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
      if (objc_msgSend((id)objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E4F541A8]), "BOOLValue"))uint64_t v13 = objc_msgSend(v10, "sifrFlags"); {
      else
      }
        uint64_t v13 = [v10 mainFlags];
      unint64_t v16 = 0x3000000000000000;
      if (v4) {
        unint64_t v16 = 0xC000000000000000;
      }
      if ((v13 & v16) != 0)
      {
        if ((v13 & 0xF000000000000000 & ((v13 & 0xF000000000000000) - 1)) != 0)
        {
          int v17 = (void *)[v12 mutableCopy];
          CMSetAttachment(a3, v11, v17, 1u);
        }
        return 0;
      }
      return 1;
    }
    if (v4)
    {
      uint64_t v14 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
      uint64_t v15 = *MEMORY[0x1E4F54328];
      if ([v14 objectForKeyedSubscript:*MEMORY[0x1E4F54328]]) {
        objc_msgSend((id)objc_msgSend(v14, "objectForKeyedSubscript:", v15), "intValue");
      }
      uint64_t v20 = *MEMORY[0x1E4F53D38];
      if ([v14 objectForKeyedSubscript:*MEMORY[0x1E4F53D38]]) {
        objc_msgSend((id)objc_msgSend(v14, "objectForKeyedSubscript:", v20), "intValue");
      }
      if (dword_1EB4C5010)
      {
        unsigned int v42 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      if (objc_msgSend(-[BWStillImageCaptureStreamSettings captureFrameInfos](self->_activeResolvedStillImageCaptureStreamSettings, "captureFrameInfos", v34, v35), "count"))
      {
        long long v39 = 0u;
        long long v40 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        id v22 = [(BWStillImageCaptureStreamSettings *)self->_activeResolvedStillImageCaptureStreamSettings captureFrameInfos];
        uint64_t v23 = [v22 countByEnumeratingWithState:&v37 objects:v43 count:16];
        if (v23)
        {
          uint64_t v24 = v23;
          double v36 = self;
          uint64_t v25 = *(void *)v38;
          do
          {
            for (uint64_t i = 0; i != v24; ++i)
            {
              if (*(void *)v38 != v25) {
                objc_enumerationMutation(v22);
              }
              if (dword_1EB4C5010)
              {
                uint64_t v27 = *(void *)(*((void *)&v37 + 1) + 8 * i);
                unsigned int v42 = 0;
                os_log_type_t type = OS_LOG_TYPE_DEFAULT;
                id v28 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                unsigned int v29 = v42;
                if (os_log_type_enabled(v28, type)) {
                  unsigned int v31 = v29;
                }
                else {
                  unsigned int v31 = v29 & 0xFFFFFFFE;
                }
                if (v31)
                {
                  uint64_t v32 = BWPortTypeToDisplayString(v36->_portType, v30);
                  int v44 = 136315650;
                  float v45 = "-[BWFigVideoCaptureStream sourceNodeShouldDiscardStillImageSampleBuffer:sensorRawOutput:]";
                  __int16 v46 = 2114;
                  uint64_t v47 = v32;
                  __int16 v48 = 2114;
                  uint64_t v49 = v27;
                  _os_log_send_and_compose_impl();
                }
                fig_log_call_emit_and_clean_up_after_send_and_compose();
              }
            }
            uint64_t v24 = [v22 countByEnumeratingWithState:&v37 objects:v43 count:16];
          }
          while (v24);
        }
      }
      else if (dword_1EB4C5010)
      {
        unsigned int v42 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        int v33 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);
        BOOL v18 = 1;
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        return v18;
      }
      return 1;
    }
  }
  return 0;
}

- (uint64_t)_addBracketecCaptureSequenceNumberToMetadataIfNeededForStillImageSampleBuffer:(uint64_t)result
{
  if (!result) {
    return result;
  }
  uint64_t v3 = result;
  int result = [*(id *)(result + 496) captureType];
  if (result != 2) {
    return result;
  }
  BOOL v4 = (void *)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  if (([*(id *)(v3 + 496) captureFlags] & 8) == 0)
  {
    int result = objc_msgSend((id)objc_msgSend(*(id *)(v3 + 496), "unifiedBracketedCaptureParams"), "count");
    if (!result) {
      return result;
    }
    uint64_t v5 = *MEMORY[0x1E4F53D38];
    goto LABEL_8;
  }
  int v6 = objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E4F53F10]), "BOOLValue");
  uint64_t v5 = *MEMORY[0x1E4F53D38];
  if (!v6)
  {
LABEL_8:
    CMTime v7 = &unk_1EFAFF000;
    goto LABEL_9;
  }
  CMTime v7 = &unk_1EFAFEFE8;
LABEL_9:
  return [v4 setObject:v7 forKeyedSubscript:v5];
}

- (int)sourceNodeWillEmitStillImageSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  return -[BWFigVideoCaptureStream _handleStillImageSampleBuffer:withError:fromTimeMachine:]((uint64_t)self, a3, 0, 0);
}

- (uint64_t)_handleStillImageSampleBuffer:(uint64_t)a3 withError:(uint64_t)a4 fromTimeMachine:
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  int v8 = objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", objc_msgSend(*(id *)(a1 + 488), "masterPortType"));
  if (a4) {
    [*(id *)(a1 + 632) captureStreamWillBeginStillImageCapture:a1];
  }
  id v9 = (void *)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
  int v10 = *(_DWORD *)(a1 + 596);
  if (!v10)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
    return 4294954516;
  }
  int v11 = *(_DWORD *)(a1 + 600);
  int v71 = v11 + 1;
  *(_DWORD *)(a1 + 600) = v11 + 1;
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  if (a2)
  {
    unint64_t v77 = 0;
    int v12 = (void *)[*(id *)(a1 + 496) captureFrameInfoForFrame:a2];
    if (v12)
    {
      uint64_t v13 = objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E4F541A8]), "BOOLValue")? objc_msgSend(v12, "sifrFlags"): objc_msgSend(v12, "mainFlags");
      unint64_t v15 = v13;
      unint64_t v77 = v13;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && [v12 isNoLongErrorRecoveryFrame]
        && [*(id *)(a1 + 496) isUnifiedBracketingErrorRecoveryFrame:a2 isReferenceFrame:(v15 >> 4) & 1])
      {
        unint64_t v77 = v15 & 0xFFFFFFFFFFFFFFEFLL;
      }
    }
    if (*(int *)(a1 + 648) >= 2)
    {
      uint64_t v16 = *MEMORY[0x1E4F54328];
      if ([v9 objectForKeyedSubscript:*MEMORY[0x1E4F54328]])
      {
        if (CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E4F53068], 0))
        {
          int v64 = v8;
          unsigned int v67 = a3;
          if (!*(void *)(a1 + 656)) {
            *(void *)(a1 + 656) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          }
          uint64_t v17 = objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", v16), "intValue");
          CFStringRef v18 = (const __CFString *)*MEMORY[0x1E4F53108];
          CFTypeRef v19 = CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E4F53108], 0);
          if (v19)
          {
            CFTypeRef v20 = v19;
            long long v21 = (void *)[v9 objectForKeyedSubscript:*MEMORY[0x1E4F541B0]];
            if (objc_msgSend((id)objc_msgSend(v21, "objectForKeyedSubscript:", *MEMORY[0x1E4F541B8]), "BOOLValue"))uint64_t v22 = (v17 - 1); {
            else
            }
              uint64_t v22 = (v17 + 1);
            objc_msgSend(*(id *)(a1 + 656), "setObject:forKeyedSubscript:", v20, objc_msgSend(NSNumber, "numberWithInt:", v22));
            goto LABEL_27;
          }
          uint64_t v23 = (const void *)objc_msgSend(*(id *)(a1 + 656), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", v17));
          if (v23)
          {
            CMSetAttachment(a2, v18, v23, 1u);
LABEL_27:
            a3 = v67;
            int v8 = v64;
            goto LABEL_28;
          }
          unsigned int v76 = 0;
          os_log_type_t type = OS_LOG_TYPE_DEFAULT;
          os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          a3 = v67;
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
      }
    }
LABEL_28:
    if ((objc_msgSend(*(id *)(a1 + 496), "referenceFrameIndex", v61, v62) & 0x80000000) != 0)
    {
      if ((int)[*(id *)(a1 + 488) timeMachineReferenceFrameBracketedCaptureSequenceNumber] < 1)
      {
        unsigned int v24 = 0;
        goto LABEL_38;
      }
      BOOL v25 = v11 == [*(id *)(a1 + 488) timeMachineReferenceFrameBracketedCaptureSequenceNumber]- 1;
    }
    else
    {
      if (v12)
      {
        unsigned int v24 = (v77 >> 4) & 1;
        goto LABEL_38;
      }
      BOOL v25 = v11 == [*(id *)(a1 + 496) referenceFrameIndex];
    }
    unsigned int v24 = v25;
LABEL_38:
    BWAddStillImageCaptureFrameMetadataToSampleBuffer(a2, *(void **)(a1 + 496), v24, (uint64_t *)&v77);
    int v26 = [*(id *)(a1 + 496) captureType];
    unint64_t v27 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 488), "captureStreamSettings"), "count");
    if (*(void *)(a1 + 632))
    {
      if (*(unsigned char *)(a1 + 556)) {
        BOOL v28 = 1;
      }
      else {
        BOOL v28 = v27 > 1;
      }
      int v29 = v28;
    }
    else
    {
      int v29 = 0;
    }
    memset(&v74, 0, sizeof(v74));
    CMSampleBufferGetPresentationTimeStamp(&v74, (CMSampleBufferRef)a2);
    if ((v29 & v8) != 1) {
      goto LABEL_73;
    }
    if (objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E4F54138]), "BOOLValue"))
    {
      float v30 = *(void **)(a1 + 632);
      CMTime time = v74;
      [v30 captureStream:a1 didCapturePreBracketedEV0ImageWithPTS:&time];
      if ((v24 & 1) == 0) {
        goto LABEL_68;
      }
      goto LABEL_67;
    }
    if (v26 == 3)
    {
      unsigned int v31 = (void *)[v9 objectForKeyedSubscript:*MEMORY[0x1E4F53450]];
      if (v31)
      {
        [v31 doubleValue];
        if (v32 == 0.0)
        {
          *(CMTime *)(a1 + 568) = v74;
          if ((v24 & 1) == 0) {
            goto LABEL_73;
          }
          goto LABEL_67;
        }
      }
    }
    else if ((v26 & 0xFFFFFFFE) == 4)
    {
      int v68 = objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E4F53D38]), "intValue");
      if (([*(id *)(a1 + 488) captureType] != 5
         || v68 != [*(id *)(a1 + 488) bracketedCaptureSequenceNumberForOISLongExposure])
        && ([*(id *)(a1 + 488) captureFlags] & 0x2000) == 0)
      {
        unsigned int v69 = a3;
        int v65 = (void *)[v9 mutableCopy];
        CFAllocatorRef v33 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
        CMTime time = v74;
        CFDictionaryRef v34 = CMTimeCopyAsDictionary(&time, v33);
        [v65 setObject:v34 forKeyedSubscript:*MEMORY[0x1E4F530C0]];

        id v35 = *(id *)(a1 + 560);
        if (!v35)
        {
          id v35 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          *(void *)(a1 + 560) = v35;
        }
        [v35 addObject:v65];

        a3 = v69;
        if ((v24 & 1) == 0)
        {
LABEL_73:
          int v40 = v71;
          if (v71 < v10
            || !*(void *)(a1 + 632)
            || ((char v41 = objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E4F53E88]), "BOOLValue"),
                 v26 == 11)
              ? (char v42 = 1)
              : (char v42 = v41),
                int v40 = v71,
                ((v42 | v8 ^ 1) & 1) != 0))
          {
LABEL_98:
            v53 = (_OWORD *)(a1 + 532);
            if ((*(unsigned char *)(a1 + 544) & 1) == 0
              || (CMTime time = v74,
                  *(_OWORD *)&time2.CMTimeValue value = *v53,
                  time2.CMTimeEpoch epoch = *(void *)(a1 + 548),
                  CMTimeCompare(&time, &time2) >= 1))
            {
              _OWORD *v53 = *(_OWORD *)&v74.value;
              *(void *)(a1 + 548) = v74.epoch;
            }
            if ([*(id *)(a1 + 496) adaptiveBracketingParameters])
            {
              uint64_t v54 = [*(id *)(a1 + 496) adaptiveBracketingGroupCaptureCount];
              if ((int)v54 < 1)
              {
                [*(id *)(a1 + 176) captureStream:a1 willEmitStillImageSampleBuffer:a2 fromTimeMachine:a4];
                if ((a4 & 1) == 0) {
                  goto LABEL_110;
                }
              }
              else
              {
                uint64_t v55 = [NSNumber numberWithInt:v54];
                [v9 setObject:v55 forKeyedSubscript:*MEMORY[0x1E4F531E0]];
                [*(id *)(a1 + 176) captureStream:a1 willEmitStillImageSampleBuffer:a2 fromTimeMachine:a4];
                if ((a4 & 1) == 0)
                {
                  CMTime v73 = v74;
                  [*(id *)(a1 + 496) setAdaptiveBracketingLastFramePTS:&v73];
LABEL_110:
                  fvcs_removeSampleBufferPixelBufferMetadata((opaqueCMSampleBuffer *)a2);
                  uint64_t v14 = figVideoCaptureStream_blackenFrameIfNecessary(a1, a2);
                  goto LABEL_111;
                }
              }
            }
            else
            {
              [*(id *)(a1 + 176) captureStream:a1 willEmitStillImageSampleBuffer:a2 fromTimeMachine:a4];
              if (!a4) {
                goto LABEL_110;
              }
            }
            uint64_t v56 = *(void *)(a1 + 608);
            if (v56) {
              (*(void (**)(uint64_t, void *))(v56 + 16))(v56, a2);
            }
            uint64_t v14 = 0;
            goto LABEL_111;
          }
          int v66 = v8;
          unsigned int v70 = a3;
          time2.CMTimeValue value = v74.value;
          CMTimeFlags flags = v74.flags;
          time2.CMTimeScale timescale = v74.timescale;
          CMTimeEpoch epoch = v74.epoch;
          if (!v29) {
            goto LABEL_93;
          }
          if (([*(id *)(a1 + 488) captureFlags] & 0x2000) != 0)
          {
            CMTimeFlags v47 = *(_DWORD *)(a1 + 580);
            if (v47)
            {
              time2.CMTimeValue value = *(void *)(a1 + 568);
              time2.CMTimeScale timescale = *(_DWORD *)(a1 + 576);
              CMTimeEpoch epoch = *(void *)(a1 + 584);
              CMTimeFlags flags = v47;
            }
            uint64_t v48 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(*(id *)(a1 + 488), "timeMachineReferenceFrameBracketedCaptureSequenceNumber"));
          }
          else
          {
            if (v26 == 3)
            {
              CMTimeFlags v45 = *(_DWORD *)(a1 + 580);
              if (v45)
              {
                uint64_t v46 = 0;
                time2.CMTimeValue value = *(void *)(a1 + 568);
                time2.CMTimeScale timescale = *(_DWORD *)(a1 + 576);
                CMTimeEpoch epoch = *(void *)(a1 + 584);
                CMTimeFlags flags = v45;
LABEL_97:
                *(CMTime *)(a1 + 508) = v74;
                *(_DWORD *)(a1 + 504) = v26;
                uint64_t v52 = *(void **)(a1 + 632);
                time.CMTimeValue value = time2.value;
                time.CMTimeScale timescale = time2.timescale;
                time.CMTimeFlags flags = flags;
                time.CMTimeEpoch epoch = epoch;
                [v52 captureStream:a1 didCaptureReferenceFrameWithPTS:&time referenceFrameBracketedCaptureSequenceNumber:v46];
                a3 = v70;
                int v8 = v66;
                goto LABEL_98;
              }
LABEL_93:
              uint64_t v46 = 0;
              goto LABEL_97;
            }
            if ((v26 & 0xFFFFFFFE) != 4) {
              goto LABEL_93;
            }
            unsigned int v76 = -1;
            if (FigCaptureReferenceFrameSelection(*(const __CFArray **)(a1 + 560), (int *)&v76)
              || (unint64_t v49 = v76, (v76 & 0x80000000) != 0)
              || [*(id *)(a1 + 560) count] <= v49)
            {
              int v50 = [*(id *)(a1 + 560) count] - 1;
              unsigned int v76 = v50;
            }
            else
            {
              int v50 = v76;
            }
            int v51 = (void *)[*(id *)(a1 + 560) objectAtIndexedSubscript:v50];
            CMTimeMakeFromDictionary(&time, (CFDictionaryRef)[v51 objectForKeyedSubscript:*MEMORY[0x1E4F530C0]]);
            time2.CMTimeValue value = time.value;
            CMTimeFlags flags = time.flags;
            time2.CMTimeScale timescale = time.timescale;
            CMTimeEpoch epoch = time.epoch;
            uint64_t v48 = [v51 objectForKeyedSubscript:*MEMORY[0x1E4F53D38]];
          }
          uint64_t v46 = v48;
          int v40 = v71;
          goto LABEL_97;
        }
        goto LABEL_67;
      }
    }
    else if (v26 == 2)
    {
      if ((objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E4F53F10]), "BOOLValue") & 1) == 0) {
        goto LABEL_73;
      }
      goto LABEL_67;
    }
    if (!v24)
    {
LABEL_68:
      if (v26 == 10
        && [*(id *)(a1 + 488) deliverOriginalImage]
        && ([*(id *)(a1 + 496) captureFlags] & 0x40000) != 0
        && (v77 & 0x20) != 0)
      {
        long long v39 = *(void **)(a1 + 632);
        CMTime time = v74;
        [v39 captureStream:a1 didCapturePreBracketedEV0ImageWithPTS:&time];
      }
      goto LABEL_73;
    }
LABEL_67:
    CMTimeEpoch v36 = v74.epoch;
    *(void *)(a1 + 584) = v74.epoch;
    long long v37 = *(_OWORD *)&v74.value;
    *(_OWORD *)(a1 + 568) = *(_OWORD *)&v74.value;
    long long v38 = *(void **)(a1 + 632);
    *(_OWORD *)&time.CMTimeValue value = v37;
    time.CMTimeEpoch epoch = v36;
    [v38 captureStream:a1 didCaptureReferenceFrameWithPTS:&time referenceFrameBracketedCaptureSequenceNumber:0];
    goto LABEL_68;
  }
  uint64_t v14 = 4294954516;
  int v40 = v11 + 1;
LABEL_111:
  if (v40 >= v10)
  {
    id v57 = *(id *)(a1 + 496);
    -[BWFigVideoCaptureStream _resetStillImageCaptureState](a1);
    uint64_t v58 = *(void **)(a1 + 176);
    CMTime time = *(CMTime *)(a1 + 532);
    [v58 captureStream:a1 didCompleteStillImageCaptureWithPTS:&time error:a3];
    if (a2 && [v57 reachedEndOfAdaptiveBracketing])
    {
      if (v8)
      {
        uint64_t v59 = *(void **)(a1 + 632);
        if (v57) {
          [v57 adaptiveBracketingLastFramePTS];
        }
        else {
          memset(v72, 0, sizeof(v72));
        }
        [v59 captureStream:a1 didCaptureReferenceFrameWithPTS:v72 referenceFrameBracketedCaptureSequenceNumber:0];
      }
      CMSetAttachment(a2, (CFStringRef)*MEMORY[0x1E4F55B58], MEMORY[0x1E4F1CC38], 1u);
    }
    if (![v57 adaptiveBracketingParameters]
      || [v57 reachedEndOfAdaptiveBracketing])
    {
      [*(id *)(a1 + 632) captureStreamDidCompleteStillImageCapture:a1];
    }
  }
  return v14;
}

- (void)sourceNodeWillEmitStillImageQuadraBufferProcessingError:(int)a3
{
}

- (int)sourceNodeWillEmitDepthSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  [(BWFigVideoCaptureStreamDelegate *)self->_delegate captureStream:self willEmitDepthSampleBuffer:a3];
  return figVideoCaptureStream_blackenFrameIfNecessary((uint64_t)self, a3);
}

- (void)sourceNodeDidDropFrameWithPTS:(id *)a3
{
  delegate = self->_delegate;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = *a3;
  [(BWFigVideoCaptureStreamDelegate *)delegate captureStream:self didDropVideoSampleBufferWithPTS:&v5];
}

- (BOOL)stillImageCaptureEnabled
{
  return (BOOL)self->_stillImageBufferTimeMachineHandler;
}

- (int)timeMachineCapacity
{
  return self->_timeMachineCapacity;
}

- (BOOL)timeMachineEnabled
{
  return self->_timeMachineEnabled;
}

- (void)setStillImageBufferTimeMachineHandler:(id)a3
{
  id v3 = *(id *)&self->_receivedImagesOrErrorsForCaptureStillImageNow;
  if (v3 != a3)
  {

    *(void *)&self->_receivedImagesOrErrorsForCaptureStillImageNow = [a3 copy];
  }
}

- (id)stillImageBufferTimeMachineHandler
{
  return *(id *)&self->_receivedImagesOrErrorsForCaptureStillImageNow;
}

- (void)captureStillImageFromTimeMachineWithStillImageSettings:(id)a3
{
  if (self->_timeMachine)
  {
    -[BWFigVideoCaptureStream _prepareForStillImageCaptureWithStillImageSettings:fromCMTimeMachine:]((uint64_t)self, a3, 1);
    BOOL v4 = [(BWStillImageTimeMachine *)self->_timeMachine copyBestFrame];
    if (v4)
    {
      $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = v4;
      [(BWStillImageTimeMachine *)self->_timeMachine drain];
      -[BWFigVideoCaptureStream _handleStillImageSampleBuffer:withError:fromTimeMachine:]((uint64_t)self, v5, 0, 1);
      CFRelease(v5);
    }
    else
    {
      os_unfair_lock_lock(&self->_stillImageCaptureStateLock);
      self->_grabNextFrame = 1;
      os_unfair_lock_unlock(&self->_stillImageCaptureStateLock);
    }
  }
  else
  {
    FigDebugAssert3();
  }
}

- (void)_prepareForStillImageCaptureWithStillImageSettings:(char)a3 fromCMTimeMachine:
{
  if (a1)
  {
    *(void *)(a1 + 488) = a2;
    *(void *)(a1 + 496) = (id)[a2 captureStreamSettingsForPortType:*(void *)(a1 + 32)];
    if ((a3 & 1) == 0) {
      [*(id *)(a1 + 472) suspendAndDrain];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    *(_DWORD *)(a1 + 596) = [*(id *)(a1 + 496) expectedFrameCaptureCount];
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (void)prepareForStillImageCaptureFromFirmwareWithStillImageSettings:(id)a3
{
}

- (void)willCaptureStillImageFromFirmware
{
  int v3 = [(BWStillImageCaptureStreamSettings *)self->_activeResolvedStillImageCaptureStreamSettings captureType];
  int v4 = [(BWStillImageCaptureStreamSettings *)self->_activeResolvedStillImageCaptureStreamSettings adaptiveBracketingGroupCaptureCount];
  if (v3 != 2 && v4 <= 1)
  {
    streamNotificationDispatchQueue = self->_streamNotificationDispatchQueue;
    [(OS_dispatch_queue *)streamNotificationDispatchQueue captureStreamWillBeginStillImageCapture:self];
  }
}

- (void)failedToCaptureStillImageFromFirmwareWithError:(int)a3
{
  [(OS_dispatch_queue *)self->_streamNotificationDispatchQueue captureStream:self stillImageCaptureError:*(void *)&a3];
  -[BWFigVideoCaptureStream _resetStillImageCaptureState]((uint64_t)self);
}

- (int)activeStillImageCaptureType
{
  return [(BWStillImageCaptureStreamSettings *)self->_activeResolvedStillImageCaptureStreamSettings captureType];
}

- (float)activeStillImageScaleFactor
{
  [(BWStillImageCaptureSettings *)self->_activeResolvedStillImageCaptureSettings scaleFactor];
  return result;
}

- (BOOL)providesPreBracketedEV0
{
  return [(BWStillImageCaptureStreamSettings *)self->_activeResolvedStillImageCaptureStreamSettings expectPreBracketFrame];
}

- (BOOL)clientProcessHasAccessToCamera
{
  char v2 = self;
  p_cameraAccessLock = &self->_cameraAccessLock;
  os_unfair_lock_lock(&self->_cameraAccessLock);
  LOBYTE(v2) = v2->_clientProcessHasAccessToCamera;
  os_unfair_lock_unlock(p_cameraAccessLock);
  return (char)v2;
}

- (BOOL)blackenFramesForContinuityDisplayConnected
{
  char v2 = self;
  p_cameraAccessLock = &self->_cameraAccessLock;
  os_unfair_lock_lock(&self->_cameraAccessLock);
  LOBYTE(v2) = v2->_blackenFramesForContinuityDisplayConnected;
  os_unfair_lock_unlock(p_cameraAccessLock);
  return (char)v2;
}

- (id)noiseReductionAndSharpeningConfigurationForType:(int)a3 gain:(float)a4 qSub:(BOOL)a5
{
  return (id)-[BWObjectDetector noiseReductionAndSharpeningConfigurationForType:gain:qSub:](self->_objectDetector, "noiseReductionAndSharpeningConfigurationForType:gain:qSub:", *(void *)&a3, a5);
}

- (id)noiseReductionAndSharpeningConfigurationForType:(int)a3 gain:(float)a4
{
  return -[BWFigVideoCaptureStream noiseReductionAndSharpeningConfigurationForType:gain:qSub:](self, "noiseReductionAndSharpeningConfigurationForType:gain:qSub:", *(void *)&a3, 0);
}

- (uint64_t)_configureKeypointDetection
{
  if (result)
  {
    uint64_t v1 = result;
    if (!*(unsigned char *)(result + 792))
    {
      char v2 = *(void **)(result + 8);
      if (*(void *)(v1 + 784)) {
        uint64_t v3 = *(void *)(v1 + 784);
      }
      else {
        uint64_t v3 = MEMORY[0x1E4F1CC08];
      }
      float result = [v2 setProperty:*MEMORY[0x1E4F549D0] value:v3];
      if (!result) {
        *(unsigned char *)(v1 + 792) = 1;
      }
    }
  }
  return result;
}

- (BOOL)keypointDetectionEnabled
{
  return BYTE1(self->_keypointDetectionConfiguration);
}

- (BOOL)stillImageKeypointDetectionEnabled
{
  return BYTE2(self->_keypointDetectionConfiguration);
}

- (int)mainToSIFRFrameRateRatio
{
  return (int)self->_stillImageCaptureDelegateDispatchGroup;
}

- (BOOL)highlightRecoverySuspended
{
  return BYTE3(self->_keypointDetectionConfiguration);
}

- (BOOL)highlightRecoveryEnabled
{
  return BYTE4(self->_keypointDetectionConfiguration);
}

- (BOOL)highlightRecoveryEnabledWhenConfiguredAsMasterOrSingleStream
{
  return BYTE5(self->_keypointDetectionConfiguration);
}

- (BOOL)highlightRecoveryEnabledWhenConfiguredAsSlave
{
  return BYTE6(self->_keypointDetectionConfiguration);
}

- (BOOL)unifiedBracketingEnabled
{
  return self->_multiBandNoiseReductionMode;
}

- (BOOL)aeStatisticsEnabled
{
  return BYTE1(self->_multiBandNoiseReductionMode);
}

- (BOOL)rawFocusScoresEnabled
{
  return BYTE2(self->_multiBandNoiseReductionMode);
}

- (BOOL)focusBlurMapEnabled
{
  return HIBYTE(self->_multiBandNoiseReductionMode);
}

- (BOOL)zeroShutterLagEnabled
{
  return BYTE1(self->_band0StrengthModulation);
}

- (BOOL)overCaptureEnabled
{
  return [(BWSphereModeSelector *)self->_sphereModeSelector overCaptureEnabled];
}

- (BOOL)visualIntelligenceCameraEnabled
{
  return [(BWSphereModeSelector *)self->_sphereModeSelector visualIntelligenceCameraEnabled];
}

- (BOOL)variableFrameRateVideoEnabled
{
  return *(&self->_maxExposureDurationHasBeenSet + 3);
}

- (void)setVisionDataSuspended:(BOOL)a3
{
  stream = self->_stream;
  uint64_t v4 = *MEMORY[0x1E4F54CF8];
  uint64_t v5 = [NSNumber numberWithBool:a3];
  [(BWFigCaptureStream *)stream setProperty:v4 value:v5];
}

- (void)setRuntimeUpdates:(id)a3
{
}

- (void)triggerVisionDataBurst
{
}

- (void)setVisionDataKeypointDetectionThreshold:(float)a3
{
  stream = self->_stream;
  uint64_t v4 = *MEMORY[0x1E4F54CE8];
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithFloat:");
  [(BWFigCaptureStream *)stream setProperty:v4 value:v5];
}

- (BOOL)videoHDRImageStatisticsEnabled
{
  return self->_keypointDetectionConfigured;
}

- ($2825F4736939C4A6D3AD43837233062D)physicalSensorDimensions
{
  if (self->_sensorDimensions.height < 1 || self->_videoCaptureDimensions.width <= 0) {
    p_float aeMaxGain = ($2825F4736939C4A6D3AD43837233062D *)&self->_aeMaxGain;
  }
  else {
    p_float aeMaxGain = ($2825F4736939C4A6D3AD43837233062D *)&self->_sensorDimensions.height;
  }
  return *p_aeMaxGain;
}

- (BOOL)cinematicFramingEnabled
{
  return self->_videoCaptureDimensions.height;
}

- (void)setCenterStageRectOfInterest:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  self->_physicalSensorDimensions = *($470D365275581EF16070F5A11344F73E *)&a3.origin.x;
  *(CGFloat *)&self->_cinematicFramingEnabled = a3.origin.y;
  self->_centerStageRectOfInterest.origin.CGFloat x = a3.size.width;
  self->_centerStageRectOfInterest.origin.CGFloat y = a3.size.height;
  if ([(NSDictionary *)self->_supportedProperties objectForKeyedSubscript:@"CMIOCinematicFramingEnabled"])
  {
    v10.origin.CGFloat x = x;
    v10.origin.CGFloat y = y;
    v10.size.CGFloat width = width;
    v10.size.CGFloat height = height;
    CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v10);
    [(BWFigCaptureStream *)self->_stream setPropertyIfSupported:@"CMIOCenterStageRectOfInterest" value:DictionaryRepresentation];
    if (DictionaryRepresentation)
    {
      CFRelease(DictionaryRepresentation);
    }
  }
}

- (CGRect)centerStageRectOfInterest
{
  double v2 = *(double *)&self->_physicalSensorDimensions;
  double v3 = *(double *)&self->_cinematicFramingEnabled;
  double x = self->_centerStageRectOfInterest.origin.x;
  double y = self->_centerStageRectOfInterest.origin.y;
  result.size.CGFloat height = y;
  result.size.CGFloat width = x;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (void)setCenterStageFramingMode:(int)a3
{
  LODWORD(self->_centerStageRectOfInterest.size.width) = a3;
}

- (int)centerStageFramingMode
{
  return LODWORD(self->_centerStageRectOfInterest.size.width);
}

- (BOOL)backgroundBlurEnabled
{
  return BYTE4(self->_centerStageRectOfInterest.size.width);
}

- (BOOL)studioLightingEnabled
{
  return BYTE5(self->_centerStageRectOfInterest.size.width);
}

- (BOOL)reactionEffectsEnabled
{
  return BYTE6(self->_centerStageRectOfInterest.size.width);
}

- (void)setGesturesEnabled:(BOOL)a3
{
  HIBYTE(self->_centerStageRectOfInterest.size.width) = a3;
}

- (BOOL)gesturesEnabled
{
  return HIBYTE(self->_centerStageRectOfInterest.size.width);
}

- (BOOL)backgroundReplacementEnabled
{
  return LOBYTE(self->_centerStageRectOfInterest.size.height);
}

- (void)setDeskCamActive:(BOOL)a3
{
  if (LOBYTE(self->_videoCaptureDimensions.height) && self->_started && !self->_suspended)
  {
    -[BWFigVideoCaptureStream _logStreamingPowerEvent:]((uint64_t)self, 0);
    LOBYTE(self->_numberOfBuffersEmitted) = a3;
    -[BWFigVideoCaptureStream _logStreamingPowerEvent:]((uint64_t)self, 1);
  }
  else
  {
    LOBYTE(self->_numberOfBuffersEmitted) = a3;
  }
}

- (void)setCmioZoomFactor:(float)a3
{
  if (-[BWFigCaptureStream setPropertyIfSupported:value:](self->_stream, "setPropertyIfSupported:value:", @"CMIOVideoZoomFactor", objc_msgSend(NSNumber, "numberWithFloat:")))
  {
    FigDebugAssert3();
  }
}

- (float)cmioZoomFactor
{
  int v3 = 0;
  objc_msgSend(-[BWFigCaptureStream getPropertyIfSupported:error:](self->_stream, "getPropertyIfSupported:error:", @"CMIOVideoZoomFactor", &v3), "floatValue");
  return result;
}

- (void)performReactionEffect:(id)a3
{
}

- (unsigned)reactionCount
{
  return 0;
}

- (BWFigVideoCaptureStreamDelegate)delegate
{
  return self->_delegate;
}

- (float)pixelsPerMicron
{
  return self->_pixelsPerMicron;
}

- (float)gravityFactor
{
  return self->_gravityFactor;
}

- (float)minimumSupportedFrameRate
{
  return self->_minimumSupportedFrameRate;
}

- (float)aeMaxGain
{
  return *(float *)&self->_maxExposureDurationFrameworkOverride.epoch;
}

- (float)momentCaptureVideoRecordingAEMaxGain
{
  return *((float *)&self->_maxExposureDurationFrameworkOverride.epoch + 1);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)maxExposureDurationClientOverride
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)((char *)self + 852);
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)maxExposureDurationFrameworkOverride
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)((char *)self + 876);
  return self;
}

- (BWFigVideoCaptureStreamStillImageCaptureDelegate)stillImageCaptureDelegate
{
  return self->_streamNotificationDispatchQueue;
}

- (BOOL)usesStillFusionReferenceFramePTSForDidCaptureCallback
{
  return BYTE4(self->_largestStillImagePTS.epoch);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastStillImagePTS
{
  *(_OWORD *)&retstr->var0 = *(_OWORD *)((char *)&self[21].var0 + 4);
  retstr->var3 = *(int64_t *)((char *)&self[21].var3 + 4);
  return self;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)clientAuditToken
{
  long long v3 = *(_OWORD *)&self[12].var0[2];
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self[11].var0[6];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (BOOL)visionDataRequiredWhenConfiguredAsSlave
{
  return BYTE5(self->_synchronizedStreamsGroup);
}

- (void)setVisionDataRequiredWhenConfiguredAsSlave:(BOOL)a3
{
  BYTE5(self->_synchronizedStreamsGroup) = a3;
}

- (BOOL)digitalFlashEnabled
{
  return self->_band0StrengthModulation;
}

- (BWFaceDetector)faceDetector
{
  return *(BWFaceDetector **)&self->_videoHDRImageStatisticsEnabled;
}

- (BWObjectDetector)objectDetector
{
  return self->_faceDetector;
}

- (BOOL)timeLapseEnabled
{
  return self->_maxExposureDurationHasBeenSet;
}

- (void)setTimeLapseEnabled:(BOOL)a3
{
  self->_maxExposureDurationHasBeenSet = a3;
}

- (BOOL)lowLightVideoEnabled
{
  return *(&self->_maxExposureDurationHasBeenSet + 1);
}

- (BOOL)cinematicVideoEnabled
{
  return *(&self->_maxExposureDurationHasBeenSet + 2);
}

- (int)autoFocusPositionSensorMode
{
  return *(_DWORD *)&self->_unifiedBracketingEnabled;
}

- (BOOL)pixelFormatIsTenBit
{
  return self->_keypointDetectionEnabled;
}

- (BOOL)colorSpaceIsAppleLog
{
  return self->_stillImageKeypointDetectionEnabled;
}

- ($2825F4736939C4A6D3AD43837233062D)videoCaptureDimensions
{
  return *($2825F4736939C4A6D3AD43837233062D *)&self->_timeLapseEnabled;
}

- (void)setSensorDimensions:(id)a3
{
  *($2825F4736939C4A6D3AD43837233062D *)&self->_float aeMaxGain = a3;
}

- (int)videoStabilizationStrength
{
  return HIDWORD(self->_centerStageRectOfInterest.size.height);
}

- (CGPoint)previewShiftAtBaseZoom
{
  objc_copyStruct(v4, &self->_previewShift, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (int)fastSwitchingMainFormatIndex
{
  return self->_fastSwitchingMainFormatIndex;
}

- (int)multiBandNoiseReductionMode
{
  return (int)self->_stillImageNoiseAndSharpeningParameters;
}

- (void)setPhysicalSensorDimensions:(id)a3
{
  *($2825F4736939C4A6D3AD43837233062D *)&self->_sensorDimensions.CGFloat height = a3;
}

@end