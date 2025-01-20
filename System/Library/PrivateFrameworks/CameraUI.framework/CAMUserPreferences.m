@interface CAMUserPreferences
+ (BOOL)_fallBackToCameraDefaultsForBundleIdentifier:(id)a3;
+ (BOOL)hasSharedLibraryAlgorithmsPreferences;
+ (BOOL)isSharedLibrarySupportedAndEnabledForCapabilities:(id)a3;
+ (BOOL)shouldEnableHDR10BitVideoForHEVCEnabled:(BOOL)a3 capabilities:(id)a4;
+ (CAMUserPreferences)preferences;
+ (id)_captureModeNumberForPersistenceString:(id)a3;
+ (id)_convertDictionary:(id)a3 expectedKeyClass:(Class)a4 expectedValueClass:(Class)a5 keyConverter:(id)a6 valueConverter:(id)a7;
+ (id)_createMappingFromStringsToIntegers:(id)a3;
+ (id)_defaultCaptureConfiguration;
+ (id)_defaultExposureBiasesByMode;
+ (id)_drawerControlTypeNumberForPersistenceString:(id)a3;
+ (id)_persistenceDictionaryForPreferredDrawerControlByMode:(id)a3;
+ (id)_preferredDrawerControlByModeForPersistenceDictionary:(id)a3;
+ (id)defaultCaptureConfiguration;
+ (int64_t)defaultDevice;
+ (int64_t)defaultDevicePosition;
+ (int64_t)defaultFilterTypeForMode:(int64_t)a3;
+ (int64_t)defaultLightingTypeForMode:(int64_t)a3;
+ (int64_t)defaultMode;
+ (unint64_t)selectedAudioConfigurationForCapabilities:(id)a3;
+ (void)performApertureMigrationWithCapabilities:(id)a3;
+ (void)performAudioConfigurationMigrationWithCapabilities:(id)a3;
+ (void)performHorizonLevelUpgradeWithCapabilities:(id)a3;
+ (void)performLowLightVideoMigrationWithCapabilities:(id)a3;
+ (void)performMostCompatibleConfirmationMigrationWithCapabilities:(id)a3;
+ (void)performResponsiveShutterMigrationWithCapabilities:(id)a3;
+ (void)performSuperWideAutoMacroMigrationWithCapabilities:(id)a3;
+ (void)removeSharedLibraryAlgorithmsPreferences;
+ (void)updateLastViewedSettingsDate;
- ($0AC6E346AE4835514AAA8AC86D8F4844)fallbackPhotoFormatForDesiredFormat:(id)a3 mode:(int64_t)a4 device:(int64_t)a5;
- ($0AC6E346AE4835514AAA8AC86D8F4844)photoFormatControlSecondaryFormat;
- ($0AC6E346AE4835514AAA8AC86D8F4844)resolvedPhotoFormatForResolvedResolution:(int64_t)a3 rawMode:(int64_t)a4;
- (BOOL)HDR10BitVideoEnabled;
- (BOOL)QRBannersEnabledInSettings;
- (BOOL)_hasReadLastWrittenValues;
- (BOOL)_preferHEVCWhenAvailable;
- (BOOL)_shouldDisableCameraSwitchingDuringVideoRecording;
- (BOOL)_shouldReconfigureCurrentConfigurationForSettingsChange;
- (BOOL)_shouldResetPreferencesForTimeout;
- (BOOL)actionModeLowLightEnabled;
- (BOOL)allowExplicitProResColorSpace;
- (BOOL)burstFollowsEncoderSettings;
- (BOOL)defaultToSharedLibraryEnabled;
- (BOOL)didAcknowledgeCTMDescription;
- (BOOL)didAcknowledgeCinematicModeDescription;
- (BOOL)didAcknowledgeDepthInPhotoModeDescription;
- (BOOL)didAcknowledgePortraitModeDescription;
- (BOOL)didAcknowledgeSemanticStylesDescription;
- (BOOL)didAcknowledgeSmartStylesDescription;
- (BOOL)didAcknowledgeSpatialModeOverlayDescription;
- (BOOL)didAcknowledgeSpatialVideoOverlayDescription;
- (BOOL)didConfirmSlomo1080p240MostCompatible;
- (BOOL)didConfirmVideoMostCompatible;
- (BOOL)didResetTorchMode;
- (BOOL)enhancedVideoStabilization;
- (BOOL)forceEnableQRBanners;
- (BOOL)isAutoFPSVideoEnabledForMode:(int64_t)a3 device:(int64_t)a4 videoConfiguration:(int64_t)a5 encodingBehavior:(int64_t)a6 outputToExternalStorage:(BOOL)a7 spatialVideoEnabled:(BOOL)a8;
- (BOOL)isImageAnalysisEnabled;
- (BOOL)isLockAsShutterEnabled;
- (BOOL)isLowLightVideoEnabled;
- (BOOL)isOverCapturePreviewEnabled;
- (BOOL)isPALVideoEnabled;
- (BOOL)isPhotoFormat:(id)a3 enabledForMode:(int64_t)a4 device:(int64_t)a5;
- (BOOL)isProResControlEnabled;
- (BOOL)isSuperWideAutoMacroControlAllowed;
- (BOOL)isVideoConfigurationControlEnabled;
- (BOOL)isZoomPIPEnabled;
- (BOOL)mirrorCameraCapturesForDevicePosition:(int64_t)a3 mode:(int64_t)a4;
- (BOOL)photoFormatControlEnabled;
- (BOOL)prefersHDR10BitVideoForCapabilities:(id)a3;
- (BOOL)preserveAperture;
- (BOOL)preserveCaptureMode;
- (BOOL)preserveEffectFilter;
- (BOOL)preserveExposure;
- (BOOL)preserveLivePhoto;
- (BOOL)preserveNightMode;
- (BOOL)preservePhotoResolution;
- (BOOL)preservePortraitZoom;
- (BOOL)preservePreferredDrawerControl;
- (BOOL)preserveProRes;
- (BOOL)preserveRAW;
- (BOOL)preserveSmartStyle;
- (BOOL)preserveSpatialVideoEnabled;
- (BOOL)preserveSuperWideAutoMacro;
- (BOOL)preserveVideoStabilization;
- (BOOL)rawControlEnabled;
- (BOOL)readPreferencesWithOverrides:(id)a3 emulationMode:(int64_t)a4 callActive:(BOOL)a5 shouldResetCaptureConfiguration:(BOOL *)a6;
- (BOOL)responsiveShutterEnabled;
- (BOOL)semanticDevelopmentEnabled;
- (BOOL)shareWhenAtHomeEnabled;
- (BOOL)sharedLibraryAutoBehaviorEnabled;
- (BOOL)sharedLibraryEnabled;
- (BOOL)sharedLibraryLastLocationAcquiredDuringTrip;
- (BOOL)sharedLibrarySwitchEnabled;
- (BOOL)shouldCaptureHDREV0;
- (BOOL)shouldDelayRemotePersistence;
- (BOOL)shouldDisableCameraSwitchingDuringVideoRecordingForMode:(int64_t)a3;
- (BOOL)shouldEnableWindRemoval;
- (BOOL)shouldLockWhiteBalanceDuringVideoRecording;
- (BOOL)shouldMirrorFrontCameraCaptures;
- (BOOL)shouldMixAudioWithOthers;
- (BOOL)shouldShowGridView;
- (BOOL)shouldShowHorizonLevelView;
- (BOOL)shouldShowLevelView;
- (BOOL)shouldShowQRBanners;
- (BOOL)shouldUseContentAwareDistortionCorrection;
- (BOOL)shouldUseDepthSuggestionInPhotoMode;
- (BOOL)shouldUseModernHDRBehavior;
- (BOOL)shouldUsePhotoFormatControlForMode:(int64_t)a3;
- (BOOL)shouldUseVolumeUpBurst;
- (BOOL)spatialModeHasVideoSelected;
- (BOOL)spatialVideoControlEnabled;
- (BOOL)spatialVideoEnabled;
- (BOOL)usingMostCompatibleEncoding;
- (BOOL)windRemovalEnabledForAudioConfiguration:(unint64_t)a3;
- (BOOL)writingAvailableDevices;
- (CAMCaptureConfiguration)captureConfiguration;
- (CAMConflictingControlConfiguration)conflictingControlConfiguration;
- (CEKSmartStyle)lastReadSystemStyle;
- (CLLocation)sharedLibraryLastDiscoveryLocation;
- (CLLocation)sharedLibraryLastLocation;
- (CLLocation)sharedLibraryLastUserActionLocation;
- (NSArray)customLensGroup;
- (NSDate)_lastViewedSettingsInterfaceDate;
- (NSDate)_lastWrittenSettingsDate;
- (NSDate)resetTimeoutDate;
- (NSDate)sharedLibraryLastDiscoveryDate;
- (NSDate)sharedLibraryLastUserActionDate;
- (NSDictionary)preferredDrawerControlByMode;
- (NSSet)openHalfPressSpotlightControls;
- (NSUserDefaults)_underlyingUserDefaults;
- (double)_resetTimeoutOverride;
- (double)_resetTimeoutSeconds;
- (double)defaultZoomFactorForGraphConfiguration:(id)a3 captureOrientation:(int64_t)a4 outputToExternalStorage:(BOOL)a5;
- (double)portraitModeRearZoomValue;
- (id)_semanticStylesKey;
- (id)filterTypesForMode:(int64_t)a3;
- (id)videoThumbnailOutputConfigurationForMode:(int64_t)a3 devicePosition:(int64_t)a4;
- (int64_t)VFRMode;
- (int64_t)_backPreferredHEICPhotoResolution;
- (int64_t)_findIndexOfSmartStylePresetString:(id)a3 inStyles:(id)a4;
- (int64_t)_frontPreferredHEICPhotoResolution;
- (int64_t)_previewAspectModeForPhotoModes;
- (int64_t)_previewAspectModeForVideoModes;
- (int64_t)_sanitizeEffectFilterType:(int64_t)a3 forMode:(int64_t)a4;
- (int64_t)_sanitizeLightingType:(int64_t)a3 forMode:(int64_t)a4;
- (int64_t)cinematicConfiguration;
- (int64_t)colorSpaceForMode:(int64_t)a3 videoConfiguration:(int64_t)a4 videoEncodingBehavior:(int64_t)a5 spatialVideoEnabled:(BOOL)a6 device:(int64_t)a7;
- (int64_t)defaultCustomLens;
- (int64_t)defaultDeviceForModeChange:(int64_t)a3 devicePosition:(int64_t)a4 spatialVideoEnabled:(BOOL)a5;
- (int64_t)explicitProResColorSpace;
- (int64_t)maximumPhotoResolutionForMode:(int64_t)a3 device:(int64_t)a4;
- (int64_t)maximumRAWPhotoResolution;
- (int64_t)overriddenBackCaptureInterval;
- (int64_t)overriddenFrontCaptureInterval;
- (int64_t)photoEncodingBehavior;
- (int64_t)photoEncodingBehaviorForMode:(int64_t)a3 resolvedRAWMode:(int64_t)a4 isCapturingVideo:(BOOL)a5;
- (int64_t)photoModeLastCapturedEffectFilterType;
- (int64_t)portraitModeLastCapturedEffectFilterType;
- (int64_t)portraitModeRearDevice;
- (int64_t)ppt_readPortraitLightingType;
- (int64_t)preferredHEICPhotoResolutionForDevicePosition:(int64_t)a3;
- (int64_t)preferredMinimumFreeBytes;
- (int64_t)previewViewAspectModeForMode:(int64_t)a3;
- (int64_t)rawFileFormatBehavior;
- (int64_t)slomoConfiguration;
- (int64_t)squareModeLastCapturedEffectFilterType;
- (int64_t)videoConfiguration;
- (int64_t)videoEncodingBehaviorForConfiguration:(int64_t)a3 mode:(int64_t)a4 desiredProResVideoMode:(int64_t)a5 outputToExternalStorage:(BOOL)a6 spatialVideoEnabled:(BOOL)a7;
- (int64_t)videoStabilizationStrengthForVideoStabilizationMode:(int64_t)a3 captureMode:(int64_t)a4 spatialVideoEnabled:(BOOL)a5;
- (unint64_t)_updateEntryForPresetType:(int64_t)a3 inSmartStyles:(id)a4 withStyle:(id)a5;
- (unint64_t)audioConfigurationForMode:(int64_t)a3 device:(int64_t)a4 emulationMode:(int64_t)a5 duringCall:(BOOL)a6;
- (unint64_t)preferredAudioConfiguration;
- (void)_publishAnalyticsIfNeeded;
- (void)_resetSharedLibraryAlgorithmsPreferences;
- (void)_setDidResetTorchMode:(BOOL)a3;
- (void)_setHasReadLastWrittenValues:(BOOL)a3;
- (void)_setLastReadSystemStyle:(id)a3;
- (void)_setLastWrittenSettingsDate:(id)a3;
- (void)_setPreviewAspectModeForPhotoModes:(int64_t)a3;
- (void)_setPreviewAspectModeForVideoModes:(int64_t)a3;
- (void)_setResetTimeoutDate:(id)a3;
- (void)_setUnderlyingUserDefaults:(id)a3;
- (void)_updateLastWrittenSettingsDate;
- (void)_writeSmartStylePresetStringForIndex:(int64_t)a3 inStyles:(id)a4 key:(id)a5;
- (void)resolveDesiredPhotoResolution:(int64_t)a3 livePhotoMode:(int64_t)a4 rawMode:(int64_t)a5 conflicts:(unint64_t)a6 mode:(int64_t)a7 device:(int64_t)a8 resolvedPhotoResolution:(int64_t *)a9 resolvedLivePhotoMode:(int64_t *)a10;
- (void)setCaptureConfiguration:(id)a3;
- (void)setConflictingControlConfiguration:(id)a3;
- (void)setDefaultToSharedLibraryEnabled:(BOOL)a3;
- (void)setDidAcknowledgeCTMDescription:(BOOL)a3;
- (void)setDidAcknowledgeCinematicModeDescription:(BOOL)a3;
- (void)setDidAcknowledgeDepthInPhotoModeDescription:(BOOL)a3;
- (void)setDidAcknowledgePortraitModeDescription:(BOOL)a3;
- (void)setDidAcknowledgeSemanticStylesDescription:(BOOL)a3;
- (void)setDidAcknowledgeSmartStylesDescription:(BOOL)a3;
- (void)setDidAcknowledgeSpatialModeOverlayDescription:(BOOL)a3;
- (void)setDidAcknowledgeSpatialVideoOverlayDescription:(BOOL)a3;
- (void)setForceEnableQRBanners:(BOOL)a3;
- (void)setOpenHalfPressSpotlightControls:(id)a3;
- (void)setPhotoModeLastCapturedEffectFilterType:(int64_t)a3;
- (void)setPortraitModeLastCapturedEffectFilterType:(int64_t)a3;
- (void)setPortraitModeRearDevice:(int64_t)a3;
- (void)setPortraitModeRearZoomValue:(double)a3;
- (void)setPreferredDrawerControlByMode:(id)a3;
- (void)setPreviewViewAspectMode:(int64_t)a3 forMode:(int64_t)a4;
- (void)setShareWhenAtHomeEnabled:(BOOL)a3;
- (void)setSharedLibraryAutoBehaviorEnabled:(BOOL)a3;
- (void)setSharedLibraryEnabled:(BOOL)a3;
- (void)setSharedLibraryLastDiscoveryDate:(id)a3;
- (void)setSharedLibraryLastDiscoveryLocation:(id)a3;
- (void)setSharedLibraryLastLocation:(id)a3;
- (void)setSharedLibraryLastLocationAcquiredDuringTrip:(BOOL)a3;
- (void)setSharedLibraryLastUserActionDate:(id)a3;
- (void)setSharedLibraryLastUserActionLocation:(id)a3;
- (void)setSharedLibrarySwitchEnabled:(BOOL)a3;
- (void)setShouldMirrorFrontCameraCaptures:(BOOL)a3;
- (void)setShouldShowGridView:(BOOL)a3;
- (void)setShouldUseDepthSuggestionInPhotoMode:(BOOL)a3;
- (void)setSpatialVideoControlEnabled:(BOOL)a3;
- (void)setSquareModeLastCapturedEffectFilterType:(int64_t)a3;
- (void)setWritingAvailableDevices:(BOOL)a3;
- (void)writeAvailableDevicesWithCompletion:(id)a3;
- (void)writePreferences;
@end

@implementation CAMUserPreferences

+ (CAMUserPreferences)preferences
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__CAMUserPreferences_preferences__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (preferences_onceToken != -1) {
    dispatch_once(&preferences_onceToken, block);
  }
  v2 = (void *)preferences_sharedInstance;
  return (CAMUserPreferences *)v2;
}

void __33__CAMUserPreferences_preferences__block_invoke(uint64_t a1)
{
  v36 = objc_alloc_init(CAMUserPreferences);
  v54 = +[CAMCaptureCapabilities capabilities];
  v37 = [MEMORY[0x263F086E0] mainBundle];
  v2 = [v37 bundleIdentifier];
  if ([*(id *)(a1 + 32) _fallBackToCameraDefaultsForBundleIdentifier:v2])
  {
    v34 = [MEMORY[0x263EFFA40] standardUserDefaults];
    [v34 addSuiteNamed:@"com.apple.camera"];
  }
  else
  {
    if ([v2 isEqualToString:@"com.apple.camera.lockscreen"])
    {
      uint64_t v3 = [objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.camera"];
    }
    else
    {
      uint64_t v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
    }
    v34 = (void *)v3;
  }
  v4 = [*(id *)(a1 + 32) defaultCaptureConfiguration];
  uint64_t v5 = [v4 device];
  v35 = v2;
  if ((unint64_t)(v5 - 1) > 0xA) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = qword_209C79218[v5 - 1];
  }
  id v32 = objc_alloc(MEMORY[0x263EFF9A0]);
  uint64_t v31 = *MEMORY[0x263F5DED0];
  uint64_t v30 = *MEMORY[0x263F5DEC8];
  v53 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v54, "isImageAnalysisSupported"));
  v52 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "mode"));
  v51 = [NSNumber numberWithInteger:v6];
  v50 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "flashMode"));
  v49 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "torchMode"));
  v48 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "HDRMode"));
  v47 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "timerDuration"));
  v46 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "photoModeAspectRatioCrop"));
  v45 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "photoModeEffectFilterType"));
  v44 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "squareModeEffectFilterType"));
  v43 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "portraitModeEffectFilterType"));
  v42 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "photoModeEffectFilterType"));
  v38 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "squareModeEffectFilterType"));
  v41 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "portraitModeEffectFilterType"));
  v40 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "portraitModeLightingEffectType"));
  v7 = NSNumber;
  [v4 portraitModeApertureValue];
  v39 = objc_msgSend(v7, "numberWithDouble:");
  v8 = NSNumber;
  [v4 portraitModeIntensityValue];
  v9 = objc_msgSend(v8, "numberWithDouble:");
  v29 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "mirrorFrontCameraCaptures"));
  v28 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v54, "semanticDevelopmentSupported"));
  v27 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "rawMode"));
  v26 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v54, "macroControlEnabledByDefault") ^ 1);
  v10 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "macroMode"));
  v11 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "optionalDepthEffectEnabled"));
  v12 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v54, "resolvedDefaultCustomLens"));
  v13 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "videoStabilizationMode"));
  v14 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "zoomPIPEnabled"));
  v33 = objc_msgSend(v32, "initWithObjectsAndKeys:", @"CAMUserPreferenceHDREV0", MEMORY[0x263EFFA80], @"CAMUserPreferenceModernHDRKeepNormalPhoto", MEMORY[0x263EFFA88], @"CAMUserPreferenceModernHDRBehavior", &unk_26BDDDB78, v31, &unk_26BDDDB78, v30, &unk_26BDDDB78, @"CAMUserPreferenceCinematicConfiguration", MEMORY[0x263EFFA80], @"CAMUserPreferenceShowGridOverlay", MEMORY[0x263EFFA80], @"CAMUserPreferenceShowHorizonLevelPlumb", MEMORY[0x263EFFA88], @"CAMUserPreferenceShowQRCodeBanners",
                  v53,
                  @"CAMUserPreferenceShowImageAnalysis",
                  MEMORY[0x263EFFA80],
                  @"CAMUserPreferenceCTMDidAcknowledgeDescription",
                  &unk_26BDDDB78,
                  @"CAMUserPreferencePreviewAspectModeForPhotoModes",
                  &unk_26BDDDB78,
                  @"CAMUserPreferencePreviewViewAspectMode",
                  MEMORY[0x263EFFA80],
                  @"CAMUserPreferenceDidMigrate",
                  v52,
                  @"CAMUserPreferenceCaptureMode",
                  v51,
                  @"CAMUserPreferenceCaptureDevice",
                  v50,
                  @"CAMUserPreferenceDesiredFlashMode",
                  v49,
                  @"CAMUserPreferenceTorchMode",
                  v48,
                  @"CAMUserPreferenceDesiredHDRMode",
                  &unk_26BDDDB78,
                  @"CAMUserPreferenceFlashAndHDRConflictingControl",
                  v47,
                  @"CAMUserPreferenceTimerDuration",
                  v46,
                  @"CAMUserPreferenceAspectRatioCrop",
                  v45,
                  @"CAMUserPreferenceDesiredPhotoModeEffectFilterType",
                  v44,
                  @"CAMUserPreferenceSquareModeEffectFilterType",
                  v43,
                  @"CAMUserPreferencePortraitModeEffectFilterType",
                  v42,
                  @"CAMUserPreferencePhotoModeLastCapturedEffectFilterType",
                  v38,
                  @"CAMUserPreferenceSquareModeLastCapturedEffectFilterType",
                  v41,
                  @"CAMUserPreferencePortraitModeLastCapturedEffectFilterType",
                  v40,
                  @"CAMUserPreferencePortraitModeLightingEffectType",
                  v39,
                  @"CAMUserPreferencePortraitModeApertureValue",
                  v9,
                  @"CAMUserPreferencePortraitEffectIntensityValue");

  if ([v54 isLivePhotoSupported])
  {
    v15 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "irisMode"));
    [v33 setObject:v15 forKeyedSubscript:@"CAMUserPreferenceDesiredIrisMode"];
  }
  if (([v54 isDualSupported] & 1) != 0
    || ([v54 isWideDualSupported] & 1) != 0
    || [v54 isTripleCameraSupported])
  {
    uint64_t v16 = MEMORY[0x263EFFA80];
    [v33 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:@"CAMUserPreferenceDisableCameraSwitchingDuringVideoRecording"];
    [v33 setObject:v16 forKeyedSubscript:@"CAMUserPreferencePortraitModeDidAcknowledgeDescription_12"];
  }
  if ([v54 isAutoLowLightVideoSupported]) {
    [v33 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"CAMUserPreferenceAutoLowLightVideoEnabled"];
  }
  if ([v54 isLowLightSupported]) {
    v17 = &unk_26BDDDBF0;
  }
  else {
    v17 = &unk_26BDDDB90;
  }
  [v33 setObject:v17 forKeyedSubscript:@"CAMUserPreferenceDesiredNightMode"];
  [v33 setObject:&unk_26BDDDB90 forKeyedSubscript:@"CAMUserPreferenceNightModeConflicts"];
  [v33 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:@"CAMUserPreferencePreserveNightMode"];
  uint64_t v18 = [v54 defaultPhotoResolutionForMode:0 devicePosition:0 encodingBehavior:1];
  v19 = [NSNumber numberWithInteger:v18];
  [v33 setObject:v19 forKeyedSubscript:@"CAMUserPreferenceMaximumHEICPhotoResolution"];

  [v33 setObject:&unk_26BDDDB78 forKeyedSubscript:@"CAMUserPreferenceProRawFileFormat"];
  uint64_t v20 = [v54 defaultPhotoResolutionForMode:0 devicePosition:0 encodingBehavior:2];
  v21 = [NSNumber numberWithInteger:v20];
  [v33 setObject:v21 forKeyedSubscript:@"CAMUserPreferenceMaximumRAWPhotoResolution"];

  LODWORD(v25) = 0;
  objc_msgSend(v54, "defaultZoomFactorForMode:device:videoConfiguration:captureOrientation:videoStabilizationStrength:videoEncodingBehavior:customLens:outputToExternalStorage:spatialVideoEnabled:isTrueVideo:prefersHDR10BitVideo:overrodeWithForcedZoomValue:", 6, objc_msgSend(v54, "preferredDeviceForPosition:mode:videoConfiguration:videoStabilizationStrength:spatialVideoEnabled:", 0, 6, 0, 0, 0), 0, 1, 0, 1, 0, v25, 0);
  v22 = objc_msgSend(NSNumber, "numberWithDouble:");
  [v33 setObject:v22 forKeyedSubscript:@"CAMUserPreferencePortraitModeRearZoomValue"];

  if ([v54 photoModeDepthSuggestionSupported]) {
    [v33 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"CAMUserPreferenceEnableDepthSuggestion"];
  }
  if ([v54 isInternalInstall])
  {
    uint64_t v23 = MEMORY[0x263EFFA80];
    [v33 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:@"CAMUserPreferenceEnableLockAsShutter"];
    [v33 setObject:v23 forKeyedSubscript:@"CAMUserPreferenceDebugTransientAssets"];
    [v33 setObject:v23 forKeyedSubscript:@"CAMUserPreferenceDebugBurstRespectsEncodingSettings"];
  }
  [v34 registerDefaults:v33];
  [(CAMUserPreferences *)v36 _setUnderlyingUserDefaults:v34];
  v24 = (void *)preferences_sharedInstance;
  preferences_sharedInstance = (uint64_t)v36;
}

