@interface BWStreamingSessionAnalyticsPayload
- ($2825F4736939C4A6D3AD43837233062D)videoDimensions;
- (BOOL)audioMixWithOthersEnabled;
- (BOOL)backgroundBlurApertureChanged;
- (BOOL)backgroundBlurEnabled;
- (BOOL)backgroundBlurSupported;
- (BOOL)backgroundReplacementEnabled;
- (BOOL)backgroundReplacementPixelBufferChanged;
- (BOOL)backgroundReplacementSupported;
- (BOOL)binned;
- (BOOL)cinematicFramingEnabled;
- (BOOL)cinematicFramingSupported;
- (BOOL)cinematicVideoEnabled;
- (BOOL)clientIsVOIP;
- (BOOL)depthDataFiltered;
- (BOOL)faceDrivenAEAFEnabledByDefault;
- (BOOL)gesturesEnabled;
- (BOOL)highlightRecoveryEnabled;
- (BOOL)isPhotoFormat;
- (BOOL)reactionEffectsEnabled;
- (BOOL)reactionEffectsSupported;
- (BOOL)studioLightingEnabled;
- (BOOL)studioLightingIntensityChanged;
- (BOOL)studioLightingSupported;
- (BWStreamingSessionAnalyticsPayload)init;
- (NSDictionary)actuatorVendor;
- (NSDictionary)apsMaxDynamicGainDerate;
- (NSDictionary)apsMaxTopEndDynamicBuffer;
- (NSDictionary)degradedAutoFocusStatus;
- (NSDictionary)numberOfSphereJitterDetectAttempts;
- (NSDictionary)numberOfSphereJitterDetects;
- (NSDictionary)sensorTemperatureStats;
- (NSSet)sunburnDetectOccurred;
- (NSString)clientApplicationID;
- (NSString)sphereMode;
- (float)averageLuxValue;
- (float)averageSystemPressureLevel;
- (float)backgroundBlurAperture;
- (float)cinematicVideoAverageRenderingTime;
- (float)cinematicVideoWorstCaseRenderingTime;
- (float)depthMaxFrameRate;
- (float)fieldOfView;
- (float)infaredSensorTemperatureAverage;
- (float)infaredSensorTemperatureRange;
- (float)invalidFrameDurationBeforeFirstValidFrame;
- (float)maxLuxValue;
- (float)maximumFrameRate;
- (float)maximumSupportedFrameRate;
- (float)minLuxValue;
- (float)minimumFrameRate;
- (float)minimumSupportedFrameRate;
- (float)structuredLightActiveTemperatureAverage;
- (float)structuredLightActiveTemperatureFirstReading;
- (float)structuredLightActiveTemperatureLastReading;
- (float)structuredLightActiveTemperatureRange;
- (float)structuredLightIdleTemperatureFirstReading;
- (float)studioLightingIntensity;
- (id)eventDictionary;
- (id)eventName;
- (int)colorSpace;
- (int)continuityCameraClientDeviceClass;
- (int)devicePosition;
- (int)deviceType;
- (int)maxSystemPressureLevel;
- (int)startingCameraPosture;
- (int)streamingStartExifOrientation;
- (int64_t)infraredProjectorUptimeInMsForHighPowerSparse;
- (int64_t)infraredProjectorUptimeInMsForLowPowerSparse;
- (int64_t)timeToCriticalSystemPressureInMS;
- (unsigned)activeDeviceMask;
- (unsigned)backgroundBlurTime;
- (unsigned)backgroundReplacementTime;
- (unsigned)captureDeviceType;
- (unsigned)cinematicFramingControlMode;
- (unsigned)cinematicFramingTime;
- (unsigned)depthFormatDimensionHeight;
- (unsigned)depthFormatDimensionWidth;
- (unsigned)depthPixelFormat;
- (unsigned)faceDrivenAEDisabledCount;
- (unsigned)faceDrivenAFDisabledCount;
- (unsigned)gesturesEnabledTime;
- (unsigned)invalidFrameCountAfterFirstValidFrame;
- (unsigned)longestButtonMashingEventAtRate0;
- (unsigned)longestButtonMashingEventAtRate1;
- (unsigned)maxFacesDetected;
- (unsigned)maxTimeSinceLastPhotoCapture;
- (unsigned)minTimeSinceLastPhotoCapture;
- (unsigned)numberOfBalancedPhotoCaptures;
- (unsigned)numberOfBurstPhotoCaptures;
- (unsigned)numberOfButtonMashingCapturesAtRate0;
- (unsigned)numberOfButtonMashingCapturesAtRate1;
- (unsigned)numberOfButtonMashingEventsAtRate0;
- (unsigned)numberOfButtonMashingEventsAtRate1;
- (unsigned)numberOfPhotoCaptures;
- (unsigned)orientationFaceDownTime;
- (unsigned)orientationFaceUpTime;
- (unsigned)orientationLandscapeTime;
- (unsigned)orientationPortraitTime;
- (unsigned)pixelFormat;
- (unsigned)reactionCount;
- (unsigned)reactionEffectsEnabledTime;
- (unsigned)streamingTime;
- (unsigned)studioLightingTime;
- (unsigned)systemPressureFactors;
- (unsigned)thermalThrottledTime;
- (unsigned)timeOfFlightAssistedAutoFocusStreamingTimeAt0FPS;
- (unsigned)timeOfFlightAssistedAutoFocusStreamingTimeAt1FPS;
- (unsigned)timeOfFlightAssistedAutoFocusStreamingTimeAt8FPS;
- (unsigned)timeOfFlightAssistedAutoFocusStreamingTimeAtOtherFPS;
- (unsigned)timeOfFlightCameraProjectorModeMask;
- (unsigned)timeOfFlightCameraUsageTypeMask;
- (unsigned)timeToFirstPhotoCapture;
- (void)dealloc;
- (void)reset;
- (void)setActiveDeviceMask:(unsigned int)a3;
- (void)setActuatorVendor:(id)a3;
- (void)setApsMaxDynamicGainDerate:(id)a3;
- (void)setApsMaxTopEndDynamicBuffer:(id)a3;
- (void)setAudioMixWithOthersEnabled:(BOOL)a3;
- (void)setAverageLuxValue:(float)a3;
- (void)setAverageSystemPressureLevel:(float)a3;
- (void)setBackgroundBlurAperture:(float)a3;
- (void)setBackgroundBlurApertureChanged:(BOOL)a3;
- (void)setBackgroundBlurEnabled:(BOOL)a3;
- (void)setBackgroundBlurSupported:(BOOL)a3;
- (void)setBackgroundBlurTime:(unsigned int)a3;
- (void)setBackgroundReplacementEnabled:(BOOL)a3;
- (void)setBackgroundReplacementPixelBufferChanged:(BOOL)a3;
- (void)setBackgroundReplacementSupported:(BOOL)a3;
- (void)setBackgroundReplacementTime:(unsigned int)a3;
- (void)setBinned:(BOOL)a3;
- (void)setCaptureDeviceType:(unsigned int)a3;
- (void)setCinematicFramingControlMode:(unsigned int)a3;
- (void)setCinematicFramingEnabled:(BOOL)a3;
- (void)setCinematicFramingSupported:(BOOL)a3;
- (void)setCinematicFramingTime:(unsigned int)a3;
- (void)setCinematicVideoAverageRenderingTime:(float)a3;
- (void)setCinematicVideoEnabled:(BOOL)a3;
- (void)setCinematicVideoWorstCaseRenderingTime:(float)a3;
- (void)setClientApplicationID:(id)a3;
- (void)setClientIsVOIP:(BOOL)a3;
- (void)setColorSpace:(int)a3;
- (void)setContinuityCameraClientDeviceClass:(int)a3;
- (void)setDegradedAutoFocusStatus:(id)a3;
- (void)setDepthDataFiltered:(BOOL)a3;
- (void)setDepthFormatDimensionHeight:(unsigned int)a3;
- (void)setDepthFormatDimensionWidth:(unsigned int)a3;
- (void)setDepthMaxFrameRate:(float)a3;
- (void)setDepthPixelFormat:(unsigned int)a3;
- (void)setDevicePosition:(int)a3;
- (void)setDeviceType:(int)a3;
- (void)setFaceDrivenAEAFEnabledByDefault:(BOOL)a3;
- (void)setFaceDrivenAEDisabledCount:(unsigned int)a3;
- (void)setFaceDrivenAFDisabledCount:(unsigned int)a3;
- (void)setFieldOfView:(float)a3;
- (void)setGesturesEnabled:(BOOL)a3;
- (void)setGesturesEnabledTime:(unsigned int)a3;
- (void)setHighlightRecoveryEnabled:(BOOL)a3;
- (void)setInfaredSensorTemperatureAverage:(float)a3;
- (void)setInfaredSensorTemperatureRange:(float)a3;
- (void)setInfraredProjectorUptimeInMsForHighPowerSparse:(int64_t)a3;
- (void)setInfraredProjectorUptimeInMsForLowPowerSparse:(int64_t)a3;
- (void)setInvalidFrameCountAfterFirstValidFrame:(unsigned int)a3;
- (void)setInvalidFrameDurationBeforeFirstValidFrame:(float)a3;
- (void)setLongestButtonMashingEventAtRate0:(unsigned int)a3;
- (void)setLongestButtonMashingEventAtRate1:(unsigned int)a3;
- (void)setMaxFacesDetected:(unsigned int)a3;
- (void)setMaxLuxValue:(float)a3;
- (void)setMaxSystemPressureLevel:(int)a3;
- (void)setMaxTimeSinceLastPhotoCapture:(unsigned int)a3;
- (void)setMaximumFrameRate:(float)a3;
- (void)setMaximumSupportedFrameRate:(float)a3;
- (void)setMinLuxValue:(float)a3;
- (void)setMinTimeSinceLastPhotoCapture:(unsigned int)a3;
- (void)setMinimumFrameRate:(float)a3;
- (void)setMinimumSupportedFrameRate:(float)a3;
- (void)setNumberOfBalancedPhotoCaptures:(unsigned int)a3;
- (void)setNumberOfBurstPhotoCaptures:(unsigned int)a3;
- (void)setNumberOfButtonMashingCapturesAtRate0:(unsigned int)a3;
- (void)setNumberOfButtonMashingCapturesAtRate1:(unsigned int)a3;
- (void)setNumberOfButtonMashingEventsAtRate0:(unsigned int)a3;
- (void)setNumberOfButtonMashingEventsAtRate1:(unsigned int)a3;
- (void)setNumberOfPhotoCaptures:(unsigned int)a3;
- (void)setNumberOfSphereJitterDetectAttempts:(id)a3;
- (void)setNumberOfSphereJitterDetects:(id)a3;
- (void)setOrientationFaceDownTime:(unsigned int)a3;
- (void)setOrientationFaceUpTime:(unsigned int)a3;
- (void)setOrientationLandscapeTime:(unsigned int)a3;
- (void)setOrientationPortraitTime:(unsigned int)a3;
- (void)setPhotoFormat:(BOOL)a3;
- (void)setPixelFormat:(unsigned int)a3;
- (void)setReactionCount:(unsigned int)a3;
- (void)setReactionEffectsEnabled:(BOOL)a3;
- (void)setReactionEffectsEnabledTime:(unsigned int)a3;
- (void)setReactionEffectsSupported:(BOOL)a3;
- (void)setSensorTemperatureStats:(id)a3;
- (void)setSphereMode:(id)a3;
- (void)setStartingCameraPosture:(int)a3;
- (void)setStreamingStartExifOrientation:(int)a3;
- (void)setStreamingTime:(unsigned int)a3;
- (void)setStructuredLightActiveTemperatureAverage:(float)a3;
- (void)setStructuredLightActiveTemperatureFirstReading:(float)a3;
- (void)setStructuredLightActiveTemperatureLastReading:(float)a3;
- (void)setStructuredLightActiveTemperatureRange:(float)a3;
- (void)setStructuredLightIdleTemperatureFirstReading:(float)a3;
- (void)setStudioLightingEnabled:(BOOL)a3;
- (void)setStudioLightingIntensity:(float)a3;
- (void)setStudioLightingIntensityChanged:(BOOL)a3;
- (void)setStudioLightingSupported:(BOOL)a3;
- (void)setStudioLightingTime:(unsigned int)a3;
- (void)setSunburnDetectOccurred:(id)a3;
- (void)setSystemPressureFactors:(unsigned int)a3;
- (void)setThermalThrottledTime:(unsigned int)a3;
- (void)setTimeOfFlightAssistedAutoFocusStreamingTimeAt0FPS:(unsigned int)a3;
- (void)setTimeOfFlightAssistedAutoFocusStreamingTimeAt1FPS:(unsigned int)a3;
- (void)setTimeOfFlightAssistedAutoFocusStreamingTimeAt8FPS:(unsigned int)a3;
- (void)setTimeOfFlightAssistedAutoFocusStreamingTimeAtOtherFPS:(unsigned int)a3;
- (void)setTimeOfFlightCameraProjectorModeMask:(unsigned int)a3;
- (void)setTimeOfFlightCameraUsageTypeMask:(unsigned int)a3;
- (void)setTimeToCriticalSystemPressureInMS:(int64_t)a3;
- (void)setTimeToFirstPhotoCapture:(unsigned int)a3;
- (void)setVideoDimensions:(id)a3;
@end

