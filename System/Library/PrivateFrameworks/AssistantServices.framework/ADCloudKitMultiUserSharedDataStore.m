@interface ADCloudKitMultiUserSharedDataStore
- (ADCloudKitMultiUserSharedDataStore)init;
- (ADCloudKitMultiUserSharedDataStore)initWithInstanceContext:(id)a3;
- (BOOL)_cleanupCacheDirectory;
- (BOOL)_errorIsRecoverableForPrimary:(int64_t)a3;
- (BOOL)_errorIsRecoverableForSecondary:(int64_t)a3;
- (BOOL)_errorIsUserNotPresentOnTV:(int64_t)a3;
- (BOOL)dataStoreIsOnSharedDatabase;
- (BOOL)dataStoreShouldMirrorData;
- (BOOL)hasSetUpRecordZoneSubscription;
- (BOOL)isMirroredDataStore;
- (CKRecordZone)zone;
- (CKServerChangeToken)serverChangeToken;
- (NSArray)supportedRecordTypes;
- (OS_dispatch_queue)serialQueue;
- (id)_cacheDirectory;
- (id)_constructRecord:(id)a3 fileArchives:(id)a4 assetManifest:(id)a5 filePath:(id)a6;
- (id)_createCacheDirectory;
- (id)_extractRecord:(id)a3 atPath:(id)a4 fileManager:(id)a5;
- (id)_homeMembershipsFromUnencryptedRecords:(id)a3;
- (void)_logRelevantAnalyticsOnMultiUserVoiceProfileDownloadSuccessWithSharedUserID:(id)a3 isPrimary:(BOOL)a4 isNewUser:(BOOL)a5;
- (void)_mergeDataWithModifiedRecords:(id)a3 deletedRecordIDs:(id)a4 containsAllChanges:(BOOL)a5 completion:(id)a6;
- (void)_synchronizeUsingActivity:(id)a3 completion:(id)a4;
- (void)_synchronizeVoiceIDWithActivity:(id)a3 completion:(id)a4;
- (void)_updateVoiceIDProfilesForSharedUser:(id)a3 iCloudAltDSID:(id)a4 records:(id)a5 isPrimary:(BOOL)a6 isNewUser:(BOOL)a7 completion:(id)a8;
- (void)checkForATVRMVSettingUpdate:(id)a3;
- (void)cleanupCacheDirectory;
- (void)deleteUserData:(id)a3;
- (void)fetchDeviceTypesForAllLanguages:(id)a3;
- (void)fetchDeviceTypesForLanguage:(id)a3 completion:(id)a4;
- (void)mergeDataWithModifiedRecords:(id)a3 deletedRecordIDs:(id)a4 containsAllChanges:(BOOL)a5 completion:(id)a6;
- (void)setDataStoreIsOnSharedDatabase:(BOOL)a3;
- (void)setDataStoreShouldMirrorData:(BOOL)a3;
- (void)setHasSetUpRecordZoneSubscription:(BOOL)a3;
- (void)setIsMirroredDataStore:(BOOL)a3;
- (void)setKeyValueRecordsAndVoiceProfile:(id)a3 records:(id)a4 completion:(id)a5;
- (void)setSerialQueue:(id)a3;
- (void)setServerChangeToken:(id)a3;
- (void)setSupportedRecordTypes:(id)a3;
- (void)setZone:(id)a3;
- (void)synchronizeUsingActivity:(id)a3 completion:(id)a4;
- (void)synchronizeWithCompletion:(id)a3;
@end

@implementation ADCloudKitMultiUserSharedDataStore

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedRecordTypes, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_zone, 0);
  objc_storeStrong((id *)&self->_voiceProfileManager, 0);
  objc_storeStrong((id *)&self->_sharedUserID, 0);
  objc_storeStrong((id *)&self->_completionQueue, 0);
  objc_storeStrong((id *)&self->_languageManifestCache, 0);
  objc_storeStrong((id *)&self->_assetManifestCache, 0);
}

- (void)setSupportedRecordTypes:(id)a3
{
}

- (NSArray)supportedRecordTypes
{
  return self->_supportedRecordTypes;
}

- (void)setSerialQueue:(id)a3
{
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setZone:(id)a3
{
}

- (CKRecordZone)zone
{
  return self->_zone;
}

- (void)setIsMirroredDataStore:(BOOL)a3
{
  self->_isMirroredDataStore = a3;
}

- (BOOL)isMirroredDataStore
{
  return self->_isMirroredDataStore;
}

- (void)setDataStoreShouldMirrorData:(BOOL)a3
{
  self->_dataStoreShouldMirrorData = a3;
}

- (BOOL)dataStoreShouldMirrorData
{
  return self->_dataStoreShouldMirrorData;
}

- (void)setDataStoreIsOnSharedDatabase:(BOOL)a3
{
  self->_dataStoreIsOnSharedDatabase = a3;
}

- (BOOL)dataStoreIsOnSharedDatabase
{
  return self->_dataStoreIsOnSharedDatabase;
}

- (void)setKeyValueRecordsAndVoiceProfile:(id)a3 records:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v165 = "-[ADCloudKitMultiUserSharedDataStore setKeyValueRecordsAndVoiceProfile:records:completion:]";
    __int16 v166 = 2048;
    id v167 = [v7 count];
    __int16 v168 = 2048;
    id v169 = [v8 count];
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s Modified %zd Key Value Records, %zd Voice Records", buf, 0x20u);
  }

  if (!+[AFFeatureFlags isLassoEnabled]
    || ![v7 count]
    || ([(ADCloudKitMultiUserSharedDataStore *)self checkForATVRMVSettingUpdate:v7],
        [v8 count]))
  {
    v11 = +[ADHomeInfoManager sharedInfoManager];
    uint64_t v12 = +[ADMultiUserService sharedService];
    v13 = (void *)v12;
    if (!v12)
    {
      [(ADCloudKitMultiUserSharedDataStore *)self _updateVoiceIDProfilesForSharedUser:0 iCloudAltDSID:0 records:v8 isPrimary:1 isNewUser:0 completion:v9];
LABEL_159:

      goto LABEL_160;
    }
    v118 = (void *)v12;
    v122 = v11;
    id v127 = v8;
    v128 = (void (**)(void, void))v9;
    id v14 = objc_alloc_init((Class)NSMutableDictionary);
    long long v159 = 0u;
    long long v160 = 0u;
    long long v161 = 0u;
    long long v162 = 0u;
    id v110 = v7;
    id obj = v7;
    id v15 = [obj countByEnumeratingWithState:&v159 objects:v163 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v160;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v160 != v17) {
            objc_enumerationMutation(obj);
          }
          v19 = *(void **)(*((void *)&v159 + 1) + 8 * i);
          v20 = [v19 recordID];
          v21 = [v20 recordName];

          v22 = sub_10010B5AC(v19);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v23 = v22;
            [v14 setObject:v23 forKey:v21];
            v24 = AFSiriLogContextDaemon;
            if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315651;
              v165 = "-[ADCloudKitMultiUserSharedDataStore setKeyValueRecordsAndVoiceProfile:records:completion:]";
              __int16 v166 = 2113;
              id v167 = v23;
              __int16 v168 = 2113;
              id v169 = v21;
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%s Found value (%{private}@) for key (%{private}@)", buf, 0x20u);
            }
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v25 = v22;
            [v14 setObject:v25 forKey:v21];
            v26 = AFSiriLogContextDaemon;
            if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315651;
              v165 = "-[ADCloudKitMultiUserSharedDataStore setKeyValueRecordsAndVoiceProfile:records:completion:]";
              __int16 v166 = 2113;
              id v167 = v25;
              __int16 v168 = 2113;
              id v169 = v21;
              _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "%s Found value (%{private}@) for key (%{private}@)", buf, 0x20u);
            }
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v27 = v22;
            [v14 setObject:v27 forKey:v21];
            v28 = AFSiriLogContextDaemon;
            if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315651;
              v165 = "-[ADCloudKitMultiUserSharedDataStore setKeyValueRecordsAndVoiceProfile:records:completion:]";
              __int16 v166 = 2113;
              id v167 = v27;
              __int16 v168 = 2113;
              id v169 = v21;
              _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "%s Found value (%{private}@) for key (%{private}@)", buf, 0x20u);
            }
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v29 = v22;
            [v14 setObject:v29 forKey:v21];
            v30 = AFSiriLogContextDaemon;
            if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315651;
              v165 = "-[ADCloudKitMultiUserSharedDataStore setKeyValueRecordsAndVoiceProfile:records:completion:]";
              __int16 v166 = 2113;
              id v167 = v29;
              __int16 v168 = 2113;
              id v169 = v21;
              _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "%s Found value (%{private}@) for key (%{private}@)", buf, 0x20u);
            }
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v31 = v22;
            [v14 setObject:v31 forKey:v21];
            v32 = AFSiriLogContextDaemon;
            if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315651;
              v165 = "-[ADCloudKitMultiUserSharedDataStore setKeyValueRecordsAndVoiceProfile:records:completion:]";
              __int16 v166 = 2113;
              id v167 = v31;
              __int16 v168 = 2113;
              id v169 = v21;
              _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "%s Found value (%{private}@) for key (%{private}@)", buf, 0x20u);
            }
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v33 = AFSiriLogContextDaemon;
            if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315395;
              v165 = "-[ADCloudKitMultiUserSharedDataStore setKeyValueRecordsAndVoiceProfile:records:completion:]";
              __int16 v166 = 2113;
              id v167 = v21;
              _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "%s Found null value for key (%{private}@)", buf, 0x16u);
            }
          }
        }
        id v16 = [obj countByEnumeratingWithState:&v159 objects:v163 count:16];
      }
      while (v16);
    }

    v34 = [v14 objectForKey:@"meDeviceSharedUserID"];
    if (!v34)
    {
      v34 = [v14 objectForKey:@"backupSharedUserID"];
    }
    v35 = [v14 objectForKey:@"meDeviceLoggingSharedUserID"];
    id v9 = v128;
    if (!v35)
    {
      v35 = [v14 objectForKey:@"backupLoggingSharedUserID"];
    }
    v124 = [v14 objectForKey:@"meDeviceiCloudAltDSID"];
    v117 = [v14 objectForKey:@"meDeviceAudioAppSignals"];
    uint64_t v36 = [v14 objectForKey:@"meDeviceAssistantID"];
    v37 = [v14 objectForKey:@"backupAssistantID"];
    uint64_t v126 = [v14 objectForKey:@"meDeviceLoggingAssistantID"];
    uint64_t obja = [v14 objectForKey:@"meDeviceSpeechID"];
    v121 = [v14 objectForKey:@"backupSpeechID"];
    v116 = [v14 objectForKey:@"meDeviceIDSIdentifier"];
    v115 = [v14 objectForKey:@"meProductPrefix"];
    v130 = [v14 objectForKey:@"meDeviceACEHost"];
    v120 = [v14 objectForKey:@"backupDeviceACEHost"];
    v38 = [v14 objectForKey:@"meDeviceCapabilities"];
    v39 = [v38 objectForKey:@"meDeviceSyncMetadataCapability"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      unsigned int v40 = [v39 BOOLValue];
    }
    else {
      unsigned int v40 = 0;
    }
    v41 = [v38 objectForKey:@"meDevicePeerToPeerHandoffCapability"];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      unsigned __int8 v106 = [v41 BOOLValue];
    }
    else {
      unsigned __int8 v106 = 0;
    }
    v42 = [v38 objectForKey:@"meDeviceAssistantID"];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v43 = v42;
    }
    else {
      v43 = 0;
    }
    id v112 = v43;
    if ([v112 isEqual:v36])
    {
      if (v40)
      {
        v111 = [v14 objectForKey:@"meDeviceSyncMetadata"];
        char v105 = 1;
        goto LABEL_59;
      }
    }
    else
    {
      v44 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v165 = "-[ADCloudKitMultiUserSharedDataStore setKeyValueRecordsAndVoiceProfile:records:completion:]";
        __int16 v166 = 2112;
        id v167 = (id)v36;
        __int16 v168 = 2112;
        id v169 = v112;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "%s AssistantID of companion (%@) does not match assistantID (%@) from capabilities - dropping sync metadata", buf, 0x20u);
      }

      unsigned __int8 v106 = 0;
    }
    char v105 = 0;
    v111 = 0;
