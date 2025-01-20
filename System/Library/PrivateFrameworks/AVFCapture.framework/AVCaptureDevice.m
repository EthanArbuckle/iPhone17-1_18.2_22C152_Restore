@interface AVCaptureDevice
+ (AVAuthorizationStatus)authorizationStatusForMediaType:(AVMediaType)mediaType;
+ (AVCaptureCenterStageControlMode)centerStageControlMode;
+ (AVCaptureDevice)defaultDeviceWithDeviceType:(AVCaptureDeviceType)deviceType mediaType:(AVMediaType)mediaType position:(AVCaptureDevicePosition)position;
+ (AVCaptureDevice)defaultDeviceWithMediaType:(AVMediaType)mediaType;
+ (AVCaptureDevice)deviceWithUniqueID:(NSString *)deviceUniqueID;
+ (AVCaptureDevice)systemPreferredCamera;
+ (AVCaptureDevice)userPreferredCamera;
+ (AVCaptureMicrophoneMode)activeMicrophoneMode;
+ (AVCaptureMicrophoneMode)preferredMicrophoneMode;
+ (AudioValueRange)backgroundBlurApertureRange;
+ (BOOL)_checkEligiblityForEffect:(id)a3;
+ (BOOL)_defaultCenterStageEnabled;
+ (BOOL)allowsSuspendedPreferredCameras;
+ (BOOL)defaultCenterStageEnabledForBundleID:(id)a3;
+ (BOOL)haveShownGesturesDefaultDisabledNotification;
+ (BOOL)isBackgroundReplacementEnabled;
+ (BOOL)isCenterStageEnabled;
+ (BOOL)isEligibleForBackgroundBlur;
+ (BOOL)isEligibleForBackgroundReplacement;
+ (BOOL)isEligibleForReactionEffects;
+ (BOOL)isEligibleForStudioLighting;
+ (BOOL)isPortraitEffectEnabled;
+ (BOOL)isStudioLightEnabled;
+ (BOOL)reactionEffectGesturesEnabled;
+ (BOOL)reactionEffectGesturesEnabledDefault;
+ (BOOL)reactionEffectsEnabled;
+ (BOOL)reactionEffectsEnabledDefault;
+ (NSArray)devices;
+ (NSData)extrinsicMatrixFromDevice:(AVCaptureDevice *)fromDevice toDevice:(AVCaptureDevice *)toDevice;
+ (__CVBuffer)backgroundReplacementPixelBuffer;
+ (float)backgroundBlurAperture;
+ (float)backgroundBlurApertureDefault;
+ (float)studioLightingIntensity;
+ (float)studioLightingIntensityDefault;
+ (id)_centerStageAllowList;
+ (id)_defaultDeviceWithDeviceType:(id)a3 mediaType:(id)a4 position:(int64_t)a5 prefersUnsuspendedAndAllowsAnyPosition:(BOOL)a6;
+ (id)_devices;
+ (id)_devicesWithDeviceTypes:(id)a3 mediaType:(id)a4 position:(int64_t)a5;
+ (id)_devicesWithPriorRegisteredDevices:(id)a3;
+ (id)_legacyDevicesWithMediaType:(id)a3;
+ (id)_listEligibleEffects;
+ (id)backgroundReplacementURL;
+ (id)backgroundReplacementURLDefault;
+ (id)cameraInfoForCreatorID:(id)a3 uniqueID:(id)a4 specialDeviceType:(unsigned int)a5 centerStageSupported:(BOOL)a6;
+ (id)continuityCaptureCameraCapabilities;
+ (id)continuityCaptureLastUsedDate;
+ (id)devicesForDefaultDeviceSupport:(BOOL)a3 includeAudioDevices:(BOOL)a4;
+ (id)proprietaryDefaultsDomainForAuditToken:(id *)a3;
+ (id)valueForKey:(id)a3;
+ (int64_t)backgroundBlurControlMode;
+ (int64_t)centerStageFramingMode;
+ (int64_t)portraitEffectStudioLightQuality;
+ (int64_t)studioLightingControlMode;
+ (void)_activeMicrophoneModeChanged:(id)a3;
+ (void)_backgroundBlurApertureChanged:(id)a3;
+ (void)_backgroundBlurEnabledChanged:(id)a3;
+ (void)_backgroundReplacementEnabledChanged:(id)a3;
+ (void)_backgroundReplacementURLBookmarkChanged:(id)a3;
+ (void)_cinematicFramingEnabledChanged:(id)a3;
+ (void)_filterConnectedDevices:(id)a3 withDeviceTypes:(id)a4 mediaType:(id)a5 position:(int64_t)a6;
+ (void)_filterConnectedLegacyDevices:(id)a3;
+ (void)_gesturesEnabledChanged:(id)a3;
+ (void)_haveShownGesturesDefaultDisabledNotificationChanged:(id)a3;
+ (void)_preferredMicrophoneModeChanged:(id)a3;
+ (void)_reactionTriggered:(id)a3;
+ (void)_reactionsEnabledChanged:(id)a3;
+ (void)_reactionsInProgressChangedByControlCenter:(id)a3;
+ (void)_reconnectDevices:(id)a3;
+ (void)_registerOnceForServerConnectionDiedNotification;
+ (void)_releaseStaticResources;
+ (void)_studioLightEnabledChanged:(id)a3;
+ (void)_studioLightingIntensityChanged:(id)a3;
+ (void)addObserver:(id)a3 forKeyPath:(id)a4 options:(unint64_t)a5 context:(void *)a6;
+ (void)didChangeValueForKey:(id)a3;
+ (void)ensureServerConnection;
+ (void)initialize;
+ (void)removeObserver:(id)a3 forKeyPath:(id)a4;
+ (void)removeObserver:(id)a3 forKeyPath:(id)a4 context:(void *)a5;
+ (void)requestAccessForMediaType:(AVMediaType)mediaType completionHandler:(void *)handler;
+ (void)requestGesturesDefaultDisabledNotification;
+ (void)setAllowsSuspendedPreferredCameras:(BOOL)a3;
+ (void)setBackgroundBlurAperture:(float)a3;
+ (void)setBackgroundBlurControlMode:(int64_t)a3;
+ (void)setBackgroundBlurEnabled:(BOOL)a3;
+ (void)setBackgroundReplacementEnabled:(BOOL)a3;
+ (void)setBackgroundReplacementPixelBuffer:(__CVBuffer *)a3;
+ (void)setBackgroundReplacementURL:(id)a3;
+ (void)setCenterStageControlMode:(AVCaptureCenterStageControlMode)centerStageControlMode;
+ (void)setCenterStageEnabled:(BOOL)centerStageEnabled;
+ (void)setCenterStageFramingMode:(int64_t)a3;
+ (void)setControlCenterVideoEffectUnavailableReasonsForVideoEffect:(id)a3 reasons:(unint64_t)a4;
+ (void)setPortraitEffectStudioLightQuality:(int64_t)a3;
+ (void)setReactionEffectGesturesEnabled:(BOOL)a3;
+ (void)setReactionEffectsEnabled:(BOOL)a3;
+ (void)setStudioLightingControlMode:(int64_t)a3;
+ (void)setStudioLightingEnabled:(BOOL)a3;
+ (void)setStudioLightingIntensity:(float)a3;
+ (void)setUpBackgroundBlurStateOnce;
+ (void)setUpBackgroundReplacementStateOnce;
+ (void)setUpCenterStageStateOnce;
+ (void)setUpGesturesDefaultDisabledNotification;
+ (void)setUpMicrophoneModeStateOnce;
+ (void)setUpReactionEffectsStateOnce;
+ (void)setUpStudioLightingStateOnce;
+ (void)setUserPreferredCamera:(AVCaptureDevice *)userPreferredCamera;
+ (void)setUserPreferredCamera:(id)a3 forClientPreferenceDomain:(id)a4;
+ (void)setValue:(id)a3 forKey:(id)a4;
+ (void)setupKVOLoggingOnce;
+ (void)showSystemUserInterface:(AVCaptureSystemUserInterface)systemUserInterface;
+ (void)updateUserPreferredCameraOverride:(BOOL)a3 cameraInfo:(id)a4;
+ (void)updateUserPreferredCameraOverrideHistoryWithDevice:(id)a3 setOverride:(BOOL)a4;
+ (void)willChangeValueForKey:(id)a3;
- ($2825F4736939C4A6D3AD43837233062D)maxH264PhotoDimensions;
- ($2825F4736939C4A6D3AD43837233062D)maxH264VideoDimensions;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)activeMaxExposureDurationClientOverride;
- (AVCaptureAutoFocusRangeRestriction)autoFocusRangeRestriction;
- (AVCaptureColorSpace)activeColorSpace;
- (AVCaptureDevice)activePrimaryConstituentDevice;
- (AVCaptureDevice)companionDeskViewCamera;
- (AVCaptureDeviceFormat)activeDepthDataFormat;
- (AVCaptureDeviceFormat)activeFormat;
- (AVCaptureDeviceInputSource)activeInputSource;
- (AVCaptureDevicePosition)position;
- (AVCaptureDeviceType)deviceType;
- (AVCaptureExposureMode)exposureMode;
- (AVCaptureFlashMode)flashMode;
- (AVCaptureFocusMode)focusMode;
- (AVCapturePrimaryConstituentDeviceRestrictedSwitchingBehaviorConditions)activePrimaryConstituentDeviceRestrictedSwitchingBehaviorConditions;
- (AVCapturePrimaryConstituentDeviceRestrictedSwitchingBehaviorConditions)primaryConstituentDeviceRestrictedSwitchingBehaviorConditions;
- (AVCapturePrimaryConstituentDeviceSwitchingBehavior)activePrimaryConstituentDeviceSwitchingBehavior;
- (AVCapturePrimaryConstituentDeviceSwitchingBehavior)primaryConstituentDeviceSwitchingBehavior;
- (AVCaptureSystemPressureState)systemPressureState;
- (AVCaptureTorchMode)torchMode;
- (AVCaptureWhiteBalanceChromaticityValues)chromaticityValuesForDeviceWhiteBalanceGains:(AVCaptureWhiteBalanceGains)whiteBalanceGains;
- (AVCaptureWhiteBalanceGains)deviceWhiteBalanceGains;
- (AVCaptureWhiteBalanceGains)deviceWhiteBalanceGainsForChromaticityValues:(AVCaptureWhiteBalanceChromaticityValues)chromaticityValues;
- (AVCaptureWhiteBalanceGains)deviceWhiteBalanceGainsForTemperatureAndTintValues:(AVCaptureWhiteBalanceTemperatureAndTintValues)tempAndTintValues;
- (AVCaptureWhiteBalanceGains)grayWorldDeviceWhiteBalanceGains;
- (AVCaptureWhiteBalanceMode)whiteBalanceMode;
- (AVCaptureWhiteBalanceTemperatureAndTintValues)temperatureAndTintValuesForDeviceWhiteBalanceGains:(AVCaptureWhiteBalanceGains)whiteBalanceGains;
- (BOOL)_isDepthDataDeliveryEnabled;
- (BOOL)_isFlashScene;
- (BOOL)_startUsingDevice:(id *)a3;
- (BOOL)addCMIOExtensionPropertyValueChangeHandler:(id)a3;
- (BOOL)appliesSessionPresetMaxIntegrationTimeOverrideToActiveFormat;
- (BOOL)automaticallyAdjustsFaceDrivenAutoExposureEnabled;
- (BOOL)automaticallyAdjustsFaceDrivenAutoFocusEnabled;
- (BOOL)automaticallyAdjustsImageControlMode;
- (BOOL)automaticallyAdjustsVideoHDREnabled;
- (BOOL)automaticallyEnablesLowLightBoostWhenAvailable;
- (BOOL)cachesFigCaptureSourceConfigurationChanges;
- (BOOL)canPerformReactionEffects;
- (BOOL)eyeClosedDetectionEnabled;
- (BOOL)eyeDetectionEnabled;
- (BOOL)hasFlash;
- (BOOL)hasMediaType:(AVMediaType)mediaType;
- (BOOL)hasTorch;
- (BOOL)hevcAllowBFramesForHighCTUCount;
- (BOOL)isActiveVideoMaxFrameDurationSet;
- (BOOL)isActiveVideoMinFrameDurationSet;
- (BOOL)isAdjustingExposure;
- (BOOL)isAdjustingFocus;
- (BOOL)isAdjustingWhiteBalance;
- (BOOL)isAttentionDetectionSupported;
- (BOOL)isAudioCaptureModeSupported:(int64_t)a3;
- (BOOL)isAutoFocusRangeRestrictionSupported;
- (BOOL)isAutoRedEyeReductionSupported;
- (BOOL)isAutoVideoFrameRateEnabled;
- (BOOL)isBackgroundReplacementActive;
- (BOOL)isCameraIntrinsicMatrixDeliverySupported;
- (BOOL)isCenterStageActive;
- (BOOL)isCenterStageFieldOfViewRestrictedToWide;
- (BOOL)isCenterStageMetadataDeliveryEnabled;
- (BOOL)isCenterStageMetadataDeliverySupported;
- (BOOL)isCenterStageRectOfInterestSupported;
- (BOOL)isCinematicVideoFocusAtPointSupported;
- (BOOL)isConnected;
- (BOOL)isConstituentPhotoCalibrationDataSupported;
- (BOOL)isContinuityCamera;
- (BOOL)isContinuousZoomWithDepthEnabled;
- (BOOL)isContinuousZoomWithDepthSupported;
- (BOOL)isDeskViewCameraModeSupported:(int64_t)a3;
- (BOOL)isDockedTrackingEnabled;
- (BOOL)isDockedTrackingSupported;
- (BOOL)isExposureModeSupported:(AVCaptureExposureMode)exposureMode;
- (BOOL)isExposurePointOfInterestSupported;
- (BOOL)isEyeClosedDetectionSupported;
- (BOOL)isEyeDetectionSupported;
- (BOOL)isFaceDetectionDrivenImageProcessingEnabled;
- (BOOL)isFaceDetectionDuringVideoPreviewSupported;
- (BOOL)isFaceDetectionSupported;
- (BOOL)isFaceDrivenAutoExposureEnabled;
- (BOOL)isFaceDrivenAutoFocusEnabled;
- (BOOL)isFlashActive;
- (BOOL)isFlashAvailable;
- (BOOL)isFlashModeSupported:(AVCaptureFlashMode)flashMode;
- (BOOL)isFlashSceneDetectedForPhotoOutput;
- (BOOL)isFocusModeSupported:(AVCaptureFocusMode)focusMode;
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
- (BOOL)isInUseByAnotherApplication;
- (BOOL)isLensStabilizationSupported;
- (BOOL)isLockedForConfiguration;
- (BOOL)isLockingFocusWithCustomLensPositionSupported;
- (BOOL)isLockingWhiteBalanceWithCustomDeviceGainsSupported;
- (BOOL)isLowLightBoostEnabled;
- (BOOL)isLowLightBoostSupported;
- (BOOL)isLowLightVideoCaptureEnabled;
- (BOOL)isMachineReadableCodeDetectionSupported;
- (BOOL)isManualFramingEnabled;
- (BOOL)isManualFramingSupported;
- (BOOL)isMotionCompensatedTemporalFilteringSupported;
- (BOOL)isNonDestructiveCropEnabled;
- (BOOL)isOpen;
- (BOOL)isPortraitEffectActive;
- (BOOL)isProResSupported;
- (BOOL)isProxyDevice;
- (BOOL)isRampingVideoZoom;
- (BOOL)isResponsiveCaptureWithDepthSupported;
- (BOOL)isSceneClassificationActive;
- (BOOL)isSmileDetectionSupported;
- (BOOL)isSmoothAutoFocusEnabled;
- (BOOL)isSmoothAutoFocusSupported;
- (BOOL)isSoonToBeDisconnected;
- (BOOL)isSpatialOverCaptureEnabled;
- (BOOL)isStudioLightActive;
- (BOOL)isSubjectAreaChangeMonitoringEnabled;
- (BOOL)isSuspended;
- (BOOL)isTimeOfFlightProjectorModeSupported:(int64_t)a3;
- (BOOL)isTorchActive;
- (BOOL)isTorchAvailable;
- (BOOL)isTorchModeSupported:(AVCaptureTorchMode)torchMode;
- (BOOL)isVariableFrameRateVideoCaptureEnabled;
- (BOOL)isVideoHDREnabled;
- (BOOL)isVideoHDRSuspended;
- (BOOL)isVideoStabilizationSupported;
- (BOOL)isVideoZoomSmoothingSupported;
- (BOOL)isVirtualDevice;
- (BOOL)isWhiteBalanceModeSupported:(AVCaptureWhiteBalanceMode)whiteBalanceMode;
- (BOOL)isWideColorSupported;
- (BOOL)isWindNoiseRemovalSupported;
- (BOOL)lockForConfiguration:(NSError *)outError;
- (BOOL)open:(id *)a3;
- (BOOL)providesStortorgetMetadata;
- (BOOL)setTorchModeOnWithLevel:(float)torchLevel error:(NSError *)outError;
- (BOOL)setValue:(id)a3 forCMIOExtensionProperty:(id)a4 error:(id *)a5;
- (BOOL)shouldAudioCaptureModeTriggerGraphRebuildOnAudioRouteChange:(int64_t)a3;
- (BOOL)smileDetectionEnabled;
- (BOOL)startUsingDevice:(id *)a3;
- (BOOL)supportsAVCaptureSessionPreset:(AVCaptureSessionPreset)preset;
- (BOOL)supportsMultiCamCaptureWithDevice:(id)a3;
- (BOOL)ultraHighResolutionZeroShutterLagEnabled;
- (BOOL)usesQuantizationScalingMatrix_H264_Steep_16_48;
- (BOOL)wideAngleCameraSourcesFromUltraWide;
- (CGFloat)displayVideoZoomFactorMultiplier;
- (CGFloat)dualCameraSwitchOverVideoZoomFactor;
- (CGFloat)maxAvailableVideoZoomFactor;
- (CGFloat)minAvailableVideoZoomFactor;
- (CGFloat)videoZoomFactor;
- (CGPoint)exposurePointOfInterest;
- (CGPoint)focusPointOfInterest;
- (CGRect)centerStageRectOfInterest;
- (CGRect)faceRectangle;
- (CMTime)activeDepthDataMinFrameDuration;
- (CMTime)activeMaxExposureDuration;
- (CMTime)activeVideoMaxFrameDuration;
- (CMTime)activeVideoMinFrameDuration;
- (CMTime)exposureDuration;
- (NSArray)constituentDevices;
- (NSArray)fallbackPrimaryConstituentDevices;
- (NSArray)formats;
- (NSArray)inputSources;
- (NSArray)linkedDevices;
- (NSArray)reactionEffectsInProgress;
- (NSArray)supportedFallbackPrimaryConstituentDevices;
- (NSArray)virtualDeviceSwitchOverVideoZoomFactors;
- (NSInteger)minimumFocusDistance;
- (NSSet)availableReactionTypes;
- (NSString)localizedName;
- (NSString)manufacturer;
- (NSString)modelID;
- (NSString)uniqueID;
- (OpaqueCMClock)deviceClock;
- (double)manualFramingDefaultZoomFactor;
- (double)manualFramingMaxZoomFactor;
- (double)manualFramingMinZoomFactor;
- (double)maxAvailableVideoZoomFactorOverride;
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
- (id)AVVideoSettingsForSessionPreset:(id)a3;
- (id)_digitalFlashExposureTimes;
- (id)availableBoxedMetadataFormatDescriptions;
- (id)bravoCameraSelectionBehavior;
- (id)cameraPoseMatrix;
- (id)clientAudioClockDeviceUID;
- (id)constituentDeviceWithDeviceType:(id)a3;
- (id)continuityDeviceUniqueID;
- (id)copyValueForCMIOExtensionProperty:(id)a3 error:(id *)a4;
- (id)debugDescription;
- (id)description;
- (id)digitalFlashSceneForPhotoOutput;
- (id)hardwareUniformType;
- (id)initProxyDeviceWithUniqueID:(id)a3 targetClientAuditToken:(id *)a4;
- (id)initSubclass;
- (id)preferredPrimaryConstituentDevice;
- (id)serializedProcessingSettings;
- (id)spatialCaptureDiscomfortReasons;
- (id)supportedMetadataObjectIdentifiers;
- (id)supportedVisionDataProperties;
- (int)faceDrivenAEAFMode;
- (int)faceRectangleAngle;
- (int)hevcTurboModeVersion;
- (int)minMacroblocksForHighProfileAbove30fps;
- (int)minMacroblocksForHighProfileUpTo30fps;
- (int)powerConsumptionAt30FPSForOISMode:(int)a3;
- (int32_t)transportType;
- (int64_t)_digitalFlashStatus;
- (int64_t)deskViewCameraMode;
- (int64_t)digitalFlashMode;
- (int64_t)fallbackAudioCaptureModeIfApplicableForCurrentRoute:(int64_t)a3;
- (int64_t)imageControlMode;
- (int64_t)nonDestructiveCropAspectRatio;
- (int64_t)shallowDepthOfFieldEffectStatus;
- (int64_t)timeOfFlightBankCount;
- (int64_t)timeOfFlightProjectorMode;
- (int64_t)videoStabilizationStrength;
- (unint64_t)degradedCaptureQualityFactors;
- (unint64_t)stereoCaptureStatus;
- (unint64_t)stereoVideoCaptureStatus;
- (void)_setPhotoSettingsForSceneMonitoring:(id)a3;
- (void)_setStillImageStabilizationAutomaticallyEnabled:(BOOL)a3;
- (void)_setVideoHDREnabled:(BOOL)a3 forceResetVideoHDRSuspended:(BOOL)a4;
- (void)_stopUsingDevice;
- (void)cancelVideoZoomRamp;
- (void)close;
- (void)dealloc;
- (void)panWithTranslation:(CGPoint)a3;
- (void)performEffectForReaction:(AVCaptureReactionType)reactionType;
- (void)performOneShotFraming;
- (void)rampExponentiallyToVideoZoomFactor:(float)a3 withDuration:(double)a4;
- (void)rampToVideoZoomFactor:(CGFloat)factor withRate:(float)rate;
- (void)rampToVideoZoomFactor:(float)a3 withTuning:(int64_t)a4;
- (void)resetFraming;
- (void)setActiveColorSpace:(AVCaptureColorSpace)activeColorSpace;
- (void)setActiveDepthDataFormat:(AVCaptureDeviceFormat *)activeDepthDataFormat;
- (void)setActiveDepthDataMinFrameDuration:(CMTime *)activeDepthDataMinFrameDuration;
- (void)setActiveFormat:(AVCaptureDeviceFormat *)activeFormat;
- (void)setActiveInputSource:(AVCaptureDeviceInputSource *)activeInputSource;
- (void)setActiveMaxExposureDuration:(CMTime *)activeMaxExposureDuration;
- (void)setActiveVideoMaxFrameDuration:(CMTime *)activeVideoMaxFrameDuration;
- (void)setActiveVideoMinFrameDuration:(CMTime *)activeVideoMinFrameDuration;
- (void)setAutoFocusRangeRestriction:(AVCaptureAutoFocusRangeRestriction)autoFocusRangeRestriction;
- (void)setAutoVideoFrameRateEnabled:(BOOL)a3;
- (void)setAutomaticallyAdjustsFaceDrivenAutoExposureEnabled:(BOOL)automaticallyAdjustsFaceDrivenAutoExposureEnabled;
- (void)setAutomaticallyAdjustsFaceDrivenAutoFocusEnabled:(BOOL)automaticallyAdjustsFaceDrivenAutoFocusEnabled;
- (void)setAutomaticallyAdjustsImageControlMode:(BOOL)a3;
- (void)setAutomaticallyAdjustsVideoHDREnabled:(BOOL)automaticallyAdjustsVideoHDREnabled;
- (void)setAutomaticallyEnablesLowLightBoostWhenAvailable:(BOOL)automaticallyEnablesLowLightBoostWhenAvailable;
- (void)setCachesFigCaptureSourceConfigurationChanges:(BOOL)a3;
- (void)setCenterStageFieldOfViewRestrictedToWide:(BOOL)a3;
- (void)setCenterStageMetadataDeliveryEnabled:(BOOL)a3;
- (void)setCenterStageRectOfInterest:(CGRect)centerStageRectOfInterest;
- (void)setCinematicVideoFocusAtPoint:(CGPoint)a3 objectID:(int64_t)a4 isHardFocus:(BOOL)a5 isFixedPlaneFocus:(BOOL)a6;
- (void)setClientAudioClockDeviceUID:(id)a3;
- (void)setContinuousZoomWithDepthEnabled:(BOOL)a3;
- (void)setDeskViewCameraMode:(int64_t)a3;
- (void)setDigitalFlashMode:(int64_t)a3;
- (void)setDockedTrackingEnabled:(BOOL)a3;
- (void)setExposureMode:(AVCaptureExposureMode)exposureMode;
- (void)setExposureModeCustomWithDuration:(CMTime *)duration ISO:(float)ISO completionHandler:(void *)handler;
- (void)setExposurePointOfInterest:(CGPoint)exposurePointOfInterest;
- (void)setExposureTargetBias:(float)bias completionHandler:(void *)handler;
- (void)setEyeClosedDetectionEnabled:(BOOL)a3;
- (void)setEyeDetectionEnabled:(BOOL)a3;
- (void)setFaceDetectionDrivenImageProcessingEnabled:(BOOL)a3;
- (void)setFaceDrivenAutoExposureEnabled:(BOOL)faceDrivenAutoExposureEnabled;
- (void)setFaceDrivenAutoFocusEnabled:(BOOL)faceDrivenAutoFocusEnabled;
- (void)setFallbackPrimaryConstituentDevices:(NSArray *)fallbackPrimaryConstituentDevices;
- (void)setFlashMode:(AVCaptureFlashMode)flashMode;
- (void)setFocusMode:(AVCaptureFocusMode)focusMode;
- (void)setFocusModeLockedWithLensPosition:(float)lensPosition completionHandler:(void *)handler;
- (void)setFocusPointOfInterest:(CGPoint)focusPointOfInterest;
- (void)setGazeSelectionEnabled:(BOOL)a3;
- (void)setGeometricDistortionCorrectionEnabled:(BOOL)geometricDistortionCorrectionEnabled;
- (void)setGlobalToneMappingEnabled:(BOOL)globalToneMappingEnabled;
- (void)setImageControlMode:(int64_t)a3;
- (void)setLowLightVideoCaptureEnabled:(BOOL)a3;
- (void)setManualFramingEnabled:(BOOL)a3;
- (void)setManualFramingPanningAngleX:(float)a3;
- (void)setManualFramingPanningAngleY:(float)a3;
- (void)setMaxAvailableVideoZoomFactorOverride:(double)a3;
- (void)setNonDestructiveCropAspectRatio:(int64_t)a3;
- (void)setNonDestructiveCropEnabled:(BOOL)a3;
- (void)setPrimaryConstituentDeviceSwitchingBehavior:(AVCapturePrimaryConstituentDeviceSwitchingBehavior)switchingBehavior restrictedSwitchingBehaviorConditions:(AVCapturePrimaryConstituentDeviceRestrictedSwitchingBehaviorConditions)restrictedSwitchingBehaviorConditions;
- (void)setProvidesStortorgetMetadata:(BOOL)a3;
- (void)setSmileDetectionEnabled:(BOOL)a3;
- (void)setSmoothAutoFocusEnabled:(BOOL)smoothAutoFocusEnabled;
- (void)setSpatialOverCaptureEnabled:(BOOL)a3;
- (void)setTimeLapseCaptureRate:(float)a3;
- (void)setTimeOfFlightProjectorMode:(int64_t)a3;
- (void)setTorchMode:(AVCaptureTorchMode)torchMode;
- (void)setUltraHighResolutionZeroShutterLagEnabled:(BOOL)a3;
- (void)setVariableFrameRateVideoCaptureEnabled:(BOOL)a3;
- (void)setVideoHDREnabled:(BOOL)videoHDREnabled;
- (void)setVideoHDRSuspended:(BOOL)a3;
- (void)setVideoStabilizationStrength:(int64_t)a3;
- (void)setVideoZoomFactor:(CGFloat)videoZoomFactor;
- (void)setWhiteBalanceMode:(AVCaptureWhiteBalanceMode)whiteBalanceMode;
- (void)setWhiteBalanceModeLockedWithDeviceWhiteBalanceGains:(AVCaptureWhiteBalanceGains)whiteBalanceGains completionHandler:(void *)handler;
- (void)startPanningAtPoint:(CGPoint)a3;
- (void)unlockForConfiguration;
- (void)updateReactionsInProgress:(id)a3;
@end

