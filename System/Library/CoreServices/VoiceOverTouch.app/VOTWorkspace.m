@interface VOTWorkspace
+ (id)sharedWorkspace;
- (AXCharacterSoundMap)characterSoundMap;
- (AXMDisplayManager)displayManager;
- (AXMLanguageTranslator)languageTranslator;
- (AXUISoftwareKeyboardManager)softwareKeyboardManager;
- (AXVoiceOverActivity)selectedActivity;
- (BOOL)_userHasDisabledUSBRM;
- (BOOL)accessoryShutdownInProgress;
- (BOOL)activeBrailleAlertsPreference;
- (BOOL)activeBrailleGeneralStatusCellPreference;
- (BOOL)activeBrailleTextStatusCellPreference;
- (BOOL)allowSingleLetterSearching;
- (BOOL)announceOrientationChanges;
- (BOOL)audioDestinationRequestExternal;
- (BOOL)automaticAccessibilityEnabled;
- (BOOL)brailleAlertsEnabled;
- (BOOL)brailleFormattingEnabled;
- (BOOL)brailleInputActive;
- (BOOL)brailleInputAllowsElementMovement;
- (BOOL)brailleInputShouldBeDeactivatedByEscape;
- (BOOL)brailleInputWantsToStayActive;
- (BOOL)buttonIconDetectionEnabled;
- (BOOL)captionPanelEnabled;
- (BOOL)directTouchElementsPresent;
- (BOOL)disableVoiceOverSettingOnStop;
- (BOOL)duckingTemporarilyDisabled;
- (BOOL)handwritingInputActive;
- (BOOL)hasActive2DBrailleDisplay;
- (BOOL)hintsEnabled;
- (BOOL)imageCaptionsEnabled;
- (BOOL)inPerformanceTestMode;
- (BOOL)inUnitTestMode;
- (BOOL)isAccessibilityEnabled;
- (BOOL)isAudioRoutedToSpeaker;
- (BOOL)isBaseSystemSpokenEqualToLocalization;
- (BOOL)isInternalInstall;
- (BOOL)isOnenessActive;
- (BOOL)isRingerSwitchSilent;
- (BOOL)isRingerSwitchSilentForUnitTesting;
- (BOOL)isSiriListening;
- (BOOL)isSiriTalking;
- (BOOL)isSystemBatteryLow;
- (BOOL)isSystemWideServerAlive;
- (BOOL)isVoiceOverTouchPreferenceEnabled;
- (BOOL)largeCursorEnabled;
- (BOOL)navigationStyleHonorsGroups;
- (BOOL)outputDisabled;
- (BOOL)overridePropertiesForTesting;
- (BOOL)pauseSpeechAndHaptics;
- (BOOL)perkinsChordKeyboardInputEnabled;
- (BOOL)perkinsKeyboardInputEnabled;
- (BOOL)playKeyboardClicksOnHWInput;
- (BOOL)reachabilityActive;
- (BOOL)screenCurtainEnabled;
- (BOOL)screenCurtainSuspended;
- (BOOL)screenOn;
- (BOOL)softwareKeyboardManagerShouldSetHardwareKeyboardAttached:(id)a3 hardwareKeyboardIsCurrentlyAttached:(BOOL)a4 newHardwareKeyboardAttachedValue:(BOOL *)a5;
- (BOOL)soundEffectsEnabled;
- (BOOL)soundMuted;
- (BOOL)speakAutocorrectionsEnabled;
- (BOOL)speakUnderPointer;
- (BOOL)speakingRateInRotor;
- (BOOL)speechLogging;
- (BOOL)speechMuted;
- (BOOL)supportsHomeGestures;
- (BOOL)systemVolumeControlsAvailablity;
- (BOOL)tapAndHoldMode;
- (BOOL)telephonyIsActive;
- (BOOL)textDetectionEnabled;
- (BOOL)typingPitchChangeEnabled;
- (BOOL)updateRotorWithElement;
- (BOOL)useDigitalCrownNavigation;
- (BOOL)useRingerSwitchForNotificationOutput;
- (BOOL)userRecentlyUnlockedDevice;
- (BOOL)userRecentlyUnlockedDeviceForUnitTesting;
- (BOOL)userUnlockedDevice;
- (BOOL)userUnlockedDeviceForUnitTesting;
- (BOOL)usesDisplayManager;
- (BOOL)voiceOverIsConfirmed;
- (BOOL)voiceOverIsIdle;
- (BOOL)voiceOverMuted;
- (BOOL)wasEnabledThroughAccessory;
- (BRLTTable)selectedBrailleGesturesInputTable;
- (BRLTTable)selectedBrailleInputTable;
- (BRLTTable)selectedBrailleTable;
- (CGPoint)convertDevicePointToZoomedPoint:(CGPoint)a3;
- (CGPoint)fingerPosition;
- (NSArray)activities;
- (NSArray)brailleLanguageRotorItems;
- (NSArray)focusedApplications;
- (NSArray)imageCaptioningDisabledApps;
- (NSArray)languageRotorItems;
- (NSArray)punctuationGroups;
- (NSMutableDictionary)websiteLanguageMappingOverrides;
- (NSNumber)unitTestSpeechRate;
- (NSString)additionalLanguageRotorItem;
- (NSString)previousRotorVoiceIdentifier;
- (NSString)reachabilityIdentifier;
- (NSString)selectedLanguage;
- (NSString)systemSpokenLanguage;
- (NSString)unitTestSystemSpokenLanguage;
- (OS_dispatch_queue)managedConfigurationQueue;
- (OS_os_transaction)votTransaction;
- (VOSCommandManager)userCommandManager;
- (VOTElement)currentElement;
- (VOTElementManagementProtocol)elementManager;
- (VOTEventFactory)eventFactory;
- (VOTRotorManagementProtocol)rotorManager;
- (VOTVisionEngine)visionEngine;
- (VOTWorkspace)init;
- (VOTWorkspaceUnitTestDelegate)unitTestDelegate;
- (_TtC3vot11VOTSettings)votSettings;
- (double)_updateMainScreenSize:(double)a3 scale:;
- (double)activeBrailleAutoAdvanceDuration;
- (double)automaticAccessibilityVisualizationsEnabled;
- (double)lastHomeButtonPress;
- (double)lastKeyboardKeyPress;
- (double)lastLockButtonPress;
- (double)lastLockButtonPressTime;
- (double)lastSoundMuteToggleTime;
- (double)lastSpeechMuteToggleTime;
- (double)lastTelephonyCallActive;
- (double)reachabilityOffset;
- (double)screenOnTime;
- (double)speakUnderPointerDelay;
- (double)speechRateFromSettings;
- (id)_assetUpdaterClient;
- (id)_systemBootTime;
- (id)_validateAssetFromResults:(id)a3;
- (id)applicationForCurrentElement;
- (id)applicationForElement:(id)a3;
- (id)applicationForPID:(int)a3;
- (id)currentElementRotorString;
- (id)defaultPunctuationGroup;
- (id)imageCaptionModelAssetPolicy;
- (id)keyboardPressInfo;
- (id)lastPostedEventForUnitTesting;
- (id)lastScreenChangeTime;
- (id)phoneticStringForCharacter:(id)a3 andVoiceIdentifier:(id)a4;
- (id)punctuationGroupForUUID:(id)a3;
- (id)punctuationGroupsUpdatedHandler;
- (id)selectedBrailleGesturesInputTable:(id)a3;
- (id)testingEventListener;
- (int)_callCenterQueue_currentCallState;
- (int)currentCallState;
- (int)currentCallStateForUnitTests;
- (int)currentRotorDetectionMode;
- (int)pointerVoiceOverCursorOption;
- (int64_t)activeBrailleInputPreference;
- (int64_t)activeBrailleOutputPreference;
- (int64_t)applicationOrientation;
- (int64_t)bannerNotificationsOutput;
- (int64_t)brailleInputTypingMode;
- (int64_t)containerOutputFeedback;
- (int64_t)deviceOrientation;
- (int64_t)emojiFeedback;
- (int64_t)moreContentOutputFeedback;
- (int64_t)navigateImagesOption;
- (int64_t)navigationDirection;
- (int64_t)navigationStyle;
- (int64_t)notificationsWhenLockedOutput;
- (int64_t)numberFeedback;
- (int64_t)rotorType;
- (int64_t)suppressSelectionChangeNotificationCount;
- (int64_t)suppressSelectionChangeNotificationSpeechOutputCount;
- (int64_t)suppressValueChangeNotificationCount;
- (int64_t)systemVisualizationState;
- (int64_t)tvInteractionMode;
- (int64_t)typingMode;
- (unint64_t)customContentImportance;
- (unint64_t)fingerCount;
- (void)_activeAudioRouteChanged:(id)a3;
- (void)_applyVoiceOverMigrations;
- (void)_attemptRecoveryFromCrashloopDueToVoiceMemoryPressure;
- (void)_callStatusChanged:(id)a3;
- (void)_checkVoiceOverWasConfirmed;
- (void)_crystalBMigrateDuckingVolumePreferences;
- (void)_handleBluetoothEnablement;
- (void)_handleOnenessCheck;
- (void)_handleReachabilityChanges;
- (void)_handleSystemMuteKey:(id)a3;
- (void)_initialize;
- (void)_initializeCaptionModel;
- (void)_installLanguageTranslationModelForLanguageIfNeeded:(id)a3;
- (void)_languageChanged;
- (void)_localeChanged:(id)a3;
- (void)_migratePreferencesIfNeeded;
- (void)_postKeyboardEvent:(id)a3 modifiers:(id)a4 keyCode:(id)a5;
- (void)_postKeyboardEventWithCharacters:(id)a3 originalCharacters:(id)a4 modifiers:(id)a5 keyCode:(id)a6;
- (void)_postKeyboardEventWithKeyCode:(unsigned __int16)a3 characters:(id)a4 originalCharacters:(id)a5 modifierState:(unsigned int)a6 eventType:(unsigned int)a7;
- (void)_postKeyboardEventWithKeyCode:(unsigned __int16)a3 characters:(id)a4 originalCharacters:(id)a5 modifierState:(unsigned int)a6 isKeyDown:(BOOL)a7;
- (void)_postKeyboardEventWithKeyCode:(unsigned __int16)a3 modifierState:(unsigned int)a4 isKeyDown:(BOOL)a5;
- (void)_postKeyboardEventsForModifiers:(unsigned int)a3 isKeyDown:(BOOL)a4;
- (void)_postNextLanguageEvent;
- (void)_preferenceUseDigitalCrownNavigationChanged;
- (void)_preferencesActivitiesChanged;
- (void)_preferencesAlwaysUseNemethForMathChange;
- (void)_preferencesCaptionPanelChanged;
- (void)_preferencesNavigateImagesOptionChange;
- (void)_preferencesScreenCurtainChanged:(id)a3;
- (void)_preferencesSelectedActivityChanged;
- (void)_preferencesSelectedLanguageChanged;
- (void)_preferencesSpeakHintsChange;
- (void)_preferencesSpeakNotifications;
- (void)_preferencesSpeakingRateInRotorChanged;
- (void)_preferencesSpeechRateChange;
- (void)_preferencesTypingModeChanged:(id)a3;
- (void)_preferencesTypingPitchChange;
- (void)_registerForExternalDevices;
- (void)_registerForPreferenceChanges;
- (void)_registerForUserSwitches;
- (void)_registerWithSpringBoard;
- (void)_registerWithSystem;
- (void)_replaceHighMemoryVoiceIDWithDefaultVoiceIDForLanguage:(id)a3 preferredFallbackLanguage:(id)a4;
- (void)_resetOrientationAndAnnounce:(BOOL)a3 updateApplication:(BOOL)a4;
- (void)_screenChange:(id)a3;
- (void)_selectedBrailleGesturesInputTableChanged;
- (void)_selectedBrailleInputTableChanged;
- (void)_selectedBrailleTableChanged;
- (void)_selfDestruct;
- (void)_sendGreetingMessage;
- (void)_setDeviceOrientation:(int64_t)a3 shouldAnnounce:(BOOL)a4 updateApplication:(BOOL)a5;
- (void)_setUSBRMPreferenceDisabled;
- (void)_showConfirmPanel;
- (void)_showVOTNoHomeButtonGestureAlert;
- (void)_speakCorrectionsChanged;
- (void)_stopRunLoop;
- (void)_temporarilyChangeQuickNav:(id)a3;
- (void)_testFetchWebElementRects;
- (void)_tigrisMigrateLanguageRotors;
- (void)_updateActivityListeners;
- (void)_updatePointerVoiceOverOptions;
- (void)_updateScreenCurtainEnabled:(BOOL)a3;
- (void)_voiceOverTouchEnabledChange:(__CFString *)a3;
- (void)_voiceOverUsageConfirmed;
- (void)_yukonMigrateLanguageRotors;
- (void)addMisspellingsForString:(id)a3;
- (void)assetController:(id)a3 didFinishDownloadingAsset:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6 hasRemainingDownloads:(BOOL)a7;
- (void)assetController:(id)a3 didFinishRefreshingAssets:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6;
- (void)assetController:(id)a3 didUpdateCatalogForPolicy:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6;
- (void)cancelTapAndHoldMode;
- (void)currentElementDidUpdate:(id)a3;
- (void)dealloc;
- (void)dispatchCommand:(id)a3;
- (void)dispatchCommand:(id)a3 bypassGesturedInput:(BOOL)a4;
- (void)handleAppleTVRemoteEvent:(id)a3 eventOrigin:(int64_t)a4 isRTL:(BOOL)a5;
- (void)handleBluetoothBrailleDisplayConnected;
- (void)handleKeyboardKeyEvent:(id)a3 eventOrigin:(int64_t)a4;
- (void)handleLockButtonPress:(id)a3;
- (void)handleMediaKeyPress:(id)a3;
- (void)handleMenuButtonPress:(id)a3;
- (void)handleOrientationChanged;
- (void)handlePlayPauseKeyPress:(id)a3;
- (void)handleProximityEvent:(id)a3;
- (void)handleReturnToSpringBoard;
- (void)handleRingerSwitchSwitched:(id)a3;
- (void)handleSetForcedOrientation:(int64_t)a3 shouldAnnounce:(BOOL)a4;
- (void)handleSystemWideServerDied;
- (void)handleTurnOffSoundAndCurtainEvent:(id)a3;
- (void)handleUSBMFiBrailleDisplayConnected;
- (void)handleUnsetForcedOrientationAndAnnounce:(BOOL)a3;
- (void)handleVolumeButtonPress:(id)a3;
- (void)loadUIKit;
- (void)mlElementDetectorReceivedFrames:(id)a3 labels:(id)a4 uiClasses:(id)a5;
- (void)mlElementDetectorScrollToVisibleOccurred:(CGPoint)a3;
- (void)mlElementDetectorUpdatedElements;
- (void)notePostedEventForUnitTesting:(id)a3;
- (void)outputRequestFinished:(id)a3;
- (void)performEjectButtonPress;
- (void)performHomeButtonPress;
- (void)performNextLanguageButtonPress;
- (void)performVolumeDownButtonPress;
- (void)performVolumeUpButtonPress;
- (void)postKeyboardEvent:(BOOL)a3 modifiers:(unsigned int)a4 keyCode:(unsigned __int16)a5;
- (void)postKeyboardEventWithCharacters:(id)a3 originalCharacters:(id)a4 modifiers:(unsigned int)a5 keyCode:(unsigned __int16)a6;
- (void)preferencesBrailleLanguageRotorItemsChanged:(id)a3;
- (void)preferencesKeyboardClickStatusChange:(id)a3;
- (void)preferencesLanguageRotorItemsChanged:(id)a3;
- (void)punctuationGroupsChanged:(id)a3;
- (void)refreshBraille:(BOOL)a3 rotorSelection:(id)a4;
- (void)resetOrientation;
- (void)resetSystemBatteryLowState;
- (void)rotateDeviceOrientation:(BOOL)a3;
- (void)run;
- (void)screenLockOccurred;
- (void)setAccessoryShutdownInProgress:(BOOL)a3;
- (void)setActivities:(id)a3;
- (void)setAdditionalLanguageRotorItem:(id)a3;
- (void)setAllowSingleLetterSearching:(BOOL)a3;
- (void)setAudioDestinationRequestExternal:(BOOL)a3;
- (void)setAutomaticAccessibilityEnabled:(BOOL)a3;
- (void)setAutomaticAccessibilityVisualizationsEnabled:(double)a3;
- (void)setBannerNotificationsOutput:(int64_t)a3;
- (void)setBrailleAlertsEnabled:(BOOL)a3;
- (void)setBrailleFormattingEnabled:(BOOL)a3;
- (void)setButtonIconDetectionEnabled:(BOOL)a3;
- (void)setCaptionPanelEnabled:(BOOL)a3;
- (void)setCharacterSoundMap:(id)a3;
- (void)setContainerOutputFeedback:(int64_t)a3;
- (void)setCurrentCallStateForUnitTests:(int)a3;
- (void)setCurrentRotorDetectionMode:(int)a3;
- (void)setCustomContentImportance:(unint64_t)a3;
- (void)setDisableVoiceOverSettingOnStop:(BOOL)a3;
- (void)setDisplayManager:(id)a3;
- (void)setDuckingTemporarilyDisabled:(BOOL)a3;
- (void)setElementManager:(id)a3;
- (void)setEmojiFeedback:(int64_t)a3;
- (void)setHintsEnabled:(BOOL)a3;
- (void)setImageCaptioningDisabledApps:(id)a3;
- (void)setImageCaptionsEnabled:(BOOL)a3;
- (void)setInPerformanceTestMode:(BOOL)a3;
- (void)setInUnitTestMode:(BOOL)a3;
- (void)setIsOnenessActive:(BOOL)a3;
- (void)setIsRingerSwitchSilentForUnitTesting:(BOOL)a3;
- (void)setIsSiriListening:(BOOL)a3;
- (void)setIsSiriTalking:(BOOL)a3;
- (void)setIsSystemBatteryLow:(BOOL)a3;
- (void)setLanguageTranslator:(id)a3;
- (void)setLargeCursorEnabled:(BOOL)a3;
- (void)setLastHomeButtonPress:(double)a3;
- (void)setLastKeyboardKeyPress:(double)a3;
- (void)setLastLockButtonPress:(double)a3;
- (void)setLastSoundMuteToggleTime:(double)a3;
- (void)setLastSpeechMuteToggleTime:(double)a3;
- (void)setLastTelephonyCallActive:(double)a3;
- (void)setManagedConfigurationQueue:(id)a3;
- (void)setMoreContentOutputFeedback:(int64_t)a3;
- (void)setNavigateImagesOption:(int64_t)a3;
- (void)setNavigationDirection:(int64_t)a3;
- (void)setNavigationStyle:(int64_t)a3;
- (void)setNotificationsWhenLockedOutput:(int64_t)a3;
- (void)setNumberFeedback:(int64_t)a3;
- (void)setOutputDisabled:(BOOL)a3;
- (void)setOverridePropertiesForTesting:(BOOL)a3;
- (void)setPauseSpeechAndHaptics:(BOOL)a3;
- (void)setPerkinsChordKeyboardInputEnabled:(BOOL)a3;
- (void)setPerkinsKeyboardInputEnabled:(BOOL)a3;
- (void)setPlayKeyboardClicksOnHWInput:(BOOL)a3;
- (void)setPointerVoiceOverCursorOption:(int)a3;
- (void)setPreviousRotorVoiceIdentifier:(id)a3;
- (void)setPunctuationGroupsUpdatedHandler:(id)a3;
- (void)setReachabilityActive:(BOOL)a3;
- (void)setReachabilityIdentifier:(id)a3;
- (void)setReachabilityOffset:(double)a3;
- (void)setRotorManager:(id)a3;
- (void)setRotorType:(int64_t)a3;
- (void)setScreenCurtainEnabled:(BOOL)a3;
- (void)setScreenCurtainSuspended:(BOOL)a3;
- (void)setScreenOn:(BOOL)a3 silently:(BOOL)a4;
- (void)setScreenOnTime:(double)a3;
- (void)setSelectedActivity:(id)a3;
- (void)setSelectedBrailleGesturesInputTable:(id)a3;
- (void)setSelectedBrailleInputTable:(id)a3;
- (void)setSelectedBrailleTable:(id)a3;
- (void)setSelectedLanguage:(id)a3;
- (void)setSoundEffectsEnabled:(BOOL)a3;
- (void)setSoundMuted:(BOOL)a3;
- (void)setSpeakUnderPointer:(BOOL)a3;
- (void)setSpeakUnderPointerDelay:(double)a3;
- (void)setSpeakingRateInRotor:(BOOL)a3;
- (void)setSpeechLogging:(BOOL)a3;
- (void)setSpeechMuted:(BOOL)a3;
- (void)setSupportsHomeGestures:(BOOL)a3;
- (void)setSuppressSelectionChangeNotificationCount:(int64_t)a3;
- (void)setSuppressSelectionChangeNotificationSpeechOutputCount:(int64_t)a3;
- (void)setSuppressValueChangeNotificationCount:(int64_t)a3;
- (void)setSystemVisualizationState:(int64_t)a3;
- (void)setSystemVolumeControlsAvailablity:(BOOL)a3;
- (void)setTelephonyIsActive:(BOOL)a3;
- (void)setTestingEventListener:(id)a3;
- (void)setTextDetectionEnabled:(BOOL)a3;
- (void)setTvInteractionMode:(int64_t)a3;
- (void)setTvInteractionModeWithoutSaving:(int64_t)a3;
- (void)setTypingMode:(int64_t)a3;
- (void)setTypingPitchChangeEnabled:(BOOL)a3;
- (void)setUnitTestDelegate:(id)a3;
- (void)setUnitTestSpeechRate:(id)a3;
- (void)setUnitTestSystemSpokenLanguage:(id)a3;
- (void)setUpdateRotorWithElement:(BOOL)a3;
- (void)setUseDigitalCrownNavigationEnabled:(BOOL)a3;
- (void)setUseRingerSwitchForNotificationOutput:(BOOL)a3;
- (void)setUserCommandManager:(id)a3;
- (void)setUserRecentlyUnlockedDeviceForUnitTesting:(BOOL)a3;
- (void)setUserUnlockedDeviceForUnitTesting:(BOOL)a3;
- (void)setVisionEngine:(id)a3;
- (void)setVoiceOverIsIdle:(BOOL)a3;
- (void)setVoiceOverMuted:(BOOL)a3;
- (void)setVoiceOverMuted:(BOOL)a3 sendRequest:(BOOL)a4;
- (void)setVotSettings:(id)a3;
- (void)setVotTransaction:(id)a3;
- (void)setWasEnabledThroughAccessory:(BOOL)a3;
- (void)setWebsiteLanguageMappingOverrides:(id)a3;
- (void)softwareKeyboardManager:(id)a3 didSetHardwareKeyboardAttached:(BOOL)a4;
- (void)softwareKeyboardManagerDidChangeHardwareKeyboardAttached:(id)a3;
- (void)softwareKeyboardManagerWillUpdateKeyboardState:(id)a3;
- (void)startTapAndHoldMode:(BOOL)a3;
- (void)stop:(int)a3;
- (void)systemSpokenLanguageChanged:(id)a3;
- (void)temporarilyChangeQuickNavState:(BOOL)a3;
- (void)unitTestSetBrailleRotorItems:(id)a3;
- (void)unmuteEligibleEventOccured;
- (void)userInteractedWithDevice;
- (void)willSwitchUser;
@end

@implementation VOTWorkspace

+ (id)sharedWorkspace
{
  return (id)VOTSharedWorkspace;
}