+ (BOOL)_fallBackToCameraDefaultsForBundleIdentifier:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263EFFA08];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(v3, "setWithObjects:", @"com.apple.MobileSMS", @"com.apple.camera.CameraMessagesApp", @"com.apple.Camera-API", @"com.apple.AssetExplorerTester", 0);
  char v6 = [v5 containsObject:v4];

  return v6;
}

+ (id)_defaultCaptureConfiguration
{
  uint64_t v3 = +[CAMCaptureCapabilities capabilities];
  if ([v3 isFrontFlashSupported])
  {
    uint64_t v4 = 2;
  }
  else
  {
    int v5 = [v3 isBackFlashSupported];
    uint64_t v4 = 2;
    if (!v5) {
      uint64_t v4 = 0;
    }
  }
  uint64_t v37 = v4;
  if ([v3 isFrontAutomaticHDRSupported])
  {
    uint64_t v6 = 2;
  }
  else if ([v3 isBackAutomaticHDRSupported])
  {
    uint64_t v6 = 2;
  }
  else
  {
    uint64_t v6 = 0;
  }
  unsigned int v7 = [v3 isLivePhotoSupported];
  int v8 = [v3 isLivePhotoAutoModeSupported];
  unsigned int v34 = [v3 isSuperWideAutoMacroSupported];
  uint64_t v9 = [a1 defaultMode];
  uint64_t v10 = [a1 defaultDevice];
  int v11 = [v3 isSmartHDRSupported];
  uint64_t v36 = [a1 defaultFilterTypeForMode:0];
  uint64_t v35 = [a1 defaultFilterTypeForMode:4];
  uint64_t v33 = [a1 defaultFilterTypeForMode:6];
  uint64_t v32 = [a1 defaultLightingTypeForMode:6];
  uint64_t v12 = [v3 semanticStylesVersion];
  uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
  if (v12 == 1)
  {
    v14 = objc_msgSend(MEMORY[0x263F306F8], "defaultStylesIncludingSystemStyles:systemStylePlaceholder:creativeStyles:", objc_msgSend(v3, "allowSystemSmartStylesInPicker"), 1, 1);
    uint64_t v15 = [v14 indexOfObjectPassingTest:&__block_literal_global_10];
    if (v15 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v16 = 0;
    }
    else {
      uint64_t v16 = v15;
    }
    uint64_t v31 = v16;
    uint64_t v13 = v15;
  }
  else if (v12)
  {
    uint64_t v31 = 0;
    v14 = 0;
  }
  else
  {
    v14 = +[CAMSemanticStyle defaultStyles];
    uint64_t v31 = 0;
  }
  if ((unint64_t)(v10 - 1) > 0xA) {
    uint64_t v17 = 0;
  }
  else {
    uint64_t v17 = qword_209C79218[v10 - 1];
  }
  if (v11) {
    uint64_t v18 = 1;
  }
  else {
    uint64_t v18 = v6;
  }
  uint64_t v30 = v18;
  if (v8) {
    uint64_t v19 = 2;
  }
  else {
    uint64_t v19 = v7;
  }
  uint64_t v20 = [v3 defaultPhotoResolutionForMode:v9 devicePosition:v17 encodingBehavior:1];
  v21 = [CAMCaptureConfiguration alloc];
  v22 = +[CAMCaptureCapabilities capabilities];
  [v22 defaultPortraitEffectIntensity];
  double v24 = v23;
  uint64_t v25 = [a1 _defaultExposureBiasesByMode];
  BYTE2(v29) = 0;
  LOWORD(v29) = [v3 isZoomPIPSupported];
  LOBYTE(v28) = 0;
  v26 = -[CAMCaptureConfiguration initWithCaptureMode:captureDevice:videoConfiguration:audioConfiguration:mixAudioWithOthers:flashMode:torchMode:HDRMode:irisMode:timerDuration:photoModeAspectRatioCrop:photoModeEffectFilterType:squareModeEffectFilterType:portraitModeEffectFilterType:portraitModeLightingEffectType:portraitModeApertureValue:portraitModeIntensityValue:mirrorFrontCameraCaptures:exposureBiasesByMode:macroMode:photoResolution:rawMode:proResVideoMode:semanticStyles:selectedSemanticStyleIndex:smartStyleSystemStyleIndex:videoStabilizationMode:zoomPIPEnabled:spatialVideoEnabled:optionalDepthEffectEnabled:sharedLibraryMode:](v21, "initWithCaptureMode:captureDevice:videoConfiguration:audioConfiguration:mixAudioWithOthers:flashMode:torchMode:HDRMode:irisMode:timerDuration:photoModeAspectRatioCrop:photoModeEffectFilterType:squareModeEffectFilterType:portraitModeEffectFilterType:portraitModeLightingEffectType:portraitModeApertureValue:portraitModeIntensityValue:mirrorFrontCameraCaptures:exposureBiasesByMode:macroMode:photoResolution:rawMode:proResVideoMode:semanticStyles:selectedSemanticStyleIndex:smartStyleSystemStyleIndex:videoStabilizationMode:zoomPIPEnabled:spatialVideoEnabled:optionalDepthEffectEnabled:sharedLibraryMode:", v9, v10, 0, 0, 1, v37, 0.0, v24, 0, v30, v19, 0,
          0,
          v36,
          v35,
          v33,
          v32,
          v28,
          v25,
          v34,
          v20,
          0,
          0,
          v14,
          v31,
          v13,
          0,
          v29,
          0);

  return v26;
}

+ (int64_t)defaultFilterTypeForMode:(int64_t)a3
{
  return 16 * ((a3 & 0xFFFFFFFFFFFFFFFELL) == 6);
}

+ (int64_t)defaultLightingTypeForMode:(int64_t)a3
{
  uint64_t v4 = +[CAMCaptureCapabilities capabilities];
  LODWORD(a3) = [v4 isLightingControlSupportedForMode:a3];

  return a3;
}

- (void)_setUnderlyingUserDefaults:(id)a3
{
}

- (NSUserDefaults)_underlyingUserDefaults
{
  return self->__underlyingUserDefaults;
}

- (int64_t)_sanitizeEffectFilterType:(int64_t)a3 forMode:(int64_t)a4
{
  uint64_t v6 = [(CAMUserPreferences *)self filterTypesForMode:a4];
  if (!v6
    || ([NSNumber numberWithInteger:a3],
        unsigned int v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v6 indexOfObject:v7],
        v7,
        v8 == 0x7FFFFFFFFFFFFFFFLL))
  {
    a3 = +[CAMUserPreferences defaultFilterTypeForMode:a4];
  }

  return a3;
}

- (id)filterTypesForMode:(int64_t)a3
{
  uint64_t v4 = +[CAMCaptureCapabilities capabilities];
  if ([v4 isLiveFilteringSupported]) {
    BOOL v5 = (unint64_t)a3 > 6;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = (void *)qword_263FA1A90[a3];
  }

  return v6;
}

- (int64_t)_sanitizeLightingType:(int64_t)a3 forMode:(int64_t)a4
{
  uint64_t v5 = [(id)objc_opt_class() defaultLightingTypeForMode:a4];
  if (!v5) {
    return 0;
  }
  int64_t v6 = v5;
  unsigned int v7 = +[CAMCaptureCapabilities capabilities];
  unint64_t v8 = [v7 supportedEffectSetForDevicePosition:0];
  unint64_t v9 = [v7 supportedEffectSetForDevicePosition:1];
  uint64_t v10 = 0;
  if (v8 <= 3) {
    uint64_t v10 = (void *)qword_263FA1AC8[v8];
  }
  int v11 = [NSNumber numberWithInteger:a3];
  char v12 = [v10 containsObject:v11];

  if ((v12 & 1) == 0)
  {
    if (v9 > 3) {
      uint64_t v13 = 0;
    }
    else {
      uint64_t v13 = (void *)qword_263FA1AC8[v9];
    }
    v14 = [NSNumber numberWithInteger:a3];
    int v15 = [v13 containsObject:v14];

    if (!v15) {
      a3 = v6;
    }
  }

  return a3;
}

- (int64_t)videoConfiguration
{
  return self->_videoConfiguration;
}

- (void)_setDidResetTorchMode:(BOOL)a3
{
  self->_didResetTorchMode = a3;
}

- (CAMCaptureConfiguration)captureConfiguration
{
  return self->_captureConfiguration;
}

- (CAMConflictingControlConfiguration)conflictingControlConfiguration
{
  return self->_conflictingControlConfiguration;
}

- (int64_t)photoEncodingBehavior
{
  uint64_t v3 = +[CAMCaptureCapabilities capabilities];
  if ([v3 isHEVCEncodingSupported]) {
    int64_t v4 = [(CAMUserPreferences *)self _preferHEVCWhenAvailable];
  }
  else {
    int64_t v4 = 0;
  }

  return v4;
}

- (BOOL)shouldShowQRBanners
{
  uint64_t v3 = +[CAMCaptureCapabilities capabilities];
  BOOL v4 = ([v3 hostProcess] & 0xFFFFFFFFFFFFFFFBLL) == 0;
  if (![(CAMUserPreferences *)self QRBannersEnabledInSettings]
    && ![(CAMUserPreferences *)self forceEnableQRBanners])
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)QRBannersEnabledInSettings
{
  return self->_QRBannersEnabledInSettings;
}

- (int64_t)preferredMinimumFreeBytes
{
  return self->_preferredMinimumFreeBytes;
}

- (BOOL)didAcknowledgePortraitModeDescription
{
  return self->_didAcknowledgePortraitModeDescription;
}

- (BOOL)forceEnableQRBanners
{
  return self->_forceEnableQRBanners;
}

- (BOOL)shouldUseModernHDRBehavior
{
  return self->_shouldUseModernHDRBehavior;
}

- (BOOL)preserveEffectFilter
{
  return self->_preserveEffectFilter;
}

- (BOOL)shouldShowGridView
{
  return self->_shouldShowGridView;
}

- (int64_t)photoModeLastCapturedEffectFilterType
{
  return self->_photoModeLastCapturedEffectFilterType;
}

- (BOOL)isLockAsShutterEnabled
{
  return self->_lockAsShutterEnabled;
}

- (BOOL)shouldDelayRemotePersistence
{
  return self->_shouldDelayRemotePersistence;
}

- (void)setPhotoModeLastCapturedEffectFilterType:(int64_t)a3
{
  self->_photoModeLastCapturedEffectFilterType = a3;
}

- (BOOL)shouldCaptureHDREV0
{
  return self->_shouldCaptureHDREV0;
}

- (void)setCaptureConfiguration:(id)a3
{
}

- (void)setConflictingControlConfiguration:(id)a3
{
}

- (void)writePreferences
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  uint64_t v3 = +[CAMCaptureCapabilities capabilities];
  int v4 = [v3 fallbackCameraEnabled];

  if (v4)
  {
    uint64_t v5 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2099F8000, v5, OS_LOG_TYPE_DEFAULT, "Skip writePreferences since we are in a fallback state", buf, 2u);
    }
  }
  else
  {
    uint64_t v5 = [(CAMUserPreferences *)self _underlyingUserDefaults];
    [v5 setInteger:[(CAMUserPreferences *)self _previewAspectModeForPhotoModes] forKey:@"CAMUserPreferencePreviewAspectModeForPhotoModes"];
    [v5 setInteger:[(CAMUserPreferences *)self _previewAspectModeForVideoModes] forKey:@"CAMUserPreferencePreviewViewAspectMode"];
    int64_t v6 = [(CAMUserPreferences *)self captureConfiguration];
    unsigned int v7 = [(CAMUserPreferences *)self conflictingControlConfiguration];
    -[NSObject setInteger:forKey:](v5, "setInteger:forKey:", [v7 desiredFlashMode], @"CAMUserPreferenceDesiredFlashMode");
    -[NSObject setInteger:forKey:](v5, "setInteger:forKey:", [v7 desiredHDRMode], @"CAMUserPreferenceDesiredHDRMode");
    -[NSObject setInteger:forKey:](v5, "setInteger:forKey:", [v7 flashAndHDRConflictingControl], @"CAMUserPreferenceFlashAndHDRConflictingControl");
    unint64_t v8 = [v6 device] - 1;
    if (v8 > 0xA) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = qword_209C79218[v8];
    }
    uint64_t v10 = +[CAMCaptureCapabilities capabilities];
    if ([v10 isLivePhotoSupported]) {
      -[NSObject setInteger:forKey:](v5, "setInteger:forKey:", [v6 irisMode], @"CAMUserPreferenceDesiredIrisMode");
    }
    unint64_t v11 = [v10 hostProcess];
    if (v11 <= 4 && v11 != 3)
    {
      -[NSObject setInteger:forKey:](v5, "setInteger:forKey:", [v6 mode], @"CAMUserPreferenceCaptureMode");
      [v5 setInteger:v9 forKey:@"CAMUserPreferenceCaptureDevice"];
    }
    -[NSObject setInteger:forKey:](v5, "setInteger:forKey:", [v6 torchMode], @"CAMUserPreferenceTorchMode");
    -[NSObject setInteger:forKey:](v5, "setInteger:forKey:", [v6 timerDuration], @"CAMUserPreferenceTimerDuration");
    if ([v10 isCTMSupported]) {
      -[NSObject setInteger:forKey:](v5, "setInteger:forKey:", [v6 photoModeAspectRatioCrop], @"CAMUserPreferenceAspectRatioCrop");
    }
    if ([v10 isLiveFilteringSupported])
    {
      -[NSObject setInteger:forKey:](v5, "setInteger:forKey:", [v6 photoModeEffectFilterType], @"CAMUserPreferenceDesiredPhotoModeEffectFilterType");
      -[NSObject setInteger:forKey:](v5, "setInteger:forKey:", [v6 squareModeEffectFilterType], @"CAMUserPreferenceSquareModeEffectFilterType");
      [v5 setInteger:[(CAMUserPreferences *)self photoModeLastCapturedEffectFilterType] forKey:@"CAMUserPreferencePhotoModeLastCapturedEffectFilterType"];
      [v5 setInteger:[(CAMUserPreferences *)self squareModeLastCapturedEffectFilterType] forKey:@"CAMUserPreferenceSquareModeLastCapturedEffectFilterType"];
      -[NSObject setInteger:forKey:](v5, "setInteger:forKey:", [v6 portraitModeEffectFilterType], @"CAMUserPreferencePortraitModeEffectFilterType");
      [v5 setInteger:[(CAMUserPreferences *)self portraitModeLastCapturedEffectFilterType] forKey:@"CAMUserPreferencePortraitModeLastCapturedEffectFilterType"];
    }
    [v5 setInteger:[(CAMUserPreferences *)self portraitModeRearDevice] forKey:@"CAMUserPreferencePortraitModeRearDevice"];
    [(CAMUserPreferences *)self portraitModeRearZoomValue];
    *(float *)&double v12 = v12;
    [v5 setFloat:@"CAMUserPreferencePortraitModeRearZoomValue" forKey:v12];
    if ([v10 arePortraitEffectsSupported]) {
      -[NSObject setInteger:forKey:](v5, "setInteger:forKey:", [v6 portraitModeLightingEffectType], @"CAMUserPreferencePortraitModeLightingEffectType");
    }
    if ([v10 isDepthEffectApertureSupported])
    {
      [v6 portraitModeApertureValue];
      *(float *)&double v13 = v13;
      [v5 setFloat:@"CAMUserPreferencePortraitModeApertureValue" forKey:v13];
      [v6 portraitModeIntensityValue];
      *(float *)&double v14 = v14;
      [v5 setFloat:@"CAMUserPreferencePortraitEffectIntensityValue" forKey:v14];
    }
    if ([v10 isExposureSliderSupported])
    {
      int v15 = [v6 exposureBiasesByMode];
      +[CAMPreferencesUtilities setDictionary:v15 forKey:@"CAMUserPreferenceExposureBiasByMode" defaults:v5];
    }
    if ([v10 isSuperWideAutoMacroSupported]) {
      -[NSObject setInteger:forKey:](v5, "setInteger:forKey:", [v7 desiredMacroMode], @"CAMUserPreferenceAutoMacroMode");
    }
    if ([(CAMUserPreferences *)self shouldUseDepthSuggestionInPhotoMode]) {
      -[NSObject setBool:forKey:](v5, "setBool:forKey:", [v6 optionalDepthEffectEnabled], @"CAMUserPreferenceOptionalDepthEffectEnabled");
    }
    if ([(CAMUserPreferences *)self rawControlEnabled]) {
      -[NSObject setInteger:forKey:](v5, "setInteger:forKey:", [v7 desiredRAWMode], @"CAMUserPreferencesDesiredRAWMode");
    }
    if ([(CAMUserPreferences *)self rawControlEnabled]
      || [(CAMUserPreferences *)self photoFormatControlEnabled])
    {
      -[NSObject setInteger:forKey:](v5, "setInteger:forKey:", [v7 photoFormatConflicts], @"CAMUserPreferencesRAWConflicts");
    }
    if ([(CAMUserPreferences *)self photoFormatControlEnabled])
    {
      if ((unint64_t)[v7 desiredPhotoResolution] > 2
        || -[CAMUserPreferences rawControlEnabled](self, "rawControlEnabled") && [v7 desiredRAWMode] == 1)
      {
        -[NSObject setInteger:forKey:](v5, "setInteger:forKey:", [v7 desiredPhotoResolution], @"CAMUserPreferencesDesiredPhotoResolution");
      }
      else
      {
        [v5 removeObjectForKey:@"CAMUserPreferencesDesiredPhotoResolution"];
      }
    }
    if ([v10 isProResVideoSupported]
      && [(CAMUserPreferences *)self isProResControlEnabled])
    {
      -[NSObject setInteger:forKey:](v5, "setInteger:forKey:", [v6 proResVideoMode], @"CAMUserPreferenceDesiredProResVideoMode");
    }
    if ([v10 isLowLightSupported])
    {
      -[NSObject setInteger:forKey:](v5, "setInteger:forKey:", [v7 desiredLowLightControlMode], @"CAMUserPreferenceDesiredNightMode");
      -[NSObject setInteger:forKey:](v5, "setInteger:forKey:", [v7 lowLightConflicts], @"CAMUserPreferenceNightModeConflicts");
    }
    if (([v10 semanticStylesSupport] & 8) != 0)
    {
      int v16 = [v10 smartStylesSupported];
      id v17 = objc_alloc_init(MEMORY[0x263EFF980]);
      uint64_t v18 = [v6 semanticStyles];
      v57[0] = MEMORY[0x263EF8330];
      v57[1] = 3221225472;
      v57[2] = __38__CAMUserPreferences_writePreferences__block_invoke;
      v57[3] = &unk_263FA1978;
      char v60 = v16;
      id v19 = v6;
      id v58 = v19;
      id v20 = v17;
      id v59 = v20;
      [v18 enumerateObjectsUsingBlock:v57];

      CFPreferencesSetAppValue((CFStringRef)[(CAMUserPreferences *)self _semanticStylesKey], v20, @"com.apple.camera");
      if (v16)
      {
        v55 = v7;
        unint64_t v21 = [v19 smartStyleSystemStyleIndex];
        v22 = [v19 semanticStyles];
        if (v21 >= [v22 count])
        {
          double v24 = 0;
        }
        else
        {
          double v23 = [v19 semanticStyles];
          double v24 = objc_msgSend(v23, "objectAtIndexedSubscript:", objc_msgSend(v19, "smartStyleSystemStyleIndex"));
        }
        uint64_t v25 = [(CAMUserPreferences *)self lastReadSystemStyle];
        v26 = 0;
        v54 = (void *)v25;
        v27 = 0;
        if (v24 && v25)
        {
          if ([v24 isEqualToSmartStyle:v25])
          {
            v26 = 0;
            v27 = 0;
          }
          else
          {
            v27 = [v24 dictionaryRepresentation];
            v26 = [v54 dictionaryRepresentation];
          }
        }
        v53 = v24;
        CFPreferencesSetAppValue(@"CAMUserPreferenceSmartStylesSystemStyleOverride", v27, @"com.apple.camera");
        CFPreferencesSetAppValue(@"CAMUserPreferenceSmartStylesSystemStyleOverrideReference", v26, @"com.apple.camera");
        uint64_t v28 = [v19 selectedSemanticStyleIndex];
        if (v28 == [v19 smartStyleSystemStyleIndex])
        {
          CFPreferencesSetAppValue(@"CAMUserPreferenceSmartStylesSelectedPreset", 0, @"com.apple.camera");
        }
        else
        {
          uint64_t v29 = objc_msgSend(v19, "selectedSemanticStyleIndex", v53);
          uint64_t v30 = [v19 semanticStyles];
          [(CAMUserPreferences *)self _writeSmartStylePresetStringForIndex:v29 inStyles:v30 key:@"CAMUserPreferenceSmartStylesSelectedPreset"];
        }
        unsigned int v7 = v55;
      }
      else
      {
        CFPreferencesSetAppValue(@"CAMUserPreferenceSelectedSemanticStyleIndex", (CFPropertyListRef)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v19, "selectedSemanticStyleIndex")), @"com.apple.camera");
      }
      CFPreferencesAppSynchronize(@"com.apple.camera");
    }
    if ([(id)objc_opt_class() isSharedLibrarySupportedAndEnabledForCapabilities:v10])
    {
      v56 = v7;
      unint64_t v31 = [v6 sharedLibraryMode];
      [v5 setInteger:v31 forKey:@"CAMUserPreferenceSharedLibraryMode"];
      uint64_t v32 = os_log_create("com.apple.camera", "SharedLibrary");
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v33 = CAMSharedLibraryModeDescription(v31);
        *(_DWORD *)buf = 138543362;
        v62 = v33;
        _os_log_impl(&dword_2099F8000, v32, OS_LOG_TYPE_DEFAULT, "[CAMUserPreferences] write sharedLibraryMode:%{public}@", buf, 0xCu);
      }
      unsigned int v34 = [(CAMUserPreferences *)self sharedLibraryLastLocation];
      if (v34)
      {
        uint64_t v35 = (void *)MEMORY[0x263F08910];
        uint64_t v36 = [(CAMUserPreferences *)self sharedLibraryLastLocation];
        uint64_t v37 = [v35 archivedDataWithRootObject:v36 requiringSecureCoding:1 error:0];
      }
      else
      {
        uint64_t v37 = 0;
      }

      [v5 setObject:v37 forKey:@"CAMUserPreferenceSharedLibraryLastLocation"];
      [v5 setBool:[(CAMUserPreferences *)self sharedLibraryLastLocationAcquiredDuringTrip] forKey:@"CAMUserPreferenceSharedLibraryLastLocationAcquiredDuringTrip"];
      v38 = [(CAMUserPreferences *)self sharedLibraryLastDiscoveryDate];
      [v5 setObject:v38 forKey:@"CAMUserPreferenceSharedLibraryLastDiscoveryDate"];

      v39 = [(CAMUserPreferences *)self sharedLibraryLastDiscoveryLocation];
      if (v39)
      {
        v40 = (void *)MEMORY[0x263F08910];
        v41 = [(CAMUserPreferences *)self sharedLibraryLastDiscoveryLocation];
        v42 = [v40 archivedDataWithRootObject:v41 requiringSecureCoding:1 error:0];
      }
      else
      {
        v42 = 0;
      }

      [v5 setObject:v42 forKey:@"CAMUserPreferenceSharedLibraryLastDiscoveryLocation"];
      v43 = [(CAMUserPreferences *)self sharedLibraryLastUserActionDate];
      [v5 setObject:v43 forKey:@"CAMUserPreferenceSharedLibraryLastUserActionDate"];

      v44 = [(CAMUserPreferences *)self sharedLibraryLastUserActionLocation];
      if (v44)
      {
        v45 = (void *)MEMORY[0x263F08910];
        v46 = [(CAMUserPreferences *)self sharedLibraryLastUserActionLocation];
        v47 = [v45 archivedDataWithRootObject:v46 requiringSecureCoding:1 error:0];
      }
      else
      {
        v47 = 0;
      }
      unsigned int v7 = v56;

      [v5 setObject:v47 forKey:@"CAMUserPreferenceSharedLibraryLastUserActionLocation"];
    }
    else
    {
      [v5 removeObjectForKey:@"CAMUserPreferenceSharedLibraryLastLocation"];
      [v5 removeObjectForKey:@"CAMUserPreferenceSharedLibraryLastLocationAcquiredDuringTrip"];
      [v5 removeObjectForKey:@"CAMUserPreferenceSharedLibraryLastDiscoveryDate"];
      [v5 removeObjectForKey:@"CAMUserPreferenceSharedLibraryLastDiscoveryLocation"];
      [v5 removeObjectForKey:@"CAMUserPreferenceSharedLibraryLastUserActionDate"];
      [v5 removeObjectForKey:@"CAMUserPreferenceSharedLibraryLastUserActionLocation"];
      [v5 removeObjectForKey:@"CAMUserPreferenceSharedLibraryMode"];
    }
    if (objc_msgSend(v10, "isVideoStabilizationControlSupported", v53)) {
      -[NSObject setInteger:forKey:](v5, "setInteger:forKey:", [v6 videoStabilizationMode], @"CAMUserPreferenceVideoStabilizationMode");
    }
    if ([v10 isHalfPressSupported])
    {
      v48 = [(CAMUserPreferences *)self openHalfPressSpotlightControls];
      v49 = [v48 allObjects];
      [v5 setObject:v49 forKey:@"CAMUserPreferenceOpenHalfPressSpotlightControls"];
    }
    if ([v10 isSpatialVideoCaptureSupported]) {
      -[NSObject setBool:forKey:](v5, "setBool:forKey:", [v6 spatialVideoEnabled], @"CAMUserPreferenceSpatialVideoEnabled");
    }
    if ([v10 allowControlDrawer])
    {
      v50 = objc_opt_class();
      v51 = [(CAMUserPreferences *)self preferredDrawerControlByMode];
      v52 = [v50 _persistenceDictionaryForPreferredDrawerControlByMode:v51];

      [v5 setObject:v52 forKey:@"CAMUserPreferencesPreferredDrawerControlByMode"];
    }
    [(CAMUserPreferences *)self _updateLastWrittenSettingsDate];
    [(CAMUserPreferences *)self _setHasReadLastWrittenValues:0];
  }
}