LABEL_59:
    v45 = [v14 objectForKey:@"meDeviceVoiceIDChangedToEnabledTimestamp"];
    v46 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v165 = "-[ADCloudKitMultiUserSharedDataStore setKeyValueRecordsAndVoiceProfile:records:completion:]";
      __int16 v166 = 2112;
      id v167 = v45;
      _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_INFO, "%s #multi-user - setKeyValueRecordsAndVoiceProfile - syncedVoiceIDEnabledTimestamp: %@", buf, 0x16u);
    }

    v123 = v38;
    v133 = v45;
    if ([v45 count])
    {
      v47 = +[ADPreferences sharedPreferences];
      v48 = [v47 multiUserSetupStartTimes];

      if (v48)
      {
        id v49 = +[NSMutableDictionary dictionaryWithDictionary:v48];
      }
      else
      {
        id v49 = +[NSMutableDictionary dictionary];
      }

      v157[0] = _NSConcreteStackBlock;
      v157[1] = 3221225472;
      v157[2] = sub_10014E9D0;
      v157[3] = &unk_100506080;
      id v50 = v49;
      id v158 = v50;
      [v133 enumerateKeysAndObjectsUsingBlock:v157];
      v51 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315395;
        v165 = "-[ADCloudKitMultiUserSharedDataStore setKeyValueRecordsAndVoiceProfile:records:completion:]";
        __int16 v166 = 2113;
        id v167 = v50;
        _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_INFO, "%s #multi-user Setting multi-user start times to ADPreferences: %{private}@", buf, 0x16u);
      }

      v52 = +[ADPreferences sharedPreferences];
      [v52 setMultiUserSetUpStartTimes:v50];

      v45 = v133;
    }
    uint64_t v53 = v36 | obja | v126;
    BOOL v107 = v53 != 0;
    if (!v53)
    {
      uint64_t v36 = v37;
      uint64_t obja = v121;
      id v54 = v120;

      v55 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        v165 = "-[ADCloudKitMultiUserSharedDataStore setKeyValueRecordsAndVoiceProfile:records:completion:]";
        _os_log_debug_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEBUG, "%s Device is not meDevice", buf, 0xCu);
      }

      v130 = v54;
      v45 = v133;
    }
    v119 = (void *)v36;
    v56 = [v38 objectForKey:@"meDevice"];

    objc_opt_class();
    v108 = v56;
    v109 = v37;
    if (objc_opt_isKindOfClass()) {
      unsigned __int8 v104 = [v56 BOOLValue];
    }
    else {
      unsigned __int8 v104 = 1;
    }
    id v8 = v127;
    v114 = [v14 objectForKey:@"siriLanguage"];
    v113 = [(ADCloudKitMultiUserSharedDataStore *)self _homeMembershipsFromUnencryptedRecords:v14];
    v57 = [v113 allKeys];
    v125 = +[NSSet setWithArray:v57];

    id v58 = v14;
    if (!v58)
    {
      id v59 = 0;
      v11 = v122;
      goto LABEL_117;
    }
    v102 = v35;
    id v59 = objc_alloc_init((Class)SAHomeMemberSettings);
    uint64_t v101 = [v58 objectForKey:@"meCountryCode"];
    objc_msgSend(v59, "setCountryCode:");
    v60 = [v58 objectForKey:@"meCard"];
    if (v60) {
      BOOL v61 = v107;
    }
    else {
      BOOL v61 = 0;
    }
    if (v61
      || ([v58 objectForKey:@"backupMeCard"],
          uint64_t v62 = objc_claimAutoreleasedReturnValue(),
          v60,
          (v60 = (void *)v62) != 0))
    {
      v63 = +[AceObject aceObjectWithPlistData:v60];
      v64 = AFSiriLogContextDaemonAce;
      if (os_log_type_enabled(AFSiriLogContextDaemonAce, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        v165 = "saHomeMemberSettingsFromCloud";
        __int16 v166 = 2112;
        id v167 = v63;
        _os_log_debug_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEBUG, "%s SAPerson object is (%@)", buf, 0x16u);
      }
      [v59 setMeCard:v63];
    }
    v103 = v34;
    v65 = [v58 objectForKey:@"meParentalRestrictions"];
    [v59 setParentalRestrictions:v65];
    v66 = [v58 objectForKey:@"mePreferredLanguage"];
    [v59 setPreferredLanguage:v66];
    v67 = [v58 objectForKey:@"meRegion"];
    [v59 setRegion:v67];
    v68 = [v58 objectForKey:@"meTemperatureUnit"];
    [v59 setTemperatureUnit:v68];
    v69 = AFSiriLogContextDaemonAce;
    if (os_log_type_enabled(AFSiriLogContextDaemonAce, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136316162;
      v165 = "saHomeMemberSettingsFromCloud";
      __int16 v166 = 2112;
      id v167 = v65;
      __int16 v168 = 2112;
      id v169 = v66;
      __int16 v170 = 2112;
      v171 = v67;
      __int16 v172 = 2112;
      v173 = v68;
      _os_log_debug_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEBUG, "%s parentalRestrictions = (%@), preferredLanguage = (%@), region = (%@), temperatureUnit = (%@)", buf, 0x34u);
    }
    v70 = [v58 objectForKey:@"meTTSVoice"];
    if (v70)
    {
      v71 = +[AceObject aceObjectWithPlistData:v70];
      v72 = AFSiriLogContextDaemonAce;
      if (os_log_type_enabled(AFSiriLogContextDaemonAce, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        v165 = "saHomeMemberSettingsFromCloud";
        __int16 v166 = 2112;
        id v167 = v71;
        _os_log_debug_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEBUG, "%s ttsVoice object is (%@)", buf, 0x16u);
      }
      [v59 setTtsVoice:v71];
    }
    v73 = [v58 objectForKey:@"twentyFourHourTimeDisplay"];
    if (v73)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v74 = v73;
        if ([v74 integerValue])
        {
          if ([v74 integerValue] != (id)1)
          {
            id v100 = [v74 integerValue];
            log = AFSiriLogContextDaemonAce;
            BOOL v81 = os_log_type_enabled(AFSiriLogContextDaemonAce, OS_LOG_TYPE_DEBUG);
            if (v100 == (id)-1)
            {
              v78 = (void *)v101;
              if (v81)
              {
                *(_DWORD *)buf = 136315138;
                v165 = "saHomeMemberSettingsFromCloud";
                _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%s companion has twentyFourHourTimeDisplay set to nil, forcing this communal device's twentyFourHourTimeDisplay to NO", buf, 0xCu);
              }
              [v59 setTwentyFourHourTimeDisplay:&__kCFBooleanFalse];
            }
            else
            {
              v78 = (void *)v101;
              if (v81)
              {
                *(_DWORD *)buf = 136315138;
                v165 = "saHomeMemberSettingsFromCloud";
                _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%s twentyForHourTimeDisplay should be -1, 0, or 1", buf, 0xCu);
              }
            }
            goto LABEL_115;
          }
          v75 = AFSiriLogContextDaemonAce;
          if (os_log_type_enabled(AFSiriLogContextDaemonAce, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315138;
            v165 = "saHomeMemberSettingsFromCloud";
            _os_log_debug_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEBUG, "%s companion set twentyFourHourTimeDisplay to YES", buf, 0xCu);
          }
          v76 = &__kCFBooleanTrue;
        }
        else
        {
          v80 = AFSiriLogContextDaemonAce;
          if (os_log_type_enabled(AFSiriLogContextDaemonAce, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315138;
            v165 = "saHomeMemberSettingsFromCloud";
            _os_log_debug_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_DEBUG, "%s companion set twentyFourHourTimeDisplay to NO", buf, 0xCu);
          }
          v76 = &__kCFBooleanFalse;
        }
        [v59 setTwentyFourHourTimeDisplay:v76];
        v78 = (void *)v101;
LABEL_115:

        goto LABEL_116;
      }
      v77 = AFSiriLogContextDaemonAce;
      v78 = (void *)v101;
      if (os_log_type_enabled(AFSiriLogContextDaemonAce, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        v165 = "saHomeMemberSettingsFromCloud";
        v79 = "%s twentyForHourTimeDisplay should be NSNumber Integer";
        goto LABEL_104;
      }
    }
    else
    {
      v77 = AFSiriLogContextDaemonAce;
      v78 = (void *)v101;
      if (os_log_type_enabled(AFSiriLogContextDaemonAce, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        v165 = "saHomeMemberSettingsFromCloud";
        v79 = "%s companion did not set its twentyFourHourTimeDisplay";
LABEL_104:
        _os_log_debug_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_DEBUG, v79, buf, 0xCu);
      }
    }
LABEL_116:

    id v8 = v127;
    id v9 = v128;
    v11 = v122;
    v35 = v102;
    v34 = v103;
    v45 = v133;
