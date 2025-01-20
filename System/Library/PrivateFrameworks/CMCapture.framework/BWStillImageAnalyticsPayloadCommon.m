@interface BWStillImageAnalyticsPayloadCommon
- (BOOL)afDriverShortOccurred;
- (BOOL)awbStable;
- (BOOL)binned;
- (BOOL)burst;
- (BOOL)deferred;
- (BOOL)depthDataDeliveryEnabled;
- (BOOL)depthEnabled;
- (BOOL)fastCapturePrioritizationEnabled;
- (BOOL)geometricDistortionCorrectionEnabled;
- (BOOL)highQualityPhotoWithVideoFormatSupported;
- (BOOL)livePhotoEnabled;
- (BOOL)photoFormat;
- (BOOL)portraitRequested;
- (BOOL)semanticStyleRenderingSupported;
- (BOOL)smartStyleRenderingSupported;
- (BOOL)stfStillApplied;
- (BOOL)stfStillSupported;
- (BOOL)swfrApplied;
- (BOOL)timeLapse;
- (BWStillImageAnalyticsPayloadCommon)init;
- (NSDictionary)apsSubjectDistance;
- (NSDictionary)focusingMethod;
- (NSDictionary)leaderFollowerAutoFocusData;
- (NSDictionary)practicalFocalLength;
- (NSDictionary)timeOfFlightAssistedAutoFocusEstimatorData;
- (NSDictionary)timeOfFlightFlickerDetectionData;
- (NSString)clientApplicationID;
- (NSString)constituentImageDeliveryDeviceTypes;
- (NSString)geometricDistortionCorrectionSource;
- (NSString)portType;
- (NSString)portraitEffectStatus;
- (NSString)resolutionFlavor;
- (NSString)sphereMode;
- (float)SNR;
- (float)accelStandardDeviation;
- (float)afPowerConsumption;
- (float)alsRearLuxLevel;
- (float)effectiveIntegrationTime;
- (float)exposureDuration;
- (float)flashBrightnessRatio;
- (float)greenGhostMitigationLowLightMaskAverage;
- (float)gyroStandardDeviation;
- (float)iso;
- (float)lensPosition;
- (float)lensTemperature;
- (float)maxAFTrackingError;
- (float)maxSphereTrackingError;
- (float)minDistanceFromSphereEndStop;
- (float)normalizedSNR;
- (float)semanticStyleToneBias;
- (float)semanticStyleWarmthBias;
- (float)smartStyleColorBias;
- (float)smartStyleIntensity;
- (float)smartStyleToneBias;
- (float)spherePowerConsumption;
- (float)stdAFTrackingError;
- (float)stdSphereTrackingError;
- (float)swfrBackgroundCorrectionDirection;
- (float)swfrForegroundCorrectionDirection;
- (id)eventDictionary;
- (id)eventName;
- (int)activeDeviceMask;
- (int)alsLuxLevel;
- (int)calibrationValidationStatusCmCl;
- (int)calibrationValidationStatusCmPM;
- (int)calibrationValidationStatusFCCl;
- (int)captureType;
- (int)clientRequestedQualityPrioritization;
- (int)coreRepairStatusFrontCameraAssembly;
- (int)coreRepairStatusRearCameraAssembly;
- (int)deliveredDimensionHeight;
- (int)deliveredDimensionWidth;
- (int)devicePosition;
- (int)formatDimensionHeight;
- (int)formatDimensionWidth;
- (int)formatMaxFrameRate;
- (int)greenGhostMitigationBrightLightIsBrightScene;
- (int)greenGhostMitigationBrightLightROIIsComputed;
- (int)greenGhostMitigationLowLightExceedsMaxMaskAverage;
- (int)greenGhostMitigationLowLightSkipRepair;
- (int)greenGhostMitigationLowLightTripodMode;
- (int)imageExifOrientation;
- (int)luxLevel;
- (int)numberOfFaces;
- (int)processingDuration;
- (int)qualityPrioritization;
- (int)redEyeReductionStatus;
- (int)semanticSceneType;
- (int)sensorTemperature;
- (int)smartStyleCastType;
- (int)stfStillCorrectionStrength;
- (int)swfrBackgroundCorrectionStrength;
- (int)swfrForegroundCorrectionStrength;
- (unint64_t)captureFlags;
- (unint64_t)sceneFlags;
- (unsigned)apsMode;
- (unsigned)cameraPosture;
- (unsigned)depthAFStatus;
- (unsigned)outputFileType;
- (unsigned)pixelFormat;
- (unsigned)stfStillAnalyticsVersion;
- (unsigned)streamingTime;
- (unsigned)swfrAnalyticsVersion;
- (unsigned)timeSinceLastCaptureInSession;
- (void)dealloc;
- (void)reset;
- (void)setAccelStandardDeviation:(float)a3;
- (void)setActiveDeviceMask:(int)a3;
- (void)setAfDriverShortOccurred:(BOOL)a3;
- (void)setAfPowerConsumption:(float)a3;
- (void)setAlsLuxLevel:(int)a3;
- (void)setAlsRearLuxLevel:(float)a3;
- (void)setApsMode:(unsigned int)a3;
- (void)setApsSubjectDistance:(id)a3;
- (void)setAwbStable:(BOOL)a3;
- (void)setBinned:(BOOL)a3;
- (void)setBurst:(BOOL)a3;
- (void)setCalibrationValidationStatusCmCl:(int)a3;
- (void)setCalibrationValidationStatusCmPM:(int)a3;
- (void)setCalibrationValidationStatusFCCl:(int)a3;
- (void)setCameraPosture:(unsigned int)a3;
- (void)setCaptureFlags:(unint64_t)a3;
- (void)setCaptureType:(int)a3;
- (void)setClientApplicationID:(id)a3;
- (void)setClientRequestedQualityPrioritization:(int)a3;
- (void)setConstituentImageDeliveryDeviceTypes:(id)a3;
- (void)setCoreRepairStatusFrontCameraAssembly:(int)a3;
- (void)setCoreRepairStatusRearCameraAssembly:(int)a3;
- (void)setDeferred:(BOOL)a3;
- (void)setDeliveredDimensionHeight:(int)a3;
- (void)setDeliveredDimensionWidth:(int)a3;
- (void)setDepthAFStatus:(unsigned int)a3;
- (void)setDepthDataDeliveryEnabled:(BOOL)a3;
- (void)setDepthEnabled:(BOOL)a3;
- (void)setDevicePosition:(int)a3;
- (void)setEffectiveIntegrationTime:(float)a3;
- (void)setExposureDuration:(float)a3;
- (void)setFastCapturePrioritizationEnabled:(BOOL)a3;
- (void)setFlashBrightnessRatio:(float)a3;
- (void)setFocusingMethod:(id)a3;
- (void)setFormatDimensionHeight:(int)a3;
- (void)setFormatDimensionWidth:(int)a3;
- (void)setFormatMaxFrameRate:(int)a3;
- (void)setGeometricDistortionCorrectionEnabled:(BOOL)a3;
- (void)setGeometricDistortionCorrectionSource:(id)a3;
- (void)setGreenGhostMitigationBrightLightIsBrightScene:(int)a3;
- (void)setGreenGhostMitigationBrightLightROIIsComputed:(int)a3;
- (void)setGreenGhostMitigationLowLightExceedsMaxMaskAverage:(int)a3;
- (void)setGreenGhostMitigationLowLightMaskAverage:(float)a3;
- (void)setGreenGhostMitigationLowLightSkipRepair:(int)a3;
- (void)setGreenGhostMitigationLowLightTripodMode:(int)a3;
- (void)setGyroStandardDeviation:(float)a3;
- (void)setHighQualityPhotoWithVideoFormatSupported:(BOOL)a3;
- (void)setImageExifOrientation:(int)a3;
- (void)setIso:(float)a3;
- (void)setLeaderFollowerAutoFocusData:(id)a3;
- (void)setLensPosition:(float)a3;
- (void)setLensTemperature:(float)a3;
- (void)setLivePhotoEnabled:(BOOL)a3;
- (void)setLuxLevel:(int)a3;
- (void)setMaxAFTrackingError:(float)a3;
- (void)setMaxSphereTrackingError:(float)a3;
- (void)setMinDistanceFromSphereEndStop:(float)a3;
- (void)setNormalizedSNR:(float)a3;
- (void)setNumberOfFaces:(int)a3;
- (void)setOutputFileType:(unsigned int)a3;
- (void)setPhotoFormat:(BOOL)a3;
- (void)setPixelFormat:(unsigned int)a3;
- (void)setPortType:(id)a3;
- (void)setPortraitEffectStatus:(id)a3;
- (void)setPortraitRequested:(BOOL)a3;
- (void)setPracticalFocalLength:(id)a3;
- (void)setProcessingDuration:(int)a3;
- (void)setQualityPrioritization:(int)a3;
- (void)setRedEyeReductionStatus:(int)a3;
- (void)setResolutionFlavor:(id)a3;
- (void)setSNR:(float)a3;
- (void)setSceneFlags:(unint64_t)a3;
- (void)setSemanticSceneType:(int)a3;
- (void)setSemanticStyleRenderingSupported:(BOOL)a3;
- (void)setSemanticStyleToneBias:(float)a3;
- (void)setSemanticStyleWarmthBias:(float)a3;
- (void)setSensorTemperature:(int)a3;
- (void)setSmartStyleCastType:(int)a3;
- (void)setSmartStyleColorBias:(float)a3;
- (void)setSmartStyleIntensity:(float)a3;
- (void)setSmartStyleRenderingSupported:(BOOL)a3;
- (void)setSmartStyleToneBias:(float)a3;
- (void)setSphereMode:(id)a3;
- (void)setSpherePowerConsumption:(float)a3;
- (void)setStdAFTrackingError:(float)a3;
- (void)setStdSphereTrackingError:(float)a3;
- (void)setStfStillAnalyticsVersion:(unsigned int)a3;
- (void)setStfStillApplied:(BOOL)a3;
- (void)setStfStillCorrectionStrength:(int)a3;
- (void)setStfStillSupported:(BOOL)a3;
- (void)setStreamingTime:(unsigned int)a3;
- (void)setSwfrAnalyticsVersion:(unsigned int)a3;
- (void)setSwfrApplied:(BOOL)a3;
- (void)setSwfrBackgroundCorrectionDirection:(float)a3;
- (void)setSwfrBackgroundCorrectionStrength:(int)a3;
- (void)setSwfrForegroundCorrectionDirection:(float)a3;
- (void)setSwfrForegroundCorrectionStrength:(int)a3;
- (void)setTimeLapse:(BOOL)a3;
- (void)setTimeOfFlightAssistedAutoFocusEstimatorData:(id)a3;
- (void)setTimeOfFlightFlickerDetectionData:(id)a3;
- (void)setTimeSinceLastCaptureInSession:(unsigned int)a3;
@end