- (int64_t)squareModeLastCapturedEffectFilterType
{
  return self->_squareModeLastCapturedEffectFilterType;
}

- (int64_t)portraitModeLastCapturedEffectFilterType
{
  return self->_portraitModeLastCapturedEffectFilterType;
}

- (double)_resetTimeoutOverride
{
  return self->__resetTimeoutOverride;
}

- (void)_setResetTimeoutDate:(id)a3
{
}

- (void)setForceEnableQRBanners:(BOOL)a3
{
  self->_forceEnableQRBanners = a3;
}

+ (int64_t)defaultMode
{
  return 0;
}

+ (int64_t)defaultDevicePosition
{
  v2 = +[CAMCaptureCapabilities capabilities];
  int64_t v3 = [v2 isBackCameraSupported] ^ 1;

  return v3;
}

+ (int64_t)defaultDevice
{
  return [a1 defaultDevicePosition] != 0;
}

+ (id)defaultCaptureConfiguration
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__CAMUserPreferences_defaultCaptureConfiguration__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultCaptureConfiguration_onceToken != -1) {
    dispatch_once(&defaultCaptureConfiguration_onceToken, block);
  }
  v2 = (void *)defaultCaptureConfiguration_configuration;
  return v2;
}

uint64_t __49__CAMUserPreferences_defaultCaptureConfiguration__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) _defaultCaptureConfiguration];
  uint64_t v2 = defaultCaptureConfiguration_configuration;
  defaultCaptureConfiguration_configuration = v1;
  return MEMORY[0x270F9A758](v1, v2);
}

BOOL __50__CAMUserPreferences__defaultCaptureConfiguration__block_invoke(uint64_t a1, void *a2)
{
  return [a2 presetType] == 0;
}

- (int64_t)ppt_readPortraitLightingType
{
  int64_t v3 = [(CAMUserPreferences *)self _underlyingUserDefaults];
  int64_t v4 = -[CAMUserPreferences _sanitizeLightingType:forMode:](self, "_sanitizeLightingType:forMode:", [v3 integerForKey:@"CAMUserPreferencePortraitModeLightingEffectType"], 6);

  return v4;
}

+ (id)_defaultExposureBiasesByMode
{
  v5[8] = *MEMORY[0x263EF8340];
  v4[0] = &unk_26BDDDB78;
  v4[1] = &unk_26BDDDD10;
  v5[0] = &unk_26BDDDCF8;
  v5[1] = &unk_26BDDDCF8;
  v4[2] = &unk_26BDDDBA8;
  v4[3] = &unk_26BDDDD28;
  v5[2] = &unk_26BDDDCF8;
  v5[3] = &unk_26BDDDCF8;
  v4[4] = &unk_26BDDDC98;
  v4[5] = &unk_26BDDDD40;
  v5[4] = &unk_26BDDDCF8;
  v5[5] = &unk_26BDDDCF8;
  v4[6] = &unk_26BDDDD58;
  v4[7] = &unk_26BDDDC08;
  v5[6] = &unk_26BDDDCF8;
  v5[7] = &unk_26BDDDCF8;
  uint64_t v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:8];
  return v2;
}

- (void)_publishAnalyticsIfNeeded
{
  id v7 = (id)CFPreferencesCopyAppValue(@"CAMUserPreferenceLastCoreAnalyticsPublishDate", @"com.apple.camera");
  int64_t v3 = [MEMORY[0x263EFF910] now];
  if (!v7
    || ([MEMORY[0x263EFF8F0] currentCalendar],
        int64_t v4 = objc_claimAutoreleasedReturnValue(),
        char v5 = [v4 isDate:v7 inSameDayAsDate:v3],
        v4,
        (v5 & 1) == 0))
  {
    int64_t v6 = [[CAMAnalyticsPreferencesEvent alloc] initWithPreferences:self];
    [(CAMAnalyticsEvent *)v6 publish];
    CFPreferencesSetAppValue(@"CAMUserPreferenceLastCoreAnalyticsPublishDate", v3, @"com.apple.camera");
    CFPreferencesAppSynchronize(@"com.apple.camera");
  }
}

- (int64_t)defaultDeviceForModeChange:(int64_t)a3 devicePosition:(int64_t)a4 spatialVideoEnabled:(BOOL)a5
{
  if (a4 == 1) {
    return 1;
  }
  if (a4) {
    return 0;
  }
  if (a3 == 1)
  {
    if (a5) {
      return 6;
    }
    else {
      return 0;
    }
  }
  if (a3 != 6)
  {
    if (a3 == 8) {
      return 6;
    }
    else {
      return 0;
    }
  }
  if (![(CAMUserPreferences *)self preservePortraitZoom]) {
    return 0;
  }
  return [(CAMUserPreferences *)self portraitModeRearDevice];
}

- (double)defaultZoomFactorForGraphConfiguration:(id)a3 captureOrientation:(int64_t)a4 outputToExternalStorage:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  uint64_t v9 = +[CAMCaptureCapabilities capabilities];
  char v21 = 0;
  objc_msgSend(v9, "defaultZoomFactorForGraphConfiguration:captureOrientation:customLens:outputToExternalStorage:overrodeWithForcedZoomValue:", v8, a4, -[CAMUserPreferences defaultCustomLens](self, "defaultCustomLens"), v5, &v21);
  double v11 = v10;
  uint64_t v12 = [v8 mode];
  uint64_t v13 = [v8 device];
  uint64_t v14 = [v8 videoConfiguration];
  uint64_t v15 = [v8 videoStabilizationStrength];
  uint64_t v16 = [v8 enableStereoVideoCapture];

  uint64_t v17 = [v9 resolvedDeviceForDesiredDevice:v13 mode:v12 videoConfiguration:v14 videoStabilizationStrength:v15 spatialVideoEnabled:v16];
  if (!v21 && v12 == 6)
  {
    uint64_t v18 = v17;
    if ([(CAMUserPreferences *)self preservePortraitZoom])
    {
      if (v18 == [(CAMUserPreferences *)self portraitModeRearDevice])
      {
        [(CAMUserPreferences *)self portraitModeRearZoomValue];
        double v11 = v19;
      }
    }
  }

  return v11;
}

- (id)videoThumbnailOutputConfigurationForMode:(int64_t)a3 devicePosition:(int64_t)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  int64_t v4 = -[CAMUserPreferences filterTypesForMode:](self, "filterTypesForMode:", a3, a4);
  if ([v4 count])
  {
    BOOL v5 = [MEMORY[0x263EFF980] array];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v6);
          }
          double v11 = +[CAMEffectFilterManager filtersForFilterType:lightingType:applyDepthEffect:](CAMEffectFilterManager, "filtersForFilterType:lightingType:applyDepthEffect:", objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "integerValue", (void)v17), 0, 0);
          uint64_t v12 = [v11 firstObject];

          if (v12) {
            [v5 addObject:v12];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v8);
    }

    [MEMORY[0x263F30718] defaultScreenScaleContentSize];
    uint64_t v15 = -[CAMVideoThumbnailOutputConfiguration initWithThumbnailSize:filters:]([CAMVideoThumbnailOutputConfiguration alloc], "initWithThumbnailSize:filters:", v5, v13, v14);
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

- (void)resolveDesiredPhotoResolution:(int64_t)a3 livePhotoMode:(int64_t)a4 rawMode:(int64_t)a5 conflicts:(unint64_t)a6 mode:(int64_t)a7 device:(int64_t)a8 resolvedPhotoResolution:(int64_t *)a9 resolvedLivePhotoMode:(int64_t *)a10
{
  unint64_t v11 = a6 & 2;
  uint64_t v12 = 2;
  if ((a6 & 2) == 0) {
    uint64_t v12 = 3;
  }
  if (a3 == 3) {
    int64_t v13 = v12;
  }
  else {
    int64_t v13 = a3;
  }
  -[CAMUserPreferences fallbackPhotoFormatForDesiredFormat:mode:device:](self, "fallbackPhotoFormatForDesiredFormat:mode:device:", [(CAMUserPreferences *)self photoEncodingBehaviorForMode:a7 resolvedRAWMode:a5 isCapturingVideo:0], v13, a7, a8);
  if (v14 == 3 && v11 == 0) {
    int64_t v16 = 0;
  }
  else {
    int64_t v16 = a4;
  }
  if (a9) {
    *a9 = v14;
  }
  if (a10) {
    *a10 = v16;
  }
}

- (BOOL)readPreferencesWithOverrides:(id)a3 emulationMode:(int64_t)a4 callActive:(BOOL)a5 shouldResetCaptureConfiguration:(BOOL *)a6
{
  BOOL v377 = a5;
  uint64_t v441 = *MEMORY[0x263EF8340];
  id v8 = a3;
  uint64_t v9 = +[CAMCaptureCapabilities capabilities];
  double v10 = [(CAMUserPreferences *)self _underlyingUserDefaults];
  if (([v10 BOOLForKey:@"CAMUserPreferenceDidMigrate"] & 1) == 0) {
    +[CAMUserPreferencesMigrator migrateLegacyPreferences];
  }
  v406 = [(id)objc_opt_class() defaultCaptureConfiguration];
  char v357 = [v10 BOOLForKey:@"CAMUserPreferencePreserveAllSettings"];
  self->_preserveCaptureMode = [v10 BOOLForKey:@"CAMUserPreferencePreserveCaptureMode"];
  int v11 = [v9 isPreserveCreativeControlsSupported];
  if (v11) {
    LOBYTE(v11) = [v10 BOOLForKey:@"CAMUserPreferencePreserveEffectFilter"];
  }
  self->_preserveEffectFilter = v11;
  int v12 = [v9 smartStylesSupported];
  if (v12) {
    LOBYTE(v12) = [v10 BOOLForKey:@"CAMUserPreferencePreserveSmartStyle"];
  }
  self->_preserveSmartStyle = v12;
  self->_preserveLivePhoto = [v10 BOOLForKey:@"CAMUserPreferencePreserveLivePhoto"];
  self->_preserveExposure = [v10 BOOLForKey:@"CAMUserPreferencePreserveExposure"];
  self->_preserveNightMode = [v10 BOOLForKey:@"CAMUserPreferencePreserveNightMode"];
  [v9 _forcedInitialZoomDisplayFactor];
  if (v13 == 0.0) {
    char v14 = [v10 BOOLForKey:@"CAMUserPreferencePreservePortraitZoom"];
  }
  else {
    char v14 = 0;
  }
  self->_preservePortraitZoom = v14;
  if ([v9 fallbackCameraEnabled]) {
    self->_preservePortraitZoom = 0;
  }
  self->_char preserveRAW = [v10 BOOLForKey:@"CAMUserPreferencePreserveRAW"];
  self->_preserveProRes = [v10 BOOLForKey:@"CAMUserPreferencePreserveProRes"];
  int v15 = [v9 isVideoStabilizationControlSupported];
  if (v15) {
    LOBYTE(v15) = [v10 BOOLForKey:@"CAMUserPreferenceEnhancedVideoStabilization"];
  }
  self->_enhancedVideoStabilization = v15;
  int v16 = [v9 isVideoStabilizationControlSupported];
  if (v16) {
    LOBYTE(v16) = [v10 BOOLForKey:@"CAMUserPreferenceActionModeLowLightEnabled"];
  }
  self->_actionModeLowLightEnabled = v16;
  self->_preserveVideoStabilization = [v10 BOOLForKey:@"CAMUserPreferencePreserveVideoStabilization"];
  if ([v9 isLinearDNGSupported]) {
    char preserveRAW = self->_preserveRAW;
  }
  else {
    char preserveRAW = [v10 BOOLForKey:@"CAMUserPreferencePreservePhotoResolution"];
  }
  self->_preservePhotoResolution = preserveRAW;
  [(id)objc_opt_class() performApertureMigrationWithCapabilities:v9];
  self->_preserveAperture = [v10 BOOLForKey:@"CAMUserPreferencePreserveAperture"];
  self->_int64_t videoConfiguration = [v10 integerForKey:*MEMORY[0x263F5DED0]];
  self->_slomoConfiguration = [v10 integerForKey:*MEMORY[0x263F5DEC8]];
  self->_videoConfigurationControlEnabled = [v10 BOOLForKey:@"CAMUserPreferenceEnableVideoConfigurationControl"];
  int v18 = [v9 isPALVideoSupported];
  if (v18) {
    LOBYTE(v18) = [v10 BOOLForKey:@"CAMUserPreferenceEnablePALVideoFormats"];
  }
  self->_PALVideoEnabled = v18;
  self->_cinematicConfiguration = [v10 integerForKey:@"CAMUserPreferenceCinematicConfiguration"];
  if ([v9 isPhotoResolutionSupported:2 forPhotoEncoding:1]) {
    uint64_t v19 = [v10 integerForKey:@"CAMUserPreferenceMaximumHEICPhotoResolution"];
  }
  else {
    uint64_t v19 = [v9 defaultPhotoResolutionForMode:0 devicePosition:0 encodingBehavior:1];
  }
  int64_t v20 = v19;
  if ([v9 isPhotoResolutionSupported:v19 forPhotoEncoding:1]) {
    int64_t v21 = v20;
  }
  else {
    int64_t v21 = 0;
  }
  self->__backPreferredHEICPhotoResolution = v21;
  self->__frontPreferredHEICPhotoResolution = [v9 defaultPhotoResolutionForMode:0 devicePosition:1 encodingBehavior:1];
  uint64_t v22 = 0;
  if ([v9 enhancedRAWResolutionSupported])
  {
    if ([v9 isLinearDNGSupported]) {
      uint64_t v22 = [v10 integerForKey:@"CAMUserPreferenceMaximumRAWPhotoResolution"];
    }
    else {
      uint64_t v22 = 0;
    }
  }
  if ([v9 isPhotoResolutionSupported:v22 forMode:0 device:0 photoEncoding:2]) {
    int64_t v23 = v22;
  }
  else {
    int64_t v23 = 0;
  }
  int64_t v353 = v23;
  self->_maximumRAWPhotoResolution = v23;
  if ([v9 isCustomLensSupportedForPhotoResolution:v21])
  {
    double v24 = [v10 arrayForKey:@"CAMUserPreferencesSelectedCustomLensGroup"];
    uint64_t v25 = [v9 supportedCustomLensGroupForGroup:v24];
    customLensGroup = self->_customLensGroup;
    self->_customLensGroup = v25;

    self->_defaultCustomLens = objc_msgSend(v9, "supportedCustomLensForLens:inGroup:", objc_msgSend(v10, "integerForKey:", @"CAMUserPreferencesDefaultCustomLens"), self->_customLensGroup);
    if (a4)
    {
LABEL_36:
      int v27 = 0;
      LOBYTE(v28) = 0;
      goto LABEL_41;
    }
  }
  else
  {
    uint64_t v29 = self->_customLensGroup;
    self->_customLensGroup = 0;

    self->_defaultCustomLens = 0;
    if (a4) {
      goto LABEL_36;
    }
  }
  int v28 = [v9 isAutoLowLightVideoSupported];
  if (v28)
  {
    LOBYTE(v28) = [v10 BOOLForKey:@"CAMUserPreferenceAutoLowLightVideoEnabled"];
    int v27 = 1;
  }
  else
  {
    int v27 = 0;
  }
LABEL_41:
  self->_lowLightVideoEnabled = v28;
  if ([v9 isVariableFramerateVideoSupported]) {
    [(id)objc_opt_class() performLowLightVideoMigrationWithCapabilities:v9];
  }
  if (v27) {
    int64_t v30 = [v10 integerForKey:@"CAMUserPreferenceVFRMode"];
  }
  else {
    int64_t v30 = 0;
  }
  self->_VFRMode = v30;
  if ([v9 responsiveShutterSupported]) {
    [(id)objc_opt_class() performResponsiveShutterMigrationWithCapabilities:v9];
  }
  int v31 = [v9 responsiveShutterSupported];
  if (v31) {
    LOBYTE(v31) = [v10 BOOLForKey:@"CAMUserPreferenceEnableResponsiveShutter"];
  }
  self->_responsiveShutterEnabled = v31;
  int v32 = [v9 isSuperWideAutoMacroSupported];
  if (v32) {
    [(id)objc_opt_class() performSuperWideAutoMacroMigrationWithCapabilities:v9];
  }
  [(id)objc_opt_class() performHorizonLevelUpgradeWithCapabilities:v9];
  [(id)objc_opt_class() performMostCompatibleConfirmationMigrationWithCapabilities:v9];
  self->_preserveSuperWideAutoMacro = [v10 BOOLForKey:@"CAMUserPreferencePreserveSuperWideAutoMacro"];
  if (v32)
  {
    char v33 = [v10 BOOLForKey:@"CAMUserPreferenceEnableSuperWideAutoMacro"];
    self->_superWideAutoMacroControlAllowed = v33 ^ 1;
    if ((v33 & 1) == 0)
    {
      uint64_t v34 = [v10 integerForKey:@"CAMUserPreferenceAutoMacroMode"];
      goto LABEL_57;
    }
  }
  else
  {
    self->_superWideAutoMacroControlAllowed = 0;
  }
  uint64_t v34 = [v406 macroMode];
LABEL_57:
  uint64_t v385 = v34;
  +[CAMUserPreferences performAudioConfigurationMigrationWithCapabilities:v9];
  self->_preferredAudioConfiguration = +[CAMUserPreferences selectedAudioConfigurationForCapabilities:v9];
  int v35 = [v9 isMixAudioWithOthersSupported];
  if (v35) {
    LOBYTE(v35) = [v10 BOOLForKey:@"CAMUserPreferenceMixAudioWithOthers"];
  }
  self->_shouldMixAudioWithOthers = v35;
  int v36 = [v9 isWindRemovalSupported];
  if (v36) {
    LOBYTE(v36) = [v10 BOOLForKey:@"CAMUserPreferenceAudioWindRemoval"];
  }
  self->_shouldEnableWindRemoval = v36;
  int v37 = [v9 isWhiteBalanceLockingForVideoRecordingSupported];
  if (v37) {
    LOBYTE(v37) = [v10 BOOLForKey:@"CAMUserPreferenceLockWhiteBalanceDuringVideoRecording"];
  }
  self->_shouldLockWhiteBalanceDuringVideoRecording = v37;
  self->_lockAsShutterEnabled = [v10 BOOLForKey:@"CAMUserPreferenceEnableLockAsShutter"];
  self->_shouldShowGridView = CFPreferencesGetAppBooleanValue(@"CAMUserPreferenceShowGridOverlay", @"com.apple.camera", 0) != 0;
  char v38 = [v10 BOOLForKey:@"CAMUserPreferenceShowHorizonLevelPlumb"];
  self->_shouldShowHorizonLevelView = v38;
  self->_shouldShowLevelView = v38;
  self->_QRBannersEnabledInSettings = [v10 BOOLForKey:@"CAMUserPreferenceShowQRCodeBanners"];
  int64_t v391 = a4;
  int64_t v355 = v21;
  if ([v10 BOOLForKey:@"CAMUserPreferenceShowImageAnalysis"]
    && [v9 isImageAnalysisSupported])
  {
    v39 = [MEMORY[0x263EFFA40] standardUserDefaults];
    v40 = [v39 objectForKey:@"AppleLiveTextEnabled" inDomain:*MEMORY[0x263F08100]];

    if (v40)
    {
      char v41 = [v40 BOOLValue];
    }
    else
    {
      if (_os_feature_enabled_impl())
      {
        v42 = [&unk_26BDDFA70 arrayByAddingObjectsFromArray:&unk_26BDDFA88];
      }
      else
      {
        v42 = &unk_26BDDFA70;
      }
      id v43 = v42;

      v44 = (void *)MEMORY[0x263EFF960];
      v45 = [MEMORY[0x263EFF960] _deviceLanguage];
      *(void *)buf = v45;
      v46 = [MEMORY[0x263EFF8C0] arrayWithObjects:buf count:1];
      v47 = [v44 matchedLanguagesFromAvailableLanguages:v43 forPreferredLanguages:v46];

      char v41 = [v47 count] != 0;
    }
  }
  else
  {
    char v41 = 0;
  }
  self->_imageAnalysisEnabled = v41;
  int v48 = [v9 isPreviewAspectRatioToggleSupportedForMode:0];
  int64_t v49 = 0;
  if (v48) {
    int64_t v49 = [v10 integerForKey:@"CAMUserPreferencePreviewAspectModeForPhotoModes"];
  }
  self->__previewAspectModeForPhotoModes = v49;
  if ([v9 isPreviewAspectRatioToggleSupportedForMode:1]) {
    int64_t v50 = [v10 integerForKey:@"CAMUserPreferencePreviewViewAspectMode"];
  }
  else {
    int64_t v50 = 0;
  }
  self->__previewAspectModeForVideoModes = v50;
  self->__shouldDisableCameraSwitchingDuringVideoRecording = [v10 BOOLForKey:@"CAMUserPreferenceDisableCameraSwitchingDuringVideoRecording"];
  self->_didAcknowledgeCTMDescription = [v10 BOOLForKey:@"CAMUserPreferenceCTMDidAcknowledgeDescription"];
  self->_shouldUseVolumeUpBurst = [v10 BOOLForKey:@"CAMUserPreferenceVolumeUpBurst"];
  self->_overCapturePreviewEnabled = [v10 BOOLForKey:@"CAMUserPreferenceEnableViewOutsideTheFrame"];
  int v51 = [v9 isMirroredFrontCapturesSupported];
  if (v51) {
    LOBYTE(v51) = [v10 BOOLForKey:@"CAMUserPreferenceMirrorFrontCameraCaptures"];
  }
  self->_shouldMirrorFrontCameraCaptures = v51;
  int v52 = [v9 contentAwareDistortionCorrectionSupported];
  if (v52) {
    LOBYTE(v52) = [v10 BOOLForKey:@"CAMUserPreferenceContentAwareDistortionCorrection"];
  }
  self->_shouldUseContentAwareDistortionCorrection = v52;
  if ([(CAMUserPreferences *)self allowExplicitProResColorSpace])
  {
    int64_t v53 = [v10 integerForKey:@"CAMUserPreferenceExplicitProResColorSpace"];
    v54 = [v9 supportedProResColorSpaces];
    v55 = [NSNumber numberWithInteger:v53];
    char v56 = [v54 containsObject:v55];

    if ((v56 & 1) == 0)
    {
      v57 = [v54 firstObject];
      int64_t v53 = [v57 integerValue];
    }
  }
  else
  {
    int64_t v53 = 1;
  }
  self->_explicitProResColorSpace = v53;
  int v58 = [v9 isZoomPIPSupported];
  if (v58) {
    LOBYTE(v58) = [v10 BOOLForKey:@"CAMUserPreferenceEnableZoomPIP"];
  }
  char v359 = v58;
  self->_zoomPIPEnabled = v58;
  if ([v9 isHalfPressSupported])
  {
    uint64_t v59 = [v10 objectForKey:@"CAMUserPreferenceOpenHalfPressSpotlightControls"];
    char v60 = (void *)v59;
    v61 = (void *)MEMORY[0x263EFFA68];
    if (v59) {
      v61 = (void *)v59;
    }
    id v62 = v61;

    uint64_t v63 = [MEMORY[0x263EFFA08] setWithArray:v62];
    openHalfPressSpotlightControls = self->_openHalfPressSpotlightControls;
    self->_openHalfPressSpotlightControls = v63;
  }
  int v360 = [v9 isInternalInstall];
  if (v360) {
    self->_shouldDelayRemotePersistence = [v10 BOOLForKey:@"CAMUserPreferenceDebugTransientAssets"];
  }
  self->__lastViewedSettingsInterfaceDate = (NSDate *)(id)[v10 objectForKey:@"CAMUserPreferencesLastViewedSettingsInterfaceDate"];
  self->__lastWrittenSettingsDate = (NSDate *)(id)[v10 objectForKey:@"CAMUserPreferencesLastWrittenSettingsDate"];
  if ([v9 allowControlDrawer])
  {
    v65 = [v10 dictionaryForKey:@"CAMUserPreferencesPreferredDrawerControlByMode"];
    v66 = [(id)objc_opt_class() _preferredDrawerControlByModeForPersistenceDictionary:v65];
    preferredDrawerControlByMode = self->_preferredDrawerControlByMode;
    self->_preferredDrawerControlByMode = v66;

    self->_preservePreferredDrawerControl = [v10 BOOLForKey:@"CAMUserPreferencePreservePreferredDrawerControl"];
  }
  if ([v9 isFrontHDRSupported] & 1) != 0 || (objc_msgSend(v9, "isBackHDRSupported"))
  {
    int v68 = [v9 isModernHDRSupported];
    v69 = @"CAMUserPreferenceHDREV0";
    if (v68) {
      v69 = @"CAMUserPreferenceModernHDRKeepNormalPhoto";
    }
    v70 = v69;
    if ([v9 isSpatialOverCaptureSupported])
    {
      v71 = [v10 objectForKey:@"CAMUserPreferenceDidPerformSpatialOverCaptureEV0Disable13_0"];

      if (!v71)
      {
        if ([v10 BOOLForKey:v70])
        {
          [v10 setBool:0 forKey:v70];
          v72 = os_log_create("com.apple.camera", "Camera");
          if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2099F8000, v72, OS_LOG_TYPE_DEFAULT, "Performing one-time upgrade of Keep EV0 from On to Off for HDR Keep Orignal Photo!", buf, 2u);
          }
        }
        [v10 setObject:MEMORY[0x263EFFA88] forKey:@"CAMUserPreferenceDidPerformSpatialOverCaptureEV0Disable13_0"];
      }
    }
    if ([v9 isHDRSettingAllowed])
    {
      int v73 = [v9 isHDREV0CaptureSupported];
      if (v73) {
        LOBYTE(v73) = [v10 BOOLForKey:v70];
      }
      self->_shouldCaptureHDREV0 = v73;
      if (v68) {
        char v74 = [v10 BOOLForKey:@"CAMUserPreferenceModernHDRBehavior"];
      }
      else {
        char v74 = 0;
      }
      self->_shouldUseModernHDRBehavior = v74;
    }
    else
    {
      self->_shouldCaptureHDREV0 = 0;
      self->_shouldUseModernHDRBehavior = v68;
    }

    uint64_t v343 = 1;
  }
  else
  {
    uint64_t v343 = 0;
    self->_shouldCaptureHDREV0 = 0;
  }
  if ([v9 isSmartHDRSupported])
  {
    v75 = [v10 objectForKey:@"CAMUserPreferenceDidPerformUnifiedBracketingHDRUpgrade"];

    if (!v75)
    {
      unint64_t v76 = [v10 integerForKey:@"CAMUserPreferenceDesiredHDRMode"];
      if (v76 > 2) {
        v77 = &stru_26BD78BA0;
      }
      else {
        v77 = off_263FA1AE8[v76];
      }
      [v10 setInteger:1 forKey:@"CAMUserPreferenceDesiredHDRMode"];
      v78 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v77;
        _os_log_impl(&dword_2099F8000, v78, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
      }

      [v10 setObject:MEMORY[0x263EFFA88] forKey:@"CAMUserPreferenceDidPerformUnifiedBracketingHDRUpgrade"];
    }
  }
  unsigned int v341 = [v9 isLivePhotoSupported];
  if ([v9 isFrontPortraitModeSupported]) {
    char v79 = 1;
  }
  else {
    char v79 = [v9 isBackPortraitModeSupported];
  }
  self->_didAcknowledgePortraitModeDescription = v79 & [v10 BOOLForKey:@"CAMUserPreferencePortraitModeDidAcknowledgeDescription_12"];
  char v80 = [v9 isCinematicModeSupported];
  self->_didAcknowledgeCinematicModeDescription = v80 & [v10 BOOLForKey:@"CAMUserPreferenceCinematicModeDidAcknowledgeDescription"];
  uint64_t v402 = [v10 integerForKey:@"CAMUserPreferenceCaptureMode"];
  uint64_t v387 = [v10 integerForKey:@"CAMUserPreferenceCaptureDevice"];
  uint64_t v81 = [v10 integerForKey:@"CAMUserPreferenceDesiredFlashMode"];
  uint64_t v400 = [v10 integerForKey:@"CAMUserPreferenceTorchMode"];
  uint64_t v404 = [v10 integerForKey:@"CAMUserPreferenceDesiredHDRMode"];
  uint64_t v398 = [v10 integerForKey:@"CAMUserPreferenceDesiredIrisMode"];
  uint64_t v397 = [v10 integerForKey:@"CAMUserPreferenceFlashAndHDRConflictingControl"];
  uint64_t v375 = [v10 integerForKey:@"CAMUserPreferenceTimerDuration"];
  uint64_t v380 = [v10 integerForKey:@"CAMUserPreferenceAspectRatioCrop"];
  uint64_t v370 = [v10 integerForKey:@"CAMUserPreferenceDesiredPhotoModeEffectFilterType"];
  uint64_t v366 = [v10 integerForKey:@"CAMUserPreferenceSquareModeEffectFilterType"];
  uint64_t v364 = [v10 integerForKey:@"CAMUserPreferencePortraitModeEffectFilterType"];
  uint64_t v349 = [v10 integerForKey:@"CAMUserPreferencePhotoModeLastCapturedEffectFilterType"];
  uint64_t v347 = [v10 integerForKey:@"CAMUserPreferenceSquareModeLastCapturedEffectFilterType"];
  uint64_t v345 = [v10 integerForKey:@"CAMUserPreferencePortraitModeLastCapturedEffectFilterType"];
  uint64_t v362 = [v10 integerForKey:@"CAMUserPreferencePortraitModeLightingEffectType"];
  [v10 floatForKey:@"CAMUserPreferencePortraitModeApertureValue"];
  float v83 = v82;
  [v10 floatForKey:@"CAMUserPreferencePortraitEffectIntensityValue"];
  float v85 = v84;
  uint64_t v369 = [v10 integerForKey:@"CAMUserPreferenceDesiredNightMode"];
  uint64_t v374 = [v10 integerForKey:@"CAMUserPreferenceNightModeConflicts"];
  id v86 = [v406 exposureBiasesByMode];
  if ([v9 isExposureSliderSupported])
  {
    uint64_t v87 = +[CAMPreferencesUtilities numericDictionaryForKey:@"CAMUserPreferenceExposureBiasByMode" defaults:v10];
    v88 = (void *)v87;
    if (v87) {
      v89 = (void *)v87;
    }
    else {
      v89 = v86;
    }
    id v90 = v89;
    v91 = v86;
    id v86 = v90;
  }
  if ([v9 continuousZoomSupportedForPortraitMode])
  {
    v92 = [v10 objectForKey:@"CAMUserPreferenceDidPerformPortraitModeTripleCameraUpgrade"];

    if (!v92)
    {
      [v10 setInteger:0 forKey:@"CAMUserPreferencePortraitModeRearDevice"];
      LODWORD(v324) = 0;
      objc_msgSend(v9, "defaultZoomFactorForMode:device:videoConfiguration:captureOrientation:videoStabilizationStrength:videoEncodingBehavior:customLens:outputToExternalStorage:spatialVideoEnabled:isTrueVideo:prefersHDR10BitVideo:overrodeWithForcedZoomValue:", 6, 0, 0, 1, 0, 1, 0, v324, 0);
      *(float *)&double v93 = v93;
      [v10 setFloat:@"CAMUserPreferencePortraitModeRearZoomValue" forKey:v93];
      [v10 setObject:MEMORY[0x263EFFA88] forKey:@"CAMUserPreferenceDidPerformPortraitModeTripleCameraUpgrade"];
      v94 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2099F8000, v94, OS_LOG_TYPE_DEFAULT, "Performing one-time reset for portrait mode's device to the triple camera with default zoom!", buf, 2u);
      }
    }
  }
  v384 = v86;
  if ([v9 isPhotoModeDepthSuggestionSupportedForDevicePosition:0]) {
    char v95 = 1;
  }
  else {
    char v95 = [v9 isPhotoModeDepthSuggestionSupportedForDevicePosition:1];
  }
  self->_didAcknowledgeDepthInPhotoModeDescription = v95 & [v10 BOOLForKey:@"CAMUserPreferenceDidAcknowledgeDepthInPhotoModeDescription"];
  int64_t v96 = [v10 integerForKey:@"CAMUserPreferencePortraitModeRearDevice"];
  self->_portraitModeRearDevice = v96;
  p_portraitModeRearDevice = &self->_portraitModeRearDevice;
  if ((unint64_t)(v96 - 8) < 4 || (int64_t v105 = v96, v96 == 1))
  {
    v98 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR)) {
      -[CAMUserPreferences readPreferencesWithOverrides:emulationMode:callActive:shouldResetCaptureConfiguration:].cold.5((uint64_t)&self->_portraitModeRearDevice, v98, v99, v100, v101, v102, v103, v104);
    }

    int64_t v105 = 0;
    int64_t *p_portraitModeRearDevice = 0;
  }
  if (![v9 isSupportedMode:6 withDevice:v105]
    || [v9 continuousZoomSupportedForPortraitMode])
  {
    uint64_t v106 = [v9 resolvedDeviceForDesiredDevice:0 mode:6 videoConfiguration:0 videoStabilizationStrength:0 spatialVideoEnabled:0];
    if ((unint64_t)(v106 - 8) >= 4 && v106 != 1) {
      int64_t *p_portraitModeRearDevice = v106;
    }
  }
  [v10 floatForKey:@"CAMUserPreferencePortraitModeRearZoomValue"];
  self->_double portraitModeRearZoomValue = v107;
  v108 = [v9 significantZoomFactorsForMode:6 device:self->_portraitModeRearDevice];
  [v9 maximumZoomFactorForMode:6 device:self->_portraitModeRearDevice videoConfiguration:0 videoStabilizationStrength:0 shouldResolveDevice:1];
  double v110 = v109;
  char v111 = [v9 continuousZoomSupportedForPortraitMode];
  double portraitModeRearZoomValue = self->_portraitModeRearZoomValue;
  if (portraitModeRearZoomValue <= v110) {
    char v113 = v111;
  }
  else {
    char v113 = 0;
  }
  if (portraitModeRearZoomValue >= 2.0) {
    char v114 = v113;
  }
  else {
    char v114 = 0;
  }
  v115 = objc_msgSend(NSNumber, "numberWithDouble:");
  v352 = v108;
  char v116 = [v108 containsObject:v115];

  if ((v114 & 1) == 0 && (v116 & 1) == 0)
  {
    LODWORD(v324) = 0;
    objc_msgSend(v9, "defaultZoomFactorForMode:device:videoConfiguration:captureOrientation:videoStabilizationStrength:videoEncodingBehavior:customLens:outputToExternalStorage:spatialVideoEnabled:isTrueVideo:prefersHDR10BitVideo:overrodeWithForcedZoomValue:", 6, self->_portraitModeRearDevice, 0, 1, 0, 1, 0, v324, 0);
    self->_double portraitModeRearZoomValue = v117;
  }
  if ([v9 isSpatialVideoCaptureSupported])
  {
    buf[0] = 0;
    int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"CAMUserPreferenceEnableSpatialVideoCaptureControl", @"com.apple.camera", buf);
    if (!buf[0] || AppBooleanValue)
    {
      self->_spatialVideoControlEnabled = 1;
    }
    else
    {
      BOOL v119 = +[CAMPreferencesUtilities BOOLInCameraDomainForKey:@"CAMFeatureDevelopmentForceSpatialVideoControlEnabled"];
      self->_spatialVideoControlEnabled = v119;
      if (!v119)
      {
        char v120 = 0;
LABEL_169:
        self->_spatialVideoEnabled = v120;
        self->_BOOL preserveSpatialVideoEnabled = [v10 BOOLForKey:@"CAMUserPreferencePreserveSpatialVideoEnabled"];
        if (buf[0]) {
          uint64_t v121 = 1;
        }
        else {
          uint64_t v121 = [v10 BOOLForKey:@"CAMUserPreferenceDidAcknowledgeSpatialVideoOverlayDescription"];
        }
        [(CAMUserPreferences *)self setDidAcknowledgeSpatialVideoOverlayDescription:v121];
        goto LABEL_173;
      }
    }
    char v120 = [v10 BOOLForKey:@"CAMUserPreferenceSpatialVideoEnabled"];
    goto LABEL_169;
  }
