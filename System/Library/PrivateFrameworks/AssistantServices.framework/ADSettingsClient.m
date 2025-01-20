@interface ADSettingsClient
- (ADSettingsClient)initWithXPCConnection:(id)a3;
- (id)_localSpeechRecognizer;
- (id)_localizedBodyWithFormat:(id)a3 forTriggerPhrase:(id)a4 andName:(id)a5;
- (id)_serviceDelegate;
- (id)_serviceDelegateWithErrorHandler:(id)a3;
- (void)_clearSyncNeededForKey:(id)a3;
- (void)_createMockServerIfNeededAndSetActiveWithCompletion:(id)a3;
- (void)_executeBlockWithCurrentlyRoutedDevice:(id)a3 withCompletion:(id)a4;
- (void)_fetchPeerData:(id)a3;
- (void)_isInactiveDeviceSyncDisabled:(id)a3;
- (void)_isInactiveDeviceSyncDisabledByTrial:(id)a3;
- (void)_killDaemon;
- (void)_resetSessionsAtNextRequestBoundary;
- (void)_runServiceMaintenance;
- (void)_saveAccount:(id)a3 setActive:(BOOL)a4;
- (void)_setSyncNeededForReason:(id)a3;
- (void)_setSyncVerificationNeededAndFullReportNeeded:(BOOL)a3 shouldPostNotification:(BOOL)a4 completion:(id)a5;
- (void)_shutdownSessionIfIdle;
- (void)_syncDataWithAnchorKeys:(id)a3 forceReset:(BOOL)a4 reason:(id)a5 reply:(id)a6;
- (void)accessRecordedAudioWithIdentifier:(id)a3 completion:(id)a4;
- (void)adSyncVerificationPartialResult:(id)a3;
- (void)adSyncVerificationServerReport:(id)a3;
- (void)addMultiUserUser:(id)a3 sharedId:(id)a4 loggableSharedId:(id)a5 iCloudAltDSID:(id)a6 enrollmentName:(id)a7 isPrimary:(BOOL)a8 completion:(id)a9;
- (void)areSiriSAEAssetsAvailable:(id)a3;
- (void)areSiriUODAssetsAvailable:(id)a3;
- (void)availableLanguagesInTheHome:(id)a3;
- (void)barrierWithReply:(id)a3;
- (void)clearAnnounceNotificationsInCarPlayTemporarilyDisabled;
- (void)clearAnnounceNotificationsInCarPlayType;
- (void)clearMessageWithoutConfirmationEnabled;
- (void)clearMessageWithoutConfirmationHeadphonesEnabled;
- (void)clearMessageWithoutConfirmationInCarPlayEnabled;
- (void)clearOpportuneSpeakingEdgeDetectorSignalOverride;
- (void)clearShowAppsBehindSiriInCarPlayEnabled;
- (void)clearSpokenNotificationTemporarilyDisabledStatus;
- (void)configOverrides:(id)a3;
- (void)connectionDisconnected;
- (void)createOfflineSpeechProfileWithLanguage:(id)a3 modelOverridePath:(id)a4 JSONData:(id)a5 completion:(id)a6;
- (void)createRadarForCrashWithReason:(id)a3 process:(id)a4 completion:(id)a5;
- (void)deleteAccountWithIdentifier:(id)a3;
- (void)deleteSiriHistoryWithContext:(id)a3 withCompletion:(id)a4;
- (void)disableAndDeleteCloudSyncWithCompletion:(id)a3;
- (void)dismissUI;
- (void)dumpAssistantState:(id)a3;
- (void)fetchActiveAccount:(id)a3;
- (void)fetchCurrentlyRoutedHeadphonesCBUUIDWithCompletion:(id)a3;
- (void)fetchEventRecordsFromAnalyticsStoreAtPath:(id)a3 completion:(id)a4;
- (void)fetchExperimentConfigurationsWithCompletion:(id)a3;
- (void)fetchExperimentContextWithCompletion:(id)a3;
- (void)fetchMultiUserVoiceIdentificationSetting:(id)a3;
- (void)fetchSharedUserIdentifier:(id)a3;
- (void)fetchSupportedLanguagesWithReply:(id)a3;
- (void)forceMultiUserSync:(BOOL)a3 download:(BOOL)a4 completion:(id)a5;
- (void)getAccessoryInfoForAccessoryWithUUID:(id)a3 completionHandler:(id)a4;
- (void)getAnnounceNotificationsInCarPlayTemporarilyDisabledWithCompletion:(id)a3;
- (void)getAnnounceNotificationsInCarPlayTypeWithCompletion:(id)a3;
- (void)getAnnounceNotificationsTemporarilyDisabledEndDateForApp:(id)a3 platform:(int64_t)a4 completion:(id)a5;
- (void)getAnnounceNotificationsTemporarilyDisabledEndDateForPlatform:(int64_t)a3 completion:(id)a4;
- (void)getAssetStatusForLanguage:(id)a3 completionHandler:(id)a4;
- (void)getAssistantIsEnabledForDeviceWithSiriInfo:(id)a3 withCompletion:(id)a4;
- (void)getAudioSessionCoordinationSnapshotWithCompletion:(id)a3;
- (void)getAvailableVoicesIncludingAssetInfo:(BOOL)a3 completion:(id)a4;
- (void)getBluetoothDeviceInfoWithAddress:(id)a3 completion:(id)a4;
- (void)getBluetoothDeviceInfoWithUID:(id)a3 completion:(id)a4;
- (void)getBluetoothWirelessSplitterSessionInfoWithCompletion:(id)a3;
- (void)getCapabilitiesDataFromReachableDevicesWithCompletion:(id)a3;
- (void)getConnectedBluetoothDeviceInfoArrayWithCompletion:(id)a3;
- (void)getContextCollectorsInfoWithCompletion:(id)a3;
- (void)getConversationAwarenessForCurrentlyRoutedDevice:(id)a3;
- (void)getCrossDeviceContextWithCompletion:(id)a3;
- (void)getCurrentAccessoryInfoWithCompletion:(id)a3;
- (void)getCurrentActiveLanguageCodesWithCompletion:(id)a3;
- (void)getCurrentContextSnapshotWithCompletion:(id)a3;
- (void)getCurrentNWActivityIDWithCompletion:(id)a3;
- (void)getCurrentRequestIsWatchAuthenticatedWithCompletion:(id)a3;
- (void)getDevicesWithAvailablePHSAssetsForLanguage:(id)a3 completion:(id)a4;
- (void)getDevicesWithAvailablePHSAssetsOnDeviceCheck:(id)a3;
- (void)getExperimentForConfigurationIdentifier:(id)a3 completion:(id)a4;
- (void)getHeadGesturesForCurrentlyRoutedDevice:(id)a3;
- (void)getHomeUserIdForSharedUserId:(id)a3 completion:(id)a4;
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
- (void)getSharedCompanionInfo:(id)a3;
- (void)getSharedUserID:(id)a3;
- (void)getSharedUserIdForHomeUserId:(id)a3 completion:(id)a4;
- (void)getShowAppsBehindSiriInCarPlayEnabledWithCompletion:(id)a3;
- (void)getSidekickBoostsFileWithCompletion:(id)a3;
- (void)getSiriDataSharingOptInStatusWithCompletion:(id)a3;
- (void)getSiriOutputVolumeForAudioRoute:(id)a3 completion:(id)a4;
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
- (void)handleCommand:(id)a3 completion:(id)a4;
- (void)hasEverSetLanguageCodeWithCompletion:(id)a3;
- (void)homeOnboardingFlowInvoked:(BOOL)a3 completion:(id)a4;
- (void)isJustSiriEnabledInTheHome:(id)a3;
- (void)isSearchDataSharingStatusForced:(id)a3;
- (void)isVoiceTriggerEnabled:(id)a3;
- (void)postJSDiscoveryNotificationForBTDeviceWithInfo:(id)a3 withCompletion:(id)a4;
- (void)postTestResultCandidateWithRcId:(id)a3 recognitionSausage:(id)a4;
- (void)postTestResultSelectedWithRcId:(id)a3;
- (void)publishFeedbackArbitrationParticipation:(id)a3;
- (void)purgeAnalyticsStoreWithCompletion:(id)a3;
- (void)pushMyriadAdvertisementContext:(id)a3 completionHandler:(id)a4;
- (void)pushSCDAAdvertisementContext:(id)a3 completionHandler:(id)a4;
- (void)readSyncTokenForAceHost:(id)a3 completion:(id)a4;
- (void)removeMultiUserUser:(id)a3 completion:(id)a4;
- (void)removeMultiUserUserWithSharedUserId:(id)a3 completion:(id)a4;
- (void)resetAnalyticsStoreWithCompletion:(id)a3;
- (void)resetExperimentForConfigurationIdentifier:(id)a3 completion:(id)a4;
- (void)resetProfileNames:(BOOL)a3 completion:(id)a4;
- (void)retrieveAccountMessageDictionariesWithReply:(id)a3;
- (void)saveAccountWithMessageDictionary:(id)a3 setActive:(BOOL)a4;
- (void)sendMetricsToServerWithCompletion:(id)a3;
- (void)sendSampledAudioToServerWithCompletion:(id)a3;
- (void)sendSyncTokenToPersonalRequestsEnabledAccessoriesWithCompletion:(id)a3;
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
- (void)setConfigOverrides:(id)a3 completion:(id)a4;
- (void)setConversationAwarenessForCurrentlyRoutedDevice:(BOOL)a3 withCompletion:(id)a4;
- (void)setDictationAutoPunctuationEnabled:(BOOL)a3;
- (void)setDictationEnabled:(BOOL)a3;
- (void)setEnableAssistantLogging:(BOOL)a3;
- (void)setHardcodedBluetoothProximity:(id)a3;
- (void)setHeadGesturesForCurrentlyRoutedDevice:(BOOL)a3 withCompletion:(id)a4;
- (void)setIsHomePodInHH2Mode:(BOOL)a3 completion:(id)a4;
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
- (void)setSiriOutputVolume:(float)a3 forAudioRoute:(id)a4 completion:(id)a5;
- (void)setSpeechProfileExternalOfflineModelRootPath:(id)a3 completion:(id)a4;
- (void)setSpokenNotificationIsAlwaysOpportune:(BOOL)a3;
- (void)setSpokenNotificationProxCardSeen:(BOOL)a3;
- (void)setSpokenNotificationShouldAnnounceAllNotifications:(BOOL)a3;
- (void)setSpokenNotificationShouldSkipTriggerlessReplies:(BOOL)a3;
- (void)setSupplementalLanguageDictionary:(id)a3 forProduct:(id)a4 completion:(id)a5;
- (void)setSupplementalLanguages:(id)a3 forProduct:(id)a4 forBuildVersion:(id)a5 completion:(id)a6;
- (void)setSyncToken:(id)a3 forAceHost:(id)a4 completion:(id)a5;
- (void)setVoiceTriggerEnabled:(BOOL)a3 withCompletion:(id)a4;
- (void)shouldSuppressSiriDataSharingOptInAlertWithCompletion:(id)a3;
- (void)showHomeProfileNamesWithCompletion:(id)a3;
- (void)showLocalProfileNamesWithCompletion:(id)a3;
- (void)showMultiUserCompanionInfo:(id)a3;
- (void)showMultiUserSharedUserIDsCompletion:(id)a3;
- (void)showMultiUsers:(id)a3;
- (void)showPrimaryUserSharedUserIDWithCompletion:(id)a3;
- (void)siriDesignModeIsEnabled:(id)a3;
- (void)startAudioPlaybackRequest:(id)a3 options:(unint64_t)a4 completion:(id)a5;
- (void)startMultiUserUIRequestWithText:(id)a3 expectedSpeakerSharedUserID:(id)a4 expectedSpeakerConfidenceScore:(unint64_t)a5 nonspeakerConfidenceScores:(id)a6 completion:(id)a7;
- (void)startObservingBluetoothInEarDetectionStateForBTAddress:(id)a3 forObserverID:(unint64_t)a4;
- (void)startObservingBluetoothWirelessSplitterSession;
- (void)startRemoteRequest:(id)a3 onPeer:(id)a4 completion:(id)a5;
- (void)startUIMockServerRequestWithReplayFileURL:(id)a3 completion:(id)a4;
- (void)startUIRequestWithInfo:(id)a3 completion:(id)a4;
- (void)startUIRequestWithSpeechAudioFileURL:(id)a3;
- (void)startUIRequestWithText:(id)a3 completion:(id)a4;
- (void)stopAllAudioPlaybackRequests:(BOOL)a3;
- (void)stopAudioPlaybackRequest:(id)a3 immediately:(BOOL)a4;
- (void)stopObservingBluetoothInEarDetectionStateForObserverID:(unint64_t)a3;
- (void)stopObservingBluetoothWirelessSplitterSession;
- (void)suppressLowStorageNotificationForLanguage:(id)a3 suppress:(BOOL)a4;
- (void)synchronizeExperimentConfigurationsIfApplicableWithCompletion:(id)a3;
- (void)triggerABCForType:(id)a3 subType:(id)a4 context:(id)a5 completionHandler:(id)a6;
- (void)trimRecordedAudioWithIdentifier:(id)a3 offset:(double)a4 duration:(double)a5 outputFileType:(int64_t)a6 completion:(id)a7;
- (void)updateAnnounceNotificationsOnHearingAidSupportedStatus;
- (void)updateMultiUserWithSharedUserId:(id)a3 companionInfo:(id)a4 completion:(id)a5;
- (void)updateVoiceIdScoreToUser:(id)a3 score:(id)a4 reset:(BOOL)a5 completion:(id)a6;
@end