- (VOTWorkspace)init
{
  v2 = self;
  if (VOTSharedWorkspace)
  {
    v3 = (VOTWorkspace *)(id)VOTSharedWorkspace;
    goto LABEL_19;
  }
  v56.receiver = self;
  v56.super_class = (Class)VOTWorkspace;
  v4 = [(VOTWorkspace *)&v56 init];
  v2 = v4;
  if (!v4)
  {
LABEL_18:
    v3 = 0;
    goto LABEL_19;
  }
  if (![(VOTWorkspace *)v4 isAccessibilityEnabled])
  {
    v44 = +[AXSubsystemVoiceOverLifeCycle sharedInstance];
    unsigned __int8 v45 = [v44 ignoreLogging];

    if ((v45 & 1) == 0)
    {
      v46 = +[AXSubsystemVoiceOverLifeCycle identifier];
      v47 = AXLoggerForFacility();

      os_log_type_t v48 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v47, v48))
      {
        v49 = AXColorizeFormatLog();
        v50 = _AXStringForArgs();
        if (os_log_type_enabled(v47, v48))
        {
          *(_DWORD *)buf = 138543362;
          v58 = v50;
          _os_log_impl((void *)&_mh_execute_header, v47, v48, "%{public}@", buf, 0xCu);
        }
      }
    }
    goto LABEL_18;
  }
  objc_storeStrong((id *)&VOTSharedWorkspace, v2);
  [(VOTWorkspace *)v2 setDisableVoiceOverSettingOnStop:1];
  AXDevicePrimeDisplayManager();
  _AXSVoiceOverTouchEnabled();
  _AXSVoiceOverTouchUsageConfirmed();
  _AXSApplicationAccessibilityEnabled();
  int64x2_t v52 = vdupq_n_s64(0xC1E6CEAF20000000);
  *(int64x2_t *)&v2->_lastLockButtonPress = v52;
  v2->_lastKeyboardKeyPress = -3061152000.0;
  v2->_lastDeviceInteractionEvent = CFAbsoluteTimeGetCurrent();
  v2->_lastUnmuteEvent = CFAbsoluteTimeGetCurrent();
  *(int64x2_t *)&v2->_screenOnTime = v52;
  v2->_lastPowerCheck = -3061152000.0;
  postKeyThreadKey = v2->_postKeyThreadKey;
  v2->_postKeyThreadKey = (NSString *)@"VOTPostKey";

  v6 = (NSLock *)objc_alloc_init((Class)NSLock);
  systemLangaugeLock = v2->_systemLangaugeLock;
  v2->_systemLangaugeLock = v6;

  v2->_forcedOrientation = 0;
  v8 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  dispatch_queue_t v9 = dispatch_queue_create("voiceover.keyposting.workspace", v8);
  keyPostingQueue = v2->_keyPostingQueue;
  v2->_keyPostingQueue = (OS_dispatch_queue *)v9;

  dispatch_queue_t v11 = dispatch_queue_create("voiceover.avaccessqueue.workspace", 0);
  avAccessQueue = v2->_avAccessQueue;
  v2->_avAccessQueue = (OS_dispatch_queue *)v11;

  v13 = +[VOTConfiguration rootConfiguration];
  v14 = [v13 preferenceForKey:@"WebsiteLanguageMappingOverride"];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v15 = +[NSDictionary dictionary];

    v14 = (void *)v15;
  }
  id v16 = objc_msgSend(v14, "mutableCopy", *(_OWORD *)&v52);
  [(VOTWorkspace *)v2 setWebsiteLanguageMappingOverrides:v16];

  v17 = (AXCharacterSoundMap *)objc_alloc_init((Class)AXCharacterSoundMap);
  characterSoundMap = v2->_characterSoundMap;
  v2->_characterSoundMap = v17;

  v19 = AXLogSpeechAssetDownload();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v20 = [(VOTWorkspace *)v2 _assetUpdaterClient];
    *(_DWORD *)buf = 138477827;
    v58 = v20;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Retrieve cloud data: %{private}@", buf, 0xCu);
  }
  v21 = [(VOTWorkspace *)v2 _assetUpdaterClient];
  v22 = +[AXAccessQueue mainAccessQueue];
  [v21 sendAsynchronousMessage:&__NSDictionary0__struct withIdentifier:3 targetAccessQueue:v22 completion:0];

  if ((AXDeviceIsAudioAccessory() & 1) == 0)
  {
    v23 = objc_alloc_init(VOTVisionEngine);
    [(VOTWorkspace *)v2 setVisionEngine:v23];
  }
  v24 = (UITextChecker *)[objc_alloc((Class)UITextChecker) _initWithAsynchronousLoading:1];
  textChecker = v2->_textChecker;
  v2->_textChecker = v24;

  v26 = +[NSNotificationCenter defaultCenter];
  dispatch_queue_t v27 = dispatch_queue_create("vo-call-center-queue", 0);
  callCenterQueue = v2->_callCenterQueue;
  v2->_callCenterQueue = (OS_dispatch_queue *)v27;

  v29 = (TUCallCenter *)[objc_alloc((Class)TUCallCenter) initWithQueue:v2->_callCenterQueue];
  callCenter = v2->_callCenter;
  v2->_callCenter = v29;

  v31 = v2->_callCenterQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100041D18;
  block[3] = &unk_1001B3448;
  v32 = v2;
  v54 = v32;
  id v55 = v26;
  id v33 = v26;
  dispatch_async(v31, block);
  [(VOTWorkspace *)v32 _applyVoiceOverMigrations];
  dispatch_queue_t v34 = dispatch_queue_create("com.apple.accessibility.VOT.MC", 0);
  managedConfigurationQueue = v32->_managedConfigurationQueue;
  v32->_managedConfigurationQueue = (OS_dispatch_queue *)v34;

  v36 = +[AXSettings sharedInstance];
  v32->_automaticAccessibilityVisualizationsEnabled = (double)[v36 automaticAccessibilityVisualizationsEnabled];

  v37 = +[AXSettings sharedInstance];
  v32->_automaticAccessibilityEnabled = [v37 automaticAccessibilityEnabled];

  v38 = +[AXSettings sharedInstance];
  [v38 setLiveRecognitionOverlayOpen:0];

  v32->_currentRotorDetectionMode = 2;
  v39 = +[AXSettings sharedInstance];
  v40 = [v39 imageCaptioningDisabledApps];
  [(VOTWorkspace *)v32 setImageCaptioningDisabledApps:v40];

  v41 = +[NSNotificationCenter defaultCenter];
  [v41 addObserver:v32 selector:"_screenChange:" name:@"UpdateElement" object:0];

  v42 = objc_alloc_init(_TtC3vot11VOTSettings);
  votSettings = v32->_votSettings;
  v32->_votSettings = v42;

  [(VOTSettings *)v32->_votSettings initialize];
  v2 = v32;

  v3 = v2;
LABEL_19:

  return v3;
}

- (void)_callStatusChanged:(id)a3
{
  unsigned int v4 = [(VOTWorkspace *)self telephonyIsActive];
  -[VOTWorkspace setTelephonyIsActive:](self, "setTelephonyIsActive:", objc_msgSend((id)VOTSharedWorkspace, "_callCenterQueue_currentCallState") != 0);
  if (v4 != [(VOTWorkspace *)self telephonyIsActive]
    && ![(VOTWorkspace *)self telephonyIsActive])
  {
    [(VOTWorkspace *)self setLastTelephonyCallActive:CFAbsoluteTimeGetCurrent()];
  }
  v5 = VOTLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7[0] = 67109120;
    v7[1] = [(id)VOTSharedWorkspace telephonyIsActive];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Call status changed, updating call active status: %d", (uint8_t *)v7, 8u);
  }

  v6 = +[VOTOutputManager outputManager];
  [v6 callStatusChanged];
}

- (VOTEventFactory)eventFactory
{
  return self->_eventFactory;
}

- (void)_applyVoiceOverMigrations
{
  v3 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100041FE4;
  block[3] = &unk_1001B33B8;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (void)_crystalBMigrateDuckingVolumePreferences
{
  v2 = +[NSUserDefaults standardUserDefaults];
  v3 = [v2 objectForKey:@"_AccessibilityMigration__DuckingVolumePrefs_18.2.1"];
  unsigned __int8 v4 = [v3 BOOLValue];

  if ((v4 & 1) == 0)
  {
    v5 = +[AXSettings sharedInstance];
    [v5 voiceOverMediaDuckingAmount];
    double v7 = v6;

    if (v7 < 0.25)
    {
      v8 = +[AXSettings sharedInstance];
      [v8 setVoiceOverMediaDuckingAmount:0.800000012];
    }
    dispatch_queue_t v9 = +[AXSettings sharedInstance];
    [v9 voiceOverMediaDuckingAmount];
    double v11 = v10;

    if (v11 > 1.0)
    {
      v12 = +[AXSettings sharedInstance];
      [v12 voiceOverMediaDuckingAmount];
      double v14 = 2.0 - v13;
      uint64_t v15 = +[AXSettings sharedInstance];
      [v15 setVoiceOverMediaDuckingAmount:v14];
    }
    id v16 = +[AXSettings sharedInstance];
    [v16 voiceOverEffectiveSpeakingVolume];
    float v18 = v17;

    if (v18 == 0.0)
    {
      v19 = +[AXSettings sharedInstance];
      LODWORD(v20) = 1.0;
      [v19 setVoiceOverEffectiveSpeakingVolume:v20];
    }
    id v21 = +[NSUserDefaults standardUserDefaults];
    [v21 setObject:&__kCFBooleanTrue forKey:@"_AccessibilityMigration__DuckingVolumePrefs_18.2.1"];
  }
}

- (void)setHintsEnabled:(BOOL)a3
{
  self->_hintsEnabled = a3;
}

- (BOOL)hintsEnabled
{
  v3 = [(VOTWorkspace *)self elementManager];
  unsigned __int8 v4 = [(VOTWorkspace *)self currentElement];
  v5 = [v3 determineActivityForElement:v4];

  double v6 = [v5 hints];

  if (v6)
  {
    double v7 = [v5 hints];
    unsigned __int8 hintsEnabled = [v7 BOOLValue];
  }
  else
  {
    unsigned __int8 hintsEnabled = self->_hintsEnabled;
  }

  return hintsEnabled;
}

- (BOOL)brailleFormattingEnabled
{
  v3 = [(VOTWorkspace *)self elementManager];
  unsigned __int8 v4 = [(VOTWorkspace *)self currentElement];
  v5 = [v3 determineActivityForElement:v4];

  double v6 = [v5 brailleFormatting];

  if (v6)
  {
    double v7 = [v5 brailleFormatting];
    unsigned __int8 v8 = [v7 BOOLValue];
  }
  else
  {
    double v7 = +[AXSettings sharedInstance];
    unsigned __int8 v8 = [v7 voiceOverBrailleFormattingEnabled];
  }
  BOOL v9 = v8;

  return v9;
}

- (int64_t)containerOutputFeedback
{
  v3 = [(VOTWorkspace *)self elementManager];
  unsigned __int8 v4 = [(VOTWorkspace *)self currentElement];
  v5 = [v3 determineActivityForElement:v4];

  double v6 = [v5 containerFeedback];

  if (v6)
  {
    double v7 = [v5 containerFeedback];
    id containerOutputFeedback = [v7 integerValue];
  }
  else
  {
    id containerOutputFeedback = self->_containerOutputFeedback;
  }

  return (int64_t)containerOutputFeedback;
}

- (int64_t)activeBrailleInputPreference
{
  v3 = [(VOTWorkspace *)self elementManager];
  unsigned __int8 v4 = [(VOTWorkspace *)self currentElement];
  v5 = [v3 determineActivityForElement:v4];

  double v6 = [v5 brailleInput];

  if (v6)
  {
    double v7 = VOTLogActivities();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      unsigned __int8 v8 = [v5 brailleInput];
      int v13 = 138412290;
      double v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Using activity braille input: %@", (uint8_t *)&v13, 0xCu);
    }
    BOOL v9 = [v5 brailleInput];
    id v10 = [v9 integerValue];
  }
  else
  {
    BOOL v9 = +[AXSettings sharedInstance];
    id v10 = [v9 voiceOverTouchBrailleDisplayInputMode];
  }
  int64_t v11 = (int64_t)v10;

  return v11;
}

- (int64_t)activeBrailleOutputPreference
{
  v3 = [(VOTWorkspace *)self elementManager];
  unsigned __int8 v4 = [(VOTWorkspace *)self currentElement];
  v5 = [v3 determineActivityForElement:v4];

  double v6 = [v5 brailleOutput];

  if (v6)
  {
    double v7 = VOTLogActivities();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      unsigned __int8 v8 = [v5 brailleOutput];
      int v13 = 138412290;
      double v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Using activity braille output: %@", (uint8_t *)&v13, 0xCu);
    }
    BOOL v9 = [v5 brailleOutput];
    id v10 = [v9 integerValue];
  }
  else
  {
    BOOL v9 = +[AXSettings sharedInstance];
    id v10 = [v9 voiceOverTouchBrailleDisplayOutputMode];
  }
  int64_t v11 = (int64_t)v10;

  return v11;
}

- (BOOL)activeBrailleTextStatusCellPreference
{
  v3 = [(VOTWorkspace *)self elementManager];
  unsigned __int8 v4 = [(VOTWorkspace *)self currentElement];
  v5 = [v3 determineActivityForElement:v4];

  double v6 = [v5 brailleStatusCellText];

  if (v6)
  {
    double v7 = VOTLogActivities();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      unsigned __int8 v8 = [v5 brailleStatusCellText];
      int v13 = 138412290;
      double v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Using activity braille text status cell: %@", (uint8_t *)&v13, 0xCu);
    }
    BOOL v9 = [v5 brailleStatusCellText];
    unsigned __int8 v10 = [v9 BOOLValue];
  }
  else
  {
    BOOL v9 = +[AXSettings sharedInstance];
    unsigned __int8 v10 = [v9 voiceOverTouchBrailleShowTextStyleStatus];
  }
  BOOL v11 = v10;

  return v11;
}

- (BOOL)brailleAlertsEnabled
{
  return [(VOTWorkspace *)self activeBrailleAlertsPreference];
}

- (BOOL)activeBrailleAlertsPreference
{
  v3 = [(VOTWorkspace *)self elementManager];
  unsigned __int8 v4 = [(VOTWorkspace *)self currentElement];
  v5 = [v3 determineActivityForElement:v4];

  double v6 = [v5 brailleAlerts];

  if (v6)
  {
    double v7 = VOTLogActivities();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      unsigned __int8 v8 = [v5 brailleAlerts];
      int v12 = 138412290;
      int v13 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Using activity braille alerts: %@", (uint8_t *)&v12, 0xCu);
    }
    BOOL v9 = [v5 brailleAlerts];
    unsigned __int8 brailleAlertsEnabled = [v9 BOOLValue];
  }
  else
  {
    unsigned __int8 brailleAlertsEnabled = self->_brailleAlertsEnabled;
  }

  return brailleAlertsEnabled;
}

- (BOOL)activeBrailleGeneralStatusCellPreference
{
  v3 = [(VOTWorkspace *)self elementManager];
  unsigned __int8 v4 = [(VOTWorkspace *)self currentElement];
  v5 = [v3 determineActivityForElement:v4];

  double v6 = [v5 brailleStatusCellGeneral];

  if (v6)
  {
    double v7 = VOTLogActivities();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      unsigned __int8 v8 = [v5 brailleStatusCellGeneral];
      int v13 = 138412290;
      double v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Using activity braille general status cell: %@", (uint8_t *)&v13, 0xCu);
    }
    BOOL v9 = [v5 brailleStatusCellGeneral];
    unsigned __int8 v10 = [v9 BOOLValue];
  }
  else
  {
    BOOL v9 = +[AXSettings sharedInstance];
    unsigned __int8 v10 = [v9 voiceOverTouchBrailleShowGeneralStatus];
  }
  BOOL v11 = v10;

  return v11;
}

- (double)activeBrailleAutoAdvanceDuration
{
  v3 = [(VOTWorkspace *)self elementManager];
  unsigned __int8 v4 = [(VOTWorkspace *)self currentElement];
  v5 = [v3 determineActivityForElement:v4];

  double v6 = [v5 brailleAutoAdvanceDuration];

  if (v6)
  {
    double v7 = VOTLogActivities();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      unsigned __int8 v8 = [v5 brailleAutoAdvanceDuration];
      int v13 = 138412290;
      double v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Using activity braille auto advance duration: %@", (uint8_t *)&v13, 0xCu);
    }
    BOOL v9 = [v5 brailleAutoAdvanceDuration];
    [v9 doubleValue];
  }
  else
  {
    BOOL v9 = +[AXSettings sharedInstance];
    [v9 voiceOverBrailleAutoAdvanceDuration];
  }
  double v11 = v10;

  return v11;
}

- (void)_screenChange:(id)a3
{
  unsigned __int8 v4 = [(VOTWorkspace *)self elementManager];
  v5 = [(VOTWorkspace *)self currentElement];
  id v6 = [v4 determineActivityForElement:v5];

  if (v6) {
    [(VOTWorkspace *)self _updateActivityListeners];
  }
}

- (void)_tigrisMigrateLanguageRotors
{
  v2 = +[NSUserDefaults standardUserDefaults];
  v3 = [v2 objectForKey:@"_AccessibilityMigration_MigrateLanguageRotors_11.0"];
  unsigned __int8 v4 = [v3 BOOLValue];

  if ((v4 & 1) == 0)
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v5 = (id)_AXSVoiceOverTouchCopyLanguageRotorItems();
    id v6 = [v5 countByEnumeratingWithState:&v29 objects:v35 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v30;
      uint64_t v9 = AXSpeechSourceKeyVoiceOver;
      uint64_t v26 = *(void *)v30;
      id v27 = v5;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v30 != v8) {
            objc_enumerationMutation(v5);
          }
          double v11 = objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * i), "objectForKey:", @"RotorItem", v24, v25);
          int v12 = AXLanguageConvertToCanonicalForm();
          char v28 = 0;
          int v13 = +[AXSettings sharedInstance];
          double v14 = [v13 speechVoiceIdentifierForLanguage:v12 sourceKey:v9 exists:&v28];

          if (!v28)
          {
            uint64_t v15 = +[AXSettings sharedInstance];
            [v15 setSpeechVoiceIdentifier:v14 forLanguage:v12 sourceKey:v9];

            id v16 = +[AXSubsystemDataMigrator sharedInstance];
            unsigned __int8 v17 = [v16 ignoreLogging];

            if ((v17 & 1) == 0)
            {
              float v18 = +[AXSubsystemDataMigrator identifier];
              v19 = AXLoggerForFacility();

              os_log_type_t v20 = AXOSLogLevelFromAXLogLevel();
              if (os_log_type_enabled(v19, v20))
              {
                id v21 = AXColorizeFormatLog();
                v24 = v12;
                v25 = v14;
                v22 = _AXStringForArgs();
                if (os_log_type_enabled(v19, v20))
                {
                  *(_DWORD *)buf = 138543362;
                  dispatch_queue_t v34 = v22;
                  _os_log_impl((void *)&_mh_execute_header, v19, v20, "%{public}@", buf, 0xCu);
                }
              }
              uint64_t v8 = v26;
              id v5 = v27;
            }
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v29 objects:v35 count:16];
      }
      while (v7);
    }

    v23 = +[NSUserDefaults standardUserDefaults];
    [v23 setObject:&__kCFBooleanTrue forKey:@"_AccessibilityMigration_MigrateLanguageRotors_11.0"];
  }
}

- (void)_yukonMigrateLanguageRotors
{
  v2 = +[NSUserDefaults standardUserDefaults];
  v3 = [v2 objectForKey:@"_AccessibilityMigration_MigrateLanguageRotors_13.0"];
  unsigned __int8 v4 = [v3 BOOLValue];

  if ((v4 & 1) == 0)
  {
    char v17 = 0;
    id v5 = +[AXSettings sharedInstance];
    uint64_t v6 = AXSpeechSourceKeyVoiceOver;
    id v7 = [v5 speechVoiceIdentifierForLanguage:@"en-IN" sourceKey:AXSpeechSourceKeyVoiceOver exists:&v17];

    if (!v17)
    {
      uint64_t v8 = +[AXSettings sharedInstance];
      [(id)v8 setSpeechVoiceIdentifier:v7 forLanguage:@"en-IN" sourceKey:v6];

      uint64_t v9 = +[AXSubsystemDataMigrator sharedInstance];
      LOBYTE(v8) = [v9 ignoreLogging];

      if ((v8 & 1) == 0)
      {
        double v10 = +[AXSubsystemDataMigrator identifier];
        double v11 = AXLoggerForFacility();

        os_log_type_t v12 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v11, v12))
        {
          int v13 = AXColorizeFormatLog();
          id v16 = v7;
          double v14 = _AXStringForArgs();
          if (os_log_type_enabled(v11, v12))
          {
            *(_DWORD *)buf = 138543362;
            v19 = v14;
            _os_log_impl((void *)&_mh_execute_header, v11, v12, "%{public}@", buf, 0xCu);
          }
        }
      }
    }
    uint64_t v15 = +[NSUserDefaults standardUserDefaults];
    [v15 setObject:&__kCFBooleanTrue forKey:@"_AccessibilityMigration_MigrateLanguageRotors_13.0"];
  }
}

- (id)_assetUpdaterClient
{
  if (qword_1001EB8E8 != -1) {
    dispatch_once(&qword_1001EB8E8, &stru_1001B40B0);
  }
  v2 = (void *)qword_1001EB8E0;

  return v2;
}

- (BOOL)allowSingleLetterSearching
{
  v2 = +[AXSettings sharedInstance];
  unsigned __int8 v3 = [v2 voiceOverTouchSingleLetterQuickNavEnabled];

  return v3;
}

- (void)setAllowSingleLetterSearching:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[AXSettings sharedInstance];
  [v4 setVoiceOverTouchSingleLetterQuickNavEnabled:v3];
}

- (void)setTvInteractionModeWithoutSaving:(int64_t)a3
{
  self->_tvInteractionMode = a3;
}

- (void)setTvInteractionMode:(int64_t)a3
{
  self->_tvInteractionMode = a3;
  id v4 = +[AXSettings sharedInstance];
  [v4 setVoiceOverPreferredTVInteractionMode:a3];
}

- (int64_t)tvInteractionMode
{
  return self->_tvInteractionMode;
}

- (BOOL)perkinsKeyboardInputEnabled
{
  v2 = +[AXSettings sharedInstance];
  unsigned __int8 v3 = [v2 voiceOverTouchPerkinsKeyboardInputEnabled];

  return v3;
}

- (void)setPerkinsKeyboardInputEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[AXSettings sharedInstance];
  [v4 setVoiceOverTouchPerkinsKeyboardInputEnabled:v3];
}

- (BOOL)perkinsChordKeyboardInputEnabled
{
  v2 = +[AXSettings sharedInstance];
  unsigned __int8 v3 = [v2 voiceOverTouchPerkinsChordKeyboardInputEnabled];

  return v3;
}

- (void)setPerkinsChordKeyboardInputEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[AXSettings sharedInstance];
  [v4 setVoiceOverTouchPerkinsChordKeyboardInputEnabled:v3];
}

- (void)softwareKeyboardManagerWillUpdateKeyboardState:(id)a3
{
  int64_t triggeredKBAttachState = self->_triggeredKBAttachState;
  BOOL v5 = triggeredKBAttachState < 1;
  int64_t v6 = triggeredKBAttachState - 1;
  if (!v5)
  {
    self->_int64_t triggeredKBAttachState = v6;
    id v7 = VOTLogKeyboard();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int64_t v8 = self->_triggeredKBAttachState;
      int v21 = 134217984;
      int64_t v22 = v8;
      uint64_t v9 = "Triggered KB attach state count is: %ld";
      double v10 = v7;
      uint32_t v11 = 12;
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, v9, (uint8_t *)&v21, v11);
      goto LABEL_13;
    }
    goto LABEL_13;
  }
  os_log_type_t v12 = +[VOTCrashManager sharedInstance];
  if (![v12 didStartFromCrashState])
  {

    goto LABEL_9;
  }
  BOOL originalKBAttachedStateIsValid = self->_originalKBAttachedStateIsValid;

  if (originalKBAttachedStateIsValid)
  {
LABEL_9:
    float v18 = [(VOTWorkspace *)self softwareKeyboardManager];
    self->_BOOL originalKBAttachedState = [v18 isHardwareKeyboardAttached];

    id v16 = +[VOTConfiguration rootConfiguration];
    v19 = +[NSNumber numberWithBool:self->_originalKBAttachedState];
    [v16 setPreference:v19 forKey:@"kVOTOriginaKBAttachedKey"];

    goto LABEL_10;
  }
  double v14 = +[VOTConfiguration rootConfiguration];
  uint64_t v15 = [v14 preferenceForKey:@"kVOTOriginaKBAttachedKey"];
  self->_BOOL originalKBAttachedState = [v15 BOOLValue];

  id v16 = VOTLogKeyboard();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    BOOL originalKBAttachedState = self->_originalKBAttachedState;
    int v21 = 67109120;
    LODWORD(v22) = originalKBAttachedState;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Have to use what we stored for original KB state: %d", (uint8_t *)&v21, 8u);
  }
LABEL_10:

  self->_BOOL originalKBAttachedStateIsValid = 1;
  id v7 = VOTLogKeyboard();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    BOOL v20 = self->_originalKBAttachedState;
    int v21 = 67109120;
    LODWORD(v22) = v20;
    uint64_t v9 = "Original KB attached state is: %d";
    double v10 = v7;
    uint32_t v11 = 8;
    goto LABEL_12;
  }
LABEL_13:
}

- (BOOL)hasActive2DBrailleDisplay
{
  return [(id)_AXSVoiceOverTouchActive2DBrailleDisplays() count] != 0;
}

- (void)softwareKeyboardManager:(id)a3 didSetHardwareKeyboardAttached:(BOOL)a4
{
  self->_isPostingKeyboardEvents = a4;
}

- (void)softwareKeyboardManagerDidChangeHardwareKeyboardAttached:(id)a3
{
}

- (BOOL)softwareKeyboardManagerShouldSetHardwareKeyboardAttached:(id)a3 hardwareKeyboardIsCurrentlyAttached:(BOOL)a4 newHardwareKeyboardAttachedValue:(BOOL *)a5
{
  BOOL originalKBAttachedState = self->_originalKBAttachedState;
  if (originalKBAttachedState != a4) {
    *a5 = originalKBAttachedState;
  }
  return originalKBAttachedState != a4;
}

- (void)mlElementDetectorScrollToVisibleOccurred:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v5 = [(VOTWorkspace *)self elementManager];
  objc_msgSend(v5, "processExternalScrollToVisible:", x, y);
}

- (void)mlElementDetectorUpdatedElements
{
  BOOL v3 = AXMediaLogElementVision();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "ML elements updated, processing layout change", v5, 2u);
  }

  id v4 = [(VOTWorkspace *)self elementManager];
  [v4 processExternalElementUpdate];
}