LABEL_173:
  int v122 = [v9 isSpatialModeSupported];
  if (v122) {
    LOBYTE(v122) = [v10 BOOLForKey:@"CAMUserPreferenceDidAcknowledgeSpatialModeOverlayDescription"];
  }
  self->_didAcknowledgeSpatialModeOverlayDescription = v122;
  int v123 = [v9 semanticDevelopmentSupported];
  if (v123) {
    LOBYTE(v123) = [v10 BOOLForKey:@"CAMUserPreferenceEnableSemanticDevelopment"];
  }
  self->_semanticDevelopmentEnabled = v123;
  int v124 = [v9 isLinearDNGSupported];
  if (v124) {
    LOBYTE(v124) = [v10 BOOLForKey:@"CAMUserPreferenceEnableLinearDNGControl"];
  }
  self->_int rawControlEnabled = v124;
  if ([v9 photoModeDepthSuggestionSupported])
  {
    int v125 = [v10 BOOLForKey:@"CAMUserPreferenceEnableDepthSuggestion"];
    self->_shouldUseDepthSuggestionInPhotoMode = v125;
    if (v125) {
      char v389 = [v10 BOOLForKey:@"CAMUserPreferenceOptionalDepthEffectEnabled"];
    }
    else {
      char v389 = 0;
    }
  }
  else
  {
    char v389 = 0;
    self->_shouldUseDepthSuggestionInPhotoMode = 0;
  }
  if ([v9 isPhotoResolutionSupported:3 forPhotoEncoding:1])
  {
    if ([v9 isLinearDNGSupported]) {
      int rawControlEnabled = self->_rawControlEnabled;
    }
    else {
      int rawControlEnabled = [v10 BOOLForKey:@"CAMUserPreferenceEnablePhotoFormatControl"];
    }
  }
  else
  {
    int rawControlEnabled = 0;
  }
  self->_photoFormatControlEnabled = rawControlEnabled;
  uint64_t v392 = [v10 integerForKey:@"CAMUserPreferencesDesiredRAWMode"];
  if (self->_rawControlEnabled || rawControlEnabled) {
    uint64_t v127 = [v10 integerForKey:@"CAMUserPreferencesRAWConflicts"];
  }
  else {
    uint64_t v127 = 0;
  }
  uint64_t v390 = v127;
  if (rawControlEnabled) {
    obuint64_t j = (id)[v10 integerForKey:@"CAMUserPreferencesDesiredPhotoResolution"];
  }
  else {
    obuint64_t j = 0;
  }
  if ([v9 isProResVideoSupported])
  {
    int v128 = [v10 BOOLForKey:@"CAMUserPreferenceEnableProResControl"];
    self->_proResControlEnabled = v128;
    if (v128) {
      uint64_t v383 = [v10 integerForKey:@"CAMUserPreferenceDesiredProResVideoMode"];
    }
    else {
      uint64_t v383 = 0;
    }
  }
  else
  {
    uint64_t v383 = 0;
    self->_proResControlEnabled = 0;
  }
  if ([v9 isVideoStabilizationControlSupported])
  {
    unint64_t v129 = [v10 integerForKey:@"CAMUserPreferenceVideoStabilizationMode"];
    if (v129 >= 2) {
      unint64_t v130 = 0;
    }
    else {
      unint64_t v130 = v129;
    }
    unint64_t v396 = v130;
  }
  else
  {
    unint64_t v396 = 0;
  }
  Boolean keyExistsAndHasValidFormat = 0;
  int v131 = CFPreferencesGetAppBooleanValue(@"CameraSharingEnabled", @"com.apple.mobileslideshow", &keyExistsAndHasValidFormat);
  int v132 = keyExistsAndHasValidFormat;
  int v133 = [(id)objc_opt_class() isSharedLibrarySupportedAndEnabledForCapabilities:v9];
  if (v132) {
    BOOL v134 = v131 == 0;
  }
  else {
    BOOL v134 = 0;
  }
  if (v134) {
    BOOL v135 = 0;
  }
  else {
    BOOL v135 = v133;
  }
  self->_sharedLibraryEnabled = v135;
  if (!v135)
  {
    sharedLibraryLastLocation = self->_sharedLibraryLastLocation;
    self->_sharedLibraryLastLocation = 0;

    self->_sharedLibraryLastLocationAcquiredDuringTrip = 0;
    sharedLibraryLastDiscoveryLocation = self->_sharedLibraryLastDiscoveryLocation;
    self->_sharedLibraryLastDiscoveryLocation = 0;

    sharedLibraryLastDiscoveryDate = self->_sharedLibraryLastDiscoveryDate;
    self->_sharedLibraryLastDiscoveryDate = 0;

    sharedLibraryLastUserActionLocation = self->_sharedLibraryLastUserActionLocation;
    self->_sharedLibraryLastUserActionLocation = 0;

    sharedLibraryLastUserActionDate = self->_sharedLibraryLastUserActionDate;
    self->_sharedLibraryLastUserActionDate = 0;

    *(_WORD *)&self->_sharedLibraryAutoBehaviorEnabled = 0;
    self->_defaultToSharedLibraryEnabled = 0;
    goto LABEL_223;
  }
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __108__CAMUserPreferences_readPreferencesWithOverrides_emulationMode_callActive_shouldResetCaptureConfiguration___block_invoke;
  aBlock[3] = &unk_263FA18E0;
  id v136 = v10;
  id v432 = v136;
  v137 = (void (**)(void *, __CFString *))_Block_copy(aBlock);
  v138 = v137[2](v137, @"CAMUserPreferenceSharedLibraryLastLocation");
  [(CAMUserPreferences *)self setSharedLibraryLastLocation:v138];

  -[CAMUserPreferences setSharedLibraryLastLocationAcquiredDuringTrip:](self, "setSharedLibraryLastLocationAcquiredDuringTrip:", [v136 BOOLForKey:@"CAMUserPreferenceSharedLibraryLastLocationAcquiredDuringTrip"]);
  v139 = v137[2](v137, @"CAMUserPreferenceSharedLibraryLastDiscoveryLocation");
  [(CAMUserPreferences *)self setSharedLibraryLastDiscoveryLocation:v139];

  v140 = [v136 objectForKey:@"CAMUserPreferenceSharedLibraryLastDiscoveryDate"];
  [(CAMUserPreferences *)self setSharedLibraryLastDiscoveryDate:v140];

  v141 = v137[2](v137, @"CAMUserPreferenceSharedLibraryLastUserActionLocation");
  [(CAMUserPreferences *)self setSharedLibraryLastUserActionLocation:v141];

  v142 = [v136 objectForKey:@"CAMUserPreferenceSharedLibraryLastUserActionDate"];
  [(CAMUserPreferences *)self setSharedLibraryLastUserActionDate:v142];

  v143 = +[CAMCaptureCapabilities capabilities];
  if (![v143 peopleProximityDetectionSupported])
  {
    self->_sharedLibraryAutoBehaviorEnabled = 0;
    goto LABEL_221;
  }
  if ((PXPreferencesIsCameraAutoShareEnabled() & 1) == 0)
  {
    char v150 = [v143 librarySelectionMockAutomationModeEnabled];
    self->_sharedLibraryAutoBehaviorEnabled = v150;
    if (v150)
    {
      char v144 = 0;
      goto LABEL_222;
    }
LABEL_221:
    char v144 = [v136 BOOLForKey:@"CAMUserPreferencesDefaultToSharedLibrary"];
    goto LABEL_222;
  }
  char v144 = 0;
  self->_sharedLibraryAutoBehaviorEnabled = 1;
LABEL_222:
  self->_defaultToSharedLibraryEnabled = v144;
  self->_shareWhenAtHomeEnabled = CFPreferencesGetAppBooleanValue(@"CameraShareFromHomeEnabled", @"com.apple.mobileslideshow", 0) != 0;
  self->_sharedLibrarySwitchEnabled = self->_sharedLibraryEnabled;

LABEL_223:
  double v151 = v83;
  double v152 = v85;
  uint64_t v351 = [v10 integerForKey:@"CAMUserPreferenceSharedLibraryMode"];
  BOOL v336 = [(CAMUserPreferences *)self _shouldReconfigureCurrentConfigurationForSettingsChange];
  BOOL v153 = [(CAMUserPreferences *)self _shouldResetPreferencesForTimeout];
  BOOL v335 = v153;
  if (v391) {
    BOOL v154 = 0;
  }
  else {
    BOOL v154 = v153;
  }
  BOOL v333 = v154;
  if (v154)
  {
    BOOL preserveSpatialVideoEnabled = self->_preserveSpatialVideoEnabled;
    if (self->_preserveSpatialVideoEnabled) {
      BOOL preserveSpatialVideoEnabled = self->_spatialVideoEnabled;
    }
    else {
      self->_spatialVideoEnabled = 0;
    }
    int64_t v159 = [(CAMUserPreferences *)self defaultDeviceForModeChange:v402 devicePosition:v387 spatialVideoEnabled:preserveSpatialVideoEnabled];
    if (self->_preserveCaptureMode)
    {
      uint64_t v157 = v159;
    }
    else
    {
      uint64_t v402 = [v406 mode];
      uint64_t v157 = [v406 device];
      self->_spatialModeHasVideoSelected = 0;
    }
    if (v81 == 1)
    {
      uint64_t v81 = [v406 flashMode];
      uint64_t v160 = v397;
      if (v397 == 1) {
        uint64_t v160 = 0;
      }
      uint64_t v397 = v160;
    }
    uint64_t v161 = v400;
    BOOL v158 = v400 == 1;
    if (v400 == 1) {
      uint64_t v161 = [v406 torchMode];
    }
    uint64_t v162 = v404;
    uint64_t v400 = v161;
    if (v404 == 1)
    {
      uint64_t v162 = [v406 HDRMode];
      uint64_t v163 = v397;
      if (v397 == 2) {
        uint64_t v163 = 0;
      }
      uint64_t v397 = v163;
    }
    uint64_t v404 = v162;
    if (!self->_preserveLivePhoto)
    {
      uint64_t v398 = [v406 irisMode];
      v390 &= ~2uLL;
    }
    if (!self->_preserveNightMode) {
      uint64_t v369 = [v9 isLowLightSupported];
    }
    uint64_t v375 = [v406 timerDuration];
    if (!self->_preserveEffectFilter)
    {
      uint64_t v380 = [v406 photoModeAspectRatioCrop];
      uint64_t v370 = [v406 photoModeEffectFilterType];
      uint64_t v366 = [v406 squareModeEffectFilterType];
      uint64_t v364 = [v406 portraitModeEffectFilterType];
      uint64_t v362 = [v406 portraitModeLightingEffectType];
      [v406 portraitModeIntensityValue];
      double v152 = v164;
    }
    if (!self->_preserveExposure)
    {
      uint64_t v165 = [v406 exposureBiasesByMode];

      v384 = (void *)v165;
    }
    if (!self->_preserveSuperWideAutoMacro) {
      uint64_t v385 = [v406 macroMode];
    }
    if (!self->_preserveRAW) {
      uint64_t v392 = [v406 rawMode];
    }
    id v166 = obj;
    if (!self->_preservePhotoResolution) {
      id v166 = 0;
    }
    obuint64_t j = v166;
    if (self->_rawControlEnabled)
    {
      if (self->_preservePhotoResolution) {
        char v167 = 0;
      }
      else {
        char v167 = rawControlEnabled;
      }
      if (!self->_preserveRAW || (v167 & 1) != 0) {
LABEL_269:
      }
        uint64_t v390 = 0;
    }
    else
    {
      char v168 = rawControlEnabled ^ 1;
      if (self->_preservePhotoResolution) {
        char v168 = 1;
      }
      if ((v168 & 1) == 0) {
        goto LABEL_269;
      }
    }
    uint64_t v169 = v383;
    if (!self->_preserveProRes) {
      uint64_t v169 = 0;
    }
    uint64_t v383 = v169;
    unint64_t v170 = v396;
    if (!self->_preserveVideoStabilization) {
      unint64_t v170 = 0;
    }
    unint64_t v396 = v170;
    unint64_t v156 = v402;
    if (!self->_preserveAperture)
    {
      [v406 portraitModeApertureValue];
      double v151 = v171;
    }
    char v389 = 0;
    uint64_t v374 = 0;
    if (!v8) {
      goto LABEL_303;
    }
    goto LABEL_277;
  }
  unint64_t v156 = v402;
  uint64_t v157 = [(CAMUserPreferences *)self defaultDeviceForModeChange:v402 devicePosition:v387 spatialVideoEnabled:self->_spatialVideoEnabled];
  BOOL v158 = 0;
  if (!v8) {
    goto LABEL_303;
  }
LABEL_277:
  if (![v8 hasOverrides])
  {
LABEL_303:
    BOOL v338 = 0;
    goto LABEL_313;
  }
  unint64_t v172 = v156;
  v173 = [v8 captureMode];

  if (v173)
  {
    v174 = [v8 captureMode];
    unint64_t v172 = [v174 integerValue];
  }
  v175 = [v8 captureDevice];

  if (v175)
  {
    v176 = [v8 captureDevice];
    uint64_t v157 = [v176 integerValue];
  }
  v177 = [v8 videoConfiguration];

  if (v177)
  {
    v178 = [v8 videoConfiguration];
    self->_int64_t videoConfiguration = [v178 integerValue];
  }
  v179 = [v8 slomoConfiguration];

  if (v179)
  {
    v180 = [v8 slomoConfiguration];
    self->_slomoConfiguration = [v180 integerValue];
  }
  v181 = [v8 cinematicConfiguration];

  if (v181)
  {
    v182 = [v8 cinematicConfiguration];
    self->_cinematicConfiguration = [v182 integerValue];
  }
  v183 = [v8 wantsQRCodes];

  if (v183)
  {
    v184 = [v8 wantsQRCodes];
    int v185 = [v184 BOOLValue];

    if (v185)
    {
      self->_forceEnableQRBanners = 1;
      v186 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v186, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2099F8000, v186, OS_LOG_TYPE_DEFAULT, "Launched with a URL request or shortcut to force enable QR scanning", buf, 2u);
      }
    }
  }
  v187 = [v8 flashMode];

  if (v187)
  {
    v188 = [v8 flashMode];
    uint64_t v81 = [v188 integerValue];

    uint64_t v397 = 1;
  }
  v189 = [v8 torchMode];

  if (v189)
  {
    v190 = [v8 torchMode];
    uint64_t v400 = [v190 integerValue];
  }
  v191 = [v8 aspectRatioCrop];

  if (v191)
  {
    v192 = [v8 aspectRatioCrop];
    unint64_t v193 = [v192 integerValue];

    unint64_t v156 = v172;
    if (!v172)
    {
      BOOL v338 = 1;
      uint64_t v380 = v193;
      goto LABEL_313;
    }
    if (!v193)
    {
      BOOL v338 = 1;
      goto LABEL_313;
    }
    v194 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v194, OS_LOG_TYPE_DEFAULT))
    {
      if (v193 > 3) {
        v195 = 0;
      }
      else {
        v195 = off_263FA1B60[v193 - 1];
      }
      if (v172 > 9) {
        v196 = 0;
      }
      else {
        v196 = off_263FA1B78[v172 - 1];
      }
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v195;
      __int16 v435 = 2114;
      v436 = v196;
      _os_log_impl(&dword_2099F8000, v194, OS_LOG_TYPE_DEFAULT, "Trying to set aspect ratio crop %{public}@ on unsupported mode: %{public}@", buf, 0x16u);
    }
  }
  BOOL v338 = 1;
  unint64_t v156 = v172;
