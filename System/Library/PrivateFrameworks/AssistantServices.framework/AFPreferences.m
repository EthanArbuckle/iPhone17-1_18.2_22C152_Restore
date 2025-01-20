@interface AFPreferences
+ (id)sharedPreferences;
+ (id)sharedPreferencesWithInstanceContext:(id)a3;
- (AFPreferences)init;
- (AFPreferences)initWithInstanceContext:(id)a3;
- (BOOL)_defaultMultilingualResponseEnabledForLanguage:(id)a3;
- (BOOL)_dictationIsAllowed;
- (BOOL)_languageCode:(id)a3 isGoodFitForPreferredLanguages:(id)a4;
- (BOOL)allowExplicitContent;
- (BOOL)alwaysAllowVoiceActivation;
- (BOOL)alwaysObscureBackgroundContentWhenActive;
- (BOOL)alwaysShowRecognizedSpeech;
- (BOOL)assistantIsEnabled;
- (BOOL)assistantLanguageForceRTL;
- (BOOL)assistantOnDemandAssetSubscriptionAllowed;
- (BOOL)autoDismissal2018Enabled;
- (BOOL)avvcLoggingEnabled;
- (BOOL)cardLoggingEnabled;
- (BOOL)cloudSyncEnabled;
- (BOOL)commandLoggingEnabled;
- (BOOL)crownActivationEnabled;
- (BOOL)curareOrchestrationEnabled;
- (BOOL)debugButtonIsEnabled;
- (BOOL)designModeIsEnabled;
- (BOOL)deviceHasAtvOrHomepodInHome;
- (BOOL)deviceHasPairedWatches;
- (BOOL)deviceUsesCompactVoiceTrigger;
- (BOOL)dictationAutoPunctuationEnabled;
- (BOOL)dictationIsEnabled;
- (BOOL)disableAssistantWhilePasscodeLocked;
- (BOOL)disableMyriadBLEActivity;
- (BOOL)dismissWhenDeviceIsLoweredEnabled;
- (BOOL)dismissWhenFaceAttentionIsLostEnabled;
- (BOOL)displayedLowStorageNotificationForLanguage:(id)a3;
- (BOOL)enableEuclidAlternatives;
- (BOOL)feedbackBannerForAcceptsEnabled;
- (BOOL)feedbackBannerForNearMissesEnabled;
- (BOOL)fileLoggingIsEnabled;
- (BOOL)forceOfflineRecognitionEnabled;
- (BOOL)hasPresentedCompactVoiceTriggerDisclosure;
- (BOOL)hasPresentedCompactVoiceTriggerDiscoveryNotificationForBTDeviceWithAddress:(id)a3;
- (BOOL)hasSufficientAssetToDisableServerFallback;
- (BOOL)ignoreMyriadPlatformBias;
- (BOOL)infersQoSFromInstanceUUIDForEAR;
- (BOOL)isAccessibleEndpointerEnabled;
- (BOOL)isCurrentLocaleNativelySupported;
- (BOOL)isDictationHIPAACompliant;
- (BOOL)isInRestrictedSharingMode;
- (BOOL)isLocaleIdentifierNativelySupported:(id)a3;
- (BOOL)isMediaEntitySyncDisabled;
- (BOOL)isSearchDataSharingStatusForced;
- (BOOL)isSiriAccessibilityBargeInEnabled;
- (BOOL)isSmartLanguageSelectionEnabled;
- (BOOL)isSyncDisabledForFullUoDDevices;
- (BOOL)lastAnnouncementInThreadWasCancelledForApp:(id)a3 threadID:(id)a4;
- (BOOL)listenAfterSpeakingDisabled;
- (BOOL)mediaPlaybackEnabled;
- (BOOL)multilingualResponseEnabledForLanguage:(id)a3;
- (BOOL)myriadCoordinationEnabled;
- (BOOL)myriadCoordinationEnabledForAccessoryLogging;
- (BOOL)myriadDuckingEnabled;
- (BOOL)myriadServerHasProvisioned;
- (BOOL)myriadServerProvisioning;
- (BOOL)myriadShouldIgnoreAdjustedBoost;
- (BOOL)nanoAlwaysShowRecognizedSpeech;
- (BOOL)nanoAssistantEnabled;
- (BOOL)nanoCrownActivationEnabled;
- (BOOL)nanoDictationAutoPunctuationEnabled;
- (BOOL)nanoDictationEnabled;
- (BOOL)nanoJSSupported;
- (BOOL)nanoMessageWithoutConfirmationEnabled;
- (BOOL)nanoPhraseSpotterEnabled;
- (BOOL)nanoRaiseToSpeakEnabled;
- (BOOL)nanoSiriResponseShouldAlwaysPrint;
- (BOOL)offlineDictationOverride;
- (BOOL)onDeviceDictationAvailableAlertPresented;
- (BOOL)preferOnlineRecognitionEnabled;
- (BOOL)prewarmOrbEnabled;
- (BOOL)quickTypeGestureEnabled;
- (BOOL)shouldDisableMediaEntitySync;
- (BOOL)shouldDisableServerFallbackDomain;
- (BOOL)shouldDisableServerFallbackNL;
- (BOOL)shouldSkipIntelligenceVoiceSelectionUpsell;
- (BOOL)shouldSuppressSiriDataSharingOptInAlert;
- (BOOL)showServerOnUI;
- (BOOL)showsHoldToTalkIndicator;
- (BOOL)siriInCallEnabled;
- (BOOL)siriResponseShouldAlwaysPrint;
- (BOOL)siriResponseShouldAlwaysPrintWithoutOverride;
- (BOOL)siriXDebugStatusEnabled;
- (BOOL)spokenNotificationSkipTriggerlessReplyConfirmation;
- (BOOL)startAlertEnabled;
- (BOOL)suppressAssistantOptIn;
- (BOOL)suppressDictationOptIn;
- (BOOL)tlsSessionTicketsFlushPending;
- (BOOL)useAtypicalSpeechModel;
- (BOOL)utteranceDetectionEnabled;
- (double)autoDismissalExtendedIdleTimeout;
- (double)autoDismissalIdleTimeout;
- (double)autoDismissalMaxAttentionSamplingTime;
- (double)handsOffIdleTimeInterval;
- (double)handsOnIdleTimeInterval;
- (double)myriadDeviceDelay;
- (double)myriadDeviceSlowdown;
- (double)myriadDeviceTrumpDelay;
- (double)myriadDeviceVTEndTimeDistanceThreshold;
- (double)myriadMaxNoOperationDelay;
- (double)myriadTestDeviceDelay;
- (float)myriadDeviceAdjust;
- (float)nanoTTSSpeakerVolume;
- (id)_AFSupportPreferencesValueForKey:(id)a3;
- (id)_bestSupportedLanguageCodeForLanguageCode:(id)a3 isGoodFit:(BOOL *)a4;
- (id)_bestSupportedLanguageCodeForLanguageCodes:(id)a3 isGoodFit:(BOOL *)a4;
- (id)_languageCodeWithFallback:(BOOL)a3;
- (id)_languagePreferencesForCurrentSystemConfiguration;
- (id)_nanoPreferencesValueForKey:(id)a3;
- (id)_outputVoiceWithFallback:(BOOL)a3;
- (id)activeDictationLanguages;
- (id)allSiriLanguageCodesForSystemLanguageCode:(id)a3 isGoodFit:(BOOL *)a4;
- (id)bestSupportedLanguageCodeForLanguageCode:(id)a3;
- (id)bluetoothPreferredCarAudioRoute;
- (id)configOverrides;
- (id)description;
- (id)dictationAutoPunctuationSupportedLocales;
- (id)dictationSLSLanguagesEnabled;
- (id)enabledDictationLocales;
- (id)getHomeAccessoriesRepromptStatus;
- (id)getHomeAccessorySiriDataSharingChangeLog;
- (id)getHomeAccessorySiriDataSharingPropagationLog;
- (id)horsemanSupplementalLanguageDictionary;
- (id)instanceContext;
- (id)languageCode;
- (id)myriadDeviceGroup;
- (id)myriadLastWin;
- (id)myriadMonitorTimeOutInterval;
- (id)nanoDictationAutoPunctuationSupportedLanguages;
- (id)nanoLanguageCode;
- (id)nanoOfflineDictationStatus;
- (id)nanoOutputVoice;
- (id)offlineDictationProfileOverridePath;
- (id)offlineDictationStatus;
- (id)outputVoice;
- (id)siriDataSharingOptInStatusHistory;
- (id)siriSpeechRate;
- (id)speechProfileExternalOfflineModelRootPath;
- (id)storedHeadGestureConfigurationForDevice;
- (id)supplementalLanguageDictionaryForProduct:(id)a3;
- (id)supplementalLanguages;
- (id)supplementalLanguagesForProduct:(id)a3 forBuildVersion:(id)a4;
- (id)supplementalLanguagesModificationDate;
- (id)valueForSessionContextPreferenceKey:(id)a3;
- (int)myriadConstantGoodness;
- (int64_t)accessibleEndpointerThreshold;
- (int64_t)getSearchQueriesDataSharingStatus;
- (int64_t)nanoUseDeviceSpeakerForTTS;
- (int64_t)siriDataSharingOptInStatus;
- (int64_t)useDeviceSpeakerForTTS;
- (unint64_t)currentNavigationState;
- (unint64_t)internalUserClassification;
- (unint64_t)nanoVTPhraseType;
- (unsigned)myriadDeviceClass;
- (void)_AFSupportPreferencesSetValue:(id)a3 forKey:(id)a4;
- (void)_assistantEnablementDidChangeExternally;
- (void)_dictationEnablementDidChangeExternally;
- (void)_internalPreferencesDidChangeExternally;
- (void)_languageCodeDidChangeExternally;
- (void)_nanoPrefsDidChangeExternally;
- (void)_outputVoiceDidChangeExternally;
- (void)_preferencesDidChangeExternally;
- (void)_registerForAssistantEnablementChangeNotifications;
- (void)_registerForDarwinNotification:(__CFString *)a3 block:(id)a4;
- (void)_registerForDictationEnablementChangeNotifications;
- (void)_registerForInternalPrefs;
- (void)_registerForLanguageCodeChangeNotifications;
- (void)_registerForNanoPrefsChangeNotifications;
- (void)_registerForNavStatusIfNeeded;
- (void)_registerForOutputVoice;
- (void)_setAssistantIsEnabledLocal:(BOOL)a3;
- (void)_setDictationAutoPunctuationEnabledLocal:(BOOL)a3;
- (void)_setDictationIsAllowed:(BOOL)a3;
- (void)_setDictationIsEnabledLocal:(BOOL)a3;
- (void)_setLoggingDefaultValue:(id)a3 forKey:(id)a4;
- (void)_setNanoPreferencesValue:(id)a3 forKey:(id)a4;
- (void)_setOnDeviceDictationAvailableAlertPresentedLocal:(BOOL)a3;
- (void)_setSuppressDictationOptInLocal:(BOOL)a3;
- (void)_suppressLowStorageNotificationForLanguage:(id)a3 suppress:(BOOL)a4;
- (void)appendHomeAccessorySiriDataSharingChangeLogEvent:(id)a3;
- (void)appendToSiriDataSharingOptInStatusHistory:(int64_t)a3 previousOptInStatus:(int64_t)a4 statusChangeSource:(int64_t)a5 reason:(id)a6;
- (void)clearAnnounceNotificationsInCarPlayTemporarilyDisabled;
- (void)clearAnnounceNotificationsInCarPlayType;
- (void)clearMessageWithoutConfirmationEnabled;
- (void)clearMessageWithoutConfirmationHeadphonesEnabled;
- (void)clearMessageWithoutConfirmationInCarPlayEnabled;
- (void)clearShowAppsBehindSiriInCarPlayEnabled;
- (void)clearSpokenNotificationTemporarilyDisabledStatus;
- (void)dealloc;
- (void)erasePreferences;
- (void)getAnnounceNotificationsInCarPlayTemporarilyDisabledWithCompletion:(id)a3;
- (void)getAnnounceNotificationsInCarPlayTypeWithCompletion:(id)a3;
- (void)getAnnounceNotificationsTemporarilyDisabledEndDateForApp:(id)a3 platform:(int64_t)a4 completion:(id)a5;
- (void)getAnnounceNotificationsTemporarilyDisabledEndDateForPlatform:(int64_t)a3 completion:(id)a4;
- (void)getAnnounceNotificationsTemporarilyDisabledForApp:(id)a3 platform:(int64_t)a4 completion:(id)a5;
- (void)getAnnounceNotificationsTemporarilyDisabledStatusForPlatform:(int64_t)a3 completion:(id)a4;
- (void)getConversationAwarenessForCurrentlyRoutedDeviceWithCompletion:(id)a3;
- (void)getExperimentForConfigurationIdentifier:(id)a3 completion:(id)a4;
- (void)getHeadGesturesForCurrentlyRoutedDeviceWithCompletion:(id)a3;
- (void)getMessageWithoutConfirmationEnabledWithCompletion:(id)a3;
- (void)getMessageWithoutConfirmationHeadphonesEnabledWithCompletion:(id)a3;
- (void)getMessageWithoutConfirmationInCarPlayEnabledWithCompletion:(id)a3;
- (void)getOfflineDictationStatusWithCompletion:(id)a3;
- (void)getPersonalVolumeForCurrentlyRoutedDeviceWithCompletion:(id)a3;
- (void)getShowAppsBehindSiriInCarPlayEnabledWithCompletion:(id)a3;
- (void)getSpokenNotificationIsAlwaysOpportuneWithCompletion:(id)a3;
- (void)getSpokenNotificationShouldAnnounceAllNotificationsWithCompletion:(id)a3;
- (void)getSpokenNotificationShouldSkipTriggerlessRepliesWithCompletion:(id)a3;
- (void)getSpokenNotificationTemporarilyDisabledEndDateForApp:(id)a3 completion:(id)a4;
- (void)getSpokenNotificationTemporarilyDisabledEndDateWithCompletion:(id)a3;
- (void)getSpokenNotificationTemporarilyDisabledForApp:(id)a3 completion:(id)a4;
- (void)getSpokenNotificationTemporarilyDisabledStatusWithCompletion:(id)a3;
- (void)insertHomeAccessorySiriDataSharingPropagationLogEvent:(id)a3;
- (void)markLastAnnouncementInThreadAsCancelledForApp:(id)a3 threadID:(id)a4;
- (void)removeConfigOverrideForKey:(id)a3;
- (void)removeThreadCancellationForApp:(id)a3 threadID:(id)a4;
- (void)resetSessionLanguage;
- (void)setAVVCLoggingEnabled:(BOOL)a3;
- (void)setAccessibleEndpointerThreshold:(int64_t)a3;
- (void)setAlwaysAllowVoiceActivation:(BOOL)a3;
- (void)setAlwaysInAmbient:(BOOL)a3;
- (void)setAlwaysObscureBackgroundContentWhenActive:(BOOL)a3;
- (void)setAlwaysShowRecognizedSpeech:(BOOL)a3;
- (void)setAnnounceNotificationsInCarPlayTemporarilyDisabled:(BOOL)a3;
- (void)setAnnounceNotificationsInCarPlayType:(int64_t)a3;
- (void)setAnnounceNotificationsOnBuiltInSpeakerEnabled:(BOOL)a3;
- (void)setAnnounceNotificationsOnHearingAidsEnabled:(BOOL)a3;
- (void)setAnnounceNotificationsOnHearingAidsSupported:(BOOL)a3;
- (void)setAnnounceNotificationsTemporarilyDisabledUntil:(id)a3 forApp:(id)a4 platform:(int64_t)a5;
- (void)setAnnounceNotificationsTemporarilyDisabledUntil:(id)a3 platform:(int64_t)a4;
- (void)setAssistantIsEnabled:(BOOL)a3;
- (void)setAssistantLanguageForceRTL:(BOOL)a3;
- (void)setAutoDismissal2018Enabled:(BOOL)a3;
- (void)setAutoDismissalExtendedIdleTimeout:(double)a3;
- (void)setAutoDismissalIdleTimeout:(double)a3;
- (void)setAutoDismissalMaxAttentionSamplingTime:(double)a3;
- (void)setBluetoothPreferredCarAudioRoute:(id)a3;
- (void)setCardLoggingEnabled:(BOOL)a3;
- (void)setCloudSyncEnabled:(BOOL)a3;
- (void)setCommandLoggingEnabled:(BOOL)a3;
- (void)setCompactVoiceTriggerDisclosurePresented:(BOOL)a3;
- (void)setCompactVoiceTriggerDiscoveryNotificationPresented:(BOOL)a3 forBTDeviceWithAddress:(id)a4;
- (void)setCompanionConnectionsOverBLEEnabled:(BOOL)a3;
- (void)setConfigOverrideWithValue:(id)a3 forKey:(id)a4;
- (void)setConfigOverrides:(id)a3;
- (void)setConversationAwarenessForCurrentlyRoutedDevice:(BOOL)a3 withCompletion:(id)a4;
- (void)setCrownActivationEnabled:(BOOL)a3;
- (void)setCurareOrchestrationEnabled:(BOOL)a3;
- (void)setCurrentNavigationState:(unint64_t)a3;
- (void)setDatabaseSyncEnabled:(BOOL)a3;
- (void)setDebugButtonIsEnabled:(BOOL)a3;
- (void)setDesignModeEnabled:(BOOL)a3;
- (void)setDeviceUnlockSignal:(BOOL)a3;
- (void)setDictationAutoPunctuationEnabled:(BOOL)a3;
- (void)setDictationIsEnabled:(BOOL)a3;
- (void)setDictationSLSLanguagesEnabled:(id)a3;
- (void)setDisableAssistantWhilePasscodeLocked:(BOOL)a3;
- (void)setDismissWhenDeviceIsLoweredEnabled:(BOOL)a3;
- (void)setDismissWhenFaceAttentionIsLostEnabled:(BOOL)a3;
- (void)setEnableDragAndDrop:(BOOL)a3;
- (void)setEnableNonFullScreenAppearance:(BOOL)a3;
- (void)setFeedbackBannerForAcceptsEnabled:(BOOL)a3;
- (void)setFeedbackBannerForNearMissesEnabled:(BOOL)a3;
- (void)setFileLoggingIsEnabled:(BOOL)a3;
- (void)setForceOfflineRecognitionEnabled:(BOOL)a3;
- (void)setHandsOffIdleTimeInterval:(double)a3;
- (void)setHandsOnIdleTimeInterval:(double)a3;
- (void)setHeadGesturesForCurrentlyRoutedDevice:(BOOL)a3 withCompletion:(id)a4;
- (void)setHomeAccessoriesRepromptStatus:(id)a3;
- (void)setIgnoreMyriadAdjustedBoost:(BOOL)a3;
- (void)setIgnoreMyriadPlatformBias:(BOOL)a3;
- (void)setIgnoreServerManualEndpointingThreshold:(BOOL)a3;
- (void)setInProgressOutputVoice:(id)a3;
- (void)setInternalUserClassification:(unint64_t)a3;
- (void)setKeepRecordedAudioFiles:(BOOL)a3;
- (void)setLanguageCode:(id)a3;
- (void)setLanguageCode:(id)a3 outputVoice:(id)a4;
- (void)setLanguageDetectorEnabled:(BOOL)a3;
- (void)setLimitedAudioLoggingEnabled:(BOOL)a3;
- (void)setListenAfterSpeakingDisabled:(BOOL)a3;
- (void)setLongLivedIdentifierUploadingEnabled:(BOOL)a3;
- (void)setManualEndpointingThreshold:(id)a3;
- (void)setMediaPlaybackEnabled:(BOOL)a3;
- (void)setMessageWithoutConfirmationEnabled:(BOOL)a3;
- (void)setMessageWithoutConfirmationHeadphonesEnabled:(BOOL)a3;
- (void)setMessageWithoutConfirmationInCarPlayEnabled:(BOOL)a3;
- (void)setMultilingualResponseEnabled:(BOOL)a3 forLanguage:(id)a4;
- (void)setMyriadConstantGoodness:(int)a3;
- (void)setMyriadCoordinationEnabled:(BOOL)a3;
- (void)setMyriadDeviceAdjust:(float)a3;
- (void)setMyriadDeviceClass:(unsigned __int8)a3;
- (void)setMyriadDeviceDelay:(double)a3;
- (void)setMyriadDeviceGroup:(id)a3;
- (void)setMyriadDeviceSlowdown:(double)a3;
- (void)setMyriadDeviceTrumpDelay:(double)a3;
- (void)setMyriadDeviceVTEndTimeDistanceThreshold:(double)a3;
- (void)setMyriadDuckingEnabled:(BOOL)a3;
- (void)setMyriadLastWin;
- (void)setMyriadMaxNoOperationDelay:(double)a3;
- (void)setMyriadServerHasProvisioned:(BOOL)a3;
- (void)setMyriadServerProvisioning:(BOOL)a3;
- (void)setMyriadTestDeviceDelay:(double)a3;
- (void)setNanoAlwaysShowRecognizedSpeech:(BOOL)a3;
- (void)setNanoAssistantEnabled:(BOOL)a3;
- (void)setNanoCrownActivationEnabled:(BOOL)a3;
- (void)setNanoDictationAutoPunctuationEnabled:(BOOL)a3;
- (void)setNanoDictationEnabled:(BOOL)a3;
- (void)setNanoLanguageCode:(id)a3;
- (void)setNanoLanguageCode:(id)a3 outputVoice:(id)a4 forTinkerDevice:(id)a5;
- (void)setNanoMessageWithoutConfirmationEnabled:(BOOL)a3;
- (void)setNanoOutputVoice:(id)a3;
- (void)setNanoPhraseSpotterEnabled:(BOOL)a3;
- (void)setNanoRaiseToSpeakEnabled:(BOOL)a3;
- (void)setNanoSiriResponseShouldAlwaysPrint:(BOOL)a3;
- (void)setNanoTTSSpeakerVolume:(float)a3;
- (void)setNanoUseDeviceSpeakerForTTS:(int64_t)a3;
- (void)setNanoVTPhraseType:(unint64_t)a3;
- (void)setNetworkLoggingEnabled:(BOOL)a3;
- (void)setOfflineDictationOverride:(BOOL)a3;
- (void)setOfflineDictationProfileOverridePath:(id)a3;
- (void)setOfflineDictationStatus:(id)a3;
- (void)setOnDeviceDictationAvailableAlertPresented:(BOOL)a3;
- (void)setOpportuneSpeakingFileLoggingIsEnabled:(BOOL)a3;
- (void)setOutputVoice:(id)a3;
- (void)setOverrideModeWhileInAmbient:(BOOL)a3;
- (void)setPersonalVolumeForCurrentlyRoutedDevice:(BOOL)a3 withCompletion:(id)a4;
- (void)setPreferOnlineRecognitionEnabled:(BOOL)a3;
- (void)setQuickTypeGestureEnabled:(BOOL)a3;
- (void)setSearchQueriesDataSharingStatus:(int64_t)a3 completion:(id)a4;
- (void)setServerOverride:(id)a3;
- (void)setShouldSkipIntelligenceVoiceSelectionUpsell:(BOOL)a3;
- (void)setShowAppsBehindSiriInCarPlayEnabled:(BOOL)a3;
- (void)setShowServerOnUI:(BOOL)a3;
- (void)setShowsHoldToTalkIndicator:(BOOL)a3;
- (void)setSiriAccessibilityBargeInEnabled:(BOOL)a3;
- (void)setSiriDataSharingHomePodSetupDeviceIsValid:(BOOL)a3 completion:(id)a4;
- (void)setSiriDataSharingOptInAlertPresented:(BOOL)a3 completion:(id)a4;
- (void)setSiriDataSharingOptInStatus:(int64_t)a3 completion:(id)a4;
- (void)setSiriDataSharingOptInStatus:(int64_t)a3 propagateToHomeAccessories:(BOOL)a4 source:(int64_t)a5 reason:(id)a6 completion:(id)a7;
- (void)setSiriDebugUIEnabled:(BOOL)a3;
- (void)setSiriInCallEnabled:(BOOL)a3;
- (void)setSiriResponseShouldAlwaysPrint:(BOOL)a3;
- (void)setSiriSpeakerGradingDebugUIEnabled:(BOOL)a3;
- (void)setSiriSpeechRate:(id)a3;
- (void)setSiriXDebugStatusEnabled:(BOOL)a3;
- (void)setSmartLanguageSelection:(BOOL)a3;
- (void)setSpeechProfileExternalOfflineModelRootPath:(id)a3;
- (void)setSpokenNotificationIsAlwaysOpportune:(BOOL)a3;
- (void)setSpokenNotificationShouldAnnounceAllNotifications:(BOOL)a3;
- (void)setSpokenNotificationShouldSkipTriggerlessReplies:(BOOL)a3;
- (void)setSpokenNotificationSkipTriggerlessReplyConfirmation:(BOOL)a3;
- (void)setSpokenNotificationTemporarilyDisabledForApp:(id)a3 until:(id)a4;
- (void)setSpokenNotificationTemporarilyDisabledUntil:(id)a3;
- (void)setSpokenNotificationsProxCardSeen;
- (void)setStartAlertEnabled:(BOOL)a3;
- (void)setStoredHeadGestureConfigurationForDevice:(id)a3;
- (void)setStreamingDictationEnabled:(BOOL)a3;
- (void)setSuppressAssistantOptIn:(BOOL)a3;
- (void)setSuppressDictationOptIn:(BOOL)a3;
- (void)setTLSSessionTicketsFlushPending:(BOOL)a3;
- (void)setUseAtypicalSpeechModel:(BOOL)a3;
- (void)setUseDeviceSpeakerForTTS:(int64_t)a3;
- (void)setUtteranceDetectionEnabled:(BOOL)a3;
- (void)setValue:(id)a3 forSessionContextKey:(id)a4;
- (void)suppressLowStorageNotificationForLanguage:(id)a3 suppress:(BOOL)a4;
- (void)synchronize;
- (void)synchronizeAVVCPreferencesDomain;
- (void)synchronizeLogPreferencesDomain;
- (void)synchronizeVoiceServicesLanguageCode;
@end