@implementation AVCaptureDevice

uint64_t __62__AVCaptureDevice__devicesWithDeviceTypes_mediaType_position___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

uint64_t __78__AVCaptureDevice__filterConnectedDevices_withDeviceTypes_mediaType_position___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  if (!*(unsigned char *)(a1 + 40)
    || (v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "indexOfObject:", objc_msgSend(a2, "deviceType"))), (uint64_t result = objc_msgSend(v6, "compare:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "indexOfObject:", objc_msgSend(a3, "deviceType"))))) == 0))
  {
    v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a2, "position"));
    uint64_t v9 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a3, "position"));
    return [v8 compare:v9];
  }
  return result;
}

uint64_t __78__AVCaptureDevice__filterConnectedDevices_withDeviceTypes_mediaType_position___block_invoke(void *a1, void *a2)
{
  if (![a2 isConnected]
    || a1[6] && [a2 position] != a1[6]
    || a1[4] && !objc_msgSend(a2, "hasMediaType:"))
  {
    return 0;
  }
  v4 = (void *)a1[5];
  uint64_t v5 = [a2 deviceType];

  return [v4 containsObject:v5];
}

+ (void)addObserver:(id)a3 forKeyPath:(id)a4 options:(unint64_t)a5 context:(void *)a6
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  [a1 setupKVOLoggingOnce];
  if (sDetailedKVOOverrideLogging)
  {
    if (dword_1EB4C92C0)
    {
      type[0] = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    CFTypeRef cf = 0;
    if (FigCopyBacktrace() >= 1 && cf != 0 && dword_1EB4C92C0 != 0)
    {
      *(_DWORD *)type = 0;
      os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
      v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  v15.receiver = a1;
  v15.super_class = (Class)&OBJC_METACLASS___AVCaptureDevice;
  objc_msgSendSuper2(&v15, sel_addObserver_forKeyPath_options_context_, a3, a4, a5, a6);
}

+ (void)setupKVOLoggingOnce
{
  if (setupKVOLoggingOnce_onceToken != -1) {
    dispatch_once(&setupKVOLoggingOnce_onceToken, &__block_literal_global_9);
  }
}

- (AVCaptureDevicePosition)position
{
  return 0;
}

- (BOOL)isLockedForConfiguration
{
  return self->_internal->configLockRefCount > 0;
}

+ (id)_devicesWithDeviceTypes:(id)a3 mediaType:(id)a4 position:(int64_t)a5
{
  uint64_t v9 = objc_opt_class();
  if (v9 != objc_opt_class()) {
    return (id)MEMORY[0x1E4F1CBF0];
  }
  id v11 = +[AVCaptureDeviceDiscoverySession allDeviceTypes];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __62__AVCaptureDevice__devicesWithDeviceTypes_mediaType_position___block_invoke;
  v15[3] = &unk_1E5A73640;
  v15[4] = v11;
  v12 = objc_msgSend(a3, "filteredArrayUsingPredicate:", objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithBlock:", v15));
  v13 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithArray:", +[AVCaptureDeviceDiscoverySession allVideoDeviceTypes](AVCaptureDeviceDiscoverySession, "allVideoDeviceTypes"));
  [v13 addObject:@"AVCaptureDeviceTypeBuiltInTimeOfFlightCamera"];
  objc_msgSend(v13, "addObjectsFromArray:", +[AVCaptureDeviceDiscoverySession allMetadataCameraDeviceTypes](AVCaptureDeviceDiscoverySession, "allMetadataCameraDeviceTypes"));
  if (objc_msgSend(v13, "intersectsSet:", objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", v12)))
  {
    [NSClassFromString(&cfstr_Avcapturefigvi.isa) _setUpCameraHistoryOnce];
    _registerVideoDevicesOnce();
  }
  if ([v12 containsObject:@"AVCaptureDeviceTypeMicrophone"]) {
    _registerAudioDevicesOnce();
  }
  v10 = (void *)[MEMORY[0x1E4F1CA48] array];
  os_unfair_lock_lock((os_unfair_lock_t)&sRegisterVideoDevicesLock);
  [v10 addObjectsFromArray:sRegisteredVideoDevices];
  os_unfair_lock_unlock((os_unfair_lock_t)&sRegisterVideoDevicesLock);
  os_unfair_lock_lock((os_unfair_lock_t)&sRegisterAudioDevicesLock);
  [v10 addObjectsFromArray:sRegisteredAudioDevices];
  os_unfair_lock_unlock((os_unfair_lock_t)&sRegisterAudioDevicesLock);
  [a1 _filterConnectedDevices:v10 withDeviceTypes:v12 mediaType:a4 position:a5];
  return v10;
}

+ (void)_filterConnectedDevices:(id)a3 withDeviceTypes:(id)a4 mediaType:(id)a5 position:(int64_t)a6
{
  int BoolAnswer = AVGestaltGetBoolAnswer(@"AVGQCaptureDevicesShouldBeSortedByDeviceType");
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __78__AVCaptureDevice__filterConnectedDevices_withDeviceTypes_mediaType_position___block_invoke;
  v13[3] = &unk_1E5A735F0;
  v13[5] = a4;
  v13[6] = a6;
  v13[4] = a5;
  objc_msgSend(a3, "filterUsingPredicate:", objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithBlock:", v13));
  if (BoolAnswer)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __78__AVCaptureDevice__filterConnectedDevices_withDeviceTypes_mediaType_position___block_invoke_2;
    v11[3] = &unk_1E5A73618;
    char v12 = 1;
    v11[4] = a4;
    [a3 sortUsingComparator:v11];
  }
}

- (AVCaptureDeviceFormat)activeFormat
{
  return 0;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p %@>", NSStringFromClass(v4), self, -[AVCaptureDevice debugDescription](self, "debugDescription")];
}

- (id)debugDescription
{
  if ([(AVCaptureDevice *)self isProxyDevice]) {
    v3 = @"(PROXY)";
  }
  else {
    v3 = &stru_1EF4D21D0;
  }
  return (id)[NSString stringWithFormat:@"%@[%@][%@]", v3, -[AVCaptureDevice localizedName](self, "localizedName"), -[AVCaptureDevice uniqueID](self, "uniqueID")];
}

+ (BOOL)isEligibleForStudioLighting
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__AVCaptureDevice_isEligibleForStudioLighting__block_invoke;
  block[3] = &unk_1E5A72ED0;
  block[4] = a1;
  if (isEligibleForStudioLighting_onceToken != -1) {
    dispatch_once(&isEligibleForStudioLighting_onceToken, block);
  }
  return isEligibleForStudioLighting_sIsEligibleForStudioLighting;
}

+ (BOOL)isEligibleForBackgroundBlur
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__AVCaptureDevice_isEligibleForBackgroundBlur__block_invoke;
  block[3] = &unk_1E5A72ED0;
  block[4] = a1;
  if (isEligibleForBackgroundBlur_onceToken != -1) {
    dispatch_once(&isEligibleForBackgroundBlur_onceToken, block);
  }
  return isEligibleForBackgroundBlur_sIsEligibleForBackgroundBlur;
}

- (NSArray)constituentDevices
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ((__CFString *)[(AVCaptureDevice *)self deviceType] == @"AVCaptureDeviceTypeBuiltInDualCamera")
  {
    objc_super v15 = @"AVCaptureDeviceTypeBuiltInWideAngleCamera";
    os_log_type_t v16 = @"AVCaptureDeviceTypeBuiltInTelephotoCamera";
    v4 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v5 = &v15;
LABEL_9:
    uint64_t v6 = 2;
    goto LABEL_10;
  }
  if ((__CFString *)[(AVCaptureDevice *)self deviceType] == @"AVCaptureDeviceTypeBuiltInDualWideCamera")
  {
    v13 = @"AVCaptureDeviceTypeBuiltInUltraWideCamera";
    v14 = @"AVCaptureDeviceTypeBuiltInWideAngleCamera";
    v4 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v5 = &v13;
    goto LABEL_9;
  }
  if ((__CFString *)[(AVCaptureDevice *)self deviceType] == @"AVCaptureDeviceTypeBuiltInTripleCamera")
  {
    v10 = @"AVCaptureDeviceTypeBuiltInUltraWideCamera";
    id v11 = @"AVCaptureDeviceTypeBuiltInWideAngleCamera";
    char v12 = @"AVCaptureDeviceTypeBuiltInTelephotoCamera";
    v4 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v5 = &v10;
    uint64_t v6 = 3;
  }
  else
  {
    if ((__CFString *)[(AVCaptureDevice *)self deviceType] == @"AVCaptureDeviceTypeBuiltInTrueDepthCamera")
    {
      uint64_t v9 = @"AVCaptureDeviceTypeBuiltInWideAngleCamera";
      v4 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v5 = &v9;
    }
    else
    {
      if ((__CFString *)[(AVCaptureDevice *)self deviceType] != @"AVCaptureDeviceTypeBuiltInLiDARDepthCamera")
      {
        v3 = (NSArray *)MEMORY[0x1E4F1CBF0];
        goto LABEL_11;
      }
      v8 = @"AVCaptureDeviceTypeBuiltInWideAngleCamera";
      v4 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v5 = &v8;
    }
    uint64_t v6 = 1;
  }
LABEL_10:
  v3 = (NSArray *)objc_msgSend(v4, "arrayWithObjects:count:", v5, v6, v8, v9, v10, v11, v12, v13, v14, v15, v16);
LABEL_11:
  if ([(NSArray *)v3 count]) {
    return [+[AVCaptureDeviceDiscoverySession discoverySessionWithDeviceTypes:v3 mediaType:*MEMORY[0x1E4F47C68] position:[(AVCaptureDevice *)self position]] devices];
  }
  return v3;
}

+ (AVCaptureDevice)systemPreferredCamera
{
  Class v2 = NSClassFromString(&cfstr_Avcapturefigvi.isa);

  return (AVCaptureDevice *)[(objc_class *)v2 systemPreferredCamera];
}

+ (id)valueForKey:(id)a3
{
  if ([a3 isEqualToString:@"backgroundReplacementPixelBuffer"])
  {
    return (id)[a1 backgroundReplacementPixelBuffer];
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___AVCaptureDevice;
    return objc_msgSendSuper2(&v6, sel_valueForKey_, a3);
  }
}

+ (BOOL)isEligibleForReactionEffects
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__AVCaptureDevice_isEligibleForReactionEffects__block_invoke;
  block[3] = &unk_1E5A72ED0;
  block[4] = a1;
  if (isEligibleForReactionEffects_onceToken != -1) {
    dispatch_once(&isEligibleForReactionEffects_onceToken, block);
  }
  return isEligibleForReactionEffects_sIsEligibleForReactionEffects;
}

+ (BOOL)reactionEffectsEnabled
{
  [a1 setUpReactionEffectsStateOnce];
  os_unfair_lock_lock(&sReactionsLock);
  char v2 = sReactionsEnabled;
  os_unfair_lock_unlock(&sReactionsLock);
  return v2;
}

+ (BOOL)isStudioLightEnabled
{
  [a1 setUpStudioLightingStateOnce];
  os_unfair_lock_lock(&sBackgroundBlurLock);
  char v2 = sStudioLightingEnabled;
  os_unfair_lock_unlock(&sBackgroundBlurLock);
  return v2;
}

+ (BOOL)isCenterStageEnabled
{
  [a1 setUpCenterStageStateOnce];
  os_unfair_lock_lock(&sCenterStageLock);
  char v2 = sCenterStageEnabled;
  os_unfair_lock_unlock(&sCenterStageLock);
  return v2;
}

+ (BOOL)isPortraitEffectEnabled
{
  [a1 setUpBackgroundBlurStateOnce];
  os_unfair_lock_lock(&sBackgroundBlurLock);
  char v2 = sBackgroundBlurEnabled;
  os_unfair_lock_unlock(&sBackgroundBlurLock);
  return v2;
}

+ (BOOL)isBackgroundReplacementEnabled
{
  [a1 setUpBackgroundReplacementStateOnce];
  os_unfair_lock_lock((os_unfair_lock_t)&sBackgroundReplacementLock);
  char v2 = sBackgroundReplacementEnabled;
  os_unfair_lock_unlock((os_unfair_lock_t)&sBackgroundReplacementLock);
  return v2;
}

uint64_t __54__AVCaptureDevice_setUpBackgroundReplacementStateOnce__block_invoke(uint64_t a1)
{
  char v2 = AVCaptureClientPreferencesDomain();
  sBackgroundReplacementEnabledKey = (uint64_t)(id)AVControlCenterVideoEffectsBackgroundReplacementEnabledPreferenceKey(v2);
  v3 = AVCaptureClientPreferencesDomain();
  sBackgroundReplacementUnavailableReasonsKey = (uint64_t)(id)AVControlCenterVideoEffectsBackgroundReplacementUnavailableReasonsPreferenceKey(v3);
  v4 = AVCaptureClientPreferencesDomain();
  sBackgroundReplacementURLBookmarkKey = (uint64_t)(id)AVControlCenterVideoEffectsBackgroundReplacementURLBookmarkPreferenceKey(v4);
  id v5 = +[AVCaptureProprietaryDefaultsSingleton objectForKey:sBackgroundReplacementEnabledKey];
  if (v5) {
    sBackgroundReplacementEnabled = [v5 BOOLValue];
  }
  id v6 = +[AVCaptureProprietaryDefaultsSingleton objectForKey:sBackgroundReplacementURLBookmarkKey];
  if (v6) {
    sBackgroundReplacementURLBookmark = (uint64_t)v6;
  }
  uint64_t v7 = *(void *)(a1 + 32);
  v12[10] = MEMORY[0x1E4F143A8];
  v12[11] = 3221225472;
  v12[12] = __54__AVCaptureDevice_setUpBackgroundReplacementStateOnce__block_invoke_2;
  v12[13] = &unk_1E5A72DB8;
  v12[14] = v7;
  +[AVCaptureProprietaryDefaultsSingleton addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:](AVCaptureProprietaryDefaultsSingleton, "addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:");
  uint64_t v8 = *(void *)(a1 + 32);
  v12[5] = MEMORY[0x1E4F143A8];
  v12[6] = 3221225472;
  v12[7] = __54__AVCaptureDevice_setUpBackgroundReplacementStateOnce__block_invoke_3;
  v12[8] = &unk_1E5A72DB8;
  v12[9] = v8;
  +[AVCaptureProprietaryDefaultsSingleton addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:](AVCaptureProprietaryDefaultsSingleton, "addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:");
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = AVControlCenterVideoEffectsBackgroundReplacementURLRemovedSignalKey();
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __54__AVCaptureDevice_setUpBackgroundReplacementStateOnce__block_invoke_4;
  v12[3] = &unk_1E5A72DB8;
  v12[4] = *(void *)(a1 + 32);
  return +[AVCaptureProprietaryDefaultsSingleton addObserver:v9 forKey:v10 callHandlerForInitialValue:0 defaultChangedHandler:v12];
}

+ (void)setControlCenterVideoEffectUnavailableReasonsForVideoEffect:(id)a3 reasons:(unint64_t)a4
{
  if ([a3 isEqualToString:@"AVControlCenterVideoEffectCenterStage"])
  {
    [a1 setUpCenterStageStateOnce];
    uint64_t v7 = &sCenterStageUnavailableReasonsKey;
  }
  else if ([a3 isEqualToString:@"AVControlCenterVideoEffectBackgroundBlur"])
  {
    [a1 setUpBackgroundBlurStateOnce];
    uint64_t v7 = &sBackgroundBlurUnavailableReasonsKey;
  }
  else if ([a3 isEqualToString:@"AVControlCenterVideoEffectStudioLighting"])
  {
    [a1 setUpStudioLightingStateOnce];
    uint64_t v7 = &sStudioLightingUnavailableReasonsKey;
  }
  else if ([a3 isEqualToString:@"AVControlCenterVideoEffectReactions"] {
         || [a3 isEqualToString:@"AVControlCenterVideoEffectGestures"])
  }
  {
    [a1 setUpReactionEffectsStateOnce];
    uint64_t v7 = &sReactionsUnavailableReasonsKey;
  }
  else
  {
    if (![a3 isEqualToString:@"AVControlCenterVideoEffectBackgroundReplacement"]) {
      return;
    }
    [a1 setUpBackgroundReplacementStateOnce];
    uint64_t v7 = &sBackgroundReplacementUnavailableReasonsKey;
  }
  uint64_t v8 = *v7;
  if (*v7
    && objc_msgSend(+[AVCaptureProprietaryDefaultsSingleton objectForKey:](AVCaptureProprietaryDefaultsSingleton, "objectForKey:", *v7), "unsignedIntegerValue") != a4)
  {
    if (a4) {
      uint64_t v9 = [NSNumber numberWithUnsignedInteger:a4];
    }
    else {
      uint64_t v9 = 0;
    }
    +[AVCaptureProprietaryDefaultsSingleton setObject:v9 forKey:v8];
  }
}

+ (void)setUpStudioLightingStateOnce
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__AVCaptureDevice_setUpStudioLightingStateOnce__block_invoke;
  block[3] = &unk_1E5A72ED0;
  block[4] = a1;
  if (setUpStudioLightingStateOnce_onceToken != -1) {
    dispatch_once(&setUpStudioLightingStateOnce_onceToken, block);
  }
}

