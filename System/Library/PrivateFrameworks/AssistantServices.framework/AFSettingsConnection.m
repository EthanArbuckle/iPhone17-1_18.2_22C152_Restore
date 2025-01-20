@interface AFSettingsConnection
+ (AFSettingsConnection)sharedInstance;
+ (void)initialize;
- (AFSettingsConnection)init;
- (AFSettingsConnection)initWithInstanceContext:(id)a3;
- (AFSettingsDelegate)_delegate;
- (BOOL)_shouldSetTurnIdentifierForRequest;
- (id)_connection;
- (id)_filterVoices:(id)a3 forLanguage:(id)a4;
- (id)_settingsServiceWithErrorHandler:(id)a3;
- (id)_synchronousSettingsServiceWithErrorHandler:(id)a3;
- (id)_voices;
- (id)accounts;
- (id)description;
- (void)_clearConnection;
- (void)_clearSyncNeededForKey:(id)a3;
- (void)_createRadarWithReason:(id)a3 room:(id)a4 process:(id)a5 crash:(BOOL)a6 completion:(id)a7;
- (void)_fetchPeerData:(id)a3;
- (void)_getSharedCompanionInfo:(id)a3;
- (void)_handleCommand:(id)a3 completion:(id)a4;
- (void)_isInactiveDeviceSyncDisabled:(id)a3;
- (void)_isInactiveDeviceSyncDisabledByTrial:(id)a3;
- (void)_readSyncTokenForAceHost:(id)a3 completion:(id)a4;
- (void)_runServiceMaintenance;
- (void)_sendSyncTokenToPersonalRequestsEnabledAccessoriesWithCompletion:(id)a3;
- (void)_setDelegate:(id)a3;
- (void)_setSyncNeededForReason:(id)a3;
- (void)_setSyncToken:(id)a3 forAceHost:(id)a4 completion:(id)a5;
- (void)_setSyncVerificationNeededAndFullReportNeeded:(BOOL)a3 shouldPostNotification:(BOOL)a4 completion:(id)a5;
- (void)_setVoices:(id)a3;
- (void)_syncDataWithAnchorKeys:(id)a3 forceReset:(BOOL)a4 reason:(id)a5 completion:(id)a6;
- (void)_tellDelegatePartialVerificationResult:(id)a3;
- (void)_tellDelegateServerVerificationReport:(id)a3;
- (void)_updateMultiUserInfoForUser:(id)a3 score:(id)a4 companionInfo:(id)a5 reset:(BOOL)a6 completion:(id)a7;
- (void)_updateVoicesIncludingAssetInfo:(BOOL)a3 completion:(id)a4;
- (void)accessRecordedAudioWithIdentifier:(id)a3 completion:(id)a4;
- (void)addMultiUserUser:(id)a3 sharedId:(id)a4 loggableSharedId:(id)a5 iCloudAltDSID:(id)a6 enrollmentName:(id)a7 isPrimary:(BOOL)a8 completion:(id)a9;
- (void)areSiriSAEAssetsAvailable:(id)a3;
- (void)areSiriUODAssetsAvailable:(id)a3;
- (void)availableLanguagesInTheHome:(id)a3;
- (void)barrier;
- (void)clearAnnounceNotificationsInCarPlayTemporarilyDisabled;
- (void)clearAnnounceNotificationsInCarPlayType;
- (void)clearMessageWithoutConfirmationEnabled;
- (void)clearMessageWithoutConfirmationHeadphonesEnabled;
- (void)clearMessageWithoutConfirmationInCarPlayEnabled;
- (void)clearOpportuneSpeakingEdgeDetectorSignalOverride;
- (void)clearShowAppsBehindSiriInCarPlayEnabled;
- (void)clearSpokenNotificationTemporarilyDisabledStatus;
- (void)configOverrides:(id)a3;
- (void)createOfflineSpeechProfileWithLanguage:(id)a3 modelOverridePath:(id)a4 JSONData:(id)a5 completion:(id)a6;
- (void)createRadarForCrashWithReason:(id)a3 process:(id)a4 completion:(id)a5;
- (void)currectNWActivityId:(id)a3;
- (void)dealloc;
- (void)deleteAccountWithIdentifier:(id)a3;
- (void)deleteSiriHistoryWithCompletion:(id)a3;
- (void)deleteSiriHistoryWithContext:(id)a3 withCompletion:(id)a4;
- (void)disableAndDeleteCloudSyncWithCompletion:(id)a3;
- (void)dismissUI;
- (void)dumpAssistantState:(id)a3;
- (void)fetchAccountsSynchronously:(BOOL)a3 completion:(id)a4;
- (void)fetchAccountsWithCompletion:(id)a3;
- (void)fetchActiveAccount:(id)a3;
- (void)fetchCurrentlyRoutedHeadphonesCBUUIDWithCompletion:(id)a3;
- (void)fetchEventRecordsFromAnalyticsStoreAtPath:(id)a3 completion:(id)a4;
- (void)fetchExperimentConfigurationsWithCompletion:(id)a3;
- (void)fetchExperimentContextWithCompletion:(id)a3;
- (void)fetchMultiUserVoiceIdentificationSetting:(id)a3;
- (void)fetchSharedUserIdentifier:(id)a3;
- (void)fetchSupportedLanguageCodes:(id)a3;
- (void)fetchSupportedMultiUserLanguageCodes:(id)a3;
- (void)forceMultiUserSync:(BOOL)a3 download:(BOOL)a4 completion:(id)a5;
- (void)getAccessoryInfoForAccessoryWithUUID:(id)a3 completionHandler:(id)a4;
- (void)getActiveASRLanguagesWithCompletion:(id)a3;
- (void)getAnnounceNotificationsInCarPlayTemporarilyDisabledWithCompletion:(id)a3;
- (void)getAnnounceNotificationsInCarPlayTypeWithCompletion:(id)a3;
- (void)getAnnounceNotificationsTemporarilyDisabledEndDateForApp:(id)a3 platform:(int64_t)a4 completion:(id)a5;
- (void)getAnnounceNotificationsTemporarilyDisabledEndDateForPlatform:(int64_t)a3 completion:(id)a4;
- (void)getAssetStatusForLanguage:(id)a3 completionHandler:(id)a4;
- (void)getAssistantIsEnabledForDeviceWithSiriInfo:(id)a3 withCompletion:(id)a4;
- (void)getAudioSessionCoordinationSnapshotWithCompletion:(id)a3;
- (void)getAvailableVoicesForLanguage:(id)a3 includeAssetInfo:(BOOL)a4 completion:(id)a5;
- (void)getAvailableVoicesForRecognitionLanguage:(id)a3 completion:(id)a4;
- (void)getAvailableVoicesForRecognitionLanguage:(id)a3 includeAssetInfo:(BOOL)a4 completion:(id)a5;
- (void)getAvailableVoicesForSynthesisLanguage:(id)a3 completion:(id)a4;
- (void)getBluetoothDeviceInfoWithAddress:(id)a3 completion:(id)a4;
- (void)getBluetoothDeviceInfoWithUID:(id)a3 completion:(id)a4;
- (void)getBluetoothWirelessSplitterSessionInfoWithCompletion:(id)a3;
- (void)getCapabilitiesDataFromReachableDevicesWithCompletion:(id)a3;
- (void)getConnectedBluetoothDeviceInfoArrayWithCompletion:(id)a3;
- (void)getContextCollectorsInfoWithCompletion:(id)a3;
- (void)getConversationAwarenessForCurrentlyRoutedDevice:(id)a3;
- (void)getCrossDeviceContextWithCompletion:(id)a3;
- (void)getCurrentAccessoryInfoWithCompletion:(id)a3;
- (void)getCurrentContextSnapshotWithCompletion:(id)a3;
- (void)getCurrentRequestIsWatchAuthenticatedWithCompletion:(id)a3;
- (void)getDevicesWithAvailablePHSAssetsForLanguage:(id)a3 completion:(id)a4;
- (void)getDevicesWithAvailablePHSAssetsOnDeviceCheck:(id)a3;
- (void)getExperimentForConfigurationIdentifier:(id)a3 completion:(id)a4;
- (void)getHeadGesturesForCurrentlyRoutedDevice:(id)a3;
- (void)getHomeUserIdForSharedUserId:(id)a3 completion:(id)a4;
- (void)getHorsemanSupplementalLanguageDictionary:(id)a3;
- (void)getInEarDetectionStateForBTAddress:(id)a3 withCompletion:(id)a4;
- (void)getManagedLocalAndRemotePeerInfoWithCompletion:(id)a3;
- (void)getMeCard:(id)a3;
- (void)getMessageWithoutConfirmationEnabledWithCompletion:(id)a3;
- (void)getMessageWithoutConfirmationHeadphonesEnabledWithCompletion:(id)a3;
- (void)getMessageWithoutConfirmationInCarPlayEnabledWithCompletion:(id)a3;
- (void)getMultiUserCompanionInfo:(id)a3;
- (void)getODDDeviceProperties:(id)a3;
- (void)getOfflineAssistantStatusWithCompletion:(id)a3;
- (void)getOfflineDictationStatusWithCompletion:(id)a3;
- (void)getOriginDeviceInfoForContextIdentifier:(id)a3 completion:(id)a4;
- (void)getPairedBluetoothDeviceInfoArrayWithCompletion:(id)a3;
- (void)getPeerIdentifiers:(id)a3;
- (void)getPersonalMultiUserDeviceIdentifiers:(id)a3;
- (void)getPersonalVolumeForCurrentlyRoutedDevice:(id)a3;
- (void)getProximityTuplesWithCompletion:(id)a3;
- (void)getRecordedAudioDirectoryPathsWithCompletion:(id)a3;
- (void)getSearchQueriesDataSharingStatus:(id)a3;
- (void)getSharedUserID:(id)a3;
- (void)getSharedUserIdForHomeUserId:(id)a3 completion:(id)a4;
- (void)getShowAppsBehindSiriInCarPlayEnabledWithCompletion:(id)a3;
- (void)getSidekickBoostsFileWithCompletion:(id)a3;
- (void)getSiriDataSharingOptInStatusWithCompletion:(id)a3;
- (void)getSiriOutputVolumeForAudioRoute:(id)a3 completion:(id)a4;
- (void)getSiriOutputVolumeWithCompletion:(id)a3;
- (void)getSpeakerCapabilityForAccessoryWithUUID:(id)a3 completionHandler:(id)a4;
- (void)getSpokenNotificationIsAlwaysOpportuneWithCompletion:(id)a3;
- (void)getSpokenNotificationShouldAnnounceAllNotificationsWithCompletion:(id)a3;
- (void)getSpokenNotificationShouldSkipTriggerlessRepliesWithCompletion:(id)a3;
- (void)getStereoPairState:(id)a3;
- (void)getStereoPartnerLastMyriadWinDate:(id)a3;
- (void)getSupplementalLanguageDictionaryForProduct:(id)a3 completion:(id)a4;
- (void)getSupplementalLanguagesDictionary:(id)a3;
- (void)getSupplementalLanguagesForProduct:(id)a3 forBuildVersion:(id)a4 completion:(id)a5;
- (void)getSupplementalLanguagesModificationDate:(id)a3;
- (void)getTrialEnables:(id)a3 doubleFactors:(id)a4 withCompletion:(id)a5;
- (void)hasEverSetLanguageCodeWithCompletion:(id)a3;
- (void)homeOnboardingFlowInvoked:(BOOL)a3 completion:(id)a4;
- (void)isJustSiriEnabledInTheHome:(id)a3;
- (void)isRecognizeMyVoiceAvailable:(id)a3;
- (void)isSearchDataSharingStatusForced:(id)a3;
- (void)isVoiceTriggerEnabled:(id)a3;
- (void)killDaemon;
- (void)multiUserCompanionDeviceIdentifiers:(id)a3;
- (void)postJSDiscoveryNotificationForBTDeviceWithInfo:(id)a3 withCompletion:(id)a4;
- (void)postTestResultCandidateWithRcId:(id)a3 recognitionSausage:(id)a4;
- (void)postTestResultSelectedWithRcId:(id)a3;
- (void)publishFeedbackArbitrationParticipation:(id)a3;
- (void)purgeAnalyticsStoreWithCompletion:(id)a3;
- (void)pushMyriadAdvertisementContext:(id)a3 completionHandler:(id)a4;
- (void)pushSCDAAdvertisementContext:(id)a3 completionHandler:(id)a4;
- (void)removeMultiUserUser:(id)a3 completion:(id)a4;
- (void)removeMultiUserWithSharedUserID:(id)a3 completion:(id)a4;
- (void)resetAnalyticsStoreWithCompletion:(id)a3;
- (void)resetExperimentForConfigurationIdentifier:(id)a3 completion:(id)a4;
- (void)resetProfileNames:(BOOL)a3 completion:(id)a4;
- (void)resetSessionsAtNextRequestBoundary;
- (void)saveAccount:(id)a3 setActive:(BOOL)a4;
- (void)sendMetricsToServerWithCompletion:(id)a3;
- (void)sendSampledAudioToServerWithCompletion:(id)a3;
- (void)setActiveAccountIdentifier:(id)a3;
- (void)setAllowJustSiriHomeKitSetting:(BOOL)a3 withCompletion:(id)a4;
- (void)setAnnounceNotificationsInCarPlayTemporarilyDisabled:(BOOL)a3;
- (void)setAnnounceNotificationsInCarPlayType:(int64_t)a3;
- (void)setAnnounceNotificationsOnBuiltInSpeakerEnabled:(BOOL)a3;
- (void)setAnnounceNotificationsOnHearingAidsEnabled:(BOOL)a3;
- (void)setAnnounceNotificationsOnHearingAidsSupported:(BOOL)a3;
- (void)setAnnounceNotificationsTemporarilyDisabledUntil:(id)a3 forApp:(id)a4 platform:(int64_t)a5;
- (void)setAnnounceNotificationsTemporarilyDisabledUntil:(id)a3 platform:(int64_t)a4;
- (void)setAssistantEnabled:(BOOL)a3;
- (void)setAssistantLoggingEnabled:(BOOL)a3;
- (void)setConfigOverrides:(id)a3 completion:(id)a4;
- (void)setConversationAwarenessForCurrentlyRoutedDevice:(BOOL)a3 withCompletion:(id)a4;
- (void)setDictationAutoPunctuationEnabled:(BOOL)a3;
- (void)setDictationEnabled:(BOOL)a3;
- (void)setHardcodedBluetoothProximity:(id)a3;
- (void)setHeadGesturesForCurrentlyRoutedDevice:(BOOL)a3 withCompletion:(id)a4;
- (void)setHorsemanSupplementalLanguageDictionary:(id)a3 completion:(id)a4;
- (void)setIsHomePodInHH2Mode:(BOOL)a3 completion:(id)a4;
- (void)setLanguage:(id)a3;
- (void)setLanguage:(id)a3 outputVoice:(id)a4;
- (void)setLanguage:(id)a3 outputVoice:(id)a4 withCompletion:(id)a5;
- (void)setLanguage:(id)a3 withCompletion:(id)a4;
- (void)setMessageWithoutConfirmationEnabled:(BOOL)a3;
- (void)setMessageWithoutConfirmationHeadphonesEnabled:(BOOL)a3;
- (void)setMessageWithoutConfirmationInCarPlayEnabled:(BOOL)a3;
- (void)setNanoAlwaysShowRecognizedSpeech:(BOOL)a3 withCompletion:(id)a4;
- (void)setNanoAssistantEnabled:(BOOL)a3 withCompletion:(id)a4;
- (void)setNanoCrownActivationEnabled:(BOOL)a3 withCompletion:(id)a4;
- (void)setNanoDictationAutoPunctuationEnabled:(BOOL)a3 withCompletion:(id)a4;
- (void)setNanoDictationEnabled:(BOOL)a3 withCompletion:(id)a4;
- (void)setNanoLanguage:(id)a3 withCompletion:(id)a4;
- (void)setNanoMessageWithoutConfirmationEnabled:(BOOL)a3 withCompletion:(id)a4;
- (void)setNanoOutputVoice:(id)a3 withCompletion:(id)a4;
- (void)setNanoPhraseSpotterEnabled:(BOOL)a3 withCompletion:(id)a4;
- (void)setNanoRaiseToSpeakEnabled:(BOOL)a3 withCompletion:(id)a4;
- (void)setNanoSiriResponseShouldAlwaysPrint:(BOOL)a3 withCompletion:(id)a4;
- (void)setNanoTTSSpeakerVolume:(id)a3 withCompletion:(id)a4;
- (void)setNanoUseDeviceSpeakerForTTS:(id)a3 withCompletion:(id)a4;
- (void)setOfflineDictationProfileOverridePath:(id)a3 completion:(id)a4;
- (void)setOnDeviceDictationAvailableAlertPresented:(BOOL)a3;
- (void)setOpportuneSpeakingEdgeDetectorSignalOverride:(int64_t)a3;
- (void)setOutputVoice:(id)a3;
- (void)setOutputVoice:(id)a3 withCompletion:(id)a4;
- (void)setPersonalVolumeForCurrentlyRoutedDevice:(BOOL)a3 withCompletion:(id)a4;
- (void)setRecognizeMyVoiceEnabled:(BOOL)a3;
- (void)setSearchQueriesDataSharingStatus:(int64_t)a3 completion:(id)a4;
- (void)setShowAppsBehindSiriInCarPlayEnabled:(BOOL)a3;
- (void)setSiriDataSharingHomePodSetupDeviceIsValid:(BOOL)a3 completion:(id)a4;
- (void)setSiriDataSharingOptInAlertPresented:(BOOL)a3 completion:(id)a4;
- (void)setSiriDataSharingOptInStatus:(int64_t)a3 completion:(id)a4;
- (void)setSiriDataSharingOptInStatus:(int64_t)a3 propagateToHomeAccessories:(BOOL)a4 source:(int64_t)a5 reason:(id)a6 completion:(id)a7;
- (void)setSiriDesignModeEnabled:(BOOL)a3 completion:(id)a4;
- (void)setSiriGradingEnabled:(BOOL)a3 completion:(id)a4;
- (void)setSiriOutputVolume:(float)a3 completion:(id)a4;
- (void)setSiriOutputVolume:(float)a3 forAudioRoute:(id)a4 completion:(id)a5;
- (void)setSpeechProfileExternalOfflineModelRootPath:(id)a3 completion:(id)a4;
- (void)setSpokenNotificationIsAlwaysOpportune:(BOOL)a3;
- (void)setSpokenNotificationProxCardSeen:(BOOL)a3;
- (void)setSpokenNotificationShouldAnnounceAllNotifications:(BOOL)a3;
- (void)setSpokenNotificationShouldSkipTriggerlessReplies:(BOOL)a3;
- (void)setSupplementalLanguageDictionary:(id)a3 forProduct:(id)a4 completion:(id)a5;
- (void)setSupplementalLanguages:(id)a3 forProduct:(id)a4 forBuildVersion:(id)a5 completion:(id)a6;
- (void)setVoiceTriggerEnabled:(BOOL)a3 withCompletion:(id)a4;
- (void)setXPCConnectionManagementQueue:(id)a3;
- (void)shouldSuppressSiriDataSharingOptInAlert:(id)a3;
- (void)showHomeProfileNamesWithCompletion:(id)a3;
- (void)showLocalProfileNamesWithCompletion:(id)a3;
- (void)showMultiUserCompanionInfo:(id)a3;
- (void)showMultiUserSharedUserIDsCompletion:(id)a3;
- (void)showMultiUsers:(id)a3;
- (void)showPrimaryUserSharedUserIDWithCompletion:(id)a3;
- (void)shutdownSessionIfIdle;
- (void)siriDesignModeIsEnabled:(id)a3;
- (void)siriGradingIsEnabled:(id)a3;
- (void)startAudioPlaybackRequest:(id)a3 options:(unint64_t)a4 completion:(id)a5;
- (void)startMultiUserUIRequestWithText:(id)a3 expectedSpeakerSharedUserID:(id)a4 expectedSpeakerConfidenceScore:(unint64_t)a5 nonspeakerConfidenceScores:(id)a6 completion:(id)a7;
- (void)startObservingBluetoothInEarDetectionStateForBTAddress:(id)a3 forObserverID:(unint64_t)a4;
- (void)startObservingWirelessSplitterSession;
- (void)startRemoteRequest:(id)a3 onPeer:(id)a4 completion:(id)a5;
- (void)startUIMockServerRequestWithReplayFileURL:(id)a3 completion:(id)a4;
- (void)startUIRequest:(id)a3;
- (void)startUIRequestWithInfo:(id)a3;
- (void)startUIRequestWithInfo:(id)a3 completion:(id)a4;
- (void)startUIRequestWithSpeechAudioFileURL:(id)a3;
- (void)startUIRequestWithText:(id)a3;
- (void)startUIRequestWithText:(id)a3 completion:(id)a4;
- (void)stopAllAudioPlaybackRequests:(BOOL)a3;
- (void)stopAudioPlaybackRequest:(id)a3 immediately:(BOOL)a4;
- (void)stopObservingBluetoothInEarDetectionStateForObserverID:(unint64_t)a3;
- (void)stopObservingWirelessSplitterSession;
- (void)suppressLowStorageNotificationForLanguage:(id)a3 suppress:(BOOL)a4;
- (void)synchronizeExperimentConfigurationsIfApplicableWithCompletion:(id)a3;
- (void)triggerABCForType:(id)a3 subType:(id)a4 context:(id)a5 completionHandler:(id)a6;
- (void)trimRecordedAudioWithIdentifier:(id)a3 offset:(double)a4 duration:(double)a5 outputFileType:(int64_t)a6 completion:(id)a7;
- (void)updateAnnounceNotificationsOnHearingAidSupportedStatus;
@end