@implementation BWStreamingSessionAnalyticsPayload

- (BWStreamingSessionAnalyticsPayload)init
{
  v5.receiver = self;
  v5.super_class = (Class)BWStreamingSessionAnalyticsPayload;
  v2 = [(BWStreamingSessionAnalyticsPayload *)&v5 init];
  v3 = v2;
  if (v2) {
    [(BWStreamingSessionAnalyticsPayload *)v2 reset];
  }
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWStreamingSessionAnalyticsPayload;
  [(BWStreamingSessionAnalyticsPayload *)&v3 dealloc];
}

- (void)reset
{
  *(void *)&self->_activeDeviceMask = 0;
  *(void *)&self->_devicePosition = 0;
  *(void *)&self->_streamingStartExifOrientation = 0;

  self->_clientApplicationID = 0;
  self->_sunburnDetectOccurred = 0;

  self->_degradedAutoFocusStatus = 0;
  self->_apsMaxDynamicGainDerate = 0;

  self->_apsMaxTopEndDynamicBuffer = 0;
  self->_numberOfSphereJitterDetectAttempts = 0;

  self->_numberOfSphereJitterDetects = 0;
  self->_actuatorVendor = 0;

  *(_OWORD *)&self->_longestButtonMashingEventAtRate0 = 0u;
  *(_OWORD *)&self->_numberOfButtonMashingCapturesAtRate0 = 0u;
  *(_OWORD *)&self->_numberOfBalancedPhotoCaptures = 0u;
  *(_OWORD *)&self->_sphereMode = 0u;
  int32x4_t v3 = vdupq_n_s32(0x7F7FFFFFu);
  *(int32x4_t *)&self->_structuredLightIdleTemperatureFirstReading = v3;
  *(void *)&self->_structuredLightActiveTemperatureAverage = v3.i64[0];
  self->_infaredSensorTemperatureAverage = 3.4028e38;

  self->_sensorTemperatureStats = 0;
  self->_infraredProjectorUptimeInMsForLowPowerSparse = -1;
  self->_infraredProjectorUptimeInMsForHighPowerSparse = -1;
  *(void *)&self->_averageSystemPressureLevel = 0;
  self->_timeToCriticalSystemPressureInMS = -1;
  self->_systemPressureFactors = 0;
  *(_WORD *)&self->_cinematicFramingSupported = 0;
  *(void *)&self->_cinematicFramingControlMode = 0xFFFFFFFFLL;
  *(_WORD *)&self->_backgroundBlurSupported = 0;
  self->_backgroundBlurTime = 0;
  self->_backgroundBlurApertureChanged = 0;
  self->_backgroundBlurAperture = -1.0;
  *(_WORD *)&self->_studioLightingSupported = 0;
  self->_studioLightingTime = 0;
  self->_studioLightingIntensityChanged = 0;
  self->_studioLightingIntensity = -1.0;
  self->_backgroundReplacementTime = 0;
  *(_WORD *)&self->_backgroundReplacementPixelBufferChanged = 0;
  *(void *)&self->_orientationPortraitTime = 0;
  *(void *)&self->_orientationFaceUpTime = 0;
  *(unsigned int *)((char *)&self->_orientationFaceDownTime + 3) = 0;
  *(void *)&self->_reactionsCount = 0;
  *(void *)((char *)&self->_reactionsEffectsEnabledTime + 2) = 0;
  *(void *)&self->_cinematicVideoAverageRenderingTime = 0x7F7FFFFF7F7FFFFFLL;
  *(void *)&self->_timeOfFlightAssistedAutoFocusStreamingTimeAt0FPS = 0;
  *(void *)&self->_timeOfFlightAssistedAutoFocusStreamingTimeAt8FPS = 0;
  *(void *)&self->_captureDeviceType = 0x7F7FFFFFFFFFFFFFLL;
  self->_depthFormatDimensionWidth = -1;
  *(void *)&self->_depthFormatDimensionHeight = 0xFFFFFFFFLL;
  *(_WORD *)&self->_depthDataFiltered = 0;
  self->_faceDrivenAFDisabledCount = -1;
  *(void *)&self->_faceDrivenAEDisabledCount = -1;
  *(void *)&self->_minLuxValue = 0x80000000800000;
  self->_averageLuxValue = 1.1755e-38;
  self->_photoFormat = 0;
  self->_thermalThrottledTime = 0;
  *(void *)&self->_continuityCameraClientDeviceClass = 0x3030303000000000;
  self->_highlightRecoveryEnabled = 0;
  self->_videoDimensions = 0;
  *(void *)&self->_minimumFrameRate = 0;
  *(void *)&self->_minimumSupportedFrameRate = 0;
  *(void *)((char *)&self->_maximumFrameRate + 1) = 0;
  self->_colorSpace = -1;
  *(_WORD *)&self->_clientIsVOIP = 0;
  *(void *)&self->_invalidFrameDurationBeforeFirstValidFrame = 0;
}

