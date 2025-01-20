@interface ADMultiUserService
+ (id)sharedService;
- (ADCommunalDeviceUser)deviceOwner;
- (ADCommunalDeviceUser)primaryUser;
- (ADHomeInfoManager)homeInfoManager;
- (BOOL)_homeKitSettingsDidChangeForDeviceOwner;
- (BOOL)_isCurrentLanguageMultiUserCompatible;
- (BOOL)_isTrackingUUIDForInFlightVoiceProfile:(id)a3;
- (BOOL)_multiUserListenerShouldAcceptNewConnection:(id)a3;
- (BOOL)_profileLimitReached;
- (BOOL)_removeUser:(id)a3 homeUserID:(id)a4 sharedUserID:(id)a5 iCloudAltDSID:(id)a6 error:(id *)a7;
- (BOOL)_updateDeviceOwner:(id)a3 sharedUserId:(id)a4 enrollmentName:(id)a5 companionInfo:(id)a6 shareOwnerName:(id)a7 homeMemberSettings:(id)a8 loggingAllowed:(BOOL)a9;
- (BOOL)_updateHomeKitSettings:(id)a3;
- (BOOL)_updateNonHomeUserSettings:(id)a3;
- (BOOL)_updateVoiceProfileInfo;
- (BOOL)getAllowExplicitContentSettingForRecognizedUser;
- (BOOL)isMultiUserAvailable;
- (BOOL)isMultiUserInfoDirty;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)personalDomainSettingsDidChange:(id)a3 newUserSettings:(id)a4;
- (NSDictionary)rawScores;
- (NSMutableArray)usersWithAvailableVoiceProfiles;
- (NSMutableDictionary)homeUserSettings;
- (NSMutableDictionary)sharedUsersByHomeUserUUID;
- (NSMutableDictionary)sharedUsersBySharedUserID;
- (NSMutableDictionary)sharedUsersByiCloudAltDSID;
- (NSString)cachedAssistantDataUnredactedAnchor;
- (OS_dispatch_queue)queue;
- (SSRVoiceProfileManager)voiceProfileManager;
- (id)_allUsersBySharedUserID;
- (id)_augmentUserPropertiesWithHomeInfoForUser:(id)a3;
- (id)_confidenceScoreForSharedUserID:(id)a3 expectedSpeakerSharedUserID:(id)a4 expectedSpeakerConfidenceScore:(int64_t)a5 confidenceScores:(id)a6;
- (id)_generateDeviceUserWithHomeUserUUID:(id)a3 sharedUserId:(id)a4 loggableSharedUserId:(id)a5 adaccount:(id)a6;
- (id)_getUserAgentStringForSharedUserID:(id)a3;
- (id)_homeMembersForPlatform;
- (id)_inFlightVoiceProfilesByUUID;
- (id)_initWithPreferences:(id)a3 ssrManager:(id)a4 homeInfoManager:(id)a5;
- (id)allUsersBySharedUserID;
- (id)confidenceScoresForMultiUserTestingExpectedSpeakerSharedUserID:(id)a3 expectedSpeakerConfidenceScore:(int64_t)a4 nonspeakerConfidenceScores:(id)a5;
- (id)currentOwnerSharedUserID;
- (id)getAssistantIdentifierForIDS:(id)a3;
- (id)getCloudKitManager;
- (id)getDeviceOwnerSharedUserId;
- (id)getSharedUserIdForHomeUserId:(id)a3;
- (id)getSharedUserIdForShareOwnerName:(id)a3;
- (id)getSyncableSharedUserIdForSharedUserId:(id)a3;
- (id)getSyncableSharedUserIdsForSharedUserIds:(id)a3;
- (id)getUserAgentStringForSharedUserID:(id)a3;
- (id)homeUserIdToNames;
- (id)multiUserSAObject;
- (id)sharedRemoteDevices;
- (id)validateAndReturnScores:(id)a3 classifiedUser:(id)a4 donatedScores:(id)a5 unknownUserSharedId:(id *)a6 totalUsers:(unint64_t *)a7 ghostVoiceProfileDetected:(BOOL *)a8;
- (unint64_t)_countVoiceProfiles;
- (unint64_t)addIfSiriCloudSyncEnabledForUser:(id)a3;
- (unint64_t)countUsersWithLocationServicesEnabled;
- (unint64_t)countUsersWithMatchingSiriLanguage;
- (unint64_t)countUsersWithPersonalRequestsEnabled;
- (unint64_t)countUsersWithSiriCloudSyncEnabled;
- (unint64_t)countVoiceProfiles;
- (void)_addDeviceOwner:(id)a3 sharedUserId:(id)a4 loggableSharedUserId:(id)a5 iCloudAltDSID:(id)a6 audioAppSignals:(id)a7 enrollmentName:(id)a8 companionInfo:(id)a9 shareOwnerName:(id)a10 homeMemberSettings:(id)a11 loggingAllowed:(BOOL)a12 completion:(id)a13;
- (void)_addUser:(id)a3 sharedUserId:(id)a4 loggableSharedUserId:(id)a5 iCloudAltDSID:(id)a6 enrollmentName:(id)a7 isPrimary:(BOOL)a8 nonCloudSyncedUser:(BOOL)a9 completion:(id)a10;
- (void)_allowVoiceIdentificationForThisUser:(id)a3 iCloudAltDSID:(id)a4 completion:(id)a5;
- (void)_deleteShareForUser:(id)a3;
- (void)_describeSAMultiUserInfo:(id)a3;
- (void)_forceCloudSyncedUserDownload:(id)a3;
- (void)_languageCodeDidChange;
- (void)_loadCloudSyncedUsersFromCache;
- (void)_logRelevantAnalyticsOnUserAddedWithSharedUserID:(id)a3 isPrimary:(BOOL)a4;
- (void)_postRemovalStateCleanup;
- (void)_primaryUserSharedUserIdentifierDidChangeNotification:(id)a3;
- (void)_refreshUsersAndVoiceProfiles:(BOOL)a3;
- (void)_removeGhostVoiceProfiles;
- (void)_resetAllUsers;
- (void)_resetPrimaryUser;
- (void)_saveDeviceOwnerToKeychainCache;
- (void)_savePrimaryAndDeviceOwner;
- (void)_saveSharedUsers;
- (void)_setPrimaryUserMeDevice:(BOOL)a3;
- (void)_setPrimaryUserSiriLanguage:(id)a3;
- (void)_setSharedUserMeDevice:(BOOL)a3 forSharedUser:(id)a4;
- (void)_setSharedUserSiriLanguage:(id)a3 forSharedUser:(id)a4;
- (void)_setupMultiUserListener;
- (void)_trackGhostVoiceProfile:(id)a3;
- (void)_trackHomeUserUUIDForInFlightVoiceProfile:(id)a3;
- (void)_untrackAllHomeUserUUIDsForInFlightVoiceProfile;
- (void)_untrackHomeUserUUIDForInFlightVoiceProfile:(id)a3;
- (void)_untrackUUIDsForUser:(id)a3;
- (void)_updateCommunalDeviceUser:(id)a3 withSettings:(id)a4;
- (void)_updateHomeKitSettingsForDeviceOwner;
- (void)_updateMappingsForSharedUser:(id)a3;
- (void)_updateSAMultiUserInfo;
- (void)addDeviceOwner:(id)a3 sharedUserId:(id)a4 loggableSharedUserId:(id)a5 iCloudAltDSID:(id)a6 audioAppSignals:(id)a7 enrollmentName:(id)a8 companionInfo:(id)a9 shareOwnerName:(id)a10 homeMemberSettings:(id)a11 loggingAllowed:(BOOL)a12 completion:(id)a13;
- (void)addUser:(id)a3 sharedUserId:(id)a4 loggableSharedUserId:(id)a5 iCloudAltDSID:(id)a6 enrollmentName:(id)a7 isPrimary:(BOOL)a8 completion:(id)a9;
- (void)addUser:(id)a3 sharedUserId:(id)a4 loggableSharedUserId:(id)a5 iCloudAltDSID:(id)a6 enrollmentName:(id)a7 isPrimary:(BOOL)a8 nonCloudSyncedUser:(BOOL)a9 completion:(id)a10;
- (void)dealloc;
- (void)downloadVoiceProfileForiCloudAltDSID:(id)a3 completion:(id)a4;
- (void)dumpAssistantStateChunk:(id)a3;
- (void)fetchDeviceOwnerAsSAMultiUserInfo:(id)a3;
- (void)getCompanionAssistantIdForRecognizedUser:(id)a3;
- (void)getConformingSharedUserIdForHomeUserId:(id)a3 completion:(id)a4;
- (void)getConformingSharedUserIds:(id)a3;
- (void)getFirstNameForSharedUserId:(id)a3 completion:(id)a4;
- (void)getHomeUserIdForSharedUserId:(id)a3 completion:(id)a4;
- (void)getHomeUserIdOfRecognizedUserWithCompletion:(id)a3;
- (void)getIDSIdentifierForAssistantId:(id)a3 completion:(id)a4;
- (void)getMultiUserAudioAppSignalsForSharedUserID:(id)a3 completion:(id)a4;
- (void)getMultiUserCompanionInfoWithCompletion:(id)a3;
- (void)getMultiUserSettingsForRecognizedUserWithCompletion:(id)a3;
- (void)getMultiUserSettingsForSharedUserID:(id)a3 completion:(id)a4;
- (void)getPreferredMediaUserHomeUserIDWithCompletion:(id)a3;
- (void)getRecognizableUsersConfromingSharedUserIds:(id)a3;
- (void)getSharedUserIdForHomeUserId:(id)a3 completion:(id)a4;
- (void)getSharedUserIdForiCloudAltDSID:(id)a3 completion:(id)a4;
- (void)getSharedUserInfoForSharedUserID:(id)a3 completion:(id)a4;
- (void)getSharedUserInfoForiCloudAltDSID:(id)a3 completion:(id)a4;
- (void)getUserAgentStringForSharedUserID:(id)a3 completion:(id)a4;
- (void)getiCloudAltDSIDOfRecognizedUserWithCompletion:(id)a3;
- (void)homeUserIdToNames:(id)a3;
- (void)refreshHomeKitOnboardedUsers;
- (void)removeDeviceOwner;
- (void)removeUserWithHomeUUID:(id)a3 completion:(id)a4;
- (void)removeUserWithShareOwnerNames:(id)a3 completion:(id)a4;
- (void)removeUserWithSharedUserID:(id)a3 completion:(id)a4;
- (void)resetAllUsers;
- (void)setCachedAssistantDataUnredactedAnchor:(id)a3;
- (void)setDeviceOwner:(id)a3;
- (void)setEnrollmentName:(id)a3 forHomeUser:(id)a4;
- (void)setHomeInfoManager:(id)a3;
- (void)setHomeUserSettings:(id)a3;
- (void)setIsMultiUserInfoDirty:(BOOL)a3;
- (void)setPrimaryUser:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRawScores:(id)a3;
- (void)setShareOwnerName:(id)a3 homeMemberSettings:(id)a4 audioAppSignals:(id)a5 loggingAllowed:(BOOL)a6 forSharedUserId:(id)a7;
- (void)setSharedUsersByHomeUserUUID:(id)a3;
- (void)setSharedUsersBySharedUserID:(id)a3;
- (void)setSharedUsersByiCloudAltDSID:(id)a3;
- (void)setUsersWithAvailableVoiceProfiles:(id)a3;
- (void)setVoiceProfileManager:(id)a3;
- (void)showMultiUserSharedUserIDsCompletion:(id)a3;
- (void)showMultiUsersWithCompletion:(id)a3;
- (void)showPrimaryUserSharedUserIDWithCompletion:(id)a3;
- (void)triggerMultiUserMetricsWithCompletion:(id)a3;
- (void)triggerVoiceProfileUploadWithCompletion:(id)a3;
- (void)updateMultiUserWithSharedUserId:(id)a3 companionInfo:(id)a4 completion:(id)a5;
- (void)updateVoiceProfiles;
- (void)voiceProfilesOutOfSync;
@end

@implementation ADMultiUserService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeInfoManager, 0);
  objc_storeStrong((id *)&self->_sharedUsersByiCloudAltDSID, 0);
  objc_storeStrong((id *)&self->_sharedUsersByHomeUserUUID, 0);
  objc_storeStrong((id *)&self->_usersWithAvailableVoiceProfiles, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_voiceProfileManager, 0);
  objc_storeStrong((id *)&self->_rawScores, 0);
  objc_storeStrong((id *)&self->_cachedAssistantDataUnredactedAnchor, 0);
  objc_storeStrong((id *)&self->_deviceOwner, 0);
  objc_storeStrong((id *)&self->_primaryUser, 0);
  objc_storeStrong((id *)&self->_sharedUsersBySharedUserID, 0);
  objc_storeStrong((id *)&self->_homeUserIDsToBeOnboarded, 0);
  objc_storeStrong((id *)&self->_useriCloudAltDSIDsSettingRmVFromTV, 0);
  objc_storeStrong((id *)&self->_iCloudAltDSIDByHomeUserID, 0);
  objc_storeStrong((id *)&self->_sharedUsersSiriCloudSyncBySharedUserID, 0);
  objc_storeStrong((id *)&self->_sharedUsersSiriLanguageBySharedUserID, 0);
  objc_storeStrong((id *)&self->_primaryUserSiriLanguage, 0);
  objc_storeStrong((id *)&self->_sharedUsersMeDeviceBySharedUserID, 0);
  objc_storeStrong((id *)&self->_adPreferences, 0);
  objc_storeStrong((id *)&self->_instanceContext, 0);
  objc_storeStrong((id *)&self->_currentLanguage, 0);
  objc_storeStrong((id *)&self->_userWithRMVEnabledDuringBuddy, 0);
  objc_storeStrong((id *)&self->_multiUserListener, 0);
  objc_storeStrong((id *)&self->_inFlightVoiceProfilesByUUID, 0);
  objc_storeStrong((id *)&self->_ghostVoiceProfileSharedUserIDs, 0);
  objc_storeStrong((id *)&self->_multiUserInfo, 0);
  objc_storeStrong((id *)&self->_pitchesForHomeMembers, 0);
  objc_storeStrong((id *)&self->_homeUserSettings, 0);
  objc_storeStrong((id *)&self->_saUnknownUser, 0);
}

- (void)setHomeInfoManager:(id)a3
{
}

- (ADHomeInfoManager)homeInfoManager
{
  return self->_homeInfoManager;
}

- (void)setHomeUserSettings:(id)a3
{
}

- (NSMutableDictionary)homeUserSettings
{
  return self->_homeUserSettings;
}

- (void)setSharedUsersByiCloudAltDSID:(id)a3
{
}

- (NSMutableDictionary)sharedUsersByiCloudAltDSID
{
  return self->_sharedUsersByiCloudAltDSID;
}

- (void)setSharedUsersByHomeUserUUID:(id)a3
{
}

- (NSMutableDictionary)sharedUsersByHomeUserUUID
{
  return self->_sharedUsersByHomeUserUUID;
}

- (void)setUsersWithAvailableVoiceProfiles:(id)a3
{
}

- (NSMutableArray)usersWithAvailableVoiceProfiles
{
  return self->_usersWithAvailableVoiceProfiles;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setVoiceProfileManager:(id)a3
{
}

- (SSRVoiceProfileManager)voiceProfileManager
{
  return self->_voiceProfileManager;
}

- (void)setRawScores:(id)a3
{
}

- (NSDictionary)rawScores
{
  return self->_rawScores;
}

- (void)setCachedAssistantDataUnredactedAnchor:(id)a3
{
}

- (NSString)cachedAssistantDataUnredactedAnchor
{
  return self->_cachedAssistantDataUnredactedAnchor;
}

- (void)setIsMultiUserInfoDirty:(BOOL)a3
{
  self->_isMultiUserInfoDirty = a3;
}

- (BOOL)isMultiUserInfoDirty
{
  return self->_isMultiUserInfoDirty;
}

- (void)setDeviceOwner:(id)a3
{
}

- (ADCommunalDeviceUser)deviceOwner
{
  return self->_deviceOwner;
}

- (ADCommunalDeviceUser)primaryUser
{
  return self->_primaryUser;
}

- (void)setSharedUsersBySharedUserID:(id)a3
{
}

- (NSMutableDictionary)sharedUsersBySharedUserID
{
  return self->_sharedUsersBySharedUserID;
}

- (id)_confidenceScoreForSharedUserID:(id)a3 expectedSpeakerSharedUserID:(id)a4 expectedSpeakerConfidenceScore:(int64_t)a5 confidenceScores:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = objc_alloc_init((Class)SAUserConfidenceScore);
  v13 = [v9 uppercaseString];
  [v12 setSharedUserId:v13];

  v14 = [v9 uppercaseString];
  v15 = [v11 objectForKey:v14];

  if (v15)
  {
    id v16 = [v15 integerValue];
  }
  else if ([v10 caseInsensitiveCompare:v9])
  {
    id v16 = 0;
  }
  else
  {
    id v16 = (id)a5;
  }
  [v12 setConfidenceScore:v16];

  return v12;
}

- (id)confidenceScoresForMultiUserTestingExpectedSpeakerSharedUserID:(id)a3 expectedSpeakerConfidenceScore:(int64_t)a4 nonspeakerConfidenceScores:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = sub_10029065C;
  v24 = sub_10029066C;
  id v25 = objc_alloc_init((Class)NSMutableArray);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100290674;
  block[3] = &unk_100509B00;
  block[4] = self;
  id v16 = v8;
  v18 = &v20;
  int64_t v19 = a4;
  id v17 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_sync(queue, block);
  id v13 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  return v13;
}

- (void)getSharedUserIdForiCloudAltDSID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1002908FC;
    v9[3] = &unk_100509AD8;
    id v11 = v7;
    id v10 = v6;
    [(ADMultiUserService *)self getSharedUserInfoForiCloudAltDSID:v10 completion:v9];
  }
}

- (void)getSharedUserInfoForiCloudAltDSID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100290AF4;
    block[3] = &unk_10050E1D8;
    id v10 = v6;
    id v11 = self;
    id v12 = v7;
    dispatch_async(queue, block);
  }
}

- (void)getSharedUserInfoForSharedUserID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100290FE4;
    block[3] = &unk_10050E1D8;
    id v10 = v6;
    id v11 = self;
    id v12 = v7;
    dispatch_async(queue, block);
  }
}

- (id)currentOwnerSharedUserID
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_10029065C;
  id v10 = sub_10029066C;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100291218;
  v5[3] = &unk_10050D5F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)getAssistantIdentifierForIDS:(id)a3
{
  id v4 = a3;
  v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v33 = "-[ADMultiUserService getAssistantIdentifierForIDS:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
    if (!v4) {
      goto LABEL_29;
    }
  }
  else if (!v4)
  {
    goto LABEL_29;
  }
  if (AFSupportsMultiUser())
  {
    primaryUser = self->_primaryUser;
    if (primaryUser)
    {
      id v7 = [(ADCommunalDeviceUser *)primaryUser companionIDSIdentifier];
      unsigned int v8 = [v7 isEqualToString:v4];

      if (v8)
      {
        id v9 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315138;
          v33 = "-[ADMultiUserService getAssistantIdentifierForIDS:]";
          _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%s Matched primary user companion", buf, 0xCu);
        }
        id v10 = self->_primaryUser;
LABEL_14:
        v15 = [(ADCommunalDeviceUser *)v10 companionAssistantID];
        goto LABEL_30;
      }
    }
    deviceOwner = self->_deviceOwner;
    if (deviceOwner)
    {
      id v12 = [(ADCommunalDeviceUser *)deviceOwner companionIDSIdentifier];
      unsigned int v13 = [v12 isEqualToString:v4];

      if (v13)
      {
        v14 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315138;
          v33 = "-[ADMultiUserService getAssistantIdentifierForIDS:]";
          _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "%s Matched device owner companion", buf, 0xCu);
        }
        id v10 = self->_deviceOwner;
        goto LABEL_14;
      }
    }
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v16 = self->_sharedUsersBySharedUserID;
    id v17 = [(NSMutableDictionary *)v16 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v28;
      while (2)
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v28 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = -[NSMutableDictionary objectForKey:](self->_sharedUsersBySharedUserID, "objectForKey:", *(void *)(*((void *)&v27 + 1) + 8 * i), (void)v27);
          uint64_t v22 = [v21 companionIDSIdentifier];
          unsigned int v23 = [v22 isEqualToString:v4];

          if (v23)
          {
            id v25 = AFSiriLogContextDaemon;
            if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315138;
              v33 = "-[ADMultiUserService getAssistantIdentifierForIDS:]";
              _os_log_debug_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "%s Matched secondary user companion", buf, 0xCu);
            }
            v15 = [v21 companionAssistantID];

            goto LABEL_30;
          }
        }
        id v18 = [(NSMutableDictionary *)v16 countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v18) {
          continue;
        }
        break;
      }
    }

    v24 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v33 = "-[ADMultiUserService getAssistantIdentifierForIDS:]";
      _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%s Primary user not present or home user not found", buf, 0xCu);
    }
  }
LABEL_29:
  v15 = 0;
LABEL_30:

  return v15;
}

- (void)getIDSIdentifierForAssistantId:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    unsigned int v8 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      id v16 = "-[ADMultiUserService getIDSIdentifierForAssistantId:completion:]";
      _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
      if (!v6) {
        goto LABEL_7;
      }
    }
    else if (!v6)
    {
      goto LABEL_7;
    }
    if (AFSupportsMultiUser())
    {
      queue = self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1002917A8;
      block[3] = &unk_10050E1D8;
      id v12 = v6;
      unsigned int v13 = self;
      id v14 = v7;
      dispatch_async(queue, block);

      id v10 = v12;
LABEL_8:

      goto LABEL_9;
    }
LABEL_7:
    id v10 = +[NSError errorWithDomain:kAFAssistantErrorDomain code:6002 userInfo:&__NSDictionary0__struct];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v10);
    goto LABEL_8;
  }
LABEL_9:
}

- (void)getPreferredMediaUserHomeUserIDWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void, void *))a3;
  if (v4)
  {
    if ((AFSupportsMultiUser() & 1) == 0)
    {
      id v7 = +[NSError errorWithDomain:kAFAssistantErrorDomain code:6004 userInfo:&__NSDictionary0__struct];
      v4[2](v4, 0, v7);
LABEL_12:

      goto LABEL_13;
    }
    v5 = +[ADHomeInfoManager sharedInfoManager];
    id v6 = [v5 preferredMediaUserInfo];
    id v7 = [v6 preferredMediaUserSharedUserID];

    unsigned int v8 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      CFStringRef v10 = @"nil";
      if (v7) {
        CFStringRef v10 = v7;
      }
      *(_DWORD *)buf = 136315395;
      id v14 = "-[ADMultiUserService getPreferredMediaUserHomeUserIDWithCompletion:]";
      __int16 v15 = 2113;
      CFStringRef v16 = v10;
      _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%s preferredMediaUserSharedUserID (%{private}@)", buf, 0x16u);
      if (v7) {
        goto LABEL_5;
      }
    }
    else if (v7)
    {
LABEL_5:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_100291D30;
      v11[3] = &unk_100509AB0;
      id v12 = v4;
      [(ADMultiUserService *)self getHomeUserIdForSharedUserId:v7 completion:v11];
      id v9 = v12;
LABEL_11:

      goto LABEL_12;
    }
    id v9 = +[AFError errorWithCode:6200 description:@"Unable to determine the preferred media user"];
    v4[2](v4, 0, v9);
    goto LABEL_11;
  }
LABEL_13:
}

- (void)homeUserIdToNames:(id)a3
{
  id v6 = (void (**)(id, void *, void))a3;
  id v4 = [(ADMultiUserService *)self homeUserIdToNames];
  if (v4)
  {
    v6[2](v6, v4, 0);
  }
  else
  {
    v5 = +[NSError errorWithDomain:kAFAssistantErrorDomain code:6001 userInfo:0];
    ((void (**)(id, void *, void *))v6)[2](v6, 0, v5);
  }
}

- (void)getMultiUserAudioAppSignalsForSharedUserID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (v6 && (AFSupportsMultiUser() & 1) != 0)
    {
      queue = self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100291F24;
      block[3] = &unk_10050E1D8;
      void block[4] = self;
      id v12 = v7;
      id v11 = v6;
      dispatch_async(queue, block);
    }
    else
    {
      id v9 = +[NSError errorWithDomain:kAFAssistantErrorDomain code:6002 userInfo:&__NSDictionary0__struct];
      (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v9);
    }
  }
}

- (void)getMultiUserSettingsForSharedUserID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (v6 && (AFSupportsMultiUser() & 1) != 0)
    {
      queue = self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1002922E0;
      block[3] = &unk_10050E1D8;
      void block[4] = self;
      id v11 = v6;
      id v12 = v7;
      dispatch_async(queue, block);
    }
    else
    {
      id v9 = +[NSError errorWithDomain:kAFAssistantErrorDomain code:6002 userInfo:&__NSDictionary0__struct];
      (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v9);
    }
  }
}

- (void)getCompanionAssistantIdForRecognizedUser:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (AFSupportsMultiUser())
    {
      queue = self->_queue;
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_100292794;
      v7[3] = &unk_10050E188;
      v7[4] = self;
      id v8 = v4;
      dispatch_async(queue, v7);
    }
    else
    {
      id v6 = +[NSError errorWithDomain:kAFAssistantErrorDomain code:6004 userInfo:&__NSDictionary0__struct];
      (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v6);
    }
  }
}

- (void)getMultiUserSettingsForRecognizedUserWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (AFSupportsMultiUser())
    {
      queue = self->_queue;
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_100292BD0;
      v7[3] = &unk_10050E188;
      v7[4] = self;
      id v8 = v4;
      dispatch_async(queue, v7);
    }
    else
    {
      id v6 = +[NSError errorWithDomain:kAFAssistantErrorDomain code:6004 userInfo:&__NSDictionary0__struct];
      (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v6);
    }
  }
}

- (void)getiCloudAltDSIDOfRecognizedUserWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (AFSupportsMultiUser())
    {
      queue = self->_queue;
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_100292ED4;
      v7[3] = &unk_10050E188;
      v7[4] = self;
      id v8 = v4;
      dispatch_async(queue, v7);
    }
    else
    {
      id v6 = +[NSError errorWithDomain:kAFAssistantErrorDomain code:6004 userInfo:&__NSDictionary0__struct];
      (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v6);
    }
  }
}