LABEL_117:

    if (!v11)
    {
      v96 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v165 = "-[ADCloudKitMultiUserSharedDataStore setKeyValueRecordsAndVoiceProfile:records:completion:]";
        _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_INFO, "%s ADHomeInfoManager is not ready", buf, 0xCu);
      }
      id v7 = v110;
      v95 = v111;
      if (v9) {
        (*((void (**)(id, void))v9 + 2))(v9, 0);
      }
      goto LABEL_158;
    }
    v82 = [(ADCloudKitMultiUserSharedDataStore *)self zone];
    v83 = [v82 zoneID];
    v84 = [v83 ownerName];

    if ([v84 isEqualToString:CKCurrentUserDefaultName])
    {
      v85 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v165 = "-[ADCloudKitMultiUserSharedDataStore setKeyValueRecordsAndVoiceProfile:records:completion:]";
        _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_INFO, "%s Saving MeCard and Companion ACEHost", buf, 0xCu);
      }

      if (v107) {
        CFStringRef v86 = @"meCard";
      }
      else {
        CFStringRef v86 = @"backupMeCard";
      }
      v87 = [v58 objectForKey:v86];
      id v88 = v130;
      if (v87)
      {
        v89 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(v89, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          v165 = "-[ADCloudKitMultiUserSharedDataStore setKeyValueRecordsAndVoiceProfile:records:completion:]";
          _os_log_impl((void *)&_mh_execute_header, v89, OS_LOG_TYPE_INFO, "%s Found valid MeCard data", buf, 0xCu);
        }

        v90 = +[ADLocalMeCardStore sharedStore];
        [v90 storeMeCard:v87];

        id v8 = v127;
      }
      if (v88)
      {
        v91 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(v91, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          v165 = "-[ADCloudKitMultiUserSharedDataStore setKeyValueRecordsAndVoiceProfile:records:completion:]";
          _os_log_impl((void *)&_mh_execute_header, v91, OS_LOG_TYPE_INFO, "%s Found valid companion ACE Host", buf, 0xCu);
        }

        v92 = +[ADPreferences sharedPreferences];
        [v92 setSingleUserCompanionACEHost:v88];

        id v8 = v127;
      }
    }
    id v7 = v110;
    if (v125 && v34 && v35 || ![v8 count])
    {
      if (!self->isATVOnly || v124 && v119)
      {
        v134[0] = _NSConcreteStackBlock;
        v134[1] = 3221225472;
        v134[2] = sub_10014E9DC;
        v134[3] = &unk_100503AB0;
        id v135 = v34;
        id v136 = v113;
        id v137 = v115;
        id v138 = v119;
        id v139 = (id)obja;
        id v140 = v116;
        id v141 = v130;
        v95 = v111;
        id v142 = v111;
        char v154 = v105;
        unsigned __int8 v155 = v106;
        unsigned __int8 v156 = v104;
        id v143 = v114;
        v144 = self;
        id v145 = v118;
        id v146 = v35;
        id v147 = v124;
        id v148 = v84;
        id v149 = v59;
        id v150 = v117;
        id v151 = v125;
        id v152 = v8;
        id v9 = v128;
        v153 = v128;
        v11 = v122;
        [v122 getCurrentHomeMemberIds:v134];

LABEL_157:
        v45 = v133;
LABEL_158:

        v13 = v118;
        goto LABEL_159;
      }
      v97 = AFSiriLogContextSession;
      id v9 = v128;
      v11 = v122;
      if (os_log_type_enabled(v97, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315651;
        v165 = "-[ADCloudKitMultiUserSharedDataStore setKeyValueRecordsAndVoiceProfile:records:completion:]";
        __int16 v166 = 2113;
        id v167 = v124;
        __int16 v168 = 2113;
        id v169 = v119;
        _os_log_impl((void *)&_mh_execute_header, v97, OS_LOG_TYPE_INFO, "%s ATV companion invalid %{private}@-%{private}@", buf, 0x20u);
      }

      v95 = v111;
      if (!v128) {
        goto LABEL_157;
      }
      v94 = +[AFError errorWithCode:1012];
      ((void (**)(void, void *))v128)[2](v128, v94);
    }
    else
    {
      if (![v84 isEqualToString:CKCurrentUserDefaultName])
      {
        v98 = +[ADPreferences sharedPreferences];
        [v98 multiUserSharedDataServerChangeTokenForOwner:v84];

        id v9 = v128;
        v11 = v122;
        v95 = v111;
        if (v128) {
          v128[2](v128, 0);
        }
        goto LABEL_157;
      }
      v93 = +[ADMultiUserService sharedService];
      v94 = [v93 currentOwnerSharedUserID];

      id v9 = v128;
      if (v94)
      {
        [(ADCloudKitMultiUserSharedDataStore *)self _updateVoiceIDProfilesForSharedUser:v94 iCloudAltDSID:0 records:v8 isPrimary:1 isNewUser:0 completion:v128];
        v11 = v122;
      }
      else
      {
        v11 = v122;
        if (v128) {
          v128[2](v128, 0);
        }
      }
    }

    v95 = v111;
    goto LABEL_157;
  }
  if (v9) {
    (*((void (**)(id, void))v9 + 2))(v9, 0);
  }
LABEL_160:
}

- (void)checkForATVRMVSettingUpdate:(id)a3
{
  id v3 = a3;
  v4 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    unsigned int v40 = "-[ADCloudKitMultiUserSharedDataStore checkForATVRMVSettingUpdate:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  id v29 = +[ADHomeInfoManager sharedInfoManager];
  v5 = [v29 getHomeUniqueIdentifiers];
  v6 = +[NSSet setWithArray:v5];

  id v7 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    unsigned int v40 = "-[ADCloudKitMultiUserSharedDataStore checkForATVRMVSettingUpdate:]";
    __int16 v41 = 2112;
    id v42 = v6;
    _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%s #multi-user-atv Home Identifiers %@", buf, 0x16u);
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v3;
  id v8 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v8)
  {
    id v10 = v8;
    uint64_t v11 = *(void *)v35;
    *(void *)&long long v9 = 136315395;
    long long v28 = v9;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v35 != v11) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        id v14 = objc_msgSend(v13, "recordID", v28);
        id v15 = [v14 recordName];
        id v16 = [v15 uppercaseString];

        uint64_t v17 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          unsigned int v40 = "-[ADCloudKitMultiUserSharedDataStore checkForATVRMVSettingUpdate:]";
          __int16 v41 = 2112;
          id v42 = v16;
          _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "%s #multi-user-atv found key %@", buf, 0x16u);
        }
        if ([v6 containsObject:v16])
        {
          v18 = v6;
          id v19 = v16;
          v20 = AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            unsigned int v40 = "-[ADCloudKitMultiUserSharedDataStore checkForATVRMVSettingUpdate:]";
            __int16 v41 = 2112;
            id v42 = v19;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%s Home settings for %@ found", buf, 0x16u);
          }
          v21 = sub_10010B5AC(v13);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v22 = v21;
            id v23 = [v22 objectForKey:@"rmvTVSetting"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v24 = v23;
              if (v24)
              {
                id v25 = v24;
                unsigned int v30 = [v24 BOOLValue];
                v32[0] = _NSConcreteStackBlock;
                v32[1] = 3221225472;
                v32[2] = sub_1001508BC;
                v32[3] = &unk_10050C610;
                id v33 = v19;
                [v29 updateCurrentUserRMVSettingForHome:v33 enabled:v30 completion:v32];
              }
            }
            else
            {
              id v27 = AFSiriLogContextDaemon;
              if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = v28;
                unsigned int v40 = "-[ADCloudKitMultiUserSharedDataStore checkForATVRMVSettingUpdate:]";
                __int16 v41 = 2113;
                id v42 = v19;
                _os_log_debug_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "%s Invalid type found for RMV setting for home %{private}@", buf, 0x16u);
              }
            }
          }
          else
          {
            v26 = AFSiriLogContextDaemon;
            if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315138;
              unsigned int v40 = "-[ADCloudKitMultiUserSharedDataStore checkForATVRMVSettingUpdate:]";
              _os_log_debug_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "%s Invalid type found for Home Value setting", buf, 0xCu);
            }
          }

          v6 = v18;
        }
      }
      id v10 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v10);
  }
}

- (id)_homeMembershipsFromUnencryptedRecords:(id)a3
{
  id v3 = a3;
  v4 = +[NSMutableDictionary dictionary];
  v5 = [v3 objectForKey:@"meDeviceHomeUserUUID"];
  if ([v5 count])
  {
    v6 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315395;
      long long v35 = "-[ADCloudKitMultiUserSharedDataStore _homeMembershipsFromUnencryptedRecords:]";
      __int16 v36 = 2113;
      long long v37 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s Found Version 0 home memberships and adding them: %{private}@", buf, 0x16u);
    }
    [v4 addEntriesFromDictionary:v5];
  }
  id v24 = v5;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v7 = v3;
  id v8 = [v7 countByEnumeratingWithState:&v29 objects:v40 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v30;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v30 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        if ([v12 hasPrefix:@"sharedDeviceHomeUserUUIDPrefix"])
        {
          v13 = [v7 objectForKey:v12];
          [v4 addEntriesFromDictionary:v13];
          id v14 = AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315651;
            long long v35 = "-[ADCloudKitMultiUserSharedDataStore _homeMembershipsFromUnencryptedRecords:]";
            __int16 v36 = 2112;
            long long v37 = v12;
            __int16 v38 = 2113;
            v39 = v13;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s Found home membership with Version 1 record key:%@, record object:%{private}@", buf, 0x20u);
          }
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v29 objects:v40 count:16];
    }
    while (v9);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v15 = v7;
  id v16 = [v15 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v26;
    do
    {
      for (j = 0; j != v17; j = (char *)j + 1)
      {
        if (*(void *)v26 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = *(void **)(*((void *)&v25 + 1) + 8 * (void)j);
        if ([v20 hasPrefix:@"v2_sharedDeviceHomeUserUUIDPrefix"])
        {
          v21 = [v15 objectForKey:v20];
          [v4 addEntriesFromDictionary:v21];
          id v22 = AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315651;
            long long v35 = "-[ADCloudKitMultiUserSharedDataStore _homeMembershipsFromUnencryptedRecords:]";
            __int16 v36 = 2112;
            long long v37 = v20;
            __int16 v38 = 2113;
            v39 = v21;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "%s Found home membership with Version 2 record key:%@, record object:%{private}@", buf, 0x20u);
          }
        }
      }
      id v17 = [v15 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v17);
  }

  return v4;
}

- (BOOL)_errorIsUserNotPresentOnTV:(int64_t)a3
{
  return a3 == 6001;
}

- (BOOL)_errorIsRecoverableForSecondary:(int64_t)a3
{
  return a3 == 6007;
}

- (BOOL)_errorIsRecoverableForPrimary:(int64_t)a3
{
  return a3 == 6000;
}