@implementation BWStillImageAnalyticsPayloadCommon

- (BWStillImageAnalyticsPayloadCommon)init
{
  v5.receiver = self;
  v5.super_class = (Class)BWStillImageAnalyticsPayloadCommon;
  v2 = [(BWStillImageAnalyticsPayloadCommon *)&v5 init];
  v3 = v2;
  if (v2) {
    [(BWStillImageAnalyticsPayloadCommon *)v2 reset];
  }
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWStillImageAnalyticsPayloadCommon;
  [(BWStillImageAnalyticsPayloadCommon *)&v3 dealloc];
}

- (void)reset
{
  self->_deferred = 0;
  *(void *)&self->_activeDeviceMask = 0;
  self->_captureType = 0;
  self->_captureFlags = 0;
  self->_sceneFlags = 0;
  *(_OWORD *)&self->_processingDuration = xmmword_1A5F0C910;
  int32x4_t v4 = vdupq_n_s32(0x7F7FFFFFu);
  *(void *)&self->_alsRearLuxLevel = v4.i64[0];
  self->_sensorTemperature = 0x7FFFFFFF;
  *(int32x4_t *)&self->_lensTemperature = v4;
  *(void *)&self->_SNR = 2139095039;
  *(_DWORD *)&self->_livePhotoEnabled = 0;

  self->_clientApplicationID = 0;
  self->_portType = 0;
  *(void *)&self->_accelStandardDeviation = v4.i64[0];

  self->_apsSubjectDistance = 0;
  self->_practicalFocalLength = 0;

  self->_focusingMethod = 0;
  *(int32x4_t *)&self->_maxSphereTrackingError = v4;
  *(void *)&self->_minDistanceFromSphereEndStop = v4.i64[0];
  self->_afPowerConsumption = 3.4028e38;
  self->_depthAFStatus = 0x7FFFFFFF;
  *(void *)&self->_cameraPosture = 0;

  self->_sphereMode = 0;
  *(void *)&self->_apsMode = 0;
  *(void *)&self->_flashBrightnessRatio = v4.i64[0];
  self->_geometricDistortionCorrectionEnabled = 0;

  self->_geometricDistortionCorrectionSource = 0;
  *(void *)&self->_greenGhostMitigationBrightLightIsBrightScene = -1;
  *(void *)&self->_greenGhostMitigationLowLightExceedsMaxMaskAverage = -1;
  *(void *)&self->_greenGhostMitigationLowLightTripodMode = 0x7F7FFFFFFFFFFFFFLL;

  self->_timeOfFlightAssistedAutoFocusEstimatorData = 0;
  self->_leaderFollowerAutoFocusData = 0;
  self->_afDriverShortOccurred = 0;
  *(void *)&self->_deliveredDimensionWidth = 0;
  *(void *)&self->_formatMaxFrameRate = 0;
  *(void *)&self->_formatDimensionWidth = 0;
  *(void *)((char *)&self->_qualityPrioritization + 2) = 0;
  strcpy((char *)&self->_pixelFormat, "0000");
  self->_outputFileType = 0;
  self->_portraitRequested = 0;

  self->_portraitEffectStatus = 0;
  self->_constituentImageDeliveryDeviceTypes = 0;
  *(_WORD *)&self->_fastCapturePrioritizationEnabled = 0;
  self->_stfStillApplied = 0;
  *(void *)&self->_stfStillCorrectionStrength = 0;

  self->_timeOfFlightFlickerDetectionData = 0;
  self->_semanticSceneType = -1;
  self->_smartStyleCastType = -1;
  *(void *)&self->_smartStyleToneBias = 0;
  *(void *)((char *)&self->_smartStyleColorBias + 2) = 0;
  *(void *)&self->_swfrForegroundCorrectionDirection = 0;
  *(void *)&self->_swfrAnalyticsVersion = 0;
  *(void *)&self->_swfrForegroundCorrectionStrength = 0;

  self->_resolutionFlavor = 0;
  self->_awbStable = 0;
  *(void *)&long long v3 = 0x8000000080000000;
  *((void *)&v3 + 1) = 0x8000000080000000;
  *(_OWORD *)&self->_calibrationValidationStatusCmCl = v3;
  self->_coreRepairStatusFrontCameraAssembly = 0x7FFFFFFF;
}