- (void)getHomeUserIdOfRecognizedUserWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (AFSupportsMultiUser())
    {
      queue = self->_queue;
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_100293310;
      v7[3] = &unk_10050E188;
      v7[4] = self;
      id v8 = v4;
      dispatch_async(queue, v7);
    }
    else
    {
      id v6 = +[NSError errorWithDomain:kAFAssistantErrorDomain code:6004 userInfo:&__NSDictionary0__struct];
      (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v6);
    }
  }
}

- (void)getRecognizableUsersConfromingSharedUserIds:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (AFSupportsMultiUser())
    {
      queue = self->_queue;
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_10029388C;
      v7[3] = &unk_10050E188;
      v7[4] = self;
      id v8 = v4;
      dispatch_async(queue, v7);
    }
    else
    {
      id v6 = +[NSError errorWithDomain:kAFAssistantErrorDomain code:13 userInfo:&__NSDictionary0__struct];
      (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v6);
    }
  }
}

- (void)getConformingSharedUserIds:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (AFSupportsMultiUser())
    {
      queue = self->_queue;
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_100293E14;
      v7[3] = &unk_10050E188;
      v7[4] = self;
      id v8 = v4;
      dispatch_async(queue, v7);
    }
    else
    {
      id v6 = +[NSError errorWithDomain:kAFAssistantErrorDomain code:6002 userInfo:&__NSDictionary0__struct];
      (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v6);
    }
  }
}

- (void)getConformingSharedUserIdForHomeUserId:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (v6 && (AFSupportsMultiUser() & 1) != 0)
    {
      queue = self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1002943A4;
      block[3] = &unk_10050E1D8;
      void block[4] = self;
      id v11 = v6;
      id v12 = v7;
      dispatch_async(queue, block);
    }
    else
    {
      id v9 = +[NSError errorWithDomain:kAFAssistantErrorDomain code:6002 userInfo:&__NSDictionary0__struct];
      (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v9);
    }
  }
}

- (void)getFirstNameForSharedUserId:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (v6 && (AFSupportsMultiUser() & 1) != 0)
    {
      queue = self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1002947BC;
      block[3] = &unk_10050E1D8;
      id v11 = v6;
      id v12 = self;
      id v13 = v7;
      dispatch_async(queue, block);
    }
    else
    {
      id v9 = +[NSError errorWithDomain:kAFAssistantErrorDomain code:6002 userInfo:&__NSDictionary0__struct];
      (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v9);
    }
  }
}

- (void)getSharedUserIdForHomeUserId:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315395;
      __int16 v15 = "-[ADMultiUserService getSharedUserIdForHomeUserId:completion:]";
      __int16 v16 = 2113;
      id v17 = v6;
      _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%s Retrieving shared user id for homeUserId = %{private}@", buf, 0x16u);
      if (!v6) {
        goto LABEL_7;
      }
    }
    else if (!v6)
    {
      goto LABEL_7;
    }
    if (AFSupportsMultiUser())
    {
      queue = self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100294B28;
      block[3] = &unk_10050E1D8;
      void block[4] = self;
      id v12 = v6;
      id v13 = v7;
      dispatch_async(queue, block);

      goto LABEL_8;
    }
LABEL_7:
    CFStringRef v10 = +[NSError errorWithDomain:kAFAssistantErrorDomain code:6002 userInfo:&__NSDictionary0__struct];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v10);
  }
LABEL_8:
}

- (void)getHomeUserIdForSharedUserId:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315395;
      __int16 v15 = "-[ADMultiUserService getHomeUserIdForSharedUserId:completion:]";
      __int16 v16 = 2113;
      id v17 = v6;
      _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%s %{private}@", buf, 0x16u);
      if (!v6) {
        goto LABEL_7;
      }
    }
    else if (!v6)
    {
      goto LABEL_7;
    }
    if (AFSupportsMultiUser())
    {
      queue = self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100294FE4;
      block[3] = &unk_10050E1D8;
      void block[4] = self;
      id v12 = v6;
      id v13 = v7;
      dispatch_async(queue, block);

      goto LABEL_8;
    }
LABEL_7:
    CFStringRef v10 = +[NSError errorWithDomain:kAFAssistantErrorDomain code:6002 userInfo:&__NSDictionary0__struct];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v10);
  }
LABEL_8:
}

- (BOOL)getAllowExplicitContentSettingForRecognizedUser
{
  uint64_t v9 = 0;
  CFStringRef v10 = &v9;
  uint64_t v11 = 0x2020000000;
  unsigned __int8 v12 = 0;
  id v3 = +[ADPreferences sharedPreferences];
  unsigned __int8 v4 = [v3 allowExplicitContent];

  unsigned __int8 v12 = v4;
  if (AFSupportsMultiUser())
  {
    queue = self->_queue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1002953A0;
    v8[3] = &unk_10050D5F0;
    v8[4] = self;
    v8[5] = &v9;
    dispatch_sync(queue, v8);
  }
  char v6 = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v6;
}

- (id)getSharedUserIdForHomeUserId:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    uint64_t v12 = 0;
    id v13 = &v12;
    uint64_t v14 = 0x3032000000;
    __int16 v15 = sub_10029065C;
    __int16 v16 = sub_10029066C;
    id v17 = 0;
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100295728;
    block[3] = &unk_10050C700;
    void block[4] = self;
    id v10 = v4;
    uint64_t v11 = &v12;
    dispatch_sync(queue, block);
    id v7 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)getSyncableSharedUserIdsForSharedUserIds:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  __int16 v16 = sub_10029065C;
  id v17 = sub_10029066C;
  id v18 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100295950;
  block[3] = &unk_10050C700;
  id v10 = v4;
  uint64_t v11 = self;
  uint64_t v12 = &v13;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

- (id)getSyncableSharedUserIdForSharedUserId:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  __int16 v16 = sub_10029065C;
  id v17 = sub_10029066C;
  id v18 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100295C34;
  block[3] = &unk_10050C700;
  id v10 = v4;
  uint64_t v11 = self;
  uint64_t v12 = &v13;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

- (id)getSharedUserIdForShareOwnerName:(id)a3
{
  id v4 = a3;
  v5 = v4;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = sub_10029065C;
  __int16 v16 = sub_10029066C;
  id v17 = 0;
  if (v4)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100295E70;
    block[3] = &unk_10050C700;
    void block[4] = self;
    id v10 = v4;
    uint64_t v11 = &v12;
    dispatch_sync(queue, block);
    id v7 = (id)v13[5];
  }
  else
  {
    id v7 = 0;
  }
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (BOOL)_profileLimitReached
{
  id v3 = (char *)[(NSMutableDictionary *)self->_sharedUsersBySharedUserID count];
  if (self->_primaryUser) {
    id v4 = v3 + 1;
  }
  else {
    id v4 = v3;
  }
  return (unint64_t)v4 >= AFMultiUserServiceUserProfileLimit;
}

- (void)setShareOwnerName:(id)a3 homeMemberSettings:(id)a4 audioAppSignals:(id)a5 loggingAllowed:(BOOL)a6 forSharedUserId:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  queue = self->_queue;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100296190;
  v21[3] = &unk_100509A60;
  v21[4] = self;
  id v22 = v15;
  BOOL v26 = a6;
  id v23 = v12;
  id v24 = v13;
  id v25 = v14;
  id v17 = v14;
  id v18 = v13;
  id v19 = v12;
  id v20 = v15;
  dispatch_async(queue, v21);
}

- (void)setEnrollmentName:(id)a3 forHomeUser:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6 && v7)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10029638C;
    block[3] = &unk_10050DCB8;
    void block[4] = self;
    id v11 = v7;
    id v12 = v6;
    dispatch_async(queue, block);
  }
}

- (void)updateMultiUserWithSharedUserId:(id)a3 companionInfo:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[ADMultiUserService updateMultiUserWithSharedUserId:companionInfo:completion:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&buf, 0xCu);
  }
  if (AFSupportsMultiUser())
  {
    id v12 = [v9 assistantID];
    id v13 = [v9 speechID];
    id v14 = [v9 idsIdentifier];
    long long v29 = [v9 productPrefix];
    long long v28 = [v9 aceHost];
    BOOL v26 = [v9 syncMetadata];
    v31 = v12;
    id v32 = v8;
    long long v30 = v13;
    if ([v9 meDevice])
    {
      unsigned __int8 v24 = [v9 meDevice];
    }
    else
    {
      __int16 v16 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 136315138;
        *(void *)((char *)&buf + 4) = "-[ADMultiUserService updateMultiUserWithSharedUserId:companionInfo:completion:]";
        _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s meDevice field not found", (uint8_t *)&buf, 0xCu);
      }
      unsigned __int8 v24 = 1;
    }
    id v17 = [v9 siriLanguage];
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v53 = 0x3032000000;
    v54 = sub_10029065C;
    v55 = sub_10029066C;
    id v56 = 0;
    v50[0] = 0;
    v50[1] = v50;
    v50[2] = 0x3032000000;
    v50[3] = sub_10029065C;
    v50[4] = sub_10029066C;
    id v51 = 0;
    v48[0] = 0;
    v48[1] = v48;
    v48[2] = 0x2020000000;
    char v49 = 0;
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100296848;
    block[3] = &unk_100509A38;
    void block[4] = self;
    id v34 = v8;
    id v35 = v12;
    id v36 = v13;
    id v37 = v14;
    id v38 = v29;
    id v39 = v28;
    v45 = v48;
    p_long long buf = &buf;
    v44 = v50;
    id v40 = v26;
    id v41 = v9;
    id v42 = v17;
    unsigned __int8 v47 = v24;
    id v43 = v10;
    id v25 = v17;
    id v27 = v26;
    id v18 = v28;
    id v19 = v29;
    id v20 = v14;
    id v21 = v30;
    id v22 = v31;
    dispatch_async(queue, block);

    _Block_object_dispose(v48, 8);
    _Block_object_dispose(v50, 8);

    _Block_object_dispose(&buf, 8);
    id v8 = v32;
  }
  else
  {
    id v15 = +[NSError errorWithDomain:kAFAssistantErrorDomain code:6004 userInfo:&__NSDictionary0__struct];
    if (v10) {
      (*((void (**)(id, void *))v10 + 2))(v10, v15);
    }
  }
}

- (void)triggerMultiUserMetricsWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (AFSupportsMultiUser())
    {
      if ([(ADMultiUserService *)self _isCurrentLanguageMultiUserCompatible])
      {
        v5 = +[ADHomeInfoManager sharedInfoManager];
        v9[0] = _NSConcreteStackBlock;
        v9[1] = 3221225472;
        v9[2] = sub_100297A8C;
        v9[3] = &unk_10050D300;
        void v9[4] = self;
        id v10 = v4;
        [v5 getVoiceSettingsForHomeMembers:v9];

        goto LABEL_8;
      }
      uint64_t v6 = kAFAssistantErrorDomain;
      uint64_t v7 = 6012;
    }
    else
    {
      uint64_t v6 = kAFAssistantErrorDomain;
      uint64_t v7 = 6004;
    }
    id v8 = +[NSError errorWithDomain:v6 code:v7 userInfo:&__NSDictionary0__struct];
    (*((void (**)(id, void *))v4 + 2))(v4, v8);
  }
LABEL_8:
}

- (void)updateVoiceProfiles
{
  id v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 136315138;
    uint64_t v7 = "-[ADMultiUserService updateVoiceProfiles]";
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100298034;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)_removeGhostVoiceProfiles
{
  ghostVoiceProfileSharedUserIDs = self->_ghostVoiceProfileSharedUserIDs;
  if (ghostVoiceProfileSharedUserIDs)
  {
    if ([(NSMutableSet *)ghostVoiceProfileSharedUserIDs count])
    {
      id v4 = self->_ghostVoiceProfileSharedUserIDs;
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_100298120;
      v6[3] = &unk_1005099A8;
      v6[4] = self;
      [(NSMutableSet *)v4 enumerateObjectsUsingBlock:v6];
      [(NSMutableSet *)self->_ghostVoiceProfileSharedUserIDs removeAllObjects];
      v5 = self->_ghostVoiceProfileSharedUserIDs;
      self->_ghostVoiceProfileSharedUserIDs = 0;
    }
  }
}

- (void)_trackGhostVoiceProfile:(id)a3
{
  id v4 = a3;
  v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 136315395;
    id v10 = "-[ADMultiUserService _trackGhostVoiceProfile:]";
    __int16 v11 = 2113;
    id v12 = v4;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s sharedUserID %{private}@", (uint8_t *)&v9, 0x16u);
  }
  ghostVoiceProfileSharedUserIDs = self->_ghostVoiceProfileSharedUserIDs;
  if (!ghostVoiceProfileSharedUserIDs)
  {
    uint64_t v7 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    id v8 = self->_ghostVoiceProfileSharedUserIDs;
    self->_ghostVoiceProfileSharedUserIDs = v7;

    ghostVoiceProfileSharedUserIDs = self->_ghostVoiceProfileSharedUserIDs;
  }
  [(NSMutableSet *)ghostVoiceProfileSharedUserIDs addObject:v4];
}

- (id)_getUserAgentStringForSharedUserID:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    uint64_t v7 = 0;
    goto LABEL_10;
  }
  primaryUser = [(NSMutableDictionary *)self->_sharedUsersBySharedUserID objectForKey:v4];
  uint64_t v6 = primaryUser;
  if (!primaryUser)
  {
    id v8 = [(ADCommunalDeviceUser *)self->_primaryUser sharedUserID];
    unsigned int v9 = [v8 isEqualToString:v4];

    if (!v9)
    {
      uint64_t v7 = 0;
      goto LABEL_9;
    }
    primaryUser = self->_primaryUser;
  }
  uint64_t v7 = [primaryUser productPrefix];
LABEL_9:

LABEL_10:
  return v7;
}

- (void)getUserAgentStringForSharedUserID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6 && v7)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100298490;
    block[3] = &unk_10050E1D8;
    void block[4] = self;
    id v11 = v6;
    id v12 = v8;
    dispatch_async(queue, block);
  }
}

- (id)getUserAgentStringForSharedUserID:(id)a3
{
  id v4 = a3;
  v5 = v4;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  __int16 v16 = sub_10029065C;
  id v17 = sub_10029066C;
  id v18 = 0;
  if (v4)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10029861C;
    block[3] = &unk_10050C700;
    id v12 = &v13;
    void block[4] = self;
    id v11 = v4;
    dispatch_sync(queue, block);

    id v7 = (void *)v14[5];
  }
  else
  {
    id v7 = 0;
  }
  id v8 = v7;
  _Block_object_dispose(&v13, 8);

  return v8;
}

- (void)setPrimaryUser:(id)a3
{
  id v5 = a3;
  dispatch_get_current_queue();
  id v6 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;

  if (v6 == queue)
  {
    objc_storeStrong((id *)&self->_primaryUser, a3);
  }
  else
  {
    id v8 = self->_queue;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100298748;
    v9[3] = &unk_10050E160;
    void v9[4] = self;
    id v10 = v5;
    dispatch_sync(v8, v9);
  }
}

- (void)voiceProfilesOutOfSync
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002987C8;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)resetAllUsers
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100298B28;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (id)validateAndReturnScores:(id)a3 classifiedUser:(id)a4 donatedScores:(id)a5 unknownUserSharedId:(id *)a6 totalUsers:(unint64_t *)a7 ghostVoiceProfileDetected:(BOOL *)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  __int16 v16 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ADMultiUserService validateAndReturnScores:classifiedUser:donatedScores:unknownUserSharedId:t"
                         "otalUsers:ghostVoiceProfileDetected:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v13;
    _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "%s Incoming scores %@", buf, 0x16u);
  }
  id v17 = objc_alloc_init((Class)NSMutableDictionary);
  id v18 = +[NSMutableDictionary dictionary];
  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v52 = sub_10029065C;
  uint64_t v53 = sub_10029066C;
  id v54 = 0;
  uint64_t v41 = 0;
  id v42 = &v41;
  uint64_t v43 = 0x2020000000;
  uint64_t v44 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100299108;
  block[3] = &unk_100509980;
  void block[4] = self;
  id v38 = &v41;
  id v20 = v14;
  id v33 = v20;
  id v40 = a8;
  id v21 = v13;
  id v34 = v21;
  id v22 = v15;
  id v35 = v22;
  id v23 = v18;
  id v36 = v23;
  id v24 = v17;
  id v37 = v24;
  id v39 = buf;
  dispatch_sync(queue, block);
  id v25 = +[AFAnalytics sharedAnalytics];
  v49[0] = @"local_scores";
  v49[1] = @"donated_scores";
  v50[0] = v24;
  v50[1] = v23;
  BOOL v26 = +[NSDictionary dictionaryWithObjects:v50 forKeys:v49 count:2];
  [v25 logEventWithType:6115 context:v26];

  id v27 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v45 = 136315394;
    v46 = "-[ADMultiUserService validateAndReturnScores:classifiedUser:donatedScores:unknownUserSharedId:totalUsers:ghost"
          "VoiceProfileDetected:]";
    __int16 v47 = 2112;
    id v48 = v24;
    _os_log_debug_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "%s (%@)", v45, 0x16u);
    id v27 = AFSiriLogContextDaemon;
  }
  if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    if (!a6) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  *(_DWORD *)v45 = 136315395;
  v46 = "-[ADMultiUserService validateAndReturnScores:classifiedUser:donatedScores:unknownUserSharedId:totalUsers:ghostVo"
        "iceProfileDetected:]";
  __int16 v47 = 2113;
  id v48 = v23;
  _os_log_debug_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "%s (%{private}@)", v45, 0x16u);
  if (a6) {
LABEL_7:
  }
    *a6 = *(id *)(*(void *)&buf[8] + 40);
LABEL_8:
  if (a7) {
    *a7 = v42[3];
  }
  long long v28 = v37;
  id v29 = v24;

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(buf, 8);

  return v29;
}

- (id)sharedRemoteDevices
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  queue = self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10029986C;
  v9[3] = &unk_10050E160;
  void v9[4] = self;
  id v5 = v3;
  id v10 = v5;
  dispatch_sync(queue, v9);
  id v6 = v10;
  id v7 = v5;

  return v7;
}

- (id)_generateDeviceUserWithHomeUserUUID:(id)a3 sharedUserId:(id)a4 loggableSharedUserId:(id)a5 adaccount:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v37 = 136315138;
    id v38 = "-[ADMultiUserService _generateDeviceUserWithHomeUserUUID:sharedUserId:loggableSharedUserId:adaccount:]";
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v37, 0xCu);
  }
  id v15 = +[ADAssistantDataManager sharedDataManager];
  __int16 v16 = [v15 _cachedAssistantData];
  id v17 = [[ADCommunalDeviceUser alloc] init:v10 sharedUserId:v11 loggableSharedUserId:v12 iCloudAltDSID:0 attribute:0];
  id v18 = [v15 unredactedAnchor];
  cachedAssistantDataUnredactedAnchor = self->_cachedAssistantDataUnredactedAnchor;
  self->_cachedAssistantDataUnredactedAnchor = v18;

  [v17 setEnrollmentName:@"primary_user"];
  id v20 = [v13 aceHost];
  [v17 setAceHost:v20];

  id v21 = [v13 speechIdentifier];
  [v17 setSpeechID:v21];

  id v22 = [v13 peerAssistantIdentifier];
  [v17 setCompanionAssistantID:v22];

  id v23 = [v13 peerSpeechIdentifier];
  [v17 setCompanionSpeechID:v23];

  [v17 setVoiceIDAllowedByUser:0];
  id v24 = objc_alloc_init((Class)SAHomeMemberSettings);
  id v25 = [v16 region];
  [v24 setRegion:v25];

  BOOL v26 = [v16 ttsVoice];
  [v24 setTtsVoice:v26];

  id v27 = [v16 twentyFourHourTimeDisplay];
  [v24 setTwentyFourHourTimeDisplay:v27];

  long long v28 = [v16 temperatureUnit];
  [v24 setTemperatureUnit:v28];

  id v29 = [v16 countryCode];
  [v24 setCountryCode:v29];

  long long v30 = [v16 parentalRestrictions];
  [v24 setParentalRestrictions:v30];

  objc_msgSend(v24, "setMediaPlayerExplicitContentDisallowed:", objc_msgSend(v16, "mediaPlayerExplicitContentDisallowed"));
  v31 = [v15 _unredactedMeCards];
  id v32 = [v31 count];

  if (v32)
  {
    id v33 = [v15 _unredactedMeCards];
    id v34 = [v33 objectAtIndexedSubscript:0];
    [v24 setMeCard:v34];
  }
  id v35 = [v24 dictionary];
  [v17 setSettings:v35];

  return v17;
}

- (void)fetchDeviceOwnerAsSAMultiUserInfo:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  if (v4)
  {
    if (self->_deviceOwner)
    {
      id v5 = +[ADCommunalDeviceUser saMultiUserInfo:](ADCommunalDeviceUser, "saMultiUserInfo:");
      v4[2](v4, v5);
    }
    else
    {
      id v6 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 136315138;
        id v11 = "-[ADMultiUserService fetchDeviceOwnerAsSAMultiUserInfo:]";
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s Device Owner does not exist. Falling back to creating an ephemeral device owner", buf, 0xCu);
      }
      id v7 = +[ADCommandCenter sharedCommandCenter];
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_10029A038;
      v8[3] = &unk_100509930;
      v8[4] = self;
      unsigned int v9 = v4;
      [v7 fetchActiveAccount:v8];
    }
  }
}

- (id)multiUserSAObject
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  unsigned int v9 = sub_10029065C;
  id v10 = sub_10029066C;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10029A320;
  v5[3] = &unk_10050D5F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)dumpAssistantStateChunk:(id)a3
{
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10029A5E8;
  v25[3] = &unk_10050D080;
  id v19 = a3;
  id v26 = v19;
  id v18 = objc_retainBlock(v25);
  id v4 = self;
  id v5 = [(ADMultiUserService *)self allUsersBySharedUserID];
  id v20 = +[SSRVoiceProfileManager sharedInstance];
  id v6 = objc_alloc_init((Class)NSMutableDictionary);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        id v13 = [v7 objectForKey:v12];
        id v14 = objc_alloc((Class)NSMutableDictionary);
        id v15 = [v13 dictionaryRepresentation];
        id v16 = [v14 initWithDictionary:v15 copyItems:1];

        LODWORD(v15) = [v20 isSATEnrolledForSiriProfileId:v12 forLanguageCode:v4->_currentLanguage];
        [v16 removeObjectForKey:@"homeMemberSettings"];
        if (v15) {
          CFStringRef v17 = @"YES";
        }
        else {
          CFStringRef v17 = @"NO";
        }
        [v16 setObject:v17 forKey:@"isSATEnrolledForSiriProfileId"];
        [v6 setObject:v16 forKey:v12];
      }
      id v9 = [v7 countByEnumeratingWithState:&v21 objects:v27 count:16];
    }
    while (v9);
  }

  ((void (*)(void *, id))v18[2])(v18, v6);
}

- (void)showMultiUserSharedUserIDsCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10029A6A8;
    v7[3] = &unk_10050E188;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)showPrimaryUserSharedUserIDWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10029A8D8;
    v7[3] = &unk_10050E188;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)getMultiUserCompanionInfoWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10029A9F8;
    v7[3] = &unk_10050E188;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)showMultiUsersWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10029ACF4;
    v7[3] = &unk_10050E188;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (id)_augmentUserPropertiesWithHomeInfoForUser:(id)a3
{
  id v3 = a3;
  id v4 = [v3 userProperties];
  id v5 = [v4 mutableCopy];

  id v6 = [v3 homeUserUUID];

  if (v6)
  {
    id v7 = +[ADHomeInfoManager sharedInfoManager];
    id v8 = [v7 currentHome];

    id v9 = [v8 name];

    if (v9)
    {
      uint64_t v10 = [v8 name];
      [v5 setObject:v10 forKey:@"homeName"];
    }
    id v11 = [v8 uniqueIdentifier];

    if (v11)
    {
      uint64_t v12 = [v8 uniqueIdentifier];
      id v13 = [v12 UUIDString];
      [v5 setObject:v13 forKey:@"homeId"];
    }
  }
  return v5;
}

- (id)homeUserIdToNames
{
  id v28 = objc_alloc_init((Class)NSMutableDictionary);
  if (!self->_primaryUser) {
    goto LABEL_8;
  }
  id v3 = +[ADCommunalDeviceUser saHomeMemberInfo:](ADCommunalDeviceUser, "saHomeMemberInfo:");
  id v4 = [v3 homeMemberSettings];
  id v5 = [v4 meCard];

  if (!v5)
  {
    id v8 = (void *)AFSiriLogContextConnection;
    if (!os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_7;
    }
    primaryUser = self->_primaryUser;
    id v7 = v8;
    id v26 = [(ADCommunalDeviceUser *)primaryUser homeUserUUID];
    *(_DWORD *)long long buf = 136315395;
    id v35 = "-[ADMultiUserService homeUserIdToNames]";
    __int16 v36 = 2113;
    int v37 = v26;
    _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%s Empty meCard for homeUserId %{private}@", buf, 0x16u);

    goto LABEL_5;
  }
  id v6 = [(ADCommunalDeviceUser *)self->_primaryUser homeUserUUID];

  if (v6)
  {
    id v7 = [(ADCommunalDeviceUser *)self->_primaryUser homeUserUUID];
    [v28 setObject:v5 forKey:v7];
LABEL_5:
  }
LABEL_7:

LABEL_8:
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v9 = self->_sharedUsersByHomeUserUUID;
  id v10 = [(NSMutableDictionary *)v9 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (!v10) {
    goto LABEL_22;
  }
  id v12 = v10;
  uint64_t v13 = *(void *)v30;
  *(void *)&long long v11 = 136315395;
  long long v27 = v11;
  do
  {
    id v14 = 0;
    do
    {
      if (*(void *)v30 != v13) {
        objc_enumerationMutation(v9);
      }
      id v15 = -[NSMutableDictionary objectForKey:](self->_sharedUsersByHomeUserUUID, "objectForKey:", *(void *)(*((void *)&v29 + 1) + 8 * (void)v14), v27);
      id v16 = +[ADCommunalDeviceUser saHomeMemberInfo:v15];
      CFStringRef v17 = [v16 homeMemberSettings];
      id v18 = [v17 meCard];

      if (v18)
      {
        id v19 = [v15 homeUserUUID];

        if (!v19) {
          goto LABEL_18;
        }
        id v20 = [v15 homeUserUUID];
        [v28 setObject:v18 forKey:v20];
        goto LABEL_16;
      }
      long long v21 = (void *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
      {
        id v20 = v21;
        long long v22 = [v15 homeUserUUID];
        *(_DWORD *)long long buf = v27;
        id v35 = "-[ADMultiUserService homeUserIdToNames]";
        __int16 v36 = 2113;
        int v37 = v22;
        _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "%s Empty meCard for homeUserId %{private}@", buf, 0x16u);

LABEL_16:
      }
LABEL_18:

      id v14 = (char *)v14 + 1;
    }
    while (v12 != v14);
    id v23 = [(NSMutableDictionary *)v9 countByEnumeratingWithState:&v29 objects:v33 count:16];
    id v12 = v23;
  }
  while (v23);
LABEL_22:

  return v28;
}

- (void)removeUserWithSharedUserID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315395;
    id v14 = "-[ADMultiUserService removeUserWithSharedUserID:completion:]";
    __int16 v15 = 2113;
    id v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s Remove user with shared user id %{private}@", buf, 0x16u);
  }
  if (v6)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10029B808;
    block[3] = &unk_10050E1D8;
    void block[4] = self;
    id v11 = v6;
    id v12 = v7;
    dispatch_async(queue, block);
  }
  else if (v7)
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