@implementation ADSettingsClient

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localSpeechRecognizer, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

- (void)getODDDeviceProperties:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(ADDeviceProperties);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100341CA8;
  v6[3] = &unk_10050D328;
  id v7 = v3;
  id v5 = v3;
  [(ADDeviceProperties *)v4 getODDDevicePropertiesWithCompletion:v6];
}

- (void)createRadarForCrashWithReason:(id)a3 process:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    if (AFDeviceSupportsFileACrashRadar())
    {
      v10 = objc_alloc_init(ADRadarManagerDraft);
      v11 = [@"Crash issue - " stringByAppendingString:v8];
      [(ADRadarManagerDraft *)v10 setTitle:v11];

      [(ADRadarManagerDraft *)v10 setProblemDescription:@"Radar triggered via crash signal trap. For more info, see: https://at.apple.com/SieS8l"];
      [(ADRadarManagerDraft *)v10 setIsUserInitiated:0];
      v12 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        v13 = v12;
        v14 = [(ADRadarManagerDraft *)v10 title];
        *(_DWORD *)buf = 136315394;
        v21 = "-[ADSettingsClient createRadarForCrashWithReason:process:completion:]";
        __int16 v22 = 2112;
        v23 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s Attempting to create radar draft for: %@", buf, 0x16u);
      }
      v15 = +[ADRadarManager sharedInstance];
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_100341F94;
      v18[3] = &unk_10050D440;
      id v19 = v9;
      [v15 createDraft:v10 withDisplayReason:0 completionHandler:v18];
    }
    else
    {
      v17 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v21 = "-[ADSettingsClient createRadarForCrashWithReason:process:completion:]";
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s Feature not enabled", buf, 0xCu);
      }
      v10 = +[AFError errorWithCode:32];
      (*((void (**)(id, ADRadarManagerDraft *))v9 + 2))(v9, v10);
    }
  }
  else
  {
    v16 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v21 = "-[ADSettingsClient createRadarForCrashWithReason:process:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s Completion is nil", buf, 0xCu);
    }
  }
}

- (void)readSyncTokenForAceHost:(id)a3 completion:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(id, void *))a4;
  if (v6)
  {
    id v7 = +[ADMUXCompanionSyncTokenContainer sharedInstance];
    id v8 = [v7 getSyncTokenForAceHost:v5];
    v6[2](v6, v8);
  }
  else
  {
    id v9 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v10 = 136315138;
      v11 = "-[ADSettingsClient readSyncTokenForAceHost:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s Completion is nil", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)sendSyncTokenToPersonalRequestsEnabledAccessoriesWithCompletion:(id)a3
{
  id v5 = a3;
  id v3 = +[ADDeviceCircleManager sharedInstance];
  [v3 sendSyncTokenToPersonalRequestsEnabledAccessories];

  v4 = v5;
  if (v5)
  {
    (*((void (**)(id))v5 + 2))(v5);
    v4 = v5;
  }
}

- (void)setSyncToken:(id)a3 forAceHost:(id)a4 completion:(id)a5
{
  id v11 = a5;
  id v7 = a4;
  id v8 = a3;
  id v9 = +[ADMUXCompanionSyncTokenContainer sharedInstance];
  [v9 putSyncToken:v8 forAceHost:v7];

  int v10 = v11;
  if (v11)
  {
    (*((void (**)(id))v11 + 2))(v11);
    int v10 = v11;
  }
}

- (void)getCurrentActiveLanguageCodesWithCompletion:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v6 = +[ADHomeInfoManager sharedInfoManager];
    id v5 = [v6 getCurrentASRLanguages];
    (*((void (**)(id, void *, void))a3 + 2))(v4, v5, 0);
  }
}

- (void)getAssistantIsEnabledForDeviceWithSiriInfo:(id)a3 withCompletion:(id)a4
{
  id v5 = (void (**)(id, BOOL, void))a4;
  id v6 = [a3 objectForKey:@"peerData"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = [[ADDeviceCirclePeerData alloc] initWithDictionaryRepresentation:v6];
  }
  else {
    id v7 = 0;
  }
  id v8 = [(ADDeviceCirclePeerData *)v7 assistantIdentifier];

  id v9 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 136315394;
    id v11 = "-[ADSettingsClient getAssistantIsEnabledForDeviceWithSiriInfo:withCompletion:]";
    __int16 v12 = 2112;
    v13 = v8;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%s Extracted assistant Id - %@", (uint8_t *)&v10, 0x16u);
    if (!v5) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v5) {
LABEL_6:
  }
    v5[2](v5, v8 != 0, 0);
LABEL_7:
}

- (void)getAssetStatusForLanguage:(id)a3 completionHandler:(id)a4
{
  if (a4)
  {
    id v5 = (void (**)(id, id))a4;
    id v6 = a3;
    id v7 = +[ADAssetManager sharedInstance];
    id v8 = [v7 assetsAvailableStatusForLanguage:v6];

    v5[2](v5, v8);
  }
}

- (void)areSiriSAEAssetsAvailable:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = +[ADPreferences sharedPreferences];
    id v5 = [v4 languageCode];

    id v6 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v13 = "-[ADSettingsClient areSiriSAEAssetsAvailable:]";
      __int16 v14 = 2112;
      v15 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s Fetching SAE assets availability for %@ locale", buf, 0x16u);
    }
    id v7 = +[ADAssetManager sharedInstance];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100342728;
    v9[3] = &unk_10050D300;
    id v10 = v5;
    id v11 = v3;
    id v8 = v5;
    [v7 fetchAssetsAvailabilityForLanguage:v8 completion:v9];
  }
}

- (void)areSiriUODAssetsAvailable:(id)a3
{
  if (a3)
  {
    id v3 = (void (**)(id, uint64_t, void))a3;
    id v4 = +[ADPreferences sharedPreferences];
    id v8 = [v4 languageCode];

    id v5 = +[ADAssetManager sharedInstance];
    id v6 = [v5 assetsAvailableStatusForLanguage:v8];

    uint64_t v7 = AFUODStatusSupportedFull();
    v3[2](v3, v7, 0);
  }
}

- (void)fetchSharedUserIdentifier:(id)a3
{
  id v4 = a3;
  id v6 = +[ADPreferences sharedPreferences];
  id v5 = [v6 sharedUserIdentifier];
  (*((void (**)(id, void *))a3 + 2))(v4, v5);
}

- (void)dumpAssistantState:(id)a3
{
  id v4 = a3;
  id v6 = +[ADCommandCenter sharedCommandCenter];
  id v5 = [v6 dumpAssistantState];
  (*((void (**)(id, void *))a3 + 2))(v4, v5);
}

- (void)setVoiceTriggerEnabled:(BOOL)a3 withCompletion:(id)a4
{
}

- (void)isVoiceTriggerEnabled:(id)a3
{
  id v5 = a3;
  id v4 = sub_1001FD6CC();
  (*((void (**)(id, id, void))a3 + 2))(v5, v4, 0);
}

- (void)setAllowJustSiriHomeKitSetting:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  id v6 = +[ADHomeInfoManager sharedInfoManager];
  [v6 setAllowJustSiriHomeKitSetting:v4 withCompletion:v5];
}

- (void)isJustSiriEnabledInTheHome:(id)a3
{
  id v3 = a3;
  id v4 = +[ADHomeInfoManager sharedInfoManager];
  [v4 isJustSiriEnabledInTheHome:v3];
}

- (void)availableLanguagesInTheHome:(id)a3
{
  id v3 = a3;
  id v4 = +[ADHomeInfoManager sharedInfoManager];
  [v4 availableLanguagesInTheHome:v3];
}

- (void)setRecognizeMyVoiceEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[ADHomeInfoManager sharedInfoManager];
  [v4 setRecognizeMyVoiceEnabled:v3];
}

- (void)getCurrentAccessoryInfoWithCompletion:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = +[ADHomeInfoManager sharedInfoManager];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100342CDC;
    v5[3] = &unk_10050D2D8;
    id v6 = v3;
    [v4 getCurrentAccessoryInfoWithCompletion:v5];
  }
}

- (void)adSyncVerificationServerReport:(id)a3
{
  id v4 = a3;
  id v5 = [(ADSettingsClient *)self _serviceDelegate];
  [v5 syncVerificationServerReport:v4];
}

- (void)adSyncVerificationPartialResult:(id)a3
{
  id v4 = a3;
  id v5 = [(ADSettingsClient *)self _serviceDelegate];
  [v5 syncVerificationPartialResult:v4];
}

- (void)triggerABCForType:(id)a3 subType:(id)a4 context:(id)a5 completionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = dispatch_get_global_queue(-2, 0);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100342ECC;
  v18[3] = &unk_10050E228;
  id v19 = v11;
  id v20 = v9;
  id v21 = v10;
  id v22 = v12;
  id v14 = v10;
  id v15 = v9;
  id v16 = v12;
  id v17 = v11;
  dispatch_async(v13, v18);
}

- (void)getSidekickBoostsFileWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = +[ADMyriadSettingsManager sharedSettingsManager];
  [v4 getSidekickBoostsFileWithCompletion:v3];
}

- (void)getTrialEnables:(id)a3 doubleFactors:(id)a4 withCompletion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = +[ADMyriadSettingsManager sharedSettingsManager];
  [v10 getTrialEnables:v9 doubleFactors:v8 withCompletion:v7];
}

- (void)getAccessoryInfoForAccessoryWithUUID:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[ADCommandCenter sharedCommandCenter];
  [v7 getAccessoryInfoForAccessoryWithUUID:v6 completionHandler:v5];
}

- (void)getSpeakerCapabilityForAccessoryWithUUID:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[ADCommandCenter sharedCommandCenter];
  [v7 getSpeakerCapabilityForAccessoryWithUUID:v6 completionHandler:v5];
}

- (void)pushSCDAAdvertisementContext:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[ADCommandCenter sharedCommandCenter];
  [v7 pushSCDAAdvertisementContext:v6 completionHandler:v5];
}

- (void)pushMyriadAdvertisementContext:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[ADCommandCenter sharedCommandCenter];
  [v7 pushMyriadAdvertisementContext:v6 completionHandler:v5];
}

- (void)getCurrentRequestIsWatchAuthenticatedWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = +[ADCommandCenter sharedCommandCenter];
  [v4 isWatchAuthenticatedWithCompletion:v3];
}

- (void)getRecordedAudioDirectoryPathsWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = +[ADCommandCenter sharedCommandCenter];
  [v4 getRecordedAudioDirectoryPathsWithCompletion:v3];
}

- (void)trimRecordedAudioWithIdentifier:(id)a3 offset:(double)a4 duration:(double)a5 outputFileType:(int64_t)a6 completion:(id)a7
{
  id v11 = a7;
  id v12 = a3;
  id v13 = +[ADCommandCenter sharedCommandCenter];
  [v13 trimRecordedAudioWithIdentifier:v12 offset:a6 duration:v11 outputFileType:a4 completion:a5];
}

- (void)accessRecordedAudioWithIdentifier:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[ADCommandCenter sharedCommandCenter];
  [v7 accessRecordedAudioWithIdentifier:v6 completion:v5];
}