- (void)mlElementDetectorReceivedFrames:(id)a3 labels:(id)a4 uiClasses:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint32_t v11 = AXMediaLogElementVision();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    os_log_type_t v12 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v8 count]);
    int v16 = 138412290;
    char v17 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "ML elements got some frames %@", (uint8_t *)&v16, 0xCu);
  }
  [(VOTWorkspace *)self automaticAccessibilityVisualizationsEnabled];
  if (v13 == 0.0)
  {
    uint64_t v15 = +[VOTDisplayManager displayManager];
    [v15 setElementFrames:&__NSArray0__struct];
  }
  else
  {
    double v14 = [(VOTWorkspace *)self elementManager];
    [v14 updateCurrentElementFrame];

    uint64_t v15 = +[VOTDisplayManager displayManager];
    [v15 setElementFrames:v8 labels:v9 uiClasses:v10];
  }
}

- (BOOL)usesDisplayManager
{
  return AXDeviceIsAudioAccessory() ^ 1;
}

- (void)_attemptRecoveryFromCrashloopDueToVoiceMemoryPressure
{
  BOOL v3 = VOTLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = &off_1001C50F8;
    __int16 v10 = 2112;
    uint32_t v11 = &off_1001C4F48;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "VoiceOver appears to be crashlooping (crashcount=%@ within %@s). Switching to the default voice to reduce memory pressure", (uint8_t *)&v8, 0x16u);
  }

  id v4 = [(id)VOTSharedWorkspace systemSpokenLanguage];
  if (v4)
  {
    [(VOTWorkspace *)self _replaceHighMemoryVoiceIDWithDefaultVoiceIDForLanguage:v4 preferredFallbackLanguage:v4];
    id v5 = AXLanguageCanonicalFormToGeneralLanguage();
    if (v5) {
      [(VOTWorkspace *)self _replaceHighMemoryVoiceIDWithDefaultVoiceIDForLanguage:v5 preferredFallbackLanguage:v4];
    }
  }
  int64_t v6 = [(id)VOTSharedWorkspace selectedLanguage];
  if (v6)
  {
    [(VOTWorkspace *)self _replaceHighMemoryVoiceIDWithDefaultVoiceIDForLanguage:v6 preferredFallbackLanguage:v6];
    id v7 = AXLanguageCanonicalFormToGeneralLanguage();
    if (v7) {
      [(VOTWorkspace *)self _replaceHighMemoryVoiceIDWithDefaultVoiceIDForLanguage:v7 preferredFallbackLanguage:v6];
    }
  }
}

- (void)_replaceHighMemoryVoiceIDWithDefaultVoiceIDForLanguage:(id)a3 preferredFallbackLanguage:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = VOTLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v22 = v5;
    __int16 v23 = 2112;
    id v24 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Check if we should replace hi-memory voice with default. Replacee:%@. Preferred:%@", buf, 0x16u);
  }

  int v8 = +[TTSAXResourceManager sharedInstance];
  id v9 = +[AXSettings sharedInstance];
  char v20 = 0;
  uint64_t v10 = AXSpeechSourceKeyVoiceOver;
  uint32_t v11 = [v9 speechVoiceIdentifierForLanguage:v5 sourceKey:AXSpeechSourceKeyVoiceOver exists:&v20];
  os_log_type_t v12 = VOTLogCommon();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Current voiceID for language to replace: %@", buf, 0xCu);
  }

  if (v11)
  {
    double v13 = [v8 speechVoiceWithVoiceId:v11];
    if ([v13 footprint] != (id)4 && objc_msgSend(v13, "footprint") != (id)5) {
      goto LABEL_19;
    }
    double v14 = VOTLogCommon();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Current voice appears to be high-memory: %@", buf, 0xCu);
    }

    uint64_t v15 = [v8 defaultVoiceForLanguage:v6];
    int v16 = [v15 identifier];
    char v17 = VOTLogCommon();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v15;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Default voice for preferred fallback language: %@", buf, 0xCu);
    }

    if (v16)
    {
      float v18 = v15;
    }
    else
    {
      float v18 = [v8 defaultVoiceForLanguage:v5];

      int v16 = [v18 identifier];
      v19 = VOTLogCommon();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v22 = v16;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Default voice for preferred fallback language was nil. Trying langaugeToReplace. Deafult voice: %@", buf, 0xCu);
      }

      if (!v16) {
        goto LABEL_18;
      }
    }
    [v9 setSpeechVoiceIdentifier:v16 forLanguage:v5 sourceKey:v10];

LABEL_18:
LABEL_19:
  }
}

- (void)_initialize
{
  if (AXDeviceIsAudioAccessory()) {
    _AXSVoiceOverTouchSetUsageConfirmed();
  }
  BOOL v3 = +[VOTCrashManager sharedInstance];
  [v3 handleStartUp];

  id v4 = +[VOTConfiguration rootConfiguration];
  [v4 setPreference:&__kCFBooleanTrue forKey:@"VOTIsRunningKey"];

  GSInitialize();
  +[AXEventKeyInfoRepresentation prepareForKeycodeTranslation];
  _AXSVoiceOverTouchSetActive2DBrailleDisplays();
  _AXSBrailleScreenInputSetEnabled();
  id v5 = (AXUISoftwareKeyboardManager *)objc_opt_new();
  softwareKeyboardManager = self->_softwareKeyboardManager;
  self->_softwareKeyboardManager = v5;

  [(AXUISoftwareKeyboardManager *)self->_softwareKeyboardManager setDelegate:self];
  +[AXUIElement applyElementAttributeCacheScheme:1];
  if ([(VOTWorkspace *)self usesDisplayManager])
  {
    id v7 = [objc_alloc((Class)AXMDisplayManager) initAndWaitForMainDisplayConfiguration];
    [(VOTWorkspace *)self setDisplayManager:v7];

    int v8 = [(VOTWorkspace *)self displayManager];
    sub_100050FCC(v8);

    double v9 = *(double *)&xmmword_1001EBE30;
    if (*(double *)&xmmword_1001EBE30 <= 0.0) {
      _AXAssert();
    }
    uint64_t v10 = +[NSNotificationCenter defaultCenter];
    uint32_t v11 = +[NSOperationQueue mainQueue];
    id v12 = [v10 addObserverForName:AXMDisplayManagerMainDisplayWasUpdatedNotification object:0 queue:v11 usingBlock:&stru_1001B40F0];
  }
  id v13 = [objc_alloc((Class)VOSCommandManager) initPreferringUserProfile];
  [(VOTWorkspace *)self setUserCommandManager:v13];

  objc_initWeak(&location, self);
  double v14 = +[AXSettings sharedInstance];
  v77[0] = _NSConcreteStackBlock;
  v77[1] = 3221225472;
  v77[2] = sub_100044C50;
  v77[3] = &unk_1001B35A8;
  objc_copyWeak(&v78, &location);
  id v15 = objc_loadWeakRetained(&location);
  [v14 registerUpdateBlock:v77 forRetrieveSelector:"voiceOverCustomCommandProfile" withListener:v15];

  objc_destroyWeak(&v78);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_100044CA8, @"DBSMagnifyModeDidChangeNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  if (_AXSVoiceOverTouchEnabled() || self->_inUnitTestMode)
  {
    self->_orientation = 1;
    self->_applicationOrientation = 1;
    self->_screenOn = 1;
    id v17 = +[VOTSystemServerInstance serverInstance];
    [(VOTWorkspace *)self updateSelectedLanguage];
    float v18 = (NSMutableDictionary *)[objc_allocWithZone((Class)NSMutableDictionary) init];
    appCache = self->_appCache;
    self->_appCache = v18;

    char v20 = +[NSMutableDictionary dictionary];
    appCacheWithExactPID = self->_appCacheWithExactPID;
    self->_appCacheWithExactPID = v20;

    self->_appCacheLock._os_unfair_lock_opaque = 0;
    sub_100052524();
    sub_1000525A4();
    [(VOTWorkspace *)self _migratePreferencesIfNeeded];
    [(VOTWorkspace *)self _registerForPreferenceChanges];
    id v22 = +[AXSettings sharedInstance];
    self->_textDetectionEnabled = [v22 voiceOverShouldSpeakDiscoveredText];

    __int16 v23 = +[AXSettings sharedInstance];
    self->_buttonIconDetectionEnabled = [v23 voiceOverAutomaticButtonLabels];

    id v24 = +[AXSettings sharedInstance];
    self->_imageCaptionsEnabled = [v24 voiceOverImageCaptionsEnabled];

    v25 = +[AXSettings sharedInstance];
    self->_customContentImportance = (unint64_t)[v25 voiceOverContentDescriptionLevel];

    uint64_t v26 = +[AXSettings sharedInstance];
    self->_id containerOutputFeedback = (int64_t)[v26 voiceOverContainerOutputFeedback];

    id v27 = +[AXSettings sharedInstance];
    self->_moreContentOutputFeedback = (int64_t)[v27 voiceOverMoreContentOutputFeedback];

    char v28 = +[AXSettings sharedInstance];
    self->_soundEffectsEnabled = [v28 voiceOverSoundEffectsEnabled];

    long long v29 = +[AXSettings sharedInstance];
    self->_numberFeedback = (int64_t)[v29 voiceOverNumberFeedback];

    long long v30 = +[AXSettings sharedInstance];
    self->_emojiFeedback = (int64_t)[v30 voiceOverVerbosityEmojiFeedback];

    long long v31 = +[AXSettings sharedInstance];
    self->_unsigned __int8 brailleAlertsEnabled = [v31 voiceOverBrailleAlertsEnabled];

    self->_typingMode = _AXSVoiceOverTouchTypingMode();
    +[AXUIMLElement setFrameDelegate:self];
    [(VOTWorkspace *)self systemSpokenLanguageChanged:0];
    long long v32 = +[VOTCrashManager sharedInstance];
    BOOL v33 = (uint64_t)[v32 consecutiveCrashCount] > 8;

    if (v33) {
      [(VOTWorkspace *)self _attemptRecoveryFromCrashloopDueToVoiceMemoryPressure];
    }
    id v34 = [objc_allocWithZone((Class)VOTElementManager) init];
    objc_storeStrong((id *)&self->_elementManager, v34);
    objc_storeStrong((id *)&self->_rotorManager, v34);
    objc_storeStrong((id *)&self->_directTouchManager, v34);
    v35 = +[VOTKeyboardManager keyboardManager];
    keyboardManager = self->_keyboardManager;
    self->_keyboardManager = v35;

    [(VOTKeyboardManager *)self->_keyboardManager setCommandManager:self->_userCommandManager];
    v37 = (VOTEventFactory *)[objc_allocWithZone((Class)VOTEventFactory) init];
    eventFactordouble y = self->_eventFactory;
    self->_eventFactordouble y = v37;

    [(VOTEventFactory *)self->_eventFactory setElementManager:self->_elementManager];
    [(VOTEventFactory *)self->_eventFactory setRotorManager:self->_rotorManager];
    [(VOTEventFactory *)self->_eventFactory setDirectTouchManager:self->_directTouchManager];
    [(VOTEventFactory *)self->_eventFactory setDelegate:self];
    self->_retryState.lastTime = -3061152000.0;
    self->_retryState.connected = 1;
    *(void *)&long long buf = kAXSVoiceOverTouchSpeakingRateChangedNotification;
    *((void *)&buf + 1) = kAXSVoiceOverTouchUsageConfirmedNotification;
    uint64_t v82 = kAXSVoiceOverTouchLanguageRotorChangedNotification;
    uint64_t v83 = kAXSVoiceOverTouchBrailleLanguageRotorChangedNotification;
    uint64_t v84 = kAXSVoiceOverTouchScreenCurtainNotification;
    CFStringRef v85 = @"com.apple.language.changed";
    CFStringRef v86 = @"com.apple.purplebuddy.LanguageResetReady";
    CFStringRef v87 = @"com.apple.preferences.sounds.changed";
    uint64_t v88 = kTTSPreferencesSpokenLanguageChangedNotification;
    v39 = CFNotificationCenterGetDarwinNotifyCenter();
    for (uint64_t i = 0; i != 72; i += 8)
      CFNotificationCenterAddObserver(v39, self, (CFNotificationCallback)sub_100044D04, *(CFStringRef *)((char *)&buf + i), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver(LocalCenter, self, (CFNotificationCallback)sub_100044D04, kAXSVoiceOverTouchEnabledNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v42 = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver(v42, self, (CFNotificationCallback)sub_100044D04, kAXSVoiceOverTouchTypingModeChangedNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    if (!_AXSApplicationAccessibilityEnabled()) {
      _AXSApplicationAccessibilitySetEnabled();
    }
    [(VOTWorkspace *)self setWasEnabledThroughAccessory:_AXSVoiceOverTouchEnabledThroughAccessory() != 0];
    AXPerformBlockOnMainThreadAfterDelay();
    if (![(VOTWorkspace *)self voiceOverIsConfirmed])
    {
      [(VOTWorkspace *)self performSelector:"_checkVoiceOverWasConfirmed" withObject:0 afterDelay:30.0];
      [(VOTWorkspace *)self performSelector:"_showConfirmPanel" withObject:0 afterDelay:0.5];
    }
    if (AXDeviceHasHomeButton()) {
      uint64_t IsPad = AXDeviceIsPad();
    }
    else {
      uint64_t IsPad = 1;
    }
    [(VOTWorkspace *)self setSupportsHomeGestures:IsPad];
    if ((AXDeviceHasHomeButton() & 1) == 0
      && !_AXSVoiceOverTouchUserHasReadNoHomeButtonGestureDescription())
    {
      [(VOTWorkspace *)self performSelector:"_showVOTNoHomeButtonGestureAlert" withObject:0 afterDelay:0.5];
    }
    v44 = +[NSNotificationCenter defaultCenter];
    unsigned __int8 v45 = +[AVSystemController sharedAVSystemController];
    uint64_t v80 = AVSystemController_ActiveAudioRouteDidChangeNotification;
    v46 = +[NSArray arrayWithObjects:&v80 count:1];
    [v45 setAttribute:v46 forKey:AVSystemController_SubscribeToNotificationsAttribute error:0];

    [v44 addObserver:self selector:"_activeAudioRouteChanged:" name:AVSystemController_ActiveAudioRouteDidChangeNotification object:v45];
    [v44 addObserver:self selector:"_localeChanged:" name:NSCurrentLocaleDidChangeNotification object:0];
    [(VOTWorkspace *)self _activeAudioRouteChanged:0];
    [(VOTWorkspace *)self _preferencesTypingPitchChange];
    [(VOTWorkspace *)self preferencesLanguageRotorItemsChanged:0];
    [(VOTWorkspace *)self preferencesBrailleLanguageRotorItemsChanged:0];
    [(VOTWorkspace *)self _preferencesSpeakingRateInRotorChanged];
    [(VOTWorkspace *)self _preferencesAlwaysUseNemethForMathChange];
    [(VOTWorkspace *)self _preferencesSpeakHintsChange];
    [(VOTWorkspace *)self _preferencesNavigateImagesOptionChange];
    [(VOTWorkspace *)self _preferencesSpeakNotifications];
    [(VOTWorkspace *)self preferencesKeyboardClickStatusChange:0];
    [(VOTWorkspace *)self handleRingerSwitchSwitched:0];
    [(VOTWorkspace *)self _preferencesActivitiesChanged];
    [(VOTWorkspace *)self _preferencesSelectedActivityChanged];
    [(VOTWorkspace *)self _preferencesCaptionPanelChanged];
    [(VOTWorkspace *)self _preferencesSelectedLanguageChanged];
    [(VOTWorkspace *)self _selectedBrailleTableChanged];
    [(VOTWorkspace *)self _selectedBrailleInputTableChanged];
    [(VOTWorkspace *)self _selectedBrailleGesturesInputTableChanged];
    v47 = +[AXSettings sharedInstance];
    self->_navigationStyle = (int64_t)[v47 voiceOverNavigationStyle];

    os_log_type_t v48 = +[AXSettings sharedInstance];
    -[VOTWorkspace setNavigationDirection:](self, "setNavigationDirection:", [v48 voiceOverNavigationDirectionMode]);

    v49 = +[AXSettings sharedInstance];
    -[VOTWorkspace setUpdateRotorWithElement:](self, "setUpdateRotorWithElement:", [v49 voiceOverRotorUpdatesWithElement]);

    [(VOTWorkspace *)self _sendGreetingMessage];
    [(VOTWorkspace *)self _registerWithSystem];
    [(VOTWorkspace *)self _registerForUserSwitches];
    v50 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(v50, kAXSVoiceOverLaunchedNotification, 0, 0, 1u);
    v51 = +[NSDistributedNotificationCenter defaultCenter];
    uint64_t v52 = AXSSVoiceOverPunctuationGroupsChangedNotification;
    [v51 addObserver:self selector:"punctuationGroupsChanged:" name:AXSSVoiceOverPunctuationGroupsChangedNotification object:0];

    v53 = +[NSNotificationCenter defaultCenter];
    [v53 addObserver:self selector:"punctuationGroupsChanged:" name:v52 object:0];

    v54 = +[VOTElement systemWideElement];
    [v54 sendTouchCancelledEvent];

    char v76 = 0;
    if (!_AXSAccessibilityGetBooleaniTunesPreference()) {
      AXPerformBlockOnMainThreadAfterDelay();
    }
    if (AXInPreboardScenario())
    {
      id v55 = +[VOTOutputManager outputManager];
      LODWORD(v56) = 0.75;
      [v55 setSystemVolume:v56];

      v57 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterAddObserver(v57, 0, (CFNotificationCallback)sub_10004506C, AXInPreBoardScenarioUpdatedNotification, 0, CFNotificationSuspensionBehaviorCoalesce);
    }
    [(VOTWorkspace *)self _updatePointerVoiceOverOptions];
    v58 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v58, self, (CFNotificationCallback)sub_1000451D0, kAXSPointerVoiceOverCursorOptionPreferenceDidChangeNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v59 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v59, self, (CFNotificationCallback)sub_1000451D0, kAXSVoiceOverSpeakUnderPointerPreferenceDidChangeNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v60 = +[VOTDebugManager sharedInstance];
    [v60 setElementManager:self->_elementManager];
    v61 = +[AXSettings sharedInstance];
    unsigned int v62 = [v61 voiceOverAlwaysTurnOnBluetooth];

    if (v62)
    {
      v75[5] = _NSConcreteStackBlock;
      v75[6] = 3221225472;
      v75[7] = sub_1000451DC;
      v75[8] = &unk_1001B33B8;
      v75[9] = self;
      AXPerformBlockOnMainThreadAfterDelay();
    }
    [(VOTWorkspace *)self _registerForExternalDevices];
    [(VOTWorkspace *)self performSelector:"_registerForExternalDevices" withObject:0 afterDelay:5.0];
    v63 = +[NSNotificationCenter defaultCenter];
    v64 = +[AVOutputContext sharedSystemAudioContext];
    v75[0] = _NSConcreteStackBlock;
    v75[1] = 3221225472;
    v75[2] = sub_1000451E4;
    v75[3] = &unk_1001B33E0;
    v75[4] = self;
    id v65 = [v63 addObserverForName:AVOutputContextOutputDeviceDidChangeNotification object:v64 queue:0 usingBlock:v75];

    [(VOTWorkspace *)self _handleOnenessCheck];
    v66 = VOTLogElement();
    if (os_signpost_enabled(v66))
    {
      *(_WORD *)v74 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v66, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "VOT-Startup", "", v74, 2u);
    }
  }
  else
  {
    v67 = +[AXSubsystemVoiceOverLifeCycle sharedInstance];
    unsigned __int8 v68 = [v67 ignoreLogging];

    if ((v68 & 1) == 0)
    {
      v69 = +[AXSubsystemVoiceOverLifeCycle identifier];
      v70 = AXLoggerForFacility();

      os_log_type_t v71 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v70, v71))
      {
        v72 = AXColorizeFormatLog();
        v73 = _AXStringForArgs();
        if (os_log_type_enabled(v70, v71))
        {
          LODWORD(buf) = 138543362;
          *(void *)((char *)&buf + 4) = v73;
          _os_log_impl((void *)&_mh_execute_header, v70, v71, "%{public}@", (uint8_t *)&buf, 0xCu);
        }
      }
    }
    _AXSVoiceOverTouchSetEnabled();
    [(VOTWorkspace *)self stop:1];
  }
  objc_destroyWeak(&location);
}

- (void)_initializeCaptionModel
{
  BOOL v3 = VOTLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting caption model retrieval", v7, 2u);
  }

  id v4 = [(VOTWorkspace *)self imageCaptionModelAssetPolicy];
  id v5 = +[AXAssetController assetControllerWithPolicy:v4 qosClass:25];
  assetController = self->_assetController;
  self->_assetController = v5;

  [(AXAssetController *)self->_assetController setUserInitiated:1];
  [(AXAssetController *)self->_assetController addObserver:self];
  [(AXAssetController *)self->_assetController refreshAssetsByForceUpdatingCatalog:1 updatingCatalogIfNeeded:1 catalogRefreshOverrideTimeout:0 completion:0];
}

- (id)imageCaptionModelAssetPolicy
{
  return +[AXImageCaptionModelAssetPolicy policy];
}

