@interface ADCloudKitManager
+ (id)getApplicationIdentifierFromEntitlements;
+ (id)sharedManager;
+ (void)_setAppleAccountSiriStateEnabled:(BOOL)a3 withCompletion:(id)a4;
- (ADCloudKitManager)init;
- (ADCloudKitManager)initWithInstanceContext:(id)a3;
- (ADCloudKitMirroredContainer)mirroredContainer;
- (ADCloudKitRecordZoneInfo)accountStatusRecordZoneInfo;
- (ADCloudKitRecordZoneInfo)keyValueRecordZoneInfo;
- (ADCloudKitRecordZoneInfo)multiUserRecordZoneInfo;
- (ADCloudKitRecordZoneInfo)voiceTriggerRecordZoneInfo;
- (APSConnection)pushConnection;
- (BOOL)_forceVoiceProfileDownloadForiCloudAltDSID:(id)a3 retryCount:(int64_t)a4 completion:(id)a5;
- (BOOL)_isCloudSyncEnabledForZone:(id)a3;
- (BOOL)_isCloudSyncEnabledForZone:(id)a3 accountInfo:(id)a4;
- (BOOL)_zoneIsShareable:(id)a3;
- (BOOL)_zoneShouldUpdateMirroredZone;
- (BOOL)cloudSyncEnabled;
- (BOOL)isPastBuddy;
- (BOOL)preferencesHaveBeenSynchronized;
- (BOOL)voiceTriggerEnabled;
- (CKAccountInfo)primaryAccountInfo;
- (CKContainer)primaryContainer;
- (CKNotificationListener)listener;
- (NSMutableDictionary)ckAcctInfoDict;
- (NSMutableDictionary)containerDict;
- (NSMutableDictionary)recordZoneInfoDict;
- (NSString)applicationIdentifier;
- (NSString)userID;
- (OS_dispatch_queue)serialQueue;
- (OS_dispatch_source)voiceTriggerSyncTimer;
- (id)_createFileAssetRecordWithDictionary:(id)a3 zone:(id)a4 version:(unint64_t)a5;
- (id)_createKeyValueRecordsWithDictionary:(id)a3 mirror:(BOOL)a4;
- (id)_createRecordsWithDictionary:(id)a3 forZoneInfo:(id)a4;
- (id)_manateeRecordZoneInfoForName:(id)a3;
- (id)_trackedCKAccountInfoForiCloudAltDSID:(id)a3;
- (id)_trackedCKContainerForiCloudAltDSID:(id)a3;
- (id)_verifyAccountWithManateeRequired:(BOOL)a3;
- (id)containerIDs;
- (id)getContainerIDForThisDevice;
- (unsigned)preferencesDidChangeNotificationIgnoreCount;
- (unsigned)sharedUserIdentifierNotificationIgnoreCount;
- (void)_acceptSharesForMetadatas:(id)a3;
- (void)_buddyStateDidChangeNotification:(id)a3;
- (void)_cancelVoiceTriggerSyncTimer;
- (void)_cleanUpRecordZoneSubscriptionsTimers;
- (void)_cleanUpRecordZonesAndSubscriptions;
- (void)_cloudKitAccountStatusChanged:(id)a3;
- (void)_createRecordZoneSubscriptionWithZoneID:(id)a3 name:(id)a4 recordTypes:(id)a5 container:(id)a6 completion:(id)a7;
- (void)_createRecordZoneWithID:(id)a3 shared:(BOOL)a4 onMirror:(BOOL)a5 completion:(id)a6;
- (void)_deleteRecordZoneWithZoneID:(id)a3 completion:(id)a4;
- (void)_deleteRecordZoneWithZoneID:(id)a3 qualityOfService:(int64_t)a4 completion:(id)a5;
- (void)_deleteRecordZoneWithZoneInfo:(id)a3 completion:(id)a4;
- (void)_deleteRecordZoneWithZoneInfo:(id)a3 qualityOfService:(int64_t)a4 completion:(id)a5;
- (void)_deleteUserData;
- (void)_devicesWithAvailablePHSAssetsForLanguage:(id)a3 iCloudAltDSID:(id)a4 completion:(id)a5;
- (void)_disablePush;
- (void)_enablePush;
- (void)_executeZoneFetchCompletionBlock:(id)a3 zoneInfo:(id)a4 completion:(id)a5;
- (void)_fetchChangesFromZone:(id)a3 serverChangeToken:(id)a4 useSharedDatabase:(BOOL)a5 activity:(id)a6 container:(id)a7 mirror:(BOOL)a8 completion:(id)a9;
- (void)_fetchChangesWithZoneInfo:(id)a3 retryCount:(unint64_t)a4 useSharedDatabase:(BOOL)a5 activity:(id)a6 container:(id)a7 mirror:(BOOL)a8;
- (void)_fetchChangesWithZoneInfo:(id)a3 retryCount:(unint64_t)a4 useSharedDatabase:(BOOL)a5 activity:(id)a6 container:(id)a7 mirror:(BOOL)a8 completion:(id)a9;
- (void)_fetchChangesWithZoneInfo:(id)a3 useSharedDatabase:(BOOL)a4;
- (void)_fetchChangesWithZoneInfo:(id)a3 useSharedDatabase:(BOOL)a4 activity:(id)a5 mirror:(BOOL)a6;
- (void)_fetchChangesWithZoneInfo:(id)a3 useSharedDatabase:(BOOL)a4 mirror:(BOOL)a5;
- (void)_fetchCurrentUserIDWithCompletion:(id)a3;
- (void)_fetchManifest:(id)a3 language:(id)a4 completion:(id)a5;
- (void)_fetchManifest:(id)a3 legacy:(BOOL)a4 language:(id)a5 completion:(id)a6;
- (void)_forceMultiUserSync:(BOOL)a3 download:(BOOL)a4 retryCount:(unint64_t)a5 activity:(id)a6 completion:(id)a7;
- (void)_forceMultiUserSync:(BOOL)a3 download:(BOOL)a4 retryCount:(unint64_t)a5 activity:(id)a6 iCloudAltDSID:(id)a7 completion:(id)a8;
- (void)_forceVoiceProfileDownloadOfAllUsers:(int64_t)a3;
- (void)_handleAccountStatusChange:(id)a3;
- (void)_handleCloudKitNotification:(id)a3;
- (void)_handleSubscriptionNotification:(id)a3 container:(id)a4;
- (void)_homeInfoDidChange:(id)a3;
- (void)_initializeZones;
- (void)_languageCodeDidChange;
- (void)_multiUserVoiceIdentificationDidChange:(id)a3;
- (void)_outputLanguageDidChange;
- (void)_preferencesDidChange;
- (void)_prepareZoneForResetWithZoneInfo:(id)a3;
- (void)_resetZoneFetchCompletionBlock:(id)a3;
- (void)_resetZoneWithZoneInfo:(id)a3;
- (void)_saveCloudSyncEnabledRecord:(BOOL)a3 mirror:(BOOL)a4 qualityOfService:(int64_t)a5 completion:(id)a6;
- (void)_scheduleMirrorSynchronizationAfterDelay:(id)a3;
- (void)_setDefaultiCloudEnabledState;
- (void)_setUpMirroredZoneWithZoneInfo:(id)a3;
- (void)_setUpZoneWithZoneInfo:(id)a3;
- (void)_setupAccount;
- (void)_setupAccountState;
- (void)_setupAccountStatusRecordZone;
- (void)_setupKeyValueRecordZone;
- (void)_setupMultiUserSharedRecordZone;
- (void)_setupMultiUserSharedRecordZoneIfHomeIsReady;
- (void)_setupPrimaryContainer;
- (void)_setupRecordZoneSubscriptionWithZoneInfo:(id)a3 retryInterval:(double)a4 container:(id)a5;
- (void)_setupRecordZoneWithZoneInfo:(id)a3 retryInterval:(double)a4 completion:(id)a5;
- (void)_setupSecondaryAccounts;
- (void)_setupSharedZoneUpdaterForOwner;
- (void)_setupSharedZoneView;
- (void)_setupVoiceTriggerSyncTimer;
- (void)_setupZoneSubscriptionsForSecondaryAccount:(id)a3 zoneInfo:(id)a4;
- (void)_setupZonesForSecondaryAccount:(id)a3 container:(id)a4 acctInfo:(id)a5;
- (void)_sharedUserIdentifierDidChange:(id)a3;
- (void)_startVoiceTriggerSyncTimerWithInterval:(double)a3;
- (void)_synchronizeMirroredContainer:(id)a3;
- (void)_synchronizeVoiceTriggerData;
- (void)_trackCKContainer:(id)a3 accountInfo:(id)a4 foriCloudAltDSID:(id)a5;
- (void)_triggerMultiUserSharingPostBuddyOrCloudSyncChange;
- (void)_triggerVoiceProfileUploadPostBuddyOrCloudSyncChange;
- (void)_untrackiCloudAltDSID:(id)a3;
- (void)_voiceProfileFullDownloadTriggered:(id)a3;
- (void)_voiceTriggerEnabledDidChange;
- (void)_voiceTriggerPHSProfileDidChange;
- (void)acceptShare:(id)a3 token:(id)a4 containerID:(id)a5;
- (void)acceptShare:(id)a3 token:(id)a4 containerID:(id)a5 retryCount:(unint64_t)a6 object:(id)a7;
- (void)adCloudKitSharedZoneUpdater:(id)a3 didEncounterError:(id)a4;
- (void)addDictionaryToSharedStore:(id)a3 completion:(id)a4;
- (void)addDictionaryToSharedStore:(id)a3 recordKeysForDeletion:(id)a4 completion:(id)a5;
- (void)addKeyToSharedStore:(id)a3 value:(id)a4;
- (void)addKeyToSharedStore:(id)a3 value:(id)a4 completion:(id)a5;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6;
- (void)continueShareAcceptanceOperations;
- (void)dealloc;
- (void)deleteRecordFromSharedStore:(id)a3 completion:(id)a4;
- (void)deleteShareForUser:(id)a3 completion:(id)a4;
- (void)disableAndDeleteCloudSyncWithCompletion:(id)a3;
- (void)disablePushNotifications;
- (void)downloadVoiceProfileForiCloudAltDSID:(id)a3 completion:(id)a4;
- (void)enablePushNotifications;
- (void)fetchChangesWithZoneInfo:(id)a3 useSharedDatabase:(BOOL)a4;
- (void)fetchSharedUserIdForiCloudAltDSID:(id)a3 completion:(id)a4;
- (void)fetchValueForKeyFromSharedStore:(id)a3 completion:(id)a4;
- (void)fetchValueForKeyFromSharedStore:(id)a3 container:(id)a4 completion:(id)a5;
- (void)fetchValueForKeyFromSharedStore:(id)a3 container:(id)a4 withQOS:(int64_t)a5 completion:(id)a6;
- (void)fetchValueForKeyFromSharedStore:(id)a3 withQOS:(int64_t)a4 completion:(id)a5;
- (void)fetchValuesForKeysFromSharedStore:(id)a3 completion:(id)a4;
- (void)fetchValuesForKeysFromSharedStore:(id)a3 withQOS:(int64_t)a4 completion:(id)a5;
- (void)forceMultiUserSync:(BOOL)a3 download:(BOOL)a4 activity:(id)a5 completion:(id)a6;
- (void)forceMultiUserSync:(BOOL)a3 download:(BOOL)a4 activity:(id)a5 iCloudAltDSID:(id)a6 completion:(id)a7;
- (void)getDevicesWithAvailablePHSAssetsForLanguage:(id)a3 completion:(id)a4;
- (void)getDevicesWithAvailablePHSAssetsForLanguage:(id)a3 iCloudAltDSID:(id)a4 completion:(id)a5;
- (void)getDevicesWithAvailablePHSAssetsOnDeviceCheck:(id)a3;
- (void)handleCloudKitError:(id)a3 forZone:(id)a4 mirror:(BOOL)a5 operationType:(int64_t)a6;
- (void)handleSharedDBCloudKitError:(id)a3 operationType:(int64_t)a4;
- (void)handleSharingError:(id)a3;
- (void)hasEverSetLanguageCodeWithCompletion:(id)a3;
- (void)hasVoiceProfileAvailableForiCloudAltDSID:(id)a3 completion:(id)a4;
- (void)ignoreNextNotification:(id)a3;
- (void)removeHomeOwnerCKParticipantAssociation:(id)a3 onShare:(id)a4 onContainer:(id)a5 completion:(id)a6;
- (void)removeHomeOwnerCKParticipantAssociation:(id)a3 participants:(id)a4 completion:(id)a5;
- (void)retryShareDeletionOperation;
- (void)saveCloudSyncEnabledRecord:(BOOL)a3 mirror:(BOOL)a4 completion:(id)a5;
- (void)saveFileAssetRecordsWithDictionary:(id)a3 mirror:(BOOL)a4 onZone:(id)a5 activity:(id)a6 completion:(id)a7;
- (void)saveFileAssetRecordsWithDictionary:(id)a3 mirror:(BOOL)a4 onZone:(id)a5 completion:(id)a6;
- (void)saveKeyValueRecordsWithDictionary:(id)a3 mirror:(BOOL)a4 completion:(id)a5;
- (void)saveParticipantsOnShare:(id)a3 forOwner:(id)a4 participants:(id)a5;
- (void)saveRecordsWithDictionary:(id)a3 inZone:(id)a4 completion:(id)a5;
- (void)setAccountStatusRecordZoneInfo:(id)a3;
- (void)setApplicationIdentifier:(id)a3;
- (void)setCkAcctInfoDict:(id)a3;
- (void)setCloudSyncEnabled:(BOOL)a3;
- (void)setContainerDict:(id)a3;
- (void)setIsPastBuddy:(BOOL)a3;
- (void)setKeyValueRecordZoneInfo:(id)a3;
- (void)setListener:(id)a3;
- (void)setMirroredContainer:(id)a3;
- (void)setMultiUserRecordZoneInfo:(id)a3;
- (void)setPreferencesDidChangeNotificationIgnoreCount:(unsigned int)a3;
- (void)setPrimaryAccountInfo:(id)a3;
- (void)setPrimaryContainer:(id)a3;
- (void)setPushConnection:(id)a3;
- (void)setRecordZoneInfoDict:(id)a3;
- (void)setSerialQueue:(id)a3;
- (void)setSharedUserIdentifierNotificationIgnoreCount:(unsigned int)a3;
- (void)setUserID:(id)a3;
- (void)setVoiceTriggerEnabled:(BOOL)a3;
- (void)setVoiceTriggerRecordZoneInfo:(id)a3;
- (void)setVoiceTriggerSyncTimer:(id)a3;
- (void)setupContainerForiCloudAltDSID:(id)a3;
- (void)setupSharedZoneUpdaterForOwner;
- (void)setupZonesForSecondaryAccount:(id)a3;
- (void)shareWithOwner:(id)a3 addShare:(BOOL)a4 homes:(id)a5 completion:(id)a6;
- (void)shareWithOwner:(id)a3 addShare:(BOOL)a4 retryCount:(unint64_t)a5 homes:(id)a6 completion:(id)a7;
- (void)syncSiriRMVSetting:(BOOL)a3 iCloudAltDSID:(id)a4 homeUniqueIdentifier:(id)a5 completion:(id)a6;
- (void)synchronize;
- (void)triggerVoiceProfileUploadWithCompletion:(id)a3;
@end

@implementation ADCloudKitManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
  objc_storeStrong((id *)&self->_multiUserRecordZoneInfo, 0);
  objc_storeStrong((id *)&self->_voiceTriggerSyncTimer, 0);
  objc_storeStrong((id *)&self->_voiceTriggerRecordZoneInfo, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_keyValueRecordZoneInfo, 0);
  objc_storeStrong((id *)&self->_accountStatusRecordZoneInfo, 0);
  objc_storeStrong((id *)&self->_recordZoneInfoDict, 0);
  objc_storeStrong((id *)&self->_userID, 0);
  objc_storeStrong((id *)&self->_containerDict, 0);
  objc_storeStrong((id *)&self->_ckAcctInfoDict, 0);
  objc_storeStrong((id *)&self->_mirroredContainer, 0);
  objc_storeStrong((id *)&self->_primaryContainer, 0);
  objc_storeStrong((id *)&self->_primaryAccountInfo, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_pushConnection, 0);
  objc_storeStrong((id *)&self->_primaryAccountiCloudAltDSID, 0);
  objc_storeStrong((id *)&self->_instanceContext, 0);
  objc_storeStrong((id *)&self->_shareAcceptanceQueue, 0);
  objc_storeStrong((id *)&self->_ckRetryManager, 0);
  objc_storeStrong((id *)&self->_shareeOperations, 0);
  objc_storeStrong((id *)&self->_sharedZoneUpdater, 0);
  objc_storeStrong((id *)&self->_zoneShareCreator, 0);
  objc_storeStrong(&self->_vtZoneFetchCompletion, 0);
}

- (void)setSharedUserIdentifierNotificationIgnoreCount:(unsigned int)a3
{
  self->_sharedUserIdentifierNotificationIgnoreCount = a3;
}

- (unsigned)sharedUserIdentifierNotificationIgnoreCount
{
  return self->_sharedUserIdentifierNotificationIgnoreCount;
}

- (void)setPreferencesDidChangeNotificationIgnoreCount:(unsigned int)a3
{
  self->_preferencesDidChangeNotificationIgnoreCount = a3;
}

- (unsigned)preferencesDidChangeNotificationIgnoreCount
{
  return self->_preferencesDidChangeNotificationIgnoreCount;
}