- (void)siriDesignModeIsEnabled:(id)a3
{
  id v5 = a3;
  uint64_t IsEnabled = _AFPreferencesSiriDesignModeIsEnabled();
  id v4 = v5;
  if (v5)
  {
    (*((void (**)(id, uint64_t))v5 + 2))(v5, IsEnabled);
    id v4 = v5;
  }
}

- (void)setSiriDesignModeEnabled:(BOOL)a3 completion:(id)a4
{
  id v5 = a4;
  _AFPreferencesSetSiriDesignModeEnabled();
  id v4 = v5;
  if (v5)
  {
    (*((void (**)(id))v5 + 2))(v5);
    id v4 = v5;
  }
}

- (void)setOnDeviceDictationAvailableAlertPresented:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[AFPreferences sharedPreferences];
  [v4 _setOnDeviceDictationAvailableAlertPresentedLocal:v3];
}

- (void)isSearchDataSharingStatusForced:(id)a3
{
  BOOL v3 = (void (**)(id, id))a3;
  id v4 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315138;
    id v8 = "-[ADSettingsClient isSearchDataSharingStatusForced:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v7, 0xCu);
  }
  id v5 = +[ADPreferences sharedPreferences];
  id v6 = [v5 isSearchDataSharingStatusForced];

  if (v3) {
    v3[2](v3, v6);
  }
}

- (void)getSearchQueriesDataSharingStatus:(id)a3
{
  BOOL v3 = (void (**)(id, id))a3;
  id v4 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315138;
    id v8 = "-[ADSettingsClient getSearchQueriesDataSharingStatus:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v7, 0xCu);
  }
  id v5 = +[ADPreferences sharedPreferences];
  id v6 = [v5 searchQueriesDataSharingStatus];

  if (v3) {
    v3[2](v3, v6);
  }
}

- (void)setSearchQueriesDataSharingStatus:(int64_t)a3 completion:(id)a4
{
  id v5 = (void (**)(void))a4;
  id v6 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v7 = v6;
    id v8 = AFSearchQueriesDataSharingStatusGetName();
    int v10 = 136315395;
    id v11 = "-[ADSettingsClient setSearchQueriesDataSharingStatus:completion:]";
    __int16 v12 = 2113;
    id v13 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s Setting Search Queries Data Sharing option to = %{private}@", (uint8_t *)&v10, 0x16u);
  }
  id v9 = +[ADPreferences sharedPreferences];
  [v9 setSearchQueriesDataSharingStatus:a3];

  if (v5) {
    v5[2](v5);
  }
}

- (void)deleteSiriHistoryWithContext:(id)a3 withCompletion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int v7 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315138;
    int v10 = "-[ADSettingsClient deleteSiriHistoryWithContext:withCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v9, 0xCu);
  }
  id v8 = +[ADCommandCenter sharedCommandCenter];
  [v8 _deleteSiriHistoryWithContext:v5 withCompletion:v6];
}

- (void)shouldSuppressSiriDataSharingOptInAlertWithCompletion:(id)a3
{
  id v5 = a3;
  uint64_t ShouldSuppressSiriDataSharingOptInAlert = _AFPreferencesShouldSuppressSiriDataSharingOptInAlert();
  id v4 = v5;
  if (v5)
  {
    (*((void (**)(id, uint64_t))v5 + 2))(v5, ShouldSuppressSiriDataSharingOptInAlert);
    id v4 = v5;
  }
}

- (void)sendSampledAudioToServerWithCompletion:(id)a3
{
  id v4 = a3;
  sub_10025FA60(0, 1);
  sub_10025FA60(1, 1);
  BOOL v3 = v4;
  if (v4)
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
    BOOL v3 = v4;
  }
}

- (void)setIsHomePodInHH2Mode:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v5 = (void (**)(void))a4;
  id v6 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    id v8 = "-[ADSettingsClient setIsHomePodInHH2Mode:completion:]";
    __int16 v9 = 1024;
    BOOL v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s Setting isHomePodInHH2Mode = %d", (uint8_t *)&v7, 0x12u);
  }
  _AFPreferencesSetIsHomePodInHH2Mode();
  if (v5) {
    v5[2](v5);
  }
}

- (void)setSiriDataSharingHomePodSetupDeviceIsValid:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v5 = (void (**)(void))a4;
  id v6 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315138;
    __int16 v9 = "-[ADSettingsClient setSiriDataSharingHomePodSetupDeviceIsValid:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v8, 0xCu);
  }
  int v7 = +[ADPreferences sharedPreferences];
  [v7 setSiriDataSharingHomePodSetupDeviceIsValid:v4];

  if (v5) {
    v5[2](v5);
  }
}

- (void)setSiriDataSharingOptInAlertPresented:(BOOL)a3 completion:(id)a4
{
  id v5 = a4;
  _AFPreferencesSetSiriDataSharingOptInAlertPresented();
  BOOL v4 = v5;
  if (v5)
  {
    (*((void (**)(id))v5 + 2))(v5);
    BOOL v4 = v5;
  }
}

- (void)setSiriDataSharingOptInStatus:(int64_t)a3 propagateToHomeAccessories:(BOOL)a4 source:(int64_t)a5 reason:(id)a6 completion:(id)a7
{
  BOOL v9 = a4;
  id v12 = a6;
  id v13 = (void (**)(id, void))a7;
  id v14 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v24 = "-[ADSettingsClient setSiriDataSharingOptInStatus:propagateToHomeAccessories:source:reason:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  id v15 = +[ADPreferences sharedPreferences];
  [v15 setSiriDataSharingOptInStatus:a3 propagateToHomeAccessories:v9 source:a5 reason:v12 completion:0];

  if (a3 != 1)
  {
    id v16 = dispatch_get_global_queue(-2, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100343FBC;
    block[3] = &unk_10050E138;
    block[4] = self;
    dispatch_async(v16, block);

    id v17 = objc_alloc_init(ADAnalyticsFBFDeliveryInfrastructure);
    [(ADAnalyticsFBFDeliveryInfrastructure *)v17 deliverLogViewerIdentifier:0];
  }
  v18 = +[ADCommandCenter sharedQueue];
  dispatch_async(v18, &stru_10050D270);

  if (v9)
  {
    if (+[AFFeatureFlags isSiriDataSharingRepromptEnabled])
    {
      id v19 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v24 = "-[ADSettingsClient setSiriDataSharingOptInStatus:propagateToHomeAccessories:source:reason:completion:]";
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%s Triggering propagation of opt-in status to home accessories", buf, 0xCu);
      }
      id v20 = +[ADHomeDataSharingRepromptManager sharedManager];
      [v20 propagateToAllHomeAccessoriesAfterReprompt:a3 source:a5 reason:v12 completion:&stru_10050D2B0];
    }
    else
    {
      id v21 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v24 = "-[ADSettingsClient setSiriDataSharingOptInStatus:propagateToHomeAccessories:source:reason:completion:]";
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "%s Not propagating to home accessories because siri data sharing reprompt feature flag is disabled.", buf, 0xCu);
      }
    }
  }
  if (v13) {
    v13[2](v13, 0);
  }
}

- (void)getSiriDataSharingOptInStatusWithCompletion:(id)a3
{
  BOOL v3 = (void (**)(id, id))a3;
  BOOL v4 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315138;
    int v8 = "-[ADSettingsClient getSiriDataSharingOptInStatusWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v7, 0xCu);
  }
  id v5 = +[ADPreferences sharedPreferences];
  id v6 = [v5 siriDataSharingOptInStatus];

  if (v3) {
    v3[2](v3, v6);
  }
}

- (void)setSiriDataSharingOptInStatus:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  int v7 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v12 = "-[ADSettingsClient setSiriDataSharingOptInStatus:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1003443D4;
  v9[3] = &unk_10050D440;
  id v10 = v6;
  id v8 = v6;
  [(ADSettingsClient *)self setSiriDataSharingOptInStatus:a3 propagateToHomeAccessories:0 source:0 reason:@"Legacy setter" completion:v9];
}

- (void)clearOpportuneSpeakingEdgeDetectorSignalOverride
{
}

- (void)setOpportuneSpeakingEdgeDetectorSignalOverride:(int64_t)a3
{
}

- (void)clearShowAppsBehindSiriInCarPlayEnabled
{
}

- (void)setShowAppsBehindSiriInCarPlayEnabled:(BOOL)a3
{
}

- (void)getShowAppsBehindSiriInCarPlayEnabledWithCompletion:(id)a3
{
  id v5 = a3;
  uint64_t ShowAppsBehindSiriInCarPlayEnabled = _AFPreferencesGetShowAppsBehindSiriInCarPlayEnabled();
  (*((void (**)(id, uint64_t))a3 + 2))(v5, ShowAppsBehindSiriInCarPlayEnabled);
}

- (void)clearMessageWithoutConfirmationHeadphonesEnabled
{
}

- (void)setMessageWithoutConfirmationHeadphonesEnabled:(BOOL)a3
{
}

- (void)getMessageWithoutConfirmationHeadphonesEnabledWithCompletion:(id)a3
{
  id v5 = a3;
  uint64_t MessageWithoutConfirmationHeadphonesEnabled = _AFPreferencesGetMessageWithoutConfirmationHeadphonesEnabled();
  (*((void (**)(id, uint64_t))a3 + 2))(v5, MessageWithoutConfirmationHeadphonesEnabled);
}

- (void)clearMessageWithoutConfirmationInCarPlayEnabled
{
}

- (void)setMessageWithoutConfirmationInCarPlayEnabled:(BOOL)a3
{
}

- (void)getMessageWithoutConfirmationInCarPlayEnabledWithCompletion:(id)a3
{
  id v5 = a3;
  uint64_t MessageWithoutConfirmationInCarPlayEnabled = _AFPreferencesGetMessageWithoutConfirmationInCarPlayEnabled();
  (*((void (**)(id, uint64_t))a3 + 2))(v5, MessageWithoutConfirmationInCarPlayEnabled);
}

- (void)clearMessageWithoutConfirmationEnabled
{
}

- (void)setMessageWithoutConfirmationEnabled:(BOOL)a3
{
}

- (void)getMessageWithoutConfirmationEnabledWithCompletion:(id)a3
{
  id v5 = a3;
  uint64_t MessageWithoutConfirmationEnabled = _AFPreferencesGetMessageWithoutConfirmationEnabled();
  (*((void (**)(id, uint64_t))a3 + 2))(v5, MessageWithoutConfirmationEnabled);
}

- (void)setAnnounceNotificationsOnBuiltInSpeakerEnabled:(BOOL)a3
{
}

- (void)updateAnnounceNotificationsOnHearingAidSupportedStatus
{
}

- (void)setAnnounceNotificationsOnHearingAidsSupported:(BOOL)a3
{
}

- (void)setAnnounceNotificationsOnHearingAidsEnabled:(BOOL)a3
{
}

- (void)clearAnnounceNotificationsInCarPlayType
{
  v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v3 = 136315138;
    BOOL v4 = "-[ADSettingsClient clearAnnounceNotificationsInCarPlayType]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "%s Clearing announce notifications in CarPlay type.", (uint8_t *)&v3, 0xCu);
  }
  _AFPreferencesClearAnnounceNotificationsInCarPlayType();
  +[AFTipKitDonator donateAnnounceNotificationsInCarPlaySettingsChange:_AFPreferencesAnnounceNotificationsInCarPlayType()];
}

- (void)setAnnounceNotificationsInCarPlayType:(int64_t)a3
{
  BOOL v4 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    id v5 = v4;
    id v6 = AFSiriCarPlayAnnounceEnablementTypeGetName();
    int v7 = 136315394;
    id v8 = "-[ADSettingsClient setAnnounceNotificationsInCarPlayType:]";
    __int16 v9 = 2112;
    id v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Setting announce notifications in CarPlay type to: %@", (uint8_t *)&v7, 0x16u);
  }
  _AFPreferencesSetAnnounceNotificationsInCarPlayType();
  +[AFTipKitDonator donateAnnounceNotificationsInCarPlaySettingsChange:a3];
}

- (void)getAnnounceNotificationsInCarPlayTypeWithCompletion:(id)a3
{
  id v5 = a3;
  uint64_t v4 = _AFPreferencesAnnounceNotificationsInCarPlayType();
  (*((void (**)(id, uint64_t))a3 + 2))(v5, v4);
}