- (void)fetchDeviceTypesForAllLanguages:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    serialQueue = self->_serialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100150F74;
    block[3] = &unk_10050D0D0;
    id v8 = v4;
    dispatch_async(serialQueue, block);
  }
}

- (void)fetchDeviceTypesForLanguage:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      id v14 = "-[ADCloudKitMultiUserSharedDataStore fetchDeviceTypesForLanguage:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
    }
    serialQueue = self->_serialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100151188;
    block[3] = &unk_10050E1D8;
    void block[4] = self;
    id v12 = v7;
    id v11 = v6;
    dispatch_async(serialQueue, block);
  }
}

- (void)deleteUserData:(id)a3
{
  id v4 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    id v6 = "-[ADCloudKitMultiUserSharedDataStore deleteUserData:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v5, 0xCu);
  }
  [(ADCloudKitMultiUserSharedDataStore *)self setServerChangeToken:0];
}

- (void)cleanupCacheDirectory
{
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100151494;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(serialQueue, block);
}

- (id)_createCacheDirectory
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v3 = [(ADCloudKitMultiUserSharedDataStore *)self _cacheDirectory];
  id v4 = +[NSFileManager defaultManager];
  unsigned __int8 v5 = [v4 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:0 error:0];

  if (v5)
  {
    id v6 = v3;
  }
  else
  {
    id v7 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315394;
      uint64_t v10 = "-[ADCloudKitMultiUserSharedDataStore _createCacheDirectory]";
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s Error creating cache directory att %@", (uint8_t *)&v9, 0x16u);
    }
    id v6 = 0;
  }

  return v6;
}

- (BOOL)_cleanupCacheDirectory
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v3 = +[NSFileManager defaultManager];
  id v4 = [(ADCloudKitMultiUserSharedDataStore *)self _cacheDirectory];
  unsigned __int8 v5 = [(ADCloudKitMultiUserSharedDataStore *)self _cacheDirectory];
  unsigned int v6 = [v3 fileExistsAtPath:v5];

  if (v6 && ([v3 removeItemAtPath:v4 error:0] & 1) == 0)
  {
    id v8 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315394;
      __int16 v11 = "-[ADCloudKitMultiUserSharedDataStore _cleanupCacheDirectory]";
      __int16 v12 = 2112;
      v13 = v4;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s Error deleting cache directory at %@", (uint8_t *)&v10, 0x16u);
    }
    BOOL v7 = 0;
  }
  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

- (id)_cacheDirectory
{
  v2 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  id v3 = [v2 firstObject];

  id v4 = [v3 stringByAppendingPathComponent:@"com.apple.assistantd/voiceid.cache"];

  return v4;
}

- (id)_extractRecord:(id)a3 atPath:(id)a4 fileManager:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v9 fileExistsAtPath:v8])
  {
    id v84 = 0;
    unsigned __int8 v10 = [v9 removeItemAtPath:v8 error:&v84];
    id v11 = v84;
    __int16 v12 = v11;
    if ((v10 & 1) == 0)
    {
      long long v28 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "-[ADCloudKitMultiUserSharedDataStore _extractRecord:atPath:fileManager:]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v12;
        _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%s Failed to delete archive expansion location with error (%@)", buf, 0x16u);
      }
      goto LABEL_32;
    }
  }
  id v83 = 0;
  unsigned __int8 v13 = [v9 createDirectoryAtPath:v8 withIntermediateDirectories:1 attributes:0 error:&v83];
  id v14 = v83;
  if ((v13 & 1) == 0)
  {
    long long v26 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[ADCloudKitMultiUserSharedDataStore _extractRecord:atPath:fileManager:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v14;
      _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%s Failed to create archive expansion location with error (%@)", buf, 0x16u);
    }
    id v27 = v14;
    goto LABEL_30;
  }
  id v81 = v7;
  id v82 = v8;
  id v15 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = "_ADCloudKitExtractArchiveToDirectory";
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  id v16 = objc_alloc((Class)SZExtractor);
  uint64_t v119 = SZExtractorOptionsDenyInvalidSymlinks;
  v120 = &__kCFBooleanTrue;
  id v17 = +[NSDictionary dictionaryWithObjects:&v120 forKeys:&v119 count:1];
  id v18 = [v16 initWithPath:v82 options:v17];

  if (!v18)
  {
    long long v29 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "_ADCloudKitExtractArchiveToDirectory";
      _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%s Failed to set up streaming unzipper", buf, 0xCu);
    }
    char v30 = 0;
    goto LABEL_23;
  }
  uint64_t v97 = 0;
  v98 = &v97;
  uint64_t v99 = 0x2020000000;
  uint64_t v100 = 0;
  uint64_t v91 = 0;
  v92 = &v91;
  uint64_t v93 = 0x3032000000;
  v94 = sub_1000787B0;
  v95 = sub_1000787C0;
  id v96 = 0;
  dispatch_semaphore_t v19 = dispatch_semaphore_create(0);
  *(void *)buf = _NSConcreteStackBlock;
  *(void *)&buf[8] = 3221225472;
  *(void *)&buf[16] = sub_1000787C8;
  v115 = &unk_1004FFC68;
  v117 = &v91;
  v118 = &v97;
  v20 = v19;
  v116 = v20;
  [v18 prepareForExtraction:buf];
  dispatch_time_t v21 = dispatch_time(0, 10000000000);
  v80 = v20;
  if (dispatch_semaphore_wait(v20, v21))
  {
    id v22 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v109 = 136315138;
      *(void *)&v109[4] = "_ADCloudKitExtractArchiveToDirectory";
      id v23 = "%s StreamingZip Error: time out while preparing extractor";
      id v24 = v22;
      uint32_t v25 = 12;
LABEL_75:
      _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, v23, v109, v25);
      goto LABEL_21;
    }
    goto LABEL_21;
  }
  uint64_t v31 = v92[5];
  if (v31)
  {
    long long v32 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v109 = 136315394;
      *(void *)&v109[4] = "_ADCloudKitExtractArchiveToDirectory";
      *(_WORD *)&v109[12] = 2112;
      *(void *)&v109[14] = v31;
      id v23 = "%s StreamingZip Error: %@";
      id v24 = v32;
      uint32_t v25 = 22;
      goto LABEL_75;
    }
LABEL_21:
    char v30 = 0;
    goto LABEL_22;
  }
  long long v35 = (const char *)[v81 cStringUsingEncoding:4];
  int v36 = open(v35, 0);
  int v37 = v36;
  if (v36 < 0)
  {
    unsigned int v40 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      v71 = __error();
      v72 = strerror(*v71);
      *(_DWORD *)v109 = 136315650;
      *(void *)&v109[4] = "_ADCloudKitExtractArchiveToDirectory";
      *(_WORD *)&v109[12] = 2080;
      *(void *)&v109[14] = v35;
      *(_WORD *)&v109[22] = 2080;
      id v110 = v72;
      _os_log_error_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "%s Failed to open input path %s: %s", v109, 0x20u);
    }

    goto LABEL_21;
  }
  if (fcntl(v36, 48, 1) < 0)
  {
    __int16 v38 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      v76 = __error();
      v77 = strerror(*v76);
      *(_DWORD *)v109 = 136315650;
      *(void *)&v109[4] = "_ADCloudKitExtractArchiveToDirectory";
      *(_WORD *)&v109[12] = 2080;
      *(void *)&v109[14] = v35;
      *(_WORD *)&v109[22] = 2080;
      id v110 = v77;
      _os_log_error_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "%s Unable to set F_NOCACHE accessing file %s %s", v109, 0x20u);
    }
  }
  int v79 = v37;
  if (v98[3])
  {
    v39 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      uint64_t v68 = v98[3];
      v69 = __error();
      v70 = strerror(*v69);
      *(_DWORD *)v109 = 136315650;
      *(void *)&v109[4] = "_ADCloudKitExtractArchiveToDirectory";
      *(_WORD *)&v109[12] = 2048;
      *(void *)&v109[14] = v68;
      *(_WORD *)&v109[22] = 2080;
      id v110 = v70;
      _os_log_error_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "%s Unexpected resumptionOffset: %llu: %s", v109, 0x20u);
    }

    close(v37);
    goto LABEL_21;
  }
  dispatch_semaphore_t v41 = dispatch_semaphore_create(0);
  uint64_t v85 = 0;
  CFStringRef v86 = &v85;
  uint64_t v87 = 0x3032000000;
  id v88 = sub_1000787B0;
  v89 = sub_1000787C0;
  id v90 = 0;
  dispatch_semaphore_t v78 = v41;
  while (1)
  {
    v43 = +[NSMutableData dataWithCapacity:0x20000];
    [v43 setLength:0x20000];
    id v44 = v43;
    ssize_t v45 = read(v79, [v44 mutableBytes], 0x20000uLL);
    uint64_t v46 = v45;
    if (!v45)
    {
      int v48 = 16;
      goto LABEL_61;
    }
    if (v45 != -1)
    {
      [v44 setLength:v45];
      *(void *)uint64_t v101 = 0;
      *(void *)&v101[8] = v101;
      *(void *)&v101[16] = 0x2020000000;
      LOBYTE(v102) = 0;
      *(void *)v109 = _NSConcreteStackBlock;
      *(void *)&v109[8] = 3221225472;
      *(void *)&v109[16] = sub_100078844;
      id v110 = (char *)&unk_1004FFC90;
      id v112 = &v85;
      v113 = v101;
      id v49 = v78;
      v111 = v49;
      [v18 supplyBytes:v44 withCompletionBlock:v109];

      dispatch_time_t v50 = dispatch_time(0, 10000000000);
      if (dispatch_semaphore_wait(v49, v50))
      {
        v51 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)char v105 = 136315138;
          unsigned __int8 v106 = "_ADCloudKitExtractArchiveToDirectory";
          v52 = v51;
          uint64_t v53 = "%s StreamingZip Error time out supplying bytes to extractor";
          uint32_t v54 = 12;
LABEL_69:
          _os_log_error_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, v53, v105, v54);
        }
      }
      else
      {
        v55 = (void *)v86[5];
        if (!v55)
        {
          if (*(unsigned char *)(*(void *)&v101[8] + 24))
          {
            v57 = AFSiriLogContextDaemon;
            int v48 = 16;
            if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)char v105 = 136315138;
              unsigned __int8 v106 = "_ADCloudKitExtractArchiveToDirectory";
              _os_log_error_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_ERROR, "%s Extractor said data was complete.", v105, 0xCu);
            }
          }
          else
          {
            int v48 = 0;
          }
          goto LABEL_60;
        }
        v56 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)char v105 = 136315394;
          unsigned __int8 v106 = "_ADCloudKitExtractArchiveToDirectory";
          __int16 v107 = 2112;
          v108 = v55;
          v52 = v56;
          uint64_t v53 = "%s supplyBytes: returned error %@";
          uint32_t v54 = 22;
          goto LABEL_69;
        }
      }
      close(v79);
      int v48 = 1;