- (void)setApplicationIdentifier:(id)a3
{
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (void)setMultiUserRecordZoneInfo:(id)a3
{
}

- (ADCloudKitRecordZoneInfo)multiUserRecordZoneInfo
{
  return self->_multiUserRecordZoneInfo;
}

- (void)setVoiceTriggerSyncTimer:(id)a3
{
}

- (OS_dispatch_source)voiceTriggerSyncTimer
{
  return self->_voiceTriggerSyncTimer;
}

- (void)setVoiceTriggerRecordZoneInfo:(id)a3
{
}

- (ADCloudKitRecordZoneInfo)voiceTriggerRecordZoneInfo
{
  return self->_voiceTriggerRecordZoneInfo;
}

- (void)setVoiceTriggerEnabled:(BOOL)a3
{
  self->_voiceTriggerEnabled = a3;
}

- (BOOL)voiceTriggerEnabled
{
  return self->_voiceTriggerEnabled;
}

- (void)setListener:(id)a3
{
}

- (CKNotificationListener)listener
{
  return self->_listener;
}

- (void)setKeyValueRecordZoneInfo:(id)a3
{
}

- (ADCloudKitRecordZoneInfo)keyValueRecordZoneInfo
{
  return self->_keyValueRecordZoneInfo;
}

- (void)setAccountStatusRecordZoneInfo:(id)a3
{
}

- (ADCloudKitRecordZoneInfo)accountStatusRecordZoneInfo
{
  return self->_accountStatusRecordZoneInfo;
}

- (void)setRecordZoneInfoDict:(id)a3
{
}

- (NSMutableDictionary)recordZoneInfoDict
{
  return self->_recordZoneInfoDict;
}

- (void)setUserID:(id)a3
{
}

- (NSString)userID
{
  return self->_userID;
}

- (void)setContainerDict:(id)a3
{
}

- (NSMutableDictionary)containerDict
{
  return self->_containerDict;
}

- (void)setCkAcctInfoDict:(id)a3
{
}

- (NSMutableDictionary)ckAcctInfoDict
{
  return self->_ckAcctInfoDict;
}

- (void)setMirroredContainer:(id)a3
{
}

- (ADCloudKitMirroredContainer)mirroredContainer
{
  return self->_mirroredContainer;
}

- (void)setPrimaryContainer:(id)a3
{
}

- (CKContainer)primaryContainer
{
  return self->_primaryContainer;
}

- (void)setPrimaryAccountInfo:(id)a3
{
}

- (CKAccountInfo)primaryAccountInfo
{
  return self->_primaryAccountInfo;
}

- (void)setSerialQueue:(id)a3
{
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setPushConnection:(id)a3
{
}

- (void)setCloudSyncEnabled:(BOOL)a3
{
  self->_cloudSyncEnabled = a3;
}

- (BOOL)cloudSyncEnabled
{
  return self->_cloudSyncEnabled;
}

- (void)setIsPastBuddy:(BOOL)a3
{
  self->_isPastBuddy = a3;
}

- (BOOL)isPastBuddy
{
  return self->_isPastBuddy;
}

- (void)handleSharedDBCloudKitError:(id)a3 operationType:(int64_t)a4
{
  id v6 = a3;
  v7 = v6;
  if (a4 == 8)
  {
    serialQueue = self->_serialQueue;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10008CAB4;
    v9[3] = &unk_10050E160;
    id v10 = v6;
    v11 = self;
    dispatch_async(serialQueue, v9);
  }
}

- (void)syncSiriRMVSetting:(BOOL)a3 iCloudAltDSID:(id)a4 homeUniqueIdentifier:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (+[AFFeatureFlags isLassoEnabled])
  {
    v13 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v21 = "-[ADCloudKitManager syncSiriRMVSetting:iCloudAltDSID:homeUniqueIdentifier:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
    }
    serialQueue = self->_serialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10008D194;
    block[3] = &unk_100509CF0;
    block[4] = self;
    id v16 = v10;
    id v18 = v12;
    id v17 = v11;
    BOOL v19 = a3;
    dispatch_async(serialQueue, block);
  }
}

- (void)hasVoiceProfileAvailableForiCloudAltDSID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008D604;
  block[3] = &unk_10050E1D8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(serialQueue, block);
}

- (void)handleSharingError:(id)a3
{
}

- (void)handleCloudKitError:(id)a3 forZone:(id)a4 mirror:(BOOL)a5 operationType:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = [v10 copy];
  serialQueue = self->_serialQueue;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10008D99C;
  v17[3] = &unk_100508738;
  BOOL v23 = a5;
  id v18 = v11;
  BOOL v19 = self;
  id v20 = v12;
  id v21 = v10;
  int64_t v22 = a6;
  id v14 = v10;
  id v15 = v12;
  id v16 = v11;
  dispatch_async(serialQueue, v17);
}

- (void)fetchChangesWithZoneInfo:(id)a3 useSharedDatabase:(BOOL)a4
{
  id v6 = a3;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008E670;
  block[3] = &unk_10050CA08;
  block[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  dispatch_async(serialQueue, block);
}

- (void)_forceMultiUserSync:(BOOL)a3 download:(BOOL)a4 retryCount:(unint64_t)a5 activity:(id)a6 iCloudAltDSID:(id)a7 completion:(id)a8
{
  id v14 = a6;
  id v15 = a7;
  id v16 = a8;
  if (a5 < 4)
  {
    serialQueue = self->_serialQueue;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10008E850;
    v20[3] = &unk_100500930;
    id v21 = v15;
    int64_t v22 = self;
    BOOL v26 = a3;
    id v24 = v16;
    BOOL v27 = a4;
    id v23 = v14;
    unint64_t v25 = a5;
    dispatch_async(serialQueue, v20);

    id v18 = v21;
    goto LABEL_6;
  }
  id v17 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v29 = "-[ADCloudKitManager _forceMultiUserSync:download:retryCount:activity:iCloudAltDSID:completion:]";
    _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s Too many retries. Bailing out", buf, 0xCu);
    if (!v16) {
      goto LABEL_7;
    }
    goto LABEL_4;
  }
  if (v16)
  {
LABEL_4:
    id v18 = +[AFError errorWithCode:6001];
    (*((void (**)(id, void *))v16 + 2))(v16, v18);
LABEL_6:
  }
LABEL_7:
}

- (void)_forceMultiUserSync:(BOOL)a3 download:(BOOL)a4 retryCount:(unint64_t)a5 activity:(id)a6 completion:(id)a7
{
}

- (void)forceMultiUserSync:(BOOL)a3 download:(BOOL)a4 activity:(id)a5 iCloudAltDSID:(id)a6 completion:(id)a7
{
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    unint64_t v25 = "-[ADCloudKitManager forceMultiUserSync:download:activity:iCloudAltDSID:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  if (a3 || a4)
  {
    serialQueue = self->_serialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10008F6C8;
    block[3] = &unk_100506620;
    block[4] = self;
    BOOL v22 = a3;
    BOOL v23 = a4;
    id v19 = v12;
    id v20 = v13;
    id v21 = v14;
    dispatch_async(serialQueue, block);
  }
  else if (v14)
  {
    id v16 = +[AFError errorWithCode:6002];
    (*((void (**)(id, void *))v14 + 2))(v14, v16);
  }
}

- (void)forceMultiUserSync:(BOOL)a3 download:(BOOL)a4 activity:(id)a5 completion:(id)a6
{
}

- (void)hasEverSetLanguageCodeWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    BOOL v11 = "-[ADCloudKitManager hasEverSetLanguageCodeWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  serialQueue = self->_serialQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10008F818;
  v8[3] = &unk_10050E188;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(serialQueue, v8);
}

- (void)_fetchManifest:(id)a3 legacy:(BOOL)a4 language:(id)a5 completion:(id)a6
{
  BOOL v7 = a4;
  id v9 = a5;
  id v10 = a6;
  id v11 = a3;
  id v12 = [objc_alloc((Class)CKRecordZoneID) initWithZoneName:@"com.apple.assistant.backedup" ownerName:CKCurrentUserDefaultName];
  id v13 = objc_alloc((Class)CKRecordID);
  if (v7) {
    CFStringRef v14 = @"PHS Language Manifest";
  }
  else {
    CFStringRef v14 = @"PHS Language Manifest V2";
  }
  id v15 = [v13 initWithRecordName:v14 zoneID:v12];
  id v16 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    CFStringRef v17 = @"manifest lookup";
    if (v7) {
      CFStringRef v17 = @"legacy manifest lookup";
    }
    *(_DWORD *)buf = 136315394;
    v33 = "-[ADCloudKitManager _fetchManifest:legacy:language:completion:]";
    __int16 v34 = 2112;
    CFStringRef v35 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  id v18 = objc_alloc((Class)CKFetchRecordsOperation);
  id v31 = v15;
  id v19 = +[NSArray arrayWithObjects:&v31 count:1];
  id v20 = [v18 initWithRecordIDs:v19];

  id v24 = _NSConcreteStackBlock;
  uint64_t v25 = 3221225472;
  BOOL v26 = sub_1000902DC;
  BOOL v27 = &unk_1005072C8;
  id v28 = v15;
  id v29 = v9;
  id v30 = v10;
  id v21 = v10;
  id v22 = v9;
  id v23 = v15;
  [v20 setFetchRecordsCompletionBlock:&v24];
  objc_msgSend(v20, "setQualityOfService:", 25, v24, v25, v26, v27);
  [v11 addOperation:v20];
}

- (void)_fetchManifest:(id)a3 language:(id)a4 completion:(id)a5
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100090898;
  v10[3] = &unk_1005008B8;
  id v11 = self;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v7 = v13;
  id v8 = v12;
  id v9 = v14;
  [(ADCloudKitManager *)v11 _fetchManifest:v8 legacy:0 language:v7 completion:v10];
}

- (void)getDevicesWithAvailablePHSAssetsOnDeviceCheck:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    serialQueue = self->_serialQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000909B4;
    v7[3] = &unk_10050E188;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(serialQueue, v7);
  }
}

- (void)_devicesWithAvailablePHSAssetsForLanguage:(id)a3 iCloudAltDSID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v25 = "-[ADCloudKitManager _devicesWithAvailablePHSAssetsForLanguage:iCloudAltDSID:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  if (v10)
  {
    if ([v8 length])
    {
      if (v9)
      {
        id v12 = (void *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          containerDict = self->_containerDict;
          id v14 = v12;
          id v15 = [(NSMutableDictionary *)containerDict allKeys];
          *(_DWORD *)buf = 136315651;
          uint64_t v25 = "-[ADCloudKitManager _devicesWithAvailablePHSAssetsForLanguage:iCloudAltDSID:completion:]";
          __int16 v26 = 2113;
          id v27 = v9;
          __int16 v28 = 2112;
          id v29 = v15;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s Choosing container for %{private}@ from %@", buf, 0x20u);
        }
        id v16 = [(ADCloudKitManager *)self _trackedCKContainerForiCloudAltDSID:v9];
      }
      else
      {
        id v16 = 0;
      }
      serialQueue = self->_serialQueue;
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_100090D68;
      v19[3] = &unk_10050E228;
      id v20 = v8;
      id v21 = self;
      id v22 = v16;
      id v23 = v10;
      id v18 = v16;
      dispatch_async(serialQueue, v19);
    }
    else
    {
      (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
    }
  }
}

- (void)getDevicesWithAvailablePHSAssetsForLanguage:(id)a3 iCloudAltDSID:(id)a4 completion:(id)a5
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10009124C;
  v8[3] = &unk_10050D728;
  id v9 = a5;
  id v7 = v9;
  [(ADCloudKitManager *)self _devicesWithAvailablePHSAssetsForLanguage:a3 iCloudAltDSID:0 completion:v8];
}

- (void)getDevicesWithAvailablePHSAssetsForLanguage:(id)a3 completion:(id)a4
{
}

- (id)_verifyAccountWithManateeRequired:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v20 = 136315394;
    id v21 = "-[ADCloudKitManager _verifyAccountWithManateeRequired:]";
    __int16 v22 = 1024;
    BOOL v23 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Requires manatee: %d", (uint8_t *)&v20, 0x12u);
  }
  BOOL v6 = self->_usingNonManateeIdentity || !v3;
  if (!v6
    && ![(CKAccountInfo *)self->_primaryAccountInfo supportsDeviceToDeviceEncryption]|| [(CKAccountInfo *)self->_primaryAccountInfo accountStatus] != (id)1)
  {
    id v15 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v20 = 136315138;
      id v21 = "-[ADCloudKitManager _verifyAccountWithManateeRequired:]";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s CloudKit account is unavailable", (uint8_t *)&v20, 0xCu);
    }
    uint64_t v16 = 4013;
    goto LABEL_23;
  }
  if (!self->_cloudSyncEnabled)
  {
    CFStringRef v17 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v20 = 136315138;
      id v21 = "-[ADCloudKitManager _verifyAccountWithManateeRequired:]";
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s Cloud sync is disabled", (uint8_t *)&v20, 0xCu);
    }
    uint64_t v16 = 4014;
LABEL_23:
    id v14 = +[AFError errorWithCode:v16];
    goto LABEL_31;
  }
  primaryContainer = self->_primaryContainer;
  if (!primaryContainer)
  {
    id v8 = [(ADCloudKitManager *)self getContainerIDForThisDevice];
    sub_1003104B8(v8);
    id v9 = (CKContainer *)objc_claimAutoreleasedReturnValue();
    id v10 = self->_primaryContainer;
    self->_primaryContainer = v9;

    if (self->_primaryAccountiCloudAltDSID) {
      -[ADCloudKitManager _trackCKContainer:accountInfo:foriCloudAltDSID:](self, "_trackCKContainer:accountInfo:foriCloudAltDSID:", self->_primaryContainer, 0);
    }
    if (AFIsMultiUserCompanion() && !self->_usingNonManateeIdentity)
    {
      id v11 = [[ADCloudKitMirroredContainer alloc] initWithContainer:@"com.apple.siri.data" queue:self->_serialQueue];
      mirroredContainer = self->_mirroredContainer;
      self->_mirroredContainer = v11;
    }
    primaryContainer = self->_primaryContainer;
  }
  id v13 = [(CKContainer *)primaryContainer privateCloudDatabase];
  if (!v13)
  {
    uint64_t v18 = 4015;
LABEL_29:
    id v14 = +[AFError errorWithCode:v18];
    goto LABEL_30;
  }
  if (!self->_multiUserRecordZoneInfo)
  {
    uint64_t v18 = 4016;
    goto LABEL_29;
  }
  id v14 = 0;
LABEL_30:

LABEL_31:
  return v14;
}

- (void)downloadVoiceProfileForiCloudAltDSID:(id)a3 completion:(id)a4
{
  id v5 = a3;
  BOOL v6 = (void (**)(id, void *))a4;
  id v7 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315394;
    id v10 = "-[ADCloudKitManager downloadVoiceProfileForiCloudAltDSID:completion:]";
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s iCloudAltDSID: %@", (uint8_t *)&v9, 0x16u);
  }
  if (v6)
  {
    id v8 = +[AFError errorWithCode:13];
    v6[2](v6, v8);
  }
}

- (void)triggerVoiceProfileUploadWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v11 = "-[ADCloudKitManager triggerVoiceProfileUploadWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  serialQueue = self->_serialQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10009182C;
  v8[3] = &unk_10050E188;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(serialQueue, v8);
}

- (void)disableAndDeleteCloudSyncWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v11 = "-[ADCloudKitManager disableAndDeleteCloudSyncWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  serialQueue = self->_serialQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100091AB4;
  v8[3] = &unk_10050E188;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(serialQueue, v8);
}

- (void)synchronize
{
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100092530;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(serialQueue, block);
}

- (BOOL)preferencesHaveBeenSynchronized
{
  v2 = +[ADPreferences sharedPreferences];
  BOOL v3 = [v2 keyValueServerChangeToken];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)retryShareDeletionOperation
{
  id v2 = +[ADHomeInfoManager sharedInfoManager];
  [v2 restartShareDeletion];
}

- (void)saveParticipantsOnShare:(id)a3 forOwner:(id)a4 participants:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100092724;
  block[3] = &unk_10050DCB8;
  block[4] = self;
  id v13 = v8;
  id v14 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(serialQueue, block);
}

- (void)shareWithOwner:(id)a3 addShare:(BOOL)a4 retryCount:(unint64_t)a5 homes:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  if (a5 < 0x10)
  {
    serialQueue = self->_serialQueue;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100092EB8;
    v18[3] = &unk_100509348;
    v18[4] = self;
    BOOL v23 = a4;
    id v19 = v12;
    unint64_t v22 = a5;
    id v20 = v13;
    id v21 = v14;
    dispatch_async(serialQueue, v18);

    goto LABEL_6;
  }
  id v15 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v25 = "-[ADCloudKitManager shareWithOwner:addShare:retryCount:homes:completion:]";
    _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s Account not ready or giving up after failures.", buf, 0xCu);
    if (!v14) {
      goto LABEL_6;
    }
    goto LABEL_4;
  }
  if (v14)
  {
LABEL_4:
    uint64_t v16 = +[AFError errorWithCode:4013];
    (*((void (**)(id, void, void, void *))v14 + 2))(v14, 0, 0, v16);
  }
LABEL_6:
}

- (void)shareWithOwner:(id)a3 addShare:(BOOL)a4 homes:(id)a5 completion:(id)a6
{
}

- (void)removeHomeOwnerCKParticipantAssociation:(id)a3 onShare:(id)a4 onContainer:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000938DC;
  v16[3] = &unk_100504168;
  id v17 = v10;
  uint64_t v18 = self;
  id v20 = a5;
  id v21 = a6;
  id v19 = v11;
  id v12 = v20;
  id v13 = v11;
  id v14 = v21;
  id v15 = v10;
  [(ADCloudKitManager *)self fetchValueForKeyFromSharedStore:@"ADCloudKitShareParticipants" completion:v16];
}

- (void)removeHomeOwnerCKParticipantAssociation:(id)a3 participants:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [a4 mutableCopy];
  [v10 removeObjectForKey:v8];
  id v11 = objc_alloc((Class)NSDictionary);
  id v12 = [v10 copy];
  id v13 = objc_msgSend(v11, "initWithObjectsAndKeys:", v12, @"ADCloudKitShareParticipants", 0);

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000946AC;
  v18[3] = &unk_1005082F0;
  id v19 = v8;
  id v20 = self;
  id v21 = v10;
  id v22 = v9;
  id v14 = v9;
  id v15 = v10;
  id v16 = v8;
  id v17 = self;
  [(ADCloudKitManager *)v17 addDictionaryToSharedStore:v13 completion:v18];
}

- (void)deleteShareForUser:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  shareeOperations = self->_shareeOperations;
  if (!shareeOperations)
  {
    id v9 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315138;
      id v11 = "-[ADCloudKitManager deleteShareForUser:completion:]";
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s Request to delete data when sharee operations not setup", (uint8_t *)&v10, 0xCu);
      if (!v7) {
        goto LABEL_6;
      }
    }
    else if (!v7)
    {
      goto LABEL_6;
    }
    v7[2](v7);
    goto LABEL_6;
  }
  [(ADCloudKitShareeOperations *)shareeOperations deleteShareForUser:v6 markForReinvitation:0 completion:v7];
LABEL_6:
}

- (void)_acceptSharesForMetadatas:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)CKAcceptSharesOperation) initWithShareMetadatas:v4];

  id v6 = +[NSMutableArray array];
  id v7 = self;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100094B98;
  v13[3] = &unk_10050CB48;
  v13[4] = v7;
  v13[5] = v7;
  [v5 setAcceptSharesCompletionBlock:v13];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100094D9C;
  v11[3] = &unk_100500730;
  v11[4] = v7;
  v11[5] = v7;
  id v8 = v6;
  id v12 = v8;
  [v5 setPerShareCompletionBlock:v11];
  mirroredContainer = v7->_mirroredContainer;
  if (mirroredContainer)
  {
    int v10 = [(ADCloudKitMirroredContainer *)mirroredContainer container];
    [v10 addOperation:v5];
  }
  else
  {
    [(CKContainer *)v7->_primaryContainer addOperation:v5];
  }
}

