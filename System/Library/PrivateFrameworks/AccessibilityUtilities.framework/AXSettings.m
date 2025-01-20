@interface AXSettings
+ (AXSettings)sharedInstance;
- (AXPreferences)swiftSettings;
- (AXSettings)init;
- (BOOL)_defaultHapticValueForEvent:(id)a3;
- (BOOL)_hasSwitchWithUUID:(id)a3;
- (BOOL)_switchControlHasEmptyTopLevelMenuItems:(id)a3;
- (BOOL)_updateWithoutSavingExistingRecipe:(id)a3 allRecipes:(id)a4;
- (BOOL)_voiceOverRotorItemEnabled:(id)a3;
- (BOOL)accessibilityEnabled;
- (BOOL)allowHearingAidControlOnLockScreen;
- (BOOL)anyUserPreferredLangaugeIsRTL;
- (BOOL)appValidationTestingMode;
- (BOOL)appleTVRemoteClickpadTapsForDirectionalNavigationEnabled;
- (BOOL)appleTVScaledUIEnabled;
- (BOOL)applicationAccessibilityEnabled;
- (BOOL)assistiveTouchActionRepeatEnabled;
- (BOOL)assistiveTouchAlwaysShowMenuEnabled;
- (BOOL)assistiveTouchAutoScanningEnabled;
- (BOOL)assistiveTouchBubbleModeEnabled;
- (BOOL)assistiveTouchCameraSwitchPreviewEnabled;
- (BOOL)assistiveTouchCustomizationEnabled;
- (BOOL)assistiveTouchDelayAfterInputEnabled;
- (BOOL)assistiveTouchEnabled;
- (BOOL)assistiveTouchEnabledByOnDeviceEyeTracking;
- (BOOL)assistiveTouchEyeTrackingAutoHideEnabled;
- (BOOL)assistiveTouchForceEyeTrackerExperience;
- (BOOL)assistiveTouchForceOnDeviceEyeTrackingExperience;
- (BOOL)assistiveTouchGameControllerEnabled;
- (BOOL)assistiveTouchGroupElementsEnabled;
- (BOOL)assistiveTouchHardwareEnabled;
- (BOOL)assistiveTouchInputCoalescingEnabled;
- (BOOL)assistiveTouchInputHoldEnabled;
- (BOOL)assistiveTouchInternalOnlyHiddenNubbitMode;
- (BOOL)assistiveTouchInternalOnlyHiddenNubbitModeEnabled;
- (BOOL)assistiveTouchInternalOnlyPearlTrackingEnabled;
- (BOOL)assistiveTouchLongPressEnabled;
- (BOOL)assistiveTouchLongPressPauseScanningEnabled;
- (BOOL)assistiveTouchMotionTrackerConfigurable;
- (BOOL)assistiveTouchMotionTrackerShouldOffsetBufferPoints;
- (BOOL)assistiveTouchMouseAllowAppleBluetoothDevicesPairing;
- (BOOL)assistiveTouchMouseAlwaysShowSoftwareKeyboardEnabled;
- (BOOL)assistiveTouchMouseBehavesLikeFinger;
- (BOOL)assistiveTouchMouseClickSoundsEnabled;
- (BOOL)assistiveTouchMouseDwellControlAutorevertEnabled;
- (BOOL)assistiveTouchMouseDwellControlEnabled;
- (BOOL)assistiveTouchMouseDwellControlMutatedMenu;
- (BOOL)assistiveTouchMouseDwellControlShowPrompt;
- (BOOL)assistiveTouchMouseKeysEnabled;
- (BOOL)assistiveTouchMouseKeysOptionToggleEnabled;
- (BOOL)assistiveTouchMouseKeysUseMainKeyboardKeys;
- (BOOL)assistiveTouchMouseOnDeviceEyeTrackingEnabled;
- (BOOL)assistiveTouchMouseOnDeviceEyeTrackingEnrollmentCompleted;
- (BOOL)assistiveTouchMouseOnDeviceEyeTrackingOnboardingCompleted;
- (BOOL)assistiveTouchMouseOnDeviceEyeTrackingShouldShowUncalibratedPoints;
- (BOOL)assistiveTouchMousePointerTimeoutEnabled;
- (BOOL)assistiveTouchOnDeviceEyeTrackingAutoHideEnabled;
- (BOOL)assistiveTouchOnDeviceEyeTrackingShouldOffsetBufferPoints;
- (BOOL)assistiveTouchOnDeviceEyeTrackingShouldUseGaussianBlur;
- (BOOL)assistiveTouchOnDeviceEyeTrackingShouldUseMotionFilter;
- (BOOL)assistiveTouchOnDeviceEyeTrackingShouldUseWeightedAverages;
- (BOOL)assistiveTouchOpenMenuSwaggleEnabled;
- (BOOL)assistiveTouchScanTimeoutEnabled;
- (BOOL)assistiveTouchScannerAddedTripleClickAutomatically;
- (BOOL)assistiveTouchScannerCompactMenuEnabled;
- (BOOL)assistiveTouchScannerCursorHighVisibilityEnabled;
- (BOOL)assistiveTouchScannerMenuLabelsEnabled;
- (BOOL)assistiveTouchScannerPrefersCompact:(id)a3;
- (BOOL)assistiveTouchScannerSoundEnabled;
- (BOOL)assistiveTouchShouldUseExtendedKeyboardPredictions;
- (BOOL)assistiveTouchSleepOnWristDownPreference;
- (BOOL)assistiveTouchSwitchUsageConfirmed;
- (BOOL)assistiveTouchUIEnabled;
- (BOOL)assistiveTouchVirtualTrackpadEnabled;
- (BOOL)assistiveTouchVirtualTrackpadFullScreenToggleEnabled;
- (BOOL)assistiveTouchVirtualTrackpadScrollToggleEnabled;
- (BOOL)automaticAccessibilityEnabled;
- (BOOL)automaticAccessibilityIgnoreAppAccessibilityPreferred;
- (BOOL)automaticAccessibilityVisualizationsEnabled;
- (BOOL)automationEnabled;
- (BOOL)automationFauxCollectionViewCellsEnabled;
- (BOOL)automationFauxTableViewCellsEnabled;
- (BOOL)automationHitpointWarpingEnabled;
- (BOOL)automationLocalizedStringLookupInfoEnabled;
- (BOOL)automationTrueTouch;
- (BOOL)backTapEnabled;
- (BOOL)backTapFalsePositiveAlertsEnabled;
- (BOOL)backTapRNNModelEnabled;
- (BOOL)buttonShapesEnabled;
- (BOOL)callAudioRoutingAutoAnswerEnabled;
- (BOOL)classicInvertColors;
- (BOOL)didResetD22Preferences;
- (BOOL)didTriggerSOSToday;
- (BOOL)didTriggerSOSValueSet;
- (BOOL)enableHearingAidReporter;
- (BOOL)enableVoiceOverCaptions;
- (BOOL)enhanceBackgroundContrastEnabled;
- (BOOL)enhanceTextLegibilityEnabled;
- (BOOL)enhanceTextTrackingEnabled;
- (BOOL)fullKeyboardAccessFocusRingHighContrastEnabled;
- (BOOL)fullKeyboardAccessFocusRingTimeoutEnabled;
- (BOOL)fullKeyboardAccessLargeFocusRingEnabled;
- (BOOL)fullKeyboardAccessShouldShowDebugKeyCommandsView;
- (BOOL)fullKeyboardAccessShouldShowTextEditingModeInstructions;
- (BOOL)gaxInternalSettingsIsActiveAppSelfLocked;
- (BOOL)gaxInternalSettingsSystemDidRestartDueToLowBattery;
- (BOOL)gaxInternalSettingsTimeRestrictionHasExpired;
- (BOOL)gizmoApplicationAccessibilityEnabled;
- (BOOL)gizmoGetAutoSpeakEnabledForComplication:(id)a3 slot:(id)a4 face:(id)a5;
- (BOOL)guestsShouldInheritPrimaryUserPreferences;
- (BOOL)guidedAccessAXFeaturesEnabled;
- (BOOL)guidedAccessAllowsMultipleWindows;
- (BOOL)guidedAccessAllowsUnlockWithTouchID;
- (BOOL)guidedAccessDisallowDirectInactiveToActiveTransition;
- (BOOL)guidedAccessEnableExperimentalUI;
- (BOOL)guidedAccessOverrideIdleTime;
- (BOOL)guidedAccessShouldSpeakForTimeRestrictionEvents;
- (BOOL)guidedAccessUserPrefersMirroringForExternalDisplays;
- (BOOL)hapticMusicActive;
- (BOOL)hapticMusicEnhancedPercussion;
- (BOOL)hapticMusicEnhancedVocals;
- (BOOL)hapticMusicToggledInPreferences;
- (BOOL)hapticMusicTrackAvailable;
- (BOOL)highContrastFocusIndicatorsEnabled;
- (BOOL)hoverTextActivationLockEnabled;
- (BOOL)hoverTextEnabled;
- (BOOL)hoverTextShowedBanner;
- (BOOL)hoverTextTypingEnabled;
- (BOOL)hoverTextTypingShowedBanner;
- (BOOL)ignoreAXAsserts;
- (BOOL)ignoreAXServerEntitlements;
- (BOOL)ignoreTrackpad;
- (BOOL)includeBacktraceInLogs;
- (BOOL)increaseButtonLegibilityEnabled;
- (BOOL)independentHearingAidSettings;
- (BOOL)inspectorEnabled;
- (BOOL)isAXValidationRunnerCollectingValidations;
- (BOOL)isAdaptiveVoiceShortcutsEnabled;
- (BOOL)isNewRecipe:(id)a3;
- (BOOL)laserEnabled;
- (BOOL)leftRightBalanceEnabled;
- (BOOL)letterFeedbackEnabled;
- (BOOL)liveRecognitionActive;
- (BOOL)liveRecognitionOverlayOpen;
- (BOOL)liveRegionStatusEverSet;
- (BOOL)localizationQACaptionMode;
- (BOOL)localizationQACaptionShowFilePath;
- (BOOL)localizationQACaptionShowLocalizedString;
- (BOOL)localizationQACaptionShowUSString;
- (BOOL)logAXNotificationPosting;
- (BOOL)magnifierEnabled;
- (BOOL)magnifierFilterInverted;
- (BOOL)magnifierShouldAdjustFiltersForAmbientLight;
- (BOOL)magnifierShouldUseVideoStabilization;
- (BOOL)monoAudioEnabled;
- (BOOL)phoneticFeedbackEnabled;
- (BOOL)quickSpeakUnderlineSentence;
- (BOOL)quickTypeWordFeedbackEnabled;
- (BOOL)reachabilityEnabled;
- (BOOL)reduceMotionAutoplayVideoPreviewsEnabled;
- (BOOL)reduceMotionEnabled;
- (BOOL)reduceWhitePointEnabled;
- (BOOL)securePayAssertionActive;
- (BOOL)shouldCaptureVisionEngineDiagnosticsToDisk;
- (BOOL)shouldFlashForAlertInSilentMode;
- (BOOL)shouldFlashWhileUnlocked;
- (BOOL)shouldLimitDisplayRefreshRate;
- (BOOL)shouldPerformValidationsAtRuntime;
- (BOOL)shouldSpeakMedicalPreamble;
- (BOOL)shouldStreamToLeftAid;
- (BOOL)shouldStreamToRightAid;
- (BOOL)shouldTTYMedicalPreamble;
- (BOOL)showSpeechController;
- (BOOL)siriAutoUpdateListInitialized;
- (BOOL)siriSemanticContextEnabled;
- (BOOL)skipHearingAidMFiAuth;
- (BOOL)speakCorrectionsEnabled;
- (BOOL)spokenContentShouldUseLanguageDetection;
- (BOOL)startupSoundEnabled;
- (BOOL)stickyKeysBeepEnabled;
- (BOOL)stickyKeysEnabled;
- (BOOL)stickyKeysShiftToggleEnabled;
- (BOOL)supportsAdvancedDisplayFilters;
- (BOOL)switchControlDebugLoggingEnabled;
- (BOOL)switchControlEnabled;
- (BOOL)switchControlHasEmptyTopLevelMenu;
- (BOOL)switchControlIgnoreInvalidSwitchConfiguration;
- (BOOL)switchControlIsEnabledAsReceiver;
- (BOOL)switchControlRestartScanningAtCurrentKey;
- (BOOL)switchControlShouldAlwaysActivateKeyboardKeys;
- (BOOL)switchControlShouldDisallowUSBRestrictedMode;
- (BOOL)switchControlShouldUseExtendedKeyboardPredictions;
- (BOOL)switchControlShouldUseShortFirstPage;
- (BOOL)switchControlUseCameraForPointMode;
- (BOOL)switchControlUserDidReadUSBRestrictedModeAlert;
- (BOOL)syncPronunciationsWithCloudKit;
- (BOOL)tapToSpeakTimeEnabled;
- (BOOL)tapticTimeInternalFlashScreenEnabled;
- (BOOL)tapticTimeIsAvailable;
- (BOOL)touchAccommodationsAllowsSwipeGesturesToBypass;
- (BOOL)touchAccommodationsAreConfigured;
- (BOOL)touchAccommodationsEnabled;
- (BOOL)touchAccommodationsHoldDurationAllowsSwipeGesturesToBypass;
- (BOOL)touchAccommodationsHoldDurationEnabled;
- (BOOL)touchAccommodationsIgnoreRepeatEnabled;
- (BOOL)touchAccommodationsTripleClickConfirmed;
- (BOOL)touchAccommodationsUsageConfirmed;
- (BOOL)updateRecipe:(id)a3;
- (BOOL)useNewAXBundleLoader;
- (BOOL)userDidSelectVoiceForLanguage:(id)a3 sourceKey:(id)a4;
- (BOOL)validateAndUpdateRecipeIfNeeded:(id)a3;
- (BOOL)validateSecondPartyApps;
- (BOOL)voiceOverActionFeedbackFirstInListOnly;
- (BOOL)voiceOverAdjustSoundVolumeIndependently;
- (BOOL)voiceOverAlwaysTurnOnBluetooth;
- (BOOL)voiceOverAlwaysUseNemethCodeForMathEnabled;
- (BOOL)voiceOverAudioDuckingEnabled;
- (BOOL)voiceOverAudioFollowsHDMIAudio;
- (BOOL)voiceOverAutomaticButtonLabels;
- (BOOL)voiceOverBrailleAlertShowUntilDismissed;
- (BOOL)voiceOverBrailleAlertsEnabled;
- (BOOL)voiceOverBrailleEightDotMode;
- (BOOL)voiceOverBrailleFormattingEnabled;
- (BOOL)voiceOverBrailleGesturesEnabled;
- (BOOL)voiceOverBrailleGradeTwoAutoTranslateEnabled;
- (BOOL)voiceOverBrailleWordWrapEnabled;
- (BOOL)voiceOverEditAppsActionEnabled;
- (BOOL)voiceOverEnabled;
- (BOOL)voiceOverEnabledThroughAccessory;
- (BOOL)voiceOverExploreFocusAffectsNativeFocus;
- (BOOL)voiceOverFlashlightNotificationsEnabled;
- (BOOL)voiceOverHandGesturesEnabled;
- (BOOL)voiceOverHandwritingEnabled;
- (BOOL)voiceOverHapticsEnabled;
- (BOOL)voiceOverHintsEnabled;
- (BOOL)voiceOverIgnoreTrackpad;
- (BOOL)voiceOverLanguageRotorItemsExist;
- (BOOL)voiceOverPrefersFollowFocusNavigationStyle;
- (BOOL)voiceOverRotorUpdatesWithElement;
- (BOOL)voiceOverSceneDescriptionsEnabled;
- (BOOL)voiceOverScreenCurtainEnabled;
- (BOOL)voiceOverShouldDisallowUSBRestrictedMode;
- (BOOL)voiceOverShouldFocusEverywhere;
- (BOOL)voiceOverShouldOutputToHearingAid;
- (BOOL)voiceOverShouldSpeakDiscoveredText;
- (BOOL)voiceOverShowBrailleWatchSettings;
- (BOOL)voiceOverShowSoftwareKeyboardWithBraille;
- (BOOL)voiceOverSilenceAnnouncements;
- (BOOL)voiceOverSleepOnWristDownPreference;
- (BOOL)voiceOverSoundCurtain;
- (BOOL)voiceOverSoundEffectsEnabled;
- (BOOL)voiceOverSpeakActionConfirmation;
- (BOOL)voiceOverSpeakNonfocusableElementsAfterDelay;
- (BOOL)voiceOverSpeakNotificationsEnabled;
- (BOOL)voiceOverSpeakTableColumnRowInformation;
- (BOOL)voiceOverSpeakTableHeaders;
- (BOOL)voiceOverSpeakingRateInRotorEnabled;
- (BOOL)voiceOverSpeaksOverTelephoneCalls;
- (BOOL)voiceOverTapticChimesEnabled;
- (BOOL)voiceOverTapticTimeMode;
- (BOOL)voiceOverTouchBrailleGestureControl;
- (BOOL)voiceOverTouchBrailleGesturesDidPlayCalibrationHint;
- (BOOL)voiceOverTouchBrailleGesturesShouldUseLockedConfiguration;
- (BOOL)voiceOverTouchBrailleShouldReverseDots;
- (BOOL)voiceOverTouchBrailleShowGeneralStatus;
- (BOOL)voiceOverTouchBrailleShowTextStyleStatus;
- (BOOL)voiceOverTouchSingleLetterQuickNavEnabled;
- (BOOL)voiceOverTouchUpdateBrailleWithoutConnectedDisplay;
- (BOOL)voiceOverUIEnabled;
- (BOOL)voiceOverUsageConfirmed;
- (BOOL)voiceOverUseRingerSwitchToControlNotificationOutput;
- (BOOL)voiceOverUserDidReadUSBRestrictedModeAlert;
- (BOOL)voiceOverVerbosityEmojiSuffixEnabled;
- (BOOL)voiceOverVerbositySpeakCustomActionsHint;
- (BOOL)wordFeedbackEnabled;
- (BOOL)writeAXLogsToFile;
- (BOOL)zoomAdjustZoomLevelKbShortcutEnabled;
- (BOOL)zoomAlwaysUseWindowedZoomForTyping;
- (BOOL)zoomAutopannerShouldPanWithAcceleration;
- (BOOL)zoomDebugDisableZoomLensScaleTransform;
- (BOOL)zoomDebugShowExternalFocusRect;
- (BOOL)zoomEnabled;
- (BOOL)zoomHandGesturesEnabled;
- (BOOL)zoomInStandby;
- (BOOL)zoomKeyboardShortcutsEnabled;
- (BOOL)zoomPanZoomKbShortcutEnabled;
- (BOOL)zoomPeekZoomEnabled;
- (BOOL)zoomPeekZoomEverEnabled;
- (BOOL)zoomPreferencesWereInitialized;
- (BOOL)zoomResizeZoomWindowKbShortcutEnabled;
- (BOOL)zoomScrollWheelKbShortcutEnabled;
- (BOOL)zoomShouldAllowFullscreenAutopanning;
- (BOOL)zoomShouldFollowFocus;
- (BOOL)zoomShouldShowSlug;
- (BOOL)zoomShowWhileMirroring;
- (BOOL)zoomShowedBanner;
- (BOOL)zoomSlugTapAndSlideToAdjustZoomLevelEnabled;
- (BOOL)zoomSmoothScalingEnabled;
- (BOOL)zoomSwitchZoomModeKbShortcutEnabled;
- (BOOL)zoomTempToggleZoomKbShortcutEnabled;
- (BOOL)zoomToggleZoomKbShortcutEnabled;
- (BOOL)zoomToggledByPreferenceSwitch;
- (BOOL)zoomToggledByVoiceOver;
- (BOOL)zoomTrackpadGestureEnabled;
- (CGPoint)quickSpeakNubbitNormalizedPosition;
- (CGPoint)zoomPanOffset;
- (CGPoint)zoomSlugNormalizedPosition;
- (CGRect)zoomWindowFrame;
- (NSArray)assistiveTouchCustomGestures;
- (NSArray)assistiveTouchMouseCustomizedClickActions;
- (NSArray)assistiveTouchMouseOnDeviceEyeTrackingCalibratedValues;
- (NSArray)assistiveTouchRecentGestures;
- (NSArray)assistiveTouchSavedGestures;
- (NSArray)customPronunciationSubstitutions;
- (NSArray)deviceKeys;
- (NSArray)enabledLiveRecognitionModes;
- (NSArray)gaxInternalSettingsSavedAccessibilityTripleClickOptions;
- (NSArray)gaxInternalSettingsUserConfiguredAppIDs;
- (NSArray)gestureKeys;
- (NSArray)imageCaptioningDisabledApps;
- (NSArray)mediaControlsKeys;
- (NSArray)perAppSettingsCustomizedAppIDs;
- (NSArray)settingsKeys;
- (NSArray)switchControlCombinedTopLevelMenuItems;
- (NSArray)switchControlDeviceMenuItems;
- (NSArray)switchControlDeviceTopLevelMenuItems;
- (NSArray)switchControlGesturesMenuItems;
- (NSArray)switchControlGesturesTopLevelMenuItems;
- (NSArray)switchControlMediaControlsMenuItems;
- (NSArray)switchControlMediaControlsTopLevelMenuItems;
- (NSArray)switchControlRecipes;
- (NSArray)switchControlSettingsMenuItems;
- (NSArray)switchControlSettingsTopLevelMenuItems;
- (NSArray)switchControlTopLevelMenuItems;
- (NSArray)tripleClickOptions;
- (NSArray)tripleClickOrderedOptions;
- (NSArray)voiceOverBrailleDisplays;
- (NSArray)voiceOverBrailleLanguageRotorItems;
- (NSArray)voiceOverDetectionModeItems;
- (NSArray)voiceOverLanguageRotorItems;
- (NSArray)voiceOverQuickSettingsItems;
- (NSArray)voiceOverRotorItems;
- (NSData)fullKeyboardAccessCommandMapData;
- (NSData)hoverTextBackgroundColorData;
- (NSData)hoverTextBorderColorData;
- (NSData)hoverTextInsertionPointColorData;
- (NSData)hoverTextTextColorData;
- (NSData)hoverTextTypingAutocorrectedTextColorData;
- (NSData)hoverTextTypingBackgroundColorData;
- (NSData)hoverTextTypingBorderColorData;
- (NSData)hoverTextTypingInsertionPointColorData;
- (NSData)hoverTextTypingMisspelledTextColorData;
- (NSData)hoverTextTypingTextColorData;
- (NSData)voiceOverCustomCommandProfile;
- (NSDate)gaxInternalSettingsLastActivationDate;
- (NSDate)gaxInternalSettingsLastPasscodeSetDate;
- (NSDate)hapticMusicUsageStartDate;
- (NSDictionary)assistiveTouchActionsBySoundAction;
- (NSDictionary)assistiveTouchEyeTrackerCustomizedSettings;
- (NSDictionary)assistiveTouchMainScreenCustomization;
- (NSDictionary)assistiveTouchMainScreenDefaultCustomization;
- (NSDictionary)assistiveTouchMouseDwellControlCornerCustomization;
- (NSDictionary)assistiveTouchMouseOnDeviceEyeTrackingEnrollmentPointToGazePointMap;
- (NSDictionary)assistiveTouchUsageCount;
- (NSDictionary)gaxInternalSettingsSavedAccessibilityFeatures;
- (NSDictionary)gaxInternalSettingsUserAppProfile;
- (NSDictionary)gaxInternalSettingsUserGlobalProfile;
- (NSDictionary)managedAssetsRepresentation;
- (NSDictionary)perAppSettingsStats;
- (NSDictionary)remoteHandGestureCustomizedActions;
- (NSDictionary)teachableMomentsNotificationsSeen;
- (NSDictionary)voiceOverBrailleBluetoothDisplay;
- (NSDictionary)voiceOverBrailleDisconnectOnSleep;
- (NSDictionary)voiceOverDirectTouchEnabledApps;
- (NSDictionary)voiceOverHandGesturesActionCustomizations;
- (NSDictionary)voiceOverSoundAndHapticPreferences;
- (NSDictionary)zoomHandGesturesActionCustomizations;
- (NSNumber)gaxInternalSettingsActiveAppOrientation;
- (NSNumber)gaxInternalSettingsECID;
- (NSNumber)guidedAccessOverrideTimeRestrictionDuration;
- (NSNumber)voiceOverHandwritingWasNativeAutocorrectEnabled;
- (NSOrderedSet)zoomPreferredDockPositions;
- (NSOrderedSet)zoomPreferredLensModes;
- (NSSet)assistiveTouchCameraPointPickerSwitches;
- (NSSet)assistiveTouchSwitches;
- (NSString)assistiveTouchDoubleTapAction;
- (NSString)assistiveTouchLongPressAction;
- (NSString)assistiveTouchMouseDwellControlAutorevertAction;
- (NSString)assistiveTouchOrbAction;
- (NSString)assistiveTouchSingleTapAction;
- (NSString)automationPreferredLocalization;
- (NSString)backTapDoubleTapAction;
- (NSString)backTapTripleTapAction;
- (NSString)gaxInternalSettingsActiveAppID;
- (NSString)gaxInternalSettingsProductBuildVersion;
- (NSString)guidedAccessDefaultToneIdentifierForTimeRestrictionEvents;
- (NSString)guidedAccessToneIdentifierForTimeRestrictionEvents;
- (NSString)hapticMusicAlgorithmSelection;
- (NSString)hoverTextContentSize;
- (NSString)hoverTextFontName;
- (NSString)hoverTextTypingFontName;
- (NSString)hoverTextTypingTextStyle;
- (NSString)medicalPreamble;
- (NSString)spokenContentDefaultFallbackLanguage;
- (NSString)voiceOverBrailleTableIdentifier;
- (NSString)voiceOverTouchBrailleTableIdentifier;
- (NSString)zoomCurrentLensEffect;
- (NSString)zoomCurrentLensMode;
- (NSString)zoomPreferredCurrentDockPosition;
- (NSString)zoomPreferredCurrentLensMode;
- (NSURL)alexLocalAssetURL;
- (NSUUID)switchControlLaunchRecipeUUID;
- (NSUUID)voiceOverPunctuationGroup;
- (__CFString)_domainNameForDomain:(unint64_t)a3;
- (double)assistiveTouchActionRepeatInterval;
- (double)assistiveTouchAxisSweepSpeed;
- (double)assistiveTouchDelayAfterInput;
- (double)assistiveTouchDoubleTapActionTimeout;
- (double)assistiveTouchEyeTrackingAutoHideOpacity;
- (double)assistiveTouchEyeTrackingAutoHideTimeout;
- (double)assistiveTouchIdleOpacity;
- (double)assistiveTouchInputCoalescingDuration;
- (double)assistiveTouchInputHoldDuration;
- (double)assistiveTouchLongPressActionDuration;
- (double)assistiveTouchLongPressDuration;
- (double)assistiveTouchMotionTrackerSmoothingMaxDelta;
- (double)assistiveTouchMotionTrackerXNormalizationOffset;
- (double)assistiveTouchMotionTrackerXNormalizationOrder;
- (double)assistiveTouchMotionTrackerYNormalizationOffset;
- (double)assistiveTouchMotionTrackerYNormalizationOrder;
- (double)assistiveTouchMouseDwellControlActivationTimeout;
- (double)assistiveTouchMouseDwellControlMovementToleranceRadius;
- (double)assistiveTouchMousePointerSizeMultiplier;
- (double)assistiveTouchMousePointerTimeout;
- (double)assistiveTouchOnDeviceEyeTrackingAutoHideOpacity;
- (double)assistiveTouchOnDeviceEyeTrackingAutoHideTimeout;
- (double)assistiveTouchScanTimeout;
- (double)assistiveTouchScannerSpeechRate;
- (double)assistiveTouchSpeed;
- (double)assistiveTouchStepInterval;
- (double)assistiveTouchVirtualTrackpadBorderOpacity;
- (double)assistiveTouchVirtualTrackpadBorderWidth;
- (double)assistiveTouchVirtualTrackpadFadeDelay;
- (double)assistiveTouchVirtualTrackpadHoldDuration;
- (double)assistiveTouchVirtualTrackpadInnerOpacity;
- (double)assistiveTouchVirtualTrackpadScrollSpeed;
- (double)assistiveTouchVirtualTrackpadSpeed;
- (double)audioLeftRightBalance;
- (double)audiogramIngestionLastModelAccess;
- (double)callAudioRoutingAutoAnswerDelay;
- (double)cameraButtonSensitivity;
- (double)characterFeedbackDelayDuration;
- (double)dockSize;
- (double)fullKeyboardAccessFocusRingTimeout;
- (double)hapticMusicUsagePerDay;
- (double)hoverTextBackgroundOpacity;
- (double)hoverTextFontSize;
- (double)lastAssistiveTouchTimeResetCount;
- (double)lastBrailleScreenInputTimeResetCount;
- (double)lastCharacterVoiceTimeResetCount;
- (double)lastGuidedAccessTimeLimitResetCount;
- (double)lastGuidedAccessTimeResetCount;
- (double)lastHearingAidControlPanelTimeResetCount;
- (double)lastHearingAidHandoffTimeResetCount;
- (double)lastMagnifierResetCount;
- (double)lastPlatformSwitchTimeResetCount;
- (double)lastSmartInvertColorsEnablement;
- (double)lastTapticTimeResetCount;
- (double)leftRightBalanceValue;
- (double)magnifierBrightness;
- (double)magnifierContrast;
- (double)magnifierZoomLevel;
- (double)soundActionsLastModelAccess;
- (double)soundDetectionLastModelAccess;
- (double)speechControllerIdleOpacity;
- (double)switchControlAutoTapTimeout;
- (double)switchControlCameraPointPickerDwellActivationTimeout;
- (double)switchControlCameraPointPickerDwellMovementToleranceRadius;
- (double)switchControlCameraPointPickerMovementToleranceInJoystickMode;
- (double)switchControlCameraPointPickerSensitivity;
- (double)switchControlDwellTime;
- (double)teachableMomentsDelayBeforeSending;
- (double)touchAccommodationsHoldDuration;
- (double)touchAccommodationsIgnoreRepeatDuration;
- (double)touchAccommodationsSwipeGestureMinimumDistance;
- (double)touchAccommodationsTapActivationTimeout;
- (double)voiceOverBrailleAlertDisplayDuration;
- (double)voiceOverBrailleAutoAdvanceDuration;
- (double)voiceOverBrailleKeyDebounceTimeout;
- (double)voiceOverDelayUntilSpeakUnderTouch;
- (double)voiceOverDoubleTapInterval;
- (double)voiceOverHapticIntensity;
- (double)voiceOverMediaDuckingAmount;
- (double)voiceOverPitch;
- (double)voiceOverSoundVolume;
- (double)zoomIdleSlugOpacity;
- (double)zoomPreferredMaximumZoomScale;
- (double)zoomScale;
- (float)quickSpeakSpeakingRate;
- (float)quickSpeakSpeakingRateForLanguage:(id)a3;
- (float)quickSpeakVolume;
- (float)reduceWhitePointLevel;
- (float)voiceOverEffectiveSpeakingRate;
- (float)voiceOverEffectiveSpeakingVolume;
- (float)voiceOverSpeakingRate;
- (float)voiceOverSpeakingRateForLanguage:(id)a3;
- (float)voiceOverTapticTimeSpeed;
- (float)voiceOverVolume;
- (id)_allAccessibilityDomains;
- (id)_allSubmenuKeys;
- (id)_audioHardwareChannelLayout;
- (id)_createAndSaveRecipeForInterfaceOrientedPoint:(CGPoint)a3 forHold:(BOOL)a4;
- (id)_customizedAppIDs;
- (id)_gesturesForPreferenceKeyMigratingIfNecessary:(id)a3;
- (id)_keysToIgnore;
- (id)_legacyIdentifierForEyeTracker:(id)a3;
- (id)_migratePreferenceIfNecessary:(id)a3;
- (id)_quickSpeakAltVoices;
- (id)_quickSpeakPrefersCompact;
- (id)_switchControlAltVoices;
- (id)_switchControlMenuItemPreferences;
- (id)_switchControlMenuItemsForPreferenceKey:(id)a3 allTypes:(id)a4 enabledByDefault:(BOOL)a5 topLevel:(BOOL)a6;
- (id)_switchControlMigratePreMonarchIncludedMenuItemsForNewTypes:(id)a3;
- (id)_switchControlPrefersCompact;
- (id)_switchControlScannerDefaultDialect;
- (id)_switchWithAction:(int64_t)a3 excludedUUIDs:(id)a4 needsToSupportLongPress:(BOOL)a5;
- (id)_switchWithAnyActionExcludingUUIDs:(id)a3 needsToSupportLongPress:(BOOL)a4;
- (id)_voiceOverAlternativeVoiceIdentifiers;
- (id)_voiceOverDefaultDialect;
- (id)_voiceOverPrefersCompactByLanguage;
- (id)_voiceOverSoundOrHapticValueForPreference:(id)a3 outputEvent:(id)a4;
- (id)_voiceOverTouchSpeakingRateLanguages;
- (id)allDomainNamesForPreferenceKey:(id)a3;
- (id)automaticAccessibilityModes;
- (id)createAndSaveRecipeForInterfaceOrientedHoldPoint:(CGPoint)a3;
- (id)createAndSaveRecipeForInterfaceOrientedPoint:(CGPoint)a3;
- (id)customSettingsForVoice:(id)a3 sourceKey:(id)a4;
- (id)domainNameForPreferenceKey:(id)a3;
- (id)gizmoGetWatchFaceAutoSpeakPreferences;
- (id)keysToIgnoreDuringBuddyTransfer;
- (id)liveRegionStatusForWebOrApp:(id)a3;
- (id)liveSpeechVoiceIdentifierForKeyboardID:(id)a3;
- (id)preferenceKeyForSelector:(SEL)a3;
- (id)preferredBrailleTableIdentifierForKeyboardLanguage:(id)a3 keyboardLayout:(id)a4;
- (id)selectedSpeechVoiceIdentifiers;
- (id)selectedSpeechVoiceIdentifiersForSourceKey:(id)a3;
- (id)selectedSpeechVoiceIdentifiersWithLanguageSource;
- (id)smoothingBufferSizeForEyeTracker:(id)a3;
- (id)speechVoiceIdentifierForLanguage:(id)a3 source:(int64_t)a4 exists:(BOOL *)a5;
- (id)speechVoiceIdentifierForLanguage:(id)a3 sourceKey:(id)a4 exists:(BOOL *)a5;
- (id)speechVoiceIdentifierForLanguageWithoutFallback:(id)a3 sourceKey:(id)a4;
- (id)spokenContentVoiceSelectionForLanguage:(id)a3;
- (id)switchControlLocStringForFirstLaunchScanningMode:(int64_t)a3;
- (id)switchForUUID:(id)a3;
- (id)topLevelKeys;
- (id)valueForPreferenceKey:(id)a3;
- (id)voiceOverAlternativeVoiceIdentifier:(id)a3;
- (id)voiceOverHapticEnabledForEvent:(id)a3;
- (id)voiceOverRotorItemWithVoiceID:(id)a3 rate:(id)a4 volume:(id)a5 pitch:(id)a6;
- (id)voiceOverSelectedActivity;
- (id)voiceOverSoundEnabledForEvent:(id)a3;
- (id)voiceOverTouchPreferredBrailleTableIdentifiers;
- (int64_t)assistiveTouchCursorColor;
- (int64_t)assistiveTouchHeadMovementSensitivity;
- (int64_t)assistiveTouchMouseKeysDelay;
- (int64_t)assistiveTouchMouseKeysMaxSpeed;
- (int64_t)assistiveTouchMouseOnDeviceEyeTrackingCalibrationStrategy;
- (int64_t)assistiveTouchMousePointerColor;
- (int64_t)assistiveTouchPreferredPointPicker;
- (int64_t)assistiveTouchScanCycles;
- (int64_t)assistiveTouchScanningMode;
- (int64_t)assistiveTouchVirtualTrackpadBorderColor;
- (int64_t)assistiveTouchVirtualTrackpadInnerColor;
- (int64_t)automaticAccessibilityModeForBundleIdentifier:(id)a3;
- (int64_t)backTapUsageCount;
- (int64_t)brokenHomeButtonCount;
- (int64_t)characterVoicesUsageCount;
- (int64_t)fullKeyboardAccessFocusRingColor;
- (int64_t)guidedAccessAutoLockTimeInSeconds;
- (int64_t)guidedAccessTimeLimitsUsageCount;
- (int64_t)guidedAccessUsageCount;
- (int64_t)hearingAidControlPanelCount;
- (int64_t)hearingAidHandOffCount;
- (int64_t)hoverTextDisplayMode;
- (int64_t)hoverTextPreferredActivatorKey;
- (int64_t)hoverTextScrollingSpeed;
- (int64_t)hoverTextTypingDisplayMode;
- (int64_t)internalLoggingColorTheme;
- (int64_t)liveSpeechMaxRecentsCount;
- (int64_t)magnifierUsageCount;
- (int64_t)quickSpeakSentenceHighlightColor;
- (int64_t)quickSpeakWordHighlightColor;
- (int64_t)speechControllerDoubleTapAction;
- (int64_t)speechControllerLongPressAction;
- (int64_t)switchControlFirstLaunchScanningMode;
- (int64_t)switchControlPlatformSwitchedCount;
- (int64_t)switchControlPointPickerSelectionStyle;
- (int64_t)switchControlScanAfterTapLocation;
- (int64_t)switchControlScanningStyle;
- (int64_t)switchControlTapBehavior;
- (int64_t)tapToSpeakTimeAvailability;
- (int64_t)tapticTimeUsageCount;
- (int64_t)touchAccommodationsHoldDurationSwipeGestureSensitivity;
- (int64_t)touchAccommodationsTapActivationMethod;
- (int64_t)voiceOverActionsFeedback;
- (int64_t)voiceOverActivationWorkaround;
- (int64_t)voiceOverBSIUsageCount;
- (int64_t)voiceOverBannerNotificationOutput;
- (int64_t)voiceOverBrailleContractionMode;
- (int64_t)voiceOverBrailleGesturesTypingFeedback;
- (int64_t)voiceOverBrailleStatusCellPreference;
- (int64_t)voiceOverCapitalLetterFeedback;
- (int64_t)voiceOverContainerOutputFeedback;
- (int64_t)voiceOverDeletionFeedback;
- (int64_t)voiceOverDescribedMedia;
- (int64_t)voiceOverDiscoveredSensitiveContentFeedback;
- (int64_t)voiceOverHardwareTypingFeedback;
- (int64_t)voiceOverHelpMode;
- (int64_t)voiceOverInlineTextCompletionAppearanceFeedback;
- (int64_t)voiceOverInlineTextCompletionInsertionFeedback;
- (int64_t)voiceOverKeyboardModifierChoice;
- (int64_t)voiceOverLinkFeedback;
- (int64_t)voiceOverLockedScreenNotificationOutput;
- (int64_t)voiceOverMediaDuckingMode;
- (int64_t)voiceOverMoreContentOutputFeedback;
- (int64_t)voiceOverNavigateImagesOption;
- (int64_t)voiceOverNavigationDirectionMode;
- (int64_t)voiceOverNavigationStyle;
- (int64_t)voiceOverNeuralElementFeedback;
- (int64_t)voiceOverNumberFeedback;
- (int64_t)voiceOverPhoneticsFeedback;
- (int64_t)voiceOverPreferredTVInteractionMode;
- (int64_t)voiceOverPunctuationLevel;
- (int64_t)voiceOverQuickNavAnnouncementFeedback;
- (int64_t)voiceOverRotorSummaryFeedback;
- (int64_t)voiceOverSoftwareTypingFeedback;
- (int64_t)voiceOverSpeakSecondsEncoding;
- (int64_t)voiceOverTapticChimesAvailability;
- (int64_t)voiceOverTapticChimesFrequencyEncoding;
- (int64_t)voiceOverTapticChimesSoundType;
- (int64_t)voiceOverTapticTimeEncoding;
- (int64_t)voiceOverTouchBrailleGesturesLockedOrientation;
- (int64_t)voiceOverTouchBrailleGesturesLockedTypingMode;
- (int64_t)voiceOverTypingMode;
- (int64_t)voiceOverVerbosityEmojiFeedback;
- (int64_t)zoomControllerColor;
- (int64_t)zoomSlugDoubleTapAction;
- (int64_t)zoomSlugSingleTapAction;
- (int64_t)zoomSlugTripleTapAction;
- (unint64_t)_domainForPreferenceKey:(id)a3;
- (unint64_t)appleTVAppGridItemsPerLine;
- (unint64_t)assistiveTouchMotionTrackerSmoothingBufferSize;
- (unint64_t)assistiveTouchMouseZoomPanningStyle;
- (unint64_t)assistiveTouchOnDeviceEyeTrackingSmoothingBufferSize;
- (unint64_t)imageCaptionGenderStrategy;
- (unint64_t)laserZoomPanningStyle;
- (unint64_t)magnifierFilterSetIdentifier;
- (unint64_t)quickSpeakHighlightOption;
- (unint64_t)quickSpeakSentenceHighlightOption;
- (unint64_t)switchControlCameraPointPickerMode;
- (void)_assignActionToUnsetHotCorner:(id)a3;
- (void)_assignDefaultTitleIfNeededToRecipe:(id)a3;
- (void)_clearWhitetailMigrationSettings;
- (void)_handleVoiceUnarchivedCache:(id)a3;
- (void)_listenForAccessibilitySupportPassthroughs;
- (void)_localeChange:(id)a3;
- (void)_setAudioHardwareChannelLayout:(id)a3;
- (void)_setGestures:(id)a3 forPreferenceKey:(id)a4;
- (void)_switchControlClearMenuItemMigrationTracking;
- (void)_switchControlClearMenuItemPreferences;
- (void)_updateTouchAccommodationsTripleClickSetting;
- (void)_voiceOverSetSoundOrHapticValue:(id)a3 forPreference:(id)a4 outputEvent:(id)a5;
- (void)addCustomizedAppID:(id)a3;
- (void)addRotorOptionsForLoginSession;
- (void)aggregatePerAppSettingsStatistics;
- (void)assistiveTouchMotionTrackerShouldOffsetBufferPoints:(BOOL)a3;
- (void)clearVoicePrefersCompactSettings;
- (void)configureZoomForLoginSession;
- (void)enableAssistiveTechnologies:(BOOL)a3 usingDefaults:(id)a4;
- (void)fullKeyboardAccessCommandMapData;
- (void)gizmoSetAutoSpeakEnabledForComplication:(id)a3 slot:(id)a4 face:(id)a5 toggle:(BOOL)a6;
- (void)guidedAccessDefaultToneIdentifierForTimeRestrictionEvents;
- (void)nukeAll;
- (void)nukePrefsForDomains:(unint64_t *)a3 numDomains:(unint64_t)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)reachabilityEnabled;
- (void)removeCustomizedAppID:(id)a3;
- (void)resetAllGuestModeDefaults;
- (void)saveRecipe:(id)a3;
- (void)setAdaptiveVoiceShortcutsEnabled:(BOOL)a3;
- (void)setAlexLocalAssetURL:(id)a3;
- (void)setAllowHearingAidControlOnLockScreen:(BOOL)a3;
- (void)setAppValidationTestingMode:(BOOL)a3;
- (void)setAppleTVRemoteClickpadTapsForDirectionalNavigationEnabled:(BOOL)a3;
- (void)setAppleTVScaledUIEnabled:(BOOL)a3;
- (void)setApplicationAccessibilityEnabled:(BOOL)a3;
- (void)setAssistiveTouchActionRepeatEnabled:(BOOL)a3;
- (void)setAssistiveTouchActionRepeatInterval:(double)a3;
- (void)setAssistiveTouchActionsBySoundAction:(id)a3;
- (void)setAssistiveTouchAlwaysShowMenuEnabled:(BOOL)a3;
- (void)setAssistiveTouchAxisSweepSpeed:(double)a3;
- (void)setAssistiveTouchBubbleModeEnabled:(BOOL)a3;
- (void)setAssistiveTouchCameraPointPickerSwitches:(id)a3;
- (void)setAssistiveTouchCameraSwitchPreviewEnabled:(BOOL)a3;
- (void)setAssistiveTouchCursorColor:(int64_t)a3;
- (void)setAssistiveTouchCustomGestures:(id)a3;
- (void)setAssistiveTouchDelayAfterInput:(double)a3;
- (void)setAssistiveTouchDelayAfterInputEnabled:(BOOL)a3;
- (void)setAssistiveTouchDoubleTapAction:(id)a3;
- (void)setAssistiveTouchDoubleTapActionTimeout:(double)a3;
- (void)setAssistiveTouchEnabled:(BOOL)a3;
- (void)setAssistiveTouchEnabledByOnDeviceEyeTracking:(BOOL)a3;
- (void)setAssistiveTouchEyeTrackerCustomizedSettings:(id)a3;
- (void)setAssistiveTouchEyeTrackingAutoHideEnabled:(BOOL)a3;
- (void)setAssistiveTouchEyeTrackingAutoHideOpacity:(double)a3;
- (void)setAssistiveTouchEyeTrackingAutoHideTimeout:(double)a3;
- (void)setAssistiveTouchForceEyeTrackerExperience:(BOOL)a3;
- (void)setAssistiveTouchForceOnDeviceEyeTrackingExperience:(BOOL)a3;
- (void)setAssistiveTouchGameControllerEnabled:(BOOL)a3;
- (void)setAssistiveTouchGroupElementsEnabled:(BOOL)a3;
- (void)setAssistiveTouchHardwareEnabled:(BOOL)a3;
- (void)setAssistiveTouchHeadMovementSensitivity:(int64_t)a3;
- (void)setAssistiveTouchIdleOpacity:(double)a3;
- (void)setAssistiveTouchInputCoalescingDuration:(double)a3;
- (void)setAssistiveTouchInputCoalescingEnabled:(BOOL)a3;
- (void)setAssistiveTouchInputHoldDuration:(double)a3;
- (void)setAssistiveTouchInputHoldEnabled:(BOOL)a3;
- (void)setAssistiveTouchInternalOnlyHiddenNubbitModeEnabled:(BOOL)a3;
- (void)setAssistiveTouchInternalOnlyPearlTrackingEnabled:(BOOL)a3;
- (void)setAssistiveTouchLongPressAction:(id)a3;
- (void)setAssistiveTouchLongPressActionDuration:(double)a3;
- (void)setAssistiveTouchLongPressDuration:(double)a3;
- (void)setAssistiveTouchLongPressEnabled:(BOOL)a3;
- (void)setAssistiveTouchLongPressPauseScanningEnabled:(BOOL)a3;
- (void)setAssistiveTouchMainScreenCustomization:(id)a3;
- (void)setAssistiveTouchMotionTrackerConfigurable:(BOOL)a3;
- (void)setAssistiveTouchMotionTrackerShouldOffsetBufferPoints:(BOOL)a3;
- (void)setAssistiveTouchMotionTrackerSmoothingBufferSize:(unint64_t)a3;
- (void)setAssistiveTouchMotionTrackerSmoothingMaxDelta:(double)a3;
- (void)setAssistiveTouchMotionTrackerXNormalizationOffset:(double)a3;
- (void)setAssistiveTouchMotionTrackerXNormalizationOrder:(double)a3;
- (void)setAssistiveTouchMotionTrackerYNormalizationOffset:(double)a3;
- (void)setAssistiveTouchMotionTrackerYNormalizationOrder:(double)a3;
- (void)setAssistiveTouchMouseAllowAppleBluetoothDevicesPairing:(BOOL)a3;
- (void)setAssistiveTouchMouseAlwaysShowSoftwareKeyboardEnabled:(BOOL)a3;
- (void)setAssistiveTouchMouseBehavesLikeFinger:(BOOL)a3;
- (void)setAssistiveTouchMouseClickSoundsEnabled:(BOOL)a3;
- (void)setAssistiveTouchMouseDwellControlActivationTimeout:(double)a3;
- (void)setAssistiveTouchMouseDwellControlAutorevertAction:(id)a3;
- (void)setAssistiveTouchMouseDwellControlAutorevertEnabled:(BOOL)a3;
- (void)setAssistiveTouchMouseDwellControlCornerCustomization:(id)a3;
- (void)setAssistiveTouchMouseDwellControlEnabled:(BOOL)a3;
- (void)setAssistiveTouchMouseDwellControlMovementToleranceRadius:(double)a3;
- (void)setAssistiveTouchMouseDwellControlMutatedMenu:(BOOL)a3;
- (void)setAssistiveTouchMouseDwellControlShowPrompt:(BOOL)a3;
- (void)setAssistiveTouchMouseKeysDelay:(int64_t)a3;
- (void)setAssistiveTouchMouseKeysEnabled:(BOOL)a3;
- (void)setAssistiveTouchMouseKeysMaxSpeed:(int64_t)a3;
- (void)setAssistiveTouchMouseKeysOptionToggleEnabled:(BOOL)a3;
- (void)setAssistiveTouchMouseKeysUseMainKeyboardKeys:(BOOL)a3;
- (void)setAssistiveTouchMouseOnDeviceEyeTrackingCalibratedValues:(id)a3;
- (void)setAssistiveTouchMouseOnDeviceEyeTrackingCalibrationStrategy:(int64_t)a3;
- (void)setAssistiveTouchMouseOnDeviceEyeTrackingEnabled:(BOOL)a3;
- (void)setAssistiveTouchMouseOnDeviceEyeTrackingEnrollmentCompleted:(BOOL)a3;
- (void)setAssistiveTouchMouseOnDeviceEyeTrackingEnrollmentPointToGazePointMap:(id)a3;
- (void)setAssistiveTouchMouseOnDeviceEyeTrackingOnboardingCompleted:(BOOL)a3;
- (void)setAssistiveTouchMouseOnDeviceEyeTrackingShouldShowUncalibratedPoints:(BOOL)a3;
- (void)setAssistiveTouchMousePointerColor:(int64_t)a3;
- (void)setAssistiveTouchMousePointerSizeMultiplier:(double)a3;
- (void)setAssistiveTouchMousePointerTimeout:(double)a3;
- (void)setAssistiveTouchMousePointerTimeoutEnabled:(BOOL)a3;
- (void)setAssistiveTouchMouseZoomPanningStyle:(unint64_t)a3;
- (void)setAssistiveTouchOnDeviceEyeTrackingAutoHideEnabled:(BOOL)a3;
- (void)setAssistiveTouchOnDeviceEyeTrackingAutoHideOpacity:(double)a3;
- (void)setAssistiveTouchOnDeviceEyeTrackingAutoHideTimeout:(double)a3;
- (void)setAssistiveTouchOnDeviceEyeTrackingShouldOffsetBufferPoints:(BOOL)a3;
- (void)setAssistiveTouchOnDeviceEyeTrackingShouldUseGaussianBlur:(BOOL)a3;
- (void)setAssistiveTouchOnDeviceEyeTrackingShouldUseMotionFilter:(BOOL)a3;
- (void)setAssistiveTouchOnDeviceEyeTrackingShouldUseWeightedAverages:(BOOL)a3;
- (void)setAssistiveTouchOnDeviceEyeTrackingSmoothingBufferSize:(unint64_t)a3;
- (void)setAssistiveTouchOpenMenuSwaggleEnabled:(BOOL)a3;
- (void)setAssistiveTouchOrbAction:(id)a3;
- (void)setAssistiveTouchPreferredPointPicker:(int64_t)a3;
- (void)setAssistiveTouchRecentGestures:(id)a3;
- (void)setAssistiveTouchSavedGestures:(id)a3;
- (void)setAssistiveTouchScanCycles:(int64_t)a3;
- (void)setAssistiveTouchScanTimeout:(double)a3;
- (void)setAssistiveTouchScanTimeoutEnabled:(BOOL)a3;
- (void)setAssistiveTouchScannerAddedTripleClickAutomatically:(BOOL)a3;
- (void)setAssistiveTouchScannerCompactMenuEnabled:(BOOL)a3;
- (void)setAssistiveTouchScannerCursorHighVisibilityEnabled:(BOOL)a3;
- (void)setAssistiveTouchScannerMenuLabelsEnabled:(BOOL)a3;
- (void)setAssistiveTouchScannerPrefersCompact:(BOOL)a3 forLanguage:(id)a4;
- (void)setAssistiveTouchScannerSoundEnabled:(BOOL)a3;
- (void)setAssistiveTouchScannerSpeechRate:(double)a3;
- (void)setAssistiveTouchScanningMode:(int64_t)a3;
- (void)setAssistiveTouchShouldUseExtendedKeyboardPredictions:(BOOL)a3;
- (void)setAssistiveTouchSingleTapAction:(id)a3;
- (void)setAssistiveTouchSleepOnWristDownPreference:(BOOL)a3;
- (void)setAssistiveTouchSpeed:(double)a3;
- (void)setAssistiveTouchStepInterval:(double)a3;
- (void)setAssistiveTouchSwitchUsageConfirmed:(BOOL)a3;
- (void)setAssistiveTouchSwitches:(id)a3;
- (void)setAssistiveTouchUIEnabled:(BOOL)a3;
- (void)setAssistiveTouchUsageCount:(id)a3;
- (void)setAssistiveTouchVirtualTrackpadBorderColor:(int64_t)a3;
- (void)setAssistiveTouchVirtualTrackpadBorderOpacity:(double)a3;
- (void)setAssistiveTouchVirtualTrackpadBorderWidth:(double)a3;
- (void)setAssistiveTouchVirtualTrackpadEnabled:(BOOL)a3;
- (void)setAssistiveTouchVirtualTrackpadFadeDelay:(double)a3;
- (void)setAssistiveTouchVirtualTrackpadFullScreenToggleEnabled:(BOOL)a3;
- (void)setAssistiveTouchVirtualTrackpadHoldDuration:(double)a3;
- (void)setAssistiveTouchVirtualTrackpadInnerColor:(int64_t)a3;
- (void)setAssistiveTouchVirtualTrackpadInnerOpacity:(double)a3;
- (void)setAssistiveTouchVirtualTrackpadScrollSpeed:(double)a3;
- (void)setAssistiveTouchVirtualTrackpadScrollToggleEnabled:(BOOL)a3;
- (void)setAssistiveTouchVirtualTrackpadSpeed:(double)a3;
- (void)setAudioLeftRightBalance:(double)a3;
- (void)setAudiogramIngestionLastModelAccess:(double)a3;
- (void)setAutomaticAccessibilityEnabled:(BOOL)a3;
- (void)setAutomaticAccessibilityIgnoreAppAccessibilityPreferred:(BOOL)a3;
- (void)setAutomaticAccessibilityMode:(int64_t)a3 forBundleIdentifier:(id)a4;
- (void)setAutomaticAccessibilityModes:(id)a3;
- (void)setAutomaticAccessibilityVisualizationsEnabled:(BOOL)a3;
- (void)setAutomationEnabled:(BOOL)a3;
- (void)setAutomationFauxCollectionViewCellsEnabled:(BOOL)a3;
- (void)setAutomationFauxTableViewCellsEnabled:(BOOL)a3;
- (void)setAutomationHitpointWarpingEnabled:(BOOL)a3;
- (void)setAutomationLocalizedStringLookupInfoEnabled:(BOOL)a3;
- (void)setAutomationTrueTouch:(BOOL)a3;
- (void)setBackTapDoubleTapAction:(id)a3;
- (void)setBackTapEnabled:(BOOL)a3;
- (void)setBackTapFalsePositiveAlertsEnabled:(BOOL)a3;
- (void)setBackTapRNNModelEnabled:(BOOL)a3;
- (void)setBackTapTripleTapAction:(id)a3;
- (void)setBackTapUsageCount:(int64_t)a3;
- (void)setBrokenHomeButtonCount:(int64_t)a3;
- (void)setButtonShapesEnabled:(BOOL)a3;
- (void)setCallAudioRoutingAutoAnswerDelay:(double)a3;
- (void)setCallAudioRoutingAutoAnswerEnabled:(BOOL)a3;
- (void)setCameraButtonSensitivity:(double)a3;
- (void)setCharacterFeedbackDelayDuration:(double)a3;
- (void)setCharacterVoicesUsageCount:(int64_t)a3;
- (void)setClassicInvertColors:(BOOL)a3;
- (void)setCustomPronunciationSubstitutions:(id)a3;
- (void)setCustomSettingsForVoice:(id)a3 sourceKey:(id)a4 settings:(id)a5;
- (void)setDefaultVoiceSelection:(id)a3 languageID:(id)a4 rate:(id)a5 pitch:(id)a6 volume:(id)a7;
- (void)setDidResetD22Preferences:(BOOL)a3;
- (void)setDidTriggerSOSToday:(BOOL)a3;
- (void)setDockSize:(double)a3;
- (void)setEnableHearingAidReporter:(BOOL)a3;
- (void)setEnableVoiceOverCaptions:(BOOL)a3;
- (void)setEnabledLiveRecognitionModes:(id)a3;
- (void)setEnhanceBackgroundContrastEnabled:(BOOL)a3;
- (void)setEnhanceTextLegibilityEnabled:(BOOL)a3;
- (void)setEnhanceTextTrackingEnabled:(BOOL)a3;
- (void)setFullKeyboardAccessCommandMapData:(id)a3;
- (void)setFullKeyboardAccessFocusRingColor:(int64_t)a3;
- (void)setFullKeyboardAccessFocusRingHighContrastEnabled:(BOOL)a3;
- (void)setFullKeyboardAccessFocusRingTimeout:(double)a3;
- (void)setFullKeyboardAccessFocusRingTimeoutEnabled:(BOOL)a3;
- (void)setFullKeyboardAccessLargeFocusRingEnabled:(BOOL)a3;
- (void)setFullKeyboardAccessShouldShowDebugKeyCommandsView:(BOOL)a3;
- (void)setFullKeyboardAccessShouldShowTextEditingModeInstructions:(BOOL)a3;
- (void)setGaxInternalSettingsActiveAppID:(id)a3;
- (void)setGaxInternalSettingsActiveAppOrientation:(id)a3;
- (void)setGaxInternalSettingsECID:(id)a3;
- (void)setGaxInternalSettingsIsActiveAppSelfLocked:(BOOL)a3;
- (void)setGaxInternalSettingsLastActivationDate:(id)a3;
- (void)setGaxInternalSettingsLastPasscodeSetDate:(id)a3;
- (void)setGaxInternalSettingsProductBuildVersion:(id)a3;
- (void)setGaxInternalSettingsSavedAccessibilityFeatures:(id)a3;
- (void)setGaxInternalSettingsSavedAccessibilityTripleClickOptions:(id)a3;
- (void)setGaxInternalSettingsSystemDidRestartDueToLowBattery:(BOOL)a3;
- (void)setGaxInternalSettingsTimeRestrictionHasExpired:(BOOL)a3;
- (void)setGaxInternalSettingsUserAppProfile:(id)a3;
- (void)setGaxInternalSettingsUserConfiguredAppIDs:(id)a3;
- (void)setGaxInternalSettingsUserGlobalProfile:(id)a3;
- (void)setGizmoApplicationAccessibilityEnabled:(BOOL)a3;
- (void)setGuestsShouldInheritPrimaryUserPreferences:(BOOL)a3;
- (void)setGuidedAccessAXFeaturesEnabled:(BOOL)a3;
- (void)setGuidedAccessAllowsUnlockWithTouchID:(BOOL)a3;
- (void)setGuidedAccessAutoLockTimeInSeconds:(int64_t)a3;
- (void)setGuidedAccessDisallowDirectInactiveToActiveTransition:(BOOL)a3;
- (void)setGuidedAccessEnableExperimentalUI:(BOOL)a3;
- (void)setGuidedAccessOverrideTimeRestrictionDuration:(id)a3;
- (void)setGuidedAccessShouldSpeakForTimeRestrictionEvents:(BOOL)a3;
- (void)setGuidedAccessTimeLimitsUsageCount:(int64_t)a3;
- (void)setGuidedAccessToneIdentifierForTimeRestrictionEvents:(id)a3;
- (void)setGuidedAccessUsageCount:(int64_t)a3;
- (void)setGuidedAccessUserPrefersMirroringForExternalDisplays:(BOOL)a3;
- (void)setHapticMusicActive:(BOOL)a3;
- (void)setHapticMusicAlgorithmSelection:(id)a3;
- (void)setHapticMusicEnhancedPercussion:(BOOL)a3;
- (void)setHapticMusicEnhancedVocals:(BOOL)a3;
- (void)setHapticMusicToggledInPreferences:(BOOL)a3;
- (void)setHapticMusicTrackAvailable:(BOOL)a3;
- (void)setHapticMusicUsagePerDay:(double)a3;
- (void)setHapticMusicUsageStartDate:(id)a3;
- (void)setHearingAidControlPanelCount:(int64_t)a3;
- (void)setHearingAidHandOffCount:(int64_t)a3;
- (void)setHighContrastFocusIndicatorsEnabled:(BOOL)a3;
- (void)setHoverTextActivationLockEnabled:(BOOL)a3;
- (void)setHoverTextBackgroundColorData:(id)a3;
- (void)setHoverTextBackgroundOpacity:(double)a3;
- (void)setHoverTextBorderColorData:(id)a3;
- (void)setHoverTextContentSize:(id)a3;
- (void)setHoverTextDisplayMode:(int64_t)a3;
- (void)setHoverTextEnabled:(BOOL)a3;
- (void)setHoverTextFontName:(id)a3;
- (void)setHoverTextFontSize:(double)a3;
- (void)setHoverTextInsertionPointColorData:(id)a3;
- (void)setHoverTextPreferredActivatorKey:(int64_t)a3;
- (void)setHoverTextScrollingSpeed:(int64_t)a3;
- (void)setHoverTextShowedBanner:(BOOL)a3;
- (void)setHoverTextTextColorData:(id)a3;
- (void)setHoverTextTypingAutocorrectedTextColorData:(id)a3;
- (void)setHoverTextTypingBackgroundColorData:(id)a3;
- (void)setHoverTextTypingBorderColorData:(id)a3;
- (void)setHoverTextTypingDisplayMode:(int64_t)a3;
- (void)setHoverTextTypingEnabled:(BOOL)a3;
- (void)setHoverTextTypingFontName:(id)a3;
- (void)setHoverTextTypingInsertionPointColorData:(id)a3;
- (void)setHoverTextTypingMisspelledTextColorData:(id)a3;
- (void)setHoverTextTypingShowedBanner:(BOOL)a3;
- (void)setHoverTextTypingTextColorData:(id)a3;
- (void)setHoverTextTypingTextStyle:(id)a3;
- (void)setIgnoreAXAsserts:(BOOL)a3;
- (void)setIgnoreAXServerEntitlements:(BOOL)a3;
- (void)setIgnoreTrackpad:(BOOL)a3;
- (void)setImageCaptionGenderStrategy:(unint64_t)a3;
- (void)setImageCaptioningDisabledApps:(id)a3;
- (void)setIncludeBacktraceInLogs:(BOOL)a3;
- (void)setIncreaseButtonLegibilityEnabled:(BOOL)a3;
- (void)setIndependentHearingAidSettings:(BOOL)a3;
- (void)setInspectorEnabled:(BOOL)a3;
- (void)setInternalLoggingColorTheme:(int64_t)a3;
- (void)setIsAXValidationRunnerCollectingValidations:(BOOL)a3;
- (void)setLaserZoomPanningStyle:(unint64_t)a3;
- (void)setLastAssistiveTouchTimeResetCount:(double)a3;
- (void)setLastBrailleScreenInputTimeResetCount:(double)a3;
- (void)setLastCharacterVoiceTimeResetCount:(double)a3;
- (void)setLastGuidedAccessTimeLimitResetCount:(double)a3;
- (void)setLastGuidedAccessTimeResetCount:(double)a3;
- (void)setLastHearingAidControlPanelTimeResetCount:(double)a3;
- (void)setLastHearingAidHandoffTimeResetCount:(double)a3;
- (void)setLastMagnifierResetCount:(double)a3;
- (void)setLastPlatformSwitchTimeResetCount:(double)a3;
- (void)setLastSmartInvertColorsEnablement:(double)a3;
- (void)setLastTapticTimeResetCount:(double)a3;
- (void)setLeftRightBalanceEnabled:(BOOL)a3;
- (void)setLeftRightBalanceValue:(double)a3;
- (void)setLetterFeedbackEnabled:(BOOL)a3;
- (void)setLiveRecognitionActive:(BOOL)a3;
- (void)setLiveRecognitionOverlayOpen:(BOOL)a3;
- (void)setLiveRegionStatusForWebOrApp:(id)a3 status:(id)a4;
- (void)setLiveSpeechMaxRecentsCount:(int64_t)a3;
- (void)setLocalizationQACaptionMode:(BOOL)a3;
- (void)setLocalizationQACaptionShowFilePath:(BOOL)a3;
- (void)setLocalizationQACaptionShowLocalizedString:(BOOL)a3;
- (void)setLocalizationQACaptionShowUSString:(BOOL)a3;
- (void)setLogAXNotificationPosting:(BOOL)a3;
- (void)setMagnifierBrightness:(double)a3;
- (void)setMagnifierContrast:(double)a3;
- (void)setMagnifierEnabled:(BOOL)a3;
- (void)setMagnifierEnabled:(BOOL)a3 changeTripleClickMenu:(BOOL)a4;
- (void)setMagnifierFilterInverted:(BOOL)a3;
- (void)setMagnifierFilterSetIdentifier:(unint64_t)a3;
- (void)setMagnifierShouldAdjustFiltersForAmbientLight:(BOOL)a3;
- (void)setMagnifierShouldUseVideoStabilization:(BOOL)a3;
- (void)setMagnifierUsageCount:(int64_t)a3;
- (void)setMagnifierZoomLevel:(double)a3;
- (void)setMedicalPreamble:(id)a3;
- (void)setMonoAudioEnabled:(BOOL)a3;
- (void)setPerAppSettingsCustomizedAppIDs:(id)a3;
- (void)setPerAppSettingsStats:(id)a3;
- (void)setPhoneticFeedbackEnabled:(BOOL)a3;
- (void)setPreferredBrailleTableIdentifier:(id)a3 forKeyboardLanguage:(id)a4 keyboardLayout:(id)a5;
- (void)setQuickSpeakHighlightOption:(unint64_t)a3;
- (void)setQuickSpeakNubbitNormalizedPosition:(CGPoint)a3;
- (void)setQuickSpeakSentenceHighlightColor:(int64_t)a3;
- (void)setQuickSpeakSentenceHighlightOption:(unint64_t)a3;
- (void)setQuickSpeakSpeakingRate:(float)a3;
- (void)setQuickSpeakSpeakingRate:(float)a3 forLanguage:(id)a4;
- (void)setQuickSpeakUnderlineSentence:(BOOL)a3;
- (void)setQuickSpeakVolume:(float)a3;
- (void)setQuickSpeakWordHighlightColor:(int64_t)a3;
- (void)setQuickTypeWordFeedbackEnabled:(BOOL)a3;
- (void)setReachabilityEnabled:(BOOL)a3;
- (void)setReduceMotionAutoplayVideoPreviewsEnabled:(BOOL)a3;
- (void)setReduceMotionEnabled:(BOOL)a3;
- (void)setReduceWhitePointEnabled:(BOOL)a3;
- (void)setReduceWhitePointLevel:(float)a3;
- (void)setRemoteHandGestureCustomizedActions:(id)a3;
- (void)setSecurePayAssertionActive:(BOOL)a3;
- (void)setSelectedSpeechVoiceIdentifiersWithLanguageSource:(id)a3;
- (void)setShouldCaptureVisionEngineDiagnosticsToDisk:(BOOL)a3;
- (void)setShouldFlashForAlertInSilentMode:(BOOL)a3;
- (void)setShouldFlashWhileUnlocked:(BOOL)a3;
- (void)setShouldLimitDisplayRefreshRate:(BOOL)a3;
- (void)setShouldPerformValidationsAtRuntime:(BOOL)a3;
- (void)setShouldSpeakMedicalPreamble:(BOOL)a3;
- (void)setShouldStreamToLeftAid:(BOOL)a3;
- (void)setShouldStreamToRightAid:(BOOL)a3;
- (void)setShouldTTYMedicalPreamble:(BOOL)a3;
- (void)setShowSpeechController:(BOOL)a3;
- (void)setSiriAutoUpdateListInitialized:(BOOL)a3;
- (void)setSiriSemanticContextEnabled:(BOOL)a3;
- (void)setSkipHearingAidMFiAuth:(BOOL)a3;
- (void)setSoundActionsLastModelAccess:(double)a3;
- (void)setSoundDetectionLastModelAccess:(double)a3;
- (void)setSpeakCorrectionsEnabled:(BOOL)a3;
- (void)setSpeechControllerDoubleTapAction:(int64_t)a3;
- (void)setSpeechControllerIdleOpacity:(double)a3;
- (void)setSpeechControllerLongPressAction:(int64_t)a3;
- (void)setSpeechVoiceIdentifier:(id)a3 forLanguage:(id)a4 source:(int64_t)a5;
- (void)setSpeechVoiceIdentifier:(id)a3 forLanguage:(id)a4 sourceKey:(id)a5;
- (void)setSpokenContentDefaultFallbackLanguage:(id)a3;
- (void)setSpokenContentShouldUseLanguageDetection:(BOOL)a3;
- (void)setSpokenContentVoiceSelectionForLanguage:(id)a3 selection:(id)a4;
- (void)setStartupSoundEnabled:(BOOL)a3;
- (void)setStickyKeysBeepEnabled:(BOOL)a3;
- (void)setStickyKeysEnabled:(BOOL)a3;
- (void)setStickyKeysShiftToggleEnabled:(BOOL)a3;
- (void)setSupportsAdvancedDisplayFilters:(BOOL)a3;
- (void)setSwiftSettings:(id)a3;
- (void)setSwitchControlAutoTapTimeout:(double)a3;
- (void)setSwitchControlCameraPointPickerDwellActivationTimeout:(double)a3;
- (void)setSwitchControlCameraPointPickerDwellMovementToleranceRadius:(double)a3;
- (void)setSwitchControlCameraPointPickerMode:(unint64_t)a3;
- (void)setSwitchControlCameraPointPickerMovementToleranceInJoystickMode:(double)a3;
- (void)setSwitchControlCameraPointPickerSensitivity:(double)a3;
- (void)setSwitchControlCombinedTopLevelMenuItems:(id)a3;
- (void)setSwitchControlDebugLoggingEnabled:(BOOL)a3;
- (void)setSwitchControlDeviceMenuItems:(id)a3;
- (void)setSwitchControlDeviceTopLevelMenuItems:(id)a3;
- (void)setSwitchControlDwellTime:(double)a3;
- (void)setSwitchControlEnabled:(BOOL)a3;
- (void)setSwitchControlFirstLaunchScanningMode:(int64_t)a3;
- (void)setSwitchControlGesturesMenuItems:(id)a3;
- (void)setSwitchControlGesturesTopLevelMenuItems:(id)a3;
- (void)setSwitchControlIgnoreInvalidSwitchConfiguration:(BOOL)a3;
- (void)setSwitchControlIsEnabledAsReceiver:(BOOL)a3;
- (void)setSwitchControlLaunchRecipeUUID:(id)a3;
- (void)setSwitchControlMediaControlsMenuItems:(id)a3;
- (void)setSwitchControlMediaControlsTopLevelMenuItems:(id)a3;
- (void)setSwitchControlPlatformSwitchedCount:(int64_t)a3;
- (void)setSwitchControlPointPickerSelectionStyle:(int64_t)a3;
- (void)setSwitchControlRecipes:(id)a3;
- (void)setSwitchControlRestartScanningAtCurrentKey:(BOOL)a3;
- (void)setSwitchControlScanAfterTapLocation:(int64_t)a3;
- (void)setSwitchControlScanningStyle:(int64_t)a3;
- (void)setSwitchControlSettingsMenuItems:(id)a3;
- (void)setSwitchControlSettingsTopLevelMenuItems:(id)a3;
- (void)setSwitchControlShouldAlwaysActivateKeyboardKeys:(BOOL)a3;
- (void)setSwitchControlShouldDisallowUSBRestrictedMode:(BOOL)a3;
- (void)setSwitchControlShouldUseExtendedKeyboardPredictions:(BOOL)a3;
- (void)setSwitchControlShouldUseShortFirstPage:(BOOL)a3;
- (void)setSwitchControlTapBehavior:(int64_t)a3;
- (void)setSwitchControlTopLevelMenuItems:(id)a3;
- (void)setSwitchControlUseCameraForPointMode:(BOOL)a3;
- (void)setSwitchControlUserDidReadUSBRestrictedModeAlert:(BOOL)a3;
- (void)setSyncPronunciationsWithCloudKit:(BOOL)a3;
- (void)setTapToSpeakTimeAvailability:(int64_t)a3;
- (void)setTapToSpeakTimeEnabled:(BOOL)a3;
- (void)setTapticTimeInternalFlashScreenEnabled:(BOOL)a3;
- (void)setTapticTimeUsageCount:(int64_t)a3;
- (void)setTeachableMomentsDelayBeforeSending:(double)a3;
- (void)setTeachableMomentsNotificationsSeen:(id)a3;
- (void)setTouchAccommodationsAllowsSwipeGesturesToBypass:(BOOL)a3;
- (void)setTouchAccommodationsEnabled:(BOOL)a3;
- (void)setTouchAccommodationsHoldDuration:(double)a3;
- (void)setTouchAccommodationsHoldDurationAllowsSwipeGesturesToBypass:(BOOL)a3;
- (void)setTouchAccommodationsHoldDurationEnabled:(BOOL)a3;
- (void)setTouchAccommodationsIgnoreRepeatDuration:(double)a3;
- (void)setTouchAccommodationsIgnoreRepeatEnabled:(BOOL)a3;
- (void)setTouchAccommodationsSwipeGestureMinimumDistance:(double)a3;
- (void)setTouchAccommodationsTapActivationMethod:(int64_t)a3;
- (void)setTouchAccommodationsTapActivationTimeout:(double)a3;
- (void)setTouchAccommodationsTripleClickConfirmed:(BOOL)a3;
- (void)setTouchAccommodationsUsageConfirmed:(BOOL)a3;
- (void)setTripleClickOptions:(id)a3;
- (void)setTripleClickOrderedOptions:(id)a3;
- (void)setUseNewAXBundleLoader:(BOOL)a3;
- (void)setUserDidSelectVoiceForLanguage:(id)a3 sourceKey:(id)a4;
- (void)setValidateSecondPartyApps:(BOOL)a3;
- (void)setVoiceOverActionFeedbackFirstInListOnly:(BOOL)a3;
- (void)setVoiceOverActionsFeedback:(int64_t)a3;
- (void)setVoiceOverActivationWorkaround:(int64_t)a3;
- (void)setVoiceOverAdjustSoundVolumeIndependently:(BOOL)a3;
- (void)setVoiceOverAlternativeVoiceIdentifier:(id)a3 forLanguage:(id)a4;
- (void)setVoiceOverAlwaysTurnOnBluetooth:(BOOL)a3;
- (void)setVoiceOverAlwaysUseNemethCodeForMathEnabled:(BOOL)a3;
- (void)setVoiceOverAudioDuckingEnabled:(BOOL)a3;
- (void)setVoiceOverAudioFollowsHDMIAudio:(BOOL)a3;
- (void)setVoiceOverAutomaticButtonLabels:(BOOL)a3;
- (void)setVoiceOverBSIUsageCount:(int64_t)a3;
- (void)setVoiceOverBannerNotificationOutput:(int64_t)a3;
- (void)setVoiceOverBrailleAlertDisplayDuration:(double)a3;
- (void)setVoiceOverBrailleAlertShowUntilDismissed:(BOOL)a3;
- (void)setVoiceOverBrailleAlertsEnabled:(BOOL)a3;
- (void)setVoiceOverBrailleAutoAdvanceDuration:(double)a3;
- (void)setVoiceOverBrailleBluetoothDisplay:(id)a3;
- (void)setVoiceOverBrailleContractionMode:(int64_t)a3;
- (void)setVoiceOverBrailleDisconnectOnSleep:(id)a3;
- (void)setVoiceOverBrailleDisplays:(id)a3;
- (void)setVoiceOverBrailleEightDotMode:(BOOL)a3;
- (void)setVoiceOverBrailleFormattingEnabled:(BOOL)a3;
- (void)setVoiceOverBrailleGesturesTypingFeedback:(int64_t)a3;
- (void)setVoiceOverBrailleGradeTwoAutoTranslateEnabled:(BOOL)a3;
- (void)setVoiceOverBrailleKeyDebounceTimeout:(double)a3;
- (void)setVoiceOverBrailleLanguageRotorItems:(id)a3;
- (void)setVoiceOverBrailleMasterStatusCellIndex:(int64_t)a3;
- (void)setVoiceOverBrailleStatusCellPreference:(int64_t)a3;
- (void)setVoiceOverBrailleTableIdentifier:(id)a3;
- (void)setVoiceOverBrailleVirtualStatusAlignment:(int64_t)a3;
- (void)setVoiceOverBrailleWordWrapEnabled:(BOOL)a3;
- (void)setVoiceOverCapitalLetterFeedback:(int64_t)a3;
- (void)setVoiceOverContainerOutputFeedback:(int64_t)a3;
- (void)setVoiceOverCustomCommandProfile:(id)a3;
- (void)setVoiceOverDelayUntilSpeakUnderTouch:(double)a3;
- (void)setVoiceOverDeletionFeedback:(int64_t)a3;
- (void)setVoiceOverDescribedMedia:(int64_t)a3;
- (void)setVoiceOverDetectionModeItems:(id)a3;
- (void)setVoiceOverDirectTouchEnabledApps:(id)a3;
- (void)setVoiceOverDiscoveredSensitiveContentFeedback:(int64_t)a3;
- (void)setVoiceOverDoubleTapInterval:(double)a3;
- (void)setVoiceOverEditAppsActionEnabled:(BOOL)a3;
- (void)setVoiceOverEffectiveSpeakingRate:(float)a3;
- (void)setVoiceOverEffectiveSpeakingVolume:(float)a3;
- (void)setVoiceOverEnabled:(BOOL)a3;
- (void)setVoiceOverEnabledThroughAccessory:(BOOL)a3;
- (void)setVoiceOverExploreFocusAffectsNativeFocus:(BOOL)a3;
- (void)setVoiceOverFlashlightNotificationsEnabled:(BOOL)a3;
- (void)setVoiceOverHandGesturesActionCustomizations:(id)a3;
- (void)setVoiceOverHandGesturesEnabled:(BOOL)a3;
- (void)setVoiceOverHandwritingWasNativeAutocorrectEnabled:(id)a3;
- (void)setVoiceOverHapticIntensity:(double)a3;
- (void)setVoiceOverHapticsEnabled:(BOOL)a3;
- (void)setVoiceOverHardwareTypingFeedback:(int64_t)a3;
- (void)setVoiceOverHelpMode:(int64_t)a3;
- (void)setVoiceOverHintsEnabled:(BOOL)a3;
- (void)setVoiceOverIgnoreTrackpad:(BOOL)a3;
- (void)setVoiceOverInlineTextCompletionAppearanceFeedback:(int64_t)a3;
- (void)setVoiceOverInlineTextCompletionInsertionFeedback:(int64_t)a3;
- (void)setVoiceOverKeyboardModifierChoice:(int64_t)a3;
- (void)setVoiceOverLanguageRotorItems:(id)a3;
- (void)setVoiceOverLinkFeedback:(int64_t)a3;
- (void)setVoiceOverLockedScreenNotificationOutput:(int64_t)a3;
- (void)setVoiceOverMediaDuckingAmount:(double)a3;
- (void)setVoiceOverMediaDuckingMode:(int64_t)a3;
- (void)setVoiceOverMoreContentOutputFeedback:(int64_t)a3;
- (void)setVoiceOverNavigateImagesOption:(int64_t)a3;
- (void)setVoiceOverNavigationDirectionMode:(int64_t)a3;
- (void)setVoiceOverNavigationStyle:(int64_t)a3;
- (void)setVoiceOverNeuralElementFeedback:(int64_t)a3;
- (void)setVoiceOverNumberFeedback:(int64_t)a3;
- (void)setVoiceOverPhoneticsFeedback:(int64_t)a3;
- (void)setVoiceOverPitch:(double)a3;
- (void)setVoiceOverPreferredTVInteractionMode:(int64_t)a3;
- (void)setVoiceOverPrefersFollowFocusNavigationStyle:(BOOL)a3;
- (void)setVoiceOverPunctuationGroup:(id)a3;
- (void)setVoiceOverPunctuationLevel:(int64_t)a3;
- (void)setVoiceOverQuickNavAnnouncementFeedback:(int64_t)a3;
- (void)setVoiceOverQuickSettingsItems:(id)a3;
- (void)setVoiceOverRotorItems:(id)a3;
- (void)setVoiceOverRotorSummaryFeedback:(int64_t)a3;
- (void)setVoiceOverRotorUpdatesWithElement:(BOOL)a3;
- (void)setVoiceOverSceneDescriptionsEnabled:(BOOL)a3;
- (void)setVoiceOverScreenCurtainEnabled:(BOOL)a3;
- (void)setVoiceOverSelectedActivity:(id)a3;
- (void)setVoiceOverShouldDisallowUSBRestrictedMode:(BOOL)a3;
- (void)setVoiceOverShouldFocusEverywhere:(BOOL)a3;
- (void)setVoiceOverShouldOutputToHearingAid:(BOOL)a3;
- (void)setVoiceOverShouldSpeakDiscoveredText:(BOOL)a3;
- (void)setVoiceOverShowSoftwareKeyboardWithBraille:(BOOL)a3;
- (void)setVoiceOverSilenceAnnouncements:(BOOL)a3;
- (void)setVoiceOverSleepOnWristDownPreference:(BOOL)a3;
- (void)setVoiceOverSoftwareTypingFeedback:(int64_t)a3;
- (void)setVoiceOverSoundAndHapticPreferences:(id)a3;
- (void)setVoiceOverSoundCurtain:(BOOL)a3;
- (void)setVoiceOverSoundEffectsEnabled:(BOOL)a3;
- (void)setVoiceOverSoundVolume:(double)a3;
- (void)setVoiceOverSpeakActionConfirmation:(BOOL)a3;
- (void)setVoiceOverSpeakNonfocusableElementsAfterDelay:(BOOL)a3;
- (void)setVoiceOverSpeakNotificationsEnabled:(BOOL)a3;
- (void)setVoiceOverSpeakSecondsEncoding:(int64_t)a3;
- (void)setVoiceOverSpeakTableColumnRowInformation:(BOOL)a3;
- (void)setVoiceOverSpeakTableHeaders:(BOOL)a3;
- (void)setVoiceOverSpeakingRate:(float)a3;
- (void)setVoiceOverSpeakingRate:(float)a3 forLanguage:(id)a4;
- (void)setVoiceOverSpeakingRateInRotorEnabled:(BOOL)a3;
- (void)setVoiceOverSpeaksOverTelephoneCalls:(BOOL)a3;
- (void)setVoiceOverTapticChimesAvailability:(int64_t)a3;
- (void)setVoiceOverTapticChimesEnabled:(BOOL)a3;
- (void)setVoiceOverTapticChimesFrequencyEncoding:(int64_t)a3;
- (void)setVoiceOverTapticChimesSoundType:(int64_t)a3;
- (void)setVoiceOverTapticTimeEncoding:(int64_t)a3;
- (void)setVoiceOverTapticTimeMode:(BOOL)a3;
- (void)setVoiceOverTapticTimeSpeed:(float)a3;
- (void)setVoiceOverTouchBrailleGestureControl:(BOOL)a3;
- (void)setVoiceOverTouchBrailleGesturesDidPlayCalibrationHint:(BOOL)a3;
- (void)setVoiceOverTouchBrailleGesturesLockedOrientation:(int64_t)a3;
- (void)setVoiceOverTouchBrailleGesturesLockedTypingMode:(int64_t)a3;
- (void)setVoiceOverTouchBrailleGesturesShouldUseLockedConfiguration:(BOOL)a3;
- (void)setVoiceOverTouchBrailleShouldReverseDots:(BOOL)a3;
- (void)setVoiceOverTouchBrailleShowGeneralStatus:(BOOL)a3;
- (void)setVoiceOverTouchBrailleShowTextStyleStatus:(BOOL)a3;
- (void)setVoiceOverTouchBrailleTableIdentifier:(id)a3;
- (void)setVoiceOverTouchPreferredBrailleTableIdentifiers:(id)a3;
- (void)setVoiceOverTouchSingleLetterQuickNavEnabled:(BOOL)a3;
- (void)setVoiceOverTouchUpdateBrailleWithoutConnectedDisplay:(BOOL)a3;
- (void)setVoiceOverTypingMode:(int64_t)a3;
- (void)setVoiceOverUIEnabled:(BOOL)a3;
- (void)setVoiceOverUsageConfirmed:(BOOL)a3;
- (void)setVoiceOverUseRingerSwitchToControlNotificationOutput:(BOOL)a3;
- (void)setVoiceOverUserDidReadUSBRestrictedModeAlert:(BOOL)a3;
- (void)setVoiceOverVerbosityEmojiFeedback:(int64_t)a3;
- (void)setVoiceOverVerbosityEmojiSuffixEnabled:(BOOL)a3;
- (void)setVoiceOverVerbositySpeakCustomActionsHint:(BOOL)a3;
- (void)setVoiceOverVolume:(float)a3;
- (void)setWordFeedbackEnabled:(BOOL)a3;
- (void)setWriteAXLogsToFile:(BOOL)a3;
- (void)setZoomAdjustZoomLevelKbShortcutEnabled:(BOOL)a3;
- (void)setZoomAlwaysUseWindowedZoomForTyping:(BOOL)a3;
- (void)setZoomAutopannerShouldPanWithAcceleration:(BOOL)a3;
- (void)setZoomControllerColor:(int64_t)a3;
- (void)setZoomCurrentLensEffect:(id)a3;
- (void)setZoomCurrentLensMode:(id)a3;
- (void)setZoomDebugDisableZoomLensScaleTransform:(BOOL)a3;
- (void)setZoomDebugShowExternalFocusRect:(BOOL)a3;
- (void)setZoomEnabled:(BOOL)a3;
- (void)setZoomHandGesturesActionCustomizations:(id)a3;
- (void)setZoomHandGesturesEnabled:(BOOL)a3;
- (void)setZoomIdleSlugOpacity:(double)a3;
- (void)setZoomInStandby:(BOOL)a3;
- (void)setZoomKeyboardShortcutsEnabled:(BOOL)a3;
- (void)setZoomPanOffset:(CGPoint)a3;
- (void)setZoomPanZoomKbShortcutEnabled:(BOOL)a3;
- (void)setZoomPeekZoomEnabled:(BOOL)a3;
- (void)setZoomPeekZoomEverEnabled:(BOOL)a3;
- (void)setZoomPreferencesWereInitialized:(BOOL)a3;
- (void)setZoomPreferredCurrentDockPosition:(id)a3;
- (void)setZoomPreferredCurrentLensMode:(id)a3;
- (void)setZoomPreferredDockPositions:(id)a3;
- (void)setZoomPreferredLensModes:(id)a3;
- (void)setZoomPreferredMaximumZoomScale:(double)a3;
- (void)setZoomResizeZoomWindowKbShortcutEnabled:(BOOL)a3;
- (void)setZoomScale:(double)a3;
- (void)setZoomScrollWheelKbShortcutEnabled:(BOOL)a3;
- (void)setZoomShouldAllowFullscreenAutopanning:(BOOL)a3;
- (void)setZoomShouldFollowFocus:(BOOL)a3;
- (void)setZoomShouldShowSlug:(BOOL)a3;
- (void)setZoomShowWhileMirroring:(BOOL)a3;
- (void)setZoomShowedBanner:(BOOL)a3;
- (void)setZoomSlugDoubleTapAction:(int64_t)a3;
- (void)setZoomSlugNormalizedPosition:(CGPoint)a3;
- (void)setZoomSlugSingleTapAction:(int64_t)a3;
- (void)setZoomSlugTapAndSlideToAdjustZoomLevelEnabled:(BOOL)a3;
- (void)setZoomSlugTripleTapAction:(int64_t)a3;
- (void)setZoomSmoothScalingEnabled:(BOOL)a3;
- (void)setZoomSwitchZoomModeKbShortcutEnabled:(BOOL)a3;
- (void)setZoomTempToggleZoomKbShortcutEnabled:(BOOL)a3;
- (void)setZoomToggleZoomKbShortcutEnabled:(BOOL)a3;
- (void)setZoomToggledByPreferenceSwitch:(BOOL)a3;
- (void)setZoomToggledByVoiceOver:(BOOL)a3;
- (void)setZoomTrackpadGestureEnabled:(BOOL)a3;
- (void)setZoomWindowFrame:(CGRect)a3;
- (void)setlastGuidedAccessTimeLimitResetCount:(double)a3;
- (void)setlastGuidedAccessTimeResetCount:(double)a3;
- (void)setlastHearingAidControlPanelTimeResetCount:(double)a3;
- (void)setlastHearingAidHandoffTimeResetCount:(double)a3;
- (void)setlastPlatformSwitchTimeResetCount:(double)a3;
- (void)setliveSpeechMaxRecentsCount:(int64_t)a3;
- (void)updateCustomizableMouse:(id)a3;
- (void)updateSmoothingBufferSize:(id)a3 forEyeTracker:(id)a4;
- (void)updateWithManagedAssetsRepresentation:(id)a3;
- (void)voiceOverResetSoundAndHapticPreferences;
- (void)voiceOverSetHapticEnabled:(BOOL)a3 forEvent:(id)a4;
- (void)voiceOverSetSoundEnabled:(BOOL)a3 forEvent:(id)a4;
- (void)zoomUserHadLegacyZoomEnabled:(BOOL *)a3 wasZoomedIn:(BOOL *)a4 withScale:(double *)a5;
@end

@implementation AXSettings

- (id)keysToIgnoreDuringBuddyTransfer
{
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"AllCachedAvailableResourcesKey", @"TTSSynthesisProviderCachedComponentsKey", @"AXSVoiceOverActivitiesPreference", @"VoiceOverCustomCammndProfile", @"GizmoAutoSpeakComplicationsPreference", @"AssistiveTouchRecentGestures", @"AssistiveTouchSavedGestures", 0);

  return v2;
}

- (id)domainNameForPreferenceKey:(id)a3
{
  unint64_t v4 = [(AXSettings *)self _domainForPreferenceKey:a3];

  return [(AXSettings *)self _domainNameForDomain:v4];
}

- (id)allDomainNamesForPreferenceKey:(id)a3
{
  unint64_t v4 = (void *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  v6 = [v4 array];
  unint64_t v7 = [(AXSettings *)self _domainForPreferenceKey:v5];

  v8 = [(AXSettings *)self _domainNameForDomain:v7];
  [v6 axSafelyAddObject:v8];

  return v6;
}

- (unint64_t)_domainForPreferenceKey:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [(id)PreferenceKeyToDomainMap objectForKey:v3];
  uint64_t v9 = MEMORY[0x1E4F143A8];
  v10 = v4;
  v11 = v3;
  id v5 = v3;
  id v6 = v4;
  AXPerformBlockAsynchronouslyOnMainThread();
  unint64_t v7 = (int)objc_msgSend(v6, "intValue", v9, 3221225472, __38__AXSettings__domainForPreferenceKey___block_invoke, &unk_1E5586470);

  return v7;
}

uint64_t __38__AXSettings__domainForPreferenceKey___block_invoke(uint64_t result)
{
  if (!*(void *)(result + 32)) {
    return _AXAssert();
  }
  return result;
}

- (id)preferenceKeyForSelector:(SEL)a3
{
  id v3 = (void *)SelectorToPreferenceKeyMap;
  unint64_t v4 = NSStringFromSelector(a3);
  id v5 = [v3 objectForKey:v4];

  return v5;
}

- (__CFString)_domainNameForDomain:(unint64_t)a3
{
  switch(a3)
  {
    case 1uLL:
    case 6uLL:
      id v5 = (const void *)AXCPCopySharedResourcesPreferencesDomainForDomain();
      return (__CFString *)CFAutorelease(v5);
    case 2uLL:
      unint64_t v4 = (__CFString **)MEMORY[0x1E4FB9380];
      goto LABEL_19;
    case 3uLL:
      unint64_t v4 = (__CFString **)MEMORY[0x1E4FB93A8];
      goto LABEL_19;
    case 4uLL:
      unint64_t v4 = (__CFString **)MEMORY[0x1E4FB9098];
      goto LABEL_19;
    case 5uLL:
      unint64_t v4 = (__CFString **)MEMORY[0x1E4FB9170];
      goto LABEL_19;
    case 7uLL:
      unint64_t v4 = (__CFString **)MEMORY[0x1E4FB9198];
      goto LABEL_19;
    case 8uLL:
      unint64_t v4 = (__CFString **)MEMORY[0x1E4FB92C8];
      goto LABEL_19;
    case 9uLL:
      unint64_t v4 = (__CFString **)MEMORY[0x1E4FB9338];
      goto LABEL_19;
    case 0xAuLL:
      unint64_t v4 = (__CFString **)MEMORY[0x1E4FB9310];
      goto LABEL_19;
    case 0xBuLL:
      unint64_t v4 = (__CFString **)MEMORY[0x1E4FB9208];
      goto LABEL_19;
    case 0xCuLL:
      unint64_t v4 = (__CFString **)MEMORY[0x1E4FB9300];
      goto LABEL_19;
    case 0xDuLL:
      unint64_t v4 = (__CFString **)MEMORY[0x1E4FB9370];
      goto LABEL_19;
    case 0xEuLL:
      unint64_t v4 = (__CFString **)MEMORY[0x1E4FB9150];
      goto LABEL_19;
    case 0xFuLL:
      unint64_t v4 = (__CFString **)MEMORY[0x1E4FB8FE8];
LABEL_19:
      result = *v4;
      break;
    default:
      id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
      _AXAssert();

      result = 0;
      break;
  }
  return result;
}

- (id)_migratePreferenceIfNecessary:(id)a3
{
  unint64_t v4 = (__CFString *)a3;
  id v5 = [(AXSettings *)self _domainNameForDomain:1];
  id v6 = (void *)CFPreferencesCopyAppValue(v4, v5);
  if (v6)
  {
    [(AXBaseSettings *)self setValue:v6 forPreferenceKey:v4];
    CFPreferencesSetAppValue(v4, 0, v5);
  }

  return v6;
}

- (id)valueForPreferenceKey:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AXSettings;
  id v5 = [(AXBaseSettings *)&v9 valueForPreferenceKey:v4];
  unint64_t v6 = [(AXSettings *)self _domainForPreferenceKey:v4];
  if (v5) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = v6 == 1;
  }
  if (!v7)
  {
    id v5 = [(AXSettings *)self _migratePreferenceIfNecessary:v4];
  }

  return v5;
}

+ (AXSettings)sharedInstance
{
  if (sharedInstance_onceToken_5 != -1) {
    dispatch_once(&sharedInstance_onceToken_5, &__block_literal_global_35);
  }
  v2 = (void *)sharedInstance_settings;

  return (AXSettings *)v2;
}

uint64_t __28__AXSettings_sharedInstance__block_invoke(uint64_t a1, uint64_t a2)
{
  InitializeMaps(a1, a2);
  v2 = objc_alloc_init(AXSettings);
  uint64_t v3 = sharedInstance_settings;
  sharedInstance_settings = (uint64_t)v2;

  return MEMORY[0x1F41817F8](v2, v3);
}

- (AXSettings)init
{
  v6.receiver = self;
  v6.super_class = (Class)AXSettings;
  v2 = [(AXBaseSettings *)&v6 init];
  if (v2)
  {
    uint64_t v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    unarchivedVoiceCache = v2->_unarchivedVoiceCache;
    v2->_unarchivedVoiceCache = v3;
  }
  [(AXSettings *)v2 _listenForAccessibilitySupportPassthroughs];
  return v2;
}

- (AXPreferences)swiftSettings
{
  swiftSettings = self->_swiftSettings;
  if (!swiftSettings)
  {
    id v4 = objc_alloc_init(AXPreferences);
    id v5 = self->_swiftSettings;
    self->_swiftSettings = v4;

    swiftSettings = self->_swiftSettings;
  }

  return swiftSettings;
}

- (void)nukeAll
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v5[2] = xmmword_18D430878;
  v5[3] = unk_18D430888;
  v5[4] = xmmword_18D430898;
  v5[5] = unk_18D4308A8;
  v5[0] = xmmword_18D430858;
  v5[1] = unk_18D430868;
  uint64_t v6 = 12;
  uint64_t v3 = AXLogSettings();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_18D308000, v3, OS_LOG_TYPE_INFO, "nuking all AX settings!", v4, 2u);
  }

  [(AXSettings *)self nukePrefsForDomains:v5 numDomains:13];
}

- (void)nukePrefsForDomains:(unint64_t *)a3 numDomains:(unint64_t)a4
{
  if (a4)
  {
    uint64_t v7 = 0;
    CFStringRef v8 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
    CFStringRef v9 = (const __CFString *)*MEMORY[0x1E4F1D3E0];
    CFStringRef v10 = (const __CFString *)*MEMORY[0x1E4F1D3D8];
    do
    {
      v11 = [(AXSettings *)self _domainNameForDomain:a3[v7]];
      CFArrayRef v12 = CFPreferencesCopyKeyList(v11, v8, v9);
      if (v12)
      {
        CFArrayRef v13 = v12;
        CFPreferencesSetMultiple(0, v12, v11, v8, v10);
        CFIndex Count = CFArrayGetCount(v13);
        if (Count >= 1)
        {
          CFIndex v15 = Count;
          for (CFIndex i = 0; i != v15; ++i)
          {
            ValueAtIndex = CFArrayGetValueAtIndex(v13, i);
            if (ValueAtIndex) {
              [(AXBaseSettings *)self postNotificationForPreferenceKey:ValueAtIndex];
            }
          }
        }
        CFRelease(v13);
      }
      ++v7;
    }
    while (v7 != a4);
  }
}

- (void)_listenForAccessibilitySupportPassthroughs
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFStringRef v4 = (const __CFString *)*MEMORY[0x1E4FB91D8];

  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_accessibilitySupportSettingDidChange, v4, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)_handleVoiceUnarchivedCache:(id)a3
{
  id v5 = a3;
  CFStringRef v4 = self->_unarchivedVoiceCache;
  objc_sync_enter(v4);
  [(NSMutableDictionary *)self->_unarchivedVoiceCache removeObjectForKey:v5];
  objc_sync_exit(v4);
}

- (BOOL)laserEnabled
{
  return 1;
}

- (unint64_t)laserZoomPanningStyle
{
  return AXSettingsReturnIntegerValue(@"LaserZoomPanningStyle", *MEMORY[0x1E4F487A0]);
}

- (void)setLaserZoomPanningStyle:(unint64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"LaserZoomPanningStyle"];
}

- (void)setAssistiveTouchAlwaysShowMenuEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AssistiveTouchAlwaysShowMenu"];
}

- (BOOL)assistiveTouchAlwaysShowMenuEnabled
{
  return AXSettingsReturnBoolValue(@"AssistiveTouchAlwaysShowMenu", 1);
}

- (void)setSupportsAdvancedDisplayFilters:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"kAXSupportsAdvancedDisplayFiltersPreference"];
}

- (BOOL)supportsAdvancedDisplayFilters
{
  return AXSettingsReturnBoolValue(@"kAXSupportsAdvancedDisplayFiltersPreference", 0);
}

- (void)setAssistiveTouchOpenMenuSwaggleEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AssistiveTouchOpenMenuSwaggle"];
}

- (BOOL)assistiveTouchOpenMenuSwaggleEnabled
{
  return AXSettingsReturnBoolValue(@"AssistiveTouchOpenMenuSwaggle", 0);
}

- (void)setAssistiveTouchMouseBehavesLikeFinger:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AssistiveTouchMouseBehavesLikeFinger"];
}

- (BOOL)assistiveTouchMouseBehavesLikeFinger
{
  return AXSettingsReturnBoolValue(@"AssistiveTouchMouseBehavesLikeFinger", 1);
}

- (void)setAssistiveTouchMouseKeysEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AssistiveTouchMouseKeys"];
}

- (BOOL)assistiveTouchMouseKeysEnabled
{
  return AXSettingsReturnBoolValue(@"AssistiveTouchMouseKeys", 0);
}

- (void)setAssistiveTouchMouseKeysOptionToggleEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AssistiveTouchMouseKeysOptionToggle"];
}

- (BOOL)assistiveTouchMouseKeysOptionToggleEnabled
{
  return AXSettingsReturnBoolValue(@"AssistiveTouchMouseKeysOptionToggle", 0);
}

- (void)setAssistiveTouchMouseKeysUseMainKeyboardKeys:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AssistiveTouchMouseKeysUseMainKeyboardKeys"];
}

- (BOOL)assistiveTouchMouseKeysUseMainKeyboardKeys
{
  return AXSettingsReturnBoolValue(@"AssistiveTouchMouseKeysUseMainKeyboardKeys", 1);
}

- (void)setAssistiveTouchMouseKeysDelay:(int64_t)a3
{
  if ((a3 & (unint64_t)~(a3 >> 63)) >= 4) {
    int64_t v4 = 4;
  }
  else {
    int64_t v4 = a3 & ~(a3 >> 63);
  }
  id v5 = [NSNumber numberWithInteger:v4];
  [(AXBaseSettings *)self setValue:v5 forPreferenceKey:@"AssistiveTouchMouseKeysDelay"];
}

- (BOOL)assistiveTouchMouseAlwaysShowSoftwareKeyboardEnabled
{
  return AXSettingsReturnBoolValue(@"AssistiveTouchMouseAlwaysShowSoftwareKeyboard", 0);
}

- (void)setAssistiveTouchMouseAlwaysShowSoftwareKeyboardEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AssistiveTouchMouseAlwaysShowSoftwareKeyboard"];
}

- (BOOL)assistiveTouchMouseAllowAppleBluetoothDevicesPairing
{
  int v2 = AXIsInternalInstall();
  if (v2)
  {
    LOBYTE(v2) = AXSettingsReturnBoolValue(@"AssistiveTouchMouseAllowAppleBluetoothDevicesPairing", 0);
  }
  return v2;
}

- (void)setAssistiveTouchMouseAllowAppleBluetoothDevicesPairing:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AssistiveTouchMouseAllowAppleBluetoothDevicesPairing"];
}

- (int64_t)assistiveTouchMouseKeysDelay
{
  return AXSettingsReturnIntegerValue(@"AssistiveTouchMouseKeysDelay", 2);
}

- (void)setAssistiveTouchMouseKeysMaxSpeed:(int64_t)a3
{
  if ((a3 & (unint64_t)~(a3 >> 63)) >= 0xA) {
    int64_t v4 = 10;
  }
  else {
    int64_t v4 = a3 & ~(a3 >> 63);
  }
  id v5 = [NSNumber numberWithInteger:v4];
  [(AXBaseSettings *)self setValue:v5 forPreferenceKey:@"AssistiveTouchMouseKeysMaxSpeed"];
}

- (int64_t)assistiveTouchMouseKeysMaxSpeed
{
  return AXSettingsReturnIntegerValue(@"AssistiveTouchMouseKeysMaxSpeed", 5);
}

- (void)setAssistiveTouchSpeed:(double)a3
{
  id v4 = [NSNumber numberWithDouble:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AssistiveTouchSpeed"];
}

- (double)assistiveTouchSpeed
{
  return AXSettingsReturnDoubleValue(@"AssistiveTouchSpeed", *MEMORY[0x1E4F484B0]);
}

- (void)setAssistiveTouchVirtualTrackpadEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AssistiveTouchVirtualTrackpadEnabled"];
}

- (BOOL)assistiveTouchVirtualTrackpadEnabled
{
  return AXSettingsReturnBoolValue(@"AssistiveTouchVirtualTrackpadEnabled", 0);
}

- (void)setAssistiveTouchVirtualTrackpadSpeed:(double)a3
{
  id v4 = [NSNumber numberWithDouble:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AssistiveTouchVirtualTrackpadSpeed"];
}

- (double)assistiveTouchVirtualTrackpadSpeed
{
  return AXSettingsReturnDoubleValue(@"AssistiveTouchVirtualTrackpadSpeed", 1.0);
}

- (void)setAssistiveTouchVirtualTrackpadScrollSpeed:(double)a3
{
  id v4 = [NSNumber numberWithDouble:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AssistiveTouchVirtualTrackpadScrollSpeed"];
}

- (double)assistiveTouchVirtualTrackpadScrollSpeed
{
  return AXSettingsReturnDoubleValue(@"AssistiveTouchVirtualTrackpadScrollSpeed", 1.0);
}

- (double)assistiveTouchVirtualTrackpadHoldDuration
{
  return AXSettingsReturnDoubleValue(@"AssistiveTouchVirtualTrackpadHoldDuration", 0.2);
}

- (void)setAssistiveTouchVirtualTrackpadHoldDuration:(double)a3
{
  id v4 = [NSNumber numberWithDouble:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AssistiveTouchVirtualTrackpadHoldDuration"];
}

- (double)assistiveTouchVirtualTrackpadFadeDelay
{
  return AXSettingsReturnDoubleValue(@"AssistiveTouchVirtualTrackpadFadeDelay", 4.0);
}

- (void)setAssistiveTouchVirtualTrackpadFadeDelay:(double)a3
{
  id v4 = [NSNumber numberWithDouble:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AssistiveTouchVirtualTrackpadFadeDelay"];
}

- (int64_t)assistiveTouchVirtualTrackpadBorderColor
{
  return AXSettingsReturnIntegerValue(@"AssistiveTouchVirtualTrackpadBorderColor", 0);
}

- (void)setAssistiveTouchVirtualTrackpadBorderColor:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AssistiveTouchVirtualTrackpadBorderColor"];
}

- (int64_t)assistiveTouchVirtualTrackpadInnerColor
{
  return AXSettingsReturnIntegerValue(@"AssistiveTouchVirtualTrackpadInnerColor", 0);
}

- (void)setAssistiveTouchVirtualTrackpadInnerColor:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AssistiveTouchVirtualTrackpadInnerColor"];
}

- (double)assistiveTouchVirtualTrackpadBorderOpacity
{
  return AXSettingsReturnDoubleValue(@"AssistiveTouchVirtualTrackpadBorderOpacity", 0.6);
}

- (void)setAssistiveTouchVirtualTrackpadBorderOpacity:(double)a3
{
  id v4 = [NSNumber numberWithDouble:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AssistiveTouchVirtualTrackpadBorderOpacity"];
}

- (double)assistiveTouchVirtualTrackpadInnerOpacity
{
  return AXSettingsReturnDoubleValue(@"AssistiveTouchVirtualTrackpadInnerOpacity", 0.2);
}

- (void)setAssistiveTouchVirtualTrackpadInnerOpacity:(double)a3
{
  id v4 = [NSNumber numberWithDouble:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AssistiveTouchVirtualTrackpadInnerOpacity"];
}

- (double)assistiveTouchVirtualTrackpadBorderWidth
{
  int IsPad = AXDeviceIsPad();
  double v3 = 40.0;
  if (!IsPad) {
    double v3 = 25.0;
  }

  return AXSettingsReturnDoubleValue(@"AssistiveTouchVirtualTrackpadBorderWidth", v3);
}

- (void)setAssistiveTouchVirtualTrackpadBorderWidth:(double)a3
{
  id v4 = [NSNumber numberWithDouble:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AssistiveTouchVirtualTrackpadBorderWidth"];
}

- (void)setAssistiveTouchVirtualTrackpadScrollToggleEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AssistiveTouchVirtualTrackpadScrollToggle"];
}

- (BOOL)assistiveTouchVirtualTrackpadScrollToggleEnabled
{
  return AXSettingsReturnBoolValue(@"AssistiveTouchVirtualTrackpadScrollToggle", 1);
}

- (void)setAssistiveTouchVirtualTrackpadFullScreenToggleEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AssistiveTouchVirtualTrackpadFullScreenToggle"];
}

- (BOOL)assistiveTouchVirtualTrackpadFullScreenToggleEnabled
{
  return AXSettingsReturnBoolValue(@"AssistiveTouchVirtualTrackpadFullScreenToggle", 0);
}

- (id)_gesturesForPreferenceKeyMigratingIfNecessary:(id)a3
{
  v37[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(AXSettings *)self valueForPreferenceKey:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v7 = (void *)MEMORY[0x1E4F1CAD0];
    v37[0] = objc_opt_class();
    v37[1] = objc_opt_class();
    CFStringRef v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:2];
    CFStringRef v9 = [v7 setWithArray:v8];
    id v35 = 0;
    id v10 = [v6 unarchivedObjectOfClasses:v9 fromData:v5 error:&v35];
    id v11 = v35;

    if (v11)
    {
      CFArrayRef v12 = AXLogSettings();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[AXSettings _gesturesForPreferenceKeyMigratingIfNecessary:]((uint64_t)v11, v12, v13, v14, v15, v16, v17, v18);
      }
    }
    goto LABEL_24;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (v5) {
      _AXAssert();
    }
    goto LABEL_22;
  }
  if (![v5 count])
  {
    id v10 = v5;
    goto LABEL_24;
  }
  v19 = [v5 firstObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v30 = [v5 firstObject];
    _AXAssert();
  }
  v21 = objc_msgSend(v5, "firstObject", v30);
  objc_opt_class();
  char v22 = objc_opt_isKindOfClass();

  if ((v22 & 1) == 0)
  {
LABEL_22:
    id v10 = 0;
    goto LABEL_24;
  }
  id v10 = [MEMORY[0x1E4F1CA48] array];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v23 = v5;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v32 != v26) {
          objc_enumerationMutation(v23);
        }
        v28 = +[AXNamedReplayableGesture gestureWithLegacyFormatDictionary:*(void *)(*((void *)&v31 + 1) + 8 * i)];
        [v10 addObject:v28];
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v25);
  }

  [(AXSettings *)self _setGestures:v10 forPreferenceKey:v4];
LABEL_24:

  return v10;
}

- (void)_setGestures:(id)a3 forPreferenceKey:(id)a4
{
  uint64_t v6 = (void *)MEMORY[0x1E4F28DB0];
  id v17 = 0;
  id v7 = a4;
  CFStringRef v8 = [v6 archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v17];
  id v9 = v17;
  [(AXBaseSettings *)self setValue:v8 forPreferenceKey:v7];

  if (v9)
  {
    id v10 = AXLogSettings();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[AXSettings _gesturesForPreferenceKeyMigratingIfNecessary:]((uint64_t)v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
}

- (void)setAssistiveTouchCustomGestures:(id)a3
{
}

- (NSArray)assistiveTouchCustomGestures
{
  return (NSArray *)[(AXSettings *)self _gesturesForPreferenceKeyMigratingIfNecessary:@"AssistiveTouchCustomGestures"];
}

- (void)setAssistiveTouchRecentGestures:(id)a3
{
}

- (NSArray)assistiveTouchRecentGestures
{
  return (NSArray *)[(AXSettings *)self _gesturesForPreferenceKeyMigratingIfNecessary:@"AssistiveTouchRecentGestures"];
}

- (void)setAssistiveTouchSavedGestures:(id)a3
{
}

- (NSArray)assistiveTouchSavedGestures
{
  return (NSArray *)[(AXSettings *)self _gesturesForPreferenceKeyMigratingIfNecessary:@"AssistiveTouchSavedGestures"];
}

- (void)setAssistiveTouchPreferredPointPicker:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AssistiveTouchPreferredPointPickerPreference"];
}

- (int64_t)assistiveTouchPreferredPointPicker
{
  int v2 = [(AXSettings *)self valueForPreferenceKey:@"AssistiveTouchPreferredPointPickerPreference"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int64_t v3 = [v2 integerValue];
  }
  else {
    int64_t v3 = 1;
  }

  return v3;
}

- (BOOL)assistiveTouchScannerCursorHighVisibilityEnabled
{
  return AXSettingsReturnBoolValue(@"AssistiveTouchCursorHighVisibilityPreference", 0);
}

- (void)setAssistiveTouchScannerCursorHighVisibilityEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AssistiveTouchCursorHighVisibilityPreference"];
}

- (void)setAssistiveTouchScanningMode:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AssistiveTouchScanningModePreference"];
}

- (int64_t)assistiveTouchScanningMode
{
  int v2 = [(AXSettings *)self valueForPreferenceKey:@"AssistiveTouchScanningModePreference"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int64_t v3 = [v2 integerValue];
  }
  else {
    int64_t v3 = 0;
  }

  return v3;
}

- (BOOL)assistiveTouchAutoScanningEnabled
{
  return [(AXSettings *)self switchControlScanningStyle] == 0;
}

- (void)setAssistiveTouchGroupElementsEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AssistiveTouchScanShouldGroupElements"];
}

- (BOOL)assistiveTouchGroupElementsEnabled
{
  return AXSettingsReturnBoolValue(@"AssistiveTouchScanShouldGroupElements", 1);
}

- (void)setAssistiveTouchScannerCompactMenuEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AssistiveTouchScanShouldUseCompactMenu"];
}

- (BOOL)assistiveTouchScannerCompactMenuEnabled
{
  return AXSettingsReturnBoolValue(@"AssistiveTouchScanShouldUseCompactMenu", 0);
}

- (BOOL)assistiveTouchScannerMenuLabelsEnabled
{
  return AXSettingsReturnBoolValue(@"AssistiveTouchScannerMenuLabelsEnabled", 1);
}

- (void)setAssistiveTouchScannerMenuLabelsEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AssistiveTouchScannerMenuLabelsEnabled"];
}

- (double)assistiveTouchAxisSweepSpeed
{
  return AXSettingsReturnDoubleValue(@"AssistiveTouchAxisSweepSpeed", *MEMORY[0x1E4F483D8] + *MEMORY[0x1E4F483C8] * 30.0);
}

- (void)setAssistiveTouchAxisSweepSpeed:(double)a3
{
  if (*MEMORY[0x1E4F483D8] >= a3) {
    a3 = *MEMORY[0x1E4F483D8];
  }
  if (*MEMORY[0x1E4F483D8]
     + (double)(unint64_t)(*MEMORY[0x1E4F483D0] - *MEMORY[0x1E4F483E0]) * *MEMORY[0x1E4F483C8] < a3)
    a3 = *MEMORY[0x1E4F483D8]
       + (double)(unint64_t)(*MEMORY[0x1E4F483D0] - *MEMORY[0x1E4F483E0]) * *MEMORY[0x1E4F483C8];
  id v4 = [NSNumber numberWithDouble:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AssistiveTouchAxisSweepSpeed"];
}

- (void)setAssistiveTouchActionRepeatInterval:(double)a3
{
  if (*MEMORY[0x1E4F483C0] >= a3) {
    a3 = *MEMORY[0x1E4F483C0];
  }
  if (*MEMORY[0x1E4F483B8] < a3) {
    a3 = *MEMORY[0x1E4F483B8];
  }
  id v4 = [NSNumber numberWithDouble:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AssistiveTouchActionRepeatIntervalPreference"];
}

- (double)assistiveTouchActionRepeatInterval
{
  return AXSettingsReturnDoubleValue(@"AssistiveTouchActionRepeatIntervalPreference", 0.5);
}

- (void)setAssistiveTouchActionRepeatEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AssistiveTouchActionRepeatEnabledPreference"];
}

- (BOOL)assistiveTouchActionRepeatEnabled
{
  return AXSettingsReturnBoolValue(@"AssistiveTouchActionRepeatEnabledPreference", 0);
}

- (void)setAssistiveTouchDelayAfterInput:(double)a3
{
  if (*MEMORY[0x1E4F483E8] < a3) {
    a3 = *MEMORY[0x1E4F483E8];
  }
  if (*MEMORY[0x1E4F483F0] >= a3) {
    a3 = *MEMORY[0x1E4F483F0];
  }
  id v4 = [NSNumber numberWithDouble:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AssistiveTouchDelayAfterInputPreference"];
}

- (double)assistiveTouchDelayAfterInput
{
  return AXSettingsReturnDoubleValue(@"AssistiveTouchDelayAfterInputPreference", 0.5);
}

- (void)setAssistiveTouchDelayAfterInputEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AssistiveTouchDelayAfterInputEnabledPreference"];
}

- (BOOL)assistiveTouchDelayAfterInputEnabled
{
  return AXSettingsReturnBoolValue(@"AssistiveTouchDelayAfterInputEnabledPreference", 0);
}

- (void)setAssistiveTouchInputHoldDuration:(double)a3
{
  if (*MEMORY[0x1E4F48418] < a3) {
    a3 = *MEMORY[0x1E4F48418];
  }
  if (*MEMORY[0x1E4F48420] >= a3) {
    a3 = *MEMORY[0x1E4F48420];
  }
  id v4 = [NSNumber numberWithDouble:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AssistiveTouchInputHoldDurationPreference"];
}

- (double)assistiveTouchInputHoldDuration
{
  return AXSettingsReturnDoubleValue(@"AssistiveTouchInputHoldDurationPreference", *MEMORY[0x1E4F48420]);
}

- (void)setAssistiveTouchInputHoldEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AssistiveTouchInputHoldEnabledPreference"];
}

- (BOOL)assistiveTouchInputHoldEnabled
{
  return AXSettingsReturnBoolValue(@"AssistiveTouchInputHoldEnabledPreference", 0);
}

- (void)setAssistiveTouchLongPressDuration:(double)a3
{
  id v4 = [NSNumber numberWithDouble:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AssistiveTouchLongPressDurationPreference"];
}

- (double)assistiveTouchLongPressDuration
{
  return AXSettingsReturnDoubleValue(@"AssistiveTouchLongPressDurationPreference", *MEMORY[0x1E4F48428]);
}

- (void)setAssistiveTouchLongPressEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AssistiveTouchLongPressDurationEnabledPreference"];
}

- (BOOL)assistiveTouchLongPressEnabled
{
  return AXSettingsReturnBoolValue(@"AssistiveTouchLongPressDurationEnabledPreference", 0);
}

- (void)setAssistiveTouchLongPressPauseScanningEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AssistiveTouchLongPressPauseScanningEnabledPreference"];
}

- (BOOL)assistiveTouchLongPressPauseScanningEnabled
{
  return AXSettingsReturnBoolValue(@"AssistiveTouchLongPressPauseScanningEnabledPreference", 1);
}

- (void)setAssistiveTouchInputCoalescingDuration:(double)a3
{
  if (*MEMORY[0x1E4F48408] < a3) {
    a3 = *MEMORY[0x1E4F48408];
  }
  if (*MEMORY[0x1E4F48410] >= a3) {
    a3 = *MEMORY[0x1E4F48410];
  }
  id v4 = [NSNumber numberWithDouble:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AssistiveTouchInputCoalescingDurationPreference"];
}

- (double)assistiveTouchInputCoalescingDuration
{
  return AXSettingsReturnDoubleValue(@"AssistiveTouchInputCoalescingDurationPreference", *MEMORY[0x1E4F48410]);
}

- (void)setAssistiveTouchInputCoalescingEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AssistiveTouchInputCoalescingEnabledPreference"];
}

- (BOOL)assistiveTouchInputCoalescingEnabled
{
  return AXSettingsReturnBoolValue(@"AssistiveTouchInputCoalescingEnabledPreference", 0);
}

- (void)setAssistiveTouchStepInterval:(double)a3
{
  if (*MEMORY[0x1E4F484C0] >= a3) {
    a3 = *MEMORY[0x1E4F484C0];
  }
  if (*MEMORY[0x1E4F484B8] < a3) {
    a3 = *MEMORY[0x1E4F484B8];
  }
  id v4 = [NSNumber numberWithDouble:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AssistiveTouchStepInterval"];
}

- (double)assistiveTouchStepInterval
{
  return AXSettingsReturnDoubleValue(@"AssistiveTouchStepInterval", 1.0);
}

- (BOOL)assistiveTouchScanTimeoutEnabled
{
  return AXSettingsReturnBoolValue(@"AssistiveTouchScannerScanTimeoutEnabled", 1);
}

- (void)setAssistiveTouchScanTimeoutEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AssistiveTouchScannerScanTimeoutEnabled"];
}

- (double)assistiveTouchScanTimeout
{
  return AXSettingsReturnDoubleValue(@"AssistiveTouchScannerScanTimeout", 15.0);
}

- (void)setAssistiveTouchScanTimeout:(double)a3
{
  if (*MEMORY[0x1E4F484A8] > a3) {
    a3 = *MEMORY[0x1E4F484A8];
  }
  if (a3 >= *MEMORY[0x1E4F484A0]) {
    a3 = *MEMORY[0x1E4F484A0];
  }
  id v4 = [NSNumber numberWithDouble:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AssistiveTouchScannerScanTimeout"];
}

- (void)setAssistiveTouchScanCycles:(int64_t)a3
{
  int64_t v4 = *MEMORY[0x1E4F48438];
  if (*MEMORY[0x1E4F48438] <= a3) {
    int64_t v4 = a3;
  }
  if (v4 >= *MEMORY[0x1E4F48430]) {
    int64_t v5 = *MEMORY[0x1E4F48430];
  }
  else {
    int64_t v5 = v4;
  }
  id v6 = [NSNumber numberWithInteger:v5];
  [(AXBaseSettings *)self setValue:v6 forPreferenceKey:@"AssistiveTouchScanCyclesPreference"];
}

- (int64_t)assistiveTouchScanCycles
{
  return AXSettingsReturnIntegerValue(@"AssistiveTouchScanCyclesPreference", 4);
}

- (void)setAssistiveTouchScannerSoundEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AssistiveTouchScannerSoundEnabled"];
}

- (BOOL)assistiveTouchScannerSoundEnabled
{
  return AXSettingsReturnBoolValue(@"AssistiveTouchScannerSoundEnabled", 0);
}

- (void)setAssistiveTouchScannerSpeechRate:(double)a3
{
  id v4 = [NSNumber numberWithDouble:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:kAXSAssistiveTouchScannerSpeechRatePreference];
}

- (double)assistiveTouchScannerSpeechRate
{
  return AXSettingsReturnDoubleValue((void *)kAXSAssistiveTouchScannerSpeechRatePreference, 0.5);
}

- (void)setIgnoreTrackpad:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int64_t v5 = AXLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [NSNumber numberWithBool:v3];
    int v8 = 138412290;
    id v9 = v6;
    _os_log_impl(&dword_18D308000, v5, OS_LOG_TYPE_DEFAULT, "Setting ignore trackpad value: %@", (uint8_t *)&v8, 0xCu);
  }
  id v7 = [NSNumber numberWithBool:v3];
  [(AXBaseSettings *)self setValue:v7 forPreferenceKey:@"AXSIgnoreTrackpad"];
}

- (BOOL)ignoreTrackpad
{
  return AXSettingsReturnBoolValue(@"AXSIgnoreTrackpad", 0);
}

- (void)setAssistiveTouchSwitches:(id)a3
{
  id v4 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:0];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AssistiveTouchSwitchesPreference"];
}

- (NSSet)assistiveTouchSwitches
{
  int v2 = [(AXSettings *)self valueForPreferenceKey:@"AssistiveTouchSwitchesPreference"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (BOOL v3 = (void *)MEMORY[0x1E4F28DC0],
        uint64_t v4 = objc_opt_class(),
        [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()],
        int64_t v5 = objc_claimAutoreleasedReturnValue(),
        [v3 secureUnarchiveData:v2 withExpectedClass:v4 otherAllowedClasses:v5],
        id v6 = objc_claimAutoreleasedReturnValue(),
        v5,
        !v6))
  {
    id v6 = [MEMORY[0x1E4F1CAD0] set];
  }

  return (NSSet *)v6;
}

- (void)setAssistiveTouchCameraPointPickerSwitches:(id)a3
{
  id v4 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:0];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AssistiveTouchCameraPointPickerSwitchesPreference"];
}

- (NSSet)assistiveTouchCameraPointPickerSwitches
{
  int v2 = [(AXSettings *)self valueForPreferenceKey:@"AssistiveTouchCameraPointPickerSwitchesPreference"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (BOOL v3 = (void *)MEMORY[0x1E4F28DC0],
        uint64_t v4 = objc_opt_class(),
        [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()],
        int64_t v5 = objc_claimAutoreleasedReturnValue(),
        [v3 secureUnarchiveData:v2 withExpectedClass:v4 otherAllowedClasses:v5],
        id v6 = objc_claimAutoreleasedReturnValue(),
        v5,
        !v6))
  {
    id v6 = [MEMORY[0x1E4F1CAD0] set];
  }

  return (NSSet *)v6;
}

- (void)setAssistiveTouchCursorColor:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AssistiveTouchCursorColorPreference"];
}

- (int64_t)assistiveTouchCursorColor
{
  return AXSettingsReturnIntegerValue(@"AssistiveTouchCursorColorPreference", 3);
}

- (void)setAssistiveTouchMousePointerColor:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AssistiveTouchMousePointerColorPreference"];
}

- (int64_t)assistiveTouchMousePointerColor
{
  return AXSettingsReturnIntegerValue(@"AssistiveTouchMousePointerColorPreference", 1);
}

- (void)setAssistiveTouchMousePointerSizeMultiplier:(double)a3
{
  if (*MEMORY[0x1E4F48488] > a3) {
    a3 = *MEMORY[0x1E4F48488];
  }
  if (a3 >= *MEMORY[0x1E4F48480]) {
    a3 = *MEMORY[0x1E4F48480];
  }
  id v4 = [NSNumber numberWithDouble:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AssistiveTouchMousePointerSizeMultiplierPreference"];
}

- (double)assistiveTouchMousePointerSizeMultiplier
{
  return AXSettingsReturnDoubleValue(@"AssistiveTouchMousePointerSizeMultiplierPreference", *MEMORY[0x1E4F48478]);
}

- (void)setAssistiveTouchMousePointerTimeoutEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AssistiveTouchMousePointerTimeoutEnabledPreference"];
}

- (BOOL)assistiveTouchMousePointerTimeoutEnabled
{
  return AXSettingsReturnBoolValue(@"AssistiveTouchMousePointerTimeoutEnabledPreference", 1);
}

- (void)setAssistiveTouchMousePointerTimeout:(double)a3
{
  id v4 = [NSNumber numberWithDouble:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AssistiveTouchMousePointerTimeoutPreference"];
}

- (double)assistiveTouchMousePointerTimeout
{
  return AXSettingsReturnDoubleValue(@"AssistiveTouchMousePointerTimeoutPreference", *MEMORY[0x1E4F48490]);
}

- (void)setAssistiveTouchMouseDwellControlEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AssistiveTouchMouseDwellControlEnabledPreference"];
}

- (BOOL)assistiveTouchMouseDwellControlEnabled
{
  return AXSettingsReturnBoolValue(@"AssistiveTouchMouseDwellControlEnabledPreference", 0);
}

- (void)_assignActionToUnsetHotCorner:(id)a3
{
  id v16 = a3;
  id v4 = [(AXSettings *)self assistiveTouchMouseDwellControlCornerCustomization];
  int64_t v5 = (void *)[v4 mutableCopy];
  id v6 = v5;
  if (v5) {
    id v7 = v5;
  }
  else {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  int v8 = v7;

  id v9 = (void *)*MEMORY[0x1E4F47F30];
  uint64_t v10 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F47F30]];

  if (!v10) {
    goto LABEL_15;
  }
  id v9 = (void *)*MEMORY[0x1E4F47F38];
  uint64_t v11 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F47F38]];

  if (!v11) {
    goto LABEL_15;
  }
  id v9 = (void *)*MEMORY[0x1E4F47F20];
  uint64_t v12 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F47F20]];

  if (!v12
    || (id v9 = (void *)*MEMORY[0x1E4F47F28],
        [v8 objectForKeyedSubscript:*MEMORY[0x1E4F47F28]],
        uint64_t v13 = objc_claimAutoreleasedReturnValue(),
        v13,
        !v13))
  {
LABEL_15:
    id v14 = v9;
    if (v14)
    {
      uint64_t v15 = v14;
      [v8 setObject:v16 forKeyedSubscript:v14];
      [(AXSettings *)self setAssistiveTouchMouseDwellControlCornerCustomization:v8];
    }
  }
}

- (void)setAssistiveTouchMouseOnDeviceEyeTrackingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  int64_t v5 = +[AXSettings sharedInstance];
  int v6 = [v5 assistiveTouchEnabled];

  id v7 = +[AXSettings sharedInstance];
  int v8 = v7;
  if ((v6 & 1) != 0 || !v3)
  {
    int v10 = [v7 assistiveTouchEnabledByOnDeviceEyeTracking] & v6;

    if (v10 == 1)
    {
      if (v3) {
        goto LABEL_8;
      }
      uint64_t v11 = +[AXSettings sharedInstance];
      [v11 setAssistiveTouchEnabled:0];

      uint64_t v12 = +[AXSettings sharedInstance];
      [v12 setAssistiveTouchMouseDwellControlEnabled:0];

      goto LABEL_10;
    }
  }
  else
  {
    [v7 setAssistiveTouchEnabled:1];

    id v9 = +[AXSettings sharedInstance];
    [v9 setAssistiveTouchEnabledByOnDeviceEyeTracking:1];
  }
  if (v3)
  {
LABEL_8:
    uint64_t v13 = +[AXSettings sharedInstance];
    [v13 setAssistiveTouchMouseDwellControlEnabled:1];

    id v14 = [(AXSettings *)self valueForPreferenceKey:@"AssistiveTouchMouseOnDeviceEyeTrackingEnabledPreference"];

    if (!v14)
    {
      [(AXSettings *)self _assignActionToUnsetHotCorner:@"AXAssistiveTouchIconTypeCalibrateOnDeviceEyeTracking"];
      [(AXSettings *)self _assignActionToUnsetHotCorner:@"AXAssistiveTouchIconTypeHome"];
    }
    goto LABEL_12;
  }
LABEL_10:
  uint64_t v15 = +[AXSettings sharedInstance];
  int v16 = [v15 assistiveTouchBubbleModeEnabled];

  if (v16)
  {
    id v17 = +[AXSettings sharedInstance];
    [v17 setAssistiveTouchBubbleModeEnabled:0];
  }
LABEL_12:
  uint64_t v18 = [NSNumber numberWithBool:v3];
  [(AXBaseSettings *)self setValue:v18 forPreferenceKey:@"AssistiveTouchMouseOnDeviceEyeTrackingEnabledPreference"];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFStringRef v20 = (const __CFString *)*MEMORY[0x1E4FB9220];

  CFNotificationCenterPostNotification(DarwinNotifyCenter, v20, 0, 0, 1u);
}

- (BOOL)assistiveTouchMouseOnDeviceEyeTrackingEnabled
{
  return AXSettingsReturnBoolValue(@"AssistiveTouchMouseOnDeviceEyeTrackingEnabledPreference", 0);
}

- (void)setAssistiveTouchMouseOnDeviceEyeTrackingOnboardingCompleted:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AssistiveTouchMouseOnDeviceEyeTrackingOnboardingCompletedPreference"];
}

- (BOOL)assistiveTouchMouseOnDeviceEyeTrackingOnboardingCompleted
{
  return AXSettingsReturnBoolValue(@"AssistiveTouchMouseOnDeviceEyeTrackingOnboardingCompletedPreference", 0);
}

- (BOOL)assistiveTouchMouseOnDeviceEyeTrackingEnrollmentCompleted
{
  return AXSettingsReturnBoolValue(@"AssistiveTouchMouseOnDeviceEyeTrackingEnrollmentCompletedPreference", 0);
}

- (void)setAssistiveTouchMouseOnDeviceEyeTrackingEnrollmentCompleted:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AssistiveTouchMouseOnDeviceEyeTrackingEnrollmentCompletedPreference"];
}

- (NSArray)assistiveTouchMouseOnDeviceEyeTrackingCalibratedValues
{
  int v2 = [MEMORY[0x1E4F1C978] array];
  uint64_t v3 = objc_opt_class();
  id v4 = AXSettingsReturnObjectValueWithClass(@"AssistiveTouchMouseOnDeviceEyeTrackingCalibratedValuesPreference", v2, v3);

  return (NSArray *)v4;
}

- (void)setAssistiveTouchMouseOnDeviceEyeTrackingCalibratedValues:(id)a3
{
}

- (NSDictionary)assistiveTouchMouseOnDeviceEyeTrackingEnrollmentPointToGazePointMap
{
  int v2 = [MEMORY[0x1E4F1C9E8] dictionary];
  uint64_t v3 = objc_opt_class();
  id v4 = AXSettingsReturnObjectValueWithClass(@"AssistiveTouchMouseOnDeviceEyeTrackingEnrollmentPointToGazePointMapPreference", v2, v3);

  return (NSDictionary *)v4;
}

- (void)setAssistiveTouchMouseOnDeviceEyeTrackingEnrollmentPointToGazePointMap:(id)a3
{
}

- (BOOL)assistiveTouchForceOnDeviceEyeTrackingExperience
{
  return AXSettingsReturnBoolValue(@"AssistiveTouchForceOnDeviceEyeTrackingExperiencePreference", 0);
}

- (void)setAssistiveTouchForceOnDeviceEyeTrackingExperience:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AssistiveTouchForceOnDeviceEyeTrackingExperiencePreference"];
}

- (unint64_t)assistiveTouchOnDeviceEyeTrackingSmoothingBufferSize
{
  return AXSettingsReturnIntegerValue(@"AssistiveTouchOnDeviceEyeTrackingSmoothingBufferSizePreference", *MEMORY[0x1E4F48498]);
}

- (void)setAssistiveTouchOnDeviceEyeTrackingSmoothingBufferSize:(unint64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AssistiveTouchOnDeviceEyeTrackingSmoothingBufferSizePreference"];
}

- (BOOL)assistiveTouchOnDeviceEyeTrackingAutoHideEnabled
{
  return AXSettingsReturnBoolValue(@"AXSAssistiveTouchOnDeviceEyeTrackingAutoHideEnabled", 0);
}

- (void)setAssistiveTouchOnDeviceEyeTrackingAutoHideEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AXSAssistiveTouchOnDeviceEyeTrackingAutoHideEnabled"];
}

- (double)assistiveTouchOnDeviceEyeTrackingAutoHideTimeout
{
  return AXSettingsReturnDoubleValue(@"AXSAssistiveTouchOnDeviceEyeTrackingAutoHideTimeout", *MEMORY[0x1E4F48400]);
}

- (void)setAssistiveTouchOnDeviceEyeTrackingAutoHideTimeout:(double)a3
{
  id v4 = [NSNumber numberWithDouble:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AXSAssistiveTouchOnDeviceEyeTrackingAutoHideTimeout"];
}

- (double)assistiveTouchOnDeviceEyeTrackingAutoHideOpacity
{
  return AXSettingsReturnDoubleValue(@"AXSAssistiveTouchOnDeviceEyeTrackingAutoHideOpacity", *MEMORY[0x1E4F483F8]);
}

- (void)setAssistiveTouchOnDeviceEyeTrackingAutoHideOpacity:(double)a3
{
  id v4 = [NSNumber numberWithDouble:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AXSAssistiveTouchOnDeviceEyeTrackingAutoHideOpacity"];
}

- (BOOL)assistiveTouchEnabledByOnDeviceEyeTracking
{
  return AXSettingsReturnBoolValue(@"AXSAssistiveTouchEnabledByOnDeviceEyeTracking", 0);
}

- (void)setAssistiveTouchEnabledByOnDeviceEyeTracking:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AXSAssistiveTouchEnabledByOnDeviceEyeTracking"];
}

- (BOOL)assistiveTouchMouseOnDeviceEyeTrackingShouldShowUncalibratedPoints
{
  return AXSettingsReturnBoolValue(@"AssistiveTouchMouseOnDeviceEyeTrackingShouldShowUncalibratedPoints", 0);
}

- (void)setAssistiveTouchMouseOnDeviceEyeTrackingShouldShowUncalibratedPoints:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AssistiveTouchMouseOnDeviceEyeTrackingShouldShowUncalibratedPoints"];
}

- (BOOL)assistiveTouchOnDeviceEyeTrackingShouldUseWeightedAverages
{
  return AXSettingsReturnBoolValue(@"AssistiveTouchOnDeviceEyeTrackingShouldUseWeightedAverages", 1);
}

- (void)setAssistiveTouchOnDeviceEyeTrackingShouldUseWeightedAverages:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AssistiveTouchOnDeviceEyeTrackingShouldUseWeightedAverages"];
}

- (BOOL)assistiveTouchOnDeviceEyeTrackingShouldUseMotionFilter
{
  return AXSettingsReturnBoolValue(@"AssistiveTouchOnDeviceEyeTrackingShouldUseMotionFilte", 0);
}

- (void)setAssistiveTouchOnDeviceEyeTrackingShouldUseMotionFilter:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AssistiveTouchOnDeviceEyeTrackingShouldUseMotionFilte"];
}

- (BOOL)assistiveTouchOnDeviceEyeTrackingShouldUseGaussianBlur
{
  return AXSettingsReturnBoolValue(@"AssistiveTouchOnDeviceEyeTrackingShouldUseGaussianBlur", 0);
}

- (void)setAssistiveTouchOnDeviceEyeTrackingShouldUseGaussianBlur:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AssistiveTouchOnDeviceEyeTrackingShouldUseGaussianBlur"];
}

- (int64_t)assistiveTouchMouseOnDeviceEyeTrackingCalibrationStrategy
{
  return AXSettingsReturnIntegerValue(@"AssistiveTouchMouseOnDeviceEyeTrackingCalibrationStrategyPreference", *MEMORY[0x1E4F484E8]);
}

- (void)setAssistiveTouchMouseOnDeviceEyeTrackingCalibrationStrategy:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AssistiveTouchMouseOnDeviceEyeTrackingCalibrationStrategyPreference"];
}

- (void)setAssistiveTouchMouseDwellControlAutorevertEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AssistiveTouchMouseDwellControlAutorevertEnabledPreference"];
}

- (BOOL)assistiveTouchMouseDwellControlAutorevertEnabled
{
  return AXSettingsReturnBoolValue(@"AssistiveTouchMouseDwellControlAutorevertEnabledPreference", 1);
}

- (void)setAssistiveTouchMouseDwellControlAutorevertAction:(id)a3
{
}

- (NSString)assistiveTouchMouseDwellControlAutorevertAction
{
  uint64_t v2 = objc_opt_class();

  return (NSString *)AXSettingsReturnObjectValueWithClass(@"AssistiveTouchMouseDwellControlAutorevertActionPreference", @"AXAssistiveTouchIconTypeDwellClick", v2);
}

- (double)assistiveTouchMouseDwellControlActivationTimeout
{
  return AXSettingsReturnDoubleValue(@"AssistiveTouchMouseDwellControlActivationTimeoutPreference", *MEMORY[0x1E4F48458]);
}

- (void)setAssistiveTouchMouseDwellControlActivationTimeout:(double)a3
{
  if (*MEMORY[0x1E4F48460] < a3) {
    a3 = *MEMORY[0x1E4F48460];
  }
  if (*MEMORY[0x1E4F48468] >= a3) {
    a3 = *MEMORY[0x1E4F48468];
  }
  id v4 = [NSNumber numberWithDouble:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AssistiveTouchMouseDwellControlActivationTimeoutPreference"];
}

- (double)assistiveTouchMouseDwellControlMovementToleranceRadius
{
  return AXSettingsReturnDoubleValue(@"AssistiveTouchMouseDwellControlMovementToleranceRadiusPreference", *MEMORY[0x1E4F48470]);
}

- (void)setAssistiveTouchMouseDwellControlMovementToleranceRadius:(double)a3
{
  id v4 = [NSNumber numberWithDouble:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AssistiveTouchMouseDwellControlMovementToleranceRadiusPreference"];
}

- (void)setAssistiveTouchMouseDwellControlCornerCustomization:(id)a3
{
}

- (NSDictionary)assistiveTouchMouseDwellControlCornerCustomization
{
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionary];
  uint64_t v3 = objc_opt_class();
  id v4 = AXSettingsReturnObjectValueWithClass(@"kAXSAssistiveTouchMouseDwellControlCornerCustomizationPreference", v2, v3);

  return (NSDictionary *)v4;
}

- (void)setAssistiveTouchMouseDwellControlMutatedMenu:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AXSAssistiveTouchMouseDwellControlMutatedMenuPreference"];
}

- (BOOL)assistiveTouchMouseDwellControlMutatedMenu
{
  return AXSettingsReturnBoolValue(@"AXSAssistiveTouchMouseDwellControlMutatedMenuPreference", 0);
}

- (void)setAssistiveTouchMouseDwellControlShowPrompt:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AssistiveTouchMouseDwellControlShowPromptPreference"];
}

- (BOOL)assistiveTouchMouseDwellControlShowPrompt
{
  return AXSettingsReturnBoolValue(@"AssistiveTouchMouseDwellControlShowPromptPreference", 0);
}

- (unint64_t)assistiveTouchMouseZoomPanningStyle
{
  return AXSettingsReturnIntegerValue(@"AssistiveTouchMouseZoomPanningStylePreference", *MEMORY[0x1E4F487A0]);
}

- (void)setAssistiveTouchMouseZoomPanningStyle:(unint64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AssistiveTouchMouseZoomPanningStylePreference"];
}

- (BOOL)assistiveTouchMotionTrackerConfigurable
{
  return AXSettingsReturnBoolValue(@"AssistiveTouchMotionTrackerConfigurablePreference", 0);
}

- (void)setAssistiveTouchMotionTrackerConfigurable:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AssistiveTouchMotionTrackerConfigurablePreference"];
}

- (BOOL)assistiveTouchForceEyeTrackerExperience
{
  return AXSettingsReturnBoolValue(@"AssistiveTouchForceEyeTrackerExperiencePreference", 0);
}

- (void)setAssistiveTouchForceEyeTrackerExperience:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AssistiveTouchForceEyeTrackerExperiencePreference"];
}

- (unint64_t)assistiveTouchMotionTrackerSmoothingBufferSize
{
  return AXSettingsReturnIntegerValue(@"AssistiveTouchMotionTrackerSmoothingBufferSizePreference", *MEMORY[0x1E4F48440]);
}

- (void)setAssistiveTouchMotionTrackerSmoothingBufferSize:(unint64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AssistiveTouchMotionTrackerSmoothingBufferSizePreference"];
}

- (double)assistiveTouchMotionTrackerSmoothingMaxDelta
{
  return AXSettingsReturnDoubleValue(@"AssistiveTouchMotionTrackerSmoothingMaxDeltaPreference", 0.0);
}

- (void)setAssistiveTouchMotionTrackerSmoothingMaxDelta:(double)a3
{
  id v4 = [NSNumber numberWithDouble:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AssistiveTouchMotionTrackerSmoothingMaxDeltaPreference"];
}

- (double)assistiveTouchMotionTrackerXNormalizationOrder
{
  return AXSettingsReturnDoubleValue(@"AssistiveTouchMotionTrackerXNormalizationOrderPreference", 1.0);
}

- (void)setAssistiveTouchMotionTrackerXNormalizationOrder:(double)a3
{
  id v4 = [NSNumber numberWithDouble:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AssistiveTouchMotionTrackerXNormalizationOrderPreference"];
}

- (double)assistiveTouchMotionTrackerYNormalizationOrder
{
  return AXSettingsReturnDoubleValue(@"AssistiveTouchMotionTrackerYNormalizationOrderPreference", 1.0);
}

- (void)setAssistiveTouchMotionTrackerYNormalizationOrder:(double)a3
{
  id v4 = [NSNumber numberWithDouble:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AssistiveTouchMotionTrackerYNormalizationOrderPreference"];
}

- (double)assistiveTouchMotionTrackerXNormalizationOffset
{
  return AXSettingsReturnDoubleValue(@"AssistiveTouchMotionTrackerXNormalizationOffsetPreference", 0.0);
}

- (void)setAssistiveTouchMotionTrackerXNormalizationOffset:(double)a3
{
  id v4 = [NSNumber numberWithDouble:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AssistiveTouchMotionTrackerXNormalizationOffsetPreference"];
}

- (double)assistiveTouchMotionTrackerYNormalizationOffset
{
  return AXSettingsReturnDoubleValue(@"AssistiveTouchMotionTrackerYNormalizationOffsetPreference", 0.0);
}

- (void)setAssistiveTouchMotionTrackerYNormalizationOffset:(double)a3
{
  id v4 = [NSNumber numberWithDouble:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AssistiveTouchMotionTrackerYNormalizationOffsetPreference"];
}

- (BOOL)assistiveTouchMotionTrackerShouldOffsetBufferPoints
{
  return AXSettingsReturnBoolValue(@"AXSAssistiveTouchMotionTrackerShouldOffsetBufferPointsPreference", 1);
}

- (void)assistiveTouchMotionTrackerShouldOffsetBufferPoints:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AXSAssistiveTouchMotionTrackerShouldOffsetBufferPointsPreference"];
}

- (BOOL)assistiveTouchBubbleModeEnabled
{
  return AXSettingsReturnBoolValue(@"AXSAssistiveTouchBubbleModeEnabled", 0);
}

- (void)setAssistiveTouchBubbleModeEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AXSAssistiveTouchBubbleModeEnabled"];
}

- (BOOL)assistiveTouchEyeTrackingAutoHideEnabled
{
  return AXSettingsReturnBoolValue(@"AXSAssistiveTouchEyeTrackingAutoHideEnabled", 0);
}

- (void)setAssistiveTouchEyeTrackingAutoHideEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AXSAssistiveTouchEyeTrackingAutoHideEnabled"];
}

- (double)assistiveTouchEyeTrackingAutoHideTimeout
{
  return AXSettingsReturnDoubleValue(@"AXSAssistiveTouchEyeTrackingAutoHideTimeout", *MEMORY[0x1E4F48400]);
}

- (void)setAssistiveTouchEyeTrackingAutoHideTimeout:(double)a3
{
  id v4 = [NSNumber numberWithDouble:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AXSAssistiveTouchEyeTrackingAutoHideTimeout"];
}

- (double)assistiveTouchEyeTrackingAutoHideOpacity
{
  return AXSettingsReturnDoubleValue(@"AXSAssistiveTouchEyeTrackingAutoHideOpacity", *MEMORY[0x1E4F483F8]);
}

- (void)setAssistiveTouchEyeTrackingAutoHideOpacity:(double)a3
{
  id v4 = [NSNumber numberWithDouble:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AXSAssistiveTouchEyeTrackingAutoHideOpacity"];
}

- (BOOL)assistiveTouchMouseClickSoundsEnabled
{
  return AXSettingsReturnBoolValue(@"AXSAssistiveTouchMouseClickSounds", 0);
}

- (void)setAssistiveTouchMouseClickSoundsEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AXSAssistiveTouchMouseClickSounds"];
}

- (void)setAssistiveTouchHeadMovementSensitivity:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AssistiveTouchHeadMovementSensitivityPreference"];
}

- (int64_t)assistiveTouchHeadMovementSensitivity
{
  return AXSettingsReturnIntegerValue(@"AssistiveTouchHeadMovementSensitivityPreference", 1);
}

- (void)setAssistiveTouchSwitchUsageConfirmed:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AXSAssistiveTouchSwitchUsageConfirmedPreference"];
}

- (BOOL)assistiveTouchSwitchUsageConfirmed
{
  return AXSettingsReturnBoolValue(@"AXSAssistiveTouchSwitchUsageConfirmedPreference", 0);
}

- (void)setAssistiveTouchScannerAddedTripleClickAutomatically:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AssistiveTouchAutoAddedTCItem"];
}

- (BOOL)assistiveTouchScannerAddedTripleClickAutomatically
{
  return AXSettingsReturnBoolValue(@"AssistiveTouchAutoAddedTCItem", 0);
}

- (void)setAssistiveTouchScannerPrefersCompact:(BOOL)a3 forLanguage:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (v6)
  {
    id v7 = v6;
    AXLanguageCanonicalFormToGeneralLanguage(v6);
    id v11 = (id)objc_claimAutoreleasedReturnValue();

    int v8 = [(AXSettings *)self valueForPreferenceKey:@"AssistiveTouchScannerPrefersCompactForLanguagePreference"];
    id v9 = (void *)[v8 mutableCopy];

    if (!v9) {
      id v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
    }
    int v10 = [NSNumber numberWithBool:v4];
    [v9 setObject:v10 forKey:v11];

    [(AXBaseSettings *)self setValue:v9 forPreferenceKey:@"AssistiveTouchScannerPrefersCompactForLanguagePreference"];
  }
}

- (BOOL)assistiveTouchScannerPrefersCompact:(id)a3
{
  BOOL v4 = AXLanguageCanonicalFormToGeneralLanguage(a3);
  int64_t v5 = [(AXSettings *)self valueForPreferenceKey:@"AssistiveTouchScannerPrefersCompactForLanguagePreference"];
  id v6 = [v5 objectForKey:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v7 = [v6 BOOLValue];
  }
  else {
    char v7 = 0;
  }

  return v7;
}

- (void)setAssistiveTouchSingleTapAction:(id)a3
{
}

- (NSString)assistiveTouchSingleTapAction
{
  uint64_t v2 = [(AXSettings *)self valueForPreferenceKey:@"AXSAssistiveTouchSingleTapAction"];
  uint64_t v3 = v2;
  if (v2)
  {
    char v4 = [(__CFString *)v2 isEqualToString:@"__NONE__"];
    int64_t v5 = v3;
    if (v4)
    {
      id v6 = 0;
      goto LABEL_6;
    }
  }
  else
  {
    int64_t v5 = @"AXAssistiveTouchIconTypeOpenMenu";
  }
  id v6 = v5;
LABEL_6:

  return (NSString *)v6;
}

- (void)setAssistiveTouchDoubleTapAction:(id)a3
{
}

- (NSString)assistiveTouchDoubleTapAction
{
  uint64_t v2 = [(AXSettings *)self valueForPreferenceKey:@"AXSAssistiveTouchDoubleTapAction"];
  uint64_t v3 = v2;
  if (v2 && ([v2 isEqualToString:@"__NONE__"] & 1) == 0) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (NSString *)v4;
}

- (void)setAssistiveTouchDoubleTapActionTimeout:(double)a3
{
  id v4 = [NSNumber numberWithDouble:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AXSAssistiveTouchDoubleTapActionTimeout"];
}

- (double)assistiveTouchDoubleTapActionTimeout
{
  return AXSettingsReturnDoubleValue(@"AXSAssistiveTouchDoubleTapActionTimeout", 0.3);
}

- (void)setAssistiveTouchLongPressActionDuration:(double)a3
{
  id v4 = [NSNumber numberWithDouble:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AXSAssistiveTouchLongPressActionDuration"];
}

- (double)assistiveTouchLongPressActionDuration
{
  return AXSettingsReturnDoubleValue(@"AXSAssistiveTouchLongPressActionDuration", 0.75);
}

- (void)setAssistiveTouchLongPressAction:(id)a3
{
}

- (NSString)assistiveTouchLongPressAction
{
  uint64_t v2 = [(AXSettings *)self valueForPreferenceKey:@"AXSAssistiveTouchLongPressAction"];
  uint64_t v3 = v2;
  if (v2 && ([v2 isEqualToString:@"__NONE__"] & 1) == 0) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (NSString *)v4;
}

- (void)setAssistiveTouchOrbAction:(id)a3
{
}

- (NSString)assistiveTouchOrbAction
{
  uint64_t v2 = [(AXSettings *)self valueForPreferenceKey:@"AXSAssistiveTouchOrbPreference"];
  uint64_t v3 = v2;
  if (v2)
  {
    char v4 = [(__CFString *)v2 isEqualToString:@"__NONE__"];
    int64_t v5 = v3;
    if (v4)
    {
      id v6 = 0;
      goto LABEL_6;
    }
  }
  else
  {
    int64_t v5 = @"AXAssistiveTouchIconTypeHome";
  }
  id v6 = v5;
LABEL_6:

  return (NSString *)v6;
}

- (NSArray)assistiveTouchMouseCustomizedClickActions
{
  uint64_t v2 = [(AXSettings *)self valueForPreferenceKey:@"AXSAssistiveTouchMouseCustomizedClickActionsPreference"];
  uint64_t v3 = +[AXCustomizableMouse deserialize:v2];

  return (NSArray *)v3;
}

- (void)updateCustomizableMouse:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(AXSettings *)self assistiveTouchMouseCustomizedClickActions];
  id v6 = (void *)[v5 mutableCopy];

  uint64_t v15 = 0;
  int v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  id v11 = __38__AXSettings_updateCustomizableMouse___block_invoke;
  uint64_t v12 = &unk_1E5588290;
  id v7 = v4;
  id v13 = v7;
  id v14 = &v15;
  [v6 enumerateObjectsUsingBlock:&v9];
  if (v16[3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (objc_msgSend(v7, "hasCustomActions", v9, v10, v11, v12)) {
      [v6 addObject:v7];
    }
  }
  else if (objc_msgSend(v7, "hasCustomActions", v9, v10, v11, v12))
  {
    [v6 setObject:v7 atIndexedSubscript:v16[3]];
  }
  else
  {
    [v6 removeObjectAtIndex:v16[3]];
  }
  int v8 = +[AXCustomizableMouse serialize:v6];
  [(AXBaseSettings *)self setValue:v8 forPreferenceKey:@"AXSAssistiveTouchMouseCustomizedClickActionsPreference"];

  _Block_object_dispose(&v15, 8);
}

uint64_t __38__AXSettings_updateCustomizableMouse___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [*(id *)(a1 + 32) isEqualToMouse:a2];
  if (result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

- (NSDictionary)assistiveTouchEyeTrackerCustomizedSettings
{
  return (NSDictionary *)[(AXSettings *)self valueForPreferenceKey:@"AXSAssistiveTouchEyeTrackerCustomizedSettingsPreference"];
}

- (void)setAssistiveTouchEyeTrackerCustomizedSettings:(id)a3
{
}

- (id)smoothingBufferSizeForEyeTracker:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(AXSettings *)self _legacyIdentifierForEyeTracker:v4];
  id v6 = [v4 uniqueIdentifier];
  if ([v6 length])
  {

LABEL_4:
    int v8 = [(AXSettings *)self assistiveTouchEyeTrackerCustomizedSettings];
    uint64_t v9 = [v4 uniqueIdentifier];
    uint64_t v10 = [v8 objectForKeyedSubscript:v9];

    if (!v10)
    {
      uint64_t v10 = [v8 objectForKeyedSubscript:v5];
    }
    id v11 = [v10 objectForKeyedSubscript:@"AssistiveTouchMotionTrackerSmoothingBufferSizePreference"];

    goto LABEL_7;
  }
  uint64_t v7 = [v5 length];

  if (v7) {
    goto LABEL_4;
  }
  id v13 = AXLogSettings();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    -[AXSettings smoothingBufferSizeForEyeTracker:]();
  }

  id v11 = 0;
LABEL_7:

  return v11;
}

- (void)updateSmoothingBufferSize:(id)a3 forEyeTracker:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(AXSettings *)self _legacyIdentifierForEyeTracker:v7];
  uint64_t v9 = [v7 uniqueIdentifier];
  uint64_t v10 = [v9 length];

  if (v10)
  {
    id v11 = (void *)MEMORY[0x1E4F1CA60];
    uint64_t v12 = [(AXSettings *)self assistiveTouchEyeTrackerCustomizedSettings];
    id v13 = [v11 dictionaryWithDictionary:v12];

    id v14 = [v7 uniqueIdentifier];
    uint64_t v15 = [v13 objectForKeyedSubscript:v14];

    if (v15
      || ([v13 objectForKeyedSubscript:v8], (uint64_t v15 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      int v16 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v15];
    }
    else
    {
      int v16 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    [v16 setObject:v6 forKey:@"AssistiveTouchMotionTrackerSmoothingBufferSizePreference"];
    uint64_t v17 = [v7 uniqueIdentifier];
    [v13 setObject:v16 forKey:v17];

    [(AXSettings *)self setAssistiveTouchEyeTrackerCustomizedSettings:v13];
  }
  else
  {
    uint64_t v18 = AXLogSettings();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[AXSettings updateSmoothingBufferSize:forEyeTracker:]();
    }
  }
}

- (id)_legacyIdentifierForEyeTracker:(id)a3
{
  return (id)[a3 deviceUniqueID];
}

- (void)setAssistiveTouchMainScreenCustomization:(id)a3
{
}

- (BOOL)assistiveTouchCustomizationEnabled
{
  uint64_t v2 = [(AXSettings *)self valueForPreferenceKey:@"AXSAssistiveTouchMainScreenCustomizationPreference"];
  BOOL v3 = v2 != 0;

  return v3;
}

- (double)assistiveTouchIdleOpacity
{
  return AXSettingsReturnDoubleValue(@"AXSAssistiveTouchIdleOpacityPreference", *MEMORY[0x1E4F47F08]);
}

- (void)setAssistiveTouchIdleOpacity:(double)a3
{
  id v4 = [NSNumber numberWithDouble:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AXSAssistiveTouchIdleOpacityPreference"];
}

- (NSDictionary)assistiveTouchMainScreenDefaultCustomization
{
  v9[6] = *MEMORY[0x1E4F143B8];
  BOOL IsSiriAvailable = AXDeviceIsSiriAvailable();
  int IsVoiceControlAvailable = AXDeviceIsVoiceControlAvailable();
  v8[0] = @"AXAssistiveTouchIconLocationTopLeft";
  v8[1] = @"AXAssistiveTouchIconLocationTopMiddle";
  v9[0] = @"AXAssistiveTouchIconTypeCustom";
  v9[1] = @"AXAssistiveTouchIconTypeNotificationCenter";
  v8[2] = @"AXAssistiveTouchIconLocationTopRight";
  v8[3] = @"AXAssistiveTouchIconLocationMidLeft";
  id v4 = AXAssistiveTouchIconTypeVoiceControl;
  if (!IsVoiceControlAvailable) {
    id v4 = AXAssistiveTouchIconTypeGestures;
  }
  if (IsSiriAvailable) {
    id v4 = AXAssistiveTouchIconTypeSiri;
  }
  int64_t v5 = *v4;
  v9[2] = @"AXAssistiveTouchIconTypeDevice";
  v9[3] = v5;
  v8[4] = @"AXAssistiveTouchIconLocationBottomMiddle";
  v8[5] = @"AXAssistiveTouchIconLocationMidRight";
  v9[4] = @"AXAssistiveTouchIconTypeHome";
  v9[5] = @"AXAssistiveTouchIconTypeControlCenter";
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:6];

  return (NSDictionary *)v6;
}

- (NSDictionary)assistiveTouchMainScreenCustomization
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(AXSettings *)self valueForPreferenceKey:@"AXSAssistiveTouchMainScreenCustomizationPreference"];
  if (!v3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v4 = [(AXSettings *)self assistiveTouchMainScreenDefaultCustomization];

    [(AXSettings *)self setAssistiveTouchMainScreenCustomization:v4];
    BOOL v3 = (void *)v4;
  }
  BOOL IsSiriAvailable = AXDeviceIsSiriAvailable();
  int IsVoiceControlAvailable = AXDeviceIsVoiceControlAvailable();
  int v7 = IsVoiceControlAvailable;
  BOOL v27 = IsSiriAvailable;
  if (!IsSiriAvailable || (IsVoiceControlAvailable & 1) == 0)
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id obj = [v3 allKeys];
    uint64_t v8 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v29;
      id v11 = @"AXAssistiveTouchIconTypeGestures";
      if (v7) {
        id v11 = @"AXAssistiveTouchIconTypeVoiceControl";
      }
      uint64_t v25 = v11;
      uint64_t v24 = @"AXAssistiveTouchIconTypeActionButton";
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v29 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void *)(*((void *)&v28 + 1) + 8 * i);
          id v14 = objc_msgSend(v3, "objectForKeyedSubscript:", v13, v24);
          int v15 = [v14 isEqualToString:@"AXAssistiveTouchIconTypeSiri"];

          if (((v15 ^ 1 | v27) & 1) == 0)
          {
            int v16 = (void *)[v3 mutableCopy];
            [v16 setObject:v25 forKeyedSubscript:v13];

            BOOL v3 = v16;
          }
          uint64_t v17 = [v3 objectForKeyedSubscript:v13];
          int v18 = [v17 isEqualToString:@"AXAssistiveTouchIconTypeVoiceControl"];

          if (((v18 ^ 1 | v7) & 1) == 0)
          {
            v19 = (void *)[v3 mutableCopy];
            [v19 setObject:@"AXAssistiveTouchIconTypeGestures" forKeyedSubscript:v13];

            BOOL v3 = v19;
          }
          if (AXDeviceHasStaccato())
          {
            CFStringRef v20 = [v3 objectForKeyedSubscript:v13];
            int v21 = [v20 isEqualToString:@"AXAssistiveTouchIconTypeMute"];

            if (v21)
            {
              char v22 = (void *)[v3 mutableCopy];
              [v22 setObject:v24 forKeyedSubscript:v13];

              BOOL v3 = v22;
            }
          }
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v9);
    }
  }

  return (NSDictionary *)v3;
}

- (BOOL)assistiveTouchGameControllerEnabled
{
  return AXSettingsReturnBoolValue(@"AXSAssitiveTouchGameControllerPreference", 0);
}

- (void)setAssistiveTouchGameControllerEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AXSAssitiveTouchGameControllerPreference"];
}

- (NSArray)switchControlRecipes
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(AXSettings *)self valueForPreferenceKey:@"SCRecipes"];
  id v4 = (void *)v3;
  if (!v3)
  {
    int64_t v5 = (void *)MEMORY[0x1E4F1C978];
    id v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    int v7 = [v6 pathForResource:@"SwitchControlDefaultRecipes" ofType:@"plist"];
    id v4 = [v5 arrayWithContentsOfFile:v7];
  }
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v4;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = +[AXSwitchRecipe recipeWithDictionaryRepresentation:](AXSwitchRecipe, "recipeWithDictionaryRepresentation:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
        [v8 addObject:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  if (!v3) {
    [(AXSettings *)self setSwitchControlRecipes:v8];
  }

  return (NSArray *)v8;
}

- (void)setSwitchControlRecipes:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int64_t v5 = v4;
  if (v4)
  {
    id v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "dictionaryRepresentation", (void)v13);
          [v6 addObject:v12];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);
    }
  }
  else
  {
    id v6 = 0;
  }
  [(AXBaseSettings *)self setValue:v6, @"SCRecipes", (void)v13 forPreferenceKey];
}

- (NSUUID)switchControlLaunchRecipeUUID
{
  uint64_t v2 = [(AXSettings *)self valueForPreferenceKey:@"SCLaunchRecipeUUID"];
  if (v2) {
    uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v2];
  }
  else {
    uint64_t v3 = 0;
  }

  return (NSUUID *)v3;
}

- (void)setSwitchControlLaunchRecipeUUID:(id)a3
{
  id v4 = [a3 UUIDString];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"SCLaunchRecipeUUID"];
}

- (id)_switchControlMenuItemsForPreferenceKey:(id)a3 allTypes:(id)a4 enabledByDefault:(BOOL)a5 topLevel:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v52 = a5;
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = [(AXSettings *)self valueForPreferenceKey:v9];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    uint64_t v11 = 0;
  }
  if (([(NSMutableSet *)self->_migratedSwitchControlMenuItemsPreferenceKeys containsObject:v9] & 1) == 0)
  {
    if (v11)
    {
      v48 = self;
      BOOL v53 = [(AXSettings *)self _switchControlHasEmptyTopLevelMenuItems:v11];
      v45 = v11;
      uint64_t v11 = (void *)[v11 mutableCopy];
      uint64_t v12 = [v11 count];
      long long v13 = (id *)MEMORY[0x1E4F48170];
      if (v12 - 1 >= 0)
      {
        uint64_t v14 = v12;
        uint64_t v15 = *MEMORY[0x1E4F48170];
        do
        {
          long long v16 = [v11 objectAtIndexedSubscript:--v14];
          long long v17 = [v16 objectForKey:v15];

          uint64_t v18 = [(AXSettings *)v48 _allSubmenuKeys];
          int v19 = [v18 containsObject:v17];

          if (([v10 containsObject:v17] & 1) == 0 && (v6 & v19 & 1) == 0) {
            [v11 removeObjectAtIndex:v14];
          }
        }
        while (v14 > 0);
      }
      id v46 = v10;
      id v47 = v9;
      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      id v20 = v10;
      uint64_t v21 = [v20 countByEnumeratingWithState:&v56 objects:v66 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        unsigned int v54 = !v53;
        uint64_t v23 = *(void *)v57;
        id obj = *v13;
        uint64_t v49 = *MEMORY[0x1E4F48030];
        do
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v57 != v23) {
              objc_enumerationMutation(v20);
            }
            uint64_t v25 = *(void *)(*((void *)&v56 + 1) + 8 * i);
            v55[0] = MEMORY[0x1E4F143A8];
            v55[1] = 3221225472;
            v55[2] = __89__AXSettings__switchControlMenuItemsForPreferenceKey_allTypes_enabledByDefault_topLevel___block_invoke;
            v55[3] = &unk_1E55882B8;
            v55[4] = v25;
            uint64_t v26 = [v11 indexOfObjectPassingTest:v55];
            uint64_t v27 = [v20 indexOfObject:v25];
            if (v26 == 0x7FFFFFFFFFFFFFFFLL)
            {
              unint64_t v28 = v27;
              v64[0] = obj;
              v64[1] = v49;
              v65[0] = v25;
              long long v29 = [NSNumber numberWithBool:v54];
              v65[1] = v29;
              long long v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v65 forKeys:v64 count:2];

              if (v28 <= [v11 count]) {
                [v11 insertObject:v30 atIndex:v28];
              }
              else {
                [v11 addObject:v30];
              }
            }
          }
          uint64_t v22 = [v20 countByEnumeratingWithState:&v56 objects:v66 count:16];
        }
        while (v22);
      }

      long long v31 = v45;
    }
    else
    {
      if ([v9 isEqualToString:@"SCTopLevelMenuItems"])
      {
        uint64_t v11 = [(AXSettings *)self _switchControlMigratePreMonarchIncludedMenuItemsForNewTypes:v10];
LABEL_35:
        [(AXBaseSettings *)self setValue:v11 forPreferenceKey:v9];
        migratedSwitchControlMenuItemsPreferenceKeys = self->_migratedSwitchControlMenuItemsPreferenceKeys;
        if (!migratedSwitchControlMenuItemsPreferenceKeys)
        {
          v42 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
          v43 = self->_migratedSwitchControlMenuItemsPreferenceKeys;
          self->_migratedSwitchControlMenuItemsPreferenceKeys = v42;

          migratedSwitchControlMenuItemsPreferenceKeys = self->_migratedSwitchControlMenuItemsPreferenceKeys;
        }
        [(NSMutableSet *)migratedSwitchControlMenuItemsPreferenceKeys addObject:v9];
        goto LABEL_38;
      }
      id v47 = v9;
      v48 = self;
      uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
      long long v60 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      id v46 = v10;
      id obja = v10;
      uint64_t v32 = [obja countByEnumeratingWithState:&v60 objects:v69 count:16];
      if (v32)
      {
        uint64_t v33 = v32;
        uint64_t v34 = *(void *)v61;
        uint64_t v35 = *MEMORY[0x1E4F48170];
        uint64_t v36 = *MEMORY[0x1E4F48030];
        do
        {
          for (uint64_t j = 0; j != v33; ++j)
          {
            if (*(void *)v61 != v34) {
              objc_enumerationMutation(obja);
            }
            uint64_t v38 = *(void *)(*((void *)&v60 + 1) + 8 * j);
            v67[1] = v36;
            v68[0] = v38;
            v67[0] = v35;
            v39 = [NSNumber numberWithBool:v52];
            v68[1] = v39;
            v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v68 forKeys:v67 count:2];
            [v11 addObject:v40];
          }
          uint64_t v33 = [obja countByEnumeratingWithState:&v60 objects:v69 count:16];
        }
        while (v33);
      }
      long long v31 = obja;
    }

    id v10 = v46;
    id v9 = v47;
    self = v48;
    goto LABEL_35;
  }
LABEL_38:

  return v11;
}

uint64_t __89__AXSettings__switchControlMenuItemsForPreferenceKey_allTypes_enabledByDefault_topLevel___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 objectForKeyedSubscript:*MEMORY[0x1E4F48170]];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (id)_switchControlMigratePreMonarchIncludedMenuItemsForNewTypes:(id)a3
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  Boolean keyExistsAndHasValidFormat = 0;
  uint64_t v4 = (CFStringRef *)MEMORY[0x1E4FB9098];
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"AXSAssistiveTouchScannerMenuIncludeHomeItem", (CFStringRef)*MEMORY[0x1E4FB9098], &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v6 = AppBooleanValue == 0;
  }
  else {
    BOOL v6 = 0;
  }
  uint64_t v7 = !v6;
  int v8 = CFPreferencesGetAppBooleanValue(@"AXSAssistiveTouchScannerMenuIncludeGesturesItem", *v4, &keyExistsAndHasValidFormat);
  int v9 = keyExistsAndHasValidFormat;
  int v10 = CFPreferencesGetAppBooleanValue(@"AXSAssistiveTouchScannerMenuIncludeScrollItem", *v4, &keyExistsAndHasValidFormat);
  int v11 = keyExistsAndHasValidFormat;
  int v12 = CFPreferencesGetAppBooleanValue(@"AXSAssistiveTouchScannerMenuIncludeDeviceItem", *v4, &keyExistsAndHasValidFormat);
  int v13 = keyExistsAndHasValidFormat;
  int v14 = CFPreferencesGetAppBooleanValue(@"AXSAssistiveTouchScannerMenuIncludeSettingsItem", *v4, &keyExistsAndHasValidFormat);
  if (v9) {
    BOOL v15 = v8 == 0;
  }
  else {
    BOOL v15 = 0;
  }
  int v16 = !v15;
  unsigned int v54 = v16;
  if (v15) {
    int v17 = v7;
  }
  else {
    int v17 = 1;
  }
  if (v11) {
    BOOL v18 = v10 == 0;
  }
  else {
    BOOL v18 = 0;
  }
  int v19 = !v18;
  unsigned int v56 = v19;
  if (!v18) {
    int v17 = 1;
  }
  if (v13) {
    BOOL v20 = v12 == 0;
  }
  else {
    BOOL v20 = 0;
  }
  int v21 = !v20;
  unsigned int v52 = v21;
  if (!v20) {
    int v17 = 1;
  }
  if (keyExistsAndHasValidFormat) {
    BOOL v22 = v14 == 0;
  }
  else {
    BOOL v22 = 0;
  }
  int v23 = !v22;
  if (!v22) {
    int v17 = 1;
  }
  unsigned int v48 = v17;
  unsigned int v49 = v23;
  objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  id v58 = (id)objc_claimAutoreleasedReturnValue();
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id obj = v3;
  uint64_t v24 = [obj countByEnumeratingWithState:&v63 objects:v72 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v64;
    uint64_t v27 = *MEMORY[0x1E4F480A8];
    uint64_t v55 = *MEMORY[0x1E4F48120];
    uint64_t v53 = *MEMORY[0x1E4F48038];
    uint64_t v51 = *MEMORY[0x1E4F47F68];
    uint64_t v50 = *MEMORY[0x1E4F48108];
    uint64_t v47 = *MEMORY[0x1E4F48128];
    uint64_t v28 = *MEMORY[0x1E4F48170];
    uint64_t v29 = *MEMORY[0x1E4F48030];
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v64 != v26) {
          objc_enumerationMutation(obj);
        }
        long long v31 = *(void **)(*((void *)&v63 + 1) + 8 * i);
        char v32 = [v31 isEqualToString:v27];
        uint64_t v33 = v7;
        if ((v32 & 1) == 0)
        {
          char v34 = [v31 isEqualToString:v55];
          uint64_t v33 = v56;
          if ((v34 & 1) == 0)
          {
            char v35 = [v31 isEqualToString:v53];
            uint64_t v33 = v54;
            if ((v35 & 1) == 0)
            {
              char v36 = [v31 isEqualToString:v51];
              uint64_t v33 = v52;
              if ((v36 & 1) == 0)
              {
                if (([v31 isEqualToString:v50] & 1) != 0
                  || (v37 = [v31 isEqualToString:v47], uint64_t v33 = v48, v37))
                {
                  uint64_t v33 = v49;
                }
              }
            }
          }
        }
        v70[1] = v29;
        v71[0] = v31;
        v70[0] = v28;
        uint64_t v38 = [NSNumber numberWithBool:v33];
        v71[1] = v38;
        v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v71 forKeys:v70 count:2];
        [v58 addObject:v39];
      }
      uint64_t v25 = [obj countByEnumeratingWithState:&v63 objects:v72 count:16];
    }
    while (v25);
  }

  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  v68[0] = @"AXSAssistiveTouchScannerMenuIncludeHomeItem";
  v68[1] = @"AXSAssistiveTouchScannerMenuIncludeGesturesItem";
  void v68[2] = @"AXSAssistiveTouchScannerMenuIncludeScrollItem";
  v68[3] = @"AXSAssistiveTouchScannerMenuIncludeDeviceItem";
  v68[4] = @"AXSAssistiveTouchScannerMenuIncludeSettingsItem";
  v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:5];
  uint64_t v41 = [v40 countByEnumeratingWithState:&v59 objects:v69 count:16];
  v42 = (CFStringRef *)MEMORY[0x1E4FB9098];
  if (v41)
  {
    uint64_t v43 = v41;
    uint64_t v44 = *(void *)v60;
    do
    {
      for (uint64_t j = 0; j != v43; ++j)
      {
        if (*(void *)v60 != v44) {
          objc_enumerationMutation(v40);
        }
        CFPreferencesSetAppValue(*(CFStringRef *)(*((void *)&v59 + 1) + 8 * j), 0, *v42);
      }
      uint64_t v43 = [v40 countByEnumeratingWithState:&v59 objects:v69 count:16];
    }
    while (v43);
  }

  CFPreferencesAppSynchronize(*v42);

  return v58;
}

- (id)topLevelKeys
{
  v13[18] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F48028];
  v13[0] = *MEMORY[0x1E4F480B0];
  v13[1] = v2;
  uint64_t v3 = *MEMORY[0x1E4F480A8];
  v13[2] = *MEMORY[0x1E4F48120];
  v13[3] = v3;
  uint64_t v4 = *MEMORY[0x1E4F48038];
  v13[4] = *MEMORY[0x1E4F48158];
  v13[5] = v4;
  uint64_t v5 = *MEMORY[0x1E4F48118];
  v13[6] = *MEMORY[0x1E4F48020];
  v13[7] = v5;
  uint64_t v6 = *MEMORY[0x1E4F47F68];
  v13[8] = *MEMORY[0x1E4F48108];
  v13[9] = v6;
  uint64_t v7 = *MEMORY[0x1E4F48128];
  v13[10] = *MEMORY[0x1E4F480C8];
  v13[11] = v7;
  uint64_t v8 = *MEMORY[0x1E4F48110];
  v13[12] = *MEMORY[0x1E4F48160];
  v13[13] = v8;
  uint64_t v9 = *MEMORY[0x1E4F480C0];
  v13[14] = *MEMORY[0x1E4F480B8];
  v13[15] = v9;
  uint64_t v10 = *MEMORY[0x1E4F47F48];
  v13[16] = *MEMORY[0x1E4F48168];
  v13[17] = v10;
  int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:18];

  return v11;
}

- (NSArray)switchControlTopLevelMenuItems
{
  uint64_t v3 = [(AXSettings *)self topLevelKeys];
  uint64_t v4 = [(AXSettings *)self _switchControlMenuItemsForPreferenceKey:@"SCTopLevelMenuItems" allTypes:v3 enabledByDefault:1 topLevel:1];

  return (NSArray *)v4;
}

- (void)setSwitchControlTopLevelMenuItems:(id)a3
{
}

- (BOOL)switchControlHasEmptyTopLevelMenu
{
  uint64_t v2 = self;
  uint64_t v3 = [(AXSettings *)self switchControlTopLevelMenuItems];
  LOBYTE(v2) = [(AXSettings *)v2 _switchControlHasEmptyTopLevelMenuItems:v3];

  return (char)v2;
}

- (BOOL)_switchControlHasEmptyTopLevelMenuItems:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v21;
    uint64_t v7 = *MEMORY[0x1E4F48030];
    uint64_t v8 = *MEMORY[0x1E4F48170];
    uint64_t v9 = *MEMORY[0x1E4F48158];
    uint64_t v18 = *MEMORY[0x1E4F480B8];
    uint64_t v17 = *MEMORY[0x1E4F480C0];
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(v3);
        }
        int v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        int v12 = [v11 objectForKeyedSubscript:v7];
        int v13 = [v12 BOOLValue];

        if (v13)
        {
          int v14 = [v11 objectForKeyedSubscript:v8];
          if ([v14 isEqualToString:v9])
          {
            if (AXDeviceSupportsSideApp()) {
              goto LABEL_17;
            }
          }
          else if (([v14 isEqualToString:v18] & 1) == 0 {
                 && ![v14 isEqualToString:v17]
          }
                 || [(AXSettings *)self switchControlTapBehavior] == 2)
          {
LABEL_17:

            BOOL v15 = 0;
            goto LABEL_18;
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v15 = 1;
LABEL_18:

  return v15;
}

- (void)setSwitchControlShouldUseShortFirstPage:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"SCShouldUseShortFirstPage"];
}

- (BOOL)switchControlShouldUseShortFirstPage
{
  uint64_t v2 = [(AXSettings *)self valueForPreferenceKey:@"SCShouldUseShortFirstPage"];
  id v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (NSArray)gestureKeys
{
  v11[12] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F48060];
  v11[0] = *MEMORY[0x1E4F48098];
  v11[1] = v2;
  uint64_t v3 = *MEMORY[0x1E4F48088];
  v11[2] = *MEMORY[0x1E4F48080];
  v11[3] = v3;
  uint64_t v4 = *MEMORY[0x1E4F48050];
  v11[4] = *MEMORY[0x1E4F480A0];
  v11[5] = v4;
  uint64_t v5 = *MEMORY[0x1E4F48040];
  v11[6] = *MEMORY[0x1E4F48078];
  v11[7] = v5;
  uint64_t v6 = *MEMORY[0x1E4F48070];
  v11[8] = *MEMORY[0x1E4F48048];
  v11[9] = v6;
  uint64_t v7 = *MEMORY[0x1E4F48090];
  v11[10] = *MEMORY[0x1E4F48058];
  v11[11] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:12];
  if (AXForceTouchAvailableAndEnabled())
  {
    uint64_t v9 = [v8 arrayByAddingObject:*MEMORY[0x1E4F48068]];

    uint64_t v8 = (void *)v9;
  }

  return (NSArray *)v8;
}

- (NSArray)switchControlGesturesMenuItems
{
  uint64_t v3 = [(AXSettings *)self gestureKeys];
  uint64_t v4 = [(AXSettings *)self _switchControlMenuItemsForPreferenceKey:@"SCGesturesMenuItems" allTypes:v3 enabledByDefault:1 topLevel:0];

  return (NSArray *)v4;
}

- (void)setSwitchControlGesturesMenuItems:(id)a3
{
}

- (NSArray)switchControlGesturesTopLevelMenuItems
{
  uint64_t v3 = [(AXSettings *)self gestureKeys];
  uint64_t v4 = [(AXSettings *)self _switchControlMenuItemsForPreferenceKey:@"SCGesturesTopLevelMenuItems" allTypes:v3 enabledByDefault:0 topLevel:0];

  return (NSArray *)v4;
}

- (void)setSwitchControlGesturesTopLevelMenuItems:(id)a3
{
}

- (NSArray)deviceKeys
{
  v20[22] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_opt_new();
  uint64_t v3 = *MEMORY[0x1E4F48000];
  v20[0] = *MEMORY[0x1E4F47F70];
  v20[1] = v3;
  uint64_t v4 = *MEMORY[0x1E4F47F80];
  v20[2] = *MEMORY[0x1E4F47FA8];
  v20[3] = v4;
  uint64_t v5 = *MEMORY[0x1E4F47FB8];
  v20[4] = *MEMORY[0x1E4F47F98];
  v20[5] = v5;
  uint64_t v6 = *MEMORY[0x1E4F48018];
  v20[6] = *MEMORY[0x1E4F47FA0];
  v20[7] = v6;
  uint64_t v7 = *MEMORY[0x1E4F47FD8];
  v20[8] = *MEMORY[0x1E4F47FE8];
  v20[9] = v7;
  uint64_t v8 = *MEMORY[0x1E4F48008];
  v20[10] = *MEMORY[0x1E4F48010];
  v20[11] = v8;
  uint64_t v9 = *MEMORY[0x1E4F47FC8];
  v20[12] = *MEMORY[0x1E4F47FD0];
  v20[13] = v9;
  uint64_t v10 = *MEMORY[0x1E4F47FE0];
  v20[14] = *MEMORY[0x1E4F47F88];
  v20[15] = v10;
  uint64_t v11 = *MEMORY[0x1E4F47F78];
  v20[16] = *MEMORY[0x1E4F47FC0];
  v20[17] = v11;
  uint64_t v12 = *MEMORY[0x1E4F47FF8];
  v20[18] = *MEMORY[0x1E4F47F90];
  v20[19] = v12;
  uint64_t v13 = *MEMORY[0x1E4F47FB0];
  v20[20] = *MEMORY[0x1E4F47FF0];
  v20[21] = v13;
  int v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:22];
  [v2 addObjectsFromArray:v14];

  if (AXDeviceSupportsCameraButton())
  {
    uint64_t v15 = *MEMORY[0x1E4F47F60];
    v19[0] = *MEMORY[0x1E4F47F50];
    v19[1] = v15;
    uint64_t v16 = *MEMORY[0x1E4F48178];
    v19[2] = *MEMORY[0x1E4F47F58];
    v19[3] = v16;
    uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:4];
    [v2 addObjectsFromArray:v17];
  }

  return (NSArray *)v2;
}

- (NSArray)switchControlDeviceMenuItems
{
  uint64_t v3 = [(AXSettings *)self deviceKeys];
  uint64_t v4 = [(AXSettings *)self _switchControlMenuItemsForPreferenceKey:@"SCDeviceMenuItems" allTypes:v3 enabledByDefault:1 topLevel:0];

  return (NSArray *)v4;
}

- (void)setSwitchControlDeviceMenuItems:(id)a3
{
}

- (NSArray)switchControlDeviceTopLevelMenuItems
{
  uint64_t v3 = [(AXSettings *)self deviceKeys];
  uint64_t v4 = [(AXSettings *)self _switchControlMenuItemsForPreferenceKey:@"SCDeviceTopLevelMenuItems" allTypes:v3 enabledByDefault:0 topLevel:0];

  return (NSArray *)v4;
}

- (void)setSwitchControlDeviceTopLevelMenuItems:(id)a3
{
}

- (NSArray)settingsKeys
{
  v6[5] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F48138];
  v6[0] = *MEMORY[0x1E4F48150];
  v6[1] = v2;
  uint64_t v3 = *MEMORY[0x1E4F48140];
  v6[2] = *MEMORY[0x1E4F48148];
  v6[3] = v3;
  v6[4] = *MEMORY[0x1E4F48130];
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:5];

  return (NSArray *)v4;
}

- (NSArray)switchControlSettingsMenuItems
{
  uint64_t v3 = [(AXSettings *)self settingsKeys];
  uint64_t v4 = [(AXSettings *)self _switchControlMenuItemsForPreferenceKey:@"SCSettingsMenuItems" allTypes:v3 enabledByDefault:1 topLevel:0];

  return (NSArray *)v4;
}

- (void)setSwitchControlSettingsMenuItems:(id)a3
{
}

- (NSArray)switchControlSettingsTopLevelMenuItems
{
  uint64_t v3 = [(AXSettings *)self settingsKeys];
  uint64_t v4 = [(AXSettings *)self _switchControlMenuItemsForPreferenceKey:@"SCSettingsTopLevelMenuItems" allTypes:v3 enabledByDefault:0 topLevel:0];

  return (NSArray *)v4;
}

- (void)setSwitchControlSettingsTopLevelMenuItems:(id)a3
{
}

- (void)setSwitchControlMediaControlsMenuItems:(id)a3
{
}

- (NSArray)mediaControlsKeys
{
  v7[7] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F480E0];
  v7[0] = *MEMORY[0x1E4F480E8];
  v7[1] = v2;
  uint64_t v3 = *MEMORY[0x1E4F480F8];
  v7[2] = *MEMORY[0x1E4F480D8];
  v7[3] = v3;
  uint64_t v4 = *MEMORY[0x1E4F480F0];
  v7[4] = *MEMORY[0x1E4F48100];
  v7[5] = v4;
  v7[6] = *MEMORY[0x1E4F480D0];
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:7];

  return (NSArray *)v5;
}

- (NSArray)switchControlMediaControlsMenuItems
{
  uint64_t v3 = [(AXSettings *)self mediaControlsKeys];
  uint64_t v4 = [(AXSettings *)self _switchControlMenuItemsForPreferenceKey:@"SCMediaControlsMenuItems" allTypes:v3 enabledByDefault:1 topLevel:0];

  return (NSArray *)v4;
}

- (void)setSwitchControlMediaControlsTopLevelMenuItems:(id)a3
{
}

- (NSArray)switchControlMediaControlsTopLevelMenuItems
{
  uint64_t v3 = [(AXSettings *)self mediaControlsKeys];
  uint64_t v4 = [(AXSettings *)self _switchControlMenuItemsForPreferenceKey:@"SCMediaControlsTopLevelMenuItems" allTypes:v3 enabledByDefault:0 topLevel:0];

  return (NSArray *)v4;
}

- (id)_allSubmenuKeys
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1C978];
  uint64_t v4 = [(AXSettings *)self gestureKeys];
  uint64_t v5 = [(AXSettings *)self deviceKeys];
  uint64_t v6 = [(AXSettings *)self settingsKeys];
  uint64_t v7 = [(AXSettings *)self mediaControlsKeys];
  uint64_t v8 = objc_msgSend(v3, "axArrayWithPossiblyNilArrays:", 4, v4, v5, v6, v7);

  return v8;
}

- (BOOL)switchControlShouldUseExtendedKeyboardPredictions
{
  return _AXSSwitchControlExtendedKeyboardPredictionsEnabled() != 0;
}

- (void)setSwitchControlShouldUseExtendedKeyboardPredictions:(BOOL)a3
{
}

- (BOOL)assistiveTouchShouldUseExtendedKeyboardPredictions
{
  return _AXSAssistiveTouchExtendedKeyboardPredictionsEnabled() != 0;
}

- (void)setAssistiveTouchShouldUseExtendedKeyboardPredictions:(BOOL)a3
{
}

- (BOOL)switchControlIgnoreInvalidSwitchConfiguration
{
  return AXSettingsReturnBoolValue(@"SCIgnoreInvalidSwitchConfiguration", 0);
}

- (void)setSwitchControlIgnoreInvalidSwitchConfiguration:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"SCIgnoreInvalidSwitchConfiguration"];
}

- (BOOL)switchControlRestartScanningAtCurrentKey
{
  return AXSettingsReturnBoolValue(@"SCRestartScanningAtCurrentKey", 0);
}

- (void)setSwitchControlRestartScanningAtCurrentKey:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"SCRestartScanningAtCurrentKey"];
}

- (int64_t)switchControlPointPickerSelectionStyle
{
  int64_t v3 = AXSettingsReturnIntegerValue(@"SCSwitchControlPointPickerSelectionStyle", 0);
  id v4 = [(AXSettings *)self valueForPreferenceKey:@"SCSwitchControlPointPickerSelectionStyle"];

  if (!v4)
  {
    uint64_t v5 = [(AXSettings *)self valueForPreferenceKey:@"SCSwitchControlPointPickerHighPrecisionEnabled"];
    uint64_t v6 = v5;
    if (v5)
    {
      if ([v5 BOOLValue]) {
        int64_t v3 = 2;
      }
      uint64_t v7 = [NSNumber numberWithInteger:v3];
      [(AXBaseSettings *)self setValue:v7 forPreferenceKey:@"SCSwitchControlPointPickerSelectionStyle"];

      [(AXBaseSettings *)self setValue:0 forPreferenceKey:@"SCSwitchControlPointPickerHighPrecisionEnabled"];
    }
  }
  return v3;
}

- (void)setSwitchControlPointPickerSelectionStyle:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"SCSwitchControlPointPickerSelectionStyle"];
}

- (BOOL)switchControlUseCameraForPointMode
{
  int v2 = AXDeviceSupportsHeadTracking();
  if (v2)
  {
    LOBYTE(v2) = AXSettingsReturnBoolValue(@"SCUseCameraForPointPicker", 0);
  }
  return v2;
}

- (void)setSwitchControlUseCameraForPointMode:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"SCUseCameraForPointPicker"];
}

- (double)switchControlCameraPointPickerSensitivity
{
  return AXSettingsReturnDoubleValue(@"SCCameraPointPickerSensitivity", 0.495);
}

- (void)setSwitchControlCameraPointPickerSensitivity:(double)a3
{
  id v4 = [NSNumber numberWithDouble:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"SCCameraPointPickerSensitivity"];
}

- (double)switchControlCameraPointPickerMovementToleranceInJoystickMode
{
  return AXSettingsReturnDoubleValue(@"SCCameraPointPickerMovementToleranceInJoystickMode", 0.495);
}

- (void)setSwitchControlCameraPointPickerMovementToleranceInJoystickMode:(double)a3
{
  id v4 = [NSNumber numberWithDouble:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"SCCameraPointPickerMovementToleranceInJoystickMode"];
}

- (unint64_t)switchControlCameraPointPickerMode
{
  return AXSettingsReturnIntegerValue(@"SCCameraPointPickerMode", 2);
}

- (void)setSwitchControlCameraPointPickerMode:(unint64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"SCCameraPointPickerMode"];
}

- (double)switchControlCameraPointPickerDwellActivationTimeout
{
  return AXSettingsReturnDoubleValue(@"SCCameraPointPickerDwellActivationTimeoutPreference", *MEMORY[0x1E4F48518]);
}

- (void)setSwitchControlCameraPointPickerDwellActivationTimeout:(double)a3
{
  if (*MEMORY[0x1E4F48520] < a3) {
    a3 = *MEMORY[0x1E4F48520];
  }
  if (*MEMORY[0x1E4F48528] >= a3) {
    a3 = *MEMORY[0x1E4F48528];
  }
  id v4 = [NSNumber numberWithDouble:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"SCCameraPointPickerDwellActivationTimeoutPreference"];
}

- (double)switchControlCameraPointPickerDwellMovementToleranceRadius
{
  return AXSettingsReturnDoubleValue(@"SCCameraPointPickerDwellMovementToleranceRadiusPreference", *MEMORY[0x1E4F48530]);
}

- (void)setSwitchControlCameraPointPickerDwellMovementToleranceRadius:(double)a3
{
  id v4 = [NSNumber numberWithDouble:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"SCCameraPointPickerDwellMovementToleranceRadiusPreference"];
}

- (int64_t)switchControlScanningStyle
{
  int64_t v3 = [(AXSettings *)self valueForPreferenceKey:@"SCScanningStyle"];
  if (!v3)
  {
    int64_t result = [(AXSettings *)self valueForPreferenceKey:@"AssistiveTouchAutoScanningEnabled"];
    if (!result) {
      return result;
    }
    uint64_t v5 = (void *)result;
    if ([(id)result BOOLValue]) {
      int64_t v3 = &unk_1EDC62AA8;
    }
    else {
      int64_t v3 = &unk_1EDC62AC0;
    }
    [(AXBaseSettings *)self setValue:v3 forPreferenceKey:@"SCScanningStyle"];
    [(AXBaseSettings *)self setValue:0 forPreferenceKey:@"AssistiveTouchAutoScanningEnabled"];
  }
  int64_t v6 = [v3 integerValue];

  return v6;
}

- (void)setSwitchControlScanningStyle:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"SCScanningStyle"];
}

- (int64_t)switchControlFirstLaunchScanningMode
{
  int64_t v3 = [(AXSettings *)self valueForPreferenceKey:@"SCFirstLaunchScanningMode"];
  if (v3) {
    uint64_t v4 = AXSettingsReturnIntegerValue(@"SCFirstLaunchScanningMode", 0);
  }
  else {
    uint64_t v4 = [(AXSettings *)self assistiveTouchScanningMode];
  }
  int64_t v5 = v4;

  return v5;
}

- (void)setSwitchControlFirstLaunchScanningMode:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"SCFirstLaunchScanningMode"];
}

- (id)switchControlLocStringForFirstLaunchScanningMode:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
  {
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v10 = AXParameterizedLocalizedString(2, off_1E5588548[a3], a3, v3, v4, v5, v6, v7, v8);
  }
  return v10;
}

- (double)switchControlDwellTime
{
  return AXSettingsReturnDoubleValue(@"SCDwellTime", 1.0);
}

- (void)setSwitchControlDwellTime:(double)a3
{
  if (*MEMORY[0x1E4F48510] > a3) {
    a3 = *MEMORY[0x1E4F48510];
  }
  if (a3 >= *MEMORY[0x1E4F48508]) {
    a3 = *MEMORY[0x1E4F48508];
  }
  id v4 = [NSNumber numberWithDouble:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"SCDwellTime"];
}

- (BOOL)switchControlDebugLoggingEnabled
{
  return AXSettingsReturnBoolValue(@"SCDebugLoggingEnabled", 0);
}

- (void)setSwitchControlDebugLoggingEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"SCDebugLoggingEnabled"];
}

- (int64_t)switchControlTapBehavior
{
  int64_t v3 = AXSettingsReturnIntegerValue(@"SCTapBehaviorPreference", 0);
  id v4 = [(AXSettings *)self valueForPreferenceKey:@"SCTapBehaviorPreference"];

  if (!v4)
  {
    uint64_t v5 = [(AXSettings *)self valueForPreferenceKey:@"AssistiveTouchScannerSelectTimeoutEnabled"];
    uint64_t v6 = v5;
    if (v5)
    {
      if ([v5 BOOLValue]) {
        int64_t v3 = 1;
      }
      uint64_t v7 = [NSNumber numberWithInteger:v3];
      [(AXBaseSettings *)self setValue:v7 forPreferenceKey:@"SCTapBehaviorPreference"];

      [(AXBaseSettings *)self setValue:0 forPreferenceKey:@"AssistiveTouchScannerSelectTimeoutEnabled"];
    }
  }
  int64_t v8 = [(AXSettings *)self switchControlScanningStyle];
  if (v3 == 1 && v8 == 2) {
    return 0;
  }
  else {
    return v3;
  }
}

- (void)setSwitchControlTapBehavior:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"SCTapBehaviorPreference"];
}

- (void)setSwitchControlAutoTapTimeout:(double)a3
{
  if (*MEMORY[0x1E4F487B0] > a3) {
    a3 = *MEMORY[0x1E4F487B0];
  }
  if (a3 >= *MEMORY[0x1E4F487A8]) {
    a3 = *MEMORY[0x1E4F487A8];
  }
  id v4 = [NSNumber numberWithDouble:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AssistiveTouchScannerSelectTimeout"];
}

- (double)switchControlAutoTapTimeout
{
  return AXSettingsReturnDoubleValue(@"AssistiveTouchScannerSelectTimeout", 0.75);
}

- (BOOL)switchControlShouldAlwaysActivateKeyboardKeys
{
  return AXSettingsReturnBoolValue(@"SCShouldAlwaysActivateKeyboardKeys", 0);
}

- (void)setSwitchControlShouldAlwaysActivateKeyboardKeys:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"SCShouldAlwaysActivateKeyboardKeys"];
}

- (BOOL)switchControlIsEnabledAsReceiver
{
  return AXSettingsReturnBoolValue(@"SCIsEnabledAsReceiver", 0);
}

- (void)setSwitchControlIsEnabledAsReceiver:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"SCIsEnabledAsReceiver"];
}

- (int64_t)switchControlScanAfterTapLocation
{
  return AXSettingsReturnIntegerValue(@"SCScanAfterTapLocation", 0);
}

- (void)setSwitchControlScanAfterTapLocation:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"SCScanAfterTapLocation"];
}

- (void)_switchControlClearMenuItemPreferences
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [(NSMutableSet *)self->_migratedSwitchControlMenuItemsPreferenceKeys removeAllObjects];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  int64_t v3 = [(AXSettings *)self _switchControlMenuItemPreferences];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        CFStringRef v8 = *(const __CFString **)(*((void *)&v9 + 1) + 8 * i);
        [(AXBaseSettings *)self setValue:0 forPreferenceKey:v8];
        CFPreferencesSetAppValue(v8, 0, [(AXSettings *)self _domainNameForDomain:1]);
        CFPreferencesAppSynchronize([(AXSettings *)self _domainNameForDomain:1]);
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (id)_switchControlMenuItemPreferences
{
  v4[10] = *MEMORY[0x1E4F143B8];
  v4[0] = @"SCTopLevelMenuItems";
  v4[1] = @"SCGesturesTopLevelMenuItems";
  v4[2] = @"SCDeviceTopLevelMenuItems";
  v4[3] = @"SCDeviceTopLevelMenuItems";
  v4[4] = @"SCSettingsTopLevelMenuItems";
  v4[5] = @"SCMediaControlsTopLevelMenuItems";
  v4[6] = @"SCGesturesMenuItems";
  v4[7] = @"SCDeviceMenuItems";
  v4[8] = @"SCSettingsMenuItems";
  v4[9] = @"SCMediaControlsMenuItems";
  int v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:10];

  return v2;
}

- (void)_switchControlClearMenuItemMigrationTracking
{
}

- (void)setTeachableMomentsNotificationsSeen:(id)a3
{
}

- (NSDictionary)teachableMomentsNotificationsSeen
{
  uint64_t v2 = objc_opt_class();

  return (NSDictionary *)AXSettingsReturnObjectValueWithClass(@"AXSTeachableMomentsNotificationSeen", 0, v2);
}

- (void)setTeachableMomentsDelayBeforeSending:(double)a3
{
  id v4 = [NSNumber numberWithDouble:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AXSTeachableMomentsDelayBeforeSending"];
}

- (double)teachableMomentsDelayBeforeSending
{
  return AXSettingsReturnDoubleValue(@"AXSTeachableMomentsDelayBeforeSending", 1800.0);
}

- (BOOL)zoomPreferencesWereInitialized
{
  return AXSettingsReturnBoolValue(@"ZoomPreferencesWereInitialized", 0);
}

- (void)setZoomPreferencesWereInitialized:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"ZoomPreferencesWereInitialized"];
}

- (CGRect)zoomWindowFrame
{
  uint64_t v2 = [(AXSettings *)self valueForPreferenceKey:@"ZoomWindowFrame"];
  int64_t v3 = v2;
  if (v2)
  {
    id v4 = (double *)[v2 bytes];
    double v5 = *v4;
    double v6 = v4[1];
    double v7 = v4[2];
    double v8 = v4[3];
  }
  else
  {
    double v5 = *MEMORY[0x1E4F1DB28];
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }

  double v9 = v5;
  double v10 = v6;
  double v11 = v7;
  double v12 = v8;
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (void)setZoomWindowFrame:(CGRect)a3
{
  CGRect v5 = a3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:&v5 length:32];
  [(AXBaseSettings *)self setValue:v4, @"ZoomWindowFrame", *(void *)&v5.origin.x, *(void *)&v5.origin.y, *(void *)&v5.size.width, *(void *)&v5.size.height forPreferenceKey];
}

- (double)dockSize
{
  return AXSettingsReturnDoubleValue(@"DockSize", *MEMORY[0x1E4F48200]);
}

- (void)setDockSize:(double)a3
{
  id v4 = [NSNumber numberWithDouble:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"DockSize"];
}

- (double)zoomScale
{
  return AXSettingsReturnDoubleValue(@"ZoomScale", *MEMORY[0x1E4F48218]);
}

- (void)setZoomScale:(double)a3
{
  id v4 = [NSNumber numberWithDouble:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"ZoomScale"];
}

- (CGPoint)zoomPanOffset
{
  uint64_t v2 = [(AXSettings *)self valueForPreferenceKey:@"ZoomPanOffset"];
  int64_t v3 = v2;
  if (v2)
  {
    NSPoint v4 = NSPointFromString(v2);
    CGFloat x = v4.x;
    CGFloat y = v4.y;
  }
  else
  {
    CGFloat x = *MEMORY[0x1E4F1DAD8];
    CGFloat y = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }

  double v7 = x;
  double v8 = y;
  result.CGFloat y = v8;
  result.CGFloat x = v7;
  return result;
}

- (void)setZoomPanOffset:(CGPoint)a3
{
  NSStringFromPoint(a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"ZoomPanOffset"];
}

- (CGPoint)zoomSlugNormalizedPosition
{
  uint64_t v2 = [(AXSettings *)self valueForPreferenceKey:@"ZoomSlugPosition"];
  int64_t v3 = v2;
  if (v2)
  {
    id v4 = (double *)[v2 bytes];
    double v5 = *v4;
    double v6 = v4[1];
  }
  else
  {
    double v5 = *MEMORY[0x1E4F1DAD8];
    double v6 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }

  double v7 = v5;
  double v8 = v6;
  result.CGFloat y = v8;
  result.CGFloat x = v7;
  return result;
}

- (void)setZoomSlugNormalizedPosition:(CGPoint)a3
{
  CGPoint v5 = a3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:&v5 length:16];
  [(AXBaseSettings *)self setValue:v4, @"ZoomSlugPosition", *(void *)&v5.x, *(void *)&v5.y forPreferenceKey];
}

- (NSString)zoomCurrentLensEffect
{
  uint64_t v2 = (void *)*MEMORY[0x1E4F48268];
  uint64_t v3 = objc_opt_class();

  return (NSString *)AXSettingsReturnObjectValueWithClass(@"ZoomCurrentLensEffect", v2, v3);
}

- (void)setZoomCurrentLensEffect:(id)a3
{
}

- (BOOL)zoomShowedBanner
{
  return AXSettingsReturnBoolValue(@"ZoomShowedBanner", 0);
}

- (void)setZoomShowedBanner:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"ZoomShowedBanner"];
}

- (BOOL)zoomInStandby
{
  return AXSettingsReturnBoolValue(@"ZoomInStandby", 1);
}

- (void)setZoomInStandby:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"ZoomInStandby"];
}

- (NSString)zoomCurrentLensMode
{
  uint64_t v2 = AXZoomLensDefault();
  uint64_t v3 = objc_opt_class();
  id v4 = AXSettingsReturnObjectValueWithClass(@"ZoomCurrentLensMode", v2, v3);

  return (NSString *)v4;
}

- (void)setZoomCurrentLensMode:(id)a3
{
}

- (BOOL)zoomShouldFollowFocus
{
  return AXSettingsReturnBoolValue(@"ZoomShouldFollowFocus", 1);
}

- (void)setZoomShouldFollowFocus:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"ZoomShouldFollowFocus"];
}

- (BOOL)zoomShouldShowSlug
{
  return AXSettingsReturnBoolValue(@"ZoomShouldShowSlug", 0);
}

- (void)setZoomShouldShowSlug:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"ZoomShouldShowSlug"];
}

- (BOOL)zoomPeekZoomEnabled
{
  return AXSettingsReturnBoolValue(@"ZoomPeekZoomEnabled", 1);
}

- (void)setZoomPeekZoomEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"ZoomPeekZoomEnabled"];
}

- (BOOL)zoomPeekZoomEverEnabled
{
  return AXSettingsReturnBoolValue(@"ZoomPeekZoomEverEnabled", 0);
}

- (void)setZoomPeekZoomEverEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"ZoomPeekZoomEverEnabled"];
}

- (int64_t)zoomSlugSingleTapAction
{
  return AXSettingsReturnIntegerValue(@"ZoomSlugSingleTapAction", 1);
}

- (void)setZoomSlugSingleTapAction:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"ZoomSlugSingleTapAction"];
}

- (int64_t)zoomSlugDoubleTapAction
{
  return AXSettingsReturnIntegerValue(@"ZoomSlugDoubleTapAction", 2);
}

- (void)setZoomSlugDoubleTapAction:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"ZoomSlugDoubleTapAction"];
}

- (int64_t)zoomSlugTripleTapAction
{
  return AXSettingsReturnIntegerValue(@"ZoomSlugTripleTapAction", 0);
}

- (void)setZoomSlugTripleTapAction:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"ZoomSlugTripleTapAction"];
}

- (BOOL)zoomSlugTapAndSlideToAdjustZoomLevelEnabled
{
  return AXSettingsReturnBoolValue(@"ZoomSlugTapAndSlideToAdjustZoomLevel", 1);
}

- (void)setZoomSlugTapAndSlideToAdjustZoomLevelEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"ZoomSlugTapAndSlideToAdjustZoomLevel"];
}

- (BOOL)zoomAlwaysUseWindowedZoomForTyping
{
  return AXSettingsReturnBoolValue(@"ZoomAlwaysUseWindowZoomForTyping", 0);
}

- (void)setZoomAlwaysUseWindowedZoomForTyping:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"ZoomAlwaysUseWindowZoomForTyping"];
}

- (NSString)zoomPreferredCurrentLensMode
{
  int IsPad = AXDeviceIsPad();
  uint64_t v3 = (void **)MEMORY[0x1E4F48278];
  if (!IsPad) {
    uint64_t v3 = (void **)MEMORY[0x1E4F48270];
  }
  id v4 = *v3;
  uint64_t v5 = objc_opt_class();

  return (NSString *)AXSettingsReturnObjectValueWithClass(@"ZoomPreferredLensMode", v4, v5);
}

- (void)setZoomPreferredCurrentLensMode:(id)a3
{
}

- (NSString)zoomPreferredCurrentDockPosition
{
  uint64_t v2 = (void *)*MEMORY[0x1E4F48238];
  uint64_t v3 = objc_opt_class();

  return (NSString *)AXSettingsReturnObjectValueWithClass(@"ZoomPreferredDockPosition", v2, v3);
}

- (void)setZoomPreferredCurrentDockPosition:(id)a3
{
}

- (double)zoomPreferredMaximumZoomScale
{
  return AXSettingsReturnDoubleValue(@"ZoomPreferredMaximumZoomScale", *MEMORY[0x1E4F48210]);
}

- (void)setZoomPreferredMaximumZoomScale:(double)a3
{
  if (*MEMORY[0x1E4F48298] > a3) {
    a3 = *MEMORY[0x1E4F48298];
  }
  if (a3 >= *MEMORY[0x1E4F48288]) {
    a3 = *MEMORY[0x1E4F48288];
  }
  id v4 = [NSNumber numberWithDouble:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"ZoomPreferredMaximumZoomScale"];
}

- (NSOrderedSet)zoomPreferredLensModes
{
  uint64_t v2 = AXZoomUserSelectableLensModes();
  uint64_t v3 = objc_opt_class();
  id v4 = AXSettingsReturnObjectValueWithClass(@"ZoomPreferredLensModes", v2, v3);

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v4];

    id v4 = (void *)v5;
  }

  return (NSOrderedSet *)v4;
}

- (NSOrderedSet)zoomPreferredDockPositions
{
  uint64_t v2 = AXZoomDockPositions();
  uint64_t v3 = objc_opt_class();
  id v4 = AXSettingsReturnObjectValueWithClass(@"ZoomPreferredDockPositions", v2, v3);

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v4];

    id v4 = (void *)v5;
  }

  return (NSOrderedSet *)v4;
}

- (void)setZoomPreferredLensModes:(id)a3
{
  id v4 = [a3 array];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"ZoomPreferredLensModes"];
}

- (void)setZoomPreferredDockPositions:(id)a3
{
  id v4 = [a3 array];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"ZoomPreferredDockPositions"];
}

- (double)zoomIdleSlugOpacity
{
  return AXSettingsReturnDoubleValue(@"ZoomIdleSlugOpacity", *MEMORY[0x1E4F48208]);
}

- (void)setZoomIdleSlugOpacity:(double)a3
{
  id v4 = [NSNumber numberWithDouble:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"ZoomIdleSlugOpacity"];
}

- (void)setZoomControllerColor:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"ZoomControllerColorPreference"];
}

- (int64_t)zoomControllerColor
{
  return AXSettingsReturnIntegerValue(@"ZoomControllerColorPreference", 1);
}

- (BOOL)zoomShouldAllowFullscreenAutopanning
{
  return AXSettingsReturnBoolValue(@"ZoomShouldAllowFullscreenAutopanning", 1);
}

- (void)setZoomShouldAllowFullscreenAutopanning:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"ZoomShouldAllowFullscreenAutopanning"];
}

- (BOOL)zoomKeyboardShortcutsEnabled
{
  return AXSettingsReturnBoolValue(@"ZoomShouldUseKeyboardShortcutsPreference", 1);
}

- (void)setZoomKeyboardShortcutsEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"ZoomShouldUseKeyboardShortcutsPreference"];
}

- (BOOL)zoomAdjustZoomLevelKbShortcutEnabled
{
  return AXSettingsReturnBoolValue(@"ZoomAdjustZoomLevelKeyboardShortcutEnabledPreference", 1);
}

- (void)setZoomAdjustZoomLevelKbShortcutEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"ZoomAdjustZoomLevelKeyboardShortcutEnabledPreference"];
}

- (BOOL)zoomToggleZoomKbShortcutEnabled
{
  return AXSettingsReturnBoolValue(@"ZoomToggleZoomKeyboardShortcutEnabledPreference", 1);
}

- (void)setZoomToggleZoomKbShortcutEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"ZoomToggleZoomKeyboardShortcutEnabledPreference"];
}

- (BOOL)zoomPanZoomKbShortcutEnabled
{
  return AXSettingsReturnBoolValue(@"ZoomPanZoomKeyboardShortcutEnabledPreference", 1);
}

- (void)setZoomPanZoomKbShortcutEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"ZoomPanZoomKeyboardShortcutEnabledPreference"];
}

- (BOOL)zoomResizeZoomWindowKbShortcutEnabled
{
  return AXSettingsReturnBoolValue(@"ZoomResizeZoomWindowKeyboardShortcutEnabledPreference", 0);
}

- (void)setZoomResizeZoomWindowKbShortcutEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"ZoomResizeZoomWindowKeyboardShortcutEnabledPreference"];
}

- (BOOL)zoomSwitchZoomModeKbShortcutEnabled
{
  return AXSettingsReturnBoolValue(@"ZoomSwitchZoomModeKeyboardShortcutEnabledPreference", 0);
}

- (void)setZoomSwitchZoomModeKbShortcutEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"ZoomSwitchZoomModeKeyboardShortcutEnabledPreference"];
}

- (BOOL)zoomTempToggleZoomKbShortcutEnabled
{
  return AXSettingsReturnBoolValue(@"ZoomTempToggleZoomKeyboardShortcutEnabledPreference", 0);
}

- (void)setZoomTempToggleZoomKbShortcutEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"ZoomTempToggleZoomKeyboardShortcutEnabledPreference"];
}

- (BOOL)zoomScrollWheelKbShortcutEnabled
{
  return AXSettingsReturnBoolValue(@"ZoomScrollWheelKeyboardShortcutEnabledPreference", 0);
}

- (void)setZoomScrollWheelKbShortcutEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"ZoomScrollWheelKeyboardShortcutEnabledPreference"];
}

- (BOOL)zoomTrackpadGestureEnabled
{
  return AXSettingsReturnBoolValue(@"kAXZoomTrackpadGestureEnabledPreference", 0);
}

- (void)setZoomTrackpadGestureEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"kAXZoomTrackpadGestureEnabledPreference"];
}

- (BOOL)zoomAutopannerShouldPanWithAcceleration
{
  return AXSettingsReturnBoolValue(@"ZoomAutopannerShouldPanWithAccelerationPreference", 0);
}

- (void)setZoomAutopannerShouldPanWithAcceleration:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"ZoomAutopannerShouldPanWithAccelerationPreference"];
}

- (BOOL)zoomShowWhileMirroring
{
  return AXSettingsReturnBoolValue(@"ZoomShowZoomWhileMirroringPreference", 0);
}

- (void)setZoomShowWhileMirroring:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"ZoomShowZoomWhileMirroringPreference"];
}

- (void)zoomUserHadLegacyZoomEnabled:(BOOL *)a3 wasZoomedIn:(BOOL *)a4 withScale:(double *)a5
{
  double v8 = (CFStringRef *)MEMORY[0x1E4FB93A8];
  double v9 = (void *)CFPreferencesCopyAppValue(@"Zoomed", (CFStringRef)*MEMORY[0x1E4FB93A8]);
  char v10 = [v9 BOOLValue];
  id v13 = (id)CFPreferencesCopyAppValue(@"ZoomLevel", *v8);

  [v13 floatValue];
  double v12 = v11;
  if (*MEMORY[0x1E4F48298] > v12) {
    double v12 = *MEMORY[0x1E4F48298];
  }
  if (a3) {
    *a3 = v9 != 0;
  }
  if (a4) {
    *a4 = v10;
  }
  if (a5) {
    *a5 = v12;
  }
}

- (BOOL)zoomDebugDisableZoomLensScaleTransform
{
  return AXSettingsReturnBoolValue(@"ZoomDebugDisableZoomLensScaleTransform", 0);
}

- (void)setZoomDebugDisableZoomLensScaleTransform:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"ZoomDebugDisableZoomLensScaleTransform"];
}

- (BOOL)zoomDebugShowExternalFocusRect
{
  return AXSettingsReturnBoolValue(@"ZoomDebugShowExternalFocusRectPreference", 0);
}

- (void)setZoomDebugShowExternalFocusRect:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"ZoomDebugShowExternalFocusRectPreference"];
}

- (void)setGuidedAccessAXFeaturesEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"kAXSGuidedAccessAXFeaturesEnabled"];
}

- (BOOL)guidedAccessAXFeaturesEnabled
{
  return AXSettingsReturnBoolValue(@"kAXSGuidedAccessAXFeaturesEnabled", 0);
}

- (void)setGuidedAccessAllowsUnlockWithTouchID:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"GuidedAccessAllowsUnlockWithTouchID"];
}

- (BOOL)guidedAccessAllowsUnlockWithTouchID
{
  return AXSettingsReturnBoolValue(@"GuidedAccessAllowsUnlockWithTouchID", 0);
}

- (NSString)guidedAccessToneIdentifierForTimeRestrictionEvents
{
  uint64_t v3 = [(AXSettings *)self valueForPreferenceKey:@"GuidedAccessToneIdentifierForTimeRestrictionEvent"];
  if (!v3) {
    goto LABEL_5;
  }
  uint64_t v11 = 0;
  double v12 = &v11;
  uint64_t v13 = 0x2050000000;
  id v4 = (void *)getTLToneManagerClass_softClass;
  uint64_t v14 = getTLToneManagerClass_softClass;
  if (!getTLToneManagerClass_softClass)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __getTLToneManagerClass_block_invoke;
    v10[3] = &unk_1E5585E30;
    v10[4] = &v11;
    __getTLToneManagerClass_block_invoke((uint64_t)v10);
    id v4 = (void *)v12[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v11, 8);
  double v6 = [v5 sharedToneManager];
  char v7 = [v6 toneWithIdentifierIsValid:v3];

  if ((v7 & 1) == 0)
  {
LABEL_5:
    uint64_t v8 = [(AXSettings *)self guidedAccessDefaultToneIdentifierForTimeRestrictionEvents];

    uint64_t v3 = (void *)v8;
  }

  return (NSString *)v3;
}

- (void)setGuidedAccessToneIdentifierForTimeRestrictionEvents:(id)a3
{
}

- (NSString)guidedAccessDefaultToneIdentifierForTimeRestrictionEvents
{
  uint64_t v6 = 0;
  char v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v2 = (void **)getTLToneIdentifierNoneSymbolLoc_ptr;
  uint64_t v9 = getTLToneIdentifierNoneSymbolLoc_ptr;
  if (!getTLToneIdentifierNoneSymbolLoc_ptr)
  {
    uint64_t v3 = (void *)ToneLibraryLibrary();
    v7[3] = (uint64_t)dlsym(v3, "TLToneIdentifierNone");
    getTLToneIdentifierNoneSymbolLoc_ptr = v7[3];
    uint64_t v2 = (void **)v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (!v2) {
    -[AXSettings guidedAccessDefaultToneIdentifierForTimeRestrictionEvents]();
  }
  id v4 = *v2;

  return (NSString *)v4;
}

- (BOOL)guidedAccessShouldSpeakForTimeRestrictionEvents
{
  return AXSettingsReturnBoolValue(@"GuidedAccessSpeakForTimeRestrictionEvent", 0);
}

- (void)setGuidedAccessShouldSpeakForTimeRestrictionEvents:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"GuidedAccessSpeakForTimeRestrictionEvent"];
}

- (BOOL)guidedAccessOverrideIdleTime
{
  return AXSettingsReturnBoolValue(@"kAXSGuidedAccessOverrideIdleTimePreference", 1);
}

- (int64_t)guidedAccessAutoLockTimeInSeconds
{
  return AXSettingsReturnIntegerValue(@"GuidedAccessAutoLockTimeInSeconds", *MEMORY[0x1E4F47F40]);
}

- (void)setGuidedAccessAutoLockTimeInSeconds:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"GuidedAccessAutoLockTimeInSeconds"];
}

- (BOOL)guidedAccessAllowsMultipleWindows
{
  return 1;
}

- (BOOL)guidedAccessUserPrefersMirroringForExternalDisplays
{
  return AXSettingsReturnBoolValue(@"GuidedAccessUserPrefersMirroringForExternalDisplays", 0);
}

- (void)setGuidedAccessUserPrefersMirroringForExternalDisplays:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"GuidedAccessUserPrefersMirroringForExternalDisplays"];
}

- (NSDictionary)gaxInternalSettingsUserAppProfile
{
  return (NSDictionary *)[(AXSettings *)self valueForPreferenceKey:@"GAXInternalSettingUserAppProfile"];
}

- (void)setGaxInternalSettingsUserAppProfile:(id)a3
{
}

- (NSDictionary)gaxInternalSettingsUserGlobalProfile
{
  return (NSDictionary *)[(AXSettings *)self valueForPreferenceKey:@"GAXInternalSettingUserGlobalProfile"];
}

- (void)setGaxInternalSettingsUserGlobalProfile:(id)a3
{
}

- (NSDictionary)gaxInternalSettingsSavedAccessibilityFeatures
{
  return (NSDictionary *)[(AXSettings *)self valueForPreferenceKey:@"GAXGlobalProfileSavedAXFeatures"];
}

- (void)setGaxInternalSettingsSavedAccessibilityFeatures:(id)a3
{
}

- (NSArray)gaxInternalSettingsSavedAccessibilityTripleClickOptions
{
  return (NSArray *)[(AXSettings *)self valueForPreferenceKey:@"GAXGlobalProfileSavedAXTripleClickOptions"];
}

- (void)setGaxInternalSettingsSavedAccessibilityTripleClickOptions:(id)a3
{
}

- (NSArray)gaxInternalSettingsUserConfiguredAppIDs
{
  return (NSArray *)[(AXSettings *)self valueForPreferenceKey:@"GAXGlobalProfileUserConfiguredAppIds"];
}

- (void)setGaxInternalSettingsUserConfiguredAppIDs:(id)a3
{
}

- (NSNumber)gaxInternalSettingsActiveAppOrientation
{
  return (NSNumber *)[(AXSettings *)self valueForPreferenceKey:@"GAXGlobalProfileActiveAppOrientation"];
}

- (void)setGaxInternalSettingsActiveAppOrientation:(id)a3
{
}

- (NSString)gaxInternalSettingsActiveAppID
{
  return (NSString *)[(AXSettings *)self valueForPreferenceKey:@"GAXGlobalProfileActiveAppID"];
}

- (void)setGaxInternalSettingsActiveAppID:(id)a3
{
}

- (BOOL)gaxInternalSettingsTimeRestrictionHasExpired
{
  return AXSettingsReturnBoolValue(@"GAXInternalSettingTimeRestrictionHasExpired", 0);
}

- (void)setGaxInternalSettingsTimeRestrictionHasExpired:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"GAXInternalSettingTimeRestrictionHasExpired"];
}

- (BOOL)gaxInternalSettingsIsActiveAppSelfLocked
{
  return AXSettingsReturnBoolValue(@"AXGAXInternalSettingIsActiveAppSelfLocked", 0);
}

- (void)setGaxInternalSettingsIsActiveAppSelfLocked:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AXGAXInternalSettingIsActiveAppSelfLocked"];
}

- (BOOL)gaxInternalSettingsSystemDidRestartDueToLowBattery
{
  return AXSettingsReturnBoolValue(@"GAXGlobalProfileSystemDidRestartDueToLowBattery", 0);
}

- (void)setGaxInternalSettingsSystemDidRestartDueToLowBattery:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"GAXGlobalProfileSystemDidRestartDueToLowBattery"];
}

- (NSNumber)gaxInternalSettingsECID
{
  return (NSNumber *)[(AXSettings *)self valueForPreferenceKey:@"GAXGlobalProfileECID"];
}

- (void)setGaxInternalSettingsECID:(id)a3
{
}

- (NSString)gaxInternalSettingsProductBuildVersion
{
  return (NSString *)[(AXSettings *)self valueForPreferenceKey:@"GAXGlobalProfileProductBuildVersion"];
}

- (void)setGaxInternalSettingsProductBuildVersion:(id)a3
{
}

- (NSDate)gaxInternalSettingsLastActivationDate
{
  return (NSDate *)[(AXSettings *)self valueForPreferenceKey:@"GAXGlobalProfileLastActivationDate"];
}

- (void)setGaxInternalSettingsLastActivationDate:(id)a3
{
}

- (NSDate)gaxInternalSettingsLastPasscodeSetDate
{
  return (NSDate *)[(AXSettings *)self valueForPreferenceKey:@"GAXGlobalProfileLastPasscodeSetDate"];
}

- (void)setGaxInternalSettingsLastPasscodeSetDate:(id)a3
{
}

- (void)setAssistiveTouchCameraSwitchPreviewEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AssistiveTouchCameraSwitchPreviewEnabledPreference"];
}

- (BOOL)assistiveTouchCameraSwitchPreviewEnabled
{
  return AXSettingsReturnBoolValue(@"AssistiveTouchCameraSwitchPreviewEnabledPreference", 0);
}

- (void)setAssistiveTouchInternalOnlyHiddenNubbitModeEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AssistiveTouchInternalOnlyHiddenNubbitModeEnabledPreference"];
}

- (BOOL)assistiveTouchInternalOnlyHiddenNubbitMode
{
  return AXSettingsReturnBoolValue(@"AssistiveTouchInternalOnlyHiddenNubbitModeEnabledPreference", 0);
}

- (void)setAssistiveTouchInternalOnlyPearlTrackingEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AssistiveTouchInternalOnlyPearlTrackingEnabledPreference"];
}

- (BOOL)assistiveTouchInternalOnlyPearlTrackingEnabled
{
  return AXSettingsReturnBoolValue(@"AssistiveTouchInternalOnlyPearlTrackingEnabledPreference", 0);
}

- (void)setValidateSecondPartyApps:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"ValidateSecondPartyApps"];
}

- (BOOL)validateSecondPartyApps
{
  return AXSettingsReturnBoolValue(@"ValidateSecondPartyApps", 0);
}

- (void)setIncludeBacktraceInLogs:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"IncludeBacktraceInLogs"];
}

- (BOOL)includeBacktraceInLogs
{
  return AXSettingsReturnBoolValue(@"IncludeBacktraceInLogs", 0);
}

- (BOOL)ignoreAXAsserts
{
  return AXSettingsReturnBoolValue(@"IgnoreAXAsserts", 0);
}

- (void)setIgnoreAXAsserts:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"IgnoreAXAsserts"];
}

- (BOOL)ignoreAXServerEntitlements
{
  return AXSettingsReturnBoolValue(@"IgnoreAXServerEntitlements", 0);
}

- (void)setIgnoreAXServerEntitlements:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"IgnoreAXServerEntitlements"];
}

- (BOOL)logAXNotificationPosting
{
  return AXSettingsReturnBoolValue(@"LogAXNotificationPosting", 0);
}

- (void)setLogAXNotificationPosting:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"LogAXNotificationPosting"];
}

- (BOOL)useNewAXBundleLoader
{
  return AXSettingsReturnBoolValue(@"UseNewAXBundleLoader", 1);
}

- (void)setUseNewAXBundleLoader:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"UseNewAXBundleLoader"];
}

- (BOOL)shouldPerformValidationsAtRuntime
{
  return AXSettingsReturnBoolValue(@"shouldPerformValidationsAtRuntime", 0);
}

- (void)setShouldPerformValidationsAtRuntime:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"shouldPerformValidationsAtRuntime"];
}

- (void)setInternalLoggingColorTheme:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"InternalLoggingColorThemePreference"];
}

- (int64_t)internalLoggingColorTheme
{
  uint64_t v2 = [(AXSettings *)self valueForPreferenceKey:@"InternalLoggingColorThemePreference"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int64_t v3 = [v2 integerValue];
  }
  else {
    int64_t v3 = 0;
  }

  return v3;
}

- (void)setEnableVoiceOverCaptions:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"VoiceOverCaptionPanelEnabled"];
}

- (BOOL)enableVoiceOverCaptions
{
  return AXSettingsReturnBoolValue(@"VoiceOverCaptionPanelEnabled", 0);
}

- (void)setSyncPronunciationsWithCloudKit:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"VoiceOverPronunciationCloudKitSyncingEnabled"];
}

- (BOOL)syncPronunciationsWithCloudKit
{
  return AXSettingsReturnBoolValue(@"VoiceOverPronunciationCloudKitSyncingEnabled", 0);
}

- (void)setDidTriggerSOSToday:(BOOL)a3
{
  if (a3)
  {
    uint64_t v4 = [MEMORY[0x1E4F1C9C8] date];
  }
  else
  {
    uint64_t v4 = 0;
  }
  id v5 = (id)v4;
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AXSDidTriggerSOSToday"];
}

- (BOOL)didTriggerSOSValueSet
{
  uint64_t v2 = objc_opt_class();
  int64_t v3 = AXSettingsReturnObjectValueWithClass(@"AXSDidTriggerSOSToday", 0, v2);
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)didTriggerSOSToday
{
  uint64_t v2 = objc_opt_class();
  int64_t v3 = AXSettingsReturnObjectValueWithClass(@"AXSDidTriggerSOSToday", 0, v2);
  if (v3)
  {
    BOOL v4 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    id v5 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v6 = [v4 components:16 fromDate:v3 toDate:v5 options:0];

    BOOL v7 = [v6 day] < 1;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)voiceOverFlashlightNotificationsEnabled
{
  int v2 = MGGetBoolAnswer();
  if (v2)
  {
    LOBYTE(v2) = AXSettingsReturnBoolValue(@"AXSVoiceOverFlashlightNotificationsEnabled", 1);
  }
  return v2;
}

- (void)setVoiceOverFlashlightNotificationsEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AXSVoiceOverFlashlightNotificationsEnabled"];
}

- (BOOL)voiceOverShowBrailleWatchSettings
{
  return _os_feature_enabled_impl();
}

- (double)voiceOverDelayUntilSpeakUnderTouch
{
  return AXSettingsReturnDoubleValue((void *)kAXSVoiceOverDelayUntilSpeakUnderTouch, 0.0);
}

- (void)setVoiceOverDelayUntilSpeakUnderTouch:(double)a3
{
  id v4 = [NSNumber numberWithDouble:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:kAXSVoiceOverDelayUntilSpeakUnderTouch];
}

- (BOOL)shouldCaptureVisionEngineDiagnosticsToDisk
{
  return AXSettingsReturnBoolValue(@"VisionEngineCaptureDiagnosticsToDisk", 0);
}

- (void)setShouldCaptureVisionEngineDiagnosticsToDisk:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"VisionEngineCaptureDiagnosticsToDisk"];
}

- (BOOL)automaticAccessibilityEnabled
{
  return AXSettingsReturnBoolValue(@"AutomaticAccessibilityEnabled", 0);
}

- (void)setAutomaticAccessibilityEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AutomaticAccessibilityEnabled"];
}

- (BOOL)automaticAccessibilityIgnoreAppAccessibilityPreferred
{
  return 1;
}

- (void)setAutomaticAccessibilityIgnoreAppAccessibilityPreferred:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AutomaticAccessibilityIgnoreAppAccessibilityPreferred"];
}

- (BOOL)automaticAccessibilityVisualizationsEnabled
{
  return AXSettingsReturnBoolValue(@"AutomaticAccessibilityVisualizationsEnabled", 0);
}

- (void)setAutomaticAccessibilityVisualizationsEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AutomaticAccessibilityVisualizationsEnabled"];
}

- (id)automaticAccessibilityModes
{
  uint64_t v2 = objc_opt_class();

  return AXSettingsReturnObjectValueWithClass(@"AutomaticAccessibilityModes", 0, v2);
}

- (void)setAutomaticAccessibilityModes:(id)a3
{
}

- (int64_t)automaticAccessibilityModeForBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(AXSettings *)self automaticAccessibilityModes];
  uint64_t v6 = [v5 objectForKey:v4];

  if (v6) {
    int64_t v7 = [v6 unsignedIntegerValue];
  }
  else {
    int64_t v7 = 0;
  }

  return v7;
}

- (void)setAutomaticAccessibilityMode:(int64_t)a3 forBundleIdentifier:(id)a4
{
  id v6 = a4;
  int64_t v7 = [(AXSettings *)self automaticAccessibilityModes];
  uint64_t v8 = (void *)[v7 mutableCopy];
  uint64_t v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  id v12 = v10;

  uint64_t v11 = [NSNumber numberWithInteger:a3];
  [v12 setObject:v11 forKey:v6];

  [(AXBaseSettings *)self setValue:v12 forPreferenceKey:@"AutomaticAccessibilityModes"];
}

- (id)voiceOverSelectedActivity
{
  int64_t v3 = [(AXSettings *)self valueForPreferenceKey:@"AXSVoiceOverSelectedActivityPreference"];
  if (v3)
  {
    id v4 = [(AXSettings *)self voiceOverActivities];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __39__AXSettings_voiceOverSelectedActivity__block_invoke;
    v8[3] = &unk_1E55882E0;
    id v9 = v3;
    id v5 = objc_msgSend(v4, "ax_filteredArrayUsingBlock:", v8);
    id v6 = [v5 firstObject];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

uint64_t __39__AXSettings_voiceOverSelectedActivity__block_invoke(uint64_t a1, void *a2)
{
  int64_t v3 = [a2 uuid];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:*(void *)(a1 + 32)];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

- (void)setVoiceOverSelectedActivity:(id)a3
{
  id v5 = [a3 uuid];
  id v4 = [v5 UUIDString];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AXSVoiceOverSelectedActivityPreference"];
}

- (BOOL)securePayAssertionActive
{
  return AXSettingsReturnBoolValue(@"AXSSecurePayAssertionActive", 0);
}

- (void)setSecurePayAssertionActive:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AXSSecurePayAssertionActive"];
}

- (void)setLiveRegionStatusForWebOrApp:(id)a3 status:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  int64_t v7 = [(AXSettings *)self valueForPreferenceKey:@"AXSVoiceOverLiveRegionAppStatus"];
  uint64_t v8 = (void *)[v7 mutableCopy];

  if (!v8)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  [v8 setObject:v6 forKeyedSubscript:v9];
  [(AXBaseSettings *)self setValue:v8 forPreferenceKey:@"AXSVoiceOverLiveRegionAppStatus"];
}

- (BOOL)liveRegionStatusEverSet
{
  uint64_t v2 = [(AXSettings *)self valueForPreferenceKey:@"AXSVoiceOverLiveRegionAppStatus"];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (id)liveRegionStatusForWebOrApp:(id)a3
{
  id v4 = a3;
  id v5 = [(AXSettings *)self valueForPreferenceKey:@"AXSVoiceOverLiveRegionAppStatus"];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (void)setVoiceOverKeyboardModifierChoice:(int64_t)a3
{
  if ((a3 & 3) == 0) {
    _AXAssert();
  }
  id v5 = [NSNumber numberWithInteger:a3];
  [(AXBaseSettings *)self setValue:v5 forPreferenceKey:@"AXSVoiceOverKeyboardModifierChoicePreference"];
}

- (int64_t)voiceOverKeyboardModifierChoice
{
  return AXSettingsReturnIntegerValue(@"AXSVoiceOverKeyboardModifierChoicePreference", 1);
}

- (void)setSkipHearingAidMFiAuth:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"InternalSkipHearingAidMFiAuth"];
}

- (BOOL)skipHearingAidMFiAuth
{
  return AXSettingsReturnBoolValue(@"InternalSkipHearingAidMFiAuth", 0);
}

- (void)setEnableHearingAidReporter:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"InternalEnableHearingAidReporter"];
}

- (BOOL)enableHearingAidReporter
{
  return AXSettingsReturnBoolValue(@"InternalEnableHearingAidReporter", 0);
}

- (BOOL)guidedAccessDisallowDirectInactiveToActiveTransition
{
  return AXSettingsReturnBoolValue(@"AXSInternalGuidedAccessDisallowDirectInactiveToActiveTransition", 0);
}

- (void)setGuidedAccessDisallowDirectInactiveToActiveTransition:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AXSInternalGuidedAccessDisallowDirectInactiveToActiveTransition"];
}

- (NSNumber)guidedAccessOverrideTimeRestrictionDuration
{
  return (NSNumber *)[(AXSettings *)self valueForPreferenceKey:@"AXSInternalGuidedAccessOverrideTimeRestrictionDuration"];
}

- (void)setGuidedAccessOverrideTimeRestrictionDuration:(id)a3
{
}

- (BOOL)guidedAccessEnableExperimentalUI
{
  return AXSettingsReturnBoolValue(@"AXSInternalGuidedAccessEnableExperimentalUI", 0);
}

- (void)setGuidedAccessEnableExperimentalUI:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AXSInternalGuidedAccessEnableExperimentalUI"];
}

- (void)setClassicInvertColors:(BOOL)a3
{
  BOOL v3 = a3;
  _AXSClassicInvertColorsSetEnabled();
  id v5 = [NSNumber numberWithBool:v3];
  [(AXBaseSettings *)self setValue:v5 forPreferenceKey:@"AXSClassicInvertColorsPreference"];
}

- (BOOL)classicInvertColors
{
  return _AXSClassicInvertColorsEnabled() != 0;
}

- (void)setTripleClickOrderedOptions:(id)a3
{
}

- (NSArray)tripleClickOrderedOptions
{
  uint64_t v2 = objc_opt_class();

  return (NSArray *)AXSettingsReturnObjectValueWithClass(@"AXSTripleClickUserOrderedPreference", 0, v2);
}

- (void)setSpeakCorrectionsEnabled:(BOOL)a3
{
  id v5 = objc_msgSend(NSNumber, "numberWithBool:");
  [(AXBaseSettings *)self setValue:v5 forPreferenceKey:@"SpeakCorrectionsEnabled"];

  if (a3)
  {
    MEMORY[0x1F4178EA8]();
  }
  else
  {
    char v6 = 0;
    if (MEMORY[0x192F9DE30](*MEMORY[0x1E4FB92F0], &v6))
    {
      [NSNumber numberWithBool:0];
      _AXSAccessibilitySetiTunesPreference();
    }
  }
}

- (BOOL)speakCorrectionsEnabled
{
  return AXSettingsReturnBoolValue(@"SpeakCorrectionsEnabled", 0);
}

- (BOOL)letterFeedbackEnabled
{
  return _AXSLetterFeedbackEnabled() != 0;
}

- (void)setLetterFeedbackEnabled:(BOOL)a3
{
}

- (BOOL)phoneticFeedbackEnabled
{
  return _AXSPhoneticFeedbackEnabled() != 0;
}

- (void)setPhoneticFeedbackEnabled:(BOOL)a3
{
}

- (double)characterFeedbackDelayDuration
{
  return AXSettingsReturnDoubleValue(@"CharacterFeedbackDelayPreference", *MEMORY[0x1E4F484E0]);
}

- (void)setCharacterFeedbackDelayDuration:(double)a3
{
  if (*MEMORY[0x1E4F484D8] < a3) {
    a3 = *MEMORY[0x1E4F484D8];
  }
  if (*MEMORY[0x1E4F484E0] >= a3) {
    a3 = *MEMORY[0x1E4F484E0];
  }
  id v4 = [NSNumber numberWithDouble:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"CharacterFeedbackDelayPreference"];
}

- (BOOL)quickTypeWordFeedbackEnabled
{
  return _AXSQuickTypePredictionFeedbackEnabled() != 0;
}

- (void)setQuickTypeWordFeedbackEnabled:(BOOL)a3
{
}

- (BOOL)wordFeedbackEnabled
{
  return _AXSWordFeedbackEnabled() != 0;
}

- (void)setWordFeedbackEnabled:(BOOL)a3
{
}

- (void)setShowSpeechController:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"ShowSpeechController"];
}

- (BOOL)showSpeechController
{
  return AXSettingsReturnBoolValue(@"ShowSpeechController", 0);
}

- (void)setSpeechControllerIdleOpacity:(double)a3
{
  id v4 = [NSNumber numberWithDouble:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"SpeechControllerIdleOpacity"];
}

- (double)speechControllerIdleOpacity
{
  return AXSettingsReturnDoubleValue(@"SpeechControllerIdleOpacity", 0.35);
}

- (void)setSpeechControllerLongPressAction:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"SpeechControllerLongPressAction"];
}

- (int64_t)speechControllerLongPressAction
{
  return AXSettingsReturnIntegerValue(@"SpeechControllerLongPressAction", 1);
}

- (void)setSpeechControllerDoubleTapAction:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"SpeechControllerDoubleTapAction"];
}

- (int64_t)speechControllerDoubleTapAction
{
  return AXSettingsReturnIntegerValue(@"SpeechControllerDoubleTapAction", 2);
}

- (float)quickSpeakVolume
{
  uint64_t v2 = [(AXSettings *)self valueForPreferenceKey:@"QuickSpeakVolume"];
  objc_opt_class();
  float v3 = 1.0;
  if (objc_opt_isKindOfClass())
  {
    [v2 floatValue];
    float v3 = v4;
  }

  return v3;
}

- (void)setQuickSpeakVolume:(float)a3
{
  objc_msgSend(NSNumber, "numberWithFloat:");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"QuickSpeakVolume"];
}

- (BOOL)quickSpeakUnderlineSentence
{
  return AXSettingsReturnBoolValue(@"QuickSpeakUnderlineSentence", 0);
}

- (void)setQuickSpeakUnderlineSentence:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"QuickSpeakUnderlineSentence"];
}

- (void)setQuickSpeakSpeakingRate:(float)a3
{
}

- (id)spokenContentVoiceSelectionForLanguage:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__12;
  uint64_t v18 = __Block_byref_object_dispose__12;
  id v19 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  char v6 = [(AXSettings *)self swiftSettings];
  int64_t v7 = [v6 spokenContent];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __53__AXSettings_spokenContentVoiceSelectionForLanguage___block_invoke;
  v11[3] = &unk_1E5588308;
  uint64_t v13 = &v14;
  uint64_t v8 = v5;
  id v12 = v8;
  [v7 voiceSelectionForLanguage:v4 completionHandler:v11];

  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  id v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);

  return v9;
}

void __53__AXSettings_spokenContentVoiceSelectionForLanguage___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)setSpokenContentVoiceSelectionForLanguage:(id)a3 selection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
  id v9 = [(AXSettings *)self swiftSettings];
  id v10 = [v9 spokenContent];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __66__AXSettings_setSpokenContentVoiceSelectionForLanguage_selection___block_invoke;
  v12[3] = &unk_1E5585F48;
  dispatch_semaphore_t v13 = v8;
  uint64_t v11 = v8;
  [v10 setForLanguage:v7 voiceSelection:v6 completionHandler:v12];

  dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __66__AXSettings_setSpokenContentVoiceSelectionForLanguage_selection___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (float)quickSpeakSpeakingRate
{
  uint64_t v2 = [(AXSettings *)self spokenContentVoiceSelectionForLanguage:0];
  float v3 = [v2 rate];
  id v4 = v3;
  if (!v3) {
    float v3 = &unk_1EDC635A8;
  }
  [v3 floatValue];
  float v6 = v5;

  return v6;
}

- (void)setQuickSpeakSentenceHighlightOption:(unint64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"QuickSpeakSentenceHighlight"];
}

- (unint64_t)quickSpeakSentenceHighlightOption
{
  uint64_t v2 = [(AXSettings *)self valueForPreferenceKey:@"QuickSpeakSentenceHighlight"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v3 = [v2 integerValue];
  }
  else {
    unint64_t v3 = 1;
  }

  return v3;
}

- (int64_t)quickSpeakWordHighlightColor
{
  return AXSettingsReturnIntegerValue(@"AXSQuickSpeakWordHighlightColorPreference", 0);
}

- (void)setQuickSpeakWordHighlightColor:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AXSQuickSpeakWordHighlightColorPreference"];
}

- (int64_t)quickSpeakSentenceHighlightColor
{
  return AXSettingsReturnIntegerValue(@"AXSQuickSpeakSentenceHighlightColorPreference", 0);
}

- (void)setQuickSpeakSentenceHighlightColor:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AXSQuickSpeakSentenceHighlightColorPreference"];
}

- (void)setQuickSpeakHighlightOption:(unint64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"QuickSpeakHighlightChoice"];
}

- (unint64_t)quickSpeakHighlightOption
{
  uint64_t v2 = [(AXSettings *)self valueForPreferenceKey:@"QuickSpeakHighlightChoice"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v3 = [v2 integerValue];
  }
  else {
    unint64_t v3 = 3;
  }

  return v3;
}

- (id)speechVoiceIdentifierForLanguageWithoutFallback:(id)a3 sourceKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  dispatch_semaphore_t v8 = [(AXSettings *)self valueForPreferenceKey:@"SpeechVoiceIdentifierForLanguage"];
  id v9 = [v8 objectForKey:v6];

  id v10 = [v9 objectForKey:v7];

  return v10;
}

- (id)liveSpeechVoiceIdentifierForKeyboardID:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__12;
  uint64_t v18 = __Block_byref_object_dispose__12;
  id v19 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  id v6 = [(AXSettings *)self swiftSettings];
  id v7 = [v6 liveSpeech];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __53__AXSettings_liveSpeechVoiceIdentifierForKeyboardID___block_invoke;
  v11[3] = &unk_1E5588330;
  dispatch_semaphore_t v13 = &v14;
  dispatch_semaphore_t v8 = v5;
  id v12 = v8;
  [v7 speechVoiceIdentifierForKeyboard:v4 completionHandler:v11];

  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  id v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);

  return v9;
}

void __53__AXSettings_liveSpeechVoiceIdentifierForKeyboardID___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (int64_t)liveSpeechMaxRecentsCount
{
  return AXSettingsReturnIntegerValue(@"AXSliveSpeechMaxRecentsCountPreference", 1);
}

- (void)setliveSpeechMaxRecentsCount:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AXSliveSpeechMaxRecentsCountPreference"];
}

- (id)speechVoiceIdentifierForLanguage:(id)a3 source:(int64_t)a4 exists:(BOOL *)a5
{
  dispatch_semaphore_t v8 = NSString;
  id v9 = a3;
  id v10 = objc_msgSend(v8, "stringWithFormat:", @"%d", a4);
  uint64_t v11 = [(AXSettings *)self speechVoiceIdentifierForLanguage:v9 sourceKey:v10 exists:a5];

  return v11;
}

- (id)speechVoiceIdentifierForLanguage:(id)a3 sourceKey:(id)a4 exists:(BOOL *)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([v9 isEqualToString:*MEMORY[0x1E4F481F8]])
  {
    dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
    uint64_t v40 = 0;
    uint64_t v41 = &v40;
    uint64_t v42 = 0x3032000000;
    uint64_t v43 = __Block_byref_object_copy__12;
    uint64_t v44 = __Block_byref_object_dispose__12;
    id v45 = 0;
    uint64_t v11 = [(AXSettings *)self swiftSettings];
    id v12 = [v11 voiceover];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __64__AXSettings_speechVoiceIdentifierForLanguage_sourceKey_exists___block_invoke;
    v37[3] = &unk_1E5588330;
    v39 = &v40;
    dispatch_semaphore_t v13 = v10;
    uint64_t v38 = v13;
    [v12 speechVoiceIdentifierForLanguage:v8 completionHandler:v37];

    dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
    id v14 = (id)v41[5];
    uint64_t v15 = v38;
LABEL_7:

    _Block_object_dispose(&v40, 8);
    goto LABEL_8;
  }
  if ([v9 isEqualToString:*MEMORY[0x1E4F481E0]])
  {
    dispatch_semaphore_t v16 = dispatch_semaphore_create(0);
    uint64_t v40 = 0;
    uint64_t v41 = &v40;
    uint64_t v42 = 0x3032000000;
    uint64_t v43 = __Block_byref_object_copy__12;
    uint64_t v44 = __Block_byref_object_dispose__12;
    id v45 = 0;
    uint64_t v17 = [(AXSettings *)self swiftSettings];
    uint64_t v18 = [v17 spokenContent];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __64__AXSettings_speechVoiceIdentifierForLanguage_sourceKey_exists___block_invoke_2;
    v34[3] = &unk_1E5588330;
    char v36 = &v40;
    id v19 = v16;
    char v35 = v19;
    [v18 speechVoiceIdentifierForLanguage:v8 exists:a5 completionHandler:v34];

    dispatch_semaphore_wait(v19, 0xFFFFFFFFFFFFFFFFLL);
    id v14 = (id)v41[5];

    _Block_object_dispose(&v40, 8);
    goto LABEL_8;
  }
  if ([v9 isEqualToString:*MEMORY[0x1E4F481E8]])
  {
    dispatch_semaphore_t v20 = dispatch_semaphore_create(0);
    uint64_t v40 = 0;
    uint64_t v41 = &v40;
    uint64_t v42 = 0x3032000000;
    uint64_t v43 = __Block_byref_object_copy__12;
    uint64_t v44 = __Block_byref_object_dispose__12;
    id v45 = 0;
    long long v21 = [(AXSettings *)self swiftSettings];
    long long v22 = [v21 assistiveTouch];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __64__AXSettings_speechVoiceIdentifierForLanguage_sourceKey_exists___block_invoke_3;
    v31[3] = &unk_1E5588330;
    uint64_t v33 = &v40;
    dispatch_semaphore_t v13 = v20;
    char v32 = v13;
    [v22 speechVoiceIdentifierForLanguage:v8 completionHandler:v31];

    dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
    id v14 = (id)v41[5];
    uint64_t v15 = v32;
    goto LABEL_7;
  }
  if ([v9 isEqualToString:*MEMORY[0x1E4F481D8]])
  {
    uint64_t v40 = 0;
    uint64_t v41 = &v40;
    uint64_t v42 = 0x3032000000;
    uint64_t v43 = __Block_byref_object_copy__12;
    uint64_t v44 = __Block_byref_object_dispose__12;
    id v45 = 0;
    dispatch_semaphore_t v24 = dispatch_semaphore_create(0);
    uint64_t v25 = [(AXSettings *)self swiftSettings];
    uint64_t v26 = [v25 liveSpeech];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __64__AXSettings_speechVoiceIdentifierForLanguage_sourceKey_exists___block_invoke_4;
    v28[3] = &unk_1E5588330;
    long long v30 = &v40;
    uint64_t v27 = v24;
    uint64_t v29 = v27;
    [v26 speechVoiceIdentifierForKeyboard:v8 completionHandler:v28];

    dispatch_semaphore_wait(v27, 0xFFFFFFFFFFFFFFFFLL);
    id v14 = (id)v41[5];

    _Block_object_dispose(&v40, 8);
  }
  else
  {
    id v14 = 0;
  }
LABEL_8:

  return v14;
}

void __64__AXSettings_speechVoiceIdentifierForLanguage_sourceKey_exists___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __64__AXSettings_speechVoiceIdentifierForLanguage_sourceKey_exists___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __64__AXSettings_speechVoiceIdentifierForLanguage_sourceKey_exists___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __64__AXSettings_speechVoiceIdentifierForLanguage_sourceKey_exists___block_invoke_4(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)userDidSelectVoiceForLanguage:(id)a3 sourceKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    id v6 = [MEMORY[0x1E4F15470] currentLanguageCode];
  }
  id v8 = AXCRemapLanguageCodeToFallbackIfNeccessary();

  id v9 = [(AXSettings *)self valueForPreferenceKey:@"UserDidSelectVoiceForLanguage"];
  dispatch_semaphore_t v10 = [v9 objectForKey:v7];
  uint64_t v11 = [v10 objectForKey:v8];
  char v12 = [v11 BOOLValue];

  return v12;
}

- (id)customSettingsForVoice:(id)a3 sourceKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(AXSettings *)self valueForPreferenceKey:@"SpeechCustomVoiceSettings"];
  id v9 = [v8 objectForKey:v7];

  dispatch_semaphore_t v10 = [v9 objectForKey:v6];

  return v10;
}

- (void)setCustomSettingsForVoice:(id)a3 sourceKey:(id)a4 settings:(id)a5
{
  id v19 = a3;
  id v8 = a5;
  id v9 = a4;
  dispatch_semaphore_t v10 = [(AXSettings *)self valueForPreferenceKey:@"SpeechCustomVoiceSettings"];
  uint64_t v11 = v10;
  if (!v10) {
    dispatch_semaphore_t v10 = (void *)MEMORY[0x1E4F1CC08];
  }
  char v12 = (void *)[v10 mutableCopy];

  dispatch_semaphore_t v13 = [v12 objectForKeyedSubscript:v19];

  if (!v13)
  {
    id v14 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
    [v12 setObject:v14 forKeyedSubscript:v19];
  }
  uint64_t v15 = [v12 objectForKeyedSubscript:v19];
  dispatch_semaphore_t v16 = (void *)[v15 mutableCopy];
  [v12 setObject:v16 forKeyedSubscript:v19];

  uint64_t v17 = (void *)[v8 mutableCopy];
  uint64_t v18 = [v12 objectForKeyedSubscript:v19];
  [v18 setObject:v17 forKeyedSubscript:v9];

  [(AXBaseSettings *)self setValue:v12 forPreferenceKey:@"SpeechCustomVoiceSettings"];
}

- (void)setSpeechVoiceIdentifier:(id)a3 forLanguage:(id)a4 source:(int64_t)a5
{
  id v8 = NSString;
  id v9 = a4;
  id v10 = a3;
  objc_msgSend(v8, "stringWithFormat:", @"%d", a5);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  [(AXSettings *)self setSpeechVoiceIdentifier:v10 forLanguage:v9 sourceKey:v11];
}

- (void)setSpeechVoiceIdentifier:(id)a3 forLanguage:(id)a4 sourceKey:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = AXLogCommon();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    id v27 = v8;
    __int16 v28 = 2112;
    id v29 = v9;
    __int16 v30 = 2112;
    id v31 = v10;
    _os_log_impl(&dword_18D308000, v11, OS_LOG_TYPE_INFO, "AXSettings: Updating selected voice identifier: %@, language: %@, key: %@", buf, 0x20u);
  }

  if (v9 && ([v10 isEqualToString:*MEMORY[0x1E4F481F0]] & 1) == 0)
  {
    if ([v10 isEqualToString:*MEMORY[0x1E4F481F8]])
    {
      dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
      dispatch_semaphore_t v13 = [(AXSettings *)self swiftSettings];
      id v14 = [v13 voiceover];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __61__AXSettings_setSpeechVoiceIdentifier_forLanguage_sourceKey___block_invoke;
      v24[3] = &unk_1E5585F48;
      dispatch_semaphore_t v25 = v12;
      uint64_t v15 = v12;
      [v14 setWithVoiceId:v8 forLanguage:v9 completionHandler:v24];

      dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
      dispatch_semaphore_t v16 = v25;
    }
    else if ([v10 isEqualToString:*MEMORY[0x1E4F481E0]])
    {
      dispatch_semaphore_t v17 = dispatch_semaphore_create(0);
      uint64_t v18 = [(AXSettings *)self swiftSettings];
      id v19 = [v18 spokenContent];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __61__AXSettings_setSpeechVoiceIdentifier_forLanguage_sourceKey___block_invoke_2;
      v22[3] = &unk_1E5585F48;
      dispatch_semaphore_t v23 = v17;
      uint64_t v15 = v17;
      [v19 setWithVoiceId:v8 forLanguage:v9 completionHandler:v22];

      dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
      dispatch_semaphore_t v16 = v23;
    }
    else
    {
      dispatch_semaphore_t v20 = [(AXSettings *)self valueForPreferenceKey:@"SpeechVoiceIdentifierForLanguage"];
      uint64_t v15 = [v20 mutableCopy];

      if (!v15) {
        uint64_t v15 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
      }
      long long v21 = [v15 objectForKey:v10];
      dispatch_semaphore_t v16 = (dispatch_semaphore_t)[v21 mutableCopy];

      if (!v16)
      {
        dispatch_semaphore_t v16 = (dispatch_semaphore_t)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
        [v15 setObject:v16 forKey:v10];
      }
      if (v8) {
        [v16 setObject:v8 forKey:v9];
      }
      else {
        [v16 removeObjectForKey:v9];
      }
      [v15 setObject:v16 forKey:v10];
      [(AXBaseSettings *)self setValue:v15 forPreferenceKey:@"SpeechVoiceIdentifierForLanguage"];
    }
  }
}

intptr_t __61__AXSettings_setSpeechVoiceIdentifier_forLanguage_sourceKey___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __61__AXSettings_setSpeechVoiceIdentifier_forLanguage_sourceKey___block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)setUserDidSelectVoiceForLanguage:(id)a3 sourceKey:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if (v11 && ([v6 isEqualToString:*MEMORY[0x1E4F481F0]] & 1) == 0)
  {
    id v7 = [(AXSettings *)self valueForPreferenceKey:@"UserDidSelectVoiceForLanguage"];
    id v8 = (void *)[v7 mutableCopy];

    if (!v8) {
      id v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
    }
    id v9 = [v8 objectForKey:v6];
    id v10 = (void *)[v9 mutableCopy];

    if (!v10)
    {
      id v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
      [v8 setObject:v10 forKey:v6];
    }
    [v10 setObject:MEMORY[0x1E4F1CC38] forKey:v11];
    [v8 setObject:v10 forKey:v6];
    [(AXBaseSettings *)self setValue:v8 forPreferenceKey:@"UserDidSelectVoiceForLanguage"];
  }
}

- (id)selectedSpeechVoiceIdentifiers
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [MEMORY[0x1E4F1CA80] set];
  id v4 = [(AXSettings *)self valueForPreferenceKey:@"SpeechVoiceIdentifierForLanguage"];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  dispatch_semaphore_t v5 = [v4 allValues];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        id v11 = objc_msgSend(v10, "allValues", 0);
        uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v19;
          do
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v19 != v14) {
                objc_enumerationMutation(v11);
              }
              [v3 addObject:*(void *)(*((void *)&v18 + 1) + 8 * j)];
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
          }
          while (v13);
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v7);
  }

  dispatch_semaphore_t v16 = [v3 allObjects];

  return v16;
}

- (id)selectedSpeechVoiceIdentifiersWithLanguageSource
{
  return [(AXSettings *)self valueForPreferenceKey:@"SpeechVoiceIdentifierForLanguage"];
}

- (void)setSelectedSpeechVoiceIdentifiersWithLanguageSource:(id)a3
{
}

- (id)selectedSpeechVoiceIdentifiersForSourceKey:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_semaphore_t v5 = [MEMORY[0x1E4F1CA80] set];
  [(AXSettings *)self valueForPreferenceKey:@"SpeechVoiceIdentifierForLanguage"];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v18 = v27 = 0u;
  id obj = [v18 allKeys];
  uint64_t v6 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(obj);
        }
        if ([*(id *)(*((void *)&v24 + 1) + 8 * i) isEqualToString:v4])
        {
          id v10 = [v18 objectForKeyedSubscript:v4];
          long long v20 = 0u;
          long long v21 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          id v11 = [v10 allValues];
          uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v21;
            do
            {
              for (uint64_t j = 0; j != v13; ++j)
              {
                if (*(void *)v21 != v14) {
                  objc_enumerationMutation(v11);
                }
                [v5 addObject:*(void *)(*((void *)&v20 + 1) + 8 * j)];
              }
              uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
            }
            while (v13);
          }
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v7);
  }

  dispatch_semaphore_t v16 = [v5 allObjects];

  return v16;
}

- (BOOL)spokenContentShouldUseLanguageDetection
{
  return AXSettingsReturnBoolValue(@"SpokenContentShouldUseLanguageDetection", 1);
}

- (void)setSpokenContentShouldUseLanguageDetection:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"SpokenContentShouldUseLanguageDetection"];
}

- (NSString)spokenContentDefaultFallbackLanguage
{
  return (NSString *)[(AXSettings *)self valueForPreferenceKey:@"SpokenContentDefaultFallbackLanguage"];
}

- (void)setSpokenContentDefaultFallbackLanguage:(id)a3
{
}

- (void)_clearWhitetailMigrationSettings
{
  [(AXBaseSettings *)self setValue:0 forPreferenceKey:@"AssistiveTouchScannerPrefersCompactForLanguagePreference"];
  [(AXBaseSettings *)self setValue:0 forPreferenceKey:@"AssistiveTouchScannerAlternativeVoiceForLanguagePreference"];
  [(AXBaseSettings *)self setValue:0 forPreferenceKey:@"AXSAssistiveTouchDefaultDialectPreference"];
  [(AXBaseSettings *)self setValue:0 forPreferenceKey:@"QuickSpeakPrefersCompactForLanguage"];
  [(AXBaseSettings *)self setValue:0 forPreferenceKey:@"QuickSpeakAlternativeVoiceForLanguage"];
  [(AXBaseSettings *)self setValue:0 forPreferenceKey:@"AXSVoiceOverCompactVoicePreference"];
  [(AXBaseSettings *)self setValue:0 forPreferenceKey:@"VoiceOverTouchPitchCompactVoice"];
  [(AXBaseSettings *)self setValue:0 forPreferenceKey:@"AXSVoiceOverAlternativeVoicesPreference"];

  [(AXBaseSettings *)self setValue:0 forPreferenceKey:@"com.apple.voiceovertouch.default.dialect"];
}

- (id)_voiceOverDefaultDialect
{
  return [(AXSettings *)self valueForPreferenceKey:@"com.apple.voiceovertouch.default.dialect"];
}

- (id)_switchControlScannerDefaultDialect
{
  return [(AXSettings *)self valueForPreferenceKey:@"AXSAssistiveTouchDefaultDialectPreference"];
}

- (id)_switchControlPrefersCompact
{
  return [(AXSettings *)self valueForPreferenceKey:@"AssistiveTouchScannerPrefersCompactForLanguagePreference"];
}

- (id)_switchControlAltVoices
{
  return [(AXSettings *)self valueForPreferenceKey:@"AssistiveTouchScannerAlternativeVoiceForLanguagePreference"];
}

- (id)_voiceOverAlternativeVoiceIdentifiers
{
  return [(AXSettings *)self valueForPreferenceKey:@"AXSVoiceOverAlternativeVoicesPreference"];
}

- (id)_voiceOverPrefersCompactByLanguage
{
  return [(AXSettings *)self valueForPreferenceKey:@"AXSVoiceOverCompactVoicePreference"];
}

- (id)_quickSpeakPrefersCompact
{
  return [(AXSettings *)self valueForPreferenceKey:@"QuickSpeakPrefersCompactForLanguage"];
}

- (id)_quickSpeakAltVoices
{
  uint64_t v2 = +[AXSettings sharedInstance];
  unint64_t v3 = [v2 valueForPreferenceKey:@"QuickSpeakAlternativeVoiceForLanguage"];

  return v3;
}

- (void)setQuickSpeakSpeakingRate:(float)a3 forLanguage:(id)a4
{
  id v6 = a4;
  id v9 = [(AXSettings *)self spokenContentVoiceSelectionForLanguage:v6];
  *(float *)&double v7 = a3;
  uint64_t v8 = [NSNumber numberWithFloat:v7];
  [v9 setRate:v8];

  [(AXSettings *)self setSpokenContentVoiceSelectionForLanguage:v6 selection:v9];
}

- (float)quickSpeakSpeakingRateForLanguage:(id)a3
{
  unint64_t v3 = [(AXSettings *)self spokenContentVoiceSelectionForLanguage:a3];
  id v4 = [v3 rate];

  if (v4)
  {
    [v4 floatValue];
    float v6 = v5;
  }
  else
  {
    float v6 = 0.5;
  }

  return v6;
}

- (BOOL)siriAutoUpdateListInitialized
{
  uint64_t v2 = [(AXSettings *)self valueForPreferenceKey:@"SiriAutoUpdateListInitializedPreference"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setSiriAutoUpdateListInitialized:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"SiriAutoUpdateListInitializedPreference"];
}

- (void)setQuickSpeakNubbitNormalizedPosition:(CGPoint)a3
{
  NSStringFromPoint(a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"QuickSpeakNubbitNormalizedPosition"];
}

- (CGPoint)quickSpeakNubbitNormalizedPosition
{
  uint64_t v2 = [(AXSettings *)self valueForPreferenceKey:@"QuickSpeakNubbitNormalizedPosition"];
  char v3 = v2;
  if (v2)
  {
    NSPoint v4 = NSPointFromString(v2);
    CGFloat x = v4.x;
    CGFloat y = v4.y;
  }
  else
  {
    CGFloat x = 0.0;
    CGFloat y = 0.2;
  }

  double v7 = x;
  double v8 = y;
  result.CGFloat y = v8;
  result.CGFloat x = v7;
  return result;
}

- (NSArray)customPronunciationSubstitutions
{
  uint64_t v2 = [(AXSettings *)self valueForPreferenceKey:kAXSCustomPronunciationSubstitutionsPreference];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (char v3 = (void *)MEMORY[0x1E4F28DC0],
        uint64_t v4 = objc_opt_class(),
        [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()],
        float v5 = objc_claimAutoreleasedReturnValue(),
        [v3 secureUnarchiveData:v2 withExpectedClass:v4 otherAllowedClasses:v5],
        float v6 = objc_claimAutoreleasedReturnValue(),
        v5,
        !v6))
  {
    float v6 = [MEMORY[0x1E4F1C978] array];
  }

  return (NSArray *)v6;
}

- (void)setCustomPronunciationSubstitutions:(id)a3
{
  id v4 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:0];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:kAXSCustomPronunciationSubstitutionsPreference];
}

- (void)setVoiceOverPunctuationGroup:(id)a3
{
  id v4 = [a3 UUIDString];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AXSVoiceOverPunctuationGroupPreference"];
}

- (NSUUID)voiceOverPunctuationGroup
{
  uint64_t v2 = [(AXSettings *)self valueForPreferenceKey:@"AXSVoiceOverPunctuationGroupPreference"];
  if (v2) {
    char v3 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v2];
  }
  else {
    char v3 = 0;
  }

  return (NSUUID *)v3;
}

- (void)setVoiceOverPunctuationLevel:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AXSVoiceOverPunctuationLevelPreference"];
}

- (int64_t)voiceOverPunctuationLevel
{
  return AXSettingsReturnIntegerValue(@"AXSVoiceOverPunctuationLevelPreference", 1);
}

- (void)setVoiceOverLinkFeedback:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AXSVoiceOverLinkFeedbackPreference"];
}

- (int64_t)voiceOverLinkFeedback
{
  int64_t result = AXSettingsReturnIntegerValue(@"AXSVoiceOverLinkFeedbackPreference", 18);
  if (!result) {
    return 18;
  }
  return result;
}

- (void)setVoiceOverInlineTextCompletionAppearanceFeedback:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"kAXSVoiceOverInlineTextCompletionAppearanceFeedbackPreference"];
}

- (int64_t)voiceOverInlineTextCompletionAppearanceFeedback
{
  int64_t result = AXSettingsReturnIntegerValue(@"kAXSVoiceOverInlineTextCompletionAppearanceFeedbackPreference", 6);
  if (!result) {
    return 6;
  }
  return result;
}

- (void)setVoiceOverInlineTextCompletionInsertionFeedback:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"kAXSVoiceOverInlineTextCompletionInsertionFeedbackPreference"];
}

- (int64_t)voiceOverInlineTextCompletionInsertionFeedback
{
  int64_t result = AXSettingsReturnIntegerValue(@"kAXSVoiceOverInlineTextCompletionInsertionFeedbackPreference", 10);
  if (!result) {
    return 10;
  }
  return result;
}

- (void)setVoiceOverDeletionFeedback:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AXSVoiceOverDeletionFeedbackPreference"];
}

- (int64_t)voiceOverDeletionFeedback
{
  return AXSettingsReturnIntegerValue(@"AXSVoiceOverDeletionFeedbackPreference", 1);
}

- (void)setVoiceOverCapitalLetterFeedback:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AXSVoiceOverCapitalLetterFeedbackPreference"];
}

- (int64_t)voiceOverCapitalLetterFeedback
{
  return AXSettingsReturnIntegerValue(@"AXSVoiceOverCapitalLetterFeedbackPreference", 0);
}

- (void)setVoiceOverRotorSummaryFeedback:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AXSVoiceOverRotorSummaryFeedbackPreference"];
}

- (int64_t)voiceOverRotorSummaryFeedback
{
  return AXSettingsReturnIntegerValue(@"AXSVoiceOverRotorSummaryFeedbackPreference", 2);
}

- (void)setVoiceOverMoreContentOutputFeedback:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AXSVoiceOverMoreContentOutputFeedbackPreference"];
}

- (int64_t)voiceOverMoreContentOutputFeedback
{
  return AXSettingsReturnIntegerValue(@"AXSVoiceOverMoreContentOutputFeedbackPreference", 1);
}

- (void)setVoiceOverContainerOutputFeedback:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AXSVoiceOverContainerOutputFeedbackPreference"];
}

- (int64_t)voiceOverContainerOutputFeedback
{
  return AXSettingsReturnIntegerValue(@"AXSVoiceOverContainerOutputFeedbackPreference", 26);
}

- (void)setVoiceOverActionsFeedback:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AXSVoiceOverActionsFeedbackPreference"];
}

- (int64_t)voiceOverActionsFeedback
{
  return AXSettingsReturnIntegerValue(@"AXSVoiceOverActionsFeedbackPreference", 18);
}

- (void)setVoiceOverActionFeedbackFirstInListOnly:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AXSVoiceOverFirstInListOnlyActionsFeedback"];
}

- (BOOL)voiceOverActionFeedbackFirstInListOnly
{
  return AXSettingsReturnBoolValue(@"AXSVoiceOverFirstInListOnlyActionsFeedback", 0);
}

- (void)setVoiceOverDiscoveredSensitiveContentFeedback:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"VoiceOverDiscoveredSensitiveContentFeedback"];
}

- (int64_t)voiceOverDiscoveredSensitiveContentFeedback
{
  return AXSettingsReturnIntegerValue(@"VoiceOverDiscoveredSensitiveContentFeedback", 0);
}

- (void)setVoiceOverTouchSingleLetterQuickNavEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AXSVoiceOverTouchSingleLetterQuickNavPreference"];
}

- (BOOL)voiceOverTouchSingleLetterQuickNavEnabled
{
  return AXSettingsReturnBoolValue(@"AXSVoiceOverTouchSingleLetterQuickNavPreference", 0);
}

- (void)setVoiceOverQuickNavAnnouncementFeedback:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"VoiceOverQuickNavAnnouncementFeedback"];
}

- (int64_t)voiceOverQuickNavAnnouncementFeedback
{
  return AXSettingsReturnIntegerValue(@"VoiceOverQuickNavAnnouncementFeedback", 4);
}

- (BOOL)voiceOverSpeaksOverTelephoneCalls
{
  return 0;
}

- (void)setVoiceOverSpeaksOverTelephoneCalls:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AXSVoiceOverSpeaksOverTelephoneCalls"];
}

- (BOOL)voiceOverSpeakTableHeaders
{
  return AXSettingsReturnBoolValue(@"AXSVoiceOverSpeakTableHeadersPreference", 1);
}

- (void)setVoiceOverSpeakTableHeaders:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AXSVoiceOverSpeakTableHeadersPreference"];
}

- (BOOL)voiceOverSpeakTableColumnRowInformation
{
  return AXSettingsReturnBoolValue(@"AXSVoiceOverSpeakTableColumnRowInformationPreference", 1);
}

- (void)setVoiceOverSpeakTableColumnRowInformation:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AXSVoiceOverSpeakTableColumnRowInformationPreference"];
}

- (void)setVoiceOverHelpMode:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"VoiceOverTouchHelpModePreference"];
}

- (int64_t)voiceOverHelpMode
{
  uint64_t v2 = [(AXSettings *)self valueForPreferenceKey:@"VoiceOverTouchHelpModePreference"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int64_t v3 = [v2 integerValue];
  }
  else {
    int64_t v3 = 0;
  }

  return v3;
}

- (void)setVoiceOverNavigateImagesOption:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"NavigateImagesPreference"];
}

- (int64_t)voiceOverNavigateImagesOption
{
  uint64_t v2 = [(AXSettings *)self valueForPreferenceKey:@"NavigateImagesPreference"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int64_t v3 = [v2 integerValue];
  }
  else {
    int64_t v3 = 1;
  }

  return v3;
}

- (void)setVoiceOverPhoneticsFeedback:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"VoiceOverTouchPhoneticsEnabledPreference"];
}

- (int64_t)voiceOverPhoneticsFeedback
{
  uint64_t v2 = [(AXSettings *)self valueForPreferenceKey:@"VoiceOverTouchPhoneticsEnabledPreference"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int64_t v3 = [v2 integerValue];
  }
  else {
    int64_t v3 = 1;
  }

  return v3;
}

- (void)setVoiceOverHardwareTypingFeedback:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"VoiceOverTouchTypingHardwareFeedback"];
}

- (int64_t)voiceOverHardwareTypingFeedback
{
  uint64_t v2 = [(AXSettings *)self valueForPreferenceKey:@"VoiceOverTouchTypingHardwareFeedback"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int64_t v3 = [v2 integerValue];
  }
  else {
    int64_t v3 = 2;
  }

  return v3;
}

- (void)setVoiceOverSoftwareTypingFeedback:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"VoiceOverTouchTypingFeedback"];
}

- (int64_t)voiceOverSoftwareTypingFeedback
{
  uint64_t v2 = [(AXSettings *)self valueForPreferenceKey:@"VoiceOverTouchTypingFeedback"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int64_t v3 = [v2 integerValue];
  }
  else {
    int64_t v3 = 2;
  }

  return v3;
}

- (void)setVoiceOverBrailleGesturesTypingFeedback:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"VoiceOverTouchTypingBrailleGesturesFeedback"];
}

- (int64_t)voiceOverBrailleGesturesTypingFeedback
{
  return AXSettingsReturnIntegerValue(@"VoiceOverTouchTypingBrailleGesturesFeedback", 2);
}

- (void)setVoiceOverActivationWorkaround:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"VOActivationWorkaround"];
}

- (int64_t)voiceOverActivationWorkaround
{
  uint64_t v2 = [(AXSettings *)self valueForPreferenceKey:@"VOActivationWorkaround"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int64_t v3 = [v2 integerValue];
  }
  else {
    int64_t v3 = 0;
  }

  return v3;
}

- (BOOL)_voiceOverRotorItemEnabled:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  float v5 = [(AXSettings *)self voiceOverRotorItems];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __41__AXSettings__voiceOverRotorItemEnabled___block_invoke;
  v9[3] = &unk_1E5588358;
  id v6 = v4;
  id v10 = v6;
  id v11 = &v12;
  [v5 enumerateObjectsUsingBlock:v9];
  char v7 = *((unsigned char *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __41__AXSettings__voiceOverRotorItemEnabled___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  id v6 = [v9 objectForKey:@"RotorItem"];
  int v7 = [v6 isEqualToString:*(void *)(a1 + 32)];

  if (v7)
  {
    double v8 = [v9 objectForKey:@"Enabled"];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v8 BOOLValue];

    *a4 = 1;
  }
}

- (id)voiceOverRotorItemWithVoiceID:(id)a3 rate:(id)a4 volume:(id)a5 pitch:(id)a6
{
  id v9 = (void *)MEMORY[0x1E4F29128];
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  uint64_t v14 = [v9 UUID];
  char v15 = [v14 UUIDString];

  dispatch_semaphore_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F48308]) initWithVoiceId:v13 rate:v12 pitch:v10 volume:v11 voiceSettings:0 effects:0];
  dispatch_semaphore_t v17 = [[AXVoiceOverVoiceRotorItem alloc] initWithIdentifier:v15 selection:v16 userDefinedName:0];

  return v17;
}

- (void)setDefaultVoiceSelection:(id)a3 languageID:(id)a4 rate:(id)a5 pitch:(id)a6 volume:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v27 = [(AXSettings *)self swiftSettings];
  dispatch_semaphore_t v17 = [v27 voiceover];
  [v14 floatValue];
  int v19 = v18;

  [v12 floatValue];
  int v21 = v20;

  [v13 floatValue];
  int v23 = v22;

  LODWORD(v24) = v19;
  LODWORD(v25) = v21;
  LODWORD(v26) = v23;
  [v17 setWithVoiceId:v16 forLanguage:v15 rate:v24 volume:v25 pitch:v26];
}

- (BOOL)voiceOverHandwritingEnabled
{
  return [(AXSettings *)self _voiceOverRotorItemEnabled:*MEMORY[0x1E4F486A0]];
}

- (BOOL)voiceOverBrailleGesturesEnabled
{
  if ([(AXSettings *)self _voiceOverRotorItemEnabled:*MEMORY[0x1E4F48658]]) {
    return 1;
  }

  return [(AXSettings *)self voiceOverTouchBrailleGesturesActivationGestureEnabled];
}

- (void)setVoiceOverBrailleWordWrapEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"VoiceOverBrailleWordWrapEnabled"];
}

- (BOOL)voiceOverBrailleWordWrapEnabled
{
  return AXSettingsReturnBoolValue(@"VoiceOverBrailleWordWrapEnabled", 1);
}

- (NSDictionary)voiceOverBrailleDisconnectOnSleep
{
  uint64_t v2 = objc_opt_class();

  return (NSDictionary *)AXSettingsReturnObjectValueWithClass(@"VoiceOverBrailleDisplayDisconnectOnSleepPreference", 0, v2);
}

- (void)setVoiceOverBrailleDisconnectOnSleep:(id)a3
{
}

- (NSArray)voiceOverBrailleDisplays
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_class();
  id v4 = AXSettingsReturnObjectValueWithClass(@"VoiceOverBrailleDisplays", 0, v3);
  if (![v4 count])
  {
    uint64_t v5 = [(AXSettings *)self voiceOverBrailleBluetoothDisplay];
    id v6 = (void *)v5;
    if (v5)
    {
      v10[0] = v5;
      uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];

      [(AXSettings *)self setVoiceOverBrailleDisplays:v7];
      [(AXSettings *)self setVoiceOverBrailleBluetoothDisplay:0];
      id v4 = (void *)v7;
    }
  }
  double v8 = objc_msgSend(v4, "ax_filteredArrayUsingBlock:", &__block_literal_global_1965);

  return (NSArray *)v8;
}

BOOL __38__AXSettings_voiceOverBrailleDisplays__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v3 = (id *)getkSCROBrailleDisplayDriverIdentifierSymbolLoc_ptr;
  uint64_t v15 = getkSCROBrailleDisplayDriverIdentifierSymbolLoc_ptr;
  if (!getkSCROBrailleDisplayDriverIdentifierSymbolLoc_ptr)
  {
    id v4 = (void *)ScreenReaderOutputLibrary();
    v13[3] = (uint64_t)dlsym(v4, "kSCROBrailleDisplayDriverIdentifier");
    getkSCROBrailleDisplayDriverIdentifierSymbolLoc_ptr = v13[3];
    uint64_t v3 = (id *)v13[3];
  }
  _Block_object_dispose(&v12, 8);
  if (!v3) {
    __38__AXSettings_voiceOverBrailleDisplays__block_invoke_cold_1();
  }
  id v5 = *v3;
  id v6 = [v2 objectForKey:v5];
  if ([v6 isEqualToString:@"com.apple.scrod.braille.driver.generic.hid"])
  {
    uint64_t v12 = 0;
    id v13 = &v12;
    uint64_t v14 = 0x2020000000;
    uint64_t v7 = (void *)getkSCROBrailleDisplayMainSizeSymbolLoc_ptr;
    uint64_t v15 = getkSCROBrailleDisplayMainSizeSymbolLoc_ptr;
    if (!getkSCROBrailleDisplayMainSizeSymbolLoc_ptr)
    {
      double v8 = (void *)ScreenReaderOutputLibrary();
      v13[3] = (uint64_t)dlsym(v8, "kSCROBrailleDisplayMainSize");
      getkSCROBrailleDisplayMainSizeSymbolLoc_ptr = v13[3];
      uint64_t v7 = (void *)v13[3];
    }
    _Block_object_dispose(&v12, 8);
    if (!v7) {
      __38__AXSettings_voiceOverBrailleDisplays__block_invoke_cold_2();
    }
    id v9 = [v2 objectForKey:*v7];
    BOOL v10 = v9 != 0;
  }
  else
  {
    BOOL v10 = 1;
  }

  return v10;
}

- (void)setVoiceOverBrailleDisplays:(id)a3
{
}

- (BOOL)voiceOverUseRingerSwitchToControlNotificationOutput
{
  return AXSettingsReturnBoolValue(@"AXSVoiceOverRingerSwitchForNotificationsEnabled", 1);
}

- (void)setVoiceOverUseRingerSwitchToControlNotificationOutput:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AXSVoiceOverRingerSwitchForNotificationsEnabled"];
}

- (int64_t)voiceOverBannerNotificationOutput
{
  return AXSettingsReturnIntegerValue(@"AXSVoiceOverBannerNotificationOutput", 82);
}

- (void)setVoiceOverBannerNotificationOutput:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AXSVoiceOverBannerNotificationOutput"];
}

- (int64_t)voiceOverLockedScreenNotificationOutput
{
  return AXSettingsReturnIntegerValue(@"AXSVoiceOverLockScreenNotificationOutput", 48);
}

- (void)setVoiceOverLockedScreenNotificationOutput:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AXSVoiceOverLockScreenNotificationOutput"];
}

- (BOOL)voiceOverBrailleFormattingEnabled
{
  return AXSettingsReturnBoolValue(@"kAXSVoiceOverBrailleFormatting", 0);
}

- (void)setVoiceOverBrailleFormattingEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"kAXSVoiceOverBrailleFormatting"];
}

- (void)setVoiceOverBrailleAutoAdvanceDuration:(double)a3
{
  id v4 = [NSNumber numberWithDouble:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"VoiceOverBrailleAutoAdvanceDuration"];
}

- (double)voiceOverBrailleAutoAdvanceDuration
{
  double v2 = *MEMORY[0x1E4F48580];
  double result = AXSettingsReturnDoubleValue(@"VoiceOverBrailleAutoAdvanceDuration", *MEMORY[0x1E4F48580]);
  if (result > *MEMORY[0x1E4F48588] || result < *MEMORY[0x1E4F48590]) {
    return v2;
  }
  return result;
}

- (void)setVoiceOverHintsEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"VoiceOverTouchHintsEnabled"];
}

- (BOOL)voiceOverHintsEnabled
{
  return AXSettingsReturnBoolValue(@"VoiceOverTouchHintsEnabled", 1);
}

- (void)setVoiceOverAudioDuckingEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"VoiceOverTouchAudioDuckingEnabled"];
}

- (BOOL)voiceOverAudioDuckingEnabled
{
  return AXSettingsReturnBoolValue(@"VoiceOverTouchAudioDuckingEnabled", 1);
}

- (void)setVoiceOverIgnoreTrackpad:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"VoiceOverIgnoreTrackpad"];
}

- (BOOL)voiceOverIgnoreTrackpad
{
  return AXSettingsReturnBoolValue(@"VoiceOverIgnoreTrackpad", 0);
}

- (void)setVoiceOverAudioFollowsHDMIAudio:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"VoiceOverAudioFollowsHDMIAudio"];
}

- (BOOL)voiceOverAudioFollowsHDMIAudio
{
  return AXSettingsReturnBoolValue(@"VoiceOverAudioFollowsHDMIAudio", 0);
}

- (void)setAutomationTrueTouch:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AutomationTrueTouch"];
}

- (BOOL)automationTrueTouch
{
  return AXSettingsReturnBoolValue(@"AutomationTrueTouch", 0);
}

- (void)setVoiceOverPitch:(double)a3
{
  id v4 = [NSNumber numberWithDouble:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:kAXSVoiceOverPitchPreference];
}

- (double)voiceOverPitch
{
  return AXSettingsReturnDoubleValue((void *)kAXSVoiceOverPitchPreference, 0.5);
}

- (void)setVoiceOverSoundEffectsEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"VoiceOverUseSoundEffects"];
}

- (BOOL)voiceOverSoundEffectsEnabled
{
  return AXSettingsReturnBoolValue(@"VoiceOverUseSoundEffects", 1);
}

- (int64_t)voiceOverVerbosityEmojiFeedback
{
  return AXSettingsReturnIntegerValue(@"VoiceOverVerbosityEmojiFeedbackPreference", 18);
}

- (void)setVoiceOverVerbosityEmojiFeedback:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"VoiceOverVerbosityEmojiFeedbackPreference"];
}

- (BOOL)voiceOverVerbosityEmojiSuffixEnabled
{
  return AXSettingsReturnBoolValue(@"VoiceOverVerbosityEmojiSuffixEnabledPreference", 0);
}

- (void)setVoiceOverVerbosityEmojiSuffixEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"VoiceOverVerbosityEmojiSuffixEnabledPreference"];
}

- (double)voiceOverSoundVolume
{
  return AXSettingsReturnDoubleValue(@"VoiceOverSoundVolume", 0.800000012);
}

- (void)setVoiceOverSoundVolume:(double)a3
{
  id v4 = [NSNumber numberWithDouble:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"VoiceOverSoundVolume"];
}

- (BOOL)voiceOverAdjustSoundVolumeIndependently
{
  return AXSettingsReturnBoolValue(@"VoiceOverAdjustSoundVolumeIndependently", 0) ^ 1;
}

- (void)setVoiceOverAdjustSoundVolumeIndependently:(BOOL)a3
{
  id v4 = [NSNumber numberWithInt:!a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"VoiceOverAdjustSoundVolumeIndependently"];
}

- (BOOL)voiceOverAlwaysTurnOnBluetooth
{
  return AXSettingsReturnBoolValue(@"AXSVoiceOverTurnOnBluetoothEnabled", 0);
}

- (void)setVoiceOverAlwaysTurnOnBluetooth:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AXSVoiceOverTurnOnBluetoothEnabled"];
}

- (BOOL)voiceOverHapticsEnabled
{
  return AXSettingsReturnBoolValue(@"VoiceOverHapticsEnabled", 1);
}

- (void)setVoiceOverHapticsEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"VoiceOverHapticsEnabled"];
}

- (double)voiceOverHapticIntensity
{
  return AXSettingsReturnDoubleValue(@"VoiceOverHapticIntensity", 1.0);
}

- (void)setVoiceOverHapticIntensity:(double)a3
{
  id v4 = [NSNumber numberWithDouble:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"VoiceOverHapticIntensity"];
}

- (void)setVoiceOverSpeakingRateInRotorEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"SpeakingRateInRotorEnabled"];
}

- (BOOL)voiceOverSpeakingRateInRotorEnabled
{
  return AXSettingsReturnBoolValue(@"SpeakingRateInRotorEnabled", 1);
}

- (void)setVoiceOverSpeakNotificationsEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"SpeakNotificationInLockScreen"];
}

- (BOOL)voiceOverSpeakNotificationsEnabled
{
  return AXSettingsReturnBoolValue(@"SpeakNotificationInLockScreen", 0);
}

- (void)setVoiceOverRotorItems:(id)a3
{
}

- (double)voiceOverMediaDuckingAmount
{
  return AXSettingsReturnDoubleValue(@"VoiceOverTouchMediaDuckingVolume", 0.800000012);
}

- (void)setVoiceOverMediaDuckingAmount:(double)a3
{
  double v4 = fmax(a3, 0.01);
  if (v4 > 0.99) {
    double v4 = 0.99;
  }
  id v5 = [NSNumber numberWithDouble:v4];
  [(AXBaseSettings *)self setValue:v5 forPreferenceKey:@"VoiceOverTouchMediaDuckingVolume"];
}

- (int64_t)voiceOverMediaDuckingMode
{
  return AXSettingsReturnIntegerValue(@"VoiceOverTouchMediaDuckingMode", 1);
}

- (void)setVoiceOverMediaDuckingMode:(int64_t)a3
{
  id v4 = [NSNumber numberWithLong:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"VoiceOverTouchMediaDuckingMode"];
}

- (NSArray)voiceOverRotorItems
{
  v60[55] = *MEMORY[0x1E4F143B8];
  v60[0] = (id)*MEMORY[0x1E4F48678];
  v60[1] = (id)*MEMORY[0x1E4F48780];
  v60[2] = (id)*MEMORY[0x1E4F486D0];
  v60[3] = (id)*MEMORY[0x1E4F48748];
  v60[4] = (id)*MEMORY[0x1E4F48728];
  v60[5] = (id)*MEMORY[0x1E4F48778];
  v60[6] = (id)*MEMORY[0x1E4F48640];
  v60[7] = (id)*MEMORY[0x1E4F48648];
  v60[8] = (id)*MEMORY[0x1E4F48700];
  v60[9] = (id)*MEMORY[0x1E4F48720];
  v60[10] = (id)*MEMORY[0x1E4F486B0];
  v60[11] = (id)*MEMORY[0x1E4F486C8];
  v60[12] = (id)*MEMORY[0x1E4F48770];
  v60[13] = (id)*MEMORY[0x1E4F48668];
  v60[14] = (id)*MEMORY[0x1E4F48650];
  v60[15] = (id)*MEMORY[0x1E4F48628];
  v60[16] = (id)*MEMORY[0x1E4F48600];
  v60[17] = (id)*MEMORY[0x1E4F48610];
  v60[18] = (id)*MEMORY[0x1E4F48618];
  v60[19] = (id)*MEMORY[0x1E4F48608];
  v60[20] = (id)*MEMORY[0x1E4F48620];
  v60[21] = (id)*MEMORY[0x1E4F485D8];
  v60[22] = (id)*MEMORY[0x1E4F48658];
  v60[23] = (id)*MEMORY[0x1E4F486A0];
  uint64_t v3 = (void *)MEMORY[0x1E4F48788];
  v60[24] = (id)*MEMORY[0x1E4F48788];
  v60[25] = (id)*MEMORY[0x1E4F48798];
  id v4 = (id *)MEMORY[0x1E4F48688];
  v60[26] = (id)*MEMORY[0x1E4F48688];
  id v5 = (id *)MEMORY[0x1E4F486A8];
  v60[27] = (id)*MEMORY[0x1E4F486A8];
  id v6 = (id *)MEMORY[0x1E4F486D8];
  v60[28] = (id)*MEMORY[0x1E4F486D8];
  uint64_t v7 = (id *)MEMORY[0x1E4F48698];
  v60[29] = (id)*MEMORY[0x1E4F48698];
  v60[30] = (id)*MEMORY[0x1E4F48738];
  v60[31] = (id)*MEMORY[0x1E4F486E0];
  v60[32] = (id)*MEMORY[0x1E4F486C0];
  v60[33] = (id)*MEMORY[0x1E4F48638];
  v60[34] = (id)*MEMORY[0x1E4F48768];
  v60[35] = (id)*MEMORY[0x1E4F486F8];
  v60[36] = (id)*MEMORY[0x1E4F48670];
  v60[37] = (id)*MEMORY[0x1E4F48740];
  v60[38] = (id)*MEMORY[0x1E4F48718];
  v60[39] = (id)*MEMORY[0x1E4F48680];
  v60[40] = (id)*MEMORY[0x1E4F48708];
  v60[41] = (id)*MEMORY[0x1E4F486B8];
  v60[42] = (id)*MEMORY[0x1E4F48730];
  v60[43] = (id)*MEMORY[0x1E4F48750];
  v60[44] = (id)*MEMORY[0x1E4F48710];
  v60[45] = (id)*MEMORY[0x1E4F48760];
  double v8 = (id *)MEMORY[0x1E4F48758];
  v60[46] = (id)*MEMORY[0x1E4F48758];
  v60[47] = (id)*MEMORY[0x1E4F48690];
  v60[48] = (id)*MEMORY[0x1E4F486F0];
  id v9 = (id *)MEMORY[0x1E4F485E0];
  v60[49] = (id)*MEMORY[0x1E4F485E0];
  v60[50] = (id)*MEMORY[0x1E4F485F8];
  BOOL v10 = (id *)MEMORY[0x1E4F485F0];
  v60[51] = (id)*MEMORY[0x1E4F485F0];
  v60[52] = (id)*MEMORY[0x1E4F48790];
  id v11 = (id *)MEMORY[0x1E4F486E8];
  v60[53] = (id)*MEMORY[0x1E4F486E8];
  v60[54] = (id)*MEMORY[0x1E4F485E8];
  v59[0] = (id)*MEMORY[0x1E4F48678];
  v59[1] = (id)*MEMORY[0x1E4F48780];
  v59[2] = (id)*MEMORY[0x1E4F486D0];
  v59[3] = *v4;
  v59[4] = *v5;
  v59[5] = *v6;
  v59[6] = *v7;
  v59[7] = *v8;
  v59[8] = *v9;
  v59[9] = *v10;
  v59[10] = *v11;
  v39 = self;
  uint64_t v12 = v3;
  id v13 = [(AXSettings *)self valueForPreferenceKey:@"VoiceOverTouchRotorItemsPreference"];
  uint64_t v38 = v13;
  uint64_t v52 = 0;
  uint64_t v53 = &v52;
  uint64_t v54 = 0x3032000000;
  uint64_t v55 = __Block_byref_object_copy__12;
  unsigned int v56 = __Block_byref_object_dispose__12;
  if (v13) {
    uint64_t v14 = (void *)[v13 mutableCopy];
  }
  else {
    uint64_t v14 = objc_opt_new();
  }
  id v57 = v14;
  uint64_t v15 = [(id)v53[5] count];
  id v16 = [MEMORY[0x1E4F1CA80] setWithCapacity:v15];
  dispatch_semaphore_t v17 = (void *)v53[5];
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __33__AXSettings_voiceOverRotorItems__block_invoke;
  v50[3] = &unk_1E55883A0;
  id v40 = v16;
  id v51 = v40;
  [v17 enumerateObjectsUsingBlock:v50];
  int v18 = (void *)_AXSVoiceOverTouchCopyTactileGraphicsDisplay();

  uint64_t v19 = 0;
  uint64_t v46 = 0;
  uint64_t v47 = &v46;
  uint64_t v48 = 0x2020000000;
  char v49 = 0;
  do
  {
    if ([v40 containsObject:v60[v19]]) {
      goto LABEL_17;
    }
    if ([(id)v60[v19] isEqualToString:*v12])
    {
      int v20 = [MEMORY[0x1E4F28F80] processInfo];
      if ((unint64_t)[v20 physicalMemory] < 0x77359400) {
        goto LABEL_16;
      }
      int v21 = AXRuntimeCheck_HasANE();

      if (!v21) {
        goto LABEL_17;
      }
    }
    if (v18
      || ([(id)v60[v19] isEqualToString:*MEMORY[0x1E4F48628]] & 1) == 0
      && ([(id)v60[v19] isEqualToString:*MEMORY[0x1E4F48600]] & 1) == 0
      && ([(id)v60[v19] isEqualToString:*MEMORY[0x1E4F48610]] & 1) == 0
      && ([(id)v60[v19] isEqualToString:*MEMORY[0x1E4F48618]] & 1) == 0
      && ([(id)v60[v19] isEqualToString:*MEMORY[0x1E4F48608]] & 1) == 0
      && ([(id)v60[v19] isEqualToString:*MEMORY[0x1E4F48620]] & 1) == 0)
    {
      *((unsigned char *)v47 + 24) = 1;
      int v20 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
      [v20 setObject:v60[v19] forKey:@"RotorItem"];
      unint64_t v22 = 0;
      char v23 = 1;
      do
      {
        if (AXSafeEqual()) {
          break;
        }
        char v23 = v22++ < 0xA;
      }
      while (v22 != 11);
      if ([(AXSettings *)v39 voiceOverSpeakingRateInRotorEnabled]) {
        v23 |= AXSafeEqual() != 0;
      }
      double v24 = [NSNumber numberWithBool:v23 & 1];
      [v20 setObject:v24 forKey:@"Enabled"];

      [(id)v53[5] addObject:v20];
LABEL_16:
    }
LABEL_17:
    ++v19;
  }
  while (v19 != 55);
  double v25 = (void *)[(id)v53[5] copy];

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v26 = v25;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v42 objects:v58 count:16];
  uint64_t v28 = v27;
  if (v27)
  {
    uint64_t v29 = *(void *)v43;
    do
    {
      uint64_t v30 = 0;
      do
      {
        if (*(void *)v43 != v29) {
          objc_enumerationMutation(v26);
        }
        id v31 = *(void **)(*((void *)&v42 + 1) + 8 * v30);
        uint64_t v32 = [v31 objectForKeyedSubscript:@"RotorItem"];
        uint64_t v33 = 0;
        while (([(id)v60[v33] isEqualToString:v32] & 1) == 0)
        {
          if (++v33 == 55)
          {
            *((unsigned char *)v47 + 24) = 1;
            [(id)v53[5] removeObject:v31];
            break;
          }
        }

        ++v30;
      }
      while (v30 != v28);
      uint64_t v28 = [v26 countByEnumeratingWithState:&v42 objects:v58 count:16];
    }
    while (v28);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__AXSettings_voiceOverRotorItems__block_invoke_2;
  block[3] = &unk_1E55883F0;
  block[4] = &v52;
  block[5] = &v46;
  if (voiceOverRotorItems_onceToken != -1) {
    dispatch_once(&voiceOverRotorItems_onceToken, block);
  }
  char v34 = (void *)[(id)v53[5] copy];

  if (*((unsigned char *)v47 + 24)) {
    [(AXBaseSettings *)v39 setValue:v34 forPreferenceKey:@"VoiceOverTouchRotorItemsPreference"];
  }
  _Block_object_dispose(&v46, 8);

  _Block_object_dispose(&v52, 8);
  for (uint64_t i = 10; i != -1; --i)

  for (uint64_t j = 54; j != -1; --j)

  return (NSArray *)v34;
}

void __33__AXSettings_voiceOverRotorItems__block_invoke(uint64_t a1, void *a2)
{
  double v2 = *(void **)(a1 + 32);
  id v3 = [a2 objectForKey:@"RotorItem"];
  [v2 addObject:v3];
}

void __33__AXSettings_voiceOverRotorItems__block_invoke_2(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  double v2 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "count"));
  id v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v13 = a1;
  id obj = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  uint64_t v4 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(obj);
        }
        double v8 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v9 = objc_msgSend(v8, "objectForKeyedSubscript:", @"RotorItem", v13);
        BOOL v10 = [v8 objectForKeyedSubscript:@"Enabled"];
        if ([v2 containsObject:v9])
        {
          v15[0] = MEMORY[0x1E4F143A8];
          v15[1] = 3221225472;
          v15[2] = __33__AXSettings_voiceOverRotorItems__block_invoke_3;
          v15[3] = &unk_1E55883C8;
          id v16 = v9;
          id v17 = v10;
          uint64_t v11 = [v3 indexOfObjectPassingTest:v15];
          if (v11 != 0x7FFFFFFFFFFFFFFFLL) {
            [v3 replaceObjectAtIndex:v11 withObject:v8];
          }
        }
        else
        {
          [v3 addObject:v8];
          [v2 addObject:v9];
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v5);
  }

  uint64_t v12 = [v3 count];
  if (v12 != [*(id *)(*(void *)(*(void *)(v13 + 32) + 8) + 40) count])
  {
    *(unsigned char *)(*(void *)(*(void *)(v13 + 40) + 8) + 24) = 1;
    objc_storeStrong((id *)(*(void *)(*(void *)(v13 + 32) + 8) + 40), v3);
  }
}

uint64_t __33__AXSettings_voiceOverRotorItems__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 objectForKeyedSubscript:@"RotorItem"];
  if ([v4 isEqualToString:*(void *)(a1 + 32)])
  {
    uint64_t v5 = [v3 objectForKeyedSubscript:@"Enabled"];
    uint64_t v6 = [v5 isEqualToNumber:*(void *)(a1 + 40)] ^ 1;
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (void)setVoiceOverSpeakActionConfirmation:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"VoiceOverSpeakActionConfirmationPreference"];
}

- (BOOL)voiceOverSpeakActionConfirmation
{
  return AXSettingsReturnBoolValue(@"VoiceOverSpeakActionConfirmationPreference", 1);
}

- (void)setVoiceOverRotorUpdatesWithElement:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AXSVoiceOverRotorUpdatesWithElementPreference"];
}

- (BOOL)voiceOverRotorUpdatesWithElement
{
  return AXSettingsReturnBoolValue(@"AXSVoiceOverRotorUpdatesWithElementPreference", 1);
}

- (void)setVoiceOverEditAppsActionEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"VoiceOverEditAppsActionEnabledPreference"];
}

- (BOOL)voiceOverEditAppsActionEnabled
{
  return AXSettingsReturnBoolValue(@"VoiceOverEditAppsActionEnabledPreference", 1);
}

- (void)_localeChange:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F1CA20], "preferredLanguages", a3);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 enumerateObjectsUsingBlock:&__block_literal_global_1973];
}

uint64_t __28__AXSettings__localeChange___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [MEMORY[0x1E4F1CA20] characterDirectionForLanguage:a2];
  AnyUserPreferredLanguageIsRTL |= result == 2;
  return result;
}

- (BOOL)anyUserPreferredLangaugeIsRTL
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__AXSettings_anyUserPreferredLangaugeIsRTL__block_invoke;
  block[3] = &unk_1E5585F48;
  block[4] = self;
  if (anyUserPreferredLangaugeIsRTL_onceToken[0] != -1) {
    dispatch_once(anyUserPreferredLangaugeIsRTL_onceToken, block);
  }
  return AnyUserPreferredLanguageIsRTL;
}

void __43__AXSettings_anyUserPreferredLangaugeIsRTL__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _localeChange:0];
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 addObserver:*(void *)(a1 + 32) selector:sel__localeChange_ name:*MEMORY[0x1E4F1C370] object:0];
}

- (void)setVoiceOverBrailleTableIdentifier:(id)a3
{
}

- (NSString)voiceOverBrailleTableIdentifier
{
  id v2 = [(AXSettings *)self valueForPreferenceKey:@"voiceOverBrailleTableIdentifier"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    id v2 = 0;
  }

  return (NSString *)v2;
}

- (void)setVoiceOverBrailleLanguageRotorItems:(id)a3
{
}

- (NSArray)voiceOverBrailleLanguageRotorItems
{
  v24[3] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)_AXSVoiceOverTouchCopyBrailleLanguageRotorItems();
  if ([v2 count])
  {
    id v3 = v2;
  }
  else
  {
    id v4 = objc_opt_new();
    uint64_t v5 = +[AXLanguageManager sharedInstance];
    uint64_t v6 = [v5 userLocale];

    uint64_t v7 = [MEMORY[0x1E4F50C00] defaultTablesArrayForLocale:v6];
    if ([v7 count])
    {
      double v8 = [v7 firstObject];
      uint64_t v9 = MEMORY[0x1E4F1CC38];
      v23[0] = @"Default";
      v23[1] = @"Enabled";
      v24[0] = MEMORY[0x1E4F1CC38];
      v24[1] = MEMORY[0x1E4F1CC38];
      v23[2] = @"LanguageDefaults";
      BOOL v10 = [v6 localeIdentifier];
      long long v21 = v10;
      uint64_t v11 = [v8 identifier];
      unint64_t v22 = v11;
      uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
      v24[2] = v12;
      uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:3];
      [v4 addObject:v13];

      if ((unint64_t)[v7 count] >= 2)
      {
        unint64_t v14 = 1;
        do
        {
          uint64_t v15 = [v7 objectAtIndex:v14];
          v19[1] = @"RotorItem";
          v20[0] = v9;
          v19[0] = @"Enabled";
          id v16 = [v15 identifier];
          v20[1] = v16;
          id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
          [v4 addObject:v17];

          ++v14;
        }
        while (v14 < [v7 count]);
      }
    }
    id v3 = (id)[v4 copy];
  }

  return (NSArray *)v3;
}

- (void)setVoiceOverAlwaysUseNemethCodeForMathEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"voiceOverAlwaysUseNemethCodeForMathEnabled"];
}

- (BOOL)voiceOverAlwaysUseNemethCodeForMathEnabled
{
  id v2 = [(AXSettings *)self valueForPreferenceKey:@"voiceOverAlwaysUseNemethCodeForMathEnabled"];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char v3 = [v2 BOOLValue];
  }
  else
  {
    id v4 = [MEMORY[0x1E4F1CA20] currentLocale];
    uint64_t v5 = [v4 localeIdentifier];
    if ([v5 isEqualToString:@"en_US"]) {
      char v3 = 1;
    }
    else {
      char v3 = [v5 isEqualToString:@"en_CA"];
    }
  }
  return v3;
}

- (NSNumber)voiceOverHandwritingWasNativeAutocorrectEnabled
{
  return (NSNumber *)[(AXSettings *)self valueForPreferenceKey:@"VoiceOverHandwritingWasNativeAutocorrectEnabled"];
}

- (void)setVoiceOverHandwritingWasNativeAutocorrectEnabled:(id)a3
{
}

- (BOOL)voiceOverBrailleGradeTwoAutoTranslateEnabled
{
  return AXSettingsReturnBoolValue(@"VoiceOverShowGrade2AutoTranslate", 0);
}

- (void)setVoiceOverBrailleGradeTwoAutoTranslateEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"VoiceOverShowGrade2AutoTranslate"];
}

- (BOOL)voiceOverShowSoftwareKeyboardWithBraille
{
  return AXSettingsReturnBoolValue(@"VoiceOverShowSWKeyboardWithBraille", 0);
}

- (void)setVoiceOverShowSoftwareKeyboardWithBraille:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"VoiceOverShowSWKeyboardWithBraille"];
}

- (BOOL)voiceOverSpeakNonfocusableElementsAfterDelay
{
  return AXSettingsReturnBoolValue(@"VoiceOverSpeakNonfocusableElementsAfterDelay", 1);
}

- (void)setVoiceOverSpeakNonfocusableElementsAfterDelay:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"VoiceOverSpeakNonfocusableElementsAfterDelay"];
}

- (BOOL)voiceOverSilenceAnnouncements
{
  return AXSettingsReturnBoolValue(@"VoiceOverSilenceAnnouncements", 0);
}

- (void)setVoiceOverSilenceAnnouncements:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"VoiceOverSilenceAnnouncements"];
}

- (int64_t)voiceOverPreferredTVInteractionMode
{
  return AXSettingsReturnIntegerValue(@"VoiceOverTouchTVInteractionMode", 1);
}

- (void)setVoiceOverPreferredTVInteractionMode:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"VoiceOverTouchTVInteractionMode"];
}

- (BOOL)voiceOverPrefersFollowFocusNavigationStyle
{
  return AXSettingsReturnBoolValue(@"VoiceOverTouchTVPrefersFollowFocusNavigationStyle", 0);
}

- (void)setVoiceOverPrefersFollowFocusNavigationStyle:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"VoiceOverTouchTVPrefersFollowFocusNavigationStyle"];
}

- (BOOL)voiceOverExploreFocusAffectsNativeFocus
{
  return AXSettingsReturnBoolValue(@"VoiceOverExploreFocusAffectsNativeFocus", 0);
}

- (void)setVoiceOverExploreFocusAffectsNativeFocus:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"VoiceOverExploreFocusAffectsNativeFocus"];
}

- (int64_t)voiceOverDescribedMedia
{
  return AXSettingsReturnIntegerValue(@"VoiceOverTouchDescribedMedia", *MEMORY[0x1E4F485C0]);
}

- (void)setVoiceOverDescribedMedia:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"VoiceOverTouchDescribedMedia"];
}

- (NSData)voiceOverCustomCommandProfile
{
  return (NSData *)[(AXSettings *)self valueForPreferenceKey:@"VoiceOverCustomCammndProfile"];
}

- (void)setVoiceOverCustomCommandProfile:(id)a3
{
}

- (BOOL)voiceOverShouldDisallowUSBRestrictedMode
{
  return AXSettingsReturnBoolValue(@"VoiceOverShouldDisallowUSBRestrictedMode", 0);
}

- (void)setVoiceOverShouldDisallowUSBRestrictedMode:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"VoiceOverShouldDisallowUSBRestrictedMode"];
}

- (NSArray)voiceOverDetectionModeItems
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  unsigned int v3 = 0;
  uint64_t v4 = MEMORY[0x1E4F1CC38];
  do
  {
    if ((AXDeviceSupportsDetectionMode() & 1) != 0 || v3 > 5 || ((1 << v3) & 0x23) == 0)
    {
      uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
      uint64_t v6 = AXNameForDetectionMode(v3);
      [v5 setObject:v6 forKey:@"Detector"];

      [v5 setObject:v4 forKey:@"Enabled"];
      [v2 axSafelyAddObject:v5];
    }
    ++v3;
  }
  while (v3 != 6);
  uint64_t v7 = objc_opt_class();
  double v8 = AXSettingsReturnObjectValueWithClass(@"VoiceOverDetectionModeItems", v2, v7);
  uint64_t v9 = [v2 count];
  uint64_t v10 = [v8 count];
  uint64_t v11 = v8;
  if (v9 != v10)
  {
    [(AXSettings *)self setVoiceOverDetectionModeItems:v2];
    uint64_t v11 = v2;
  }
  uint64_t v12 = v11;

  return v12;
}

- (void)setVoiceOverDetectionModeItems:(id)a3
{
}

- (BOOL)liveRecognitionActive
{
  return AXSettingsReturnBoolValue(@"AXSLiveRecognitionActive", 0);
}

- (void)setLiveRecognitionActive:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AXSLiveRecognitionActive"];
}

- (BOOL)liveRecognitionOverlayOpen
{
  return AXSettingsReturnBoolValue(@"AXSLiveRecognitionOverlayOpen", 0);
}

- (void)setLiveRecognitionOverlayOpen:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AXSLiveRecognitionOverlayOpen"];
}

- (NSArray)enabledLiveRecognitionModes
{
  id v2 = [(AXSettings *)self valueForPreferenceKey:@"AXSEnabledLiveRecognitionModes"];
  unsigned int v3 = v2;
  if (!v2) {
    id v2 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v4 = v2;

  return v4;
}

- (void)setEnabledLiveRecognitionModes:(id)a3
{
}

- (BOOL)switchControlShouldDisallowUSBRestrictedMode
{
  return AXSettingsReturnBoolValue(@"SCShouldDisallowUSBRestrictedMode", 0);
}

- (void)setSwitchControlShouldDisallowUSBRestrictedMode:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"SCShouldDisallowUSBRestrictedMode"];
}

- (BOOL)voiceOverUserDidReadUSBRestrictedModeAlert
{
  return AXSettingsReturnBoolValue(@"VoiceOverUserDidReadUSBRestrictedModeAlert", 0);
}

- (void)setVoiceOverUserDidReadUSBRestrictedModeAlert:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"VoiceOverUserDidReadUSBRestrictedModeAlert"];
}

- (BOOL)switchControlUserDidReadUSBRestrictedModeAlert
{
  return AXSettingsReturnBoolValue(@"SCUserDidReadUSBRestrictedModeAlert", 0);
}

- (void)setSwitchControlUserDidReadUSBRestrictedModeAlert:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"SCUserDidReadUSBRestrictedModeAlert"];
}

- (void)addRotorOptionsForLoginSession
{
  v24[2] = *MEMORY[0x1E4F143B8];
  id v2 = [(AXSettings *)self voiceOverRotorItems];
  unsigned int v3 = (void *)[v2 mutableCopy];

  uint64_t v4 = *MEMORY[0x1E4F486A0];
  v24[0] = *MEMORY[0x1E4F48658];
  v24[1] = v4;
  [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [obj countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v16 = *(void *)v18;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v18 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v17 + 1) + 8 * v7);
        v21[0] = @"RotorItem";
        v21[1] = @"Enabled";
        v22[0] = v8;
        v22[1] = MEMORY[0x1E4F1CC38];
        uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
        if ([v3 count])
        {
          uint64_t v10 = 0;
          while (1)
          {
            uint64_t v11 = [v3 objectAtIndex:v10];
            uint64_t v12 = [v11 objectForKey:@"RotorItem"];
            int v13 = [v12 isEqualToString:v8];

            if (v13) {
              break;
            }

            if (++v10 >= (unint64_t)[v3 count]) {
              goto LABEL_10;
            }
          }
          [v3 replaceObjectAtIndex:v10 withObject:v9];
        }
        else
        {
LABEL_10:
          [v3 addObject:v9];
        }

        ++v7;
      }
      while (v7 != v6);
      uint64_t v6 = [obj countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v6);
  }

  [(AXSettings *)self setVoiceOverRotorItems:v3];
}

- (void)configureZoomForLoginSession
{
  [(AXSettings *)self setZoomShouldShowSlug:1];
  [(AXSettings *)self setZoomScale:2.0];

  [(AXSettings *)self setZoomInStandby:0];
}

- (void)clearVoicePrefersCompactSettings
{
}

- (void)setVoiceOverAlternativeVoiceIdentifier:(id)a3 forLanguage:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  uint64_t v7 = [(AXSettings *)self valueForPreferenceKey:@"AXSVoiceOverAlternativeVoicesPreference"];
  uint64_t v8 = (void *)[v7 mutableCopy];

  if (!v8) {
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
  }
  if (v9) {
    [v8 setObject:v9 forKey:v6];
  }
  else {
    [v8 removeObjectForKey:v6];
  }
  [(AXBaseSettings *)self setValue:v8 forPreferenceKey:@"AXSVoiceOverAlternativeVoicesPreference"];
}

- (id)voiceOverAlternativeVoiceIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AXSettings *)self valueForPreferenceKey:@"AXSVoiceOverAlternativeVoicesPreference"];
  id v6 = [v5 objectForKey:v4];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  return v7;
}

- (id)_voiceOverTouchSpeakingRateLanguages
{
  return [(AXSettings *)self valueForPreferenceKey:@"VoiceOverLanguageSpeakingRate"];
}

- (void)setVoiceOverSpeakingRate:(float)a3 forLanguage:(id)a4
{
  id v4 = AXLogSettings();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    -[AXSettings setVoiceOverSpeakingRate:forLanguage:](v4);
  }
}

- (float)voiceOverSpeakingRateForLanguage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AXSettings *)self valueForPreferenceKey:@"VoiceOverLanguageSpeakingRate"];
  id v6 = [v5 objectForKey:v4];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v6 floatValue];
    float v8 = v7;
  }
  else
  {
    float v8 = 3.4028e38;
  }

  return v8;
}

- (float)voiceOverEffectiveSpeakingRate
{
  uint64_t v12 = 0;
  int v13 = (float *)&v12;
  uint64_t v14 = 0x2020000000;
  int v15 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  id v4 = [(AXSettings *)self swiftSettings];
  uint64_t v5 = [v4 voiceover];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __44__AXSettings_voiceOverEffectiveSpeakingRate__block_invoke;
  v9[3] = &unk_1E5588438;
  uint64_t v11 = &v12;
  id v6 = v3;
  uint64_t v10 = v6;
  [v5 effectiveSpeakingRateWithCompletionHandler:v9];

  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  float v7 = v13[6];

  _Block_object_dispose(&v12, 8);
  return v7;
}

intptr_t __44__AXSettings_voiceOverEffectiveSpeakingRate__block_invoke(uint64_t a1, float a2)
{
  *(float *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)setVoiceOverEffectiveSpeakingRate:(float)a3
{
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  id v6 = [(AXSettings *)self swiftSettings];
  float v7 = [v6 voiceover];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __48__AXSettings_setVoiceOverEffectiveSpeakingRate___block_invoke;
  v10[3] = &unk_1E5585F48;
  dispatch_semaphore_t v11 = v5;
  float v8 = v5;
  *(float *)&double v9 = a3;
  [v7 setEffectiveSpeakingRate:v10 completionHandler:v9];

  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __48__AXSettings_setVoiceOverEffectiveSpeakingRate___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (float)voiceOverEffectiveSpeakingVolume
{
  uint64_t v12 = 0;
  int v13 = (float *)&v12;
  uint64_t v14 = 0x2020000000;
  int v15 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  id v4 = [(AXSettings *)self swiftSettings];
  dispatch_semaphore_t v5 = [v4 voiceover];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __46__AXSettings_voiceOverEffectiveSpeakingVolume__block_invoke;
  v9[3] = &unk_1E5588438;
  dispatch_semaphore_t v11 = &v12;
  id v6 = v3;
  uint64_t v10 = v6;
  [v5 effectiveSpeakingVolumeWithCompletionHandler:v9];

  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  float v7 = v13[6];

  _Block_object_dispose(&v12, 8);
  return v7;
}

intptr_t __46__AXSettings_voiceOverEffectiveSpeakingVolume__block_invoke(uint64_t a1, float a2)
{
  *(float *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)setVoiceOverEffectiveSpeakingVolume:(float)a3
{
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  id v6 = [(AXSettings *)self swiftSettings];
  float v7 = [v6 voiceover];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __50__AXSettings_setVoiceOverEffectiveSpeakingVolume___block_invoke;
  v10[3] = &unk_1E5585F48;
  dispatch_semaphore_t v11 = v5;
  float v8 = v5;
  *(float *)&double v9 = a3;
  [v7 setEffectiveSpeakingVolume:v10 completionHandler:v9];

  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __50__AXSettings_setVoiceOverEffectiveSpeakingVolume___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)voiceOverShouldOutputToHearingAid
{
  return AXSettingsReturnBoolValue(@"VoiceOverOutputToHearingAid", 0);
}

- (void)setVoiceOverShouldOutputToHearingAid:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"VoiceOverOutputToHearingAid"];
}

- (BOOL)voiceOverTouchBrailleGesturesShouldUseLockedConfiguration
{
  return AXSettingsReturnBoolValue(@"VoiceOverBrailleGesturesShouldUseLockedConfiguration", 0);
}

- (void)setVoiceOverTouchBrailleGesturesShouldUseLockedConfiguration:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"VoiceOverBrailleGesturesShouldUseLockedConfiguration"];
}

- (int64_t)voiceOverTouchBrailleGesturesLockedOrientation
{
  return AXSettingsReturnIntegerValue(@"VoiceOverBrailleGesturesLockedOrientation", 3);
}

- (void)setVoiceOverTouchBrailleGesturesLockedOrientation:(int64_t)a3
{
  id v4 = [NSNumber numberWithLong:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"VoiceOverBrailleGesturesLockedOrientation"];
}

- (int64_t)voiceOverTouchBrailleGesturesLockedTypingMode
{
  return AXSettingsReturnIntegerValue(@"VoiceOverBrailleGesturesLockedTypingMode", 0);
}

- (void)setVoiceOverTouchBrailleGesturesLockedTypingMode:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"VoiceOverBrailleGesturesLockedTypingMode"];
}

- (BOOL)voiceOverTouchBrailleGesturesDidPlayCalibrationHint
{
  return AXSettingsReturnBoolValue(@"VoiceOverBrailleGesturesDidPlayCalibrationHint", 0);
}

- (void)setVoiceOverTouchBrailleGesturesDidPlayCalibrationHint:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"VoiceOverBrailleGesturesDidPlayCalibrationHint"];
}

- (BOOL)voiceOverBrailleAlertsEnabled
{
  return AXSettingsReturnBoolValue(@"AXSVoiceOverBrailleAlertsEnabled", 1);
}

- (void)setVoiceOverBrailleAlertsEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AXSVoiceOverBrailleAlertsEnabled"];
}

- (BOOL)voiceOverBrailleAlertShowUntilDismissed
{
  return AXSettingsReturnBoolValue(@"AXSVoiceOverBrailleAlertShowUntilDismissed", 0);
}

- (void)setVoiceOverBrailleAlertShowUntilDismissed:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AXSVoiceOverBrailleAlertShowUntilDismissed"];
}

- (double)voiceOverBrailleAlertDisplayDuration
{
  return AXSettingsReturnDoubleValue(@"VoiceOverBrailleDisplayAlertDuration", *MEMORY[0x1E4F48578]);
}

- (void)setVoiceOverBrailleAlertDisplayDuration:(double)a3
{
  if (*MEMORY[0x1E4F48598] <= a3) {
    a3 = *MEMORY[0x1E4F48598];
  }
  if (a3 < *MEMORY[0x1E4F485A0]) {
    a3 = *MEMORY[0x1E4F485A0];
  }
  id v4 = [NSNumber numberWithDouble:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"VoiceOverBrailleDisplayAlertDuration"];
}

- (double)voiceOverBrailleKeyDebounceTimeout
{
  return AXSettingsReturnDoubleValue(@"VoiceOverBrailleKeyDebounceTimeout", 0.3);
}

- (void)setVoiceOverBrailleKeyDebounceTimeout:(double)a3
{
  if (*MEMORY[0x1E4F485A8] <= a3) {
    a3 = *MEMORY[0x1E4F485A8];
  }
  if (a3 < *MEMORY[0x1E4F485B0]) {
    a3 = *MEMORY[0x1E4F485B0];
  }
  id v4 = [NSNumber numberWithDouble:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"VoiceOverBrailleKeyDebounceTimeout"];
}

- (double)voiceOverDoubleTapInterval
{
  return AXSettingsReturnDoubleValue((void *)kAXSVoiceOverDoubleTapInterval, 0.35);
}

- (void)setVoiceOverDoubleTapInterval:(double)a3
{
  if (*MEMORY[0x1E4F485C8] <= a3) {
    a3 = *MEMORY[0x1E4F485C8];
  }
  if (a3 < *MEMORY[0x1E4F485D0]) {
    a3 = *MEMORY[0x1E4F485D0];
  }
  id v4 = [NSNumber numberWithDouble:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:kAXSVoiceOverDoubleTapInterval];
}

- (int64_t)voiceOverNavigationDirectionMode
{
  if (![(AXSettings *)self anyUserPreferredLangaugeIsRTL]) {
    return 0;
  }

  return AXSettingsReturnIntegerValue(@"VoiceOverNavigationDirectionMode", 0);
}

- (void)setVoiceOverNavigationDirectionMode:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"VoiceOverNavigationDirectionMode"];
}

- (id)_audioHardwareChannelLayout
{
  return [(AXSettings *)self valueForPreferenceKey:@"AXSAudioHardwareChannelLayoutsPreference"];
}

- (void)_setAudioHardwareChannelLayout:(id)a3
{
}

- (BOOL)tapToSpeakTimeEnabled
{
  return AXSettingsReturnBoolValue(@"TapToSpeakTimeEnabled", *MEMORY[0x1E4F48188]);
}

- (void)setTapToSpeakTimeEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"TapToSpeakTimeEnabled"];
}

- (int64_t)tapToSpeakTimeAvailability
{
  return AXSettingsReturnIntegerValue(@"TapToSpeakTimeAvailability", *MEMORY[0x1E4F48180]);
}

- (void)setTapToSpeakTimeAvailability:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"TapToSpeakTimeAvailability"];
}

- (BOOL)tapticTimeIsAvailable
{
  return [(AXSettings *)self voiceOverEnabled]
      || ![(AXSettings *)self tapToSpeakTimeEnabled]
      || [(AXSettings *)self tapToSpeakTimeAvailability] != 2;
}

- (BOOL)voiceOverTapticTimeMode
{
  if ([(AXSettings *)self voiceOverEnabled])
  {
    dispatch_semaphore_t v3 = (unsigned __int8 *)MEMORY[0x1E4F481A0];
  }
  else
  {
    int v4 = [(AXSettings *)self tapticTimeIsAvailable];
    if (!v4) {
      return v4;
    }
    dispatch_semaphore_t v3 = (unsigned __int8 *)MEMORY[0x1E4F48198];
  }
  uint64_t v5 = *v3;

  LOBYTE(v4) = AXSettingsReturnBoolValue(@"VoiceOverTapticTimeMode", v5);
  return v4;
}

- (void)setVoiceOverTapticTimeMode:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"VoiceOverTapticTimeMode"];
}

- (int64_t)voiceOverTapticTimeEncoding
{
  return AXSettingsReturnIntegerValue(@"VoiceOverTapticTimeEncoding", *MEMORY[0x1E4F481B8]);
}

- (void)setVoiceOverTapticTimeEncoding:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"VoiceOverTapticTimeEncoding"];
}

- (float)voiceOverTapticTimeSpeed
{
  return AXSettingsReturnDoubleValue(@"VoiceOverTapticTimeSpeed", *MEMORY[0x1E4F481C0]);
}

- (void)setVoiceOverTapticTimeSpeed:(float)a3
{
  if (*MEMORY[0x1E4F481D0] >= a3) {
    a3 = *MEMORY[0x1E4F481D0];
  }
  if (*MEMORY[0x1E4F481C8] < a3) {
    a3 = *MEMORY[0x1E4F481C8];
  }
  id v4 = [NSNumber numberWithFloat:*(double *)&a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"VoiceOverTapticTimeSpeed"];
}

- (BOOL)voiceOverTapticChimesEnabled
{
  return AXSettingsReturnBoolValue(@"VoiceOverTapticChimesEnabled", *MEMORY[0x1E4F48190]);
}

- (void)setVoiceOverTapticChimesEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"VoiceOverTapticChimesEnabled"];
}

- (BOOL)tapticTimeInternalFlashScreenEnabled
{
  return AXSettingsReturnBoolValue(@"TapticTimeInternalFlashScreenEnabled", 0);
}

- (void)setTapticTimeInternalFlashScreenEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"TapticTimeInternalFlashScreenEnabled"];
}

- (int64_t)voiceOverTapticChimesAvailability
{
  return AXSettingsReturnIntegerValue(@"VoiceOverTapticChimesAvailability", 1);
}

- (void)setVoiceOverTapticChimesAvailability:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"VoiceOverTapticChimesAvailability"];
}

- (int64_t)voiceOverTapticChimesFrequencyEncoding
{
  return AXSettingsReturnIntegerValue(@"VoiceOverTapticChimesFrequencyEncoding", *MEMORY[0x1E4F481A8]);
}

- (void)setVoiceOverTapticChimesFrequencyEncoding:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"VoiceOverTapticChimesFrequencyEncoding"];
}

- (int64_t)voiceOverTapticChimesSoundType
{
  return AXSettingsReturnIntegerValue(@"VoiceOverTapticChimesSoundType", *MEMORY[0x1E4F481B0]);
}

- (void)setVoiceOverTapticChimesSoundType:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"VoiceOverTapticChimesSoundType"];
}

- (BOOL)voiceOverTouchBrailleShouldReverseDots
{
  return AXSettingsReturnBoolValue(@"AXSVoiceOverTouchShouldReverseDots", 0);
}

- (void)setVoiceOverTouchBrailleShouldReverseDots:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AXSVoiceOverTouchShouldReverseDots"];
}

- (BOOL)voiceOverTouchBrailleGestureControl
{
  return AXSettingsReturnBoolValue(@"AXSVoiceOverTouchBrailleGestureControl", 0);
}

- (void)setVoiceOverTouchBrailleGestureControl:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AXSVoiceOverTouchBrailleGestureControl"];
}

- (BOOL)voiceOverTouchBrailleShowTextStyleStatus
{
  return AXSettingsReturnBoolValue(@"AXSVoiceOverTouchBrailleShowTextStyleStatus", 0);
}

- (void)setVoiceOverTouchBrailleShowTextStyleStatus:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AXSVoiceOverTouchBrailleShowTextStyleStatus"];
}

- (BOOL)voiceOverTouchUpdateBrailleWithoutConnectedDisplay
{
  return AXSettingsReturnBoolValue(@"AXSVoiceOverTouchUpdateBrailleWithoutConnectedDisplay", 0);
}

- (void)setVoiceOverTouchUpdateBrailleWithoutConnectedDisplay:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AXSVoiceOverTouchUpdateBrailleWithoutConnectedDisplay"];
}

- (id)voiceOverTouchPreferredBrailleTableIdentifiers
{
  uint64_t v2 = objc_opt_class();
  dispatch_semaphore_t v3 = (void *)MEMORY[0x1E4F1CC08];

  return AXSettingsReturnObjectValueWithClass(@"AXSVoiceOverTouchBraillePreferredTableIdentifiers", v3, v2);
}

- (void)setVoiceOverTouchPreferredBrailleTableIdentifiers:(id)a3
{
}

- (id)preferredBrailleTableIdentifierForKeyboardLanguage:(id)a3 keyboardLayout:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  float v8 = [(AXSettings *)self voiceOverTouchPreferredBrailleTableIdentifiers];
  double v9 = [v8 objectForKey:v7];

  if (v9)
  {
    if (v6)
    {
      id v10 = v6;
    }
    else
    {
      id v10 = [MEMORY[0x1E4F1CA98] null];
    }
    uint64_t v12 = v10;
    dispatch_semaphore_t v11 = [v9 objectForKey:v10];
  }
  else
  {
    dispatch_semaphore_t v11 = 0;
  }

  return v11;
}

- (void)setPreferredBrailleTableIdentifier:(id)a3 forKeyboardLanguage:(id)a4 keyboardLayout:(id)a5
{
  id v19 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(AXSettings *)self voiceOverTouchPreferredBrailleTableIdentifiers];
  dispatch_semaphore_t v11 = (void *)[v10 mutableCopy];

  uint64_t v12 = [v11 objectForKey:v8];
  int v13 = (void *)[v12 mutableCopy];
  uint64_t v14 = v13;
  if (v13) {
    id v15 = v13;
  }
  else {
    id v15 = (id)objc_opt_new();
  }
  uint64_t v16 = v15;

  if (v9)
  {
    id v17 = v9;
  }
  else
  {
    id v17 = [MEMORY[0x1E4F1CA98] null];
  }
  long long v18 = v17;
  [v16 setObject:v19 forKeyedSubscript:v17];
  [v11 setObject:v16 forKeyedSubscript:v8];
  [(AXSettings *)self setVoiceOverTouchPreferredBrailleTableIdentifiers:v11];
}

- (BOOL)voiceOverShouldFocusEverywhere
{
  return 0;
}

- (void)setVoiceOverShouldFocusEverywhere:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AXSSVoiceOverShouldFocusEverywhere"];
}

- (BOOL)voiceOverTouchBrailleShowGeneralStatus
{
  return AXSettingsReturnBoolValue(@"AXSVoiceOverTouchBrailleShowGeneralStatus", 0);
}

- (void)setVoiceOverTouchBrailleShowGeneralStatus:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AXSVoiceOverTouchBrailleShowGeneralStatus"];
}

- (BOOL)voiceOverShouldSpeakDiscoveredText
{
  return AXSettingsReturnBoolValue(@"AXSVoiceOverShouldSpeakDiscoveredTextPreference", 1);
}

- (void)setVoiceOverShouldSpeakDiscoveredText:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AXSVoiceOverShouldSpeakDiscoveredTextPreference"];
}

- (int64_t)voiceOverNeuralElementFeedback
{
  return AXSettingsReturnIntegerValue(@"AXSVoiceOverSpeakDiscoveredTextFeedbackPreference", 1);
}

- (void)setVoiceOverNeuralElementFeedback:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AXSVoiceOverSpeakDiscoveredTextFeedbackPreference"];
}

- (int64_t)voiceOverNumberFeedback
{
  return AXSettingsReturnIntegerValue(@"AXSVoiceOverNumberFeedback", 1);
}

- (void)setVoiceOverNumberFeedback:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AXSVoiceOverNumberFeedback"];
}

- (BOOL)voiceOverAutomaticButtonLabels
{
  return 1;
}

- (void)setVoiceOverAutomaticButtonLabels:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AXSVoiceOverAutomaticButtonLabelsPreference"];
}

- (NSDictionary)voiceOverSoundAndHapticPreferences
{
  return (NSDictionary *)[(AXSettings *)self valueForPreferenceKey:@"VoiceOverSoundsAndHaptics"];
}

- (void)setVoiceOverSoundAndHapticPreferences:(id)a3
{
}

- (id)_voiceOverSoundOrHapticValueForPreference:(id)a3 outputEvent:(id)a4
{
  if (a4)
  {
    id v6 = a4;
    id v7 = a3;
    id v8 = [(AXSettings *)self valueForPreferenceKey:@"VoiceOverSoundsAndHaptics"];
    id v9 = [v8 objectForKey:v6];

    id v10 = [v9 objectForKey:v7];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (void)_voiceOverSetSoundOrHapticValue:(id)a3 forPreference:(id)a4 outputEvent:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(AXSettings *)self valueForPreferenceKey:@"VoiceOverSoundsAndHaptics"];
  dispatch_semaphore_t v11 = (void *)[v10 mutableCopy];

  if (!v11)
  {
    dispatch_semaphore_t v11 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  uint64_t v12 = [v11 objectForKey:v9];
  int v13 = (void *)[v12 mutableCopy];

  if (!v13)
  {
    int v13 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  [v13 setObject:v14 forKeyedSubscript:v8];
  [v11 setObject:v13 forKeyedSubscript:v9];
  [(AXBaseSettings *)self setValue:v11 forPreferenceKey:@"VoiceOverSoundsAndHaptics"];
}

- (id)voiceOverSoundEnabledForEvent:(id)a3
{
  return [(AXSettings *)self _voiceOverSoundOrHapticValueForPreference:@"soundEnabled" outputEvent:a3];
}

- (void)voiceOverSetSoundEnabled:(BOOL)a3 forEvent:(id)a4
{
  BOOL v4 = a3;
  id v6 = NSNumber;
  id v7 = a4;
  id v8 = [v6 numberWithBool:v4];
  [(AXSettings *)self _voiceOverSetSoundOrHapticValue:v8 forPreference:@"soundEnabled" outputEvent:v7];
}

- (BOOL)_defaultHapticValueForEvent:(id)a3
{
  id v3 = a3;
  if (_defaultHapticValueForEvent__onceToken != -1) {
    dispatch_once(&_defaultHapticValueForEvent__onceToken, &__block_literal_global_2003);
  }
  BOOL v4 = [(id)_defaultHapticValueForEvent__DefaultOverrides objectForKeyedSubscript:v3];
  uint64_t v5 = v4;
  if (v4) {
    char v6 = [v4 BOOLValue];
  }
  else {
    char v6 = 1;
  }

  return v6;
}

void __42__AXSettings__defaultHapticValueForEvent___block_invoke()
{
  v0 = (void *)_defaultHapticValueForEvent__DefaultOverrides;
  _defaultHapticValueForEvent__DefaultOverrides = (uint64_t)&unk_1EDC634E8;
}

- (id)voiceOverHapticEnabledForEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AXSettings *)self _voiceOverSoundOrHapticValueForPreference:@"hapticEnabled" outputEvent:v4];
  char v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[AXSettings _defaultHapticValueForEvent:](self, "_defaultHapticValueForEvent:", v4));
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v8 = v7;

  return v8;
}

- (void)voiceOverSetHapticEnabled:(BOOL)a3 forEvent:(id)a4
{
  BOOL v4 = a3;
  char v6 = NSNumber;
  id v7 = a4;
  id v8 = [v6 numberWithBool:v4];
  [(AXSettings *)self _voiceOverSetSoundOrHapticValue:v8 forPreference:@"hapticEnabled" outputEvent:v7];
}

- (void)voiceOverResetSoundAndHapticPreferences
{
}

- (NSArray)voiceOverQuickSettingsItems
{
  uint64_t v2 = [(AXSettings *)self valueForPreferenceKey:@"QuickSettings"];
  id v3 = v2;
  if (!v2) {
    uint64_t v2 = (void *)MEMORY[0x1E4F1CBF0];
  }
  BOOL v4 = v2;

  return v4;
}

- (void)setVoiceOverQuickSettingsItems:(id)a3
{
}

- (BOOL)independentHearingAidSettings
{
  return AXSettingsReturnBoolValue(@"HearingAidEarIndependencePreference", 1);
}

- (void)setIndependentHearingAidSettings:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"HearingAidEarIndependencePreference"];
}

- (BOOL)allowHearingAidControlOnLockScreen
{
  return AXSettingsReturnBoolValue(@"HearingAidControlAvailableOnLockScreen", 1);
}

- (void)setAllowHearingAidControlOnLockScreen:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"HearingAidControlAvailableOnLockScreen"];
}

- (BOOL)shouldStreamToLeftAid
{
  return AXSettingsReturnBoolValue(@"HearingAidStreamToLeft", 1);
}

- (void)setShouldStreamToLeftAid:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"HearingAidStreamToLeft"];
}

- (BOOL)leftRightBalanceEnabled
{
  return AXSettingsReturnBoolValue(@"LeftRightBalanceEnabled", 0);
}

- (void)setLeftRightBalanceEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithBool:");
  [(AXBaseSettings *)self setValue:v5 forPreferenceKey:@"LeftRightBalanceEnabled"];

  float v8 = 0.0;
  if (v3)
  {
    [(AXSettings *)self leftRightBalanceValue];
    double v10 = v9;
    _AXSLeftRightAudioBalance();
    if (v10 == v11) {
      return;
    }
    uint64_t v6 = [(AXSettings *)self leftRightBalanceValue];
    float v8 = v12;
  }

  MEMORY[0x1F4178F80](v6, v7, v8);
}

- (double)leftRightBalanceValue
{
  uint64_t v2 = objc_opt_class();
  BOOL v3 = AXSettingsReturnObjectValueWithClass(@"LeftRightBalanceValue", &unk_1EDC62AD8, v2);
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (void)setLeftRightBalanceValue:(double)a3
{
  id v4 = [NSNumber numberWithDouble:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"LeftRightBalanceValue"];
}

- (BOOL)shouldStreamToRightAid
{
  return AXSettingsReturnBoolValue(@"HearingAidStreamToRight", 1);
}

- (void)setShouldStreamToRightAid:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"HearingAidStreamToRight"];
}

- (void)_updateTouchAccommodationsTripleClickSetting
{
  if ([(AXSettings *)self touchAccommodationsEnabled]
    || (+[AXSettings sharedInstance],
        BOOL v3 = objc_claimAutoreleasedReturnValue(),
        int v4 = [v3 touchAccommodationsTripleClickConfirmed],
        v3,
        v4))
  {
    _AXSTripleClickAddOption();
  }
  else if (![(AXSettings *)self touchAccommodationsAreConfigured] {
         || (+[AXSettings sharedInstance],
  }
             double v5 = objc_claimAutoreleasedReturnValue(),
             char v6 = [v5 touchAccommodationsTripleClickConfirmed],
             v5,
             (v6 & 1) == 0))
  {
    _AXSTripleClickRemoveOption();
  }
}

- (BOOL)touchAccommodationsEnabled
{
  return AXSettingsReturnBoolValue(@"TouchAccommodationsEnabledPreference", 0);
}

- (void)setTouchAccommodationsEnabled:(BOOL)a3
{
  int v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"TouchAccommodationsEnabledPreference"];

  [(AXSettings *)self _updateTouchAccommodationsTripleClickSetting];
}

- (BOOL)touchAccommodationsAreConfigured
{
  return [(AXSettings *)self touchAccommodationsHoldDurationEnabled]
      || [(AXSettings *)self touchAccommodationsIgnoreRepeatEnabled]
      || [(AXSettings *)self touchAccommodationsTapActivationMethod] != 0;
}

- (BOOL)touchAccommodationsTripleClickConfirmed
{
  return AXSettingsReturnBoolValue(@"AXSTouchAccommodationsTripleClickConfirmedPreference", 0);
}

- (void)setTouchAccommodationsTripleClickConfirmed:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AXSTouchAccommodationsTripleClickConfirmedPreference"];
}

- (BOOL)touchAccommodationsUsageConfirmed
{
  return AXSettingsReturnBoolValue(@"TouchAccommodationsUsageConfirmedPreference", 0);
}

- (void)setTouchAccommodationsUsageConfirmed:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"TouchAccommodationsUsageConfirmedPreference"];
}

- (BOOL)touchAccommodationsHoldDurationEnabled
{
  return AXSettingsReturnBoolValue(@"TouchAccommodationsHoldDurationEnabledPreference", 0);
}

- (void)setTouchAccommodationsHoldDurationEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"TouchAccommodationsHoldDurationEnabledPreference"];

  [(AXSettings *)self _updateTouchAccommodationsTripleClickSetting];
}

- (double)touchAccommodationsHoldDuration
{
  return AXSettingsReturnDoubleValue(@"TouchAccommodationsHoldDurationPreference", *MEMORY[0x1E4F48540]);
}

- (void)setTouchAccommodationsHoldDuration:(double)a3
{
  if (*MEMORY[0x1E4F48538] < a3) {
    a3 = *MEMORY[0x1E4F48538];
  }
  if (*MEMORY[0x1E4F48540] >= a3) {
    a3 = *MEMORY[0x1E4F48540];
  }
  id v4 = [NSNumber numberWithDouble:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"TouchAccommodationsHoldDurationPreference"];
}

- (BOOL)touchAccommodationsAllowsSwipeGesturesToBypass
{
  return AXSettingsReturnBoolValue(@"TouchAccommodationsAllowsSwipeGesturesToBypassPreference", 0);
}

- (void)setTouchAccommodationsAllowsSwipeGesturesToBypass:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"TouchAccommodationsAllowsSwipeGesturesToBypassPreference"];
}

- (double)touchAccommodationsSwipeGestureMinimumDistance
{
  return AXSettingsReturnDoubleValue(@"TouchAccommodationsHoldDurationSwipeGestureMinimumDistancePreference", 40.0);
}

- (void)setTouchAccommodationsSwipeGestureMinimumDistance:(double)a3
{
  if (*MEMORY[0x1E4F48558] < a3) {
    a3 = *MEMORY[0x1E4F48558];
  }
  if (*MEMORY[0x1E4F48560] >= a3) {
    a3 = *MEMORY[0x1E4F48560];
  }
  id v4 = [NSNumber numberWithDouble:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"TouchAccommodationsHoldDurationSwipeGestureMinimumDistancePreference"];
}

- (int64_t)touchAccommodationsHoldDurationSwipeGestureSensitivity
{
  return AXSettingsReturnIntegerValue(@"TouchAccommodationsHoldDurationSwipeGestureSensitivityPreference", 1);
}

- (BOOL)touchAccommodationsHoldDurationAllowsSwipeGesturesToBypass
{
  int v3 = AXSettingsReturnBoolValue(@"TouchAccommodationsHoldDurationAllowsSwipeGesturesToBypassPreference", 0);
  BOOL result = 0;
  if (v3) {
    return [(AXSettings *)self touchAccommodationsTapActivationMethod] == 0;
  }
  return result;
}

- (BOOL)touchAccommodationsIgnoreRepeatEnabled
{
  return AXSettingsReturnBoolValue(@"TouchAccommodationsIgnoreRepeatEnabledPreference", 0);
}

- (void)setTouchAccommodationsIgnoreRepeatEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"TouchAccommodationsIgnoreRepeatEnabledPreference"];

  [(AXSettings *)self _updateTouchAccommodationsTripleClickSetting];
}

- (double)touchAccommodationsIgnoreRepeatDuration
{
  return AXSettingsReturnDoubleValue(@"TouchAccommodationsIgnoreRepeatDurationPreference", *MEMORY[0x1E4F48550]);
}

- (void)setTouchAccommodationsIgnoreRepeatDuration:(double)a3
{
  if (*MEMORY[0x1E4F48548] < a3) {
    a3 = *MEMORY[0x1E4F48548];
  }
  if (*MEMORY[0x1E4F48550] >= a3) {
    a3 = *MEMORY[0x1E4F48550];
  }
  id v4 = [NSNumber numberWithDouble:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"TouchAccommodationsIgnoreRepeatDurationPreference"];
}

- (int64_t)touchAccommodationsTapActivationMethod
{
  uint64_t v2 = [(AXSettings *)self valueForPreferenceKey:@"TouchAccommodationsTapActivationMethodPreference"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int64_t v3 = [v2 integerValue];
  }
  else {
    int64_t v3 = 0;
  }

  return v3;
}

- (void)setTouchAccommodationsTapActivationMethod:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"TouchAccommodationsTapActivationMethodPreference"];

  [(AXSettings *)self _updateTouchAccommodationsTripleClickSetting];
}

- (double)touchAccommodationsTapActivationTimeout
{
  return AXSettingsReturnDoubleValue(@"TouchAccommodationsTapActivationTimeOutPreference", *MEMORY[0x1E4F48570]);
}

- (void)setTouchAccommodationsTapActivationTimeout:(double)a3
{
  if (*MEMORY[0x1E4F48568] < a3) {
    a3 = *MEMORY[0x1E4F48568];
  }
  if (*MEMORY[0x1E4F48570] >= a3) {
    a3 = *MEMORY[0x1E4F48570];
  }
  id v4 = [NSNumber numberWithDouble:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"TouchAccommodationsTapActivationTimeOutPreference"];
}

- (BOOL)stickyKeysEnabled
{
  return AXSettingsReturnBoolValue(@"StickyKeysEnabled", 0);
}

- (void)setStickyKeysEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"StickyKeysEnabled"];
}

- (BOOL)stickyKeysShiftToggleEnabled
{
  return AXSettingsReturnBoolValue(@"StickyKeysShiftToggleEnabled", 0);
}

- (void)setStickyKeysShiftToggleEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"StickyKeysShiftToggleEnabled"];
}

- (BOOL)stickyKeysBeepEnabled
{
  return AXSettingsReturnBoolValue(@"StickyKeysBeepEnabled", 1);
}

- (void)setStickyKeysBeepEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"StickyKeysBeepEnabled"];
}

- (void)setMagnifierEnabled:(BOOL)a3 changeTripleClickMenu:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  -[AXSettings setMagnifierEnabled:](self, "setMagnifierEnabled:");
  if (v4)
  {
    if (v5) {
      _AXSTripleClickAddOption();
    }
    else {
      _AXSTripleClickRemoveOption();
    }
  }
  char v6 = (const void *)[NSNumber numberWithBool:v5];
  uint64_t v7 = (CFStringRef *)MEMORY[0x1E4FB8FC0];
  CFStringRef v8 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
  CFStringRef v9 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
  CFPreferencesSetValue(@"SBIconVisibility", v6, (CFStringRef)*MEMORY[0x1E4FB8FC0], (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  CFPreferencesSynchronize(*v7, v8, v9);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.springboard.appIconVisibilityPreferencesChanged", 0, 0, 1u);
}

- (NSData)fullKeyboardAccessCommandMapData
{
  uint64_t v2 = [(AXSettings *)self valueForPreferenceKey:@"CommandMapData"];
  if (v2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v3 = v2;
      goto LABEL_8;
    }
    BOOL v4 = FKALogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      [(AXSettings *)v4 fullKeyboardAccessCommandMapData];
    }
  }
  id v3 = 0;
LABEL_8:

  return (NSData *)v3;
}

- (void)setFullKeyboardAccessCommandMapData:(id)a3
{
}

- (double)fullKeyboardAccessFocusRingTimeout
{
  return AXSettingsReturnDoubleValue(@"FocusRingTimeout", *MEMORY[0x1E4F484F0]);
}

- (void)setFullKeyboardAccessFocusRingTimeout:(double)a3
{
  if (*MEMORY[0x1E4F48500] >= a3) {
    a3 = *MEMORY[0x1E4F48500];
  }
  if (*MEMORY[0x1E4F484F8] < a3) {
    a3 = *MEMORY[0x1E4F484F8];
  }
  id v4 = [NSNumber numberWithDouble:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"FocusRingTimeout"];
}

- (BOOL)fullKeyboardAccessFocusRingTimeoutEnabled
{
  return AXSettingsReturnBoolValue(@"FocusRingTimeoutEnabled", 1);
}

- (void)setFullKeyboardAccessFocusRingTimeoutEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"FocusRingTimeoutEnabled"];
}

- (BOOL)fullKeyboardAccessLargeFocusRingEnabled
{
  return AXSettingsReturnBoolValue(@"FullKeyboardAccessLargeFocusRingEnabled", 0);
}

- (void)setFullKeyboardAccessLargeFocusRingEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"FullKeyboardAccessLargeFocusRingEnabled"];
}

- (BOOL)fullKeyboardAccessFocusRingHighContrastEnabled
{
  return AXSettingsReturnBoolValue(@"FullKeyboardAccessFocusRingHighContrastEnabled", 0);
}

- (void)setFullKeyboardAccessFocusRingHighContrastEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"FullKeyboardAccessFocusRingHighContrastEnabled"];
}

- (void)setFullKeyboardAccessFocusRingColor:(int64_t)a3
{
  if ((unint64_t)a3 > 7) {
    a3 = 0;
  }
  id v4 = [NSNumber numberWithInteger:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"FullKeyboardAccessFocusRingColor"];
}

- (int64_t)fullKeyboardAccessFocusRingColor
{
  return AXSettingsReturnIntegerValue(@"FullKeyboardAccessFocusRingColor", 0);
}

- (BOOL)fullKeyboardAccessShouldShowTextEditingModeInstructions
{
  return AXSettingsReturnBoolValue(@"ShouldShowTextEditingModeInstructions", 1);
}

- (void)setFullKeyboardAccessShouldShowTextEditingModeInstructions:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"ShouldShowTextEditingModeInstructions"];
}

- (BOOL)fullKeyboardAccessShouldShowDebugKeyCommandsView
{
  return AXSettingsReturnBoolValue(@"FullKeyboardAccessShouldShowDebugKeyCommandsViewPreference", 0);
}

- (void)setFullKeyboardAccessShouldShowDebugKeyCommandsView:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"FullKeyboardAccessShouldShowDebugKeyCommandsViewPreference"];
}

- (BOOL)appValidationTestingMode
{
  return AXSettingsReturnBoolValue(@"AXSAppValidatingTestingPreference", 0);
}

- (void)setAppValidationTestingMode:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AXSAppValidatingTestingPreference"];
}

- (BOOL)isAXValidationRunnerCollectingValidations
{
  return AXSettingsReturnBoolValue(@"IsAXValidationRunnerCollectingValidations", 0);
}

- (void)setIsAXValidationRunnerCollectingValidations:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"IsAXValidationRunnerCollectingValidations"];
}

- (BOOL)gizmoApplicationAccessibilityEnabled
{
  return AXSettingsReturnBoolValue(@"GizmoApplicationAccessibilityEnabled", 1);
}

- (void)setGizmoApplicationAccessibilityEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"GizmoApplicationAccessibilityEnabled"];
}

- (void)gizmoSetAutoSpeakEnabledForComplication:(id)a3 slot:(id)a4 face:(id)a5 toggle:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  CFAllocatorRef v13 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  id v14 = [(AXSettings *)self gizmoGetWatchFaceAutoSpeakPreferences];
  DeepCopCGFloat y = (void *)CFPropertyListCreateDeepCopy(v13, v14, 1uLL);

  uint64_t v16 = [DeepCopy objectForKeyedSubscript:v10];

  if (!v16)
  {
    id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [DeepCopy setObject:v17 forKeyedSubscript:v10];
  }
  long long v18 = [DeepCopy objectForKeyedSubscript:v10];
  id v19 = [v18 objectForKeyedSubscript:v11];

  if (!v19)
  {
    id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v21 = [DeepCopy objectForKeyedSubscript:v10];
    [v21 setObject:v20 forKeyedSubscript:v11];
  }
  unint64_t v22 = [DeepCopy objectForKeyedSubscript:v10];
  uint64_t v23 = [v22 objectForKeyedSubscript:v11];

  if (v6) {
    [v23 addObject:v12];
  }
  else {
    [v23 removeObject:v12];
  }
  double v24 = AXLogCommon();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    double v25 = [NSNumber numberWithBool:v6];
    int v26 = 138412802;
    uint64_t v27 = v25;
    __int16 v28 = 2112;
    id v29 = v11;
    __int16 v30 = 2112;
    id v31 = v12;
    _os_log_impl(&dword_18D308000, v24, OS_LOG_TYPE_DEFAULT, "set auto speak value: %@, slot: %@, face: %@", (uint8_t *)&v26, 0x20u);
  }
  [(AXBaseSettings *)self setValue:DeepCopy forPreferenceKey:@"GizmoAutoSpeakComplicationsPreference"];
}

- (BOOL)gizmoGetAutoSpeakEnabledForComplication:(id)a3 slot:(id)a4 face:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(AXSettings *)self gizmoGetWatchFaceAutoSpeakPreferences];
  id v12 = [v11 objectForKeyedSubscript:v10];

  CFAllocatorRef v13 = [v12 objectForKeyedSubscript:v9];

  LOBYTE(v9) = [v13 containsObject:v8];
  return (char)v9;
}

- (id)gizmoGetWatchFaceAutoSpeakPreferences
{
  uint64_t v2 = objc_opt_class();
  id v3 = (void *)MEMORY[0x1E4F1CC08];

  return AXSettingsReturnObjectValueWithClass(@"GizmoAutoSpeakComplicationsPreference", v3, v2);
}

- (int64_t)voiceOverSpeakSecondsEncoding
{
  return AXSettingsReturnIntegerValue(@"VoiceOverSpeakSecondsEncoding", 1);
}

- (void)setVoiceOverSpeakSecondsEncoding:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"VoiceOverSpeakSecondsEncoding"];
}

- (void)setVoiceOverDirectTouchEnabledApps:(id)a3
{
}

- (NSDictionary)voiceOverDirectTouchEnabledApps
{
  uint64_t v2 = objc_opt_class();

  return (NSDictionary *)AXSettingsReturnObjectValueWithClass(@"AXSVoiceOverDirectTouchEnabledApps", 0, v2);
}

- (void)setImageCaptioningDisabledApps:(id)a3
{
}

- (NSArray)imageCaptioningDisabledApps
{
  uint64_t v2 = objc_opt_class();

  return (NSArray *)AXSettingsReturnObjectValueWithClass(@"AXSImageCaptioningDisabledApps", 0, v2);
}

- (void)setRemoteHandGestureCustomizedActions:(id)a3
{
}

- (NSDictionary)remoteHandGestureCustomizedActions
{
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionary];
  uint64_t v3 = objc_opt_class();
  id v4 = AXSettingsReturnObjectValueWithClass(@"RemoteHandGestureCustomizedActions", v2, v3);

  return (NSDictionary *)v4;
}

- (void)setImageCaptionGenderStrategy:(unint64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AXSImageCaptionGenderStrategy"];
}

- (unint64_t)imageCaptionGenderStrategy
{
  return 0;
}

- (int64_t)voiceOverNavigationStyle
{
  return AXSettingsReturnIntegerValue(@"AXSVoiceOverNavigationStyle", 0);
}

- (void)setVoiceOverNavigationStyle:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AXSVoiceOverNavigationStyle"];
}

- (BOOL)voiceOverHandGesturesEnabled
{
  int v2 = _os_feature_enabled_impl();
  if (v2)
  {
    LOBYTE(v2) = AXSettingsReturnBoolValue(@"VoiceOverWatchHandGestures", 0);
  }
  return v2;
}

- (void)setVoiceOverHandGesturesEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if (_os_feature_enabled_impl())
  {
    id v5 = [NSNumber numberWithBool:v3];
    [(AXBaseSettings *)self setValue:v5 forPreferenceKey:@"VoiceOverWatchHandGestures"];
  }
}

- (NSDictionary)voiceOverHandGesturesActionCustomizations
{
  if (_os_feature_enabled_impl() && VoiceOverServicesLibraryCore())
  {
    BOOL v3 = [(AXSettings *)self valueForPreferenceKey:@"VoiceOverWatchHandGesturesActionCustomizations"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || (id v4 = (void *)MEMORY[0x1E4F28DC0],
          uint64_t v5 = objc_opt_class(),
          [v4 unarchivedDictionaryWithKeysOfClass:v5 objectsOfClass:objc_opt_class() fromData:v3 error:0], (BOOL v6 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      uint64_t v11 = 0;
      id v12 = &v11;
      uint64_t v13 = 0x2050000000;
      uint64_t v7 = (void *)getVOSVoiceOverGreyCommandInfoClass_softClass;
      uint64_t v14 = getVOSVoiceOverGreyCommandInfoClass_softClass;
      if (!getVOSVoiceOverGreyCommandInfoClass_softClass)
      {
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        void v10[2] = __getVOSVoiceOverGreyCommandInfoClass_block_invoke;
        v10[3] = &unk_1E5585E30;
        void v10[4] = &v11;
        __getVOSVoiceOverGreyCommandInfoClass_block_invoke((uint64_t)v10);
        uint64_t v7 = (void *)v12[3];
      }
      id v8 = v7;
      _Block_object_dispose(&v11, 8);
      BOOL v6 = [v8 defaultCustomizeGestures];
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return (NSDictionary *)v6;
}

- (void)setVoiceOverHandGesturesActionCustomizations:(id)a3
{
  id v5 = a3;
  if (_os_feature_enabled_impl())
  {
    id v4 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v5 requiringSecureCoding:1 error:0];
    [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"VoiceOverWatchHandGesturesActionCustomizations"];
  }
}

- (BOOL)zoomHandGesturesEnabled
{
  int v2 = _os_feature_enabled_impl();
  if (v2)
  {
    LOBYTE(v2) = AXSettingsReturnBoolValue(@"ZoomWatchHandGestures", 0);
  }
  return v2;
}

- (void)setZoomHandGesturesEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if (_os_feature_enabled_impl())
  {
    id v5 = [NSNumber numberWithBool:v3];
    [(AXBaseSettings *)self setValue:v5 forPreferenceKey:@"ZoomWatchHandGestures"];
  }
}

- (NSDictionary)zoomHandGesturesActionCustomizations
{
  if (_os_feature_enabled_impl() && operator||())
  {
    BOOL v3 = [(AXSettings *)self valueForPreferenceKey:@"ZoomWatchHandGesturesActionCustomizations"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || (id v4 = (void *)MEMORY[0x1E4F28DC0],
          uint64_t v5 = objc_opt_class(),
          [v4 unarchivedDictionaryWithKeysOfClass:v5 objectsOfClass:objc_opt_class() fromData:v3 error:0], (BOOL v6 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      uint64_t v11 = 0;
      id v12 = &v11;
      uint64_t v13 = 0x2050000000;
      uint64_t v7 = (void *)getZoomServicesGreyCommandInfoClass_softClass;
      uint64_t v14 = getZoomServicesGreyCommandInfoClass_softClass;
      if (!getZoomServicesGreyCommandInfoClass_softClass)
      {
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        void v10[2] = __getZoomServicesGreyCommandInfoClass_block_invoke;
        v10[3] = &unk_1E5585E30;
        void v10[4] = &v11;
        __getZoomServicesGreyCommandInfoClass_block_invoke((uint64_t)v10);
        uint64_t v7 = (void *)v12[3];
      }
      id v8 = v7;
      _Block_object_dispose(&v11, 8);
      BOOL v6 = [v8 defaultCustomizeGestures];
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return (NSDictionary *)v6;
}

- (void)setZoomHandGesturesActionCustomizations:(id)a3
{
  id v5 = a3;
  if (_os_feature_enabled_impl())
  {
    id v4 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v5 requiringSecureCoding:1 error:0];
    [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"ZoomWatchHandGesturesActionCustomizations"];
  }
}

- (BOOL)voiceOverSoundCurtain
{
  return AXSettingsReturnBoolValue(@"AXSVoiceOverSoundCurtain", 0);
}

- (void)setVoiceOverSoundCurtain:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AXSVoiceOverSoundCurtain"];
}

- (BOOL)voiceOverSceneDescriptionsEnabled
{
  return AXSettingsReturnBoolValue(@"AXSSceneDescriptions", 1);
}

- (void)setVoiceOverSceneDescriptionsEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AXSSceneDescriptions"];
}

- (NSURL)alexLocalAssetURL
{
  int v2 = [(AXSettings *)self valueForPreferenceKey:@"AXSAlexLocalAssetURL"];
  if (v2)
  {
    BOOL v3 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v2];
  }
  else
  {
    BOOL v3 = 0;
  }

  return (NSURL *)v3;
}

- (void)setAlexLocalAssetURL:(id)a3
{
  id v4 = [a3 path];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AXSAlexLocalAssetURL"];
}

- (BOOL)localizationQACaptionShowFilePath
{
  return AXSettingsReturnBoolValue(@"LocCaptionShowFilePath", 1);
}

- (void)setLocalizationQACaptionShowFilePath:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"LocCaptionShowFilePath"];
}

- (BOOL)localizationQACaptionShowUSString
{
  return AXSettingsReturnBoolValue(@"LocCaptionShowUSString", 1);
}

- (void)setLocalizationQACaptionShowUSString:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"LocCaptionShowUSString"];
}

- (BOOL)localizationQACaptionShowLocalizedString
{
  return AXSettingsReturnBoolValue(@"LocCaptionShowLocalizedString", 1);
}

- (void)setLocalizationQACaptionShowLocalizedString:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"LocCaptionShowLocalizedString"];
}

- (BOOL)localizationQACaptionMode
{
  return _AXSLocalizationCaptionMode() != 0;
}

- (void)setLocalizationQACaptionMode:(BOOL)a3
{
}

- (BOOL)shouldFlashWhileUnlocked
{
  return AXSettingsReturnBoolValue(@"LEDFlashWhileUnlocked", 0);
}

- (void)setShouldFlashWhileUnlocked:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"LEDFlashWhileUnlocked"];
}

- (BOOL)shouldFlashForAlertInSilentMode
{
  return AXSettingsReturnBoolValue(@"LEDFlashOnRingerSwitchSilent", 1);
}

- (void)setShouldFlashForAlertInSilentMode:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"LEDFlashOnRingerSwitchSilent"];
}

- (BOOL)shouldSpeakMedicalPreamble
{
  return AXSettingsReturnBoolValue(@"SpeakMedicalPreamble", 0);
}

- (void)setShouldSpeakMedicalPreamble:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"SpeakMedicalPreamble"];
}

- (BOOL)shouldTTYMedicalPreamble
{
  return AXSettingsReturnBoolValue(@"TTYMedicalPreamble", 0);
}

- (void)setShouldTTYMedicalPreamble:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"TTYMedicalPreamble"];
}

- (NSString)medicalPreamble
{
  return (NSString *)[(AXSettings *)self valueForPreferenceKey:@"SOSMedicalPreamble"];
}

- (void)setMedicalPreamble:(id)a3
{
}

- (BOOL)shouldLimitDisplayRefreshRate
{
  return AXSettingsReturnBoolValue(@"LimitDisplayRefreshRate", 0);
}

- (void)setShouldLimitDisplayRefreshRate:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"LimitDisplayRefreshRate"];
}

- (double)lastMagnifierResetCount
{
  return AXSettingsReturnDoubleValue(@"lastMagnifierResetCount", 0.0);
}

- (void)setLastMagnifierResetCount:(double)a3
{
  id v4 = [NSNumber numberWithDouble:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"lastMagnifierResetCount"];
}

- (double)lastSmartInvertColorsEnablement
{
  return AXSettingsReturnDoubleValue(@"AXSLastSmartInvertColorsEnablement", 0.0);
}

- (void)setLastSmartInvertColorsEnablement:(double)a3
{
  id v4 = [NSNumber numberWithDouble:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AXSLastSmartInvertColorsEnablement"];
}

- (double)lastHearingAidHandoffTimeResetCount
{
  return AXSettingsReturnDoubleValue(@"lastHearingAidHandoffTimeResetCount", 0.0);
}

- (void)setlastHearingAidHandoffTimeResetCount:(double)a3
{
  id v4 = [NSNumber numberWithDouble:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"lastHearingAidHandoffTimeResetCount"];
}

- (double)lastHearingAidControlPanelTimeResetCount
{
  return AXSettingsReturnDoubleValue(@"lastHearingAidControlPanelTimeResetCount", 0.0);
}

- (void)setlastHearingAidControlPanelTimeResetCount:(double)a3
{
  id v4 = [NSNumber numberWithDouble:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"lastHearingAidControlPanelTimeResetCount"];
}

- (double)lastBrailleScreenInputTimeResetCount
{
  return AXSettingsReturnDoubleValue(@"lastBrailleScreenInputTimeResetCount", 0.0);
}

- (void)setLastBrailleScreenInputTimeResetCount:(double)a3
{
  id v4 = [NSNumber numberWithDouble:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"lastBrailleScreenInputTimeResetCount"];
}

- (double)lastTapticTimeResetCount
{
  return AXSettingsReturnDoubleValue(@"lastTapticTimeResetCount", 0.0);
}

- (void)setLastTapticTimeResetCount:(double)a3
{
  id v4 = [NSNumber numberWithDouble:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"lastTapticTimeResetCount"];
}

- (double)lastGuidedAccessTimeResetCount
{
  return AXSettingsReturnDoubleValue(@"lastGuidedAccessTimeResetCount", 0.0);
}

- (void)setlastGuidedAccessTimeResetCount:(double)a3
{
  id v4 = [NSNumber numberWithDouble:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"lastGuidedAccessTimeResetCount"];
}

- (double)lastGuidedAccessTimeLimitResetCount
{
  return AXSettingsReturnDoubleValue(@"lastGuidedAccessTimeLimitResetCount", 0.0);
}

- (void)setlastGuidedAccessTimeLimitResetCount:(double)a3
{
  id v4 = [NSNumber numberWithDouble:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"lastGuidedAccessTimeLimitResetCount"];
}

- (double)lastPlatformSwitchTimeResetCount
{
  return AXSettingsReturnDoubleValue(@"lastPlatformSwitchTimeResetCount", 0.0);
}

- (void)setlastPlatformSwitchTimeResetCount:(double)a3
{
  id v4 = [NSNumber numberWithDouble:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"lastPlatformSwitchTimeResetCount"];
}

- (double)lastCharacterVoiceTimeResetCount
{
  return AXSettingsReturnDoubleValue(@"lastCharacterVoiceTimeResetCount", 0.0);
}

- (void)setLastCharacterVoiceTimeResetCount:(double)a3
{
  id v4 = [NSNumber numberWithDouble:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"lastCharacterVoiceTimeResetCount"];
}

- (double)lastAssistiveTouchTimeResetCount
{
  return AXSettingsReturnDoubleValue(@"lastAssistiveTouchTimeResetCount", 0.0);
}

- (void)setLastAssistiveTouchTimeResetCount:(double)a3
{
  id v4 = [NSNumber numberWithDouble:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"lastAssistiveTouchTimeResetCount"];
}

- (NSDictionary)assistiveTouchUsageCount
{
  uint64_t v2 = objc_opt_class();

  return (NSDictionary *)AXSettingsReturnObjectValueWithClass(@"assistiveTouchUsageCount", 0, v2);
}

- (void)setAssistiveTouchUsageCount:(id)a3
{
}

- (int64_t)magnifierUsageCount
{
  return AXSettingsReturnIntegerValue(@"magnifierUsageCount", 0);
}

- (void)setMagnifierUsageCount:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"magnifierUsageCount"];
}

- (int64_t)tapticTimeUsageCount
{
  return AXSettingsReturnIntegerValue(@"tapticTimeUsageCount", 0);
}

- (void)setTapticTimeUsageCount:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"tapticTimeUsageCount"];
}

- (int64_t)switchControlPlatformSwitchedCount
{
  return AXSettingsReturnIntegerValue(@"switchControlPlatformSwitchedCount", 0);
}

- (void)setSwitchControlPlatformSwitchedCount:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"switchControlPlatformSwitchedCount"];
}

- (int64_t)hearingAidHandOffCount
{
  return AXSettingsReturnIntegerValue(@"hearingAidHandOffCount", 0);
}

- (void)setHearingAidHandOffCount:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"hearingAidHandOffCount"];
}

- (int64_t)hearingAidControlPanelCount
{
  return AXSettingsReturnIntegerValue(@"hearingAidControlPanelCount", 0);
}

- (void)setHearingAidControlPanelCount:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"hearingAidControlPanelCount"];
}

- (int64_t)characterVoicesUsageCount
{
  return AXSettingsReturnIntegerValue(@"characterVoicesUsageCount", 0);
}

- (void)setCharacterVoicesUsageCount:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"characterVoicesUsageCount"];
}

- (int64_t)guidedAccessTimeLimitsUsageCount
{
  return AXSettingsReturnIntegerValue(@"guidedAccessTimeLimitsUsageCount", 0);
}

- (void)setGuidedAccessTimeLimitsUsageCount:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"guidedAccessTimeLimitsUsageCount"];
}

- (int64_t)brokenHomeButtonCount
{
  return AXSettingsReturnIntegerValue(@"brokenHomeButtonCount", 0);
}

- (void)setBrokenHomeButtonCount:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"brokenHomeButtonCount"];
}

- (int64_t)voiceOverBSIUsageCount
{
  return AXSettingsReturnIntegerValue(@"voiceOverBSIUsageCount", 0);
}

- (void)setVoiceOverBSIUsageCount:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"voiceOverBSIUsageCount"];
}

- (void)setGuidedAccessUsageCount:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"GuidedAccessUsageCount"];
}

- (int64_t)guidedAccessUsageCount
{
  uint64_t v2 = [(AXSettings *)self valueForPreferenceKey:@"GuidedAccessUsageCount"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int64_t v3 = [v2 integerValue];
  }
  else {
    int64_t v3 = 0;
  }

  return v3;
}

- (BOOL)didResetD22Preferences
{
  return AXSettingsReturnBoolValue(@"AXSDidResetD22Preferences", 0);
}

- (void)setDidResetD22Preferences:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AXSDidResetD22Preferences"];
}

- (BOOL)reachabilityEnabled
{
  uint64_t v5 = 0;
  BOOL v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v2 = (uint64_t (*)(void))getSBSIsReachabilityEnabledSymbolLoc_ptr;
  id v8 = getSBSIsReachabilityEnabledSymbolLoc_ptr;
  if (!getSBSIsReachabilityEnabledSymbolLoc_ptr)
  {
    int64_t v3 = (void *)SpringBoardServicesLibrary();
    v6[3] = (uint64_t)dlsym(v3, "SBSIsReachabilityEnabled");
    getSBSIsReachabilityEnabledSymbolLoc_ptr = (_UNKNOWN *)v6[3];
    uint64_t v2 = (uint64_t (*)(void))v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v2) {
    -[AXSettings reachabilityEnabled]();
  }
  return v2();
}

- (void)setReachabilityEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  id v4 = (void (*)(BOOL))getSBSSetReachabilityEnabledSymbolLoc_ptr;
  id v9 = getSBSSetReachabilityEnabledSymbolLoc_ptr;
  if (!getSBSSetReachabilityEnabledSymbolLoc_ptr)
  {
    uint64_t v5 = (void *)SpringBoardServicesLibrary();
    v7[3] = (uint64_t)dlsym(v5, "SBSSetReachabilityEnabled");
    getSBSSetReachabilityEnabledSymbolLoc_ptr = (_UNKNOWN *)v7[3];
    id v4 = (void (*)(BOOL))v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (!v4) {
    -[AXSettings setReachabilityEnabled:]();
  }
  v4(v3);
}

- (void)setPerAppSettingsCustomizedAppIDs:(id)a3
{
}

- (NSArray)perAppSettingsCustomizedAppIDs
{
  uint64_t v2 = objc_opt_class();

  return (NSArray *)AXSettingsReturnObjectValueWithClass(@"AXSPerAppSettingsCustomizedAppIDs", 0, v2);
}

- (void)setPerAppSettingsStats:(id)a3
{
}

- (NSDictionary)perAppSettingsStats
{
  uint64_t v2 = objc_opt_class();

  return (NSDictionary *)AXSettingsReturnObjectValueWithClass(@"AXSPerAppSettingsStats", 0, v2);
}

- (id)_customizedAppIDs
{
  uint64_t v2 = (void *)CFPreferencesCopyAppValue(@"AXSettingsPerAppIDsArray", (CFStringRef)*MEMORY[0x1E4F482C8]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (BOOL v3 = (void *)[v2 mutableCopy]) == 0) {
    BOOL v3 = objc_opt_new();
  }

  return v3;
}

- (void)addCustomizedAppID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    uint64_t v5 = [(AXSettings *)self _customizedAppIDs];
    if (([v5 containsObject:v6] & 1) == 0) {
      [v5 addObject:v6];
    }
    CFPreferencesSetValue(@"AXSettingsPerAppIDsArray", v5, (CFStringRef)*MEMORY[0x1E4F482C8], (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);

    id v4 = v6;
  }
}

- (void)removeCustomizedAppID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v8 = v4;
    BOOL v5 = _AXSEnhanceTextLegibilityEnabledApp() == -1;
    id v4 = v8;
    if (v5)
    {
      BOOL v5 = _AXSButtonShapesEnabledApp() == -1;
      id v4 = v8;
      if (v5)
      {
        BOOL v5 = _AXSIncreaseButtonLegibilityApp() == -1;
        id v4 = v8;
        if (v5)
        {
          BOOL v5 = _AXSEnhanceBackgroundContrastEnabledApp() == -1;
          id v4 = v8;
          if (v5)
          {
            BOOL v5 = _AXDarkenSystemColorsApp() == -1;
            id v4 = v8;
            if (v5)
            {
              BOOL v5 = _AXSDifferentiateWithoutColorEnabledApp() == -1;
              id v4 = v8;
              if (v5)
              {
                BOOL v5 = _AXSInvertColorsEnabledApp() == -1;
                id v4 = v8;
                if (v5)
                {
                  BOOL v5 = _AXSReduceMotionEnabledApp() == -1;
                  id v4 = v8;
                  if (v5)
                  {
                    BOOL v5 = _AXSReduceMotionReduceSlideTransitionsEnabledApp() == -1;
                    id v4 = v8;
                    if (v5)
                    {
                      id v6 = (const void *)_AXSCopyPreferredContentSizeCategoryNameApp();
                      if (v6)
                      {
                        CFRelease(v6);
                      }
                      else
                      {
                        uint64_t v7 = [(AXSettings *)self _customizedAppIDs];
                        [v7 removeObject:v8];
                        CFPreferencesSetValue(@"AXSettingsPerAppIDsArray", v7, (CFStringRef)*MEMORY[0x1E4F482C8], (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
                      }
                      id v4 = v8;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

- (void)aggregatePerAppSettingsStatistics
{
  uint64_t v2 = PerAppSettingsQueue;
  if (!PerAppSettingsQueue)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.accessibility.axsharedsettings.perappsettings", 0);
    id v4 = (void *)PerAppSettingsQueue;
    PerAppSettingsQueue = (uint64_t)v3;

    uint64_t v2 = PerAppSettingsQueue;
  }

  dispatch_async(v2, &__block_literal_global_2025);
}

void __47__AXSettings_aggregatePerAppSettingsStatistics__block_invoke()
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v0 = AXInstalledAppIDs();
  v1 = objc_opt_new();
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v2 = v0;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v25;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v25 != v5) {
          objc_enumerationMutation(v2);
        }
        int v7 = _AXSEnhanceTextLegibilityEnabledApp();
        BOOL v8 = v7 != -1;
        if (v7 != -1) {
          [v1 addObject:@"com.apple.accessibility.perappsettings.bold.text"];
        }
        if (_AXSButtonShapesEnabledApp() != -1)
        {
          [v1 addObject:@"com.apple.accessibility.perappsettings.button.shapes"];
          BOOL v8 = 1;
        }
        if (_AXSIncreaseButtonLegibilityApp() != -1)
        {
          [v1 addObject:@"com.apple.accessibility.perappsettings.onoff.labels"];
          BOOL v8 = 1;
        }
        if (_AXSEnhanceBackgroundContrastEnabledApp() != -1)
        {
          [v1 addObject:@"com.apple.accessibility.perappsettings.reduce.transparency"];
          BOOL v8 = 1;
        }
        if (_AXDarkenSystemColorsApp() != -1)
        {
          [v1 addObject:@"com.apple.accessibility.perappsettings.increase.contrast"];
          BOOL v8 = 1;
        }
        if (_AXSDifferentiateWithoutColorEnabledApp() != -1)
        {
          [v1 addObject:@"com.apple.accessibility.perappsettings.differentiate.without.color"];
          BOOL v8 = 1;
        }
        if (_AXSInvertColorsEnabledApp() != -1)
        {
          [v1 addObject:@"com.apple.accessibility.perappsettings.smart.invert"];
          BOOL v8 = 1;
        }
        if (_AXSReduceMotionEnabledApp() != -1)
        {
          [v1 addObject:@"com.apple.accessibility.perappsettings.reduce.motion"];
          BOOL v8 = 1;
        }
        if (_AXSReduceMotionReduceSlideTransitionsEnabledApp() != -1)
        {
          [v1 addObject:@"com.apple.accessibility.perappsettings.prefer.crossfade.transitions"];
          id v9 = (const void *)_AXSCopyPreferredContentSizeCategoryNameApp();
          if (v9)
          {
LABEL_26:
            CFRelease(v9);
            [v1 addObject:@"com.apple.accessibility.perappsettings.textsize"];
          }
LABEL_27:
          [v1 addObject:@"com.apple.accessibility.perappsettings.customized"];
          goto LABEL_28;
        }
        id v9 = (const void *)_AXSCopyPreferredContentSizeCategoryNameApp();
        if (v9) {
          goto LABEL_26;
        }
        if (v8) {
          goto LABEL_27;
        }
LABEL_28:
        ++v6;
      }
      while (v4 != v6);
      uint64_t v10 = [v2 countByEnumeratingWithState:&v24 objects:v29 count:16];
      uint64_t v4 = v10;
    }
    while (v10);
  }

  uint64_t v11 = objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v12 = v1;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        long long v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v12, "countForObject:", v17, (void)v20));
        [v11 setObject:v18 forKey:v17];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v14);
  }

  id v19 = +[AXSettings sharedInstance];
  [v19 setPerAppSettingsStats:v11];
}

- (void)setCallAudioRoutingAutoAnswerDelay:(double)a3
{
  if (*MEMORY[0x1E4F484C8] < a3) {
    a3 = *MEMORY[0x1E4F484C8];
  }
  if (*MEMORY[0x1E4F484D0] >= a3) {
    a3 = *MEMORY[0x1E4F484D0];
  }
  id v4 = [NSNumber numberWithDouble:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"CallAudioRoutingAutoAnswerPreference"];
}

- (double)callAudioRoutingAutoAnswerDelay
{
  double result = AXSettingsReturnDoubleValue(@"CallAudioRoutingAutoAnswerPreference", 3.0);
  if (*MEMORY[0x1E4F484C8] < result) {
    double result = *MEMORY[0x1E4F484C8];
  }
  if (*MEMORY[0x1E4F484D0] >= result) {
    return *MEMORY[0x1E4F484D0];
  }
  return result;
}

- (void)setCallAudioRoutingAutoAnswerEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"CallAudioRoutingAutoAnswerEnabledPreference"];
}

- (BOOL)callAudioRoutingAutoAnswerEnabled
{
  return AXSettingsReturnBoolValue(@"CallAudioRoutingAutoAnswerEnabledPreference", 0);
}

- (void)setVoiceOverSleepOnWristDownPreference:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"VoiceOverSleepOnWristDownPreference"];
}

- (BOOL)voiceOverSleepOnWristDownPreference
{
  return AXSettingsReturnBoolValue(@"VoiceOverSleepOnWristDownPreference", 1);
}

- (void)setAssistiveTouchSleepOnWristDownPreference:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AssistiveTouchSleepOnWristDownPreference"];
}

- (BOOL)assistiveTouchSleepOnWristDownPreference
{
  return AXSettingsReturnBoolValue(@"AssistiveTouchSleepOnWristDownPreference", 1);
}

- (BOOL)backTapEnabled
{
  return _AXSBackTapEnabled() != 0;
}

- (void)setBackTapEnabled:(BOOL)a3
{
}

- (void)setBackTapUsageCount:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AXSBackTapUsageCount"];
}

- (int64_t)backTapUsageCount
{
  id v2 = [(AXSettings *)self valueForPreferenceKey:@"AXSBackTapUsageCount"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (void)setBackTapDoubleTapAction:(id)a3
{
}

- (NSString)backTapDoubleTapAction
{
  id v2 = [(AXSettings *)self valueForPreferenceKey:@"AXSBackTapDoubleTapAction"];
  if ([v2 isEqualToString:@"__NONE__"]) {
    id v3 = 0;
  }
  else {
    id v3 = v2;
  }

  return (NSString *)v3;
}

- (void)setBackTapTripleTapAction:(id)a3
{
}

- (NSString)backTapTripleTapAction
{
  id v2 = [(AXSettings *)self valueForPreferenceKey:@"AXSBackTapTripleTapAction"];
  if ([v2 isEqualToString:@"__NONE__"]) {
    id v3 = 0;
  }
  else {
    id v3 = v2;
  }

  return (NSString *)v3;
}

- (BOOL)backTapFalsePositiveAlertsEnabled
{
  int v3 = AXIsInternalInstall();
  if (v3)
  {
    id v4 = [(AXSettings *)self valueForPreferenceKey:@"AXSBackTapFalsePositiveAlertsEnabled"];
    char v5 = [v4 BOOLValue];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (void)setBackTapFalsePositiveAlertsEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AXSBackTapFalsePositiveAlertsEnabled"];
}

- (BOOL)backTapRNNModelEnabled
{
  if (!AXIsInternalInstall() || !_os_feature_enabled_impl()) {
    return 0;
  }
  int v3 = [(AXSettings *)self valueForPreferenceKey:@"AXSBackTapRNNModelEnabled"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (void)setBackTapRNNModelEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AXSBackTapRNNModelEnabled"];
}

- (NSDictionary)assistiveTouchActionsBySoundAction
{
  id v2 = [(AXSettings *)self valueForPreferenceKey:@"AXSAssistiveTouchActionBySoundActionsPreference"];
  int v3 = v2;
  if (!v2) {
    id v2 = (void *)MEMORY[0x1E4F1CC08];
  }
  id v4 = v2;

  return v4;
}

- (void)setAssistiveTouchActionsBySoundAction:(id)a3
{
}

- (BOOL)isAdaptiveVoiceShortcutsEnabled
{
  return AXSettingsReturnBoolValue(@"AdaptiveVoiceShortcuts", 0);
}

- (void)setAdaptiveVoiceShortcutsEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AdaptiveVoiceShortcuts"];
}

- (double)audiogramIngestionLastModelAccess
{
  return AXSettingsReturnDoubleValue(@"AXSAudiogramIngestionLastModelAccess", 0.0);
}

- (void)setAudiogramIngestionLastModelAccess:(double)a3
{
  id v4 = [NSNumber numberWithDouble:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AXSAudiogramIngestionLastModelAccess"];
}

- (double)soundActionsLastModelAccess
{
  return AXSettingsReturnDoubleValue(@"AXSSoundActionsLastModelAccess", 0.0);
}

- (void)setSoundActionsLastModelAccess:(double)a3
{
  id v4 = [NSNumber numberWithDouble:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AXSSoundActionsLastModelAccess"];
}

- (double)soundDetectionLastModelAccess
{
  return AXSettingsReturnDoubleValue(@"AXSoundDetectionLastModelAccess", 0.0);
}

- (void)setSoundDetectionLastModelAccess:(double)a3
{
  id v4 = [NSNumber numberWithDouble:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AXSoundDetectionLastModelAccess"];
}

- (double)cameraButtonSensitivity
{
  return AXSettingsReturnDoubleValue(@"CameraButtonSensitivity", 0.0);
}

- (void)setCameraButtonSensitivity:(double)a3
{
  id v4 = [NSNumber numberWithDouble:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"CameraButtonSensitivity"];
}

- (BOOL)startupSoundEnabled
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (AXDeviceSupportsBootSound())
  {
    int v2 = _AXSVoiceOverTouchEnabled();
    uint64_t v3 = AXSettingsReturnBoolValue(@"StartupSoundEnabled", v2 != 0);
    id v4 = AXLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      char v5 = [NSNumber numberWithBool:v3];
      uint64_t v6 = [NSNumber numberWithBool:v2 != 0];
      int v8 = 138543618;
      id v9 = v5;
      __int16 v10 = 2114;
      uint64_t v11 = v6;
      _os_log_impl(&dword_18D308000, v4, OS_LOG_TYPE_INFO, "Boot chime: value: %{public}@ (%{public}@)", (uint8_t *)&v8, 0x16u);
    }
  }
  else
  {
    id v4 = AXLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_18D308000, v4, OS_LOG_TYPE_INFO, "Boot chime: Device does not support bootup sound", (uint8_t *)&v8, 2u);
    }
    LOBYTE(v3) = 0;
  }

  return v3;
}

- (void)setStartupSoundEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"StartupSoundEnabled"];
}

- (BOOL)hapticMusicEnhancedPercussion
{
  return AXSettingsReturnBoolValue(@"AXSHapticMusicEnhancedPercussion", 0);
}

- (void)setHapticMusicEnhancedPercussion:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AXSHapticMusicEnhancedPercussion"];
}

- (NSString)hapticMusicAlgorithmSelection
{
  uint64_t v2 = objc_opt_class();

  return (NSString *)AXSettingsReturnObjectValueWithClass(@"AXSHapticMusicAlgorithmSelection", 0, v2);
}

- (void)setHapticMusicAlgorithmSelection:(id)a3
{
}

- (BOOL)hapticMusicActive
{
  return AXSettingsReturnBoolValue(@"AXSHapticMusicActive", 1);
}

- (void)setHapticMusicActive:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AXSHapticMusicActive"];
}

- (BOOL)hapticMusicTrackAvailable
{
  return AXSettingsReturnBoolValue(@"AXSHapticMusicTrackAvailable", 1);
}

- (void)setHapticMusicTrackAvailable:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AXSHapticMusicTrackAvailable"];
}

- (BOOL)hapticMusicToggledInPreferences
{
  return AXSettingsReturnBoolValue(@"AXSHapticMusicToggledInPreferences", 0);
}

- (void)setHapticMusicToggledInPreferences:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AXSHapticMusicToggledInPreferences"];
}

- (double)hapticMusicUsagePerDay
{
  return AXSettingsReturnDoubleValue(@"AXSHapticMusicUsagePerDay", 0.0);
}

- (void)setHapticMusicUsagePerDay:(double)a3
{
  id v4 = [NSNumber numberWithDouble:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AXSHapticMusicUsagePerDay"];
}

- (NSDate)hapticMusicUsageStartDate
{
  uint64_t v2 = objc_opt_class();

  return (NSDate *)AXSettingsReturnObjectValueWithClass(@"AXSHapticMusicUsageStartDate", 0, v2);
}

- (void)setHapticMusicUsageStartDate:(id)a3
{
}

- (BOOL)hapticMusicEnhancedVocals
{
  return AXSettingsReturnBoolValue(@"AXSHapticMusicEnhancedVocals", 0);
}

- (void)setHapticMusicEnhancedVocals:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AXSHapticMusicEnhancedVocals"];
}

- (void)enableAssistiveTechnologies:(BOOL)a3 usingDefaults:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  id v8 = v5;
  if (v4)
  {
    [v5 BOOLForKey:@"VoiceOverTouchEnabled"];
    _AXSVoiceOverTouchSetEnabled();
    [v8 BOOLForKey:@"SpeakThisEnabled"];
    _AXSSetSpeakThisEnabled();
    [v8 BOOLForKey:@"AssistiveTouchEnabled"];
    _AXSAssistiveTouchSetEnabled();
    [v8 BOOLForKey:@"AssistiveTouchScannerEnabled"];
    _AXSAssistiveTouchScannerSetEnabled();
    [v8 BOOLForKey:@"FullKeyboardAccessEnabled"];
    _AXSFullKeyboardAccessSetEnabled();
    [v8 BOOLForKey:@"CommandAndControlEnabled"];
  }
  else
  {
    _AXSVoiceOverTouchSetEnabled();
    _AXSSetSpeakThisEnabled();
    _AXSAssistiveTouchSetEnabled();
    _AXSAssistiveTouchScannerSetEnabled();
    _AXSFullKeyboardAccessSetEnabled();
  }
  _AXSCommandAndControlSetEnabled();
  uint64_t v6 = +[AXSettings sharedInstance];
  int v7 = v6;
  if (v4)
  {
    objc_msgSend(v6, "setAdaptiveVoiceShortcutsEnabled:", objc_msgSend(v8, "BOOLForKey:", @"AdaptiveVoiceShortcuts"));

    [v8 BOOLForKey:@"PhotosensitiveMitigation"];
    _AXSPhotosensitiveMitigationSetEnabled();
    [v8 BOOLForKey:@"ZoomTouchEnabled"];
    _AXSZoomTouchSetEnabled();
    [v8 BOOLForKey:@"InvertColorsEnabled"];
    _AXSInvertColorsSetEnabled();
    [v8 BOOLForKey:@"AXSClassicInvertColorsPreference"];
    _AXSClassicInvertColorsSetEnabled();
    [v8 BOOLForKey:@"AXSDisplayFiltersPreference"];
    _AXSDisplayFilterColorSetEnabled();
    [v8 BOOLForKey:@"LiveSpeechEnabled"];
  }
  else
  {
    [v6 setAdaptiveVoiceShortcutsEnabled:0];

    _AXSPhotosensitiveMitigationSetEnabled();
    _AXSZoomTouchSetEnabled();
    _AXSInvertColorsSetEnabled();
    _AXSClassicInvertColorsSetEnabled();
    _AXSDisplayFilterColorSetEnabled();
  }
  _AXSLiveSpeechSetEnabled();
}

- (id)_keysToIgnore
{
  return 0;
}

- (id)_allAccessibilityDomains
{
  id v2 = objc_alloc(MEMORY[0x1E4F1C978]);
  uint64_t v3 = objc_msgSend(v2, "initWithObjects:", *MEMORY[0x1E4FB8FD8], *MEMORY[0x1E4FB9338], *MEMORY[0x1E4FB9098], *MEMORY[0x1E4FB9170], *MEMORY[0x1E4FB9380], *MEMORY[0x1E4FB9370], *MEMORY[0x1E4FB93A8], *MEMORY[0x1E4FB9268], *MEMORY[0x1E4FB9320], *MEMORY[0x1E4FB9310], *MEMORY[0x1E4FB9208], *MEMORY[0x1E4FB9198], *MEMORY[0x1E4FB9228], *MEMORY[0x1E4FB92C8], @"com.apple.mediaaccessibility", @"com.apple.ComfortSounds", 0);

  return v3;
}

- (NSDictionary)managedAssetsRepresentation
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(AXSettings *)self _keysToIgnore];
  long long v23 = objc_opt_new();
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  BOOL v4 = [(AXSettings *)self _allAccessibilityDomains];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        __int16 v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:v9];
        uint64_t v11 = [v10 dictionaryRepresentation];
        uint64_t v12 = (void *)[v11 mutableCopy];

        [v12 removeObjectsForKeys:v3];
        if (v12) {
          [v23 setObject:v12 forKeyedSubscript:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v6);
  }

  uint64_t v13 = objc_opt_new();
  uint64_t v14 = (void *)_AXSCopyPreferredContentSizeCategoryNameGlobal();
  [v13 setObject:v14 forKeyedSubscript:@"AXMRContentSizeCategory"];

  [v23 setObject:v13 forKeyedSubscript:@"com.apple.UIKit"];
  uint64_t v15 = objc_opt_new();
  BOOL v16 = _AXSLargeTextUsesExtendedRange() != 0;
  uint64_t v17 = (void *)*MEMORY[0x1E4FB93E0];
  long long v18 = NSNumber;
  id v19 = (id)*MEMORY[0x1E4FB93E8];
  id v20 = v17;
  long long v21 = [v18 numberWithBool:v16];
  [v15 setObject:v21 forKeyedSubscript:v20];

  [v23 setObject:v15 forKeyedSubscript:v19];

  return (NSDictionary *)v23;
}

- (void)resetAllGuestModeDefaults
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(AXSettings *)self _allAccessibilityDomains];
  uint64_t v15 = self;
  BOOL v4 = [(AXSettings *)self _keysToIgnore];
  uint64_t v5 = AXLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    long long v26 = v4;
    _os_log_impl(&dword_18D308000, v5, OS_LOG_TYPE_INFO, "Ignored keys: %@", buf, 0xCu);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = v3;
  uint64_t v6 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(obj);
        }
        __int16 v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:v10];
        uint64_t v12 = [v11 dictionaryRepresentation];
        uint64_t v13 = AXLogCommon();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          long long v26 = v10;
          _os_log_impl(&dword_18D308000, v13, OS_LOG_TYPE_INFO, "Removing defaults for domain %@", buf, 0xCu);
        }

        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __39__AXSettings_resetAllGuestModeDefaults__block_invoke;
        v17[3] = &unk_1E5588460;
        id v18 = v4;
        id v19 = v11;
        id v14 = v11;
        [v12 enumerateKeysAndObjectsUsingBlock:v17];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v7);
  }

  [(AXSettings *)v15 enableAssistiveTechnologies:0 usingDefaults:0];
  AXCatchUserDefaultsInconsistencies();
}

void __39__AXSettings_resetAllGuestModeDefaults__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0) {
    [*(id *)(a1 + 40) removeObjectForKey:v3];
  }
}

- (void)updateWithManagedAssetsRepresentation:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v29 = a3;
  BOOL v4 = [(AXSettings *)self _allAccessibilityDomains];
  __int16 v28 = [(AXSettings *)self _keysToIgnore];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v40;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v40 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v39 + 1) + 8 * v8);
        __int16 v10 = [MEMORY[0x1E4F1CA80] set];
        uint64_t v11 = [v29 objectForKey:v9];
        uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:v9];
        v35[0] = MEMORY[0x1E4F143A8];
        v35[1] = 3221225472;
        v35[2] = __52__AXSettings_updateWithManagedAssetsRepresentation___block_invoke;
        v35[3] = &unk_1E5588488;
        id v13 = v12;
        id v36 = v13;
        int v37 = self;
        id v14 = v10;
        id v38 = v14;
        [v11 enumerateKeysAndObjectsUsingBlock:v35];
        uint64_t v15 = [v13 dictionaryRepresentation];
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __52__AXSettings_updateWithManagedAssetsRepresentation___block_invoke_2;
        v30[3] = &unk_1E55884B0;
        id v31 = v28;
        id v32 = v14;
        id v33 = v13;
        char v34 = self;
        id v16 = v13;
        id v17 = v14;
        [v15 enumerateKeysAndObjectsUsingBlock:v30];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
    }
    while (v6);
  }

  id v18 = objc_alloc(MEMORY[0x1E4F1CB18]);
  id v19 = (void *)[v18 initWithSuiteName:*MEMORY[0x1E4FB8FD8]];
  [(AXSettings *)self enableAssistiveTechnologies:1 usingDefaults:v19];
  long long v20 = [v29 objectForKeyedSubscript:@"com.apple.UIKit"];
  long long v21 = [v20 objectForKeyedSubscript:@"AXMRContentSizeCategory"];
  _AXSSetPreferredContentSizeCategoryName();
  long long v22 = (void *)*MEMORY[0x1E4FB93E8];
  id v23 = (id)*MEMORY[0x1E4FB93E0];
  id v24 = v22;
  long long v25 = [v29 objectForKeyedSubscript:v24];
  long long v26 = [v25 objectForKeyedSubscript:v23];

  _AXSSetLargeTextUsesExtendedRange();
}

void __52__AXSettings_updateWithManagedAssetsRepresentation___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a2;
  [v5 setObject:a3 forKey:v6];
  [*(id *)(a1 + 40) postNotificationForPreferenceKey:v6];
  [*(id *)(a1 + 48) addObject:v6];
}

void __52__AXSettings_updateWithManagedAssetsRepresentation___block_invoke_2(id *a1, void *a2)
{
  id v3 = a2;
  if ((objc_msgSend(a1[4], "containsObject:") & 1) == 0 && (objc_msgSend(a1[5], "containsObject:", v3) & 1) == 0)
  {
    [a1[6] removeObjectForKey:v3];
    [a1[7] postNotificationForPreferenceKey:v3];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  v6.receiver = self;
  v6.super_class = (Class)AXSettings;
  [(AXBaseSettings *)&v6 observeValueForKeyPath:a3 ofObject:a4 change:a5 context:a6];
}

- (BOOL)assistiveTouchOnDeviceEyeTrackingShouldOffsetBufferPoints
{
  return self->_assistiveTouchOnDeviceEyeTrackingShouldOffsetBufferPoints;
}

- (void)setAssistiveTouchOnDeviceEyeTrackingShouldOffsetBufferPoints:(BOOL)a3
{
  self->_assistiveTouchOnDeviceEyeTrackingShouldOffsetBufferPoints = a3;
}

- (void)setAssistiveTouchMotionTrackerShouldOffsetBufferPoints:(BOOL)a3
{
  self->_assistiveTouchMotionTrackerShouldOffsetBufferPoints = a3;
}

- (NSArray)switchControlCombinedTopLevelMenuItems
{
  return self->_switchControlCombinedTopLevelMenuItems;
}

- (void)setSwitchControlCombinedTopLevelMenuItems:(id)a3
{
}

- (int64_t)hoverTextScrollingSpeed
{
  return self->_hoverTextScrollingSpeed;
}

- (void)setHoverTextScrollingSpeed:(int64_t)a3
{
  self->_hoverTextScrollingSpeed = a3;
}

- (NSString)hoverTextContentSize
{
  return self->_hoverTextContentSize;
}

- (void)setHoverTextContentSize:(id)a3
{
}

- (BOOL)hoverTextShowedBanner
{
  return self->_hoverTextShowedBanner;
}

- (void)setHoverTextShowedBanner:(BOOL)a3
{
  self->_hoverTextShowedBanner = a3;
}

- (BOOL)hoverTextTypingShowedBanner
{
  return self->_hoverTextTypingShowedBanner;
}

- (void)setHoverTextTypingShowedBanner:(BOOL)a3
{
  self->_hoverTextTypingShowedBanner = a3;
}

- (BOOL)magnifierEnabled
{
  return self->_magnifierEnabled;
}

- (void)setMagnifierEnabled:(BOOL)a3
{
  self->_magnifierEnabled = a3;
}

- (BOOL)magnifierShouldAdjustFiltersForAmbientLight
{
  return self->_magnifierShouldAdjustFiltersForAmbientLight;
}

- (void)setMagnifierShouldAdjustFiltersForAmbientLight:(BOOL)a3
{
  self->_magnifierShouldAdjustFiltersForAmbientLight = a3;
}

- (BOOL)magnifierShouldUseVideoStabilization
{
  return self->_magnifierShouldUseVideoStabilization;
}

- (void)setMagnifierShouldUseVideoStabilization:(BOOL)a3
{
  self->_magnifierShouldUseVideoStabilization = a3;
}

- (double)magnifierZoomLevel
{
  return self->_magnifierZoomLevel;
}

- (void)setMagnifierZoomLevel:(double)a3
{
  self->_magnifierZoomLevel = a3;
}

- (unint64_t)magnifierFilterSetIdentifier
{
  return self->_magnifierFilterSetIdentifier;
}

- (void)setMagnifierFilterSetIdentifier:(unint64_t)a3
{
  self->_magnifierFilterSetIdentifier = a3;
}

- (BOOL)magnifierFilterInverted
{
  return self->_magnifierFilterInverted;
}

- (void)setMagnifierFilterInverted:(BOOL)a3
{
  self->_magnifierFilterInverted = a3;
}

- (double)magnifierContrast
{
  return self->_magnifierContrast;
}

- (void)setMagnifierContrast:(double)a3
{
  self->_magnifierContrast = a3;
}

- (double)magnifierBrightness
{
  return self->_magnifierBrightness;
}

- (void)setMagnifierBrightness:(double)a3
{
  self->_magnifierBrightness = a3;
}

- (BOOL)assistiveTouchInternalOnlyHiddenNubbitModeEnabled
{
  return self->_assistiveTouchInternalOnlyHiddenNubbitModeEnabled;
}

- (BOOL)writeAXLogsToFile
{
  return self->_writeAXLogsToFile;
}

- (void)setWriteAXLogsToFile:(BOOL)a3
{
  self->_writeAXLogsToFile = a3;
}

- (void)setLiveSpeechMaxRecentsCount:(int64_t)a3
{
  self->_liveSpeechMaxRecentsCFIndex Count = a3;
}

- (float)voiceOverVolume
{
  return self->_voiceOverVolume;
}

- (void)setVoiceOverVolume:(float)a3
{
  self->_voiceOverVolume = a3;
}

- (BOOL)voiceOverVerbositySpeakCustomActionsHint
{
  return self->_voiceOverVerbositySpeakCustomActionsHint;
}

- (void)setVoiceOverVerbositySpeakCustomActionsHint:(BOOL)a3
{
  self->_voiceOverVerbositySpeakCustomActionsHint = a3;
}

- (void)setTouchAccommodationsHoldDurationAllowsSwipeGesturesToBypass:(BOOL)a3
{
  self->_touchAccommodationsHoldDurationAllowsSwipeGesturesToBypass = a3;
}

- (float)reduceWhitePointLevel
{
  return self->_reduceWhitePointLevel;
}

- (void)setReduceWhitePointLevel:(float)a3
{
  self->_reduceWhitePointLevel = a3;
}

- (void)setLastPlatformSwitchTimeResetCount:(double)a3
{
  self->_lastPlatformSwitchTimeResetCFIndex Count = a3;
}

- (void)setLastGuidedAccessTimeLimitResetCount:(double)a3
{
  self->_lastGuidedAccessTimeLimitResetCFIndex Count = a3;
}

- (void)setLastGuidedAccessTimeResetCount:(double)a3
{
  self->_lastGuidedAccessTimeResetCFIndex Count = a3;
}

- (void)setLastHearingAidControlPanelTimeResetCount:(double)a3
{
  self->_lastHearingAidControlPanelTimeResetCFIndex Count = a3;
}

- (void)setLastHearingAidHandoffTimeResetCount:(double)a3
{
  self->_lastHearingAidHandoffTimeResetCFIndex Count = a3;
}

- (BOOL)guestsShouldInheritPrimaryUserPreferences
{
  return self->_guestsShouldInheritPrimaryUserPreferences;
}

- (void)setGuestsShouldInheritPrimaryUserPreferences:(BOOL)a3
{
  self->_guestsShouldInheritPrimaryUserPreferences = a3;
}

- (void)setSwiftSettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swiftSettings, 0);
  objc_storeStrong((id *)&self->_hoverTextContentSize, 0);
  objc_storeStrong((id *)&self->_switchControlCombinedTopLevelMenuItems, 0);
  objc_storeStrong((id *)&self->_unarchivedVoiceCache, 0);

  objc_storeStrong((id *)&self->_migratedSwitchControlMenuItemsPreferenceKeys, 0);
}

- (BOOL)accessibilityEnabled
{
  return _AXSAccessibilityEnabled() != 0;
}

- (BOOL)applicationAccessibilityEnabled
{
  return _AXSApplicationAccessibilityEnabled() != 0;
}

- (void)setApplicationAccessibilityEnabled:(BOOL)a3
{
}

- (NSArray)tripleClickOptions
{
  id v2 = (void *)_AXSTripleClickCopyOptions();

  return (NSArray *)v2;
}

- (void)setTripleClickOptions:(id)a3
{
}

- (BOOL)appleTVRemoteClickpadTapsForDirectionalNavigationEnabled
{
  return _AXSAppleTVRemoteClickpadTapsForDirectionalNavigationEnabled() != 0;
}

- (void)setAppleTVRemoteClickpadTapsForDirectionalNavigationEnabled:(BOOL)a3
{
}

- (BOOL)appleTVScaledUIEnabled
{
  return _AXSAppleTVScaledUIEnabled() != 0;
}

- (void)setAppleTVScaledUIEnabled:(BOOL)a3
{
}

- (unint64_t)appleTVAppGridItemsPerLine
{
  if (_AXSAppleTVScaledUIEnabled()) {
    return 5;
  }
  else {
    return 6;
  }
}

- (BOOL)assistiveTouchEnabled
{
  return _AXSAssistiveTouchEnabled() != 0;
}

- (void)setAssistiveTouchEnabled:(BOOL)a3
{
  _AXSAssistiveTouchSetEnabled();
  if (!a3)
  {
    BOOL v4 = +[AXSettings sharedInstance];
    int v5 = [v4 assistiveTouchEnabledByOnDeviceEyeTracking];

    if (v5)
    {
      id v6 = +[AXSettings sharedInstance];
      [v6 setAssistiveTouchEnabledByOnDeviceEyeTracking:0];
    }
  }
}

- (BOOL)assistiveTouchHardwareEnabled
{
  return _AXSAssistiveTouchHardwareEnabled() != 0;
}

- (void)setAssistiveTouchHardwareEnabled:(BOOL)a3
{
}

- (BOOL)assistiveTouchUIEnabled
{
  return _AXSAssistiveTouchUIEnabled() != 0;
}

- (void)setAssistiveTouchUIEnabled:(BOOL)a3
{
}

- (BOOL)switchControlEnabled
{
  return _AXSAssistiveTouchScannerEnabled() != 0;
}

- (void)setSwitchControlEnabled:(BOOL)a3
{
}

- (BOOL)inspectorEnabled
{
  return _AXSAXInspectorEnabled() != 0;
}

- (void)setInspectorEnabled:(BOOL)a3
{
}

- (BOOL)automationEnabled
{
  return _AXSAutomationEnabled() != 0;
}

- (void)setAutomationEnabled:(BOOL)a3
{
}

- (BOOL)automationLocalizedStringLookupInfoEnabled
{
  return _AXSAutomationLocalizedStringLookupInfoEnabled() != 0;
}

- (void)setAutomationLocalizedStringLookupInfoEnabled:(BOOL)a3
{
}

- (NSString)automationPreferredLocalization
{
  return (NSString *)MEMORY[0x1F4178998](self, a2);
}

- (BOOL)automationFauxCollectionViewCellsEnabled
{
  return _AXSAutomationFauxCollectionViewCellsEnabled() != 0;
}

- (BOOL)automationFauxTableViewCellsEnabled
{
  return _AXSAutomationFauxTableViewCellsEnabled() != 0;
}

- (void)setAutomationFauxCollectionViewCellsEnabled:(BOOL)a3
{
}

- (void)setAutomationFauxTableViewCellsEnabled:(BOOL)a3
{
}

- (BOOL)automationHitpointWarpingEnabled
{
  return _AXSAutomationHitpointWarpingEnabled() != 0;
}

- (void)setAutomationHitpointWarpingEnabled:(BOOL)a3
{
}

- (BOOL)siriSemanticContextEnabled
{
  return _AXSSiriSemanticContextEnabled() != 0;
}

- (void)setSiriSemanticContextEnabled:(BOOL)a3
{
}

- (BOOL)voiceOverEnabled
{
  return _AXSVoiceOverTouchEnabled() != 0;
}

- (void)setVoiceOverEnabled:(BOOL)a3
{
}

- (float)voiceOverSpeakingRate
{
  uint64_t v12 = 0;
  id v13 = (float *)&v12;
  uint64_t v14 = 0x2020000000;
  int v15 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  BOOL v4 = [(AXSettings *)self swiftSettings];
  int v5 = [v4 voiceover];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __63__AXSettings_AccessibilitySupportFacade__voiceOverSpeakingRate__block_invoke;
  v9[3] = &unk_1E5588438;
  uint64_t v11 = &v12;
  id v6 = v3;
  __int16 v10 = v6;
  [v5 effectiveSpeakingRateWithCurrentRotor:0 completionHandler:v9];

  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  float v7 = v13[6];

  _Block_object_dispose(&v12, 8);
  return v7;
}

intptr_t __63__AXSettings_AccessibilitySupportFacade__voiceOverSpeakingRate__block_invoke(uint64_t a1, float a2)
{
  *(float *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)setVoiceOverSpeakingRate:(float)a3
{
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  id v6 = [(AXSettings *)self swiftSettings];
  float v7 = [v6 voiceover];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __67__AXSettings_AccessibilitySupportFacade__setVoiceOverSpeakingRate___block_invoke;
  v10[3] = &unk_1E5585F48;
  dispatch_semaphore_t v11 = v5;
  uint64_t v8 = v5;
  *(float *)&double v9 = a3;
  [v7 setEffectiveSpeakingRateWithCurrentRotor:0 value:v10 completionHandler:v9];

  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __67__AXSettings_AccessibilitySupportFacade__setVoiceOverSpeakingRate___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)voiceOverUsageConfirmed
{
  return _AXSVoiceOverTouchUsageConfirmed() != 0;
}

- (void)setVoiceOverUsageConfirmed:(BOOL)a3
{
}

- (BOOL)voiceOverEnabledThroughAccessory
{
  return _AXSVoiceOverTouchEnabledThroughAccessory() != 0;
}

- (void)setVoiceOverEnabledThroughAccessory:(BOOL)a3
{
}

- (BOOL)voiceOverScreenCurtainEnabled
{
  return _AXSVoiceOverTouchScreenCurtainEnabled() != 0;
}

- (void)setVoiceOverScreenCurtainEnabled:(BOOL)a3
{
}

- (BOOL)voiceOverUIEnabled
{
  return _AXSVoiceOverTouchUIEnabled() != 0;
}

- (void)setVoiceOverUIEnabled:(BOOL)a3
{
}

- (NSArray)voiceOverLanguageRotorItems
{
  id v2 = (void *)_AXSVoiceOverTouchCopyLanguageRotorItems();

  return (NSArray *)v2;
}

- (void)setVoiceOverLanguageRotorItems:(id)a3
{
}

- (BOOL)voiceOverLanguageRotorItemsExist
{
  return _AXSVoiceOverTouchLanguageRotorItemsExist() != 0;
}

- (int64_t)voiceOverTypingMode
{
  return MEMORY[0x1F41791D8](self, a2);
}

- (void)setVoiceOverTypingMode:(int64_t)a3
{
}

- (NSDictionary)voiceOverBrailleBluetoothDisplay
{
  id v2 = (void *)_AXSVoiceOverTouchCopyBrailleBluetoothDisplay();

  return (NSDictionary *)v2;
}

- (void)setVoiceOverBrailleBluetoothDisplay:(id)a3
{
}

- (NSString)voiceOverTouchBrailleTableIdentifier
{
  id v2 = (void *)_AXSVoiceOverTouchCopyBrailleTableIdentifier();

  return (NSString *)v2;
}

- (void)setVoiceOverTouchBrailleTableIdentifier:(id)a3
{
}

- (void)setVoiceOverBrailleVirtualStatusAlignment:(int64_t)a3
{
}

- (void)setVoiceOverBrailleMasterStatusCellIndex:(int64_t)a3
{
}

- (int64_t)voiceOverBrailleStatusCellPreference
{
  if (_AXSVoiceOverTouchBrailleMasterStatusCellIndex() < 0) {
    return 0;
  }
  if (_AXSVoiceOverTouchBrailleVirtualStatusAlignment() == 1) {
    return 2;
  }
  return 1;
}

- (void)setVoiceOverBrailleStatusCellPreference:(int64_t)a3
{
  if (!a3)
  {
    uint64_t v4 = -1;
    goto __AXSVoiceOverTouchSetBrailleMasterStatusCellIndex;
  }
  if (a3 == 1 || a3 == 2)
  {
    _AXSVoiceOverTouchSetBrailleVirtualStatusAlignment();
    uint64_t v4 = 0;
__AXSVoiceOverTouchSetBrailleMasterStatusCellIndex:
    MEMORY[0x1F4179168](v4, a2);
  }
}

- (int64_t)voiceOverBrailleContractionMode
{
  return MEMORY[0x1F41790D0](self, a2);
}

- (void)setVoiceOverBrailleContractionMode:(int64_t)a3
{
}

- (BOOL)voiceOverBrailleEightDotMode
{
  return _AXSVoiceOverTouchBrailleEightDotMode() != 0;
}

- (void)setVoiceOverBrailleEightDotMode:(BOOL)a3
{
}

- (BOOL)hoverTextEnabled
{
  return _AXSHoverTextEnabled() != 0;
}

- (void)setHoverTextEnabled:(BOOL)a3
{
}

- (void)setHoverTextFontSize:(double)a3
{
  float v3 = a3;
  MEMORY[0x1F4178C08](self, a2, v3);
}

- (double)hoverTextFontSize
{
  _AXSHoverTextFontSize();
  return v2;
}

- (void)setHoverTextFontName:(id)a3
{
}

- (NSString)hoverTextFontName
{
  float v2 = (void *)_AXSHoverTextCopyFontName();

  return (NSString *)v2;
}

- (void)setHoverTextTextColorData:(id)a3
{
}

- (NSData)hoverTextTextColorData
{
  float v2 = (void *)_AXSHoverTextCopyTextColorData();

  return (NSData *)v2;
}

- (void)setHoverTextInsertionPointColorData:(id)a3
{
}

- (NSData)hoverTextInsertionPointColorData
{
  float v2 = (void *)_AXSHoverTextCopyInsertionPointColorData();

  return (NSData *)v2;
}

- (void)setHoverTextBackgroundColorData:(id)a3
{
}

- (NSData)hoverTextBackgroundColorData
{
  float v2 = (void *)_AXSHoverTextCopyBackgroundColorData();

  return (NSData *)v2;
}

- (void)setHoverTextBorderColorData:(id)a3
{
}

- (NSData)hoverTextBorderColorData
{
  float v2 = (void *)_AXSHoverTextCopyBorderColorData();

  return (NSData *)v2;
}

- (double)hoverTextBackgroundOpacity
{
  _AXSHoverTextBackgroundOpacity();
  return v2;
}

- (void)setHoverTextBackgroundOpacity:(double)a3
{
  float v3 = a3;
  MEMORY[0x1F4178BD8](self, a2, v3);
}

- (int64_t)hoverTextDisplayMode
{
  return MEMORY[0x1F4178BB8](self, a2);
}

- (void)setHoverTextDisplayMode:(int64_t)a3
{
}

- (BOOL)hoverTextActivationLockEnabled
{
  return AXSettingsReturnBoolValue(@"HoverTextActivationLock", 0);
}

- (void)setHoverTextActivationLockEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"HoverTextActivationLock"];
}

- (int64_t)hoverTextPreferredActivatorKey
{
  return AXSettingsReturnIntegerValue(@"HoverTextActivatorKey", 0);
}

- (void)setHoverTextPreferredActivatorKey:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"HoverTextActivatorKey"];
}

- (BOOL)hoverTextTypingEnabled
{
  return _AXSHoverTextTypingEnabled() != 0;
}

- (void)setHoverTextTypingEnabled:(BOOL)a3
{
}

- (int64_t)hoverTextTypingDisplayMode
{
  int64_t v2 = _AXSHoverTextTypingDisplayMode();
  int IsHardwareKeyboardAttached = GSEventIsHardwareKeyboardAttached();
  if (v2 == 1 && IsHardwareKeyboardAttached == 0) {
    return 0;
  }
  else {
    return v2;
  }
}

- (void)setHoverTextTypingDisplayMode:(int64_t)a3
{
}

- (void)setHoverTextTypingFontName:(id)a3
{
}

- (NSString)hoverTextTypingFontName
{
  int64_t v2 = (void *)_AXSHoverTextTypingCopyFontName();

  return (NSString *)v2;
}

- (void)setHoverTextTypingTextColorData:(id)a3
{
}

- (NSData)hoverTextTypingTextColorData
{
  int64_t v2 = (void *)_AXSHoverTextTypingCopyTextColorData();

  return (NSData *)v2;
}

- (void)setHoverTextTypingInsertionPointColorData:(id)a3
{
}

- (NSData)hoverTextTypingInsertionPointColorData
{
  int64_t v2 = (void *)_AXSHoverTextTypingCopyInsertionPointColorData();

  return (NSData *)v2;
}

- (void)setHoverTextTypingBackgroundColorData:(id)a3
{
}

- (NSData)hoverTextTypingBackgroundColorData
{
  int64_t v2 = (void *)_AXSHoverTextTypingCopyBackgroundColorData();

  return (NSData *)v2;
}

- (void)setHoverTextTypingBorderColorData:(id)a3
{
}

- (NSData)hoverTextTypingBorderColorData
{
  int64_t v2 = (void *)_AXSHoverTextTypingCopyBorderColorData();

  return (NSData *)v2;
}

- (void)setHoverTextTypingTextStyle:(id)a3
{
}

- (NSString)hoverTextTypingTextStyle
{
  int64_t v2 = (void *)_AXSHoverTextTypingCopyTextStyle();

  return (NSString *)v2;
}

- (void)setHoverTextTypingMisspelledTextColorData:(id)a3
{
}

- (NSData)hoverTextTypingMisspelledTextColorData
{
  int64_t v2 = (void *)_AXSHoverTextTypingCopyMisspelledTextColorData();

  return (NSData *)v2;
}

- (void)setHoverTextTypingAutocorrectedTextColorData:(id)a3
{
}

- (NSData)hoverTextTypingAutocorrectedTextColorData
{
  int64_t v2 = (void *)_AXSHoverTextTypingCopyAutocorrectedTextColorData();

  return (NSData *)v2;
}

- (BOOL)zoomEnabled
{
  return _AXSZoomTouchEnabled() != 0;
}

- (void)setZoomEnabled:(BOOL)a3
{
}

- (BOOL)zoomToggledByPreferenceSwitch
{
  return _AXSZoomTouchToggledByPreferenceSwitch() != 0;
}

- (void)setZoomToggledByPreferenceSwitch:(BOOL)a3
{
}

- (BOOL)zoomToggledByVoiceOver
{
  return _AXSZoomTouchToggledByVoiceOver() != 0;
}

- (void)setZoomToggledByVoiceOver:(BOOL)a3
{
}

- (BOOL)zoomSmoothScalingEnabled
{
  return _AXSZoomTouchSmoothScalingDisabled() != 0;
}

- (void)setZoomSmoothScalingEnabled:(BOOL)a3
{
}

- (BOOL)enhanceTextLegibilityEnabled
{
  return _AXSEnhanceTextLegibilityEnabled() != 0;
}

- (void)setEnhanceTextLegibilityEnabled:(BOOL)a3
{
}

- (BOOL)enhanceTextTrackingEnabled
{
  return _AXSEnhanceTextTrackingEnabled() != 0;
}

- (void)setEnhanceTextTrackingEnabled:(BOOL)a3
{
}

- (BOOL)enhanceBackgroundContrastEnabled
{
  return _AXSEnhanceBackgroundContrastEnabledGlobal() != 0;
}

- (void)setEnhanceBackgroundContrastEnabled:(BOOL)a3
{
}

- (BOOL)reduceMotionEnabled
{
  return _AXSReduceMotionEnabledGlobal() != 0;
}

- (void)setReduceMotionEnabled:(BOOL)a3
{
}

- (BOOL)reduceMotionAutoplayVideoPreviewsEnabled
{
  return _AXSReduceMotionAutoplayVideoPreviewsEnabled() != 0;
}

- (void)setReduceMotionAutoplayVideoPreviewsEnabled:(BOOL)a3
{
}

- (BOOL)increaseButtonLegibilityEnabled
{
  return _AXSIncreaseButtonLegibility() != 0;
}

- (void)setIncreaseButtonLegibilityEnabled:(BOOL)a3
{
}

- (BOOL)buttonShapesEnabled
{
  return _AXSButtonShapesEnabled() != 0;
}

- (void)setButtonShapesEnabled:(BOOL)a3
{
}

- (BOOL)reduceWhitePointEnabled
{
  return _AXSReduceWhitePointEnabled() != 0;
}

- (void)setReduceWhitePointEnabled:(BOOL)a3
{
}

- (BOOL)highContrastFocusIndicatorsEnabled
{
  return _AXSHighContrastFocusIndicatorsEnabled() != 0;
}

- (void)setHighContrastFocusIndicatorsEnabled:(BOOL)a3
{
}

- (BOOL)monoAudioEnabled
{
  return _AXSMonoAudioEnabled() != 0;
}

- (void)setMonoAudioEnabled:(BOOL)a3
{
}

- (double)audioLeftRightBalance
{
  _AXSLeftRightAudioBalance();
  return v2;
}

- (void)setAudioLeftRightBalance:(double)a3
{
  float v3 = a3;
  MEMORY[0x1F4178F80](self, a2, v3);
}

- (BOOL)_hasSwitchWithUUID:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(AXSettings *)self assistiveTouchSwitches];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        double v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "uuid", (void)v12);
        char v10 = [v9 isEqual:v4];

        if (v10)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)_switchWithAction:(int64_t)a3 excludedUUIDs:(id)a4 needsToSupportLongPress:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  [(AXSettings *)self assistiveTouchSwitches];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v20;
LABEL_3:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v20 != v12) {
        objc_enumerationMutation(v9);
      }
      long long v14 = *(void **)(*((void *)&v19 + 1) + 8 * v13);
      long long v15 = objc_msgSend(v14, "uuid", (void)v19);
      if ([v8 containsObject:v15])
      {
      }
      else
      {
        if (!a3)
        {

          if (!v5) {
            goto LABEL_17;
          }
LABEL_13:
          if ([v14 supportsLongPress])
          {
LABEL_17:
            id v17 = v14;
            goto LABEL_18;
          }
          goto LABEL_14;
        }
        uint64_t v16 = [v14 action];

        if (v16 == a3)
        {
          if (!v5) {
            goto LABEL_17;
          }
          goto LABEL_13;
        }
      }
LABEL_14:
      if (v11 == ++v13)
      {
        uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v11) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  id v17 = 0;
LABEL_18:

  return v17;
}

- (id)_switchWithAnyActionExcludingUUIDs:(id)a3 needsToSupportLongPress:(BOOL)a4
{
  return [(AXSettings *)self _switchWithAction:0 excludedUUIDs:a3 needsToSupportLongPress:a4];
}

- (BOOL)validateAndUpdateRecipeIfNeeded:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = AXSwitchRecipeMappingSwitchUUIDs(v4);
  uint64_t v6 = (void *)[v5 mutableCopy];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v25 = v4;
  id obj = [v4 mappings];
  uint64_t v7 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  BOOL v24 = v7 == 0;
  if (!v7)
  {
LABEL_16:

    long long v21 = v25;
    BOOL v22 = v24;
    goto LABEL_17;
  }
  uint64_t v8 = v7;
  char v9 = 0;
  uint64_t v10 = *(void *)v28;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v28 != v10) {
        objc_enumerationMutation(obj);
      }
      uint64_t v12 = *(void **)(*((void *)&v27 + 1) + 8 * i);
      uint64_t v13 = [v12 switchUUID];
      if (v13)
      {
        long long v14 = (void *)v13;
        long long v15 = [v12 switchUUID];
        BOOL v16 = [(AXSettings *)self _hasSwitchWithUUID:v15];

        if (v16) {
          continue;
        }
      }
      id v17 = [v12 longPressAction];

      id v18 = -[AXSettings _switchWithAction:excludedUUIDs:needsToSupportLongPress:](self, "_switchWithAction:excludedUUIDs:needsToSupportLongPress:", [v12 switchOriginalAction], v6, v17 != 0);
      if (!v18)
      {
        if ([v12 isOptional]) {
          continue;
        }
        id v18 = [(AXSettings *)self _switchWithAnyActionExcludingUUIDs:v6 needsToSupportLongPress:v17 != 0];
        if (!v18) {
          goto LABEL_16;
        }
      }
      long long v19 = [v18 uuid];
      [v6 addObject:v19];

      long long v20 = [v18 uuid];
      [v12 setSwitchUUID:v20];

      char v9 = 1;
    }
    uint64_t v8 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  }
  while (v8);

  if (v9)
  {
    long long v21 = v25;
    [(AXSettings *)self updateRecipe:v25];
    BOOL v22 = 1;
  }
  else
  {
    BOOL v22 = 1;
    long long v21 = v25;
  }
LABEL_17:

  return v22;
}

- (BOOL)_updateWithoutSavingExistingRecipe:(id)a3 allRecipes:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 count];
  if (v7)
  {
    unint64_t v8 = v7;
    uint64_t v9 = 0;
    BOOL v10 = 1;
    while (1)
    {
      uint64_t v11 = [v6 objectAtIndexedSubscript:v9];
      uint64_t v12 = [v11 uuid];
      uint64_t v13 = [v5 uuid];
      int v14 = [v12 isEqual:v13];

      if (v14) {
        break;
      }

      BOOL v10 = ++v9 < v8;
      if (v8 == v9) {
        goto LABEL_5;
      }
    }
    [v6 replaceObjectAtIndex:v9 withObject:v5];
  }
  else
  {
LABEL_5:
    BOOL v10 = 0;
  }

  return v10;
}

- (void)_assignDefaultTitleIfNeededToRecipe:(id)a3
{
  id v8 = a3;
  float v3 = [v8 name];
  id v4 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  id v5 = [v3 stringByTrimmingCharactersInSet:v4];
  uint64_t v6 = [v5 length];

  if (!v6)
  {
    uint64_t v7 = AXLocalizedString(@"UNTITLED_RECIPE");
    [v8 setName:v7];
  }
}

- (BOOL)updateRecipe:(id)a3
{
  id v4 = a3;
  id v5 = [(AXSettings *)self switchControlRecipes];
  uint64_t v6 = (void *)[v5 mutableCopy];

  BOOL v7 = [(AXSettings *)self _updateWithoutSavingExistingRecipe:v4 allRecipes:v6];
  if (v7)
  {
    [(AXSettings *)self _assignDefaultTitleIfNeededToRecipe:v4];
    [(AXSettings *)self setSwitchControlRecipes:v6];
  }

  return v7;
}

- (void)saveRecipe:(id)a3
{
  id v6 = a3;
  id v4 = [(AXSettings *)self switchControlRecipes];
  id v5 = (void *)[v4 mutableCopy];

  if (!-[AXSettings _updateWithoutSavingExistingRecipe:allRecipes:](self, "_updateWithoutSavingExistingRecipe:allRecipes:", v6, v5))[v5 addObject:v6]; {
  [(AXSettings *)self _assignDefaultTitleIfNeededToRecipe:v6];
  }
  [(AXSettings *)self setSwitchControlRecipes:v5];
}

- (BOOL)isNewRecipe:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = [(AXSettings *)self switchControlRecipes];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        BOOL v10 = [*(id *)(*((void *)&v15 + 1) + 8 * i) uuid];
        uint64_t v11 = [v4 uuid];
        char v12 = [v10 isEqual:v11];

        if (v12)
        {
          BOOL v13 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 1;
LABEL_11:

  return v13;
}

- (id)createAndSaveRecipeForInterfaceOrientedPoint:(CGPoint)a3
{
  return -[AXSettings _createAndSaveRecipeForInterfaceOrientedPoint:forHold:](self, "_createAndSaveRecipeForInterfaceOrientedPoint:forHold:", 0, a3.x, a3.y);
}

- (id)createAndSaveRecipeForInterfaceOrientedHoldPoint:(CGPoint)a3
{
  return -[AXSettings _createAndSaveRecipeForInterfaceOrientedPoint:forHold:](self, "_createAndSaveRecipeForInterfaceOrientedPoint:forHold:", 1, a3.x, a3.y);
}

- (id)_createAndSaveRecipeForInterfaceOrientedPoint:(CGPoint)a3 forHold:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.y;
  double x = a3.x;
  v17[2] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = objc_alloc_init(AXSwitchRecipe);
  uint64_t v9 = v8;
  if (v4)
  {
    [(AXSwitchRecipe *)v8 setUnlocalizedName:@"RECIPE_CREATED_FROM_HOLD_POINT"];
    [(AXSwitchRecipe *)v9 setMenuIconIdentifier:@"HoldPoint"];
    BOOL v10 = objc_alloc_init(AXSwitchRecipeMapping);
    [(AXSwitchRecipeMapping *)v10 setAction:@"HoldAtPoint"];
    -[AXSwitchRecipeMapping setHoldPoint:](v10, "setHoldPoint:", x, y);
  }
  else
  {
    [(AXSwitchRecipe *)v8 setUnlocalizedName:@"RECIPE_CREATED_FROM_POINT"];
    [(AXSwitchRecipe *)v9 setMenuIconIdentifier:@"TapPoint"];
    BOOL v10 = objc_alloc_init(AXSwitchRecipeMapping);
    [(AXSwitchRecipeMapping *)v10 setAction:@"Gesture"];
    uint64_t v11 = +[AXReplayableGesture tapGestureForInterfaceOrientedPoint:](AXReplayableGesture, "tapGestureForInterfaceOrientedPoint:", x, y);
    [(AXSwitchRecipeMapping *)v10 setGesture:v11];
  }
  if ([(AXSettings *)self switchControlScanningStyle] == 2) {
    uint64_t v12 = 104;
  }
  else {
    uint64_t v12 = 103;
  }
  [(AXSwitchRecipeMapping *)v10 setSwitchOriginalAction:v12];
  BOOL v13 = objc_alloc_init(AXSwitchRecipeMapping);
  [(AXSwitchRecipeMapping *)v13 setAction:@"Exit"];
  [(AXSwitchRecipeMapping *)v13 setSwitchOriginalAction:0];
  [(AXSwitchRecipeMapping *)v13 setOptional:1];
  v17[0] = v10;
  v17[1] = v13;
  int v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  [(AXSwitchRecipe *)v9 setMappings:v14];

  [(AXSwitchRecipe *)v9 setTimeout:60.0];
  long long v15 = +[AXSettings sharedInstance];
  [v15 saveRecipe:v9];

  return v9;
}

- (id)switchForUUID:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(AXSettings *)self assistiveTouchSwitches];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        BOOL v10 = objc_msgSend(v9, "uuid", (void)v13);
        int v11 = [v10 isEqual:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)_gesturesForPreferenceKeyMigratingIfNecessary:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)smoothingBufferSizeForEyeTracker:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_1_4();
  _os_log_error_impl(&dword_18D308000, v0, OS_LOG_TYPE_ERROR, "%s: uniqueIdentifier and legacyIdentifier are invalid for eye tracker: %@", (uint8_t *)v1, 0x16u);
}

- (void)updateSmoothingBufferSize:forEyeTracker:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_1_4();
  _os_log_error_impl(&dword_18D308000, v0, OS_LOG_TYPE_ERROR, "%s: uniqueIdentifier is invalid for eye tracker: %@", (uint8_t *)v1, 0x16u);
}

- (void)guidedAccessDefaultToneIdentifierForTimeRestrictionEvents
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getTLToneIdentifierNone(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AXSettings.m", 65, @"%s", dlerror());

  __break(1u);
}

void __38__AXSettings_voiceOverBrailleDisplays__block_invoke_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getkSCROBrailleDisplayDriverIdentifier(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AXSettings.m", 53, @"%s", dlerror());

  __break(1u);
}

void __38__AXSettings_voiceOverBrailleDisplays__block_invoke_cold_2()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getkSCROBrailleDisplayMainSize(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AXSettings.m", 54, @"%s", dlerror());

  __break(1u);
}

- (void)setVoiceOverSpeakingRate:(os_log_t)log forLanguage:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_18D308000, log, OS_LOG_TYPE_FAULT, "Tried to set a VoiceOver speaking rate instead of using rotor/selection hierarchy.", v1, 2u);
}

- (void)fullKeyboardAccessCommandMapData
{
}

- (void)reachabilityEnabled
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"BOOL weak_SBSIsReachabilityEnabled(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AXSettings.m", 82, @"%s", dlerror());

  __break(1u);
}

- (void)setReachabilityEnabled:.cold.1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"void weak_SBSSetReachabilityEnabled(BOOL)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AXSettings.m", 83, @"%s", dlerror());

  __break(1u);
}

@end