- (void)_handleOnenessCheck
{
  BOOL v3 = +[AVOutputContext sharedAudioPresentationOutputContext];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = objc_msgSend(v3, "outputDevices", 0);
  uint64_t v5 = (uint64_t)[v4 countByEnumeratingWithState:&v10 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        if ([*(id *)(*((void *)&v10 + 1) + 8 * i) isActivatedForContinuityScreen])
        {
          uint64_t v5 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = (uint64_t)[v4 countByEnumeratingWithState:&v10 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  int v8 = VOTLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    double v9 = +[NSNumber numberWithBool:v5];
    *(_DWORD *)long long buf = 138412290;
    id v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Oneness active: %@", buf, 0xCu);
  }
  [(VOTWorkspace *)self setIsOnenessActive:v5];
}

- (void)_handleBluetoothEnablement
{
  v2 = +[VOSBluetoothManager sharedInstance];
  id v3 = [v2 enabled];

  id v4 = VOTLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = +[NSNumber numberWithBool:v3];
    int v7 = 138412290;
    int v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Checking for whether Bluetooth needs to be enabled: enabled: %@", (uint8_t *)&v7, 0xCu);
  }
  if ((v3 & 1) == 0)
  {
    uint64_t v6 = +[AXSpringBoardServer server];
    [v6 setBluetoothPowerEnabled:1];
  }
}

- (void)_updatePointerVoiceOverOptions
{
  [(VOTWorkspace *)self setPointerVoiceOverCursorOption:_AXSPointerVoiceOverCursorOption()];
  [(VOTWorkspace *)self setSpeakUnderPointer:_AXSVoiceOverSpeakUnderPointerEnabled() != 0];
  _AXSVoiceOverSpeakUnderPointerDelay();
  double v4 = v3;

  [(VOTWorkspace *)self setSpeakUnderPointerDelay:v4];
}

- (void)_migratePreferencesIfNeeded
{
  v2 = (void *)CFPreferencesCopyAppValue(@"VoiceOverTypingMode", @"com.apple.VoiceOverTouch");
  if (v2)
  {
    id v3 = v2;
    [v2 integerValue];
    _AXSVoiceOverTouchSetTypingMode();
    CFPreferencesSetAppValue(@"VoiceOverTypingMode", 0, @"com.apple.VoiceOverTouch");
    v2 = v3;
  }
}

- (void)_registerForUserSwitches
{
  id v3 = +[UMUserManager sharedManager];
  [v3 registerUserSwitchStakeHolder:self];
}

- (void)willSwitchUser
{
  if ((AXDeviceIsMultiUser() & 1) == 0) {
    _AXAssert();
  }
  AXSessionIsLoginSession();
}

- (void)_handleReachabilityChanges
{
  id v3 = [(VOTWorkspace *)self reachabilityIdentifier];

  if (!v3)
  {
    double v4 = +[AXSpringBoardServer server];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100045BB4;
    v6[3] = &unk_1001B41A8;
    v6[4] = self;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100045DA8;
    v5[3] = &unk_1001B41D0;
    v5[4] = self;
    [v4 registerReachabilityHandler:v6 withIdentifierCallback:v5];
  }
}

- (void)_registerForPreferenceChanges
{
  id v3 = +[AXSettings sharedInstance];
  [v3 registerUpdateBlock:&stru_1001B41F0 forRetrieveSelector:"enableVoiceOverCaptions" withListener:self];

  double v4 = +[AXSettings sharedInstance];
  [v4 registerUpdateBlock:&stru_1001B4210 forRetrieveSelector:"speakCorrectionsEnabled" withListener:self];

  uint64_t v5 = +[AXSettings sharedInstance];
  [v5 registerUpdateBlock:&stru_1001B4230 forRetrieveSelector:"voiceOverHintsEnabled" withListener:self];

  uint64_t v6 = +[AXSettings sharedInstance];
  [v6 registerUpdateBlock:&stru_1001B4250 forRetrieveSelector:"voiceOverPitchChangeEnabled" withListener:self];

  int v7 = +[AXSettings sharedInstance];
  [v7 registerUpdateBlock:&stru_1001B4270 forRetrieveSelector:"voiceOverBannerNotificationOutput" withListener:self];

  int v8 = +[AXSettings sharedInstance];
  [v8 registerUpdateBlock:&stru_1001B4290 forRetrieveSelector:"voiceOverLockedScreenNotificationOutput" withListener:self];

  double v9 = +[AXSettings sharedInstance];
  [v9 registerUpdateBlock:&stru_1001B42B0 forRetrieveSelector:"voiceOverUseRingerSwitchToControlNotificationOutput" withListener:self];

  long long v10 = +[AXSettings sharedInstance];
  [v10 registerUpdateBlock:&stru_1001B42D0 forRetrieveSelector:"voiceOverSpeakingRateInRotorEnabled" withListener:self];

  long long v11 = +[AXSettings sharedInstance];
  [v11 registerUpdateBlock:&stru_1001B42F0 forRetrieveSelector:"voiceOverNavigateImagesOption" withListener:self];

  long long v12 = +[AXSettings sharedInstance];
  [v12 registerUpdateBlock:&stru_1001B4310 forRetrieveSelector:"voiceOverSpeakingRateForLanguage:" withListener:self];

  long long v13 = +[AXSettings sharedInstance];
  [v13 registerUpdateBlock:&stru_1001B4330 forRetrieveSelector:"voiceOverAlwaysUseNemethCodeForMathEnabled" withListener:self];

  double v14 = +[AXSettings sharedInstance];
  [v14 registerUpdateBlock:&stru_1001B4350 forRetrieveSelector:"voiceOverUseDigitalCrownNavigation" withListener:self];

  id v15 = +[AXSettings sharedInstance];
  [v15 registerUpdateBlock:&stru_1001B4370 forRetrieveSelector:"voiceOverActivities" withListener:self];

  int v16 = +[AXSettings sharedInstance];
  [v16 registerUpdateBlock:&stru_1001B4390 forRetrieveSelector:"voiceOverSelectedActivity" withListener:self];

  id v17 = +[AXSettings sharedInstance];
  v55[0] = _NSConcreteStackBlock;
  v55[1] = 3221225472;
  v55[2] = sub_100046854;
  v55[3] = &unk_1001B33B8;
  v55[4] = self;
  [v17 registerUpdateBlock:v55 forRetrieveSelector:"voiceOverDefaultPunctuationGroup" withListener:self];

  float v18 = +[AXSettings sharedInstance];
  v54[0] = _NSConcreteStackBlock;
  v54[1] = 3221225472;
  v54[2] = sub_100046864;
  v54[3] = &unk_1001B33B8;
  v54[4] = self;
  [v18 registerUpdateBlock:v54 forRetrieveSelector:"voiceOverImageCaptionsEnabled" withListener:self];

  v19 = +[AXSettings sharedInstance];
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v53[2] = sub_1000468C0;
  v53[3] = &unk_1001B33B8;
  v53[4] = self;
  [v19 registerUpdateBlock:v53 forRetrieveSelector:"voiceOverShouldSpeakDiscoveredText" withListener:self];

  char v20 = +[AXSettings sharedInstance];
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = sub_10004691C;
  v52[3] = &unk_1001B33B8;
  v52[4] = self;
  [v20 registerUpdateBlock:v52 forRetrieveSelector:"voiceOverAutomaticButtonLabels" withListener:self];

  int v21 = +[AXSettings sharedInstance];
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472;
  v51[2] = sub_100046978;
  v51[3] = &unk_1001B33B8;
  v51[4] = self;
  [v21 registerUpdateBlock:v51 forRetrieveSelector:"voiceOverContentDescriptionLevel" withListener:self];

  id v22 = +[AXSettings sharedInstance];
  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472;
  v50[2] = sub_1000469D4;
  v50[3] = &unk_1001B33B8;
  v50[4] = self;
  [v22 registerUpdateBlock:v50 forRetrieveSelector:"voiceOverContainerOutputFeedback" withListener:self];

  __int16 v23 = +[AXSettings sharedInstance];
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_100046A30;
  v49[3] = &unk_1001B33B8;
  v49[4] = self;
  [v23 registerUpdateBlock:v49 forRetrieveSelector:"voiceOverMoreContentOutputFeedback" withListener:self];

  id v24 = +[AXSettings sharedInstance];
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472;
  v48[2] = sub_100046A8C;
  v48[3] = &unk_1001B33B8;
  v48[4] = self;
  [v24 registerUpdateBlock:v48 forRetrieveSelector:"voiceOverSoundEffectsEnabled" withListener:self];

  v25 = +[AXSettings sharedInstance];
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_100046AE8;
  v47[3] = &unk_1001B33B8;
  v47[4] = self;
  [v25 registerUpdateBlock:v47 forRetrieveSelector:"voiceOverNumberFeedback" withListener:self];

  uint64_t v26 = +[AXSettings sharedInstance];
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_100046B44;
  v46[3] = &unk_1001B33B8;
  v46[4] = self;
  [v26 registerUpdateBlock:v46 forRetrieveSelector:"voiceOverVerbosityEmojiFeedback" withListener:self];

  id v27 = +[AXSettings sharedInstance];
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_100046BA0;
  v45[3] = &unk_1001B33B8;
  v45[4] = self;
  [v27 registerUpdateBlock:v45 forRetrieveSelector:"voiceOverBrailleAlertsEnabled" withListener:self];

  char v28 = +[AXSettings sharedInstance];
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_100046BFC;
  v44[3] = &unk_1001B33B8;
  v44[4] = self;
  [v28 registerUpdateBlock:v44 forRetrieveSelector:"imageCaptioningDisabledApps" withListener:self];

  long long v29 = +[AXSettings sharedInstance];
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_100046C64;
  v43[3] = &unk_1001B33B8;
  v43[4] = self;
  [v29 registerUpdateBlock:v43 forRetrieveSelector:"automaticAccessibilityEnabled" withListener:self];

  long long v30 = +[AXSettings sharedInstance];
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_100046CC4;
  v42[3] = &unk_1001B33B8;
  v42[4] = self;
  [v30 registerUpdateBlock:v42 forRetrieveSelector:"automaticAccessibilityVisualizationsEnabled" withListener:self];

  long long v31 = +[AXSettings sharedInstance];
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_100046D24;
  v41[3] = &unk_1001B33B8;
  v41[4] = self;
  [v31 registerUpdateBlock:v41 forRetrieveSelector:"voiceOverNavigationStyle" withListener:self];

  long long v32 = +[AXSettings sharedInstance];
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_100046D84;
  v40[3] = &unk_1001B33B8;
  v40[4] = self;
  [v32 registerUpdateBlock:v40 forRetrieveSelector:"voiceOverNavigationDirectionMode" withListener:self];

  BOOL v33 = +[AXSettings sharedInstance];
  [v33 registerUpdateBlock:&stru_1001B43B0 forRetrieveSelector:"voiceOverSelectedLanguage" withListener:self];

  id v34 = +[AXSettings sharedInstance];
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_100046DF0;
  v39[3] = &unk_1001B33B8;
  v39[4] = self;
  [v34 registerUpdateBlock:v39 forRetrieveSelector:"voiceOverRotorUpdatesWithElement" withListener:self];

  v35 = +[AXSettings sharedInstance];
  [v35 registerUpdateBlock:&stru_1001B43D0 forRetrieveSelector:"voiceOverBrailleTableIdentifier" withListener:self];

  v36 = +[AXSettings sharedInstance];
  [v36 registerUpdateBlock:&stru_1001B43F0 forRetrieveSelector:"voiceOverTouchBrailleDisplayOutputTableIdentifier" withListener:self];

  v37 = +[AXSettings sharedInstance];
  [v37 registerUpdateBlock:&stru_1001B4410 forRetrieveSelector:"voiceOverTouchBrailleDisplayInputTableIdentifier" withListener:self];

  v38 = +[AXSettings sharedInstance];
  [v38 registerUpdateBlock:&stru_1001B4430 forRetrieveSelector:"voiceOverTouchBrailleGesturesInputTableIdentifier" withListener:self];
}

- (void)dealloc
{
  id v3 = (void *)VOTSharedWorkspace;
  VOTSharedWorkspace = 0;

  double v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  [(NSLock *)self->_systemLangaugeLock lock];
  [(NSLock *)self->_systemLangaugeLock unlock];
  v6.receiver = self;
  v6.super_class = (Class)VOTWorkspace;
  [(VOTWorkspace *)&v6 dealloc];
}

- (void)_preferencesSelectedActivityChanged
{
  id v3 = +[AXSettings sharedInstance];
  uint64_t v4 = [v3 voiceOverSelectedActivity];

  uint64_t v5 = self;
  objc_sync_enter(v5);
  selectedActivitdouble y = v5->_selectedActivity;
  v5->_selectedActivitdouble y = (AXVoiceOverActivity *)v4;

  objc_sync_exit(v5);

  [(VOTWorkspace *)v5 _updateActivityListeners];
}

- (void)_preferencesSelectedLanguageChanged
{
}

- (void)currentElementDidUpdate:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  AXPerformBlockAsynchronouslyOnMainThread();
}

- (void)addMisspellingsForString:(id)a3
{
  id v3 = a3;
  if ([v3 hasAttribute:UIAccessibilityTokenResolveMisspelledLocally])
  {
    id v4 = (char *)[v3 length];
    uint64_t v5 = +[UIKeyboardInputModeController sharedInputModeController];
    objc_super v6 = 0;
    *(void *)&long long v7 = 138412290;
    long long v17 = v7;
    while (1)
    {
      int v8 = objc_msgSend(v5, "currentInputMode", v17);
      if (!v8)
      {
        int v8 = [v5 currentSystemInputMode];
      }
      textChecker = self->_textChecker;
      long long v10 = [v8 primaryLanguage];
      long long v11 = (char *)-[UITextChecker rangeOfMisspelledWordInString:range:startingAt:wrap:language:](textChecker, "rangeOfMisspelledWordInString:range:startingAt:wrap:language:", v3, 0, v4, v6, 0, v10);
      NSUInteger v13 = v12;

      if (v11 == (char *)0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      v21.id location = 0;
      v21.length = (NSUInteger)v4;
      v22.id location = (NSUInteger)v11;
      v22.length = v13;
      NSRange v14 = NSIntersectionRange(v21, v22);
      objc_msgSend(v3, "addAttribute:forKey:withRange:", kCFBooleanTrue, UIAccessibilityTokenMisspelled, v14.location, v14.length);
      id v15 = AXLogCommon();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = objc_msgSend(v3, "substringWithRange:", v14.location, v14.length);
        *(_DWORD *)long long buf = v17;
        char v20 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "added: %@", buf, 0xCu);
      }
      objc_super v6 = &v11[v13];

      if (v6 >= v4) {
        goto LABEL_11;
      }
    }

LABEL_11:
  }
}

- (void)_updateActivityListeners
{
  v2 = +[VOTBrailleManager manager];
  [v2 updateStatusCellPrefs];

  id v3 = +[VOTBrailleManager manager];
  [v3 updateBrailleInputSettings];

  id v4 = +[VOTBrailleManager manager];
  [v4 updateBrailleOutputSettings];

  uint64_t v5 = +[VOTBrailleManager manager];
  [v5 updateBrailleLanguage];

  objc_super v6 = +[VOTBrailleManager manager];
  [v6 updateBrailleAutoAdvancePrefs];

  id v7 = +[VOTBrailleManager manager];
  [v7 updatePrefersNonBlinkingCursorIndicatorPrefs];
}

- (void)_preferencesActivitiesChanged
{
  id v3 = +[AXSettings sharedInstance];
  id v4 = [v3 voiceOverActivities];
  id v5 = [v4 copy];

  objc_super v6 = VOTLogActivities();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v15 = 138412290;
    id v16 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Activities changed: new: %@", (uint8_t *)&v15, 0xCu);
  }

  id v7 = self;
  objc_sync_enter(v7);
  [(VOTWorkspace *)v7 setActivities:v5];
  if (v7->_selectedActivity)
  {
    int v8 = [(VOTWorkspace *)v7 activities];
    id v9 = [v8 indexOfObject:v7->_selectedActivity];

    if (v9 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      selectedActivitdouble y = v7->_selectedActivity;
      v7->_selectedActivitdouble y = 0;
    }
    else
    {
      selectedActivitdouble y = [(VOTWorkspace *)v7 activities];
      uint64_t v11 = [selectedActivity objectAtIndexedSubscript:v9];
      NSUInteger v12 = v7->_selectedActivity;
      v7->_selectedActivitdouble y = (AXVoiceOverActivity *)v11;
    }
  }
  objc_sync_exit(v7);

  NSUInteger v13 = VOTLogActivities();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    NSRange v14 = [(VOTWorkspace *)v7 activities];
    int v15 = 138412290;
    id v16 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "VO loading activities: %@", (uint8_t *)&v15, 0xCu);
  }
}

- (AXVoiceOverActivity)selectedActivity
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_selectedActivity;
  objc_sync_exit(v2);

  return v3;
}

- (NSString)previousRotorVoiceIdentifier
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_previousRotorVoiceIdentifier;
  objc_sync_exit(v2);

  return v3;
}

- (NSArray)activities
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = [(NSArray *)v2->_activities copy];
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (void)_registerForExternalDevices
{
  id v3 = +[VOTExternalAccessoryManager accessoryManager];
  [v3 startListening];

  id v4 = +[VOTExternalAccessoryManager accessoryManager];
  [v4 setElementManager:self->_elementManager];
}

- (void)setCurrentRotorDetectionMode:(int)a3
{
  self->_currentRotorDetectionMode = a3;
}

- (int)currentRotorDetectionMode
{
  return self->_currentRotorDetectionMode;
}

- (BOOL)isSystemWideServerAlive
{
  return self->_retryState.connected;
}

- (void)handleSystemWideServerDied
{
  id v3 = +[AXSubsystemVoiceOver sharedInstance];
  unsigned __int8 v4 = [v3 ignoreLogging];

  if ((v4 & 1) == 0)
  {
    id v5 = +[AXSubsystemVoiceOver identifier];
    objc_super v6 = AXLoggerForFacility();

    os_log_type_t v7 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v6, v7))
    {
      int v8 = AXColorizeFormatLog();
      BOOL connected = self->_retryState.connected;
      id v9 = _AXStringForArgs();
      if (os_log_type_enabled(v6, v7))
      {
        *(_DWORD *)long long buf = 138543362;
        char v20 = v9;
        _os_log_impl((void *)&_mh_execute_header, v6, v7, "%{public}@", buf, 0xCu);
      }
    }
  }
  if (self->_retryState.connected)
  {
    self->_retryState.lastRecordedTimeOfDeath = CFAbsoluteTimeGetCurrent();
    self->_retryState.BOOL connected = 0;
    long long v10 = +[VOTSpringBoardConnection defaultConnection];
    [v10 informConnectionDied];

    [(VOTEventFactory *)self->_eventFactory resetEventFactory];
    [(VOTElementManagementProtocol *)self->_elementManager systemServerDied];
  }
  uint64_t v11 = [(VOTWorkspace *)self reachabilityIdentifier];

  if (v11)
  {
    NSUInteger v12 = +[AXSpringBoardServer server];
    NSUInteger v13 = [(VOTWorkspace *)self reachabilityIdentifier];
    [v12 removeReachabilityHandler:v13];

    [(VOTWorkspace *)self setReachabilityIdentifier:0];
  }
  [(VOTEventFactory *)self->_eventFactory unregisterForEvents];
  +[VOTElement resetSystemAppElement];
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  if (Current - self->_retryState.lastTime > 60.0)
  {
    self->_retryState.deladouble y = 0.5;
    self->_retryState.count = 1;
LABEL_14:
    deladouble y = self->_retryState.delay;
    goto LABEL_15;
  }
  unsigned int v15 = self->_retryState.count + 1;
  self->_retryState.count = v15;
  HIDWORD(v16) = -858993459 * v15;
  LODWORD(v16) = -858993459 * v15;
  if ((v16 >> 1) >= 0x1999999A) {
    goto LABEL_14;
  }
  self->_retryState.count = 0;
  deladouble y = self->_retryState.delay + self->_retryState.delay;
  self->_retryState.deladouble y = delay;
LABEL_15:
  if (delay > 5.0)
  {
    self->_retryState.deladouble y = 5.0;
    deladouble y = 5.0;
  }
  self->_retryState.lastTime = Current;
  [(VOTWorkspace *)self performSelector:"_registerWithSystem" withObject:0 afterDelay:delay];
}

- (BOOL)isAccessibilityEnabled
{
  return AXAPIEnabled() != 0;
}

- (BOOL)isVoiceOverTouchPreferenceEnabled
{
  return _AXSVoiceOverTouchEnabled() != 0;
}

- (void)_registerWithSpringBoard
{
  id v3 = +[VOTSpringBoardConnection defaultConnection];
  if ([v3 isConnected] & 1) != 0 || (AXInPreboardScenario())
  {
  }
  else
  {
    char v7 = AXInCheckerBoardScenario();

    if ((v7 & 1) == 0)
    {
      int v8 = +[VOTSpringBoardConnection defaultConnection];
      [v8 restartConnection];

      AXPerformBlockOnMainThreadAfterDelay();
      return;
    }
  }
  if (!self->_screenCurtainEnabled)
  {
    if (_AXSVoiceOverTouchUsageConfirmed())
    {
      unsigned __int8 v4 = +[VOTConfiguration rootConfiguration];
      id v5 = [v4 preferenceForKey:@"ScreenCurtain"];

      if (v5)
      {
        [v5 BOOLValue];
        _AXSVoiceOverTouchSetScreenCurtainEnabled();
        objc_super v6 = +[VOTConfiguration rootConfiguration];
        [v6 setPreference:0 forKey:@"ScreenCurtain"];
      }
      [(VOTWorkspace *)self _updateScreenCurtainEnabled:0];
    }
    else
    {
      _AXSVoiceOverTouchSetScreenCurtainEnabled();
    }
  }
  double lastRecordedTimeOfDeath = self->_retryState.lastRecordedTimeOfDeath;
  long long v10 = VOTLogLifeCycle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 67109120;
    BOOL v22 = lastRecordedTimeOfDeath > -3061152000.0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Will force screen curtain update %d", buf, 8u);
  }

  [(VOTWorkspace *)self _updateScreenCurtainEnabled:lastRecordedTimeOfDeath > -3061152000.0];
  uint64_t v11 = +[VOTConfiguration rootConfiguration];
  NSUInteger v12 = [v11 preferenceForKey:@"DeviceRotation"];

  if (v12)
  {
    id v13 = [v12 BOOLValue];
    NSRange v14 = +[VOTElement systemWideElement];
    [v14 setRotationCapabilityEnabled:v13];
  }
  else
  {
    LOBYTE(v13) = 1;
  }
  unsigned int v15 = +[VOTElement springBoardApplication];
  unsigned __int8 v16 = [v15 isSystemSleeping];

  if ((v16 & 1) == 0)
  {
    id v17 = +[VOTOutputRequest createRequest];
    if ((v13 & 1) == 0)
    {
      float v18 = [(id)VOTSharedWorkspace selectedLanguage];
      v19 = sub_100051D04(off_1001EA9E8, @"rotation.capability.off", 0, v18);
      id v20 = [v17 addString:v19 withLanguage:v18];
    }
    if ([v17 containsActions])
    {
      [v17 setGeneratesBraille:1];
      [v17 send];
    }
  }
  [(VOTWorkspace *)self _handleReachabilityChanges];
  self->_retryState.double lastRecordedTimeOfDeath = -3061152000.0;
}

- (void)_updateScreenCurtainEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  int screenCurtainEnabled = self->_screenCurtainEnabled;
  if (screenCurtainEnabled != _AXSVoiceOverTouchScreenCurtainEnabled() || v3)
  {
    if (_AXSVoiceOverTouchUsageConfirmed()) {
      self->_int screenCurtainEnabled = _AXSVoiceOverTouchScreenCurtainEnabled() != 0;
    }
    char v7 = +[VOTSpringBoardConnection defaultConnection];
    [v7 setScreenCurtainEnabled:self->_screenCurtainEnabled];

    int v8 = +[VOTDisplayManager displayManager];
    [v8 setScreenCurtainEnabled:self->_screenCurtainEnabled];

    if (!v3)
    {
      id v9 = +[VOTOutputManager outputManager];
      if (self->_screenCurtainEnabled) {
        long long v10 = @"screen.curtain.on";
      }
      else {
        long long v10 = @"screen.curtain.off";
      }
      uint64_t v11 = sub_100051804(off_1001EA9E8, v10, 0);
      [v9 speakSimpleString:v11];
    }
    NSUInteger v12 = VOTLogLifeCycle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      BOOL v13 = self->_screenCurtainEnabled;
      v14[0] = 67109376;
      v14[1] = v3;
      __int16 v15 = 1024;
      BOOL v16 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Updating screen curtain[%d] to value %d", (uint8_t *)v14, 0xEu);
    }
  }
}

- (void)_registerWithSystem
{
  if (![(VOTWorkspace *)self inUnitTestMode]
    && [(VOTEventFactory *)self->_eventFactory registerForEvents]
    && (AXInPreboardScenario() & 1) == 0
    && (AXInCheckerBoardScenario() & 1) == 0
    && (AXDeviceIsAudioAccessory() & 1) == 0)
  {
    if (self->_retryState.connected) {
      [(VOTElementManagementProtocol *)self->_elementManager voiceOverDidRegisterWithSystem];
    }
    else {
      self->_retryState.BOOL connected = 1;
    }
    +[NSThread sleepForTimeInterval:0.25];
    BOOL v3 = +[VOTElement systemWideElement];
    [v3 setEventCaptureMode:1];

    [(VOTWorkspace *)self _registerWithSpringBoard];
    [(VOTWorkspace *)self resetSystemBatteryLowState];
    self->_vtwFlags.isInternalInstall = AXIsInternalInstall();
  }
}

- (id)_systemBootTime
{
  *(void *)char v7 = 0x1500000001;
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  size_t v4 = 16;
  if (sysctl(v7, 2u, &v5, &v4, 0, 0) == -1)
  {
    v2 = 0;
  }
  else
  {
    v2 = +[NSDate dateWithTimeIntervalSince1970:(double)(int)v6 / 1000000.0 + (double)v5];
  }

  return v2;
}

- (void)_sendGreetingMessage
{
  if ([(VOTWorkspace *)self inUnitTestMode]) {
    return;
  }
  sub_100051804(off_1001EA9E8, @"welcome.message", 0);
  id v22 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v3 = +[VOTCrashManager sharedInstance];
  unsigned int v4 = [v3 didStartFromCrashState];

  if (v4)
  {
    if (AXIsInternalInstall()
      && (+[VOTConfiguration rootConfiguration],
          uint64_t v5 = objc_claimAutoreleasedReturnValue(),
          [v5 preferenceForKey:@"VOTAlwaysSayVoiceOverOn"],
          uint64_t v6 = objc_claimAutoreleasedReturnValue(),
          unsigned int v7 = [v6 BOOLValue],
          v6,
          v5,
          v7))
    {
      int v8 = [(VOTWorkspace *)self _systemBootTime];
      id v9 = +[NSDate date];
      long long v10 = v9;
      if (v8)
      {
        [v9 timeIntervalSinceDate:v8];
        if (v11 > 25.0)
        {
          CFStringRef v20 = @"Crashed";
          CFStringRef v21 = @"__AXStringForVariablesSentinel";
          uint64_t v12 = __AXStringForVariables();

          id v22 = (id)v12;
        }
      }
    }
    else
    {
      int v8 = v22;
      id v22 = 0;
    }
  }
  BOOL v13 = +[VOTElement springBoardApplication];
  unsigned int v14 = [v13 isSystemSleeping];

  if (!v22)
  {
    if (!v14) {
      goto LABEL_19;
    }
LABEL_18:
    [(VOTElementManagementProtocol *)self->_elementManager handleNotification:1004 withData:0 forElement:0];
    goto LABEL_19;
  }
  if (v14) {
    goto LABEL_18;
  }
  __int16 v15 = +[VOTElement systemAppApplication];
  if ([v15 isSiriTalkingOrListening])
  {
LABEL_16:

    goto LABEL_19;
  }
  BOOL v16 = +[VOTElement systemAppApplication];
  unsigned __int8 v17 = [v16 isVoiceControlRunning];

  if ((v17 & 1) == 0)
  {
    id v18 = sub_10000ABF8(v22, 1, 0);
    __int16 v15 = +[VOTOutputManager outputManager];
    v19 = +[VOSOutputEvent Startup];
    [v15 sendEvent:v19];

    goto LABEL_16;
  }
LABEL_19:
}

- (void)run
{
  BOOL v3 = +[NSDate distantFuture];
  [v3 timeIntervalSinceReferenceDate];

  self->_runLoop = CFRunLoopGetCurrent();
  self->_vtwFlags.isRunLoopEnabled = 1;
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"VOTDidLaunch", 0, 0, 1u);
  uint64_t v6 = (void *)os_transaction_create();
  [(VOTWorkspace *)self setVotTransaction:v6];

  [(VOTWorkspace *)self _initialize];
  unsigned int v7 = +[AXPerformanceTestReportingServer server];
  [v7 voiceOverTouchDidLaunch];

  do
  {
    CFRunLoopRunSpecific();
  }
  while (self->_vtwFlags.isRunLoopEnabled);
  if ([(VOTWorkspace *)self disableVoiceOverSettingOnStop])
  {
    id v9 = +[AXSubsystemVoiceOverLifeCycle sharedInstance];
    unsigned __int8 v10 = [v9 ignoreLogging];

    if ((v10 & 1) == 0)
    {
      double v11 = +[AXSubsystemVoiceOverLifeCycle identifier];
      uint64_t v12 = AXLoggerForFacility();

      os_log_type_t v13 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v12, v13))
      {
        unsigned int v14 = AXColorizeFormatLog();
        __int16 v15 = _AXStringForArgs();
        if (os_log_type_enabled(v12, v13))
        {
          int v16 = 138543362;
          unsigned __int8 v17 = v15;
          _os_log_impl((void *)&_mh_execute_header, v12, v13, "%{public}@", (uint8_t *)&v16, 0xCu);
        }
      }
    }
    _AXSVoiceOverTouchSetEnabled();
  }
}