@implementation AFPreferences

- (BOOL)suppressDictationOptIn
{
  return _AFSupportPreferencesBoolForKeyWithDefault(@"Suppress Dictation Opt In", 0);
}

- (BOOL)dictationIsEnabled
{
  v2 = self;
  [(AFPreferences *)self _registerForDictationEnablementChangeNotifications];
  v3 = _AFPreferencesValueForKeyWithContext(@"Dictation Enabled", @"com.apple.assistant.support", v2->_instanceContext);
  LOBYTE(v2) = _AFPreferencesBoolFromValueWithDefault(v3, @"Dictation Enabled", 0);

  return (char)v2;
}

- (BOOL)assistantIsEnabled
{
  v2 = self;
  [(AFPreferences *)self _registerForAssistantEnablementChangeNotifications];
  v3 = _AFPreferencesValueForKeyWithContext(@"Assistant Enabled", @"com.apple.assistant.support", v2->_instanceContext);
  LOBYTE(v2) = _AFPreferencesBoolFromValueWithDefault(v3, @"Assistant Enabled", 0);

  return (char)v2;
}

- (void)_registerForAssistantEnablementChangeNotifications
{
  if ((atomic_exchange(&self->_registeredForAssistantEnablement._Value, 1u) & 1) == 0)
  {
    [(AFPreferences *)self _registerForInternalPrefs];
    [(AFPreferences *)self _registerForDarwinNotification:@"AFAssistantEnablementDidChangeDarwinNotification" block:&__block_literal_global_1167];
  }
}

- (void)_registerForDictationEnablementChangeNotifications
{
  if ((atomic_exchange(&self->_registeredForDictationEnablement._Value, 1u) & 1) == 0)
  {
    [(AFPreferences *)self _registerForInternalPrefs];
    [(AFPreferences *)self _registerForDarwinNotification:@"AFDictationEnablementDidChangeDarwinNotification" block:&__block_literal_global_1169];
  }
}

- (void)_registerForInternalPrefs
{
  if ((atomic_exchange(&self->_registeredForInternalPrefs._Value, 1u) & 1) == 0) {
    [(AFPreferences *)self _registerForDarwinNotification:@"AFInternalPreferencesDidChangeDarwinNotification" block:&__block_literal_global_1159];
  }
}

- (BOOL)isDictationHIPAACompliant
{
  if (AFDeviceHighestLanguageModelCapabilityIdentifier_onceToken != -1) {
    dispatch_once(&AFDeviceHighestLanguageModelCapabilityIdentifier_onceToken, &__block_literal_global_705);
  }
  if (AFDeviceHighestLanguageModelCapabilityIdentifier_deviceHighestCapabilityIdentifier != 1
    || !AFDictationHasHighQualityModels()
    || [(AFPreferences *)self siriDataSharingOptInStatus] == 1
    || [(AFPreferences *)self assistantIsEnabled]
    || ![(AFPreferences *)self dictationIsEnabled])
  {
    return 0;
  }
  return _AFPreferencesForceOnDeviceOnlyDictationEnabled();
}

- (int64_t)siriDataSharingOptInStatus
{
  CFPreferencesAppSynchronize(@"com.apple.assistant.support");
  instanceContext = self->_instanceContext;
  return _AFPreferencesSiriDataSharingOptInStatusWithContext(instanceContext);
}

+ (id)sharedPreferences
{
  if (sharedPreferences_onceToken != -1) {
    dispatch_once(&sharedPreferences_onceToken, &__block_literal_global_1136);
  }
  v2 = (void *)sharedPreferences_sSharedPreferences;
  return v2;
}

- (id)offlineDictationStatus
{
  v2 = _AFPreferencesValueForKeyWithContext(@"Offline Dictation Status", @"com.apple.assistant.support", self->_instanceContext);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (unint64_t)currentNavigationState
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  navTokenQueue = self->_navTokenQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__AFPreferences_currentNavigationState__block_invoke;
  v5[3] = &unk_1E592C6C0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(navTokenQueue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (AFPreferences)initWithInstanceContext:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)AFPreferences;
  v5 = [(AFPreferences *)&v20 init];
  if (v5)
  {
    if (AFLogInitIfNeeded_once != -1) {
      dispatch_once(&AFLogInitIfNeeded_once, &__block_literal_global_2935);
    }
    uint64_t v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("navTokenQueue", v6);
    navTokenQueue = v5->_navTokenQueue;
    v5->_navTokenQueue = (OS_dispatch_queue *)v7;

    if (v4)
    {
      uint64_t v9 = (AFInstanceContext *)v4;
    }
    else
    {
      uint64_t v9 = +[AFInstanceContext defaultContext];
    }
    instanceContext = v5->_instanceContext;
    v5->_instanceContext = v9;

    uint64_t v11 = +[AFPreferencesNotificationCenter sharedInstance];
    trampoline = v5->_trampoline;
    v5->_trampoline = (AFPreferencesNotificationCenter *)v11;

    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    trampolineObservers = v5->_trampolineObservers;
    v5->_trampolineObservers = v13;

    v15 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    trampolineObserverListLock = v5->_trampolineObserverListLock;
    v5->_trampolineObserverListLock = v15;

    v17 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      v19 = v5->_instanceContext;
      *(_DWORD *)buf = 136315650;
      v22 = "-[AFPreferences initWithInstanceContext:]";
      __int16 v23 = 2048;
      v24 = v5;
      __int16 v25 = 2112;
      v26 = v19;
      _os_log_debug_impl(&dword_19CF1D000, v17, OS_LOG_TYPE_DEBUG, "%s %p %@", buf, 0x20u);
    }
    [(AFPreferences *)v5 _registerForDarwinNotification:@"kAFPreferencesDidChangeDarwinNotification" block:&__block_literal_global_1155];
  }

  return v5;
}

- (void)_registerForDarwinNotification:(__CFString *)a3 block:(id)a4
{
  id v6 = a4;
  objc_initWeak(&location, self);
  trampoline = self->_trampoline;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __54__AFPreferences__registerForDarwinNotification_block___block_invoke;
  v10[3] = &unk_1E59262E0;
  objc_copyWeak(&v12, &location);
  id v8 = v6;
  id v11 = v8;
  uint64_t v9 = [(AFPreferencesNotificationCenter *)trampoline addObserverForDarwinName:a3 usingBlock:v10];
  [(NSLock *)self->_trampolineObserverListLock lock];
  [(NSMutableArray *)self->_trampolineObservers addObject:v9];
  [(NSLock *)self->_trampolineObserverListLock unlock];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (id)_languagePreferencesForCurrentSystemConfiguration
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  unint64_t v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v25 = "-[AFPreferences _languagePreferencesForCurrentSystemConfiguration]";
    __int16 v26 = 2112;
    uint64_t v27 = v2;
    _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s preferredLanguages = %@", buf, 0x16u);
  }
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v2, "count") + 1);
  v5 = [MEMORY[0x1E4F1CA20] currentLocale];
  id v6 = [v5 countryCode];
  dispatch_queue_t v7 = [v5 localeIdentifier];
  id v8 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v25 = "-[AFPreferences _languagePreferencesForCurrentSystemConfiguration]";
    __int16 v26 = 2112;
    uint64_t v27 = v7;
    _os_log_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_INFO, "%s currentLocale identifier = %@", buf, 0x16u);
  }
  uint64_t v9 = [MEMORY[0x1E4F1CA20] canonicalLanguageIdentifierFromString:v7];
  v10 = _AFAddCountryCodeToLanguageIdentifier(v6, v9);

  [v4 addObject:v10];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v11 = v2;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = _AFAddCountryCodeToLanguageIdentifier(v6, *(void **)(*((void *)&v19 + 1) + 8 * i));
        objc_msgSend(v4, "addObject:", v16, (void)v19);
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v13);
  }

  v17 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v25 = "-[AFPreferences _languagePreferencesForCurrentSystemConfiguration]";
    __int16 v26 = 2112;
    uint64_t v27 = v4;
    _os_log_impl(&dword_19CF1D000, v17, OS_LOG_TYPE_INFO, "%s total preferences = %@", buf, 0x16u);
  }

  return v4;
}

- (id)_bestSupportedLanguageCodeForLanguageCodes:(id)a3 isGoodFit:(BOOL *)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = (__CFString *)a3;
  dispatch_queue_t v7 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v24 = "-[AFPreferences _bestSupportedLanguageCodeForLanguageCodes:isGoodFit:]";
    __int16 v25 = 2112;
    __int16 v26 = v6;
    _os_log_impl(&dword_19CF1D000, v7, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  if (![(__CFString *)v6 count])
  {
    if (a4) {
      *a4 = 0;
    }
    uint64_t v12 = @"en-US";
    goto LABEL_29;
  }
  long long v20 = self;
  long long v22 = a4;
  id v8 = _AFPreferencesAlternativeLocaleLanguages();
  uint64_t v9 = 0;
  if (![(__CFString *)v6 count])
  {
LABEL_14:
    if (v9) {
      uint64_t v14 = v9;
    }
    else {
      uint64_t v14 = v6;
    }
    id v11 = v14;
    v15 = AFPreferencesSupportedLanguages();
    v16 = [MEMORY[0x1E4F28B50] preferredLocalizationsFromArray:v15 forPreferences:v11];
    v17 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v24 = "-[AFPreferences _bestSupportedLanguageCodeForLanguageCodes:isGoodFit:]";
      __int16 v25 = 2112;
      __int16 v26 = v11;
      __int16 v27 = 2112;
      uint64_t v28 = v16;
      _os_log_impl(&dword_19CF1D000, v17, OS_LOG_TYPE_INFO, "%s Preferred Languages = %@, -> Best Supported Languages = %@", buf, 0x20u);
    }
    uint64_t v12 = [(__CFString *)v16 firstObject];
    if (![(__CFString *)v12 length])
    {

      v18 = AFSiriLogContextConnection;
      uint64_t v12 = @"en-US";
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v24 = "-[AFPreferences _bestSupportedLanguageCodeForLanguageCodes:isGoodFit:]";
        __int16 v25 = 2112;
        __int16 v26 = @"en-US";
        _os_log_impl(&dword_19CF1D000, v18, OS_LOG_TYPE_INFO, "%s falling back to %@", buf, 0x16u);
      }
    }
    if (v22) {
      BOOL *v22 = [v21 _languageCode:v12 isGoodFitForPreferredLanguages:v11];
    }

    goto LABEL_25;
  }
  uint64_t v10 = 0;
  while (1)
  {
    -[__CFString objectAtIndex:](v6, "objectAtIndex:", v10, v20);
    id v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = [v8 objectForKey:v11];
    if (v12) {
      break;
    }
LABEL_13:

    if (++v10 >= (unint64_t)[(__CFString *)v6 count]) {
      goto LABEL_14;
    }
  }
  uint64_t v13 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v24 = "-[AFPreferences _bestSupportedLanguageCodeForLanguageCodes:isGoodFit:]";
    __int16 v25 = 2112;
    __int16 v26 = v11;
    __int16 v27 = 2112;
    uint64_t v28 = v12;
    _os_log_impl(&dword_19CF1D000, v13, OS_LOG_TYPE_INFO, "%s %@ is intentionally supported as %@", buf, 0x20u);
  }
  if (v10)
  {
    if (!v9) {
      uint64_t v9 = (__CFString *)[(__CFString *)v6 mutableCopy];
    }
    [(__CFString *)v9 replaceObjectAtIndex:v10 withObject:v12];
    goto LABEL_13;
  }
  if (v22 && ([(__CFString *)v11 isEqualToString:@"hi-IN"] & 1) == 0) {
    BOOL *v22 = 1;
  }
LABEL_25:

LABEL_29:
  return v12;
}

void __46__AFPreferences__registerForNavStatusIfNeeded__block_invoke()
{
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:@"AFPreferencesNavStatusDidChangeNotification" object:0];
}

- (BOOL)deviceHasPairedWatches
{
  return _AFPreferencesBoolValueForKeyWithContext(@"Has paired watches", 0, @"com.apple.assistant", self->_instanceContext);
}

- (BOOL)deviceHasAtvOrHomepodInHome
{
  return _AFPreferencesBoolValueForKeyWithContext(@"Has ATV or HomePods in the home", 0, @"com.apple.assistant", self->_instanceContext);
}

- (BOOL)alwaysAllowVoiceActivation
{
  return _AFBackedUpPreferencesBoolForKeyWithDefault(@"Always Allow Voice Activation", 0);
}

- (id)_languageCodeWithFallback:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [(AFPreferences *)self _registerForLanguageCodeChangeNotifications];
  uint64_t v5 = _AFPreferencesValueForKeyWithContext(@"Session Language", @"com.apple.assistant.backedup", self->_instanceContext);
  id v6 = (void *)v5;
  if (v3 && !v5)
  {
    id v6 = [(AFPreferences *)self bestSupportedLanguageCodeForLanguageCode:0];
    dispatch_queue_t v7 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315394;
      uint64_t v10 = "-[AFPreferences _languageCodeWithFallback:]";
      __int16 v11 = 2112;
      uint64_t v12 = v6;
      _os_log_error_impl(&dword_19CF1D000, v7, OS_LOG_TYPE_ERROR, "%s No language code saved, but Assistant is enabled - returning: %@", (uint8_t *)&v9, 0x16u);
    }
  }
  return v6;
}

- (void)_registerForLanguageCodeChangeNotifications
{
  if ((atomic_exchange(&self->_registeredForLanguageCode._Value, 1u) & 1) == 0)
  {
    [(AFPreferences *)self _registerForInternalPrefs];
    [(AFPreferences *)self _registerForDarwinNotification:@"AFLanguageCodeDidChangeDarwinNotification" block:&__block_literal_global_1161];
  }
}

- (id)bestSupportedLanguageCodeForLanguageCode:(id)a3
{
  return [(AFPreferences *)self _bestSupportedLanguageCodeForLanguageCode:a3 isGoodFit:0];
}

- (id)_bestSupportedLanguageCodeForLanguageCode:(id)a3 isGoodFit:(BOOL *)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([v6 length])
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA20] canonicalLanguageIdentifierFromString:v6];

    uint64_t v12 = v7;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
    id v6 = (id)v7;
  }
  else
  {
    id v8 = [(AFPreferences *)self _languagePreferencesForCurrentSystemConfiguration];
    int v9 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v14 = "-[AFPreferences _bestSupportedLanguageCodeForLanguageCode:isGoodFit:]";
      __int16 v15 = 2112;
      v16 = v8;
      _os_log_impl(&dword_19CF1D000, v9, OS_LOG_TYPE_INFO, "%s input: nil -> %@", buf, 0x16u);
    }
  }
  uint64_t v10 = [(AFPreferences *)self _bestSupportedLanguageCodeForLanguageCodes:v8 isGoodFit:a4];

  return v10;
}

void __34__AFPreferences_sharedPreferences__block_invoke()
{
  id v2 = +[AFInstanceContext currentContext];
  uint64_t v0 = +[AFPreferences sharedPreferencesWithInstanceContext:v2];
  v1 = (void *)sharedPreferences_sSharedPreferences;
  sharedPreferences_sSharedPreferences = v0;
}

+ (id)sharedPreferencesWithInstanceContext:(id)a3
{
  id v3 = a3;
  id v4 = [[AFPreferences alloc] initWithInstanceContext:v3];

  return v4;
}

uint64_t __43__AFPreferences_setCurrentNavigationState___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _registerForNavStatusIfNeeded];
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v3 + 24))
  {
    uint64_t result = notify_set_state(*(_DWORD *)(v3 + 28), *(void *)(a1 + 40));
    if (!result)
    {
      return notify_post("com.apple.siri.nav_status");
    }
  }
  return result;
}

uint64_t __39__AFPreferences_currentNavigationState__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _registerForNavStatusIfNeeded];
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v3 + 24))
  {
    uint64_t state64 = 0;
    uint64_t result = notify_get_state(*(_DWORD *)(v3 + 28), &state64);
    if (result) {
      BOOL v4 = 1;
    }
    else {
      BOOL v4 = state64 > 3;
    }
    if (!v4) {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = state64;
    }
  }
  return result;
}

- (void)_registerForNavStatusIfNeeded
{
  if (!self->_navTokenIsValid)
  {
    if (AFIsHorseman_onceToken != -1) {
      dispatch_once(&AFIsHorseman_onceToken, &__block_literal_global_220_45602);
    }
    if (!AFIsHorseman_isHorseman)
    {
      uint64_t v3 = dispatch_get_global_queue(0, 0);
      uint32_t v4 = notify_register_dispatch("com.apple.siri.nav_status", &self->_navToken, v3, &__block_literal_global_1374);

      self->_navTokenIsValid = v4 == 0;
    }
  }
}

- (void)setCurrentNavigationState:(unint64_t)a3
{
  navTokenQueue = self->_navTokenQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __43__AFPreferences_setCurrentNavigationState___block_invoke;
  v4[3] = &unk_1E592B398;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(navTokenQueue, v4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trampolineObservers, 0);
  objc_storeStrong((id *)&self->_trampolineObserverListLock, 0);
  objc_storeStrong((id *)&self->_trampoline, 0);
  objc_storeStrong((id *)&self->_instanceContext, 0);
  objc_storeStrong((id *)&self->_navTokenQueue, 0);
}

- (void)erasePreferences
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    instanceContext = self->_instanceContext;
    int v5 = 136315394;
    id v6 = "-[AFPreferences erasePreferences]";
    __int16 v7 = 2112;
    id v8 = instanceContext;
    _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s Unable to erase all Siri preferences for %@.", (uint8_t *)&v5, 0x16u);
  }
}

- (void)setNanoAlwaysShowRecognizedSpeech:(BOOL)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  [(AFPreferences *)self _setNanoPreferencesValue:v4 forKey:@"Always Show Recognized Speech 2.0"];
}

- (BOOL)nanoAlwaysShowRecognizedSpeech
{
  id v2 = [(AFPreferences *)self _nanoPreferencesValueForKey:@"Always Show Recognized Speech 2.0"];
  uint64_t v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (void)setNanoSiriResponseShouldAlwaysPrint:(BOOL)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  [(AFPreferences *)self _setNanoPreferencesValue:v4 forKey:@"Siri Response Should Always Print"];
}

- (BOOL)nanoSiriResponseShouldAlwaysPrint
{
  id v2 = [(AFPreferences *)self _nanoPreferencesValueForKey:@"Siri Response Should Always Print"];
  uint64_t v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (id)nanoDictationAutoPunctuationSupportedLanguages
{
  id v2 = [(AFPreferences *)self _nanoPreferencesValueForKey:@"Dictation Auto Punctuation Supported Languages"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (id)nanoOfflineDictationStatus
{
  id v2 = [(AFPreferences *)self _nanoPreferencesValueForKey:@"Offline Dictation Status"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (void)setNanoMessageWithoutConfirmationEnabled:(BOOL)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  [(AFPreferences *)self _setNanoPreferencesValue:v4 forKey:@"Message Without Confirmation"];
}

- (BOOL)nanoMessageWithoutConfirmationEnabled
{
  id v2 = [(AFPreferences *)self _nanoPreferencesValueForKey:@"Message Without Confirmation"];
  id v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (void)setNanoCrownActivationEnabled:(BOOL)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  [(AFPreferences *)self _setNanoPreferencesValue:v4 forKey:@"Crown Activation Enabled"];
}

- (BOOL)nanoCrownActivationEnabled
{
  id v2 = [(AFPreferences *)self _nanoPreferencesValueForKey:@"Crown Activation Enabled"];
  id v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (void)setNanoOutputVoice:(id)a3
{
  id v4 = [a3 dictionaryRepresentation];
  [(AFPreferences *)self _setNanoPreferencesValue:v4 forKey:@"Output Voice"];
}

- (id)nanoOutputVoice
{
  id v2 = [(AFPreferences *)self _nanoPreferencesValueForKey:@"Output Voice"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = [[AFVoiceInfo alloc] initWithDictionaryRepresentation:v2];
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (void)setNanoLanguageCode:(id)a3
{
}

- (id)nanoLanguageCode
{
  return [(AFPreferences *)self _nanoPreferencesValueForKey:@"Session Language"];
}

- (void)setNanoTTSSpeakerVolume:(float)a3
{
  objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithFloat:");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(AFPreferences *)self _setNanoPreferencesValue:v4 forKey:@"TTS Speaker Volume"];
}

- (float)nanoTTSSpeakerVolume
{
  id v2 = [(AFPreferences *)self _nanoPreferencesValueForKey:@"TTS Speaker Volume"];
  if (!v2)
  {
    LODWORD(v3) = 1.0;
    id v2 = [MEMORY[0x1E4F28ED0] numberWithFloat:v3];
  }
  [v2 floatValue];
  float v5 = v4;

  return v5;
}

- (void)setNanoUseDeviceSpeakerForTTS:(int64_t)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
  [(AFPreferences *)self _setNanoPreferencesValue:v4 forKey:@"Use device speaker for TTS"];
}

- (int64_t)nanoUseDeviceSpeakerForTTS
{
  id v2 = [(AFPreferences *)self _nanoPreferencesValueForKey:@"Use device speaker for TTS"];
  double v3 = v2;
  if (v2) {
    int64_t v4 = [v2 integerValue];
  }
  else {
    int64_t v4 = 2;
  }

  return v4;
}

- (void)setNanoRaiseToSpeakEnabled:(BOOL)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  [(AFPreferences *)self _setNanoPreferencesValue:v4 forKey:@"RTS Enabled"];
}

- (BOOL)nanoRaiseToSpeakEnabled
{
  id v2 = [(AFPreferences *)self _nanoPreferencesValueForKey:@"RTS Enabled"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setNanoVTPhraseType:(unint64_t)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLong:a3];
  [(AFPreferences *)self _setNanoPreferencesValue:v4 forKey:@"VT Phrase Type"];
}

- (unint64_t)nanoVTPhraseType
{
  id v2 = [(AFPreferences *)self _nanoPreferencesValueForKey:@"VT Phrase Type"];
  unint64_t v3 = [v2 unsignedLongValue];

  return v3;
}

- (BOOL)nanoJSSupported
{
  id v2 = [(AFPreferences *)self _nanoPreferencesValueForKey:@"JS Supported"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setNanoPhraseSpotterEnabled:(BOOL)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  [(AFPreferences *)self _setNanoPreferencesValue:v4 forKey:@"PHS Enabled"];
}

- (BOOL)nanoPhraseSpotterEnabled
{
  id v2 = [(AFPreferences *)self _nanoPreferencesValueForKey:@"PHS Enabled"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setNanoLanguageCode:(id)a3 outputVoice:(id)a4 forTinkerDevice:(id)a5
{
  __int16 v7 = (id (__cdecl *)())getNPSDomainAccessorClass;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v16 = (id)[objc_alloc((Class)v7()) initWithDomain:@"com.apple.assistant.nano" pairedDevice:v8];

  [v16 setObject:v10 forKey:@"Session Language Tinker"];
  __int16 v11 = [v9 dictionaryRepresentation];

  [v16 setObject:v11 forKey:@"Output Voice Tinker"];
  id v12 = (id)[v16 synchronize];
  id v13 = objc_alloc_init((Class)getNPSManagerClass());
  uint64_t v14 = [v16 domain];
  __int16 v15 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"Session Language Tinker", @"Output Voice Tinker", 0);
  [v13 synchronizeNanoDomain:v14 keys:v15];
}

- (void)setNanoDictationAutoPunctuationEnabled:(BOOL)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  [(AFPreferences *)self _setNanoPreferencesValue:v4 forKey:@"Dictation Auto Punctuation Enabled"];
}

- (BOOL)nanoDictationAutoPunctuationEnabled
{
  id v2 = [(AFPreferences *)self _nanoPreferencesValueForKey:@"Dictation Auto Punctuation Enabled"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setNanoDictationEnabled:(BOOL)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  [(AFPreferences *)self _setNanoPreferencesValue:v4 forKey:@"Dictation Enabled"];
}

- (BOOL)nanoDictationEnabled
{
  id v2 = [(AFPreferences *)self _nanoPreferencesValueForKey:@"Dictation Enabled"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setNanoAssistantEnabled:(BOOL)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  [(AFPreferences *)self _setNanoPreferencesValue:v4 forKey:@"Assistant Enabled"];
}

- (BOOL)nanoAssistantEnabled
{
  id v2 = [(AFPreferences *)self _nanoPreferencesValueForKey:@"Assistant Enabled"];
  char v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (void)_setNanoPreferencesValue:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(AFPreferences *)self _registerForNanoPrefsChangeNotifications];
  _AFNanoPreferencesSetValueForKey(v7, (uint64_t)v6);
}

- (id)_nanoPreferencesValueForKey:(id)a3
{
  id v4 = a3;
  [(AFPreferences *)self _registerForNanoPrefsChangeNotifications];
  float v5 = _AFNanoPreferencesValueForKey((uint64_t)v4);

  return v5;
}

- (void)setServerOverride:(id)a3
{
}

- (id)configOverrides
{
  id v2 = _AFPreferencesValueForKeyWithContext(@"Config Overrides", @"com.apple.assistant", 0);
  char v3 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v2];
  id v4 = _AFPreferencesValueForKeyWithContext(@"Config Profile Overrides", @"com.apple.assistant", 0);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v3 addEntriesFromDictionary:v4];
  }

  return v3;
}

- (void)setConfigOverrides:(id)a3
{
  _AFPreferencesSetValueForKeyWithContext(a3, @"Config Overrides", @"com.apple.assistant", 0);
  [(AFPreferences *)self synchronize];
}

- (void)removeConfigOverrideForKey:(id)a3
{
  id v7 = a3;
  id v4 = [(AFPreferences *)self configOverrides];
  float v5 = (void *)[v4 mutableCopy];

  id v6 = [v5 objectForKey:v7];

  if (v6)
  {
    [v5 removeObjectForKey:v7];
    [(AFPreferences *)self setConfigOverrides:v5];
  }
}

- (void)setConfigOverrideWithValue:(id)a3 forKey:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [(AFPreferences *)self configOverrides];
  id v8 = (void *)[v7 mutableCopy];

  if (!v8) {
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
  }
  [v8 setObject:v9 forKey:v6];
  [(AFPreferences *)self setConfigOverrides:v8];
}

- (void)setHandsOffIdleTimeInterval:(double)a3
{
  if (AFIsInternalInstall_onceToken != -1) {
    dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_158);
  }
  if (AFIsInternalInstall_isInternal)
  {
    float v5 = [MEMORY[0x1E4F28ED0] numberWithDouble:a3];
    _AFPreferencesSetValueForKeyWithContext(v5, @"Hands-Off Idle Time Interval (sec)", @"com.apple.assistant", 0);

    [(AFPreferences *)self synchronize];
  }
}

- (double)handsOffIdleTimeInterval
{
  if (AFIsInternalInstall_onceToken != -1) {
    dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_158);
  }
  if (!AFIsInternalInstall_isInternal) {
    return 0.0;
  }
  id v2 = _AFPreferencesValueForKeyWithContext(@"Hands-Off Idle Time Interval (sec)", @"com.apple.assistant", 0);
  char v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 3.0;
  }

  return v5;
}