- (void)acceptShare:(id)a3 token:(id)a4 containerID:(id)a5 retryCount:(unint64_t)a6 object:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  serialQueue = self->_serialQueue;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100095228;
  v21[3] = &unk_100500708;
  id v22 = v15;
  BOOL v23 = self;
  id v24 = v12;
  id v25 = v13;
  id v26 = v14;
  unint64_t v27 = a6;
  id v17 = v14;
  id v18 = v13;
  id v19 = v12;
  id v20 = v15;
  dispatch_async(serialQueue, v21);
}

- (void)acceptShare:(id)a3 token:(id)a4 containerID:(id)a5
{
}

- (void)continueShareAcceptanceOperations
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  BOOL v3 = [(AFQueue *)self->_shareAcceptanceQueue frontObject];
  if (v3)
  {
    id v4 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      id v8 = v4;
      id v9 = [v3 url];
      int v10 = 136315394;
      id v11 = "-[ADCloudKitManager continueShareAcceptanceOperations]";
      __int16 v12 = 2112;
      id v13 = v9;
      _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%s Retry for url (%@)", (uint8_t *)&v10, 0x16u);
    }
    objc_msgSend(v3, "setRetryCount:", (char *)objc_msgSend(v3, "retryCount") + 1);
    id v5 = [v3 url];
    id v6 = [v3 token];
    id v7 = [v3 containerID];
    -[ADCloudKitManager acceptShare:token:containerID:retryCount:object:](self, "acceptShare:token:containerID:retryCount:object:", v5, v6, v7, [v3 retryCount], v3);
  }
}

- (id)containerIDs
{
  if (self->_usingNonManateeIdentity)
  {
    CFStringRef v6 = @"com.apple.siri.zonesharing";
    id v2 = &v6;
  }
  else
  {
    CFStringRef v5 = @"com.apple.siri.data";
    id v2 = &v5;
  }
  BOOL v3 = +[NSArray arrayWithObjects:v2 count:1];
  return v3;
}

- (void)_setupSharedZoneView
{
  if (!self->_shareeOperations)
  {
    self->_shareeOperations = [[ADCloudKitShareeOperations alloc] initWithQueue:self->_serialQueue container:self->_primaryContainer instanceContext:self->_instanceContext];
    _objc_release_x1();
  }
}

- (void)fetchSharedUserIdForiCloudAltDSID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (v6)
    {
      id v8 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        containerDict = self->_containerDict;
        int v10 = v8;
        id v11 = [(NSMutableDictionary *)containerDict allKeys];
        *(_DWORD *)buf = 136315651;
        id v16 = "-[ADCloudKitManager fetchSharedUserIdForiCloudAltDSID:completion:]";
        __int16 v17 = 2113;
        id v18 = v6;
        __int16 v19 = 2112;
        id v20 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s Choosing container for %{private}@ from %@", buf, 0x20u);
      }
      __int16 v12 = [(ADCloudKitManager *)self _trackedCKContainerForiCloudAltDSID:v6];
    }
    else
    {
      __int16 v12 = 0;
    }
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000962DC;
    v13[3] = &unk_1005006B8;
    v13[4] = self;
    id v14 = v7;
    [(ADCloudKitManager *)self fetchValueForKeyFromSharedStore:@"meDeviceSharedUserID" container:v12 completion:v13];
  }
}

- (void)fetchValuesForKeysFromSharedStore:(id)a3 withQOS:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([v8 count])
  {
    serialQueue = self->_serialQueue;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000966FC;
    v11[3] = &unk_10050C278;
    v11[4] = self;
    id v13 = v9;
    id v12 = v8;
    int64_t v14 = a4;
    dispatch_async(serialQueue, v11);
  }
  else if (v9)
  {
    (*((void (**)(id, void, void))v9 + 2))(v9, 0, 0);
  }
}

- (void)fetchValuesForKeysFromSharedStore:(id)a3 completion:(id)a4
{
}

- (void)fetchValueForKeyFromSharedStore:(id)a3 withQOS:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  serialQueue = self->_serialQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100096894;
  v13[3] = &unk_10050C278;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a4;
  id v11 = v8;
  id v12 = v9;
  dispatch_async(serialQueue, v13);
}

- (void)fetchValueForKeyFromSharedStore:(id)a3 completion:(id)a4
{
}

- (void)fetchValueForKeyFromSharedStore:(id)a3 container:(id)a4 withQOS:(int64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100096A4C;
  block[3] = &unk_100509510;
  block[4] = self;
  id v18 = v11;
  id v20 = v12;
  int64_t v21 = a5;
  id v19 = v10;
  id v14 = v12;
  id v15 = v10;
  id v16 = v11;
  dispatch_async(serialQueue, block);
}

- (void)fetchValueForKeyFromSharedStore:(id)a3 container:(id)a4 completion:(id)a5
{
}

- (void)deleteRecordFromSharedStore:(id)a3 completion:(id)a4
{
}

- (void)addDictionaryToSharedStore:(id)a3 completion:(id)a4
{
}

- (void)addDictionaryToSharedStore:(id)a3 recordKeysForDeletion:(id)a4 completion:(id)a5
{
  unint64_t v8 = (unint64_t)a3;
  unint64_t v9 = (unint64_t)a4;
  id v10 = a5;
  id v11 = v10;
  if (v8 | v9)
  {
    serialQueue = self->_serialQueue;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100096BF0;
    v13[3] = &unk_10050E228;
    v13[4] = self;
    id v16 = v10;
    id v14 = (id)v8;
    id v15 = (id)v9;
    dispatch_async(serialQueue, v13);
  }
  else if (v10)
  {
    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
}

- (void)addKeyToSharedStore:(id)a3 value:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  serialQueue = self->_serialQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100096D94;
  v15[3] = &unk_10050E228;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  dispatch_async(serialQueue, v15);
}

- (void)addKeyToSharedStore:(id)a3 value:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100096F0C;
  block[3] = &unk_10050DCB8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(serialQueue, block);
}

- (void)adCloudKitSharedZoneUpdater:(id)a3 didEncounterError:(id)a4
{
  id v5 = a4;
  [(ADCloudKitManager *)self handleCloudKitError:v5 forZone:@"com.apple.assistant.multiuser.shared" mirror:AFIsMultiUserCompanion() operationType:2];
}

- (void)setupSharedZoneUpdaterForOwner
{
  [(ADCloudKitManager *)self _setupSharedZoneUpdaterForOwner];
  if (!self->_sharedZoneUpdater)
  {
    BOOL v3 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v10 = "-[ADCloudKitManager setupSharedZoneUpdaterForOwner]";
      _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%s _sharedZoneUpdater is nil, scheduling the retryManager", buf, 0xCu);
    }
    id v4 = [(ADCloudKitMirroredContainer *)self->_mirroredContainer multiUserRecordZoneInfo];
    if (!v4) {
      id v4 = self->_multiUserRecordZoneInfo;
    }
    serialQueue = self->_serialQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000970C4;
    v7[3] = &unk_10050E160;
    v7[4] = self;
    id v8 = v4;
    id v6 = v4;
    dispatch_async(serialQueue, v7);
  }
}

- (void)_setupSharedZoneUpdaterForOwner
{
  BOOL v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315138;
    id v10 = "-[ADCloudKitManager _setupSharedZoneUpdaterForOwner]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v9, 0xCu);
  }
  if (!self->_sharedZoneUpdater)
  {
    id v4 = [(ADCloudKitMirroredContainer *)self->_mirroredContainer multiUserRecordZoneInfo];
    if (!v4) {
      id v4 = self->_multiUserRecordZoneInfo;
    }
    id v5 = [(ADCloudKitMirroredContainer *)self->_mirroredContainer container];
    if (!v5 || self->_usingNonManateeIdentity)
    {
      id v6 = self->_primaryContainer;

      id v5 = v6;
    }
    id v7 = [[ADCloudKitSharedZoneUpdater alloc] initWithQueue:self->_serialQueue container:v5 sharedZone:v4 zoneOwner:1 delegate:self];
    sharedZoneUpdater = self->_sharedZoneUpdater;
    self->_sharedZoneUpdater = v7;
  }
}

- (void)_scheduleMirrorSynchronizationAfterDelay:(id)a3
{
  id v4 = a3;
  dispatch_time_t v5 = dispatch_time(0, 600000000000);
  serialQueue = self->_serialQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100097334;
  v8[3] = &unk_10050E160;
  id v9 = v4;
  id v10 = self;
  id v7 = v4;
  dispatch_after(v5, serialQueue, v8);
}

- (void)_synchronizeMirroredContainer:(id)a3
{
  id v4 = a3;
  dispatch_time_t v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    BOOL v23 = "-[ADCloudKitManager _synchronizeMirroredContainer:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  id v6 = [v4 zoneName];
  unsigned int v7 = [v6 isEqualToString:@"com.apple.assistant.backedup"];

  if (v7)
  {
    id v8 = [(ADCloudKitMirroredContainer *)self->_mirroredContainer keyValueRecordZoneInfo];
    id v9 = [v8 dataStore];

    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100097768;
    v21[3] = &unk_10050B918;
    void v21[4] = self;
    [v9 synchronizeWithCompletion:v21];
    [v9 synchronizeKeychainPreferencesWithCompletion:&stru_100500690];

    goto LABEL_10;
  }
  id v10 = [v4 zoneName];
  unsigned int v11 = [v10 isEqualToString:@"com.apple.assistant.account.status"];

  if (v11)
  {
    id v12 = [(ADCloudKitMirroredContainer *)self->_mirroredContainer accountStatusRecordZoneInfo];
    id v13 = [v12 dataStore];
    id v14 = v13;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100097840;
    v20[3] = &unk_10050B918;
    void v20[4] = self;
    id v15 = v20;
LABEL_9:
    [v13 synchronizeWithCompletion:v15];

    goto LABEL_10;
  }
  id v16 = [v4 zoneName];
  unsigned int v17 = [v16 isEqualToString:@"com.apple.assistant.multiuser.shared"];

  if (v17)
  {
    id v12 = [(ADCloudKitMirroredContainer *)self->_mirroredContainer multiUserRecordZoneInfo];
    id v13 = [v12 dataStore];
    id v14 = v13;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100097918;
    v19[3] = &unk_10050B918;
    void v19[4] = self;
    id v15 = v19;
    goto LABEL_9;
  }
  id v18 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    BOOL v23 = "-[ADCloudKitManager _synchronizeMirroredContainer:]";
    __int16 v24 = 2112;
    id v25 = v4;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s Unknown zone (%@)", buf, 0x16u);
  }
LABEL_10:
}

- (id)getContainerIDForThisDevice
{
  if (self->_usingNonManateeIdentity) {
    return @"com.apple.siri.zonesharing";
  }
  if (AFSupportsMultiUser()) {
    return @"com.apple.siri.data";
  }
  return @"com.apple.siri.profile";
}

- (void)_cleanUpRecordZonesAndSubscriptions
{
  BOOL v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    dispatch_time_t v5 = "-[ADCloudKitManager _cleanUpRecordZonesAndSubscriptions]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  [(ADCloudKitManager *)self _cleanUpRecordZoneSubscriptionsTimers];
  [(ADCloudKitRecordZoneInfo *)self->_accountStatusRecordZoneInfo setZone:0];
  [(ADCloudKitRecordZoneInfo *)self->_accountStatusRecordZoneInfo setSubscriptionList:0];
  [(ADCloudKitRecordZoneInfo *)self->_keyValueRecordZoneInfo setZone:0];
  [(ADCloudKitRecordZoneInfo *)self->_keyValueRecordZoneInfo setSubscriptionList:0];
  [(ADCloudKitRecordZoneInfo *)self->_voiceTriggerRecordZoneInfo setZone:0];
  [(ADCloudKitRecordZoneInfo *)self->_voiceTriggerRecordZoneInfo setSubscriptionList:0];
  [(ADCloudKitRecordZoneInfo *)self->_multiUserRecordZoneInfo setZone:0];
  [(ADCloudKitRecordZoneInfo *)self->_multiUserRecordZoneInfo setSubscriptionList:0];
}

- (void)_cleanUpRecordZoneSubscriptionsTimers
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  [(ADCloudKitRetryManager *)self->_ckRetryManager cancelRecordZoneSetupTimerForZoneInfo:self->_accountStatusRecordZoneInfo];
  [(ADCloudKitRetryManager *)self->_ckRetryManager cancelSubscriptionSetupTimerForZoneInfo:self->_accountStatusRecordZoneInfo];
  [(ADCloudKitRetryManager *)self->_ckRetryManager cancelRateLimitTimerForZoneInfo:self->_accountStatusRecordZoneInfo];
  [(ADCloudKitRetryManager *)self->_ckRetryManager cancelSyncRetryTimerForZoneInfo:self->_accountStatusRecordZoneInfo];
  [(ADCloudKitRetryManager *)self->_ckRetryManager cancelRecordZoneSetupTimerForZoneInfo:self->_keyValueRecordZoneInfo];
  [(ADCloudKitRetryManager *)self->_ckRetryManager cancelSubscriptionSetupTimerForZoneInfo:self->_keyValueRecordZoneInfo];
  [(ADCloudKitRetryManager *)self->_ckRetryManager cancelRateLimitTimerForZoneInfo:self->_keyValueRecordZoneInfo];
  [(ADCloudKitRetryManager *)self->_ckRetryManager cancelSyncRetryTimerForZoneInfo:self->_keyValueRecordZoneInfo];
  [(ADCloudKitRetryManager *)self->_ckRetryManager cancelRecordZoneSetupTimerForZoneInfo:self->_voiceTriggerRecordZoneInfo];
  [(ADCloudKitRetryManager *)self->_ckRetryManager cancelSubscriptionSetupTimerForZoneInfo:self->_voiceTriggerRecordZoneInfo];
  [(ADCloudKitRetryManager *)self->_ckRetryManager cancelRateLimitTimerForZoneInfo:self->_voiceTriggerRecordZoneInfo];
  [(ADCloudKitRetryManager *)self->_ckRetryManager cancelSyncRetryTimerForZoneInfo:self->_voiceTriggerRecordZoneInfo];
  [(ADCloudKitRetryManager *)self->_ckRetryManager cancelRecordZoneSetupTimerForZoneInfo:self->_multiUserRecordZoneInfo];
  [(ADCloudKitRetryManager *)self->_ckRetryManager cancelSubscriptionSetupTimerForZoneInfo:self->_multiUserRecordZoneInfo];
  [(ADCloudKitRetryManager *)self->_ckRetryManager cancelRateLimitTimerForZoneInfo:self->_multiUserRecordZoneInfo];
  ckRetryManager = self->_ckRetryManager;
  multiUserRecordZoneInfo = self->_multiUserRecordZoneInfo;
  [(ADCloudKitRetryManager *)ckRetryManager cancelSyncRetryTimerForZoneInfo:multiUserRecordZoneInfo];
}

- (void)_createRecordZoneSubscriptionWithZoneID:(id)a3 name:(id)a4 recordTypes:(id)a5 container:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  unsigned int v17 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v37 = "-[ADCloudKitManager _createRecordZoneSubscriptionWithZoneID:name:recordTypes:container:completion:]";
    __int16 v38 = 2112;
    id v39 = v13;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s Creating zone subscription: (%@)", buf, 0x16u);
  }
  if (v15)
  {
    id v18 = (CKContainer *)v15;
LABEL_6:
    id v31 = v18;
    v32 = v16;
    id v19 = objc_alloc_init((Class)NSMutableArray);
    if ([v14 count])
    {
      uint64_t v20 = 0;
      unsigned int v21 = 1;
      do
      {
        id v22 = objc_alloc((Class)CKRecordZoneSubscription);
        BOOL v23 = [v13 objectAtIndexedSubscript:v20];
        id v24 = [v22 initWithZoneID:v12 subscriptionID:v23];

        id v25 = [v14 objectAtIndexedSubscript:v20];
        [v24 setRecordType:v25];

        id v26 = objc_alloc_init((Class)CKNotificationInfo);
        [v26 setShouldSendContentAvailable:1];
        [v24 setNotificationInfo:v26];
        [v19 addObject:v24];

        uint64_t v20 = v21;
      }
      while ((unint64_t)[v14 count] > v21++);
    }
    id v28 = [objc_alloc((Class)CKModifySubscriptionsOperation) initWithSubscriptionsToSave:v19 subscriptionIDsToDelete:0];
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_100098040;
    v33[3] = &unk_10050BF60;
    id v34 = v13;
    id v16 = v32;
    id v35 = v32;
    [v28 setModifySubscriptionsCompletionBlock:v33];
    [v28 setQualityOfService:17];
    id v29 = v31;
    id v30 = [(CKContainer *)v31 privateCloudDatabase];
    [v30 addOperation:v28];

    goto LABEL_10;
  }
  id v18 = self->_primaryContainer;
  if (v18) {
    goto LABEL_6;
  }
  if (!v16) {
    goto LABEL_11;
  }
  id v29 = +[AFError errorWithCode:4003];
  (*((void (**)(id, void *, void))v16 + 2))(v16, v29, 0);
LABEL_10:

LABEL_11:
}

- (void)_setupRecordZoneSubscriptionWithZoneInfo:(id)a3 retryInterval:(double)a4 container:(id)a5
{
  id v8 = a3;
  id v9 = (CKContainer *)a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v10 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(v37) = 136315138;
    *(void *)((char *)&v37 + 4) = "-[ADCloudKitManager _setupRecordZoneSubscriptionWithZoneInfo:retryInterval:container:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v37, 0xCu);
  }
  [(ADCloudKitRetryManager *)self->_ckRetryManager cancelSubscriptionSetupTimerForZoneInfo:v8];
  *(void *)&long long v37 = 0;
  *((void *)&v37 + 1) = &v37;
  uint64_t v38 = 0x3032000000;
  id v39 = sub_100092050;
  v40 = sub_100092060;
  id v41 = 0;
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x2020000000;
  unsigned __int8 v32 = 0;
  unsigned int v11 = [v8 zoneName];
  unsigned __int8 v12 = [(ADCloudKitManager *)self _isCloudSyncEnabledForZone:v11];

  unsigned __int8 v32 = v12;
  if (!v9) {
    id v9 = self->_primaryContainer;
  }
  if (*((unsigned char *)v30 + 24))
  {
    id v13 = [v8 zone];
    id v14 = [v13 zoneID];

    if (v14)
    {
      id v15 = [v8 zone];
      id v16 = [v15 zoneID];
      unsigned int v17 = [v8 subscriptionNames];
      id v18 = [v8 dataStore];
      id v19 = [v18 supportedRecordTypes];
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_100098598;
      v23[3] = &unk_100500670;
      v23[4] = self;
      id v24 = v8;
      id v26 = &v29;
      unint64_t v27 = &v37;
      double v28 = a4;
      id v25 = v9;
      [(ADCloudKitManager *)self _createRecordZoneSubscriptionWithZoneID:v16 name:v17 recordTypes:v19 container:v25 completion:v23];
    }
    else
    {
      id v22 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        id v34 = "-[ADCloudKitManager _setupRecordZoneSubscriptionWithZoneInfo:retryInterval:container:]";
        _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s Unable to create zone subscription without a record zone", buf, 0xCu);
      }
      [(ADCloudKitRetryManager *)self->_ckRetryManager cancelSubscriptionSetupTimerForZoneInfo:v8];
    }
  }
  else
  {
    uint64_t v20 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      unsigned int v21 = [v8 zoneName];
      *(_DWORD *)buf = 136315394;
      id v34 = "-[ADCloudKitManager _setupRecordZoneSubscriptionWithZoneInfo:retryInterval:container:]";
      __int16 v35 = 2112;
      v36 = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%s iCloud sync is disabled. Unable to create subscription for zone: (%@)", buf, 0x16u);
    }
  }
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v37, 8);
}