- (void)clearAnnounceNotificationsInCarPlayTemporarilyDisabled
{
  v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v3 = 136315138;
    uint64_t v4 = "-[ADSettingsClient clearAnnounceNotificationsInCarPlayTemporarilyDisabled]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "%s Clearing temporarily disable announce notifications in CarPlay.", (uint8_t *)&v3, 0xCu);
  }
  _AFPreferencesClearAnnounceNotificationsInCarPlayTemporarilyDisabled();
}

- (void)setAnnounceNotificationsInCarPlayTemporarilyDisabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315394;
    id v6 = "-[ADSettingsClient setAnnounceNotificationsInCarPlayTemporarilyDisabled:]";
    __int16 v7 = 1024;
    BOOL v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s Setting temporarily disable announce notifications in CarPlay: %i", (uint8_t *)&v5, 0x12u);
  }
  _AFPreferencesSetAnnounceNotificationsInCarPlayTemporarilyDisabled();
}

- (void)getAnnounceNotificationsInCarPlayTemporarilyDisabledWithCompletion:(id)a3
{
  id v5 = a3;
  uint64_t v4 = _AFPreferencesAnnounceNotificationsInCarPlayTemporarilyDisabled();
  (*((void (**)(id, uint64_t))a3 + 2))(v5, v4);
}

- (void)fetchCurrentlyRoutedHeadphonesCBUUIDWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = +[AFHeadphonesAnnouncementRequestCapabilityProvider provider];
  [v4 fetchCurrentlyRoutedHeadphonesCBUUIDWithCompletion:v3];
}

- (void)setAnnounceNotificationsTemporarilyDisabledUntil:(id)a3 forApp:(id)a4 platform:(int64_t)a5
{
}

- (void)getAnnounceNotificationsTemporarilyDisabledEndDateForApp:(id)a3 platform:(int64_t)a4 completion:(id)a5
{
  id v6 = a5;
  _AFPreferencesAnnounceNotificationsTemporarilyDisabledEndDateForAppOnPlatform();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a5 + 2))(v6, v7);
}

- (void)setAnnounceNotificationsTemporarilyDisabledUntil:(id)a3 platform:(int64_t)a4
{
}

- (void)getAnnounceNotificationsTemporarilyDisabledEndDateForPlatform:(int64_t)a3 completion:(id)a4
{
  id v5 = a4;
  _AFPreferencesAnnounceNotificationsTemporarilyDisabledEndDateForPlatform();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v5, v6);
}

- (void)setSpokenNotificationProxCardSeen:(BOOL)a3
{
}

- (void)setSpokenNotificationShouldSkipTriggerlessReplies:(BOOL)a3
{
}

- (void)getSpokenNotificationShouldSkipTriggerlessRepliesWithCompletion:(id)a3
{
  id v5 = a3;
  uint64_t ShouldSkipTriggerlessReplies = _AFPreferencesSpokenNotificationShouldSkipTriggerlessReplies();
  (*((void (**)(id, uint64_t))a3 + 2))(v5, ShouldSkipTriggerlessReplies);
}

- (void)setSpokenNotificationShouldAnnounceAllNotifications:(BOOL)a3
{
}

- (void)getSpokenNotificationShouldAnnounceAllNotificationsWithCompletion:(id)a3
{
  id v5 = a3;
  uint64_t ShouldAnnounceAllNotifications = _AFPreferencesSpokenNotificationShouldAnnounceAllNotifications();
  (*((void (**)(id, uint64_t))a3 + 2))(v5, ShouldAnnounceAllNotifications);
}

- (void)setSpokenNotificationIsAlwaysOpportune:(BOOL)a3
{
}

- (void)getSpokenNotificationIsAlwaysOpportuneWithCompletion:(id)a3
{
  id v5 = a3;
  uint64_t IsAlwaysOpportune = _AFPreferencesSpokenNotificationIsAlwaysOpportune();
  (*((void (**)(id, uint64_t))a3 + 2))(v5, IsAlwaysOpportune);
}

- (void)clearSpokenNotificationTemporarilyDisabledStatus
{
}

- (void)stopObservingBluetoothInEarDetectionStateForObserverID:(unint64_t)a3
{
  id v4 = +[ADBluetoothInEarDetectionStateObserver sharedObserver];
  [v4 stopObservingForObserverID:a3];
}

- (void)startObservingBluetoothInEarDetectionStateForBTAddress:(id)a3 forObserverID:(unint64_t)a4
{
  id v5 = a3;
  id v6 = +[ADBluetoothInEarDetectionStateObserver sharedObserver];
  [v6 startObservingForBTAddress:v5 forObserverID:a4];
}

- (void)postJSDiscoveryNotificationForBTDeviceWithInfo:(id)a3 withCompletion:(id)a4
{
  id v42 = a3;
  id v6 = a4;
  id v7 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v46 = "-[ADSettingsClient postJSDiscoveryNotificationForBTDeviceWithInfo:withCompletion:]";
    __int16 v47 = 2112;
    uint64_t v48 = (uint64_t)v42;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s 🎧 Posting JS discovery notification for %@", buf, 0x16u);
  }
  v40 = [[ADUserNotificationServiceProvider alloc] initWithConnection:0 bundleIdentifier:0 notificationCategories:0];
  id v8 = objc_alloc_init((Class)UNMutableNotificationContent);
  __int16 v9 = +[ADPreferences sharedPreferences];
  uint64_t v10 = [v9 languageCode];

  id v11 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v46 = "-[ADSettingsClient postJSDiscoveryNotificationForBTDeviceWithInfo:withCompletion:]";
    __int16 v47 = 2112;
    uint64_t v48 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s 🎧 JS discovery notification languageCode: %@", buf, 0x16u);
  }
  id v12 = +[AFLocalization sharedInstance];
  id v13 = +[NSBundle bundleForClass:objc_opt_class()];
  v41 = [v12 localizedStringForKey:@"ASSISTANT_SERVICES_BT_JS_DISCOVERY_NOTIFICATION_TITLE" table:0 bundle:v13 languageCode:v10];

  id v14 = +[AFLocalization sharedInstance];
  id v15 = +[NSBundle bundleForClass:objc_opt_class()];
  v39 = [v14 localizedStringForKey:@"ASSISTANT_SERVICES_BT_JS_DISCOVERY_NOTIFICATION_BODY" table:0 bundle:v15 languageCode:v10];

  v37 = +[NSURL URLWithString:@"prefs:root=SIRI"];
  id v16 = +[VTPreferences sharedPreferences];
  v38 = (void *)v10;
  v36 = [v16 localizedTriggerPhraseForLanguageCode:v10];

  id v17 = [v42 name];
  v18 = +[ADBluetoothManager sharedInstance];
  id v19 = [v42 address];
  id v20 = [v18 deviceWithAddress:v19];

  v35 = v20;
  id v21 = [v20 deviceInfo];
  id v22 = [v21 name];
  v34 = v21;
  if ([v22 length])
  {
    id v23 = v6;
    v24 = self;
    v25 = [v21 name];
    unsigned __int8 v26 = [v17 isEqualToString:v25];

    if ((v26 & 1) == 0)
    {
      uint64_t v27 = [v21 name];

      v28 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v46 = "-[ADSettingsClient postJSDiscoveryNotificationForBTDeviceWithInfo:withCompletion:]";
        __int16 v47 = 2112;
        uint64_t v48 = v27;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "%s 🎧 Using updated name %@ for JS discovery notification", buf, 0x16u);
      }
      id v17 = (void *)v27;
    }
    self = v24;
    id v6 = v23;
  }
  else
  {
  }
  [v8 setTitle:v41];
  v29 = [(ADSettingsClient *)self _localizedBodyWithFormat:v39 forTriggerPhrase:v36 andName:v17];
  [v8 setBody:v29];

  [v8 setHasDefaultAction:1];
  [v8 setDefaultActionURL:v37];
  [v8 setShouldBackgroundDefaultAction:1];
  v30 = [v42 address];
  v31 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"com.apple.siri.notification.js.discovery.%lull", [v30 hash]);

  v32 = +[UNNotificationRequest requestWithIdentifier:v31 content:v8 trigger:0];
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_100345240;
  v43[3] = &unk_10050D440;
  id v44 = v6;
  id v33 = v6;
  [(ADUserNotificationServiceProvider *)v40 postNotificationRequest:v32 completion:v43];
}

- (id)_localizedBodyWithFormat:(id)a3 forTriggerPhrase:(id)a4 andName:(id)a5
{
  id v7 = a5;
  id v8 = [a3 stringByReplacingOccurrencesOfString:@"%TRIGGER_PHRASE%" withString:a4];
  __int16 v9 = [v8 stringByReplacingOccurrencesOfString:@"%HEADPHONES_NAME%" withString:v7];

  return v9;
}

- (void)getInEarDetectionStateForBTAddress:(id)a3 withCompletion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v14 = "-[ADSettingsClient getInEarDetectionStateForBTAddress:withCompletion:]";
    __int16 v15 = 2112;
    id v16 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s Getting in-ear detection state for %@", buf, 0x16u);
  }
  id v8 = +[ADBluetoothManager sharedInstance];
  __int16 v9 = [v8 deviceWithAddress:v5];

  if (v9)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10034546C;
    v10[3] = &unk_10050D250;
    id v11 = v5;
    id v12 = v6;
    [v9 getHeadphoneInEarDetectionState:v10];
  }
  else
  {
    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }
}

- (void)stopObservingBluetoothWirelessSplitterSession
{
  id v2 = +[ADBluetoothWirelessSplitterSessionObserver sharedWirelessSplitterSessionObserver];
  [v2 stopObserving];
}

- (void)startObservingBluetoothWirelessSplitterSession
{
  id v2 = +[ADBluetoothWirelessSplitterSessionObserver sharedWirelessSplitterSessionObserver];
  [v2 startObserving];
}

- (void)getBluetoothWirelessSplitterSessionInfoWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = +[ADBluetoothManager sharedInstance];
  id v5 = [v4 wirelessSplitterSession];

  if (v5)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1003456CC;
    v6[3] = &unk_10050D228;
    id v7 = v3;
    [v5 getSessionInfo:v6];
  }
  else if (v3)
  {
    (*((void (**)(id, void))v3 + 2))(v3, 0);
  }
}

- (void)getPairedBluetoothDeviceInfoArrayWithCompletion:(id)a3
{
}

- (void)getConnectedBluetoothDeviceInfoArrayWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableArray);
  id v5 = +[ADBluetoothManager sharedInstance];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1003457C4;
  v8[3] = &unk_10050DEC0;
  id v9 = v4;
  id v10 = v3;
  id v6 = v3;
  id v7 = v4;
  [v5 getConnectedDevicesWithCompletion:v8];
}

- (void)getBluetoothDeviceInfoWithUID:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[ADBluetoothManager sharedInstance];
  id v8 = [v7 deviceWithUID:v6];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100345C24;
  v10[3] = &unk_10050D1D8;
  id v11 = v5;
  id v9 = v5;
  [v8 getDeviceInfo:v10];
}

- (void)getBluetoothDeviceInfoWithAddress:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[ADBluetoothManager sharedInstance];
  id v8 = [v7 deviceWithAddress:v6];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100345D18;
  v10[3] = &unk_10050D1D8;
  id v11 = v5;
  id v9 = v5;
  [v8 getDeviceInfo:v10];
}

- (void)getHeadGesturesForCurrentlyRoutedDevice:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100345DC8;
  v5[3] = &unk_10050D1B0;
  id v6 = a3;
  id v4 = v6;
  [(ADSettingsClient *)self _executeBlockWithCurrentlyRoutedDevice:v5 withCompletion:v4];
}

- (void)setHeadGesturesForCurrentlyRoutedDevice:(BOOL)a3 withCompletion:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100345E74;
  v6[3] = &unk_10050D188;
  BOOL v8 = a3;
  id v7 = a4;
  id v5 = v7;
  [(ADSettingsClient *)self _executeBlockWithCurrentlyRoutedDevice:v6 withCompletion:v5];
}

- (void)getPersonalVolumeForCurrentlyRoutedDevice:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100345F1C;
  v5[3] = &unk_10050D1B0;
  id v6 = a3;
  id v4 = v6;
  [(ADSettingsClient *)self _executeBlockWithCurrentlyRoutedDevice:v5 withCompletion:v4];
}