- (void)setHandsOnIdleTimeInterval:(double)a3
{
  if (AFIsInternalInstall_onceToken != -1) {
    dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_158);
  }
  if (AFIsInternalInstall_isInternal)
  {
    double v5 = [MEMORY[0x1E4F28ED0] numberWithDouble:a3];
    _AFPreferencesSetValueForKeyWithContext(v5, @"Hands-On Idle Time Interval (sec)", @"com.apple.assistant", 0);

    [(AFPreferences *)self synchronize];
  }
}

- (double)handsOnIdleTimeInterval
{
  if (AFIsInternalInstall_onceToken != -1) {
    dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_158);
  }
  if (!AFIsInternalInstall_isInternal) {
    return 0.0;
  }
  id v2 = _AFPreferencesValueForKeyWithContext(@"Hands-On Idle Time Interval (sec)", @"com.apple.assistant", 0);
  char v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 3.0;
  }

  return v5;
}

- (void)setDismissWhenDeviceIsLoweredEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if (AFIsInternalInstall_onceToken != -1) {
    dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_158);
  }
  if (AFIsInternalInstall_isInternal)
  {
    double v5 = [MEMORY[0x1E4F28ED0] numberWithBool:v3];
    _AFPreferencesSetValueForKeyWithContext(v5, @"Dismiss When Device is Lowered", @"com.apple.assistant", 0);

    [(AFPreferences *)self synchronize];
  }
}

- (BOOL)dismissWhenDeviceIsLoweredEnabled
{
  if (AFIsInternalInstall_onceToken != -1) {
    dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_158);
  }
  if (!AFIsInternalInstall_isInternal) {
    return 0;
  }
  id v2 = _AFPreferencesValueForKeyWithContext(@"Dismiss When Device is Lowered", @"com.apple.assistant", 0);
  BOOL v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (void)setDismissWhenFaceAttentionIsLostEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if (AFIsInternalInstall_onceToken != -1) {
    dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_158);
  }
  if (AFIsInternalInstall_isInternal)
  {
    double v5 = [MEMORY[0x1E4F28ED0] numberWithBool:v3];
    _AFPreferencesSetValueForKeyWithContext(v5, @"Dismiss When Face Attention is Lost", @"com.apple.assistant", 0);

    [(AFPreferences *)self synchronize];
  }
}

- (BOOL)dismissWhenFaceAttentionIsLostEnabled
{
  if (AFIsInternalInstall_onceToken != -1) {
    dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_158);
  }
  if (!AFIsInternalInstall_isInternal) {
    return 0;
  }
  id v2 = _AFPreferencesValueForKeyWithContext(@"Dismiss When Face Attention is Lost", @"com.apple.assistant", 0);
  BOOL v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (void)setAutoDismissal2018Enabled:(BOOL)a3
{
  BOOL v3 = a3;
  if (AFIsInternalInstall_onceToken != -1) {
    dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_158);
  }
  if (AFIsInternalInstall_isInternal)
  {
    double v5 = [MEMORY[0x1E4F28ED0] numberWithBool:v3];
    _AFPreferencesSetValueForKeyWithContext(v5, @"Auto Dismissal 2018 Enabled", @"com.apple.assistant", 0);

    [(AFPreferences *)self synchronize];
  }
}

- (BOOL)autoDismissal2018Enabled
{
  if (AFIsInternalInstall_onceToken != -1) {
    dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_158);
  }
  if (!AFIsInternalInstall_isInternal) {
    return 0;
  }
  id v2 = _AFPreferencesValueForKeyWithContext(@"Auto Dismissal 2018 Enabled", @"com.apple.assistant", 0);
  BOOL v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)avvcLoggingEnabled
{
  id v2 = (void *)CFPreferencesCopyAppValue(@"dump_input", @"com.apple.avfoundation.avvc");
  if ([v2 BOOLValue])
  {
    BOOL v3 = (void *)CFPreferencesCopyAppValue(@"debug_level", @"com.apple.avfoundation.avvc");
    if ((int)[v3 intValue] < 2)
    {
      char v8 = 0;
    }
    else
    {
      char v4 = (void *)CFPreferencesCopyAppValue(@"debug_state", @"com.apple.avfoundation.avvc");
      if ([v4 BOOLValue])
      {
        double v5 = (void *)CFPreferencesCopyAppValue(@"debug_callbacks", @"com.apple.avfoundation.avvc");
        if ([v5 BOOLValue])
        {
          id v6 = (void *)CFPreferencesCopyAppValue(@"debug_timing", @"com.apple.avfoundation.avvc");
          if ([v6 BOOLValue])
          {
            id v7 = (void *)CFPreferencesCopyAppValue(@"debug_logtofile", @"com.apple.avfoundation.avvc");
            char v8 = [v7 BOOLValue];
          }
          else
          {
            char v8 = 0;
          }
        }
        else
        {
          char v8 = 0;
        }
      }
      else
      {
        char v8 = 0;
      }
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (void)setAVVCLoggingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  CFPreferencesSetAppValue(@"dump_input", (CFPropertyListRef)objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:"), @"com.apple.avfoundation.avvc");
  CFPreferencesSetAppValue(@"debug_level", &unk_1EEE96A58, @"com.apple.avfoundation.avvc");
  CFPreferencesSetAppValue(@"debug_state", (CFPropertyListRef)[MEMORY[0x1E4F28ED0] numberWithBool:v3], @"com.apple.avfoundation.avvc");
  CFPreferencesSetAppValue(@"debug_callbacks", (CFPropertyListRef)[MEMORY[0x1E4F28ED0] numberWithBool:v3], @"com.apple.avfoundation.avvc");
  CFPreferencesSetAppValue(@"debug_timing", (CFPropertyListRef)[MEMORY[0x1E4F28ED0] numberWithBool:v3], @"com.apple.avfoundation.avvc");
  char v4 = (const void *)[MEMORY[0x1E4F28ED0] numberWithBool:v3];
  CFPreferencesSetAppValue(@"debug_logtofile", v4, @"com.apple.avfoundation.avvc");
}

- (void)setNetworkLoggingEnabled:(BOOL)a3
{
}

- (BOOL)commandLoggingEnabled
{
  id v2 = (void *)CFPreferencesCopyAppValue(@"AFCommandLoggingEnabled", @"com.apple.assistant.logging");
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setCommandLoggingEnabled:(BOOL)a3
{
  char v3 = (const void *)[MEMORY[0x1E4F28ED0] numberWithBool:a3];
  CFPreferencesSetAppValue(@"AFCommandLoggingEnabled", v3, @"com.apple.assistant.logging");
}

- (BOOL)cardLoggingEnabled
{
  if (AFIsCustomerInstallOrPPT()) {
    return 0;
  }
  char v3 = (void *)CFPreferencesCopyAppValue(@"Card Logging Enabled", @"com.apple.assistant.logging");
  char v4 = v3;
  if (v3) {
    char v2 = [v3 BOOLValue];
  }
  else {
    char v2 = 0;
  }

  return v2;
}

- (void)setCardLoggingEnabled:(BOOL)a3
{
  char v3 = (const void *)[MEMORY[0x1E4F28ED0] numberWithBool:a3];
  CFPreferencesSetAppValue(@"Card Logging Enabled", v3, @"com.apple.assistant.logging");
}

- (BOOL)fileLoggingIsEnabled
{
  return CFPreferencesGetAppIntegerValue(@"AFLogLevel", @"com.apple.assistant.logging", 0) > 0;
}

- (void)setFileLoggingIsEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = &unk_1EEE96A40;
  }
  else {
    char v3 = 0;
  }
  [(AFPreferences *)self _setLoggingDefaultValue:v3 forKey:@"AFLogLevel"];
}

- (void)_setLoggingDefaultValue:(id)a3 forKey:(id)a4
{
  id v13 = a3;
  id v5 = a4;
  id v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v7 = [v6 fileExistsAtPath:@"/Library/Managed Preferences/mobile" isDirectory:0];

  if ((v7 & 1) == 0)
  {
    char v8 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v8 createDirectoryAtPath:@"/Library/Managed Preferences/mobile" withIntermediateDirectories:1 attributes:0 error:0];
  }
  id v9 = [NSString stringWithFormat:@"%@.plist", @"com.apple.assistant.logging"];
  id v10 = [@"/Library/Managed Preferences/mobile" stringByAppendingPathComponent:v9];

  __int16 v11 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithContentsOfFile:v10];
  id v12 = (id)[v11 mutableCopy];

  if (!v12) {
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  if (v13) {
    [v12 setObject:v13 forKey:v5];
  }
  else {
    [v12 removeObjectForKey:v5];
  }
  _CFPreferencesWriteManagedDomainForUser();
  notify_post("com.apple.AppSupport.loggingDefaultsChanged");
}

- (BOOL)tlsSessionTicketsFlushPending
{
  int64_t tlsSessionTicketFlushRequestPending = self->_tlsSessionTicketFlushRequestPending;
  if (tlsSessionTicketFlushRequestPending)
  {
    LOBYTE(v3) = tlsSessionTicketFlushRequestPending == 1;
  }
  else
  {
    id v5 = _AFPreferencesValueForKeyWithContext(@"Flush Session Tickets Cache", @"com.apple.assistant", 0);
    int v3 = [v5 BOOLValue];

    int64_t v6 = 1;
    if (!v3) {
      int64_t v6 = 2;
    }
    self->_int64_t tlsSessionTicketFlushRequestPending = v6;
  }
  return v3;
}

- (void)setTLSSessionTicketsFlushPending:(BOOL)a3
{
  int64_t v3 = 1;
  if (!a3) {
    int64_t v3 = 2;
  }
  self->_int64_t tlsSessionTicketFlushRequestPending = v3;
  objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  _AFPreferencesSetValueForKeyWithContext(v4, @"Flush Session Tickets Cache", @"com.apple.assistant", 0);
}

- (void)setValue:(id)a3 forSessionContextKey:(id)a4
{
  id v8 = a3;
  if (([a4 isEqualToString:@"Navigation Status"] & 1) == 0)
  {
    char v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"AFPreferences.m" lineNumber:6976 description:@"This SPI is not to be used with other keys"];
  }
  -[AFPreferences setCurrentNavigationState:](self, "setCurrentNavigationState:", [v8 BOOLValue]);
}

- (id)valueForSessionContextPreferenceKey:(id)a3
{
  if (([a3 isEqualToString:@"Navigation Status"] & 1) == 0)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"AFPreferences.m" lineNumber:6968 description:@"This SPI is not to be used with other keys"];
  }
  BOOL v5 = [(AFPreferences *)self currentNavigationState] - 1 < 3;
  int64_t v6 = (void *)MEMORY[0x1E4F28ED0];
  return (id)[v6 numberWithBool:v5];
}

- (void)setStoredHeadGestureConfigurationForDevice:(id)a3
{
  int64_t v3 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  id v11 = objc_alloc_init(v3);
  BOOL v5 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(v4, "isSupported"));
  [v11 setValue:v5 forKey:@"Head Gestures Supported"];

  int64_t v6 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(v4, "isEnabled"));
  [v11 setValue:v6 forKey:@"Head Gestures Enabled"];

  char v7 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v4, "acceptGesture"));
  [v11 setValue:v7 forKey:@"Head Gestures Accept Gesture"];

  id v8 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v9 = [v4 rejectGesture];

  id v10 = [v8 numberWithInteger:v9];
  [v11 setValue:v10 forKey:@"Head Gestures Reject Gesture"];

  _AFPreferencesSetValueForKeyWithContext(v11, @"Head Gestures Configuration", @"com.apple.assistant.backedup", 0);
}

- (id)storedHeadGestureConfigurationForDevice
{
  char v2 = _AFPreferencesValueForKeyWithContext(@"Head Gestures Configuration", @"com.apple.assistant.backedup", 0);
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v3 = v2;
    id v4 = [v3 valueForKey:@"Head Gestures Supported"];
    char v5 = [v4 BOOLValue];

    int64_t v6 = [v3 valueForKey:@"Head Gestures Enabled"];
    char v7 = [v6 BOOLValue];

    id v8 = [v3 valueForKey:@"Head Gestures Accept Gesture"];
    if (v8
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [v8 unsignedIntValue] <= 2)
    {
      uint64_t v9 = [v8 unsignedIntValue];
    }
    else
    {
      uint64_t v9 = 0;
    }
    id v11 = [v3 valueForKey:@"Head Gestures Reject Gesture"];
    if (v11
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [v11 unsignedIntValue] <= 2)
    {
      uint64_t v12 = [v11 unsignedIntValue];
    }
    else
    {
      uint64_t v12 = 0;
    }
    id v13 = [AFBluetoothHeadGestureConfiguration alloc];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __56__AFPreferences_storedHeadGestureConfigurationForDevice__block_invoke;
    v15[3] = &__block_descriptor_50_e55_v16__0___AFBluetoothHeadGestureConfigurationMutating__8l;
    char v16 = v5;
    char v17 = v7;
    v15[4] = v9;
    v15[5] = v12;
    id v10 = [(AFBluetoothHeadGestureConfiguration *)v13 initWithBuilder:v15];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

void __56__AFPreferences_storedHeadGestureConfigurationForDevice__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned __int8 *)(a1 + 48);
  id v4 = a2;
  [v4 setIsSupported:v3];
  [v4 setIsEnabled:*(unsigned __int8 *)(a1 + 49)];
  [v4 setAcceptGesture:*(void *)(a1 + 32)];
  [v4 setRejectGesture:*(void *)(a1 + 40)];
}

- (BOOL)prewarmOrbEnabled
{
  return _AFPreferencesBoolValueForKeyWithContext(@"Prewarm Orb Enabled", 1, @"com.apple.assistant", self->_instanceContext);
}

- (void)setBluetoothPreferredCarAudioRoute:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [(AFPreferences *)self bluetoothPreferredCarAudioRoute];
  _AFPreferencesSetValueForKeyWithContext(v4, @"preferredOutputRoute_v2", @"com.apple.siri.CarBluetooth", 0);
  if (([v5 isEqualToString:v4] & 1) == 0)
  {
    if ([v4 isEqualToString:@"A2DP"])
    {
      int64_t v6 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        int v11 = 136315138;
        uint64_t v12 = "-[AFPreferences setBluetoothPreferredCarAudioRoute:]";
        _os_log_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_INFO, "%s #BTCarAudioRoute BT car PreferredRoute is changed to A2DP", (uint8_t *)&v11, 0xCu);
      }
      char v7 = "com.apple.preferences-sounds.preferredOutputRoute.changed.A2DP";
    }
    else
    {
      int v8 = [v4 isEqualToString:@"DeviceSpeaker"];
      uint64_t v9 = AFSiriLogContextConnection;
      BOOL v10 = os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO);
      if (v8)
      {
        if (v10)
        {
          int v11 = 136315138;
          uint64_t v12 = "-[AFPreferences setBluetoothPreferredCarAudioRoute:]";
          _os_log_impl(&dword_19CF1D000, v9, OS_LOG_TYPE_INFO, "%s #BTCarAudioRoute BT car PreferredRoute is changed to DeviceSpeaker", (uint8_t *)&v11, 0xCu);
        }
        char v7 = "com.apple.preferences-sounds.preferredOutputRoute.changed.DeviceSpeaker";
      }
      else
      {
        if (v10)
        {
          int v11 = 136315138;
          uint64_t v12 = "-[AFPreferences setBluetoothPreferredCarAudioRoute:]";
          _os_log_impl(&dword_19CF1D000, v9, OS_LOG_TYPE_INFO, "%s #BTCarAudioRoute BT car PreferredRoute is changed to HFP", (uint8_t *)&v11, 0xCu);
        }
        char v7 = "com.apple.preferences-sounds.preferredOutputRoute.changed.HFP";
      }
    }
    notify_post(v7);
  }
}

- (id)bluetoothPreferredCarAudioRoute
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  char v2 = _AFPreferencesValueForKeyWithContext(@"preferredOutputRoute_v2", @"com.apple.siri.CarBluetooth", 0);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v2;
  }
  else
  {
    id v4 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      char v5 = v4;
      int v8 = 136315650;
      uint64_t v9 = "-[AFPreferences bluetoothPreferredCarAudioRoute]";
      __int16 v10 = 2112;
      id v11 = (id)objc_opt_class();
      __int16 v12 = 2112;
      uint64_t v13 = v2;
      id v6 = v11;
      _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s Expected a String, but found %@: %@", (uint8_t *)&v8, 0x20u);
    }
    id v3 = 0;
  }

  return v3;
}

- (void)setSiriAccessibilityBargeInEnabled:(BOOL)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  _AFPreferencesSetValueForKeyWithContext(v4, @"BargeIn Support Enabled", @"com.apple.assistant.backedup", self->_instanceContext);
}

- (BOOL)isSiriAccessibilityBargeInEnabled
{
  return _AFPreferencesBoolValueForKeyWithContext(@"BargeIn Support Enabled", 1, @"com.apple.assistant.backedup", self->_instanceContext);
}

- (void)setUseAtypicalSpeechModel:(BOOL)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  _AFPreferencesSetValueForKeyWithContext(v4, @"Use Atypical Speech Model", @"com.apple.assistant.backedup", self->_instanceContext);
}

- (BOOL)useAtypicalSpeechModel
{
  return _AFPreferencesBoolValueForKeyWithContext(@"Use Atypical Speech Model", 0, @"com.apple.assistant.backedup", self->_instanceContext);
}

- (void)setSiriSpeechRate:(id)a3
{
}

- (id)siriSpeechRate
{
  char v2 = _AFPreferencesValueForKeyWithContext(@"Siri Speech Rate", @"com.apple.assistant.backedup", self->_instanceContext);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = &unk_1EEE997D0;
  }

  return v3;
}

- (BOOL)mediaPlaybackEnabled
{
  return _AFPreferencesBoolValueForKeyWithContext(@"Media Playback Enabled", 1, @"com.apple.assistant", self->_instanceContext);
}

- (void)setMediaPlaybackEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  char v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    int v8 = "-[AFPreferences setMediaPlaybackEnabled:]";
    __int16 v9 = 1024;
    BOOL v10 = v3;
    _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s %d", (uint8_t *)&v7, 0x12u);
  }
  id v6 = [MEMORY[0x1E4F28ED0] numberWithBool:v3];
  _AFPreferencesSetValueForKeyWithContext(v6, @"Media Playback Enabled", @"com.apple.assistant", self->_instanceContext);

  CFPreferencesAppSynchronize(@"com.apple.assistant");
}

- (void)getExperimentForConfigurationIdentifier:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  int v7 = objc_alloc_init(AFSettingsConnection);
  [(AFSettingsConnection *)v7 getExperimentForConfigurationIdentifier:v6 completion:v5];

  [(AFSettingsConnection *)v7 barrier];
}

- (void)setKeepRecordedAudioFiles:(BOOL)a3
{
  BOOL v3 = (const void *)[MEMORY[0x1E4F28ED0] numberWithBool:a3];
  CFStringRef v4 = (const __CFString *)*MEMORY[0x1E4F1D3E0];
  CFPreferencesSetValue(@"Keep Recorded Audio Files", v3, @"com.apple.assistant", @"mobile", v4);
}

- (BOOL)infersQoSFromInstanceUUIDForEAR
{
  return _AFPreferencesBoolValueForKeyWithContext(@"Infers QoS from Instance UUID for EAR", 1, @"com.apple.assistant", self->_instanceContext);
}

- (void)setLanguageDetectorEnabled:(BOOL)a3
{
}

- (BOOL)isAccessibleEndpointerEnabled
{
  return [(AFPreferences *)self accessibleEndpointerThreshold] > 1;
}

- (void)setAccessibleEndpointerThreshold:(int64_t)a3
{
  CFStringRef v4 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
  _AFPreferencesSetValueForKeyWithContext(v4, @"Accessible Endpointer Threshold", @"com.apple.assistant.backedup", 0);

  [(AFPreferences *)self synchronize];
}

- (int64_t)accessibleEndpointerThreshold
{
  char v2 = _AFPreferencesValueForKeyWithContext(@"Accessible Endpointer Threshold", @"com.apple.assistant.backedup", 0);
  BOOL v3 = v2;
  if (v2) {
    int64_t v4 = [v2 integerValue];
  }
  else {
    int64_t v4 = 1;
  }

  return v4;
}

- (void)setUseDeviceSpeakerForTTS:(int64_t)a3
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v5 = +[AFAnalytics sharedAnalytics];
  v10[0] = @"Use device speaker for TTS";
  id v6 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
  v10[1] = @"Type To Siri Enabled";
  v11[0] = v6;
  int v7 = [MEMORY[0x1E4F28ED0] numberWithBool:AFPreferencesTypeToSiriEnabled()];
  v11[1] = v7;
  int v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  [v5 logEventWithType:3203 context:v8];

  __int16 v9 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
  _AFPreferencesSetValueForKeyWithContext(v9, @"Use device speaker for TTS", @"com.apple.assistant.backedup", 0);

  [(AFPreferences *)self synchronize];
}

- (int64_t)useDeviceSpeakerForTTS
{
  char v2 = _AFPreferencesValueForKeyWithContext(@"Use device speaker for TTS", @"com.apple.assistant.backedup", 0);
  BOOL v3 = v2;
  if (v2) {
    int64_t v4 = [v2 integerValue];
  }
  else {
    int64_t v4 = 1;
  }

  return v4;
}

- (void)setLanguageCode:(id)a3 outputVoice:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315650;
    uint64_t v11 = "-[AFPreferences setLanguageCode:outputVoice:]";
    __int16 v12 = 2112;
    id v13 = v6;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_INFO, "%s %@ %@", (uint8_t *)&v10, 0x20u);
  }
  __int16 v9 = [[AFSettingsConnection alloc] initWithInstanceContext:self->_instanceContext];
  [(AFPreferences *)self _registerForLanguageCodeChangeNotifications];
  [(AFPreferences *)self _registerForOutputVoice];
  [(AFSettingsConnection *)v9 setLanguage:v6 outputVoice:v7];
  [(AFSettingsConnection *)v9 barrier];
}