LABEL_313:
  if (([v9 isCameraSupportedForDevice:v157] & 1) == 0) {
    uint64_t v157 = [v406 device];
  }
  int v197 = [v9 isSupportedMode:v156 withDevice:v157];
  BOOL v198 = 0;
  if (v156 <= 8 && ((1 << v156) & 0x186) != 0) {
    BOOL v198 = v377;
  }
  if (v198 || v197 != 1) {
    unint64_t v156 = [v406 mode];
  }
  if ([v9 isFrontFlashSupported])
  {
    BOOL v199 = (unint64_t)(v81 - 1) < 2;
LABEL_324:
    uint64_t v201 = v81;
    goto LABEL_326;
  }
  int v200 = [v9 isBackFlashSupported];
  BOOL v199 = (unint64_t)(v81 - 1) < 2;
  if (v200) {
    goto LABEL_324;
  }
  uint64_t v201 = 0;
LABEL_326:
  if (v199) {
    uint64_t v202 = v201;
  }
  else {
    uint64_t v202 = v81;
  }
  uint64_t v382 = v202;
  if ([v9 isFrontTorchSupported])
  {
    uint64_t v203 = v400;
    BOOL v204 = (unint64_t)(v400 - 1) < 2;
LABEL_332:
    uint64_t v206 = v203;
    int v207 = v158;
    goto LABEL_334;
  }
  int v205 = [v9 isBackTorchSupported];
  uint64_t v203 = v400;
  BOOL v204 = (unint64_t)(v400 - 1) < 2;
  if (v205) {
    goto LABEL_332;
  }
  uint64_t v206 = 0;
  int v207 = 1;
LABEL_334:
  BOOL v208 = !v204;
  if (v204) {
    uint64_t v209 = v206;
  }
  else {
    uint64_t v209 = v203;
  }
  uint64_t v386 = v157;
  uint64_t v388 = v209;
  if (v208) {
    unsigned int v210 = v158;
  }
  else {
    unsigned int v210 = v207;
  }
  unsigned int v373 = v210;
  if ([v9 isFrontAutomaticHDRSupported]) {
    int v211 = 1;
  }
  else {
    int v211 = [v9 isBackAutomaticHDRSupported];
  }
  uint64_t v212 = v404;
  if (v404 == 2)
  {
    if (v211) {
      uint64_t v212 = 2;
    }
    else {
      uint64_t v212 = 0;
    }
  }
  else if (v404 == 1)
  {
    uint64_t v212 = v343;
  }
  uint64_t v213 = v398;
  if (v398 == 2)
  {
    if ([v9 isLivePhotoAutoModeSupported]) {
      uint64_t v213 = 2;
    }
    else {
      uint64_t v213 = [v406 irisMode];
    }
  }
  else if (v398 == 1)
  {
    uint64_t v213 = v341;
  }
  uint64_t v399 = v213;
  char v214 = [v9 isSpatialOverCaptureSupported];
  v215 = (uint64_t *)MEMORY[0x263F5DEC0];
  if (v214)
  {
    v216 = [v10 objectForKey:@"CAMUserPreferenceDidPerformSpatialOverCaptureHighEfficiencyUpgrade"];

    uint64_t v217 = *v215;
    if (!v216)
    {
      if ([v10 integerForKey:v217] == 1)
      {
        v218 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v218, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2099F8000, v218, OS_LOG_TYPE_DEFAULT, "Performing one-time upgrade of Most Compatible to High Efficiency!", buf, 2u);
        }

        [MEMORY[0x263F5DF10] setNewFormatsConfiguration:0 fromSource:3];
      }
      [v10 setObject:MEMORY[0x263EFFA88] forKey:@"CAMUserPreferenceDidPerformSpatialOverCaptureHighEfficiencyUpgrade"];
    }
  }
  else
  {
    uint64_t v217 = *MEMORY[0x263F5DEC0];
  }
  uint64_t v219 = [v10 integerForKey:v217];
  self->__preferHEVCWhenAvailable = v219 != 1;
  if (v219 == 1) {
    unsigned int v220 = 0;
  }
  else {
    unsigned int v220 = [v9 isHEVCEncodingSupported];
  }
  uint64_t v221 = [v10 integerForKey:@"CAMUserPreferenceSecondaryPhotoFormat"];
  int64_t v222 = v220;
  switch(v221)
  {
    case 0:
      goto LABEL_370;
    case 1:
      int64_t v223 = 2;
      break;
    case 2:
      goto LABEL_372;
    case 3:
      int64_t v222 = 2;
LABEL_370:
      int64_t v223 = 1;
      break;
    case 4:
      int64_t v222 = 2;
LABEL_372:
      int64_t v223 = 3;
      break;
    default:
      int64_t v223 = 0;
      int64_t v222 = 0;
      break;
  }
  self->_photoFormatControlSecondaryFormat.encoding = v222;
  self->_photoFormatControlSecondaryFormat.resolution = v223;
  if ([v9 isProRawJpegXLSupported]) {
    int64_t v224 = [v10 integerForKey:@"CAMUserPreferenceProRawFileFormat"];
  }
  else {
    int64_t v224 = 0;
  }
  self->_rawFileFormatBehavior = v224;
  self->_HDR10BitVideoEnabled = [(id)objc_opt_class() shouldEnableHDR10BitVideoForHEVCEnabled:self->__preferHEVCWhenAvailable capabilities:v9];
  v225 = +[CAMCaptureCapabilities capabilities];
  int v226 = [v225 isCTMSupported];

  uint64_t v227 = v380;
  if (!v226) {
    uint64_t v227 = 0;
  }
  uint64_t v344 = v227;
  int64_t v342 = [(CAMUserPreferences *)self _sanitizeEffectFilterType:v370 forMode:0];
  int64_t v340 = [(CAMUserPreferences *)self _sanitizeEffectFilterType:v366 forMode:4];
  int64_t v339 = [(CAMUserPreferences *)self _sanitizeEffectFilterType:v364 forMode:6];
  int64_t v365 = [(CAMUserPreferences *)self _sanitizeEffectFilterType:v349 forMode:0];
  int64_t v350 = [(CAMUserPreferences *)self _sanitizeEffectFilterType:v347 forMode:4];
  int64_t v348 = [(CAMUserPreferences *)self _sanitizeEffectFilterType:v345 forMode:6];
  int64_t v363 = [(CAMUserPreferences *)self _sanitizeLightingType:v362 forMode:6];
  if (([v9 isSupportedVideoConfiguration:self->_videoConfiguration forMode:1 device:1] & 1) == 0
    && ([v9 isSupportedVideoConfiguration:self->_videoConfiguration forMode:1 device:0] & 1) == 0)
  {
    self->_int64_t videoConfiguration = 0;
  }
  if (!self->_PALVideoEnabled
    && +[CAMCaptureCapabilities isPALVideoConfiguration:self->_videoConfiguration])
  {
    v228 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v228, OS_LOG_TYPE_DEFAULT))
    {
      int64_t videoConfiguration = self->_videoConfiguration;
      switch(videoConfiguration)
      {
        case 0:
          v230 = @"Auto";
          break;
        case 1:
          v230 = @"1080p60";
          break;
        case 2:
          v230 = @"720p120";
          break;
        case 3:
          v230 = @"720p240";
          break;
        case 4:
          v230 = @"1080p120";
          break;
        case 5:
          v230 = @"4k30";
          break;
        case 6:
          v230 = @"720p30";
          break;
        case 7:
          v230 = @"1080p30";
          break;
        case 8:
          v230 = @"1080p240";
          break;
        case 9:
          v230 = @"4k60";
          break;
        case 10:
          v230 = @"4k24";
          break;
        case 11:
          v230 = @"1080p25";
          break;
        case 12:
          v230 = @"4k25";
          break;
        case 13:
          v230 = @"4k120";
          break;
        case 14:
          v230 = @"4k100";
          break;
        default:
          switch(videoConfiguration)
          {
            case 10000:
              v230 = @"ImagePickerHigh";
              break;
            case 10001:
              v230 = @"ImagePickerMedium";
              break;
            case 10002:
              v230 = @"ImagePickerLow";
              break;
            case 10003:
              v230 = @"ImagePickerVGA";
              break;
            case 10004:
              v230 = @"ImagePickeriFrame720p";
              break;
            case 10005:
              v230 = @"ImagePickeriFrame540p";
              break;
            default:
              v230 = 0;
              break;
          }
          break;
      }
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v230;
      _os_log_impl(&dword_2099F8000, v228, OS_LOG_TYPE_DEFAULT, "Resetting PAL video configuration %{public}@ to Auto since PAL not enabled", buf, 0xCu);
    }

    self->_int64_t videoConfiguration = 0;
  }
  if (([v9 isSupportedVideoConfiguration:self->_slomoConfiguration forMode:2 device:1] & 1) == 0
    && ([v9 isSupportedVideoConfiguration:self->_slomoConfiguration forMode:2 device:0] & 1) == 0)
  {
    self->_slomoConfiguration = 0;
  }
  if (([v9 isSupportedVideoConfiguration:self->_cinematicConfiguration forMode:7 device:1] & 1) == 0
    && ([v9 isSupportedVideoConfiguration:self->_cinematicConfiguration forMode:7 device:0] & 1) == 0)
  {
    self->_cinematicConfiguration = 0;
  }
  unint64_t v403 = v156;
  id v376 = v8;
  switch(v156)
  {
    case 0uLL:
    case 1uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
    case 6uLL:
    case 9uLL:
      int64_t v231 = [(CAMUserPreferences *)self videoConfiguration];
      v426[0] = MEMORY[0x263EF8330];
      v426[1] = 3221225472;
      v426[2] = __108__CAMUserPreferences_readPreferencesWithOverrides_emulationMode_callActive_shouldResetCaptureConfiguration___block_invoke_525;
      v426[3] = &unk_263FA1908;
      id v232 = v9;
      unint64_t v429 = v156;
      uint64_t v233 = v386;
      uint64_t v430 = v386;
      id v427 = v232;
      v428 = self;
      v234 = _Block_copy(v426);
      uint64_t v381 = [v232 validatedVideoConfigurationForVideoConfiguration:v231 withBlock:v234];

      unint64_t v156 = v403;
      goto LABEL_424;
    case 2uLL:
      int64_t v235 = [(CAMUserPreferences *)self slomoConfiguration];
      goto LABEL_421;
    case 7uLL:
      int64_t v235 = [(CAMUserPreferences *)self cinematicConfiguration];
LABEL_421:
      uint64_t v381 = v235;
      goto LABEL_423;
    case 8uLL:
      uint64_t v381 = 7;
      goto LABEL_423;
    default:
      uint64_t v381 = 0;
LABEL_423:
      uint64_t v233 = v386;
LABEL_424:
      unint64_t v346 = [(CAMUserPreferences *)self audioConfigurationForMode:v156 device:v233 emulationMode:v391 duringCall:v377];
      if (v388 == 1) {
        char v236 = v357;
      }
      else {
        char v236 = 1;
      }
      if ((v236 & 1) == 0)
      {
        uint64_t v388 = [v406 torchMode];
        unsigned int v373 = 1;
      }
      if ([(CAMUserPreferences *)self shouldUseModernHDRBehavior])
      {
        if ([v9 isSmartHDRSupported]) {
          uint64_t v212 = 1;
        }
        else {
          uint64_t v212 = 2;
        }
      }
      uint64_t v425 = v382;
      uint64_t v405 = v212;
      uint64_t v424 = v212;
      uint64_t v423 = v399;
      uint64_t v422 = 0;
      if ([(CAMUserPreferences *)self rawControlEnabled])
      {
        uint64_t v237 = v392;
        uint64_t v238 = v390;
        +[CAMConflictingControlConfiguration resolveDesiredRAWMode:v392 photoFormatConflicts:v390 desiredLivePhotoMode:v399 desiredFlashMode:v382 toRAWMode:&v422 toLivePhotoMode:&v423 toFlashMode:&v425];
      }
      else
      {
        uint64_t v237 = 0;
        uint64_t v422 = 0;
        uint64_t v238 = v390;
      }
      uint64_t v393 = v237;
      if (v237 == 1) {
        uint64_t v239 = 2;
      }
      else {
        uint64_t v239 = 1;
      }
      if (v237 == 1) {
        id v240 = (id)v353;
      }
      else {
        id v240 = (id)v355;
      }
      if ([v9 isPhotoResolutionSupported:obj forMode:0 device:0 photoEncoding:v239])id v241 = obj; {
      else
      }
        id v241 = 0;
      if (v241) {
        id v240 = v241;
      }
      +[CAMConflictingControlConfiguration resolveDesiredFlashMode:v425 desiredHDRMode:v405 primaryConflictingControl:v397 device:v386 toFlashMode:&v425 HDRMode:&v424];
      id v421 = v240;
      id v358 = v240;
      [(CAMUserPreferences *)self resolveDesiredPhotoResolution:v240 livePhotoMode:v423 rawMode:v422 conflicts:v238 mode:v156 device:v386 resolvedPhotoResolution:&v421 resolvedLivePhotoMode:&v423];
      uint64_t v242 = [(CAMUserPreferences *)self resolvedPhotoFormatForResolvedResolution:v421 rawMode:v422];
      uint64_t v244 = v243;
      int64_t v245 = [(CAMUserPreferences *)self videoStabilizationStrengthForVideoStabilizationMode:v396 captureMode:v156 spatialVideoEnabled:[(CAMUserPreferences *)self spatialVideoEnabled]];
      BYTE1(v326) = [(CAMUserPreferences *)self spatialVideoEnabled];
      LOBYTE(v326) = v389;
      uint64_t v325 = v244;
      uint64_t v246 = v386;
      unint64_t v247 = v403;
      int64_t v248 = +[CAMConflictingControlConfiguration resolveDesiredMacroMode:v385 forMode:v403 device:v386 videoConfiguration:v381 videoStabilizationStrength:v245 photoFormat:v242 optionalDepthEffectEnabled:v325 spatialVideoEnabled:v326];
      if ([(CAMUserPreferences *)self shouldMirrorFrontCameraCaptures]) {
        char v354 = [v9 mirroredFrontCapturesSupportedForMode:v403];
      }
      else {
        char v354 = 0;
      }
      v249 = v376;
      unsigned int v250 = [v9 semanticStylesSupport];
      self->_didAcknowledgeSemanticStylesDescription = [v10 BOOLForKey:@"CAMUserPreferenceSemanticStylesDidAcknowledgeDescription"] & (v250 >> 3);
      if ((v250 & 8) != 0)
      {
        int v251 = [v9 smartStylesSupported];
        if (v251) {
          LOBYTE(v251) = [v10 BOOLForKey:@"CAMUserPreferenceSmartStylesDidAcknowledgeDescription"];
        }
      }
      else
      {
        LOBYTE(v251) = 0;
      }
      self->_didAcknowledgeSmartStylesDescription = v251;
      uint64_t v378 = [v406 selectedSemanticStyleIndex];
      v367 = [v406 semanticStyles];
      uint64_t v371 = [v406 smartStyleSystemStyleIndex];
      int64_t v356 = v248;
      if ((v250 & 8) == 0)
      {
        v269 = v376;
        v270 = v384;
        v271 = v367;
        goto LABEL_539;
      }
      id v252 = v10;
      v253 = +[CAMCaptureCapabilities capabilities];
      uint64_t v254 = [v253 hostProcess];

      if (v254)
      {
        uint64_t v255 = [objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.camera"];

        id v252 = (id)v255;
      }
      v256 = [(CAMUserPreferences *)self _semanticStylesKey];
      v337 = v252;
      v257 = [v252 arrayForKey:v256];

      v401 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v257, "count"));
      long long v417 = 0u;
      long long v418 = 0u;
      long long v419 = 0u;
      long long v420 = 0u;
      id obja = v257;
      uint64_t v258 = [obja countByEnumeratingWithState:&v417 objects:v440 count:16];
      if (!v258) {
        goto LABEL_481;
      }
      uint64_t v259 = v258;
      uint64_t v260 = *(void *)v418;
      break;
  }
  while (2)
  {
    for (uint64_t i = 0; i != v259; ++i)
    {
      if (*(void *)v418 != v260) {
        objc_enumerationMutation(obja);
      }
      uint64_t v262 = *(void *)(*((void *)&v417 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v268 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v268, OS_LOG_TYPE_ERROR)) {
          -[CAMUserPreferences readPreferencesWithOverrides:emulationMode:callActive:shouldResetCaptureConfiguration:].cold.4(v268);
        }
        v249 = v376;
        goto LABEL_480;
      }
      uint64_t v263 = [v9 semanticStylesVersion];
      if (v263 == 1)
      {
        v264 = (__objc2_class *)MEMORY[0x263F306F8];
        uint64_t v415 = 0;
        v265 = (id *)&v415;
        v266 = &v415;
        goto LABEL_467;
      }
      if (v263)
      {
        v267 = 0;
        v268 = 0;
LABEL_477:
        v272 = os_log_create("com.apple.camera", "Camera");
        v249 = v376;
        if (os_log_type_enabled(v272, OS_LOG_TYPE_ERROR)) {
          -[CAMUserPreferences readPreferencesWithOverrides:emulationMode:callActive:shouldResetCaptureConfiguration:]();
        }

LABEL_480:
        goto LABEL_481;
      }
      v264 = CAMSemanticStyle;
      uint64_t v416 = 0;
      v265 = (id *)&v416;
      v266 = &v416;
LABEL_467:
      v267 = [(__objc2_class *)v264 styleWithDictionary:v262 error:v266];
      v268 = *v265;
      if (v268 || !v267) {
        goto LABEL_477;
      }
      [v401 addObject:v267];
    }
    uint64_t v259 = [obja countByEnumeratingWithState:&v417 objects:v440 count:16];
    v249 = v376;
    if (v259) {
      continue;
    }
    break;
  }
LABEL_481:

  if ([v9 smartStylesSupported])
  {
    id v273 = (id)[v367 mutableCopy];

    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v275 = +[CAMSmartStyleUtilities readAVCaptureSystemStyleBypassXPC:1];
    double v276 = CFAbsoluteTimeGetCurrent() - Current;
    if (v276 > 0.002)
    {
      v277 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v277, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(double *)&uint8_t buf[4] = v276;
        _os_log_impl(&dword_2099F8000, v277, OS_LOG_TYPE_DEFAULT, "Reading AVSmartStyleSettingsGetSystemStyleFast took %.3f seconds", buf, 0xCu);
      }
    }
    v368 = (void *)v275;
    v278 = +[CAMCaptureConversions CEKSmartStyleForAVCaptureSmartStyle:v275];
    -[CAMUserPreferences _setLastReadSystemStyle:](self, "_setLastReadSystemStyle:");
    long long v413 = 0u;
    long long v414 = 0u;
    long long v411 = 0u;
    long long v412 = 0u;
    id v279 = v401;
    uint64_t v280 = [v279 countByEnumeratingWithState:&v411 objects:v439 count:16];
    if (v280)
    {
      uint64_t v281 = v280;
      uint64_t v282 = *(void *)v412;
      do
      {
        for (uint64_t j = 0; j != v281; ++j)
        {
          if (*(void *)v412 != v282) {
            objc_enumerationMutation(v279);
          }
          -[CAMUserPreferences _updateEntryForPresetType:inSmartStyles:withStyle:](self, "_updateEntryForPresetType:inSmartStyles:withStyle:", [*(id *)(*((void *)&v411 + 1) + 8 * j) presetType], v273, *(void *)(*((void *)&v411 + 1) + 8 * j));
        }
        uint64_t v281 = [v279 countByEnumeratingWithState:&v411 objects:v439 count:16];
      }
      while (v281);
    }

    if (v333)
    {
      BOOL v284 = [(CAMUserPreferences *)self preserveSmartStyle];
      v285 = v278;
      v286 = v278;
      if (!v284)
      {
        v287 = v286;
        char v288 = 1;
        v249 = v376;
        goto LABEL_530;
      }
    }
    else
    {
      v285 = v278;
      v291 = v278;
    }
    v292 = [v337 dictionaryForKey:@"CAMUserPreferenceSmartStylesSystemStyleOverride"];
    uint64_t v293 = [v337 dictionaryForKey:@"CAMUserPreferenceSmartStylesSystemStyleOverrideReference"];
    v294 = (void *)v293;
    v287 = v285;
    v249 = v376;
    if (v292)
    {
      v287 = v285;
      if (v293)
      {
        id v410 = 0;
        v334 = [MEMORY[0x263F306F8] styleWithDictionary:v292 error:&v410];
        id v295 = v410;
        id v409 = 0;
        v379 = [MEMORY[0x263F306F8] styleWithDictionary:v294 error:&v409];
        id v372 = v409;
        if (v295)
        {
          v296 = os_log_create("com.apple.camera", "Camera");
          if (os_log_type_enabled(v296, OS_LOG_TYPE_ERROR)) {
            -[CAMUserPreferences readPreferencesWithOverrides:emulationMode:callActive:shouldResetCaptureConfiguration:]();
          }
        }
        if (v372)
        {
          v297 = os_log_create("com.apple.camera", "Camera");
          if (os_log_type_enabled(v297, OS_LOG_TYPE_ERROR)) {
            -[CAMUserPreferences readPreferencesWithOverrides:emulationMode:callActive:shouldResetCaptureConfiguration:]();
          }
        }
        v330 = v294;
        v331 = v295;
        v329 = v292;
        if (v334 && v379 && [(__CFString *)v379 isEqualToSmartStyle:v285])
        {
          v298 = os_log_create("com.apple.camera", "SmartStyle");
          if (os_log_type_enabled(v298, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            *(void *)&uint8_t buf[4] = v334;
            __int16 v435 = 2114;
            v436 = (__CFString *)v285;
            _os_log_impl(&dword_2099F8000, v298, OS_LOG_TYPE_DEFAULT, "Using customized System Style %{public}@ instead of system style %{public}@", buf, 0x16u);
          }

          v299 = v334;
          v287 = v334;
          v300 = v285;
LABEL_527:
          v303 = v379;
        }
        else
        {
          v300 = os_log_create("com.apple.camera", "SmartStyle");
          if (!os_log_type_enabled(v300, OS_LOG_TYPE_DEFAULT))
          {
            v299 = v334;
            v287 = v285;
            goto LABEL_527;
          }
          *(_DWORD *)buf = 138543874;
          *(void *)&uint8_t buf[4] = v334;
          __int16 v435 = 2114;
          v303 = v379;
          v436 = v379;
          __int16 v437 = 2114;
          v438 = v285;
          _os_log_impl(&dword_2099F8000, v300, OS_LOG_TYPE_DEFAULT, "Discarding customized System Style %{public}@ since the reference style was %{public}@ but is now %{public}@", buf, 0x20u);
          v299 = v334;
          v287 = v285;
        }

        v292 = v329;
        v294 = v330;
      }
    }

    char v288 = 0;
LABEL_530:
    v332 = v285;
    v407[0] = MEMORY[0x263EF8330];
    v407[1] = 3221225472;
    v407[2] = __108__CAMUserPreferences_readPreferencesWithOverrides_emulationMode_callActive_shouldResetCaptureConfiguration___block_invoke_530;
    v407[3] = &unk_263FA1930;
    v304 = v287;
    v408 = v304;
    uint64_t v305 = [v273 indexOfObjectPassingTest:v407];
    if (v305 != 0x7FFFFFFFFFFFFFFFLL) {
      [v273 removeObjectAtIndex:v305];
    }
    unint64_t v306 = [(CAMUserPreferences *)self _updateEntryForPresetType:0 inSmartStyles:v273 withStyle:v304];
    v307 = [v337 stringForKey:@"CAMUserPreferenceSmartStylesSelectedPreset"];
    int64_t v308 = [(CAMUserPreferences *)self _findIndexOfSmartStylePresetString:v307 inStyles:v273];
    uint64_t v371 = v306;
    if ((v288 & 1) == 0)
    {
      unint64_t v306 = v308;
      if (v308 == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (v371 == 0x7FFFFFFFFFFFFFFFLL) {
          unint64_t v306 = 0;
        }
        else {
          unint64_t v306 = v371;
        }
      }
    }
    uint64_t v378 = v306;

    v270 = v384;
    unint64_t v247 = v403;
    uint64_t v246 = v386;
  }
  else
  {
    unint64_t v289 = [v337 integerForKey:@"CAMUserPreferenceSelectedSemanticStyleIndex"];
    unint64_t v290 = [v367 count];
    uint64_t v246 = v386;
    if ([v401 count] == v290)
    {
      if (v289 >= v290)
      {
        id v273 = v367;
      }
      else
      {
        id v273 = v401;

        uint64_t v378 = v289;
      }
    }
    else
    {
      BOOL v301 = v289 < v290 && obja == 0;
      uint64_t v302 = v378;
      if (v301) {
        uint64_t v302 = v289;
      }
      uint64_t v378 = v302;
      id v273 = v367;
    }
    v270 = v384;
    unint64_t v247 = v403;
  }
  v269 = v249;

  v271 = v273;