- (void)removeUserWithHomeUUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315395;
    id v14 = "-[ADMultiUserService removeUserWithHomeUUID:completion:]";
    __int16 v15 = 2113;
    id v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s Remove user with home user id %{private}@", buf, 0x16u);
  }
  if (v6)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10029BA14;
    block[3] = &unk_10050E1D8;
    void block[4] = self;
    id v11 = v6;
    id v12 = v7;
    dispatch_async(queue, block);
  }
  else if (v7)
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

- (void)_postRemovalStateCleanup
{
  [(ADMultiUserService *)self _saveSharedUsers];
  [(ADMultiUserService *)self _updateVoiceProfileInfo];
  [(ADMultiUserService *)self _updateSAMultiUserInfo];
}

- (BOOL)_removeUser:(id)a3 homeUserID:(id)a4 sharedUserID:(id)a5 iCloudAltDSID:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    v65 = "-[ADMultiUserService _removeUser:homeUserID:sharedUserID:iCloudAltDSID:error:]";
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  id v17 = v15;
  int v18 = AFIsATV();
  id v19 = v17;
  if (!v17)
  {
    id v19 = 0;
    if (v18)
    {
      if (v12)
      {
        id v19 = [v12 iCloudAltDSID];
        if (!v13)
        {
LABEL_11:
          if (!v19)
          {
            long long v22 = AFSiriLogContextDaemon;
            if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)long long buf = 136315138;
              v65 = "-[ADMultiUserService _removeUser:homeUserID:sharedUserID:iCloudAltDSID:error:]";
              _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "%s #multi-user-atv No iCloudAltDSID found for user.. checking local mapping", buf, 0xCu);
            }
            id v19 = [(NSMutableDictionary *)self->_iCloudAltDSIDByHomeUserID objectForKey:v13];
            id v23 = AFSiriLogContextDaemon;
            if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)long long buf = 136315395;
              v65 = "-[ADMultiUserService _removeUser:homeUserID:sharedUserID:iCloudAltDSID:error:]";
              __int16 v66 = 2113;
              uint64_t v67 = (uint64_t)v19;
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "%s #multi-user-atv Found %{private}@", buf, 0x16u);
            }
          }
          goto LABEL_16;
        }
      }
      else
      {
        id v19 = 0;
        if (!v13) {
          goto LABEL_11;
        }
      }
      id v20 = [(ADCommunalDeviceUser *)self->_primaryUser homeUserUUID];
      uint64_t v7 = (uint64_t)[v20 isEqualToString:v13];

      if (v7)
      {
        uint64_t v21 = [(ADCommunalDeviceUser *)self->_primaryUser iCloudAltDSID];

        id v19 = (void *)v21;
      }
      goto LABEL_11;
    }
  }
LABEL_16:
  int v24 = AFIsATV();
  if (v12
    || !v24
    || ([(ADCommunalDeviceUser *)self->_primaryUser iCloudAltDSID],
        id v25 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = (uint64_t)[v19 isEqualToString:v25],
        v25,
        (v7 & 1) != 0))
  {
    id v25 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      primaryUser = self->_primaryUser;
      id v25 = v25;
      uint64_t v7 = [(ADCommunalDeviceUser *)primaryUser iCloudAltDSID];
      *(_DWORD *)long long buf = 136315395;
      v65 = "-[ADMultiUserService _removeUser:homeUserID:sharedUserID:iCloudAltDSID:error:]";
      __int16 v66 = 2113;
      uint64_t v67 = v7;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "%s #multi-user-atv Shared user not found or is primary %{private}@ ", buf, 0x16u);
    }
    if (v12) {
      goto LABEL_22;
    }
  }
  else
  {
    id v12 = [(NSMutableDictionary *)self->_sharedUsersByiCloudAltDSID objectForKey:v19];
    if (v12)
    {
LABEL_22:
      long long v27 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        id v28 = v27;
        long long v29 = [v12 homeUserUUID];
        long long v30 = [v12 sharedUserID];
        [v12 iCloudAltDSID];
        long long v32 = v31 = v14;
        *(_DWORD *)long long buf = 136315907;
        v65 = "-[ADMultiUserService _removeUser:homeUserID:sharedUserID:iCloudAltDSID:error:]";
        __int16 v66 = 2113;
        uint64_t v67 = (uint64_t)v29;
        __int16 v68 = 2113;
        v69 = v30;
        __int16 v70 = 2113;
        v71 = v32;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "%s Deleting shared user with home User ID (%{private}@) shared User ID (%{private}@) iCloud AltDSID: (%{private}@)", buf, 0x2Au);

        id v14 = v31;
        long long v27 = AFSiriLogContextDaemon;
      }
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 136315138;
        v65 = "-[ADMultiUserService _removeUser:homeUserID:sharedUserID:iCloudAltDSID:error:]";
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "%s PB User profile does not exist.", buf, 0xCu);
      }
      id v33 = [v12 homeUserUUID];

      if (v33)
      {
        sharedUsersByHomeUserUUID = self->_sharedUsersByHomeUserUUID;
        id v35 = [v12 homeUserUUID];
        [(NSMutableDictionary *)sharedUsersByHomeUserUUID removeObjectForKey:v35];
      }
      __int16 v36 = [v12 sharedUserID];

      if (v36)
      {
        sharedUsersBySharedUserID = self->_sharedUsersBySharedUserID;
        id v38 = [v12 sharedUserID];
        [(NSMutableDictionary *)sharedUsersBySharedUserID removeObjectForKey:v38];
      }
      id v39 = [v12 iCloudAltDSID];

      if (v39)
      {
        sharedUsersByiCloudAltDSID = self->_sharedUsersByiCloudAltDSID;
        uint64_t v41 = [v12 iCloudAltDSID];
        [(NSMutableDictionary *)sharedUsersByiCloudAltDSID removeObjectForKey:v41];
      }
      [(ADMultiUserService *)self _untrackUUIDsForUser:v12];
      id v42 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        uint64_t v43 = v42;
        uint64_t v44 = [v12 sharedUserID];
        *(_DWORD *)long long buf = 136315395;
        v65 = "-[ADMultiUserService _removeUser:homeUserID:sharedUserID:iCloudAltDSID:error:]";
        __int16 v66 = 2113;
        uint64_t v67 = (uint64_t)v44;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "%s Posting notification that shared user with sharedUserId: (%{private}@) has been removed", buf, 0x16u);
      }
      v45 = +[NSNotificationCenter defaultCenter];
      [v45 postNotificationName:@"ADMultiUserSharedUserRemovedNotification" object:v12];

      voiceProfileManager = self->_voiceProfileManager;
      __int16 v47 = [v12 sharedUserID];
      id v48 = [(SSRVoiceProfileManager *)voiceProfileManager discardSiriEnrollmentForProfileId:v47 forLanguageCode:0];

LABEL_35:
      notify_post(AFCachedFusePersonalizationTokenChanged);
      BOOL v49 = 1;
      goto LABEL_36;
    }
  }
  id v51 = v14;
  if (v13)
  {
    id v25 = [(ADCommunalDeviceUser *)self->_primaryUser homeUserUUID];
    if ([v25 isEqualToString:v13]) {
      goto LABEL_43;
    }
    if (v14) {
      goto LABEL_41;
    }
LABEL_45:
    if (!v19)
    {
      unsigned int v52 = 0;
      if (v13) {
        goto LABEL_51;
      }
      goto LABEL_58;
    }
    goto LABEL_49;
  }
  if (!v14) {
    goto LABEL_45;
  }
LABEL_41:
  uint64_t v7 = [(ADCommunalDeviceUser *)self->_primaryUser sharedUserID];
  if ([(id)v7 isEqualToString:v14])
  {

    if (!v13)
    {
LABEL_52:
      [(ADMultiUserService *)self _untrackUUIDsForUser:self->_primaryUser];
      id v54 = (void *)AFSiriLogContextDaemon;
      id v14 = v51;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        v55 = self->_primaryUser;
        id v56 = v54;
        v57 = [(ADCommunalDeviceUser *)v55 iCloudAltDSID];
        *(_DWORD *)long long buf = 136315907;
        v65 = "-[ADMultiUserService _removeUser:homeUserID:sharedUserID:iCloudAltDSID:error:]";
        __int16 v66 = 2113;
        uint64_t v67 = (uint64_t)v13;
        __int16 v68 = 2113;
        v69 = v51;
        __int16 v70 = 2113;
        v71 = v57;
        _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_INFO, "%s Trying to delete the primary user with home User ID (%{private}@) shared User ID (%{private}@) iCloud AltDSID (%{private}@)", buf, 0x2Au);
      }
      [(ADMultiUserService *)self _resetPrimaryUser];
      if (AFIsATV()) {
        [(ADMultiUserService *)self removeDeviceOwner];
      }
      goto LABEL_35;
    }
LABEL_43:

    goto LABEL_52;
  }
  if (!v19)
  {
    unsigned int v52 = 0;
    goto LABEL_57;
  }
LABEL_49:
  uint64_t v53 = [(ADCommunalDeviceUser *)self->_primaryUser iCloudAltDSID];
  unsigned int v52 = [v53 isEqualToString:v19];

  if (!v51)
  {
    if (v13) {
      goto LABEL_51;
    }
LABEL_58:
    if (v52) {
      goto LABEL_52;
    }
    goto LABEL_59;
  }
LABEL_57:

  if (!v13) {
    goto LABEL_58;
  }
LABEL_51:

  if (v52) {
    goto LABEL_52;
  }
LABEL_59:
  v58 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    v59 = v58;
    v60 = [0 homeUserUUID];
    v61 = [0 sharedUserID];
    v62 = [0 iCloudAltDSID];
    *(_DWORD *)long long buf = 136315907;
    v65 = "-[ADMultiUserService _removeUser:homeUserID:sharedUserID:iCloudAltDSID:error:]";
    __int16 v66 = 2113;
    uint64_t v67 = (uint64_t)v60;
    __int16 v68 = 2113;
    v69 = v61;
    __int16 v70 = 2113;
    v71 = v62;
    _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_INFO, "%s Multi user not found for home User ID (%{private}@) shared User ID (%{private}@) iCloud AltDSID (%{private}@)", buf, 0x2Au);
  }
  if (a7)
  {
    +[NSError errorWithDomain:kAFAssistantErrorDomain code:6001 userInfo:&__NSDictionary0__struct];
    BOOL v49 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v49 = 0;
  }
  id v14 = v51;
LABEL_36:

  return v49;
}

- (void)_logRelevantAnalyticsOnUserAddedWithSharedUserID:(id)a3 isPrimary:(BOOL)a4
{
  id v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    id v10 = "-[ADMultiUserService _logRelevantAnalyticsOnUserAddedWithSharedUserID:isPrimary:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  id v6 = +[AFAnalytics sharedAnalytics];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10029C450;
  v7[3] = &unk_1005098E0;
  BOOL v8 = a4;
  [v6 logEventWithType:6112 contextProvider:v7];
}

- (void)removeUserWithShareOwnerNames:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void))a4;
  if (!v6 || ![v6 count])
  {
    id v9 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      id v14 = "-[ADMultiUserService removeUserWithShareOwnerNames:completion:]";
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s no shareOwnerNames", buf, 0xCu);
      if (!v7) {
        goto LABEL_7;
      }
    }
    else if (!v7)
    {
      goto LABEL_7;
    }
    v7[2](v7, 0);
    goto LABEL_7;
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10029C6C8;
  block[3] = &unk_10050E1D8;
  void block[4] = self;
  id v11 = v6;
  id v12 = v7;
  dispatch_async(queue, block);

LABEL_7:
}

- (void)removeDeviceOwner
{
  id v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    uint64_t v7 = "-[ADMultiUserService removeDeviceOwner]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10029CB28;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)_addUser:(id)a3 sharedUserId:(id)a4 loggableSharedUserId:(id)a5 iCloudAltDSID:(id)a6 enrollmentName:(id)a7 isPrimary:(BOOL)a8 nonCloudSyncedUser:(BOOL)a9 completion:(id)a10
{
  BOOL v10 = a8;
  id v16 = a3;
  id v92 = a4;
  id v17 = a5;
  id v93 = a6;
  id v18 = a7;
  id v19 = (void (**)(id, void *))a10;
  v91 = v18;
  if ([(ADMultiUserService *)self _profileLimitReached])
  {
    id v20 = [(NSMutableDictionary *)self->_sharedUsersByHomeUserUUID objectForKey:v16];
    if (v20)
    {
    }
    else
    {
      [(ADCommunalDeviceUser *)self->_primaryUser homeUserUUID];
      long long v22 = v21 = v17;
      unsigned __int8 v23 = [v16 isEqualToString:v22];

      id v17 = v21;
      if ((v23 & 1) == 0)
      {
        __int16 v68 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 136315138;
          v95 = "-[ADMultiUserService _addUser:sharedUserId:loggableSharedUserId:iCloudAltDSID:enrollmentName:isPrimary:n"
                "onCloudSyncedUser:completion:]";
          _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_INFO, "%s Active voice profile limit reached", buf, 0xCu);
        }
        v69 = +[AFAnalytics sharedAnalytics];
        [v69 logEventWithType:6102 contextProvider:0];

        uint64_t v67 = +[NSError errorWithDomain:kAFAssistantErrorDomain code:6011 userInfo:&__NSDictionary0__struct];
        __int16 v70 = +[SiriCoreSymptomsReporter sharedInstance];
        v71 = +[NSProcessInfo processInfo];
        id v72 = [v71 processIdentifier];
        uint64_t v73 = byte_100585E38;
        v74 = sub_100078668();
        [v70 reportIssueForError:v67 type:6102 context:&__NSDictionary0__struct processIdentifier:v72 walkboutStatus:v73 triggerForIDSIdentifiers:v74];

        id v17 = v21;
        id v26 = v92;
        id v25 = v93;
LABEL_52:
        if (v67) {
          goto LABEL_81;
        }
        goto LABEL_80;
      }
    }
  }
  if (v10)
  {
    primaryUser = self->_primaryUser;
    id v25 = v93;
    if (primaryUser)
    {
      id v26 = v92;
      if (v18)
      {
        [(ADCommunalDeviceUser *)primaryUser setEnrollmentName:v18];
        primaryUser = self->_primaryUser;
      }
      long long v27 = [(ADCommunalDeviceUser *)primaryUser sharedUserID];
      unsigned int v28 = [v27 isEqualToString:v92];

      if (v28)
      {
        uint64_t v29 = kAFAssistantErrorDomain;
        uint64_t v30 = 6000;
LABEL_48:
        uint64_t v67 = +[NSError errorWithDomain:v29 code:v30 userInfo:&__NSDictionary0__struct];
        goto LABEL_52;
      }
      v61 = [(ADCommunalDeviceUser *)self->_primaryUser homeUserUUID];
      unsigned int v62 = [v61 isEqualToString:v16];

      if (v62)
      {
        v63 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 136315138;
          v95 = "-[ADMultiUserService _addUser:sharedUserId:loggableSharedUserId:iCloudAltDSID:enrollmentName:isPrimary:n"
                "onCloudSyncedUser:completion:]";
          _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_INFO, "%s Resetting sharedUserID on existing primary user since home User ID matches", buf, 0xCu);
        }
        voiceProfileManager = self->_voiceProfileManager;
        v65 = [(ADCommunalDeviceUser *)self->_primaryUser sharedUserID];
        id v66 = [(SSRVoiceProfileManager *)voiceProfileManager discardSiriEnrollmentForProfileId:v65 forLanguageCode:0];

        [(ADCommunalDeviceUser *)self->_primaryUser setSharedUserID:v92];
      }
      goto LABEL_80;
    }
    id v26 = v92;
    id v56 = [[ADCommunalDeviceUser alloc] init:v16 sharedUserId:v92 loggableSharedUserId:v17 iCloudAltDSID:v93 attribute:0];
    v57 = self->_primaryUser;
    self->_primaryUser = v56;

    objc_storeStrong((id *)&self->_deviceOwner, self->_primaryUser);
    [(ADMultiUserService *)self _saveDeviceOwnerToKeychainCache];
    [(ADCommunalDeviceUser *)self->_primaryUser setEnrollmentName:v18];
    v58 = [(ADCommunalDeviceUser *)self->_primaryUser homeUserUUID];

    if (v58)
    {
      uint64_t v59 = [(ADCommunalDeviceUser *)self->_primaryUser homeUserUUID];
    }
    else
    {
      if (!AFIsATV()
        || ([(ADCommunalDeviceUser *)self->_primaryUser sharedUserID],
            v75 = objc_claimAutoreleasedReturnValue(),
            v75,
            !v75))
      {
LABEL_57:
        if (a9)
        {
          [(ADCommunalDeviceUser *)self->_primaryUser setNonCloudSyncedUserAttribute:1];
          goto LABEL_80;
        }
        self->_primaryUserIsFromLiveOnApp = 0;
        [(ADMultiUserService *)self _savePrimaryAndDeviceOwner];
        v76 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long buf = 136315650;
          v95 = "-[ADMultiUserService _addUser:sharedUserId:loggableSharedUserId:iCloudAltDSID:enrollmentName:isPrimary:n"
                "onCloudSyncedUser:completion:]";
          __int16 v96 = 2112;
          id v97 = v92;
          __int16 v98 = 2112;
          id v99 = v93;
          _os_log_debug_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEBUG, "%s #multi-user Logging userAddedWithSharedUserID:(%@) iCloudAltDSID (%@) for primary User ", buf, 0x20u);
        }
        if (AFIsATV()
          && +[AFFeatureFlags isLassoEnabled])
        {
          if (v93) {
            [(NSMutableDictionary *)self->_sharedUsersByiCloudAltDSID removeObjectForKey:v93];
          }
          if (v92) {
            [(NSMutableDictionary *)self->_sharedUsersBySharedUserID removeObjectForKey:v92];
          }
          if (v16) {
            [(NSMutableDictionary *)self->_sharedUsersByHomeUserUUID removeObjectForKey:v16];
          }
        }
        sharedUsersByiCloudAltDSID = self->_sharedUsersByiCloudAltDSID;
        if (!sharedUsersByiCloudAltDSID)
        {
LABEL_79:
          [(ADMultiUserService *)self _logRelevantAnalyticsOnUserAddedWithSharedUserID:v26 isPrimary:1];
          goto LABEL_80;
        }
        v78 = [(NSMutableDictionary *)sharedUsersByiCloudAltDSID objectForKey:v93];
        if (!v78)
        {
LABEL_78:

          goto LABEL_79;
        }
        id v79 = v17;
        v80 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long buf = 136315138;
          v95 = "-[ADMultiUserService _addUser:sharedUserId:loggableSharedUserId:iCloudAltDSID:enrollmentName:isPrimary:n"
                "onCloudSyncedUser:completion:]";
          _os_log_debug_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_DEBUG, "%s #multi-user-atv primary user existed as shared user. Untracking as shared user.", buf, 0xCu);
          if (!v16) {
            goto LABEL_74;
          }
        }
        else if (!v16)
        {
LABEL_74:
          id v17 = v79;
          id v26 = v92;
          if (v92) {
            [(NSMutableDictionary *)self->_sharedUsersBySharedUserID removeObjectForKey:v92];
          }
          if (v93) {
            [(NSMutableDictionary *)self->_sharedUsersByiCloudAltDSID removeObjectForKey:v93];
          }
          goto LABEL_78;
        }
        [(NSMutableDictionary *)self->_sharedUsersByHomeUserUUID removeObjectForKey:v16];
        goto LABEL_74;
      }
      uint64_t v59 = [(ADCommunalDeviceUser *)self->_primaryUser sharedUserID];
    }
    v60 = (void *)v59;
    [(ADMultiUserService *)self _trackHomeUserUUIDForInFlightVoiceProfile:v59];

    goto LABEL_57;
  }
  if (!self->_sharedUsersBySharedUserID)
  {
    id v31 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    sharedUsersBySharedUserID = self->_sharedUsersBySharedUserID;
    self->_sharedUsersBySharedUserID = v31;
  }
  if (!self->_sharedUsersByHomeUserUUID)
  {
    id v33 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    sharedUsersByHomeUserUUID = self->_sharedUsersByHomeUserUUID;
    self->_sharedUsersByHomeUserUUID = v33;
  }
  id v26 = v92;
  if (!self->_sharedUsersByiCloudAltDSID)
  {
    id v35 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    __int16 v36 = self->_sharedUsersByiCloudAltDSID;
    self->_sharedUsersByiCloudAltDSID = v35;
  }
  int v37 = [(NSMutableDictionary *)self->_sharedUsersByHomeUserUUID objectForKey:v16];
  id v38 = [v37 homeUserUUID];
  unsigned int v39 = [v38 isEqualToString:v16];

  if (v39)
  {
    id v90 = v17;
    id v40 = [(NSMutableDictionary *)self->_sharedUsersByHomeUserUUID objectForKey:v16];
    uint64_t v41 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      id v42 = v41;
      uint64_t v43 = [v40 sharedUserID];
      *(_DWORD *)long long buf = 136315906;
      v95 = "-[ADMultiUserService _addUser:sharedUserId:loggableSharedUserId:iCloudAltDSID:enrollmentName:isPrimary:nonCl"
            "oudSyncedUser:completion:]";
      __int16 v96 = 2112;
      id v97 = v92;
      __int16 v98 = 2112;
      id v99 = v93;
      __int16 v100 = 2112;
      v101 = v43;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "%s Secondary user exists for (%@) iCloudAltDSID (%@), rewriting (%@)", buf, 0x2Au);
    }
    uint64_t v44 = [v40 sharedUserID];
    if (([v44 isEqualToString:v92] & 1) == 0)
    {
      v45 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 136315395;
        v95 = "-[ADMultiUserService _addUser:sharedUserId:loggableSharedUserId:iCloudAltDSID:enrollmentName:isPrimary:non"
              "CloudSyncedUser:completion:]";
        __int16 v96 = 2113;
        id v97 = v44;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "%s Deleting %{private}@", buf, 0x16u);
      }
      id v46 = [(SSRVoiceProfileManager *)self->_voiceProfileManager discardSiriEnrollmentForProfileId:v44 forLanguageCode:0];
      [(NSMutableDictionary *)self->_sharedUsersBySharedUserID removeObjectForKey:v44];
      [v40 setSharedUserID:v92];
      [(NSMutableDictionary *)self->_sharedUsersBySharedUserID setObject:v40 forKey:v92];
    }

    id v17 = v90;
LABEL_25:
    id v25 = v93;
    goto LABEL_80;
  }
  __int16 v47 = [(ADCommunalDeviceUser *)self->_primaryUser homeUserUUID];
  if ([v47 isEqualToString:v16]) {
    goto LABEL_29;
  }
  id v48 = v17;
  BOOL v49 = [(ADCommunalDeviceUser *)self->_primaryUser sharedUserID];
  if ([v49 isEqualToString:v92])
  {

    id v17 = v48;
LABEL_29:

    goto LABEL_30;
  }
  v81 = [(ADCommunalDeviceUser *)self->_primaryUser iCloudAltDSID];
  unsigned __int8 v82 = [v81 isEqualToString:v93];

  id v17 = v48;
  if ((v82 & 1) == 0)
  {
    v83 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315394;
      v95 = "-[ADMultiUserService _addUser:sharedUserId:loggableSharedUserId:iCloudAltDSID:enrollmentName:isPrimary:nonCl"
            "oudSyncedUser:completion:]";
      __int16 v96 = 2112;
      id v97 = v91;
      _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_INFO, "%s Secondary user added for (%@)", buf, 0x16u);
    }
    id v84 = [[ADCommunalDeviceUser alloc] init:v16 sharedUserId:v92 loggableSharedUserId:v48 iCloudAltDSID:v93 attribute:1];
    [v84 setEnrollmentName:v91];
    if (a9) {
      [v84 setNonCloudSyncedUserAttribute:1];
    }
    [(ADMultiUserService *)self _updateMappingsForSharedUser:v84];
    [(ADMultiUserService *)self _saveSharedUsers];
    v85 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315394;
      v95 = "-[ADMultiUserService _addUser:sharedUserId:loggableSharedUserId:iCloudAltDSID:enrollmentName:isPrimary:nonCl"
            "oudSyncedUser:completion:]";
      __int16 v96 = 2112;
      id v97 = v92;
      _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_INFO, "%s #multi-user Logging userAddedWithSharedUserID:(%@) for secondary User ", buf, 0x16u);
    }
    [(ADMultiUserService *)self _logRelevantAnalyticsOnUserAddedWithSharedUserID:v92 isPrimary:0];
    v86 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      v87 = v86;
      v88 = [v84 sharedUserID];
      *(_DWORD *)long long buf = 136315395;
      v95 = "-[ADMultiUserService _addUser:sharedUserId:loggableSharedUserId:iCloudAltDSID:enrollmentName:isPrimary:nonCl"
            "oudSyncedUser:completion:]";
      __int16 v96 = 2113;
      id v97 = v88;
      _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_INFO, "%s Posting notification that shared user with sharedUserId: (%{private}@) has been added", buf, 0x16u);
    }
    v89 = +[NSNotificationCenter defaultCenter];
    [v89 postNotificationName:@"ADMultiUserSharedUserAddedNotification" object:v84];

    id v17 = v48;
    goto LABEL_25;
  }