+ (void)setUpBackgroundBlurStateOnce
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__AVCaptureDevice_setUpBackgroundBlurStateOnce__block_invoke;
  block[3] = &unk_1E5A72ED0;
  block[4] = a1;
  if (setUpBackgroundBlurStateOnce_onceToken != -1) {
    dispatch_once(&setUpBackgroundBlurStateOnce_onceToken, block);
  }
}

+ (void)setUpCenterStageStateOnce
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__AVCaptureDevice_setUpCenterStageStateOnce__block_invoke;
  block[3] = &unk_1E5A72ED0;
  block[4] = a1;
  if (setUpCenterStageStateOnce_onceToken != -1) {
    dispatch_once(&setUpCenterStageStateOnce_onceToken, block);
  }
}

- (id)initSubclass
{
  v4.receiver = self;
  v4.super_class = (Class)AVCaptureDevice;
  char v2 = [(AVCaptureDevice *)&v4 init];
  if (v2)
  {
    v2->_internal = objc_alloc_init(AVCaptureDeviceInternal);
    if ((AVCaptureIsRunningInMediaserverd() & 1) == 0) {
      +[AVCaptureDevice _registerOnceForServerConnectionDiedNotification];
    }
    +[AVCaptureDevice setUpReactionEffectsStateOnce];
  }
  return v2;
}

+ (void)setUpReactionEffectsStateOnce
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__AVCaptureDevice_setUpReactionEffectsStateOnce__block_invoke;
  block[3] = &unk_1E5A72ED0;
  block[4] = a1;
  if (setUpReactionEffectsStateOnce_onceToken != -1) {
    dispatch_once(&setUpReactionEffectsStateOnce_onceToken, block);
  }
}

+ (void)_registerOnceForServerConnectionDiedNotification
{
}

+ (void)setUpBackgroundReplacementStateOnce
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__AVCaptureDevice_setUpBackgroundReplacementStateOnce__block_invoke;
  block[3] = &unk_1E5A72ED0;
  block[4] = a1;
  if (setUpBackgroundReplacementStateOnce_onceToken != -1) {
    dispatch_once(&setUpBackgroundReplacementStateOnce_onceToken, block);
  }
}

uint64_t __48__AVCaptureDevice_setUpReactionEffectsStateOnce__block_invoke()
{
  v13[8] = *MEMORY[0x1E4F143B8];
  v13[0] = AVCaptureReactionTypeThumbsUp;
  v13[1] = AVCaptureReactionTypeThumbsDown;
  v13[2] = AVCaptureReactionTypeBalloons;
  v13[3] = AVCaptureReactionTypeHeart;
  v13[4] = AVCaptureReactionTypeFireworks;
  v13[5] = AVCaptureReactionTypeRain;
  v13[6] = AVCaptureReactionTypeConfetti;
  void v13[7] = AVCaptureReactionTypeLasers;
  sAvailableReactions = (uint64_t)(id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v13, 8));
  v0 = AVCaptureClientPreferencesDomain();
  sReactionsEnabledKey = (uint64_t)(id)AVControlCenterVideoEffectsReactionsEnabledPreferenceKey(v0);
  v1 = AVCaptureClientPreferencesDomain();
  sGesturesEnabledKey = (uint64_t)(id)AVControlCenterVideoEffectsGesturesEnabledPreferenceKey(v1);
  char v2 = AVCaptureClientPreferencesDomain();
  sReactionsUnavailableReasonsKey = (uint64_t)(id)AVControlCenterVideoEffectsReactionsUnavailableReasonsPreferenceKey(v2);
  v3 = AVCaptureClientPreferencesDomain();
  AVControlCenterVideoEffectsReactionsTriggeredPreferenceKey(v3);
  objc_super v4 = AVCaptureClientPreferencesDomain();
  AVControlCenterVideoEffectsReactionsInProgressPreferenceKey(v4);
  BOOL v5 = +[AVCaptureDevice reactionEffectsEnabledDefault];
  sReactionsEnabled = v5;
  uint64_t v6 = [NSNumber numberWithBool:v5];
  +[AVCaptureProprietaryDefaultsSingleton setObject:v6 forKey:sReactionsEnabledKey];
  id v7 = +[AVCaptureProprietaryDefaultsSingleton objectForKey:sGesturesEnabledKey];
  sGesturesEnabled = +[AVCaptureDevice reactionEffectGesturesEnabledDefault];
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (dword_1EB4C92C0)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    sGesturesEnabled = objc_msgSend(v7, "BOOLValue", v11, v12);
  }
  else
  {
    uint64_t v9 = AVCaptureClientPreferencesDomain();
    +[AVCaptureProprietaryDefaultsSingleton setObject:forKey:](AVCaptureProprietaryDefaultsSingleton, "setObject:forKey:", [NSNumber numberWithBool:sGesturesEnabled], AVControlCenterVideoEffectsGesturesEnabledDefaultPreferenceKey(v9));
  }
  +[AVCaptureProprietaryDefaultsSingleton addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:](AVCaptureProprietaryDefaultsSingleton, "addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:");
  +[AVCaptureProprietaryDefaultsSingleton addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:](AVCaptureProprietaryDefaultsSingleton, "addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:");
  +[AVCaptureProprietaryDefaultsSingleton addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:](AVCaptureProprietaryDefaultsSingleton, "addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:");
  return +[AVCaptureProprietaryDefaultsSingleton addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:](AVCaptureProprietaryDefaultsSingleton, "addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:");
}

+ (BOOL)reactionEffectGesturesEnabledDefault
{
  if (reactionEffectGesturesEnabledDefault_onceToken != -1) {
    dispatch_once(&reactionEffectGesturesEnabledDefault_onceToken, &__block_literal_global_437);
  }
  return reactionEffectGesturesEnabledDefault_gesturesEnabledDefault;
}

+ (BOOL)reactionEffectsEnabledDefault
{
  return +[AVCaptureDevice isEligibleForReactionEffects];
}

- (BOOL)isVirtualDevice
{
  id v3 = +[AVCaptureDeviceDiscoverySession allVirtualDeviceTypes];
  objc_super v4 = [(AVCaptureDevice *)self deviceType];

  return [v3 containsObject:v4];
}

- (BOOL)isSoonToBeDisconnected
{
  return 0;
}

- (BOOL)wideAngleCameraSourcesFromUltraWide
{
  return 0;
}

+ (id)devicesForDefaultDeviceSupport:(BOOL)a3 includeAudioDevices:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v7 = objc_opt_class();
  if (v7 != objc_opt_class()) {
    return (id)MEMORY[0x1E4F1CBF0];
  }
  [NSClassFromString(&cfstr_Avcapturefigvi.isa) _setUpCameraHistoryOnce];
  _registerVideoDevicesOnce();
  os_unfair_lock_lock((os_unfair_lock_t)&sRegisterVideoDevicesLock);
  id v8 = (id)[(id)sRegisteredVideoDevices mutableCopy];
  os_unfair_lock_unlock((os_unfair_lock_t)&sRegisterVideoDevicesLock);
  if (v4)
  {
    _registerAudioDevicesOnce();
    os_unfair_lock_lock((os_unfair_lock_t)&sRegisterAudioDevicesLock);
    [v8 addObjectsFromArray:sRegisteredAudioDevices];
    os_unfair_lock_unlock((os_unfair_lock_t)&sRegisterAudioDevicesLock);
  }
  if (v5) {
    [a1 _filterConnectedLegacyDevices:v8];
  }
  return v8;
}

+ (void)willChangeValueForKey:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [a1 setupKVOLoggingOnce];
  if (sDetailedKVOOverrideLogging)
  {
    if (dword_1EB4C92C0)
    {
      type[0] = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    CFTypeRef cf = 0;
    if (FigCopyBacktrace() >= 1 && cf != 0 && dword_1EB4C92C0 != 0)
    {
      *(_DWORD *)type = 0;
      os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
      id v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___AVCaptureDevice;
  objc_msgSendSuper2(&v9, sel_willChangeValueForKey_, a3);
}

+ (void)didChangeValueForKey:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [a1 setupKVOLoggingOnce];
  if (sDetailedKVOOverrideLogging)
  {
    if (dword_1EB4C92C0)
    {
      type[0] = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    CFTypeRef cf = 0;
    if (FigCopyBacktrace() >= 1 && cf != 0 && dword_1EB4C92C0 != 0)
    {
      *(_DWORD *)type = 0;
      os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
      id v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___AVCaptureDevice;
  objc_msgSendSuper2(&v9, sel_didChangeValueForKey_, a3);
}

- (void)unlockForConfiguration
{
  internal = self->_internal;
  objc_sync_enter(internal);
  pid_t v4 = getpid();
  BOOL v5 = self->_internal;
  if (v5->configLockPid == v4)
  {
    --v5->configLockRefCount;
    uint64_t v6 = self->_internal;
    if (!v6->configLockRefCount) {
      v6->configLockPid = 0;
    }
  }

  objc_sync_exit(internal);
}

- (BOOL)lockForConfiguration:(NSError *)outError
{
  v14[2] = *MEMORY[0x1E4F143B8];
  internal = self->_internal;
  objc_sync_enter(internal);
  pid_t v6 = getpid();
  uint64_t v7 = self->_internal;
  int configLockPid = v7->configLockPid;
  if (configLockPid) {
    BOOL v9 = configLockPid == v6;
  }
  else {
    BOOL v9 = 1;
  }
  BOOL v10 = v9;
  if (v9)
  {
    v7->int configLockPid = v6;
    ++self->_internal->configLockRefCount;
  }
  else if (outError)
  {
    v13[0] = *MEMORY[0x1E4F47B80];
    uint64_t v11 = objc_msgSend(NSNumber, "numberWithInt:");
    v13[1] = *MEMORY[0x1E4F47B70];
    v14[0] = v11;
    v14[1] = self;
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
    *outError = (NSError *)AVLocalizedError();
  }
  objc_sync_exit(internal);
  return v10;
}

- (BOOL)isLowLightBoostSupported
{
  return 0;
}

+ (AVCaptureDevice)deviceWithUniqueID:(NSString *)deviceUniqueID
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  pid_t v4 = objc_msgSend(a1, "_devicesWithDeviceTypes:mediaType:position:", +[AVCaptureDeviceDiscoverySession allDeviceTypes](AVCaptureDeviceDiscoverySession, "allDeviceTypes"), 0, 0);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t result = (AVCaptureDevice *)[v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (result)
  {
    pid_t v6 = result;
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      id v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        BOOL v9 = *(void **)(*((void *)&v10 + 1) + 8 * (void)v8);
        if (objc_msgSend((id)objc_msgSend(v9, "uniqueID"), "isEqualToString:", deviceUniqueID)) {
          return (AVCaptureDevice *)v9;
        }
        id v8 = (AVCaptureDevice *)((char *)v8 + 1);
      }
      while (v6 != v8);
      uint64_t result = (AVCaptureDevice *)[v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      pid_t v6 = result;
      if (result) {
        continue;
      }
      break;
    }
  }
  return result;
}

uint64_t __47__AVCaptureDevice_isEligibleForReactionEffects__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _checkEligiblityForEffect:AVCaptureBundleCameraReactionEffectsEnabledKey];
  isEligibleForReactionEffects_sIsEligibleForReactionEffects = result;
  return result;
}

+ (BOOL)_checkEligiblityForEffect:(id)a3
{
  pid_t v4 = (void *)[a1 _listEligibleEffects];

  return [v4 containsObject:a3];
}

+ (id)_listEligibleEffects
{
  if (_listEligibleEffects_onceToken != -1) {
    dispatch_once(&_listEligibleEffects_onceToken, &__block_literal_global_460);
  }
  return (id)_listEligibleEffects_sEligibleEffectSet;
}

uint64_t __59__AVCaptureDevice_setUpGesturesDefaultDisabledNotification__block_invoke(uint64_t a1)
{
  char v2 = AVCaptureClientPreferencesDomain();
  sHaveShownGesturesDefaultDisabledNotificationKey = (uint64_t)(id)AVControlCenterVideoEffectsHaveShownGesturesDefaultDisabledNotificationPreferenceKey(v2);
  sRequestGesturesDefaultDisabledNotificationKey = (uint64_t)(id)AVControlCenterVideoEffectsRequestGesturesDefaultDisabledNotificationPreferenceKey();
  id v3 = +[AVCaptureProprietaryDefaultsSingleton objectForKey:sHaveShownGesturesDefaultDisabledNotificationKey];
  if (v3)
  {
    pid_t v4 = v3;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      sHaveShownGesturesDefaultDisabledNotification = [v4 BOOLValue];
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  BOOL v9 = __59__AVCaptureDevice_setUpGesturesDefaultDisabledNotification__block_invoke_2;
  long long v10 = &unk_1E5A72DB8;
  uint64_t v11 = v5;
  return +[AVCaptureProprietaryDefaultsSingleton addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:](AVCaptureProprietaryDefaultsSingleton, "addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:");
}

uint64_t __55__AVCaptureDevice_reactionEffectGesturesEnabledDefault__block_invoke()
{
  v0 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F223F8], "bundleRecordForCurrentProcess"), "infoDictionary");
  v1 = (void *)[v0 objectForKey:AVCaptureBundleCameraReactionEffectGesturesEnabledDefaultKey ofClass:objc_opt_class()];
  if (v1)
  {
    uint64_t result = [v1 BOOLValue];
    reactionEffectGesturesEnabledDefault_gesturesEnabledDefault = result;
    if (!dword_1EB4C92C0) {
      return result;
    }
  }
  else
  {
    uint64_t result = FigGetCFPreferenceBooleanWithDefault();
    reactionEffectGesturesEnabledDefault_gesturesEnabledDefault = result != 0;
    if (!dword_1EB4C92C0) {
      return result;
    }
  }
  os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
  return fig_log_call_emit_and_clean_up_after_send_and_compose();
}

uint64_t __39__AVCaptureDevice__listEligibleEffects__block_invoke()
{
  v47[4] = *MEMORY[0x1E4F143B8];
  v0 = AVCaptureClientPreferencesDomain();
  unint64_t v1 = 0x1E4F1C000uLL;
  v47[0] = AVCaptureBundleCameraPortraitEffectEnabledKey;
  v47[1] = AVCaptureBundleCameraStudioLightEnabledKey;
  v47[2] = AVCaptureBundleCameraReactionEffectsEnabledKey;
  v47[3] = AVCaptureBundleCameraBackgroundReplacementEnabledKey;
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v47, 4));
  p_cache = &OBJC_METACLASS___AVCaptureDeviceInternal.cache;
  if (!_listEligibleEffects_sEligibleEffectSet)
  {
    pid_t v4 = (void *)v2;
    if (([(__CFString *)v0 isEqual:0x1EF4D64B0] & 1) != 0
      || ([(__CFString *)v0 isEqual:0x1EF4D64F0] & 1) != 0
      || ([(__CFString *)v0 isEqual:0x1EF4D6530] & 1) != 0
      || (AVCaptureClientIsContinuityCapture() & 1) != 0
      || (AVCaptureIsRunningInXCTest() & 1) != 0
      || (AVCaptureClientIsInternalCommandLineTool() & 1) != 0
      || AVCaptureClientIsInternalTestTool())
    {
      if (dword_1EB4C92C0)
      {
        unsigned int v35 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      _listEligibleEffects_sEligibleEffectSet = v4;
    }
    else
    {
      uint64_t v11 = (void *)MEMORY[0x1A62348E0]();
      long long v12 = (void *)[MEMORY[0x1E4F223F8] bundleRecordForCurrentProcess];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && objc_msgSend((id)objc_msgSend(v12, "UIBackgroundModes"), "containsObject:", @"voip"))
      {
        if (dword_1EB4C92C0)
        {
          unsigned int v35 = 0;
          os_log_type_t type = OS_LOG_TYPE_DEFAULT;
          long long v13 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
      }
      else
      {
        v14 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v4, "count"));
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        uint64_t v15 = [v4 countByEnumeratingWithState:&v30 objects:v46 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          v27 = v11;
          v28 = v0;
          uint64_t v29 = *(void *)v31;
          do
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v31 != v29) {
                objc_enumerationMutation(v4);
              }
              uint64_t v18 = *(void *)(*((void *)&v30 + 1) + 8 * i);
              int v19 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v12, "infoDictionary", v25, v26), "objectForKey:ofClass:", v18, objc_opt_class()), "BOOLValue");
              if (v19) {
                [v14 addObject:v18];
              }
              if (dword_1EB4C92C0)
              {
                unsigned int v35 = 0;
                os_log_type_t type = OS_LOG_TYPE_DEFAULT;
                v20 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                unsigned int v21 = v35;
                if (os_log_type_enabled(v20, type)) {
                  unsigned int v22 = v21;
                }
                else {
                  unsigned int v22 = v21 & 0xFFFFFFFE;
                }
                if (v22)
                {
                  uint64_t v23 = [v12 bundleIdentifier];
                  int v36 = 136316162;
                  v24 = "is NOT";
                  if (v19) {
                    v24 = "is";
                  }
                  v37 = "+[AVCaptureDevice _listEligibleEffects]_block_invoke";
                  __int16 v38 = 2112;
                  v39 = v28;
                  __int16 v40 = 2112;
                  uint64_t v41 = v23;
                  __int16 v42 = 2080;
                  v43 = v24;
                  __int16 v44 = 2112;
                  uint64_t v45 = v18;
                  LODWORD(v26) = 52;
                  v25 = &v36;
                  _os_log_send_and_compose_impl();
                }
                fig_log_call_emit_and_clean_up_after_send_and_compose();
              }
            }
            uint64_t v16 = [v4 countByEnumeratingWithState:&v30 objects:v46 count:16];
          }
          while (v16);
          pid_t v4 = v14;
          unint64_t v1 = 0x1E4F1C000;
          v0 = v28;
          p_cache = (void **)(&OBJC_METACLASS___AVCaptureDeviceInternal + 16);
          uint64_t v11 = v27;
        }
        else
        {
          pid_t v4 = v14;
        }
      }
      p_cache[128] = v4;
    }
  }
  uint64_t v6 = AVControlCenterVideoEffectsEligibleEffectListPreferenceKey(v0);
  uint64_t v7 = *(void **)(v1 + 2768);
  id v8 = +[AVCaptureProprietaryDefaultsSingleton objectForKey:v6];
  if (v8) {
    id v9 = v8;
  }
  else {
    id v9 = (id)MEMORY[0x1E4F1CBF0];
  }
  uint64_t result = objc_msgSend((id)objc_msgSend(v7, "setWithArray:", v9, v25, v26), "isEqualToSet:", p_cache[128]);
  if ((result & 1) == 0) {
    return +[AVCaptureProprietaryDefaultsSingleton setObject:forKey:](AVCaptureProprietaryDefaultsSingleton, "setObject:forKey:", [p_cache[128] allObjects], v6);
  }
  return result;
}

uint64_t __47__AVCaptureDevice_setUpStudioLightingStateOnce__block_invoke(uint64_t a1)
{
  uint64_t v2 = AVCaptureClientPreferencesDomain();
  sStudioLightingControlModeKey = (uint64_t)(id)AVControlCenterVideoEffectsStudioLightingControlModePreferenceKey(v2);
  id v3 = AVCaptureClientPreferencesDomain();
  sStudioLightingEnabledKey = (uint64_t)(id)AVControlCenterVideoEffectsStudioLightingEnabledPreferenceKey(v3);
  pid_t v4 = AVCaptureClientPreferencesDomain();
  sStudioLightingUnavailableReasonsKey = (uint64_t)(id)AVControlCenterVideoEffectsStudioLightingUnavailableReasonsPreferenceKey(v4);
  uint64_t v5 = AVCaptureClientPreferencesDomain();
  sStudioLightingIntensityKey = (uint64_t)(id)AVControlCenterVideoEffectsStudioLightingIntensityPreferenceKey(v5);
  if ((AVCaptureIsRunningInXCTest() & 1) != 0 || AVCaptureClientIsInternalTestTool())
  {
    id v6 = +[AVCaptureProprietaryDefaultsSingleton objectForKey:sStudioLightingControlModeKey];
    if (v6) {
      sStudioLightingControlMode = [v6 integerValue];
    }
  }
  id v7 = +[AVCaptureProprietaryDefaultsSingleton objectForKey:sStudioLightingEnabledKey];
  if (v7) {
    sStudioLightingEnabled = [v7 BOOLValue];
  }
  id v8 = +[AVCaptureProprietaryDefaultsSingleton objectForKey:sStudioLightingIntensityKey];
  if (v8)
  {
    [v8 floatValue];
    sStudioLightingIntensity = v9;
  }
  +[AVCaptureProprietaryDefaultsSingleton addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:](AVCaptureProprietaryDefaultsSingleton, "addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:");
  return +[AVCaptureProprietaryDefaultsSingleton addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:](AVCaptureProprietaryDefaultsSingleton, "addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:", MEMORY[0x1E4F143A8], 3221225472, __47__AVCaptureDevice_setUpStudioLightingStateOnce__block_invoke_3, &unk_1E5A72DB8, *(void *)(a1 + 32));
}