- (id)eventName
{
  return 0;
}

- (id)eventDictionary
{
  long long v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_numberOfFaces), @"numberOfFaces");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", +[BWCoreAnalyticsReporter clientApplicationIDType:](BWCoreAnalyticsReporter, "clientApplicationIDType:", self->_clientApplicationID)), @"clientIDType");
  [v3 setObject:self->_clientApplicationID forKeyedSubscript:@"clientApplicationID"];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_livePhotoEnabled), @"livePhotoEnabled");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_depthEnabled), @"depthEnabled");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_timeLapse), @"timeLapse");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_burst), @"burst");
  if (self->_activeDeviceMask) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:"), @"activeDeviceMask");
  }
  if (self->_devicePosition) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:"), @"devicePosition");
  }
  constituentImageDeliveryDeviceTypes = self->_constituentImageDeliveryDeviceTypes;
  if (constituentImageDeliveryDeviceTypes) {
    [v3 setObject:constituentImageDeliveryDeviceTypes forKeyedSubscript:@"constituentImageDeliveryDeviceTypes"];
  }
  if (self->_captureType) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:"), @"captureType");
  }
  if (self->_captureFlags) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:"), @"captureFlags");
  }
  if (self->_sceneFlags) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:"), @"sceneFlags");
  }
  if (self->_processingDuration != 0x7FFFFFFF) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:"), @"processingDuration");
  }
  if (self->_streamingTime != -1) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:"), @"streamingTime");
  }
  if (self->_luxLevel != 0x7FFFFFFF) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:"), @"luxLevel");
  }
  if (self->_alsLuxLevel != 0x7FFFFFFF) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:"), @"alsLuxLevel");
  }
  if (self->_alsRearLuxLevel != 3.4028e38) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:"), @"alsRearLuxLevel");
  }
  if (self->_lensPosition != 3.4028e38) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:"), @"lensPosition");
  }
  if (self->_sensorTemperature != 0x7FFFFFFF) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:"), @"sensorTemperature");
  }
  if (self->_lensTemperature != 3.4028e38) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:"), @"lensTemperature");
  }
  if (self->_exposureDuration != 3.4028e38) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:"), @"exposureDuration");
  }
  if (self->_iso != 3.4028e38) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:"), @"iso");
  }
  if (self->_normalizedSNR != 3.4028e38) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:"), @"normalizedSNR");
  }
  if (self->_SNR != 3.4028e38) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:"), @"SNR");
  }
  portType = self->_portType;
  if (portType) {
    [v3 setObject:portType forKeyedSubscript:@"portType"];
  }
  if (self->_accelStandardDeviation != 3.4028e38) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:"), @"accelStd");
  }
  if (self->_gyroStandardDeviation != 3.4028e38) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:"), @"gyroStd");
  }
  uint64_t v6 = *MEMORY[0x1E4F52DD8];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_apsSubjectDistance, "objectForKeyedSubscript:", *MEMORY[0x1E4F52DD8]), @"apsSubjectDistanceWide");
  uint64_t v7 = *MEMORY[0x1E4F52DF0];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_apsSubjectDistance, "objectForKeyedSubscript:", *MEMORY[0x1E4F52DF0]), @"apsSubjectDistanceTele");
  uint64_t v8 = *MEMORY[0x1E4F52DE8];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_apsSubjectDistance, "objectForKeyedSubscript:", *MEMORY[0x1E4F52DE8]), @"apsSubjectDistanceSuperwide");
  uint64_t v9 = *MEMORY[0x1E4F52DF8];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_apsSubjectDistance, "objectForKeyedSubscript:", *MEMORY[0x1E4F52DF8]), @"apsSubjectDistanceFront");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_practicalFocalLength, "objectForKeyedSubscript:", v6), @"apsPFLWide");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_practicalFocalLength, "objectForKeyedSubscript:", v7), @"apsPFLTele");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_practicalFocalLength, "objectForKeyedSubscript:", v8), @"apsPFLSuperwide");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_practicalFocalLength, "objectForKeyedSubscript:", v9), @"apsPFLFront");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_focusingMethod, "objectForKeyedSubscript:", v6), @"focusMethodWide");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_focusingMethod, "objectForKeyedSubscript:", v7), @"focusMethodTele");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_focusingMethod, "objectForKeyedSubscript:", v8), @"focusMethodSuperWide");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_focusingMethod, "objectForKeyedSubscript:", v9), @"focusMethodFront");
  if (self->_maxSphereTrackingError != 3.4028e38) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:"), @"oisMaxTrackError");
  }
  if (self->_stdSphereTrackingError != 3.4028e38) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:"), @"oisStdTrackError");
  }
  if (self->_maxAFTrackingError != 3.4028e38) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:"), @"afMaxTrackError");
  }
  if (self->_stdAFTrackingError != 3.4028e38) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:"), @"afStdTrackError");
  }
  if (self->_minDistanceFromSphereEndStop != 3.4028e38) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:"), @"oisMinDistFromEndStop");
  }
  if (self->_spherePowerConsumption != 3.4028e38) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:"), @"oisPower");
  }
  if (self->_afPowerConsumption != 3.4028e38) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:"), @"afPower");
  }
  if (self->_depthAFStatus != 0x7FFFFFFF) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:"), @"depthAFStatus");
  }
  if (self->_cameraPosture) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:"), @"cameraPosture");
  }
  uint64_t imageExifOrientation = self->_imageExifOrientation;
  if (imageExifOrientation > 8) {
    v11 = @"Landscape";
  }
  else {
    v11 = (__CFString *)qword_1E5C29770[imageExifOrientation];
  }
  [v3 setObject:v11 forKeyedSubscript:@"imageOrientation"];
  sphereMode = self->_sphereMode;
  if (sphereMode) {
    [v3 setObject:sphereMode forKeyedSubscript:@"oisMode"];
  }
  if (self->_apsMode) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:"), @"afMode");
  }
  if (self->_timeSinceLastCaptureInSession) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:"), @"timeSinceLastCaptureInSession");
  }
  if (self->_flashBrightnessRatio != 3.4028e38) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:"), @"flashBrightnessRatio");
  }
  if (self->_effectiveIntegrationTime != 3.4028e38) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:"), @"effectiveIntegrationTime");
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_geometricDistortionCorrectionEnabled), @"geometricDistortionCorrectionEnabled");
  geometricDistortionCorrectionSource = self->_geometricDistortionCorrectionSource;
  if (geometricDistortionCorrectionSource) {
    [v3 setObject:geometricDistortionCorrectionSource forKeyedSubscript:@"geometricDistortionCorrectionSource"];
  }
  int greenGhostMitigationBrightLightIsBrightScene = self->_greenGhostMitigationBrightLightIsBrightScene;
  uint64_t v15 = MEMORY[0x1E4F1CC38];
  uint64_t v16 = MEMORY[0x1E4F1CC28];
  if (greenGhostMitigationBrightLightIsBrightScene != -1)
  {
    if (greenGhostMitigationBrightLightIsBrightScene) {
      uint64_t v17 = MEMORY[0x1E4F1CC38];
    }
    else {
      uint64_t v17 = MEMORY[0x1E4F1CC28];
    }
    [v3 setObject:v17 forKeyedSubscript:@"greenGhostMitigationBrightLightIsBrightScene"];
  }
  int greenGhostMitigationBrightLightROIIsComputed = self->_greenGhostMitigationBrightLightROIIsComputed;
  if (greenGhostMitigationBrightLightROIIsComputed != -1)
  {
    if (greenGhostMitigationBrightLightROIIsComputed) {
      uint64_t v19 = v15;
    }
    else {
      uint64_t v19 = v16;
    }
    [v3 setObject:v19 forKeyedSubscript:@"greenGhostMitigationBrightLightROIIsComputed"];
  }
  int greenGhostMitigationLowLightExceedsMaxMaskAverage = self->_greenGhostMitigationLowLightExceedsMaxMaskAverage;
  if (greenGhostMitigationLowLightExceedsMaxMaskAverage != -1)
  {
    if (greenGhostMitigationLowLightExceedsMaxMaskAverage) {
      uint64_t v21 = v15;
    }
    else {
      uint64_t v21 = v16;
    }
    [v3 setObject:v21 forKeyedSubscript:@"greenGhostMitigationLowLightExceedsMaxMaskAverage"];
  }
  int greenGhostMitigationLowLightSkipRepair = self->_greenGhostMitigationLowLightSkipRepair;
  if (greenGhostMitigationLowLightSkipRepair != -1)
  {
    if (greenGhostMitigationLowLightSkipRepair) {
      uint64_t v23 = v15;
    }
    else {
      uint64_t v23 = v16;
    }
    [v3 setObject:v23 forKeyedSubscript:@"greenGhostMitigationLowLightSkipRepair"];
  }
  int greenGhostMitigationLowLightTripodMode = self->_greenGhostMitigationLowLightTripodMode;
  if (greenGhostMitigationLowLightTripodMode != -1)
  {
    if (greenGhostMitigationLowLightTripodMode) {
      uint64_t v25 = v15;
    }
    else {
      uint64_t v25 = v16;
    }
    [v3 setObject:v25 forKeyedSubscript:@"greenGhostMitigationLowLightTripodMode"];
  }
  if (self->_greenGhostMitigationLowLightMaskAverage != 3.4028e38) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:"), @"greenGhostMitigationLowLightMaskAverage");
  }
  timeOfFlightAssistedAutoFocusEstimatorData = self->_timeOfFlightAssistedAutoFocusEstimatorData;
  if (timeOfFlightAssistedAutoFocusEstimatorData)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](timeOfFlightAssistedAutoFocusEstimatorData, "objectForKeyedSubscript:", *MEMORY[0x1E4F55180]), @"tofAFMeasuredDepth");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_timeOfFlightAssistedAutoFocusEstimatorData, "objectForKeyedSubscript:", *MEMORY[0x1E4F55188]), @"tofAFPFLError");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_timeOfFlightAssistedAutoFocusEstimatorData, "objectForKeyedSubscript:", *MEMORY[0x1E4F55198]), @"tofAFSensorConfidence");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_timeOfFlightAssistedAutoFocusEstimatorData, "objectForKeyedSubscript:", *MEMORY[0x1E4F55168]), @"tofAFEstimatorCorrectionApplied");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_timeOfFlightAssistedAutoFocusEstimatorData, "objectForKeyedSubscript:", *MEMORY[0x1E4F55190]), @"tofAFROIType");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_timeOfFlightAssistedAutoFocusEstimatorData, "objectForKeyedSubscript:", *MEMORY[0x1E4F55160]), @"tofAFContainsBlindSpot");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_timeOfFlightAssistedAutoFocusEstimatorData, "objectForKeyedSubscript:", *MEMORY[0x1E4F55170]), @"tofAFMSPMeasuredDepth");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_timeOfFlightAssistedAutoFocusEstimatorData, "objectForKeyedSubscript:", *MEMORY[0x1E4F55178]), @"tofAFMSPSensorConfidence");
  }
  leaderFollowerAutoFocusData = self->_leaderFollowerAutoFocusData;
  if (leaderFollowerAutoFocusData)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](leaderFollowerAutoFocusData, "objectForKeyedSubscript:", *MEMORY[0x1E4F53A58]), @"lfAFLeaderDepth");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_leaderFollowerAutoFocusData, "objectForKeyedSubscript:", *MEMORY[0x1E4F53A78]), @"lfAFPFLError");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_leaderFollowerAutoFocusData, "objectForKeyedSubscript:", *MEMORY[0x1E4F53A50]), @"lfAFLeaderDefocus");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_leaderFollowerAutoFocusData, "objectForKeyedSubscript:", *MEMORY[0x1E4F53A68]), @"lfAFLeaderLensPosition");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_leaderFollowerAutoFocusData, "objectForKeyedSubscript:", *MEMORY[0x1E4F53A60]), @"lfAFFocusMethod");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_leaderFollowerAutoFocusData, "objectForKeyedSubscript:", *MEMORY[0x1E4F53A48]), @"lfAFLeaderConfidence");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_leaderFollowerAutoFocusData, "objectForKeyedSubscript:", *MEMORY[0x1E4F53A70]), @"lfAFLeaderROIType");
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_afDriverShortOccurred), @"afDriverShortOccurred");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_formatDimensionWidth), @"formatDimensionWidth");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_formatDimensionHeight), @"formatDimensionHeight");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_deliveredDimensionWidth), @"deliveredDimensionWidth");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_deliveredDimensionHeight), @"deliveredDimensionHeight");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_formatMaxFrameRate), @"formatMaxFrameRate");
  unsigned int v28 = self->_qualityPrioritization - 1;
  if (v28 > 2) {
    v29 = @"Invalid";
  }
  else {
    v29 = off_1E5C29758[v28];
  }
  [v3 setObject:v29 forKeyedSubscript:@"qualityPrioritization"];
  unsigned int v30 = self->_clientRequestedQualityPrioritization - 1;
  if (v30 > 2) {
    v31 = @"Invalid";
  }
  else {
    v31 = off_1E5C29758[v30];
  }
  [v3 setObject:v31 forKeyedSubscript:@"clientRequestedQualityPrioritization"];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_highQualityPhotoWithVideoFormatSupported), @"highQualityPhotoWithVideoFormatSupported");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_photoFormat), @"photoFormat");
  [v3 setObject:objc_msgSend(NSString, "stringWithFormat:", @"%c%c%c%c", HIBYTE(self->_pixelFormat), BYTE2(self->_pixelFormat), BYTE1(self->_pixelFormat), self->_pixelFormat), @"pixelFormat" forKeyedSubscript];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_binned), @"binned");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_outputFileType), @"outputFileType");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_portraitRequested), @"portraitRequested");
  portraitEffectStatus = self->_portraitEffectStatus;
  if (portraitEffectStatus) {
    [v3 setObject:portraitEffectStatus forKeyedSubscript:@"portraitEffectStatus"];
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_fastCapturePrioritizationEnabled), @"fastCapturePrioritizationEnabled");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_stfStillSupported), @"stfStillSupported");
  if (self->_stfStillSupported)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_stfStillApplied), @"stfStillApplied");
    if (self->_stfStillApplied)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_stfStillCorrectionStrength), @"stfStillCorrectionStrength");
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_stfStillAnalyticsVersion), @"stfStillAnalyticsVersion");
    }
  }
  timeOfFlightFlickerDetectionData = self->_timeOfFlightFlickerDetectionData;
  if (timeOfFlightFlickerDetectionData)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](timeOfFlightFlickerDetectionData, "objectForKeyedSubscript:", *MEMORY[0x1E4F55288]), @"tofFlickerDetectionStatus");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_timeOfFlightFlickerDetectionData, "objectForKeyedSubscript:", *MEMORY[0x1E4F55280]), @"tofFlickerDetectionDC2ACRatio");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_timeOfFlightFlickerDetectionData, "objectForKeyedSubscript:", *MEMORY[0x1E4F55278]), @"tofFlickerDetectionDC2ACConfidence");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_timeOfFlightFlickerDetectionData, "objectForKeyedSubscript:", *MEMORY[0x1E4F55270]), @"tofFlickerDetectionCNISNR");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_timeOfFlightFlickerDetectionData, "objectForKeyedSubscript:", *MEMORY[0x1E4F55268]), @"tofFlickerDetectionCNIRatio");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_timeOfFlightFlickerDetectionData, "objectForKeyedSubscript:", *MEMORY[0x1E4F55258]), @"tofFlickerDetectionCNIChannelDiff");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_timeOfFlightFlickerDetectionData, "objectForKeyedSubscript:", *MEMORY[0x1E4F55260]), @"tofFlickerDetectionCNIPeakIndDiff");
  }
  if (self->_semanticStyleRenderingSupported)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_semanticSceneType), @"semanticSceneType");
    *(float *)&double v34 = self->_semanticStyleToneBias;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v34), @"semanticStyleToneBias");
    *(float *)&double v35 = self->_semanticStyleWarmthBias;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v35), @"semanticStyleWarmthBias");
  }
  if (self->_smartStyleRenderingSupported)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_smartStyleCastType), @"smartStyleCastType");
    *(float *)&double v36 = self->_smartStyleToneBias;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v36), @"smartStyleToneBias");
    *(float *)&double v37 = self->_smartStyleColorBias;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v37), @"smartStyleColorBias");
    *(float *)&double v38 = self->_smartStyleIntensity;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v38), @"smartStyleIntensity");
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_depthDataDeliveryEnabled), @"depthDataDeliveryEnabled");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_swfrApplied), @"swfrApplied");
  if (self->_swfrApplied)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_swfrForegroundCorrectionStrength), @"swfrForegroundCorrectionStrength");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_swfrBackgroundCorrectionStrength), @"swfrBackgroundCorrectionStrength");
    *(float *)&double v39 = self->_swfrForegroundCorrectionDirection;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v39), @"swfrForegroundCorrectionDirection");
    *(float *)&double v40 = self->_swfrBackgroundCorrectionDirection;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v40), @"swfrBackgroundCorrectionDirection");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_swfrAnalyticsVersion), @"swfrAnalyticsVersion");
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_redEyeReductionStatus), @"redEyeReductionStatus");
  resolutionFlavor = self->_resolutionFlavor;
  if (resolutionFlavor) {
    [v3 setObject:resolutionFlavor forKeyedSubscript:@"resolutionFlavor"];
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_awbStable), @"awbStable");
  if (self->_calibrationValidationStatusCmCl != 0x7FFFFFFF) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:"), @"calibrationValidationStatusCmCl");
  }
  if (self->_calibrationValidationStatusCmPM != 0x7FFFFFFF) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:"), @"calibrationValidationStatusCmPM");
  }
  if (self->_calibrationValidationStatusFCCl != 0x7FFFFFFF) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:"), @"calibrationValidationStatusFCCl");
  }
  if (self->_coreRepairStatusRearCameraAssembly != 0x7FFFFFFF) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:"), @"coreRepairStatusRearCameraAssembly");
  }
  if (self->_coreRepairStatusFrontCameraAssembly != 0x7FFFFFFF) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:"), @"coreRepairStatusFrontCameraAssembly");
  }
  return v3;
}