- (void)setPersonalVolumeForCurrentlyRoutedDevice:(BOOL)a3 withCompletion:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100345FC8;
  v6[3] = &unk_10050D188;
  BOOL v8 = a3;
  id v7 = a4;
  id v5 = v7;
  [(ADSettingsClient *)self _executeBlockWithCurrentlyRoutedDevice:v6 withCompletion:v5];
}

- (void)getConversationAwarenessForCurrentlyRoutedDevice:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100346070;
  v5[3] = &unk_10050D1B0;
  id v6 = a3;
  id v4 = v6;
  [(ADSettingsClient *)self _executeBlockWithCurrentlyRoutedDevice:v5 withCompletion:v4];
}

- (void)setConversationAwarenessForCurrentlyRoutedDevice:(BOOL)a3 withCompletion:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10034611C;
  v6[3] = &unk_10050D188;
  BOOL v8 = a3;
  id v7 = a4;
  id v5 = v7;
  [(ADSettingsClient *)self _executeBlockWithCurrentlyRoutedDevice:v6 withCompletion:v5];
}

- (void)_executeBlockWithCurrentlyRoutedDevice:(id)a3 withCompletion:(id)a4
{
  id v5 = (void (**)(id, void *))a3;
  id v6 = (void (**)(id, id))a4;
  id v7 = sub_100103320(0);
  BOOL v8 = [v7 btAddress];
  id v9 = +[ADBluetoothManager sharedInstance];
  id v10 = [v9 deviceWithAddress:v8];

  if (v10)
  {
    v5[2](v5, v10);
  }
  else
  {
    id v11 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136315138;
      id v14 = "-[ADSettingsClient _executeBlockWithCurrentlyRoutedDevice:withCompletion:]";
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s Failed to get bluetooth device", (uint8_t *)&v13, 0xCu);
    }
    id v12 = +[AFBluetoothDeviceBooleanSettingResponse newWithBuilder:&stru_10050D160];
    v6[2](v6, v12);
  }
}

- (void)setSiriOutputVolume:(float)a3 forAudioRoute:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = +[ADCommandCenter sharedCommandCenter];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1003463CC;
  v12[3] = &unk_10050D440;
  id v13 = v7;
  id v10 = v7;
  *(float *)&double v11 = a3;
  [v9 setSiriOutputVolume:v8 forAudioRoute:1 operationType:v12 completion:v11];
}

- (void)getSiriOutputVolumeForAudioRoute:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[ADCommandCenter sharedCommandCenter];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1003464B0;
  v9[3] = &unk_10050D120;
  id v10 = v5;
  id v8 = v5;
  [v7 getSiriOutputVolumeForAudioRoute:v6 completion:v9];
}

- (void)fetchExperimentContextWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = +[ADExperimentManager sharedManager];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100346574;
  v6[3] = &unk_10050D0F8;
  id v7 = v3;
  id v5 = v3;
  [v4 getContextWithCompletion:v6];
}

- (void)fetchExperimentConfigurationsWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = +[ADExperimentManager sharedManager];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10034663C;
  v6[3] = &unk_10050CE88;
  id v7 = v3;
  id v5 = v3;
  [v4 getConfigurationsWithCompletion:v6];
}

- (void)sendMetricsToServerWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = +[ADCommandCenter sharedCommandCenter];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100346720;
  v6[3] = &unk_10050D0D0;
  id v7 = v3;
  id v5 = v3;
  [v4 sendMetricsToServerWithTimeout:0 requiresUnlimitedPower:0 requiresActiveSession:0 purgesOversizedStorage:1 ignoresMetricsSenderDisabledSetting:0 scheduledActivity:v6 completion:3600.0];
}

- (void)resetAnalyticsStoreWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = +[ADAnalyticsService sharedService];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1003467E8;
  v6[3] = &unk_10050D0A8;
  id v7 = v3;
  id v5 = v3;
  [v4 accessStoreUsingBlock:v6];
}

- (void)purgeAnalyticsStoreWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = +[ADAnalyticsService sharedService];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10034693C;
  v6[3] = &unk_10050D0A8;
  id v7 = v3;
  id v5 = v3;
  [v4 accessStoreUsingBlock:v6];
}

- (void)fetchEventRecordsFromAnalyticsStoreAtPath:(id)a3 completion:(id)a4
{
  id v5 = a3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100346B3C;
  v12[3] = &unk_10050D0A8;
  id v6 = a4;
  id v13 = v6;
  id v7 = objc_retainBlock(v12);
  if (v5)
  {
    id v8 = [[ADAnalyticsStore alloc] initWithPath:v5];
    ((void (*)(void *, ADAnalyticsStore *))v7[2])(v7, v8);
  }
  else
  {
    id v9 = +[ADAnalyticsService sharedService];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100346B4C;
    v10[3] = &unk_10050D0A8;
    double v11 = v7;
    [v9 accessStoreUsingBlock:v10];

    id v8 = v11;
  }
}

- (void)homeOnboardingFlowInvoked:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v7 = a4;
  id v5 = +[ADPreferences sharedPreferences];
  [v5 setMultiUserIsOnboardingDevice:v4];

  id v6 = v7;
  if (v7)
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
    id v6 = v7;
  }
}

- (void)fetchMultiUserVoiceIdentificationSetting:(id)a3
{
  if (a3)
  {
    id v3 = (void (**)(id, id))a3;
    id v4 = +[ADPreferences sharedPreferences];
    v3[2](v3, [v4 multiUserVoiceIdentification]);
  }
}

- (void)getSharedUserID:(id)a3
{
  if (a3)
  {
    id v3 = (void (**)(id, void *, void *, void))a3;
    id v6 = +[ADPreferences sharedPreferences];
    id v4 = [v6 sharedUserIdentifier];
    id v5 = [v6 loggingSharedUserIdentifier];
    v3[2](v3, v4, v5, 0);
  }
}

- (void)updateMultiUserWithSharedUserId:(id)a3 companionInfo:(id)a4 completion:(id)a5
{
  id v12 = a3;
  id v7 = a4;
  id v8 = (void (**)(id, void *))a5;
  id v9 = +[ADMultiUserService sharedService];
  id v10 = v9;
  if (v9)
  {
    [v9 updateMultiUserWithSharedUserId:v12 companionInfo:v7 completion:v8];
  }
  else if (v8)
  {
    double v11 = +[AFError errorWithCode:13];
    v8[2](v8, v11);
  }
}

- (void)getSharedUserIdForHomeUserId:(id)a3 completion:(id)a4
{
  id v9 = a3;
  id v5 = (void (**)(id, void, void *))a4;
  id v6 = +[ADMultiUserService sharedService];
  id v7 = v6;
  if (v6)
  {
    [v6 getSharedUserIdForHomeUserId:v9 completion:v5];
  }
  else if (v5)
  {
    id v8 = +[AFError errorWithCode:13];
    v5[2](v5, 0, v8);
  }
}

- (void)getHomeUserIdForSharedUserId:(id)a3 completion:(id)a4
{
  id v9 = a3;
  id v5 = (void (**)(id, void, void *))a4;
  id v6 = +[ADMultiUserService sharedService];
  id v7 = v6;
  if (v6)
  {
    [v6 getHomeUserIdForSharedUserId:v9 completion:v5];
  }
  else if (v5)
  {
    id v8 = +[AFError errorWithCode:13];
    v5[2](v5, 0, v8);
  }
}

- (void)updateVoiceIdScoreToUser:(id)a3 score:(id)a4 reset:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v12 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void))a6;
  if (AFSupportsMultiUser())
  {
    double v11 = +[ADMultiUserTestSupport sharedService];
    [v11 updateVoiceIdScoreToUser:v12 score:v9 reset:v7 completion:v10];
  }
  else if (v10)
  {
    v10[2](v10, 0);
  }
}

- (void)showHomeProfileNamesWithCompletion:(id)a3
{
  id v4 = a3;
  AFSupportsMultiUser();
  id v3 = v4;
  if (v4)
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
    id v3 = v4;
  }
}

- (void)resetProfileNames:(BOOL)a3 completion:(id)a4
{
  id v5 = a4;
  AFSupportsMultiUser();
  id v4 = v5;
  if (v5)
  {
    (*((void (**)(id, void))v5 + 2))(v5, 0);
    id v4 = v5;
  }
}

- (void)showLocalProfileNamesWithCompletion:(id)a3
{
  id v4 = a3;
  AFSupportsMultiUser();
  id v3 = v4;
  if (v4)
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
    id v3 = v4;
  }
}

- (void)showMultiUserSharedUserIDsCompletion:(id)a3
{
  id v4 = a3;
  if (AFSupportsMultiUser())
  {
    id v3 = +[ADMultiUserService sharedService];
    [v3 showMultiUserSharedUserIDsCompletion:v4];
  }
  else if (v4)
  {
    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
  }
}

- (void)showPrimaryUserSharedUserIDWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  if (AFSupportsMultiUser())
  {
    id v3 = +[ADMultiUserService sharedService];
    [v3 showPrimaryUserSharedUserIDWithCompletion:v4];
  }
  else if (v4)
  {
    v4[2](v4, 0);
  }
}

- (void)getMultiUserCompanionInfo:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  if (AFSupportsMultiUser())
  {
    id v3 = +[ADMultiUserService sharedService];
    [v3 getMultiUserCompanionInfoWithCompletion:v4];
  }
  else if (v4)
  {
    v4[2](v4, 0);
  }
}

- (void)showMultiUserCompanionInfo:(id)a3
{
  id v3 = a3;
  if (AFSupportsMultiUser())
  {
    id v4 = +[ADMultiUserService sharedService];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100347370;
    v5[3] = &unk_10050D080;
    id v6 = v3;
    [v4 getMultiUserCompanionInfoWithCompletion:v5];
  }
  else if (v3)
  {
    (*((void (**)(id, void))v3 + 2))(v3, 0);
  }
}

- (void)showMultiUsers:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  if (AFSupportsMultiUser())
  {
    id v3 = +[ADMultiUserService sharedService];
    [v3 showMultiUsersWithCompletion:v4];
  }
  else if (v4)
  {
    v4[2](v4, 0);
  }
}

- (void)removeMultiUserUserWithSharedUserId:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v5 = (void (**)(id, void *))a4;
  if (AFSupportsMultiUser())
  {
    id v6 = +[ADMultiUserService sharedService];
    [v6 removeUserWithSharedUserID:v7 completion:v5];
  }
  else
  {
    if (!v5) {
      goto LABEL_6;
    }
    id v6 = +[NSError errorWithDomain:kAFAssistantErrorDomain code:6002 userInfo:&__NSDictionary0__struct];
    v5[2](v5, v6);
  }

LABEL_6:
}

- (void)removeMultiUserUser:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v5 = (void (**)(id, void *))a4;
  if (AFSupportsMultiUser())
  {
    id v6 = +[ADMultiUserService sharedService];
    [v6 removeUserWithHomeUUID:v7 completion:v5];
  }
  else
  {
    if (!v5) {
      goto LABEL_6;
    }
    id v6 = +[NSError errorWithDomain:kAFAssistantErrorDomain code:6002 userInfo:&__NSDictionary0__struct];
    v5[2](v5, v6);
  }

LABEL_6:
}

- (void)addMultiUserUser:(id)a3 sharedId:(id)a4 loggableSharedId:(id)a5 iCloudAltDSID:(id)a6 enrollmentName:(id)a7 isPrimary:(BOOL)a8 completion:(id)a9
{
  BOOL v9 = a8;
  id v20 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v18 = (void (**)(id, void *))a9;
  if (AFSupportsMultiUser())
  {
    id v19 = +[ADMultiUserService sharedService];
    [v19 addUser:v20 sharedUserId:v14 loggableSharedUserId:v15 iCloudAltDSID:v16 enrollmentName:v17 isPrimary:v9 completion:v18];
  }
  else
  {
    if (!v18) {
      goto LABEL_6;
    }
    id v19 = +[NSError errorWithDomain:kAFAssistantErrorDomain code:6002 userInfo:&__NSDictionary0__struct];
    v18[2](v18, v19);
  }

LABEL_6:
}

