@interface ADCloudKitKeyValueMirroredStore
- (ADCloudKitKeyValueMirroredStore)init;
- (BOOL)dataStoreIsOnSharedDatabase;
- (BOOL)dataStoreShouldMirrorData;
- (BOOL)hasSetUpRecordZoneSubscription;
- (BOOL)isMirroredDataStore;
- (CKRecordZone)zone;
- (CKServerChangeToken)serverChangeToken;
- (NSArray)supportedRecordTypes;
- (NSMutableDictionary)localKeychainPreferenceCache;
- (NSMutableDictionary)localPreferenceCache;
- (NSMutableDictionary)modificationDateCache;
- (void)deleteUserData:(id)a3;
- (void)fetchDeviceTypesForAllLanguages:(id)a3;
- (void)fetchDeviceTypesForLanguage:(id)a3 completion:(id)a4;
- (void)mergeDataWithModifiedRecords:(id)a3 deletedRecordIDs:(id)a4 containsAllChanges:(BOOL)a5 completion:(id)a6;
- (void)setDataStoreIsOnSharedDatabase:(BOOL)a3;
- (void)setDataStoreShouldMirrorData:(BOOL)a3;
- (void)setIsMirroredDataStore:(BOOL)a3;
- (void)setLocalKeychainPreferenceCache:(id)a3;
- (void)setLocalPreferenceCache:(id)a3;
- (void)setModificationDateCache:(id)a3;
- (void)setSupportedRecordTypes:(id)a3;
- (void)setZone:(id)a3;
- (void)synchronizeKeychainPreferencesWithCompletion:(id)a3;
- (void)synchronizeUsingActivity:(id)a3 completion:(id)a4;
- (void)synchronizeWithCompletion:(id)a3;
@end

@implementation ADCloudKitKeyValueMirroredStore

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modificationDateCache, 0);
  objc_storeStrong((id *)&self->_localKeychainPreferenceCache, 0);
  objc_storeStrong((id *)&self->_localPreferenceCache, 0);
  objc_storeStrong((id *)&self->_supportedRecordTypes, 0);
  objc_storeStrong((id *)&self->_zone, 0);
}

- (void)setModificationDateCache:(id)a3
{
}

- (NSMutableDictionary)modificationDateCache
{
  return self->_modificationDateCache;
}

- (void)setLocalKeychainPreferenceCache:(id)a3
{
}

- (NSMutableDictionary)localKeychainPreferenceCache
{
  return self->_localKeychainPreferenceCache;
}

- (void)setLocalPreferenceCache:(id)a3
{
}

- (NSMutableDictionary)localPreferenceCache
{
  return self->_localPreferenceCache;
}

- (void)setSupportedRecordTypes:(id)a3
{
}

- (NSArray)supportedRecordTypes
{
  return self->_supportedRecordTypes;
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

- (void)synchronizeUsingActivity:(id)a3 completion:(id)a4
{
  if (a4) {
    (*((void (**)(id, uint64_t))a4 + 2))(a4, 1);
  }
}

- (void)fetchDeviceTypesForAllLanguages:(id)a3
{
  if (a3) {
    (*((void (**)(id, void, void))a3 + 2))(a3, 0, 0);
  }
}

- (void)fetchDeviceTypesForLanguage:(id)a3 completion:(id)a4
{
  if (a4) {
    (*((void (**)(id, void))a4 + 2))(a4, 0);
  }
}

- (void)deleteUserData:(id)a3
{
  v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    v5 = "-[ADCloudKitKeyValueMirroredStore deleteUserData:]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }
}

- (void)mergeDataWithModifiedRecords:(id)a3 deletedRecordIDs:(id)a4 containsAllChanges:(BOOL)a5 completion:(id)a6
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void))a6;
  v11 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v12 = 136315138;
    v13 = "-[ADCloudKitKeyValueMirroredStore mergeDataWithModifiedRecords:deletedRecordIDs:containsAllChanges:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s No merging on mirrored container.", (uint8_t *)&v12, 0xCu);
  }
  if (v10) {
    v10[2](v10, 0);
  }
}

