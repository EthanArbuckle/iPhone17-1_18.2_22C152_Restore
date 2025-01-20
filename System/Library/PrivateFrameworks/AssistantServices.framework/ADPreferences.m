@interface ADPreferences
+ (id)sharedPreferences;
- (ADPreferences)init;
- (ADPreferences)initWithInstanceContext:(id)a3;
- (BOOL)_validatePhsManifestData:(id)a3;
- (BOOL)allowExplicitContent;
- (BOOL)deviceWasRedirectedToProduction;
- (BOOL)dictationLanguageDetectorEnabled;
- (BOOL)getAudioSessionActiveDelay:(double *)a3;
- (BOOL)getMaximumOutputVolume:(float *)a3;
- (BOOL)getMinimumOutputVolume:(float *)a3;
- (BOOL)hasSetUpAccountStatusRecordZoneSubscription;
- (BOOL)hasSetUpKeyValueRecordZoneSubscription;
- (BOOL)hasSetUpMultiUserSharedRecordZoneSubscription;
- (BOOL)hasSetUpVoiceTriggerRecordZoneSubscription;
- (BOOL)homeAutomationServerFlowBypassed;
- (BOOL)ignoreLocationWiFiStatus;
- (BOOL)isMultiUserSyncerMeDevice;
- (BOOL)isSearchDataSharingStatusForced;
- (BOOL)isSiriFullUODSupported;
- (BOOL)isSiriNetworkActivated;
- (BOOL)isUsingDefaultLanguageSettings;
- (BOOL)locationAuthorizationHasBeenUpdated;
- (BOOL)metricsSenderDisabled;
- (BOOL)mirroredMultiUserSharedDataNeedsSync;
- (BOOL)multiUserIsOnboardingDevice;
- (BOOL)multiUserSharedDataNeedsSync;
- (BOOL)multiUserVoiceIdentification;
- (BOOL)proxyConnectionDisabled;
- (BOOL)siriDataSharingHomePodSetupDeviceIsValid;
- (BOOL)statisticsRecordingEnabled;
- (BOOL)voiceTriggerNeedsDataSync;
- (double)myriadDeviceVTEndTimeDistanceThreshold;
- (double)serverTimeoutInterval;
- (id)_cachedKeychainStringForKey:(id)a3;
- (id)_keychainCache;
- (id)_keychainStringForKey:(id)a3;
- (id)accountIdentifiers;
- (id)accountInfoForIdentifier:(id)a3;
- (id)accountStatusServerChangeToken;
- (id)activeAccountIdentifier;
- (id)cloudKitSharedDatabaseChangeToken;
- (id)companionIdentifier;
- (id)countryCode;
- (id)deviceOwner;
- (id)experimentIdentifierForConfigurationIdentifier:(id)a3;
- (id)experimentsUAFEmitted;
- (id)getExperimentStateForConfigurationIdentifier:(id)a3;
- (id)internalAuthAppleConnectServiceTicket;
- (id)internalAuthSessionToken;
- (id)keyValueServerChangeToken;
- (id)languageCode;
- (id)languageCodeWithFallback:(BOOL)a3;
- (id)lastCompanionRemoteDataFetchDate;
- (id)lastDeviceExperimentCheckDate;
- (id)lastKnownProxyStreamId;
- (id)lastMetricsUploadDate;
- (id)lastMetricsUploadFailureReportedOnDate;
- (id)lastServerExperimentCheckDate;
- (id)lastSyncVerificationDate;
- (id)loggingSharedUserIdentifier;
- (id)multiUserHomeUUIDsForDeletion;
- (id)multiUserPrimaryUser;
- (id)multiUserSetupCompleteTimes;
- (id)multiUserSetupStartTimes;
- (id)multiUserSharedDataServerChangeToken;
- (id)multiUserSharedDataServerChangeTokenForOwner:(id)a3;
- (id)multiUserSharedUsers;
- (id)multiUserSyncerBackupIdentifiersAnchor;
- (id)multiUserSyncerIdentifiersAnchor;
- (id)multiUserSyncerSADAnchor;
- (id)outputVoice;
- (id)outputVoiceWithFallback:(BOOL)a3;
- (id)overrideAudioSessionActiveDelay;
- (id)phsAssetManifest:(BOOL)a3;
- (id)productTypePrefix;
- (id)redirectForServerURLString:(id)a3;
- (id)serverAudioSessionActivationDelay;
- (id)serverAudioSessionActivationDelayAboveMediaPlaybackVolumeThreshold;
- (id)serverMediaPlaybackVolumeThresholdForAudioSessionActivationDelay;
- (id)serverOverride;
- (id)sharedUserIdentifier;
- (id)singleUserCompanionACEHost;
- (id)singleUserMeCard;
- (id)syncMetadata;
- (id)useDeviceAuthenticationVersion;
- (id)voiceTriggerServerChangeToken;
- (int64_t)searchQueriesDataSharingStatus;
- (int64_t)siriDataSharingOptInStatus;
- (unint64_t)lastKnownAnalyticsStoreState;
- (unint64_t)siriAnalyticsIdentifiersConsistencyTimerIntervalMillisec;
- (unint64_t)siriAnalyticsIdentifiersConsistencyTimerStartDelayMillisec;
- (void)_cacheAndSetKeychainString:(id)a3 forKey:(id)a4 completion:(id)a5;
- (void)clearLegacyKeyValueServerChangeTokens;
- (void)dumpAssistantStateChunk:(id)a3;
- (void)removeMultiUserHomeUUID:(id)a3;
- (void)setAccountInfo:(id)a3 forIdentifier:(id)a4;
- (void)setAccountStatusServerChangeToken:(id)a3;
- (void)setActiveAccountIdentifier:(id)a3;
- (void)setAllowExplicitContent:(BOOL)a3;
- (void)setCloudKitSharedDatabaseChangeToken:(id)a3;
- (void)setCompanionIdentifier:(id)a3;
- (void)setCountryCode:(id)a3;
- (void)setDeviceOwner:(id)a3;
- (void)setDeviceWasRedirectedToProduction:(BOOL)a3;
- (void)setExperimentIdentifier:(id)a3 forConfigurationIdentifier:(id)a4;
- (void)setExperimentState:(id)a3 forConfigurationIdentifier:(id)a4;
- (void)setExperimentsUAFEmitted:(id)a3;
- (void)setHasATVOrHomePodInHome:(BOOL)a3;
- (void)setHasPairedWatches:(BOOL)a3;
- (void)setHasSetUpAccountStatusRecordZoneSubscription:(BOOL)a3;
- (void)setHasSetUpKeyValueRecordZoneSubscription:(BOOL)a3;
- (void)setHasSetUpVoiceTriggerRecordZoneSubscription:(BOOL)a3;
- (void)setHasSetupMultiUserSharedRecordZoneSubscription:(BOOL)a3;
- (void)setHomeAutomationServerFlowBypassed:(BOOL)a3;
- (void)setInternalAuthAppleConnectServiceTicket:(id)a3;
- (void)setInternalAuthSessionToken:(id)a3;
- (void)setIsMediaEntitySyncDisabledSyncConfig:(BOOL)a3;
- (void)setIsMultiUserSyncerMeDevice:(BOOL)a3;
- (void)setIsSiriFullUODSupported:(BOOL)a3;
- (void)setIsSyncDisabledForFullUoDDevices:(BOOL)a3;
- (void)setIsUsingDefaultLanguageSettings:(BOOL)a3;
- (void)setKeyValueServerChangeToken:(id)a3;
- (void)setLanguageCode:(id)a3;
- (void)setLastCompanionRemoteDataFetchDate:(id)a3;
- (void)setLastDeviceExperimentCheckDate:(id)a3;
- (void)setLastKnownAnalyticsStoreState:(unint64_t)a3;
- (void)setLastKnownProxyStreamId:(id)a3;
- (void)setLastMetricsUploadDate:(id)a3;
- (void)setLastMetricsUploadFailureReportedOnDate:(id)a3;
- (void)setLastServerExperimentCheckDate:(id)a3;
- (void)setLastSyncVerificationDate:(id)a3;
- (void)setLocationAuthorizationHasBeenUpdated:(BOOL)a3;
- (void)setMirroredMultiUserSharedDataNeedsSync:(BOOL)a3;
- (void)setMultiUserHomeUUIDsForDeletion:(id)a3;
- (void)setMultiUserIsOnboardingDevice:(BOOL)a3;
- (void)setMultiUserPrimaryUser:(id)a3;
- (void)setMultiUserSetUpCompleteTimes:(id)a3;
- (void)setMultiUserSetUpStartTimes:(id)a3;
- (void)setMultiUserSharedDataNeedsSync:(BOOL)a3;
- (void)setMultiUserSharedDataServerChangeToken:(id)a3;
- (void)setMultiUserSharedDataServerChangeToken:(id)a3 forOwnerName:(id)a4;
- (void)setMultiUserSharedUsers:(id)a3;
- (void)setMultiUserSyncerBackupIdentifiersAnchor:(id)a3;
- (void)setMultiUserSyncerIdentifiersAnchor:(id)a3;
- (void)setMultiUserSyncerSADAnchor:(id)a3;
- (void)setMultiUserVoiceIdentification:(BOOL)a3;
- (void)setMyriadDeviceVTEndTimeDistanceThreshold:(double)a3;
- (void)setOutputVoice:(id)a3;
- (void)setPhsAssetManifest:(id)a3 onSharedZone:(BOOL)a4;
- (void)setRedirect:(id)a3 forServerURLString:(id)a4;
- (void)setSearchQueriesDataSharingStatus:(int64_t)a3;
- (void)setServerAudioSessionActivationDelay:(id)a3;
- (void)setServerAudioSessionActivationDelayAboveMediaPlaybackVolumeThreshold:(id)a3;
- (void)setServerMediaPlaybackVolumeThresholdForAudioSessionActivationDelay:(id)a3;
- (void)setSharedUserIdentifier:(id)a3 loggingSharedUserIdentifier:(id)a4;
- (void)setShouldDisableServerFallbackDomain:(BOOL)a3;
- (void)setShouldDisableServerFallbackNL:(BOOL)a3;
- (void)setSingleUserCompanionACEHost:(id)a3;
- (void)setSingleUserMeCard:(id)a3;
- (void)setSiriDataSharingHomePodSetupDeviceIsValid:(BOOL)a3;
- (void)setSiriDataSharingOptInStatus:(int64_t)a3 propagateToHomeAccessories:(BOOL)a4 source:(int64_t)a5 reason:(id)a6 completion:(id)a7;
- (void)setSyncMetadata:(id)a3;
- (void)setVoiceTriggerNeedsDataSync:(BOOL)a3;
- (void)setVoiceTriggerServerChangeToken:(id)a3;
- (void)synchronize;
@end