- (BOOL)deferred
{
  return self->_deferred;
}

- (void)setDeferred:(BOOL)a3
{
  self->_deferred = a3;
}

- (int)activeDeviceMask
{
  return self->_activeDeviceMask;
}

- (void)setActiveDeviceMask:(int)a3
{
  self->_activeDeviceMask = a3;
}

- (int)devicePosition
{
  return self->_devicePosition;
}

- (void)setDevicePosition:(int)a3
{
  self->_devicePosition = a3;
}

- (NSString)constituentImageDeliveryDeviceTypes
{
  return self->_constituentImageDeliveryDeviceTypes;
}

- (void)setConstituentImageDeliveryDeviceTypes:(id)a3
{
}

- (int)captureType
{
  return self->_captureType;
}

- (void)setCaptureType:(int)a3
{
  self->_captureType = a3;
}

- (unint64_t)captureFlags
{
  return self->_captureFlags;
}

- (void)setCaptureFlags:(unint64_t)a3
{
  self->_captureFlags = a3;
}

- (unint64_t)sceneFlags
{
  return self->_sceneFlags;
}

- (void)setSceneFlags:(unint64_t)a3
{
  self->_sceneFlags = a3;
}

- (int)processingDuration
{
  return self->_processingDuration;
}

- (void)setProcessingDuration:(int)a3
{
  self->_processingDuration = a3;
}

