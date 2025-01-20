@interface AVCaptureFigVideoDevice
+ (BOOL)_cameraAccessIsEnabled;
+ (BOOL)allowsSuspendedPreferredCameras;
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (id)_cameraHistoryDispatchQueue;
+ (id)_defaultDeviceWithDeviceType:(id)a3 mediaTypes:(id)a4 position:(int64_t)a5 cameraOverrideHistoryAllowed:(BOOL)a6 cameraOverrideHistorySuspendedAllowed:(BOOL)a7 wombatsMustBeMagic:(BOOL)a8 userPreferredCameraHistorySuspendedAllowed:(BOOL)a9 invalidSpecialDeviceTypes:(id)a10;
+ (id)_devices;
+ (id)_devicesWithPriorRegisteredDevices:(id)a3;
+ (id)_newFigCaptureSources;
+ (id)_prioritizedDeviceList:(id)a3;
+ (id)_userPreferredCameraHistoryKeyForClientPreferencesDomain:(id)a3;
+ (id)_userPreferredCameraOverrideHistoryKey;
+ (id)cameraInfoForCreatorID:(id)a3 uniqueID:(id)a4 specialDeviceType:(unsigned int)a5 centerStageSupported:(BOOL)a6;
+ (id)systemPreferredCamera;
+ (id)userPreferredCamera;
+ (void)_initiateRefreshPreferredCameraProperties:(BOOL)a3;
+ (void)_insurePreferredCameraGlobal:(id *)a3 globalName:(id)a4 preferredCamera:(id)a5;
+ (void)_reconnectDevices:(id)a3;
+ (void)_refreshPreferredCameraProperties:(BOOL)a3;
+ (void)_releaseStaticResources;
+ (void)_setUpCameraHistoryOnce;
+ (void)initialize;
+ (void)setAllowsSuspendedPreferredCameras:(BOOL)a3;
+ (void)setUserPreferredCamera:(id)a3;
+ (void)setUserPreferredCamera:(id)a3 forClientPreferenceDomain:(id)a4;
+ (void)updateUserPreferredCameraOverride:(BOOL)a3 cameraInfo:(id)a4;
+ (void)updateUserPreferredCameraOverrideHistoryWithDevice:(id)a3 setOverride:(BOOL)a4;
- ($2825F4736939C4A6D3AD43837233062D)maxH264PhotoDimensions;
- ($2825F4736939C4A6D3AD43837233062D)maxH264VideoDimensions;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)activeDepthDataMinFrameDuration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)activeMaxExposureDuration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)activeMaxExposureDurationClientOverride;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)activeVideoMaxFrameDuration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)activeVideoMaxFrameDurationSetByClient;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)activeVideoMinFrameDuration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)activeVideoMinFrameDurationSetByClient;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)exposureDuration;
- ($94F468A8D4C62B317260615823C2B210)_chromaticityValuesForDeviceWhiteBalanceGains:(id)a3 atMix:(double)a4;
- ($94F468A8D4C62B317260615823C2B210)chromaticityValuesForDeviceWhiteBalanceGains:(id)a3;
- ($94F468A8D4C62B317260615823C2B210)temperatureAndTintValuesForDeviceWhiteBalanceGains:(id)a3;
- ($E2C29196C7A5C696474C6955C5A9CE06)_deviceWhiteBalanceGainsForChromaticityValues:(id)a3 temperature:(double)a4;
- ($E2C29196C7A5C696474C6955C5A9CE06)deviceWhiteBalanceGains;
- ($E2C29196C7A5C696474C6955C5A9CE06)deviceWhiteBalanceGainsForChromaticityValues:(id)a3;
- ($E2C29196C7A5C696474C6955C5A9CE06)deviceWhiteBalanceGainsForTemperatureAndTintValues:(id)a3;
- ($E2C29196C7A5C696474C6955C5A9CE06)grayWorldDeviceWhiteBalanceGains;
- (AVCaptureFigVideoDevice)init;
- (BOOL)_centerStageRectOfInterestSupportedOnDevice;
- (BOOL)_ensureWhiteBalanceCalibrationUnpacked;
- (BOOL)_hasKeyValueObserversForHighFrequencyProperty:(id)a3;
- (BOOL)_isBackgroundBlurActiveForEnabled:(BOOL)a3;
- (BOOL)_isBackgroundReplacementActiveForEnabled:(BOOL)a3;
- (BOOL)_isBravoVariant;
- (BOOL)_isCenterStageActiveForEnabled:(BOOL)a3;
- (BOOL)_isDepthDataDeliveryEnabled;
- (BOOL)_isFlashScene;
- (BOOL)_isHighDynamicRangeScene;
- (BOOL)_isStillImageStabilizationScene;
- (BOOL)_isStudioLightingActiveForEnabled:(BOOL)a3;
- (BOOL)_isWBSeedEnabled;
- (BOOL)_reactionEffectsActiveForEnabled:(BOOL)a3;
- (BOOL)_setContinuousZoomWithDepthActiveWithEnabled:(BOOL)a3 disallowed:(BOOL)a4 isActiveDepthDataFormatChangingOut:(BOOL *)a5;
- (BOOL)_updateContinuousZoomWithDepthActiveWithEnabled:(BOOL)a3 disallowed:(BOOL)a4 isActiveDepthDataFormatChangingOut:(BOOL *)a5;
- (BOOL)addCMIOExtensionPropertyValueChangeHandler:(id)a3;
- (BOOL)appliesSessionPresetMaxIntegrationTimeOverrideToActiveFormat;
- (BOOL)automaticallyAdjustsFaceDrivenAutoExposureEnabled;
- (BOOL)automaticallyAdjustsFaceDrivenAutoFocusEnabled;
- (BOOL)automaticallyAdjustsImageControlMode;
- (BOOL)automaticallyAdjustsVideoHDREnabled;
- (BOOL)cachesFigCaptureSourceConfigurationChanges;
- (BOOL)canPerformReactionEffects;
- (BOOL)eyeClosedDetectionEnabled;
- (BOOL)eyeDetectionEnabled;
- (BOOL)hasFlash;
- (BOOL)hasMediaType:(id)a3;
- (BOOL)hasTorch;
- (BOOL)hevcAllowBFramesForHighCTUCount;
- (BOOL)isActiveVideoMaxFrameDurationSet;
- (BOOL)isActiveVideoMinFrameDurationSet;
- (BOOL)isAdjustingExposure;
- (BOOL)isAdjustingFocus;
- (BOOL)isAdjustingWhiteBalance;
- (BOOL)isAttentionDetectionSupported;
- (BOOL)isAutoFocusRangeRestrictionSupported;
- (BOOL)isAutoRedEyeReductionSupported;
- (BOOL)isAutoVideoFrameRateEnabled;
- (BOOL)isBackgroundReplacementActive;
- (BOOL)isCameraIntrinsicMatrixDeliverySupported;
- (BOOL)isCenterStageActive;
- (BOOL)isCenterStageFieldOfViewRestrictedToWide;
- (BOOL)isCenterStageMetadataDeliveryEnabled;
- (BOOL)isCenterStageMetadataDeliverySupported;
- (BOOL)isCinematicVideoFocusAtPointSupported;
- (BOOL)isConnected;
- (BOOL)isConstituentPhotoCalibrationDataSupported;
- (BOOL)isContinuityCamera;
- (BOOL)isContinuousZoomWithDepthEnabled;
- (BOOL)isContinuousZoomWithDepthSupported;
- (BOOL)isDeskViewCameraModeSupported:(int64_t)a3;
- (BOOL)isDiagnosticsTestSupported:(id)a3;
- (BOOL)isDockedTrackingEnabled;
- (BOOL)isDockedTrackingSupported;
- (BOOL)isExposureModeSupported:(int64_t)a3;
- (BOOL)isExposurePointOfInterestSupported;
- (BOOL)isEyeClosedDetectionSupported;
- (BOOL)isEyeDetectionSupported;
- (BOOL)isFaceDetectionDrivenImageProcessingEnabled;
- (BOOL)isFaceDetectionSupported;
- (BOOL)isFaceDrivenAutoExposureEnabled;
- (BOOL)isFaceDrivenAutoFocusEnabled;
- (BOOL)isFlashActive;
- (BOOL)isFlashAvailable;
- (BOOL)isFlashModeSupported:(int64_t)a3;
- (BOOL)isFlashSceneDetectedForPhotoOutput;
- (BOOL)isFocusModeSupported:(int64_t)a3;
- (BOOL)isFocusPointOfInterestSupported;
- (BOOL)isFocusedAtMacro;
- (BOOL)isGazeSelectionEnabled;
- (BOOL)isGeometricDistortionCorrectionEnabled;
- (BOOL)isGeometricDistortionCorrectionSupported;
- (BOOL)isGlobalToneMappingEnabled;
- (BOOL)isHDRSceneDetectedForPhotoOutput;
- (BOOL)isHEIFSupported;
- (BOOL)isHEVCPreferred;
- (BOOL)isHEVCRelaxedAverageBitRateTargetSupported;
- (BOOL)isHEVCSupported;
- (BOOL)isHidden;
- (BOOL)isImageControlModeSupported:(int64_t)a3;
- (BOOL)isLensStabilizationSupported;
- (BOOL)isLockedForConfiguration;
- (BOOL)isLockingFocusWithCustomLensPositionSupported;
- (BOOL)isLockingWhiteBalanceWithCustomDeviceGainsSupported;
- (BOOL)isLowLightVideoCaptureEnabled;
- (BOOL)isMachineReadableCodeDetectionSupported;
- (BOOL)isManualFramingEnabled;
- (BOOL)isManualFramingSupported;
- (BOOL)isMotionCompensatedTemporalFilteringSupported;
- (BOOL)isNonDestructiveCropEnabled;
- (BOOL)isObjectDetectionSupported;
- (BOOL)isPortraitEffectActive;
- (BOOL)isPreviewQualityAdjustedPhotoFilterRenderingSupported;
- (BOOL)isProResSupported;
- (BOOL)isProxyDevice;
- (BOOL)isRampingVideoZoom;
- (BOOL)isReadyToUnhide;
- (BOOL)isResponsiveCaptureWithDepthSupported;
- (BOOL)isSISSupported;
- (BOOL)isSceneClassificationActive;
- (BOOL)isSmileDetectionSupported;
- (BOOL)isSmoothAutoFocusEnabled;
- (BOOL)isSmoothAutoFocusSupported;
- (BOOL)isSpatialOverCaptureEnabled;
- (BOOL)isStabilizationAutoSelectionCinematicExtendedEnhancedEnabled;
- (BOOL)isStillImageStabilizationScene;
- (BOOL)isStudioLightActive;
- (BOOL)isSubjectAreaChangeMonitoringEnabled;
- (BOOL)isSuspended;
- (BOOL)isTimeOfFlightProjectorModeSupported:(int64_t)a3;
- (BOOL)isTorchActive;
- (BOOL)isTorchAvailable;
- (BOOL)isTorchModeSupported:(int64_t)a3;
- (BOOL)isVariableFrameRateVideoCaptureEnabled;
- (BOOL)isVideoHDREnabled;
- (BOOL)isVideoHDRSuspended;
- (BOOL)isVideoStabilizationSupported;
- (BOOL)isVideoZoomSmoothingSupported;
- (BOOL)isWhiteBalanceModeSupported:(int64_t)a3;
- (BOOL)isWideColorSupported;
- (BOOL)lockForConfiguration:(id *)a3;
- (BOOL)providesStortorgetMetadata;
- (BOOL)setTorchModeOnWithLevel:(float)a3 error:(id *)a4;
- (BOOL)setValue:(id)a3 forCMIOExtensionProperty:(id)a4 error:(id *)a5;
- (BOOL)smileDetectionEnabled;
- (BOOL)supportsAVCaptureSessionPreset:(id)a3;
- (BOOL)supportsMultiCamCaptureWithDevice:(id)a3;
- (BOOL)ultraHighResolutionZeroShutterLagEnabled;
- (BOOL)usesQuantizationScalingMatrix_H264_Steep_16_48;
- (BOOL)wideAngleCameraSourcesFromUltraWide;
- (CGPoint)exposurePointOfInterest;
- (CGPoint)focusPointOfInterest;
- (CGRect)centerStageRectOfInterest;
- (CGRect)faceRectangle;
- (CGSize)normalizedNonDestructiveCropSize;
- (OpaqueCMClock)deviceClock;
- (OpaqueFigCaptureSource)figCaptureSource;
- (double)_predictedTempForGains:(id)a3;
- (double)_whiteBalanceMixingFactorForTemperature:(double)a3;
- (double)_whiteBalanceTemperatureForMixingFactor:(double)a3;
- (double)displayVideoZoomFactorMultiplier;
- (double)dualCameraSwitchOverVideoZoomFactor;
- (double)manualFramingDefaultZoomFactor;
- (double)manualFramingMaxZoomFactor;
- (double)manualFramingMinZoomFactor;
- (double)maxAvailableVideoZoomFactor;
- (double)maxAvailableVideoZoomFactorOverride;
- (double)minAvailableVideoZoomFactor;
- (double)videoZoomFactor;
- (float)ISO;
- (float)ISODigitalThreshold;
- (float)documentSceneConfidence;
- (float)exposureTargetBias;
- (float)exposureTargetOffset;
- (float)focalLength;
- (float)lensAperture;
- (float)lensPosition;
- (float)manualFramingPanningAngleX;
- (float)manualFramingPanningAngleY;
- (float)maxExposureTargetBias;
- (float)maxWhiteBalanceGain;
- (float)minExposureTargetBias;
- (float)timeLapseCaptureRate;
- (float)torchLevel;
- (float)videoZoomRampAcceleration;
- (id)AVVideoSettingsForSessionPreset:(id)a3;
- (id)_cameraInfo;
- (id)_copyFigCaptureSourceProperty:(__CFString *)a3;
- (id)_copyFormatsArray;
- (id)_digitalFlashExposureTimes;
- (id)_faceDetectionConfigurationDictionary;
- (id)_getFigCaptureSourceProperty:(__CFString *)a3;
- (id)_initWithFigCaptureSource:(OpaqueFigCaptureSource *)a3 isProxy:(BOOL)a4;
- (id)_recommendedFrameRateRangeForVideoFormat:(id)a3 depthFormat:(id)a4 figSystemPressureLevel:(int)a5;
- (id)_supportedOptionalFaceDetectionFeaturesDictionary;
- (id)activeDepthDataFormat;
- (id)activeFormat;
- (id)activePrimaryConstituentDevice;
- (id)availableBoxedMetadataFormatDescriptions;
- (id)bravoCameraSelectionBehavior;
- (id)cameraPoseMatrix;
- (id)companionDeskViewCamera;
- (id)constituentDeviceWithDeviceType:(id)a3;
- (id)continuityDeviceUniqueID;
- (id)copyValueForCMIOExtensionProperty:(id)a3 error:(id *)a4;
- (id)deviceFormatForSessionPreset:(id)a3 sourceVideoFormat:(unsigned int)a4;
- (id)deviceType;
- (id)digitalFlashSceneForPhotoOutput;
- (id)fallbackPrimaryConstituentDevices;
- (id)fallbackPrimaryConstituentDevicesAsDeviceTypes;
- (id)formats;
- (id)hardwareUniformType;
- (id)initProxyDeviceWithUniqueID:(id)a3 targetClientAuditToken:(id *)a4;
- (id)localizedName;
- (id)manufacturer;
- (id)modelID;
- (id)preferredPrimaryConstituentDevice;
- (id)runDiagnosticsWithTestType:(id)a3;
- (id)serializedProcessingSettings;
- (id)spatialCaptureDiscomfortReasons;
- (id)supportedFallbackPrimaryConstituentDevices;
- (id)supportedMetadataObjectIdentifiers;
- (id)supportedVisionDataProperties;
- (id)systemPressureState;
- (id)uniqueID;
- (id)virtualDeviceSwitchOverVideoZoomFactors;
- (int)_orderInDevicesArray;
- (int)_setActiveVideoMaxFrameDurationInternal:(id *)a3;
- (int)_setActiveVideoMinFrameDurationInternal:(id *)a3;
- (int)_setExposureWithMode:(int64_t)a3 duration:(id *)a4 ISO:(float)a5 requestID:(int)a6 newMaxFrameDuration:(id *)a7;
- (int)_setFaceDetectionFeatureEnabled:(BOOL)a3 enabledState:(BOOL *)a4;
- (int)_setFallbackPrimaryConstituentDevices:(id)a3;
- (int)_setFigCaptureSourcePixelBufferProperty:(__CFString *)a3 withValue:(__CVBuffer *)a4;
- (int)_setFigCaptureSourceProperty:(__CFString *)a3 withValue:(id)a4;
- (int)_setFigCaptureSourceProperty:(__CFString *)a3 withValue:(id)a4 cacheOnly:(BOOL)a5;
- (int)_setFocusWithMode:(int64_t)a3 lensPosition:(float)a4 requestID:(int)a5;
- (int)_setTorchMode:(int64_t)a3 withLevel:(float)a4;
- (int)_setWhiteBalanceWithMode:(int64_t)a3 gains:(id)a4 requestID:(int)a5;
- (int)faceDrivenAEAFMode;
- (int)faceRectangleAngle;
- (int)figCaptureSourceDeviceType;
- (int)figCaptureSourcePosition;
- (int)hevcTurboModeVersion;
- (int)minMacroblocksForHighProfileAbove30fps;
- (int)minMacroblocksForHighProfileUpTo30fps;
- (int)powerConsumptionAt30FPSForOISMode:(int)a3;
- (int64_t)_digitalFlashStatus;
- (int64_t)activeColorSpace;
- (int64_t)activePrimaryConstituentDeviceSwitchingBehavior;
- (int64_t)autoFocusRangeRestriction;
- (int64_t)deskViewCameraMode;
- (int64_t)digitalFlashMode;
- (int64_t)exposureMode;
- (int64_t)flashMode;
- (int64_t)focusMode;
- (int64_t)imageControlMode;
- (int64_t)minimumFocusDistance;
- (int64_t)nonDestructiveCropAspectRatio;
- (int64_t)position;
- (int64_t)primaryConstituentDeviceSwitchingBehavior;
- (int64_t)shallowDepthOfFieldEffectStatus;
- (int64_t)timeOfFlightBankCount;
- (int64_t)timeOfFlightProjectorMode;
- (int64_t)torchMode;
- (int64_t)videoStabilizationStrength;
- (int64_t)whiteBalanceMode;
- (unint64_t)_wbTemperatureIterations;
- (unint64_t)activePrimaryConstituentDeviceRestrictedSwitchingBehaviorConditions;
- (unint64_t)degradedCaptureQualityFactors;
- (unint64_t)primaryConstituentDeviceRestrictedSwitchingBehaviorConditions;
- (unint64_t)stereoVideoCaptureStatus;
- (unsigned)specialDeviceType;
- (void)_checkTCCAccess;
- (void)_computeMinVideoZoomFactorOut:(double *)a3 maxVideoZoomFactorOut:(double *)a4 defaultVideoZoomFactorOut:(double *)a5 centerStageActiveOverride:(BOOL)a6 resetZoomFactor:(BOOL)a7;
- (void)_decrementObserverCountForHighFrequencyProperty:(id)a3;
- (void)_drainManualControlRequestQueue:(id)a3;
- (void)_drainManualControlRequestQueues;
- (void)_handleCMIOExtensionPropertyChangeNotification:(id)a3;
- (void)_handleManualControlCompletionForRequestQueue:(id)a3 withPayload:(id)a4;
- (void)_handleNotification:(__CFString *)a3 payload:(id)a4;
- (void)_incrementObserverCountForHighFrequencyProperty:(id)a3;
- (void)_initDegradedCaptureQualityFactors;
- (void)_initializeContinuousZoomWithDepthActiveWithEnabled:(BOOL)a3;
- (void)_performBlockOnMainThread:(id)a3;
- (void)_performReaction:(id)a3;
- (void)_populateSupportedFallbackPrimaryConstituentDevices;
- (void)_rampToVideoZoomFactor:(double)a3 withRate:(float)a4 duration:(double)a5 rampType:(int)a6 rampTuning:(int)a7;
- (void)_reconnectToFigCaptureSource:(OpaqueFigCaptureSource *)a3;
- (void)_resetDefaultVideoZoomFactor;
- (void)_resetVideoHDRSuspended;
- (void)_restoreFigCaptureSourceProperties;
- (void)_setActiveFormat:(id)a3 resetVideoZoomFactorAndMinMaxFrameDurations:(BOOL)a4 sessionPreset:(id)a5;
- (void)_setActivePrimaryConstituentDeviceSwitchingBehavior:(int64_t)a3 restrictedSwitchingBehaviorConditions:(unint64_t)a4;
- (void)_setActiveVideoMaxFrameDuration:(id *)a3;
- (void)_setActiveVideoMinFrameDuration:(id *)a3;
- (void)_setAdjustingExposure:(BOOL)a3;
- (void)_setAdjustingFocus:(BOOL)a3;
- (void)_setAdjustingWhiteBalance:(BOOL)a3;
- (void)_setBackgroundBlurAllowed:(BOOL)a3;
- (void)_setBackgroundReplacementAllowed:(BOOL)a3;
- (void)_setCameraCalibrationDataDeliveryEnabled:(BOOL)a3;
- (void)_setCenterStageAllowed:(BOOL)a3;
- (void)_setCenterStageFramingMode:(int64_t)a3;
- (void)_setCinematicVideoEnabled:(BOOL)a3;
- (void)_setConnected:(BOOL)a3;
- (void)_setConstantColorEnabled:(BOOL)a3;
- (void)_setContinuousZoomWithDepthDisallowed:(BOOL)a3;
- (void)_setDepthDataDeliveryEnabled:(BOOL)a3;
- (void)_setDigitalFlashModeInternal:(int64_t)a3;
- (void)_setDigitalFlashSceneForPhotoOutput:(id)a3;
- (void)_setFigCaptureSource:(OpaqueFigCaptureSource *)a3 allowSendingWorkToMainThread:(BOOL)a4;
- (void)_setFlashActive:(BOOL)a3;
- (void)_setFlashAvailable:(BOOL)a3;
- (void)_setFlashSceneDetectedForPhotoOutput:(BOOL)a3;
- (void)_setGlobalToneMappingEnabledInternal:(BOOL)a3;
- (void)_setHDRSceneDetectedForPhotoOutput:(BOOL)a3;
- (void)_setImageControlMode:(int64_t)a3;
- (void)_setIsStillImageStabilizationScene:(BOOL)a3;
- (void)_setMaxAvailableVideoZoomFactor:(double)a3;
- (void)_setMinAvailableVideoZoomFactor:(double)a3;
- (void)_setPhotoSettingsForSceneMonitoring:(id)a3;
- (void)_setReactionEffectsAllowed:(BOOL)a3;
- (void)_setShallowDepthOfFieldEffectStatus:(int64_t)a3;
- (void)_setStillImageStabilizationAutomaticallyEnabled:(BOOL)a3;
- (void)_setStudioLightingAllowed:(BOOL)a3;
- (void)_setTorchActive:(BOOL)a3;
- (void)_setTorchAvailable:(BOOL)a3;
- (void)_setTorchLevel:(float)a3;
- (void)_setVideoHDREnabled:(BOOL)a3 forceResetVideoHDRSuspended:(BOOL)a4;
- (void)_setVideoZoomFactor:(double)a3;
- (void)_setWBSeedEnabled:(BOOL)a3;
- (void)_updateActiveDepthDataFormatForContinuousZoomWithDepth;
- (void)_updateBackgroundBlurActiveForEnabled:(BOOL)a3;
- (void)_updateBackgroundBlurAperture:(float)a3;
- (void)_updateBackgroundReplacementActiveForEnabled:(BOOL)a3;
- (void)_updateBackgroundReplacementPixelBuffer:(__CVBuffer *)a3;
- (void)_updateCenterStageActiveForEnabled:(BOOL)a3 updateDependentProperties:(BOOL)a4;
- (void)_updateFallbackPrimaryConstituentDevicesForDepthDataDeliveryEnabled:(BOOL)a3;
- (void)_updateFigCaptureSourceObserverCounts;
- (void)_updateGesturesEnabled:(BOOL)a3;
- (void)_updateMinMaxDefaultVideoZoomFactors;
- (void)_updateMinMaxVideoZoomFactorsWithMinZoomFactorFromCameraSelection:(double)a3;
- (void)_updatePortraitEffectStudioLightQuality:(int64_t)a3;
- (void)_updateReactionEffectsActiveForEnabled:(BOOL)a3;
- (void)_updateSpatialCaptureStatus:(unint64_t)a3;
- (void)_updateStudioLightingActiveForEnabled:(BOOL)a3;
- (void)_updateStudioLightingIntensity:(float)a3;
- (void)addObserver:(id)a3 forKeyPath:(id)a4 options:(unint64_t)a5 context:(void *)a6;
- (void)cancelVideoZoomRamp;
- (void)dealloc;
- (void)enumerateCMIOExtensionPropertiesWithBlock:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)panWithTranslation:(CGPoint)a3;
- (void)performOneShotFraming;
- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4;
- (void)rampExponentiallyToVideoZoomFactor:(float)a3 withDuration:(double)a4;
- (void)rampToVideoZoomFactor:(double)a3 withRate:(float)a4;
- (void)rampToVideoZoomFactor:(float)a3 withTuning:(int64_t)a4;
- (void)removeCMIOExtensionPropertyValueChangeHandler:(id)a3;
- (void)removeObserver:(id)a3 forKeyPath:(id)a4;
- (void)removeObserver:(id)a3 forKeyPath:(id)a4 context:(void *)a5;
- (void)resetFraming;
- (void)resetVideoMinFrameDurationOverrideForOwner:(id)a3;
- (void)setActiveColorSpace:(int64_t)a3;
- (void)setActiveDepthDataFormat:(id)a3;
- (void)setActiveDepthDataMinFrameDuration:(id *)a3;
- (void)setActiveFormat:(id)a3;
- (void)setActiveMaxExposureDuration:(id *)a3;
- (void)setActiveVideoMaxFrameDuration:(id *)a3;
- (void)setActiveVideoMinFrameDuration:(id *)a3;
- (void)setAutoFocusRangeRestriction:(int64_t)a3;
- (void)setAutoVideoFrameRateEnabled:(BOOL)a3;
- (void)setAutomaticallyAdjustsFaceDrivenAutoExposureEnabled:(BOOL)a3;
- (void)setAutomaticallyAdjustsFaceDrivenAutoFocusEnabled:(BOOL)a3;
- (void)setAutomaticallyAdjustsImageControlMode:(BOOL)a3;
- (void)setAutomaticallyAdjustsVideoHDREnabled:(BOOL)a3;
- (void)setCachesFigCaptureSourceConfigurationChanges:(BOOL)a3;
- (void)setCenterStageFieldOfViewRestrictedToWide:(BOOL)a3;
- (void)setCenterStageMetadataDeliveryEnabled:(BOOL)a3;
- (void)setCenterStageRectOfInterest:(CGRect)a3;
- (void)setCinematicVideoFocusAtPoint:(CGPoint)a3 objectID:(int64_t)a4 isHardFocus:(BOOL)a5 isFixedPlaneFocus:(BOOL)a6;
- (void)setContinuousZoomWithDepthEnabled:(BOOL)a3;
- (void)setDeskViewCameraMode:(int64_t)a3;
- (void)setDigitalFlashMode:(int64_t)a3;
- (void)setDockedTrackingEnabled:(BOOL)a3;
- (void)setExposureMode:(int64_t)a3;
- (void)setExposureModeCustomWithDuration:(id *)a3 ISO:(float)a4 completionHandler:(id)a5;
- (void)setExposurePointOfInterest:(CGPoint)a3;
- (void)setExposureTargetBias:(float)a3 completionHandler:(id)a4;
- (void)setEyeClosedDetectionEnabled:(BOOL)a3;
- (void)setEyeDetectionEnabled:(BOOL)a3;
- (void)setFaceDetectionDrivenImageProcessingEnabled:(BOOL)a3;
- (void)setFaceDrivenAutoExposureEnabled:(BOOL)a3;
- (void)setFaceDrivenAutoFocusEnabled:(BOOL)a3;
- (void)setFallbackPrimaryConstituentDevices:(id)a3;
- (void)setFlashMode:(int64_t)a3;
- (void)setFocusMode:(int64_t)a3;
- (void)setFocusModeLockedWithLensPosition:(float)a3 completionHandler:(id)a4;
- (void)setFocusPointOfInterest:(CGPoint)a3;
- (void)setGazeSelectionEnabled:(BOOL)a3;
- (void)setGeometricDistortionCorrectionEnabled:(BOOL)a3;
- (void)setGlobalToneMappingEnabled:(BOOL)a3;
- (void)setImageControlMode:(int64_t)a3;
- (void)setLowLightVideoCaptureEnabled:(BOOL)a3;
- (void)setManualFramingEnabled:(BOOL)a3;
- (void)setManualFramingPanningAngleX:(float)a3;
- (void)setManualFramingPanningAngleY:(float)a3;
- (void)setMaxAvailableVideoZoomFactorOverride:(double)a3;
- (void)setNonDestructiveCropAspectRatio:(int64_t)a3;
- (void)setNonDestructiveCropEnabled:(BOOL)a3;
- (void)setPrimaryConstituentDeviceSwitchingBehavior:(int64_t)a3 restrictedSwitchingBehaviorConditions:(unint64_t)a4;
- (void)setProvidesStortorgetMetadata:(BOOL)a3;
- (void)setSmileDetectionEnabled:(BOOL)a3;
- (void)setSmoothAutoFocusEnabled:(BOOL)a3;
- (void)setSpatialOverCaptureEnabled:(BOOL)a3;
- (void)setSubjectAreaChangeMonitoringEnabled:(BOOL)a3;
- (void)setTimeLapseCaptureRate:(float)a3;
- (void)setTimeOfFlightProjectorMode:(int64_t)a3;
- (void)setTorchMode:(int64_t)a3;
- (void)setUltraHighResolutionZeroShutterLagEnabled:(BOOL)a3;
- (void)setVariableFrameRateVideoCaptureEnabled:(BOOL)a3;
- (void)setVideoHDREnabled:(BOOL)a3;
- (void)setVideoHDRSuspended:(BOOL)a3;
- (void)setVideoMinFrameDurationOverride:(id *)a3 forOwner:(id)a4;
- (void)setVideoStabilizationStrength:(int64_t)a3;
- (void)setVideoZoomFactor:(double)a3;
- (void)setVideoZoomRampAcceleration:(float)a3;
- (void)setWhiteBalanceMode:(int64_t)a3;
- (void)setWhiteBalanceModeLockedWithDeviceWhiteBalanceGains:(id)a3 completionHandler:(id)a4;
- (void)startPanningAtPoint:(CGPoint)a3;
- (void)unhide;
- (void)unlockForConfiguration;
- (void)updateStreamingDeviceHistory;
- (void)updateUserPreferredCameraHistory;
- (void)updateUserPreferredCameraHistoryForKey:(id)a3;
- (void)updateUserPreferredCameraOverride:(BOOL)a3;
- (void)updateVideoZoomFactorForSpatialVideoEnabled:(BOOL)a3;
@end

@implementation AVCaptureFigVideoDevice

uint64_t __38__AVCaptureFigVideoDevice_isConnected__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 793);
  return result;
}

id __39__AVCaptureFigVideoDevice_activeFormat__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(a1 + 32) + 144);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

void *__75__AVCaptureFigVideoDevice__incrementObserverCountForHighFrequencyProperty___block_invoke(uint64_t a1)
{
  id result = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1104), "objectForKeyedSubscript:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1112), "objectForKeyedSubscript:", *(void *)(a1 + 40)));
  if (result)
  {
    int v3 = [result intValue];
    id result = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1104), "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", (v3 + 1)), objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1112), "objectForKeyedSubscript:", *(void *)(a1 + 40)));
    if (!v3)
    {
      long long v4 = *(_OWORD *)(a1 + 32);
      v5 = *(NSObject **)(*(void *)(a1 + 32) + 72);
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __75__AVCaptureFigVideoDevice__incrementObserverCountForHighFrequencyProperty___block_invoke_2;
      v6[3] = &unk_1E5A72D70;
      long long v7 = v4;
      dispatch_sync(v5, v6);
      return (void *)[*(id *)(a1 + 32) _updateFigCaptureSourceObserverCounts];
    }
  }
  return result;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  if (([a3 isEqualToString:@"videoZoomFactor"] & 1) != 0
    || ([a3 isEqualToString:@"activeVideoMinFrameDuration"] & 1) != 0
    || ([a3 isEqualToString:@"activeVideoMaxFrameDuration"] & 1) != 0
    || ([a3 isEqualToString:@"minAvailableVideoZoomFactor"] & 1) != 0
    || ([a3 isEqualToString:@"maxAvailableVideoZoomFactor"] & 1) != 0
    || ([a3 isEqualToString:@"activeFormat"] & 1) != 0)
  {
    return 0;
  }
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___AVCaptureFigVideoDevice;
  return objc_msgSendSuper2(&v6, sel_automaticallyNotifiesObserversForKey_, a3);
}

- (BOOL)supportsAVCaptureSessionPreset:(id)a3
{
  if ([a3 isEqual:@"AVCaptureSessionPresetInputPriority"])
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    NSUInteger v5 = [(NSArray *)self->_formats count];
    if (v5)
    {
      uint64_t v6 = 0;
      NSUInteger v7 = v5 - 1;
      do
      {
        LOBYTE(v5) = objc_msgSend((id)objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_formats, "objectAtIndexedSubscript:", v6), "AVCaptureSessionPresets"), "containsObject:", a3);
        if (v5) {
          break;
        }
      }
      while (v7 != v6++);
    }
  }
  return v5;
}

- (id)deviceFormatForSessionPreset:(id)a3 sourceVideoFormat:(unsigned int)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ([a3 isEqualToString:@"AVCaptureSessionPresetInputPriority"]) {
    return self->_activeFormat;
  }
  v8 = [(AVCaptureFigVideoDevice *)self deviceType];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  formats = self->_formats;
  uint64_t v10 = [(NSArray *)formats countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (!v10) {
    return 0;
  }
  uint64_t v11 = v10;
  v12 = 0;
  uint64_t v13 = *(void *)v18;
  do
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v18 != v13) {
        objc_enumerationMutation(formats);
      }
      NSUInteger v7 = *(void **)(*((void *)&v17 + 1) + 8 * i);
      if (objc_msgSend((id)objc_msgSend(v7, "AVCaptureSessionPresets"), "containsObject:", a3))
      {
        if (CMFormatDescriptionGetMediaSubType((CMFormatDescriptionRef)[v7 formatDescription]) == a4) {
          return v7;
        }
        if (v12) {
          BOOL v15 = 0;
        }
        else {
          BOOL v15 = v8 == @"AVCaptureDeviceTypeExternal";
        }
        if (v15) {
          v12 = v7;
        }
      }
    }
    uint64_t v11 = [(NSArray *)formats countByEnumeratingWithState:&v17 objects:v21 count:16];
    NSUInteger v7 = v12;
  }
  while (v11);
  return v7;
}

- (id)_initWithFigCaptureSource:(OpaqueFigCaptureSource *)a3 isProxy:(BOOL)a4
{
  BOOL v4 = a4;
  v95[7] = *MEMORY[0x1E4F143B8];
  v86.receiver = self;
  v86.super_class = (Class)AVCaptureFigVideoDevice;
  uint64_t v6 = [(AVCaptureDevice *)&v86 initSubclass];
  if (!v6) {
    return v6;
  }
  BOOL v68 = v4;
  *((void *)v6 + 129) = [objc_alloc(MEMORY[0x1E4F47DF0]) initWithReferencedObject:v6];
  *((void *)v6 + 6) = dispatch_queue_create("com.apple.avfoundation.videocapturedevice.source_queue", 0);
  NSUInteger v7 = dispatch_queue_create("com.apple.avfoundation.videocapturedevice.state_queue", 0);
  *((void *)v6 + 9) = v7;
  dispatch_suspend(v7);
  *((void *)v6 + 140) = dispatch_semaphore_create(0);
  [v6 _setFigCaptureSource:a3 allowSendingWorkToMainThread:1];
  v8 = (void *)[v6 _copyFigCaptureSourceProperty:*MEMORY[0x1E4F51F20]];
  *((void *)v6 + 8) = v8;
  *((void *)v6 + 10) = (id)[v8 objectForKeyedSubscript:*MEMORY[0x1E4F51C80]];
  *((void *)v6 + 13) = @"com.apple";
  *((_DWORD *)v6 + 28) = 0;
  *((void *)v6 + 15) = 0;
  uint64_t v9 = *MEMORY[0x1E4F51B60];
  if (objc_msgSend((id)objc_msgSend(*((id *)v6 + 8), "objectForKeyedSubscript:", *MEMORY[0x1E4F51B60]), "intValue") == 16)
  {
    int v10 = 2;
  }
  else
  {
    if (objc_msgSend((id)objc_msgSend(*((id *)v6 + 8), "objectForKeyedSubscript:", v9), "intValue") != 15)
    {
      *((_DWORD *)v6 + 25) = 0;
      goto LABEL_8;
    }
    int v10 = 3;
  }
  *((_DWORD *)v6 + 25) = v10;
LABEL_8:
  v67 = (__CFString *)[v6 deviceType];
  if ([(__CFString *)v67 isEqualToString:@"AVCaptureDeviceTypeExternal"]) {
    uint64_t v11 = 0;
  }
  else {
    uint64_t v11 = (int)objc_msgSend((id)objc_msgSend(*((id *)v6 + 8), "objectForKeyedSubscript:", *MEMORY[0x1E4F51C20]), "intValue");
  }
  *((void *)v6 + 11) = v11;
  if (objc_msgSend((id)objc_msgSend(*((id *)v6 + 8), "objectForKeyedSubscript:", *MEMORY[0x1E4F51B98]), "BOOLValue"))uint64_t v12 = 2; {
  else
  }
    uint64_t v12 = 0;
  *((void *)v6 + 42) = v12;
  __asm { FMOV            V0.2D, #0.5 }
  long long v70 = _Q0;
  *(_OWORD *)(v6 + 344) = _Q0;
  *((_DWORD *)v6 + 90) = -1082130432;
  *((void *)v6 + 46) = 0;
  v6[376] = 0;
  v6[377] = [v6 isFocusModeSupported:2];
  v6[378] = 0;
  v6[379] = 0;
  long long v18 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
  *((_OWORD *)v6 + 24) = *MEMORY[0x1E4F1DB20];
  *((_OWORD *)v6 + 25) = v18;
  v6[416] = 0;
  if (objc_msgSend((id)objc_msgSend(*((id *)v6 + 8), "objectForKeyedSubscript:", *MEMORY[0x1E4F51B70]), "BOOLValue"))uint64_t v19 = 2; {
  else
  }
    uint64_t v19 = 0;
  *((void *)v6 + 53) = v19;
  *((void *)v6 + 56) = 0;
  *((_OWORD *)v6 + 27) = xmmword_1A1636A40;
  *((_DWORD *)v6 + 114) = -1082130432;
  *((_DWORD *)v6 + 115) = 0;
  *((_DWORD *)v6 + 116) = 2139095039;
  *(_OWORD *)(v6 + 472) = v70;
  v6[488] = [v6 isExposureModeSupported:2];
  if (objc_msgSend((id)objc_msgSend(*((id *)v6 + 8), "objectForKeyedSubscript:", *MEMORY[0x1E4F51CB8]), "BOOLValue"))uint64_t v20 = 2; {
  else
  }
    uint64_t v20 = 0;
  *((void *)v6 + 68) = v20;
  *((void *)v6 + 69) = 0xBF800000BF800000;
  *((_DWORD *)v6 + 140) = -1082130432;
  *(void *)(v6 + 564) = 0xBF800000BF800000;
  *((_DWORD *)v6 + 143) = -1082130432;
  *((void *)v6 + 77) = 0xBFF0000000000000;
  v6[624] = 1;
  v6[657] = 1;
  *((void *)v6 + 83) = objc_alloc_init(AVCaptureDeviceControlRequestQueue);
  *((void *)v6 + 84) = objc_alloc_init(AVCaptureDeviceControlRequestQueue);
  *((void *)v6 + 85) = objc_alloc_init(AVCaptureDeviceControlRequestQueue);
  *((void *)v6 + 86) = objc_alloc_init(AVCaptureDeviceControlRequestQueue);
  *((void *)v6 + 92) = 0;
  v6[746] = 0;
  v6[768] = [v6 hasFlash];
  *((void *)v6 + 97) = 0;
  v6[784] = 0;
  *((_DWORD *)v6 + 197) = 0;
  v6[792] = [v6 hasTorch];
  v6[797] = 0;
  v6[793] = +[AVCaptureFigVideoDevice _cameraAccessIsEnabled];
  v6[794] = 0;
  long long v21 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  *(_OWORD *)(v6 + 808) = *MEMORY[0x1E4F1DB28];
  *(_OWORD *)(v6 + 824) = v21;
  *((_DWORD *)v6 + 210) = 0;
  *((_DWORD *)v6 + 216) = 1065353216;
  *((_DWORD *)v6 + 217) = 0;
  *((_DWORD *)v6 + 218) = 0;
  *((_DWORD *)v6 + 219) = 1097859072;
  *((void *)v6 + 110) = 0x3FF0000000000000;
  if (!AVGestaltGetBoolAnswer(@"AVGQCaptureFaceDrivenAEAFOnByDefault")) {
    goto LABEL_24;
  }
  if (v6[377])
  {
    if (v6[488]) {
      int v22 = 3;
    }
    else {
      int v22 = 2;
    }
    goto LABEL_28;
  }
  if (!v6[488])
  {
LABEL_24:
    *((_DWORD *)v6 + 200) = 0;
    goto LABEL_29;
  }
  int v22 = 1;
LABEL_28:
  *((_DWORD *)v6 + 200) = v22;
LABEL_29:
  *((void *)v6 + 116) = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
  *((void *)v6 + 117) = 1;
  *((void *)v6 + 91) = 0;
  if ([v6 _isBravoVariant])
  {
    *((void *)v6 + 122) = 1;
    *((void *)v6 + 123) = 0;
    *((void *)v6 + 124) = 1;
    *((void *)v6 + 125) = 0;
  }
  v6[844] = 1;
  *((void *)v6 + 141) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v23 = *MEMORY[0x1E4F52038];
  v94[0] = @"lensPosition";
  v94[1] = @"exposureDuration";
  uint64_t v24 = *MEMORY[0x1E4F51FF0];
  v95[0] = v23;
  v95[1] = v24;
  uint64_t v25 = *MEMORY[0x1E4F52070];
  v94[2] = @"ISO";
  v94[3] = @"exposureTargetOffset";
  uint64_t v26 = *MEMORY[0x1E4F52010];
  v95[2] = v25;
  v95[3] = v26;
  uint64_t v27 = *MEMORY[0x1E4F51FC0];
  v94[4] = @"deviceWhiteBalanceGains";
  v94[5] = @"grayWorldDeviceWhiteBalanceGains";
  uint64_t v28 = *MEMORY[0x1E4F52060];
  v95[4] = v27;
  v95[5] = v28;
  v94[6] = @"documentSceneConfidence";
  v95[6] = *MEMORY[0x1E4F520E8];
  v29 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v95, v94, 7), "mutableCopy");
  *((void *)v6 + 139) = v29;
  v92[0] = [v29 objectForKeyedSubscript:@"lensPosition"];
  v93[0] = &unk_1EF4FA700;
  v92[1] = [*((id *)v6 + 139) objectForKeyedSubscript:@"exposureDuration"];
  v93[1] = &unk_1EF4FA700;
  v92[2] = [*((id *)v6 + 139) objectForKeyedSubscript:@"ISO"];
  v93[2] = &unk_1EF4FA700;
  v92[3] = [*((id *)v6 + 139) objectForKeyedSubscript:@"exposureTargetOffset"];
  v93[3] = &unk_1EF4FA700;
  v92[4] = [*((id *)v6 + 139) objectForKeyedSubscript:@"deviceWhiteBalanceGains"];
  v93[4] = &unk_1EF4FA700;
  v92[5] = [*((id *)v6 + 139) objectForKeyedSubscript:@"grayWorldDeviceWhiteBalanceGains"];
  v93[5] = &unk_1EF4FA700;
  v92[6] = [*((id *)v6 + 139) objectForKeyedSubscript:@"documentSceneConfidence"];
  v93[6] = &unk_1EF4FA700;
  *((void *)v6 + 138) = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v93, v92, 7), "mutableCopy");
  *((void *)v6 + 137) = dispatch_queue_create("com.apple.avfoundation.videocapturedevice.observed_properties_queue", 0);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F74230], "sharedConnection"), "registerObserver:", v6);
  v30 = (void *)[v6 _copyFormatsArray];
  *((void *)v6 + 17) = v30;
  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  obuint64_t j = v30;
  uint64_t v31 = [v30 countByEnumeratingWithState:&v82 objects:v91 count:16];
  v32 = &OBJC_IVAR___AVCaptureFigVideoDevice__isSuspended;
  if (v31)
  {
    uint64_t v33 = v31;
    uint64_t v71 = *(void *)v83;
    do
    {
      for (uint64_t i = 0; i != v33; ++i)
      {
        if (*(void *)v83 != v71) {
          objc_enumerationMutation(obj);
        }
        v35 = *(void **)(*((void *)&v82 + 1) + 8 * i);
        if (!*((void *)v6 + 18)
          && [*(id *)(*((void *)&v82 + 1) + 8 * i) isDefaultActiveFormat])
        {
          *((void *)v6 + 18) = v35;
          v36 = v6 + 232;
          if (v35)
          {
            [v35 defaultActiveMinFrameDurationForSessionPreset:0];
            long long v37 = v80;
            *((void *)v6 + 31) = v81;
            _OWORD *v36 = v37;
            [v35 defaultActiveMaxFrameDurationForSessionPreset:0];
          }
          else
          {
            *(void *)v36 = 0;
            *((void *)v6 + 30) = 0;
            *((void *)v6 + 31) = 0;
            long long v80 = 0uLL;
            uint64_t v81 = 0;
          }
          long long v38 = v80;
          *((void *)v6 + 37) = v81;
          *(_OWORD *)(v6 + 280) = v38;
          [v35 videoMaxZoomFactor];
          *((void *)v6 + 111) = v39;
          long long v78 = 0u;
          long long v79 = 0u;
          long long v76 = 0u;
          long long v77 = 0u;
          v40 = (void *)[*((id *)v6 + 18) supportedDepthDataFormats];
          uint64_t v41 = [v40 countByEnumeratingWithState:&v76 objects:v90 count:16];
          if (v41)
          {
            uint64_t v42 = v41;
            uint64_t v43 = *(void *)v77;
            while (2)
            {
              for (uint64_t j = 0; j != v42; ++j)
              {
                if (*(void *)v77 != v43) {
                  objc_enumerationMutation(v40);
                }
                v45 = *(void **)(*((void *)&v76 + 1) + 8 * j);
                if ([v45 isDefaultActiveFormat])
                {
                  id v46 = v45;
                  *((void *)v6 + 19) = v46;
                  v47 = objc_msgSend((id)objc_msgSend(v46, "videoSupportedFrameRateRanges"), "lastObject");
                  if (v47)
                  {
                    [v47 minFrameDuration];
                  }
                  else
                  {
                    long long v80 = 0uLL;
                    uint64_t v81 = 0;
                  }
                  v32 = &OBJC_IVAR___AVCaptureFigVideoDevice__isSuspended;
                  long long v48 = v80;
                  *((void *)v6 + 23) = v81;
                  *(_OWORD *)(v6 + 168) = v48;
                  goto LABEL_54;
                }
              }
              uint64_t v42 = [v40 countByEnumeratingWithState:&v76 objects:v90 count:16];
              v32 = &OBJC_IVAR___AVCaptureFigVideoDevice__isSuspended;
              if (v42) {
                continue;
              }
              break;
            }
          }
        }
LABEL_54:
        if (!v6[1219]) {
          v6[1219] = [v35 isCenterStageSupported];
        }
        if (!v6[1306]) {
          v6[1306] = objc_msgSend((id)objc_msgSend(v35, "figCaptureSourceVideoFormat"), "isManualFramingSupported");
        }
        if (!v6[1257]) {
          v6[1257] = [v35 isBackgroundBlurSupported];
        }
        if (!v6[1260]) {
          v6[1260] = [v35 isStudioLightSupported];
        }
        if (!v6[1263]) {
          v6[1263] = [v35 reactionEffectsSupported];
        }
        uint64_t v49 = v32[32];
        if (!v6[v49]) {
          v6[v49] = [v35 isBackgroundReplacementSupported];
        }
        if (!v6[192]) {
          v6[192] = [v35 isContinuousZoomWithDepthSupported];
        }
      }
      uint64_t v33 = [obj countByEnumeratingWithState:&v82 objects:v91 count:16];
    }
    while (v33);
  }
  [v6 _initializeContinuousZoomWithDepthActiveWithEnabled:v6[192]];
  *((void *)v6 + 114) = 0x3FF0000000000000;
  if ([(__CFString *)v67 isEqualToString:@"AVCaptureDeviceTypeBuiltInTelephotoCamera"])
  {
    double FloatAnswerWithDefault = AVGestaltGetFloatAnswerWithDefault(@"AVGQWideCameraToTelephotoCameraRelativeZoomFactor", 1.0);
  }
  else
  {
    double FloatAnswerWithDefault = 0.5;
    if (([(__CFString *)v67 isEqualToString:@"AVCaptureDeviceTypeBuiltInUltraWideCamera"] & 1) == 0
      && ([(__CFString *)v67 isEqualToString:@"AVCaptureDeviceTypeBuiltInDualWideCamera"] & 1) == 0
      && ![(__CFString *)v67 isEqualToString:@"AVCaptureDeviceTypeBuiltInTripleCamera"])
    {
      goto LABEL_76;
    }
  }
  *((double *)v6 + 114) = FloatAnswerWithDefault;
LABEL_76:
  char v51 = 1;
  v6[1344] = 1;
  *((_DWORD *)v6 + 286) = 0;
  *((void *)v6 + 142) = -[AVCaptureSystemPressureState initWithFigLevel:factors:recommendedFrameRateRangeForPortrait:]([AVCaptureSystemPressureState alloc], "initWithFigLevel:factors:recommendedFrameRateRangeForPortrait:", *((unsigned int *)v6 + 286), 0, [v6 _recommendedFrameRateRangeForVideoFormat:*((void *)v6 + 18) depthFormat:*((void *)v6 + 19) figSystemPressureLevel:0]);
  v6[1176] = [v6 isGeometricDistortionCorrectionSupported];
  uint64_t v52 = *MEMORY[0x1E4F521E0];
  v88[0] = *MEMORY[0x1E4F521E8];
  v88[1] = v52;
  v89[0] = &unk_1EF4FA718;
  v89[1] = MEMORY[0x1E4F1CC08];
  *((void *)v6 + 95) = (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v89 forKeys:v88 count:2];
  if (v67 == @"AVCaptureDeviceTypeBuiltInTimeOfFlightCamera") {
    *((void *)v6 + 149) = 1;
  }
  v6[1216] = 1;
  ModelSpecificName = (void *)FigCaptureGetModelSpecificName();
  if (([ModelSpecificName isEqualToString:@"D52g"] & 1) == 0) {
    char v51 = [ModelSpecificName isEqualToString:@"D16"];
  }
  v6[1217] = v51;
  v6[1218] = 1;
  v6[1220] = 0;
  v6[1221] = 1;
  *((void *)v6 + 153) = 0;
  *((void *)v6 + 154) = 0;
  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)(v6 + 1240) = _Q0;
  *((_DWORD *)v6 + 327) = 0;
  *((_DWORD *)v6 + 328) = 0;
  *((void *)v6 + 165) = 0x3FF0000000000000;
  *((void *)v6 + 166) = 0x4008000000000000;
  *((void *)v6 + 167) = *((void *)v6 + 110);
  if (v67 == @"AVCaptureDeviceTypeBuiltInUltraWideCamera")
  {
    *((void *)v6 + 166) = 0x4018000000000000;
    if ((id)MGCopyAnswer() == (id)*MEMORY[0x1E4F1CFD0] && [v6 position] == 2) {
      *((void *)v6 + 167) = 0x4000000000000000;
    }
  }
  v6[1258] = 0;
  v6[1259] = 1;
  v6[1261] = 0;
  v6[1262] = 1;
  v6[1264] = 0;
  v6[1265] = 1;
  v6[1267] = 0;
  v6[1268] = 1;
  if (v67 == @"AVCaptureDeviceTypeDeskViewCamera") {
    *((void *)v6 + 162) = 2;
  }
  v6[795] = objc_msgSend((id)objc_msgSend(v6, "_copyFigCaptureSourceProperty:", *MEMORY[0x1E4F52068]), "BOOLValue");
  v6[796] = objc_msgSend((id)objc_msgSend(v6, "_copyFigCaptureSourceProperty:", *MEMORY[0x1E4F520D0]), "BOOLValue");
  if (v68)
  {
    v6[96] = 1;
    v55 = (void *)[v6 _copyFigCaptureSourceProperty:*MEMORY[0x1E4F521A8]];
    long long v72 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    uint64_t v56 = [v55 countByEnumeratingWithState:&v72 objects:v87 count:16];
    if (v56)
    {
      uint64_t v57 = v56;
      uint64_t v58 = *(void *)v73;
      uint64_t v59 = *MEMORY[0x1E4F52170];
      uint64_t v60 = *MEMORY[0x1E4F52000];
      do
      {
        for (uint64_t k = 0; k != v57; ++k)
        {
          if (*(void *)v73 != v58) {
            objc_enumerationMutation(v55);
          }
          v62 = *(void **)(*((void *)&v72 + 1) + 8 * k);
          v63 = (void *)[v55 objectForKeyedSubscript:v62];
          v64 = v6 + 864;
          if (([v62 isEqualToString:v59] & 1) == 0)
          {
            v64 = v6 + 460;
            if (![v62 isEqualToString:v60]) {
              continue;
            }
          }
          [v63 floatValue];
          _DWORD *v64 = v65;
        }
        uint64_t v57 = [v55 countByEnumeratingWithState:&v72 objects:v87 count:16];
      }
      while (v57);
    }
  }
  dispatch_resume(*((dispatch_object_t *)v6 + 9));
  if (v6[1219])
  {
    [(id)objc_opt_class() addObserver:v6 forKeyPath:@"centerStageEnabled" options:7 context:AVCaptureFigVideoDeviceCenterStageEnabledChangedContext];
    [(id)objc_opt_class() addObserver:v6 forKeyPath:@"centerStageFramingMode" options:3 context:AVCaptureFigVideoDeviceCenterStageFramingModeChangedContext];
  }
  if (v6[1257])
  {
    [(id)objc_opt_class() addObserver:v6 forKeyPath:@"backgroundBlurEnabled" options:7 context:AVCaptureFigVideoDeviceBackgroundBlurEnabledChangedContext];
    [(id)objc_opt_class() addObserver:v6 forKeyPath:@"backgroundBlurAperture" options:7 context:AVCaptureFigVideoDeviceBackgroundBlurApertureChangedContext];
  }
  if (v6[1260])
  {
    [(id)objc_opt_class() addObserver:v6 forKeyPath:@"studioLightEnabled" options:7 context:AVCaptureFigVideoDeviceStudioLightingEnabledChangedContext];
    [(id)objc_opt_class() addObserver:v6 forKeyPath:@"studioLightingIntensity" options:7 context:AVCaptureFigVideoDeviceStudioLightingIntensityChangedContext];
  }
  if (v6[1263])
  {
    [(id)objc_opt_class() addObserver:v6 forKeyPath:@"reactionEffectsEnabled" options:7 context:AVCaptureFigVideoDeviceReactionEffectsEnabledChangedContext];
    [(id)objc_opt_class() addObserver:v6 forKeyPath:@"reactionEffectGesturesEnabled" options:7 context:AVCaptureFigVideoDeviceGesturesEnabledChangedContext];
  }
  if (v6[1266])
  {
    [(id)objc_opt_class() addObserver:v6 forKeyPath:@"backgroundReplacementEnabled" options:7 context:AVCaptureFigVideoDeviceBackgroundReplacementEnabledChangedContext];
    [(id)objc_opt_class() addObserver:v6 forKeyPath:@"backgroundReplacementPixelBuffer" options:7 context:AVCaptureFigVideoDeviceBackgroundReplacementPixelBufferChangedContext];
  }
  if (v6[1260] || v6[1257]) {
    [(id)objc_opt_class() addObserver:v6 forKeyPath:@"portraitEffectStudioLightQuality" options:7 context:AVCaptureFigVideoDevicePortraitEffectStudioLightQualityChangedContext];
  }
  return v6;
}

- (BOOL)hasMediaType:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if ([(AVCaptureFigVideoDevice *)self deviceType] == @"AVCaptureDeviceTypeBuiltInTimeOfFlightCamera")
  {
    uint64_t v6 = AVMediaTypePointCloudData;
    goto LABEL_13;
  }
  if ([(AVCaptureFigVideoDevice *)self deviceType] == @"AVCaptureDeviceTypeBuiltInWideAngleMetadataCamera"
    || [(AVCaptureFigVideoDevice *)self deviceType] == @"AVCaptureDeviceTypeBuiltInUltraWideAngleMetadataCamera"
    || [(AVCaptureFigVideoDevice *)self deviceType] == @"AVCaptureDeviceTypeBuiltInInfraredMetadataCamera")
  {
    uint64_t v6 = (__CFString **)MEMORY[0x1E4F47C58];
LABEL_13:
    NSUInteger v7 = *v6;
    LOBYTE(v5) = [a3 isEqualToString:v7];
    return v5;
  }
  if ([a3 isEqualToString:*MEMORY[0x1E4F47C68]])
  {
LABEL_9:
    LOBYTE(v5) = 1;
    return v5;
  }
  if ([a3 isEqualToString:AVMediaTypeForMetadataObjects()])
  {
    if ([(AVCaptureFigVideoDevice *)self isFaceDetectionSupported]
      || [(AVCaptureFigVideoDevice *)self isObjectDetectionSupported])
    {
      goto LABEL_9;
    }
    LOBYTE(v5) = [(AVCaptureFigVideoDevice *)self isMachineReadableCodeDetectionSupported];
  }
  else if (AVMediaTypeMetadataObjectAndAVMediaTypeMetadataAreDefined() {
         && [a3 isEqualToString:*MEMORY[0x1E4F47C50]])
  }
  {
    LOBYTE(v5) = objc_msgSend(-[AVCaptureFigVideoDevice availableBoxedMetadataFormatDescriptions](self, "availableBoxedMetadataFormatDescriptions"), "count") != 0;
  }
  else
  {
    if ([a3 isEqualToString:*MEMORY[0x1E4F47C48]])
    {
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v8 = [(AVCaptureFigVideoDevice *)self formats];
      uint64_t v5 = [v8 countByEnumeratingWithState:&v30 objects:v36 count:16];
      if (!v5) {
        return v5;
      }
      uint64_t v9 = v5;
      uint64_t v10 = *(void *)v31;
LABEL_22:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v31 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void **)(*((void *)&v30 + 1) + 8 * v11);
        if (([v12 isStreamingDisparitySupported] & 1) != 0
          || ([v12 isStreamingDepthSupported] & 1) != 0
          || ([v12 isStillImageDisparitySupported] & 1) != 0
          || ([v12 isStillImageDepthSupported] & 1) != 0)
        {
          goto LABEL_9;
        }
        if (v9 == ++v11)
        {
          uint64_t v9 = [v8 countByEnumeratingWithState:&v30 objects:v36 count:16];
          LOBYTE(v5) = 0;
          if (v9) {
            goto LABEL_22;
          }
          return v5;
        }
      }
    }
    if ([a3 isEqualToString:@"visn"])
    {
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v13 = [(AVCaptureFigVideoDevice *)self formats];
      uint64_t v5 = [v13 countByEnumeratingWithState:&v26 objects:v35 count:16];
      if (!v5) {
        return v5;
      }
      uint64_t v14 = v5;
      uint64_t v15 = *(void *)v27;
LABEL_35:
      uint64_t v16 = 0;
      while (1)
      {
        if (*(void *)v27 != v15) {
          objc_enumerationMutation(v13);
        }
        if ([*(id *)(*((void *)&v26 + 1) + 8 * v16) isVisionDataDeliverySupported]) {
          goto LABEL_9;
        }
        if (v14 == ++v16)
        {
          uint64_t v14 = [v13 countByEnumeratingWithState:&v26 objects:v35 count:16];
          LOBYTE(v5) = 0;
          if (v14) {
            goto LABEL_35;
          }
          return v5;
        }
      }
    }
    LODWORD(v5) = [a3 isEqualToString:@"cacd"];
    if (v5)
    {
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v17 = [(AVCaptureFigVideoDevice *)self formats];
      uint64_t v5 = [v17 countByEnumeratingWithState:&v22 objects:v34 count:16];
      if (v5)
      {
        uint64_t v18 = v5;
        uint64_t v19 = *(void *)v23;
LABEL_48:
        uint64_t v20 = 0;
        while (1)
        {
          if (*(void *)v23 != v19) {
            objc_enumerationMutation(v17);
          }
          if ([*(id *)(*((void *)&v22 + 1) + 8 * v20) isCameraCalibrationDataDeliverySupported]) {
            goto LABEL_9;
          }
          if (v18 == ++v20)
          {
            uint64_t v18 = [v17 countByEnumeratingWithState:&v22 objects:v34 count:16];
            LOBYTE(v5) = 0;
            if (v18) {
              goto LABEL_48;
            }
            return v5;
          }
        }
      }
    }
  }
  return v5;
}

- (id)deviceType
{
  int v2 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_fcsAttributes, "objectForKeyedSubscript:", *MEMORY[0x1E4F51B60]), "intValue");
  id result = &stru_1EF4D21D0;
  switch(v2)
  {
    case 2:
    case 11:
      BOOL v4 = (__CFString **)&AVCaptureDeviceTypeBuiltInWideAngleCamera;
      goto LABEL_17;
    case 3:
      BOOL v4 = (__CFString **)&AVCaptureDeviceTypeBuiltInTelephotoCamera;
      goto LABEL_17;
    case 4:
      BOOL v4 = (__CFString **)&AVCaptureDeviceTypeBuiltInDualCamera;
      goto LABEL_17;
    case 6:
    case 12:
      BOOL v4 = (__CFString **)&AVCaptureDeviceTypeBuiltInTrueDepthCamera;
      goto LABEL_17;
    case 7:
      BOOL v4 = (__CFString **)&AVCaptureDeviceTypeBuiltInUltraWideCamera;
      goto LABEL_17;
    case 8:
      BOOL v4 = (__CFString **)&AVCaptureDeviceTypeBuiltInDualWideCamera;
      goto LABEL_17;
    case 9:
      BOOL v4 = (__CFString **)&AVCaptureDeviceTypeBuiltInTripleCamera;
      goto LABEL_17;
    case 10:
      BOOL v4 = AVCaptureDeviceTypeBuiltInTimeOfFlightCamera;
      goto LABEL_17;
    case 13:
      BOOL v4 = (__CFString **)&AVCaptureDeviceTypeBuiltInLiDARDepthCamera;
      goto LABEL_17;
    case 14:
      BOOL v4 = (__CFString **)&AVCaptureDeviceTypeDeskViewCamera;
      goto LABEL_17;
    case 15:
      BOOL v4 = (__CFString **)&AVCaptureDeviceTypeExternal;
      goto LABEL_17;
    case 16:
      BOOL v4 = (__CFString **)&AVCaptureDeviceTypeContinuityCamera;
      goto LABEL_17;
    case 17:
    case 18:
      BOOL v4 = AVCaptureDeviceTypeBuiltInWideAngleMetadataCamera;
      goto LABEL_17;
    case 19:
      BOOL v4 = AVCaptureDeviceTypeBuiltInUltraWideAngleMetadataCamera;
      goto LABEL_17;
    case 20:
      BOOL v4 = AVCaptureDeviceTypeBuiltInInfraredMetadataCamera;
LABEL_17:
      id result = *v4;
      break;
    default:
      return result;
  }
  return result;
}

- (BOOL)isConnected
{
  uint64_t v6 = 0;
  NSUInteger v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__AVCaptureFigVideoDevice_isConnected__block_invoke;
  v5[3] = &unk_1E5A74078;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int64_t)position
{
  return self->_position;
}

- (id)formats
{
  return self->_formats;
}

- (BOOL)_setContinuousZoomWithDepthActiveWithEnabled:(BOOL)a3 disallowed:(BOOL)a4 isActiveDepthDataFormatChangingOut:(BOOL *)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  self->_continuousZoomWithDepthEnabled = a3;
  self->_continuousZoomWithDepthDisallowed = a4;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  formats = self->_formats;
  uint64_t v8 = [(NSArray *)formats countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(formats);
        }
        uint64_t v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if ([v12 isContinuousZoomWithDepthSupported])
        {
          BOOL v13 = self->_continuousZoomWithDepthEnabled && !self->_continuousZoomWithDepthDisallowed;
          [v12 setContinuousZoomWithDepthEnabled:v13];
        }
      }
      uint64_t v9 = [(NSArray *)formats countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }
  int v14 = [(AVCaptureDeviceFormat *)self->_activeFormat isContinuousZoomWithDepthEnabled];
  int continuousZoomWithDepthActive = self->_continuousZoomWithDepthActive;
  self->_int continuousZoomWithDepthActive = v14;
  BOOL v16 = [(NSArray *)[(AVCaptureDeviceFormat *)self->_activeFormat supportedDepthDataFormats] containsObject:self->_activeDepthDataFormat];
  if (a5) {
    *a5 = !v16;
  }
  return continuousZoomWithDepthActive != v14;
}

- (OpaqueCMClock)deviceClock
{
  id result = [(AVCaptureFigVideoDevice *)self _copyFigCaptureSourceProperty:*MEMORY[0x1E4F51FB0]];
  if (result)
  {
    return (OpaqueCMClock *)CFAutorelease(result);
  }
  return result;
}

- (id)_copyFigCaptureSourceProperty:(__CFString *)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3052000000;
  uint64_t v10 = __Block_byref_object_copy__5;
  fcsQueue = self->_fcsQueue;
  uint64_t v11 = __Block_byref_object_dispose__5;
  uint64_t v12 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__AVCaptureFigVideoDevice__copyFigCaptureSourceProperty___block_invoke;
  block[3] = &unk_1E5A74050;
  block[5] = &v7;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(fcsQueue, block);
  BOOL v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __65__AVCaptureFigVideoDevice__setContinuousZoomWithDepthDisallowed___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _updateContinuousZoomWithDepthActiveWithEnabled:*(unsigned __int8 *)(*(void *)(a1 + 32) + 193) disallowed:*(unsigned __int8 *)(a1 + 56) isActiveDepthDataFormatChangingOut:*(void *)(*(void *)(a1 + 48) + 8) + 24];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)_updateContinuousZoomWithDepthActiveWithEnabled:(BOOL)a3 disallowed:(BOOL)a4 isActiveDepthDataFormatChangingOut:(BOOL *)a5
{
  BOOL v6 = a4;
  BOOL v7 = a3;
  if (!_FigIsCurrentDispatchQueue()) {
    FigDebugAssert3();
  }

  return [(AVCaptureFigVideoDevice *)self _setContinuousZoomWithDepthActiveWithEnabled:v7 disallowed:v6 isActiveDepthDataFormatChangingOut:a5];
}

- (BOOL)hasFlash
{
  id v2 = [(NSDictionary *)self->_fcsAttributes objectForKeyedSubscript:*MEMORY[0x1E4F51B80]];

  return [v2 BOOLValue];
}

- (BOOL)isGeometricDistortionCorrectionSupported
{
  id v2 = [(NSDictionary *)self->_fcsAttributes objectForKeyedSubscript:*MEMORY[0x1E4F51BA8]];

  return [v2 BOOLValue];
}

- (BOOL)isFocusModeSupported:(int64_t)a3
{
  if ((unint64_t)a3 > 2) {
    return 0;
  }
  id v5 = -[NSDictionary objectForKeyedSubscript:](self->_fcsAttributes, "objectForKeyedSubscript:", *MEMORY[0x1E4F51B98], v3);
  return [v5 BOOLValue];
}

- (BOOL)hasTorch
{
  id v2 = [(NSDictionary *)self->_fcsAttributes objectForKeyedSubscript:*MEMORY[0x1E4F51C78]];

  return [v2 BOOLValue];
}

- (BOOL)isExposureModeSupported:(int64_t)a3
{
  if ((unint64_t)a3 > 3) {
    return 0;
  }
  id v5 = -[NSDictionary objectForKeyedSubscript:](self->_fcsAttributes, "objectForKeyedSubscript:", **((void **)&unk_1E5A74830 + a3), v3);
  return [v5 BOOLValue];
}

- (void)_setFigCaptureSource:(OpaqueFigCaptureSource *)a3 allowSendingWorkToMainThread:(BOOL)a4
{
  fcsQueue = self->_fcsQueue;
  if (fcsQueue)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __77__AVCaptureFigVideoDevice__setFigCaptureSource_allowSendingWorkToMainThread___block_invoke;
    block[3] = &unk_1E5A74000;
    block[4] = self;
    block[5] = a3;
    BOOL v7 = a4;
    dispatch_sync(fcsQueue, block);
  }
  else
  {
    FigDebugAssert3();
  }
}

- (void)_initializeContinuousZoomWithDepthActiveWithEnabled:(BOOL)a3
{
}

- (id)_copyFormatsArray
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = [(AVCaptureFigVideoDevice *)self _copyFigCaptureSourceProperty:*MEMORY[0x1E4F52048]];
  uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = [[AVCaptureDeviceFormat alloc] initWithFigCaptureSourceFormat:*(void *)(*((void *)&v12 + 1) + 8 * v8) fcSourceAttributes:self->_fcsAttributes];
        [v4 addObject:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v4];
  return v10;
}

+ (BOOL)_cameraAccessIsEnabled
{
  id v2 = (void *)[MEMORY[0x1E4F74230] sharedConnection];
  return [v2 effectiveBoolValueForSetting:*MEMORY[0x1E4F73F80]] != 2;
}

- (id)availableBoxedMetadataFormatDescriptions
{
  v48[1] = *MEMORY[0x1E4F143B8];
  id result = *(id *)&self->_eyeDetectionEnabled;
  if (!result)
  {
    uint64_t v4 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
    CMMetadataFormatDescriptionRef formatDescriptionOut = 0;
    uint64_t v5 = (void *)[MEMORY[0x1E4F1CA48] array];
    BOOL v6 = [(AVCaptureFigVideoDevice *)self isFaceDetectionSupported];
    uint64_t v7 = (uint64_t *)MEMORY[0x1E4F1F108];
    uint64_t v8 = (uint64_t *)MEMORY[0x1E4F1F0F8];
    if (v6)
    {
      uint64_t v9 = *MEMORY[0x1E4F1F138];
      uint64_t v10 = *MEMORY[0x1E4F1F0F8];
      v46[0] = *MEMORY[0x1E4F1F108];
      v46[1] = v10;
      uint64_t v11 = *MEMORY[0x1E4F1F090];
      v47[0] = v9;
      v47[1] = v11;
      v48[0] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:v46 count:2];
      objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v48, 1));
    }
    if ([(AVCaptureFigVideoDevice *)self isObjectDetectionSupported])
    {
      uint64_t v12 = *v7;
      uint64_t v13 = *MEMORY[0x1E4F1F140];
      uint64_t v14 = *v8;
      v42[0] = v12;
      v42[1] = v14;
      uint64_t v15 = *MEMORY[0x1E4F1F098];
      v43[0] = v13;
      v43[1] = v15;
      uint64_t v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:2];
      v45[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:&v44 count:1];
      uint64_t v16 = *MEMORY[0x1E4F1F128];
      v39[0] = v12;
      v39[1] = v14;
      uint64_t v17 = *MEMORY[0x1E4F1F080];
      v40[0] = v16;
      v40[1] = v17;
      uint64_t v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:2];
      v45[1] = [MEMORY[0x1E4F1C978] arrayWithObjects:&v41 count:1];
      uint64_t v18 = *MEMORY[0x1E4F1F130];
      v36[0] = v12;
      v36[1] = v14;
      uint64_t v19 = *MEMORY[0x1E4F1F088];
      v37[0] = v18;
      v37[1] = v19;
      uint64_t v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:2];
      v45[2] = [MEMORY[0x1E4F1C978] arrayWithObjects:&v38 count:1];
      uint64_t v20 = *MEMORY[0x1E4F1F148];
      v33[0] = v12;
      v33[1] = v14;
      uint64_t v21 = *MEMORY[0x1E4F1F0A0];
      v34[0] = v20;
      v34[1] = v21;
      uint64_t v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:2];
      v45[3] = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
      objc_msgSend(v5, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v45, 4));
    }
    if ([(AVCaptureFigVideoDevice *)self isObjectDetectionSupported]
      || [(AVCaptureFigVideoDevice *)self isFaceDetectionSupported])
    {
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      uint64_t v22 = [v5 countByEnumeratingWithState:&v27 objects:v32 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v28;
        CFAllocatorRef v25 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
        do
        {
          uint64_t v26 = 0;
          do
          {
            if (*(void *)v28 != v24) {
              objc_enumerationMutation(v5);
            }
            if (!CMMetadataFormatDescriptionCreateWithMetadataSpecifications(v25, 0x6D656278u, *(CFArrayRef *)(*((void *)&v27 + 1) + 8 * v26), &formatDescriptionOut))
            {
              [v4 addObject:formatDescriptionOut];
              CFRelease(formatDescriptionOut);
            }
            ++v26;
          }
          while (v23 != v26);
          uint64_t v23 = [v5 countByEnumeratingWithState:&v27 objects:v32 count:16];
        }
        while (v23);
      }
    }
    id result = (id)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v4];
    *(void *)&self->_eyeDetectionEnabled = result;
  }
  return result;
}

- (BOOL)isFaceDetectionSupported
{
  return 1;
}

- (BOOL)isObjectDetectionSupported
{
  id v2 = [(NSDictionary *)self->_fcsAttributes objectForKeyedSubscript:*MEMORY[0x1E4F51C10]];

  return [v2 BOOLValue];
}

uint64_t __43__AVCaptureFigVideoDevice_activeColorSpace__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 856);
  return result;
}

uint64_t __59__AVCaptureFigVideoDevice_isActiveVideoMinFrameDurationSet__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 268) & 1;
  return result;
}

uint64_t __44__AVCaptureFigVideoDevice_isVideoHDREnabled__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 845);
  return result;
}

uint64_t __38__AVCaptureFigVideoDevice_isSuspended__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 794);
  return result;
}

uint64_t __59__AVCaptureFigVideoDevice_isActiveVideoMaxFrameDurationSet__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 316) & 1;
  return result;
}

id __48__AVCaptureFigVideoDevice_activeDepthDataFormat__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(a1 + 32) + 152);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

uint64_t __49__AVCaptureFigVideoDevice_isPortraitEffectActive__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 1258);
  return result;
}

uint64_t __56__AVCaptureFigVideoDevice_isBackgroundReplacementActive__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 1267);
  return result;
}

uint64_t __46__AVCaptureFigVideoDevice_isStudioLightActive__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 1261);
  return result;
}

uint64_t __46__AVCaptureFigVideoDevice_isCenterStageActive__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 1220);
  return result;
}

uint64_t __62__AVCaptureFigVideoDevice_automaticallyAdjustsVideoHDREnabled__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 844);
  return result;
}

- (BOOL)automaticallyAdjustsVideoHDREnabled
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __62__AVCaptureFigVideoDevice_automaticallyAdjustsVideoHDREnabled__block_invoke;
  v5[3] = &unk_1E5A74078;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_setConstantColorEnabled:(BOOL)a3
{
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x2020000000;
  devicePropsQueue = self->_devicePropsQueue;
  char v7 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__AVCaptureFigVideoDevice__setConstantColorEnabled___block_invoke;
  block[3] = &unk_1E5A74280;
  BOOL v5 = a3;
  block[4] = self;
  block[5] = v6;
  dispatch_sync(devicePropsQueue, block);
  _Block_object_dispose(v6, 8);
}

- (void)_setCameraCalibrationDataDeliveryEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  uint64_t v8 = 0;
  char v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __68__AVCaptureFigVideoDevice__setCameraCalibrationDataDeliveryEnabled___block_invoke;
  void v6[3] = &unk_1E5A744B0;
  BOOL v7 = a3;
  void v6[4] = self;
  v6[5] = &v12;
  v6[6] = &v8;
  dispatch_sync(devicePropsQueue, v6);
  if (v3 && *((unsigned char *)v9 + 24)) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Depth data delivery and camera calibration data delivery may not both be enabled" userInfo:0]);
  }
  if (*((unsigned char *)v13 + 24)) {
    [(AVCaptureFigVideoDevice *)self _updateMinMaxDefaultVideoZoomFactors];
  }
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
}

- (void)_setVideoHDREnabled:(BOOL)a3 forceResetVideoHDRSuspended:(BOOL)a4
{
  BOOL v4 = a4;
  [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"videoHDREnabled"];
  uint64_t v10 = 0;
  char v11 = &v10;
  uint64_t v12 = 0x2020000000;
  devicePropsQueue = self->_devicePropsQueue;
  char v13 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__AVCaptureFigVideoDevice__setVideoHDREnabled_forceResetVideoHDRSuspended___block_invoke;
  block[3] = &unk_1E5A74208;
  block[4] = self;
  block[5] = &v10;
  BOOL v9 = a3;
  dispatch_sync(devicePropsQueue, block);
  if (*((unsigned char *)v11 + 24) || v4) {
    [(AVCaptureFigVideoDevice *)self _resetVideoHDRSuspended];
  }
  [(AVCaptureFigVideoDevice *)self didChangeValueForKey:@"videoHDREnabled"];
  _Block_object_dispose(&v10, 8);
}

+ (void)_setUpCameraHistoryOnce
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__AVCaptureFigVideoDevice__setUpCameraHistoryOnce__block_invoke;
  block[3] = &unk_1E5A72ED0;
  block[4] = a1;
  if (_setUpCameraHistoryOnce_onceToken != -1) {
    dispatch_once(&_setUpCameraHistoryOnce_onceToken, block);
  }
}

- (int64_t)activeColorSpace
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__AVCaptureFigVideoDevice_activeColorSpace__block_invoke;
  v5[3] = &unk_1E5A74078;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isActiveVideoMinFrameDurationSet
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__AVCaptureFigVideoDevice_isActiveVideoMinFrameDurationSet__block_invoke;
  v5[3] = &unk_1E5A74078;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)unlockForConfiguration
{
  fcsQueue = self->_fcsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__AVCaptureFigVideoDevice_unlockForConfiguration__block_invoke;
  block[3] = &unk_1E5A72ED0;
  block[4] = self;
  dispatch_sync(fcsQueue, block);
}

- (BOOL)lockForConfiguration:(id *)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  fcsQueue = self->_fcsQueue;
  char v10 = 1;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__AVCaptureFigVideoDevice_lockForConfiguration___block_invoke;
  block[3] = &unk_1E5A74050;
  void block[5] = &v7;
  void block[6] = a3;
  block[4] = self;
  dispatch_sync(fcsQueue, block);
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (BOOL)isActiveVideoMaxFrameDurationSet
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__AVCaptureFigVideoDevice_isActiveVideoMaxFrameDurationSet__block_invoke;
  v5[3] = &unk_1E5A74078;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isWideColorSupported
{
  id v2 = [(NSDictionary *)self->_fcsAttributes objectForKeyedSubscript:*MEMORY[0x1E4F51CC0]];

  return [v2 BOOLValue];
}

- (BOOL)isPortraitEffectActive
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__AVCaptureFigVideoDevice_isPortraitEffectActive__block_invoke;
  v5[3] = &unk_1E5A74078;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isStudioLightActive
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__AVCaptureFigVideoDevice_isStudioLightActive__block_invoke;
  v5[3] = &unk_1E5A74078;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isBackgroundReplacementActive
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__AVCaptureFigVideoDevice_isBackgroundReplacementActive__block_invoke;
  v5[3] = &unk_1E5A74078;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isCenterStageActive
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__AVCaptureFigVideoDevice_isCenterStageActive__block_invoke;
  v5[3] = &unk_1E5A74078;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

+ (id)_devices
{
  return +[AVCaptureFigVideoDevice _devicesWithPriorRegisteredDevices:0];
}

uint64_t __65__AVCaptureFigVideoDevice_isGeometricDistortionCorrectionEnabled__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 1176);
  return result;
}

uint64_t __52__AVCaptureFigVideoDevice_canPerformReactionEffects__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 1264);
  return result;
}

- (id)activeFormat
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  char v9 = __Block_byref_object_copy__5;
  char v10 = __Block_byref_object_dispose__5;
  uint64_t v11 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__AVCaptureFigVideoDevice_activeFormat__block_invoke;
  v5[3] = &unk_1E5A74078;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_setDepthDataDeliveryEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3052000000;
  uint64_t v21 = __Block_byref_object_copy__5;
  uint64_t v22 = __Block_byref_object_dispose__5;
  uint64_t v23 = 0;
  uint64_t v14 = 0;
  char v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__AVCaptureFigVideoDevice__setDepthDataDeliveryEnabled___block_invoke;
  block[3] = &unk_1E5A74488;
  BOOL v9 = a3;
  block[4] = self;
  void block[5] = &v10;
  void block[6] = &v18;
  void block[7] = &v14;
  dispatch_sync(devicePropsQueue, block);
  if (v3 && *((unsigned char *)v15 + 24)) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Depth data delivery and camera calibration data delivery may not both be enabled" userInfo:0]);
  }
  if (*((unsigned char *)v11 + 24))
  {
    [(AVCaptureFigVideoDevice *)self _updateMinMaxDefaultVideoZoomFactors];
    if ([(AVCaptureFigVideoDevice *)self _isBravoVariant]) {
      [(AVCaptureFigVideoDevice *)self _updateFallbackPrimaryConstituentDevicesForDepthDataDeliveryEnabled:v3];
    }
  }
  if (v19[5])
  {
    [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"systemPressureState"];
    uint64_t v6 = self->_devicePropsQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __56__AVCaptureFigVideoDevice__setDepthDataDeliveryEnabled___block_invoke_2;
    v7[3] = &unk_1E5A73EF0;
    v7[4] = self;
    v7[5] = &v18;
    dispatch_sync(v6, v7);
    [(AVCaptureFigVideoDevice *)self didChangeValueForKey:@"systemPressureState"];
  }
  if (*((unsigned char *)v11 + 24)) {
    [(AVCaptureFigVideoDevice *)self _updateCenterStageActiveForEnabled:+[AVCaptureDevice isCenterStageEnabled] updateDependentProperties:0];
  }
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);
}

- (void)_setContinuousZoomWithDepthDisallowed:(BOOL)a3
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __65__AVCaptureFigVideoDevice__setContinuousZoomWithDepthDisallowed___block_invoke;
  v5[3] = &unk_1E5A740C8;
  v5[4] = self;
  v5[5] = &v7;
  BOOL v6 = a3;
  void v5[6] = &v11;
  dispatch_sync(devicePropsQueue, v5);
  if (*((unsigned char *)v12 + 24)) {
    [(AVCaptureFigVideoDevice *)self _updateActiveDepthDataFormatForContinuousZoomWithDepth];
  }
  if (*((unsigned char *)v8 + 24)) {
    [(AVCaptureFigVideoDevice *)self _updateMinMaxDefaultVideoZoomFactors];
  }
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);
}

- (void)_setCinematicVideoEnabled:(BOOL)a3
{
  BOOL v4 = objc_msgSend(-[AVCaptureDeviceFormat supportedZoomRangesForCinematicVideo](self->_activeFormat, "supportedZoomRangesForCinematicVideo"), "count") & a3;
  if (self->_cinematicVideoZoomEnabled != v4)
  {
    self->_cinematicVideoZoomEnabled = v4;
    [(AVCaptureFigVideoDevice *)self _updateMinMaxDefaultVideoZoomFactors];
  }
}

- (BOOL)isGeometricDistortionCorrectionEnabled
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __65__AVCaptureFigVideoDevice_isGeometricDistortionCorrectionEnabled__block_invoke;
  v5[3] = &unk_1E5A74078;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)canPerformReactionEffects
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__AVCaptureFigVideoDevice_canPerformReactionEffects__block_invoke;
  v5[3] = &unk_1E5A74078;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)_recommendedFrameRateRangeForVideoFormat:(id)a3 depthFormat:(id)a4 figSystemPressureLevel:(int)a5
{
  uint64_t v7 = objc_msgSend((id)objc_msgSend(a4, "videoSupportedFrameRateRanges"), "lastObject");
  if (!v7) {
    return 0;
  }
  uint64_t v8 = (void *)v7;
  if (![a3 isPhotoFormat]) {
    return 0;
  }
  if (a5 < 2)
  {
    [v8 maxFrameRate];
    uint64_t v9 = (int)v10;
    goto LABEL_9;
  }
  if ((a5 - 3) >= 2)
  {
    if (a5 == 2)
    {
      uint64_t v9 = 20;
      goto LABEL_9;
    }
    return 0;
  }
  uint64_t v9 = 15;
LABEL_9:

  return +[AVFrameRateRange frameRateRangeWithMinRate:15 maxFrameRate:v9];
}

- (id)uniqueID
{
  return self->_fcsUID;
}

- (id)localizedName
{
  id result = self->_localizedName;
  if (!result)
  {
    [(NSDictionary *)self->_fcsAttributes objectForKeyedSubscript:*MEMORY[0x1E4F51C08]];
    AVCaptureBundleIdentifier();
    id result = (id)AVLocalizedStringFromTableWithBundleIdentifier();
    self->_localizedName = (NSString *)result;
    if (!result)
    {
      id result = [(NSDictionary *)self->_fcsAttributes objectForKeyedSubscript:*MEMORY[0x1E4F51BD8]];
      self->_localizedName = (NSString *)result;
    }
  }
  return result;
}

- (BOOL)isProxyDevice
{
  return self->_proxyDevice;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)activeVideoMinFrameDuration
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3810000000;
  double v10 = &unk_1A165D1D9;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__AVCaptureFigVideoDevice_activeVideoMinFrameDuration__block_invoke;
  block[3] = &unk_1E5A74078;
  block[4] = self;
  void block[5] = &v7;
  dispatch_sync(devicePropsQueue, block);
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)(v8 + 4);
  _Block_object_dispose(&v7, 8);
  return result;
}

- (double)videoZoomFactor
{
  return *(float *)&self->_activeColorSpace;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)activeDepthDataMinFrameDuration
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3810000000;
  double v10 = &unk_1A165D1D9;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__AVCaptureFigVideoDevice_activeDepthDataMinFrameDuration__block_invoke;
  block[3] = &unk_1E5A74078;
  block[4] = self;
  void block[5] = &v7;
  dispatch_sync(devicePropsQueue, block);
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)(v8 + 4);
  _Block_object_dispose(&v7, 8);
  return result;
}

- (BOOL)isNonDestructiveCropEnabled
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__AVCaptureFigVideoDevice_isNonDestructiveCropEnabled__block_invoke;
  v5[3] = &unk_1E5A74078;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (float)videoZoomRampAcceleration
{
  return self->_videoZoomRampTarget;
}

- (int64_t)videoStabilizationStrength
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__AVCaptureFigVideoDevice_videoStabilizationStrength__block_invoke;
  v5[3] = &unk_1E5A74078;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)smileDetectionEnabled
{
  return BYTE2(self->_supportedOptionalFaceDetectionFeatures);
}

- (CGSize)normalizedNonDestructiveCropSize
{
  uint64_t v8 = 0;
  uint64_t v9 = (double *)&v8;
  uint64_t v10 = 0x3010000000;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  uint64_t v11 = &unk_1A165D1D9;
  devicePropsQueue = self->_devicePropsQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__AVCaptureFigVideoDevice_normalizedNonDestructiveCropSize__block_invoke;
  v7[3] = &unk_1E5A74078;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(devicePropsQueue, v7);
  double v3 = v9[4];
  double v4 = v9[5];
  _Block_object_dispose(&v8, 8);
  double v5 = v3;
  double v6 = v4;
  result.height = v6;
  result.width = v5;
  return result;
}

- (BOOL)isSpatialOverCaptureEnabled
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__AVCaptureFigVideoDevice_isSpatialOverCaptureEnabled__block_invoke;
  v5[3] = &unk_1E5A74078;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isSmileDetectionSupported
{
  id v2 = [(AVCaptureFigVideoDevice *)self _supportedOptionalFaceDetectionFeaturesDictionary];
  char v3 = (void *)[v2 objectForKeyedSubscript:*MEMORY[0x1E4F51EC8]];

  return [v3 BOOLValue];
}

- (BOOL)isManualFramingEnabled
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__AVCaptureFigVideoDevice_isManualFramingEnabled__block_invoke;
  v5[3] = &unk_1E5A74078;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isGazeSelectionEnabled
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__AVCaptureFigVideoDevice_isGazeSelectionEnabled__block_invoke;
  v5[3] = &unk_1E5A74078;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isEyeDetectionSupported
{
  id v2 = [(AVCaptureFigVideoDevice *)self _supportedOptionalFaceDetectionFeaturesDictionary];
  char v3 = (void *)[v2 objectForKeyedSubscript:*MEMORY[0x1E4F51EC0]];

  return [v3 BOOLValue];
}

- (BOOL)isDockedTrackingEnabled
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__AVCaptureFigVideoDevice_isDockedTrackingEnabled__block_invoke;
  v5[3] = &unk_1E5A74078;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (OpaqueFigCaptureSource)figCaptureSource
{
  return self->_fcs;
}

- (id)fallbackPrimaryConstituentDevicesAsDeviceTypes
{
  if ([(AVCaptureFigVideoDevice *)self _isBravoVariant]
    && !self->_primaryConstituentDeviceRestrictedSwitchingBehaviorConditions)
  {
    [(AVCaptureFigVideoDevice *)self _populateSupportedFallbackPrimaryConstituentDevices];
  }
  supportedFallbackPrimaryConstituentDevices = self->_supportedFallbackPrimaryConstituentDevices;

  return avcfvd_deviceTypesFromAVCaptureDevices(supportedFallbackPrimaryConstituentDevices);
}

- (int)faceDrivenAEAFMode
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__AVCaptureFigVideoDevice_faceDrivenAEAFMode__block_invoke;
  v5[3] = &unk_1E5A74078;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)eyeDetectionEnabled
{
  return (BOOL)self->_supportedOptionalFaceDetectionFeatures;
}

- (BOOL)eyeClosedDetectionEnabled
{
  return BYTE1(self->_supportedOptionalFaceDetectionFeatures);
}

- (BOOL)automaticallyAdjustsImageControlMode
{
  return BYTE1(self->_sceneClassificationKVO);
}

- (BOOL)appliesSessionPresetMaxIntegrationTimeOverrideToActiveFormat
{
  id v2 = [(NSDictionary *)self->_fcsAttributes objectForKeyedSubscript:*MEMORY[0x1E4F51AE0]];

  return [v2 BOOLValue];
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)activeMaxExposureDurationClientOverride
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3810000000;
  uint64_t v10 = &unk_1A165D1D9;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__AVCaptureFigVideoDevice_activeMaxExposureDurationClientOverride__block_invoke;
  block[3] = &unk_1E5A74078;
  block[4] = self;
  void block[5] = &v7;
  dispatch_sync(devicePropsQueue, block);
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)(v8 + 4);
  _Block_object_dispose(&v7, 8);
  return result;
}

- (void)_setStudioLightingAllowed:(BOOL)a3
{
  devicePropsQueue = self->_devicePropsQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__AVCaptureFigVideoDevice__setStudioLightingAllowed___block_invoke;
  v4[3] = &unk_1E5A74028;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(devicePropsQueue, v4);
}

- (void)_setReactionEffectsAllowed:(BOOL)a3
{
  devicePropsQueue = self->_devicePropsQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __54__AVCaptureFigVideoDevice__setReactionEffectsAllowed___block_invoke;
  v4[3] = &unk_1E5A74028;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(devicePropsQueue, v4);
}

- (void)_setCenterStageAllowed:(BOOL)a3
{
  devicePropsQueue = self->_devicePropsQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__AVCaptureFigVideoDevice__setCenterStageAllowed___block_invoke;
  v4[3] = &unk_1E5A74028;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(devicePropsQueue, v4);
}

- (void)_setBackgroundReplacementAllowed:(BOOL)a3
{
  devicePropsQueue = self->_devicePropsQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __60__AVCaptureFigVideoDevice__setBackgroundReplacementAllowed___block_invoke;
  v4[3] = &unk_1E5A74028;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(devicePropsQueue, v4);
}

- (void)_setBackgroundBlurAllowed:(BOOL)a3
{
  devicePropsQueue = self->_devicePropsQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__AVCaptureFigVideoDevice__setBackgroundBlurAllowed___block_invoke;
  v4[3] = &unk_1E5A74028;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(devicePropsQueue, v4);
}

- (void)_updateCenterStageActiveForEnabled:(BOOL)a3 updateDependentProperties:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  char v16 = 0;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  char v14 = 0;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  char v12 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__AVCaptureFigVideoDevice__updateCenterStageActiveForEnabled_updateDependentProperties___block_invoke;
  block[3] = &unk_1E5A74438;
  block[4] = self;
  void block[5] = &v21;
  BOOL v10 = a3;
  void block[6] = &v17;
  void block[7] = v15;
  void block[8] = v13;
  block[9] = v11;
  dispatch_sync(devicePropsQueue, block);
  if (*((unsigned __int8 *)v22 + 24) != *((unsigned __int8 *)v18 + 24))
  {
    [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"centerStageActive"];
    [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"cinematicFramingActive"];
    if (v4)
    {
      [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"activeVideoMinFrameDuration"];
      [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"activeVideoMaxFrameDuration"];
    }
    uint64_t v7 = self->_devicePropsQueue;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __88__AVCaptureFigVideoDevice__updateCenterStageActiveForEnabled_updateDependentProperties___block_invoke_2;
    v8[3] = &unk_1E5A73EF0;
    v8[4] = self;
    v8[5] = &v17;
    dispatch_sync(v7, v8);
    if (v4)
    {
      [(AVCaptureFigVideoDevice *)self _updateMinMaxDefaultVideoZoomFactors];
      [(AVCaptureFigVideoDevice *)self didChangeValueForKey:@"activeVideoMaxFrameDuration"];
      [(AVCaptureFigVideoDevice *)self didChangeValueForKey:@"activeVideoMinFrameDuration"];
    }
    [(AVCaptureFigVideoDevice *)self didChangeValueForKey:@"cinematicFramingActive"];
    [(AVCaptureFigVideoDevice *)self didChangeValueForKey:@"centerStageActive"];
  }
  _Block_object_dispose(v11, 8);
  _Block_object_dispose(v13, 8);
  _Block_object_dispose(v15, 8);
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);
}

uint64_t __49__AVCaptureFigVideoDevice_unlockForConfiguration__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 32) + 56);
  if (v1 && (VTable = CMBaseObjectGetVTable(), v4 = *(void *)(VTable + 16), CGSize result = VTable + 16, (v3 = v4) != 0)) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(uint64_t (**)(uint64_t))(v5 + 16);
  if (v6)
  {
    return v6(v1);
  }
  return result;
}

uint64_t __75__AVCaptureFigVideoDevice__setVideoHDREnabled_forceResetVideoHDRSuspended___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned __int8 *)(*(void *)(result + 32) + 845) != *(unsigned __int8 *)(result + 48);
  *(unsigned char *)(*(void *)(result + 32) + 845) = *(unsigned char *)(result + 48);
  return result;
}

uint64_t __52__AVCaptureFigVideoDevice__setConstantColorEnabled___block_invoke(uint64_t result)
{
  int v1 = *(unsigned __int8 *)(result + 48);
  uint64_t v2 = *(void *)(result + 32);
  if (v1 != *(unsigned __int8 *)(v2 + 1377))
  {
    *(unsigned char *)(v2 + 1377) = v1;
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
  }
  return result;
}

uint64_t __54__AVCaptureFigVideoDevice__isDepthDataDeliveryEnabled__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 944);
  return result;
}

- (BOOL)isEyeClosedDetectionSupported
{
  id v2 = [(AVCaptureFigVideoDevice *)self _supportedOptionalFaceDetectionFeaturesDictionary];
  uint64_t v3 = (void *)[v2 objectForKeyedSubscript:*MEMORY[0x1E4F51EB8]];

  return [v3 BOOLValue];
}

- (id)_supportedOptionalFaceDetectionFeaturesDictionary
{
  id result = self->_captureSourceSupportedMetadata;
  if (!result)
  {
    id result = [(AVCaptureFigVideoDevice *)self _copyFigCaptureSourceProperty:*MEMORY[0x1E4F52130]];
    self->_captureSourceSupportedMetadata = (NSMutableArray *)result;
  }
  return result;
}

uint64_t __68__AVCaptureFigVideoDevice__setCameraCalibrationDataDeliveryEnabled___block_invoke(uint64_t result)
{
  int v1 = *(unsigned __int8 *)(result + 56);
  uint64_t v2 = *(void *)(result + 32);
  if (v1 != *(unsigned __int8 *)(v2 + 960))
  {
    *(unsigned char *)(v2 + 960) = v1;
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
    uint64_t v2 = *(void *)(result + 32);
  }
  *(unsigned char *)(*(void *)(*(void *)(result + 48) + 8) + 24) = *(unsigned char *)(v2 + 944);
  return result;
}

uint64_t __65__AVCaptureFigVideoDevice_isVariableFrameRateVideoCaptureEnabled__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 1178);
  return result;
}

uint64_t __56__AVCaptureFigVideoDevice_isLowLightVideoCaptureEnabled__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 1148);
  return result;
}

uint64_t __60__AVCaptureFigVideoDevice__setBackgroundReplacementAllowed___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 1268) = *(unsigned char *)(result + 40);
  return result;
}

uint64_t __54__AVCaptureFigVideoDevice__setReactionEffectsAllowed___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 1265) = *(unsigned char *)(result + 40);
  return result;
}

uint64_t __53__AVCaptureFigVideoDevice__setStudioLightingAllowed___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 1262) = *(unsigned char *)(result + 40);
  return result;
}

uint64_t __53__AVCaptureFigVideoDevice__setBackgroundBlurAllowed___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 1259) = *(unsigned char *)(result + 40);
  return result;
}

uint64_t __50__AVCaptureFigVideoDevice__setCenterStageAllowed___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 1221) = *(unsigned char *)(result + 40);
  return result;
}

uint64_t __39__AVCaptureFigVideoDevice_exposureMode__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 424);
  return result;
}

uint64_t __46__AVCaptureFigVideoDevice_isAdjustingExposure__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 540);
  return result;
}

uint64_t __54__AVCaptureFigVideoDevice_isNonDestructiveCropEnabled__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 1150);
  return result;
}

- (CGPoint)exposurePointOfInterest
{
  double x = self->_exposurePointOfInterest.x;
  double y = self->_exposurePointOfInterest.y;
  result.double y = y;
  result.double x = x;
  return result;
}

uint64_t __40__AVCaptureFigVideoDevice_isFlashActive__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 746);
  return result;
}

__n128 __59__AVCaptureFigVideoDevice_normalizedNonDestructiveCropSize__block_invoke(uint64_t a1)
{
  __n128 result = *(__n128 *)(*(void *)(a1 + 32) + 1160);
  *(__n128 *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = result;
  return result;
}

uint64_t __54__AVCaptureFigVideoDevice_isSpatialOverCaptureEnabled__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 1149);
  return result;
}

uint64_t __53__AVCaptureFigVideoDevice_videoStabilizationStrength__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 1184);
  return result;
}

uint64_t __50__AVCaptureFigVideoDevice_isDockedTrackingEnabled__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 1376);
  return result;
}

uint64_t __49__AVCaptureFigVideoDevice_isManualFramingEnabled__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 1307);
  return result;
}

uint64_t __49__AVCaptureFigVideoDevice_isGazeSelectionEnabled__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 1344);
  return result;
}

uint64_t __45__AVCaptureFigVideoDevice_faceDrivenAEAFMode__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(result + 32) + 800);
  return result;
}

uint64_t __48__AVCaptureFigVideoDevice_lockForConfiguration___block_invoke(uint64_t result)
{
  int v1 = (void *)result;
  v13[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)(result + 32) + 56);
  if (v2 && (VTable = CMBaseObjectGetVTable(), v5 = *(void *)(VTable + 16), __n128 result = VTable + 16, (v4 = v5) != 0)) {
    uint64_t v6 = v4;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = *(uint64_t (**)(uint64_t))(v6 + 8);
  if (v7)
  {
    __n128 result = v7(v2);
    if (!result) {
      return result;
    }
    uint64_t v8 = (uint64_t **)(v1 + 6);
    if (v1[6])
    {
      uint64_t v9 = v1[4];
      if (result == -16455)
      {
        uint64_t v12 = *MEMORY[0x1E4F47B70];
        v13[0] = v9;
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
        __n128 result = AVLocalizedError();
LABEL_13:
        *uint64_t *v8 = result;
        goto LABEL_14;
      }
LABEL_12:
      uint64_t v10 = *MEMORY[0x1E4F47B70];
      uint64_t v11 = v9;
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
      __n128 result = AVLocalizedErrorWithUnderlyingOSStatus();
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v8 = (uint64_t **)(v1 + 6);
    if (v1[6])
    {
      uint64_t v9 = v1[4];
      goto LABEL_12;
    }
  }
LABEL_14:
  *(unsigned char *)(*(void *)(v1[5] + 8) + 24) = 0;
  return result;
}

uint64_t __57__AVCaptureFigVideoDevice__copyFigCaptureSourceProperty___block_invoke(void *a1)
{
  uint64_t v1 = *(void *)(a1[4] + 56);
  uint64_t v2 = a1[6];
  uint64_t v3 = *(void *)(a1[5] + 8);
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v7 = *(void *)(VTable + 8);
  uint64_t result = VTable + 8;
  uint64_t v6 = v7;
  if (v7) {
    uint64_t v8 = v6;
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 48);
  if (v9)
  {
    uint64_t v10 = *MEMORY[0x1E4F1CF80];
    return v9(v1, v2, v10, v3 + 40);
  }
  return result;
}

__n128 __58__AVCaptureFigVideoDevice_activeDepthDataMinFrameDuration__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(__n128 **)(*(void *)(a1 + 40) + 8);
  uint64_t v2 = (__n128 *)(*(void *)(a1 + 32) + 168);
  unint64_t v3 = *(void *)(*(void *)(a1 + 32) + 184);
  __n128 result = *v2;
  v1[2] = *v2;
  v1[3].n128_u64[0] = v3;
  return result;
}

__n128 __66__AVCaptureFigVideoDevice_activeMaxExposureDurationClientOverride__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(__n128 **)(*(void *)(a1 + 40) + 8);
  uint64_t v2 = (__n128 *)(*(void *)(a1 + 32) + 516);
  unint64_t v3 = *(void *)(*(void *)(a1 + 32) + 532);
  __n128 result = *v2;
  v1[2] = *v2;
  v1[3].n128_u64[0] = v3;
  return result;
}

float __45__AVCaptureFigVideoDevice_exposureTargetBias__block_invoke(uint64_t a1)
{
  float result = *(float *)(*(void *)(a1 + 32) + 460);
  *(float *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (int)_orderInDevicesArray
{
  id v2 = [(NSDictionary *)self->_fcsAttributes objectForKeyedSubscript:*MEMORY[0x1E4F51B60]];

  return [v2 intValue];
}

- (CGPoint)focusPointOfInterest
{
  double x = self->_focusPointOfInterest.x;
  double y = self->_focusPointOfInterest.y;
  result.double y = y;
  result.double x = x;
  return result;
}

uint64_t __36__AVCaptureFigVideoDevice_focusMode__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 336);
  return result;
}

uint64_t __47__AVCaptureFigVideoDevice_setWhiteBalanceMode___block_invoke(uint64_t a1, double a2, double a3, double a4)
{
  LODWORD(a2) = 0;
  LODWORD(a3) = 0;
  LODWORD(a4) = 0;
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_setWhiteBalanceWithMode:gains:requestID:", *(void *)(a1 + 48), 0, a2, a3, a4);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *(void *)(*(void *)(a1 + 32) + 544) = *(void *)(a1 + 48);
  }
  return result;
}

uint64_t __63__AVCaptureFigVideoDevice__setPhotoSettingsForSceneMonitoring___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(void *)(*(void *)(a1 + 32) + 736);
  uint64_t result = [*(id *)(a1 + 40) flashMode];
  *(unsigned char *)(*(void *)(a1 + 32) + 745) = result == 2;
  return result;
}

uint64_t __67__AVCaptureFigVideoDevice__updatePortraitEffectStudioLightQuality___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) lockForConfiguration:0];
  if (result)
  {
    objc_msgSend(*(id *)(a1 + 32), "_setFigCaptureSourceProperty:withValue:", *MEMORY[0x1E4F520C0], objc_msgSend(NSNumber, "numberWithInteger:", *(void *)(a1 + 40)));
    unint64_t v3 = *(void **)(a1 + 32);
    return [v3 unlockForConfiguration];
  }
  return result;
}

uint64_t __50__AVCaptureFigVideoDevice__updateGesturesEnabled___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) lockForConfiguration:0];
  if (result)
  {
    objc_msgSend(*(id *)(a1 + 32), "_setFigCaptureSourceProperty:withValue:", *MEMORY[0x1E4F52050], objc_msgSend(NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 40)));
    unint64_t v3 = *(void **)(a1 + 32);
    return [v3 unlockForConfiguration];
  }
  return result;
}

uint64_t __58__AVCaptureFigVideoDevice__updateStudioLightingIntensity___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) lockForConfiguration:0];
  if (result)
  {
    LODWORD(v3) = *(_DWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "_setFigCaptureSourceProperty:withValue:", *MEMORY[0x1E4F52110], objc_msgSend(NSNumber, "numberWithFloat:", v3));
    uint64_t v4 = *(void **)(a1 + 32);
    return [v4 unlockForConfiguration];
  }
  return result;
}

uint64_t __57__AVCaptureFigVideoDevice__updateBackgroundBlurAperture___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) lockForConfiguration:0];
  if (result)
  {
    LODWORD(v3) = *(_DWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "_setFigCaptureSourceProperty:withValue:", *MEMORY[0x1E4F51F50], objc_msgSend(NSNumber, "numberWithFloat:", v3));
    uint64_t v4 = *(void **)(a1 + 32);
    return [v4 unlockForConfiguration];
  }
  return result;
}

- (void)setTorchMode:(int64_t)a3
{
  if (-[AVCaptureFigVideoDevice isTorchModeSupported:](self, "isTorchModeSupported:"))
  {
    LODWORD(v5) = 2139095039;
    if (a3 != 1) {
      *(float *)&double v5 = 0.0;
    }
    int v6 = [(AVCaptureFigVideoDevice *)self _setTorchMode:a3 withLevel:v5];
    if (v6 != -16452)
    {
      if (!v6)
      {
        devicePropsQueue = self->_devicePropsQueue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __40__AVCaptureFigVideoDevice_setTorchMode___block_invoke;
        block[3] = &unk_1E5A72F98;
        block[4] = self;
        void block[5] = a3;
        dispatch_sync(devicePropsQueue, block);
      }
      return;
    }
    uint64_t v13 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v14 = *MEMORY[0x1E4F1C3A8];
    objc_opt_class();
    uint64_t v10 = AVMethodExceptionReasonWithClassAndSelector();
    uint64_t v11 = v13;
    uint64_t v12 = v14;
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v9 = *MEMORY[0x1E4F1C3C8];
    objc_opt_class();
    int64_t v16 = a3;
    uint64_t v10 = AVMethodExceptionReasonWithClassAndSelector();
    uint64_t v11 = v8;
    uint64_t v12 = v9;
  }
  char v15 = objc_msgSend(v11, "exceptionWithName:reason:userInfo:", v12, v10, 0, v16);
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v15);
  }
  NSLog(&cfstr_SuppressingExc.isa, v15);
}

- (BOOL)isTorchModeSupported:(int64_t)a3
{
  return (unint64_t)a3 <= 2 && [(AVCaptureFigVideoDevice *)self hasTorch];
}

- (int)_setTorchMode:(int64_t)a3 withLevel:(float)a4
{
  int v7 = -[AVCaptureFigVideoDevice _setFigCaptureSourceProperty:withValue:](self, "_setFigCaptureSourceProperty:withValue:", *MEMORY[0x1E4F51F40], [NSNumber numberWithInt:a3 == 2]);
  if (v7)
  {
    int v9 = v7;
    goto LABEL_7;
  }
  if (a3 != 2)
  {
    *(float *)&double v8 = a4;
    int v9 = -[AVCaptureFigVideoDevice _setFigCaptureSourceProperty:withValue:](self, "_setFigCaptureSourceProperty:withValue:", *MEMORY[0x1E4F52150], [NSNumber numberWithFloat:v8]);
    if (!v9) {
      return v9;
    }
LABEL_7:
    FigDebugAssert3();
    return v9;
  }
  return 0;
}

- (int)_setFallbackPrimaryConstituentDevices:(id)a3
{
  id v3 = a3;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  int v12 = 0;
  double v5 = avcfvd_deviceTypesFromAVCaptureDevices(a3);
  devicePropsQueue = self->_devicePropsQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__AVCaptureFigVideoDevice__setFallbackPrimaryConstituentDevices___block_invoke;
  v8[3] = &unk_1E5A74578;
  v8[4] = self;
  v8[5] = v5;
  void v8[6] = v3;
  v8[7] = &v9;
  dispatch_sync(devicePropsQueue, v8);
  LODWORD(v3) = *((_DWORD *)v10 + 6);
  _Block_object_dispose(&v9, 8);
  return (int)v3;
}

- (BOOL)wideAngleCameraSourcesFromUltraWide
{
  return [(AVCaptureFigVideoDevice *)self figCaptureSourceDeviceType] == 11
      || [(AVCaptureFigVideoDevice *)self figCaptureSourceDeviceType] == 12
      || [(AVCaptureFigVideoDevice *)self figCaptureSourceDeviceType] == 18;
}

- (BOOL)_isBravoVariant
{
  int v2 = [(AVCaptureFigVideoDevice *)self figCaptureSourceDeviceType];
  return v2 == 4 || (v2 & 0xFFFFFFFE) == 8;
}

- (int)figCaptureSourceDeviceType
{
  id v2 = [(NSDictionary *)self->_fcsAttributes objectForKeyedSubscript:*MEMORY[0x1E4F51B60]];

  return [v2 intValue];
}

uint64_t __46__AVCaptureFigVideoDevice_setVideoZoomFactor___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  double v4 = *(double *)(v3 + 24);
  double v5 = *(double *)(v2 + 880);
  if (v4 < v5 || (double v5 = *(double *)(v2 + 888), v4 > v5)) {
    *(double *)(v3 + 24) = v5;
  }
  uint64_t v6 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v6 + 944) && !*(unsigned char *)(v6 + 194) && !*(unsigned char *)(v6 + 196))
  {
    float v7 = *(double *)(v6 + 880);
    float v8 = *(double *)(v6 + 888);
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v9 = objc_msgSend(*(id *)(v6 + 144), "supportedVideoZoomRangesForDepthDataDelivery", 0);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v20;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v19 + 1) + 8 * v13) minZoomFactor];
          double v15 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
          if (v15 <= v14) {
            float v8 = v14;
          }
          if (v15 >= v14) {
            float v7 = v14;
          }
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v11);
    }
    uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8);
    if (*(double *)(v16 + 24) <= (float)((float)(v8 + v7) * 0.5)) {
      float v17 = v7;
    }
    else {
      float v17 = v8;
    }
    *(double *)(v16 + 24) = v17;
    *(unsigned char *)(*(void *)(a1 + 32) + 328) = 1;
    uint64_t v6 = *(void *)(a1 + 32);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(float *)(v6 + 868) != 0.0;
  ++*(_DWORD *)(*(void *)(a1 + 32) + 872);
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_setFigCaptureSourceProperty:withValue:cacheOnly:", *MEMORY[0x1E4F52170], objc_msgSend(NSNumber, "numberWithDouble:", *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)), *(unsigned __int8 *)(*(void *)(a1 + 32) + 328));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
  return result;
}

__n128 __62__AVCaptureFigVideoDevice_setActiveDepthDataMinFrameDuration___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  double v3 = 0.0;
  if ((*(_DWORD *)(v2 + 44) & 0x1D) == 1) {
    double v3 = (double)*(int *)(v2 + 40) / (double)*(uint64_t *)(v2 + 32);
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_setFigCaptureSourceProperty:withValue:cacheOnly:", *MEMORY[0x1E4F51EE8], objc_msgSend(NSNumber, "numberWithDouble:", v3), *(unsigned __int8 *)(*(void *)(a1 + 32) + 328));
  if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    double v5 = (__n128 *)(*(void *)(a1 + 32) + 168);
    uint64_t v6 = *(__n128 **)(*(void *)(a1 + 40) + 8);
    unint64_t v7 = v6[3].n128_u64[0];
    __n128 result = v6[2];
    __n128 *v5 = result;
    v5[1].n128_u64[0] = v7;
  }
  return result;
}

- (int)_setWhiteBalanceWithMode:(int64_t)a3 gains:(id)a4 requestID:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  $E2C29196C7A5C696474C6955C5A9CE06 v13 = a4;
  float v8 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v9 = [NSNumber numberWithInteger:a3];
  [v8 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F522A8]];
  if (!a3)
  {
    uint64_t v10 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v13 length:12];
    [v8 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F522A0]];
    if (v5)
    {
      uint64_t v11 = [NSNumber numberWithInt:v5];
      [v8 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F522B0]];
    }
  }
  return [(AVCaptureFigVideoDevice *)self _setFigCaptureSourceProperty:*MEMORY[0x1E4F52190] withValue:v8];
}

- (void)_setPhotoSettingsForSceneMonitoring:(id)a3
{
  v18[4] = *MEMORY[0x1E4F143B8];
  if ([(AVCaptureFigVideoDevice *)self lockForConfiguration:0])
  {
    uint64_t v13 = 0;
    double v14 = &v13;
    uint64_t v15 = 0x2020000000;
    devicePropsQueue = self->_devicePropsQueue;
    uint64_t v16 = 0;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __63__AVCaptureFigVideoDevice__setPhotoSettingsForSceneMonitoring___block_invoke;
    v12[3] = &unk_1E5A73F18;
    v12[5] = a3;
    v12[6] = &v13;
    v12[4] = self;
    dispatch_sync(devicePropsQueue, v12);
    uint64_t v6 = [a3 flashMode];
    uint64_t v7 = v14[3];
    if (v6)
    {
      if (v7 != 1) {
        goto LABEL_8;
      }
    }
    else if (v7 <= 0)
    {
      uint64_t v6 = 0;
      goto LABEL_8;
    }
    uint64_t v6 = v14[3];
LABEL_8:
    uint64_t v8 = [a3 HDRMode];
    uint64_t v9 = [a3 photoQualityPrioritization];
    uint64_t v10 = [a3 digitalFlashMode];
    v17[0] = *MEMORY[0x1E4F52218];
    v18[0] = [NSNumber numberWithInt:v6];
    v17[1] = *MEMORY[0x1E4F52220];
    v18[1] = [NSNumber numberWithInt:v8];
    v17[2] = *MEMORY[0x1E4F52228];
    v18[2] = [NSNumber numberWithInt:v9];
    v17[3] = *MEMORY[0x1E4F52210];
    v18[3] = [NSNumber numberWithInt:v10];
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:4];
    [(AVCaptureFigVideoDevice *)self _setFigCaptureSourceProperty:*MEMORY[0x1E4F52100] withValue:v11];
    [(AVCaptureFigVideoDevice *)self unlockForConfiguration];
    _Block_object_dispose(&v13, 8);
  }
}

- (int)_setFigCaptureSourceProperty:(__CFString *)a3 withValue:(id)a4 cacheOnly:(BOOL)a5
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  int v13 = 0;
  fcsQueue = self->_fcsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__AVCaptureFigVideoDevice__setFigCaptureSourceProperty_withValue_cacheOnly___block_invoke;
  block[3] = &unk_1E5A745A0;
  BOOL v9 = a5;
  void block[6] = &v10;
  void block[7] = a3;
  block[4] = self;
  void block[5] = a4;
  dispatch_sync(fcsQueue, block);
  int v6 = *((_DWORD *)v11 + 6);
  _Block_object_dispose(&v10, 8);
  return v6;
}

- (int)_setFigCaptureSourceProperty:(__CFString *)a3 withValue:(id)a4
{
  return [(AVCaptureFigVideoDevice *)self _setFigCaptureSourceProperty:a3 withValue:a4 cacheOnly:0];
}

- (BOOL)isAutoRedEyeReductionSupported
{
  id v2 = [(NSDictionary *)self->_fcsAttributes objectForKeyedSubscript:*MEMORY[0x1E4F51C40]];

  return [v2 BOOLValue];
}

- (id)serializedProcessingSettings
{
  id v2 = [(AVCaptureFigVideoDevice *)self _copyFigCaptureSourceProperty:*MEMORY[0x1E4F520F0]];

  return v2;
}

uint64_t __43__AVCaptureFigVideoDevice_isAdjustingFocus__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 364);
  return result;
}

__n128 __102__AVCaptureFigVideoDevice__setActiveFormat_resetVideoZoomFactorAndMinMaxFrameDurations_sessionPreset___block_invoke(uint64_t a1)
{
  uint64_t v179 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  double v3 = *(void **)(v2 + 160);
  *(void *)(v2 + 160) = 0;
  if (([*(id *)(a1 + 40) isEqualToString:@"AVCaptureSessionPresetInputPriority"] & 1) == 0) {
    *(void *)(*(void *)(a1 + 32) + 160) = *(id *)(a1 + 40);
  }

  if ([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) isEqual:*(void *)(*(void *)(a1 + 32) + 144)])return result; {
  id v5 = *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  }

  *(void *)(*(void *)(a1 + 32) + 144) = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  *(unsigned char *)(*(void *)(a1 + 32) + 194) = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) isContinuousZoomWithDepthEnabled];
  long long v174 = 0u;
  long long v175 = 0u;
  long long v176 = 0u;
  long long v177 = 0u;
  int v6 = (void *)[*(id *)(*(void *)(a1 + 32) + 144) supportedDepthDataFormats];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v174 objects:v178 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v175;
LABEL_6:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v175 != v9) {
        objc_enumerationMutation(v6);
      }
      uint64_t v11 = *(void **)(*((void *)&v174 + 1) + 8 * v10);
      if ([v11 isDefaultActiveFormat]) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v174 objects:v178 count:16];
        if (v8) {
          goto LABEL_6;
        }
        goto LABEL_12;
      }
    }
  }
  else
  {
LABEL_12:
    uint64_t v11 = 0;
  }
  if (v11 != *(void **)(*(void *)(a1 + 32) + 152) && (objc_msgSend(v11, "isEqual:") & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = v11;
    if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)) {
      *(unsigned char *)(*(void *)(a1 + 32) + 944) = 0;
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_isCenterStageActiveForEnabled:", +[AVCaptureDevice isCenterStageEnabled](AVCaptureDevice, "isCenterStageEnabled"));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 72)
                                                                                              + 8)
                                                                                  + 24) != *(unsigned __int8 *)(*(void *)(a1 + 32) + 1220);
  [*(id *)(a1 + 32) _computeMinVideoZoomFactorOut:*(void *)(*(void *)(a1 + 88) + 8) + 24 maxVideoZoomFactorOut:*(void *)(*(void *)(a1 + 96) + 8) + 24 defaultVideoZoomFactorOut:*(void *)(*(void *)(a1 + 104) + 8) + 24 centerStageActiveOverride:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) resetZoomFactor:*(unsigned __int8 *)(a1 + 304)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 112) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_isBackgroundBlurActiveForEnabled:", +[AVCaptureDevice isBackgroundBlurEnabled](AVCaptureDevice, "isBackgroundBlurEnabled"));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 120) + 8) + 24) = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 112)
                                                                                               + 8)
                                                                                   + 24) != *(unsigned __int8 *)(*(void *)(a1 + 32) + 1258);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 128) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_isStudioLightingActiveForEnabled:", +[AVCaptureDevice isStudioLightEnabled](AVCaptureDevice, "isStudioLightEnabled"));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 136) + 8) + 24) = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 128)
                                                                                               + 8)
                                                                                   + 24) != *(unsigned __int8 *)(*(void *)(a1 + 32) + 1261);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 144) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_reactionEffectsActiveForEnabled:", +[AVCaptureDevice reactionEffectsEnabled](AVCaptureDevice, "reactionEffectsEnabled"));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 152) + 8) + 24) = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 144)
                                                                                               + 8)
                                                                                   + 24) != *(unsigned __int8 *)(*(void *)(a1 + 32) + 1264);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 160) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_isBackgroundReplacementActiveForEnabled:", +[AVCaptureDevice isBackgroundReplacementEnabled](AVCaptureDevice, "isBackgroundReplacementEnabled"));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 168) + 8) + 24) = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 160)
                                                                                               + 8)
                                                                                   + 24) != *(unsigned __int8 *)(*(void *)(a1 + 32) + 1267);
  if (*(unsigned char *)(a1 + 304))
  {
    memset(&v173, 0, sizeof(v173));
    uint64_t v12 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    if (v12) {
      [v12 defaultActiveMinFrameDurationForSessionPreset:*(void *)(*(void *)(a1 + 32) + 160)];
    }
    long long v13 = *(_OWORD *)(*(void *)(a1 + 32) + 232);
    time1.epoch = *(void *)(*(void *)(a1 + 32) + 248);
    *(_OWORD *)&time1.value = v13;
    CMTime time2 = v173;
    if (CMTimeCompare(&time1, &time2)) {
      *(CMTime *)(*(void *)(*(void *)(a1 + 176) + 8) + 32) = v173;
    }
    uint64_t v14 = *(void *)(a1 + 32) + 256;
    uint64_t v15 = MEMORY[0x1E4F1F9F8];
    long long v123 = *MEMORY[0x1E4F1F9F8];
    *(_OWORD *)uint64_t v14 = *MEMORY[0x1E4F1F9F8];
    uint64_t v16 = *(void *)(v15 + 16);
    *(void *)(v14 + 16) = v16;
    memset(&time1, 0, sizeof(time1));
    float v17 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    if (v17) {
      [v17 defaultActiveMaxFrameDurationForSessionPreset:*(void *)(*(void *)(a1 + 32) + 160)];
    }
    long long v18 = *(_OWORD *)(*(void *)(a1 + 32) + 280);
    time2.epoch = *(void *)(*(void *)(a1 + 32) + 296);
    *(_OWORD *)&time2.value = v18;
    CMTime v170 = time1;
    if (CMTimeCompare(&time2, &v170)) {
      *(CMTime *)(*(void *)(*(void *)(a1 + 184) + 8) + 32) = time1;
    }
    uint64_t v19 = *(void *)(a1 + 32) + 304;
    *(_OWORD *)uint64_t v19 = v123;
    *(void *)(v19 + 16) = v16;
    float v20 = *(double *)(*(void *)(*(void *)(a1 + 104) + 8) + 24);
    *(float *)(*(void *)(*(void *)(a1 + 192) + 8) + 24) = v20;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 200) + 8) + 24) = *(void *)(*(void *)(a1 + 32) + 1152) != 0;
    long long v21 = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), "videoSupportedFrameRateRanges"), "lastObject");
    if (v21)
    {
      [v21 minFrameDuration];
      uint64_t v22 = *(void *)(*(void *)(a1 + 208) + 8);
      *(_OWORD *)(v22 + 32) = v168;
      *(void *)(v22 + 48) = v169;
    }
    uint64_t v23 = *(void *)(*(void *)(a1 + 216) + 8);
    *(_OWORD *)(v23 + 32) = v123;
    *(void *)(v23 + 48) = v16;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 224) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 216) + 8)
                                                                           + 44) & 1;
  }
  else
  {
    uint64_t v24 = *(void *)(a1 + 32) + 232;
    CFAllocatorRef v25 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    if (v25) {
      [v25 lowestSupportedVideoFrameDuration];
    }
    else {
      memset(&v167, 0, sizeof(v167));
    }
    long long v26 = *(_OWORD *)v24;
    v173.epoch = *(void *)(v24 + 16);
    *(_OWORD *)&v173.value = v26;
    if (CMTimeCompare(&v173, &v167) < 0)
    {
      long long v27 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      if (v27)
      {
        [v27 lowestSupportedVideoFrameDuration];
      }
      else
      {
        long long v165 = 0uLL;
        uint64_t v166 = 0;
      }
      uint64_t v28 = *(void *)(*(void *)(a1 + 176) + 8);
      *(_OWORD *)(v28 + 32) = v165;
      *(void *)(v28 + 48) = v166;
    }
    uint64_t v29 = *(void *)(a1 + 32) + 280;
    long long v30 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    if (v30) {
      [v30 highestSupportedVideoFrameDuration];
    }
    else {
      memset(&v164, 0, sizeof(v164));
    }
    long long v31 = *(_OWORD *)v29;
    v173.epoch = *(void *)(v29 + 16);
    *(_OWORD *)&v173.value = v31;
    if (CMTimeCompare(&v173, &v164) >= 1)
    {
      long long v32 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      if (v32)
      {
        [v32 highestSupportedVideoFrameDuration];
      }
      else
      {
        long long v162 = 0uLL;
        uint64_t v163 = 0;
      }
      uint64_t v33 = *(void *)(*(void *)(a1 + 184) + 8);
      *(_OWORD *)(v33 + 32) = v162;
      *(void *)(v33 + 48) = v163;
    }
    double v34 = *(float *)(*(void *)(a1 + 32) + 864);
    double v35 = *(double *)(*(void *)(*(void *)(a1 + 96) + 8) + 24);
    if (v35 < v34 || (double v35 = *(double *)(*(void *)(*(void *)(a1 + 88) + 8) + 24), v35 > v34))
    {
      float v36 = v35;
      *(float *)(*(void *)(*(void *)(a1 + 192) + 8) + 24) = v36;
    }
    uint64_t v37 = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), "videoSupportedFrameRateRanges"), "lastObject");
    if (v37)
    {
      memset(&v173, 0, sizeof(v173));
      [v37 minFrameDuration];
      long long v38 = *(_OWORD *)(*(void *)(a1 + 32) + 168);
      time1.epoch = *(void *)(*(void *)(a1 + 32) + 184);
      *(_OWORD *)&time1.value = v38;
      CMTime time2 = v173;
      if (CMTimeCompare(&time1, &time2) < 0) {
        *(CMTime *)(*(void *)(*(void *)(a1 + 208) + 8) + 32) = v173;
      }
    }
    uint64_t v39 = *(void *)(*(void *)(a1 + 216) + 8);
    if (*(unsigned char *)(v39 + 44))
    {
      v40 = (CMTime *)(v39 + 32);
      uint64_t v41 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      if (v41) {
        [v41 maxExposureDuration];
      }
      else {
        memset(&v161, 0, sizeof(v161));
      }
      CMTime v173 = *v40;
      if (CMTimeCompare(&v173, &v161) < 1)
      {
        uint64_t v43 = (CMTime *)(*(void *)(*(void *)(a1 + 216) + 8) + 32);
        uint64_t v44 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        if (v44) {
          [v44 minExposureDuration];
        }
        else {
          memset(&v158, 0, sizeof(v158));
        }
        CMTime v173 = *v43;
        if ((CMTimeCompare(&v173, &v158) & 0x80000000) == 0) {
          goto LABEL_65;
        }
        v67 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        if (v67)
        {
          [v67 minExposureDuration];
        }
        else
        {
          long long v156 = 0uLL;
          uint64_t v157 = 0;
        }
        uint64_t v45 = *(void *)(*(void *)(a1 + 216) + 8);
        *(_OWORD *)(v45 + 32) = v156;
        uint64_t v46 = v157;
      }
      else
      {
        uint64_t v42 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        if (v42)
        {
          [v42 maxExposureDuration];
        }
        else
        {
          long long v159 = 0uLL;
          uint64_t v160 = 0;
        }
        uint64_t v45 = *(void *)(*(void *)(a1 + 216) + 8);
        *(_OWORD *)(v45 + 32) = v159;
        uint64_t v46 = v160;
      }
      *(void *)(v45 + 48) = v46;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 224) + 8) + 24) = 1;
    }
  }
LABEL_65:
  v47 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 144), "supportedColorSpaces", v123);
  if ((objc_msgSend(v47, "containsObject:", objc_msgSend(NSNumber, "numberWithInteger:", *(void *)(*(void *)(a1 + 32) + 856))) & 1) == 0)*(void *)(*(void *)(*(void *)(a1 + 232) + 8) + 24) = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 144), "supportedColorSpaces"), "firstObject"), "integerValue"); {
  *(_DWORD *)(*(void *)(a1 + 32) + 1144) = [*(id *)(*(void *)(a1 + 32) + 1136) figLevel];
  }
  long long v48 = -[AVCaptureSystemPressureState initWithFigLevel:factors:recommendedFrameRateRangeForPortrait:]([AVCaptureSystemPressureState alloc], "initWithFigLevel:factors:recommendedFrameRateRangeForPortrait:", *(unsigned int *)(*(void *)(a1 + 32) + 1144), [*(id *)(*(void *)(a1 + 32) + 1136) factors], objc_msgSend(*(id *)(a1 + 32), "_recommendedFrameRateRangeForVideoFormat:depthFormat:figSystemPressureLevel:", *(void *)(*(void *)(a1 + 32) + 144), v11, *(unsigned int *)(*(void *)(a1 + 32) + 1144)));
  if (![(AVCaptureSystemPressureState *)v48 isEqual:*(void *)(*(void *)(a1 + 32) + 1136)]) {
    *(void *)(*(void *)(*(void *)(a1 + 240) + 8) + 40) = v48;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 248) + 8) + 24) = *(void *)(*(void *)(a1 + 32) + 752) != 0;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 256) + 8) + 24) = *(unsigned char *)(*(void *)(a1 + 32) + 1177);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 264) + 8) + 24) = *(unsigned char *)(*(void *)(a1 + 32) + 1148);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 272) + 8) + 24) = *(unsigned char *)(*(void *)(a1 + 32) + 1178);
  *(void *)(*(void *)(*(void *)(a1 + 280) + 8) + 24) = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8)+ 40) isVideoStabilizationStrengthSupported:1];
  uint64_t v49 = *(void *)(a1 + 32);
  if (*(void *)(*(void *)(*(void *)(a1 + 280) + 8) + 24) != *(void *)(v49 + 1184))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 288) + 8) + 24) = 1;
    uint64_t v49 = *(void *)(a1 + 32);
  }
  if (([*(id *)(v49 + 144) isSpatialOverCaptureSupported] & 1) == 0
    && *(unsigned char *)(*(void *)(a1 + 32) + 1149))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 296) + 8) + 24) = 1;
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)) {
    goto LABEL_109;
  }
  uint64_t v50 = *(void *)(*(void *)(a1 + 176) + 8);
  if (*(unsigned char *)(v50 + 44))
  {
    char v51 = (CMTime *)(v50 + 32);
    uint64_t v52 = (void *)[*(id *)(*(void *)(a1 + 32) + 144) videoFrameRateRangeForCenterStage];
    if (v52) {
      [v52 minFrameDuration];
    }
    else {
      memset(&v155, 0, sizeof(v155));
    }
    CMTime v173 = *v51;
    if (CMTimeCompare(&v173, &v155) < 0)
    {
      v55 = (void *)[*(id *)(*(void *)(a1 + 32) + 144) videoFrameRateRangeForCenterStage];
      if (v55)
      {
        uint64_t v56 = (__n128 *)v154;
        [v55 minFrameDuration];
      }
      else
      {
        memset(v154, 0, sizeof(v154));
        uint64_t v56 = (__n128 *)v154;
      }
    }
    else
    {
      v53 = (CMTime *)(*(void *)(*(void *)(a1 + 176) + 8) + 32);
      v54 = (void *)[*(id *)(*(void *)(a1 + 32) + 144) videoFrameRateRangeForCenterStage];
      if (v54) {
        [v54 maxFrameDuration];
      }
      else {
        memset(&v153, 0, sizeof(v153));
      }
      CMTime v173 = *v53;
      if (CMTimeCompare(&v173, &v153) < 1) {
        goto LABEL_91;
      }
      uint64_t v57 = (void *)[*(id *)(*(void *)(a1 + 32) + 144) videoFrameRateRangeForCenterStage];
      if (v57)
      {
        uint64_t v56 = (__n128 *)v152;
        [v57 maxFrameDuration];
      }
      else
      {
        memset(v152, 0, sizeof(v152));
        uint64_t v56 = (__n128 *)v152;
      }
    }
    uint64_t v58 = *(__n128 **)(*(void *)(a1 + 176) + 8);
    __n128 result = *v56;
    v58[2] = *v56;
    v58[3].n128_u64[0] = v56[1].n128_u64[0];
  }
LABEL_91:
  uint64_t v59 = *(void *)(*(void *)(a1 + 184) + 8);
  if ((*(unsigned char *)(v59 + 44) & 1) == 0) {
    goto LABEL_109;
  }
  uint64_t v60 = (CMTime *)(v59 + 32);
  v61 = (void *)[*(id *)(*(void *)(a1 + 32) + 144) videoFrameRateRangeForCenterStage];
  if (v61) {
    [v61 maxFrameDuration];
  }
  else {
    memset(&v151, 0, sizeof(v151));
  }
  CMTime v173 = *v60;
  if (CMTimeCompare(&v173, &v151) >= 1)
  {
    v62 = (void *)[*(id *)(*(void *)(a1 + 32) + 144) videoFrameRateRangeForCenterStage];
    if (v62)
    {
      v63 = (__n128 *)v150;
      [v62 maxFrameDuration];
    }
    else
    {
      memset(v150, 0, sizeof(v150));
      v63 = (__n128 *)v150;
    }
LABEL_108:
    BOOL v68 = *(__n128 **)(*(void *)(a1 + 184) + 8);
    __n128 result = *v63;
    v68[2] = *v63;
    v68[3].n128_u64[0] = v63[1].n128_u64[0];
    goto LABEL_109;
  }
  v64 = (CMTime *)(*(void *)(*(void *)(a1 + 184) + 8) + 32);
  int v65 = (void *)[*(id *)(*(void *)(a1 + 32) + 144) videoFrameRateRangeForCenterStage];
  if (v65) {
    [v65 minFrameDuration];
  }
  else {
    memset(&v149, 0, sizeof(v149));
  }
  CMTime v173 = *v64;
  if (CMTimeCompare(&v173, &v149) < 0)
  {
    v66 = (void *)[*(id *)(*(void *)(a1 + 32) + 144) videoFrameRateRangeForCenterStage];
    if (v66)
    {
      v63 = (__n128 *)v148;
      [v66 minFrameDuration];
    }
    else
    {
      memset(v148, 0, sizeof(v148));
      v63 = (__n128 *)v148;
    }
    goto LABEL_108;
  }
LABEL_109:
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 112) + 8) + 24)) {
    goto LABEL_142;
  }
  uint64_t v69 = *(void *)(*(void *)(a1 + 176) + 8);
  if (*(unsigned char *)(v69 + 44))
  {
    long long v70 = (CMTime *)(v69 + 32);
    uint64_t v71 = (void *)[*(id *)(*(void *)(a1 + 32) + 144) videoFrameRateRangeForBackgroundBlur];
    if (v71) {
      [v71 minFrameDuration];
    }
    else {
      memset(&v147, 0, sizeof(v147));
    }
    CMTime v173 = *v70;
    if (CMTimeCompare(&v173, &v147) < 0)
    {
      long long v74 = (void *)[*(id *)(*(void *)(a1 + 32) + 144) videoFrameRateRangeForBackgroundBlur];
      if (v74)
      {
        long long v75 = (__n128 *)v146;
        [v74 minFrameDuration];
      }
      else
      {
        memset(v146, 0, sizeof(v146));
        long long v75 = (__n128 *)v146;
      }
      goto LABEL_125;
    }
    long long v72 = (CMTime *)(*(void *)(*(void *)(a1 + 176) + 8) + 32);
    long long v73 = (void *)[*(id *)(*(void *)(a1 + 32) + 144) videoFrameRateRangeForBackgroundBlur];
    if (v73) {
      [v73 maxFrameDuration];
    }
    else {
      memset(&v145, 0, sizeof(v145));
    }
    CMTime v173 = *v72;
    if (CMTimeCompare(&v173, &v145) >= 1)
    {
      long long v76 = (void *)[*(id *)(*(void *)(a1 + 32) + 144) videoFrameRateRangeForBackgroundBlur];
      if (v76)
      {
        long long v75 = (__n128 *)v144;
        [v76 maxFrameDuration];
      }
      else
      {
        memset(v144, 0, sizeof(v144));
        long long v75 = (__n128 *)v144;
      }
LABEL_125:
      long long v77 = *(__n128 **)(*(void *)(a1 + 176) + 8);
      __n128 result = *v75;
      v77[2] = *v75;
      v77[3].n128_u64[0] = v75[1].n128_u64[0];
    }
  }
  uint64_t v78 = *(void *)(*(void *)(a1 + 184) + 8);
  if ((*(unsigned char *)(v78 + 44) & 1) == 0) {
    goto LABEL_142;
  }
  long long v79 = (CMTime *)(v78 + 32);
  long long v80 = (void *)[*(id *)(*(void *)(a1 + 32) + 144) videoFrameRateRangeForBackgroundBlur];
  if (v80) {
    [v80 minFrameDuration];
  }
  else {
    memset(&v143, 0, sizeof(v143));
  }
  CMTime v173 = *v79;
  if (CMTimeCompare(&v173, &v143) < 0)
  {
    long long v83 = (void *)[*(id *)(*(void *)(a1 + 32) + 144) videoFrameRateRangeForBackgroundBlur];
    if (v83)
    {
      long long v84 = (__n128 *)v142;
      [v83 minFrameDuration];
    }
    else
    {
      memset(v142, 0, sizeof(v142));
      long long v84 = (__n128 *)v142;
    }
    goto LABEL_141;
  }
  uint64_t v81 = (CMTime *)(*(void *)(*(void *)(a1 + 184) + 8) + 32);
  long long v82 = (void *)[*(id *)(*(void *)(a1 + 32) + 144) videoFrameRateRangeForBackgroundBlur];
  if (v82) {
    [v82 maxFrameDuration];
  }
  else {
    memset(&v141, 0, sizeof(v141));
  }
  CMTime v173 = *v81;
  if (CMTimeCompare(&v173, &v141) >= 1)
  {
    long long v85 = (void *)[*(id *)(*(void *)(a1 + 32) + 144) videoFrameRateRangeForBackgroundBlur];
    if (v85)
    {
      long long v84 = (__n128 *)v140;
      [v85 maxFrameDuration];
    }
    else
    {
      memset(v140, 0, sizeof(v140));
      long long v84 = (__n128 *)v140;
    }
LABEL_141:
    objc_super v86 = *(__n128 **)(*(void *)(a1 + 184) + 8);
    __n128 result = *v84;
    v86[2] = *v84;
    v86[3].n128_u64[0] = v84[1].n128_u64[0];
  }
LABEL_142:
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 128) + 8) + 24)) {
    goto LABEL_175;
  }
  uint64_t v87 = *(void *)(*(void *)(a1 + 176) + 8);
  if (*(unsigned char *)(v87 + 44))
  {
    v88 = (CMTime *)(v87 + 32);
    v89 = (void *)[*(id *)(*(void *)(a1 + 32) + 144) videoFrameRateRangeForStudioLight];
    if (v89) {
      [v89 minFrameDuration];
    }
    else {
      memset(&v139, 0, sizeof(v139));
    }
    CMTime v173 = *v88;
    if (CMTimeCompare(&v173, &v139) < 0)
    {
      v92 = (void *)[*(id *)(*(void *)(a1 + 32) + 144) videoFrameRateRangeForStudioLight];
      if (v92)
      {
        v93 = (__n128 *)v138;
        [v92 minFrameDuration];
      }
      else
      {
        memset(v138, 0, sizeof(v138));
        v93 = (__n128 *)v138;
      }
      goto LABEL_158;
    }
    v90 = (CMTime *)(*(void *)(*(void *)(a1 + 176) + 8) + 32);
    v91 = (void *)[*(id *)(*(void *)(a1 + 32) + 144) videoFrameRateRangeForStudioLight];
    if (v91) {
      [v91 maxFrameDuration];
    }
    else {
      memset(&v137, 0, sizeof(v137));
    }
    CMTime v173 = *v90;
    if (CMTimeCompare(&v173, &v137) >= 1)
    {
      v94 = (void *)[*(id *)(*(void *)(a1 + 32) + 144) videoFrameRateRangeForStudioLight];
      if (v94)
      {
        v93 = (__n128 *)v136;
        [v94 maxFrameDuration];
      }
      else
      {
        memset(v136, 0, sizeof(v136));
        v93 = (__n128 *)v136;
      }
LABEL_158:
      v95 = *(__n128 **)(*(void *)(a1 + 176) + 8);
      __n128 result = *v93;
      v95[2] = *v93;
      v95[3].n128_u64[0] = v93[1].n128_u64[0];
    }
  }
  uint64_t v96 = *(void *)(*(void *)(a1 + 184) + 8);
  if ((*(unsigned char *)(v96 + 44) & 1) == 0) {
    goto LABEL_175;
  }
  v97 = (CMTime *)(v96 + 32);
  v98 = (void *)[*(id *)(*(void *)(a1 + 32) + 144) videoFrameRateRangeForStudioLight];
  if (v98) {
    [v98 minFrameDuration];
  }
  else {
    memset(&v135, 0, sizeof(v135));
  }
  CMTime v173 = *v97;
  if (CMTimeCompare(&v173, &v135) < 0)
  {
    v101 = (void *)[*(id *)(*(void *)(a1 + 32) + 144) videoFrameRateRangeForStudioLight];
    if (v101)
    {
      v102 = (__n128 *)v134;
      [v101 minFrameDuration];
    }
    else
    {
      memset(v134, 0, sizeof(v134));
      v102 = (__n128 *)v134;
    }
    goto LABEL_174;
  }
  v99 = (CMTime *)(*(void *)(*(void *)(a1 + 184) + 8) + 32);
  v100 = (void *)[*(id *)(*(void *)(a1 + 32) + 144) videoFrameRateRangeForStudioLight];
  if (v100) {
    [v100 maxFrameDuration];
  }
  else {
    memset(&v133, 0, sizeof(v133));
  }
  CMTime v173 = *v99;
  if (CMTimeCompare(&v173, &v133) >= 1)
  {
    v103 = (void *)[*(id *)(*(void *)(a1 + 32) + 144) videoFrameRateRangeForStudioLight];
    if (v103)
    {
      v102 = (__n128 *)v132;
      [v103 maxFrameDuration];
    }
    else
    {
      memset(v132, 0, sizeof(v132));
      v102 = (__n128 *)v132;
    }
LABEL_174:
    v104 = *(__n128 **)(*(void *)(a1 + 184) + 8);
    __n128 result = *v102;
    v104[2] = *v102;
    v104[3].n128_u64[0] = v102[1].n128_u64[0];
  }
LABEL_175:
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 160) + 8) + 24)) {
    return result;
  }
  uint64_t v105 = *(void *)(*(void *)(a1 + 176) + 8);
  if ((*(unsigned char *)(v105 + 44) & 1) == 0) {
    goto LABEL_192;
  }
  v106 = (CMTime *)(v105 + 32);
  v107 = (void *)[*(id *)(*(void *)(a1 + 32) + 144) videoFrameRateRangeForBackgroundReplacement];
  if (v107) {
    [v107 minFrameDuration];
  }
  else {
    memset(&v131, 0, sizeof(v131));
  }
  CMTime v173 = *v106;
  if (CMTimeCompare(&v173, &v131) < 0)
  {
    v110 = (void *)[*(id *)(*(void *)(a1 + 32) + 144) videoFrameRateRangeForBackgroundReplacement];
    if (v110)
    {
      v111 = (__n128 *)v130;
      [v110 minFrameDuration];
    }
    else
    {
      memset(v130, 0, sizeof(v130));
      v111 = (__n128 *)v130;
    }
  }
  else
  {
    v108 = (CMTime *)(*(void *)(*(void *)(a1 + 176) + 8) + 32);
    v109 = (void *)[*(id *)(*(void *)(a1 + 32) + 144) videoFrameRateRangeForBackgroundReplacement];
    if (v109) {
      [v109 maxFrameDuration];
    }
    else {
      memset(&v129, 0, sizeof(v129));
    }
    CMTime v173 = *v108;
    if (CMTimeCompare(&v173, &v129) < 1) {
      goto LABEL_192;
    }
    v112 = (void *)[*(id *)(*(void *)(a1 + 32) + 144) videoFrameRateRangeForBackgroundReplacement];
    if (v112)
    {
      v111 = (__n128 *)v128;
      [v112 maxFrameDuration];
    }
    else
    {
      memset(v128, 0, sizeof(v128));
      v111 = (__n128 *)v128;
    }
  }
  v113 = *(__n128 **)(*(void *)(a1 + 176) + 8);
  __n128 result = *v111;
  v113[2] = *v111;
  v113[3].n128_u64[0] = v111[1].n128_u64[0];
LABEL_192:
  uint64_t v114 = *(void *)(*(void *)(a1 + 184) + 8);
  if ((*(unsigned char *)(v114 + 44) & 1) == 0) {
    return result;
  }
  v115 = (CMTime *)(v114 + 32);
  v116 = (void *)[*(id *)(*(void *)(a1 + 32) + 144) videoFrameRateRangeForBackgroundReplacement];
  if (v116) {
    [v116 minFrameDuration];
  }
  else {
    memset(&v127, 0, sizeof(v127));
  }
  CMTime v173 = *v115;
  if (CMTimeCompare(&v173, &v127) < 0)
  {
    v119 = (void *)[*(id *)(*(void *)(a1 + 32) + 144) videoFrameRateRangeForBackgroundReplacement];
    if (v119)
    {
      v120 = (__n128 *)v126;
      [v119 minFrameDuration];
    }
    else
    {
      memset(v126, 0, sizeof(v126));
      v120 = (__n128 *)v126;
    }
    goto LABEL_207;
  }
  v117 = (CMTime *)(*(void *)(*(void *)(a1 + 184) + 8) + 32);
  v118 = (void *)[*(id *)(*(void *)(a1 + 32) + 144) videoFrameRateRangeForBackgroundReplacement];
  if (v118) {
    [v118 maxFrameDuration];
  }
  else {
    memset(&v125, 0, sizeof(v125));
  }
  CMTime v173 = *v117;
  if (CMTimeCompare(&v173, &v125) >= 1)
  {
    v121 = (void *)[*(id *)(*(void *)(a1 + 32) + 144) videoFrameRateRangeForBackgroundReplacement];
    if (v121)
    {
      v120 = (__n128 *)v124;
      [v121 maxFrameDuration];
    }
    else
    {
      memset(v124, 0, sizeof(v124));
      v120 = (__n128 *)v124;
    }
LABEL_207:
    v122 = *(__n128 **)(*(void *)(a1 + 184) + 8);
    __n128 result = *v120;
    v122[2] = *v120;
    v122[3].n128_u64[0] = v120[1].n128_u64[0];
  }
  return result;
}

uint64_t __66__AVCaptureFigVideoDevice__updateReactionEffectsActiveForEnabled___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(unsigned char *)(*(void *)(a1 + 32) + 1264);
  uint64_t result = [*(id *)(a1 + 32) _reactionEffectsActiveForEnabled:*(unsigned __int8 *)(a1 + 56)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)_reactionEffectsActiveForEnabled:(BOOL)a3
{
  if (!a3 || ![(AVCaptureDeviceFormat *)self->_activeFormat reactionEffectsSupported]) {
    return 0;
  }

  return +[AVCaptureDevice isEligibleForReactionEffects];
}

uint64_t __65__AVCaptureFigVideoDevice__updateStudioLightingActiveForEnabled___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(unsigned char *)(*(void *)(a1 + 32) + 1261);
  uint64_t result = [*(id *)(a1 + 32) _isStudioLightingActiveForEnabled:*(unsigned __int8 *)(a1 + 56)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)_isStudioLightingActiveForEnabled:(BOOL)a3
{
  if (!a3 || ![(AVCaptureDeviceFormat *)self->_activeFormat isStudioLightSupported]) {
    return 0;
  }

  return +[AVCaptureDevice isEligibleForStudioLighting];
}

uint64_t __65__AVCaptureFigVideoDevice__updateBackgroundBlurActiveForEnabled___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(unsigned char *)(*(void *)(a1 + 32) + 1258);
  uint64_t result = [*(id *)(a1 + 32) _isBackgroundBlurActiveForEnabled:*(unsigned __int8 *)(a1 + 56)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)_isBackgroundBlurActiveForEnabled:(BOOL)a3
{
  if (!a3 || ![(AVCaptureDeviceFormat *)self->_activeFormat isBackgroundBlurSupported]) {
    return 0;
  }

  return +[AVCaptureDevice isEligibleForBackgroundBlur];
}

- (BOOL)_isCenterStageActiveForEnabled:(BOOL)a3
{
  if (a3)
  {
    BOOL v4 = [(AVCaptureDeviceFormat *)self->_activeFormat isCenterStageSupported];
    if (v4)
    {
      if (LOBYTE(self->_stereoVideoCaptureStatus))
      {
        LOBYTE(v4) = 0;
      }
      else
      {
        int height_low = LOBYTE(self->_normalizedNonDestructiveCropSize.height);
        LOBYTE(v4) = height_low == [(AVCaptureFigVideoDevice *)self isGeometricDistortionCorrectionSupported];
      }
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (BOOL)_isBackgroundReplacementActiveForEnabled:(BOOL)a3
{
  if (!a3
    || ![(AVCaptureDeviceFormat *)self->_activeFormat isBackgroundReplacementSupported])
  {
    return 0;
  }

  return +[AVCaptureDevice isEligibleForBackgroundReplacement];
}

uint64_t __56__AVCaptureFigVideoDevice__setDepthDataDeliveryEnabled___block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  int v2 = *(unsigned __int8 *)(result + 64);
  uint64_t v3 = *(void *)(result + 32);
  if (v2 != *(unsigned __int8 *)(v3 + 944))
  {
    *(unsigned char *)(v3 + 944) = v2;
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
    *(_DWORD *)(*(void *)(result + 32) + 1144) = [*(id *)(*(void *)(result + 32) + 1136) figLevel];
    BOOL v4 = -[AVCaptureSystemPressureState initWithFigLevel:factors:recommendedFrameRateRangeForPortrait:]([AVCaptureSystemPressureState alloc], "initWithFigLevel:factors:recommendedFrameRateRangeForPortrait:", *(unsigned int *)(*(void *)(v1 + 32) + 1144), [*(id *)(*(void *)(v1 + 32) + 1136) factors], objc_msgSend(*(id *)(v1 + 32), "_recommendedFrameRateRangeForVideoFormat:depthFormat:figSystemPressureLevel:", *(void *)(*(void *)(v1 + 32) + 144), *(void *)(*(void *)(v1 + 32) + 152), *(unsigned int *)(*(void *)(v1 + 32) + 1144)));
    uint64_t result = [(AVCaptureSystemPressureState *)v4 isEqual:*(void *)(*(void *)(v1 + 32) + 1136)];
    if ((result & 1) == 0) {
      *(void *)(*(void *)(*(void *)(v1 + 48) + 8) + 40) = v4;
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(v1 + 56) + 8) + 24) = *(unsigned char *)(*(void *)(v1 + 32) + 960);
  return result;
}

uint64_t __43__AVCaptureFigVideoDevice__setFlashActive___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 746) = *(unsigned char *)(result + 40);
  return result;
}

uint64_t __102__AVCaptureFigVideoDevice__setActiveFormat_resetVideoZoomFactorAndMinMaxFrameDurations_sessionPreset___block_invoke_14(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 1149) = 0;
  return result;
}

- (BOOL)_isDepthDataDeliveryEnabled
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__AVCaptureFigVideoDevice__isDepthDataDeliveryEnabled__block_invoke;
  v5[3] = &unk_1E5A74078;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void *__43__AVCaptureFigVideoDevice_setExposureMode___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  char v3 = *(void **)(a1 + 32);
  uint64_t v4 = [*(id *)(a1 + 40) requestID];
  HIDWORD(v5) = HIDWORD(AVCaptureExposureDurationCurrent.value);
  long long v7 = *(_OWORD *)&AVCaptureExposureDurationCurrent.value;
  uint64_t v8 = 0;
  LODWORD(v5) = 2139095039;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v3 _setExposureWithMode:v2 duration:&v7 ISO:v4 requestID:0 newMaxFrameDuration:v5];
  uint64_t result = *(void **)(a1 + 40);
  if (result) {
    uint64_t result = (void *)[result setErrorCode:*(unsigned int *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
  }
  if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    *(void *)(*(void *)(a1 + 32) + 424) = *(void *)(a1 + 56);
  }
  return result;
}

- (void)setExposurePointOfInterest:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  if ([(AVCaptureFigVideoDevice *)self isLockedForConfiguration])
  {
    if ([(AVCaptureFigVideoDevice *)self isExposurePointOfInterestSupported])
    {
      self->_exposurePointOfInterest.CGFloat x = x;
      self->_exposurePointOfInterest.CGFloat y = y;
      return;
    }
    uint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
    objc_opt_class();
  }
  else
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3A8];
    objc_opt_class();
  }
  uint64_t v8 = (void *)[v6 exceptionWithName:v7 reason:AVMethodExceptionReasonWithClassAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v8);
  }
  NSLog(&cfstr_SuppressingExc.isa, v8);
}

- (int)_setExposureWithMode:(int64_t)a3 duration:(id *)a4 ISO:(float)a5 requestID:(int)a6 newMaxFrameDuration:(id *)a7
{
  uint64_t v9 = *(void *)&a6;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if (a7) {
    *a7 = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(void *)&MEMORY[0x1E4F1F9F8];
  }
  if (!_FigIsCurrentDispatchQueue())
  {
    uint64_t v35 = v7;
    LODWORD(v34) = 0;
    FigDebugAssert3();
  }
  if (a3 != 1)
  {
    if (a3)
    {
      char v14 = 0;
      goto LABEL_11;
    }
    if (self->_exposureMode != 3)
    {
      char v14 = 0;
      a3 = 0;
      goto LABEL_11;
    }
  }
  char v14 = 1;
  a3 = 2;
LABEL_11:
  if (a3 != 3 && self->_exposureMode == 3)
  {
    double v15 = (double)self->_activeMinFrameDuration.timescale / (double)self->_activeMinFrameDuration.value;
    -[AVCaptureFigVideoDevice _setFigCaptureSourceProperty:withValue:cacheOnly:](self, "_setFigCaptureSourceProperty:withValue:cacheOnly:", *MEMORY[0x1E4F51F00], [NSNumber numberWithDouble:(double)self->_activeMaxFrameDuration.timescale / (double)self->_activeMaxFrameDuration.value], self->_cachesFigCaptureSourceConfigurationChanges);
    -[AVCaptureFigVideoDevice _setFigCaptureSourceProperty:withValue:cacheOnly:](self, "_setFigCaptureSourceProperty:withValue:cacheOnly:", *MEMORY[0x1E4F51EF8], [NSNumber numberWithDouble:v15], self->_cachesFigCaptureSourceConfigurationChanges);
  }
  uint64_t v16 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", v34, v35);
  uint64_t v17 = [NSNumber numberWithInteger:a3];
  [v16 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F51D48]];
  if (a3 != 3)
  {
    if (a3 != 2) {
      goto LABEL_31;
    }
    if ([(AVCaptureFigVideoDevice *)self isExposurePointOfInterestSupported])
    {
      size.CMTimeValue value = 0;
      *(void *)&size.CMTimeScale timescale = 0;
      double x = self->_exposurePointOfInterest.x;
      BOOL v19 = self->_exposurePointOfInterest.y == 0.5 && x == 0.5;
      float v20 = (void *)MEMORY[0x1E4F51B30];
      if (!v19) {
        float v20 = (void *)MEMORY[0x1E4F51B38];
      }
      CGSizeMakeWithDictionaryRepresentation((CFDictionaryRef)-[NSDictionary objectForKeyedSubscript:](self->_fcsAttributes, "objectForKeyedSubscript:", *v20, x), (CGSize *)&size);
      objc_msgSend(v16, "setObject:forKeyedSubscript:", fvd_cgRectDictionaryForCenterAndSize(self->_exposurePointOfInterest.x, self->_exposurePointOfInterest.y, *(double *)&size.value, *(double *)&size.timescale), *MEMORY[0x1E4F51D50]);
    }
    uint64_t v21 = [NSNumber numberWithInt:*(unsigned int *)&self->_torchAvailable];
    uint64_t v22 = (void *)MEMORY[0x1E4F51D98];
    goto LABEL_30;
  }
  CFAllocatorRef v23 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CMTime size = (CMTime)*a4;
  CFDictionaryRef v24 = CMTimeCopyAsDictionary(&size, v23);
  [v16 setObject:v24 forKeyedSubscript:*MEMORY[0x1E4F51D38]];

  int64_t var3 = a4->var3;
  *(_OWORD *)&self->_manualWhiteBalanceControlRequests = *(_OWORD *)&a4->var0;
  *(void *)&self->_lastCustomExposureDuration.CMTimeScale timescale = var3;
  CMTimeValue value = self->_activeMaxFrameDuration.value;
  CMTimeScale timescale = self->_activeMaxFrameDuration.timescale;
  uint64_t v28 = *(void *)&self->_activeMaxFrameDuration.flags;
  int epoch_high = HIDWORD(self->_activeMaxFrameDuration.epoch);
  CMTime size = (CMTime)*a4;
  uint64_t v38 = v28;
  memset(&time2, 0, sizeof(time2));
  if (CMTimeCompare(&size, &time2))
  {
    CMTime size = (CMTime)*a4;
    time2.CMTimeValue value = value;
    time2.CMTimeScale timescale = timescale;
    *(void *)&time2.flags = v38;
    HIDWORD(time2.epoch) = epoch_high;
    if (CMTimeCompare(&size, &time2) >= 1)
    {
      CMTimeMake(&size, 1, vcvtmd_s64_f64((double)a4->var1 / (double)a4->var0));
      CMTimeValue value = size.value;
      CMTimeScale timescale = size.timescale;
      uint64_t v38 = *(void *)&size.flags;
      int epoch_high = HIDWORD(size.epoch);
      if (a7)
      {
        a7->var0 = size.value;
        a7->var1 = timescale;
        *(void *)&a7->var2 = v38;
        HIDWORD(a7->var3) = epoch_high;
      }
    }
  }
  uint64_t v29 = [NSNumber numberWithDouble:(double)timescale / (double)value];
  [v16 setObject:v29 forKeyedSubscript:*MEMORY[0x1E4F51D30]];
  uint64_t v30 = [NSNumber numberWithDouble:(double)self->_activeMinFrameDuration.timescale / (double)self->_activeMinFrameDuration.value];
  [v16 setObject:v30 forKeyedSubscript:*MEMORY[0x1E4F51D28]];
  *(float *)&double v31 = a5;
  uint64_t v32 = [NSNumber numberWithFloat:v31];
  [v16 setObject:v32 forKeyedSubscript:*MEMORY[0x1E4F51D40]];
  *(float *)&self->_lastCustomExposureDuration.epoch = a5;
  if (v9)
  {
    uint64_t v21 = [NSNumber numberWithInt:v9];
    uint64_t v22 = (void *)MEMORY[0x1E4F51D58];
LABEL_30:
    [v16 setObject:v21 forKeyedSubscript:*v22];
  }
LABEL_31:
  int result = [(AVCaptureFigVideoDevice *)self _setFigCaptureSourceProperty:*MEMORY[0x1E4F51FF8] withValue:v16];
  if (!result) {
    BYTE5(self->_activeMaxExposureDurationClientOverride.epoch) = v14;
  }
  return result;
}

- (BOOL)isExposurePointOfInterestSupported
{
  id v2 = [(NSDictionary *)self->_fcsAttributes objectForKeyedSubscript:*MEMORY[0x1E4F51B78]];

  return [v2 BOOLValue];
}

- (void)setFocusPointOfInterest:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  if ([(AVCaptureFigVideoDevice *)self isLockedForConfiguration])
  {
    if ([(AVCaptureFigVideoDevice *)self isFocusPointOfInterestSupported])
    {
      self->_focusPointOfInterest.CGFloat x = x;
      self->_focusPointOfInterest.CGFloat y = y;
      return;
    }
    uint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
    objc_opt_class();
  }
  else
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3A8];
    objc_opt_class();
  }
  uint64_t v8 = (void *)[v6 exceptionWithName:v7 reason:AVMethodExceptionReasonWithClassAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v8);
  }
  NSLog(&cfstr_SuppressingExc.isa, v8);
}

- (int)_setFocusWithMode:(int64_t)a3 lensPosition:(float)a4 requestID:(int)a5
{
  uint64_t v6 = *(void *)&a5;
  if (!_FigIsCurrentDispatchQueue())
  {
    uint64_t v26 = v5;
    LODWORD(v25) = 0;
    FigDebugAssert3();
  }
  uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", v25, v26);
  uint64_t v11 = v10;
  if (a3)
  {
    if ((unint64_t)a3 <= 2)
    {
      uint64_t v12 = [NSNumber numberWithInteger:a3];
      [v11 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F51DA0]];
      if ([(AVCaptureFigVideoDevice *)self isAutoFocusRangeRestrictionSupported])
      {
        uint64_t v13 = [NSNumber numberWithInteger:self->_autoFocusRangeRestriction];
        [v11 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F51DB0]];
      }
      if ([(AVCaptureFigVideoDevice *)self isSmoothAutoFocusSupported])
      {
        uint64_t v14 = [NSNumber numberWithBool:self->_smoothAutoFocusEnabled];
        [v11 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F51DC8]];
      }
      if ([(AVCaptureFigVideoDevice *)self isFocusPointOfInterestSupported])
      {
        size.width = 0.0;
        size.height = 0.0;
        if (a3 != 2
          || (CFDictionaryRef v15 = [(NSDictionary *)self->_fcsAttributes objectForKeyedSubscript:*MEMORY[0x1E4F51B50]]) == 0|| (CGSizeMakeWithDictionaryRepresentation(v15, &size), (v16 = fvd_cgRectDictionaryForCenterAndSize(self->_focusPointOfInterest.x, self->_focusPointOfInterest.y, size.width, size.height)) == 0))
        {
          double x = self->_focusPointOfInterest.x;
          BOOL v18 = self->_focusPointOfInterest.y == 0.5 && x == 0.5;
          BOOL v19 = (void *)MEMORY[0x1E4F51B40];
          if (!v18) {
            BOOL v19 = (void *)MEMORY[0x1E4F51B48];
          }
          CGSizeMakeWithDictionaryRepresentation((CFDictionaryRef)-[NSDictionary objectForKeyedSubscript:](self->_fcsAttributes, "objectForKeyedSubscript:", *v19, x), &size);
          CFDictionaryRef v16 = fvd_cgRectDictionaryForCenterAndSize(self->_focusPointOfInterest.x, self->_focusPointOfInterest.y, size.width, size.height);
        }
        [v11 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4F51DB8]];
      }
      uint64_t v20 = [NSNumber numberWithInt:*(unsigned int *)&self->_torchAvailable];
      uint64_t v21 = (void *)MEMORY[0x1E4F51D98];
      goto LABEL_23;
    }
  }
  else
  {
    [v10 setObject:&unk_1EF4FA730 forKeyedSubscript:*MEMORY[0x1E4F51DA0]];
    *(float *)&double v22 = a4;
    uint64_t v23 = [NSNumber numberWithFloat:v22];
    [v11 setObject:v23 forKeyedSubscript:*MEMORY[0x1E4F51DA8]];
    if (v6)
    {
      uint64_t v20 = [NSNumber numberWithInt:v6];
      uint64_t v21 = (void *)MEMORY[0x1E4F51DC0];
LABEL_23:
      [v11 setObject:v20 forKeyedSubscript:*v21];
    }
  }
  return [(AVCaptureFigVideoDevice *)self _setFigCaptureSourceProperty:*MEMORY[0x1E4F52040] withValue:v11];
}

- (BOOL)isFocusPointOfInterestSupported
{
  id v2 = [(NSDictionary *)self->_fcsAttributes objectForKeyedSubscript:*MEMORY[0x1E4F51BA0]];

  return [v2 BOOLValue];
}

- (BOOL)isSmoothAutoFocusSupported
{
  id v2 = [(NSDictionary *)self->_fcsAttributes objectForKeyedSubscript:*MEMORY[0x1E4F51C50]];

  return [v2 BOOLValue];
}

- (BOOL)isAutoFocusRangeRestrictionSupported
{
  id v2 = [(NSDictionary *)self->_fcsAttributes objectForKeyedSubscript:*MEMORY[0x1E4F51B00]];

  return [v2 BOOLValue];
}

uint64_t __76__AVCaptureFigVideoDevice__setFigCaptureSourceProperty_withValue_cacheOnly___block_invoke(uint64_t result)
{
  uint64_t v1 = (void *)result;
  if (!*(unsigned char *)(result + 64))
  {
    uint64_t v2 = *(void *)(result + 40);
    uint64_t v3 = *(void *)(*(void *)(result + 32) + 56);
    uint64_t v4 = *(void *)(result + 56);
    uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v5) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
    uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 56);
    if (v7) {
      int result = v7(v3, v4, v2);
    }
    else {
      int result = 4294954514;
    }
    *(_DWORD *)(*(void *)(v1[6] + 8) + 24) = result;
  }
  uint64_t v8 = *(void *)(v1[6] + 8);
  int v9 = *(_DWORD *)(v8 + 24);
  if (v9 == -16453)
  {
    *(_DWORD *)(v8 + 24) = 0;
    int v9 = *(_DWORD *)(*(void *)(v1[6] + 8) + 24);
  }
  if (!v9)
  {
    uint64_t v10 = v1[5];
    uint64_t v11 = *(void **)(v1[4] + 1128);
    uint64_t v12 = v1[7];
    return [v11 setObject:v10 forKeyedSubscript:v12];
  }
  return result;
}

uint64_t __45__AVCaptureFigVideoDevice_isRampingVideoZoom__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(float *)(*(void *)(result + 32) + 868) != 0.0;
  return result;
}

uint64_t __53__AVCaptureFigVideoDevice__setAdjustingWhiteBalance___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 576) = *(unsigned char *)(result + 40);
  return result;
}

uint64_t __59__AVCaptureFigVideoDevice__setMinAvailableVideoZoomFactor___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(double *)(result + 48) != *(double *)(*(void *)(result + 32) + 880);
  return result;
}

uint64_t __59__AVCaptureFigVideoDevice__setMaxAvailableVideoZoomFactor___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(double *)(result + 48) != *(double *)(*(void *)(result + 32) + 888);
  return result;
}

uint64_t __40__AVCaptureFigVideoDevice_setTorchMode___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 776) = *(void *)(result + 40);
  return result;
}

uint64_t __46__AVCaptureFigVideoDevice_isVideoHDRSuspended__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 846);
  return result;
}

uint64_t __62__AVCaptureFigVideoDevice_setActiveDepthDataMinFrameDuration___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 152), "videoSupportedFrameRateRanges"), "lastObject");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)setFallbackPrimaryConstituentDevices:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ([(AVCaptureFigVideoDevice *)self _isBravoVariant]
    && !self->_primaryConstituentDeviceRestrictedSwitchingBehaviorConditions)
  {
    [(AVCaptureFigVideoDevice *)self _populateSupportedFallbackPrimaryConstituentDevices];
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(a3);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        if (([self->_primaryConstituentDeviceRestrictedSwitchingBehaviorConditions containsObject:v9] & 1) == 0)
        {
          uint64_t v10 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v11 = *MEMORY[0x1E4F1C3C8];
          objc_opt_class();
          uint64_t v12 = objc_msgSend(v10, "exceptionWithName:reason:userInfo:", v11, AVMethodExceptionReasonWithClassAndSelector(), 0, v9);
          if (AVCaptureShouldThrowForAPIViolations()) {
            objc_exception_throw(v12);
          }
          NSLog(&cfstr_SuppressingExc.isa, v12);
          return;
        }
      }
      uint64_t v6 = [a3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  if (![(NSArray *)self->_supportedFallbackPrimaryConstituentDevices isEqualToArray:a3]) {
    [(AVCaptureFigVideoDevice *)self _setFallbackPrimaryConstituentDevices:a3];
  }
}

- (void)_updateFallbackPrimaryConstituentDevicesForDepthDataDeliveryEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if (!self->_primaryConstituentDeviceRestrictedSwitchingBehaviorConditions) {
    [(AVCaptureFigVideoDevice *)self _populateSupportedFallbackPrimaryConstituentDevices];
  }
  id v5 = [(NSArray *)[(AVCaptureDevice *)self constituentDevices] firstObject];
  if (v3)
  {
    if (![(NSArray *)self->_supportedFallbackPrimaryConstituentDevices containsObject:v5]) {
      return;
    }
    id v6 = (id)[(NSArray *)self->_supportedFallbackPrimaryConstituentDevices mutableCopy];
    [v6 removeObject:v5];
  }
  else
  {
    if (!self->_widestFallbackPrimaryConstituentDeviceRemovedForDepthDataDelivery
      || [(NSArray *)self->_supportedFallbackPrimaryConstituentDevices containsObject:v5])
    {
      return;
    }
    id v6 = (id)[(NSArray *)self->_supportedFallbackPrimaryConstituentDevices mutableCopy];
    [v6 addObject:v5];
  }
  if (v6)
  {
    if (![(AVCaptureFigVideoDevice *)self _setFallbackPrimaryConstituentDevices:v6])self->_widestFallbackPrimaryConstituentDeviceRemovedForDepthDataDeliverCGFloat y = v3; {
  }
    }
}

- (void)_populateSupportedFallbackPrimaryConstituentDevices
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!self->_primaryConstituentDeviceRestrictedSwitchingBehaviorConditions)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v4 = [(AVCaptureFigVideoDevice *)self _copyFigCaptureSourceProperty:*MEMORY[0x1E4F52128]];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = [(AVCaptureDevice *)self constituentDevices];
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if (objc_msgSend(v4, "containsObject:", objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v10, "figCaptureSourceDeviceType"))))objc_msgSend(v3, "addObject:", v10); {
        }
          }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
    uint64_t v11 = (void *)[v3 copy];
    self->_primaryConstituentDeviceRestrictedSwitchingBehaviorConditions = (unint64_t)v11;
    if (!self->_supportedFallbackPrimaryConstituentDevices) {
      self->_supportedFallbackPrimaryConstituentDevices = (NSArray *)v11;
    }
  }
}

void __50__AVCaptureFigVideoDevice__setUpCameraHistoryOnce__block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  sUserPreferredCameraHistoryKeCGFloat y = (uint64_t)+[AVCaptureFigVideoDevice _userPreferredCameraHistoryKeyForClientPreferencesDomain:AVCaptureClientPreferencesDomain()];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v25 = MEMORY[0x1E4F143A8];
  uint64_t v26 = 3221225472;
  long long v27 = __50__AVCaptureFigVideoDevice__setUpCameraHistoryOnce__block_invoke_2;
  uint64_t v28 = &unk_1E5A72DB8;
  uint64_t v29 = v2;
  +[AVCaptureProprietaryDefaultsSingleton addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:](AVCaptureProprietaryDefaultsSingleton, "addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:");
  sUserPreferredCameraOverrideHistoryKeCGFloat y = [[NSString alloc] initWithFormat:@"%@/override/%@", @"camera-history", @"preferred-camera-history"];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  double v22 = __50__AVCaptureFigVideoDevice__setUpCameraHistoryOnce__block_invoke_35;
  uint64_t v23 = &unk_1E5A72DB8;
  uint64_t v24 = v3;
  +[AVCaptureProprietaryDefaultsSingleton addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:](AVCaptureProprietaryDefaultsSingleton, "addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:");
  sStreamingCameraHistoryKeCGFloat y = [[NSString alloc] initWithFormat:@"%@/system-wide/%@", @"camera-history", @"streaming-camera-history"];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  uint64_t v17 = __50__AVCaptureFigVideoDevice__setUpCameraHistoryOnce__block_invoke_40;
  uint64_t v18 = &unk_1E5A72DB8;
  uint64_t v19 = v4;
  +[AVCaptureProprietaryDefaultsSingleton addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:](AVCaptureProprietaryDefaultsSingleton, "addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:");
  sCameraHistoryHasBeenSetUp = 1;
  if (dword_1EB4C9280)
  {
    unsigned int v14 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  uint64_t v6 = +[AVCaptureFigVideoDevice _cameraHistoryDispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__AVCaptureFigVideoDevice__setUpCameraHistoryOnce__block_invoke_42;
  block[3] = &unk_1E5A72ED0;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(v6, block);
  if (dword_1EB4C9280)
  {
    unsigned int v14 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    uint64_t v7 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v8 = v14;
    if (os_log_type_enabled(v7, type)) {
      unsigned int v9 = v8;
    }
    else {
      unsigned int v9 = v8 & 0xFFFFFFFE;
    }
    if (v9)
    {
      int v30 = 136315138;
      double v31 = "+[AVCaptureFigVideoDevice _setUpCameraHistoryOnce]_block_invoke_2";
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

+ (id)_userPreferredCameraHistoryKeyForClientPreferencesDomain:(id)a3
{
  uint64_t v3 = [a3 stringByReplacingOccurrencesOfString:@"." withString:@"-"];
  return (id)[NSString stringWithFormat:@"%@/%@/%@", @"camera-history", v3, @"preferred-camera-history"];
}

+ (id)systemPreferredCamera
{
  v14[18] = *MEMORY[0x1E4F143B8];
  [a1 _setUpCameraHistoryOnce];
  os_unfair_lock_lock((os_unfair_lock_t)&sCameraHistoryLock);
  id v2 = (id)sSystemPreferredCamera;
  int v3 = sAllowsSuspendedPreferredCameras;
  os_unfair_lock_unlock((os_unfair_lock_t)&sCameraHistoryLock);
  if (!v2)
  {
    if (dword_1EB4C9280)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    uint64_t v5 = *MEMORY[0x1E4F47C60];
    v14[0] = *MEMORY[0x1E4F47C68];
    v14[1] = v5;
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v14, 2, v9, v12);
    LOBYTE(v10) = 0;
    id v2 = +[AVCaptureFigVideoDevice _defaultDeviceWithDeviceType:@"All" mediaTypes:v6 position:0 cameraOverrideHistoryAllowed:1 cameraOverrideHistorySuspendedAllowed:v3 != 0 wombatsMustBeMagic:1 userPreferredCameraHistorySuspendedAllowed:v10 invalidSpecialDeviceTypes:&unk_1EF4FAAE8];
    if (dword_1EB4C9280)
    {
      uint64_t v7 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    +[AVCaptureFigVideoDevice _insurePreferredCameraGlobal:&sSystemPreferredCamera, @"system", v2, v11, v13 globalName preferredCamera];
  }
  return v2;
}

+ (void)_refreshPreferredCameraProperties:(BOOL)a3
{
  BOOL v3 = a3;
  v30[18] = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)&sCameraHistoryLock);
  int v4 = sAllowsSuspendedPreferredCameras;
  os_unfair_lock_unlock((os_unfair_lock_t)&sCameraHistoryLock);
  if (dword_1EB4C9280)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  uint64_t v6 = *MEMORY[0x1E4F47C68];
  uint64_t v7 = *MEMORY[0x1E4F47C60];
  v30[0] = *MEMORY[0x1E4F47C68];
  v30[1] = v7;
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v30, 2, v21, v26);
  LOBYTE(v22) = v4 != 0;
  id v9 = +[AVCaptureFigVideoDevice _defaultDeviceWithDeviceType:@"All" mediaTypes:v8 position:0 cameraOverrideHistoryAllowed:0 cameraOverrideHistorySuspendedAllowed:0 wombatsMustBeMagic:0 userPreferredCameraHistorySuspendedAllowed:v22 invalidSpecialDeviceTypes:0];
  if (dword_1EB4C9280)
  {
    uint64_t v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v29[0] = v6;
  v29[1] = v7;
  uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v29, 2, v23, v27);
  LOBYTE(v24) = 0;
  id v12 = +[AVCaptureFigVideoDevice _defaultDeviceWithDeviceType:@"All" mediaTypes:v11 position:0 cameraOverrideHistoryAllowed:1 cameraOverrideHistorySuspendedAllowed:v4 != 0 wombatsMustBeMagic:1 userPreferredCameraHistorySuspendedAllowed:v24 invalidSpecialDeviceTypes:&unk_1EF4FAB00];
  if (!v4)
  {
    if ([v9 isSuspended])
    {
      if (dword_1EB4C9280)
      {
        uint64_t v13 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      id v9 = 0;
    }
    if (objc_msgSend(v12, "isSuspended", v25, v28))
    {
      if (dword_1EB4C9280)
      {
        unsigned int v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      id v12 = 0;
    }
  }
  os_unfair_lock_lock((os_unfair_lock_t)&sCameraHistoryLock);
  if (v9 == (id)sUserPreferredCamera) {
    int v15 = 0;
  }
  else {
    int v15 = objc_msgSend(v9, "isEqual:") ^ 1;
  }
  if (v12 == (id)sSystemPreferredCamera) {
    int v16 = 0;
  }
  else {
    int v16 = objc_msgSend(v12, "isEqual:") ^ 1;
  }
  if (dword_1EB4C9280)
  {
    uint64_t v17 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    if (dword_1EB4C9280)
    {
      uint64_t v18 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&sCameraHistoryLock);
  if ((v15 | v16) == 1)
  {
    if (v3)
    {
      if (v15) {
        [(id)objc_opt_class() willChangeValueForKey:@"userPreferredCamera"];
      }
      if (v16) {
        [(id)objc_opt_class() willChangeValueForKey:@"systemPreferredCamera"];
      }
    }
    if (v15)
    {
      if (!dword_1EB4C9280) {
        goto LABEL_34;
      }
    }
    else if (!dword_1EB4C9280)
    {
      goto LABEL_34;
    }
    uint64_t v19 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
LABEL_34:
    if (v16)
    {
      if (dword_1EB4C9280) {
        goto LABEL_38;
      }
    }
    else if (dword_1EB4C9280)
    {
LABEL_38:
      uint64_t v20 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    os_unfair_lock_lock((os_unfair_lock_t)&sCameraHistoryLock);
    if (v15)
    {

      sUserPreferredCamera = (uint64_t)v9;
    }
    if (v16)
    {

      sSystemPreferredCamera = (uint64_t)v12;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&sCameraHistoryLock);
    if (v3)
    {
      if (v15) {
        [(id)objc_opt_class() didChangeValueForKey:@"userPreferredCamera"];
      }
      if (v16) {
        [(id)objc_opt_class() didChangeValueForKey:@"systemPreferredCamera"];
      }
    }
  }
}

+ (id)_defaultDeviceWithDeviceType:(id)a3 mediaTypes:(id)a4 position:(int64_t)a5 cameraOverrideHistoryAllowed:(BOOL)a6 cameraOverrideHistorySuspendedAllowed:(BOOL)a7 wombatsMustBeMagic:(BOOL)a8 userPreferredCameraHistorySuspendedAllowed:(BOOL)a9 invalidSpecialDeviceTypes:(id)a10
{
  BOOL v10 = a8;
  BOOL v11 = a7;
  BOOL v12 = a6;
  uint64_t v148 = *MEMORY[0x1E4F143B8];
  +[AVCaptureFigVideoDevice _setUpCameraHistoryOnce];
  if (a5)
  {
    if (dword_1EB4C9280)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    return 0;
  }
  BOOL v108 = v11;
  BOOL v109 = v12;
  obuint64_t j = +[AVCaptureDevice devicesForDefaultDeviceSupport:0 includeAudioDevices:0];
  if (dword_1EB4C9280)
  {
    LODWORD(v128) = 0;
    type[0] = OS_LOG_TYPE_DEFAULT;
    uint64_t v17 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  id v111 = a3;
  BOOL v110 = v10;
  id v113 = (id)objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithArray:", obj, v100, v104);
  long long v122 = 0u;
  long long v123 = 0u;
  long long v124 = 0u;
  long long v125 = 0u;
  uint64_t v19 = [obj countByEnumeratingWithState:&v122 objects:v135 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v123;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v123 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = *(void **)(*((void *)&v122 + 1) + 8 * i);
        if (dword_1EB4C9280)
        {
          LODWORD(v128) = 0;
          type[0] = OS_LOG_TYPE_DEFAULT;
          uint64_t v24 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          unsigned int v25 = v128;
          if (os_log_type_enabled(v24, type[0])) {
            unsigned int v26 = v25;
          }
          else {
            unsigned int v26 = v25 & 0xFFFFFFFE;
          }
          if (v26)
          {
            int v140 = 136315395;
            CMTime v141 = "+[AVCaptureFigVideoDevice _defaultDeviceWithDeviceType:mediaTypes:position:cameraOverrideHistoryAllow"
                   "ed:cameraOverrideHistorySuspendedAllowed:wombatsMustBeMagic:userPreferredCameraHistorySuspendedAllowe"
                   "d:invalidSpecialDeviceTypes:]";
            __int16 v142 = 2113;
            *(void *)CMTime v143 = v23;
            LODWORD(v105) = 22;
            v101 = &v140;
            _os_log_send_and_compose_impl();
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        long long v120 = 0u;
        long long v121 = 0u;
        long long v118 = 0u;
        long long v119 = 0u;
        uint64_t v27 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v118, v134, 16, v101, v105);
        if (v27)
        {
          uint64_t v28 = v27;
          uint64_t v29 = *(void *)v119;
LABEL_21:
          uint64_t v30 = 0;
          while (1)
          {
            if (*(void *)v119 != v29) {
              objc_enumerationMutation(a4);
            }
            if ([v23 hasMediaType:*(void *)(*((void *)&v118 + 1) + 8 * v30)]) {
              break;
            }
            if (v28 == ++v30)
            {
              uint64_t v28 = [a4 countByEnumeratingWithState:&v118 objects:v134 count:16];
              if (v28) {
                goto LABEL_21;
              }
              goto LABEL_31;
            }
          }
          if (objc_msgSend(a10, "containsObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v23, "specialDeviceType"))) & 1) == 0&& ((objc_msgSend(v111, "isEqualToString:", @"All") & 1) != 0|| (objc_msgSend((id)objc_msgSend(v23, "deviceType"), "isEqualToString:", v111)))
          {
            continue;
          }
        }
LABEL_31:
        [v113 removeObject:v23];
      }
      uint64_t v20 = [obj countByEnumeratingWithState:&v122 objects:v135 count:16];
    }
    while (v20);
  }
  if (dword_1EB4C9280)
  {
    LODWORD(v128) = 0;
    type[0] = OS_LOG_TYPE_DEFAULT;
    double v31 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v32 = v128;
    if (os_log_type_enabled(v31, type[0])) {
      unsigned int v33 = v32;
    }
    else {
      unsigned int v33 = v32 & 0xFFFFFFFE;
    }
    if (v33)
    {
      int v140 = 136315138;
      CMTime v141 = "+[AVCaptureFigVideoDevice _defaultDeviceWithDeviceType:mediaTypes:position:cameraOverrideHistoryAllowed:cam"
             "eraOverrideHistorySuspendedAllowed:wombatsMustBeMagic:userPreferredCameraHistorySuspendedAllowed:invalidSpe"
             "cialDeviceTypes:]";
      LODWORD(v105) = 12;
      v101 = &v140;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    if (dword_1EB4C9280)
    {
      LODWORD(v128) = 0;
      type[0] = OS_LOG_TYPE_DEFAULT;
      uint64_t v34 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v35 = v128;
      if (os_log_type_enabled(v34, type[0])) {
        unsigned int v36 = v35;
      }
      else {
        unsigned int v36 = v35 & 0xFFFFFFFE;
      }
      if (v36)
      {
        int v140 = 136315394;
        CMTime v141 = "+[AVCaptureFigVideoDevice _defaultDeviceWithDeviceType:mediaTypes:position:cameraOverrideHistoryAllowed:c"
               "ameraOverrideHistorySuspendedAllowed:wombatsMustBeMagic:userPreferredCameraHistorySuspendedAllowed:invali"
               "dSpecialDeviceTypes:]";
        __int16 v142 = 2112;
        *(void *)CMTime v143 = a4;
        LODWORD(v105) = 22;
        v101 = &v140;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  long long v116 = 0u;
  long long v117 = 0u;
  long long v114 = 0u;
  long long v115 = 0u;
  uint64_t v37 = objc_msgSend(v113, "countByEnumeratingWithState:objects:count:", &v114, v133, 16, v101, v105);
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v115;
    do
    {
      for (uint64_t j = 0; j != v38; ++j)
      {
        if (*(void *)v115 != v39) {
          objc_enumerationMutation(v113);
        }
        if (dword_1EB4C9280)
        {
          uint64_t v41 = *(void *)(*((void *)&v114 + 1) + 8 * j);
          LODWORD(v128) = 0;
          type[0] = OS_LOG_TYPE_DEFAULT;
          uint64_t v42 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          unsigned int v43 = v128;
          if (os_log_type_enabled(v42, type[0])) {
            unsigned int v44 = v43;
          }
          else {
            unsigned int v44 = v43 & 0xFFFFFFFE;
          }
          if (v44)
          {
            int v140 = 136315395;
            CMTime v141 = "+[AVCaptureFigVideoDevice _defaultDeviceWithDeviceType:mediaTypes:position:cameraOverrideHistoryAllow"
                   "ed:cameraOverrideHistorySuspendedAllowed:wombatsMustBeMagic:userPreferredCameraHistorySuspendedAllowe"
                   "d:invalidSpecialDeviceTypes:]";
            __int16 v142 = 2113;
            *(void *)CMTime v143 = v41;
            LODWORD(v106) = 22;
            v102 = &v140;
            _os_log_send_and_compose_impl();
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
      }
      uint64_t v38 = [v113 countByEnumeratingWithState:&v114 objects:v133 count:16];
    }
    while (v38);
  }
  BOOL v45 = v10;
  if (dword_1EB4C9280)
  {
    LODWORD(v128) = 0;
    type[0] = OS_LOG_TYPE_DEFAULT;
    uint64_t v46 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v47 = v128;
    if (os_log_type_enabled(v46, type[0])) {
      unsigned int v48 = v47;
    }
    else {
      unsigned int v48 = v47 & 0xFFFFFFFE;
    }
    if (v48)
    {
      int v140 = 136315138;
      CMTime v141 = "+[AVCaptureFigVideoDevice _defaultDeviceWithDeviceType:mediaTypes:position:cameraOverrideHistoryAllowed:cam"
             "eraOverrideHistorySuspendedAllowed:wombatsMustBeMagic:userPreferredCameraHistorySuspendedAllowed:invalidSpe"
             "cialDeviceTypes:]";
      LODWORD(v106) = 12;
      v102 = &v140;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (!v109)
  {
    v55 = 0;
LABEL_82:
    os_unfair_lock_lock((os_unfair_lock_t)&sCameraHistoryLock);
    if (sUserPreferredCameraHistory) {
      uint64_t v49 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithArray:");
    }
    else {
      uint64_t v49 = 0;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&sCameraHistoryLock);
LABEL_86:
    if (v110 && !v55)
    {
      os_unfair_lock_lock((os_unfair_lock_t)&sCameraHistoryLock);
      if (sUserPreferredCameraOverrideHistory) {
        v55 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithArray:");
      }
      else {
        v55 = 0;
      }
      os_unfair_lock_unlock((os_unfair_lock_t)&sCameraHistoryLock);
    }
    if (objc_msgSend(v49, "count", v102, v106))
    {
      uint64_t v56 = v110
          ? getFirstAvailableDeviceFromHistoryWhereWombatsMustBeMagic(v49, v113, a9, 1, v55)
          : getFirstAvailableDeviceFromHistory(v49, v113, a9, 1);
      uint64_t v18 = v56;
      if (v56)
      {
        if (dword_1EB4C9280)
        {
          LODWORD(v128) = 0;
          type[0] = OS_LOG_TYPE_DEFAULT;
          uint64_t v57 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          unsigned int v58 = v128;
          if (os_log_type_enabled(v57, type[0])) {
            unsigned int v59 = v58;
          }
          else {
            unsigned int v59 = v58 & 0xFFFFFFFE;
          }
          if (v59)
          {
            if (v45) {
              int v60 = 84;
            }
            else {
              int v60 = 70;
            }
            if (a9) {
              int v61 = 84;
            }
            else {
              int v61 = 70;
            }
            int v62 = [v18 isSuspended];
            int v140 = 136316162;
            CMTime v141 = "+[AVCaptureFigVideoDevice _defaultDeviceWithDeviceType:mediaTypes:position:cameraOverrideHistoryAllow"
                   "ed:cameraOverrideHistorySuspendedAllowed:wombatsMustBeMagic:userPreferredCameraHistorySuspendedAllowe"
                   "d:invalidSpecialDeviceTypes:]";
            if (v62) {
              int v63 = 84;
            }
            else {
              int v63 = 70;
            }
            __int16 v142 = 1024;
            *(_DWORD *)CMTime v143 = v60;
            *(_WORD *)&v143[4] = 1024;
            *(_DWORD *)&v143[6] = v61;
            *(_WORD *)v144 = 2112;
            *(void *)&v144[2] = v18;
            __int16 v145 = 1024;
            int v146 = v63;
            _os_log_send_and_compose_impl();
          }
          goto LABEL_202;
        }
        return v18;
      }
    }
    os_unfair_lock_lock((os_unfair_lock_t)&sCameraHistoryLock);
    if (sStreamingCameraHistory) {
      v64 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithArray:");
    }
    else {
      v64 = 0;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&sCameraHistoryLock);
    if ([v64 count])
    {
      int v65 = v45
          ? getFirstAvailableDeviceFromHistoryWhereWombatsMustBeMagic(v64, v113, 0, 0, v55)
          : getFirstAvailableDeviceFromHistory(v64, v113, 0, 0);
      uint64_t v18 = v65;
      if (v65)
      {
        if (!dword_1EB4C9280) {
          return v18;
        }
        LODWORD(v128) = 0;
        type[0] = OS_LOG_TYPE_DEFAULT;
        v66 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        unsigned int v67 = v128;
        if (os_log_type_enabled(v66, type[0])) {
          unsigned int v68 = v67;
        }
        else {
          unsigned int v68 = v67 & 0xFFFFFFFE;
        }
        if (!v68) {
          goto LABEL_202;
        }
        int v69 = [v18 isSuspended];
        int v140 = 136315650;
        CMTime v141 = "+[AVCaptureFigVideoDevice _defaultDeviceWithDeviceType:mediaTypes:position:cameraOverrideHistoryAllowed:c"
               "ameraOverrideHistorySuspendedAllowed:wombatsMustBeMagic:userPreferredCameraHistorySuspendedAllowed:invali"
               "dSpecialDeviceTypes:]";
        if (v69) {
          int v70 = 84;
        }
        else {
          int v70 = 70;
        }
LABEL_199:
        __int16 v142 = 2112;
        *(void *)CMTime v143 = v18;
        *(_WORD *)&v143[8] = 1024;
        *(_DWORD *)v144 = v70;
        _os_log_send_and_compose_impl();
        goto LABEL_202;
      }
    }
    long long v128 = 0u;
    long long v129 = 0u;
    long long v130 = 0u;
    long long v131 = 0u;
    uint64_t v71 = [v113 countByEnumeratingWithState:&v128 objects:v147 count:16];
    if (!v71) {
      goto LABEL_161;
    }
    uint64_t v72 = v71;
    uint64_t v18 = 0;
    uint64_t v73 = *(void *)v129;
    int v74 = -1;
LABEL_130:
    uint64_t v75 = 0;
    while (1)
    {
      if (*(void *)v129 != v73) {
        objc_enumerationMutation(v113);
      }
      long long v76 = *(void **)(*((void *)&v128 + 1) + 8 * v75);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || ([v76 isSuspended] & 1) != 0
        || [v76 position] != 2)
      {
        goto LABEL_150;
      }
      long long v77 = (void *)[v76 deviceType];
      if ([v77 isEqualToString:@"AVCaptureDeviceTypeBuiltInWideAngleCamera"])
      {
        uint64_t v18 = v76;
        goto LABEL_154;
      }
      if ([v77 isEqualToString:@"AVCaptureDeviceTypeBuiltInTrueDepthCamera"]
        && v74 < 2)
      {
        int v74 = 2;
      }
      else
      {
        if (!objc_msgSend(v77, "isEqualToString:", @"AVCaptureDeviceTypeBuiltInUltraWideCamera", v103, v107)|| v74 >= 1)
        {
          unsigned int v127 = 0;
          os_log_type_t v126 = OS_LOG_TYPE_DEFAULT;
          uint64_t v78 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          unsigned int v79 = v127;
          if (os_log_type_enabled(v78, v126)) {
            unsigned int v80 = v79;
          }
          else {
            unsigned int v80 = v79 & 0xFFFFFFFE;
          }
          if (v80)
          {
            *(_DWORD *)os_log_type_t type = 136315394;
            CMTime v137 = "getMostCompatibleFrontCamera";
            __int16 v138 = 2112;
            CMTime v139 = v76;
            LODWORD(v107) = 22;
            v103 = type;
            _os_log_send_and_compose_impl();
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
          int v74 = 0;
          uint64_t v18 = v76;
          goto LABEL_150;
        }
        int v74 = 1;
      }
      uint64_t v18 = v76;
LABEL_150:
      if (v72 == ++v75)
      {
        uint64_t v72 = [v113 countByEnumeratingWithState:&v128 objects:v147 count:16];
        if (v72) {
          goto LABEL_130;
        }
LABEL_154:
        if (v18)
        {
          if (dword_1EB4C9280)
          {
            LODWORD(v128) = 0;
            type[0] = OS_LOG_TYPE_DEFAULT;
            uint64_t v81 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            unsigned int v82 = v128;
            if (os_log_type_enabled(v81, type[0])) {
              unsigned int v83 = v82;
            }
            else {
              unsigned int v83 = v82 & 0xFFFFFFFE;
            }
            if (v83) {
              goto LABEL_160;
            }
            goto LABEL_202;
          }
          return v18;
        }
LABEL_161:
        if (dword_1EB4C9280)
        {
          LODWORD(v128) = 0;
          type[0] = OS_LOG_TYPE_DEFAULT;
          long long v84 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          unsigned int v85 = v128;
          if (os_log_type_enabled(v84, type[0])) {
            unsigned int v86 = v85;
          }
          else {
            unsigned int v86 = v85 & 0xFFFFFFFE;
          }
          if (v86)
          {
            int v140 = 136315138;
            CMTime v141 = "+[AVCaptureFigVideoDevice _defaultDeviceWithDeviceType:mediaTypes:position:cameraOverrideHistoryAllow"
                   "ed:cameraOverrideHistorySuspendedAllowed:wombatsMustBeMagic:userPreferredCameraHistorySuspendedAllowe"
                   "d:invalidSpecialDeviceTypes:]";
            LODWORD(v107) = 12;
            v103 = (os_log_type_t *)&v140;
            _os_log_send_and_compose_impl();
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        return (id)objc_msgSend(v113, "firstObject", v103, v107);
      }
    }
  }
  os_unfair_lock_lock((os_unfair_lock_t)&sCameraHistoryLock);
  uint64_t v49 = 0;
  if (sUserPreferredCameraHistory && sDownplayUserPreferredCameraOverrideHistory) {
    uint64_t v49 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithArray:");
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&sCameraHistoryLock);
  if (![v49 count]) {
    goto LABEL_186;
  }
  uint64_t v50 = (void *)[v49 objectAtIndexedSubscript:0];
  if (v108)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&sSuspendedDevicesLock);
    uint64_t v51 = objc_msgSend(0, "objectForKey:", objc_msgSend(v50, "objectForKeyedSubscript:", @"DeviceUID"));
    if (v51 && dword_1EB4C9280)
    {
      LODWORD(v128) = 0;
      type[0] = OS_LOG_TYPE_DEFAULT;
      uint64_t v52 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v53 = v128;
      if (os_log_type_enabled(v52, type[0])) {
        unsigned int v54 = v53;
      }
      else {
        unsigned int v54 = v53 & 0xFFFFFFFE;
      }
      if (v54)
      {
        int v140 = 136315395;
        CMTime v141 = "+[AVCaptureFigVideoDevice _defaultDeviceWithDeviceType:mediaTypes:position:cameraOverrideHistoryAllowed:c"
               "ameraOverrideHistorySuspendedAllowed:wombatsMustBeMagic:userPreferredCameraHistorySuspendedAllowed:invali"
               "dSpecialDeviceTypes:]";
        __int16 v142 = 2113;
        *(void *)CMTime v143 = v50;
        LODWORD(v106) = 22;
        v102 = &v140;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      os_unfair_lock_unlock((os_unfair_lock_t)&sSuspendedDevicesLock);
      goto LABEL_186;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&sSuspendedDevicesLock);
    if (v51) {
      goto LABEL_186;
    }
  }
  if (dword_1EB4C9280)
  {
    LODWORD(v128) = 0;
    type[0] = OS_LOG_TYPE_DEFAULT;
    uint64_t v87 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v88 = v128;
    if (os_log_type_enabled(v87, type[0])) {
      unsigned int v89 = v88;
    }
    else {
      unsigned int v89 = v88 & 0xFFFFFFFE;
    }
    if (v89)
    {
      int v140 = 136315138;
      CMTime v141 = "+[AVCaptureFigVideoDevice _defaultDeviceWithDeviceType:mediaTypes:position:cameraOverrideHistoryAllowed:cam"
             "eraOverrideHistorySuspendedAllowed:wombatsMustBeMagic:userPreferredCameraHistorySuspendedAllowed:invalidSpe"
             "cialDeviceTypes:]";
      LODWORD(v106) = 12;
      v102 = &v140;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v132 = v50;
  FirstAvailableDeviceFromHistorCGFloat y = getFirstAvailableDeviceFromHistory(objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v132, 1, v102, v106), v113, v108, 1);
  if (!FirstAvailableDeviceFromHistory)
  {
LABEL_186:
    os_unfair_lock_lock((os_unfair_lock_t)&sCameraHistoryLock);
    if (sUserPreferredCameraOverrideHistory) {
      v55 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithArray:");
    }
    else {
      v55 = 0;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&sCameraHistoryLock);
    if ([v55 count])
    {
      v94 = getFirstAvailableDeviceFromHistory(v55, v113, 0, 1);
      if (v94)
      {
        uint64_t v18 = v94;
        if (!dword_1EB4C9280) {
          return v18;
        }
        LODWORD(v128) = 0;
        type[0] = OS_LOG_TYPE_DEFAULT;
        v95 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        unsigned int v96 = v128;
        if (os_log_type_enabled(v95, type[0])) {
          unsigned int v97 = v96;
        }
        else {
          unsigned int v97 = v96 & 0xFFFFFFFE;
        }
        if (!v97) {
          goto LABEL_202;
        }
        int v98 = [v18 isSuspended];
        int v140 = 136315650;
        CMTime v141 = "+[AVCaptureFigVideoDevice _defaultDeviceWithDeviceType:mediaTypes:position:cameraOverrideHistoryAllowed:c"
               "ameraOverrideHistorySuspendedAllowed:wombatsMustBeMagic:userPreferredCameraHistorySuspendedAllowed:invali"
               "dSpecialDeviceTypes:]";
        if (v98) {
          int v70 = 84;
        }
        else {
          int v70 = 70;
        }
        goto LABEL_199;
      }
    }
    if (v49) {
      goto LABEL_86;
    }
    goto LABEL_82;
  }
  uint64_t v18 = FirstAvailableDeviceFromHistory;
  if (dword_1EB4C9280)
  {
    LODWORD(v128) = 0;
    type[0] = OS_LOG_TYPE_DEFAULT;
    v91 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v92 = v128;
    if (os_log_type_enabled(v91, type[0])) {
      unsigned int v93 = v92;
    }
    else {
      unsigned int v93 = v92 & 0xFFFFFFFE;
    }
    if (v93)
    {
LABEL_160:
      int v140 = 136315394;
      CMTime v141 = "+[AVCaptureFigVideoDevice _defaultDeviceWithDeviceType:mediaTypes:position:cameraOverrideHistoryAllowed:cam"
             "eraOverrideHistorySuspendedAllowed:wombatsMustBeMagic:userPreferredCameraHistorySuspendedAllowed:invalidSpe"
             "cialDeviceTypes:]";
      __int16 v142 = 2112;
      *(void *)CMTime v143 = v18;
      _os_log_send_and_compose_impl();
    }
LABEL_202:
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v18;
}

- (unsigned)specialDeviceType
{
  return self->_specialDeviceType;
}

- (BOOL)isSuspended
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__AVCaptureFigVideoDevice_isSuspended__block_invoke;
  v5[3] = &unk_1E5A74078;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

+ (void)_insurePreferredCameraGlobal:(id *)a3 globalName:(id)a4 preferredCamera:(id)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a5)
  {
    if (dword_1EB4C9280)
    {
      int v14 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    char v9 = +[AVCaptureFigVideoDevice _cameraHistoryDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __83__AVCaptureFigVideoDevice__insurePreferredCameraGlobal_globalName_preferredCamera___block_invoke;
    block[3] = &unk_1E5A73F90;
    void block[5] = a4;
    void block[6] = a3;
    block[4] = a5;
    dispatch_async(v9, block);
  }
}

+ (id)_cameraHistoryDispatchQueue
{
  if (_cameraHistoryDispatchQueue_onceToken != -1) {
    dispatch_once(&_cameraHistoryDispatchQueue_onceToken, &__block_literal_global_21);
  }
  return (id)sPreferredCameraPropertyRefreshQueue;
}

- (void)setVideoMinFrameDurationOverride:(id *)a3 forOwner:(id)a4
{
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3810000000;
  uint64_t v15 = &unk_1A165D1D9;
  long long v16 = *MEMORY[0x1E4F1F9F8];
  uint64_t v17 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  devicePropsQueue = self->_devicePropsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__AVCaptureFigVideoDevice_setVideoMinFrameDurationOverride_forOwner___block_invoke;
  block[3] = &unk_1E5A74118;
  long long v6 = *(_OWORD *)&a3->var0;
  int64_t var3 = a3->var3;
  long long v10 = v6;
  block[4] = self;
  void block[5] = a4;
  void block[6] = &v12;
  dispatch_sync(devicePropsQueue, block);
  if (*((unsigned char *)v13 + 44))
  {
    long long v7 = *((_OWORD *)v13 + 2);
    uint64_t v8 = v13[6];
    [(AVCaptureFigVideoDevice *)self _setActiveVideoMinFrameDurationInternal:&v7];
  }
  _Block_object_dispose(&v12, 8);
}

float __46__AVCaptureFigVideoDevice_setVideoZoomFactor___block_invoke_2(uint64_t a1)
{
  *(_DWORD *)(*(void *)(a1 + 32) + 868) = 0;
  float result = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  *(float *)(*(void *)(a1 + 32) + 864) = result;
  return result;
}

- (int64_t)exposureMode
{
  uint64_t v6 = 0;
  long long v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__AVCaptureFigVideoDevice_exposureMode__block_invoke;
  v5[3] = &unk_1E5A74078;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __57__AVCaptureFigVideoDevice_isStillImageStabilizationScene__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 848);
  return result;
}

- (BOOL)isAdjustingExposure
{
  uint64_t v6 = 0;
  long long v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__AVCaptureFigVideoDevice_isAdjustingExposure__block_invoke;
  v5[3] = &unk_1E5A74078;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isFlashActive
{
  uint64_t v6 = 0;
  long long v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__AVCaptureFigVideoDevice_isFlashActive__block_invoke;
  v5[3] = &unk_1E5A74078;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __66__AVCaptureFigVideoDevice__updateReactionEffectsActiveForEnabled___block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 1264) = *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24);
  return result;
}

uint64_t __40__AVCaptureFigVideoDevice_isTorchActive__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 784);
  return result;
}

- (void)_handleNotification:(__CFString *)a3 payload:(id)a4
{
  v225[2] = *MEMORY[0x1E4F143B8];
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F51E78]))
  {
    id v7 = [(AVCaptureFigVideoDevice *)self _copyFigCaptureSourceProperty:*MEMORY[0x1E4F521B8]];
    if (v7 != (id)*MEMORY[0x1E4F1CFC8])
    {
      uint64_t v8 = v7;
      dispatch_semaphore_signal(&self->_propertyToFigCaptureSourcePropertyMap->super.super);
      if (v8)
      {
        CFRelease(v8);
      }
    }
    return;
  }
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F51FB8]))
  {
    if (!self->_proxyDevice
      || (objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F51E08]), "BOOLValue") & 1) != 0)
    {
      return;
    }
    v202.origin.double x = 0.0;
    *(void *)&v202.origin.CGFloat y = &v202;
    *(void *)&v202.size.CGFloat width = 0x2020000000;
    devicePropsQueue = self->_devicePropsQueue;
    LOBYTE(v202.size.height) = 0;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke;
    block[3] = &unk_1E5A74208;
    void block[5] = &v202;
    block[4] = self;
    char v221 = 0;
    dispatch_sync(devicePropsQueue, block);
    if (*(unsigned char *)(*(void *)&v202.origin.y + 24))
    {
      [(AVCaptureFigVideoDevice *)self _setConnected:0];
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:", @"AVCaptureDeviceWasDisconnectedNotification", self);
    }
    goto LABEL_12;
  }
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F51E20]))
  {
    uint64_t v11 = [a4 objectForKeyedSubscript:*MEMORY[0x1E4F51E08]];
    [(AVCaptureFigVideoDevice *)self _handleCMIOExtensionPropertyChangeNotification:v11];
    return;
  }
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F51EA8]))
  {
    uint64_t v12 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 postNotificationName:@"AVCaptureDeviceSubjectAreaDidChangeNotification" object:self];
    return;
  }
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F51F10]))
  {
    uint64_t v13 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F51E08]), "BOOLValue");
    [(AVCaptureFigVideoDevice *)self _setAdjustingFocus:v13];
    if (v13) {
      return;
    }
    v202.origin.double x = 0.0;
    *(void *)&v202.origin.CGFloat y = &v202;
    *(void *)&v202.size.CGFloat width = 0x2020000000;
    v202.size.height = 0.0;
    uint64_t v14 = self->_devicePropsQueue;
    v219[0] = MEMORY[0x1E4F143A8];
    v219[1] = 3221225472;
    v219[2] = __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_2;
    v219[3] = &unk_1E5A74078;
    v219[5] = &v202;
    v219[4] = self;
    dispatch_sync(v14, v219);
    if (*(void *)(*(void *)&v202.origin.y + 24) == 1)
    {
      [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"focusMode"];
      uint64_t v15 = self->_devicePropsQueue;
      v218[0] = MEMORY[0x1E4F143A8];
      v218[1] = 3221225472;
      v218[2] = __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_3;
      v218[3] = &unk_1E5A72ED0;
      v218[4] = self;
      dispatch_sync(v15, v218);
      [(AVCaptureFigVideoDevice *)self didChangeValueForKey:@"focusMode"];
    }
    goto LABEL_12;
  }
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F52038]))
  {
    objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F51E08]), "floatValue");
    int v17 = v16;
    v202.origin.double x = 0.0;
    *(void *)&v202.origin.CGFloat y = &v202;
    *(void *)&v202.size.CGFloat width = 0x2020000000;
    uint64_t v18 = self->_devicePropsQueue;
    LOBYTE(v202.size.height) = 0;
    v216[0] = MEMORY[0x1E4F143A8];
    v216[1] = 3221225472;
    v216[2] = __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_4;
    v216[3] = &unk_1E5A74640;
    int v217 = v16;
    v216[5] = &v202;
    v216[4] = self;
    dispatch_sync(v18, v216);
    if (*(unsigned char *)(*(void *)&v202.origin.y + 24))
    {
      [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"lensPosition"];
      uint64_t v19 = self->_devicePropsQueue;
      v214[0] = MEMORY[0x1E4F143A8];
      v214[1] = 3221225472;
      v214[2] = __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_5;
      v214[3] = &unk_1E5A74370;
      v214[4] = self;
      int v215 = v17;
      dispatch_sync(v19, v214);
      [(AVCaptureFigVideoDevice *)self didChangeValueForKey:@"lensPosition"];
    }
    goto LABEL_12;
  }
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F51E50]))
  {
    uint64_t v20 = 664;
LABEL_32:
    uint64_t v21 = *(uint64_t *)((char *)&self->super.super.isa + v20);
    [(AVCaptureFigVideoDevice *)self _handleManualControlCompletionForRequestQueue:v21 withPayload:a4];
    return;
  }
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F51F08]))
  {
    uint64_t v22 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F51E08]), "BOOLValue");
    [(AVCaptureFigVideoDevice *)self _setAdjustingExposure:v22];
    return;
  }
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F51EF0]))
  {
    CFDictionaryRef v23 = (const __CFDictionary *)[a4 objectForKeyedSubscript:*MEMORY[0x1E4F51E08]];
    if (v23)
    {
      memset(&v202, 0, 24);
      CMTimeMakeFromDictionary((CMTime *)&v202, v23);
      [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"activeMaxExposureDuration"];
      uint64_t v24 = self->_devicePropsQueue;
      v211[0] = MEMORY[0x1E4F143A8];
      v211[1] = 3221225472;
      v211[2] = __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_6;
      v211[3] = &unk_1E5A74320;
      v211[4] = self;
      CGPoint origin = v202.origin;
      CGFloat width = v202.size.width;
      dispatch_sync(v24, v211);
      [(AVCaptureFigVideoDevice *)self didChangeValueForKey:@"activeMaxExposureDuration"];
    }
    return;
  }
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F51FF0]))
  {
    CFDictionaryRef v25 = (const __CFDictionary *)[a4 objectForKeyedSubscript:*MEMORY[0x1E4F51E08]];
    memset(&v173, 0, sizeof(v173));
    CMTimeMakeFromDictionary(&v173, v25);
    uint64_t v207 = 0;
    v208 = &v207;
    uint64_t v209 = 0x2020000000;
    LOBYTE(v210) = 0;
    unsigned int v26 = self->_devicePropsQueue;
    v205[0] = MEMORY[0x1E4F143A8];
    v205[1] = 3221225472;
    v205[2] = __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_7;
    v205[3] = &unk_1E5A74668;
    CMTime v206 = v173;
    v205[5] = &v207;
    v205[4] = self;
    dispatch_sync(v26, v205);
    if (!*((unsigned char *)v208 + 24))
    {
LABEL_48:
      long long v10 = (CGRect *)&v207;
      goto LABEL_13;
    }
    v202.origin.double x = 0.0;
    *(void *)&v202.origin.CGFloat y = &v202;
    *(void *)&v202.size.CGFloat width = 0x3810000000;
    *(void *)&v202.size.height = &unk_1A165D1D9;
    long long v203 = *MEMORY[0x1E4F1F9F8];
    uint64_t v204 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    uint64_t v198 = 0;
    v199 = &v198;
    uint64_t v200 = 0x2020000000;
    char v201 = 0;
    [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"exposureDuration"];
    uint64_t v27 = self->_devicePropsQueue;
    v196[0] = MEMORY[0x1E4F143A8];
    v196[1] = 3221225472;
    v196[2] = __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_8;
    v196[3] = &unk_1E5A74690;
    CMTime v197 = v173;
    v196[4] = self;
    v196[5] = &v202;
    v196[6] = &v198;
    dispatch_sync(v27, v196);
    if (*((unsigned char *)v199 + 24))
    {
      long long v170 = *(_OWORD *)(*(void *)&v202.origin.y + 32);
      uint64_t v171 = *(void *)(*(void *)&v202.origin.y + 48);
      [(AVCaptureFigVideoDevice *)self _setActiveVideoMaxFrameDurationInternal:&v170];
    }
    [(AVCaptureFigVideoDevice *)self didChangeValueForKey:@"exposureDuration"];
    _Block_object_dispose(&v198, 8);
    uint64_t v28 = &v202;
LABEL_47:
    _Block_object_dispose(v28, 8);
    goto LABEL_48;
  }
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F52070]))
  {
    objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F51E08]), "floatValue");
    int v30 = v29;
    v202.origin.double x = 0.0;
    *(void *)&v202.origin.CGFloat y = &v202;
    *(void *)&v202.size.CGFloat width = 0x2020000000;
    double v31 = self->_devicePropsQueue;
    LOBYTE(v202.size.height) = 0;
    v194[0] = MEMORY[0x1E4F143A8];
    v194[1] = 3221225472;
    v194[2] = __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_9;
    v194[3] = &unk_1E5A74640;
    int v195 = v29;
    v194[5] = &v202;
    v194[4] = self;
    dispatch_sync(v31, v194);
    if (*(unsigned char *)(*(void *)&v202.origin.y + 24))
    {
      [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"ISO"];
      unsigned int v32 = self->_devicePropsQueue;
      v192[0] = MEMORY[0x1E4F143A8];
      v192[1] = 3221225472;
      v192[2] = __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_10;
      v192[3] = &unk_1E5A74370;
      v192[4] = self;
      int v193 = v30;
      dispatch_sync(v32, v192);
      [(AVCaptureFigVideoDevice *)self didChangeValueForKey:@"ISO"];
    }
    goto LABEL_12;
  }
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F52000]))
  {
    objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F51E08]), "floatValue");
    int v34 = v33;
    v202.origin.double x = 0.0;
    *(void *)&v202.origin.CGFloat y = &v202;
    *(void *)&v202.size.CGFloat width = 0x2020000000;
    unsigned int v35 = self->_devicePropsQueue;
    LOBYTE(v202.size.height) = 0;
    v190[0] = MEMORY[0x1E4F143A8];
    v190[1] = 3221225472;
    v190[2] = __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_11;
    v190[3] = &unk_1E5A74640;
    v190[5] = &v202;
    v190[4] = self;
    int v191 = v33;
    dispatch_sync(v35, v190);
    if (*(unsigned char *)(*(void *)&v202.origin.y + 24))
    {
      [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"exposureTargetBias"];
      unsigned int v36 = self->_devicePropsQueue;
      v188[0] = MEMORY[0x1E4F143A8];
      v188[1] = 3221225472;
      v188[2] = __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_12;
      v188[3] = &unk_1E5A74370;
      v188[4] = self;
      int v189 = v34;
      dispatch_sync(v36, v188);
      [(AVCaptureFigVideoDevice *)self didChangeValueForKey:@"exposureTargetBias"];
    }
    goto LABEL_12;
  }
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F52010]))
  {
    v202.origin.double x = 0.0;
    *(void *)&v202.origin.CGFloat y = &v202;
    *(void *)&v202.size.CGFloat width = 0x2020000000;
    LODWORD(v202.size.height) = 0;
    objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F51E08]), "floatValue");
    LODWORD(v202.size.height) = v37;
    uint64_t v207 = 0;
    v208 = &v207;
    uint64_t v209 = 0x2020000000;
    LOBYTE(v210) = 0;
    uint64_t v38 = self->_devicePropsQueue;
    v187[0] = MEMORY[0x1E4F143A8];
    v187[1] = 3221225472;
    v187[2] = __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_13;
    v187[3] = &unk_1E5A746B8;
    v187[4] = self;
    v187[5] = &v202;
    v187[6] = &v207;
    dispatch_sync(v38, v187);
    if (*((unsigned char *)v208 + 24))
    {
      [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"exposureTargetOffset"];
      uint64_t v39 = self->_devicePropsQueue;
      v186[0] = MEMORY[0x1E4F143A8];
      v186[1] = 3221225472;
      v186[2] = __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_14;
      v186[3] = &unk_1E5A73EF0;
      v186[4] = self;
      v186[5] = &v202;
      dispatch_sync(v39, v186);
      [(AVCaptureFigVideoDevice *)self didChangeValueForKey:@"exposureTargetOffset"];
    }
    goto LABEL_58;
  }
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F51E48]))
  {
    uint64_t v20 = 672;
    goto LABEL_32;
  }
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F51E18]))
  {
    uint64_t v20 = 680;
    goto LABEL_32;
  }
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F51F18]))
  {
    uint64_t v40 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F51E08]), "BOOLValue");
    [(AVCaptureFigVideoDevice *)self _setAdjustingWhiteBalance:v40];
    return;
  }
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F51FC0]))
  {
    uint64_t v41 = (void *)[a4 objectForKeyedSubscript:*MEMORY[0x1E4F51E08]];
    if (!v41) {
      return;
    }
    uint64_t v42 = v41;
    if ([v41 length] != 12) {
      return;
    }
    LODWORD(v208) = 0;
    uint64_t v207 = 0;
    [v42 getBytes:&v207 length:12];
    v202.origin.double x = 0.0;
    *(void *)&v202.origin.CGFloat y = &v202;
    *(void *)&v202.size.CGFloat width = 0x2020000000;
    LOBYTE(v202.size.height) = 0;
    unsigned int v43 = self->_devicePropsQueue;
    v184[0] = MEMORY[0x1E4F143A8];
    v184[1] = 3221225472;
    v184[2] = __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_15;
    v184[3] = &unk_1E5A746E0;
    v184[6] = v207;
    int v185 = (int)v208;
    v184[5] = &v202;
    v184[4] = self;
    dispatch_sync(v43, v184);
    if (*(unsigned char *)(*(void *)&v202.origin.y + 24))
    {
      [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"deviceWhiteBalanceGains"];
      unsigned int v44 = self->_devicePropsQueue;
      v182[0] = MEMORY[0x1E4F143A8];
      v182[1] = 3221225472;
      v182[2] = __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_16;
      v182[3] = &unk_1E5A74708;
      v182[4] = self;
      v182[5] = v207;
      int v183 = (int)v208;
      dispatch_sync(v44, v182);
      [(AVCaptureFigVideoDevice *)self didChangeValueForKey:@"deviceWhiteBalanceGains"];
    }
    goto LABEL_12;
  }
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F52060]))
  {
    BOOL v45 = (void *)[a4 objectForKeyedSubscript:*MEMORY[0x1E4F51E08]];
    if (v45)
    {
      uint64_t v46 = v45;
      if ([v45 length] == 12)
      {
        LODWORD(v202.origin.y) = 0;
        v202.origin.double x = 0.0;
        [v46 getBytes:&v202 length:12];
        [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"grayWorldDeviceWhiteBalanceGains"];
        unsigned int v47 = self->_devicePropsQueue;
        v180[0] = MEMORY[0x1E4F143A8];
        v180[1] = 3221225472;
        v180[2] = __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_17;
        v180[3] = &unk_1E5A74708;
        int y_low = LODWORD(v202.origin.y);
        v180[5] = *(void *)&v202.origin.x;
        v180[4] = self;
        dispatch_sync(v47, v180);
        [(AVCaptureFigVideoDevice *)self didChangeValueForKey:@"grayWorldDeviceWhiteBalanceGains"];
      }
    }
    return;
  }
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F51E58]))
  {
    uint64_t v20 = 688;
    goto LABEL_32;
  }
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F520E0]))
  {
    char v48 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F51E08]), "BOOLValue");
    v202.origin.double x = 0.0;
    *(void *)&v202.origin.CGFloat y = &v202;
    *(void *)&v202.size.CGFloat width = 0x2020000000;
    uint64_t v49 = self->_devicePropsQueue;
    LOBYTE(v202.size.height) = 0;
    v178[0] = MEMORY[0x1E4F143A8];
    v178[1] = 3221225472;
    v178[2] = __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_18;
    v178[3] = &unk_1E5A74208;
    char v179 = v48;
    v178[5] = &v202;
    v178[4] = self;
    dispatch_sync(v49, v178);
    if (*(unsigned char *)(*(void *)&v202.origin.y + 24))
    {
      [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"sceneClassificationActive"];
      uint64_t v50 = self->_devicePropsQueue;
      v176[0] = MEMORY[0x1E4F143A8];
      v176[1] = 3221225472;
      v176[2] = __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_19;
      v176[3] = &unk_1E5A74028;
      v176[4] = self;
      char v177 = v48;
      dispatch_sync(v50, v176);
      [(AVCaptureFigVideoDevice *)self didChangeValueForKey:@"sceneClassificationActive"];
    }
    goto LABEL_12;
  }
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F520E8]))
  {
    [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"documentSceneConfidence"];
    uint64_t v51 = self->_devicePropsQueue;
    v175[0] = MEMORY[0x1E4F143A8];
    v175[1] = 3221225472;
    v175[2] = __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_20;
    v175[3] = &unk_1E5A72D70;
    v175[4] = self;
    v175[5] = a4;
    dispatch_sync(v51, v175);
    [(AVCaptureFigVideoDevice *)self didChangeValueForKey:@"documentSceneConfidence"];
    return;
  }
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F51EA0]))
  {
    uint64_t v52 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F521F8]), "BOOLValue");
    uint64_t v53 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F52200]), "BOOLValue");
    uint64_t v54 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F52208]), "BOOLValue");
    uint64_t v55 = [a4 objectForKeyedSubscript:*MEMORY[0x1E4F521F0]];
    uint64_t v207 = 0;
    v208 = &v207;
    uint64_t v209 = 0x2020000000;
    LOBYTE(v210) = 0;
    uint64_t v198 = 0;
    v199 = &v198;
    uint64_t v200 = 0x2020000000;
    char v201 = 0;
    v173.CMTimeValue value = 0;
    *(void *)&v173.CMTimeScale timescale = &v173;
    v173.epoch = 0x2020000000;
    char v174 = 0;
    *(void *)&long long v170 = 0;
    *((void *)&v170 + 1) = &v170;
    uint64_t v171 = 0x2020000000;
    char v172 = 0;
    uint64_t v166 = 0;
    CMTime v167 = &v166;
    uint64_t v168 = 0x2020000000;
    char v169 = 0;
    v202.origin.double x = 0.0;
    *(void *)&v202.origin.CGFloat y = &v202;
    *(void *)&v202.size.CGFloat width = 0x3052000000;
    *(void *)&v202.size.height = __Block_byref_object_copy__5;
    *(void *)&long long v203 = __Block_byref_object_dispose__5;
    *((void *)&v203 + 1) = 0;
    uint64_t v56 = self->_devicePropsQueue;
    v165[0] = MEMORY[0x1E4F143A8];
    v165[1] = 3221225472;
    v165[2] = __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_21;
    v165[3] = &unk_1E5A74730;
    v165[5] = &v207;
    v165[4] = self;
    v165[6] = &v198;
    v165[7] = &v173;
    v165[8] = &v170;
    v165[9] = &v166;
    v165[10] = &v202;
    dispatch_sync(v56, v165);
    if (!*((unsigned char *)v199 + 24) && *((unsigned __int8 *)v208 + 24) != v52) {
      [(AVCaptureFigVideoDevice *)self _setFlashActive:v52];
    }
    if (*(unsigned __int8 *)(*(void *)&v173.timescale + 24) != v52) {
      [(AVCaptureFigVideoDevice *)self _setFlashSceneDetectedForPhotoOutput:v52];
    }
    if (*(unsigned __int8 *)(*((void *)&v170 + 1) + 24) != v53) {
      [(AVCaptureFigVideoDevice *)self _setHDRSceneDetectedForPhotoOutput:v53];
    }
    if (*((unsigned __int8 *)v167 + 24) != v54) {
      [(AVCaptureFigVideoDevice *)self _setIsStillImageStabilizationScene:v54];
    }
    if (([*(id *)(*(void *)&v202.origin.y + 40) isEqualToDictionary:v55] & 1) == 0) {
      [(AVCaptureFigVideoDevice *)self _setDigitalFlashSceneForPhotoOutput:v55];
    }

    _Block_object_dispose(&v202, 8);
    _Block_object_dispose(&v166, 8);
    _Block_object_dispose(&v170, 8);
    _Block_object_dispose(&v173, 8);
    uint64_t v28 = (CGRect *)&v198;
    goto LABEL_47;
  }
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F52030]))
  {
    uint64_t v57 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F51E08]), "BOOLValue") ^ 1;
    [(AVCaptureFigVideoDevice *)self _setFlashAvailable:v57];
    return;
  }
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F52148]))
  {
    uint64_t v58 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F51E08]), "BOOLValue");
    [(AVCaptureFigVideoDevice *)self _setTorchActive:v58];
    return;
  }
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F52158]))
  {
    uint64_t v59 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F51E08]), "BOOLValue") ^ 1;
    [(AVCaptureFigVideoDevice *)self _setTorchAvailable:v59];
    return;
  }
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F52150]))
  {
    objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F51E08]), "floatValue");
    -[AVCaptureFigVideoDevice _setTorchLevel:](self, "_setTorchLevel:");
    return;
  }
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F52078]))
  {
    uint64_t v60 = (int)objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F51E08]), "intValue");
    [(AVCaptureFigVideoDevice *)self _setImageControlMode:v60];
    return;
  }
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F51EB0]))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      return;
    }
    uint64_t v61 = [a4 objectForKeyedSubscript:*MEMORY[0x1E4F52278]];
    uint64_t v62 = [a4 objectForKeyedSubscript:*MEMORY[0x1E4F52270]];
    int v63 = (void *)[a4 objectForKeyedSubscript:*MEMORY[0x1E4F52280]];
    v64 = (void *)[a4 objectForKeyedSubscript:*MEMORY[0x1E4F52288]];
    v202.origin.double x = 0.0;
    *(void *)&v202.origin.CGFloat y = &v202;
    *(void *)&v202.size.CGFloat width = 0x2020000000;
    LODWORD(v202.size.height) = 0;
    uint64_t v207 = 0;
    v208 = &v207;
    uint64_t v209 = 0x2020000000;
    LODWORD(v210) = 0;
    uint64_t v198 = 0;
    v199 = &v198;
    uint64_t v200 = 0x2020000000;
    char v201 = 0;
    int v65 = self->_devicePropsQueue;
    v164[0] = MEMORY[0x1E4F143A8];
    v164[1] = 3221225472;
    v164[2] = __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_22;
    v164[3] = &unk_1E5A74758;
    v164[4] = self;
    v164[5] = v62;
    v164[7] = &v202;
    v164[6] = v63;
    v164[8] = &v207;
    v164[9] = &v198;
    dispatch_sync(v65, v164);
    if (!v61 || !v63 || !v64) {
      goto LABEL_135;
    }
    if ([v64 BOOLValue])
    {
      int v66 = [v63 intValue];
      if (v66 != *((_DWORD *)v208 + 6) || *(float *)(*(void *)&v202.origin.y + 24) == 0.0) {
        goto LABEL_135;
      }
      [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"rampingVideoZoom"];
      [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"videoZoomFactor"];
      unsigned int v67 = self->_devicePropsQueue;
      v163[0] = MEMORY[0x1E4F143A8];
      v163[1] = 3221225472;
      v163[2] = __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_23;
      v163[3] = &unk_1E5A72D70;
      v163[4] = self;
      v163[5] = v61;
      dispatch_sync(v67, v163);
      [(AVCaptureFigVideoDevice *)self didChangeValueForKey:@"videoZoomFactor"];
    }
    else
    {
      if (*(float *)(*(void *)&v202.origin.y + 24) == 0.0) {
        goto LABEL_135;
      }
      if (*((unsigned char *)v199 + 24)) {
        [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"rampingVideoZoom"];
      }
      [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"videoZoomFactor"];
      uint64_t v72 = self->_devicePropsQueue;
      v162[0] = MEMORY[0x1E4F143A8];
      v162[1] = 3221225472;
      v162[2] = __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_24;
      v162[3] = &unk_1E5A74780;
      v162[4] = self;
      v162[5] = v61;
      v162[6] = &v198;
      v162[7] = &v202;
      v162[8] = &v207;
      dispatch_sync(v72, v162);
      [(AVCaptureFigVideoDevice *)self didChangeValueForKey:@"videoZoomFactor"];
      if (!*((unsigned char *)v199 + 24)) {
        goto LABEL_135;
      }
    }
    [(AVCaptureFigVideoDevice *)self didChangeValueForKey:@"rampingVideoZoom"];
LABEL_135:
    _Block_object_dispose(&v198, 8);
LABEL_58:
    _Block_object_dispose(&v207, 8);
LABEL_12:
    long long v10 = &v202;
LABEL_13:
    _Block_object_dispose(v10, 8);
    return;
  }
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F51E38]))
  {
    CGSize v68 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    v202.CGPoint origin = (CGPoint)*MEMORY[0x1E4F1DB28];
    v202.CGSize size = v68;
    if (CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)[a4 objectForKeyedSubscript:*MEMORY[0x1E4F51D90]], &v202))
    {
      int v69 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F51D88]), "intValue");
      [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"faceRectangle"];
      [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"faceRectangleAngle"];
      int v70 = self->_devicePropsQueue;
      v159[0] = MEMORY[0x1E4F143A8];
      v159[1] = 3221225472;
      CGRect v160 = v202;
      v159[2] = __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_25;
      v159[3] = &unk_1E5A747A8;
      v159[4] = self;
      int v161 = v69;
      dispatch_sync(v70, v159);
      [(AVCaptureFigVideoDevice *)self didChangeValueForKey:@"faceRectangleAngle"];
      [(AVCaptureFigVideoDevice *)self didChangeValueForKey:@"faceRectangle"];
    }
  }
  else
  {
    if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F51E88]))
    {
      uint64_t v71 = *MEMORY[0x1E4F521E0];
      v224[0] = *MEMORY[0x1E4F521E8];
      v224[1] = v71;
      v225[0] = &unk_1EF4FA718;
      v225[1] = MEMORY[0x1E4F1CC08];
      -[AVCaptureFigVideoDevice _setDigitalFlashSceneForPhotoOutput:](self, "_setDigitalFlashSceneForPhotoOutput:", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v225 forKeys:v224 count:2]);
      [(AVCaptureFigVideoDevice *)self _drainManualControlRequestQueues];
      return;
    }
    if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F51E98]))
    {
      uint64_t v73 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F51E08]), "integerValue");
      [(AVCaptureFigVideoDevice *)self _updateSpatialCaptureStatus:v73];
    }
    else if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F51E80]))
    {
      uint64_t v74 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F521C0]), "integerValue");
      uint64_t v75 = v74;
      if ((unint64_t)(v74 - 13) <= 1 && v74 != *(void *)&self->_depthDataDeliveryEnabled)
      {
        v202.origin.double x = 0.0;
        *(void *)&v202.origin.CGFloat y = &v202;
        *(void *)&v202.size.CGFloat width = 0x3052000000;
        *(void *)&v202.size.height = __Block_byref_object_copy__5;
        *(void *)&long long v203 = __Block_byref_object_dispose__5;
        *((void *)&v203 + 1) = 0;
        long long v76 = self->_devicePropsQueue;
        v158[0] = MEMORY[0x1E4F143A8];
        v158[1] = 3221225472;
        v158[2] = __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_26;
        v158[3] = &unk_1E5A73EF0;
        v158[4] = self;
        v158[5] = &v202;
        dispatch_sync(v76, v158);
        if (*(void *)(*(void *)&v202.origin.y + 40))
        {
          [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"systemPressureState"];
          long long v77 = self->_devicePropsQueue;
          v157[0] = MEMORY[0x1E4F143A8];
          v157[1] = 3221225472;
          v157[2] = __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_27;
          v157[3] = &unk_1E5A73EF0;
          v157[4] = self;
          v157[5] = &v202;
          dispatch_sync(v77, v157);
          [(AVCaptureFigVideoDevice *)self didChangeValueForKey:@"systemPressureState"];
        }
        _Block_object_dispose(&v202, 8);
      }
      [(AVCaptureFigVideoDevice *)self _setShallowDepthOfFieldEffectStatus:v75];
      uint64_t v78 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", objc_msgSend(NSNumber, "numberWithInteger:", v75), @"AVCaptureDeviceShallowDepthOfFieldStatusChangedKeyEffectStatus", 0);
      unsigned int v79 = (void *)[a4 objectForKeyedSubscript:*MEMORY[0x1E4F521C8]];
      if (v79)
      {
        uint64_t v80 = [v79 integerValue];
        objc_msgSend(v78, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", v80), @"AVCaptureDeviceShallowDepthOfFieldStatusChangedKeyStagePreviewStatus");
      }
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:userInfo:", @"AVCaptureDeviceShallowDepthOfFieldStatusChangedNotification", self, v78);
    }
    else
    {
      if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F51E10]))
      {
        uint64_t v81 = (void *)[a4 objectForKeyedSubscript:*MEMORY[0x1E4F51E08]];
        v202.origin.CGFloat y = 0.0;
        v202.origin.double x = 0.0;
        [v81 getBytes:&v202 length:16];
        [(AVCaptureFigVideoDevice *)self _setActivePrimaryConstituentDeviceSwitchingBehavior:*(void *)&v202.origin.x restrictedSwitchingBehaviorConditions:*(void *)&v202.origin.y];
        objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F51E00]), "floatValue");
        [(AVCaptureFigVideoDevice *)self _updateMinMaxVideoZoomFactorsWithMinZoomFactorFromCameraSelection:v82];
        return;
      }
      if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F51E30]))
      {
        int v83 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F51E08]), "intValue");
        long long v153 = 0u;
        long long v154 = 0u;
        long long v155 = 0u;
        long long v156 = 0u;
        long long v84 = [(AVCaptureDevice *)self constituentDevices];
        uint64_t v85 = [(NSArray *)v84 countByEnumeratingWithState:&v153 objects:v223 count:16];
        if (v85)
        {
          uint64_t v86 = *(void *)v154;
          while (2)
          {
            for (uint64_t i = 0; i != v85; ++i)
            {
              if (*(void *)v154 != v86) {
                objc_enumerationMutation(v84);
              }
              unsigned int v88 = *(void **)(*((void *)&v153 + 1) + 8 * i);
              if ([v88 figCaptureSourceDeviceType] == v83)
              {
                if (v88 && v88 != *(void **)&self->_cameraCalibrationDataDeliveryEnabled)
                {
                  [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"currentPrimaryConstituentDevice"];
                  [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"activePrimaryConstituentDevice"];
                  unsigned int v89 = self->_devicePropsQueue;
                  v152[0] = MEMORY[0x1E4F143A8];
                  v152[1] = 3221225472;
                  v152[2] = __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_28;
                  void v152[3] = &unk_1E5A72D70;
                  v152[4] = self;
                  v152[5] = v88;
                  dispatch_sync(v89, v152);
                  [(AVCaptureFigVideoDevice *)self didChangeValueForKey:@"activePrimaryConstituentDevice"];
                  [(AVCaptureFigVideoDevice *)self didChangeValueForKey:@"currentPrimaryConstituentDevice"];
                }
                return;
              }
            }
            uint64_t v85 = [(NSArray *)v84 countByEnumeratingWithState:&v153 objects:v223 count:16];
            if (v85) {
              continue;
            }
            break;
          }
        }
      }
      else if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F51E60]))
      {
        int v90 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F51E08]), "intValue");
        long long v148 = 0u;
        long long v149 = 0u;
        long long v150 = 0u;
        long long v151 = 0u;
        v91 = [(AVCaptureDevice *)self constituentDevices];
        uint64_t v92 = [(NSArray *)v91 countByEnumeratingWithState:&v148 objects:v222 count:16];
        if (v92)
        {
          uint64_t v93 = *(void *)v149;
          while (2)
          {
            for (uint64_t j = 0; j != v92; ++j)
            {
              if (*(void *)v149 != v93) {
                objc_enumerationMutation(v91);
              }
              v95 = *(NSArray **)(*((void *)&v148 + 1) + 8 * j);
              if ([(NSArray *)v95 figCaptureSourceDeviceType] == v90)
              {
                if (v95 && v95 != self->_fallbackPrimaryConstituentDevices)
                {
                  [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"preferredPrimaryConstituentDevice"];
                  unsigned int v96 = self->_devicePropsQueue;
                  v147[0] = MEMORY[0x1E4F143A8];
                  v147[1] = 3221225472;
                  v147[2] = __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_29;
                  v147[3] = &unk_1E5A72D70;
                  v147[4] = self;
                  v147[5] = v95;
                  dispatch_sync(v96, v147);
                  [(AVCaptureFigVideoDevice *)self didChangeValueForKey:@"preferredPrimaryConstituentDevice"];
                }
                return;
              }
            }
            uint64_t v92 = [(NSArray *)v91 countByEnumeratingWithState:&v148 objects:v222 count:16];
            if (v92) {
              continue;
            }
            break;
          }
        }
      }
      else
      {
        if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F51E40]))
        {
          char v97 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F51E08]), "BOOLValue");
          v202.origin.double x = 0.0;
          *(void *)&v202.origin.CGFloat y = &v202;
          *(void *)&v202.size.CGFloat width = 0x2020000000;
          int v98 = self->_devicePropsQueue;
          LOBYTE(v202.size.height) = 0;
          v145[0] = MEMORY[0x1E4F143A8];
          v145[1] = 3221225472;
          v145[2] = __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_30;
          v145[3] = &unk_1E5A74208;
          char v146 = v97;
          v145[5] = &v202;
          v145[4] = self;
          dispatch_sync(v98, v145);
          if (*(unsigned char *)(*(void *)&v202.origin.y + 24))
          {
            [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"focusedAtMacro"];
            v99 = self->_devicePropsQueue;
            v143[0] = MEMORY[0x1E4F143A8];
            v143[1] = 3221225472;
            v143[2] = __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_31;
            v143[3] = &unk_1E5A74028;
            v143[4] = self;
            char v144 = v97;
            dispatch_sync(v99, v143);
            [(AVCaptureFigVideoDevice *)self didChangeValueForKey:@"focusedAtMacro"];
          }
          goto LABEL_12;
        }
        if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F52138]))
        {
          uint64_t v100 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F52238]), "intValue");
          unsigned int v101 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F52230]), "intValue");
          if ((int)v100 > SLODWORD(self->_systemPressureState)) {
            LODWORD(self->_systemPressureState) = v100;
          }
          v102 = [[AVCaptureSystemPressureState alloc] initWithFigLevel:v100 factors:v101 recommendedFrameRateRangeForPortrait:[(AVCaptureFigVideoDevice *)self _recommendedFrameRateRangeForVideoFormat:[(AVCaptureFigVideoDevice *)self activeFormat] depthFormat:[(AVCaptureFigVideoDevice *)self activeDepthDataFormat] figSystemPressureLevel:LODWORD(self->_systemPressureState)]];
          v202.origin.double x = 0.0;
          *(void *)&v202.origin.CGFloat y = &v202;
          *(void *)&v202.size.CGFloat width = 0x2020000000;
          v103 = self->_devicePropsQueue;
          LOBYTE(v202.size.height) = 0;
          v142[0] = MEMORY[0x1E4F143A8];
          v142[1] = 3221225472;
          v142[2] = __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_32;
          void v142[3] = &unk_1E5A73F18;
          v142[6] = &v202;
          v142[4] = v102;
          v142[5] = self;
          dispatch_sync(v103, v142);
          if (*(unsigned char *)(*(void *)&v202.origin.y + 24))
          {
            [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"systemPressureState"];
            uint64_t v104 = self->_devicePropsQueue;
            v141[0] = MEMORY[0x1E4F143A8];
            v141[1] = 3221225472;
            v141[2] = __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_33;
            v141[3] = &unk_1E5A72D70;
            v141[4] = self;
            v141[5] = v102;
            dispatch_sync(v104, v141);
            [(AVCaptureFigVideoDevice *)self didChangeValueForKey:@"systemPressureState"];
          }
          goto LABEL_12;
        }
        if (BYTE1(self->_degradedCaptureQualityFactors) && CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F52180])
          || BYTE2(self->_degradedCaptureQualityFactors) && CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F51F68]))
        {
          if (![(AVCaptureFigVideoDevice *)self hasFlash]) {
            return;
          }
          char v105 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F51E08]), "BOOLValue");
          v202.origin.double x = 0.0;
          *(void *)&v202.origin.CGFloat y = &v202;
          *(void *)&v202.size.CGFloat width = 0x2020000000;
          LOBYTE(v202.size.height) = 0;
          uint64_t v207 = 0;
          v208 = &v207;
          uint64_t v209 = 0x2020000000;
          uint64_t v210 = 0;
          uint64_t v106 = self->_devicePropsQueue;
          v139[0] = MEMORY[0x1E4F143A8];
          v139[1] = 3221225472;
          v139[2] = __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_34;
          v139[3] = &unk_1E5A747D0;
          char v140 = v105;
          v139[4] = self;
          v139[5] = &v207;
          v139[7] = a3;
          v139[6] = &v202;
          dispatch_sync(v106, v139);
          if (*(unsigned char *)(*(void *)&v202.origin.y + 24))
          {
            [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"degradedCaptureQualityFactors"];
            uint64_t v107 = self->_devicePropsQueue;
            v138[0] = MEMORY[0x1E4F143A8];
            v138[1] = 3221225472;
            v138[2] = __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_35;
            void v138[3] = &unk_1E5A73EF0;
            v138[4] = self;
            v138[5] = &v207;
            dispatch_sync(v107, v138);
            [(AVCaptureFigVideoDevice *)self didChangeValueForKey:@"degradedCaptureQualityFactors"];
          }
          goto LABEL_58;
        }
        if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F52068]))
        {
          char v108 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F51E08]), "BOOLValue");
          if (v108) {
            return;
          }
          char v109 = v108;
          v202.origin.double x = 0.0;
          *(void *)&v202.origin.CGFloat y = &v202;
          *(void *)&v202.size.CGFloat width = 0x2020000000;
          BOOL v110 = self->_devicePropsQueue;
          LOBYTE(v202.size.height) = 0;
          v136[0] = MEMORY[0x1E4F143A8];
          v136[1] = 3221225472;
          v136[2] = __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_36;
          void v136[3] = &unk_1E5A74208;
          v136[4] = self;
          v136[5] = &v202;
          char v137 = v109;
          dispatch_sync(v110, v136);
          if (*(unsigned char *)(*(void *)&v202.origin.y + 24))
          {
            [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"hidden"];
            id v111 = self->_devicePropsQueue;
            v134[0] = MEMORY[0x1E4F143A8];
            v134[1] = 3221225472;
            v134[2] = __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_37;
            void v134[3] = &unk_1E5A74028;
            v134[4] = self;
            char v135 = v109;
            dispatch_sync(v111, v134);
            [(AVCaptureFigVideoDevice *)self didChangeValueForKey:@"hidden"];
          }
          goto LABEL_12;
        }
        if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F520D0]))
        {
          int v112 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F51E08]), "BOOLValue");
          if (!v112) {
            return;
          }
          char v113 = v112;
          v202.origin.double x = 0.0;
          *(void *)&v202.origin.CGFloat y = &v202;
          *(void *)&v202.size.CGFloat width = 0x2020000000;
          long long v114 = self->_devicePropsQueue;
          LOBYTE(v202.size.height) = 0;
          v132[0] = MEMORY[0x1E4F143A8];
          v132[1] = 3221225472;
          v132[2] = __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_38;
          void v132[3] = &unk_1E5A74208;
          v132[4] = self;
          v132[5] = &v202;
          char v133 = v113;
          dispatch_sync(v114, v132);
          if (*(unsigned char *)(*(void *)&v202.origin.y + 24))
          {
            [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"readyToUnhide"];
            long long v115 = self->_devicePropsQueue;
            v130[0] = MEMORY[0x1E4F143A8];
            v130[1] = 3221225472;
            v130[2] = __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_39;
            void v130[3] = &unk_1E5A74028;
            v130[4] = self;
            char v131 = v113;
            dispatch_sync(v115, v130);
            [(AVCaptureFigVideoDevice *)self didChangeValueForKey:@"readyToUnhide"];
          }
          goto LABEL_12;
        }
        if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F51F70]) || CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F51F60])) {
          return;
        }
        if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F51FA0]))
        {
          CGSize v116 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
          v202.CGPoint origin = (CGPoint)*MEMORY[0x1E4F1DB20];
          v202.CGSize size = v116;
          if (!CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)[a4 objectForKeyedSubscript:*MEMORY[0x1E4F51E08]], &v202))return; {
          uint64_t v207 = 0;
          }
          v208 = &v207;
          uint64_t v209 = 0x2020000000;
          LOBYTE(v210) = 0;
          long long v117 = self->_devicePropsQueue;
          v128[0] = MEMORY[0x1E4F143A8];
          v128[1] = 3221225472;
          v128[2] = __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_40;
          void v128[3] = &unk_1E5A73E78;
          v128[4] = self;
          v128[5] = &v207;
          CGRect v129 = v202;
          dispatch_sync(v117, v128);
          if (*((unsigned char *)v208 + 24))
          {
            [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"centerStageRectOfInterest"];
            long long v118 = self->_devicePropsQueue;
            v126[0] = MEMORY[0x1E4F143A8];
            v126[1] = 3221225472;
            CGRect v127 = v202;
            v126[2] = __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_41;
            void v126[3] = &unk_1E5A74460;
            v126[4] = self;
            dispatch_sync(v118, v126);
            [(AVCaptureFigVideoDevice *)self didChangeValueForKey:@"centerStageRectOfInterest"];
          }
          goto LABEL_48;
        }
        if (!CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F51F90]))
        {
          if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F51E70]))
          {
            uint64_t v119 = [a4 objectForKeyedSubscript:*MEMORY[0x1E4F51E08]];
            [(AVCaptureDevice *)self updateReactionsInProgress:v119];
          }
          else if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F52170]))
          {
            objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F51E08]), "floatValue");
            double v121 = v120;
            [(AVCaptureFigVideoDevice *)self videoZoomFactor];
            if (v122 != v121)
            {
              [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"videoZoomFactor"];
              long long v123 = self->_devicePropsQueue;
              v125[0] = MEMORY[0x1E4F143A8];
              v125[1] = 3221225472;
              v125[2] = __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_42;
              v125[3] = &unk_1E5A72F98;
              v125[4] = self;
              *(double *)&v125[5] = v121;
              dispatch_sync(v123, v125);
              [(AVCaptureFigVideoDevice *)self didChangeValueForKey:@"videoZoomFactor"];
            }
          }
          else
          {
            long long v124 = (const void *)*MEMORY[0x1E4F51FE0];
            CFEqual(a3, v124);
          }
        }
      }
    }
  }
}

- (id)activeDepthDataFormat
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3052000000;
  char v9 = __Block_byref_object_copy__5;
  long long v10 = __Block_byref_object_dispose__5;
  uint64_t v11 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__AVCaptureFigVideoDevice_activeDepthDataFormat__block_invoke;
  v5[3] = &unk_1E5A74078;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_setAdjustingExposure:(BOOL)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  devicePropsQueue = self->_devicePropsQueue;
  char v10 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__AVCaptureFigVideoDevice__setAdjustingExposure___block_invoke;
  block[3] = &unk_1E5A74280;
  BOOL v6 = a3;
  block[4] = self;
  void block[5] = &v7;
  dispatch_sync(devicePropsQueue, block);
  if (*((unsigned char *)v8 + 24) && [(AVCaptureFigVideoDevice *)self lockForConfiguration:0])
  {
    [(AVCaptureFigVideoDevice *)self setExposureMode:0];
    [(AVCaptureFigVideoDevice *)self unlockForConfiguration];
  }
  _Block_object_dispose(&v7, 8);
}

- (void)_setAdjustingWhiteBalance:(BOOL)a3
{
  devicePropsQueue = self->_devicePropsQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__AVCaptureFigVideoDevice__setAdjustingWhiteBalance___block_invoke;
  v4[3] = &unk_1E5A74028;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(devicePropsQueue, v4);
}

uint64_t __50__AVCaptureFigVideoDevice__setUpCameraHistoryOnce__block_invoke_42(uint64_t a1)
{
  return [*(id *)(a1 + 32) _refreshPreferredCameraProperties:1];
}

- (void)addObserver:(id)a3 forKeyPath:(id)a4 options:(unint64_t)a5 context:(void *)a6
{
  [(AVCaptureFigVideoDevice *)self _incrementObserverCountForHighFrequencyProperty:a4];
  v11.receiver = self;
  v11.super_class = (Class)AVCaptureFigVideoDevice;
  [(AVCaptureFigVideoDevice *)&v11 addObserver:a3 forKeyPath:a4 options:a5 context:a6];
}

- (void)_incrementObserverCountForHighFrequencyProperty:(id)a3
{
  hevcEncoderSettings = self->_hevcEncoderSettings;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __75__AVCaptureFigVideoDevice__incrementObserverCountForHighFrequencyProperty___block_invoke;
  v4[3] = &unk_1E5A72D70;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(&hevcEncoderSettings->super, v4);
}

- (void)setVideoHDRSuspended:(BOOL)a3
{
  if ([(AVCaptureFigVideoDevice *)self isLockedForConfiguration]
    && (objc_msgSend(-[AVCaptureFigVideoDevice activeFormat](self, "activeFormat"), "isVideoHDRSuspensionSupported") & 1) != 0
    && [(AVCaptureFigVideoDevice *)self isVideoHDREnabled])
  {
    devicePropsQueue = self->_devicePropsQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__AVCaptureFigVideoDevice_setVideoHDRSuspended___block_invoke;
    block[3] = &unk_1E5A74028;
    block[4] = self;
    BOOL v10 = a3;
    dispatch_sync(devicePropsQueue, block);
  }
  else
  {
    BOOL v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3A8];
    objc_opt_class();
    uint64_t v8 = (void *)[v6 exceptionWithName:v7 reason:AVMethodExceptionReasonWithClassAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v8);
    }
    NSLog(&cfstr_SuppressingExc.isa, v8);
  }
}

- (BOOL)isVideoHDREnabled
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__AVCaptureFigVideoDevice_isVideoHDREnabled__block_invoke;
  v5[3] = &unk_1E5A74078;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isVideoZoomSmoothingSupported
{
  id v2 = [(NSDictionary *)self->_fcsAttributes objectForKeyedSubscript:*MEMORY[0x1E4F51CA0]];

  return [v2 BOOLValue];
}

- (BOOL)isCameraIntrinsicMatrixDeliverySupported
{
  int v3 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_fcsAttributes, "objectForKeyedSubscript:", *MEMORY[0x1E4F51B90]), "BOOLValue");
  if (v3)
  {
    id v4 = [(NSDictionary *)self->_fcsAttributes objectForKeyedSubscript:*MEMORY[0x1E4F51BC8]];
    LOBYTE(v3) = [v4 BOOLValue];
  }
  return v3;
}

- (BOOL)isVideoStabilizationSupported
{
  id v2 = [(NSDictionary *)self->_fcsAttributes objectForKeyedSubscript:*MEMORY[0x1E4F51C88]];

  return [v2 BOOLValue];
}

- (void)_resetVideoHDRSuspended
{
  if ([(AVCaptureFigVideoDevice *)self isVideoHDRSuspended])
  {
    [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"videoHDRSuspended"];
    devicePropsQueue = self->_devicePropsQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50__AVCaptureFigVideoDevice__resetVideoHDRSuspended__block_invoke;
    block[3] = &unk_1E5A72ED0;
    block[4] = self;
    dispatch_sync(devicePropsQueue, block);
    [(AVCaptureFigVideoDevice *)self didChangeValueForKey:@"videoHDRSuspended"];
  }
}

- (BOOL)isVideoHDRSuspended
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__AVCaptureFigVideoDevice_isVideoHDRSuspended__block_invoke;
  v5[3] = &unk_1E5A74078;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int)figCaptureSourcePosition
{
  id v2 = [(NSDictionary *)self->_fcsAttributes objectForKeyedSubscript:*MEMORY[0x1E4F51C20]];

  return [v2 intValue];
}

- (void)setActiveVideoMaxFrameDuration:(id *)a3
{
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3810000000;
  uint64_t v20 = &unk_1A165D1D9;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v21 = *a3;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3052000000;
  v16[3] = __Block_byref_object_copy__5;
  v16[4] = __Block_byref_object_dispose__5;
  v16[5] = 0;
  if ((a3->var2 & 1) != 0
    && [(AVCaptureFigVideoDevice *)self isAutoVideoFrameRateEnabled])
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    objc_opt_class();
    uint64_t v7 = (void *)[v6 exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithClassAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v7);
    }
    NSLog(&cfstr_SuppressingExc.isa, v7);
  }
  else
  {
    devicePropsQueue = self->_devicePropsQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__AVCaptureFigVideoDevice_setActiveVideoMaxFrameDuration___block_invoke;
    block[3] = &unk_1E5A741E0;
    long long v14 = *(_OWORD *)&a3->var0;
    int64_t var3 = a3->var3;
    block[4] = self;
    void block[5] = &v17;
    void block[6] = v16;
    void block[7] = a2;
    dispatch_sync(devicePropsQueue, block);
    long long v11 = *((_OWORD *)v18 + 2);
    uint64_t v12 = v18[6];
    if ([(AVCaptureFigVideoDevice *)self _setActiveVideoMaxFrameDurationInternal:&v11] == -16452)
    {
      char v9 = (void *)MEMORY[0x1E4F1CA00];
      objc_opt_class();
      BOOL v10 = (void *)[v9 exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:AVMethodExceptionReasonWithClassAndSelector() userInfo:0];
      if (AVCaptureShouldThrowForAPIViolations()) {
        objc_exception_throw(v10);
      }
      NSLog(&cfstr_SuppressingExc.isa, v10);
    }
  }
  _Block_object_dispose(v16, 8);
  _Block_object_dispose(&v17, 8);
}

- (void)_setActiveVideoMaxFrameDuration:(id *)a3
{
  if ([(AVCaptureFigVideoDevice *)self lockForConfiguration:0])
  {
    long long v5 = *(_OWORD *)&a3->var0;
    int64_t var3 = a3->var3;
    [(AVCaptureFigVideoDevice *)self _setActiveVideoMaxFrameDurationInternal:&v5];
    [(AVCaptureFigVideoDevice *)self unlockForConfiguration];
  }
}

- (int)_setActiveVideoMaxFrameDurationInternal:(id *)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  uint64_t v46 = 0;
  unsigned int v47 = &v46;
  uint64_t v48 = 0x2020000000;
  int v49 = 0;
  uint64_t v42 = 0;
  unsigned int v43 = &v42;
  uint64_t v44 = 0x2020000000;
  char v45 = 0;
  uint64_t v38 = 0;
  uint64_t v39 = &v38;
  uint64_t v40 = 0x2020000000;
  char v41 = 0;
  uint64_t v34 = 0;
  unsigned int v35 = &v34;
  uint64_t v36 = 0x2020000000;
  char v37 = 0;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3810000000;
  int v30 = &unk_1A165D1D9;
  uint64_t v31 = 0;
  uint64_t v32 = 0;
  uint64_t v33 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x2020000000;
  int v26 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3810000000;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v21 = &unk_1A165D1D9;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v22 = *a3;
  if (dword_1EB4C9280)
  {
    int v17 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  devicePropsQueue = self->_devicePropsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__AVCaptureFigVideoDevice__setActiveVideoMaxFrameDurationInternal___block_invoke;
  block[3] = &unk_1E5A74140;
  block[4] = self;
  void block[5] = &v18;
  void block[6] = &v42;
  void block[7] = &v38;
  dispatch_sync(devicePropsQueue, block);
  if (*((unsigned char *)v43 + 24))
  {
    [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"activeVideoMaxFrameDuration"];
    uint64_t v6 = self->_devicePropsQueue;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __67__AVCaptureFigVideoDevice__setActiveVideoMaxFrameDurationInternal___block_invoke_301;
    v14[3] = &unk_1E5A74168;
    v14[4] = self;
    v14[5] = &v18;
    v14[6] = &v46;
    v14[7] = &v34;
    v14[8] = &v27;
    v14[9] = &v23;
    dispatch_sync(v6, v14);
    if (*((_DWORD *)v47 + 6))
    {
      uint64_t v12 = v13;
      LODWORD(v11) = *((_DWORD *)v47 + 6);
      FigDebugAssert3();
    }
    else
    {
      if (*((unsigned char *)v39 + 24))
      {
        long long v50 = *((_OWORD *)v19 + 2);
        uint64_t v51 = v19[6];
        int v7 = [(AVCaptureFigVideoDevice *)self _setActiveVideoMinFrameDurationInternal:&v50];
        *((_DWORD *)v47 + 6) = v7;
      }
      if (*((unsigned char *)v35 + 24) && [(AVCaptureFigVideoDevice *)self lockForConfiguration:0])
      {
        LODWORD(v8) = *((_DWORD *)v24 + 6);
        long long v50 = *((_OWORD *)v28 + 2);
        uint64_t v51 = v28[6];
        [(AVCaptureFigVideoDevice *)self setExposureModeCustomWithDuration:&v50 ISO:0 completionHandler:v8];
        [(AVCaptureFigVideoDevice *)self unlockForConfiguration];
      }
    }
    [(AVCaptureFigVideoDevice *)self didChangeValueForKey:@"activeVideoMaxFrameDuration", v11, v12];
    int v9 = *((_DWORD *)v47 + 6);
  }
  else
  {
    int v9 = 0;
  }
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v46, 8);
  return v9;
}

- (void)setActiveVideoMinFrameDuration:(id *)a3
{
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x3810000000;
  uint64_t v36 = &unk_1A165D1D9;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v37 = *a3;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3052000000;
  int v30 = __Block_byref_object_copy__5;
  uint64_t v31 = __Block_byref_object_dispose__5;
  uint64_t v32 = 0;
  uint64_t v21 = 0;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v22 = &v21;
  uint64_t v23 = 0x3052000000;
  uint64_t v24 = __Block_byref_object_copy__5;
  uint64_t v25 = __Block_byref_object_dispose__5;
  uint64_t v26 = 0;
  if ((a3->var2 & 1) != 0
    && [(AVCaptureFigVideoDevice *)self isAutoVideoFrameRateEnabled])
  {
    long long v5 = (void *)MEMORY[0x1E4F1CA00];
    objc_opt_class();
    uint64_t v6 = (void *)[v5 exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithClassAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v6);
    }
    NSLog(&cfstr_SuppressingExc.isa, v6);
  }
  else
  {
    devicePropsQueue = self->_devicePropsQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__AVCaptureFigVideoDevice_setActiveVideoMinFrameDuration___block_invoke;
    block[3] = &unk_1E5A74190;
    block[4] = self;
    void block[5] = &v33;
    void block[6] = &v21;
    void block[7] = &v27;
    dispatch_sync(devicePropsQueue, block);
    if (v28[5])
    {
      double v8 = self->_devicePropsQueue;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __58__AVCaptureFigVideoDevice_setActiveVideoMinFrameDuration___block_invoke_2;
      v17[3] = &unk_1E5A741B8;
      long long v18 = *(_OWORD *)&a3->var0;
      int64_t var3 = a3->var3;
      void v17[4] = self;
      v17[5] = &v33;
      dispatch_sync(v8, v17);
      long long v15 = *((_OWORD *)v34 + 2);
      uint64_t v16 = v34[6];
      if ([(AVCaptureFigVideoDevice *)self _setActiveVideoMinFrameDurationInternal:&v15] == -16452)
      {
        int v9 = (void *)MEMORY[0x1E4F1CA00];
        objc_opt_class();
        BOOL v10 = (void *)[v9 exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:AVMethodExceptionReasonWithClassAndSelector() userInfo:0];
        if (AVCaptureShouldThrowForAPIViolations()) {
          objc_exception_throw(v10);
        }
        NSLog(&cfstr_SuppressingExc.isa, v10);
      }
    }
    else
    {
      uint64_t v11 = *((int *)v34 + 10);
      uint64_t v12 = v34[4];
      uint64_t v13 = (void *)MEMORY[0x1E4F1CA00];
      objc_opt_class();
      long long v14 = objc_msgSend(v13, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithClassAndSelector(), 0, v22[5], (float)(v11 / v12));
      if (AVCaptureShouldThrowForAPIViolations()) {
        objc_exception_throw(v14);
      }
      NSLog(&cfstr_SuppressingExc.isa, v14);
    }
  }
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);
}

- (void)_setActiveVideoMinFrameDuration:(id *)a3
{
  if ([(AVCaptureFigVideoDevice *)self lockForConfiguration:0])
  {
    long long v5 = *(_OWORD *)&a3->var0;
    int64_t var3 = a3->var3;
    [(AVCaptureFigVideoDevice *)self _setActiveVideoMinFrameDurationInternal:&v5];
    [(AVCaptureFigVideoDevice *)self unlockForConfiguration];
  }
}

- (int)_setActiveVideoMinFrameDurationInternal:(id *)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  uint64_t v46 = 0;
  unsigned int v47 = &v46;
  uint64_t v48 = 0x2020000000;
  int v49 = 0;
  uint64_t v42 = 0;
  unsigned int v43 = &v42;
  uint64_t v44 = 0x2020000000;
  char v45 = 0;
  uint64_t v38 = 0;
  uint64_t v39 = &v38;
  uint64_t v40 = 0x2020000000;
  char v41 = 0;
  uint64_t v34 = 0;
  uint64_t v35 = &v34;
  uint64_t v36 = 0x2020000000;
  char v37 = 0;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3810000000;
  int v30 = &unk_1A165D1D9;
  uint64_t v31 = 0;
  uint64_t v32 = 0;
  uint64_t v33 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x2020000000;
  int v26 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3810000000;
  uint64_t v21 = &unk_1A165D1D9;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v22 = *a3;
  if (dword_1EB4C9280)
  {
    int v17 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  devicePropsQueue = self->_devicePropsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__AVCaptureFigVideoDevice__setActiveVideoMinFrameDurationInternal___block_invoke;
  block[3] = &unk_1E5A74140;
  block[4] = self;
  void block[5] = &v18;
  void block[6] = &v42;
  void block[7] = &v38;
  dispatch_sync(devicePropsQueue, block);
  if (*((unsigned char *)v43 + 24))
  {
    [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"activeVideoMinFrameDuration"];
    uint64_t v6 = self->_devicePropsQueue;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __67__AVCaptureFigVideoDevice__setActiveVideoMinFrameDurationInternal___block_invoke_288;
    v14[3] = &unk_1E5A74168;
    v14[4] = self;
    v14[5] = &v18;
    v14[6] = &v46;
    v14[7] = &v34;
    v14[8] = &v27;
    v14[9] = &v23;
    dispatch_sync(v6, v14);
    if (*((_DWORD *)v47 + 6))
    {
      uint64_t v12 = v13;
      LODWORD(v11) = *((_DWORD *)v47 + 6);
      FigDebugAssert3();
    }
    else
    {
      if (*((unsigned char *)v39 + 24))
      {
        long long v50 = *((_OWORD *)v19 + 2);
        uint64_t v51 = v19[6];
        int v7 = [(AVCaptureFigVideoDevice *)self _setActiveVideoMaxFrameDurationInternal:&v50];
        *((_DWORD *)v47 + 6) = v7;
      }
      if (*((unsigned char *)v35 + 24) && [(AVCaptureFigVideoDevice *)self lockForConfiguration:0])
      {
        LODWORD(v8) = *((_DWORD *)v24 + 6);
        long long v50 = *((_OWORD *)v28 + 2);
        uint64_t v51 = v28[6];
        [(AVCaptureFigVideoDevice *)self setExposureModeCustomWithDuration:&v50 ISO:0 completionHandler:v8];
        [(AVCaptureFigVideoDevice *)self unlockForConfiguration];
      }
    }
    [(AVCaptureFigVideoDevice *)self didChangeValueForKey:@"activeVideoMinFrameDuration", v11, v12];
    int v9 = *((_DWORD *)v47 + 6);
  }
  else
  {
    int v9 = 0;
  }
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v46, 8);
  return v9;
}

- (BOOL)isLowLightVideoCaptureEnabled
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__AVCaptureFigVideoDevice_isLowLightVideoCaptureEnabled__block_invoke;
  v5[3] = &unk_1E5A74078;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isAutoVideoFrameRateEnabled
{
  if ([(AVCaptureFigVideoDevice *)self isVariableFrameRateVideoCaptureEnabled]) {
    return 1;
  }

  return [(AVCaptureFigVideoDevice *)self isLowLightVideoCaptureEnabled];
}

- (BOOL)isVariableFrameRateVideoCaptureEnabled
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __65__AVCaptureFigVideoDevice_isVariableFrameRateVideoCaptureEnabled__block_invoke;
  v5[3] = &unk_1E5A74078;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (float)exposureTargetBias
{
  uint64_t v6 = 0;
  int v7 = (float *)&v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__AVCaptureFigVideoDevice_exposureTargetBias__block_invoke;
  v5[3] = &unk_1E5A74078;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  float v3 = v7[6];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)virtualDeviceSwitchOverVideoZoomFactors
{
  id v2 = [(NSDictionary *)self->_fcsAttributes objectForKeyedSubscript:*MEMORY[0x1E4F51B08]];
  if ([v2 count]) {
    return v2;
  }
  else {
    return (id)MEMORY[0x1E4F1CBF0];
  }
}

- (int64_t)focusMode
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__AVCaptureFigVideoDevice_focusMode__block_invoke;
  v5[3] = &unk_1E5A74078;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __58__AVCaptureFigVideoDevice_setActiveVideoMaxFrameDuration___block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if ((*(unsigned char *)(a1 + 76) & 1) == 0)
  {
    [*(id *)(*(void *)(a1 + 32) + 144) defaultActiveMaxFrameDurationForSessionPreset:*(void *)(*(void *)(a1 + 32) + 160)];
    uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
    *(_OWORD *)(v2 + 32) = v31;
    *(void *)(v2 + 48) = v32;
  }
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 144) videoSupportedFrameRateRanges];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  int64_t v3 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v28;
LABEL_5:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v28 != v6) {
        objc_enumerationMutation(v3);
      }
      uint64_t v8 = *(void **)(*((void *)&v27 + 1) + 8 * v7);
      CMTime time1 = *(CMTime *)(*(void *)(*(void *)(a1 + 40) + 8) + 32);
      if ([v8 includesFrameDuration:&time1]) {
        break;
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v27 objects:v33 count:16];
        if (v5) {
          goto LABEL_5;
        }
        goto LABEL_11;
      }
    }
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    if (!v8) {
      goto LABEL_15;
    }
    uint64_t v10 = *(void *)(a1 + 32) + 304;
    if (*(unsigned char *)(a1 + 76))
    {
      long long v16 = *(_OWORD *)(v9 + 32);
      *(void *)(*(void *)(a1 + 32) + 320) = *(void *)(v9 + 48);
      *(_OWORD *)uint64_t v10 = v16;
    }
    else
    {
      uint64_t v11 = MEMORY[0x1E4F1F9F8];
      *(_OWORD *)uint64_t v10 = *MEMORY[0x1E4F1F9F8];
      *(void *)(v10 + 16) = *(void *)(v11 + 16);
    }
    uint64_t v17 = *(void *)(a1 + 32);
    uint64_t v18 = (long long *)(v17 + 304);
    if (*(unsigned char *)(v17 + 316))
    {
      uint64_t v19 = (long long *)(v17 + 256);
      if (*((unsigned char *)v19 + 12))
      {
        long long v20 = *v19;
        time1.epoch = *((void *)v19 + 2);
        *(_OWORD *)&time1.CMTimeValue value = v20;
        long long v21 = *v18;
        time2.epoch = *((void *)v18 + 2);
        *(_OWORD *)&time2.CMTimeValue value = v21;
        if (CMTimeCompare(&time1, &time2) >= 1)
        {
          $3CC8671D27C23BF42ADDB32F2B5E48AE v22 = *(long long **)(a1 + 32);
          uint64_t v23 = v22 + 16;
          v22 += 19;
          long long v24 = *v22;
          *((void *)v23 + 2) = *((void *)v22 + 2);
          *uint64_t v23 = v24;
        }
      }
    }
  }
  else
  {
LABEL_11:
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
LABEL_15:
    float v12 = (float)(*(int *)(v9 + 40) / *(uint64_t *)(v9 + 32));
    uint64_t v13 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v14 = *MEMORY[0x1E4F1C3C8];
    objc_opt_class();
    long long v15 = objc_msgSend(v13, "exceptionWithName:reason:userInfo:", v14, AVMethodExceptionReasonWithClassAndSelector(), 0, *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v12);
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v15);
    }
    NSLog(&cfstr_SuppressingExc.isa, v15);
  }
}

uint64_t __58__AVCaptureFigVideoDevice_setActiveVideoMinFrameDuration___block_invoke(void *a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ((*(unsigned char *)(*(void *)(a1[5] + 8) + 44) & 1) == 0)
  {
    [*(id *)(a1[4] + 144) defaultActiveMinFrameDurationForSessionPreset:*(void *)(a1[4] + 160)];
    uint64_t v2 = *(void *)(a1[5] + 8);
    *(_OWORD *)(v2 + 32) = v16;
    *(void *)(v2 + 48) = v17;
  }
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 144) videoSupportedFrameRateRanges];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  int64_t v3 = *(void **)(*(void *)(a1[6] + 8) + 40);
  uint64_t result = [v3 countByEnumeratingWithState:&v12 objects:v18 count:16];
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v12 + 1) + 8 * v7);
        uint64_t v9 = *(void *)(a1[5] + 8);
        long long v10 = *(_OWORD *)(v9 + 32);
        uint64_t v11 = *(void *)(v9 + 48);
        uint64_t result = [v8 includesFrameDuration:&v10];
        if (result)
        {
          *(void *)(*(void *)(a1[7] + 8) + 40) = v8;
          return result;
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t result = [v3 countByEnumeratingWithState:&v12 objects:v18 count:16];
      uint64_t v5 = result;
      if (result) {
        continue;
      }
      break;
    }
  }
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)activeVideoMaxFrameDuration
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3810000000;
  long long v10 = &unk_1A165D1D9;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__AVCaptureFigVideoDevice_activeVideoMaxFrameDuration__block_invoke;
  block[3] = &unk_1E5A74078;
  block[4] = self;
  void block[5] = &v7;
  dispatch_sync(devicePropsQueue, block);
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)(v8 + 4);
  _Block_object_dispose(&v7, 8);
  return result;
}

id __60__AVCaptureFigVideoDevice_preferredPrimaryConstituentDevice__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(a1 + 32) + 1024);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

id __57__AVCaptureFigVideoDevice_activePrimaryConstituentDevice__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(a1 + 32) + 968);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

uint64_t __102__AVCaptureFigVideoDevice__setActiveFormat_resetVideoZoomFactorAndMinMaxFrameDurations_sessionPreset___block_invoke_12(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 856) = *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24);
  return result;
}

void *__40__AVCaptureFigVideoDevice_setFlashMode___block_invoke(void *result)
{
  uint64_t v1 = result[4];
  if (!*(unsigned char *)(v1 + 768))
  {
    *(void *)(*(void *)(result[5] + 8) + 24) = 0;
    uint64_t v1 = result[4];
  }
  *(void *)(v1 + 736) = *(void *)(*(void *)(result[5] + 8) + 24);
  *(unsigned char *)(result[4] + 744) = *(void *)(*(void *)(result[5] + 8) + 24) == 2;
  *(unsigned char *)(*(void *)(result[6] + 8) + 24) = *(unsigned char *)(result[4] + 744);
  *(unsigned char *)(*(void *)(result[7] + 8) + 24) = *(unsigned char *)(result[4] + 745);
  return result;
}

- (void)setWhiteBalanceMode:(int64_t)a3
{
  if (-[AVCaptureFigVideoDevice isWhiteBalanceModeSupported:](self, "isWhiteBalanceModeSupported:"))
  {
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x2020000000;
    devicePropsQueue = self->_devicePropsQueue;
    int v15 = 0;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__AVCaptureFigVideoDevice_setWhiteBalanceMode___block_invoke;
    block[3] = &unk_1E5A74230;
    block[4] = self;
    void block[5] = &v12;
    void block[6] = a3;
    dispatch_sync(devicePropsQueue, block);
    if (*((_DWORD *)v13 + 6) == -16452)
    {
      uint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
      objc_opt_class();
      uint64_t v7 = (void *)[v6 exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:AVMethodExceptionReasonWithClassAndSelector() userInfo:0];
      if (AVCaptureShouldThrowForAPIViolations()) {
        objc_exception_throw(v7);
      }
      NSLog(&cfstr_SuppressingExc.isa, v7);
    }
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v9 = *MEMORY[0x1E4F1C3C8];
    objc_opt_class();
    long long v10 = objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, AVMethodExceptionReasonWithClassAndSelector(), 0, a3);
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v10);
    }
    NSLog(&cfstr_SuppressingExc.isa, v10);
  }
}

- (BOOL)isWhiteBalanceModeSupported:(int64_t)a3
{
  if ((a3 | 2) != 2) {
    return 0;
  }
  id v5 = -[NSDictionary objectForKeyedSubscript:](self->_fcsAttributes, "objectForKeyedSubscript:", *MEMORY[0x1E4F51CB8], v3);
  return [v5 BOOLValue];
}

- (BOOL)isAdjustingFocus
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__AVCaptureFigVideoDevice_isAdjustingFocus__block_invoke;
  v5[3] = &unk_1E5A74078;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isHEVCSupported
{
  int BoolAnswer = AVGestaltGetBoolAnswer(@"AVGQCaptureAppsMayUseHEVC");
  if (BoolAnswer)
  {
    id v4 = [(NSDictionary *)self->_fcsAttributes objectForKeyedSubscript:*MEMORY[0x1E4F51BC0]];
    LOBYTE(BoolAnswer) = [v4 BOOLValue];
  }
  return BoolAnswer;
}

- (BOOL)isProResSupported
{
  id v2 = [(NSDictionary *)self->_fcsAttributes objectForKeyedSubscript:*MEMORY[0x1E4F51C38]];

  return [v2 BOOLValue];
}

- (BOOL)isHEVCPreferred
{
  id v2 = [(NSDictionary *)self->_fcsAttributes objectForKeyedSubscript:*MEMORY[0x1E4F51C28]];

  return [v2 BOOLValue];
}

- (BOOL)isRampingVideoZoom
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__AVCaptureFigVideoDevice_isRampingVideoZoom__block_invoke;
  v5[3] = &unk_1E5A74078;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __50__AVCaptureFigVideoDevice__setUpCameraHistoryOnce__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = +[AVCaptureProprietaryDefaultsSingleton cameraHistoryDownplayOverrideList];
  char v6 = [v5 containsObject:sUserPreferredCameraHistoryKey];
  if (dword_1EB4C9280)
  {
    unsigned int v20 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  os_unfair_lock_lock((os_unfair_lock_t)&sCameraHistoryLock);

  sUserPreferredCameraHistorCGFloat y = a3;
  sDownplayUserPreferredCameraOverrideHistorCGFloat y = v6;
  os_unfair_lock_unlock((os_unfair_lock_t)&sCameraHistoryLock);
  if (dword_1EB4C9280)
  {
    unsigned int v20 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    uint64_t v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  char v9 = +[AVCaptureFigVideoDevice _cameraHistoryDispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__AVCaptureFigVideoDevice__setUpCameraHistoryOnce__block_invoke_33;
  block[3] = &unk_1E5A72ED0;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(v9, block);
  if (dword_1EB4C9280)
  {
    unsigned int v20 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    long long v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v11 = v20;
    if (os_log_type_enabled(v10, type)) {
      unsigned int v12 = v11;
    }
    else {
      unsigned int v12 = v11 & 0xFFFFFFFE;
    }
    if (v12)
    {
      int v21 = 136315138;
      $3CC8671D27C23BF42ADDB32F2B5E48AE v22 = "+[AVCaptureFigVideoDevice _setUpCameraHistoryOnce]_block_invoke";
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    if (dword_1EB4C9280)
    {
      unsigned int v20 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      uint64_t v13 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v14 = v20;
      if (os_log_type_enabled(v13, type)) {
        unsigned int v15 = v14;
      }
      else {
        unsigned int v15 = v14 & 0xFFFFFFFE;
      }
      if (v15)
      {
        int v21 = 136315395;
        $3CC8671D27C23BF42ADDB32F2B5E48AE v22 = "+[AVCaptureFigVideoDevice _setUpCameraHistoryOnce]_block_invoke";
        __int16 v23 = 2113;
        uint64_t v24 = sUserPreferredCameraHistoryKey;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
}

void __50__AVCaptureFigVideoDevice__setUpCameraHistoryOnce__block_invoke_40(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (dword_1EB4C9280)
  {
    unsigned int v18 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  os_unfair_lock_lock((os_unfair_lock_t)&sCameraHistoryLock);

  sStreamingCameraHistorCGFloat y = a3;
  os_unfair_lock_unlock((os_unfair_lock_t)&sCameraHistoryLock);
  if (dword_1EB4C9280)
  {
    unsigned int v18 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    char v6 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  uint64_t v7 = +[AVCaptureFigVideoDevice _cameraHistoryDispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__AVCaptureFigVideoDevice__setUpCameraHistoryOnce__block_invoke_41;
  block[3] = &unk_1E5A72ED0;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(v7, block);
  if (dword_1EB4C9280)
  {
    unsigned int v18 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    uint64_t v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v9 = v18;
    if (os_log_type_enabled(v8, type)) {
      unsigned int v10 = v9;
    }
    else {
      unsigned int v10 = v9 & 0xFFFFFFFE;
    }
    if (v10)
    {
      int v19 = 136315138;
      unsigned int v20 = "+[AVCaptureFigVideoDevice _setUpCameraHistoryOnce]_block_invoke";
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    if (dword_1EB4C9280)
    {
      unsigned int v18 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      unsigned int v11 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v12 = v18;
      if (os_log_type_enabled(v11, type)) {
        unsigned int v13 = v12;
      }
      else {
        unsigned int v13 = v12 & 0xFFFFFFFE;
      }
      if (v13)
      {
        int v19 = 136315395;
        unsigned int v20 = "+[AVCaptureFigVideoDevice _setUpCameraHistoryOnce]_block_invoke";
        __int16 v21 = 2113;
        uint64_t v22 = sStreamingCameraHistoryKey;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
}

void __50__AVCaptureFigVideoDevice__setUpCameraHistoryOnce__block_invoke_35(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = +[AVCaptureProprietaryDefaultsSingleton cameraHistoryDownplayOverrideList];
  char v6 = [v5 containsObject:sUserPreferredCameraHistoryKey];
  if (dword_1EB4C9280)
  {
    unsigned int v20 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  os_unfair_lock_lock((os_unfair_lock_t)&sCameraHistoryLock);

  sUserPreferredCameraOverrideHistorCGFloat y = a3;
  sDownplayUserPreferredCameraOverrideHistorCGFloat y = v6;
  os_unfair_lock_unlock((os_unfair_lock_t)&sCameraHistoryLock);
  if (dword_1EB4C9280)
  {
    unsigned int v20 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    uint64_t v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  unsigned int v9 = +[AVCaptureFigVideoDevice _cameraHistoryDispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__AVCaptureFigVideoDevice__setUpCameraHistoryOnce__block_invoke_36;
  block[3] = &unk_1E5A72ED0;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(v9, block);
  if (dword_1EB4C9280)
  {
    unsigned int v20 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    unsigned int v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v11 = v20;
    if (os_log_type_enabled(v10, type)) {
      unsigned int v12 = v11;
    }
    else {
      unsigned int v12 = v11 & 0xFFFFFFFE;
    }
    if (v12)
    {
      int v21 = 136315138;
      uint64_t v22 = "+[AVCaptureFigVideoDevice _setUpCameraHistoryOnce]_block_invoke";
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    if (dword_1EB4C9280)
    {
      unsigned int v20 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      unsigned int v13 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v14 = v20;
      if (os_log_type_enabled(v13, type)) {
        unsigned int v15 = v14;
      }
      else {
        unsigned int v15 = v14 & 0xFFFFFFFE;
      }
      if (v15)
      {
        int v21 = 136315395;
        uint64_t v22 = "+[AVCaptureFigVideoDevice _setUpCameraHistoryOnce]_block_invoke";
        __int16 v23 = 2113;
        uint64_t v24 = sUserPreferredCameraOverrideHistoryKey;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
}

uint64_t __67__AVCaptureFigVideoDevice__setActiveVideoMaxFrameDurationInternal___block_invoke(void *a1)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1[4];
  if ((!*(unsigned char *)(v2 + 1220) || !*(unsigned char *)(v2 + 1221)) && !*(unsigned char *)(v2 + 1307)) {
    goto LABEL_21;
  }
  char v3 = (void *)[*(id *)(v2 + 144) videoFrameRateRangeForCenterStage];
  id v4 = v3;
  id v5 = (CMTime *)(*(void *)(a1[5] + 8) + 32);
  if (v3) {
    [v3 minFrameDuration];
  }
  else {
    memset(&time2, 0, sizeof(time2));
  }
  CMTime time1 = *v5;
  if (CMTimeCompare(&time1, &time2) < 0)
  {
    if (v4)
    {
      uint64_t v7 = v49;
      [v4 minFrameDuration];
    }
    else
    {
      memset(v49, 0, sizeof(v49));
      uint64_t v7 = v49;
    }
    goto LABEL_18;
  }
  char v6 = (CMTime *)(*(void *)(a1[5] + 8) + 32);
  if (v4) {
    [v4 maxFrameDuration];
  }
  else {
    memset(&v48, 0, sizeof(v48));
  }
  CMTime time1 = *v6;
  if (CMTimeCompare(&time1, &v48) >= 1)
  {
    if (v4)
    {
      uint64_t v7 = v47;
      [v4 maxFrameDuration];
    }
    else
    {
      memset(v47, 0, sizeof(v47));
      uint64_t v7 = v47;
    }
LABEL_18:
    uint64_t v8 = *(void *)(a1[5] + 8);
    *(_OWORD *)(v8 + 32) = *(_OWORD *)v7;
    *(void *)(v8 + 48) = v7[2];
  }
  if (dword_1EB4C9280)
  {
    int v46 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
LABEL_21:
  uint64_t v10 = a1[4];
  if (*(unsigned char *)(v10 + 1258) && *(unsigned char *)(v10 + 1259))
  {
    unsigned int v11 = (void *)[*(id *)(v10 + 144) videoFrameRateRangeForBackgroundBlur];
    unsigned int v12 = v11;
    unsigned int v13 = (CMTime *)(*(void *)(a1[5] + 8) + 32);
    if (v11) {
      [v11 minFrameDuration];
    }
    else {
      memset(&v44, 0, sizeof(v44));
    }
    CMTime time1 = *v13;
    if (CMTimeCompare(&time1, &v44) < 0)
    {
      if (v12)
      {
        [v12 minFrameDuration];
      }
      else
      {
        long long v42 = 0uLL;
        uint64_t v43 = 0;
      }
      uint64_t v14 = *(void *)(a1[5] + 8);
      *(_OWORD *)(v14 + 32) = v42;
      *(void *)(v14 + 48) = v43;
    }
  }
  uint64_t v15 = a1[4];
  if (*(unsigned char *)(v15 + 1261) && *(unsigned char *)(v15 + 1262))
  {
    uint64_t v16 = (void *)[*(id *)(v15 + 144) videoFrameRateRangeForStudioLight];
    uint64_t v17 = v16;
    unsigned int v18 = (CMTime *)(*(void *)(a1[5] + 8) + 32);
    if (v16) {
      [v16 minFrameDuration];
    }
    else {
      memset(&v41, 0, sizeof(v41));
    }
    CMTime time1 = *v18;
    if (CMTimeCompare(&time1, &v41) < 0)
    {
      if (v17)
      {
        [v17 minFrameDuration];
      }
      else
      {
        long long v39 = 0uLL;
        uint64_t v40 = 0;
      }
      uint64_t v19 = *(void *)(a1[5] + 8);
      *(_OWORD *)(v19 + 32) = v39;
      *(void *)(v19 + 48) = v40;
    }
  }
  uint64_t v20 = a1[4];
  if (*(unsigned char *)(v20 + 1267) && *(unsigned char *)(v20 + 1268))
  {
    int v21 = (void *)[*(id *)(v20 + 144) videoFrameRateRangeForBackgroundReplacement];
    uint64_t v22 = v21;
    __int16 v23 = (CMTime *)(*(void *)(a1[5] + 8) + 32);
    if (v21) {
      [v21 minFrameDuration];
    }
    else {
      memset(&v38, 0, sizeof(v38));
    }
    CMTime time1 = *v23;
    if (CMTimeCompare(&time1, &v38) < 0)
    {
      if (v22)
      {
        [v22 minFrameDuration];
      }
      else
      {
        long long v36 = 0uLL;
        uint64_t v37 = 0;
      }
      uint64_t v24 = *(void *)(a1[5] + 8);
      *(_OWORD *)(v24 + 32) = v36;
      *(void *)(v24 + 48) = v37;
    }
  }
  uint64_t v25 = a1[4];
  if (*(unsigned char *)(v25 + 212))
  {
    CMTime time1 = *(CMTime *)(*(void *)(a1[5] + 8) + 32);
    long long v26 = *(_OWORD *)(v25 + 200);
    v51.epoch = *(void *)(v25 + 216);
    *(_OWORD *)&v51.CMTimeValue value = v26;
    int32_t v27 = CMTimeCompare(&time1, &v51);
    uint64_t v25 = a1[4];
    if (v27 < 0)
    {
      uint64_t v28 = *(void *)(a1[5] + 8);
      long long v29 = (long long *)(v25 + 200);
      long long v30 = *v29;
      *(void *)(v28 + 48) = *((void *)v29 + 2);
      *(_OWORD *)(v28 + 32) = v30;
      uint64_t v25 = a1[4];
    }
  }
  long long v31 = (long long *)(v25 + 280);
  CMTime time1 = *(CMTime *)(*(void *)(a1[5] + 8) + 32);
  long long v32 = *v31;
  v51.epoch = *((void *)v31 + 2);
  *(_OWORD *)&v51.CMTimeValue value = v32;
  uint64_t result = CMTimeCompare(&time1, &v51);
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = result != 0;
  if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
  {
    uint64_t v34 = *(void *)(a1[5] + 8);
    long long v35 = *(_OWORD *)(a1[4] + 232);
    time1.epoch = *(void *)(a1[4] + 248);
    *(_OWORD *)&time1.CMTimeValue value = v35;
    CMTime v51 = *(CMTime *)(v34 + 32);
    uint64_t result = CMTimeCompare(&time1, &v51);
    *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = (int)result > 0;
  }
  return result;
}

- (BOOL)isCenterStageMetadataDeliverySupported
{
  return BYTE3(self->_degradedCaptureQualityFactors);
}

void __52__AVCaptureFigVideoDevice_setActiveDepthDataFormat___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isEqual:*(void *)(*(void *)(a1 + 40) + 152)] & 1) == 0)
  {
    id v2 = *(id *)(a1 + 32);

    *(void *)(*(void *)(a1 + 40) + 152) = *(void *)(a1 + 32);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

__n128 __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_6(uint64_t a1)
{
  uint64_t v1 = (__n128 *)(*(void *)(a1 + 32) + 492);
  unint64_t v2 = *(void *)(a1 + 56);
  __n128 result = *(__n128 *)(a1 + 40);
  *uint64_t v1 = result;
  v1[1].n128_u64[0] = v2;
  return result;
}

- (void)_updateMinMaxDefaultVideoZoomFactors
{
  double v10 = 0.0;
  double v11 = 0.0;
  double v9 = 0.0;
  [(AVCaptureFigVideoDevice *)self _computeMinVideoZoomFactorOut:&v11 maxVideoZoomFactorOut:&v10 defaultVideoZoomFactorOut:&v9 centerStageActiveOverride:BYTE4(self->_degradedCaptureQualityFactors) resetZoomFactor:0];
  [(AVCaptureFigVideoDevice *)self _setMinAvailableVideoZoomFactor:v11];
  [(AVCaptureFigVideoDevice *)self _setMaxAvailableVideoZoomFactor:v10];
  uint64_t v5 = 0;
  char v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __63__AVCaptureFigVideoDevice__updateMinMaxDefaultVideoZoomFactors__block_invoke;
  v4[3] = &unk_1E5A74230;
  *(double *)&void v4[6] = v9;
  v4[4] = self;
  void v4[5] = &v5;
  dispatch_sync(devicePropsQueue, v4);
  if (*((unsigned char *)v6 + 24)) {
    [(AVCaptureFigVideoDevice *)self _setVideoZoomFactor:v9];
  }
  _Block_object_dispose(&v5, 8);
}

- (void)_setVideoZoomFactor:(double)a3
{
  [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"videoZoomFactor"];
  devicePropsQueue = self->_devicePropsQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__AVCaptureFigVideoDevice__setVideoZoomFactor___block_invoke;
  void v6[3] = &unk_1E5A72F98;
  void v6[4] = self;
  *(double *)&v6[5] = a3;
  dispatch_sync(devicePropsQueue, v6);
  [(AVCaptureFigVideoDevice *)self didChangeValueForKey:@"videoZoomFactor"];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((void *)AVCaptureFigVideoDeviceCenterStageEnabledChangedContext == a6) {
    -[AVCaptureFigVideoDevice _updateCenterStageActiveForEnabled:updateDependentProperties:](self, "_updateCenterStageActiveForEnabled:updateDependentProperties:", objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E4F284C8], a4), "BOOLValue"), 1);
  }
  if ((void *)AVCaptureFigVideoDeviceCenterStageFramingModeChangedContext == a6) {
    -[AVCaptureFigVideoDevice _setCenterStageFramingMode:](self, "_setCenterStageFramingMode:", (int)objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E4F284C8]), "intValue"));
  }
  if ((void *)AVCaptureFigVideoDeviceBackgroundBlurEnabledChangedContext == a6) {
    -[AVCaptureFigVideoDevice _updateBackgroundBlurActiveForEnabled:](self, "_updateBackgroundBlurActiveForEnabled:", objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E4F284C8]), "BOOLValue"));
  }
  if ((void *)AVCaptureFigVideoDeviceStudioLightingEnabledChangedContext == a6) {
    -[AVCaptureFigVideoDevice _updateStudioLightingActiveForEnabled:](self, "_updateStudioLightingActiveForEnabled:", objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E4F284C8]), "BOOLValue"));
  }
  if ((void *)AVCaptureFigVideoDeviceReactionEffectsEnabledChangedContext == a6) {
    -[AVCaptureFigVideoDevice _updateReactionEffectsActiveForEnabled:](self, "_updateReactionEffectsActiveForEnabled:", objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E4F284C8]), "BOOLValue"));
  }
  if ((void *)AVCaptureFigVideoDeviceBackgroundReplacementEnabledChangedContext == a6) {
    -[AVCaptureFigVideoDevice _updateBackgroundReplacementActiveForEnabled:](self, "_updateBackgroundReplacementActiveForEnabled:", objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E4F284C8]), "BOOLValue"));
  }
  if ((void *)AVCaptureFigVideoDevicePortraitEffectStudioLightQualityChangedContext == a6) {
    -[AVCaptureFigVideoDevice _updatePortraitEffectStudioLightQuality:](self, "_updatePortraitEffectStudioLightQuality:", (int)objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E4F284C8]), "intValue"));
  }
  if ((void *)AVCaptureFigVideoDeviceBackgroundBlurApertureChangedContext == a6)
  {
    objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E4F284C8]), "floatValue");
    -[AVCaptureFigVideoDevice _updateBackgroundBlurAperture:](self, "_updateBackgroundBlurAperture:");
  }
  if ((void *)AVCaptureFigVideoDeviceStudioLightingIntensityChangedContext == a6)
  {
    objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E4F284C8]), "floatValue");
    -[AVCaptureFigVideoDevice _updateStudioLightingIntensity:](self, "_updateStudioLightingIntensity:");
  }
  if ((void *)AVCaptureFigVideoDeviceGesturesEnabledChangedContext == a6) {
    -[AVCaptureFigVideoDevice _updateGesturesEnabled:](self, "_updateGesturesEnabled:", objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E4F284C8]), "BOOLValue"));
  }
  if ((void *)AVCaptureFigVideoDeviceBackgroundReplacementPixelBufferChangedContext == a6)
  {
    double v9 = +[AVCaptureDevice backgroundReplacementPixelBuffer];
    [(AVCaptureFigVideoDevice *)self _updateBackgroundReplacementPixelBuffer:v9];
  }
}

- (void)_updateStudioLightingIntensity:(float)a3
{
  devicePropsQueue = self->_devicePropsQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__AVCaptureFigVideoDevice__updateStudioLightingIntensity___block_invoke;
  v4[3] = &unk_1E5A74370;
  v4[4] = self;
  float v5 = a3;
  dispatch_sync(devicePropsQueue, v4);
}

- (void)_updateStudioLightingActiveForEnabled:(BOOL)a3
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  uint64_t v9 = 0;
  double v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__AVCaptureFigVideoDevice__updateStudioLightingActiveForEnabled___block_invoke;
  block[3] = &unk_1E5A740C8;
  block[4] = self;
  void block[5] = &v13;
  void block[6] = &v9;
  BOOL v8 = a3;
  dispatch_sync(devicePropsQueue, block);
  if (*((unsigned __int8 *)v14 + 24) != *((unsigned __int8 *)v10 + 24))
  {
    [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"studioLightingActive"];
    [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"studioLightActive"];
    float v5 = self->_devicePropsQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __65__AVCaptureFigVideoDevice__updateStudioLightingActiveForEnabled___block_invoke_2;
    void v6[3] = &unk_1E5A73EF0;
    void v6[4] = self;
    v6[5] = &v9;
    dispatch_sync(v5, v6);
    [(AVCaptureFigVideoDevice *)self didChangeValueForKey:@"studioLightActive"];
    [(AVCaptureFigVideoDevice *)self didChangeValueForKey:@"studioLightingActive"];
  }
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);
}

- (void)_updateReactionEffectsActiveForEnabled:(BOOL)a3
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  uint64_t v9 = 0;
  double v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__AVCaptureFigVideoDevice__updateReactionEffectsActiveForEnabled___block_invoke;
  block[3] = &unk_1E5A740C8;
  block[4] = self;
  void block[5] = &v13;
  void block[6] = &v9;
  BOOL v8 = a3;
  dispatch_sync(devicePropsQueue, block);
  if (*((unsigned __int8 *)v14 + 24) != *((unsigned __int8 *)v10 + 24))
  {
    [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"canPerformReactionEffects"];
    float v5 = self->_devicePropsQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __66__AVCaptureFigVideoDevice__updateReactionEffectsActiveForEnabled___block_invoke_2;
    void v6[3] = &unk_1E5A73EF0;
    void v6[4] = self;
    v6[5] = &v9;
    dispatch_sync(v5, v6);
    [(AVCaptureFigVideoDevice *)self didChangeValueForKey:@"canPerformReactionEffects"];
  }
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);
}

- (void)_updatePortraitEffectStudioLightQuality:(int64_t)a3
{
  devicePropsQueue = self->_devicePropsQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __67__AVCaptureFigVideoDevice__updatePortraitEffectStudioLightQuality___block_invoke;
  v4[3] = &unk_1E5A72F98;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_sync(devicePropsQueue, v4);
}

- (void)_updateGesturesEnabled:(BOOL)a3
{
  devicePropsQueue = self->_devicePropsQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__AVCaptureFigVideoDevice__updateGesturesEnabled___block_invoke;
  v4[3] = &unk_1E5A74028;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(devicePropsQueue, v4);
}

- (void)_updateBackgroundBlurAperture:(float)a3
{
  devicePropsQueue = self->_devicePropsQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __57__AVCaptureFigVideoDevice__updateBackgroundBlurAperture___block_invoke;
  v4[3] = &unk_1E5A74370;
  v4[4] = self;
  float v5 = a3;
  dispatch_sync(devicePropsQueue, v4);
}

- (void)_updateBackgroundBlurActiveForEnabled:(BOOL)a3
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  uint64_t v9 = 0;
  double v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__AVCaptureFigVideoDevice__updateBackgroundBlurActiveForEnabled___block_invoke;
  block[3] = &unk_1E5A740C8;
  block[4] = self;
  void block[5] = &v13;
  void block[6] = &v9;
  BOOL v8 = a3;
  dispatch_sync(devicePropsQueue, block);
  if (*((unsigned __int8 *)v14 + 24) != *((unsigned __int8 *)v10 + 24))
  {
    [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"backgroundBlurActive"];
    [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"portraitEffectActive"];
    float v5 = self->_devicePropsQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __65__AVCaptureFigVideoDevice__updateBackgroundBlurActiveForEnabled___block_invoke_2;
    void v6[3] = &unk_1E5A73EF0;
    void v6[4] = self;
    v6[5] = &v9;
    dispatch_sync(v5, v6);
    [(AVCaptureFigVideoDevice *)self didChangeValueForKey:@"portraitEffectActive"];
    [(AVCaptureFigVideoDevice *)self didChangeValueForKey:@"backgroundBlurActive"];
  }
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);
}

- (void)_computeMinVideoZoomFactorOut:(double *)a3 maxVideoZoomFactorOut:(double *)a4 defaultVideoZoomFactorOut:(double *)a5 centerStageActiveOverride:(BOOL)a6 resetZoomFactor:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  [(AVCaptureDeviceFormat *)self->_activeFormat videoMaxZoomFactor];
  if (self->_cinematicVideoZoomEnabled)
  {
    objc_msgSend((id)objc_msgSend(-[AVCaptureDeviceFormat supportedZoomRangesForCinematicVideo](self->_activeFormat, "supportedZoomRangesForCinematicVideo"), "firstObject"), "minZoomFactor");
    double v15 = v14;
    id v16 = (id)objc_msgSend(-[AVCaptureDeviceFormat supportedZoomRangesForCinematicVideo](self->_activeFormat, "supportedZoomRangesForCinematicVideo"), "firstObject");
LABEL_3:
    [v16 maxZoomFactor];
LABEL_4:
    double v18 = v17;
    goto LABEL_5;
  }
  double v18 = v13;
  if (v8 && BYTE5(self->_degradedCaptureQualityFactors))
  {
    [(AVCaptureDeviceFormat *)self->_activeFormat videoMinZoomFactorForCenterStage];
    double v15 = v21;
    [(AVCaptureDeviceFormat *)self->_activeFormat videoMaxZoomFactorForCenterStage];
    goto LABEL_4;
  }
  if (LOBYTE(self->_stereoVideoCaptureStatus) && !self->_continuousZoomWithDepthActive)
  {
    objc_msgSend(-[NSArray firstObject](-[AVCaptureDeviceFormat supportedVideoZoomRangesForDepthDataDelivery](self->_activeFormat, "supportedVideoZoomRangesForDepthDataDelivery"), "firstObject"), "minZoomFactor");
    double v15 = v32;
    id v16 = [(NSArray *)[(AVCaptureDeviceFormat *)self->_activeFormat supportedVideoZoomRangesForDepthDataDelivery] lastObject];
    goto LABEL_3;
  }
  if (LOBYTE(self->_shallowDepthOfFieldEffectStatus))
  {
    [(AVCaptureDeviceFormat *)self->_activeFormat videoMinZoomFactorForCameraCalibrationDataDelivery];
    double v15 = v22;
    [(AVCaptureDeviceFormat *)self->_activeFormat videoMaxZoomFactorForCameraCalibrationDataDelivery];
    goto LABEL_4;
  }
  double v15 = 1.0;
LABEL_5:
  double maxAvailableVideoZoomFactor = self->_maxAvailableVideoZoomFactor;
  if (maxAvailableVideoZoomFactor > 1.0)
  {
    [(AVCaptureDeviceFormat *)self->_activeFormat videoMaxZoomFactor];
    if (maxAvailableVideoZoomFactor >= v20)
    {
      [(AVCaptureDeviceFormat *)self->_activeFormat videoMaxZoomFactor];
      double v18 = v23;
    }
    else
    {
      double v18 = self->_maxAvailableVideoZoomFactor;
    }
  }
  double v24 = *(float *)&self->_activeColorSpace;
  if (LOBYTE(self->_stereoVideoCaptureStatus) && !self->_cinematicVideoZoomEnabled)
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v26 = [(AVCaptureDeviceFormat *)self->_activeFormat supportedVideoZoomRangesForDepthDataDelivery];
    uint64_t v27 = [(NSArray *)v26 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v34;
LABEL_27:
      uint64_t v30 = 0;
      while (1)
      {
        if (*(void *)v34 != v29) {
          objc_enumerationMutation(v26);
        }
        if ([*(id *)(*((void *)&v33 + 1) + 8 * v30) containsZoomFactor:v24]) {
          break;
        }
        if (v28 == ++v30)
        {
          uint64_t v28 = [(NSArray *)v26 countByEnumeratingWithState:&v33 objects:v37 count:16];
          if (v28) {
            goto LABEL_27;
          }
          goto LABEL_35;
        }
      }
      if (!v7) {
        goto LABEL_36;
      }
    }
LABEL_35:
    objc_msgSend(-[NSArray firstObject](-[AVCaptureDeviceFormat supportedVideoZoomRangesForDepthDataDelivery](self->_activeFormat, "supportedVideoZoomRangesForDepthDataDelivery"), "firstObject"), "minZoomFactor");
    double v24 = v31;
  }
  else if (v7 || (v15 <= v24 ? (BOOL v25 = v18 < v24) : (BOOL v25 = 1), v25))
  {
    double v24 = v15;
  }
LABEL_36:
  *a3 = v15;
  *a4 = v18;
  *a5 = v24;
}

__n128 __54__AVCaptureFigVideoDevice_activeVideoMinFrameDuration__block_invoke(uint64_t a1)
{
  unint64_t v2 = *(__n128 **)(*(void *)(a1 + 40) + 8);
  unint64_t v3 = *(void *)(*(void *)(a1 + 32) + 248);
  __n128 result = *(__n128 *)(*(void *)(a1 + 32) + 232);
  v2[2] = result;
  v2[3].n128_u64[0] = v3;
  uint64_t v5 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v5 + 1220) && *(unsigned char *)(v5 + 1221) || *(unsigned char *)(v5 + 1307))
  {
    char v6 = (CMTime *)(*(void *)(*(void *)(a1 + 40) + 8) + 32);
    BOOL v7 = (void *)[*(id *)(v5 + 144) videoFrameRateRangeForCenterStage];
    if (v7) {
      [v7 minFrameDuration];
    }
    else {
      memset(&time2, 0, sizeof(time2));
    }
    CMTime time1 = *v6;
    if (CMTimeCompare(&time1, &time2) < 0)
    {
      double v10 = (void *)[*(id *)(*(void *)(a1 + 32) + 144) videoFrameRateRangeForCenterStage];
      if (v10)
      {
        uint64_t v11 = (__n128 *)v55;
        [v10 minFrameDuration];
      }
      else
      {
        memset(v55, 0, sizeof(v55));
        uint64_t v11 = (__n128 *)v55;
      }
      goto LABEL_18;
    }
    BOOL v8 = (CMTime *)(*(void *)(*(void *)(a1 + 40) + 8) + 32);
    uint64_t v9 = (void *)[*(id *)(*(void *)(a1 + 32) + 144) videoFrameRateRangeForCenterStage];
    if (v9) {
      [v9 maxFrameDuration];
    }
    else {
      memset(&v54, 0, sizeof(v54));
    }
    CMTime time1 = *v8;
    if (CMTimeCompare(&time1, &v54) >= 1)
    {
      char v12 = (void *)[*(id *)(*(void *)(a1 + 32) + 144) videoFrameRateRangeForCenterStage];
      if (v12)
      {
        uint64_t v11 = (__n128 *)v53;
        [v12 maxFrameDuration];
      }
      else
      {
        memset(v53, 0, sizeof(v53));
        uint64_t v11 = (__n128 *)v53;
      }
LABEL_18:
      double v13 = *(__n128 **)(*(void *)(a1 + 40) + 8);
      __n128 result = *v11;
      void v13[2] = *v11;
      v13[3].n128_u64[0] = v11[1].n128_u64[0];
    }
  }
  uint64_t v14 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v14 + 1258) && *(unsigned char *)(v14 + 1259))
  {
    double v15 = (CMTime *)(*(void *)(*(void *)(a1 + 40) + 8) + 32);
    id v16 = (void *)[*(id *)(v14 + 144) videoFrameRateRangeForBackgroundBlur];
    if (v16) {
      [v16 minFrameDuration];
    }
    else {
      memset(&v52, 0, sizeof(v52));
    }
    CMTime time1 = *v15;
    if (CMTimeCompare(&time1, &v52) < 0)
    {
      uint64_t v19 = (void *)[*(id *)(*(void *)(a1 + 32) + 144) videoFrameRateRangeForBackgroundBlur];
      if (v19)
      {
        double v20 = (__n128 *)v51;
        [v19 minFrameDuration];
      }
      else
      {
        memset(v51, 0, sizeof(v51));
        double v20 = (__n128 *)v51;
      }
      goto LABEL_35;
    }
    double v17 = (CMTime *)(*(void *)(*(void *)(a1 + 40) + 8) + 32);
    double v18 = (void *)[*(id *)(*(void *)(a1 + 32) + 144) videoFrameRateRangeForBackgroundBlur];
    if (v18) {
      [v18 maxFrameDuration];
    }
    else {
      memset(&v50, 0, sizeof(v50));
    }
    CMTime time1 = *v17;
    if (CMTimeCompare(&time1, &v50) >= 1)
    {
      double v21 = (void *)[*(id *)(*(void *)(a1 + 32) + 144) videoFrameRateRangeForBackgroundBlur];
      if (v21)
      {
        double v20 = (__n128 *)v49;
        [v21 maxFrameDuration];
      }
      else
      {
        memset(v49, 0, sizeof(v49));
        double v20 = (__n128 *)v49;
      }
LABEL_35:
      double v22 = *(__n128 **)(*(void *)(a1 + 40) + 8);
      __n128 result = *v20;
      v22[2] = *v20;
      v22[3].n128_u64[0] = v20[1].n128_u64[0];
    }
  }
  uint64_t v23 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v23 + 1261) && *(unsigned char *)(v23 + 1262))
  {
    double v24 = (CMTime *)(*(void *)(*(void *)(a1 + 40) + 8) + 32);
    BOOL v25 = (void *)[*(id *)(v23 + 144) videoFrameRateRangeForStudioLight];
    if (v25) {
      [v25 minFrameDuration];
    }
    else {
      memset(&v48, 0, sizeof(v48));
    }
    CMTime time1 = *v24;
    if (CMTimeCompare(&time1, &v48) < 0)
    {
      uint64_t v28 = (void *)[*(id *)(*(void *)(a1 + 32) + 144) videoFrameRateRangeForStudioLight];
      if (v28)
      {
        uint64_t v29 = (__n128 *)v47;
        [v28 minFrameDuration];
      }
      else
      {
        memset(v47, 0, sizeof(v47));
        uint64_t v29 = (__n128 *)v47;
      }
      goto LABEL_52;
    }
    long long v26 = (CMTime *)(*(void *)(*(void *)(a1 + 40) + 8) + 32);
    uint64_t v27 = (void *)[*(id *)(*(void *)(a1 + 32) + 144) videoFrameRateRangeForStudioLight];
    if (v27) {
      [v27 maxFrameDuration];
    }
    else {
      memset(&v46, 0, sizeof(v46));
    }
    CMTime time1 = *v26;
    if (CMTimeCompare(&time1, &v46) >= 1)
    {
      uint64_t v30 = (void *)[*(id *)(*(void *)(a1 + 32) + 144) videoFrameRateRangeForStudioLight];
      if (v30)
      {
        uint64_t v29 = (__n128 *)v45;
        [v30 maxFrameDuration];
      }
      else
      {
        memset(v45, 0, sizeof(v45));
        uint64_t v29 = (__n128 *)v45;
      }
LABEL_52:
      double v31 = *(__n128 **)(*(void *)(a1 + 40) + 8);
      __n128 result = *v29;
      v31[2] = *v29;
      v31[3].n128_u64[0] = v29[1].n128_u64[0];
    }
  }
  uint64_t v32 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v32 + 1267) && *(unsigned char *)(v32 + 1268))
  {
    long long v33 = (CMTime *)(*(void *)(*(void *)(a1 + 40) + 8) + 32);
    long long v34 = (void *)[*(id *)(v32 + 144) videoFrameRateRangeForBackgroundReplacement];
    if (v34) {
      [v34 minFrameDuration];
    }
    else {
      memset(&v44, 0, sizeof(v44));
    }
    CMTime time1 = *v33;
    if (CMTimeCompare(&time1, &v44) < 0)
    {
      uint64_t v37 = (void *)[*(id *)(*(void *)(a1 + 32) + 144) videoFrameRateRangeForBackgroundReplacement];
      if (v37)
      {
        uint64_t v38 = (__n128 *)v43;
        [v37 minFrameDuration];
      }
      else
      {
        memset(v43, 0, sizeof(v43));
        uint64_t v38 = (__n128 *)v43;
      }
      goto LABEL_69;
    }
    long long v35 = (CMTime *)(*(void *)(*(void *)(a1 + 40) + 8) + 32);
    long long v36 = (void *)[*(id *)(*(void *)(a1 + 32) + 144) videoFrameRateRangeForBackgroundReplacement];
    if (v36) {
      [v36 maxFrameDuration];
    }
    else {
      memset(&v42, 0, sizeof(v42));
    }
    CMTime time1 = *v35;
    if (CMTimeCompare(&time1, &v42) >= 1)
    {
      long long v39 = (void *)[*(id *)(*(void *)(a1 + 32) + 144) videoFrameRateRangeForBackgroundReplacement];
      if (v39)
      {
        uint64_t v38 = (__n128 *)v41;
        [v39 maxFrameDuration];
      }
      else
      {
        memset(v41, 0, sizeof(v41));
        uint64_t v38 = (__n128 *)v41;
      }
LABEL_69:
      uint64_t v40 = *(__n128 **)(*(void *)(a1 + 40) + 8);
      __n128 result = *v38;
      void v40[2] = *v38;
      v40[3].n128_u64[0] = v38[1].n128_u64[0];
    }
  }
  return result;
}

__n128 __102__AVCaptureFigVideoDevice__setActiveFormat_resetVideoZoomFactorAndMinMaxFrameDurations_sessionPreset___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = (__n128 *)(*(void *)(a1 + 32) + 232);
  unint64_t v2 = *(__n128 **)(*(void *)(a1 + 40) + 8);
  unint64_t v3 = v2[3].n128_u64[0];
  __n128 result = v2[2];
  *uint64_t v1 = result;
  v1[1].n128_u64[0] = v3;
  return result;
}

uint64_t __65__AVCaptureFigVideoDevice__setFallbackPrimaryConstituentDevices___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _setFigCaptureSourceProperty:*MEMORY[0x1E4F51FE8] withValue:*(void *)(a1 + 40) cacheOnly:*(unsigned __int8 *)(*(void *)(a1 + 32) + 328)];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
  if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {

    uint64_t result = [*(id *)(a1 + 48) copy];
    *(void *)(*(void *)(a1 + 32) + 1016) = result;
  }
  return result;
}

uint64_t __67__AVCaptureFigVideoDevice__setActiveVideoMinFrameDurationInternal___block_invoke(void *a1)
{
  uint64_t v107 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1[4];
  if ((!*(unsigned char *)(v2 + 1220) || !*(unsigned char *)(v2 + 1221)) && !*(unsigned char *)(v2 + 1307)) {
    goto LABEL_21;
  }
  unint64_t v3 = (void *)[*(id *)(v2 + 144) videoFrameRateRangeForCenterStage];
  id v4 = v3;
  uint64_t v5 = (CMTime *)(*(void *)(a1[5] + 8) + 32);
  if (v3) {
    [v3 minFrameDuration];
  }
  else {
    memset(&time2, 0, sizeof(time2));
  }
  CMTime time1 = *v5;
  if (CMTimeCompare(&time1, &time2) < 0)
  {
    if (v4)
    {
      BOOL v7 = v98;
      [v4 minFrameDuration];
    }
    else
    {
      memset(v98, 0, sizeof(v98));
      BOOL v7 = v98;
    }
    goto LABEL_18;
  }
  char v6 = (CMTime *)(*(void *)(a1[5] + 8) + 32);
  if (v4) {
    [v4 maxFrameDuration];
  }
  else {
    memset(&v97, 0, sizeof(v97));
  }
  CMTime time1 = *v6;
  if (CMTimeCompare(&time1, &v97) >= 1)
  {
    if (v4)
    {
      BOOL v7 = v96;
      [v4 maxFrameDuration];
    }
    else
    {
      memset(v96, 0, sizeof(v96));
      BOOL v7 = v96;
    }
LABEL_18:
    uint64_t v8 = *(void *)(a1[5] + 8);
    *(_OWORD *)(v8 + 32) = *(_OWORD *)v7;
    *(void *)(v8 + 48) = v7[2];
  }
  if (dword_1EB4C9280)
  {
    unsigned int v95 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
LABEL_21:
  uint64_t v10 = a1[4];
  if (*(unsigned char *)(v10 + 1258) && *(unsigned char *)(v10 + 1259))
  {
    uint64_t v11 = (void *)[*(id *)(v10 + 144) videoFrameRateRangeForBackgroundBlur];
    char v12 = v11;
    double v13 = (CMTime *)(*(void *)(a1[5] + 8) + 32);
    if (v11) {
      [v11 minFrameDuration];
    }
    else {
      memset(&v93, 0, sizeof(v93));
    }
    CMTime time1 = *v13;
    if (CMTimeCompare(&time1, &v93) < 0)
    {
      if (v12)
      {
        [v12 minFrameDuration];
      }
      else
      {
        long long v91 = 0uLL;
        uint64_t v92 = 0;
      }
      uint64_t v14 = *(void *)(a1[5] + 8);
      *(_OWORD *)(v14 + 32) = v91;
      *(void *)(v14 + 48) = v92;
    }
    if (dword_1EB4C9280)
    {
      unsigned int v95 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      double v15 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v16 = v95;
      if (os_log_type_enabled(v15, type)) {
        unsigned int v17 = v16;
      }
      else {
        unsigned int v17 = v16 & 0xFFFFFFFE;
      }
      if (v17)
      {
        if (v12)
        {
          [v12 maxFrameDuration];
          uint64_t v18 = v88;
          [v12 maxFrameDuration];
          int v19 = v86;
          [v12 minFrameDuration];
          uint64_t v20 = v82;
          [v12 minFrameDuration];
          int v21 = v80;
        }
        else
        {
          int v21 = 0;
          uint64_t v20 = 0;
          uint64_t v18 = 0;
          int v19 = 0;
          uint64_t v88 = 0;
          uint64_t v89 = 0;
          uint64_t v90 = 0;
          uint64_t v86 = 0;
          uint64_t v87 = 0;
          uint64_t v84 = 0;
          uint64_t v85 = 0;
          uint64_t v82 = 0;
          uint64_t v83 = 0;
          uint64_t v80 = 0;
          uint64_t v81 = 0;
          uint64_t v79 = 0;
        }
        LODWORD(v100.value) = 136316162;
        *(CMTimeValue *)((char *)&v100.value + 4) = (CMTimeValue)"-[AVCaptureFigVideoDevice _setActiveVideoMinFrameDurati"
                                                                 "onInternal:]_block_invoke";
        LOWORD(v100.flags) = 2048;
        *(void *)((char *)&v100.flags + 2) = v18;
        HIWORD(v100.epoch) = 1024;
        int v101 = v19;
        __int16 v102 = 2048;
        uint64_t v103 = v20;
        __int16 v104 = 1024;
        LODWORD(v105) = v21;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  uint64_t v22 = a1[4];
  if (*(unsigned char *)(v22 + 1261) && *(unsigned char *)(v22 + 1262))
  {
    uint64_t v23 = (void *)[*(id *)(v22 + 144) videoFrameRateRangeForStudioLight];
    double v24 = v23;
    BOOL v25 = (CMTime *)(*(void *)(a1[5] + 8) + 32);
    if (v23) {
      [v23 minFrameDuration];
    }
    else {
      memset(&v78, 0, sizeof(v78));
    }
    CMTime time1 = *v25;
    if (CMTimeCompare(&time1, &v78) < 0)
    {
      if (v24)
      {
        [v24 minFrameDuration];
      }
      else
      {
        long long v76 = 0uLL;
        uint64_t v77 = 0;
      }
      uint64_t v26 = *(void *)(a1[5] + 8);
      *(_OWORD *)(v26 + 32) = v76;
      *(void *)(v26 + 48) = v77;
    }
    if (dword_1EB4C9280)
    {
      unsigned int v95 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      uint64_t v27 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v28 = v95;
      if (os_log_type_enabled(v27, type)) {
        unsigned int v29 = v28;
      }
      else {
        unsigned int v29 = v28 & 0xFFFFFFFE;
      }
      if (v29)
      {
        if (v24)
        {
          [v24 maxFrameDuration];
          uint64_t v30 = v73;
          [v24 maxFrameDuration];
          int v31 = v71;
          [v24 minFrameDuration];
          uint64_t v32 = v67;
          [v24 minFrameDuration];
          int v33 = v65;
        }
        else
        {
          int v33 = 0;
          uint64_t v32 = 0;
          uint64_t v30 = 0;
          int v31 = 0;
          uint64_t v73 = 0;
          uint64_t v74 = 0;
          uint64_t v75 = 0;
          uint64_t v71 = 0;
          uint64_t v72 = 0;
          uint64_t v69 = 0;
          uint64_t v70 = 0;
          uint64_t v67 = 0;
          uint64_t v68 = 0;
          uint64_t v65 = 0;
          uint64_t v66 = 0;
          uint64_t v64 = 0;
        }
        LODWORD(v100.value) = 136316162;
        *(CMTimeValue *)((char *)&v100.value + 4) = (CMTimeValue)"-[AVCaptureFigVideoDevice _setActiveVideoMinFrameDurati"
                                                                 "onInternal:]_block_invoke";
        LOWORD(v100.flags) = 2048;
        *(void *)((char *)&v100.flags + 2) = v30;
        HIWORD(v100.epoch) = 1024;
        int v101 = v31;
        __int16 v102 = 2048;
        uint64_t v103 = v32;
        __int16 v104 = 1024;
        LODWORD(v105) = v33;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  uint64_t v34 = a1[4];
  if (*(unsigned char *)(v34 + 1267) && *(unsigned char *)(v34 + 1268))
  {
    long long v35 = (void *)[*(id *)(v34 + 144) videoFrameRateRangeForBackgroundReplacement];
    long long v36 = v35;
    uint64_t v37 = (CMTime *)(*(void *)(a1[5] + 8) + 32);
    if (v35) {
      [v35 minFrameDuration];
    }
    else {
      memset(&v63, 0, sizeof(v63));
    }
    CMTime time1 = *v37;
    if (CMTimeCompare(&time1, &v63) < 0)
    {
      if (v36)
      {
        [v36 minFrameDuration];
      }
      else
      {
        long long v61 = 0uLL;
        uint64_t v62 = 0;
      }
      uint64_t v38 = *(void *)(a1[5] + 8);
      *(_OWORD *)(v38 + 32) = v61;
      *(void *)(v38 + 48) = v62;
    }
    if (dword_1EB4C9280)
    {
      unsigned int v95 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      long long v39 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v40 = v95;
      if (os_log_type_enabled(v39, type)) {
        unsigned int v41 = v40;
      }
      else {
        unsigned int v41 = v40 & 0xFFFFFFFE;
      }
      if (v41)
      {
        if (v36)
        {
          [v36 maxFrameDuration];
          uint64_t v42 = v60;
          [v36 maxFrameDuration];
          int v43 = v59;
          [v36 minFrameDuration];
          uint64_t v44 = v58;
          [v36 minFrameDuration];
          int v45 = v57;
        }
        else
        {
          int v45 = 0;
          uint64_t v44 = 0;
          uint64_t v42 = 0;
          int v43 = 0;
        }
        LODWORD(v100.value) = 136316162;
        *(CMTimeValue *)((char *)&v100.value + 4) = (CMTimeValue)"-[AVCaptureFigVideoDevice _setActiveVideoMinFrameDurati"
                                                                 "onInternal:]_block_invoke";
        LOWORD(v100.flags) = 2048;
        *(void *)((char *)&v100.flags + 2) = v42;
        HIWORD(v100.epoch) = 1024;
        int v101 = v43;
        __int16 v102 = 2048;
        uint64_t v103 = v44;
        __int16 v104 = 1024;
        LODWORD(v105) = v45;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  uint64_t v46 = a1[4];
  if (*(unsigned char *)(v46 + 212))
  {
    CMTime time1 = *(CMTime *)(*(void *)(a1[5] + 8) + 32);
    long long v47 = *(_OWORD *)(v46 + 200);
    v100.epoch = *(void *)(v46 + 216);
    *(_OWORD *)&v100.CMTimeValue value = v47;
    int32_t v48 = CMTimeCompare(&time1, &v100);
    uint64_t v46 = a1[4];
    if (v48 < 0)
    {
      uint64_t v49 = *(void *)(a1[5] + 8);
      CMTime v50 = (long long *)(v46 + 200);
      long long v51 = *v50;
      *(void *)(v49 + 48) = *((void *)v50 + 2);
      *(_OWORD *)(v49 + 32) = v51;
      uint64_t v46 = a1[4];
    }
  }
  CMTime v52 = (long long *)(v46 + 232);
  CMTime time1 = *(CMTime *)(*(void *)(a1[5] + 8) + 32);
  long long v53 = *v52;
  v100.epoch = *((void *)v52 + 2);
  *(_OWORD *)&v100.CMTimeValue value = v53;
  uint64_t result = CMTimeCompare(&time1, &v100);
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = result != 0;
  if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
  {
    uint64_t v55 = *(void *)(a1[5] + 8);
    long long v56 = *(_OWORD *)(a1[4] + 280);
    time1.epoch = *(void *)(a1[4] + 296);
    *(_OWORD *)&time1.CMTimeValue value = v56;
    CMTime v100 = *(CMTime *)(v55 + 32);
    uint64_t result = CMTimeCompare(&time1, &v100);
    *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = (int)result < 0;
  }
  return result;
}

uint64_t __72__AVCaptureFigVideoDevice_setFaceDetectionDrivenImageProcessingEnabled___block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(result + 32) + 800) = *(_DWORD *)(result + 40);
  return result;
}

uint64_t __66__AVCaptureFigVideoDevice_setAutomaticallyAdjustsVideoHDREnabled___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 844) = *(unsigned char *)(result + 40);
  return result;
}

uint64_t __62__AVCaptureFigVideoDevice__setIsStillImageStabilizationScene___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 848) = *(unsigned char *)(result + 40);
  return result;
}

uint64_t __56__AVCaptureFigVideoDevice_setSpatialOverCaptureEnabled___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 1149) = *(unsigned char *)(result + 40);
  return result;
}

uint64_t __56__AVCaptureFigVideoDevice_setNonDestructiveCropEnabled___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 1150) = *(unsigned char *)(result + 40);
  return result;
}

float __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_5(uint64_t a1)
{
  float result = *(float *)(a1 + 40);
  *(float *)(*(void *)(a1 + 32) + 360) = result;
  return result;
}

- (BOOL)isFaceDetectionDrivenImageProcessingEnabled
{
  return *(_DWORD *)&self->_torchAvailable == 3;
}

- (BOOL)isStillImageStabilizationScene
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__AVCaptureFigVideoDevice_isStillImageStabilizationScene__block_invoke;
  v5[3] = &unk_1E5A74078;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)supportedMetadataObjectIdentifiers
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id result = self->_weakReference;
  if (!result)
  {
    id v4 = [(AVCaptureFigVideoDevice *)self _copyFigCaptureSourceProperty:*MEMORY[0x1E4F51F48]];
    self->_weakReference = (AVWeakReference *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v5 = (void *)[v4 allValues];
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          [(AVWeakReference *)self->_weakReference addObjectsFromArray:*(void *)(*((void *)&v10 + 1) + 8 * v9++)];
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }

    return self->_weakReference;
  }
  return result;
}

- (BOOL)ultraHighResolutionZeroShutterLagEnabled
{
  id v2 = [(AVCaptureFigVideoDevice *)self _copyFigCaptureSourceProperty:*MEMORY[0x1E4F52160]];

  return [v2 BOOLValue];
}

- (BOOL)isResponsiveCaptureWithDepthSupported
{
  id v2 = [(NSDictionary *)self->_fcsAttributes objectForKeyedSubscript:*MEMORY[0x1E4F51B58]];
  char v3 = (void *)[v2 objectForKeyedSubscript:*MEMORY[0x1E4F513C8]];

  return [v3 BOOLValue];
}

- (BOOL)isHEIFSupported
{
  id v2 = [(NSDictionary *)self->_fcsAttributes objectForKeyedSubscript:*MEMORY[0x1E4F51BB8]];

  return [v2 BOOLValue];
}

- (void)setDigitalFlashMode:(int64_t)a3
{
  if ([(AVCaptureFigVideoDevice *)self isLockedForConfiguration])
  {
    if (objc_msgSend(-[AVCaptureFigVideoDevice activeFormat](self, "activeFormat"), "isDigitalFlashSupported"))
    {
      uint64_t v10 = 0;
      long long v11 = &v10;
      uint64_t v12 = 0x2020000000;
      char v13 = 0;
      devicePropsQueue = self->_devicePropsQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __47__AVCaptureFigVideoDevice_setDigitalFlashMode___block_invoke;
      block[3] = &unk_1E5A74078;
      block[4] = self;
      void block[5] = &v10;
      dispatch_sync(devicePropsQueue, block);
      if (a3)
      {
        if (*((unsigned char *)v11 + 24))
        {
          [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"globalToneMappingEnabled"];
          [(AVCaptureFigVideoDevice *)self _setGlobalToneMappingEnabledInternal:0];
          [(AVCaptureFigVideoDevice *)self didChangeValueForKey:@"globalToneMappingEnabled"];
        }
      }
      [(AVCaptureFigVideoDevice *)self _setDigitalFlashModeInternal:a3];
      _Block_object_dispose(&v10, 8);
      return;
    }
    uint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
    objc_opt_class();
  }
  else
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3A8];
    objc_opt_class();
  }
  uint64_t v8 = (void *)[v6 exceptionWithName:v7 reason:AVMethodExceptionReasonWithClassAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v8);
  }
  NSLog(&cfstr_SuppressingExc.isa, v8);
}

- (BOOL)isPreviewQualityAdjustedPhotoFilterRenderingSupported
{
  id v2 = [(NSDictionary *)self->_fcsAttributes objectForKeyedSubscript:*MEMORY[0x1E4F51C30]];

  return [v2 BOOLValue];
}

- (BOOL)isLensStabilizationSupported
{
  id v2 = [(NSDictionary *)self->_fcsAttributes objectForKeyedSubscript:*MEMORY[0x1E4F51C58]];

  return [v2 BOOLValue];
}

- (void)_setDigitalFlashModeInternal:(int64_t)a3
{
  devicePropsQueue = self->_devicePropsQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__AVCaptureFigVideoDevice__setDigitalFlashModeInternal___block_invoke;
  v4[3] = &unk_1E5A72F98;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_sync(devicePropsQueue, v4);
}

uint64_t __61__AVCaptureFigVideoDevice_isFlashSceneDetectedForPhotoOutput__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 747);
  return result;
}

uint64_t __59__AVCaptureFigVideoDevice_isHDRSceneDetectedForPhotoOutput__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 847);
  return result;
}

double __54__AVCaptureFigVideoDevice_minAvailableVideoZoomFactor__block_invoke(uint64_t a1)
{
  double result = *(double *)(*(void *)(a1 + 32) + 880);
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __51__AVCaptureFigVideoDevice_stereoVideoCaptureStatus__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 936);
  return result;
}

uint64_t __47__AVCaptureFigVideoDevice_setDigitalFlashMode___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 1177);
  return result;
}

float __47__AVCaptureFigVideoDevice__setVideoZoomFactor___block_invoke(uint64_t a1)
{
  float result = *(double *)(a1 + 40);
  *(float *)(*(void *)(a1 + 32) + 864) = result;
  return result;
}

uint64_t __43__AVCaptureFigVideoDevice_isTorchAvailable__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 792);
  return result;
}

uint64_t __43__AVCaptureFigVideoDevice_isFlashAvailable__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 768);
  return result;
}

uint64_t __43__AVCaptureFigVideoDevice_imageControlMode__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 728);
  return result;
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

- (void)setActiveFormat:(id)a3
{
}

- (void)setAutomaticallyAdjustsVideoHDREnabled:(BOOL)a3
{
  if ([(AVCaptureFigVideoDevice *)self isLockedForConfiguration])
  {
    devicePropsQueue = self->_devicePropsQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __66__AVCaptureFigVideoDevice_setAutomaticallyAdjustsVideoHDREnabled___block_invoke;
    block[3] = &unk_1E5A74028;
    block[4] = self;
    BOOL v10 = a3;
    dispatch_sync(devicePropsQueue, block);
  }
  else
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3A8];
    objc_opt_class();
    uint64_t v8 = (void *)[v6 exceptionWithName:v7 reason:AVMethodExceptionReasonWithClassAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v8);
    }
    NSLog(&cfstr_SuppressingExc.isa, v8);
  }
}

- (void)setNonDestructiveCropEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(AVCaptureFigVideoDevice *)self isLockedForConfiguration])
  {
    if (!v3
      || (objc_msgSend(-[AVCaptureFigVideoDevice activeFormat](self, "activeFormat"), "isNonDestructiveCropSupported") & 1) != 0)
    {
      devicePropsQueue = self->_devicePropsQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __56__AVCaptureFigVideoDevice_setNonDestructiveCropEnabled___block_invoke;
      block[3] = &unk_1E5A74028;
      block[4] = self;
      BOOL v10 = v3;
      dispatch_sync(devicePropsQueue, block);
      return;
    }
    uint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
    objc_opt_class();
  }
  else
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3A8];
    objc_opt_class();
  }
  uint64_t v8 = (void *)[v6 exceptionWithName:v7 reason:AVMethodExceptionReasonWithClassAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v8);
  }
  NSLog(&cfstr_SuppressingExc.isa, v8);
}

- (void)setSpatialOverCaptureEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(AVCaptureFigVideoDevice *)self isLockedForConfiguration])
  {
    if (!v3
      || (objc_msgSend(-[AVCaptureFigVideoDevice activeFormat](self, "activeFormat"), "isSpatialOverCaptureSupported") & 1) != 0)
    {
      devicePropsQueue = self->_devicePropsQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __56__AVCaptureFigVideoDevice_setSpatialOverCaptureEnabled___block_invoke;
      block[3] = &unk_1E5A74028;
      block[4] = self;
      BOOL v10 = v3;
      dispatch_sync(devicePropsQueue, block);
      return;
    }
    uint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
    objc_opt_class();
  }
  else
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3A8];
    objc_opt_class();
  }
  uint64_t v8 = (void *)[v6 exceptionWithName:v7 reason:AVMethodExceptionReasonWithClassAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v8);
  }
  NSLog(&cfstr_SuppressingExc.isa, v8);
}

- (void)setActiveColorSpace:(int64_t)a3
{
  if ([(AVCaptureFigVideoDevice *)self isLockedForConfiguration])
  {
    devicePropsQueue = self->_devicePropsQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__AVCaptureFigVideoDevice_setActiveColorSpace___block_invoke;
    block[3] = &unk_1E5A72F70;
    block[4] = self;
    void block[5] = a3;
    void block[6] = a2;
    dispatch_sync(devicePropsQueue, block);
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C3A8];
    objc_opt_class();
    uint64_t v9 = (void *)[v7 exceptionWithName:v8 reason:AVMethodExceptionReasonWithClassAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v9);
    }
    NSLog(&cfstr_SuppressingExc.isa, v9);
  }
}

- (void)setNonDestructiveCropAspectRatio:(int64_t)a3
{
  if ([(AVCaptureFigVideoDevice *)self isLockedForConfiguration])
  {
    if (!a3 || [(AVCaptureFigVideoDevice *)self isNonDestructiveCropEnabled])
    {
      devicePropsQueue = self->_devicePropsQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __60__AVCaptureFigVideoDevice_setNonDestructiveCropAspectRatio___block_invoke;
      block[3] = &unk_1E5A72F98;
      block[4] = self;
      void block[5] = a3;
      dispatch_sync(devicePropsQueue, block);
      return;
    }
    uint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
    objc_opt_class();
  }
  else
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3A8];
    objc_opt_class();
  }
  uint64_t v8 = (void *)[v6 exceptionWithName:v7 reason:AVMethodExceptionReasonWithClassAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v8);
  }
  NSLog(&cfstr_SuppressingExc.isa, v8);
}

- (void)setActiveDepthDataFormat:(id)a3
{
  uint64_t v15 = 0;
  unsigned int v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  if (![(AVCaptureFigVideoDevice *)self isLockedForConfiguration])
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1CA00];
    objc_opt_class();
    uint64_t v8 = (void *)[v7 exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:AVMethodExceptionReasonWithClassAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v8);
    }
    goto LABEL_10;
  }
  if ((objc_msgSend((id)objc_msgSend(-[AVCaptureFigVideoDevice activeFormat](self, "activeFormat"), "supportedDepthDataFormats"), "containsObject:", a3) & 1) == 0)
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F1CA00];
    objc_opt_class();
    uint64_t v8 = (void *)[v9 exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithClassAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v8);
    }
LABEL_10:
    NSLog(&cfstr_SuppressingExc.isa, v8);
    goto LABEL_11;
  }
  devicePropsQueue = self->_devicePropsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__AVCaptureFigVideoDevice_setActiveDepthDataFormat___block_invoke;
  block[3] = &unk_1E5A73DB0;
  block[4] = a3;
  void block[5] = self;
  void block[6] = &v15;
  dispatch_sync(devicePropsQueue, block);
  if (*((unsigned char *)v16 + 24))
  {
    long long v12 = *MEMORY[0x1E4F1FA10];
    uint64_t v13 = *(void *)(MEMORY[0x1E4F1FA10] + 16);
    id v6 = [(NSArray *)[(AVCaptureDeviceFormat *)self->_activeDepthDataFormat videoSupportedFrameRateRanges] lastObject];
    if (v6)
    {
      [v6 minFrameDuration];
      long long v12 = v10;
      uint64_t v13 = v11;
    }
    long long v10 = v12;
    uint64_t v11 = v13;
    [(AVCaptureFigVideoDevice *)self setActiveDepthDataMinFrameDuration:&v10];
  }
LABEL_11:
  _Block_object_dispose(&v15, 8);
}

- (void)_setActiveFormat:(id)a3 resetVideoZoomFactorAndMinMaxFrameDurations:(BOOL)a4 sessionPreset:(id)a5
{
  uint64_t v181 = *MEMORY[0x1E4F143B8];
  if ([(AVCaptureFigVideoDevice *)self isLockedForConfiguration])
  {
    uint64_t v163 = 0;
    CMTime v164 = &v163;
    uint64_t v165 = 0x3052000000;
    uint64_t v166 = __Block_byref_object_copy__5;
    CMTime v167 = __Block_byref_object_dispose__5;
    id v168 = a3;
    id v9 = [(AVCaptureFigVideoDevice *)self formats];
    if ([v9 containsObject:v164[5]])
    {
      if (dword_1EB4C9280)
      {
        LODWORD(v157) = 0;
        type[0] = OS_LOG_TYPE_DEFAULT;
        os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"activeFormat", v33, v34];
      uint64_t v175 = 0;
      long long v176 = &v175;
      uint64_t v177 = 0x3810000000;
      long long v179 = *MEMORY[0x1E4F1F9F8];
      uint64_t v16 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
      v178 = &unk_1A165D1D9;
      uint64_t v180 = v16;
      uint64_t v169 = 0;
      long long v170 = &v169;
      uint64_t v171 = 0x3810000000;
      char v172 = &unk_1A165D1D9;
      long long v173 = v179;
      uint64_t v174 = v16;
      uint64_t v157 = 0;
      CMTime v158 = &v157;
      uint64_t v159 = 0x3810000000;
      long long v161 = v179;
      CGRect v160 = &unk_1A165D1D9;
      uint64_t v162 = v16;
      uint64_t v153 = 0;
      long long v154 = (double *)&v153;
      uint64_t v155 = 0x2020000000;
      uint64_t v156 = 0;
      uint64_t v149 = 0;
      long long v150 = (double *)&v149;
      uint64_t v151 = 0x2020000000;
      uint64_t v152 = 0;
      v148[0] = 0;
      v148[1] = v148;
      v148[2] = 0x2020000000;
      void v148[3] = 0;
      uint64_t v144 = 0;
      __int16 v145 = (float *)&v144;
      uint64_t v146 = 0x2020000000;
      int v147 = 0;
      uint64_t v140 = 0;
      CMTime v141 = &v140;
      uint64_t v142 = 0x2020000000;
      uint64_t v143 = -1;
      uint64_t v136 = 0;
      char v137 = &v136;
      uint64_t v138 = 0x2020000000;
      char v139 = 0;
      uint64_t v130 = 0;
      char v131 = &v130;
      uint64_t v132 = 0x3052000000;
      char v133 = __Block_byref_object_copy__5;
      v134 = __Block_byref_object_dispose__5;
      uint64_t v135 = 0;
      uint64_t v126 = 0;
      CGRect v127 = &v126;
      uint64_t v128 = 0x2020000000;
      char v129 = 0;
      uint64_t v122 = 0;
      long long v123 = &v122;
      uint64_t v124 = 0x2020000000;
      char v125 = 0;
      uint64_t v118 = 0;
      uint64_t v119 = &v118;
      uint64_t v120 = 0x2020000000;
      char v121 = 0;
      uint64_t v114 = 0;
      long long v115 = &v114;
      uint64_t v116 = 0x2020000000;
      char v117 = 0;
      *(void *)os_log_type_t type = 0;
      char v109 = type;
      uint64_t v110 = 0x3810000000;
      id v111 = &unk_1A165D1D9;
      long long v112 = v179;
      uint64_t v113 = v16;
      uint64_t v104 = 0;
      uint64_t v105 = &v104;
      uint64_t v106 = 0x2020000000;
      char v107 = 0;
      uint64_t v100 = 0;
      int v101 = &v100;
      uint64_t v102 = 0x2020000000;
      char v103 = 0;
      v98[0] = 0;
      v98[1] = v98;
      v98[2] = 0x2020000000;
      char v99 = 0;
      uint64_t v94 = 0;
      unsigned int v95 = &v94;
      uint64_t v96 = 0x2020000000;
      char v97 = 0;
      v92[0] = 0;
      v92[1] = v92;
      v92[2] = 0x2020000000;
      char v93 = 0;
      uint64_t v86 = 0;
      uint64_t v87 = &v86;
      uint64_t v88 = 0x3052000000;
      uint64_t v89 = __Block_byref_object_copy__5;
      uint64_t v90 = __Block_byref_object_dispose__5;
      uint64_t v91 = 0;
      uint64_t v82 = 0;
      uint64_t v83 = &v82;
      uint64_t v84 = 0x2020000000;
      char v85 = 0;
      uint64_t v78 = 0;
      uint64_t v79 = &v78;
      uint64_t v80 = 0x2020000000;
      char v81 = 0;
      v77[0] = 0;
      v77[1] = v77;
      v77[2] = 0x2020000000;
      v77[3] = 0;
      uint64_t v73 = 0;
      uint64_t v74 = &v73;
      uint64_t v75 = 0x2020000000;
      char v76 = 0;
      v71[0] = 0;
      v71[1] = v71;
      v71[2] = 0x2020000000;
      char v72 = 0;
      uint64_t v67 = 0;
      uint64_t v68 = &v67;
      uint64_t v69 = 0x2020000000;
      char v70 = 0;
      v65[0] = 0;
      v65[1] = v65;
      v65[2] = 0x2020000000;
      char v66 = 0;
      uint64_t v61 = 0;
      uint64_t v62 = &v61;
      uint64_t v63 = 0x2020000000;
      char v64 = 0;
      v59[0] = 0;
      v59[1] = v59;
      v59[2] = 0x2020000000;
      char v60 = 0;
      uint64_t v55 = 0;
      long long v56 = &v55;
      uint64_t v57 = 0x2020000000;
      char v58 = 0;
      devicePropsQueue = self->_devicePropsQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __102__AVCaptureFigVideoDevice__setActiveFormat_resetVideoZoomFactorAndMinMaxFrameDurations_sessionPreset___block_invoke;
      block[3] = &unk_1E5A740A0;
      void block[5] = a5;
      void block[6] = &v163;
      void block[7] = &v136;
      void block[8] = &v130;
      block[9] = v98;
      void block[10] = &v100;
      block[11] = &v153;
      block[12] = &v149;
      block[13] = v148;
      BOOL v54 = a4;
      block[14] = v92;
      block[15] = &v94;
      block[16] = v71;
      block[17] = &v73;
      block[18] = v65;
      block[19] = &v67;
      block[20] = v59;
      block[21] = &v61;
      block[22] = &v175;
      block[23] = &v169;
      block[24] = &v144;
      block[25] = &v126;
      block[26] = &v157;
      block[27] = type;
      block[28] = &v104;
      block[29] = &v140;
      block[30] = &v86;
      block[31] = &v122;
      block[32] = &v118;
      block[33] = &v114;
      block[34] = &v82;
      block[35] = v77;
      block[36] = &v78;
      block[37] = &v55;
      block[4] = self;
      dispatch_sync(devicePropsQueue, block);
      if (*((unsigned char *)v176 + 44))
      {
        [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"activeVideoMinFrameDuration"];
        char v18 = self->_devicePropsQueue;
        v52[0] = MEMORY[0x1E4F143A8];
        v52[1] = 3221225472;
        v52[2] = __102__AVCaptureFigVideoDevice__setActiveFormat_resetVideoZoomFactorAndMinMaxFrameDurations_sessionPreset___block_invoke_2;
        v52[3] = &unk_1E5A73EF0;
        v52[4] = self;
        v52[5] = &v175;
        dispatch_sync(v18, v52);
      }
      if (*((unsigned char *)v170 + 44))
      {
        [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"activeVideoMaxFrameDuration"];
        int v19 = self->_devicePropsQueue;
        v51[0] = MEMORY[0x1E4F143A8];
        v51[1] = 3221225472;
        v51[2] = __102__AVCaptureFigVideoDevice__setActiveFormat_resetVideoZoomFactorAndMinMaxFrameDurations_sessionPreset___block_invoke_3;
        void v51[3] = &unk_1E5A73EF0;
        v51[4] = self;
        v51[5] = &v169;
        dispatch_sync(v19, v51);
      }
      if (*((unsigned char *)v123 + 24))
      {
        [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"digitalFlashMode"];
        [(AVCaptureFigVideoDevice *)self _setDigitalFlashModeInternal:0];
      }
      if (*((unsigned char *)v119 + 24))
      {
        [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"globalToneMappingEnabled"];
        [(AVCaptureFigVideoDevice *)self _setGlobalToneMappingEnabledInternal:0];
      }
      if (*((unsigned char *)v115 + 24))
      {
        [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"lowLightVideoCaptureEnabled"];
        uint64_t v20 = self->_devicePropsQueue;
        v50[0] = MEMORY[0x1E4F143A8];
        v50[1] = 3221225472;
        v50[2] = __102__AVCaptureFigVideoDevice__setActiveFormat_resetVideoZoomFactorAndMinMaxFrameDurations_sessionPreset___block_invoke_4;
        v50[3] = &unk_1E5A72ED0;
        v50[4] = self;
        dispatch_sync(v20, v50);
      }
      if (*((unsigned char *)v83 + 24))
      {
        [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"variableFrameRateVideoCaptureEnabled"];
        int v21 = self->_devicePropsQueue;
        v49[0] = MEMORY[0x1E4F143A8];
        v49[1] = 3221225472;
        v49[2] = __102__AVCaptureFigVideoDevice__setActiveFormat_resetVideoZoomFactorAndMinMaxFrameDurations_sessionPreset___block_invoke_5;
        void v49[3] = &unk_1E5A72ED0;
        v49[4] = self;
        dispatch_sync(v21, v49);
      }
      if (*((unsigned char *)v79 + 24))
      {
        [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"videoStabilizationStrength"];
        uint64_t v22 = self->_devicePropsQueue;
        v48[0] = MEMORY[0x1E4F143A8];
        v48[1] = 3221225472;
        void v48[2] = __102__AVCaptureFigVideoDevice__setActiveFormat_resetVideoZoomFactorAndMinMaxFrameDurations_sessionPreset___block_invoke_6;
        v48[3] = &unk_1E5A73EF0;
        v48[4] = self;
        v48[5] = v77;
        dispatch_sync(v22, v48);
      }
      if (*((unsigned char *)v101 + 24))
      {
        [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"centerStageActive"];
        [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"cinematicFramingActive"];
        uint64_t v23 = self->_devicePropsQueue;
        v47[0] = MEMORY[0x1E4F143A8];
        v47[1] = 3221225472;
        void v47[2] = __102__AVCaptureFigVideoDevice__setActiveFormat_resetVideoZoomFactorAndMinMaxFrameDurations_sessionPreset___block_invoke_7;
        void v47[3] = &unk_1E5A73EF0;
        v47[4] = self;
        v47[5] = v98;
        dispatch_sync(v23, v47);
      }
      if (*((unsigned char *)v95 + 24))
      {
        [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"backgroundBlurActive"];
        [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"portraitEffectActive"];
        double v24 = self->_devicePropsQueue;
        v46[0] = MEMORY[0x1E4F143A8];
        v46[1] = 3221225472;
        void v46[2] = __102__AVCaptureFigVideoDevice__setActiveFormat_resetVideoZoomFactorAndMinMaxFrameDurations_sessionPreset___block_invoke_8;
        v46[3] = &unk_1E5A73EF0;
        v46[4] = self;
        v46[5] = v92;
        dispatch_sync(v24, v46);
      }
      if (*((unsigned char *)v74 + 24))
      {
        [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"studioLightingActive"];
        [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"studioLightActive"];
        BOOL v25 = self->_devicePropsQueue;
        v45[0] = MEMORY[0x1E4F143A8];
        v45[1] = 3221225472;
        v45[2] = __102__AVCaptureFigVideoDevice__setActiveFormat_resetVideoZoomFactorAndMinMaxFrameDurations_sessionPreset___block_invoke_9;
        void v45[3] = &unk_1E5A73EF0;
        void v45[4] = self;
        v45[5] = v71;
        dispatch_sync(v25, v45);
      }
      if (*((unsigned char *)v68 + 24))
      {
        [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"canPerformReactionEffects"];
        uint64_t v26 = self->_devicePropsQueue;
        v44[0] = MEMORY[0x1E4F143A8];
        v44[1] = 3221225472;
        v44[2] = __102__AVCaptureFigVideoDevice__setActiveFormat_resetVideoZoomFactorAndMinMaxFrameDurations_sessionPreset___block_invoke_10;
        v44[3] = &unk_1E5A73EF0;
        v44[4] = self;
        v44[5] = v65;
        dispatch_sync(v26, v44);
      }
      if (*((unsigned char *)v62 + 24))
      {
        [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"backgroundReplacementActive"];
        uint64_t v27 = self->_devicePropsQueue;
        v43[0] = MEMORY[0x1E4F143A8];
        v43[1] = 3221225472;
        void v43[2] = __102__AVCaptureFigVideoDevice__setActiveFormat_resetVideoZoomFactorAndMinMaxFrameDurations_sessionPreset___block_invoke_11;
        void v43[3] = &unk_1E5A73EF0;
        v43[4] = self;
        v43[5] = v59;
        dispatch_sync(v27, v43);
      }
      if (v154[3] >= 1.0) {
        -[AVCaptureFigVideoDevice _setMinAvailableVideoZoomFactor:](self, "_setMinAvailableVideoZoomFactor:");
      }
      float v28 = v145[6];
      if (v28 >= 1.0) {
        [(AVCaptureFigVideoDevice *)self setVideoZoomFactor:v28];
      }
      if (v150[3] >= 1.0) {
        -[AVCaptureFigVideoDevice _setMaxAvailableVideoZoomFactor:](self, "_setMaxAvailableVideoZoomFactor:");
      }
      if (*((unsigned char *)v127 + 24)) {
        [(AVCaptureFigVideoDevice *)self setNonDestructiveCropAspectRatio:0];
      }
      if (v141[3] != -1)
      {
        [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"activeColorSpace"];
        unsigned int v29 = self->_devicePropsQueue;
        v42[0] = MEMORY[0x1E4F143A8];
        v42[1] = 3221225472;
        void v42[2] = __102__AVCaptureFigVideoDevice__setActiveFormat_resetVideoZoomFactorAndMinMaxFrameDurations_sessionPreset___block_invoke_12;
        v42[3] = &unk_1E5A73EF0;
        v42[4] = self;
        v42[5] = &v140;
        dispatch_sync(v29, v42);
      }
      if (*((unsigned char *)v105 + 24))
      {
        long long v40 = *((_OWORD *)v109 + 2);
        uint64_t v41 = *((void *)v109 + 6);
        [(AVCaptureFigVideoDevice *)self setActiveMaxExposureDuration:&v40];
      }
      if (*((unsigned char *)v137 + 24))
      {
        [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"activeDepthDataFormat"];
        uint64_t v30 = self->_devicePropsQueue;
        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        void v39[2] = __102__AVCaptureFigVideoDevice__setActiveFormat_resetVideoZoomFactorAndMinMaxFrameDurations_sessionPreset___block_invoke_13;
        v39[3] = &unk_1E5A73EF0;
        v39[4] = self;
        v39[5] = &v130;
        dispatch_sync(v30, v39);
      }
      if (*((unsigned char *)v56 + 24))
      {
        [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"spatialOverCaptureEnabled"];
        int v31 = self->_devicePropsQueue;
        v38[0] = MEMORY[0x1E4F143A8];
        v38[1] = 3221225472;
        v38[2] = __102__AVCaptureFigVideoDevice__setActiveFormat_resetVideoZoomFactorAndMinMaxFrameDurations_sessionPreset___block_invoke_14;
        v38[3] = &unk_1E5A72ED0;
        v38[4] = self;
        dispatch_sync(v31, v38);
      }
      [(AVCaptureFigVideoDevice *)self didChangeValueForKey:@"activeFormat"];
      if (*((unsigned char *)v137 + 24))
      {
        [(AVCaptureFigVideoDevice *)self didChangeValueForKey:@"activeDepthDataFormat"];
        if (!v131[5]) {
          [(AVCaptureFigVideoDevice *)self _setShallowDepthOfFieldEffectStatus:0];
        }
        long long v36 = *((_OWORD *)v158 + 2);
        uint64_t v37 = v158[6];
        [(AVCaptureFigVideoDevice *)self setActiveDepthDataMinFrameDuration:&v36];
      }
      if (v141[3] != -1) {
        [(AVCaptureFigVideoDevice *)self didChangeValueForKey:@"activeColorSpace"];
      }
      if (*((unsigned char *)v115 + 24)) {
        [(AVCaptureFigVideoDevice *)self didChangeValueForKey:@"lowLightVideoCaptureEnabled"];
      }
      if (*((unsigned char *)v119 + 24)) {
        [(AVCaptureFigVideoDevice *)self didChangeValueForKey:@"globalToneMappingEnabled"];
      }
      if (*((unsigned char *)v123 + 24)) {
        [(AVCaptureFigVideoDevice *)self didChangeValueForKey:@"digitalFlashMode"];
      }
      if (v87[5])
      {
        [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"systemPressureState"];
        uint64_t v32 = self->_devicePropsQueue;
        v35[0] = MEMORY[0x1E4F143A8];
        v35[1] = 3221225472;
        v35[2] = __102__AVCaptureFigVideoDevice__setActiveFormat_resetVideoZoomFactorAndMinMaxFrameDurations_sessionPreset___block_invoke_15;
        v35[3] = &unk_1E5A73EF0;
        v35[4] = self;
        v35[5] = &v86;
        dispatch_sync(v32, v35);
        [(AVCaptureFigVideoDevice *)self didChangeValueForKey:@"systemPressureState"];
      }
      if (*((unsigned char *)v83 + 24)) {
        [(AVCaptureFigVideoDevice *)self didChangeValueForKey:@"variableFrameRateVideoCaptureEnabled"];
      }
      if (*((unsigned char *)v79 + 24)) {
        [(AVCaptureFigVideoDevice *)self didChangeValueForKey:@"videoStabilizationStrength"];
      }
      if (*((unsigned char *)v101 + 24))
      {
        [(AVCaptureFigVideoDevice *)self didChangeValueForKey:@"cinematicFramingActive"];
        [(AVCaptureFigVideoDevice *)self didChangeValueForKey:@"centerStageActive"];
      }
      if (*((unsigned char *)v176 + 44)) {
        [(AVCaptureFigVideoDevice *)self didChangeValueForKey:@"activeVideoMinFrameDuration"];
      }
      if (*((unsigned char *)v170 + 44)) {
        [(AVCaptureFigVideoDevice *)self didChangeValueForKey:@"activeVideoMaxFrameDuration"];
      }
      if (*((unsigned char *)v95 + 24))
      {
        [(AVCaptureFigVideoDevice *)self didChangeValueForKey:@"portraitEffectActive"];
        [(AVCaptureFigVideoDevice *)self didChangeValueForKey:@"backgroundBlurActive"];
      }
      if (*((unsigned char *)v74 + 24))
      {
        [(AVCaptureFigVideoDevice *)self didChangeValueForKey:@"studioLightActive"];
        [(AVCaptureFigVideoDevice *)self didChangeValueForKey:@"studioLightingActive"];
      }
      if (*((unsigned char *)v68 + 24)) {
        [(AVCaptureFigVideoDevice *)self didChangeValueForKey:@"canPerformReactionEffects"];
      }
      if (*((unsigned char *)v62 + 24)) {
        [(AVCaptureFigVideoDevice *)self didChangeValueForKey:@"backgroundReplacementActive"];
      }
      if (*((unsigned char *)v56 + 24)) {
        [(AVCaptureFigVideoDevice *)self didChangeValueForKey:@"spatialOverCaptureEnabled"];
      }
      _Block_object_dispose(&v55, 8);
      _Block_object_dispose(v59, 8);
      _Block_object_dispose(&v61, 8);
      _Block_object_dispose(v65, 8);
      _Block_object_dispose(&v67, 8);
      _Block_object_dispose(v71, 8);
      _Block_object_dispose(&v73, 8);
      _Block_object_dispose(v77, 8);
      _Block_object_dispose(&v78, 8);
      _Block_object_dispose(&v82, 8);
      _Block_object_dispose(&v86, 8);
      _Block_object_dispose(v92, 8);
      _Block_object_dispose(&v94, 8);
      _Block_object_dispose(v98, 8);
      _Block_object_dispose(&v100, 8);
      _Block_object_dispose(&v104, 8);
      _Block_object_dispose(type, 8);
      _Block_object_dispose(&v114, 8);
      _Block_object_dispose(&v118, 8);
      _Block_object_dispose(&v122, 8);
      _Block_object_dispose(&v126, 8);
      _Block_object_dispose(&v130, 8);
      _Block_object_dispose(&v136, 8);
      _Block_object_dispose(&v140, 8);
      _Block_object_dispose(&v144, 8);
      _Block_object_dispose(v148, 8);
      _Block_object_dispose(&v149, 8);
      _Block_object_dispose(&v153, 8);
      _Block_object_dispose(&v157, 8);
      _Block_object_dispose(&v169, 8);
      _Block_object_dispose(&v175, 8);
    }
    else
    {
      uint64_t v14 = (void *)MEMORY[0x1E4F1CA00];
      objc_opt_class();
      uint64_t v15 = objc_msgSend(v14, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithClassAndSelector(), 0, v164[5]);
      if (AVCaptureShouldThrowForAPIViolations()) {
        objc_exception_throw(v15);
      }
      NSLog(&cfstr_SuppressingExc.isa, v15);
    }
    _Block_object_dispose(&v163, 8);
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v12 = *MEMORY[0x1E4F1C3A8];
    objc_opt_class();
    uint64_t v13 = (void *)[v11 exceptionWithName:v12 reason:AVMethodExceptionReasonWithClassAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v13);
    }
    NSLog(&cfstr_SuppressingExc.isa, v13);
  }
}

- (void)setActiveDepthDataMinFrameDuration:(id *)a3
{
  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x2020000000;
  int v35 = 0;
  uint64_t v27 = 0;
  float v28 = &v27;
  uint64_t v29 = 0x3810000000;
  uint64_t v30 = &unk_1A165D1D9;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v31 = *a3;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3052000000;
  double v24 = __Block_byref_object_copy__5;
  BOOL v25 = __Block_byref_object_dispose__5;
  uint64_t v26 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__AVCaptureFigVideoDevice_setActiveDepthDataMinFrameDuration___block_invoke;
  block[3] = &unk_1E5A74078;
  block[4] = self;
  void block[5] = &v21;
  dispatch_sync(devicePropsQueue, block);
  id v6 = (void *)v22[5];
  if ((a3->var2 & 1) == 0)
  {
    if (v6)
    {
      uint64_t v7 = &v19;
      [v6 minFrameDuration];
    }
    else
    {
      uint64_t v7 = (char *)MEMORY[0x1E4F1FA10];
    }
    long long v10 = v28;
    *((_OWORD *)v28 + 2) = *(_OWORD *)v7;
    v10[6] = *((void *)v7 + 2);
LABEL_10:
    uint64_t v11 = self->_devicePropsQueue;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __62__AVCaptureFigVideoDevice_setActiveDepthDataMinFrameDuration___block_invoke_2;
    v16[3] = &unk_1E5A740F0;
    v16[5] = &v27;
    void v16[6] = &v32;
    v16[4] = self;
    dispatch_sync(v11, v16);
    if (*((_DWORD *)v33 + 6) == -16452)
    {
      uint64_t v12 = (void *)MEMORY[0x1E4F1CA00];
      objc_opt_class();
      uint64_t v13 = (void *)[v12 exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:AVMethodExceptionReasonWithClassAndSelector() userInfo:0];
      if (AVCaptureShouldThrowForAPIViolations()) {
        objc_exception_throw(v13);
      }
      NSLog(&cfstr_SuppressingExc.isa, v13);
    }
    goto LABEL_15;
  }
  if (v6)
  {
    [v6 minFrameDuration];
    CMTime time1 = (CMTime)*a3;
    if ((CMTimeCompare(&time1, &time2) & 0x80000000) == 0) {
      goto LABEL_10;
    }
    uint64_t v8 = (void *)MEMORY[0x1E4F1CA00];
    objc_opt_class();
    id v9 = (void *)[v8 exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithClassAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v9);
    }
    NSLog(&cfstr_SuppressingExc.isa, v9);
  }
  else
  {
    uint64_t v14 = (void *)MEMORY[0x1E4F1CA00];
    objc_opt_class();
    uint64_t v15 = (void *)[v14 exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithClassAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v15);
    }
    NSLog(&cfstr_SuppressingExc.isa, v15);
  }
LABEL_15:
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v32, 8);
}

- (void)setVideoZoomFactor:(double)a3
{
  if (a3 >= 1.0
    && (objc_msgSend(-[AVCaptureFigVideoDevice activeFormat](self, "activeFormat"), "videoMaxZoomFactor"), v5 >= a3))
  {
    uint64_t v21 = 0;
    uint64_t v22 = &v21;
    uint64_t v23 = 0x2020000000;
    int v24 = 0;
    uint64_t v17 = 0;
    char v18 = &v17;
    uint64_t v19 = 0x2020000000;
    char v20 = 0;
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x2020000000;
    *(double *)&v16[3] = a3;
    devicePropsQueue = self->_devicePropsQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__AVCaptureFigVideoDevice_setVideoZoomFactor___block_invoke;
    block[3] = &unk_1E5A74190;
    block[4] = self;
    void block[5] = v16;
    void block[6] = &v17;
    void block[7] = &v21;
    dispatch_sync(devicePropsQueue, block);
    int v10 = *((_DWORD *)v22 + 6);
    if (v10)
    {
      if (v10 == -16452)
      {
        uint64_t v11 = (void *)MEMORY[0x1E4F1CA00];
        objc_opt_class();
        uint64_t v12 = (void *)[v11 exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:AVMethodExceptionReasonWithClassAndSelector() userInfo:0];
        if (AVCaptureShouldThrowForAPIViolations()) {
          objc_exception_throw(v12);
        }
        NSLog(&cfstr_SuppressingExc.isa, v12);
      }
    }
    else
    {
      if (*((unsigned char *)v18 + 24)) {
        [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"rampingVideoZoom"];
      }
      [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"videoZoomFactor"];
      uint64_t v13 = self->_devicePropsQueue;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __46__AVCaptureFigVideoDevice_setVideoZoomFactor___block_invoke_2;
      v14[3] = &unk_1E5A73EF0;
      v14[4] = self;
      v14[5] = v16;
      dispatch_sync(v13, v14);
      [(AVCaptureFigVideoDevice *)self didChangeValueForKey:@"videoZoomFactor"];
      if (*((unsigned char *)v18 + 24)) {
        [(AVCaptureFigVideoDevice *)self didChangeValueForKey:@"rampingVideoZoom"];
      }
    }
    _Block_object_dispose(v16, 8);
    _Block_object_dispose(&v17, 8);
    _Block_object_dispose(&v21, 8);
  }
  else
  {
    id v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    objc_opt_class();
    uint64_t v8 = objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, AVMethodExceptionReasonWithClassAndSelector(), 0, *(void *)&a3);
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v8);
    }
    NSLog(&cfstr_SuppressingExc.isa, v8);
  }
}

- (void)_setMinAvailableVideoZoomFactor:(double)a3
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  devicePropsQueue = self->_devicePropsQueue;
  char v16 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__AVCaptureFigVideoDevice__setMinAvailableVideoZoomFactor___block_invoke;
  block[3] = &unk_1E5A74230;
  *(double *)&void block[6] = a3;
  block[4] = self;
  void block[5] = &v13;
  dispatch_sync(devicePropsQueue, block);
  if (*((unsigned char *)v14 + 24))
  {
    [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"minAvailableVideoZoomFactor"];
    uint64_t v8 = 0;
    id v9 = &v8;
    uint64_t v10 = 0x2020000000;
    char v11 = 0;
    id v6 = self->_devicePropsQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __59__AVCaptureFigVideoDevice__setMinAvailableVideoZoomFactor___block_invoke_2;
    v7[3] = &unk_1E5A74050;
    *(double *)&void v7[6] = a3;
    v7[4] = self;
    v7[5] = &v8;
    dispatch_sync(v6, v7);
    if (*((unsigned char *)v9 + 24)) {
      [(AVCaptureFigVideoDevice *)self _setVideoZoomFactor:a3];
    }
    [(AVCaptureFigVideoDevice *)self didChangeValueForKey:@"minAvailableVideoZoomFactor"];
    _Block_object_dispose(&v8, 8);
  }
  _Block_object_dispose(&v13, 8);
}

- (void)_setMaxAvailableVideoZoomFactor:(double)a3
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  devicePropsQueue = self->_devicePropsQueue;
  char v16 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__AVCaptureFigVideoDevice__setMaxAvailableVideoZoomFactor___block_invoke;
  block[3] = &unk_1E5A74230;
  *(double *)&void block[6] = a3;
  block[4] = self;
  void block[5] = &v13;
  dispatch_sync(devicePropsQueue, block);
  if (*((unsigned char *)v14 + 24))
  {
    [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"maxAvailableVideoZoomFactor"];
    uint64_t v8 = 0;
    id v9 = &v8;
    uint64_t v10 = 0x2020000000;
    char v11 = 0;
    id v6 = self->_devicePropsQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __59__AVCaptureFigVideoDevice__setMaxAvailableVideoZoomFactor___block_invoke_2;
    v7[3] = &unk_1E5A74050;
    *(double *)&void v7[6] = a3;
    v7[4] = self;
    v7[5] = &v8;
    dispatch_sync(v6, v7);
    if (*((unsigned char *)v9 + 24)) {
      [(AVCaptureFigVideoDevice *)self _setVideoZoomFactor:a3];
    }
    [(AVCaptureFigVideoDevice *)self didChangeValueForKey:@"maxAvailableVideoZoomFactor"];
    _Block_object_dispose(&v8, 8);
  }
  _Block_object_dispose(&v13, 8);
}

- (void)setCachesFigCaptureSourceConfigurationChanges:(BOOL)a3
{
  if ([(AVCaptureFigVideoDevice *)self isLockedForConfiguration])
  {
    self->_cachesFigCaptureSourceConfigurationChanges = a3;
  }
  else
  {
    double v5 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v6 = *MEMORY[0x1E4F1C3A8];
    objc_opt_class();
    uint64_t v7 = (void *)[v5 exceptionWithName:v6 reason:AVMethodExceptionReasonWithClassAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v7);
    }
    NSLog(&cfstr_SuppressingExc.isa, v7);
  }
}

- (void)setFlashMode:(int64_t)a3
{
  if ([(AVCaptureFigVideoDevice *)self isLockedForConfiguration])
  {
    if ([(AVCaptureFigVideoDevice *)self isFlashModeSupported:a3])
    {
      uint64_t v26 = 0;
      uint64_t v27 = &v26;
      uint64_t v28 = 0x2020000000;
      int64_t v29 = a3;
      uint64_t v22 = 0;
      uint64_t v23 = &v22;
      uint64_t v24 = 0x2020000000;
      char v25 = 0;
      uint64_t v18 = 0;
      uint64_t v19 = &v18;
      uint64_t v20 = 0x2020000000;
      char v21 = 0;
      devicePropsQueue = self->_devicePropsQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __40__AVCaptureFigVideoDevice_setFlashMode___block_invoke;
      block[3] = &unk_1E5A74140;
      block[4] = self;
      void block[5] = &v26;
      void block[6] = &v22;
      void block[7] = &v18;
      dispatch_sync(devicePropsQueue, block);
      [(AVCaptureFigVideoDevice *)self _setFlashActive:v27[3] == 1];
      if (*((unsigned char *)v19 + 24)) {
        uint64_t v6 = 1;
      }
      else {
        uint64_t v6 = *((unsigned __int8 *)v23 + 24);
      }
      uint64_t v15 = [NSNumber numberWithInt:v6];
      [(AVCaptureFigVideoDevice *)self _setFigCaptureSourceProperty:*MEMORY[0x1E4F51F30] withValue:v15];
      _Block_object_dispose(&v18, 8);
      _Block_object_dispose(&v22, 8);
      _Block_object_dispose(&v26, 8);
      return;
    }
    uint64_t v12 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v13 = *MEMORY[0x1E4F1C3C8];
    objc_opt_class();
    int64_t v16 = a3;
    uint64_t v9 = AVMethodExceptionReasonWithClassAndSelector();
    uint64_t v10 = v12;
    uint64_t v11 = v13;
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C3A8];
    objc_opt_class();
    uint64_t v9 = AVMethodExceptionReasonWithClassAndSelector();
    uint64_t v10 = v7;
    uint64_t v11 = v8;
  }
  uint64_t v14 = objc_msgSend(v10, "exceptionWithName:reason:userInfo:", v11, v9, 0, v16);
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v14);
  }
  NSLog(&cfstr_SuppressingExc.isa, v14);
}

- (BOOL)isLockedForConfiguration
{
  id v2 = [(AVCaptureFigVideoDevice *)self _copyFigCaptureSourceProperty:*MEMORY[0x1E4F52090]];
  if (!v2) {
    return 0;
  }
  BOOL v3 = v2;
  BOOL v4 = CFBooleanGetValue((CFBooleanRef)v2) != 0;
  CFRelease(v3);
  return v4;
}

- (BOOL)isFlashModeSupported:(int64_t)a3
{
  return (unint64_t)a3 <= 2 && [(AVCaptureFigVideoDevice *)self hasFlash];
}

- (void)_setFlashActive:(BOOL)a3
{
  devicePropsQueue = self->_devicePropsQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __43__AVCaptureFigVideoDevice__setFlashActive___block_invoke;
  v4[3] = &unk_1E5A74028;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(devicePropsQueue, v4);
}

void *__77__AVCaptureFigVideoDevice__setFigCaptureSource_allowSendingWorkToMainThread___block_invoke(void *result)
{
  uint64_t v1 = result[5];
  uint64_t v2 = *(void *)(result[4] + 56);
  if (v1 != v2)
  {
    BOOL v3 = result;
    if (v2)
    {
      if (v1 && (AVCaptureIsRunningInMediaserverd() & 1) == 0)
      {
        id v18 = 0;
        uint64_t v4 = *(void *)(v3[4] + 56);
        uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
        if (v5) {
          uint64_t v6 = v5;
        }
        else {
          uint64_t v6 = 0;
        }
        uint64_t v7 = *(unsigned int (**)(uint64_t, void, void, id *))(v6 + 48);
        if (v7)
        {
          if (!v7(v4, *MEMORY[0x1E4F521B0], *MEMORY[0x1E4F1CF80], &v18) && v18 != 0)
          {
            int v9 = [v18 intValue];
            if (v9 >= 1)
            {
              int v10 = v9;
              do
              {
                uint64_t v11 = v3[5];
                if (v11 && (uint64_t v12 = *(void *)(CMBaseObjectGetVTable() + 16)) != 0) {
                  uint64_t v13 = v12;
                }
                else {
                  uint64_t v13 = 0;
                }
                uint64_t v14 = *(void (**)(uint64_t))(v13 + 8);
                if (v14) {
                  v14(v11);
                }
                --v10;
              }
              while (v10);
            }
          }
        }
      }
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F47DB8], "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter()), "removeListenerWithWeakReference:callback:name:object:", *(void *)(v3[4] + 1032), fvd_figCaptureSourceNotificationHandler, 0, *(void *)(v3[4] + 56));
      uint64_t v15 = *(const void **)(v3[4] + 56);
      if (v15)
      {
        CFRelease(v15);
        *(void *)(v3[4] + 56) = 0;
      }
      if (([MEMORY[0x1E4F29060] isMainThread] & 1) != 0 || !*((unsigned char *)v3 + 48))
      {
        [(id)v3[4] _drainManualControlRequestQueues];
      }
      else
      {
        int64_t v16 = (void *)v3[4];
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __77__AVCaptureFigVideoDevice__setFigCaptureSource_allowSendingWorkToMainThread___block_invoke_2;
        v17[3] = &unk_1E5A72ED0;
        void v17[4] = v16;
        [v16 _performBlockOnMainThread:v17];
      }
    }
    float result = (void *)v3[5];
    if (result)
    {
      *(void *)(v3[4] + 56) = CFRetain(result);
      return objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F47DB8], "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter()), "addListenerWithWeakReference:callback:name:object:flags:", *(void *)(v3[4] + 1032), fvd_figCaptureSourceNotificationHandler, 0, v3[5], 0);
    }
  }
  return result;
}

- (id)preferredPrimaryConstituentDevice
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3052000000;
  int v10 = __Block_byref_object_copy__5;
  uint64_t v11 = __Block_byref_object_dispose__5;
  uint64_t v12 = 0;
  if ([(AVCaptureFigVideoDevice *)self _isBravoVariant])
  {
    devicePropsQueue = self->_devicePropsQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __60__AVCaptureFigVideoDevice_preferredPrimaryConstituentDevice__block_invoke;
    void v6[3] = &unk_1E5A74078;
    void v6[4] = self;
    v6[5] = &v7;
    dispatch_sync(devicePropsQueue, v6);
  }
  uint64_t v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (id)activePrimaryConstituentDevice
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3052000000;
  int v10 = __Block_byref_object_copy__5;
  uint64_t v11 = __Block_byref_object_dispose__5;
  uint64_t v12 = 0;
  if ([(AVCaptureFigVideoDevice *)self _isBravoVariant])
  {
    devicePropsQueue = self->_devicePropsQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __57__AVCaptureFigVideoDevice_activePrimaryConstituentDevice__block_invoke;
    void v6[3] = &unk_1E5A74078;
    void v6[4] = self;
    v6[5] = &v7;
    dispatch_sync(devicePropsQueue, v6);
  }
  uint64_t v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __67__AVCaptureFigVideoDevice_setExposureTargetBias_completionHandler___block_invoke(uint64_t a1)
{
  v12[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2[53] != 3)
  {
    uint64_t v4 = +[AVCaptureDeviceControlRequest deviceControlRequestWithCompletionBlock:*(void *)(a1 + 40)];
    v11[0] = *MEMORY[0x1E4F51D60];
    LODWORD(v7) = *(_DWORD *)(a1 + 64);
    v12[0] = [NSNumber numberWithFloat:v7];
    v11[1] = *MEMORY[0x1E4F51D68];
    v12[1] = objc_msgSend(NSNumber, "numberWithInt:", -[AVCaptureDeviceControlRequest requestID](v4, "requestID"));
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
    *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) _setFigCaptureSourceProperty:*MEMORY[0x1E4F52008] withValue:v8];
    [(AVCaptureDeviceControlRequest *)v4 setErrorCode:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
    return [*(id *)(*(void *)(a1 + 32) + 680) enqueueRequest:v4];
  }
  uint64_t result = [v2 isLockedForConfiguration];
  if (result)
  {
    uint64_t v4 = +[AVCaptureDeviceControlRequest deviceControlRequestWithCompletionBlock:*(void *)(a1 + 40)];
    LODWORD(v5) = *(_DWORD *)(a1 + 64);
    [(AVCaptureDeviceControlRequest *)v4 setFakeBias:v5];
    HostTimeClocuint64_t k = CMClockGetHostTimeClock();
    CMClockGetTime(&v10, HostTimeClock);
    CMTime v9 = v10;
    [(AVCaptureDeviceControlRequest *)v4 setFakeBiasCompletionTime:&v9];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    return [*(id *)(*(void *)(a1 + 32) + 680) enqueueRequest:v4];
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = -16452;
  return result;
}

- (void)_handleManualControlCompletionForRequestQueue:(id)a3 withPayload:(id)a4
{
  int v6 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F51DF8]), "intValue");
  uint64_t v7 = [a3 head];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v14 = *MEMORY[0x1E4F51E08];
    long long v16 = *MEMORY[0x1E4F1F9F8];
    CMTimeEpoch v9 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    do
    {
      *(_OWORD *)&v19.CMTimeValue value = v16;
      v19.epoch = v9;
      int v10 = objc_msgSend(v8, "requestID", v14);
      if (![v8 errorCode])
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"exposureTargetOffset"];
          [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"exposureTargetBias"];
          devicePropsQueue = self->_devicePropsQueue;
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __85__AVCaptureFigVideoDevice__handleManualControlCompletionForRequestQueue_withPayload___block_invoke;
          block[3] = &unk_1E5A72D70;
          block[4] = v8;
          void block[5] = self;
          dispatch_sync(devicePropsQueue, block);
          [(AVCaptureFigVideoDevice *)self didChangeValueForKey:@"exposureTargetBias"];
          [(AVCaptureFigVideoDevice *)self didChangeValueForKey:@"exposureTargetOffset"];
          [v8 fakeBiasCompletionTime];
        }
        else if (v10 <= v6)
        {
          if (v10 == v6)
          {
            CMTimeMakeFromDictionary(&v17, (CFDictionaryRef)[a4 objectForKeyedSubscript:v14]);
            CMTime v19 = v17;
          }
        }
        else if ((int)[v8 requestID] > v6)
        {
          return;
        }
      }
      if ([v8 completionBlock])
      {
        uint64_t v12 = [v8 completionBlock];
        uint64_t v13 = *(void (**)(uint64_t, CMTime *))(v12 + 16);
        CMTime v17 = v19;
        v13(v12, &v17);
      }
      [a3 dequeue];
      uint64_t v8 = (void *)[a3 head];
    }
    while (v8);
  }
}

+ (id)_devicesWithPriorRegisteredDevices:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  +[AVCaptureDevice setUpCenterStageStateOnce];
  +[AVCaptureDevice setUpBackgroundBlurStateOnce];
  +[AVCaptureDevice setUpStudioLightingStateOnce];
  +[AVCaptureDevice setUpReactionEffectsStateOnce];
  +[AVCaptureDevice setUpBackgroundReplacementStateOnce];
  char v25 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  obuint64_t j = +[AVCaptureFigVideoDevice _newFigCaptureSources];
  uint64_t v4 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v32;
    uint64_t v22 = *MEMORY[0x1E4F51F20];
    uint64_t v21 = *MEMORY[0x1E4F1CF80];
    uint64_t v24 = *MEMORY[0x1E4F51C80];
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v32 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        if ([a3 count])
        {
          id v30 = 0;
          uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 8);
          if (v9) {
            uint64_t v10 = v9;
          }
          else {
            uint64_t v10 = 0;
          }
          uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t, id *))(v10 + 48);
          if (v11) {
            v11(v8, v22, v21, &v30);
          }
          id v12 = (id)[v30 objectForKeyedSubscript:v24];

          long long v28 = 0u;
          long long v29 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          uint64_t v13 = [a3 countByEnumeratingWithState:&v26 objects:v35 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = *(void *)v27;
LABEL_14:
            uint64_t v16 = 0;
            while (1)
            {
              if (*(void *)v27 != v15) {
                objc_enumerationMutation(a3);
              }
              CMTime v17 = *(void **)(*((void *)&v26 + 1) + 8 * v16);
              if (objc_msgSend((id)objc_msgSend(v17, "uniqueID"), "isEqualToString:", v12)) {
                break;
              }
              if (v14 == ++v16)
              {
                uint64_t v14 = [a3 countByEnumeratingWithState:&v26 objects:v35 count:16];
                if (v14) {
                  goto LABEL_14;
                }
                goto LABEL_20;
              }
            }
            id v18 = v17;

            if (v18) {
              goto LABEL_23;
            }
          }
          else
          {
LABEL_20:
          }
        }
        id v18 = [[AVCaptureFigVideoDevice alloc] _initWithFigCaptureSource:v8 isProxy:0];
LABEL_23:
        [v25 addObject:v18];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v5);
  }
  CMTime v19 = (void *)[MEMORY[0x1E4F1CA48] array];
  objc_msgSend(v19, "addObject:", objc_msgSend(MEMORY[0x1E4F29008], "sortDescriptorWithKey:ascending:", @"_orderInDevicesArray", 1));
  objc_msgSend(v19, "addObject:", objc_msgSend(MEMORY[0x1E4F29008], "sortDescriptorWithKey:ascending:", @"position", 1));
  return (id)[v25 sortedArrayUsingDescriptors:v19];
}

+ (id)_newFigCaptureSources
{
  if (AVCaptureIsRunningInMediaserverd())
  {
    return (id)FigCaptureSourceCopySources();
  }
  else
  {
    id result = (id)FigCaptureSourceRemoteCopyCaptureSources();
    if (!result)
    {
      for (char i = 1; ; char i = 0)
      {
        char v4 = i;
        id result = (id)FigCaptureSourceRemoteCopyCaptureSources();
        if (result) {
          break;
        }
        usleep(0x3D090u);
        if ((v4 & 1) == 0) {
          return 0;
        }
      }
    }
  }
  return result;
}

uint64_t __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_4(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(float *)(result + 48) != *(float *)(*(void *)(result + 32) + 360);
  return result;
}

uint64_t __63__AVCaptureFigVideoDevice__updateMinMaxDefaultVideoZoomFactors__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(double *)(result + 48) != *(float *)(*(void *)(result + 32) + 864);
  return result;
}

uint64_t __40__AVCaptureFigVideoDevice_setFocusMode___block_invoke(uint64_t a1, double a2)
{
  LODWORD(a2) = 2139095039;
  uint64_t result = [*(id *)(a1 + 32) _setFocusWithMode:*(void *)(a1 + 48) lensPosition:0 requestID:a2];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *(void *)(*(void *)(a1 + 32) + 336) = *(void *)(a1 + 48);
  }
  return result;
}

- (void)updateStreamingDeviceHistory
{
  uint64_t v2 = sStreamingCameraHistoryKey;
  id v3 = [(AVCaptureFigVideoDevice *)self _cameraInfo];

  +[AVCaptureProprietaryDefaultsSingleton updateCameraHistory:v2 withCameraInfo:v3 maxLength:10 updateCameraHistoryDownplayOverrideList:0 cameraCanBeInOverrideList:0];
}

- (id)_cameraInfo
{
  v8[3] = *MEMORY[0x1E4F143B8];
  unsigned int specialDeviceType = self->_specialDeviceType;
  if (specialDeviceType == 2)
  {
    uint64_t v3 = 0;
  }
  else if (specialDeviceType == 3)
  {
    uint64_t v3 = 1;
  }
  else if (BYTE3(self->_degradedCaptureQualityFactors))
  {
    uint64_t v3 = 2;
  }
  else
  {
    uint64_t v3 = 3;
  }
  creatorID = self->_creatorID;
  v7[0] = @"CreatorID";
  v7[1] = @"DeviceUID";
  fcsUID = self->_fcsUID;
  v8[0] = creatorID;
  v8[1] = fcsUID;
  v7[2] = @"OverrideRanking";
  v8[2] = [NSNumber numberWithInt:v3];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];
}

uint64_t __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_7(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32) + 432;
  CMTime time1 = *(CMTime *)(a1 + 48);
  long long v3 = *(_OWORD *)v2;
  v5.epoch = *(void *)(v2 + 16);
  *(_OWORD *)&v5.CMTimeValue value = v3;
  uint64_t result = CMTimeCompare(&time1, &v5);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result != 0;
  return result;
}

id __58__AVCaptureFigVideoDevice_digitalFlashSceneForPhotoOutput__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(a1 + 32) + 760);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

id __46__AVCaptureFigVideoDevice_systemPressureState__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(a1 + 32) + 1136);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

id __69__AVCaptureFigVideoDevice_supportedFallbackPrimaryConstituentDevices__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(a1 + 32) + 1008);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

void __83__AVCaptureFigVideoDevice__insurePreferredCameraGlobal_globalName_preferredCamera___block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)&sCameraHistoryLock);
  uint64_t v2 = **(void ***)(a1 + 48);
  if (v2)
  {
    id v3 = v2;
    os_unfair_lock_unlock((os_unfair_lock_t)&sCameraHistoryLock);
    id v4 = *(id *)(a1 + 32);
    if (v4 == v3 || ([v4 isEqual:v3] & 1) != 0)
    {
      if (!dword_1EB4C9280) {
        return;
      }
    }
    else if (!dword_1EB4C9280)
    {
      return;
    }
  }
  else
  {
    **(void **)(a1 + 48) = *(id *)(a1 + 32);
    os_unfair_lock_unlock((os_unfair_lock_t)&sCameraHistoryLock);
    if (!dword_1EB4C9280) {
      return;
    }
  }
  os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
  fig_log_call_emit_and_clean_up_after_send_and_compose();
}

uint64_t __49__AVCaptureFigVideoDevice__setAdjustingExposure___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 540) = *(unsigned char *)(result + 48);
  if (*(unsigned char *)(*(void *)(result + 32) + 541))
  {
    if (!*(unsigned char *)(result + 48))
    {
      *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
      *(unsigned char *)(*(void *)(result + 32) + 541) = 0;
    }
  }
  return result;
}

__n128 __54__AVCaptureFigVideoDevice_activeVideoMaxFrameDuration__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(__n128 **)(*(void *)(a1 + 40) + 8);
  unint64_t v3 = *(void *)(*(void *)(a1 + 32) + 296);
  __n128 result = *(__n128 *)(*(void *)(a1 + 32) + 280);
  v2[2] = result;
  v2[3].n128_u64[0] = v3;
  uint64_t v5 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v5 + 1220) && *(unsigned char *)(v5 + 1221) || *(unsigned char *)(v5 + 1307))
  {
    uint64_t v6 = (CMTime *)(*(void *)(*(void *)(a1 + 40) + 8) + 32);
    uint64_t v7 = (void *)[*(id *)(v5 + 144) videoFrameRateRangeForCenterStage];
    if (v7) {
      [v7 maxFrameDuration];
    }
    else {
      memset(&time2, 0, sizeof(time2));
    }
    CMTime time1 = *v6;
    if (CMTimeCompare(&time1, &time2) >= 1)
    {
      uint64_t v8 = (void *)[*(id *)(*(void *)(a1 + 32) + 144) videoFrameRateRangeForCenterStage];
      if (v8)
      {
        uint64_t v9 = (__n128 *)v55;
        [v8 maxFrameDuration];
      }
      else
      {
        memset(v55, 0, sizeof(v55));
        uint64_t v9 = (__n128 *)v55;
      }
LABEL_18:
      uint64_t v13 = *(__n128 **)(*(void *)(a1 + 40) + 8);
      __n128 result = *v9;
      void v13[2] = *v9;
      v13[3].n128_u64[0] = v9[1].n128_u64[0];
      goto LABEL_19;
    }
    uint64_t v10 = (CMTime *)(*(void *)(*(void *)(a1 + 40) + 8) + 32);
    uint64_t v11 = (void *)[*(id *)(*(void *)(a1 + 32) + 144) videoFrameRateRangeForCenterStage];
    if (v11) {
      [v11 minFrameDuration];
    }
    else {
      memset(&v54, 0, sizeof(v54));
    }
    CMTime time1 = *v10;
    if (CMTimeCompare(&time1, &v54) < 0)
    {
      id v12 = (void *)[*(id *)(*(void *)(a1 + 32) + 144) videoFrameRateRangeForCenterStage];
      if (v12)
      {
        uint64_t v9 = (__n128 *)v53;
        [v12 minFrameDuration];
      }
      else
      {
        memset(v53, 0, sizeof(v53));
        uint64_t v9 = (__n128 *)v53;
      }
      goto LABEL_18;
    }
  }
LABEL_19:
  uint64_t v14 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v14 + 1258) && *(unsigned char *)(v14 + 1259))
  {
    uint64_t v15 = (CMTime *)(*(void *)(*(void *)(a1 + 40) + 8) + 32);
    uint64_t v16 = (void *)[*(id *)(v14 + 144) videoFrameRateRangeForBackgroundBlur];
    if (v16) {
      [v16 maxFrameDuration];
    }
    else {
      memset(&v52, 0, sizeof(v52));
    }
    CMTime time1 = *v15;
    if (CMTimeCompare(&time1, &v52) >= 1)
    {
      CMTime v17 = (void *)[*(id *)(*(void *)(a1 + 32) + 144) videoFrameRateRangeForBackgroundBlur];
      if (v17)
      {
        id v18 = (__n128 *)v51;
        [v17 maxFrameDuration];
      }
      else
      {
        memset(v51, 0, sizeof(v51));
        id v18 = (__n128 *)v51;
      }
LABEL_35:
      uint64_t v22 = *(__n128 **)(*(void *)(a1 + 40) + 8);
      __n128 result = *v18;
      v22[2] = *v18;
      v22[3].n128_u64[0] = v18[1].n128_u64[0];
      goto LABEL_36;
    }
    CMTime v19 = (CMTime *)(*(void *)(*(void *)(a1 + 40) + 8) + 32);
    uint64_t v20 = (void *)[*(id *)(*(void *)(a1 + 32) + 144) videoFrameRateRangeForBackgroundBlur];
    if (v20) {
      [v20 minFrameDuration];
    }
    else {
      memset(&v50, 0, sizeof(v50));
    }
    CMTime time1 = *v19;
    if (CMTimeCompare(&time1, &v50) < 0)
    {
      uint64_t v21 = (void *)[*(id *)(*(void *)(a1 + 32) + 144) videoFrameRateRangeForBackgroundBlur];
      if (v21)
      {
        id v18 = (__n128 *)v49;
        [v21 minFrameDuration];
      }
      else
      {
        memset(v49, 0, sizeof(v49));
        id v18 = (__n128 *)v49;
      }
      goto LABEL_35;
    }
  }
LABEL_36:
  uint64_t v23 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v23 + 1261) && *(unsigned char *)(v23 + 1262))
  {
    uint64_t v24 = (CMTime *)(*(void *)(*(void *)(a1 + 40) + 8) + 32);
    char v25 = (void *)[*(id *)(v23 + 144) videoFrameRateRangeForStudioLight];
    if (v25) {
      [v25 maxFrameDuration];
    }
    else {
      memset(&v48, 0, sizeof(v48));
    }
    CMTime time1 = *v24;
    if (CMTimeCompare(&time1, &v48) >= 1)
    {
      long long v26 = (void *)[*(id *)(*(void *)(a1 + 32) + 144) videoFrameRateRangeForStudioLight];
      if (v26)
      {
        long long v27 = (__n128 *)v47;
        [v26 maxFrameDuration];
      }
      else
      {
        memset(v47, 0, sizeof(v47));
        long long v27 = (__n128 *)v47;
      }
LABEL_52:
      long long v31 = *(__n128 **)(*(void *)(a1 + 40) + 8);
      __n128 result = *v27;
      v31[2] = *v27;
      v31[3].n128_u64[0] = v27[1].n128_u64[0];
      goto LABEL_53;
    }
    long long v28 = (CMTime *)(*(void *)(*(void *)(a1 + 40) + 8) + 32);
    long long v29 = (void *)[*(id *)(*(void *)(a1 + 32) + 144) videoFrameRateRangeForStudioLight];
    if (v29) {
      [v29 minFrameDuration];
    }
    else {
      memset(&v46, 0, sizeof(v46));
    }
    CMTime time1 = *v28;
    if (CMTimeCompare(&time1, &v46) < 0)
    {
      id v30 = (void *)[*(id *)(*(void *)(a1 + 32) + 144) videoFrameRateRangeForStudioLight];
      if (v30)
      {
        long long v27 = (__n128 *)v45;
        [v30 minFrameDuration];
      }
      else
      {
        memset(v45, 0, sizeof(v45));
        long long v27 = (__n128 *)v45;
      }
      goto LABEL_52;
    }
  }
LABEL_53:
  uint64_t v32 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v32 + 1267) && *(unsigned char *)(v32 + 1268))
  {
    long long v33 = (CMTime *)(*(void *)(*(void *)(a1 + 40) + 8) + 32);
    long long v34 = (void *)[*(id *)(v32 + 144) videoFrameRateRangeForBackgroundReplacement];
    if (v34) {
      [v34 maxFrameDuration];
    }
    else {
      memset(&v44, 0, sizeof(v44));
    }
    CMTime time1 = *v33;
    if (CMTimeCompare(&time1, &v44) >= 1)
    {
      int v35 = (void *)[*(id *)(*(void *)(a1 + 32) + 144) videoFrameRateRangeForBackgroundReplacement];
      if (v35)
      {
        long long v36 = (__n128 *)v43;
        [v35 maxFrameDuration];
      }
      else
      {
        memset(v43, 0, sizeof(v43));
        long long v36 = (__n128 *)v43;
      }
LABEL_69:
      long long v40 = *(__n128 **)(*(void *)(a1 + 40) + 8);
      __n128 result = *v36;
      void v40[2] = *v36;
      v40[3].n128_u64[0] = v36[1].n128_u64[0];
      return result;
    }
    uint64_t v37 = (CMTime *)(*(void *)(*(void *)(a1 + 40) + 8) + 32);
    uint64_t v38 = (void *)[*(id *)(*(void *)(a1 + 32) + 144) videoFrameRateRangeForBackgroundReplacement];
    if (v38) {
      [v38 minFrameDuration];
    }
    else {
      memset(&v42, 0, sizeof(v42));
    }
    CMTime time1 = *v37;
    if (CMTimeCompare(&time1, &v42) < 0)
    {
      long long v39 = (void *)[*(id *)(*(void *)(a1 + 32) + 144) videoFrameRateRangeForBackgroundReplacement];
      if (v39)
      {
        long long v36 = (__n128 *)v41;
        [v39 minFrameDuration];
      }
      else
      {
        memset(v41, 0, sizeof(v41));
        long long v36 = (__n128 *)v41;
      }
      goto LABEL_69;
    }
  }
  return result;
}

double *__59__AVCaptureFigVideoDevice__setMaxAvailableVideoZoomFactor___block_invoke_2(double *result)
{
  *(double *)(*((void *)result + 4) + 888) = result[6];
  if (result[6] < *(float *)(*((void *)result + 4) + 864)) {
    *(unsigned char *)(*(void *)(*((void *)result + 5) + 8) + 24) = 1;
  }
  return result;
}

uint64_t __56__AVCaptureFigVideoDevice_degradedCaptureQualityFactors__block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (*(unsigned char *)(result + 1216))
  {
    [(id)result _initDegradedCaptureQualityFactors];
    uint64_t result = *(void *)(a1 + 32);
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(void *)(result + 1208);
  return result;
}

- (void)_initDegradedCaptureQualityFactors
{
  if (!_FigIsCurrentDispatchQueue()) {
    FigDebugAssert3();
  }
  self->_cameraPoseMatridouble x = 0;
  if (BYTE1(self->_degradedCaptureQualityFactors)) {
    self->_cameraPoseMatridouble x = (NSData *)objc_msgSend(-[AVCaptureFigVideoDevice _getFigCaptureSourceProperty:](self, "_getFigCaptureSourceProperty:", *MEMORY[0x1E4F52180]), "BOOLValue");
  }
  if (BYTE2(self->_degradedCaptureQualityFactors))
  {
    int v3 = objc_msgSend(-[AVCaptureFigVideoDevice _getFigCaptureSourceProperty:](self, "_getFigCaptureSourceProperty:", *MEMORY[0x1E4F51F68]), "BOOLValue");
    uint64_t v4 = 2;
    if (!v3) {
      uint64_t v4 = 0;
    }
    self->_cameraPoseMatridouble x = (NSData *)((uint64_t)self->_cameraPoseMatrix | v4);
  }
  LOBYTE(self->_degradedCaptureQualityFactors) = 0;
}

- (id)_getFigCaptureSourceProperty:(__CFString *)a3
{
  id v3 = [(AVCaptureFigVideoDevice *)self _copyFigCaptureSourceProperty:a3];

  return v3;
}

- (BOOL)isTorchActive
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__AVCaptureFigVideoDevice_isTorchActive__block_invoke;
  v5[3] = &unk_1E5A74078;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

__n128 __69__AVCaptureFigVideoDevice_setVideoMinFrameDurationOverride_forOwner___block_invoke(uint64_t a1)
{
  uint64_t v1 = (__n128 *)(*(void *)(a1 + 32) + 200);
  unint64_t v2 = *(void *)(a1 + 72);
  __n128 result = *(__n128 *)(a1 + 56);
  *uint64_t v1 = result;
  v1[1].n128_u64[0] = v2;
  *(void *)(*(void *)(a1 + 32) + 224) = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = (long long *)(v4 + 200);
  if (*(unsigned char *)(v4 + 212))
  {
    uint64_t v7 = (long long *)(v4 + 232);
    long long v8 = *v7;
    time1.epoch = *((void *)v7 + 2);
    *(_OWORD *)&time1.CMTimeValue value = v8;
    long long v9 = *v5;
    v11.epoch = *((void *)v5 + 2);
    *(_OWORD *)&v11.CMTimeValue value = v9;
    if (CMTimeCompare(&time1, &v11) < 0)
    {
      uint64_t v10 = *(__n128 **)(*(void *)(a1 + 48) + 8);
      __n128 result = *(__n128 *)(*(void *)(a1 + 32) + 200);
      v10[3].n128_u64[0] = *(void *)(*(void *)(a1 + 32) + 216);
      v10[2] = result;
    }
  }
  return result;
}

uint64_t __56__AVCaptureFigVideoDevice__setDigitalFlashModeInternal___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_setFigCaptureSourceProperty:withValue:", *MEMORY[0x1E4F51FD0], objc_msgSend(NSNumber, "numberWithInteger:", *(void *)(a1 + 40)));
  if (!result) {
    *(void *)(*(void *)(a1 + 32) + 752) = *(void *)(a1 + 40);
  }
  return result;
}

uint64_t __48__AVCaptureFigVideoDevice_setVideoHDRSuspended___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_setFigCaptureSourceProperty:withValue:", *MEMORY[0x1E4F52168], objc_msgSend(NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 40)));
  if (!result) {
    *(unsigned char *)(*(void *)(a1 + 32) + 846) = *(unsigned char *)(a1 + 40);
  }
  return result;
}

- (void)_setIsStillImageStabilizationScene:(BOOL)a3
{
  devicePropsQueue = self->_devicePropsQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __62__AVCaptureFigVideoDevice__setIsStillImageStabilizationScene___block_invoke;
  v4[3] = &unk_1E5A74028;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(devicePropsQueue, v4);
}

- (void)setExposureTargetBias:(float)a3 completionHandler:(id)a4
{
  float v5 = a3;
  a3 = 3.4028e38;
  if (v5 == 3.4028e38
    || ([(AVCaptureFigVideoDevice *)self minExposureTargetBias], v7 <= v5)
    && ([(AVCaptureFigVideoDevice *)self maxExposureTargetBias], v8 >= v5))
  {
    uint64_t v23 = 0;
    uint64_t v24 = &v23;
    uint64_t v25 = 0x2020000000;
    int v26 = 0;
    uint64_t v19 = 0;
    uint64_t v20 = &v19;
    uint64_t v21 = 0x2020000000;
    char v22 = 0;
    devicePropsQueue = self->_devicePropsQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __67__AVCaptureFigVideoDevice_setExposureTargetBias_completionHandler___block_invoke;
    block[3] = &unk_1E5A742F8;
    block[4] = self;
    void block[5] = a4;
    float v18 = v5;
    void block[6] = &v19;
    void block[7] = &v23;
    dispatch_sync(devicePropsQueue, block);
    int v13 = *((_DWORD *)v24 + 6);
    if (v13)
    {
      if (v13 == -16452)
      {
        uint64_t v14 = (void *)MEMORY[0x1E4F1CA00];
        objc_opt_class();
        uint64_t v15 = (void *)[v14 exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:AVMethodExceptionReasonWithClassAndSelector() userInfo:0];
        if (AVCaptureShouldThrowForAPIViolations()) {
          objc_exception_throw(v15);
        }
        NSLog(&cfstr_SuppressingExc.isa, v15);
        goto LABEL_12;
      }
    }
    else if (!*((unsigned char *)v20 + 24))
    {
LABEL_12:
      _Block_object_dispose(&v19, 8);
      _Block_object_dispose(&v23, 8);
      return;
    }
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __67__AVCaptureFigVideoDevice_setExposureTargetBias_completionHandler___block_invoke_2;
    v16[3] = &unk_1E5A72ED0;
    void v16[4] = self;
    [(AVCaptureFigVideoDevice *)self _performBlockOnMainThread:v16];
    goto LABEL_12;
  }
  long long v9 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v10 = *MEMORY[0x1E4F1C4A8];
  objc_opt_class();
  CMTime v11 = objc_msgSend(v9, "exceptionWithName:reason:userInfo:", v10, AVMethodExceptionReasonWithClassAndSelector(), 0, v5);
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v11);
  }
  NSLog(&cfstr_SuppressingExc.isa, v11);
}

- (float)minExposureTargetBias
{
  return -8.0;
}

- (float)maxExposureTargetBias
{
  return 8.0;
}

void __54__AVCaptureFigVideoDevice__cameraHistoryDispatchQueue__block_invoke()
{
  if (dword_1EB4C9280)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  sPreferredCameraPropertyRefreshQueue = MEMORY[0x1E4F14428];
}

uint64_t __88__AVCaptureFigVideoDevice__updateCenterStageActiveForEnabled_updateDependentProperties___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(unsigned char *)(*(void *)(a1 + 32) + 1220);
  uint64_t result = [*(id *)(a1 + 32) _isCenterStageActiveForEnabled:*(unsigned __int8 *)(a1 + 80)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = *(unsigned char *)(*(void *)(a1 + 32) + 1221);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = *(unsigned char *)(*(void *)(a1 + 32) + 944);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = *(unsigned char *)(*(void *)(a1 + 32) + 960);
  return result;
}

- (unint64_t)stereoVideoCaptureStatus
{
  uint64_t v6 = 0;
  float v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__AVCaptureFigVideoDevice_stereoVideoCaptureStatus__block_invoke;
  v5[3] = &unk_1E5A74078;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (double)minAvailableVideoZoomFactor
{
  uint64_t v6 = 0;
  float v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__AVCaptureFigVideoDevice_minAvailableVideoZoomFactor__block_invoke;
  v5[3] = &unk_1E5A74078;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isTorchAvailable
{
  uint64_t v6 = 0;
  float v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__AVCaptureFigVideoDevice_isTorchAvailable__block_invoke;
  v5[3] = &unk_1E5A74078;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isHDRSceneDetectedForPhotoOutput
{
  uint64_t v6 = 0;
  float v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__AVCaptureFigVideoDevice_isHDRSceneDetectedForPhotoOutput__block_invoke;
  v5[3] = &unk_1E5A74078;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isFlashSceneDetectedForPhotoOutput
{
  uint64_t v6 = 0;
  float v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __61__AVCaptureFigVideoDevice_isFlashSceneDetectedForPhotoOutput__block_invoke;
  v5[3] = &unk_1E5A74078;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isFlashAvailable
{
  uint64_t v6 = 0;
  float v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__AVCaptureFigVideoDevice_isFlashAvailable__block_invoke;
  v5[3] = &unk_1E5A74078;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int64_t)imageControlMode
{
  uint64_t v6 = 0;
  float v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__AVCaptureFigVideoDevice_imageControlMode__block_invoke;
  v5[3] = &unk_1E5A74078;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (unint64_t)degradedCaptureQualityFactors
{
  uint64_t v6 = 0;
  float v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__AVCaptureFigVideoDevice_degradedCaptureQualityFactors__block_invoke;
  v5[3] = &unk_1E5A73EF0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __50__AVCaptureFigVideoDevice__setUpCameraHistoryOnce__block_invoke_41(uint64_t result)
{
  if (sCameraHistoryHasBeenSetUp == 1)
  {
    uint64_t v1 = *(void **)(result + 32);
    return [v1 _refreshPreferredCameraProperties:1];
  }
  else if (dword_1EB4C9280)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

uint64_t __50__AVCaptureFigVideoDevice__setUpCameraHistoryOnce__block_invoke_36(uint64_t result)
{
  if (sCameraHistoryHasBeenSetUp == 1)
  {
    uint64_t v1 = *(void **)(result + 32);
    return [v1 _refreshPreferredCameraProperties:1];
  }
  else if (dword_1EB4C9280)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

uint64_t __50__AVCaptureFigVideoDevice__setUpCameraHistoryOnce__block_invoke_33(uint64_t result)
{
  if (sCameraHistoryHasBeenSetUp == 1)
  {
    uint64_t v1 = *(void **)(result + 32);
    return [v1 _refreshPreferredCameraProperties:1];
  }
  else if (dword_1EB4C9280)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

void __47__AVCaptureFigVideoDevice_setActiveColorSpace___block_invoke(uint64_t a1)
{
  unint64_t v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 144) supportedColorSpaces];
  if (objc_msgSend(v2, "containsObject:", objc_msgSend(NSNumber, "numberWithInteger:", *(void *)(a1 + 40))))
  {
    *(void *)(*(void *)(a1 + 32) + 856) = *(void *)(a1 + 40);
  }
  else
  {
    unint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v4 = *MEMORY[0x1E4F1C3C8];
    objc_opt_class();
    float v5 = (void *)[v3 exceptionWithName:v4 reason:AVMethodExceptionReasonWithClassAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v5);
    }
    NSLog(&cfstr_SuppressingExc.isa, v5);
  }
}

- (id)systemPressureState
{
  uint64_t v6 = 0;
  float v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__5;
  uint64_t v10 = __Block_byref_object_dispose__5;
  uint64_t v11 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__AVCaptureFigVideoDevice_systemPressureState__block_invoke;
  v5[3] = &unk_1E5A74078;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)digitalFlashSceneForPhotoOutput
{
  uint64_t v6 = 0;
  float v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__5;
  uint64_t v10 = __Block_byref_object_dispose__5;
  uint64_t v11 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__AVCaptureFigVideoDevice_digitalFlashSceneForPhotoOutput__block_invoke;
  v5[3] = &unk_1E5A74078;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)supportedFallbackPrimaryConstituentDevices
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3052000000;
  uint64_t v10 = __Block_byref_object_copy__5;
  uint64_t v11 = __Block_byref_object_dispose__5;
  uint64_t v12 = MEMORY[0x1E4F1CBF0];
  if ([(AVCaptureFigVideoDevice *)self _isBravoVariant])
  {
    if (!self->_primaryConstituentDeviceRestrictedSwitchingBehaviorConditions) {
      [(AVCaptureFigVideoDevice *)self _populateSupportedFallbackPrimaryConstituentDevices];
    }
    devicePropsQueue = self->_devicePropsQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __69__AVCaptureFigVideoDevice_supportedFallbackPrimaryConstituentDevices__block_invoke;
    void v6[3] = &unk_1E5A74078;
    void v6[4] = self;
    v6[5] = &v7;
    dispatch_sync(devicePropsQueue, v6);
  }
  uint64_t v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __60__AVCaptureFigVideoDevice_setNonDestructiveCropAspectRatio___block_invoke(uint64_t a1)
{
  unint64_t Dimensions = (unint64_t)CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)[*(id *)(*(void *)(a1 + 32) + 144) formatDescription]);
  int32_t v3 = Dimensions;
  unint64_t v4 = HIDWORD(Dimensions);
  switch(*(void *)(a1 + 40))
  {
    case 0:
    case 1:
      double v5 = 1.0;
      goto LABEL_14;
    case 2:
      CGFloat v6 = 1.0;
      double v5 = 0.75;
      break;
    case 3:
      CGFloat v6 = 0.75;
      double v5 = 1.0;
      break;
    case 4:
      double v10 = ((double)(int)Dimensions + (double)(int)Dimensions) / 3.0;
      goto LABEL_13;
    case 5:
      double v7 = AVCaptureMainScreenPixelSize();
      if (v7 >= v8) {
        double v9 = v8;
      }
      else {
        double v9 = v7;
      }
      if (v7 < v8) {
        double v7 = v8;
      }
      double v10 = v9 * (double)v3 / v7;
LABEL_13:
      double v5 = v10 / (double)(int)v4;
LABEL_14:
      CGFloat v6 = 1.0;
      break;
    default:
      double v5 = 0.0;
      CGFloat v6 = 0.0;
      break;
  }
  v14.CGFloat width = v6;
  v14.height = v5;
  CFDictionaryRef DictionaryRepresentation = CGSizeCreateDictionaryRepresentation(v14);
  int v12 = [*(id *)(a1 + 32) _setFigCaptureSourceProperty:*MEMORY[0x1E4F52098] withValue:DictionaryRepresentation cacheOnly:*(unsigned __int8 *)(*(void *)(a1 + 32) + 328)];

  if (!v12)
  {
    *(void *)(*(void *)(a1 + 32) + 1152) = *(void *)(a1 + 40);
    uint64_t v13 = *(void *)(a1 + 32) + 1160;
    *(CGFloat *)uint64_t v13 = v6;
    *(double *)(v13 + 8) = v5;
  }
}

- (void)setSubjectAreaChangeMonitoringEnabled:(BOOL)a3
{
  int v5 = -[AVCaptureFigVideoDevice _setFigCaptureSourceProperty:withValue:](self, "_setFigCaptureSourceProperty:withValue:", *MEMORY[0x1E4F52118], objc_msgSend(NSNumber, "numberWithBool:"));
  if (v5 == -16452)
  {
    CGFloat v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3A8];
    objc_opt_class();
    double v8 = (void *)[v6 exceptionWithName:v7 reason:AVMethodExceptionReasonWithClassAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v8);
    }
    NSLog(&cfstr_SuppressingExc.isa, v8);
  }
  else if (!v5)
  {
    BYTE1(self->_torchLevel) = a3;
  }
}

- (void)setAutomaticallyAdjustsImageControlMode:(BOOL)a3
{
  int v5 = -[AVCaptureFigVideoDevice _setFigCaptureSourceProperty:withValue:](self, "_setFigCaptureSourceProperty:withValue:", *MEMORY[0x1E4F51F28], objc_msgSend(NSNumber, "numberWithBool:"));
  if (v5 == -16452)
  {
    CGFloat v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3A8];
    objc_opt_class();
    double v8 = (void *)[v6 exceptionWithName:v7 reason:AVMethodExceptionReasonWithClassAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v8);
    }
    NSLog(&cfstr_SuppressingExc.isa, v8);
  }
  else if (!v5)
  {
    BYTE1(self->_sceneClassificationKVO) = a3;
  }
}

- (void)setFaceDetectionDrivenImageProcessingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(AVCaptureFigVideoDevice *)self isFaceDetectionSupported])
  {
    if (v3) {
      uint64_t v5 = 3;
    }
    else {
      uint64_t v5 = 0;
    }
    int v6 = -[AVCaptureFigVideoDevice _setFigCaptureSourceProperty:withValue:](self, "_setFigCaptureSourceProperty:withValue:", *MEMORY[0x1E4F52020], [NSNumber numberWithInt:v5]);
    if (v6 != -16452)
    {
      if (!v6)
      {
        devicePropsQueue = self->_devicePropsQueue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __72__AVCaptureFigVideoDevice_setFaceDetectionDrivenImageProcessingEnabled___block_invoke;
        block[3] = &unk_1E5A74370;
        block[4] = self;
        int v12 = v5;
        dispatch_sync(devicePropsQueue, block);
      }
      return;
    }
    double v8 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v9 = *MEMORY[0x1E4F1C3A8];
    objc_opt_class();
  }
  else
  {
    double v8 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v9 = *MEMORY[0x1E4F1C3C8];
    objc_opt_class();
  }
  double v10 = (void *)[v8 exceptionWithName:v9 reason:AVMethodExceptionReasonWithClassAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v10);
  }
  NSLog(&cfstr_SuppressingExc.isa, v10);
}

- (void)setFocusMode:(int64_t)a3
{
  if (-[AVCaptureFigVideoDevice isFocusModeSupported:](self, "isFocusModeSupported:"))
  {
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x2020000000;
    devicePropsQueue = self->_devicePropsQueue;
    int v15 = 0;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__AVCaptureFigVideoDevice_setFocusMode___block_invoke;
    block[3] = &unk_1E5A74230;
    block[4] = self;
    void block[5] = &v12;
    void block[6] = a3;
    dispatch_sync(devicePropsQueue, block);
    if (*((_DWORD *)v13 + 6) == -16452)
    {
      int v6 = (void *)MEMORY[0x1E4F1CA00];
      objc_opt_class();
      uint64_t v7 = (void *)[v6 exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:AVMethodExceptionReasonWithClassAndSelector() userInfo:0];
      if (AVCaptureShouldThrowForAPIViolations()) {
        objc_exception_throw(v7);
      }
      NSLog(&cfstr_SuppressingExc.isa, v7);
    }
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    double v8 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v9 = *MEMORY[0x1E4F1C3C8];
    objc_opt_class();
    double v10 = (void *)[v8 exceptionWithName:v9 reason:AVMethodExceptionReasonWithClassAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v10);
    }
    NSLog(&cfstr_SuppressingExc.isa, v10);
  }
}

- (void)setExposureMode:(int64_t)a3
{
  if (-[AVCaptureFigVideoDevice isExposureModeSupported:](self, "isExposureModeSupported:"))
  {
    if (a3 == 3)
    {
      uint64_t v5 = +[AVCaptureDeviceControlRequest deviceControlRequestWithCompletionBlock:0];
      [(AVCaptureDeviceControlRequestQueue *)self->_manualFocusControlRequests enqueueRequest:v5];
    }
    else
    {
      uint64_t v5 = 0;
    }
    uint64_t v15 = 0;
    uint64_t v16 = &v15;
    uint64_t v17 = 0x2020000000;
    int v18 = 0;
    devicePropsQueue = self->_devicePropsQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __43__AVCaptureFigVideoDevice_setExposureMode___block_invoke;
    block[3] = &unk_1E5A742A8;
    void block[6] = &v15;
    void block[7] = a3;
    block[4] = self;
    void block[5] = v5;
    dispatch_sync(devicePropsQueue, block);
    int v10 = *((_DWORD *)v16 + 6);
    if (v10 == -16452)
    {
      uint64_t v11 = (void *)MEMORY[0x1E4F1CA00];
      objc_opt_class();
      uint64_t v12 = (void *)[v11 exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:AVMethodExceptionReasonWithClassAndSelector() userInfo:0];
      if (AVCaptureShouldThrowForAPIViolations()) {
        objc_exception_throw(v12);
      }
      NSLog(&cfstr_SuppressingExc.isa, v12);
    }
    else if (v5 && v10)
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      void v13[2] = __43__AVCaptureFigVideoDevice_setExposureMode___block_invoke_2;
      void v13[3] = &unk_1E5A72ED0;
      v13[4] = self;
      [(AVCaptureFigVideoDevice *)self _performBlockOnMainThread:v13];
    }
    _Block_object_dispose(&v15, 8);
  }
  else
  {
    int v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
    objc_opt_class();
    double v8 = (void *)[v6 exceptionWithName:v7 reason:AVMethodExceptionReasonWithClassAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v8);
    }
    NSLog(&cfstr_SuppressingExc.isa, v8);
  }
}

uint64_t __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_8(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32) + 432;
  uint64_t v2 = *(void *)(result + 72);
  *(_OWORD *)uint64_t v1 = *(_OWORD *)(result + 56);
  *(void *)(v1 + 16) = v2;
  uint64_t v3 = *(void *)(result + 32);
  if (*(void *)(v3 + 424) == 3)
  {
    unint64_t v4 = (void *)result;
    double v5 = (double)*(int *)(result + 64) / (double)*(uint64_t *)(result + 56) + 0.05;
    if (v5 < (double)*(int *)(v3 + 288) / (double)*(uint64_t *)(v3 + 280))
    {
      double v6 = floor(v5);
      uint64_t v7 = objc_msgSend((id)objc_msgSend(*(id *)(v3 + 144), "videoSupportedFrameRateRanges"), "objectAtIndexedSubscript:", 0);
      [v7 minFrameRate];
      if (v6 < v8)
      {
        [v7 minFrameRate];
        double v6 = v9;
      }
      CMTimeMake(&v14, 1, (int)v6);
      *(CMTime *)(*(void *)(v4[5] + 8) + 32) = v14;
      uint64_t v10 = v4[4] + 280;
      CMTime time1 = *(CMTime *)(*(void *)(v4[5] + 8) + 32);
      long long v11 = *(_OWORD *)v10;
      v12.epoch = *(void *)(v10 + 16);
      *(_OWORD *)&v12.CMTimeValue value = v11;
      uint64_t result = CMTimeCompare(&time1, &v12);
      if (result) {
        *(unsigned char *)(*(void *)(v4[6] + 8) + 24) = 1;
      }
    }
  }
  return result;
}

uint64_t __63__AVCaptureFigVideoDevice__setShallowDepthOfFieldEffectStatus___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 952) = *(void *)(result + 40);
  return result;
}

- (void)_setShallowDepthOfFieldEffectStatus:(int64_t)a3
{
  devicePropsQueue = self->_devicePropsQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __63__AVCaptureFigVideoDevice__setShallowDepthOfFieldEffectStatus___block_invoke;
  v4[3] = &unk_1E5A72F98;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_sync(devicePropsQueue, v4);
}

+ (void)_reconnectDevices:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  obuint64_t j = +[AVCaptureFigVideoDevice _newFigCaptureSources];
  uint64_t v4 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v21 = *(void *)v28;
    uint64_t v19 = *MEMORY[0x1E4F51F20];
    uint64_t v18 = *MEMORY[0x1E4F1CF80];
    uint64_t v6 = *MEMORY[0x1E4F51C80];
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v28 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        id v26 = 0;
        uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 8);
        if (v9) {
          uint64_t v10 = v9;
        }
        else {
          uint64_t v10 = 0;
        }
        long long v11 = *(void (**)(uint64_t, uint64_t, uint64_t, id *))(v10 + 48);
        if (v11) {
          v11(v8, v19, v18, &v26);
        }
        id v12 = (id)objc_msgSend(v26, "objectForKeyedSubscript:", v6, v18, v19);

        long long v24 = 0u;
        long long v25 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        uint64_t v13 = [a3 countByEnumeratingWithState:&v22 objects:v31 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v23;
          while (2)
          {
            for (uint64_t j = 0; j != v14; ++j)
            {
              if (*(void *)v23 != v15) {
                objc_enumerationMutation(a3);
              }
              uint64_t v17 = *(void **)(*((void *)&v22 + 1) + 8 * j);
              if (objc_msgSend((id)objc_msgSend(v17, "uniqueID"), "isEqualToString:", v12))
              {
                [v17 _reconnectToFigCaptureSource:v8];
                goto LABEL_21;
              }
            }
            uint64_t v14 = [a3 countByEnumeratingWithState:&v22 objects:v31 count:16];
            if (v14) {
              continue;
            }
            break;
          }
        }
LABEL_21:
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v5);
  }
}

+ (id)_userPreferredCameraOverrideHistoryKey
{
  if (_userPreferredCameraOverrideHistoryKey_onceToken != -1) {
    dispatch_once(&_userPreferredCameraOverrideHistoryKey_onceToken, &__block_literal_global_15);
  }
  return (id)sUserPreferredCameraOverrideHistoryKey;
}

uint64_t __65__AVCaptureFigVideoDevice__userPreferredCameraOverrideHistoryKey__block_invoke()
{
  uint64_t result = [[NSString alloc] initWithFormat:@"%@/override/%@", @"camera-history", @"preferred-camera-history"];
  sUserPreferredCameraOverrideHistoryKeCGFloat y = result;
  return result;
}

+ (BOOL)allowsSuspendedPreferredCameras
{
  [a1 _setUpCameraHistoryOnce];
  os_unfair_lock_lock((os_unfair_lock_t)&sCameraHistoryLock);
  char v2 = sAllowsSuspendedPreferredCameras;
  os_unfair_lock_unlock((os_unfair_lock_t)&sCameraHistoryLock);
  return v2;
}

+ (void)setAllowsSuspendedPreferredCameras:(BOOL)a3
{
  int v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  [a1 _setUpCameraHistoryOnce];
  os_unfair_lock_lock((os_unfair_lock_t)&sCameraHistoryLock);
  if (sAllowsSuspendedPreferredCameras == v3)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&sCameraHistoryLock);
  }
  else
  {
    sAllowsSuspendedPreferredCameras = v3;
    os_unfair_lock_unlock((os_unfair_lock_t)&sCameraHistoryLock);
    if (dword_1EB4C9280)
    {
      unsigned int v14 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    uint64_t v6 = +[AVCaptureFigVideoDevice _cameraHistoryDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__AVCaptureFigVideoDevice_setAllowsSuspendedPreferredCameras___block_invoke;
    block[3] = &unk_1E5A72ED0;
    block[4] = a1;
    dispatch_async(v6, block);
    if (dword_1EB4C9280)
    {
      unsigned int v14 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      uint64_t v7 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v8 = v14;
      if (os_log_type_enabled(v7, type)) {
        unsigned int v9 = v8;
      }
      else {
        unsigned int v9 = v8 & 0xFFFFFFFE;
      }
      if (v9)
      {
        int v15 = 136315138;
        uint64_t v16 = "+[AVCaptureFigVideoDevice setAllowsSuspendedPreferredCameras:]";
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
}

uint64_t __62__AVCaptureFigVideoDevice_setAllowsSuspendedPreferredCameras___block_invoke(uint64_t result)
{
  if (sCameraHistoryHasBeenSetUp == 1)
  {
    uint64_t v1 = *(void **)(result + 32);
    return [v1 _refreshPreferredCameraProperties:1];
  }
  else if (dword_1EB4C9280)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

+ (id)userPreferredCamera
{
  v14[18] = *MEMORY[0x1E4F143B8];
  [a1 _setUpCameraHistoryOnce];
  os_unfair_lock_lock((os_unfair_lock_t)&sCameraHistoryLock);
  id v2 = (id)sUserPreferredCamera;
  int v3 = sAllowsSuspendedPreferredCameras;
  os_unfair_lock_unlock((os_unfair_lock_t)&sCameraHistoryLock);
  if (!v2)
  {
    if (dword_1EB4C9280)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    uint64_t v5 = *MEMORY[0x1E4F47C60];
    v14[0] = *MEMORY[0x1E4F47C68];
    v14[1] = v5;
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v14, 2, v9, v12);
    LOBYTE(v10) = v3 != 0;
    id v2 = +[AVCaptureFigVideoDevice _defaultDeviceWithDeviceType:@"All" mediaTypes:v6 position:0 cameraOverrideHistoryAllowed:0 cameraOverrideHistorySuspendedAllowed:0 wombatsMustBeMagic:0 userPreferredCameraHistorySuspendedAllowed:v10 invalidSpecialDeviceTypes:0];
    if (dword_1EB4C9280)
    {
      uint64_t v7 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    +[AVCaptureFigVideoDevice _insurePreferredCameraGlobal:&sUserPreferredCamera, @"user", v2, v11, v13 globalName preferredCamera];
  }
  return v2;
}

+ (void)setUserPreferredCamera:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&sSuspendedDevicesLock);
    if (objc_msgSend(0, "objectForKey:", objc_msgSend(a3, "uniqueID")))
    {
      if (dword_1EB4C9280)
      {
        os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      objc_msgSend(0, "removeObjectForKey:", objc_msgSend(a3, "uniqueID", v14, v15));
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&sSuspendedDevicesLock);
    os_unfair_lock_lock((os_unfair_lock_t)&sCameraHistoryLock);
    id v9 = (id)sUserPreferredCamera;
    id v10 = (id)sSystemPreferredCamera;
    os_unfair_lock_unlock((os_unfair_lock_t)&sCameraHistoryLock);
    if (v9 == a3 || [a3 isEqual:v9])
    {
      if (v10 == a3)
      {
LABEL_20:

        return;
      }
      char v11 = [a3 isEqual:v10];
      if ((v11 & 1) != 0 || !dword_1EB4C9280)
      {
        if (v11) {
          goto LABEL_20;
        }
      }
      else
      {
        uint64_t v12 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
    }
    else
    {
      if (dword_1EB4C9280)
      {
        uint64_t v13 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      [(id)objc_opt_class() willChangeValueForKey:@"userPreferredCamera"];
      os_unfair_lock_lock((os_unfair_lock_t)&sCameraHistoryLock);

      sUserPreferredCamera = (uint64_t)a3;
      os_unfair_lock_unlock((os_unfair_lock_t)&sCameraHistoryLock);
      [(id)objc_opt_class() didChangeValueForKey:@"userPreferredCamera"];
    }
    objc_msgSend(a1, "_setUpCameraHistoryOnce", v14, v15);
    [a3 updateUserPreferredCameraHistory];
    goto LABEL_20;
  }
  uint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v7 = *MEMORY[0x1E4F1C3C8];
  objc_opt_class();
  unsigned int v8 = (void *)[v6 exceptionWithName:v7 reason:AVMethodExceptionReasonWithClassAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v8);
  }
  NSLog(&cfstr_SuppressingExc.isa, v8);
}

+ (void)setUserPreferredCamera:(id)a3 forClientPreferenceDomain:(id)a4
{
  [a1 _setUpCameraHistoryOnce];
  id v6 = +[AVCaptureFigVideoDevice _userPreferredCameraHistoryKeyForClientPreferencesDomain:a4];

  [a3 updateUserPreferredCameraHistoryForKey:v6];
}

+ (void)updateUserPreferredCameraOverrideHistoryWithDevice:(id)a3 setOverride:(BOOL)a4
{
  BOOL v4 = a4;
  [a1 _setUpCameraHistoryOnce];

  [a3 updateUserPreferredCameraOverride:v4];
}

+ (id)cameraInfoForCreatorID:(id)a3 uniqueID:(id)a4 specialDeviceType:(unsigned int)a5 centerStageSupported:(BOOL)a6
{
  v9[3] = *MEMORY[0x1E4F143B8];
  if (a6) {
    LODWORD(v6) = 2;
  }
  else {
    LODWORD(v6) = 3;
  }
  if (a5 == 3) {
    LODWORD(v6) = 1;
  }
  if (a5 == 2) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = v6;
  }
  v8[0] = @"CreatorID";
  v8[1] = @"DeviceUID";
  v9[0] = a3;
  v9[1] = a4;
  v8[2] = @"OverrideRanking";
  v9[2] = [NSNumber numberWithInt:v6];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];
}

+ (void)updateUserPreferredCameraOverride:(BOOL)a3 cameraInfo:(id)a4
{
  BOOL v5 = a3;
  uint64_t v6 = [a1 _userPreferredCameraOverrideHistoryKey];

  +[AVCaptureProprietaryDefaultsSingleton updateCameraOverrideHistory:v6 withCameraInfo:a4 setOverride:v5];
}

+ (void)_initiateRefreshPreferredCameraProperties:(BOOL)a3
{
  +[AVCaptureFigVideoDevice _setUpCameraHistoryOnce];
  BOOL v4 = +[AVCaptureFigVideoDevice _cameraHistoryDispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__AVCaptureFigVideoDevice__initiateRefreshPreferredCameraProperties___block_invoke;
  block[3] = &__block_descriptor_33_e5_v8__0l;
  BOOL v6 = a3;
  dispatch_async(v4, block);
}

uint64_t __69__AVCaptureFigVideoDevice__initiateRefreshPreferredCameraProperties___block_invoke(uint64_t result)
{
  if (sCameraHistoryHasBeenSetUp == 1)
  {
    uint64_t v1 = *(unsigned __int8 *)(result + 32);
    return +[AVCaptureFigVideoDevice _refreshPreferredCameraProperties:v1];
  }
  else if (dword_1EB4C9280)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

+ (id)_prioritizedDeviceList:(id)a3
{
  id v3 = a3;
  if (a3)
  {
    if ([a3 count])
    {
      [a1 _setUpCameraHistoryOnce];
      BOOL v5 = (void *)[MEMORY[0x1E4F1CA48] arrayWithArray:v3];
      id v3 = (id)objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
      os_unfair_lock_lock((os_unfair_lock_t)&sCameraHistoryLock);
      if (sUserPreferredCameraHistory) {
        uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithArray:");
      }
      else {
        uint64_t v6 = 0;
      }
      if (sUserPreferredCameraOverrideHistory) {
        uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithArray:");
      }
      else {
        uint64_t v7 = 0;
      }
      if (sStreamingCameraHistory) {
        uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithArray:");
      }
      else {
        uint64_t v8 = 0;
      }
      char v9 = sDownplayUserPreferredCameraOverrideHistory;
      os_unfair_lock_unlock((os_unfair_lock_t)&sCameraHistoryLock);
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      uint64_t v14 = __50__AVCaptureFigVideoDevice__prioritizedDeviceList___block_invoke;
      uint64_t v15 = &unk_1E5A73FD8;
      char v21 = v9;
      uint64_t v16 = v6;
      uint64_t v17 = v5;
      id v18 = v3;
      uint64_t v19 = v7;
      uint64_t v20 = v8;
      __50__AVCaptureFigVideoDevice__prioritizedDeviceList___block_invoke((uint64_t)v13, 0, 1);
      v14((uint64_t)v13, 1, 0);
      if ([v5 count] && objc_msgSend(v5, "count"))
      {
        unint64_t v10 = 0;
        do
        {
          char v11 = (void *)[v5 objectAtIndexedSubscript:v10];
          if (([v11 isSuspended] & 1) != 0 || objc_msgSend(v11, "specialDeviceType") != 1)
          {
            ++v10;
          }
          else
          {
            [v3 addObject:v11];
            [v5 removeObjectAtIndex:v10];
          }
        }
        while (v10 < [v5 count]);
      }
      if ([v5 count]) {
        [v3 addObjectsFromArray:v5];
      }
    }
    else
    {
      return (id)MEMORY[0x1E4F1CBF0];
    }
  }
  return v3;
}

unint64_t __50__AVCaptureFigVideoDevice__prioritizedDeviceList___block_invoke(uint64_t a1, int a2, int a3)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 72) && [*(id *)(a1 + 32) count])
  {
    v12[0] = [*(id *)(a1 + 32) objectAtIndexedSubscript:0];
    fvd_prioritizeUsingCameraHistory(*(void **)(a1 + 40), *(void **)(a1 + 48), (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1], a2, 1, 1, 0);
  }
  fvd_prioritizeUsingCameraHistory(*(void **)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 56), a2, 1, a3, *(void **)(a1 + 56));
  fvd_prioritizeUsingCameraHistory(*(void **)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 32), a2, 1, a3, *(void **)(a1 + 56));
  fvd_prioritizeUsingCameraHistory(*(void **)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 64), a2, 0, a3, *(void **)(a1 + 56));
  uint64_t v6 = *(void **)(a1 + 40);
  uint64_t v7 = *(void **)(a1 + 48);
  uint64_t v8 = *(void **)(a1 + 56);
  unint64_t result = [v6 count];
  if (result)
  {
    unint64_t result = [v6 count];
    if (result)
    {
      unint64_t v10 = 0;
      do
      {
        char v11 = (void *)[v6 objectAtIndexedSubscript:v10];
        if ([v11 isSuspended] != a2
          || [v11 specialDeviceType] == 1)
        {
LABEL_16:
          ++v10;
          goto LABEL_17;
        }
        if ([v11 specialDeviceType] == 2)
        {
          if (!a3) {
            goto LABEL_15;
          }
        }
        else if ([v11 specialDeviceType] != 3 || (a3 & 1) == 0)
        {
          goto LABEL_15;
        }
        if (!fvd_deviceIsPresentInCameraList((uint64_t)v11, v8)) {
          goto LABEL_16;
        }
LABEL_15:
        [v7 addObject:v11];
        [v6 removeObjectAtIndex:v10];
LABEL_17:
        unint64_t result = [v6 count];
      }
      while (v10 < result);
    }
  }
  return result;
}

- (void)updateUserPreferredCameraHistory
{
}

- (void)updateUserPreferredCameraHistoryForKey:(id)a3
{
  BOOL v4 = (self->_specialDeviceType & 0xFFFFFFFE) == 2;
  id v5 = [(AVCaptureFigVideoDevice *)self _cameraInfo];

  +[AVCaptureProprietaryDefaultsSingleton updateCameraHistory:a3 withCameraInfo:v5 maxLength:3 updateCameraHistoryDownplayOverrideList:1 cameraCanBeInOverrideList:v4];
}

- (void)updateUserPreferredCameraOverride:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = sUserPreferredCameraOverrideHistoryKey;
  id v5 = [(AVCaptureFigVideoDevice *)self _cameraInfo];

  +[AVCaptureProprietaryDefaultsSingleton updateCameraOverrideHistory:v4 withCameraInfo:v5 setOverride:v3];
}

- (AVCaptureFigVideoDevice)init
{
  v5.receiver = self;
  v5.super_class = (Class)AVCaptureFigVideoDevice;
  id v2 = [(AVCaptureDevice *)&v5 init];
  if (v2)
  {
    BOOL v3 = v2;
    NSLog(&cfstr_Avcapturedevic_73.isa);
  }
  return 0;
}

- (id)initProxyDeviceWithUniqueID:(id)a3 targetClientAuditToken:(id *)a4
{
  if ((AVCaptureClientHasEntitlement((void *)AVCaptureEntitlementProxyDevices) & 1) == 0)
  {
    uint64_t v8 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v8);
    }
    NSLog(&cfstr_SuppressingExc.isa, v8);
    return 0;
  }
  uint64_t v5 = FigCaptureSourceRemoteCopyProxySource();
  if (!v5)
  {

    return 0;
  }
  uint64_t v6 = (const void *)v5;
  id v7 = [(AVCaptureFigVideoDevice *)self _initWithFigCaptureSource:v5 isProxy:1];
  CFRelease(v6);
  return v7;
}

- (void)dealloc
{
  [(AVCaptureFigVideoDevice *)self _setFigCaptureSource:0 allowSendingWorkToMainThread:0];
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F74230], "sharedConnection"), "unregisterObserver:", self);
  if (BYTE3(self->_degradedCaptureQualityFactors))
  {
    [(id)objc_opt_class() removeObserver:self forKeyPath:@"centerStageEnabled" context:AVCaptureFigVideoDeviceCenterStageEnabledChangedContext];
    [(id)objc_opt_class() removeObserver:self forKeyPath:@"centerStageFramingMode" context:AVCaptureFigVideoDeviceCenterStageFramingModeChangedContext];
  }
  if (BYTE1(self->_centerStageRectOfInterest.size.height))
  {
    [(id)objc_opt_class() removeObserver:self forKeyPath:@"backgroundBlurEnabled" context:AVCaptureFigVideoDeviceBackgroundBlurEnabledChangedContext];
    [(id)objc_opt_class() removeObserver:self forKeyPath:@"backgroundBlurAperture" context:AVCaptureFigVideoDeviceBackgroundBlurApertureChangedContext];
  }
  if (BYTE4(self->_centerStageRectOfInterest.size.height))
  {
    [(id)objc_opt_class() removeObserver:self forKeyPath:@"studioLightEnabled" context:AVCaptureFigVideoDeviceStudioLightingEnabledChangedContext];
    [(id)objc_opt_class() removeObserver:self forKeyPath:@"studioLightingIntensity" context:AVCaptureFigVideoDeviceStudioLightingIntensityChangedContext];
  }
  if (HIBYTE(self->_centerStageRectOfInterest.size.height))
  {
    [(id)objc_opt_class() removeObserver:self forKeyPath:@"reactionEffectsEnabled" context:AVCaptureFigVideoDeviceReactionEffectsEnabledChangedContext];
    [(id)objc_opt_class() removeObserver:self forKeyPath:@"reactionEffectGesturesEnabled" context:AVCaptureFigVideoDeviceGesturesEnabledChangedContext];
  }
  if (self->_backgroundBlurActive)
  {
    [(id)objc_opt_class() removeObserver:self forKeyPath:@"backgroundReplacementEnabled" context:AVCaptureFigVideoDeviceBackgroundReplacementEnabledChangedContext];
    [(id)objc_opt_class() removeObserver:self forKeyPath:@"backgroundReplacementPixelBuffer" context:AVCaptureFigVideoDeviceBackgroundReplacementPixelBufferChangedContext];
  }
  if (BYTE1(self->_centerStageRectOfInterest.size.height) || BYTE4(self->_centerStageRectOfInterest.size.height)) {
    [(id)objc_opt_class() removeObserver:self forKeyPath:@"portraitEffectStudioLightQuality" context:AVCaptureFigVideoDevicePortraitEffectStudioLightQualityChangedContext];
  }

  if (*(void *)&self->_adjustingWB)
  {
    unint64_t v3 = 0;
    do
      free(*(void **)&self->_wbCalibrationTemperatures[v3++]);
    while (*(void *)&self->_adjustingWB > v3);
  }
  free(self->_wbCalibrationTemperatures);
  free((void *)self->_wbCalibrationCount);
  *(void *)&self->_adjustingWB = 0;

  v4.receiver = self;
  v4.super_class = (Class)AVCaptureFigVideoDevice;
  [(AVCaptureDevice *)&v4 dealloc];
}

- (void)removeObserver:(id)a3 forKeyPath:(id)a4 context:(void *)a5
{
  [(AVCaptureFigVideoDevice *)self _decrementObserverCountForHighFrequencyProperty:a4];
  v9.receiver = self;
  v9.super_class = (Class)AVCaptureFigVideoDevice;
  [(AVCaptureFigVideoDevice *)&v9 removeObserver:a3 forKeyPath:a4 context:a5];
}

- (void)removeObserver:(id)a3 forKeyPath:(id)a4
{
  [(AVCaptureFigVideoDevice *)self _decrementObserverCountForHighFrequencyProperty:a4];
  v7.receiver = self;
  v7.super_class = (Class)AVCaptureFigVideoDevice;
  [(AVCaptureFigVideoDevice *)&v7 removeObserver:a3 forKeyPath:a4];
}

void __75__AVCaptureFigVideoDevice__incrementObserverCountForHighFrequencyProperty___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_copyFigCaptureSourceProperty:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1112), "objectForKeyedSubscript:", *(void *)(a1 + 40)));
  if (v2)
  {
    unint64_t v3 = (void *)v2;
    if ([*(id *)(a1 + 40) isEqualToString:@"lensPosition"])
    {
      [v3 floatValue];
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = 360;
LABEL_10:
      *(_DWORD *)(v5 + v6) = v4;
      goto LABEL_11;
    }
    if ([*(id *)(a1 + 40) isEqualToString:@"exposureDuration"])
    {
      uint64_t v7 = *(void *)(a1 + 32) + 432;
      CMTimeMakeFromDictionary(&v13, (CFDictionaryRef)v3);
      long long v8 = *(_OWORD *)&v13.value;
      *(void *)(v7 + 16) = v13.epoch;
      *(_OWORD *)uint64_t v7 = v8;
      goto LABEL_11;
    }
    if ([*(id *)(a1 + 40) isEqualToString:@"ISO"])
    {
      [v3 floatValue];
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = 456;
      goto LABEL_10;
    }
    if ([*(id *)(a1 + 40) isEqualToString:@"exposureTargetOffset"])
    {
      [v3 floatValue];
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = 464;
      goto LABEL_10;
    }
    if ([*(id *)(a1 + 40) isEqualToString:@"deviceWhiteBalanceGains"])
    {
      if ([v3 length] != 12) {
        goto LABEL_11;
      }
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = 552;
    }
    else
    {
      if (![*(id *)(a1 + 40) isEqualToString:@"grayWorldDeviceWhiteBalanceGains"])
      {
        if ([*(id *)(a1 + 40) isEqualToString:@"documentSceneConfidence"])
        {
          uint64_t v11 = *(void *)(a1 + 32);
          uint64_t v12 = *(const void **)(v11 + 648);
          *(void *)(v11 + 648) = v3;
          CFRetain(v3);
          if (v12) {
            CFRelease(v12);
          }
        }
        goto LABEL_11;
      }
      if ([v3 length] != 12)
      {
LABEL_11:

        return;
      }
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = 564;
    }
    [v3 getBytes:v9 + v10 length:12];
    goto LABEL_11;
  }
}

- (void)_decrementObserverCountForHighFrequencyProperty:(id)a3
{
  hevcEncoderSettings = self->_hevcEncoderSettings;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __75__AVCaptureFigVideoDevice__decrementObserverCountForHighFrequencyProperty___block_invoke;
  v4[3] = &unk_1E5A72D70;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(&hevcEncoderSettings->super, v4);
}

void *__75__AVCaptureFigVideoDevice__decrementObserverCountForHighFrequencyProperty___block_invoke(uint64_t a1)
{
  unint64_t result = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1104), "objectForKeyedSubscript:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1112), "objectForKeyedSubscript:", *(void *)(a1 + 40)));
  if (result)
  {
    int v3 = [result intValue];
    int v4 = v3 <= 1 ? 1 : v3;
    int v5 = v4 - 1;
    unint64_t result = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1104), "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", (v4 - 1)), objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1112), "objectForKeyedSubscript:", *(void *)(a1 + 40)));
    if (!v5)
    {
      uint64_t v6 = *(void **)(a1 + 32);
      return (void *)[v6 _updateFigCaptureSourceObserverCounts];
    }
  }
  return result;
}

- (void)_updateFigCaptureSourceObserverCounts
{
  if (!_FigIsCurrentDispatchQueue())
  {
    uint64_t v5 = v2;
    LODWORD(v4) = 0;
    FigDebugAssert3();
  }
  if (-[AVCaptureFigVideoDevice lockForConfiguration:](self, "lockForConfiguration:", 0, v4, v5))
  {
    [(AVCaptureFigVideoDevice *)self _setFigCaptureSourceProperty:*MEMORY[0x1E4F520A0] withValue:self->_observedHighFrequencyPropertiesQueue];
    [(AVCaptureFigVideoDevice *)self unlockForConfiguration];
  }
}

- (BOOL)_hasKeyValueObserversForHighFrequencyProperty:(id)a3
{
  uint64_t v7 = 0;
  long long v8 = &v7;
  uint64_t v9 = 0x2020000000;
  hevcEncoderSettings = self->_hevcEncoderSettings;
  char v10 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__AVCaptureFigVideoDevice__hasKeyValueObserversForHighFrequencyProperty___block_invoke;
  block[3] = &unk_1E5A73F18;
  void block[5] = a3;
  void block[6] = &v7;
  void block[4] = self;
  dispatch_sync(&hevcEncoderSettings->super, block);
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __73__AVCaptureFigVideoDevice__hasKeyValueObserversForHighFrequencyProperty___block_invoke(void *a1)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(a1[4] + 1104), "objectForKeyedSubscript:", objc_msgSend(*(id *)(a1[4] + 1112), "objectForKeyedSubscript:", a1[5])), "intValue");
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = (int)result > 0;
  return result;
}

uint64_t __77__AVCaptureFigVideoDevice__setFigCaptureSource_allowSendingWorkToMainThread___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _drainManualControlRequestQueues];
}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  int v5 = +[AVCaptureFigVideoDevice _cameraAccessIsEnabled];
  if (*((unsigned __int8 *)&self->_torchActive + 1) != v5)
  {
    int v6 = v5;
    [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"connected"];
    devicePropsQueue = self->_devicePropsQueue;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __100__AVCaptureFigVideoDevice_profileConnectionDidReceiveEffectiveSettingsChangedNotification_userInfo___block_invoke;
    v10[3] = &unk_1E5A74028;
    v10[4] = self;
    char v11 = v6;
    dispatch_sync(devicePropsQueue, v10);
    long long v8 = &AVCaptureDeviceWasConnectedNotification;
    if (!v6) {
      long long v8 = &AVCaptureDeviceWasDisconnectedNotification;
    }
    uint64_t v9 = *v8;
    [(AVCaptureFigVideoDevice *)self didChangeValueForKey:@"connected"];
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:", v9, self);
  }
}

uint64_t __100__AVCaptureFigVideoDevice_profileConnectionDidReceiveEffectiveSettingsChangedNotification_userInfo___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 793) = *(unsigned char *)(result + 40);
  return result;
}

- (id)modelID
{
  return [(NSDictionary *)self->_fcsAttributes objectForKeyedSubscript:*MEMORY[0x1E4F51C00]];
}

- (id)manufacturer
{
  return [(NSDictionary *)self->_fcsAttributes objectForKeyedSubscript:*MEMORY[0x1E4F51BF0]];
}

+ (void)_releaseStaticResources
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (dword_1EB4C9280)
  {
    int v6 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  os_unfair_lock_lock((os_unfair_lock_t)&sCameraHistoryLock);
  if (sSystemPreferredCamera)
  {

    sSystemPreferredCamera = 0;
  }
  if (sUserPreferredCamera)
  {

    sUserPreferredCamera = 0;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&sCameraHistoryLock);
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___AVCaptureFigVideoDevice;
  objc_msgSendSuper2(&v4, sel__releaseStaticResources);
}

__n128 __102__AVCaptureFigVideoDevice__setActiveFormat_resetVideoZoomFactorAndMinMaxFrameDurations_sessionPreset___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = (__n128 *)(*(void *)(a1 + 32) + 280);
  uint64_t v2 = *(__n128 **)(*(void *)(a1 + 40) + 8);
  unint64_t v3 = v2[3].n128_u64[0];
  __n128 result = v2[2];
  *uint64_t v1 = result;
  v1[1].n128_u64[0] = v3;
  return result;
}

uint64_t __102__AVCaptureFigVideoDevice__setActiveFormat_resetVideoZoomFactorAndMinMaxFrameDurations_sessionPreset___block_invoke_4(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 1148) = 0;
  return result;
}

uint64_t __102__AVCaptureFigVideoDevice__setActiveFormat_resetVideoZoomFactorAndMinMaxFrameDurations_sessionPreset___block_invoke_5(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 1178) = 0;
  return result;
}

uint64_t __102__AVCaptureFigVideoDevice__setActiveFormat_resetVideoZoomFactorAndMinMaxFrameDurations_sessionPreset___block_invoke_6(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 1184) = *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24);
  return result;
}

uint64_t __102__AVCaptureFigVideoDevice__setActiveFormat_resetVideoZoomFactorAndMinMaxFrameDurations_sessionPreset___block_invoke_7(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 1220) = *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24);
  return result;
}

uint64_t __102__AVCaptureFigVideoDevice__setActiveFormat_resetVideoZoomFactorAndMinMaxFrameDurations_sessionPreset___block_invoke_8(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 1258) = *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24);
  return result;
}

uint64_t __102__AVCaptureFigVideoDevice__setActiveFormat_resetVideoZoomFactorAndMinMaxFrameDurations_sessionPreset___block_invoke_9(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 1261) = *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24);
  return result;
}

uint64_t __102__AVCaptureFigVideoDevice__setActiveFormat_resetVideoZoomFactorAndMinMaxFrameDurations_sessionPreset___block_invoke_10(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 1264) = *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24);
  return result;
}

uint64_t __102__AVCaptureFigVideoDevice__setActiveFormat_resetVideoZoomFactorAndMinMaxFrameDurations_sessionPreset___block_invoke_11(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 1267) = *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24);
  return result;
}

void __102__AVCaptureFigVideoDevice__setActiveFormat_resetVideoZoomFactorAndMinMaxFrameDurations_sessionPreset___block_invoke_13(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 152) = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
}

id __102__AVCaptureFigVideoDevice__setActiveFormat_resetVideoZoomFactorAndMinMaxFrameDurations_sessionPreset___block_invoke_15(uint64_t a1)
{
  id result = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  *(void *)(*(void *)(a1 + 32) + 1136) = result;
  return result;
}

- (BOOL)isContinuousZoomWithDepthSupported
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __61__AVCaptureFigVideoDevice_isContinuousZoomWithDepthSupported__block_invoke;
  v5[3] = &unk_1E5A74078;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __61__AVCaptureFigVideoDevice_isContinuousZoomWithDepthSupported__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 192);
  return result;
}

- (BOOL)isContinuousZoomWithDepthEnabled
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__AVCaptureFigVideoDevice_isContinuousZoomWithDepthEnabled__block_invoke;
  v5[3] = &unk_1E5A74078;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __59__AVCaptureFigVideoDevice_isContinuousZoomWithDepthEnabled__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 193);
  return result;
}

- (void)setContinuousZoomWithDepthEnabled:(BOOL)a3
{
  if (a3 && ![(AVCaptureFigVideoDevice *)self isContinuousZoomWithDepthSupported])
  {
    uint64_t v6 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v6);
    }
    NSLog(&cfstr_SuppressingExc.isa, v6);
  }
  else
  {
    uint64_t v13 = 0;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x2020000000;
    char v16 = 0;
    uint64_t v9 = 0;
    char v10 = &v9;
    uint64_t v11 = 0x2020000000;
    char v12 = 0;
    devicePropsQueue = self->_devicePropsQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__AVCaptureFigVideoDevice_setContinuousZoomWithDepthEnabled___block_invoke;
    block[3] = &unk_1E5A740C8;
    void block[4] = self;
    void block[5] = &v9;
    BOOL v8 = a3;
    void block[6] = &v13;
    dispatch_sync(devicePropsQueue, block);
    if (*((unsigned char *)v14 + 24)) {
      [(AVCaptureFigVideoDevice *)self _updateActiveDepthDataFormatForContinuousZoomWithDepth];
    }
    if (*((unsigned char *)v10 + 24)) {
      [(AVCaptureFigVideoDevice *)self _updateMinMaxDefaultVideoZoomFactors];
    }
    _Block_object_dispose(&v9, 8);
    _Block_object_dispose(&v13, 8);
  }
}

uint64_t __61__AVCaptureFigVideoDevice_setContinuousZoomWithDepthEnabled___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _updateContinuousZoomWithDepthActiveWithEnabled:*(unsigned __int8 *)(a1 + 56) disallowed:*(unsigned __int8 *)(*(void *)(a1 + 32) + 195) isActiveDepthDataFormatChangingOut:*(void *)(*(void *)(a1 + 48) + 8) + 24];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)_updateActiveDepthDataFormatForContinuousZoomWithDepth
{
  if (!_FigIsNotCurrentDispatchQueue())
  {
    uint64_t v6 = v2;
    LODWORD(v5) = 0;
    FigDebugAssert3();
  }
  [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"activeDepthDataFormat", v5, v6];
  devicePropsQueue = self->_devicePropsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__AVCaptureFigVideoDevice__updateActiveDepthDataFormatForContinuousZoomWithDepth__block_invoke;
  block[3] = &unk_1E5A72ED0;
  void block[4] = self;
  dispatch_sync(devicePropsQueue, block);
  [(AVCaptureFigVideoDevice *)self didChangeValueForKey:@"activeDepthDataFormat"];
}

__n128 __81__AVCaptureFigVideoDevice__updateActiveDepthDataFormatForContinuousZoomWithDepth__block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(*(void *)(a1 + 32) + 144) isContinuousZoomWithDepthEnabled])
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 144) supportedDepthDataFormats];
    uint64_t v3 = [v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v3)
    {
      uint64_t v5 = v3;
      uint64_t v6 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v17 != v6) {
            objc_enumerationMutation(v2);
          }
          BOOL v8 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if ([v8 isDefaultActiveFormat])
          {

            *(void *)(*(void *)(a1 + 32) + 152) = v8;
            uint64_t v11 = *(void *)(a1 + 32);
            char v12 = (__n128 *)(v11 + 168);
            uint64_t v13 = objc_msgSend((id)objc_msgSend(*(id *)(v11 + 152), "videoSupportedFrameRateRanges"), "lastObject");
            if (v13)
            {
              [v13 minFrameDuration];
            }
            else
            {
              __n128 v14 = 0uLL;
              unint64_t v15 = 0;
            }
            __n128 result = v14;
            v12[1].n128_u64[0] = v15;
            __n128 *v12 = v14;
            return result;
          }
        }
        uint64_t v5 = [v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
  }
  else
  {

    *(void *)(*(void *)(a1 + 32) + 152) = 0;
    uint64_t v9 = *(void *)(a1 + 32) + 168;
    uint64_t v10 = MEMORY[0x1E4F1FA48];
    __n128 result = *(__n128 *)MEMORY[0x1E4F1FA48];
    *(_OWORD *)uint64_t v9 = *MEMORY[0x1E4F1FA48];
    *(void *)(v9 + 16) = *(void *)(v10 + 16);
  }
  return result;
}

- (void)resetVideoMinFrameDurationOverrideForOwner:(id)a3
{
  devicePropsQueue = self->_devicePropsQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __70__AVCaptureFigVideoDevice_resetVideoMinFrameDurationOverrideForOwner___block_invoke;
  v4[3] = &unk_1E5A72D70;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_sync(devicePropsQueue, v4);
}

__n128 __70__AVCaptureFigVideoDevice_resetVideoMinFrameDurationOverrideForOwner___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 224) == *(void *)(a1 + 40))
  {
    uint64_t v2 = v1 + 200;
    uint64_t v3 = MEMORY[0x1E4F1F9F8];
    __n128 result = *(__n128 *)MEMORY[0x1E4F1F9F8];
    *(_OWORD *)uint64_t v2 = *MEMORY[0x1E4F1F9F8];
    *(void *)(v2 + 16) = *(void *)(v3 + 16);
  }
  return result;
}

uint64_t __67__AVCaptureFigVideoDevice__setActiveVideoMinFrameDurationInternal___block_invoke_288(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_setFigCaptureSourceProperty:withValue:cacheOnly:", *MEMORY[0x1E4F51EF8], objc_msgSend(NSNumber, "numberWithDouble:", (double)*(int *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)/ (double)*(uint64_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 32)), *(unsigned __int8 *)(*(void *)(a1 + 32) + 328));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    uint64_t v3 = *(void *)(a1 + 32) + 232;
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v5 = *(void *)(v4 + 48);
    *(_OWORD *)uint64_t v3 = *(_OWORD *)(v4 + 32);
    *(void *)(v3 + 16) = v5;
    if (dword_1EB4C9280)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      uint64_t result = fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  if (*(void *)(*(void *)(a1 + 32) + 424) == 3)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 712);
    *(_OWORD *)(v7 + 32) = *(_OWORD *)(*(void *)(a1 + 32) + 696);
    *(void *)(v7 + 48) = v8;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = *(_DWORD *)(*(void *)(a1 + 32) + 720);
  }
  return result;
}

__n128 __58__AVCaptureFigVideoDevice_setActiveVideoMinFrameDuration___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (__n128 *)(*(void *)(a1 + 32) + 256);
  if (*(unsigned char *)(a1 + 60))
  {
    uint64_t v5 = *(__n128 **)(*(void *)(a1 + 40) + 8);
    __n128 result = v5[2];
    *(void *)(*(void *)(a1 + 32) + 272) = v5[3].n128_u64[0];
    *uint64_t v2 = result;
  }
  else
  {
    uint64_t v3 = MEMORY[0x1E4F1F9F8];
    __n128 result = *(__n128 *)MEMORY[0x1E4F1F9F8];
    *uint64_t v2 = *(__n128 *)MEMORY[0x1E4F1F9F8];
    v2[1].n128_u64[0] = *(void *)(v3 + 16);
  }
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = (long long *)(v6 + 256);
  if (*(unsigned char *)(v6 + 268))
  {
    uint64_t v8 = (long long *)(v6 + 304);
    if (*((unsigned char *)v8 + 12))
    {
      long long v9 = *v8;
      time1.epoch = *((void *)v8 + 2);
      *(_OWORD *)&time1.CMTimeValue value = v9;
      long long v10 = *v7;
      v13.epoch = *((void *)v7 + 2);
      *(_OWORD *)&v13.CMTimeValue value = v10;
      if (CMTimeCompare(&time1, &v13) < 0)
      {
        uint64_t v11 = *(__n128 **)(a1 + 32);
        char v12 = v11 + 19;
        v11 += 16;
        __n128 result = *v11;
        v12[1].n128_u64[0] = v11[1].n128_u64[0];
        __n128 *v12 = result;
      }
    }
  }
  return result;
}

uint64_t __67__AVCaptureFigVideoDevice__setActiveVideoMaxFrameDurationInternal___block_invoke_301(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_setFigCaptureSourceProperty:withValue:cacheOnly:", *MEMORY[0x1E4F51F00], objc_msgSend(NSNumber, "numberWithDouble:", (double)*(int *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)/ (double)*(uint64_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 32)), *(unsigned __int8 *)(*(void *)(a1 + 32) + 328));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    uint64_t v3 = *(void *)(a1 + 32) + 280;
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v5 = *(void *)(v4 + 48);
    *(_OWORD *)uint64_t v3 = *(_OWORD *)(v4 + 32);
    *(void *)(v3 + 16) = v5;
    if (dword_1EB4C9280)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      uint64_t result = fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  if (*(void *)(*(void *)(a1 + 32) + 424) == 3)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 712);
    *(_OWORD *)(v7 + 32) = *(_OWORD *)(*(void *)(a1 + 32) + 696);
    *(void *)(v7 + 48) = v8;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = *(_DWORD *)(*(void *)(a1 + 32) + 720);
    CMTime time1 = *(CMTime *)(*(void *)(*(void *)(a1 + 64) + 8) + 32);
    memset(&time2, 0, sizeof(time2));
    uint64_t result = CMTimeCompare(&time1, &time2);
    if (result)
    {
      uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
      long long v10 = *(_OWORD *)(*(void *)(a1 + 32) + 280);
      time1.epoch = *(void *)(*(void *)(a1 + 32) + 296);
      *(_OWORD *)&time1.CMTimeValue value = v10;
      CMTime time2 = *(CMTime *)(v9 + 32);
      uint64_t result = CMTimeCompare(&time1, &time2);
      if ((result & 0x80000000) != 0)
      {
        uint64_t v11 = *(void *)(*(void *)(a1 + 64) + 8);
        long long v12 = *(_OWORD *)(*(void *)(a1 + 32) + 280);
        *(void *)(v11 + 48) = *(void *)(*(void *)(a1 + 32) + 296);
        *(_OWORD *)(v11 + 32) = v12;
      }
    }
  }
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)activeVideoMinFrameDurationSetByClient
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3810000000;
  long long v10 = &unk_1A165D1D9;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__AVCaptureFigVideoDevice_activeVideoMinFrameDurationSetByClient__block_invoke;
  block[3] = &unk_1E5A74078;
  void block[4] = self;
  void block[5] = &v7;
  dispatch_sync(devicePropsQueue, block);
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)(v8 + 4);
  _Block_object_dispose(&v7, 8);
  return result;
}

__n128 __65__AVCaptureFigVideoDevice_activeVideoMinFrameDurationSetByClient__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(__n128 **)(*(void *)(a1 + 40) + 8);
  uint64_t v2 = (__n128 *)(*(void *)(a1 + 32) + 256);
  unint64_t v3 = *(void *)(*(void *)(a1 + 32) + 272);
  __n128 result = *v2;
  v1[2] = *v2;
  v1[3].n128_u64[0] = v3;
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)activeVideoMaxFrameDurationSetByClient
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3810000000;
  long long v10 = &unk_1A165D1D9;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__AVCaptureFigVideoDevice_activeVideoMaxFrameDurationSetByClient__block_invoke;
  block[3] = &unk_1E5A74078;
  void block[4] = self;
  void block[5] = &v7;
  dispatch_sync(devicePropsQueue, block);
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)(v8 + 4);
  _Block_object_dispose(&v7, 8);
  return result;
}

__n128 __65__AVCaptureFigVideoDevice_activeVideoMaxFrameDurationSetByClient__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(__n128 **)(*(void *)(a1 + 40) + 8);
  uint64_t v2 = (__n128 *)(*(void *)(a1 + 32) + 304);
  unint64_t v3 = *(void *)(*(void *)(a1 + 32) + 320);
  __n128 result = *v2;
  v1[2] = *v2;
  v1[3].n128_u64[0] = v3;
  return result;
}

- (BOOL)cachesFigCaptureSourceConfigurationChanges
{
  return self->_cachesFigCaptureSourceConfigurationChanges;
}

- (BOOL)supportsMultiCamCaptureWithDevice:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  int64_t v5 = [(AVCaptureFigVideoDevice *)self position];
  if (v5 != [a3 position]) {
    return 1;
  }
  int v6 = (objc_msgSend(-[AVCaptureFigVideoDevice deviceType](self, "deviceType"), "isEqualToString:", @"AVCaptureDeviceTypeBuiltInLiDARDepthCamera") & 1) != 0? 1: objc_msgSend((id)objc_msgSend(a3, "deviceType"), "isEqualToString:", @"AVCaptureDeviceTypeBuiltInLiDARDepthCamera");
  int v7 = (objc_msgSend(-[AVCaptureFigVideoDevice deviceType](self, "deviceType"), "isEqualToString:", @"AVCaptureDeviceTypeDeskViewCamera") & 1) != 0? 1: objc_msgSend((id)objc_msgSend(a3, "deviceType"), "isEqualToString:", @"AVCaptureDeviceTypeDeskViewCamera");
  BOOL v8 = [(AVCaptureDevice *)self isVirtualDevice];
  if (((v8 ^ [a3 isVirtualDevice] ^ 1 | v6) & 1) == 0 && !v7) {
    return 0;
  }
  if ([(AVCaptureFigVideoDevice *)self position] == 2
    && ([(AVCaptureFigVideoDevice *)self deviceType] == @"AVCaptureDeviceTypeBuiltInWideAngleCamera"
     && (__CFString *)[a3 deviceType] == @"AVCaptureDeviceTypeBuiltInUltraWideCamera"
     || [(AVCaptureFigVideoDevice *)self deviceType] == @"AVCaptureDeviceTypeBuiltInUltraWideCamera"
     && (__CFString *)[a3 deviceType] == @"AVCaptureDeviceTypeBuiltInWideAngleCamera"))
  {
    return 0;
  }
  uint64_t v9 = [(AVCaptureDevice *)self constituentDevices];
  if (![(NSArray *)v9 count])
  {
    v14[0] = self;
    uint64_t v9 = (NSArray *)[MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  }
  long long v10 = (void *)[a3 constituentDevices];
  if (![v10 count])
  {
    id v13 = a3;
    long long v10 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
  }
  uint64_t v11 = (void *)[MEMORY[0x1E4F1CA80] setWithArray:v9];
  objc_msgSend(v11, "intersectSet:", objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", v10));
  return ![v11 count]
      && [(AVCaptureFigVideoDevice *)self deviceType] != @"AVCaptureDeviceTypeBuiltInInfraredMetadataCamera"
      && (__CFString *)[a3 deviceType] != @"AVCaptureDeviceTypeBuiltInWideAngleMetadataCamera"
      && (__CFString *)[a3 deviceType] != @"AVCaptureDeviceTypeBuiltInUltraWideAngleMetadataCamera";
}

- (id)constituentDeviceWithDeviceType:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [(AVCaptureDevice *)self constituentDevices];
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(v4);
    }
    uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if ((id)[v9 deviceType] == a3) {
      return v9;
    }
    if (v6 == ++v8)
    {
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (BOOL)isConstituentPhotoCalibrationDataSupported
{
  id v2 = [(NSDictionary *)self->_fcsAttributes objectForKeyedSubscript:*MEMORY[0x1E4F51B28]];

  return [v2 BOOLValue];
}

- (int)powerConsumptionAt30FPSForOISMode:(int)a3
{
  if ((a3 - 1) > 2) {
    return 0;
  }
  id v5 = -[NSDictionary objectForKeyedSubscript:](self->_fcsAttributes, "objectForKeyedSubscript:", **((void **)&unk_1E5A74818 + a3 - 1), v3);
  return [v5 intValue];
}

- (void)setLowLightVideoCaptureEnabled:(BOOL)a3
{
  if ([(AVCaptureFigVideoDevice *)self isLockedForConfiguration])
  {
    if (objc_msgSend(-[AVCaptureFigVideoDevice activeFormat](self, "activeFormat"), "isLowLightVideoCaptureSupported"))
    {
      devicePropsQueue = self->_devicePropsQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __58__AVCaptureFigVideoDevice_setLowLightVideoCaptureEnabled___block_invoke;
      block[3] = &unk_1E5A74028;
      void block[4] = self;
      BOOL v10 = a3;
      dispatch_sync(devicePropsQueue, block);
      return;
    }
    uint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
    objc_opt_class();
  }
  else
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3A8];
    objc_opt_class();
  }
  uint64_t v8 = (void *)[v6 exceptionWithName:v7 reason:AVMethodExceptionReasonWithClassAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v8);
  }
  NSLog(&cfstr_SuppressingExc.isa, v8);
}

uint64_t __58__AVCaptureFigVideoDevice_setLowLightVideoCaptureEnabled___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 1148) = *(unsigned char *)(result + 40);
  return result;
}

- (void)setVariableFrameRateVideoCaptureEnabled:(BOOL)a3
{
  if ([(AVCaptureFigVideoDevice *)self isLockedForConfiguration])
  {
    if (objc_msgSend(-[AVCaptureFigVideoDevice activeFormat](self, "activeFormat"), "isVariableFrameRateVideoCaptureSupported"))
    {
      devicePropsQueue = self->_devicePropsQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __67__AVCaptureFigVideoDevice_setVariableFrameRateVideoCaptureEnabled___block_invoke;
      block[3] = &unk_1E5A74028;
      void block[4] = self;
      BOOL v10 = a3;
      dispatch_sync(devicePropsQueue, block);
      return;
    }
    uint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
    objc_opt_class();
  }
  else
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3A8];
    objc_opt_class();
  }
  uint64_t v8 = (void *)[v6 exceptionWithName:v7 reason:AVMethodExceptionReasonWithClassAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v8);
  }
  NSLog(&cfstr_SuppressingExc.isa, v8);
}

uint64_t __67__AVCaptureFigVideoDevice_setVariableFrameRateVideoCaptureEnabled___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 1178) = *(unsigned char *)(result + 40);
  return result;
}

- (void)setAutoVideoFrameRateEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if (objc_msgSend(-[AVCaptureFigVideoDevice activeFormat](self, "activeFormat"), "isAutoVideoFrameRateSupported"))
  {
    if (objc_msgSend(-[AVCaptureFigVideoDevice activeFormat](self, "activeFormat"), "isVariableFrameRateVideoCaptureSupported"))
    {
      [(AVCaptureFigVideoDevice *)self setVariableFrameRateVideoCaptureEnabled:v3];
    }
    else if (objc_msgSend(-[AVCaptureFigVideoDevice activeFormat](self, "activeFormat"), "isLowLightVideoCaptureSupported"))
    {
      [(AVCaptureFigVideoDevice *)self setLowLightVideoCaptureEnabled:v3];
    }
  }
  else
  {
    id v5 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v6 = *MEMORY[0x1E4F1C3C8];
    objc_opt_class();
    uint64_t v7 = (void *)[v5 exceptionWithName:v6 reason:AVMethodExceptionReasonWithClassAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v7);
    }
    NSLog(&cfstr_SuppressingExc.isa, v7);
  }
}

- (void)setVideoStabilizationStrength:(int64_t)a3
{
  if ([(AVCaptureFigVideoDevice *)self isLockedForConfiguration])
  {
    if (objc_msgSend(-[AVCaptureFigVideoDevice activeFormat](self, "activeFormat"), "isVideoStabilizationStrengthSupported:", a3))
    {
      devicePropsQueue = self->_devicePropsQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __57__AVCaptureFigVideoDevice_setVideoStabilizationStrength___block_invoke;
      block[3] = &unk_1E5A72F98;
      void block[4] = self;
      void block[5] = a3;
      dispatch_sync(devicePropsQueue, block);
      return;
    }
    uint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
    objc_opt_class();
  }
  else
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3A8];
    objc_opt_class();
  }
  uint64_t v8 = (void *)[v6 exceptionWithName:v7 reason:AVMethodExceptionReasonWithClassAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v8);
  }
  NSLog(&cfstr_SuppressingExc.isa, v8);
}

uint64_t __57__AVCaptureFigVideoDevice_setVideoStabilizationStrength___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 1184) = *(void *)(result + 40);
  return result;
}

- (BOOL)isStabilizationAutoSelectionCinematicExtendedEnhancedEnabled
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_fcsAttributes, "objectForKeyedSubscript:", *MEMORY[0x1E4F51C90]), "BOOLValue") ^ 1;
}

- (int64_t)digitalFlashMode
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__AVCaptureFigVideoDevice_digitalFlashMode__block_invoke;
  v5[3] = &unk_1E5A74078;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __43__AVCaptureFigVideoDevice_digitalFlashMode__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 752);
  return result;
}

- (void)_setConnected:(BOOL)a3
{
  BOOL v4 = a3
    && +[AVCaptureFigVideoDevice _cameraAccessIsEnabled];
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  devicePropsQueue = self->_devicePropsQueue;
  char v9 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__AVCaptureFigVideoDevice__setConnected___block_invoke;
  block[3] = &unk_1E5A74208;
  void block[4] = self;
  void block[5] = v8;
  BOOL v7 = v4;
  dispatch_sync(devicePropsQueue, block);
  _Block_object_dispose(v8, 8);
}

uint64_t __41__AVCaptureFigVideoDevice__setConnected___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned __int8 *)(*(void *)(result + 32) + 793) != *(unsigned __int8 *)(result + 48);
  if (*(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24)) {
    *(unsigned char *)(*(void *)(result + 32) + 793) = *(unsigned char *)(result + 48);
  }
  return result;
}

- (BOOL)isHidden
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__AVCaptureFigVideoDevice_isHidden__block_invoke;
  v5[3] = &unk_1E5A74078;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __35__AVCaptureFigVideoDevice_isHidden__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 795);
  return result;
}

- (BOOL)isReadyToUnhide
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__AVCaptureFigVideoDevice_isReadyToUnhide__block_invoke;
  v5[3] = &unk_1E5A74078;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __42__AVCaptureFigVideoDevice_isReadyToUnhide__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 796);
  return result;
}

- (void)unhide
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__AVCaptureFigVideoDevice_unhide__block_invoke;
  block[3] = &unk_1E5A74078;
  void block[4] = self;
  void block[5] = &v7;
  dispatch_sync(devicePropsQueue, block);
  if (*((unsigned char *)v8 + 24))
  {
    [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"hidden"];
    BOOL v4 = self->_devicePropsQueue;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __33__AVCaptureFigVideoDevice_unhide__block_invoke_2;
    v5[3] = &unk_1E5A72ED0;
    v5[4] = self;
    dispatch_sync(v4, v5);
    [(AVCaptureFigVideoDevice *)self didChangeValueForKey:@"hidden"];
  }
  _Block_object_dispose(&v7, 8);
}

uint64_t __33__AVCaptureFigVideoDevice_unhide__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 795);
  return result;
}

uint64_t __33__AVCaptureFigVideoDevice_unhide__block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _setFigCaptureSourceProperty:*MEMORY[0x1E4F52068] withValue:MEMORY[0x1E4F1CC28]];
  if (!result) {
    *(unsigned char *)(*(void *)(a1 + 32) + 795) = 0;
  }
  return result;
}

- (void)_setAdjustingFocus:(BOOL)a3
{
  devicePropsQueue = self->_devicePropsQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__AVCaptureFigVideoDevice__setAdjustingFocus___block_invoke;
  v4[3] = &unk_1E5A74028;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(devicePropsQueue, v4);
}

uint64_t __46__AVCaptureFigVideoDevice__setAdjustingFocus___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 364) = *(unsigned char *)(result + 40);
  return result;
}

- (int64_t)autoFocusRangeRestriction
{
  return self->_autoFocusRangeRestriction;
}

- (void)setAutoFocusRangeRestriction:(int64_t)a3
{
  if ([(AVCaptureFigVideoDevice *)self isLockedForConfiguration])
  {
    if ([(AVCaptureFigVideoDevice *)self isAutoFocusRangeRestrictionSupported])
    {
      self->_autoFocusRangeRestriction = a3;
      return;
    }
    BOOL v5 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v6 = *MEMORY[0x1E4F1C3C8];
    objc_opt_class();
  }
  else
  {
    BOOL v5 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v6 = *MEMORY[0x1E4F1C3A8];
    objc_opt_class();
  }
  uint64_t v7 = (void *)[v5 exceptionWithName:v6 reason:AVMethodExceptionReasonWithClassAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v7);
  }
  NSLog(&cfstr_SuppressingExc.isa, v7);
}

- (float)lensPosition
{
  uint64_t v10 = 0;
  long long v11 = (float *)&v10;
  uint64_t v12 = 0x2020000000;
  int v13 = -1082130432;
  if ([(AVCaptureFigVideoDevice *)self _hasKeyValueObserversForHighFrequencyProperty:@"lensPosition"])
  {
    devicePropsQueue = self->_devicePropsQueue;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __39__AVCaptureFigVideoDevice_lensPosition__block_invoke;
    v9[3] = &unk_1E5A74078;
    void v9[4] = self;
    v9[5] = &v10;
    dispatch_sync(devicePropsQueue, v9);
  }
  float v4 = v11[6];
  if (v4 == -1.0)
  {
    id v5 = [(AVCaptureFigVideoDevice *)self _copyFigCaptureSourceProperty:*MEMORY[0x1E4F52038]];
    uint64_t v6 = v5;
    if (v5)
    {
      [v5 floatValue];
      *((_DWORD *)v11 + 6) = v7;

      float v4 = v11[6];
    }
    else
    {
      v11[6] = 1.0;
      float v4 = 1.0;
    }
  }
  _Block_object_dispose(&v10, 8);
  return v4;
}

float __39__AVCaptureFigVideoDevice_lensPosition__block_invoke(uint64_t a1)
{
  float result = *(float *)(*(void *)(a1 + 32) + 360);
  *(float *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)isLockingFocusWithCustomLensPositionSupported
{
  id v2 = [(NSDictionary *)self->_fcsAttributes objectForKeyedSubscript:*MEMORY[0x1E4F51BE0]];

  return [v2 BOOLValue];
}

- (void)setFocusModeLockedWithLensPosition:(float)a3 completionHandler:(id)a4
{
  if (![(AVCaptureFigVideoDevice *)self isFocusModeSupported:0]) {
    goto LABEL_11;
  }
  LODWORD(v7) = 2139095039;
  if (a3 == 3.4028e38)
  {
LABEL_6:
    uint64_t v24 = 0;
    long long v25 = &v24;
    uint64_t v26 = 0x2020000000;
    int v27 = 0;
    uint64_t v20 = 0;
    uint64_t v21 = &v20;
    uint64_t v22 = 0x2020000000;
    devicePropsQueue = self->_devicePropsQueue;
    char v23 = 0;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __80__AVCaptureFigVideoDevice_setFocusModeLockedWithLensPosition_completionHandler___block_invoke;
    block[3] = &unk_1E5A74230;
    void block[4] = self;
    void block[5] = &v20;
    void block[6] = 0;
    dispatch_sync(devicePropsQueue, block);
    if (*((unsigned char *)v21 + 24)) {
      [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"focusMode"];
    }
    uint64_t v9 = self->_devicePropsQueue;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __80__AVCaptureFigVideoDevice_setFocusModeLockedWithLensPosition_completionHandler___block_invoke_2;
    v17[3] = &unk_1E5A74258;
    void v17[4] = self;
    void v17[5] = a4;
    void v17[6] = &v24;
    v17[7] = 0;
    float v18 = a3;
    dispatch_sync(v9, v17);
    int v10 = *((_DWORD *)v25 + 6);
    if (v10 == -16452)
    {
      long long v11 = (void *)MEMORY[0x1E4F1CA00];
      objc_opt_class();
      uint64_t v12 = (void *)[v11 exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:AVMethodExceptionReasonWithClassAndSelector() userInfo:0];
      if (AVCaptureShouldThrowForAPIViolations()) {
        objc_exception_throw(v12);
      }
      NSLog(&cfstr_SuppressingExc.isa, v12);
    }
    else
    {
      if (*((unsigned char *)v21 + 24))
      {
        [(AVCaptureFigVideoDevice *)self didChangeValueForKey:@"focusMode"];
        int v10 = *((_DWORD *)v25 + 6);
      }
      if (v10)
      {
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __80__AVCaptureFigVideoDevice_setFocusModeLockedWithLensPosition_completionHandler___block_invoke_3;
        v16[3] = &unk_1E5A72ED0;
        void v16[4] = self;
        [(AVCaptureFigVideoDevice *)self _performBlockOnMainThread:v16];
      }
    }
    _Block_object_dispose(&v20, 8);
    _Block_object_dispose(&v24, 8);
    return;
  }
  if ([(AVCaptureFigVideoDevice *)self isLockingFocusWithCustomLensPositionSupported])
  {
    if (a3 >= 0.0 && a3 <= 1.0) {
      goto LABEL_6;
    }
    int v13 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v14 = *MEMORY[0x1E4F1C4A8];
    objc_opt_class();
  }
  else
  {
LABEL_11:
    int v13 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v14 = *MEMORY[0x1E4F1C3C8];
    objc_opt_class();
  }
  uint64_t v15 = (void *)[v13 exceptionWithName:v14 reason:AVMethodExceptionReasonWithClassAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v15);
  }
  NSLog(&cfstr_SuppressingExc.isa, v15);
}

void *__80__AVCaptureFigVideoDevice_setFocusModeLockedWithLensPosition_completionHandler___block_invoke(void *result)
{
  *(unsigned char *)(*(void *)(result[5] + 8) + 24) = *(void *)(result[4] + 336) != result[6];
  return result;
}

uint64_t __80__AVCaptureFigVideoDevice_setFocusModeLockedWithLensPosition_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = +[AVCaptureDeviceControlRequest deviceControlRequestWithCompletionBlock:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 664) enqueueRequest:v2];
  char v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 56);
  int v5 = *(_DWORD *)(a1 + 64);
  uint64_t v6 = [(AVCaptureDeviceControlRequest *)v2 requestID];
  LODWORD(v7) = v5;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v3 _setFocusWithMode:v4 lensPosition:v6 requestID:v7];
  uint64_t result = [(AVCaptureDeviceControlRequest *)v2 setErrorCode:*(unsigned int *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
  if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    *(void *)(*(void *)(a1 + 32) + 336) = *(void *)(a1 + 56);
  }
  return result;
}

uint64_t __80__AVCaptureFigVideoDevice_setFocusModeLockedWithLensPosition_completionHandler___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleManualControlCompletionForRequestQueue:*(void *)(*(void *)(a1 + 32) + 664) withPayload:0];
}

- (BOOL)isSmoothAutoFocusEnabled
{
  return self->_smoothAutoFocusEnabled;
}

- (void)setSmoothAutoFocusEnabled:(BOOL)a3
{
  if ([(AVCaptureFigVideoDevice *)self isLockedForConfiguration])
  {
    if ([(AVCaptureFigVideoDevice *)self isSmoothAutoFocusSupported])
    {
      self->_smoothAutoFocusEnabled = a3;
      return;
    }
    int v5 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v6 = *MEMORY[0x1E4F1C3C8];
    objc_opt_class();
  }
  else
  {
    int v5 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v6 = *MEMORY[0x1E4F1C3A8];
    objc_opt_class();
  }
  double v7 = (void *)[v5 exceptionWithName:v6 reason:AVMethodExceptionReasonWithClassAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v7);
  }
  NSLog(&cfstr_SuppressingExc.isa, v7);
}

- (BOOL)automaticallyAdjustsFaceDrivenAutoFocusEnabled
{
  uint64_t v6 = 0;
  double v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __73__AVCaptureFigVideoDevice_automaticallyAdjustsFaceDrivenAutoFocusEnabled__block_invoke;
  v5[3] = &unk_1E5A74078;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __73__AVCaptureFigVideoDevice_automaticallyAdjustsFaceDrivenAutoFocusEnabled__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 377);
  return result;
}

- (void)setAutomaticallyAdjustsFaceDrivenAutoFocusEnabled:(BOOL)a3
{
  if ([(AVCaptureFigVideoDevice *)self isLockedForConfiguration])
  {
    if ([(AVCaptureFigVideoDevice *)self isFocusModeSupported:2])
    {
      devicePropsQueue = self->_devicePropsQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __77__AVCaptureFigVideoDevice_setAutomaticallyAdjustsFaceDrivenAutoFocusEnabled___block_invoke;
      block[3] = &unk_1E5A74028;
      void block[4] = self;
      BOOL v10 = a3;
      dispatch_sync(devicePropsQueue, block);
      return;
    }
    uint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
    objc_opt_class();
  }
  else
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3A8];
    objc_opt_class();
  }
  uint64_t v8 = (void *)[v6 exceptionWithName:v7 reason:AVMethodExceptionReasonWithClassAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v8);
  }
  NSLog(&cfstr_SuppressingExc.isa, v8);
}

uint64_t __77__AVCaptureFigVideoDevice_setAutomaticallyAdjustsFaceDrivenAutoFocusEnabled___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 377) = *(unsigned char *)(result + 40);
  return result;
}

- (BOOL)isFaceDrivenAutoFocusEnabled
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__AVCaptureFigVideoDevice_isFaceDrivenAutoFocusEnabled__block_invoke;
  v5[3] = &unk_1E5A74078;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __55__AVCaptureFigVideoDevice_isFaceDrivenAutoFocusEnabled__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = (*(_DWORD *)(*(void *)(result + 32) + 800) & 0xFFFFFFFE) == 2;
  return result;
}

- (void)setFaceDrivenAutoFocusEnabled:(BOOL)a3
{
  if ([(AVCaptureFigVideoDevice *)self isLockedForConfiguration])
  {
    if ([(AVCaptureFigVideoDevice *)self isFocusModeSupported:2]
      && ![(AVCaptureFigVideoDevice *)self automaticallyAdjustsFaceDrivenAutoFocusEnabled])
    {
      devicePropsQueue = self->_devicePropsQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __57__AVCaptureFigVideoDevice_setFaceDrivenAutoFocusEnabled___block_invoke;
      block[3] = &unk_1E5A74028;
      BOOL v10 = a3;
      void block[4] = self;
      dispatch_sync(devicePropsQueue, block);
      return;
    }
    int v5 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v6 = *MEMORY[0x1E4F1C3C8];
    objc_opt_class();
  }
  else
  {
    int v5 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v6 = *MEMORY[0x1E4F1C3A8];
    objc_opt_class();
  }
  uint64_t v7 = (void *)[v5 exceptionWithName:v6 reason:AVMethodExceptionReasonWithClassAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v7);
  }
  NSLog(&cfstr_SuppressingExc.isa, v7);
}

uint64_t __57__AVCaptureFigVideoDevice_setFaceDrivenAutoFocusEnabled___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if ((*(_DWORD *)(v1 + 800) & 0xFFFFFFFD) == 1) {
    int v2 = 3;
  }
  else {
    int v2 = 2;
  }
  if (*(unsigned char *)(result + 40)) {
    BOOL v3 = v2;
  }
  else {
    BOOL v3 = (*(_DWORD *)(v1 + 800) & 0xFFFFFFFD) == 1;
  }
  *(_DWORD *)(v1 + 800) = v3;
  return result;
}

- (float)focalLength
{
  id v2 = [(NSDictionary *)self->_fcsAttributes objectForKeyedSubscript:*MEMORY[0x1E4F51B88]];

  [v2 floatValue];
  return result;
}

- (float)lensAperture
{
  id v2 = [(NSDictionary *)self->_fcsAttributes objectForKeyedSubscript:*MEMORY[0x1E4F51BD0]];

  [v2 floatValue];
  return result;
}

uint64_t __43__AVCaptureFigVideoDevice_setExposureMode___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleManualControlCompletionForRequestQueue:*(void *)(*(void *)(a1 + 32) + 672) withPayload:0];
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)exposureDuration
{
  uint64_t v17 = 0;
  float v18 = &v17;
  uint64_t v19 = 0x3810000000;
  uint64_t v20 = &unk_1A165D1D9;
  uint64_t v22 = 0;
  long long v21 = xmmword_1A1636A40;
  if ([(AVCaptureFigVideoDevice *)self _hasKeyValueObserversForHighFrequencyProperty:@"exposureDuration"])
  {
    devicePropsQueue = self->_devicePropsQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __43__AVCaptureFigVideoDevice_exposureDuration__block_invoke;
    block[3] = &unk_1E5A74078;
    void block[4] = self;
    void block[5] = &v17;
    dispatch_sync(devicePropsQueue, block);
  }
  CMTime time1 = *(CMTime *)(v18 + 4);
  *(_OWORD *)&time2.CMTimeValue value = xmmword_1A1636A40;
  time2.epoch = 0;
  if (!CMTimeCompare(&time1, &time2))
  {
    id v6 = [(AVCaptureFigVideoDevice *)self _copyFigCaptureSourceProperty:*MEMORY[0x1E4F51FF0]];
    uint64_t v7 = v6;
    if (v6)
    {
      CMTimeMakeFromDictionary(&v13, (CFDictionaryRef)v6);
      *(CMTime *)(v18 + 4) = v13;
    }
    else
    {
      if (self)
      {
        [(AVCaptureFigVideoDevice *)self activeVideoMinFrameDuration];
      }
      else
      {
        long long v11 = 0uLL;
        uint64_t v12 = 0;
      }
      uint64_t v8 = v18;
      *((_OWORD *)v18 + 2) = v11;
      void v8[6] = v12;
    }
  }
  char v9 = v18;
  *(_OWORD *)&retstr->var0 = *((_OWORD *)v18 + 2);
  retstr->int64_t var3 = v9[6];
  _Block_object_dispose(&v17, 8);
  return result;
}

__n128 __43__AVCaptureFigVideoDevice_exposureDuration__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(__n128 **)(*(void *)(a1 + 40) + 8);
  id v2 = (__n128 *)(*(void *)(a1 + 32) + 432);
  unint64_t v3 = *(void *)(*(void *)(a1 + 32) + 448);
  __n128 result = *v2;
  v1[2] = *v2;
  v1[3].n128_u64[0] = v3;
  return result;
}

- (float)ISODigitalThreshold
{
  return 2800.0;
}

- (float)ISO
{
  uint64_t v10 = 0;
  long long v11 = (float *)&v10;
  uint64_t v12 = 0x2020000000;
  int v13 = -1082130432;
  if ([(AVCaptureFigVideoDevice *)self _hasKeyValueObserversForHighFrequencyProperty:@"ISO"])
  {
    devicePropsQueue = self->_devicePropsQueue;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __30__AVCaptureFigVideoDevice_ISO__block_invoke;
    v9[3] = &unk_1E5A74078;
    void v9[4] = self;
    v9[5] = &v10;
    dispatch_sync(devicePropsQueue, v9);
  }
  float v4 = v11[6];
  if (v4 == -1.0)
  {
    id v5 = [(AVCaptureFigVideoDevice *)self _copyFigCaptureSourceProperty:*MEMORY[0x1E4F52070]];
    id v6 = v5;
    if (v5)
    {
      [v5 floatValue];
      *((_DWORD *)v11 + 6) = v7;

      float v4 = v11[6];
    }
    else
    {
      v11[6] = 50.0;
      float v4 = 50.0;
    }
  }
  _Block_object_dispose(&v10, 8);
  return v4;
}

float __30__AVCaptureFigVideoDevice_ISO__block_invoke(uint64_t a1)
{
  float result = *(float *)(*(void *)(a1 + 32) + 456);
  *(float *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setExposureModeCustomWithDuration:(id *)a3 ISO:(float)a4 completionHandler:(id)a5
{
  if (![(AVCaptureFigVideoDevice *)self isExposureModeSupported:3])
  {
    long long v11 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v12 = *MEMORY[0x1E4F1C3C8];
    objc_opt_class();
LABEL_6:
    uint64_t v13 = AVMethodExceptionReasonWithClassAndSelector();
    uint64_t v14 = v11;
    uint64_t v15 = v12;
LABEL_14:
    float v18 = objc_msgSend(v14, "exceptionWithName:reason:userInfo:", v15, v13, 0, *(void *)&v27, var1);
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v18);
    }
    NSLog(&cfstr_SuppressingExc.isa, v18);
    return;
  }
  id v9 = [(AVCaptureFigVideoDevice *)self activeFormat];
  CMTime time1 = (CMTime)*a3;
  memset(&time2, 0, sizeof(time2));
  if (CMTimeCompare(&time1, &time2))
  {
    if (v9) {
      [v9 minExposureDuration];
    }
    else {
      memset(&v48, 0, sizeof(v48));
    }
    CMTime time1 = (CMTime)*a3;
    if (CMTimeCompare(&time1, &v48) < 0) {
      goto LABEL_13;
    }
    if (v9) {
      [v9 maxExposureDuration];
    }
    else {
      memset(&v47, 0, sizeof(v47));
    }
    CMTime time1 = (CMTime)*a3;
    if (CMTimeCompare(&time1, &v47) >= 1)
    {
LABEL_13:
      uint64_t v16 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v17 = *MEMORY[0x1E4F1C4A8];
      objc_opt_class();
      double v27 = *(double *)&a3->var0;
      uint64_t var1 = a3->var1;
      uint64_t v13 = AVMethodExceptionReasonWithClassAndSelector();
      uint64_t v14 = v16;
      uint64_t v15 = v17;
      goto LABEL_14;
    }
  }
  LODWORD(v10) = 2139095039;
  if (a4 != 3.4028e38)
  {
    objc_msgSend(v9, "minISO", v10);
    if (v19 > a4 || ([v9 maxISO], v20 < a4))
    {
      long long v11 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v12 = *MEMORY[0x1E4F1C4A8];
      objc_opt_class();
      double v27 = a4;
      goto LABEL_6;
    }
  }
  time2.CMTimeValue value = 0;
  *(void *)&time2.CMTimeScale timescale = &time2;
  time2.epoch = 0x2020000000;
  int v46 = 0;
  uint64_t v41 = 0;
  CMTime v42 = &v41;
  uint64_t v43 = 0x2020000000;
  char v44 = 0;
  time1.CMTimeValue value = 0;
  *(void *)&time1.CMTimeScale timescale = &time1;
  time1.epoch = 0x3810000000;
  long long v39 = *MEMORY[0x1E4F1F9F8];
  uint64_t v21 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  uint64_t v38 = &unk_1A165D1D9;
  uint64_t v40 = v21;
  devicePropsQueue = self->_devicePropsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__AVCaptureFigVideoDevice_setExposureModeCustomWithDuration_ISO_completionHandler___block_invoke;
  block[3] = &unk_1E5A74078;
  void block[4] = self;
  void block[5] = &v41;
  dispatch_sync(devicePropsQueue, block);
  if (*((unsigned char *)v42 + 24)) {
    [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"exposureMode"];
  }
  char v23 = +[AVCaptureDeviceControlRequest deviceControlRequestWithCompletionBlock:a5];
  [(AVCaptureDeviceControlRequestQueue *)self->_manualFocusControlRequests enqueueRequest:v23];
  uint64_t v24 = self->_devicePropsQueue;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __83__AVCaptureFigVideoDevice_setExposureModeCustomWithDuration_ISO_completionHandler___block_invoke_2;
  v32[3] = &unk_1E5A742D0;
  long long v33 = *(_OWORD *)&a3->var0;
  int64_t var3 = a3->var3;
  float v35 = a4;
  v32[4] = self;
  v32[5] = v23;
  v32[6] = &time2;
  v32[7] = &time1;
  dispatch_sync(v24, v32);
  if (*(_DWORD *)(*(void *)&time2.timescale + 24) == -16452)
  {
    long long v25 = (void *)MEMORY[0x1E4F1CA00];
    objc_opt_class();
    uint64_t v26 = (void *)[v25 exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:AVMethodExceptionReasonWithClassAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v26);
    }
    NSLog(&cfstr_SuppressingExc.isa, v26);
  }
  else
  {
    if (*(unsigned char *)(*(void *)&time1.timescale + 44))
    {
      long long v30 = *(_OWORD *)(*(void *)&time1.timescale + 32);
      uint64_t v31 = *(void *)(*(void *)&time1.timescale + 48);
      [(AVCaptureFigVideoDevice *)self _setActiveVideoMaxFrameDurationInternal:&v30];
    }
    if (*((unsigned char *)v42 + 24)) {
      [(AVCaptureFigVideoDevice *)self didChangeValueForKey:@"exposureMode"];
    }
    if (*(_DWORD *)(*(void *)&time2.timescale + 24))
    {
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      void v29[2] = __83__AVCaptureFigVideoDevice_setExposureModeCustomWithDuration_ISO_completionHandler___block_invoke_3;
      v29[3] = &unk_1E5A72ED0;
      v29[4] = self;
      [(AVCaptureFigVideoDevice *)self _performBlockOnMainThread:v29];
    }
  }
  _Block_object_dispose(&time1, 8);
  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&time2, 8);
}

uint64_t __83__AVCaptureFigVideoDevice_setExposureModeCustomWithDuration_ISO_completionHandler___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 424) != 3;
  return result;
}

uint64_t __83__AVCaptureFigVideoDevice_setExposureModeCustomWithDuration_ISO_completionHandler___block_invoke_2(uint64_t a1)
{
  unsigned int v2 = *(_DWORD *)(a1 + 88);
  unint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = [*(id *)(a1 + 40) requestID];
  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8) + 32;
  long long v7 = *(_OWORD *)(a1 + 64);
  uint64_t v8 = *(void *)(a1 + 80);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = objc_msgSend(v3, "_setExposureWithMode:duration:ISO:requestID:newMaxFrameDuration:", 3, &v7, v4, v5, COERCE_DOUBLE(__PAIR64__(DWORD1(v7), v2)));
  uint64_t result = [*(id *)(a1 + 40) setErrorCode:*(unsigned int *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
  if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    *(void *)(*(void *)(a1 + 32) + 424) = 3;
  }
  return result;
}

uint64_t __83__AVCaptureFigVideoDevice_setExposureModeCustomWithDuration_ISO_completionHandler___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleManualControlCompletionForRequestQueue:*(void *)(*(void *)(a1 + 32) + 672) withPayload:0];
}

uint64_t __67__AVCaptureFigVideoDevice_setExposureTargetBias_completionHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleManualControlCompletionForRequestQueue:*(void *)(*(void *)(a1 + 32) + 680) withPayload:0];
}

- (float)exposureTargetOffset
{
  uint64_t v18 = 0;
  float v19 = (float *)&v18;
  uint64_t v20 = 0x2020000000;
  int v21 = 2139095039;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v17[3] = 0;
  uint64_t v13 = 0;
  uint64_t v14 = (float *)&v13;
  uint64_t v15 = 0x2020000000;
  int v16 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__AVCaptureFigVideoDevice_exposureTargetOffset__block_invoke;
  block[3] = &unk_1E5A74190;
  void block[4] = self;
  void block[5] = v17;
  void block[6] = &v13;
  void block[7] = &v18;
  dispatch_sync(devicePropsQueue, block);
  if (v19[6] == 3.4028e38
    && [(AVCaptureFigVideoDevice *)self _hasKeyValueObserversForHighFrequencyProperty:@"exposureTargetOffset"])
  {
    uint64_t v4 = self->_devicePropsQueue;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    void v11[2] = __47__AVCaptureFigVideoDevice_exposureTargetOffset__block_invoke_2;
    void v11[3] = &unk_1E5A74078;
    v11[4] = self;
    v11[5] = &v18;
    dispatch_sync(v4, v11);
  }
  float v5 = v19[6];
  if (v5 == 3.4028e38)
  {
    id v6 = [(AVCaptureFigVideoDevice *)self _copyFigCaptureSourceProperty:*MEMORY[0x1E4F52010]];
    long long v7 = v6;
    if (v6)
    {
      [v6 floatValue];
      *((_DWORD *)v19 + 6) = v8;

      float v5 = v19[6];
    }
    else
    {
      v19[6] = 0.0;
      float v5 = 0.0;
    }
  }
  float v9 = v5 - v14[6];
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(v17, 8);
  _Block_object_dispose(&v18, 8);
  return v9;
}

void *__47__AVCaptureFigVideoDevice_exposureTargetOffset__block_invoke(void *result)
{
  *(void *)(*(void *)(result[5] + 8) + 24) = *(void *)(result[4] + 424);
  uint64_t v1 = *(void *)(*(void *)(result[5] + 8) + 24);
  if (v1)
  {
    if (v1 == 3) {
      *(_DWORD *)(*(void *)(result[6] + 8) + 24) = *(_DWORD *)(result[4] + 460);
    }
  }
  else
  {
    *(_DWORD *)(*(void *)(result[7] + 8) + 24) = 0;
  }
  return result;
}

float __47__AVCaptureFigVideoDevice_exposureTargetOffset__block_invoke_2(uint64_t a1)
{
  float result = *(float *)(*(void *)(a1 + 32) + 464);
  *(float *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)automaticallyAdjustsFaceDrivenAutoExposureEnabled
{
  uint64_t v6 = 0;
  long long v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __76__AVCaptureFigVideoDevice_automaticallyAdjustsFaceDrivenAutoExposureEnabled__block_invoke;
  v5[3] = &unk_1E5A74078;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __76__AVCaptureFigVideoDevice_automaticallyAdjustsFaceDrivenAutoExposureEnabled__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 488);
  return result;
}

- (void)setAutomaticallyAdjustsFaceDrivenAutoExposureEnabled:(BOOL)a3
{
  if ([(AVCaptureFigVideoDevice *)self isLockedForConfiguration])
  {
    if ([(AVCaptureFigVideoDevice *)self isExposureModeSupported:2])
    {
      devicePropsQueue = self->_devicePropsQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __80__AVCaptureFigVideoDevice_setAutomaticallyAdjustsFaceDrivenAutoExposureEnabled___block_invoke;
      block[3] = &unk_1E5A74028;
      void block[4] = self;
      BOOL v10 = a3;
      dispatch_sync(devicePropsQueue, block);
      return;
    }
    uint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
    objc_opt_class();
  }
  else
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3A8];
    objc_opt_class();
  }
  uint64_t v8 = (void *)[v6 exceptionWithName:v7 reason:AVMethodExceptionReasonWithClassAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v8);
  }
  NSLog(&cfstr_SuppressingExc.isa, v8);
}

uint64_t __80__AVCaptureFigVideoDevice_setAutomaticallyAdjustsFaceDrivenAutoExposureEnabled___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 488) = *(unsigned char *)(result + 40);
  return result;
}

- (BOOL)isFaceDrivenAutoExposureEnabled
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__AVCaptureFigVideoDevice_isFaceDrivenAutoExposureEnabled__block_invoke;
  v5[3] = &unk_1E5A74078;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __58__AVCaptureFigVideoDevice_isFaceDrivenAutoExposureEnabled__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = (*(_DWORD *)(*(void *)(result + 32) + 800) & 0xFFFFFFFD) == 1;
  return result;
}

- (void)setFaceDrivenAutoExposureEnabled:(BOOL)a3
{
  if ([(AVCaptureFigVideoDevice *)self isLockedForConfiguration])
  {
    if ([(AVCaptureFigVideoDevice *)self isExposureModeSupported:2]
      && ![(AVCaptureFigVideoDevice *)self automaticallyAdjustsFaceDrivenAutoExposureEnabled])
    {
      devicePropsQueue = self->_devicePropsQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __60__AVCaptureFigVideoDevice_setFaceDrivenAutoExposureEnabled___block_invoke;
      block[3] = &unk_1E5A74028;
      BOOL v10 = a3;
      void block[4] = self;
      dispatch_sync(devicePropsQueue, block);
      return;
    }
    float v5 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v6 = *MEMORY[0x1E4F1C3C8];
    objc_opt_class();
  }
  else
  {
    float v5 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v6 = *MEMORY[0x1E4F1C3A8];
    objc_opt_class();
  }
  uint64_t v7 = (void *)[v5 exceptionWithName:v6 reason:AVMethodExceptionReasonWithClassAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v7);
  }
  NSLog(&cfstr_SuppressingExc.isa, v7);
}

uint64_t __60__AVCaptureFigVideoDevice_setFaceDrivenAutoExposureEnabled___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if ((*(_DWORD *)(v1 + 800) & 0xFFFFFFFE) == 2) {
    int v2 = 3;
  }
  else {
    int v2 = 1;
  }
  if (*(unsigned char *)(result + 40)) {
    int v3 = v2;
  }
  else {
    int v3 = 2 * ((*(_DWORD *)(v1 + 800) & 0xFFFFFFFE) == 2);
  }
  *(_DWORD *)(v1 + 800) = v3;
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)activeMaxExposureDuration
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3810000000;
  BOOL v10 = &unk_1A165D1D9;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__AVCaptureFigVideoDevice_activeMaxExposureDuration__block_invoke;
  block[3] = &unk_1E5A73EF0;
  void block[4] = self;
  void block[5] = &v7;
  dispatch_sync(devicePropsQueue, block);
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)(v8 + 4);
  _Block_object_dispose(&v7, 8);
  return result;
}

__n128 __52__AVCaptureFigVideoDevice_activeMaxExposureDuration__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = (__n128 *)(v1 + 516);
  if (*(unsigned char *)(v1 + 528))
  {
    uint64_t v7 = *(__n128 **)(*(void *)(a1 + 40) + 8);
    __n128 result = *v2;
    v7[3].n128_u64[0] = v2[1].n128_u64[0];
    v7[2] = result;
  }
  else
  {
    int v3 = (__n128 *)(*(void *)(*(void *)(a1 + 40) + 8) + 32);
    if (*(unsigned char *)(v1 + 504))
    {
      __n128 result = *(__n128 *)(v1 + 492);
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 48) = *(void *)(v1 + 508);
      *int v3 = result;
    }
    else
    {
      uint64_t v4 = (__n128 *)(v1 + 280);
      unint64_t v5 = v4[1].n128_u64[0];
      __n128 result = *v4;
      *int v3 = *v4;
      v3[1].n128_u64[0] = v5;
    }
  }
  return result;
}

- (void)setActiveMaxExposureDuration:(id *)a3
{
  if ([(AVCaptureFigVideoDevice *)self isLockedForConfiguration])
  {
    if ((a3->var2 & 1) == 0) {
      goto LABEL_3;
    }
    id v8 = [(AVCaptureFigVideoDevice *)self activeFormat];
    if (v8) {
      [v8 minExposureDuration];
    }
    else {
      memset(&time2, 0, sizeof(time2));
    }
    CMTime time1 = (CMTime)*a3;
    if ((CMTimeCompare(&time1, &time2) & 0x80000000) == 0)
    {
      id v9 = [(AVCaptureFigVideoDevice *)self activeFormat];
      if (v9) {
        [v9 maxExposureDuration];
      }
      else {
        memset(&v14, 0, sizeof(v14));
      }
      CMTime time1 = (CMTime)*a3;
      if (CMTimeCompare(&time1, &v14) < 1)
      {
LABEL_3:
        devicePropsQueue = self->_devicePropsQueue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __56__AVCaptureFigVideoDevice_setActiveMaxExposureDuration___block_invoke;
        block[3] = &unk_1E5A74320;
        void block[4] = self;
        long long v12 = *(_OWORD *)&a3->var0;
        int64_t var3 = a3->var3;
        dispatch_sync(devicePropsQueue, block);
        return;
      }
    }
    uint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    objc_opt_class();
  }
  else
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3A8];
    objc_opt_class();
  }
  BOOL v10 = (void *)[v6 exceptionWithName:v7 reason:AVMethodExceptionReasonWithClassAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v10);
  }
  NSLog(&cfstr_SuppressingExc.isa, v10);
}

void __56__AVCaptureFigVideoDevice_setActiveMaxExposureDuration___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32) + 516;
  long long v3 = *(_OWORD *)(a1 + 40);
  *(void *)(v2 + 16) = *(void *)(a1 + 56);
  uint64_t v4 = (const __CFAllocator **)MEMORY[0x1E4F1CF80];
  *(_OWORD *)uint64_t v2 = v3;
  CFAllocatorRef v5 = *v4;
  CMTime v7 = *(CMTime *)(a1 + 40);
  CFDictionaryRef v6 = CMTimeCopyAsDictionary(&v7, v5);
  [*(id *)(a1 + 32) _setFigCaptureSourceProperty:*MEMORY[0x1E4F51EF0] withValue:v6 cacheOnly:*(unsigned __int8 *)(*(void *)(a1 + 32) + 328)];
}

- (BOOL)isGlobalToneMappingEnabled
{
  uint64_t v6 = 0;
  CMTime v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__AVCaptureFigVideoDevice_isGlobalToneMappingEnabled__block_invoke;
  v5[3] = &unk_1E5A74078;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __53__AVCaptureFigVideoDevice_isGlobalToneMappingEnabled__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 1177);
  return result;
}

- (void)setGlobalToneMappingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(AVCaptureFigVideoDevice *)self isLockedForConfiguration])
  {
    if ([(AVCaptureDeviceFormat *)self->_activeFormat isGlobalToneMappingSupported])
    {
      uint64_t v10 = 0;
      uint64_t v11 = &v10;
      uint64_t v12 = 0x2020000000;
      uint64_t v13 = 0;
      devicePropsQueue = self->_devicePropsQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __55__AVCaptureFigVideoDevice_setGlobalToneMappingEnabled___block_invoke;
      block[3] = &unk_1E5A74078;
      void block[4] = self;
      void block[5] = &v10;
      dispatch_sync(devicePropsQueue, block);
      if (v11[3])
      {
        [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"digitalFlashMode"];
        [(AVCaptureFigVideoDevice *)self _setDigitalFlashModeInternal:0];
        [(AVCaptureFigVideoDevice *)self didChangeValueForKey:@"digitalFlashMode"];
      }
      [(AVCaptureFigVideoDevice *)self _setGlobalToneMappingEnabledInternal:v3];
      _Block_object_dispose(&v10, 8);
      return;
    }
    uint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
    objc_opt_class();
  }
  else
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3A8];
    objc_opt_class();
  }
  uint64_t v8 = (void *)[v6 exceptionWithName:v7 reason:AVMethodExceptionReasonWithClassAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v8);
  }
  NSLog(&cfstr_SuppressingExc.isa, v8);
}

uint64_t __55__AVCaptureFigVideoDevice_setGlobalToneMappingEnabled___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 752);
  return result;
}

- (void)_setGlobalToneMappingEnabledInternal:(BOOL)a3
{
  devicePropsQueue = self->_devicePropsQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __64__AVCaptureFigVideoDevice__setGlobalToneMappingEnabledInternal___block_invoke;
  v4[3] = &unk_1E5A74028;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(devicePropsQueue, v4);
}

uint64_t __64__AVCaptureFigVideoDevice__setGlobalToneMappingEnabledInternal___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_setFigCaptureSourceProperty:withValue:", *MEMORY[0x1E4F52058], objc_msgSend(NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 40)));
  if (!result) {
    *(unsigned char *)(*(void *)(a1 + 32) + 1177) = *(unsigned char *)(a1 + 40);
  }
  return result;
}

- (BOOL)isAdjustingWhiteBalance
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__AVCaptureFigVideoDevice_isAdjustingWhiteBalance__block_invoke;
  v5[3] = &unk_1E5A74078;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __50__AVCaptureFigVideoDevice_isAdjustingWhiteBalance__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 576);
  return result;
}

- (int64_t)whiteBalanceMode
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__AVCaptureFigVideoDevice_whiteBalanceMode__block_invoke;
  v5[3] = &unk_1E5A74078;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __43__AVCaptureFigVideoDevice_whiteBalanceMode__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 544);
  return result;
}

- ($E2C29196C7A5C696474C6955C5A9CE06)deviceWhiteBalanceGains
{
  uint64_t v15 = 0;
  int v16 = (float *)&v15;
  uint64_t v17 = 0x3010000000;
  int v20 = -1082130432;
  uint64_t v18 = &unk_1A165D1D9;
  unint64_t v19 = 0xBF800000BF800000;
  if ([(AVCaptureFigVideoDevice *)self _hasKeyValueObserversForHighFrequencyProperty:@"deviceWhiteBalanceGains"])
  {
    devicePropsQueue = self->_devicePropsQueue;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    void v14[2] = __50__AVCaptureFigVideoDevice_deviceWhiteBalanceGains__block_invoke;
    v14[3] = &unk_1E5A74078;
    v14[4] = self;
    v14[5] = &v15;
    dispatch_sync(devicePropsQueue, v14);
  }
  uint64_t v4 = v16;
  if (*((void *)v16 + 4) == 0xBF800000BF800000 && *((_DWORD *)v16 + 10) == -1082130432)
  {
    id v6 = [(AVCaptureFigVideoDevice *)self _copyFigCaptureSourceProperty:*MEMORY[0x1E4F51FC0]];
    uint64_t v7 = v6;
    if (v6)
    {
      if ([v6 length] == 12) {
        [v7 getBytes:v16 + 8 length:12];
      }

      uint64_t v4 = v16;
    }
    else
    {
      uint64_t v4 = v16;
      *((void *)v16 + 4) = 0x3F80000040000000;
      v4[10] = 2.0;
    }
  }
  float v8 = v4[8];
  float v9 = v4[9];
  float v10 = v4[10];
  _Block_object_dispose(&v15, 8);
  float v11 = v8;
  float v12 = v9;
  float v13 = v10;
  result.var2 = v13;
  result.uint64_t var1 = v12;
  result.var0 = v11;
  return result;
}

uint64_t __50__AVCaptureFigVideoDevice_deviceWhiteBalanceGains__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 40) + 8);
  int v2 = *(_DWORD *)(*(void *)(result + 32) + 560);
  *(void *)(v1 + 32) = *(void *)(*(void *)(result + 32) + 552);
  *(_DWORD *)(v1 + 40) = v2;
  return result;
}

- ($E2C29196C7A5C696474C6955C5A9CE06)grayWorldDeviceWhiteBalanceGains
{
  uint64_t v15 = 0;
  int v16 = (float *)&v15;
  uint64_t v17 = 0x3010000000;
  int v20 = -1082130432;
  uint64_t v18 = &unk_1A165D1D9;
  unint64_t v19 = 0xBF800000BF800000;
  if ([(AVCaptureFigVideoDevice *)self _hasKeyValueObserversForHighFrequencyProperty:@"grayWorldDeviceWhiteBalanceGains"])
  {
    devicePropsQueue = self->_devicePropsQueue;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    void v14[2] = __59__AVCaptureFigVideoDevice_grayWorldDeviceWhiteBalanceGains__block_invoke;
    v14[3] = &unk_1E5A74078;
    v14[4] = self;
    v14[5] = &v15;
    dispatch_sync(devicePropsQueue, v14);
  }
  uint64_t v4 = v16;
  if (*((void *)v16 + 4) == 0xBF800000BF800000 && *((_DWORD *)v16 + 10) == -1082130432)
  {
    id v6 = [(AVCaptureFigVideoDevice *)self _copyFigCaptureSourceProperty:*MEMORY[0x1E4F52060]];
    uint64_t v7 = v6;
    if (v6)
    {
      if ([v6 length] == 12) {
        [v7 getBytes:v16 + 8 length:12];
      }

      uint64_t v4 = v16;
    }
    else
    {
      uint64_t v4 = v16;
      *((void *)v16 + 4) = 0x3F80000040000000;
      v4[10] = 2.0;
    }
  }
  float v8 = v4[8];
  float v9 = v4[9];
  float v10 = v4[10];
  _Block_object_dispose(&v15, 8);
  float v11 = v8;
  float v12 = v9;
  float v13 = v10;
  result.var2 = v13;
  result.uint64_t var1 = v12;
  result.var0 = v11;
  return result;
}

uint64_t __59__AVCaptureFigVideoDevice_grayWorldDeviceWhiteBalanceGains__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 40) + 8);
  int v2 = *(_DWORD *)(*(void *)(result + 32) + 572);
  *(void *)(v1 + 32) = *(void *)(*(void *)(result + 32) + 564);
  *(_DWORD *)(v1 + 40) = v2;
  return result;
}

- (float)maxWhiteBalanceGain
{
  return 4.0;
}

- (BOOL)_ensureWhiteBalanceCalibrationUnpacked
{
  devicePropsQueue = self->_devicePropsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__AVCaptureFigVideoDevice__ensureWhiteBalanceCalibrationUnpacked__block_invoke;
  block[3] = &unk_1E5A72ED0;
  void block[4] = self;
  dispatch_sync(devicePropsQueue, block);
  return *(void *)&self->_adjustingWB != 0;
}

void __65__AVCaptureFigVideoDevice__ensureWhiteBalanceCalibrationUnpacked__block_invoke(uint64_t a1)
{
  int v2 = *(void **)(a1 + 32);
  if (v2[73]) {
    goto LABEL_2;
  }
  uint64_t v4 = (void *)[v2 _copyFigCaptureSourceProperty:*MEMORY[0x1E4F52188]];
  if (!v4)
  {
    FigDebugAssert3();
LABEL_2:
    int64_t v3 = 0;
    goto LABEL_17;
  }
  id v16 = v4;
  if ([v4 count] == 2)
  {
    *(void *)(*(void *)(a1 + 32) + 592) = malloc_type_calloc(2uLL, 8uLL, 0x100004000313F17uLL);
    *(void *)(*(void *)(a1 + 32) + 600) = malloc_type_calloc(2uLL, 8uLL, 0x80040B8603338uLL);
    uint64_t v5 = *(void *)(a1 + 32);
    if (*(void *)(v5 + 592))
    {
      if (*(void *)(v5 + 600))
      {
        uint64_t v6 = 0;
        uint64_t v7 = *MEMORY[0x1E4F52298];
        uint64_t v8 = *MEMORY[0x1E4F52290];
        while (1)
        {
          uint64_t v9 = objc_msgSend((id)objc_msgSend(v16, "objectAtIndexedSubscript:", v6), "objectForKeyedSubscript:", v7);
          if (!v9) {
            break;
          }
          float v10 = (void *)v9;
          float v11 = objc_msgSend((id)objc_msgSend(v16, "objectAtIndexedSubscript:", v6), "objectForKeyedSubscript:", v8);
          if (!v11) {
            break;
          }
          float v12 = v11;
          if ([v11 length] != 36) {
            break;
          }
          uint64_t v13 = [v12 bytes];
          [v10 doubleValue];
          *(float *)&double v14 = v14;
          *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 592) + 8 * v6) = LODWORD(v14);
          *(void *)(*(void *)(*(void *)(a1 + 32) + 600) + 8 * v6) = malloc_type_malloc(0x48uLL, 0x100004000313F17uLL);
          if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 600) + 8 * v6)) {
            break;
          }
          for (uint64_t i = 0; i != 9; ++i)
            *(double *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 600) + 8 * v6) + 8 * i) = *(float *)(v13 + 4 * i);
          if (++v6 == 2)
          {
            *(void *)(*(void *)(a1 + 32) + 584) = 2;
            goto LABEL_16;
          }
        }
      }
    }
  }
  FigDebugAssert3();
LABEL_16:
  int64_t v3 = v16;
LABEL_17:
}

- (BOOL)isLockingWhiteBalanceWithCustomDeviceGainsSupported
{
  id v2 = [(NSDictionary *)self->_fcsAttributes objectForKeyedSubscript:*MEMORY[0x1E4F51BE8]];

  return [v2 BOOLValue];
}

- (void)setWhiteBalanceModeLockedWithDeviceWhiteBalanceGains:(id)a3 completionHandler:(id)a4
{
  float var2 = a3.var2;
  float var1 = a3.var1;
  float var0 = a3.var0;
  $E2C29196C7A5C696474C6955C5A9CE06 v33 = a3;
  if (![(AVCaptureFigVideoDevice *)self isWhiteBalanceModeSupported:0]) {
    goto LABEL_24;
  }
  if (*(void *)&v33.var0) {
    BOOL v9 = 0;
  }
  else {
    BOOL v9 = LODWORD(v33.var2) == 0;
  }
  if (v9)
  {
LABEL_19:
    uint64_t v29 = 0;
    long long v30 = &v29;
    uint64_t v31 = 0x2020000000;
    int v32 = 0;
    uint64_t v25 = 0;
    uint64_t v26 = &v25;
    uint64_t v27 = 0x2020000000;
    devicePropsQueue = self->_devicePropsQueue;
    char v28 = 0;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __98__AVCaptureFigVideoDevice_setWhiteBalanceModeLockedWithDeviceWhiteBalanceGains_completionHandler___block_invoke;
    block[3] = &unk_1E5A74230;
    void block[4] = self;
    void block[5] = &v25;
    void block[6] = 0;
    dispatch_sync(devicePropsQueue, block);
    if (*((unsigned char *)v26 + 24)) {
      [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"whiteBalanceMode"];
    }
    uint64_t v13 = +[AVCaptureDeviceControlRequest deviceControlRequestWithCompletionBlock:a4];
    [(AVCaptureDeviceControlRequestQueue *)self->_biasedExposureControlRequests enqueueRequest:v13];
    double v14 = self->_devicePropsQueue;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __98__AVCaptureFigVideoDevice_setWhiteBalanceModeLockedWithDeviceWhiteBalanceGains_completionHandler___block_invoke_2;
    v22[3] = &unk_1E5A74348;
    v22[6] = &v29;
    v22[7] = 0;
    $E2C29196C7A5C696474C6955C5A9CE06 v23 = v33;
    v22[4] = self;
    v22[5] = v13;
    dispatch_sync(v14, v22);
    int v15 = *((_DWORD *)v30 + 6);
    if (v15 == -16452)
    {
      id v16 = (void *)MEMORY[0x1E4F1CA00];
      objc_opt_class();
      uint64_t v17 = (void *)[v16 exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:AVMethodExceptionReasonWithClassAndSelector() userInfo:0];
      if (AVCaptureShouldThrowForAPIViolations()) {
        objc_exception_throw(v17);
      }
      NSLog(&cfstr_SuppressingExc.isa, v17);
    }
    else
    {
      if (*((unsigned char *)v26 + 24))
      {
        [(AVCaptureFigVideoDevice *)self didChangeValueForKey:@"whiteBalanceMode"];
        int v15 = *((_DWORD *)v30 + 6);
      }
      if (v15)
      {
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __98__AVCaptureFigVideoDevice_setWhiteBalanceModeLockedWithDeviceWhiteBalanceGains_completionHandler___block_invoke_3;
        v21[3] = &unk_1E5A72ED0;
        v21[4] = self;
        [(AVCaptureFigVideoDevice *)self _performBlockOnMainThread:v21];
      }
    }
    _Block_object_dispose(&v25, 8);
    _Block_object_dispose(&v29, 8);
    return;
  }
  if ([(AVCaptureFigVideoDevice *)self isLockingWhiteBalanceWithCustomDeviceGainsSupported])
  {
    [(AVCaptureFigVideoDevice *)self maxWhiteBalanceGain];
    if (var0 >= 1.0 && var0 <= v10 && var1 <= v10 && var1 >= 1.0 && var2 <= v10 && var2 >= 1.0)
    {
      if (var0 >= var1) {
        float v11 = var1;
      }
      else {
        float v11 = var0;
      }
      if (v11 >= var2) {
        float v11 = var2;
      }
      v33.float var0 = var0 / v11;
      v33.float var1 = var1 / v11;
      v33.float var2 = var2 / v11;
      goto LABEL_19;
    }
    uint64_t v18 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v19 = *MEMORY[0x1E4F1C4A8];
    objc_opt_class();
  }
  else
  {
LABEL_24:
    uint64_t v18 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v19 = *MEMORY[0x1E4F1C3C8];
    objc_opt_class();
  }
  int v20 = (void *)[v18 exceptionWithName:v19 reason:AVMethodExceptionReasonWithClassAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v20);
  }
  NSLog(&cfstr_SuppressingExc.isa, v20);
}

void *__98__AVCaptureFigVideoDevice_setWhiteBalanceModeLockedWithDeviceWhiteBalanceGains_completionHandler___block_invoke(void *result)
{
  *(unsigned char *)(*(void *)(result[5] + 8) + 24) = *(void *)(result[4] + 544) != result[6];
  return result;
}

uint64_t __98__AVCaptureFigVideoDevice_setWhiteBalanceModeLockedWithDeviceWhiteBalanceGains_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  int64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = [*(id *)(a1 + 40) requestID];
  LODWORD(v5) = *(_DWORD *)(a1 + 64);
  LODWORD(v6) = *(_DWORD *)(a1 + 68);
  LODWORD(v7) = *(_DWORD *)(a1 + 72);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = objc_msgSend(v3, "_setWhiteBalanceWithMode:gains:requestID:", v2, v4, v5, v6, v7);
  uint64_t result = [*(id *)(a1 + 40) setErrorCode:*(unsigned int *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
  if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    *(void *)(*(void *)(a1 + 32) + 544) = *(void *)(a1 + 56);
  }
  return result;
}

uint64_t __98__AVCaptureFigVideoDevice_setWhiteBalanceModeLockedWithDeviceWhiteBalanceGains_completionHandler___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleManualControlCompletionForRequestQueue:*(void *)(*(void *)(a1 + 32) + 688) withPayload:0];
}

- (double)_whiteBalanceMixingFactorForTemperature:(double)a3
{
  return fmin(fmax((1.0 / a3 - 1.0 / *(float *)self->_wbCalibrationCount)/ (1.0 / *(float *)(self->_wbCalibrationCount + 8) - 1.0 / *(float *)self->_wbCalibrationCount), 0.0), 1.0);
}

- (double)_whiteBalanceTemperatureForMixingFactor:(double)a3
{
  return 1.0
       / (1.0 / *(float *)self->_wbCalibrationCount
        + (1.0 / *(float *)(self->_wbCalibrationCount + 8) - 1.0 / *(float *)self->_wbCalibrationCount) * a3);
}

- ($E2C29196C7A5C696474C6955C5A9CE06)_deviceWhiteBalanceGainsForChromaticityValues:(id)a3 temperature:(double)a4
{
  float var1 = a3.var1;
  float var0 = a3.var0;
  v27[9] = *(double *)MEMORY[0x1E4F143B8];
  if ([(AVCaptureFigVideoDevice *)self _ensureWhiteBalanceCalibrationUnpacked])
  {
    [(AVCaptureFigVideoDevice *)self _whiteBalanceMixingFactorForTemperature:a4];
    uint64_t v9 = 0;
    wbCalibrationTemperatures = self->_wbCalibrationTemperatures;
    $94F468A8D4C62B317260615823C2B210 v11 = *wbCalibrationTemperatures;
    $94F468A8D4C62B317260615823C2B210 v12 = wbCalibrationTemperatures[1];
    do
    {
      v27[v9] = v8 * *(double *)(*(void *)&v12 + v9 * 8) + *(double *)(*(void *)&v11 + v9 * 8) * (1.0 - v8);
      ++v9;
    }
    while (v9 != 9);
    InvertMatrix(v27, v26);
    xy_to_XYZ((uint64_t)v25, var0, var1);
    VectorMatrix(v25, v26, &v23);
    for (uint64_t i = 0; i != 24; i += 8)
    {
      if (*(double *)((char *)&v23 + i) < 0.0) {
        *(double *)((char *)&v23 + i) = 0.0;
      }
    }
    float v14 = 1.0 / v23;
    __asm { FMOV            V2.2D, #1.0 }
    float32x2_t v20 = vcvt_f32_f64(vdivq_f64(_Q2, v24));
    float v21 = v20.f32[1];
    if (v20.f32[0] >= v20.f32[1]) {
      float v22 = v20.f32[1];
    }
    else {
      float v22 = v20.f32[0];
    }
    if (v22 > v14) {
      float v22 = 1.0 / v23;
    }
    if (fabsf(v22) != INFINITY)
    {
      float v14 = v14 / v22;
      v20.f32[0] = v20.f32[0] / v22;
      float v21 = v20.f32[1] / v22;
    }
  }
  else
  {
    v20.i32[0] = 1.0;
    float v21 = 2.0;
    float v14 = 2.0;
  }
  result.float var1 = v20.f32[0];
  result.float var2 = v21;
  result.float var0 = v14;
  return result;
}

- (double)_predictedTempForGains:(id)a3
{
  float var2 = a3.var2;
  float var1 = a3.var1;
  float var0 = a3.var0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__AVCaptureFigVideoDevice__predictedTempForGains___block_invoke;
  block[3] = &unk_1E5A72ED0;
  void block[4] = self;
  if (_predictedTempForGains__onceToken != -1) {
    dispatch_once(&_predictedTempForGains__onceToken, block);
  }
  double v7 = (((float)(1.0 / var1) - *((double *)&_predictedTempForGains__knownDRGB + 1)) * *(double *)algn_1E9544788
      + *(double *)_predictedTempForGains__minToMax
      * ((float)(1.0 / var0) - *(double *)&_predictedTempForGains__knownDRGB)
      + *(double *)&qword_1E9544790 * ((float)(1.0 / var2) - *(double *)&qword_1E9544760))
     / *(double *)&_predictedTempForGains__minToMaxLen;
  return (1.0 - v7) * *(float *)self->_wbCalibrationCount + v7 * *(float *)(self->_wbCalibrationCount + 8);
}

uint64_t __50__AVCaptureFigVideoDevice__predictedTempForGains___block_invoke(uint64_t a1, double a2, double a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  double v5 = (_DWORD *)v4[74];
  LODWORD(a2) = *v5;
  LODWORD(a3) = v5[1];
  objc_msgSend(v4, "deviceWhiteBalanceGainsForTemperatureAndTintValues:", a2, a3);
  unsigned int v26 = v6;
  unsigned int v25 = v7;
  unsigned int v27 = v8;
  uint64_t v9 = *(void **)(a1 + 32);
  uint64_t v10 = v9[74];
  LODWORD(v11) = *(_DWORD *)(v10 + 8);
  LODWORD(v12) = *(_DWORD *)(v10 + 12);
  uint64_t result = objc_msgSend(v9, "deviceWhiteBalanceGainsForTemperatureAndTintValues:", v11, v12);
  uint64_t v14 = 0;
  __asm { FMOV            V4.2D, #1.0 }
  v22.i32[1] = v21;
  _predictedTempForGains__knownDRGB = (__int128)vdivq_f64(_Q4, vcvtq_f64_f32((float32x2_t)__PAIR64__(v25, v26)));
  *(float64x2_t *)&qword_1E9544760 = vdivq_f64(_Q4, vcvtq_f64_f32((float32x2_t)__PAIR64__(v20, v27)));
  xmmword_1E9544770 = (__int128)vdivq_f64(_Q4, vcvtq_f64_f32(v22));
  do
  {
    *(double *)&_predictedTempForGains__minToMax[v14] = *(double *)((char *)&_predictedTempForGains__knownDRGB
                                                                  + v14 * 8
                                                                  + 24)
                                                      - *(double *)((char *)&_predictedTempForGains__knownDRGB + v14 * 8);
    ++v14;
  }
  while (v14 != 3);
  uint64_t v23 = 0;
  double v24 = sqrt(*(double *)algn_1E9544788 * *(double *)algn_1E9544788+ *(double *)_predictedTempForGains__minToMax * *(double *)_predictedTempForGains__minToMax+ *(double *)&qword_1E9544790 * *(double *)&qword_1E9544790);
  _predictedTempForGains__minToMaxLen = *(void *)&v24;
  do
  {
    *(double *)&_predictedTempForGains__minToMax[v23] = *(double *)&_predictedTempForGains__minToMax[v23] / v24;
    ++v23;
  }
  while (v23 != 3);
  return result;
}

- ($94F468A8D4C62B317260615823C2B210)_chromaticityValuesForDeviceWhiteBalanceGains:(id)a3 atMix:(double)a4
{
  uint64_t v4 = 0;
  v21[9] = *(double *)MEMORY[0x1E4F143B8];
  wbCalibrationTemperatures = self->_wbCalibrationTemperatures;
  $94F468A8D4C62B317260615823C2B210 v6 = *wbCalibrationTemperatures;
  $94F468A8D4C62B317260615823C2B210 v7 = wbCalibrationTemperatures[1];
  do
  {
    v21[v4] = *(double *)(*(void *)&v7 + v4 * 8) * a4 + *(double *)(*(void *)&v6 + v4 * 8) * (1.0 - a4);
    ++v4;
  }
  while (v4 != 9);
  float var1 = a3.var1;
  __asm { FMOV            V1.2D, #1.0 }
  float64x2_t v19 = vdivq_f64(_Q1, vcvtq_f64_f32(*(float32x2_t *)&a3.var0));
  double v20 = 1.0 / a3.var2;
  VectorMatrix(v19.f64, v21, v18);
  double v16 = 0.0;
  double v17 = 0.0;
  XYZ_to_xy(v18, &v17, &v16);
  float v14 = v17;
  float v15 = v16;
  result.float var1 = v15;
  result.float var0 = v14;
  return result;
}

- (BOOL)_isWBSeedEnabled
{
  return LOBYTE(self->_wbSeedTemp);
}

- (void)_setWBSeedEnabled:(BOOL)a3
{
  LOBYTE(self->_wbSeedTemp) = a3;
}

- (unint64_t)_wbTemperatureIterations
{
  return *(void *)&self->_wbSeedEnabled;
}

- ($94F468A8D4C62B317260615823C2B210)chromaticityValuesForDeviceWhiteBalanceGains:(id)a3
{
  float var2 = a3.var2;
  float var1 = a3.var1;
  float var0 = a3.var0;
  float v7 = 0.5;
  if (![(AVCaptureFigVideoDevice *)self _ensureWhiteBalanceCalibrationUnpacked])
  {
LABEL_21:
    float v19 = 0.5;
    goto LABEL_22;
  }
  [(AVCaptureFigVideoDevice *)self maxWhiteBalanceGain];
  if (var0 < 1.0 || var0 > *(float *)&v8 || var1 < 1.0 || var1 > *(float *)&v8 || var2 < 1.0 || var2 > *(float *)&v8)
  {
    double v16 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v17 = *MEMORY[0x1E4F1C4A8];
    objc_opt_class();
    uint64_t v18 = (void *)[v16 exceptionWithName:v17 reason:AVMethodExceptionReasonWithClassAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v18);
    }
    NSLog(&cfstr_SuppressingExc.isa, v18);
    goto LABEL_21;
  }
  if (var0 >= var1) {
    *(float *)&double v8 = var1;
  }
  else {
    *(float *)&double v8 = var0;
  }
  if (*(float *)&v8 >= var2) {
    *(float *)&double v8 = var2;
  }
  float v22 = var0 / *(float *)&v8;
  float v23 = var1 / *(float *)&v8;
  float v24 = var2 / *(float *)&v8;
  *(float *)&double v8 = v22;
  *(float *)&double v9 = v23;
  *(float *)&double v10 = v24;
  -[AVCaptureFigVideoDevice _predictedTempForGains:](self, "_predictedTempForGains:", v8, v9, v10);
  uint64_t v51 = 0;
  CMTime v52 = (double *)&v51;
  uint64_t v53 = 0x2020000000;
  devicePropsQueue = self->_devicePropsQueue;
  uint64_t v54 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  uint64_t v43 = v26;
  block[1] = 3221225472;
  block[2] = __72__AVCaptureFigVideoDevice_chromaticityValuesForDeviceWhiteBalanceGains___block_invoke;
  block[3] = &unk_1E5A74230;
  void block[4] = self;
  void block[5] = &v51;
  void block[6] = v26;
  dispatch_sync(devicePropsQueue, block);
  int v27 = 0;
  double v28 = v52[3];
  int v29 = -1;
  float v19 = 0.5;
  double v30 = 3.40282347e38;
  while (1)
  {
    [(AVCaptureFigVideoDevice *)self _whiteBalanceMixingFactorForTemperature:v28];
    double v32 = v31;
    *(float *)&double v31 = v22;
    *(float *)&double v33 = v23;
    *(float *)&double v34 = v24;
    -[AVCaptureFigVideoDevice _chromaticityValuesForDeviceWhiteBalanceGains:atMix:](self, "_chromaticityValuesForDeviceWhiteBalanceGains:atMix:", v31, v33, v34, v32);
    float v36 = v35;
    float v38 = v37;
    uint64_t v48 = 0;
    double v49 = 0.0;
    xy_to_tempTint(&v49, (double *)&v48, v35, v37);
    double v28 = v49;
    double v39 = v52[3];
    double v40 = vabdd_f64(v49, v39);
    if (v40 >= v30) {
      break;
    }
    float v7 = v36;
    int v29 = v27;
    float v19 = v38;
    if (v49 - v39 == 0.0) {
      goto LABEL_35;
    }
LABEL_33:
    v52[3] = v49;
    ++v27;
    double v30 = v40;
    if (v27 == 50)
    {
      uint64_t v41 = self->_devicePropsQueue;
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      void v46[2] = __72__AVCaptureFigVideoDevice_chromaticityValuesForDeviceWhiteBalanceGains___block_invoke_2;
      v46[3] = &unk_1E5A74370;
      v46[4] = self;
      int v47 = 50;
      CMTime v42 = v46;
      goto LABEL_36;
    }
  }
  double v40 = v30;
  if (v27 - v29 <= 1) {
    goto LABEL_33;
  }
LABEL_35:
  uint64_t v41 = self->_devicePropsQueue;
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __72__AVCaptureFigVideoDevice_chromaticityValuesForDeviceWhiteBalanceGains___block_invoke_3;
  v44[3] = &unk_1E5A74398;
  v44[4] = self;
  v44[5] = &v51;
  void v44[6] = v43;
  int v45 = v27;
  CMTime v42 = v44;
LABEL_36:
  dispatch_sync(v41, v42);
  _Block_object_dispose(&v51, 8);
LABEL_22:
  float v20 = v7;
  float v21 = v19;
  result.float var1 = v21;
  result.float var0 = v20;
  return result;
}

double *__72__AVCaptureFigVideoDevice_chromaticityValuesForDeviceWhiteBalanceGains___block_invoke(double *result)
{
  *(void *)(*(void *)(*((void *)result + 5) + 8) + 24) = *(void *)(*((void *)result + 4) + 616);
  uint64_t v1 = *(void *)(*((void *)result + 5) + 8);
  if (*(double *)(v1 + 24) < 0.0)
  {
    double v2 = result[6];
LABEL_5:
    *(double *)(v1 + 24) = v2;
    return result;
  }
  uint64_t v3 = *((void *)result + 4);
  double v2 = result[6];
  if (vabdd_f64(*(double *)(v3 + 608), v2) > 500.0 || !*(unsigned char *)(v3 + 624)) {
    goto LABEL_5;
  }
  return result;
}

uint64_t __72__AVCaptureFigVideoDevice_chromaticityValuesForDeviceWhiteBalanceGains___block_invoke_2(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 632) = *(int *)(result + 40);
  return result;
}

double __72__AVCaptureFigVideoDevice_chromaticityValuesForDeviceWhiteBalanceGains___block_invoke_3(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 616) = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  double result = *(double *)(a1 + 48);
  *(double *)(*(void *)(a1 + 32) + 608) = result;
  *(void *)(*(void *)(a1 + 32) + 632) = *(int *)(a1 + 56);
  return result;
}

- ($E2C29196C7A5C696474C6955C5A9CE06)deviceWhiteBalanceGainsForChromaticityValues:(id)a3
{
  float var0 = a3.var0;
  if (a3.var0 > 1.0 || ((var1 = a3.var1, a3.var0 >= 0.0) ? (BOOL v5 = a3.var1 > 1.0) : (BOOL v5 = 1), v5 || a3.var1 < 0.0))
  {
    double v12 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v13 = *MEMORY[0x1E4F1C4A8];
    objc_opt_class();
    float v14 = (void *)[v12 exceptionWithName:v13 reason:AVMethodExceptionReasonWithClassAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v14);
    }
    NSLog(&cfstr_SuppressingExc.isa, v14);
    float v9 = 0.0;
    float v10 = 0.0;
    float v11 = 0.0;
  }
  else
  {
    uint64_t v15 = 0;
    double v16 = 0.0;
    double v7 = xy_to_tempTint(&v16, (double *)&v15, a3.var0, a3.var1);
    *(float *)&double v7 = var0;
    *(float *)&double v8 = var1;
    -[AVCaptureFigVideoDevice _deviceWhiteBalanceGainsForChromaticityValues:temperature:](self, "_deviceWhiteBalanceGainsForChromaticityValues:temperature:", v7, v8, v16);
  }
  result.float var2 = v11;
  result.float var1 = v10;
  result.float var0 = v9;
  return result;
}

- ($94F468A8D4C62B317260615823C2B210)temperatureAndTintValuesForDeviceWhiteBalanceGains:(id)a3
{
  float var2 = a3.var2;
  float var1 = a3.var1;
  float var0 = a3.var0;
  [(AVCaptureFigVideoDevice *)self maxWhiteBalanceGain];
  if (var0 < 1.0 || var0 > *(float *)&v7 || var1 < 1.0 || var1 > *(float *)&v7 || var2 < 1.0 || var2 > *(float *)&v7)
  {
    uint64_t v15 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v16 = *MEMORY[0x1E4F1C4A8];
    objc_opt_class();
    uint64_t v17 = (void *)[v15 exceptionWithName:v16 reason:AVMethodExceptionReasonWithClassAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v17);
    }
    NSLog(&cfstr_SuppressingExc.isa, v17);
    float v21 = 0.0;
    float v20 = 0.0;
  }
  else
  {
    *(float *)&double v7 = var0;
    *(float *)&double v8 = var1;
    *(float *)&double v9 = var2;
    -[AVCaptureFigVideoDevice chromaticityValuesForDeviceWhiteBalanceGains:](self, "chromaticityValuesForDeviceWhiteBalanceGains:", v7, v8, v9);
    double v22 = 0.0;
    double v23 = 0.0;
    xy_to_tempTint(&v23, &v22, v18, v19);
    float v20 = v23;
    float v21 = v22;
  }
  result.float var1 = v21;
  result.float var0 = v20;
  return result;
}

- ($E2C29196C7A5C696474C6955C5A9CE06)deviceWhiteBalanceGainsForTemperatureAndTintValues:(id)a3
{
  double v10 = 0.0;
  double v11 = 0.0;
  double var0 = a3.var0;
  tempTint_to_xy(&v11, &v10, a3.var0, a3.var1);
  HIDWORD(v6) = HIDWORD(v10);
  HIDWORD(v5) = HIDWORD(v11);
  *(float *)&double v5 = v11;
  *(float *)&double v6 = v10;
  -[AVCaptureFigVideoDevice _deviceWhiteBalanceGainsForChromaticityValues:temperature:](self, "_deviceWhiteBalanceGainsForChromaticityValues:temperature:", v5, v6, var0);
  result.float var2 = v9;
  result.float var1 = v8;
  result.double var0 = v7;
  return result;
}

- (void)_setFlashSceneDetectedForPhotoOutput:(BOOL)a3
{
  devicePropsQueue = self->_devicePropsQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __64__AVCaptureFigVideoDevice__setFlashSceneDetectedForPhotoOutput___block_invoke;
  v4[3] = &unk_1E5A74028;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(devicePropsQueue, v4);
}

uint64_t __64__AVCaptureFigVideoDevice__setFlashSceneDetectedForPhotoOutput___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 747) = *(unsigned char *)(result + 40);
  return result;
}

- (void)_setFlashAvailable:(BOOL)a3
{
  devicePropsQueue = self->_devicePropsQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__AVCaptureFigVideoDevice__setFlashAvailable___block_invoke;
  v4[3] = &unk_1E5A74028;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(devicePropsQueue, v4);
}

uint64_t __46__AVCaptureFigVideoDevice__setFlashAvailable___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 768) = *(unsigned char *)(result + 40);
  return result;
}

- (int64_t)flashMode
{
  uint64_t v6 = 0;
  float v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__AVCaptureFigVideoDevice_flashMode__block_invoke;
  v5[3] = &unk_1E5A74078;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __36__AVCaptureFigVideoDevice_flashMode__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 736);
  return result;
}

- (BOOL)_isFlashScene
{
  id v2 = [(AVCaptureFigVideoDevice *)self _copyFigCaptureSourceProperty:*MEMORY[0x1E4F52028]];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)_setTorchActive:(BOOL)a3
{
  devicePropsQueue = self->_devicePropsQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __43__AVCaptureFigVideoDevice__setTorchActive___block_invoke;
  v4[3] = &unk_1E5A74028;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(devicePropsQueue, v4);
}

uint64_t __43__AVCaptureFigVideoDevice__setTorchActive___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 784) = *(unsigned char *)(result + 40);
  return result;
}

- (float)torchLevel
{
  uint64_t v6 = 0;
  float v7 = (float *)&v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__AVCaptureFigVideoDevice_torchLevel__block_invoke;
  v5[3] = &unk_1E5A74078;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  float v3 = v7[6];
  _Block_object_dispose(&v6, 8);
  return v3;
}

float __37__AVCaptureFigVideoDevice_torchLevel__block_invoke(uint64_t a1)
{
  float result = *(float *)(*(void *)(a1 + 32) + 788);
  *(float *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)_setTorchLevel:(float)a3
{
  uint64_t v9 = 0;
  double v10 = &v9;
  uint64_t v11 = 0x2020000000;
  devicePropsQueue = self->_devicePropsQueue;
  uint64_t v12 = -1;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__AVCaptureFigVideoDevice__setTorchLevel___block_invoke;
  block[3] = &unk_1E5A743C0;
  float v8 = a3;
  void block[4] = self;
  void block[5] = &v9;
  dispatch_sync(devicePropsQueue, block);
  if (v10[3] != -1)
  {
    [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"torchMode"];
    BOOL v5 = self->_devicePropsQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __42__AVCaptureFigVideoDevice__setTorchLevel___block_invoke_2;
    void v6[3] = &unk_1E5A73EF0;
    void v6[4] = self;
    v6[5] = &v9;
    dispatch_sync(v5, v6);
    [(AVCaptureFigVideoDevice *)self didChangeValueForKey:@"torchMode"];
  }
  _Block_object_dispose(&v9, 8);
}

uint64_t __42__AVCaptureFigVideoDevice__setTorchLevel___block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(result + 32) + 788) = *(_DWORD *)(result + 48);
  uint64_t v1 = *(void *)(*(void *)(result + 32) + 776);
  if (!v1)
  {
    if (*(float *)(result + 48) <= 0.0) {
      return result;
    }
    uint64_t v2 = 1;
    goto LABEL_7;
  }
  if (v1 == 1 && *(float *)(result + 48) == 0.0)
  {
    uint64_t v2 = 0;
LABEL_7:
    *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = v2;
  }
  return result;
}

uint64_t __42__AVCaptureFigVideoDevice__setTorchLevel___block_invoke_2(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 776) = *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24);
  return result;
}

- (void)_setTorchAvailable:(BOOL)a3
{
  devicePropsQueue = self->_devicePropsQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__AVCaptureFigVideoDevice__setTorchAvailable___block_invoke;
  v4[3] = &unk_1E5A74028;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(devicePropsQueue, v4);
}

uint64_t __46__AVCaptureFigVideoDevice__setTorchAvailable___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 792) = *(unsigned char *)(result + 40);
  return result;
}

- (int64_t)torchMode
{
  uint64_t v6 = 0;
  float v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__AVCaptureFigVideoDevice_torchMode__block_invoke;
  v5[3] = &unk_1E5A74078;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __36__AVCaptureFigVideoDevice_torchMode__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 776);
  return result;
}

- (BOOL)setTorchModeOnWithLevel:(float)a3 error:(id *)a4
{
  if (![(AVCaptureFigVideoDevice *)self isTorchModeSupported:1]
    || a3 != 3.4028e38 && (a3 <= 0.0 || a3 > 1.0))
  {
    double v10 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v11 = *MEMORY[0x1E4F1C3C8];
    objc_opt_class();
    goto LABEL_9;
  }
  *(float *)&double v7 = a3;
  int v8 = [(AVCaptureFigVideoDevice *)self _setTorchMode:1 withLevel:v7];
  int v9 = v8;
  if (!v8)
  {
    uint64_t v18 = 0;
    float v19 = &v18;
    uint64_t v20 = 0x2020000000;
    char v21 = 0;
    devicePropsQueue = self->_devicePropsQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__AVCaptureFigVideoDevice_setTorchModeOnWithLevel_error___block_invoke;
    block[3] = &unk_1E5A74078;
    void block[4] = self;
    void block[5] = &v18;
    dispatch_sync(devicePropsQueue, block);
    if (*((unsigned char *)v19 + 24))
    {
      [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"torchMode"];
      uint64_t v15 = self->_devicePropsQueue;
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __57__AVCaptureFigVideoDevice_setTorchModeOnWithLevel_error___block_invoke_2;
      v16[3] = &unk_1E5A72ED0;
      void v16[4] = self;
      dispatch_sync(v15, v16);
      [(AVCaptureFigVideoDevice *)self didChangeValueForKey:@"torchMode"];
    }
    _Block_object_dispose(&v18, 8);
    return v9 == 0;
  }
  if (v8 != -16452)
  {
    if (a4) {
      *a4 = (id)AVLocalizedErrorWithUnderlyingOSStatus();
    }
    return v9 == 0;
  }
  double v10 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v11 = *MEMORY[0x1E4F1C3A8];
  objc_opt_class();
LABEL_9:
  uint64_t v12 = (void *)[v10 exceptionWithName:v11 reason:AVMethodExceptionReasonWithClassAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v12);
  }
  NSLog(&cfstr_SuppressingExc.isa, v12);
  return 0;
}

uint64_t __57__AVCaptureFigVideoDevice_setTorchModeOnWithLevel_error___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 776) != 1;
  return result;
}

uint64_t __57__AVCaptureFigVideoDevice_setTorchModeOnWithLevel_error___block_invoke_2(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 776) = 1;
  return result;
}

- (BOOL)isSubjectAreaChangeMonitoringEnabled
{
  return BYTE1(self->_torchLevel);
}

- (BOOL)providesStortorgetMetadata
{
  return (BOOL)self->_sceneClassificationKVO;
}

- (void)setProvidesStortorgetMetadata:(BOOL)a3
{
  int v5 = -[AVCaptureFigVideoDevice _setFigCaptureSourceProperty:withValue:](self, "_setFigCaptureSourceProperty:withValue:", *MEMORY[0x1E4F520C8], objc_msgSend(NSNumber, "numberWithBool:"));
  if (v5 == -16452)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3A8];
    objc_opt_class();
    int v8 = (void *)[v6 exceptionWithName:v7 reason:AVMethodExceptionReasonWithClassAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v8);
    }
    NSLog(&cfstr_SuppressingExc.isa, v8);
  }
  else if (!v5)
  {
    LOBYTE(self->_sceneClassificationKVO) = a3;
  }
}

- (BOOL)isImageControlModeSupported:(int64_t)a3
{
  char v4 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_fcsAttributes, "objectForKeyedSubscript:", *MEMORY[0x1E4F51C70]), "BOOLValue");
  if ((unint64_t)(a3 - 5) < 2) {
    BOOL v5 = v4;
  }
  else {
    BOOL v5 = 0;
  }
  return (unint64_t)a3 < 5 || v5;
}

- (void)setImageControlMode:(int64_t)a3
{
  if (-[AVCaptureFigVideoDevice isImageControlModeSupported:](self, "isImageControlModeSupported:"))
  {
    if (!BYTE1(self->_sceneClassificationKVO))
    {
      int v13 = -[AVCaptureFigVideoDevice _setFigCaptureSourceProperty:withValue:](self, "_setFigCaptureSourceProperty:withValue:", *MEMORY[0x1E4F52078], [NSNumber numberWithInteger:a3]);
      if (v13 != -16452)
      {
        if (!v13)
        {
          devicePropsQueue = self->_devicePropsQueue;
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __47__AVCaptureFigVideoDevice_setImageControlMode___block_invoke;
          block[3] = &unk_1E5A72F98;
          void block[4] = self;
          void block[5] = a3;
          dispatch_sync(devicePropsQueue, block);
        }
        return;
      }
    }
    BOOL v5 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v6 = *MEMORY[0x1E4F1C3A8];
    objc_opt_class();
    uint64_t v7 = AVMethodExceptionReasonWithClassAndSelector();
    int v8 = v5;
    uint64_t v9 = v6;
  }
  else
  {
    double v10 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v11 = *MEMORY[0x1E4F1C3C8];
    objc_opt_class();
    int64_t v15 = a3;
    uint64_t v7 = AVMethodExceptionReasonWithClassAndSelector();
    int v8 = v10;
    uint64_t v9 = v11;
  }
  uint64_t v12 = objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, v7, 0, v15);
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v12);
  }
  NSLog(&cfstr_SuppressingExc.isa, v12);
}

uint64_t __47__AVCaptureFigVideoDevice_setImageControlMode___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 728) = *(void *)(result + 40);
  return result;
}

- (void)_setImageControlMode:(int64_t)a3
{
  uint64_t v9 = 0;
  double v10 = &v9;
  uint64_t v11 = 0x2020000000;
  devicePropsQueue = self->_devicePropsQueue;
  char v12 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__AVCaptureFigVideoDevice__setImageControlMode___block_invoke;
  block[3] = &unk_1E5A74230;
  void block[5] = &v9;
  void block[6] = a3;
  void block[4] = self;
  dispatch_sync(devicePropsQueue, block);
  if (*((unsigned char *)v10 + 24))
  {
    [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"imageControlMode"];
    uint64_t v6 = self->_devicePropsQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __48__AVCaptureFigVideoDevice__setImageControlMode___block_invoke_2;
    void v7[3] = &unk_1E5A72F98;
    v7[4] = self;
    v7[5] = a3;
    dispatch_sync(v6, v7);
    [(AVCaptureFigVideoDevice *)self didChangeValueForKey:@"imageControlMode"];
  }
  _Block_object_dispose(&v9, 8);
}

void *__48__AVCaptureFigVideoDevice__setImageControlMode___block_invoke(void *result)
{
  *(unsigned char *)(*(void *)(result[5] + 8) + 24) = result[6] != *(void *)(result[4] + 728);
  return result;
}

uint64_t __48__AVCaptureFigVideoDevice__setImageControlMode___block_invoke_2(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 728) = *(void *)(result + 40);
  return result;
}

- (id)runDiagnosticsWithTestType:(id)a3
{
  uint64_t v14 = 0;
  int64_t v15 = &v14;
  uint64_t v16 = 0x3052000000;
  uint64_t v17 = __Block_byref_object_copy__5;
  uint64_t v18 = __Block_byref_object_dispose__5;
  uint64_t v19 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__AVCaptureFigVideoDevice_runDiagnosticsWithTestType___block_invoke;
  block[3] = &unk_1E5A743E8;
  void block[4] = self;
  void block[5] = a3;
  void block[6] = &v10;
  void block[7] = &v14;
  dispatch_sync(devicePropsQueue, block);
  if (!*((unsigned char *)v11 + 24))
  {
    BOOL v5 = (void *)MEMORY[0x1E4F1CA00];
    objc_opt_class();
    uint64_t v6 = objc_msgSend(v5, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithClassAndSelector(), 0, a3);
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v6);
    }
    NSLog(&cfstr_SuppressingExc.isa, v6);
  }
  uint64_t v7 = (void *)v15[5];
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);
  return v7;
}

uint64_t __54__AVCaptureFigVideoDevice_runDiagnosticsWithTestType___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isDiagnosticsTestSupported:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    if (*(__CFString **)(a1 + 40) == @"AVCaptureDeviceDiagnosticsTestTypeAutoFocusPositionSensorCalibration")
    {
      uint64_t result = [*(id *)(a1 + 32) _copyFigCaptureSourceProperty:*MEMORY[0x1E4F51F38]];
      *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = result;
    }
  }
  return result;
}

- (BOOL)isDiagnosticsTestSupported:(id)a3
{
  if (@"AVCaptureDeviceDiagnosticsTestTypeAutoFocusPositionSensorCalibration" != a3) {
    return 0;
  }
  id v4 = [(NSDictionary *)self->_fcsAttributes objectForKeyedSubscript:*MEMORY[0x1E4F51AF8]];

  return [v4 BOOLValue];
}

- (CGRect)faceRectangle
{
  uint64_t v12 = 0;
  char v13 = (double *)&v12;
  uint64_t v14 = 0x4010000000;
  int64_t v15 = &unk_1A165D1D9;
  long long v16 = 0u;
  long long v17 = 0u;
  devicePropsQueue = self->_devicePropsQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __40__AVCaptureFigVideoDevice_faceRectangle__block_invoke;
  void v11[3] = &unk_1E5A74078;
  v11[4] = self;
  v11[5] = &v12;
  dispatch_sync(devicePropsQueue, v11);
  double v3 = v13[4];
  double v4 = v13[5];
  double v5 = v13[6];
  double v6 = v13[7];
  _Block_object_dispose(&v12, 8);
  double v7 = v3;
  double v8 = v4;
  double v9 = v5;
  double v10 = v6;
  result.size.height = v10;
  result.size.CGFloat width = v9;
  result.origin.CGFloat y = v8;
  result.origin.double x = v7;
  return result;
}

__n128 __40__AVCaptureFigVideoDevice_faceRectangle__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
  __n128 result = *(__n128 *)(*(void *)(a1 + 32) + 824);
  *(_OWORD *)(v1 + 32) = *(_OWORD *)(*(void *)(a1 + 32) + 808);
  *(__n128 *)(v1 + 48) = result;
  return result;
}

- (int)faceRectangleAngle
{
  uint64_t v6 = 0;
  double v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__AVCaptureFigVideoDevice_faceRectangleAngle__block_invoke;
  v5[3] = &unk_1E5A74078;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __45__AVCaptureFigVideoDevice_faceRectangleAngle__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(result + 32) + 840);
  return result;
}

- (BOOL)_isHighDynamicRangeScene
{
  id v2 = [(AVCaptureFigVideoDevice *)self _copyFigCaptureSourceProperty:*MEMORY[0x1E4F52080]];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)_setHDRSceneDetectedForPhotoOutput:(BOOL)a3
{
  devicePropsQueue = self->_devicePropsQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __62__AVCaptureFigVideoDevice__setHDRSceneDetectedForPhotoOutput___block_invoke;
  v4[3] = &unk_1E5A74028;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(devicePropsQueue, v4);
}

uint64_t __62__AVCaptureFigVideoDevice__setHDRSceneDetectedForPhotoOutput___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 847) = *(unsigned char *)(result + 40);
  return result;
}

- (BOOL)_isStillImageStabilizationScene
{
  id v2 = [(AVCaptureFigVideoDevice *)self _copyFigCaptureSourceProperty:*MEMORY[0x1E4F52088]];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (int64_t)_digitalFlashStatus
{
  id v2 = [(AVCaptureFigVideoDevice *)self _copyFigCaptureSourceProperty:*MEMORY[0x1E4F51FD8]];
  int64_t v3 = (int)[v2 intValue];

  return v3;
}

- (id)_digitalFlashExposureTimes
{
  id v2 = [(AVCaptureFigVideoDevice *)self _copyFigCaptureSourceProperty:*MEMORY[0x1E4F51FC8]];

  return v2;
}

- (void)_setDigitalFlashSceneForPhotoOutput:(id)a3
{
  devicePropsQueue = self->_devicePropsQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __63__AVCaptureFigVideoDevice__setDigitalFlashSceneForPhotoOutput___block_invoke;
  v4[3] = &unk_1E5A72D70;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_sync(devicePropsQueue, v4);
}

id __63__AVCaptureFigVideoDevice__setDigitalFlashSceneForPhotoOutput___block_invoke(uint64_t a1)
{
  id result = *(id *)(a1 + 40);
  *(void *)(*(void *)(a1 + 32) + 760) = result;
  return result;
}

- (float)timeLapseCaptureRate
{
  id v2 = [(AVCaptureFigVideoDevice *)self _copyFigCaptureSourceProperty:*MEMORY[0x1E4F52140]];

  [v2 floatValue];
  return result;
}

- (void)setTimeLapseCaptureRate:(float)a3
{
  uint64_t v4 = *MEMORY[0x1E4F52140];
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithFloat:");

  [(AVCaptureFigVideoDevice *)self _setFigCaptureSourceProperty:v4 withValue:v5];
}

- (void)setUltraHighResolutionZeroShutterLagEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(AVCaptureFigVideoDevice *)self lockForConfiguration:0])
  {
    -[AVCaptureFigVideoDevice _setFigCaptureSourceProperty:withValue:](self, "_setFigCaptureSourceProperty:withValue:", *MEMORY[0x1E4F52160], [NSNumber numberWithBool:v3]);
    [(AVCaptureFigVideoDevice *)self unlockForConfiguration];
  }
}

- (BOOL)isMachineReadableCodeDetectionSupported
{
  return 1;
}

- (void)setVideoZoomRampAcceleration:(float)a3
{
  int v5 = -[AVCaptureFigVideoDevice _setFigCaptureSourceProperty:withValue:](self, "_setFigCaptureSourceProperty:withValue:", *MEMORY[0x1E4F52178], objc_msgSend(NSNumber, "numberWithFloat:"));
  if (v5 == -16452)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3A8];
    objc_opt_class();
    uint64_t v8 = (void *)[v6 exceptionWithName:v7 reason:AVMethodExceptionReasonWithClassAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v8);
    }
    NSLog(&cfstr_SuppressingExc.isa, v8);
  }
  else if (!v5)
  {
    self->_videoZoomRampTarget = a3;
  }
}

- (void)rampToVideoZoomFactor:(double)a3 withRate:(float)a4
{
}

- (void)rampExponentiallyToVideoZoomFactor:(float)a3 withDuration:(double)a4
{
  if (a4 == 0.0)
  {
    int v5 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v6 = *MEMORY[0x1E4F1C4A8];
    objc_opt_class();
    uint64_t v7 = (void *)[v5 exceptionWithName:v6 reason:AVMethodExceptionReasonWithClassAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v7);
    }
    NSLog(&cfstr_SuppressingExc.isa, v7);
  }
  else
  {
    double v4 = a3;
    [(AVCaptureFigVideoDevice *)self _rampToVideoZoomFactor:2 withRate:0 duration:v4 rampType:0.0 rampTuning:a4];
  }
}

- (void)rampToVideoZoomFactor:(float)a3 withTuning:(int64_t)a4
{
  if ((unint64_t)a4 >= 3)
  {
    int v5 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v6 = *MEMORY[0x1E4F1C4A8];
    objc_opt_class();
    uint64_t v7 = (void *)[v5 exceptionWithName:v6 reason:AVMethodExceptionReasonWithClassAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v7);
    }
    NSLog(&cfstr_SuppressingExc.isa, v7);
  }
  else
  {
    double v4 = a3;
    [(AVCaptureFigVideoDevice *)self _rampToVideoZoomFactor:3 withRate:a4 duration:v4 rampType:0.0 rampTuning:1.0];
  }
}

- (void)_rampToVideoZoomFactor:(double)a3 withRate:(float)a4 duration:(double)a5 rampType:(int)a6 rampTuning:(int)a7
{
  void v52[6] = *MEMORY[0x1E4F143B8];
  if (a3 >= 1.0
    && (uint64_t v8 = *(void *)&a7,
        uint64_t v9 = *(void *)&a6,
        objc_msgSend(-[AVCaptureFigVideoDevice activeFormat](self, "activeFormat"), "videoMaxZoomFactor"),
        v13 >= a3))
  {
    uint64_t v47 = 0;
    uint64_t v48 = &v47;
    uint64_t v49 = 0x2020000000;
    char v50 = 0;
    uint64_t v43 = 0;
    char v44 = &v43;
    uint64_t v45 = 0x2020000000;
    char v46 = 0;
    uint64_t v39 = 0;
    double v40 = &v39;
    uint64_t v41 = 0x2020000000;
    char v42 = 0;
    uint64_t v35 = 0;
    float v36 = &v35;
    uint64_t v37 = 0x2020000000;
    int v38 = 0;
    uint64_t v31 = 0;
    double v32 = (double *)&v31;
    uint64_t v33 = 0x2020000000;
    double v34 = a3;
    devicePropsQueue = self->_devicePropsQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __88__AVCaptureFigVideoDevice__rampToVideoZoomFactor_withRate_duration_rampType_rampTuning___block_invoke;
    block[3] = &unk_1E5A74410;
    void block[4] = self;
    void block[5] = &v31;
    void block[6] = &v47;
    void block[7] = &v43;
    float v30 = a4;
    *(double *)&void block[10] = a5;
    void block[8] = &v35;
    block[9] = &v39;
    dispatch_sync(devicePropsQueue, block);
    if (!LOBYTE(self->_stereoVideoCaptureStatus)
      || self->_continuousZoomWithDepthActive
      || self->_cinematicVideoZoomEnabled)
    {
      if (*((unsigned char *)v44 + 24) && (*((unsigned char *)v48 + 24) || !*((unsigned char *)v40 + 24)))
      {
        v51[0] = *MEMORY[0x1E4F52240];
        v52[0] = [NSNumber numberWithDouble:v32[3]];
        v51[1] = *MEMORY[0x1E4F52258];
        *(float *)&double v18 = a4;
        v52[1] = [NSNumber numberWithFloat:v18];
        v51[2] = *MEMORY[0x1E4F52250];
        v52[2] = [NSNumber numberWithDouble:a5];
        void v51[3] = *MEMORY[0x1E4F52268];
        v52[3] = [NSNumber numberWithInt:v9];
        v51[4] = *MEMORY[0x1E4F52260];
        v52[4] = [NSNumber numberWithInt:v8];
        v51[5] = *MEMORY[0x1E4F52248];
        v52[5] = [NSNumber numberWithInt:*((unsigned int *)v36 + 6)];
        uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:v51 count:6];
        int v20 = [(AVCaptureFigVideoDevice *)self _setFigCaptureSourceProperty:*MEMORY[0x1E4F52170] withValue:v19];
        if (v20)
        {
          if (v20 == -16452)
          {
            char v21 = (void *)MEMORY[0x1E4F1CA00];
            objc_opt_class();
            double v22 = (void *)[v21 exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:AVMethodExceptionReasonWithClassAndSelector() userInfo:0];
            if (AVCaptureShouldThrowForAPIViolations()) {
              objc_exception_throw(v22);
            }
            NSLog(&cfstr_SuppressingExc.isa, v22);
          }
        }
        else
        {
          if (!*((unsigned char *)v48 + 24)) {
            [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"rampingVideoZoom"];
          }
          unsigned int v25 = self->_devicePropsQueue;
          v26[0] = MEMORY[0x1E4F143A8];
          v26[1] = 3221225472;
          v26[2] = __88__AVCaptureFigVideoDevice__rampToVideoZoomFactor_withRate_duration_rampType_rampTuning___block_invoke_4;
          v26[3] = &unk_1E5A73EF0;
          v26[4] = self;
          v26[5] = &v31;
          dispatch_sync(v25, v26);
          if (!*((unsigned char *)v48 + 24)) {
            [(AVCaptureFigVideoDevice *)self didChangeValueForKey:@"rampingVideoZoom"];
          }
        }
      }
      else
      {
        [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"rampingVideoZoom"];
        double v23 = self->_devicePropsQueue;
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __88__AVCaptureFigVideoDevice__rampToVideoZoomFactor_withRate_duration_rampType_rampTuning___block_invoke_2;
        v28[3] = &unk_1E5A73EF0;
        v28[4] = self;
        v28[5] = &v31;
        dispatch_sync(v23, v28);
        [(AVCaptureFigVideoDevice *)self didChangeValueForKey:@"rampingVideoZoom"];
        [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"rampingVideoZoom"];
        float v24 = self->_devicePropsQueue;
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __88__AVCaptureFigVideoDevice__rampToVideoZoomFactor_withRate_duration_rampType_rampTuning___block_invoke_3;
        v27[3] = &unk_1E5A72ED0;
        v27[4] = self;
        dispatch_sync(v24, v27);
        [(AVCaptureFigVideoDevice *)self didChangeValueForKey:@"rampingVideoZoom"];
      }
    }
    else
    {
      [(AVCaptureFigVideoDevice *)self setVideoZoomFactor:v32[3]];
    }
    _Block_object_dispose(&v31, 8);
    _Block_object_dispose(&v35, 8);
    _Block_object_dispose(&v39, 8);
    _Block_object_dispose(&v43, 8);
    _Block_object_dispose(&v47, 8);
  }
  else
  {
    uint64_t v14 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v15 = *MEMORY[0x1E4F1C4A8];
    objc_opt_class();
    long long v16 = objc_msgSend(v14, "exceptionWithName:reason:userInfo:", v15, AVMethodExceptionReasonWithClassAndSelector(), 0, *(void *)&a3);
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v16);
    }
    NSLog(&cfstr_SuppressingExc.isa, v16);
  }
}

uint64_t __88__AVCaptureFigVideoDevice__rampToVideoZoomFactor_withRate_duration_rampType_rampTuning___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  uint64_t v2 = *(void *)(*(void *)(result + 40) + 8);
  double v3 = *(double *)(v2 + 24);
  double v4 = *(double *)(v1 + 880);
  if (v3 < v4)
  {
    *(double *)(v2 + 24) = v4;
    uint64_t v1 = *(void *)(result + 32);
    uint64_t v2 = *(void *)(*(void *)(result + 40) + 8);
    double v3 = *(double *)(v2 + 24);
  }
  double v5 = *(double *)(v1 + 888);
  if (v3 > v5)
  {
    *(double *)(v2 + 24) = v5;
    uint64_t v1 = *(void *)(result + 32);
  }
  *(unsigned char *)(*(void *)(*(void *)(result + 48) + 8) + 24) = *(float *)(v1 + 868) != 0.0;
  BOOL v6 = *(float *)(result + 88) != 0.0
    || *(double *)(result + 80) != 0.0
    || *(unsigned char *)(*(void *)(*(void *)(result + 48) + 8) + 24) != 0;
  *(unsigned char *)(*(void *)(*(void *)(result + 56) + 8) + 24) = v6;
  *(_DWORD *)(*(void *)(*(void *)(result + 64) + 8) + 24) = ++*(_DWORD *)(*(void *)(result + 32) + 872);
  *(unsigned char *)(*(void *)(*(void *)(result + 72) + 8) + 24) = *(double *)(*(void *)(*(void *)(result + 40) + 8)
                                                                             + 24) == *(float *)(*(void *)(result + 32)
                                                                                                 + 864);
  return result;
}

float __88__AVCaptureFigVideoDevice__rampToVideoZoomFactor_withRate_duration_rampType_rampTuning___block_invoke_2(uint64_t a1)
{
  float result = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  *(float *)(*(void *)(a1 + 32) + 868) = result;
  return result;
}

uint64_t __88__AVCaptureFigVideoDevice__rampToVideoZoomFactor_withRate_duration_rampType_rampTuning___block_invoke_3(uint64_t result)
{
  *(_DWORD *)(*(void *)(result + 32) + 868) = 0;
  return result;
}

float __88__AVCaptureFigVideoDevice__rampToVideoZoomFactor_withRate_duration_rampType_rampTuning___block_invoke_4(uint64_t a1)
{
  float result = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  *(float *)(*(void *)(a1 + 32) + 868) = result;
  return result;
}

- (void)cancelVideoZoomRamp
{
  uint64_t v6 = 0;
  uint64_t v7 = (float *)&v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__AVCaptureFigVideoDevice_cancelVideoZoomRamp__block_invoke;
  v5[3] = &unk_1E5A74078;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  float v4 = v7[6];
  if (v4 != 0.0) {
    [(AVCaptureFigVideoDevice *)self rampToVideoZoomFactor:v4 withRate:0.0];
  }
  _Block_object_dispose(&v6, 8);
}

float __46__AVCaptureFigVideoDevice_cancelVideoZoomRamp__block_invoke(uint64_t a1)
{
  float result = *(float *)(*(void *)(a1 + 32) + 868);
  *(float *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (double)dualCameraSwitchOverVideoZoomFactor
{
  id v2 = [(NSDictionary *)self->_fcsAttributes objectForKeyedSubscript:*MEMORY[0x1E4F51B08]];
  if (![v2 count]) {
    return 1.0;
  }
  objc_msgSend((id)objc_msgSend(v2, "firstObject"), "floatValue");
  return v3;
}

double *__59__AVCaptureFigVideoDevice__setMinAvailableVideoZoomFactor___block_invoke_2(double *result)
{
  *(double *)(*((void *)result + 4) + 880) = result[6];
  if (result[6] > *(float *)(*((void *)result + 4) + 864)) {
    *(unsigned char *)(*(void *)(*((void *)result + 5) + 8) + 24) = 1;
  }
  return result;
}

- (double)maxAvailableVideoZoomFactor
{
  uint64_t v6 = 0;
  uint64_t v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__AVCaptureFigVideoDevice_maxAvailableVideoZoomFactor__block_invoke;
  v5[3] = &unk_1E5A74078;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

double __54__AVCaptureFigVideoDevice_maxAvailableVideoZoomFactor__block_invoke(uint64_t a1)
{
  double result = *(double *)(*(void *)(a1 + 32) + 888);
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setMaxAvailableVideoZoomFactorOverride:(double)a3
{
  if (a3 != 0.0 && a3 < 1.0)
  {
    float v4 = objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector(), 0, *(void *)&a3);
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v4);
    }
    NSLog(&cfstr_SuppressingExc.isa, v4);
  }
  else if (self->_minAvailableVideoZoomFactor != a3)
  {
    self->_double maxAvailableVideoZoomFactor = a3;
    [(AVCaptureFigVideoDevice *)self _updateMinMaxDefaultVideoZoomFactors];
  }
}

- (double)maxAvailableVideoZoomFactorOverride
{
  uint64_t v6 = 0;
  uint64_t v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __62__AVCaptureFigVideoDevice_maxAvailableVideoZoomFactorOverride__block_invoke;
  v5[3] = &unk_1E5A74078;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

double __62__AVCaptureFigVideoDevice_maxAvailableVideoZoomFactorOverride__block_invoke(uint64_t a1)
{
  double result = *(double *)(*(void *)(a1 + 32) + 896);
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)_updateMinMaxVideoZoomFactorsWithMinZoomFactorFromCameraSelection:(double)a3
{
  uint64_t v7 = 0;
  double v8 = 0.0;
  uint64_t v6 = 0;
  [(AVCaptureFigVideoDevice *)self _computeMinVideoZoomFactorOut:&v8 maxVideoZoomFactorOut:&v7 defaultVideoZoomFactorOut:&v6 centerStageActiveOverride:BYTE4(self->_degradedCaptureQualityFactors) resetZoomFactor:0];
  double v5 = v8;
  if (v8 <= a3) {
    double v5 = a3;
  }
  double v8 = v5;
  -[AVCaptureFigVideoDevice _setMinAvailableVideoZoomFactor:](self, "_setMinAvailableVideoZoomFactor:");
}

- (void)_resetDefaultVideoZoomFactor
{
  uint64_t v4 = 0;
  uint64_t v5 = 0;
  double v3 = 0.0;
  [(AVCaptureFigVideoDevice *)self _computeMinVideoZoomFactorOut:&v5 maxVideoZoomFactorOut:&v4 defaultVideoZoomFactorOut:&v3 centerStageActiveOverride:BYTE4(self->_degradedCaptureQualityFactors) resetZoomFactor:1];
  [(AVCaptureFigVideoDevice *)self _setVideoZoomFactor:v3];
}

- (void)setGeometricDistortionCorrectionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(AVCaptureFigVideoDevice *)self isLockedForConfiguration])
  {
    if (!v3
      || [(AVCaptureFigVideoDevice *)self isGeometricDistortionCorrectionSupported])
    {
      uint64_t v11 = 0;
      uint64_t v12 = &v11;
      uint64_t v13 = 0x2020000000;
      devicePropsQueue = self->_devicePropsQueue;
      char v14 = 0;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __67__AVCaptureFigVideoDevice_setGeometricDistortionCorrectionEnabled___block_invoke;
      block[3] = &unk_1E5A74208;
      void block[4] = self;
      void block[5] = &v11;
      BOOL v10 = v3;
      dispatch_sync(devicePropsQueue, block);
      if (*((unsigned char *)v12 + 24)) {
        [(AVCaptureFigVideoDevice *)self _updateCenterStageActiveForEnabled:+[AVCaptureDevice isCenterStageEnabled] updateDependentProperties:1];
      }
      _Block_object_dispose(&v11, 8);
      return;
    }
    uint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
    objc_opt_class();
  }
  else
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3A8];
    objc_opt_class();
  }
  double v8 = (void *)[v6 exceptionWithName:v7 reason:AVMethodExceptionReasonWithClassAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v8);
  }
  NSLog(&cfstr_SuppressingExc.isa, v8);
}

uint64_t __67__AVCaptureFigVideoDevice_setGeometricDistortionCorrectionEnabled___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned __int8 *)(*(void *)(result + 32) + 1176) != *(unsigned __int8 *)(result + 48);
  *(unsigned char *)(*(void *)(result + 32) + 1176) = *(unsigned char *)(result + 48);
  return result;
}

- (id)cameraPoseMatrix
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__5;
  BOOL v10 = __Block_byref_object_dispose__5;
  uint64_t v11 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__AVCaptureFigVideoDevice_cameraPoseMatrix__block_invoke;
  v5[3] = &unk_1E5A73EF0;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  BOOL v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __43__AVCaptureFigVideoDevice_cameraPoseMatrix__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isVirtualDevice];
  if ((result & 1) == 0)
  {
    BOOL v3 = (__CFString *)[*(id *)(a1 + 32) deviceType];
    uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 1200);
    if (v4) {
      BOOL v5 = v3 == @"AVCaptureDeviceTypeBuiltInTimeOfFlightCamera";
    }
    else {
      BOOL v5 = 1;
    }
    if (v5)
    {

      *(void *)(*(void *)(a1 + 32) + 1200) = [*(id *)(a1 + 32) _copyFigCaptureSourceProperty:*MEMORY[0x1E4F51F80]];
      uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 1200);
    }
    uint64_t result = v4;
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  }
  return result;
}

uint64_t __88__AVCaptureFigVideoDevice__updateCenterStageActiveForEnabled_updateDependentProperties___block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 1220) = *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24);
  return result;
}

- (CGRect)centerStageRectOfInterest
{
  uint64_t v13 = 0;
  char v14 = (double *)&v13;
  uint64_t v15 = 0x4010000000;
  long long v16 = &unk_1A165D1D9;
  long long v2 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
  long long v17 = *MEMORY[0x1E4F1DB20];
  long long v18 = v2;
  devicePropsQueue = self->_devicePropsQueue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __52__AVCaptureFigVideoDevice_centerStageRectOfInterest__block_invoke;
  void v12[3] = &unk_1E5A74078;
  v12[4] = self;
  v12[5] = &v13;
  dispatch_sync(devicePropsQueue, v12);
  double v4 = v14[4];
  double v5 = v14[5];
  double v6 = v14[6];
  double v7 = v14[7];
  _Block_object_dispose(&v13, 8);
  double v8 = v4;
  double v9 = v5;
  double v10 = v6;
  double v11 = v7;
  result.size.height = v11;
  result.size.CGFloat width = v10;
  result.origin.CGFloat y = v9;
  result.origin.double x = v8;
  return result;
}

__n128 __52__AVCaptureFigVideoDevice_centerStageRectOfInterest__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
  __n128 result = *(__n128 *)(*(void *)(a1 + 32) + 1240);
  *(_OWORD *)(v1 + 32) = *(_OWORD *)(*(void *)(a1 + 32) + 1224);
  *(__n128 *)(v1 + 48) = result;
  return result;
}

- (void)setCenterStageRectOfInterest:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if ([(AVCaptureFigVideoDevice *)self isLockedForConfiguration])
  {
    if (+[AVCaptureDevice isCenterStageEnabled]
      && validRectInUnitRectCoordinateSpace(x, y, width, height))
    {
      devicePropsQueue = self->_devicePropsQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __56__AVCaptureFigVideoDevice_setCenterStageRectOfInterest___block_invoke;
      block[3] = &unk_1E5A74460;
      *(CGFloat *)&void block[5] = x;
      *(CGFloat *)&void block[6] = y;
      *(CGFloat *)&void block[7] = width;
      *(CGFloat *)&void block[8] = height;
      void block[4] = self;
      dispatch_sync(devicePropsQueue, block);
      return;
    }
    double v9 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v10 = *MEMORY[0x1E4F1C3C8];
    objc_opt_class();
  }
  else
  {
    double v9 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v10 = *MEMORY[0x1E4F1C3A8];
    objc_opt_class();
  }
  double v11 = (void *)[v9 exceptionWithName:v10 reason:AVMethodExceptionReasonWithClassAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v11);
  }
  NSLog(&cfstr_SuppressingExc.isa, v11);
}

void __56__AVCaptureFigVideoDevice_setCenterStageRectOfInterest___block_invoke(uint64_t a1)
{
  long long v2 = (id *)(a1 + 40);
  CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(*(CGRect *)(a1 + 40));
  if (![*(v2 - 1) _setFigCaptureSourceProperty:*MEMORY[0x1E4F51FA0] withValue:DictionaryRepresentation])
  {
    double v4 = (_OWORD *)(*(void *)(a1 + 32) + 1224);
    long long v5 = *((_OWORD *)v2 + 1);
    *double v4 = *(_OWORD *)v2;
    v4[1] = v5;
  }

  CFRelease(DictionaryRepresentation);
}

- (BOOL)_centerStageRectOfInterestSupportedOnDevice
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  formats = self->_formats;
  if (formats)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    uint64_t v3 = [(NSArray *)formats countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v9;
      while (2)
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v9 != v5) {
            objc_enumerationMutation(formats);
          }
          if (objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v6), "figCaptureSourceVideoFormat"), "isCenterStageRectOfInterestSupported"))
          {
            LOBYTE(v3) = 1;
            return v3;
          }
          ++v6;
        }
        while (v4 != v6);
        uint64_t v3 = [(NSArray *)formats countByEnumeratingWithState:&v8 objects:v12 count:16];
        uint64_t v4 = v3;
        if (v3) {
          continue;
        }
        break;
      }
    }
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)isCenterStageMetadataDeliveryEnabled
{
  uint64_t v6 = 0;
  double v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63__AVCaptureFigVideoDevice_isCenterStageMetadataDeliveryEnabled__block_invoke;
  v5[3] = &unk_1E5A74078;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __63__AVCaptureFigVideoDevice_isCenterStageMetadataDeliveryEnabled__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 1256);
  return result;
}

- (void)setCenterStageMetadataDeliveryEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(AVCaptureFigVideoDevice *)self isLockedForConfiguration])
  {
    if (!v3
      || [(AVCaptureFigVideoDevice *)self isCenterStageMetadataDeliverySupported])
    {
      devicePropsQueue = self->_devicePropsQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __65__AVCaptureFigVideoDevice_setCenterStageMetadataDeliveryEnabled___block_invoke;
      block[3] = &unk_1E5A74028;
      void block[4] = self;
      BOOL v15 = v3;
      dispatch_sync(devicePropsQueue, block);
      return;
    }
    long long v11 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v12 = *MEMORY[0x1E4F1C3C8];
    uint64_t v8 = AVMethodExceptionReasonWithObjectAndSelector();
    char v9 = v11;
    uint64_t v10 = v12;
  }
  else
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3A8];
    objc_opt_class();
    uint64_t v8 = AVMethodExceptionReasonWithClassAndSelector();
    char v9 = v6;
    uint64_t v10 = v7;
  }
  uint64_t v13 = (void *)[v9 exceptionWithName:v10 reason:v8 userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v13);
  }
  NSLog(&cfstr_SuppressingExc.isa, v13);
}

uint64_t __65__AVCaptureFigVideoDevice_setCenterStageMetadataDeliveryEnabled___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_setFigCaptureSourceProperty:withValue:", *MEMORY[0x1E4F51F98], objc_msgSend(NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 40)));
  if (!result) {
    *(unsigned char *)(*(void *)(a1 + 32) + 1256) = *(unsigned char *)(a1 + 40);
  }
  return result;
}

- (void)_setCenterStageFramingMode:(int64_t)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  devicePropsQueue = self->_devicePropsQueue;
  int v9 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__AVCaptureFigVideoDevice__setCenterStageFramingMode___block_invoke;
  block[3] = &unk_1E5A74050;
  void block[4] = self;
  void block[5] = &v6;
  void block[6] = a3;
  dispatch_sync(devicePropsQueue, block);
  if (*((_DWORD *)v7 + 6) && dword_1EB4C9280)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  _Block_object_dispose(&v6, 8);
}

uint64_t __54__AVCaptureFigVideoDevice__setCenterStageFramingMode___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) lockForConfiguration:0];
  if (result)
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_setFigCaptureSourceProperty:withValue:", *MEMORY[0x1E4F51F90], objc_msgSend(NSNumber, "numberWithInteger:", *(void *)(a1 + 48)));
    BOOL v3 = *(void **)(a1 + 32);
    return [v3 unlockForConfiguration];
  }
  return result;
}

- (BOOL)isManualFramingSupported
{
  return BYTE2(self->_deskViewCameraMode);
}

- (double)displayVideoZoomFactorMultiplier
{
  uint64_t v6 = 0;
  uint64_t v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0x3FF0000000000000;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__AVCaptureFigVideoDevice_displayVideoZoomFactorMultiplier__block_invoke;
  v5[3] = &unk_1E5A74078;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

double __59__AVCaptureFigVideoDevice_displayVideoZoomFactorMultiplier__block_invoke(uint64_t a1)
{
  double result = *(double *)(*(void *)(a1 + 32) + 912);
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setManualFramingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(AVCaptureFigVideoDevice *)self isLockedForConfiguration])
  {
    if (!v3
      || [(AVCaptureFigVideoDevice *)self isManualFramingSupported]
      && !BYTE4(self->_degradedCaptureQualityFactors))
    {
      devicePropsQueue = self->_devicePropsQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __51__AVCaptureFigVideoDevice_setManualFramingEnabled___block_invoke;
      block[3] = &unk_1E5A74028;
      void block[4] = self;
      BOOL v10 = v3;
      dispatch_sync(devicePropsQueue, block);
      return;
    }
    uint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v6 = *MEMORY[0x1E4F1C3C8];
    objc_opt_class();
  }
  else
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v6 = *MEMORY[0x1E4F1C3A8];
    objc_opt_class();
  }
  uint64_t v8 = (void *)[v5 exceptionWithName:v6 reason:AVMethodExceptionReasonWithClassAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v8);
  }
  NSLog(&cfstr_SuppressingExc.isa, v8);
}

uint64_t __51__AVCaptureFigVideoDevice_setManualFramingEnabled___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 1307) = *(unsigned char *)(result + 40);
  return result;
}

- (double)manualFramingMinZoomFactor
{
  uint64_t v6 = 0;
  uint64_t v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__AVCaptureFigVideoDevice_manualFramingMinZoomFactor__block_invoke;
  v5[3] = &unk_1E5A74078;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

double __53__AVCaptureFigVideoDevice_manualFramingMinZoomFactor__block_invoke(uint64_t a1)
{
  double result = *(double *)(*(void *)(a1 + 32) + 1320);
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (double)manualFramingMaxZoomFactor
{
  uint64_t v6 = 0;
  uint64_t v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__AVCaptureFigVideoDevice_manualFramingMaxZoomFactor__block_invoke;
  v5[3] = &unk_1E5A74078;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

double __53__AVCaptureFigVideoDevice_manualFramingMaxZoomFactor__block_invoke(uint64_t a1)
{
  double result = *(double *)(*(void *)(a1 + 32) + 1328);
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (double)manualFramingDefaultZoomFactor
{
  uint64_t v6 = 0;
  uint64_t v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__AVCaptureFigVideoDevice_manualFramingDefaultZoomFactor__block_invoke;
  v5[3] = &unk_1E5A74078;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

double __57__AVCaptureFigVideoDevice_manualFramingDefaultZoomFactor__block_invoke(uint64_t a1)
{
  double result = *(double *)(*(void *)(a1 + 32) + 1336);
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setGazeSelectionEnabled:(BOOL)a3
{
  devicePropsQueue = self->_devicePropsQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__AVCaptureFigVideoDevice_setGazeSelectionEnabled___block_invoke;
  v4[3] = &unk_1E5A74028;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(devicePropsQueue, v4);
}

uint64_t __51__AVCaptureFigVideoDevice_setGazeSelectionEnabled___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 1344) = *(unsigned char *)(result + 40);
  return result;
}

uint64_t __65__AVCaptureFigVideoDevice__updateBackgroundBlurActiveForEnabled___block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 1258) = *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24);
  return result;
}

uint64_t __65__AVCaptureFigVideoDevice__updateStudioLightingActiveForEnabled___block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 1261) = *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24);
  return result;
}

- (void)_performReaction:(id)a3
{
  fcsQueue = self->_fcsQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__AVCaptureFigVideoDevice__performReaction___block_invoke;
  v4[3] = &unk_1E5A72D70;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(fcsQueue, v4);
}

uint64_t __44__AVCaptureFigVideoDevice__performReaction___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 40);
  uint64_t v2 = *(void *)(*(void *)(result + 32) + 56);
  if (v2 && (VTable = CMBaseObjectGetVTable(), v5 = *(void **)(VTable + 16), double result = VTable + 16, (v4 = v5) != 0)) {
    uint64_t v6 = v4;
  }
  else {
    uint64_t v6 = 0;
  }
  if (*v6 >= 4uLL)
  {
    uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))v6[11];
    if (v7)
    {
      return v7(v2, v1);
    }
  }
  return result;
}

- (void)_updateBackgroundReplacementActiveForEnabled:(BOOL)a3
{
  uint64_t v13 = 0;
  char v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  uint64_t v9 = 0;
  BOOL v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__AVCaptureFigVideoDevice__updateBackgroundReplacementActiveForEnabled___block_invoke;
  block[3] = &unk_1E5A740C8;
  void block[4] = self;
  void block[5] = &v13;
  void block[6] = &v9;
  BOOL v8 = a3;
  dispatch_sync(devicePropsQueue, block);
  if (*((unsigned __int8 *)v14 + 24) != *((unsigned __int8 *)v10 + 24))
  {
    [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"backgroundReplacementActive"];
    BOOL v5 = self->_devicePropsQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __72__AVCaptureFigVideoDevice__updateBackgroundReplacementActiveForEnabled___block_invoke_2;
    void v6[3] = &unk_1E5A73EF0;
    void v6[4] = self;
    v6[5] = &v9;
    dispatch_sync(v5, v6);
    [(AVCaptureFigVideoDevice *)self didChangeValueForKey:@"backgroundReplacementActive"];
  }
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);
}

uint64_t __72__AVCaptureFigVideoDevice__updateBackgroundReplacementActiveForEnabled___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(unsigned char *)(*(void *)(a1 + 32) + 1267);
  uint64_t result = [*(id *)(a1 + 32) _isBackgroundReplacementActiveForEnabled:*(unsigned __int8 *)(a1 + 56)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

uint64_t __72__AVCaptureFigVideoDevice__updateBackgroundReplacementActiveForEnabled___block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 1267) = *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24);
  return result;
}

- (void)_updateBackgroundReplacementPixelBuffer:(__CVBuffer *)a3
{
  devicePropsQueue = self->_devicePropsQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __67__AVCaptureFigVideoDevice__updateBackgroundReplacementPixelBuffer___block_invoke;
  v4[3] = &unk_1E5A72F98;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_sync(devicePropsQueue, v4);
}

uint64_t __67__AVCaptureFigVideoDevice__updateBackgroundReplacementPixelBuffer___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) lockForConfiguration:0];
  if (result)
  {
    [*(id *)(a1 + 32) _setFigCaptureSourcePixelBufferProperty:*MEMORY[0x1E4F51F58] withValue:*(void *)(a1 + 40)];
    double v3 = *(void **)(a1 + 32);
    return [v3 unlockForConfiguration];
  }
  return result;
}

- (void)setVideoHDREnabled:(BOOL)a3
{
  if ([(AVCaptureFigVideoDevice *)self isLockedForConfiguration]
    && ![(AVCaptureFigVideoDevice *)self automaticallyAdjustsVideoHDREnabled])
  {
    devicePropsQueue = self->_devicePropsQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__AVCaptureFigVideoDevice_setVideoHDREnabled___block_invoke;
    block[3] = &unk_1E5A74000;
    void block[4] = self;
    void block[5] = a2;
    BOOL v11 = a3;
    dispatch_sync(devicePropsQueue, block);
  }
  else
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3A8];
    objc_opt_class();
    BOOL v8 = (void *)[v6 exceptionWithName:v7 reason:AVMethodExceptionReasonWithClassAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v8);
    }
    NSLog(&cfstr_SuppressingExc.isa, v8);
  }
}

void __46__AVCaptureFigVideoDevice_setVideoHDREnabled___block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 144) isVideoHDRSupported])
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 845) = *(unsigned char *)(a1 + 48);
  }
  else
  {
    uint64_t v2 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v3 = *MEMORY[0x1E4F1C3C8];
    objc_opt_class();
    uint64_t v4 = (void *)[v2 exceptionWithName:v3 reason:AVMethodExceptionReasonWithClassAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v4);
    }
    NSLog(&cfstr_SuppressingExc.isa, v4);
  }
}

uint64_t __50__AVCaptureFigVideoDevice__resetVideoHDRSuspended__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _setFigCaptureSourceProperty:*MEMORY[0x1E4F52168] withValue:MEMORY[0x1E4F1CC28]];
  if (!result) {
    *(unsigned char *)(*(void *)(a1 + 32) + 846) = 0;
  }
  return result;
}

- (BOOL)isSISSupported
{
  id v2 = [(NSDictionary *)self->_fcsAttributes objectForKeyedSubscript:*MEMORY[0x1E4F51C48]];

  return [v2 BOOLValue];
}

- (void)_setStillImageStabilizationAutomaticallyEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(AVCaptureFigVideoDevice *)self lockForConfiguration:0])
  {
    -[AVCaptureFigVideoDevice _setFigCaptureSourceProperty:withValue:](self, "_setFigCaptureSourceProperty:withValue:", *MEMORY[0x1E4F52108], [NSNumber numberWithBool:v3]);
    [(AVCaptureFigVideoDevice *)self unlockForConfiguration];
  }
}

- (id)spatialCaptureDiscomfortReasons
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__5;
  BOOL v10 = __Block_byref_object_dispose__5;
  uint64_t v11 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__AVCaptureFigVideoDevice_spatialCaptureDiscomfortReasons__block_invoke;
  v5[3] = &unk_1E5A74078;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  BOOL v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __58__AVCaptureFigVideoDevice_spatialCaptureDiscomfortReasons__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F1CAD0] setWithSet:*(void *)(*(void *)(a1 + 32) + 928)];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)_updateSpatialCaptureStatus:(unint64_t)a3
{
  unint64_t v3 = a3 & 7;
  if (((uint64_t)self->_spatialCaptureDiscomfortReasons & 7) != v3)
  {
    char v4 = a3;
    [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"spatialCaptureDiscomfortReasons"];
    [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"stereoCaptureStatus"];
    [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"stereoVideoCaptureStatus"];
    uint64_t v6 = (void *)[MEMORY[0x1E4F1CA80] set];
    uint64_t v7 = v6;
    if ((v4 & 2) != 0) {
      [v6 addObject:@"AVSpatialCaptureDiscomfortReasonNotEnoughLight"];
    }
    if ((v4 & 4) != 0) {
      [v7 addObject:@"AVSpatialCaptureDiscomfortReasonSubjectTooClose"];
    }
    devicePropsQueue = self->_devicePropsQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__AVCaptureFigVideoDevice__updateSpatialCaptureStatus___block_invoke;
    block[3] = &unk_1E5A73F90;
    void block[4] = self;
    void block[5] = v7;
    void block[6] = v3;
    dispatch_sync(devicePropsQueue, block);
    [(AVCaptureFigVideoDevice *)self didChangeValueForKey:@"spatialCaptureDiscomfortReasons"];
    [(AVCaptureFigVideoDevice *)self didChangeValueForKey:@"stereoCaptureStatus"];
    [(AVCaptureFigVideoDevice *)self didChangeValueForKey:@"stereoVideoCaptureStatus"];
  }
}

uint64_t __55__AVCaptureFigVideoDevice__updateSpatialCaptureStatus___block_invoke(void *a1)
{
  uint64_t result = [objc_alloc(MEMORY[0x1E4F1CAD0]) initWithSet:a1[5]];
  *(void *)(a1[4] + 928) = result;
  *(void *)(a1[4] + 936) = a1[6];
  return result;
}

- (void)updateVideoZoomFactorForSpatialVideoEnabled:(BOOL)a3
{
  if (a3)
  {
    [(AVCaptureFigVideoDevice *)self _setMinAvailableVideoZoomFactor:2.0];
    [(AVCaptureFigVideoDevice *)self _setMaxAvailableVideoZoomFactor:2.0];
  }
  else
  {
    [(AVCaptureFigVideoDevice *)self _updateMinMaxDefaultVideoZoomFactors];
  }
}

- (int64_t)shallowDepthOfFieldEffectStatus
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__AVCaptureFigVideoDevice_shallowDepthOfFieldEffectStatus__block_invoke;
  v5[3] = &unk_1E5A74078;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __58__AVCaptureFigVideoDevice_shallowDepthOfFieldEffectStatus__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 952);
  return result;
}

id __56__AVCaptureFigVideoDevice__setDepthDataDeliveryEnabled___block_invoke_2(uint64_t a1)
{
  id result = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  *(void *)(*(void *)(a1 + 32) + 1136) = result;
  return result;
}

- (id)supportedVisionDataProperties
{
  return [(NSDictionary *)self->_fcsAttributes objectForKeyedSubscript:*MEMORY[0x1E4F51CA8]];
}

- (void)setEyeDetectionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(AVCaptureFigVideoDevice *)self isEyeDetectionSupported])
  {
    if ([(AVCaptureFigVideoDevice *)self _setFaceDetectionFeatureEnabled:v3 enabledState:&self->_supportedOptionalFaceDetectionFeatures] != -16452)return; {
    BOOL v5 = (void *)MEMORY[0x1E4F1CA00];
    }
    uint64_t v6 = *MEMORY[0x1E4F1C3A8];
    objc_opt_class();
  }
  else
  {
    BOOL v5 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v6 = *MEMORY[0x1E4F1C3C8];
    objc_opt_class();
  }
  uint64_t v7 = (void *)[v5 exceptionWithName:v6 reason:AVMethodExceptionReasonWithClassAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v7);
  }
  NSLog(&cfstr_SuppressingExc.isa, v7);
}

- (void)setEyeClosedDetectionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(AVCaptureFigVideoDevice *)self isEyeClosedDetectionSupported])
  {
    if ([(AVCaptureFigVideoDevice *)self _setFaceDetectionFeatureEnabled:v3 enabledState:(char *)&self->_supportedOptionalFaceDetectionFeatures + 1] != -16452)return; {
    BOOL v5 = (void *)MEMORY[0x1E4F1CA00];
    }
    uint64_t v6 = *MEMORY[0x1E4F1C3A8];
    objc_opt_class();
  }
  else
  {
    BOOL v5 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v6 = *MEMORY[0x1E4F1C3C8];
    objc_opt_class();
  }
  uint64_t v7 = (void *)[v5 exceptionWithName:v6 reason:AVMethodExceptionReasonWithClassAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v7);
  }
  NSLog(&cfstr_SuppressingExc.isa, v7);
}

- (void)setSmileDetectionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(AVCaptureFigVideoDevice *)self isSmileDetectionSupported])
  {
    if ([(AVCaptureFigVideoDevice *)self _setFaceDetectionFeatureEnabled:v3 enabledState:(char *)&self->_supportedOptionalFaceDetectionFeatures + 2] != -16452)return; {
    BOOL v5 = (void *)MEMORY[0x1E4F1CA00];
    }
    uint64_t v6 = *MEMORY[0x1E4F1C3A8];
    objc_opt_class();
  }
  else
  {
    BOOL v5 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v6 = *MEMORY[0x1E4F1C3C8];
    objc_opt_class();
  }
  uint64_t v7 = (void *)[v5 exceptionWithName:v6 reason:AVMethodExceptionReasonWithClassAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v7);
  }
  NSLog(&cfstr_SuppressingExc.isa, v7);
}

- (int)_setFaceDetectionFeatureEnabled:(BOOL)a3 enabledState:(BOOL *)a4
{
  BOOL v4 = *a4;
  if (v4 == a3) {
    return 0;
  }
  *a4 = a3;
  int result = [(AVCaptureFigVideoDevice *)self _setFigCaptureSourceProperty:*MEMORY[0x1E4F52018] withValue:[(AVCaptureFigVideoDevice *)self _faceDetectionConfigurationDictionary] cacheOnly:self->_cachesFigCaptureSourceConfigurationChanges];
  if (result) {
    *a4 = v4;
  }
  return result;
}

- (id)_faceDetectionConfigurationDictionary
{
  v5[3] = *MEMORY[0x1E4F143B8];
  v4[0] = *MEMORY[0x1E4F51D78];
  v5[0] = [NSNumber numberWithBool:LOBYTE(self->_supportedOptionalFaceDetectionFeatures)];
  v4[1] = *MEMORY[0x1E4F51D70];
  v5[1] = [NSNumber numberWithBool:BYTE1(self->_supportedOptionalFaceDetectionFeatures)];
  v4[2] = *MEMORY[0x1E4F51D80];
  v5[2] = [NSNumber numberWithBool:BYTE2(self->_supportedOptionalFaceDetectionFeatures)];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:3];
}

- (BOOL)isAttentionDetectionSupported
{
  id v2 = [(NSDictionary *)self->_fcsAttributes objectForKeyedSubscript:*MEMORY[0x1E4F51AE8]];

  return [v2 BOOLValue];
}

- (BOOL)setValue:(id)a3 forCMIOExtensionProperty:(id)a4 error:(id *)a5
{
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  int v17 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 1;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_devicePropsQueue);
  devicePropsQueue = self->_devicePropsQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __67__AVCaptureFigVideoDevice_setValue_forCMIOExtensionProperty_error___block_invoke;
  void v11[3] = &unk_1E5A744D8;
  v11[4] = self;
  v11[5] = a4;
  void v11[6] = a3;
  v11[7] = v16;
  v11[8] = &v12;
  v11[9] = a5;
  dispatch_async_and_wait(devicePropsQueue, v11);
  LOBYTE(a5) = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(v16, 8);
  return (char)a5;
}

uint64_t __67__AVCaptureFigVideoDevice_setValue_forCMIOExtensionProperty_error___block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) _setFigCaptureSourceProperty:*(void *)(a1 + 40) withValue:*(void *)(a1 + 48)];
  uint64_t result = *(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  if (result)
  {
    if (*(void *)(a1 + 72))
    {
      uint64_t result = AVLocalizedErrorWithUnderlyingOSStatus();
      **(void **)(a1 + 72) = result;
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
  }
  return result;
}

- (id)copyValueForCMIOExtensionProperty:(id)a3 error:(id *)a4
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3052000000;
  uint64_t v13 = __Block_byref_object_copy__5;
  uint64_t v14 = __Block_byref_object_dispose__5;
  uint64_t v15 = 0;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_devicePropsQueue);
  devicePropsQueue = self->_devicePropsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__AVCaptureFigVideoDevice_copyValueForCMIOExtensionProperty_error___block_invoke;
  block[3] = &unk_1E5A73F18;
  void block[5] = a3;
  void block[6] = &v10;
  void block[4] = self;
  dispatch_async_and_wait(devicePropsQueue, block);
  uint64_t v7 = (void *)v11[5];
  _Block_object_dispose(&v10, 8);
  return v7;
}

uint64_t __67__AVCaptureFigVideoDevice_copyValueForCMIOExtensionProperty_error___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _copyFigCaptureSourceProperty:*(void *)(a1 + 40)];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = result;
  return result;
}

- (BOOL)addCMIOExtensionPropertyValueChangeHandler:(id)a3
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 1;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_devicePropsQueue);
  devicePropsQueue = self->_devicePropsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__AVCaptureFigVideoDevice_addCMIOExtensionPropertyValueChangeHandler___block_invoke;
  block[3] = &unk_1E5A74500;
  void block[4] = self;
  void block[5] = a3;
  void block[6] = &v8;
  dispatch_async_and_wait(devicePropsQueue, block);
  LOBYTE(a3) = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return (char)a3;
}

uint64_t __70__AVCaptureFigVideoDevice_addCMIOExtensionPropertyValueChangeHandler___block_invoke(void *a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__AVCaptureFigVideoDevice_addCMIOExtensionPropertyValueChangeHandler___block_invoke_2;
  block[3] = &unk_1E5A72ED0;
  void block[4] = a1[4];
  if (addCMIOExtensionPropertyValueChangeHandler__onceToken != -1) {
    dispatch_once(&addCMIOExtensionPropertyValueChangeHandler__onceToken, block);
  }
  if ([*(id *)(a1[4] + 1352) containsObject:a1[5]]) {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
  }
  return [*(id *)(a1[4] + 1352) addObject:a1[5]];
}

id __70__AVCaptureFigVideoDevice_addCMIOExtensionPropertyValueChangeHandler___block_invoke_2(uint64_t a1)
{
  id result = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  *(void *)(*(void *)(a1 + 32) + 1352) = result;
  return result;
}

- (void)removeCMIOExtensionPropertyValueChangeHandler:(id)a3
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_devicePropsQueue);
  devicePropsQueue = self->_devicePropsQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __73__AVCaptureFigVideoDevice_removeCMIOExtensionPropertyValueChangeHandler___block_invoke;
  void v6[3] = &unk_1E5A73818;
  void v6[4] = self;
  v6[5] = a3;
  dispatch_async_and_wait(devicePropsQueue, v6);
}

uint64_t __73__AVCaptureFigVideoDevice_removeCMIOExtensionPropertyValueChangeHandler___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 1352) containsObject:*(void *)(a1 + 40)];
  if (result)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    BOOL v4 = *(void **)(*(void *)(a1 + 32) + 1352);
    return [v4 removeObject:v3];
  }
  return result;
}

- (void)enumerateCMIOExtensionPropertiesWithBlock:(id)a3
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_devicePropsQueue);
  devicePropsQueue = self->_devicePropsQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __69__AVCaptureFigVideoDevice_enumerateCMIOExtensionPropertiesWithBlock___block_invoke;
  void v6[3] = &unk_1E5A73818;
  void v6[4] = self;
  v6[5] = a3;
  dispatch_async_and_wait(devicePropsQueue, v6);
}

void __69__AVCaptureFigVideoDevice_enumerateCMIOExtensionPropertiesWithBlock___block_invoke(uint64_t a1)
{
  id v2 = (void *)[*(id *)(a1 + 32) _copyFigCaptureSourceProperty:*MEMORY[0x1E4F52120]];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __69__AVCaptureFigVideoDevice_enumerateCMIOExtensionPropertiesWithBlock___block_invoke_2;
    v3[3] = &unk_1E5A74528;
    v3[4] = *(void *)(a1 + 40);
    [v2 enumerateObjectsUsingBlock:v3];
  }
}

uint64_t __69__AVCaptureFigVideoDevice_enumerateCMIOExtensionPropertiesWithBlock___block_invoke_2(uint64_t a1, void *a2)
{
  [a2 objectForKeyedSubscript:*MEMORY[0x1E4F51DE8]];
  [a2 objectForKeyedSubscript:*MEMORY[0x1E4F51DF0]];
  uint64_t v4 = *MEMORY[0x1E4F51DE0];
  uint64_t v5 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E4F51DE0]), "BOOLValue");
  uint64_t v6 = *MEMORY[0x1E4F51DD8];
  uint64_t v7 = [a2 objectForKeyedSubscript:*MEMORY[0x1E4F51DD8]];
  uint64_t v8 = *MEMORY[0x1E4F51DD0];
  uint64_t v9 = [a2 objectForKeyedSubscript:*MEMORY[0x1E4F51DD0]];
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v5), v4);
  if (v7) {
    [v10 setObject:v7 forKeyedSubscript:v6];
  }
  if (v9) {
    [v10 setObject:v9 forKeyedSubscript:v8];
  }
  char v11 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v11();
}

- (id)AVVideoSettingsForSessionPreset:(id)a3
{
  availableBoxedMetadataFormatDescriptions = self->_availableBoxedMetadataFormatDescriptions;
  if (!availableBoxedMetadataFormatDescriptions)
  {
    availableBoxedMetadataFormatDescriptions = [(AVCaptureFigVideoDevice *)self _copyFigCaptureSourceProperty:*MEMORY[0x1E4F51ED0]];
    self->_availableBoxedMetadataFormatDescriptions = availableBoxedMetadataFormatDescriptions;
  }

  return (id)[(NSArray *)availableBoxedMetadataFormatDescriptions objectForKeyedSubscript:a3];
}

- ($2825F4736939C4A6D3AD43837233062D)maxH264PhotoDimensions
{
  sessionPresetCompressionSettings = self->_sessionPresetCompressionSettings;
  if (!sessionPresetCompressionSettings)
  {
    sessionPresetCompressionSettings = [(AVCaptureFigVideoDevice *)self _copyFigCaptureSourceProperty:*MEMORY[0x1E4F51ED8]];
    self->_sessionPresetCompressionSettings = sessionPresetCompressionSettings;
  }
  uint64_t v4 = *MEMORY[0x1E4F51A98];
  id v5 = [(NSDictionary *)sessionPresetCompressionSettings objectForKeyedSubscript:*MEMORY[0x1E4F51A98]];
  unsigned int v6 = objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E4F51A90]), "intValue");
  id v7 = [(NSDictionary *)self->_sessionPresetCompressionSettings objectForKeyedSubscript:v4];
  return ($2825F4736939C4A6D3AD43837233062D)(v6 | (unint64_t)(objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E4F51A88]), "intValue") << 32));
}

- ($2825F4736939C4A6D3AD43837233062D)maxH264VideoDimensions
{
  sessionPresetCompressionSettings = self->_sessionPresetCompressionSettings;
  if (!sessionPresetCompressionSettings)
  {
    sessionPresetCompressionSettings = [(AVCaptureFigVideoDevice *)self _copyFigCaptureSourceProperty:*MEMORY[0x1E4F51ED8]];
    self->_sessionPresetCompressionSettings = sessionPresetCompressionSettings;
  }
  uint64_t v4 = *MEMORY[0x1E4F51AA0];
  id v5 = [(NSDictionary *)sessionPresetCompressionSettings objectForKeyedSubscript:*MEMORY[0x1E4F51AA0]];
  unsigned int v6 = objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E4F51A90]), "intValue");
  id v7 = [(NSDictionary *)self->_sessionPresetCompressionSettings objectForKeyedSubscript:v4];
  return ($2825F4736939C4A6D3AD43837233062D)(v6 | (unint64_t)(objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E4F51A88]), "intValue") << 32));
}

- (int)minMacroblocksForHighProfileUpTo30fps
{
  sessionPresetCompressionSettings = self->_sessionPresetCompressionSettings;
  if (!sessionPresetCompressionSettings)
  {
    sessionPresetCompressionSettings = [(AVCaptureFigVideoDevice *)self _copyFigCaptureSourceProperty:*MEMORY[0x1E4F51ED8]];
    self->_sessionPresetCompressionSettings = sessionPresetCompressionSettings;
  }
  id v4 = [(NSDictionary *)sessionPresetCompressionSettings objectForKeyedSubscript:*MEMORY[0x1E4F51AB0]];

  return [v4 intValue];
}

- (int)minMacroblocksForHighProfileAbove30fps
{
  sessionPresetCompressionSettings = self->_sessionPresetCompressionSettings;
  if (!sessionPresetCompressionSettings)
  {
    sessionPresetCompressionSettings = [(AVCaptureFigVideoDevice *)self _copyFigCaptureSourceProperty:*MEMORY[0x1E4F51ED8]];
    self->_sessionPresetCompressionSettings = sessionPresetCompressionSettings;
  }
  id v4 = [(NSDictionary *)sessionPresetCompressionSettings objectForKeyedSubscript:*MEMORY[0x1E4F51AA8]];

  return [v4 intValue];
}

- (BOOL)usesQuantizationScalingMatrix_H264_Steep_16_48
{
  sessionPresetCompressionSettings = self->_sessionPresetCompressionSettings;
  if (!sessionPresetCompressionSettings)
  {
    sessionPresetCompressionSettings = [(AVCaptureFigVideoDevice *)self _copyFigCaptureSourceProperty:*MEMORY[0x1E4F51ED8]];
    self->_sessionPresetCompressionSettings = sessionPresetCompressionSettings;
  }
  id v4 = [(NSDictionary *)sessionPresetCompressionSettings objectForKeyedSubscript:*MEMORY[0x1E4F51AB8]];

  return [v4 BOOLValue];
}

- (int)hevcTurboModeVersion
{
  h264EncoderLimitations = self->_h264EncoderLimitations;
  if (!h264EncoderLimitations)
  {
    h264EncoderLimitations = [(AVCaptureFigVideoDevice *)self _copyFigCaptureSourceProperty:*MEMORY[0x1E4F51EE0]];
    self->_h264EncoderLimitations = h264EncoderLimitations;
  }
  id v4 = [(NSDictionary *)h264EncoderLimitations objectForKeyedSubscript:*MEMORY[0x1E4F51AD8]];

  return [v4 intValue];
}

- (BOOL)hevcAllowBFramesForHighCTUCount
{
  h264EncoderLimitations = self->_h264EncoderLimitations;
  if (!h264EncoderLimitations)
  {
    h264EncoderLimitations = [(AVCaptureFigVideoDevice *)self _copyFigCaptureSourceProperty:*MEMORY[0x1E4F51EE0]];
    self->_h264EncoderLimitations = h264EncoderLimitations;
  }
  id v4 = [(NSDictionary *)h264EncoderLimitations objectForKeyedSubscript:*MEMORY[0x1E4F51AC0]];

  return [v4 BOOLValue];
}

- (BOOL)isHEVCRelaxedAverageBitRateTargetSupported
{
  h264EncoderLimitations = self->_h264EncoderLimitations;
  if (!h264EncoderLimitations)
  {
    h264EncoderLimitations = [(AVCaptureFigVideoDevice *)self _copyFigCaptureSourceProperty:*MEMORY[0x1E4F51EE0]];
    self->_h264EncoderLimitations = h264EncoderLimitations;
  }
  id v4 = [(NSDictionary *)h264EncoderLimitations objectForKeyedSubscript:*MEMORY[0x1E4F51AD0]];

  return [v4 BOOLValue];
}

- (BOOL)isMotionCompensatedTemporalFilteringSupported
{
  h264EncoderLimitations = self->_h264EncoderLimitations;
  if (!h264EncoderLimitations)
  {
    h264EncoderLimitations = [(AVCaptureFigVideoDevice *)self _copyFigCaptureSourceProperty:*MEMORY[0x1E4F51EE0]];
    self->_h264EncoderLimitations = h264EncoderLimitations;
  }
  id v4 = [(NSDictionary *)h264EncoderLimitations objectForKeyedSubscript:*MEMORY[0x1E4F51AC8]];

  return [v4 BOOLValue];
}

- (id)bravoCameraSelectionBehavior
{
  id result = [(AVCaptureFigVideoDevice *)self activePrimaryConstituentDeviceSwitchingBehavior];
  switch((unint64_t)result)
  {
    case 0uLL:
      uint64_t v3 = AVCaptureBravoCameraSelectionBehaviorUnsupported;
      goto LABEL_6;
    case 1uLL:
      uint64_t v3 = AVCaptureBravoCameraSelectionBehaviorEvaluatesContinuously;
      goto LABEL_6;
    case 2uLL:
      uint64_t v3 = AVCaptureBravoCameraSelectionBehaviorEvaluatesOnZoomChange;
      goto LABEL_6;
    case 3uLL:
      uint64_t v3 = AVCaptureBravoCameraSelectionBehaviorEvaluatesNever;
LABEL_6:
      id result = *v3;
      break;
    default:
      return result;
  }
  return result;
}

- (void)setPrimaryConstituentDeviceSwitchingBehavior:(int64_t)a3 restrictedSwitchingBehaviorConditions:(unint64_t)a4
{
  if (![(AVCaptureFigVideoDevice *)self _isBravoVariant])
  {
    if (!a3) {
      goto LABEL_12;
    }
    goto LABEL_7;
  }
  if (a3 == 2)
  {
    if (a4 >= 8)
    {
      id v7 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v8 = *MEMORY[0x1E4F1C3C8];
      goto LABEL_8;
    }
    goto LABEL_12;
  }
  if (!a3)
  {
LABEL_7:
    id v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C3C8];
    goto LABEL_8;
  }
  if (a4)
  {
    id v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C3C8];
LABEL_8:
    uint64_t v9 = (void *)[v7 exceptionWithName:v8 reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v9);
    }
    NSLog(&cfstr_SuppressingExc.isa, v9);
    return;
  }
LABEL_12:
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  int v17 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __110__AVCaptureFigVideoDevice_setPrimaryConstituentDeviceSwitchingBehavior_restrictedSwitchingBehaviorConditions___block_invoke;
  block[3] = &unk_1E5A74550;
  void block[6] = a3;
  void block[7] = a4;
  void block[4] = self;
  void block[5] = &v14;
  dispatch_sync(devicePropsQueue, block);
  if (*((_DWORD *)v15 + 6))
  {
    FigDebugAssert3();
  }
  else
  {
    [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"primaryConstituentDeviceSwitchingBehavior"];
    [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"primaryConstituentDeviceRestrictedSwitchingBehaviorConditions"];
    char v11 = self->_devicePropsQueue;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __110__AVCaptureFigVideoDevice_setPrimaryConstituentDeviceSwitchingBehavior_restrictedSwitchingBehaviorConditions___block_invoke_2;
    void v12[3] = &unk_1E5A72F70;
    v12[4] = self;
    v12[5] = a3;
    void v12[6] = a4;
    dispatch_sync(v11, v12);
    [(AVCaptureFigVideoDevice *)self didChangeValueForKey:@"primaryConstituentDeviceRestrictedSwitchingBehaviorConditions"];
    [(AVCaptureFigVideoDevice *)self didChangeValueForKey:@"primaryConstituentDeviceSwitchingBehavior"];
  }
  _Block_object_dispose(&v14, 8);
}

uint64_t __110__AVCaptureFigVideoDevice_setPrimaryConstituentDeviceSwitchingBehavior_restrictedSwitchingBehaviorConditions___block_invoke(uint64_t a1)
{
  long long v4 = *(_OWORD *)(a1 + 48);
  uint64_t v2 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v4 length:16];
  uint64_t result = [*(id *)(a1 + 32) _setFigCaptureSourceProperty:*MEMORY[0x1E4F51F78] withValue:v2 cacheOnly:0];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void *__110__AVCaptureFigVideoDevice_setPrimaryConstituentDeviceSwitchingBehavior_restrictedSwitchingBehaviorConditions___block_invoke_2(void *result)
{
  *(void *)(result[4] + 992) = result[5];
  *(void *)(result[4] + 1000) = result[6];
  return result;
}

- (int64_t)primaryConstituentDeviceSwitchingBehavior
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __68__AVCaptureFigVideoDevice_primaryConstituentDeviceSwitchingBehavior__block_invoke;
  v5[3] = &unk_1E5A74078;
  void v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __68__AVCaptureFigVideoDevice_primaryConstituentDeviceSwitchingBehavior__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 992);
  return result;
}

- (unint64_t)primaryConstituentDeviceRestrictedSwitchingBehaviorConditions
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __88__AVCaptureFigVideoDevice_primaryConstituentDeviceRestrictedSwitchingBehaviorConditions__block_invoke;
  v5[3] = &unk_1E5A74078;
  void v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __88__AVCaptureFigVideoDevice_primaryConstituentDeviceRestrictedSwitchingBehaviorConditions__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 1000);
  return result;
}

- (int64_t)activePrimaryConstituentDeviceSwitchingBehavior
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __74__AVCaptureFigVideoDevice_activePrimaryConstituentDeviceSwitchingBehavior__block_invoke;
  v5[3] = &unk_1E5A74078;
  void v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __74__AVCaptureFigVideoDevice_activePrimaryConstituentDeviceSwitchingBehavior__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 976);
  return result;
}

- (unint64_t)activePrimaryConstituentDeviceRestrictedSwitchingBehaviorConditions
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __94__AVCaptureFigVideoDevice_activePrimaryConstituentDeviceRestrictedSwitchingBehaviorConditions__block_invoke;
  v5[3] = &unk_1E5A74078;
  void v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __94__AVCaptureFigVideoDevice_activePrimaryConstituentDeviceRestrictedSwitchingBehaviorConditions__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 984);
  return result;
}

- (id)fallbackPrimaryConstituentDevices
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3052000000;
  id v10 = __Block_byref_object_copy__5;
  char v11 = __Block_byref_object_dispose__5;
  uint64_t v12 = MEMORY[0x1E4F1CBF0];
  if ([(AVCaptureFigVideoDevice *)self _isBravoVariant])
  {
    if (!self->_supportedFallbackPrimaryConstituentDevices) {
      [(AVCaptureFigVideoDevice *)self _populateSupportedFallbackPrimaryConstituentDevices];
    }
    devicePropsQueue = self->_devicePropsQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __60__AVCaptureFigVideoDevice_fallbackPrimaryConstituentDevices__block_invoke;
    void v6[3] = &unk_1E5A74078;
    void v6[4] = self;
    v6[5] = &v7;
    dispatch_sync(devicePropsQueue, v6);
  }
  long long v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

id __60__AVCaptureFigVideoDevice_fallbackPrimaryConstituentDevices__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(a1 + 32) + 1016);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)_setActivePrimaryConstituentDeviceSwitchingBehavior:(int64_t)a3 restrictedSwitchingBehaviorConditions:(unint64_t)a4
{
  activePrimaryConstituentDevice = self->_activePrimaryConstituentDevice;
  int64_t activePrimaryConstituentDeviceSwitchingBehavior = self->_activePrimaryConstituentDeviceSwitchingBehavior;
  if (activePrimaryConstituentDevice != (AVCaptureDevice *)a3 || activePrimaryConstituentDeviceSwitchingBehavior != a4)
  {
    if (activePrimaryConstituentDevice != (AVCaptureDevice *)a3) {
      [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"activePrimaryConstituentDeviceSwitchingBehavior"];
    }
    if (activePrimaryConstituentDeviceSwitchingBehavior != a4) {
      [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"activePrimaryConstituentDeviceRestrictedSwitchingBehaviorConditions"];
    }
    devicePropsQueue = self->_devicePropsQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __117__AVCaptureFigVideoDevice__setActivePrimaryConstituentDeviceSwitchingBehavior_restrictedSwitchingBehaviorConditions___block_invoke;
    block[3] = &unk_1E5A72F70;
    void block[4] = self;
    void block[5] = a3;
    void block[6] = a4;
    dispatch_sync(devicePropsQueue, block);
    if (activePrimaryConstituentDeviceSwitchingBehavior != a4) {
      [(AVCaptureFigVideoDevice *)self didChangeValueForKey:@"activePrimaryConstituentDeviceRestrictedSwitchingBehaviorConditions"];
    }
    if (activePrimaryConstituentDevice != (AVCaptureDevice *)a3) {
      [(AVCaptureFigVideoDevice *)self didChangeValueForKey:@"activePrimaryConstituentDeviceSwitchingBehavior"];
    }
  }
}

void *__117__AVCaptureFigVideoDevice__setActivePrimaryConstituentDeviceSwitchingBehavior_restrictedSwitchingBehaviorConditions___block_invoke(void *result)
{
  *(void *)(result[4] + 976) = result[5];
  *(void *)(result[4] + 984) = result[6];
  return result;
}

- (BOOL)isFocusedAtMacro
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__AVCaptureFigVideoDevice_isFocusedAtMacro__block_invoke;
  v5[3] = &unk_1E5A74078;
  void v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __43__AVCaptureFigVideoDevice_isFocusedAtMacro__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 961);
  return result;
}

- (int64_t)minimumFocusDistance
{
  int64_t result = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_fcsAttributes, "objectForKeyedSubscript:", *MEMORY[0x1E4F51BF8]), "integerValue");
  if (result <= 0) {
    return -1;
  }
  return result;
}

- (BOOL)isTimeOfFlightProjectorModeSupported:(int64_t)a3
{
  if (!objc_msgSend(-[AVCaptureFigVideoDevice deviceType](self, "deviceType"), "isEqualToString:", @"AVCaptureDeviceTypeBuiltInTimeOfFlightCamera"))return a3 == 0; {
  id v5 = [(NSDictionary *)self->_fcsAttributes objectForKeyedSubscript:*MEMORY[0x1E4F51C68]];
  }
  uint64_t v6 = [NSNumber numberWithInteger:a3];

  return [v5 containsObject:v6];
}

- (int64_t)timeOfFlightProjectorMode
{
  return self->_videoStabilizationStrength;
}

- (void)setTimeOfFlightProjectorMode:(int64_t)a3
{
  if ([(AVCaptureFigVideoDevice *)self isLockedForConfiguration])
  {
    if ([(AVCaptureFigVideoDevice *)self isTimeOfFlightProjectorModeSupported:a3])
    {
      devicePropsQueue = self->_devicePropsQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __56__AVCaptureFigVideoDevice_setTimeOfFlightProjectorMode___block_invoke;
      block[3] = &unk_1E5A72F98;
      void block[4] = self;
      void block[5] = a3;
      dispatch_sync(devicePropsQueue, block);
      return;
    }
    char v11 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v12 = *MEMORY[0x1E4F1C3C8];
    uint64_t v8 = AVMethodExceptionReasonWithObjectAndSelector();
    char v9 = v11;
    uint64_t v10 = v12;
  }
  else
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3A8];
    objc_opt_class();
    uint64_t v8 = AVMethodExceptionReasonWithClassAndSelector();
    char v9 = v6;
    uint64_t v10 = v7;
  }
  uint64_t v13 = (void *)[v9 exceptionWithName:v10 reason:v8 userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v13);
  }
  NSLog(&cfstr_SuppressingExc.isa, v13);
}

uint64_t __56__AVCaptureFigVideoDevice_setTimeOfFlightProjectorMode___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 1192) = *(void *)(result + 40);
  return result;
}

- (int64_t)timeOfFlightBankCount
{
  return 4 * ([(AVCaptureFigVideoDevice *)self timeOfFlightProjectorMode] != 0);
}

- (int64_t)nonDestructiveCropAspectRatio
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__AVCaptureFigVideoDevice_nonDestructiveCropAspectRatio__block_invoke;
  v5[3] = &unk_1E5A74078;
  void v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __56__AVCaptureFigVideoDevice_nonDestructiveCropAspectRatio__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 1152);
  return result;
}

- (int)_setFigCaptureSourcePixelBufferProperty:(__CFString *)a3 withValue:(__CVBuffer *)a4
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  int v11 = 0;
  fcsQueue = self->_fcsQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __77__AVCaptureFigVideoDevice__setFigCaptureSourcePixelBufferProperty_withValue___block_invoke;
  void v7[3] = &unk_1E5A74550;
  v7[4] = self;
  v7[5] = &v8;
  void v7[6] = a3;
  void v7[7] = a4;
  dispatch_sync(fcsQueue, v7);
  int v5 = *((_DWORD *)v9 + 6);
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __77__AVCaptureFigVideoDevice__setFigCaptureSourcePixelBufferProperty_withValue___block_invoke(void *a1)
{
  uint64_t v2 = *(void *)(a1[4] + 56);
  uint64_t v3 = a1[6];
  uint64_t v4 = a1[7];
  if (v2 && (int v5 = *(void **)(CMBaseObjectGetVTable() + 16)) != 0) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  if (*v6 >= 6uLL && (uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v6[13]) != 0) {
    uint64_t result = v7(v2, v3, v4);
  }
  else {
    uint64_t result = 4294954514;
  }
  *(_DWORD *)(*(void *)(a1[5] + 8) + 24) = result;
  uint64_t v9 = *(void *)(a1[5] + 8);
  if (*(_DWORD *)(v9 + 24) == -16453) {
    *(_DWORD *)(v9 + 24) = 0;
  }
  return result;
}

- (void)_restoreFigCaptureSourceProperties
{
  if ([(AVCaptureFigVideoDevice *)self lockForConfiguration:0])
  {
    fcsQueue = self->_fcsQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__AVCaptureFigVideoDevice__restoreFigCaptureSourceProperties__block_invoke;
    block[3] = &unk_1E5A72ED0;
    void block[4] = self;
    dispatch_sync(fcsQueue, block);
    [(AVCaptureFigVideoDevice *)self unlockForConfiguration];
  }
}

uint64_t __61__AVCaptureFigVideoDevice__restoreFigCaptureSourceProperties__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 1128);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __61__AVCaptureFigVideoDevice__restoreFigCaptureSourceProperties__block_invoke_2;
  void v4[3] = &unk_1E5A745C8;
  v4[4] = v1;
  return [v2 enumerateKeysAndObjectsUsingBlock:v4];
}

uint64_t __61__AVCaptureFigVideoDevice__restoreFigCaptureSourceProperties__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 56);
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v9 = *(void *)(VTable + 8);
  uint64_t result = VTable + 8;
  uint64_t v8 = v9;
  if (v9) {
    uint64_t v10 = v8;
  }
  else {
    uint64_t v10 = 0;
  }
  int v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 56);
  if (v11)
  {
    return v11(v5, a2, a3);
  }
  return result;
}

- (void)_reconnectToFigCaptureSource:(OpaqueFigCaptureSource *)a3
{
  id v5 = [(AVCaptureFigVideoDevice *)self _copyFigCaptureSourceProperty:*MEMORY[0x1E4F521B8]];
  uint64_t v6 = v5;
  if (v5 == (id)*MEMORY[0x1E4F1CFD0])
  {
    dispatch_semaphore_wait(&self->_propertyToFigCaptureSourcePropertyMap->super.super, 0xFFFFFFFFFFFFFFFFLL);
    if (!v6) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (v5) {
LABEL_3:
  }
    CFRelease(v6);
LABEL_4:
  [(AVCaptureFigVideoDevice *)self _setFigCaptureSource:a3 allowSendingWorkToMainThread:1];
  [(AVCaptureFigVideoDevice *)self _restoreFigCaptureSourceProperties];
  devicePropsQueue = self->_devicePropsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__AVCaptureFigVideoDevice__reconnectToFigCaptureSource___block_invoke;
  block[3] = &unk_1E5A72ED0;
  void block[4] = self;
  dispatch_sync(devicePropsQueue, block);
}

uint64_t __56__AVCaptureFigVideoDevice__reconnectToFigCaptureSource___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 1216) = 1;
  return result;
}

- (void)_handleCMIOExtensionPropertyChangeNotification:(id)a3
{
  v19[25] = *MEMORY[0x1E4F143B8];
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3052000000;
  v19[3] = __Block_byref_object_copy__5;
  v19[4] = __Block_byref_object_dispose__5;
  v19[5] = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3052000000;
  double v18[3] = __Block_byref_object_copy__5;
  v18[4] = __Block_byref_object_dispose__5;
  void v18[5] = 0;
  if (dword_1EB4C9280)
  {
    int v17 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_devicePropsQueue);
  if (a3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = *MEMORY[0x1E4F51DE8];
      if ([a3 objectForKeyedSubscript:*MEMORY[0x1E4F51DE8]])
      {
        uint64_t v7 = *MEMORY[0x1E4F51DF0];
        if ([a3 objectForKeyedSubscript:*MEMORY[0x1E4F51DF0]])
        {
          if (objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", v6), "isEqualToString:", @"VideoZoomFactor"))
          {
            objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", v7), "floatValue");
            float v9 = v8;
            [(AVCaptureFigVideoDevice *)self videoZoomFactor];
            double v10 = v9;
            if (v11 != v10)
            {
              [(AVCaptureFigVideoDevice *)self willChangeValueForKey:@"videoZoomFactor"];
              devicePropsQueue = self->_devicePropsQueue;
              block[0] = MEMORY[0x1E4F143A8];
              block[1] = 3221225472;
              block[2] = __74__AVCaptureFigVideoDevice__handleCMIOExtensionPropertyChangeNotification___block_invoke;
              block[3] = &unk_1E5A72F98;
              void block[4] = self;
              *(double *)&void block[5] = v10;
              dispatch_sync(devicePropsQueue, block);
              [(AVCaptureFigVideoDevice *)self didChangeValueForKey:@"videoZoomFactor"];
            }
          }
          if (*(void *)&self->_gazeSelectionEnabled)
          {
            uint64_t v13 = self->_devicePropsQueue;
            v14[0] = MEMORY[0x1E4F143A8];
            v14[1] = 3221225472;
            void v14[2] = __74__AVCaptureFigVideoDevice__handleCMIOExtensionPropertyChangeNotification___block_invoke_592;
            v14[3] = &unk_1E5A74618;
            void v14[6] = v19;
            v14[7] = v18;
            v14[4] = a3;
            v14[5] = self;
            dispatch_async_and_wait(v13, v14);
          }
        }
      }
    }
  }
  _Block_object_dispose(v18, 8);
  _Block_object_dispose(v19, 8);
}

float __74__AVCaptureFigVideoDevice__handleCMIOExtensionPropertyChangeNotification___block_invoke(uint64_t a1)
{
  if (dword_1EB4C9280)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  float result = *(double *)(a1 + 40);
  *(float *)(*(void *)(a1 + 32) + 864) = result;
  return result;
}

uint64_t __74__AVCaptureFigVideoDevice__handleCMIOExtensionPropertyChangeNotification___block_invoke_592(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x1E4F51DE8]];
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x1E4F51DF0]];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v2 = *(void **)(*(void *)(a1 + 40) + 1352);
  uint64_t result = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void *)v12;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v11 + 1) + 8 * v6);
        global_queue = dispatch_get_global_queue(0, 0);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __74__AVCaptureFigVideoDevice__handleCMIOExtensionPropertyChangeNotification___block_invoke_2;
        block[3] = &unk_1E5A745F0;
        void block[4] = v7;
        long long v10 = *(_OWORD *)(a1 + 48);
        dispatch_async_and_wait(global_queue, block);
        ++v6;
      }
      while (v4 != v6);
      uint64_t result = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      uint64_t v4 = result;
    }
    while (result);
  }
  return result;
}

uint64_t __74__AVCaptureFigVideoDevice__handleCMIOExtensionPropertyChangeNotification___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[4] + 16))(a1[4], *(void *)(*(void *)(a1[5] + 8) + 40), *(void *)(*(void *)(a1[6] + 8) + 40));
}

uint64_t __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned __int8 *)(*(void *)(result + 32) + 793) != *(unsigned __int8 *)(result + 48);
  return result;
}

uint64_t __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_2(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 336);
  return result;
}

uint64_t __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_3(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 336) = 0;
  return result;
}

uint64_t __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_9(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(float *)(result + 48) != *(float *)(*(void *)(result + 32) + 456);
  return result;
}

float __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_10(uint64_t a1)
{
  float result = *(float *)(a1 + 40);
  *(float *)(*(void *)(a1 + 32) + 456) = result;
  return result;
}

uint64_t __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_11(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(float *)(*(void *)(result + 32) + 460) != *(float *)(result + 48);
  return result;
}

float __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_12(uint64_t a1)
{
  float result = *(float *)(a1 + 40);
  *(float *)(*(void *)(a1 + 32) + 460) = result;
  return result;
}

void *__55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_13(void *result)
{
  uint64_t v1 = result[4];
  if (!*(void *)(v1 + 424))
  {
    *(_DWORD *)(*(void *)(result[5] + 8) + 24) = 0;
    uint64_t v1 = result[4];
  }
  *(unsigned char *)(*(void *)(result[6] + 8) + 24) = *(float *)(v1 + 464) != *(float *)(*(void *)(result[5] + 8)
                                                                                     + 24);
  return result;
}

float __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_14(uint64_t a1)
{
  float result = *(float *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  *(float *)(*(void *)(a1 + 32) + 464) = result;
  return result;
}

uint64_t __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_15(uint64_t result)
{
  BOOL v2 = *(void *)(result + 48) != *(void *)(*(void *)(result + 32) + 552)
    || *(_DWORD *)(result + 56) != (unint64_t)*(unsigned int *)(*(void *)(result + 32) + 560);
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = v2;
  return result;
}

uint64_t __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_16(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32) + 552;
  int v2 = *(_DWORD *)(result + 48);
  *(void *)uint64_t v1 = *(void *)(result + 40);
  *(_DWORD *)(v1 + 8) = v2;
  return result;
}

uint64_t __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_17(uint64_t result)
{
  uint64_t v1 = result + 40;
  uint64_t v2 = *(void *)(result + 32);
  if (*(void *)(result + 40) == *(void *)(v2 + 564)
    && *(_DWORD *)(result + 48) == (unint64_t)*(unsigned int *)(v2 + 572))
  {
    uint64_t v6 = result;
    float result = FigDebugAssert3();
    uint64_t v2 = *(void *)(v6 + 32);
  }
  uint64_t v4 = v2 + 564;
  uint64_t v5 = *(void *)v1;
  *(_DWORD *)(v4 + 8) = *(_DWORD *)(v1 + 8);
  *(void *)uint64_t v4 = v5;
  return result;
}

uint64_t __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_18(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned __int8 *)(result + 48) != *(unsigned __int8 *)(*(void *)(result + 32) + 640);
  return result;
}

uint64_t __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_19(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 640) = *(unsigned char *)(result + 40);
  return result;
}

void __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_20(uint64_t a1)
{
  uint64_t v2 = *(const void **)(*(void *)(a1 + 32) + 648);
  uint64_t v3 = (const void *)[*(id *)(a1 + 40) objectForKeyedSubscript:*MEMORY[0x1E4F51E08]];
  *(void *)(*(void *)(a1 + 32) + 648) = v3;
  if (v3) {
    CFRetain(v3);
  }
  if (v2)
  {
    CFRelease(v2);
  }
}

id __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_21(void *a1)
{
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = *(unsigned char *)(a1[4] + 746);
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = *(void *)(a1[4] + 736) == 1;
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = *(unsigned char *)(a1[4] + 747);
  *(unsigned char *)(*(void *)(a1[8] + 8) + 24) = *(unsigned char *)(a1[4] + 847);
  *(unsigned char *)(*(void *)(a1[9] + 8) + 24) = *(unsigned char *)(a1[4] + 848);
  id result = *(id *)(a1[4] + 760);
  *(void *)(*(void *)(a1[10] + 8) + 40) = result;
  return result;
}

uint64_t __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_22(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 56) + 8) + 24) = *(_DWORD *)(*(void *)(result + 32) + 868);
  *(_DWORD *)(*(void *)(*(void *)(result + 64) + 8) + 24) = *(_DWORD *)(*(void *)(result + 32) + 872);
  if (*(float *)(*(void *)(*(void *)(result + 56) + 8) + 24) == 0.0)
  {
    uint64_t v1 = result;
    [*(id *)(result + 40) floatValue];
    *(_DWORD *)(*(void *)(*(void *)(v1 + 56) + 8) + 24) = v2;
    id result = [*(id *)(v1 + 48) intValue];
    *(_DWORD *)(*(void *)(*(void *)(v1 + 64) + 8) + 24) = result;
    *(unsigned char *)(*(void *)(*(void *)(v1 + 72) + 8) + 24) = 1;
  }
  return result;
}

uint64_t __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_23(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 40) floatValue];
  *(_DWORD *)(*(void *)(a1 + 32) + 864) = v3;
  *(_DWORD *)(*(void *)(a1 + 32) + 868) = 0;
  return result;
}

float __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_24(uint64_t a1)
{
  [*(id *)(a1 + 40) floatValue];
  *(float *)(*(void *)(a1 + 32) + 864) = result;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    float result = *(float *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    *(float *)(*(void *)(a1 + 32) + 868) = result;
    *(_DWORD *)(*(void *)(a1 + 32) + 872) = *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  }
  return result;
}

__n128 __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_25(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32) + 808;
  __n128 result = *(__n128 *)(a1 + 56);
  *(_OWORD *)uint64_t v1 = *(_OWORD *)(a1 + 40);
  *(__n128 *)(v1 + 16) = result;
  *(_DWORD *)(*(void *)(a1 + 32) + 840) = *(_DWORD *)(a1 + 72);
  return result;
}

uint64_t __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_26(uint64_t a1)
{
  *(_DWORD *)(*(void *)(a1 + 32) + 1144) = [*(id *)(*(void *)(a1 + 32) + 1136) figLevel];
  int v2 = -[AVCaptureSystemPressureState initWithFigLevel:factors:recommendedFrameRateRangeForPortrait:]([AVCaptureSystemPressureState alloc], "initWithFigLevel:factors:recommendedFrameRateRangeForPortrait:", *(unsigned int *)(*(void *)(a1 + 32) + 1144), [*(id *)(*(void *)(a1 + 32) + 1136) factors], objc_msgSend(*(id *)(a1 + 32), "_recommendedFrameRateRangeForVideoFormat:depthFormat:figSystemPressureLevel:", *(void *)(*(void *)(a1 + 32) + 144), *(void *)(*(void *)(a1 + 32) + 152), *(unsigned int *)(*(void *)(a1 + 32) + 1144)));
  uint64_t result = [(AVCaptureSystemPressureState *)v2 isEqual:*(void *)(*(void *)(a1 + 32) + 1136)];
  if ((result & 1) == 0) {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = v2;
  }
  return result;
}

id __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_27(uint64_t a1)
{
  id result = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  *(void *)(*(void *)(a1 + 32) + 1136) = result;
  return result;
}

id __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_28(uint64_t a1)
{
  id result = *(id *)(a1 + 40);
  *(void *)(*(void *)(a1 + 32) + 968) = result;
  return result;
}

id __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_29(uint64_t a1)
{
  id result = *(id *)(a1 + 40);
  *(void *)(*(void *)(a1 + 32) + 1024) = result;
  return result;
}

uint64_t __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_30(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned __int8 *)(result + 48) != *(unsigned __int8 *)(*(void *)(result + 32) + 961);
  return result;
}

uint64_t __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_31(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 961) = *(unsigned char *)(result + 40);
  return result;
}

uint64_t __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_32(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isEqual:*(void *)(*(void *)(a1 + 40) + 1136)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result ^ 1;
  return result;
}

id __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_33(uint64_t a1)
{
  id result = *(id *)(a1 + 40);
  *(void *)(*(void *)(a1 + 32) + 1136) = result;
  return result;
}

uint64_t __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_34(uint64_t a1)
{
  if (CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E4F52180]))
  {
    BOOL v2 = 0;
    uint64_t v3 = 1;
  }
  else
  {
    int v4 = CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E4F51F68]);
    BOOL v2 = v4 == 0;
    uint64_t v3 = 2 * (v4 != 0);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (*(unsigned char *)(result + 1216))
  {
    uint64_t result = [(id)result _initDegradedCaptureQualityFactors];
    if (v2)
    {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(void *)(*(void *)(a1 + 32) + 1208);
      goto LABEL_17;
    }
    uint64_t v7 = *(void *)(a1 + 32);
    if (*(unsigned char *)(a1 + 64)) {
      uint64_t v8 = *(void *)(v7 + 1208) & ~v3;
    }
    else {
      uint64_t v8 = *(void *)(v7 + 1208) | v3;
    }
    *(void *)(v7 + 1208) = v8;
    uint64_t v6 = a1 + 40;
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(void *)(*(void *)(a1 + 32) + 1208);
  }
  else
  {
    uint64_t v6 = a1 + 40;
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(void *)(result + 1208);
    if (v2) {
      goto LABEL_17;
    }
  }
  uint64_t v9 = *(void *)(*(void *)v6 + 8);
  if (*(unsigned char *)(a1 + 64)) {
    uint64_t v10 = *(void *)(v9 + 24) | v3;
  }
  else {
    uint64_t v10 = *(void *)(v9 + 24) & ~v3;
  }
  *(void *)(v9 + 24) = v10;
LABEL_17:
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) != *(void *)(*(void *)(a1 + 32) + 1208);
  return result;
}

uint64_t __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_35(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 1208) = *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24);
  return result;
}

uint64_t __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_36(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned __int8 *)(*(void *)(result + 32) + 795) != *(unsigned __int8 *)(result + 48);
  return result;
}

uint64_t __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_37(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 795) = *(unsigned char *)(result + 40);
  return result;
}

uint64_t __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_38(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned __int8 *)(*(void *)(result + 32) + 796) != *(unsigned __int8 *)(result + 48);
  return result;
}

uint64_t __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_39(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 796) = *(unsigned char *)(result + 40);
  return result;
}

BOOL __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_40(uint64_t a1)
{
  BOOL result = CGRectEqualToRect(*(CGRect *)(a1 + 48), *(CGRect *)(*(void *)(a1 + 32) + 1224));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = !result;
  return result;
}

__n128 __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_41(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32) + 1224;
  __n128 result = *(__n128 *)(a1 + 56);
  *(_OWORD *)uint64_t v1 = *(_OWORD *)(a1 + 40);
  *(__n128 *)(v1 + 16) = result;
  return result;
}

float __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_42(uint64_t a1)
{
  float result = *(double *)(a1 + 40);
  *(float *)(*(void *)(a1 + 32) + 864) = result;
  return result;
}

uint64_t __85__AVCaptureFigVideoDevice__handleManualControlCompletionForRequestQueue_withPayload___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) fakeBias];
  if (v3 != 3.4028e38)
  {
    uint64_t result = [*(id *)(a1 + 32) fakeBias];
    *(_DWORD *)(*(void *)(a1 + 40) + 460) = v4;
  }
  return result;
}

- (void)_drainManualControlRequestQueues
{
  [(AVCaptureFigVideoDevice *)self _drainManualControlRequestQueue:*(void *)&self->_providesStortorgetMetadata];
  [(AVCaptureFigVideoDevice *)self _drainManualControlRequestQueue:self->_manualFocusControlRequests];
  [(AVCaptureFigVideoDevice *)self _drainManualControlRequestQueue:self->_manualExposureControlRequests];
  biasedExposureControlRequests = self->_biasedExposureControlRequests;

  [(AVCaptureFigVideoDevice *)self _drainManualControlRequestQueue:biasedExposureControlRequests];
}

- (void)_drainManualControlRequestQueue:(id)a3
{
  uint64_t v4 = [a3 dequeue];
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    uint64_t v6 = (long long *)MEMORY[0x1E4F1F9F8];
    do
    {
      if ([v5 completionBlock])
      {
        uint64_t v7 = [v5 completionBlock];
        uint64_t v8 = *(void (**)(uint64_t, long long *))(v7 + 16);
        long long v9 = *v6;
        uint64_t v10 = *((void *)v6 + 2);
        v8(v7, &v9);
      }
      uint64_t v5 = (void *)[a3 dequeue];
    }
    while (v5);
  }
}

- (void)_performBlockOnMainThread:(id)a3
{
  if (a3)
  {
    Main = CFRunLoopGetMain();
    CFRunLoopPerformBlock(Main, (CFTypeRef)*MEMORY[0x1E4F1D410], a3);
    uint64_t v5 = CFRunLoopGetMain();
    CFRunLoopWakeUp(v5);
  }
}

- (void)_checkTCCAccess
{
  if (![(AVCaptureFigVideoDevice *)self isProxyDevice])
  {
    fcsQueue = self->_fcsQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __42__AVCaptureFigVideoDevice__checkTCCAccess__block_invoke;
    block[3] = &unk_1E5A72ED0;
    void block[4] = self;
    dispatch_sync(fcsQueue, block);
  }
}

uint64_t __42__AVCaptureFigVideoDevice__checkTCCAccess__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 32) + 56);
  if (v1)
  {
    uint64_t VTable = CMBaseObjectGetVTable();
    uint64_t v4 = *(void *)(VTable + 16);
    uint64_t result = VTable + 16;
    uint64_t v3 = v4;
    uint64_t v5 = v4 ? v3 : 0;
    uint64_t v6 = *(uint64_t (**)(uint64_t))(v5 + 24);
    if (v6)
    {
      return v6(v1);
    }
  }
  return result;
}

- (BOOL)isCinematicVideoFocusAtPointSupported
{
  return AVGestaltGetBoolAnswer(@"AVGQCaptureDeviceSupportsCinematicVideoFocusAtPoint");
}

- (void)setCinematicVideoFocusAtPoint:(CGPoint)a3 objectID:(int64_t)a4 isHardFocus:(BOOL)a5 isFixedPlaneFocus:(BOOL)a6
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  if ([(AVCaptureFigVideoDevice *)self isCinematicVideoFocusAtPointSupported])
  {
    uint64_t v21 = 0;
    double v22 = &v21;
    uint64_t v23 = 0x2020000000;
    int v24 = 0;
    devicePropsQueue = self->_devicePropsQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __96__AVCaptureFigVideoDevice_setCinematicVideoFocusAtPoint_objectID_isHardFocus_isFixedPlaneFocus___block_invoke;
    block[3] = &unk_1E5A747F8;
    *(CGFloat *)&void block[6] = x;
    *(CGFloat *)&void block[7] = y;
    void block[8] = a4;
    BOOL v19 = a5;
    BOOL v20 = a6;
    void block[4] = self;
    void block[5] = &v21;
    dispatch_sync(devicePropsQueue, block);
    if (*((_DWORD *)v22 + 6) == -16452)
    {
      long long v13 = (void *)MEMORY[0x1E4F1CA00];
      objc_opt_class();
      long long v14 = (void *)[v13 exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:AVMethodExceptionReasonWithClassAndSelector() userInfo:0];
      if (AVCaptureShouldThrowForAPIViolations()) {
        objc_exception_throw(v14);
      }
      NSLog(&cfstr_SuppressingExc.isa, v14);
    }
    _Block_object_dispose(&v21, 8);
  }
  else
  {
    uint64_t v15 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v16 = *MEMORY[0x1E4F1C3C8];
    objc_opt_class();
    int v17 = (void *)[v15 exceptionWithName:v16 reason:AVMethodExceptionReasonWithClassAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v17);
    }
    NSLog(&cfstr_SuppressingExc.isa, v17);
  }
}

uint64_t __96__AVCaptureFigVideoDevice_setCinematicVideoFocusAtPoint_objectID_isHardFocus_isFixedPlaneFocus___block_invoke(uint64_t a1)
{
  void v5[4] = *MEMORY[0x1E4F143B8];
  v4[0] = *MEMORY[0x1E4F51D20];
  v5[0] = CGPointCreateDictionaryRepresentation(*(CGPoint *)(a1 + 48));
  v4[1] = *MEMORY[0x1E4F51D18];
  v5[1] = [NSNumber numberWithInteger:*(void *)(a1 + 64)];
  v4[2] = *MEMORY[0x1E4F51D10];
  v5[2] = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 72)];
  void v4[3] = *MEMORY[0x1E4F51D08];
  v5[3] = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 73)];
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:4];
  uint64_t result = [*(id *)(a1 + 32) _setFigCaptureSourceProperty:*MEMORY[0x1E4F51FA8] withValue:v2];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)isContinuityCamera
{
  return self->_specialDeviceType == 2;
}

- (id)continuityDeviceUniqueID
{
  return self->_cmioActiveExtensionPropertyListenerHandlers;
}

- (id)companionDeskViewCamera
{
  return 0;
}

- (id)hardwareUniformType
{
  uint64_t v2 = (void *)[(NSUUID *)self->_continuityDeviceUniqueID copy];

  return v2;
}

- (void)setDeskViewCameraMode:(int64_t)a3
{
  if (-[AVCaptureFigVideoDevice isDeskViewCameraModeSupported:](self, "isDeskViewCameraModeSupported:"))
  {
    devicePropsQueue = self->_devicePropsQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__AVCaptureFigVideoDevice_setDeskViewCameraMode___block_invoke;
    block[3] = &unk_1E5A72F98;
    void block[4] = self;
    void block[5] = a3;
    dispatch_sync(devicePropsQueue, block);
  }
  else
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
    objc_opt_class();
    uint64_t v8 = (void *)[v6 exceptionWithName:v7 reason:AVMethodExceptionReasonWithClassAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v8);
    }
    NSLog(&cfstr_SuppressingExc.isa, v8);
  }
}

uint64_t __49__AVCaptureFigVideoDevice_setDeskViewCameraMode___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_setFigCaptureSourceProperty:withValue:", *MEMORY[0x1E4F520A8], objc_msgSend(NSNumber, "numberWithInteger:", *(void *)(a1 + 40)));
  if (!result) {
    *(void *)(*(void *)(a1 + 32) + 1296) = *(void *)(a1 + 40);
  }
  return result;
}

- (int64_t)deskViewCameraMode
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__AVCaptureFigVideoDevice_deskViewCameraMode__block_invoke;
  v5[3] = &unk_1E5A74078;
  void v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __45__AVCaptureFigVideoDevice_deskViewCameraMode__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 1296);
  return result;
}

- (BOOL)isDeskViewCameraModeSupported:(int64_t)a3
{
  if ((objc_msgSend(-[AVCaptureFigVideoDevice deviceType](self, "deviceType"), "isEqualToString:", @"AVCaptureDeviceTypeDeskViewCamera") & 1) != 0|| objc_msgSend(-[AVCaptureFigVideoDevice deviceType](self, "deviceType"), "isEqualToString:", @"AVCaptureDeviceTypeBuiltInUltraWideCamera")&& -[AVCaptureFigVideoDevice position](self, "position") == 1)
  {
    return a3 != 0;
  }
  else
  {
    return a3 == 0;
  }
}

- (void)setCenterStageFieldOfViewRestrictedToWide:(BOOL)a3
{
  if ([(AVCaptureFigVideoDevice *)self isLockedForConfiguration])
  {
    if (+[AVCaptureDevice isCenterStageEnabled])
    {
      devicePropsQueue = self->_devicePropsQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __69__AVCaptureFigVideoDevice_setCenterStageFieldOfViewRestrictedToWide___block_invoke;
      block[3] = &unk_1E5A74028;
      void block[4] = self;
      BOOL v10 = a3;
      dispatch_sync(devicePropsQueue, block);
      return;
    }
    uint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
    objc_opt_class();
  }
  else
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3A8];
    objc_opt_class();
  }
  uint64_t v8 = (void *)[v6 exceptionWithName:v7 reason:AVMethodExceptionReasonWithClassAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v8);
  }
  NSLog(&cfstr_SuppressingExc.isa, v8);
}

uint64_t __69__AVCaptureFigVideoDevice_setCenterStageFieldOfViewRestrictedToWide___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1305) = *(unsigned char *)(a1 + 40);
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *MEMORY[0x1E4F51F88];
  uint64_t v3 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];

  return [v1 _setFigCaptureSourceProperty:v2 withValue:v3];
}

- (BOOL)isCenterStageFieldOfViewRestrictedToWide
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __67__AVCaptureFigVideoDevice_isCenterStageFieldOfViewRestrictedToWide__block_invoke;
  v5[3] = &unk_1E5A74078;
  void v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __67__AVCaptureFigVideoDevice_isCenterStageFieldOfViewRestrictedToWide__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 1305);
  return result;
}

- (void)setManualFramingPanningAngleX:(float)a3
{
  if ([(AVCaptureFigVideoDevice *)self isLockedForConfiguration])
  {
    if (BYTE2(self->_deskViewCameraMode))
    {
      devicePropsQueue = self->_devicePropsQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __57__AVCaptureFigVideoDevice_setManualFramingPanningAngleX___block_invoke;
      block[3] = &unk_1E5A74370;
      void block[4] = self;
      float v10 = a3;
      dispatch_sync(devicePropsQueue, block);
      return;
    }
    uint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
    objc_opt_class();
  }
  else
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3A8];
    objc_opt_class();
  }
  uint64_t v8 = (void *)[v6 exceptionWithName:v7 reason:AVMethodExceptionReasonWithClassAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v8);
  }
  NSLog(&cfstr_SuppressingExc.isa, v8);
}

float __57__AVCaptureFigVideoDevice_setManualFramingPanningAngleX___block_invoke(uint64_t a1)
{
  float result = *(float *)(a1 + 40);
  *(float *)(*(void *)(a1 + 32) + 1308) = result;
  return result;
}

- (float)manualFramingPanningAngleX
{
  uint64_t v6 = 0;
  uint64_t v7 = (float *)&v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__AVCaptureFigVideoDevice_manualFramingPanningAngleX__block_invoke;
  v5[3] = &unk_1E5A74078;
  void v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  float v3 = v7[6];
  _Block_object_dispose(&v6, 8);
  return v3;
}

float __53__AVCaptureFigVideoDevice_manualFramingPanningAngleX__block_invoke(uint64_t a1)
{
  float result = *(float *)(*(void *)(a1 + 32) + 1308);
  *(float *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setManualFramingPanningAngleY:(float)a3
{
  if ([(AVCaptureFigVideoDevice *)self isLockedForConfiguration])
  {
    if (BYTE2(self->_deskViewCameraMode))
    {
      devicePropsQueue = self->_devicePropsQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __57__AVCaptureFigVideoDevice_setManualFramingPanningAngleY___block_invoke;
      block[3] = &unk_1E5A74370;
      void block[4] = self;
      float v10 = a3;
      dispatch_sync(devicePropsQueue, block);
      return;
    }
    uint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
    objc_opt_class();
  }
  else
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3A8];
    objc_opt_class();
  }
  uint64_t v8 = (void *)[v6 exceptionWithName:v7 reason:AVMethodExceptionReasonWithClassAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v8);
  }
  NSLog(&cfstr_SuppressingExc.isa, v8);
}

float __57__AVCaptureFigVideoDevice_setManualFramingPanningAngleY___block_invoke(uint64_t a1)
{
  float result = *(float *)(a1 + 40);
  *(float *)(*(void *)(a1 + 32) + 1312) = result;
  return result;
}

- (float)manualFramingPanningAngleY
{
  uint64_t v6 = 0;
  uint64_t v7 = (float *)&v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__AVCaptureFigVideoDevice_manualFramingPanningAngleY__block_invoke;
  v5[3] = &unk_1E5A74078;
  void v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  float v3 = v7[6];
  _Block_object_dispose(&v6, 8);
  return v3;
}

float __53__AVCaptureFigVideoDevice_manualFramingPanningAngleY__block_invoke(uint64_t a1)
{
  float result = *(float *)(*(void *)(a1 + 32) + 1312);
  *(float *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)startPanningAtPoint:(CGPoint)a3
{
  devicePropsQueue = self->_devicePropsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__AVCaptureFigVideoDevice_startPanningAtPoint___block_invoke;
  block[3] = &unk_1E5A72F70;
  CGPoint v5 = a3;
  void block[4] = self;
  dispatch_sync(devicePropsQueue, block);
}

uint64_t __47__AVCaptureFigVideoDevice_startPanningAtPoint___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _setFigCaptureSourceProperty:*MEMORY[0x1E4F520F8] withValue:CGPointCreateDictionaryRepresentation(*(CGPoint *)(a1 + 40))];
  *(unsigned char *)(*(void *)(a1 + 32) + 1304) = 1;
  return result;
}

- (void)panWithTranslation:(CGPoint)a3
{
  if (LOBYTE(self->_deskViewCameraMode))
  {
    devicePropsQueue = self->_devicePropsQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__AVCaptureFigVideoDevice_panWithTranslation___block_invoke;
    block[3] = &unk_1E5A72F70;
    CGPoint v8 = a3;
    void block[4] = self;
    dispatch_sync(devicePropsQueue, block);
  }
  else
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v5 = *MEMORY[0x1E4F1C3B8];
    objc_opt_class();
    uint64_t v6 = (void *)[v4 exceptionWithName:v5 reason:AVMethodExceptionReasonWithClassAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v6);
    }
    NSLog(&cfstr_SuppressingExc.isa, v6);
  }
}

uint64_t __46__AVCaptureFigVideoDevice_panWithTranslation___block_invoke(uint64_t a1)
{
  CFDictionaryRef v2 = CGPointCreateDictionaryRepresentation(*(CGPoint *)(a1 + 40));
  float v3 = *(void **)(a1 + 32);
  uint64_t v4 = *MEMORY[0x1E4F520B0];

  return [v3 _setFigCaptureSourceProperty:v4 withValue:v2];
}

- (void)performOneShotFraming
{
  devicePropsQueue = self->_devicePropsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__AVCaptureFigVideoDevice_performOneShotFraming__block_invoke;
  block[3] = &unk_1E5A72ED0;
  void block[4] = self;
  dispatch_sync(devicePropsQueue, block);
}

uint64_t __48__AVCaptureFigVideoDevice_performOneShotFraming__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setFigCaptureSourceProperty:*MEMORY[0x1E4F520B8] withValue:MEMORY[0x1E4F1CC38]];
}

- (void)resetFraming
{
  devicePropsQueue = self->_devicePropsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__AVCaptureFigVideoDevice_resetFraming__block_invoke;
  block[3] = &unk_1E5A72ED0;
  void block[4] = self;
  dispatch_sync(devicePropsQueue, block);
}

uint64_t __39__AVCaptureFigVideoDevice_resetFraming__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setFigCaptureSourceProperty:*MEMORY[0x1E4F520D8] withValue:MEMORY[0x1E4F1CC38]];
}

- (BOOL)isDockedTrackingSupported
{
  id v2 = [(NSDictionary *)self->_fcsAttributes objectForKeyedSubscript:*MEMORY[0x1E4F51B68]];

  return [v2 BOOLValue];
}

- (void)setDockedTrackingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(AVCaptureFigVideoDevice *)self isLockedForConfiguration])
  {
    if (!v3 || [(AVCaptureFigVideoDevice *)self isDockedTrackingSupported])
    {
      devicePropsQueue = self->_devicePropsQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __52__AVCaptureFigVideoDevice_setDockedTrackingEnabled___block_invoke;
      block[3] = &unk_1E5A74028;
      void block[4] = self;
      BOOL v10 = v3;
      dispatch_sync(devicePropsQueue, block);
      return;
    }
    uint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
    objc_opt_class();
  }
  else
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3A8];
    objc_opt_class();
  }
  CGPoint v8 = (void *)[v6 exceptionWithName:v7 reason:AVMethodExceptionReasonWithClassAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v8);
  }
  NSLog(&cfstr_SuppressingExc.isa, v8);
}

uint64_t __52__AVCaptureFigVideoDevice_setDockedTrackingEnabled___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 1376) = *(unsigned char *)(result + 40);
  return result;
}

- (BOOL)isSceneClassificationActive
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__AVCaptureFigVideoDevice_isSceneClassificationActive__block_invoke;
  v5[3] = &unk_1E5A74078;
  void v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __54__AVCaptureFigVideoDevice_isSceneClassificationActive__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 640);
  return result;
}

- (float)documentSceneConfidence
{
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x3052000000;
  long long v14 = __Block_byref_object_copy__5;
  uint64_t v15 = __Block_byref_object_dispose__5;
  uint64_t v16 = 0;
  if ([(AVCaptureFigVideoDevice *)self _hasKeyValueObserversForHighFrequencyProperty:@"documentSceneConfidence"])
  {
    devicePropsQueue = self->_devicePropsQueue;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __50__AVCaptureFigVideoDevice_documentSceneConfidence__block_invoke;
    v10[3] = &unk_1E5A74078;
    v10[4] = self;
    void v10[5] = &v11;
    dispatch_sync(devicePropsQueue, v10);
  }
  id v4 = (id)v12[5];
  if (!v4)
  {
    id v4 = [(AVCaptureFigVideoDevice *)self _copyFigCaptureSourceProperty:*MEMORY[0x1E4F520E8]];
    v12[5] = (uint64_t)v4;
  }
  uint64_t v5 = (void *)[v4 objectForKeyedSubscript:*MEMORY[0x1E4F52490]];
  if (v5)
  {
    [v5 floatValue];
    float v7 = v6;
  }
  else
  {
    float v7 = -1.0;
  }
  uint64_t v8 = (const void *)v12[5];
  if (v8) {
    CFRelease(v8);
  }
  _Block_object_dispose(&v11, 8);
  return v7;
}

CFTypeRef __50__AVCaptureFigVideoDevice_documentSceneConfidence__block_invoke(uint64_t a1)
{
  CFTypeRef result = *(CFTypeRef *)(*(void *)(a1 + 32) + 648);
  if (result) {
    CFTypeRef result = CFRetain(result);
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

@end