- (void)loadUIKit
{
  if (qword_1001EB8F0 != -1) {
    dispatch_once(&qword_1001EB8F0, &stru_1001B4450);
  }
}

- (BOOL)voiceOverIsConfirmed
{
  return _AXSVoiceOverTouchUsageConfirmed()
      || _AXSAccessibilityGetBooleaniTunesPreference() != 0;
}

- (void)_showConfirmPanel
{
  id v2 = +[VOTSpringBoardConnection defaultConnection];
  [v2 showSpringBoardVOConfirmation:1];
}

- (void)_showVOTNoHomeButtonGestureAlert
{
  _AXSVoiceOverTouchSetUserHasReadNoHomeButtonGestureDescription();
  id v2 = +[VOTSpringBoardConnection defaultConnection];
  [v2 showSpringboardNoHomeButtonGestureAlert];
}

- (void)_checkVoiceOverWasConfirmed
{
  if (![(VOTWorkspace *)self voiceOverIsConfirmed])
  {
    id v2 = +[VOTSpringBoardConnection defaultConnection];
    [v2 showSpringBoardVOConfirmation:0];

    _AXSVoiceOverTouchSetEnabled();
    if (_AXSCanDisableApplicationAccessibility())
    {
      _AXSApplicationAccessibilitySetEnabled();
    }
  }
}

- (void)_voiceOverUsageConfirmed
{
  [(VOTWorkspace *)self _checkVoiceOverWasConfirmed];

  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"_checkVoiceOverWasConfirmed" object:0];
}

- (void)_voiceOverTouchEnabledChange:(__CFString *)a3
{
  if ([(id)VOTSharedWorkspace inUnitTestMode])
  {
    uint64_t v5 = +[AXSubsystemVoiceOverLifeCycle sharedInstance];
    unsigned __int8 v6 = [v5 ignoreLogging];

    if ((v6 & 1) == 0)
    {
      unsigned int v7 = +[AXSubsystemVoiceOverLifeCycle identifier];
      int v8 = AXLoggerForFacility();

      os_log_type_t v9 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v8, v9))
      {
        unsigned __int8 v10 = AXColorizeFormatLog();
        double v11 = _AXStringForArgs();
        if (os_log_type_enabled(v8, v9))
        {
          *(_DWORD *)long long buf = 138543362;
          v35 = v11;
          _os_log_impl((void *)&_mh_execute_header, v8, v9, "%{public}@", buf, 0xCu);
        }
      }
    }
  }
  else
  {
    _AXSForcePreferenceUpdate();
    if (CFEqual(a3, kAXSVoiceOverTouchEnabledNotification))
    {
      uint64_t v12 = +[AXSubsystemVoiceOverLifeCycle sharedInstance];
      unsigned __int8 v13 = [v12 ignoreLogging];

      if ((v13 & 1) == 0)
      {
        unsigned int v14 = +[AXSubsystemVoiceOverLifeCycle identifier];
        __int16 v15 = AXLoggerForFacility();

        os_log_type_t v16 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v15, v16))
        {
          unsigned __int8 v17 = AXColorizeFormatLog();
          id v18 = _AXStringForArgs();
          if (os_log_type_enabled(v15, v16))
          {
            *(_DWORD *)long long buf = 138543362;
            v35 = v18;
            _os_log_impl((void *)&_mh_execute_header, v15, v16, "%{public}@", buf, 0xCu);
          }
        }
      }
    }
    if (self->_didSendShutdownSignal
      || [(VOTWorkspace *)self isVoiceOverTouchPreferenceEnabled])
    {
      AXInPreboardScenario();
      v19 = +[AXSubsystemVoiceOverLifeCycle sharedInstance];
      unsigned __int8 v20 = [v19 ignoreLogging];

      if ((v20 & 1) == 0)
      {
        CFStringRef v21 = +[AXSubsystemVoiceOverLifeCycle identifier];
        id v22 = AXLoggerForFacility();

        os_log_type_t v23 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v22, v23))
        {
          id v24 = AXColorizeFormatLog();
          BOOL v33 = +[NSNumber numberWithBool:[(VOTWorkspace *)self isVoiceOverTouchPreferenceEnabled]];
          v25 = _AXStringForArgs();

          if (os_log_type_enabled(v22, v23))
          {
            *(_DWORD *)long long buf = 138543362;
            v35 = v25;
            _os_log_impl((void *)&_mh_execute_header, v22, v23, "%{public}@", buf, 0xCu);
          }
        }
      }
    }
    else
    {
      self->_didSendShutdownSignal = 1;
      uint64_t v26 = +[AXSubsystemVoiceOverLifeCycle sharedInstance];
      unsigned __int8 v27 = [v26 ignoreLogging];

      if ((v27 & 1) == 0)
      {
        char v28 = +[AXSubsystemVoiceOverLifeCycle identifier];
        long long v29 = AXLoggerForFacility();

        os_log_type_t v30 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v29, v30))
        {
          long long v31 = AXColorizeFormatLog();
          long long v32 = _AXStringForArgs();
          if (os_log_type_enabled(v29, v30))
          {
            *(_DWORD *)long long buf = 138543362;
            v35 = v32;
            _os_log_impl((void *)&_mh_execute_header, v29, v30, "%{public}@", buf, 0xCu);
          }
        }
      }
      [(VOTWorkspace *)self stop:0];
    }
  }
}

- (int64_t)navigationStyle
{
  BOOL v3 = [(VOTWorkspace *)self elementManager];
  unsigned int v4 = [(VOTWorkspace *)self currentElement];
  uint64_t v5 = [v3 determineActivityForElement:v4];

  unsigned __int8 v6 = [v5 navigationStyle];

  if (v6)
  {
    unsigned int v7 = [v5 navigationStyle];
    int64_t navigationStyle = (int)[v7 intValue];
  }
  else
  {
    int64_t navigationStyle = self->_navigationStyle;
  }

  return navigationStyle;
}

- (int64_t)typingMode
{
  BOOL v3 = [(VOTWorkspace *)self elementManager];
  unsigned int v4 = [(VOTWorkspace *)self currentElement];
  uint64_t v5 = [v3 determineActivityForElement:v4];

  unsigned __int8 v6 = [v5 typingStyle];

  if (v6)
  {
    unsigned int v7 = [v5 typingStyle];
    int64_t typingMode = (int)[v7 intValue];
  }
  else
  {
    int64_t typingMode = self->_typingMode;
  }

  return typingMode;
}

- (void)setTypingMode:(int64_t)a3
{
  if (self->_typingMode != a3)
  {
    self->_int64_t typingMode = a3;
    _AXSVoiceOverTouchSetTypingMode();
    id v4 = [(VOTEventFactory *)self->_eventFactory directInteractionKeyboardManager];
    [v4 updateTypingMode];
  }
}

- (void)dispatchCommand:(id)a3
{
}

- (void)dispatchCommand:(id)a3 bypassGesturedInput:(BOOL)a4
{
  id v6 = a3;
  if (a4
    || ![(VOTEventFactory *)self->_eventFactory processEventAsGesturedTextInput:v6])
  {
    [(VOTElementManagementProtocol *)self->_elementManager handleEvent:v6];
  }

  _objc_release_x1();
}

- (void)_postKeyboardEventWithCharacters:(id)a3 originalCharacters:(id)a4 modifiers:(id)a5 keyCode:(id)a6
{
  id v17 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [v11 unsignedIntValue];
  id v14 = [v12 unsignedShortValue];
  [(VOTWorkspace *)self _postKeyboardEventsForModifiers:v13 isKeyDown:1];
  [(VOTWorkspace *)self _postKeyboardEventWithKeyCode:v14 characters:v17 originalCharacters:v10 modifierState:v13 isKeyDown:1];
  [(VOTWorkspace *)self _postKeyboardEventWithKeyCode:v14 characters:v17 originalCharacters:v10 modifierState:v13 isKeyDown:0];
  [(VOTWorkspace *)self _postKeyboardEventsForModifiers:v13 isKeyDown:0];
  __int16 v15 = [(VOTWorkspace *)self unitTestDelegate];

  if (v15)
  {
    os_log_type_t v16 = [(VOTWorkspace *)self unitTestDelegate];
    [v16 didPostKeyboardEventsWithCharacters:v17 originalCharacters:v10 modifiers:v11 keyCode:v12];
  }
}

- (void)_postKeyboardEventsForModifiers:(unsigned int)a3 isKeyDown:(BOOL)a4
{
  if (!a3) {
    return;
  }
  BOOL v4 = a4;
  char v5 = a3;
  if (a4) {
    LODWORD(v7) = 0;
  }
  else {
    LODWORD(v7) = a3;
  }
  if (a3)
  {
    if (a4) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = a3 & 0xFFFFFFFE;
    }
    [(VOTWorkspace *)self _postKeyboardEventWithKeyCode:227 modifierState:v7 isKeyDown:a4];
    if ((v5 & 2) == 0)
    {
LABEL_7:
      if ((v5 & 4) == 0) {
        goto LABEL_8;
      }
      goto LABEL_18;
    }
  }
  else if ((a3 & 2) == 0)
  {
    goto LABEL_7;
  }
  int v8 = v7 & 0xFFFFFFFD;
  if (v4) {
    int v9 = 2;
  }
  else {
    int v9 = 0;
  }
  LODWORD(v7) = v8 | v9;
  [(VOTWorkspace *)self _postKeyboardEventWithKeyCode:226 modifierState:v8 | v9 isKeyDown:v4];
  if ((v5 & 4) == 0)
  {
LABEL_8:
    if ((v5 & 8) == 0) {
      return;
    }
    goto LABEL_22;
  }
LABEL_18:
  int v10 = v7 & 0xFFFFFFFB;
  if (v4) {
    int v11 = 4;
  }
  else {
    int v11 = 0;
  }
  LODWORD(v7) = v10 | v11;
  [(VOTWorkspace *)self _postKeyboardEventWithKeyCode:224 modifierState:v10 | v11 isKeyDown:v4];
  if ((v5 & 8) != 0)
  {
LABEL_22:
    if (v4) {
      int v12 = 8;
    }
    else {
      int v12 = 0;
    }
    [(VOTWorkspace *)self _postKeyboardEventWithKeyCode:225 modifierState:v7 & 0xFFFFFFF7 | v12 isKeyDown:v4];
  }
}

- (void)_postKeyboardEventWithKeyCode:(unsigned __int16)a3 modifierState:(unsigned int)a4 isKeyDown:(BOOL)a5
{
}

- (void)_postKeyboardEventWithKeyCode:(unsigned __int16)a3 characters:(id)a4 originalCharacters:(id)a5 modifierState:(unsigned int)a6 isKeyDown:(BOOL)a7
{
  if (a7) {
    uint64_t v7 = 10;
  }
  else {
    uint64_t v7 = 11;
  }
  [(VOTWorkspace *)self _postKeyboardEventWithKeyCode:a3 characters:a4 originalCharacters:a5 modifierState:*(void *)&a6 eventType:v7];
}

- (void)_postKeyboardEventWithKeyCode:(unsigned __int16)a3 characters:(id)a4 originalCharacters:(id)a5 modifierState:(unsigned int)a6 eventType:(unsigned int)a7
{
  uint64_t v7 = *(void *)&a7;
  uint64_t v8 = *(void *)&a6;
  uint64_t v10 = a3;
  id v12 = a5;
  id v13 = a4;
  id v15 = +[AXEventRepresentation keyRepresentationWithType:v7];
  id v14 = [v15 keyInfo];
  [v14 setKeyCode:v10];
  [v14 setModifierState:v8];
  [v14 setUnmodifiedInput:v12];

  [v14 setModifiedInput:v13];
  [(VOTWorkspace *)self handleKeyboardKeyEvent:v15 eventOrigin:1];
  self->_lastKeyboardKeyPress = CFAbsoluteTimeGetCurrent();
  self->_isPostingKeyboardEvents = 1;
  +[NSThread sleepForTimeInterval:0.00100000005];
}

- (void)_postKeyboardEvent:(id)a3 modifiers:(id)a4 keyCode:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  LODWORD(a4) = [a4 unsignedIntValue];
  unsigned __int16 v10 = (unsigned __int16)[v8 unsignedShortValue];

  LODWORD(v8) = [v9 BOOLValue];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000492D0;
  v19[3] = &unk_1001B4478;
  v19[4] = self;
  int v20 = (int)a4;
  char v21 = (char)v8;
  int v11 = objc_retainBlock(v19);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000492E4;
  v15[3] = &unk_1001B44A0;
  v15[4] = self;
  unsigned __int16 v17 = v10;
  int v16 = (int)a4;
  char v18 = (char)v8;
  id v12 = objc_retainBlock(v15);
  id v13 = v12;
  if (v8)
  {
    id v12 = v11;
    id v14 = v13;
  }
  else
  {
    id v14 = v11;
  }
  ((void (*)(void))v12[2])();
  ((void (*)(void *))v14[2])(v14);
}

- (void)postKeyboardEvent:(BOOL)a3 modifiers:(unsigned int)a4 keyCode:(unsigned __int16)a5
{
  keyPostingQueue = self->_keyPostingQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100049384;
  v6[3] = &unk_1001B44A0;
  v6[4] = self;
  BOOL v9 = a3;
  unsigned int v7 = a4;
  unsigned __int16 v8 = a5;
  dispatch_async(keyPostingQueue, v6);
}

- (void)postKeyboardEventWithCharacters:(id)a3 originalCharacters:(id)a4 modifiers:(unsigned int)a5 keyCode:(unsigned __int16)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = v11;
  if (v10 && v11)
  {
    keyPostingQueue = self->_keyPostingQueue;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    _DWORD v14[2] = sub_10004950C;
    v14[3] = &unk_1001B44C8;
    v14[4] = self;
    id v15 = v10;
    id v16 = v12;
    unsigned int v17 = a5;
    unsigned __int16 v18 = a6;
    dispatch_async(keyPostingQueue, v14);
  }
}

- (VOTElement)currentElement
{
  return (VOTElement *)[(VOTElementManagementProtocol *)self->_elementManager currentElement];
}

- (NSArray)focusedApplications
{
  unsigned int v2 = [(VOTElementManagementProtocol *)self->_elementManager isItemChooserVisible];
  BOOL v3 = +[VOTElement systemAppApplication];
  BOOL v4 = v3;
  if (v2)
  {
    unsigned __int16 v8 = v3;
    uint64_t v5 = +[NSArray arrayWithObjects:&v8 count:1];
  }
  else
  {
    uint64_t v5 = [v3 focusedApplications];
  }
  id v6 = (void *)v5;

  return (NSArray *)v6;
}

- (BOOL)handwritingInputActive
{
  return [(VOTEventFactory *)self->_eventFactory handwritingInputActive];
}

- (BOOL)brailleInputActive
{
  return [(VOTEventFactory *)self->_eventFactory brailleInputActive];
}

- (int64_t)brailleInputTypingMode
{
  return [(VOTEventFactory *)self->_eventFactory brailleInputTypingMode];
}

- (BOOL)brailleInputAllowsElementMovement
{
  return [(VOTEventFactory *)self->_eventFactory brailleInputAllowsElementMovement];
}

- (BOOL)brailleInputWantsToStayActive
{
  return [(VOTEventFactory *)self->_eventFactory brailleInputWantsToStayActive];
}

- (BOOL)brailleInputShouldBeDeactivatedByEscape
{
  return [(VOTEventFactory *)self->_eventFactory brailleInputShouldBeDeactivatedByEscape];
}

- (void)_preferencesAlwaysUseNemethForMathChange
{
  id v2 = +[VOTBrailleManager manager];
  [v2 updateUsesNemethForMath];
}

- (void)_preferenceUseDigitalCrownNavigationChanged
{
  id v3 = +[AXSettings sharedInstance];
  self->_useDigitalCrownNavigation = [v3 voiceOverUseDigitalCrownNavigation];
}

- (void)setUseDigitalCrownNavigationEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  self->_useDigitalCrownNavigation = a3;
  id v4 = +[AXSettings sharedInstance];
  [v4 setVoiceOverUseDigitalCrownNavigation:v3];
}

- (void)_preferencesTypingPitchChange
{
  id v3 = +[AXSettings sharedInstance];
  -[VOTWorkspace setTypingPitchChangeEnabled:](self, "setTypingPitchChangeEnabled:", [v3 voiceOverPitchChangeEnabled]);
}

- (void)_preferencesSpeakHintsChange
{
  id v3 = +[AXSettings sharedInstance];
  id v4 = [v3 voiceOverHintsEnabled];

  [(VOTWorkspace *)self setHintsEnabled:v4];
}

- (void)_preferencesNavigateImagesOptionChange
{
  id v3 = +[AXSettings sharedInstance];
  -[VOTWorkspace setNavigateImagesOption:](self, "setNavigateImagesOption:", [v3 voiceOverNavigateImagesOption]);
}

- (void)_preferencesSpeechRateChange
{
  id v3 = +[VOTOutputManager outputManager];
  id v2 = +[VOTExternalAccessoryManager accessoryManager];
  [v2 updateSpeakingRate];
}

- (void)_preferencesSpeakingRateInRotorChanged
{
  id v3 = +[AXSettings sharedInstance];
  -[VOTWorkspace setSpeakingRateInRotor:](self, "setSpeakingRateInRotor:", [v3 voiceOverSpeakingRateInRotorEnabled]);
}

- (void)_preferencesSpeakNotifications
{
  id v3 = +[AXSettings sharedInstance];
  -[VOTWorkspace setNotificationsWhenLockedOutput:](self, "setNotificationsWhenLockedOutput:", [v3 voiceOverLockedScreenNotificationOutput]);

  id v4 = +[AXSettings sharedInstance];
  -[VOTWorkspace setBannerNotificationsOutput:](self, "setBannerNotificationsOutput:", [v4 voiceOverBannerNotificationOutput]);

  id v5 = +[AXSettings sharedInstance];
  -[VOTWorkspace setUseRingerSwitchForNotificationOutput:](self, "setUseRingerSwitchForNotificationOutput:", [v5 voiceOverUseRingerSwitchToControlNotificationOutput]);
}

- (void)preferencesKeyboardClickStatusChange:(id)a3
{
}

- (void)preferencesLanguageRotorItemsChanged:(id)a3
{
  id v4 = (void *)_AXSVoiceOverTouchCopyLanguageRotorItems();
  [(NSLock *)self->_systemLangaugeLock lock];
  id v5 = (NSArray *)[objc_allocWithZone((Class)NSMutableArray) init];
  id v6 = [objc_allocWithZone((Class)NSMutableDictionary) init];
  [v6 setObject:kCFBooleanTrue forKey:@"Default"];
  id v16 = v6;
  [(NSArray *)v5 addObject:v6];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v13 = [v12 objectForKey:@"Enabled"];
        unsigned int v14 = [v13 BOOLValue];

        if (v14) {
          [(NSArray *)v5 addObject:v12];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  if ((id)[(NSArray *)v5 count] == (id)1) {
    [(NSArray *)v5 removeAllObjects];
  }
  enabledLanguageRotorItems = self->_enabledLanguageRotorItems;
  self->_enabledLanguageRotorItems = v5;

  [(NSLock *)self->_systemLangaugeLock unlock];
}

- (void)preferencesBrailleLanguageRotorItemsChanged:(id)a3
{
  if (![(VOTWorkspace *)self inUnitTestMode])
  {
    VOSCrystalMigrateBrailleTableReplacements();
    id v4 = +[AXSettings sharedInstance];
    id v5 = [v4 voiceOverBrailleLanguageRotorItems];

    +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v5 count]);
    id v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v7 = v5;
    id v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          id v13 = objc_msgSend(v12, "objectForKeyedSubscript:", @"Enabled", (void)v18);
          unsigned int v14 = [v13 BOOLValue];

          if (v14) {
            [(NSArray *)v6 addObject:v12];
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v9);
    }

    enabledBrailleLanguageRotorItems = self->_enabledBrailleLanguageRotorItems;
    self->_enabledBrailleLanguageRotorItems = v6;
    id v16 = v6;

    long long v17 = +[VOTBrailleManager manager];

    [v17 updateBrailleLanguage];
  }
}

- (void)_preferencesTypingModeChanged:(id)a3
{
  self->_int64_t typingMode = _AXSVoiceOverTouchTypingMode();
}

- (void)_preferencesScreenCurtainChanged:(id)a3
{
}

- (id)phoneticStringForCharacter:(id)a3 andVoiceIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7
    || (+[TTSSpeechSynthesizer voiceForIdentifier:v7],
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v8 language],
        id v9 = objc_claimAutoreleasedReturnValue(),
        v8,
        !v9))
  {
    id v9 = [(VOTWorkspace *)self selectedLanguage];
    if (!v9)
    {
      id v9 = [(VOTWorkspace *)self systemSpokenLanguage];
    }
  }
  uint64_t v10 = [(AXCharacterSoundMap *)self->_characterSoundMap phoneticStringForCharacter:v6 forLanguage:v9 andVoiceIdentifier:v7];

  return v10;
}

- (void)setSelectedActivity:(id)a3
{
  objc_storeStrong((id *)&self->_selectedActivity, a3);
  id v4 = a3;
  id v5 = +[AXSettings sharedInstance];
  [v5 setVoiceOverSelectedActivity:v4];
}

- (void)systemSpokenLanguageChanged:(id)a3
{
  id v5 = [(VOTWorkspace *)self systemSpokenLanguage];
  nullsub_3();
  id v4 = +[VOTBrailleManager manager];
  [v4 updateBrailleLanguage];

  [(VOTWorkspace *)self _installLanguageTranslationModelForLanguageIfNeeded:v5];
}

- (AXMLanguageTranslator)languageTranslator
{
  languageTranslator = self->_languageTranslator;
  if (!languageTranslator)
  {
    id v4 = (AXMLanguageTranslator *)objc_alloc_init((Class)AXMLanguageTranslator);
    id v5 = self->_languageTranslator;
    self->_languageTranslator = v4;

    languageTranslator = self->_languageTranslator;
  }

  return languageTranslator;
}

- (void)_installLanguageTranslationModelForLanguageIfNeeded:(id)a3
{
  id v4 = a3;
  id v5 = AXMediaLogLanguageTranslation();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Checking if VO should install translation model for: %@", (uint8_t *)&v7, 0xCu);
  }

  if ([(VOTWorkspace *)self imageCaptionsEnabled])
  {
    id v6 = [(VOTWorkspace *)self languageTranslator];
    [v6 installOfflineTranslationModelForLanguageCodeIfNeeded:v4 progress:&stru_1001B4508 completion:&stru_1001B4588];
  }
  else
  {
    id v6 = AXMediaLogLanguageTranslation();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Image descriptions not enabled. Will not download translation assets", (uint8_t *)&v7, 2u);
    }
  }
}

- (id)punctuationGroupForUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(VOTWorkspace *)self punctuationGroups];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10004A45C;
  v10[3] = &unk_1001B45B0;
  id v11 = v4;
  id v6 = v4;
  int v7 = objc_msgSend(v5, "ax_filteredArrayUsingBlock:", v10);
  id v8 = [v7 lastObject];

  return v8;
}

- (NSArray)punctuationGroups
{
  id v2 = self;
  objc_sync_enter(v2);
  punctuationGroups = v2->_punctuationGroups;
  if (!punctuationGroups)
  {
    id v4 = +[AXSSPunctuationManager sharedDatabase];
    id v5 = [v4 punctuationGroups];

    if (v5)
    {
      uint64_t v6 = +[NSMutableArray array];
      int v7 = v2->_punctuationGroups;
      v2->_punctuationGroups = (NSMutableArray *)v6;

      [(NSMutableArray *)v2->_punctuationGroups axSafelyAddObjectsFromArray:v5];
      defaultPunctuationGroup = v2->_defaultPunctuationGroup;
      v2->_defaultPunctuationGroup = 0;
    }
    punctuationGroups = v2->_punctuationGroups;
  }
  id v9 = [(NSMutableArray *)punctuationGroups copy];
  objc_sync_exit(v2);

  return (NSArray *)v9;
}

- (id)defaultPunctuationGroup
{
  id v2 = self;
  objc_sync_enter(v2);
  if (!v2->_defaultPunctuationGroup)
  {
    id v3 = +[AXSettings sharedInstance];
    id v4 = [v3 voiceOverDefaultPunctuationGroup];
    uint64_t v5 = [(VOTWorkspace *)v2 punctuationGroupForUUID:v4];
    defaultPunctuationGroup = v2->_defaultPunctuationGroup;
    v2->_defaultPunctuationGroup = (AXSSPunctuationGroup *)v5;

    if (!v2->_defaultPunctuationGroup)
    {
      uint64_t v7 = [(VOTWorkspace *)v2 punctuationGroupForUUID:AXSSVoiceOverPunctuationGroupSome];
      id v8 = v2->_defaultPunctuationGroup;
      v2->_defaultPunctuationGroup = (AXSSPunctuationGroup *)v7;
    }
  }
  objc_sync_exit(v2);

  id v9 = v2->_defaultPunctuationGroup;

  return v9;
}