- (id)eventName
{
  return @"com.apple.coremedia.camera.StreamingSession";
}

- (id)eventDictionary
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  int32x4_t v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", +[BWCoreAnalyticsReporter clientApplicationIDType:](BWCoreAnalyticsReporter, "clientApplicationIDType:", self->_clientApplicationID)), @"clientIDType");
  [v3 setObject:self->_clientApplicationID forKeyedSubscript:@"clientApplicationID"];
  if (self->_activeDeviceMask) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:"), @"activeDeviceMask");
  }
  if (self->_deviceType) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:"), @"deviceType");
  }
  if (self->_devicePosition) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:"), @"devicePosition");
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_startingCameraPosture), @"startingCameraPosture");
  uint64_t streamingStartExifOrientation = self->_streamingStartExifOrientation;
  if (streamingStartExifOrientation > 8) {
    objc_super v5 = @"Landscape";
  }
  else {
    objc_super v5 = (__CFString *)qword_1E5C29770[streamingStartExifOrientation];
  }
  [v3 setObject:v5 forKeyedSubscript:@"startingCameraOrientation"];
  if (self->_streamingTime) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:"), @"streamingTime");
  }
  uint64_t v6 = *MEMORY[0x1E4F52DD8];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", -[NSSet containsObject:](self->_sunburnDetectOccurred, "containsObject:", *MEMORY[0x1E4F52DD8])), @"sunburnDetectOccurredWide");
  uint64_t v7 = *MEMORY[0x1E4F52DF0];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", -[NSSet containsObject:](self->_sunburnDetectOccurred, "containsObject:", *MEMORY[0x1E4F52DF0])), @"sunburnDetectOccurredTele");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_degradedAutoFocusStatus, "objectForKeyedSubscript:", v6), "intValue")), @"degradedAutoFocusStatusWide");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_degradedAutoFocusStatus, "objectForKeyedSubscript:", v7), "intValue")), @"degradedAutoFocusStatusTele");
  uint64_t v8 = *MEMORY[0x1E4F52DE8];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_degradedAutoFocusStatus, "objectForKeyedSubscript:", *MEMORY[0x1E4F52DE8]), "intValue")), @"degradedAutoFocusStatusSuperwide");
  uint64_t v9 = *MEMORY[0x1E4F52DF8];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_degradedAutoFocusStatus, "objectForKeyedSubscript:", *MEMORY[0x1E4F52DF8]), "intValue")), @"degradedAutoFocusStatusFront");
  v10 = NSNumber;
  objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_apsMaxDynamicGainDerate, "objectForKeyedSubscript:", v6), "floatValue");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(v10, "numberWithFloat:"), @"apsMaxDynamicGainDerateWide");
  v11 = NSNumber;
  objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_apsMaxTopEndDynamicBuffer, "objectForKeyedSubscript:", v6), "floatValue");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(v11, "numberWithFloat:"), @"apsMaxTopEndDynamicBufferWide");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_numberOfSphereJitterDetectAttempts, "objectForKeyedSubscript:", v6), "intValue")), @"numberOfSphereJitterDetectAttemptsWide");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_numberOfSphereJitterDetectAttempts, "objectForKeyedSubscript:", v7), "intValue")), @"numberOfSphereJitterDetectAttemptsTele");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_numberOfSphereJitterDetects, "objectForKeyedSubscript:", v6), "intValue")), @"numberOfSphereJitterDetectsWide");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_numberOfSphereJitterDetects, "objectForKeyedSubscript:", v7), "intValue")), @"numberOfSphereJitterDetectsTele");
  uint64_t v53 = v6;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_actuatorVendor, "objectForKeyedSubscript:", v6), @"actuatorVendorWide");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_actuatorVendor, "objectForKeyedSubscript:", v7), @"actuatorVendorTele");
  uint64_t v51 = v8;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_actuatorVendor, "objectForKeyedSubscript:", v8), @"actuatorVendorSuperWide");
  uint64_t v50 = v9;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_actuatorVendor, "objectForKeyedSubscript:", v9), @"actuatorVendorFront");
  [v3 setObject:self->_sphereMode forKeyedSubscript:@"sphereMode"];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_numberOfPhotoCaptures), @"numberOfPhotoCaptures");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_numberOfBurstPhotoCaptures), @"numberOfBurstPhotoCaptures");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_numberOfBalancedPhotoCaptures), @"numberOfBalancedPhotoCaptures");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_timeToFirstPhotoCapture), @"timeToFirstPhotoCapture");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_maxTimeSinceLastPhotoCapture), @"maxTimeSinceLastPhotoCapture");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_minTimeSinceLastPhotoCapture), @"minTimeSinceLastPhotoCapture");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_numberOfButtonMashingCapturesAtRate0), @"numberOfButtonMashingCapturesAtRate0");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_numberOfButtonMashingCapturesAtRate1), @"numberOfButtonMashingCapturesAtRate1");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_numberOfButtonMashingEventsAtRate0), @"numberOfButtonMashingEventsAtRate0");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_numberOfButtonMashingEventsAtRate1), @"numberOfButtonMashingEventsAtRate1");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_longestButtonMashingEventAtRate0), @"longestButtonMashingEventAtRate0");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_longestButtonMashingEventAtRate1), @"longestButtonMashingEventAtRate1");
  if (self->_timeOfFlightCameraProjectorModeMask) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:"), @"timeOfFlightCameraProjectorModeMask");
  }
  if (self->_timeOfFlightCameraUsageTypeMask) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:"), @"timeOfFlightCameraUsageTypeMask");
  }
  if (self->_structuredLightIdleTemperatureFirstReading != 3.4028e38) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:"), @"structuredLightIdleTemperatureFirstReading");
  }
  if (self->_structuredLightActiveTemperatureFirstReading != 3.4028e38) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:"), @"structuredLightActiveTemperatureFirstReading");
  }
  if (self->_structuredLightActiveTemperatureLastReading != 3.4028e38) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:"), @"structuredLightActiveTemperatureLastReading");
  }
  if (self->_structuredLightActiveTemperatureRange != 3.4028e38) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:"), @"structuredLightActiveTemperatureRange");
  }
  if (self->_structuredLightActiveTemperatureAverage != 3.4028e38) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:"), @"structuredLightActiveTemperatureAverage");
  }
  if (self->_infaredSensorTemperatureRange != 3.4028e38) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:"), @"infaredSensorTemperatureRange");
  }
  if (self->_infaredSensorTemperatureAverage != 3.4028e38) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:"), @"infaredSensorTemperatureAverage");
  }
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  v12 = self;
  obj = self->_sensorTemperatureStats;
  uint64_t v13 = [(NSDictionary *)obj countByEnumeratingWithState:&v54 objects:v58 count:16];
  if (v13)
  {
    uint64_t v15 = v13;
    uint64_t v16 = *(void *)v55;
    uint64_t v49 = *MEMORY[0x1E4F52E10];
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v55 != v16) {
          objc_enumerationMutation(obj);
        }
        v18 = *(__CFString **)(*((void *)&v54 + 1) + 8 * i);
        v19 = @"Wide";
        if (([(__CFString *)v18 isEqualToString:v53] & 1) == 0)
        {
          v19 = @"Tele";
          if (([(__CFString *)v18 isEqualToString:v7] & 1) == 0)
          {
            v19 = @"SuperWide";
            if (([(__CFString *)v18 isEqualToString:v51] & 1) == 0)
            {
              v19 = @"Front";
              if (([(__CFString *)v18 isEqualToString:v50] & 1) == 0)
              {
                if ([(__CFString *)v18 isEqualToString:v49]) {
                  v19 = @"FrontSuperWide";
                }
                else {
                  v19 = v18;
                }
              }
            }
          }
        }
        id v20 = [(NSDictionary *)v12->_sensorTemperatureStats objectForKeyedSubscript:v18];
        v21 = NSNumber;
        [v20 max];
        uint64_t v22 = objc_msgSend(v21, "numberWithDouble:");
        [v3 setObject:v22, objc_msgSend(NSString, "stringWithFormat:", @"sensorTemperature%@Max", v19) forKeyedSubscript];
        v23 = NSNumber;
        [v20 min];
        uint64_t v24 = objc_msgSend(v23, "numberWithDouble:");
        [v3 setObject:v24, objc_msgSend(NSString, "stringWithFormat:", @"sensorTemperature%@Min", v19) forKeyedSubscript];
        v25 = NSNumber;
        [v20 average];
        uint64_t v26 = objc_msgSend(v25, "numberWithDouble:");
        [v3 setObject:v26, objc_msgSend(NSString, "stringWithFormat:", @"sensorTemperature%@Average", v19) forKeyedSubscript];
        v27 = NSNumber;
        [v20 max];
        double v29 = v28;
        [v20 min];
        uint64_t v31 = [v27 numberWithDouble:v29 - v30];
        [v3 setObject:v31, objc_msgSend(NSString, "stringWithFormat:", @"sensorTemperature%@Range", v19) forKeyedSubscript];
      }
      uint64_t v15 = [(NSDictionary *)obj countByEnumeratingWithState:&v54 objects:v58 count:16];
    }
    while (v15);
  }
  if ((v12->_infraredProjectorUptimeInMsForLowPowerSparse & 0x8000000000000000) == 0) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithLongLong:"), @"infraredProjectorUptimeInMsForLowPowerSparse");
  }
  if ((v12->_infraredProjectorUptimeInMsForHighPowerSparse & 0x8000000000000000) == 0) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithLongLong:"), @"infraredProjectorUptimeInMsForHighPowerSparse");
  }
  *(float *)&double v14 = v12->_averageSystemPressureLevel;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v14), @"averageSystemPressureLevel");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", v12->_maxSystemPressureLevel), @"maxSystemPressureLevel");
  if ((v12->_timeToCriticalSystemPressureInMS & 0x8000000000000000) == 0) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithLongLong:"), @"timeToCriticalSystemPressure");
  }
  if (v12->_systemPressureFactors) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:"), @"systemPressureFactors");
  }
  if (v12->_cinematicFramingSupported)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12->_cinematicFramingEnabled), @"isCinematicFramingEnabled");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v12->_cinematicFramingControlMode), @"cinematicFramingControlMode");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v12->_cinematicFramingTime), @"cinematicFramingTime");
  }
  if (v12->_backgroundBlurSupported)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12->_backgroundBlurEnabled), @"isBackgroundBlurEnabled");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v12->_backgroundBlurTime), @"backgroundBlurTime");
    if (v12->_backgroundBlurTime)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12->_backgroundBlurApertureChanged), @"backgroundBlurChanged");
      *(float *)&double v32 = v12->_backgroundBlurAperture;
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v32), @"backgroundBlurAperture");
    }
  }
  if (v12->_studioLightingSupported)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12->_studioLightingEnabled), @"isStudioLightingEnabled");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v12->_studioLightingTime), @"studioLightingTime");
    if (v12->_studioLightingTime)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12->_studioLightingIntensityChanged), @"studioLightingChanged");
      *(float *)&double v33 = v12->_studioLightingIntensity;
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v33), @"studioLightingIntensity");
    }
  }
  if (v12->_orientationPortraitTime) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:"), @"orientationPortraitTime");
  }
  if (v12->_orientationLandscapeTime) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:"), @"orientationLandscapeTime");
  }
  if (v12->_orientationFaceUpTime) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:"), @"orientationFaceUpTime");
  }
  if (v12->_orientationFaceDownTime) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:"), @"orientationFaceDownTime");
  }
  if (v12->_reactionEffectsSupported)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12->_reactionEffectsEnabled), @"reactionEffectsEnabled");
    if (v12->_reactionEffectsEnabled) {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12->_gesturesEnabled), @"gesturesEnabled");
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v12->_reactionCount), @"reactionCount");
  }
  if (v12->_reactionEffectsEnabledTime) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:"), @"reactionEffectsEnabledTime");
  }
  if (v12->_gesturesEnabledTime) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:"), @"gesturesEnabledTime");
  }
  if (v12->_backgroundReplacementSupported)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12->_backgroundReplacementEnabled), @"isBackgroundReplacementEnabled");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v12->_backgroundReplacementTime), @"backgroundReplacementTime");
    if (v12->_backgroundReplacementTime) {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12->_backgroundReplacementPixelBufferChanged), @"backgroundReplacementChanged");
    }
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12->_cinematicVideoEnabled), @"cinematicVideoEnabled");
  if (v12->_cinematicVideoEnabled)
  {
    *(float *)&double v34 = v12->_cinematicVideoAverageRenderingTime;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v34), @"cinematicVideoAverageRenderingTime");
    *(float *)&double v35 = v12->_cinematicVideoWorstCaseRenderingTime;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v35), @"cinematicVideoWorstCaseRenderingTime");
  }
  if (v12->_timeOfFlightAssistedAutoFocusStreamingTimeAt0FPS
    || v12->_timeOfFlightAssistedAutoFocusStreamingTimeAt1FPS
    || v12->_timeOfFlightAssistedAutoFocusStreamingTimeAt8FPS
    || v12->_timeOfFlightAssistedAutoFocusStreamingTimeAtOtherFPS)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:"), @"tofStreamingTime0FPS");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v12->_timeOfFlightAssistedAutoFocusStreamingTimeAt1FPS), @"tofStreamingTime1FPS");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v12->_timeOfFlightAssistedAutoFocusStreamingTimeAt8FPS), @"tofStreamingTime8FPS");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v12->_timeOfFlightAssistedAutoFocusStreamingTimeAtOtherFPS), @"tofStreamingTimeOtherFPS");
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v12->_captureDeviceType), @"captureDeviceType");
  if (v12->_depthMaxFrameRate != 3.4028e38) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:"), @"depthMaxFrameRate");
  }
  if (v12->_depthFormatDimensionWidth != -1) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:"), @"depthFormatDimensionWidth");
  }
  if (v12->_depthFormatDimensionHeight != -1) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:"), @"depthFormatDimensionHeight");
  }
  [v3 setObject:BWStringForOSType(v12->_depthPixelFormat) forKeyedSubscript:@"depthPixelFormat"];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12->_depthDataFiltered), @"depthDataFiltered");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12->_faceDrivenAEAFEnabledByDefault), @"faceDrivenAEAFEnabledByDefault");
  if (v12->_faceDrivenAEAFEnabledByDefault)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v12->_faceDrivenAFDisabledCount), @"faceDrivenAFDisabledCount");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v12->_faceDrivenAEDisabledCount), @"faceDrivenAEDisabledCount");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v12->_maxFacesDetected), @"maxFacesDetected");
    *(float *)&double v36 = v12->_minLuxValue;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v36), @"minLuxValue");
    *(float *)&double v37 = v12->_maxLuxValue;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v37), @"maxLuxValue");
    *(float *)&double v38 = v12->_averageLuxValue;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v38), @"averageLuxValue");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12->_photoFormat), @"photoFormat");
  }
  int continuityCameraClientDeviceClass = v12->_continuityCameraClientDeviceClass;
  v40 = @"AppleTV";
  if (continuityCameraClientDeviceClass != 4) {
    v40 = 0;
  }
  if (continuityCameraClientDeviceClass == 100) {
    v41 = @"Mac";
  }
  else {
    v41 = v40;
  }
  if (v41) {
    [v3 setObject:v41 forKeyedSubscript:@"continuityCameraClientDeviceClass"];
  }
  if (v12->_streamingTime)
  {
    if (v12->_thermalThrottledTime) {
      uint64_t v42 = MEMORY[0x1E4F1CC38];
    }
    else {
      uint64_t v42 = MEMORY[0x1E4F1CC28];
    }
    [v3 setObject:v42 forKeyedSubscript:@"thermalThrottled"];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v12->_thermalThrottledTime), @"thermalThrottledTime");
  }
  [v3 setObject:BWStringForOSType(v12->_pixelFormat) forKeyedSubscript:@"pixelFormat"];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", v12->_videoDimensions.width), @"videoDimensionsWidth");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", v12->_videoDimensions.height), @"videoDimensionsHeight");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12->_highlightRecoveryEnabled), @"highlightRecoveryEnabled");
  *(float *)&double v43 = v12->_minimumSupportedFrameRate;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v43), @"minimumSupportedFrameRate");
  *(float *)&double v44 = v12->_maximumSupportedFrameRate;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v44), @"maximumSupportedFrameRate");
  *(float *)&double v45 = v12->_minimumFrameRate;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v45), @"minimumFrameRate");
  *(float *)&double v46 = v12->_maximumFrameRate;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v46), @"maximumFrameRate");
  *(float *)&double v47 = v12->_fieldOfView;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v47), @"fieldOfView");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12->_binned), @"binned");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", v12->_colorSpace), @"colorSpace");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12->_clientIsVOIP), @"clientIsVOIP");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12->_audioMixWithOthersEnabled), @"audioMixWithOthersEnabled");
  if (v12->_invalidFrameDurationBeforeFirstValidFrame != 0.0) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:"), @"invalidFrameDurationBeforeFirstValidFrame");
  }
  if (v12->_invalidFrameCountAfterFirstValidFrame) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:"), @"invalidFrameCountAfterFirstValidFrame");
  }
  return v3;
}