LABEL_60:

      _Block_object_dispose(v101, 8);
      id v44 = 0;
      goto LABEL_61;
    }
    v47 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      id v58 = __error();
      id v59 = strerror(*v58);
      *(_DWORD *)uint64_t v101 = 136315394;
      *(void *)&v101[4] = "_ADCloudKitExtractArchiveToDirectory";
      *(_WORD *)&v101[12] = 2080;
      *(void *)&v101[14] = v59;
      _os_log_error_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "%s Read failed with error %s", v101, 0x16u);
    }

    close(v79);
    int v48 = 1;
LABEL_61:

    if (v48) {
      break;
    }
    if (v46 <= 0) {
      goto LABEL_71;
    }
  }
  if (v48 != 16)
  {
    char v30 = 0;
    goto LABEL_81;
  }
LABEL_71:
  close(v79);
  *(void *)uint64_t v101 = _NSConcreteStackBlock;
  *(void *)&v101[8] = 3221225472;
  *(void *)&v101[16] = sub_1000788BC;
  v102 = &unk_100500840;
  unsigned __int8 v104 = &v85;
  v60 = v78;
  v103 = v60;
  [v18 finishStreamWithCompletionBlock:v101];
  dispatch_time_t v61 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v60, v61))
  {
    uint64_t v62 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)char v105 = 136315138;
      unsigned __int8 v106 = "_ADCloudKitExtractArchiveToDirectory";
      v63 = "%s StreamingZip Error time out finishing extractor stream";
      v64 = v62;
      uint32_t v65 = 12;
      goto LABEL_88;
    }
    goto LABEL_79;
  }
  v66 = (void *)v86[5];
  if (v66)
  {
    v67 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)char v105 = 136315394;
      unsigned __int8 v106 = "_ADCloudKitExtractArchiveToDirectory";
      __int16 v107 = 2112;
      v108 = v66;
      v63 = "%s Failed to finish streaming extraction: %@";
      v64 = v67;
      uint32_t v65 = 22;
LABEL_88:
      _os_log_error_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_ERROR, v63, v105, v65);
    }
LABEL_79:
    char v30 = 0;
  }
  else
  {
    v73 = [v82 stringByAppendingPathComponent:@"META-INF"];
    id v74 = +[NSFileManager defaultManager];
    if ([v74 fileExistsAtPath:v73])
    {
      if (([v74 removeItemAtPath:v73 error:0] & 1) == 0)
      {
        v75 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)char v105 = 136315394;
          unsigned __int8 v106 = "_ADCloudKitExtractArchiveToDirectory";
          __int16 v107 = 2112;
          v108 = v73;
          _os_log_error_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_ERROR, "%s Error deleting meta data directory: %@", v105, 0x16u);
        }
      }
    }

    char v30 = 1;
  }

LABEL_81:
  _Block_object_dispose(&v85, 8);

LABEL_22:
  _Block_object_dispose(&v91, 8);

  _Block_object_dispose(&v97, 8);
LABEL_23:

  id v33 = AFSiriLogContextDaemon;
  if ((v30 & 1) == 0)
  {
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "-[ADCloudKitMultiUserSharedDataStore _extractRecord:atPath:fileManager:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v81;
      *(_WORD *)&buf[22] = 2112;
      v115 = v82;
      _os_log_error_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%s Failed to expand archive (%@) to location (%@)", buf, 0x20u);
    }
    id v27 = +[AFError errorWithCode:4009];
LABEL_30:
    __int16 v12 = v27;
    goto LABEL_31;
  }
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[ADCloudKitMultiUserSharedDataStore _extractRecord:atPath:fileManager:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v81;
    *(_WORD *)&buf[22] = 2112;
    v115 = v82;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "%s Expanded archive (%@) to location (%@)", buf, 0x20u);
  }
  __int16 v12 = 0;
LABEL_31:

LABEL_32:
  return v12;
}

- (id)_constructRecord:(id)a3 fileArchives:(id)a4 assetManifest:(id)a5 filePath:(id)a6
{
  id v9 = a3;
  id v77 = a4;
  id v10 = a5;
  id v11 = a6;
  __int16 v12 = [v9 version];
  unsigned __int8 v13 = [v9 productCategory];
  v70 = [v9 languageCode];
  if (!v12 || !v13)
  {
    uint64_t v43 = 4008;
LABEL_34:
    id v45 = +[AFError errorWithCode:v43];
    goto LABEL_63;
  }
  if (!v11)
  {
    id v44 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v92 = "-[ADCloudKitMultiUserSharedDataStore _constructRecord:fileArchives:assetManifest:filePath:]";
      _os_log_error_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "%s Unable to get voice trigger update path", buf, 0xCu);
    }
    uint64_t v43 = 4006;
    goto LABEL_34;
  }
  v75 = +[NSFileManager defaultManager];
  if (([v75 fileExistsAtPath:v11] & 1) == 0)
  {
    id v88 = 0;
    unsigned int v14 = [v75 createDirectoryAtPath:v11 withIntermediateDirectories:1 attributes:0 error:&v88];
    id v15 = v88;
    if (!v14)
    {
      id obj = v15;
      uint64_t v62 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v92 = "-[ADCloudKitMultiUserSharedDataStore _constructRecord:fileArchives:assetManifest:filePath:]";
        __int16 v93 = 2112;
        id v94 = v11;
        __int16 v95 = 2112;
        id v96 = obj;
        _os_log_error_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_ERROR, "%s Failed to create update location (%@) with error (%@)", buf, 0x20u);
      }
      uint64_t v63 = 4007;
      goto LABEL_57;
    }
  }
  long long v86 = 0u;
  long long v87 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  id v16 = v10;
  id v17 = [v16 countByEnumeratingWithState:&v84 objects:v90 count:16];
  v69 = v12;
  id v65 = v10;
  id v66 = v9;
  id v74 = v11;
  v71 = v13;
  if (v17)
  {
    id v18 = v17;
    char v67 = 0;
    id obj = 0;
    uint64_t v19 = *(void *)v85;
    id v78 = v16;
    while (2)
    {
      v20 = 0;
      id v72 = v18;
      do
      {
        if (*(void *)v85 != v19) {
          objc_enumerationMutation(v16);
        }
        dispatch_time_t v21 = *(void **)(*((void *)&v84 + 1) + 8 * (void)v20);
        id v22 = objc_msgSend(v16, "objectForKey:", v21, v65, v66);
        id v23 = [v21 componentsSeparatedByString:@","];
        if ([v23 count] == (id)3)
        {
          id v24 = [v23 objectAtIndexedSubscript:0];
          [v24 rangeOfString:@"Categ:"];
          uint64_t v26 = v25;

          id v27 = [v23 objectAtIndexedSubscript:0];
          long long v28 = [v27 substringFromIndex:v26];

          long long v29 = [v22 objectForKey:@"languages"];
          char v30 = [v29 objectAtIndex:0];

          uint64_t v31 = [v23 objectAtIndexedSubscript:2];
          [v31 rangeOfString:@"Vers:"];
          uint64_t v33 = v32;

          long long v34 = [v23 objectAtIndexedSubscript:2];
          long long v35 = [v34 substringFromIndex:v33];

          if ([v71 isEqualToString:v28]
            && (!v70 || [v70 isEqualToString:v30]))
          {
            id v36 = [v69 integerValue];
            if (v36 == [v35 integerValue])
            {
              uint64_t v68 = [v77 objectForKey:v21];
              int v37 = [v74 stringByAppendingPathComponent:v30];
              __int16 v38 = AFSiriLogContextDaemon;
              if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315650;
                v92 = "-[ADCloudKitMultiUserSharedDataStore _constructRecord:fileArchives:assetManifest:filePath:]";
                __int16 v93 = 2112;
                id v94 = v37;
                __int16 v95 = 2112;
                id v96 = v21;
                _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "%s Extracting file to location (%@) with key (%@)", buf, 0x20u);
              }
              uint64_t v39 = [(ADCloudKitMultiUserSharedDataStore *)self _extractRecord:v68 atPath:v37 fileManager:v75];
              if (v39)
              {
                id v42 = (void *)v39;
                uint64_t v46 = AFSiriLogContextDaemon;
                if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315650;
                  v92 = "-[ADCloudKitMultiUserSharedDataStore _constructRecord:fileArchives:assetManifest:filePath:]";
                  __int16 v93 = 2112;
                  id v94 = v30;
                  __int16 v95 = 2112;
                  id v96 = v42;
                  _os_log_error_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "%s Failed to extract at location (%@) with error (%@)", buf, 0x20u);
                }

                v47 = v78;
                goto LABEL_60;
              }

              char v67 = 1;
            }
            else
            {
              id v40 = [v35 integerValue];
              if ((uint64_t)v40 < (uint64_t)[v69 integerValue])
              {
                id v41 = obj;
                if (!obj) {
                  id v41 = objc_alloc_init((Class)NSMutableArray);
                }
                id obj = v41;
                [v41 addObject:v21];
              }
            }
          }

          id v16 = v78;
          id v18 = v72;
        }

        v20 = (char *)v20 + 1;
      }
      while (v18 != v20);
      id v18 = [v16 countByEnumeratingWithState:&v84 objects:v90 count:16];
      if (v18) {
        continue;
      }
      break;
    }

    if (v67)
    {
      id v42 = 0;
      goto LABEL_61;
    }
    id v10 = v65;
    id v9 = v66;
    int v48 = obj;
    id v11 = v74;
    __int16 v12 = v69;
    unsigned __int8 v13 = v71;
  }
  else
  {

    int v48 = 0;
  }
  if (objc_msgSend(v48, "count", v65, v66))
  {
    long long v82 = 0u;
    long long v83 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    id obj = v48;
    id v49 = [obj countByEnumeratingWithState:&v80 objects:v89 count:16];
    if (v49)
    {
      id v50 = v49;
      int v79 = v16;
      id v42 = 0;
      uint64_t v51 = *(void *)v81;
      do
      {
        for (i = 0; i != v50; i = (char *)i + 1)
        {
          uint64_t v53 = v42;
          if (*(void *)v81 != v51) {
            objc_enumerationMutation(obj);
          }
          uint32_t v54 = *(void **)(*((void *)&v80 + 1) + 8 * i);
          v55 = [v77 objectForKey:v54];
          v56 = [v79 objectForKey:v54];
          v57 = [v56 objectForKey:@"languages"];
          id v58 = [v57 objectAtIndex:0];

          id v59 = [v74 stringByAppendingPathComponent:v58];
          v60 = AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315650;
            v92 = "-[ADCloudKitMultiUserSharedDataStore _constructRecord:fileArchives:assetManifest:filePath:]";
            __int16 v93 = 2112;
            id v94 = v59;
            __int16 v95 = 2112;
            id v96 = v54;
            _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_INFO, "%s Extracting near match to location (%@) with key (%@)", buf, 0x20u);
          }
          id v42 = [(ADCloudKitMultiUserSharedDataStore *)self _extractRecord:v55 atPath:v59 fileManager:v75];

          if (v42)
          {
            dispatch_time_t v61 = AFSiriLogContextDaemon;
            if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315650;
              v92 = "-[ADCloudKitMultiUserSharedDataStore _constructRecord:fileArchives:assetManifest:filePath:]";
              __int16 v93 = 2112;
              id v94 = v58;
              __int16 v95 = 2112;
              id v96 = v42;
              _os_log_error_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_ERROR, "%s Failed to extract near match at location (%@) with error (%@)", buf, 0x20u);
            }
          }
        }
        id v50 = [obj countByEnumeratingWithState:&v80 objects:v89 count:16];
      }
      while (v50);
    }
    else
    {
      id v42 = 0;
    }
    v47 = obj;