uint64_t __44__AVCaptureDevice_setUpCenterStageStateOnce__block_invoke(uint64_t a1)
{
  void v14[3] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = AVCaptureClientPreferencesDomain();
  sCenterStageControlModeKey = (uint64_t)(id)AVControlCenterVideoEffectsCenterStageControlModePreferenceKey(v2);
  id v3 = AVCaptureClientPreferencesDomain();
  sCenterStageEnabledKey = (uint64_t)(id)AVControlCenterVideoEffectsCenterStageEnabledPreferenceKey(v3);
  pid_t v4 = AVCaptureClientPreferencesDomain();
  sCenterStageUnavailableReasonsKey = (uint64_t)(id)AVControlCenterVideoEffectsCenterStageUnavailableReasonsPreferenceKey(v4);
  uint64_t v5 = AVCaptureClientPreferencesDomain();
  uint64_t v6 = AVControlCenterVideoEffectsCenterStageMigrationCompletePreferenceKey(v5);
  v13[0] = @"videoeffects-cinematicframing-controlmode";
  v13[1] = @"videoeffects-cinematicframing-enabled";
  v14[0] = sCenterStageControlModeKey;
  v14[1] = sCenterStageEnabledKey;
  void v13[2] = @"videoeffects-cinematicframing-unavailablereasons";
  v14[2] = sCenterStageUnavailableReasonsKey;
  id v7 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
  id v8 = AVCaptureClientPreferencesDomain();
  AVControlCenterMigrateDefaultsForKeys(v8, v7, v6);
  id v9 = +[AVCaptureProprietaryDefaultsSingleton objectForKey:sCenterStageControlModeKey];
  if (v9) {
    sCenterStageControlMode = [v9 integerValue];
  }
  id v10 = +[AVCaptureProprietaryDefaultsSingleton objectForKey:sCenterStageEnabledKey];
  if (v10) {
    char v11 = [v10 BOOLValue];
  }
  else {
    char v11 = [*(id *)(a1 + 32) _defaultCenterStageEnabled];
  }
  sCenterStageEnabled = v11;
  return +[AVCaptureProprietaryDefaultsSingleton addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:](AVCaptureProprietaryDefaultsSingleton, "addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:", MEMORY[0x1E4F143A8], 3221225472, __44__AVCaptureDevice_setUpCenterStageStateOnce__block_invoke_2, &unk_1E5A72DB8, *(void *)(a1 + 32));
}

uint64_t __47__AVCaptureDevice_setUpBackgroundBlurStateOnce__block_invoke()
{
  void v14[3] = *MEMORY[0x1E4F143B8];
  v0 = AVCaptureClientPreferencesDomain();
  sBackgroundBlurControlModeKey = (uint64_t)(id)AVControlCenterVideoEffectsPortraitEffectControlModePreferenceKey(v0);
  unint64_t v1 = AVCaptureClientPreferencesDomain();
  sBackgroundBlurEnabledKey = (uint64_t)(id)AVControlCenterVideoEffectsPortraitEffectEnabledPreferenceKey(v1);
  uint64_t v2 = AVCaptureClientPreferencesDomain();
  sBackgroundBlurUnavailableReasonsKey = (uint64_t)(id)AVControlCenterVideoEffectsPortraitEffectUnavailableReasonsPreferenceKey(v2);
  id v3 = AVCaptureClientPreferencesDomain();
  sBackgroundBlurApertureKey = (uint64_t)(id)AVControlCenterVideoEffectsPortraitEffectAperturePreferenceKey(v3);
  pid_t v4 = AVCaptureClientPreferencesDomain();
  uint64_t v5 = AVControlCenterVideoEffectsPortraitEffectMigrationCompletePreferenceKey(v4);
  v13[0] = @"videoeffects-backgroundblur-controlmode";
  v13[1] = @"videoeffects-backgroundblur-enabled";
  v14[0] = sBackgroundBlurControlModeKey;
  v14[1] = sBackgroundBlurEnabledKey;
  void v13[2] = @"videoeffects-backgroundblur-unavailablereasons";
  v14[2] = sBackgroundBlurUnavailableReasonsKey;
  uint64_t v6 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
  id v7 = AVCaptureClientPreferencesDomain();
  AVControlCenterMigrateDefaultsForKeys(v7, v6, v5);
  if ((AVCaptureCurrentClientIsFaceTimeVariant() & 1) != 0
    || (AVCaptureIsRunningInXCTest() & 1) != 0
    || (AVCaptureClientIsInternalTestTool() & 1) != 0
    || AVCaptureTemporaryHackToAllowPortraitBlurSeeRadar78740254())
  {
    id v8 = +[AVCaptureProprietaryDefaultsSingleton objectForKey:sBackgroundBlurControlModeKey];
    if (v8) {
      sBackgroundBlurControlMode = [v8 integerValue];
    }
  }
  id v9 = +[AVCaptureProprietaryDefaultsSingleton objectForKey:sBackgroundBlurEnabledKey];
  if (v9) {
    sBackgroundBlurEnabled = [v9 BOOLValue];
  }
  id v10 = +[AVCaptureProprietaryDefaultsSingleton objectForKey:sBackgroundBlurApertureKey];
  if (v10)
  {
    [v10 floatValue];
    sBackgroundBlurAperture = v11;
  }
  +[AVCaptureProprietaryDefaultsSingleton addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:](AVCaptureProprietaryDefaultsSingleton, "addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:");
  return +[AVCaptureProprietaryDefaultsSingleton addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:](AVCaptureProprietaryDefaultsSingleton, "addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:");
}

+ (BOOL)defaultCenterStageEnabledForBundleID:(id)a3
{
  pid_t v4 = (void *)[a1 _centerStageAllowList];

  return [v4 containsObject:a3];
}

+ (BOOL)_defaultCenterStageEnabled
{
  uint64_t v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "mainBundle"), "bundleIdentifier");
  if (AVCaptureCurrentClientIsFaceTimeVariant()) {
    uint64_t v4 = 0x1EF4D64B0;
  }
  else {
    uint64_t v4 = v3;
  }

  return [a1 defaultCenterStageEnabledForBundleID:v4];
}

+ (id)_centerStageAllowList
{
  v3[11] = *MEMORY[0x1E4F143B8];
  v3[0] = 0x1EF4D64B0;
  v3[1] = @"com.webex.meeting";
  v3[2] = @"com.skype.SkypeForiPad";
  v3[3] = @"com.microsoft.skype.teams";
  v3[4] = @"com.logmein.joinme";
  v3[5] = @"us.zoom.videomeetings";
  v3[6] = @"com.logmein.gotomeeting";
  v3[7] = @"com.herzick.houseparty";
  v3[8] = @"com.google.hangouts";
  v3[9] = @"com.google.meetings";
  v3[10] = @"com.bluejeansnet.Blue-Jeans";
  return (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:11];
}

+ (AVCaptureDevice)defaultDeviceWithDeviceType:(AVCaptureDeviceType)deviceType mediaType:(AVMediaType)mediaType position:(AVCaptureDevicePosition)position
{
  if (deviceType)
  {
    uint64_t BoolAnswer = AVGestaltGetBoolAnswer(@"AVGQCaptureDefaultDevicePrefersUnsuspendedAndAllowsAnyPosition");
    return (AVCaptureDevice *)[a1 _defaultDeviceWithDeviceType:deviceType mediaType:mediaType position:position prefersUnsuspendedAndAllowsAnyPosition:BoolAnswer];
  }
  else
  {
    int v11 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v11);
    }
    NSLog(&cfstr_SuppressingExc.isa, v11);
    return 0;
  }
}

+ (id)_defaultDeviceWithDeviceType:(id)a3 mediaType:(id)a4 position:(int64_t)a5 prefersUnsuspendedAndAllowsAnyPosition:(BOOL)a6
{
  BOOL v6 = a6;
  v20[1] = *MEMORY[0x1E4F143B8];
  uint64_t v11 = objc_opt_class();
  if (v11 != objc_opt_class()) {
    return 0;
  }
  v20[0] = a3;
  long long v13 = objc_msgSend((id)objc_msgSend(a1, "_devicesWithDeviceTypes:mediaType:position:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v20, 1), a4, a5), "firstObject");
  if (!v6) {
    goto LABEL_12;
  }
  int v14 = objc_msgSend(+[AVCaptureDeviceDiscoverySession allVideoDeviceTypes](AVCaptureDeviceDiscoverySession, "allVideoDeviceTypes"), "containsObject:", a3);
  if (!a5 || !v14) {
    goto LABEL_12;
  }
  int v15 = [v13 isSuspended];
  if (v13 && !v15) {
    goto LABEL_13;
  }
  id v19 = a3;
  uint64_t v16 = objc_msgSend((id)objc_msgSend(a1, "_devicesWithDeviceTypes:mediaType:position:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v19, 1), a4, 0), "firstObject");
  if (v16)
  {
    uint64_t v17 = v16;
    if (![v16 isSuspended] || !v13) {
      goto LABEL_15;
    }
  }
  else
  {
LABEL_12:
    if (!v13)
    {
      uint64_t v17 = 0;
LABEL_15:
      id v18 = v17;
      return v18;
    }
  }
LABEL_13:
  id v18 = v13;
  return v18;
}

+ (int64_t)portraitEffectStudioLightQuality
{
  os_unfair_lock_lock(&sBackgroundBlurLock);
  int64_t v2 = sPortraitEffectStudioLightQuality;
  os_unfair_lock_unlock(&sBackgroundBlurLock);
  return v2;
}

+ (float)studioLightingIntensity
{
  [a1 setUpStudioLightingStateOnce];
  os_unfair_lock_lock(&sBackgroundBlurLock);
  float v2 = *(float *)&sStudioLightingIntensity;
  os_unfair_lock_unlock(&sBackgroundBlurLock);
  return v2;
}

+ (float)backgroundBlurAperture
{
  [a1 setUpBackgroundBlurStateOnce];
  os_unfair_lock_lock(&sBackgroundBlurLock);
  float v2 = *(float *)&sBackgroundBlurAperture;
  os_unfair_lock_unlock(&sBackgroundBlurLock);
  return v2;
}

+ (BOOL)reactionEffectGesturesEnabled
{
  [a1 setUpReactionEffectsStateOnce];
  os_unfair_lock_lock(&sReactionsLock);
  char v2 = sGesturesEnabled;
  os_unfair_lock_unlock(&sReactionsLock);
  return v2;
}

+ (BOOL)haveShownGesturesDefaultDisabledNotification
{
  [a1 setUpGesturesDefaultDisabledNotification];
  os_unfair_lock_lock(&sGesturesDefaultDisabledNotificationLock);
  char v2 = sHaveShownGesturesDefaultDisabledNotification;
  os_unfair_lock_unlock(&sGesturesDefaultDisabledNotificationLock);
  return v2;
}

+ (void)setUpGesturesDefaultDisabledNotification
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__AVCaptureDevice_setUpGesturesDefaultDisabledNotification__block_invoke;
  block[3] = &unk_1E5A72ED0;
  block[4] = a1;
  if (setUpGesturesDefaultDisabledNotification_onceToken != -1) {
    dispatch_once(&setUpGesturesDefaultDisabledNotification_onceToken, block);
  }
}

uint64_t __38__AVCaptureDevice_setupKVOLoggingOnce__block_invoke()
{
  uint64_t result = FigGetCFPreferenceBooleanWithDefault();
  sDetailedKVOOverrideLogging = result != 0;
  return result;
}

+ (AVCaptureDevice)defaultDeviceWithMediaType:(AVMediaType)mediaType
{
  uint64_t v5 = objc_opt_class();
  if (v5 != objc_opt_class()) {
    return 0;
  }
  id v7 = (id)objc_msgSend((id)objc_msgSend(a1, "_legacyDevicesWithMediaType:", mediaType), "firstObject");

  return (AVCaptureDevice *)v7;
}

+ (id)_legacyDevicesWithMediaType:(id)a3
{
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    if ([a3 isEqual:*MEMORY[0x1E4F47C68]])
    {
      [NSClassFromString(&cfstr_Avcapturefigvi.isa) _setUpCameraHistoryOnce];
      _registerVideoDevicesOnce();
      id v7 = &sRegisteredVideoDevices;
      id v8 = (os_unfair_lock_s *)&sRegisterVideoDevicesLock;
    }
    else
    {
      if (![a3 isEqual:*MEMORY[0x1E4F47C40]])
      {
        id v6 = 0;
        goto LABEL_9;
      }
      _registerAudioDevicesOnce();
      id v7 = &sRegisteredAudioDevices;
      id v8 = (os_unfair_lock_s *)&sRegisterAudioDevicesLock;
    }
    os_unfair_lock_lock(v8);
    id v6 = (id)[(id)*v7 mutableCopy];
    os_unfair_lock_unlock(v8);
LABEL_9:
    [a1 _filterConnectedLegacyDevices:v6];
    return v6;
  }
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (void)_filterConnectedLegacyDevices:(id)a3
{
  v3[2] = *MEMORY[0x1E4F143B8];
  v3[0] = @"AVCaptureDeviceTypeBuiltInWideAngleCamera";
  v3[1] = @"AVCaptureDeviceTypeMicrophone";
  objc_msgSend(a1, "_filterConnectedDevices:withDeviceTypes:mediaType:position:", a3, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v3, 2), 0, 0);
}

+ (AVAuthorizationStatus)authorizationStatusForMediaType:(AVMediaType)mediaType
{
  if ([(NSString *)mediaType isEqualToString:*MEMORY[0x1E4F47C40]])
  {
    uint64_t v4 = 0;
    uint64_t v5 = (uint64_t *)MEMORY[0x1E4FA9AA8];
LABEL_7:
    uint64_t v7 = *v5;
    goto LABEL_8;
  }
  if ([(NSString *)mediaType isEqualToString:*MEMORY[0x1E4F47C68]]
    || [(NSString *)mediaType isEqualToString:@"pcld"])
  {
    id v6 = (void *)[MEMORY[0x1E4F74230] sharedConnection];
    if ([v6 effectiveBoolValueForSetting:*MEMORY[0x1E4F73F80]] == 2) {
      return 1;
    }
    uint64_t v4 = 0;
    uint64_t v5 = (uint64_t *)MEMORY[0x1E4FA9A38];
    goto LABEL_7;
  }
  if (![(NSString *)mediaType isEqualToString:*MEMORY[0x1E4F47C58]])
  {
    id v10 = objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector(), 0, mediaType);
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v10);
    }
    NSLog(&cfstr_SuppressingExc.isa, v10);
    return 2;
  }
  uint64_t v7 = 0;
  uint64_t v4 = AVCaptureEntitlementMetadataCameras;
LABEL_8:
  if (!(v7 | v4)) {
    return 2;
  }
  if (!v7)
  {
    if (!v4 || (AVCaptureClientHasEntitlement((void *)v4) & 1) == 0) {
      goto LABEL_21;
    }
    return 3;
  }
  FigCaptureGetTCCServer();
  int v8 = FigCaptureTCCAccessPreflight();
  if (!v8) {
    return 3;
  }
  if (v8 != 1)
  {
    if (v8 == 2) {
      return (unint64_t)(TCCAccessRestricted() != 0);
    }
    goto LABEL_21;
  }
  if (TCCAccessRestricted()) {
    return 1;
  }
LABEL_21:
  if (AVCaptureIsRunningInXCTest()) {
    return 3;
  }
  else {
    return 2;
  }
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

+ (void)removeObserver:(id)a3 forKeyPath:(id)a4 context:(void *)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  [a1 setupKVOLoggingOnce];
  if (sDetailedKVOOverrideLogging)
  {
    if (dword_1EB4C92C0)
    {
      type[0] = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    CFTypeRef cf = 0;
    if (FigCopyBacktrace() >= 1 && cf != 0 && dword_1EB4C92C0 != 0)
    {
      *(_DWORD *)os_log_type_t type = 0;
      os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
      long long v12 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  v13.receiver = a1;
  v13.super_class = (Class)&OBJC_METACLASS___AVCaptureDevice;
  objc_msgSendSuper2(&v13, sel_removeObserver_forKeyPath_context_, a3, a4, a5);
}

+ (void)removeObserver:(id)a3 forKeyPath:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [a1 setupKVOLoggingOnce];
  if (sDetailedKVOOverrideLogging)
  {
    if (dword_1EB4C92C0)
    {
      type[0] = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    CFTypeRef cf = 0;
    if (FigCopyBacktrace() >= 1 && cf != 0 && dword_1EB4C92C0 != 0)
    {
      *(_DWORD *)os_log_type_t type = 0;
      os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
      id v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___AVCaptureDevice;
  objc_msgSendSuper2(&v11, sel_removeObserver_forKeyPath_, a3, a4);
}

+ (void)setValue:(id)a3 forKey:(id)a4
{
  if ([a4 isEqualToString:@"backgroundReplacementPixelBuffer"])
  {
    [a1 setBackgroundReplacementPixelBuffer:a3];
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___AVCaptureDevice;
    objc_msgSendSuper2(&v7, sel_setValue_forKey_, a3, a4);
  }
}

+ (NSArray)devices
{
  return (NSArray *)+[AVCaptureDevice devicesForDefaultDeviceSupport:1 includeAudioDevices:1];
}

+ (AVCaptureDevice)userPreferredCamera
{
  Class v2 = NSClassFromString(&cfstr_Avcapturefigvi.isa);

  return (AVCaptureDevice *)[(objc_class *)v2 userPreferredCamera];
}

+ (void)setUserPreferredCamera:(AVCaptureDevice *)userPreferredCamera
{
  if (dword_1EB4C92C0)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (setUserPreferredCamera__onceToken != -1) {
    dispatch_once(&setUserPreferredCamera__onceToken, &__block_literal_global_178);
  }
  if (sLogSetUserPreferredCameraBacktrace) {
    FigCopyBacktrace();
  }
  if (userPreferredCamera) {
    [NSClassFromString(&cfstr_Avcapturefigvi.isa) setUserPreferredCamera:userPreferredCamera];
  }
}

uint64_t __42__AVCaptureDevice_setUserPreferredCamera___block_invoke()
{
  uint64_t result = FigGetCFPreferenceBooleanWithDefault();
  sLogSetUserPreferredCameraBacktrace = result != 0;
  return result;
}

+ (void)setUserPreferredCamera:(id)a3 forClientPreferenceDomain:(id)a4
{
  id v6 = AVCaptureClientPreferencesDomain();
  if (dword_1EB4C92C0)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (setUserPreferredCamera_forClientPreferenceDomain__onceToken != -1) {
    dispatch_once(&setUserPreferredCamera_forClientPreferenceDomain__onceToken, &__block_literal_global_183);
  }
  if (sLogSetUserPreferredCameraBacktraceForClientPreferenceDomain) {
    FigCopyBacktrace();
  }
  if (a3 && a4)
  {
    if (([(__CFString *)v6 isEqualToString:a4] & 1) != 0
      || (AVCaptureClientHasEntitlement((void *)AVCaptureEntitlementSetAnyUserPreferredCamera) & 1) != 0)
    {
      [NSClassFromString(&cfstr_Avcapturefigvi.isa) setUserPreferredCamera:a3 forClientPreferenceDomain:a4];
    }
    else
    {
      int v8 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
      if (AVCaptureShouldThrowForAPIViolations()) {
        objc_exception_throw(v8);
      }
      NSLog(&cfstr_SuppressingExc.isa, v8);
    }
  }
}

uint64_t __68__AVCaptureDevice_setUserPreferredCamera_forClientPreferenceDomain___block_invoke()
{
  uint64_t result = FigGetCFPreferenceBooleanWithDefault();
  sLogSetUserPreferredCameraBacktraceForClientPreferenceDomain = result != 0;
  return result;
}

+ (void)updateUserPreferredCameraOverrideHistoryWithDevice:(id)a3 setOverride:(BOOL)a4
{
  BOOL v4 = a4;
  Class v6 = NSClassFromString(&cfstr_Avcapturefigvi.isa);

  [(objc_class *)v6 updateUserPreferredCameraOverrideHistoryWithDevice:a3 setOverride:v4];
}

+ (id)cameraInfoForCreatorID:(id)a3 uniqueID:(id)a4 specialDeviceType:(unsigned int)a5 centerStageSupported:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v7 = *(void *)&a5;
  Class v10 = NSClassFromString(&cfstr_Avcapturefigvi.isa);

  return (id)[(objc_class *)v10 cameraInfoForCreatorID:a3 uniqueID:a4 specialDeviceType:v7 centerStageSupported:v6];
}

+ (void)updateUserPreferredCameraOverride:(BOOL)a3 cameraInfo:(id)a4
{
  BOOL v5 = a3;
  Class v6 = NSClassFromString(&cfstr_Avcapturefigvi.isa);

  [(objc_class *)v6 updateUserPreferredCameraOverride:v5 cameraInfo:a4];
}

+ (BOOL)allowsSuspendedPreferredCameras
{
  Class v2 = NSClassFromString(&cfstr_Avcapturefigvi.isa);
  if (!v2)
  {
    BOOL v4 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v5 = *MEMORY[0x1E4F1C3B8];
    [NSString stringWithFormat:@"This is not supported on the base AVCaptureDevice class."];
    Class v6 = (void *)[v4 exceptionWithName:v5 reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    objc_exception_throw(v6);
  }

  return [(objc_class *)v2 allowsSuspendedPreferredCameras];
}

+ (void)setAllowsSuspendedPreferredCameras:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1EB4C92C0)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  Class v5 = NSClassFromString(&cfstr_Avcapturefigvi.isa);
  if (!v5)
  {
    Class v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3B8];
    [NSString stringWithFormat:@"This is not supported on the base AVCaptureDevice class."];
    int v8 = (void *)[v6 exceptionWithName:v7 reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    objc_exception_throw(v8);
  }
  [(objc_class *)v5 setAllowsSuspendedPreferredCameras:v3];
}

+ (id)_devices
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)_devicesWithPriorRegisteredDevices:(id)a3
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (void)_reconnectDevices:(id)a3
{
  BOOL v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  [NSString stringWithFormat:@"This is not supported on the base AVCaptureDevice class."];
  Class v5 = (void *)[v3 exceptionWithName:v4 reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  objc_exception_throw(v5);
}

+ (void)requestAccessForMediaType:(AVMediaType)mediaType completionHandler:(void *)handler
{
  if ([(NSString *)mediaType isEqualToString:*MEMORY[0x1E4F47C40]])
  {
    Class v6 = (void *)[MEMORY[0x1E4F153E0] sharedInstance];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __63__AVCaptureDevice_requestAccessForMediaType_completionHandler___block_invoke;
    v10[3] = &unk_1E5A73668;
    v10[4] = handler;
    [v6 requestRecordPermission:v10];
  }
  else if ([(NSString *)mediaType isEqualToString:*MEMORY[0x1E4F47C68]] {
         || [(NSString *)mediaType isEqualToString:@"pcld"])
  }
  {
    uint64_t v7 = (void *)[MEMORY[0x1E4F74230] sharedConnection];
    if ([v7 effectiveBoolValueForSetting:*MEMORY[0x1E4F73F80]] == 2)
    {
      if (handler)
      {
        int v8 = (void (*)(void *, void))*((void *)handler + 2);
        v8(handler, 0);
      }
    }
    else
    {
      FigCaptureGetTCCServer();
      FigCaptureTCCAccessRequest();
    }
  }
  else
  {
    id v9 = objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector(), 0, mediaType);
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v9);
    }
    NSLog(&cfstr_SuppressingExc.isa, v9);
  }
}