- (int)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(int)a3
{
  self->_deviceType = a3;
}

- (int)devicePosition
{
  return self->_devicePosition;
}

- (void)setDevicePosition:(int)a3
{
  self->_devicePosition = a3;
}

- (int)startingCameraPosture
{
  return self->_startingCameraPosture;
}

- (void)setStartingCameraPosture:(int)a3
{
  self->_startingCameraPosture = a3;
}

- (int)streamingStartExifOrientation
{
  return self->_streamingStartExifOrientation;
}

- (void)setStreamingStartExifOrientation:(int)a3
{
  self->_uint64_t streamingStartExifOrientation = a3;
}

- (unsigned)streamingTime
{
  return self->_streamingTime;
}

- (void)setStreamingTime:(unsigned int)a3
{
  self->_streamingTime = a3;
}

- (NSString)clientApplicationID
{
  return self->_clientApplicationID;
}

- (void)setClientApplicationID:(id)a3
{
}

- (NSSet)sunburnDetectOccurred
{
  return self->_sunburnDetectOccurred;
}

- (void)setSunburnDetectOccurred:(id)a3
{
}

- (NSDictionary)degradedAutoFocusStatus
{
  return self->_degradedAutoFocusStatus;
}

- (void)setDegradedAutoFocusStatus:(id)a3
{
}