- (void)synchronizeKeychainPreferencesWithCompletion:(id)a3
{
  int v4 = (void (**)(id, uint64_t))a3;
  v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v33 = "-[ADCloudKitKeyValueMirroredStore synchronizeKeychainPreferencesWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  v6 = objc_opt_new();
  sub_10028AD98();
  v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  modificationDateCache = self->_modificationDateCache;
  self->_modificationDateCache = v7;

  sub_10028AC94();
  id v9 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  localKeychainPreferenceCache = self->_localKeychainPreferenceCache;
  self->_localKeychainPreferenceCache = v9;

  v11 = sub_10028A958();
  if ([v11 containsObject:@"User Identifier"])
  {
    int v12 = +[ADPreferences sharedPreferences];
    v13 = [v12 sharedUserIdentifier];

    v14 = [(NSMutableDictionary *)self->_localKeychainPreferenceCache objectForKey:@"User Identifier"];
    unsigned __int8 v15 = [v13 isEqual:v14];

    if ((v15 & 1) == 0)
    {
      if (v13)
      {
        [(NSMutableDictionary *)self->_localKeychainPreferenceCache setObject:v13 forKey:@"User Identifier"];
        [v6 setObject:v13 forKey:@"User Identifier"];
      }
      else
      {
        v16 = +[NSNull null];
        [v6 setObject:v16 forKey:@"User Identifier"];
      }
      v17 = self->_modificationDateCache;
      v18 = +[NSDate date];
      [(NSMutableDictionary *)v17 setObject:v18 forKey:@"User Identifier"];
    }
  }
  if ([v11 containsObject:@"Logging User Identifier"])
  {
    v19 = +[ADPreferences sharedPreferences];
    v20 = [v19 loggingSharedUserIdentifier];

    v21 = [(NSMutableDictionary *)self->_localKeychainPreferenceCache objectForKey:@"Logging User Identifier"];
    unsigned __int8 v22 = [v20 isEqual:v21];

    if ((v22 & 1) == 0)
    {
      if (v20)
      {
        [(NSMutableDictionary *)self->_localKeychainPreferenceCache setObject:v20 forKey:@"Logging User Identifier"];
        [v6 setObject:v20 forKey:@"Logging User Identifier"];
      }
      else
      {
        v23 = +[NSNull null];
        [v6 setObject:v23 forKey:@"Logging User Identifier"];
      }
      v24 = self->_modificationDateCache;
      v25 = +[NSDate date];
      [(NSMutableDictionary *)v24 setObject:v25 forKey:@"Logging User Identifier"];
    }
  }
  if ([v6 count])
  {
    v26 = [v6 allKeys];
    v27 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v33 = "-[ADCloudKitKeyValueMirroredStore synchronizeKeychainPreferencesWithCompletion:]";
      __int16 v34 = 2112;
      v35 = v26;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "%s Saving keys: %@", buf, 0x16u);
    }
    v28 = +[ADCloudKitManager sharedManager];
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_10017EDF4;
    v30[3] = &unk_10050D700;
    id v31 = v26;
    id v29 = v26;
    [v28 saveKeyValueRecordsWithDictionary:v6 mirror:1 completion:v30];
  }
  if (v4) {
    v4[2](v4, 1);
  }
}