@implementation AFSettingsConnection

- (AFSettingsConnection)init
{
  return [(AFSettingsConnection *)self initWithInstanceContext:0];
}

- (void)fetchSupportedMultiUserLanguageCodes:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    AFPreferencesSupportedMultiUserLanguages();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id, void))a3 + 2))(v4, v5, 0);
  }
}

+ (void)initialize
{
  if (AFLogInitIfNeeded_once != -1) {
    dispatch_once(&AFLogInitIfNeeded_once, &__block_literal_global_2935);
  }
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v6 = "-[AFSettingsConnection dealloc]";
    __int16 v7 = 2048;
    v8 = self;
    _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s %p", buf, 0x16u);
  }
  [(AFSettingsConnection *)self _clearConnection];
  v4.receiver = self;
  v4.super_class = (Class)AFSettingsConnection;
  [(AFSettingsConnection *)&v4 dealloc];
}

- (void)_clearConnection
{
  [(NSXPCConnection *)self->_connection invalidate];
  connection = self->_connection;
  self->_connection = 0;

  if (objc_opt_respondsToSelector())
  {
    delegate = self->_delegate;
    [(AFSettingsDelegate *)delegate _settingsConnectionDidDisconnect];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instanceContext, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_selectedVoice, 0);
  objc_storeStrong((id *)&self->_voices, 0);
  objc_storeStrong((id *)&self->_voicesQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (AFSettingsConnection)initWithInstanceContext:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AFSettingsConnection;
  v6 = [(AFSettingsConnection *)&v12 init];
  if (v6)
  {
    __int16 v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("SettingsVoices", v7);
    voicesQueue = v6->_voicesQueue;
    v6->_voicesQueue = (OS_dispatch_queue *)v8;

    objc_storeStrong((id *)&v6->_serialQueue, MEMORY[0x1E4F14428]);
    objc_storeStrong((id *)&v6->_instanceContext, a3);
    v10 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[AFSettingsConnection initWithInstanceContext:]";
      __int16 v15 = 2048;
      v16 = v6;
      _os_log_impl(&dword_19CF1D000, v10, OS_LOG_TYPE_INFO, "%s %p", buf, 0x16u);
    }
  }

  return v6;
}

- (void)getODDDeviceProperties:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__AFSettingsConnection_getODDDeviceProperties___block_invoke;
  v7[3] = &unk_1E592B9A0;
  id v8 = v4;
  id v5 = v4;
  v6 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v7];
  [v6 getODDDeviceProperties:v5];
}

uint64_t __47__AFSettingsConnection_getODDDeviceProperties___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)createRadarForCrashWithReason:(id)a3 process:(id)a4 completion:(id)a5
{
}

- (void)_createRadarWithReason:(id)a3 room:(id)a4 process:(id)a5 crash:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  v13 = (__CFString *)a4;
  id v14 = a5;
  id v15 = a7;
  v16 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    uint64_t v17 = @"entire home";
    *(_DWORD *)buf = 136315650;
    v31 = "-[AFSettingsConnection _createRadarWithReason:room:process:crash:completion:]";
    __int16 v32 = 2112;
    if (v13) {
      uint64_t v17 = v13;
    }
    v33 = v17;
    __int16 v34 = 2112;
    id v35 = v12;
    _os_log_impl(&dword_19CF1D000, v16, OS_LOG_TYPE_INFO, "%s Filing a radar in %@ with reason %@", buf, 0x20u);
  }
  v18 = self;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __77__AFSettingsConnection__createRadarWithReason_room_process_crash_completion___block_invoke;
  v27[3] = &unk_1E5929680;
  id v19 = v15;
  id v29 = v19;
  v20 = v18;
  v28 = v20;
  v21 = (void (**)(void, void))MEMORY[0x19F3A50D0](v27);
  v22 = [(AFSettingsConnection *)v20 _settingsServiceWithErrorHandler:v21];
  if (!v22)
  {
    v24 = @"Not an internal build";
LABEL_10:
    v23 = +[AFError errorWithCode:1010 description:v24];
    ((void (**)(void, void *))v21)[2](v21, v23);
    goto LABEL_11;
  }
  if (!v8)
  {
    v24 = @"Not a supported configuration";
    goto LABEL_10;
  }
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __77__AFSettingsConnection__createRadarWithReason_room_process_crash_completion___block_invoke_240;
  v25[3] = &unk_1E592B9A0;
  v26 = v21;
  [v22 createRadarForCrashWithReason:v12 process:v14 completion:v25];
  v23 = v26;
LABEL_11:
}

void __77__AFSettingsConnection__createRadarWithReason_room_process_crash_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = AFSiriLogContextConnection;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315394;
      __int16 v7 = "-[AFSettingsConnection _createRadarWithReason:room:process:crash:completion:]_block_invoke";
      __int16 v8 = 2112;
      id v9 = v3;
      _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s Failed to file a radar - error: %@", (uint8_t *)&v6, 0x16u);
    }
  }
  else if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    __int16 v7 = "-[AFSettingsConnection _createRadarWithReason:room:process:crash:completion:]_block_invoke";
    _os_log_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_INFO, "%s Radar is filed", (uint8_t *)&v6, 0xCu);
  }
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

uint64_t __77__AFSettingsConnection__createRadarWithReason_room_process_crash_completion___block_invoke_240(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getActiveASRLanguagesWithCompletion:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__AFSettingsConnection_getActiveASRLanguagesWithCompletion___block_invoke;
  v7[3] = &unk_1E592B9A0;
  id v8 = v4;
  id v5 = v4;
  int v6 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v7];
  [v6 getCurrentActiveLanguageCodesWithCompletion:v5];
}

void __60__AFSettingsConnection_getActiveASRLanguagesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    __int16 v7 = "-[AFSettingsConnection getActiveASRLanguagesWithCompletion:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)getAssistantIsEnabledForDeviceWithSiriInfo:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __82__AFSettingsConnection_getAssistantIsEnabledForDeviceWithSiriInfo_withCompletion___block_invoke;
  v10[3] = &unk_1E592B9A0;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  id v9 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v10];
  [v9 getAssistantIsEnabledForDeviceWithSiriInfo:v8 withCompletion:v7];
}

void __82__AFSettingsConnection_getAssistantIsEnabledForDeviceWithSiriInfo_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    id v7 = "-[AFSettingsConnection getAssistantIsEnabledForDeviceWithSiriInfo:withCompletion:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)triggerABCForType:(id)a3 subType:(id)a4 context:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __76__AFSettingsConnection_triggerABCForType_subType_context_completionHandler___block_invoke;
  v16[3] = &unk_1E592B9A0;
  id v17 = v10;
  id v11 = v10;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v16];
  [v15 triggerABCForType:v14 subType:v13 context:v12 completionHandler:v11];
}

void __76__AFSettingsConnection_triggerABCForType_subType_context_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    id v7 = "-[AFSettingsConnection triggerABCForType:subType:context:completionHandler:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)getSidekickBoostsFileWithCompletion:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__AFSettingsConnection_getSidekickBoostsFileWithCompletion___block_invoke;
  v7[3] = &unk_1E592B9A0;
  id v8 = v4;
  id v5 = v4;
  int v6 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v7];
  [v6 getSidekickBoostsFileWithCompletion:v5];
}

void __60__AFSettingsConnection_getSidekickBoostsFileWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    id v7 = "-[AFSettingsConnection getSidekickBoostsFileWithCompletion:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)getTrialEnables:(id)a3 doubleFactors:(id)a4 withCompletion:(id)a5
{
  id v8 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __69__AFSettingsConnection_getTrialEnables_doubleFactors_withCompletion___block_invoke;
  v13[3] = &unk_1E592B9A0;
  id v14 = v8;
  id v9 = v8;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v13];
  [v12 getTrialEnables:v11 doubleFactors:v10 withCompletion:v9];
}

void __69__AFSettingsConnection_getTrialEnables_doubleFactors_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    id v7 = "-[AFSettingsConnection getTrialEnables:doubleFactors:withCompletion:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, void, id))(v5 + 16))(v5, 0, 0, v3);
  }
}

- (void)getAccessoryInfoForAccessoryWithUUID:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __79__AFSettingsConnection_getAccessoryInfoForAccessoryWithUUID_completionHandler___block_invoke;
  v10[3] = &unk_1E592B9A0;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  id v9 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v10];
  [v9 getAccessoryInfoForAccessoryWithUUID:v8 completionHandler:v7];
}

void __79__AFSettingsConnection_getAccessoryInfoForAccessoryWithUUID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    id v7 = "-[AFSettingsConnection getAccessoryInfoForAccessoryWithUUID:completionHandler:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, void, id))(v5 + 16))(v5, 0, 0, v3);
  }
}

- (void)getSpeakerCapabilityForAccessoryWithUUID:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __83__AFSettingsConnection_getSpeakerCapabilityForAccessoryWithUUID_completionHandler___block_invoke;
  v10[3] = &unk_1E592B9A0;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  id v9 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v10];
  [v9 getSpeakerCapabilityForAccessoryWithUUID:v8 completionHandler:v7];
}

void __83__AFSettingsConnection_getSpeakerCapabilityForAccessoryWithUUID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    id v7 = "-[AFSettingsConnection getSpeakerCapabilityForAccessoryWithUUID:completionHandler:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)pushSCDAAdvertisementContext:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __71__AFSettingsConnection_pushSCDAAdvertisementContext_completionHandler___block_invoke;
  v10[3] = &unk_1E592B9A0;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  id v9 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v10];
  [v9 pushSCDAAdvertisementContext:v8 completionHandler:v7];
}

void __71__AFSettingsConnection_pushSCDAAdvertisementContext_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    id v7 = "-[AFSettingsConnection pushSCDAAdvertisementContext:completionHandler:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)pushMyriadAdvertisementContext:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __73__AFSettingsConnection_pushMyriadAdvertisementContext_completionHandler___block_invoke;
  v10[3] = &unk_1E592B9A0;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  id v9 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v10];
  [v9 pushMyriadAdvertisementContext:v8 completionHandler:v7];
}

void __73__AFSettingsConnection_pushMyriadAdvertisementContext_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    id v7 = "-[AFSettingsConnection pushMyriadAdvertisementContext:completionHandler:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)getCurrentRequestIsWatchAuthenticatedWithCompletion:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __76__AFSettingsConnection_getCurrentRequestIsWatchAuthenticatedWithCompletion___block_invoke;
  v7[3] = &unk_1E592B9A0;
  id v8 = v4;
  id v5 = v4;
  int v6 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v7];
  [v6 getCurrentRequestIsWatchAuthenticatedWithCompletion:v5];
}

void __76__AFSettingsConnection_getCurrentRequestIsWatchAuthenticatedWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    id v7 = "-[AFSettingsConnection getCurrentRequestIsWatchAuthenticatedWithCompletion:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
  }
}

- (void)getAssetStatusForLanguage:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68__AFSettingsConnection_getAssetStatusForLanguage_completionHandler___block_invoke;
  v10[3] = &unk_1E592B9A0;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  id v9 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v10];
  [v9 getAssetStatusForLanguage:v8 completionHandler:v7];
}

void __68__AFSettingsConnection_getAssetStatusForLanguage_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    id v7 = "-[AFSettingsConnection getAssetStatusForLanguage:completionHandler:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
  }
}

- (void)fetchSharedUserIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __50__AFSettingsConnection_fetchSharedUserIdentifier___block_invoke;
    v10[3] = &unk_1E592B9A0;
    id v6 = v4;
    id v11 = v6;
    id v7 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v10];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __50__AFSettingsConnection_fetchSharedUserIdentifier___block_invoke_2;
    v8[3] = &unk_1E5928588;
    id v9 = v6;
    [v7 fetchSharedUserIdentifier:v8];
  }
}

uint64_t __50__AFSettingsConnection_fetchSharedUserIdentifier___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __50__AFSettingsConnection_fetchSharedUserIdentifier___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)dumpAssistantState:(id)a3
{
  id v4 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __43__AFSettingsConnection_dumpAssistantState___block_invoke;
  v10[3] = &unk_1E592B9A0;
  id v5 = v4;
  id v11 = v5;
  id v6 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v10];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__AFSettingsConnection_dumpAssistantState___block_invoke_231;
  v8[3] = &unk_1E59283A8;
  id v9 = v5;
  id v7 = v5;
  [v6 dumpAssistantState:v8];
}

void __43__AFSettingsConnection_dumpAssistantState___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    id v7 = "-[AFSettingsConnection dumpAssistantState:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

uint64_t __43__AFSettingsConnection_dumpAssistantState___block_invoke_231(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, a2, 0);
  }
  return result;
}

- (void)areSiriSAEAssetsAvailable:(id)a3
{
  id v4 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __50__AFSettingsConnection_areSiriSAEAssetsAvailable___block_invoke;
  v10[3] = &unk_1E592B9A0;
  id v5 = v4;
  id v11 = v5;
  int v6 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v10];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50__AFSettingsConnection_areSiriSAEAssetsAvailable___block_invoke_230;
  v8[3] = &unk_1E59283D0;
  id v9 = v5;
  id v7 = v5;
  [v6 areSiriSAEAssetsAvailable:v8];
}

void __50__AFSettingsConnection_areSiriSAEAssetsAvailable___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    id v7 = "-[AFSettingsConnection areSiriSAEAssetsAvailable:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

uint64_t __50__AFSettingsConnection_areSiriSAEAssetsAvailable___block_invoke_230(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)areSiriUODAssetsAvailable:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__AFSettingsConnection_areSiriUODAssetsAvailable___block_invoke;
  v7[3] = &unk_1E592B9A0;
  id v8 = v4;
  id v5 = v4;
  int v6 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v7];
  [v6 areSiriUODAssetsAvailable:v5];
}

void __50__AFSettingsConnection_areSiriUODAssetsAvailable___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    id v7 = "-[AFSettingsConnection areSiriUODAssetsAvailable:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)hasEverSetLanguageCodeWithCompletion:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__AFSettingsConnection_hasEverSetLanguageCodeWithCompletion___block_invoke;
  v7[3] = &unk_1E592B9A0;
  id v8 = v4;
  id v5 = v4;
  int v6 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v7];
  [v6 hasEverSetLanguageCodeWithCompletion:v5];
}

void __61__AFSettingsConnection_hasEverSetLanguageCodeWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    id v7 = "-[AFSettingsConnection hasEverSetLanguageCodeWithCompletion:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)getRecordedAudioDirectoryPathsWithCompletion:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__AFSettingsConnection_getRecordedAudioDirectoryPathsWithCompletion___block_invoke;
  v7[3] = &unk_1E592B9A0;
  id v8 = v4;
  id v5 = v4;
  int v6 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v7];
  [v6 getRecordedAudioDirectoryPathsWithCompletion:v5];
}

void __69__AFSettingsConnection_getRecordedAudioDirectoryPathsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    id v7 = "-[AFSettingsConnection getRecordedAudioDirectoryPathsWithCompletion:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)trimRecordedAudioWithIdentifier:(id)a3 offset:(double)a4 duration:(double)a5 outputFileType:(int64_t)a6 completion:(id)a7
{
  id v12 = a7;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __98__AFSettingsConnection_trimRecordedAudioWithIdentifier_offset_duration_outputFileType_completion___block_invoke;
  v16[3] = &unk_1E592B9A0;
  id v17 = v12;
  id v13 = v12;
  id v14 = a3;
  id v15 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v16];
  [v15 trimRecordedAudioWithIdentifier:v14 offset:a6 duration:v13 outputFileType:a4 completion:a5];
}

void __98__AFSettingsConnection_trimRecordedAudioWithIdentifier_offset_duration_outputFileType_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    id v7 = "-[AFSettingsConnection trimRecordedAudioWithIdentifier:offset:duration:outputFileType:completion:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)accessRecordedAudioWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __69__AFSettingsConnection_accessRecordedAudioWithIdentifier_completion___block_invoke;
  v10[3] = &unk_1E592B9A0;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  id v9 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v10];
  [v9 accessRecordedAudioWithIdentifier:v8 completion:v7];
}

void __69__AFSettingsConnection_accessRecordedAudioWithIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    id v7 = "-[AFSettingsConnection accessRecordedAudioWithIdentifier:completion:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)resetExperimentForConfigurationIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __77__AFSettingsConnection_resetExperimentForConfigurationIdentifier_completion___block_invoke;
  v10[3] = &unk_1E592B9A0;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  id v9 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v10];
  [v9 resetExperimentForConfigurationIdentifier:v8 completion:v7];
}

void __77__AFSettingsConnection_resetExperimentForConfigurationIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    id v7 = "-[AFSettingsConnection resetExperimentForConfigurationIdentifier:completion:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)synchronizeExperimentConfigurationsIfApplicableWithCompletion:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __86__AFSettingsConnection_synchronizeExperimentConfigurationsIfApplicableWithCompletion___block_invoke;
  v7[3] = &unk_1E592B9A0;
  id v8 = v4;
  id v5 = v4;
  int v6 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v7];
  [v6 synchronizeExperimentConfigurationsIfApplicableWithCompletion:v5];
}

void __86__AFSettingsConnection_synchronizeExperimentConfigurationsIfApplicableWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    id v7 = "-[AFSettingsConnection synchronizeExperimentConfigurationsIfApplicableWithCompletion:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)getExperimentForConfigurationIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __75__AFSettingsConnection_getExperimentForConfigurationIdentifier_completion___block_invoke;
  v10[3] = &unk_1E592B9A0;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  id v9 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v10];
  [v9 getExperimentForConfigurationIdentifier:v8 completion:v7];
}

void __75__AFSettingsConnection_getExperimentForConfigurationIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    id v7 = "-[AFSettingsConnection getExperimentForConfigurationIdentifier:completion:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)getProximityTuplesWithCompletion:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__AFSettingsConnection_getProximityTuplesWithCompletion___block_invoke;
  v7[3] = &unk_1E592B9A0;
  id v8 = v4;
  id v5 = v4;
  int v6 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v7];
  [v6 getProximityTuplesWithCompletion:v5];
}

void __57__AFSettingsConnection_getProximityTuplesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    id v7 = "-[AFSettingsConnection getProximityTuplesWithCompletion:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
  }
}

- (void)getCapabilitiesDataFromReachableDevicesWithCompletion:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __78__AFSettingsConnection_getCapabilitiesDataFromReachableDevicesWithCompletion___block_invoke;
  v7[3] = &unk_1E592B9A0;
  id v8 = v4;
  id v5 = v4;
  int v6 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v7];
  [v6 getCapabilitiesDataFromReachableDevicesWithCompletion:v5];
}

void __78__AFSettingsConnection_getCapabilitiesDataFromReachableDevicesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    id v7 = "-[AFSettingsConnection getCapabilitiesDataFromReachableDevicesWithCompletion:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
  }
}

- (void)getManagedLocalAndRemotePeerInfoWithCompletion:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__AFSettingsConnection_getManagedLocalAndRemotePeerInfoWithCompletion___block_invoke;
  v7[3] = &unk_1E592B9A0;
  id v8 = v4;
  id v5 = v4;
  int v6 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v7];
  [v6 getManagedLocalAndRemotePeerInfoWithCompletion:v5];
}

void __71__AFSettingsConnection_getManagedLocalAndRemotePeerInfoWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    id v7 = "-[AFSettingsConnection getManagedLocalAndRemotePeerInfoWithCompletion:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, void))(v5 + 16))(v5, 0, 0);
  }
}

- (void)setHardcodedBluetoothProximity:(id)a3
{
  id v4 = a3;
  id v5 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:&__block_literal_global_229];
  [v5 setHardcodedBluetoothProximity:v4];
}

void __55__AFSettingsConnection_setHardcodedBluetoothProximity___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    id v5 = "-[AFSettingsConnection setHardcodedBluetoothProximity:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)getContextCollectorsInfoWithCompletion:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__AFSettingsConnection_getContextCollectorsInfoWithCompletion___block_invoke;
  v7[3] = &unk_1E592B9A0;
  id v8 = v4;
  id v5 = v4;
  __int16 v6 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v7];
  [v6 getContextCollectorsInfoWithCompletion:v5];
}

void __63__AFSettingsConnection_getContextCollectorsInfoWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    id v7 = "-[AFSettingsConnection getContextCollectorsInfoWithCompletion:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, void))(v5 + 16))(v5, 0, 0);
  }
}

- (void)getOriginDeviceInfoForContextIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __75__AFSettingsConnection_getOriginDeviceInfoForContextIdentifier_completion___block_invoke;
  v10[3] = &unk_1E592B9A0;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  id v9 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v10];
  [v9 getOriginDeviceInfoForContextIdentifier:v8 completion:v7];
}

void __75__AFSettingsConnection_getOriginDeviceInfoForContextIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    id v7 = "-[AFSettingsConnection getOriginDeviceInfoForContextIdentifier:completion:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
  }
}

- (void)getCurrentContextSnapshotWithCompletion:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__AFSettingsConnection_getCurrentContextSnapshotWithCompletion___block_invoke;
  v7[3] = &unk_1E592B9A0;
  id v8 = v4;
  id v5 = v4;
  int v6 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v7];
  [v6 getCurrentContextSnapshotWithCompletion:v5];
}

void __64__AFSettingsConnection_getCurrentContextSnapshotWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    id v7 = "-[AFSettingsConnection getCurrentContextSnapshotWithCompletion:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
  }
}