@implementation ADPreferences

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instanceContext, 0);
  objc_storeStrong((id *)&self->_keychainCache, 0);
  objc_storeStrong((id *)&self->_redirects, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)dumpAssistantStateChunk:(id)a3
{
  v4 = (void (**)(id, id))a3;
  id v6 = objc_alloc_init((Class)NSMutableDictionary);
  v5 = [(ADPreferences *)self sharedUserIdentifier];
  [v6 setObject:v5 forKeyedSubscript:@"sharedUserIdentifier"];

  v4[2](v4, v6);
}

- (unint64_t)siriAnalyticsIdentifiersConsistencyTimerIntervalMillisec
{
  v2 = _AFPreferencesValueForKeyWithContext();
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = [v2 unsignedLongValue];
  }
  else {
    id v3 = 0;
  }

  return (unint64_t)v3;
}

- (unint64_t)siriAnalyticsIdentifiersConsistencyTimerStartDelayMillisec
{
  v2 = _AFPreferencesValueForKeyWithContext();
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = [v2 unsignedLongValue];
  }
  else {
    id v3 = 0;
  }

  return (unint64_t)v3;
}

- (BOOL)isSiriNetworkActivated
{
  return __AFPreferencesBoolValueForKeyWithContext(@"Is SiriNetwork activated", 0, kAssistantPreferencesDomain, self->_instanceContext);
}