- (NSDictionary)apsMaxDynamicGainDerate
{
  return self->_apsMaxDynamicGainDerate;
}

- (void)setApsMaxDynamicGainDerate:(id)a3
{
}

- (NSDictionary)apsMaxTopEndDynamicBuffer
{
  return self->_apsMaxTopEndDynamicBuffer;
}

- (void)setApsMaxTopEndDynamicBuffer:(id)a3
{
}

- (NSDictionary)numberOfSphereJitterDetectAttempts
{
  return self->_numberOfSphereJitterDetectAttempts;
}

- (void)setNumberOfSphereJitterDetectAttempts:(id)a3
{
}

- (NSDictionary)numberOfSphereJitterDetects
{
  return self->_numberOfSphereJitterDetects;
}

- (void)setNumberOfSphereJitterDetects:(id)a3
{
}

- (NSDictionary)actuatorVendor
{
  return self->_actuatorVendor;
}

- (void)setActuatorVendor:(id)a3
{
}

- (NSString)sphereMode
{
  return self->_sphereMode;
}

- (void)setSphereMode:(id)a3
{
}

- (unsigned)numberOfPhotoCaptures
{
  return self->_numberOfPhotoCaptures;
}

- (void)setNumberOfPhotoCaptures:(unsigned int)a3
{
  self->_numberOfPhotoCaptures = a3;
}