- (void)setShouldSkipIntelligenceVoiceSelectionUpsell:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v4 = +[AFFeatureFlags isSystemAssistantExperienceEnabled];
  int v5 = AFDeviceSupportsSAE();
  if (v4 && v5 != 0)
  {
    id v7 = [MEMORY[0x1E4F28ED0] numberWithBool:v3];
    _AFPreferencesSetValueForKeyWithContext(v7, @"ShouldSkipIntelligenceVoiceSelectionUpsell", @"com.apple.assistant.backedup", 0);
  }
}

- (BOOL)shouldSkipIntelligenceVoiceSelectionUpsell
{
  char v2 = _AFPreferencesValueForKeyWithContext(@"ShouldSkipIntelligenceVoiceSelectionUpsell", @"com.apple.assistant.backedup", 0);
  char v3 = [v2 BOOLValue];

  if (v3) {
    return 1;
  }
  BOOL v4 = +[AFFeatureFlags isSystemAssistantExperienceEnabled];
  int v5 = AFDeviceSupportsSAE();
  if (!v4 || v5 == 0) {
    return 1;
  }
  id v7 = _AFPreferencesOutputVoiceWithContext(0);
  int v8 = [v7 languageCode];
  __int16 v9 = +[AFVoiceInfo voiceInfoForSessionLanguageCode:v8];

  int v10 = [v7 name];
  uint64_t v11 = [v9 name];
  char v12 = [v10 isEqualToString:v11];

  char v13 = v12 ^ 1;
  return v13;
}

- (void)setOutputVoice:(id)a3
{
  id v4 = a3;
  [(AFPreferences *)self _registerForOutputVoice];
  [(AFPreferences *)self setShouldSkipIntelligenceVoiceSelectionUpsell:1];
  int v5 = [[AFSettingsConnection alloc] initWithInstanceContext:self->_instanceContext];
  [(AFSettingsConnection *)v5 setOutputVoice:v4];

  [(AFSettingsConnection *)v5 barrier];
}

- (id)_outputVoiceWithFallback:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  [(AFPreferences *)self _registerForOutputVoice];
  [(AFPreferences *)self _registerForLanguageCodeChangeNotifications];
  uint64_t v5 = _AFPreferencesOutputVoiceWithContext(self->_instanceContext);
  id v6 = (AFVoiceInfo *)v5;
  if (v3 && !v5)
  {
    if ([(AFPreferences *)self assistantIsEnabled])
    {
      id v7 = [(AFPreferences *)self languageCode];
      int v8 = v7;
      if (!v7 || (AFPreferencesLanguageIsSupported(v7) & 1) == 0)
      {
        uint64_t v9 = [(AFPreferences *)self bestSupportedLanguageCodeForLanguageCode:v8];

        int v8 = (void *)v9;
      }
      int v10 = AFOutputVoiceLanguageForRecognitionLanguage(v8);

      id v6 = [[AFVoiceInfo alloc] initWithLanguageCode:v10];
      uint64_t v11 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      {
        int v13 = 136315394;
        __int16 v14 = "-[AFPreferences _outputVoiceWithFallback:]";
        __int16 v15 = 2112;
        uint64_t v16 = v6;
        _os_log_error_impl(&dword_19CF1D000, v11, OS_LOG_TYPE_ERROR, "%s No output voice saved, but Assistant is enabled - returning: %@", (uint8_t *)&v13, 0x16u);
      }
    }
    else
    {
      id v6 = 0;
    }
  }
  return v6;
}

- (id)outputVoice
{
  return [(AFPreferences *)self _outputVoiceWithFallback:1];
}

- (void)setInProgressOutputVoice:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315394;
    id v6 = "-[AFPreferences setInProgressOutputVoice:]";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v5, 0x16u);
  }
  _AFPreferencesSetInProgressOutputVoice(v3);
  CFPreferencesAppSynchronize(@"com.apple.assistant.backedup");
}

- (void)synchronizeVoiceServicesLanguageCode
{
  _AFPreferencesValueForKeyWithContext(@"Session Language", @"com.apple.assistant.backedup", self->_instanceContext);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  char v2 = (void *)VSPreferencesCopySpokenLanguageIdentifier();
  if (([v3 isEqualToString:v2] & 1) == 0) {
    VSPreferencesSetSpokenLanguageIdentifier();
  }
}

- (void)setMultilingualResponseEnabled:(BOOL)a3 forLanguage:(id)a4
{
  BOOL v4 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if (+[AFFeatureFlags isMultilingualResponseVariantSelectorEnabled]&& AFDeviceSupportsSiriUOD())
  {
    id v6 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      int v11 = 136315650;
      char v12 = "-[AFPreferences setMultilingualResponseEnabled:forLanguage:]";
      __int16 v13 = 1024;
      BOOL v14 = v4;
      __int16 v15 = 2112;
      id v16 = v5;
      _os_log_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_INFO, "%s %d %@", (uint8_t *)&v11, 0x1Cu);
    }
    __int16 v7 = _AFPreferencesValueForKeyWithContext(@"Multilingual Response Enablement Per Language", @"com.apple.assistant.backedup", 0);
    if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v7];
    }
    else
    {
      uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    uint64_t v9 = (void *)v8;
    int v10 = [MEMORY[0x1E4F28ED0] numberWithBool:v4];
    [v9 setObject:v10 forKey:v5];

    _AFPreferencesSetValueForKeyWithContext(v9, @"Multilingual Response Enablement Per Language", @"com.apple.assistant.backedup", 0);
    CFPreferencesAppSynchronize(@"com.apple.assistant.backedup");
  }
}

- (BOOL)_defaultMultilingualResponseEnabledForLanguage:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (![a3 isEqualToString:@"en-IN"]) {
    return 0;
  }
  id v3 = [getTIInputModeControllerClass() sharedInputModeController];
  BOOL v4 = [v3 enabledInputModeIdentifiers];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        int v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ((objc_msgSend(v10, "hasPrefix:", @"hi-Translit", (void)v13) & 1) != 0
          || ([v10 hasPrefix:@"hi_Latn"] & 1) != 0
          || ([v10 hasPrefix:@"hi@sw=Devanagari-Hindi"] & 1) != 0)
        {
          BOOL v11 = 1;
          goto LABEL_16;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      BOOL v11 = 0;
      if (v7) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v11 = 0;
  }
LABEL_16:

  return v11;
}

- (BOOL)multilingualResponseEnabledForLanguage:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (+[AFFeatureFlags isMultilingualResponseVariantSelectorEnabled]&& AFDeviceSupportsSiriUOD())
  {
    id v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      int v12 = 136315394;
      long long v13 = "-[AFPreferences multilingualResponseEnabledForLanguage:]";
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v12, 0x16u);
    }
    uint64_t v6 = _AFPreferencesValueForKeyWithContext(@"Multilingual Response Enablement Per Language", @"com.apple.assistant.backedup", 0);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && ([v6 allKeys], uint64_t v7 = objc_claimAutoreleasedReturnValue(), v7, v7)
      && ([v6 objectForKey:v4], (uint64_t v8 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v9 = v8;
      char v10 = [v8 BOOLValue];
    }
    else
    {
      char v10 = [(AFPreferences *)self _defaultMultilingualResponseEnabledForLanguage:v4];
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (void)setLanguageCode:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    uint64_t v8 = "-[AFPreferences setLanguageCode:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v7, 0x16u);
  }
  [(AFPreferences *)self _registerForLanguageCodeChangeNotifications];
  uint64_t v6 = [[AFSettingsConnection alloc] initWithInstanceContext:self->_instanceContext];
  [(AFSettingsConnection *)v6 setLanguage:v4];
  [(AFSettingsConnection *)v6 barrier];
}

- (BOOL)_languageCode:(id)a3 isGoodFitForPreferredLanguages:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (([v6 containsObject:v5] & 1) != 0
    || (_AFBestEffortNormalizedLanguageIdentifier(v5),
        int v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = [v6 containsObject:v7],
        v7,
        (v8 & 1) != 0))
  {
    char v9 = 1;
  }
  else
  {
    id v10 = [v6 firstObject];
    if (_AFPreferenceAdditionalGoodFitSystemLocales_onceToken != -1) {
      dispatch_once(&_AFPreferenceAdditionalGoodFitSystemLocales_onceToken, &__block_literal_global_2043);
    }
    id v11 = (id)_AFPreferenceAdditionalGoodFitSystemLocales_sSpecialCases;
    if ([v11 containsObject:v10])
    {
      char v9 = 1;
    }
    else
    {
      int v12 = _AFBestEffortNormalizedLanguageIdentifier(v10);
      char v9 = [v11 containsObject:v12];
    }
  }

  return v9;
}

- (id)allSiriLanguageCodesForSystemLanguageCode:(id)a3 isGoodFit:(BOOL *)a4
{
  v46[1] = *MEMORY[0x1E4F143B8];
  id v6 = (__CFString *)a3;
  int v7 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v39 = "-[AFPreferences allSiriLanguageCodesForSystemLanguageCode:isGoodFit:]";
    __int16 v40 = 2112;
    v41 = v6;
    _os_log_impl(&dword_19CF1D000, v7, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  unint64_t v8 = 0x1E4F1C000uLL;
  if ([(__CFString *)v6 length])
  {
    v46[0] = v6;
    char v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:1];
    goto LABEL_7;
  }
  char v9 = [(AFPreferences *)self _languagePreferencesForCurrentSystemConfiguration];
  uint64_t v10 = [(__CFString *)v9 firstObject];

  if (!v10)
  {
    v30 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v39 = "-[AFPreferences allSiriLanguageCodesForSystemLanguageCode:isGoodFit:]";
      _os_log_error_impl(&dword_19CF1D000, v30, OS_LOG_TYPE_ERROR, "%s Somehow we have no language preferences!", buf, 0xCu);
      if (!a4) {
        goto LABEL_25;
      }
    }
    else if (!a4)
    {
LABEL_25:
      v45 = @"en-US";
      uint64_t v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v45 count:1];
      goto LABEL_32;
    }
    *a4 = 0;
    goto LABEL_25;
  }
  id v6 = (__CFString *)v10;
LABEL_7:
  id v11 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v39 = "-[AFPreferences allSiriLanguageCodesForSystemLanguageCode:isGoodFit:]";
    __int16 v40 = 2112;
    v41 = v9;
    _os_log_impl(&dword_19CF1D000, v11, OS_LOG_TYPE_INFO, "%s preferences %@", buf, 0x16u);
  }
  if (!v6) {
    goto LABEL_30;
  }
  int v12 = [&unk_1EEE988D8 allKeys];
  long long v13 = [v12 arrayByAddingObject:@"zxx"];

  __int16 v14 = (void *)MEMORY[0x1E4F28B50];
  v44[0] = v6;
  v44[1] = @"zxx";
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:2];
  uint64_t v16 = [v14 preferredLocalizationsFromArray:v13 forPreferences:v15];
  uint64_t v17 = [v16 firstObject];

  int v18 = [@"zxx" isEqualToString:v17];
  long long v19 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    long long v20 = @"<Sentinel> (not a special-cased language)";
    if (!v18) {
      long long v20 = v17;
    }
    *(_DWORD *)buf = 136315394;
    v39 = "-[AFPreferences allSiriLanguageCodesForSystemLanguageCode:isGoodFit:]";
    __int16 v40 = 2112;
    v41 = v20;
    _os_log_impl(&dword_19CF1D000, v19, OS_LOG_TYPE_INFO, "%s sentinelOrSpecialCase = %@", buf, 0x16u);
  }
  if (v18) {
    goto LABEL_29;
  }
  v35 = self;
  v36 = a4;
  long long v21 = (objc_class *)MEMORY[0x1E4F1CA20];
  long long v22 = v17;
  __int16 v23 = v6;
  v24 = (void *)[[v21 alloc] initWithLocaleIdentifier:v22];

  __int16 v25 = (void *)[objc_alloc(MEMORY[0x1E4F1CA20]) initWithLocaleIdentifier:v23];
  __int16 v26 = [v24 countryCode];
  __int16 v27 = [v25 countryCode];
  if ([v26 isEqualToString:v27])
  {

    self = v35;
    a4 = v36;
    goto LABEL_17;
  }
  v31 = [v24 countryCode];
  if (v31)
  {

    self = v35;
    a4 = v36;
LABEL_29:

    unint64_t v8 = 0x1E4F1C000uLL;
    goto LABEL_30;
  }
  v32 = [v25 countryCode];

  self = v35;
  a4 = v36;
  if (v32) {
    goto LABEL_29;
  }
LABEL_17:
  uint64_t v28 = [&unk_1EEE988D8 objectForKey:v22];
  uint64_t v29 = AFSiriLogContextConnection;
  unint64_t v8 = 0x1E4F1C000;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v39 = "-[AFPreferences allSiriLanguageCodesForSystemLanguageCode:isGoodFit:]";
    __int16 v40 = 2112;
    v41 = v22;
    __int16 v42 = 2112;
    v43 = v28;
    _os_log_impl(&dword_19CF1D000, v29, OS_LOG_TYPE_INFO, "%s Special-case: %@ -> %@", buf, 0x20u);
  }

  if (v28)
  {
    if (a4) {
      *a4 = 1;
    }
    goto LABEL_31;
  }
LABEL_30:
  v33 = [(AFPreferences *)self _bestSupportedLanguageCodeForLanguageCodes:v9 isGoodFit:a4];
  v37 = v33;
  uint64_t v28 = [*(id *)(v8 + 2424) arrayWithObjects:&v37 count:1];

LABEL_31:
LABEL_32:

  return v28;
}

- (BOOL)isLocaleIdentifierNativelySupported:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 length])
  {
    char v12 = 0;
    v19[0] = v4;
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
    id v6 = [(AFPreferences *)self _bestSupportedLanguageCodeForLanguageCodes:v5 isGoodFit:&v12];

    int v7 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      __int16 v14 = "-[AFPreferences isLocaleIdentifierNativelySupported:]";
      *(_DWORD *)buf = 136315650;
      if (v12) {
        unint64_t v8 = "YES";
      }
      else {
        unint64_t v8 = "NO";
      }
      __int16 v15 = 2112;
      id v16 = v4;
      __int16 v17 = 2080;
      int v18 = v8;
      _os_log_impl(&dword_19CF1D000, v7, OS_LOG_TYPE_INFO, "%s %@ supported: %s", buf, 0x20u);
    }
    BOOL v9 = v12 != 0;
  }
  else
  {
    uint64_t v10 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v14 = "-[AFPreferences isLocaleIdentifierNativelySupported:]";
      _os_log_error_impl(&dword_19CF1D000, v10, OS_LOG_TYPE_ERROR, "%s No language code given, answer is NO.", buf, 0xCu);
    }
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)isCurrentLocaleNativelySupported
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  BOOL v6 = 0;
  id v2 = [(AFPreferences *)self _bestSupportedLanguageCodeForLanguageCode:0 isGoodFit:&v6];
  id v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    id v4 = "YES";
    if (!v6) {
      id v4 = "NO";
    }
    *(_DWORD *)buf = 136315394;
    unint64_t v8 = "-[AFPreferences isCurrentLocaleNativelySupported]";
    __int16 v9 = 2080;
    uint64_t v10 = v4;
    _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s supported: %s", buf, 0x16u);
  }
  return v6;
}

- (id)languageCode
{
  return [(AFPreferences *)self _languageCodeWithFallback:1];
}

- (void)setQuickTypeGestureEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v19[1] = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F28ED0];
  id v5 = self->_instanceContext;
  BOOL v6 = [v4 numberWithBool:v3];
  _AFPreferencesSetValueForKeyWithContext(v6, @"Quick Type Gesture Enabled", @"com.apple.assistant.support", v5);

  CFPreferencesAppSynchronize(@"com.apple.assistant.backedup");
  int v7 = +[AFAnalytics sharedAnalytics];
  int v18 = @"Quick Type Gesture Enabled";
  unint64_t v8 = [MEMORY[0x1E4F28ED0] numberWithBool:v3];
  v19[0] = v8;
  __int16 v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
  [v7 logEventWithType:3206 context:v9];

  uint64_t v10 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = @"disabled";
    if (v3) {
      uint64_t v11 = @"enabled";
    }
    int v14 = 136315394;
    __int16 v15 = "_AFPreferencesSetQuickTypeGestureEnabled";
    __int16 v16 = 2112;
    __int16 v17 = v11;
    _os_log_impl(&dword_19CF1D000, v10, OS_LOG_TYPE_INFO, "%s #preferences Setting Quick Type Gesture %@", (uint8_t *)&v14, 0x16u);
  }
  char v12 = +[AFPreferences sharedPreferences];
  [v12 synchronize];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"kAFPreferencesDidChangeDarwinNotification", 0, 0, 1u);
}

- (BOOL)quickTypeGestureEnabled
{
  id v2 = _AFPreferencesValueForKeyWithContext(@"Quick Type Gesture Enabled", @"com.apple.assistant.support", self->_instanceContext);
  BOOL v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (void)setAssistantLanguageForceRTL:(BOOL)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  _AFPreferencesSetValueForKeyWithContext(v4, @"SessionLanguageUIForceRTL", @"com.apple.assistant.backedup", self->_instanceContext);
}

- (BOOL)assistantLanguageForceRTL
{
  return _AFPreferencesBoolValueForKeyWithContext(@"SessionLanguageUIForceRTL", 0, @"com.apple.assistant.backedup", self->_instanceContext);
}

- (void)setDisableAssistantWhilePasscodeLocked:(BOOL)a3
{
  BOOL v3 = a3;
  [(AFPreferences *)self _registerForInternalPrefs];
  id v4 = [MEMORY[0x1E4F74230] sharedConnection];
  [v4 setBoolValue:!v3 forSetting:*MEMORY[0x1E4F73F38]];
}

- (BOOL)disableAssistantWhilePasscodeLocked
{
  [(AFPreferences *)self _registerForInternalPrefs];
  id v2 = [MEMORY[0x1E4F74230] sharedConnection];
  BOOL v3 = [v2 effectiveBoolValueForSetting:*MEMORY[0x1E4F73F38]] == 2;

  return v3;
}

- (void)setEnableNonFullScreenAppearance:(BOOL)a3
{
}

- (void)setEnableDragAndDrop:(BOOL)a3
{
}

- (void)setFeedbackBannerForNearMissesEnabled:(BOOL)a3
{
}

- (BOOL)feedbackBannerForNearMissesEnabled
{
  if (AFIsInternalInstall_onceToken != -1) {
    dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_158);
  }
  if (!AFIsInternalInstall_isInternal) {
    return 0;
  }
  return _AFBackedUpPreferencesBoolForKeyWithDefault(@"Enable Feedback Banner for Near Misses", 1);
}

- (void)setFeedbackBannerForAcceptsEnabled:(BOOL)a3
{
}

- (BOOL)feedbackBannerForAcceptsEnabled
{
  if (AFIsInternalInstall_onceToken != -1) {
    dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_158);
  }
  if (!AFIsInternalInstall_isInternal) {
    return 0;
  }
  return _AFBackedUpPreferencesBoolForKeyWithDefault(@"Enable Feedback Banner for Accepts", 1);
}

- (void)setSiriSpeakerGradingDebugUIEnabled:(BOOL)a3
{
}

- (void)setDeviceUnlockSignal:(BOOL)a3
{
}

- (void)setOverrideModeWhileInAmbient:(BOOL)a3
{
}

- (void)setAlwaysInAmbient:(BOOL)a3
{
}

- (void)setSiriDebugUIEnabled:(BOOL)a3
{
}

- (void)setAutoDismissalMaxAttentionSamplingTime:(double)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithDouble:a3];
  _AFPreferencesSetValueForKeyWithContext(v4, @"Auto Dismissal Max Attention Sampling Time", @"com.apple.assistant", 0);

  [(AFPreferences *)self synchronize];
}

- (double)autoDismissalMaxAttentionSamplingTime
{
  id v2 = _AFPreferencesValueForKeyWithContext(@"Auto Dismissal Max Attention Sampling Time", @"com.apple.assistant", 0);
  BOOL v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 30.0;
  }

  return v5;
}

- (void)setAutoDismissalExtendedIdleTimeout:(double)a3
{
  double v4 = [MEMORY[0x1E4F28ED0] numberWithDouble:a3];
  _AFPreferencesSetValueForKeyWithContext(v4, @"Auto Dismissal Extended Idle Timeout", @"com.apple.assistant", 0);

  [(AFPreferences *)self synchronize];
}

- (double)autoDismissalExtendedIdleTimeout
{
  id v2 = _AFPreferencesValueForKeyWithContext(@"Auto Dismissal Extended Idle Timeout", @"com.apple.assistant", 0);
  BOOL v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 20.0;
  }

  return v5;
}

- (void)setAutoDismissalIdleTimeout:(double)a3
{
  double v4 = [MEMORY[0x1E4F28ED0] numberWithDouble:a3];
  _AFPreferencesSetValueForKeyWithContext(v4, @"Auto Dismissal Idle Timeout", @"com.apple.assistant", 0);

  [(AFPreferences *)self synchronize];
}

- (double)autoDismissalIdleTimeout
{
  id v2 = _AFPreferencesValueForKeyWithContext(@"Auto Dismissal Idle Timeout", @"com.apple.assistant", 0);
  BOOL v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 6.0;
  }

  return v5;
}

- (void)setDatabaseSyncEnabled:(BOOL)a3
{
}

- (void)setLimitedAudioLoggingEnabled:(BOOL)a3
{
}

- (void)setOpportuneSpeakingFileLoggingIsEnabled:(BOOL)a3
{
}

- (void)setMyriadMaxNoOperationDelay:(double)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithDouble:a3];
  _AFPreferencesSetValueForKeyWithContext(v4, @"Myriad Max No Op Delay", @"com.apple.assistant", self->_instanceContext);
}

- (double)myriadMaxNoOperationDelay
{
  id v2 = _AFPreferencesValueForKeyWithContext(@"Myriad Max No Op Delay", @"com.apple.assistant", self->_instanceContext);
  double v3 = 0.005;
  if (objc_opt_respondsToSelector())
  {
    [v2 doubleValue];
    if (v4 != 0.0)
    {
      [v2 doubleValue];
      double v3 = v5;
    }
  }

  return v3;
}

- (id)myriadMonitorTimeOutInterval
{
  id v2 = _AFPreferencesValueForKeyWithContext(@"Myriad Monitor Timeout Interval", @"com.apple.assistant", self->_instanceContext);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (void)setIgnoreMyriadPlatformBias:(BOOL)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  _AFPreferencesSetValueForKeyWithContext(v4, @"Myriad Ignore Platform Bias", @"com.apple.assistant", self->_instanceContext);
}

- (BOOL)ignoreMyriadPlatformBias
{
  if (AFIsInternalInstall_onceToken != -1) {
    dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_158);
  }
  if (!AFIsInternalInstall_isInternal) {
    return 0;
  }
  id v3 = _AFPreferencesValueForKeyWithContext(@"Myriad Ignore Platform Bias", @"com.apple.assistant", self->_instanceContext);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (void)setIgnoreMyriadAdjustedBoost:(BOOL)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  _AFPreferencesSetValueForKeyWithContext(v4, @"Myriad Ignore Adjusted Boost", @"com.apple.assistant", self->_instanceContext);
}

- (BOOL)myriadShouldIgnoreAdjustedBoost
{
  id v2 = _AFPreferencesValueForKeyWithContext(@"Myriad Ignore Adjusted Boost", @"com.apple.assistant", self->_instanceContext);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v3 = [v2 BOOLValue];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (void)setMyriadDeviceVTEndTimeDistanceThreshold:(double)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithDouble:a3];
  _AFPreferencesSetValueForKeyWithContext(v4, @"Myriad VTEndtimeDistanceThreshold", @"com.apple.assistant", self->_instanceContext);
}

- (double)myriadDeviceVTEndTimeDistanceThreshold
{
  id v2 = _AFPreferencesValueForKeyWithContext(@"Myriad VTEndtimeDistanceThreshold", @"com.apple.assistant", self->_instanceContext);
  double v3 = 0.5;
  if (objc_opt_respondsToSelector())
  {
    [v2 doubleValue];
    double v3 = v4;
  }

  return v3;
}

- (void)setMyriadLastWin
{
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  _AFPreferencesSetValueForKeyWithContext(v3, @"Myriad Last Win", @"com.apple.assistant", self->_instanceContext);
}

- (id)myriadLastWin
{
  id v2 = _AFPreferencesValueForKeyWithContext(@"Myriad Last Win", @"com.apple.assistant", self->_instanceContext);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v2;
  }
  else
  {
    id v3 = [MEMORY[0x1E4F1C9C8] distantPast];
  }
  double v4 = v3;

  return v4;
}

- (void)setMyriadDeviceTrumpDelay:(double)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithDouble:a3];
  _AFPreferencesSetValueForKeyWithContext(v4, @"Myriad Device Trump Delay", @"com.apple.assistant", self->_instanceContext);
}