- (void)saveRecordsWithDictionary:(id)a3 inZone:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unsigned int v11 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    unsigned int v21 = "-[ADCloudKitManager saveRecordsWithDictionary:inZone:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  serialQueue = self->_serialQueue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100098CE4;
  v16[3] = &unk_10050E228;
  void v16[4] = self;
  id v17 = v9;
  id v18 = v8;
  id v19 = v10;
  id v13 = v8;
  id v14 = v10;
  id v15 = v9;
  dispatch_async(serialQueue, v16);
}

- (void)saveFileAssetRecordsWithDictionary:(id)a3 mirror:(BOOL)a4 onZone:(id)a5 activity:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  serialQueue = self->_serialQueue;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10009924C;
  v21[3] = &unk_1005065D0;
  id v24 = v14;
  id v25 = v15;
  BOOL v26 = a4;
  void v21[4] = self;
  id v22 = v13;
  id v23 = v12;
  id v17 = v14;
  id v18 = v12;
  id v19 = v13;
  id v20 = v15;
  dispatch_async(serialQueue, v21);
}

- (void)saveFileAssetRecordsWithDictionary:(id)a3 mirror:(BOOL)a4 onZone:(id)a5 completion:(id)a6
{
}

- (void)saveKeyValueRecordsWithDictionary:(id)a3 mirror:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v19 = "-[ADCloudKitManager saveKeyValueRecordsWithDictionary:mirror:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  serialQueue = self->_serialQueue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100099B28;
  v14[3] = &unk_10050C840;
  id v15 = v8;
  id v16 = v9;
  BOOL v17 = a4;
  v14[4] = self;
  id v12 = v8;
  id v13 = v9;
  dispatch_async(serialQueue, v14);
}

- (void)_saveCloudSyncEnabledRecord:(BOOL)a3 mirror:(BOOL)a4 qualityOfService:(int64_t)a5 completion:(id)a6
{
  BOOL v7 = a4;
  BOOL v8 = a3;
  id v10 = a6;
  unsigned int v11 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    CFStringRef v12 = @"NO";
    if (v7) {
      CFStringRef v12 = @"YES";
    }
    *(_DWORD *)buf = 136315394;
    v36 = "-[ADCloudKitManager _saveCloudSyncEnabledRecord:mirror:qualityOfService:completion:]";
    __int16 v37 = 2112;
    CFStringRef v38 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s mirrored : (%@)", buf, 0x16u);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (v7)
  {
    id v13 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v36 = "-[ADCloudKitManager _saveCloudSyncEnabledRecord:mirror:qualityOfService:completion:]";
      _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%s mirrored", buf, 0xCu);
    }
    id v14 = [(ADCloudKitMirroredContainer *)self->_mirroredContainer accountStatusRecordZoneInfo];
    id v15 = [v14 zone];
    id v16 = [v15 zoneID];
  }
  else
  {
    id v14 = [(ADCloudKitRecordZoneInfo *)self->_accountStatusRecordZoneInfo zone];
    id v16 = [v14 zoneID];
  }

  if (v16)
  {
    int64_t v29 = a5;
    id v17 = [objc_alloc((Class)CKRecordID) initWithRecordName:@"SyncEnabled" zoneID:v16];
    id v18 = [(ADCloudKitRecordZoneInfo *)self->_accountStatusRecordZoneInfo dataStore];
    id v19 = [v18 supportedRecordTypes];
    id v20 = [v19 firstObject];

    id v21 = [objc_alloc((Class)CKRecord) initWithRecordType:v20 recordID:v17];
    id v22 = [v21 encryptedValuesByKey];
    id v23 = +[NSNumber numberWithUnsignedInteger:1];
    [v22 setObject:v23 forKey:@"version"];

    id v24 = [v21 encryptedValuesByKey];
    [v24 setObject:@"SyncEnabled" forKey:@"key"];

    id v25 = +[NSNumber numberWithBool:v8];
    objc_msgSend(v21, "_ad_setData:", v25);

    if (v7)
    {
      BOOL v26 = [(ADCloudKitMirroredContainer *)self->_mirroredContainer container];
    }
    else
    {
      BOOL v26 = self->_primaryContainer;
    }
    unint64_t v27 = v26;
    id v34 = v21;
    double v28 = +[NSArray arrayWithObjects:&v34 count:1];
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_10009A5BC;
    v30[3] = &unk_1005005F8;
    BOOL v33 = v7;
    int64_t v32 = v29;
    v30[4] = self;
    id v31 = v10;
    sub_10010B6C8(v28, 0, v29, v27, 1, 0, v30);

    goto LABEL_17;
  }
  if (v10)
  {
    id v17 = +[AFError errorWithCode:4020];
    (*((void (**)(id, id, void))v10 + 2))(v10, v17, 0);
LABEL_17:
  }
}

- (void)saveCloudSyncEnabledRecord:(BOOL)a3 mirror:(BOOL)a4 completion:(id)a5
{
  id v8 = a5;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009A980;
  block[3] = &unk_10050A028;
  BOOL v13 = a3;
  BOOL v14 = a4;
  block[4] = self;
  id v12 = v8;
  id v10 = v8;
  dispatch_async(serialQueue, block);
}

- (id)_createRecordsWithDictionary:(id)a3 forZoneInfo:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (![v5 count])
  {
    BOOL v13 = 0;
    goto LABEL_10;
  }
  BOOL v7 = [v6 zone];
  id v8 = [v7 zoneID];

  if (v8)
  {
    id v9 = [v6 rateLimitTimer];

    if (!v9)
    {
      BOOL v13 = sub_10010B238(v5, v8);
      goto LABEL_9;
    }
    id v10 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      unsigned int v11 = v10;
      id v12 = [v6 zoneName];
      int v15 = 136315394;
      id v16 = "-[ADCloudKitManager _createRecordsWithDictionary:forZoneInfo:]";
      __int16 v17 = 2112;
      id v18 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s Unable to save records for zone because zone is rate limited: (%@)", (uint8_t *)&v15, 0x16u);
    }
  }
  BOOL v13 = 0;
LABEL_9:

LABEL_10:
  return v13;
}

- (id)_createFileAssetRecordWithDictionary:(id)a3 zone:(id)a4 version:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if ([v8 count])
  {
    objc_opt_class();
    id v10 = [v8 objectForKey:@"fileName"];
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v10 length])
    {
      unsigned int v11 = [v8 objectForKey:@"fileCompressionType"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v12 = [v8 objectForKey:@"fileAssetSize"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          BOOL v13 = [v8 objectForKey:@"fileAsset"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            BOOL v14 = [v8 objectForKey:@"languages"];
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && [v14 count])
            {
              id v31 = v13;
              int64_t v32 = v12;
              long long v36 = 0u;
              long long v37 = 0u;
              long long v34 = 0u;
              long long v35 = 0u;
              id v30 = v14;
              id obj = v14;
              int v15 = (char *)[obj countByEnumeratingWithState:&v34 objects:v38 count:16];
              if (v15)
              {
                id v16 = v15;
                uint64_t v17 = *(void *)v35;
                while (2)
                {
                  for (i = 0; i != v16; ++i)
                  {
                    if (*(void *)v35 != v17) {
                      objc_enumerationMutation(obj);
                    }
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                    {
                      id v21 = 0;
                      id v23 = obj;
                      goto LABEL_30;
                    }
                  }
                  id v16 = (char *)[obj countByEnumeratingWithState:&v34 objects:v38 count:16];
                  if (v16) {
                    continue;
                  }
                  break;
                }
              }

              id v19 = [v8 objectForKey:@"productType"];
              if (objc_opt_isKindOfClass())
              {
                int64_t v29 = v19;
                id v20 = [v19 length];
                BOOL v13 = v31;
                id v12 = v32;
                if (v20)
                {
                  double v28 = [v8 objectForKey:@"buildVersion"];
                  BOOL v14 = v30;
                  if ((objc_opt_isKindOfClass() & 1) != 0 && [v28 length])
                  {
                    id v26 = [objc_alloc((Class)CKRecordID) initWithRecordName:v10 zoneID:v9];
                    id v21 = [objc_alloc((Class)CKRecord) initWithRecordType:@"AssistantVoiceTriggerFileAssetRecord" recordID:v26];
                    unint64_t v27 = [v21 encryptedValuesByKey];
                    id v22 = +[NSNumber numberWithUnsignedInteger:a5];
                    [v27 setObject:v22 forKey:@"version"];

                    [v27 setObject:v10 forKey:@"fileName"];
                    [v27 setObject:v11 forKey:@"fileCompressionType"];
                    [v27 setObject:v32 forKey:@"fileAssetSize"];
                    [v27 setObject:obj forKey:@"languages"];
                    id v23 = v29;
                    [v27 setObject:v29 forKey:@"productType"];
                    id v24 = v28;
                    [v27 setObject:v28 forKey:@"buildVersion"];
                    [v21 setObject:v31 forKey:@"fileAsset"];
                  }
                  else
                  {
                    id v21 = 0;
                    id v24 = v28;
                    id v23 = v29;
                  }
                }
                else
                {
                  id v21 = 0;
                  id v23 = v29;
                  BOOL v14 = v30;
                }
              }
              else
              {
                id v21 = 0;
                id v23 = v19;
LABEL_30:
                BOOL v13 = v31;
                id v12 = v32;
                BOOL v14 = v30;
              }
            }
            else
            {
              id v21 = 0;
            }
          }
          else
          {
            id v21 = 0;
          }
        }
        else
        {
          id v21 = 0;
        }
      }
      else
      {
        id v21 = 0;
      }
    }
    else
    {
      id v21 = 0;
    }
  }
  else
  {
    id v21 = 0;
  }

  return v21;
}

- (id)_createKeyValueRecordsWithDictionary:(id)a3 mirror:(BOOL)a4
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (![v6 count])
  {
    id v9 = 0;
    goto LABEL_15;
  }
  if (a4)
  {
    BOOL v7 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      int v18 = 136315138;
      id v19 = "-[ADCloudKitManager _createKeyValueRecordsWithDictionary:mirror:]";
      _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%s mirrored", (uint8_t *)&v18, 0xCu);
    }
    id v8 = [(ADCloudKitMirroredContainer *)self->_mirroredContainer keyValueRecordZoneInfo];
  }
  else
  {
    id v8 = self->_keyValueRecordZoneInfo;
  }
  id v10 = v8;
  unsigned int v11 = [(ADCloudKitRecordZoneInfo *)v8 zone];
  id v12 = [v11 zoneID];

  if (v12)
  {
    BOOL v13 = [(ADCloudKitRecordZoneInfo *)v10 rateLimitTimer];

    if (!v13)
    {
      id v9 = sub_10010B238(v6, v12);
      goto LABEL_14;
    }
    BOOL v14 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v15 = v14;
      id v16 = [(ADCloudKitRecordZoneInfo *)v10 zoneName];
      int v18 = 136315394;
      id v19 = "-[ADCloudKitManager _createKeyValueRecordsWithDictionary:mirror:]";
      __int16 v20 = 2112;
      id v21 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s Unable to save records for zone because zone is rate limited: (%@)", (uint8_t *)&v18, 0x16u);
    }
  }
  id v9 = 0;
LABEL_14:

LABEL_15:
  return v9;
}

- (void)_synchronizeVoiceTriggerData
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  BOOL v3 = [(ADCloudKitRecordZoneInfo *)self->_multiUserRecordZoneInfo dataStore];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10009B234;
  v4[3] = &unk_10050B918;
  v4[4] = self;
  [v3 synchronizeWithCompletion:v4];
}

- (void)_cancelVoiceTriggerSyncTimer
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  BOOL v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    BOOL v7 = "-[ADCloudKitManager _cancelVoiceTriggerSyncTimer]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v6, 0xCu);
  }
  voiceTriggerSyncTimer = self->_voiceTriggerSyncTimer;
  if (voiceTriggerSyncTimer)
  {
    dispatch_source_cancel(voiceTriggerSyncTimer);
    id v5 = self->_voiceTriggerSyncTimer;
    self->_voiceTriggerSyncTimer = 0;
  }
}

- (void)_startVoiceTriggerSyncTimerWithInterval:(double)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    BOOL v14 = "-[ADCloudKitManager _startVoiceTriggerSyncTimerWithInterval:]";
    __int16 v15 = 2048;
    double v16 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Synching Voice Trigger data in %f seconds", buf, 0x16u);
  }
  [(ADCloudKitManager *)self _cancelVoiceTriggerSyncTimer];
  if ([(ADCloudKitManager *)self cloudSyncEnabled])
  {
    int v6 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_serialQueue);
    voiceTriggerSyncTimer = self->_voiceTriggerSyncTimer;
    self->_voiceTriggerSyncTimer = v6;

    id v8 = self->_voiceTriggerSyncTimer;
    dispatch_time_t v9 = dispatch_time(0, (unint64_t)(a3 * 1000000000.0));
    dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    id v10 = self->_voiceTriggerSyncTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10009B690;
    handler[3] = &unk_10050E138;
    handler[4] = self;
    dispatch_source_set_event_handler(v10, handler);
    dispatch_resume((dispatch_object_t)self->_voiceTriggerSyncTimer);
  }
  else
  {
    unsigned int v11 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      BOOL v14 = "-[ADCloudKitManager _startVoiceTriggerSyncTimerWithInterval:]";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s iCloud sync is disabled. Voice Trigger setup timer cancelled", buf, 0xCu);
    }
  }
}

- (void)_setupVoiceTriggerSyncTimer
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  BOOL v3 = +[ADPreferences sharedPreferences];
  unsigned __int8 v4 = [v3 multiUserSharedDataNeedsSync];

  double v5 = 30.0;
  if ((v4 & 1) == 0)
  {
    int v6 = +[ADPreferences sharedPreferences];
    unsigned __int8 v7 = [v6 voiceTriggerNeedsDataSync];

    if ((v7 & 1) == 0)
    {
      if (AFIsMultiUserCompanion())
      {
        id v8 = +[ADPreferences sharedPreferences];
        unsigned int v9 = [v8 mirroredMultiUserSharedDataNeedsSync];

        if (v9) {
          double v5 = 30.0;
        }
        else {
          double v5 = 86400.0;
        }
      }
      else
      {
        double v5 = 86400.0;
      }
    }
  }
  [(ADCloudKitManager *)self _startVoiceTriggerSyncTimerWithInterval:v5];
}

- (void)_homeInfoDidChange:(id)a3
{
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009B8B8;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(serialQueue, block);
}

- (void)_voiceProfileFullDownloadTriggered:(id)a3
{
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009B9F4;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(serialQueue, block);
}

- (BOOL)_forceVoiceProfileDownloadForiCloudAltDSID:(id)a3 retryCount:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  unsigned int v9 = (void (**)(id, void *))a5;
  id v10 = AFSiriLogContextDaemon;
  if (!v8)
  {
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      double v28 = "-[ADCloudKitManager _forceVoiceProfileDownloadForiCloudAltDSID:retryCount:completion:]";
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s Error: no iCloudAltDSID", buf, 0xCu);
      if (v9) {
        goto LABEL_9;
      }
    }
    else if (v9)
    {
LABEL_9:
      __int16 v15 = +[AFError errorWithCode:31];
      v9[2](v9, v15);
      goto LABEL_17;
    }
    BOOL v18 = 0;
    goto LABEL_19;
  }
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    containerDict = self->_containerDict;
    id v12 = v10;
    BOOL v13 = [(NSMutableDictionary *)containerDict allKeys];
    *(_DWORD *)buf = 136315651;
    double v28 = "-[ADCloudKitManager _forceVoiceProfileDownloadForiCloudAltDSID:retryCount:completion:]";
    __int16 v29 = 2113;
    id v30 = v8;
    __int16 v31 = 2112;
    int64_t v32 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s Choosing container for %{private}@ from %@", buf, 0x20u);
  }
  uint64_t v14 = [(ADCloudKitManager *)self _trackedCKContainerForiCloudAltDSID:v8];
  if (!v14)
  {
    id v19 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      double v28 = "-[ADCloudKitManager _forceVoiceProfileDownloadForiCloudAltDSID:retryCount:completion:]";
      __int16 v29 = 2112;
      id v30 = v8;
      _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s No container found for %@", buf, 0x16u);
      if (!v9) {
        goto LABEL_13;
      }
    }
    else if (!v9)
    {
LABEL_13:
      __int16 v15 = 0;
      goto LABEL_17;
    }
    __int16 v20 = +[AFError errorWithCode:4022];
    v9[2](v9, v20);

    goto LABEL_13;
  }
  __int16 v15 = (void *)v14;
  double v16 = [(ADCloudKitRecordZoneInfo *)self->_multiUserRecordZoneInfo zoneName];
  unsigned int v17 = [(ADCloudKitManager *)self _isCloudSyncEnabledForZone:v16];

  if (!v17)
  {
    id v21 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      multiUserRecordZoneInfo = self->_multiUserRecordZoneInfo;
      id v25 = v21;
      id v26 = [(ADCloudKitRecordZoneInfo *)multiUserRecordZoneInfo zoneName];
      *(_DWORD *)buf = 136315394;
      double v28 = "-[ADCloudKitManager _forceVoiceProfileDownloadForiCloudAltDSID:retryCount:completion:]";
      __int16 v29 = 2112;
      id v30 = v26;
      _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%s Cloud sync is not enabled for zone: %@", buf, 0x16u);

      if (!v9) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }
    if (v9)
    {
LABEL_16:
      id v22 = +[AFError errorWithCode:4020];
      v9[2](v9, v22);
    }