- (void)getCrossDeviceContextWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __60__AFSettingsConnection_getCrossDeviceContextWithCompletion___block_invoke;
    v8[3] = &unk_1E592B9A0;
    id v6 = v4;
    id v9 = v6;
    id v7 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v8];
    [v7 getCrossDeviceContextWithCompletion:v6];
  }
}

void __60__AFSettingsConnection_getCrossDeviceContextWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    id v7 = "-[AFSettingsConnection getCrossDeviceContextWithCompletion:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
  }
}

- (void)isSearchDataSharingStatusForced:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v13 = "-[AFSettingsConnection isSearchDataSharingStatusForced:]";
    _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s Checking if Search Queries Data Sharing status is configured by profile", buf, 0xCu);
  }
  if (v4)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __56__AFSettingsConnection_isSearchDataSharingStatusForced___block_invoke;
    v10[3] = &unk_1E592B9A0;
    id v6 = v4;
    id v11 = v6;
    id v7 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v10];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __56__AFSettingsConnection_isSearchDataSharingStatusForced___block_invoke_227;
    v8[3] = &unk_1E59283D0;
    id v9 = v6;
    [v7 isSearchDataSharingStatusForced:v8];
  }
}

void __56__AFSettingsConnection_isSearchDataSharingStatusForced___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    id v7 = "-[AFSettingsConnection isSearchDataSharingStatusForced:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id, void))(v5 + 16))(v5, v3, 0);
  }
}

uint64_t __56__AFSettingsConnection_isSearchDataSharingStatusForced___block_invoke_227(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)getSearchQueriesDataSharingStatus:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v13 = "-[AFSettingsConnection getSearchQueriesDataSharingStatus:]";
    _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s Getting Search Queries Data Sharing", buf, 0xCu);
  }
  if (v4)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __58__AFSettingsConnection_getSearchQueriesDataSharingStatus___block_invoke;
    v10[3] = &unk_1E592B9A0;
    id v6 = v4;
    id v11 = v6;
    id v7 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v10];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __58__AFSettingsConnection_getSearchQueriesDataSharingStatus___block_invoke_226;
    v8[3] = &unk_1E5928560;
    id v9 = v6;
    [v7 getSearchQueriesDataSharingStatus:v8];
  }
}

void __58__AFSettingsConnection_getSearchQueriesDataSharingStatus___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    id v7 = "-[AFSettingsConnection getSearchQueriesDataSharingStatus:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id, uint64_t))(v5 + 16))(v5, v3, 2);
  }
}

uint64_t __58__AFSettingsConnection_getSearchQueriesDataSharingStatus___block_invoke_226(uint64_t a1, unint64_t a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = v4;
    if (a2 > 2) {
      int v6 = @"(unknown)";
    }
    else {
      int v6 = off_1E592A1C8[a2];
    }
    id v7 = v6;
    int v9 = 136315395;
    uint64_t v10 = "-[AFSettingsConnection getSearchQueriesDataSharingStatus:]_block_invoke";
    __int16 v11 = 2113;
    id v12 = v7;
    _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s optin status = %{private}@", (uint8_t *)&v9, 0x16u);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, unint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)setSearchQueriesDataSharingStatus:(int64_t)a3 completion:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    __int16 v8 = v7;
    if ((unint64_t)a3 > 2) {
      int v9 = @"(unknown)";
    }
    else {
      int v9 = off_1E592A1C8[a3];
    }
    uint64_t v10 = v9;
    *(_DWORD *)buf = 136315395;
    id v19 = "-[AFSettingsConnection setSearchQueriesDataSharingStatus:completion:]";
    __int16 v20 = 2113;
    v21 = v10;
    _os_log_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_INFO, "%s Setting Search Queries Data Sharing option to = %{private}@", buf, 0x16u);
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __69__AFSettingsConnection_setSearchQueriesDataSharingStatus_completion___block_invoke;
  v16[3] = &unk_1E592B9A0;
  id v11 = v6;
  id v17 = v11;
  id v12 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v16];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __69__AFSettingsConnection_setSearchQueriesDataSharingStatus_completion___block_invoke_225;
  v14[3] = &unk_1E592C360;
  id v15 = v11;
  id v13 = v11;
  [v12 setSearchQueriesDataSharingStatus:a3 completion:v14];
}

void __69__AFSettingsConnection_setSearchQueriesDataSharingStatus_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    id v7 = "-[AFSettingsConnection setSearchQueriesDataSharingStatus:completion:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

uint64_t __69__AFSettingsConnection_setSearchQueriesDataSharingStatus_completion___block_invoke_225(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (void)siriDesignModeIsEnabled:(id)a3
{
  id v4 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __48__AFSettingsConnection_siriDesignModeIsEnabled___block_invoke;
  v10[3] = &unk_1E592B9A0;
  id v5 = v4;
  id v11 = v5;
  int v6 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v10];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__AFSettingsConnection_siriDesignModeIsEnabled___block_invoke_224;
  v8[3] = &unk_1E59283D0;
  id v9 = v5;
  id v7 = v5;
  [v6 siriDesignModeIsEnabled:v8];
}

void __48__AFSettingsConnection_siriDesignModeIsEnabled___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    id v7 = "-[AFSettingsConnection siriDesignModeIsEnabled:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id, uint64_t))(v5 + 16))(v5, v3, 1);
  }
}

uint64_t __48__AFSettingsConnection_siriDesignModeIsEnabled___block_invoke_224(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)setSiriDesignModeEnabled:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __60__AFSettingsConnection_setSiriDesignModeEnabled_completion___block_invoke;
  v12[3] = &unk_1E592B9A0;
  id v7 = v6;
  id v13 = v7;
  __int16 v8 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v12];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __60__AFSettingsConnection_setSiriDesignModeEnabled_completion___block_invoke_223;
  v10[3] = &unk_1E592C360;
  id v11 = v7;
  id v9 = v7;
  [v8 setSiriDesignModeEnabled:v4 completion:v10];
}

void __60__AFSettingsConnection_setSiriDesignModeEnabled_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    id v7 = "-[AFSettingsConnection setSiriDesignModeEnabled:completion:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

uint64_t __60__AFSettingsConnection_setSiriDesignModeEnabled_completion___block_invoke_223(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (void)deleteSiriHistoryWithCompletion:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    id v7 = "-[AFSettingsConnection deleteSiriHistoryWithCompletion:]";
    _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v6, 0xCu);
  }
  [(AFSettingsConnection *)self deleteSiriHistoryWithContext:0 withCompletion:v4];
}

- (void)deleteSiriHistoryWithContext:(id)a3 withCompletion:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v17 = "-[AFSettingsConnection deleteSiriHistoryWithContext:withCompletion:]";
    _os_log_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __68__AFSettingsConnection_deleteSiriHistoryWithContext_withCompletion___block_invoke;
  v14[3] = &unk_1E592B9A0;
  id v9 = v7;
  id v15 = v9;
  uint64_t v10 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v14];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __68__AFSettingsConnection_deleteSiriHistoryWithContext_withCompletion___block_invoke_222;
  v12[3] = &unk_1E592B9A0;
  id v13 = v9;
  id v11 = v9;
  [v10 deleteSiriHistoryWithContext:v6 withCompletion:v12];
}

void __68__AFSettingsConnection_deleteSiriHistoryWithContext_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    id v7 = "-[AFSettingsConnection deleteSiriHistoryWithContext:withCompletion:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

void __68__AFSettingsConnection_deleteSiriHistoryWithContext_withCompletion___block_invoke_222(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = AFSiriLogContextConnection;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315394;
      id v7 = "-[AFSettingsConnection deleteSiriHistoryWithContext:withCompletion:]_block_invoke";
      __int16 v8 = 2112;
      id v9 = v3;
      _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s Failed with error %@.", (uint8_t *)&v6, 0x16u);
    }
  }
  else if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    id v7 = "-[AFSettingsConnection deleteSiriHistoryWithContext:withCompletion:]_block_invoke";
    _os_log_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_INFO, "%s Done", (uint8_t *)&v6, 0xCu);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)shouldSuppressSiriDataSharingOptInAlert:(id)a3
{
  id v4 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64__AFSettingsConnection_shouldSuppressSiriDataSharingOptInAlert___block_invoke;
  v10[3] = &unk_1E592B9A0;
  id v5 = v4;
  id v11 = v5;
  int v6 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v10];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__AFSettingsConnection_shouldSuppressSiriDataSharingOptInAlert___block_invoke_221;
  v8[3] = &unk_1E59283D0;
  id v9 = v5;
  id v7 = v5;
  [v6 shouldSuppressSiriDataSharingOptInAlertWithCompletion:v8];
}

void __64__AFSettingsConnection_shouldSuppressSiriDataSharingOptInAlert___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    id v7 = "-[AFSettingsConnection shouldSuppressSiriDataSharingOptInAlert:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id, void))(v5 + 16))(v5, v3, 0);
  }
}

uint64_t __64__AFSettingsConnection_shouldSuppressSiriDataSharingOptInAlert___block_invoke_221(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315394;
    id v7 = "-[AFSettingsConnection shouldSuppressSiriDataSharingOptInAlert:]_block_invoke";
    __int16 v8 = 1024;
    int v9 = a2;
    _os_log_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_INFO, "%s status = %d", (uint8_t *)&v6, 0x12u);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)setOnDeviceDictationAvailableAlertPresented:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    __int16 v8 = "-[AFSettingsConnection setOnDeviceDictationAvailableAlertPresented:]";
    __int16 v9 = 1024;
    BOOL v10 = v3;
    _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s presented = %d", (uint8_t *)&v7, 0x12u);
  }
  int v6 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:&__block_literal_global_220];
  [v6 setOnDeviceDictationAvailableAlertPresented:v3];
}

void __68__AFSettingsConnection_setOnDeviceDictationAvailableAlertPresented___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  BOOL v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    uint64_t v5 = "-[AFSettingsConnection setOnDeviceDictationAvailableAlertPresented:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)sendSampledAudioToServerWithCompletion:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__AFSettingsConnection_sendSampledAudioToServerWithCompletion___block_invoke;
  v7[3] = &unk_1E592B9A0;
  id v8 = v4;
  id v5 = v4;
  __int16 v6 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v7];
  [v6 sendSampledAudioToServerWithCompletion:v5];
}

void __63__AFSettingsConnection_sendSampledAudioToServerWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    id v7 = "-[AFSettingsConnection sendSampledAudioToServerWithCompletion:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)setIsHomePodInHH2Mode:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "-[AFSettingsConnection setIsHomePodInHH2Mode:completion:]";
    __int16 v17 = 1024;
    BOOL v18 = v4;
    _os_log_impl(&dword_19CF1D000, v7, OS_LOG_TYPE_INFO, "%s Setting isHomePodInHH2Mode = %d", buf, 0x12u);
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __57__AFSettingsConnection_setIsHomePodInHH2Mode_completion___block_invoke;
  v13[3] = &unk_1E592B9A0;
  id v8 = v6;
  id v14 = v8;
  id v9 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v13];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __57__AFSettingsConnection_setIsHomePodInHH2Mode_completion___block_invoke_218;
  v11[3] = &unk_1E592C360;
  id v12 = v8;
  id v10 = v8;
  [v9 setIsHomePodInHH2Mode:v4 completion:v11];
}

void __57__AFSettingsConnection_setIsHomePodInHH2Mode_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    id v7 = "-[AFSettingsConnection setIsHomePodInHH2Mode:completion:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

uint64_t __57__AFSettingsConnection_setIsHomePodInHH2Mode_completion___block_invoke_218(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (void)setSiriDataSharingHomePodSetupDeviceIsValid:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "-[AFSettingsConnection setSiriDataSharingHomePodSetupDeviceIsValid:completion:]";
    __int16 v17 = 1024;
    BOOL v18 = v4;
    _os_log_impl(&dword_19CF1D000, v7, OS_LOG_TYPE_INFO, "%s Setting Siri Data Sharing HomePod Setup Device isValid to = %d", buf, 0x12u);
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __79__AFSettingsConnection_setSiriDataSharingHomePodSetupDeviceIsValid_completion___block_invoke;
  v13[3] = &unk_1E592B9A0;
  id v8 = v6;
  id v14 = v8;
  id v9 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v13];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __79__AFSettingsConnection_setSiriDataSharingHomePodSetupDeviceIsValid_completion___block_invoke_217;
  v11[3] = &unk_1E592C360;
  id v12 = v8;
  id v10 = v8;
  [v9 setSiriDataSharingHomePodSetupDeviceIsValid:v4 completion:v11];
}

void __79__AFSettingsConnection_setSiriDataSharingHomePodSetupDeviceIsValid_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    id v7 = "-[AFSettingsConnection setSiriDataSharingHomePodSetupDeviceIsValid:completion:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

uint64_t __79__AFSettingsConnection_setSiriDataSharingHomePodSetupDeviceIsValid_completion___block_invoke_217(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (void)setSiriDataSharingOptInAlertPresented:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "-[AFSettingsConnection setSiriDataSharingOptInAlertPresented:completion:]";
    __int16 v17 = 1024;
    BOOL v18 = v4;
    _os_log_impl(&dword_19CF1D000, v7, OS_LOG_TYPE_INFO, "%s status = %d", buf, 0x12u);
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __73__AFSettingsConnection_setSiriDataSharingOptInAlertPresented_completion___block_invoke;
  v13[3] = &unk_1E592B9A0;
  id v8 = v6;
  id v14 = v8;
  id v9 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v13];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __73__AFSettingsConnection_setSiriDataSharingOptInAlertPresented_completion___block_invoke_216;
  v11[3] = &unk_1E592C360;
  id v12 = v8;
  id v10 = v8;
  [v9 setSiriDataSharingOptInAlertPresented:v4 completion:v11];
}

void __73__AFSettingsConnection_setSiriDataSharingOptInAlertPresented_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    id v7 = "-[AFSettingsConnection setSiriDataSharingOptInAlertPresented:completion:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

uint64_t __73__AFSettingsConnection_setSiriDataSharingOptInAlertPresented_completion___block_invoke_216(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (void)setSiriDataSharingOptInStatus:(int64_t)a3 propagateToHomeAccessories:(BOOL)a4 source:(int64_t)a5 reason:(id)a6 completion:(id)a7
{
  BOOL v9 = a4;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v12 = a6;
  id v13 = a7;
  if ((unint64_t)a3 > 3) {
    id v14 = @"(unknown)";
  }
  else {
    id v14 = off_1E592B870[a3];
  }
  id v15 = v14;
  v16 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316163;
    *(void *)&uint8_t buf[4] = "-[AFSettingsConnection setSiriDataSharingOptInStatus:propagateToHomeAccessories:source:reason:completion:]";
    *(_WORD *)&buf[12] = 2049;
    *(void *)&buf[14] = a3;
    *(_WORD *)&buf[22] = 2048;
    int64_t v26 = a5;
    LOWORD(v27) = 2113;
    *(void *)((char *)&v27 + 2) = v12;
    WORD5(v27) = 1024;
    HIDWORD(v27) = v9;
    _os_log_impl(&dword_19CF1D000, v16, OS_LOG_TYPE_INFO, "%s Setting Siri Data Sharing OptIn status=%{private}ld from source=%ld with reason=%{private}@, and propagating to home accessories=%d", buf, 0x30u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  int64_t v26 = (int64_t)__Block_byref_object_copy__22201;
  *(void *)&long long v27 = __Block_byref_object_dispose__22202;
  *((void *)&v27 + 1) = self;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __106__AFSettingsConnection_setSiriDataSharingOptInStatus_propagateToHomeAccessories_source_reason_completion___block_invoke;
  v21[3] = &unk_1E5928538;
  __int16 v17 = v15;
  uint64_t v22 = v17;
  id v18 = v13;
  id v23 = v18;
  v24 = buf;
  uint64_t v19 = (void *)MEMORY[0x19F3A50D0](v21);
  __int16 v20 = [*(id *)(*(void *)&buf[8] + 40) _settingsServiceWithErrorHandler:v19];
  [v20 setSiriDataSharingOptInStatus:a3 propagateToHomeAccessories:v9 source:a5 reason:v12 completion:v19];

  _Block_object_dispose(buf, 8);
}

void __106__AFSettingsConnection_setSiriDataSharingOptInStatus_propagateToHomeAccessories_source_reason_completion___block_invoke(void *a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = AFSiriLogContextConnection;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315394;
      uint64_t v10 = "-[AFSettingsConnection setSiriDataSharingOptInStatus:propagateToHomeAccessories:source:reason:completion:]_block_invoke";
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s Error while attempting to set Siri data sharing optin status %@", (uint8_t *)&v9, 0x16u);
    }
  }
  else if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = (void *)a1[4];
    int v9 = 136315394;
    uint64_t v10 = "-[AFSettingsConnection setSiriDataSharingOptInStatus:propagateToHomeAccessories:source:reason:completion:]_block_invoke";
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_INFO, "%s Siri data sharing optin status is set to %@ and propagation (if required) has been kicked off", (uint8_t *)&v9, 0x16u);
  }
  uint64_t v6 = a1[5];
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  }
  uint64_t v7 = *(void *)(a1[6] + 8);
  __int16 v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;
}

- (void)getSiriDataSharingOptInStatusWithCompletion:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v14 = "-[AFSettingsConnection getSiriDataSharingOptInStatusWithCompletion:]";
    _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s Getting siri data sharing optin status", buf, 0xCu);
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68__AFSettingsConnection_getSiriDataSharingOptInStatusWithCompletion___block_invoke;
  v11[3] = &unk_1E592B9A0;
  id v6 = v4;
  id v12 = v6;
  uint64_t v7 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v11];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __68__AFSettingsConnection_getSiriDataSharingOptInStatusWithCompletion___block_invoke_214;
  v9[3] = &unk_1E5928560;
  id v10 = v6;
  id v8 = v6;
  [v7 getSiriDataSharingOptInStatusWithCompletion:v9];
}

void __68__AFSettingsConnection_getSiriDataSharingOptInStatusWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    uint64_t v7 = "-[AFSettingsConnection getSiriDataSharingOptInStatusWithCompletion:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id, void))(v5 + 16))(v5, v3, 0);
  }
}

uint64_t __68__AFSettingsConnection_getSiriDataSharingOptInStatusWithCompletion___block_invoke_214(uint64_t a1, unint64_t a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = v4;
    if (a2 > 3) {
      int v6 = @"(unknown)";
    }
    else {
      int v6 = off_1E592B870[a2];
    }
    uint64_t v7 = v6;
    int v9 = 136315394;
    uint64_t v10 = "-[AFSettingsConnection getSiriDataSharingOptInStatusWithCompletion:]_block_invoke";
    __int16 v11 = 2112;
    id v12 = v7;
    _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s optin status = %@", (uint8_t *)&v9, 0x16u);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, unint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)setSiriDataSharingOptInStatus:(int64_t)a3 completion:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if ((unint64_t)a3 > 3) {
    uint64_t v7 = @"(unknown)";
  }
  else {
    uint64_t v7 = off_1E592B870[a3];
  }
  __int16 v8 = v7;
  int v9 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[AFSettingsConnection setSiriDataSharingOptInStatus:completion:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v8;
    _os_log_impl(&dword_19CF1D000, v9, OS_LOG_TYPE_INFO, "%s Setting siri data sharing optin status to = %@", buf, 0x16u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__22201;
  id v23 = __Block_byref_object_dispose__22202;
  v24 = self;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __65__AFSettingsConnection_setSiriDataSharingOptInStatus_completion___block_invoke;
  v17[3] = &unk_1E5928538;
  uint64_t v10 = v8;
  id v18 = v10;
  id v11 = v6;
  id v19 = v11;
  __int16 v20 = buf;
  id v12 = (void *)MEMORY[0x19F3A50D0](v17);
  uint64_t v13 = [*(id *)(*(void *)&buf[8] + 40) _settingsServiceWithErrorHandler:v12];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __65__AFSettingsConnection_setSiriDataSharingOptInStatus_completion___block_invoke_213;
  v15[3] = &unk_1E592C360;
  id v14 = v12;
  id v16 = v14;
  [v13 setSiriDataSharingOptInStatus:a3 completion:v15];

  _Block_object_dispose(buf, 8);
}

void __65__AFSettingsConnection_setSiriDataSharingOptInStatus_completion___block_invoke(void *a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = AFSiriLogContextConnection;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315394;
      uint64_t v10 = "-[AFSettingsConnection setSiriDataSharingOptInStatus:completion:]_block_invoke";
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s Failed to set Siri data sharing optin status %@", (uint8_t *)&v9, 0x16u);
    }
  }
  else if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = (void *)a1[4];
    int v9 = 136315394;
    uint64_t v10 = "-[AFSettingsConnection setSiriDataSharingOptInStatus:completion:]_block_invoke";
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_INFO, "%s Siri data sharing optin status is set to %@", (uint8_t *)&v9, 0x16u);
  }
  uint64_t v6 = a1[5];
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  }
  uint64_t v7 = *(void *)(a1[6] + 8);
  __int16 v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;
}

uint64_t __65__AFSettingsConnection_setSiriDataSharingOptInStatus_completion___block_invoke_213(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)siriGradingIsEnabled:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__AFSettingsConnection_siriGradingIsEnabled___block_invoke;
  v6[3] = &unk_1E5928510;
  id v7 = v4;
  id v5 = v4;
  [(AFSettingsConnection *)self getSiriDataSharingOptInStatusWithCompletion:v6];
}

uint64_t __45__AFSettingsConnection_siriGradingIsEnabled___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, BOOL))(result + 16))(result, a2, a3 == 1);
  }
  return result;
}