uint64_t __63__AVCaptureDevice_requestAccessForMediaType_completionHandler___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    AVCaptureIsRunningInXCTest();
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    uint64_t v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

uint64_t __63__AVCaptureDevice_requestAccessForMediaType_completionHandler___block_invoke_2(uint64_t a1, int a2)
{
  if (a2 || AVCaptureIsRunningInXCTest())
  {
    os_unfair_lock_lock((os_unfair_lock_t)&sRegisterVideoDevicesLock);
    BOOL v3 = (void *)[(id)sRegisteredVideoDevices firstObject];
    os_unfair_lock_unlock((os_unfair_lock_t)&sRegisterVideoDevicesLock);
    [v3 _checkTCCAccess];
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    Class v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

- (id)initProxyDeviceWithUniqueID:(id)a3 targetClientAuditToken:(id *)a4
{
  if (AVCaptureClientHasEntitlement((void *)AVCaptureEntitlementProxyDevices))
  {
    if (FigCaptureSourceGetMediaTypeForUniqueID() == 1986618469)
    {
      id v6 = objc_alloc(NSClassFromString(&cfstr_Avcapturefigvi.isa));
      long long v7 = *(_OWORD *)&a4->var0[4];
      v10[0] = *(_OWORD *)a4->var0;
      v10[1] = v7;
      return (id)[v6 initProxyDeviceWithUniqueID:a3 targetClientAuditToken:v10];
    }
  }
  else
  {
    id v9 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v9);
    }
    NSLog(&cfstr_SuppressingExc.isa, v9);
  }
  return 0;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVCaptureDevice;
  [(AVCaptureDevice *)&v3 dealloc];
}

- (NSString)uniqueID
{
  return (NSString *)&stru_1EF4D21D0;
}

- (NSString)modelID
{
  return (NSString *)&stru_1EF4D21D0;
}

- (NSString)localizedName
{
  return (NSString *)MEMORY[0x1F4105C10](@"Unknown Device", @"AVCaptureDeviceNames");
}

- (AVCaptureDeviceType)deviceType
{
  return (AVCaptureDeviceType)&stru_1EF4D21D0;
}

- (BOOL)isProxyDevice
{
  return 0;
}

- (BOOL)hasMediaType:(AVMediaType)mediaType
{
  return 0;
}

- (BOOL)supportsAVCaptureSessionPreset:(AVCaptureSessionPreset)preset
{
  return 0;
}

+ (void)_releaseStaticResources
{
  if (dword_1EB4C92C0)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  os_unfair_lock_lock((os_unfair_lock_t)&sRegisterVideoDevicesLock);
  if (sRegisteredVideoDevices)
  {

    sRegisteredVideoDevices = 0;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&sRegisterVideoDevicesLock);
}

- (BOOL)setValue:(id)a3 forCMIOExtensionProperty:(id)a4 error:(id *)a5
{
  return 0;
}

- (id)copyValueForCMIOExtensionProperty:(id)a3 error:(id *)a4
{
  return 0;
}

- (BOOL)addCMIOExtensionPropertyValueChangeHandler:(id)a3
{
  return 0;
}

- (BOOL)isSubjectAreaChangeMonitoringEnabled
{
  return 0;
}

- (BOOL)isFaceDetectionSupported
{
  return 0;
}

- (BOOL)isFaceDetectionDuringVideoPreviewSupported
{
  return 0;
}

- (BOOL)isFaceDetectionDrivenImageProcessingEnabled
{
  return 0;
}

- (void)setFaceDetectionDrivenImageProcessingEnabled:(BOOL)a3
{
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v3);
  }
  NSLog(&cfstr_SuppressingExc.isa, v3);
}

- (CGRect)faceRectangle
{
  double v2 = *MEMORY[0x1E4F1DB28];
  double v3 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (int)faceRectangleAngle
{
  return 0;
}

- (BOOL)providesStortorgetMetadata
{
  return 0;
}

- (void)setProvidesStortorgetMetadata:(BOOL)a3
{
  double v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v3);
  }
  NSLog(&cfstr_SuppressingExc.isa, v3);
}

- (BOOL)supportsMultiCamCaptureWithDevice:(id)a3
{
  return 0;
}

- (id)constituentDeviceWithDeviceType:(id)a3
{
  return 0;
}

- (int)powerConsumptionAt30FPSForOISMode:(int)a3
{
  return 0;
}

- (BOOL)isLowLightVideoCaptureEnabled
{
  return 0;
}

- (void)setLowLightVideoCaptureEnabled:(BOOL)a3
{
  double v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v3);
  }
  NSLog(&cfstr_SuppressingExc.isa, v3);
}

- (BOOL)isVariableFrameRateVideoCaptureEnabled
{
  return 0;
}

- (void)setVariableFrameRateVideoCaptureEnabled:(BOOL)a3
{
  double v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v3);
  }
  NSLog(&cfstr_SuppressingExc.isa, v3);
}

- (BOOL)isAutoVideoFrameRateEnabled
{
  return 0;
}

- (void)setAutoVideoFrameRateEnabled:(BOOL)a3
{
  double v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v3);
  }
  NSLog(&cfstr_SuppressingExc.isa, v3);
}

- (int64_t)videoStabilizationStrength
{
  return 0;
}

- (void)setVideoStabilizationStrength:(int64_t)a3
{
  double v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v3);
  }
  NSLog(&cfstr_SuppressingExc.isa, v3);
}

- (int64_t)digitalFlashMode
{
  return 0;
}

- (void)setDigitalFlashMode:(int64_t)a3
{
  double v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v3);
  }
  NSLog(&cfstr_SuppressingExc.isa, v3);
}

- (int64_t)_digitalFlashStatus
{
  return 0;
}

- (id)_digitalFlashExposureTimes
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (id)digitalFlashSceneForPhotoOutput
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (void)_setPhotoSettingsForSceneMonitoring:(id)a3
{
  double v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  objc_exception_throw(v3);
}

- (float)timeLapseCaptureRate
{
  return 0.0;
}

- (void)setTimeLapseCaptureRate:(float)a3
{
  double v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v3);
  }
  NSLog(&cfstr_SuppressingExc.isa, v3);
}

- (BOOL)ultraHighResolutionZeroShutterLagEnabled
{
  return 0;
}

- (void)setUltraHighResolutionZeroShutterLagEnabled:(BOOL)a3
{
  double v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v3);
  }
  NSLog(&cfstr_SuppressingExc.isa, v3);
}

- (void)setCachesFigCaptureSourceConfigurationChanges:(BOOL)a3
{
  double v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  objc_exception_throw(v3);
}

- (BOOL)cachesFigCaptureSourceConfigurationChanges
{
  return 0;
}

- (void)_setVideoHDREnabled:(BOOL)a3 forceResetVideoHDRSuspended:(BOOL)a4
{
  double v4 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  objc_exception_throw(v4);
}

- (void)_setStillImageStabilizationAutomaticallyEnabled:(BOOL)a3
{
  double v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  objc_exception_throw(v3);
}

- (BOOL)isLensStabilizationSupported
{
  return 0;
}

- (id)clientAudioClockDeviceUID
{
  return 0;
}

- (void)setClientAudioClockDeviceUID:(id)a3
{
  double v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  objc_exception_throw(v3);
}

- (BOOL)isAudioCaptureModeSupported:(int64_t)a3
{
  return 0;
}

- (BOOL)isWindNoiseRemovalSupported
{
  return 0;
}

- (BOOL)shouldAudioCaptureModeTriggerGraphRebuildOnAudioRouteChange:(int64_t)a3
{
  return 0;
}

- (int64_t)fallbackAudioCaptureModeIfApplicableForCurrentRoute:(int64_t)a3
{
  return a3;
}

- (BOOL)isMachineReadableCodeDetectionSupported
{
  return 0;
}

- (BOOL)isConnected
{
  return 0;
}

- (BOOL)isSuspended
{
  return 0;
}

- (NSArray)formats
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (void)setActiveFormat:(AVCaptureDeviceFormat *)activeFormat
{
  double v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v3);
  }
  NSLog(&cfstr_SuppressingExc.isa, v3);
}

- (AVCaptureDeviceInputSource)activeInputSource
{
  return 0;
}

- (void)setActiveInputSource:(AVCaptureDeviceInputSource *)activeInputSource
{
}

- (AVCaptureDeviceFormat)activeDepthDataFormat
{
  return 0;
}

- (void)setActiveDepthDataFormat:(AVCaptureDeviceFormat *)activeDepthDataFormat
{
  double v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v3);
  }
  NSLog(&cfstr_SuppressingExc.isa, v3);
}

- (CMTime)activeDepthDataMinFrameDuration
{
  *retstr = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F8];
  return self;
}

- (void)setActiveDepthDataMinFrameDuration:(CMTime *)activeDepthDataMinFrameDuration
{
  double v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v3);
  }
  NSLog(&cfstr_SuppressingExc.isa, v3);
}

- (CMTime)activeVideoMinFrameDuration
{
  *retstr = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F8];
  return self;
}

- (void)setActiveVideoMinFrameDuration:(CMTime *)activeVideoMinFrameDuration
{
  double v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v3);
  }
  NSLog(&cfstr_SuppressingExc.isa, v3);
}

- (CMTime)activeVideoMaxFrameDuration
{
  *retstr = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F8];
  return self;
}

- (void)setActiveVideoMaxFrameDuration:(CMTime *)activeVideoMaxFrameDuration
{
  double v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v3);
  }
  NSLog(&cfstr_SuppressingExc.isa, v3);
}

- (BOOL)isActiveVideoMinFrameDurationSet
{
  return 0;
}

- (BOOL)isActiveVideoMaxFrameDurationSet
{
  return 0;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)activeMaxExposureDurationClientOverride
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(void *)&MEMORY[0x1E4F1F9F8];
  return self;
}

- (BOOL)appliesSessionPresetMaxIntegrationTimeOverrideToActiveFormat
{
  return 0;
}

- (OpaqueCMClock)deviceClock
{
  return 0;
}

- (BOOL)isOpen
{
  return self->_internal->openRefCount > 0;
}

- (BOOL)open:(id *)a3
{
  if (a3) {
    *a3 = 0;
  }
  internal = self->_internal;
  if (!internal->openRefCount)
  {
    [(AVCaptureDevice *)self willChangeValueForKey:@"open"];
    internal = self->_internal;
  }
  BOOL v6 = 1;
  if (!atomic_fetch_add_explicit(&internal->openRefCount, 1u, memory_order_relaxed))
  {
    BOOL v6 = [(AVCaptureDevice *)self _startUsingDevice:a3];
    if (!v6)
    {
      long long v7 = self->_internal;
      int openRefCount = v7->openRefCount;
      atomic_compare_exchange_strong_explicit(&v7->openRefCount, (unsigned int *)&openRefCount, 0, memory_order_relaxed, memory_order_relaxed);
    }
    [(AVCaptureDevice *)self didChangeValueForKey:@"open"];
  }
  return v6;
}

- (void)close
{
  internal = self->_internal;
  int openRefCount = internal->openRefCount;
  if (openRefCount >= 1)
  {
    if (openRefCount == 1)
    {
      [(AVCaptureDevice *)self willChangeValueForKey:@"open"];
      internal = self->_internal;
    }
    if (atomic_fetch_add_explicit(&internal->openRefCount, 0xFFFFFFFF, memory_order_relaxed) == 1)
    {
      [(AVCaptureDevice *)self _stopUsingDevice];
      [(AVCaptureDevice *)self didChangeValueForKey:@"open"];
    }
  }
}

- (BOOL)_startUsingDevice:(id *)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if (a3) {
    *a3 = 0;
  }
  if (self->_internal->usingDevice || ![(AVCaptureDevice *)self isOpen]) {
    return 1;
  }
  if ([(AVCaptureDevice *)self isConnected])
  {
    if ([(AVCaptureDevice *)self startUsingDevice:a3])
    {
      BOOL result = 1;
      self->_internal->usingDevice = 1;
      return result;
    }
    uint64_t v8 = v3;
    LODWORD(v7) = 0;
  }
  else
  {
    if (a3)
    {
      uint64_t v9 = *MEMORY[0x1E4F47B70];
      v10[0] = self;
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
      *a3 = (id)AVLocalizedError();
    }
    uint64_t v8 = v3;
    LODWORD(v7) = 0;
  }
  FigDebugAssert3();
  [(AVCaptureDevice *)self _stopUsingDevice];
  return 0;
}

- (void)_stopUsingDevice
{
  self->_internal->usingDevice = 0;
}

- (BOOL)startUsingDevice:(id *)a3
{
  return 1;
}

- (BOOL)hasFlash
{
  return 0;
}

- (BOOL)isFlashAvailable
{
  return 0;
}

- (BOOL)isFlashActive
{
  return 0;
}

- (BOOL)isFlashModeSupported:(AVCaptureFlashMode)flashMode
{
  return 0;
}

- (AVCaptureFlashMode)flashMode
{
  return 0;
}

- (void)setFlashMode:(AVCaptureFlashMode)flashMode
{
  uint64_t v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v3);
  }
  NSLog(&cfstr_SuppressingExc.isa, v3);
}

- (BOOL)_isFlashScene
{
  return 0;
}

- (BOOL)isFlashSceneDetectedForPhotoOutput
{
  return 0;
}

- (BOOL)hasTorch
{
  return 0;
}

- (float)torchLevel
{
  return 0.0;
}

- (BOOL)isTorchModeSupported:(AVCaptureTorchMode)torchMode
{
  return 0;
}

- (BOOL)isTorchAvailable
{
  return 0;
}

- (BOOL)isTorchActive
{
  return 0;
}

- (AVCaptureTorchMode)torchMode
{
  return 0;
}

- (void)setTorchMode:(AVCaptureTorchMode)torchMode
{
  uint64_t v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v3);
  }
  NSLog(&cfstr_SuppressingExc.isa, v3);
}

- (BOOL)setTorchModeOnWithLevel:(float)torchLevel error:(NSError *)outError
{
  double v4 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v4);
  }
  NSLog(&cfstr_SuppressingExc.isa, v4);
  return 0;
}

- (unint64_t)degradedCaptureQualityFactors
{
  return 0;
}

- (BOOL)isHDRSceneDetectedForPhotoOutput
{
  return 0;
}

- (BOOL)isFocusModeSupported:(AVCaptureFocusMode)focusMode
{
  return 0;
}

- (AVCaptureFocusMode)focusMode
{
  return -1;
}

- (void)setFocusMode:(AVCaptureFocusMode)focusMode
{
  uint64_t v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v3);
  }
  NSLog(&cfstr_SuppressingExc.isa, v3);
}

- (BOOL)isFocusPointOfInterestSupported
{
  return 0;
}

- (CGPoint)focusPointOfInterest
{
  double v2 = 0.5;
  double v3 = 0.5;
  result.y = v3;
  result.x = v2;
  return result;
}

- (BOOL)isAdjustingFocus
{
  return 0;
}

- (void)setFocusPointOfInterest:(CGPoint)focusPointOfInterest
{
  double v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v3);
  }
  NSLog(&cfstr_SuppressingExc.isa, v3);
}

- (BOOL)isAutoFocusRangeRestrictionSupported
{
  return 0;
}

- (AVCaptureAutoFocusRangeRestriction)autoFocusRangeRestriction
{
  return 0;
}

- (void)setAutoFocusRangeRestriction:(AVCaptureAutoFocusRangeRestriction)autoFocusRangeRestriction
{
  double v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v3);
  }
  NSLog(&cfstr_SuppressingExc.isa, v3);
}

- (BOOL)isSmoothAutoFocusSupported
{
  return 0;
}

- (BOOL)isSmoothAutoFocusEnabled
{
  return 0;
}

- (void)setSmoothAutoFocusEnabled:(BOOL)smoothAutoFocusEnabled
{
  double v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v3);
  }
  NSLog(&cfstr_SuppressingExc.isa, v3);
}

- (BOOL)automaticallyAdjustsFaceDrivenAutoFocusEnabled
{
  return 0;
}

- (void)setAutomaticallyAdjustsFaceDrivenAutoFocusEnabled:(BOOL)automaticallyAdjustsFaceDrivenAutoFocusEnabled
{
  double v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v3);
  }
  NSLog(&cfstr_SuppressingExc.isa, v3);
}

- (BOOL)isFaceDrivenAutoFocusEnabled
{
  return 0;
}

- (void)setFaceDrivenAutoFocusEnabled:(BOOL)faceDrivenAutoFocusEnabled
{
  double v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v3);
  }
  NSLog(&cfstr_SuppressingExc.isa, v3);
}

- (float)lensPosition
{
  return 0.0;
}

- (BOOL)isLockingFocusWithCustomLensPositionSupported
{
  return 0;
}

- (void)setFocusModeLockedWithLensPosition:(float)lensPosition completionHandler:(void *)handler
{
  double v4 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v4);
  }
  NSLog(&cfstr_SuppressingExc.isa, v4);
}

- (float)focalLength
{
  return 0.0;
}

- (float)lensAperture
{
  return 0.0;
}

- (BOOL)isExposureModeSupported:(AVCaptureExposureMode)exposureMode
{
  return 0;
}

- (AVCaptureExposureMode)exposureMode
{
  return -1;
}

- (void)setExposureMode:(AVCaptureExposureMode)exposureMode
{
  double v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v3);
  }
  NSLog(&cfstr_SuppressingExc.isa, v3);
}

- (BOOL)isExposurePointOfInterestSupported
{
  return 0;
}

- (CGPoint)exposurePointOfInterest
{
  double v2 = 0.5;
  double v3 = 0.5;
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setExposurePointOfInterest:(CGPoint)exposurePointOfInterest
{
  double v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v3);
  }
  NSLog(&cfstr_SuppressingExc.isa, v3);
}

- (BOOL)automaticallyAdjustsFaceDrivenAutoExposureEnabled
{
  return 0;
}

- (void)setAutomaticallyAdjustsFaceDrivenAutoExposureEnabled:(BOOL)automaticallyAdjustsFaceDrivenAutoExposureEnabled
{
  double v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v3);
  }
  NSLog(&cfstr_SuppressingExc.isa, v3);
}

- (BOOL)isFaceDrivenAutoExposureEnabled
{
  return 0;
}

- (void)setFaceDrivenAutoExposureEnabled:(BOOL)faceDrivenAutoExposureEnabled
{
  double v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v3);
  }
  NSLog(&cfstr_SuppressingExc.isa, v3);
}

- (CMTime)activeMaxExposureDuration
{
  *retstr = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F8];
  return self;
}

- (void)setActiveMaxExposureDuration:(CMTime *)activeMaxExposureDuration
{
  double v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v3);
  }
  NSLog(&cfstr_SuppressingExc.isa, v3);
}

- (CMTime)exposureDuration
{
  *retstr = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
  return self;
}

- (float)ISO
{
  return 0.0;
}

- (float)ISODigitalThreshold
{
  return 0.0;
}

- (void)setExposureModeCustomWithDuration:(CMTime *)duration ISO:(float)ISO completionHandler:(void *)handler
{
  double v5 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v5);
  }
  NSLog(&cfstr_SuppressingExc.isa, v5);
}

- (float)exposureTargetOffset
{
  return 0.0;
}

- (float)exposureTargetBias
{
  return 0.0;
}

- (float)minExposureTargetBias
{
  return 0.0;
}

- (float)maxExposureTargetBias
{
  return 0.0;
}

- (void)setExposureTargetBias:(float)bias completionHandler:(void *)handler
{
  double v4 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v4);
  }
  NSLog(&cfstr_SuppressingExc.isa, v4);
}

- (BOOL)isAdjustingExposure
{
  return 0;
}

- (BOOL)isGlobalToneMappingEnabled
{
  return 0;
}

- (void)setGlobalToneMappingEnabled:(BOOL)globalToneMappingEnabled
{
  double v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v3);
  }
  NSLog(&cfstr_SuppressingExc.isa, v3);
}

- (BOOL)isWhiteBalanceModeSupported:(AVCaptureWhiteBalanceMode)whiteBalanceMode
{
  return 0;
}

- (AVCaptureWhiteBalanceMode)whiteBalanceMode
{
  return -1;
}

- (void)setWhiteBalanceMode:(AVCaptureWhiteBalanceMode)whiteBalanceMode
{
  double v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v3);
  }
  NSLog(&cfstr_SuppressingExc.isa, v3);
}

- (BOOL)isAdjustingWhiteBalance
{
  return 0;
}

- (AVCaptureWhiteBalanceGains)deviceWhiteBalanceGains
{
  float v2 = 0.0;
  float v3 = 0.0;
  float v4 = 0.0;
  result.blueGain = v4;
  result.greenGain = v3;
  result.redGain = v2;
  return result;
}

- (AVCaptureWhiteBalanceGains)grayWorldDeviceWhiteBalanceGains
{
  float v2 = 0.0;
  float v3 = 0.0;
  float v4 = 0.0;
  result.blueGain = v4;
  result.greenGain = v3;
  result.redGain = v2;
  return result;
}

- (float)maxWhiteBalanceGain
{
  return 0.0;
}

- (BOOL)isLockingWhiteBalanceWithCustomDeviceGainsSupported
{
  return 0;
}

- (void)setWhiteBalanceModeLockedWithDeviceWhiteBalanceGains:(AVCaptureWhiteBalanceGains)whiteBalanceGains completionHandler:(void *)handler
{
  float v4 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v4);
  }
  NSLog(&cfstr_SuppressingExc.isa, v4);
}

- (AVCaptureWhiteBalanceChromaticityValues)chromaticityValuesForDeviceWhiteBalanceGains:(AVCaptureWhiteBalanceGains)whiteBalanceGains
{
  float v3 = 0.0;
  float v4 = 0.0;
  result.y = v4;
  result.x = v3;
  return result;
}

- (AVCaptureWhiteBalanceGains)deviceWhiteBalanceGainsForChromaticityValues:(AVCaptureWhiteBalanceChromaticityValues)chromaticityValues
{
  float v3 = 0.0;
  float v4 = 0.0;
  float v5 = 0.0;
  result.blueGain = v5;
  result.greenGain = v4;
  result.redGain = v3;
  return result;
}

- (AVCaptureWhiteBalanceTemperatureAndTintValues)temperatureAndTintValuesForDeviceWhiteBalanceGains:(AVCaptureWhiteBalanceGains)whiteBalanceGains
{
  float v3 = 0.0;
  float v4 = 0.0;
  result.tint = v4;
  result.temperature = v3;
  return result;
}

- (AVCaptureWhiteBalanceGains)deviceWhiteBalanceGainsForTemperatureAndTintValues:(AVCaptureWhiteBalanceTemperatureAndTintValues)tempAndTintValues
{
  float v3 = 0.0;
  float v4 = 0.0;
  float v5 = 0.0;
  result.blueGain = v5;
  result.greenGain = v4;
  result.redGain = v3;
  return result;
}