- (unsigned)numberOfBurstPhotoCaptures
{
  return self->_numberOfBurstPhotoCaptures;
}

- (void)setNumberOfBurstPhotoCaptures:(unsigned int)a3
{
  self->_numberOfBurstPhotoCaptures = a3;
}

- (unsigned)numberOfBalancedPhotoCaptures
{
  return self->_numberOfBalancedPhotoCaptures;
}

- (void)setNumberOfBalancedPhotoCaptures:(unsigned int)a3
{
  self->_numberOfBalancedPhotoCaptures = a3;
}

- (unsigned)timeToFirstPhotoCapture
{
  return self->_timeToFirstPhotoCapture;
}

- (void)setTimeToFirstPhotoCapture:(unsigned int)a3
{
  self->_timeToFirstPhotoCapture = a3;
}

- (unsigned)maxTimeSinceLastPhotoCapture
{
  return self->_maxTimeSinceLastPhotoCapture;
}

- (void)setMaxTimeSinceLastPhotoCapture:(unsigned int)a3
{
  self->_maxTimeSinceLastPhotoCapture = a3;
}

- (unsigned)minTimeSinceLastPhotoCapture
{
  return self->_minTimeSinceLastPhotoCapture;
}

- (void)setMinTimeSinceLastPhotoCapture:(unsigned int)a3
{
  self->_minTimeSinceLastPhotoCapture = a3;
}

- (unsigned)numberOfButtonMashingCapturesAtRate0
{
  return self->_numberOfButtonMashingCapturesAtRate0;
}

- (void)setNumberOfButtonMashingCapturesAtRate0:(unsigned int)a3
{
  self->_numberOfButtonMashingCapturesAtRate0 = a3;
}

- (unsigned)numberOfButtonMashingCapturesAtRate1
{
  return self->_numberOfButtonMashingCapturesAtRate1;
}

- (void)setNumberOfButtonMashingCapturesAtRate1:(unsigned int)a3
{
  self->_numberOfButtonMashingCapturesAtRate1 = a3;
}

- (unsigned)numberOfButtonMashingEventsAtRate0
{
  return self->_numberOfButtonMashingEventsAtRate0;
}

- (void)setNumberOfButtonMashingEventsAtRate0:(unsigned int)a3
{
  self->_numberOfButtonMashingEventsAtRate0 = a3;
}

- (unsigned)numberOfButtonMashingEventsAtRate1
{
  return self->_numberOfButtonMashingEventsAtRate1;
}

- (void)setNumberOfButtonMashingEventsAtRate1:(unsigned int)a3
{
  self->_numberOfButtonMashingEventsAtRate1 = a3;
}

- (unsigned)longestButtonMashingEventAtRate0
{
  return self->_longestButtonMashingEventAtRate0;
}

- (void)setLongestButtonMashingEventAtRate0:(unsigned int)a3
{
  self->_longestButtonMashingEventAtRate0 = a3;
}

- (unsigned)longestButtonMashingEventAtRate1
{
  return self->_longestButtonMashingEventAtRate1;
}

- (void)setLongestButtonMashingEventAtRate1:(unsigned int)a3
{
  self->_longestButtonMashingEventAtRate1 = a3;
}

- (unsigned)timeOfFlightCameraProjectorModeMask
{
  return self->_timeOfFlightCameraProjectorModeMask;
}

- (void)setTimeOfFlightCameraProjectorModeMask:(unsigned int)a3
{
  self->_timeOfFlightCameraProjectorModeMask = a3;
}

- (unsigned)timeOfFlightCameraUsageTypeMask
{
  return self->_timeOfFlightCameraUsageTypeMask;
}

- (void)setTimeOfFlightCameraUsageTypeMask:(unsigned int)a3
{
  self->_timeOfFlightCameraUsageTypeMask = a3;
}

- (float)structuredLightIdleTemperatureFirstReading
{
  return self->_structuredLightIdleTemperatureFirstReading;
}

- (void)setStructuredLightIdleTemperatureFirstReading:(float)a3
{
  self->_structuredLightIdleTemperatureFirstReading = a3;
}

- (float)structuredLightActiveTemperatureFirstReading
{
  return self->_structuredLightActiveTemperatureFirstReading;
}

- (void)setStructuredLightActiveTemperatureFirstReading:(float)a3
{
  self->_structuredLightActiveTemperatureFirstReading = a3;
}

- (float)structuredLightActiveTemperatureLastReading
{
  return self->_structuredLightActiveTemperatureLastReading;
}

- (void)setStructuredLightActiveTemperatureLastReading:(float)a3
{
  self->_structuredLightActiveTemperatureLastReading = a3;
}

- (float)structuredLightActiveTemperatureRange
{
  return self->_structuredLightActiveTemperatureRange;
}

- (void)setStructuredLightActiveTemperatureRange:(float)a3
{
  self->_structuredLightActiveTemperatureRange = a3;
}

- (float)structuredLightActiveTemperatureAverage
{
  return self->_structuredLightActiveTemperatureAverage;
}

- (void)setStructuredLightActiveTemperatureAverage:(float)a3
{
  self->_structuredLightActiveTemperatureAverage = a3;
}

- (float)infaredSensorTemperatureRange
{
  return self->_infaredSensorTemperatureRange;
}

- (void)setInfaredSensorTemperatureRange:(float)a3
{
  self->_infaredSensorTemperatureRange = a3;
}

- (float)infaredSensorTemperatureAverage
{
  return self->_infaredSensorTemperatureAverage;
}

- (void)setInfaredSensorTemperatureAverage:(float)a3
{
  self->_infaredSensorTemperatureAverage = a3;
}

- (NSDictionary)sensorTemperatureStats
{
  return self->_sensorTemperatureStats;
}

- (void)setSensorTemperatureStats:(id)a3
{
}

- (int64_t)infraredProjectorUptimeInMsForLowPowerSparse
{
  return self->_infraredProjectorUptimeInMsForLowPowerSparse;
}

- (void)setInfraredProjectorUptimeInMsForLowPowerSparse:(int64_t)a3
{
  self->_infraredProjectorUptimeInMsForLowPowerSparse = a3;
}

- (int64_t)infraredProjectorUptimeInMsForHighPowerSparse
{
  return self->_infraredProjectorUptimeInMsForHighPowerSparse;
}

- (void)setInfraredProjectorUptimeInMsForHighPowerSparse:(int64_t)a3
{
  self->_infraredProjectorUptimeInMsForHighPowerSparse = a3;
}

- (BOOL)cinematicFramingSupported
{
  return self->_cinematicFramingSupported;
}

- (void)setCinematicFramingSupported:(BOOL)a3
{
  self->_cinematicFramingSupported = a3;
}

- (BOOL)cinematicFramingEnabled
{
  return self->_cinematicFramingEnabled;
}

- (void)setCinematicFramingEnabled:(BOOL)a3
{
  self->_cinematicFramingEnabled = a3;
}

- (unsigned)cinematicFramingControlMode
{
  return self->_cinematicFramingControlMode;
}

- (void)setCinematicFramingControlMode:(unsigned int)a3
{
  self->_cinematicFramingControlMode = a3;
}

- (unsigned)cinematicFramingTime
{
  return self->_cinematicFramingTime;
}

- (void)setCinematicFramingTime:(unsigned int)a3
{
  self->_cinematicFramingTime = a3;
}