- (void)setSiriGradingEnabled:(BOOL)a3 completion:(id)a4
{
  if (a3) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = 2;
  }
  [(AFSettingsConnection *)self setSiriDataSharingOptInStatus:v4 propagateToHomeAccessories:0 source:0 reason:@"Legacy Setter" completion:a4];
}

- (void)getSharedUserID:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__AFSettingsConnection_getSharedUserID___block_invoke;
  v7[3] = &unk_1E592B9A0;
  id v8 = v4;
  id v5 = v4;
  uint64_t v6 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v7];
  [v6 getSharedUserID:v5];
}

uint64_t __40__AFSettingsConnection_getSharedUserID___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, uint64_t))(result + 16))(result, 0, 0, a2);
  }
  return result;
}

- (void)resetProfileNames:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__AFSettingsConnection_resetProfileNames_completion___block_invoke;
  v9[3] = &unk_1E592B9A0;
  id v10 = v6;
  id v7 = v6;
  id v8 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v9];
  [v8 resetProfileNames:v4 completion:v7];
}

void __53__AFSettingsConnection_resetProfileNames_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315394;
      id v7 = "-[AFSettingsConnection resetProfileNames:completion:]_block_invoke";
      __int16 v8 = 2112;
      id v9 = v3;
      _os_log_error_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_ERROR, "%s error creating remote object is %@", (uint8_t *)&v6, 0x16u);
      uint64_t v4 = *(void *)(a1 + 32);
    }
    (*(void (**)(uint64_t, void))(v4 + 16))(v4, 0);
  }
}

- (void)showHomeProfileNamesWithCompletion:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__AFSettingsConnection_showHomeProfileNamesWithCompletion___block_invoke;
  v7[3] = &unk_1E592B9A0;
  id v8 = v4;
  id v5 = v4;
  int v6 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v7];
  [v6 showHomeProfileNamesWithCompletion:v5];
}

void __59__AFSettingsConnection_showHomeProfileNamesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315394;
      id v7 = "-[AFSettingsConnection showHomeProfileNamesWithCompletion:]_block_invoke";
      __int16 v8 = 2112;
      id v9 = v3;
      _os_log_error_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_ERROR, "%s error creating remote object - %@", (uint8_t *)&v6, 0x16u);
      uint64_t v4 = *(void *)(a1 + 32);
    }
    (*(void (**)(uint64_t, void))(v4 + 16))(v4, 0);
  }
}

- (void)showLocalProfileNamesWithCompletion:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__AFSettingsConnection_showLocalProfileNamesWithCompletion___block_invoke;
  v7[3] = &unk_1E592B9A0;
  id v8 = v4;
  id v5 = v4;
  int v6 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v7];
  [v6 showLocalProfileNamesWithCompletion:v5];
}

void __60__AFSettingsConnection_showLocalProfileNamesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315394;
      id v7 = "-[AFSettingsConnection showLocalProfileNamesWithCompletion:]_block_invoke";
      __int16 v8 = 2112;
      id v9 = v3;
      _os_log_error_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_ERROR, "%s error creating remote object - %@", (uint8_t *)&v6, 0x16u);
      uint64_t v4 = *(void *)(a1 + 32);
    }
    (*(void (**)(uint64_t, void))(v4 + 16))(v4, 0);
  }
}

- (void)showMultiUserSharedUserIDsCompletion:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__AFSettingsConnection_showMultiUserSharedUserIDsCompletion___block_invoke;
  v7[3] = &unk_1E592B9A0;
  id v8 = v4;
  id v5 = v4;
  int v6 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v7];
  [v6 showMultiUserSharedUserIDsCompletion:v5];
}

void __61__AFSettingsConnection_showMultiUserSharedUserIDsCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315394;
      id v7 = "-[AFSettingsConnection showMultiUserSharedUserIDsCompletion:]_block_invoke";
      __int16 v8 = 2112;
      id v9 = v3;
      _os_log_error_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_ERROR, "%s error is %@", (uint8_t *)&v6, 0x16u);
      uint64_t v4 = *(void *)(a1 + 32);
    }
    (*(void (**)(uint64_t, void, void))(v4 + 16))(v4, 0, 0);
  }
}

- (void)showPrimaryUserSharedUserIDWithCompletion:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__AFSettingsConnection_showPrimaryUserSharedUserIDWithCompletion___block_invoke;
  v7[3] = &unk_1E592B9A0;
  id v8 = v4;
  id v5 = v4;
  int v6 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v7];
  [v6 showPrimaryUserSharedUserIDWithCompletion:v5];
}

void __66__AFSettingsConnection_showPrimaryUserSharedUserIDWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315394;
      id v7 = "-[AFSettingsConnection showPrimaryUserSharedUserIDWithCompletion:]_block_invoke";
      __int16 v8 = 2112;
      id v9 = v3;
      _os_log_error_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_ERROR, "%s error is %@", (uint8_t *)&v6, 0x16u);
      uint64_t v4 = *(void *)(a1 + 32);
    }
    (*(void (**)(uint64_t, void))(v4 + 16))(v4, 0);
  }
}

- (void)getMultiUserCompanionInfo:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__AFSettingsConnection_getMultiUserCompanionInfo___block_invoke;
  v7[3] = &unk_1E592B9A0;
  id v8 = v4;
  id v5 = v4;
  int v6 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v7];
  [v6 getMultiUserCompanionInfo:v5];
}

void __50__AFSettingsConnection_getMultiUserCompanionInfo___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315394;
      id v7 = "-[AFSettingsConnection getMultiUserCompanionInfo:]_block_invoke";
      __int16 v8 = 2112;
      id v9 = v3;
      _os_log_error_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_ERROR, "%s error is %@", (uint8_t *)&v6, 0x16u);
      uint64_t v4 = *(void *)(a1 + 32);
    }
    (*(void (**)(uint64_t, void))(v4 + 16))(v4, 0);
  }
}

- (void)showMultiUserCompanionInfo:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__AFSettingsConnection_showMultiUserCompanionInfo___block_invoke;
  v7[3] = &unk_1E592B9A0;
  id v8 = v4;
  id v5 = v4;
  int v6 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v7];
  [v6 showMultiUserCompanionInfo:v5];
}

void __51__AFSettingsConnection_showMultiUserCompanionInfo___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315394;
      id v7 = "-[AFSettingsConnection showMultiUserCompanionInfo:]_block_invoke";
      __int16 v8 = 2112;
      id v9 = v3;
      _os_log_error_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_ERROR, "%s error is %@", (uint8_t *)&v6, 0x16u);
      uint64_t v4 = *(void *)(a1 + 32);
    }
    (*(void (**)(uint64_t, void))(v4 + 16))(v4, 0);
  }
}

- (void)showMultiUsers:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__AFSettingsConnection_showMultiUsers___block_invoke;
  v7[3] = &unk_1E592B9A0;
  id v8 = v4;
  id v5 = v4;
  int v6 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v7];
  [v6 showMultiUsers:v5];
}

void __39__AFSettingsConnection_showMultiUsers___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315394;
      id v7 = "-[AFSettingsConnection showMultiUsers:]_block_invoke";
      __int16 v8 = 2112;
      id v9 = v3;
      _os_log_error_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_ERROR, "%s error is %@", (uint8_t *)&v6, 0x16u);
      uint64_t v4 = *(void *)(a1 + 32);
    }
    (*(void (**)(uint64_t, void))(v4 + 16))(v4, 0);
  }
}

- (void)removeMultiUserWithSharedUserID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67__AFSettingsConnection_removeMultiUserWithSharedUserID_completion___block_invoke;
  v10[3] = &unk_1E592B9A0;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  id v9 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v10];
  [v9 removeMultiUserUserWithSharedUserId:v8 completion:v7];
}

uint64_t __67__AFSettingsConnection_removeMultiUserWithSharedUserID_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)removeMultiUserUser:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __55__AFSettingsConnection_removeMultiUserUser_completion___block_invoke;
  v10[3] = &unk_1E592B9A0;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  id v9 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v10];
  [v9 removeMultiUserUser:v8 completion:v7];
}

uint64_t __55__AFSettingsConnection_removeMultiUserUser_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)addMultiUserUser:(id)a3 sharedId:(id)a4 loggableSharedId:(id)a5 iCloudAltDSID:(id)a6 enrollmentName:(id)a7 isPrimary:(BOOL)a8 completion:(id)a9
{
  BOOL v9 = a8;
  id v16 = a9;
  uint64_t v24 = MEMORY[0x1E4F143A8];
  uint64_t v25 = 3221225472;
  int64_t v26 = __117__AFSettingsConnection_addMultiUserUser_sharedId_loggableSharedId_iCloudAltDSID_enrollmentName_isPrimary_completion___block_invoke;
  long long v27 = &unk_1E592B9A0;
  id v28 = v16;
  id v17 = v16;
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  id v21 = a4;
  id v22 = a3;
  id v23 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:&v24];
  objc_msgSend(v23, "addMultiUserUser:sharedId:loggableSharedId:iCloudAltDSID:enrollmentName:isPrimary:completion:", v22, v21, v20, v19, v18, v9, v17, v24, v25, v26, v27);
}

uint64_t __117__AFSettingsConnection_addMultiUserUser_sharedId_loggableSharedId_iCloudAltDSID_enrollmentName_isPrimary_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)multiUserCompanionDeviceIdentifiers:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __60__AFSettingsConnection_multiUserCompanionDeviceIdentifiers___block_invoke;
    v11[3] = &unk_1E592B9A0;
    id v6 = v4;
    id v12 = v6;
    id v7 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v11];
    id v8 = AFSiriLogContextConnection;
    if (!v7 && os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v14 = "-[AFSettingsConnection multiUserCompanionDeviceIdentifiers:]";
      _os_log_error_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_ERROR, "%s Setting services handle is missing", buf, 0xCu);
      id v8 = AFSiriLogContextConnection;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      id v14 = "-[AFSettingsConnection multiUserCompanionDeviceIdentifiers:]";
      _os_log_debug_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_DEBUG, "%s Calling Settings service", buf, 0xCu);
    }
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __60__AFSettingsConnection_multiUserCompanionDeviceIdentifiers___block_invoke_208;
    v9[3] = &unk_1E5928360;
    id v10 = v6;
    [v7 multiUserCompanionDeviceIdentifiers:v9];
  }
}

void __60__AFSettingsConnection_multiUserCompanionDeviceIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    id v6 = v4;
    id v7 = [v3 userInfo];
    int v8 = 136315394;
    BOOL v9 = "-[AFSettingsConnection multiUserCompanionDeviceIdentifiers:]_block_invoke";
    __int16 v10 = 2112;
    id v11 = v7;
    _os_log_error_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_ERROR, "%s Received error while finding multi user companion rapport identifiers %@", (uint8_t *)&v8, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
  }
}

uint64_t __60__AFSettingsConnection_multiUserCompanionDeviceIdentifiers___block_invoke_208(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getPersonalMultiUserDeviceIdentifiers:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __62__AFSettingsConnection_getPersonalMultiUserDeviceIdentifiers___block_invoke;
    v11[3] = &unk_1E592B9A0;
    id v6 = v4;
    id v12 = v6;
    id v7 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v11];
    if (!v7)
    {
      int v8 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        id v14 = "-[AFSettingsConnection getPersonalMultiUserDeviceIdentifiers:]";
        _os_log_error_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_ERROR, "%s Setting services handle is missing", buf, 0xCu);
      }
    }
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __62__AFSettingsConnection_getPersonalMultiUserDeviceIdentifiers___block_invoke_207;
    v9[3] = &unk_1E5928360;
    id v10 = v6;
    [v7 getPersonalMultiUserDeviceIdentifiers:v9];
  }
}

uint64_t __62__AFSettingsConnection_getPersonalMultiUserDeviceIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    id v6 = v4;
    id v7 = [a2 userInfo];
    int v8 = 136315394;
    BOOL v9 = "-[AFSettingsConnection getPersonalMultiUserDeviceIdentifiers:]_block_invoke";
    __int16 v10 = 2112;
    id v11 = v7;
    _os_log_error_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_ERROR, "%s Received error while finding multi user device rapport identifiers %@", (uint8_t *)&v8, 0x16u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __62__AFSettingsConnection_getPersonalMultiUserDeviceIdentifiers___block_invoke_207(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getSharedUserIdForHomeUserId:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64__AFSettingsConnection_getSharedUserIdForHomeUserId_completion___block_invoke;
  v10[3] = &unk_1E592B9A0;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  BOOL v9 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v10];
  [v9 getSharedUserIdForHomeUserId:v8 completion:v7];
}

uint64_t __64__AFSettingsConnection_getSharedUserIdForHomeUserId_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)getHomeUserIdForSharedUserId:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64__AFSettingsConnection_getHomeUserIdForSharedUserId_completion___block_invoke;
  v10[3] = &unk_1E592B9A0;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  BOOL v9 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v10];
  [v9 getHomeUserIdForSharedUserId:v8 completion:v7];
}

uint64_t __64__AFSettingsConnection_getHomeUserIdForSharedUserId_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)postJSDiscoveryNotificationForBTDeviceWithInfo:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __86__AFSettingsConnection_postJSDiscoveryNotificationForBTDeviceWithInfo_withCompletion___block_invoke;
  v10[3] = &unk_1E592C248;
  id v11 = v6;
  id v7 = v6;
  id v8 = a4;
  BOOL v9 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v10];
  [v9 postJSDiscoveryNotificationForBTDeviceWithInfo:v7 withCompletion:v8];
}

void __86__AFSettingsConnection_postJSDiscoveryNotificationForBTDeviceWithInfo_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 136315650;
    id v7 = "-[AFSettingsConnection postJSDiscoveryNotificationForBTDeviceWithInfo:withCompletion:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s Failed to connect and post JS discovery notification for BT Device %@, error: %@", (uint8_t *)&v6, 0x20u);
  }
}

- (void)stopObservingBluetoothInEarDetectionStateForObserverID:(unint64_t)a3
{
  id v4 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:&__block_literal_global_206];
  [v4 stopObservingBluetoothInEarDetectionStateForObserverID:a3];
}

void __79__AFSettingsConnection_stopObservingBluetoothInEarDetectionStateForObserverID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    uint64_t v5 = "-[AFSettingsConnection stopObservingBluetoothInEarDetectionStateForObserverID:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s Failed to connect and stop observing in-ear detection state: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)startObservingBluetoothInEarDetectionStateForBTAddress:(id)a3 forObserverID:(unint64_t)a4
{
  id v6 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __93__AFSettingsConnection_startObservingBluetoothInEarDetectionStateForBTAddress_forObserverID___block_invoke;
  v9[3] = &unk_1E592C248;
  id v10 = v6;
  id v7 = v6;
  uint64_t v8 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v9];
  [v8 startObservingBluetoothInEarDetectionStateForBTAddress:v7 forObserverID:a4];
}

void __93__AFSettingsConnection_startObservingBluetoothInEarDetectionStateForBTAddress_forObserverID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 136315650;
    id v7 = "-[AFSettingsConnection startObservingBluetoothInEarDetectionStateForBTAddress:forObserverID:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s Failed to connect and start observing in-ear detection state for %@: %@", (uint8_t *)&v6, 0x20u);
  }
}

- (void)getInEarDetectionStateForBTAddress:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __74__AFSettingsConnection_getInEarDetectionStateForBTAddress_withCompletion___block_invoke;
  v13[3] = &unk_1E592B9A0;
  id v7 = v6;
  id v14 = v7;
  id v8 = a3;
  uint64_t v9 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v13];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __74__AFSettingsConnection_getInEarDetectionStateForBTAddress_withCompletion___block_invoke_2;
  v11[3] = &unk_1E59284E8;
  id v12 = v7;
  id v10 = v7;
  [v9 getInEarDetectionStateForBTAddress:v8 withCompletion:v11];
}

uint64_t __74__AFSettingsConnection_getInEarDetectionStateForBTAddress_withCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

uint64_t __74__AFSettingsConnection_getInEarDetectionStateForBTAddress_withCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, a2, 0);
  }
  return result;
}

- (void)stopObservingWirelessSplitterSession
{
  id v2 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:&__block_literal_global_203];
  [v2 stopObservingBluetoothWirelessSplitterSession];
}

void __60__AFSettingsConnection_stopObservingWirelessSplitterSession__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    uint64_t v5 = "-[AFSettingsConnection stopObservingWirelessSplitterSession]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s Failed to connect and stop observing wireless splitter session: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)startObservingWirelessSplitterSession
{
  id v2 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:&__block_literal_global_201];
  [v2 startObservingBluetoothWirelessSplitterSession];
}

void __61__AFSettingsConnection_startObservingWirelessSplitterSession__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    uint64_t v5 = "-[AFSettingsConnection startObservingWirelessSplitterSession]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s Failed to connect and start observing wireless splitter session: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)getBluetoothWirelessSplitterSessionInfoWithCompletion:(id)a3
{
  id v4 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __78__AFSettingsConnection_getBluetoothWirelessSplitterSessionInfoWithCompletion___block_invoke;
  v10[3] = &unk_1E592B9A0;
  id v5 = v4;
  id v11 = v5;
  __int16 v6 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v10];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __78__AFSettingsConnection_getBluetoothWirelessSplitterSessionInfoWithCompletion___block_invoke_2;
  v8[3] = &unk_1E59284C0;
  id v9 = v5;
  id v7 = v5;
  [v6 getBluetoothWirelessSplitterSessionInfoWithCompletion:v8];
}

uint64_t __78__AFSettingsConnection_getBluetoothWirelessSplitterSessionInfoWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

uint64_t __78__AFSettingsConnection_getBluetoothWirelessSplitterSessionInfoWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, a2, 0);
  }
  return result;
}

- (void)getPairedBluetoothDeviceInfoArrayWithCompletion:(id)a3
{
  id v4 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __72__AFSettingsConnection_getPairedBluetoothDeviceInfoArrayWithCompletion___block_invoke;
  v10[3] = &unk_1E592B9A0;
  id v5 = v4;
  id v11 = v5;
  __int16 v6 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v10];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __72__AFSettingsConnection_getPairedBluetoothDeviceInfoArrayWithCompletion___block_invoke_2;
  v8[3] = &unk_1E5928360;
  id v9 = v5;
  id v7 = v5;
  [v6 getPairedBluetoothDeviceInfoArrayWithCompletion:v8];
}

uint64_t __72__AFSettingsConnection_getPairedBluetoothDeviceInfoArrayWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

uint64_t __72__AFSettingsConnection_getPairedBluetoothDeviceInfoArrayWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, a2, 0);
  }
  return result;
}

- (void)getConnectedBluetoothDeviceInfoArrayWithCompletion:(id)a3
{
  id v4 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __75__AFSettingsConnection_getConnectedBluetoothDeviceInfoArrayWithCompletion___block_invoke;
  v10[3] = &unk_1E592B9A0;
  id v5 = v4;
  id v11 = v5;
  __int16 v6 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v10];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __75__AFSettingsConnection_getConnectedBluetoothDeviceInfoArrayWithCompletion___block_invoke_2;
  v8[3] = &unk_1E5928360;
  id v9 = v5;
  id v7 = v5;
  [v6 getConnectedBluetoothDeviceInfoArrayWithCompletion:v8];
}

uint64_t __75__AFSettingsConnection_getConnectedBluetoothDeviceInfoArrayWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

uint64_t __75__AFSettingsConnection_getConnectedBluetoothDeviceInfoArrayWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, a2, 0);
  }
  return result;
}

- (void)getBluetoothDeviceInfoWithUID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __65__AFSettingsConnection_getBluetoothDeviceInfoWithUID_completion___block_invoke;
  v13[3] = &unk_1E592B9A0;
  id v7 = v6;
  id v14 = v7;
  id v8 = a3;
  id v9 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v13];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __65__AFSettingsConnection_getBluetoothDeviceInfoWithUID_completion___block_invoke_2;
  v11[3] = &unk_1E5928498;
  id v12 = v7;
  id v10 = v7;
  [v9 getBluetoothDeviceInfoWithUID:v8 completion:v11];
}

uint64_t __65__AFSettingsConnection_getBluetoothDeviceInfoWithUID_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

uint64_t __65__AFSettingsConnection_getBluetoothDeviceInfoWithUID_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, a2, 0);
  }
  return result;
}

- (void)getBluetoothDeviceInfoWithAddress:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __69__AFSettingsConnection_getBluetoothDeviceInfoWithAddress_completion___block_invoke;
  v13[3] = &unk_1E592B9A0;
  id v7 = v6;
  id v14 = v7;
  id v8 = a3;
  id v9 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v13];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __69__AFSettingsConnection_getBluetoothDeviceInfoWithAddress_completion___block_invoke_2;
  v11[3] = &unk_1E5928498;
  id v12 = v7;
  id v10 = v7;
  [v9 getBluetoothDeviceInfoWithAddress:v8 completion:v11];
}

uint64_t __69__AFSettingsConnection_getBluetoothDeviceInfoWithAddress_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

uint64_t __69__AFSettingsConnection_getBluetoothDeviceInfoWithAddress_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, a2, 0);
  }
  return result;
}

- (void)setSiriOutputVolume:(float)a3 forAudioRoute:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v11 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v8];
  *(float *)&double v10 = a3;
  [v11 setSiriOutputVolume:v9 forAudioRoute:v8 completion:v10];
}

- (void)setSiriOutputVolume:(float)a3 completion:(id)a4
{
}