LABEL_539:
  v309 = [CAMCaptureConfiguration alloc];
  BOOL v310 = [(CAMUserPreferences *)self shouldMixAudioWithOthers];
  BYTE2(v328) = v389;
  BYTE1(v328) = self->_spatialVideoEnabled;
  LOBYTE(v328) = v359;
  LOBYTE(v327) = v354;
  v311 = -[CAMCaptureConfiguration initWithCaptureMode:captureDevice:videoConfiguration:audioConfiguration:mixAudioWithOthers:flashMode:torchMode:HDRMode:irisMode:timerDuration:photoModeAspectRatioCrop:photoModeEffectFilterType:squareModeEffectFilterType:portraitModeEffectFilterType:portraitModeLightingEffectType:portraitModeApertureValue:portraitModeIntensityValue:mirrorFrontCameraCaptures:exposureBiasesByMode:macroMode:photoResolution:rawMode:proResVideoMode:semanticStyles:selectedSemanticStyleIndex:smartStyleSystemStyleIndex:videoStabilizationMode:zoomPIPEnabled:spatialVideoEnabled:optionalDepthEffectEnabled:sharedLibraryMode:](v309, "initWithCaptureMode:captureDevice:videoConfiguration:audioConfiguration:mixAudioWithOthers:flashMode:torchMode:HDRMode:irisMode:timerDuration:photoModeAspectRatioCrop:photoModeEffectFilterType:squareModeEffectFilterType:portraitModeEffectFilterType:portraitModeLightingEffectType:portraitModeApertureValue:portraitModeIntensityValue:mirrorFrontCameraCaptures:exposureBiasesByMode:macroMode:photoResolution:rawMode:proResVideoMode:semanticStyles:selectedSemanticStyleIndex:smartStyleSystemStyleIndex:videoStabilizationMode:zoomPIPEnabled:spatialVideoEnabled:optionalDepthEffectEnabled:sharedLibraryMode:", v247, v246, v381, v346, v310, v425, v151, v152, v388, v424, v423, v375,
           v344,
           v342,
           v340,
           v339,
           v363,
           v327,
           v270,
           v356,
           v421,
           v422,
           v383,
           v271,
           v378,
           v371,
           v396,
           v328,
           v351);
  v312 = [[CAMConflictingControlConfiguration alloc] initWithDesiredFlashMode:v382 desiredHDRMode:v405 flashAndHDRConflictingControl:v397 desiredLivePhotoMode:v399 desiredRAWMode:v393 desiredPhotoResolution:v358 photoFormatConflicts:v390 desiredLowLightControlMode:v369 lowLightConflicts:v374 desiredMacroMode:v385];
  objc_storeStrong((id *)&self->_captureConfiguration, v311);
  objc_storeStrong((id *)&self->_conflictingControlConfiguration, v312);
  self->_photoModeLastCapturedEffectFilterType = v365;
  self->_squareModeLastCapturedEffectFilterType = v350;
  self->_portraitModeLastCapturedEffectFilterType = v348;
  if (v247 == 8)
  {
    BOOL v314 = 1;
    uint64_t v313 = v373;
LABEL_543:
    self->_spatialModeHasVideoSelected = v314;
  }
  else
  {
    uint64_t v313 = v373;
    if (v247 == 9)
    {
      BOOL v314 = 0;
      goto LABEL_543;
    }
  }
  [(CAMUserPreferences *)self _setDidResetTorchMode:v313];
  if (v360)
  {
    self->_int64_t overriddenBackCaptureInterval = [v10 integerForKey:@"CAMInternalPreferenceOverriddenBackBurstCaptureInterval"];
    uint64_t overriddenFrontCaptureInterval = [v10 integerForKey:@"CAMInternalPreferenceOverriddenFrontBurstCaptureInterval"];
    self->_uint64_t overriddenFrontCaptureInterval = overriddenFrontCaptureInterval;
    if (self->_overriddenBackCaptureInterval >= 1)
    {
      v316 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v316, OS_LOG_TYPE_DEFAULT))
      {
        int64_t overriddenBackCaptureInterval = self->_overriddenBackCaptureInterval;
        *(_DWORD *)buf = 134217984;
        *(void *)&uint8_t buf[4] = overriddenBackCaptureInterval;
        _os_log_impl(&dword_2099F8000, v316, OS_LOG_TYPE_DEFAULT, "Using overridden back capture interval: %ld", buf, 0xCu);
      }

      uint64_t overriddenFrontCaptureInterval = self->_overriddenFrontCaptureInterval;
      v270 = v384;
    }
    if (overriddenFrontCaptureInterval >= 1)
    {
      v318 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v318, OS_LOG_TYPE_DEFAULT))
      {
        int64_t v319 = self->_overriddenFrontCaptureInterval;
        *(_DWORD *)buf = 134217984;
        *(void *)&uint8_t buf[4] = v319;
        _os_log_impl(&dword_2099F8000, v318, OS_LOG_TYPE_DEFAULT, "Using overridden front capture interval: %ld", buf, 0xCu);
      }

      v270 = v384;
    }
    self->_burstFollowsEncoderSettings = [v10 BOOLForKey:@"CAMUserPreferenceDebugBurstRespectsEncodingSettings"];
    [v10 doubleForKey:@"CAMDebugResetTimeoutSeconds"];
    self->__resetTimeoutOverride = v320;
    self->_preferredMinimumFreeBytes = [v10 integerForKey:@"CAMInternalPreferenceOverridenPreferredStorageThreshold"];
  }
  unint64_t v321 = [v9 hostProcess];
  if (v321 <= 4 && ((1 << v321) & 0x15) != 0) {
    [(CAMUserPreferences *)self _publishAnalyticsIfNeeded];
  }
  [(CAMUserPreferences *)self _setHasReadLastWrittenValues:1];
  if (a6)
  {
    BOOL v322 = v336 || v335;
    if (v391) {
      BOOL v322 = 0;
    }
    *a6 = v322;
  }

  return v338;
}

id __108__CAMUserPreferences_readPreferencesWithOverrides_emulationMode_callActive_shouldResetCaptureConfiguration___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [*(id *)(a1 + 32) objectForKey:a2];
  if (!v2)
  {
    id v3 = 0;
    goto LABEL_5;
  }
  id v3 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v2 error:0];
  int64_t v4 = [v3 timestamp];
  [v4 timeIntervalSinceNow];
  double v6 = fabs(v5);

  uint64_t v7 = 0;
  if (v6 <= 86400.0)
  {
LABEL_5:
    id v3 = v3;
    uint64_t v7 = v3;
  }

  return v7;
}

uint64_t __108__CAMUserPreferences_readPreferencesWithOverrides_emulationMode_callActive_shouldResetCaptureConfiguration___block_invoke_525(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) isSupportedVideoConfiguration:a2 forMode:*(void *)(a1 + 48) device:*(void *)(a1 + 56) spatialVideoEnabled:*(unsigned __int8 *)(*(void *)(a1 + 40) + 33) trueVideoEnabled:0];
}

BOOL __108__CAMUserPreferences_readPreferencesWithOverrides_emulationMode_callActive_shouldResetCaptureConfiguration___block_invoke_530(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 presetType];
  return v3 == [*(id *)(a1 + 32) presetType];
}

- (unint64_t)_updateEntryForPresetType:(int64_t)a3 inSmartStyles:(id)a4 withStyle:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __72__CAMUserPreferences__updateEntryForPresetType_inSmartStyles_withStyle___block_invoke;
  v11[3] = &__block_descriptor_40_e30_B32__0__CEKSmartStyle_8Q16_B24l;
  v11[4] = a3;
  unint64_t v9 = [v7 indexOfObjectPassingTest:v11];
  if (v9 != 0x7FFFFFFFFFFFFFFFLL) {
    [v7 setObject:v8 atIndexedSubscript:v9];
  }

  return v9;
}

BOOL __72__CAMUserPreferences__updateEntryForPresetType_inSmartStyles_withStyle___block_invoke(uint64_t a1, void *a2)
{
  return [a2 presetType] == *(void *)(a1 + 32);
}

- (id)_semanticStylesKey
{
  uint64_t v2 = +[CAMCaptureCapabilities capabilities];
  uint64_t v3 = [v2 semanticStylesVersion];

  int64_t v4 = @"CAMUserPreferenceSmartStylesCustomizedStyles";
  if (v3 != 1) {
    int64_t v4 = 0;
  }
  if (v3) {
    return v4;
  }
  else {
    return @"CAMUserPreferenceSemanticStyles";
  }
}

uint64_t __38__CAMUserPreferences_writePreferences__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  double v10 = v5;
  if (!*(unsigned char *)(a1 + 48)
    || (v6 = [*(id *)(a1 + 32) smartStyleSystemStyleIndex], id v5 = v10, v6 != a3)
    && (v6 = [v10 isCustomized], id v5 = v10, v6))
  {
    id v7 = *(void **)(a1 + 40);
    id v8 = [v5 dictionaryRepresentation];
    [v7 addObject:v8];

    id v5 = v10;
  }
  return MEMORY[0x270F9A758](v6, v5);
}

- (void)_writeSmartStylePresetStringForIndex:(int64_t)a3 inStyles:(id)a4 key:(id)a5
{
  id v10 = a4;
  id v7 = (__CFString *)a5;
  if ([v10 count] <= (unint64_t)a3)
  {
    unint64_t v9 = 0;
  }
  else
  {
    id v8 = [v10 objectAtIndexedSubscript:a3];
    unint64_t v9 = objc_msgSend(MEMORY[0x263F306F8], "persistenceStringForPresetType:", objc_msgSend(v8, "presetType"));
  }
  CFPreferencesSetAppValue(v7, v9, @"com.apple.camera");
}

- (int64_t)_findIndexOfSmartStylePresetString:(id)a3 inStyles:(id)a4
{
  id v5 = a4;
  char v10 = 0;
  uint64_t v6 = [MEMORY[0x263F306F8] presetTypeFromPersistenceString:a3 success:&v10];
  if (v10)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __66__CAMUserPreferences__findIndexOfSmartStylePresetString_inStyles___block_invoke;
    v9[3] = &__block_descriptor_40_e34_B32__0___CEKCaptureStyle__8Q16_B24l;
    v9[4] = v6;
    int64_t v7 = [v5 indexOfObjectPassingTest:v9];
  }
  else
  {
    int64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

BOOL __66__CAMUserPreferences__findIndexOfSmartStylePresetString_inStyles___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  return v2 == [a2 presetType];
}

- (void)_updateLastWrittenSettingsDate
{
  id v4 = [(CAMUserPreferences *)self _underlyingUserDefaults];
  uint64_t v3 = [MEMORY[0x263EFF910] now];
  [v4 setObject:v3 forKey:@"CAMUserPreferencesLastWrittenSettingsDate"];
  [(CAMUserPreferences *)self _setLastWrittenSettingsDate:v3];
}

+ (void)updateLastViewedSettingsDate
{
  id v2 = [MEMORY[0x263EFF910] now];
  CFPreferencesSetAppValue(@"CAMUserPreferencesLastViewedSettingsInterfaceDate", v2, @"com.apple.camera");
}

- (BOOL)_shouldReconfigureCurrentConfigurationForSettingsChange
{
  uint64_t v3 = [(CAMUserPreferences *)self _lastViewedSettingsInterfaceDate];
  id v4 = [(CAMUserPreferences *)self _lastWrittenSettingsDate];
  BOOL v5 = ![(CAMUserPreferences *)self _hasReadLastWrittenValues]
    && [v4 compare:v3] == -1;

  return v5;
}

- (NSDate)resetTimeoutDate
{
  uint64_t v3 = [(CAMUserPreferences *)self _lastWrittenSettingsDate];
  [(CAMUserPreferences *)self _resetTimeoutSeconds];
  if (v3) {
    objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeInterval:sinceDate:", v3);
  }
  else {
  id v4 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:0.0];
  }

  return (NSDate *)v4;
}

- (BOOL)_shouldResetPreferencesForTimeout
{
  uint64_t v3 = [(CAMUserPreferences *)self resetTimeoutDate];
  id v4 = [(CAMUserPreferences *)self _underlyingUserDefaults];
  char v5 = [v4 BOOLForKey:@"CAMUserPreferencePreserveAllSettings"];

  if ((v5 & 1) != 0 || [(CAMUserPreferences *)self _hasReadLastWrittenValues])
  {
    BOOL v6 = 0;
  }
  else
  {
    int64_t v7 = [MEMORY[0x263EFF910] now];
    BOOL v6 = [v3 compare:v7] == -1;
  }
  return v6;
}

- (double)_resetTimeoutSeconds
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  [(CAMUserPreferences *)self _resetTimeoutOverride];
  double v3 = v2;
  double result = 30.0;
  if (v3 > 0.0)
  {
    char v5 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 134217984;
      double v7 = v3;
      _os_log_impl(&dword_2099F8000, v5, OS_LOG_TYPE_DEFAULT, "DEBUG: overriding reset timeout as %f seconds", (uint8_t *)&v6, 0xCu);
    }

    return v3;
  }
  return result;
}

- (int64_t)videoEncodingBehaviorForConfiguration:(int64_t)a3 mode:(int64_t)a4 desiredProResVideoMode:(int64_t)a5 outputToExternalStorage:(BOOL)a6 spatialVideoEnabled:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  double v13 = +[CAMCaptureCapabilities capabilities];
  char v14 = v13;
  if (a5 == 1) {
    char v15 = [v13 isProResVideoSupportedForMode:a4 videoConfiguration:a3 outputToExternalStorage:v8];
  }
  else {
    char v15 = 0;
  }
  if (v7) {
    int64_t v16 = 1;
  }
  else {
    int64_t v16 = 2;
  }
  if (!v7 && (v15 & 1) == 0)
  {
    if ([v14 isHEVCEncodingSupported])
    {
      if ((unint64_t)(a4 - 7) < 3) {
        unsigned int v17 = 1;
      }
      else {
        unsigned int v17 = ((unint64_t)a3 < 0xF) & (0x6300u >> a3);
      }
      if ([(CAMUserPreferences *)self HDR10BitVideoEnabled]
        && [v14 isHDR10BitVideoSupportedForMode:a4])
      {
        if ((v17 | [v14 isHDR10BitVideoSupportedForVideoConfiguration:a3 videoEncodingBehavior:1]))goto LABEL_19; {
      }
        }
      else if (v17)
      {
LABEL_19:
        int64_t v16 = 1;
        goto LABEL_21;
      }
      if ([(CAMUserPreferences *)self _preferHEVCWhenAvailable]) {
        goto LABEL_19;
      }
    }
    int64_t v16 = 0;
  }
LABEL_21:

  return v16;
}

- (int64_t)photoEncodingBehaviorForMode:(int64_t)a3 resolvedRAWMode:(int64_t)a4 isCapturingVideo:(BOOL)a5
{
  if (a5)
  {
    int64_t result = 0;
  }
  else if (a4 == 1)
  {
    int64_t result = 2;
  }
  else
  {
    int64_t result = [(CAMUserPreferences *)self photoEncodingBehavior];
  }
  if (a3 == 9) {
    return 1;
  }
  return result;
}

+ (BOOL)shouldEnableHDR10BitVideoForHEVCEnabled:(BOOL)a3 capabilities:(id)a4
{
  int v5 = [a4 isHDR10BitVideoSupported];
  if (v5)
  {
    Boolean keyExistsAndHasValidFormat = 0;
    int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"CAMUserPreferenceHDR10BitVideoEnabled", @"com.apple.camera", &keyExistsAndHasValidFormat);
    int v7 = AppBooleanValue;
    if (a3)
    {
      if (keyExistsAndHasValidFormat) {
        BOOL v8 = AppBooleanValue == 0;
      }
      else {
        BOOL v8 = 0;
      }
    }
    else if (CFPreferencesGetAppBooleanValue(@"CAMUserPreferencesDidConfirmHDR10BitVideoMostCompatiblePreference", @"com.apple.camera", 0))
    {
      BOOL v8 = v7 == 0;
    }
    else
    {
      BOOL v8 = 1;
    }
    LOBYTE(v5) = !v8;
  }
  return v5;
}

- (BOOL)prefersHDR10BitVideoForCapabilities:(id)a3
{
  id v4 = a3;
  LOBYTE(self) = objc_msgSend((id)objc_opt_class(), "shouldEnableHDR10BitVideoForHEVCEnabled:capabilities:", -[CAMUserPreferences _preferHEVCWhenAvailable](self, "_preferHEVCWhenAvailable"), v4);

  return (char)self;
}

- (BOOL)shouldDisableCameraSwitchingDuringVideoRecordingForMode:(int64_t)a3
{
  if ((unint64_t)a3 > 9) {
    return 0;
  }
  if (((1 << a3) & 0x86) != 0) {
    return [(CAMUserPreferences *)self _shouldDisableCameraSwitchingDuringVideoRecording];
  }
  return ((1 << a3) & 0x300) != 0;
}

- (void)setDidAcknowledgePortraitModeDescription:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = +[CAMCaptureCapabilities capabilities];
  if ((([v6 isFrontPortraitModeSupported] & 1) != 0
     || [v6 isBackPortraitModeSupported])
    && self->_didAcknowledgePortraitModeDescription != v3)
  {
    self->_didAcknowledgePortraitModeDescription = v3;
    int v5 = [(CAMUserPreferences *)self _underlyingUserDefaults];
    [v5 setBool:v3 forKey:@"CAMUserPreferencePortraitModeDidAcknowledgeDescription_12"];
  }
}

- (void)setDidAcknowledgeCinematicModeDescription:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = +[CAMCaptureCapabilities capabilities];
  int v6 = [v5 isCinematicModeSupported];

  if (v6 && self->_didAcknowledgeCinematicModeDescription != v3)
  {
    self->_didAcknowledgeCinematicModeDescription = v3;
    id v7 = [(CAMUserPreferences *)self _underlyingUserDefaults];
    [v7 setBool:v3 forKey:@"CAMUserPreferenceCinematicModeDidAcknowledgeDescription"];
  }
}

- (void)setDidAcknowledgeSemanticStylesDescription:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = +[CAMCaptureCapabilities capabilities];
  char v6 = [v5 semanticStylesSupport];

  if ((v6 & 8) != 0 && self->_didAcknowledgeSemanticStylesDescription != v3)
  {
    self->_didAcknowledgeSemanticStylesDescription = v3;
    id v7 = [(CAMUserPreferences *)self _underlyingUserDefaults];
    [v7 setBool:v3 forKey:@"CAMUserPreferenceSemanticStylesDidAcknowledgeDescription"];
  }
}

- (void)setDidAcknowledgeSmartStylesDescription:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = +[CAMCaptureCapabilities capabilities];
  if (([v6 semanticStylesSupport] & 8) != 0
    && [v6 smartStylesSupported]
    && self->_didAcknowledgeSmartStylesDescription != v3)
  {
    self->_didAcknowledgeSmartStylesDescription = v3;
    int v5 = [(CAMUserPreferences *)self _underlyingUserDefaults];
    [v5 setBool:v3 forKey:@"CAMUserPreferenceSmartStylesDidAcknowledgeDescription"];
  }
}

- (BOOL)mirrorCameraCapturesForDevicePosition:(int64_t)a3 mode:(int64_t)a4
{
  if (a3 != 1 || ![(CAMUserPreferences *)self shouldMirrorFrontCameraCaptures]) {
    return 0;
  }
  int v5 = +[CAMCaptureCapabilities capabilities];
  char v6 = [v5 mirroredFrontCapturesSupportedForMode:a4];

  return v6;
}

- (int64_t)maximumPhotoResolutionForMode:(int64_t)a3 device:(int64_t)a4
{
  id v7 = +[CAMCaptureCapabilities capabilities];
  if ((unint64_t)(a4 - 1) > 0xA) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = qword_209C79218[a4 - 1];
  }
  uint64_t v9 = [(CAMUserPreferences *)self preferredHEICPhotoResolutionForDevicePosition:v8];
  int64_t v10 = [(CAMUserPreferences *)self maximumRAWPhotoResolution];
  if ([(CAMUserPreferences *)self shouldUsePhotoFormatControlForMode:a3])
  {
    uint64_t v9 = [v7 maximumPhotoResolutionForMode:a3 device:a4 encoding:1];
    int64_t v10 = [v7 maximumPhotoResolutionForMode:a3 device:a4 encoding:2];
  }
  char v11 = [v7 isPhotoResolutionSupported:v10 forMode:a3 device:a4 photoEncoding:2];
  int v12 = [v7 isPhotoResolutionSupported:v9 forMode:a3 device:a4 photoEncoding:1];
  if ((unint64_t)(v10 - 1) > 2) {
    unint64_t v13 = 0;
  }
  else {
    unint64_t v13 = qword_209C79200[v10 - 1];
  }
  if ((unint64_t)(v9 - 1) > 2) {
    unint64_t v14 = 0;
  }
  else {
    unint64_t v14 = qword_209C79200[v9 - 1];
  }
  BOOL v15 = v13 > v14;
  char v16 = v11 ^ 1;
  if (!v15) {
    char v16 = 1;
  }
  if ((v16 & 1) != 0 || ![(CAMUserPreferences *)self rawControlEnabled])
  {
    if (v12) {
      int64_t v10 = v9;
    }
    else {
      int64_t v10 = 0;
    }
  }

  return v10;
}

- (int64_t)preferredHEICPhotoResolutionForDevicePosition:(int64_t)a3
{
  if (a3 == 1) {
    return [(CAMUserPreferences *)self _frontPreferredHEICPhotoResolution];
  }
  if (a3) {
    return 0;
  }
  return [(CAMUserPreferences *)self _backPreferredHEICPhotoResolution];
}

- (BOOL)usingMostCompatibleEncoding
{
  return [MEMORY[0x263F5DF10] newFormatsConfiguration] == 1;
}

- (BOOL)didConfirmVideoMostCompatible
{
  return CFPreferencesGetAppBooleanValue(@"CAMUserPreferencesDidConfirmVideoMostCompatible", @"com.apple.camera", 0) != 0;
}

- (BOOL)didConfirmSlomo1080p240MostCompatible
{
  return CFPreferencesGetAppBooleanValue(@"CAMUserPreferencesDidConfirmSlomo1080p240MostCompatible", @"com.apple.camera", 0) != 0;
}

- (int64_t)videoStabilizationStrengthForVideoStabilizationMode:(int64_t)a3 captureMode:(int64_t)a4 spatialVideoEnabled:(BOOL)a5
{
  BOOL v5 = a5;
  if (a3 == 1)
  {
    BOOL v8 = [(CAMUserPreferences *)self actionModeLowLightEnabled];
    int64_t v7 = 2;
    if (!v8) {
      int64_t v7 = 3;
    }
  }
  else if (a3)
  {
    int64_t v7 = 0;
  }
  else
  {
    int64_t v7 = [(CAMUserPreferences *)self enhancedVideoStabilization];
  }
  if (a4 == 8 || v5) {
    return 1;
  }
  else {
    return v7;
  }
}

- (BOOL)isAutoFPSVideoEnabledForMode:(int64_t)a3 device:(int64_t)a4 videoConfiguration:(int64_t)a5 encodingBehavior:(int64_t)a6 outputToExternalStorage:(BOOL)a7 spatialVideoEnabled:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  BOOL v15 = +[CAMCaptureCapabilities capabilities];
  char v16 = +[CAMCaptureCapabilities capabilities];
  int v27 = objc_msgSend(v15, "isAutoFPSVideoSupportedForMode:videoConfiguration:videoEncodingBehavior:outputToExternalStorage:spatialVideoEnabled:prefersHDR10BitVideo:", a3, a5, a6, v9, v8, -[CAMUserPreferences prefersHDR10BitVideoForCapabilities:](self, "prefersHDR10BitVideoForCapabilities:", v16));

  unsigned int v17 = +[CAMCaptureCapabilities capabilities];
  int v18 = +[CAMCaptureCapabilities capabilities];
  LOBYTE(v26) = [(CAMUserPreferences *)self prefersHDR10BitVideoForCapabilities:v18];
  uint64_t v19 = [v17 resolvedVideoConfigurationForMode:a3 device:a4 videoEncodingBehavior:a6 videoConfiguration:a5 outputToExternalStorage:v9 spatialVideoEnabled:v8 prefersHDR10BitVideo:v26];

  if ((unint64_t)(v19 - 5) >= 3)
  {
    BOOL v22 = (v19 == 9 || v19 == 1)
       && (+[CAMCaptureCapabilities capabilities],
           int64_t v23 = objc_claimAutoreleasedReturnValue(),
           int v24 = [v23 isVariableFramerateVideoSupported],
           v23,
           v24)
       && [(CAMUserPreferences *)self VFRMode] == 2;
  }
  else
  {
    int64_t v20 = +[CAMCaptureCapabilities capabilities];
    int v21 = [v20 isVariableFramerateVideoSupported];

    if (v21) {
      BOOL v22 = (unint64_t)([(CAMUserPreferences *)self VFRMode] - 1) < 2;
    }
    else {
      BOOL v22 = [(CAMUserPreferences *)self isLowLightVideoEnabled];
    }
  }
  return v27 && v22 && !v8;
}