- (double)myriadDeviceTrumpDelay
{
  id v2 = _AFPreferencesValueForKeyWithContext(@"Myriad Device Trump Delay", @"com.apple.assistant", self->_instanceContext);
  id v3 = v2;
  if (v2)
  {
    [v2 floatValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 1.75;
  }

  return v5;
}

- (void)setMyriadDeviceSlowdown:(double)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithDouble:a3];
  _AFPreferencesSetValueForKeyWithContext(v4, @"Myriad Device Slowdown", @"com.apple.assistant", self->_instanceContext);
}

- (double)myriadDeviceSlowdown
{
  id v2 = _AFPreferencesValueForKeyWithContext(@"Myriad Device Slowdown", @"com.apple.assistant", self->_instanceContext);
  id v3 = v2;
  if (v2)
  {
    [v2 floatValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

- (void)setMyriadTestDeviceDelay:(double)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithDouble:a3];
  _AFPreferencesSetValueForKeyWithContext(v4, @"Myriad Test Device Delay", @"com.apple.assistant", self->_instanceContext);
}

- (double)myriadTestDeviceDelay
{
  id v2 = _AFPreferencesValueForKeyWithContext(@"Myriad Test Device Delay", @"com.apple.assistant", self->_instanceContext);
  if (AFIsInternalInstall_onceToken != -1) {
    dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_158);
  }
  double v3 = 0.0;
  if (AFIsInternalInstall_isInternal) {
    BOOL v4 = v2 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [v2 doubleValue];
    double v3 = v5;
  }

  return v3;
}

- (void)setMyriadDeviceDelay:(double)a3
{
  *(float *)&a3 = a3;
  id v4 = [MEMORY[0x1E4F28ED0] numberWithFloat:a3];
  _AFPreferencesSetValueForKeyWithContext(v4, @"Myriad Device Delay", @"com.apple.assistant", self->_instanceContext);
}

- (double)myriadDeviceDelay
{
  id v2 = _AFPreferencesValueForKeyWithContext(@"Myriad Device Delay", @"com.apple.assistant", self->_instanceContext);
  double v3 = v2;
  if (v2)
  {
    [v2 floatValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

- (void)setMyriadDeviceAdjust:(float)a3
{
  objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithFloat:");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  _AFPreferencesSetValueForKeyWithContext(v4, @"Myriad Device Adjust", @"com.apple.assistant", self->_instanceContext);
}

- (float)myriadDeviceAdjust
{
  id v2 = _AFPreferencesValueForKeyWithContext(@"Myriad Device Adjust", @"com.apple.assistant", self->_instanceContext);
  double v3 = v2;
  if (v2)
  {
    [v2 floatValue];
    float v5 = v4;
  }
  else
  {
    float v5 = 0.0;
  }

  return v5;
}

- (void)setMyriadConstantGoodness:(int)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithInt:*(void *)&a3];
  _AFPreferencesSetValueForKeyWithContext(v4, @"Myriad Constant Goodness", @"com.apple.assistant", self->_instanceContext);
}

- (int)myriadConstantGoodness
{
  id v2 = _AFPreferencesValueForKeyWithContext(@"Myriad Constant Goodness", @"com.apple.assistant", self->_instanceContext);
  double v3 = v2;
  if (v2) {
    int v4 = [v2 integerValue];
  }
  else {
    int v4 = -1;
  }

  return v4;
}

- (void)setMyriadDeviceClass:(unsigned __int8)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithInt:a3];
  _AFPreferencesSetValueForKeyWithContext(v4, @"Myriad Device Class", @"com.apple.assistant", self->_instanceContext);
}

- (unsigned)myriadDeviceClass
{
  id v2 = _AFPreferencesValueForKeyWithContext(@"Myriad Device Class", @"com.apple.assistant", self->_instanceContext);
  double v3 = v2;
  if (v2) {
    unsigned __int8 v4 = [v2 integerValue];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (void)setMyriadServerProvisioning:(BOOL)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  _AFPreferencesSetValueForKeyWithContext(v4, @"Server Provisions Myriad", @"com.apple.assistant", self->_instanceContext);
}

- (BOOL)myriadServerProvisioning
{
  id v2 = _AFPreferencesValueForKeyWithContext(@"Server Provisions Myriad", @"com.apple.assistant", self->_instanceContext);
  double v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (void)setMyriadServerHasProvisioned:(BOOL)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  _AFPreferencesSetValueForKeyWithContext(v4, @"Server Has Provisioned Myriad", @"com.apple.assistant", self->_instanceContext);
}

- (BOOL)myriadServerHasProvisioned
{
  id v2 = _AFPreferencesValueForKeyWithContext(@"Server Has Provisioned Myriad", @"com.apple.assistant", self->_instanceContext);
  double v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (void)setMyriadDeviceGroup:(id)a3
{
}

- (id)myriadDeviceGroup
{
  double v3 = [MEMORY[0x1E4F28ED0] numberWithInt:0];
  char v4 = _AFPreferencesValueForKeyWithContext(@"Myriad Device Group", @"com.apple.assistant", self->_instanceContext);
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;

      double v3 = v5;
    }
  }

  return v3;
}

- (void)setMyriadDuckingEnabled:(BOOL)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  _AFPreferencesSetValueForKeyWithContext(v4, @"Allow Myriad Ducking", @"com.apple.assistant", self->_instanceContext);
}

- (BOOL)myriadDuckingEnabled
{
  id v2 = _AFPreferencesValueForKeyWithContext(@"Allow Myriad Ducking", @"com.apple.assistant", self->_instanceContext);
  double v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)disableMyriadBLEActivity
{
  id v2 = _AFPreferencesValueForKeyWithContext(@"Disable Myriad BLE Activity", @"com.apple.assistant", self->_instanceContext);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v3 = [v2 BOOLValue];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (void)setMyriadCoordinationEnabled:(BOOL)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  _AFPreferencesSetValueForKeyWithContext(v4, @"Allow Myriad Coordination", @"com.apple.assistant", self->_instanceContext);
}

- (BOOL)myriadCoordinationEnabledForAccessoryLogging
{
  id v2 = _AFPreferencesValueForKeyWithContext(@"Allow Myriad Coordination", @"com.apple.assistant", 0);
  char v3 = _AFPreferencesBoolFromValueWithDefault(v2, @"Allow Myriad Coordination", 1);

  return v3;
}

- (BOOL)myriadCoordinationEnabled
{
  id v2 = _AFPreferencesValueForKeyWithContext(@"Allow Myriad Coordination", @"com.apple.assistant", self->_instanceContext);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v3 = [v2 BOOLValue];
  }
  else {
    char v3 = 1;
  }

  return v3;
}

- (void)setCompanionConnectionsOverBLEEnabled:(BOOL)a3
{
  _AFPreferencesEnableBLECompanionConnections(a3);
  CFPreferencesAppSynchronize(@"com.apple.assistant");
}

- (void)setStreamingDictationEnabled:(BOOL)a3
{
  AFPreferencesSetStreamingDictationEnabled(a3);
  CFPreferencesAppSynchronize(@"com.apple.assistant");
}

- (void)setManualEndpointingThreshold:(id)a3
{
  _AFPreferencesSetValueForKeyWithContext(a3, @"Manual Endpointing Threshold", @"com.apple.assistant", 0);
  CFPreferencesAppSynchronize(@"com.apple.assistant");
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:@"AFPreferencesManualEndpointingThresholdDidChangeNotification" object:self];
}

- (void)setIgnoreServerManualEndpointingThreshold:(BOOL)a3
{
  AFPreferencesSetIgnoreServerManualEndpointingThreshold(a3);
  CFPreferencesAppSynchronize(@"com.apple.assistant");
}

- (id)horsemanSupplementalLanguageDictionary
{
  return 0;
}

- (id)supplementalLanguagesModificationDate
{
  return 0;
}

- (id)supplementalLanguages
{
  return 0;
}

- (id)supplementalLanguagesForProduct:(id)a3 forBuildVersion:(id)a4
{
  return 0;
}

- (id)supplementalLanguageDictionaryForProduct:(id)a3
{
  return 0;
}

- (void)insertHomeAccessorySiriDataSharingPropagationLogEvent:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    long long v22 = "-[AFPreferences insertHomeAccessorySiriDataSharingPropagationLogEvent:]";
    __int16 v23 = 2112;
    uint64_t v24 = (uint64_t)v4;
    _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s Appending home accessory Siri data sharing propagation event to propagation log: %@", buf, 0x16u);
  }
  BOOL v6 = [(AFPreferences *)self getHomeAccessorySiriDataSharingPropagationLog];
  int v7 = (void *)[v6 mutableCopy];
  unint64_t v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  uint64_t v10 = v9;
  long long v19 = self;

  uint64_t v11 = [v4 accessoryIdentifier];
  char v12 = [v10 objectForKey:v11];
  long long v13 = (void *)[v12 mutableCopy];
  int v14 = v13;
  if (v13)
  {
    id v15 = v13;
  }
  else
  {
    id v15 = [MEMORY[0x1E4F1CA48] array];
  }
  __int16 v16 = v15;

  if ((unint64_t)[v16 count] >= 0x64)
  {
    do
    {
      __int16 v17 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        long long v22 = "-[AFPreferences insertHomeAccessorySiriDataSharingPropagationLogEvent:]";
        __int16 v23 = 2048;
        uint64_t v24 = 100;
        _os_log_impl(&dword_19CF1D000, v17, OS_LOG_TYPE_INFO, "%s Home accessory Siri data sharing opt-in status propagation log size is greater than maximum of %ld. Removing oldest entry.", buf, 0x16u);
      }
      objc_msgSend(v16, "removeObjectAtIndex:", 0, v19);
    }
    while ((unint64_t)[v16 count] > 0x63);
  }
  int v18 = objc_msgSend(v4, "buildDictionaryRepresentation", v19);
  [v16 addObject:v18];
  [v10 setObject:v16 forKey:v11];
  _AFPreferencesSetValueForKeyWithContext(v10, @"Home Accessories Siri Data Sharing Opt-In Propagation Log", @"com.apple.assistant.backedup", v20[5]);
  [v20 synchronize];
}

- (id)getHomeAccessorySiriDataSharingPropagationLog
{
  id v2 = _AFPreferencesValueForKeyWithContext(@"Home Accessories Siri Data Sharing Opt-In Propagation Log", @"com.apple.assistant.backedup", self->_instanceContext);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (void)appendHomeAccessorySiriDataSharingChangeLogEvent:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v16 = "-[AFPreferences appendHomeAccessorySiriDataSharingChangeLogEvent:]";
    __int16 v17 = 2112;
    uint64_t v18 = (uint64_t)v4;
    _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s Appending home accessory Siri data sharing opt-in status event to change log: %@", buf, 0x16u);
  }
  BOOL v6 = [(AFPreferences *)self getHomeAccessorySiriDataSharingChangeLog];
  int v7 = (void *)[v6 mutableCopy];
  unint64_t v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [MEMORY[0x1E4F1CA48] array];
  }
  uint64_t v10 = v9;

  if ((unint64_t)[v10 count] >= 0x64)
  {
    *(void *)&long long v11 = 136315394;
    long long v14 = v11;
    do
    {
      char v12 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = v14;
        __int16 v16 = "-[AFPreferences appendHomeAccessorySiriDataSharingChangeLogEvent:]";
        __int16 v17 = 2048;
        uint64_t v18 = 100;
        _os_log_impl(&dword_19CF1D000, v12, OS_LOG_TYPE_INFO, "%s Home accessory Siri data sharing opt-in status change log size is greater than maximum of %ld. Removing oldest entry.", buf, 0x16u);
      }
      objc_msgSend(v10, "removeObjectAtIndex:", 0, v14);
    }
    while ((unint64_t)[v10 count] > 0x63);
  }
  long long v13 = [v4 buildDictionaryRepresentation];
  [v10 addObject:v13];
  _AFPreferencesSetValueForKeyWithContext(v10, @"Home Accessories Siri Data Sharing Opt-In Change Log", @"com.apple.assistant.backedup", self->_instanceContext);
  [(AFPreferences *)self synchronize];
}

- (id)getHomeAccessorySiriDataSharingChangeLog
{
  id v2 = _AFPreferencesValueForKeyWithContext(@"Home Accessories Siri Data Sharing Opt-In Change Log", @"com.apple.assistant.backedup", self->_instanceContext);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (id)siriDataSharingOptInStatusHistory
{
  id v2 = _AFPreferencesValueForKeyWithContext(@"Siri Data Sharing Opt-In Status History", @"com.apple.assistant.backedup", self->_instanceContext);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (void)appendToSiriDataSharingOptInStatusHistory:(int64_t)a3 previousOptInStatus:(int64_t)a4 statusChangeSource:(int64_t)a5 reason:(id)a6
{
  v40[8] = *MEMORY[0x1E4F143B8];
  uint64_t v10 = (__CFString *)a6;
  v39[0] = @"Date";
  long long v11 = [MEMORY[0x1E4F1C9C8] date];
  v40[0] = v11;
  v39[1] = @"New Opt-In Status";
  if ((unint64_t)a3 > 3) {
    char v12 = @"(unknown)";
  }
  else {
    char v12 = off_1E592B870[a3];
  }
  long long v13 = v12;
  v40[1] = v13;
  v39[2] = @"Previous Opt-In Status";
  if ((unint64_t)a4 > 3) {
    long long v14 = @"(unknown)";
  }
  else {
    long long v14 = off_1E592B870[a4];
  }
  id v15 = v14;
  v40[2] = v15;
  v39[3] = @"Source";
  if ((unint64_t)a5 > 0xB) {
    __int16 v16 = @"(unknown)";
  }
  else {
    __int16 v16 = off_1E592B7A8[a5];
  }
  __int16 v17 = v16;
  uint64_t v18 = v17;
  uint64_t v19 = @"Unspecified";
  v32 = v10;
  if (v10) {
    uint64_t v19 = v10;
  }
  v40[3] = v17;
  v40[4] = v19;
  v39[4] = @"Reason";
  v39[5] = @"Build Version";
  long long v20 = (void *)MGCopyAnswer();
  v40[5] = v20;
  v39[6] = @"Product Version";
  long long v21 = (void *)MGCopyAnswer();
  v39[7] = @"Schema Version";
  v40[6] = v21;
  v40[7] = @"1.0";
  long long v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:8];

  __int16 v23 = AFSiriLogContextDaemon;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v34 = "-[AFPreferences appendToSiriDataSharingOptInStatusHistory:previousOptInStatus:statusChangeSource:reason:]";
    __int16 v35 = 2112;
    uint64_t v36 = (uint64_t)v22;
    _os_log_impl(&dword_19CF1D000, v23, OS_LOG_TYPE_INFO, "%s Appending siri data sharing opt-in status information to history: %@", buf, 0x16u);
  }
  uint64_t v24 = [(AFPreferences *)self siriDataSharingOptInStatusHistory];
  uint64_t v25 = (void *)[v24 mutableCopy];
  __int16 v26 = v25;
  if (v25)
  {
    id v27 = v25;
  }
  else
  {
    id v27 = [MEMORY[0x1E4F1CA48] array];
  }
  uint64_t v28 = v27;

  if ((unint64_t)[v28 count] >= 0x64)
  {
    do
    {
      uint64_t v29 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        v30 = v29;
        uint64_t v31 = [v28 count];
        *(_DWORD *)buf = 136315650;
        v34 = "-[AFPreferences appendToSiriDataSharingOptInStatusHistory:previousOptInStatus:statusChangeSource:reason:]";
        __int16 v35 = 2048;
        uint64_t v36 = v31;
        __int16 v37 = 2048;
        uint64_t v38 = 100;
        _os_log_impl(&dword_19CF1D000, v30, OS_LOG_TYPE_INFO, "%s Siri data sharing opt-in status history size of %ld is greater than maximum of %ld. Removing oldest entry.", buf, 0x20u);
      }
      objc_msgSend(v28, "removeObjectAtIndex:", objc_msgSend(v28, "count") - 1);
    }
    while ((unint64_t)[v28 count] > 0x63);
  }
  [v28 insertObject:v22 atIndex:0];
  _AFPreferencesSetValueForKeyWithContext(v28, @"Siri Data Sharing Opt-In Status History", @"com.apple.assistant.backedup", self->_instanceContext);
  [(AFPreferences *)self synchronize];
}

- (id)getHomeAccessoriesRepromptStatus
{
  id v2 = _AFPreferencesValueForKeyWithContext(@"Siri Data Sharing Accessory Reprompt Status", @"com.apple.assistant.backedup", 0);
  objc_opt_class();
  id v3 = 0;
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }

  return v3;
}

- (void)setHomeAccessoriesRepromptStatus:(id)a3
{
  _AFPreferencesSetValueForKeyWithContext(a3, @"Siri Data Sharing Accessory Reprompt Status", @"com.apple.assistant.backedup", 0);
  CFPreferencesAppSynchronize(@"com.apple.assistant.support");
}

- (void)setSiriDataSharingHomePodSetupDeviceIsValid:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  int v7 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[AFPreferences setSiriDataSharingHomePodSetupDeviceIsValid:completion:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v4;
    _os_log_impl(&dword_19CF1D000, v7, OS_LOG_TYPE_INFO, "%s %d", buf, 0x12u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  long long v14 = __Block_byref_object_copy__9959;
  id v15 = __Block_byref_object_dispose__9960;
  __int16 v16 = [[AFSettingsConnection alloc] initWithInstanceContext:self->_instanceContext];
  unint64_t v8 = *(void **)(*(void *)&buf[8] + 40);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __72__AFPreferences_setSiriDataSharingHomePodSetupDeviceIsValid_completion___block_invoke;
  v10[3] = &unk_1E5926358;
  id v9 = v6;
  id v11 = v9;
  char v12 = buf;
  [v8 setSiriDataSharingHomePodSetupDeviceIsValid:v4 completion:v10];

  _Block_object_dispose(buf, 8);
}

void __72__AFPreferences_setSiriDataSharingHomePodSetupDeviceIsValid_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

- (BOOL)shouldSuppressSiriDataSharingOptInAlert
{
  CFPreferencesAppSynchronize(@"com.apple.assistant.support");
  return _AFSupportPreferencesBoolForKeyWithDefault(@"Suppress Siri Data Sharing Opt In", 0);
}

- (void)setSiriDataSharingOptInAlertPresented:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__9959;
  __int16 v16 = __Block_byref_object_dispose__9960;
  uint64_t v17 = [[AFSettingsConnection alloc] initWithInstanceContext:self->_instanceContext];
  int v7 = (void *)v13[5];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __66__AFPreferences_setSiriDataSharingOptInAlertPresented_completion___block_invoke;
  v9[3] = &unk_1E5926358;
  id v8 = v6;
  id v10 = v8;
  id v11 = &v12;
  [v7 setSiriDataSharingOptInAlertPresented:v4 completion:v9];

  _Block_object_dispose(&v12, 8);
}

void __66__AFPreferences_setSiriDataSharingOptInAlertPresented_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

- (void)setSiriDataSharingOptInStatus:(int64_t)a3 propagateToHomeAccessories:(BOOL)a4 source:(int64_t)a5 reason:(id)a6 completion:(id)a7
{
  BOOL v9 = a4;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v12 = a6;
  id v13 = a7;
  uint64_t v14 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316163;
    *(void *)&uint8_t buf[4] = "-[AFPreferences setSiriDataSharingOptInStatus:propagateToHomeAccessories:source:reason:completion:]";
    *(_WORD *)&buf[12] = 2049;
    *(void *)&buf[14] = a3;
    *(_WORD *)&buf[22] = 2048;
    int64_t v21 = a5;
    LOWORD(v22) = 2113;
    *(void *)((char *)&v22 + 2) = v12;
    WORD5(v22) = 1024;
    HIDWORD(v22) = v9;
    _os_log_impl(&dword_19CF1D000, v14, OS_LOG_TYPE_INFO, "%s Setting Siri Data Sharing OptIn status=%{private}ld from source=%ld with reason=%{private}@, and propagating to home accessories=%d", buf, 0x30u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  int64_t v21 = (int64_t)__Block_byref_object_copy__9959;
  *(void *)&long long v22 = __Block_byref_object_dispose__9960;
  *((void *)&v22 + 1) = [[AFSettingsConnection alloc] initWithInstanceContext:self->_instanceContext];
  id v15 = *(void **)(*(void *)&buf[8] + 40);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __99__AFPreferences_setSiriDataSharingOptInStatus_propagateToHomeAccessories_source_reason_completion___block_invoke;
  v17[3] = &unk_1E5926358;
  id v16 = v13;
  id v18 = v16;
  uint64_t v19 = buf;
  [v15 setSiriDataSharingOptInStatus:a3 propagateToHomeAccessories:v9 source:a5 reason:v12 completion:v17];

  _Block_object_dispose(buf, 8);
}

void __99__AFPreferences_setSiriDataSharingOptInStatus_propagateToHomeAccessories_source_reason_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

- (void)setSiriDataSharingOptInStatus:(int64_t)a3 completion:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  int v7 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315395;
    *(void *)&uint8_t buf[4] = "-[AFPreferences setSiriDataSharingOptInStatus:completion:]";
    *(_WORD *)&buf[12] = 2049;
    *(void *)&buf[14] = a3;
    _os_log_impl(&dword_19CF1D000, v7, OS_LOG_TYPE_INFO, "%s %{private}ld", buf, 0x16u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__9959;
  id v15 = __Block_byref_object_dispose__9960;
  id v16 = [[AFSettingsConnection alloc] initWithInstanceContext:self->_instanceContext];
  id v8 = *(void **)(*(void *)&buf[8] + 40);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __58__AFPreferences_setSiriDataSharingOptInStatus_completion___block_invoke;
  v10[3] = &unk_1E5926358;
  id v9 = v6;
  id v11 = v9;
  id v12 = buf;
  [v8 setSiriDataSharingOptInStatus:a3 completion:v10];

  _Block_object_dispose(buf, 8);
}

void __58__AFPreferences_setSiriDataSharingOptInStatus_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

- (void)setDesignModeEnabled:(BOOL)a3
{
}

- (BOOL)designModeIsEnabled
{
  return _AFSupportPreferencesBoolForKeyWithDefault(@"HI/CI Design Mode", 0);
}

- (BOOL)assistantOnDemandAssetSubscriptionAllowed
{
  return 1;
}

- (BOOL)deviceUsesCompactVoiceTrigger
{
  uint64_t v3 = [getVTPreferencesClass() sharedPreferences];
  if ([v3 voiceTriggerEnabled])
  {
    BOOL v4 = [(AFPreferences *)self languageCode];
    if (!v4)
    {
      BOOL v4 = [(AFPreferences *)self bestSupportedLanguageCodeForLanguageCode:0];
    }
    if ([v3 isCompactVoiceTriggerAvailableForLanguageCode:v4]) {
      char v5 = MGGetBoolAnswer();
    }
    else {
      char v5 = 0;
    }
    if ([v3 getUserPreferredVoiceTriggerPhraseTypeForDeviceType:0 endpointId:0 error:0] != 1) {
      char v5 = 0;
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (void)setCompactVoiceTriggerDiscoveryNotificationPresented:(BOOL)a3 forBTDeviceWithAddress:(id)a4
{
  BOOL v4 = a3;
  id v6 = _AFHashedBluetoothAddressForDiscoveryNotification(a4);
  int v7 = _AFPreferencesValueForKeyWithContext(@"Compact Voice Trigger Discovery Notification Presented For Bluetooth Device", @"com.apple.assistant.backedup", 0);
  id v8 = (id)[v7 mutableCopy];

  if (v8)
  {
    if (v4)
    {
LABEL_3:
      id v9 = [MEMORY[0x1E4F28ED0] numberWithBool:1];
      [v8 setObject:v9 forKey:v6];

      goto LABEL_6;
    }
  }
  else
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if (v4) {
      goto LABEL_3;
    }
  }
  [v8 removeObjectForKey:v6];
LABEL_6:
  _AFPreferencesSetValueForKeyWithContext(v8, @"Compact Voice Trigger Discovery Notification Presented For Bluetooth Device", @"com.apple.assistant.backedup", 0);
  CFPreferencesAppSynchronize(@"com.apple.assistant.backedup");

  [(AFPreferences *)self synchronize];
}

- (BOOL)hasPresentedCompactVoiceTriggerDiscoveryNotificationForBTDeviceWithAddress:(id)a3
{
  uint64_t v3 = _AFHashedBluetoothAddressForDiscoveryNotification(a3);
  BOOL v4 = _AFPreferencesValueForKeyWithContext(@"Compact Voice Trigger Discovery Notification Presented For Bluetooth Device", @"com.apple.assistant.backedup", 0);
  char v5 = v4;
  if (v4)
  {
    id v6 = [v4 objectForKey:v3];
    char v7 = [v6 BOOLValue];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (void)setCompactVoiceTriggerDisclosurePresented:(BOOL)a3
{
  BOOL v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  _AFPreferencesSetValueForKeyWithContext(v4, @"Compact Voice Trigger Disclosure Presented", @"com.apple.assistant.backedup", 0);

  CFPreferencesAppSynchronize(@"com.apple.assistant.backedup");
  [(AFPreferences *)self synchronize];
}

- (BOOL)hasPresentedCompactVoiceTriggerDisclosure
{
  return _AFBackedUpPreferencesBoolForKeyWithDefault(@"Compact Voice Trigger Disclosure Presented", 0);
}

- (void)clearMessageWithoutConfirmationHeadphonesEnabled
{
  uint64_t v2 = [[AFSettingsConnection alloc] initWithInstanceContext:self->_instanceContext];
  [(AFSettingsConnection *)v2 clearMessageWithoutConfirmationHeadphonesEnabled];
  [(AFSettingsConnection *)v2 barrier];
}

- (void)setMessageWithoutConfirmationHeadphonesEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v4 = [[AFSettingsConnection alloc] initWithInstanceContext:self->_instanceContext];
  [(AFSettingsConnection *)v4 setMessageWithoutConfirmationHeadphonesEnabled:v3];
  [(AFSettingsConnection *)v4 barrier];
}

- (BOOL)shouldDisableServerFallbackDomain
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (+[AFFeatureFlags isNLServerFallbackDisabledWithExperiment])
  {
    int v3 = _AFPreferencesBoolValueForKeyWithContext(@"Is Trial config set to disable NL Server Fallback for Domain", 0, @"com.apple.assistant", self->_instanceContext);
    BOOL v4 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      char v5 = @"NO";
      if (v3) {
        char v5 = @"YES";
      }
      int v7 = 136315394;
      id v8 = "-[AFPreferences shouldDisableServerFallbackDomain]";
      __int16 v9 = 2112;
      id v10 = v5;
      _os_log_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_INFO, "%s shouldDisableServerFallbackDomain = %@ with Trial", (uint8_t *)&v7, 0x16u);
    }
  }
  else
  {
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (BOOL)shouldDisableServerFallbackNL
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (+[AFFeatureFlags isNLServerFallbackDisabledWithExperiment])
  {
    int v3 = _AFPreferencesBoolValueForKeyWithContext(@"Is Trial config set to disable NL Server Fallback for NL", 0, @"com.apple.assistant", self->_instanceContext);
    BOOL v4 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      char v5 = @"NO";
      if (v3) {
        char v5 = @"YES";
      }
      int v7 = 136315394;
      id v8 = "-[AFPreferences shouldDisableServerFallbackNL]";
      __int16 v9 = 2112;
      id v10 = v5;
      _os_log_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_INFO, "%s shouldDisableServerFallbackNL = %@ with Trial", (uint8_t *)&v7, 0x16u);
    }
  }
  else
  {
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (BOOL)hasSufficientAssetToDisableServerFallback
{
  return 0;
}

- (BOOL)shouldDisableMediaEntitySync
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  int v3 = [(AFPreferences *)self languageCode];
  if (!v3)
  {
    id v10 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      int v13 = 136315138;
      uint64_t v14 = "-[AFPreferences shouldDisableMediaEntitySync]";
      uint64_t v11 = "%s isMediaEntitySyncDisabled=false because languageCode is nil";
LABEL_12:
      _os_log_impl(&dword_19CF1D000, v10, OS_LOG_TYPE_INFO, v11, (uint8_t *)&v13, 0xCu);
    }
LABEL_13:
    LOBYTE(v8) = 0;
    goto LABEL_14;
  }
  if ((_AFPreferencesBoolValueForKeyWithContext(@"Is Siri full UOD Supported", 0, @"com.apple.assistant", self->_instanceContext) & 1) == 0)
  {
    id v10 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      int v13 = 136315138;
      uint64_t v14 = "-[AFPreferences shouldDisableMediaEntitySync]";
      uint64_t v11 = "%s isMediaEntitySyncDisabled=false because device doesn't support full Siri X";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  BOOL v4 = +[AFFeatureFlags isSiriPommesEnabled];
  BOOL v5 = +[AFFeatureFlags isSiriPommesEnabledForLanguage:v3];
  int64_t v6 = [(AFPreferences *)self siriDataSharingOptInStatus];
  int v7 = _AFPreferencesBoolValueForKeyWithContext(@"Has ATV or HomePods in the home", 0, @"com.apple.assistant", self->_instanceContext);
  if (v6 == 2) {
    int v8 = (v4 && v5) & ~v7;
  }
  else {
    int v8 = 0;
  }
  __int16 v9 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v13 = 136316418;
    uint64_t v14 = "-[AFPreferences shouldDisableMediaEntitySync]";
    __int16 v15 = 1024;
    int v16 = v8;
    __int16 v17 = 1024;
    BOOL v18 = v4;
    __int16 v19 = 1024;
    BOOL v20 = v5;
    __int16 v21 = 1024;
    int v22 = v7;
    __int16 v23 = 1024;
    BOOL v24 = v6 == 2;
    _os_log_impl(&dword_19CF1D000, v9, OS_LOG_TYPE_INFO, "%s isMediaEntitySyncDisabled=%d: pommesEnabled=%d pommesEnabledForLanguage=%d hasATVOrHomePodInHome=%d optedOutOfDataSharing=%d ", (uint8_t *)&v13, 0x2Au);
  }
LABEL_14:

  return v8;
}