- (void)punctuationGroupsChanged:(id)a3
{
  id v3 = a3;
  id v4 = AXLogPunctuationStorage();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412290;
    id v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Punctuation groups changed: %@", buf, 0xCu);
  }

  AXPerformBlockAsynchronouslyOnMainThread();
}

- (void)setVoiceOverMuted:(BOOL)a3
{
}

- (void)setVoiceOverMuted:(BOOL)a3 sendRequest:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if ([(VOTWorkspace *)self voiceOverIsConfirmed])
  {
    self->_voiceOverMuted = v5;
    [(VOTWorkspace *)self setSpeechMuted:v5];
    if (v4)
    {
      id v12 = [objc_allocWithZone((Class)VOTOutputRequest) init];
      if (self->_voiceOverMuted) {
        uint64_t v7 = @"voiceover.muted.off";
      }
      else {
        uint64_t v7 = @"voiceover.muted.on";
      }
      id v8 = sub_100051804(off_1001EA9E8, v7, 0);
      id v9 = [v12 addString:v8];

      uint64_t v10 = [v12 lastAction];
      [v10 setObject:kCFBooleanTrue forVariant:25];

      [v12 setGeneratesBraille:1];
      if (self->_voiceOverMuted)
      {
        [v12 setCompletionBlock:&stru_1001B45F0];
      }
      else
      {
        id v11 = +[VOTOutputManager outputManagerIfExists];
        [v11 updateAudioSessionProperties];
      }
      [v12 send];
    }
  }
}

- (void)setScreenCurtainEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(VOTWorkspace *)self voiceOverIsConfirmed])
  {
    if (v3
      && ([(id)VOTSharedWorkspace loadUIKit],
          [(id)AXSafeClassFromString() isRunningInStoreDemoMode]))
    {
      id v12 = [(id)VOTSharedWorkspace selectedLanguage];
      BOOL v5 = sub_100051D04(off_1001EA9E8, @"screen.curtain.disabled.in.store.mode", 0, v12);
      id v6 = sub_10000ABF8(v5, 0, v12);

      _AXSVoiceOverTouchSetScreenCurtainEnabled();
    }
    else
    {
      self->_int screenCurtainEnabled = v3;
      uint64_t v7 = +[VOTSpringBoardConnection defaultConnection];
      [v7 setScreenCurtainEnabled:self->_screenCurtainEnabled];

      id v8 = +[VOTDisplayManager displayManager];
      [v8 setScreenCurtainEnabled:self->_screenCurtainEnabled];

      id v9 = +[VOTOutputManager outputManager];
      if (self->_screenCurtainEnabled) {
        uint64_t v10 = @"screen.curtain.on";
      }
      else {
        uint64_t v10 = @"screen.curtain.off";
      }
      id v11 = sub_100051804(off_1001EA9E8, v10, 0);
      [v9 speakSimpleString:v11];

      if (_AXSVoiceOverTouchUsageConfirmed())
      {
        _AXSVoiceOverTouchSetScreenCurtainEnabled();
      }
    }
  }
}

- (void)setScreenCurtainSuspended:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(VOTWorkspace *)self screenCurtainEnabled] && self->_screenCurtainSuspended != v3)
  {
    BOOL v5 = +[VOTSpringBoardConnection defaultConnection];
    [v5 setScreenCurtainEnabled:!v3];

    id v6 = +[VOTDisplayManager displayManager];
    [v6 setScreenCurtainEnabled:!v3];

    uint64_t v7 = +[VOTDisplayManager displayManager];
    [v7 clearCursorFrame];

    id v8 = +[VOTOutputManager outputManager];
    if (self->_screenCurtainSuspended) {
      id v9 = @"screen.curtain.on";
    }
    else {
      id v9 = @"screen.curtain.off";
    }
    uint64_t v10 = sub_100051804(off_1001EA9E8, v9, 0);
    [v8 speakSimpleString:v10];
  }
  self->_screenCurtainSuspended = v3;
}

- (void)_stopRunLoop
{
  self->_vtwFlags.isRunLoopEnabled = 0;
  runLoop = self->_runLoop;
  if (runLoop) {
    CFRunLoopStop(runLoop);
  }
}

- (void)outputRequestFinished:(id)a3
{
  BOOL v4 = (VOTOutputRequest *)a3;
  +[NSObject cancelPreviousPerformRequestsWithTarget:self];
  completionRequest = self->_completionRequest;

  if (completionRequest == v4)
  {
    [(VOTWorkspace *)self _stopRunLoop];
  }
}

- (void)stop:(int)a3
{
  BOOL v5 = +[VOTElement systemWideElement];
  [v5 unsetEventCaptureMode:1];

  id v6 = +[VOTOutputManager outputManager];
  [v6 setSoundCurtainEnabled:0];

  uint64_t v7 = +[VOTExternalAccessoryManager accessoryManager];
  [v7 stopListening];

  _AXSVoiceOverTouchSetActive2DBrailleDisplays();
  if (!self->_completionRequest)
  {
    id v8 = +[VOTOutputManager outputManagerIfExists];
    [v8 stopSpeakingAtBoundary:0];
  }
  if (!byte_1001EB8F8)
  {
    [(VOTEventFactory *)self->_eventFactory shutdown];
    id v9 = +[VOTDisplayManager displayManager];
    [v9 shutdown];

    if (!a3)
    {
      uint64_t v10 = (VOTOutputRequest *)[objc_allocWithZone((Class)VOTOutputRequest) init];
      id v11 = [(id)VOTSharedWorkspace selectedLanguage];
      id v12 = sub_100051D04(off_1001EA9E8, @"voiceover.off", 0, v11);
      id v13 = [(VOTOutputRequest *)v10 addString:v12 withLanguage:v11];

      [(VOTOutputRequest *)v10 setLastSystemRequest:1];
      [(VOTOutputRequest *)v10 setCompletionDelegate:self];
      [(VOTOutputRequest *)v10 setCannotBeInterrupted:1];
      [(VOTOutputRequest *)v10 setGeneratesBraille:1];
      [(VOTOutputRequest *)v10 send];
      completionRequest = self->_completionRequest;
      self->_completionRequest = v10;
    }
    if (self->_isPostingKeyboardEvents)
    {
      ++self->_triggeredKBAttachState;
      id v15 = [(VOTWorkspace *)self softwareKeyboardManager];
      [v15 _overrideSetHardwareKeyboardAttached:self->_originalKBAttachedState];

      id v16 = VOTLogKeyboard();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        BOOL originalKBAttachedState = self->_originalKBAttachedState;
        v22[0] = 67109120;
        v22[1] = originalKBAttachedState;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Resetting hw keyboard state to: %d", (uint8_t *)v22, 8u);
      }
    }
  }
  long long v18 = +[VOTElement systemWideElement];
  [v18 sendTouchCancelledEvent];

  long long v19 = +[VOTSpringBoardConnection defaultConnection];
  [v19 setScreenCurtainEnabled:0];

  long long v20 = +[VOTDisplayManager displayManager];
  [v20 setScreenCurtainEnabled:0];

  long long v21 = +[VOTConfiguration rootConfiguration];
  [v21 setPreference:0 forKey:@"VOTIsRunningKey"];

  if (a3 == 1)
  {
    byte_1001EB8F8 = 2;
LABEL_15:
    [(VOTWorkspace *)self _stopRunLoop];
    goto LABEL_16;
  }
  if (byte_1001EB8F8 == 2) {
    goto LABEL_15;
  }
  if (!byte_1001EB8F8) {
    [(VOTWorkspace *)self performSelector:"outputRequestFinished:" withObject:self->_completionRequest afterDelay:5.0];
  }
LABEL_16:
  ++byte_1001EB8F8;
}

- (BOOL)isInternalInstall
{
  return self->_vtwFlags.isInternalInstall;
}

- (void)_selfDestruct
{
  if (AXGuidedAccessGetAvailability() != 6)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v10 = 0u;
    v13[0] = @"com.apple.mediaserverd";
    v13[1] = AX_BackBoardBundleName;
    v13[2] = AX_SpringBoardBundleName;
    BOOL v3 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v13, 3, 0, 0);
    BOOL v4 = (char *)[v3 countByEnumeratingWithState:&v9 objects:v14 count:16];
    if (v4)
    {
      BOOL v5 = v4;
      uint64_t v6 = *(void *)v10;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v3);
          }
          pid_t v8 = AXPidForLaunchLabel();
          kill(v8, 15);
          ++v7;
        }
        while (v5 != v7);
        BOOL v5 = (char *)[v3 countByEnumeratingWithState:&v9 objects:v14 count:16];
      }
      while (v5);
    }

    [(VOTWorkspace *)self _stopRunLoop];
  }
}

- (void)handleVolumeButtonPress:(id)a3
{
  id v13 = a3;
  BOOL v4 = +[VOTOutputManager outputManager];
  unsigned __int8 v5 = [v4 isSpeaking];

  if ((v5 & 1) == 0)
  {
    uint64_t v6 = [(VOTEventFactory *)self->_eventFactory currentElement];
    uint64_t v7 = [v6 application];
    unsigned __int8 v8 = [v7 isCameraIrisOpen];

    if ((v8 & 1) == 0)
    {
      long long v9 = +[AXSystemAppServer server];
      [v9 isMediaPlayingForApp:0 completionHandler:&stru_1001B4630];
    }
  }
  long long v10 = +[VOTCommandHelper commandHelper];
  if ([v10 helpEnabled] && objc_msgSend(v13, "subtype") != 226)
  {
    id v11 = [objc_allocWithZone((Class)VOTKeyInfo) initWithEventRepresentation:v13];
    long long v12 = +[VOTEvent keyEventWithCommand:0 keyInfo:v11];
    [v10 processHelpForEvent:v12];
  }
}

- (void)handleMenuButtonPress:(id)a3
{
  [(VOTWorkspace *)self _checkVoiceOverWasConfirmed];
  [(VOTEventFactory *)self->_eventFactory resetEventFactory];
  BOOL v4 = +[VOTCommandHelper commandHelper];
  unsigned int v5 = [v4 helpEnabled];

  if (v5)
  {
    uint64_t v6 = [(id)VOTSharedWorkspace selectedLanguage];
    uint64_t v7 = sub_100051D04(off_1001EA9E8, @"home.button.pressed", 0, v6);
    id v8 = sub_10000ABF8(v7, 0, v6);

    long long v9 = sub_100051D04(off_1001EA9E8, @"stopping.help.mode", 0, v6);
    id v10 = sub_10000ABF8(v9, 2, v6);

    id v11 = +[VOTCommandHelper commandHelper];
    [v11 setHelpEnabled:0];
  }
  [(VOTElementManagementProtocol *)self->_elementManager handleStateReset];
  self->_lastHomeButtonPress = CFAbsoluteTimeGetCurrent();
}

- (void)handleAppleTVRemoteEvent:(id)a3 eventOrigin:(int64_t)a4 isRTL:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  switch([v7 type])
  {
    case 0x4B0u:
      id v8 = &kVOTEventCommandSearchRotorUp;
      goto LABEL_13;
    case 0x4B1u:
    case 0x4B3u:
    case 0x4B5u:
    case 0x4B7u:
      goto LABEL_16;
    case 0x4B2u:
      id v8 = &kVOTEventCommandSearchRotorDown;
      goto LABEL_13;
    case 0x4B4u:
      id v8 = &kVOTEventCommandNextElement;
      id v16 = &kVOTEventCommandPreviousElement;
      goto LABEL_11;
    case 0x4B6u:
      id v8 = &kVOTEventCommandPreviousElement;
      id v16 = &kVOTEventCommandNextElement;
LABEL_11:
      if (!v5) {
        id v8 = v16;
      }
LABEL_13:
      uint64_t v17 = +[VOTEvent appleTVRemoteEventWithCommand:*v8 info:0];
      if (!v17) {
        goto LABEL_16;
      }
      long long v12 = v17;
      [(VOTElementManagementProtocol *)self->_elementManager updateNavigationModeForClassicRemote];
      [(VOTElementManagementProtocol *)self->_elementManager handleEvent:v12];
      break;
    default:
      long long v9 = +[AXSubsystemVoiceOver sharedInstance];
      unsigned __int8 v10 = [v9 ignoreLogging];

      if (v10) {
        goto LABEL_16;
      }
      id v11 = +[AXSubsystemVoiceOver identifier];
      long long v12 = AXLoggerForFacility();

      os_log_type_t v13 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v12, v13))
      {
        unsigned int v14 = AXColorizeFormatLog();
        id v15 = _AXStringForArgs();
        if (os_log_type_enabled(v12, v13))
        {
          *(_DWORD *)long long buf = 138543362;
          long long v19 = v15;
          _os_log_impl((void *)&_mh_execute_header, v12, v13, "%{public}@", buf, 0xCu);
        }
      }
      break;
  }

LABEL_16:
}

- (void)handleKeyboardKeyEvent:(id)a3 eventOrigin:(int64_t)a4
{
}

- (void)handleTurnOffSoundAndCurtainEvent:(id)a3
{
}

- (id)keyboardPressInfo
{
  return [(VOTKeyboardManager *)self->_keyboardManager threadSafe_keyDownInfo];
}

- (void)_temporarilyChangeQuickNav:(id)a3
{
  keyboardManager = self->_keyboardManager;
  id v4 = [a3 BOOLValue];

  [(VOTKeyboardManager *)keyboardManager updateQuickNavState:v4];
}

- (void)temporarilyChangeQuickNavState:(BOOL)a3
{
  keyPostingQueue = self->_keyPostingQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10004B820;
  v4[3] = &unk_1001B4658;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(keyPostingQueue, v4);
}

- (void)_handleSystemMuteKey:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 eventRecord];
  unsigned int v6 = [v5 originalType];

  if (v6 != 1026)
  {
    id v7 = +[VOTOutputManager outputManager];
    if ([v7 isSystemMuted])
    {
      id v8 = [v4 eventRecord];
      [(VOTKeyboardManager *)self->_keyboardManager postEvent:v8];
      id v9 = [v8 copy];

      [v9 setType:1026];
      [v9 setOriginalType:1026];
      [(VOTKeyboardManager *)self->_keyboardManager postEvent:v9];
      v16[2] = _NSConcreteStackBlock;
      v16[3] = 3221225472;
      v16[4] = sub_10004BA90;
      v16[5] = &unk_1001B33B8;
      unsigned __int8 v10 = &v17;
      id v17 = v7;
      AXPerformBlockOnMainThreadAfterDelay();
    }
    else
    {
      id v9 = +[VOTOutputRequest createRequest];
      id v11 = off_1001EA9E8;
      long long v12 = [(id)VOTSharedWorkspace selectedLanguage];
      os_log_type_t v13 = sub_100051804(v11, @"system.muted", v12);
      id v14 = [v9 addString:v13];

      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_10004BB18;
      v15[3] = &unk_1001B4680;
      unsigned __int8 v10 = (id *)v16;
      v16[0] = v4;
      v16[1] = self;
      [v9 setCompletionBlock:v15];
      [v9 send];
    }
  }
}

- (void)handleMediaKeyPress:(id)a3
{
  id v7 = a3;
  id v4 = +[VOTCommandHelper commandHelper];
  id v5 = [objc_allocWithZone((Class)VOTKeyInfo) initWithEventRepresentation:v7];
  if ([v4 helpEnabled])
  {
    if ([v5 isMediaKey])
    {
      unsigned int v6 = +[VOTEvent keyEventWithCommand:0 keyInfo:v5];
      [v4 processHelpForEvent:v6];
    }
  }
  else if ([v7 originalType] == 1025 {
         || [v7 originalType] == 1026)
  }
  {
    [(VOTWorkspace *)self performSelector:"_handleSystemMuteKey:" withObject:v5 afterDelay:0.5];
  }
  else
  {
    [(VOTKeyboardManager *)self->_keyboardManager postEvent:v7];
  }
}

- (void)handlePlayPauseKeyPress:(id)a3
{
}

- (void)handleLockButtonPress:(id)a3
{
  [(VOTWorkspace *)self _checkVoiceOverWasConfirmed];
  self->_lastLockButtonPress = CFAbsoluteTimeGetCurrent();
  id v4 = +[VOTCommandHelper commandHelper];
  [v4 setHelpEnabled:0];

  eventFactordouble y = self->_eventFactory;

  [(VOTEventFactory *)eventFactory resetEventFactory];
}

- (void)handleProximityEvent:(id)a3
{
  elementManager = self->_elementManager;
  id v4 = +[VOTEvent internalEventWithCommand:kVOTEventCommandCancelSpeaking info:0];
  [(VOTElementManagementProtocol *)elementManager handleEvent:v4];
}

- (void)handleRingerSwitchSwitched:(id)a3
{
  id v4 = +[AXSpringBoardServer server];
  self->_vtwFlags.ringerSwitchSilent = [v4 isRingerMuted];
}

- (void)handleOrientationChanged
{
}

- (void)handleSetForcedOrientation:(int64_t)a3 shouldAnnounce:(BOOL)a4
{
  if (a3)
  {
    if (self->_forcedOrientation != a3)
    {
      self->_forcedOrientation = a3;
      [(VOTWorkspace *)self _resetOrientationAndAnnounce:a4 updateApplication:0];
    }
  }
  else
  {
    _AXAssert();
  }
}

- (void)handleUnsetForcedOrientationAndAnnounce:(BOOL)a3
{
  if (self->_forcedOrientation)
  {
    self->_forcedOrientation = 0;
    [(VOTWorkspace *)self _resetOrientationAndAnnounce:a3 updateApplication:0];
  }
}

- (BOOL)directTouchElementsPresent
{
  return [(VOTEventFactory *)self->_eventFactory directTouchElementsPresent];
}

- (void)startTapAndHoldMode:(BOOL)a3
{
}

- (void)cancelTapAndHoldMode
{
}

- (void)handleReturnToSpringBoard
{
  [(VOTElementManagementProtocol *)self->_elementManager handleHomeButtonPress];

  [(VOTWorkspace *)self performSelector:"resetOrientation" withObject:0 afterDelay:0.35];
}

- (CGPoint)fingerPosition
{
  [(VOTEventFactory *)self->_eventFactory fingerPosition];
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (unint64_t)fingerCount
{
  return [(VOTEventFactory *)self->_eventFactory fingerCount];
}

- (void)_languageChanged
{
  double v2 = [(VOTWorkspace *)self currentElement];
  double v3 = [v2 application];
  unsigned __int8 v4 = [v3 isSetupBuddy];

  if ((v4 & 1) == 0) {
    exit(1);
  }
}

- (void)_preferencesCaptionPanelChanged
{
  id v3 = +[AXSettings sharedInstance];
  -[VOTWorkspace setCaptionPanelEnabled:](self, "setCaptionPanelEnabled:", [v3 enableVoiceOverCaptions]);
}

- (void)_speakCorrectionsChanged
{
  id v3 = +[AXSettings sharedInstance];
  self->_vtwFlags.speakAutocorrectionsEnabled = [v3 speakCorrectionsEnabled];
}

- (BOOL)speakAutocorrectionsEnabled
{
  return self->_vtwFlags.speakAutocorrectionsEnabled;
}

- (BOOL)announceOrientationChanges
{
  return 1;
}

- (void)_setDeviceOrientation:(int64_t)a3 shouldAnnounce:(BOOL)a4 updateApplication:(BOOL)a5
{
  BOOL v5 = a5;
  int64_t orientation = self->_orientation;
  if (orientation == a3 || a3 == 1 && !orientation || !a3 && orientation == 1)
  {
    if (byte_1001EB8F9) {
      return;
    }
    unsigned int v8 = 0;
    self->_int64_t orientation = a3;
  }
  else
  {
    self->_int64_t orientation = a3;
    if (a4) {
      unsigned int v8 = [(VOTWorkspace *)self announceOrientationChanges];
    }
    else {
      unsigned int v8 = 0;
    }
  }
  id v30 = [(id)VOTSharedWorkspace selectedLanguage];
  switch(self->_orientation)
  {
    case 0:
    case 1:
      [(VOTEventFactory *)self->_eventFactory setOrientation:0];
      byte_1001EB8F9 = 1;
      id v9 = off_1001EA9E8;
      unsigned __int8 v10 = @"rotate.portrait";
      goto LABEL_14;
    case 2:
      [(VOTEventFactory *)self->_eventFactory setOrientation:1];
      byte_1001EB8F9 = 1;
      id v9 = off_1001EA9E8;
      unsigned __int8 v10 = @"rotate.portrait.upsidedown";
LABEL_14:
      long long v12 = sub_100051D04(v9, v10, 0, v30);
      id v11 = 0;
      break;
    case 3:
      [(VOTEventFactory *)self->_eventFactory setOrientation:3];
      byte_1001EB8F9 = 1;
      long long v12 = sub_100051D04(off_1001EA9E8, @"rotate.landscape.left", 0, v30);
      int HasHomeButton = AXDeviceHasHomeButton();
      id v14 = off_1001EA9E8;
      if (HasHomeButton) {
        id v15 = @"landscape.right.hint";
      }
      else {
        id v15 = @"landscape.right.hint.charge.port";
      }
      goto LABEL_22;
    case 4:
      [(VOTEventFactory *)self->_eventFactory setOrientation:2];
      byte_1001EB8F9 = 1;
      long long v12 = sub_100051D04(off_1001EA9E8, @"rotate.landscape.right", 0, v30);
      int v16 = AXDeviceHasHomeButton();
      id v14 = off_1001EA9E8;
      if (v16) {
        id v15 = @"landscape.left.hint";
      }
      else {
        id v15 = @"landscape.left.hint.charge.port";
      }
LABEL_22:
      id v11 = sub_100051D04(v14, v15, 0, v30);
      break;
    default:
      id v11 = 0;
      long long v12 = 0;
      break;
  }
  id v17 = [(VOTElementManagementProtocol *)self->_elementManager currentElement];
  long long v18 = [v17 application];

  long long v19 = +[VOTElement springBoardApplication];
  if (v8
    && [(VOTElementManagementProtocol *)self->_elementManager shouldAllowSpeaking])
  {
    unsigned __int8 v20 = [v18 isTourGuideRunning];
  }
  else
  {
    unsigned __int8 v20 = 1;
  }
  if (([v19 isSystemSleeping] & 1) == 0)
  {
    char v21 = [(VOTWorkspace *)self currentCallState] ? 1 : v20;
    if ((v21 & 1) == 0)
    {
      id v22 = sub_10000ABF8(v12, 1, v30);
      if (v11)
      {
        if ([(id)VOTSharedWorkspace hintsEnabled])
        {
          id v23 = [objc_allocWithZone((Class)VOTOutputRequest) init];
          LODWORD(v24) = 1061997773;
          [v23 addPause:v24];
          id v25 = [v23 addString:v11 withLanguage:v30];
          [v23 send];
        }
      }
    }
  }
  uint64_t v26 = +[VOTDisplayManager displayManager];
  [v26 setCursorFrameForElement:0];

  +[AXUIMLElement clearCaches];
  if (v5)
  {
    elementManager = self->_elementManager;
    char v28 = +[NSNumber numberWithBool:0];
    [(VOTElementManagementProtocol *)elementManager performSelector:"updateApplicationAndSpeak:" withObject:v28 afterDelay:0.35];
  }
  else
  {
    char v28 = +[VOTDisplayManager displayManager];
    long long v29 = [(VOTWorkspace *)self currentElement];
    [v28 setCursorFrameForElement:v29];
  }
}

- (BOOL)imageCaptionsEnabled
{
  return self->_imageCaptionsEnabled;
}

- (BOOL)textDetectionEnabled
{
  return self->_textDetectionEnabled;
}

- (BOOL)buttonIconDetectionEnabled
{
  return self->_buttonIconDetectionEnabled;
}

- (int64_t)deviceOrientation
{
  return self->_orientation;
}

- (int64_t)applicationOrientation
{
  return self->_applicationOrientation;
}

- (void)resetOrientation
{
}

- (void)_resetOrientationAndAnnounce:(BOOL)a3 updateApplication:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v7 = [(id)VOTSharedWorkspace applicationForCurrentElement];
  id v8 = [v7 applicationOrientation];

  if (!v8)
  {
    id v9 = +[VOTElement systemAppApplication];
    id v8 = [v9 applicationOrientation];
  }
  self->_applicationOrientation = (int64_t)v8;
  if (self->_forcedOrientation) {
    int64_t forcedOrientation = self->_forcedOrientation;
  }
  else {
    int64_t forcedOrientation = (int64_t)v8;
  }

  [(VOTWorkspace *)self _setDeviceOrientation:forcedOrientation shouldAnnounce:v5 updateApplication:v4];
}

- (void)rotateDeviceOrientation:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v4 = +[VOTElement systemAppApplication];
  id v5 = [v4 applicationOrientation];

  switch((unint64_t)v5)
  {
    case 0uLL:
    case 1uLL:
      BOOL v6 = !v3;
      uint64_t v7 = 3;
      goto LABEL_9;
    case 2uLL:
      BOOL v8 = !v3;
      uint64_t v9 = 3;
      goto LABEL_5;
    case 3uLL:
      BOOL v8 = !v3;
      uint64_t v9 = 1;
LABEL_5:
      if (v8) {
        uint64_t v10 = v9 + 1;
      }
      else {
        uint64_t v10 = v9;
      }
      goto LABEL_12;
    case 4uLL:
      BOOL v6 = !v3;
      uint64_t v7 = 1;
LABEL_9:
      if (v6) {
        uint64_t v10 = v7;
      }
      else {
        uint64_t v10 = v7 + 1;
      }
LABEL_12:
      id v11 = +[VOTElement systemWideElement];
      [v11 setDeviceOrientation:v10];

      break;
    default:
      return;
  }
}