- (void)getPersonalMultiUserDeviceIdentifiers:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    id v20 = (void (**)(void, id))v3;
    id v21 = objc_alloc_init((Class)NSMutableArray);
    id v5 = +[ADHomeInfoManager sharedInfoManager];
    id v6 = [v5 accessoriesWithPersonalRequestsEnabled];

    id v7 = +[ADDeviceCircleManager sharedInstance];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v8 = v6;
    id v9 = [v8 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v24;
      do
      {
        id v12 = 0;
        do
        {
          if (*(void *)v24 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v23 + 1) + 8 * (void)v12);
          v22[0] = _NSConcreteStackBlock;
          v22[1] = 3221225472;
          v22[2] = sub_100347B58;
          v22[3] = &unk_10050DB08;
          v22[4] = v13;
          id v14 = +[AFPeerInfo newWithBuilder:v22];
          id v15 = [v7 managedPeerInfoMatchingPeerInfo:v14];

          if (v15)
          {
            id v16 = [v15 rapportEffectiveIdentifier];
            [v21 addObject:v16];
          }
          id v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        id v10 = [v8 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }
      while (v10);
    }

    id v17 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      v18 = v17;
      id v19 = [v21 count];
      *(_DWORD *)buf = 136315394;
      v28 = "-[ADSettingsClient getPersonalMultiUserDeviceIdentifiers:]";
      __int16 v29 = 2048;
      id v30 = v19;
      _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "%s Found %lu MU device identifiers", buf, 0x16u);
    }
    id v4 = v20;
    v20[2](v20, v21);
  }
}

- (void)getSharedCompanionInfo:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = +[ADCompanionService sharedInstance];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100347C68;
    v5[3] = &unk_10050D058;
    id v6 = v3;
    [v4 getSharedCompanionInfoWithCompletion:v5];
  }
}

- (void)setNanoAlwaysShowRecognizedSpeech:(BOOL)a3 withCompletion:(id)a4
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (void)setNanoSiriResponseShouldAlwaysPrint:(BOOL)a3 withCompletion:(id)a4
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
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
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (void)setNanoLanguage:(id)a3 withCompletion:(id)a4
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (void)setNanoOutputVoice:(id)a3 withCompletion:(id)a4
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (void)setNanoTTSSpeakerVolume:(id)a3 withCompletion:(id)a4
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (void)setNanoUseDeviceSpeakerForTTS:(id)a3 withCompletion:(id)a4
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (void)setNanoRaiseToSpeakEnabled:(BOOL)a3 withCompletion:(id)a4
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (void)setNanoPhraseSpotterEnabled:(BOOL)a3 withCompletion:(id)a4
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (void)setNanoDictationAutoPunctuationEnabled:(BOOL)a3 withCompletion:(id)a4
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (void)setNanoDictationEnabled:(BOOL)a3 withCompletion:(id)a4
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (void)setNanoAssistantEnabled:(BOOL)a3 withCompletion:(id)a4
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (void)publishFeedbackArbitrationParticipation:(id)a3
{
  id v3 = a3;
  id v4 = +[ADArbitrationFeedbackManager sharedManager];
  [v4 publishParticipation:v3];
}

- (void)getStereoPairState:(id)a3
{
  id v3 = (void (**)(void))a3;
  if (v3)
  {
    id v5 = v3;
    if (AFIsHorseman())
    {
      id v4 = +[ADCompanionService sharedInstance];
      [v4 isStereoPairConfigured];
    }
    else
    {
      id v4 = +[AFError errorWithCode:13];
    }
    v5[2]();

    id v3 = v5;
  }
}

- (void)getStereoPartnerLastMyriadWinDate:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = +[ADMyriadService sharedService];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100347F70;
    v5[3] = &unk_10050D030;
    id v6 = v3;
    [v4 lastMyriadWinForStereoPartner:v5];
  }
}

- (void)getMeCard:(id)a3
{
  id v3 = a3;
  id v4 = +[ADAssistantDataManager sharedDataManager];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10034802C;
  v6[3] = &unk_10050CE88;
  id v7 = v3;
  id v5 = v3;
  [v4 getMeCardsWithCompletion:v6];
}

- (void)getSupplementalLanguagesForProduct:(id)a3 forBuildVersion:(id)a4 completion:(id)a5
{
  if (a5)
  {
    id v6 = a5;
    id v7 = +[AFError errorWithCode:0];
    (*((void (**)(id, void, id))a5 + 2))(v6, 0, v7);
  }
}

- (void)getSupplementalLanguageDictionaryForProduct:(id)a3 completion:(id)a4
{
  if (a4)
  {
    id v5 = a4;
    id v6 = +[AFError errorWithCode:0];
    (*((void (**)(id, void, id))a4 + 2))(v5, 0, v6);
  }
}

- (void)getSupplementalLanguagesModificationDate:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = +[AFError errorWithCode:0];
    (*((void (**)(id, void, id))a3 + 2))(v4, 0, v5);
  }
}

- (void)getSupplementalLanguagesDictionary:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = +[AFError errorWithCode:0];
    (*((void (**)(id, void, id))a3 + 2))(v4, 0, v5);
  }
}

- (void)setSupplementalLanguages:(id)a3 forProduct:(id)a4 forBuildVersion:(id)a5 completion:(id)a6
{
  if (a6)
  {
    id v7 = a6;
    id v8 = +[AFError errorWithCode:0];
    (*((void (**)(id, id))a6 + 2))(v7, v8);
  }
}

- (void)setSupplementalLanguageDictionary:(id)a3 forProduct:(id)a4 completion:(id)a5
{
  if (a5)
  {
    id v6 = a5;
    id v7 = +[AFError errorWithCode:0];
    (*((void (**)(id, id))a5 + 2))(v6, v7);
  }
}

- (void)postTestResultSelectedWithRcId:(id)a3
{
  id v3 = a3;
  id v4 = +[ADCommandCenter sharedCommandCenter];
  [v4 postTestResultSelectedWithRcId:v3];
}

- (void)postTestResultCandidateWithRcId:(id)a3 recognitionSausage:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[ADCommandCenter sharedCommandCenter];
  [v7 postTestResultCandidateWithRcId:v6 recognitionSausage:v5];
}

- (void)hasEverSetLanguageCodeWithCompletion:(id)a3
{
  id v3 = (void (**)(id, uint64_t, void))a3;
  id v4 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v12 = 136315138;
    uint64_t v13 = "-[ADSettingsClient hasEverSetLanguageCodeWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v12, 0xCu);
  }
  id v5 = +[AFPreferences sharedPreferences];
  id v6 = [v5 _languageCodeWithFallback:0];

  if (v6)
  {
    v3[2](v3, 1, 0);
  }
  else
  {
    id v7 = +[AFPreferences sharedPreferences];
    uint64_t v8 = [v7 cloudSyncEnabled];

    if ((v8 & 1) != 0
      && (+[ADCloudKitManager sharedManager],
          id v9 = objc_claimAutoreleasedReturnValue(),
          unsigned int v10 = [v9 preferencesHaveBeenSynchronized],
          v9,
          !v10))
    {
      uint64_t v11 = +[ADCloudKitManager sharedManager];
      [v11 hasEverSetLanguageCodeWithCompletion:v3];
    }
    else
    {
      v3[2](v3, 0, 0);
    }
  }
}

- (void)stopAllAudioPlaybackRequests:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[ADSpeechManager sharedManager];
  id v4 = [v5 audioPlaybackService];
  [v4 stopAllRequests:v3 completion:0];
}

- (void)stopAudioPlaybackRequest:(id)a3 immediately:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v7 = +[ADSpeechManager sharedManager];
  id v6 = [v7 audioPlaybackService];
  [v6 stopRequest:v5 immediately:v4];
}

- (void)startAudioPlaybackRequest:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v10 = +[ADSpeechManager sharedManager];
  id v9 = [v10 audioPlaybackService];
  [v9 startRequest:v8 options:a4 completion:v7];
}

- (void)getPeerIdentifiers:(id)a3
{
  BOOL v3 = (void (**)(id, id))a3;
  id v4 = objc_alloc_init((Class)NSMutableArray);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = +[ADPeerCloudService sharedInstance];
  id v6 = [v5 peers];

  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [*(id *)(*((void *)&v12 + 1) + 8 * (void)v10) dictionaryRepresentation];
        [v4 addObject:v11];

        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  if (v3) {
    v3[2](v3, v4);
  }
}

- (void)startRemoteRequest:(id)a3 onPeer:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v7 handoffOriginDeviceName];

  if (!v10)
  {
    long long v13 = AFUserAssignedDeviceName();
    [v7 setHandoffOriginDeviceName:v13];

    if (v8) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v11 = +[ADCommandCenter sharedCommandCenter];
    [(ADPeerInfo *)v11 startRemoteRequest:v7 completion:v9];
    goto LABEL_6;
  }
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v11 = [[ADPeerInfo alloc] initWithIDSIdentifer:v8];
  long long v12 = +[ADPeerCloudService sharedInstance];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100348A5C;
  v14[3] = &unk_10050E250;
  id v15 = v9;
  [v12 startRemoteRequest:v7 onPeer:v11 completion:v14];

LABEL_6:
}

- (void)_createMockServerIfNeededAndSetActiveWithCompletion:(id)a3
{
  id v4 = a3;
  +[ADCommandCenter sharedCommandCenter];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100348B9C;
  v7[3] = &unk_10050D008;
  v7[4] = self;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = v4;
  id v5 = v4;
  id v6 = v8;
  [v6 fetchAccounts:v7];
}

- (void)startUIMockServerRequestWithReplayFileURL:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  +[ADCommandCenter sharedCommandCenter];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100348DC8;
  v11[3] = &unk_10050CFA0;
  v11[4] = self;
  id v12 = v6;
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  id v14 = v7;
  id v8 = v13;
  id v9 = v7;
  id v10 = v6;
  [v8 fetchActiveAccountIdentifier:v11];
}

- (void)dismissUI
{
  id v2 = +[ADCommandCenter sharedCommandCenter];
  [v2 dismissAssistant];
}

- (void)startUIRequestWithSpeechAudioFileURL:(id)a3
{
  id v3 = a3;
  id v7 = [objc_alloc((Class)AFSpeechRequestOptions) initWithActivationEvent:19];
  [v7 setAudioFileURL:v3];

  id v4 = +[NSNumber numberWithUnsignedLongLong:mach_absolute_time()];
  [v7 setNotifyState:v4];

  if (AFIsHorseman())
  {
    id v5 = objc_alloc_init((Class)AFRequestInfo);
    [v5 setActivationEvent:8];
    [v5 setSpeechRequestOptions:v7];
    id v6 = +[ADCommandCenter sharedCommandCenter];
    [v6 handleExternalActivationRequest:v5 completion:0];
  }
  else
  {
    id v5 = +[ADCommandCenter sharedCommandCenter];
    [v5 handleRemoteSpeechRequest:v7 completion:0];
  }
}

- (void)startMultiUserUIRequestWithText:(id)a3 expectedSpeakerSharedUserID:(id)a4 expectedSpeakerConfidenceScore:(unint64_t)a5 nonspeakerConfidenceScores:(id)a6 completion:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  if (AFSupportsMultiUser())
  {
    id v15 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136316162;
      id v22 = "-[ADSettingsClient startMultiUserUIRequestWithText:expectedSpeakerSharedUserID:expectedSpeakerConfidenceScor"
            "e:nonspeakerConfidenceScores:completion:]";
      __int16 v23 = 2112;
      id v24 = v11;
      __int16 v25 = 2112;
      id v26 = v12;
      __int16 v27 = 2048;
      unint64_t v28 = a5;
      __int16 v29 = 2112;
      id v30 = v13;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s %@ %@ %lu %@", buf, 0x34u);
    }
    id v16 = objc_alloc_init((Class)AFRequestInfo);
    [v16 setText:v11];
    [v16 setExpectedSpeakerSharedUserID:v12];
    [v16 setExpectedSpeakerConfidenceScore:a5];
    [v16 setNonspeakerConfidenceScores:v13];
    [v16 setActivationEvent:8];
    id v17 = +[ADCommandCenter sharedCommandCenter];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100349440;
    v19[3] = &unk_10050CF78;
    id v20 = v14;
    [v17 handleExternalActivationRequest:v16 completion:v19];
  }
  else if (v14)
  {
    v18 = +[NSError errorWithDomain:kAFAssistantErrorDomain code:6004 userInfo:0];
    (*((void (**)(id, void *))v14 + 2))(v14, v18);
  }
}

- (void)startUIRequestWithText:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init((Class)AFRequestInfo);
  [v7 setText:v6];

  [v7 setActivationEvent:8];
  id v8 = +[ADCommandCenter sharedCommandCenter];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10034959C;
  v10[3] = &unk_10050CF78;
  id v11 = v5;
  id v9 = v5;
  [v8 handleExternalActivationRequest:v7 completion:v10];
}