- (BOOL)isSyncDisabledForFullUoDDevices
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v2 = _AFPreferencesBoolValueForKeyWithContext(@"Is Trial config set to disable sync for FullUoD en_US devices", 0, @"com.apple.assistant", self->_instanceContext);
  int v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315394;
    int64_t v6 = "-[AFPreferences isSyncDisabledForFullUoDDevices]";
    __int16 v7 = 1024;
    int v8 = v2;
    _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s isSyncDisabledForFullUoDDevices configured to '%d' with Trial", (uint8_t *)&v5, 0x12u);
  }
  return v2;
}

- (BOOL)isMediaEntitySyncDisabled
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (_AFPreferencesBoolValueForKeyWithContext(@"Is Trial config set to disable media entity sync", 0, @"com.apple.assistant", self->_instanceContext))
  {
    return [(AFPreferences *)self shouldDisableMediaEntitySync];
  }
  else
  {
    BOOL v4 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      int v5 = 136315138;
      int64_t v6 = "-[AFPreferences isMediaEntitySyncDisabled]";
      _os_log_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_INFO, "%s isMediaEntitySyncDisabledSyncConfig configured to false with Trial", (uint8_t *)&v5, 0xCu);
    }
    return 0;
  }
}

- (void)setLongLivedIdentifierUploadingEnabled:(BOOL)a3
{
  _AFPreferencesSetLongLivedIdentifierUploadingEnabled(a3);
  int v5 = [[AFSettingsConnection alloc] initWithInstanceContext:self->_instanceContext];
  [(AFSettingsConnection *)v5 resetSessionsAtNextRequestBoundary];
  [(AFSettingsConnection *)v5 barrier];
  if ((_AFPreferencesLongLivedIdentifierUploadingEnabled() & 1) == 0)
  {
    BOOL v4 = [MEMORY[0x1E4F618E0] sharedLogger];
    [v4 setValue:0 forUploadHeaderNamed:@"userId"];
  }
}

- (void)setSiriInCallEnabled:(BOOL)a3
{
}

- (BOOL)siriInCallEnabled
{
  return +[AFFeatureFlags isBlindedSphinxEnabled]
      || _AFPreferencesGetSiriInCallEnablementState() == 2;
}

- (void)clearShowAppsBehindSiriInCarPlayEnabled
{
  int v2 = [[AFSettingsConnection alloc] initWithInstanceContext:self->_instanceContext];
  [(AFSettingsConnection *)v2 clearShowAppsBehindSiriInCarPlayEnabled];
  [(AFSettingsConnection *)v2 barrier];
}

- (void)setShowAppsBehindSiriInCarPlayEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v4 = [[AFSettingsConnection alloc] initWithInstanceContext:self->_instanceContext];
  [(AFSettingsConnection *)v4 setShowAppsBehindSiriInCarPlayEnabled:v3];
  [(AFSettingsConnection *)v4 barrier];
}

- (void)getShowAppsBehindSiriInCarPlayEnabledWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v9 = 0;
    id v10 = &v9;
    uint64_t v11 = 0x3032000000;
    id v12 = __Block_byref_object_copy__9959;
    int v13 = __Block_byref_object_dispose__9960;
    uint64_t v14 = [[AFSettingsConnection alloc] initWithInstanceContext:self->_instanceContext];
    int v5 = (void *)v10[5];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __69__AFPreferences_getShowAppsBehindSiriInCarPlayEnabledWithCompletion___block_invoke;
    v6[3] = &unk_1E59263A8;
    id v7 = v4;
    int v8 = &v9;
    [v5 getShowAppsBehindSiriInCarPlayEnabledWithCompletion:v6];

    _Block_object_dispose(&v9, 8);
  }
}

void __69__AFPreferences_getShowAppsBehindSiriInCarPlayEnabledWithCompletion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

- (void)getMessageWithoutConfirmationHeadphonesEnabledWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v9 = 0;
    id v10 = &v9;
    uint64_t v11 = 0x3032000000;
    id v12 = __Block_byref_object_copy__9959;
    int v13 = __Block_byref_object_dispose__9960;
    uint64_t v14 = [[AFSettingsConnection alloc] initWithInstanceContext:self->_instanceContext];
    int v5 = (void *)v10[5];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __78__AFPreferences_getMessageWithoutConfirmationHeadphonesEnabledWithCompletion___block_invoke;
    v6[3] = &unk_1E59263A8;
    id v7 = v4;
    int v8 = &v9;
    [v5 getMessageWithoutConfirmationHeadphonesEnabledWithCompletion:v6];

    _Block_object_dispose(&v9, 8);
  }
}

void __78__AFPreferences_getMessageWithoutConfirmationHeadphonesEnabledWithCompletion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

- (void)clearMessageWithoutConfirmationInCarPlayEnabled
{
  uint64_t v2 = [[AFSettingsConnection alloc] initWithInstanceContext:self->_instanceContext];
  [(AFSettingsConnection *)v2 clearMessageWithoutConfirmationInCarPlayEnabled];
  [(AFSettingsConnection *)v2 barrier];
}

- (void)setMessageWithoutConfirmationInCarPlayEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [[AFSettingsConnection alloc] initWithInstanceContext:self->_instanceContext];
  [(AFSettingsConnection *)v4 setMessageWithoutConfirmationInCarPlayEnabled:v3];
  [(AFSettingsConnection *)v4 barrier];
}

- (void)getMessageWithoutConfirmationInCarPlayEnabledWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v9 = 0;
    id v10 = &v9;
    uint64_t v11 = 0x3032000000;
    id v12 = __Block_byref_object_copy__9959;
    int v13 = __Block_byref_object_dispose__9960;
    uint64_t v14 = [[AFSettingsConnection alloc] initWithInstanceContext:self->_instanceContext];
    int v5 = (void *)v10[5];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __77__AFPreferences_getMessageWithoutConfirmationInCarPlayEnabledWithCompletion___block_invoke;
    v6[3] = &unk_1E59263A8;
    id v7 = v4;
    int v8 = &v9;
    [v5 getMessageWithoutConfirmationInCarPlayEnabledWithCompletion:v6];

    _Block_object_dispose(&v9, 8);
  }
}

void __77__AFPreferences_getMessageWithoutConfirmationInCarPlayEnabledWithCompletion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

- (void)clearMessageWithoutConfirmationEnabled
{
  uint64_t v2 = [[AFSettingsConnection alloc] initWithInstanceContext:self->_instanceContext];
  [(AFSettingsConnection *)v2 clearMessageWithoutConfirmationEnabled];
  [(AFSettingsConnection *)v2 barrier];
}

- (void)setMessageWithoutConfirmationEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [[AFSettingsConnection alloc] initWithInstanceContext:self->_instanceContext];
  [(AFSettingsConnection *)v4 setMessageWithoutConfirmationEnabled:v3];
  [(AFSettingsConnection *)v4 barrier];
}

- (void)getMessageWithoutConfirmationEnabledWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v9 = 0;
    id v10 = &v9;
    uint64_t v11 = 0x3032000000;
    id v12 = __Block_byref_object_copy__9959;
    int v13 = __Block_byref_object_dispose__9960;
    uint64_t v14 = [[AFSettingsConnection alloc] initWithInstanceContext:self->_instanceContext];
    int v5 = (void *)v10[5];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __68__AFPreferences_getMessageWithoutConfirmationEnabledWithCompletion___block_invoke;
    v6[3] = &unk_1E59263A8;
    id v7 = v4;
    int v8 = &v9;
    [v5 getMessageWithoutConfirmationEnabledWithCompletion:v6];

    _Block_object_dispose(&v9, 8);
  }
}

void __68__AFPreferences_getMessageWithoutConfirmationEnabledWithCompletion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

- (void)clearAnnounceNotificationsInCarPlayType
{
  uint64_t v2 = [[AFSettingsConnection alloc] initWithInstanceContext:self->_instanceContext];
  [(AFSettingsConnection *)v2 clearAnnounceNotificationsInCarPlayType];
  [(AFSettingsConnection *)v2 barrier];
}

- (void)setAnnounceNotificationsInCarPlayType:(int64_t)a3
{
  id v4 = [[AFSettingsConnection alloc] initWithInstanceContext:self->_instanceContext];
  [(AFSettingsConnection *)v4 setAnnounceNotificationsInCarPlayType:a3];
  [(AFSettingsConnection *)v4 barrier];
}

- (void)getAnnounceNotificationsInCarPlayTypeWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v9 = 0;
    id v10 = &v9;
    uint64_t v11 = 0x3032000000;
    id v12 = __Block_byref_object_copy__9959;
    int v13 = __Block_byref_object_dispose__9960;
    uint64_t v14 = [[AFSettingsConnection alloc] initWithInstanceContext:self->_instanceContext];
    int v5 = (void *)v10[5];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __69__AFPreferences_getAnnounceNotificationsInCarPlayTypeWithCompletion___block_invoke;
    v6[3] = &unk_1E5926448;
    id v7 = v4;
    int v8 = &v9;
    [v5 getAnnounceNotificationsInCarPlayTypeWithCompletion:v6];

    _Block_object_dispose(&v9, 8);
  }
}

void __69__AFPreferences_getAnnounceNotificationsInCarPlayTypeWithCompletion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

- (void)clearAnnounceNotificationsInCarPlayTemporarilyDisabled
{
  uint64_t v2 = [[AFSettingsConnection alloc] initWithInstanceContext:self->_instanceContext];
  [(AFSettingsConnection *)v2 clearAnnounceNotificationsInCarPlayTemporarilyDisabled];
  [(AFSettingsConnection *)v2 barrier];
}

- (void)setAnnounceNotificationsInCarPlayTemporarilyDisabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [[AFSettingsConnection alloc] initWithInstanceContext:self->_instanceContext];
  [(AFSettingsConnection *)v4 setAnnounceNotificationsInCarPlayTemporarilyDisabled:v3];
  [(AFSettingsConnection *)v4 barrier];
}

- (void)getAnnounceNotificationsInCarPlayTemporarilyDisabledWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v9 = 0;
    id v10 = &v9;
    uint64_t v11 = 0x3032000000;
    id v12 = __Block_byref_object_copy__9959;
    int v13 = __Block_byref_object_dispose__9960;
    uint64_t v14 = [[AFSettingsConnection alloc] initWithInstanceContext:self->_instanceContext];
    int v5 = (void *)v10[5];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __84__AFPreferences_getAnnounceNotificationsInCarPlayTemporarilyDisabledWithCompletion___block_invoke;
    v6[3] = &unk_1E59263A8;
    id v7 = v4;
    int v8 = &v9;
    [v5 getAnnounceNotificationsInCarPlayTemporarilyDisabledWithCompletion:v6];

    _Block_object_dispose(&v9, 8);
  }
}

void __84__AFPreferences_getAnnounceNotificationsInCarPlayTemporarilyDisabledWithCompletion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

- (void)setAnnounceNotificationsTemporarilyDisabledUntil:(id)a3 forApp:(id)a4 platform:(int64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [[AFSettingsConnection alloc] initWithInstanceContext:self->_instanceContext];
  [(AFSettingsConnection *)v10 setAnnounceNotificationsTemporarilyDisabledUntil:v9 forApp:v8 platform:a5];

  [(AFSettingsConnection *)v10 barrier];
}

- (void)getAnnounceNotificationsTemporarilyDisabledEndDateForApp:(id)a3 platform:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    uint64_t v14 = 0;
    __int16 v15 = &v14;
    uint64_t v16 = 0x3032000000;
    __int16 v17 = __Block_byref_object_copy__9959;
    BOOL v18 = __Block_byref_object_dispose__9960;
    __int16 v19 = [[AFSettingsConnection alloc] initWithInstanceContext:self->_instanceContext];
    id v10 = (void *)v15[5];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __94__AFPreferences_getAnnounceNotificationsTemporarilyDisabledEndDateForApp_platform_completion___block_invoke;
    void v11[3] = &unk_1E59263F8;
    id v12 = v9;
    int v13 = &v14;
    [v10 getAnnounceNotificationsTemporarilyDisabledEndDateForApp:v8 platform:a4 completion:v11];

    _Block_object_dispose(&v14, 8);
  }
}

void __94__AFPreferences_getAnnounceNotificationsTemporarilyDisabledEndDateForApp_platform_completion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

- (void)getAnnounceNotificationsTemporarilyDisabledForApp:(id)a3 platform:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    v26[0] = 0;
    v26[1] = v26;
    v26[2] = 0x2020000000;
    char v27 = 0;
    v24[0] = 0;
    v24[1] = v24;
    v24[2] = 0x2020000000;
    char v25 = 0;
    id v10 = dispatch_group_create();
    dispatch_group_enter(v10);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __87__AFPreferences_getAnnounceNotificationsTemporarilyDisabledForApp_platform_completion___block_invoke;
    v21[3] = &unk_1E59263D0;
    __int16 v23 = v26;
    uint64_t v11 = v10;
    int v22 = v11;
    [(AFPreferences *)self getAnnounceNotificationsTemporarilyDisabledEndDateForApp:v8 platform:a4 completion:v21];
    if (a4 == 2)
    {
      dispatch_group_enter(v11);
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __87__AFPreferences_getAnnounceNotificationsTemporarilyDisabledForApp_platform_completion___block_invoke_2;
      v18[3] = &unk_1E5928670;
      BOOL v20 = v24;
      __int16 v19 = v11;
      [(AFPreferences *)self getAnnounceNotificationsInCarPlayTemporarilyDisabledWithCompletion:v18];
    }
    id v12 = dispatch_get_global_queue(0, 0);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __87__AFPreferences_getAnnounceNotificationsTemporarilyDisabledForApp_platform_completion___block_invoke_3;
    v13[3] = &unk_1E5926420;
    __int16 v15 = v24;
    uint64_t v16 = v26;
    int64_t v17 = a4;
    id v14 = v9;
    dispatch_group_notify(v11, v12, v13);

    _Block_object_dispose(v24, 8);
    _Block_object_dispose(v26, 8);
  }
}

void __87__AFPreferences_getAnnounceNotificationsTemporarilyDisabledForApp_platform_completion___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  BOOL v5 = 0;
  if (v6)
  {
    BOOL v3 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v4 = [v6 compare:v3];

    if (v4 == 1) {
      BOOL v5 = 1;
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v5;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __87__AFPreferences_getAnnounceNotificationsTemporarilyDisabledForApp_platform_completion___block_invoke_2(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __87__AFPreferences_getAnnounceNotificationsTemporarilyDisabledForApp_platform_completion___block_invoke_3(void *a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1[7];
  BOOL v3 = AFSiriLogContextConnection;
  BOOL v4 = os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO);
  if (v2 == 2)
  {
    if (v4)
    {
      int v5 = *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24);
      int v6 = *(unsigned __int8 *)(*(void *)(a1[6] + 8) + 24);
      int v10 = 136315650;
      uint64_t v11 = "-[AFPreferences getAnnounceNotificationsTemporarilyDisabledForApp:platform:completion:]_block_invoke_3";
      __int16 v12 = 1024;
      int v13 = v5;
      __int16 v14 = 1024;
      int v15 = v6;
      _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s announce notifications disabledForCarPlay: %{BOOL}d || disabledUntilEndDate: %{BOOL}d", (uint8_t *)&v10, 0x18u);
    }
    id v8 = *(uint64_t (**)(void))(a1[4] + 16);
  }
  else
  {
    if (v4)
    {
      int v7 = *(unsigned __int8 *)(*(void *)(a1[6] + 8) + 24);
      int v10 = 136315394;
      uint64_t v11 = "-[AFPreferences getAnnounceNotificationsTemporarilyDisabledForApp:platform:completion:]_block_invoke";
      __int16 v12 = 1024;
      int v13 = v7;
      _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s announce notifications disabledUntilEndDate: %{BOOL}d", (uint8_t *)&v10, 0x12u);
    }
    id v8 = *(uint64_t (**)(void))(a1[4] + 16);
  }
  return v8();
}

- (void)setAnnounceNotificationsTemporarilyDisabledUntil:(id)a3 platform:(int64_t)a4
{
  id v6 = a3;
  int v7 = [[AFSettingsConnection alloc] initWithInstanceContext:self->_instanceContext];
  [(AFSettingsConnection *)v7 setAnnounceNotificationsTemporarilyDisabledUntil:v6 platform:a4];

  [(AFSettingsConnection *)v7 barrier];
}

- (void)getAnnounceNotificationsTemporarilyDisabledEndDateForPlatform:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    uint64_t v11 = 0;
    __int16 v12 = &v11;
    uint64_t v13 = 0x3032000000;
    __int16 v14 = __Block_byref_object_copy__9959;
    int v15 = __Block_byref_object_dispose__9960;
    uint64_t v16 = [[AFSettingsConnection alloc] initWithInstanceContext:self->_instanceContext];
    int v7 = (void *)v12[5];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __90__AFPreferences_getAnnounceNotificationsTemporarilyDisabledEndDateForPlatform_completion___block_invoke;
    v8[3] = &unk_1E59263F8;
    id v9 = v6;
    int v10 = &v11;
    [v7 getAnnounceNotificationsTemporarilyDisabledEndDateForPlatform:a3 completion:v8];

    _Block_object_dispose(&v11, 8);
  }
}

void __90__AFPreferences_getAnnounceNotificationsTemporarilyDisabledEndDateForPlatform_completion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

- (void)getAnnounceNotificationsTemporarilyDisabledStatusForPlatform:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    v23[0] = 0;
    v23[1] = v23;
    v23[2] = 0x2020000000;
    char v24 = 0;
    v21[0] = 0;
    v21[1] = v21;
    v21[2] = 0x2020000000;
    char v22 = 0;
    int v7 = dispatch_group_create();
    dispatch_group_enter(v7);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __89__AFPreferences_getAnnounceNotificationsTemporarilyDisabledStatusForPlatform_completion___block_invoke;
    v18[3] = &unk_1E59263D0;
    BOOL v20 = v23;
    id v8 = v7;
    __int16 v19 = v8;
    [(AFPreferences *)self getAnnounceNotificationsTemporarilyDisabledEndDateForPlatform:a3 completion:v18];
    if (a3 == 2)
    {
      dispatch_group_enter(v8);
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __89__AFPreferences_getAnnounceNotificationsTemporarilyDisabledStatusForPlatform_completion___block_invoke_2;
      v15[3] = &unk_1E5928670;
      int64_t v17 = v21;
      uint64_t v16 = v8;
      [(AFPreferences *)self getAnnounceNotificationsInCarPlayTemporarilyDisabledWithCompletion:v15];
    }
    id v9 = dispatch_get_global_queue(0, 0);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    void v10[2] = __89__AFPreferences_getAnnounceNotificationsTemporarilyDisabledStatusForPlatform_completion___block_invoke_3;
    v10[3] = &unk_1E5926420;
    int64_t v14 = a3;
    id v11 = v6;
    __int16 v12 = v21;
    uint64_t v13 = v23;
    dispatch_group_notify(v8, v9, v10);

    _Block_object_dispose(v21, 8);
    _Block_object_dispose(v23, 8);
  }
}