- (BOOL)isImageControlModeSupported:(int64_t)a3
{
  return 0;
}

- (BOOL)automaticallyAdjustsImageControlMode
{
  return 1;
}

- (void)setAutomaticallyAdjustsImageControlMode:(BOOL)a3
{
  float v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v3);
  }
  NSLog(&cfstr_SuppressingExc.isa, v3);
}

- (int64_t)imageControlMode
{
  return -1;
}

- (void)setImageControlMode:(int64_t)a3
{
  float v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v3);
  }
  NSLog(&cfstr_SuppressingExc.isa, v3);
}

- (BOOL)automaticallyAdjustsVideoHDREnabled
{
  return 0;
}

- (void)setAutomaticallyAdjustsVideoHDREnabled:(BOOL)automaticallyAdjustsVideoHDREnabled
{
  float v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v3);
  }
  NSLog(&cfstr_SuppressingExc.isa, v3);
}

- (BOOL)isVideoHDREnabled
{
  return 0;
}

- (void)setVideoHDREnabled:(BOOL)videoHDREnabled
{
  float v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v3);
  }
  NSLog(&cfstr_SuppressingExc.isa, v3);
}

- (BOOL)isVideoHDRSuspended
{
  return 0;
}

- (void)setVideoHDRSuspended:(BOOL)a3
{
  float v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v3);
  }
  NSLog(&cfstr_SuppressingExc.isa, v3);
}

- (AVCaptureColorSpace)activeColorSpace
{
  return -1;
}

- (NSArray)virtualDeviceSwitchOverVideoZoomFactors
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (void)setActiveColorSpace:(AVCaptureColorSpace)activeColorSpace
{
  float v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v3);
  }
  NSLog(&cfstr_SuppressingExc.isa, v3);
}

- (BOOL)isWideColorSupported
{
  return 0;
}

- (CGFloat)videoZoomFactor
{
  return 1.0;
}

- (void)setVideoZoomFactor:(CGFloat)videoZoomFactor
{
  float v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v3);
  }
  NSLog(&cfstr_SuppressingExc.isa, v3);
}

- (void)rampToVideoZoomFactor:(CGFloat)factor withRate:(float)rate
{
  float v4 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v4);
  }
  NSLog(&cfstr_SuppressingExc.isa, v4);
}

- (void)rampExponentiallyToVideoZoomFactor:(float)a3 withDuration:(double)a4
{
  float v4 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v4);
  }
  NSLog(&cfstr_SuppressingExc.isa, v4);
}

- (void)rampToVideoZoomFactor:(float)a3 withTuning:(int64_t)a4
{
  float v4 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v4);
  }
  NSLog(&cfstr_SuppressingExc.isa, v4);
}

- (BOOL)isRampingVideoZoom
{
  return 0;
}

- (void)cancelVideoZoomRamp
{
  float v2 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v2);
  }
  NSLog(&cfstr_SuppressingExc.isa, v2);
}

- (CGFloat)dualCameraSwitchOverVideoZoomFactor
{
  return 1.0;
}

- (CGFloat)minAvailableVideoZoomFactor
{
  return 1.0;
}

- (CGFloat)maxAvailableVideoZoomFactor
{
  return 1.0;
}

- (double)maxAvailableVideoZoomFactorOverride
{
  return 0.0;
}

- (void)setMaxAvailableVideoZoomFactorOverride:(double)a3
{
  float v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v3);
  }
  NSLog(&cfstr_SuppressingExc.isa, v3);
}

- (BOOL)isGeometricDistortionCorrectionSupported
{
  return 0;
}

- (BOOL)isGeometricDistortionCorrectionEnabled
{
  return 0;
}

- (void)setGeometricDistortionCorrectionEnabled:(BOOL)geometricDistortionCorrectionEnabled
{
  float v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v3);
  }
  NSLog(&cfstr_SuppressingExc.isa, v3);
}

- (id)cameraPoseMatrix
{
  return 0;
}

+ (NSData)extrinsicMatrixFromDevice:(AVCaptureDevice *)fromDevice toDevice:(AVCaptureDevice *)toDevice
{
  id v6 = [(AVCaptureDevice *)fromDevice cameraPoseMatrix];
  id v7 = [(AVCaptureDevice *)toDevice cameraPoseMatrix];
  if (!fromDevice)
  {
    uint64_t v23 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v24 = *MEMORY[0x1E4F1C3C8];
LABEL_11:
    v25 = (void *)[v23 exceptionWithName:v24 reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v25);
    }
    NSLog(&cfstr_SuppressingExc.isa, v25);
    return 0;
  }
  if (!toDevice)
  {
    uint64_t v23 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v24 = *MEMORY[0x1E4F1C3C8];
    goto LABEL_11;
  }
  uint64_t v8 = v7;
  if ([v6 length] != 64) {
    return 0;
  }
  if ([v8 length] != 64) {
    return 0;
  }
  AVCaptureDevicePosition v9 = [(AVCaptureDevice *)fromDevice position];
  if (v9 != [(AVCaptureDevice *)toDevice position]) {
    return 0;
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  int32x4_t v30 = 0u;
  int32x4_t v31 = 0u;
  int32x4_t v32 = 0u;
  long long v33 = 0u;
  objc_msgSend(v6, "getBytes:length:", &v34, objc_msgSend(v6, "length"));
  objc_msgSend(v8, "getBytes:length:", &v30, objc_msgSend(v8, "length"));
  uint64_t v10 = 0;
  float32x4_t v11 = (float32x4_t)vzip1q_s32(v30, v31);
  v11.i32[2] = v32.i32[0];
  float32x4_t v12 = (float32x4_t)vzip2q_s32(vzip1q_s32(v30, v32), vdupq_lane_s32(*(int32x2_t *)v31.i8, 1));
  float32x4_t v13 = (float32x4_t)vzip2q_s32(v30, v31);
  v13.i32[2] = v32.i32[2];
  v38[0] = v34;
  v38[1] = v35;
  v38[2] = v36;
  memset(v39, 0, sizeof(v39));
  do
  {
    v39[v10] = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v11, COERCE_FLOAT(v38[v10])), v12, *(float32x2_t *)&v38[v10], 1), v13, (float32x4_t)v38[v10], 2);
    ++v10;
  }
  while (v10 != 3);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  FigCaptureFirmwareToNVMExtrinsicMatrixTransform();
  FigCaptureTransformExtrinsicMatrix();
  DWORD2(v26) = v14;
  DWORD2(v27) = v15;
  *(void *)&long long v26 = v16;
  *(void *)&long long v27 = v17;
  DWORD2(v28) = v18;
  DWORD2(v29) = v19;
  *(void *)&long long v28 = v20;
  *(void *)&long long v29 = v21;
  return (NSData *)[MEMORY[0x1E4F1C9B8] dataWithBytes:&v26 length:64];
}

uint64_t __44__AVCaptureDevice_setUpCenterStageStateOnce__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cinematicFramingEnabledChanged:");
}

+ (void)_cinematicFramingEnabledChanged:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [a1 setupKVOLoggingOnce];
  if (sDetailedKVOOverrideLogging)
  {
    FigCopyBacktrace();
    if (dword_1EB4C92C0)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  int v6 = objc_msgSend(a1, "_defaultCenterStageEnabled", v9, v11);
  if (a3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      int v6 = [a3 BOOLValue];
    }
  }
  os_unfair_lock_lock(&sCenterStageLock);
  int v7 = sCenterStageEnabled;
  os_unfair_lock_unlock(&sCenterStageLock);
  if (v7 != v6)
  {
    [a1 willChangeValueForKey:@"cinematicFramingEnabled"];
    [a1 willChangeValueForKey:@"centerStageEnabled"];
    os_unfair_lock_lock(&sCenterStageLock);
    sCenterStageEnabled = v6;
    os_unfair_lock_unlock(&sCenterStageLock);
    if (dword_1EB4C92C0)
    {
      uint64_t v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    objc_msgSend(a1, "didChangeValueForKey:", @"centerStageEnabled", v10, v12);
    [a1 didChangeValueForKey:@"cinematicFramingEnabled"];
  }
}

+ (AVCaptureCenterStageControlMode)centerStageControlMode
{
  [a1 setUpCenterStageStateOnce];
  os_unfair_lock_lock(&sCenterStageLock);
  AVCaptureCenterStageControlMode v2 = sCenterStageControlMode;
  os_unfair_lock_unlock(&sCenterStageLock);
  return v2;
}

+ (void)setCenterStageControlMode:(AVCaptureCenterStageControlMode)centerStageControlMode
{
  [a1 setUpCenterStageStateOnce];
  if ((unint64_t)centerStageControlMode >= (AVCaptureCenterStageControlModeCooperative|AVCaptureCenterStageControlModeApp))
  {
    int v6 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v6);
    }
    NSLog(&cfstr_SuppressingExc.isa, v6);
  }
  else
  {
    [a1 willChangeValueForKey:@"centerStageControlMode"];
    os_unfair_lock_lock(&sCenterStageLock);
    sCenterStageControlMode = centerStageControlMode;
    os_unfair_lock_unlock(&sCenterStageLock);
    uint64_t v5 = [NSNumber numberWithInteger:centerStageControlMode];
    +[AVCaptureProprietaryDefaultsSingleton setObject:v5 forKey:sCenterStageControlModeKey];
    [a1 didChangeValueForKey:@"centerStageControlMode"];
  }
}

+ (void)setCenterStageEnabled:(BOOL)centerStageEnabled
{
  BOOL v3 = centerStageEnabled;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  [a1 setUpCenterStageStateOnce];
  if ([a1 centerStageControlMode])
  {
    if (dword_1EB4C92C0)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", v3, v9, v10);
    +[AVCaptureProprietaryDefaultsSingleton setObject:v7 forKey:sCenterStageEnabledKey];
    os_unfair_lock_lock(&sCenterStageLock);
    os_unfair_lock_unlock(&sCenterStageLock);
    if (dword_1EB4C92C0)
    {
      uint64_t v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  else
  {
    int v6 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v6);
    }
    NSLog(&cfstr_SuppressingExc.isa, v6);
  }
}

- (BOOL)isCenterStageActive
{
  return 0;
}

- (CGRect)centerStageRectOfInterest
{
  double v2 = *MEMORY[0x1E4F1DB20];
  double v3 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setCenterStageRectOfInterest:(CGRect)centerStageRectOfInterest
{
  double v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  objc_exception_throw(v3);
}

- (BOOL)isCenterStageRectOfInterestSupported
{
  return 0;
}

- (BOOL)isCenterStageMetadataDeliverySupported
{
  return 0;
}

- (void)setCenterStageMetadataDeliveryEnabled:(BOOL)a3
{
  double v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  objc_exception_throw(v3);
}

- (BOOL)isCenterStageMetadataDeliveryEnabled
{
  return 0;
}

+ (int64_t)centerStageFramingMode
{
  [a1 setUpCenterStageStateOnce];
  os_unfair_lock_lock(&sCenterStageLock);
  int64_t v2 = sCenterStageFramingMode;
  os_unfair_lock_unlock(&sCenterStageLock);
  return v2;
}

+ (void)setCenterStageFramingMode:(int64_t)a3
{
  [a1 setUpCenterStageStateOnce];
  os_unfair_lock_lock(&sCenterStageLock);
  char v5 = sSettingCenterStageFramingModeMyself;
  int v6 = sCenterStageFramingMode;
  os_unfair_lock_unlock(&sCenterStageLock);
  if ((v5 & 1) != 0 || v6 == a3)
  {
    if (dword_1EB4C92C0)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  else
  {
    [a1 willChangeValueForKey:@"centerStageFramingMode"];
    os_unfair_lock_lock(&sCenterStageLock);
    sCenterStageFramingMode = a3;
    sSettingCenterStageFramingModeMyself = 1;
    os_unfair_lock_unlock(&sCenterStageLock);
    [a1 didChangeValueForKey:@"centerStageFramingMode"];
    os_unfair_lock_lock(&sCenterStageLock);
    sSettingCenterStageFramingModeMyself = 0;
    os_unfair_lock_unlock(&sCenterStageLock);
  }
}

- (BOOL)isPortraitEffectActive
{
  return 0;
}

uint64_t __47__AVCaptureDevice_setUpBackgroundBlurStateOnce__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_backgroundBlurEnabledChanged:");
}

uint64_t __47__AVCaptureDevice_setUpBackgroundBlurStateOnce__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_backgroundBlurApertureChanged:");
}

+ (void)_backgroundBlurEnabledChanged:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  [a1 setupKVOLoggingOnce];
  if (sDetailedKVOOverrideLogging)
  {
    FigCopyBacktrace();
    if (dword_1EB4C92C0)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  if (a3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      LODWORD(a3) = [a3 BOOLValue];
    }
    else {
      LODWORD(a3) = 0;
    }
  }
  os_unfair_lock_lock(&sBackgroundBlurLock);
  int v6 = sBackgroundBlurEnabled;
  os_unfair_lock_unlock(&sBackgroundBlurLock);
  if (v6 != a3)
  {
    [a1 willChangeValueForKey:@"backgroundBlurEnabled"];
    [a1 willChangeValueForKey:@"portraitEffectEnabled"];
    os_unfair_lock_lock(&sBackgroundBlurLock);
    sBackgroundBlurEnabled = (char)a3;
    os_unfair_lock_unlock(&sBackgroundBlurLock);
    if (dword_1EB4C92C0)
    {
      uint64_t v7 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    objc_msgSend(a1, "didChangeValueForKey:", @"portraitEffectEnabled", v8, v9);
    [a1 didChangeValueForKey:@"backgroundBlurEnabled"];
  }
}

+ (int64_t)backgroundBlurControlMode
{
  [a1 setUpBackgroundBlurStateOnce];
  os_unfair_lock_lock(&sBackgroundBlurLock);
  int64_t v2 = sBackgroundBlurControlMode;
  os_unfair_lock_unlock(&sBackgroundBlurLock);
  return v2;
}

+ (void)setBackgroundBlurControlMode:(int64_t)a3
{
  [a1 setUpBackgroundBlurStateOnce];
  if ((AVCaptureCurrentClientIsFaceTimeVariant() & 1) != 0
    || (AVCaptureClientIsContinuityCapture() & 1) != 0
    || (AVCaptureIsRunningInXCTest() & 1) != 0
    || (AVCaptureClientIsInternalTestTool() & 1) != 0
    || AVCaptureTemporaryHackToAllowPortraitBlurSeeRadar78740254())
  {
    if ((unint64_t)a3 < 3)
    {
LABEL_7:
      [a1 willChangeValueForKey:@"backgroundBlurControlMode"];
      os_unfair_lock_lock(&sBackgroundBlurLock);
      sBackgroundBlurControlMode = a3;
      os_unfair_lock_unlock(&sBackgroundBlurLock);
      uint64_t v5 = [NSNumber numberWithInteger:a3];
      +[AVCaptureProprietaryDefaultsSingleton setObject:v5 forKey:sBackgroundBlurControlModeKey];
      [a1 didChangeValueForKey:@"backgroundBlurControlMode"];
      return;
    }
  }
  else if (!a3)
  {
    goto LABEL_7;
  }
  int v6 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v6);
  }
  NSLog(&cfstr_SuppressingExc.isa, v6);
}

+ (void)setBackgroundBlurEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  [a1 setUpBackgroundBlurStateOnce];
  if ([a1 backgroundBlurControlMode])
  {
    if (dword_1EB4C92C0)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", v3, v9, v10);
    +[AVCaptureProprietaryDefaultsSingleton setObject:v7 forKey:sBackgroundBlurEnabledKey];
    os_unfair_lock_lock(&sBackgroundBlurLock);
    os_unfair_lock_unlock(&sBackgroundBlurLock);
    if (dword_1EB4C92C0)
    {
      uint64_t v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  else
  {
    int v6 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v6);
    }
    NSLog(&cfstr_SuppressingExc.isa, v6);
  }
}

uint64_t __46__AVCaptureDevice_isEligibleForBackgroundBlur__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _checkEligiblityForEffect:AVCaptureBundleCameraPortraitEffectEnabledKey];
  isEligibleForBackgroundBlur_sIsEligibleForBackgroundBlur = result;
  return result;
}

+ (void)_backgroundBlurApertureChanged:(id)a3
{
  float v4 = 3.0;
  if (a3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [a3 floatValue];
      float v4 = v6;
    }
  }
  os_unfair_lock_lock(&sBackgroundBlurLock);
  char v7 = sSettingBackgroundBlurApertureMyself;
  float v8 = *(float *)&sBackgroundBlurAperture;
  os_unfair_lock_unlock(&sBackgroundBlurLock);
  if ((v7 & 1) == 0 && v8 != v4)
  {
    [a1 willChangeValueForKey:@"backgroundBlurAperture"];
    os_unfair_lock_lock(&sBackgroundBlurLock);
    sBackgroundBlurAperture = LODWORD(v4);
    os_unfair_lock_unlock(&sBackgroundBlurLock);
    [a1 didChangeValueForKey:@"backgroundBlurAperture"];
  }
}

+ (void)setBackgroundBlurAperture:(float)a3
{
  [a1 setUpBackgroundBlurStateOnce];
  if ([a1 backgroundBlurControlMode])
  {
    if (a3 >= 2.0 && a3 <= 4.0)
    {
      [a1 willChangeValueForKey:@"backgroundBlurAperture"];
      os_unfair_lock_lock(&sBackgroundBlurLock);
      sBackgroundBlurAperture = LODWORD(a3);
      sSettingBackgroundBlurApertureMyself = 1;
      os_unfair_lock_unlock(&sBackgroundBlurLock);
      *(float *)&double v9 = a3;
      uint64_t v10 = [NSNumber numberWithFloat:v9];
      +[AVCaptureProprietaryDefaultsSingleton setObject:v10 forKey:sBackgroundBlurApertureKey];
      os_unfair_lock_lock(&sBackgroundBlurLock);
      sSettingBackgroundBlurApertureMyself = 0;
      os_unfair_lock_unlock(&sBackgroundBlurLock);
      [a1 didChangeValueForKey:@"backgroundBlurAperture"];
      return;
    }
    float v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
  }
  else
  {
    float v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
  }
  float v8 = (void *)[v6 exceptionWithName:v7 reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v8);
  }
  NSLog(&cfstr_SuppressingExc.isa, v8);
}

+ (AudioValueRange)backgroundBlurApertureRange
{
  double v2 = 2.0;
  double v3 = 4.0;
  result.mMaximum = v3;
  result.mMinimum = v2;
  return result;
}

+ (float)backgroundBlurApertureDefault
{
  return 3.0;
}

uint64_t __47__AVCaptureDevice_setUpStudioLightingStateOnce__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_studioLightingEnabledChanged:");
}

uint64_t __47__AVCaptureDevice_setUpStudioLightingStateOnce__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_studioLightingIntensityChanged:");
}

+ (int64_t)studioLightingControlMode
{
  [a1 setUpStudioLightingStateOnce];
  os_unfair_lock_lock(&sBackgroundBlurLock);
  int64_t v2 = sStudioLightingControlMode;
  os_unfair_lock_unlock(&sBackgroundBlurLock);
  return v2;
}

+ (void)setStudioLightingControlMode:(int64_t)a3
{
  [a1 setUpStudioLightingStateOnce];
  if ((AVCaptureClientIsContinuityCapture() & 1) != 0
    || (AVCaptureIsRunningInXCTest() & 1) != 0
    || (AVCaptureClientIsInternalTestTool() & 1) != 0
    || (IsFaceTimeVariant = AVCaptureCurrentClientIsFaceTimeVariant(), unint64_t v6 = a3, IsFaceTimeVariant))
  {
    unint64_t v6 = a3 & 0xFFFFFFFFFFFFFFFDLL;
  }
  if (v6)
  {
    uint64_t v7 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v7);
    }
    NSLog(&cfstr_SuppressingExc.isa, v7);
  }
  else
  {
    [a1 willChangeValueForKey:@"studioLightingControlMode"];
    os_unfair_lock_lock(&sBackgroundBlurLock);
    sStudioLightingControlMode = a3;
    os_unfair_lock_unlock(&sBackgroundBlurLock);
    uint64_t v8 = [NSNumber numberWithInteger:a3];
    +[AVCaptureProprietaryDefaultsSingleton setObject:v8 forKey:sStudioLightingControlModeKey];
    [a1 didChangeValueForKey:@"studioLightingControlMode"];
  }
}

+ (void)setStudioLightingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  [a1 setUpStudioLightingStateOnce];
  if ([a1 studioLightingControlMode])
  {
    if (dword_1EB4C92C0)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", v3, v9, v10);
    +[AVCaptureProprietaryDefaultsSingleton setObject:v7 forKey:sStudioLightingEnabledKey];
    os_unfair_lock_lock(&sBackgroundBlurLock);
    os_unfair_lock_unlock(&sBackgroundBlurLock);
    if (dword_1EB4C92C0)
    {
      uint64_t v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  else
  {
    unint64_t v6 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v6);
    }
    NSLog(&cfstr_SuppressingExc.isa, v6);
  }
}

uint64_t __46__AVCaptureDevice_isEligibleForStudioLighting__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _checkEligiblityForEffect:AVCaptureBundleCameraStudioLightEnabledKey];
  isEligibleForStudioLighting_sIsEligibleForStudioLighting = result;
  return result;
}