- (void)synchronizeWithCompletion:(id)a3
{
  v3 = (void (**)(id, uint64_t))a3;
  int v4 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v113 = "-[ADCloudKitKeyValueMirroredStore synchronizeWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  AFBackedUpPreferencesSynchronize();
  v5 = sub_10028AA54();
  v6 = objc_opt_new();
  long long v107 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v107 objects:v118 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v108;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v108 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v107 + 1) + 8 * i);
        v13 = [v7 objectForKey:v12];
        if (v13)
        {
          [v6 setObject:v13 forKey:v12];
        }
        else
        {
          v14 = +[NSNull null];
          [v6 setObject:v14 forKey:v12];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v107 objects:v118 count:16];
    }
    while (v9);
  }

  if ([v6 count])
  {
    v104 = v3;
    uint64_t v15 = kAFSessionLanguage;
    uint64_t v16 = [v6 objectForKey:kAFSessionLanguage];

    uint64_t v17 = kAFOutputVoice;
    uint64_t v18 = [v6 objectForKey:kAFOutputVoice];
    uint64_t v19 = v16 | v18;

    if (!v19) {
      goto LABEL_155;
    }
    v20 = [v6 objectForKey:v15];
    v21 = sub_100288C4C(v20);
    v102 = [v6 objectForKey:v17];
    unsigned __int8 v22 = sub_100288BA4(v102, v21);
    v101 = v22;
    if (!v22)
    {
      id v31 = AFSiriLogContextDaemon;
      v32 = v102;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v113 = "-[ADCloudKitKeyValueMirroredStore synchronizeWithCompletion:]";
        __int16 v114 = 2112;
        v115 = v20;
        __int16 v116 = 2112;
        id v117 = v102;
        _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%s Not synching language (%@) and output voice(%@) due to mismatch", buf, 0x20u);
      }
      v111[0] = v15;
      v111[1] = v17;
      v24 = +[NSArray arrayWithObjects:v111 count:2];
      [v6 removeObjectsForKeys:v24];
      goto LABEL_154;
    }
    v23 = v20;
    v24 = sub_100288D1C(v22);
    uint64_t v25 = [v24 dictionaryRepresentation];
    v26 = @"Output Voice v12";
    v103 = (void *)v25;
    [v6 setObject:v25 forKey:@"Output Voice v12"];

    if (sub_100288E0C(v24, v21))
    {
      if (v16)
      {
        v20 = v23;
        v27 = sub_100289D58(v21);
        v28 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315650;
          v113 = "-[ADCloudKitKeyValueMirroredStore synchronizeWithCompletion:]";
          __int16 v114 = 2112;
          v115 = v21;
          __int16 v116 = 2112;
          id v117 = v27;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "%s Synching default voice for version 1 sync clients (%@) : %@", buf, 0x20u);
        }
        id v29 = [v27 dictionaryRepresentation];
        [v6 setObject:v29 forKey:v17];

        v30 = v103;
        if ((sub_100289B80(v24, v21) & 1) == 0) {
          goto LABEL_40;
        }
LABEL_29:
        __int16 v34 = sub_100289D58(v21);
        v35 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315650;
          v113 = "-[ADCloudKitKeyValueMirroredStore synchronizeWithCompletion:]";
          __int16 v114 = 2112;
          v115 = v21;
          __int16 v116 = 2112;
          id v117 = v34;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "%s Synching default voice for version 2 sync clients (%@) : %@", buf, 0x20u);
        }
        v36 = [v34 dictionaryRepresentation];
        [v6 setObject:v36 forKey:@"Output Voice v2"];

        v30 = v103;
        if (sub_100289C80(v24, v21))
        {
LABEL_44:
          v40 = sub_100289D58(v21);
          v41 = AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315650;
            v113 = "-[ADCloudKitKeyValueMirroredStore synchronizeWithCompletion:]";
            __int16 v114 = 2112;
            v115 = v21;
            __int16 v116 = 2112;
            id v117 = v40;
            _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "%s Synching default voice for version 3 sync clients (%@) : %@", buf, 0x20u);
          }
          v42 = [v40 dictionaryRepresentation];
          [v6 setObject:v42 forKey:@"Output Voice v3"];

          v30 = v103;
          if ((sub_10028906C(v24, v21) & 1) == 0) {
            goto LABEL_63;
          }