- (void)setShouldDisableServerFallbackDomain:(BOOL)a3
{
  id v3 = +[NSNumber numberWithBool:a3];
  _AFPreferencesSetValueForKeyWithContext();
}

- (void)setShouldDisableServerFallbackNL:(BOOL)a3
{
  id v3 = +[NSNumber numberWithBool:a3];
  _AFPreferencesSetValueForKeyWithContext();
}

- (void)setIsSiriFullUODSupported:(BOOL)a3
{
  id v3 = +[NSNumber numberWithBool:a3];
  _AFPreferencesSetValueForKeyWithContext();
}

- (BOOL)isSiriFullUODSupported
{
  return __AFPreferencesBoolValueForKeyWithContext(@"Is Siri full UOD Supported", 0, kAssistantPreferencesDomain, self->_instanceContext);
}

- (void)setIsSyncDisabledForFullUoDDevices:(BOOL)a3
{
  id v3 = +[NSNumber numberWithBool:a3];
  _AFPreferencesSetValueForKeyWithContext();
}

- (void)setIsMediaEntitySyncDisabledSyncConfig:(BOOL)a3
{
  id v3 = +[NSNumber numberWithBool:a3];
  _AFPreferencesSetValueForKeyWithContext();
}

- (void)setHasATVOrHomePodInHome:(BOOL)a3
{
  id v3 = +[NSNumber numberWithBool:a3];
  _AFPreferencesSetValueForKeyWithContext();
}

- (void)setHasPairedWatches:(BOOL)a3
{
  id v3 = +[NSNumber numberWithBool:a3];
  _AFPreferencesSetValueForKeyWithContext();
}

- (void)setHomeAutomationServerFlowBypassed:(BOOL)a3
{
  id v3 = +[NSNumber numberWithBool:a3];
  _AFPreferencesSetValueForKeyWithContext();
}

- (BOOL)homeAutomationServerFlowBypassed
{
  v2 = _AFPreferencesValueForKeyWithContext();
  id v3 = v2;
  if (v2) {
    unsigned __int8 v4 = [v2 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (id)syncMetadata
{
  return (id)_AFPreferencesValueForKeyWithContext();
}

- (void)setSyncMetadata:(id)a3
{
}

- (void)setLocationAuthorizationHasBeenUpdated:(BOOL)a3
{
  id v3 = +[NSNumber numberWithBool:a3];
  _AFBackedUpPreferencesSetValueForKey();

  AFBackedUpPreferencesSynchronize();
}

- (BOOL)locationAuthorizationHasBeenUpdated
{
  v2 = _AFBackedUpPreferencesValueForKey();
  id v3 = v2;
  if (v2) {
    unsigned __int8 v4 = [v2 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (id)experimentsUAFEmitted
{
  return (id)_AFPreferencesValueForKeyWithContext();
}

- (void)setExperimentsUAFEmitted:(id)a3
{
}

- (id)lastDeviceExperimentCheckDate
{
  return (id)_AFPreferencesValueForKeyWithContext();
}

- (void)setLastDeviceExperimentCheckDate:(id)a3
{
}

- (id)lastServerExperimentCheckDate
{
  return (id)_AFPreferencesValueForKeyWithContext();
}

- (void)setLastServerExperimentCheckDate:(id)a3
{
}

- (void)setInternalAuthSessionToken:(id)a3
{
}

- (id)internalAuthSessionToken
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_100264DF8;
  v10 = sub_100264E08;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100264E10;
  v5[3] = &unk_10050D5F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)setInternalAuthAppleConnectServiceTicket:(id)a3
{
}

- (id)internalAuthAppleConnectServiceTicket
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_100264DF8;
  v10 = sub_100264E08;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100264F64;
  v5[3] = &unk_10050D5F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)useDeviceAuthenticationVersion
{
  return (id)_AFPreferencesValueForKeyWithContext();
}

- (double)myriadDeviceVTEndTimeDistanceThreshold
{
  v2 = +[AFPreferences sharedPreferences];
  [v2 myriadDeviceVTEndTimeDistanceThreshold];
  double v4 = v3;

  return v4;
}

- (void)setMyriadDeviceVTEndTimeDistanceThreshold:(double)a3
{
  id v4 = +[AFPreferences sharedPreferences];
  [v4 setMyriadDeviceVTEndTimeDistanceThreshold:a3];
}

- (void)setMultiUserSetUpCompleteTimes:(id)a3
{
}

- (id)multiUserSetupCompleteTimes
{
  return (id)_AFPreferencesValueForKeyWithContext();
}

- (void)setMultiUserSetUpStartTimes:(id)a3
{
}

- (id)multiUserSetupStartTimes
{
  return (id)_AFPreferencesValueForKeyWithContext();
}

- (id)singleUserCompanionACEHost
{
  return (id)_AFPreferencesValueForKeyWithContext();
}

- (void)setSingleUserCompanionACEHost:(id)a3
{
  if (a3) {
    _AFPreferencesSetValueForKeyWithContext();
  }
}

- (id)singleUserMeCard
{
  return (id)_AFPreferencesValueForKeyWithContext();
}

- (void)setSingleUserMeCard:(id)a3
{
  if (a3) {
    _AFPreferencesSetValueForKeyWithContext();
  }
}

- (id)_keychainCache
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  keychainCache = self->_keychainCache;
  if (!keychainCache)
  {
    id v4 = (NSMutableDictionary *)objc_opt_new();
    v5 = self->_keychainCache;
    self->_keychainCache = v4;

    keychainCache = self->_keychainCache;
  }
  return keychainCache;
}

- (void)_cacheAndSetKeychainString:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1002652C4;
  v15[3] = &unk_10050E228;
  v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(queue, v15);
}

- (id)_keychainStringForKey:(id)a3
{
  queue = self->_queue;
  id v4 = a3;
  dispatch_assert_queue_V2(queue);
  v5 = AFKeychainValueForAccountAndKey();

  if (v5) {
    id v6 = [objc_alloc((Class)NSString) initWithData:v5 encoding:4];
  }
  else {
    id v6 = 0;
  }

  return v6;
}

- (id)_cachedKeychainStringForKey:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = [(ADPreferences *)self _keychainCache];
  id v6 = [v5 objectForKey:v4];
  v7 = +[NSNull null];

  if (v6 != v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = v6;
      goto LABEL_8;
    }
    uint64_t v9 = [(ADPreferences *)self _keychainStringForKey:v4];
    if (v9)
    {
      id v8 = (id)v9;
      [v5 setValue:v9 forKey:v4];
      goto LABEL_8;
    }
    id v10 = +[NSNull null];
    [v5 setValue:v10 forKey:v4];
  }
  id v8 = 0;
LABEL_8:

  return v8;
}