LABEL_30:
  v50 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    v95 = "-[ADMultiUserService _addUser:sharedUserId:loggableSharedUserId:iCloudAltDSID:enrollmentName:isPrimary:nonClou"
          "dSyncedUser:completion:]";
    __int16 v96 = 2112;
    id v97 = v92;
    _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_INFO, "%s Secondary user not added for (%@) due to conflicts", buf, 0x16u);
  }
  id v25 = v93;
  if (!AFIsATV())
  {
    uint64_t v29 = kAFAssistantErrorDomain;
    uint64_t v30 = 6005;
    goto LABEL_48;
  }
  id v51 = self->_primaryUser;
  self->_primaryUser = 0;

  unsigned int v52 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    v95 = "-[ADMultiUserService _addUser:sharedUserId:loggableSharedUserId:iCloudAltDSID:enrollmentName:isPrimary:nonClou"
          "dSyncedUser:completion:]";
    __int16 v96 = 2112;
    id v97 = v91;
    _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_INFO, "%s Replacing primary user for (%@)", buf, 0x16u);
  }
  id v53 = v17;
  id v54 = [[ADCommunalDeviceUser alloc] init:v16 sharedUserId:v92 loggableSharedUserId:v17 iCloudAltDSID:v93 attribute:1];
  [v54 setEnrollmentName:v91];
  if (a9) {
    [v54 setNonCloudSyncedUserAttribute:1];
  }
  [(ADMultiUserService *)self _updateMappingsForSharedUser:v54];
  [(ADMultiUserService *)self _saveSharedUsers];
  v55 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    v95 = "-[ADMultiUserService _addUser:sharedUserId:loggableSharedUserId:iCloudAltDSID:enrollmentName:isPrimary:nonClou"
          "dSyncedUser:completion:]";
    __int16 v96 = 2112;
    id v97 = v92;
    _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_INFO, "%s #multi-user Logging userAddedWithSharedUserID:(%@) for secondary User ", buf, 0x16u);
  }
  [(ADMultiUserService *)self _logRelevantAnalyticsOnUserAddedWithSharedUserID:v92 isPrimary:0];

  id v17 = v53;
  id v26 = v92;
LABEL_80:
  notify_post(AFCachedFusePersonalizationTokenChanged);
  uint64_t v67 = 0;
LABEL_81:
  [(ADMultiUserService *)self _updateSAMultiUserInfo];
  if (v19) {
    v19[2](v19, v67);
  }
}

- (void)addUser:(id)a3 sharedUserId:(id)a4 loggableSharedUserId:(id)a5 iCloudAltDSID:(id)a6 enrollmentName:(id)a7 isPrimary:(BOOL)a8 nonCloudSyncedUser:(BOOL)a9 completion:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a10;
  long long v22 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    id v38 = "-[ADMultiUserService addUser:sharedUserId:loggableSharedUserId:iCloudAltDSID:enrollmentName:isPrimary:nonCloud"
          "SyncedUser:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  if ([(ADMultiUserService *)self _isHostingMultiUserLanguage])
  {
    if (v16)
    {
      if (!v17) {
        goto LABEL_14;
      }
    }
    else
    {
      char v25 = AFIsATV();
      if (!v17 || (v25 & 1) == 0)
      {
LABEL_14:
        if (v21)
        {
          uint64_t v23 = kAFAssistantErrorDomain;
          uint64_t v24 = 6002;
          goto LABEL_16;
        }
        goto LABEL_17;
      }
    }
    if (v18 && v20)
    {
      queue = self->_queue;
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_10029DA84;
      v28[3] = &unk_1005098C0;
      BOOL v35 = a9;
      v28[4] = self;
      id v29 = v16;
      id v30 = v17;
      id v31 = v18;
      id v32 = v19;
      id v33 = v20;
      BOOL v36 = a8;
      id v34 = v21;
      dispatch_async(queue, v28);

      goto LABEL_17;
    }
    goto LABEL_14;
  }
  if (v21)
  {
    uint64_t v23 = kAFAssistantErrorDomain;
    uint64_t v24 = 6012;
LABEL_16:
    long long v27 = +[NSError errorWithDomain:v23 code:v24 userInfo:&__NSDictionary0__struct];
    (*((void (**)(id, void *))v21 + 2))(v21, v27);
  }
LABEL_17:
}

- (void)addUser:(id)a3 sharedUserId:(id)a4 loggableSharedUserId:(id)a5 iCloudAltDSID:(id)a6 enrollmentName:(id)a7 isPrimary:(BOOL)a8 completion:(id)a9
{
  LOBYTE(v9) = 1;
  [(ADMultiUserService *)self addUser:a3 sharedUserId:a4 loggableSharedUserId:a5 iCloudAltDSID:a6 enrollmentName:a7 isPrimary:a8 nonCloudSyncedUser:v9 completion:a9];
}

- (void)_addDeviceOwner:(id)a3 sharedUserId:(id)a4 loggableSharedUserId:(id)a5 iCloudAltDSID:(id)a6 audioAppSignals:(id)a7 enrollmentName:(id)a8 companionInfo:(id)a9 shareOwnerName:(id)a10 homeMemberSettings:(id)a11 loggingAllowed:(BOOL)a12 completion:(id)a13
{
  id v61 = a3;
  id v63 = a4;
  id v19 = a5;
  id v20 = a6;
  id v62 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  id v24 = a11;
  char v25 = (void (**)(id, void))a13;
  if (self->_primaryUser)
  {
    id v26 = AFSiriLogContextDaemon;
    long long v27 = v61;
    unsigned int v28 = v19;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      v65 = "-[ADMultiUserService _addDeviceOwner:sharedUserId:loggableSharedUserId:iCloudAltDSID:audioAppSignals:enrollm"
            "entName:companionInfo:shareOwnerName:homeMemberSettings:loggingAllowed:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "%s Primary user already exists.", buf, 0xCu);
    }
  }
  else
  {
    v60 = self;
    id v29 = AFSiriLogContextDaemon;
    if (self->_deviceOwner)
    {
      long long v27 = v61;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 136315138;
        v65 = "-[ADMultiUserService _addDeviceOwner:sharedUserId:loggableSharedUserId:iCloudAltDSID:audioAppSignals:enrol"
              "lmentName:companionInfo:shareOwnerName:homeMemberSettings:loggingAllowed:completion:]";
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "%s Device owner already exists.", buf, 0xCu);
      }
      LOBYTE(v55) = a12;
      unsigned int isMultiUserInfoDirty = [(ADMultiUserService *)self _updateDeviceOwner:v61 sharedUserId:v63 enrollmentName:v21 companionInfo:v22 shareOwnerName:v23 homeMemberSettings:v24 loggingAllowed:v55];
      self->_unsigned int isMultiUserInfoDirty = isMultiUserInfoDirty;
      unsigned int v28 = v19;
    }
    else
    {
      long long v27 = v61;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 136315395;
        v65 = "-[ADMultiUserService _addDeviceOwner:sharedUserId:loggableSharedUserId:iCloudAltDSID:audioAppSignals:enrol"
              "lmentName:companionInfo:shareOwnerName:homeMemberSettings:loggingAllowed:completion:]";
        __int16 v66 = 2113;
        id v67 = v63;
        _os_log_debug_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "%s A new device owner will be added:(%{private}@)", buf, 0x16u);
      }
      id v31 = [(NSMutableDictionary *)self->_homeUserSettings objectForKey:v61];
      id v32 = [v31 objectForKey:@"personalDomainsIsEnabled"];
      BOOL v58 = [v32 integerValue] == (id)1;

      uint64_t v59 = v31;
      id v33 = [v31 objectForKey:@"allowUnauthenticatedRequests"];
      BOOL v57 = [v33 integerValue] == (id)1;

      id v34 = [v31 objectForKey:@"allowExplicitContent"];
      BOOL v56 = [v34 integerValue] == (id)1;

      unsigned int v28 = v19;
      BOOL v35 = [[ADCommunalDeviceUser alloc] init:v61 sharedUserId:v63 loggableSharedUserId:v19 iCloudAltDSID:v20 attribute:0];
      deviceOwner = v60->_deviceOwner;
      v60->_deviceOwner = v35;

      [(ADCommunalDeviceUser *)v60->_deviceOwner setEnrollmentName:v21];
      int v37 = v60->_deviceOwner;
      [v22 assistantID];
      v39 = id v38 = v20;
      [(ADCommunalDeviceUser *)v37 setCompanionAssistantID:v39];

      id v40 = v60->_deviceOwner;
      uint64_t v41 = [v22 speechID];
      [(ADCommunalDeviceUser *)v40 setCompanionSpeechID:v41];

      id v42 = v60->_deviceOwner;
      uint64_t v43 = [v22 idsIdentifier];
      [(ADCommunalDeviceUser *)v42 setCompanionIDSIdentifier:v43];

      uint64_t v44 = v60->_deviceOwner;
      v45 = [v22 productPrefix];
      [(ADCommunalDeviceUser *)v44 setProductPrefix:v45];

      id v46 = v60->_deviceOwner;
      __int16 v47 = [v22 aceHost];
      [(ADCommunalDeviceUser *)v46 setAceHost:v47];

      [(ADCommunalDeviceUser *)v60->_deviceOwner setShareOwnerName:v23];
      [(ADCommunalDeviceUser *)v60->_deviceOwner setAllowExplicitContent:v56];
      id v48 = v60->_deviceOwner;
      BOOL v49 = [v24 dictionary];
      [(ADCommunalDeviceUser *)v48 setSettings:v49];

      [(ADCommunalDeviceUser *)v60->_deviceOwner testAndSetLoggingIsAllowed:a12];
      [(ADCommunalDeviceUser *)v60->_deviceOwner setVoiceIDAllowedByUser:0];
      [(ADCommunalDeviceUser *)v60->_deviceOwner setPersonalDomainsIsEnabled:v58];
      [(ADCommunalDeviceUser *)v60->_deviceOwner setUnauthenticatedRequestsAllowed:v57];
      v50 = v60->_deviceOwner;
      id v51 = [v22 syncMetadata];
      [(ADCommunalDeviceUser *)v50 setCompanionSyncMetadata:v51];

      id v20 = v38;
      -[ADCommunalDeviceUser setCompanionSyncMetadataCapable:](v60->_deviceOwner, "setCompanionSyncMetadataCapable:", [v22 syncMetadataCapability]);
      -[ADCommunalDeviceUser setCompanionPeerToPeerHandoffCapable:](v60->_deviceOwner, "setCompanionPeerToPeerHandoffCapable:", [v22 peerToPeerHandoffCapability]);
      [(ADCommunalDeviceUser *)v60->_deviceOwner setAudioAppSignals:v62];
      v60->_unsigned int isMultiUserInfoDirty = 1;

      unsigned int isMultiUserInfoDirty = v60->_isMultiUserInfoDirty;
    }
    if (isMultiUserInfoDirty)
    {
      unsigned int v52 = +[ADPreferences sharedPreferences];
      [(ADCommunalDeviceUser *)v60->_deviceOwner dictionaryRepresentation];
      v54 = id v53 = v20;
      [v52 setDeviceOwner:v54];

      id v20 = v53;
    }
    [(ADMultiUserService *)v60 _saveDeviceOwnerToKeychainCache];
  }
  v25[2](v25, 0);
}

- (BOOL)_updateDeviceOwner:(id)a3 sharedUserId:(id)a4 enrollmentName:(id)a5 companionInfo:(id)a6 shareOwnerName:(id)a7 homeMemberSettings:(id)a8 loggingAllowed:(BOOL)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  if (self->_primaryUser || (deviceOwner = self->_deviceOwner) == 0)
  {
LABEL_2:
    BOOL v21 = 0;
    goto LABEL_3;
  }
  id v118 = v16;
  id v24 = [(ADCommunalDeviceUser *)deviceOwner homeUserUUID];
  id v25 = v15;
  id v26 = v25;
  if (v24 == v25)
  {
  }
  else
  {
    if (!v25 || !v24)
    {

      goto LABEL_17;
    }
    unsigned __int8 v27 = [v24 isEqual:v25];

    if ((v27 & 1) == 0)
    {
LABEL_17:
      id v32 = (void *)AFSiriLogContextDaemon;
      id v16 = v118;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        id v33 = self->_deviceOwner;
        id v34 = v32;
        BOOL v35 = [(ADCommunalDeviceUser *)v33 homeUserUUID];
        *(_DWORD *)long long buf = 136315650;
        v120 = "-[ADMultiUserService _updateDeviceOwner:sharedUserId:enrollmentName:companionInfo:shareOwnerName:homeMemb"
               "erSettings:loggingAllowed:]";
        __int16 v121 = 2112;
        id v122 = v35;
        __int16 v123 = 2112;
        v124 = v26;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "%s Not updating deviceOwner since homeUserUUIDs are different %@, %@", buf, 0x20u);
      }
      goto LABEL_2;
    }
  }
  id v28 = [(ADCommunalDeviceUser *)self->_deviceOwner enrollmentName];
  id v29 = v17;
  id v30 = v29;
  id v116 = v17;
  if (v28 == v29)
  {

    goto LABEL_20;
  }
  if (v29 && v28)
  {
    unsigned __int8 v31 = [v28 isEqual:v29];

    if ((v31 & 1) == 0) {
      goto LABEL_22;
    }
LABEL_20:
    BOOL v21 = 0;
    BOOL v36 = v118;
    goto LABEL_25;
  }

LABEL_22:
  int v37 = AFSiriLogContextDaemon;
  BOOL v36 = v118;
  if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    v120 = "-[ADMultiUserService _updateDeviceOwner:sharedUserId:enrollmentName:companionInfo:shareOwnerName:homeMemberSe"
           "ttings:loggingAllowed:]";
    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "%s Updating enrollment name", buf, 0xCu);
  }

  [(ADCommunalDeviceUser *)self->_deviceOwner setEnrollmentName:v30];
  BOOL v21 = 1;
LABEL_25:
  id v38 = [(ADCommunalDeviceUser *)self->_deviceOwner sharedUserID];
  id v39 = v36;
  id v40 = v39;
  if (v38 == v39)
  {

    goto LABEL_35;
  }
  if (v39 && v38)
  {
    unsigned __int8 v41 = [v38 isEqual:v39];

    if (v41) {
      goto LABEL_35;
    }
  }
  else
  {
  }
  id v42 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    v120 = "-[ADMultiUserService _updateDeviceOwner:sharedUserId:enrollmentName:companionInfo:shareOwnerName:homeMemberSe"
           "ttings:loggingAllowed:]";
    _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "%s Updating sharedUserId", buf, 0xCu);
  }

  [(ADCommunalDeviceUser *)self->_deviceOwner setSharedUserID:v40];
  BOOL v21 = 1;
LABEL_35:
  uint64_t v43 = [(ADCommunalDeviceUser *)self->_deviceOwner settings];
  uint64_t v44 = [v20 dictionary];
  id v45 = v43;
  id v46 = v44;
  if (v45 == v46)
  {

LABEL_45:
    goto LABEL_46;
  }
  __int16 v47 = v46;
  if (!v45 || !v46)
  {

    goto LABEL_42;
  }
  unsigned __int8 v48 = [v45 isEqual:v46];

  if ((v48 & 1) == 0)
  {
LABEL_42:
    BOOL v49 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      v120 = "-[ADMultiUserService _updateDeviceOwner:sharedUserId:enrollmentName:companionInfo:shareOwnerName:homeMember"
             "Settings:loggingAllowed:]";
      _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_INFO, "%s Updating HomeKit Settings", buf, 0xCu);
    }

    v50 = self->_deviceOwner;
    id v45 = [v20 dictionary];
    [(ADCommunalDeviceUser *)v50 setSettings:v45];
    BOOL v21 = 1;
    goto LABEL_45;
  }
LABEL_46:
  id v51 = [(ADCommunalDeviceUser *)self->_deviceOwner shareOwnerName];
  id v52 = v19;
  id v53 = v52;
  if (v51 == v52)
  {

    goto LABEL_56;
  }
  if (v52 && v51)
  {
    unsigned __int8 v54 = [v51 isEqual:v52];

    if (v54) {
      goto LABEL_56;
    }
  }
  else
  {
  }
  uint64_t v55 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    v120 = "-[ADMultiUserService _updateDeviceOwner:sharedUserId:enrollmentName:companionInfo:shareOwnerName:homeMemberSe"
           "ttings:loggingAllowed:]";
    _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_INFO, "%s Updating shareOwner name", buf, 0xCu);
  }

  [(ADCommunalDeviceUser *)self->_deviceOwner setShareOwnerName:v53];
  BOOL v21 = 1;
LABEL_56:
  if ([(ADCommunalDeviceUser *)self->_deviceOwner loggingIsAllowed] != a9)
  {
    BOOL v56 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      v120 = "-[ADMultiUserService _updateDeviceOwner:sharedUserId:enrollmentName:companionInfo:shareOwnerName:homeMember"
             "Settings:loggingAllowed:]";
      _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_INFO, "%s Updating loggingIsAllowed", buf, 0xCu);
    }

    [(ADCommunalDeviceUser *)self->_deviceOwner testAndSetLoggingIsAllowed:a9];
    BOOL v21 = 1;
  }
  BOOL v57 = [(ADCommunalDeviceUser *)self->_deviceOwner companionSpeechID];
  BOOL v58 = [v18 speechID];
  id v59 = v57;
  id v60 = v58;
  if (v59 == v60)
  {

LABEL_70:
    goto LABEL_71;
  }
  id v61 = v60;
  if (!v59 || !v60)
  {

    goto LABEL_67;
  }
  unsigned __int8 v62 = [v59 isEqual:v60];

  if ((v62 & 1) == 0)
  {
LABEL_67:
    id v63 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      v120 = "-[ADMultiUserService _updateDeviceOwner:sharedUserId:enrollmentName:companionInfo:shareOwnerName:homeMember"
             "Settings:loggingAllowed:]";
      _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_INFO, "%s Updating companion speechID", buf, 0xCu);
    }

    v64 = self->_deviceOwner;
    id v59 = [v18 speechID];
    [(ADCommunalDeviceUser *)v64 setCompanionSpeechID:v59];
    BOOL v21 = 1;
    goto LABEL_70;
  }
LABEL_71:
  v65 = [(ADCommunalDeviceUser *)self->_deviceOwner companionAssistantID];
  __int16 v66 = [v18 assistantID];
  id v67 = v65;
  id v68 = v66;
  v69 = v68;
  if (v67 == v68)
  {
    unsigned int v70 = 1;
  }
  else
  {
    unsigned int v70 = 0;
    if (v67 && v68) {
      unsigned int v70 = [v67 isEqual:v68];
    }
  }

  if ((v70 & 1) == 0)
  {
    v71 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      v120 = "-[ADMultiUserService _updateDeviceOwner:sharedUserId:enrollmentName:companionInfo:shareOwnerName:homeMember"
             "Settings:loggingAllowed:]";
      _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_INFO, "%s Updating companion assistantID", buf, 0xCu);
    }

    id v72 = self->_deviceOwner;
    uint64_t v73 = [v18 assistantID];
    [(ADCommunalDeviceUser *)v72 setCompanionAssistantID:v73];
  }
  v74 = [(ADCommunalDeviceUser *)self->_deviceOwner companionIDSIdentifier];
  v75 = [v18 idsIdentifier];
  id v76 = v74;
  id v77 = v75;
  if (v76 == v77)
  {

LABEL_90:
    goto LABEL_91;
  }
  v78 = v77;
  if (!v76 || !v77)
  {

    goto LABEL_87;
  }
  unsigned __int8 v79 = [v76 isEqual:v77];

  if ((v79 & 1) == 0)
  {
LABEL_87:
    v80 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      v120 = "-[ADMultiUserService _updateDeviceOwner:sharedUserId:enrollmentName:companionInfo:shareOwnerName:homeMember"
             "Settings:loggingAllowed:]";
      _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_INFO, "%s Updating companion IDSIdentifier", buf, 0xCu);
    }

    v81 = self->_deviceOwner;
    id v76 = [v18 idsIdentifier];
    [(ADCommunalDeviceUser *)v81 setCompanionIDSIdentifier:v76];
    BOOL v21 = 1;
    goto LABEL_90;
  }
LABEL_91:
  int v82 = v70 ^ 1;
  v83 = [(ADCommunalDeviceUser *)self->_deviceOwner productPrefix];
  id v84 = [v18 productPrefix];
  id v85 = v83;
  id v86 = v84;
  if (v85 == v86)
  {

LABEL_101:
    goto LABEL_102;
  }
  v87 = v86;
  if (!v85 || !v86)
  {

    goto LABEL_98;
  }
  unsigned __int8 v88 = [v85 isEqual:v86];

  if ((v88 & 1) == 0)
  {
LABEL_98:
    v89 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(v89, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      v120 = "-[ADMultiUserService _updateDeviceOwner:sharedUserId:enrollmentName:companionInfo:shareOwnerName:homeMember"
             "Settings:loggingAllowed:]";
      _os_log_impl((void *)&_mh_execute_header, v89, OS_LOG_TYPE_INFO, "%s Updating companion product prefix", buf, 0xCu);
    }

    id v90 = self->_deviceOwner;
    id v85 = [v18 productPrefix];
    [(ADCommunalDeviceUser *)v90 setProductPrefix:v85];
    BOOL v21 = 1;
    goto LABEL_101;
  }
LABEL_102:
  v91 = [(ADCommunalDeviceUser *)self->_deviceOwner aceHost];
  id v92 = [v18 aceHost];
  id v93 = v91;
  id v94 = v92;
  if (v93 == v94)
  {

LABEL_112:
    goto LABEL_113;
  }
  v95 = v94;
  if (!v93 || !v94)
  {

    goto LABEL_109;
  }
  unsigned __int8 v96 = [v93 isEqual:v94];

  if ((v96 & 1) == 0)
  {
LABEL_109:
    id v97 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(v97, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      v120 = "-[ADMultiUserService _updateDeviceOwner:sharedUserId:enrollmentName:companionInfo:shareOwnerName:homeMember"
             "Settings:loggingAllowed:]";
      _os_log_impl((void *)&_mh_execute_header, v97, OS_LOG_TYPE_INFO, "%s Updating companion aceHost", buf, 0xCu);
    }

    __int16 v98 = self->_deviceOwner;
    id v93 = [v18 aceHost];
    [(ADCommunalDeviceUser *)v98 setAceHost:v93];
    int v82 = 1;
    goto LABEL_112;
  }
LABEL_113:
  id v99 = [(ADCommunalDeviceUser *)self->_deviceOwner companionSyncMetadata];
  __int16 v100 = [v18 syncMetadata];
  id v101 = v99;
  id v102 = v100;
  if (v101 == v102)
  {
  }
  else
  {
    v103 = v102;
    if (v101 && v102)
    {
      unsigned __int8 v104 = [v101 isEqual:v102];

      if (v104) {
        goto LABEL_124;
      }
    }
    else
    {
    }
    v105 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(v105, OS_LOG_TYPE_INFO))
    {
      v106 = [(ADCommunalDeviceUser *)self->_deviceOwner sharedUserID];
      *(_DWORD *)long long buf = 136315395;
      v120 = "-[ADMultiUserService _updateDeviceOwner:sharedUserId:enrollmentName:companionInfo:shareOwnerName:homeMember"
             "Settings:loggingAllowed:]";
      __int16 v121 = 2113;
      id v122 = v106;
      _os_log_impl((void *)&_mh_execute_header, v105, OS_LOG_TYPE_INFO, "%s Posting notification and updating companion sync metadata for deviceOwner (%{private}@)", buf, 0x16u);
    }
    v107 = self->_deviceOwner;
    v108 = [v18 syncMetadata];
    [(ADCommunalDeviceUser *)v107 setCompanionSyncMetadata:v108];

    id v101 = +[NSNotificationCenter defaultCenter];
    [v101 postNotificationName:@"ADMultiUserSyncMetadataDidChangeNotification" object:self->_deviceOwner];
    BOOL v21 = 1;
  }

LABEL_124:
  unsigned int v109 = [(ADCommunalDeviceUser *)self->_deviceOwner companionSyncMetadataCapable];
  id v17 = v117;
  id v16 = v118;
  if (v109 != [v18 syncMetadataCapability])
  {
    v110 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(v110, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      v120 = "-[ADMultiUserService _updateDeviceOwner:sharedUserId:enrollmentName:companionInfo:shareOwnerName:homeMember"
             "Settings:loggingAllowed:]";
      _os_log_impl((void *)&_mh_execute_header, v110, OS_LOG_TYPE_INFO, "%s Updating companion sync metadata capability", buf, 0xCu);
    }

    -[ADCommunalDeviceUser setCompanionSyncMetadataCapable:](self->_deviceOwner, "setCompanionSyncMetadataCapable:", [v18 syncMetadataCapability]);
    int v82 = 1;
  }
  unsigned int v111 = [(ADCommunalDeviceUser *)self->_deviceOwner companionPeerToPeerHandoffCapable];
  if (v111 == [v18 peerToPeerHandoffCapability])
  {
    if (!v82) {
      goto LABEL_3;
    }
  }
  else
  {
    v112 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(v112, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      v120 = "-[ADMultiUserService _updateDeviceOwner:sharedUserId:enrollmentName:companionInfo:shareOwnerName:homeMember"
             "Settings:loggingAllowed:]";
      _os_log_impl((void *)&_mh_execute_header, v112, OS_LOG_TYPE_INFO, "%s Updating companion sync metadata capability", buf, 0xCu);
    }

    -[ADCommunalDeviceUser setCompanionPeerToPeerHandoffCapable:](self->_deviceOwner, "setCompanionPeerToPeerHandoffCapable:", [v18 peerToPeerHandoffCapability]);
  }
  v113 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(v113, OS_LOG_TYPE_INFO))
  {
    id v114 = [(ADCommunalDeviceUser *)self->_deviceOwner sharedUserID];
    *(_DWORD *)long long buf = 136315395;
    v120 = "-[ADMultiUserService _updateDeviceOwner:sharedUserId:enrollmentName:companionInfo:shareOwnerName:homeMemberSe"
           "ttings:loggingAllowed:]";
    __int16 v121 = 2113;
    id v122 = v114;
    _os_log_impl((void *)&_mh_execute_header, v113, OS_LOG_TYPE_INFO, "%s Posting notification that companion device information/capabilities changed for deviceOwner: (%{private}@)", buf, 0x16u);
  }
  v115 = +[NSNotificationCenter defaultCenter];
  [v115 postNotificationName:@"ADMultiUserSharedUserCompanionInfoChangedNotification" object:self->_deviceOwner];

  BOOL v21 = 1;
LABEL_3:

  return v21;
}