- (void)resetSystemBatteryLowState
{
  int isSystemBatteryLow = self->_isSystemBatteryLow;
  BOOL v4 = +[VOTElement springBoardApplication];
  unsigned int v5 = [v4 isSystemBatteryLow];

  if (isSystemBatteryLow != v5)
  {
    self->_isSystemBatteryLow ^= 1u;
    BOOL v6 = (void *)VOTSharedWorkspace;
    [v6 refreshBraille:0 rotorSelection:0];
  }
}

- (void)performHomeButtonPress
{
  double v2 = +[AXEventRepresentation buttonRepresentationWithType:1000];
  BOOL v3 = +[AXBackBoardServer server];
  [v3 postEvent:v2 systemEvent:1];

  id v5 = +[AXEventRepresentation buttonRepresentationWithType:1001];

  BOOL v4 = +[AXBackBoardServer server];
  [v4 postEvent:v5 systemEvent:1];

  +[NSThread sleepForTimeInterval:0.15];
}

- (void)performVolumeUpButtonPress
{
  BOOL v3 = +[AXPISystemActionHelper sharedInstance];
  [v3 pressVolumeUpButtonDown];

  BOOL v4 = +[AXPISystemActionHelper sharedInstance];
  [v4 liftVolumeUpButtonUp];

  id v5 = +[AXEventRepresentation buttonRepresentationWithType:1007];
  [(VOTWorkspace *)self performSelectorOnMainThread:"_wst_handleVolumeButtonPress:" withObject:v5 waitUntilDone:0];
}

- (void)performVolumeDownButtonPress
{
  BOOL v3 = +[AXPISystemActionHelper sharedInstance];
  [v3 pressVolumeDownButtonDown];

  BOOL v4 = +[AXPISystemActionHelper sharedInstance];
  [v4 liftVolumeDownButtonUp];

  id v5 = +[AXEventRepresentation buttonRepresentationWithType:1009];
  [(VOTWorkspace *)self performSelectorOnMainThread:"_wst_handleVolumeButtonPress:" withObject:v5 waitUntilDone:0];
}

- (void)performEjectButtonPress
{
  BOOL v3 = +[VOTBrailleManager manager];
  unsigned __int8 v4 = [v3 handleShowOnscreenKeyboardToggle];

  if ((v4 & 1) == 0)
  {
    id v5 = +[AXEventRepresentation buttonRepresentationWithType:1029];
    [(VOTWorkspace *)self performSelectorOnMainThread:"_wst_handleMediaKeyPress:" withObject:v5 waitUntilDone:0];
    id v6 = +[AXEventRepresentation buttonRepresentationWithType:1030];

    [(VOTWorkspace *)self performSelectorOnMainThread:"_wst_handleMediaKeyPress:" withObject:v6 waitUntilDone:0];
  }
}

- (void)performNextLanguageButtonPress
{
  keyPostingQueue = self->_keyPostingQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004CA08;
  block[3] = &unk_1001B33B8;
  void block[4] = self;
  dispatch_async(keyPostingQueue, block);
}

- (void)_postNextLanguageEvent
{
  [(VOTWorkspace *)self _postKeyboardEventWithKeyCode:3 characters:0 originalCharacters:0 modifierState:0 eventType:4500];

  [(VOTWorkspace *)self _postKeyboardEventWithKeyCode:3 characters:0 originalCharacters:0 modifierState:0 eventType:4501];
}

- (void)refreshBraille:(BOOL)a3 rotorSelection:(id)a4
{
  BOOL v4 = a3;
  id v8 = a4;
  id v5 = +[VOTEvent brailleEventWithCommand:kVOTEventCommandBrailleRefreshBrailleLine info:0];
  id v6 = v5;
  uint64_t v7 = &kCFBooleanTrue;
  if (!v4) {
    uint64_t v7 = &kCFBooleanFalse;
  }
  [v5 setObject:*v7 forIndex:106];
  if (v8) {
    [v6 setObject:v8 forIndex:109];
  }
  [(id)VOTSharedWorkspace dispatchCommand:v6];
}

- (void)setSpeechLogging:(BOOL)a3
{
  self->_vtwFlags.speechLogging = a3;
}

- (BOOL)speechLogging
{
  return self->_vtwFlags.speechLogging;
}

- (void)setSoundMuted:(BOOL)a3
{
  self->_soundMuted = a3;
  double Current = CFAbsoluteTimeGetCurrent();

  [(VOTWorkspace *)self setLastSoundMuteToggleTime:Current];
}

- (void)setSpeechMuted:(BOOL)a3
{
  self->_speechMuted = a3;
  double Current = CFAbsoluteTimeGetCurrent();

  [(VOTWorkspace *)self setLastSpeechMuteToggleTime:Current];
}

- (BOOL)speechMuted
{
  return self->_speechMuted;
}

- (void)userInteractedWithDevice
{
  self->_lastDeviceInteractionEvent = CFAbsoluteTimeGetCurrent();
  id v3 = +[VOTBrailleManager manager];
  [v3 setLastUserInteractionTime:self->_lastDeviceInteractionEvent];
}

- (void)unmuteEligibleEventOccured
{
  self->_lastUnmuteEvent = CFAbsoluteTimeGetCurrent();
  id v3 = +[VOTBrailleManager manager];
  [v3 setLastUserInteractionTime:self->_lastUnmuteEvent];
}

- (void)screenLockOccurred
{
  self->_lastDeviceLock = CFAbsoluteTimeGetCurrent();
  eventFactordouble y = self->_eventFactory;

  [(VOTEventFactory *)eventFactory screenLockOccurred];
}

- (void)setScreenOn:(BOOL)a3 silently:(BOOL)a4
{
  self->_screenOn = a3;
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  if (a3)
  {
    self->_screenOnTime = Current;
    if (!a4)
    {
      [(VOTWorkspace *)self unmuteEligibleEventOccured];
    }
  }
  else
  {
    self->_screenOffTime = Current;
  }
}

- (BOOL)screenOn
{
  return self->_screenOn;
}

- (BOOL)voiceOverIsIdle
{
  return 0;
}

- (double)speechRateFromSettings
{
  if (self->_inUnitTestMode
    && ([(VOTWorkspace *)self unitTestSpeechRate],
        id v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    BOOL v4 = [(VOTWorkspace *)self unitTestSpeechRate];
    [v4 doubleValue];
    double v6 = v5;

    return v6;
  }
  else
  {
    _AXSVoiceOverTouchSpeakingRate();
    return v8;
  }
}

- (int)_callCenterQueue_currentCallState
{
  id v3 = [(TUCallCenter *)self->_callCenter audioOrVideoCallWithStatus:4];

  if (v3)
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 1;
    double v5 = [(TUCallCenter *)self->_callCenter audioOrVideoCallWithStatus:1];

    if (!v5)
    {
      double v6 = [(TUCallCenter *)self->_callCenter audioOrVideoCallWithStatus:3];

      if (v6) {
        int v4 = 3;
      }
      else {
        int v4 = 0;
      }
    }
  }
  uint64_t v7 = VOTLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v9[0] = 67109120;
    v9[1] = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Call state: %d", (uint8_t *)v9, 8u);
  }

  return v4;
}

- (int)currentCallState
{
  if (self->_inUnitTestMode)
  {
    return [(VOTWorkspace *)self currentCallStateForUnitTests];
  }
  else
  {
    uint64_t v7 = 0;
    float v8 = &v7;
    uint64_t v9 = 0x2020000000;
    int v10 = 0;
    if ((AXInPreboardScenario() & 1) == 0 && (AXInCheckerBoardScenario() & 1) == 0)
    {
      callCenterQueue = self->_callCenterQueue;
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_10004CFBC;
      v6[3] = &unk_1001B34C0;
      v6[4] = self;
      void v6[5] = &v7;
      dispatch_sync(callCenterQueue, v6);
    }
    int v4 = *((_DWORD *)v8 + 6);
    _Block_object_dispose(&v7, 8);
    return v4;
  }
}

- (void)_activeAudioRouteChanged:(id)a3
{
  avAccessQueue = self->_avAccessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004D064;
  block[3] = &unk_1001B33B8;
  void block[4] = self;
  dispatch_async(avAccessQueue, block);
}

- (void)_localeChanged:(id)a3
{
  [(VOTWorkspace *)self _selectedBrailleTableChanged];

  [(VOTWorkspace *)self _preferencesAlwaysUseNemethForMathChange];
}

- (BOOL)tapAndHoldMode
{
  return [(VOTEventFactory *)self->_eventFactory tapAndHoldMode];
}

- (BOOL)isAudioRoutedToSpeaker
{
  return self->_vtwFlags.audioIsRoutedToSpeaker;
}

- (BOOL)userUnlockedDevice
{
  if (!self->_inUnitTestMode || ![(VOTWorkspace *)self overridePropertiesForTesting]) {
    return self->_lastDeviceLock < self->_lastUnmuteEvent;
  }

  return [(VOTWorkspace *)self userUnlockedDeviceForUnitTesting];
}

- (BOOL)userRecentlyUnlockedDevice
{
  if (self->_inUnitTestMode && [(VOTWorkspace *)self overridePropertiesForTesting])
  {
    return [(VOTWorkspace *)self userRecentlyUnlockedDeviceForUnitTesting];
  }
  else
  {
    double Current = CFAbsoluteTimeGetCurrent();
    return Current - self->_lastLockButtonPress < 4.0 || Current - self->_lastHomeButtonPress < 4.0;
  }
}

- (BOOL)isRingerSwitchSilent
{
  if (self->_inUnitTestMode && [(VOTWorkspace *)self overridePropertiesForTesting])
  {
    return [(VOTWorkspace *)self isRingerSwitchSilentForUnitTesting];
  }
  else
  {
    if ((byte_1001EB8FA & 1) == 0)
    {
      [(VOTWorkspace *)self handleRingerSwitchSwitched:0];
      byte_1001EB8FA = 1;
    }
    return self->_vtwFlags.ringerSwitchSilent;
  }
}

- (double)lastLockButtonPressTime
{
  return self->_lastLockButtonPress;
}

- (NSArray)languageRotorItems
{
  id v3 = [(VOTWorkspace *)self additionalLanguageRotorItem];

  if (v3)
  {
    CFStringRef v15 = @"RotorItem";
    int v4 = [(VOTWorkspace *)self additionalLanguageRotorItem];
    int v16 = v4;
    id v3 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  }
  [(NSLock *)self->_systemLangaugeLock lock];
  enabledLanguageRotorItems = self->_enabledLanguageRotorItems;
  if (!enabledLanguageRotorItems)
  {
    [(VOTWorkspace *)self preferencesLanguageRotorItemsChanged:0];
    enabledLanguageRotorItems = self->_enabledLanguageRotorItems;
  }
  id v6 = [(NSArray *)enabledLanguageRotorItems copy];
  [(NSLock *)self->_systemLangaugeLock unlock];
  if (v6)
  {
    if (v3)
    {
      id v7 = [v6 arrayByAddingObject:v3];
    }
    else
    {
      id v7 = v6;
    }
    int v10 = v7;
  }
  else if (v3)
  {
    v13[0] = @"Default";
    v13[1] = @"RotorItem";
    v14[0] = &__kCFBooleanTrue;
    float v8 = [(id)VOTSharedWorkspace systemSpokenLanguage];
    v14[1] = v8;
    uint64_t v9 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];

    v12[0] = v3;
    v12[1] = v9;
    int v10 = +[NSArray arrayWithObjects:v12 count:2];
  }
  else
  {
    int v10 = 0;
  }

  return (NSArray *)v10;
}

- (NSArray)brailleLanguageRotorItems
{
  enabledBrailleLanguageRotorItems = self->_enabledBrailleLanguageRotorItems;
  if (!enabledBrailleLanguageRotorItems)
  {
    [(VOTWorkspace *)self preferencesBrailleLanguageRotorItemsChanged:0];
    enabledBrailleLanguageRotorItems = self->_enabledBrailleLanguageRotorItems;
  }

  return enabledBrailleLanguageRotorItems;
}

- (void)unitTestSetBrailleRotorItems:(id)a3
{
  id v6 = a3;
  if ([(VOTWorkspace *)self inUnitTestMode])
  {
    int v4 = (NSArray *)[v6 copy];
    enabledBrailleLanguageRotorItems = self->_enabledBrailleLanguageRotorItems;
    self->_enabledBrailleLanguageRotorItems = v4;
  }
}

- (void)setSelectedLanguage:(id)a3
{
  id v4 = a3;
  id v5 = [(VOTWorkspace *)self votSettings];
  [v5 setSelectedLanguageIdentifier:v4];
}

- (NSString)selectedLanguage
{
  double v2 = [(VOTWorkspace *)self votSettings];
  id v3 = [v2 selectedLanguageIdentifier];

  return (NSString *)v3;
}

- (void)setSelectedBrailleTable:(id)a3
{
  id v13 = a3;
  if (([v13 isEqual:self->_selectedBrailleTable] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_selectedBrailleTable, a3);
    if (![(VOTWorkspace *)self inUnitTestMode])
    {
      id v5 = [v13 identifier];
      id v6 = +[AXSettings sharedInstance];
      [v6 setVoiceOverBrailleTableIdentifier:v5];

      id v7 = [v13 identifier];
      float v8 = +[AXSettings sharedInstance];
      [v8 setVoiceOverTouchBrailleDisplayOutputTableIdentifier:v7];
    }
    uint64_t v9 = +[AXSettings sharedInstance];
    unsigned int v10 = [v9 voiceOverTouchBrailleDisplaySyncInputOutputTables];

    if (v10)
    {
      objc_storeStrong((id *)&self->_selectedBrailleInputTable, a3);
      if (![(VOTWorkspace *)self inUnitTestMode])
      {
        id v11 = [v13 identifier];
        long long v12 = +[AXSettings sharedInstance];
        [v12 setVoiceOverTouchBrailleDisplayInputTableIdentifier:v11];
      }
    }
  }
}

- (BRLTTable)selectedBrailleTable
{
  id v3 = [(VOTWorkspace *)self elementManager];
  id v4 = [(VOTWorkspace *)self currentElement];
  id v5 = [v3 determineActivityForElement:v4];

  id v6 = [v5 brailleTable];

  if (!v6) {
    goto LABEL_5;
  }
  id v7 = objc_alloc((Class)BRLTTable);
  float v8 = [v5 brailleTable];
  uint64_t v9 = (BRLTTable *)[v7 initWithIdentifier:v8];

  unsigned int v10 = VOTLogActivities();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v12 = 138412290;
    id v13 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Using activity table: %@", (uint8_t *)&v12, 0xCu);
  }

  if (!v9) {
LABEL_5:
  }
    uint64_t v9 = self->_selectedBrailleTable;

  return v9;
}

- (void)_selectedBrailleTableChanged
{
  VOSCrystalMigrateBrailleTableReplacements();
  id v3 = +[AXSettings sharedInstance];
  id v7 = [v3 voiceOverTouchBrailleDisplayOutputTableIdentifier];

  if (v7)
  {
    id v4 = (BRLTTable *)[objc_alloc((Class)BRLTTable) initWithIdentifier:v7];
    selectedBrailleTable = self->_selectedBrailleTable;
    self->_selectedBrailleTable = v4;
  }
  id v6 = +[VOTBrailleManager manager];
  [v6 updateBrailleLanguage];
}

- (void)setSelectedBrailleInputTable:(id)a3
{
  id v11 = a3;
  if (([v11 isEqual:self->_selectedBrailleInputTable] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_selectedBrailleInputTable, a3);
    if (![(VOTWorkspace *)self inUnitTestMode])
    {
      id v5 = [v11 identifier];
      id v6 = +[AXSettings sharedInstance];
      [v6 setVoiceOverTouchBrailleDisplayInputTableIdentifier:v5];
    }
    id v7 = +[AXSettings sharedInstance];
    unsigned int v8 = [v7 voiceOverTouchBrailleDisplaySyncInputOutputTables];

    if (v8)
    {
      objc_storeStrong((id *)&self->_selectedBrailleTable, a3);
      if (![(VOTWorkspace *)self inUnitTestMode])
      {
        uint64_t v9 = [v11 identifier];
        unsigned int v10 = +[AXSettings sharedInstance];
        [v10 setVoiceOverTouchBrailleDisplayOutputTableIdentifier:v9];
      }
    }
  }
}

- (BRLTTable)selectedBrailleInputTable
{
  id v3 = [(VOTWorkspace *)self elementManager];
  id v4 = [(VOTWorkspace *)self currentElement];
  id v5 = [v3 determineActivityForElement:v4];

  id v6 = [v5 brailleInputTable];

  if (!v6) {
    goto LABEL_5;
  }
  id v7 = objc_alloc((Class)BRLTTable);
  unsigned int v8 = [v5 brailleInputTable];
  uint64_t v9 = (BRLTTable *)[v7 initWithIdentifier:v8];

  unsigned int v10 = VOTLogActivities();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v12 = 138412290;
    id v13 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Using activity input table: %@", (uint8_t *)&v12, 0xCu);
  }

  if (!v9) {
LABEL_5:
  }
    uint64_t v9 = self->_selectedBrailleInputTable;

  return v9;
}

- (void)_selectedBrailleInputTableChanged
{
  VOSCrystalMigrateBrailleTableReplacements();
  id v3 = +[AXSettings sharedInstance];
  id v7 = [v3 voiceOverTouchBrailleDisplayInputTableIdentifier];

  if (v7)
  {
    id v4 = (BRLTTable *)[objc_alloc((Class)BRLTTable) initWithIdentifier:v7];
    selectedBrailleInputTable = self->_selectedBrailleInputTable;
    self->_selectedBrailleInputTable = v4;
  }
  id v6 = +[VOTBrailleManager manager];
  [v6 updateBrailleLanguage];
}

- (void)setSelectedBrailleGesturesInputTable:(id)a3
{
  id v7 = a3;
  if (([v7 isEqual:self->_selectedBrailleGesturesInputTable] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_selectedBrailleGesturesInputTable, a3);
    if (![(VOTWorkspace *)self inUnitTestMode])
    {
      id v5 = [v7 identifier];
      id v6 = +[AXSettings sharedInstance];
      [v6 setVoiceOverTouchBrailleGesturesInputTableIdentifier:v5];
    }
  }
}

- (id)selectedBrailleGesturesInputTable:(id)a3
{
  return self->_selectedBrailleGesturesInputTable;
}

- (void)_selectedBrailleGesturesInputTableChanged
{
  VOSCrystalMigrateBrailleTableReplacements();
  id v3 = +[AXSettings sharedInstance];
  id v6 = [v3 voiceOverTouchBrailleGesturesInputTableIdentifier];

  if (v6)
  {
    id v4 = (BRLTTable *)[objc_alloc((Class)BRLTTable) initWithIdentifier:v6];
    selectedBrailleGesturesInputTable = self->_selectedBrailleGesturesInputTable;
    self->_selectedBrailleGesturesInputTable = v4;
  }
}

- (BOOL)isBaseSystemSpokenEqualToLocalization
{
  id v3 = [(VOTWorkspace *)self systemSpokenLanguage];
  id v4 = [(VOTWorkspace *)self selectedLanguage];
  if (v4)
  {
    if (v3)
    {
      id v5 = [v3 rangeOfString:@"-"];
      if (v5 != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v6 = [v3 substringToIndex:v5];

        id v3 = (void *)v6;
      }
      id v7 = [v4 rangeOfString:@"-"];
      if (v7 != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v8 = [v4 substringToIndex:v7];

        id v4 = (void *)v8;
      }
      unsigned __int8 v9 = [v3 isEqualToString:v4];
    }
    else
    {
      unsigned __int8 v9 = 0;
    }
  }
  else
  {
    unsigned __int8 v9 = 1;
  }

  return v9;
}

- (id)applicationForCurrentElement
{
  id v3 = [(VOTElementManagementProtocol *)self->_elementManager currentElement];
  id v4 = [(VOTWorkspace *)self applicationForElement:v3];

  return v4;
}

- (id)applicationForElement:(id)a3
{
  id v3 = a3;
  if ([v3 isApplication])
  {
    uint64_t v4 = AXRetainAutorelease();
LABEL_5:
    id v5 = (id)v4;
    goto LABEL_15;
  }
  if ([(id)VOTSharedWorkspace inUnitTestMode])
  {
    uint64_t v4 = [v3 elementForAttribute:2017];
    goto LABEL_5;
  }
  signed int v6 = [v3 pid];
  if (v6 != kAXUIServerFakePid && v6 <= -2) {
    int v8 = -v6;
  }
  else {
    int v8 = v6;
  }
  +[NSNumber numberWithInteger:v8];
  uint64_t v18 = 0;
  long long v19 = &v18;
  uint64_t v20 = 0x3032000000;
  char v21 = sub_10004E0F8;
  id v22 = sub_10004E108;
  id v23 = 0;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  AX_PERFORM_WITH_LOCK();
  unsigned int v10 = (void *)v19[5];
  if (!v10)
  {
    uint64_t v11 = [v3 elementForAttribute:2017];
    int v12 = (void *)v19[5];
    void v19[5] = v11;

    id v16 = v3;
    id v17 = v9;
    AX_PERFORM_WITH_LOCK();
    id v13 = objc_msgSend((id)v19[5], "copyWithCache", _NSConcreteStackBlock, 3221225472, sub_10004E178, &unk_1001B46D0);
    id v14 = (void *)v19[5];
    void v19[5] = (uint64_t)v13;

    unsigned int v10 = (void *)v19[5];
  }
  id v5 = v10;

  _Block_object_dispose(&v18, 8);
LABEL_15:

  return v5;
}

- (id)applicationForPID:(int)a3
{
  uint64_t v5 = 0;
  signed int v6 = &v5;
  uint64_t v7 = 0x3032000000;
  int v8 = sub_10004E0F8;
  id v9 = sub_10004E108;
  id v10 = 0;
  AX_PERFORM_WITH_LOCK();
  id v3 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v3;
}

- (VOTElementManagementProtocol)elementManager
{
  return self->_elementManager;
}

- (VOTRotorManagementProtocol)rotorManager
{
  return self->_rotorManager;
}

- (BOOL)outputDisabled
{
  return self->_outputDisabled;
}

- (BOOL)navigationStyleHonorsGroups
{
  return [(id)VOTSharedWorkspace navigationStyle] == (id)1;
}

- (BOOL)_userHasDisabledUSBRM
{
  double v2 = +[MCProfileConnection sharedConnection];
  BOOL v3 = [v2 userBoolValueForSetting:MCFeatureUSBRestrictedModeAllowed] == 2;

  return v3;
}

- (void)_setUSBRMPreferenceDisabled
{
  double v2 = +[MCProfileConnection sharedConnection];
  [v2 setBoolValue:0 forSetting:MCFeatureUSBRestrictedModeAllowed];

  uint64_t v3 = _AXSGetUSBRMDisablers() | 1;

  __AXSSetUSBRMDisablers(v3);
}

- (void)handleBluetoothBrailleDisplayConnected
{
  double v2 = +[VOTConfiguration rootConfiguration];
  uint64_t v3 = [v2 preferenceForKey:@"kVOTBTAlwaysOnAsk"];
  unsigned __int8 v4 = [v3 BOOLValue];

  if ((v4 & 1) == 0)
  {
    uint64_t v5 = +[VOTConfiguration rootConfiguration];
    [v5 setPreference:&__kCFBooleanTrue forKey:@"kVOTBTAlwaysOnAsk"];

    id v6 = +[AXSpringBoardServer server];
    [v6 showAlert:17 withHandler:&stru_1001B4718];
  }
}

- (id)_validateAssetFromResults:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = +[AXAsset newsestCompatibleImageCaptionModelAssetFromAssets:v3 withStage:@"Stable" language:@"en" isInstalled:1 isDownloadable:0];
  if (!v4)
  {
    unsigned __int8 v4 = +[AXAsset newsestCompatibleImageCaptionModelAssetFromAssets:v3 withStage:@"Stable" language:@"en" isInstalled:0 isDownloadable:1];
  }

  return v4;
}

- (void)assetController:(id)a3 didFinishRefreshingAssets:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6
{
  id v8 = a4;
  id v9 = a6;
  id v10 = VOTLogCommon();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412546;
    id v18 = v8;
    __int16 v19 = 2112;
    id v20 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Refreshed assets: %@ %@", buf, 0x16u);
  }

  uint64_t v11 = [(VOTWorkspace *)self _validateAssetFromResults:v8];
  int v12 = VOTLogCommon();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412290;
    id v18 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Using asset: %@", buf, 0xCu);
  }

  if (v11 && ([v11 isInstalled] & 1) == 0)
  {
    id v13 = VOTLogCommon();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v18 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Downloading asset: %@", buf, 0xCu);
    }

    assetController = self->_assetController;
    id v16 = v11;
    CFStringRef v15 = +[NSArray arrayWithObjects:&v16 count:1];
    [(AXAssetController *)assetController downloadAssets:v15 successStartBlock:&stru_1001B4738];
  }
}

- (void)assetController:(id)a3 didFinishDownloadingAsset:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6 hasRemainingDownloads:(BOOL)a7
{
  id v8 = a4;
  id v9 = a6;
  id v10 = VOTLogCommon();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v11 = 138412546;
    id v12 = v8;
    __int16 v13 = 2112;
    id v14 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Finished downloading: %@ %@", (uint8_t *)&v11, 0x16u);
  }
}