- (BOOL)backgroundBlurSupported
{
  return self->_backgroundBlurSupported;
}

- (void)setBackgroundBlurSupported:(BOOL)a3
{
  self->_backgroundBlurSupported = a3;
}

- (BOOL)backgroundBlurEnabled
{
  return self->_backgroundBlurEnabled;
}

- (void)setBackgroundBlurEnabled:(BOOL)a3
{
  self->_backgroundBlurEnabled = a3;
}

- (unsigned)backgroundBlurTime
{
  return self->_backgroundBlurTime;
}

- (void)setBackgroundBlurTime:(unsigned int)a3
{
  self->_backgroundBlurTime = a3;
}

- (BOOL)backgroundBlurApertureChanged
{
  return self->_backgroundBlurApertureChanged;
}

- (void)setBackgroundBlurApertureChanged:(BOOL)a3
{
  self->_backgroundBlurApertureChanged = a3;
}

- (float)backgroundBlurAperture
{
  return self->_backgroundBlurAperture;
}

- (void)setBackgroundBlurAperture:(float)a3
{
  self->_backgroundBlurAperture = a3;
}

- (BOOL)studioLightingSupported
{
  return self->_studioLightingSupported;
}

- (void)setStudioLightingSupported:(BOOL)a3
{
  self->_studioLightingSupported = a3;
}

- (BOOL)studioLightingEnabled
{
  return self->_studioLightingEnabled;
}

- (void)setStudioLightingEnabled:(BOOL)a3
{
  self->_studioLightingEnabled = a3;
}

- (unsigned)studioLightingTime
{
  return self->_studioLightingTime;
}

- (void)setStudioLightingTime:(unsigned int)a3
{
  self->_studioLightingTime = a3;
}

- (BOOL)studioLightingIntensityChanged
{
  return self->_studioLightingIntensityChanged;
}

- (void)setStudioLightingIntensityChanged:(BOOL)a3
{
  self->_studioLightingIntensityChanged = a3;
}

- (float)studioLightingIntensity
{
  return self->_studioLightingIntensity;
}

- (void)setStudioLightingIntensity:(float)a3
{
  self->_studioLightingIntensity = a3;
}

- (unsigned)orientationPortraitTime
{
  return self->_orientationPortraitTime;
}

- (void)setOrientationPortraitTime:(unsigned int)a3
{
  self->_orientationPortraitTime = a3;
}

- (unsigned)orientationLandscapeTime
{
  return self->_orientationLandscapeTime;
}

- (void)setOrientationLandscapeTime:(unsigned int)a3
{
  self->_orientationLandscapeTime = a3;
}

- (unsigned)orientationFaceUpTime
{
  return self->_orientationFaceUpTime;
}

- (void)setOrientationFaceUpTime:(unsigned int)a3
{
  self->_orientationFaceUpTime = a3;
}

- (unsigned)orientationFaceDownTime
{
  return self->_orientationFaceDownTime;
}

- (void)setOrientationFaceDownTime:(unsigned int)a3
{
  self->_orientationFaceDownTime = a3;
}

- (BOOL)reactionEffectsSupported
{
  return self->_reactionEffectsSupported;
}

- (void)setReactionEffectsSupported:(BOOL)a3
{
  self->_reactionEffectsSupported = a3;
}

- (BOOL)reactionEffectsEnabled
{
  return self->_reactionEffectsEnabled;
}

- (void)setReactionEffectsEnabled:(BOOL)a3
{
  self->_reactionEffectsEnabled = a3;
}

- (BOOL)gesturesEnabled
{
  return self->_gesturesEnabled;
}

- (void)setGesturesEnabled:(BOOL)a3
{
  self->_gesturesEnabled = a3;
}

- (unsigned)reactionCount
{
  return self->_reactionCount;
}

- (void)setReactionCount:(unsigned int)a3
{
  self->_reactionCount = a3;
}

- (unsigned)reactionEffectsEnabledTime
{
  return self->_reactionEffectsEnabledTime;
}

- (void)setReactionEffectsEnabledTime:(unsigned int)a3
{
  self->_reactionEffectsEnabledTime = a3;
}

- (unsigned)gesturesEnabledTime
{
  return self->_gesturesEnabledTime;
}

- (void)setGesturesEnabledTime:(unsigned int)a3
{
  self->_gesturesEnabledTime = a3;
}

- (BOOL)backgroundReplacementSupported
{
  return self->_backgroundReplacementSupported;
}

- (void)setBackgroundReplacementSupported:(BOOL)a3
{
  self->_backgroundReplacementSupported = a3;
}

- (BOOL)backgroundReplacementEnabled
{
  return self->_backgroundReplacementEnabled;
}

- (void)setBackgroundReplacementEnabled:(BOOL)a3
{
  self->_backgroundReplacementEnabled = a3;
}

- (unsigned)backgroundReplacementTime
{
  return self->_backgroundReplacementTime;
}

- (void)setBackgroundReplacementTime:(unsigned int)a3
{
  self->_backgroundReplacementTime = a3;
}

- (BOOL)backgroundReplacementPixelBufferChanged
{
  return self->_backgroundReplacementPixelBufferChanged;
}

- (void)setBackgroundReplacementPixelBufferChanged:(BOOL)a3
{
  self->_backgroundReplacementPixelBufferChanged = a3;
}

- (BOOL)cinematicVideoEnabled
{
  return self->_cinematicVideoEnabled;
}

- (void)setCinematicVideoEnabled:(BOOL)a3
{
  self->_cinematicVideoEnabled = a3;
}

- (float)cinematicVideoAverageRenderingTime
{
  return self->_cinematicVideoAverageRenderingTime;
}

- (void)setCinematicVideoAverageRenderingTime:(float)a3
{
  self->_cinematicVideoAverageRenderingTime = a3;
}

- (float)cinematicVideoWorstCaseRenderingTime
{
  return self->_cinematicVideoWorstCaseRenderingTime;
}

- (void)setCinematicVideoWorstCaseRenderingTime:(float)a3
{
  self->_cinematicVideoWorstCaseRenderingTime = a3;
}

- (unsigned)timeOfFlightAssistedAutoFocusStreamingTimeAt0FPS
{
  return self->_timeOfFlightAssistedAutoFocusStreamingTimeAt0FPS;
}

- (void)setTimeOfFlightAssistedAutoFocusStreamingTimeAt0FPS:(unsigned int)a3
{
  self->_timeOfFlightAssistedAutoFocusStreamingTimeAt0FPS = a3;
}

- (unsigned)timeOfFlightAssistedAutoFocusStreamingTimeAt1FPS
{
  return self->_timeOfFlightAssistedAutoFocusStreamingTimeAt1FPS;
}

- (void)setTimeOfFlightAssistedAutoFocusStreamingTimeAt1FPS:(unsigned int)a3
{
  self->_timeOfFlightAssistedAutoFocusStreamingTimeAt1FPS = a3;
}

- (unsigned)timeOfFlightAssistedAutoFocusStreamingTimeAt8FPS
{
  return self->_timeOfFlightAssistedAutoFocusStreamingTimeAt8FPS;
}

- (void)setTimeOfFlightAssistedAutoFocusStreamingTimeAt8FPS:(unsigned int)a3
{
  self->_timeOfFlightAssistedAutoFocusStreamingTimeAt8FPS = a3;
}

- (unsigned)timeOfFlightAssistedAutoFocusStreamingTimeAtOtherFPS
{
  return self->_timeOfFlightAssistedAutoFocusStreamingTimeAtOtherFPS;
}