LABEL_52:
          v44 = sub_100289D58(v21);
          v45 = AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315650;
            v113 = "-[ADCloudKitKeyValueMirroredStore synchronizeWithCompletion:]";
            __int16 v114 = 2112;
            v115 = v21;
            __int16 v116 = 2112;
            id v117 = v44;
            _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "%s Synching default voice for version 4 sync clients (%@) : %@", buf, 0x20u);
          }
          v46 = [v44 dictionaryRepresentation];
          [v6 setObject:v46 forKey:@"Output Voice v4"];

          v30 = v103;
          if (sub_1002891F0(v24, v21))
          {
LABEL_67:
            v50 = sub_100289E38(v21);
            v51 = AFSiriLogContextDaemon;
            if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315650;
              v113 = "-[ADCloudKitKeyValueMirroredStore synchronizeWithCompletion:]";
              __int16 v114 = 2112;
              v115 = v21;
              __int16 v116 = 2112;
              id v117 = v50;
              _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_INFO, "%s Synching default voice for version 5 sync clients (%@) : %@", buf, 0x20u);
            }
            v52 = [v50 dictionaryRepresentation];
            [v6 setObject:v52 forKey:@"Output Voice v5"];

            v30 = v103;
            if ((sub_100289280(v24, v21) & 1) == 0) {
              goto LABEL_86;
            }
LABEL_75:
            v54 = sub_100289E38(v21);
            v55 = AFSiriLogContextDaemon;
            if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315650;
              v113 = "-[ADCloudKitKeyValueMirroredStore synchronizeWithCompletion:]";
              __int16 v114 = 2112;
              v115 = v21;
              __int16 v116 = 2112;
              id v117 = v54;
              _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_INFO, "%s Synching default voice for version 6 sync clients (%@) : %@", buf, 0x20u);
            }
            v56 = [v54 dictionaryRepresentation];
            [v6 setObject:v56 forKey:@"Output Voice v6"];

            v30 = v103;
            if (sub_100289510(v24, v21))
            {
LABEL_90:
              v60 = sub_100289F8C(v21);
              v61 = AFSiriLogContextDaemon;
              if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315650;
                v113 = "-[ADCloudKitKeyValueMirroredStore synchronizeWithCompletion:]";
                __int16 v114 = 2112;
                v115 = v21;
                __int16 v116 = 2112;
                id v117 = v60;
                _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_INFO, "%s Synching default voice for version 7 sync clients (%@) : %@", buf, 0x20u);
              }
              v62 = [v60 dictionaryRepresentation];
              [v6 setObject:v62 forKey:@"Output Voice v7"];

              v30 = v103;
              if ((sub_1002895A0(v24, v21) & 1) == 0) {
                goto LABEL_109;
              }
LABEL_98:
              v64 = sub_10028A0E4(v21);
              v65 = AFSiriLogContextDaemon;
              if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315650;
                v113 = "-[ADCloudKitKeyValueMirroredStore synchronizeWithCompletion:]";
                __int16 v114 = 2112;
                v115 = v21;
                __int16 v116 = 2112;
                id v117 = v64;
                _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_INFO, "%s Synching default voice for version 8 sync clients (%@) : %@", buf, 0x20u);
              }
              v66 = [v64 dictionaryRepresentation];
              [v6 setObject:v66 forKey:@"Output Voice v8"];

              v30 = v103;
              if (sub_10028966C(v24, v21))
              {
LABEL_113:
                v70 = sub_10028A274(v21);
                v71 = AFSiriLogContextDaemon;
                if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 136315650;
                  v113 = "-[ADCloudKitKeyValueMirroredStore synchronizeWithCompletion:]";
                  __int16 v114 = 2112;
                  v115 = v21;
                  __int16 v116 = 2112;
                  id v117 = v70;
                  _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_INFO, "%s Synching default voice for version 9 sync clients (%@) : %@", buf, 0x20u);
                }
                v72 = [v70 dictionaryRepresentation];
                [v6 setObject:v72 forKey:@"Output Voice v9"];

                v30 = v103;
                if ((sub_100289930(v24, v21) & 1) == 0) {
                  goto LABEL_132;
                }