LABEL_60:

LABEL_61:
    id v10 = v65;
    id v9 = v66;
    id v11 = v74;
    __int16 v12 = v69;
    unsigned __int8 v13 = v71;
    goto LABEL_62;
  }
  id obj = v48;
  uint64_t v63 = 4010;
LABEL_57:
  id v42 = +[AFError errorWithCode:v63];
LABEL_62:
  id v45 = v42;

LABEL_63:
  return v45;
}

- (void)_logRelevantAnalyticsOnMultiUserVoiceProfileDownloadSuccessWithSharedUserID:(id)a3 isPrimary:(BOOL)a4 isNewUser:(BOOL)a5
{
  BOOL v40 = a4;
  BOOL v41 = a5;
  id v5 = a3;
  unsigned int v6 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v47 = "-[ADCloudKitMultiUserSharedDataStore _logRelevantAnalyticsOnMultiUserVoiceProfileDownloadSuccessWithSharedUser"
          "ID:isPrimary:isNewUser:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  id v7 = +[NSMutableDictionary dictionary];
  id v8 = +[ADPreferences sharedPreferences];
  id v9 = [v8 multiUserSetupStartTimes];

  id v10 = +[ADPreferences sharedPreferences];
  id v11 = [v10 multiUserSetupCompleteTimes];

  uint64_t v12 = [v9 objectForKeyedSubscript:v5];
  uint64_t v13 = [v11 objectForKeyedSubscript:v5];
  if (v12 | v13) {
    BOOL v14 = 0;
  }
  else {
    BOOL v14 = (uint64_t)[(id)v12 longValue] > 0;
  }
  if (v12) {
    BOOL v15 = v13 == 0;
  }
  else {
    BOOL v15 = 0;
  }
  char v16 = v15;
  BOOL v17 = 1;
  if (!v14 && (v16 & 1) == 0)
  {
    [(id)v13 doubleValue];
    id v18 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:");
    [(id)v13 doubleValue];
    uint64_t v19 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:");
    BOOL v17 = [v18 compare:v19] == (id)1;
  }
  v20 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    log = v20;
    __int16 v38 = +[NSNumber numberWithBool:v41];
    int v37 = +[NSNumber numberWithBool:v17];
    *(_DWORD *)buf = 136316162;
    v47 = "-[ADCloudKitMultiUserSharedDataStore _logRelevantAnalyticsOnMultiUserVoiceProfileDownloadSuccessWithSharedUser"
          "ID:isPrimary:isNewUser:]";
    __int16 v48 = 2112;
    id v49 = v38;
    __int16 v50 = 2112;
    uint64_t v51 = v12;
    __int16 v52 = 2112;
    uint64_t v53 = v13;
    __int16 v54 = 2112;
    v55 = v37;
    _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%s #multi-user isNewUser:%@, userVoiceIDEnabledStartTime:%@, userVoiceIDEnabledCompleteTime:%@. Should log download success:%@", buf, 0x34u);

    v20 = AFSiriLogContextDaemon;
  }
  if (v17)
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v47 = "-[ADCloudKitMultiUserSharedDataStore _logRelevantAnalyticsOnMultiUserVoiceProfileDownloadSuccessWithSharedUs"
            "erID:isPrimary:isNewUser:]";
      _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "%s #multi-user Logging AFAnalyticsEventTypeMultiUserVoiceProfileDownloadSuccess event on voice profile downloading completion.", buf, 0xCu);
    }
    dispatch_time_t v21 = +[NSDate date];
    [v21 timeIntervalSince1970];
    double v23 = v22;

    if (v41)
    {
      if (v40) {
        CFStringRef v24 = @"owner";
      }
      else {
        CFStringRef v24 = @"participant";
      }
      v44[0] = @"user";
      v44[1] = @"timestamp";
      v45[0] = v24;
      uint64_t v25 = +[NSNumber numberWithDouble:v23];
      v45[1] = v25;
      uint64_t v26 = +[NSDictionary dictionaryWithObjects:v45 forKeys:v44 count:2];
      id v27 = +[NSMutableDictionary dictionaryWithDictionary:v26];

      double v28 = v23 - (double)(uint64_t)[(id)v12 longValue];
      if (v28 > 0.0 && v28 != v23)
      {
        char v30 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        [v27 setObject:v30 forKeyedSubscript:@"multiuser-voiceid-setup-time"];
      }
      uint64_t v31 = +[NSMutableDictionary dictionaryWithDictionary:v11];
      uint64_t v32 = +[NSNumber numberWithDouble:v23];
      [v31 setObject:v32 forKeyedSubscript:v5];

      uint64_t v33 = +[ADPreferences sharedPreferences];
      long long v34 = +[NSDictionary dictionaryWithDictionary:v31];
      [v33 setMultiUserSetUpCompleteTimes:v34];

      AFInternalPreferencesSynchronize();
    }
    else
    {
      id v27 = v7;
    }
    long long v35 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315395;
      v47 = "-[ADCloudKitMultiUserSharedDataStore _logRelevantAnalyticsOnMultiUserVoiceProfileDownloadSuccessWithSharedUs"
            "erID:isPrimary:isNewUser:]";
      __int16 v48 = 2113;
      id v49 = v27;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "%s #multi-user Logged AFAnalyticsEventTypeMultiUserVoiceProfileDownloadSuccess event with: %{private}@", buf, 0x16u);
    }
    id v36 = +[AFAnalytics sharedAnalytics];
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_1001534DC;
    v42[3] = &unk_10050E0C8;
    id v7 = v27;
    id v43 = v7;
    [v36 logEventWithType:6107 contextProvider:v42];
  }
  else if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v47 = "-[ADCloudKitMultiUserSharedDataStore _logRelevantAnalyticsOnMultiUserVoiceProfileDownloadSuccessWithSharedUser"
          "ID:isPrimary:isNewUser:]";
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%s #multi-user Skipped logging of AFAnalyticsEventTypeMultiUserVoiceProfileDownloadSuccess event", buf, 0xCu);
  }
}