- (void)getSiriOutputVolumeForAudioRoute:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68__AFSettingsConnection_getSiriOutputVolumeForAudioRoute_completion___block_invoke;
  v10[3] = &unk_1E592B9A0;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  id v9 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v10];
  [v9 getSiriOutputVolumeForAudioRoute:v8 completion:v7];
}

uint64_t __68__AFSettingsConnection_getSiriOutputVolumeForAudioRoute_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(double))(result + 16))(0.0);
  }
  return result;
}

- (void)getSiriOutputVolumeWithCompletion:(id)a3
{
}

- (void)fetchExperimentContextWithCompletion:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__AFSettingsConnection_fetchExperimentContextWithCompletion___block_invoke;
  v7[3] = &unk_1E592B9A0;
  id v8 = v4;
  id v5 = v4;
  id v6 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v7];
  [v6 fetchExperimentContextWithCompletion:v5];
}

uint64_t __61__AFSettingsConnection_fetchExperimentContextWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)fetchExperimentConfigurationsWithCompletion:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__AFSettingsConnection_fetchExperimentConfigurationsWithCompletion___block_invoke;
  v7[3] = &unk_1E592B9A0;
  id v8 = v4;
  id v5 = v4;
  id v6 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v7];
  [v6 fetchExperimentConfigurationsWithCompletion:v5];
}

uint64_t __68__AFSettingsConnection_fetchExperimentConfigurationsWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)sendMetricsToServerWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v4];
  [v5 sendMetricsToServerWithCompletion:v4];
}

- (void)resetAnalyticsStoreWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v4];
  [v5 resetAnalyticsStoreWithCompletion:v4];
}

- (void)purgeAnalyticsStoreWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v4];
  [v5 purgeAnalyticsStoreWithCompletion:v4];
}

- (void)fetchEventRecordsFromAnalyticsStoreAtPath:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __77__AFSettingsConnection_fetchEventRecordsFromAnalyticsStoreAtPath_completion___block_invoke;
  v10[3] = &unk_1E592B9A0;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  id v9 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v10];
  [v9 fetchEventRecordsFromAnalyticsStoreAtPath:v8 completion:v7];
}

uint64_t __77__AFSettingsConnection_fetchEventRecordsFromAnalyticsStoreAtPath_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)setNanoAlwaysShowRecognizedSpeech:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = (void (**)(void))a4;
  id v6 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    id v8 = "-[AFSettingsConnection setNanoAlwaysShowRecognizedSpeech:withCompletion:]";
    __int16 v9 = 1024;
    BOOL v10 = v4;
    _os_log_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_INFO, "%s %d", (uint8_t *)&v7, 0x12u);
  }
  if (v5) {
    v5[2](v5);
  }
}

- (void)setNanoSiriResponseShouldAlwaysPrint:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = (void (**)(void))a4;
  id v6 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    id v8 = "-[AFSettingsConnection setNanoSiriResponseShouldAlwaysPrint:withCompletion:]";
    __int16 v9 = 1024;
    BOOL v10 = v4;
    _os_log_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_INFO, "%s %d", (uint8_t *)&v7, 0x12u);
  }
  if (v5) {
    v5[2](v5);
  }
}

- (void)setNanoMessageWithoutConfirmationEnabled:(BOOL)a3 withCompletion:(id)a4
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (void)setNanoCrownActivationEnabled:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = (void (**)(void))a4;
  id v6 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    id v8 = "-[AFSettingsConnection setNanoCrownActivationEnabled:withCompletion:]";
    __int16 v9 = 1024;
    BOOL v10 = v4;
    _os_log_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_INFO, "%s %d", (uint8_t *)&v7, 0x12u);
  }
  if (v5) {
    v5[2](v5);
  }
}

- (void)setNanoLanguage:(id)a3 withCompletion:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void (**)(void))a4;
  int v7 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315394;
    __int16 v9 = "-[AFSettingsConnection setNanoLanguage:withCompletion:]";
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl(&dword_19CF1D000, v7, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v8, 0x16u);
  }
  if (v6) {
    v6[2](v6);
  }
}

- (void)setNanoOutputVoice:(id)a3 withCompletion:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void (**)(void))a4;
  int v7 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315394;
    __int16 v9 = "-[AFSettingsConnection setNanoOutputVoice:withCompletion:]";
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl(&dword_19CF1D000, v7, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v8, 0x16u);
  }
  if (v6) {
    v6[2](v6);
  }
}

- (void)setNanoTTSSpeakerVolume:(id)a3 withCompletion:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void (**)(void))a4;
  int v7 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315394;
    __int16 v9 = "-[AFSettingsConnection setNanoTTSSpeakerVolume:withCompletion:]";
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl(&dword_19CF1D000, v7, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v8, 0x16u);
  }
  if (v6) {
    v6[2](v6);
  }
}

- (void)setNanoUseDeviceSpeakerForTTS:(id)a3 withCompletion:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void (**)(void))a4;
  int v7 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315394;
    __int16 v9 = "-[AFSettingsConnection setNanoUseDeviceSpeakerForTTS:withCompletion:]";
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl(&dword_19CF1D000, v7, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v8, 0x16u);
  }
  if (v6) {
    v6[2](v6);
  }
}

- (void)setNanoRaiseToSpeakEnabled:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = (void (**)(void))a4;
  id v6 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    int v8 = "-[AFSettingsConnection setNanoRaiseToSpeakEnabled:withCompletion:]";
    __int16 v9 = 1024;
    BOOL v10 = v4;
    _os_log_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_INFO, "%s %d", (uint8_t *)&v7, 0x12u);
  }
  if (v5) {
    v5[2](v5);
  }
}

- (void)setNanoPhraseSpotterEnabled:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = (void (**)(void))a4;
  id v6 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    int v8 = "-[AFSettingsConnection setNanoPhraseSpotterEnabled:withCompletion:]";
    __int16 v9 = 1024;
    BOOL v10 = v4;
    _os_log_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_INFO, "%s %d", (uint8_t *)&v7, 0x12u);
  }
  if (v5) {
    v5[2](v5);
  }
}

- (void)setNanoDictationAutoPunctuationEnabled:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = (void (**)(void))a4;
  id v6 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    int v8 = "-[AFSettingsConnection setNanoDictationAutoPunctuationEnabled:withCompletion:]";
    __int16 v9 = 1024;
    BOOL v10 = v4;
    _os_log_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_INFO, "%s %d", (uint8_t *)&v7, 0x12u);
  }
  if (v5) {
    v5[2](v5);
  }
}

- (void)setNanoDictationEnabled:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = (void (**)(void))a4;
  id v6 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    int v8 = "-[AFSettingsConnection setNanoDictationEnabled:withCompletion:]";
    __int16 v9 = 1024;
    BOOL v10 = v4;
    _os_log_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_INFO, "%s %d", (uint8_t *)&v7, 0x12u);
  }
  if (v5) {
    v5[2](v5);
  }
}

- (void)setNanoAssistantEnabled:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = (void (**)(void))a4;
  id v6 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    int v8 = "-[AFSettingsConnection setNanoAssistantEnabled:withCompletion:]";
    __int16 v9 = 1024;
    BOOL v10 = v4;
    _os_log_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_INFO, "%s %d", (uint8_t *)&v7, 0x12u);
  }
  if (v5) {
    v5[2](v5);
  }
}

- (void)publishFeedbackArbitrationParticipation:(id)a3
{
  id v4 = a3;
  id v5 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:&__block_literal_global_197];
  [v5 publishFeedbackArbitrationParticipation:v4];
}

void __64__AFSettingsConnection_publishFeedbackArbitrationParticipation___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315394;
    id v5 = "-[AFSettingsConnection publishFeedbackArbitrationParticipation:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)getStereoPairState:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __43__AFSettingsConnection_getStereoPairState___block_invoke;
    v8[3] = &unk_1E592B9A0;
    id v6 = v4;
    id v9 = v6;
    id v7 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v8];
    [v7 getStereoPairState:v6];
  }
}

uint64_t __43__AFSettingsConnection_getStereoPairState___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getStereoPartnerLastMyriadWinDate:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __58__AFSettingsConnection_getStereoPartnerLastMyriadWinDate___block_invoke;
    v8[3] = &unk_1E592B9A0;
    id v6 = v4;
    id v9 = v6;
    id v7 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v8];
    [v7 getStereoPartnerLastMyriadWinDate:v6];
  }
}

uint64_t __58__AFSettingsConnection_getStereoPartnerLastMyriadWinDate___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getMeCard:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    if (AFIsHorseman_onceToken != -1) {
      dispatch_once(&AFIsHorseman_onceToken, &__block_literal_global_220_45602);
    }
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __34__AFSettingsConnection_getMeCard___block_invoke;
    v7[3] = &unk_1E592B9A0;
    id v5 = v4;
    id v8 = v5;
    id v6 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v7];
    [v6 getMeCard:v5];
  }
}

void __34__AFSettingsConnection_getMeCard___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315394;
    id v6 = "-[AFSettingsConnection getMeCard:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s Hit error %@", (uint8_t *)&v5, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setHorsemanSupplementalLanguageDictionary:(id)a3 completion:(id)a4
{
}

- (void)getHorsemanSupplementalLanguageDictionary:(id)a3
{
  if (a3) {
    [(AFSettingsConnection *)self getSupplementalLanguageDictionaryForProduct:*MEMORY[0x1E4F97880] completion:a3];
  }
}

- (void)getSupplementalLanguagesForProduct:(id)a3 forBuildVersion:(id)a4 completion:(id)a5
{
  id v8 = a5;
  uint64_t v9 = v8;
  if (v8)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __86__AFSettingsConnection_getSupplementalLanguagesForProduct_forBuildVersion_completion___block_invoke;
    v14[3] = &unk_1E592B9A0;
    id v10 = v8;
    id v15 = v10;
    id v11 = a4;
    id v12 = a3;
    uint64_t v13 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v14];
    [v13 getSupplementalLanguagesForProduct:v12 forBuildVersion:v11 completion:v10];
  }
}

uint64_t __86__AFSettingsConnection_getSupplementalLanguagesForProduct_forBuildVersion_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getSupplementalLanguageDictionaryForProduct:(id)a3 completion:(id)a4
{
  id v6 = a4;
  __int16 v7 = v6;
  if (v6)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __79__AFSettingsConnection_getSupplementalLanguageDictionaryForProduct_completion___block_invoke;
    v11[3] = &unk_1E592B9A0;
    id v8 = v6;
    id v12 = v8;
    id v9 = a3;
    id v10 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v11];
    [v10 getSupplementalLanguageDictionaryForProduct:v9 completion:v8];
  }
}

uint64_t __79__AFSettingsConnection_getSupplementalLanguageDictionaryForProduct_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getSupplementalLanguagesModificationDate:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  if (v4)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __65__AFSettingsConnection_getSupplementalLanguagesModificationDate___block_invoke;
    v8[3] = &unk_1E592B9A0;
    id v6 = v4;
    id v9 = v6;
    __int16 v7 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v8];
    [v7 getSupplementalLanguagesModificationDate:v6];
  }
}

uint64_t __65__AFSettingsConnection_getSupplementalLanguagesModificationDate___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getSupplementalLanguagesDictionary:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  if (v4)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __59__AFSettingsConnection_getSupplementalLanguagesDictionary___block_invoke;
    v8[3] = &unk_1E592B9A0;
    id v6 = v4;
    id v9 = v6;
    __int16 v7 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v8];
    [v7 getSupplementalLanguagesDictionary:v6];
  }
}

uint64_t __59__AFSettingsConnection_getSupplementalLanguagesDictionary___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setSupplementalLanguages:(id)a3 forProduct:(id)a4 forBuildVersion:(id)a5 completion:(id)a6
{
  id v10 = a6;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __87__AFSettingsConnection_setSupplementalLanguages_forProduct_forBuildVersion_completion___block_invoke;
  v18[3] = &unk_1E592B9A0;
  id v19 = v10;
  id v11 = v10;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v18];
  id v16 = v15;
  if (v11) {
    id v17 = v11;
  }
  else {
    id v17 = &__block_literal_global_194;
  }
  [v15 setSupplementalLanguages:v14 forProduct:v13 forBuildVersion:v12 completion:v17];
}

uint64_t __87__AFSettingsConnection_setSupplementalLanguages_forProduct_forBuildVersion_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)setSupplementalLanguageDictionary:(id)a3 forProduct:(id)a4 completion:(id)a5
{
  id v8 = a5;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __80__AFSettingsConnection_setSupplementalLanguageDictionary_forProduct_completion___block_invoke;
  v15[3] = &unk_1E592B9A0;
  id v16 = v8;
  id v9 = v8;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v15];
  id v13 = v12;
  if (v9) {
    id v14 = v9;
  }
  else {
    id v14 = &__block_literal_global_192;
  }
  [v12 setSupplementalLanguageDictionary:v11 forProduct:v10 completion:v14];
}

uint64_t __80__AFSettingsConnection_setSupplementalLanguageDictionary_forProduct_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)postTestResultSelectedWithRcId:(id)a3
{
  id v4 = a3;
  id v5 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:&__block_literal_global_190];
  [v5 postTestResultSelectedWithRcId:v4];
}

void __55__AFSettingsConnection_postTestResultSelectedWithRcId___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    id v5 = "-[AFSettingsConnection postTestResultSelectedWithRcId:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)postTestResultCandidateWithRcId:(id)a3 recognitionSausage:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:&__block_literal_global_188];
  [v8 postTestResultCandidateWithRcId:v7 recognitionSausage:v6];
}

void __75__AFSettingsConnection_postTestResultCandidateWithRcId_recognitionSausage___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    id v5 = "-[AFSettingsConnection postTestResultCandidateWithRcId:recognitionSausage:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)stopAllAudioPlaybackRequests:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:&__block_literal_global_186];
  [v4 stopAllAudioPlaybackRequests:v3];
}

void __53__AFSettingsConnection_stopAllAudioPlaybackRequests___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  BOOL v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    id v5 = "-[AFSettingsConnection stopAllAudioPlaybackRequests:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)stopAudioPlaybackRequest:(id)a3 immediately:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:&__block_literal_global_184];
  [v7 stopAudioPlaybackRequest:v6 immediately:v4];
}

void __61__AFSettingsConnection_stopAudioPlaybackRequest_immediately___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  BOOL v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    id v5 = "-[AFSettingsConnection stopAudioPlaybackRequest:immediately:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)startAudioPlaybackRequest:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  id v8 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __69__AFSettingsConnection_startAudioPlaybackRequest_options_completion___block_invoke;
  v14[3] = &unk_1E592B9A0;
  id v15 = v8;
  id v9 = v8;
  id v10 = a3;
  id v11 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v14];
  id v12 = v11;
  if (v9) {
    id v13 = v9;
  }
  else {
    id v13 = &__block_literal_global_182;
  }
  [v11 startAudioPlaybackRequest:v10 options:a4 completion:v13];
}

uint64_t __69__AFSettingsConnection_startAudioPlaybackRequest_options_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)getPeerIdentifiers:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __43__AFSettingsConnection_getPeerIdentifiers___block_invoke;
  v9[3] = &unk_1E592B9A0;
  id v10 = v4;
  id v5 = v4;
  __int16 v6 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v9];
  id v7 = v6;
  if (v5) {
    id v8 = v5;
  }
  else {
    id v8 = &__block_literal_global_180;
  }
  [v6 getPeerIdentifiers:v8];
}

uint64_t __43__AFSettingsConnection_getPeerIdentifiers___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (void)startRemoteRequest:(id)a3 onPeer:(id)a4 completion:(id)a5
{
  id v8 = a5;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __61__AFSettingsConnection_startRemoteRequest_onPeer_completion___block_invoke;
  v15[3] = &unk_1E592B9A0;
  id v16 = v8;
  id v9 = v8;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v15];
  id v13 = v12;
  if (v9) {
    id v14 = v9;
  }
  else {
    id v14 = &__block_literal_global_178;
  }
  [v12 startRemoteRequest:v11 onPeer:v10 completion:v14];
}

uint64_t __61__AFSettingsConnection_startRemoteRequest_onPeer_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)dismissUI
{
  id v2 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:&__block_literal_global_176_22257];
  [v2 dismissUI];
}

void __33__AFSettingsConnection_dismissUI__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  BOOL v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    id v5 = "-[AFSettingsConnection dismissUI]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)startMultiUserUIRequestWithText:(id)a3 expectedSpeakerSharedUserID:(id)a4 expectedSpeakerConfidenceScore:(unint64_t)a5 nonspeakerConfidenceScores:(id)a6 completion:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a4;
  id v15 = a3;
  id v16 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:&__block_literal_global_174];
  [v16 startMultiUserUIRequestWithText:v15 expectedSpeakerSharedUserID:v14 expectedSpeakerConfidenceScore:a5 nonspeakerConfidenceScores:v13 completion:v12];
}

void __153__AFSettingsConnection_startMultiUserUIRequestWithText_expectedSpeakerSharedUserID_expectedSpeakerConfidenceScore_nonspeakerConfidenceScores_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  BOOL v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    id v5 = "-[AFSettingsConnection startMultiUserUIRequestWithText:expectedSpeakerSharedUserID:expectedSpeakerConfidenceSco"
         "re:nonspeakerConfidenceScores:completion:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)startUIRequestWithInfo:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:&__block_literal_global_172];
  [v8 startUIRequestWithInfo:v7 completion:v6];
}

void __58__AFSettingsConnection_startUIRequestWithInfo_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  BOOL v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    id v5 = "-[AFSettingsConnection startUIRequestWithInfo:completion:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)startUIRequestWithText:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:&__block_literal_global_170];
  [v8 startUIRequestWithText:v7 completion:v6];
}

void __58__AFSettingsConnection_startUIRequestWithText_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  BOOL v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    id v5 = "-[AFSettingsConnection startUIRequestWithText:completion:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)startUIMockServerRequestWithReplayFileURL:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:&__block_literal_global_168_22263];
  [v8 startUIMockServerRequestWithReplayFileURL:v7 completion:v6];
}

void __77__AFSettingsConnection_startUIMockServerRequestWithReplayFileURL_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  BOOL v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    id v5 = "-[AFSettingsConnection startUIMockServerRequestWithReplayFileURL:completion:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)startUIRequestWithSpeechAudioFileURL:(id)a3
{
  id v4 = a3;
  id v5 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:&__block_literal_global_166];
  [v5 startUIRequestWithSpeechAudioFileURL:v4];
}

void __61__AFSettingsConnection_startUIRequestWithSpeechAudioFileURL___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  BOOL v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    id v5 = "-[AFSettingsConnection startUIRequestWithSpeechAudioFileURL:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)startUIRequestWithInfo:(id)a3
{
  id v4 = a3;
  id v5 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:&__block_literal_global_161];
  [v5 startUIRequestWithInfo:v4 completion:&__block_literal_global_164];
}

void __47__AFSettingsConnection_startUIRequestWithInfo___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  BOOL v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    id v5 = "-[AFSettingsConnection startUIRequestWithInfo:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)startUIRequestWithText:(id)a3
{
  id v4 = a3;
  id v5 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:&__block_literal_global_156];
  [v5 startUIRequestWithText:v4 completion:&__block_literal_global_159];
}

void __47__AFSettingsConnection_startUIRequestWithText___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  BOOL v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    id v5 = "-[AFSettingsConnection startUIRequestWithText:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)startUIRequest:(id)a3
{
  if (a3)
  {
    -[AFSettingsConnection startUIRequestWithText:](self, "startUIRequestWithText:");
  }
  else
  {
    id v7 = objc_alloc_init(AFRequestInfo);
    int v4 = [[AFSpeechRequestOptions alloc] initWithActivationEvent:19];
    [(AFSpeechRequestOptions *)v4 setEndpointerOperationMode:3];
    [(AFRequestInfo *)v7 setSpeechRequestOptions:v4];
    if ([(AFSettingsConnection *)self _shouldSetTurnIdentifierForRequest])
    {
      id v5 = +[AFAnalyticsTurnBasedInstrumentationContext newTurnBasedContextWithPreviousTurnID:0];
      __int16 v6 = [v5 turnIdentifier];
      [(AFRequestInfo *)v7 setTurnIdentifier:v6];
    }
    [(AFSettingsConnection *)self startUIRequestWithInfo:v7];
  }
}

- (void)setVoiceTriggerEnabled:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __62__AFSettingsConnection_setVoiceTriggerEnabled_withCompletion___block_invoke;
  v12[3] = &unk_1E592B9A0;
  id v7 = v6;
  id v13 = v7;
  uint64_t v8 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v12];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __62__AFSettingsConnection_setVoiceTriggerEnabled_withCompletion___block_invoke_2;
  v10[3] = &unk_1E592B9A0;
  id v11 = v7;
  id v9 = v7;
  [v8 setVoiceTriggerEnabled:v4 withCompletion:v10];
}

uint64_t __62__AFSettingsConnection_setVoiceTriggerEnabled_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __62__AFSettingsConnection_setVoiceTriggerEnabled_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)isVoiceTriggerEnabled:(id)a3
{
  id v4 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __46__AFSettingsConnection_isVoiceTriggerEnabled___block_invoke;
  v10[3] = &unk_1E592B9A0;
  id v5 = v4;
  id v11 = v5;
  id v6 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v10];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __46__AFSettingsConnection_isVoiceTriggerEnabled___block_invoke_2;
  v8[3] = &unk_1E5928470;
  id v9 = v5;
  id v7 = v5;
  [v6 isVoiceTriggerEnabled:v8];
}

uint64_t __46__AFSettingsConnection_isVoiceTriggerEnabled___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __46__AFSettingsConnection_isVoiceTriggerEnabled___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)_shouldSetTurnIdentifierForRequest
{
  return 0;
}