LABEL_121:
                v74 = sub_10028A464(v21);
                v75 = AFSiriLogContextDaemon;
                if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 136315650;
                  v113 = "-[ADCloudKitKeyValueMirroredStore synchronizeWithCompletion:]";
                  __int16 v114 = 2112;
                  v115 = v21;
                  __int16 v116 = 2112;
                  id v117 = v74;
                  _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_INFO, "%s Synching default voice for version 10 sync clients (%@) : %@", buf, 0x20u);
                }
                v76 = [v74 dictionaryRepresentation];
                [v6 setObject:v76 forKey:@"Output Voice v10"];

                v30 = v103;
                if (sub_1002899C0(v24, v21)) {
                  goto LABEL_136;
                }
                goto LABEL_146;
              }
              goto LABEL_117;
            }
            goto LABEL_94;
          }
          goto LABEL_71;
        }
        goto LABEL_48;
      }
      v37 = AFSiriLogContextDaemon;
      v20 = v23;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v113 = "-[ADCloudKitKeyValueMirroredStore synchronizeWithCompletion:]";
        __int16 v114 = 2112;
        v115 = v21;
        __int16 v116 = 2112;
        id v117 = v24;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "%s Skipping sync of version 1 voice for language (%@) : %@", buf, 0x20u);
      }
      [v6 removeObjectForKey:v17];
      v30 = v103;
      if (sub_100289B80(v24, v21))
      {
LABEL_36:
        v38 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315650;
          v113 = "-[ADCloudKitKeyValueMirroredStore synchronizeWithCompletion:]";
          __int16 v114 = 2112;
          v115 = v21;
          __int16 v116 = 2112;
          id v117 = v24;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "%s Skipping sync of version 2 voice for language (%@) : %@", buf, 0x20u);
        }
        [v6 removeObjectForKey:@"Output Voice v2"];
        if (sub_100289C80(v24, v21)) {
          goto LABEL_56;
        }
        goto LABEL_48;
      }
    }
    else
    {
      v33 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v113 = "-[ADCloudKitKeyValueMirroredStore synchronizeWithCompletion:]";
        __int16 v114 = 2112;
        v115 = v21;
        __int16 v116 = 2112;
        id v117 = v24;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "%s Synching voice for version 1 sync clients as well (%@) : %@", buf, 0x20u);
      }
      v30 = (void *)v25;
      [v6 setObject:v25 forKey:v17];
      v20 = v23;
      if (sub_100289B80(v24, v21))
      {
        if (v16) {
          goto LABEL_29;
        }
        goto LABEL_36;
      }
    }
LABEL_40:
    v39 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v113 = "-[ADCloudKitKeyValueMirroredStore synchronizeWithCompletion:]";
      __int16 v114 = 2112;
      v115 = v21;
      __int16 v116 = 2112;
      id v117 = v24;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "%s Synching voice for version 2 sync clients as well (%@) : %@", buf, 0x20u);
    }
    [v6 setObject:v30 forKey:@"Output Voice v2"];
    if (sub_100289C80(v24, v21))
    {
      if (v16) {
        goto LABEL_44;
      }
LABEL_56:
      v47 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v113 = "-[ADCloudKitKeyValueMirroredStore synchronizeWithCompletion:]";
        __int16 v114 = 2112;
        v115 = v21;
        __int16 v116 = 2112;
        id v117 = v24;
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_INFO, "%s Skipping sync of version 3 voice for language (%@) : %@", buf, 0x20u);
      }
      [v6 removeObjectForKey:@"Output Voice v3"];
      if (sub_10028906C(v24, v21)) {
        goto LABEL_59;
      }
      goto LABEL_63;
    }
LABEL_48:
    v43 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v113 = "-[ADCloudKitKeyValueMirroredStore synchronizeWithCompletion:]";
      __int16 v114 = 2112;
      v115 = v21;
      __int16 v116 = 2112;
      id v117 = v24;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "%s Synching voice for version 3 sync clients as well (%@) : %@", buf, 0x20u);
    }
    [v6 setObject:v30 forKey:@"Output Voice v3"];
    if (sub_10028906C(v24, v21))
    {
      if (v16) {
        goto LABEL_52;
      }
LABEL_59:
      v48 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v113 = "-[ADCloudKitKeyValueMirroredStore synchronizeWithCompletion:]";
        __int16 v114 = 2112;
        v115 = v21;
        __int16 v116 = 2112;
        id v117 = v24;
        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_INFO, "%s Skipping sync of version 4 voice for language (%@) : %@", buf, 0x20u);
      }
      [v6 removeObjectForKey:@"Output Voice v4"];
      if (sub_1002891F0(v24, v21)) {
        goto LABEL_79;
      }
      goto LABEL_71;
    }