- (unsigned)streamingTime
{
  return self->_streamingTime;
}

- (void)setStreamingTime:(unsigned int)a3
{
  self->_streamingTime = a3;
}

- (int)luxLevel
{
  return self->_luxLevel;
}

- (void)setLuxLevel:(int)a3
{
  self->_luxLevel = a3;
}

- (int)alsLuxLevel
{
  return self->_alsLuxLevel;
}

- (void)setAlsLuxLevel:(int)a3
{
  self->_alsLuxLevel = a3;
}

- (float)alsRearLuxLevel
{
  return self->_alsRearLuxLevel;
}

- (void)setAlsRearLuxLevel:(float)a3
{
  self->_alsRearLuxLevel = a3;
}

- (float)lensPosition
{
  return self->_lensPosition;
}

- (void)setLensPosition:(float)a3
{
  self->_lensPosition = a3;
}

- (int)sensorTemperature
{
  return self->_sensorTemperature;
}

- (void)setSensorTemperature:(int)a3
{
  self->_sensorTemperature = a3;
}

- (float)lensTemperature
{
  return self->_lensTemperature;
}

- (void)setLensTemperature:(float)a3
{
  self->_lensTemperature = a3;
}

- (float)exposureDuration
{
  return self->_exposureDuration;
}

- (void)setExposureDuration:(float)a3
{
  self->_exposureDuration = a3;
}