+ (void)performLowLightVideoMigrationWithCapabilities:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (![v3 shouldPersistPreferences]) {
    goto LABEL_27;
  }
  unint64_t v4 = [v3 defaultVFRMode];
  Boolean keyExistsAndHasValidFormat = 0;
  CFPreferencesGetAppBooleanValue(@"CAMUserPreferenceDidPerformVFRUpgrade", @"com.apple.camera", &keyExistsAndHasValidFormat);
  if (!keyExistsAndHasValidFormat)
  {
    Boolean v14 = 0;
    int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"CAMUserPreferenceAutoLowLightVideoEnabled", @"com.apple.camera", &v14);
    if (v14)
    {
      if (!AppBooleanValue)
      {
        CFPreferencesSetAppValue(@"CAMUserPreferenceVFRMode", &unk_26BDDDB78, @"com.apple.camera");
        BOOL v8 = @"Performing one-time upgrade of auto low light from Off to VFRModeOff for variable frame rate video";
LABEL_15:
        BOOL v9 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          unsigned int v17 = v8;
          _os_log_impl(&dword_2099F8000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
        }

        CFPreferencesSetAppValue(@"CAMUserPreferenceDidPerformVFRUpgrade", MEMORY[0x263EFFA88], @"com.apple.camera");
        CFPreferencesAppSynchronize(@"com.apple.camera");

        goto LABEL_18;
      }
      if (v4 > 2) {
        char v6 = 0;
      }
      else {
        char v6 = off_263FA1BC0[v4];
      }
      [NSString stringWithFormat:@"Performing one-time upgrade of auto low light from On to %@ for variable frame rate video", v6];
    }
    else
    {
      if (v4 > 2) {
        int64_t v7 = 0;
      }
      else {
        int64_t v7 = off_263FA1BC0[v4];
      }
      [NSString stringWithFormat:@"Attempted one-time upgrade of auto low light. Key doesn't exist. Using %@ for variable frame rate video", v7];
    }
    BOOL v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    CFPreferencesSetAppValue(@"CAMUserPreferenceVFRMode", (CFPropertyListRef)[NSNumber numberWithInteger:v4], @"com.apple.camera");
    goto LABEL_15;
  }
LABEL_18:
  Boolean v14 = 0;
  CFPreferencesGetAppBooleanValue(@"CAMUserPreferenceDidPerformVFRUpgrade2", @"com.apple.camera", &v14);
  if (!v14 && v4 == 2)
  {
    Boolean v13 = 0;
    CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"CAMUserPreferenceVFRMode", @"com.apple.camera", &v13);
    if (!v13 || AppIntegerValue)
    {
      CFPreferencesSetAppValue(@"CAMUserPreferenceVFRMode", (CFPropertyListRef)[NSNumber numberWithInteger:2], @"com.apple.camera");
      char v11 = @"Performing one-time upgrade to VFRMode30And60";
    }
    else
    {
      char v11 = @"Not upgrading to VFRMode30And60 because user value was set to VFRModeOff";
    }
    int v12 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      unsigned int v17 = v11;
      _os_log_impl(&dword_2099F8000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
    }

    CFPreferencesSetAppValue(@"CAMUserPreferenceDidPerformVFRUpgrade2", MEMORY[0x263EFFA88], @"com.apple.camera");
    CFPreferencesAppSynchronize(@"com.apple.camera");
  }
LABEL_27:
}

+ (void)performResponsiveShutterMigrationWithCapabilities:(id)a3
{
  if ([a3 shouldPersistPreferences])
  {
    Boolean keyExistsAndHasValidFormat = 0;
    CFPreferencesGetAppBooleanValue(@"CAMUserPreferenceEnableResponsiveShutterMigrationFromCoreMedia", @"com.apple.camera", &keyExistsAndHasValidFormat);
    if (!keyExistsAndHasValidFormat)
    {
      Boolean v9 = 0;
      int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"responsiveShutter.adaptiveQuality.enabled", @"com.apple.coremedia", &v9);
      if (v9)
      {
        CFPreferencesSetAppValue(@"CAMUserPreferenceEnableResponsiveShutter", (CFPropertyListRef)[NSNumber numberWithBool:AppBooleanValue != 0], @"com.apple.camera");
        unint64_t v4 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v8 = 0;
          BOOL v5 = "Performing one-time migration of responsiveShutter.adaptiveQuality.enabled | com.apple.coremedia to CAMUs"
               "erPreferenceEnableResponsiveShutter";
          char v6 = (uint8_t *)&v8;
LABEL_8:
          _os_log_impl(&dword_2099F8000, v4, OS_LOG_TYPE_DEFAULT, v5, v6, 2u);
        }
      }
      else
      {
        unint64_t v4 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v7 = 0;
          BOOL v5 = "When attempting one-time migration of responsiveShutter.adaptiveQuality.enabled | com.apple.coremedia, no"
               " value found. Not updating CAMUserPreferenceEnableResponsiveShutter";
          char v6 = (uint8_t *)&v7;
          goto LABEL_8;
        }
      }

      CFPreferencesSetAppValue(@"CAMUserPreferenceEnableResponsiveShutterMigrationFromCoreMedia", MEMORY[0x263EFFA88], @"com.apple.camera");
    }
  }
}

- (void)writeAvailableDevicesWithCompletion:(id)a3
{
  unint64_t v4 = (void (**)(id, void))a3;
  BOOL v5 = +[CAMCaptureCapabilities capabilities];
  int v6 = [v5 fallbackCameraSupported];

  if (v6)
  {
    if ([(CAMUserPreferences *)self writingAvailableDevices])
    {
      __int16 v7 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2099F8000, v7, OS_LOG_TYPE_DEFAULT, "writeAvailableDevices already writing", buf, 2u);
      }

      v4[2](v4, 0);
    }
    else
    {
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __58__CAMUserPreferences_writeAvailableDevicesWithCompletion___block_invoke;
      v8[3] = &unk_263FA19E8;
      v8[4] = self;
      Boolean v9 = v4;
      +[CAMFallbackConfiguration getAvailableFallbackDevicesWithCompletion:v8];
    }
  }
}

void __58__CAMUserPreferences_writeAvailableDevicesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_initWeak(&location, *(id *)(a1 + 32));
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __58__CAMUserPreferences_writeAvailableDevicesWithCompletion___block_invoke_2;
  v6[3] = &unk_263FA19C0;
  objc_copyWeak(&v9, &location);
  id v4 = *(id *)(a1 + 40);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v6);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __58__CAMUserPreferences_writeAvailableDevicesWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained setWritingAvailableDevices:0];
    id v4 = *(void **)(a1 + 32);
    id v5 = NSURL;
    int v6 = +[CAMFallbackConfiguration getPathOfFallbackDevicesFile];
    id v7 = [v5 fileURLWithPath:v6];
    id v11 = 0;
    [v4 writeToURL:v7 error:&v11];
    id v8 = v11;

    id v9 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v8;
      _os_log_impl(&dword_2099F8000, v9, OS_LOG_TYPE_DEFAULT, "writeAvailableDevicesWithCompletion failed with error %@", buf, 0xCu);
    }

    (*(void (**)(void, BOOL))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v8 == 0);
  }
  else
  {
    int64_t v10 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __58__CAMUserPreferences_writeAvailableDevicesWithCompletion___block_invoke_2_cold_1(v10);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

+ (void)performSuperWideAutoMacroMigrationWithCapabilities:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ([v3 shouldPersistPreferences])
  {
    if ([v3 shouldPerformSuperWideAutoMacroMigration])
    {
      Boolean keyExistsAndHasValidFormat = 0;
      CFPreferencesGetAppBooleanValue(@"CAMUserPreferenceDidPerformSuperWideAutoMacroUpgrade", @"com.apple.camera", &keyExistsAndHasValidFormat);
      if (!keyExistsAndHasValidFormat)
      {
        Boolean v7 = 0;
        int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"CAMUserPreferenceEnableSuperWideAutoMacro", @"com.apple.camera", &v7);
        id v5 = @"Attemped one-time upgrade of Auto Macro, which isn't disabled. Leaving default behavior.";
        if (v7 && !AppBooleanValue)
        {
          CFPreferencesSetAppValue(@"CAMUserPreferenceAutoMacroMode", &unk_26BDDDB78, @"com.apple.camera");
          CFPreferencesSetAppValue(@"CAMUserPreferencePreserveSuperWideAutoMacro", MEMORY[0x263EFFA88], @"com.apple.camera");
          id v5 = @"Performing one-time upgrade of Auto Macro Off to CAMMacroModeOff with preserve Off.";
        }
        int v6 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          int64_t v10 = v5;
          _os_log_impl(&dword_2099F8000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
        }

        CFPreferencesSetAppValue(@"CAMUserPreferenceDidPerformSuperWideAutoMacroUpgrade", MEMORY[0x263EFFA88], @"com.apple.camera");
        CFPreferencesAppSynchronize(@"com.apple.camera");
      }
    }
  }
}

+ (void)performAudioConfigurationMigrationWithCapabilities:(id)a3
{
  Boolean keyExistsAndHasValidFormat = 0;
  CFPreferencesGetAppIntegerValue(@"CAMUserPreferenceAudioConfiguration", @"com.apple.camera", &keyExistsAndHasValidFormat);
  if (!keyExistsAndHasValidFormat)
  {
    if (CFPreferencesGetAppBooleanValue(@"CAMUserPreferenceForceMonoAudioRecording", @"com.apple.camera", 0))
    {
      CFPreferencesSetAppValue(@"CAMUserPreferenceAudioConfiguration", &unk_26BDDDBF0, @"com.apple.camera");
      CFPreferencesAppSynchronize(@"com.apple.camera");
    }
  }
}

+ (void)performHorizonLevelUpgradeWithCapabilities:(id)a3
{
  if ([a3 shouldPersistPreferences])
  {
    Boolean keyExistsAndHasValidFormat = 0;
    CFPreferencesGetAppBooleanValue(@"CAMUserPreferenceDidPerformHorizonLevelUpgrade", @"com.apple.camera", &keyExistsAndHasValidFormat);
    if (!keyExistsAndHasValidFormat)
    {
      if (CFPreferencesGetAppBooleanValue(@"CAMUserPreferenceShowGridOverlay", @"com.apple.camera", 0)) {
        CFPreferencesSetAppValue(@"CAMUserPreferenceShowHorizonLevelPlumb", MEMORY[0x263EFFA88], @"com.apple.camera");
      }
      CFPreferencesSetAppValue(@"CAMUserPreferenceDidPerformHorizonLevelUpgrade", MEMORY[0x263EFFA88], @"com.apple.camera");
      CFPreferencesAppSynchronize(@"com.apple.camera");
    }
  }
}

+ (void)performMostCompatibleConfirmationMigrationWithCapabilities:(id)a3
{
  id v8 = a3;
  if ([v8 shouldPersistPreferences])
  {
    int v3 = [v8 isHEVCEncodingSupported];
    uint64_t v4 = [MEMORY[0x263F5DF10] newFormatsConfiguration];
    if (v3)
    {
      if (v4 == 1)
      {
        int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"CAMUserPreferencesDidConfirmVideoMostCompatible", @"com.apple.camera", 0);
        int v6 = CFPreferencesGetAppBooleanValue(@"CAMUserPreferencesDidConfirmVideoMostCompatible", @"com.apple.camera", 0);
        if (AppBooleanValue && v6 == 0)
        {
          CFPreferencesSetAppValue(@"CAMUserPreferencesDidConfirmVideoMostCompatible", MEMORY[0x263EFFA88], @"com.apple.camera");
          CFPreferencesAppSynchronize(@"com.apple.camera");
        }
      }
    }
  }
}

+ (void)performApertureMigrationWithCapabilities:(id)a3
{
  id v3 = a3;
  if ([v3 isDepthEffectApertureSupported])
  {
    if ([v3 shouldPersistPreferences])
    {
      Boolean keyExistsAndHasValidFormat = 0;
      CFPreferencesGetAppBooleanValue(@"CAMUserPreferencePreserveApertureDidMigrate", @"com.apple.camera", &keyExistsAndHasValidFormat);
      if (!keyExistsAndHasValidFormat)
      {
        if (CFPreferencesGetAppBooleanValue(@"CAMUserPreferencePreserveEffectFilter", @"com.apple.camera", 0))
        {
          CFPreferencesSetAppValue(@"CAMUserPreferencePreserveAperture", MEMORY[0x263EFFA88], @"com.apple.camera");
        }
        CFPreferencesSetAppValue(@"CAMUserPreferencePreserveApertureDidMigrate", MEMORY[0x263EFFA88], @"com.apple.camera");
        CFPreferencesAppSynchronize(@"com.apple.camera");
      }
    }
  }
}

- (BOOL)shouldUsePhotoFormatControlForMode:(int64_t)a3
{
  if ([(CAMUserPreferences *)self photoFormatControlEnabled])
  {
    uint64_t v4 = +[CAMCaptureCapabilities capabilities];
    int v5 = [v4 isPhotoResolutionSupported:3 forMode:a3 device:0 photoEncoding:1];
    int v6 = v5 | [v4 isPhotoResolutionSupported:3 forMode:a3 device:1 photoEncoding:1];
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (BOOL)isPhotoFormat:(id)a3 enabledForMode:(int64_t)a4 device:(int64_t)a5
{
  int64_t var1 = a3.var1;
  unint64_t var0 = a3.var0;
  int64_t v10 = +[CAMCaptureCapabilities capabilities];
  uint64_t v11 = v10;
  if (var0 < 2)
  {
    if ((unint64_t)(a5 - 1) > 0xA) {
      uint64_t v12 = 0;
    }
    else {
      uint64_t v12 = qword_209C79218[a5 - 1];
    }
    int64_t v13 = [(CAMUserPreferences *)self preferredHEICPhotoResolutionForDevicePosition:v12];
    if (var0 == [(CAMUserPreferences *)self photoEncodingBehavior]
      && (var1 == 3
       || var1 == v13
       || [v11 featureDevelopmentAllowAllHEICOptionsInPhotoPicker]))
    {
      goto LABEL_13;
    }
LABEL_14:
    char v14 = 0;
    goto LABEL_15;
  }
  if (var0 != 2
    || ![v10 isLinearDNGSupportedForMode:a4]
    || ![(CAMUserPreferences *)self rawControlEnabled])
  {
    goto LABEL_14;
  }
LABEL_13:
  char v14 = objc_msgSend(v11, "isPhotoFormatSupported:forMode:device:", var0, var1, a4, a5);
LABEL_15:

  return v14;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)fallbackPhotoFormatForDesiredFormat:(id)a3 mode:(int64_t)a4 device:(int64_t)a5
{
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (-[CAMUserPreferences isPhotoFormat:enabledForMode:device:](self, "isPhotoFormat:enabledForMode:device:"))
  {
    int64_t v10 = var1;
    int64_t v11 = var0;
  }
  else
  {
    v20[0] = xmmword_209C79190;
    v20[1] = xmmword_209C791A0;
    v20[2] = xmmword_209C791B0;
    v20[3] = xmmword_209C791C0;
    v20[4] = vdupq_n_s64(1uLL);
    v20[5] = xmmword_209C791D0;
    v20[6] = xmmword_209C791E0;
    v20[7] = xmmword_209C791F0;
    int64_t v19 = [(CAMUserPreferences *)self photoEncodingBehavior];
    if ((unint64_t)(a5 - 1) > 0xA) {
      uint64_t v12 = 0;
    }
    else {
      uint64_t v12 = qword_209C79218[a5 - 1];
    }
    int64_t v13 = [(CAMUserPreferences *)self preferredHEICPhotoResolutionForDevicePosition:v12];
    uint64_t v14 = 0;
    BOOL v15 = 0;
    do
    {
      int64_t v11 = *(void *)&v20[v14];
      int64_t v10 = *((void *)&v20[v14] + 1);
      if (v15)
      {
        if (-[CAMUserPreferences isPhotoFormat:enabledForMode:device:](self, "isPhotoFormat:enabledForMode:device:", *(void *)&v20[v14], *((void *)&v20[v14] + 1), a4, a5))
        {
          goto LABEL_18;
        }
        BOOL v15 = 1;
      }
      else
      {
        BOOL v15 = var0 == v11 && var1 == v10;
      }
      ++v14;
    }
    while (v14 != 8);
    int64_t v10 = v13;
    int64_t v11 = v19;
  }
LABEL_18:
  int64_t v17 = v11;
  int64_t v18 = v10;
  result.int64_t var1 = v18;
  result.int64_t var0 = v17;
  return result;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)resolvedPhotoFormatForResolvedResolution:(int64_t)a3 rawMode:(int64_t)a4
{
  if ((unint64_t)a3 <= 1) {
    int64_t v5 = 1;
  }
  else {
    int64_t v5 = a3;
  }
  int64_t v6 = [(CAMUserPreferences *)self photoEncodingBehavior];
  if (a4 == 1) {
    int64_t v6 = 2;
  }
  int64_t v7 = v5;
  result.int64_t var1 = v7;
  result.int64_t var0 = v6;
  return result;
}

- (void)setDidAcknowledgeCTMDescription:(BOOL)a3
{
  if (self->_didAcknowledgeCTMDescription != a3)
  {
    BOOL v3 = a3;
    self->_didAcknowledgeCTMDescription = a3;
    id v4 = [(CAMUserPreferences *)self _underlyingUserDefaults];
    [v4 setBool:v3 forKey:@"CAMUserPreferenceCTMDidAcknowledgeDescription"];
  }
}

- (int64_t)previewViewAspectModeForMode:(int64_t)a3
{
  if ((unint64_t)a3 > 9) {
    return 0;
  }
  if (((1 << a3) & 0x1A6) != 0) {
    return [(CAMUserPreferences *)self _previewAspectModeForVideoModes];
  }
  if (((1 << a3) & 0x241) != 0) {
    return [(CAMUserPreferences *)self _previewAspectModeForPhotoModes];
  }
  else {
    return 0;
  }
}

- (void)setPreviewViewAspectMode:(int64_t)a3 forMode:(int64_t)a4
{
  if ((unint64_t)a4 <= 9)
  {
    if (((1 << a4) & 0x1A6) != 0)
    {
      [(CAMUserPreferences *)self _setPreviewAspectModeForVideoModes:a3];
    }
    else if (((1 << a4) & 0x241) != 0)
    {
      [(CAMUserPreferences *)self _setPreviewAspectModeForPhotoModes:a3];
    }
  }
}

+ (BOOL)isSharedLibrarySupportedAndEnabledForCapabilities:(id)a3
{
  int v3 = [a3 librarySelectionSupported];
  if (v3) {
    LOBYTE(v3) = CFPreferencesGetAppBooleanValue((CFStringRef)*MEMORY[0x263F150D8], @"com.apple.mobileslideshow", 0) != 0;
  }
  return v3;
}

+ (BOOL)hasSharedLibraryAlgorithmsPreferences
{
  Boolean keyExistsAndHasValidFormat = 0;
  CFPreferencesGetAppIntegerValue(@"CAMUserPreferenceSharedLibraryMode", @"com.apple.camera", &keyExistsAndHasValidFormat);
  return keyExistsAndHasValidFormat != 0;
}

+ (void)removeSharedLibraryAlgorithmsPreferences
{
  CFPreferencesSetAppValue(@"CAMUserPreferenceSharedLibraryMode", 0, @"com.apple.camera");
  CFPreferencesSetAppValue(@"CAMUserPreferenceSharedLibraryLastLocation", 0, @"com.apple.camera");
  CFPreferencesSetAppValue(@"CAMUserPreferenceSharedLibraryLastLocationAcquiredDuringTrip", 0, @"com.apple.camera");
  CFPreferencesSetAppValue(@"CAMUserPreferenceSharedLibraryLastDiscoveryDate", 0, @"com.apple.camera");
  CFPreferencesSetAppValue(@"CAMUserPreferenceSharedLibraryLastDiscoveryLocation", 0, @"com.apple.camera");
  CFPreferencesSetAppValue(@"CAMUserPreferenceSharedLibraryLastUserActionDate", 0, @"com.apple.camera");
  CFPreferencesSetAppValue(@"CAMUserPreferenceSharedLibraryLastUserActionLocation", 0, @"com.apple.camera");
  CFPreferencesAppSynchronize(@"com.apple.camera");
}

- (void)_resetSharedLibraryAlgorithmsPreferences
{
  [(CAMUserPreferences *)self setSharedLibraryLastLocation:0];
  [(CAMUserPreferences *)self setSharedLibraryLastLocationAcquiredDuringTrip:0];
  [(CAMUserPreferences *)self setSharedLibraryLastDiscoveryDate:0];
  [(CAMUserPreferences *)self setSharedLibraryLastDiscoveryLocation:0];
  [(CAMUserPreferences *)self setSharedLibraryLastUserActionDate:0];
  [(CAMUserPreferences *)self setSharedLibraryLastUserActionLocation:0];
  id v3 = [(CAMUserPreferences *)self captureConfiguration];
  [v3 setSharedLibraryMode:0];
}

- (BOOL)allowExplicitProResColorSpace
{
  double v2 = +[CAMCaptureCapabilities capabilities];
  char v3 = [v2 isProResLogColorSpaceSupported];

  return v3;
}

- (int64_t)colorSpaceForMode:(int64_t)a3 videoConfiguration:(int64_t)a4 videoEncodingBehavior:(int64_t)a5 spatialVideoEnabled:(BOOL)a6 device:(int64_t)a7
{
  BOOL v8 = a6;
  int64_t v13 = +[CAMCaptureCapabilities capabilities];
  int64_t v14 = 1;
  switch(a3)
  {
    case 1:
    case 7:
      BOOL v15 = [(CAMUserPreferences *)self HDR10BitVideoEnabled];
      int v16 = [v13 isHDR10BitVideoSupportedForMode:a3];
      int v17 = [v13 isHDR10BitVideoSupportedForVideoConfiguration:a4 videoEncodingBehavior:a5];
      if (a5 == 2 && [(CAMUserPreferences *)self allowExplicitProResColorSpace])
      {
        int64_t v18 = [(CAMUserPreferences *)self explicitProResColorSpace];
      }
      else if ((v15 & v16 & v17) != 0)
      {
        int64_t v18 = 2;
      }
      else
      {
        int64_t v18 = v15 | v16 ^ 1u;
      }
      if (v8) {
        int64_t v14 = 0;
      }
      else {
        int64_t v14 = v18;
      }
      break;
    case 2:
      if (!a4)
      {
        LOBYTE(v23) = [(CAMUserPreferences *)self prefersHDR10BitVideoForCapabilities:v13];
        a4 = [v13 resolvedVideoConfigurationForMode:2 device:a7 videoEncodingBehavior:a5 videoConfiguration:0 outputToExternalStorage:0 spatialVideoEnabled:v8 prefersHDR10BitVideo:v23];
      }
      BOOL v19 = [(CAMUserPreferences *)self HDR10BitVideoEnabled];
      int v20 = [v13 isHDR10BitVideoSupportedForMode:2];
      int v21 = [v13 isHDR10BitVideoSupportedForVideoConfiguration:a4 videoEncodingBehavior:a5];
      if ((v19 & v20 & v21 & [v13 isHDR10BitSlomoSupportedForDevice:a7]) != 0) {
        int64_t v14 = 2;
      }
      else {
        int64_t v14 = 1;
      }
      break;
    case 5:
    case 8:
      int64_t v14 = 0;
      break;
    default:
      break;
  }

  return v14;
}

- (void)setDidAcknowledgeDepthInPhotoModeDescription:(BOOL)a3
{
  if (self->_didAcknowledgeDepthInPhotoModeDescription != a3)
  {
    BOOL v3 = a3;
    self->_didAcknowledgeDepthInPhotoModeDescription = a3;
    id v4 = [(CAMUserPreferences *)self _underlyingUserDefaults];
    [v4 setBool:v3 forKey:@"CAMUserPreferenceDidAcknowledgeDepthInPhotoModeDescription"];
  }
}

- (unint64_t)audioConfigurationForMode:(int64_t)a3 device:(int64_t)a4 emulationMode:(int64_t)a5 duringCall:(BOOL)a6
{
  int v8 = 0;
  if ((unint64_t)a3 <= 9)
  {
    if (((1 << a3) & 0x186) != 0)
    {
      int v8 = 1;
    }
    else if (((1 << a3) & 0x211) != 0)
    {
      BOOL v9 = a6;
      if ((unint64_t)(a4 - 1) > 0xA) {
        uint64_t v11 = 0;
      }
      else {
        uint64_t v11 = qword_209C79218[a4 - 1];
      }
      uint64_t v12 = +[CAMCaptureCapabilities capabilities];
      int v13 = [v12 isLivePhotoSupportedForDevicePosition:v11];

      if (v13)
      {
        if (a5) {
          int v8 = 0;
        }
        else {
          int v8 = !v9;
        }
      }
      else
      {
        int v8 = 0;
      }
    }
  }
  int64_t v14 = +[CAMCaptureCapabilities capabilities];
  int v15 = [v14 disableAudio];

  int v16 = +[CAMCaptureCapabilities capabilities];
  int v17 = [v16 isStereoAudioRecordingSupportedForMode:a3];
  int v18 = [v16 isCinematicAudioSupportedForMode:a3];
  unint64_t v19 = [(CAMUserPreferences *)self preferredAudioConfiguration];
  unint64_t v20 = 0;
  if (v8 && !v15)
  {
    if (v19 == 3)
    {
      uint64_t v21 = 1;
      if (v17) {
        uint64_t v21 = 2;
      }
      if (v18) {
        unint64_t v20 = 3;
      }
      else {
        unint64_t v20 = v21;
      }
    }
    else if (v19 == 2)
    {
      if (v17) {
        unint64_t v20 = 2;
      }
      else {
        unint64_t v20 = 1;
      }
    }
    else
    {
      unint64_t v20 = v19 == 1;
    }
  }

  return v20;
}

- (BOOL)windRemovalEnabledForAudioConfiguration:(unint64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 2
      && [(CAMUserPreferences *)self shouldEnableWindRemoval];
}

+ (unint64_t)selectedAudioConfigurationForCapabilities:(id)a3
{
  id v3 = a3;
  Boolean keyExistsAndHasValidFormat = 0;
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"CAMUserPreferenceAudioConfiguration", @"com.apple.camera", &keyExistsAndHasValidFormat);
  unint64_t v5 = AppIntegerValue;
  if (AppIntegerValue != 1)
  {
    if (AppIntegerValue == 3)
    {
      LOBYTE(AppIntegerValue) = [v3 isCinematicAudioSupported];
    }
    else
    {
      if (AppIntegerValue != 2)
      {
LABEL_8:
        if ([v3 isCinematicAudioSupported])
        {
          unint64_t v5 = 3;
        }
        else if ([v3 isStereoAudioRecordingSupported])
        {
          unint64_t v5 = 2;
        }
        else
        {
          unint64_t v5 = 1;
        }
        goto LABEL_13;
      }
      LOBYTE(AppIntegerValue) = [v3 isStereoAudioRecordingSupported];
    }
  }
  if (!keyExistsAndHasValidFormat || (AppIntegerValue & 1) == 0) {
    goto LABEL_8;
  }
LABEL_13:

  return v5;
}

- (void)setDidAcknowledgeSpatialVideoOverlayDescription:(BOOL)a3
{
  if (self->_didAcknowledgeSpatialVideoOverlayDescription != a3)
  {
    BOOL v3 = a3;
    self->_didAcknowledgeSpatialVideoOverlayDescription = a3;
    id v4 = [(CAMUserPreferences *)self _underlyingUserDefaults];
    [v4 setBool:v3 forKey:@"CAMUserPreferenceDidAcknowledgeSpatialVideoOverlayDescription"];
  }
}

- (void)setSpatialVideoControlEnabled:(BOOL)a3
{
  if (self->_spatialVideoControlEnabled != a3)
  {
    BOOL v3 = a3;
    self->_spatialVideoControlEnabled = a3;
    id v4 = [(CAMUserPreferences *)self _underlyingUserDefaults];
    [v4 setBool:v3 forKey:@"CAMUserPreferenceEnableSpatialVideoCaptureControl"];
  }
}

- (void)setDidAcknowledgeSpatialModeOverlayDescription:(BOOL)a3
{
  if (self->_didAcknowledgeSpatialModeOverlayDescription != a3)
  {
    BOOL v3 = a3;
    self->_didAcknowledgeSpatialModeOverlayDescription = a3;
    id v4 = [(CAMUserPreferences *)self _underlyingUserDefaults];
    [v4 setBool:v3 forKey:@"CAMUserPreferenceDidAcknowledgeSpatialModeOverlayDescription"];
  }
}

+ (id)_convertDictionary:(id)a3 expectedKeyClass:(Class)a4 expectedValueClass:(Class)a5 keyConverter:(id)a6 valueConverter:(id)a7
{
  id v11 = a6;
  id v12 = a7;
  int v13 = (objc_class *)MEMORY[0x263EFF9A0];
  id v14 = a3;
  int v15 = objc_msgSend([v13 alloc], "initWithCapacity:", objc_msgSend(v14, "count"));
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __105__CAMUserPreferences__convertDictionary_expectedKeyClass_expectedValueClass_keyConverter_valueConverter___block_invoke;
  v22[3] = &unk_263FA1A10;
  Class v26 = a4;
  Class v27 = a5;
  id v24 = v11;
  id v25 = v12;
  id v16 = v15;
  id v23 = v16;
  id v17 = v12;
  id v18 = v11;
  [v14 enumerateKeysAndObjectsUsingBlock:v22];

  unint64_t v19 = v23;
  id v20 = v16;

  return v20;
}

void __105__CAMUserPreferences__convertDictionary_expectedKeyClass_expectedValueClass_keyConverter_valueConverter___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (objc_opt_isKindOfClass())
  {
    int64_t v7 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    int64_t v7 = 0;
  }
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    BOOL v9 = (void *)v8;
    if (v7 && v8)
    {
      [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v7];
      goto LABEL_19;
    }
    if (v7)
    {
      if (v8) {
        goto LABEL_19;
      }
      goto LABEL_9;
    }
  }
  else
  {
    if (v7)
    {
LABEL_9:
      int64_t v10 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        __105__CAMUserPreferences__convertDictionary_expectedKeyClass_expectedValueClass_keyConverter_valueConverter___block_invoke_cold_1();
      }

      BOOL v9 = 0;
      goto LABEL_19;
    }
    BOOL v9 = 0;
  }
  id v11 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    __105__CAMUserPreferences__convertDictionary_expectedKeyClass_expectedValueClass_keyConverter_valueConverter___block_invoke_cold_2();
  }