void __89__AFPreferences_getAnnounceNotificationsTemporarilyDisabledStatusForPlatform_completion___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  BOOL v5 = 0;
  if (v6)
  {
    BOOL v3 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v4 = [v6 compare:v3];

    if (v4 == 1) {
      BOOL v5 = 1;
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v5;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __89__AFPreferences_getAnnounceNotificationsTemporarilyDisabledStatusForPlatform_completion___block_invoke_2(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __89__AFPreferences_getAnnounceNotificationsTemporarilyDisabledStatusForPlatform_completion___block_invoke_3(void *a1)
{
  uint64_t v2 = a1[7];
  uint64_t v3 = a1[4];
  BOOL v4 = v2 == 2 && *(unsigned char *)(*(void *)(a1[5] + 8) + 24)
    || *(unsigned __int8 *)(*(void *)(a1[6] + 8) + 24) != 0;
  return (*(uint64_t (**)(uint64_t, BOOL))(v3 + 16))(v3, v4);
}

- (void)getSpokenNotificationShouldSkipTriggerlessRepliesWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v9 = 0;
    int v10 = &v9;
    uint64_t v11 = 0x3032000000;
    __int16 v12 = __Block_byref_object_copy__9959;
    uint64_t v13 = __Block_byref_object_dispose__9960;
    int64_t v14 = [[AFSettingsConnection alloc] initWithInstanceContext:self->_instanceContext];
    BOOL v5 = (void *)v10[5];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __81__AFPreferences_getSpokenNotificationShouldSkipTriggerlessRepliesWithCompletion___block_invoke;
    v6[3] = &unk_1E59263A8;
    id v7 = v4;
    id v8 = &v9;
    [v5 getSpokenNotificationShouldSkipTriggerlessRepliesWithCompletion:v6];

    _Block_object_dispose(&v9, 8);
  }
}

void __81__AFPreferences_getSpokenNotificationShouldSkipTriggerlessRepliesWithCompletion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

- (void)setSpokenNotificationShouldSkipTriggerlessReplies:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [[AFSettingsConnection alloc] initWithInstanceContext:self->_instanceContext];
  [(AFSettingsConnection *)v4 setSpokenNotificationShouldSkipTriggerlessReplies:v3];
  [(AFSettingsConnection *)v4 barrier];
}

- (void)setAnnounceNotificationsOnHearingAidsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [[AFSettingsConnection alloc] initWithInstanceContext:self->_instanceContext];
  [(AFSettingsConnection *)v4 setAnnounceNotificationsOnHearingAidsEnabled:v3];
  [(AFSettingsConnection *)v4 barrier];
}

- (void)setAnnounceNotificationsOnHearingAidsSupported:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [[AFSettingsConnection alloc] initWithInstanceContext:self->_instanceContext];
  [(AFSettingsConnection *)v4 setAnnounceNotificationsOnHearingAidsSupported:v3];
  [(AFSettingsConnection *)v4 barrier];
}

- (void)setAnnounceNotificationsOnBuiltInSpeakerEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [[AFSettingsConnection alloc] initWithInstanceContext:self->_instanceContext];
  [(AFSettingsConnection *)v4 setAnnounceNotificationsOnBuiltInSpeakerEnabled:v3];
  [(AFSettingsConnection *)v4 barrier];
}

- (void)getSpokenNotificationShouldAnnounceAllNotificationsWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v9 = 0;
    int v10 = &v9;
    uint64_t v11 = 0x3032000000;
    __int16 v12 = __Block_byref_object_copy__9959;
    uint64_t v13 = __Block_byref_object_dispose__9960;
    int64_t v14 = [[AFSettingsConnection alloc] initWithInstanceContext:self->_instanceContext];
    BOOL v5 = (void *)v10[5];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __83__AFPreferences_getSpokenNotificationShouldAnnounceAllNotificationsWithCompletion___block_invoke;
    v6[3] = &unk_1E59263A8;
    id v7 = v4;
    id v8 = &v9;
    [v5 getSpokenNotificationShouldAnnounceAllNotificationsWithCompletion:v6];

    _Block_object_dispose(&v9, 8);
  }
}

void __83__AFPreferences_getSpokenNotificationShouldAnnounceAllNotificationsWithCompletion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

- (void)setSpokenNotificationShouldAnnounceAllNotifications:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [[AFSettingsConnection alloc] initWithInstanceContext:self->_instanceContext];
  [(AFSettingsConnection *)v4 setSpokenNotificationShouldAnnounceAllNotifications:v3];
  [(AFSettingsConnection *)v4 barrier];
}

- (void)getSpokenNotificationIsAlwaysOpportuneWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v9 = 0;
    int v10 = &v9;
    uint64_t v11 = 0x3032000000;
    __int16 v12 = __Block_byref_object_copy__9959;
    uint64_t v13 = __Block_byref_object_dispose__9960;
    int64_t v14 = [[AFSettingsConnection alloc] initWithInstanceContext:self->_instanceContext];
    BOOL v5 = (void *)v10[5];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __70__AFPreferences_getSpokenNotificationIsAlwaysOpportuneWithCompletion___block_invoke;
    v6[3] = &unk_1E59263A8;
    id v7 = v4;
    id v8 = &v9;
    [v5 getSpokenNotificationIsAlwaysOpportuneWithCompletion:v6];

    _Block_object_dispose(&v9, 8);
  }
}

void __70__AFPreferences_getSpokenNotificationIsAlwaysOpportuneWithCompletion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

- (void)setSpokenNotificationIsAlwaysOpportune:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [[AFSettingsConnection alloc] initWithInstanceContext:self->_instanceContext];
  [(AFSettingsConnection *)v4 setSpokenNotificationIsAlwaysOpportune:v3];
  [(AFSettingsConnection *)v4 barrier];
}

- (BOOL)spokenNotificationSkipTriggerlessReplyConfirmation
{
  return _AFBackedUpPreferencesBoolForKeyWithDefault(@"Spoken Notification Skip Triggerless Reply Confirmation", 0);
}

- (void)setSpokenNotificationSkipTriggerlessReplyConfirmation:(BOOL)a3
{
}

- (void)setSpokenNotificationsProxCardSeen
{
  uint64_t v2 = [[AFSettingsConnection alloc] initWithInstanceContext:self->_instanceContext];
  [(AFSettingsConnection *)v2 setSpokenNotificationProxCardSeen:1];
  [(AFSettingsConnection *)v2 barrier];
}

- (void)removeThreadCancellationForApp:(id)a3 threadID:(id)a4
{
}

- (void)markLastAnnouncementInThreadAsCancelledForApp:(id)a3 threadID:(id)a4
{
}

- (BOOL)lastAnnouncementInThreadWasCancelledForApp:(id)a3 threadID:(id)a4
{
  return _AFPreferencesLastAnnouncementInThreadWasCancelled(a3, a4);
}

- (void)setSpokenNotificationTemporarilyDisabledForApp:(id)a3 until:(id)a4
{
}

- (void)getSpokenNotificationTemporarilyDisabledEndDateForApp:(id)a3 completion:(id)a4
{
}

- (void)getSpokenNotificationTemporarilyDisabledForApp:(id)a3 completion:(id)a4
{
}

- (void)clearSpokenNotificationTemporarilyDisabledStatus
{
  uint64_t v2 = [[AFSettingsConnection alloc] initWithInstanceContext:self->_instanceContext];
  [(AFSettingsConnection *)v2 clearSpokenNotificationTemporarilyDisabledStatus];
  [(AFSettingsConnection *)v2 barrier];
}

- (void)setSpokenNotificationTemporarilyDisabledUntil:(id)a3
{
}

- (void)getSpokenNotificationTemporarilyDisabledEndDateWithCompletion:(id)a3
{
}

- (void)getSpokenNotificationTemporarilyDisabledStatusWithCompletion:(id)a3
{
}

- (void)getHeadGesturesForCurrentlyRoutedDeviceWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__9959;
  int64_t v14 = __Block_byref_object_dispose__9960;
  int v15 = [[AFSettingsConnection alloc] initWithInstanceContext:self->_instanceContext];
  BOOL v5 = (void *)v11[5];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__AFPreferences_getHeadGesturesForCurrentlyRoutedDeviceWithCompletion___block_invoke;
  v7[3] = &unk_1E5926380;
  id v6 = v4;
  id v8 = v6;
  uint64_t v9 = &v10;
  [v5 getHeadGesturesForCurrentlyRoutedDevice:v7];

  _Block_object_dispose(&v10, 8);
}

void __71__AFPreferences_getHeadGesturesForCurrentlyRoutedDeviceWithCompletion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

- (void)setHeadGesturesForCurrentlyRoutedDevice:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  int v15 = __Block_byref_object_copy__9959;
  uint64_t v16 = __Block_byref_object_dispose__9960;
  int64_t v17 = [[AFSettingsConnection alloc] initWithInstanceContext:self->_instanceContext];
  id v7 = (void *)v13[5];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72__AFPreferences_setHeadGesturesForCurrentlyRoutedDevice_withCompletion___block_invoke;
  v9[3] = &unk_1E5926380;
  id v8 = v6;
  id v10 = v8;
  uint64_t v11 = &v12;
  [v7 setHeadGesturesForCurrentlyRoutedDevice:v4 withCompletion:v9];

  _Block_object_dispose(&v12, 8);
}

void __72__AFPreferences_setHeadGesturesForCurrentlyRoutedDevice_withCompletion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

- (void)getPersonalVolumeForCurrentlyRoutedDeviceWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__9959;
  uint64_t v14 = __Block_byref_object_dispose__9960;
  int v15 = [[AFSettingsConnection alloc] initWithInstanceContext:self->_instanceContext];
  BOOL v5 = (void *)v11[5];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__AFPreferences_getPersonalVolumeForCurrentlyRoutedDeviceWithCompletion___block_invoke;
  v7[3] = &unk_1E5926380;
  id v6 = v4;
  id v8 = v6;
  uint64_t v9 = &v10;
  [v5 getPersonalVolumeForCurrentlyRoutedDevice:v7];

  _Block_object_dispose(&v10, 8);
}

void __73__AFPreferences_getPersonalVolumeForCurrentlyRoutedDeviceWithCompletion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

- (void)setPersonalVolumeForCurrentlyRoutedDevice:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  int v15 = __Block_byref_object_copy__9959;
  uint64_t v16 = __Block_byref_object_dispose__9960;
  int64_t v17 = [[AFSettingsConnection alloc] initWithInstanceContext:self->_instanceContext];
  id v7 = (void *)v13[5];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __74__AFPreferences_setPersonalVolumeForCurrentlyRoutedDevice_withCompletion___block_invoke;
  v9[3] = &unk_1E5926380;
  id v8 = v6;
  id v10 = v8;
  uint64_t v11 = &v12;
  [v7 setPersonalVolumeForCurrentlyRoutedDevice:v4 withCompletion:v9];

  _Block_object_dispose(&v12, 8);
}

void __74__AFPreferences_setPersonalVolumeForCurrentlyRoutedDevice_withCompletion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

- (void)getConversationAwarenessForCurrentlyRoutedDeviceWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__9959;
  uint64_t v14 = __Block_byref_object_dispose__9960;
  int v15 = [[AFSettingsConnection alloc] initWithInstanceContext:self->_instanceContext];
  BOOL v5 = (void *)v11[5];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __80__AFPreferences_getConversationAwarenessForCurrentlyRoutedDeviceWithCompletion___block_invoke;
  v7[3] = &unk_1E5926380;
  id v6 = v4;
  id v8 = v6;
  uint64_t v9 = &v10;
  [v5 getConversationAwarenessForCurrentlyRoutedDevice:v7];

  _Block_object_dispose(&v10, 8);
}

void __80__AFPreferences_getConversationAwarenessForCurrentlyRoutedDeviceWithCompletion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

- (void)setConversationAwarenessForCurrentlyRoutedDevice:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  int v15 = __Block_byref_object_copy__9959;
  uint64_t v16 = __Block_byref_object_dispose__9960;
  int64_t v17 = [[AFSettingsConnection alloc] initWithInstanceContext:self->_instanceContext];
  id v7 = (void *)v13[5];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __81__AFPreferences_setConversationAwarenessForCurrentlyRoutedDevice_withCompletion___block_invoke;
  v9[3] = &unk_1E5926380;
  id v8 = v6;
  id v10 = v8;
  uint64_t v11 = &v12;
  [v7 setConversationAwarenessForCurrentlyRoutedDevice:v4 withCompletion:v9];

  _Block_object_dispose(&v12, 8);
}

void __81__AFPreferences_setConversationAwarenessForCurrentlyRoutedDevice_withCompletion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

- (unint64_t)internalUserClassification
{
  uint64_t v2 = _AFPreferencesValueForKeyWithContext(@"Internal User Classification", @"com.apple.assistant.backedup", 0);
  unint64_t v3 = [v2 unsignedIntegerValue];

  if (v3 >= 3) {
    return 0;
  }
  else {
    return v3;
  }
}

- (void)setInternalUserClassification:(unint64_t)a3
{
  BOOL v4 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a3];
  _AFPreferencesSetValueForKeyWithContext(v4, @"Internal User Classification", @"com.apple.assistant.backedup", 0);

  [(AFPreferences *)self synchronize];
}

- (void)setCloudSyncEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  BOOL v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315394;
    uint64_t v9 = "-[AFPreferences setCloudSyncEnabled:]";
    __int16 v10 = 1024;
    BOOL v11 = v3;
    _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s %d", (uint8_t *)&v8, 0x12u);
  }
  _AFPreferencesEnableCloudSync(v3);
  id v6 = [MEMORY[0x1E4F1C9C8] date];
  _AFPreferencesSetValueForKeyWithContext(v6, @"Cloud Sync Enabled Modification Date", @"com.apple.assistant.backedup", 0);

  [(AFPreferences *)self synchronize];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.siri.cloud.synch.changed", 0, 0, 1u);
}

- (BOOL)cloudSyncEnabled
{
  return _AFBackedUpPreferencesBoolForKeyWithDefault(@"Cloud Sync Enabled", 1);
}

- (void)setCurareOrchestrationEnabled:(BOOL)a3
{
  BOOL v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  _AFPreferencesSetValueForKeyWithContext(v4, @"Curare Orchestration Enabled", @"com.apple.assistant", self->_instanceContext);

  CFPreferencesAppSynchronize(@"com.apple.assistant");
}

- (BOOL)curareOrchestrationEnabled
{
  return _AFPreferencesBoolValueForKeyWithContext(@"Curare Orchestration Enabled", 0, @"com.apple.assistant", self->_instanceContext);
}

- (void)setListenAfterSpeakingDisabled:(BOOL)a3
{
  BOOL v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  _AFPreferencesSetValueForKeyWithContext(v4, @"Listen After Speaking Disabled", @"com.apple.assistant", self->_instanceContext);

  CFPreferencesAppSynchronize(@"com.apple.assistant");
}

- (BOOL)listenAfterSpeakingDisabled
{
  return _AFPreferencesBoolValueForKeyWithContext(@"Listen After Speaking Disabled", 0, @"com.apple.assistant", self->_instanceContext);
}

- (void)setCrownActivationEnabled:(BOOL)a3
{
  BOOL v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  _AFPreferencesSetValueForKeyWithContext(v4, @"Crown Activation Enabled", @"com.apple.assistant.support", 0);

  [(AFPreferences *)self synchronize];
}

- (BOOL)crownActivationEnabled
{
  return _AFSupportPreferencesBoolForKeyWithDefault(@"Crown Activation Enabled", 1);
}

- (void)setAlwaysShowRecognizedSpeech:(BOOL)a3
{
  BOOL v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  _AFPreferencesSetValueForKeyWithContext(v4, @"Always Show Recognized Speech", @"com.apple.assistant.backedup", 0);

  [(AFPreferences *)self synchronize];
}

- (BOOL)alwaysShowRecognizedSpeech
{
  return _AFBackedUpPreferencesBoolForKeyWithDefault(@"Always Show Recognized Speech", 0);
}

- (void)setAlwaysObscureBackgroundContentWhenActive:(BOOL)a3
{
  BOOL v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  _AFPreferencesSetValueForKeyWithContext(v4, @"Always Obscure Background Content When Active", @"com.apple.assistant.backedup", 0);

  [(AFPreferences *)self synchronize];
}

- (BOOL)alwaysObscureBackgroundContentWhenActive
{
  return _AFBackedUpPreferencesBoolForKeyWithDefault(@"Always Obscure Background Content When Active", 0);
}

- (void)setSiriResponseShouldAlwaysPrint:(BOOL)a3
{
  BOOL v5 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:");
  _AFPreferencesSetValueForKeyWithContext(v5, @"Always Print Siri Response", @"com.apple.assistant.backedup", 0);

  if (!a3) {
    _AFPreferencesSetSiriResponseShouldAlwaysPrintOverride(0);
  }
  [(AFPreferences *)self synchronize];
}

- (BOOL)siriResponseShouldAlwaysPrint
{
  if (_AFBackedUpPreferencesBoolForKeyWithDefault(@"Always Print Siri Response", 0)) {
    return 1;
  }
  return _AFBackedUpPreferencesBoolForKeyWithDefault(@"Always Print Siri Response Override", 0);
}

- (BOOL)siriResponseShouldAlwaysPrintWithoutOverride
{
  return _AFBackedUpPreferencesBoolForKeyWithDefault(@"Always Print Siri Response", 0);
}

- (void)setAlwaysAllowVoiceActivation:(BOOL)a3
{
  BOOL v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  _AFPreferencesSetValueForKeyWithContext(v4, @"Always Allow Voice Activation", @"com.apple.assistant.backedup", 0);

  [(AFPreferences *)self synchronize];
}

- (void)_setSuppressDictationOptInLocal:(BOOL)a3
{
}

- (void)setSuppressDictationOptIn:(BOOL)a3
{
  _AFPreferencesSetSuppressDictationOptIn(a3);
  [(AFPreferences *)self synchronize];
}

- (void)setSuppressAssistantOptIn:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = (void *)MEMORY[0x1E4F28ED0];
  id v6 = self->_instanceContext;
  id v7 = [v5 numberWithBool:v3];
  _AFPreferencesSetValueForKeyWithContext(v7, @"Suppress Assistant Opt In", @"com.apple.assistant.backedup", v6);

  [(AFPreferences *)self synchronize];
}

- (BOOL)suppressAssistantOptIn
{
  return _AFPreferencesBoolValueForKeyWithContext(@"Suppress Assistant Opt In", 0, @"com.apple.assistant.backedup", self->_instanceContext);
}

- (void)setShowsHoldToTalkIndicator:(BOOL)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  _AFPreferencesSetValueForKeyWithContext(v4, @"Indicate Hold-To-Talk Mode", @"com.apple.assistant.backedup", self->_instanceContext);
}

- (BOOL)showsHoldToTalkIndicator
{
  return _AFPreferencesBoolValueForKeyWithContext(@"Indicate Hold-To-Talk Mode", 0, @"com.apple.assistant.backedup", self->_instanceContext);
}

- (void)setSiriXDebugStatusEnabled:(BOOL)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  _AFPreferencesSetValueForKeyWithContext(v4, @"Siri X Debug Status Enabled", @"com.apple.assistant.backedup", 0);

  [(AFPreferences *)self synchronize];
}

- (BOOL)siriXDebugStatusEnabled
{
  CFPreferencesAppSynchronize(@"com.apple.assistant.backedup");
  if (AFIsCustomerInstallOrPPT()) {
    return 0;
  }
  return _AFBackedUpPreferencesBoolForKeyWithDefault(@"Siri X Debug Status Enabled", 0);
}

- (void)setDebugButtonIsEnabled:(BOOL)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  _AFPreferencesSetValueForKeyWithContext(v4, @"Debug Button Enabled", @"com.apple.assistant.backedup", 0);

  [(AFPreferences *)self synchronize];
}

- (BOOL)debugButtonIsEnabled
{
  CFPreferencesAppSynchronize(@"com.apple.assistant.backedup");
  if (AFIsCustomerInstallOrPPT()) {
    return 0;
  }
  return _AFBackedUpPreferencesBoolForKeyWithDefault(@"Debug Button Enabled", 1);
}

- (void)setShowServerOnUI:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = (void *)MEMORY[0x1E4F28ED0];
  id v6 = self->_instanceContext;
  id v7 = [v5 numberWithBool:v3];
  _AFPreferencesSetValueForKeyWithContext(v7, @"Show Server on UI", @"com.apple.assistant.backedup", v6);

  [(AFPreferences *)self synchronize];
}

- (BOOL)showServerOnUI
{
  CFPreferencesAppSynchronize(@"com.apple.assistant.backedup");
  BOOL v3 = self->_instanceContext;
  if (AFIsCustomerInstallOrPPT()) {
    char v4 = 0;
  }
  else {
    char v4 = _AFPreferencesBoolValueForKeyWithContext(@"Show Server on UI", 1, @"com.apple.assistant.backedup", v3);
  }

  return v4;
}

- (void)setStartAlertEnabled:(BOOL)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  _AFPreferencesSetValueForKeyWithContext(v4, @"StartAlertEnabled", @"com.apple.assistant.backedup", self->_instanceContext);
}

- (BOOL)startAlertEnabled
{
  return _AFPreferencesBoolValueForKeyWithContext(@"StartAlertEnabled", 0, @"com.apple.assistant.backedup", self->_instanceContext);
}

- (BOOL)isSearchDataSharingStatusForced
{
  CFPreferencesAppSynchronize(@"com.apple.assistant.support");
  instanceContext = self->_instanceContext;
  return _AFPreferencesValueIsForcedWithContext(@"Search Queries Data Sharing Status", @"com.apple.assistant.support", instanceContext);
}

- (void)setSearchQueriesDataSharingStatus:(int64_t)a3 completion:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v8 = v7;
    if ((unint64_t)a3 > 2) {
      uint64_t v9 = @"(unknown)";
    }
    else {
      uint64_t v9 = off_1E592A1C8[a3];
    }
    __int16 v10 = v9;
    *(_DWORD *)buf = 136315395;
    *(void *)&uint8_t buf[4] = "-[AFPreferences setSearchQueriesDataSharingStatus:completion:]";
    *(_WORD *)&buf[12] = 2113;
    *(void *)&buf[14] = v10;
    _os_log_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_INFO, "%s %{private}@", buf, 0x16u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  int64_t v17 = __Block_byref_object_copy__9959;
  BOOL v18 = __Block_byref_object_dispose__9960;
  __int16 v19 = [[AFSettingsConnection alloc] initWithInstanceContext:self->_instanceContext];
  BOOL v11 = *(void **)(*(void *)&buf[8] + 40);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __62__AFPreferences_setSearchQueriesDataSharingStatus_completion___block_invoke;
  v13[3] = &unk_1E5926358;
  id v12 = v6;
  id v14 = v12;
  int v15 = buf;
  [v11 setSearchQueriesDataSharingStatus:a3 completion:v13];

  _Block_object_dispose(buf, 8);
}

void __62__AFPreferences_setSearchQueriesDataSharingStatus_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

- (int64_t)getSearchQueriesDataSharingStatus
{
  CFPreferencesAppSynchronize(@"com.apple.assistant.support");
  instanceContext = self->_instanceContext;
  return _AFPreferencesSearchQueriesDataSharingStatusWithContext(instanceContext);
}

- (BOOL)allowExplicitContent
{
  return _AFPreferencesBoolValueForKeyWithContext(@"Allow Explicit Content", 0, @"com.apple.assistant.support", self->_instanceContext);
}

- (id)dictationAutoPunctuationSupportedLocales
{
  if (dictationAutoPunctuationSupportedLocales_onceToken != -1) {
    dispatch_once(&dictationAutoPunctuationSupportedLocales_onceToken, &__block_literal_global_1185);
  }
  uint64_t v2 = (void *)dictationAutoPunctuationSupportedLocales_supportedLocales;
  return v2;
}

void __57__AFPreferences_dictationAutoPunctuationSupportedLocales__block_invoke()
{
  objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"en-US", @"en-GB", @"en-IN", @"en-CA", @"zh-CN", @"zh-HK", @"ja-JP", @"fr-FR", @"de-DE", @"en-AU", @"es-ES", @"es-MX", @"es-US", @"zh-TW", @"en-SG", @"fr-CA", @"ko-KR",
    @"ar-SA",
    @"ar-UA",
    @"it-IT",
    @"yue-CN",
    @"fr-CH",
    @"de-CH",
    @"it-CH",
    @"nl-NL",
    @"sv-SE",
    @"fr-BE",
    @"nl-BE",
  uint64_t v0 = 0);
  v1 = (void *)dictationAutoPunctuationSupportedLocales_supportedLocales;
  dictationAutoPunctuationSupportedLocales_supportedLocales = v0;
}

- (void)_setDictationAutoPunctuationEnabledLocal:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  BOOL v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    int v8 = "-[AFPreferences _setDictationAutoPunctuationEnabledLocal:]";
    __int16 v9 = 1024;
    BOOL v10 = v3;
    _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s %d", (uint8_t *)&v7, 0x12u);
  }
  id v6 = [MEMORY[0x1E4F28ED0] numberWithBool:v3];
  _AFPreferencesSetValueForKeyWithContext(v6, @"Dictation Auto Punctuation Enabled", @"com.apple.assistant.support", 0);

  [(AFPreferences *)self synchronize];
}

- (void)setDictationAutoPunctuationEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  BOOL v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    int v8 = "-[AFPreferences setDictationAutoPunctuationEnabled:]";
    __int16 v9 = 1024;
    BOOL v10 = v3;
    _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s %d", (uint8_t *)&v7, 0x12u);
  }
  id v6 = [[AFSettingsConnection alloc] initWithInstanceContext:self->_instanceContext];
  [(AFSettingsConnection *)v6 setDictationAutoPunctuationEnabled:v3];
  [(AFSettingsConnection *)v6 barrier];
}