- (void)setAllowJustSiriHomeKitSetting:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __70__AFSettingsConnection_setAllowJustSiriHomeKitSetting_withCompletion___block_invoke;
  v12[3] = &unk_1E592B9A0;
  id v7 = v6;
  id v13 = v7;
  uint64_t v8 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v12];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70__AFSettingsConnection_setAllowJustSiriHomeKitSetting_withCompletion___block_invoke_2;
  v10[3] = &unk_1E592B9A0;
  id v11 = v7;
  id v9 = v7;
  [v8 setAllowJustSiriHomeKitSetting:v4 withCompletion:v10];
}

uint64_t __70__AFSettingsConnection_setAllowJustSiriHomeKitSetting_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __70__AFSettingsConnection_setAllowJustSiriHomeKitSetting_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)isJustSiriEnabledInTheHome:(id)a3
{
  id v4 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __51__AFSettingsConnection_isJustSiriEnabledInTheHome___block_invoke;
  v10[3] = &unk_1E592B9A0;
  id v5 = v4;
  id v11 = v5;
  id v6 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v10];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__AFSettingsConnection_isJustSiriEnabledInTheHome___block_invoke_2;
  v8[3] = &unk_1E59283D0;
  id v9 = v5;
  id v7 = v5;
  [v6 isJustSiriEnabledInTheHome:v8];
}

uint64_t __51__AFSettingsConnection_isJustSiriEnabledInTheHome___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __51__AFSettingsConnection_isJustSiriEnabledInTheHome___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)availableLanguagesInTheHome:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      id v13 = "-[AFSettingsConnection availableLanguagesInTheHome:]";
      _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s Retrieving home accessories Siri languages", buf, 0xCu);
    }
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __52__AFSettingsConnection_availableLanguagesInTheHome___block_invoke;
    v10[3] = &unk_1E592B9A0;
    id v6 = v4;
    id v11 = v6;
    id v7 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v10];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __52__AFSettingsConnection_availableLanguagesInTheHome___block_invoke_2;
    v8[3] = &unk_1E5928360;
    id v9 = v6;
    [v7 availableLanguagesInTheHome:v8];
  }
}

uint64_t __52__AFSettingsConnection_availableLanguagesInTheHome___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __52__AFSettingsConnection_availableLanguagesInTheHome___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setRecognizeMyVoiceEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:&__block_literal_global_150];
  [v4 setRecognizeMyVoiceEnabled:v3];
}

void __51__AFSettingsConnection_setRecognizeMyVoiceEnabled___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  BOOL v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    id v5 = "-[AFSettingsConnection setRecognizeMyVoiceEnabled:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)getCurrentAccessoryInfoWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:&__block_literal_global_146];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __62__AFSettingsConnection_getCurrentAccessoryInfoWithCompletion___block_invoke_147;
    v6[3] = &unk_1E5928448;
    id v7 = v4;
    [v5 getCurrentAccessoryInfoWithCompletion:v6];
  }
}

uint64_t __62__AFSettingsConnection_getCurrentAccessoryInfoWithCompletion___block_invoke_147(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __62__AFSettingsConnection_getCurrentAccessoryInfoWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  BOOL v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    id v5 = "-[AFSettingsConnection getCurrentAccessoryInfoWithCompletion:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)setLanguage:(id)a3 outputVoice:(id)a4 withCompletion:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    id v20 = "-[AFSettingsConnection setLanguage:outputVoice:withCompletion:]";
    __int16 v21 = 2112;
    id v22 = v9;
    __int16 v23 = 2112;
    id v24 = v8;
    _os_log_impl(&dword_19CF1D000, v11, OS_LOG_TYPE_INFO, "%s Setting Siri output voice:%@ language code: %@", buf, 0x20u);
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __63__AFSettingsConnection_setLanguage_outputVoice_withCompletion___block_invoke;
  v17[3] = &unk_1E592B9A0;
  id v12 = v10;
  id v18 = v12;
  id v13 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v17];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __63__AFSettingsConnection_setLanguage_outputVoice_withCompletion___block_invoke_2;
  v15[3] = &unk_1E592AD48;
  id v16 = v12;
  id v14 = v12;
  [v13 setLanguage:v8 outputVoice:v9 withCompletion:v15];
}

uint64_t __63__AFSettingsConnection_setLanguage_outputVoice_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

void __63__AFSettingsConnection_setLanguage_outputVoice_withCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  CFPreferencesAppSynchronize(@"com.apple.assistant.backedup");
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v7, v5);
  }
}

- (void)setLanguage:(id)a3 outputVoice:(id)a4
{
}

- (void)setLanguage:(id)a3 withCompletion:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v17 = "-[AFSettingsConnection setLanguage:withCompletion:]";
    __int16 v18 = 2112;
    id v19 = v6;
    _os_log_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_INFO, "%s Setting Siri language code: %@", buf, 0x16u);
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __51__AFSettingsConnection_setLanguage_withCompletion___block_invoke;
  v14[3] = &unk_1E592B9A0;
  id v9 = v7;
  id v15 = v9;
  id v10 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v14];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __51__AFSettingsConnection_setLanguage_withCompletion___block_invoke_2;
  v12[3] = &unk_1E592C360;
  id v13 = v9;
  id v11 = v9;
  [v10 setLanguage:v6 withCompletion:v12];
}

uint64_t __51__AFSettingsConnection_setLanguage_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __51__AFSettingsConnection_setLanguage_withCompletion___block_invoke_2(uint64_t a1)
{
  CFPreferencesAppSynchronize(@"com.apple.assistant.backedup");
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    BOOL v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)setLanguage:(id)a3
{
}

- (void)setOutputVoice:(id)a3 withCompletion:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v16 = "-[AFSettingsConnection setOutputVoice:withCompletion:]";
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_INFO, "%s Setting Siri output voice: %@", buf, 0x16u);
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __54__AFSettingsConnection_setOutputVoice_withCompletion___block_invoke;
  v13[3] = &unk_1E592B9A0;
  id v14 = v7;
  id v9 = v7;
  id v10 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v13];
  id v11 = v10;
  if (v9) {
    id v12 = v9;
  }
  else {
    id v12 = &__block_literal_global_144_22280;
  }
  [v10 setOutputVoice:v6 withCompletion:v12];
}

uint64_t __54__AFSettingsConnection_setOutputVoice_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)setOutputVoice:(id)a3
{
}

- (void)getAvailableVoicesForLanguage:(id)a3 includeAssetInfo:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = (void (**)(id, void *))a5;
  id v10 = [(AFSettingsConnection *)self _voices];
  if (v10)
  {
    if (v9)
    {
      id v11 = [(AFSettingsConnection *)self _voices];
      id v12 = [(AFSettingsConnection *)self _filterVoices:v11 forLanguage:v8];
      v9[2](v9, v12);
    }
  }
  else
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __82__AFSettingsConnection_getAvailableVoicesForLanguage_includeAssetInfo_completion___block_invoke;
    v13[3] = &unk_1E592C598;
    id v15 = v9;
    void v13[4] = self;
    id v14 = v8;
    [(AFSettingsConnection *)self _updateVoicesIncludingAssetInfo:v6 completion:v13];
  }
}

void __82__AFSettingsConnection_getAvailableVoicesForLanguage_includeAssetInfo_completion___block_invoke(void *a1)
{
  uint64_t v1 = a1[6];
  if (v1)
  {
    BOOL v3 = (void *)a1[4];
    id v5 = [v3 _voices];
    int v4 = [v3 _filterVoices:v5 forLanguage:a1[5]];
    (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v4);
  }
}

- (void)setSpeechProfileExternalOfflineModelRootPath:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v6];
  [v8 setSpeechProfileExternalOfflineModelRootPath:v7 completion:v6];
}

- (void)setOfflineDictationProfileOverridePath:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v6];
  [v8 setOfflineDictationProfileOverridePath:v7 completion:v6];
}

- (void)createOfflineSpeechProfileWithLanguage:(id)a3 modelOverridePath:(id)a4 JSONData:(id)a5 completion:(id)a6
{
  id v10 = a6;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __101__AFSettingsConnection_createOfflineSpeechProfileWithLanguage_modelOverridePath_JSONData_completion___block_invoke;
  v16[3] = &unk_1E592B9A0;
  id v17 = v10;
  id v11 = v10;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v16];
  [v15 createOfflineSpeechProfileWithLanguage:v14 modelOverridePath:v13 JSONData:v12 completion:v11];
}

uint64_t __101__AFSettingsConnection_createOfflineSpeechProfileWithLanguage_modelOverridePath_JSONData_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)getOfflineDictationStatusWithCompletion:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__AFSettingsConnection_getOfflineDictationStatusWithCompletion___block_invoke;
  v7[3] = &unk_1E592B9A0;
  id v8 = v4;
  id v5 = v4;
  id v6 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v7];
  [v6 getOfflineDictationStatusWithCompletion:v5];
}

uint64_t __64__AFSettingsConnection_getOfflineDictationStatusWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getOfflineAssistantStatusWithCompletion:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__AFSettingsConnection_getOfflineAssistantStatusWithCompletion___block_invoke;
  v7[3] = &unk_1E592B9A0;
  id v8 = v4;
  id v5 = v4;
  id v6 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v7];
  [v6 getOfflineAssistantStatusWithCompletion:v5];
}

uint64_t __64__AFSettingsConnection_getOfflineAssistantStatusWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getAvailableVoicesForSynthesisLanguage:(id)a3 completion:(id)a4
{
}

- (void)getAvailableVoicesForRecognitionLanguage:(id)a3 includeAssetInfo:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  if (a3)
  {
    AFOutputVoiceLanguageForRecognitionLanguage(a3);
    a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  [(AFSettingsConnection *)self getAvailableVoicesForLanguage:a3 includeAssetInfo:v5 completion:v8];
}

- (void)getAvailableVoicesForRecognitionLanguage:(id)a3 completion:(id)a4
{
}

- (void)_updateVoicesIncludingAssetInfo:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __67__AFSettingsConnection__updateVoicesIncludingAssetInfo_completion___block_invoke;
  v12[3] = &unk_1E592B9A0;
  id v7 = v6;
  id v13 = v7;
  id v8 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v12];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67__AFSettingsConnection__updateVoicesIncludingAssetInfo_completion___block_invoke_2;
  v10[3] = &unk_1E592C008;
  void v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  [v8 getAvailableVoicesIncludingAssetInfo:v4 completion:v10];
}

uint64_t __67__AFSettingsConnection__updateVoicesIncludingAssetInfo_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __67__AFSettingsConnection__updateVoicesIncludingAssetInfo_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) _setVoices:a2];
  BOOL v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

- (id)_filterVoices:(id)a3 forLanguage:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          id v14 = objc_msgSend(v13, "languageCode", (void)v17);
          int v15 = [v6 isEqualToString:v14];

          if (v15) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v10);
    }
  }
  else
  {
    id v7 = v5;
  }

  return v7;
}

- (id)_voices
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__22201;
  uint64_t v10 = __Block_byref_object_dispose__22202;
  id v11 = 0;
  voicesQueue = self->_voicesQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __31__AFSettingsConnection__voices__block_invoke;
  v5[3] = &unk_1E592C6C0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(voicesQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __31__AFSettingsConnection__voices__block_invoke(uint64_t a1)
{
}

- (void)_setVoices:(id)a3
{
  id v4 = a3;
  voicesQueue = self->_voicesQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__AFSettingsConnection__setVoices___block_invoke;
  v7[3] = &unk_1E592C710;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(voicesQueue, v7);
}

void __35__AFSettingsConnection__setVoices___block_invoke(uint64_t a1)
{
}

- (void)getAudioSessionCoordinationSnapshotWithCompletion:(id)a3
{
  id v4 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __74__AFSettingsConnection_getAudioSessionCoordinationSnapshotWithCompletion___block_invoke;
  v10[3] = &unk_1E592B9A0;
  id v5 = v4;
  id v11 = v5;
  id v6 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v10];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __74__AFSettingsConnection_getAudioSessionCoordinationSnapshotWithCompletion___block_invoke_2;
  v8[3] = &unk_1E5928420;
  id v9 = v5;
  id v7 = v5;
  [v6 getAudioSessionCoordinationSnapshotWithCompletion:v8];
}

uint64_t __74__AFSettingsConnection_getAudioSessionCoordinationSnapshotWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

uint64_t __74__AFSettingsConnection_getAudioSessionCoordinationSnapshotWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, a2, 0);
  }
  return result;
}

- (void)currectNWActivityId:(id)a3
{
  id v4 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __44__AFSettingsConnection_currectNWActivityId___block_invoke;
  v10[3] = &unk_1E592B9A0;
  id v5 = v4;
  id v11 = v5;
  id v6 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v10];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__AFSettingsConnection_currectNWActivityId___block_invoke_140;
  v8[3] = &unk_1E59283F8;
  id v9 = v5;
  id v7 = v5;
  [v6 getCurrentNWActivityIDWithCompletion:v8];
}

void __44__AFSettingsConnection_currectNWActivityId___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    id v7 = "-[AFSettingsConnection currectNWActivityId:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

uint64_t __44__AFSettingsConnection_currectNWActivityId___block_invoke_140(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)homeOnboardingFlowInvoked:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__AFSettingsConnection_homeOnboardingFlowInvoked_completion___block_invoke;
  v9[3] = &unk_1E592B9A0;
  id v10 = v6;
  id v7 = v6;
  __int16 v8 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v9];
  [v8 homeOnboardingFlowInvoked:v4 completion:v7];
}

void __61__AFSettingsConnection_homeOnboardingFlowInvoked_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    id v7 = "-[AFSettingsConnection homeOnboardingFlowInvoked:completion:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)fetchMultiUserVoiceIdentificationSetting:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__AFSettingsConnection_fetchMultiUserVoiceIdentificationSetting___block_invoke;
  v7[3] = &unk_1E592B9A0;
  id v8 = v4;
  id v5 = v4;
  int v6 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v7];
  [v6 fetchMultiUserVoiceIdentificationSetting:v5];
}

void __65__AFSettingsConnection_fetchMultiUserVoiceIdentificationSetting___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315394;
    int v6 = "-[AFSettingsConnection fetchMultiUserVoiceIdentificationSetting:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v5, 0x16u);
    if (!v3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (v3) {
LABEL_3:
  }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
LABEL_4:
}

- (void)clearOpportuneSpeakingEdgeDetectorSignalOverride
{
  id v2 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:&__block_literal_global_139];
  [v2 clearOpportuneSpeakingEdgeDetectorSignalOverride];
}

void __72__AFSettingsConnection_clearOpportuneSpeakingEdgeDetectorSignalOverride__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    int v5 = "-[AFSettingsConnection clearOpportuneSpeakingEdgeDetectorSignalOverride]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)setOpportuneSpeakingEdgeDetectorSignalOverride:(int64_t)a3
{
  id v4 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:&__block_literal_global_137];
  [v4 setOpportuneSpeakingEdgeDetectorSignalOverride:a3];
}

void __71__AFSettingsConnection_setOpportuneSpeakingEdgeDetectorSignalOverride___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    int v5 = "-[AFSettingsConnection setOpportuneSpeakingEdgeDetectorSignalOverride:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)clearShowAppsBehindSiriInCarPlayEnabled
{
  id v2 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:&__block_literal_global_135];
  [v2 clearShowAppsBehindSiriInCarPlayEnabled];
}

void __63__AFSettingsConnection_clearShowAppsBehindSiriInCarPlayEnabled__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    int v5 = "-[AFSettingsConnection clearShowAppsBehindSiriInCarPlayEnabled]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)setShowAppsBehindSiriInCarPlayEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:&__block_literal_global_133];
  [v4 setShowAppsBehindSiriInCarPlayEnabled:v3];
}

void __62__AFSettingsConnection_setShowAppsBehindSiriInCarPlayEnabled___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  BOOL v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    int v5 = "-[AFSettingsConnection setShowAppsBehindSiriInCarPlayEnabled:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)getShowAppsBehindSiriInCarPlayEnabledWithCompletion:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __76__AFSettingsConnection_getShowAppsBehindSiriInCarPlayEnabledWithCompletion___block_invoke;
  v7[3] = &unk_1E592B9A0;
  id v8 = v4;
  id v5 = v4;
  __int16 v6 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v7];
  [v6 getShowAppsBehindSiriInCarPlayEnabledWithCompletion:v5];
}

void __76__AFSettingsConnection_getShowAppsBehindSiriInCarPlayEnabledWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    id v7 = "-[AFSettingsConnection getShowAppsBehindSiriInCarPlayEnabledWithCompletion:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
  }
}

- (void)clearMessageWithoutConfirmationHeadphonesEnabled
{
  id v2 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:&__block_literal_global_131];
  [v2 clearMessageWithoutConfirmationHeadphonesEnabled];
}

void __72__AFSettingsConnection_clearMessageWithoutConfirmationHeadphonesEnabled__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    uint64_t v5 = "-[AFSettingsConnection clearMessageWithoutConfirmationHeadphonesEnabled]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)setMessageWithoutConfirmationHeadphonesEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:&__block_literal_global_129_22294];
  [v4 setMessageWithoutConfirmationHeadphonesEnabled:v3];
}

void __71__AFSettingsConnection_setMessageWithoutConfirmationHeadphonesEnabled___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  BOOL v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    uint64_t v5 = "-[AFSettingsConnection setMessageWithoutConfirmationHeadphonesEnabled:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)getMessageWithoutConfirmationHeadphonesEnabledWithCompletion:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __85__AFSettingsConnection_getMessageWithoutConfirmationHeadphonesEnabledWithCompletion___block_invoke;
  v7[3] = &unk_1E592B9A0;
  id v8 = v4;
  id v5 = v4;
  __int16 v6 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v7];
  [v6 getMessageWithoutConfirmationHeadphonesEnabledWithCompletion:v5];
}

void __85__AFSettingsConnection_getMessageWithoutConfirmationHeadphonesEnabledWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    id v7 = "-[AFSettingsConnection getMessageWithoutConfirmationHeadphonesEnabledWithCompletion:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
  }
}

- (void)clearMessageWithoutConfirmationInCarPlayEnabled
{
  id v2 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:&__block_literal_global_127];
  [v2 clearMessageWithoutConfirmationInCarPlayEnabled];
}

void __71__AFSettingsConnection_clearMessageWithoutConfirmationInCarPlayEnabled__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    uint64_t v5 = "-[AFSettingsConnection clearMessageWithoutConfirmationInCarPlayEnabled]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)setMessageWithoutConfirmationInCarPlayEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:&__block_literal_global_125];
  [v4 setMessageWithoutConfirmationInCarPlayEnabled:v3];
}

void __70__AFSettingsConnection_setMessageWithoutConfirmationInCarPlayEnabled___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  BOOL v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    uint64_t v5 = "-[AFSettingsConnection setMessageWithoutConfirmationInCarPlayEnabled:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)getMessageWithoutConfirmationInCarPlayEnabledWithCompletion:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __84__AFSettingsConnection_getMessageWithoutConfirmationInCarPlayEnabledWithCompletion___block_invoke;
  v7[3] = &unk_1E592B9A0;
  id v8 = v4;
  id v5 = v4;
  __int16 v6 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v7];
  [v6 getMessageWithoutConfirmationInCarPlayEnabledWithCompletion:v5];
}

void __84__AFSettingsConnection_getMessageWithoutConfirmationInCarPlayEnabledWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    id v7 = "-[AFSettingsConnection getMessageWithoutConfirmationInCarPlayEnabledWithCompletion:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
  }
}

- (void)clearMessageWithoutConfirmationEnabled
{
  id v2 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:&__block_literal_global_123_22301];
  [v2 clearMessageWithoutConfirmationEnabled];
}

void __62__AFSettingsConnection_clearMessageWithoutConfirmationEnabled__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    uint64_t v5 = "-[AFSettingsConnection clearMessageWithoutConfirmationEnabled]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)setMessageWithoutConfirmationEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:&__block_literal_global_121];
  [v4 setMessageWithoutConfirmationEnabled:v3];
}

void __61__AFSettingsConnection_setMessageWithoutConfirmationEnabled___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  BOOL v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    uint64_t v5 = "-[AFSettingsConnection setMessageWithoutConfirmationEnabled:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)getMessageWithoutConfirmationEnabledWithCompletion:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __75__AFSettingsConnection_getMessageWithoutConfirmationEnabledWithCompletion___block_invoke;
  v7[3] = &unk_1E592B9A0;
  id v8 = v4;
  id v5 = v4;
  __int16 v6 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v7];
  [v6 getMessageWithoutConfirmationEnabledWithCompletion:v5];
}

void __75__AFSettingsConnection_getMessageWithoutConfirmationEnabledWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    id v7 = "-[AFSettingsConnection getMessageWithoutConfirmationEnabledWithCompletion:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
  }
}

- (void)fetchCurrentlyRoutedHeadphonesCBUUIDWithCompletion:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __75__AFSettingsConnection_fetchCurrentlyRoutedHeadphonesCBUUIDWithCompletion___block_invoke;
  v7[3] = &unk_1E592B9A0;
  id v8 = v4;
  id v5 = v4;
  int v6 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v7];
  [v6 fetchCurrentlyRoutedHeadphonesCBUUIDWithCompletion:v5];
}

void __75__AFSettingsConnection_fetchCurrentlyRoutedHeadphonesCBUUIDWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    id v7 = "-[AFSettingsConnection fetchCurrentlyRoutedHeadphonesCBUUIDWithCompletion:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
  }
}