LABEL_19:
}

+ (id)_createMappingFromStringsToIntegers:(id)a3
{
  BOOL v3 = (void (**)(id, void))a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v5 = v3[2](v3, 0);
  if ([v5 length])
  {
    uint64_t v6 = 0;
    do
    {
      int64_t v7 = [NSNumber numberWithInteger:v6];
      [v4 setObject:v7 forKeyedSubscript:v5];

      id v5 = v3[2](v3, ++v6);
    }
    while ([v5 length]);
  }

  return v4;
}

+ (id)_persistenceDictionaryForPreferredDrawerControlByMode:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = [a1 _convertDictionary:v4 expectedKeyClass:v5 expectedValueClass:objc_opt_class() keyConverter:&__block_literal_global_571 valueConverter:&__block_literal_global_573];

  return v6;
}

__CFString *__76__CAMUserPreferences__persistenceDictionaryForPreferredDrawerControlByMode___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v2 = [a2 integerValue];
  if (v2 > 9) {
    return 0;
  }
  else {
    return off_263FA1BD8[v2];
  }
}

__CFString *__76__CAMUserPreferences__persistenceDictionaryForPreferredDrawerControlByMode___block_invoke_2(uint64_t a1, void *a2)
{
  unint64_t v2 = [a2 integerValue];
  if (v2 > 0xF) {
    return 0;
  }
  else {
    return off_263FA1C28[v2];
  }
}

+ (id)_preferredDrawerControlByModeForPersistenceDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  v9[4] = a1;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __76__CAMUserPreferences__preferredDrawerControlByModeForPersistenceDictionary___block_invoke;
  v10[3] = &__block_descriptor_40_e28___NSNumber_16__0__NSString_8l;
  v10[4] = a1;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __76__CAMUserPreferences__preferredDrawerControlByModeForPersistenceDictionary___block_invoke_2;
  v9[3] = &__block_descriptor_40_e28___NSNumber_16__0__NSString_8l;
  int64_t v7 = [a1 _convertDictionary:v4 expectedKeyClass:v5 expectedValueClass:v6 keyConverter:v10 valueConverter:v9];

  return v7;
}

uint64_t __76__CAMUserPreferences__preferredDrawerControlByModeForPersistenceDictionary___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _captureModeNumberForPersistenceString:a2];
}

uint64_t __76__CAMUserPreferences__preferredDrawerControlByModeForPersistenceDictionary___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _drawerControlTypeNumberForPersistenceString:a2];
}

+ (id)_captureModeNumberForPersistenceString:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__CAMUserPreferences__captureModeNumberForPersistenceString___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  uint64_t v3 = _captureModeNumberForPersistenceString__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&_captureModeNumberForPersistenceString__onceToken, block);
  }
  uint64_t v5 = [(id)_captureModeNumberForPersistenceString__stringToIntegerMap objectForKeyedSubscript:v4];

  return v5;
}

uint64_t __61__CAMUserPreferences__captureModeNumberForPersistenceString___block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) _createMappingFromStringsToIntegers:&__block_literal_global_578];
  uint64_t v2 = _captureModeNumberForPersistenceString__stringToIntegerMap;
  _captureModeNumberForPersistenceString__stringToIntegerMap = v1;
  return MEMORY[0x270F9A758](v1, v2);
}

__CFString *__61__CAMUserPreferences__captureModeNumberForPersistenceString___block_invoke_2(uint64_t a1, unint64_t a2)
{
  if (a2 > 9) {
    return 0;
  }
  else {
    return off_263FA1BD8[a2];
  }
}

+ (id)_drawerControlTypeNumberForPersistenceString:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__CAMUserPreferences__drawerControlTypeNumberForPersistenceString___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  uint64_t v3 = _drawerControlTypeNumberForPersistenceString__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&_drawerControlTypeNumberForPersistenceString__onceToken, block);
  }
  uint64_t v5 = [(id)_drawerControlTypeNumberForPersistenceString__stringToIntegerMap objectForKeyedSubscript:v4];

  return v5;
}

uint64_t __67__CAMUserPreferences__drawerControlTypeNumberForPersistenceString___block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) _createMappingFromStringsToIntegers:&__block_literal_global_580];
  uint64_t v2 = _drawerControlTypeNumberForPersistenceString__stringToIntegerMap;
  _drawerControlTypeNumberForPersistenceString__stringToIntegerMap = v1;
  return MEMORY[0x270F9A758](v1, v2);
}

__CFString *__67__CAMUserPreferences__drawerControlTypeNumberForPersistenceString___block_invoke_2(uint64_t a1, unint64_t a2)
{
  if (a2 > 0xF) {
    return 0;
  }
  else {
    return off_263FA1C28[a2];
  }
}

- (BOOL)didResetTorchMode
{
  return self->_didResetTorchMode;
}

- (void)setShouldShowGridView:(BOOL)a3
{
  self->_shouldShowGridView = a3;
}

- (BOOL)shouldShowHorizonLevelView
{
  return self->_shouldShowHorizonLevelView;
}

- (BOOL)shouldShowLevelView
{
  return self->_shouldShowLevelView;
}

- (BOOL)isImageAnalysisEnabled
{
  return self->_imageAnalysisEnabled;
}

- (BOOL)responsiveShutterEnabled
{
  return self->_responsiveShutterEnabled;
}

- (BOOL)shouldMirrorFrontCameraCaptures
{
  return self->_shouldMirrorFrontCameraCaptures;
}

- (void)setShouldMirrorFrontCameraCaptures:(BOOL)a3
{
  self->_shouldMirrorFrontCameraCaptures = a3;
}

- (BOOL)shouldUseVolumeUpBurst
{
  return self->_shouldUseVolumeUpBurst;
}

- (BOOL)shouldUseContentAwareDistortionCorrection
{
  return self->_shouldUseContentAwareDistortionCorrection;
}

- (BOOL)isSuperWideAutoMacroControlAllowed
{
  return self->_superWideAutoMacroControlAllowed;
}

- (int64_t)portraitModeRearDevice
{
  return self->_portraitModeRearDevice;
}

- (void)setPortraitModeRearDevice:(int64_t)a3
{
  self->_portraitModeRearDevice = a3;
}

- (double)portraitModeRearZoomValue
{
  return self->_portraitModeRearZoomValue;
}

- (void)setPortraitModeRearZoomValue:(double)a3
{
  self->_double portraitModeRearZoomValue = a3;
}

- (BOOL)shouldUseDepthSuggestionInPhotoMode
{
  return self->_shouldUseDepthSuggestionInPhotoMode;
}

- (void)setShouldUseDepthSuggestionInPhotoMode:(BOOL)a3
{
  self->_shouldUseDepthSuggestionInPhotoMode = a3;
}

- (int64_t)slomoConfiguration
{
  return self->_slomoConfiguration;
}

- (int64_t)cinematicConfiguration
{
  return self->_cinematicConfiguration;
}

- (BOOL)didAcknowledgeCinematicModeDescription
{
  return self->_didAcknowledgeCinematicModeDescription;
}

- (BOOL)isVideoConfigurationControlEnabled
{
  return self->_videoConfigurationControlEnabled;
}

- (BOOL)isPALVideoEnabled
{
  return self->_PALVideoEnabled;
}

- (int64_t)VFRMode
{
  return self->_VFRMode;
}

- (BOOL)isLowLightVideoEnabled
{
  return self->_lowLightVideoEnabled;
}

- (unint64_t)preferredAudioConfiguration
{
  return self->_preferredAudioConfiguration;
}

- (BOOL)shouldMixAudioWithOthers
{
  return self->_shouldMixAudioWithOthers;
}

- (BOOL)shouldEnableWindRemoval
{
  return self->_shouldEnableWindRemoval;
}

- (BOOL)HDR10BitVideoEnabled
{
  return self->_HDR10BitVideoEnabled;
}

- (BOOL)shouldLockWhiteBalanceDuringVideoRecording
{
  return self->_shouldLockWhiteBalanceDuringVideoRecording;
}

- (BOOL)spatialVideoControlEnabled
{
  return self->_spatialVideoControlEnabled;
}

- (BOOL)spatialVideoEnabled
{
  return self->_spatialVideoEnabled;
}

- (BOOL)didAcknowledgeSpatialVideoOverlayDescription
{
  return self->_didAcknowledgeSpatialVideoOverlayDescription;
}

- (BOOL)spatialModeHasVideoSelected
{
  return self->_spatialModeHasVideoSelected;
}

- (BOOL)didAcknowledgeSpatialModeOverlayDescription
{
  return self->_didAcknowledgeSpatialModeOverlayDescription;
}

- (BOOL)didAcknowledgeCTMDescription
{
  return self->_didAcknowledgeCTMDescription;
}

- (BOOL)isOverCapturePreviewEnabled
{
  return self->_overCapturePreviewEnabled;
}

- (void)setSquareModeLastCapturedEffectFilterType:(int64_t)a3
{
  self->_squareModeLastCapturedEffectFilterType = a3;
}

- (void)setPortraitModeLastCapturedEffectFilterType:(int64_t)a3
{
  self->_portraitModeLastCapturedEffectFilterType = a3;
}

- (BOOL)semanticDevelopmentEnabled
{
  return self->_semanticDevelopmentEnabled;
}

- (BOOL)didAcknowledgeSemanticStylesDescription
{
  return self->_didAcknowledgeSemanticStylesDescription;
}

- (BOOL)didAcknowledgeSmartStylesDescription
{
  return self->_didAcknowledgeSmartStylesDescription;
}

- (CEKSmartStyle)lastReadSystemStyle
{
  return self->_lastReadSystemStyle;
}

- (void)_setLastReadSystemStyle:(id)a3
{
}

- (BOOL)photoFormatControlEnabled
{
  return self->_photoFormatControlEnabled;
}

- (BOOL)rawControlEnabled
{
  return self->_rawControlEnabled;
}

- (BOOL)preserveRAW
{
  return self->_preserveRAW;
}

- (BOOL)isProResControlEnabled
{
  return self->_proResControlEnabled;
}

- (BOOL)preserveProRes
{
  return self->_preserveProRes;
}

- (int64_t)explicitProResColorSpace
{
  return self->_explicitProResColorSpace;
}

- (BOOL)preserveSmartStyle
{
  return self->_preserveSmartStyle;
}

- (BOOL)preserveCaptureMode
{
  return self->_preserveCaptureMode;
}

- (BOOL)preserveLivePhoto
{
  return self->_preserveLivePhoto;
}

- (BOOL)preserveExposure
{
  return self->_preserveExposure;
}

- (BOOL)preserveNightMode
{
  return self->_preserveNightMode;
}

- (BOOL)preservePortraitZoom
{
  return self->_preservePortraitZoom;
}

- (BOOL)preserveSuperWideAutoMacro
{
  return self->_preserveSuperWideAutoMacro;
}

- (BOOL)enhancedVideoStabilization
{
  return self->_enhancedVideoStabilization;
}

- (BOOL)actionModeLowLightEnabled
{
  return self->_actionModeLowLightEnabled;
}

- (BOOL)preserveVideoStabilization
{
  return self->_preserveVideoStabilization;
}

- (BOOL)preservePhotoResolution
{
  return self->_preservePhotoResolution;
}

- (BOOL)preserveAperture
{
  return self->_preserveAperture;
}

- (BOOL)preserveSpatialVideoEnabled
{
  return self->_preserveSpatialVideoEnabled;
}

- (BOOL)burstFollowsEncoderSettings
{
  return self->_burstFollowsEncoderSettings;
}

- (int64_t)overriddenBackCaptureInterval
{
  return self->_overriddenBackCaptureInterval;
}

- (int64_t)overriddenFrontCaptureInterval
{
  return self->_overriddenFrontCaptureInterval;
}

- (BOOL)sharedLibraryEnabled
{
  return self->_sharedLibraryEnabled;
}

- (void)setSharedLibraryEnabled:(BOOL)a3
{
  self->_sharedLibraryEnabled = a3;
}

- (BOOL)sharedLibraryAutoBehaviorEnabled
{
  return self->_sharedLibraryAutoBehaviorEnabled;
}

- (void)setSharedLibraryAutoBehaviorEnabled:(BOOL)a3
{
  self->_sharedLibraryAutoBehaviorEnabled = a3;
}

- (BOOL)sharedLibrarySwitchEnabled
{
  return self->_sharedLibrarySwitchEnabled;
}

- (void)setSharedLibrarySwitchEnabled:(BOOL)a3
{
  self->_sharedLibrarySwitchEnabled = a3;
}

- (BOOL)defaultToSharedLibraryEnabled
{
  return self->_defaultToSharedLibraryEnabled;
}

- (void)setDefaultToSharedLibraryEnabled:(BOOL)a3
{
  self->_defaultToSharedLibraryEnabled = a3;
}

- (BOOL)shareWhenAtHomeEnabled
{
  return self->_shareWhenAtHomeEnabled;
}

- (void)setShareWhenAtHomeEnabled:(BOOL)a3
{
  self->_shareWhenAtHomeEnabled = a3;
}

- (CLLocation)sharedLibraryLastLocation
{
  return self->_sharedLibraryLastLocation;
}

- (void)setSharedLibraryLastLocation:(id)a3
{
}

- (BOOL)sharedLibraryLastLocationAcquiredDuringTrip
{
  return self->_sharedLibraryLastLocationAcquiredDuringTrip;
}

- (void)setSharedLibraryLastLocationAcquiredDuringTrip:(BOOL)a3
{
  self->_sharedLibraryLastLocationAcquiredDuringTrip = a3;
}

- (NSDate)sharedLibraryLastDiscoveryDate
{
  return self->_sharedLibraryLastDiscoveryDate;
}

- (void)setSharedLibraryLastDiscoveryDate:(id)a3
{
}

- (CLLocation)sharedLibraryLastDiscoveryLocation
{
  return self->_sharedLibraryLastDiscoveryLocation;
}

- (void)setSharedLibraryLastDiscoveryLocation:(id)a3
{
}

- (NSDate)sharedLibraryLastUserActionDate
{
  return self->_sharedLibraryLastUserActionDate;
}

- (void)setSharedLibraryLastUserActionDate:(id)a3
{
}

- (CLLocation)sharedLibraryLastUserActionLocation
{
  return self->_sharedLibraryLastUserActionLocation;
}

- (void)setSharedLibraryLastUserActionLocation:(id)a3
{
}

- (int64_t)maximumRAWPhotoResolution
{
  return self->_maximumRAWPhotoResolution;
}

- (NSArray)customLensGroup
{
  return self->_customLensGroup;
}

- (int64_t)defaultCustomLens
{
  return self->_defaultCustomLens;
}

- (BOOL)isZoomPIPEnabled
{
  return self->_zoomPIPEnabled;
}

- (NSSet)openHalfPressSpotlightControls
{
  return self->_openHalfPressSpotlightControls;
}

- (void)setOpenHalfPressSpotlightControls:(id)a3
{
}

- (BOOL)didAcknowledgeDepthInPhotoModeDescription
{
  return self->_didAcknowledgeDepthInPhotoModeDescription;
}

- (NSDictionary)preferredDrawerControlByMode
{
  return self->_preferredDrawerControlByMode;
}

- (void)setPreferredDrawerControlByMode:(id)a3
{
}

- (BOOL)preservePreferredDrawerControl
{
  return self->_preservePreferredDrawerControl;
}

- (BOOL)_hasReadLastWrittenValues
{
  return self->__hasReadLastWrittenValues;
}

- (void)_setHasReadLastWrittenValues:(BOOL)a3
{
  self->__hasReadLastWrittenValues = a3;
}

- (BOOL)_preferHEVCWhenAvailable
{
  return self->__preferHEVCWhenAvailable;
}

- (int64_t)_backPreferredHEICPhotoResolution
{
  return self->__backPreferredHEICPhotoResolution;
}

- (int64_t)_frontPreferredHEICPhotoResolution
{
  return self->__frontPreferredHEICPhotoResolution;
}

- (BOOL)_shouldDisableCameraSwitchingDuringVideoRecording
{
  return self->__shouldDisableCameraSwitchingDuringVideoRecording;
}

- (int64_t)_previewAspectModeForPhotoModes
{
  return self->__previewAspectModeForPhotoModes;
}

- (void)_setPreviewAspectModeForPhotoModes:(int64_t)a3
{
  self->__previewAspectModeForPhotoModes = a3;
}

- (int64_t)_previewAspectModeForVideoModes
{
  return self->__previewAspectModeForVideoModes;
}

- (void)_setPreviewAspectModeForVideoModes:(int64_t)a3
{
  self->__previewAspectModeForVideoModes = a3;
}

- (NSDate)_lastViewedSettingsInterfaceDate
{
  return self->__lastViewedSettingsInterfaceDate;
}

- (NSDate)_lastWrittenSettingsDate
{
  return self->__lastWrittenSettingsDate;
}

- (void)_setLastWrittenSettingsDate:(id)a3
{
  self->__lastWrittenSettingsDate = (NSDate *)a3;
}

- (BOOL)writingAvailableDevices
{
  return self->_writingAvailableDevices;
}

- (void)setWritingAvailableDevices:(BOOL)a3
{
  self->_writingAvailableDevices = a3;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)photoFormatControlSecondaryFormat
{
  int64_t resolution = self->_photoFormatControlSecondaryFormat.resolution;
  int64_t encoding = self->_photoFormatControlSecondaryFormat.encoding;
  result.int64_t var1 = resolution;
  result.int64_t var0 = encoding;
  return result;
}

- (int64_t)rawFileFormatBehavior
{
  return self->_rawFileFormatBehavior;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__underlyingUserDefaults, 0);
  objc_storeStrong((id *)&self->_preferredDrawerControlByMode, 0);
  objc_storeStrong((id *)&self->_openHalfPressSpotlightControls, 0);
  objc_storeStrong((id *)&self->_customLensGroup, 0);
  objc_storeStrong((id *)&self->_sharedLibraryLastUserActionLocation, 0);
  objc_storeStrong((id *)&self->_sharedLibraryLastUserActionDate, 0);
  objc_storeStrong((id *)&self->_sharedLibraryLastDiscoveryLocation, 0);
  objc_storeStrong((id *)&self->_sharedLibraryLastDiscoveryDate, 0);
  objc_storeStrong((id *)&self->_sharedLibraryLastLocation, 0);
  objc_storeStrong((id *)&self->_resetTimeoutDate, 0);
  objc_storeStrong((id *)&self->_lastReadSystemStyle, 0);
  objc_storeStrong((id *)&self->_conflictingControlConfiguration, 0);
  objc_storeStrong((id *)&self->_captureConfiguration, 0);
}

- (void)readPreferencesWithOverrides:emulationMode:callActive:shouldResetCaptureConfiguration:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_2099F8000, v0, v1, "Failed to read system style override reference: %{public}@", v2, v3, v4, v5, v6);
}

- (void)readPreferencesWithOverrides:emulationMode:callActive:shouldResetCaptureConfiguration:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_2099F8000, v0, v1, "Failed to read system style override: %{public}@", v2, v3, v4, v5, v6);
}

- (void)readPreferencesWithOverrides:emulationMode:callActive:shouldResetCaptureConfiguration:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_2099F8000, v0, v1, "Failed to read photographic style: %{public}@", v2, v3, v4, v5, v6);
}

- (void)readPreferencesWithOverrides:(os_log_t)log emulationMode:callActive:shouldResetCaptureConfiguration:.cold.4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_2099F8000, log, OS_LOG_TYPE_ERROR, "Failed to read photographic style from non-dictionary data", v1, 2u);
}

- (void)readPreferencesWithOverrides:(uint64_t)a3 emulationMode:(uint64_t)a4 callActive:(uint64_t)a5 shouldResetCaptureConfiguration:(uint64_t)a6 .cold.5(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __58__CAMUserPreferences_writeAvailableDevicesWithCompletion___block_invoke_2_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_2099F8000, log, OS_LOG_TYPE_ERROR, "writeAvailableDevicesWithCompletion failed no longer available", v1, 2u);
}

void __105__CAMUserPreferences__convertDictionary_expectedKeyClass_expectedValueClass_keyConverter_valueConverter___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_2099F8000, v0, v1, "Failed to convert value %{public}@", v2, v3, v4, v5, v6);
}

void __105__CAMUserPreferences__convertDictionary_expectedKeyClass_expectedValueClass_keyConverter_valueConverter___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_2099F8000, v0, v1, "Failed to convert key %{public}@", v2, v3, v4, v5, v6);
}

@end