- (float)iso
{
  return self->_iso;
}

- (void)setIso:(float)a3
{
  self->_iso = a3;
}

- (float)normalizedSNR
{
  return self->_normalizedSNR;
}

- (void)setNormalizedSNR:(float)a3
{
  self->_normalizedSNR = a3;
}

- (float)SNR
{
  return self->_SNR;
}

- (void)setSNR:(float)a3
{
  self->_SNR = a3;
}

- (int)numberOfFaces
{
  return self->_numberOfFaces;
}

- (void)setNumberOfFaces:(int)a3
{
  self->_numberOfFaces = a3;
}

- (NSString)clientApplicationID
{
  return self->_clientApplicationID;
}

- (void)setClientApplicationID:(id)a3
{
}

- (BOOL)livePhotoEnabled
{
  return self->_livePhotoEnabled;
}

- (void)setLivePhotoEnabled:(BOOL)a3
{
  self->_livePhotoEnabled = a3;
}

- (BOOL)depthEnabled
{
  return self->_depthEnabled;
}

- (void)setDepthEnabled:(BOOL)a3
{
  self->_depthEnabled = a3;
}

- (BOOL)timeLapse
{
  return self->_timeLapse;
}

- (void)setTimeLapse:(BOOL)a3
{
  self->_timeLapse = a3;
}

- (BOOL)burst
{
  return self->_burst;
}

- (void)setBurst:(BOOL)a3
{
  self->_burst = a3;
}

- (NSString)portType
{
  return self->_portType;
}

- (void)setPortType:(id)a3
{
}

- (float)accelStandardDeviation
{
  return self->_accelStandardDeviation;
}

- (void)setAccelStandardDeviation:(float)a3
{
  self->_accelStandardDeviation = a3;
}

- (float)gyroStandardDeviation
{
  return self->_gyroStandardDeviation;
}

- (void)setGyroStandardDeviation:(float)a3
{
  self->_gyroStandardDeviation = a3;
}

- (NSDictionary)apsSubjectDistance
{
  return self->_apsSubjectDistance;
}

- (void)setApsSubjectDistance:(id)a3
{
}

- (NSDictionary)practicalFocalLength
{
  return self->_practicalFocalLength;
}

- (void)setPracticalFocalLength:(id)a3
{
}

- (NSDictionary)focusingMethod
{
  return self->_focusingMethod;
}

- (void)setFocusingMethod:(id)a3
{
}

- (float)maxSphereTrackingError
{
  return self->_maxSphereTrackingError;
}

- (void)setMaxSphereTrackingError:(float)a3
{
  self->_maxSphereTrackingError = a3;
}

- (float)stdSphereTrackingError
{
  return self->_stdSphereTrackingError;
}

- (void)setStdSphereTrackingError:(float)a3
{
  self->_stdSphereTrackingError = a3;
}

- (float)maxAFTrackingError
{
  return self->_maxAFTrackingError;
}

- (void)setMaxAFTrackingError:(float)a3
{
  self->_maxAFTrackingError = a3;
}

- (float)stdAFTrackingError
{
  return self->_stdAFTrackingError;
}

- (void)setStdAFTrackingError:(float)a3
{
  self->_stdAFTrackingError = a3;
}

- (float)minDistanceFromSphereEndStop
{
  return self->_minDistanceFromSphereEndStop;
}

- (void)setMinDistanceFromSphereEndStop:(float)a3
{
  self->_minDistanceFromSphereEndStop = a3;
}

- (float)spherePowerConsumption
{
  return self->_spherePowerConsumption;
}

- (void)setSpherePowerConsumption:(float)a3
{
  self->_spherePowerConsumption = a3;
}

- (float)afPowerConsumption
{
  return self->_afPowerConsumption;
}

- (void)setAfPowerConsumption:(float)a3
{
  self->_afPowerConsumption = a3;
}

- (unsigned)depthAFStatus
{
  return self->_depthAFStatus;
}

- (void)setDepthAFStatus:(unsigned int)a3
{
  self->_depthAFStatus = a3;
}

- (unsigned)cameraPosture
{
  return self->_cameraPosture;
}

- (void)setCameraPosture:(unsigned int)a3
{
  self->_cameraPosture = a3;
}

- (int)imageExifOrientation
{
  return self->_imageExifOrientation;
}