LABEL_17:
    BOOL v18 = 0;
    goto LABEL_18;
  }
  [(ADCloudKitManager *)self _fetchChangesWithZoneInfo:self->_multiUserRecordZoneInfo retryCount:a4 useSharedDatabase:0 activity:0 container:v15 mirror:0 completion:v9];
  BOOL v18 = 1;
LABEL_18:

LABEL_19:
  return v18;
}

- (void)_forceVoiceProfileDownloadOfAllUsers:(int64_t)a3
{
  if (a3 >= 4)
  {
    double v5 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v14 = "-[ADCloudKitManager _forceVoiceProfileDownloadOfAllUsers:]";
      __int16 v15 = 2048;
      int64_t v16 = a3;
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%s Voice Trigger PHS full download failed after %lu retries.", buf, 0x16u);
    }
  }
  multiUserRecordZoneInfo = self->_multiUserRecordZoneInfo;
  if (!multiUserRecordZoneInfo) {
    goto LABEL_12;
  }
  if (self->_multiUserSharedZoneReady)
  {
    [(ADCloudKitRecordZoneInfo *)multiUserRecordZoneInfo setServerChangeToken:0];
    unsigned __int8 v7 = [(ADCloudKitRecordZoneInfo *)self->_multiUserRecordZoneInfo zoneName];
    unsigned int v8 = [(ADCloudKitManager *)self _isCloudSyncEnabledForZone:v7];

    if (v8) {
      [(ADCloudKitManager *)self _fetchChangesWithZoneInfo:self->_multiUserRecordZoneInfo useSharedDatabase:0];
    }
    if (AFSupportsMultiUser()) {
      [(ADCloudKitShareeOperations *)self->_shareeOperations fetchSharedZones];
    }
  }
  if (!self->_multiUserRecordZoneInfo || !self->_multiUserSharedZoneReady)
  {
LABEL_12:
    unsigned int v9 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v14 = "-[ADCloudKitManager _forceVoiceProfileDownloadOfAllUsers:]";
      __int16 v15 = 2048;
      int64_t v16 = a3;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s MultiUserInfo not ready. Rescheduling. Retry count = %lu", buf, 0x16u);
    }
    dispatch_time_t v10 = dispatch_time(0, 60000000000);
    serialQueue = self->_serialQueue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10009BF8C;
    v12[3] = &unk_10050D8C0;
    v12[4] = self;
    v12[5] = a3;
    dispatch_after(v10, serialQueue, v12);
  }
}

- (void)_voiceTriggerPHSProfileDidChange
{
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009C024;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(serialQueue, block);
}

- (void)_voiceTriggerEnabledDidChange
{
  unsigned __int8 v3 = sub_1001FD6CC();
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10009C2D4;
  v5[3] = &unk_10050CD50;
  v5[4] = self;
  unsigned __int8 v6 = v3;
  dispatch_async(serialQueue, v5);
}

- (void)_triggerMultiUserSharingPostBuddyOrCloudSyncChange
{
  id v2 = +[ADHomeInfoManager sharedInfoManager];
  [v2 restartSharing];
}

- (void)_triggerVoiceProfileUploadPostBuddyOrCloudSyncChange
{
  id v2 = +[ADPreferences sharedPreferences];
  [v2 setMultiUserSharedDataNeedsSync:1];
  [v2 setVoiceTriggerNeedsDataSync:1];
  [v2 synchronize];
}

- (void)_setupMultiUserSharedRecordZone
{
  unsigned __int8 v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    unsigned int v17 = "-[ADCloudKitManager _setupMultiUserSharedRecordZone]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  multiUserRecordZoneInfo = self->_multiUserRecordZoneInfo;
  if (multiUserRecordZoneInfo)
  {
    double v5 = [(ADCloudKitRecordZoneInfo *)multiUserRecordZoneInfo zoneName];
    unsigned int v6 = [(ADCloudKitManager *)self _isCloudSyncEnabledForZone:v5];

    if (v6)
    {
      unsigned __int8 v7 = [(ADCloudKitRecordZoneInfo *)self->_multiUserRecordZoneInfo zone];

      unsigned int v8 = self->_multiUserRecordZoneInfo;
      if (!v7)
      {
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = sub_10009C788;
        v15[3] = &unk_10050E138;
        v15[4] = self;
        [(ADCloudKitManager *)self _setupRecordZoneWithZoneInfo:v8 retryInterval:v15 completion:120.0];
LABEL_21:
        [(ADCloudKitManager *)self setupSharedZoneUpdaterForOwner];
        [(ADCloudKitManager *)self _setupSharedZoneView];
        return;
      }
      unsigned int v9 = [(ADCloudKitRecordZoneInfo *)self->_multiUserRecordZoneInfo subscriptionList];
      if ([v9 count])
      {
        unsigned __int8 v10 = [(ADCloudKitRecordZoneInfo *)self->_multiUserRecordZoneInfo hasSetUpRecordZoneSubscription];

        if (v10)
        {
          unsigned int v11 = [(ADCloudKitRecordZoneInfo *)self->_multiUserRecordZoneInfo serverChangeToken];

          if (!v11) {
            [(ADCloudKitManager *)self _fetchChangesWithZoneInfo:self->_multiUserRecordZoneInfo useSharedDatabase:0];
          }
          goto LABEL_15;
        }
      }
      else
      {
      }
      [(ADCloudKitManager *)self _setupRecordZoneSubscriptionWithZoneInfo:self->_multiUserRecordZoneInfo retryInterval:0 container:120.0];
LABEL_15:
      if (AFIsMultiUserCompanion())
      {
        BOOL v13 = +[ADPreferences sharedPreferences];
        unsigned int v14 = [v13 multiUserVoiceIdentification];
      }
      else
      {
        unsigned int v14 = 0;
      }
      if (self->_voiceTriggerEnabled || v14) {
        [(ADCloudKitManager *)self _setupVoiceTriggerSyncTimer];
      }
      goto LABEL_21;
    }
  }
  id v12 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    unsigned int v17 = "-[ADCloudKitManager _setupMultiUserSharedRecordZone]";
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s CloudSync disabled", buf, 0xCu);
  }
}

- (void)_setupMultiUserSharedRecordZoneIfHomeIsReady
{
  unsigned __int8 v3 = +[ADHomeInfoManager sharedInfoManager];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10009C8D0;
  v4[3] = &unk_1005005D0;
  v4[4] = self;
  [v3 getCurrentHomeMemberIds:v4];
}

- (void)_setupKeyValueRecordZone
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  keyValueRecordZoneInfo = self->_keyValueRecordZoneInfo;
  if (!keyValueRecordZoneInfo) {
    return;
  }
  unsigned __int8 v4 = [(ADCloudKitRecordZoneInfo *)keyValueRecordZoneInfo zoneName];
  unsigned int v5 = [(ADCloudKitManager *)self _isCloudSyncEnabledForZone:v4];

  if (!v5) {
    return;
  }
  unsigned int v6 = [(ADCloudKitRecordZoneInfo *)self->_keyValueRecordZoneInfo zone];

  unsigned __int8 v7 = self->_keyValueRecordZoneInfo;
  if (v6)
  {
    unsigned int v8 = [(ADCloudKitRecordZoneInfo *)self->_keyValueRecordZoneInfo subscriptionList];
    if ([v8 count])
    {
      unsigned __int8 v9 = [(ADCloudKitRecordZoneInfo *)self->_keyValueRecordZoneInfo hasSetUpRecordZoneSubscription];

      if (v9)
      {
        unsigned __int8 v10 = [(ADCloudKitRecordZoneInfo *)self->_keyValueRecordZoneInfo serverChangeToken];

        if (!v10)
        {
          id v12 = self->_keyValueRecordZoneInfo;
          [(ADCloudKitManager *)self _fetchChangesWithZoneInfo:v12 useSharedDatabase:0];
        }
        return;
      }
    }
    else
    {
    }
    unsigned int v11 = self->_keyValueRecordZoneInfo;
    [(ADCloudKitManager *)self _setupRecordZoneSubscriptionWithZoneInfo:v11 retryInterval:0 container:120.0];
  }
  else
  {
    [(ADCloudKitManager *)self _setupRecordZoneWithZoneInfo:v7 retryInterval:0 completion:120.0];
  }
}

- (void)_setupAccountStatusRecordZone
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  accountStatusRecordZoneInfo = self->_accountStatusRecordZoneInfo;
  if (!accountStatusRecordZoneInfo) {
    return;
  }
  unsigned __int8 v4 = [(ADCloudKitRecordZoneInfo *)accountStatusRecordZoneInfo zoneName];
  unsigned int v5 = [(ADCloudKitManager *)self _isCloudSyncEnabledForZone:v4];

  if (!v5) {
    return;
  }
  unsigned int v6 = [(ADCloudKitRecordZoneInfo *)self->_accountStatusRecordZoneInfo zone];

  unsigned __int8 v7 = self->_accountStatusRecordZoneInfo;
  if (v6)
  {
    unsigned int v8 = [(ADCloudKitRecordZoneInfo *)self->_accountStatusRecordZoneInfo subscriptionList];
    if ([v8 count])
    {
      unsigned __int8 v9 = [(ADCloudKitRecordZoneInfo *)self->_accountStatusRecordZoneInfo hasSetUpRecordZoneSubscription];

      if (v9)
      {
        unsigned __int8 v10 = [(ADCloudKitRecordZoneInfo *)self->_accountStatusRecordZoneInfo serverChangeToken];

        if (!v10)
        {
          id v12 = self->_accountStatusRecordZoneInfo;
          [(ADCloudKitManager *)self _fetchChangesWithZoneInfo:v12 useSharedDatabase:0];
        }
        return;
      }
    }
    else
    {
    }
    unsigned int v11 = self->_accountStatusRecordZoneInfo;
    [(ADCloudKitManager *)self _setupRecordZoneSubscriptionWithZoneInfo:v11 retryInterval:0 container:120.0];
  }
  else
  {
    [(ADCloudKitManager *)self _setupRecordZoneWithZoneInfo:v7 retryInterval:0 completion:120.0];
  }
}

- (void)_prepareZoneForResetWithZoneInfo:(id)a3
{
  unsigned __int8 v3 = [a3 zoneName];
  unsigned int v4 = [v3 isEqualToString:@"com.apple.assistant.multiuser.shared"];

  if (v4)
  {
    id v5 = +[ADPreferences sharedPreferences];
    [v5 setMultiUserSharedDataNeedsSync:1];
    [v5 setPhsAssetManifest:0 onSharedZone:1];
    if (AFIsMultiUserCompanion()) {
      [v5 setMirroredMultiUserSharedDataNeedsSync:1];
    }
    [v5 synchronize];
  }
}

- (void)_setUpMirroredZoneWithZoneInfo:(id)a3
{
  id v4 = a3;
  mirroredContainer = self->_mirroredContainer;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10009CD9C;
  v7[3] = &unk_10050C610;
  id v8 = v4;
  id v6 = v4;
  [(ADCloudKitMirroredContainer *)mirroredContainer resynchronizeMirroredZone:v6 completion:v7];
}

- (void)_setUpZoneWithZoneInfo:(id)a3
{
  id v10 = a3;
  id v4 = [v10 zoneName];
  unsigned int v5 = [v4 isEqualToString:@"com.apple.assistant.backedup"];

  if (v5)
  {
    [(ADCloudKitManager *)self _setupKeyValueRecordZone];
  }
  else
  {
    id v6 = [v10 zoneName];
    unsigned int v7 = [v6 isEqualToString:@"com.apple.assistant.account.status"];

    if (v7)
    {
      [(ADCloudKitManager *)self _setupAccountStatusRecordZone];
    }
    else
    {
      id v8 = [v10 zoneName];
      unsigned int v9 = [v8 isEqualToString:@"com.apple.assistant.multiuser.shared"];

      if (v9) {
        [(ADCloudKitManager *)self _setupMultiUserSharedRecordZone];
      }
    }
  }
}

- (void)_resetZoneWithZoneInfo:(id)a3
{
  id v4 = a3;
  unsigned int v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v16 = 136315138;
    unsigned int v17 = "-[ADCloudKitManager _resetZoneWithZoneInfo:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v16, 0xCu);
  }
  [v4 setZone:0];
  [v4 setSubscriptionList:0];
  [v4 setHasSetUpRecordZoneSubscription:0];
  [v4 setServerChangeToken:0];
  id v6 = [v4 dataStore];
  unsigned __int8 v7 = [v6 dataStoreIsOnSharedDatabase];

  id v8 = [v4 dataStore];
  unsigned __int8 v9 = [v8 isMirroredDataStore];

  if (v9)
  {
    [(ADCloudKitManager *)self _setUpMirroredZoneWithZoneInfo:v4];
  }
  else if (v7)
  {
    id v10 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      int v16 = 136315138;
      unsigned int v17 = "-[ADCloudKitManager _resetZoneWithZoneInfo:]";
      _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%s Resetting shared zone", (uint8_t *)&v16, 0xCu);
    }
    id v11 = objc_alloc((Class)CKRecordZoneID);
    id v12 = [v4 zoneName];
    id v13 = [v11 initWithZoneName:v12 ownerName:CKCurrentUserDefaultName];

    if (v13)
    {
      shareeOperations = self->_shareeOperations;
      __int16 v15 = [v13 ownerName];
      [(ADCloudKitShareeOperations *)shareeOperations deleteShareForUser:v15 markForReinvitation:1 completion:&stru_1005005A8];
    }
  }
  else
  {
    [(ADCloudKitManager *)self _setUpZoneWithZoneInfo:v4];
  }
}

- (void)_initializeZones
{
  [(ADCloudKitRecordZoneInfo *)self->_accountStatusRecordZoneInfo reset];
  [(ADCloudKitRecordZoneInfo *)self->_keyValueRecordZoneInfo reset];
  [(ADCloudKitRecordZoneInfo *)self->_multiUserRecordZoneInfo reset];
  id vtZoneFetchCompletion = self->_vtZoneFetchCompletion;
  self->_id vtZoneFetchCompletion = 0;
}

- (void)_deleteRecordZoneWithZoneID:(id)a3 qualityOfService:(int64_t)a4 completion:(id)a5
{
  id v25 = a3;
  id v7 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v8 = self->_primaryContainer;
  unsigned __int8 v9 = [(ADCloudKitMirroredContainer *)self->_mirroredContainer container];
  group = dispatch_group_create();
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x3032000000;
  v39[3] = sub_100092050;
  v39[4] = sub_100092060;
  id v40 = 0;
  if (v8)
  {
    if (v9) {
      dispatch_group_enter(group);
    }
    id v10 = objc_alloc((Class)CKModifyRecordZonesOperation);
    id v42 = v25;
    id v11 = +[NSArray arrayWithObjects:&v42 count:1];
    id v12 = [v10 initWithRecordZonesToSave:0 recordZoneIDsToDelete:v11];

    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_10009D808;
    v33[3] = &unk_100500560;
    id v13 = v25;
    id v34 = v13;
    long long v37 = v39;
    id v14 = v7;
    id v36 = v14;
    BOOL v38 = v9 != 0;
    __int16 v15 = group;
    long long v35 = v15;
    [v12 setModifyRecordZonesCompletionBlock:v33];
    [v12 setQualityOfService:a4];
    int v16 = [(CKContainer *)v8 privateCloudDatabase];
    [v16 addOperation:v12];

    if (v9)
    {
      dispatch_group_enter(v15);
      id v17 = objc_alloc((Class)CKModifyRecordZonesOperation);
      id v41 = v13;
      BOOL v18 = +[NSArray arrayWithObjects:&v41 count:1];
      id v19 = [v17 initWithRecordZonesToSave:0 recordZoneIDsToDelete:v18];

      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_10009D97C;
      v29[3] = &unk_100500588;
      id v30 = v13;
      int64_t v32 = v39;
      __int16 v20 = v15;
      __int16 v31 = v20;
      [v19 setModifyRecordZonesCompletionBlock:v29];
      [v19 setQualityOfService:a4];
      id v21 = [v9 privateCloudDatabase];
      [v21 addOperation:v19];

      serialQueue = self->_serialQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10009DACC;
      block[3] = &unk_10050CA58;
      id v27 = v14;
      double v28 = v39;
      dispatch_group_notify(v20, serialQueue, block);
    }
    goto LABEL_9;
  }
  if (v7)
  {
    id v12 = +[AFError errorWithCode:4022];
    (*((void (**)(id, id))v7 + 2))(v7, v12);
LABEL_9:
  }
  _Block_object_dispose(v39, 8);
}

- (void)_deleteRecordZoneWithZoneID:(id)a3 completion:(id)a4
{
}

- (void)_deleteRecordZoneWithZoneInfo:(id)a3 qualityOfService:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v10 = [v8 zone];
  id v11 = [v10 zoneID];

  if (!v11)
  {
    id v12 = objc_alloc((Class)CKRecordZoneID);
    id v13 = [v8 zoneName];
    id v11 = [v12 initWithZoneName:v13 ownerName:CKCurrentUserDefaultName];
  }
  id v14 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    __int16 v15 = v14;
    int v16 = [v11 zoneName];
    *(_DWORD *)buf = 136315394;
    id v30 = "-[ADCloudKitManager _deleteRecordZoneWithZoneInfo:qualityOfService:completion:]";
    __int16 v31 = 2112;
    int64_t v32 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s Deleting zone: (%@)", buf, 0x16u);
  }
  id v17 = self->_primaryContainer;
  BOOL v18 = [v8 dataStore];
  unsigned int v19 = [v18 isMirroredDataStore];

  if (v19)
  {
    uint64_t v20 = [(ADCloudKitMirroredContainer *)self->_mirroredContainer container];

    id v17 = (CKContainer *)v20;
  }
  if (v17)
  {
    id v21 = objc_alloc((Class)CKModifyRecordZonesOperation);
    id v28 = v11;
    id v22 = +[NSArray arrayWithObjects:&v28 count:1];
    id v23 = [v21 initWithRecordZonesToSave:0 recordZoneIDsToDelete:v22];

    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10009DE88;
    v25[3] = &unk_10050BF60;
    id v26 = v11;
    id v27 = v9;
    [v23 setModifyRecordZonesCompletionBlock:v25];
    [v23 setQualityOfService:a4];
    id v24 = [(CKContainer *)v17 privateCloudDatabase];
    [v24 addOperation:v23];

LABEL_11:
    goto LABEL_12;
  }
  if (v9)
  {
    id v23 = +[AFError errorWithCode:4022];
    (*((void (**)(id, id))v9 + 2))(v9, v23);
    goto LABEL_11;
  }
LABEL_12:
}

- (void)_deleteRecordZoneWithZoneInfo:(id)a3 completion:(id)a4
{
}