- (void)_updateVoiceIDProfilesForSharedUser:(id)a3 iCloudAltDSID:(id)a4 records:(id)a5 isPrimary:(BOOL)a6 isNewUser:(BOOL)a7 completion:(id)a8
{
  BOOL v9 = a7;
  id v78 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a8;
  BOOL v17 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v115 = "-[ADCloudKitMultiUserSharedDataStore _updateVoiceIDProfilesForSharedUser:iCloudAltDSID:records:isPrimary:isNe"
           "wUser:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  if (v9)
  {
    id v18 = +[AFAnalytics sharedAnalytics];
    v109[0] = _NSConcreteStackBlock;
    v109[1] = 3221225472;
    v109[2] = sub_100154218;
    v109[3] = &unk_1005098E0;
    BOOL v110 = a6;
    [v18 logEventWithType:6111 contextProvider:v109];
  }
  BOOL v77 = a6;
  uint64_t v19 = objc_opt_new();
  v20 = objc_opt_new();
  objc_opt_class();
  objc_opt_class();
  objc_opt_class();
  objc_opt_class();
  if ([v15 count])
  {
    BOOL v71 = v9;
    int v79 = v20;
    id v72 = self;
    v73 = (void (**)(void, void))v16;
    id v75 = v14;
    v76 = v19;
    long long v107 = 0u;
    long long v108 = 0u;
    long long v105 = 0u;
    long long v106 = 0u;
    id v74 = v15;
    id v21 = v15;
    id v22 = [v21 countByEnumeratingWithState:&v105 objects:v120 count:16];
    if (!v22) {
      goto LABEL_72;
    }
    id v23 = v22;
    uint64_t v24 = *(void *)v106;
    id v89 = v21;
    while (1)
    {
      for (i = 0; i != v23; i = (char *)i + 1)
      {
        if (*(void *)v106 != v24) {
          objc_enumerationMutation(v21);
        }
        uint64_t v26 = *(void **)(*((void *)&v105 + 1) + 8 * i);
        id v27 = [v26 recordType];
        if (([v27 isEqualToString:@"AssistantKeyValueRecord"] & 1) == 0)
        {
          if ([v27 isEqualToString:@"AssistantVoiceTriggerFileAssetRecord"])
          {
            double v28 = [v26 recordID];
            long long v29 = [v28 recordName];

            if ([v29 length])
            {
              char v30 = [v26 encryptedValuesByKey];
              uint64_t v31 = [v30 objectForKey:@"fileName"];
              if ((objc_opt_isKindOfClass() & 1) == 0 || ![v31 length])
              {
                __int16 v48 = AFSiriLogContextDaemon;
                if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315394;
                  v115 = "-[ADCloudKitMultiUserSharedDataStore _updateVoiceIDProfilesForSharedUser:iCloudAltDSID:records:"
                         "isPrimary:isNewUser:completion:]";
                  __int16 v116 = 2112;
                  v117 = v29;
                  _os_log_error_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "%s Record (%@) has invalid file name", buf, 0x16u);
                }
                goto LABEL_68;
              }
              uint64_t v32 = [v30 objectForKey:@"fileCompressionType"];
              id v88 = v32;
              if (objc_opt_isKindOfClass())
              {
                if ([v32 unsignedIntegerValue] == (id)2)
                {
                  uint64_t v87 = [v30 objectForKey:@"fileAssetSize"];
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    uint64_t v33 = AFSiriLogContextDaemon;
                    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 136315394;
                      v115 = "-[ADCloudKitMultiUserSharedDataStore _updateVoiceIDProfilesForSharedUser:iCloudAltDSID:reco"
                             "rds:isPrimary:isNewUser:completion:]";
                      __int16 v116 = 2112;
                      v117 = v29;
                      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "%s Record (%@) has invalid file size type", buf, 0x16u);
                    }
                  }
                  long long v34 = [v26 objectForKey:@"fileAsset"];
                  long long v86 = v34;
                  if (objc_opt_isKindOfClass())
                  {
                    long long v35 = [v34 fileURL];
                    id v36 = [v35 path];

                    long long v81 = v35;
                    if (v36)
                    {
                      int v37 = [v35 path];
                      [v79 setObject:v37 forKey:v31];

                      __int16 v38 = [v30 objectForKey:@"languages"];
                      if ((objc_opt_isKindOfClass() & 1) != 0 && [v38 count])
                      {
                        long long v103 = 0u;
                        long long v104 = 0u;
                        long long v101 = 0u;
                        long long v102 = 0u;
                        id obj = v38;
                        id v84 = [obj countByEnumeratingWithState:&v101 objects:v113 count:16];
                        if (v84)
                        {
                          os_log_t log = *(os_log_t *)v102;
                          v70 = v38;
LABEL_27:
                          uint64_t v39 = 0;
                          while (1)
                          {
                            if (*(os_log_t *)v102 != log) {
                              objc_enumerationMutation(obj);
                            }
                            BOOL v40 = *(void **)(*((void *)&v101 + 1) + 8 * v39);
                            if ((objc_opt_isKindOfClass() & 1) == 0 || ![v40 length]) {
                              break;
                            }
                            if (v84 == (id)++v39)
                            {
                              __int16 v38 = v70;
                              id v84 = [obj countByEnumeratingWithState:&v101 objects:v113 count:16];
                              if (v84) {
                                goto LABEL_27;
                              }
                              goto LABEL_34;
                            }
                          }

                          dispatch_time_t v61 = AFSiriLogContextDaemon;
                          v56 = (void *)v87;
                          __int16 v38 = v70;
                          if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR)) {
                            goto LABEL_64;
                          }
                          *(_DWORD *)buf = 136315394;
                          v115 = "-[ADCloudKitMultiUserSharedDataStore _updateVoiceIDProfilesForSharedUser:iCloudAltDSID:"
                                 "records:isPrimary:isNewUser:completion:]";
                          __int16 v116 = 2112;
                          v117 = v29;
                          id v58 = v61;
                          id v59 = "%s Record (%@) has invalid language in array";
LABEL_60:
                          _os_log_error_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_ERROR, v59, buf, 0x16u);
                        }
                        else
                        {
LABEL_34:

                          BOOL v41 = [v30 objectForKey:@"productType"];
                          if ((objc_opt_isKindOfClass() & 1) != 0 && [v41 length])
                          {
                            uint64_t v42 = [v26 modificationDate];
                            if (!v42)
                            {
                              uint64_t v42 = +[NSDate date];
                            }
                            v111[0] = @"modificationDate";
                            v111[1] = @"languages";
                            long long v85 = (void *)v42;
                            v112[0] = v42;
                            v112[1] = obj;
                            v111[2] = @"productType";
                            id v43 = v41;
                            v112[2] = v41;
                            id v44 = +[NSDictionary dictionaryWithObjects:v112 forKeys:v111 count:3];
                            [v76 setObject:v44 forKey:v29];
                            loga = AFSiriLogContextDaemon;
                            if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
                            {
                              *(_DWORD *)buf = 136315394;
                              v115 = "-[ADCloudKitMultiUserSharedDataStore _updateVoiceIDProfilesForSharedUser:iCloudAltD"
                                     "SID:records:isPrimary:isNewUser:completion:]";
                              __int16 v116 = 2112;
                              v117 = v44;
                              _os_log_impl((void *)&_mh_execute_header, loga, OS_LOG_TYPE_INFO, "%s voice record: %@", buf, 0x16u);
                            }
                          }
                          else
                          {
                            id v43 = v41;
                            uint64_t v62 = AFSiriLogContextDaemon;
                            if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
                            {
                              *(_DWORD *)buf = 136315394;
                              v115 = "-[ADCloudKitMultiUserSharedDataStore _updateVoiceIDProfilesForSharedUser:iCloudAltD"
                                     "SID:records:isPrimary:isNewUser:completion:]";
                              __int16 v116 = 2112;
                              v117 = v29;
                              _os_log_error_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_ERROR, "%s Record (%@) has invalid product type", buf, 0x16u);
                            }
                          }

                          v56 = (void *)v87;
                        }
                      }
                      else
                      {
                        v57 = AFSiriLogContextDaemon;
                        v56 = (void *)v87;
                        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)buf = 136315394;
                          v115 = "-[ADCloudKitMultiUserSharedDataStore _updateVoiceIDProfilesForSharedUser:iCloudAltDSID:"
                                 "records:isPrimary:isNewUser:completion:]";
                          __int16 v116 = 2112;
                          v117 = v29;
                          id v58 = v57;
                          id v59 = "%s Record (%@) has invalid language array";
                          goto LABEL_60;
                        }
                      }
LABEL_64:
                    }
                    else
                    {
                      v60 = AFSiriLogContextDaemon;
                      v56 = (void *)v87;
                      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 136315650;
                        v115 = "-[ADCloudKitMultiUserSharedDataStore _updateVoiceIDProfilesForSharedUser:iCloudAltDSID:re"
                               "cords:isPrimary:isNewUser:completion:]";
                        __int16 v116 = 2112;
                        v117 = v29;
                        __int16 v118 = 2112;
                        uint64_t v119 = v35;
                        _os_log_error_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_ERROR, "%s Record (%@) file asset URL(%@) path is nil", buf, 0x20u);
                      }
                    }
                  }
                  else
                  {
                    v55 = AFSiriLogContextDaemon;
                    v56 = (void *)v87;
                    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 136315394;
                      v115 = "-[ADCloudKitMultiUserSharedDataStore _updateVoiceIDProfilesForSharedUser:iCloudAltDSID:reco"
                             "rds:isPrimary:isNewUser:completion:]";
                      __int16 v116 = 2112;
                      v117 = v29;
                      _os_log_error_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_ERROR, "%s Record (%@) has invalid file asset type", buf, 0x16u);
                    }
                  }

LABEL_67:
LABEL_68:

                  id v21 = v89;
LABEL_69:

                  goto LABEL_70;
                }
                __int16 v54 = AFSiriLogContextDaemon;
                if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_67;
                }
                *(_DWORD *)buf = 136315650;
                v115 = "-[ADCloudKitMultiUserSharedDataStore _updateVoiceIDProfilesForSharedUser:iCloudAltDSID:records:is"
                       "Primary:isNewUser:completion:]";
                __int16 v116 = 2112;
                v117 = v26;
                __int16 v118 = 2112;
                uint64_t v119 = v88;
                uint64_t v51 = v54;
                __int16 v52 = "%s Record (%@) is using unsupported compression type: %@";
                uint32_t v53 = 32;
              }
              else
              {
                __int16 v50 = AFSiriLogContextDaemon;
                if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_67;
                }
                *(_DWORD *)buf = 136315394;
                v115 = "-[ADCloudKitMultiUserSharedDataStore _updateVoiceIDProfilesForSharedUser:iCloudAltDSID:records:is"
                       "Primary:isNewUser:completion:]";
                __int16 v116 = 2112;
                v117 = v29;
                uint64_t v51 = v50;
                __int16 v52 = "%s Record (%@) has invalid compression type";
                uint32_t v53 = 22;
              }
              _os_log_error_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_ERROR, v52, buf, v53);
              goto LABEL_67;
            }
            id v49 = AFSiriLogContextDaemon;
            if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315394;
              v115 = "-[ADCloudKitMultiUserSharedDataStore _updateVoiceIDProfilesForSharedUser:iCloudAltDSID:records:isPr"
                     "imary:isNewUser:completion:]";
              __int16 v116 = 2112;
              v117 = v26;
              _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_INFO, "%s Modified record is lacking a name : (%@)", buf, 0x16u);
            }
            goto LABEL_69;
          }
          id v45 = (void *)AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v46 = v45;
            v47 = [v26 recordType];
            *(_DWORD *)buf = 136315394;
            v115 = "-[ADCloudKitMultiUserSharedDataStore _updateVoiceIDProfilesForSharedUser:iCloudAltDSID:records:isPrim"
                   "ary:isNewUser:completion:]";
            __int16 v116 = 2112;
            v117 = v47;
            _os_log_debug_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEBUG, "%s Unsupported record type : (%@)", buf, 0x16u);
          }
        }
LABEL_70:
      }
      id v23 = [v21 countByEnumeratingWithState:&v105 objects:v120 count:16];
      if (!v23)
      {
LABEL_72:

        v20 = v79;
        if ([v79 count])
        {
          v93[0] = _NSConcreteStackBlock;
          v93[1] = 3221225472;
          v93[2] = sub_10015431C;
          v93[3] = &unk_1005039F0;
          id v63 = v79;
          id v94 = v63;
          __int16 v95 = v72;
          id v64 = v78;
          id v96 = v64;
          BOOL v99 = v77;
          BOOL v100 = v71;
          id v16 = v73;
          v98 = v73;
          uint64_t v19 = v76;
          id v65 = v76;
          id v97 = v65;
          id v66 = objc_retainBlock(v93);
          voiceProfileManager = v72->_voiceProfileManager;
          v90[0] = _NSConcreteStackBlock;
          v90[1] = 3221225472;
          v90[2] = sub_100154718;
          v90[3] = &unk_100503A18;
          v90[4] = v72;
          id v91 = v63;
          id v92 = v65;
          [(SSRVoiceProfileManager *)voiceProfileManager notifyUserVoiceProfileDownloadReadyForUser:v64 getData:v90 completion:v66];

          uint64_t v68 = v78;
          v69 = v94;
        }
        else
        {
          v69 = +[AFError errorWithCode:4005];
          id v16 = v73;
          uint64_t v19 = v76;
          uint64_t v68 = v78;
          if (v73) {
            ((void (**)(void, void *))v73)[2](v73, v69);
          }
        }
        id v15 = v74;
        id v14 = v75;
        goto LABEL_79;
      }
    }
  }
  v69 = +[AFError errorWithCode:4005];
  uint64_t v68 = v78;
  if (v16) {
    (*((void (**)(id, void *))v16 + 2))(v16, v69);
  }
LABEL_79:
}