- (void)setAnnounceNotificationsOnBuiltInSpeakerEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:&__block_literal_global_119];
  [v4 setAnnounceNotificationsOnBuiltInSpeakerEnabled:v3];
}

void __72__AFSettingsConnection_setAnnounceNotificationsOnBuiltInSpeakerEnabled___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  BOOL v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    uint64_t v5 = "-[AFSettingsConnection setAnnounceNotificationsOnBuiltInSpeakerEnabled:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)updateAnnounceNotificationsOnHearingAidSupportedStatus
{
  id v2 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:&__block_literal_global_117];
  [v2 updateAnnounceNotificationsOnHearingAidSupportedStatus];
}

void __78__AFSettingsConnection_updateAnnounceNotificationsOnHearingAidSupportedStatus__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  BOOL v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    uint64_t v5 = "-[AFSettingsConnection updateAnnounceNotificationsOnHearingAidSupportedStatus]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)setAnnounceNotificationsOnHearingAidsSupported:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:&__block_literal_global_115_22309];
  [v4 setAnnounceNotificationsOnHearingAidsSupported:v3];
}

void __71__AFSettingsConnection_setAnnounceNotificationsOnHearingAidsSupported___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  BOOL v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    uint64_t v5 = "-[AFSettingsConnection setAnnounceNotificationsOnHearingAidsSupported:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)setAnnounceNotificationsOnHearingAidsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:&__block_literal_global_113];
  [v4 setAnnounceNotificationsOnHearingAidsEnabled:v3];
}

void __69__AFSettingsConnection_setAnnounceNotificationsOnHearingAidsEnabled___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  BOOL v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    uint64_t v5 = "-[AFSettingsConnection setAnnounceNotificationsOnHearingAidsEnabled:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)clearAnnounceNotificationsInCarPlayType
{
  id v2 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:&__block_literal_global_111];
  [v2 clearAnnounceNotificationsInCarPlayType];
}

void __63__AFSettingsConnection_clearAnnounceNotificationsInCarPlayType__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  BOOL v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    uint64_t v5 = "-[AFSettingsConnection clearAnnounceNotificationsInCarPlayType]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)setAnnounceNotificationsInCarPlayType:(int64_t)a3
{
  id v4 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:&__block_literal_global_109_22315];
  [v4 setAnnounceNotificationsInCarPlayType:a3];
}

void __62__AFSettingsConnection_setAnnounceNotificationsInCarPlayType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  BOOL v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    uint64_t v5 = "-[AFSettingsConnection setAnnounceNotificationsInCarPlayType:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)getAnnounceNotificationsInCarPlayTypeWithCompletion:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __76__AFSettingsConnection_getAnnounceNotificationsInCarPlayTypeWithCompletion___block_invoke;
  v7[3] = &unk_1E592B9A0;
  id v8 = v4;
  id v5 = v4;
  __int16 v6 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v7];
  [v6 getAnnounceNotificationsInCarPlayTypeWithCompletion:v5];
}

void __76__AFSettingsConnection_getAnnounceNotificationsInCarPlayTypeWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    id v7 = "-[AFSettingsConnection getAnnounceNotificationsInCarPlayTypeWithCompletion:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
  }
}

- (void)clearAnnounceNotificationsInCarPlayTemporarilyDisabled
{
  id v2 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:&__block_literal_global_107];
  [v2 clearAnnounceNotificationsInCarPlayTemporarilyDisabled];
}

void __78__AFSettingsConnection_clearAnnounceNotificationsInCarPlayTemporarilyDisabled__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    uint64_t v5 = "-[AFSettingsConnection clearAnnounceNotificationsInCarPlayTemporarilyDisabled]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)getAnnounceNotificationsInCarPlayTemporarilyDisabledWithCompletion:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __91__AFSettingsConnection_getAnnounceNotificationsInCarPlayTemporarilyDisabledWithCompletion___block_invoke;
  v7[3] = &unk_1E592B9A0;
  id v8 = v4;
  id v5 = v4;
  __int16 v6 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v7];
  [v6 getAnnounceNotificationsInCarPlayTemporarilyDisabledWithCompletion:v5];
}

void __91__AFSettingsConnection_getAnnounceNotificationsInCarPlayTemporarilyDisabledWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    id v7 = "-[AFSettingsConnection getAnnounceNotificationsInCarPlayTemporarilyDisabledWithCompletion:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, 1);
  }
}

- (void)setAnnounceNotificationsInCarPlayTemporarilyDisabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:&__block_literal_global_105];
  [v4 setAnnounceNotificationsInCarPlayTemporarilyDisabled:v3];
}

void __77__AFSettingsConnection_setAnnounceNotificationsInCarPlayTemporarilyDisabled___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  BOOL v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    uint64_t v5 = "-[AFSettingsConnection setAnnounceNotificationsInCarPlayTemporarilyDisabled:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)setAnnounceNotificationsTemporarilyDisabledUntil:(id)a3 forApp:(id)a4 platform:(int64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:&__block_literal_global_103_22322];
  [v10 setAnnounceNotificationsTemporarilyDisabledUntil:v9 forApp:v8 platform:a5];
}

void __89__AFSettingsConnection_setAnnounceNotificationsTemporarilyDisabledUntil_forApp_platform___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  BOOL v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    uint64_t v5 = "-[AFSettingsConnection setAnnounceNotificationsTemporarilyDisabledUntil:forApp:platform:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)getAnnounceNotificationsTemporarilyDisabledEndDateForApp:(id)a3 platform:(int64_t)a4 completion:(id)a5
{
  id v8 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __101__AFSettingsConnection_getAnnounceNotificationsTemporarilyDisabledEndDateForApp_platform_completion___block_invoke;
  v12[3] = &unk_1E592B9A0;
  id v13 = v8;
  id v9 = v8;
  id v10 = a3;
  id v11 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v12];
  [v11 getAnnounceNotificationsTemporarilyDisabledEndDateForApp:v10 platform:a4 completion:v9];
}

void __101__AFSettingsConnection_getAnnounceNotificationsTemporarilyDisabledEndDateForApp_platform_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    id v7 = "-[AFSettingsConnection getAnnounceNotificationsTemporarilyDisabledEndDateForApp:platform:completion:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
  }
}

- (void)setAnnounceNotificationsTemporarilyDisabledUntil:(id)a3 platform:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:&__block_literal_global_101_22326];
  [v7 setAnnounceNotificationsTemporarilyDisabledUntil:v6 platform:a4];
}

void __82__AFSettingsConnection_setAnnounceNotificationsTemporarilyDisabledUntil_platform___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    uint64_t v5 = "-[AFSettingsConnection setAnnounceNotificationsTemporarilyDisabledUntil:platform:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)getAnnounceNotificationsTemporarilyDisabledEndDateForPlatform:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __97__AFSettingsConnection_getAnnounceNotificationsTemporarilyDisabledEndDateForPlatform_completion___block_invoke;
  v9[3] = &unk_1E592B9A0;
  id v10 = v6;
  id v7 = v6;
  uint64_t v8 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v9];
  [v8 getAnnounceNotificationsTemporarilyDisabledEndDateForPlatform:a3 completion:v7];
}

void __97__AFSettingsConnection_getAnnounceNotificationsTemporarilyDisabledEndDateForPlatform_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    id v7 = "-[AFSettingsConnection getAnnounceNotificationsTemporarilyDisabledEndDateForPlatform:completion:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
  }
}

- (void)setSpokenNotificationProxCardSeen:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:&__block_literal_global_99];
  [v4 setSpokenNotificationProxCardSeen:v3];
}

void __58__AFSettingsConnection_setSpokenNotificationProxCardSeen___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  BOOL v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    uint64_t v5 = "-[AFSettingsConnection setSpokenNotificationProxCardSeen:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)setSpokenNotificationShouldSkipTriggerlessReplies:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:&__block_literal_global_97];
  [v4 setSpokenNotificationShouldSkipTriggerlessReplies:v3];
}

void __74__AFSettingsConnection_setSpokenNotificationShouldSkipTriggerlessReplies___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  BOOL v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    uint64_t v5 = "-[AFSettingsConnection setSpokenNotificationShouldSkipTriggerlessReplies:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)getSpokenNotificationShouldSkipTriggerlessRepliesWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:&__block_literal_global_95];
  [v5 getSpokenNotificationShouldSkipTriggerlessRepliesWithCompletion:v4];
}

void __88__AFSettingsConnection_getSpokenNotificationShouldSkipTriggerlessRepliesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  BOOL v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    id v5 = "-[AFSettingsConnection getSpokenNotificationShouldSkipTriggerlessRepliesWithCompletion:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)setSpokenNotificationShouldAnnounceAllNotifications:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:&__block_literal_global_93_22333];
  [v4 setSpokenNotificationShouldAnnounceAllNotifications:v3];
}

void __76__AFSettingsConnection_setSpokenNotificationShouldAnnounceAllNotifications___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  BOOL v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    id v5 = "-[AFSettingsConnection setSpokenNotificationShouldAnnounceAllNotifications:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)getSpokenNotificationShouldAnnounceAllNotificationsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:&__block_literal_global_91_22336];
  [v5 getSpokenNotificationShouldAnnounceAllNotificationsWithCompletion:v4];
}

void __90__AFSettingsConnection_getSpokenNotificationShouldAnnounceAllNotificationsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  BOOL v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    id v5 = "-[AFSettingsConnection getSpokenNotificationShouldAnnounceAllNotificationsWithCompletion:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)setSpokenNotificationIsAlwaysOpportune:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:&__block_literal_global_89];
  [v4 setSpokenNotificationIsAlwaysOpportune:v3];
}

void __63__AFSettingsConnection_setSpokenNotificationIsAlwaysOpportune___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  BOOL v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    id v5 = "-[AFSettingsConnection setSpokenNotificationIsAlwaysOpportune:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)getSpokenNotificationIsAlwaysOpportuneWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:&__block_literal_global_87];
  [v5 getSpokenNotificationIsAlwaysOpportuneWithCompletion:v4];
}

void __77__AFSettingsConnection_getSpokenNotificationIsAlwaysOpportuneWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  BOOL v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    id v5 = "-[AFSettingsConnection getSpokenNotificationIsAlwaysOpportuneWithCompletion:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)getHeadGesturesForCurrentlyRoutedDevice:(id)a3
{
  id v4 = a3;
  id v5 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:&__block_literal_global_85_22341];
  [v5 getHeadGesturesForCurrentlyRoutedDevice:v4];
}

void __64__AFSettingsConnection_getHeadGesturesForCurrentlyRoutedDevice___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  BOOL v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    id v5 = "-[AFSettingsConnection getHeadGesturesForCurrentlyRoutedDevice:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)setHeadGesturesForCurrentlyRoutedDevice:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:&__block_literal_global_83];
  [v7 setHeadGesturesForCurrentlyRoutedDevice:v4 withCompletion:v6];
}

void __79__AFSettingsConnection_setHeadGesturesForCurrentlyRoutedDevice_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  BOOL v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    id v5 = "-[AFSettingsConnection setHeadGesturesForCurrentlyRoutedDevice:withCompletion:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)getPersonalVolumeForCurrentlyRoutedDevice:(id)a3
{
  id v4 = a3;
  id v5 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:&__block_literal_global_81];
  [v5 getPersonalVolumeForCurrentlyRoutedDevice:v4];
}

void __66__AFSettingsConnection_getPersonalVolumeForCurrentlyRoutedDevice___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  BOOL v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    id v5 = "-[AFSettingsConnection getPersonalVolumeForCurrentlyRoutedDevice:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)setPersonalVolumeForCurrentlyRoutedDevice:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:&__block_literal_global_79];
  [v7 setPersonalVolumeForCurrentlyRoutedDevice:v4 withCompletion:v6];
}

void __81__AFSettingsConnection_setPersonalVolumeForCurrentlyRoutedDevice_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  BOOL v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    id v5 = "-[AFSettingsConnection setPersonalVolumeForCurrentlyRoutedDevice:withCompletion:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)getConversationAwarenessForCurrentlyRoutedDevice:(id)a3
{
  id v4 = a3;
  id v5 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:&__block_literal_global_77];
  [v5 getConversationAwarenessForCurrentlyRoutedDevice:v4];
}

void __73__AFSettingsConnection_getConversationAwarenessForCurrentlyRoutedDevice___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  BOOL v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    id v5 = "-[AFSettingsConnection getConversationAwarenessForCurrentlyRoutedDevice:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)setConversationAwarenessForCurrentlyRoutedDevice:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:&__block_literal_global_75];
  [v7 setConversationAwarenessForCurrentlyRoutedDevice:v4 withCompletion:v6];
}

void __88__AFSettingsConnection_setConversationAwarenessForCurrentlyRoutedDevice_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  BOOL v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    id v5 = "-[AFSettingsConnection setConversationAwarenessForCurrentlyRoutedDevice:withCompletion:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)clearSpokenNotificationTemporarilyDisabledStatus
{
  id v2 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:&__block_literal_global_73_22349];
  [v2 clearSpokenNotificationTemporarilyDisabledStatus];
}

void __72__AFSettingsConnection_clearSpokenNotificationTemporarilyDisabledStatus__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  BOOL v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    id v5 = "-[AFSettingsConnection clearSpokenNotificationTemporarilyDisabledStatus]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)forceMultiUserSync:(BOOL)a3 download:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = v8;
  if (v8)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __63__AFSettingsConnection_forceMultiUserSync_download_completion___block_invoke;
    v14[3] = &unk_1E592B9A0;
    id v10 = v8;
    id v15 = v10;
    id v11 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v14];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __63__AFSettingsConnection_forceMultiUserSync_download_completion___block_invoke_70;
    v12[3] = &unk_1E59283D0;
    id v13 = v10;
    [v11 forceMultiUserSync:v6 download:v5 completion:v12];
  }
}

void __63__AFSettingsConnection_forceMultiUserSync_download_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315394;
    BOOL v6 = "-[AFSettingsConnection forceMultiUserSync:download:completion:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v5, 0x16u);
    if (!v3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (v3) {
LABEL_3:
  }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
LABEL_4:
}

uint64_t __63__AFSettingsConnection_forceMultiUserSync_download_completion___block_invoke_70(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)configOverrides:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    int v5 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:&__block_literal_global_67];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __40__AFSettingsConnection_configOverrides___block_invoke_68;
    v6[3] = &unk_1E59283A8;
    id v7 = v4;
    [v5 configOverrides:v6];
  }
}

uint64_t __40__AFSettingsConnection_configOverrides___block_invoke_68(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __40__AFSettingsConnection_configOverrides___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    int v5 = "-[AFSettingsConnection configOverrides:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)setConfigOverrides:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __54__AFSettingsConnection_setConfigOverrides_completion___block_invoke;
  v10[3] = &unk_1E592B9A0;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  uint64_t v9 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v10];
  [v9 setConfigOverrides:v8 completion:v7];
}

void __54__AFSettingsConnection_setConfigOverrides_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    id v7 = "-[AFSettingsConnection setConfigOverrides:completion:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(void))(v5 + 16))();
  }
}

- (void)getDevicesWithAvailablePHSAssetsOnDeviceCheck:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __70__AFSettingsConnection_getDevicesWithAvailablePHSAssetsOnDeviceCheck___block_invoke;
    v8[3] = &unk_1E592B9A0;
    id v6 = v4;
    id v9 = v6;
    id v7 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v8];
    [v7 getDevicesWithAvailablePHSAssetsOnDeviceCheck:v6];
  }
}

void __70__AFSettingsConnection_getDevicesWithAvailablePHSAssetsOnDeviceCheck___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    id v7 = "-[AFSettingsConnection getDevicesWithAvailablePHSAssetsOnDeviceCheck:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)getDevicesWithAvailablePHSAssetsForLanguage:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __79__AFSettingsConnection_getDevicesWithAvailablePHSAssetsForLanguage_completion___block_invoke;
    v11[3] = &unk_1E592B9A0;
    id v8 = v6;
    id v12 = v8;
    id v9 = a3;
    uint64_t v10 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v11];
    [v10 getDevicesWithAvailablePHSAssetsForLanguage:v9 completion:v8];
  }
}

void __79__AFSettingsConnection_getDevicesWithAvailablePHSAssetsForLanguage_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    id v7 = "-[AFSettingsConnection getDevicesWithAvailablePHSAssetsForLanguage:completion:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
  }
}

- (void)disableAndDeleteCloudSyncWithCompletion:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __64__AFSettingsConnection_disableAndDeleteCloudSyncWithCompletion___block_invoke;
  v9[3] = &unk_1E592B9A0;
  id v10 = v4;
  id v5 = v4;
  int v6 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v9];
  id v7 = v6;
  if (v5) {
    __int16 v8 = v5;
  }
  else {
    __int16 v8 = &__block_literal_global_62;
  }
  [v6 disableAndDeleteCloudSyncWithCompletion:v8];
}

void __64__AFSettingsConnection_disableAndDeleteCloudSyncWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    id v7 = "-[AFSettingsConnection disableAndDeleteCloudSyncWithCompletion:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)barrier
{
  id v2 = [(AFSettingsConnection *)self _synchronousSettingsServiceWithErrorHandler:&__block_literal_global_56];
  [v2 barrierWithReply:&__block_literal_global_59];
}

void __31__AFSettingsConnection_barrier__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    uint64_t v5 = "-[AFSettingsConnection barrier]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)resetSessionsAtNextRequestBoundary
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315138;
    __int16 v6 = "-[AFSettingsConnection resetSessionsAtNextRequestBoundary]";
    _os_log_debug_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v5, 0xCu);
  }
  int v4 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:&__block_literal_global_54_22360];
  [v4 _resetSessionsAtNextRequestBoundary];
}

void __58__AFSettingsConnection_resetSessionsAtNextRequestBoundary__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    int v5 = "-[AFSettingsConnection resetSessionsAtNextRequestBoundary]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)shutdownSessionIfIdle
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315138;
    __int16 v6 = "-[AFSettingsConnection shutdownSessionIfIdle]";
    _os_log_debug_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v5, 0xCu);
  }
  int v4 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:&__block_literal_global_52];
  [v4 _shutdownSessionIfIdle];
}

void __45__AFSettingsConnection_shutdownSessionIfIdle__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    int v5 = "-[AFSettingsConnection shutdownSessionIfIdle]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)killDaemon
{
  id v2 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:&__block_literal_global_50];
  [v2 _killDaemon];
}

void __34__AFSettingsConnection_killDaemon__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    int v5 = "-[AFSettingsConnection killDaemon]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)setAssistantLoggingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:&__block_literal_global_48_22366];
  [v4 setEnableAssistantLogging:v3];
}

void __51__AFSettingsConnection_setAssistantLoggingEnabled___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  BOOL v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    int v5 = "-[AFSettingsConnection setAssistantLoggingEnabled:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)suppressLowStorageNotificationForLanguage:(id)a3 suppress:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:&__block_literal_global_46];
  [v7 suppressLowStorageNotificationForLanguage:v6 suppress:v4];
}

void __75__AFSettingsConnection_suppressLowStorageNotificationForLanguage_suppress___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  BOOL v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    int v5 = "-[AFSettingsConnection suppressLowStorageNotificationForLanguage:suppress:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)setDictationAutoPunctuationEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:&__block_literal_global_44_22370];
  [v4 setDictationAutoPunctuationEnabled:v3];
}

void __59__AFSettingsConnection_setDictationAutoPunctuationEnabled___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  BOOL v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    int v5 = "-[AFSettingsConnection setDictationAutoPunctuationEnabled:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)setDictationEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:&__block_literal_global_42_22373];
  [v4 setDictationEnabled:v3];
}

void __44__AFSettingsConnection_setDictationEnabled___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  BOOL v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    int v5 = "-[AFSettingsConnection setDictationEnabled:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)setAssistantEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:&__block_literal_global_40];
  [v4 setAssistantEnabled:v3];
}

void __44__AFSettingsConnection_setAssistantEnabled___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  BOOL v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    int v5 = "-[AFSettingsConnection setAssistantEnabled:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)setActiveAccountIdentifier:(id)a3
{
  id v7 = a3;
  if (!v7)
  {
    __int16 v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"AFSettingsConnection.m" lineNumber:263 description:@"Need an identifier to set active"];
  }
  int v5 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:&__block_literal_global_38_22380];
  [v5 setActiveAccountIdentifier:v7];
}

void __51__AFSettingsConnection_setActiveAccountIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  BOOL v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    int v5 = "-[AFSettingsConnection setActiveAccountIdentifier:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)deleteAccountWithIdentifier:(id)a3
{
  id v7 = a3;
  if (!v7)
  {
    __int16 v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"AFSettingsConnection.m" lineNumber:258 description:@"Need an identifier to delete"];
  }
  int v5 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:&__block_literal_global_33];
  [v5 deleteAccountWithIdentifier:v7];
}

void __52__AFSettingsConnection_deleteAccountWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  BOOL v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    int v5 = "-[AFSettingsConnection deleteAccountWithIdentifier:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)saveAccount:(id)a3 setActive:(BOOL)a4
{
  BOOL v4 = a4;
  id v10 = a3;
  if (!v10)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"AFSettingsConnection.m" lineNumber:253 description:@"Need an account to save"];
  }
  id v7 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:&__block_literal_global_22392];
  uint64_t v8 = [v10 messageDictionary];
  [v7 saveAccountWithMessageDictionary:v8 setActive:v4];
}