- (BOOL)dictationLanguageDetectorEnabled
{
  return __AFPreferencesDictationLanguageDetectorEnabled(self, a2);
}

- (BOOL)isSearchDataSharingStatusForced
{
  return __AFPreferencesSearchQueriesDataSharingStatusIsForced(self->_instanceContext, a2);
}

- (int64_t)searchQueriesDataSharingStatus
{
  return __AFPreferencesSearchQueriesDataSharingStatusWithContext(self->_instanceContext, a2);
}

- (void)setSearchQueriesDataSharingStatus:(int64_t)a3
{
}

- (void)setAllowExplicitContent:(BOOL)a3
{
  id v3 = +[NSNumber numberWithBool:a3];
  _AFPreferencesSetValueForKeyWithContext();
}

- (BOOL)allowExplicitContent
{
  v2 = +[AFPreferences sharedPreferences];
  unsigned __int8 v3 = [v2 allowExplicitContent];

  return v3;
}

- (void)setServerAudioSessionActivationDelayAboveMediaPlaybackVolumeThreshold:(id)a3
{
}

- (id)serverAudioSessionActivationDelayAboveMediaPlaybackVolumeThreshold
{
  v2 = _AFPreferencesValueForKeyWithContext();
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned __int8 v3 = v2;
  }
  else {
    unsigned __int8 v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (void)setServerMediaPlaybackVolumeThresholdForAudioSessionActivationDelay:(id)a3
{
}

- (id)serverMediaPlaybackVolumeThresholdForAudioSessionActivationDelay
{
  v2 = _AFPreferencesValueForKeyWithContext();
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned __int8 v3 = v2;
  }
  else {
    unsigned __int8 v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (void)setServerAudioSessionActivationDelay:(id)a3
{
}

- (id)serverAudioSessionActivationDelay
{
  v2 = _AFPreferencesValueForKeyWithContext();
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned __int8 v3 = v2;
  }
  else {
    unsigned __int8 v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (id)overrideAudioSessionActiveDelay
{
  v2 = _AFPreferencesValueForKey();
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned __int8 v3 = v2;
  }
  else {
    unsigned __int8 v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (BOOL)getAudioSessionActiveDelay:(double *)a3
{
  if (a3)
  {
    *a3 = 0.0;
    id v4 = _AFPreferencesValueForKeyWithContext();
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass)
    {
      [v4 doubleValue];
      *(void *)a3 = v6;
    }
  }
  else
  {
    char isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

- (BOOL)getMinimumOutputVolume:(float *)a3
{
  if (a3)
  {
    *a3 = 0.0;
    id v4 = _AFPreferencesValueForKeyWithContext();
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass)
    {
      [v4 floatValue];
      *(_DWORD *)a3 = v6;
    }
  }
  else
  {
    char isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

- (BOOL)getMaximumOutputVolume:(float *)a3
{
  if (a3)
  {
    *a3 = 0.0;
    id v4 = _AFPreferencesValueForKeyWithContext();
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass)
    {
      [v4 floatValue];
      *(_DWORD *)a3 = v6;
    }
  }
  else
  {
    char isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

- (void)setLastKnownAnalyticsStoreState:(unint64_t)a3
{
  id v3 = +[NSNumber numberWithUnsignedInteger:a3];
  _AFPreferencesSetValueForKeyWithContext();
}

- (unint64_t)lastKnownAnalyticsStoreState
{
  v2 = _AFPreferencesValueForKeyWithContext();
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = [v2 unsignedIntegerValue];
  }
  else {
    id v3 = 0;
  }

  return (unint64_t)v3;
}

- (BOOL)proxyConnectionDisabled
{
  v2 = _AFPreferencesValueForKeyWithContext();
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)metricsSenderDisabled
{
  v2 = _AFPreferencesValueForKeyWithContext();
  unsigned __int8 v3 = v2;
  if (v2) {
    unsigned __int8 v4 = [v2 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (void)setExperimentState:(id)a3 forConfigurationIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = [@"Experiment State" stringByAppendingString:a4];
  _AFPreferencesSetValueForKey();
}

- (id)getExperimentStateForConfigurationIdentifier:(id)a3
{
  unsigned __int8 v3 = [@"Experiment State" stringByAppendingString:a3];
  unsigned __int8 v4 = _AFPreferencesValueForKey();

  return v4;
}

- (void)setExperimentIdentifier:(id)a3 forConfigurationIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = [@"Experiment Identifier" stringByAppendingString:a4];
  _AFPreferencesSetValueForKey();
}

- (id)experimentIdentifierForConfigurationIdentifier:(id)a3
{
  unsigned __int8 v3 = [@"Experiment Identifier" stringByAppendingString:a3];
  unsigned __int8 v4 = _AFPreferencesValueForKey();

  return v4;
}

- (void)setSiriDataSharingHomePodSetupDeviceIsValid:(BOOL)a3
{
}

- (BOOL)siriDataSharingHomePodSetupDeviceIsValid
{
  return __AFPreferencesSiriDataSharingHomePodSetupDeviceIsValidWithContext(self->_instanceContext, a2);
}

- (void)setSiriDataSharingOptInStatus:(int64_t)a3 propagateToHomeAccessories:(BOOL)a4 source:(int64_t)a5 reason:(id)a6 completion:(id)a7
{
  BOOL v9 = a4;
  id v12 = a6;
  id v13 = (void (**)(id, void))a7;
  id v14 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v16 = 136316163;
    id v17 = "-[ADPreferences setSiriDataSharingOptInStatus:propagateToHomeAccessories:source:reason:completion:]";
    __int16 v18 = 2049;
    int64_t v19 = a3;
    __int16 v20 = 2048;
    int64_t v21 = a5;
    __int16 v22 = 2113;
    id v23 = v12;
    __int16 v24 = 1024;
    BOOL v25 = v9;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s Setting Siri Data Sharing OptIn status=%{private}ld from source=%ld with reason=%{private}@, and propagating to home accessories=%d", (uint8_t *)&v16, 0x30u);
  }
  _AFPreferencesSetSiriDataSharingOptInStatusWithContext();
  v15 = +[NSNotificationCenter defaultCenter];
  [v15 postNotificationName:@"ADPreferencesSiriDataSharingOptInStatusDidChangeNotification" object:self];
  [v15 postNotificationName:@"ADSharedDataDidChangeNotification" object:0];
  if (v13) {
    v13[2](v13, 0);
  }
}

- (int64_t)siriDataSharingOptInStatus
{
  return __AFPreferencesSiriDataSharingOptInStatusWithContext(self->_instanceContext, a2);
}

- (void)setLastCompanionRemoteDataFetchDate:(id)a3
{
}

- (id)lastCompanionRemoteDataFetchDate
{
  v2 = _AFPreferencesValueForKeyWithContext();
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned __int8 v3 = v2;
  }
  else {
    unsigned __int8 v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (void)setCompanionIdentifier:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100266084;
  v5[3] = &unk_10050B790;
  objc_copyWeak(&v6, &location);
  [(ADPreferences *)self _cacheAndSetKeychainString:v4 forKey:@"Companion Identifier" completion:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (id)companionIdentifier
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  BOOL v9 = sub_100264DF8;
  id v10 = sub_100264E08;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1002661E8;
  v5[3] = &unk_10050D5F0;
  void v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)setSharedUserIdentifier:(id)a3 loggingSharedUserIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  [(ADPreferences *)self _cacheAndSetKeychainString:v6 forKey:@"User Identifier" completion:0];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10026634C;
  v8[3] = &unk_10050B790;
  objc_copyWeak(&v9, &location);
  [(ADPreferences *)self _cacheAndSetKeychainString:v7 forKey:@"Logging User Identifier" completion:v8];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (id)loggingSharedUserIdentifier
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_100264DF8;
  id v10 = sub_100264E08;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1002664B0;
  v5[3] = &unk_10050D5F0;
  void v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)sharedUserIdentifier
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_100264DF8;
  id v10 = sub_100264E08;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1002665F4;
  v5[3] = &unk_10050D5F0;
  void v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)multiUserHomeUUIDsForDeletion
{
  v2 = _AFPreferencesValueForKeyWithContext();
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

- (void)removeMultiUserHomeUUID:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v6 = v3;
    id v4 = _AFPreferencesValueForKeyWithContext();
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [v4 mutableCopy];
      if ([v5 containsObject:v6])
      {
        [v5 removeObject:v6];
        [v5 count];
        _AFPreferencesSetValueForKeyWithContext();
      }
    }
    id v3 = v6;
  }
}

- (void)setMultiUserHomeUUIDsForDeletion:(id)a3
{
  id v3 = a3;
  id v7 = v3;
  if (v3 && [v3 count])
  {
    id v4 = _AFPreferencesValueForKeyWithContext();
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
    id v6 = objc_alloc_init((Class)NSMutableArray);
    if ([v5 count]) {
      [v6 addObjectsFromArray:v5];
    }
    if ([v7 count]) {
      [v6 addObjectsFromArray:v7];
    }
    if ([v6 count]) {
      _AFPreferencesSetValueForKeyWithContext();
    }
  }
  else
  {
    _AFPreferencesSetValueForKeyWithContext();
  }
}

- (void)setIsMultiUserSyncerMeDevice:(BOOL)a3
{
  id v3 = +[NSNumber numberWithBool:a3];
  _AFPreferencesSetValueForKeyWithContext();
}

- (BOOL)isMultiUserSyncerMeDevice
{
  return __AFPreferencesBoolValueForKeyWithContext(@"Multi User Syncer Me Device", 0, kAssistantPreferencesDomain, self->_instanceContext);
}

- (void)setMultiUserSyncerBackupIdentifiersAnchor:(id)a3
{
}

- (id)multiUserSyncerBackupIdentifiersAnchor
{
  return (id)_AFPreferencesValueForKeyWithContext();
}

- (void)setMultiUserSyncerIdentifiersAnchor:(id)a3
{
}

- (id)multiUserSyncerIdentifiersAnchor
{
  return (id)_AFPreferencesValueForKeyWithContext();
}

- (void)setMultiUserSyncerSADAnchor:(id)a3
{
}

- (id)multiUserSyncerSADAnchor
{
  return (id)_AFPreferencesValueForKeyWithContext();
}

- (void)setMultiUserIsOnboardingDevice:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:");
  _AFPreferencesSetValueForKeyWithContext();

  objc_initWeak(&location, self);
  if (v3)
  {
    id v6 = +[NSNotificationCenter defaultCenter];
    id v7 = objc_loadWeakRetained(&location);
    [v6 postNotificationName:@"ADDeviceUsedForHomePodSetupNotification" object:v7];
  }
  objc_destroyWeak(&location);
}

- (BOOL)multiUserIsOnboardingDevice
{
  return __AFPreferencesBoolValueForKeyWithContext(@"MultiUser Device Used for Onboarding", 0, kAssistantPreferencesDomain, self->_instanceContext);
}

- (void)setMultiUserSharedUsers:(id)a3
{
}

- (id)multiUserSharedUsers
{
  v2 = _AFPreferencesValueForKeyWithContext();
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

- (void)setDeviceOwner:(id)a3
{
}

- (id)deviceOwner
{
  v2 = _AFPreferencesValueForKeyWithContext();
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

- (void)setMultiUserPrimaryUser:(id)a3
{
}

- (id)multiUserPrimaryUser
{
  v2 = _AFPreferencesValueForKeyWithContext();
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

- (void)setHasSetupMultiUserSharedRecordZoneSubscription:(BOOL)a3
{
  id v3 = +[NSNumber numberWithBool:a3];
  _AFPreferencesSetValueForKeyWithContext();
}

- (BOOL)hasSetUpMultiUserSharedRecordZoneSubscription
{
  v2 = _AFPreferencesValueForKeyWithContext();
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (void)setMultiUserSharedDataServerChangeToken:(id)a3
{
}

- (id)multiUserSharedDataServerChangeToken
{
  v2 = _AFPreferencesValueForKeyWithContext();
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned __int8 v3 = v2;
  }
  else {
    unsigned __int8 v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (void)setDeviceWasRedirectedToProduction:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = _AFPreferencesValueForKeyWithContext();
  unsigned int v5 = [v4 BOOLValue];

  if (v5 != v3)
  {
    id v6 = +[NSNumber numberWithBool:v3];
    _AFPreferencesSetValueForKeyWithContext();

    AFInternalPreferencesSynchronize();
  }
}

- (BOOL)deviceWasRedirectedToProduction
{
  v2 = _AFPreferencesValueForKeyWithContext();
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (void)setMultiUserVoiceIdentification:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = _AFBackedUpPreferencesValueForKey();
  id v6 = v5;
  if (!v5 || [v5 BOOLValue] != v3)
  {
    id v7 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v10 = 136315394;
      id v11 = "-[ADPreferences setMultiUserVoiceIdentification:]";
      __int16 v12 = 1024;
      BOOL v13 = v3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s voiceIdentification is %d", (uint8_t *)&v10, 0x12u);
    }
    uint64_t v8 = +[NSNumber numberWithBool:v3];
    _AFBackedUpPreferencesSetValueForKey();

    AFBackedUpPreferencesSynchronize();
    id v9 = +[NSNotificationCenter defaultCenter];
    [v9 postNotificationName:@"ADMultiUserVoiceIdentificationDidChangeNotification" object:self];
  }
}

- (BOOL)multiUserVoiceIdentification
{
  v2 = _AFBackedUpPreferencesValueForKey();
  BOOL v3 = v2;
  if (v2) {
    unsigned __int8 v4 = [v2 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (void)setMultiUserSharedDataServerChangeToken:(id)a3 forOwnerName:(id)a4
{
  if (a3 && a4)
  {
    id v5 = a4;
    id v6 = a3;
    id v7 = _AFPreferencesValueForKeyWithContext();
    id v8 = [v7 mutableCopy];
    id v9 = v8;
    if (v8) {
      id v10 = v8;
    }
    else {
      id v10 = objc_alloc_init((Class)NSMutableDictionary);
    }
    id v11 = v10;

    [v11 setObject:v6 forKey:v5];
    _AFPreferencesSetValueForKeyWithContext();
  }
}

- (id)multiUserSharedDataServerChangeTokenForOwner:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    unsigned __int8 v4 = _AFPreferencesValueForKeyWithContext();
    id v5 = [v4 objectForKey:v3];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (void)setMirroredMultiUserSharedDataNeedsSync:(BOOL)a3
{
  id v3 = +[NSNumber numberWithBool:a3];
  _AFPreferencesSetValueForKeyWithContext();
}

- (BOOL)mirroredMultiUserSharedDataNeedsSync
{
  v2 = _AFPreferencesValueForKeyWithContext();
  id v3 = v2;
  if (v2) {
    unsigned __int8 v4 = [v2 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 1;
  }

  return v4;
}

- (void)setMultiUserSharedDataNeedsSync:(BOOL)a3
{
  id v3 = +[NSNumber numberWithBool:a3];
  _AFPreferencesSetValueForKeyWithContext();
}

- (BOOL)multiUserSharedDataNeedsSync
{
  v2 = _AFPreferencesValueForKeyWithContext();
  id v3 = v2;
  if (v2) {
    unsigned __int8 v4 = [v2 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 1;
  }

  return v4;
}

- (void)setHasSetUpVoiceTriggerRecordZoneSubscription:(BOOL)a3
{
  id v3 = +[NSNumber numberWithBool:a3];
  _AFPreferencesSetValueForKeyWithContext();
}

- (BOOL)hasSetUpVoiceTriggerRecordZoneSubscription
{
  return __AFPreferencesBoolValueForKeyWithContext(@"Has Set Up Voice Trigger Subscription", 0, kAssistantPreferencesDomain, self->_instanceContext);
}

- (void)setVoiceTriggerServerChangeToken:(id)a3
{
}

- (id)voiceTriggerServerChangeToken
{
  v2 = _AFPreferencesValueForKeyWithContext();
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

- (void)setVoiceTriggerNeedsDataSync:(BOOL)a3
{
  id v3 = +[NSNumber numberWithBool:a3];
  _AFPreferencesSetValueForKeyWithContext();
}

- (BOOL)voiceTriggerNeedsDataSync
{
  v2 = _AFPreferencesValueForKeyWithContext();
  id v3 = v2;
  if (v2) {
    unsigned __int8 v4 = [v2 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 1;
  }

  return v4;
}

- (BOOL)_validatePhsManifestData:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v4 = v3;
    id v5 = [v4 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v23;
      uint64_t v17 = *(void *)v23;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v23 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_23;
          }
          id v10 = [v4 objectForKey:v9];
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
LABEL_22:

LABEL_23:
            BOOL v15 = 0;
            goto LABEL_25;
          }
          long long v20 = 0u;
          long long v21 = 0u;
          long long v18 = 0u;
          long long v19 = 0u;
          id v10 = v10;
          id v11 = (char *)[v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
          if (v11)
          {
            __int16 v12 = v11;
            uint64_t v13 = *(void *)v19;
            while (2)
            {
              for (j = 0; j != v12; ++j)
              {
                if (*(void *)v19 != v13) {
                  objc_enumerationMutation(v10);
                }
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {

                  goto LABEL_22;
                }
              }
              __int16 v12 = (char *)[v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
              if (v12) {
                continue;
              }
              break;
            }
          }

          uint64_t v7 = v17;
        }
        id v6 = [v4 countByEnumeratingWithState:&v22 objects:v27 count:16];
        BOOL v15 = 1;
        if (v6) {
          continue;
        }
        break;
      }
    }
    else
    {
      BOOL v15 = 1;
    }
LABEL_25:
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (void)setPhsAssetManifest:(id)a3 onSharedZone:(BOOL)a4
{
}

- (id)phsAssetManifest:(BOOL)a3
{
  id v4 = _AFPreferencesValueForKeyWithContext();
  if ([(ADPreferences *)self _validatePhsManifestData:v4])
  {
    id v5 = v4;
    id v4 = v5;
  }
  else
  {
    _AFPreferencesSetValueForKeyWithContext();
    AFInternalPreferencesSynchronize();
    id v5 = +[NSDictionary dictionary];
  }
  id v6 = v5;

  return v6;
}

- (void)setCloudKitSharedDatabaseChangeToken:(id)a3
{
}

- (id)cloudKitSharedDatabaseChangeToken
{
  v2 = _AFPreferencesValueForKeyWithContext();
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

- (void)setHasSetUpAccountStatusRecordZoneSubscription:(BOOL)a3
{
  id v3 = +[NSNumber numberWithBool:a3];
  _AFPreferencesSetValueForKeyWithContext();
}

- (BOOL)hasSetUpAccountStatusRecordZoneSubscription
{
  return __AFPreferencesBoolValueForKeyWithContext(@"Has Set Up Account Status Subscription", 0, kAssistantPreferencesDomain, self->_instanceContext);
}

- (void)setHasSetUpKeyValueRecordZoneSubscription:(BOOL)a3
{
  id v3 = +[NSNumber numberWithBool:a3];
  _AFPreferencesSetValueForKeyWithContext();
}

- (BOOL)hasSetUpKeyValueRecordZoneSubscription
{
  return __AFPreferencesBoolValueForKeyWithContext(@"Has Set Up Key Value Subscription", 0, kAssistantPreferencesDomain, self->_instanceContext);
}

- (void)setAccountStatusServerChangeToken:(id)a3
{
}

- (id)accountStatusServerChangeToken
{
  v2 = _AFPreferencesValueForKeyWithContext();
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

- (void)clearLegacyKeyValueServerChangeTokens
{
}

- (void)setKeyValueServerChangeToken:(id)a3
{
}

- (id)keyValueServerChangeToken
{
  v2 = _AFPreferencesValueForKeyWithContext();
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

- (void)setLastMetricsUploadFailureReportedOnDate:(id)a3
{
}

- (id)lastMetricsUploadFailureReportedOnDate
{
  return (id)_AFPreferencesValueForKeyWithContext();
}

- (void)setLastMetricsUploadDate:(id)a3
{
}

- (id)lastMetricsUploadDate
{
  return (id)_AFPreferencesValueForKeyWithContext();
}

- (void)setLastSyncVerificationDate:(id)a3
{
}

- (id)lastSyncVerificationDate
{
  return (id)_AFPreferencesValueForKeyWithContext();
}

- (void)setLastKnownProxyStreamId:(id)a3
{
}

- (id)lastKnownProxyStreamId
{
  v2 = _AFPreferencesValueForKeyWithContext();
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

- (void)setRedirect:(id)a3 forServerURLString:(id)a4
{
  if (a4)
  {
    id v5 = a4;
    id v6 = a3;
    _AFPreferencesValueForKeyWithContext();
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = [v11 mutableCopy];
    }
    else {
      id v7 = objc_alloc_init((Class)NSMutableDictionary);
    }
    id v8 = v7;
    [v7 setObject:v6 forKey:v5];

    if ([v8 count]) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = 0;
    }
    id v10 = v9;

    _AFPreferencesSetValueForKeyWithContext();
  }
}

- (id)redirectForServerURLString:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = _AFPreferencesValueForKeyWithContext();
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
    id v6 = v5;

    id v7 = [v6 objectForKey:v3];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }
    id v9 = v8;
  }
  else
  {
    id v9 = 0;
  }
  return v9;
}

- (id)productTypePrefix
{
  v2 = _AFPreferencesValueForKeyWithContext();
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

- (id)serverOverride
{
  v2 = _AFPreferencesValueForKeyWithContext();
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

- (BOOL)ignoreLocationWiFiStatus
{
  v2 = _AFPreferencesValueForKeyWithContext();
  id v3 = v2;
  if (v2) {
    unsigned __int8 v4 = [v2 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (void)setCountryCode:(id)a3
{
}

- (id)countryCode
{
  return (id)__AFPreferencesCountryCode(self, a2);
}

- (void)setIsUsingDefaultLanguageSettings:(BOOL)a3
{
  if (a3)
  {
    id v3 = +[NSNumber numberWithBool:1];
    _AFPreferencesSetValueForKeyWithContext();
  }
  else
  {
    _AFPreferencesSetValueForKeyWithContext();
  }
}

- (BOOL)isUsingDefaultLanguageSettings
{
  return __AFPreferencesBoolValueForKeyWithContext(@"Using Default Language Settings", 0, kAssistantPreferencesDomain, self->_instanceContext);
}

- (void)setOutputVoice:(id)a3
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100268240;
  block[3] = &unk_10050E138;
  block[4] = self;
  id v5 = a3;
  dispatch_async(queue, block);
  _AFPreferencesSetOutputVoiceWithContext();

  id v6 = +[NSNotificationCenter defaultCenter];
  [v6 postNotificationName:@"ADPreferencesOutputVoiceDidChangeNotification" object:self];
}

- (id)outputVoiceWithFallback:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned __int8 v4 = +[AFPreferences sharedPreferences];
  id v5 = [v4 _outputVoiceWithFallback:v3];

  return v5;
}

- (id)outputVoice
{
  return [(ADPreferences *)self outputVoiceWithFallback:1];
}

- (void)setLanguageCode:(id)a3
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100268384;
  block[3] = &unk_10050E138;
  block[4] = self;
  id v5 = a3;
  dispatch_async(queue, block);
  _AFPreferencesSetLanguageCodeWithContext();

  [(ADPreferences *)self synchronize];
  id v6 = +[NSNotificationCenter defaultCenter];
  [v6 postNotificationName:@"ADPreferencesLanguageCodeDidChangeNotification" object:self];
}

- (id)languageCodeWithFallback:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned __int8 v4 = +[AFPreferences sharedPreferences];
  id v5 = [v4 _languageCodeWithFallback:v3];

  return v5;
}

- (id)languageCode
{
  return [(ADPreferences *)self languageCodeWithFallback:1];
}

- (double)serverTimeoutInterval
{
  v2 = _AFPreferencesValueForKeyWithContext();
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

- (BOOL)statisticsRecordingEnabled
{
  return __AFPreferencesBoolValueForKeyWithContext(@"StatisticsEnabled", 0, kAssistantPreferencesDomain, self->_instanceContext);
}

- (void)setActiveAccountIdentifier:(id)a3
{
}

- (id)accountIdentifiers
{
  v2 = _AFPreferencesValueForKeyWithContext();
  BOOL v3 = [v2 allKeys];

  return v3;
}

- (id)activeAccountIdentifier
{
  return (id)_AFPreferencesValueForKeyWithContext();
}

- (void)setAccountInfo:(id)a3 forIdentifier:(id)a4
{
  id v11 = a3;
  id v5 = a4;
  if (v5)
  {
    id v6 = _AFPreferencesValueForKeyWithContext();
    id v7 = [v6 mutableCopy];
    id v8 = v7;
    if (v7) {
      id v9 = v7;
    }
    else {
      id v9 = objc_alloc_init((Class)NSMutableDictionary);
    }
    id v10 = v9;

    if (v11) {
      [v10 setObject:v11 forKey:v5];
    }
    else {
      [v10 removeObjectForKey:v5];
    }
    _AFPreferencesSetValueForKeyWithContext();
  }
}

- (id)accountInfoForIdentifier:(id)a3
{
  id v3 = a3;
  double v4 = _AFPreferencesValueForKeyWithContext();
  id v5 = [v4 objectForKey:v3];

  return v5;
}

- (void)synchronize
{
  AFInternalPreferencesSynchronize();
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100268724;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (ADPreferences)init
{
  return [(ADPreferences *)self initWithInstanceContext:0];
}

- (ADPreferences)initWithInstanceContext:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ADPreferences;
  id v5 = [(ADPreferences *)&v12 init];
  if (v5)
  {
    id v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create(0, v6);

    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v7;

    if (v4)
    {
      id v9 = (AFInstanceContext *)v4;
    }
    else
    {
      id v9 = +[AFInstanceContext defaultContext];
    }
    instanceContext = v5->_instanceContext;
    v5->_instanceContext = v9;
  }
  return v5;
}

+ (id)sharedPreferences
{
  if (qword_100586058 != -1) {
    dispatch_once(&qword_100586058, &stru_1005083B0);
  }
  v2 = (void *)qword_100586060;
  return v2;
}

@end