- (void)_suppressLowStorageNotificationForLanguage:(id)a3 suppress:(BOOL)a4
{
  BOOL v4 = a4;
  id v14 = [a3 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];
  uint64_t v6 = [(AFPreferences *)self _AFSupportPreferencesValueForKey:@"Displayed Low Storage Notification Status"];
  int v7 = (void *)v6;
  int v8 = (void *)MEMORY[0x1E4F1CBF0];
  if (v6) {
    int v8 = (void *)v6;
  }
  id v9 = v8;

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v10 = [v9 containsObject:v14];
    if (v4)
    {
      if ((v10 & 1) == 0)
      {
        uint64_t v11 = [v9 arrayByAddingObject:v14];
        [(AFPreferences *)self _AFSupportPreferencesSetValue:v11 forKey:@"Displayed Low Storage Notification Status"];

        [(AFPreferences *)self synchronize];
      }
    }
    else if (v10)
    {
      id v12 = (void *)[v9 mutableCopy];
      [v12 removeObject:v14];
      uint64_t v13 = (void *)[v12 copy];
      [(AFPreferences *)self _AFSupportPreferencesSetValue:v13 forKey:@"Displayed Low Storage Notification Status"];

      [(AFPreferences *)self synchronize];
    }
  }
}

- (void)suppressLowStorageNotificationForLanguage:(id)a3 suppress:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315650;
    int v10 = "-[AFPreferences suppressLowStorageNotificationForLanguage:suppress:]";
    __int16 v11 = 2112;
    id v12 = v6;
    __int16 v13 = 1024;
    BOOL v14 = v4;
    _os_log_impl(&dword_19CF1D000, v7, OS_LOG_TYPE_INFO, "%s language: %@, suppress: %d", (uint8_t *)&v9, 0x1Cu);
  }
  int v8 = [[AFSettingsConnection alloc] initWithInstanceContext:self->_instanceContext];
  [(AFSettingsConnection *)v8 suppressLowStorageNotificationForLanguage:v6 suppress:v4];
  [(AFSettingsConnection *)v8 barrier];
}

- (BOOL)displayedLowStorageNotificationForLanguage:(id)a3
{
  BOOL v4 = [a3 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];
  BOOL v5 = [(AFPreferences *)self _AFSupportPreferencesValueForKey:@"Displayed Low Storage Notification Status"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v6 = [v5 containsObject:v4];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)dictationAutoPunctuationEnabled
{
  return _AFSupportPreferencesBoolForKeyWithDefault(@"Dictation Auto Punctuation Enabled", 1);
}

- (BOOL)isInRestrictedSharingMode
{
  return 0;
}

- (void)resetSessionLanguage
{
}

- (void)setDictationSLSLanguagesEnabled:(id)a3
{
  _AFPreferencesSetValueForKeyWithContext(a3, @"Dictation SLS Languages Enabled", @"com.apple.assistant.support", self->_instanceContext);
  CFPreferencesAppSynchronize(@"com.apple.assistant");
}

- (void)setPreferOnlineRecognitionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  BOOL v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    int v8 = "-[AFPreferences setPreferOnlineRecognitionEnabled:]";
    __int16 v9 = 1024;
    BOOL v10 = v3;
    _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s %d", (uint8_t *)&v7, 0x12u);
  }
  char v6 = [MEMORY[0x1E4F28ED0] numberWithBool:v3];
  _AFPreferencesSetValueForKeyWithContext(v6, @"Prefer Online Recognition Enabled", @"com.apple.assistant", self->_instanceContext);

  CFPreferencesAppSynchronize(@"com.apple.assistant");
}

- (BOOL)preferOnlineRecognitionEnabled
{
  if (AFIsInternalInstall_onceToken != -1) {
    dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_158);
  }
  if (!AFIsInternalInstall_isInternal) {
    return 0;
  }
  BOOL v3 = _AFPreferencesValueForKeyWithContext(@"Prefer Online Recognition Enabled", @"com.apple.assistant", self->_instanceContext);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (void)setUtteranceDetectionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  BOOL v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    int v8 = "-[AFPreferences setUtteranceDetectionEnabled:]";
    __int16 v9 = 1024;
    BOOL v10 = v3;
    _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s %d", (uint8_t *)&v7, 0x12u);
  }
  char v6 = [MEMORY[0x1E4F28ED0] numberWithBool:v3];
  _AFPreferencesSetValueForKeyWithContext(v6, @"Utterance Detection Enabled", @"com.apple.assistant", self->_instanceContext);

  CFPreferencesAppSynchronize(@"com.apple.assistant");
}

- (BOOL)utteranceDetectionEnabled
{
  if (AFIsInternalInstall_onceToken != -1) {
    dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_158);
  }
  if (!AFIsInternalInstall_isInternal) {
    return 0;
  }
  BOOL v3 = _AFPreferencesValueForKeyWithContext(@"Utterance Detection Enabled", @"com.apple.assistant", self->_instanceContext);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (void)setForceOfflineRecognitionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  BOOL v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    int v8 = "-[AFPreferences setForceOfflineRecognitionEnabled:]";
    __int16 v9 = 1024;
    BOOL v10 = v3;
    _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s %d", (uint8_t *)&v7, 0x12u);
  }
  char v6 = [MEMORY[0x1E4F28ED0] numberWithBool:v3];
  _AFPreferencesSetValueForKeyWithContext(v6, @"Force Offline Recognition Enabled", @"com.apple.assistant", self->_instanceContext);

  CFPreferencesAppSynchronize(@"com.apple.assistant");
}

- (BOOL)forceOfflineRecognitionEnabled
{
  if (AFIsInternalInstall_onceToken != -1) {
    dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_158);
  }
  if (!AFIsInternalInstall_isInternal) {
    return 0;
  }
  BOOL v3 = _AFPreferencesValueForKeyWithContext(@"Force Offline Recognition Enabled", @"com.apple.assistant", self->_instanceContext);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (void)getOfflineDictationStatusWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  __int16 v13 = __Block_byref_object_copy__9959;
  BOOL v14 = __Block_byref_object_dispose__9960;
  uint64_t v15 = [[AFSettingsConnection alloc] initWithInstanceContext:self->_instanceContext];
  BOOL v5 = (void *)v11[5];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__AFPreferences_getOfflineDictationStatusWithCompletion___block_invoke;
  v7[3] = &unk_1E5926330;
  id v6 = v4;
  id v8 = v6;
  __int16 v9 = &v10;
  [v5 getOfflineDictationStatusWithCompletion:v7];

  _Block_object_dispose(&v10, 8);
}

void __57__AFPreferences_getOfflineDictationStatusWithCompletion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

- (void)setOnDeviceDictationAvailableAlertPresented:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  BOOL v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    id v8 = "-[AFPreferences setOnDeviceDictationAvailableAlertPresented:]";
    __int16 v9 = 1024;
    BOOL v10 = v3;
    _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s %d", (uint8_t *)&v7, 0x12u);
  }
  id v6 = [[AFSettingsConnection alloc] initWithInstanceContext:self->_instanceContext];
  [(AFSettingsConnection *)v6 setOnDeviceDictationAvailableAlertPresented:v3];
}

- (void)_setOnDeviceDictationAvailableAlertPresentedLocal:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315394;
    int v7 = "-[AFPreferences _setOnDeviceDictationAvailableAlertPresentedLocal:]";
    __int16 v8 = 1024;
    BOOL v9 = v3;
    _os_log_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_INFO, "%s %d", (uint8_t *)&v6, 0x12u);
  }
  BOOL v5 = [MEMORY[0x1E4F28ED0] numberWithBool:v3];
  _AFPreferencesSetValueForKeyWithContext(v5, @"On Device Dictation Available Alert Presented", @"com.apple.assistant.support", 0);

  CFPreferencesAppSynchronize(@"com.apple.assistant.support");
}

- (BOOL)onDeviceDictationAvailableAlertPresented
{
  return _AFSupportPreferencesBoolForKeyWithDefault(@"On Device Dictation Available Alert Presented", 0);
}

- (void)_setDictationIsAllowed:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    __int16 v8 = "-[AFPreferences _setDictationIsAllowed:]";
    __int16 v9 = 1024;
    BOOL v10 = v3;
    _os_log_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_INFO, "%s %d", (uint8_t *)&v7, 0x12u);
  }
  BOOL v5 = [MEMORY[0x1E4F28ED0] numberWithBool:v3];
  _AFPreferencesSetValueForKeyWithContext(v5, @"Dictation Allowed", @"com.apple.assistant.support", 0);
  CFPreferencesSetAppValue(@"Dictation Allowed", v5, @"com.apple.UIKit");
  CFPreferencesAppSynchronize(@"com.apple.assistant.support");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"kAFPreferencesDidChangeDarwinNotification", 0, 0, 1u);
}

- (BOOL)_dictationIsAllowed
{
  uint64_t v2 = _AFSupportPreferencesBoolValueForKey(@"Dictation Allowed");
  char v3 = _AFPreferencesBoolFromValueWithDefault(v2, @"Dictation Allowed", 1);

  return v3;
}

- (void)setDictationIsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  BOOL v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    __int16 v8 = "-[AFPreferences setDictationIsEnabled:]";
    __int16 v9 = 1024;
    BOOL v10 = v3;
    _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s %d", (uint8_t *)&v7, 0x12u);
  }
  int v6 = [[AFSettingsConnection alloc] initWithInstanceContext:self->_instanceContext];
  [(AFSettingsConnection *)v6 setDictationEnabled:v3];
  [(AFSettingsConnection *)v6 barrier];
}

- (void)setAssistantIsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  BOOL v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    __int16 v8 = "-[AFPreferences setAssistantIsEnabled:]";
    __int16 v9 = 1024;
    BOOL v10 = v3;
    _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s %d", (uint8_t *)&v7, 0x12u);
  }
  int v6 = [[AFSettingsConnection alloc] initWithInstanceContext:self->_instanceContext];
  [(AFSettingsConnection *)v6 setAssistantEnabled:v3];
  [(AFSettingsConnection *)v6 barrier];
}

- (void)_setDictationIsEnabledLocal:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  BOOL v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315394;
    uint64_t v11 = "-[AFPreferences _setDictationIsEnabledLocal:]";
    __int16 v12 = 1024;
    BOOL v13 = v3;
    _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s %d", (uint8_t *)&v10, 0x12u);
  }
  instanceContext = self->_instanceContext;
  int v7 = (void *)MEMORY[0x1E4F28ED0];
  __int16 v8 = instanceContext;
  __int16 v9 = [v7 numberWithBool:v3];
  _AFPreferencesSetValueForKeyWithContext(v9, @"Dictation Enabled", @"com.apple.assistant.support", v8);

  CFPreferencesSetAppValue(@"Dictation Enabled", v9, @"com.apple.UIKit");
}

- (void)_setAssistantIsEnabledLocal:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  BOOL v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315394;
    uint64_t v11 = "-[AFPreferences _setAssistantIsEnabledLocal:]";
    __int16 v12 = 1024;
    BOOL v13 = v3;
    _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s %d", (uint8_t *)&v10, 0x12u);
  }
  instanceContext = self->_instanceContext;
  int v7 = (void *)MEMORY[0x1E4F28ED0];
  __int16 v8 = instanceContext;
  __int16 v9 = [v7 numberWithBool:v3];
  _AFPreferencesSetValueForKeyWithContext(v9, @"Assistant Enabled", @"com.apple.assistant.support", v8);
}

- (void)setSpeechProfileExternalOfflineModelRootPath:(id)a3
{
}

- (id)speechProfileExternalOfflineModelRootPath
{
  uint64_t v2 = _AFPreferencesValueForKeyWithContext(@"Speech Profile External Offline Model Root Path", @"com.apple.assistant.support", self->_instanceContext);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v3 = v2;
  }
  else {
    BOOL v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (void)setOfflineDictationProfileOverridePath:(id)a3
{
}

- (id)offlineDictationProfileOverridePath
{
  uint64_t v2 = _AFPreferencesValueForKeyWithContext(@"Offline Dictation Profile Override Path", @"com.apple.assistant.support", self->_instanceContext);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v3 = v2;
  }
  else {
    BOOL v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (void)setOfflineDictationStatus:(id)a3
{
  _AFPreferencesSetValueForKeyWithContext(a3, @"Offline Dictation Status", @"com.apple.assistant.support", self->_instanceContext);
  CFPreferencesAppSynchronize(@"com.apple.assistant.support");
}

- (void)setOfflineDictationOverride:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (void *)MEMORY[0x1E4F28ED0];
  BOOL v5 = self->_instanceContext;
  id v6 = [v4 numberWithBool:v3];
  _AFPreferencesSetValueForKeyWithContext(v6, @"Enable Offline Dictation Override", @"com.apple.assistant.support", v5);
}

- (BOOL)offlineDictationOverride
{
  uint64_t v2 = _AFPreferencesValueForKeyWithContext(@"Enable Offline Dictation Override", @"com.apple.assistant.support", self->_instanceContext);
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setSmartLanguageSelection:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (void *)MEMORY[0x1E4F28ED0];
  BOOL v5 = self->_instanceContext;
  id v6 = [v4 numberWithBool:v3];
  _AFPreferencesSetValueForKeyWithContext(v6, @"Dictation SLS Enabled", @"com.apple.assistant.support", v5);
}

- (BOOL)isSmartLanguageSelectionEnabled
{
  uint64_t v2 = _AFPreferencesValueForKeyWithContext(@"Dictation SLS Enabled", @"com.apple.assistant.support", self->_instanceContext);
  BOOL v3 = v2;
  if (v2)
  {
    char v4 = [v2 BOOLValue];
  }
  else
  {
    if (AFDeviceHighestLanguageModelCapabilityIdentifier_onceToken != -1) {
      dispatch_once(&AFDeviceHighestLanguageModelCapabilityIdentifier_onceToken, &__block_literal_global_705);
    }
    char v4 = AFDeviceHighestLanguageModelCapabilityIdentifier_deviceHighestCapabilityIdentifier ^ 1;
  }

  return v4 & 1;
}

- (id)dictationSLSLanguagesEnabled
{
  uint64_t v2 = _AFPreferencesValueForKeyWithContext(@"Dictation SLS Languages Enabled", @"com.apple.assistant.support", self->_instanceContext);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v3 = v2;
  }
  else {
    BOOL v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (id)activeDictationLanguages
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = [(AFPreferences *)self enabledDictationLocales];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  BOOL v5 = objc_msgSend(v4, "allKeys", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        int v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v11 = [v4 objectForKey:v10];
        int v12 = [v11 BOOLValue];

        if (v12)
        {
          BOOL v13 = [v10 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];
          [v3 addObject:v13];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  return v3;
}

- (id)enabledDictationLocales
{
  uint64_t v2 = _AFPreferencesValueForKeyWithContext(@"DictationLanguagesEnabled", @"com.apple.keyboard.preferences", self->_instanceContext);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (BOOL)enableEuclidAlternatives
{
  return +[AFFeatureFlags isDictationEuclidAlternativesEnabled];
}

void __67__AFPreferences__registerForDictationEnablementChangeNotifications__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    BOOL v5 = "-[AFPreferences _registerForDictationEnablementChangeNotifications]_block_invoke";
    _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s Dictation Enablement Changed!", (uint8_t *)&v4, 0xCu);
  }
  [v2 _dictationEnablementDidChangeExternally];
}

void __67__AFPreferences__registerForAssistantEnablementChangeNotifications__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    BOOL v5 = "-[AFPreferences _registerForAssistantEnablementChangeNotifications]_block_invoke";
    _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s Assistant Enablement Changed!", (uint8_t *)&v4, 0xCu);
  }
  [v2 _assistantEnablementDidChangeExternally];
}

- (void)_registerForNanoPrefsChangeNotifications
{
  if ((atomic_exchange(&self->_registeredForNanoPrefs._Value, 1u) & 1) == 0)
  {
    [(AFPreferences *)self _registerForDarwinNotification:@"com.apple.assistant.nano.preferences.did_change" block:&__block_literal_global_1165];
    [(AFPreferences *)self _registerForDarwinNotification:@"com.apple.assistant.nano.preferences.did_change.internal" block:&__block_literal_global_1165];
  }
}

void __57__AFPreferences__registerForNanoPrefsChangeNotifications__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    BOOL v5 = "-[AFPreferences _registerForNanoPrefsChangeNotifications]_block_invoke";
    _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s Nano Prefs Changed!", (uint8_t *)&v4, 0xCu);
  }
  [v2 _nanoPrefsDidChangeExternally];
}

- (void)_registerForOutputVoice
{
  if ((atomic_exchange(&self->_registeredForOutputVoice._Value, 1u) & 1) == 0)
  {
    [(AFPreferences *)self _registerForInternalPrefs];
    [(AFPreferences *)self _registerForDarwinNotification:@"AFOutputLanguageDidChangeDarwinNotification" block:&__block_literal_global_1163];
  }
}

void __40__AFPreferences__registerForOutputVoice__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    BOOL v5 = "-[AFPreferences _registerForOutputVoice]_block_invoke";
    _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s Output Voice Changed!", (uint8_t *)&v4, 0xCu);
  }
  [v2 _outputVoiceDidChangeExternally];
}

void __60__AFPreferences__registerForLanguageCodeChangeNotifications__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    BOOL v5 = "-[AFPreferences _registerForLanguageCodeChangeNotifications]_block_invoke";
    _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s Language Code Changed!", (uint8_t *)&v4, 0xCu);
  }
  [v2 _languageCodeDidChangeExternally];
}

void __42__AFPreferences__registerForInternalPrefs__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    BOOL v5 = "-[AFPreferences _registerForInternalPrefs]_block_invoke";
    _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s Internal Preferences Changed!", (uint8_t *)&v4, 0xCu);
  }
  [v2 _internalPreferencesDidChangeExternally];
}

- (void)synchronize
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    instanceContext = self->_instanceContext;
    int v6 = 136315650;
    uint64_t v7 = "-[AFPreferences synchronize]";
    __int16 v8 = 2048;
    __int16 v9 = self;
    __int16 v10 = 2112;
    uint64_t v11 = instanceContext;
    _os_log_debug_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_DEBUG, "%s %p %@", (uint8_t *)&v6, 0x20u);
  }
  CFPreferencesAppSynchronize(@"com.apple.assistant.support");
  CFPreferencesAppSynchronize(@"com.apple.assistant");
  CFPreferencesAppSynchronize(@"com.apple.assistant.backedup");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"kAFPreferencesDidChangeDarwinNotification", 0, 0, 1u);
}

- (id)instanceContext
{
  return self->_instanceContext;
}

- (void)dealloc
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = self->_trampolineObservers;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v11 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        [(AFPreferencesNotificationCenter *)self->_trampoline removeObserver:*(void *)(*((void *)&v11 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v11 objects:v21 count:16];
    }
    while (v5);
  }

  __int16 v8 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    instanceContext = self->_instanceContext;
    *(_DWORD *)buf = 136315650;
    long long v16 = "-[AFPreferences dealloc]";
    __int16 v17 = 2048;
    long long v18 = self;
    __int16 v19 = 2112;
    uint64_t v20 = instanceContext;
    _os_log_debug_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_DEBUG, "%s %p %@", buf, 0x20u);
  }
  v10.receiver = self;
  v10.super_class = (Class)AFPreferences;
  [(AFPreferences *)&v10 dealloc];
}

- (AFPreferences)init
{
  return [(AFPreferences *)self initWithInstanceContext:0];
}

void __41__AFPreferences_initWithInstanceContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    uint64_t v5 = "-[AFPreferences initWithInstanceContext:]_block_invoke";
    _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s Preferences Changed!", (uint8_t *)&v4, 0xCu);
  }
  [v2 _preferencesDidChangeExternally];
}

- (id)description
{
  id v3 = [NSString alloc];
  v7.receiver = self;
  v7.super_class = (Class)AFPreferences;
  int v4 = [(AFPreferences *)&v7 description];
  uint64_t v5 = (void *)[v3 initWithFormat:@"%@ {instanceContext = %@}", v4, self->_instanceContext];

  return v5;
}

- (void)synchronizeAVVCPreferencesDomain
{
}

- (void)synchronizeLogPreferencesDomain
{
}

- (void)_dictationEnablementDidChangeExternally
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  CFPreferencesAppSynchronize(@"com.apple.assistant.support");
  id v3 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    instanceContext = self->_instanceContext;
    uint64_t v5 = v3;
    int v6 = 136315906;
    objc_super v7 = "-[AFPreferences _dictationEnablementDidChangeExternally]";
    __int16 v8 = 2048;
    __int16 v9 = self;
    __int16 v10 = 2112;
    long long v11 = instanceContext;
    __int16 v12 = 1024;
    BOOL v13 = [(AFPreferences *)self dictationIsEnabled];
    _os_log_debug_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_DEBUG, "%s %p %@ dictationIsEnabled = %d", (uint8_t *)&v6, 0x26u);
  }
}

- (void)_assistantEnablementDidChangeExternally
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  CFPreferencesAppSynchronize(@"com.apple.assistant.support");
  id v3 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    instanceContext = self->_instanceContext;
    uint64_t v5 = v3;
    int v6 = 136315906;
    objc_super v7 = "-[AFPreferences _assistantEnablementDidChangeExternally]";
    __int16 v8 = 2048;
    __int16 v9 = self;
    __int16 v10 = 2112;
    long long v11 = instanceContext;
    __int16 v12 = 1024;
    BOOL v13 = [(AFPreferences *)self assistantIsEnabled];
    _os_log_debug_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_DEBUG, "%s %p %@ assistantIsEnabled = %d", (uint8_t *)&v6, 0x26u);
  }
}

- (void)_nanoPrefsDidChangeExternally
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"AFNanoPreferencesDidChangeNotification" object:0];
}

- (void)_outputVoiceDidChangeExternally
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  CFPreferencesAppSynchronize(@"com.apple.assistant.backedup");
  id v3 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    instanceContext = self->_instanceContext;
    int v6 = v3;
    objc_super v7 = [(AFPreferences *)self outputVoice];
    int v8 = 136315906;
    __int16 v9 = "-[AFPreferences _outputVoiceDidChangeExternally]";
    __int16 v10 = 2048;
    long long v11 = self;
    __int16 v12 = 2112;
    BOOL v13 = instanceContext;
    __int16 v14 = 2112;
    long long v15 = v7;
    _os_log_debug_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_DEBUG, "%s %p %@ outputVoice = %@", (uint8_t *)&v8, 0x2Au);
  }
  int v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:@"AFOutputVoiceDidChangeNotification" object:0];
}

- (void)_languageCodeDidChangeExternally
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  CFPreferencesAppSynchronize(@"com.apple.assistant.backedup");
  id v3 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    instanceContext = self->_instanceContext;
    int v6 = v3;
    objc_super v7 = [(AFPreferences *)self languageCode];
    int v8 = 136315906;
    __int16 v9 = "-[AFPreferences _languageCodeDidChangeExternally]";
    __int16 v10 = 2048;
    long long v11 = self;
    __int16 v12 = 2112;
    BOOL v13 = instanceContext;
    __int16 v14 = 2112;
    long long v15 = v7;
    _os_log_debug_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_DEBUG, "%s %p %@ languageCode = %@", (uint8_t *)&v8, 0x2Au);
  }
  int v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:@"AFLanguageCodeDidChangeNotification" object:0];
}

- (void)_internalPreferencesDidChangeExternally
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    instanceContext = self->_instanceContext;
    int v5 = 136315650;
    int v6 = "-[AFPreferences _internalPreferencesDidChangeExternally]";
    __int16 v7 = 2048;
    int v8 = self;
    __int16 v9 = 2112;
    __int16 v10 = instanceContext;
    _os_log_debug_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_DEBUG, "%s %p %@", (uint8_t *)&v5, 0x20u);
  }
  CFPreferencesAppSynchronize(@"com.apple.assistant");
}

- (void)_preferencesDidChangeExternally
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    instanceContext = self->_instanceContext;
    int v6 = 136315650;
    __int16 v7 = "-[AFPreferences _preferencesDidChangeExternally]";
    __int16 v8 = 2048;
    __int16 v9 = self;
    __int16 v10 = 2112;
    uint64_t v11 = instanceContext;
    _os_log_debug_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_DEBUG, "%s %p %@", (uint8_t *)&v6, 0x20u);
  }
  CFPreferencesAppSynchronize(@"com.apple.assistant.support");
  CFPreferencesAppSynchronize(@"com.apple.assistant.backedup");
  CFPreferencesAppSynchronize(@"com.apple.assistant");
  int v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:@"AFPreferencesDidChangeNotification" object:self];
}

void __54__AFPreferences__registerForDarwinNotification_block___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id WeakRetained = v3;
  }
}

- (void)_AFSupportPreferencesSetValue:(id)a3 forKey:(id)a4
{
}

- (id)_AFSupportPreferencesValueForKey:(id)a3
{
  return _AFPreferencesValueForKeyWithContext((const __CFString *)a3, @"com.apple.assistant.support", 0);
}

@end