- (void)setImageExifOrientation:(int)a3
{
  self->_uint64_t imageExifOrientation = a3;
}

- (NSString)sphereMode
{
  return self->_sphereMode;
}

- (void)setSphereMode:(id)a3
{
}

- (unsigned)apsMode
{
  return self->_apsMode;
}

- (void)setApsMode:(unsigned int)a3
{
  self->_apsMode = a3;
}

- (unsigned)timeSinceLastCaptureInSession
{
  return self->_timeSinceLastCaptureInSession;
}

- (void)setTimeSinceLastCaptureInSession:(unsigned int)a3
{
  self->_timeSinceLastCaptureInSession = a3;
}

- (float)flashBrightnessRatio
{
  return self->_flashBrightnessRatio;
}

- (void)setFlashBrightnessRatio:(float)a3
{
  self->_flashBrightnessRatio = a3;
}

- (float)effectiveIntegrationTime
{
  return self->_effectiveIntegrationTime;
}

- (void)setEffectiveIntegrationTime:(float)a3
{
  self->_effectiveIntegrationTime = a3;
}

- (BOOL)geometricDistortionCorrectionEnabled
{
  return self->_geometricDistortionCorrectionEnabled;
}

- (void)setGeometricDistortionCorrectionEnabled:(BOOL)a3
{
  self->_geometricDistortionCorrectionEnabled = a3;
}

- (NSString)geometricDistortionCorrectionSource
{
  return self->_geometricDistortionCorrectionSource;
}

- (void)setGeometricDistortionCorrectionSource:(id)a3
{
}

- (int)greenGhostMitigationBrightLightIsBrightScene
{
  return self->_greenGhostMitigationBrightLightIsBrightScene;
}

- (void)setGreenGhostMitigationBrightLightIsBrightScene:(int)a3
{
  self->_int greenGhostMitigationBrightLightIsBrightScene = a3;
}

- (int)greenGhostMitigationBrightLightROIIsComputed
{
  return self->_greenGhostMitigationBrightLightROIIsComputed;
}

- (void)setGreenGhostMitigationBrightLightROIIsComputed:(int)a3
{
  self->_int greenGhostMitigationBrightLightROIIsComputed = a3;
}

- (int)greenGhostMitigationLowLightExceedsMaxMaskAverage
{
  return self->_greenGhostMitigationLowLightExceedsMaxMaskAverage;
}

- (void)setGreenGhostMitigationLowLightExceedsMaxMaskAverage:(int)a3
{
  self->_int greenGhostMitigationLowLightExceedsMaxMaskAverage = a3;
}

- (int)greenGhostMitigationLowLightSkipRepair
{
  return self->_greenGhostMitigationLowLightSkipRepair;
}

- (void)setGreenGhostMitigationLowLightSkipRepair:(int)a3
{
  self->_int greenGhostMitigationLowLightSkipRepair = a3;
}

- (int)greenGhostMitigationLowLightTripodMode
{
  return self->_greenGhostMitigationLowLightTripodMode;
}

- (void)setGreenGhostMitigationLowLightTripodMode:(int)a3
{
  self->_int greenGhostMitigationLowLightTripodMode = a3;
}

- (float)greenGhostMitigationLowLightMaskAverage
{
  return self->_greenGhostMitigationLowLightMaskAverage;
}

- (void)setGreenGhostMitigationLowLightMaskAverage:(float)a3
{
  self->_greenGhostMitigationLowLightMaskAverage = a3;
}

- (NSDictionary)timeOfFlightAssistedAutoFocusEstimatorData
{
  return self->_timeOfFlightAssistedAutoFocusEstimatorData;
}

- (void)setTimeOfFlightAssistedAutoFocusEstimatorData:(id)a3
{
}

- (NSDictionary)leaderFollowerAutoFocusData
{
  return self->_leaderFollowerAutoFocusData;
}

- (void)setLeaderFollowerAutoFocusData:(id)a3
{
}

- (BOOL)afDriverShortOccurred
{
  return self->_afDriverShortOccurred;
}

- (void)setAfDriverShortOccurred:(BOOL)a3
{
  self->_afDriverShortOccurred = a3;
}

- (int)formatDimensionWidth
{
  return self->_formatDimensionWidth;
}

- (void)setFormatDimensionWidth:(int)a3
{
  self->_formatDimensionWidth = a3;
}

- (int)formatDimensionHeight
{
  return self->_formatDimensionHeight;
}

- (void)setFormatDimensionHeight:(int)a3
{
  self->_formatDimensionHeight = a3;
}

- (int)deliveredDimensionWidth
{
  return self->_deliveredDimensionWidth;
}

- (void)setDeliveredDimensionWidth:(int)a3
{
  self->_deliveredDimensionWidth = a3;
}

- (int)deliveredDimensionHeight
{
  return self->_deliveredDimensionHeight;
}

- (void)setDeliveredDimensionHeight:(int)a3
{
  self->_deliveredDimensionHeight = a3;
}

- (int)formatMaxFrameRate
{
  return self->_formatMaxFrameRate;
}

- (void)setFormatMaxFrameRate:(int)a3
{
  self->_formatMaxFrameRate = a3;
}

- (int)qualityPrioritization
{
  return self->_qualityPrioritization;
}

- (void)setQualityPrioritization:(int)a3
{
  self->_qualityPrioritization = a3;
}

- (int)clientRequestedQualityPrioritization
{
  return self->_clientRequestedQualityPrioritization;
}

- (void)setClientRequestedQualityPrioritization:(int)a3
{
  self->_clientRequestedQualityPrioritization = a3;
}

- (BOOL)highQualityPhotoWithVideoFormatSupported
{
  return self->_highQualityPhotoWithVideoFormatSupported;
}

- (void)setHighQualityPhotoWithVideoFormatSupported:(BOOL)a3
{
  self->_highQualityPhotoWithVideoFormatSupported = a3;
}

- (BOOL)photoFormat
{
  return self->_photoFormat;
}

- (void)setPhotoFormat:(BOOL)a3
{
  self->_photoFormat = a3;
}

- (unsigned)pixelFormat
{
  return self->_pixelFormat;
}

- (void)setPixelFormat:(unsigned int)a3
{
  self->_pixelFormat = a3;
}

- (BOOL)binned
{
  return self->_binned;
}

- (void)setBinned:(BOOL)a3
{
  self->_binned = a3;
}

- (unsigned)outputFileType
{
  return self->_outputFileType;
}

- (void)setOutputFileType:(unsigned int)a3
{
  self->_outputFileType = a3;
}

- (BOOL)portraitRequested
{
  return self->_portraitRequested;
}

- (void)setPortraitRequested:(BOOL)a3
{
  self->_portraitRequested = a3;
}

- (NSString)portraitEffectStatus
{
  return self->_portraitEffectStatus;
}