- (void)addDeviceOwner:(id)a3 sharedUserId:(id)a4 loggableSharedUserId:(id)a5 iCloudAltDSID:(id)a6 audioAppSignals:(id)a7 enrollmentName:(id)a8 companionInfo:(id)a9 shareOwnerName:(id)a10 homeMemberSettings:(id)a11 loggingAllowed:(BOOL)a12 completion:(id)a13
{
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  id v32 = a7;
  id v22 = a8;
  id v31 = a9;
  id v23 = a10;
  id v24 = a11;
  id v25 = a13;
  id v26 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    id v46 = "-[ADMultiUserService addDeviceOwner:sharedUserId:loggableSharedUserId:iCloudAltDSID:audioAppSignals:enrollment"
          "Name:companionInfo:shareOwnerName:homeMemberSettings:loggingAllowed:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  unsigned __int8 v27 = v18;
  if (v18 && v19 && v20 && v22)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10029F37C;
    block[3] = &unk_100509870;
    void block[4] = self;
    id v34 = v18;
    id v35 = v19;
    id v36 = v20;
    id v37 = v21;
    id v38 = v32;
    id v39 = v22;
    id v40 = v31;
    id v41 = v23;
    id v42 = v24;
    BOOL v44 = a12;
    id v43 = v25;
    dispatch_async(queue, block);
  }
  else if (v25)
  {
    id v29 = +[NSError errorWithDomain:kAFAssistantErrorDomain code:6002 userInfo:&__NSDictionary0__struct];
    (*((void (**)(id, void *))v25 + 2))(v25, v29);
  }
}

- (void)_deleteShareForUser:(id)a3
{
  id v4 = a3;
  id v5 = [(ADMultiUserService *)self getCloudKitManager];
  [v5 deleteShareForUser:v4 completion:&stru_100509848];
}

- (void)_allowVoiceIdentificationForThisUser:(id)a3 iCloudAltDSID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = (void (**)(id, void))a5;
  homeUserSettings = self->_homeUserSettings;
  if (homeUserSettings)
  {
    uint64_t v12 = [(NSMutableDictionary *)self->_homeUserSettings objectForKey:v8];
    if (v12)
    {
      id v13 = (void *)v12;
      if (AFIsATV()
        && +[AFFeatureFlags isLassoEnabled]
        && [(NSString *)self->_userWithRMVEnabledDuringBuddy isEqualToString:v9])
      {
        id v14 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 136315394;
          id v28 = "-[ADMultiUserService _allowVoiceIdentificationForThisUser:iCloudAltDSID:completion:]";
          __int16 v29 = 2112;
          uint64_t v30 = (uint64_t)v9;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s Now past buddy and sync is done; set RMV enabled for the user requested during buddy flow with iCloudAltDSID %@",
            buf,
            0x16u);
        }
        id v15 = [v13 mutableCopy];
        [v15 setObject:&off_100523AB0 forKey:@"allowVoiceID"];
        [(NSMutableDictionary *)self->_homeUserSettings setObject:v15 forKey:v8];

        id v13 = v15;
      }
      id v16 = [v13 objectForKey:@"allowVoiceID"];
      id v17 = v16;
      if (v16 && [v16 integerValue] == (id)1)
      {
        if (v10) {
          v10[2](v10, 0);
        }

        goto LABEL_28;
      }
      id v18 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 136315394;
        id v28 = "-[ADMultiUserService _allowVoiceIdentificationForThisUser:iCloudAltDSID:completion:]";
        __int16 v29 = 2112;
        uint64_t v30 = (uint64_t)v8;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s VoiceID disallowed for (%@) checking with HomeKit as they sometimes miss notifying us.", buf, 0x16u);
      }
    }
    else
    {
      id v19 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 136315394;
        id v28 = "-[ADMultiUserService _allowVoiceIdentificationForThisUser:iCloudAltDSID:completion:]";
        __int16 v29 = 2112;
        uint64_t v30 = (uint64_t)v8;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%s Missing setting for (%@) checking with HomeKit as they sometimes miss notifying us.", buf, 0x16u);
      }
    }
  }
  if (AFIsATV())
  {
    if (_AFPreferencesSiriRMVSetting() == 2)
    {
      id v20 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 136315394;
        id v28 = "-[ADMultiUserService _allowVoiceIdentificationForThisUser:iCloudAltDSID:completion:]";
        __int16 v29 = 2048;
        uint64_t v30 = 2;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%s #multi-user-atv Voice ID allowed for user on ATV with profile in state %ld", buf, 0x16u);
      }
      if (v10) {
        v10[2](v10, 0);
      }
    }
    else if (v10)
    {
      id v22 = +[NSError errorWithDomain:kAFAssistantErrorDomain code:6010 userInfo:&__NSDictionary0__struct];
      ((void (**)(id, void *))v10)[2](v10, v22);
    }
  }
  else
  {
    id v21 = +[ADHomeInfoManager sharedInfoManager];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10029F90C;
    v23[3] = &unk_100509A10;
    v23[4] = self;
    id v24 = v8;
    id v26 = v10;
    id v25 = v9;
    [v21 settingsForMultiUserWithRefresh:homeUserSettings != 0 completion:v23];
  }
LABEL_28:
}

- (BOOL)_updateNonHomeUserSettings:(id)a3
{
  id v4 = a3;
  id v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v18 = 136315138;
    id v19 = "-[ADMultiUserService _updateNonHomeUserSettings:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v18, 0xCu);
  }
  id v6 = [(NSMutableDictionary *)self->_sharedUsersBySharedUserID objectForKey:v4];
  if (!v6)
  {
    uint64_t v7 = [(ADCommunalDeviceUser *)self->_primaryUser sharedUserID];
    unsigned int v8 = [v7 isEqualToString:v4];

    if (v8) {
      id v6 = self->_primaryUser;
    }
    else {
      id v6 = 0;
    }
  }
  id v9 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    BOOL v10 = v9;
    id v11 = [(ADCommunalDeviceUser *)v6 iCloudAltDSID];
    int v18 = 136315394;
    id v19 = "-[ADMultiUserService _updateNonHomeUserSettings:]";
    __int16 v20 = 2112;
    id v21 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v18, 0x16u);
  }
  uint64_t v12 = [(ADCommunalDeviceUser *)v6 iCloudAltDSID];
  id v13 = (void *)v12;
  if (v6) {
    BOOL v14 = v12 == 0;
  }
  else {
    BOOL v14 = 1;
  }
  BOOL v15 = !v14;
  if (!v14)
  {
    BOOL v16 = _AFPreferencesSiriRMVSetting() == 1 || _AFPreferencesSiriRMVSetting() == 2;
    [(ADCommunalDeviceUser *)v6 setVoiceIDAllowedByUser:v16];
  }

  return v15;
}

- (BOOL)_updateHomeKitSettings:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_homeUserSettings objectForKey:v4];
  id v6 = [v5 objectForKey:@"allowVoiceID"];
  uint64_t v7 = [(NSMutableDictionary *)self->_sharedUsersByHomeUserUUID objectForKey:v4];
  if (!v7)
  {
    unsigned int v8 = [(ADCommunalDeviceUser *)self->_primaryUser homeUserUUID];
    unsigned int v9 = [v8 isEqualToString:v4];

    if (!v9)
    {
      BOOL v11 = 0;
      uint64_t v7 = 0;
      goto LABEL_11;
    }
    uint64_t v7 = self->_primaryUser;
  }
  if (v5) {
    BOOL v10 = v7 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    BOOL v11 = 0;
  }
  else
  {
    [(ADMultiUserService *)self _updateCommunalDeviceUser:v7 withSettings:v5];
    BOOL v11 = 1;
  }
LABEL_11:

  return v11;
}

- (void)_updateHomeKitSettingsForDeviceOwner
{
  if (!self->_primaryUser
    && [(ADMultiUserService *)self _homeKitSettingsDidChangeForDeviceOwner])
  {
    homeUserSettings = self->_homeUserSettings;
    id v4 = [(ADCommunalDeviceUser *)self->_deviceOwner homeUserUUID];
    id v5 = [(NSMutableDictionary *)homeUserSettings objectForKey:v4];

    [(ADMultiUserService *)self _updateCommunalDeviceUser:self->_deviceOwner withSettings:v5];
    id v6 = +[ADPreferences sharedPreferences];
    uint64_t v7 = [(ADCommunalDeviceUser *)self->_deviceOwner dictionaryRepresentation];
    [v6 setDeviceOwner:v7];

    unsigned int v8 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v9 = 136315138;
      BOOL v10 = "-[ADMultiUserService _updateHomeKitSettingsForDeviceOwner]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s Marking MultiUserInfo as dirty", (uint8_t *)&v9, 0xCu);
    }
    self->_unsigned int isMultiUserInfoDirty = 1;
  }
}

- (BOOL)_homeKitSettingsDidChangeForDeviceOwner
{
  homeUserSettings = self->_homeUserSettings;
  id v4 = [(ADCommunalDeviceUser *)self->_deviceOwner homeUserUUID];
  id v5 = [(NSMutableDictionary *)homeUserSettings objectForKey:v4];

  id v6 = [v5 objectForKey:@"allowVoiceID"];
  BOOL v7 = [v6 integerValue] != (id)1;

  if (v7 == [(ADCommunalDeviceUser *)self->_deviceOwner voiceIDAllowedByUser]) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = [(ADMultiUserService *)self personalDomainSettingsDidChange:self->_deviceOwner newUserSettings:v5];
  }

  return v8;
}

- (void)_updateCommunalDeviceUser:(id)a3 withSettings:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = [v6 objectForKey:@"allowVoiceID"];
  BOOL v8 = [v6 objectForKey:@"personalDomainsIsEnabled"];
  int v9 = [v6 objectForKey:@"allowUnauthenticatedRequests"];
  BOOL v10 = [v6 objectForKey:@"allowExplicitContent"];

  id v11 = [v7 integerValue];
  unsigned int v12 = [v5 personalDomainsIsEnabled];
  if (v12 != [v8 BOOLValue])
  {
    objc_msgSend(v5, "setPersonalDomainsIsEnabled:", objc_msgSend(v8, "BOOLValue"));
    id v13 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      BOOL v14 = v13;
      BOOL v15 = [v5 sharedUserID];
      int v20 = 136315395;
      id v21 = "-[ADMultiUserService _updateCommunalDeviceUser:withSettings:]";
      __int16 v22 = 2113;
      id v23 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s Posting notification that Personal Domains setting changed for sharedUserId: (%{private}@)", (uint8_t *)&v20, 0x16u);
    }
    BOOL v16 = +[NSNotificationCenter defaultCenter];
    [v16 postNotificationName:@"ADMultiUserSharedUserPersonalDomainsChangedNotification" object:v5];
  }
  objc_msgSend(v5, "setUnauthenticatedRequestsAllowed:", objc_msgSend(v9, "BOOLValue"));
  objc_msgSend(v5, "setAllowExplicitContent:", objc_msgSend(v10, "BOOLValue"));
  [v5 setVoiceIDAllowedByUser:v11 == (id)1];
  id v17 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v18 = v17;
    id v19 = [v5 homeUserUUID];
    int v20 = 136316419;
    id v21 = "-[ADMultiUserService _updateCommunalDeviceUser:withSettings:]";
    __int16 v22 = 2112;
    id v23 = v10;
    __int16 v24 = 2112;
    id v25 = v7;
    __int16 v26 = 2112;
    unsigned __int8 v27 = v8;
    __int16 v28 = 2112;
    __int16 v29 = v9;
    __int16 v30 = 2113;
    id v31 = v19;
    _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "%s allowExplicitContent: (%@) setVoiceIDAllowedByUser: (%@) personalDomainsIsEnabled: (%@) unauthenticatedRequestsAllowed: (%@) for (%{private}@)", (uint8_t *)&v20, 0x3Eu);
  }
}

- (BOOL)personalDomainSettingsDidChange:(id)a3 newUserSettings:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = [v6 objectForKey:@"personalDomainsIsEnabled"];
  unsigned int v8 = [v7 BOOLValue];

  int v9 = [v6 objectForKey:@"allowUnauthenticatedRequests"];
  unsigned int v10 = [v9 BOOLValue];

  id v11 = [v6 objectForKey:@"allowExplicitContent"];

  unsigned int v12 = [v11 BOOLValue];
  if (v8 == [v5 personalDomainsIsEnabled]
    && v10 == [v5 unauthenticatedRequestsAllowed])
  {
    unsigned int v13 = v12 ^ [v5 allowExplicitContent];
  }
  else
  {
    LOBYTE(v13) = 1;
  }

  return v13;
}

- (void)_saveDeviceOwnerToKeychainCache
{
  deviceOwner = self->_deviceOwner;
  if (deviceOwner)
  {
    uint64_t v4 = [(ADCommunalDeviceUser *)deviceOwner sharedUserID];
    if (v4)
    {
      id v5 = (void *)v4;
      id v6 = +[ADPreferences sharedPreferences];
      BOOL v7 = [v6 sharedUserIdentifier];
      unsigned __int8 v8 = [v7 isEqualToString:v5];

      if ((v8 & 1) == 0)
      {
        int v9 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          int v15 = 136315138;
          BOOL v16 = "-[ADMultiUserService _saveDeviceOwnerToKeychainCache]";
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s Saving Device Owner's sharedUserIdentifier to keychain cache", (uint8_t *)&v15, 0xCu);
        }
        unsigned int v10 = +[ADPreferences sharedPreferences];
        id v11 = [(ADCommunalDeviceUser *)self->_deviceOwner sharedUserID];
        unsigned int v12 = [(ADCommunalDeviceUser *)self->_deviceOwner loggableSharedUserID];
        [v10 setSharedUserIdentifier:v11 loggingSharedUserIdentifier:v12];
      }
    }
    else
    {
      BOOL v14 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        int v15 = 136315138;
        BOOL v16 = "-[ADMultiUserService _saveDeviceOwnerToKeychainCache]";
        _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s Device Owner exists but with a nil sharedUserId", (uint8_t *)&v15, 0xCu);
      }
      id v5 = 0;
    }
  }
  else
  {
    unsigned int v13 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v15 = 136315138;
      BOOL v16 = "-[ADMultiUserService _saveDeviceOwnerToKeychainCache]";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s Device Owner is nil, clearing sharedUserId from keychain cache", (uint8_t *)&v15, 0xCu);
    }
    id v5 = +[ADPreferences sharedPreferences];
    [v5 setSharedUserIdentifier:0 loggingSharedUserIdentifier:0];
  }
}

- (void)_setSharedUserSiriLanguage:(id)a3 forSharedUser:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v12 = 136315650;
    unsigned int v13 = "-[ADMultiUserService _setSharedUserSiriLanguage:forSharedUser:]";
    __int16 v14 = 2112;
    id v15 = v6;
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s siriLanguage:%@ sharedUserID:%@", (uint8_t *)&v12, 0x20u);
  }
  sharedUsersSiriLanguageBySharedUserID = self->_sharedUsersSiriLanguageBySharedUserID;
  if (!sharedUsersSiriLanguageBySharedUserID)
  {
    unsigned int v10 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    id v11 = self->_sharedUsersSiriLanguageBySharedUserID;
    self->_sharedUsersSiriLanguageBySharedUserID = v10;

    sharedUsersSiriLanguageBySharedUserID = self->_sharedUsersSiriLanguageBySharedUserID;
  }
  [(NSMutableDictionary *)sharedUsersSiriLanguageBySharedUserID setValue:v6 forKey:v7];
}

- (void)_setPrimaryUserSiriLanguage:(id)a3
{
  uint64_t v4 = (NSString *)a3;
  id v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    unsigned __int8 v8 = "-[ADMultiUserService _setPrimaryUserSiriLanguage:]";
    __int16 v9 = 2112;
    unsigned int v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s siriLanguage:%@", (uint8_t *)&v7, 0x16u);
  }
  primaryUserSiriLanguage = self->_primaryUserSiriLanguage;
  self->_primaryUserSiriLanguage = v4;
}

- (void)_setSharedUserMeDevice:(BOOL)a3 forSharedUser:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  int v7 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v12 = 136315650;
    unsigned int v13 = "-[ADMultiUserService _setSharedUserMeDevice:forSharedUser:]";
    __int16 v14 = 1024;
    BOOL v15 = v4;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s meDevice:%d, sharedUserID:%@", (uint8_t *)&v12, 0x1Cu);
  }
  sharedUsersMeDeviceBySharedUserID = self->_sharedUsersMeDeviceBySharedUserID;
  if (!sharedUsersMeDeviceBySharedUserID)
  {
    __int16 v9 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    unsigned int v10 = self->_sharedUsersMeDeviceBySharedUserID;
    self->_sharedUsersMeDeviceBySharedUserID = v9;

    sharedUsersMeDeviceBySharedUserID = self->_sharedUsersMeDeviceBySharedUserID;
  }
  id v11 = +[NSNumber numberWithBool:v4];
  [(NSMutableDictionary *)sharedUsersMeDeviceBySharedUserID setValue:v11 forKey:v6];
}

- (void)_setPrimaryUserMeDevice:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315394;
    int v7 = "-[ADMultiUserService _setPrimaryUserMeDevice:]";
    __int16 v8 = 1024;
    BOOL v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s meDevice:%d", (uint8_t *)&v6, 0x12u);
  }
  self->_primaryUserMeDevice = v3;
}

- (void)_saveSharedUsers
{
  BOOL v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    id v39 = "-[ADMultiUserService _saveSharedUsers]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  id v4 = objc_alloc_init((Class)NSMutableArray);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v5 = self->_sharedUsersBySharedUserID;
  id v6 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v34 objects:v43 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v35;
    do
    {
      BOOL v9 = 0;
      do
      {
        if (*(void *)v35 != v8) {
          objc_enumerationMutation(v5);
        }
        unsigned int v10 = [(NSMutableDictionary *)self->_sharedUsersBySharedUserID objectForKey:*(void *)(*((void *)&v34 + 1) + 8 * (void)v9)];
        if (([v10 nonCloudSyncedUser] & 1) == 0)
        {
          if (AFIsATV())
          {
            id v11 = [v10 iCloudAltDSID];

            if (v11)
            {
              int v12 = [v10 iCloudAltDSID];
              if (_AFPreferencesSiriRMVSetting() == 1)
              {
                [v10 setVoiceIDAllowedByUser:1];
              }
              else
              {
                unsigned int v13 = [v10 iCloudAltDSID];
                [v10 setVoiceIDAllowedByUser:_AFPreferencesSiriRMVSetting() == 2];
              }
            }
          }
          __int16 v14 = [v10 dictionaryRepresentation];
          [v4 addObject:v14];
        }
        BOOL v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v34 objects:v43 count:16];
    }
    while (v7);
  }

  if (+[AFFeatureFlags isLassoEnabled])
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    BOOL v15 = self->_sharedUsersByiCloudAltDSID;
    id v16 = [(NSMutableDictionary *)v15 countByEnumeratingWithState:&v30 objects:v42 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v31;
      do
      {
        id v19 = 0;
        do
        {
          if (*(void *)v31 != v18) {
            objc_enumerationMutation(v15);
          }
          int v20 = -[NSMutableDictionary objectForKey:](self->_sharedUsersByiCloudAltDSID, "objectForKey:", *(void *)(*((void *)&v30 + 1) + 8 * (void)v19), (void)v30);
          id v21 = [v20 sharedUserID];

          if (!v21)
          {
            __int16 v22 = [v20 dictionaryRepresentation];
            [v4 addObject:v22];
          }
          id v19 = (char *)v19 + 1;
        }
        while (v17 != v19);
        id v17 = [(NSMutableDictionary *)v15 countByEnumeratingWithState:&v30 objects:v42 count:16];
      }
      while (v17);
    }
  }
  id v23 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    id v39 = "-[ADMultiUserService _saveSharedUsers]";
    __int16 v40 = 2112;
    id v41 = v4;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  if (objc_msgSend(v4, "count", (void)v30))
  {
    __int16 v24 = +[ADPreferences sharedPreferences];
    id v25 = v24;
    id v26 = v4;
  }
  else
  {
    unsigned __int8 v27 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      id v39 = "-[ADMultiUserService _saveSharedUsers]";
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "%s Did not find any shared users to save", buf, 0xCu);
    }
    __int16 v24 = +[ADPreferences sharedPreferences];
    id v25 = v24;
    id v26 = 0;
  }
  [v24 setMultiUserSharedUsers:v26];

  primaryUser = self->_primaryUser;
  if (primaryUser && ![(ADCommunalDeviceUser *)primaryUser nonCloudSyncedUser])
  {
    [(ADMultiUserService *)self _savePrimaryAndDeviceOwner];
  }
  else
  {
    __int16 v29 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      id v39 = "-[ADMultiUserService _saveSharedUsers]";
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "%s Did not find any primary user to save", buf, 0xCu);
    }
    [(ADPreferences *)self->_adPreferences setMultiUserPrimaryUser:0];
  }
}

- (void)_savePrimaryAndDeviceOwner
{
  if (AFIsATV())
  {
    BOOL v3 = [(ADCommunalDeviceUser *)self->_primaryUser iCloudAltDSID];

    if (v3)
    {
      primaryUser = self->_primaryUser;
      id v5 = [(ADCommunalDeviceUser *)primaryUser iCloudAltDSID];
      if (_AFPreferencesSiriRMVSetting() == 1)
      {
        [(ADCommunalDeviceUser *)primaryUser setVoiceIDAllowedByUser:1];
      }
      else
      {
        id v6 = [(ADCommunalDeviceUser *)self->_primaryUser iCloudAltDSID];
        [(ADCommunalDeviceUser *)primaryUser setVoiceIDAllowedByUser:_AFPreferencesSiriRMVSetting() == 2];
      }
    }
  }
  id v7 = +[ADPreferences sharedPreferences];
  uint64_t v8 = [(ADCommunalDeviceUser *)self->_primaryUser dictionaryRepresentation];
  [v7 setMultiUserPrimaryUser:v8];

  BOOL v9 = +[ADPreferences sharedPreferences];
  unsigned int v10 = [(ADCommunalDeviceUser *)self->_deviceOwner dictionaryRepresentation];
  [v9 setDeviceOwner:v10];

  id v11 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v13 = 136315138;
    __int16 v14 = "-[ADMultiUserService _savePrimaryAndDeviceOwner]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s Posting notification as primary user info updated", (uint8_t *)&v13, 0xCu);
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, kAFSharedUserUpdateDarwinNotification, 0, 0, 1u);
}

- (void)_updateSAMultiUserInfo
{
  id v3 = objc_alloc_init((Class)SAMultiUserInfo);
  id v4 = objc_alloc_init((Class)NSMutableArray);
  id v5 = [(SAMultiUserInfo *)self->_multiUserInfo homeMembers];
  BOOL v6 = [v5 count] != 0;

  id v7 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    usersWithAvailableVoiceProfiles = self->_usersWithAvailableVoiceProfiles;
    BOOL v9 = v7;
    id v10 = [(NSMutableArray *)usersWithAvailableVoiceProfiles count];
    id v11 = [(NSMutableDictionary *)self->_sharedUsersBySharedUserID count];
    int v12 = [(SAMultiUserInfo *)self->_multiUserInfo homeMembers];
    *(_DWORD *)long long buf = 136315906;
    *(void *)&uint8_t buf[4] = "-[ADMultiUserService _updateSAMultiUserInfo]";
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v10;
    *(_WORD *)&buf[22] = 2048;
    id v41 = v11;
    __int16 v42 = 2048;
    id v43 = [v12 count];
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s _usersWithAvailableVoiceProfiles: %lu, _sharedUsersBySharedUserID: %lu, multiUsersPreviousCount: %lu", buf, 0x2Au);
  }
  if ([(ADMultiUserService *)self _isHostingMultiUserLanguage])
  {
    uint64_t v13 = [(ADMultiUserService *)self _homeMembersForPlatform];

    id v4 = (id)v13;
  }
  else
  {
    BOOL v6 = 0;
  }
  if (self->_pitchesForHomeMembers)
  {
    objc_msgSend(v3, "setMultiUserPitchComposition:");
  }
  else
  {
    __int16 v14 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[ADMultiUserService _updateSAMultiUserInfo]";
      _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "%s No pitches available for HomeMembers", buf, 0xCu);
    }
  }
  BOOL v15 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    long long v30 = v15;
    id v31 = [v4 count];
    *(_DWORD *)long long buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ADMultiUserService _updateSAMultiUserInfo]";
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v31;
    _os_log_debug_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "%s homeMembers: %lu", buf, 0x16u);
  }
  if ([v4 count])
  {
    *(void *)long long buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    id v41 = 0;
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_1002A18A4;
    v33[3] = &unk_100509828;
    v33[4] = buf;
    [v4 enumerateObjectsUsingBlock:v33];
    if (*(void *)(*(void *)&buf[8] + 24))
    {
      id v16 = +[NSString stringWithFormat:@"%lu", *(void *)(*(void *)&buf[8] + 24)];
      id v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%lu", [v4 count]);
      uint64_t v18 = +[AFAnalytics sharedAnalytics];
      v38[0] = @"missing_count";
      v38[1] = @"total";
      v39[0] = v16;
      v39[1] = v17;
      id v19 = +[NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:2];
      [v18 logEventWithType:6117 context:v19];
    }
    if (self->_saUnknownUser)
    {
      int v20 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        long long v32 = [(SAHomeMemberInfo *)self->_saUnknownUser sharedUserId];
        *(_DWORD *)long long v34 = 136315395;
        long long v35 = "-[ADMultiUserService _updateSAMultiUserInfo]";
        __int16 v36 = 2113;
        long long v37 = v32;
        _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "%s adding _saUnknownUser: %{private}@", v34, 0x16u);
      }
      [v4 addObject:self->_saUnknownUser];
    }
    [v3 setHomeMembers:v4];
    _Block_object_dispose(buf, 8);
  }
  else if (v6)
  {
    id v21 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[ADMultiUserService _updateSAMultiUserInfo]";
      _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%s Send empty MultiUserInfo", buf, 0xCu);
    }
    [v3 setHomeMembers:0];
  }
  __int16 v22 = [(ADMultiUserService *)self _inFlightVoiceProfilesByUUID];
  id v23 = [v22 count];

  [v3 setVoiceProfilesAreInFlight:v23 != 0];
  __int16 v24 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ADMultiUserService _updateSAMultiUserInfo]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v23 != 0;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%s MultiUserInfo profiles are in-flight: %{BOOL}d", buf, 0x12u);
  }
  id v25 = [(SAMultiUserInfo *)self->_multiUserInfo dictionary];
  id v26 = [v3 dictionary];
  unsigned __int8 v27 = [v25 isEqualToDictionary:v26];

  if ((v27 & 1) == 0)
  {
    __int16 v28 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[ADMultiUserService _updateSAMultiUserInfo]";
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "%s Marking MultiUserInfo as dirty", buf, 0xCu);
    }
    objc_storeStrong((id *)&self->_multiUserInfo, v3);
    self->_unsigned int isMultiUserInfoDirty = 1;
    [(ADMultiUserService *)self _describeSAMultiUserInfo:v4];
    __int16 v29 = +[NSNotificationCenter defaultCenter];
    [v29 postNotificationName:@"ADMultiUsersDidChangeNotification" object:0];
  }
}