LABEL_63:
    v49 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v113 = "-[ADCloudKitKeyValueMirroredStore synchronizeWithCompletion:]";
      __int16 v114 = 2112;
      v115 = v21;
      __int16 v116 = 2112;
      id v117 = v24;
      _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_INFO, "%s Synching voice for version 4 sync clients as well (%@) : %@", buf, 0x20u);
    }
    [v6 setObject:v30 forKey:@"Output Voice v4"];
    if (sub_1002891F0(v24, v21))
    {
      if (v16) {
        goto LABEL_67;
      }
LABEL_79:
      v57 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v113 = "-[ADCloudKitKeyValueMirroredStore synchronizeWithCompletion:]";
        __int16 v114 = 2112;
        v115 = v21;
        __int16 v116 = 2112;
        id v117 = v24;
        _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_INFO, "%s Skipping sync of version 5 voice for language (%@) : %@", buf, 0x20u);
      }
      [v6 removeObjectForKey:@"Output Voice v5"];
      if (sub_100289280(v24, v21)) {
        goto LABEL_82;
      }
      goto LABEL_86;
    }
LABEL_71:
    v53 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v113 = "-[ADCloudKitKeyValueMirroredStore synchronizeWithCompletion:]";
      __int16 v114 = 2112;
      v115 = v21;
      __int16 v116 = 2112;
      id v117 = v24;
      _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_INFO, "%s Synching voice for version 5 sync clients as well (%@) : %@", buf, 0x20u);
    }
    [v6 setObject:v30 forKey:@"Output Voice v5"];
    if (sub_100289280(v24, v21))
    {
      if (v16) {
        goto LABEL_75;
      }
LABEL_82:
      v58 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v113 = "-[ADCloudKitKeyValueMirroredStore synchronizeWithCompletion:]";
        __int16 v114 = 2112;
        v115 = v21;
        __int16 v116 = 2112;
        id v117 = v24;
        _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_INFO, "%s Skipping sync of version 6 voice for language (%@) : %@", buf, 0x20u);
      }
      [v6 removeObjectForKey:@"Output Voice v6"];
      if (sub_100289510(v24, v21)) {
        goto LABEL_102;
      }
      goto LABEL_94;
    }
LABEL_86:
    v59 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v113 = "-[ADCloudKitKeyValueMirroredStore synchronizeWithCompletion:]";
      __int16 v114 = 2112;
      v115 = v21;
      __int16 v116 = 2112;
      id v117 = v24;
      _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_INFO, "%s Synching voice for version 6 sync clients as well (%@) : %@", buf, 0x20u);
    }
    [v6 setObject:v30 forKey:@"Output Voice v6"];
    if (sub_100289510(v24, v21))
    {
      if (v16) {
        goto LABEL_90;
      }
LABEL_102:
      v67 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v113 = "-[ADCloudKitKeyValueMirroredStore synchronizeWithCompletion:]";
        __int16 v114 = 2112;
        v115 = v21;
        __int16 v116 = 2112;
        id v117 = v24;
        _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_INFO, "%s Skipping sync of version 7 voice for language (%@) : %@", buf, 0x20u);
      }
      [v6 removeObjectForKey:@"Output Voice v7"];
      if (sub_1002895A0(v24, v21)) {
        goto LABEL_105;
      }
      goto LABEL_109;
    }