- (void)setTimeOfFlightAssistedAutoFocusStreamingTimeAtOtherFPS:(unsigned int)a3
{
  self->_timeOfFlightAssistedAutoFocusStreamingTimeAtOtherFPS = a3;
}

- (unsigned)captureDeviceType
{
  return self->_captureDeviceType;
}

- (void)setCaptureDeviceType:(unsigned int)a3
{
  self->_captureDeviceType = a3;
}

- (float)depthMaxFrameRate
{
  return self->_depthMaxFrameRate;
}

- (void)setDepthMaxFrameRate:(float)a3
{
  self->_depthMaxFrameRate = a3;
}

- (unsigned)depthFormatDimensionWidth
{
  return self->_depthFormatDimensionWidth;
}

- (void)setDepthFormatDimensionWidth:(unsigned int)a3
{
  self->_depthFormatDimensionWidth = a3;
}

- (unsigned)depthFormatDimensionHeight
{
  return self->_depthFormatDimensionHeight;
}

- (void)setDepthFormatDimensionHeight:(unsigned int)a3
{
  self->_depthFormatDimensionHeight = a3;
}

- (unsigned)depthPixelFormat
{
  return self->_depthPixelFormat;
}

- (void)setDepthPixelFormat:(unsigned int)a3
{
  self->_depthPixelFormat = a3;
}

- (BOOL)depthDataFiltered
{
  return self->_depthDataFiltered;
}

- (void)setDepthDataFiltered:(BOOL)a3
{
  self->_depthDataFiltered = a3;
}

- (BOOL)faceDrivenAEAFEnabledByDefault
{
  return self->_faceDrivenAEAFEnabledByDefault;
}

- (void)setFaceDrivenAEAFEnabledByDefault:(BOOL)a3
{
  self->_faceDrivenAEAFEnabledByDefault = a3;
}

- (unsigned)faceDrivenAFDisabledCount
{
  return self->_faceDrivenAFDisabledCount;
}

- (void)setFaceDrivenAFDisabledCount:(unsigned int)a3
{
  self->_faceDrivenAFDisabledCount = a3;
}

- (unsigned)faceDrivenAEDisabledCount
{
  return self->_faceDrivenAEDisabledCount;
}

- (void)setFaceDrivenAEDisabledCount:(unsigned int)a3
{
  self->_faceDrivenAEDisabledCount = a3;
}

- (unsigned)maxFacesDetected
{
  return self->_maxFacesDetected;
}

- (void)setMaxFacesDetected:(unsigned int)a3
{
  self->_maxFacesDetected = a3;
}

- (float)minLuxValue
{
  return self->_minLuxValue;
}

- (void)setMinLuxValue:(float)a3
{
  self->_minLuxValue = a3;
}

- (float)maxLuxValue
{
  return self->_maxLuxValue;
}

- (void)setMaxLuxValue:(float)a3
{
  self->_maxLuxValue = a3;
}

- (float)averageLuxValue
{
  return self->_averageLuxValue;
}

- (void)setAverageLuxValue:(float)a3
{
  self->_averageLuxValue = a3;
}

- (BOOL)isPhotoFormat
{
  return self->_photoFormat;
}

- (void)setPhotoFormat:(BOOL)a3
{
  self->_photoFormat = a3;
}

- (int)continuityCameraClientDeviceClass
{
  return self->_continuityCameraClientDeviceClass;
}

- (void)setContinuityCameraClientDeviceClass:(int)a3
{
  self->_int continuityCameraClientDeviceClass = a3;
}

- (unsigned)thermalThrottledTime
{
  return self->_thermalThrottledTime;
}

- (void)setThermalThrottledTime:(unsigned int)a3
{
  self->_thermalThrottledTime = a3;
}

- (unsigned)pixelFormat
{
  return self->_pixelFormat;
}

- (void)setPixelFormat:(unsigned int)a3
{
  self->_pixelFormat = a3;
}

- ($2825F4736939C4A6D3AD43837233062D)videoDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_videoDimensions;
}

- (void)setVideoDimensions:(id)a3
{
  self->_videoDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

- (BOOL)highlightRecoveryEnabled
{
  return self->_highlightRecoveryEnabled;
}

- (void)setHighlightRecoveryEnabled:(BOOL)a3
{
  self->_highlightRecoveryEnabled = a3;
}

- (float)minimumSupportedFrameRate
{
  return self->_minimumSupportedFrameRate;
}

- (void)setMinimumSupportedFrameRate:(float)a3
{
  self->_minimumSupportedFrameRate = a3;
}

- (float)maximumSupportedFrameRate
{
  return self->_maximumSupportedFrameRate;
}

- (void)setMaximumSupportedFrameRate:(float)a3
{
  self->_maximumSupportedFrameRate = a3;
}

- (float)minimumFrameRate
{
  return self->_minimumFrameRate;
}

- (void)setMinimumFrameRate:(float)a3
{
  self->_minimumFrameRate = a3;
}

- (float)maximumFrameRate
{
  return self->_maximumFrameRate;
}

- (void)setMaximumFrameRate:(float)a3
{
  self->_maximumFrameRate = a3;
}

- (float)fieldOfView
{
  return self->_fieldOfView;
}

- (void)setFieldOfView:(float)a3
{
  self->_fieldOfView = a3;
}

- (BOOL)binned
{
  return self->_binned;
}

- (void)setBinned:(BOOL)a3
{
  self->_binned = a3;
}

- (int)colorSpace
{
  return self->_colorSpace;
}

- (void)setColorSpace:(int)a3
{
  self->_colorSpace = a3;
}

- (BOOL)clientIsVOIP
{
  return self->_clientIsVOIP;
}

- (void)setClientIsVOIP:(BOOL)a3
{
  self->_clientIsVOIP = a3;
}

- (BOOL)audioMixWithOthersEnabled
{
  return self->_audioMixWithOthersEnabled;
}

- (void)setAudioMixWithOthersEnabled:(BOOL)a3
{
  self->_audioMixWithOthersEnabled = a3;
}

- (float)invalidFrameDurationBeforeFirstValidFrame
{
  return self->_invalidFrameDurationBeforeFirstValidFrame;
}

- (void)setInvalidFrameDurationBeforeFirstValidFrame:(float)a3
{
  self->_invalidFrameDurationBeforeFirstValidFrame = a3;
}

- (unsigned)invalidFrameCountAfterFirstValidFrame
{
  return self->_invalidFrameCountAfterFirstValidFrame;
}

- (void)setInvalidFrameCountAfterFirstValidFrame:(unsigned int)a3
{
  self->_invalidFrameCountAfterFirstValidFrame = a3;
}

- (unsigned)activeDeviceMask
{
  return self->_activeDeviceMask;
}

- (void)setActiveDeviceMask:(unsigned int)a3
{
  self->_activeDeviceMask = a3;
}

- (float)averageSystemPressureLevel
{
  return self->_averageSystemPressureLevel;
}

- (void)setAverageSystemPressureLevel:(float)a3
{
  self->_averageSystemPressureLevel = a3;
}

- (int)maxSystemPressureLevel
{
  return self->_maxSystemPressureLevel;
}

- (void)setMaxSystemPressureLevel:(int)a3
{
  self->_maxSystemPressureLevel = a3;
}

- (int64_t)timeToCriticalSystemPressureInMS
{
  return self->_timeToCriticalSystemPressureInMS;
}

- (void)setTimeToCriticalSystemPressureInMS:(int64_t)a3
{
  self->_timeToCriticalSystemPressureInMS = a3;
}

- (unsigned)systemPressureFactors
{
  return self->_systemPressureFactors;
}

- (void)setSystemPressureFactors:(unsigned int)a3
{
  self->_systemPressureFactors = a3;
}

@end