+ (void)_studioLightEnabledChanged:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  [a1 setupKVOLoggingOnce];
  if (sDetailedKVOOverrideLogging)
  {
    FigCopyBacktrace();
    if (dword_1EB4C92C0)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  if (a3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    int v6 = [a3 BOOLValue];
  }
  else {
    int v6 = 0;
  }
  os_unfair_lock_lock(&sBackgroundBlurLock);
  int v7 = sStudioLightingEnabled;
  os_unfair_lock_unlock(&sBackgroundBlurLock);
  if (v7 != v6)
  {
    [a1 willChangeValueForKey:@"studioLightingEnabled"];
    [a1 willChangeValueForKey:@"studioLightEnabled"];
    os_unfair_lock_lock(&sBackgroundBlurLock);
    sStudioLightingEnabled = v6;
    os_unfair_lock_unlock(&sBackgroundBlurLock);
    if (dword_1EB4C92C0)
    {
      uint64_t v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    objc_msgSend(a1, "didChangeValueForKey:", @"studioLightEnabled", v9, v10);
    [a1 didChangeValueForKey:@"studioLightingEnabled"];
  }
}

- (BOOL)isStudioLightActive
{
  return 0;
}

+ (void)setPortraitEffectStudioLightQuality:(int64_t)a3
{
  [a1 willChangeValueForKey:@"portraitEffectStudioLightQuality"];
  os_unfair_lock_lock(&sBackgroundBlurLock);
  sPortraitEffectStudioLightQuality = a3;
  os_unfair_lock_unlock(&sBackgroundBlurLock);

  [a1 didChangeValueForKey:@"portraitEffectStudioLightQuality"];
}

+ (void)_studioLightingIntensityChanged:(id)a3
{
  float v4 = 0.5;
  if (a3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [a3 floatValue];
      float v4 = v6;
    }
  }
  os_unfair_lock_lock(&sBackgroundBlurLock);
  char v7 = sSettingStudioLightingIntensityMyself;
  float v8 = *(float *)&sStudioLightingIntensity;
  os_unfair_lock_unlock(&sBackgroundBlurLock);
  if ((v7 & 1) == 0 && v8 != v4)
  {
    [a1 willChangeValueForKey:@"studioLightingIntensity"];
    os_unfair_lock_lock(&sBackgroundBlurLock);
    sStudioLightingIntensity = LODWORD(v4);
    os_unfair_lock_unlock(&sBackgroundBlurLock);
    [a1 didChangeValueForKey:@"studioLightingIntensity"];
  }
}

+ (void)setStudioLightingIntensity:(float)a3
{
  [a1 setUpStudioLightingStateOnce];
  if ([a1 studioLightingControlMode])
  {
    if (a3 >= 0.0 && a3 <= 1.0)
    {
      [a1 willChangeValueForKey:@"studioLightingIntensity"];
      os_unfair_lock_lock(&sBackgroundBlurLock);
      sStudioLightingIntensity = LODWORD(a3);
      sSettingStudioLightingIntensityMyself = 1;
      os_unfair_lock_unlock(&sBackgroundBlurLock);
      *(float *)&double v9 = a3;
      uint64_t v10 = [NSNumber numberWithFloat:v9];
      +[AVCaptureProprietaryDefaultsSingleton setObject:v10 forKey:sStudioLightingIntensityKey];
      os_unfair_lock_lock(&sBackgroundBlurLock);
      sSettingStudioLightingIntensityMyself = 0;
      os_unfair_lock_unlock(&sBackgroundBlurLock);
      [a1 didChangeValueForKey:@"studioLightingIntensity"];
      return;
    }
    float v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
  }
  else
  {
    float v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
  }
  float v8 = (void *)[v6 exceptionWithName:v7 reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v8);
  }
  NSLog(&cfstr_SuppressingExc.isa, v8);
}

+ (float)studioLightingIntensityDefault
{
  return 0.5;
}

uint64_t __48__AVCaptureDevice_setUpReactionEffectsStateOnce__block_invoke_421(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reactionsEnabledChanged:");
}

uint64_t __48__AVCaptureDevice_setUpReactionEffectsStateOnce__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_gesturesEnabledChanged:");
}

uint64_t __48__AVCaptureDevice_setUpReactionEffectsStateOnce__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reactionTriggered:");
}

uint64_t __48__AVCaptureDevice_setUpReactionEffectsStateOnce__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reactionsInProgressChangedByControlCenter:");
}

+ (void)_reactionsEnabledChanged:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [a1 setupKVOLoggingOnce];
  if (sDetailedKVOOverrideLogging)
  {
    FigCopyBacktrace();
    if (dword_1EB4C92C0)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  int v6 = +[AVCaptureDevice reactionEffectsEnabledDefault];
  if (a3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      int v6 = [a3 BOOLValue];
    }
  }
  os_unfair_lock_lock(&sReactionsLock);
  int v7 = sReactionsEnabled;
  os_unfair_lock_unlock(&sReactionsLock);
  if (v7 != v6)
  {
    [a1 willChangeValueForKey:@"reactionEffectsEnabled"];
    os_unfair_lock_lock(&sReactionsLock);
    sReactionsEnabled = v6;
    os_unfair_lock_unlock(&sReactionsLock);
    if (dword_1EB4C92C0)
    {
      float v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    objc_msgSend(a1, "didChangeValueForKey:", @"reactionEffectsEnabled", v10, v12);
  }
}

+ (void)_gesturesEnabledChanged:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [a1 setupKVOLoggingOnce];
  if (sDetailedKVOOverrideLogging)
  {
    FigCopyBacktrace();
    if (dword_1EB4C92C0)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  int v6 = +[AVCaptureDevice reactionEffectGesturesEnabledDefault];
  if (a3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      int v6 = [a3 BOOLValue];
    }
  }
  os_unfair_lock_lock(&sReactionsLock);
  int v7 = sGesturesEnabled;
  os_unfair_lock_unlock(&sReactionsLock);
  if (v7 != v6)
  {
    [a1 willChangeValueForKey:@"reactionEffectGesturesEnabled"];
    os_unfair_lock_lock(&sReactionsLock);
    sGesturesEnabled = v6;
    os_unfair_lock_unlock(&sReactionsLock);
    if (dword_1EB4C92C0)
    {
      float v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    objc_msgSend(a1, "didChangeValueForKey:", @"reactionEffectGesturesEnabled", v10, v12);
  }
}

+ (void)_reactionTriggered:(id)a3
{
  uint64_t v4 = [a3 objectForKeyedSubscript:@"AVControlCenterModulesNotificationDeviceIdentifierKey"];
  if (v4
    && (uint64_t v5 = +[AVCaptureDevice deviceWithUniqueID:v4]) != 0
    && (int v6 = v5,
        uint64_t v7 = [a3 objectForKeyedSubscript:@"AVControlCenterModulesNotificationReactionTypeKey"],
        +[AVCaptureDevice setUpReactionEffectsStateOnce],
        ([(id)sAvailableReactions containsObject:v7] & 1) != 0))
  {
    [(AVCaptureDevice *)v6 _performReaction:v7];
  }
  else
  {
    FigDebugAssert3();
  }
}

+ (void)_reactionsInProgressChangedByControlCenter:(id)a3
{
  uint64_t v4 = [a3 objectForKeyedSubscript:@"AVControlCenterModulesNotificationDeviceIdentifierKey"];
  if (v4
    && (uint64_t v5 = +[AVCaptureDevice deviceWithUniqueID:v4]) != 0
    && (int v6 = v5,
        (uint64_t v7 = [a3 objectForKeyedSubscript:@"AVControlCenterModulesNotificationReactionEffectsInProgressKey"]) != 0))
  {
    [(AVCaptureDevice *)v6 updateReactionsInProgress:v7];
  }
  else
  {
    FigDebugAssert3();
  }
}

- (void)updateReactionsInProgress:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock(&sReactionsLock);
  uint64_t v5 = self->_internal->activeReactions;
  os_unfair_lock_unlock(&sReactionsLock);
  int v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a3, "count"));
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v7 = [a3 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v40 != v9) {
          objc_enumerationMutation(a3);
        }
        id v11 = [[AVCaptureReactionEffectState alloc] initFromDictionary:*(void *)(*((void *)&v39 + 1) + 8 * i)];
        if (v11)
        {
          uint64_t v12 = v11;
          [v6 addObject:v11];
        }
      }
      uint64_t v8 = [a3 countByEnumeratingWithState:&v39 objects:v43 count:16];
    }
    while (v8);
  }
  uint64_t v13 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  unint64_t v14 = 0;
  unint64_t v15 = 0;
  uint64_t v16 = (long long *)MEMORY[0x1E4F1F9F0];
  while (v15 < -[NSMutableArray count](v5, "count") || v14 < [v6 count])
  {
    if (v15 >= [(NSMutableArray *)v5 count])
    {
      uint64_t v23 = [v6 objectAtIndexedSubscript:v14];
      uint64_t v24 = v13;
LABEL_30:
      [v24 addObject:v23];
      goto LABEL_34;
    }
    if (v14 >= [v6 count])
    {
      uint64_t v20 = (void *)[(NSMutableArray *)v5 objectAtIndexedSubscript:v15];
      long long v37 = *v16;
      uint64_t v38 = *((void *)v16 + 2);
      uint64_t v21 = &v37;
      goto LABEL_24;
    }
    uint64_t v17 = (void *)[v6 objectAtIndexedSubscript:v14];
    uint64_t v18 = [(NSMutableArray *)v5 objectAtIndexedSubscript:v15];
    int v19 = (void *)v18;
    if (v17)
    {
      [v17 startTime];
      if (!v19) {
        goto LABEL_20;
      }
    }
    else
    {
      memset(&lhs, 0, sizeof(lhs));
      if (!v18)
      {
LABEL_20:
        memset(&rhs, 0, sizeof(rhs));
        goto LABEL_21;
      }
    }
    [v19 startTime];
LABEL_21:
    CMTimeSubtract(&time, &lhs, &rhs);
    float Seconds = CMTimeGetSeconds(&time);
    if (fabsf(Seconds) < 0.0001)
    {
      if (!v17)
      {
        uint64_t v31 = 0;
        uint64_t v32 = 0;
        uint64_t v33 = 0;
LABEL_32:
        [v13 addObject:v19];
        goto LABEL_33;
      }
      [v17 endTime];
      if ((v32 & 0x100000000) == 0) {
        goto LABEL_32;
      }
      [v17 endTime];
      long long v27 = v29;
      uint64_t v28 = v30;
      [v19 setEndTime:&v27];
LABEL_33:
      ++v15;
LABEL_34:
      ++v14;
    }
    else
    {
      if (Seconds < 0.0)
      {
        uint64_t v24 = v13;
        uint64_t v23 = (uint64_t)v17;
        goto LABEL_30;
      }
      long long v25 = *v16;
      uint64_t v26 = *((void *)v16 + 2);
      uint64_t v21 = &v25;
      uint64_t v20 = v19;
LABEL_24:
      objc_msgSend(v20, "setEndTime:", v21, v25, v26);
      ++v15;
    }
  }
  [(AVCaptureDevice *)self willChangeValueForKey:@"reactionEffectsInProgress"];
  os_unfair_lock_lock(&sReactionsLock);

  self->_internal->activeReactions = (NSMutableArray *)v13;
  os_unfair_lock_unlock(&sReactionsLock);
  [(AVCaptureDevice *)self didChangeValueForKey:@"reactionEffectsInProgress"];
}

+ (void)setReactionEffectsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  [a1 setUpReactionEffectsStateOnce];
  if (dword_1EB4C92C0)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithBool:", v3, v7, v8);
  +[AVCaptureProprietaryDefaultsSingleton setObject:v5 forKey:sReactionsEnabledKey];
  os_unfair_lock_lock(&sReactionsLock);
  os_unfair_lock_unlock(&sReactionsLock);
  if (dword_1EB4C92C0)
  {
    int v6 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

+ (void)setReactionEffectGesturesEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  [a1 setUpReactionEffectsStateOnce];
  if (dword_1EB4C92C0)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithBool:", v3, v7, v8);
  +[AVCaptureProprietaryDefaultsSingleton setObject:v5 forKey:sGesturesEnabledKey];
  os_unfair_lock_lock(&sReactionsLock);
  os_unfair_lock_unlock(&sReactionsLock);
  if (dword_1EB4C92C0)
  {
    int v6 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

uint64_t __59__AVCaptureDevice_setUpGesturesDefaultDisabledNotification__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_haveShownGesturesDefaultDisabledNotificationChanged:");
}

+ (void)_haveShownGesturesDefaultDisabledNotificationChanged:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  [a1 setupKVOLoggingOnce];
  if (sDetailedKVOOverrideLogging)
  {
    FigCopyBacktrace();
    if (dword_1EB4C92C0)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  if (a3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      LODWORD(a3) = [a3 BOOLValue];
    }
    else {
      LODWORD(a3) = 0;
    }
  }
  os_unfair_lock_lock(&sGesturesDefaultDisabledNotificationLock);
  int v6 = sHaveShownGesturesDefaultDisabledNotification;
  os_unfair_lock_unlock(&sGesturesDefaultDisabledNotificationLock);
  if (v6 != a3)
  {
    [a1 willChangeValueForKey:@"haveShownGesturesDefaultDisabledNotification"];
    os_unfair_lock_lock(&sGesturesDefaultDisabledNotificationLock);
    sHaveShownGesturesDefaultDisabledNotification = (char)a3;
    os_unfair_lock_unlock(&sGesturesDefaultDisabledNotificationLock);
    if (dword_1EB4C92C0)
    {
      uint64_t v7 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    objc_msgSend(a1, "didChangeValueForKey:", @"haveShownGesturesDefaultDisabledNotification", v8, v9);
  }
}

+ (void)requestGesturesDefaultDisabledNotification
{
  char v2 = [a1 haveShownGesturesDefaultDisabledNotification];
  os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
  fig_log_call_emit_and_clean_up_after_send_and_compose();
  if ((v2 & 1) == 0) {
    +[AVCaptureProprietaryDefaultsSingleton setObject:AVCaptureClientPreferencesDomain() forKey:sRequestGesturesDefaultDisabledNotificationKey];
  }
}

- (BOOL)canPerformReactionEffects
{
  BOOL v2 = [(AVCaptureDeviceFormat *)[(AVCaptureDevice *)self activeFormat] reactionEffectsSupported];
  if (v2)
  {
    LOBYTE(v2) = +[AVCaptureDevice reactionEffectsEnabled];
  }
  return v2;
}

- (NSSet)availableReactionTypes
{
  return (NSSet *)sAvailableReactions;
}

- (void)performEffectForReaction:(AVCaptureReactionType)reactionType
{
  +[AVCaptureDevice setUpReactionEffectsStateOnce];
  if ([(id)sAvailableReactions containsObject:reactionType])
  {
    uint64_t v5 = AVCaptureClientPreferencesDomain();
    AVControlCenterVideoEffectsModulePerformReactionEffect((uint64_t)reactionType, (uint64_t)v5, self);
  }
  else
  {
    int v6 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v6);
    }
    NSLog(&cfstr_SuppressingExc.isa, v6);
  }
}

- (NSArray)reactionEffectsInProgress
{
  +[AVCaptureDevice setUpReactionEffectsStateOnce];
  os_unfair_lock_lock(&sReactionsLock);
  BOOL v3 = (NSArray *)(id)[(NSMutableArray *)self->_internal->activeReactions copy];
  os_unfair_lock_unlock(&sReactionsLock);
  return v3;
}

uint64_t __54__AVCaptureDevice_setUpBackgroundReplacementStateOnce__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_backgroundReplacementEnabledChanged:");
}

uint64_t __54__AVCaptureDevice_setUpBackgroundReplacementStateOnce__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_backgroundReplacementURLBookmarkChanged:");
}

uint64_t __54__AVCaptureDevice_setUpBackgroundReplacementStateOnce__block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    __54__AVCaptureDevice_setUpBackgroundReplacementStateOnce__block_invoke_4_cold_1();
  }
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "backgroundReplacementURL"), "URLByResolvingSymlinksInPath"), "URLByStandardizingPath");
  uint64_t v6 = objc_msgSend((id)objc_msgSend(a3, "URLByResolvingSymlinksInPath"), "URLByStandardizingPath");
  if (!v5 || (uint64_t result = [v5 isEqual:v6], result))
  {
    id v8 = +[AVCaptureDevice backgroundReplacementURLDefault];
    uint64_t v9 = *(void **)(a1 + 32);
    return [v9 setBackgroundReplacementURL:v8];
  }
  return result;
}

+ (void)_backgroundReplacementEnabledChanged:(id)a3
{
  id v3 = a3;
  if (a3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      LODWORD(v3) = [v3 BOOLValue];
    }
    else {
      LODWORD(v3) = 0;
    }
  }
  os_unfair_lock_lock((os_unfair_lock_t)&sBackgroundReplacementLock);
  int v5 = sBackgroundReplacementEnabled;
  os_unfair_lock_unlock((os_unfair_lock_t)&sBackgroundReplacementLock);
  if (v5 != v3)
  {
    [a1 willChangeValueForKey:@"backgroundReplacementEnabled"];
    os_unfair_lock_lock((os_unfair_lock_t)&sBackgroundReplacementLock);
    sBackgroundReplacementEnabled = (char)v3;
    os_unfair_lock_unlock((os_unfair_lock_t)&sBackgroundReplacementLock);
    [a1 didChangeValueForKey:@"backgroundReplacementEnabled"];
  }
}

+ (void)_backgroundReplacementURLBookmarkChanged:(id)a3
{
  id v3 = a3;
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      id v3 = 0;
    }
  }
  os_unfair_lock_lock((os_unfair_lock_t)&sBackgroundReplacementLock);
  if ((id)sBackgroundReplacementURLBookmark == v3)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&sBackgroundReplacementLock);
  }
  else
  {
    char v5 = [(id)sBackgroundReplacementURLBookmark isEqual:v3];
    os_unfair_lock_unlock((os_unfair_lock_t)&sBackgroundReplacementLock);
    if ((v5 & 1) == 0)
    {
      [a1 willChangeValueForKey:@"backgroundReplacementURL"];
      [a1 willChangeValueForKey:@"backgroundReplacementPixelBuffer"];
      os_unfair_lock_lock((os_unfair_lock_t)&sBackgroundReplacementLock);
      if (sBackgroundReplacementPixelBuffer)
      {
        CFRelease((CFTypeRef)sBackgroundReplacementPixelBuffer);
        sBackgroundReplacementPixelBuffer = 0;
      }

      sBackgroundReplacementURLBookmark = (uint64_t)v3;
      os_unfair_lock_unlock((os_unfair_lock_t)&sBackgroundReplacementLock);
      [a1 didChangeValueForKey:@"backgroundReplacementURL"];
      [a1 didChangeValueForKey:@"backgroundReplacementPixelBuffer"];
    }
  }
}

+ (void)setBackgroundReplacementEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  [a1 setUpBackgroundReplacementStateOnce];
  uint64_t v4 = [NSNumber numberWithBool:v3];
  uint64_t v5 = sBackgroundReplacementEnabledKey;

  +[AVCaptureProprietaryDefaultsSingleton setObject:v4 forKey:v5];
}

+ (void)setBackgroundReplacementURL:(id)a3
{
  [a1 setUpBackgroundReplacementStateOnce];
  if (!a3) {
    a3 = (id)[a1 backgroundReplacementURLDefault];
  }
  uint64_t v6 = 0;
  uint64_t v5 = [a3 bookmarkDataWithOptions:0 includingResourceValuesForKeys:0 relativeToURL:0 error:&v6];
  if (!v6) {
    +[AVCaptureProprietaryDefaultsSingleton setObject:v5 forKey:sBackgroundReplacementURLBookmarkKey];
  }
}

+ (id)backgroundReplacementURLDefault
{
  return 0;
}

+ (id)backgroundReplacementURL
{
  [a1 setUpBackgroundReplacementStateOnce];
  uint64_t v5 = 0;
  os_unfair_lock_lock((os_unfair_lock_t)&sBackgroundReplacementLock);
  if (sBackgroundReplacementURLBookmark) {
    BOOL v3 = (void *)[MEMORY[0x1E4F1CB10] URLByResolvingBookmarkData:sBackgroundReplacementURLBookmark options:256 relativeToURL:0 bookmarkDataIsStale:0 error:&v5];
  }
  else {
    BOOL v3 = 0;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&sBackgroundReplacementLock);
  if (v5)
  {
    BOOL v3 = (void *)[a1 backgroundReplacementURLDefault];
    [a1 setBackgroundReplacementURL:v3];
  }
  return v3;
}

+ (__CVBuffer)backgroundReplacementPixelBuffer
{
  [a1 setUpBackgroundReplacementStateOnce];
  os_unfair_lock_lock((os_unfair_lock_t)&sBackgroundReplacementLock);
  if (sBackgroundReplacementPixelBuffer)
  {
    CFTypeRef v3 = CFRetain((CFTypeRef)sBackgroundReplacementPixelBuffer);
    uint64_t v4 = (__CVBuffer *)CFAutorelease(v3);
    os_unfair_lock_unlock((os_unfair_lock_t)&sBackgroundReplacementLock);
    if (v4) {
      return v4;
    }
  }
  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&sBackgroundReplacementLock);
  }
  uint64_t v4 = +[AVCaptureProprietaryDefaultsSingleton imageForKey:sBackgroundReplacementURLBookmarkKey fillWidth:1920 fillHeight:1440];
  if (v4) {
    return v4;
  }
  objc_msgSend(a1, "setBackgroundReplacementURL:", objc_msgSend(a1, "backgroundReplacementURLDefault"));
  uint64_t v6 = sBackgroundReplacementURLBookmarkKey;

  return +[AVCaptureProprietaryDefaultsSingleton imageForKey:v6 fillWidth:1920 fillHeight:1440];
}

+ (void)setBackgroundReplacementPixelBuffer:(__CVBuffer *)a3
{
  [a1 setUpBackgroundReplacementStateOnce];
  if (!a3) {
    return;
  }
  os_unfair_lock_lock((os_unfair_lock_t)&sBackgroundReplacementLock);
  uint64_t v5 = (__CVBuffer *)sBackgroundReplacementPixelBuffer;
  os_unfair_lock_unlock((os_unfair_lock_t)&sBackgroundReplacementLock);
  if (v5 == a3) {
    return;
  }
  uint64_t v6 = (void *)CMGetAttachment(a3, @"preference-image-url", 0);
  if (!v6)
  {
    [a1 willChangeValueForKey:@"backgroundReplacementPixelBuffer"];
    goto LABEL_7;
  }
  char v7 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v6, "URLByResolvingSymlinksInPath"), "URLByStandardizingPath"), "isEqual:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "backgroundReplacementURL"), "URLByResolvingSymlinksInPath"), "URLByStandardizingPath"));
  [a1 willChangeValueForKey:@"backgroundReplacementPixelBuffer"];
  if ((v7 & 1) == 0)
  {
LABEL_7:
    [a1 willChangeValueForKey:@"backgroundReplacementURL"];
    [a1 setBackgroundReplacementURL:v6];
    int v8 = 1;
    goto LABEL_8;
  }
  int v8 = 0;
LABEL_8:
  uint64_t v9 = (const void *)sBackgroundReplacementPixelBuffer;
  sBackgroundReplacementPixelBuffer = (uint64_t)a3;
  CFRetain(a3);
  if (v9) {
    CFRelease(v9);
  }
  if (v8) {
    [a1 didChangeValueForKey:@"backgroundReplacementURL"];
  }
  [a1 didChangeValueForKey:@"backgroundReplacementPixelBuffer"];
  if (sBackgroundReplacementPixelBuffer)
  {
    CFRelease((CFTypeRef)sBackgroundReplacementPixelBuffer);
    sBackgroundReplacementPixelBuffer = 0;
  }
}