LABEL_94:
    v63 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v113 = "-[ADCloudKitKeyValueMirroredStore synchronizeWithCompletion:]";
      __int16 v114 = 2112;
      v115 = v21;
      __int16 v116 = 2112;
      id v117 = v24;
      _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_INFO, "%s Synching voice for version 7 sync clients as well (%@) : %@", buf, 0x20u);
    }
    [v6 setObject:v30 forKey:@"Output Voice v7"];
    if (sub_1002895A0(v24, v21))
    {
      if (v16) {
        goto LABEL_98;
      }
LABEL_105:
      v68 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v113 = "-[ADCloudKitKeyValueMirroredStore synchronizeWithCompletion:]";
        __int16 v114 = 2112;
        v115 = v21;
        __int16 v116 = 2112;
        id v117 = v24;
        _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_INFO, "%s Skipping sync of version 8 voice for language (%@) : %@", buf, 0x20u);
      }
      [v6 removeObjectForKey:@"Output Voice v8"];
      if (sub_10028966C(v24, v21)) {
        goto LABEL_125;
      }
      goto LABEL_117;
    }
LABEL_109:
    v69 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v113 = "-[ADCloudKitKeyValueMirroredStore synchronizeWithCompletion:]";
      __int16 v114 = 2112;
      v115 = v21;
      __int16 v116 = 2112;
      id v117 = v24;
      _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_INFO, "%s Synching voice for version 8 sync clients as well (%@) : %@", buf, 0x20u);
    }
    [v6 setObject:v30 forKey:@"Output Voice v8"];
    if (sub_10028966C(v24, v21))
    {
      if (v16) {
        goto LABEL_113;
      }
LABEL_125:
      v77 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v113 = "-[ADCloudKitKeyValueMirroredStore synchronizeWithCompletion:]";
        __int16 v114 = 2112;
        v115 = v21;
        __int16 v116 = 2112;
        id v117 = v24;
        _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_INFO, "%s Skipping sync of version 9 voice for language (%@) : %@", buf, 0x20u);
      }
      [v6 removeObjectForKey:@"Output Voice v9"];
      if (sub_100289930(v24, v21)) {
        goto LABEL_128;
      }
      goto LABEL_132;
    }
LABEL_117:
    v73 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v113 = "-[ADCloudKitKeyValueMirroredStore synchronizeWithCompletion:]";
      __int16 v114 = 2112;
      v115 = v21;
      __int16 v116 = 2112;
      id v117 = v24;
      _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_INFO, "%s Synching voice for version 9 sync clients as well (%@) : %@", buf, 0x20u);
    }
    [v6 setObject:v30 forKey:@"Output Voice v9"];
    if (sub_100289930(v24, v21))
    {
      if (v16) {
        goto LABEL_121;
      }
LABEL_128:
      v78 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v113 = "-[ADCloudKitKeyValueMirroredStore synchronizeWithCompletion:]";
        __int16 v114 = 2112;
        v115 = v21;
        __int16 v116 = 2112;
        id v117 = v24;
        _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_INFO, "%s Skipping sync of version 10 voice for language (%@) : %@", buf, 0x20u);
      }
      [v6 removeObjectForKey:@"Output Voice v10"];
      if (sub_1002899C0(v24, v21))
      {
LABEL_149:
        v94 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315650;
          v113 = "-[ADCloudKitKeyValueMirroredStore synchronizeWithCompletion:]";
          __int16 v114 = 2112;
          v115 = v21;
          __int16 v116 = 2112;
          id v117 = v24;
          _os_log_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_INFO, "%s Skipping sync of version 11 voice for language (%@) : %@", buf, 0x20u);
        }
        [v6 removeObjectForKey:@"Output Voice v11"];
LABEL_152:
        v32 = v102;
LABEL_153:

LABEL_154:
LABEL_155:
        v3 = v104;
        if ([v6 count])
        {
          v95 = [v6 allKeys];
          v96 = AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            v113 = "-[ADCloudKitKeyValueMirroredStore synchronizeWithCompletion:]";
            __int16 v114 = 2112;
            v115 = v95;
            _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_INFO, "%s Saving keys: %@", buf, 0x16u);
          }
          v97 = +[ADCloudKitManager sharedManager];
          v105[0] = _NSConcreteStackBlock;
          v105[1] = 3221225472;
          v105[2] = sub_100180874;
          v105[3] = &unk_10050D700;
          id v106 = v95;
          id v98 = v95;
          [v97 saveKeyValueRecordsWithDictionary:v6 mirror:1 completion:v105];
        }
        goto LABEL_159;
      }