- (void)_createRecordZoneWithID:(id)a3 shared:(BOOL)a4 onMirror:(BOOL)a5 completion:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v12 = [v10 zoneName];
  unsigned __int8 v13 = [(ADCloudKitManager *)self _isCloudSyncEnabledForZone:v12];

  if (v13)
  {
    if (a5)
    {
      id v14 = [(ADCloudKitMirroredContainer *)self->_mirroredContainer container];
    }
    else
    {
      id v14 = self->_primaryContainer;
    }
    BOOL v18 = v14;
    unsigned int v19 = AFSiriLogContextDaemon;
    if (v14)
    {
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        uint64_t v20 = v19;
        id v21 = [v10 zoneName];
        int v22 = 136315394;
        id v23 = "-[ADCloudKitManager _createRecordZoneWithID:shared:onMirror:completion:]";
        __int16 v24 = 2112;
        id v25 = v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%s Creating zone: (%@)", (uint8_t *)&v22, 0x16u);
      }
      sub_100310728(v10, v18, v8, v11);
    }
    else
    {
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        int v22 = 136315138;
        id v23 = "-[ADCloudKitManager _createRecordZoneWithID:shared:onMirror:completion:]";
        _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s No container found", (uint8_t *)&v22, 0xCu);
      }
      BOOL v18 = 0;
    }
    goto LABEL_16;
  }
  __int16 v15 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v16 = v15;
    id v17 = [v10 zoneName];
    int v22 = 136315394;
    id v23 = "-[ADCloudKitManager _createRecordZoneWithID:shared:onMirror:completion:]";
    __int16 v24 = 2112;
    id v25 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s iCloud sync is disabled. Unable to create zone: (%@)", (uint8_t *)&v22, 0x16u);
  }
  if (v11)
  {
    BOOL v18 = +[AFError errorWithCode:4014];
    (*((void (**)(id, void *, void))v11 + 2))(v11, v18, 0);
LABEL_16:
  }
}

- (void)_setupRecordZoneWithZoneInfo:(id)a3 retryInterval:(double)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  [(ADCloudKitRetryManager *)self->_ckRetryManager cancelRecordZoneSetupTimerForZoneInfo:v8];
  id v10 = [v8 zoneName];
  BOOL v11 = [(ADCloudKitManager *)self _zoneIsShareable:v10];

  id v12 = [v8 dataStore];
  id v13 = [v12 isMirroredDataStore];

  id v14 = objc_alloc((Class)CKRecordZoneID);
  __int16 v15 = [v8 zoneName];
  id v16 = [v14 initWithZoneName:v15 ownerName:CKCurrentUserDefaultName];

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10009E3F0;
  v19[3] = &unk_100500538;
  void v19[4] = self;
  id v20 = v8;
  id v21 = v9;
  char v23 = (char)v13;
  double v22 = a4;
  id v17 = v9;
  id v18 = v8;
  [(ADCloudKitManager *)self _createRecordZoneWithID:v16 shared:v11 onMirror:v13 completion:v19];
}

- (id)_manateeRecordZoneInfoForName:(id)a3
{
  return 0;
}

- (BOOL)_isCloudSyncEnabledForZone:(id)a3 accountInfo:(id)a4
{
  id v4 = self;
  serialQueue = self->_serialQueue;
  id v6 = a3;
  dispatch_assert_queue_V2(serialQueue);
  LOBYTE(v4) = [(ADCloudKitManager *)v4 _isCloudSyncEnabledForZone:v6];

  return (char)v4;
}

- (BOOL)_isCloudSyncEnabledForZone:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (([(CKAccountInfo *)self->_primaryAccountInfo supportsDeviceToDeviceEncryption] & 1) == 0&& !self->_usingNonManateeIdentity)
  {
    unsigned int v5 = AFSiriLogContextDaemon;
    BOOL v4 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
    if (!v4) {
      return v4;
    }
    int v8 = 136315138;
    id v9 = "-[ADCloudKitManager _isCloudSyncEnabledForZone:]";
    id v6 = "%s Manatee is disabled for primary account";
    goto LABEL_9;
  }
  if (!self->_isPastBuddy)
  {
    unsigned int v5 = AFSiriLogContextDaemon;
    BOOL v4 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
    if (!v4) {
      return v4;
    }
    int v8 = 136315138;
    id v9 = "-[ADCloudKitManager _isCloudSyncEnabledForZone:]";
    id v6 = "%s Still in Buddy";
LABEL_9:
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, v6, (uint8_t *)&v8, 0xCu);
    LOBYTE(v4) = 0;
    return v4;
  }
  LOBYTE(v4) = self->_cloudSyncEnabled;
  return v4;
}

- (void)_resetZoneFetchCompletionBlock:(id)a3
{
  BOOL v4 = [a3 zoneName];
  unsigned int v5 = [v4 isEqualToString:@"com.apple.assistant.multiuser.shared"];

  if (v5)
  {
    id v6 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315138;
      id v9 = "-[ADCloudKitManager _resetZoneFetchCompletionBlock:]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s Clearing zone fetch completion block", (uint8_t *)&v8, 0xCu);
    }
    id vtZoneFetchCompletion = self->_vtZoneFetchCompletion;
    self->_id vtZoneFetchCompletion = 0;
  }
}

- (void)_executeZoneFetchCompletionBlock:(id)a3 zoneInfo:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(id, id))a5;
  id v10 = [a4 zoneName];
  if ([v10 isEqualToString:@"com.apple.assistant.multiuser.shared"])
  {
    id vtZoneFetchCompletion = self->_vtZoneFetchCompletion;

    if (vtZoneFetchCompletion)
    {
      id v12 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        int v14 = 136315394;
        __int16 v15 = "-[ADCloudKitManager _executeZoneFetchCompletionBlock:zoneInfo:completion:]";
        __int16 v16 = 2112;
        id v17 = v8;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s error (%@)", (uint8_t *)&v14, 0x16u);
      }
      (*((void (**)(void))self->_vtZoneFetchCompletion + 2))();
      id v13 = self->_vtZoneFetchCompletion;
      self->_id vtZoneFetchCompletion = 0;
    }
  }
  else
  {
  }
  if (v9) {
    v9[2](v9, v8);
  }
}

- (void)_fetchChangesWithZoneInfo:(id)a3 retryCount:(unint64_t)a4 useSharedDatabase:(BOOL)a5 activity:(id)a6 container:(id)a7 mirror:(BOOL)a8 completion:(id)a9
{
  BOOL v9 = a8;
  BOOL v12 = a5;
  id v15 = a3;
  id v46 = a6;
  id v16 = a7;
  id v47 = a9;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v17 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    CFStringRef v43 = @"private";
    if (v12) {
      CFStringRef v43 = @"shared";
    }
    *(_DWORD *)v69 = 136315394;
    *(void *)&v69[4] = "-[ADCloudKitManager _fetchChangesWithZoneInfo:retryCount:useSharedDatabase:activity:container:m"
                         "irror:completion:]";
    *(_WORD *)&v69[12] = 2112;
    *(void *)&v69[14] = v43;
    _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "%s (%@)", v69, 0x16u);
  }
  *(void *)v69 = 0;
  *(void *)&v69[8] = v69;
  *(void *)&v69[16] = 0x3032000000;
  v70 = sub_100092050;
  v71 = sub_100092060;
  id v72 = 0;
  id v18 = v16;
  unsigned int v19 = v18;
  if (v9)
  {
    unsigned int v19 = [(ADCloudKitMirroredContainer *)self->_mirroredContainer container];
  }
  if (v12
    || self->_multiUserSharedZoneReady
    || ([v15 zoneName],
        id v20 = objc_claimAutoreleasedReturnValue(),
        unsigned int v21 = [v20 isEqualToString:@"com.apple.assistant.multiuser.shared"],
        v20,
        !v21))
  {
    if (a4 >= 2)
    {
      __int16 v24 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        id v25 = [v15 zoneName];
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "-[ADCloudKitManager _fetchChangesWithZoneInfo:retryCount:useSharedDatabase:activity:contain"
                             "er:mirror:completion:]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v25;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%s Exceeded fetch retry attempts for zone: (%@)", buf, 0x16u);
      }
LABEL_13:

      id v26 = +[AFError errorWithCode:4011];
      [(ADCloudKitManager *)self _executeZoneFetchCompletionBlock:v26 zoneInfo:v15 completion:v47];

      goto LABEL_39;
    }
    id v27 = [v15 zone];
    BOOL v28 = v27 == 0;

    if (v28)
    {
      __int16 v24 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        id v40 = [v15 zoneName];
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "-[ADCloudKitManager _fetchChangesWithZoneInfo:retryCount:useSharedDatabase:activity:contain"
                             "er:mirror:completion:]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v40;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%s Unable to fetch records for zone because zone is disabled: (%@)", buf, 0x16u);
      }
      goto LABEL_13;
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    char v68 = 0;
    __int16 v29 = [v15 zoneName];
    int v30 = [(ADCloudKitManager *)self _isCloudSyncEnabledForZone:v29];

    char v68 = v30;
    if (v19)
    {
      __int16 v31 = [v19 options];
      int64_t v32 = [v31 accountOverrideInfo];

      if (v32)
      {
        BOOL v33 = [v32 accountID];
        BOOL v34 = v33 == 0;

        if (!v34)
        {
          containerDict = self->_containerDict;
          v57[0] = _NSConcreteStackBlock;
          v57[1] = 3221225472;
          v57[2] = sub_10009F8E8;
          v57[3] = &unk_100500450;
          id v58 = v32;
          v59 = self;
          v61 = v69;
          v62 = buf;
          id v60 = v15;
          [(NSMutableDictionary *)containerDict enumerateKeysAndObjectsUsingBlock:v57];
        }
      }
    }
    if (*(unsigned char *)(*(void *)&buf[8] + 24))
    {
      id v36 = [v15 rateLimitTimer];

      if (!v36)
      {
        if ([v15 fetchInProgress])
        {
          id v42 = AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v63 = 136315394;
            v64 = "-[ADCloudKitManager _fetchChangesWithZoneInfo:retryCount:useSharedDatabase:activity:container:mirror:completion:]";
            __int16 v65 = 2112;
            v66 = v19;
            _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "%s Unable to start a fetch when a fetch is already in progress for container %@", v63, 0x16u);
          }
        }
        else
        {
          [v15 setFetchInProgress:1];
          v44 = [v15 zone];
          v45 = [v15 serverChangeToken];
          v48[0] = _NSConcreteStackBlock;
          v48[1] = 3221225472;
          v48[2] = sub_10009FA30;
          v48[3] = &unk_1005004E8;
          v48[4] = self;
          id v49 = v15;
          v53 = buf;
          BOOL v56 = v12;
          id v52 = v47;
          unint64_t v55 = a4;
          id v50 = v46;
          id v51 = v19;
          v54 = v69;
          [(ADCloudKitManager *)self _fetchChangesFromZone:v44 serverChangeToken:v45 useSharedDatabase:v12 activity:v50 container:v51 mirror:v9 completion:v48];
        }
        goto LABEL_38;
      }
      long long v37 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        BOOL v38 = [v15 zoneName];
        *(_DWORD *)v63 = 136315394;
        v64 = "-[ADCloudKitManager _fetchChangesWithZoneInfo:retryCount:useSharedDatabase:activity:container:mirror:completion:]";
        __int16 v65 = 2112;
        v66 = v38;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "%s Unable to fetch records for zone because zone is rate limited: (%@)", v63, 0x16u);
      }
    }
    else
    {
      long long v37 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        id v41 = [v15 zoneName];
        *(_DWORD *)v63 = 136315394;
        v64 = "-[ADCloudKitManager _fetchChangesWithZoneInfo:retryCount:useSharedDatabase:activity:container:mirror:completion:]";
        __int16 v65 = 2112;
        v66 = v41;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "%s iCloud sync is disabled. Unable to fetch records for zone: (%@)", v63, 0x16u);
      }
    }

    id v39 = +[AFError errorWithCode:4011];
    [(ADCloudKitManager *)self _executeZoneFetchCompletionBlock:v39 zoneInfo:v15 completion:v47];

LABEL_38:
    _Block_object_dispose(buf, 8);
    goto LABEL_39;
  }
  double v22 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ADCloudKitManager _fetchChangesWithZoneInfo:retryCount:useSharedDatabase:activity:container:m"
                         "irror:completion:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v19;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "%s Not ready yet on container %@", buf, 0x16u);
  }
  char v23 = +[AFError errorWithCode:4011];
  [(ADCloudKitManager *)self _executeZoneFetchCompletionBlock:v23 zoneInfo:v15 completion:v47];

LABEL_39:
  _Block_object_dispose(v69, 8);
}

- (void)_fetchChangesWithZoneInfo:(id)a3 retryCount:(unint64_t)a4 useSharedDatabase:(BOOL)a5 activity:(id)a6 container:(id)a7 mirror:(BOOL)a8
{
}

- (void)_fetchChangesWithZoneInfo:(id)a3 useSharedDatabase:(BOOL)a4 activity:(id)a5 mirror:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a4;
  serialQueue = self->_serialQueue;
  id v11 = a5;
  id v12 = a3;
  dispatch_assert_queue_V2(serialQueue);
  [(ADCloudKitManager *)self _fetchChangesWithZoneInfo:v12 retryCount:0 useSharedDatabase:v7 activity:v11 container:0 mirror:v6];
}

- (void)_fetchChangesWithZoneInfo:(id)a3 useSharedDatabase:(BOOL)a4 mirror:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  serialQueue = self->_serialQueue;
  id v9 = a3;
  dispatch_assert_queue_V2(serialQueue);
  [(ADCloudKitManager *)self _fetchChangesWithZoneInfo:v9 useSharedDatabase:v6 activity:0 mirror:v5];
}

- (void)_fetchChangesWithZoneInfo:(id)a3 useSharedDatabase:(BOOL)a4
{
  BOOL v4 = a4;
  serialQueue = self->_serialQueue;
  id v7 = a3;
  dispatch_assert_queue_V2(serialQueue);
  [(ADCloudKitManager *)self _fetchChangesWithZoneInfo:v7 useSharedDatabase:v4 activity:0 mirror:0];
}

- (void)_fetchChangesFromZone:(id)a3 serverChangeToken:(id)a4 useSharedDatabase:(BOOL)a5 activity:(id)a6 container:(id)a7 mirror:(BOOL)a8 completion:(id)a9
{
  BOOL v9 = a8;
  id v15 = a3;
  id v47 = a4;
  id v46 = a6;
  id v16 = (CKContainer *)a7;
  id v17 = a9;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  primaryContainer = v16;
  if (!v16) {
    primaryContainer = self->_primaryContainer;
  }
  unsigned int v19 = primaryContainer;
  if (v9)
  {
    uint64_t v20 = [(ADCloudKitMirroredContainer *)self->_mirroredContainer container];

    unsigned int v19 = (CKContainer *)v20;
  }
  if (a5) {
    [(CKContainer *)v19 sharedCloudDatabase];
  }
  else {
  unsigned int v21 = [(CKContainer *)v19 privateCloudDatabase];
  }
  if (!v21)
  {
    if (!v17) {
      goto LABEL_23;
    }
    uint64_t v41 = +[AFError errorWithCode:4015];
LABEL_22:
    id v42 = (void *)v41;
    (*((void (**)(id, uint64_t, void, void, void, void))v17 + 2))(v17, v41, 0, 0, 0, 0);

    goto LABEL_23;
  }
  double v22 = [v15 zoneID];

  if (!v22)
  {
    if (!v17) {
      goto LABEL_23;
    }
    uint64_t v41 = +[AFError errorWithCode:4020];
    goto LABEL_22;
  }
  char v23 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    __int16 v24 = v23;
    id v25 = [v15 zoneID];
    id v26 = [v25 zoneName];
    [v21 databaseScope];
    CKDatabaseScopeString();
    id v27 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "-[ADCloudKitManager _fetchChangesFromZone:serverChangeToken:useSharedDatabase:activity:containe"
                         "r:mirror:completion:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v26;
    *(_WORD *)&buf[22] = 2112;
    v66 = v27;
    LOWORD(v67) = 2112;
    *(void *)((char *)&v67 + 2) = v19;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%s Fetching changes in record zone (%@) in database (%@) for container (%@)", buf, 0x2Au);
  }
  BOOL v28 = [v15 zoneID];
  v70 = v28;
  v44 = +[NSArray arrayWithObjects:&v70 count:1];

  __int16 v29 = +[NSMutableArray array];
  int v30 = +[NSMutableArray array];
  id v45 = objc_alloc_init((Class)CKFetchRecordZoneChangesConfiguration);
  [v45 setPreviousServerChangeToken:v47];
  __int16 v31 = [v15 zoneID];
  char v68 = v31;
  id v69 = v45;
  CFStringRef v43 = +[NSDictionary dictionaryWithObjects:&v69 forKeys:&v68 count:1];

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v66 = sub_100092050;
  *(void *)&long long v67 = sub_100092060;
  *((void *)&v67 + 1) = 0;
  id v32 = [objc_alloc((Class)CKFetchRecordZoneChangesOperation) initWithRecordZoneIDs:v44 configurationsByRecordZoneID:v43];
  [v32 setFetchAllChanges:1];
  v63[0] = _NSConcreteStackBlock;
  v63[1] = 3221225472;
  v63[2] = sub_1000A0F84;
  v63[3] = &unk_100500388;
  id v33 = v29;
  id v64 = v33;
  [v32 setRecordChangedBlock:v63];
  v61[0] = _NSConcreteStackBlock;
  v61[1] = 3221225472;
  v61[2] = sub_1000A0F90;
  v61[3] = &unk_1005003B0;
  id v34 = v30;
  id v62 = v34;
  [v32 setRecordWithIDWasDeletedBlock:v61];
  v60[0] = _NSConcreteStackBlock;
  v60[1] = 3221225472;
  v60[2] = sub_1000A0F9C;
  v60[3] = &unk_1005003D8;
  v60[4] = buf;
  [v32 setRecordZoneChangeTokensUpdatedBlock:v60];
  v57[0] = _NSConcreteStackBlock;
  v57[1] = 3221225472;
  v57[2] = sub_1000A0FB0;
  v57[3] = &unk_100500400;
  long long v35 = v19;
  id v58 = v35;
  v59 = buf;
  [v32 setRecordZoneFetchCompletionBlock:v57];
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472;
  v48[2] = sub_1000A1280;
  v48[3] = &unk_100500428;
  id v36 = v21;
  id v49 = v36;
  id v37 = v33;
  id v50 = v37;
  id v38 = v34;
  id v51 = v38;
  id v52 = v15;
  v53 = v35;
  BOOL v56 = v47 == 0;
  id v54 = v17;
  unint64_t v55 = buf;
  [v32 setFetchRecordZoneChangesCompletionBlock:v48];
  if (AFSupportsMultiUser()) {
    uint64_t v39 = 25;
  }
  else {
    uint64_t v39 = 17;
  }
  [v32 setQualityOfService:v39];
  if (v46)
  {
    id v40 = [v32 configuration];
    [v40 setXpcActivity:v46];
  }
  [v36 addOperation:v32];

  _Block_object_dispose(buf, 8);