- (id)_homeMembersForPlatform
{
  id v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    id v93 = "-[ADMultiUserService _homeMembersForPlatform]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  id v84 = objc_alloc_init((Class)NSMutableArray);
  id v4 = self;
  primaryUser = self->_primaryUser;
  BOOL v6 = AFSiriLogContextDaemon;
  BOOL v7 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG);
  if (primaryUser)
  {
    if (v7)
    {
      id v68 = v6;
      v69 = [(ADCommunalDeviceUser *)primaryUser companionAssistantID];
      unsigned int v70 = [(ADCommunalDeviceUser *)self->_primaryUser sharedUserID];
      unint64_t v71 = [(ADCommunalDeviceUser *)self->_primaryUser voiceIDAllowedByUser];
      unsigned int v72 = [(ADCommunalDeviceUser *)self->_primaryUser nonCloudSyncedUser];
      *(_DWORD *)long long buf = 136316163;
      id v93 = "-[ADMultiUserService _homeMembersForPlatform]";
      __int16 v94 = 2113;
      v95 = v69;
      __int16 v96 = 2113;
      unint64_t v97 = (unint64_t)v70;
      __int16 v98 = 2048;
      unint64_t v99 = v71;
      __int16 v100 = 2048;
      uint64_t v101 = v72;
      _os_log_debug_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEBUG, "%s _primaryUser companionAssistantID: %{private}@, sharedUserID: %{private}@, voiceIDAllowedByUser=%lu, nonCloudSyncedUser=%lu", buf, 0x34u);

      primaryUser = self->_primaryUser;
    }
    uint64_t v8 = [(ADCommunalDeviceUser *)primaryUser companionAssistantID];

    if (v8)
    {
      BOOL v9 = +[ADCommunalDeviceUser saHomeMemberInfo:self->_primaryUser];
      if (v9
        && ([(ADCommunalDeviceUser *)self->_primaryUser voiceIDAllowedByUser]
         || [(ADCommunalDeviceUser *)self->_primaryUser nonCloudSyncedUser]))
      {
        usersWithAvailableVoiceProfiles = self->_usersWithAvailableVoiceProfiles;
        id v11 = [(ADCommunalDeviceUser *)self->_primaryUser sharedUserID];
        LODWORD(usersWithAvailableVoiceProfiles) = [(NSMutableArray *)usersWithAvailableVoiceProfiles containsObject:v11];

        if (usersWithAvailableVoiceProfiles)
        {
          [v84 addObject:v9];
          int v12 = (void *)AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v73 = self->_primaryUser;
            v74 = v12;
            v75 = [(ADCommunalDeviceUser *)v73 sharedUserID];
            id v76 = [(ADCommunalDeviceUser *)self->_primaryUser homeUserUUID];
            id v77 = [(ADCommunalDeviceUser *)self->_primaryUser iCloudAltDSID];
            *(_DWORD *)long long buf = 136315907;
            id v93 = "-[ADMultiUserService _homeMembersForPlatform]";
            __int16 v94 = 2113;
            v95 = v75;
            __int16 v96 = 2113;
            unint64_t v97 = (unint64_t)v76;
            __int16 v98 = 2113;
            unint64_t v99 = (unint64_t)v77;
            _os_log_debug_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEBUG, "%s Adding primaryUser with sharedUserId %{private}@ and homeUserUUID %{private}@ and iCloudAltDSID %{private}@", buf, 0x2Au);
          }
          uint64_t v13 = [v9 lastVisitedAceHost];

          if (!v13)
          {
            __int16 v14 = (void *)AFSiriLogContextDaemon;
            if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
            {
              BOOL v15 = self->_primaryUser;
              id v16 = v14;
              id v17 = [(ADCommunalDeviceUser *)v15 sharedUserID];
              *(_DWORD *)long long buf = 136315395;
              id v93 = "-[ADMultiUserService _homeMembersForPlatform]";
              __int16 v94 = 2113;
              v95 = v17;
              _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s PrimaryUser %{private}@ has nil aceHost", buf, 0x16u);
            }
          }
          if ([(ADMultiUserService *)self _isTrackingUUIDForInFlightVoiceProfile:self->_primaryUser])
          {
            uint64_t v18 = (void *)AFSiriLogContextDaemon;
            if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
            {
              id v19 = self->_primaryUser;
              int v20 = v18;
              id v21 = [(ADCommunalDeviceUser *)v19 homeUserUUID];
              *(_DWORD *)long long buf = 136315395;
              id v93 = "-[ADMultiUserService _homeMembersForPlatform]";
              __int16 v94 = 2113;
              v95 = v21;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%s HomeUserID (%{private}@) voice profile is available but it's still being tracked as in-flight. Stop tracking it", buf, 0x16u);
            }
            [(ADMultiUserService *)self _untrackUUIDsForUser:self->_primaryUser];
          }
        }
      }
    }
  }
  else if (v7)
  {
    *(_DWORD *)long long buf = 136315138;
    id v93 = "-[ADMultiUserService _homeMembersForPlatform]";
    _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%s _primaryUser is nil", buf, 0xCu);
  }
  if (AFIsATV())
  {
    if (!self->_primaryUser)
    {
      deviceOwner = self->_deviceOwner;
      if (deviceOwner)
      {
        id v23 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 136315138;
          id v93 = "-[ADMultiUserService _homeMembersForPlatform]";
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "%s primary User is nil but we have a device owner.", buf, 0xCu);
          deviceOwner = self->_deviceOwner;
        }
        __int16 v24 = +[ADCommunalDeviceUser saHomeMemberInfo:deviceOwner];
        if (v24
          && ([(ADCommunalDeviceUser *)self->_deviceOwner voiceIDAllowedByUser]
           || [(ADCommunalDeviceUser *)self->_deviceOwner nonCloudSyncedUser]))
        {
          id v25 = self->_usersWithAvailableVoiceProfiles;
          id v26 = [(ADCommunalDeviceUser *)self->_deviceOwner sharedUserID];
          LODWORD(v25) = [(NSMutableArray *)v25 containsObject:v26];

          if (v25)
          {
            [v84 addObject:v24];
            unsigned __int8 v27 = (void *)AFSiriLogContextDaemon;
            if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
            {
              v78 = self->_deviceOwner;
              unsigned __int8 v79 = v27;
              v80 = [(ADCommunalDeviceUser *)v78 sharedUserID];
              v81 = [(ADCommunalDeviceUser *)self->_deviceOwner homeUserUUID];
              int v82 = [(ADCommunalDeviceUser *)self->_deviceOwner iCloudAltDSID];
              *(_DWORD *)long long buf = 136315907;
              id v93 = "-[ADMultiUserService _homeMembersForPlatform]";
              __int16 v94 = 2113;
              v95 = v80;
              __int16 v96 = 2113;
              unint64_t v97 = (unint64_t)v81;
              __int16 v98 = 2113;
              unint64_t v99 = (unint64_t)v82;
              _os_log_debug_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_DEBUG, "%s Adding device owner with sharedUserId %{private}@ and homeUserUUID %{private}@ and iCloudAltDSID %{private}@", buf, 0x2Au);
            }
            __int16 v28 = [v24 lastVisitedAceHost];

            if (!v28)
            {
              __int16 v29 = (void *)AFSiriLogContextDaemon;
              if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
              {
                long long v30 = self->_deviceOwner;
                id v31 = v29;
                long long v32 = [(ADCommunalDeviceUser *)v30 sharedUserID];
                *(_DWORD *)long long buf = 136315395;
                id v93 = "-[ADMultiUserService _homeMembersForPlatform]";
                __int16 v94 = 2113;
                v95 = v32;
                _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "%s device owner %{private}@ has nil aceHost", buf, 0x16u);
              }
            }
            if ([(ADMultiUserService *)self _isTrackingUUIDForInFlightVoiceProfile:self->_deviceOwner])
            {
              long long v33 = (void *)AFSiriLogContextDaemon;
              if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
              {
                long long v34 = self->_deviceOwner;
                long long v35 = v33;
                __int16 v36 = [(ADCommunalDeviceUser *)v34 homeUserUUID];
                *(_DWORD *)long long buf = 136315395;
                id v93 = "-[ADMultiUserService _homeMembersForPlatform]";
                __int16 v94 = 2113;
                v95 = v36;
                _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "%s HomeUserID (%{private}@) voice profile is available but it's still being tracked as in-flight. Stop tracking it", buf, 0x16u);
              }
              [(ADMultiUserService *)self _untrackUUIDsForUser:self->_deviceOwner];
            }
          }
        }
      }
    }
  }
  long long v89 = 0u;
  long long v90 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  obj = self->_sharedUsersBySharedUserID;
  id v37 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v87 objects:v91 count:16];
  if (v37)
  {
    id v39 = v37;
    uint64_t v40 = *(void *)v88;
    *(void *)&long long v38 = 136315907;
    long long v83 = v38;
    do
    {
      id v41 = 0;
      do
      {
        if (*(void *)v88 != v40) {
          objc_enumerationMutation(obj);
        }
        __int16 v42 = *(void **)(*((void *)&v87 + 1) + 8 * (void)v41);
        id v43 = -[NSMutableDictionary objectForKey:](v4->_sharedUsersBySharedUserID, "objectForKey:", v42, v83);
        BOOL v44 = +[ADCommunalDeviceUser saHomeMemberInfo:v43];
        id v45 = (void *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
        {
          BOOL v58 = v45;
          unint64_t v59 = [v43 voiceIDAllowedByUser];
          id v60 = [v43 companionAssistantID];
          unsigned int v61 = [v43 nonCloudSyncedUser];
          *(_DWORD *)long long buf = 136316163;
          id v93 = "-[ADMultiUserService _homeMembersForPlatform]";
          __int16 v94 = 2113;
          v95 = v42;
          __int16 v96 = 2048;
          unint64_t v97 = v59;
          __int16 v98 = 2113;
          unint64_t v99 = (unint64_t)v60;
          __int16 v100 = 2048;
          uint64_t v101 = v61;
          _os_log_debug_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEBUG, "%s sharedUserId: %{private}@, voiceIDAllowedByUser: %lu, companionAssistantID: %{private}@, nonCloudSyncedUser: %lu", buf, 0x34u);

          id v4 = self;
          if (!v44) {
            goto LABEL_67;
          }
        }
        else if (!v44)
        {
          goto LABEL_67;
        }
        unsigned int v46 = [v43 voiceIDAllowedByUser];
        if (v46)
        {
          v2 = [v43 companionAssistantID];
          if (!v2 && ([v43 nonCloudSyncedUser] & 1) == 0) {
            goto LABEL_67;
          }
        }
        else if (![v43 nonCloudSyncedUser])
        {
          goto LABEL_67;
        }
        __int16 v47 = v4->_usersWithAvailableVoiceProfiles;
        unsigned __int8 v48 = [v43 sharedUserID];
        unsigned int v49 = [(NSMutableArray *)v47 containsObject:v48];

        if (v46)
        {

          if ((v49 & 1) == 0) {
            goto LABEL_56;
          }
        }
        else if (!v49)
        {
LABEL_56:
          id v4 = self;
          goto LABEL_67;
        }
        [v84 addObject:v44];
        v50 = (void *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
        {
          unsigned __int8 v62 = v50;
          id v63 = [v43 sharedUserID];
          v64 = [v43 homeUserUUID];
          v65 = [v43 iCloudAltDSID];
          *(_DWORD *)long long buf = v83;
          id v93 = "-[ADMultiUserService _homeMembersForPlatform]";
          __int16 v94 = 2113;
          v95 = v63;
          __int16 v96 = 2113;
          unint64_t v97 = (unint64_t)v64;
          __int16 v98 = 2113;
          unint64_t v99 = (unint64_t)v65;
          _os_log_debug_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEBUG, "%s Adding user with sharedUserId %{private}@ and homeUserUUID %{private}@ and iCloudAltDSID %{private}@", buf, 0x2Au);
        }
        id v51 = [v44 lastVisitedAceHost];

        if (!v51)
        {
          id v52 = (void *)AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
          {
            id v53 = v52;
            unsigned __int8 v54 = [v43 sharedUserID];
            *(_DWORD *)long long buf = 136315395;
            id v93 = "-[ADMultiUserService _homeMembersForPlatform]";
            __int16 v94 = 2113;
            v95 = v54;
            _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_INFO, "%s SharedUser %{private}@ has nil aceHost", buf, 0x16u);
          }
        }
        id v4 = self;
        if ([(ADMultiUserService *)self _isTrackingUUIDForInFlightVoiceProfile:v43])
        {
          uint64_t v55 = (void *)AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
          {
            BOOL v56 = v55;
            BOOL v57 = [v43 homeUserUUID];
            *(_DWORD *)long long buf = 136315395;
            id v93 = "-[ADMultiUserService _homeMembersForPlatform]";
            __int16 v94 = 2113;
            v95 = v57;
            _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_INFO, "%s removed HomeUserID (%{private}@) voice profile is available but it's still being tracked as in-flight. Stop tracking it", buf, 0x16u);

            id v4 = self;
          }
          [(ADMultiUserService *)v4 _untrackUUIDsForUser:v43];
        }
LABEL_67:

        id v41 = (char *)v41 + 1;
      }
      while (v39 != v41);
      id v66 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v87 objects:v91 count:16];
      id v39 = v66;
    }
    while (v66);
  }

  return v84;
}

- (void)_describeSAMultiUserInfo:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (!v3 || ![v3 count])
  {
    id v5 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      id v21 = "-[ADMultiUserService _describeSAMultiUserInfo:]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Home members array is empty", buf, 0xCu);
    }
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v26 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = (void *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          int v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          uint64_t v13 = v11;
          __int16 v14 = [v12 enrollmentName];
          BOOL v15 = [v12 sharedUserId];
          *(_DWORD *)long long buf = 136315651;
          id v21 = "-[ADMultiUserService _describeSAMultiUserInfo:]";
          __int16 v22 = 2113;
          id v23 = v14;
          __int16 v24 = 2113;
          id v25 = v15;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s homeMember enrollmentName: %{private}@ sharedUserId: %{private}@", buf, 0x20u);
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v26 count:16];
    }
    while (v8);
  }
}

- (unint64_t)countUsersWithMatchingSiriLanguage
{
  id v3 = +[AFPreferences sharedPreferences];
  id v4 = [v3 languageCode];

  if (self->_primaryUser)
  {
    unsigned int v5 = [v4 isEqualToString:self->_primaryUserSiriLanguage];
    id v6 = (void *)AFSiriLogContextDaemon;
    BOOL v7 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG);
    if (v5)
    {
      if (v7)
      {
        primaryUser = self->_primaryUser;
        __int16 v28 = v6;
        __int16 v29 = [(ADCommunalDeviceUser *)primaryUser sharedUserID];
        long long v30 = [(ADCommunalDeviceUser *)self->_primaryUser settings];
        id v31 = [v30 objectForKey:SAHomeMemberSettingsPreferredLanguagePListKey];
        *(_DWORD *)long long buf = 136315906;
        id v52 = "-[ADMultiUserService countUsersWithMatchingSiriLanguage]";
        __int16 v53 = 2112;
        unsigned __int8 v54 = v29;
        __int16 v55 = 2112;
        unint64_t v56 = (unint64_t)v31;
        __int16 v57 = 2048;
        unint64_t v8 = 1;
        uint64_t v58 = 1;
        _os_log_debug_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "%s Primary user's Siri language matches HomePod's. sharedUserId: %@, device language: %@, current count: %lu", buf, 0x2Au);
      }
      else
      {
        unint64_t v8 = 1;
      }
      goto LABEL_9;
    }
    if (v7)
    {
      primaryUserSiriLanguage = self->_primaryUserSiriLanguage;
      long long v33 = self->_primaryUser;
      long long v34 = v6;
      long long v35 = [(ADCommunalDeviceUser *)v33 settings];
      __int16 v36 = [v35 objectForKey:SAHomeMemberSettingsPreferredLanguagePListKey];
      id v37 = [(ADCommunalDeviceUser *)self->_primaryUser sharedUserID];
      *(_DWORD *)long long buf = 136316162;
      id v52 = "-[ADMultiUserService countUsersWithMatchingSiriLanguage]";
      __int16 v53 = 2112;
      unsigned __int8 v54 = primaryUserSiriLanguage;
      __int16 v55 = 2112;
      unint64_t v56 = (unint64_t)v36;
      __int16 v57 = 2112;
      uint64_t v58 = (uint64_t)v37;
      __int16 v59 = 2048;
      unint64_t v60 = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEBUG, "%s Primary user's Siri language (%@) doesn't match HomePod's. sharedUserId: %@, device language: %@, current count: %lu", buf, 0x34u);
    }
  }
  unint64_t v8 = 0;
LABEL_9:
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  obj = self->_sharedUsersBySharedUserID;
  id v9 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v46 objects:v50 count:16];
  if (!v9) {
    goto LABEL_23;
  }
  id v11 = v9;
  uint64_t v12 = *(void *)v47;
  uint64_t v44 = SAHomeMemberSettingsPreferredLanguagePListKey;
  *(void *)&long long v10 = 136316162;
  long long v38 = v10;
  do
  {
    uint64_t v13 = 0;
    do
    {
      if (*(void *)v47 != v12) {
        objc_enumerationMutation(obj);
      }
      __int16 v14 = -[NSMutableDictionary objectForKeyedSubscript:](self->_sharedUsersBySharedUserID, "objectForKeyedSubscript:", *(void *)(*((void *)&v46 + 1) + 8 * (void)v13), v38);
      sharedUsersSiriLanguageBySharedUserID = self->_sharedUsersSiriLanguageBySharedUserID;
      long long v16 = [v14 sharedUserID];
      long long v17 = [(NSMutableDictionary *)sharedUsersSiriLanguageBySharedUserID objectForKeyedSubscript:v16];

      if ([v4 isEqualToString:v17])
      {
        ++v8;
        long long v18 = (void *)AFSiriLogContextDaemon;
        if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_18;
        }
        os_log_t log = v18;
        uint64_t v40 = [v14 sharedUserID];
        id v41 = [v14 settings];
        id v39 = [v41 objectForKey:v44];
        *(_DWORD *)long long buf = 136315906;
        id v52 = "-[ADMultiUserService countUsersWithMatchingSiriLanguage]";
        __int16 v53 = 2112;
        unsigned __int8 v54 = v40;
        __int16 v55 = 2112;
        unint64_t v56 = (unint64_t)v39;
        __int16 v57 = 2048;
        uint64_t v58 = v8;
        os_log_t v19 = log;
        int v20 = log;
        id v21 = "%s Secondary user's Siri language code matches HomePod's. sharedUserId: %@, device language: %@, current count: %lu";
        uint32_t v22 = 42;
      }
      else
      {
        id v23 = (void *)AFSiriLogContextDaemon;
        if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_18;
        }
        os_log_t loga = v23;
        uint64_t v40 = [v14 sharedUserID];
        id v41 = [v14 settings];
        id v39 = [v41 objectForKey:v44];
        *(_DWORD *)long long buf = v38;
        id v52 = "-[ADMultiUserService countUsersWithMatchingSiriLanguage]";
        __int16 v53 = 2112;
        unsigned __int8 v54 = v17;
        __int16 v55 = 2112;
        unint64_t v56 = (unint64_t)v40;
        __int16 v57 = 2112;
        uint64_t v58 = (uint64_t)v39;
        __int16 v59 = 2048;
        unint64_t v60 = v8;
        os_log_t v19 = loga;
        int v20 = loga;
        id v21 = "%s Secondary user's Siri language code (%@) doesn't match HomePod's. sharedUserId: %@, device language: %@"
              ", current count: %lu";
        uint32_t v22 = 52;
      }
      _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, v21, buf, v22);

LABEL_18:
      uint64_t v13 = (char *)v13 + 1;
    }
    while (v11 != v13);
    id v24 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v46 objects:v50 count:16];
    id v11 = v24;
  }
  while (v24);
LABEL_23:

  id v25 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 136315650;
    id v52 = "-[ADMultiUserService countUsersWithMatchingSiriLanguage]";
    __int16 v53 = 2112;
    unsigned __int8 v54 = (NSString *)v4;
    __int16 v55 = 2048;
    unint64_t v56 = v8;
    _os_log_debug_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "%s Total users with matching Siri languages to HomePod's (%@): %lu", buf, 0x20u);
  }

  return v8;
}

- (unint64_t)countUsersWithLocationServicesEnabled
{
  unint64_t primaryUser = (unint64_t)self->_primaryUser;
  if (primaryUser)
  {
    BOOL primaryUserMeDevice = self->_primaryUserMeDevice;
    unsigned int v5 = (void *)AFSiriLogContextDaemon;
    BOOL v6 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG);
    if (primaryUserMeDevice)
    {
      if (v6)
      {
        __int16 v28 = v5;
        __int16 v29 = [(id)primaryUser sharedUserID];
        *(_DWORD *)long long buf = 136315650;
        long long v38 = "-[ADMultiUserService countUsersWithLocationServicesEnabled]";
        __int16 v39 = 2112;
        unint64_t v40 = (unint64_t)v29;
        __int16 v41 = 2048;
        unint64_t primaryUser = 1;
        uint64_t v42 = 1;
        _os_log_debug_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "%s Primary user's location sharing enabled (meDevice). sharedUserId: %@, current count: %lu", buf, 0x20u);
      }
      else
      {
        unint64_t primaryUser = 1;
      }
    }
    else
    {
      if (v6)
      {
        long long v30 = v5;
        id v31 = [(id)primaryUser sharedUserID];
        *(_DWORD *)long long buf = 136315650;
        long long v38 = "-[ADMultiUserService countUsersWithLocationServicesEnabled]";
        __int16 v39 = 2112;
        unint64_t v40 = (unint64_t)v31;
        __int16 v41 = 2048;
        uint64_t v42 = 0;
        _os_log_debug_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "%s Primary user's location sharing disabled (not meDevice). sharedUserId: %@, current count: %lu", buf, 0x20u);
      }
      unint64_t primaryUser = 0;
    }
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  BOOL v7 = self->_sharedUsersBySharedUserID;
  id v8 = [(NSMutableDictionary *)v7 countByEnumeratingWithState:&v33 objects:v45 count:16];
  if (v8)
  {
    id v10 = v8;
    id v11 = 0;
    uint64_t v12 = *(void *)v34;
    *(void *)&long long v9 = 136315906;
    long long v32 = v9;
    while (1)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        __int16 v14 = v11;
        if (*(void *)v34 != v12) {
          objc_enumerationMutation(v7);
        }
        id v11 = -[NSMutableDictionary objectForKey:](self->_sharedUsersBySharedUserID, "objectForKey:", *(void *)(*((void *)&v33 + 1) + 8 * i), v32);

        sharedUsersMeDeviceBySharedUserID = self->_sharedUsersMeDeviceBySharedUserID;
        long long v16 = [v11 sharedUserID];
        long long v17 = [(NSMutableDictionary *)sharedUsersMeDeviceBySharedUserID objectForKey:v16];

        if (v17)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            ++primaryUser;
            id v24 = (void *)AFSiriLogContextDaemon;
            if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR)) {
              goto LABEL_26;
            }
            os_log_t v19 = v24;
            int v20 = [v11 sharedUserID];
            *(_DWORD *)long long buf = v32;
            long long v38 = "-[ADMultiUserService countUsersWithLocationServicesEnabled]";
            __int16 v39 = 2112;
            unint64_t v40 = (unint64_t)v17;
            __int16 v41 = 2112;
            uint64_t v42 = (uint64_t)v20;
            __int16 v43 = 2048;
            unint64_t v44 = primaryUser;
            _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s Secondary user's meDevice enablement field is corrupted. Counting as having a meDevice. value: %@, sharedUserId: %@, current count: %lu", buf, 0x2Au);
            goto LABEL_25;
          }
          if ([v17 BOOLValue])
          {
            ++primaryUser;
            long long v18 = (void *)AFSiriLogContextDaemon;
            if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_26;
            }
            os_log_t v19 = v18;
            int v20 = [v11 sharedUserID];
            *(_DWORD *)long long buf = 136315650;
            long long v38 = "-[ADMultiUserService countUsersWithLocationServicesEnabled]";
            __int16 v39 = 2112;
            unint64_t v40 = (unint64_t)v20;
            __int16 v41 = 2048;
            uint64_t v42 = primaryUser;
            id v21 = v19;
            uint32_t v22 = "%s Secondary user's device is meDevce. sharedUserId: %@, current count: %lu";
          }
          else
          {
            id v25 = (void *)AFSiriLogContextDaemon;
            if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_26;
            }
            os_log_t v19 = v25;
            int v20 = [v11 sharedUserID];
            *(_DWORD *)long long buf = 136315650;
            long long v38 = "-[ADMultiUserService countUsersWithLocationServicesEnabled]";
            __int16 v39 = 2112;
            unint64_t v40 = (unint64_t)v20;
            __int16 v41 = 2048;
            uint64_t v42 = primaryUser;
            id v21 = v19;
            uint32_t v22 = "%s Secondary user's device is not meDevice. sharedUserId: %@, current count: %lu";
          }
        }
        else
        {
          ++primaryUser;
          id v23 = (void *)AFSiriLogContextDaemon;
          if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_26;
          }
          os_log_t v19 = v23;
          int v20 = [v11 sharedUserID];
          *(_DWORD *)long long buf = 136315650;
          long long v38 = "-[ADMultiUserService countUsersWithLocationServicesEnabled]";
          __int16 v39 = 2112;
          unint64_t v40 = (unint64_t)v20;
          __int16 v41 = 2048;
          uint64_t v42 = primaryUser;
          id v21 = v19;
          uint32_t v22 = "%s Secondary user's meDevice enablement field doesn't exist. It may not have been uploaded yet. Counting"
                " as having a meDevice. sharedUserId: %@, current count: %lu";
        }
        _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, v22, buf, 0x20u);