+ (BOOL)isEligibleForBackgroundReplacement
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__AVCaptureDevice_isEligibleForBackgroundReplacement__block_invoke;
  block[3] = &unk_1E5A72ED0;
  block[4] = a1;
  if (isEligibleForBackgroundReplacement_onceToken != -1) {
    dispatch_once(&isEligibleForBackgroundReplacement_onceToken, block);
  }
  return isEligibleForBackgroundReplacement_sIsEligibleForBackgroundReplacement;
}

uint64_t __53__AVCaptureDevice_isEligibleForBackgroundReplacement__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _checkEligiblityForEffect:AVCaptureBundleCameraBackgroundReplacementEnabledKey];
  isEligibleForBackgroundReplacement_sIsEligibleForBackgroundReplacement = result;
  return result;
}

- (BOOL)isBackgroundReplacementActive
{
  return 0;
}

+ (AVCaptureMicrophoneMode)preferredMicrophoneMode
{
  [a1 setUpMicrophoneModeStateOnce];
  os_unfair_lock_lock((os_unfair_lock_t)&sMicrophoneModeLock);
  AVCaptureMicrophoneMode v2 = sPreferredMicrophoneMode;
  os_unfair_lock_unlock((os_unfair_lock_t)&sMicrophoneModeLock);
  return v2;
}

+ (AVCaptureMicrophoneMode)activeMicrophoneMode
{
  [a1 setUpMicrophoneModeStateOnce];
  os_unfair_lock_lock((os_unfair_lock_t)&sMicrophoneModeLock);
  AVCaptureMicrophoneMode v2 = sActiveMicrophoneMode;
  os_unfair_lock_unlock((os_unfair_lock_t)&sMicrophoneModeLock);
  return v2;
}

+ (void)setUpMicrophoneModeStateOnce
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__AVCaptureDevice_setUpMicrophoneModeStateOnce__block_invoke;
  block[3] = &unk_1E5A72ED0;
  block[4] = a1;
  if (setUpMicrophoneModeStateOnce_onceToken != -1) {
    dispatch_once(&setUpMicrophoneModeStateOnce_onceToken, block);
  }
}

uint64_t __47__AVCaptureDevice_setUpMicrophoneModeStateOnce__block_invoke(uint64_t a1)
{
  AVCaptureMicrophoneMode v2 = AVCaptureClientPreferencesDomain();
  uint64_t v3 = AVControlCenterAudioPreferredMicrophoneModePreferenceKey(v2);
  uint64_t v4 = AVCaptureClientPreferencesDomain();
  uint64_t active = AVControlCenterAudioActiveMicrophoneModePreferenceKey(v4);
  id v6 = +[AVCaptureProprietaryDefaultsSingleton objectForKey:v3];
  if (v6) {
    sPreferredMicrophoneMode = [v6 integerValue];
  }
  id v7 = +[AVCaptureProprietaryDefaultsSingleton objectForKey:active];
  if (v7) {
    sActiveMicrophoneMode = [v7 integerValue];
  }
  +[AVCaptureProprietaryDefaultsSingleton addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:](AVCaptureProprietaryDefaultsSingleton, "addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:");
  return +[AVCaptureProprietaryDefaultsSingleton addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:](AVCaptureProprietaryDefaultsSingleton, "addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:", MEMORY[0x1E4F143A8], 3221225472, __47__AVCaptureDevice_setUpMicrophoneModeStateOnce__block_invoke_3, &unk_1E5A72DB8, *(void *)(a1 + 32));
}

uint64_t __47__AVCaptureDevice_setUpMicrophoneModeStateOnce__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_preferredMicrophoneModeChanged:");
}

uint64_t __47__AVCaptureDevice_setUpMicrophoneModeStateOnce__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activeMicrophoneModeChanged:");
}

+ (void)_preferredMicrophoneModeChanged:(id)a3
{
  id v3 = a3;
  if (a3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v3 = (id)[v3 integerValue];
    }
    else {
      id v3 = 0;
    }
  }
  os_unfair_lock_lock((os_unfair_lock_t)&sMicrophoneModeLock);
  uint64_t v5 = sPreferredMicrophoneMode;
  os_unfair_lock_unlock((os_unfair_lock_t)&sMicrophoneModeLock);
  if ((id)v5 != v3)
  {
    [a1 willChangeValueForKey:@"preferredMicrophoneMode"];
    os_unfair_lock_lock((os_unfair_lock_t)&sMicrophoneModeLock);
    sPreferredMicrophoneMode = (uint64_t)v3;
    os_unfair_lock_unlock((os_unfair_lock_t)&sMicrophoneModeLock);
    [a1 didChangeValueForKey:@"preferredMicrophoneMode"];
  }
}

+ (void)_activeMicrophoneModeChanged:(id)a3
{
  id v3 = a3;
  if (a3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v3 = (id)[v3 integerValue];
    }
    else {
      id v3 = 0;
    }
  }
  os_unfair_lock_lock((os_unfair_lock_t)&sMicrophoneModeLock);
  uint64_t v5 = sActiveMicrophoneMode;
  os_unfair_lock_unlock((os_unfair_lock_t)&sMicrophoneModeLock);
  if ((id)v5 != v3)
  {
    [a1 willChangeValueForKey:@"activeMicrophoneMode"];
    os_unfair_lock_lock((os_unfair_lock_t)&sMicrophoneModeLock);
    sActiveMicrophoneMode = (uint64_t)v3;
    os_unfair_lock_unlock((os_unfair_lock_t)&sMicrophoneModeLock);
    [a1 didChangeValueForKey:@"activeMicrophoneMode"];
  }
}

+ (void)showSystemUserInterface:(AVCaptureSystemUserInterface)systemUserInterface
{
  if ((unint64_t)(systemUserInterface - 1) >= 2)
  {
    id v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v3);
    }
    NSLog(&cfstr_SuppressingExc.isa, v3);
  }
  else
  {
    MEMORY[0x1F410D368](systemUserInterface, a2);
  }
}

- (BOOL)isAutoRedEyeReductionSupported
{
  return 0;
}

- (BOOL)isVideoStabilizationSupported
{
  return 0;
}

- (BOOL)isCameraIntrinsicMatrixDeliverySupported
{
  return 0;
}

- (BOOL)isConstituentPhotoCalibrationDataSupported
{
  return 0;
}

- (BOOL)isVideoZoomSmoothingSupported
{
  return 0;
}

- (BOOL)isResponsiveCaptureWithDepthSupported
{
  return 0;
}

- (BOOL)isLowLightBoostEnabled
{
  return 0;
}

- (BOOL)automaticallyEnablesLowLightBoostWhenAvailable
{
  return 0;
}

- (void)setAutomaticallyEnablesLowLightBoostWhenAvailable:(BOOL)automaticallyEnablesLowLightBoostWhenAvailable
{
  id v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v3);
  }
  NSLog(&cfstr_SuppressingExc.isa, v3);
}

- (AVCaptureSystemPressureState)systemPressureState
{
  AVCaptureMicrophoneMode v2 = [[AVCaptureSystemPressureState alloc] initWithFigLevel:0 factors:0 recommendedFrameRateRangeForPortrait:0];

  return v2;
}

- (int64_t)shallowDepthOfFieldEffectStatus
{
  return 0;
}

- (BOOL)isContinuousZoomWithDepthSupported
{
  return 0;
}

- (BOOL)isContinuousZoomWithDepthEnabled
{
  return 0;
}

- (void)setContinuousZoomWithDepthEnabled:(BOOL)a3
{
  if (a3)
  {
    id v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v3);
    }
    NSLog(&cfstr_SuppressingExc.isa, v3);
  }
}

- (id)supportedMetadataObjectIdentifiers
{
  return 0;
}

- (id)supportedVisionDataProperties
{
  return 0;
}

- (BOOL)isEyeDetectionSupported
{
  return 0;
}

- (BOOL)isEyeClosedDetectionSupported
{
  return 0;
}

- (BOOL)isSmileDetectionSupported
{
  return 0;
}

- (void)setEyeDetectionEnabled:(BOOL)a3
{
  id v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v3);
  }
  NSLog(&cfstr_SuppressingExc.isa, v3);
}

- (void)setEyeClosedDetectionEnabled:(BOOL)a3
{
  id v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v3);
  }
  NSLog(&cfstr_SuppressingExc.isa, v3);
}

- (void)setSmileDetectionEnabled:(BOOL)a3
{
  id v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v3);
  }
  NSLog(&cfstr_SuppressingExc.isa, v3);
}

- (BOOL)eyeDetectionEnabled
{
  return 0;
}

- (BOOL)eyeClosedDetectionEnabled
{
  return 0;
}

- (BOOL)smileDetectionEnabled
{
  return 0;
}

- (id)availableBoxedMetadataFormatDescriptions
{
  return 0;
}

- (BOOL)isAttentionDetectionSupported
{
  return 0;
}

- (id)AVVideoSettingsForSessionPreset:(id)a3
{
  return 0;
}

- ($2825F4736939C4A6D3AD43837233062D)maxH264PhotoDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)0;
}

- ($2825F4736939C4A6D3AD43837233062D)maxH264VideoDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)0;
}

- (int)minMacroblocksForHighProfileUpTo30fps
{
  return 0;
}

- (int)minMacroblocksForHighProfileAbove30fps
{
  return 0;
}

- (BOOL)usesQuantizationScalingMatrix_H264_Steep_16_48
{
  return 0;
}

- (int)hevcTurboModeVersion
{
  return 0;
}

- (BOOL)hevcAllowBFramesForHighCTUCount
{
  return 0;
}

- (BOOL)isHEVCRelaxedAverageBitRateTargetSupported
{
  return 0;
}

- (BOOL)isHEVCSupported
{
  return 0;
}

- (BOOL)isHEVCPreferred
{
  return 0;
}

- (BOOL)isProResSupported
{
  return 0;
}

- (BOOL)isHEIFSupported
{
  return 0;
}

- (BOOL)isMotionCompensatedTemporalFilteringSupported
{
  return 0;
}

- (id)bravoCameraSelectionBehavior
{
  return @"AVCaptureBravoCameraSelectionBehaviorUnsupported";
}

- (void)setPrimaryConstituentDeviceSwitchingBehavior:(AVCapturePrimaryConstituentDeviceSwitchingBehavior)switchingBehavior restrictedSwitchingBehaviorConditions:(AVCapturePrimaryConstituentDeviceRestrictedSwitchingBehaviorConditions)restrictedSwitchingBehaviorConditions
{
  if (restrictedSwitchingBehaviorConditions | switchingBehavior)
  {
    uint64_t v4 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v4);
    }
    NSLog(&cfstr_SuppressingExc.isa, v4);
  }
}

- (AVCapturePrimaryConstituentDeviceSwitchingBehavior)primaryConstituentDeviceSwitchingBehavior
{
  return 0;
}

- (AVCapturePrimaryConstituentDeviceRestrictedSwitchingBehaviorConditions)primaryConstituentDeviceRestrictedSwitchingBehaviorConditions
{
  return 0;
}

- (AVCapturePrimaryConstituentDeviceSwitchingBehavior)activePrimaryConstituentDeviceSwitchingBehavior
{
  return 0;
}

- (AVCapturePrimaryConstituentDeviceRestrictedSwitchingBehaviorConditions)activePrimaryConstituentDeviceRestrictedSwitchingBehaviorConditions
{
  return 0;
}

- (AVCaptureDevice)activePrimaryConstituentDevice
{
  return 0;
}

- (NSArray)supportedFallbackPrimaryConstituentDevices
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (NSArray)fallbackPrimaryConstituentDevices
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (void)setFallbackPrimaryConstituentDevices:(NSArray *)fallbackPrimaryConstituentDevices
{
  if ([(NSArray *)fallbackPrimaryConstituentDevices count])
  {
    id v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v3);
    }
    NSLog(&cfstr_SuppressingExc.isa, v3);
  }
}

- (id)preferredPrimaryConstituentDevice
{
  return 0;
}

- (BOOL)isFocusedAtMacro
{
  return 0;
}

- (NSInteger)minimumFocusDistance
{
  return -1;
}

- (BOOL)_isDepthDataDeliveryEnabled
{
  return 0;
}

- (int)faceDrivenAEAFMode
{
  return 0;
}

- (BOOL)isHidden
{
  return 0;
}

- (BOOL)isTimeOfFlightProjectorModeSupported:(int64_t)a3
{
  return a3 == 0;
}

- (int64_t)timeOfFlightProjectorMode
{
  return 0;
}

- (void)setTimeOfFlightProjectorMode:(int64_t)a3
{
  if (![(AVCaptureDevice *)self isTimeOfFlightProjectorModeSupported:a3])
  {
    id v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v3);
    }
    NSLog(&cfstr_SuppressingExc.isa, v3);
  }
}

- (int64_t)timeOfFlightBankCount
{
  return 0;
}

- (BOOL)isSpatialOverCaptureEnabled
{
  return 0;
}

- (void)setSpatialOverCaptureEnabled:(BOOL)a3
{
  id v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v3);
  }
  NSLog(&cfstr_SuppressingExc.isa, v3);
}

- (BOOL)isNonDestructiveCropEnabled
{
  return 0;
}

- (void)setNonDestructiveCropEnabled:(BOOL)a3
{
  id v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v3);
  }
  NSLog(&cfstr_SuppressingExc.isa, v3);
}

- (int64_t)nonDestructiveCropAspectRatio
{
  return 0;
}

- (void)setNonDestructiveCropAspectRatio:(int64_t)a3
{
  id v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v3);
  }
  NSLog(&cfstr_SuppressingExc.isa, v3);
}

- (BOOL)isCinematicVideoFocusAtPointSupported
{
  return 0;
}

- (void)setCinematicVideoFocusAtPoint:(CGPoint)a3 objectID:(int64_t)a4 isHardFocus:(BOOL)a5 isFixedPlaneFocus:(BOOL)a6
{
  if (![(AVCaptureDevice *)self isCinematicVideoFocusAtPointSupported])
  {
    id v6 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v6);
    }
    NSLog(&cfstr_SuppressingExc.isa, v6);
  }
}

+ (id)continuityCaptureCameraCapabilities
{
  v13[5] = *MEMORY[0x1E4F143B8];
  if (continuityCaptureCameraCapabilities_onceToken != -1) {
    dispatch_once(&continuityCaptureCameraCapabilities_onceToken, &__block_literal_global_514);
  }
  uint64_t v7 = 0;
  int v8 = &v7;
  uint64_t v9 = 0x3052000000;
  uint64_t v10 = __Block_byref_object_copy__3;
  id v11 = __Block_byref_object_dispose__3;
  AVCaptureMicrophoneMode v2 = (void *)getCMContinuityCaptureCapabilitiesClass_softClass;
  uint64_t v12 = getCMContinuityCaptureCapabilitiesClass_softClass;
  if (!getCMContinuityCaptureCapabilitiesClass_softClass)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    void v13[2] = __getCMContinuityCaptureCapabilitiesClass_block_invoke;
    void v13[3] = &unk_1E5A72EF8;
    v13[4] = &v7;
    __getCMContinuityCaptureCapabilitiesClass_block_invoke((uint64_t)v13);
    AVCaptureMicrophoneMode v2 = (void *)v8[5];
  }
  _Block_object_dispose(&v7, 8);
  id v3 = objc_msgSend((id)objc_msgSend(v2, "capabilitiesForCurrentDevice"), "dictionaryRepresentation");
  if (AVCaptureClientIsRapport()) {
    [NSClassFromString(&cfstr_Avcapturefigvi.isa) _releaseStaticResources];
  }
  if (dword_1EB4C92C0)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    if (dword_1EB4C92C0)
    {
      uint64_t v5 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  return v3;
}

uint64_t __54__AVCaptureDevice_continuityCaptureCameraCapabilities__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1CB18]);
  continuityCaptureCameraCapabilities_cameraCaptureUserDefaults = [v0 initWithSuiteName:*MEMORY[0x1E4F50E98]];
  id v1 = objc_alloc(MEMORY[0x1E4F1CB18]);
  continuityCaptureCameraCapabilities_cameraCaptureVolatileUserDefaults = [v1 initWithSuiteName:*MEMORY[0x1E4F50EA8]];
  AVCaptureMicrophoneMode v2 = [AVCaptureBlockKVOObserver alloc];
  continuityCaptureCameraCapabilities_continuityCaptureDisabledObserver = [(AVCaptureBlockKVOObserver *)v2 initWithObjectToObserve:continuityCaptureCameraCapabilities_cameraCaptureUserDefaults keyPath:*MEMORY[0x1E4F50EA0] options:3 handler:&__block_literal_global_519];
  id v3 = [AVCaptureBlockKVOObserver alloc];
  uint64_t result = [(AVCaptureBlockKVOObserver *)v3 initWithObjectToObserve:continuityCaptureCameraCapabilities_cameraCaptureVolatileUserDefaults keyPath:*MEMORY[0x1E4F50EB0] options:3 handler:&__block_literal_global_522];
  continuityCaptureCameraCapabilities_continuityCaptureInUseObserver = result;
  return result;
}

uint64_t __54__AVCaptureDevice_continuityCaptureCameraCapabilities__block_invoke_2()
{
  id v0 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];

  return [v0 postNotificationName:@"AVCaptureDeviceContinuityCaptureCameraCapabilitiesChangedNotification" object:0];
}

uint64_t __54__AVCaptureDevice_continuityCaptureCameraCapabilities__block_invoke_3()
{
  id v0 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];

  return [v0 postNotificationName:@"AVCaptureDeviceContinuityCaptureCameraCapabilitiesChangedNotification" object:0];
}

+ (id)continuityCaptureLastUsedDate
{
  AVCaptureMicrophoneMode v2 = (void *)CFPreferencesCopyValue((CFStringRef)*MEMORY[0x1E4F50EB8], (CFStringRef)*MEMORY[0x1E4F50EA8], (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3E0]);
  if (dword_1EB4C92C0)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v2;
}

- (BOOL)isContinuityCamera
{
  return 0;
}

- (id)continuityDeviceUniqueID
{
  return 0;
}

- (AVCaptureDevice)companionDeskViewCamera
{
  return 0;
}

- (void)setDeskViewCameraMode:(int64_t)a3
{
  id v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v3);
  }
  NSLog(&cfstr_SuppressingExc.isa, v3);
}

- (int64_t)deskViewCameraMode
{
  return 0;
}

- (BOOL)isDeskViewCameraModeSupported:(int64_t)a3
{
  return 0;
}

- (id)hardwareUniformType
{
  return 0;
}

- (BOOL)isManualFramingSupported
{
  return 0;
}

- (BOOL)isManualFramingEnabled
{
  return 0;
}

- (void)setManualFramingEnabled:(BOOL)a3
{
  if (![(AVCaptureDevice *)self isManualFramingSupported])
  {
    id v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v3);
    }
    NSLog(&cfstr_SuppressingExc.isa, v3);
  }
}

- (void)setCenterStageFieldOfViewRestrictedToWide:(BOOL)a3
{
  id v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v3);
  }
  NSLog(&cfstr_SuppressingExc.isa, v3);
}

- (BOOL)isCenterStageFieldOfViewRestrictedToWide
{
  return 0;
}

- (void)setManualFramingPanningAngleX:(float)a3
{
  id v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v3);
  }
  NSLog(&cfstr_SuppressingExc.isa, v3);
}

- (float)manualFramingPanningAngleX
{
  return 0.0;
}

- (void)setManualFramingPanningAngleY:(float)a3
{
  id v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v3);
  }
  NSLog(&cfstr_SuppressingExc.isa, v3);
}

- (float)manualFramingPanningAngleY
{
  return 0.0;
}

- (void)startPanningAtPoint:(CGPoint)a3
{
  id v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v3);
  }
  NSLog(&cfstr_SuppressingExc.isa, v3);
}

- (void)panWithTranslation:(CGPoint)a3
{
  id v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v3);
  }
  NSLog(&cfstr_SuppressingExc.isa, v3);
}

- (void)performOneShotFraming
{
  AVCaptureMicrophoneMode v2 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v2);
  }
  NSLog(&cfstr_SuppressingExc.isa, v2);
}

- (void)resetFraming
{
  AVCaptureMicrophoneMode v2 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v2);
  }
  NSLog(&cfstr_SuppressingExc.isa, v2);
}

- (double)manualFramingMinZoomFactor
{
  return 1.0;
}

- (double)manualFramingMaxZoomFactor
{
  return 1.0;
}

- (double)manualFramingDefaultZoomFactor
{
  return 1.0;
}

- (BOOL)isGazeSelectionEnabled
{
  return 0;
}

- (void)setGazeSelectionEnabled:(BOOL)a3
{
  id v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v3);
  }
  NSLog(&cfstr_SuppressingExc.isa, v3);
}

- (CGFloat)displayVideoZoomFactorMultiplier
{
  return 1.0;
}

- (id)serializedProcessingSettings
{
  return 0;
}

- (NSString)manufacturer
{
  return self->_manufacturer;
}

- (int32_t)transportType
{
  return self->_transportType;
}

- (BOOL)isInUseByAnotherApplication
{
  return self->_inUseByAnotherApplication;
}

- (NSArray)linkedDevices
{
  return self->_linkedDevices;
}

- (NSArray)inputSources
{
  return self->_inputSources;
}

+ (id)proprietaryDefaultsDomainForAuditToken:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0[4];
  v5[0] = *(_OWORD *)a3->var0;
  v5[1] = v3;
  return +[AVCaptureProprietaryDefaultsSingleton proprietaryDefaultsDomainForAuditToken:v5];
}

+ (void)ensureServerConnection
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (dword_1EB4C92C0)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  +[AVCaptureProprietaryDefaultsSingleton retryPriorFailedKeyObservationRegistrations];
  if (dword_1EB4C92C0)
  {
    long long v3 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

- (BOOL)isDockedTrackingSupported
{
  return 0;
}

- (void)setDockedTrackingEnabled:(BOOL)a3
{
  long long v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v3);
  }
  NSLog(&cfstr_SuppressingExc.isa, v3);
}

- (BOOL)isDockedTrackingEnabled
{
  return 0;
}

- (BOOL)isSceneClassificationActive
{
  return 0;
}

- (float)documentSceneConfidence
{
  return -1.0;
}

- (unint64_t)stereoCaptureStatus
{
  return 1;
}

- (unint64_t)stereoVideoCaptureStatus
{
  return 1;
}

- (id)spatialCaptureDiscomfortReasons
{
  return (id)[MEMORY[0x1E4F1CAD0] set];
}

void __54__AVCaptureDevice_setUpBackgroundReplacementStateOnce__block_invoke_4_cold_1()
{
}

@end