LABEL_23:
}

- (void)_fetchCurrentUserIDWithCompletion:(id)a3
{
  BOOL v4 = (void (**)(id, void, void *))a3;
  BOOL v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v12 = "-[ADCloudKitManager _fetchCurrentUserIDWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  primaryContainer = self->_primaryContainer;
  if (!primaryContainer)
  {
    id v7 = +[AFError errorWithCode:4022];
    v4[2](v4, 0, v7);

    primaryContainer = self->_primaryContainer;
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000A1654;
  v9[3] = &unk_100500360;
  id v10 = v4;
  id v8 = v4;
  [(CKContainer *)primaryContainer fetchUserRecordIDWithCompletionHandler:v9];
}

- (void)_handleSubscriptionNotification:(id)a3 container:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 containerIdentifier];
  long long v35 = self;
  BOOL v9 = [(ADCloudKitManager *)self getContainerIDForThisDevice];
  unsigned __int8 v10 = [v8 isEqualToString:v9];

  id v11 = AFSiriLogContextDaemon;
  if (v10)
  {
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v48 = "-[ADCloudKitManager _handleSubscriptionNotification:container:]";
      __int16 v49 = 2112;
      id v50 = v7;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s Handle notification for container: %@", buf, 0x16u);
    }
    if ([v6 notificationType] == (id)2)
    {
      id v12 = [v6 recordZoneID];
      id v13 = [v12 zoneName];
      if (v13)
      {
        int v14 = [(NSMutableDictionary *)self->_recordZoneInfoDict objectForKey:v13];
        if ([v14 count])
        {
          long long v44 = 0u;
          long long v45 = 0u;
          long long v42 = 0u;
          long long v43 = 0u;
          id v15 = v14;
          id v16 = [v15 countByEnumeratingWithState:&v42 objects:v46 count:16];
          if (v16)
          {
            id v17 = v16;
            id v18 = v13;
            id v32 = v12;
            id v33 = v6;
            uint64_t v19 = *(void *)v43;
            id v34 = v37;
            do
            {
              for (i = 0; i != v17; i = (char *)i + 1)
              {
                if (*(void *)v43 != v19) {
                  objc_enumerationMutation(v15);
                }
                uint64_t v21 = *(void *)(*((void *)&v42 + 1) + 8 * i);
                double v22 = AFSiriLogContextDaemon;
                if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 136315394;
                  v48 = "-[ADCloudKitManager _handleSubscriptionNotification:container:]";
                  __int16 v49 = 2112;
                  id v50 = v18;
                  _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "%s Updating recordZoneInfo for zone %@", buf, 0x16u);
                }
                char v23 = [v7 options];
                __int16 v24 = [v23 accountOverrideInfo];

                if (v24)
                {
                  id v25 = [v7 options];
                  id v26 = [v25 accountOverrideInfo];
                  id v27 = [v26 accountID];

                  if (v27)
                  {
                    containerDict = v35->_containerDict;
                    v36[0] = _NSConcreteStackBlock;
                    v36[1] = 3221225472;
                    v37[0] = sub_1000A1BAC;
                    v37[1] = &unk_100500338;
                    id v38 = v27;
                    uint64_t v39 = v21;
                    id v40 = v35;
                    uint64_t v41 = v7;
                    [(NSMutableDictionary *)containerDict enumerateKeysAndObjectsUsingBlock:v36];
                  }
                }
              }
              id v17 = [v15 countByEnumeratingWithState:&v42 objects:v46 count:16];
            }
            while (v17);

            id v12 = v32;
            id v6 = v33;
            id v13 = v18;
          }
          else
          {
          }
        }
        else
        {
          __int16 v31 = AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            v48 = "-[ADCloudKitManager _handleSubscriptionNotification:container:]";
            __int16 v49 = 2112;
            id v50 = v12;
            _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "%s Unrecognized record zone notification zone name: (%@)", buf, 0x16u);
          }
        }
      }
      else
      {
        int v30 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v48 = "-[ADCloudKitManager _handleSubscriptionNotification:container:]";
          _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%s Record zone notification contains no zone name", buf, 0xCu);
        }
      }

      goto LABEL_30;
    }
  }
  else if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    id v12 = v11;
    __int16 v29 = [v6 containerIdentifier];
    *(_DWORD *)buf = 136315394;
    v48 = "-[ADCloudKitManager _handleSubscriptionNotification:container:]";
    __int16 v49 = 2112;
    id v50 = v29;
    _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%s Ignoring notification for container (%@)", buf, 0x16u);

LABEL_30:
  }
}

- (void)_setupZoneSubscriptionsForSecondaryAccount:(id)a3 zoneInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 subscriptionList];
  if ([v8 count])
  {
    unsigned __int8 v9 = [v7 hasSetUpRecordZoneSubscription];

    if (v9) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  unsigned __int8 v10 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    id v11 = v10;
    id v12 = [v7 zoneName];
    *(_DWORD *)buf = 136315650;
    int v30 = "-[ADCloudKitManager _setupZoneSubscriptionsForSecondaryAccount:zoneInfo:]";
    __int16 v31 = 2112;
    id v32 = v12;
    __int16 v33 = 2112;
    id v34 = v6;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s Set up subscriptions on zone: %@ in container: %@", buf, 0x20u);
  }
  [(ADCloudKitManager *)self _setupRecordZoneSubscriptionWithZoneInfo:v7 retryInterval:v6 container:120.0];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v20 = v7;
  id obj = [v7 subscriptionList];
  id v13 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v25;
    do
    {
      id v16 = 0;
      do
      {
        if (*(void *)v25 != v15) {
          objc_enumerationMutation(obj);
        }
        listener = self->_listener;
        id v18 = [*(id *)(*((void *)&v24 + 1) + 8 * (void)v16) subscriptionID];
        uint64_t v19 = [v6 privateCloudDatabase];
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_1000A1F70;
        v22[3] = &unk_100500310;
        v22[4] = self;
        id v23 = v6;
        [(CKNotificationListener *)listener registerForSubscriptionWithID:v18 inDatabase:v19 handler:v22];

        id v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      id v14 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v14);
  }

  id v7 = v20;
LABEL_15:
}

- (void)_setupZonesForSecondaryAccount:(id)a3 container:(id)a4 acctInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    id v18 = "-[ADCloudKitManager _setupZonesForSecondaryAccount:container:acctInfo:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
    if (!v9) {
      goto LABEL_6;
    }
  }
  else if (!v9)
  {
    goto LABEL_6;
  }
  id v12 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    id v18 = "-[ADCloudKitManager _setupZonesForSecondaryAccount:container:acctInfo:]";
    __int16 v19 = 2112;
    id v20 = v9;
    _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%s Setting up zones for container %@", buf, 0x16u);
  }
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A214C;
  block[3] = &unk_10050DCB8;
  void block[4] = self;
  id v15 = v10;
  id v16 = v9;
  dispatch_async(serialQueue, block);

LABEL_6:
}

- (void)setupZonesForSecondaryAccount:(id)a3
{
  id v4 = a3;
  id v6 = [(ADCloudKitManager *)self _trackedCKContainerForiCloudAltDSID:v4];
  BOOL v5 = [(ADCloudKitManager *)self _trackedCKAccountInfoForiCloudAltDSID:v4];
  [(ADCloudKitManager *)self _setupZonesForSecondaryAccount:v4 container:v6 acctInfo:v5];
}

- (void)_setupSecondaryAccounts
{
  if (AFIsATV())
  {
    unsigned __int8 v3 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      containerDict = self->_containerDict;
      int v5 = 136315395;
      id v6 = "-[ADCloudKitManager _setupSecondaryAccounts]";
      __int16 v7 = 2113;
      id v8 = containerDict;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s Tracking containers %{private}@", (uint8_t *)&v5, 0x16u);
    }
  }
}

- (void)setupContainerForiCloudAltDSID:(id)a3
{
  unsigned __int8 v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    int v5 = "-[ADCloudKitManager setupContainerForiCloudAltDSID:]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }
}

- (void)_untrackiCloudAltDSID:(id)a3
{
  id v4 = a3;
  int v5 = [v4 lowercaseString];
  if (v5)
  {
    [(NSMutableDictionary *)self->_containerDict removeObjectForKey:v5];
    [(NSMutableDictionary *)self->_ckAcctInfoDict removeObjectForKey:v5];
    id v6 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      primaryAccountiCloudAltDSID = self->_primaryAccountiCloudAltDSID;
      int v12 = 136315394;
      id v13 = "-[ADCloudKitManager _untrackiCloudAltDSID:]";
      __int16 v14 = 2112;
      id v15 = primaryAccountiCloudAltDSID;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s Resetting primary iCloud Info %@", (uint8_t *)&v12, 0x16u);
    }
    if ([(NSString *)self->_primaryAccountiCloudAltDSID isEqualToString:v4])
    {
      id v8 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        int v12 = 136315138;
        id v13 = "-[ADCloudKitManager _untrackiCloudAltDSID:]";
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s Resetting primary iCloud Info", (uint8_t *)&v12, 0xCu);
      }
      id v9 = self->_primaryAccountiCloudAltDSID;
      self->_primaryAccountiCloudAltDSID = 0;

      primaryAccountInfo = self->_primaryAccountInfo;
      self->_primaryAccountInfo = 0;

      primaryContainer = self->_primaryContainer;
      self->_primaryContainer = 0;

      [(ADCloudKitManager *)self _cleanUpRecordZonesAndSubscriptions];
    }
  }
}

- (id)_trackedCKAccountInfoForiCloudAltDSID:(id)a3
{
  id v4 = [a3 lowercaseString];
  if (v4)
  {
    int v5 = [(NSMutableDictionary *)self->_ckAcctInfoDict objectForKey:v4];
  }
  else
  {
    id v6 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315138;
      id v9 = "-[ADCloudKitManager _trackedCKAccountInfoForiCloudAltDSID:]";
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s no trackingKey found", (uint8_t *)&v8, 0xCu);
    }
    int v5 = 0;
  }

  return v5;
}

- (id)_trackedCKContainerForiCloudAltDSID:(id)a3
{
  id v4 = [a3 lowercaseString];
  if (v4)
  {
    int v5 = [(NSMutableDictionary *)self->_containerDict objectForKey:v4];
  }
  else
  {
    id v6 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315138;
      id v9 = "-[ADCloudKitManager _trackedCKContainerForiCloudAltDSID:]";
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s no trackingKey found", (uint8_t *)&v8, 0xCu);
    }
    int v5 = 0;
  }

  return v5;
}

- (void)_trackCKContainer:(id)a3 accountInfo:(id)a4 foriCloudAltDSID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!self->_ckAcctInfoDict)
  {
    id v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    ckAcctInfoDict = self->_ckAcctInfoDict;
    self->_ckAcctInfoDict = v11;
  }
  if (!self->_containerDict)
  {
    id v13 = +[NSMutableDictionary dictionary];
    containerDict = self->_containerDict;
    self->_containerDict = v13;
  }
  id v15 = [v10 lowercaseString];
  if (v10)
  {
    if (v8) {
      [(NSMutableDictionary *)self->_containerDict setValue:v8 forKey:v15];
    }
    if (v9) {
      [(NSMutableDictionary *)self->_ckAcctInfoDict setValue:v9 forKey:v15];
    }
  }
  else
  {
    id v16 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v17 = 136315138;
      id v18 = "-[ADCloudKitManager _trackCKContainer:accountInfo:foriCloudAltDSID:]";
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s Invalid iCloudAltDSID", (uint8_t *)&v17, 0xCu);
    }
  }
}

- (void)_deleteUserData
{
  unsigned __int8 v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    int v30 = "-[ADCloudKitManager _deleteUserData]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v4 = [(NSMutableDictionary *)self->_recordZoneInfoDict allValues];
  id v5 = [v4 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v24;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        id v10 = v9;
        id v11 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v20;
          do
          {
            for (j = 0; j != v12; j = (char *)j + 1)
            {
              if (*(void *)v20 != v13) {
                objc_enumerationMutation(v10);
              }
              id v15 = *(void **)(*((void *)&v19 + 1) + 8 * (void)j);
              id v16 = [v15 dataStore];

              if (v16)
              {
                int v17 = [v15 dataStore];
                [v17 deleteUserData:0];
              }
            }
            id v12 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
          }
          while (v12);
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v6);
  }

  id v18 = +[ADPreferences sharedPreferences];
  [v18 setPhsAssetManifest:0 onSharedZone:1];
  [v18 setPhsAssetManifest:0 onSharedZone:0];
  [v18 synchronize];
}

- (void)_setupAccountState
{
  unsigned __int8 v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v9 = "-[ADCloudKitManager _setupAccountState]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  id v4 = [(CKAccountInfo *)self->_primaryAccountInfo accountStatus];
  if (v4 == (id)3)
  {
    userID = self->_userID;
    self->_userID = 0;

    _AFPreferencesSetCloudUserID();
    AFBackedUpPreferencesSynchronize();
    [(ADCloudKitManager *)self _deleteUserData];
LABEL_11:
    [(ADCloudKitManager *)self _cleanUpRecordZonesAndSubscriptions];
    return;
  }
  if (v4 != (id)1
    || ([(CKAccountInfo *)self->_primaryAccountInfo supportsDeviceToDeviceEncryption] & 1) == 0&& !self->_usingNonManateeIdentity)
  {
    goto LABEL_11;
  }
  if (AFIsMultiUserCompanion() && (mirroredContainer = self->_mirroredContainer) != 0)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000A30AC;
    v7[3] = &unk_10050C610;
    void v7[4] = self;
    [(ADCloudKitMirroredContainer *)mirroredContainer createMirroredZonesWithCompletion:v7];
  }
  else
  {
    [(ADCloudKitManager *)self _setupPrimaryContainer];
  }
}

- (void)_setupPrimaryContainer
{
  unsigned __int8 v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    id v5 = "-[ADCloudKitManager _setupPrimaryContainer]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }
  [(ADCloudKitManager *)self _cleanUpRecordZoneSubscriptionsTimers];
  [(ADCloudKitManager *)self _setupAccountStatusRecordZone];
  [(ADCloudKitManager *)self _setupKeyValueRecordZone];
  if (AFSupportsMultiUser())
  {
    [(ADCloudKitManager *)self _setupMultiUserSharedRecordZoneIfHomeIsReady];
  }
  else
  {
    self->_multiUserSharedZoneReady = 1;
    [(ADCloudKitManager *)self _setupMultiUserSharedRecordZone];
  }
}

- (void)_handleAccountStatusChange:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (![(CKAccountInfo *)self->_primaryAccountInfo isEqual:v5]
    || self->_keyChainSyncIncompleteErrorEncountered)
  {
    id v6 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = v6;
      [v5 accountStatus];
      id v8 = CKStringFromAccountStatus();
      unsigned int v9 = [v5 supportsDeviceToDeviceEncryption];
      CFStringRef v10 = @"Disabled";
      BOOL usingNonManateeIdentity = self->_usingNonManateeIdentity;
      if (v9) {
        CFStringRef v10 = @"Enabled";
      }
      *(_DWORD *)buf = 136315906;
      id v16 = "-[ADCloudKitManager _handleAccountStatusChange:]";
      __int16 v17 = 2112;
      id v18 = v8;
      __int16 v19 = 2112;
      CFStringRef v20 = v10;
      if (usingNonManateeIdentity) {
        CFStringRef v12 = @"Yes";
      }
      else {
        CFStringRef v12 = @"No";
      }
      __int16 v21 = 2112;
      CFStringRef v22 = v12;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s CloudKit account status: (%@) encryption is: %@  nonManatee: (%@)", buf, 0x2Au);
    }
    objc_storeStrong((id *)&self->_primaryAccountInfo, a3);
    if (AFIsATV()) {
      [(ADCloudKitManager *)self _trackCKContainer:self->_primaryContainer accountInfo:self->_primaryAccountInfo foriCloudAltDSID:self->_primaryAccountiCloudAltDSID];
    }
    if ([v5 accountStatus] == (id)1)
    {
      uint64_t v13 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        id v16 = "-[ADCloudKitManager _handleAccountStatusChange:]";
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s CloudKit account is available, ensuring default enable state is on.", buf, 0xCu);
      }
      [(ADCloudKitManager *)self _setDefaultiCloudEnabledState];
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_1000A33FC;
      v14[3] = &unk_1005002C8;
      v14[4] = self;
      [(ADCloudKitManager *)self _fetchCurrentUserIDWithCompletion:v14];
    }
    else
    {
      [(ADCloudKitManager *)self _setupAccountState];
    }
  }
}

- (void)_setupAccount
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  primaryContainer = self->_primaryContainer;
  if (!primaryContainer)
  {
    int v4 = [(ADCloudKitManager *)self getContainerIDForThisDevice];
    sub_1003104B8(v4);
    id v5 = (CKContainer *)objc_claimAutoreleasedReturnValue();
    id v6 = self->_primaryContainer;
    self->_primaryContainer = v5;

    if (self->_primaryAccountiCloudAltDSID) {
      -[ADCloudKitManager _trackCKContainer:accountInfo:foriCloudAltDSID:](self, "_trackCKContainer:accountInfo:foriCloudAltDSID:", self->_primaryContainer, self->_primaryAccountInfo);
    }
    if (AFIsMultiUserCompanion() && !self->_mirroredContainer && !self->_usingNonManateeIdentity)
    {
      uint64_t v7 = [[ADCloudKitMirroredContainer alloc] initWithContainer:@"com.apple.siri.data" queue:self->_serialQueue];
      mirroredContainer = self->_mirroredContainer;
      self->_mirroredContainer = v7;
    }
    primaryContainer = self->_primaryContainer;
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000A378C;
  v9[3] = &unk_1005002A0;
  void v9[4] = self;
  [(CKContainer *)primaryContainer accountInfoWithCompletionHandler:v9];
}

- (void)ignoreNextNotification:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000A39CC;
  v7[3] = &unk_10050E160;
  id v8 = v4;
  unsigned int v9 = self;
  id v6 = v4;
  dispatch_async(serialQueue, v7);
}

- (void)_preferencesDidChange
{
  unsigned __int8 v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v7 = "-[ADCloudKitManager _preferencesDidChange]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A3B34;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(serialQueue, block);
}