void __46__AFSettingsConnection_saveAccount_setActive___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  BOOL v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    int v5 = "-[AFSettingsConnection saveAccount:setActive:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (id)accounts
{
  uint64_t v5 = 0;
  __int16 v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__22201;
  id v9 = __Block_byref_object_dispose__22202;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __32__AFSettingsConnection_accounts__block_invoke;
  v4[3] = &unk_1E5928918;
  v4[4] = &v5;
  [(AFSettingsConnection *)self fetchAccountsSynchronously:1 completion:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __32__AFSettingsConnection_accounts__block_invoke(uint64_t a1, void *a2)
{
}

- (void)fetchActiveAccount:(id)a3
{
  id v4 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __43__AFSettingsConnection_fetchActiveAccount___block_invoke;
  v10[3] = &unk_1E592B9A0;
  id v5 = v4;
  id v11 = v5;
  __int16 v6 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v10];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__AFSettingsConnection_fetchActiveAccount___block_invoke_19;
  v8[3] = &unk_1E592AD48;
  id v9 = v5;
  id v7 = v5;
  [v6 fetchActiveAccount:v8];
}

void __43__AFSettingsConnection_fetchActiveAccount___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    id v7 = "-[AFSettingsConnection fetchActiveAccount:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

void __43__AFSettingsConnection_fetchActiveAccount___block_invoke_19(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (v8) {
    int v6 = [[AFAccount alloc] initWithMessageDictionary:v8];
  }
  else {
    int v6 = 0;
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, AFAccount *, id))(v7 + 16))(v7, v6, v5);
  }
}

- (void)fetchAccountsWithCompletion:(id)a3
{
}

- (void)fetchAccountsSynchronously:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  if (v4)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __62__AFSettingsConnection_fetchAccountsSynchronously_completion___block_invoke;
    v16[3] = &unk_1E592B9A0;
    id v8 = &v17;
    id v17 = v6;
    uint64_t v9 = [(AFSettingsConnection *)self _synchronousSettingsServiceWithErrorHandler:v16];
  }
  else
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __62__AFSettingsConnection_fetchAccountsSynchronously_completion___block_invoke_14;
    v14[3] = &unk_1E592B9A0;
    id v8 = &v15;
    id v15 = v6;
    uint64_t v9 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v14];
  }
  uint64_t v10 = (void *)v9;

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __62__AFSettingsConnection_fetchAccountsSynchronously_completion___block_invoke_15;
  v12[3] = &unk_1E5928360;
  id v13 = v7;
  id v11 = v7;
  [v10 retrieveAccountMessageDictionariesWithReply:v12];
}

void __62__AFSettingsConnection_fetchAccountsSynchronously_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    uint64_t v7 = "-[AFSettingsConnection fetchAccountsSynchronously:completion:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

void __62__AFSettingsConnection_fetchAccountsSynchronously_completion___block_invoke_14(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    uint64_t v7 = "-[AFSettingsConnection fetchAccountsSynchronously:completion:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

void __62__AFSettingsConnection_fetchAccountsSynchronously_completion___block_invoke_15(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          id v11 = [AFAccount alloc];
          id v12 = -[AFAccount initWithMessageDictionary:](v11, "initWithMessageDictionary:", v10, (void)v14);
          [v4 addObject:v12];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }
  }
  else
  {
    id v4 = 0;
  }
  uint64_t v13 = *(void *)(a1 + 32);
  if (v13) {
    (*(void (**)(uint64_t, id, void))(v13 + 16))(v13, v4, 0);
  }
}

- (void)isRecognizeMyVoiceAvailable:(id)a3
{
  id v3 = (void (**)(id, uint64_t))a3;
  if (v3)
  {
    uint64_t v7 = v3;
    id v4 = AFPreferencesSupportedMultiUserLanguages();
    id v5 = v7;
    if (AFIsHorseman_onceToken != -1)
    {
      dispatch_once(&AFIsHorseman_onceToken, &__block_literal_global_220_45602);
      id v5 = v7;
    }
    if (AFIsHorseman_isHorseman)
    {
      uint64_t v6 = _AFPreferencesValueForKeyWithContext(@"Session Language", @"com.apple.assistant.backedup", 0);
      v7[2](v7, [v4 containsObject:v6]);
    }
    else
    {
      v5[2](v5, 0);
    }

    id v3 = v7;
  }
}

- (void)fetchSupportedLanguageCodes:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    AFPreferencesSupportedLanguages();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id, void))a3 + 2))(v4, v5, 0);
  }
}

- (id)_synchronousSettingsServiceWithErrorHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(AFSettingsConnection *)self _connection];
  uint64_t v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v4];

  return v6;
}

- (id)_settingsServiceWithErrorHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(AFSettingsConnection *)self _connection];
  uint64_t v6 = [v5 remoteObjectProxyWithErrorHandler:v4];

  return v6;
}

- (id)_connection
{
  connection = self->_connection;
  if (!connection)
  {
    instanceContext = self->_instanceContext;
    if (!instanceContext)
    {
      id v5 = +[AFInstanceContext defaultContext];
      uint64_t v6 = self->_instanceContext;
      self->_instanceContext = v5;

      instanceContext = self->_instanceContext;
    }
    uint64_t v7 = [(AFInstanceContext *)instanceContext createXPCConnectionWithMachServiceName:@"com.apple.assistant.settings" options:0];
    uint64_t v8 = self->_connection;
    self->_connection = v7;

    objc_initWeak(&location, self);
    id v9 = self->_connection;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __35__AFSettingsConnection__connection__block_invoke;
    v20[3] = &unk_1E592B978;
    objc_copyWeak(&v21, &location);
    [(NSXPCConnection *)v9 setInvalidationHandler:v20];
    uint64_t v10 = self->_connection;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __35__AFSettingsConnection__connection__block_invoke_10;
    v18[3] = &unk_1E592B978;
    objc_copyWeak(&v19, &location);
    [(NSXPCConnection *)v10 setInterruptionHandler:v18];
    id v11 = self->_connection;
    id v12 = AFSettingsServiceXPCInterface();
    [(NSXPCConnection *)v11 setRemoteObjectInterface:v12];

    uint64_t v13 = self->_connection;
    long long v14 = AFSettingsServiceDelegateXPCInterface();
    [(NSXPCConnection *)v13 setExportedInterface:v14];

    long long v15 = self->_connection;
    long long v16 = [[AFSettingsConnectionServiceDelegate alloc] initWithSettingsConnection:self];
    [(NSXPCConnection *)v15 setExportedObject:v16];

    [(NSXPCConnection *)self->_connection resume];
    objc_destroyWeak(&v19);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
    connection = self->_connection;
  }
  return connection;
}

void __35__AFSettingsConnection__connection__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = WeakRetained[6];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __35__AFSettingsConnection__connection__block_invoke_2;
    block[3] = &unk_1E592C678;
    id v5 = WeakRetained;
    dispatch_async(v3, block);
  }
}

void __35__AFSettingsConnection__connection__block_invoke_10(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = WeakRetained[6];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __35__AFSettingsConnection__connection__block_invoke_2_11;
    block[3] = &unk_1E592C678;
    id v5 = WeakRetained;
    dispatch_async(v3, block);
  }
}

uint64_t __35__AFSettingsConnection__connection__block_invoke_2_11(uint64_t a1)
{
  return [*(id *)(a1 + 32) _clearConnection];
}

uint64_t __35__AFSettingsConnection__connection__block_invoke_2(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (![*(id *)(*(void *)(a1 + 32) + 8) processIdentifier])
  {
    id v2 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136315138;
      id v5 = "-[AFSettingsConnection _connection]_block_invoke_2";
      _os_log_error_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_ERROR, "%s Because pid=0, most likely a connection could never be established to begin with. Likely you are missing an entitlement and/or privilege to look up a mach port.", (uint8_t *)&v4, 0xCu);
    }
  }
  return [*(id *)(a1 + 32) _clearConnection];
}

- (void)setXPCConnectionManagementQueue:(id)a3
{
}

- (id)description
{
  id v3 = [NSString alloc];
  v7.receiver = self;
  v7.super_class = (Class)AFSettingsConnection;
  int v4 = [(AFSettingsConnection *)&v7 description];
  id v5 = (void *)[v3 initWithFormat:@"%@ {instanceContext = %@}", v4, self->_instanceContext];

  return v5;
}

+ (AFSettingsConnection)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__AFSettingsConnection_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (sharedInstance_onceToken_22423 != -1) {
    dispatch_once(&sharedInstance_onceToken_22423, block);
  }
  id v2 = (void *)sharedInstance_singleton;
  return (AFSettingsConnection *)v2;
}

void __38__AFSettingsConnection_sharedInstance__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    uint64_t v6 = "+[AFSettingsConnection sharedInstance]_block_invoke";
    _os_log_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v5, 0xCu);
  }
  id v3 = objc_alloc_init(*(Class *)(a1 + 32));
  int v4 = (void *)sharedInstance_singleton;
  sharedInstance_singleton = (uint64_t)v3;
}

- (void)_tellDelegateServerVerificationReport:(id)a3
{
  id v4 = a3;
  id v5 = [(AFSettingsConnection *)self _delegate];
  [v5 _settingsConnectionServerVerificationReport:v4];
}

- (void)_tellDelegatePartialVerificationResult:(id)a3
{
  id v4 = a3;
  id v5 = [(AFSettingsConnection *)self _delegate];
  [v5 _settingsConnectionPartialVerificationResult:v4];
}

- (void)_setDelegate:(id)a3
{
  id v5 = a3;
  delegate = self->_delegate;
  p_delegate = &self->_delegate;
  id v8 = v5;
  if ((-[AFSettingsDelegate isEqual:](delegate, "isEqual:") & 1) == 0) {
    objc_storeStrong((id *)p_delegate, a3);
  }
}

- (AFSettingsDelegate)_delegate
{
  return self->_delegate;
}

- (void)_readSyncTokenForAceHost:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70__AFSettingsConnection_Internal___readSyncTokenForAceHost_completion___block_invoke;
  v10[3] = &unk_1E592B9A0;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  id v9 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v10];
  [v9 readSyncTokenForAceHost:v8 completion:v7];
}

void __70__AFSettingsConnection_Internal___readSyncTokenForAceHost_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    id v7 = "-[AFSettingsConnection(Internal) _readSyncTokenForAceHost:completion:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
  }
}

- (void)_sendSyncTokenToPersonalRequestsEnabledAccessoriesWithCompletion:(id)a3
{
  id v4 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __99__AFSettingsConnection_Internal___sendSyncTokenToPersonalRequestsEnabledAccessoriesWithCompletion___block_invoke;
  v10[3] = &unk_1E592B9A0;
  id v5 = v4;
  id v11 = v5;
  int v6 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v10];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __99__AFSettingsConnection_Internal___sendSyncTokenToPersonalRequestsEnabledAccessoriesWithCompletion___block_invoke_547;
  v8[3] = &unk_1E592C360;
  id v9 = v5;
  id v7 = v5;
  [v6 sendSyncTokenToPersonalRequestsEnabledAccessoriesWithCompletion:v8];
}

void __99__AFSettingsConnection_Internal___sendSyncTokenToPersonalRequestsEnabledAccessoriesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    id v7 = "-[AFSettingsConnection(Internal) _sendSyncTokenToPersonalRequestsEnabledAccessoriesWithCompletion:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

uint64_t __99__AFSettingsConnection_Internal___sendSyncTokenToPersonalRequestsEnabledAccessoriesWithCompletion___block_invoke_547(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (void)_setSyncToken:(id)a3 forAceHost:(id)a4 completion:(id)a5
{
  id v8 = a5;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __70__AFSettingsConnection_Internal___setSyncToken_forAceHost_completion___block_invoke;
  v16[3] = &unk_1E592B9A0;
  id v9 = v8;
  id v17 = v9;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v16];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __70__AFSettingsConnection_Internal___setSyncToken_forAceHost_completion___block_invoke_546;
  v14[3] = &unk_1E592C360;
  id v15 = v9;
  id v13 = v9;
  [v12 setSyncToken:v11 forAceHost:v10 completion:v14];
}

void __70__AFSettingsConnection_Internal___setSyncToken_forAceHost_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    id v7 = "-[AFSettingsConnection(Internal) _setSyncToken:forAceHost:completion:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

uint64_t __70__AFSettingsConnection_Internal___setSyncToken_forAceHost_completion___block_invoke_546(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (void)_handleCommand:(id)a3 completion:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [a3 dictionary];
  __int16 v8 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v17 = "-[AFSettingsConnection(Internal) _handleCommand:completion:]";
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_INFO, "%s Sending %@", buf, 0x16u);
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __60__AFSettingsConnection_Internal___handleCommand_completion___block_invoke;
  v14[3] = &unk_1E592B9A0;
  id v9 = v6;
  id v15 = v9;
  uint64_t v10 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v14];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __60__AFSettingsConnection_Internal___handleCommand_completion___block_invoke_544;
  v12[3] = &unk_1E592AD48;
  id v13 = v9;
  id v11 = v9;
  [v10 handleCommand:v7 completion:v12];
}

void __60__AFSettingsConnection_Internal___handleCommand_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    id v7 = "-[AFSettingsConnection(Internal) _handleCommand:completion:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s Interrupted %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

void __60__AFSettingsConnection_Internal___handleCommand_completion___block_invoke_544(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315650;
    uint64_t v10 = "-[AFSettingsConnection(Internal) _handleCommand:completion:]_block_invoke";
    __int16 v11 = 2112;
    id v12 = v5;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl(&dword_19CF1D000, v7, OS_LOG_TYPE_INFO, "%s Received %@ %@", (uint8_t *)&v9, 0x20u);
  }
  if (*(void *)(a1 + 32))
  {
    __int16 v8 = [MEMORY[0x1E4F96508] aceObjectWithDictionary:v5];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)_updateMultiUserInfoForUser:(id)a3 score:(id)a4 companionInfo:(id)a5 reset:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  if (v15)
  {
    long long v16 = dispatch_group_create();
    id v17 = v16;
    v43[0] = 0;
    v43[1] = v43;
    v43[2] = 0x3032000000;
    v43[3] = __Block_byref_object_copy__22201;
    v43[4] = __Block_byref_object_dispose__22202;
    id v44 = 0;
    if (v13 || v8)
    {
      dispatch_group_enter(v16);
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __99__AFSettingsConnection_Internal___updateMultiUserInfoForUser_score_companionInfo_reset_completion___block_invoke;
      v40[3] = &unk_1E59285B0;
      v42 = v43;
      __int16 v18 = v17;
      v41 = v18;
      id v19 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v40];
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __99__AFSettingsConnection_Internal___updateMultiUserInfoForUser_score_companionInfo_reset_completion___block_invoke_2;
      v37[3] = &unk_1E59285B0;
      v39 = v43;
      v38 = v18;
      [v19 updateVoiceIdScoreToUser:v12 score:v13 reset:v8 completion:v37];
    }
    v35[0] = 0;
    v35[1] = v35;
    v35[2] = 0x3032000000;
    v35[3] = __Block_byref_object_copy__22201;
    v35[4] = __Block_byref_object_dispose__22202;
    id v36 = 0;
    uint64_t v20 = [v14 assistantID];
    if (v20)
    {
      id v21 = [v14 speechID];

      if (v21)
      {
        dispatch_group_enter(v17);
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = __99__AFSettingsConnection_Internal___updateMultiUserInfoForUser_score_companionInfo_reset_completion___block_invoke_3;
        v32[3] = &unk_1E59285B0;
        __int16 v34 = v35;
        uint64_t v22 = v17;
        v33 = v22;
        __int16 v23 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v32];
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __99__AFSettingsConnection_Internal___updateMultiUserInfoForUser_score_companionInfo_reset_completion___block_invoke_4;
        v29[3] = &unk_1E59285B0;
        v31 = v35;
        v30 = v22;
        [v23 updateMultiUserWithSharedUserId:v12 companionInfo:v14 completion:v29];
      }
    }
    id v24 = dispatch_get_global_queue(0, 0);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __99__AFSettingsConnection_Internal___updateMultiUserInfoForUser_score_companionInfo_reset_completion___block_invoke_5;
    v25[3] = &unk_1E59285D8;
    long long v27 = v43;
    id v26 = v15;
    id v28 = v35;
    dispatch_group_notify(v17, v24, v25);

    _Block_object_dispose(v35, 8);
    _Block_object_dispose(v43, 8);
  }
}

void __99__AFSettingsConnection_Internal___updateMultiUserInfoForUser_score_companionInfo_reset_completion___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v3 = [a2 copy];
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
  id v6 = *(NSObject **)(a1 + 32);
  dispatch_group_leave(v6);
}

void __99__AFSettingsConnection_Internal___updateMultiUserInfoForUser_score_companionInfo_reset_completion___block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v3 = [a2 copy];
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
  id v6 = *(NSObject **)(a1 + 32);
  dispatch_group_leave(v6);
}

void __99__AFSettingsConnection_Internal___updateMultiUserInfoForUser_score_companionInfo_reset_completion___block_invoke_3(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v3 = [a2 copy];
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
  id v6 = *(NSObject **)(a1 + 32);
  dispatch_group_leave(v6);
}

void __99__AFSettingsConnection_Internal___updateMultiUserInfoForUser_score_companionInfo_reset_completion___block_invoke_4(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v3 = [a2 copy];
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
  id v6 = *(NSObject **)(a1 + 32);
  dispatch_group_leave(v6);
}

uint64_t __99__AFSettingsConnection_Internal___updateMultiUserInfoForUser_score_companionInfo_reset_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_getSharedCompanionInfo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __58__AFSettingsConnection_Internal___getSharedCompanionInfo___block_invoke;
    v8[3] = &unk_1E592B9A0;
    id v6 = v4;
    id v9 = v6;
    id v7 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v8];
    [v7 getSharedCompanionInfo:v6];
  }
}

uint64_t __58__AFSettingsConnection_Internal___getSharedCompanionInfo___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)_runServiceMaintenance
{
  uint64_t v3 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:&__block_literal_global_543];
  [v3 _runServiceMaintenance];

  [(AFSettingsConnection *)self barrier];
}

void __56__AFSettingsConnection_Internal___runServiceMaintenance__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    id v5 = "-[AFSettingsConnection(Internal) _runServiceMaintenance]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)_setSyncVerificationNeededAndFullReportNeeded:(BOOL)a3 shouldPostNotification:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __114__AFSettingsConnection_Internal___setSyncVerificationNeededAndFullReportNeeded_shouldPostNotification_completion___block_invoke;
  v11[3] = &unk_1E592B9A0;
  id v12 = v8;
  id v9 = v8;
  uint64_t v10 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v11];
  [v10 _setSyncVerificationNeededAndFullReportNeeded:v6 shouldPostNotification:v5 completion:v9];
}

uint64_t __114__AFSettingsConnection_Internal___setSyncVerificationNeededAndFullReportNeeded_shouldPostNotification_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (void)_fetchPeerData:(id)a3
{
  id v4 = a3;
  id v5 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:&__block_literal_global_541];
  [v5 _fetchPeerData:v4];
}

void __49__AFSettingsConnection_Internal___fetchPeerData___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    id v5 = "-[AFSettingsConnection(Internal) _fetchPeerData:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)_isInactiveDeviceSyncDisabled:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__AFSettingsConnection_Internal___isInactiveDeviceSyncDisabled___block_invoke;
  v7[3] = &unk_1E592B9A0;
  id v8 = v4;
  id v5 = v4;
  __int16 v6 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v7];
  [v6 _isInactiveDeviceSyncDisabled:v5];
}

void __64__AFSettingsConnection_Internal___isInactiveDeviceSyncDisabled___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    id v7 = "-[AFSettingsConnection(Internal) _isInactiveDeviceSyncDisabled:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
  }
}

- (void)_isInactiveDeviceSyncDisabledByTrial:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__AFSettingsConnection_Internal___isInactiveDeviceSyncDisabledByTrial___block_invoke;
  v7[3] = &unk_1E592B9A0;
  id v8 = v4;
  id v5 = v4;
  int v6 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v7];
  [v6 _isInactiveDeviceSyncDisabledByTrial:v5];
}

void __71__AFSettingsConnection_Internal___isInactiveDeviceSyncDisabledByTrial___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    id v7 = "-[AFSettingsConnection(Internal) _isInactiveDeviceSyncDisabledByTrial:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
  }
}

- (void)_syncDataWithAnchorKeys:(id)a3 forceReset:(BOOL)a4 reason:(id)a5 completion:(id)a6
{
  BOOL v7 = a4;
  id v10 = a6;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __87__AFSettingsConnection_Internal___syncDataWithAnchorKeys_forceReset_reason_completion___block_invoke;
  v15[3] = &unk_1E592B9A0;
  id v16 = v10;
  id v11 = v10;
  id v12 = a5;
  id v13 = a3;
  id v14 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:v15];
  [v14 _syncDataWithAnchorKeys:v13 forceReset:v7 reason:v12 reply:v11];
}

uint64_t __87__AFSettingsConnection_Internal___syncDataWithAnchorKeys_forceReset_reason_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_clearSyncNeededForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:&__block_literal_global_539];
  [v5 _clearSyncNeededForKey:v4];
}

void __57__AFSettingsConnection_Internal___clearSyncNeededForKey___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    id v5 = "-[AFSettingsConnection(Internal) _clearSyncNeededForKey:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)_setSyncNeededForReason:(id)a3
{
  id v4 = a3;
  id v5 = [(AFSettingsConnection *)self _settingsServiceWithErrorHandler:&__block_literal_global_537];
  [v5 _setSyncNeededForReason:v4];
}

void __58__AFSettingsConnection_Internal___setSyncNeededForReason___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    id v5 = "-[AFSettingsConnection(Internal) _setSyncNeededForReason:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }
}

@end