- (void)startUIRequestWithInfo:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[ADCommandCenter sharedCommandCenter];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100349718;
  v9[3] = &unk_10050CF78;
  id v10 = v5;
  id v8 = v5;
  [v7 handleExternalActivationRequest:v6 completion:v9];
}

- (void)setSpeechProfileExternalOfflineModelRootPath:(id)a3 completion:(id)a4
{
  id v7 = (void (**)(id, void))a4;
  id v5 = a3;
  id v6 = +[AFPreferences sharedPreferences];
  [v6 setSpeechProfileExternalOfflineModelRootPath:v5];

  v7[2](v7, 0);
}

- (void)setOfflineDictationProfileOverridePath:(id)a3 completion:(id)a4
{
  id v7 = (void (**)(id, void))a4;
  id v5 = a3;
  id v6 = +[AFPreferences sharedPreferences];
  [v6 setOfflineDictationProfileOverridePath:v5];

  v7[2](v7, 0);
}

- (void)createOfflineSpeechProfileWithLanguage:(id)a3 modelOverridePath:(id)a4 JSONData:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(ADSettingsClient *)self _localSpeechRecognizer];
  [v14 createSpeechProfileWithLanguage:v13 modelOverridePath:v12 JSONData:v11 completion:v10];
}

- (void)getOfflineDictationStatusWithCompletion:(id)a3
{
  id v3 = (void (**)(id, id, void))a3;
  id v4 = +[SFEntitledAssetManager sharedInstance];
  id v5 = +[SFEntitledAssetManager subscriberIdForDictationAssets];
  id v6 = [v4 detailedInstallationStatusForLanguagesWithAssetType:3 subscriberId:v5];

  v3[2](v3, v6, 0);
}

- (void)getOfflineAssistantStatusWithCompletion:(id)a3
{
  id v3 = (void (**)(id, id, void))a3;
  id v4 = +[SFEntitledAssetManager sharedInstance];
  id v5 = +[SFEntitledAssetManager subscriberIdForDictationAssets];
  id v6 = [v4 detailedInstallationStatusForLanguagesWithAssetType:3 subscriberId:v5];

  v3[2](v3, v6, 0);
}

- (id)_localSpeechRecognizer
{
  localSpeechRecognizer = self->_localSpeechRecognizer;
  if (!localSpeechRecognizer)
  {
    id v4 = (CoreEmbeddedSpeechRecognizer *)[objc_alloc((Class)CoreEmbeddedSpeechRecognizer) initWithDelegate:0 instanceUUID:&CoreEmbeddedSpeechRecognizerInstanceUUIDInteractive];
    id v5 = self->_localSpeechRecognizer;
    self->_localSpeechRecognizer = v4;

    localSpeechRecognizer = self->_localSpeechRecognizer;
  }
  return localSpeechRecognizer;
}

- (void)setLanguage:(id)a3 outputVoice:(id)a4 withCompletion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = (__CFString *)a3;
  id v10 = objc_alloc((Class)NSMutableDictionary);
  id v11 = [v8 dictionaryRepresentation];
  id v15 = [v10 initWithDictionary:v11];

  if (v9) {
    CFStringRef v12 = v9;
  }
  else {
    CFStringRef v12 = @"nil";
  }
  [v15 setObject:v12 forKey:@"language"];
  id v13 = +[AFAnalytics sharedAnalytics];
  [v13 logEventWithType:3201 context:v15];

  id v14 = +[ADCommandCenter sharedCommandCenter];
  [v14 setLanguageCode:v9 outputVoice:v8 withCompletion:v7];
}

- (void)setLanguage:(id)a3 withCompletion:(id)a4
{
  id v5 = a4;
  id v6 = (__CFString *)a3;
  id v7 = +[AFAnalytics sharedAnalytics];
  if (v6) {
    CFStringRef v8 = v6;
  }
  else {
    CFStringRef v8 = @"nil";
  }
  CFStringRef v11 = @"language";
  CFStringRef v12 = v8;
  id v9 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  [v7 logEventWithType:3201 context:v9];

  id v10 = +[ADCommandCenter sharedCommandCenter];
  [v10 setLanguageCode:v6 withCompletion:v5];
}

- (void)setOutputVoice:(id)a3 withCompletion:(id)a4
{
  id v10 = a4;
  id v5 = a3;
  id v6 = +[AFAnalytics sharedAnalytics];
  id v7 = [v5 dictionaryRepresentation];
  [v6 logEventWithType:3202 context:v7];

  CFStringRef v8 = +[ADCommandCenter sharedCommandCenter];
  [v8 setOutputVoice:v5];

  id v9 = v10;
  if (v10)
  {
    (*((void (**)(id))v10 + 2))(v10);
    id v9 = v10;
  }
}

- (void)getAvailableVoicesIncludingAssetInfo:(BOOL)a3 completion:(id)a4
{
  id v5 = (void (**)(id, void))a4;
  char v6 = sub_1001FA16C();
  if (v5 && (v6 & 1) == 0) {
    v5[2](v5, 0);
  }
  id v7 = dispatch_get_global_queue(0, 0);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100349F04;
  v9[3] = &unk_10050CF50;
  BOOL v11 = a3;
  id v10 = v5;
  CFStringRef v8 = v5;
  dispatch_async(v7, v9);
}

- (void)handleCommand:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v15 = "-[ADSettingsClient handleCommand:completion:]";
    __int16 v16 = 2112;
    id v17 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s Received %@", buf, 0x16u);
  }
  CFStringRef v8 = +[AceObject aceObjectWithDictionary:v5];
  if (v8)
  {
    id v9 = +[ADCommandCenter sharedCommandCenter];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10034A62C;
    v12[3] = &unk_10050CF00;
    id v13 = v6;
    [v9 handleCommand:v8 completion:v12];

    id v10 = v13;
LABEL_9:

    goto LABEL_10;
  }
  if (v6)
  {
    id v10 = +[AFError errorWithCode:11];
    BOOL v11 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      id v15 = "-[ADSettingsClient handleCommand:completion:]";
      __int16 v16 = 2112;
      id v17 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s Responding %@", buf, 0x16u);
    }
    (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v10);
    goto LABEL_9;
  }
LABEL_10:
}

- (void)getAudioSessionCoordinationSnapshotWithCompletion:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v5 = +[ADSpeechManager sharedManager];
    id v4 = [v5 audioSessionCoordinator];
    [v4 getSnapshotWithCompletion:v3];
  }
}

- (void)getCurrentNWActivityIDWithCompletion:(id)a3
{
  id v3 = a3;
  if (sub_1000648C0())
  {
    id v4 = +[SNNetworkActivityTracing sharedInstance];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10034A8DC;
    v14[3] = &unk_10050CED8;
    id v5 = &v15;
    id v15 = v3;
    id v6 = v3;
    id v7 = (void ***)v14;
  }
  else
  {
    id v4 = +[SiriCoreNetworkActivityTracing sharedNetworkActivityTracing];
    id v9 = _NSConcreteStackBlock;
    uint64_t v10 = 3221225472;
    BOOL v11 = sub_10034A8F4;
    CFStringRef v12 = &unk_10050CED8;
    id v5 = &v13;
    id v13 = v3;
    id v8 = v3;
    id v7 = &v9;
  }
  objc_msgSend(v4, "currentNetworkActivityTokenWithCompletion:", v7, v9, v10, v11, v12);
}

- (void)resetExperimentForConfigurationIdentifier:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[ADExperimentManager sharedManager];
  [v7 resetExperimentForConfigurationIdentifier:v6 completion:v5];
}

- (void)synchronizeExperimentConfigurationsIfApplicableWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = +[ADExperimentManager sharedManager];
  [v4 synchronizeExperimentConfigurationsIfApplicableWithCompletion:v3];
}

- (void)getExperimentForConfigurationIdentifier:(id)a3 completion:(id)a4
{
  id v5 = a4;
  if (v5)
  {
    id v6 = a3;
    id v7 = +[ADExperimentManager sharedManager];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10034AABC;
    v8[3] = &unk_10050CEB0;
    id v9 = v5;
    [v7 getExperimentForConfigurationIdentifier:v6 completion:v8];
  }
}

- (void)getProximityTuplesWithCompletion:(id)a3
{
  id v3 = a3;
  if (AFSupportsHALProximityScanning())
  {
    if (v3)
    {
      id v4 = +[ADDeviceProximityManager sharedManager];
      [v4 performProximityScan];

      id v5 = +[ADCommandCenter sharedCommandCenter];
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_10034ACA0;
      v6[3] = &unk_10050CE88;
      id v7 = v3;
      [v5 getCrossDeviceContextWithCompletion:v6];
    }
  }
  else
  {
    (*((void (**)(id, void))v3 + 2))(v3, 0);
  }
}

- (void)getCapabilitiesDataFromReachableDevicesWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = +[ADDeviceCircleManager sharedInstance];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10034AE34;
  v6[3] = &unk_10050CE88;
  id v7 = v3;
  id v5 = v3;
  [v4 getCapabilitiesForReachableDevicesWithCompletion:v6];
}

- (void)getManagedLocalAndRemotePeerInfoWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = +[ADDeviceCircleManager sharedInstance];
  [v4 getManagedLocalAndRemotePeerInfoWithCompletion:v3];
}

- (void)setHardcodedBluetoothProximity:(id)a3
{
}

- (void)getContextCollectorsInfoWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = +[ADDeviceCircleManager sharedInstance];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10034B10C;
  v6[3] = &unk_10050CE20;
  id v7 = v3;
  id v5 = v3;
  [v4 getContextCollectorDeviceIdentifiersWithCompletion:v6];
}

- (void)getOriginDeviceInfoForContextIdentifier:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[ADCommandCenter sharedCommandCenter];
  [v7 getOriginDeviceInfoForContextIdentifier:v6 completion:v5];
}

- (void)getCrossDeviceContextWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = +[ADCommandCenter sharedCommandCenter];
  [v4 getCrossDeviceContextWithCompletion:v3];
}

- (void)getCurrentContextSnapshotWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = +[ADCommandCenter sharedCommandCenter];
  [v4 getCurrentContextSnapshotWithCompletion:v3];
}

- (void)forceMultiUserSync:(BOOL)a3 download:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v7 = (void (**)(id, void))a5;
  if (AFIsHorseman())
  {
    if (v7) {
      v7[2](v7, 0);
    }
  }
  else
  {
    id v8 = +[ADCloudKitManager sharedManager];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10034B4CC;
    v9[3] = &unk_10050D440;
    uint64_t v10 = v7;
    [v8 forceMultiUserSync:v6 download:v5 activity:0 completion:v9];
  }
}

- (void)getDevicesWithAvailablePHSAssetsOnDeviceCheck:(id)a3
{
  id v3 = a3;
  id v4 = +[ADCloudKitManager sharedManager];
  [v4 getDevicesWithAvailablePHSAssetsOnDeviceCheck:v3];
}

- (void)getDevicesWithAvailablePHSAssetsForLanguage:(id)a3 completion:(id)a4
{
  id v7 = a3;
  BOOL v5 = (void (**)(id, void))a4;
  if (AFIsHorseman())
  {
    if (v5) {
      v5[2](v5, 0);
    }
  }
  else
  {
    BOOL v6 = +[ADCloudKitManager sharedManager];
    [v6 getDevicesWithAvailablePHSAssetsForLanguage:v7 completion:v5];
  }
}

- (void)disableAndDeleteCloudSyncWithCompletion:(id)a3
{
  id v3 = (void (**)(id, void))a3;
  id v4 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315138;
    id v9 = "-[ADSettingsClient disableAndDeleteCloudSyncWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v8, 0xCu);
  }
  if (AFIsHorseman())
  {
    BOOL v5 = AFSiriLogContextDaemon;
    BOOL v6 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR);
    if (v3)
    {
      if (v6)
      {
        int v8 = 136315138;
        id v9 = "-[ADSettingsClient disableAndDeleteCloudSyncWithCompletion:]";
        _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%s Unsupported platform", (uint8_t *)&v8, 0xCu);
      }
      v3[2](v3, 0);
    }
    else if (v6)
    {
      int v8 = 136315138;
      id v9 = "-[ADSettingsClient disableAndDeleteCloudSyncWithCompletion:]";
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%s Unsupported platform. No completion handler.", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    id v7 = +[ADCloudKitManager sharedManager];
    [v7 disableAndDeleteCloudSyncWithCompletion:v3];
  }
}