- (void)_multiUserVoiceIdentificationDidChange:(id)a3
{
  id v4 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v8 = "-[ADCloudKitManager _multiUserVoiceIdentificationDidChange:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A3EE8;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(serialQueue, block);
}

- (void)_sharedUserIdentifierDidChange:(id)a3
{
  id v4 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v8 = "-[ADCloudKitManager _sharedUserIdentifierDidChange:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A4034;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(serialQueue, block);
}

- (void)_outputLanguageDidChange
{
  unsigned __int8 v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v7 = "-[ADCloudKitManager _outputLanguageDidChange]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A419C;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(serialQueue, block);
}

- (void)_languageCodeDidChange
{
  unsigned __int8 v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v7 = "-[ADCloudKitManager _languageCodeDidChange]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A42E8;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(serialQueue, block);
}

- (void)_buddyStateDidChangeNotification:(id)a3
{
  id v4 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v8 = "-[ADCloudKitManager _buddyStateDidChangeNotification:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A4434;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(serialQueue, block);
}

- (void)_cloudKitAccountStatusChanged:(id)a3
{
  id v4 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v8 = "-[ADCloudKitManager _cloudKitAccountStatusChanged:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A45F4;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(serialQueue, block);
}

- (void)_handleCloudKitNotification:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v5 = [v4 containerIdentifier];
  id v6 = [(ADCloudKitManager *)self getContainerIDForThisDevice];
  unsigned __int8 v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = v4;
      unsigned int v9 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        int v26 = 136315394;
        long long v27 = "-[ADCloudKitManager _handleCloudKitNotification:]";
        __int16 v28 = 2112;
        id v29 = v8;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s Received record zone notification: (%@)", (uint8_t *)&v26, 0x16u);
      }
      if ([v8 databaseScope] == (id)2)
      {
        CFStringRef v10 = [v8 recordZoneID];
        id v11 = [v10 zoneName];
        if (v11)
        {
          CFStringRef v12 = [(NSMutableDictionary *)self->_recordZoneInfoDict objectForKey:v11];
          uint64_t v13 = [v12 firstObject];

          if (v13)
          {
            [(ADCloudKitManager *)self _fetchChangesWithZoneInfo:v13 useSharedDatabase:0];
          }
          else
          {
            long long v25 = AFSiriLogContextDaemon;
            if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
            {
              int v26 = 136315394;
              long long v27 = "-[ADCloudKitManager _handleCloudKitNotification:]";
              __int16 v28 = 2112;
              id v29 = v10;
              _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "%s Unrecognized record zone notification zone name: (%@)", (uint8_t *)&v26, 0x16u);
            }
          }
        }
        else
        {
          long long v24 = AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
          {
            int v26 = 136315138;
            long long v27 = "-[ADCloudKitManager _handleCloudKitNotification:]";
            _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%s Record zone notification contains no zone name", (uint8_t *)&v26, 0xCu);
          }
        }
      }
LABEL_29:

      goto LABEL_30;
    }
    if (AFSupportsMultiUser() && [v4 notificationType] == (id)4)
    {
      id v8 = v4;
      if ([v8 databaseScope] == (id)3)
      {
        CFStringRef v20 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          int v26 = 136315138;
          long long v27 = "-[ADCloudKitManager _handleCloudKitNotification:]";
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%s Received database notification for shared DB", (uint8_t *)&v26, 0xCu);
        }
        [(ADCloudKitShareeOperations *)self->_shareeOperations fetchSharedZones];
      }
      goto LABEL_29;
    }
  }
  else
  {
    if (+[AFFeatureFlags isLassoEnabled])
    {
      __int16 v14 = [v4 recordZoneID];
      id v8 = [v14 zoneName];

      id v15 = [(ADCloudKitRecordZoneInfo *)self->_multiUserRecordZoneInfo zone];
      id v16 = [v15 zoneID];
      __int16 v17 = [v16 zoneName];
      unsigned int v18 = [v8 isEqualToString:v17];

      if (v18)
      {
        __int16 v19 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
        {
          int v26 = 136315138;
          long long v27 = "-[ADCloudKitManager _handleCloudKitNotification:]";
          _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "%s Fetching changes from container.", (uint8_t *)&v26, 0xCu);
        }
        [(ADCloudKitManager *)self _fetchChangesWithZoneInfo:self->_multiUserRecordZoneInfo useSharedDatabase:0 mirror:1];
        goto LABEL_29;
      }
    }
    __int16 v21 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      CFStringRef v22 = v21;
      long long v23 = [v4 containerIdentifier];
      int v26 = 136315394;
      long long v27 = "-[ADCloudKitManager _handleCloudKitNotification:]";
      __int16 v28 = 2112;
      id v29 = v23;
      _os_log_debug_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "%s Ignoring notification for container (%@)", (uint8_t *)&v26, 0x16u);
    }
  }
LABEL_30:
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 userInfo];
  unsigned int v9 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    CFStringRef v10 = v9;
    id v11 = [v7 topic];
    int v16 = 136315650;
    __int16 v17 = "-[ADCloudKitManager connection:didReceiveIncomingMessage:]";
    __int16 v18 = 2112;
    __int16 v19 = v11;
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s APS message received for topic (%@) on connection (%@)", (uint8_t *)&v16, 0x20u);
  }
  CFStringRef v12 = [v7 topic];
  uint64_t v13 = [@"com.apple.icloud-container." stringByAppendingString:self->_applicationIdentifier];
  unsigned int v14 = [v12 isEqualToString:v13];

  if (v14)
  {
    id v15 = +[CKNotification notificationFromRemoteNotificationDictionary:v8];
    [(ADCloudKitManager *)self _handleCloudKitNotification:v15];
  }
}

- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v14 = 136316162;
    id v15 = "-[ADCloudKitManager connection:didReceiveToken:forTopic:identifier:]";
    __int16 v16 = 2112;
    id v17 = v10;
    __int16 v18 = 2112;
    id v19 = v11;
    __int16 v20 = 2112;
    id v21 = v12;
    __int16 v22 = 2112;
    id v23 = v9;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s Received per-topic push token (%@) for topic (%@) identifier (%@) on connection (%@)", (uint8_t *)&v14, 0x34u);
  }
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315650;
    id v9 = "-[ADCloudKitManager connection:didReceivePublicToken:]";
    __int16 v10 = 2112;
    id v11 = v6;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s Received public token (%@) on connection %@", (uint8_t *)&v8, 0x20u);
  }
}

- (APSConnection)pushConnection
{
  pushConnection = self->_pushConnection;
  if (!pushConnection)
  {
    id v4 = objc_alloc((Class)APSConnection);
    id v5 = (APSConnection *)[v4 initWithEnvironmentName:APSEnvironmentProduction namedDelegatePort:@"com.apple.assistantd.aps" queue:self->_serialQueue];
    id v6 = self->_pushConnection;
    self->_pushConnection = v5;

    [(APSConnection *)self->_pushConnection setDelegate:self];
    pushConnection = self->_pushConnection;
    if (!pushConnection)
    {
      id v7 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        int v9 = 136315138;
        __int16 v10 = "-[ADCloudKitManager pushConnection]";
        _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s Failed to create push connection", (uint8_t *)&v9, 0xCu);
        pushConnection = self->_pushConnection;
      }
      else
      {
        pushConnection = 0;
      }
    }
  }
  return pushConnection;
}

- (void)_disablePush
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v3 = [(ADCloudKitManager *)self pushConnection];
  [v3 _setEnabledTopics:0];
}

- (void)_enablePush
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v3 = [@"com.apple.icloud-container." stringByAppendingString:self->_applicationIdentifier];
  id v4 = [(ADCloudKitManager *)self pushConnection];
  id v6 = v3;
  id v5 = +[NSArray arrayWithObjects:&v6 count:1];
  [v4 _setEnabledTopics:v5];
}

- (void)disablePushNotifications
{
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A50F0;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(serialQueue, block);
}

- (void)enablePushNotifications
{
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A516C;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(serialQueue, block);
}

- (BOOL)_zoneShouldUpdateMirroredZone
{
  if (self->_usingNonManateeIdentity) {
    return 0;
  }
  else {
    return AFIsHorseman() ^ 1;
  }
}

- (BOOL)_zoneIsShareable:(id)a3
{
  return [a3 isEqualToString:@"com.apple.assistant.multiuser.shared"];
}

- (void)_setDefaultiCloudEnabledState
{
  id v2 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    id v5 = "-[ADCloudKitManager _setDefaultiCloudEnabledState]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }
  id v3 = _AFBackedUpPreferencesBoolValueForKey();

  if (!v3) {
    [(id)objc_opt_class() _setAppleAccountSiriStateEnabled:1 withCompletion:&stru_100500250];
  }
}

- (void)dealloc
{
  [(APSConnection *)self->_pushConnection setDelegate:0];
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:CKAccountChangedNotification object:0];
  [v3 removeObserver:self name:CKIdentityUpdateNotification object:0];
  [v3 removeObserver:self name:@"ADPreferencesSharedUserIdentifierDidChangeNotification" object:0];
  [v3 removeObserver:self name:@"ADMultiUserVoiceIdentificationDidChangeNotification" object:0];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, kAFPreferencesDidChangeDarwinNotification, 0);
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, AFLanguageCodeDidChangeDarwinNotification, 0);
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, AFOutputLanguageDidChangeDarwinNotification, 0);
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, kVTPreferencesVoiceTriggerEnabledDidChangeDarwinNotification, 0);
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.voicetrigger.PHSProfileModified", 0);

  v5.receiver = self;
  v5.super_class = (Class)ADCloudKitManager;
  [(ADCloudKitManager *)&v5 dealloc];
}

- (ADCloudKitManager)initWithInstanceContext:(id)a3
{
  id v4 = a3;
  v53.receiver = self;
  v53.super_class = (Class)ADCloudKitManager;
  objc_super v5 = [(ADCloudKitManager *)&v53 init];
  if (v5)
  {
    v5->_BOOL usingNonManateeIdentity = _AFPreferencesGetNonManateeIdentity();
    uint64_t v6 = _AFPreferencesCloudUserID();
    userID = v5->_userID;
    v5->_userID = (NSString *)v6;

    if (v4)
    {
      int v8 = (AFInstanceContext *)v4;
    }
    else
    {
      int v8 = +[AFInstanceContext defaultContext];
    }
    instanceContext = v5->_instanceContext;
    v5->_instanceContext = v8;

    uint64_t v10 = +[NSString stringWithFormat:@"%@.%@.%@", @"com.apple.assistant.backedup", @"subscription", @"AssistantKeyValueRecord"];
    id v11 = (void *)qword_1005858D0;
    qword_1005858D0 = v10;

    __int16 v12 = [ADCloudKitRecordZoneInfo alloc];
    id v13 = [(ADCloudKitRecordZoneInfo *)v12 initWithZoneName:@"com.apple.assistant.backedup" subscriptionName:qword_1005858D0];
    keyValueRecordZoneInfo = v5->_keyValueRecordZoneInfo;
    v5->_keyValueRecordZoneInfo = v13;

    uint64_t v15 = +[NSString stringWithFormat:@"%@.%@.%@", @"com.apple.assistant.account.status", @"subscription", @"AssistantKeyValueRecord"];
    __int16 v16 = (void *)qword_1005858D8;
    qword_1005858D8 = v15;

    id v17 = [ADCloudKitRecordZoneInfo alloc];
    __int16 v18 = [(ADCloudKitRecordZoneInfo *)v17 initWithZoneName:@"com.apple.assistant.account.status" subscriptionName:qword_1005858D8];
    accountStatusRecordZoneInfo = v5->_accountStatusRecordZoneInfo;
    v5->_accountStatusRecordZoneInfo = v18;

    uint64_t v20 = +[NSString stringWithFormat:@"%@.%@.%@", @"com.apple.assistant.multiuser.shared", @"subscription", @"AssistantVoiceTriggerFileAssetRecord"];
    id v21 = (void *)qword_1005858E0;
    qword_1005858E0 = v20;

    uint64_t v22 = +[NSString stringWithFormat:@"%@.%@.%@", @"com.apple.assistant.multiuser.shared", @"subscription", @"AssistantKeyValueRecord"];
    id v23 = (void *)qword_1005858E8;
    qword_1005858E8 = v22;

    long long v24 = [ADCloudKitRecordZoneInfo alloc];
    v59[0] = qword_1005858E0;
    v59[1] = qword_1005858E8;
    long long v25 = +[NSArray arrayWithObjects:v59 count:2];
    int v26 = [(ADCloudKitRecordZoneInfo *)v24 initWithZoneName:@"com.apple.assistant.multiuser.shared" subscriptionNames:v25];
    multiUserRecordZoneInfo = v5->_multiUserRecordZoneInfo;
    v5->_multiUserRecordZoneInfo = v26;

    BOOL v56 = v5->_keyValueRecordZoneInfo;
    v57[0] = @"com.apple.assistant.backedup";
    __int16 v28 = +[NSArray arrayWithObjects:&v56 count:1];
    v58[0] = v28;
    v57[1] = @"com.apple.assistant.account.status";
    unint64_t v55 = v5->_accountStatusRecordZoneInfo;
    id v29 = +[NSArray arrayWithObjects:&v55 count:1];
    v58[1] = v29;
    v57[2] = @"com.apple.assistant.multiuser.shared";
    id v54 = v5->_multiUserRecordZoneInfo;
    int v30 = +[NSArray arrayWithObjects:&v54 count:1];
    v58[2] = v30;
    __int16 v31 = +[NSDictionary dictionaryWithObjects:v58 forKeys:v57 count:3];

    id v32 = (NSMutableDictionary *)[v31 mutableCopy];
    recordZoneInfoDict = v5->_recordZoneInfoDict;
    v5->_recordZoneInfoDict = v32;

    uint64_t v34 = [(id)objc_opt_class() getApplicationIdentifierFromEntitlements];
    applicationIdentifier = v5->_applicationIdentifier;
    v5->_applicationIdentifier = (NSString *)v34;

    id v36 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v37 = dispatch_queue_attr_make_with_qos_class(v36, QOS_CLASS_USER_INITIATED, 0);

    dispatch_queue_t v38 = dispatch_queue_create("ADCloudKitManager.Serial", v37);
    serialQueue = v5->_serialQueue;
    v5->_serialQueue = (OS_dispatch_queue *)v38;

    id v40 = [(ADCloudKitManager *)v5 getContainerIDForThisDevice];
    uint64_t v41 = sub_1003104B8(v40);
    primaryContainer = v5->_primaryContainer;
    v5->_primaryContainer = (CKContainer *)v41;

    if (AFIsMultiUserCompanion() && !v5->_usingNonManateeIdentity)
    {
      long long v43 = [[ADCloudKitMirroredContainer alloc] initWithContainer:@"com.apple.siri.data" queue:v5->_serialQueue];
      mirroredContainer = v5->_mirroredContainer;
      v5->_mirroredContainer = v43;
    }
    long long v45 = +[NSNotificationCenter defaultCenter];
    [v45 addObserver:v5 selector:"_cloudKitAccountStatusChanged:" name:CKAccountChangedNotification object:0];
    [v45 addObserver:v5 selector:"_cloudKitAccountStatusChanged:" name:CKIdentityUpdateNotification object:0];
    [v45 addObserver:v5 selector:"_buddyStateDidChangeNotification:" name:@"ADBuddyStateDidChangeNotification" object:0];
    id v46 = +[ADPreferences sharedPreferences];
    [v45 addObserver:v5 selector:"_sharedUserIdentifierDidChange:" name:@"ADPreferencesSharedUserIdentifierDidChangeNotification" object:v46];
    [v45 addObserver:v5 selector:"_multiUserVoiceIdentificationDidChange:" name:@"ADMultiUserVoiceIdentificationDidChangeNotification" object:v46];
    [v45 addObserver:v5 selector:"_homeInfoDidChange:" name:@"ADHomeInfoForThisDeviceDidChangeNotification" object:0];
    id v47 = +[NSDistributedNotificationCenter defaultCenter];
    [v47 addObserver:v5 selector:"_voiceProfileFullDownloadTriggered:" name:kSSRTriggerPHSProfileDownload object:0];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v5, (CFNotificationCallback)sub_1000A5F84, kAFPreferencesDidChangeDarwinNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v5, (CFNotificationCallback)sub_1000A5ED0, AFLanguageCodeDidChangeDarwinNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v5, (CFNotificationCallback)sub_1000A5E1C, AFOutputLanguageDidChangeDarwinNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v5, (CFNotificationCallback)sub_1000A5E14, kVTPreferencesVoiceTriggerEnabledDidChangeDarwinNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v5, (CFNotificationCallback)sub_1000A5E0C, @"com.apple.voicetrigger.PHSProfileModified", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    __int16 v49 = v5->_serialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000A5B74;
    block[3] = &unk_10050E138;
    id v52 = v5;
    dispatch_async(v49, block);
  }
  return v5;
}

- (ADCloudKitManager)init
{
  id v3 = +[AFInstanceContext currentContext];
  id v4 = [(ADCloudKitManager *)self initWithInstanceContext:v3];

  return v4;
}

+ (void)_setAppleAccountSiriStateEnabled:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  uint64_t v6 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    CFStringRef v7 = @"disabled";
    if (v4) {
      CFStringRef v7 = @"enabled";
    }
    *(_DWORD *)buf = 136315394;
    uint64_t v15 = "+[ADCloudKitManager _setAppleAccountSiriStateEnabled:withCompletion:]";
    __int16 v16 = 2112;
    CFStringRef v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s Setting Siri Account State to %@.", buf, 0x16u);
  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000A61F0;
  v10[3] = &unk_100500278;
  BOOL v13 = v4;
  id v11 = objc_alloc_init((Class)ACAccountStore);
  id v12 = v5;
  id v8 = v5;
  id v9 = v11;
  objc_msgSend(v9, "aa_primaryAppleAccountWithCompletion:", v10);
}

+ (id)getApplicationIdentifierFromEntitlements
{
  [@"application-identifier" UTF8String];
  id v2 = (void *)xpc_copy_entitlement_for_self();
  id v3 = v2;
  if (v2 && xpc_get_type(v2) == (xpc_type_t)&_xpc_type_string)
  {
    BOOL v4 = +[NSString stringWithUTF8String:xpc_string_get_string_ptr(v3)];
  }
  else
  {
    BOOL v4 = 0;
  }
  id v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    id v8 = "+[ADCloudKitManager getApplicationIdentifierFromEntitlements]";
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s application identifier = (%@)", (uint8_t *)&v7, 0x16u);
  }

  return v4;
}

+ (id)sharedManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A64EC;
  block[3] = &unk_10050E350;
  void block[4] = a1;
  if (qword_1005858C0 != -1) {
    dispatch_once(&qword_1005858C0, block);
  }
  id v2 = (void *)qword_1005858C8;
  return v2;
}

@end