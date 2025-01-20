@interface CAMCaptureCapabilities
+ (BOOL)isCameraAppInstalled;
+ (BOOL)isMessagesAppInstalled;
+ (BOOL)isPALVideoConfiguration:(int64_t)a3;
+ (CAMCaptureCapabilities)capabilities;
- ($F24F406B2B787EFB06265DBA3D28CBD5)tripleCameraSwitchOverZoomFactorsForDevicePosition:(int64_t)a3;
- (BOOL)_HDR10BitVideoSupports120FPS;
- (BOOL)_allowSpatialOverCaptureInPortraitMode;
- (BOOL)_allowZoomWithForcedBackCamera;
- (BOOL)_backDualCameraSupportedForCinematic;
- (BOOL)_backPhotoModeNightModeDepthSupported;
- (BOOL)_backStageLightPortaitEffectsSupported;
- (BOOL)_backSuperWideTeleNightModeSupported;
- (BOOL)_disablePortraitBravoDevices;
- (BOOL)_disablePortraitFrontFacingZoomedCaptureDeviceFormat;
- (BOOL)_disableSuperBravoDevice;
- (BOOL)_forceDisableExposureClippingIndicator;
- (BOOL)_forceEnableExposureClippingIndicator;
- (BOOL)_frontPhotoModeDepthSuggestionSupported;
- (BOOL)_frontPortraitAspectRatioSupported;
- (BOOL)_frontPortraitDeferredProcessingSupported;
- (BOOL)_frontPortraitSemanticStylesSupported;
- (BOOL)_frontStageLightPortaitEffectsSupported;
- (BOOL)_is1080p120SlomoSupportedForDevice:(int64_t)a3;
- (BOOL)_is1080pHFRVideoStabilizationSupported;
- (BOOL)_isActionModeAggregateDevice4k60Supported;
- (BOOL)_isAspectRatioCropThreeTwoSupported;
- (BOOL)_isExternalStoreSupportedForAllVideoFormats;
- (BOOL)_isPreviewAspectRatioToggleSupportedForPhotoModes;
- (BOOL)_isProResCinematicVideoSupported;
- (BOOL)_isQuadraPortraitSupported;
- (BOOL)_isSpatialOverCaptureSupportedForDevice:(int64_t)a3;
- (BOOL)_isSpatialPhotoModeSupportedForDevice:(int64_t)a3;
- (BOOL)_isSpatialPhotoSupportedForDevicePosition:(int64_t)a3;
- (BOOL)_isSpatialVideoModeSupportedForDevice:(int64_t)a3;
- (BOOL)_isSpatialVideoSupportedForDevicePosition:(int64_t)a3;
- (BOOL)_isTripleCamera1080p60Supported;
- (BOOL)_isVariableFramerateVideoSupportedForResolvedVideoConfiguration:(int64_t)a3;
- (BOOL)_isVariableFramerateVideoSupportedForVideoEncodingBehavior:(int64_t)a3;
- (BOOL)_isiPad;
- (BOOL)_needsForcedSingleCameraEmulationForVideoStabilizationStrength:(int64_t)a3 videoConfiguration:(int64_t)a4 mode:(int64_t)a5;
- (BOOL)_overlapping48MPCapturesSupported;
- (BOOL)_photoModeLightingControlSupported;
- (BOOL)_preferWideDualPortrait;
- (BOOL)_processZoomWithoutUpscaleBack;
- (BOOL)_processZoomWithoutUpscaleFront;
- (BOOL)_rearPhotoModeDepthSuggestionSupported;
- (BOOL)_rearPortraitAspectRatioSupported;
- (BOOL)_rearPortraitDeferredProcessingSupported;
- (BOOL)_rearPortraitSemanticStylesSupported;
- (BOOL)_shouldAllowCameraToggleForMode:(int64_t)a3 devicePosition:(int64_t)a4 videoConfiguration:(int64_t)a5 videoStabilizationStrength:(int64_t)a6;
- (BOOL)_smartStylesAdditionalSystemStyleSupport;
- (BOOL)_wideDualPortraitLowLightSupported;
- (BOOL)_zoomPIPSupportedForSlomo;
- (BOOL)allowControlDrawer;
- (BOOL)allowHalfPressSimulation;
- (BOOL)allowHaptics;
- (BOOL)allowHapticsOnConfigurationTaps;
- (BOOL)allowPortraitDescriptionOverlay;
- (BOOL)allowSystemSmartStylesInPicker;
- (BOOL)arePortraitEffectsSupported;
- (BOOL)backEnhancedHEICResolutionSupported;
- (BOOL)bypassWelcomeScreens;
- (BOOL)captureOnTouchDown;
- (BOOL)cinematic4KSupported;
- (BOOL)contentAwareDistortionCorrectionSupported;
- (BOOL)continuousZoomSupportedForCinematicMode;
- (BOOL)continuousZoomSupportedForPortraitMode;
- (BOOL)deviceSupportsCTM;
- (BOOL)disableAudio;
- (BOOL)enableSemanticDevelopmentFilterDebugging;
- (BOOL)enhancedHEICResolutionSupported;
- (BOOL)enhancedRAWResolutionSupported;
- (BOOL)externalStorageSupported;
- (BOOL)fallbackCameraEnabled;
- (BOOL)fallbackCameraSupported;
- (BOOL)featureDevelopmentAllowAllHEICOptionsInPhotoPicker;
- (BOOL)featureDevelopmentDefaultWideHighStabilization;
- (BOOL)featureDevelopmentEmulateSuperWide;
- (BOOL)featureDevelopmentForceDepthDataCaptureInPhotoMode;
- (BOOL)featureDevelopmentForceDepthEffectInPhotoMode;
- (BOOL)featureDevelopmentForceSingleCamera;
- (BOOL)featureDevelopmentHidePreviewOverlayBars;
- (BOOL)featureDevelopmentIgnoreDepthSuggestionInPhotoMode;
- (BOOL)featureDevelopmentShowLockIndicator;
- (BOOL)focalLengthPickerSupported;
- (BOOL)forceAllowAllInterfaceOrientations;
- (BOOL)frontEnhancedHEICResolutionSupported;
- (BOOL)hasFilteringEntitlement;
- (BOOL)hasSystemTelephonyOfAnyKind;
- (BOOL)imageAnalysisShowsInactiveTextRegions;
- (BOOL)imagePickerUsesModernLayout;
- (BOOL)interactiveVideoFormatControlAlwaysEnabled;
- (BOOL)interactiveVideoFormatControlSupported;
- (BOOL)is1080p120VideoSupportedForDevice:(int64_t)a3;
- (BOOL)is1080p240SupportedForDevice:(int64_t)a3;
- (BOOL)is1080p60VideoSupportedForDevice:(int64_t)a3;
- (BOOL)is4K120VideoSupportedForDevice:(int64_t)a3;
- (BOOL)is4k24VideoSupportedForDevice:(int64_t)a3;
- (BOOL)is4k30VideoSupportedForDevice:(int64_t)a3;
- (BOOL)is4k60VideoSupportedForDevice:(int64_t)a3;
- (BOOL)is720p240SupportedForDevice:(int64_t)a3;
- (BOOL)isActionButtonSupported;
- (BOOL)isAspectRatioCropSupportedForMode:(int64_t)a3 devicePosition:(int64_t)a4;
- (BOOL)isAutoFPSVideoSupportedForMode:(int64_t)a3 videoConfiguration:(int64_t)a4 videoEncodingBehavior:(int64_t)a5 outputToExternalStorage:(BOOL)a6 spatialVideoEnabled:(BOOL)a7 prefersHDR10BitVideo:(BOOL)a8;
- (BOOL)isAutoLowLightVideoSupported;
- (BOOL)isAutoLowLightVideoSupportedForMode:(int64_t)a3 videoConfiguration:(int64_t)a4 videoEncodingBehavior:(int64_t)a5;
- (BOOL)isAutomaticHDRSupportedForDevicePosition:(int64_t)a3;
- (BOOL)isBack1080p120Supported;
- (BOOL)isBack1080p240Supported;
- (BOOL)isBack4k120VideoSupported;
- (BOOL)isBack4k24VideoSupported;
- (BOOL)isBack4k30VideoSupported;
- (BOOL)isBack4k60VideoSupported;
- (BOOL)isBack720p240Supported;
- (BOOL)isBackAutomaticHDRSupported;
- (BOOL)isBackBurstSupported;
- (BOOL)isBackCameraSupported;
- (BOOL)isBackCinematicModeSupported;
- (BOOL)isBackDualSupported;
- (BOOL)isBackFlashSupported;
- (BOOL)isBackHDROnSupported;
- (BOOL)isBackHDRSupported;
- (BOOL)isBackLivePhotoSupported;
- (BOOL)isBackLiveStageLightSupported;
- (BOOL)isBackLowLightSupported;
- (BOOL)isBackPanoramaSupported;
- (BOOL)isBackPearlSupported;
- (BOOL)isBackPortraitModeSupported;
- (BOOL)isBackQuadraSuperWideSupported;
- (BOOL)isBackQuadraWideSupported;
- (BOOL)isBackSingleCameraPortraitModeSupported;
- (BOOL)isBackSlomoSupported;
- (BOOL)isBackSmartHDRSupported;
- (BOOL)isBackSpatialOverCaptureSupported;
- (BOOL)isBackSuperWideSupported;
- (BOOL)isBackTelephotoSupported;
- (BOOL)isBackTimeOfFlightSupported;
- (BOOL)isBackTimelapseSupported;
- (BOOL)isBackTorchPatternSupported;
- (BOOL)isBackTorchSupported;
- (BOOL)isBackTripleCameraSupported;
- (BOOL)isBackWideDualSupported;
- (BOOL)isBurstSupportedForMode:(int64_t)a3 device:(int64_t)a4;
- (BOOL)isCTMSupportSupressed;
- (BOOL)isCTMSupported;
- (BOOL)isCTMVideoCaptureSupportedForMode:(int64_t)a3;
- (BOOL)isCacheDeleteSupported;
- (BOOL)isCameraButtonSupported;
- (BOOL)isCameraSupportedForDevice:(int64_t)a3;
- (BOOL)isCameraSupportedForDevicePosition:(int64_t)a3;
- (BOOL)isCinematicAudioSupported;
- (BOOL)isCinematicAudioSupportedForMode:(int64_t)a3;
- (BOOL)isCinematicModeSupported;
- (BOOL)isCinematicModeSupportedForDevice:(int64_t)a3;
- (BOOL)isCinematicModeSupportedForDevicePosition:(int64_t)a3;
- (BOOL)isContentAwareDistortionCorrectionSupportedForMode:(int64_t)a3;
- (BOOL)isCustomLensSupportedForMode:(int64_t)a3 device:(int64_t)a4 isTrueVideo:(BOOL)a5;
- (BOOL)isCustomLensSupportedForPhotoResolution:(int64_t)a3;
- (BOOL)isDeferredPortraitRenderingSupported;
- (BOOL)isDeferredProcessingSupported;
- (BOOL)isDeferredProcessingSupportedForMode:(int64_t)a3 devicePosition:(int64_t)a4;
- (BOOL)isDepthEffectApertureSupported;
- (BOOL)isDepthEffectApertureSupportedForMode:(int64_t)a3 devicePosition:(int64_t)a4;
- (BOOL)isDepthEffectApertureSupportedForPhotoFormat:(id)a3;
- (BOOL)isDepthSuggestionSupportedForMode:(int64_t)a3 devicePosition:(int64_t)a4 photoFormat:(id)a5;
- (BOOL)isDocumentScanningSupported;
- (BOOL)isDualDeviceDisparitySupportedForMode:(int64_t)a3 devicePosition:(int64_t)a4;
- (BOOL)isDualSupported;
- (BOOL)isDualSupportedForDevicePosition:(int64_t)a3;
- (BOOL)isDualSupportedForMode:(int64_t)a3 devicePosition:(int64_t)a4 videoConfiguration:(int64_t)a5 videoStabilizationStrength:(int64_t)a6;
- (BOOL)isExposureClippingIndicatorSupportedForMode:(int64_t)a3 videoConfiguration:(int64_t)a4;
- (BOOL)isExposureSliderSupported;
- (BOOL)isExposureSliderSupportedForMode:(int64_t)a3;
- (BOOL)isExternalStorageOutputSupportedForMode:(int64_t)a3 videoEncodingBehavior:(int64_t)a4;
- (BOOL)isFlashMitigationSupported;
- (BOOL)isFlashOrTorchSupportedForMode:(int64_t)a3 devicePosition:(int64_t)a4;
- (BOOL)isFlashSupportedForDevicePosition:(int64_t)a3;
- (BOOL)isFlashSupportedForMode:(int64_t)a3 devicePosition:(int64_t)a4;
- (BOOL)isForceTouchSupported;
- (BOOL)isFront1080p120Supported;
- (BOOL)isFront1080p240Supported;
- (BOOL)isFront4k24VideoSupported;
- (BOOL)isFront4k30VideoSupported;
- (BOOL)isFront4k60VideoSupported;
- (BOOL)isFront720p240Supported;
- (BOOL)isFrontAutomaticHDRSupported;
- (BOOL)isFrontBurstSupported;
- (BOOL)isFrontCameraOnRightEdge;
- (BOOL)isFrontCameraSupported;
- (BOOL)isFrontCinematicModeSupported;
- (BOOL)isFrontDualSupported;
- (BOOL)isFrontFlashSupported;
- (BOOL)isFrontHDROnSupported;
- (BOOL)isFrontHDRSupported;
- (BOOL)isFrontLivePhotoSupported;
- (BOOL)isFrontLiveStageLightSupported;
- (BOOL)isFrontLowLightSupported;
- (BOOL)isFrontPanoramaSupported;
- (BOOL)isFrontPearlSupported;
- (BOOL)isFrontPortraitModeSupported;
- (BOOL)isFrontQuadraWideSupported;
- (BOOL)isFrontSingleCameraPortraitModeSupported;
- (BOOL)isFrontSlomoSupported;
- (BOOL)isFrontSmartHDRSupported;
- (BOOL)isFrontSpatialOverCaptureSupported;
- (BOOL)isFrontSuperWideSupported;
- (BOOL)isFrontTelephotoSupported;
- (BOOL)isFrontTimeOfFlightSupported;
- (BOOL)isFrontTimelapseSupported;
- (BOOL)isFrontTorchPatternSupported;
- (BOOL)isFrontTorchSupported;
- (BOOL)isFrontTripleCameraSupported;
- (BOOL)isFrontWideDualSupported;
- (BOOL)isHDR10BitSlomoSupportedForDevice:(int64_t)a3;
- (BOOL)isHDR10BitVideoSupported;
- (BOOL)isHDR10BitVideoSupportedForMode:(int64_t)a3;
- (BOOL)isHDR10BitVideoSupportedForVideoConfiguration:(int64_t)a3 videoEncodingBehavior:(int64_t)a4;
- (BOOL)isHDR10BitVideoSupports60FPS;
- (BOOL)isHDREV0CaptureSupported;
- (BOOL)isHDROnSupportedForDevicePosition:(int64_t)a3;
- (BOOL)isHDRSettingAllowed;
- (BOOL)isHDRSupportedForDevicePosition:(int64_t)a3;
- (BOOL)isHDRSupportedForMode:(int64_t)a3 devicePosition:(int64_t)a4;
- (BOOL)isHEVCEncodingSupported;
- (BOOL)isHalfPressOverlayInProcess;
- (BOOL)isHalfPressSupported;
- (BOOL)isImageAnalysisButtonAlwaysVisible;
- (BOOL)isImageAnalysisSupported;
- (BOOL)isImageAnalysisSupportedForMode:(int64_t)a3 devicePosition:(int64_t)a4;
- (BOOL)isInternalInstall;
- (BOOL)isLightingControlSupportedForMode:(int64_t)a3;
- (BOOL)isLinearDNGSupported;
- (BOOL)isLinearDNGSupportedForMode:(int64_t)a3;
- (BOOL)isLiveFilteringSupported;
- (BOOL)isLivePhotoAutoModeSupported;
- (BOOL)isLivePhotoSupported;
- (BOOL)isLivePhotoSupportedForDevicePosition:(int64_t)a3;
- (BOOL)isLivePhotoSupportedForMode:(int64_t)a3 devicePosition:(int64_t)a4;
- (BOOL)isLivePreviewSupportedForLightingType:(int64_t)a3 devicePosition:(int64_t)a4;
- (BOOL)isLockButtonAppropriateForShutter;
- (BOOL)isLowEndHardware;
- (BOOL)isLowLightSupported;
- (BOOL)isLowLightSupportedForMode:(int64_t)a3 device:(int64_t)a4;
- (BOOL)isLowLightSupportedForMode:(int64_t)a3 device:(int64_t)a4 zoomFactor:(double)a5;
- (BOOL)isMirroredFrontCapturesSupported;
- (BOOL)isMirroredFrontVideosSupported;
- (BOOL)isMixAudioWithOthersSupported;
- (BOOL)isModernHDRSupported;
- (BOOL)isNaturalLightingAppliedToOriginal;
- (BOOL)isNeuralEngineSupported;
- (BOOL)isNightModeWithDepthSupportedForMode:(int64_t)a3 device:(int64_t)a4;
- (BOOL)isPALVideoSupported;
- (BOOL)isPanoramaSupportedForDevice:(int64_t)a3;
- (BOOL)isPauseVideoSupportedForMode:(int64_t)a3;
- (BOOL)isPearlSupportedForDevicePosition:(int64_t)a3;
- (BOOL)isPearlSupportedForMode:(int64_t)a3 devicePosition:(int64_t)a4;
- (BOOL)isPhotoFormatSupported:(id)a3 forMode:(int64_t)a4 device:(int64_t)a5;
- (BOOL)isPhotoModeDepthSuggestionSupportedForDevicePosition:(int64_t)a3;
- (BOOL)isPhotoResolutionSupported:(int64_t)a3 forLightingType:(int64_t)a4;
- (BOOL)isPhotoResolutionSupported:(int64_t)a3 forMode:(int64_t)a4 device:(int64_t)a5 photoEncoding:(int64_t)a6;
- (BOOL)isPhotoResolutionSupported:(int64_t)a3 forPhotoEncoding:(int64_t)a4;
- (BOOL)isPipelinedStillImageProcessingSupported;
- (BOOL)isPortraitEffectIntensitySupported;
- (BOOL)isPortraitEffectIntensitySupportedForLightingType:(int64_t)a3;
- (BOOL)isPortraitEffectIntensitySupportedForMode:(int64_t)a3;
- (BOOL)isPortraitModeSupported;
- (BOOL)isPortraitModeSupportedForDevice:(int64_t)a3;
- (BOOL)isPortraitModeSupportedForDevicePosition:(int64_t)a3;
- (BOOL)isPortraitZoomSupportedForDevicePosition:(int64_t)a3;
- (BOOL)isPreserveCreativeControlsSupported;
- (BOOL)isPreviewAspectRatioToggleSupportedForMode:(int64_t)a3;
- (BOOL)isPreviewDuringHDRSupported;
- (BOOL)isProRawJpegXLSupported;
- (BOOL)isProResLogColorSpaceSupported;
- (BOOL)isProResVideoSupported;
- (BOOL)isProResVideoSupportedForMode:(int64_t)a3;
- (BOOL)isProResVideoSupportedForMode:(int64_t)a3 videoConfiguration:(int64_t)a4 outputToExternalStorage:(BOOL)a5;
- (BOOL)isQuadraWideBinningReconfigurationSupportedForMode:(int64_t)a3 devicePosition:(int64_t)a4 videoConfiguration:(int64_t)a5;
- (BOOL)isQuadraWideSupported;
- (BOOL)isRegionalShutterSoundEnabled;
- (BOOL)isResponsiveShutterSupportedForMode:(int64_t)a3;
- (BOOL)isSemanticDevelopmentSupportedForMode:(int64_t)a3;
- (BOOL)isSingleCameraPortraitModeSupportedForDevicePosition:(int64_t)a3;
- (BOOL)isSlomoSupportedForDevice:(int64_t)a3;
- (BOOL)isSmartHDRSupported;
- (BOOL)isSmartHDRSupportedForMode:(int64_t)a3 devicePosition:(int64_t)a4;
- (BOOL)isSpatialModeSupported;
- (BOOL)isSpatialModeTrueVideoSupported;
- (BOOL)isSpatialOverCaptureSupported;
- (BOOL)isSpatialVideoCaptureSupported;
- (BOOL)isSpatialVideoInVideoModeSupportedForMode:(int64_t)a3 devicePosition:(int64_t)a4;
- (BOOL)isSplitScreenSupported;
- (BOOL)isSquareModeSupported;
- (BOOL)isStereoAudioRecordingSupported;
- (BOOL)isStereoAudioRecordingSupportedForMode:(int64_t)a3;
- (BOOL)isStillDuringVideoSupported;
- (BOOL)isStillDuringVideoSupportedForMode:(int64_t)a3;
- (BOOL)isStillDuringVideoSupportedForVideoEncodingBehavior:(int64_t)a3;
- (BOOL)isSuperWideAutoMacroSupported;
- (BOOL)isSuperWideAutoMacroSupportedForMode:(int64_t)a3 device:(int64_t)a4 videoConfiguration:(int64_t)a5 videoStabilizationStrength:(int64_t)a6 spatialVideoEnabled:(BOOL)a7;
- (BOOL)isSuperWideSupported;
- (BOOL)isSuperWideSupportedForDevicePosition:(int64_t)a3;
- (BOOL)isSuperWideSupportedForMode:(int64_t)a3 devicePosition:(int64_t)a4 videoConfiguration:(int64_t)a5;
- (BOOL)isSupportedMode:(int64_t)a3 withDevice:(int64_t)a4;
- (BOOL)isSupportedVideoConfiguration:(int64_t)a3 forMode:(int64_t)a4 device:(int64_t)a5;
- (BOOL)isSupportedVideoConfiguration:(int64_t)a3 forMode:(int64_t)a4 device:(int64_t)a5 spatialVideoEnabled:(BOOL)a6 trueVideoEnabled:(BOOL)a7;
- (BOOL)isSupportedVideoConfiguration:(int64_t)a3 forMode:(int64_t)a4 videoEncodingBehavior:(int64_t)a5 outputToExternalStorage:(BOOL)a6;
- (BOOL)isTapAndBiasSupportedForMode:(int64_t)a3;
- (BOOL)isTapToExposeSupportedForMode:(int64_t)a3;
- (BOOL)isTelephotoSupported;
- (BOOL)isTelephotoSupportedForDevicePosition:(int64_t)a3;
- (BOOL)isTelephotoSupportedForMode:(int64_t)a3 devicePosition:(int64_t)a4 videoConfiguration:(int64_t)a5;
- (BOOL)isTimeOfFlightSupported;
- (BOOL)isTimeOfFlightSupportedForDevicePosition:(int64_t)a3;
- (BOOL)isTimelapseSupportedForDevice:(int64_t)a3;
- (BOOL)isTimerSupportedForMode:(int64_t)a3;
- (BOOL)isTorchPatternSupportedForDevicePosition:(int64_t)a3;
- (BOOL)isTorchSupportedForDevicePosition:(int64_t)a3;
- (BOOL)isTorchSupportedForMode:(int64_t)a3 devicePosition:(int64_t)a4;
- (BOOL)isTripleCameraSupported;
- (BOOL)isTripleCameraSupportedForDevicePosition:(int64_t)a3;
- (BOOL)isTripleCameraSupportedForMode:(int64_t)a3 devicePosition:(int64_t)a4 videoConfiguration:(int64_t)a5 videoStabilizationStrength:(int64_t)a6;
- (BOOL)isTrueVideoSupported;
- (BOOL)isTrueVideoSupportedForMode:(int64_t)a3;
- (BOOL)isVariableFramerateVideoSupported;
- (BOOL)isVariableFramerateVideoSupportedForMode:(int64_t)a3 videoConfiguration:(int64_t)a4 videoEncodingBehavior:(int64_t)a5 outputToExternalStorage:(BOOL)a6 spatialVideoEnabled:(BOOL)a7 prefersHDR10BitVideo:(BOOL)a8;
- (BOOL)isVideoStabilizationControlSupported;
- (BOOL)isVideoStabilizationControlSupportedForMode:(int64_t)a3 device:(int64_t)a4 videoConfiguration:(int64_t)a5 videoEncodingBehavior:(int64_t)a6 trueVideoEnabled:(BOOL)a7 prefersHDR10BitVideo:(BOOL)a8;
- (BOOL)isVideoStabilizationStrength:(int64_t)a3 supportedForMode:(int64_t)a4 device:(int64_t)a5 videoConfiguration:(int64_t)a6 videoEncodingBehavior:(int64_t)a7 outputToExternalStorage:(BOOL)a8 spatialVideoEnabled:(BOOL)a9 trueVideoEnabled:(BOOL)a10 prefersHDR10BitVideo:(BOOL)a11;
- (BOOL)isVideoStabilizationStrength:(int64_t)a3 supportedForMode:(int64_t)a4 devicePosition:(int64_t)a5 spatialVideoEnabled:(BOOL)a6 trueVideoEnabled:(BOOL)a7;
- (BOOL)isVideoSupported;
- (BOOL)isWhiteBalanceLockingForVideoRecordingSupported;
- (BOOL)isWideDualSupported;
- (BOOL)isWideDualSupportedForDevicePosition:(int64_t)a3;
- (BOOL)isWideDualSupportedForMode:(int64_t)a3 devicePosition:(int64_t)a4 videoConfiguration:(int64_t)a5 videoStabilizationStrength:(int64_t)a6;
- (BOOL)isWideSupportedForDevicePosition:(int64_t)a3;
- (BOOL)isWideSupportedForMode:(int64_t)a3 devicePosition:(int64_t)a4 videoConfiguration:(int64_t)a5;
- (BOOL)isWindRemovalSupported;
- (BOOL)isZoomAllowedForMode:(int64_t)a3 device:(int64_t)a4 videoConfiguration:(int64_t)a5;
- (BOOL)isZoomAllowedForMode:(int64_t)a3 device:(int64_t)a4 videoConfiguration:(int64_t)a5 videoStabilizationStrength:(int64_t)a6;
- (BOOL)isZoomPIPSupported;
- (BOOL)isZoomPIPSupportedForMode:(int64_t)a3 devicePosition:(int64_t)a4;
- (BOOL)isZoomPlatterSupported;
- (BOOL)isZoomPlatterSupportedForMode:(int64_t)a3 devicePosition:(int64_t)a4 videoConfiguration:(int64_t)a5;
- (BOOL)librarySelectionMockAutomationModeEnabled;
- (BOOL)librarySelectionMockLocationShiftingEnabled;
- (BOOL)librarySelectionSupported;
- (BOOL)macroControlEnabledByDefault;
- (BOOL)mirroredFrontCapturesSupportedForMode:(int64_t)a3;
- (BOOL)multipleCaptureFeaturesSupported;
- (BOOL)overContentFlipButtonSupported;
- (BOOL)peopleProximityDetectionSupported;
- (BOOL)peopleProximityIgnoreNearbyRequirements;
- (BOOL)peopleProximityPersistenceSupported;
- (BOOL)peopleProximityScanIndefinitely;
- (BOOL)peopleProximityUsesDeviceDiscovery;
- (BOOL)photoModeDepthSuggestionSupported;
- (BOOL)portraitModeOverlappingCapturesSupported;
- (BOOL)portraitZoomSupported;
- (BOOL)previewQualityStillImageFilteringForPhotoModeSupported;
- (BOOL)processZoomWithoutUpscaleForDevicePosition:(int64_t)a3;
- (BOOL)responsiveShutterSupported;
- (BOOL)semanticDevelopmentSupported;
- (BOOL)sfCameraFontSupported;
- (BOOL)shouldAdjustZoomOnOrientationChangeForDevicePosition:(int64_t)a3;
- (BOOL)shouldAllowCameraToggleForMode:(int64_t)a3 devicePosition:(int64_t)a4 videoConfiguration:(int64_t)a5;
- (BOOL)shouldEnableUserNotifications;
- (BOOL)shouldPerformSuperWideAutoMacroMigration;
- (BOOL)shouldPersistPreferences;
- (BOOL)shouldPreventConnectionHandover;
- (BOOL)shouldSuspendVideoHDRForHDRMode:(int64_t)a3 captureMode:(int64_t)a4;
- (BOOL)smartStylesShowExtraControls;
- (BOOL)smartStylesSupported;
- (BOOL)smartStylesSupportedForLightingType:(int64_t)a3;
- (BOOL)supportsOverlappingCapturesForResolution:(int64_t)a3;
- (BOOL)useCTMModeSelector;
- (BOOL)useCTMTransientImageWell;
- (BOOL)useFullResolutionThumbnailForRAWCaptures;
- (BOOL)usePortraitFrontFacingZoomedCaptureDeviceFormat;
- (BOOL)useReticleStroke;
- (BOOL)zoomControlSupported;
- (CAMCaptureCapabilities)initWithHostProcess:(int64_t)a3;
- (CGRect)_cameraButtonFrame;
- (CGRect)_lockButtonFrame;
- (CGRect)_volumeDownButtonFrame;
- (CGRect)_volumeUpButtonFrame;
- (CGRect)frameForPhysicalButton:(int64_t)a3;
- (CGSize)mainScreenSizePixels;
- (NSArray)availableCustomLenses;
- (NSArray)defaultCustomLensGroup;
- (NSArray)fallbackCameraModules;
- (NSArray)getSupportedCameraModules;
- (NSArray)supportedAspectRatioCropValues;
- (NSArray)supportedCustomLensGroups;
- (NSArray)supportedProResColorSpaces;
- (NSDictionary)_FFCZoomBehaviorForCaptureMode;
- (NSDictionary)_backCameraDefaultCompressedResolutionByMode;
- (NSDictionary)_backCameraDefaultRAWResolutionByMode;
- (NSDictionary)_backCameraSupportedCompressedResolutionsByMode;
- (NSDictionary)_backCameraSupportedRAWResolutionsByMode;
- (NSDictionary)_frontCameraDefaultCompressedResolutionByMode;
- (NSDictionary)_frontCameraDefaultRAWResolutionByMode;
- (NSDictionary)_frontCameraSupportedCompressedResolutionsByMode;
- (NSDictionary)_frontCameraSupportedRAWResolutionsByMode;
- (NSSet)_supportedModesForPauseResumeVideo;
- (NSString)peopleProximityDetectAdditionalEmail;
- (double)_backCaptureInterval;
- (double)_backDualCameraSwitchOverZoomFactor;
- (double)_backDualPhotoModeMaximumZoomFactor;
- (double)_backDualSlomoModeMaximumZoomFactor;
- (double)_backDualVideoModeMaximumZoomFactor;
- (double)_backPhotoModeMaximumZoomFactor;
- (double)_backPortraitModeMaximumZoomFactor;
- (double)_backTripleCameraPhotoModeMaximumZoomFactor;
- (double)_backTripleCameraVideoModeMaximumZoomFactor;
- (double)_backVideoModeMaximumZoomFactor;
- (double)_backWideDualCameraSwitchOverZoomFactor;
- (double)_backWideDualCinematicModeMaximumZoomFactor;
- (double)_doubleForKey:(id)a3 applicationID:(id)a4;
- (double)_forcedInitialZoomDisplayFactor;
- (double)_frontCaptureInterval;
- (double)_frontDualCameraSwitchOverZoomFactor;
- (double)_frontDualPhotoModeMaximumZoomFactor;
- (double)_frontDualVideoModeMaximumZoomFactor;
- (double)_frontPhotoModeMaximumZoomFactor;
- (double)_frontTripleCameraPhotoModeMaximumZoomFactor;
- (double)_frontTripleCameraVideoModeMaximumZoomFactor;
- (double)_frontVideoModeMaximumZoomFactor;
- (double)_frontWideDualCameraSwitchOverZoomFactor;
- (double)_maximumZoomFactorWithout24MPUpscale;
- (double)captureIntervalForDevice:(int64_t)a3;
- (double)defaultDepthEffectApertureForMode:(int64_t)a3 device:(int64_t)a4 zoomFactor:(double)a5;
- (double)defaultPortraitEffectIntensity;
- (double)defaultZoomFactorForGraphConfiguration:(id)a3 captureOrientation:(int64_t)a4 customLens:(int64_t)a5 outputToExternalStorage:(BOOL)a6 overrodeWithForcedZoomValue:(BOOL *)a7;
- (double)defaultZoomFactorForMode:(int64_t)a3 device:(int64_t)a4 videoConfiguration:(int64_t)a5 captureOrientation:(int64_t)a6;
- (double)defaultZoomFactorForMode:(int64_t)a3 device:(int64_t)a4 videoConfiguration:(int64_t)a5 captureOrientation:(int64_t)a6 videoStabilizationStrength:(int64_t)a7 videoEncodingBehavior:(int64_t)a8 customLens:(int64_t)a9 outputToExternalStorage:(BOOL)a10 spatialVideoEnabled:(BOOL)a11 isTrueVideo:(BOOL)a12 prefersHDR10BitVideo:(BOOL)a13 overrodeWithForcedZoomValue:(BOOL *)a14;
- (double)frontCameraInset;
- (double)librarySelectionAutoOnResetTimeout;
- (double)librarySelectionSameLocationResetTimeout;
- (double)librarySelectionTripResetTimeout;
- (double)librarySelectionUserChoiceResetTimeout;
- (double)maximumDepthEffectApertureForMode:(int64_t)a3 device:(int64_t)a4;
- (double)maximumPortraitEffectIntensity;
- (double)maximumZoomFactorForMode:(int64_t)a3 device:(int64_t)a4 videoConfiguration:(int64_t)a5;
- (double)maximumZoomFactorForMode:(int64_t)a3 device:(int64_t)a4 videoConfiguration:(int64_t)a5 videoStabilizationStrength:(int64_t)a6;
- (double)maximumZoomFactorForMode:(int64_t)a3 device:(int64_t)a4 videoConfiguration:(int64_t)a5 videoStabilizationStrength:(int64_t)a6 shouldResolveDevice:(BOOL)a7;
- (double)minimumDepthEffectApertureForMode:(int64_t)a3 device:(int64_t)a4;
- (double)minimumMachineReadableCodeNormalizedHeight;
- (double)minimumPortraitEffectIntensity;
- (double)peopleProximityInitialScanDuration;
- (double)peopleProximityScanWaitInterval;
- (double)peopleProximitySubsequentScanDuration;
- (double)proResMinimumDiskSpaceOverrideAsFractionOfSystemTotal;
- (double)quadraWideDisplayZoomFactor;
- (double)quadraWideRelativeZoomFactor;
- (double)superWideDisplayZoomFactor;
- (double)superWideToWideZoomFactorForDevicePosition:(int64_t)a3;
- (double)telephotoDisplayZoomFactor;
- (double)timelapseFirstShotDelay;
- (double)wideDisplayZoomFactor;
- (double)wideToTelephotoZoomFactorForDevicePosition:(int64_t)a3;
- (double)zoomFactorForCustomLensZoomFactor:(double)a3;
- (double)zoomPinchExponentialFactor;
- (double)zoomPinchExponentialFactorDistance;
- (double)zoomPinchHybridLerpDistance;
- (float)documentScanningMinimumConfidenceLevel;
- (id)captureStyleForCaptureWithSupport:(unint64_t)a3 styles:(id)a4 selectedStyleIndex:(unint64_t)a5 smartStyleSystemStyleIndex:(unint64_t)a6;
- (id)captureStyleForPreviewWithSupport:(unint64_t)a3 styles:(id)a4 selectedStyleIndex:(unint64_t)a5 smartStyleSystemStyleIndex:(unint64_t)a6;
- (id)significantZoomFactorsForMode:(int64_t)a3 device:(int64_t)a4;
- (id)supportedCustomLensGroupForGroup:(id)a3;
- (id)supportedPhotoResolutionsForMode:(int64_t)a3 devicePosition:(int64_t)a4 photoEncoding:(int64_t)a5;
- (int)cacheDeleteUrgency;
- (int64_t)_backDualCameraVideoCapture4kMaxFPS;
- (int64_t)_backTripleCameraVideoCapture4kMaxFPS;
- (int64_t)_backWideDualCameraVideoCapture4kMaxFPS;
- (int64_t)_forcedBackCamera;
- (int64_t)_forcedBackDeviceForMode:(int64_t)a3 videoConfiguration:(int64_t)a4;
- (int64_t)_knownFramerateForVideoConfiguration:(int64_t)a3;
- (int64_t)_nearestCustomLensToLens:(int64_t)a3 inGroup:(id)a4;
- (int64_t)_proResVideoExternalMaxFPS1080p;
- (int64_t)_proResVideoExternalMaxFPS4k;
- (int64_t)_proResVideoMaxFPS1080p;
- (int64_t)_proResVideoMaxFPS4k;
- (int64_t)back1080pMaxFPS;
- (int64_t)back4kMaxFPS;
- (int64_t)back720pMaxFPS;
- (int64_t)backHighFrameRate1080pMaxFPS;
- (int64_t)backHighFrameRate4kMaxFPS;
- (int64_t)backHighFrameRate720pMaxFPS;
- (int64_t)backQuadraWideFocalLengthDisplayValue;
- (int64_t)backSuperWideFocalLengthDisplayValue;
- (int64_t)backTelephotoFocalLengthDisplayValue;
- (int64_t)backWideFocalLengthDisplayValue;
- (int64_t)baseFocalLengthForCustomLens:(int64_t)a3;
- (int64_t)baseFocalLengthForWideCamera;
- (int64_t)bytesPerMinuteForGraphConfiguration:(id)a3 outputToExternalStorage:(BOOL)a4;
- (int64_t)defaultPhotoResolutionForMode:(int64_t)a3 devicePosition:(int64_t)a4 encodingBehavior:(int64_t)a5;
- (int64_t)defaultVFRMode;
- (int64_t)effectiveFocalLengthForCustomLens:(int64_t)a3;
- (int64_t)fallbackPrimaryConstituentDeviceSelectionForMode:(int64_t)a3 device:(int64_t)a4 videoConfiguration:(int64_t)a5 videoStabilizationStrength:(int64_t)a6 macroMode:(int64_t)a7 spatialVideoEnabled:(BOOL)a8;
- (int64_t)front1080pMaxFPS;
- (int64_t)front4kMaxFPS;
- (int64_t)front720pMaxFPS;
- (int64_t)frontCameraMaximumEnhancedResolution;
- (int64_t)frontHighFrameRate1080pMaxFPS;
- (int64_t)frontHighFrameRate720pMaxFPS;
- (int64_t)hostProcess;
- (int64_t)maxSupportedPhotoQualityPrioritizationForMode:(int64_t)a3 devicePosition:(int64_t)a4;
- (int64_t)maximumBurstLength;
- (int64_t)maximumNumberOfInflightRequests;
- (int64_t)maximumPhotoResolutionForMode:(int64_t)a3 device:(int64_t)a4 encoding:(int64_t)a5;
- (int64_t)maximumRecordedFileSize;
- (int64_t)minimumDiskSpaceReserved;
- (int64_t)preferredDeviceForPosition:(int64_t)a3 mode:(int64_t)a4 videoConfiguration:(int64_t)a5 videoStabilizationStrength:(int64_t)a6 spatialVideoEnabled:(BOOL)a7;
- (int64_t)proResMinimumDiskSpaceOverrideMegabytesRelativeToFreeSpace;
- (int64_t)resolvedDefaultCustomLens;
- (int64_t)resolvedDeviceForDesiredDevice:(int64_t)a3 mode:(int64_t)a4 videoConfiguration:(int64_t)a5 videoStabilizationStrength:(int64_t)a6 spatialVideoEnabled:(BOOL)a7;
- (int64_t)resolvedVideoConfigurationForMode:(int64_t)a3 device:(int64_t)a4 videoEncodingBehavior:(int64_t)a5 videoConfiguration:(int64_t)a6 outputToExternalStorage:(BOOL)a7 spatialVideoEnabled:(BOOL)a8 prefersHDR10BitVideo:(BOOL)a9;
- (int64_t)sanitizeDesiredDevice:(int64_t)a3 forMode:(int64_t)a4;
- (int64_t)semanticStylesVersion;
- (int64_t)supportedCustomLensForLens:(int64_t)a3 inGroup:(id)a4;
- (int64_t)supportedEffectSetForDevicePosition:(int64_t)a3;
- (int64_t)supportedPortraitLightingVersion;
- (int64_t)validatedVideoConfigurationForVideoConfiguration:(int64_t)a3 withBlock:(id)a4;
- (int64_t)zoomDialStyle;
- (unint64_t)_desiredSemanticStyleSupportForMode:(int64_t)a3 devicePosition:(int64_t)a4;
- (unint64_t)_desiredSmartStyleSupportForMode:(int64_t)a3 devicePosition:(int64_t)a4;
- (unint64_t)backLowLightPreviewOverlayStyle;
- (unint64_t)frontLowLightPreviewOverlayStyle;
- (unint64_t)frontZoomBehaviorForCaptureMode:(int64_t)a3;
- (unint64_t)lowLightPreviewOverlayStyleForDevicePosition:(int64_t)a3 sensitiveToChangingDisplayFeedback:(BOOL)a4 sensitiveToInitialFeedback:(BOOL)a5 duration:(double)a6;
- (unint64_t)peopleProximityInitialScanRate;
- (unint64_t)peopleProximitySubsequentScanRate;
- (unint64_t)portraitInPhotoModeBehavior;
- (unint64_t)semanticStyleSupportForMode:(int64_t)a3 devicePosition:(int64_t)a4;
- (unint64_t)semanticStylesSupport;
- (unint64_t)spatialOverCaptureSupportForMode:(int64_t)a3 device:(int64_t)a4;
- (unint64_t)zoomPinchScalingMethod;
@end

@implementation CAMCaptureCapabilities

+ (CAMCaptureCapabilities)capabilities
{
  if (capabilities_onceToken != -1) {
    dispatch_once(&capabilities_onceToken, &__block_literal_global_36);
  }
  v2 = (void *)capabilities_sharedInstance;
  return (CAMCaptureCapabilities *)v2;
}

void __38__CAMCaptureCapabilities_capabilities__block_invoke()
{
  v0 = [MEMORY[0x263F086E0] mainBundle];
  id v4 = [v0 bundleIdentifier];

  if (([v4 isEqualToString:@"com.apple.camera"] & 1) != 0
    || ([v4 isEqualToString:@"com.apple.dt.xctest.tool"] & 1) != 0)
  {
    uint64_t v1 = 0;
  }
  else if ([v4 isEqualToString:@"com.apple.camera.CameraMessagesApp"])
  {
    uint64_t v1 = 2;
  }
  else if ([v4 isEqualToString:@"com.apple.MobileSMS"])
  {
    uint64_t v1 = 1;
  }
  else if ([v4 isEqualToString:@"com.apple.Photo-Booth"])
  {
    uint64_t v1 = 3;
  }
  else if ([v4 isEqualToString:@"com.apple.camera.lockscreen"])
  {
    uint64_t v1 = 4;
  }
  else
  {
    uint64_t v1 = 5;
  }
  v2 = [[CAMCaptureCapabilities alloc] initWithHostProcess:v1];
  v3 = (void *)capabilities_sharedInstance;
  capabilities_sharedInstance = (uint64_t)v2;
}

- (BOOL)isBackDualSupported
{
  return self->_backDualSupported;
}

- (BOOL)isBackPearlSupported
{
  return self->_backPearlSupported;
}

- (BOOL)isFrontDualSupported
{
  return self->_frontDualSupported;
}

- (BOOL)isFrontPearlSupported
{
  return self->_frontPearlSupported;
}

- (BOOL)hasSystemTelephonyOfAnyKind
{
  return self->_hasSystemTelephonyOfAnyKind;
}

- (BOOL)isBackCameraSupported
{
  return self->_backCameraSupported;
}

- (BOOL)isFrontFlashSupported
{
  return self->_frontFlashSupported;
}

- (BOOL)isBackFlashSupported
{
  return self->_backFlashSupported;
}

- (BOOL)isFrontAutomaticHDRSupported
{
  return self->_frontAutomaticHDRSupported;
}

- (BOOL)isBackAutomaticHDRSupported
{
  return self->_backAutomaticHDRSupported;
}

- (BOOL)arePortraitEffectsSupported
{
  return self->_portraitEffectsSupported;
}

- (BOOL)isCameraSupportedForDevice:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0xA) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = qword_209C7B450[a3 - 1];
  }
  BOOL v6 = [(CAMCaptureCapabilities *)self isCameraSupportedForDevicePosition:v5];
  if (v6)
  {
    switch(a3)
    {
      case 0:
      case 2:
        LOBYTE(v6) = [(CAMCaptureCapabilities *)self isBackCameraSupported];
        break;
      case 1:
      case 8:
        LOBYTE(v6) = [(CAMCaptureCapabilities *)self isFrontCameraSupported];
        break;
      case 3:
        LOBYTE(v6) = [(CAMCaptureCapabilities *)self isBackTelephotoSupported];
        break;
      case 4:
        LOBYTE(v6) = [(CAMCaptureCapabilities *)self isBackDualSupported];
        break;
      case 5:
        LOBYTE(v6) = [(CAMCaptureCapabilities *)self isBackSuperWideSupported];
        break;
      case 6:
        LOBYTE(v6) = [(CAMCaptureCapabilities *)self isBackWideDualSupported];
        break;
      case 7:
        LOBYTE(v6) = [(CAMCaptureCapabilities *)self isBackTripleCameraSupported];
        break;
      case 9:
        LOBYTE(v6) = [(CAMCaptureCapabilities *)self isFrontPearlSupported];
        break;
      case 10:
        LOBYTE(v6) = [(CAMCaptureCapabilities *)self isFrontSuperWideSupported];
        break;
      case 11:
        LOBYTE(v6) = 1;
        break;
      default:
        LOBYTE(v6) = 0;
        break;
    }
  }
  return v6;
}

- (BOOL)isInternalInstall
{
  return self->_internalInstall;
}

- (BOOL)isFrontHDRSupported
{
  return self->_frontHDRSupported;
}

- (BOOL)isBackHDRSupported
{
  return self->_backHDRSupported;
}

- (BOOL)isModernHDRSupported
{
  return self->_modernHDRSupported;
}

- (BOOL)isFrontPortraitModeSupported
{
  return self->_frontPortraitModeSupported;
}

- (BOOL)isBackPortraitModeSupported
{
  return self->_backPortraitModeSupported;
}

- (BOOL)isSupportedMode:(int64_t)a3 withDevice:(int64_t)a4
{
  BOOL v7 = [(CAMCaptureCapabilities *)self isCameraSupportedForDevice:a4];
  if (v7)
  {
    switch(a3)
    {
      case 0:
        LOBYTE(v7) = 1;
        break;
      case 1:
        LOBYTE(v7) = [(CAMCaptureCapabilities *)self isVideoSupported];
        break;
      case 2:
        LOBYTE(v7) = [(CAMCaptureCapabilities *)self isSlomoSupportedForDevice:a4];
        break;
      case 3:
        LOBYTE(v7) = [(CAMCaptureCapabilities *)self isPanoramaSupportedForDevice:a4];
        break;
      case 4:
        LOBYTE(v7) = [(CAMCaptureCapabilities *)self isSquareModeSupported];
        break;
      case 5:
        LOBYTE(v7) = [(CAMCaptureCapabilities *)self isTimelapseSupportedForDevice:a4];
        break;
      case 6:
        LOBYTE(v7) = [(CAMCaptureCapabilities *)self isPortraitModeSupportedForDevice:a4];
        break;
      case 7:
        LOBYTE(v7) = [(CAMCaptureCapabilities *)self isCinematicModeSupportedForDevice:a4];
        break;
      case 8:
        LOBYTE(v7) = [(CAMCaptureCapabilities *)self _isSpatialVideoModeSupportedForDevice:a4];
        break;
      case 9:
        LOBYTE(v7) = [(CAMCaptureCapabilities *)self _isSpatialPhotoModeSupportedForDevice:a4];
        break;
      default:
        LOBYTE(v7) = 0;
        break;
    }
  }
  return v7;
}

- (BOOL)isFrontTorchSupported
{
  return self->_frontTorchSupported;
}

- (BOOL)isBackTorchSupported
{
  return self->_backTorchSupported;
}

- (BOOL)isLiveFilteringSupported
{
  return self->_liveFilteringSupported;
}

- (BOOL)isSupportedVideoConfiguration:(int64_t)a3 forMode:(int64_t)a4 device:(int64_t)a5
{
  LODWORD(v9) = [(CAMCaptureCapabilities *)self isCameraSupportedForDevice:a5];
  if (v9)
  {
    BOOL v10 = a4 == 7 && [(CAMCaptureCapabilities *)self isCinematicModeSupported];
    BOOL v11 = [(CAMCaptureCapabilities *)self cinematic4KSupported];
    BOOL v12 = [(CAMCaptureCapabilities *)self isHEVCEncodingSupported];
    int64_t v9 = [(CAMCaptureCapabilities *)self backHighFrameRate4kMaxFPS];
    int v13 = v11 && v10;
    switch(a3)
    {
      case 0:
        if (a4 == 1) {
          goto LABEL_11;
        }
        if (a4 == 2) {
          goto LABEL_82;
        }
        if (v10)
        {
          LOBYTE(v9) = [(CAMCaptureCapabilities *)self isCinematicModeSupportedForDevice:a5];
        }
        else
        {
          if (a4 != 8) {
            goto LABEL_120;
          }
          LOBYTE(v9) = [(CAMCaptureCapabilities *)self _isSpatialVideoModeSupportedForDevice:a5];
        }
        return v9;
      case 1:
        if (a4 != 1) {
          goto LABEL_120;
        }
        LOBYTE(v9) = [(CAMCaptureCapabilities *)self is1080p60VideoSupportedForDevice:a5];
        return v9;
      case 2:
        if (a4 != 2) {
          goto LABEL_120;
        }
LABEL_82:
        LOBYTE(v9) = [(CAMCaptureCapabilities *)self isSlomoSupportedForDevice:a5];
        return v9;
      case 3:
        if (a4 != 2) {
          goto LABEL_120;
        }
        LOBYTE(v9) = [(CAMCaptureCapabilities *)self is720p240SupportedForDevice:a5];
        return v9;
      case 4:
        if (a4 == 1 && v12)
        {
          LOBYTE(v9) = [(CAMCaptureCapabilities *)self is1080p120VideoSupportedForDevice:a5];
        }
        else
        {
          if (a4 != 2) {
            goto LABEL_120;
          }
          LOBYTE(v9) = [(CAMCaptureCapabilities *)self _is1080p120SlomoSupportedForDevice:a5];
        }
        return v9;
      case 5:
        if (a4 == 1) {
          int v20 = 1;
        }
        else {
          int v20 = v13;
        }
        if (v20 != 1) {
          goto LABEL_120;
        }
        goto LABEL_59;
      case 6:
        if (((unint64_t)a5 > 0xB) | (0xFDu >> a5) & 1) {
          int64_t v21 = [(CAMCaptureCapabilities *)self back720pMaxFPS];
        }
        else {
          int64_t v21 = [(CAMCaptureCapabilities *)self front720pMaxFPS];
        }
        LOBYTE(v9) = a4 == 1 && v21 > 29;
        return v9;
      case 7:
        if (((unint64_t)a5 > 0xB) | (0xFDu >> a5) & 1) {
          int64_t v15 = [(CAMCaptureCapabilities *)self back1080pMaxFPS];
        }
        else {
          int64_t v15 = [(CAMCaptureCapabilities *)self front1080pMaxFPS];
        }
        uint64_t v24 = v15;
        BOOL v25 = a4 == 8
           && [(CAMCaptureCapabilities *)self _isSpatialVideoModeSupportedForDevice:a5];
        char v30 = a4 == 1 || v10;
        char v31 = v30 | v25;
        if (v24 > 29) {
          LOBYTE(v9) = v31;
        }
        else {
          LOBYTE(v9) = 0;
        }
        return v9;
      case 8:
        LOBYTE(v9) = 0;
        if (a4 == 2 && v12)
        {
          LOBYTE(v9) = [(CAMCaptureCapabilities *)self is1080p240SupportedForDevice:a5];
        }
        return v9;
      case 9:
        if (a4 != 1 || !v12) {
          goto LABEL_120;
        }
        LOBYTE(v9) = [(CAMCaptureCapabilities *)self is4k60VideoSupportedForDevice:a5];
        return v9;
      case 10:
        if (a4 == 1) {
          int v22 = 1;
        }
        else {
          int v22 = v13;
        }
        if (v22 != 1) {
          goto LABEL_120;
        }
        LOBYTE(v9) = [(CAMCaptureCapabilities *)self is4k24VideoSupportedForDevice:a5];
        return v9;
      case 11:
        if (((unint64_t)a5 > 0xB) | (0xFDu >> a5) & 1) {
          int64_t v17 = [(CAMCaptureCapabilities *)self back1080pMaxFPS];
        }
        else {
          int64_t v17 = [(CAMCaptureCapabilities *)self front1080pMaxFPS];
        }
        uint64_t v26 = v17;
        BOOL v27 = [(CAMCaptureCapabilities *)self isPALVideoSupported];
        BOOL v29 = a4 == 1 && v26 > 24;
        LOBYTE(v9) = v27 && v29;
        return v9;
      case 12:
        BOOL v18 = [(CAMCaptureCapabilities *)self isPALVideoSupported];
        LOBYTE(v9) = 0;
        if (a4 == 1) {
          int v19 = 1;
        }
        else {
          int v19 = v13;
        }
        if (v18 && v19)
        {
LABEL_59:
          LOBYTE(v9) = [(CAMCaptureCapabilities *)self is4k30VideoSupportedForDevice:a5];
        }
        return v9;
      case 13:
      case 14:
        if (a4 == 1)
        {
          if (![(CAMCaptureCapabilities *)self isBack4k120VideoSupported] || !v12)
          {
LABEL_120:
            LOBYTE(v9) = 0;
            return v9;
          }
        }
        else
        {
          uint64_t v23 = v9;
          LOBYTE(v9) = 0;
          if (a4 != 2 || v23 < 120 || !v12) {
            return v9;
          }
        }
        LOBYTE(v9) = [(CAMCaptureCapabilities *)self is4K120VideoSupportedForDevice:a5];
        break;
      default:
        if ((unint64_t)(a3 - 10000) >= 6 || a4 != 1) {
          goto LABEL_120;
        }
LABEL_11:
        LODWORD(v9) = [(CAMCaptureCapabilities *)self isCameraSupportedForDevice:a5];
        if (v9)
        {
          LOBYTE(v9) = [(CAMCaptureCapabilities *)self isVideoSupported];
        }
        return v9;
    }
  }
  return v9;
}

- (BOOL)isFrontCameraSupported
{
  return self->_frontCameraSupported;
}

- (BOOL)isHEVCEncodingSupported
{
  return self->_HEVCEncodingSupported;
}

- (BOOL)isVideoSupported
{
  return self->_videoSupported;
}

- (BOOL)isSlomoSupportedForDevice:(int64_t)a3
{
  if (!-[CAMCaptureCapabilities isCameraSupportedForDevice:](self, "isCameraSupportedForDevice:")
    || (unint64_t)a3 > 0xA)
  {
    return 0;
  }
  if (((1 << a3) & 0x2D) != 0)
  {
    return [(CAMCaptureCapabilities *)self isBackSlomoSupported];
  }
  if (((1 << a3) & 0x502) == 0) {
    return 0;
  }
  return [(CAMCaptureCapabilities *)self isFrontSlomoSupported];
}

- (BOOL)isFrontSlomoSupported
{
  return self->_frontSlomoSupported;
}

- (BOOL)isBackSlomoSupported
{
  return self->_backSlomoSupported;
}

- (BOOL)isDualSupportedForDevicePosition:(int64_t)a3
{
  if (a3 == 1) {
    return [(CAMCaptureCapabilities *)self isFrontDualSupported];
  }
  if (a3) {
    return 0;
  }
  return [(CAMCaptureCapabilities *)self isBackDualSupported];
}

- (int64_t)hostProcess
{
  return self->_hostProcess;
}

- (BOOL)isSplitScreenSupported
{
  return self->_splitScreenSupported;
}

- (BOOL)isBackTimelapseSupported
{
  return self->_backTimelapseSupported;
}

- (BOOL)isSquareModeSupported
{
  return self->_squareModeSupported;
}

- (BOOL)isBackPanoramaSupported
{
  return self->_backPanoramaSupported;
}

- (BOOL)allowHaptics
{
  return self->_allowHaptics;
}

- (BOOL)isLockButtonAppropriateForShutter
{
  return self->_lockButtonAppropriateForShutter;
}

- (int64_t)sanitizeDesiredDevice:(int64_t)a3 forMode:(int64_t)a4
{
  unint64_t v5 = a3;
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (![(CAMCaptureCapabilities *)self isSupportedMode:a4 withDevice:a3])
  {
    unint64_t v7 = v5 - 1;
    if (v5 - 1 > 0xA)
    {
      unint64_t v9 = 0;
      v8 = @"BackAuto";
    }
    else
    {
      v8 = off_263FA45A8[v7];
      unint64_t v9 = qword_209C7B450[v7];
    }
    if ([(CAMCaptureCapabilities *)self isSupportedMode:a4 withDevice:v9])
    {
      BOOL v10 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        if ((unint64_t)a4 > 9) {
          BOOL v11 = 0;
        }
        else {
          BOOL v11 = off_263FA4660[a4];
        }
        if (v5 > 0xB) {
          int64_t v17 = 0;
        }
        else {
          int64_t v17 = off_263FA4600[v5];
        }
        int v24 = 138543874;
        BOOL v25 = v11;
        __int16 v26 = 2114;
        BOOL v27 = v17;
        __int16 v28 = 2114;
        BOOL v29 = v8;
        _os_log_impl(&dword_2099F8000, v10, OS_LOG_TYPE_DEFAULT, "Attempted to change to mode %{public}@ with an unsupported device (%{public}@). Configuring to use Auto device for same position instead (%{public}@).", (uint8_t *)&v24, 0x20u);
      }
    }
    else
    {
      uint64_t v12 = v9 ^ 1;
      BOOL v13 = [(CAMCaptureCapabilities *)self isSupportedMode:a4 withDevice:v9 ^ 1];
      v14 = os_log_create("com.apple.camera", "Camera");
      BOOL v10 = v14;
      if (v13)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          if ((unint64_t)a4 > 9) {
            int64_t v15 = 0;
          }
          else {
            int64_t v15 = off_263FA4660[a4];
          }
          if (v5 > 0xB) {
            BOOL v18 = 0;
          }
          else {
            BOOL v18 = off_263FA4600[v5];
          }
          int v19 = @"FrontAuto";
          if (!v12) {
            int v19 = @"BackAuto";
          }
          int v20 = v19;
          int v24 = 138543874;
          BOOL v25 = v15;
          __int16 v26 = 2114;
          BOOL v27 = v18;
          __int16 v28 = 2114;
          BOOL v29 = v20;
          _os_log_impl(&dword_2099F8000, v10, OS_LOG_TYPE_DEFAULT, "Attempted to change to mode %{public}@ with an unsupported device (%{public}@). Configuring to use Auto device for other position instead (%{public}@).", (uint8_t *)&v24, 0x20u);
        }
        unint64_t v9 = v12;
      }
      else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        if ((unint64_t)a4 > 9) {
          v16 = 0;
        }
        else {
          v16 = off_263FA4660[a4];
        }
        CAMDebugStringForCaptureDevice_0(v5);
        int v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
        CAMDebugStringForCaptureDevice_0(v9);
        uint64_t v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
        int v24 = 138543874;
        BOOL v25 = v16;
        __int16 v26 = 2114;
        BOOL v27 = v22;
        __int16 v28 = 2114;
        BOOL v29 = v23;
        _os_log_error_impl(&dword_2099F8000, v10, OS_LOG_TYPE_ERROR, "Attempted to change to mode %{public}@ with an unsupported device (%{public}@). Auto device for both positions unsupported, returning Auto device for same position anyway (%{public}@).", (uint8_t *)&v24, 0x20u);
      }
    }

    return v9;
  }
  return v5;
}

- (BOOL)isBackHDROnSupported
{
  return self->_backHDROnSupported;
}

- (BOOL)isZoomAllowedForMode:(int64_t)a3 device:(int64_t)a4 videoConfiguration:(int64_t)a5
{
  [(CAMCaptureCapabilities *)self maximumZoomFactorForMode:a3 device:a4 videoConfiguration:a5 videoStabilizationStrength:0];
  return v5 > 1.0;
}

- (double)maximumZoomFactorForMode:(int64_t)a3 device:(int64_t)a4 videoConfiguration:(int64_t)a5
{
  [(CAMCaptureCapabilities *)self maximumZoomFactorForMode:a3 device:a4 videoConfiguration:a5 videoStabilizationStrength:0 shouldResolveDevice:1];
  return result;
}

- (double)_backPhotoModeMaximumZoomFactor
{
  return self->__backPhotoModeMaximumZoomFactor;
}

- (BOOL)isTelephotoSupportedForDevicePosition:(int64_t)a3
{
  if (a3 == 1) {
    return [(CAMCaptureCapabilities *)self isFrontTelephotoSupported];
  }
  if (a3) {
    return 0;
  }
  return [(CAMCaptureCapabilities *)self isBackTelephotoSupported];
}

- (BOOL)isBackTelephotoSupported
{
  return self->_backTelephotoSupported;
}

- (BOOL)hasFilteringEntitlement
{
  return self->_hasFilteringEntitlement;
}

- (BOOL)isBackBurstSupported
{
  return self->_backBurstSupported;
}

- (BOOL)isLivePreviewSupportedForLightingType:(int64_t)a3 devicePosition:(int64_t)a4
{
  BOOL result = [(CAMCaptureCapabilities *)self isPortraitModeSupportedForDevicePosition:a4];
  if ((unint64_t)(a3 - 1) >= 3)
  {
    if ((unint64_t)(a3 - 4) >= 3)
    {
      return a3 == 0;
    }
    else if (a4 == 1)
    {
      return [(CAMCaptureCapabilities *)self isFrontLiveStageLightSupported];
    }
    else if (a4)
    {
      return 0;
    }
    else
    {
      return [(CAMCaptureCapabilities *)self isBackLiveStageLightSupported];
    }
  }
  return result;
}

- (BOOL)isPortraitModeSupportedForDevicePosition:(int64_t)a3
{
  if (a3 == 1) {
    return [(CAMCaptureCapabilities *)self isFrontPortraitModeSupported];
  }
  if (a3) {
    return 0;
  }
  return [(CAMCaptureCapabilities *)self isBackPortraitModeSupported];
}

- (BOOL)isForceTouchSupported
{
  return self->_forceTouchSupported;
}

- (double)_backDualCameraSwitchOverZoomFactor
{
  return self->__backDualCameraSwitchOverZoomFactor;
}

- (CAMCaptureCapabilities)initWithHostProcess:(int64_t)a3
{
  uint64_t v419 = *MEMORY[0x263EF8340];
  CAMSignpostWithIDAndArgs(89, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
  v396.receiver = self;
  v396.super_class = (Class)CAMCaptureCapabilities;
  double v5 = [(CAMCaptureCapabilities *)&v396 init];

  if (!v5) {
    goto LABEL_497;
  }
  v5->_unint64_t hostProcess = a3;
  v5->_internalInstall = MGGetBoolAnswer();
  int v379 = MGGetSInt32Answer();
  v5->__iPad = v379 == 3;
  v370 = AVGestaltGetStringAnswerWithDefault();
  double v6 = 0.0;
  if ([v370 length])
  {
    unint64_t v7 = [v370 componentsSeparatedByString:@" "];
    if ([v7 count] == 2)
    {
      v8 = [v7 objectAtIndexedSubscript:1];
      unint64_t v9 = [v8 componentsSeparatedByString:@"."];
      if ((unint64_t)[v9 count] >= 2)
      {
        BOOL v10 = [v9 objectAtIndexedSubscript:0];
        uint64_t v11 = [v10 integerValue];

        uint64_t v12 = [v9 objectAtIndexedSubscript:1];
        uint64_t v13 = [v12 integerValue];

        double v6 = (double)v13 / 10.0 + (double)v11;
      }
    }
  }
  v5->_shouldPerformSuperWideAutoMacroMigration = v6 < 16.0;
  Boolean v395 = 0;
  v5->_documentScanningMinimumConfidenceLevel = 0.95;
  v5->__unint64_t forcedBackCamera = 0;
  v5->__forcedInitialZoomDisplayFactor = 0.0;
  v5->_backLowLightPreviewOverlayStyle = 0;
  v5->_frontLowLightPreviewOverlayStyle = 0;
  v5->_maximumNumberOfInflightRequests = 2;
  if (!v5->_internalInstall)
  {
    double v358 = 0.0;
    uint64_t v364 = 0;
    uint64_t v365 = 0;
    BOOL v339 = 0;
    BOOL v361 = 0;
    BOOL v26 = 0;
    uint64_t v346 = 0;
    BOOL v368 = 0;
    uint64_t v369 = 0;
    BOOL v375 = 0;
    BOOL v356 = 0;
    BOOL v27 = 0;
    BOOL v351 = 0;
    BOOL v352 = 0;
    uint64_t v362 = 0;
    uint64_t v363 = 0;
    uint64_t v340 = 0;
    BOOL v341 = 0;
    CFIndex v357 = 0;
    CFIndex v360 = 0;
    BOOL v344 = 0;
    uint64_t v371 = 0;
    int obj = 0;
    BOOL v373 = 0;
    BOOL v366 = 0;
    BOOL v28 = 0;
    BOOL v14 = 0;
    double v354 = 0.0;
    double v355 = 0.0;
    double v359 = 0.0;
    double v29 = 0.0;
    uint64_t v353 = -1;
    int v30 = 3;
    goto LABEL_66;
  }
  BOOL v14 = CFPreferencesGetAppBooleanValue(@"CAMFeatureDevelopmentAllowHapticsOnModeDialTap", @"com.apple.camera", 0) != 0;
  BOOL v15 = CFPreferencesGetAppBooleanValue(@"CAMFeatureDevelopmentApplyNaturalLightingToOriginal", @"com.apple.camera", 0) != 0;
  BOOL v366 = CFPreferencesGetAppBooleanValue(@"CAMFeatureDevelopmentUseReticleStroke", @"com.apple.camera", 0) != 0;
  BOOL v373 = CFPreferencesGetAppBooleanValue(@"CAMFeatureDevelopmentUseTransientImageWellForCTM", @"com.apple.camera", 0) != 0;
  LOBYTE(v371) = CFPreferencesGetAppBooleanValue(@"CAMFeatureDevelopmentAllowFullscreenModeSelector", @"com.apple.camera", 0) != 0;
  v5->_featureDevelopmentEmulateSuperWide = CFPreferencesGetAppBooleanValue(@"CAMFeatureDevelopmentEmulateSuperWide", @"com.apple.camera", 0) != 0;
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"CAMFeatureDevelopmentAllowWideBravo", @"com.apple.camera", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    _ZF = AppBooleanValue == 0;
  }
  else {
    _ZF = 0;
  }
  int v18 = _ZF;
  int obj = v18;
  LOBYTE(v368) = CFPreferencesGetAppBooleanValue(@"CAMFeatureDevelopmentDebugSemanticDevelopmentFilters", @"com.apple.camera", 0) != 0;
  Boolean v393 = 0;
  int v19 = CFPreferencesGetAppBooleanValue(@"CAMFeatureDevelopmentAllowExposureClippingIndicator", @"com.apple.camera", &v393);
  if (v393)
  {
    v5->__forceEnableExposureClippingIndicator = v19 != 0;
    v5->__forceDisableExposureClippingIndicator = v19 == 0;
  }
  Boolean v392 = 0;
  v5->_featureDevelopmentForceSingleCamera = CFPreferencesGetAppBooleanValue(@"CAMFeatureDevelopmentForceSingleCamera", @"com.apple.camera", &v392) != 0;
  Boolean v391 = 0;
  int v20 = CFPreferencesGetAppBooleanValue(@"CAMFeatureDevelopmentAllowSuperBravo", @"com.apple.camera", &v391);
  if (v391) {
    BOOL v21 = v20 == 0;
  }
  else {
    BOOL v21 = 0;
  }
  int v22 = v21;
  HIDWORD(v371) = v22;
  v5->_featureDevelopmentDefaultWideHighStabilization = CFPreferencesGetAppBooleanValue(@"CAMFeatureDevelopmentDefault1xVideoStabilizationHigh", @"com.apple.camera", 0) != 0;
  BYTE4(v346) = CFPreferencesGetAppBooleanValue(@"CAMFeatureDevelopmentAllowFocalLengthPicker", @"com.apple.camera", 0) != 0;
  BYTE4(v369) = CFPreferencesGetAppBooleanValue(@"CAMFeatureDevelopmentAllowOverlapping48MPCaptures", @"com.apple.camera", 0) != 0;
  HIDWORD(v341) = CFPreferencesGetAppBooleanValue(@"CAMFeatureDevelopmentAllow24MP", @"com.apple.camera", 0) != 0;
  uint64_t v23 = (void *)CFPreferencesCopyAppValue(@"CAMFeatureDevelopmentForceBackCamera", @"com.apple.camera");
  int v24 = [v23 lowercaseString];

  if ([v24 isEqualToString:@"wide"])
  {
    uint64_t v25 = 2;
LABEL_36:
    v5->__unint64_t forcedBackCamera = v25;
    char v31 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t forcedBackCamera = v5->__forcedBackCamera;
      if (forcedBackCamera > 0xB) {
        v33 = 0;
      }
      else {
        v33 = off_263FA4600[forcedBackCamera];
      }
      *(_DWORD *)buf = 138543362;
      v416 = v33;
      _os_log_impl(&dword_2099F8000, v31, OS_LOG_TYPE_DEFAULT, "Forcing back camera to %{public}@ when possible", buf, 0xCu);
    }

    v5->__allowZoomWithForcedBackCamera = CFPreferencesGetAppBooleanValue(@"CAMFeatureDevelopmentAllowZoomWithForcedCamera", @"com.apple.camera", 0) != 0;
    goto LABEL_42;
  }
  if ([v24 hasPrefix:@"tele"])
  {
    uint64_t v25 = 3;
    goto LABEL_36;
  }
  if ([v24 isEqualToString:@"superwide"])
  {
    uint64_t v25 = 5;
    goto LABEL_36;
  }
  if ([v24 isEqualToString:@"bravo"])
  {
    uint64_t v25 = 4;
    goto LABEL_36;
  }
  if ([v24 isEqualToString:@"widebravo"])
  {
    uint64_t v25 = 6;
    goto LABEL_36;
  }
  if ([v24 isEqualToString:@"superbravo"])
  {
    uint64_t v25 = 7;
    goto LABEL_36;
  }
  v5->__unint64_t forcedBackCamera = 0;
LABEL_42:
  [(CAMCaptureCapabilities *)v5 _doubleForKey:@"CAMFeatureDevelopmentInitialZoomFactor" applicationID:@"com.apple.camera"];
  v5->__forcedInitialZoomDisplayFactor = v34;
  Boolean v390 = 0;
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"CAMFeatureDevelopmentMaxInflightRequests", @"com.apple.camera", &v390);
  if (v390) {
    v5->_maximumNumberOfInflightRequests = AppIntegerValue;
  }
  unint64_t v36 = CFPreferencesGetAppIntegerValue(@"CAMFeatureDevelopmentLowLightPreviewStyle", @"com.apple.camera", 0);
  uint64_t v37 = v36;
  if (v36 >= 4)
  {
    v39 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
      -[CAMCaptureCapabilities initWithHostProcess:](v37, v39);
    }

    unint64_t v38 = 0;
  }
  else
  {
    unint64_t v38 = qword_209C7B2D0[v36];
  }
  v5->_backLowLightPreviewOverlayStyle = v38;
  v5->_frontLowLightPreviewOverlayStyle = v38;
  v5->_forceAllowAllInterfaceOrientations = CFPreferencesGetAppBooleanValue(@"CAMForceAllowAllInterfaceOrientations", @"com.apple.camera", 0) != 0;
  +[CAMPreferencesUtilities doubleForKey:@"CAMFeatureDevelopmentTimelapseFirstShotDelay" applicationID:@"com.apple.camera" keyIsValidAndExists:0];
  double v29 = v40;
  v5->_imageAnalysisShowsInactiveTextRegions = CFPreferencesGetAppBooleanValue(@"CAMFeatureDevelopmentShowInactiveTextRegions", @"com.apple.camera", 0) != 0;
  CFPreferencesGetAppBooleanValue(@"CAMFeatureDevelopmentForceEnableSuperBravoDevice", @"com.apple.camera", 0);
  CFPreferencesGetAppBooleanValue(@"CAMFeatureDevelopmentForceEnablePortraitBravoDevices", @"com.apple.camera", 0);
  BOOL v344 = CFPreferencesGetAppBooleanValue(@"CAMFeatureDevelopmentAllowAllProResConfigurations", @"com.apple.camera", 0) != 0;
  +[CAMPreferencesUtilities doubleForKey:@"CAMFeatureDevelopmentProResMinimumAvailableDiskSpaceOverride" applicationID:@"com.apple.camera" keyIsValidAndExists:0];
  double v359 = v41;
  CFIndex v360 = CFPreferencesGetAppIntegerValue(@"CAMFeatureDevelopmentProResMinimumDiskSpaceOverrideMegabytesRelativeToFreeSpace", @"com.apple.camera", 0);
  CFIndex v357 = CFPreferencesGetAppIntegerValue(@"CAMFeatureDevelopmentZoomPinchScalingMethod", @"com.apple.camera", &v395);
  +[CAMPreferencesUtilities doubleForKey:@"CAMFeatureDevelopmentZoomPinchExponentialFactorDistance" applicationID:@"com.apple.camera" keyIsValidAndExists:0];
  double v355 = v42;
  +[CAMPreferencesUtilities doubleForKey:@"CAMFeatureDevelopmentZoomPinchExponentialFactor" applicationID:@"com.apple.camera" keyIsValidAndExists:0];
  double v354 = v43;
  +[CAMPreferencesUtilities doubleForKey:@"CAMFeatureDevelopmentZoomPinchHybridLerpDistance" applicationID:@"com.apple.camera" keyIsValidAndExists:0];
  double v358 = v44;
  Boolean v389 = 0;
  unsigned int v45 = CFPreferencesGetAppIntegerValue(@"CAMFeatureDevelopmentCacheDeleteUrgency", @"com.apple.camera", &v389);
  int v30 = 3;
  if (v389)
  {
    unsigned int v46 = v45;
    if (v45 <= 4)
    {
      v47 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        if (v46 > 4) {
          v48 = 0;
        }
        else {
          v48 = off_263FA4580[v46];
        }
        *(_DWORD *)buf = 138543618;
        v416 = @"High";
        __int16 v417 = 2114;
        v418 = v48;
        _os_log_impl(&dword_2099F8000, v47, OS_LOG_TYPE_DEFAULT, "Overriding CacheDeleteUrgency from %{public}@ to %{public}@", buf, 0x16u);
      }

      int v30 = v46;
    }
  }
  BOOL v28 = v15;
  v5->_shouldEnableUserNotifications = CFPreferencesGetAppBooleanValue(@"CAMDebugSuppressNotifications", @"com.apple.camera", 0) == 0;
  v5->_bypassWelcomeScreens = CFPreferencesGetAppBooleanValue(@"CAMUserPreferenceBypassWelcomeScreens", @"com.apple.camera", 0) != 0;
  BOOL v27 = CFPreferencesGetAppBooleanValue(@"CAMFeatureDevelopmentAspectRatioCropThreeTwoSupported", @"com.apple.camera", 0) != 0;
  buf[0] = 0;
  int v49 = CFPreferencesGetAppBooleanValue(@"CAMFeatureDevelopmentAllowSmartStyles", @"com.apple.camera", buf);
  BOOL v50 = buf[0] != 0;
  if (v49) {
    BOOL v50 = 0;
  }
  LODWORD(v340) = v49 != 0;
  HIDWORD(v340) = v50;
  LOBYTE(v341) = CFPreferencesGetAppBooleanValue(@"CAMFeatureDevelopmentAllowExtraStylesControls", @"com.apple.camera", 0) != 0;
  BYTE4(v365) = CFPreferencesGetAppBooleanValue(@"CAMFeatureDevelopmentAllowPortraitSemanticStyles", @"com.apple.camera", 0) != 0;
  BYTE4(v363) = CFPreferencesGetAppBooleanValue(@"CAMFeatureDevelopmentAllowPortraitAspectRatio", @"com.apple.camera", 0) != 0;
  BOOL v352 = +[CAMPreferencesUtilities BOOLInCameraDomainForKey:@"CAMFeatureDevelopmentAllowContinuousZoomForPortraitMode"];
  LOBYTE(v364) = +[CAMPreferencesUtilities BOOLInCameraDomainForKey:@"CAMFeatureDevelopmentAllowDeepFusionForPortraitMode"];
  BYTE4(v364) = +[CAMPreferencesUtilities BOOLInCameraDomainForKey:@"CAMFeatureDevelopmentAllowDeepFusionForFrontPortraitMode"];
  LOBYTE(v369) = CFPreferencesGetAppBooleanValue(@"CAMFeatureDevelopmentAllowHalfPressSimulation", @"com.apple.camera", 0) != 0;
  v5->__allowSpatialOverCaptureInPortraitMode = +[CAMPreferencesUtilities BOOLInCameraDomainForKey:@"CAMFeatureDevelopmentAllowSpatialOverCaptureInPortraitMode"];
  BYTE4(v362) = +[CAMPreferencesUtilities BOOLInCameraDomainForKey:@"CAMFeatureDevelopmentAllowPhotoModeDepth"];
  v5->_featureDevelopmentForceDepthDataCaptureInPhotoMode = +[CAMPreferencesUtilities BOOLInCameraDomainForKey:@"CAMFeatureDevelopmentForceDepthDataCaptureInPhotoMode"];
  LOBYTE(v363) = +[CAMPreferencesUtilities BOOLInCameraDomainForKey:@"CAMFeatureDevelopmentAllowFrontPhotoModeDepth"];
  LOBYTE(v362) = +[CAMPreferencesUtilities BOOLInCameraDomainForKey:@"CAMFeatureDevelopmentAllowPreviewQualityStillImageFilteringForPhotoMode"];
  v5->_featureDevelopmentIgnoreDepthSuggestionInPhotoMode = +[CAMPreferencesUtilities BOOLInCameraDomainForKey:@"CAMFeatureDevelopmentIgnoreDepthSuggestionInPhotoMode"];
  v5->_featureDevelopmentForceDepthEffectInPhotoMode = +[CAMPreferencesUtilities BOOLInCameraDomainForKey:@"CAMFeatureDevelopmentForceDepthEffectInPhotoMode"];
  BOOL v351 = +[CAMPreferencesUtilities BOOLInCameraDomainForKey:@"CAMFeatureDevelopmentAllowContinuousZoomForCinematicMode"];
  BYTE4(v368) = CFPreferencesGetAppBooleanValue(@"CAMFeatureDevelopmentAllowZoomPIPForSlomo", @"com.apple.camera", 0) != 0;
  BOOL v356 = +[CAMPreferencesUtilities BOOLInCameraDomainForKey:@"CAMFeatureDevelopmentAllowPortraitModeOverlappingCaptures"];
  v5->_featureDevelopmentHidePreviewOverlayBars = +[CAMPreferencesUtilities BOOLInCameraDomainForKey:@"CAMFeatureDevelopmentHidePreviewOverlayBars"];
  v5->_featureDevelopmentAllowAllHEICOptionsInPhotoPicker = +[CAMPreferencesUtilities BOOLInCameraDomainForKey:@"CAMFeatureDevelopmentAllowAllHEICOptionsInPhotoPicker"];
  v5->__disablePortraitFrontFacingZoomedCaptureDeviceFormat = CFPreferencesGetAppBooleanValue(@"CAMFeatureDevelopmentDisableZoomedFFCPortrait", @"com.apple.camera", 0) != 0;
  BOOL v375 = +[CAMPreferencesUtilities BOOLInCameraDomainForKey:@"CAMFeatureDevelopmentAllowActionModeAggregateDevice4k60"];
  LODWORD(v346) = +[CAMPreferencesUtilities BOOLInCameraDomainForKey:@"CAMFeatureDevelopmentAllowPauseCinematic"];
  BOOL v26 = +[CAMPreferencesUtilities BOOLInCameraDomainForKey:@"CAMFeatureDevelopmentAllowMixAudioWithOthers"];
  BOOL v361 = +[CAMPreferencesUtilities BOOLInCameraDomainForKey:@"CAMFeatureDevelopmentAllowPhotoModeNightModePortrait"];
  int v51 = CFPreferencesGetAppBooleanValue(@"CAMFeatureDevelopmentDocumentScanningEnabled", @"com.apple.camera", 0);
  LOBYTE(v365) = v51 != 0;
  [(CAMCaptureCapabilities *)v5 _doubleForKey:@"CAMFeatureDevelopmentDocumentScanningMininumConfidenceLevel" applicationID:@"com.apple.camera"];
  if (v51 && v52 > 0.0)
  {
    float v53 = v52;
    v5->_documentScanningMinimumConfidenceLevel = v53;
  }
  v5->__proResCinematicVideoSupported = CFPreferencesGetAppBooleanValue(@"CAMFeatureDevelopmentCinematicProRes", @"com.apple.camera", 0) != 0;
  v5->__externalStorageSupportedForAllVideoFormats = CFPreferencesGetAppBooleanValue(@"CAMFeatureDevelopmentExternalStorageAllVideoFormats", @"com.apple.camera", 0) != 0;
  BOOL v339 = +[CAMPreferencesUtilities BOOLInCameraDomainForKey:@"CAMFeatureDevelopmentUnifiedPhotoAndPortraitHidePortraitMode"];
  Boolean v388 = 0;
  CFIndex v54 = CFPreferencesGetAppIntegerValue(@"CAMFeatureDevelopmentPortraitInPhotoModeBehavior", @"com.apple.camera", &v388);
  if (v388) {
    uint64_t v55 = v54;
  }
  else {
    uint64_t v55 = -1;
  }
  uint64_t v353 = v55;
  v5->_featureDevelopmentShowLockIndicator = +[CAMPreferencesUtilities BOOLInCameraDomainForKey:@"CAMFeatureDevelopmentShowLockIndicator"];

LABEL_66:
  v5->_disableAudio = +[CAMPreferencesUtilities BOOLInCameraDomainForKey:@"CAMFeatureDevelopmentDisableAudio"];
  char BoolAnswer = 1;
  char v57 = v379 != 3 || v26;
  if (((1 << a3) & 0x15) != 0) {
    char v58 = v57;
  }
  else {
    char v58 = 0;
  }
  if ((unint64_t)a3 > 4) {
    char v58 = 0;
  }
  v5->_mixAudioWithOthersSupported = v58;
  v5->__aspectRatioCropThreeTwoSupported = v27;
  unint64_t v377 = a3 & 0xFFFFFFFFFFFFFFFBLL;
  BOOL v59 = (a3 & 0xFFFFFFFFFFFFFFFBLL) == 0;
  v5->_cacheDeleteSupported = v59;
  v5->_cacheDeleteUrgency = v30;
  v5->_PALVideoSupported = 1;
  v5->_mirroredFrontVideosSupported = AVGestaltGetBoolAnswer();
  v5->_mirroredFrontCapturesSupported = 1;
  v5->_variableFramerateVideoSupported = AVGestaltGetBoolAnswer();
  v5->_naturalLightingAppliedToOriginal = v28;
  char v60 = MGGetBoolAnswer();
  v5->_allowHaptics = v60;
  v5->_allowHapticsOnConfigurationTaps = v60 & v14;
  v5->_backCameraSupported = AVGestaltGetBoolAnswer();
  v5->_frontCameraSupported = AVGestaltGetBoolAnswer();
  v5->_squareModeSupported = 1;
  v5->_backFlashSupported = AVGestaltGetBoolAnswer();
  v5->_frontFlashSupported = AVGestaltGetBoolAnswer();
  v5->_backTorchSupported = v5->_backFlashSupported;
  v5->_frontTorchSupported = 0;
  v5->_backHDRSupported = AVGestaltGetBoolAnswer();
  v5->_BOOL backAutomaticHDRSupported = AVGestaltGetBoolAnswer();
  v5->_backHDROnSupported = AVGestaltGetBoolAnswer();
  v5->_frontHDRSupported = AVGestaltGetBoolAnswer();
  v5->_BOOL frontAutomaticHDRSupported = AVGestaltGetBoolAnswer();
  v5->_frontHDROnSupported = AVGestaltGetBoolAnswer();
  v61 = [MEMORY[0x263F82670] currentDevice];
  v5->_previewSupportedDuringHDR = [v61 _graphicsQuality] == 100;

  v5->_backSmartHDRSupported = AVGestaltGetIntegerAnswerWithDefault() > 2;
  v5->_frontSmartHDRSupported = AVGestaltGetBoolAnswer();
  if (![(CAMCaptureCapabilities *)v5 isSmartHDRSupported]) {
    char BoolAnswer = AVGestaltGetBoolAnswer();
  }
  v5->_modernHDRSupported = BoolAnswer;
  BOOL backAutomaticHDRSupported = v5->_backAutomaticHDRSupported;
  if (backAutomaticHDRSupported) {
    BOOL backAutomaticHDRSupported = ![(CAMCaptureCapabilities *)v5 isSmartHDRSupported];
  }
  v5->_BOOL backAutomaticHDRSupported = backAutomaticHDRSupported;
  BOOL frontAutomaticHDRSupported = v5->_frontAutomaticHDRSupported;
  if (frontAutomaticHDRSupported) {
    BOOL frontAutomaticHDRSupported = ![(CAMCaptureCapabilities *)v5 isSmartHDRSupported];
  }
  v5->_BOOL frontAutomaticHDRSupported = frontAutomaticHDRSupported;
  v5->_HDRSettingAllowed = v6 < 15.0;
  uint64_t IntegerAnswerWithDefault = AVGestaltGetIntegerAnswerWithDefault();
  uint64_t v65 = 1;
  if (IntegerAnswerWithDefault > 59) {
    uint64_t v65 = 2;
  }
  v5->_defaultVFRMode = v65;
  v5->_backBurstSupported = AVGestaltGetBoolAnswer();
  v5->_frontBurstSupported = AVGestaltGetBoolAnswer();
  v5->_maximumBurstLength = AVGestaltGetIntegerAnswerWithDefault();
  v5->__backCaptureInterval = (double)AVGestaltGetIntegerAnswerWithDefault() / 1000.0;
  v5->__frontCaptureInterval = (double)AVGestaltGetIntegerAnswerWithDefault() / 1000.0;
  char v66 = AVGestaltGetBoolAnswer();
  char v67 = 0;
  v5->_videoSupported = v66;
  unint64_t v378 = a3;
  if ((unint64_t)a3 <= 4 && ((1 << a3) & 0x13) != 0) {
    char v67 = AVGestaltGetBoolAnswer();
  }
  v5->_stillDuringVideoSupported = v67;
  v5->_back720pMaxFPS = AVGestaltGetIntegerAnswerWithDefault();
  v5->_front720pMaxFPS = AVGestaltGetIntegerAnswerWithDefault();
  v5->_back1080pMaxFPS = AVGestaltGetIntegerAnswerWithDefault();
  v5->_front1080pMaxFPS = AVGestaltGetIntegerAnswerWithDefault();
  uint64_t v68 = AVGestaltGetIntegerAnswerWithDefault();
  uint64_t v69 = AVGestaltGetIntegerAnswerWithDefault();
  v5->_uint64_t back4kMaxFPS = v68;
  v5->_front4kMaxFPS = v69;
  v5->_back4k30VideoSupported = v68 > 29;
  v5->_front4k30VideoSupported = v69 > 29;
  v5->_back4k60VideoSupported = v68 > 59;
  v5->_front4k60VideoSupported = v69 > 59;
  v5->_back4k24VideoSupported = v68 > 59;
  v5->_front4k24VideoSupported = v69 > 59;
  int v70 = _os_feature_enabled_impl();
  int v71 = v70;
  if (v68 > 119) {
    BOOL v72 = v70;
  }
  else {
    BOOL v72 = 0;
  }
  v5->_back4k120VideoSupported = v72;
  v5->_backSlomoSupported = AVGestaltGetBoolAnswer();
  v5->_frontSlomoSupported = AVGestaltGetBoolAnswer();
  uint64_t v73 = AVGestaltGetIntegerAnswerWithDefault();
  uint64_t v74 = AVGestaltGetIntegerAnswerWithDefault();
  uint64_t v75 = AVGestaltGetIntegerAnswerWithDefault();
  int v350 = v71;
  if (v71) {
    int64_t v76 = v75;
  }
  else {
    int64_t v76 = 0;
  }
  v5->_backHighFrameRate4kMaxFPS = v76;
  uint64_t v77 = AVGestaltGetIntegerAnswerWithDefault();
  uint64_t v78 = AVGestaltGetIntegerAnswerWithDefault();
  v5->_backHighFrameRate720pMaxFPS = v73;
  v5->_frontHighFrameRate720pMaxFPS = v77;
  v79.i64[0] = v74;
  v79.i64[1] = v78;
  v80.i64[0] = v73;
  v80.i64[1] = v77;
  v5->_backHighFrameRate1080pMaxFPS = v74;
  v5->_frontHighFrameRate1080pMaxFPS = v78;
  int16x8_t v81 = (int16x8_t)vuzp1q_s32((int32x4_t)vcgtq_s64(v80, vdupq_n_s64(0xEFuLL)), (int32x4_t)vcgtq_s64(v79, vdupq_n_s64(0x77uLL)));
  *(int8x8_t *)v81.i8 = vand_s8((int8x8_t)vmovn_s32((int32x4_t)v81), (int8x8_t)0x1000100010001);
  *(_DWORD *)&v5->_back720p240Supported = vmovn_s16(v81).u32[0];
  v5->_back1080p240Supported = v74 > 239;
  v5->_front1080p240Supported = v78 > 239;
  v5->__tripleCamera1080p60Supported = AVGestaltGetIntegerAnswerWithDefault() > 59;
  v5->__backDualCameraVideoCapture4kMaxFPS = AVGestaltGetIntegerAnswerWithDefault();
  v5->__backWideDualCameraVideoCapture4kMaxFPS = AVGestaltGetIntegerAnswerWithDefault();
  v5->__backTripleCameraVideoCapture4kMaxFPS = AVGestaltGetIntegerAnswerWithDefault();
  v5->__actionModeAggregateDevice4k60Supported = v375;
  uint64_t v82 = v5->_hostProcess - 3;
  int v83 = AVGestaltGetBoolAnswer();
  if ((v82 & 0xFFFFFFFFFFFFFFFDLL) != 0) {
    BOOL v84 = v83;
  }
  else {
    BOOL v84 = 0;
  }
  v5->_backLivePhotoSupported = v84;
  v5->_frontLivePhotoSupported = v84;
  int v85 = AVGestaltGetBoolAnswer();
  if (v378 > 5)
  {
    BOOL v88 = 0;
    int v89 = 0;
    BOOL v90 = v366;
    BOOL v86 = v373;
    char v87 = v371;
  }
  else
  {
    BOOL v86 = v373;
    char v87 = v371;
    if (((1 << v378) & 0x15) != 0)
    {
      BOOL v88 = 0;
      int v89 = v85;
    }
    else
    {
      int v89 = 0;
      BOOL v88 = v85;
    }
    BOOL v90 = v366;
  }
  v5->_ctmSupported = v89;
  BOOL v345 = v88;
  v5->_ctmSupportSuppressed = v88;
  unsigned int v348 = v85;
  v5->_deviceSupportsCTM = v85;
  v5->_useReticleStroke = v90;
  v5->_useCTMTransientImageWell = v89 & v86;
  v5->_useCTMModeSelector = v89 & v87;
  v5->_allowControlDrawer = v89;
  if (v377) {
    char v91 = 0;
  }
  else {
    char v91 = AVGestaltGetBoolAnswer();
  }
  v5->_responsiveShutterSupported = v91;
  v5->_interactiveVideoFormatControlSupported = 1;
  if (v6 >= 17.0) {
    char v92 = 1;
  }
  else {
    char v92 = v89;
  }
  v5->_interactiveVideoFormatControlAlwaysEnabled = v92;
  if (v89) {
    char v93 = AVGestaltGetBoolAnswer();
  }
  else {
    char v93 = 0;
  }
  v5->_exposureSliderSupported = v93;
  if (v84) {
    char v94 = AVGestaltGetBoolAnswer();
  }
  else {
    char v94 = 0;
  }
  v5->_livePhotoAutoModeSupported = v94;
  char v95 = AVGestaltGetBoolAnswer();
  char v96 = 0;
  v5->_autoLowLightVideoSupported = v95;
  switch(v378)
  {
    case 0uLL:
    case 2uLL:
    case 4uLL:
      v5->_backLowLightSupported = AVGestaltGetBoolAnswer();
      v5->_frontLowLightSupported = AVGestaltGetBoolAnswer();
      char v97 = v6 >= 17.0 && (AVGestaltGetBoolAnswer() & 1) != 0 || v361;
      v5->__backPhotoModeNightModeDepthSupported = v97;
      if ([(CAMCaptureCapabilities *)v5 isBackLowLightSupported]) {
        BOOL v98 = CFPreferencesGetAppBooleanValue(@"CAMFeatureDevelopmentAllowSuperWideTeleNightMode", @"com.apple.camera", 0) != 0;
      }
      else {
        BOOL v98 = 0;
      }
      char v96 = 0;
      v5->__backSuperWideTeleNightModeSupported = v98;
      if (v378 <= 4 && v378 != 3) {
        goto LABEL_121;
      }
      break;
    case 1uLL:
LABEL_121:
      v5->_stereoAudioRecordingSupported = AVGestaltGetBoolAnswer();
      char v96 = AVGestaltGetBoolAnswer();
      break;
    default:
      break;
  }
  BOOL v349 = v96;
  v5->_HEVCEncodingSupported = v96;
  v5->_backPanoramaSupported = AVGestaltGetBoolAnswer();
  v5->_backTimelapseSupported = v59;
  v5->_frontTimelapseSupported = v59;
  if (AVGestaltGetBoolAnswer())
  {
    uint64_t v99 = 0x4002666666666666;
  }
  else
  {
    v100 = +[CAMTimelapseSettings sharedInstance];
    [v100 initialCaptureTimeInterval];
    uint64_t v99 = v101;
  }
  if (v29 != 0.0)
  {
    v102 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v416 = *(__CFString **)&v29;
      _os_log_impl(&dword_2099F8000, v102, OS_LOG_TYPE_DEFAULT, "Overriding time-lapse first shot delay as %f seconds", buf, 0xCu);
    }

    uint64_t v99 = *(void *)&v29;
  }
  *(void *)&v5->_timelapseFirstShotDelay = v99;
  *(_WORD *)&v5->_backTorchPatternSupported = v5->_backFlashSupported;
  if (MGGetBoolAnswer()) {
    char v103 = 1;
  }
  else {
    char v103 = MGGetBoolAnswer();
  }
  v5->_splitScreenSupported = v103;
  v5->_lockButtonAppropriateForShutter = 0;
  v104 = [MEMORY[0x263F82B60] mainScreen];
  [v104 _referenceBounds];
  v367 = v104;
  [v104 scale];
  CAMMGGetCGRectAnswer(@"VolumeUpButtonNormalizedCGRect", 0.0);
  CEKExpandNormalizedRect();
  UIRectRoundToScale();
  v5->__volumeUpButtonFrame.origin.x = v105;
  v5->__volumeUpButtonFrame.origin.y = v106;
  v5->__volumeUpButtonFrame.size.width = v107;
  v5->__volumeUpButtonFrame.size.height = v108;
  CAMMGGetCGRectAnswer(@"VolumeDownButtonNormalizedCGRect", 0.0);
  CEKExpandNormalizedRect();
  UIRectRoundToScale();
  v5->__volumeDownButtonFrame.origin.x = v109;
  v5->__volumeDownButtonFrame.origin.y = v110;
  v5->__volumeDownButtonFrame.size.width = v111;
  v5->__volumeDownButtonFrame.size.height = v112;
  CAMMGGetCGRectAnswer(@"UserIntentPhysicalButtonNormalizedCGRect", 1.0);
  CEKExpandNormalizedRect();
  UIRectRoundToScale();
  v5->__lockButtonFrame.origin.x = v113;
  v5->__lockButtonFrame.origin.y = v114;
  v5->__lockButtonFrame.size.width = v115;
  v5->__lockButtonFrame.size.height = v116;
  int v117 = MGGetBoolAnswer();
  uint64_t v118 = 4000000000;
  if (v117) {
    uint64_t v118 = 0;
  }
  v5->_maximumRecordedFileSize = v118;
  v5->_forceTouchSupported = MGGetBoolAnswer();
  int v119 = AVGestaltGetBoolAnswer();
  int v120 = AVGestaltGetBoolAnswer();
  int v121 = (AVGestaltGetBoolAnswer() & 1) != 0
      || [(CAMCaptureCapabilities *)v5 featureDevelopmentEmulateSuperWide];
  char v122 = obj ^ 1;
  int v123 = v121 & (obj ^ 1);
  int v376 = AVGestaltGetBoolAnswer();
  id obja = (id)objc_opt_new();
  if (v120) {
    [obja addObject:*MEMORY[0x263EF9638]];
  }
  int v372 = v89;
  int v374 = v120;
  int v124 = v119 & v120;
  int v125 = v119 & v123;
  if (v121) {
    [obja addObject:*MEMORY[0x263EF9660]];
  }
  int v126 = v124 & v121;
  int v127 = HIDWORD(v371) ^ 1;
  if (v125) {
    [obja addObject:*MEMORY[0x263EF9628]];
  }
  int v128 = v126 & v127;
  if (v124) {
    [obja addObject:*MEMORY[0x263EF9620]];
  }
  if (v128) {
    [obja addObject:*MEMORY[0x263EF9648]];
  }
  objc_storeStrong((id *)&v5->_expectedSupportedCameraModules, obja);
  BOOL v129 = v379 != 3 && v6 >= 17.0;
  v5->_fallbackCameraSupported = v129;
  BOOL v343 = v129;
  if (!v129)
  {
    unint64_t v133 = v378;
    goto LABEL_155;
  }
  uint64_t v130 = +[CAMFallbackConfiguration readFallbackDevicesFromDisk];
  fallbackCameraModules = v5->_fallbackCameraModules;
  v5->_fallbackCameraModules = (NSArray *)v130;

  v132 = v5->_fallbackCameraModules;
  unint64_t v133 = v378;
  if (!v132)
  {
LABEL_155:
    BOOL v135 = v376;
    goto LABEL_163;
  }
  if (v119) {
    BOOL v134 = [(NSArray *)v132 count] > 1;
  }
  else {
    BOOL v134 = 0;
  }
  BOOL v135 = v376;
  if (v374)
  {
    int v128 = [(NSArray *)v5->_fallbackCameraModules containsObject:*MEMORY[0x263EF9638]];
    if (!v121) {
      goto LABEL_162;
    }
    goto LABEL_161;
  }
  int v128 = 0;
  if (v121) {
LABEL_161:
  }
    int v121 = [(NSArray *)v5->_fallbackCameraModules containsObject:*MEMORY[0x263EF9660]];
LABEL_162:
  LOBYTE(v124) = 0;
  LOBYTE(v125) = v134 & v121 & v122;
  LOBYTE(v374) = v128;
  int v126 = v134 & v121 & v128;
  LOBYTE(v128) = v126 & v127;
  unint64_t v133 = v378;
LABEL_163:
  v5->_backQuadraWideSupported = v135;
  v5->_frontQuadraWideSupported = 0;
  v5->__quadraPortraitSupported = v135;
  if (v135) {
    double v136 = 2.0;
  }
  else {
    double v136 = 1.0;
  }
  v5->_quadraWideDisplayZoomFactor = v136;
  v5->_quadraWideRelativeZoomFactor = 2.0;
  v5->_backTelephotoSupported = v374;
  v5->_backDualSupported = v124;
  v5->_backSuperWideSupported = v121;
  v5->_backWideDualSupported = v125;
  v5->_backTripleCameraSupported = v128;
  char v137 = AVGestaltGetBoolAnswer();
  v5->_superWideAutoMacroSupported = v137;
  v5->_macroControlEnabledByDefault = v137;
  v5->_frontTelephotoSupported = 0;
  v5->_frontDualSupported = 0;
  v5->_frontSuperWideSupported = AVGestaltGetBoolAnswer();
  v5->_frontWideDualSupported = 0;
  v5->_frontTripleCameraSupported = 0;
  AVGestaltGetFloatAnswerWithDefault();
  float v139 = v138;
  double v140 = v138;
  AVGestaltGetFloatAnswerWithDefault();
  float v342 = v141;
  double v142 = v141;
  double v143 = (double)AVGestaltGetIntegerAnswerWithDefault();
  v5->_superWideDisplayZoomFactor = 0.5;
  v5->_wideDisplayZoomFactor = 1.0;
  v5->_telephotoDisplayZoomFactor = round(v140 + v140) * 0.5;
  v5->__backDualCameraSwitchOverZoomFactor = v140;
  v5->__frontDualCameraSwitchOverZoomFactor = 1.0;
  AVGestaltGetFloatAnswerWithDefault();
  v5->__backWideDualCameraSwitchOverZoomFactor = v144;
  if (v5->_frontSuperWideSupported) {
    double v145 = 2.0;
  }
  else {
    double v145 = 1.0;
  }
  v5->__frontWideDualCameraSwitchOverZoomFactor = v145;
  AVGestaltGetFloatAnswerWithDefault();
  v5->__backPhotoModeMaximumZoomFactor = v146;
  v5->__frontPhotoModeMaximumZoomFactor = v142;
  v5->__backVideoModeMaximumZoomFactor = (double)AVGestaltGetIntegerAnswerWithDefault();
  v5->__frontVideoModeMaximumZoomFactor = v143;
  double v147 = (double)AVGestaltGetIntegerAnswerWithDefault() / 100.0;
  double v148 = (double)AVGestaltGetIntegerAnswerWithDefault() / 100.0;
  __asm { FMOV            V0.2D, #1.0 }
  unint64_t v152 = v377;
  long long v347 = _Q0;
  if (v126)
  {
    v5->__backTripleCameraPhotoModeMaximumZoomFactor = v147;
    v5->__double backTripleCameraVideoModeMaximumZoomFactor = v148;
    [(CAMCaptureCapabilities *)v5 _backWideDualCameraSwitchOverZoomFactor];
    v5->__backDualPhotoModeMaximumZoomFactor = v147 / v153;
    double backTripleCameraVideoModeMaximumZoomFactor = v5->__backTripleCameraVideoModeMaximumZoomFactor;
    [(CAMCaptureCapabilities *)v5 _backWideDualCameraSwitchOverZoomFactor];
    double v148 = backTripleCameraVideoModeMaximumZoomFactor / v155;
    long long v156 = v347;
    v5->__backDualVideoModeMaximumZoomFactor = v148;
    int v157 = v350;
  }
  else
  {
    *(_OWORD *)&v5->__backTripleCameraPhotoModeMaximumZoomFactor = _Q0;
    v5->__backDualPhotoModeMaximumZoomFactor = v147;
    v5->__backDualVideoModeMaximumZoomFactor = v148;
    int v157 = v350;
    if ([(CAMCaptureCapabilities *)v5 isQuadraWideBinningReconfigurationSupportedForMode:1 devicePosition:0 videoConfiguration:0]&& ![(CAMCaptureCapabilities *)v5 isQuadraWideBinningReconfigurationSupportedForMode:2 devicePosition:0 videoConfiguration:0])
    {
      double v148 = v148 / v5->_quadraWideRelativeZoomFactor;
    }
    long long v156 = v347;
  }
  v5->__backDualSlomoModeMaximumZoomFactor = v148;
  v5->__frontDualPhotoModeMaximumZoomFactor = 1.0;
  v5->__frontDualVideoModeMaximumZoomFactor = 1.0;
  *(_OWORD *)&v5->__frontTripleCameraPhotoModeMaximumZoomFactor = v156;
  AVGestaltGetFloatAnswerWithDefault();
  double v159 = v158;
  if (v351) {
    double v159 = 6.0;
  }
  v5->__backWideDualCinematicModeMaximumZoomFactor = v159;
  BOOL v160 = v139 <= 3.0;
  v5->_continuousZoomSupportedForCinematicMode = v159 > 1.0;
  if (v159 > 1.0) {
    BOOL v160 = 0;
  }
  v5->__backDualCameraSupportedForCinematic = v160;
  char v161 = AVGestaltGetBoolAnswer();
  AVGestaltGetFloatAnswerWithDefault();
  v5->__backPortraitModeMaximumZoomFactor = v162;
  char v163 = v162 > 1.0 || v352;
  v5->_continuousZoomSupportedForPortraitMode = v163;
  if ([(CAMCaptureCapabilities *)v5 isTripleCameraSupported])
  {
    BOOL v164 = 1;
    double v165 = v358;
  }
  else
  {
    double v165 = v358;
    BOOL v164 = v121 && v379 != 3 && v6 >= 13.0 || v5->_backQuadraWideSupported;
  }
  v5->_zoomPlatterSupported = v164;
  if ([(CAMCaptureCapabilities *)v5 fallbackCameraEnabled])
  {
    v166 = [(CAMCaptureCapabilities *)v5 getSupportedCameraModules];
    if ([v166 containsObject:*MEMORY[0x263EF9648]])
    {
      v5->_zoomPlatterSupported = 1;
    }
    else
    {
      v167 = [(CAMCaptureCapabilities *)v5 getSupportedCameraModules];
      v5->_zoomPlatterSupported = [v167 containsObject:*MEMORY[0x263EF9660]];

      unint64_t v152 = v377;
    }
  }
  v5->_backSuperWideFocalLengthDisplayValue = AVGestaltGetIntegerAnswer();
  v5->_int64_t backWideFocalLengthDisplayValue = AVGestaltGetIntegerAnswer();
  v5->_backTelephotoFocalLengthDisplayValue = AVGestaltGetIntegerAnswer();
  if (v5->_backQuadraWideSupported) {
    v5->_backQuadraWideFocalLengthDisplayValue = 2 * v5->_backWideFocalLengthDisplayValue;
  }
  int v168 = MGGetSInt32Answer();
  int v169 = MGGetSInt32Answer();
  BOOL v170 = v379 == 3;
  v5->_mainScreenSizePixels.width = (double)v168;
  v5->_mainScreenSizePixels.height = (double)v169;
  if (v379 == 3) {
    uint64_t v171 = 1;
  }
  else {
    uint64_t v171 = v348;
  }
  if ((double)v169 / (double)v168 <= 1.5) {
    BOOL v170 = 0;
  }
  v5->__previewAspectRatioToggleSupportedForPhotoModes = v170;
  v5->_backPearlSupported = 0;
  v5->_frontPearlSupported = AVGestaltGetBoolAnswer();
  v5->_backTimeOfFlightSupported = AVGestaltGetBoolAnswer();
  v5->_frontTimeOfFlightSupported = 0;
  char v172 = AVGestaltGetBoolAnswer();
  if ((v133 & 1) != 0 || v133 >= 5) {
    BOOL v174 = 0;
  }
  else {
    BOOL v174 = v172;
  }
  v5->_backSpatialOverCaptureSupported = v174;
  v5->_frontSpatialOverCaptureSupported = 0;
  if (v171)
  {
    v175 = CAMPreferredLocale();
    v5->_sfCameraFontSupported = CEKIsSFCameraSupportedForLocale();
  }
  else
  {
    v5->_sfCameraFontSupported = 0;
  }
  v5->_overContentFlipButtonSupported = v171;
  BOOL v176 = v379 != 3;
  if (v6 < 14.1) {
    BOOL v176 = 0;
  }
  v5->_imagePickerUsesModernLayout = v176;
  v5->_zoomDialStyle = v171;
  int v177 = AVGestaltGetBoolAnswer();
  uint64_t v178 = 2;
  if (!v177) {
    uint64_t v178 = 0;
  }
  CFIndex v179 = v357;
  if (!v395) {
    CFIndex v179 = v178;
  }
  v5->_zoomPinchScalingMethod = v179;
  double v180 = 120.0;
  if (v355 > 0.0) {
    double v180 = v355;
  }
  double v181 = 2.4;
  if (v354 > 0.0) {
    double v181 = v354;
  }
  v5->_zoomPinchExponentialFactorDistance = v180;
  v5->_zoomPinchExponentialFactor = v181;
  double v182 = 180.0;
  if (v165 > 0.0) {
    double v182 = v165;
  }
  v5->_zoomPinchHybridLerpDistance = v182;
  if (v5->_frontSuperWideSupported)
  {
    v413[0] = &unk_26BDDE5F8;
    v413[1] = &unk_26BDDE628;
    v414[0] = &unk_26BDDE610;
    v414[1] = &unk_26BDDE610;
    v413[2] = &unk_26BDDE640;
    v414[2] = &unk_26BDDE658;
    uint64_t v183 = [NSDictionary dictionaryWithObjects:v414 forKeys:v413 count:3];
    FFCZoomBehaviorForCaptureMode = v5->__FFCZoomBehaviorForCaptureMode;
    v5->__FFCZoomBehaviorForCaptureMode = (NSDictionary *)v183;
    unint64_t v185 = v353;
  }
  else
  {
    LODWORD(v182) = 1.0;
    *(float *)&double v181 = v342;
    unint64_t v185 = v353;
    if (v342 <= 1.0) {
      goto LABEL_227;
    }
    v411 = &unk_26BDDE5F8;
    v412 = &unk_26BDDE670;
    uint64_t v186 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v412, &v411, 1, v182, v181, v354);
    FFCZoomBehaviorForCaptureMode = v5->__FFCZoomBehaviorForCaptureMode;
    v5->__FFCZoomBehaviorForCaptureMode = (NSDictionary *)v186;
  }

LABEL_227:
  v5->__processZoomWithoutUpscaleBack = 0;
  v5->__processZoomWithoutUpscaleFront = !v5->_frontSuperWideSupported;
  char v187 = AVGestaltGetBoolAnswer();
  char v188 = AVGestaltGetBoolAnswer();
  BOOL v189 = (v133 & 1) == 0 && v133 < 5;
  v5->_backSingleCameraPortraitModeSupported = v187;
  v5->_frontSingleCameraPortraitModeSupported = v188;
  if (v133 <= 5)
  {
    if (((1 << v133) & 0x2E) != 0) {
      v5->_HDREV0CaptureSupported = 0;
    }
    else {
      v5->_HDREV0CaptureSupported = AVGestaltGetBoolAnswer();
    }
  }
  uint64_t v190 = AVGestaltGetIntegerAnswerWithDefault();
  BOOL v191 = v190 > 0 && v349;
  v5->_HDR10BitVideoSupported = v191;
  BOOL v192 = v190 > 59 && v349;
  v5->_HDR10BitVideoSupports60FPS = v192;
  if (v157) {
    BOOL v193 = v190 > 119 && v349;
  }
  else {
    BOOL v193 = 0;
  }
  v5->__HDR10BitVideoSupports120FPS = v193;
  int v194 = AVGestaltGetBoolAnswer();
  if (v152) {
    BOOL v195 = 0;
  }
  else {
    BOOL v195 = v194;
  }
  v5->_proResVideoSupported = v195;
  v5->_proResMinimumDiskSpaceOverrideAsFractionOfSystemTotal = v359;
  v5->_proResMinimumDiskSpaceOverrideMegabytesRelativeToFreeSpace = v360;
  if (v195)
  {
    v196 = (void *)MGCopyAnswer();
    v197 = [v196 objectForKeyedSubscript:*MEMORY[0x263F8BD40]];
    unint64_t v198 = [v197 unsignedLongLongValue];

    uint64_t back4kMaxFPS = 60;
    uint64_t v200 = 30;
    if (v198 >= 0x1DCD650001) {
      uint64_t v201 = 60;
    }
    else {
      uint64_t v201 = 30;
    }
    if (v198 < 0x1DCD650001) {
      uint64_t v200 = 0;
    }
    if (v344) {
      uint64_t v201 = 60;
    }
    v5->__proResVideoMaxFPS1080p = v201;
    if (v344) {
      uint64_t v200 = 60;
    }
    v5->__proResVideoMaxFPS4k = v200;
    v5->__proResVideoExternalMaxFPS1080p = 60;
    if (v157) {
      uint64_t back4kMaxFPS = v5->_back4kMaxFPS;
    }
    v5->__proResVideoExternalMaxFPS4k = back4kMaxFPS;

    unint64_t v152 = v377;
  }
  if (v189)
  {
    v5->_backPortraitModeSupported = AVGestaltGetBoolAnswer();
    p_backPortraitModeSupported = &v5->_backPortraitModeSupported;
    char v203 = AVGestaltGetBoolAnswer();
  }
  else
  {
    char v203 = 0;
    v5->_backPortraitModeSupported = 0;
    p_backPortraitModeSupported = &v5->_backPortraitModeSupported;
  }
  v5->_frontPortraitModeSupported = v203;
  if ([(CAMCaptureCapabilities *)v5 fallbackCameraEnabled] && *p_backPortraitModeSupported) {
    v5->_backPortraitModeSupported = v5->_backWideDualSupported;
  }
  v5->_portraitModeOverlappingCapturesSupported = v356;
  if ((v133 | 4) == 4) {
    int v204 = AVGestaltGetBoolAnswer();
  }
  else {
    int v204 = 0;
  }
  if (v5->_backCameraSupported) {
    BOOL v205 = v204;
  }
  else {
    BOOL v205 = 0;
  }
  v5->_BOOL backCinematicModeSupported = v205;
  BOOL v206 = [(CAMCaptureCapabilities *)v5 fallbackCameraEnabled];
  BOOL backCinematicModeSupported = v5->_backCinematicModeSupported;
  if (v206 && v5->_backCinematicModeSupported)
  {
    BOOL backCinematicModeSupported = v5->_backWideDualSupported;
    v5->_BOOL backCinematicModeSupported = backCinematicModeSupported;
  }
  if (v5->_frontCameraSupported) {
    char v208 = v204;
  }
  else {
    char v208 = 0;
  }
  v5->_frontCinematicModeSupported = v208;
  if (backCinematicModeSupported) {
    char v209 = 1;
  }
  else {
    char v209 = v208;
  }
  v5->_cinematicModeSupported = v209;
  if (v204) {
    char v210 = AVGestaltGetBoolAnswer();
  }
  else {
    char v210 = 0;
  }
  v5->_cinematic4KSupported = v210;
  char v211 = AVGestaltGetBoolAnswer();
  v5->_backLiveStageLightSupported = v211;
  v5->_frontLiveStageLightSupported = v211;
  v5->_hasFilteringEntitlement = v189;
  v5->_hasSystemTelephonyOfAnyKind = MGGetBoolAnswer();
  v5->_lowEndHardware = MGGetBoolAnswer();
  v5->_pipelinedStillImageProcessingSupported = AVGestaltGetBoolAnswer();
  int v212 = AVGestaltGetBoolAnswer();
  v5->_uint64_t portraitEffectsSupported = v212;
  if (!v212)
  {
    v5->__photoModeLightingControlSupported = 0;
    int v214 = v372;
LABEL_292:
    v5->_portraitInPhotoModeBehavior = 0;
    if ((v185 & 0x8000000000000000) != 0) {
      goto LABEL_296;
    }
    goto LABEL_293;
  }
  unsigned int v213 = v343 & ((v133 > 5) | (0x11u >> v133));
  v5->__photoModeLightingControlSupported = v213;
  int v214 = v372;
  if (v213 != 1) {
    goto LABEL_292;
  }
  uint64_t v215 = 17;
  if (v339) {
    uint64_t v215 = 25;
  }
  v5->_portraitInPhotoModeBehavior = v215;
  if ((v185 & 0x8000000000000000) == 0)
  {
LABEL_293:
    v216 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v216, OS_LOG_TYPE_DEFAULT))
    {
      portraitInPhotoModeBehavior = (__CFString *)v5->_portraitInPhotoModeBehavior;
      *(_DWORD *)buf = 134218240;
      v416 = portraitInPhotoModeBehavior;
      __int16 v417 = 2048;
      v418 = (__CFString *)v185;
      _os_log_impl(&dword_2099F8000, v216, OS_LOG_TYPE_DEFAULT, "Overriding Portrait in Photo mode behavior from %lu to %lu", buf, 0x16u);
    }

    v5->_portraitInPhotoModeBehavior = v185;
  }
LABEL_296:
  v5->__frontStageLightPortaitEffectsSupported = AVGestaltGetBoolAnswer();
  v5->__backStageLightPortaitEffectsSupported = AVGestaltGetBoolAnswer();
  unsigned __int8 v218 = AVGestaltGetBoolAnswer();
  v5->_portraitEffectIntensitySupported = v218 & (v379 != 3);
  uint64_t portraitEffectsSupported = v5->_portraitEffectsSupported;
  if ((v5->_portraitEffectsSupported & v218) != 0) {
    uint64_t portraitEffectsSupported = 2;
  }
  v5->_supportedPortraitLightingVersion = portraitEffectsSupported;
  if (v152) {
    char v220 = 0;
  }
  else {
    char v220 = AVGestaltGetBoolAnswer();
  }
  v5->_deferredPortraitRenderingSupported = v220;
  char v221 = AVGestaltGetBoolAnswer();
  if (v152) {
    BOOL v222 = 0;
  }
  else {
    BOOL v222 = v221;
  }
  v5->_deferredProcessingSupported = v222;
  v5->_allowPortraitDescriptionOverlay = v6 < 15.0;
  if (v152) {
    char v223 = 0;
  }
  else {
    char v223 = v161 | v362;
  }
  v5->__rearPortraitAspectRatioSupported = AVGestaltGetBoolAnswer() | BYTE4(v363);
  v5->__frontPortraitAspectRatioSupported = AVGestaltGetBoolAnswer() | BYTE4(v363);
  BOOL v224 = (v133 & 1) != 0 || v133 >= 5;
  char v225 = !v224;
  v5->_previewQualityStillImageFilteringForPhotoModeSupported = v223;
  char v226 = v161 | BYTE4(v362);
  if (v224) {
    char v226 = 0;
  }
  v5->__rearPhotoModeDepthSuggestionSupported = v226;
  if ([(CAMCaptureCapabilities *)v5 fallbackCameraEnabled]
    && v5->__rearPhotoModeDepthSuggestionSupported)
  {
    v5->__rearPhotoModeDepthSuggestionSupported = v5->_backWideDualSupported;
  }
  v5->__frontPhotoModeDepthSuggestionSupported = v225 & (v161 | v363);
  v5->_captureOnTouchDown = AVGestaltGetBoolAnswer() | v214;
  char v227 = AVGestaltGetBoolAnswer();
  v5->_neuralEngineSupported = v227;
  if ([(CAMCaptureCapabilities *)v5 fallbackCameraEnabled])
  {
    char v227 = 0;
    unint64_t v228 = v378;
  }
  else
  {
    unint64_t v228 = v378;
    if (!*p_backPortraitModeSupported && !v5->_frontPortraitModeSupported) {
      char v227 = 0;
    }
  }
  v229 = off_263F9E000;
  v5->_depthEffectApertureSupported = v227;
  BOOL v230 = ((v364 & 1) != 0 || AVGestaltGetBoolAnswer()) && v5->_deferredProcessingSupported;
  v5->__rearPortraitDeferredProcessingSupported = v230;
  BOOL v231 = ((v364 & 0x100000000) != 0 || AVGestaltGetBoolAnswer()) && v5->_deferredProcessingSupported;
  v5->__frontPortraitDeferredProcessingSupported = v231;
  v5->__rearPortraitSemanticStylesSupported = AVGestaltGetBoolAnswer() | BYTE4(v365);
  v5->__frontPortraitSemanticStylesSupported = AVGestaltGetBoolAnswer() | BYTE4(v365);
  v5->_semanticDevelopmentSupported = AVGestaltGetBoolAnswer();
  v5->_enableSemanticDevelopmentFilterDebugging = v368;
  v5->_contentAwareDistortionCorrectionSupported = AVGestaltGetBoolAnswer();
  if ((v228 | 4) == 4) {
    v5->_linearDNGSupported = AVGestaltGetBoolAnswer();
  }
  if (v214 && AVGestaltGetBoolAnswer())
  {
    v5->_semanticStylesSupport = 15;
    uint64_t v232 = AVGestaltGetIntegerAnswerWithDefault();
    int v233 = v340;
    if (v232 > 0) {
      int v233 = 1;
    }
    int v234 = v233 & (HIDWORD(v340) ^ 1);
    v5->_BOOL smartStylesSupported = v234;
    if (v234 == 1)
    {
      char v235 = _os_feature_enabled_impl();
      BOOL smartStylesSupported = v5->_smartStylesSupported;
    }
    else
    {
      BOOL smartStylesSupported = 0;
      char v235 = 0;
    }
    v5->__smartStylesAdditionalSystemStyleSupport = v235;
    v5->_semanticStylesVersion = smartStylesSupported;
    BOOL v237 = v341;
    if (!smartStylesSupported) {
      BOOL v237 = 0;
    }
    v5->_smartStylesShowExtraControls = v237;
    v5->_allowSystemSmartStylesInPicker = smartStylesSupported;
  }
  else
  {
    v5->_semanticStylesSupport = !v345 && AVGestaltGetBoolAnswer();
  }
  if (v228 >= 3)
  {
    if (v228 == 3)
    {
      char v238 = 1;
      goto LABEL_355;
    }
    if (v228 != 4)
    {
LABEL_352:
      char v238 = 0;
      goto LABEL_355;
    }
  }
  if (v5->_semanticStylesVersion) {
    goto LABEL_352;
  }
  char v238 = AVGestaltGetBoolAnswer();
LABEL_355:
  v5->_liveFilteringSupported = v238;
  v5->_videoStabilizationControlSupported = AVGestaltGetBoolAnswer();
  v5->__preferWideDualPortrait = v5->__quadraPortraitSupported;
  char v239 = AVGestaltGetBoolAnswer();
  char v240 = v365;
  if (v379 == 3) {
    char v240 = 1;
  }
  v5->__wideDualPortraitLowLightSupported = v239;
  v5->_minimumMachineReadableCodeNormalizedHeight = 0.05;
  if (v152) {
    BOOL v241 = 1;
  }
  else {
    BOOL v241 = !v5->_neuralEngineSupported;
  }
  char v242 = !v241;
  v5->_imageAnalysisSupported = v242;
  if (v241) {
    char v240 = 0;
  }
  v5->_documentScanningSupported = v240;
  v243 = (void *)MGCopyAnswer();
  double v244 = 0.0;
  if ((unint64_t)[v243 count] >= 2)
  {
    v245 = [v243 objectAtIndexedSubscript:1];
    [v245 doubleValue];
    double v244 = v246;
  }
  v247 = [v243 objectAtIndexedSubscript:0];
  [v247 doubleValue];
  double v249 = v248;

  double v250 = v249 * ((double)(int)MGGetSInt32Answer() / -25.4);
  v5->_frontCameraInset = (double)(int)MGGetSInt32Answer() * 0.5 + v250;
  BOOL v252 = v244 > v249 && v243 != 0;
  v5->_frontCameraOnRightEdge = v252;
  BOOL v254 = (v228 & 1) == 0 && v228 < 5;
  v5->_flashMitigationSupported = v254;
  if (!v152)
  {
    v5->_librarySelectionMockAutomationModeEnabled = CFPreferencesGetAppBooleanValue(@"CAMFeatureDevelopmentPeopleProximityMockAutomationMode", @"com.apple.camera", 0) != 0;
    v5->_librarySelectionMockLocationShiftingEnabled = CFPreferencesGetAppBooleanValue(@"CAMFeatureDevelopmentLibrarySelectionMockLocationShiftingEnabled", @"com.apple.camera", 0) != 0;
    if (v6 <= 18.0)
    {
      *(_WORD *)&v5->_librarySelectionSupported = 257;
    }
    else
    {
      BOOL v261 = +[CAMPreferencesUtilities BOOLInCameraDomainForKey:@"CAMFeatureDevelopmentAllowSharedLibraryNewHardware"];
      v5->_librarySelectionSupported = v261;
      v5->_peopleProximityDetectionSupported = v261;
      if (!v261) {
        goto LABEL_446;
      }
    }
    v279 = (NSString *)CFPreferencesCopyAppValue(@"CAMFeatureDevelopmentPeopleProximityDetectAdditionalEmail", @"com.apple.camera");
    peopleProximityDetectAdditionalEmail = v5->_peopleProximityDetectAdditionalEmail;
    v5->_peopleProximityDetectAdditionalEmail = v279;

    buf[0] = 0;
    v5->_peopleProximityUsesDeviceDiscovery = CFPreferencesGetAppBooleanValue(@"CAMFeatureDevelopmentPeopleProximityUseDeviceDiscovery", @"com.apple.camera", buf) != 0;
    if (!buf[0] || v5->_librarySelectionMockAutomationModeEnabled) {
      v5->_peopleProximityUsesDeviceDiscovery = 1;
    }
    CFIndex v281 = CFPreferencesGetAppIntegerValue(@"CAMFeatureDevelopmentPeopleProximityInitialScanDuration", @"com.apple.camera", 0);
    uint64_t v282 = 5;
    if (v281) {
      uint64_t v282 = v281;
    }
    v5->_peopleProximityInitialScanDuration = (double)v282;
    CFIndex v283 = CFPreferencesGetAppIntegerValue(@"CAMFeatureDevelopmentPeopleProximitySubsequentScanDuration", @"com.apple.camera", 0);
    uint64_t v284 = 20;
    if (v283) {
      uint64_t v284 = v283;
    }
    v5->_peopleProximitySubsequentScanDuration = (double)v284;
    CFIndex v285 = CFPreferencesGetAppIntegerValue(@"CAMFeatureDevelopmentPeopleProximityInitialScanRate", @"com.apple.camera", 0);
    uint64_t v286 = 30;
    if (v285) {
      uint64_t v286 = v285;
    }
    v5->_peopleProximityInitialScanRate = v286;
    CFIndex v287 = CFPreferencesGetAppIntegerValue(@"CAMFeatureDevelopmentPeopleProximitySubsequentScanRate", @"com.apple.camera", 0);
    uint64_t v288 = 10;
    if (v287) {
      uint64_t v288 = v287;
    }
    v5->_peopleProximitySubsequentScanRate = v288;
    v5->_peopleProximityScanWaitInterval = (double)CFPreferencesGetAppIntegerValue(@"CAMFeatureDevelopmentPeopleProximityScanWaitInterval", @"com.apple.camera", 0);
    Boolean keyExistsAndHasValidFormat = 0;
    int v289 = CFPreferencesGetAppBooleanValue(@"CAMFeatureDevelopmentPeopleProximityScanIndefinitelyValue", @"com.apple.camera", &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat) {
      BOOL v290 = v289 == 0;
    }
    else {
      BOOL v290 = 1;
    }
    char v291 = !v290;
    v5->_peopleProximityScanIndefinitely = v291;
    CFIndex v292 = CFPreferencesGetAppIntegerValue(@"CAMFeatureDevelopmentPeopleProximityAutoOnResetTimeout", @"com.apple.camera", 0);
    double v293 = (double)v292;
    if (!v292) {
      double v293 = 300.0;
    }
    v5->_librarySelectionAutoOnResetTimeout = v293;
    CFIndex v294 = CFPreferencesGetAppIntegerValue(@"CAMFeatureDevelopmentPeopleProximityUserChoiceResetTimeout", @"com.apple.camera", 0);
    double v295 = (double)v294;
    if (!v294) {
      double v295 = 300.0;
    }
    v5->_librarySelectionUserChoiceResetTimeout = v295;
    CFIndex v296 = CFPreferencesGetAppIntegerValue(@"CAMFeatureDevelopmentPeopleProximitySameLocationResetTimeout", @"com.apple.camera", 0);
    double v297 = (double)v296;
    if (!v296) {
      double v297 = 3600.0;
    }
    v5->_librarySelectionSameLocationResetTimeout = v297;
    CFIndex v298 = CFPreferencesGetAppIntegerValue(@"CAMFeatureDevelopmentPeopleProximityTripResetTimeout", @"com.apple.camera", 0);
    double v299 = (double)v298;
    if (!v298) {
      double v299 = 86400.0;
    }
    v5->_librarySelectionTripResetTimeout = v299;
    Boolean v393 = 0;
    int v300 = CFPreferencesGetAppBooleanValue(@"CAMFeatureDevelopmentPeopleProximityIgnoreNearbyRequirements", @"com.apple.camera", &v393);
    if (v393) {
      BOOL v301 = v300 == 0;
    }
    else {
      BOOL v301 = 0;
    }
    char v302 = !v301;
    v5->_peopleProximityIgnoreNearbyRequirements = v302;
LABEL_446:
    v5->_peopleProximityPersistenceSupported = 0;
    v5->_frontEnhancedHEICResolutionSupported = 0;
    BOOL v256 = v376;
    if (v5->_linearDNGSupported && v376)
    {
      v409 = &unk_26BDDE5F8;
      v410 = &unk_26BDDFFE0;
      uint64_t v303 = [NSDictionary dictionaryWithObjects:&v410 forKeys:&v409 count:1];
      backCameraSupportedRAWResolutionsByMode = v5->__backCameraSupportedRAWResolutionsByMode;
      v5->__backCameraSupportedRAWResolutionsByMode = (NSDictionary *)v303;

      v407 = &unk_26BDDE5F8;
      v408 = &unk_26BDDE688;
      uint64_t v305 = [NSDictionary dictionaryWithObjects:&v408 forKeys:&v407 count:1];
      backCameraDefaultRAWResolutionByMode = v5->__backCameraDefaultRAWResolutionByMode;
      v5->__backCameraDefaultRAWResolutionByMode = (NSDictionary *)v305;

      v405 = &unk_26BDDE5F8;
      v406 = &unk_26BDDFFF8;
      uint64_t v307 = [NSDictionary dictionaryWithObjects:&v406 forKeys:&v405 count:1];
      frontCameraSupportedRAWResolutionsByMode = v5->__frontCameraSupportedRAWResolutionsByMode;
      v5->__frontCameraSupportedRAWResolutionsByMode = (NSDictionary *)v307;

      v403 = &unk_26BDDE5F8;
      v404 = &unk_26BDDE640;
      uint64_t v309 = [NSDictionary dictionaryWithObjects:&v404 forKeys:&v403 count:1];
      frontCameraDefaultRAWResolutionByMode = v5->__frontCameraDefaultRAWResolutionByMode;
      v5->__frontCameraDefaultRAWResolutionByMode = (NSDictionary *)v309;

      if (v6 >= 17.0) {
        int v255 = 1;
      }
      else {
        int v255 = HIDWORD(v341);
      }
      if ((v376 & 1) == 0)
      {
        LOBYTE(v255) = 0;
        BOOL v256 = 0;
        goto LABEL_381;
      }
      v381 = v243;
      LOBYTE(v376) = 1;
    }
    else
    {
      if (v6 >= 17.0) {
        int v255 = 1;
      }
      else {
        int v255 = HIDWORD(v341);
      }
      if (!v376)
      {
        LOBYTE(v255) = 0;
        goto LABEL_381;
      }
      v381 = v243;
    }
    id v330 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v331 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    if (v255)
    {
      [v330 setObject:&unk_26BDE0010 forKeyedSubscript:&unk_26BDDE6B8];
      v332 = &unk_26BDDE6A0;
      [v331 setObject:&unk_26BDDE6A0 forKeyedSubscript:&unk_26BDDE6B8];
      v333 = &unk_26BDE0028;
      v334 = &unk_26BDE0058;
    }
    else
    {
      v333 = &unk_26BDE0040;
      v332 = &unk_26BDDE640;
      v334 = &unk_26BDE0070;
    }
    [v330 setObject:v333 forKeyedSubscript:&unk_26BDDE5F8];
    [v331 setObject:v332 forKeyedSubscript:&unk_26BDDE5F8];
    [v330 setObject:v334 forKeyedSubscript:&unk_26BDDE6D0];
    [v331 setObject:v332 forKeyedSubscript:&unk_26BDDE6D0];
    objc_storeStrong((id *)&v5->__backCameraSupportedCompressedResolutionsByMode, v330);
    objc_storeStrong((id *)&v5->__backCameraDefaultCompressedResolutionByMode, v331);
    v401 = &unk_26BDDE5F8;
    v402 = &unk_26BDE0088;
    uint64_t v335 = [NSDictionary dictionaryWithObjects:&v402 forKeys:&v401 count:1];
    frontCameraSupportedCompressedResolutionsByMode = v5->__frontCameraSupportedCompressedResolutionsByMode;
    v5->__frontCameraSupportedCompressedResolutionsByMode = (NSDictionary *)v335;

    v399 = &unk_26BDDE5F8;
    v400 = &unk_26BDDE640;
    uint64_t v337 = [NSDictionary dictionaryWithObjects:&v400 forKeys:&v399 count:1];
    frontCameraDefaultCompressedResolutionByMode = v5->__frontCameraDefaultCompressedResolutionByMode;
    v5->__frontCameraDefaultCompressedResolutionByMode = (NSDictionary *)v337;

    unint64_t v152 = v377;
    unint64_t v228 = v378;
    v229 = off_263F9E000;
    char v257 = BYTE4(v346);
    int v214 = v372;
    BOOL v256 = v376;
    v243 = v381;
    goto LABEL_382;
  }
  LOBYTE(v255) = 0;
  BOOL v256 = 0;
  v5->_frontEnhancedHEICResolutionSupported = 0;
LABEL_381:
  char v257 = BYTE4(v346);
LABEL_382:
  v5->_focalLengthPickerSupported = v255 & v374 | v257;
  int64_t backWideFocalLengthDisplayValue = v5->_backWideFocalLengthDisplayValue;
  if (backWideFocalLengthDisplayValue == 24)
  {
    uint64_t v260 = 0;
    v259 = (NSArray *)&unk_26BDE00B8;
  }
  else if (backWideFocalLengthDisplayValue == 26)
  {
    v259 = (NSArray *)&unk_26BDE00D0;
    uint64_t v260 = 3;
  }
  else
  {
    v262 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v262, OS_LOG_TYPE_ERROR)) {
      -[CAMCaptureCapabilities initWithHostProcess:](&v5->_backWideFocalLengthDisplayValue, v262);
    }

    uint64_t v260 = 0;
    v5->_focalLengthPickerSupported = 0;
    v259 = (NSArray *)&unk_26BDE00A0;
  }
  v5->_baseFocalLengthForWideCamera = v260;
  availableCustomLenses = v5->_availableCustomLenses;
  v5->_availableCustomLenses = v259;

  if (v5->_focalLengthPickerSupported)
  {
    v380 = v243;
    v264 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSArray count](v259, "count") + 1);
    [v264 addObject:&unk_26BDE00E8];
    long long v386 = 0u;
    long long v387 = 0u;
    long long v384 = 0u;
    long long v385 = 0u;
    uint64_t v265 = [(NSArray *)v259 countByEnumeratingWithState:&v384 objects:v398 count:16];
    if (v265)
    {
      uint64_t v266 = v265;
      uint64_t v267 = *(void *)v385;
      do
      {
        for (uint64_t i = 0; i != v266; ++i)
        {
          if (*(void *)v385 != v267) {
            objc_enumerationMutation(v259);
          }
          v269 = *(void **)(*((void *)&v384 + 1) + 8 * i);
          if ([v269 integerValue])
          {
            v397[0] = &unk_26BDDE5F8;
            v397[1] = v269;
            v270 = [MEMORY[0x263EFF8C0] arrayWithObjects:v397 count:2];
            [v264 addObject:v270];
          }
        }
        uint64_t v266 = [(NSArray *)v259 countByEnumeratingWithState:&v384 objects:v398 count:16];
      }
      while (v266);
    }
    [v264 addObject:v259];
    objc_storeStrong((id *)&v5->_supportedCustomLensGroups, v264);

    unint64_t v152 = v377;
    unint64_t v228 = v378;
    v229 = off_263F9E000;
    int v214 = v372;
    v243 = v380;
  }
  AVGestaltGetFloatAnswerWithDefault();
  char v271 = 0;
  v5->__maximumZoomFactorWithout24MPUpscale = v5->__backWideDualCameraSwitchOverZoomFactor * v272;
  v5->__overlapping48MPCapturesSupported = BYTE4(v369);
  v5->_useFullResolutionThumbnailForRAWCaptures = v256;
  if (v228 <= 4 && ((1 << v228) & 0x15) != 0) {
    char v271 = AVGestaltGetBoolAnswer();
  }
  v5->_zoomPIPSupported = v271;
  v5->__zoomPIPSupportedForSlomo = v271 & BYTE4(v368);
  char v273 = AVGestaltGetBoolAnswer();
  char v274 = _os_feature_enabled_impl();
  if (v152) {
    char v275 = 0;
  }
  else {
    char v275 = v274;
  }
  v5->_externalStorageSupported = v275 & v273;
  v5->_pipelinedStillImageProcessingSupported = 1;
  int v276 = AVGestaltGetBoolAnswer();
  v5->_proResLogColorSpaceSupported = v276;
  if (v276)
  {
    char v277 = v369;
    if (v5->_back4k120VideoSupported) {
      v278 = (NSArray *)&unk_26BDE0100;
    }
    else {
      v278 = (NSArray *)&unk_26BDE0118;
    }
    v5->_supportedProResColorSpaces = v278;
  }
  else
  {
    v5->_supportedProResColorSpaces = (NSArray *)MEMORY[0x263EFFA68];
    char v277 = v369;
  }
  v5->_shouldPersistPreferences = 0;
  unint64_t hostProcess = v5->_hostProcess;
  if (hostProcess <= 4 && ((1 << hostProcess) & 0x13) != 0) {
    v5->_shouldPersistPreferences = 1;
  }
  v5->_actionButtonSupported = MGGetBoolAnswer();
  if ((v228 | 4) != 4) {
    char v277 = 0;
  }
  char v312 = CAMIsCameraButtonAvailable();
  char v313 = v277 & (v312 ^ 1);
  v5->_allowHalfPressSimulation = v313;
  v5->_halfPressSupported = v277 | v312;
  v5->_halfPressOverlayInProcess = v313;
  CAMMGGetCGRectAnswer(@"CameraButtonNormalizedCGRect", 0.0);
  CEKExpandNormalizedRect();
  UIRectRoundToScale();
  v5->__cameraButtonFrame.origin.x = v314;
  v5->__cameraButtonFrame.origin.y = v315;
  v5->__cameraButtonFrame.size.width = v316;
  v5->__cameraButtonFrame.size.height = v317;
  v5->_cameraButtonSupported = v5->_halfPressSupported;
  v5->_whiteBalanceLockingForVideoRecordingSupported = (v228 < 5) & (0x13u >> v228);
  v5->_minimumDiskSpaceReserved = AVGestaltGetIntegerAnswerWithDefault();
  if (AVGestaltGetBoolAnswer())
  {
    if ([(__objc2_class *)v229[259] BOOLInCameraDomainForKey:@"CAMFeatureDevelopmentAllowSpatialMode"])char v318 = 1; {
    else
    }
      char v318 = _os_feature_enabled_impl();
  }
  else
  {
    char v318 = 0;
  }
  if (v152) {
    char v319 = 0;
  }
  else {
    char v319 = v318;
  }
  v5->_BOOL spatialModeSupported = v319;
  BOOL v320 = [(CAMCaptureCapabilities *)v5 fallbackCameraEnabled];
  BOOL spatialModeSupported = v5->_spatialModeSupported;
  if (v320 && v5->_spatialModeSupported)
  {
    BOOL spatialModeSupported = v5->_backWideDualSupported;
    v5->_BOOL spatialModeSupported = spatialModeSupported;
  }
  v5->_spatialModeTrueVideoSupported = spatialModeSupported;
  if (!v152
    && ((AVGestaltGetBoolAnswer() & 1) != 0
     || [(__objc2_class *)v229[259] BOOLInCameraDomainForKey:@"CAMFeatureDevelopmentAllowSpatialVideoCapture"]))
  {
    char v322 = v318 ^ 1;
  }
  else
  {
    char v322 = 0;
  }
  v5->_spatialVideoInVideoModeSupported = v322;
  if (v228 <= 4 && ((1 << v228) & 0x15) != 0)
  {
    id v323 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    id v324 = v323;
    if (v214)
    {
      [v323 addObject:&unk_26BDDE640];
      [v324 addObject:&unk_26BDDE6E8];
    }
  }
  else
  {
    id v324 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  }
  if (v346) {
    [v324 addObject:&unk_26BDDE700];
  }
  objc_storeStrong((id *)&v5->__supportedModesForPauseResumeVideo, v324);
  v5->_proRawJpegXLSupported = AVGestaltGetBoolAnswer();
  v5->_backQuadraSuperWideSupported = AVGestaltGetBoolAnswer();
  if ((v228 | 4) == 4) {
    v5->_shouldPreventConnectionHandover = 1;
  }
  if (AVGestaltGetBoolAnswer()) {
    char v325 = 1;
  }
  else {
    char v325 = [(__objc2_class *)v229[259] BOOLInCameraDomainForKey:@"CAMFeatureDevelopmentAllowCinematicAudio"];
  }
  v5->_cinematicAudioSupported = v325;
  v5->_windRemovalSupported = AVGestaltGetBoolAnswer();
  if (AVGestaltGetBoolAnswer()) {
    char v326 = 1;
  }
  else {
    char v326 = [(__objc2_class *)v229[259] BOOLInCameraDomainForKey:@"CAMFeatureDevelopmentAllowTrueVideo"];
  }
  v5->_trueVideoSupported = v326;
  if (MGGetBoolAnswer()) {
    char v327 = 1;
  }
  else {
    char v327 = [(__objc2_class *)v229[259] BOOLInCameraDomainForKey:@"CAMSimulateForcedShutterSound"];
  }
  v5->_regionalShutterSoundEnabled = v327;
  if (v228 <= 5) {
    v5->_multipleCaptureFeaturesSupported = 0x100000001uLL >> (8 * v228);
  }
  CAMSignpostWithIDAndArgs(90, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
  v328 = v5;

LABEL_497:
  return v5;
}

- (double)_doubleForKey:(id)a3 applicationID:(id)a4
{
  id v4 = (void *)CFPreferencesCopyAppValue((CFStringRef)a3, (CFStringRef)a4);
  double v5 = 0.0;
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [v4 doubleValue];
    double v5 = v6;
  }

  return v5;
}

- (BOOL)isCameraSupportedForDevicePosition:(int64_t)a3
{
  if (a3 == 1) {
    return [(CAMCaptureCapabilities *)self isFrontCameraSupported];
  }
  if (a3) {
    return 0;
  }
  return [(CAMCaptureCapabilities *)self isBackCameraSupported];
}

- (CGRect)frameForPhysicalButton:(int64_t)a3
{
  double v3 = *MEMORY[0x263F001A8];
  double v4 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v5 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v6 = *(double *)(MEMORY[0x263F001A8] + 24);
  switch(a3)
  {
    case 1:
      [(CAMCaptureCapabilities *)self _volumeUpButtonFrame];
      break;
    case 2:
      [(CAMCaptureCapabilities *)self _volumeDownButtonFrame];
      break;
    case 3:
      [(CAMCaptureCapabilities *)self _lockButtonFrame];
      break;
    case 6:
      [(CAMCaptureCapabilities *)self _cameraButtonFrame];
      break;
    default:
      break;
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (BOOL)mirroredFrontCapturesSupportedForMode:(int64_t)a3
{
  BOOL v5 = [(CAMCaptureCapabilities *)self isMirroredFrontCapturesSupported];
  if (v5)
  {
    LOBYTE(v5) = 0;
    if ((unint64_t)a3 <= 7)
    {
      if (((1 << a3) & 0x51) != 0)
      {
        LOBYTE(v5) = 1;
      }
      else if (((1 << a3) & 0x86) != 0)
      {
        LOBYTE(v5) = [(CAMCaptureCapabilities *)self isMirroredFrontVideosSupported];
      }
    }
  }
  return v5;
}

- (BOOL)isResponsiveShutterSupportedForMode:(int64_t)a3
{
  BOOL result = [(CAMCaptureCapabilities *)self responsiveShutterSupported];
  if ((a3 & 0xFFFFFFFFFFFFFFFBLL) != 0) {
    return 0;
  }
  return result;
}

- (BOOL)isFlashSupportedForDevicePosition:(int64_t)a3
{
  if (!-[CAMCaptureCapabilities isCameraSupportedForDevicePosition:](self, "isCameraSupportedForDevicePosition:")) {
    return 0;
  }
  if (a3 != 1)
  {
    if (!a3)
    {
      return [(CAMCaptureCapabilities *)self isBackFlashSupported];
    }
    return 0;
  }
  return [(CAMCaptureCapabilities *)self isFrontFlashSupported];
}

- (BOOL)isTorchSupportedForDevicePosition:(int64_t)a3
{
  if (!-[CAMCaptureCapabilities isCameraSupportedForDevicePosition:](self, "isCameraSupportedForDevicePosition:")) {
    return 0;
  }
  if (a3 != 1)
  {
    if (!a3)
    {
      return [(CAMCaptureCapabilities *)self isBackTorchSupported];
    }
    return 0;
  }
  return [(CAMCaptureCapabilities *)self isFrontTorchSupported];
}

- (BOOL)isHDRSupportedForDevicePosition:(int64_t)a3
{
  if (!-[CAMCaptureCapabilities isCameraSupportedForDevicePosition:](self, "isCameraSupportedForDevicePosition:")) {
    return 0;
  }
  if (a3 != 1)
  {
    if (!a3)
    {
      return [(CAMCaptureCapabilities *)self isBackHDRSupported];
    }
    return 0;
  }
  return [(CAMCaptureCapabilities *)self isFrontHDRSupported];
}

- (BOOL)isHDRSupportedForMode:(int64_t)a3 devicePosition:(int64_t)a4
{
  BOOL v5 = [(CAMCaptureCapabilities *)self isHDRSupportedForDevicePosition:a4];
  unsigned int v6 = (0x251u >> a3) & 1;
  if ((unint64_t)a3 > 9) {
    LOBYTE(v6) = 0;
  }
  if (v5) {
    return v6;
  }
  else {
    return 0;
  }
}

- (BOOL)isSmartHDRSupported
{
  if ([(CAMCaptureCapabilities *)self isBackSmartHDRSupported]) {
    return 1;
  }
  return [(CAMCaptureCapabilities *)self isFrontSmartHDRSupported];
}

- (BOOL)isSmartHDRSupportedForMode:(int64_t)a3 devicePosition:(int64_t)a4
{
  if (!-[CAMCaptureCapabilities isHDRSupportedForMode:devicePosition:](self, "isHDRSupportedForMode:devicePosition:", a3))return 0; {
  if (a4 != 1)
  }
  {
    if (!a4)
    {
      return [(CAMCaptureCapabilities *)self isBackSmartHDRSupported];
    }
    return 0;
  }
  return [(CAMCaptureCapabilities *)self isFrontSmartHDRSupported];
}

- (BOOL)isHDR10BitSlomoSupportedForDevice:(int64_t)a3
{
  BOOL result = [(CAMCaptureCapabilities *)self isHDR10BitVideoSupported];
  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) != 0) {
    return 0;
  }
  return result;
}

- (BOOL)shouldSuspendVideoHDRForHDRMode:(int64_t)a3 captureMode:(int64_t)a4
{
  BOOL v6 = [(CAMCaptureCapabilities *)self isSmartHDRSupported];
  BOOL v7 = ((1 << a4) & 0x251) != 0 && a3 == 0;
  if ((unint64_t)a4 > 9) {
    BOOL v7 = 0;
  }
  return v6 && v7;
}

- (BOOL)isTimerSupportedForMode:(int64_t)a3
{
  return ((unint64_t)a3 < 0xA) & (0x251u >> a3);
}

- (BOOL)isLivePhotoSupported
{
  if ([(CAMCaptureCapabilities *)self isBackLivePhotoSupported]) {
    return 1;
  }
  return [(CAMCaptureCapabilities *)self isFrontLivePhotoSupported];
}

- (BOOL)isLivePhotoSupportedForDevicePosition:(int64_t)a3
{
  if (!-[CAMCaptureCapabilities isCameraSupportedForDevicePosition:](self, "isCameraSupportedForDevicePosition:")) {
    return 0;
  }
  if (a3 != 1)
  {
    if (!a3)
    {
      return [(CAMCaptureCapabilities *)self isBackLivePhotoSupported];
    }
    return 0;
  }
  return [(CAMCaptureCapabilities *)self isFrontLivePhotoSupported];
}

- (BOOL)isLivePhotoSupportedForMode:(int64_t)a3 devicePosition:(int64_t)a4
{
  return (a3 == 9 || !a3)
      && [(CAMCaptureCapabilities *)self isLivePhotoSupportedForDevicePosition:a4];
}

- (BOOL)isAutomaticHDRSupportedForDevicePosition:(int64_t)a3
{
  if (!-[CAMCaptureCapabilities isCameraSupportedForDevicePosition:](self, "isCameraSupportedForDevicePosition:")) {
    return 0;
  }
  if (a3 != 1)
  {
    if (!a3)
    {
      return [(CAMCaptureCapabilities *)self isBackAutomaticHDRSupported];
    }
    return 0;
  }
  return [(CAMCaptureCapabilities *)self isFrontAutomaticHDRSupported];
}

- (BOOL)isHDROnSupportedForDevicePosition:(int64_t)a3
{
  if (!-[CAMCaptureCapabilities isCameraSupportedForDevicePosition:](self, "isCameraSupportedForDevicePosition:")) {
    return 0;
  }
  if (a3 != 1)
  {
    if (!a3)
    {
      return [(CAMCaptureCapabilities *)self isBackHDROnSupported];
    }
    return 0;
  }
  return [(CAMCaptureCapabilities *)self isFrontHDROnSupported];
}

- (BOOL)isLightingControlSupportedForMode:(int64_t)a3
{
  BOOL v5 = [(CAMCaptureCapabilities *)self arePortraitEffectsSupported];
  if (v5)
  {
    if (a3 == 6)
    {
      LOBYTE(v5) = 1;
    }
    else if (a3)
    {
      LOBYTE(v5) = 0;
    }
    else
    {
      LOBYTE(v5) = [(CAMCaptureCapabilities *)self _photoModeLightingControlSupported];
    }
  }
  return v5;
}

- (int64_t)supportedEffectSetForDevicePosition:(int64_t)a3
{
  if (a3 == 1)
  {
    BOOL v4 = [(CAMCaptureCapabilities *)self _frontStageLightPortaitEffectsSupported];
    goto LABEL_5;
  }
  if (!a3)
  {
    BOOL v4 = [(CAMCaptureCapabilities *)self _backStageLightPortaitEffectsSupported];
LABEL_5:
    BOOL v5 = v4;
    goto LABEL_7;
  }
  BOOL v5 = 0;
LABEL_7:
  int64_t v6 = [(CAMCaptureCapabilities *)self supportedPortraitLightingVersion];
  BOOL v7 = [(CAMCaptureCapabilities *)self arePortraitEffectsSupported];
  int64_t v8 = 2;
  if (v6 == 2) {
    int64_t v8 = 3;
  }
  if (!v5) {
    int64_t v8 = 1;
  }
  if (v7) {
    return v8;
  }
  else {
    return 0;
  }
}

- (BOOL)isBurstSupportedForMode:(int64_t)a3 device:(int64_t)a4
{
  BOOL v7 = [(CAMCaptureCapabilities *)self isCameraSupportedForDevice:a4];
  if (v7)
  {
    unint64_t v8 = a3 & 0xFFFFFFFFFFFFFFFBLL;
    if ((unint64_t)(a4 - 8) < 4 || a4 == 1) {
      LOBYTE(v7) = [(CAMCaptureCapabilities *)self isFrontBurstSupported];
    }
    else {
      LOBYTE(v7) = [(CAMCaptureCapabilities *)self isBackBurstSupported];
    }
    if (v8) {
      LOBYTE(v7) = 0;
    }
  }
  return v7;
}

- (double)captureIntervalForDevice:(int64_t)a3
{
  BOOL v5 = +[CAMUserPreferences preferences];
  [(CAMCaptureCapabilities *)self _backCaptureInterval];
  double v7 = v6;
  [(CAMCaptureCapabilities *)self _frontCaptureInterval];
  double v9 = v8;
  uint64_t v10 = [v5 overriddenBackCaptureInterval];
  uint64_t v11 = [v5 overriddenFrontCaptureInterval];
  if (unint64_t)a3 > 0xB || ((0xFDu >> a3))
  {
    if ((double)v10 / 1000.0 > 0.0) {
      double v7 = (double)v10 / 1000.0;
    }
  }
  else if ((double)v11 / 1000.0 <= 0.0)
  {
    double v7 = v9;
  }
  else
  {
    double v7 = (double)v11 / 1000.0;
  }

  return v7;
}

- (BOOL)is4k24VideoSupportedForDevice:(int64_t)a3
{
  BOOL v5 = -[CAMCaptureCapabilities isCameraSupportedForDevice:](self, "isCameraSupportedForDevice:");
  if (v5)
  {
    if ((unint64_t)(a3 - 8) < 4 || a3 == 1)
    {
      LOBYTE(v5) = [(CAMCaptureCapabilities *)self isFront4k24VideoSupported];
    }
    else
    {
      LOBYTE(v5) = [(CAMCaptureCapabilities *)self isBack4k24VideoSupported];
    }
  }
  return v5;
}

- (BOOL)is4k30VideoSupportedForDevice:(int64_t)a3
{
  BOOL v5 = -[CAMCaptureCapabilities isCameraSupportedForDevice:](self, "isCameraSupportedForDevice:");
  if (v5)
  {
    if ((unint64_t)(a3 - 8) < 4 || a3 == 1)
    {
      LOBYTE(v5) = [(CAMCaptureCapabilities *)self isFront4k30VideoSupported];
    }
    else
    {
      LOBYTE(v5) = [(CAMCaptureCapabilities *)self isBack4k30VideoSupported];
    }
  }
  return v5;
}

- (BOOL)is1080p60VideoSupportedForDevice:(int64_t)a3
{
  if ((unint64_t)a3 > 0xA)
  {
    LOBYTE(v8) = 0;
    return v8;
  }
  uint64_t v10 = v3;
  if (((1 << a3) & 0x7D) == 0)
  {
    if (((1 << a3) & 0x702) != 0)
    {
      int64_t v8 = [(CAMCaptureCapabilities *)self front1080pMaxFPS];
      goto LABEL_6;
    }
    LODWORD(v8) = [(CAMCaptureCapabilities *)self _isTripleCamera1080p60Supported];
    if (!v8) {
      return v8;
    }
  }
  int64_t v8 = [(CAMCaptureCapabilities *)self back1080pMaxFPS];
LABEL_6:
  LOBYTE(v8) = v8 > 59;
  return v8;
}

- (BOOL)is1080p120VideoSupportedForDevice:(int64_t)a3
{
  int v5 = _os_feature_enabled_impl();
  if ((a3 | 2) == 2)
  {
    if (v5) {
      LOBYTE(v5) = [(CAMCaptureCapabilities *)self back1080pMaxFPS] > 119;
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (BOOL)is4k60VideoSupportedForDevice:(int64_t)a3
{
  LODWORD(v5) = -[CAMCaptureCapabilities isCameraSupportedForDevice:](self, "isCameraSupportedForDevice:");
  if (v5)
  {
    LOBYTE(v5) = 0;
    switch(a3)
    {
      case 0:
      case 2:
      case 3:
      case 5:
        LOBYTE(v5) = [(CAMCaptureCapabilities *)self isBack4k60VideoSupported];
        break;
      case 1:
      case 8:
      case 10:
        LOBYTE(v5) = [(CAMCaptureCapabilities *)self isFront4k60VideoSupported];
        break;
      case 4:
        LODWORD(v5) = [(CAMCaptureCapabilities *)self isBack4k60VideoSupported];
        if (v5)
        {
          int64_t v5 = [(CAMCaptureCapabilities *)self _backDualCameraVideoCapture4kMaxFPS];
          goto LABEL_15;
        }
        break;
      case 6:
        LODWORD(v5) = [(CAMCaptureCapabilities *)self isBack4k60VideoSupported];
        if (v5)
        {
          int64_t v5 = [(CAMCaptureCapabilities *)self _backWideDualCameraVideoCapture4kMaxFPS];
          goto LABEL_15;
        }
        break;
      case 7:
        LODWORD(v5) = [(CAMCaptureCapabilities *)self isBack4k60VideoSupported];
        if (v5)
        {
          int64_t v5 = [(CAMCaptureCapabilities *)self _backTripleCameraVideoCapture4kMaxFPS];
LABEL_15:
          LOBYTE(v5) = v5 > 59;
        }
        break;
      default:
        return v5;
    }
  }
  return v5;
}

- (BOOL)is4K120VideoSupportedForDevice:(int64_t)a3
{
  if (!-[CAMCaptureCapabilities isCameraSupportedForDevice:](self, "isCameraSupportedForDevice:") || (a3 | 2) != 2) {
    return 0;
  }
  return [(CAMCaptureCapabilities *)self isBack4k120VideoSupported];
}

- (BOOL)isSupportedVideoConfiguration:(int64_t)a3 forMode:(int64_t)a4 videoEncodingBehavior:(int64_t)a5 outputToExternalStorage:(BOOL)a6
{
  if (a5 == 2) {
    return [(CAMCaptureCapabilities *)self isProResVideoSupportedForMode:a4 videoConfiguration:a3 outputToExternalStorage:a6];
  }
  if (a5 == 1) {
    return [(CAMCaptureCapabilities *)self isHEVCEncodingSupported];
  }
  unsigned int v6 = ((unint64_t)a3 > 0xE) | (0x1CFFu >> a3);
  if (a5) {
    LOBYTE(v6) = 0;
  }
  return v6 & 1;
}

- (BOOL)isSupportedVideoConfiguration:(int64_t)a3 forMode:(int64_t)a4 device:(int64_t)a5 spatialVideoEnabled:(BOOL)a6 trueVideoEnabled:(BOOL)a7
{
  if ((unint64_t)a3 > 0xE)
  {
    if ((unint64_t)(a3 - 10000) >= 6) {
      return 0;
    }
    goto LABEL_8;
  }
  if (((1 << a3) & 0x1F6E) != 0)
  {
LABEL_8:
    if (!a6) {
      return -[CAMCaptureCapabilities isSupportedVideoConfiguration:forMode:device:](self, "isSupportedVideoConfiguration:forMode:device:");
    }
    return 0;
  }
  if (((1 << a3) & 0x6010) != 0 && (a6 || a7)) {
    return 0;
  }
  return -[CAMCaptureCapabilities isSupportedVideoConfiguration:forMode:device:](self, "isSupportedVideoConfiguration:forMode:device:");
}

- (BOOL)is720p240SupportedForDevice:(int64_t)a3
{
  if (!-[CAMCaptureCapabilities isSlomoSupportedForDevice:](self, "isSlomoSupportedForDevice:")
    || (unint64_t)a3 > 0xA)
  {
    return 0;
  }
  if (((1 << a3) & 0x2D) != 0)
  {
    return [(CAMCaptureCapabilities *)self isBack720p240Supported];
  }
  if (((1 << a3) & 0x502) == 0) {
    return 0;
  }
  return [(CAMCaptureCapabilities *)self isFront720p240Supported];
}

- (BOOL)_is1080p120SlomoSupportedForDevice:(int64_t)a3
{
  if (!-[CAMCaptureCapabilities isSlomoSupportedForDevice:](self, "isSlomoSupportedForDevice:")
    || (unint64_t)a3 > 0xA)
  {
    return 0;
  }
  if (((1 << a3) & 0x2D) != 0)
  {
    return [(CAMCaptureCapabilities *)self isBack1080p120Supported];
  }
  if (((1 << a3) & 0x502) == 0) {
    return 0;
  }
  return [(CAMCaptureCapabilities *)self isFront1080p120Supported];
}

- (BOOL)is1080p240SupportedForDevice:(int64_t)a3
{
  if (!-[CAMCaptureCapabilities isSlomoSupportedForDevice:](self, "isSlomoSupportedForDevice:")
    || (unint64_t)a3 > 0xA)
  {
    return 0;
  }
  if (((1 << a3) & 0x2D) != 0)
  {
    return [(CAMCaptureCapabilities *)self isBack1080p240Supported];
  }
  if (((1 << a3) & 0x502) == 0) {
    return 0;
  }
  return [(CAMCaptureCapabilities *)self isFront1080p240Supported];
}

- (BOOL)isPanoramaSupportedForDevice:(int64_t)a3
{
  if (!-[CAMCaptureCapabilities isCameraSupportedForDevice:](self, "isCameraSupportedForDevice:")
    || (unint64_t)a3 > 8)
  {
    return 0;
  }
  if (((1 << a3) & 0x2D) != 0)
  {
    return [(CAMCaptureCapabilities *)self isBackPanoramaSupported];
  }
  if (((1 << a3) & 0x102) == 0) {
    return 0;
  }
  return [(CAMCaptureCapabilities *)self isFrontPanoramaSupported];
}

- (BOOL)isTimelapseSupportedForDevice:(int64_t)a3
{
  if (!-[CAMCaptureCapabilities isCameraSupportedForDevice:](self, "isCameraSupportedForDevice:")
    || (unint64_t)a3 > 8)
  {
    return 0;
  }
  if (((1 << a3) & 0x2D) != 0)
  {
    return [(CAMCaptureCapabilities *)self isBackTimelapseSupported];
  }
  if (((1 << a3) & 0x102) == 0) {
    return 0;
  }
  return [(CAMCaptureCapabilities *)self isFrontTimelapseSupported];
}

- (BOOL)isPortraitModeSupported
{
  if ([(CAMCaptureCapabilities *)self isBackPortraitModeSupported]) {
    return 1;
  }
  return [(CAMCaptureCapabilities *)self isFrontPortraitModeSupported];
}

- (BOOL)isPortraitModeSupportedForDevice:(int64_t)a3
{
  BOOL v5 = -[CAMCaptureCapabilities isCameraSupportedForDevice:](self, "isCameraSupportedForDevice:");
  if (v5)
  {
    uint64_t v6 = (unint64_t)(a3 - 1) > 0xA ? 0 : qword_209C7B450[a3 - 1];
    BOOL v5 = [(CAMCaptureCapabilities *)self isPortraitModeSupportedForDevicePosition:v6];
    if (v5)
    {
      switch(a3)
      {
        case 0:
        case 1:
          LOBYTE(v5) = 1;
          break;
        case 2:
        case 3:
        case 5:
          LOBYTE(v5) = [(CAMCaptureCapabilities *)self isBackSingleCameraPortraitModeSupported];
          break;
        case 4:
          BOOL v5 = [(CAMCaptureCapabilities *)self isBackDualSupported];
          if (v5) {
            goto LABEL_16;
          }
          break;
        case 6:
          BOOL v5 = [(CAMCaptureCapabilities *)self isBackWideDualSupported];
          if (v5) {
LABEL_16:
          }
            LOBYTE(v5) = ![(CAMCaptureCapabilities *)self _disablePortraitBravoDevices];
          break;
        case 7:
          LOBYTE(v5) = [(CAMCaptureCapabilities *)self isBackTripleCameraSupported];
          break;
        case 8:
        case 10:
          LOBYTE(v5) = [(CAMCaptureCapabilities *)self isFrontSingleCameraPortraitModeSupported];
          break;
        case 9:
          LOBYTE(v5) = [(CAMCaptureCapabilities *)self isFrontPearlSupported];
          break;
        default:
          LOBYTE(v5) = 0;
          break;
      }
    }
  }
  return v5;
}

- (BOOL)isPortraitZoomSupportedForDevicePosition:(int64_t)a3
{
  if (a3) {
    return 0;
  }
  BOOL v5 = [(CAMCaptureCapabilities *)self isPortraitModeSupportedForDevice:4];
  BOOL v6 = [(CAMCaptureCapabilities *)self isPortraitModeSupportedForDevice:6];
  if (v5 && v6) {
    return 1;
  }
  return [(CAMCaptureCapabilities *)self continuousZoomSupportedForPortraitMode];
}

- (BOOL)portraitZoomSupported
{
  if ([(CAMCaptureCapabilities *)self isPortraitZoomSupportedForDevicePosition:1])
  {
    return 1;
  }
  return [(CAMCaptureCapabilities *)self isPortraitZoomSupportedForDevicePosition:0];
}

- (BOOL)usePortraitFrontFacingZoomedCaptureDeviceFormat
{
  if ([(CAMCaptureCapabilities *)self _disablePortraitFrontFacingZoomedCaptureDeviceFormat])
  {
    return 0;
  }
  [(CAMCaptureCapabilities *)self maximumZoomFactorForMode:0 device:1 videoConfiguration:0 videoStabilizationStrength:0];
  return v4 > 1.0;
}

- (BOOL)isAspectRatioCropSupportedForMode:(int64_t)a3 devicePosition:(int64_t)a4
{
  BOOL v7 = [(CAMCaptureCapabilities *)self isAspectRatioCropSupported];
  if (v7)
  {
    if (a3 == 6)
    {
      if (a4)
      {
        LOBYTE(v7) = [(CAMCaptureCapabilities *)self _frontPortraitAspectRatioSupported];
      }
      else
      {
        LOBYTE(v7) = [(CAMCaptureCapabilities *)self _rearPortraitAspectRatioSupported];
      }
    }
    else
    {
      LOBYTE(v7) = a3 == 0;
    }
  }
  return v7;
}

- (NSArray)supportedAspectRatioCropValues
{
  if (![(CAMCaptureCapabilities *)self isAspectRatioCropSupported]) {
    return (NSArray *)&unk_26BDE0130;
  }
  if ([(CAMCaptureCapabilities *)self _isAspectRatioCropThreeTwoSupported]) {
    return (NSArray *)&unk_26BDE0148;
  }
  return (NSArray *)&unk_26BDE0160;
}

- (BOOL)isCTMVideoCaptureSupportedForMode:(int64_t)a3
{
  return !a3 && [(CAMCaptureCapabilities *)self isCTMSupported];
}

- (BOOL)isTrueVideoSupportedForMode:(int64_t)a3
{
  return !a3 || a3 == 9;
}

- (BOOL)isSpatialOverCaptureSupported
{
  if ([(CAMCaptureCapabilities *)self isBackSpatialOverCaptureSupported]) {
    return 1;
  }
  return [(CAMCaptureCapabilities *)self isFrontSpatialOverCaptureSupported];
}

- (unint64_t)spatialOverCaptureSupportForMode:(int64_t)a3 device:(int64_t)a4
{
  if (![(CAMCaptureCapabilities *)self _isSpatialOverCaptureSupportedForDevice:a4])return 0; {
  if (a3)
  }
  {
    if (a3 == 6) {
      return [(CAMCaptureCapabilities *)self _allowSpatialOverCaptureInPortraitMode];
    }
    return 0;
  }
  return 3;
}

- (BOOL)_isSpatialOverCaptureSupportedForDevice:(int64_t)a3
{
  if (![(CAMCaptureCapabilities *)self isCTMSupported] || (unint64_t)a3 > 0xA) {
    return 0;
  }
  if (((1 << a3) & 0xD1) == 0)
  {
    if (((1 << a3) & 0x702) != 0)
    {
      return [(CAMCaptureCapabilities *)self isFrontSpatialOverCaptureSupported];
    }
    return 0;
  }
  return [(CAMCaptureCapabilities *)self isBackSpatialOverCaptureSupported];
}

- (BOOL)isLowLightSupported
{
  if ([(CAMCaptureCapabilities *)self isBackLowLightSupported]) {
    return 1;
  }
  return [(CAMCaptureCapabilities *)self isFrontLowLightSupported];
}

- (BOOL)isLowLightSupportedForMode:(int64_t)a3 device:(int64_t)a4
{
  if (a3 == 6)
  {
    switch(a4)
    {
      case 0:
      case 4:
      case 7:
        if (![(CAMCaptureCapabilities *)self isBackLowLightSupported]) {
          return 0;
        }
        BOOL result = [(CAMCaptureCapabilities *)self continuousZoomSupportedForPortraitMode];
        break;
      case 6:
        BOOL result = [(CAMCaptureCapabilities *)self _wideDualPortraitLowLightSupported];
        break;
      default:
        return 0;
    }
  }
  else if (a3 || (unint64_t)a4 > 0xA)
  {
    return 0;
  }
  else if (((1 << a4) & 0xD5) != 0)
  {
    return [(CAMCaptureCapabilities *)self isBackLowLightSupported];
  }
  else if (((1 << a4) & 0x702) != 0)
  {
    return [(CAMCaptureCapabilities *)self isFrontLowLightSupported];
  }
  else
  {
    return [(CAMCaptureCapabilities *)self _backSuperWideTeleNightModeSupported];
  }
  return result;
}

- (BOOL)isLowLightSupportedForMode:(int64_t)a3 device:(int64_t)a4 zoomFactor:(double)a5
{
  int64_t v8 = [(CAMCaptureCapabilities *)self resolvedDeviceForDesiredDevice:a4 mode:a3 videoConfiguration:0 videoStabilizationStrength:0 spatialVideoEnabled:0];
  BOOL v9 = [(CAMCaptureCapabilities *)self isLowLightSupportedForMode:a3 device:v8];
  uint64_t v10 = 0;
  if ((unint64_t)(v8 - 1) <= 0xA) {
    uint64_t v10 = qword_209C7B450[v8 - 1];
  }
  if ([(CAMCaptureCapabilities *)self isDualDeviceDisparitySupportedForMode:a3 devicePosition:v10])
  {
    if (v8 == 6)
    {
      [(CAMCaptureCapabilities *)self _backWideDualCameraSwitchOverZoomFactor];
    }
    else if (v8 == 4)
    {
      [(CAMCaptureCapabilities *)self _backDualCameraSwitchOverZoomFactor];
    }
    else
    {
      double v11 = 1.79769313e308;
    }
    if (v11 < a5) {
      return 0;
    }
  }
  return v9;
}

- (BOOL)isNightModeWithDepthSupportedForMode:(int64_t)a3 device:(int64_t)a4
{
  BOOL v7 = -[CAMCaptureCapabilities isLowLightSupportedForMode:device:](self, "isLowLightSupportedForMode:device:");
  if (v7)
  {
    if (a3)
    {
      LOBYTE(v7) = a3 == 6;
    }
    else if (unint64_t)(a4 - 1) < 0xB && ((0x781u >> (a4 - 1)))
    {
      LOBYTE(v7) = 0;
    }
    else
    {
      LOBYTE(v7) = [(CAMCaptureCapabilities *)self _backPhotoModeNightModeDepthSupported];
    }
  }
  return v7;
}

- (unint64_t)lowLightPreviewOverlayStyleForDevicePosition:(int64_t)a3 sensitiveToChangingDisplayFeedback:(BOOL)a4 sensitiveToInitialFeedback:(BOOL)a5 duration:(double)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  if (a3 == 1)
  {
    unint64_t result = [(CAMCaptureCapabilities *)self frontLowLightPreviewOverlayStyle];
  }
  else if (a3)
  {
    unint64_t result = 0;
  }
  else
  {
    unint64_t result = [(CAMCaptureCapabilities *)self backLowLightPreviewOverlayStyle];
  }
  BOOL v11 = a6 < 2.0 && a3 == 1;
  unint64_t v12 = 3;
  if (!v11) {
    unint64_t v12 = 1;
  }
  if (v7) {
    unint64_t v12 = 2;
  }
  if (v8) {
    unint64_t v12 = 4;
  }
  if (!result) {
    return v12;
  }
  return result;
}

- (BOOL)isSingleCameraPortraitModeSupportedForDevicePosition:(int64_t)a3
{
  if (a3 == 1) {
    return [(CAMCaptureCapabilities *)self isFrontSingleCameraPortraitModeSupported];
  }
  if (a3) {
    return 0;
  }
  return [(CAMCaptureCapabilities *)self isBackSingleCameraPortraitModeSupported];
}

- (BOOL)isTorchPatternSupportedForDevicePosition:(int64_t)a3
{
  if (!-[CAMCaptureCapabilities isCameraSupportedForDevicePosition:](self, "isCameraSupportedForDevicePosition:")) {
    return 0;
  }
  if (a3 != 1)
  {
    if (!a3)
    {
      return [(CAMCaptureCapabilities *)self isBackTorchPatternSupported];
    }
    return 0;
  }
  return [(CAMCaptureCapabilities *)self isFrontTorchPatternSupported];
}

- (BOOL)isFlashSupportedForMode:(int64_t)a3 devicePosition:(int64_t)a4
{
  return (unint64_t)a3 <= 6
      && ((1 << a3) & 0x51) != 0
      && [(CAMCaptureCapabilities *)self isFlashSupportedForDevicePosition:a4];
}

- (BOOL)isTorchSupportedForMode:(int64_t)a3 devicePosition:(int64_t)a4
{
  return (unint64_t)a3 <= 7
      && ((1 << a3) & 0x86) != 0
      && [(CAMCaptureCapabilities *)self isTorchSupportedForDevicePosition:a4];
}

- (BOOL)isFlashOrTorchSupportedForMode:(int64_t)a3 devicePosition:(int64_t)a4
{
  if (-[CAMCaptureCapabilities isFlashSupportedForMode:devicePosition:](self, "isFlashSupportedForMode:devicePosition:"))
  {
    return 1;
  }
  return [(CAMCaptureCapabilities *)self isTorchSupportedForMode:a3 devicePosition:a4];
}

- (BOOL)isAutoLowLightVideoSupportedForMode:(int64_t)a3 videoConfiguration:(int64_t)a4 videoEncodingBehavior:(int64_t)a5
{
  BOOL v9 = [(CAMCaptureCapabilities *)self isAutoLowLightVideoSupported];
  if (v9)
  {
    BOOL v9 = [(CAMCaptureCapabilities *)self _isVariableFramerateVideoSupportedForVideoEncodingBehavior:a5];
    if (v9)
    {
      if ((unint64_t)(a4 - 10000) < 6 || (char v10 = 0, (unint64_t)a4 <= 7) && ((1 << a4) & 0xE1) != 0) {
        char v10 = 1;
      }
      if (a3 == 1) {
        LOBYTE(v9) = v10;
      }
      else {
        LOBYTE(v9) = 0;
      }
    }
  }
  return v9;
}

- (BOOL)_isVariableFramerateVideoSupportedForVideoEncodingBehavior:(int64_t)a3
{
  return (unint64_t)a3 < 2;
}

- (BOOL)isVariableFramerateVideoSupportedForMode:(int64_t)a3 videoConfiguration:(int64_t)a4 videoEncodingBehavior:(int64_t)a5 outputToExternalStorage:(BOOL)a6 spatialVideoEnabled:(BOOL)a7 prefersHDR10BitVideo:(BOOL)a8
{
  BOOL v10 = a6;
  int v15 = [(CAMCaptureCapabilities *)self isVariableFramerateVideoSupported];
  if (v15)
  {
    BOOL v16 = [(CAMCaptureCapabilities *)self _isVariableFramerateVideoSupportedForVideoEncodingBehavior:a5];
    LOBYTE(v15) = 0;
    if (v16 && !a7)
    {
      if (a4)
      {
        LOBYTE(v15) = [(CAMCaptureCapabilities *)self _isVariableFramerateVideoSupportedForResolvedVideoConfiguration:a4];
      }
      else
      {
        LOBYTE(v21) = a8;
        int64_t v17 = [(CAMCaptureCapabilities *)self resolvedVideoConfigurationForMode:a3 device:1 videoEncodingBehavior:a5 videoConfiguration:0 outputToExternalStorage:v10 spatialVideoEnabled:0 prefersHDR10BitVideo:v21];
        LOBYTE(v22) = a8;
        int64_t v18 = [(CAMCaptureCapabilities *)self resolvedVideoConfigurationForMode:a3 device:0 videoEncodingBehavior:a5 videoConfiguration:0 outputToExternalStorage:v10 spatialVideoEnabled:0 prefersHDR10BitVideo:v22];
        BOOL v19 = [(CAMCaptureCapabilities *)self _isVariableFramerateVideoSupportedForResolvedVideoConfiguration:v17];
        int v15 = v19 | [(CAMCaptureCapabilities *)self _isVariableFramerateVideoSupportedForResolvedVideoConfiguration:v18];
      }
      if (a3 != 1) {
        LOBYTE(v15) = 0;
      }
    }
  }
  return v15;
}

- (BOOL)_isVariableFramerateVideoSupportedForResolvedVideoConfiguration:(int64_t)a3
{
  return ((unint64_t)a3 < 0xA) & (0x2E2u >> a3);
}

- (int64_t)resolvedVideoConfigurationForMode:(int64_t)a3 device:(int64_t)a4 videoEncodingBehavior:(int64_t)a5 videoConfiguration:(int64_t)a6 outputToExternalStorage:(BOOL)a7 spatialVideoEnabled:(BOOL)a8 prefersHDR10BitVideo:(BOOL)a9
{
  BOOL v26 = a7;
  uint64_t v9 = a6;
  uint64_t v32 = *MEMORY[0x263EF8340];
  if (a6) {
    return v9;
  }
  if (a3 == 1)
  {
    BOOL v16 = &unk_26BDE01A8;
    int64_t v17 = &unk_26BDE0190;
    BOOL v18 = !a8;
  }
  else
  {
    if (a3 != 2)
    {
      if (a3 == 8) {
        int v15 = &unk_26BDE0178;
      }
      else {
        int v15 = 0;
      }
      goto LABEL_13;
    }
    BOOL v19 = [(CAMCaptureCapabilities *)self isBack4k120VideoSupported];
    BOOL v16 = &unk_26BDE01D8;
    int64_t v17 = &unk_26BDE01C0;
    BOOL v18 = !v19 || !a9;
  }
  if (v18) {
    int v15 = v16;
  }
  else {
    int v15 = v17;
  }
LABEL_13:
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v20 = [v15 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (!v20) {
    return 0;
  }
  uint64_t v21 = v20;
  uint64_t v22 = *(void *)v28;
LABEL_15:
  uint64_t v23 = 0;
  while (1)
  {
    if (*(void *)v28 != v22) {
      objc_enumerationMutation(v15);
    }
    uint64_t v9 = [*(id *)(*((void *)&v27 + 1) + 8 * v23) integerValue];
    BOOL v24 = [(CAMCaptureCapabilities *)self isSupportedVideoConfiguration:v9 forMode:a3 device:a4];
    BOOL v25 = [(CAMCaptureCapabilities *)self isSupportedVideoConfiguration:v9 forMode:a3 videoEncodingBehavior:a5 outputToExternalStorage:v26];
    if (v24 && v25) {
      return v9;
    }
    if (v21 == ++v23)
    {
      uint64_t v21 = [v15 countByEnumeratingWithState:&v27 objects:v31 count:16];
      uint64_t v9 = 0;
      if (v21) {
        goto LABEL_15;
      }
      return v9;
    }
  }
}

- (int64_t)validatedVideoConfigurationForVideoConfiguration:(int64_t)a3 withBlock:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  BOOL v5 = (uint64_t (**)(id, void))a4;
  if ((v5[2](v5, a3) & 1) == 0)
  {
    if ((unint64_t)(a3 - 1) > 0xD) {
      BOOL v6 = 0;
    }
    else {
      BOOL v6 = (void *)qword_263FA46B0[a3 - 1];
    }
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          BOOL v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          int v12 = [v11 intValue];
          if (v5[2](v5, (int)[v11 intValue]))
          {
            a3 = v12;
            goto LABEL_17;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
    uint64_t v13 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[CAMCaptureCapabilities validatedVideoConfigurationForVideoConfiguration:withBlock:](v13);
    }
  }
LABEL_17:

  return a3;
}

- (BOOL)isAutoFPSVideoSupportedForMode:(int64_t)a3 videoConfiguration:(int64_t)a4 videoEncodingBehavior:(int64_t)a5 outputToExternalStorage:(BOOL)a6 spatialVideoEnabled:(BOOL)a7 prefersHDR10BitVideo:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  BOOL v10 = a6;
  BOOL v15 = -[CAMCaptureCapabilities isAutoLowLightVideoSupportedForMode:videoConfiguration:videoEncodingBehavior:](self, "isAutoLowLightVideoSupportedForMode:videoConfiguration:videoEncodingBehavior:");
  return v15 | [(CAMCaptureCapabilities *)self isVariableFramerateVideoSupportedForMode:a3 videoConfiguration:a4 videoEncodingBehavior:a5 outputToExternalStorage:v10 spatialVideoEnabled:v9 prefersHDR10BitVideo:v8];
}

- (BOOL)isHDR10BitVideoSupportedForMode:(int64_t)a3
{
  return (unint64_t)a3 <= 8
      && ((1 << a3) & 0x186) != 0
      && [(CAMCaptureCapabilities *)self isHDR10BitVideoSupported];
}

- (BOOL)isHDR10BitVideoSupportedForVideoConfiguration:(int64_t)a3 videoEncodingBehavior:(int64_t)a4
{
  BOOL v7 = [(CAMCaptureCapabilities *)self isHDR10BitVideoSupported];
  if (!v7) {
    return v7;
  }
  unint64_t v8 = a4 - 1;
  if ((unint64_t)a3 <= 0xE)
  {
    if (((1 << a3) & 0x1CE1) != 0)
    {
LABEL_9:
      LOBYTE(v7) = 1;
      goto LABEL_10;
    }
    if (((1 << a3) & 0x6010) != 0)
    {
      LOBYTE(v7) = [(CAMCaptureCapabilities *)self _HDR10BitVideoSupports120FPS];
      goto LABEL_10;
    }
    if (((1 << a3) & 0x202) != 0)
    {
      LOBYTE(v7) = [(CAMCaptureCapabilities *)self isHDR10BitVideoSupports60FPS];
      goto LABEL_10;
    }
  }
  if ((unint64_t)(a3 - 10000) < 6) {
    goto LABEL_9;
  }
  LOBYTE(v7) = 0;
LABEL_10:
  if (v8 >= 2) {
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (BOOL)isProResVideoSupportedForMode:(int64_t)a3
{
  BOOL v5 = [(CAMCaptureCapabilities *)self isProResVideoSupported];
  if (v5)
  {
    if (a3 == 7)
    {
      LOBYTE(v5) = [(CAMCaptureCapabilities *)self _isProResCinematicVideoSupported];
    }
    else
    {
      LOBYTE(v5) = a3 == 1;
    }
  }
  return v5;
}

- (BOOL)isProResVideoSupportedForMode:(int64_t)a3 videoConfiguration:(int64_t)a4 outputToExternalStorage:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v8 = [(CAMCaptureCapabilities *)self isProResVideoSupportedForMode:a3];
  if (v8)
  {
    if ((unint64_t)a4 > 0xE)
    {
      LOBYTE(v8) = 0;
    }
    else
    {
      if (((1 << a4) & 0x7620) != 0)
      {
        if (v5) {
          int64_t v9 = [(CAMCaptureCapabilities *)self _proResVideoExternalMaxFPS4k];
        }
        else {
          int64_t v9 = [(CAMCaptureCapabilities *)self _proResVideoMaxFPS4k];
        }
        goto LABEL_11;
      }
      if (((1 << a4) & 0x992) != 0)
      {
        if (v5) {
          int64_t v9 = [(CAMCaptureCapabilities *)self _proResVideoExternalMaxFPS1080p];
        }
        else {
          int64_t v9 = [(CAMCaptureCapabilities *)self _proResVideoMaxFPS1080p];
        }
LABEL_11:
        LOBYTE(v8) = v9 >= [(CAMCaptureCapabilities *)self _knownFramerateForVideoConfiguration:a4];
        return v8;
      }
      LOBYTE(v8) = a4 == 0;
    }
  }
  return v8;
}

- (int64_t)_knownFramerateForVideoConfiguration:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0xD) {
    return 0;
  }
  else {
    return qword_209C7B2F0[a3 - 1];
  }
}

- (BOOL)isStereoAudioRecordingSupportedForMode:(int64_t)a3
{
  BOOL v4 = [(CAMCaptureCapabilities *)self isStereoAudioRecordingSupported];
  unsigned int v5 = (0x186u >> a3) & 1;
  if ((unint64_t)a3 > 8) {
    LOBYTE(v5) = 0;
  }
  if (v4) {
    return v5;
  }
  else {
    return 0;
  }
}

- (BOOL)isCinematicAudioSupportedForMode:(int64_t)a3
{
  BOOL v4 = [(CAMCaptureCapabilities *)self isCinematicAudioSupported];
  unsigned int v5 = (0x186u >> a3) & 1;
  if ((unint64_t)a3 > 8) {
    LOBYTE(v5) = 0;
  }
  if (v4) {
    return v5;
  }
  else {
    return 0;
  }
}

- (BOOL)isVideoStabilizationControlSupportedForMode:(int64_t)a3 device:(int64_t)a4 videoConfiguration:(int64_t)a5 videoEncodingBehavior:(int64_t)a6 trueVideoEnabled:(BOOL)a7 prefersHDR10BitVideo:(BOOL)a8
{
  BYTE2(v9) = a8;
  BYTE1(v9) = a7;
  LOBYTE(v9) = 0;
  return -[CAMCaptureCapabilities isVideoStabilizationStrength:supportedForMode:device:videoConfiguration:videoEncodingBehavior:outputToExternalStorage:spatialVideoEnabled:trueVideoEnabled:prefersHDR10BitVideo:](self, "isVideoStabilizationStrength:supportedForMode:device:videoConfiguration:videoEncodingBehavior:outputToExternalStorage:spatialVideoEnabled:trueVideoEnabled:prefersHDR10BitVideo:", 3, a3, a4, a5, a6, 0, v9);
}

- (BOOL)isVideoStabilizationStrength:(int64_t)a3 supportedForMode:(int64_t)a4 devicePosition:(int64_t)a5 spatialVideoEnabled:(BOOL)a6 trueVideoEnabled:(BOOL)a7
{
  BOOL v13 = [(CAMCaptureCapabilities *)self isVideoStabilizationControlSupported];
  if (v13)
  {
    BOOL v14 = 0;
    switch(a4)
    {
      case 1:
        BOOL v15 = !a6;
        if (a3) {
          BOOL v15 = 0;
        }
        char v16 = a3 == 1 || v15;
        if ((unint64_t)(a3 - 2) >= 2) {
          BOOL v14 = v16;
        }
        else {
          BOOL v14 = !a6 && !a7;
        }
        break;
      case 2:
        BOOL v14 = (unint64_t)a3 <= 1 && [(CAMCaptureCapabilities *)self back4kMaxFPS] > 119;
        break;
      case 7:
        BOOL v14 = (unint64_t)a3 < 2;
        break;
      case 8:
        BOOL v14 = a3 == 1;
        break;
      default:
        break;
    }
    if (a5) {
      LOBYTE(v13) = 0;
    }
    else {
      LOBYTE(v13) = v14;
    }
  }
  return v13;
}

- (BOOL)isVideoStabilizationStrength:(int64_t)a3 supportedForMode:(int64_t)a4 device:(int64_t)a5 videoConfiguration:(int64_t)a6 videoEncodingBehavior:(int64_t)a7 outputToExternalStorage:(BOOL)a8 spatialVideoEnabled:(BOOL)a9 trueVideoEnabled:(BOOL)a10 prefersHDR10BitVideo:(BOOL)a11
{
  LOBYTE(v21) = a11;
  unint64_t v15 = [(CAMCaptureCapabilities *)self resolvedVideoConfigurationForMode:a4 device:a5 videoEncodingBehavior:a7 videoConfiguration:a6 outputToExternalStorage:a8 spatialVideoEnabled:a9 prefersHDR10BitVideo:v21];
  if ((unint64_t)(a5 - 1) > 0xA) {
    uint64_t v16 = 0;
  }
  else {
    uint64_t v16 = qword_209C7B450[a5 - 1];
  }
  BOOL v17 = [(CAMCaptureCapabilities *)self isVideoStabilizationStrength:a3 supportedForMode:a4 devicePosition:v16 spatialVideoEnabled:a9 trueVideoEnabled:a10];
  BOOL v18 = ((1 << v15) & 0x6014) != 0 && (unint64_t)a3 < 2;
  char v19 = ((1 << v15) & 0x1EE3) != 0 || v18;
  if (v15 > 0xE) {
    char v19 = 0;
  }
  return v17 & v19;
}

- (BOOL)_needsForcedSingleCameraEmulationForVideoStabilizationStrength:(int64_t)a3 videoConfiguration:(int64_t)a4 mode:(int64_t)a5
{
  LOBYTE(v6) = 0;
  if (a4 > 12)
  {
    if ((unint64_t)(a4 - 13) >= 2) {
      return (a3 & 0xFFFFFFFFFFFFFFFELL) == 2 && v6;
    }
    goto LABEL_7;
  }
  switch(a4)
  {
    case 1:
LABEL_7:
      LOBYTE(v6) = 1;
      break;
    case 4:
      LOBYTE(v6) = a5 == 1;
      break;
    case 9:
      BOOL v6 = ![(CAMCaptureCapabilities *)self _isActionModeAggregateDevice4k60Supported];
      break;
  }
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 2 && v6;
}

- (int64_t)bytesPerMinuteForGraphConfiguration:(id)a3 outputToExternalStorage:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [v6 mode];
  uint64_t v8 = [v6 device];
  uint64_t v9 = [v6 videoEncodingBehavior];
  uint64_t v10 = [v6 videoConfiguration];
  uint64_t v11 = [v6 enableStereoVideoCapture];
  LOBYTE(v40) = [v6 prefersHDR10BitVideo];
  int64_t v12 = [(CAMCaptureCapabilities *)self resolvedVideoConfigurationForMode:v7 device:v8 videoEncodingBehavior:v9 videoConfiguration:v10 outputToExternalStorage:v4 spatialVideoEnabled:v11 prefersHDR10BitVideo:v40];
  uint64_t v13 = [v6 videoEncodingBehavior];
  if (v13 == 2)
  {
    int v15 = 0;
    int v14 = 1;
  }
  else if (v13 == 1)
  {
    int v14 = 0;
    int v15 = 1;
  }
  else
  {
    int v15 = 0;
    int v14 = 0;
  }
  uint64_t v16 = [v6 colorSpace];
  switch(v12)
  {
    case 1:
      uint64_t v17 = 3300;
      uint64_t v18 = 175;
      if (v15) {
        uint64_t v18 = 90;
      }
      BOOL v19 = v16 == 2;
      uint64_t v20 = 100;
      goto LABEL_41;
    case 2:
      char v23 = 0;
      uint64_t v22 = 230;
      break;
    case 3:
      char v23 = 0;
      BOOL v24 = v15 == 0;
      uint64_t v25 = 300;
      goto LABEL_18;
    case 4:
      char v23 = 0;
      BOOL v24 = v15 == 0;
      uint64_t v25 = 350;
LABEL_18:
      if (v24) {
        uint64_t v22 = v25;
      }
      else {
        uint64_t v22 = 170;
      }
      break;
    case 5:
      BOOL v26 = !v4;
      uint64_t v27 = 5700;
      uint64_t v28 = 6600;
      goto LABEL_47;
    case 6:
      char v23 = 0;
      uint64_t v29 = 60;
      if (v15) {
        uint64_t v29 = 40;
      }
      if (v16 == 2) {
        uint64_t v22 = 45;
      }
      else {
        uint64_t v22 = v29;
      }
      break;
    case 7:
      uint64_t v17 = 1650;
      goto LABEL_38;
    case 8:
      char v23 = 0;
      uint64_t v22 = 480;
      break;
    case 9:
      uint64_t v27 = 11400;
      if (v4) {
        uint64_t v27 = 13200;
      }
      BOOL v30 = v16 == 2;
      uint64_t v31 = 400;
      uint64_t v32 = 440;
      goto LABEL_52;
    case 10:
      uint64_t v27 = 5280;
      if (v4) {
        uint64_t v27 = 5300;
      }
      uint64_t v31 = 270;
      if (v15) {
        uint64_t v31 = 135;
      }
      BOOL v30 = v16 == 2;
      uint64_t v32 = 150;
      goto LABEL_52;
    case 11:
      uint64_t v17 = 1380;
LABEL_38:
      uint64_t v18 = 130;
      if (v15) {
        uint64_t v18 = 60;
      }
      BOOL v19 = v16 == 2;
      uint64_t v20 = 65;
LABEL_41:
      if (v19) {
        uint64_t v18 = v20;
      }
      if (v14) {
        uint64_t v22 = v17;
      }
      else {
        uint64_t v22 = v18;
      }
      goto LABEL_96;
    case 12:
      BOOL v26 = !v4;
      uint64_t v27 = 5470;
      uint64_t v28 = 5530;
LABEL_47:
      if (!v26) {
        uint64_t v27 = v28;
      }
      uint64_t v31 = 350;
      if (v15) {
        uint64_t v31 = 170;
      }
      BOOL v30 = v16 == 2;
      uint64_t v32 = 190;
LABEL_52:
      if (v30) {
        uint64_t v31 = v32;
      }
      if (v14) {
        uint64_t v22 = v27;
      }
      else {
        uint64_t v22 = v31;
      }
      goto LABEL_66;
    case 13:
      uint64_t v33 = 670;
      if (v16 == 2) {
        uint64_t v33 = 730;
      }
      BOOL v34 = v14 == 0;
      uint64_t v35 = 26500;
      goto LABEL_63;
    case 14:
      uint64_t v33 = 570;
      if (v16 == 2) {
        uint64_t v33 = 630;
      }
      BOOL v34 = v14 == 0;
      uint64_t v35 = 22100;
LABEL_63:
      if (v34) {
        uint64_t v22 = v33;
      }
      else {
        uint64_t v22 = v35;
      }
LABEL_66:
      char v23 = v14;
      break;
    default:
      if ((unint64_t)(v12 - 10000) < 6)
      {
        uint64_t v21 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2099F8000, v21, OS_LOG_TYPE_DEFAULT, "CAMStorageController: _preferredMinimumBytesForVideoConfiguration called with CAMCaptureVideoConfigurationImagePicker; preferred space amounts do not exist for these configurations.",
            buf,
            2u);
        }
      }
      uint64_t v22 = 0;
      char v23 = 0;
      break;
  }
  if ((v23 & 1) == 0 && ((v14 ^ 1) & 1) == 0)
  {
    unint64_t v36 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      switch(v12)
      {
        case 0:
          uint64_t v37 = @"Auto";
          break;
        case 1:
          uint64_t v37 = @"1080p60";
          break;
        case 2:
          uint64_t v37 = @"720p120";
          break;
        case 3:
          uint64_t v37 = @"720p240";
          break;
        case 4:
          uint64_t v37 = @"1080p120";
          break;
        case 5:
          uint64_t v37 = @"4k30";
          break;
        case 6:
          uint64_t v37 = @"720p30";
          break;
        case 7:
          uint64_t v37 = @"1080p30";
          break;
        case 8:
          uint64_t v37 = @"1080p240";
          break;
        case 9:
          uint64_t v37 = @"4k60";
          break;
        case 10:
          uint64_t v37 = @"4k24";
          break;
        case 11:
          uint64_t v37 = @"1080p25";
          break;
        case 12:
          uint64_t v37 = @"4k25";
          break;
        case 13:
          uint64_t v37 = @"4k120";
          break;
        case 14:
          uint64_t v37 = @"4k100";
          break;
        default:
          switch(v12)
          {
            case 10000:
              uint64_t v37 = @"ImagePickerHigh";
              break;
            case 10001:
              uint64_t v37 = @"ImagePickerMedium";
              break;
            case 10002:
              uint64_t v37 = @"ImagePickerLow";
              break;
            case 10003:
              uint64_t v37 = @"ImagePickerVGA";
              break;
            case 10004:
              uint64_t v37 = @"ImagePickeriFrame720p";
              break;
            case 10005:
              uint64_t v37 = @"ImagePickeriFrame540p";
              break;
            default:
              uint64_t v37 = 0;
              break;
          }
          break;
      }
      *(_DWORD *)buf = 138543362;
      double v42 = v37;
      _os_log_impl(&dword_2099F8000, v36, OS_LOG_TYPE_DEFAULT, "CAMCaptureCapabilities: _preferredMinimumBytesForVideoConfiguration did not account for ProRes video for %{public}@", buf, 0xCu);
    }
  }
LABEL_96:
  if ([v6 mode] == 7) {
    int64_t v38 = (v22 << 20) + 3145728;
  }
  else {
    int64_t v38 = v22 << 20;
  }

  return v38;
}

- (BOOL)isCinematicModeSupportedForDevicePosition:(int64_t)a3
{
  if (a3 == 1) {
    return [(CAMCaptureCapabilities *)self isFrontCinematicModeSupported];
  }
  if (a3) {
    return 0;
  }
  return [(CAMCaptureCapabilities *)self isBackCinematicModeSupported];
}

- (BOOL)isCinematicModeSupportedForDevice:(int64_t)a3
{
  BOOL v5 = -[CAMCaptureCapabilities isCameraSupportedForDevice:](self, "isCameraSupportedForDevice:");
  if (v5)
  {
    uint64_t v6 = (unint64_t)(a3 - 1) > 0xA ? 0 : qword_209C7B450[a3 - 1];
    BOOL v5 = [(CAMCaptureCapabilities *)self isCinematicModeSupportedForDevicePosition:v6];
    if (v5)
    {
      LOBYTE(v5) = 0;
      switch(a3)
      {
        case 0:
        case 1:
          LOBYTE(v5) = 1;
          break;
        case 4:
          BOOL v5 = [(CAMCaptureCapabilities *)self _backDualCameraSupportedForCinematic];
          if (v5)
          {
            LOBYTE(v5) = [(CAMCaptureCapabilities *)self isBackDualSupported];
          }
          break;
        case 6:
          LOBYTE(v5) = [(CAMCaptureCapabilities *)self isBackWideDualSupported];
          break;
        case 7:
          LOBYTE(v5) = [(CAMCaptureCapabilities *)self isBackTripleCameraSupported];
          break;
        case 9:
          LOBYTE(v5) = [(CAMCaptureCapabilities *)self isFrontPearlSupported];
          break;
        default:
          return v5;
      }
    }
  }
  return v5;
}

- (BOOL)isSpatialVideoInVideoModeSupportedForMode:(int64_t)a3 devicePosition:(int64_t)a4
{
  BOOL v6 = [(CAMCaptureCapabilities *)self isSpatialVideoCaptureSupported];
  BOOL v7 = a3 == 1 && v6;
  return !a4 && v7;
}

- (BOOL)_isSpatialVideoModeSupportedForDevice:(int64_t)a3
{
  BOOL v5 = -[CAMCaptureCapabilities isCameraSupportedForDevice:](self, "isCameraSupportedForDevice:");
  if (v5)
  {
    uint64_t v6 = (unint64_t)(a3 - 1) > 0xA ? 0 : qword_209C7B450[a3 - 1];
    BOOL v5 = [(CAMCaptureCapabilities *)self _isSpatialVideoSupportedForDevicePosition:v6];
    if (v5
      && ([(CAMCaptureCapabilities *)self isSpatialVideoCaptureSupported]
       || (BOOL v5 = [(CAMCaptureCapabilities *)self isSpatialModeSupported])))
    {
      if (a3)
      {
        if (a3 == 6)
        {
          LOBYTE(v5) = [(CAMCaptureCapabilities *)self isBackWideDualSupported];
        }
        else
        {
          LOBYTE(v5) = 0;
        }
      }
      else
      {
        LOBYTE(v5) = 1;
      }
    }
  }
  return v5;
}

- (BOOL)_isSpatialVideoSupportedForDevicePosition:(int64_t)a3
{
  return a3 == 0;
}

- (BOOL)_isSpatialPhotoModeSupportedForDevice:(int64_t)a3
{
  BOOL v5 = -[CAMCaptureCapabilities isCameraSupportedForDevice:](self, "isCameraSupportedForDevice:");
  if (v5)
  {
    BOOL v5 = [(CAMCaptureCapabilities *)self isSpatialModeSupported];
    if (v5)
    {
      if (a3)
      {
        if (a3 == 6)
        {
          LOBYTE(v5) = [(CAMCaptureCapabilities *)self isBackWideDualSupported];
        }
        else
        {
          LOBYTE(v5) = 0;
        }
      }
      else
      {
        LOBYTE(v5) = 1;
      }
    }
  }
  return v5;
}

- (BOOL)_isSpatialPhotoSupportedForDevicePosition:(int64_t)a3
{
  return a3 == 0;
}

- (BOOL)isWideSupportedForDevicePosition:(int64_t)a3
{
  if (a3 == 1) {
    return [(CAMCaptureCapabilities *)self isFrontCameraSupported];
  }
  if (a3) {
    return 0;
  }
  return [(CAMCaptureCapabilities *)self isBackCameraSupported];
}

- (BOOL)isWideSupportedForMode:(int64_t)a3 devicePosition:(int64_t)a4 videoConfiguration:(int64_t)a5
{
  BOOL v9 = [(CAMCaptureCapabilities *)self isWideSupportedForDevicePosition:a4];
  if (v9)
  {
    if (a4) {
      uint64_t v10 = 8 * (a4 == 1);
    }
    else {
      uint64_t v10 = 2;
    }
    switch(a3)
    {
      case 0:
      case 3:
      case 4:
      case 5:
        LOBYTE(v9) = 1;
        break;
      case 1:
      case 2:
        LOBYTE(v9) = [(CAMCaptureCapabilities *)self isSupportedVideoConfiguration:a5 forMode:a3 device:v10];
        break;
      case 6:
        LOBYTE(v9) = [(CAMCaptureCapabilities *)self isPortraitModeSupportedForDevice:v10];
        break;
      case 7:
        LOBYTE(v9) = [(CAMCaptureCapabilities *)self isCinematicModeSupportedForDevice:v10];
        break;
      case 8:
        LOBYTE(v9) = [(CAMCaptureCapabilities *)self _isSpatialVideoModeSupportedForDevice:v10];
        break;
      case 9:
        LOBYTE(v9) = [(CAMCaptureCapabilities *)self _isSpatialPhotoModeSupportedForDevice:v10];
        break;
      default:
        LOBYTE(v9) = 0;
        break;
    }
  }
  return v9;
}

- (BOOL)isTelephotoSupported
{
  if ([(CAMCaptureCapabilities *)self isBackTelephotoSupported]) {
    return 1;
  }
  return [(CAMCaptureCapabilities *)self isFrontTelephotoSupported];
}

- (BOOL)isTelephotoSupportedForMode:(int64_t)a3 devicePosition:(int64_t)a4 videoConfiguration:(int64_t)a5
{
  BOOL v9 = [(CAMCaptureCapabilities *)self isTelephotoSupportedForDevicePosition:a4];
  if (v9)
  {
    if (a4 == 1)
    {
LABEL_8:
      LOBYTE(v9) = 0;
    }
    else
    {
      if (a4) {
        uint64_t v10 = 0;
      }
      else {
        uint64_t v10 = 3;
      }
      switch(a3)
      {
        case 0:
        case 3:
        case 4:
        case 5:
          LOBYTE(v9) = 1;
          break;
        case 1:
        case 2:
        case 8:
          LOBYTE(v9) = [(CAMCaptureCapabilities *)self isSupportedVideoConfiguration:a5 forMode:a3 device:v10];
          break;
        case 6:
          LOBYTE(v9) = [(CAMCaptureCapabilities *)self isPortraitModeSupportedForDevice:v10];
          break;
        case 7:
          LOBYTE(v9) = [(CAMCaptureCapabilities *)self isCinematicModeSupportedForDevice:v10];
          break;
        case 9:
          LOBYTE(v9) = [(CAMCaptureCapabilities *)self _isSpatialPhotoModeSupportedForDevice:v10];
          break;
        default:
          goto LABEL_8;
      }
    }
  }
  return v9;
}

- (BOOL)shouldAllowCameraToggleForMode:(int64_t)a3 devicePosition:(int64_t)a4 videoConfiguration:(int64_t)a5
{
  return [(CAMCaptureCapabilities *)self _shouldAllowCameraToggleForMode:a3 devicePosition:a4 videoConfiguration:a5 videoStabilizationStrength:0];
}

- (BOOL)_shouldAllowCameraToggleForMode:(int64_t)a3 devicePosition:(int64_t)a4 videoConfiguration:(int64_t)a5 videoStabilizationStrength:(int64_t)a6
{
  if (![(CAMCaptureCapabilities *)self _forcedBackCamera]
    || (int64_t v11 = [(CAMCaptureCapabilities *)self preferredDeviceForPosition:a4 mode:a3 videoConfiguration:a5 videoStabilizationStrength:a6 spatialVideoEnabled:0], v12 = [(CAMCaptureCapabilities *)self _forcedBackCamera], LOBYTE(v13) = 0, v11 != v12))
  {
    if ([(CAMCaptureCapabilities *)self isTripleCameraSupportedForMode:a3 devicePosition:a4 videoConfiguration:a5 videoStabilizationStrength:a6])
    {
LABEL_4:
      LOBYTE(v13) = 0;
      return v13;
    }
    BOOL v14 = [(CAMCaptureCapabilities *)self isDualSupportedForMode:a3 devicePosition:a4 videoConfiguration:a5 videoStabilizationStrength:a6];
    BOOL v15 = [(CAMCaptureCapabilities *)self isWideDualSupportedForMode:a3 devicePosition:a4 videoConfiguration:a5 videoStabilizationStrength:a6];
    if (v14 && v15)
    {
      LOBYTE(v13) = 1;
      return v13;
    }
    if (v15)
    {
      BOOL v13 = [(CAMCaptureCapabilities *)self isQuadraWideZoomButtonSupportedForMode:a3 devicePosition:a4 videoConfiguration:a5];
      if (v13) {
        LOBYTE(v13) = !+[CAMZoomControlUtilities shouldApplyContinuousZoomForMode:a3 device:6 videoConfiguration:a5 videoStabilizationStrength:a6 zoomFactors:0 displayZoomFactors:0];
      }
    }
    else
    {
      if (v14) {
        goto LABEL_4;
      }
      BOOL v16 = [(CAMCaptureCapabilities *)self isTelephotoSupportedForMode:a3 devicePosition:a4 videoConfiguration:a5];
      BOOL v17 = [(CAMCaptureCapabilities *)self isSuperWideSupportedForMode:a3 devicePosition:a4 videoConfiguration:a5];
      LOBYTE(v13) = 1;
      if (!v16 && !v17)
      {
        LOBYTE(v13) = [(CAMCaptureCapabilities *)self isQuadraWideBinningReconfigurationSupportedForMode:a3 devicePosition:a4 videoConfiguration:a5];
      }
    }
  }
  return v13;
}

- (BOOL)isDualSupported
{
  if ([(CAMCaptureCapabilities *)self isBackDualSupported]) {
    return 1;
  }
  return [(CAMCaptureCapabilities *)self isFrontDualSupported];
}

- (BOOL)isDualSupportedForMode:(int64_t)a3 devicePosition:(int64_t)a4 videoConfiguration:(int64_t)a5 videoStabilizationStrength:(int64_t)a6
{
  BOOL v11 = [(CAMCaptureCapabilities *)self isDualSupportedForDevicePosition:a4];
  if (v11)
  {
    if ([(CAMCaptureCapabilities *)self _needsForcedSingleCameraEmulationForVideoStabilizationStrength:a6 videoConfiguration:a5 mode:a3]|| [(CAMCaptureCapabilities *)self featureDevelopmentForceSingleCamera])
    {
LABEL_4:
      LOBYTE(v11) = 0;
    }
    else
    {
      LOBYTE(v11) = 0;
      switch(a3)
      {
        case 0:
        case 4:
          goto LABEL_17;
        case 1:
        case 2:
        case 8:
          if (a4) {
            goto LABEL_4;
          }
          LOBYTE(v11) = [(CAMCaptureCapabilities *)self isSupportedVideoConfiguration:a5 forMode:a3 device:4];
          return v11;
        case 6:
          LOBYTE(v11) = ![(CAMCaptureCapabilities *)self _disablePortraitBravoDevices];
          return v11;
        case 7:
          if (a4 == 1)
          {
LABEL_17:
            LOBYTE(v11) = 1;
          }
          else
          {
            if (a4) {
              goto LABEL_4;
            }
            LOBYTE(v11) = [(CAMCaptureCapabilities *)self _backDualCameraSupportedForCinematic];
          }
          break;
        case 9:
          LOBYTE(v11) = [(CAMCaptureCapabilities *)self _isSpatialPhotoModeSupportedForDevice:4];
          return v11;
        default:
          return v11;
      }
    }
  }
  return v11;
}

- (double)wideToTelephotoZoomFactorForDevicePosition:(int64_t)a3
{
  if (a3 == 1)
  {
    [(CAMCaptureCapabilities *)self _frontDualCameraSwitchOverZoomFactor];
  }
  else if (a3)
  {
    return 1.0;
  }
  else
  {
    [(CAMCaptureCapabilities *)self _backDualCameraSwitchOverZoomFactor];
  }
  return result;
}

- (BOOL)isSuperWideSupported
{
  if ([(CAMCaptureCapabilities *)self isBackSuperWideSupported]) {
    return 1;
  }
  return [(CAMCaptureCapabilities *)self isFrontSuperWideSupported];
}

- (BOOL)isSuperWideSupportedForDevicePosition:(int64_t)a3
{
  if (a3 == 1) {
    return [(CAMCaptureCapabilities *)self isFrontSuperWideSupported];
  }
  if (a3) {
    return 0;
  }
  return [(CAMCaptureCapabilities *)self isBackSuperWideSupported];
}

- (BOOL)isSuperWideSupportedForMode:(int64_t)a3 devicePosition:(int64_t)a4 videoConfiguration:(int64_t)a5
{
  BOOL v9 = [(CAMCaptureCapabilities *)self isSuperWideSupportedForDevicePosition:a4];
  if (v9)
  {
    uint64_t v10 = 10;
    if (a4 != 1) {
      uint64_t v10 = 0;
    }
    if (a4) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = 5;
    }
    switch(a3)
    {
      case 0:
      case 4:
        LOBYTE(v9) = 1;
        break;
      case 1:
      case 2:
      case 8:
        LOBYTE(v9) = [(CAMCaptureCapabilities *)self isSupportedVideoConfiguration:a5 forMode:a3 device:v11];
        break;
      case 3:
        LOBYTE(v9) = ![(CAMCaptureCapabilities *)self _isiPad];
        break;
      case 5:
        LOBYTE(v9) = [(CAMCaptureCapabilities *)self isTimelapseSupportedForDevice:v11];
        break;
      case 6:
      case 7:
        LOBYTE(v9) = [(CAMCaptureCapabilities *)self isPortraitModeSupportedForDevice:v11];
        break;
      case 9:
        LOBYTE(v9) = [(CAMCaptureCapabilities *)self _isSpatialPhotoModeSupportedForDevice:v11];
        break;
      default:
        LOBYTE(v9) = 0;
        break;
    }
  }
  return v9;
}

- (BOOL)isSuperWideAutoMacroSupportedForMode:(int64_t)a3 device:(int64_t)a4 videoConfiguration:(int64_t)a5 videoStabilizationStrength:(int64_t)a6 spatialVideoEnabled:(BOOL)a7
{
  int64_t v10 = -[CAMCaptureCapabilities resolvedDeviceForDesiredDevice:mode:videoConfiguration:videoStabilizationStrength:spatialVideoEnabled:](self, "resolvedDeviceForDesiredDevice:mode:videoConfiguration:videoStabilizationStrength:spatialVideoEnabled:", a4, a3, a5, a6);
  BOOL v11 = [(CAMCaptureCapabilities *)self isSuperWideAutoMacroSupported];
  BOOL v12 = !a7;
  if ((v10 & 0xFFFFFFFFFFFFFFFELL) != 6) {
    BOOL v12 = 0;
  }
  if (!v11) {
    BOOL v12 = 0;
  }
  return (unint64_t)a3 <= 1 && v12;
}

- (BOOL)isWideDualSupported
{
  if ([(CAMCaptureCapabilities *)self isBackWideDualSupported]) {
    return 1;
  }
  return [(CAMCaptureCapabilities *)self isFrontWideDualSupported];
}

- (BOOL)isWideDualSupportedForDevicePosition:(int64_t)a3
{
  if (a3 == 1) {
    return [(CAMCaptureCapabilities *)self isFrontWideDualSupported];
  }
  if (a3) {
    return 0;
  }
  return [(CAMCaptureCapabilities *)self isBackWideDualSupported];
}

- (BOOL)isWideDualSupportedForMode:(int64_t)a3 devicePosition:(int64_t)a4 videoConfiguration:(int64_t)a5 videoStabilizationStrength:(int64_t)a6
{
  BOOL v11 = [(CAMCaptureCapabilities *)self isWideDualSupportedForDevicePosition:a4];
  if (v11)
  {
    if ([(CAMCaptureCapabilities *)self _needsForcedSingleCameraEmulationForVideoStabilizationStrength:a6 videoConfiguration:a5 mode:a3]|| [(CAMCaptureCapabilities *)self featureDevelopmentForceSingleCamera])
    {
      goto LABEL_4;
    }
    LOBYTE(v11) = 0;
    if ((unint64_t)a3 > 9) {
      return v11;
    }
    if (((1 << a3) & 0x291) != 0)
    {
      LOBYTE(v11) = 1;
    }
    else if (((1 << a3) & 0x106) != 0)
    {
      if (a4)
      {
LABEL_4:
        LOBYTE(v11) = 0;
        return v11;
      }
      LOBYTE(v11) = [(CAMCaptureCapabilities *)self isSupportedVideoConfiguration:a5 forMode:a3 device:6];
    }
    else if (a3 == 6)
    {
      LOBYTE(v11) = ![(CAMCaptureCapabilities *)self _disablePortraitBravoDevices];
    }
  }
  return v11;
}

- (double)superWideToWideZoomFactorForDevicePosition:(int64_t)a3
{
  if (a3 == 1)
  {
    [(CAMCaptureCapabilities *)self _frontWideDualCameraSwitchOverZoomFactor];
  }
  else if (a3)
  {
    return 1.0;
  }
  else
  {
    [(CAMCaptureCapabilities *)self _backWideDualCameraSwitchOverZoomFactor];
  }
  return result;
}

- (BOOL)isDualDeviceDisparitySupportedForMode:(int64_t)a3 devicePosition:(int64_t)a4
{
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) != 6) {
    return 0;
  }
  if ([(CAMCaptureCapabilities *)self isDualSupported]) {
    return 1;
  }
  return [(CAMCaptureCapabilities *)self isWideDualSupported];
}

- (BOOL)isTripleCameraSupported
{
  if ([(CAMCaptureCapabilities *)self isBackTripleCameraSupported]) {
    return 1;
  }
  return [(CAMCaptureCapabilities *)self isFrontTripleCameraSupported];
}

- (BOOL)isTripleCameraSupportedForDevicePosition:(int64_t)a3
{
  if (a3 == 1) {
    return [(CAMCaptureCapabilities *)self isFrontTripleCameraSupported];
  }
  if (a3) {
    return 0;
  }
  return [(CAMCaptureCapabilities *)self isBackTripleCameraSupported];
}

- (BOOL)isTripleCameraSupportedForMode:(int64_t)a3 devicePosition:(int64_t)a4 videoConfiguration:(int64_t)a5 videoStabilizationStrength:(int64_t)a6
{
  BOOL v11 = [(CAMCaptureCapabilities *)self isTripleCameraSupportedForDevicePosition:a4];
  if (!v11) {
    return v11;
  }
  if ([(CAMCaptureCapabilities *)self _needsForcedSingleCameraEmulationForVideoStabilizationStrength:a6 videoConfiguration:a5 mode:a3]|| [(CAMCaptureCapabilities *)self featureDevelopmentForceSingleCamera]|| [(CAMCaptureCapabilities *)self _disableSuperBravoDevice])
  {
    goto LABEL_10;
  }
  LOBYTE(v11) = 0;
  if ((unint64_t)a3 > 8) {
    return v11;
  }
  if (((1 << a3) & 0x106) == 0)
  {
    if (((1 << a3) & 0x11) != 0)
    {
      LOBYTE(v11) = 1;
    }
    else if (a3 == 6)
    {
      LOBYTE(v11) = [(CAMCaptureCapabilities *)self continuousZoomSupportedForPortraitMode];
    }
    return v11;
  }
  if (a4)
  {
LABEL_10:
    LOBYTE(v11) = 0;
    return v11;
  }
  LOBYTE(v11) = [(CAMCaptureCapabilities *)self isSupportedVideoConfiguration:a5 forMode:a3 device:7];
  return v11;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)tripleCameraSwitchOverZoomFactorsForDevicePosition:(int64_t)a3
{
  BOOL v5 = -[CAMCaptureCapabilities isTripleCameraSupportedForDevicePosition:](self, "isTripleCameraSupportedForDevicePosition:");
  double v6 = 1.0;
  if (v5)
  {
    if (a3 == 1)
    {
      [(CAMCaptureCapabilities *)self _frontWideDualCameraSwitchOverZoomFactor];
      double v7 = v10;
      [(CAMCaptureCapabilities *)self _frontDualCameraSwitchOverZoomFactor];
      goto LABEL_7;
    }
    double v7 = 1.0;
    if (!a3)
    {
      [(CAMCaptureCapabilities *)self _backWideDualCameraSwitchOverZoomFactor];
      double v7 = v8;
      [(CAMCaptureCapabilities *)self _backDualCameraSwitchOverZoomFactor];
LABEL_7:
      double v6 = v7 * v9;
    }
  }
  else
  {
    double v7 = 1.0;
  }
  double v11 = v7;
  result.var1 = v6;
  result.var0 = v11;
  return result;
}

- (BOOL)isQuadraWideSupported
{
  if ([(CAMCaptureCapabilities *)self isBackQuadraWideSupported]) {
    return 1;
  }
  return [(CAMCaptureCapabilities *)self isFrontQuadraWideSupported];
}

- (BOOL)isQuadraWideBinningReconfigurationSupportedForMode:(int64_t)a3 devicePosition:(int64_t)a4 videoConfiguration:(int64_t)a5
{
  if (a4 == 1)
  {
    BOOL v8 = [(CAMCaptureCapabilities *)self isFrontQuadraWideSupported];
    goto LABEL_5;
  }
  if (!a4)
  {
    BOOL v8 = [(CAMCaptureCapabilities *)self isBackQuadraWideSupported];
LABEL_5:
    BOOL v9 = v8;
    goto LABEL_7;
  }
  BOOL v9 = 0;
LABEL_7:
  LOBYTE(v10) = 0;
  switch(a3)
  {
    case 0:
    case 1:
    case 3:
    case 5:
      LOBYTE(v10) = [(CAMCaptureCapabilities *)self isQuadraWideSupported];
      break;
    case 2:
      LOBYTE(v10) = 0;
      if ((unint64_t)a5 <= 0xE && ((1 << a5) & 0x6010) != 0)
      {
        BOOL v10 = [(CAMCaptureCapabilities *)self isBackQuadraWideSupported];
        if (v10) {
          LOBYTE(v10) = [(CAMCaptureCapabilities *)self isBack4k120VideoSupported];
        }
      }
      break;
    case 6:
      LOBYTE(v10) = [(CAMCaptureCapabilities *)self _isQuadraPortraitSupported];
      break;
    case 7:
      LOBYTE(v10) = [(CAMCaptureCapabilities *)self continuousZoomSupportedForCinematicMode];
      break;
    default:
      return v10 && v9;
  }
  return v10 && v9;
}

- (int64_t)defaultPhotoResolutionForMode:(int64_t)a3 devicePosition:(int64_t)a4 encodingBehavior:(int64_t)a5
{
  if ((unint64_t)a5 < 2)
  {
    if (a4) {
      [(CAMCaptureCapabilities *)self _frontCameraDefaultCompressedResolutionByMode];
    }
    else {
      [(CAMCaptureCapabilities *)self _backCameraDefaultCompressedResolutionByMode];
    }
    uint64_t v6 = LABEL_4:;
    double v7 = (void *)v6;
    goto LABEL_11;
  }
  if (a5 == 2)
  {
    if (a4) {
      [(CAMCaptureCapabilities *)self _frontCameraDefaultRAWResolutionByMode];
    }
    else {
      [(CAMCaptureCapabilities *)self _backCameraDefaultRAWResolutionByMode];
    }
    goto LABEL_4;
  }
  double v7 = 0;
LABEL_11:
  BOOL v8 = objc_msgSend(NSNumber, "numberWithInteger:", a3, a4);
  BOOL v9 = [v7 objectForKeyedSubscript:v8];

  if (v9) {
    int64_t v10 = [v9 integerValue];
  }
  else {
    int64_t v10 = 0;
  }

  return v10;
}

- (BOOL)isPearlSupportedForDevicePosition:(int64_t)a3
{
  if (a3 == 1) {
    return [(CAMCaptureCapabilities *)self isFrontPearlSupported];
  }
  if (a3) {
    return 0;
  }
  return [(CAMCaptureCapabilities *)self isBackPearlSupported];
}

- (BOOL)isPearlSupportedForMode:(int64_t)a3 devicePosition:(int64_t)a4
{
  BOOL v6 = [(CAMCaptureCapabilities *)self isPearlSupportedForDevicePosition:a4];
  if (v6)
  {
    if ((unint64_t)(a3 - 6) >= 2)
    {
      if (a3)
      {
        LOBYTE(v6) = 0;
      }
      else
      {
        LOBYTE(v6) = [(CAMCaptureCapabilities *)self _frontPhotoModeDepthSuggestionSupported];
      }
    }
    else
    {
      LOBYTE(v6) = 1;
    }
  }
  return v6;
}

- (int64_t)fallbackPrimaryConstituentDeviceSelectionForMode:(int64_t)a3 device:(int64_t)a4 videoConfiguration:(int64_t)a5 videoStabilizationStrength:(int64_t)a6 macroMode:(int64_t)a7 spatialVideoEnabled:(BOOL)a8
{
  if ((unint64_t)(a4 - 1) > 0xA) {
    uint64_t v14 = 0;
  }
  else {
    uint64_t v14 = qword_209C7B450[a4 - 1];
  }
  BOOL v15 = -[CAMCaptureCapabilities isSuperWideAutoMacroSupportedForMode:device:videoConfiguration:videoStabilizationStrength:spatialVideoEnabled:](self, "isSuperWideAutoMacroSupportedForMode:device:videoConfiguration:videoStabilizationStrength:spatialVideoEnabled:", a3);
  BOOL v16 = [(CAMCaptureCapabilities *)self isDualDeviceDisparitySupportedForMode:a3 devicePosition:v14];
  if (a8)
  {
    int64_t v17 = 0;
  }
  else if (v15)
  {
    int64_t v17 = 1;
    if (!a7) {
      int64_t v17 = 2;
    }
  }
  else if (v16)
  {
    BOOL v18 = [(CAMCaptureCapabilities *)self isTripleCameraSupportedForMode:a3 devicePosition:v14 videoConfiguration:a5 videoStabilizationStrength:a6];
    int64_t v17 = 2;
    if (!v18) {
      int64_t v17 = 0;
    }
  }
  else
  {
    int64_t v17 = 1;
  }
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 8) {
    return 0;
  }
  else {
    return v17;
  }
}

- (BOOL)isTimeOfFlightSupported
{
  if ([(CAMCaptureCapabilities *)self isFrontTimeOfFlightSupported]) {
    return 1;
  }
  return [(CAMCaptureCapabilities *)self isBackTimeOfFlightSupported];
}

- (BOOL)isTimeOfFlightSupportedForDevicePosition:(int64_t)a3
{
  if (!a3) {
    return [(CAMCaptureCapabilities *)self isBackTimeOfFlightSupported];
  }
  if (a3 == 1) {
    return [(CAMCaptureCapabilities *)self isFrontTimeOfFlightSupported];
  }
  return 0;
}

- (BOOL)isDepthEffectApertureSupportedForMode:(int64_t)a3 devicePosition:(int64_t)a4
{
  if ((unint64_t)(a3 - 6) < 2) {
    return [(CAMCaptureCapabilities *)self isDepthEffectApertureSupported];
  }
  if (a3) {
    return 0;
  }
  if (a4) {
    return [(CAMCaptureCapabilities *)self _frontPhotoModeDepthSuggestionSupported];
  }
  return [(CAMCaptureCapabilities *)self _rearPhotoModeDepthSuggestionSupported];
}

- (BOOL)photoModeDepthSuggestionSupported
{
  if ([(CAMCaptureCapabilities *)self isPhotoModeDepthSuggestionSupportedForDevicePosition:0])
  {
    return 1;
  }
  return [(CAMCaptureCapabilities *)self isPhotoModeDepthSuggestionSupportedForDevicePosition:1];
}

- (BOOL)isPhotoModeDepthSuggestionSupportedForDevicePosition:(int64_t)a3
{
  if (a3 == 1) {
    return [(CAMCaptureCapabilities *)self _frontPhotoModeDepthSuggestionSupported];
  }
  if (a3) {
    return 0;
  }
  return [(CAMCaptureCapabilities *)self _rearPhotoModeDepthSuggestionSupported];
}

- (BOOL)isDepthSuggestionSupportedForMode:(int64_t)a3 devicePosition:(int64_t)a4 photoFormat:(id)a5
{
  int64_t var1 = a5.var1;
  int64_t var0 = a5.var0;
  BOOL v9 = [(CAMCaptureCapabilities *)self isPhotoModeDepthSuggestionSupportedForDevicePosition:a4];
  BOOL v10 = -[CAMCaptureCapabilities isDepthEffectApertureSupportedForPhotoFormat:](self, "isDepthEffectApertureSupportedForPhotoFormat:", var0, var1);
  if (a3) {
    BOOL v11 = 0;
  }
  else {
    BOOL v11 = v9;
  }
  return v11 && v10;
}

- (BOOL)isDepthEffectApertureSupportedForPhotoFormat:(id)a3
{
  return a3.var0 < 2uLL && a3.var1 < 3uLL;
}

- (double)minimumDepthEffectApertureForMode:(int64_t)a3 device:(int64_t)a4
{
  BOOL v5 = [(CAMCaptureCapabilities *)self isDepthEffectApertureSupported];
  double result = 1.4;
  if (a3 == 7) {
    double result = 2.0;
  }
  if (!v5) {
    return 0.0;
  }
  return result;
}

- (double)maximumDepthEffectApertureForMode:(int64_t)a3 device:(int64_t)a4
{
  BOOL v4 = [(CAMCaptureCapabilities *)self isDepthEffectApertureSupported];
  double result = 0.0;
  if (v4) {
    return 16.0;
  }
  return result;
}

- (double)defaultDepthEffectApertureForMode:(int64_t)a3 device:(int64_t)a4 zoomFactor:(double)a5
{
  int64_t v9 = a4 - 1;
  if ((unint64_t)(a4 - 1) > 0xA)
  {
    uint64_t v11 = 0;
    double v10 = 2.8;
  }
  else
  {
    double v10 = dbl_209C7B360[v9];
    uint64_t v11 = qword_209C7B450[v9];
  }
  BOOL v12 = [(CAMCaptureCapabilities *)self isDepthEffectApertureSupportedForMode:a3 devicePosition:v11];
  double result = 0.0;
  if (v12)
  {
    unint64_t v14 = -[CAMCaptureCapabilities resolvedDeviceForDesiredDevice:mode:videoConfiguration:videoStabilizationStrength:spatialVideoEnabled:](self, "resolvedDeviceForDesiredDevice:mode:videoConfiguration:videoStabilizationStrength:spatialVideoEnabled:", a4, a3, 0, 0, 0, 0.0);
    +[CAMZoomControlUtilities zoomScaleFromDevice:2 toDevice:v14];
    double v16 = v15;
    [(CAMCaptureCapabilities *)self quadraWideRelativeZoomFactor];
    double v18 = 0.0;
    if (v14 <= 0xB)
    {
      if (((1 << v14) & 0xB10) != 0)
      {
        double v18 = 4.5;
      }
      else
      {
        double v19 = v16 * v17;
        if (((1 << v14) & 0xC0) != 0)
        {
          if ([(CAMCaptureCapabilities *)self continuousZoomSupportedForPortraitMode]|| [(CAMCaptureCapabilities *)self isPhotoModeDepthSuggestionSupportedForDevicePosition:v11])
          {
            CEKProgressClamped();
            CEKInterpolateClamped();
            uint64_t v20 = objc_msgSend(MEMORY[0x263F30688], "closestValidValueForAperture:");
            [v20 doubleValue];
            double v18 = v21;
          }
          else
          {
            uint64_t v20 = [(CAMCaptureCapabilities *)self significantZoomFactorsForMode:a3 device:v14];
            uint64_t v22 = [NSNumber numberWithDouble:a5];
            unsigned __int8 v23 = [v20 containsObject:v22];

            if ((v23 & (v19 == a5)) != 0) {
              double v18 = 4.5;
            }
            else {
              double v18 = 2.8;
            }
          }
        }
        else if (v14 == 2)
        {
          if ([(CAMCaptureCapabilities *)self isQuadraWideSupported] && v19 == a5) {
            double v18 = 4.5;
          }
          else {
            double v18 = 2.8;
          }
        }
      }
    }
    if (((a3 == 7) & [(CAMCaptureCapabilities *)self continuousZoomSupportedForCinematicMode]) != 0)return v10; {
    else
    }
      return v18;
  }
  return result;
}

- (double)minimumPortraitEffectIntensity
{
  return 0.0;
}

- (double)maximumPortraitEffectIntensity
{
  BOOL v2 = [(CAMCaptureCapabilities *)self isPortraitEffectIntensitySupported];
  double result = 0.0;
  if (v2) {
    return 1.0;
  }
  return result;
}

- (double)defaultPortraitEffectIntensity
{
  BOOL v2 = [(CAMCaptureCapabilities *)self isPortraitEffectIntensitySupported];
  double result = 0.0;
  if (v2) {
    return 0.5;
  }
  return result;
}

- (BOOL)isPortraitEffectIntensitySupportedForLightingType:(int64_t)a3
{
  return (unint64_t)(a3 - 2) <= 4
      && [(CAMCaptureCapabilities *)self isPortraitEffectIntensitySupported];
}

- (BOOL)isPortraitEffectIntensitySupportedForMode:(int64_t)a3
{
  BOOL v5 = [(CAMCaptureCapabilities *)self isPortraitEffectIntensitySupported];
  if (v5)
  {
    LOBYTE(v5) = [(CAMCaptureCapabilities *)self isLightingControlSupportedForMode:a3];
  }
  return v5;
}

- (BOOL)isTapAndBiasSupportedForMode:(int64_t)a3
{
  return ((unint64_t)a3 < 0xA) & (0x377u >> a3);
}

- (BOOL)isExposureSliderSupportedForMode:(int64_t)a3
{
  return (unint64_t)a3 <= 9
      && ((1 << a3) & 0x3E7) != 0
      && [(CAMCaptureCapabilities *)self isExposureSliderSupported];
}

- (BOOL)isTapToExposeSupportedForMode:(int64_t)a3
{
  return ((unint64_t)a3 < 0xA) & (0x37Fu >> a3);
}

- (BOOL)isExposureClippingIndicatorSupportedForMode:(int64_t)a3 videoConfiguration:(int64_t)a4
{
  BOOL v7 = -[CAMCaptureCapabilities isExposureSliderSupportedForMode:](self, "isExposureSliderSupportedForMode:");
  if (v7)
  {
    if ([(CAMCaptureCapabilities *)self _forceDisableExposureClippingIndicator])
    {
      LOBYTE(v7) = 0;
    }
    else if ([(CAMCaptureCapabilities *)self _forceEnableExposureClippingIndicator])
    {
      LOBYTE(v7) = 1;
    }
    else
    {
      BOOL v8 = (unint64_t)a4 <= 0xC && ((1 << a4) & 0x1CE1) != 0 || (unint64_t)(a4 - 10000) < 6;
      LOBYTE(v7) = ((unint64_t)a3 < 0xA) & (0x3F3u >> a3) & v8;
    }
  }
  return v7;
}

- (BOOL)isImageAnalysisSupportedForMode:(int64_t)a3 devicePosition:(int64_t)a4
{
  BOOL result = [(CAMCaptureCapabilities *)self isImageAnalysisSupported];
  if (a3 & 0xFFFFFFFFFFFFFFFBLL | a4) {
    return 0;
  }
  return result;
}

- (BOOL)isSemanticDevelopmentSupportedForMode:(int64_t)a3
{
  BOOL v4 = +[CAMCaptureCapabilities capabilities];
  char v5 = [v4 semanticDevelopmentSupported];

  return *(_DWORD *)&v5 & ((unint64_t)a3 < 7) & (0x51u >> a3);
}

- (BOOL)isZoomPlatterSupportedForMode:(int64_t)a3 devicePosition:(int64_t)a4 videoConfiguration:(int64_t)a5
{
  BOOL v9 = [(CAMCaptureCapabilities *)self isZoomPlatterSupported];
  BOOL result = 0;
  if (!a4 && v9)
  {
    if ((unint64_t)a3 > 9)
    {
      return 0;
    }
    else if (a3 == 6)
    {
      return [(CAMCaptureCapabilities *)self isQuadraWideZoomButtonSupportedForMode:6 devicePosition:0 videoConfiguration:a5];
    }
    else
    {
      return 1;
    }
  }
  return result;
}

- (BOOL)isZoomAllowedForMode:(int64_t)a3 device:(int64_t)a4 videoConfiguration:(int64_t)a5 videoStabilizationStrength:(int64_t)a6
{
  [(CAMCaptureCapabilities *)self maximumZoomFactorForMode:a3 device:a4 videoConfiguration:a5 videoStabilizationStrength:a6];
  return v6 > 1.0;
}

- (unint64_t)frontZoomBehaviorForCaptureMode:(int64_t)a3
{
  BOOL v4 = [(CAMCaptureCapabilities *)self _FFCZoomBehaviorForCaptureMode];
  char v5 = [NSNumber numberWithInteger:a3];
  double v6 = [v4 objectForKeyedSubscript:v5];

  if (v6) {
    unint64_t v7 = [v6 unsignedIntegerValue];
  }
  else {
    unint64_t v7 = 0;
  }

  return v7;
}

- (BOOL)shouldAdjustZoomOnOrientationChangeForDevicePosition:(int64_t)a3
{
  if (a3 == 1) {
    return ![(CAMCaptureCapabilities *)self _isiPad];
  }
  else {
    return 0;
  }
}

- (double)maximumZoomFactorForMode:(int64_t)a3 device:(int64_t)a4 videoConfiguration:(int64_t)a5 videoStabilizationStrength:(int64_t)a6
{
  [(CAMCaptureCapabilities *)self maximumZoomFactorForMode:a3 device:a4 videoConfiguration:a5 videoStabilizationStrength:a6 shouldResolveDevice:1];
  return result;
}

- (double)maximumZoomFactorForMode:(int64_t)a3 device:(int64_t)a4 videoConfiguration:(int64_t)a5 videoStabilizationStrength:(int64_t)a6 shouldResolveDevice:(BOOL)a7
{
  unint64_t v8 = a4;
  if ((unint64_t)(a4 - 8) >= 3 && a4 != 11 && a4 != 1)
  {
    uint64_t v12 = 0;
    int v11 = 1;
    if (!a7) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  int v11 = 0;
  uint64_t v12 = 1;
  if (a7) {
LABEL_5:
  }
    unint64_t v8 = [(CAMCaptureCapabilities *)self resolvedDeviceForDesiredDevice:a4 mode:a3 videoConfiguration:a5 videoStabilizationStrength:a6 spatialVideoEnabled:0];
LABEL_6:
  if (![(CAMCaptureCapabilities *)self _forcedBackCamera]
    || v8 != [(CAMCaptureCapabilities *)self _forcedBackCamera]
    || (double v13 = 1.0, [(CAMCaptureCapabilities *)self _allowZoomWithForcedBackCamera]))
  {
    BOOL v14 = v8 <= 7 && v8 == 7;
    BOOL v15 = v8 <= 7 && v8 == 4;
    BOOL v16 = v8 <= 7 && v8 == 6;
    if (v8 <= 7) {
      unsigned int v17 = (0xF7u >> v8) & 1;
    }
    else {
      LOBYTE(v17) = 1;
    }
    BOOL v18 = ((unint64_t)a5 <= 0xC && a5 != 4 || (unint64_t)(a5 - 10000) < 6)
       && [(CAMCaptureCapabilities *)self isQuadraWideBinningReconfigurationSupportedForMode:a3 devicePosition:v12 videoConfiguration:a5];
    double v13 = 1.0;
    switch(a3)
    {
      case 0:
      case 4:
        if (v14)
        {
          if (v11) {
            [(CAMCaptureCapabilities *)self _backTripleCameraPhotoModeMaximumZoomFactor];
          }
          else {
            [(CAMCaptureCapabilities *)self _frontTripleCameraPhotoModeMaximumZoomFactor];
          }
          goto LABEL_59;
        }
        if (v15 || v16)
        {
          if (v11) {
            [(CAMCaptureCapabilities *)self _backDualPhotoModeMaximumZoomFactor];
          }
          else {
            [(CAMCaptureCapabilities *)self _frontDualPhotoModeMaximumZoomFactor];
          }
          goto LABEL_59;
        }
        if (v11) {
          [(CAMCaptureCapabilities *)self _backPhotoModeMaximumZoomFactor];
        }
        else {
          [(CAMCaptureCapabilities *)self _frontPhotoModeMaximumZoomFactor];
        }
        goto LABEL_69;
      case 1:
        if (v14)
        {
          if (!v11) {
            goto LABEL_41;
          }
          goto LABEL_33;
        }
        if (v15 || v16)
        {
          if (!v11) {
            goto LABEL_58;
          }
          [(CAMCaptureCapabilities *)self _backDualVideoModeMaximumZoomFactor];
          goto LABEL_59;
        }
        double v21 = self;
        if (v11) {
          goto LABEL_68;
        }
        [(CAMCaptureCapabilities *)self _frontVideoModeMaximumZoomFactor];
        goto LABEL_69;
      case 2:
        if (v14)
        {
          if (v11) {
LABEL_33:
          }
            [(CAMCaptureCapabilities *)self _backTripleCameraVideoModeMaximumZoomFactor];
          else {
LABEL_41:
          }
            [(CAMCaptureCapabilities *)self _frontTripleCameraVideoModeMaximumZoomFactor];
          goto LABEL_59;
        }
        if (v15 || v16)
        {
          if (v11) {
            [(CAMCaptureCapabilities *)self _backDualSlomoModeMaximumZoomFactor];
          }
          else {
LABEL_58:
          }
            [(CAMCaptureCapabilities *)self _frontDualVideoModeMaximumZoomFactor];
LABEL_59:
          double v13 = v19;
          goto LABEL_60;
        }
        if (v11)
        {
          double v21 = self;
LABEL_68:
          [(CAMCaptureCapabilities *)v21 _backVideoModeMaximumZoomFactor];
LABEL_69:
          double v13 = v20;
        }
        if (v18)
        {
          [(CAMCaptureCapabilities *)self quadraWideRelativeZoomFactor];
          double v13 = v13 * v27;
        }
LABEL_60:
        if (v13 == 1.0) {
          char v22 = 1;
        }
        else {
          char v22 = v17;
        }
        if ((v22 & 1) == 0)
        {
          [(CAMCaptureCapabilities *)self dualCameraSwitchOverZoomFactorForDevicePosition:v12];
          double v24 = v23;
          [(CAMCaptureCapabilities *)self telephotoDisplayZoomFactor];
          double v13 = v13 * v25 / v24;
        }
        break;
      case 6:
        if (!v11) {
          return v13;
        }
        [(CAMCaptureCapabilities *)self _backPortraitModeMaximumZoomFactor];
        goto LABEL_59;
      case 7:
        if ((v11 & v16 & [(CAMCaptureCapabilities *)self continuousZoomSupportedForCinematicMode]) != 1)return v13; {
        [(CAMCaptureCapabilities *)self _backWideDualCinematicModeMaximumZoomFactor];
        }
        goto LABEL_59;
      default:
        return v13;
    }
  }
  return v13;
}

- (double)defaultZoomFactorForGraphConfiguration:(id)a3 captureOrientation:(int64_t)a4 customLens:(int64_t)a5 outputToExternalStorage:(BOOL)a6 overrodeWithForcedZoomValue:(BOOL *)a7
{
  id v8 = a3;
  uint64_t v9 = [v8 mode];
  uint64_t v10 = [v8 device];
  uint64_t v11 = [v8 videoConfiguration];
  uint64_t v12 = [v8 videoStabilizationStrength];
  uint64_t v13 = [v8 videoEncodingBehavior];
  char v14 = [v8 enableStereoVideoCapture];
  char v15 = [v8 trueVideoEnabled];
  char v16 = [v8 prefersHDR10BitVideo];

  BYTE3(v18) = v16;
  BYTE2(v18) = v15;
  BYTE1(v18) = v14;
  LOBYTE(v18) = a6;
  -[CAMCaptureCapabilities defaultZoomFactorForMode:device:videoConfiguration:captureOrientation:videoStabilizationStrength:videoEncodingBehavior:customLens:outputToExternalStorage:spatialVideoEnabled:isTrueVideo:prefersHDR10BitVideo:overrodeWithForcedZoomValue:](self, "defaultZoomFactorForMode:device:videoConfiguration:captureOrientation:videoStabilizationStrength:videoEncodingBehavior:customLens:outputToExternalStorage:spatialVideoEnabled:isTrueVideo:prefersHDR10BitVideo:overrodeWithForcedZoomValue:", v9, v10, v11, a4, v12, v13, a5, v18, a7);
  return result;
}

- (double)defaultZoomFactorForMode:(int64_t)a3 device:(int64_t)a4 videoConfiguration:(int64_t)a5 captureOrientation:(int64_t)a6
{
  LODWORD(v7) = 0;
  -[CAMCaptureCapabilities defaultZoomFactorForMode:device:videoConfiguration:captureOrientation:videoStabilizationStrength:videoEncodingBehavior:customLens:outputToExternalStorage:spatialVideoEnabled:isTrueVideo:prefersHDR10BitVideo:overrodeWithForcedZoomValue:](self, "defaultZoomFactorForMode:device:videoConfiguration:captureOrientation:videoStabilizationStrength:videoEncodingBehavior:customLens:outputToExternalStorage:spatialVideoEnabled:isTrueVideo:prefersHDR10BitVideo:overrodeWithForcedZoomValue:", a3, a4, a5, a6, 0, 1, 0, v7, 0);
  return result;
}

- (double)defaultZoomFactorForMode:(int64_t)a3 device:(int64_t)a4 videoConfiguration:(int64_t)a5 captureOrientation:(int64_t)a6 videoStabilizationStrength:(int64_t)a7 videoEncodingBehavior:(int64_t)a8 customLens:(int64_t)a9 outputToExternalStorage:(BOOL)a10 spatialVideoEnabled:(BOOL)a11 isTrueVideo:(BOOL)a12 prefersHDR10BitVideo:(BOOL)a13 overrodeWithForcedZoomValue:(BOOL *)a14
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  int64_t v21 = [(CAMCaptureCapabilities *)self resolvedDeviceForDesiredDevice:a4 mode:a3 videoConfiguration:a5 videoStabilizationStrength:a7 spatialVideoEnabled:a11];
  int64_t v22 = v21;
  if ((unint64_t)(v21 - 8) < 3) {
    goto LABEL_4;
  }
  if (v21 == 11)
  {
    [(CAMCaptureCapabilities *)self maximumZoomFactorForMode:a3 device:11 videoConfiguration:a5 videoStabilizationStrength:a7];
    double v25 = v33;
    BOOL v27 = 0;
    double v26 = 1.0;
    goto LABEL_26;
  }
  if (v21 == 1)
  {
LABEL_4:
    char v55 = 0;
    uint64_t v23 = 1;
  }
  else
  {
    uint64_t v23 = 0;
    char v55 = 1;
  }
  [(CAMCaptureCapabilities *)self maximumZoomFactorForMode:a3 device:v21 videoConfiguration:a5 videoStabilizationStrength:a7];
  double v25 = v24;
  if ((unint64_t)(v22 - 6) >= 2)
  {
    if (v22 != 4)
    {
      double v26 = 1.0;
      BOOL v27 = v22 == 10;
      goto LABEL_24;
    }
    if ([(CAMCaptureCapabilities *)self isDualDeviceDisparitySupportedForMode:a3 devicePosition:v23])
    {
      [(CAMCaptureCapabilities *)self wideToTelephotoZoomFactorForDevicePosition:v23];
      double v26 = v34;
      goto LABEL_21;
    }
LABEL_23:
    BOOL v27 = 0;
    double v26 = 1.0;
    goto LABEL_24;
  }
  [(CAMCaptureCapabilities *)self wideDualCameraSwitchOverZoomFactorForDevicePosition:v23];
  double v26 = v28;
  BOOL v29 = [(CAMCaptureCapabilities *)self isQuadraWideZoomButtonSupportedForMode:a3 devicePosition:v23 videoConfiguration:a5];
  if (a3 == 6 && v29)
  {
    [(CAMCaptureCapabilities *)self _backWideDualCameraSwitchOverZoomFactor];
    double v31 = v30;
    [(CAMCaptureCapabilities *)self quadraWideRelativeZoomFactor];
    double v26 = v31 * v32;
  }
  BYTE2(v54) = a13;
  LOWORD(v54) = __PAIR16__(a12, a11);
  if (!-[CAMCaptureCapabilities isVideoStabilizationStrength:supportedForMode:device:videoConfiguration:videoEncodingBehavior:outputToExternalStorage:spatialVideoEnabled:trueVideoEnabled:prefersHDR10BitVideo:](self, "isVideoStabilizationStrength:supportedForMode:device:videoConfiguration:videoEncodingBehavior:outputToExternalStorage:spatialVideoEnabled:trueVideoEnabled:prefersHDR10BitVideo:", a7, a3, a4, a5, a8, a10, v54))
  {
    BOOL v27 = 0;
    goto LABEL_24;
  }
  if (a7 == 3) {
    goto LABEL_23;
  }
  if (a7 != 2)
  {
LABEL_21:
    BOOL v27 = 0;
    goto LABEL_24;
  }
  BOOL v27 = 0;
  if (![(CAMCaptureCapabilities *)self featureDevelopmentDefaultWideHighStabilization])double v26 = 1.0; {
LABEL_24:
  }
  if (v55)
  {
    int v35 = 1;
    goto LABEL_37;
  }
LABEL_26:
  unint64_t v36 = [(CAMCaptureCapabilities *)self frontZoomBehaviorForCaptureMode:a3];
  if (v36 - 1 >= 2)
  {
    if (v36 != 3)
    {
LABEL_35:
      int v35 = 0;
      goto LABEL_37;
    }
LABEL_36:
    int v35 = 0;
    double v26 = 1.0;
    goto LABEL_37;
  }
  if (![(CAMCaptureCapabilities *)self shouldAdjustZoomOnOrientationChangeForDevicePosition:1])
  {
    if (v27)
    {
      [(CAMCaptureCapabilities *)self superWideToWideZoomFactorForDevicePosition:1];
      double v26 = v38;
      goto LABEL_35;
    }
    goto LABEL_36;
  }
  int64_t v37 = a6;
  int v35 = 0;
  if ((unint64_t)(v37 - 1) >= 2) {
    double v26 = 1.0;
  }
  else {
    double v26 = v25;
  }
LABEL_37:
  [(CAMCaptureCapabilities *)self _forcedInitialZoomDisplayFactor];
  if (v39 > 0.0)
  {
    double v40 = v39;
    id v56 = 0;
    id v57 = 0;
    BOOL v41 = +[CAMZoomControlUtilities shouldApplyContinuousZoomForMode:a3 device:v22 videoConfiguration:a5 videoStabilizationStrength:a7 zoomFactors:&v57 displayZoomFactors:&v56];
    id v42 = v57;
    id v43 = v56;
    if (!v41)
    {
      if (!v35)
      {
LABEL_54:

        goto LABEL_55;
      }
      +[CAMZoomControlUtilities zoomScaleFromDevice:2 toDevice:v22];
      double v47 = v40 * v46;
      v48 = [(CAMCaptureCapabilities *)self significantZoomFactorsForMode:a3 device:v22];
      int v49 = [NSNumber numberWithDouble:v47];
      int v35 = [v48 containsObject:v49];

      if (v35) {
        double v26 = v47;
      }
LABEL_53:

      goto LABEL_54;
    }
    +[CAMZoomControlUtilities piecewiseLinearMappingForX:v43 fromXValues:v42 toYValues:v40];
    double v45 = v44;
    if (v44 == v26)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"unchanged from %g", *(void *)&v26);
    }
    else
    {
      if (v44 >= 1.0)
      {
        v48 = objc_msgSend(NSString, "stringWithFormat:", @"instead of %g", *(void *)&v26);
        int v35 = 1;
        goto LABEL_49;
      }
      [NSString stringWithFormat:@"IGNORING, using default %g", *(void *)&v26];
    v48 = };
    int v35 = 0;
LABEL_49:
    BOOL v50 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134219010;
      double v59 = v40;
      __int16 v60 = 2048;
      double v61 = v45;
      __int16 v62 = 2114;
      v63 = v48;
      __int16 v64 = 2114;
      id v65 = v43;
      __int16 v66 = 2114;
      id v67 = v42;
      _os_log_impl(&dword_2099F8000, v50, OS_LOG_TYPE_DEFAULT, "Zoom override: displayFactor=%g -> zoomFactor=%g (%{public}@). displayZoomFactors = %{public}@, zoomFactors = %{public}@", buf, 0x34u);
    }

    if (v35) {
      double v26 = v45;
    }
    goto LABEL_53;
  }
  LOBYTE(v35) = 0;
LABEL_55:
  if ([(CAMCaptureCapabilities *)self isCustomLensSupportedForMode:a3 device:v22 isTrueVideo:a12]&& (v35 & 1) == 0)
  {
    if ((unint64_t)a9 > 5) {
      double v51 = NAN;
    }
    else {
      double v51 = dbl_209C7B3E8[a9] / dbl_209C7B3B8[a9];
    }
    [(CAMCaptureCapabilities *)self zoomFactorForCustomLensZoomFactor:v26 * v51];
    double v26 = v52;
  }
  if (a14) {
    *a14 = v35;
  }
  return v26;
}

- (BOOL)zoomControlSupported
{
  if ([(CAMCaptureCapabilities *)self isDualSupported]
    || [(CAMCaptureCapabilities *)self isWideDualSupported]
    || [(CAMCaptureCapabilities *)self isTripleCameraSupported]
    || [(CAMCaptureCapabilities *)self isFrontSuperWideSupported])
  {
    return 1;
  }
  return [(CAMCaptureCapabilities *)self isBackQuadraWideSupported];
}

- (id)significantZoomFactorsForMode:(int64_t)a3 device:(int64_t)a4
{
  v23[1] = *MEMORY[0x263EF8340];
  if ((unint64_t)(a4 - 8) < 3) {
    goto LABEL_4;
  }
  if (a4 == 11)
  {
    [(CAMCaptureCapabilities *)self isDualDeviceDisparitySupportedForMode:a3 devicePosition:1];
    goto LABEL_16;
  }
  if (a4 == 1) {
LABEL_4:
  }
    uint64_t v7 = 1;
  else {
    uint64_t v7 = 0;
  }
  BOOL v8 = [(CAMCaptureCapabilities *)self isDualDeviceDisparitySupportedForMode:a3 devicePosition:v7];
  if ((unint64_t)(a4 - 6) < 2 || a4 == 2) {
    goto LABEL_10;
  }
  if (a4 == 4)
  {
    if (v8)
    {
      [(CAMCaptureCapabilities *)self wideToTelephotoZoomFactorForDevicePosition:v7];
      uint64_t v9 = objc_msgSend(NSNumber, "numberWithDouble:");
      v23[0] = v9;
      uint64_t v10 = (void *)MEMORY[0x263EFF8C0];
      uint64_t v11 = v23;
      goto LABEL_13;
    }
LABEL_10:
    +[CAMZoomControlUtilities zoomScaleFromDevice:2 toDevice:a4];
    double v13 = v12;
    BOOL v14 = [(CAMCaptureCapabilities *)self isQuadraWideZoomButtonSupportedForMode:a3 devicePosition:v7 videoConfiguration:0];
    uint64_t v15 = [NSNumber numberWithDouble:v13];
    uint64_t v9 = (void *)v15;
    if (v14)
    {
      v22[0] = v15;
      char v16 = NSNumber;
      [(CAMCaptureCapabilities *)self quadraWideRelativeZoomFactor];
      uint64_t v18 = [v16 numberWithDouble:v13 * v17];
      v22[1] = v18;
      double v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:2];

LABEL_14:
      goto LABEL_17;
    }
    uint64_t v21 = v15;
    uint64_t v10 = (void *)MEMORY[0x263EFF8C0];
    uint64_t v11 = &v21;
LABEL_13:
    double v19 = [v10 arrayWithObjects:v11 count:1];
    goto LABEL_14;
  }
LABEL_16:
  double v19 = &unk_26BDE02C8;
LABEL_17:
  return v19;
}

- (BOOL)processZoomWithoutUpscaleForDevicePosition:(int64_t)a3
{
  if (a3 == 1) {
    return [(CAMCaptureCapabilities *)self _processZoomWithoutUpscaleFront];
  }
  if (a3) {
    return 0;
  }
  return [(CAMCaptureCapabilities *)self _processZoomWithoutUpscaleBack];
}

- (int64_t)resolvedDefaultCustomLens
{
  if (![(CAMCaptureCapabilities *)self focalLengthPickerSupported]) {
    return 0;
  }
  uint64_t v3 = [(CAMCaptureCapabilities *)self availableCustomLenses];
  uint64_t v4 = [v3 firstObject];
  int64_t v5 = [v4 integerValue];

  return v5;
}

- (int64_t)effectiveFocalLengthForCustomLens:(int64_t)a3
{
  if ((unint64_t)a3 > 5) {
    return 0;
  }
  if (((1 << a3) & 0x34) != 0) {
    return 2;
  }
  if (((1 << a3) & 0xA) != 0) {
    return 1;
  }
  return [(CAMCaptureCapabilities *)self baseFocalLengthForWideCamera];
}

- (int64_t)baseFocalLengthForCustomLens:(int64_t)a3
{
  if ((unint64_t)(a3 - 3) < 2) {
    return 3;
  }
  if (a3 == 5) {
    return 1;
  }
  if (a3) {
    return 0;
  }
  return [(CAMCaptureCapabilities *)self baseFocalLengthForWideCamera];
}

- (NSArray)defaultCustomLensGroup
{
  BOOL v2 = [(CAMCaptureCapabilities *)self supportedCustomLensGroups];
  uint64_t v3 = [v2 lastObject];

  return (NSArray *)v3;
}

- (int64_t)supportedCustomLensForLens:(int64_t)a3 inGroup:(id)a4
{
  double v6 = [(CAMCaptureCapabilities *)self supportedCustomLensGroupForGroup:a4];
  int64_t v7 = [(CAMCaptureCapabilities *)self _nearestCustomLensToLens:a3 inGroup:v6];

  return v7;
}

- (id)supportedCustomLensGroupForGroup:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = v4;
    double v6 = [(CAMCaptureCapabilities *)self availableCustomLenses];
    int64_t v7 = [(CAMCaptureCapabilities *)self supportedCustomLensGroups];
    if (([v7 containsObject:v5] & 1) == 0)
    {
      double v17 = v7;
      BOOL v8 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v5, "count"));
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v9 = v5;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v19;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v19 != v12) {
              objc_enumerationMutation(v9);
            }
            BOOL v14 = objc_msgSend(NSNumber, "numberWithInteger:", -[CAMCaptureCapabilities _nearestCustomLensToLens:inGroup:](self, "_nearestCustomLensToLens:inGroup:", objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "integerValue"), v6));
            [v8 addObject:v14];
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v11);
      }

      int64_t v7 = v17;
      if ([v17 containsObject:v8])
      {
        id v15 = v8;
      }
      else
      {
        id v15 = [(CAMCaptureCapabilities *)self defaultCustomLensGroup];
      }
      id v5 = v15;
    }
  }
  else
  {
    id v5 = [(CAMCaptureCapabilities *)self defaultCustomLensGroup];
  }

  return v5;
}

- (int64_t)_nearestCustomLensToLens:(int64_t)a3 inGroup:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a4;
  unint64_t v7 = [(CAMCaptureCapabilities *)self effectiveFocalLengthForCustomLens:a3];
  double v8 = 0.0;
  if (v7 <= 3) {
    double v8 = dbl_209C7B418[v7];
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    int64_t v12 = 0;
    uint64_t v13 = *(void *)v22;
    double v14 = 1.79769313e308;
LABEL_5:
    uint64_t v15 = 0;
    while (1)
    {
      if (*(void *)v22 != v13) {
        objc_enumerationMutation(v9);
      }
      int64_t v16 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v15), "integerValue", (void)v21);
      unint64_t v17 = [(CAMCaptureCapabilities *)self effectiveFocalLengthForCustomLens:v16];
      double v18 = 0.0;
      if (v17 <= 3) {
        double v18 = dbl_209C7B418[v17];
      }
      double v19 = vabdd_f64(v18, v8);
      if (v19 < v14)
      {
        int64_t v12 = v16;
        double v14 = v19;
        if (v18 - v8 == 0.0) {
          break;
        }
      }
      if (v11 == ++v15)
      {
        uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
        int64_t v16 = v12;
        if (v11) {
          goto LABEL_5;
        }
        break;
      }
    }
  }
  else
  {
    int64_t v16 = 0;
  }

  return v16;
}

- (BOOL)isCustomLensSupportedForMode:(int64_t)a3 device:(int64_t)a4 isTrueVideo:(BOOL)a5
{
  BOOL v8 = [(CAMCaptureCapabilities *)self focalLengthPickerSupported];
  BOOL v9 = a3 == 1 && a5;
  if (a3) {
    char v10 = v9;
  }
  else {
    char v10 = 1;
  }
  unsigned int v11 = *(_DWORD *)&v10 & ((unint64_t)a4 < 8) & (0xD5u >> a4);
  if (v8) {
    return v11;
  }
  else {
    return 0;
  }
}

- (BOOL)isCustomLensSupportedForPhotoResolution:(int64_t)a3
{
  BOOL result = [(CAMCaptureCapabilities *)self focalLengthPickerSupported];
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) != 2) {
    return 0;
  }
  return result;
}

- (double)zoomFactorForCustomLensZoomFactor:(double)a3
{
  [(CAMCaptureCapabilities *)self _maximumZoomFactorWithout24MPUpscale];
  if (vabdd_f64(a3, result) / result >= 0.05) {
    return a3;
  }
  return result;
}

- (int64_t)preferredDeviceForPosition:(int64_t)a3 mode:(int64_t)a4 videoConfiguration:(int64_t)a5 videoStabilizationStrength:(int64_t)a6 spatialVideoEnabled:(BOOL)a7
{
  int64_t v7 = a5;
  v32[1] = *MEMORY[0x263EF8340];
  if (a3)
  {
    if (a3 == 1)
    {
      if (-[CAMCaptureCapabilities isPearlSupportedForMode:devicePosition:](self, "isPearlSupportedForMode:devicePosition:", a4, 1, a5, a6, a7))
      {
        return 9;
      }
      else if ([(CAMCaptureCapabilities *)self frontZoomBehaviorForCaptureMode:a4] {
              - 1 > 1)
      }
      {
        return 8;
      }
      else if ([(CAMCaptureCapabilities *)self isSuperWideSupportedForMode:a4 devicePosition:1 videoConfiguration:v7])
      {
        return 10;
      }
      else
      {
        return 8;
      }
    }
    else
    {
      return 0;
    }
  }
  else
  {
    switch(a4)
    {
      case 0:
      case 2:
      case 3:
      case 4:
      case 5:
        int64_t v12 = &unk_26BDE0328;
        break;
      case 1:
        uint64_t v13 = &unk_26BDE0310;
        double v14 = &unk_26BDE02F8;
        BOOL v15 = !a7;
        goto LABEL_17;
      case 6:
        BOOL v16 = [(CAMCaptureCapabilities *)self _preferWideDualPortrait];
        uint64_t v13 = &unk_26BDE0358;
        double v14 = &unk_26BDE0340;
        BOOL v15 = !v16;
LABEL_17:
        if (v15) {
          int64_t v12 = v13;
        }
        else {
          int64_t v12 = v14;
        }
        break;
      case 7:
        int64_t v12 = &unk_26BDE0370;
        break;
      case 8:
      case 9:
        int64_t v12 = &unk_26BDE02E0;
        break;
      default:
        int64_t v12 = 0;
        break;
    }
    int64_t v17 = -[CAMCaptureCapabilities _forcedBackDeviceForMode:videoConfiguration:](self, "_forcedBackDeviceForMode:videoConfiguration:", a4, v7, a5, a6, a7);
    if (v17)
    {
      double v18 = [NSNumber numberWithInteger:v17];
      v32[0] = v18;
      double v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:1];
      int64_t v12 = [v19 arrayByAddingObjectsFromArray:v12];
    }
    if ((a6 & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      uint64_t v20 = [v12 arrayByAddingObject:&unk_26BDDE730];

      if ([(CAMCaptureCapabilities *)self _needsForcedSingleCameraEmulationForVideoStabilizationStrength:a6 videoConfiguration:v7 mode:a4])
      {
        int64_t v7 = 9;
      }
      int64_t v12 = (void *)v20;
    }
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v21 = v12;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v28;
LABEL_29:
      uint64_t v25 = 0;
      while (2)
      {
        if (*(void *)v28 != v24) {
          objc_enumerationMutation(v21);
        }
        int64_t v10 = objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * v25), "integerValue", (void)v27);
        switch(v10)
        {
          case 2:
            if (![(CAMCaptureCapabilities *)self isWideSupportedForMode:a4 devicePosition:0 videoConfiguration:v7])goto LABEL_44; {
            break;
            }
          case 3:
            if (![(CAMCaptureCapabilities *)self isTelephotoSupportedForMode:a4 devicePosition:0 videoConfiguration:v7])goto LABEL_44; {
            break;
            }
          case 4:
            if (![(CAMCaptureCapabilities *)self isDualSupportedForMode:a4 devicePosition:0 videoConfiguration:v7 videoStabilizationStrength:a6])goto LABEL_44; {
            break;
            }
          case 5:
            if (![(CAMCaptureCapabilities *)self isSuperWideSupportedForMode:a4 devicePosition:0 videoConfiguration:v7])goto LABEL_44; {
            break;
            }
          case 6:
            if (![(CAMCaptureCapabilities *)self isWideDualSupportedForMode:a4 devicePosition:0 videoConfiguration:v7 videoStabilizationStrength:a6])goto LABEL_44; {
            break;
            }
          case 7:
            if (![(CAMCaptureCapabilities *)self isTripleCameraSupportedForMode:a4 devicePosition:0 videoConfiguration:v7 videoStabilizationStrength:a6])goto LABEL_44; {
            break;
            }
          default:
LABEL_44:
            if (v23 != ++v25) {
              continue;
            }
            uint64_t v23 = [v21 countByEnumeratingWithState:&v27 objects:v31 count:16];
            if (!v23) {
              goto LABEL_46;
            }
            goto LABEL_29;
        }
        break;
      }
    }
    else
    {
LABEL_46:
      int64_t v10 = 2;
    }
  }
  return v10;
}

- (int64_t)_forcedBackDeviceForMode:(int64_t)a3 videoConfiguration:(int64_t)a4
{
  int64_t v7 = [(CAMCaptureCapabilities *)self _forcedBackCamera];
  [(CAMCaptureCapabilities *)self _forcedInitialZoomDisplayFactor];
  if (!v7)
  {
    double v9 = v8;
    if (v8 != 0.0)
    {
      if (a3 == 6)
      {
        if ([(CAMCaptureCapabilities *)self continuousZoomSupportedForPortraitMode])
        {
          return 0;
        }
      }
      else if (a3 == 7 {
             && [(CAMCaptureCapabilities *)self continuousZoomSupportedForCinematicMode])
      }
      {
        return 0;
      }
      if ([(CAMCaptureCapabilities *)self isDualDeviceDisparitySupportedForMode:a3 devicePosition:0])
      {
        [(CAMCaptureCapabilities *)self telephotoDisplayZoomFactor];
        if (v9 == v10) {
          return 4;
        }
        [(CAMCaptureCapabilities *)self wideDisplayZoomFactor];
        if (v9 == v12) {
          return 6;
        }
        int64_t v7 = 0;
        if (![(CAMCaptureCapabilities *)self isQuadraWideZoomButtonSupportedForMode:a3 devicePosition:0 videoConfiguration:a4])return v7; {
        [(CAMCaptureCapabilities *)self quadraWideDisplayZoomFactor];
        }
        if (v9 == v14) {
          return 6;
        }
      }
      else if ((unint64_t)(a3 - 2) < 2 {
             || a3 == 5
      }
             || a3 == 1
             && (a4 == 4
              || a4 == 13
              || a4 == 9
              && [(CAMCaptureCapabilities *)self _backDualCameraVideoCapture4kMaxFPS] <= 59&& [(CAMCaptureCapabilities *)self _backWideDualCameraVideoCapture4kMaxFPS] <= 59&& [(CAMCaptureCapabilities *)self _backTripleCameraVideoCapture4kMaxFPS] <= 59))
      {
        [(CAMCaptureCapabilities *)self wideDisplayZoomFactor];
        if (v9 == v11) {
          return 2;
        }
        [(CAMCaptureCapabilities *)self telephotoDisplayZoomFactor];
        if (v9 == v13) {
          return 3;
        }
        [(CAMCaptureCapabilities *)self superWideDisplayZoomFactor];
        if (v9 == v15) {
          return 5;
        }
        int64_t v7 = 0;
        if (![(CAMCaptureCapabilities *)self isQuadraWideZoomButtonSupportedForMode:a3 devicePosition:0 videoConfiguration:a4])return v7; {
        [(CAMCaptureCapabilities *)self quadraWideDisplayZoomFactor];
        }
        if (v9 == v16) {
          return 2;
        }
      }
      return 0;
    }
  }
  return v7;
}

- (int64_t)resolvedDeviceForDesiredDevice:(int64_t)a3 mode:(int64_t)a4 videoConfiguration:(int64_t)a5 videoStabilizationStrength:(int64_t)a6 spatialVideoEnabled:(BOOL)a7
{
  BOOL v7 = a7;
  int64_t result = -[CAMCaptureCapabilities sanitizeDesiredDevice:forMode:](self, "sanitizeDesiredDevice:forMode:", a3);
  if ((unint64_t)(result - 8) < 3) {
    goto LABEL_4;
  }
  if (result == 11) {
    return result;
  }
  if (result == 1) {
LABEL_4:
  }
    uint64_t v13 = 1;
  else {
    uint64_t v13 = 0;
  }
  if ((unint64_t)(result - 2) >= 9)
  {
    if ((unint64_t)result > 1)
    {
      return 0;
    }
    else
    {
      return [(CAMCaptureCapabilities *)self preferredDeviceForPosition:v13 mode:a4 videoConfiguration:a5 videoStabilizationStrength:a6 spatialVideoEnabled:v7];
    }
  }
  return result;
}

- (BOOL)isContentAwareDistortionCorrectionSupportedForMode:(int64_t)a3
{
  return (a3 == 9 || !a3)
      && [(CAMCaptureCapabilities *)self contentAwareDistortionCorrectionSupported];
}

- (BOOL)isLinearDNGSupportedForMode:(int64_t)a3
{
  return !a3 && [(CAMCaptureCapabilities *)self isLinearDNGSupported];
}

- (BOOL)smartStylesSupportedForLightingType:(int64_t)a3
{
  return (unint64_t)a3 < 2;
}

- (unint64_t)semanticStyleSupportForMode:(int64_t)a3 devicePosition:(int64_t)a4
{
  if ([(CAMCaptureCapabilities *)self smartStylesSupported]) {
    unint64_t v7 = [(CAMCaptureCapabilities *)self _desiredSmartStyleSupportForMode:a3 devicePosition:a4];
  }
  else {
    unint64_t v7 = [(CAMCaptureCapabilities *)self _desiredSemanticStyleSupportForMode:a3 devicePosition:a4];
  }
  return [(CAMCaptureCapabilities *)self semanticStylesSupport] & v7;
}

- (unint64_t)_desiredSemanticStyleSupportForMode:(int64_t)a3 devicePosition:(int64_t)a4
{
  unint64_t result = 0;
  switch(a3)
  {
    case 0:
    case 4:
      unint64_t result = -1;
      break;
    case 1:
      unint64_t result = 1;
      break;
    case 6:
      if (a4) {
        BOOL v8 = [(CAMCaptureCapabilities *)self _frontPortraitSemanticStylesSupported];
      }
      else {
        BOOL v8 = [(CAMCaptureCapabilities *)self _rearPortraitSemanticStylesSupported];
      }
      if (v8) {
        unint64_t result = 7;
      }
      else {
        unint64_t result = 1;
      }
      break;
    case 9:
      unint64_t result = 5;
      break;
    default:
      return result;
  }
  return result;
}

- (unint64_t)_desiredSmartStyleSupportForMode:(int64_t)a3 devicePosition:(int64_t)a4
{
  unint64_t result = 0;
  switch(a3)
  {
    case 0:
    case 6:
      unint64_t result = -1;
      break;
    case 1:
    case 7:
      unint64_t result = [(CAMCaptureCapabilities *)self _smartStylesAdditionalSystemStyleSupport];
      break;
    default:
      return result;
  }
  return result;
}

- (id)captureStyleForCaptureWithSupport:(unint64_t)a3 styles:(id)a4 selectedStyleIndex:(unint64_t)a5 smartStyleSystemStyleIndex:(unint64_t)a6
{
  char v8 = a3;
  id v10 = a4;
  double v11 = v10;
  if ((v8 & 2) != 0)
  {
    if ([v10 count] > a5)
    {
      uint64_t v13 = v11;
      unint64_t v14 = a5;
LABEL_15:
      uint64_t v12 = [v13 objectAtIndexedSubscript:v14];
      goto LABEL_16;
    }
    double v15 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[CAMCaptureCapabilities captureStyleForCaptureWithSupport:styles:selectedStyleIndex:smartStyleSystemStyleIndex:](v11);
    }

LABEL_12:
    double v16 = 0;
    goto LABEL_17;
  }
  if (![(CAMCaptureCapabilities *)self smartStylesSupported])
  {
    if (v8)
    {
      uint64_t v12 = +[CAMSemanticStyle standardStyle];
      goto LABEL_16;
    }
    goto LABEL_12;
  }
  if (v8)
  {
    if ([v11 count] <= a6)
    {
      double v18 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[CAMCaptureCapabilities captureStyleForCaptureWithSupport:styles:selectedStyleIndex:smartStyleSystemStyleIndex:](v11);
      }

      uint64_t v12 = [MEMORY[0x263F306F8] systemStyle];
      goto LABEL_16;
    }
    uint64_t v13 = v11;
    unint64_t v14 = a6;
    goto LABEL_15;
  }
  uint64_t v12 = [MEMORY[0x263F306F8] identityStyle];
LABEL_16:
  double v16 = (void *)v12;
LABEL_17:

  return v16;
}

- (id)captureStyleForPreviewWithSupport:(unint64_t)a3 styles:(id)a4 selectedStyleIndex:(unint64_t)a5 smartStyleSystemStyleIndex:(unint64_t)a6
{
  id v10 = a4;
  if ([(CAMCaptureCapabilities *)self smartStylesSupported])
  {
    uint64_t v11 = [(CAMCaptureCapabilities *)self captureStyleForCaptureWithSupport:a3 styles:v10 selectedStyleIndex:a5 smartStyleSystemStyleIndex:a6];
LABEL_6:
    uint64_t v12 = (void *)v11;
    goto LABEL_11;
  }
  if ((a3 & 4) != 0)
  {
    if ([v10 count] > a5)
    {
      uint64_t v11 = [v10 objectAtIndexedSubscript:a5];
      goto LABEL_6;
    }
    uint64_t v13 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[CAMCaptureCapabilities captureStyleForCaptureWithSupport:styles:selectedStyleIndex:smartStyleSystemStyleIndex:](v10);
    }
  }
  uint64_t v12 = 0;
LABEL_11:

  return v12;
}

- (BOOL)isStillDuringVideoSupportedForVideoEncodingBehavior:(int64_t)a3
{
  return (unint64_t)a3 <= 1
      && [(CAMCaptureCapabilities *)self isStillDuringVideoSupported];
}

- (BOOL)isStillDuringVideoSupportedForMode:(int64_t)a3
{
  return (unint64_t)a3 < 3;
}

+ (BOOL)isPALVideoConfiguration:(int64_t)a3
{
  return ((unint64_t)a3 < 0xF) & (0x5800u >> a3);
}

+ (BOOL)isCameraAppInstalled
{
  BOOL v2 = [MEMORY[0x263F01880] defaultWorkspace];
  char v3 = [v2 applicationIsInstalled:@"com.apple.camera"];

  if (CFPreferencesGetAppBooleanValue(@"CAMFeatureDevelopmentEmulateAppDeletedSettings", @"com.apple.camera", 0))
  {
    return 0;
  }
  else
  {
    return v3;
  }
}

+ (BOOL)isMessagesAppInstalled
{
  BOOL v2 = [MEMORY[0x263F01880] defaultWorkspace];
  char v3 = [v2 applicationIsInstalled:@"com.apple.MobileSMS"];

  if (CFPreferencesGetAppBooleanValue(@"CAMFeatureDevelopmentEmulateMessagesAppDeletedSettings", @"com.apple.camera", 0))
  {
    return 0;
  }
  else
  {
    return v3;
  }
}

- (BOOL)enhancedHEICResolutionSupported
{
  if ([(CAMCaptureCapabilities *)self frontEnhancedHEICResolutionSupported]) {
    return 1;
  }
  return [(CAMCaptureCapabilities *)self backEnhancedHEICResolutionSupported];
}

- (BOOL)enhancedRAWResolutionSupported
{
  BOOL v2 = [(CAMCaptureCapabilities *)self _backCameraSupportedRAWResolutionsByMode];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (BOOL)backEnhancedHEICResolutionSupported
{
  BOOL v2 = [(CAMCaptureCapabilities *)self _backCameraSupportedCompressedResolutionsByMode];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (BOOL)isPhotoResolutionSupported:(int64_t)a3 forPhotoEncoding:(int64_t)a4
{
  if ([(CAMCaptureCapabilities *)self isPhotoResolutionSupported:a3 forMode:0 device:0 photoEncoding:a4])
  {
    return 1;
  }
  return [(CAMCaptureCapabilities *)self isPhotoResolutionSupported:a3 forMode:0 device:1 photoEncoding:a4];
}

- (BOOL)isPhotoResolutionSupported:(int64_t)a3 forMode:(int64_t)a4 device:(int64_t)a5 photoEncoding:(int64_t)a6
{
  if (!a3) {
    return 1;
  }
  if ((unint64_t)(a5 - 1) > 0xA) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = qword_209C7B450[a5 - 1];
  }
  double v9 = [(CAMCaptureCapabilities *)self supportedPhotoResolutionsForMode:a4 devicePosition:v7 photoEncoding:a6];
  id v10 = [NSNumber numberWithInteger:a3];
  char v11 = [v9 containsObject:v10];

  return v11;
}

- (BOOL)isPhotoResolutionSupported:(int64_t)a3 forLightingType:(int64_t)a4
{
  if ((unint64_t)(a3 - 1) > 2) {
    unint64_t v4 = 0;
  }
  else {
    unint64_t v4 = qword_209C7B438[a3 - 1];
  }
  unint64_t v5 = 12;
  if (a4 == 1) {
    unint64_t v5 = 24;
  }
  return !a4 || v5 >= v4;
}

- (int64_t)maximumPhotoResolutionForMode:(int64_t)a3 device:(int64_t)a4 encoding:(int64_t)a5
{
  if ((unint64_t)(a4 - 1) > 0xA) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = qword_209C7B450[a4 - 1];
  }
  id v6 = [(CAMCaptureCapabilities *)self supportedPhotoResolutionsForMode:a3 devicePosition:v5 photoEncoding:a5];
  uint64_t v7 = v6;
  if (v6)
  {
    char v8 = [v6 lastObject];
    int64_t v9 = [v8 integerValue];
  }
  else
  {
    int64_t v9 = 0;
  }

  return v9;
}

- (id)supportedPhotoResolutionsForMode:(int64_t)a3 devicePosition:(int64_t)a4 photoEncoding:(int64_t)a5
{
  if ((unint64_t)a5 < 2)
  {
    if (a4) {
      [(CAMCaptureCapabilities *)self _frontCameraSupportedCompressedResolutionsByMode];
    }
    else {
      [(CAMCaptureCapabilities *)self _backCameraSupportedCompressedResolutionsByMode];
    }
    uint64_t v6 = LABEL_4:;
    uint64_t v7 = (void *)v6;
    goto LABEL_11;
  }
  if (a5 == 2)
  {
    if (a4) {
      [(CAMCaptureCapabilities *)self _frontCameraSupportedRAWResolutionsByMode];
    }
    else {
      [(CAMCaptureCapabilities *)self _backCameraSupportedRAWResolutionsByMode];
    }
    goto LABEL_4;
  }
  uint64_t v7 = 0;
LABEL_11:
  char v8 = objc_msgSend(NSNumber, "numberWithInteger:", a3, a4);
  int64_t v9 = [v7 objectForKeyedSubscript:v8];

  return v9;
}

- (BOOL)supportsOverlappingCapturesForResolution:(int64_t)a3
{
  if ((unint64_t)a3 < 3) {
    return 1;
  }
  if (a3 == 3) {
    return [(CAMCaptureCapabilities *)self _overlapping48MPCapturesSupported];
  }
  return 0;
}

- (BOOL)isPhotoFormatSupported:(id)a3 forMode:(int64_t)a4 device:(int64_t)a5
{
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  if (a3.var0)
  {
    if (a3.var0 == 1)
    {
      if ([(CAMCaptureCapabilities *)self isHEVCEncodingSupported]) {
        goto LABEL_5;
      }
    }
    else if (a3.var0 == 2 && [(CAMCaptureCapabilities *)self isLinearDNGSupported])
    {
      goto LABEL_5;
    }
    return 0;
  }
LABEL_5:
  return [(CAMCaptureCapabilities *)self isPhotoResolutionSupported:var1 forMode:a4 device:a5 photoEncoding:var0];
}

- (BOOL)isPreviewAspectRatioToggleSupportedForMode:(int64_t)a3
{
  BOOL v5 = [(CAMCaptureCapabilities *)self _isiPad];
  if (v5)
  {
    LOBYTE(v5) = 0;
    if ((unint64_t)a3 <= 7)
    {
      if (((1 << a3) & 0xA6) != 0)
      {
        LOBYTE(v5) = 1;
      }
      else if (((1 << a3) & 0x41) != 0)
      {
        LOBYTE(v5) = [(CAMCaptureCapabilities *)self _isPreviewAspectRatioToggleSupportedForPhotoModes];
      }
    }
  }
  return v5;
}

- (BOOL)isZoomPIPSupportedForMode:(int64_t)a3 devicePosition:(int64_t)a4
{
  BOOL v7 = [(CAMCaptureCapabilities *)self isZoomPIPSupported];
  if (v7)
  {
    if ((unint64_t)a3 >= 2) {
      LOBYTE(v7) = a3 == 2 && [(CAMCaptureCapabilities *)self _zoomPIPSupportedForSlomo];
    }
    else {
      LOBYTE(v7) = 1;
    }
    if (a4) {
      LOBYTE(v7) = 0;
    }
  }
  return v7;
}

- (BOOL)isDeferredProcessingSupportedForMode:(int64_t)a3 devicePosition:(int64_t)a4
{
  switch(a3)
  {
    case 9:
      return [(CAMCaptureCapabilities *)self isDeferredProcessingSupported];
    case 6:
      if (a4) {
        return [(CAMCaptureCapabilities *)self _frontPortraitDeferredProcessingSupported];
      }
      else {
        return [(CAMCaptureCapabilities *)self _rearPortraitDeferredProcessingSupported];
      }
    case 0:
      return [(CAMCaptureCapabilities *)self isDeferredProcessingSupported];
    default:
      return 0;
  }
}

- (int64_t)maxSupportedPhotoQualityPrioritizationForMode:(int64_t)a3 devicePosition:(int64_t)a4
{
  int64_t result = 1;
  switch(a3)
  {
    case 0:
    case 1:
    case 9:
      BOOL v6 = [(CAMCaptureCapabilities *)self isDeferredProcessingSupported];
      goto LABEL_5;
    case 5:
      int64_t result = 0;
      break;
    case 6:
      BOOL v6 = [(CAMCaptureCapabilities *)self isDeferredProcessingSupportedForMode:6 devicePosition:a4];
LABEL_5:
      if (v6) {
        int64_t result = 2;
      }
      else {
        int64_t result = 1;
      }
      break;
    default:
      return result;
  }
  return result;
}

- (BOOL)isExternalStorageOutputSupportedForMode:(int64_t)a3 videoEncodingBehavior:(int64_t)a4
{
  BOOL result = 0;
  switch(a3)
  {
    case 1:
      if ((unint64_t)a4 < 2) {
        goto LABEL_2;
      }
      return a4 == 2;
    case 2:
    case 5:
    case 8:
      goto LABEL_2;
    case 7:
      if ((unint64_t)a4 < 2) {
        goto LABEL_2;
      }
      if (a4 != 2) {
        return 0;
      }
      if ([(CAMCaptureCapabilities *)self _isProResCinematicVideoSupported]) {
        return 1;
      }
LABEL_2:
      return [(CAMCaptureCapabilities *)self _isExternalStoreSupportedForAllVideoFormats];
    default:
      return result;
  }
}

- (BOOL)isPauseVideoSupportedForMode:(int64_t)a3
{
  unint64_t v4 = [(CAMCaptureCapabilities *)self _supportedModesForPauseResumeVideo];
  BOOL v5 = [NSNumber numberWithInteger:a3];
  char v6 = [v4 containsObject:v5];

  return v6;
}

- (BOOL)isPreserveCreativeControlsSupported
{
  if ([(CAMCaptureCapabilities *)self _isiPad]) {
    return 0;
  }
  if ([(CAMCaptureCapabilities *)self isLiveFilteringSupported]) {
    return 1;
  }
  return [(CAMCaptureCapabilities *)self arePortraitEffectsSupported];
}

- (BOOL)fallbackCameraEnabled
{
  if (![(CAMCaptureCapabilities *)self fallbackCameraSupported]) {
    return 0;
  }
  BOOL v3 = [(CAMCaptureCapabilities *)self fallbackCameraModules];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)interactiveVideoFormatControlSupported
{
  return self->_interactiveVideoFormatControlSupported;
}

- (BOOL)interactiveVideoFormatControlAlwaysEnabled
{
  return self->_interactiveVideoFormatControlAlwaysEnabled;
}

- (NSArray)getSupportedCameraModules
{
  return self->_expectedSupportedCameraModules;
}

- (BOOL)captureOnTouchDown
{
  return self->_captureOnTouchDown;
}

- (int64_t)maximumNumberOfInflightRequests
{
  return self->_maximumNumberOfInflightRequests;
}

- (BOOL)responsiveShutterSupported
{
  return self->_responsiveShutterSupported;
}

- (BOOL)isMirroredFrontCapturesSupported
{
  return self->_mirroredFrontCapturesSupported;
}

- (BOOL)isMirroredFrontVideosSupported
{
  return self->_mirroredFrontVideosSupported;
}

- (BOOL)isFlashMitigationSupported
{
  return self->_flashMitigationSupported;
}

- (BOOL)isFrontHDROnSupported
{
  return self->_frontHDROnSupported;
}

- (BOOL)isPreviewDuringHDRSupported
{
  return self->_previewSupportedDuringHDR;
}

- (BOOL)isHDRSettingAllowed
{
  return self->_HDRSettingAllowed;
}

- (BOOL)isBackSmartHDRSupported
{
  return self->_backSmartHDRSupported;
}

- (BOOL)isFrontSmartHDRSupported
{
  return self->_frontSmartHDRSupported;
}

- (BOOL)isHDREV0CaptureSupported
{
  return self->_HDREV0CaptureSupported;
}

- (BOOL)isHDR10BitVideoSupported
{
  return self->_HDR10BitVideoSupported;
}

- (BOOL)isHDR10BitVideoSupports60FPS
{
  return self->_HDR10BitVideoSupports60FPS;
}

- (BOOL)isProResVideoSupported
{
  return self->_proResVideoSupported;
}

- (double)proResMinimumDiskSpaceOverrideAsFractionOfSystemTotal
{
  return self->_proResMinimumDiskSpaceOverrideAsFractionOfSystemTotal;
}

- (int64_t)proResMinimumDiskSpaceOverrideMegabytesRelativeToFreeSpace
{
  return self->_proResMinimumDiskSpaceOverrideMegabytesRelativeToFreeSpace;
}

- (BOOL)isBackLivePhotoSupported
{
  return self->_backLivePhotoSupported;
}

- (BOOL)isFrontLivePhotoSupported
{
  return self->_frontLivePhotoSupported;
}

- (BOOL)isLivePhotoAutoModeSupported
{
  return self->_livePhotoAutoModeSupported;
}

- (int64_t)supportedPortraitLightingVersion
{
  return self->_supportedPortraitLightingVersion;
}

- (BOOL)isNaturalLightingAppliedToOriginal
{
  return self->_naturalLightingAppliedToOriginal;
}

- (BOOL)isBackLiveStageLightSupported
{
  return self->_backLiveStageLightSupported;
}

- (BOOL)isFrontLiveStageLightSupported
{
  return self->_frontLiveStageLightSupported;
}

- (BOOL)isFrontBurstSupported
{
  return self->_frontBurstSupported;
}

- (int64_t)maximumBurstLength
{
  return self->_maximumBurstLength;
}

- (BOOL)multipleCaptureFeaturesSupported
{
  return self->_multipleCaptureFeaturesSupported;
}

- (BOOL)isStillDuringVideoSupported
{
  return self->_stillDuringVideoSupported;
}

- (BOOL)isPALVideoSupported
{
  return self->_PALVideoSupported;
}

- (int64_t)maximumRecordedFileSize
{
  return self->_maximumRecordedFileSize;
}

- (int64_t)back720pMaxFPS
{
  return self->_back720pMaxFPS;
}

- (int64_t)front720pMaxFPS
{
  return self->_front720pMaxFPS;
}

- (int64_t)back1080pMaxFPS
{
  return self->_back1080pMaxFPS;
}

- (int64_t)front1080pMaxFPS
{
  return self->_front1080pMaxFPS;
}

- (int64_t)back4kMaxFPS
{
  return self->_back4kMaxFPS;
}

- (int64_t)front4kMaxFPS
{
  return self->_front4kMaxFPS;
}

- (BOOL)isBack4k24VideoSupported
{
  return self->_back4k24VideoSupported;
}

- (BOOL)isFront4k24VideoSupported
{
  return self->_front4k24VideoSupported;
}

- (BOOL)isBack4k30VideoSupported
{
  return self->_back4k30VideoSupported;
}

- (BOOL)isFront4k30VideoSupported
{
  return self->_front4k30VideoSupported;
}

- (BOOL)isBack4k60VideoSupported
{
  return self->_back4k60VideoSupported;
}

- (BOOL)isBack4k120VideoSupported
{
  return self->_back4k120VideoSupported;
}

- (BOOL)isFront4k60VideoSupported
{
  return self->_front4k60VideoSupported;
}

- (BOOL)isAutoLowLightVideoSupported
{
  return self->_autoLowLightVideoSupported;
}

- (BOOL)isVariableFramerateVideoSupported
{
  return self->_variableFramerateVideoSupported;
}

- (int64_t)defaultVFRMode
{
  return self->_defaultVFRMode;
}

- (BOOL)isStereoAudioRecordingSupported
{
  return self->_stereoAudioRecordingSupported;
}

- (BOOL)isVideoStabilizationControlSupported
{
  return self->_videoStabilizationControlSupported;
}

- (BOOL)isProResLogColorSpaceSupported
{
  return self->_proResLogColorSpaceSupported;
}

- (NSArray)supportedProResColorSpaces
{
  return self->_supportedProResColorSpaces;
}

- (BOOL)isWhiteBalanceLockingForVideoRecordingSupported
{
  return self->_whiteBalanceLockingForVideoRecordingSupported;
}

- (BOOL)isSpatialVideoCaptureSupported
{
  return self->_spatialVideoInVideoModeSupported;
}

- (BOOL)isSpatialModeSupported
{
  return self->_spatialModeSupported;
}

- (BOOL)isSpatialModeTrueVideoSupported
{
  return self->_spatialModeTrueVideoSupported;
}

- (BOOL)isTrueVideoSupported
{
  return self->_trueVideoSupported;
}

- (int64_t)backHighFrameRate720pMaxFPS
{
  return self->_backHighFrameRate720pMaxFPS;
}

- (int64_t)frontHighFrameRate720pMaxFPS
{
  return self->_frontHighFrameRate720pMaxFPS;
}

- (int64_t)backHighFrameRate1080pMaxFPS
{
  return self->_backHighFrameRate1080pMaxFPS;
}

- (int64_t)frontHighFrameRate1080pMaxFPS
{
  return self->_frontHighFrameRate1080pMaxFPS;
}

- (int64_t)backHighFrameRate4kMaxFPS
{
  return self->_backHighFrameRate4kMaxFPS;
}

- (BOOL)isBack720p240Supported
{
  return self->_back720p240Supported;
}

- (BOOL)isFront720p240Supported
{
  return self->_front720p240Supported;
}

- (BOOL)isBack1080p120Supported
{
  return self->_back1080p120Supported;
}

- (BOOL)isFront1080p120Supported
{
  return self->_front1080p120Supported;
}

- (BOOL)isBack1080p240Supported
{
  return self->_back1080p240Supported;
}

- (BOOL)isFront1080p240Supported
{
  return self->_front1080p240Supported;
}

- (BOOL)isFrontPanoramaSupported
{
  return self->_frontPanoramaSupported;
}

- (BOOL)isFrontTimelapseSupported
{
  return self->_frontTimelapseSupported;
}

- (double)timelapseFirstShotDelay
{
  return self->_timelapseFirstShotDelay;
}

- (BOOL)portraitModeOverlappingCapturesSupported
{
  return self->_portraitModeOverlappingCapturesSupported;
}

- (BOOL)continuousZoomSupportedForPortraitMode
{
  return self->_continuousZoomSupportedForPortraitMode;
}

- (unint64_t)portraitInPhotoModeBehavior
{
  return self->_portraitInPhotoModeBehavior;
}

- (BOOL)continuousZoomSupportedForCinematicMode
{
  return self->_continuousZoomSupportedForCinematicMode;
}

- (BOOL)isDeferredPortraitRenderingSupported
{
  return self->_deferredPortraitRenderingSupported;
}

- (BOOL)allowPortraitDescriptionOverlay
{
  return self->_allowPortraitDescriptionOverlay;
}

- (BOOL)isCTMSupported
{
  return self->_ctmSupported;
}

- (BOOL)useReticleStroke
{
  return self->_useReticleStroke;
}

- (BOOL)useCTMTransientImageWell
{
  return self->_useCTMTransientImageWell;
}

- (BOOL)useCTMModeSelector
{
  return self->_useCTMModeSelector;
}

- (BOOL)allowControlDrawer
{
  return self->_allowControlDrawer;
}

- (BOOL)isCinematicModeSupported
{
  return self->_cinematicModeSupported;
}

- (BOOL)isBackCinematicModeSupported
{
  return self->_backCinematicModeSupported;
}

- (BOOL)isFrontCinematicModeSupported
{
  return self->_frontCinematicModeSupported;
}

- (BOOL)cinematic4KSupported
{
  return self->_cinematic4KSupported;
}

- (BOOL)sfCameraFontSupported
{
  return self->_sfCameraFontSupported;
}

- (BOOL)overContentFlipButtonSupported
{
  return self->_overContentFlipButtonSupported;
}

- (BOOL)imagePickerUsesModernLayout
{
  return self->_imagePickerUsesModernLayout;
}

- (double)frontCameraInset
{
  return self->_frontCameraInset;
}

- (BOOL)isFrontCameraOnRightEdge
{
  return self->_frontCameraOnRightEdge;
}

- (BOOL)isBackSpatialOverCaptureSupported
{
  return self->_backSpatialOverCaptureSupported;
}

- (BOOL)isFrontSpatialOverCaptureSupported
{
  return self->_frontSpatialOverCaptureSupported;
}

- (BOOL)isBackLowLightSupported
{
  return self->_backLowLightSupported;
}

- (BOOL)isFrontLowLightSupported
{
  return self->_frontLowLightSupported;
}

- (unint64_t)backLowLightPreviewOverlayStyle
{
  return self->_backLowLightPreviewOverlayStyle;
}

- (unint64_t)frontLowLightPreviewOverlayStyle
{
  return self->_frontLowLightPreviewOverlayStyle;
}

- (BOOL)isBackSingleCameraPortraitModeSupported
{
  return self->_backSingleCameraPortraitModeSupported;
}

- (BOOL)isFrontSingleCameraPortraitModeSupported
{
  return self->_frontSingleCameraPortraitModeSupported;
}

- (BOOL)isBackTorchPatternSupported
{
  return self->_backTorchPatternSupported;
}

- (BOOL)isFrontTorchPatternSupported
{
  return self->_frontTorchPatternSupported;
}

- (unint64_t)zoomPinchScalingMethod
{
  return self->_zoomPinchScalingMethod;
}

- (double)zoomPinchExponentialFactorDistance
{
  return self->_zoomPinchExponentialFactorDistance;
}

- (double)zoomPinchExponentialFactor
{
  return self->_zoomPinchExponentialFactor;
}

- (double)zoomPinchHybridLerpDistance
{
  return self->_zoomPinchHybridLerpDistance;
}

- (int64_t)zoomDialStyle
{
  return self->_zoomDialStyle;
}

- (BOOL)isZoomPlatterSupported
{
  return self->_zoomPlatterSupported;
}

- (BOOL)isZoomPIPSupported
{
  return self->_zoomPIPSupported;
}

- (int64_t)backSuperWideFocalLengthDisplayValue
{
  return self->_backSuperWideFocalLengthDisplayValue;
}

- (int64_t)backWideFocalLengthDisplayValue
{
  return self->_backWideFocalLengthDisplayValue;
}

- (int64_t)backQuadraWideFocalLengthDisplayValue
{
  return self->_backQuadraWideFocalLengthDisplayValue;
}

- (int64_t)backTelephotoFocalLengthDisplayValue
{
  return self->_backTelephotoFocalLengthDisplayValue;
}

- (BOOL)isPipelinedStillImageProcessingSupported
{
  return self->_pipelinedStillImageProcessingSupported;
}

- (BOOL)isDeferredProcessingSupported
{
  return self->_deferredProcessingSupported;
}

- (BOOL)contentAwareDistortionCorrectionSupported
{
  return self->_contentAwareDistortionCorrectionSupported;
}

- (BOOL)isLinearDNGSupported
{
  return self->_linearDNGSupported;
}

- (BOOL)isProRawJpegXLSupported
{
  return self->_proRawJpegXLSupported;
}

- (BOOL)semanticDevelopmentSupported
{
  return self->_semanticDevelopmentSupported;
}

- (BOOL)enableSemanticDevelopmentFilterDebugging
{
  return self->_enableSemanticDevelopmentFilterDebugging;
}

- (int64_t)semanticStylesVersion
{
  return self->_semanticStylesVersion;
}

- (BOOL)smartStylesSupported
{
  return self->_smartStylesSupported;
}

- (BOOL)allowSystemSmartStylesInPicker
{
  return self->_allowSystemSmartStylesInPicker;
}

- (BOOL)smartStylesShowExtraControls
{
  return self->_smartStylesShowExtraControls;
}

- (unint64_t)semanticStylesSupport
{
  return self->_semanticStylesSupport;
}

- (double)wideDisplayZoomFactor
{
  return self->_wideDisplayZoomFactor;
}

- (BOOL)isFrontTelephotoSupported
{
  return self->_frontTelephotoSupported;
}

- (double)telephotoDisplayZoomFactor
{
  return self->_telephotoDisplayZoomFactor;
}

- (BOOL)isBackSuperWideSupported
{
  return self->_backSuperWideSupported;
}

- (BOOL)isFrontSuperWideSupported
{
  return self->_frontSuperWideSupported;
}

- (double)superWideDisplayZoomFactor
{
  return self->_superWideDisplayZoomFactor;
}

- (BOOL)isSuperWideAutoMacroSupported
{
  return self->_superWideAutoMacroSupported;
}

- (BOOL)macroControlEnabledByDefault
{
  return self->_macroControlEnabledByDefault;
}

- (BOOL)isBackWideDualSupported
{
  return self->_backWideDualSupported;
}

- (BOOL)isFrontWideDualSupported
{
  return self->_frontWideDualSupported;
}

- (BOOL)isBackTripleCameraSupported
{
  return self->_backTripleCameraSupported;
}

- (BOOL)isFrontTripleCameraSupported
{
  return self->_frontTripleCameraSupported;
}

- (BOOL)isFrontQuadraWideSupported
{
  return self->_frontQuadraWideSupported;
}

- (BOOL)isBackQuadraWideSupported
{
  return self->_backQuadraWideSupported;
}

- (BOOL)isBackQuadraSuperWideSupported
{
  return self->_backQuadraSuperWideSupported;
}

- (double)quadraWideRelativeZoomFactor
{
  return self->_quadraWideRelativeZoomFactor;
}

- (double)quadraWideDisplayZoomFactor
{
  return self->_quadraWideDisplayZoomFactor;
}

- (BOOL)isBackTimeOfFlightSupported
{
  return self->_backTimeOfFlightSupported;
}

- (BOOL)isFrontTimeOfFlightSupported
{
  return self->_frontTimeOfFlightSupported;
}

- (BOOL)isDepthEffectApertureSupported
{
  return self->_depthEffectApertureSupported;
}

- (BOOL)previewQualityStillImageFilteringForPhotoModeSupported
{
  return self->_previewQualityStillImageFilteringForPhotoModeSupported;
}

- (BOOL)isPortraitEffectIntensitySupported
{
  return self->_portraitEffectIntensitySupported;
}

- (BOOL)isExposureSliderSupported
{
  return self->_exposureSliderSupported;
}

- (BOOL)isNeuralEngineSupported
{
  return self->_neuralEngineSupported;
}

- (BOOL)isImageAnalysisSupported
{
  return self->_imageAnalysisSupported;
}

- (BOOL)isImageAnalysisButtonAlwaysVisible
{
  return self->_imageAnalysisButtonAlwaysVisible;
}

- (BOOL)imageAnalysisShowsInactiveTextRegions
{
  return self->_imageAnalysisShowsInactiveTextRegions;
}

- (BOOL)isDocumentScanningSupported
{
  return self->_documentScanningSupported;
}

- (float)documentScanningMinimumConfidenceLevel
{
  return self->_documentScanningMinimumConfidenceLevel;
}

- (BOOL)focalLengthPickerSupported
{
  return self->_focalLengthPickerSupported;
}

- (NSArray)availableCustomLenses
{
  return self->_availableCustomLenses;
}

- (NSArray)supportedCustomLensGroups
{
  return self->_supportedCustomLensGroups;
}

- (int64_t)baseFocalLengthForWideCamera
{
  return self->_baseFocalLengthForWideCamera;
}

- (BOOL)externalStorageSupported
{
  return self->_externalStorageSupported;
}

- (BOOL)shouldPersistPreferences
{
  return self->_shouldPersistPreferences;
}

- (BOOL)shouldEnableUserNotifications
{
  return self->_shouldEnableUserNotifications;
}

- (BOOL)bypassWelcomeScreens
{
  return self->_bypassWelcomeScreens;
}

- (CGSize)mainScreenSizePixels
{
  double width = self->_mainScreenSizePixels.width;
  double height = self->_mainScreenSizePixels.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)shouldPreventConnectionHandover
{
  return self->_shouldPreventConnectionHandover;
}

- (NSArray)fallbackCameraModules
{
  return self->_fallbackCameraModules;
}

- (BOOL)fallbackCameraSupported
{
  return self->_fallbackCameraSupported;
}

- (BOOL)isLowEndHardware
{
  return self->_lowEndHardware;
}

- (BOOL)allowHapticsOnConfigurationTaps
{
  return self->_allowHapticsOnConfigurationTaps;
}

- (double)minimumMachineReadableCodeNormalizedHeight
{
  return self->_minimumMachineReadableCodeNormalizedHeight;
}

- (BOOL)librarySelectionSupported
{
  return self->_librarySelectionSupported;
}

- (double)librarySelectionAutoOnResetTimeout
{
  return self->_librarySelectionAutoOnResetTimeout;
}

- (double)librarySelectionUserChoiceResetTimeout
{
  return self->_librarySelectionUserChoiceResetTimeout;
}

- (double)librarySelectionTripResetTimeout
{
  return self->_librarySelectionTripResetTimeout;
}

- (double)librarySelectionSameLocationResetTimeout
{
  return self->_librarySelectionSameLocationResetTimeout;
}

- (BOOL)peopleProximityDetectionSupported
{
  return self->_peopleProximityDetectionSupported;
}

- (BOOL)peopleProximityPersistenceSupported
{
  return self->_peopleProximityPersistenceSupported;
}

- (NSString)peopleProximityDetectAdditionalEmail
{
  return self->_peopleProximityDetectAdditionalEmail;
}

- (BOOL)peopleProximityUsesDeviceDiscovery
{
  return self->_peopleProximityUsesDeviceDiscovery;
}

- (BOOL)peopleProximityIgnoreNearbyRequirements
{
  return self->_peopleProximityIgnoreNearbyRequirements;
}

- (double)peopleProximityInitialScanDuration
{
  return self->_peopleProximityInitialScanDuration;
}

- (double)peopleProximitySubsequentScanDuration
{
  return self->_peopleProximitySubsequentScanDuration;
}

- (unint64_t)peopleProximityInitialScanRate
{
  return self->_peopleProximityInitialScanRate;
}

- (unint64_t)peopleProximitySubsequentScanRate
{
  return self->_peopleProximitySubsequentScanRate;
}

- (double)peopleProximityScanWaitInterval
{
  return self->_peopleProximityScanWaitInterval;
}

- (BOOL)peopleProximityScanIndefinitely
{
  return self->_peopleProximityScanIndefinitely;
}

- (BOOL)librarySelectionMockAutomationModeEnabled
{
  return self->_librarySelectionMockAutomationModeEnabled;
}

- (BOOL)librarySelectionMockLocationShiftingEnabled
{
  return self->_librarySelectionMockLocationShiftingEnabled;
}

- (BOOL)frontEnhancedHEICResolutionSupported
{
  return self->_frontEnhancedHEICResolutionSupported;
}

- (int64_t)frontCameraMaximumEnhancedResolution
{
  return self->_frontCameraMaximumEnhancedResolution;
}

- (BOOL)useFullResolutionThumbnailForRAWCaptures
{
  return self->_useFullResolutionThumbnailForRAWCaptures;
}

- (int64_t)minimumDiskSpaceReserved
{
  return self->_minimumDiskSpaceReserved;
}

- (BOOL)isMixAudioWithOthersSupported
{
  return self->_mixAudioWithOthersSupported;
}

- (BOOL)isCinematicAudioSupported
{
  return self->_cinematicAudioSupported;
}

- (BOOL)isWindRemovalSupported
{
  return self->_windRemovalSupported;
}

- (BOOL)isRegionalShutterSoundEnabled
{
  return self->_regionalShutterSoundEnabled;
}

- (BOOL)_isiPad
{
  return self->__iPad;
}

- (double)_frontPhotoModeMaximumZoomFactor
{
  return self->__frontPhotoModeMaximumZoomFactor;
}

- (double)_backVideoModeMaximumZoomFactor
{
  return self->__backVideoModeMaximumZoomFactor;
}

- (double)_frontVideoModeMaximumZoomFactor
{
  return self->__frontVideoModeMaximumZoomFactor;
}

- (double)_backDualPhotoModeMaximumZoomFactor
{
  return self->__backDualPhotoModeMaximumZoomFactor;
}

- (double)_backDualVideoModeMaximumZoomFactor
{
  return self->__backDualVideoModeMaximumZoomFactor;
}

- (double)_backDualSlomoModeMaximumZoomFactor
{
  return self->__backDualSlomoModeMaximumZoomFactor;
}

- (double)_frontDualPhotoModeMaximumZoomFactor
{
  return self->__frontDualPhotoModeMaximumZoomFactor;
}

- (double)_frontDualVideoModeMaximumZoomFactor
{
  return self->__frontDualVideoModeMaximumZoomFactor;
}

- (double)_backPortraitModeMaximumZoomFactor
{
  return self->__backPortraitModeMaximumZoomFactor;
}

- (double)_backTripleCameraPhotoModeMaximumZoomFactor
{
  return self->__backTripleCameraPhotoModeMaximumZoomFactor;
}

- (double)_backTripleCameraVideoModeMaximumZoomFactor
{
  return self->__backTripleCameraVideoModeMaximumZoomFactor;
}

- (double)_frontTripleCameraPhotoModeMaximumZoomFactor
{
  return self->__frontTripleCameraPhotoModeMaximumZoomFactor;
}

- (double)_frontTripleCameraVideoModeMaximumZoomFactor
{
  return self->__frontTripleCameraVideoModeMaximumZoomFactor;
}

- (double)_backWideDualCinematicModeMaximumZoomFactor
{
  return self->__backWideDualCinematicModeMaximumZoomFactor;
}

- (double)_frontDualCameraSwitchOverZoomFactor
{
  return self->__frontDualCameraSwitchOverZoomFactor;
}

- (double)_backWideDualCameraSwitchOverZoomFactor
{
  return self->__backWideDualCameraSwitchOverZoomFactor;
}

- (double)_frontWideDualCameraSwitchOverZoomFactor
{
  return self->__frontWideDualCameraSwitchOverZoomFactor;
}

- (double)_backCaptureInterval
{
  return self->__backCaptureInterval;
}

- (double)_frontCaptureInterval
{
  return self->__frontCaptureInterval;
}

- (BOOL)_backStageLightPortaitEffectsSupported
{
  return self->__backStageLightPortaitEffectsSupported;
}

- (BOOL)_frontStageLightPortaitEffectsSupported
{
  return self->__frontStageLightPortaitEffectsSupported;
}

- (BOOL)_wideDualPortraitLowLightSupported
{
  return self->__wideDualPortraitLowLightSupported;
}

- (BOOL)_preferWideDualPortrait
{
  return self->__preferWideDualPortrait;
}

- (BOOL)_disablePortraitBravoDevices
{
  return self->__disablePortraitBravoDevices;
}

- (BOOL)_disableSuperBravoDevice
{
  return self->__disableSuperBravoDevice;
}

- (BOOL)_disablePortraitFrontFacingZoomedCaptureDeviceFormat
{
  return self->__disablePortraitFrontFacingZoomedCaptureDeviceFormat;
}

- (BOOL)_backDualCameraSupportedForCinematic
{
  return self->__backDualCameraSupportedForCinematic;
}

- (int64_t)_forcedBackCamera
{
  return self->__forcedBackCamera;
}

- (BOOL)_allowZoomWithForcedBackCamera
{
  return self->__allowZoomWithForcedBackCamera;
}

- (BOOL)_processZoomWithoutUpscaleBack
{
  return self->__processZoomWithoutUpscaleBack;
}

- (BOOL)_processZoomWithoutUpscaleFront
{
  return self->__processZoomWithoutUpscaleFront;
}

- (NSDictionary)_FFCZoomBehaviorForCaptureMode
{
  return self->__FFCZoomBehaviorForCaptureMode;
}

- (BOOL)_isTripleCamera1080p60Supported
{
  return self->__tripleCamera1080p60Supported;
}

- (BOOL)_forceEnableExposureClippingIndicator
{
  return self->__forceEnableExposureClippingIndicator;
}

- (BOOL)_forceDisableExposureClippingIndicator
{
  return self->__forceDisableExposureClippingIndicator;
}

- (int64_t)_proResVideoMaxFPS1080p
{
  return self->__proResVideoMaxFPS1080p;
}

- (int64_t)_proResVideoMaxFPS4k
{
  return self->__proResVideoMaxFPS4k;
}

- (int64_t)_proResVideoExternalMaxFPS1080p
{
  return self->__proResVideoExternalMaxFPS1080p;
}

- (int64_t)_proResVideoExternalMaxFPS4k
{
  return self->__proResVideoExternalMaxFPS4k;
}

- (int64_t)_backDualCameraVideoCapture4kMaxFPS
{
  return self->__backDualCameraVideoCapture4kMaxFPS;
}

- (int64_t)_backWideDualCameraVideoCapture4kMaxFPS
{
  return self->__backWideDualCameraVideoCapture4kMaxFPS;
}

- (int64_t)_backTripleCameraVideoCapture4kMaxFPS
{
  return self->__backTripleCameraVideoCapture4kMaxFPS;
}

- (BOOL)_isActionModeAggregateDevice4k60Supported
{
  return self->__actionModeAggregateDevice4k60Supported;
}

- (BOOL)_isPreviewAspectRatioToggleSupportedForPhotoModes
{
  return self->__previewAspectRatioToggleSupportedForPhotoModes;
}

- (BOOL)_is1080pHFRVideoStabilizationSupported
{
  return self->__1080pHFRVideoStabilizationSupported;
}

- (BOOL)featureDevelopmentDefaultWideHighStabilization
{
  return self->_featureDevelopmentDefaultWideHighStabilization;
}

- (BOOL)_isQuadraPortraitSupported
{
  return self->__quadraPortraitSupported;
}

- (NSDictionary)_backCameraSupportedCompressedResolutionsByMode
{
  return self->__backCameraSupportedCompressedResolutionsByMode;
}

- (NSDictionary)_backCameraSupportedRAWResolutionsByMode
{
  return self->__backCameraSupportedRAWResolutionsByMode;
}

- (NSDictionary)_frontCameraSupportedCompressedResolutionsByMode
{
  return self->__frontCameraSupportedCompressedResolutionsByMode;
}

- (NSDictionary)_frontCameraSupportedRAWResolutionsByMode
{
  return self->__frontCameraSupportedRAWResolutionsByMode;
}

- (NSDictionary)_backCameraDefaultCompressedResolutionByMode
{
  return self->__backCameraDefaultCompressedResolutionByMode;
}

- (NSDictionary)_backCameraDefaultRAWResolutionByMode
{
  return self->__backCameraDefaultRAWResolutionByMode;
}

- (NSDictionary)_frontCameraDefaultCompressedResolutionByMode
{
  return self->__frontCameraDefaultCompressedResolutionByMode;
}

- (NSDictionary)_frontCameraDefaultRAWResolutionByMode
{
  return self->__frontCameraDefaultRAWResolutionByMode;
}

- (BOOL)_overlapping48MPCapturesSupported
{
  return self->__overlapping48MPCapturesSupported;
}

- (BOOL)_isAspectRatioCropThreeTwoSupported
{
  return self->__aspectRatioCropThreeTwoSupported;
}

- (CGRect)_lockButtonFrame
{
  double x = self->__lockButtonFrame.origin.x;
  double y = self->__lockButtonFrame.origin.y;
  double width = self->__lockButtonFrame.size.width;
  double height = self->__lockButtonFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)_volumeUpButtonFrame
{
  double x = self->__volumeUpButtonFrame.origin.x;
  double y = self->__volumeUpButtonFrame.origin.y;
  double width = self->__volumeUpButtonFrame.size.width;
  double height = self->__volumeUpButtonFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)_volumeDownButtonFrame
{
  double x = self->__volumeDownButtonFrame.origin.x;
  double y = self->__volumeDownButtonFrame.origin.y;
  double width = self->__volumeDownButtonFrame.size.width;
  double height = self->__volumeDownButtonFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)_cameraButtonFrame
{
  double x = self->__cameraButtonFrame.origin.x;
  double y = self->__cameraButtonFrame.origin.y;
  double width = self->__cameraButtonFrame.size.width;
  double height = self->__cameraButtonFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)_allowSpatialOverCaptureInPortraitMode
{
  return self->__allowSpatialOverCaptureInPortraitMode;
}

- (BOOL)_rearPortraitSemanticStylesSupported
{
  return self->__rearPortraitSemanticStylesSupported;
}

- (BOOL)_frontPortraitSemanticStylesSupported
{
  return self->__frontPortraitSemanticStylesSupported;
}

- (BOOL)_rearPortraitAspectRatioSupported
{
  return self->__rearPortraitAspectRatioSupported;
}

- (BOOL)_frontPortraitAspectRatioSupported
{
  return self->__frontPortraitAspectRatioSupported;
}

- (BOOL)_rearPortraitDeferredProcessingSupported
{
  return self->__rearPortraitDeferredProcessingSupported;
}

- (BOOL)_frontPortraitDeferredProcessingSupported
{
  return self->__frontPortraitDeferredProcessingSupported;
}

- (BOOL)_rearPhotoModeDepthSuggestionSupported
{
  return self->__rearPhotoModeDepthSuggestionSupported;
}

- (BOOL)_frontPhotoModeDepthSuggestionSupported
{
  return self->__frontPhotoModeDepthSuggestionSupported;
}

- (double)_maximumZoomFactorWithout24MPUpscale
{
  return self->__maximumZoomFactorWithout24MPUpscale;
}

- (BOOL)_zoomPIPSupportedForSlomo
{
  return self->__zoomPIPSupportedForSlomo;
}

- (BOOL)_backPhotoModeNightModeDepthSupported
{
  return self->__backPhotoModeNightModeDepthSupported;
}

- (BOOL)_backSuperWideTeleNightModeSupported
{
  return self->__backSuperWideTeleNightModeSupported;
}

- (NSSet)_supportedModesForPauseResumeVideo
{
  return self->__supportedModesForPauseResumeVideo;
}

- (BOOL)_isProResCinematicVideoSupported
{
  return self->__proResCinematicVideoSupported;
}

- (BOOL)_isExternalStoreSupportedForAllVideoFormats
{
  return self->__externalStorageSupportedForAllVideoFormats;
}

- (BOOL)_HDR10BitVideoSupports120FPS
{
  return self->__HDR10BitVideoSupports120FPS;
}

- (BOOL)_photoModeLightingControlSupported
{
  return self->__photoModeLightingControlSupported;
}

- (BOOL)_smartStylesAdditionalSystemStyleSupport
{
  return self->__smartStylesAdditionalSystemStyleSupport;
}

- (int)cacheDeleteUrgency
{
  return self->_cacheDeleteUrgency;
}

- (BOOL)isHalfPressSupported
{
  return self->_halfPressSupported;
}

- (BOOL)allowHalfPressSimulation
{
  return self->_allowHalfPressSimulation;
}

- (BOOL)isHalfPressOverlayInProcess
{
  return self->_halfPressOverlayInProcess;
}

- (BOOL)isActionButtonSupported
{
  return self->_actionButtonSupported;
}

- (BOOL)shouldPerformSuperWideAutoMacroMigration
{
  return self->_shouldPerformSuperWideAutoMacroMigration;
}

- (BOOL)isCTMSupportSupressed
{
  return self->_ctmSupportSuppressed;
}

- (BOOL)deviceSupportsCTM
{
  return self->_deviceSupportsCTM;
}

- (double)_forcedInitialZoomDisplayFactor
{
  return self->__forcedInitialZoomDisplayFactor;
}

- (BOOL)isCacheDeleteSupported
{
  return self->_cacheDeleteSupported;
}

- (BOOL)isCameraButtonSupported
{
  return self->_cameraButtonSupported;
}

- (BOOL)featureDevelopmentEmulateSuperWide
{
  return self->_featureDevelopmentEmulateSuperWide;
}

- (BOOL)featureDevelopmentForceSingleCamera
{
  return self->_featureDevelopmentForceSingleCamera;
}

- (BOOL)featureDevelopmentForceDepthDataCaptureInPhotoMode
{
  return self->_featureDevelopmentForceDepthDataCaptureInPhotoMode;
}

- (BOOL)featureDevelopmentIgnoreDepthSuggestionInPhotoMode
{
  return self->_featureDevelopmentIgnoreDepthSuggestionInPhotoMode;
}

- (BOOL)featureDevelopmentForceDepthEffectInPhotoMode
{
  return self->_featureDevelopmentForceDepthEffectInPhotoMode;
}

- (BOOL)featureDevelopmentHidePreviewOverlayBars
{
  return self->_featureDevelopmentHidePreviewOverlayBars;
}

- (BOOL)featureDevelopmentAllowAllHEICOptionsInPhotoPicker
{
  return self->_featureDevelopmentAllowAllHEICOptionsInPhotoPicker;
}

- (BOOL)featureDevelopmentShowLockIndicator
{
  return self->_featureDevelopmentShowLockIndicator;
}

- (BOOL)forceAllowAllInterfaceOrientations
{
  return self->_forceAllowAllInterfaceOrientations;
}

- (BOOL)disableAudio
{
  return self->_disableAudio;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__supportedModesForPauseResumeVideo, 0);
  objc_storeStrong((id *)&self->__frontCameraDefaultRAWResolutionByMode, 0);
  objc_storeStrong((id *)&self->__frontCameraDefaultCompressedResolutionByMode, 0);
  objc_storeStrong((id *)&self->__backCameraDefaultRAWResolutionByMode, 0);
  objc_storeStrong((id *)&self->__backCameraDefaultCompressedResolutionByMode, 0);
  objc_storeStrong((id *)&self->__frontCameraSupportedRAWResolutionsByMode, 0);
  objc_storeStrong((id *)&self->__frontCameraSupportedCompressedResolutionsByMode, 0);
  objc_storeStrong((id *)&self->__backCameraSupportedRAWResolutionsByMode, 0);
  objc_storeStrong((id *)&self->__backCameraSupportedCompressedResolutionsByMode, 0);
  objc_storeStrong((id *)&self->__FFCZoomBehaviorForCaptureMode, 0);
  objc_storeStrong((id *)&self->_peopleProximityDetectAdditionalEmail, 0);
  objc_storeStrong((id *)&self->_fallbackCameraModules, 0);
  objc_storeStrong((id *)&self->_supportedCustomLensGroups, 0);
  objc_storeStrong((id *)&self->_availableCustomLenses, 0);
  objc_storeStrong((id *)&self->_expectedSupportedCameraModules, 0);
}

- (void)initWithHostProcess:(uint64_t *)a1 .cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_2099F8000, a2, OS_LOG_TYPE_ERROR, "Unsupported focal length for picker: %ld", (uint8_t *)&v3, 0xCu);
}

- (void)initWithHostProcess:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2099F8000, a2, OS_LOG_TYPE_ERROR, "Unhandled value for CAMFeatureDevelopmentLowLightPreviewStyle: %ld", (uint8_t *)&v2, 0xCu);
}

- (void)validatedVideoConfigurationForVideoConfiguration:(os_log_t)log withBlock:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_2099F8000, log, OS_LOG_TYPE_ERROR, "Failed to find a valid fallback video configuration.", v1, 2u);
}

- (void)captureStyleForCaptureWithSupport:(void *)a1 styles:selectedStyleIndex:smartStyleSystemStyleIndex:.cold.1(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_2099F8000, v1, v2, "System style index %ld is out of range 0-%ld", v3, v4, v5, v6, v7);
}

- (void)captureStyleForCaptureWithSupport:(void *)a1 styles:selectedStyleIndex:smartStyleSystemStyleIndex:.cold.2(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_2099F8000, v1, v2, "Selected semantic style index %ld is out of range 0-%ld", v3, v4, v5, v6, v7);
}

@end