LABEL_146:
      v93 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v113 = "-[ADCloudKitKeyValueMirroredStore synchronizeWithCompletion:]";
        __int16 v114 = 2112;
        v115 = v21;
        __int16 v116 = 2112;
        id v117 = v24;
        _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_INFO, "%s Synching voice for version 11 sync clients as well (%@) : %@", buf, 0x20u);
      }
      [v6 setObject:v30 forKey:@"Output Voice v11"];
      goto LABEL_152;
    }
LABEL_132:
    v79 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v113 = "-[ADCloudKitKeyValueMirroredStore synchronizeWithCompletion:]";
      __int16 v114 = 2112;
      v115 = v21;
      __int16 v116 = 2112;
      id v117 = v24;
      _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_INFO, "%s Synching voice for version 10 sync clients as well (%@) : %@", buf, 0x20u);
    }
    [v6 setObject:v30 forKey:@"Output Voice v10"];
    if (sub_1002899C0(v24, v21))
    {
      if (v16)
      {
LABEL_136:
        v100 = v20;
        v80 = sub_10028A464(v21);
        uint64_t v81 = (uint64_t)[v80 gender];
        unsigned int v99 = [v80 isCustom];
        v82 = +[AFLocalization sharedInstance];
        v83 = [v80 languageCode];
        v84 = [v82 voiceNamesForOutputLanguageCode:v83 gender:v81];
        v85 = [v84 firstObject];

        v86 = [v80 languageCode];
        LODWORD(v83) = [v86 isEqualToString:@"zh-CN"];

        if (v83)
        {

          BOOL v87 = v81 == 1;
          if (v81 == 1) {
            uint64_t v81 = 1;
          }
          else {
            uint64_t v81 = 2;
          }
          if (v87) {
            v85 = @"li-mu";
          }
          else {
            v85 = @"linfei";
          }
        }
        id v88 = objc_alloc((Class)AFVoiceInfo);
        v89 = [v80 languageCode];
        id v90 = [v88 initWithLanguageCode:v89 gender:v81 isCustom:v99 name:v85 footprint:0 contentVersion:0 masteredVersion:0];

        v91 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315650;
          v113 = "-[ADCloudKitKeyValueMirroredStore synchronizeWithCompletion:]";
          __int16 v114 = 2112;
          v115 = v21;
          __int16 v116 = 2112;
          id v117 = v90;
          _os_log_impl((void *)&_mh_execute_header, v91, OS_LOG_TYPE_INFO, "%s Synching default voice for version 11 sync clients (%@) : %@", buf, 0x20u);
        }
        v92 = [v90 dictionaryRepresentation];
        [v6 setObject:v92 forKey:@"Output Voice v11"];

        v20 = v100;
        v32 = v102;
        v30 = v103;
        goto LABEL_153;
      }
      goto LABEL_149;
    }
    goto LABEL_146;
  }
LABEL_159:
  if (v3) {
    v3[2](v3, 1);
  }
}

- (CKServerChangeToken)serverChangeToken
{
  return 0;
}

- (BOOL)hasSetUpRecordZoneSubscription
{
  return 0;
}

- (ADCloudKitKeyValueMirroredStore)init
{
  v6.receiver = self;
  v6.super_class = (Class)ADCloudKitKeyValueMirroredStore;
  v2 = [(ADCloudKitKeyValueMirroredStore *)&v6 init];
  if (v2)
  {
    CFStringRef v7 = @"AssistantKeyValueRecord";
    uint64_t v3 = +[NSArray arrayWithObjects:&v7 count:1];
    supportedRecordTypes = v2->_supportedRecordTypes;
    v2->_supportedRecordTypes = (NSArray *)v3;
  }
  return v2;
}

@end