LABEL_25:

LABEL_26:
      }
      id v10 = [(NSMutableDictionary *)v7 countByEnumeratingWithState:&v33 objects:v45 count:16];
      if (!v10)
      {

        break;
      }
    }
  }

  id v26 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 136315394;
    long long v38 = "-[ADMultiUserService countUsersWithLocationServicesEnabled]";
    __int16 v39 = 2048;
    unint64_t v40 = primaryUser;
    _os_log_debug_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "%s Total location sharing enabled users : %lu", buf, 0x16u);
  }
  return primaryUser;
}

- (unint64_t)countUsersWithPersonalRequestsEnabled
{
  unint64_t primaryUser = self->_primaryUser;
  if (primaryUser)
  {
    unsigned int v4 = [(ADCommunalDeviceUser *)primaryUser personalDomainsIsEnabled];
    unsigned int v5 = (void *)AFSiriLogContextDaemon;
    BOOL v6 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG);
    if (v4)
    {
      if (v6)
      {
        id v25 = self->_primaryUser;
        id v26 = v5;
        unsigned __int8 v27 = [(ADCommunalDeviceUser *)v25 sharedUserID];
        *(_DWORD *)long long buf = 136315650;
        long long v38 = "-[ADMultiUserService countUsersWithPersonalRequestsEnabled]";
        __int16 v39 = 2112;
        unint64_t v40 = (unint64_t)v27;
        __int16 v41 = 2048;
        unint64_t v7 = 1;
        uint64_t v42 = 1;
        _os_log_debug_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "%s Primary user's Siri personal requests enabled. sharedUserId: %@, current count: %lu", buf, 0x20u);
      }
      else
      {
        unint64_t v7 = 1;
      }
      goto LABEL_8;
    }
    if (v6)
    {
      __int16 v28 = self->_primaryUser;
      __int16 v29 = v5;
      long long v30 = [(ADCommunalDeviceUser *)v28 sharedUserID];
      *(_DWORD *)long long buf = 136315650;
      long long v38 = "-[ADMultiUserService countUsersWithPersonalRequestsEnabled]";
      __int16 v39 = 2112;
      unint64_t v40 = (unint64_t)v30;
      __int16 v41 = 2048;
      uint64_t v42 = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "%s Primary user's Siri personal requests disabled. sharedUserId: %@, current count: %lu", buf, 0x20u);
    }
  }
  unint64_t v7 = 0;
LABEL_8:
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v8 = self->_sharedUsersBySharedUserID;
  id v9 = [(NSMutableDictionary *)v8 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (!v9) {
    goto LABEL_23;
  }
  id v11 = v9;
  uint64_t v12 = 0;
  uint64_t v13 = *(void *)v33;
  *(void *)&long long v10 = 136315650;
  long long v31 = v10;
  do
  {
    __int16 v14 = 0;
    do
    {
      BOOL v15 = v12;
      if (*(void *)v33 != v13) {
        objc_enumerationMutation(v8);
      }
      uint64_t v12 = -[NSMutableDictionary objectForKey:](self->_sharedUsersBySharedUserID, "objectForKey:", *(void *)(*((void *)&v32 + 1) + 8 * (void)v14), v31, (void)v32);

      if ([v12 personalDomainsIsEnabled])
      {
        ++v7;
        long long v16 = (void *)AFSiriLogContextDaemon;
        if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_17;
        }
        long long v17 = v16;
        long long v18 = [v12 sharedUserID];
        *(_DWORD *)long long buf = v31;
        long long v38 = "-[ADMultiUserService countUsersWithPersonalRequestsEnabled]";
        __int16 v39 = 2112;
        unint64_t v40 = (unint64_t)v18;
        __int16 v41 = 2048;
        uint64_t v42 = v7;
        os_log_t v19 = v17;
        int v20 = "%s Secondary user's personal requests enabled. sharedUserId: %@, current count: %lu";
      }
      else
      {
        id v21 = (void *)AFSiriLogContextDaemon;
        if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_17;
        }
        long long v17 = v21;
        long long v18 = [v12 sharedUserID];
        *(_DWORD *)long long buf = v31;
        long long v38 = "-[ADMultiUserService countUsersWithPersonalRequestsEnabled]";
        __int16 v39 = 2112;
        unint64_t v40 = (unint64_t)v18;
        __int16 v41 = 2048;
        uint64_t v42 = v7;
        os_log_t v19 = v17;
        int v20 = "%s Secondary user's personal requests disabled. sharedUserId: %@, current count: %lu";
      }
      _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, v20, buf, 0x20u);

LABEL_17:
      __int16 v14 = (char *)v14 + 1;
    }
    while (v11 != v14);
    id v22 = [(NSMutableDictionary *)v8 countByEnumeratingWithState:&v32 objects:v36 count:16];
    id v11 = v22;
  }
  while (v22);

LABEL_23:
  id v23 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 136315394;
    long long v38 = "-[ADMultiUserService countUsersWithPersonalRequestsEnabled]";
    __int16 v39 = 2048;
    unint64_t v40 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "%s Total personal requests enabled users : %lu", buf, 0x16u);
  }
  return v7;
}

- (unint64_t)countUsersWithSiriCloudSyncEnabled
{
  sharedUsersSiriCloudSyncBySharedUserID = self->_sharedUsersSiriCloudSyncBySharedUserID;
  if (sharedUsersSiriCloudSyncBySharedUserID)
  {
    if ((unint64_t)[(NSMutableDictionary *)sharedUsersSiriCloudSyncBySharedUserID count] >= 0x65)
    {
      unsigned int v4 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        __int16 v28 = self->_sharedUsersSiriCloudSyncBySharedUserID;
        __int16 v29 = v4;
        *(_DWORD *)long long buf = 136315650;
        id v37 = "-[ADMultiUserService countUsersWithSiriCloudSyncEnabled]";
        __int16 v38 = 2048;
        uint64_t v39 = 100;
        __int16 v40 = 2048;
        id v41 = [(NSMutableDictionary *)v28 count];
        _os_log_debug_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "%s Clean up as the count is greater than %lu. _sharedUsersSiriCloudSyncBySharedUserID: %lu", buf, 0x20u);
      }
      [(NSMutableDictionary *)self->_sharedUsersSiriCloudSyncBySharedUserID removeAllObjects];
    }
  }
  else
  {
    unsigned int v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    BOOL v6 = self->_sharedUsersSiriCloudSyncBySharedUserID;
    self->_sharedUsersSiriCloudSyncBySharedUserID = v5;
  }
  unint64_t v7 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    sharedUsersByHomeUserUUID = self->_sharedUsersByHomeUserUUID;
    id v25 = v7;
    id v26 = [(NSMutableDictionary *)sharedUsersByHomeUserUUID count];
    id v27 = [(NSMutableDictionary *)self->_sharedUsersSiriCloudSyncBySharedUserID count];
    *(_DWORD *)long long buf = 136315650;
    id v37 = "-[ADMultiUserService countUsersWithSiriCloudSyncEnabled]";
    __int16 v38 = 2048;
    uint64_t v39 = (uint64_t)v26;
    __int16 v40 = 2048;
    id v41 = v27;
    _os_log_debug_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "%s _sharedUsersByHomeUserUUID: %lu _sharedUsersSiriCloudSyncBySharedUserID: %lu", buf, 0x20u);

    unint64_t v7 = AFSiriLogContextDaemon;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 136315138;
    id v37 = "-[ADMultiUserService countUsersWithSiriCloudSyncEnabled]";
    _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%s Checking if primary user has enabled cloudsync.", buf, 0xCu);
  }
  id v8 = [(ADCommunalDeviceUser *)self->_primaryUser sharedUserID];
  unint64_t v9 = [(ADMultiUserService *)self addIfSiriCloudSyncEnabledForUser:v8];

  long long v10 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 136315138;
    id v37 = "-[ADMultiUserService countUsersWithSiriCloudSyncEnabled]";
    _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%s Checking if shared users have enabled cloudsync.", buf, 0xCu);
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v11 = self->_sharedUsersBySharedUserID;
  id v12 = [(NSMutableDictionary *)v11 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v12)
  {
    id v14 = v12;
    BOOL v15 = 0;
    uint64_t v16 = *(void *)v32;
    *(void *)&long long v13 = 136315394;
    long long v30 = v13;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        long long v18 = v15;
        if (*(void *)v32 != v16) {
          objc_enumerationMutation(v11);
        }
        uint64_t v19 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        BOOL v15 = -[NSMutableDictionary objectForKey:](self->_sharedUsersBySharedUserID, "objectForKey:", v19, v30, (void)v31);

        if (v15)
        {
          int v20 = [v15 sharedUserID];
          v9 += [(ADMultiUserService *)self addIfSiriCloudSyncEnabledForUser:v20];
        }
        else
        {
          id v21 = AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)long long buf = v30;
            id v37 = "-[ADMultiUserService countUsersWithSiriCloudSyncEnabled]";
            __int16 v38 = 2112;
            uint64_t v39 = v19;
            _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "%s sharedUser was not found. sharedUserID: %@", buf, 0x16u);
          }
        }
      }
      id v14 = [(NSMutableDictionary *)v11 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v14);
  }
  id v22 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 136315394;
    id v37 = "-[ADMultiUserService countUsersWithSiriCloudSyncEnabled]";
    __int16 v38 = 2048;
    uint64_t v39 = v9;
    _os_log_debug_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "%s Total Siri Cloud Sync requests enabled users : %lu", buf, 0x16u);
  }
  return v9;
}

- (unint64_t)addIfSiriCloudSyncEnabledForUser:(id)a3
{
  id v4 = a3;
  unsigned int v5 = sub_100174F64(v4);
  BOOL v6 = [(NSMutableDictionary *)self->_sharedUsersSiriCloudSyncBySharedUserID objectForKey:v4];

  if (v6)
  {
    unint64_t v7 = [(NSMutableDictionary *)self->_sharedUsersSiriCloudSyncBySharedUserID objectForKey:v4];
    unsigned int v8 = [v7 BOOLValue];

    if (v5)
    {
LABEL_3:
      unsigned int v9 = [v5 isSiriCloudSyncEnabled];
      long long v10 = AFSiriLogContextDaemon;
      BOOL v11 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG);
      if (v9)
      {
        if (v11)
        {
          int v17 = 136315906;
          long long v18 = "-[ADMultiUserService addIfSiriCloudSyncEnabledForUser:]";
          __int16 v19 = 1024;
          unsigned int v20 = v8;
          __int16 v21 = 2112;
          id v22 = v4;
          __int16 v23 = 2048;
          unsigned int v8 = 1;
          uint64_t v24 = 1;
          _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%s PeerInfo found - user's Siri cloud sync is enabled. oldCloudSyncEnabled: %d, sharedUserId: %@, current count: %lu", (uint8_t *)&v17, 0x26u);
        }
        else
        {
          unsigned int v8 = 1;
        }
      }
      else
      {
        if (v11)
        {
          int v17 = 136315906;
          long long v18 = "-[ADMultiUserService addIfSiriCloudSyncEnabledForUser:]";
          __int16 v19 = 1024;
          unsigned int v20 = v8;
          __int16 v21 = 2112;
          id v22 = v4;
          __int16 v23 = 2048;
          uint64_t v24 = 0;
          _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%s PeerInfo found - user's Siri cloud sync is disabled. oldCloudSyncEnabled: %d, sharedUserId: %@, current count: %lu", (uint8_t *)&v17, 0x26u);
        }
        unsigned int v8 = 0;
      }
      sharedUsersSiriCloudSyncBySharedUserID = self->_sharedUsersSiriCloudSyncBySharedUserID;
      BOOL v15 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v5 isSiriCloudSyncEnabled]);
      [(NSMutableDictionary *)sharedUsersSiriCloudSyncBySharedUserID setObject:v15 forKey:v4];

      goto LABEL_17;
    }
  }
  else
  {
    id v12 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      int v17 = 136315138;
      long long v18 = "-[ADMultiUserService addIfSiriCloudSyncEnabledForUser:]";
      _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%s User's oldCloudSyncEnabled was not found. Defaulting to YES.", (uint8_t *)&v17, 0xCu);
    }
    unsigned int v8 = 1;
    if (v5) {
      goto LABEL_3;
    }
  }
  long long v13 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v17 = 136315138;
    long long v18 = "-[ADMultiUserService addIfSiriCloudSyncEnabledForUser:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%s PeerInfo NOT found", (uint8_t *)&v17, 0xCu);
    long long v13 = AFSiriLogContextDaemon;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    int v17 = 136315906;
    long long v18 = "-[ADMultiUserService addIfSiriCloudSyncEnabledForUser:]";
    __int16 v19 = 1024;
    unsigned int v20 = v8;
    __int16 v21 = 2112;
    id v22 = v4;
    __int16 v23 = 2048;
    uint64_t v24 = v8;
    _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%s oldCloudSyncEnabled:%d sharedUserId: %@, current count: %lu", (uint8_t *)&v17, 0x26u);
  }
LABEL_17:

  return v8;
}

- (unint64_t)countVoiceProfiles
{
  uint64_t v6 = 0;
  unint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1002A3DE4;
  v5[3] = &unk_10050D5F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (unint64_t)_countVoiceProfiles
{
  voiceProfileManager = self->_voiceProfileManager;
  if (voiceProfileManager)
  {
    unint64_t v3 = [(SSRVoiceProfileManager *)voiceProfileManager provisionedVoiceProfilesForAppDomain:@"com.apple.siri" withLocale:0];
    id v4 = [v3 count];

    return (unint64_t)v4;
  }
  else
  {
    uint64_t v6 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315138;
      uint64_t v8 = "-[ADMultiUserService _countVoiceProfiles]";
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s SSRVoiceProfileManager not available", (uint8_t *)&v7, 0xCu);
    }
    return -1;
  }
}

- (BOOL)_updateVoiceProfileInfo
{
  usersWithAvailableVoiceProfiles = self->_usersWithAvailableVoiceProfiles;
  if (!usersWithAvailableVoiceProfiles
    || ([(NSMutableArray *)usersWithAvailableVoiceProfiles removeAllObjects],
        !self->_usersWithAvailableVoiceProfiles))
  {
    id v4 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    unsigned int v5 = self->_usersWithAvailableVoiceProfiles;
    self->_usersWithAvailableVoiceProfiles = v4;
  }
  uint64_t v6 = +[NSMutableArray array];
  int v7 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    currentLanguage = self->_currentLanguage;
    *(_DWORD *)long long buf = 136315394;
    __int16 v38 = "-[ADMultiUserService _updateVoiceProfileInfo]";
    __int16 v39 = 2112;
    __int16 v40 = currentLanguage;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s _currentLanguage = %@", buf, 0x16u);
  }
  uint64_t v9 = [(SSRVoiceProfileManager *)self->_voiceProfileManager provisionedVoiceProfilesForLocale:self->_currentLanguage];
  long long v10 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    BOOL v11 = v10;
    id v12 = (NSString *)[v9 count];
    *(_DWORD *)long long buf = 136315394;
    __int16 v38 = "-[ADMultiUserService _updateVoiceProfileInfo]";
    __int16 v39 = 2048;
    __int16 v40 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s allUsers = %lu", buf, 0x16u);
  }
  __int16 v29 = (void *)v6;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v9;
  id v13 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (!v13)
  {
    char v30 = 0;
    goto LABEL_24;
  }
  id v14 = v13;
  char v30 = 0;
  uint64_t v15 = *(void *)v33;
  uint64_t v16 = SSRSpeakerRecognitionSiriAppDomain;
  uint64_t v17 = SSRSpeakerRecognitionSiriDebugAppDomain;
  do
  {
    for (i = 0; i != v14; i = (char *)i + 1)
    {
      if (*(void *)v33 != v15) {
        objc_enumerationMutation(obj);
      }
      __int16 v19 = *(void **)(*((void *)&v32 + 1) + 8 * i);
      unsigned int v20 = [v19 appDomain];
      if ([v20 isEqualToString:v16])
      {
      }
      else
      {
        __int16 v21 = [v19 appDomain];
        unsigned int v22 = [v21 isEqualToString:v17];

        if (!v22) {
          continue;
        }
      }
      __int16 v23 = [v19 sharedSiriId];
      if (v23
        && ([(NSMutableArray *)self->_usersWithAvailableVoiceProfiles containsObject:v23] & 1) == 0)
      {
        [(NSMutableArray *)self->_usersWithAvailableVoiceProfiles addObject:v23];
        uint64_t v24 = [(NSMutableDictionary *)self->_sharedUsersBySharedUserID objectForKey:v23];
        [(ADMultiUserService *)self _untrackUUIDsForUser:v24];

        char v30 = 1;
      }
    }
    id v14 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
  }
  while (v14);
LABEL_24:

  id v25 = +[NSArray arrayWithArray:v29];
  pitchesForHomeMembers = self->_pitchesForHomeMembers;
  self->_pitchesForHomeMembers = v25;

  id v27 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    __int16 v38 = "-[ADMultiUserService _updateVoiceProfileInfo]";
    __int16 v39 = 1024;
    LODWORD(v40) = v30 & 1;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "%s Voice Profiles Did Update: %d", buf, 0x12u);
  }

  return v30 & 1;
}

- (void)_untrackAllHomeUserUUIDsForInFlightVoiceProfile
{
  unint64_t v3 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    inFlightVoiceProfilesByUUID = self->_inFlightVoiceProfilesByUUID;
    unsigned int v5 = v3;
    int v7 = 136315394;
    uint64_t v8 = "-[ADMultiUserService _untrackAllHomeUserUUIDsForInFlightVoiceProfile]";
    __int16 v9 = 2048;
    id v10 = [(NSMutableSet *)inFlightVoiceProfilesByUUID count];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Untracking all UUIDs for in-flight voice profiles. Total profiles in-flight was: %lu", (uint8_t *)&v7, 0x16u);
  }
  uint64_t v6 = [(ADMultiUserService *)self _inFlightVoiceProfilesByUUID];
  [v6 removeAllObjects];
}

- (BOOL)_isTrackingUUIDForInFlightVoiceProfile:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    unsigned int v5 = [(ADMultiUserService *)self _inFlightVoiceProfilesByUUID];
    uint64_t v6 = [v4 homeUserUUID];
    unsigned __int8 v7 = [v5 containsObject:v6];

    if ((v7 & 1) != 0
      || ([(ADMultiUserService *)self _inFlightVoiceProfilesByUUID],
          uint64_t v8 = objc_claimAutoreleasedReturnValue(),
          [v4 sharedUserID],
          __int16 v9 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v10 = [v8 containsObject:v9],
          v9,
          v8,
          (v10 & 1) != 0))
    {
      unsigned __int8 v11 = 1;
    }
    else
    {
      id v12 = [(ADMultiUserService *)self _inFlightVoiceProfilesByUUID];
      id v13 = [v4 iCloudAltDSID];
      unsigned __int8 v11 = [v12 containsObject:v13];
    }
  }
  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (void)_untrackUUIDsForUser:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 homeUserUUID];
  [(ADMultiUserService *)self _untrackHomeUserUUIDForInFlightVoiceProfile:v5];

  uint64_t v6 = [v4 sharedUserID];
  [(ADMultiUserService *)self _untrackHomeUserUUIDForInFlightVoiceProfile:v6];

  id v7 = [v4 iCloudAltDSID];

  [(ADMultiUserService *)self _untrackHomeUserUUIDForInFlightVoiceProfile:v7];
}

- (void)_untrackHomeUserUUIDForInFlightVoiceProfile:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    unsigned int v5 = [(ADMultiUserService *)self _inFlightVoiceProfilesByUUID];
    unsigned int v6 = [v5 containsObject:v4];

    if (v6)
    {
      id v7 = [(ADMultiUserService *)self _inFlightVoiceProfilesByUUID];
      [v7 removeObject:v4];

      uint64_t v8 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        inFlightVoiceProfilesByUUID = self->_inFlightVoiceProfilesByUUID;
        unsigned __int8 v10 = v8;
        int v11 = 136315651;
        id v12 = "-[ADMultiUserService _untrackHomeUserUUIDForInFlightVoiceProfile:]";
        __int16 v13 = 2113;
        id v14 = v4;
        __int16 v15 = 2048;
        id v16 = [(NSMutableSet *)inFlightVoiceProfilesByUUID count];
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s Untracking voice profile in-flight for %{private}@. Total profiles in-flight: %lu", (uint8_t *)&v11, 0x20u);
      }
    }
  }
}

- (void)_trackHomeUserUUIDForInFlightVoiceProfile:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    unsigned int v5 = [(ADMultiUserService *)self _inFlightVoiceProfilesByUUID];
    unsigned __int8 v6 = [v5 containsObject:v4];

    if ((v6 & 1) == 0)
    {
      id v7 = [(ADMultiUserService *)self _inFlightVoiceProfilesByUUID];
      [v7 addObject:v4];

      uint64_t v8 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        inFlightVoiceProfilesByUUID = self->_inFlightVoiceProfilesByUUID;
        unsigned __int8 v10 = v8;
        int v11 = 136315651;
        id v12 = "-[ADMultiUserService _trackHomeUserUUIDForInFlightVoiceProfile:]";
        __int16 v13 = 2113;
        id v14 = v4;
        __int16 v15 = 2048;
        id v16 = [(NSMutableSet *)inFlightVoiceProfilesByUUID count];
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s Tracking voice profile in-flight for %{private}@. Total profiles in-flight: %lu", (uint8_t *)&v11, 0x20u);
      }
    }
  }
}

- (id)_inFlightVoiceProfilesByUUID
{
  inFlightVoiceProfilesByUUID = self->_inFlightVoiceProfilesByUUID;
  if (!inFlightVoiceProfilesByUUID)
  {
    id v4 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    unsigned int v5 = self->_inFlightVoiceProfilesByUUID;
    self->_inFlightVoiceProfilesByUUID = v4;

    inFlightVoiceProfilesByUUID = self->_inFlightVoiceProfilesByUUID;
  }
  return inFlightVoiceProfilesByUUID;
}

- (id)getDeviceOwnerSharedUserId
{
  v2 = [(ADMultiUserService *)self deviceOwner];
  unint64_t v3 = [v2 sharedUserID];

  return v3;
}

- (BOOL)_isCurrentLanguageMultiUserCompatible
{
  v2 = self->_currentLanguage;
  unint64_t v3 = AFPreferencesSupportedMultiUserLanguages();
  id v4 = v3;
  if (v2 && ([v3 containsObject:v2] & 1) != 0)
  {
    BOOL v5 = 1;
  }
  else
  {
    unsigned __int8 v6 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315394;
      __int16 v9 = "-[ADMultiUserService _isCurrentLanguageMultiUserCompatible]";
      __int16 v10 = 2112;
      int v11 = v2;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s Current language %@ not supported for multi-user", (uint8_t *)&v8, 0x16u);
    }
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)isMultiUserAvailable
{
  return 0;
}

- (void)triggerVoiceProfileUploadWithCompletion:(id)a3
{
  unint64_t v3 = (void (**)(id, void *))a3;
  id v4 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    id v7 = "-[ADMultiUserService triggerVoiceProfileUploadWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v6, 0xCu);
  }
  BOOL v5 = +[AFError errorWithCode:13];
  if (v3) {
    v3[2](v3, v5);
  }
}

- (void)downloadVoiceProfileForiCloudAltDSID:(id)a3 completion:(id)a4
{
  id v5 = a3;
  int v6 = (void (**)(id, void *))a4;
  id v7 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315138;
    __int16 v10 = "-[ADMultiUserService downloadVoiceProfileForiCloudAltDSID:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v9, 0xCu);
  }
  int v8 = +[AFError errorWithCode:13];
  if (v6) {
    v6[2](v6, v8);
  }
}

- (void)_forceCloudSyncedUserDownload:(id)a3
{
  id v4 = a3;
  id v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    int v11 = "-[ADMultiUserService _forceCloudSyncedUserDownload:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  if ([(ADMultiUserService *)self _isHostingMultiUserLanguage])
  {
    int v6 = [(ADMultiUserService *)self getCloudKitManager];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1002A4D00;
    v8[3] = &unk_10050D440;
    id v9 = v4;
    [v6 forceMultiUserSync:0 download:1 activity:0 completion:v8];
  }
  else
  {
    id v7 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      int v11 = "-[ADMultiUserService _forceCloudSyncedUserDownload:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s Current Language is not supported for Multiuser. Skipping _forceCloudSyncedUserDownload!", buf, 0xCu);
    }
    if (v4) {
      (*((void (**)(id, void))v4 + 2))(v4, 0);
    }
  }
}

- (void)_resetAllUsers
{
  unint64_t v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    __int16 v23 = "-[ADMultiUserService _resetAllUsers]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = self->_sharedUsersBySharedUserID;
  id v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      int v8 = 0;
      do
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = -[SSRVoiceProfileManager discardSiriEnrollmentForProfileId:forLanguageCode:](self->_voiceProfileManager, "discardSiriEnrollmentForProfileId:forLanguageCode:", *(void *)(*((void *)&v17 + 1) + 8 * (void)v8), 0, (void)v17);
        int v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }

  [(NSMutableDictionary *)self->_sharedUsersBySharedUserID removeAllObjects];
  [(NSMutableDictionary *)self->_sharedUsersByHomeUserUUID removeAllObjects];
  [(NSMutableDictionary *)self->_sharedUsersByiCloudAltDSID removeAllObjects];
  unint64_t primaryUser = self->_primaryUser;
  if (primaryUser)
  {
    voiceProfileManager = self->_voiceProfileManager;
    id v12 = [(ADCommunalDeviceUser *)primaryUser sharedUserID];
    id v13 = [(SSRVoiceProfileManager *)voiceProfileManager discardSiriEnrollmentForProfileId:v12 forLanguageCode:0];

    id v14 = self->_primaryUser;
  }
  else
  {
    id v14 = 0;
  }
  self->_unint64_t primaryUser = 0;

  deviceOwner = self->_deviceOwner;
  self->_deviceOwner = 0;

  [(ADMultiUserService *)self _savePrimaryAndDeviceOwner];
  [(ADMultiUserService *)self _saveDeviceOwnerToKeychainCache];
  id v16 = +[ADPreferences sharedPreferences];
  [v16 setMultiUserSharedUsers:0];
}