- (void)_runServiceMaintenance
{
  id v2 = +[ADCommandCenter sharedCommandCenter];
  [v2 runServiceMaintenanceWithCompletion:0];
}

- (void)_setSyncVerificationNeededAndFullReportNeeded:(BOOL)a3 shouldPostNotification:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  if (v5)
  {
    uint64_t v20 = 0;
    id v21 = &v20;
    uint64_t v22 = 0x3032000000;
    __int16 v23 = sub_10034B96C;
    id v24 = sub_10034B97C;
    id v25 = 0;
    id v9 = +[NSNotificationCenter defaultCenter];
    id v14 = _NSConcreteStackBlock;
    uint64_t v15 = 3221225472;
    __int16 v16 = sub_10034B984;
    id v17 = &unk_10050CDF8;
    id v18 = v8;
    id v19 = &v20;
    uint64_t v10 = [v9 addObserverForName:@"ADSyncVerificationFinishedNotification" object:0 queue:0 usingBlock:&v14];

    BOOL v11 = (void *)v21[5];
    v21[5] = v10;

    _Block_object_dispose(&v20, 8);
  }
  if (v6)
  {
    CFStringRef v12 = +[ADCommandCenter sharedCommandCenter];
    [v12 setSyncDelegate:self];
  }
  id v13 = +[ADCommandCenter sharedCommandCenter];
  [v13 setSyncVerificationNeededAndFullReportNeeded:v6 shouldPostNotification:v5];
}

- (void)_fetchPeerData:(id)a3
{
  id v3 = a3;
  id v4 = +[ADCommandCenter sharedCommandCenter];
  [v4 updateSharedDataFromPeerUseCache:0 completion:v3];
}

- (void)_syncDataWithAnchorKeys:(id)a3 forceReset:(BOOL)a4 reason:(id)a5 reply:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ADSettingsClient _syncDataWithAnchorKeys:forceReset:reason:reply:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = self;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s Got sync command on connection %@", buf, 0x16u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  id v24 = sub_10034B96C;
  id v25 = sub_10034B97C;
  id v26 = 0;
  id v14 = +[NSNotificationCenter defaultCenter];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10034BD74;
  v19[3] = &unk_10050CDF8;
  id v15 = v12;
  id v20 = v15;
  id v21 = buf;
  __int16 v16 = [v14 addObserverForName:@"ADSyncFinishedNotification" object:0 queue:0 usingBlock:v19];

  objc_storeStrong((id *)(*(void *)&buf[8] + 40), v16);
  id v17 = +[ADCommandCenter sharedCommandCenter];
  id v22 = v11;
  id v18 = +[NSArray arrayWithObjects:&v22 count:1];
  [v17 syncAnchorKeys:v10 forceReset:v8 reasons:v18];

  _Block_object_dispose(buf, 8);
}

- (void)_isInactiveDeviceSyncDisabled:(id)a3
{
  if (a3)
  {
    id v5 = a3;
    BOOL v4 = sub_1001FBAA0();
    (*((void (**)(id, BOOL))a3 + 2))(v5, v4);
  }
}

- (void)_isInactiveDeviceSyncDisabledByTrial:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = +[ADSyncConfigAssetManager sharedInstance];
    (*((void (**)(id, id))a3 + 2))(v4, [v5 isInactiveDeviceSyncDisabled]);
  }
}

- (void)_clearSyncNeededForKey:(id)a3
{
  id v5 = a3;
  id v3 = a3;
  id v4 = +[NSArray arrayWithObjects:&v5 count:1];

  sub_1002E7490(v4);
}

- (void)_setSyncNeededForReason:(id)a3
{
}

- (void)configOverrides:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v6 = +[AFPreferences sharedPreferences];
    id v5 = [v6 configOverrides];
    (*((void (**)(id, void *))a3 + 2))(v4, v5);
  }
}

- (void)setConfigOverrides:(id)a3 completion:(id)a4
{
  id v8 = a4;
  id v5 = a3;
  id v6 = +[AFPreferences sharedPreferences];
  [v6 setConfigOverrides:v5];

  id v7 = v8;
  if (v8)
  {
    (*((void (**)(id))v8 + 2))(v8);
    id v7 = v8;
  }
}

- (void)barrierWithReply:(id)a3
{
}

- (void)_resetSessionsAtNextRequestBoundary
{
  id v2 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    id v5 = "-[ADSettingsClient _resetSessionsAtNextRequestBoundary]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }
  id v3 = +[ADCommandCenter sharedQueue];
  dispatch_async(v3, &stru_10050CDD0);
}

- (void)_shutdownSessionIfIdle
{
  id v2 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    id v5 = "-[ADSettingsClient _shutdownSessionIfIdle]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }
  id v3 = +[ADCommandCenter sharedCommandCenter];
  [v3 shutdownSessionIfIdle];
}

- (void)_killDaemon
{
  id v2 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    id v5 = "-[ADSettingsClient _killDaemon]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "%s Shutting down at the request of settings", (uint8_t *)&v4, 0xCu);
  }
  id v3 = +[ADDaemon sharedDaemon];
  [v3 shutdown];
}

- (void)setEnableAssistantLogging:(BOOL)a3
{
  BOOL v3 = a3;
  int v4 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    CFStringRef v5 = @"Disabling";
    if (v3) {
      CFStringRef v5 = @"Enabling";
    }
    int v8 = 136315394;
    id v9 = "-[ADSettingsClient setEnableAssistantLogging:]";
    __int16 v10 = 2112;
    CFStringRef v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s %@ extra assistant logging", (uint8_t *)&v8, 0x16u);
  }
  id v6 = +[AFPreferences sharedPreferences];
  [v6 setFileLoggingIsEnabled:v3];
  [v6 setCardLoggingEnabled:v3];
  [v6 setCommandLoggingEnabled:v3];
  [v6 setAVVCLoggingEnabled:v3];
  VSPreferencesSetLogging();
  id v7 = +[VTPreferences sharedPreferences];
  [v7 setFileLoggingIsEnabled:v3];

  AFInternalPreferencesSynchronize();
  [v6 synchronizeLogPreferencesDomain];
  [v6 synchronizeAVVCPreferencesDomain];
}

- (void)suppressLowStorageNotificationForLanguage:(id)a3 suppress:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = +[AFPreferences sharedPreferences];
  [v6 _suppressLowStorageNotificationForLanguage:v5 suppress:v4];
}

- (void)setDictationAutoPunctuationEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[AFPreferences sharedPreferences];
  [v4 _setDictationAutoPunctuationEnabledLocal:v3];
}

- (void)setDictationEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[ADCommandCenter sharedCommandCenter];
  [v5 setDictationEnabled:v3];

  int v6 = AFOfflineDictationCapable();
  if (v3)
  {
    if (v6)
    {
      id v7 = +[NSLocale currentLocale];
      int v8 = [v7 languageIdentifier];

      id v9 = +[ADDictationOfflineStatusObserver sharedDictationOfflineStatusObserver];
      __int16 v10 = [v9 offlineDictationStatus];

      CFStringRef v11 = [v10 allKeys];
      id v12 = +[NSSet setWithArray:v11];

      AFOfflineDictationLanguageForKeyboardLanguage();
      id v16 = (id)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        id v13 = [objc_alloc((Class)SFEntitledAssetConfig) initWithLanguage:v16 assetType:3];
        id v14 = +[SFEntitledAssetManager subscriberIdForDictationAssets];
        +[SFEntitledAssetManager subscribeToAssetWithConfig:v13 regionId:0 subscriberId:v14 expiration:0];
      }
    }
  }
  else if (v6)
  {
    id v15 = dispatch_get_global_queue(-2, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10034C814;
    block[3] = &unk_10050E138;
    block[4] = self;
    dispatch_async(v15, block);
  }
}

- (void)setAssistantEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315138;
    int v8 = "-[ADSettingsClient setAssistantEnabled:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v7, 0xCu);
  }
  id v5 = +[ADCommandCenter sharedCommandCenter];
  [v5 setAssistantEnabled:v3];

  if (!v3)
  {
    int v6 = dispatch_get_global_queue(-2, 0);
    dispatch_async(v6, &stru_10050CDB0);

    +[NLRouterCacheManager deleteAll];
  }
}

- (void)fetchActiveAccount:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = +[ADCommandCenter sharedCommandCenter];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10034CAC8;
    v5[3] = &unk_10050CD90;
    id v6 = v3;
    [v4 fetchActiveAccount:v5];
  }
}

- (void)setActiveAccountIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = +[ADCommandCenter sharedCommandCenter];
  [v4 setActiveAccountIdentifier:v3];
}

- (void)deleteAccountWithIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = +[ADCommandCenter sharedCommandCenter];
  [v4 deleteAccountWithIdentifier:v3];
}

- (void)_saveAccount:(id)a3 setActive:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  [v7 save];
  if (v4)
  {
    id v5 = +[ADCommandCenter sharedCommandCenter];
    id v6 = [v7 identifier];
    [v5 setActiveAccountIdentifier:v6];
  }
  notify_post("com.apple.assistant.siri_settings_did_change");
}

- (void)saveAccountWithMessageDictionary:(id)a3 setActive:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = kAFAccountInfoIdentifierKey;
  id v7 = a3;
  int v8 = [v7 objectForKey:v6];
  id v18 = +[ADAccount accountForIdentifier:v8];

  id v9 = [v7 objectForKey:kAFAccountInfoAssistantIdentifierKey];
  [v18 setAssistantIdentifier:v9];

  __int16 v10 = [v7 objectForKey:kAFAccountInfoHostnameKey];
  [v18 setHostname:v10];

  CFStringRef v11 = [v7 objectForKey:kAFAccountInfoPredefinedServerKey];
  [v18 setPredefinedServer:v11];

  id v12 = [v7 objectForKey:kAFAccountInfoLabelKey];
  [v18 setLabel:v12];

  id v13 = [v7 objectForKey:kAFAccountInfoGroupKey];
  [v18 setGroup:v13];

  id v14 = [v7 objectForKey:kAFAccountInfoSpeechIdentifierKey];
  [v18 setSpeechIdentifier:v14];

  id v15 = [v7 objectForKey:kAFAccountInfoPeerAssistantIdentifierKey];
  [v18 setPeerAssistantIdentifier:v15];

  id v16 = [v7 objectForKey:kAFAccountInfoPeerSpeechIdentifierKey];
  [v18 setPeerSpeechIdentifier:v16];

  id v17 = [v7 objectForKey:kAFAccountInfoPeerUserAgentStringKey];

  [v18 setPeerUserAgentString:v17];
  [(ADSettingsClient *)self _saveAccount:v18 setActive:v4];
}

- (void)retrieveAccountMessageDictionariesWithReply:(id)a3
{
  id v3 = a3;
  BOOL v4 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    CFStringRef v11 = "-[ADSettingsClient retrieveAccountMessageDictionariesWithReply:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  +[ADCommandCenter sharedCommandCenter];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10034D0AC;
  v7[3] = &unk_10050DEC0;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = v3;
  id v5 = v3;
  id v6 = v8;
  [v6 fetchAccounts:v7];
}

- (void)fetchSupportedLanguagesWithReply:(id)a3
{
  id v3 = a3;
  BOOL v4 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    id v7 = "-[ADSettingsClient fetchSupportedLanguagesWithReply:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s Settings is fetching supported languages", (uint8_t *)&v6, 0xCu);
  }
  id v5 = +[ADCommandCenter sharedCommandCenter];
  [v5 fetchSupportedLanguagesWithCompletion:v3];
}

- (id)_serviceDelegateWithErrorHandler:(id)a3
{
  return [(NSXPCConnection *)self->_xpcConnection remoteObjectProxyWithErrorHandler:a3];
}

- (id)_serviceDelegate
{
  return [(NSXPCConnection *)self->_xpcConnection remoteObjectProxy];
}

- (void)connectionDisconnected
{
  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = 0;

  [(CoreEmbeddedSpeechRecognizer *)self->_localSpeechRecognizer invalidate];
  localSpeechRecognizer = self->_localSpeechRecognizer;
  self->_localSpeechRecognizer = 0;
}

- (ADSettingsClient)initWithXPCConnection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ADSettingsClient;
  int v6 = [(ADSettingsClient *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_xpcConnection, a3);
  }

  return v7;
}

@end