- (void)setPortraitEffectStatus:(id)a3
{
}

- (BOOL)fastCapturePrioritizationEnabled
{
  return self->_fastCapturePrioritizationEnabled;
}

- (void)setFastCapturePrioritizationEnabled:(BOOL)a3
{
  self->_fastCapturePrioritizationEnabled = a3;
}

- (int)stfStillCorrectionStrength
{
  return self->_stfStillCorrectionStrength;
}

- (void)setStfStillCorrectionStrength:(int)a3
{
  self->_stfStillCorrectionStrength = a3;
}

- (BOOL)stfStillSupported
{
  return self->_stfStillSupported;
}

- (void)setStfStillSupported:(BOOL)a3
{
  self->_stfStillSupported = a3;
}

- (BOOL)stfStillApplied
{
  return self->_stfStillApplied;
}

- (void)setStfStillApplied:(BOOL)a3
{
  self->_stfStillApplied = a3;
}

- (unsigned)stfStillAnalyticsVersion
{
  return self->_stfStillAnalyticsVersion;
}

- (void)setStfStillAnalyticsVersion:(unsigned int)a3
{
  self->_stfStillAnalyticsVersion = a3;
}

- (NSDictionary)timeOfFlightFlickerDetectionData
{
  return self->_timeOfFlightFlickerDetectionData;
}

- (void)setTimeOfFlightFlickerDetectionData:(id)a3
{
}

- (BOOL)semanticStyleRenderingSupported
{
  return self->_semanticStyleRenderingSupported;
}

- (void)setSemanticStyleRenderingSupported:(BOOL)a3
{
  self->_semanticStyleRenderingSupported = a3;
}

- (int)semanticSceneType
{
  return self->_semanticSceneType;
}

- (void)setSemanticSceneType:(int)a3
{
  self->_semanticSceneType = a3;
}

- (float)semanticStyleToneBias
{
  return self->_semanticStyleToneBias;
}

- (void)setSemanticStyleToneBias:(float)a3
{
  self->_semanticStyleToneBias = a3;
}

- (float)semanticStyleWarmthBias
{
  return self->_semanticStyleWarmthBias;
}

- (void)setSemanticStyleWarmthBias:(float)a3
{
  self->_semanticStyleWarmthBias = a3;
}

- (BOOL)smartStyleRenderingSupported
{
  return self->_smartStyleRenderingSupported;
}

- (void)setSmartStyleRenderingSupported:(BOOL)a3
{
  self->_smartStyleRenderingSupported = a3;
}

- (float)smartStyleToneBias
{
  return self->_smartStyleToneBias;
}

- (void)setSmartStyleToneBias:(float)a3
{
  self->_smartStyleToneBias = a3;
}

- (float)smartStyleColorBias
{
  return self->_smartStyleColorBias;
}

- (void)setSmartStyleColorBias:(float)a3
{
  self->_smartStyleColorBias = a3;
}

- (float)smartStyleIntensity
{
  return self->_smartStyleIntensity;
}

- (void)setSmartStyleIntensity:(float)a3
{
  self->_smartStyleIntensity = a3;
}

- (BOOL)depthDataDeliveryEnabled
{
  return self->_depthDataDeliveryEnabled;
}

- (void)setDepthDataDeliveryEnabled:(BOOL)a3
{
  self->_depthDataDeliveryEnabled = a3;
}

- (BOOL)swfrApplied
{
  return self->_swfrApplied;
}

- (void)setSwfrApplied:(BOOL)a3
{
  self->_swfrApplied = a3;
}

- (int)swfrForegroundCorrectionStrength
{
  return self->_swfrForegroundCorrectionStrength;
}

- (void)setSwfrForegroundCorrectionStrength:(int)a3
{
  self->_swfrForegroundCorrectionStrength = a3;
}

- (int)swfrBackgroundCorrectionStrength
{
  return self->_swfrBackgroundCorrectionStrength;
}

- (void)setSwfrBackgroundCorrectionStrength:(int)a3
{
  self->_swfrBackgroundCorrectionStrength = a3;
}

- (float)swfrForegroundCorrectionDirection
{
  return self->_swfrForegroundCorrectionDirection;
}

- (void)setSwfrForegroundCorrectionDirection:(float)a3
{
  self->_swfrForegroundCorrectionDirection = a3;
}

- (float)swfrBackgroundCorrectionDirection
{
  return self->_swfrBackgroundCorrectionDirection;
}

- (void)setSwfrBackgroundCorrectionDirection:(float)a3
{
  self->_swfrBackgroundCorrectionDirection = a3;
}

- (unsigned)swfrAnalyticsVersion
{
  return self->_swfrAnalyticsVersion;
}

- (void)setSwfrAnalyticsVersion:(unsigned int)a3
{
  self->_swfrAnalyticsVersion = a3;
}

- (int)redEyeReductionStatus
{
  return self->_redEyeReductionStatus;
}

- (void)setRedEyeReductionStatus:(int)a3
{
  self->_redEyeReductionStatus = a3;
}

- (NSString)resolutionFlavor
{
  return self->_resolutionFlavor;
}

- (void)setResolutionFlavor:(id)a3
{
}

- (BOOL)awbStable
{
  return self->_awbStable;
}

- (void)setAwbStable:(BOOL)a3
{
  self->_awbStable = a3;
}

- (int)calibrationValidationStatusCmCl
{
  return self->_calibrationValidationStatusCmCl;
}

- (void)setCalibrationValidationStatusCmCl:(int)a3
{
  self->_calibrationValidationStatusCmCl = a3;
}

- (int)calibrationValidationStatusCmPM
{
  return self->_calibrationValidationStatusCmPM;
}

- (void)setCalibrationValidationStatusCmPM:(int)a3
{
  self->_calibrationValidationStatusCmPM = a3;
}

- (int)calibrationValidationStatusFCCl
{
  return self->_calibrationValidationStatusFCCl;
}

- (void)setCalibrationValidationStatusFCCl:(int)a3
{
  self->_calibrationValidationStatusFCCl = a3;
}

- (int)coreRepairStatusRearCameraAssembly
{
  return self->_coreRepairStatusRearCameraAssembly;
}

- (void)setCoreRepairStatusRearCameraAssembly:(int)a3
{
  self->_coreRepairStatusRearCameraAssembly = a3;
}

- (int)coreRepairStatusFrontCameraAssembly
{
  return self->_coreRepairStatusFrontCameraAssembly;
}

- (void)setCoreRepairStatusFrontCameraAssembly:(int)a3
{
  self->_coreRepairStatusFrontCameraAssembly = a3;
}

- (int)smartStyleCastType
{
  return self->_smartStyleCastType;
}

- (void)setSmartStyleCastType:(int)a3
{
  self->_smartStyleCastType = a3;
}

@end