- (void)assetController:(id)a3 didUpdateCatalogForPolicy:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6
{
  BOOL v7 = a5;
  id v8 = a4;
  id v9 = a6;
  id v10 = VOTLogCommon();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v11 = +[NSNumber numberWithBool:v7];
    int v12 = 138412802;
    id v13 = v8;
    __int16 v14 = 2112;
    CFStringRef v15 = v11;
    __int16 v16 = 2112;
    id v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Did update catalog: %@ %@ %@", (uint8_t *)&v12, 0x20u);
  }
}

- (void)handleUSBMFiBrailleDisplayConnected
{
  id v3 = +[AXSettings sharedInstance];
  if (([v3 voiceOverUserDidReadUSBRestrictedModeAlert] & 1) != 0
    || [(VOTWorkspace *)self _userHasDisabledUSBRM])
  {
    unsigned __int8 v4 = +[AXSettings sharedInstance];
    unsigned int v5 = [v4 voiceOverShouldDisallowUSBRestrictedMode];

    if (!v5) {
      return;
    }
  }
  else
  {
  }
  id v6 = +[AXSettings sharedInstance];
  [v6 setVoiceOverShouldDisallowUSBRestrictedMode:0];

  int v12 = 0;
  uint64_t v20 = 0;
  char v21 = &v20;
  uint64_t v22 = 0x2020000000;
  int v23 = -5;
  int v19 = 7;
  id v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  CFStringRef v15 = sub_10004F8E8;
  __int16 v16 = &unk_1001B4788;
  id v17 = &v20;
  id v18 = &v12;
  int v7 = ACMKernelControl(18);
  if (!v7) {
    int v7 = *((_DWORD *)v21 + 6);
  }
  _Block_object_dispose(&v20, 8);
  if ((v12 & 0x10) != 0) {
    unsigned int v8 = 15;
  }
  else {
    unsigned int v8 = 13;
  }
  if (v7) {
    uint64_t v9 = 13;
  }
  else {
    uint64_t v9 = v8;
  }
  id v10 = +[AXSpringBoardServer server];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10004ECDC;
  v11[3] = &unk_1001B4760;
  v11[4] = self;
  [v10 showAlert:v9 withHandler:v11];
}

- (CGPoint)convertDevicePointToZoomedPoint:(CGPoint)a3
{
  -[VOTEventFactory convertDevicePointToZoomedPoint:](self->_eventFactory, "convertDevicePointToZoomedPoint:", a3.x, a3.y);
  result.double y = v4;
  result.double x = v3;
  return result;
}

- (NSString)systemSpokenLanguage
{
  double v3 = [(VOTWorkspace *)self unitTestSystemSpokenLanguage];

  if (v3)
  {
    double v4 = [(VOTWorkspace *)self unitTestSystemSpokenLanguage];
  }
  else
  {
    unsigned int v5 = [(VOTWorkspace *)self votSettings];
    double v4 = [v5 systemLanguageIdentifier];
  }

  return (NSString *)v4;
}

- (void)setUnitTestSystemSpokenLanguage:(id)a3
{
  objc_storeStrong((id *)&self->_unitTestSystemSpokenLanguage, a3);
  id v4 = a3;
  id v5 = +[VOTOutputManager outputManager];

  [v5 updateSupportedLanguageMap];
}

- (BOOL)soundMuted
{
  return self->_soundMuted;
}

- (BOOL)voiceOverMuted
{
  return self->_voiceOverMuted;
}

- (int64_t)navigateImagesOption
{
  return self->_navigateImagesOption;
}

- (void)setNavigateImagesOption:(int64_t)a3
{
  self->_navigateImagesOption = a3;
}

- (BOOL)typingPitchChangeEnabled
{
  return self->_typingPitchChangeEnabled;
}

- (void)setTypingPitchChangeEnabled:(BOOL)a3
{
  self->_typingPitchChangeEnabled = a3;
}

- (NSString)additionalLanguageRotorItem
{
  return self->additionalLanguageRotorItem;
}

- (void)setAdditionalLanguageRotorItem:(id)a3
{
}

- (double)lastHomeButtonPress
{
  return self->_lastHomeButtonPress;
}

- (void)setLastHomeButtonPress:(double)a3
{
  self->_lastHomeButtonPress = a3;
}

- (double)lastLockButtonPress
{
  return self->_lastLockButtonPress;
}

- (void)setLastLockButtonPress:(double)a3
{
  self->_lastLockButtonPress = a3;
}

- (double)lastKeyboardKeyPress
{
  return self->_lastKeyboardKeyPress;
}

- (void)setLastKeyboardKeyPress:(double)a3
{
  self->_lastKeyboardKeyPress = a3;
}

- (BOOL)screenCurtainEnabled
{
  return self->_screenCurtainEnabled;
}

- (BOOL)isSystemBatteryLow
{
  return self->_isSystemBatteryLow;
}

- (void)setIsSystemBatteryLow:(BOOL)a3
{
  self->_int isSystemBatteryLow = a3;
}

- (int64_t)rotorType
{
  return self->_cachedRotorType;
}

- (void)setRotorType:(int64_t)a3
{
  self->_cachedRotorType = a3;
}

- (BOOL)speakingRateInRotor
{
  return self->_speakingRateInRotor;
}

- (void)setSpeakingRateInRotor:(BOOL)a3
{
  self->_speakingRateInRotor = a3;
}

- (void)setOutputDisabled:(BOOL)a3
{
  self->_outputDisabled = a3;
}

- (BOOL)playKeyboardClicksOnHWInput
{
  return self->_playKeyboardClicksOnHWInput;
}

- (void)setPlayKeyboardClicksOnHWInput:(BOOL)a3
{
  self->_playKeyboardClicksOnHWInput = a3;
}

- (id)testingEventListener
{
  return self->testingEventListener;
}

- (void)setTestingEventListener:(id)a3
{
}

- (double)screenOnTime
{
  return self->_screenOnTime;
}

- (void)setScreenOnTime:(double)a3
{
  self->_screenOnTime = a3;
}

- (void)setPreviousRotorVoiceIdentifier:(id)a3
{
}

- (int64_t)notificationsWhenLockedOutput
{
  return self->notificationsWhenLockedOutput;
}

- (void)setNotificationsWhenLockedOutput:(int64_t)a3
{
  self->notificationsWhenLockedOutput = a3;
}

- (int64_t)bannerNotificationsOutput
{
  return self->bannerNotificationsOutput;
}

- (void)setBannerNotificationsOutput:(int64_t)a3
{
  self->bannerNotificationsOutput = a3;
}

- (BOOL)useRingerSwitchForNotificationOutput
{
  return self->useRingerSwitchForNotificationOutput;
}

- (void)setUseRingerSwitchForNotificationOutput:(BOOL)a3
{
  self->useRingerSwitchForNotificationOutput = a3;
}

- (double)lastSpeechMuteToggleTime
{
  return self->_lastSpeechMuteToggleTime;
}

- (void)setLastSpeechMuteToggleTime:(double)a3
{
  self->_lastSpeechMuteToggleTime = a3;
}

- (double)lastSoundMuteToggleTime
{
  return self->_lastSoundMuteToggleTime;
}

- (void)setLastSoundMuteToggleTime:(double)a3
{
  self->_lastSoundMuteToggleTime = a3;
}

- (void)setVoiceOverIsIdle:(BOOL)a3
{
  self->_voiceOverIsIdle = a3;
}

- (BOOL)screenCurtainSuspended
{
  return self->_screenCurtainSuspended;
}

- (BOOL)wasEnabledThroughAccessory
{
  return self->_wasEnabledThroughAccessory;
}

- (void)setWasEnabledThroughAccessory:(BOOL)a3
{
  self->_wasEnabledThroughAccessordouble y = a3;
}

- (BOOL)supportsHomeGestures
{
  return self->_supportsHomeGestures;
}

- (void)setSupportsHomeGestures:(BOOL)a3
{
  self->_supportsHomeGestures = a3;
}

- (BOOL)accessoryShutdownInProgress
{
  return self->_accessoryShutdownInProgress;
}

- (void)setAccessoryShutdownInProgress:(BOOL)a3
{
  self->_accessoryShutdownInProgress = a3;
}

- (BOOL)inUnitTestMode
{
  return self->_inUnitTestMode;
}

- (void)setInUnitTestMode:(BOOL)a3
{
  self->_inUnitTestMode = a3;
}

- (BOOL)inPerformanceTestMode
{
  return self->_inPerformanceTestMode;
}

- (void)setInPerformanceTestMode:(BOOL)a3
{
  self->_inPerformanceTestMode = a3;
}

- (BOOL)isSiriTalking
{
  return self->_isSiriTalking;
}

- (void)setIsSiriTalking:(BOOL)a3
{
  self->_isSiriTalking = a3;
}

- (BOOL)isSiriListening
{
  return self->_isSiriListening;
}

- (void)setIsSiriListening:(BOOL)a3
{
  self->_isSiriListening = a3;
}

- (BOOL)isOnenessActive
{
  return self->_isOnenessActive;
}

- (void)setIsOnenessActive:(BOOL)a3
{
  self->_isOnenessActive = a3;
}

- (BOOL)duckingTemporarilyDisabled
{
  return self->_duckingTemporarilyDisabled;
}

- (void)setDuckingTemporarilyDisabled:(BOOL)a3
{
  self->_duckingTemporarilyDisabled = a3;
}

- (BOOL)pauseSpeechAndHaptics
{
  return self->_pauseSpeechAndHaptics;
}

- (void)setPauseSpeechAndHaptics:(BOOL)a3
{
  self->_pauseSpeechAndHaptics = a3;
}

- (unint64_t)customContentImportance
{
  return self->_customContentImportance;
}

- (void)setCustomContentImportance:(unint64_t)a3
{
  self->_customContentImportance = a3;
}

- (NSArray)imageCaptioningDisabledApps
{
  return self->_imageCaptioningDisabledApps;
}

- (void)setImageCaptioningDisabledApps:(id)a3
{
}

- (void)setContainerOutputFeedback:(int64_t)a3
{
  self->_id containerOutputFeedback = a3;
}

- (void)setBrailleFormattingEnabled:(BOOL)a3
{
  self->_brailleFormattingEnabled = a3;
}

- (int64_t)moreContentOutputFeedback
{
  return self->_moreContentOutputFeedback;
}

- (void)setMoreContentOutputFeedback:(int64_t)a3
{
  self->_moreContentOutputFeedback = a3;
}

- (void)setImageCaptionsEnabled:(BOOL)a3
{
  self->_imageCaptionsEnabled = a3;
}

- (void)setTextDetectionEnabled:(BOOL)a3
{
  self->_textDetectionEnabled = a3;
}

- (void)setButtonIconDetectionEnabled:(BOOL)a3
{
  self->_buttonIconDetectionEnabled = a3;
}

- (BOOL)soundEffectsEnabled
{
  return self->_soundEffectsEnabled;
}

- (void)setSoundEffectsEnabled:(BOOL)a3
{
  self->_soundEffectsEnabled = a3;
}

- (int64_t)numberFeedback
{
  return self->_numberFeedback;
}

- (void)setNumberFeedback:(int64_t)a3
{
  self->_numberFeedback = a3;
}

- (int64_t)emojiFeedback
{
  return self->_emojiFeedback;
}

- (void)setEmojiFeedback:(int64_t)a3
{
  self->_emojiFeedback = a3;
}

- (void)setNavigationStyle:(int64_t)a3
{
  self->_int64_t navigationStyle = a3;
}

- (int64_t)navigationDirection
{
  return self->_navigationDirection;
}

- (void)setNavigationDirection:(int64_t)a3
{
  self->_navigationDirection = a3;
}

- (BOOL)captionPanelEnabled
{
  return self->_captionPanelEnabled;
}

- (void)setCaptionPanelEnabled:(BOOL)a3
{
  self->_captionPanelEnabled = a3;
}

- (double)lastTelephonyCallActive
{
  return self->_lastTelephonyCallActive;
}

- (void)setLastTelephonyCallActive:(double)a3
{
  self->_lastTelephonyCallActive = a3;
}

- (BOOL)automaticAccessibilityEnabled
{
  return self->_automaticAccessibilityEnabled;
}

- (void)setAutomaticAccessibilityEnabled:(BOOL)a3
{
  self->_automaticAccessibilityEnabled = a3;
}

- (BRLTTable)selectedBrailleGesturesInputTable
{
  return self->_selectedBrailleGesturesInputTable;
}

- (BOOL)updateRotorWithElement
{
  return self->_updateRotorWithElement;
}

- (void)setUpdateRotorWithElement:(BOOL)a3
{
  self->_updateRotorWithElement = a3;
}

- (BOOL)largeCursorEnabled
{
  return self->_largeCursorEnabled;
}

- (void)setLargeCursorEnabled:(BOOL)a3
{
  self->_largeCursorEnabled = a3;
}

- (NSMutableDictionary)websiteLanguageMappingOverrides
{
  return self->_websiteLanguageMappingOverrides;
}

- (void)setWebsiteLanguageMappingOverrides:(id)a3
{
}

- (id)punctuationGroupsUpdatedHandler
{
  return self->_punctuationGroupsUpdatedHandler;
}

- (void)setPunctuationGroupsUpdatedHandler:(id)a3
{
}

- (BOOL)reachabilityActive
{
  return self->_reachabilityActive;
}

- (void)setReachabilityActive:(BOOL)a3
{
  self->_reachabilityActive = a3;
}

- (double)reachabilityOffset
{
  return self->_reachabilityOffset;
}

- (void)setReachabilityOffset:(double)a3
{
  self->_reachabilityOffset = a3;
}

- (BOOL)audioDestinationRequestExternal
{
  return self->_audioDestinationRequestExternal;
}

- (void)setAudioDestinationRequestExternal:(BOOL)a3
{
  self->_audioDestinationRequestExternal = a3;
}

- (void)setActivities:(id)a3
{
}

- (int64_t)suppressValueChangeNotificationCount
{
  return self->_suppressValueChangeNotificationCount;
}

- (void)setSuppressValueChangeNotificationCount:(int64_t)a3
{
  self->_suppressValueChangeNotificationCount = a3;
}

- (int64_t)suppressSelectionChangeNotificationCount
{
  return self->_suppressSelectionChangeNotificationCount;
}

- (void)setSuppressSelectionChangeNotificationCount:(int64_t)a3
{
  self->_suppressSelectionChangeNotificationCount = a3;
}

- (int64_t)suppressSelectionChangeNotificationSpeechOutputCount
{
  return self->_suppressSelectionChangeNotificationSpeechOutputCount;
}

- (void)setSuppressSelectionChangeNotificationSpeechOutputCount:(int64_t)a3
{
  self->_suppressSelectionChangeNotificationSpeechOutputCount = a3;
}

- (int64_t)systemVisualizationState
{
  return self->_systemVisualizationState;
}

- (void)setSystemVisualizationState:(int64_t)a3
{
  self->_systemVisualizationState = a3;
}

- (BOOL)systemVolumeControlsAvailablity
{
  return self->_systemVolumeControlsAvailablity;
}

- (void)setSystemVolumeControlsAvailablity:(BOOL)a3
{
  self->_systemVolumeControlsAvailablitdouble y = a3;
}

- (AXUISoftwareKeyboardManager)softwareKeyboardManager
{
  return self->_softwareKeyboardManager;
}

- (_TtC3vot11VOTSettings)votSettings
{
  return self->_votSettings;
}

- (void)setVotSettings:(id)a3
{
}

- (void)setBrailleAlertsEnabled:(BOOL)a3
{
  self->_unsigned __int8 brailleAlertsEnabled = a3;
}

- (int)pointerVoiceOverCursorOption
{
  return self->_pointerVoiceOverCursorOption;
}

- (void)setPointerVoiceOverCursorOption:(int)a3
{
  self->_pointerVoiceOverCursorOption = a3;
}

- (BOOL)speakUnderPointer
{
  return self->_speakUnderPointer;
}

- (void)setSpeakUnderPointer:(BOOL)a3
{
  self->_speakUnderPointer = a3;
}

- (double)speakUnderPointerDelay
{
  return self->_speakUnderPointerDelay;
}

- (void)setSpeakUnderPointerDelay:(double)a3
{
  self->_speakUnderPointerDeladouble y = a3;
}

- (VOTVisionEngine)visionEngine
{
  return self->_visionEngine;
}

- (void)setVisionEngine:(id)a3
{
}

- (AXMDisplayManager)displayManager
{
  return self->_displayManager;
}

- (void)setDisplayManager:(id)a3
{
}

- (VOSCommandManager)userCommandManager
{
  return self->_userCommandManager;
}

- (void)setUserCommandManager:(id)a3
{
}

- (BOOL)useDigitalCrownNavigation
{
  return self->_useDigitalCrownNavigation;
}

- (BOOL)telephonyIsActive
{
  return self->_telephonyIsActive;
}

- (void)setTelephonyIsActive:(BOOL)a3
{
  self->_telephonyIsActive = a3;
}

- (VOTWorkspaceUnitTestDelegate)unitTestDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_unitTestDelegate);

  return (VOTWorkspaceUnitTestDelegate *)WeakRetained;
}

- (void)setUnitTestDelegate:(id)a3
{
}

- (BOOL)overridePropertiesForTesting
{
  return self->_overridePropertiesForTesting;
}

- (void)setOverridePropertiesForTesting:(BOOL)a3
{
  self->_overridePropertiesForTesting = a3;
}

- (BOOL)userRecentlyUnlockedDeviceForUnitTesting
{
  return self->_userRecentlyUnlockedDeviceForUnitTesting;
}

- (void)setUserRecentlyUnlockedDeviceForUnitTesting:(BOOL)a3
{
  self->_userRecentlyUnlockedDeviceForUnitTesting = a3;
}

- (BOOL)userUnlockedDeviceForUnitTesting
{
  return self->_userUnlockedDeviceForUnitTesting;
}

- (void)setUserUnlockedDeviceForUnitTesting:(BOOL)a3
{
  self->_userUnlockedDeviceForUnitTesting = a3;
}

- (BOOL)isRingerSwitchSilentForUnitTesting
{
  return self->_isRingerSwitchSilentForUnitTesting;
}

- (void)setIsRingerSwitchSilentForUnitTesting:(BOOL)a3
{
  self->_isRingerSwitchSilentForUnitTesting = a3;
}

- (int)currentCallStateForUnitTests
{
  return self->_currentCallStateForUnitTests;
}

- (void)setCurrentCallStateForUnitTests:(int)a3
{
  self->_currentCallStateForUnitTests = a3;
}

- (NSNumber)unitTestSpeechRate
{
  return self->_unitTestSpeechRate;
}

- (void)setUnitTestSpeechRate:(id)a3
{
}

- (NSString)unitTestSystemSpokenLanguage
{
  return self->_unitTestSystemSpokenLanguage;
}

- (NSString)reachabilityIdentifier
{
  return self->_reachabilityIdentifier;
}

- (void)setReachabilityIdentifier:(id)a3
{
}

- (BOOL)disableVoiceOverSettingOnStop
{
  return self->_disableVoiceOverSettingOnStop;
}

- (void)setDisableVoiceOverSettingOnStop:(BOOL)a3
{
  self->_disableVoiceOverSettingOnStop = a3;
}

- (AXCharacterSoundMap)characterSoundMap
{
  return self->_characterSoundMap;
}

- (void)setCharacterSoundMap:(id)a3
{
}

- (OS_dispatch_queue)managedConfigurationQueue
{
  return self->_managedConfigurationQueue;
}

- (void)setManagedConfigurationQueue:(id)a3
{
}

- (OS_os_transaction)votTransaction
{
  return self->_votTransaction;
}

- (void)setVotTransaction:(id)a3
{
}

- (double)automaticAccessibilityVisualizationsEnabled
{
  return self->_automaticAccessibilityVisualizationsEnabled;
}

- (void)setAutomaticAccessibilityVisualizationsEnabled:(double)a3
{
  self->_automaticAccessibilityVisualizationsEnabled = a3;
}

- (void)setLanguageTranslator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languageTranslator, 0);
  objc_storeStrong((id *)&self->_votTransaction, 0);
  objc_storeStrong((id *)&self->_managedConfigurationQueue, 0);
  objc_storeStrong((id *)&self->_characterSoundMap, 0);
  objc_storeStrong((id *)&self->_reachabilityIdentifier, 0);
  objc_storeStrong((id *)&self->_unitTestSystemSpokenLanguage, 0);
  objc_storeStrong((id *)&self->_unitTestSpeechRate, 0);
  objc_destroyWeak((id *)&self->_unitTestDelegate);
  objc_storeStrong((id *)&self->_userCommandManager, 0);
  objc_storeStrong((id *)&self->_displayManager, 0);
  objc_storeStrong((id *)&self->_visionEngine, 0);
  objc_storeStrong((id *)&self->_votSettings, 0);
  objc_storeStrong((id *)&self->_softwareKeyboardManager, 0);
  objc_storeStrong((id *)&self->_activities, 0);
  objc_storeStrong(&self->_punctuationGroupsUpdatedHandler, 0);
  objc_storeStrong((id *)&self->_websiteLanguageMappingOverrides, 0);
  objc_storeStrong((id *)&self->_imageCaptioningDisabledApps, 0);
  objc_storeStrong((id *)&self->_previousRotorVoiceIdentifier, 0);
  objc_storeStrong((id *)&self->_selectedActivity, 0);
  objc_storeStrong(&self->testingEventListener, 0);
  objc_storeStrong((id *)&self->additionalLanguageRotorItem, 0);
  objc_storeStrong((id *)&self->_assetController, 0);
  objc_storeStrong((id *)&self->_textChecker, 0);
  objc_storeStrong((id *)&self->_defaultPunctuationGroup, 0);
  objc_storeStrong((id *)&self->_punctuationGroups, 0);
  objc_storeStrong((id *)&self->_systemLangaugeLock, 0);
  objc_storeStrong((id *)&self->_postKeyThreadKey, 0);
  objc_storeStrong((id *)&self->_appCacheWithExactPID, 0);
  objc_storeStrong((id *)&self->_appCache, 0);
  objc_storeStrong((id *)&self->_selectedBrailleGesturesInputTable, 0);
  objc_storeStrong((id *)&self->_selectedBrailleInputTable, 0);
  objc_storeStrong((id *)&self->_selectedBrailleTable, 0);
  objc_storeStrong((id *)&self->_enabledBrailleLanguageRotorItems, 0);
  objc_storeStrong((id *)&self->_systemSpokenLanguage, 0);
  objc_storeStrong((id *)&self->_audioAccessoryInstalledAssetLanguage, 0);
  objc_storeStrong((id *)&self->_selectedLanguage, 0);
  objc_storeStrong((id *)&self->_enabledLanguageRotorItems, 0);
  objc_storeStrong((id *)&self->_completionRequest, 0);
  objc_storeStrong((id *)&self->_keyPostingQueue, 0);
  objc_storeStrong((id *)&self->_avAccessQueue, 0);
  objc_storeStrong((id *)&self->_callCenter, 0);
  objc_storeStrong((id *)&self->_callCenterQueue, 0);
  objc_storeStrong((id *)&self->_keyboardManager, 0);
  objc_storeStrong((id *)&self->_directTouchManager, 0);
  objc_storeStrong((id *)&self->_rotorManager, 0);
  objc_storeStrong((id *)&self->_elementManager, 0);

  objc_storeStrong((id *)&self->_eventFactory, 0);
}

- (void)setRotorManager:(id)a3
{
}

- (void)setElementManager:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_elementManager, a3);
  if ([v5 conformsToProtocol:&OBJC_PROTOCOL___VOTRotorManagementProtocol]) {
    [(VOTWorkspace *)self setRotorManager:v5];
  }
}

- (id)lastPostedEventForUnitTesting
{
  return (id)qword_1001EB900;
}

- (void)notePostedEventForUnitTesting:(id)a3
{
}

- (id)lastScreenChangeTime
{
  [(VOTElementManagementProtocol *)self->_elementManager lastScreenChangeNotificationTime];

  return +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:");
}

- (id)currentElementRotorString
{
  double v2 = [(VOTElementManagementProtocol *)self->_elementManager elementRotor];
  double v3 = [v2 currentRotorString];

  return v3;
}

- (void)_testFetchWebElementRects
{
  double v2 = [(VOTElementManagementProtocol *)self->_elementManager valueForKey:@"_currentElement"];
  if ([v2 doesHaveTraits:kAXWebContentTrait])
  {
    double v3 = VOTLogElement();
    if (os_signpost_enabled(v3))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "FetchWebElementRects", "", buf, 2u);
    }

    uint64_t v4 = 2000;
    do
    {
      [v2 updateFrame];
      --v4;
    }
    while (v4);
    id v5 = VOTLogElement();
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)id v6 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "FetchWebElementRects", "", v6, 2u);
    }
  }
}

- (double)_updateMainScreenSize:(double)a3 scale:
{
  *(double *)&xmmword_1001EBE30 = a1;
  *((double *)&xmmword_1001EBE30 + 1) = a2;
  qword_1001EBE40 = *(void *)&a3;
  double result = a1 * 0.5;
  *(double *)&xmmword_1001EBE50 = result;
  *((double *)&xmmword_1001EBE50 + 1) = a2 * 0.5;
  qword_1001EBE60 = *(void *)&result;
  *(double *)algn_1001EBE68 = a2 / 3.0;
  return result;
}

@end