- (void)_mergeDataWithModifiedRecords:(id)a3 deletedRecordIDs:(id)a4 containsAllChanges:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v31 = a6;
  uint64_t v12 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = v12;
    id v14 = [v10 count];
    id v15 = [v11 count];
    BOOL dataStoreIsOnSharedDatabase = self->_dataStoreIsOnSharedDatabase;
    CFStringRef v17 = @"partial";
    *(_DWORD *)buf = 136316162;
    uint64_t v39 = "-[ADCloudKitMultiUserSharedDataStore _mergeDataWithModifiedRecords:deletedRecordIDs:containsAllChanges:completion:]";
    if (v7) {
      CFStringRef v17 = @"full";
    }
    CFStringRef v18 = @"shared";
    __int16 v40 = 2048;
    id v41 = v14;
    __int16 v42 = 2048;
    id v43 = v15;
    __int16 v44 = 2112;
    if (!dataStoreIsOnSharedDatabase) {
      CFStringRef v18 = @"owner";
    }
    CFStringRef v45 = v17;
    __int16 v46 = 2112;
    CFStringRef v47 = v18;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s Merging %zd modified records, %zd deleted records, %@ sync, %@", buf, 0x34u);
  }
  uint64_t v32 = v11;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v19 = objc_alloc_init((Class)NSMutableArray);
  id v20 = objc_alloc_init((Class)NSMutableArray);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v21 = v10;
  id v22 = [v21 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v34;
    do
    {
      for (i = 0; i != v23; i = (char *)i + 1)
      {
        if (*(void *)v34 != v24) {
          objc_enumerationMutation(v21);
        }
        uint64_t v26 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        id v27 = [v26 recordType];
        unsigned __int8 v28 = [v27 isEqualToString:@"AssistantKeyValueRecord"];
        long long v29 = v19;
        if ((v28 & 1) != 0
          || (unsigned int v30 = [v27 isEqualToString:@"AssistantVoiceTriggerFileAssetRecord"],
              long long v29 = v20,
              v30))
        {
          [v29 addObject:v26];
        }
      }
      id v23 = [v21 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v23);
  }

  [(ADCloudKitMultiUserSharedDataStore *)self setKeyValueRecordsAndVoiceProfile:v19 records:v20 completion:v31];
}

- (void)mergeDataWithModifiedRecords:(id)a3 deletedRecordIDs:(id)a4 containsAllChanges:(BOOL)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100154ACC;
  block[3] = &unk_100509CF0;
  void block[4] = self;
  id v18 = v10;
  BOOL v21 = a5;
  id v19 = v11;
  id v20 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(serialQueue, block);
}

- (void)_synchronizeVoiceIDWithActivity:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[ADCloudKitMultiUserSharedDataStore _synchronizeVoiceIDWithActivity:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&buf, 0xCu);
  }
  BOOL v9 = AFProductType();
  if ([v9 length])
  {
    id v10 = AFBuildVersion();
    if ([v10 length])
    {
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v39 = 0x3032000000;
      __int16 v40 = sub_100154F90;
      id v41 = sub_100154FA0;
      id v42 = objc_alloc_init((Class)NSMutableArray);
      v36[0] = 0;
      v36[1] = v36;
      v36[2] = 0x3032000000;
      v36[3] = sub_100154F90;
      v36[4] = sub_100154FA0;
      id v37 = objc_alloc_init((Class)NSMutableArray);
      [(ADCloudKitMultiUserSharedDataStore *)self _cleanupCacheDirectory];
      id v11 = [(ADCloudKitMultiUserSharedDataStore *)self _createCacheDirectory];
      if (v11)
      {
        id v20 = +[NSFileManager defaultManager];
        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472;
        v30[2] = sub_100154FA8;
        v30[3] = &unk_1005039A0;
        v30[4] = self;
        id v33 = v7;
        p_long long buf = &buf;
        id v31 = v6;
        long long v35 = v36;
        id v12 = v9;
        id v32 = v12;
        uint64_t v13 = objc_retainBlock(v30);
        id v14 = v10;
        id v15 = v6;
        sharedUserID = self->_sharedUserID;
        voiceProfileManager = self->_voiceProfileManager;
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_1001551A0;
        v22[3] = &unk_1005039C8;
        id v21 = v20;
        id v23 = v21;
        id v24 = v11;
        uint64_t v25 = self;
        id v26 = v12;
        id v27 = v14;
        unsigned __int8 v28 = &buf;
        long long v29 = v36;
        [(SSRVoiceProfileManager *)voiceProfileManager uploadUserVoiceProfileForSiriProfileId:sharedUserID withUploadTrigger:v22 completion:v13];

        id v6 = v15;
        id v10 = v14;
      }
      else if (v7)
      {
        (*((void (**)(id, void))v7 + 2))(v7, 0);
      }

      _Block_object_dispose(v36, 8);
      _Block_object_dispose(&buf, 8);

      goto LABEL_16;
    }
    id v19 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[ADCloudKitMultiUserSharedDataStore _synchronizeVoiceIDWithActivity:completion:]";
      _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s Unable to retrieve build version", (uint8_t *)&buf, 0xCu);
      if (!v7) {
        goto LABEL_16;
      }
    }
    else if (!v7)
    {
LABEL_16:

      goto LABEL_17;
    }
    (*((void (**)(id, void))v7 + 2))(v7, 0);
    goto LABEL_16;
  }
  id v18 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[ADCloudKitMultiUserSharedDataStore _synchronizeVoiceIDWithActivity:completion:]";
    _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s Unable to retrieve product type", (uint8_t *)&buf, 0xCu);
    if (!v7) {
      goto LABEL_17;
    }
    goto LABEL_9;
  }
  if (v7) {
LABEL_9:
  }
    (*((void (**)(id, void))v7 + 2))(v7, 0);
LABEL_17:
}

- (void)_synchronizeUsingActivity:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315138;
    id v11 = "-[ADCloudKitMultiUserSharedDataStore _synchronizeUsingActivity:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v10, 0xCu);
  }
  if (AFIsMultiUserCompanion()
    && [(ADCloudKitMultiUserSharedDataStore *)self isMirroredDataStore])
  {
    BOOL v9 = +[ADMultiUserCloudKitSyncer sharedService];
    [v9 syncIdentifiersToCloud];
  }
  [(ADCloudKitMultiUserSharedDataStore *)self _synchronizeVoiceIDWithActivity:v6 completion:v7];
}

- (void)synchronizeWithCompletion:(id)a3
{
}

- (void)synchronizeUsingActivity:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100156B00;
  block[3] = &unk_10050E1D8;
  id v12 = v6;
  id v13 = v7;
  void block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(serialQueue, block);
}

- (void)setServerChangeToken:(id)a3
{
  id v10 = a3;
  if (![(ADCloudKitMultiUserSharedDataStore *)self isMirroredDataStore]
    && (AFSupportsMultiUser() & 1) == 0)
  {
    if (v10)
    {
      id v4 = objc_msgSend(v10, "ad_archiveTokenToDataWithExceptionBlock:", &stru_100503928);
      if (!v4) {
        goto LABEL_13;
      }
    }
    else
    {
      id v4 = 0;
    }
    id v5 = [(ADCloudKitMultiUserSharedDataStore *)self zone];
    id v6 = [v5 zoneID];
    id v7 = [v6 ownerName];

    if ([(ADCloudKitMultiUserSharedDataStore *)self dataStoreIsOnSharedDatabase])
    {
      if (!v7)
      {
LABEL_12:

        goto LABEL_13;
      }
      id v8 = +[ADPreferences sharedPreferences];
      [v8 setMultiUserSharedDataServerChangeToken:v4 forOwnerName:v7];
    }
    else
    {
      id v8 = +[ADPreferences sharedPreferences];
      [v8 setMultiUserSharedDataServerChangeToken:v4];
    }

    id v9 = +[ADPreferences sharedPreferences];
    [v9 synchronize];

    goto LABEL_12;
  }
LABEL_13:
}

- (CKServerChangeToken)serverChangeToken
{
  if ([(ADCloudKitMultiUserSharedDataStore *)self isMirroredDataStore]
    || (AFSupportsMultiUser() & 1) != 0
    || [(ADCloudKitMultiUserSharedDataStore *)self dataStoreIsOnSharedDatabase])
  {
    id v3 = 0;
  }
  else
  {
    id v5 = +[ADPreferences sharedPreferences];
    id v6 = [v5 multiUserSharedDataServerChangeToken];

    id v3 = +[CKServerChangeToken ad_unarchiveTokenFromData:v6 withExceptionBlock:&stru_100503908];
  }
  return (CKServerChangeToken *)v3;
}

- (void)setHasSetUpRecordZoneSubscription:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[ADPreferences sharedPreferences];
  [v4 setHasSetupMultiUserSharedRecordZoneSubscription:v3];

  id v5 = +[ADPreferences sharedPreferences];
  [v5 synchronize];
}

- (BOOL)hasSetUpRecordZoneSubscription
{
  v2 = +[ADPreferences sharedPreferences];
  unsigned __int8 v3 = [v2 hasSetUpMultiUserSharedRecordZoneSubscription];

  return v3;
}

- (ADCloudKitMultiUserSharedDataStore)initWithInstanceContext:(id)a3
{
  v16.receiver = self;
  v16.super_class = (Class)ADCloudKitMultiUserSharedDataStore;
  unsigned __int8 v3 = [(ADCloudKitMultiUserSharedDataStore *)&v16 init];
  if (v3)
  {
    v17[0] = @"AssistantVoiceTriggerFileAssetRecord";
    v17[1] = @"AssistantKeyValueRecord";
    uint64_t v4 = +[NSArray arrayWithObjects:v17 count:2];
    supportedRecordTypes = v3->_supportedRecordTypes;
    v3->_supportedRecordTypes = (NSArray *)v4;

    id v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("ADCloudKitMultiUserSharedDataStore.Serial", v6);
    serialQueue = v3->_serialQueue;
    v3->_serialQueue = (OS_dispatch_queue *)v7;

    uint64_t v9 = +[SSRVoiceProfileManager sharedInstance];
    voiceProfileManager = v3->_voiceProfileManager;
    v3->_voiceProfileManager = (SSRVoiceProfileManager *)v9;

    os_signpost_id_t v11 = os_signpost_id_generate(AFSiriLogContextMultiUser);
    id v12 = AFSiriLogContextMultiUser;
    id v13 = v12;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_WORD *)id v15 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "MultiUserService", "Setting up ADCloudKitMultiUserSharedDataStore listener", v15, 2u);
    }

    v3->multiUserSyncedRecordsSignpost = v11;
    v3->isATVOnly = AFIsATV();
  }
  return v3;
}

- (ADCloudKitMultiUserSharedDataStore)init
{
  unsigned __int8 v3 = +[AFInstanceContext currentContext];
  uint64_t v4 = [(ADCloudKitMultiUserSharedDataStore *)self initWithInstanceContext:v3];

  return v4;
}

@end