- (void)_resetPrimaryUser
{
  unint64_t v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315138;
    int v11 = "-[ADMultiUserService _resetPrimaryUser]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v10, 0xCu);
  }
  unint64_t primaryUser = self->_primaryUser;
  if (primaryUser)
  {
    voiceProfileManager = self->_voiceProfileManager;
    id v6 = [(ADCommunalDeviceUser *)primaryUser sharedUserID];
    id v7 = [(SSRVoiceProfileManager *)voiceProfileManager discardSiriEnrollmentForProfileId:v6 forLanguageCode:0];
  }
  int v8 = +[ADPreferences sharedPreferences];
  [v8 setMultiUserPrimaryUser:0];

  id v9 = self->_primaryUser;
  self->_unint64_t primaryUser = 0;
}

- (void)_loadCloudSyncedUsersFromCache
{
  [(ADPreferences *)self->_adPreferences multiUserPrimaryUser];
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v2 = [obj countByEnumeratingWithState:&v58 objects:v72 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v59;
    do
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v59 != v4) {
          objc_enumerationMutation(obj);
        }
        id v6 = (void *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          id v7 = *(void **)(*((void *)&v58 + 1) + 8 * i);
          int v8 = v6;
          id v9 = [obj valueForKey:v7];
          *(_DWORD *)long long buf = 136315651;
          id v63 = "-[ADMultiUserService _loadCloudSyncedUsersFromCache]";
          __int16 v64 = 2112;
          v65 = v7;
          __int16 v66 = 2113;
          id v67 = v9;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s primaryUser key (%@), value (%{private}@)", buf, 0x20u);
        }
      }
      id v3 = [obj countByEnumeratingWithState:&v58 objects:v72 count:16];
    }
    while (v3);
  }
  int v10 = self;
  if (obj)
  {
    int v11 = [[ADCommunalDeviceUser alloc] initWithDictionary:obj attribute:0];
    unint64_t primaryUser = self->_primaryUser;
    self->_unint64_t primaryUser = v11;

    objc_storeStrong((id *)&self->_deviceOwner, self->_primaryUser);
    [(ADMultiUserService *)self _saveDeviceOwnerToKeychainCache];
    id v13 = [(ADCommunalDeviceUser *)self->_primaryUser homeUserUUID];

    if (v13)
    {
      uint64_t v14 = [(ADCommunalDeviceUser *)self->_primaryUser homeUserUUID];
LABEL_13:
      __int16 v15 = (void *)v14;
      [(ADMultiUserService *)self _trackHomeUserUUIDForInFlightVoiceProfile:v14];

      goto LABEL_17;
    }
    if (AFIsATV())
    {
      id v16 = [(ADCommunalDeviceUser *)self->_primaryUser sharedUserID];

      if (v16)
      {
        uint64_t v14 = [(ADCommunalDeviceUser *)self->_primaryUser sharedUserID];
        goto LABEL_13;
      }
    }
  }
LABEL_17:
  if (!self->_deviceOwner)
  {
    long long v17 = [(ADPreferences *)self->_adPreferences deviceOwner];
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v18 = [v17 countByEnumeratingWithState:&v54 objects:v71 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v55;
      do
      {
        for (j = 0; j != v19; j = (char *)j + 1)
        {
          if (*(void *)v55 != v20) {
            objc_enumerationMutation(v17);
          }
          unsigned int v22 = (void *)AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
          {
            __int16 v23 = *(void **)(*((void *)&v54 + 1) + 8 * (void)j);
            uint64_t v24 = v22;
            id v25 = [v17 valueForKey:v23];
            *(_DWORD *)long long buf = 136315651;
            id v63 = "-[ADMultiUserService _loadCloudSyncedUsersFromCache]";
            __int16 v64 = 2112;
            v65 = v23;
            __int16 v66 = 2113;
            id v67 = v25;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%s deviceOwner key (%@), value (%{private}@)", buf, 0x20u);
          }
        }
        id v19 = [v17 countByEnumeratingWithState:&v54 objects:v71 count:16];
      }
      while (v19);
    }
    int v10 = self;
    if (v17)
    {
      id v26 = [[ADCommunalDeviceUser alloc] initWithDictionary:v17 attribute:0];
      deviceOwner = self->_deviceOwner;
      self->_deviceOwner = v26;

      [(ADMultiUserService *)self _saveDeviceOwnerToKeychainCache];
    }
  }
  __int16 v28 = [(ADPreferences *)v10->_adPreferences multiUserSharedUsers];
  if (v28)
  {
    if (!v10->_sharedUsersBySharedUserID)
    {
      __int16 v29 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      sharedUsersBySharedUserID = v10->_sharedUsersBySharedUserID;
      v10->_sharedUsersBySharedUserID = v29;
    }
    if (!v10->_sharedUsersByHomeUserUUID)
    {
      long long v31 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      sharedUsersByHomeUserUUID = v10->_sharedUsersByHomeUserUUID;
      v10->_sharedUsersByHomeUserUUID = v31;
    }
    if (!v10->_sharedUsersByiCloudAltDSID)
    {
      long long v33 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      sharedUsersByiCloudAltDSID = v10->_sharedUsersByiCloudAltDSID;
      v10->_sharedUsersByiCloudAltDSID = v33;
    }
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v47 = v28;
    id v35 = v28;
    id v36 = [v35 countByEnumeratingWithState:&v50 objects:v70 count:16];
    if (v36)
    {
      id v37 = v36;
      uint64_t v38 = *(void *)v51;
      do
      {
        for (k = 0; k != v37; k = (char *)k + 1)
        {
          if (*(void *)v51 != v38) {
            objc_enumerationMutation(v35);
          }
          __int16 v40 = [[ADCommunalDeviceUser alloc] initWithDictionary:*(void *)(*((void *)&v50 + 1) + 8 * (void)k) attribute:1];
          id v41 = [(ADCommunalDeviceUser *)v40 sharedUserID];
          uint64_t v42 = [(ADCommunalDeviceUser *)v40 homeUserUUID];
          __int16 v43 = [(ADCommunalDeviceUser *)v40 iCloudAltDSID];
          unint64_t v44 = AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 136315907;
            id v63 = "-[ADMultiUserService _loadCloudSyncedUsersFromCache]";
            __int16 v64 = 2113;
            v65 = v41;
            __int16 v66 = 2113;
            id v67 = v42;
            __int16 v68 = 2113;
            v69 = v43;
            _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "%s sharedUser = %{private}@, homeUserUUID = %{private}@, iCloudAltDSID = %{private}@", buf, 0x2Au);
          }
          [(ADMultiUserService *)self _updateMappingsForSharedUser:v40];
        }
        id v37 = [v35 countByEnumeratingWithState:&v50 objects:v70 count:16];
      }
      while (v37);
    }

    int v10 = self;
    __int16 v28 = v47;
  }
  else
  {
    id v45 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      id v63 = "-[ADMultiUserService _loadCloudSyncedUsersFromCache]";
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "%s NO shared users", buf, 0xCu);
    }
  }
  long long v46 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    id v63 = "-[ADMultiUserService _loadCloudSyncedUsersFromCache]";
    _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_INFO, "%s Configured Cloud Synced Users.", buf, 0xCu);
  }
  [(ADMultiUserService *)v10 _updateSAMultiUserInfo];
}

- (void)_updateMappingsForSharedUser:(id)a3
{
  id v4 = a3;
  if (!self->_sharedUsersBySharedUserID)
  {
    id v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    sharedUsersBySharedUserID = self->_sharedUsersBySharedUserID;
    self->_sharedUsersBySharedUserID = v5;
  }
  if (!self->_sharedUsersByHomeUserUUID)
  {
    id v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    sharedUsersByHomeUserUUID = self->_sharedUsersByHomeUserUUID;
    self->_sharedUsersByHomeUserUUID = v7;
  }
  if (!self->_sharedUsersByiCloudAltDSID)
  {
    id v9 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    sharedUsersByiCloudAltDSID = self->_sharedUsersByiCloudAltDSID;
    self->_sharedUsersByiCloudAltDSID = v9;
  }
  int v11 = [v4 sharedUserID];
  id v12 = [v4 homeUserUUID];
  id v13 = [v4 iCloudAltDSID];
  if (v11) {
    [(NSMutableDictionary *)self->_sharedUsersBySharedUserID setObject:v4 forKey:v11];
  }
  if (v12)
  {
    [(NSMutableDictionary *)self->_sharedUsersByHomeUserUUID setObject:v4 forKey:v12];
    uint64_t v14 = v12;
LABEL_13:
    [(ADMultiUserService *)self _trackHomeUserUUIDForInFlightVoiceProfile:v14];
    goto LABEL_14;
  }
  int v15 = AFIsATV();
  if (v11)
  {
    uint64_t v14 = v11;
    if (v15) {
      goto LABEL_13;
    }
  }
LABEL_14:
  if (v13) {
    [(NSMutableDictionary *)self->_sharedUsersByiCloudAltDSID setObject:v4 forKey:v13];
  }
  id v16 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v18 = 136315138;
    id v19 = "-[ADMultiUserService _updateMappingsForSharedUser:]";
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s Posting notification as shared user info updated", (uint8_t *)&v18, 0xCu);
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, kAFSharedUserUpdateDarwinNotification, 0, 0, 1u);
}

- (void)_refreshUsersAndVoiceProfiles:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    v106 = "-[ADMultiUserService _refreshUsersAndVoiceProfiles:]";
    __int16 v107 = 1024;
    LODWORD(v108) = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s liveOnOnboardedProfilesDidChange = %{BOOL}d", buf, 0x12u);
  }
  BOOL v71 = v3;
  id v6 = objc_alloc_init((Class)NSMutableArray);
  id v69 = objc_alloc_init((Class)NSMutableSet);
  id v7 = objc_alloc_init((Class)NSMutableSet);
  int v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    currentLanguage = self->_currentLanguage;
    *(_DWORD *)long long buf = 136315394;
    v106 = "-[ADMultiUserService _refreshUsersAndVoiceProfiles:]";
    __int16 v107 = 2112;
    v108 = currentLanguage;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s _currentLanguage = %@", buf, 0x16u);
  }
  __int16 v66 = v7;
  int v10 = [(SSRVoiceProfileManager *)self->_voiceProfileManager provisionedVoiceProfilesForLocale:self->_currentLanguage];
  int v11 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    id v12 = v11;
    id v13 = (NSString *)[v10 count];
    *(_DWORD *)long long buf = 136315394;
    v106 = "-[ADMultiUserService _refreshUsersAndVoiceProfiles:]";
    __int16 v107 = 2048;
    v108 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s allUsers count = %lu", buf, 0x16u);
  }
  unsigned int v70 = v6;
  id v67 = +[NSMutableArray array];
  long long v97 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  id obj = v10;
  id v14 = [obj countByEnumeratingWithState:&v97 objects:v104 count:16];
  if (!v14)
  {
    char v68 = 0;
    goto LABEL_30;
  }
  id v15 = v14;
  char v68 = 0;
  uint64_t v16 = *(void *)v98;
  uint64_t v17 = SSRSpeakerRecognitionSiriDebugAppDomain;
  uint64_t v18 = SSRSpeakerRecognitionSiriAppDomain;
  do
  {
    for (i = 0; i != v15; i = (char *)i + 1)
    {
      if (*(void *)v98 != v16) {
        objc_enumerationMutation(obj);
      }
      uint64_t v20 = *(NSString **)(*((void *)&v97 + 1) + 8 * i);
      __int16 v21 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 136315394;
        v106 = "-[ADMultiUserService _refreshUsersAndVoiceProfiles:]";
        __int16 v107 = 2112;
        v108 = v20;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "%s user = %@", buf, 0x16u);
      }
      if (AFIsInternalInstall())
      {
        unsigned int v22 = [(NSString *)v20 appDomain];
        unsigned int v23 = [v22 isEqualToString:v17];

        if (v23)
        {
          [v70 addObject:v20];
          uint64_t v24 = [(NSString *)v20 sharedSiriId];
          [v69 addObject:v24];
        }
      }
      id v25 = [(NSString *)v20 appDomain];
      if ([v25 isEqualToString:v18])
      {
      }
      else
      {
        id v26 = [(NSString *)v20 appDomain];
        unsigned int v27 = [v26 isEqualToString:v17];

        if (!v27) {
          continue;
        }
      }
      if (!self->_usersWithAvailableVoiceProfiles)
      {
        __int16 v28 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
        usersWithAvailableVoiceProfiles = self->_usersWithAvailableVoiceProfiles;
        self->_usersWithAvailableVoiceProfiles = v28;
      }
      char v30 = [(NSString *)v20 sharedSiriId];
      if (v30
        && ([(NSMutableArray *)self->_usersWithAvailableVoiceProfiles containsObject:v30] & 1) == 0)
      {
        [(NSMutableArray *)self->_usersWithAvailableVoiceProfiles addObject:v30];
        long long v31 = [(NSMutableDictionary *)self->_sharedUsersBySharedUserID objectForKey:v30];
        [(ADMultiUserService *)self _untrackUUIDsForUser:v31];

        char v68 = 1;
      }
    }
    id v15 = [obj countByEnumeratingWithState:&v97 objects:v104 count:16];
  }
  while (v15);
LABEL_30:

  long long v32 = +[NSArray arrayWithArray:v67];
  pitchesForHomeMembers = self->_pitchesForHomeMembers;
  self->_pitchesForHomeMembers = v32;

  long long v34 = v66;
  if (v71)
  {
    long long v95 = 0u;
    long long v96 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    id v35 = self->_sharedUsersBySharedUserID;
    id v36 = [(NSMutableDictionary *)v35 countByEnumeratingWithState:&v93 objects:v103 count:16];
    if (v36)
    {
      id v37 = v36;
      uint64_t v38 = *(void *)v94;
      do
      {
        for (j = 0; j != v37; j = (char *)j + 1)
        {
          if (*(void *)v94 != v38) {
            objc_enumerationMutation(v35);
          }
          uint64_t v40 = *(void *)(*((void *)&v93 + 1) + 8 * (void)j);
          id v41 = [(NSMutableDictionary *)self->_sharedUsersBySharedUserID objectForKey:v40];
          if ([v41 nonCloudSyncedUser]) {
            [v66 addObject:v40];
          }
        }
        id v37 = [(NSMutableDictionary *)v35 countByEnumeratingWithState:&v93 objects:v103 count:16];
      }
      while (v37);
    }

    id v42 = [v66 count];
    if (v42 <= [v69 count])
    {
      id v49 = [v69 count];
      if (v49 <= [v66 count] && (objc_msgSend(v66, "isEqual:", v69) & 1) == 0)
      {
        long long v50 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 136315138;
          v106 = "-[ADMultiUserService _refreshUsersAndVoiceProfiles:]";
          _os_log_error_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "%s Counts are same, but users are different. Falling down to best effort", buf, 0xCu);
        }
      }
    }
    else
    {
      [v66 minusSet:v69];
      long long v91 = 0u;
      long long v92 = 0u;
      long long v89 = 0u;
      long long v90 = 0u;
      id v43 = v66;
      id v44 = [v43 countByEnumeratingWithState:&v89 objects:v102 count:16];
      if (v44)
      {
        id v45 = v44;
        uint64_t v46 = *(void *)v90;
        do
        {
          for (k = 0; k != v45; k = (char *)k + 1)
          {
            if (*(void *)v90 != v46) {
              objc_enumerationMutation(v43);
            }
            uint64_t v48 = *(void *)(*((void *)&v89 + 1) + 8 * (void)k);
            id v84 = _NSConcreteStackBlock;
            uint64_t v85 = 3221225472;
            id v86 = sub_1002A62C8;
            long long v87 = &unk_10050C610;
            uint64_t v88 = v48;
            -[ADMultiUserService removeUserWithSharedUserID:completion:](self, "removeUserWithSharedUserID:completion:");
          }
          id v45 = [v43 countByEnumeratingWithState:&v89 objects:v102 count:16];
        }
        while (v45);
      }
    }
  }
  if (self->_primaryUser)
  {
    long long v83 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    long long v80 = 0u;
    id v72 = v70;
    id v51 = [v72 countByEnumeratingWithState:&v80 objects:v101 count:16];
    if (!v51) {
      goto LABEL_68;
    }
    id v52 = v51;
    uint64_t v74 = *(void *)v81;
    while (1)
    {
      long long v53 = 0;
      do
      {
        if (*(void *)v81 != v74) {
          objc_enumerationMutation(v72);
        }
        long long v54 = *(void **)(*((void *)&v80 + 1) + 8 * (void)v53);
        long long v55 = [v54 sharedSiriId];
        long long v56 = [v54 homeId];
        uint64_t v57 = [v54 userName];
        long long v58 = SiriCoreUUIDStringCreate();
        long long v59 = SiriCoreUUIDStringCreate();
        if (v56)
        {
          if (v55) {
            goto LABEL_61;
          }
        }
        else
        {
          long long v56 = SiriCoreUUIDStringCreate();
          if (v55) {
            goto LABEL_61;
          }
        }
        long long v55 = SiriCoreUUIDStringCreate();
LABEL_61:
        long long v60 = @"whatsinaname";
        if (v57) {
          long long v60 = (__CFString *)v57;
        }
        v78[0] = _NSConcreteStackBlock;
        v78[1] = 3221225472;
        v78[2] = sub_1002A63A0;
        v78[3] = &unk_10050C610;
        unsigned __int8 v79 = v60;
        long long v61 = v60;
        LOBYTE(v65) = 1;
        [(ADMultiUserService *)self addUser:v56 sharedUserId:v55 loggableSharedUserId:v58 iCloudAltDSID:v59 enrollmentName:v61 isPrimary:0 nonCloudSyncedUser:v65 completion:v78];

        long long v53 = (char *)v53 + 1;
      }
      while (v52 != v53);
      id v62 = [v72 countByEnumeratingWithState:&v80 objects:v101 count:16];
      id v52 = v62;
      if (!v62)
      {
LABEL_68:

        id v63 = v70;
        long long v34 = v66;
        goto LABEL_71;
      }
    }
  }
  id v63 = v70;
  if ([v70 count]) {
    [v70 removeAllObjects];
  }
LABEL_71:
  if (([v63 count] != 0) | v68 & 1)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1002A64DC;
    block[3] = &unk_10050E160;
    id v76 = v63;
    id v77 = self;
    dispatch_async(queue, block);
  }
}

- (void)refreshHomeKitOnboardedUsers
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002A6610;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)_primaryUserSharedUserIdentifierDidChangeNotification:(id)a3
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002A718C;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  if (self->_multiUserListener == a3) {
    return [(ADMultiUserService *)self _multiUserListenerShouldAcceptNewConnection:a4];
  }
  else {
    return 0;
  }
}

- (BOOL)_multiUserListenerShouldAcceptNewConnection:(id)a3
{
  id v4 = a3;
  char HasEntitlement = AFConnectionHasEntitlement();
  if (HasEntitlement)
  {
    unsigned int v6 = [v4 processIdentifier];
    id v7 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315650;
      uint64_t v16 = "-[ADMultiUserService _multiUserListenerShouldAcceptNewConnection:]";
      __int16 v17 = 2112;
      id v18 = v4;
      __int16 v19 = 1024;
      unsigned int v20 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s %@ MultiUser Connection Connected (pid=%d])", buf, 0x1Cu);
    }
    int v8 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___AFMultiUserService];
    [v4 setExportedInterface:v8];

    [v4 setExportedObject:self];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1002A76E8;
    v13[3] = &unk_10050A4D8;
    unsigned int v14 = v6;
    [v4 setInvalidationHandler:v13];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1002A77A4;
    v11[3] = &unk_10050A4D8;
    unsigned int v12 = v6;
    [v4 setInterruptionHandler:v11];
    [v4 resume];
  }
  else
  {
    id v9 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      uint64_t v16 = "-[ADMultiUserService _multiUserListenerShouldAcceptNewConnection:]";
      __int16 v17 = 2112;
      id v18 = v4;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s %@ MultiUser Connection does not have required entitlements.", buf, 0x16u);
    }
  }

  return HasEntitlement;
}

- (void)_setupMultiUserListener
{
  BOOL v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315138;
    int v10 = "-[ADMultiUserService _setupMultiUserListener]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s Setting up MultiUser listener with signpost", (uint8_t *)&v9, 0xCu);
  }
  os_signpost_id_t v4 = os_signpost_id_generate(AFSiriLogContextMultiUser);
  id v5 = AFSiriLogContextMultiUser;
  unsigned int v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    LOWORD(v9) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "MultiUserService", "Setting up MultiUser listener", (uint8_t *)&v9, 2u);
  }

  self->multiUserSignpost = v4;
  id v7 = [(AFInstanceContext *)self->_instanceContext createXPCListenerWithMachServiceName:kAssistantMultiUserServiceName];
  multiUserListener = self->_multiUserListener;
  self->_multiUserListener = v7;

  [(NSXPCListener *)self->_multiUserListener setDelegate:self];
  [(NSXPCListener *)self->_multiUserListener resume];
}

- (id)getCloudKitManager
{
  return +[ADCloudKitManager sharedManager];
}

- (id)_allUsersBySharedUserID
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_sharedUsersBySharedUserID)
  {
    BOOL v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    sharedUsersBySharedUserID = self->_sharedUsersBySharedUserID;
    self->_sharedUsersBySharedUserID = v3;
  }
  id v5 = +[NSMutableDictionary dictionary];
  unint64_t primaryUser = self->_primaryUser;
  if (primaryUser)
  {
    id v7 = [(ADCommunalDeviceUser *)self->_primaryUser sharedUserID];
    [v5 setObject:primaryUser forKey:v7];
  }
  deviceOwner = self->_deviceOwner;
  if (deviceOwner && !self->_primaryUser)
  {
    int v9 = [(ADCommunalDeviceUser *)self->_deviceOwner sharedUserID];
    [v5 setObject:deviceOwner forKey:v9];
  }
  [v5 addEntriesFromDictionary:self->_sharedUsersBySharedUserID];
  id v10 = [v5 copy];

  return v10;
}

- (id)allUsersBySharedUserID
{
  uint64_t v7 = 0;
  int v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_10029065C;
  int v11 = sub_10029066C;
  id v12 = +[NSMutableDictionary dictionary];
  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1002A7BC0;
  v6[3] = &unk_10050D5F0;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(queue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)_languageCodeDidChange
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002A7C80;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)dealloc
{
  BOOL v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:@"ADPreferencesSharedUserIdentifierDidChangeNotification" object:0];
  [v3 removeObserver:self name:@"ADHomeInfoForThisDeviceDidChangeNotification" object:0];
  int liveOnToken = self->_liveOnToken;
  if (liveOnToken != -1) {
    notify_cancel(liveOnToken);
  }

  v5.receiver = self;
  v5.super_class = (Class)ADMultiUserService;
  [(ADMultiUserService *)&v5 dealloc];
}

- (id)_initWithPreferences:(id)a3 ssrManager:(id)a4 homeInfoManager:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v37.receiver = self;
  v37.super_class = (Class)ADMultiUserService;
  id v12 = [(ADMultiUserService *)&v37 init];
  if (v12)
  {
    id v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v14 = dispatch_queue_create("MultiUserServiceQueue", v13);

    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v14;

    objc_storeStrong((id *)&v12->_adPreferences, a3);
    uint64_t v16 = +[ADCommunalDeviceUser saHomeMemberInfo:0];
    saUnknownUser = v12->_saUnknownUser;
    v12->_saUnknownUser = (SAHomeMemberInfo *)v16;

    objc_storeStrong((id *)&v12->_voiceProfileManager, a4);
    objc_storeStrong((id *)&v12->_homeInfoManager, a5);
    uint64_t v18 = [v9 languageCode];
    __int16 v19 = (void *)v18;
    if (v18) {
      unsigned int v20 = (void *)v18;
    }
    else {
      unsigned int v20 = (void *)AFDefaultLanguageCode;
    }
    objc_storeStrong((id *)&v12->_currentLanguage, v20);

    [(ADMultiUserService *)v12 _loadCloudSyncedUsersFromCache];
    if ([(ADMultiUserService *)v12 _isHostingMultiUserLanguage]) {
      [(ADMultiUserService *)v12 _refreshUsersAndVoiceProfiles:0];
    }
    else {
      [(ADMultiUserService *)v12 resetAllUsers];
    }
    __int16 v21 = +[NSNotificationCenter defaultCenter];
    [v21 addObserver:v12 selector:"_primaryUserSharedUserIdentifierDidChangeNotification:" name:@"ADPreferencesSharedUserIdentifierDidChangeNotification" object:v9];
    [v21 addObserver:v12 selector:"_homeInfoDidChange:" name:@"ADHomeInfoForThisDeviceDidChangeNotification" object:0];
    [v21 addObserver:v12 selector:"_languageCodeDidChange" name:AFLanguageCodeDidChangeNotification object:0];
    v12->_int liveOnToken = -1;
    objc_initWeak(&location, v12);
    unsigned int v22 = v12->_queue;
    long long v31 = _NSConcreteStackBlock;
    uint64_t v32 = 3221225472;
    long long v33 = sub_1002A81F0;
    long long v34 = &unk_100509778;
    objc_copyWeak(&v35, &location);
    if (notify_register_dispatch("com.apple.siri.corespeech.voiceprofilelist.change", &v12->_liveOnToken, v22, &v31))
    {
      unsigned int v23 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 136315138;
        __int16 v39 = "-[ADMultiUserService _initWithPreferences:ssrManager:homeInfoManager:]";
        _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%s Failed to listen to ProfileListModification change", buf, 0xCu);
      }
    }
    uint64_t v24 = +[AFInstanceContext currentContext];
    instanceContext = v12->_instanceContext;
    v12->_instanceContext = (AFInstanceContext *)v24;

    uint64_t v26 = +[NSMutableSet set];
    useriCloudAltDSIDsSettingRmVFromTV = v12->_useriCloudAltDSIDsSettingRmVFromTV;
    v12->_useriCloudAltDSIDsSettingRmVFromTV = (NSMutableSet *)v26;

    uint64_t v28 = +[NSMutableSet set];
    homeUserIDsToBeOnboarded = v12->_homeUserIDsToBeOnboarded;
    v12->_homeUserIDsToBeOnboarded = (NSMutableSet *)v28;

    [(ADMultiUserService *)v12 _setupMultiUserListener];
    v12->isATVOnly = AFIsATV();
    objc_destroyWeak(&v35);
    objc_destroyWeak(&location);
  }
  return v12;
}

+ (id)sharedService
{
  if (AFSupportsMultiUser())
  {
    if (qword_1005860D8 != -1) {
      dispatch_once(&qword_1005860D8, &stru_100509750);
    }
    id v2 = (id)qword_1005860D0;
  }
  else
  {
    id v2 = 0;
  }
  return v2;
}

@end