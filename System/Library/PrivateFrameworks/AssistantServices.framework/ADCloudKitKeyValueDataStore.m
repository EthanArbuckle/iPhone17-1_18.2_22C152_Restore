@interface ADCloudKitKeyValueDataStore
- (ADCloudKitKeyValueDataStore)init;
- (BOOL)dataStoreIsOnSharedDatabase;
- (BOOL)dataStoreShouldMirrorData;
- (BOOL)hasMergedAllRecords;
- (BOOL)hasSetUpRecordZoneSubscription;
- (BOOL)isMirroredDataStore;
- (CKRecordZone)zone;
- (CKServerChangeToken)serverChangeToken;
- (NSArray)supportedRecordTypes;
- (NSMutableDictionary)localKeychainPreferenceCache;
- (NSMutableDictionary)localPreferenceCache;
- (NSMutableDictionary)modificationDateCache;
- (void)_mergeDataWithModifiedRecords:(id)a3 deletedRecordIDs:(id)a4 containsAllChanges:(BOOL)a5 completion:(id)a6;
- (void)deleteUserData:(id)a3;
- (void)fetchDeviceTypesForAllLanguages:(id)a3;
- (void)fetchDeviceTypesForLanguage:(id)a3 completion:(id)a4;
- (void)mergeDataWithModifiedRecords:(id)a3 deletedRecordIDs:(id)a4 containsAllChanges:(BOOL)a5 completion:(id)a6;
- (void)setDataStoreIsOnSharedDatabase:(BOOL)a3;
- (void)setDataStoreShouldMirrorData:(BOOL)a3;
- (void)setHasMergedAllRecords:(BOOL)a3;
- (void)setHasSetUpRecordZoneSubscription:(BOOL)a3;
- (void)setIsMirroredDataStore:(BOOL)a3;
- (void)setLocalKeychainPreferenceCache:(id)a3;
- (void)setLocalPreferenceCache:(id)a3;
- (void)setModificationDateCache:(id)a3;
- (void)setServerChangeToken:(id)a3;
- (void)setSupportedRecordTypes:(id)a3;
- (void)setZone:(id)a3;
- (void)synchronizeKeychainPreferencesWithCompletion:(id)a3;
- (void)synchronizeUsingActivity:(id)a3 completion:(id)a4;
- (void)synchronizeWithCompletion:(id)a3;
@end

@implementation ADCloudKitKeyValueDataStore

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modificationDateCache, 0);
  objc_storeStrong((id *)&self->_localKeychainPreferenceCache, 0);
  objc_storeStrong((id *)&self->_localPreferenceCache, 0);
  objc_storeStrong((id *)&self->_supportedRecordTypes, 0);
  objc_storeStrong((id *)&self->_zone, 0);
}

- (void)setHasMergedAllRecords:(BOOL)a3
{
  self->_hasMergedAllRecords = a3;
}

- (BOOL)hasMergedAllRecords
{
  return self->_hasMergedAllRecords;
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
  id v4 = a3;
  v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v12 = 136315138;
    v13 = "-[ADCloudKitKeyValueDataStore deleteUserData:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v12, 0xCu);
  }
  [(ADCloudKitKeyValueDataStore *)self setServerChangeToken:0];
  sub_10028A740(0, kAFModificationDates);
  AFBackedUpPreferencesSynchronize();
  sub_10028AD98();
  v6 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  modificationDateCache = self->_modificationDateCache;
  self->_modificationDateCache = v6;

  v8 = [(NSMutableDictionary *)self->_localKeychainPreferenceCache objectForKey:@"User Identifier"];
  if (v8)
  {

LABEL_6:
    v10 = +[ADCloudKitManager sharedManager];
    [v10 ignoreNextNotification:@"ADPreferencesSharedUserIdentifierDidChangeNotification"];

    v11 = +[ADPreferences sharedPreferences];
    [v11 setSharedUserIdentifier:0 loggingSharedUserIdentifier:0];

    [(NSMutableDictionary *)self->_localKeychainPreferenceCache removeObjectForKey:@"User Identifier"];
    [(NSMutableDictionary *)self->_localKeychainPreferenceCache removeObjectForKey:@"Logging User Identifier"];
    goto LABEL_7;
  }
  v9 = [(NSMutableDictionary *)self->_localKeychainPreferenceCache objectForKey:@"Logging User Identifier"];

  if (v9) {
    goto LABEL_6;
  }
LABEL_7:
}

- (void)_mergeDataWithModifiedRecords:(id)a3 deletedRecordIDs:(id)a4 containsAllChanges:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v167 = a6;
  int v12 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = [v10 count];
    id v14 = [v11 count];
    CFStringRef v15 = @"partial";
    *(_DWORD *)buf = 136315906;
    v227 = "-[ADCloudKitKeyValueDataStore _mergeDataWithModifiedRecords:deletedRecordIDs:containsAllChanges:completion:]";
    if (v7) {
      CFStringRef v15 = @"full";
    }
    __int16 v228 = 2048;
    v229 = v13;
    __int16 v230 = 2048;
    id v231 = v14;
    __int16 v232 = 2112;
    CFStringRef v233 = v15;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s Merging %zd modified records, %zd deleted records, %@ sync", buf, 0x2Au);
  }

  os_log_t log = (os_log_t)objc_opt_new();
  v176 = objc_opt_new();
  v16 = sub_10028A958();
  BOOL hasMergedAllRecords = self->_hasMergedAllRecords;
  BOOL v169 = v7;
  v168 = v11;
  if (v7)
  {
    v17 = [(NSMutableDictionary *)self->_localPreferenceCache allKeys];
    if (v17)
    {
      id v18 = +[NSMutableSet setWithArray:v17];
    }
    else
    {
      id v18 = 0;
    }
    [v18 addObject:@"User Identifier"];
    [v18 addObject:@"Logging User Identifier"];
    v19 = [(NSMutableDictionary *)self->_modificationDateCache allKeys];

    if (v19)
    {
      id v191 = +[NSMutableSet setWithArray:v19];
    }
    else
    {
      id v191 = 0;
    }
    v187 = v18;
    self->_BOOL hasMergedAllRecords = 1;
  }
  else
  {
    id v191 = 0;
    v187 = 0;
  }
  v177 = +[ADPreferences sharedPreferences];
  unsigned __int8 v20 = [v177 isUsingDefaultLanguageSettings];
  long long v213 = 0u;
  long long v214 = 0u;
  long long v215 = 0u;
  long long v216 = 0u;
  id obj = v10;
  id v21 = [obj countByEnumeratingWithState:&v213 objects:v225 count:16];
  v174 = v16;
  if (v21)
  {
    id v22 = v21;
    char v184 = 0;
    char v170 = 0;
    v175 = 0;
    uint64_t v23 = *(void *)v214;
    char v172 = v20 ^ 1;
    v180 = 0;
    id v181 = (id)kAFOutputVoice;
    uint64_t v178 = kAFSessionLanguage;
    while (1)
    {
      v24 = 0;
      do
      {
        if (*(void *)v214 != v23) {
          objc_enumerationMutation(obj);
        }
        v25 = *(NSObject **)(*((void *)&v213 + 1) + 8 * (void)v24);
        v26 = [v25 recordType];
        v27 = [(NSArray *)self->_supportedRecordTypes firstObject];
        unsigned __int8 v28 = [v26 isEqualToString:v27];

        if (v28)
        {
          v29 = [v25 recordID];
          v30 = [v29 recordName];

          id v31 = [v30 length];
          v32 = AFSiriLogContextDaemon;
          BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_INFO);
          if (!v31)
          {
            if (v33)
            {
              *(_DWORD *)buf = 136315394;
              v227 = "-[ADCloudKitKeyValueDataStore _mergeDataWithModifiedRecords:deletedRecordIDs:containsAllChanges:completion:]";
              __int16 v228 = 2112;
              v229 = v25;
              v37 = v32;
              v38 = "%s Modified record is lacking a name : (%@)";
              goto LABEL_37;
            }
LABEL_38:
            v35 = v30;
            goto LABEL_39;
          }
          if (v33)
          {
            *(_DWORD *)buf = 136315394;
            v227 = "-[ADCloudKitKeyValueDataStore _mergeDataWithModifiedRecords:deletedRecordIDs:containsAllChanges:completion:]";
            __int16 v228 = 2112;
            v229 = v30;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "%s Merging record : (%@)", buf, 0x16u);
          }

          if ([v30 isEqualToString:v181])
          {
            v34 = AFSiriLogContextDaemon;
            if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315394;
              v227 = "-[ADCloudKitKeyValueDataStore _mergeDataWithModifiedRecords:deletedRecordIDs:containsAllChanges:completion:]";
              __int16 v228 = 2112;
              v229 = v30;
              _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "%s Ignoring changes to previous version : (%@)", buf, 0x16u);
            }

            v32 = v180;
            v35 = v30;
            v180 = v25;
            goto LABEL_39;
          }
          if ([v30 isEqualToString:@"Output Voice v2"])
          {
            v32 = AFSiriLogContextDaemon;
            if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
            {
LABEL_36:
              *(_DWORD *)buf = 136315394;
              v227 = "-[ADCloudKitKeyValueDataStore _mergeDataWithModifiedRecords:deletedRecordIDs:containsAllChanges:completion:]";
              __int16 v228 = 2112;
              v229 = v30;
              v37 = v32;
              v38 = "%s Ignoring changes to previous version : (%@)";
LABEL_37:
              _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, v38, buf, 0x16u);
            }
            goto LABEL_38;
          }
          if ([v30 isEqualToString:@"Output Voice v3"])
          {
            v32 = AFSiriLogContextDaemon;
            if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO)) {
              goto LABEL_36;
            }
            goto LABEL_38;
          }
          if ([v30 isEqualToString:v178])
          {
            v39 = v25;

            v175 = v39;
          }
          v35 = sub_10028A904(v30);

          if (([v16 containsObject:v35] & 1) == 0)
          {
            v32 = AFSiriLogContextDaemon;
            if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315394;
              v227 = "-[ADCloudKitKeyValueDataStore _mergeDataWithModifiedRecords:deletedRecordIDs:containsAllChanges:completion:]";
              __int16 v228 = 2112;
              v229 = v35;
              _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "%s Ignoring non-whitelisted key : (%@)", buf, 0x16u);
            }
            goto LABEL_39;
          }
          [v187 removeObject:v35];
          [v191 removeObject:v35];
          v224[0] = objc_opt_class();
          v224[1] = objc_opt_class();
          v224[2] = objc_opt_class();
          v224[3] = objc_opt_class();
          v224[4] = objc_opt_class();
          v40 = +[NSArray arrayWithObjects:v224 count:5];
          v41 = +[NSSet setWithArray:v40];
          v32 = [v25 _ad_dataOfClasses:v41];

          v42 = [(NSMutableDictionary *)self->_modificationDateCache objectForKey:v35];
          if (v42) {
            char v43 = v172;
          }
          else {
            char v43 = 1;
          }
          if (!hasMergedAllRecords
            && (v43 & 1) == 0
            && (([v35 isEqualToString:v181] & 1) != 0
             || [v35 isEqualToString:v178]))
          {
            v44 = AFSiriLogContextDaemon;
            if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315394;
              v227 = "-[ADCloudKitKeyValueDataStore _mergeDataWithModifiedRecords:deletedRecordIDs:containsAllChanges:completion:]";
              __int16 v228 = 2112;
              v229 = v35;
              _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "%s Adjusting weight of record : (%@)", buf, 0x16u);
            }

            uint64_t v45 = +[NSDate distantPast];

            v42 = (void *)v45;
          }
          if (([v35 isEqualToString:@"User Identifier"] & 1) != 0
            || [v35 isEqualToString:@"Logging User Identifier"])
          {
            v46 = [(NSMutableDictionary *)self->_localKeychainPreferenceCache objectForKey:v35];
            if (v42)
            {
              v47 = [v25 modificationDate];

              if (v47)
              {
                v48 = [v25 modificationDate];
                v171 = v42;
                id v49 = [v48 compare:v42];

                if (v49 == (id)1)
                {
                  if (v32 != v46 && ([v32 isEqual:v46] & 1) == 0)
                  {
                    localKeychainPreferenceCache = self->_localKeychainPreferenceCache;
                    if (v32) {
                      [(NSMutableDictionary *)localKeychainPreferenceCache setObject:v32 forKey:v35];
                    }
                    else {
                      [(NSMutableDictionary *)localKeychainPreferenceCache removeObjectForKey:v35];
                    }
                    char v170 = 1;
                  }
                  goto LABEL_105;
                }
                if (v32 != v46)
                {
                  v52 = v46;
                  unsigned __int8 v58 = [v32 isEqual:v46];
                  goto LABEL_97;
                }
LABEL_100:
                v52 = v32;
LABEL_106:
                v42 = v171;
                goto LABEL_107;
              }
              if (v32 != v46)
              {
                v52 = v46;
                unsigned __int8 v57 = [v32 isEqual:v46];
                goto LABEL_91;
              }
LABEL_94:
              v52 = v32;
              goto LABEL_107;
            }
            v51 = AFSiriLogContextDaemon;
            if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315394;
              v227 = "-[ADCloudKitKeyValueDataStore _mergeDataWithModifiedRecords:deletedRecordIDs:containsAllChanges:completion:]";
              __int16 v228 = 2112;
              v229 = v35;
              _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_INFO, "%s Record is missing a modification date : (%@)", buf, 0x16u);
            }

            if (v32 == v46) {
              goto LABEL_94;
            }
            v52 = v46;
            if ([v32 isEqual:v46]) {
              goto LABEL_107;
            }
            v53 = self->_localKeychainPreferenceCache;
            if (v32) {
              [(NSMutableDictionary *)v53 setObject:v32 forKey:v35];
            }
            else {
              [(NSMutableDictionary *)v53 removeObjectForKey:v35];
            }
            modificationDateCache = self->_modificationDateCache;
            v62 = [v25 modificationDate];
            [(NSMutableDictionary *)modificationDateCache setObject:v62 forKey:v35];

            char v184 = 1;
            char v170 = 1;
LABEL_111:
            v42 = 0;
            v52 = v46;
            v16 = v174;
LABEL_108:

LABEL_39:
            goto LABEL_40;
          }
          v46 = [(NSMutableDictionary *)self->_localPreferenceCache objectForKey:v35];
          if (!v42)
          {
            v59 = AFSiriLogContextDaemon;
            if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315394;
              v227 = "-[ADCloudKitKeyValueDataStore _mergeDataWithModifiedRecords:deletedRecordIDs:containsAllChanges:completion:]";
              __int16 v228 = 2112;
              v229 = v35;
              _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_INFO, "%s Record is missing a local modification date : (%@)", buf, 0x16u);
            }

            if (v32 == v46) {
              goto LABEL_94;
            }
            v52 = v46;
            if (sub_10028A5B8(v32, v46, v35)) {
              goto LABEL_107;
            }
            if (v32)
            {
              [v176 setObject:v32 forKey:v35];
            }
            else
            {
              v66 = +[NSNull null];
              [v176 setObject:v66 forKey:v35];
            }
            v67 = self->_modificationDateCache;
            v68 = [v25 modificationDate];
            [(NSMutableDictionary *)v67 setObject:v68 forKey:v35];

            char v184 = 1;
            goto LABEL_111;
          }
          v54 = [v25 modificationDate];

          if (v54)
          {
            v55 = [v25 modificationDate];
            v171 = v42;
            id v56 = [v55 compare:v42];

            if (v56 == (id)1)
            {
              if (v32 != v46 && (sub_10028A5B8(v32, v46, v35) & 1) == 0)
              {
                if (v32)
                {
                  [v176 setObject:v32 forKey:v35];
                }
                else
                {
                  v69 = +[NSNull null];
                  [v176 setObject:v69 forKey:v35];
                }
              }
LABEL_105:
              v63 = self->_modificationDateCache;
              v64 = [v25 modificationDate];
              v65 = v63;
              v52 = v46;
              [(NSMutableDictionary *)v65 setObject:v64 forKey:v35];

              char v184 = 1;
              goto LABEL_106;
            }
            if (v32 == v46) {
              goto LABEL_100;
            }
            v52 = v46;
            unsigned __int8 v58 = sub_10028A5B8(v32, v46, v35);
LABEL_97:
            v42 = v171;
            if (v58)
            {
LABEL_107:
              v16 = v174;
              goto LABEL_108;
            }
            v16 = v174;
            if (!v52) {
              goto LABEL_99;
            }
          }
          else
          {
            if (v32 == v46) {
              goto LABEL_94;
            }
            v52 = v46;
            unsigned __int8 v57 = sub_10028A5B8(v32, v46, v35);
LABEL_91:
            v16 = v174;
            if (v57) {
              goto LABEL_108;
            }
            if (!v52)
            {
LABEL_99:
              v60 = +[NSNull null];
              [log setObject:v60 forKey:v35];

              v52 = 0;
              goto LABEL_108;
            }
          }
          [log setObject:v52 forKey:v35];
          goto LABEL_108;
        }
        v35 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          v36 = [v25 recordType];
          *(_DWORD *)buf = 136315394;
          v227 = "-[ADCloudKitKeyValueDataStore _mergeDataWithModifiedRecords:deletedRecordIDs:containsAllChanges:completion:]";
          __int16 v228 = 2112;
          v229 = v36;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "%s Unsupported record type : (%@)", buf, 0x16u);
        }
LABEL_40:

        v24 = (char *)v24 + 1;
      }
      while (v22 != v24);
      id v70 = [obj countByEnumeratingWithState:&v213 objects:v225 count:16];
      id v22 = v70;
      if (!v70) {
        goto LABEL_116;
      }
    }
  }
  char v184 = 0;
  char v170 = 0;
  v180 = 0;
  v175 = 0;
LABEL_116:

  if ([v168 count])
  {
    id v188 = +[NSDate date];
  }
  else
  {
    id v188 = 0;
  }
  os_log_t v71 = log;
  long long v211 = 0u;
  long long v212 = 0u;
  long long v209 = 0u;
  long long v210 = 0u;
  id v182 = v168;
  id v72 = [v182 countByEnumeratingWithState:&v209 objects:v223 count:16];
  if (v72)
  {
    id v73 = v72;
    uint64_t v74 = *(void *)v210;
    do
    {
      v75 = 0;
      do
      {
        if (*(void *)v210 != v74) {
          objc_enumerationMutation(v182);
        }
        v76 = *(NSObject **)(*((void *)&v209 + 1) + 8 * (void)v75);
        v77 = [v76 recordName];
        if ([v77 length])
        {
          [v187 removeObject:v77];
          [v191 removeObject:v77];
          if (([v77 isEqualToString:@"User Identifier"] & 1) != 0
            || [v77 isEqualToString:@"Logging User Identifier"])
          {
            [(NSMutableDictionary *)self->_localKeychainPreferenceCache removeObjectForKey:v77];
LABEL_128:
            [(NSMutableDictionary *)self->_modificationDateCache setObject:v188 forKey:v77];
            char v184 = 1;
            goto LABEL_132;
          }
          v79 = [(NSMutableDictionary *)self->_localPreferenceCache objectForKey:v77];

          if (v79)
          {
            v80 = +[NSNull null];
            [v176 setObject:v80 forKey:v77];

            goto LABEL_128;
          }
        }
        else
        {
          v78 = AFSiriLogContextDaemon;
          if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            v227 = "-[ADCloudKitKeyValueDataStore _mergeDataWithModifiedRecords:deletedRecordIDs:containsAllChanges:completion:]";
            __int16 v228 = 2112;
            v229 = v76;
            _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_INFO, "%s Deleted record ID is lacking a name : (%@)", buf, 0x16u);
          }

          os_log_t v71 = log;
        }
LABEL_132:

        v75 = (char *)v75 + 1;
      }
      while (v73 != v75);
      id v81 = [v182 countByEnumeratingWithState:&v209 objects:v223 count:16];
      id v73 = v81;
    }
    while (v81);
  }

  v82 = v174;
  if (v170)
  {
    v83 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(v83, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v227 = "-[ADCloudKitKeyValueDataStore _mergeDataWithModifiedRecords:deletedRecordIDs:containsAllChanges:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_INFO, "%s Saving sharedUserIdentifier...", buf, 0xCu);
    }

    v84 = [(NSMutableDictionary *)self->_localKeychainPreferenceCache objectForKey:@"User Identifier"];
    v85 = [(NSMutableDictionary *)self->_localKeychainPreferenceCache objectForKey:@"Logging User Identifier"];
    v86 = +[ADCloudKitManager sharedManager];
    [v86 ignoreNextNotification:@"ADPreferencesSharedUserIdentifierDidChangeNotification"];

    [v177 setSharedUserIdentifier:v84 loggingSharedUserIdentifier:v85];
  }
  if (v169)
  {
    long long v207 = 0u;
    long long v208 = 0u;
    long long v205 = 0u;
    long long v206 = 0u;
    id v87 = v187;
    id v88 = [v87 countByEnumeratingWithState:&v205 objects:v222 count:16];
    v89 = v177;
    if (!v88) {
      goto LABEL_157;
    }
    id v90 = v88;
    uint64_t v91 = *(void *)v206;
    while (1)
    {
      for (i = 0; i != v90; i = (char *)i + 1)
      {
        if (*(void *)v206 != v91) {
          objc_enumerationMutation(v87);
        }
        v93 = *(void **)(*((void *)&v205 + 1) + 8 * i);
        if ([v93 isEqualToString:@"User Identifier"])
        {
          uint64_t v94 = [v89 sharedUserIdentifier];
        }
        else
        {
          if (![v93 isEqualToString:@"Logging User Identifier"])
          {
            v95 = [(NSMutableDictionary *)self->_localPreferenceCache objectForKey:v93];
            goto LABEL_154;
          }
          uint64_t v94 = [v89 loggingSharedUserIdentifier];
        }
        v95 = (void *)v94;
        if (!v94)
        {
          v96 = +[NSNull null];
          [log setObject:v96 forKey:v93];

          v89 = v177;
          goto LABEL_155;
        }
LABEL_154:
        [log setObject:v95 forKey:v93];
LABEL_155:

        [v191 removeObject:v93];
      }
      id v90 = [v87 countByEnumeratingWithState:&v205 objects:v222 count:16];
      if (!v90)
      {
LABEL_157:

        long long v203 = 0u;
        long long v204 = 0u;
        long long v201 = 0u;
        long long v202 = 0u;
        id v97 = v191;
        id v98 = [v97 countByEnumeratingWithState:&v201 objects:v221 count:16];
        os_log_t v71 = log;
        if (v98)
        {
          id v99 = v98;
          uint64_t v100 = *(void *)v202;
          do
          {
            for (j = 0; j != v99; j = (char *)j + 1)
            {
              if (*(void *)v202 != v100) {
                objc_enumerationMutation(v97);
              }
              uint64_t v102 = *(void *)(*((void *)&v201 + 1) + 8 * (void)j);
              v103 = +[NSNull null];
              [log setObject:v103 forKey:v102];
            }
            id v99 = [v97 countByEnumeratingWithState:&v201 objects:v221 count:16];
          }
          while (v99);
        }

        v82 = v174;
        break;
      }
    }
  }
  v104 = v177;
  if (v184)
  {
    sub_10028A740(self->_modificationDateCache, kAFModificationDates);
    if (![v176 count])
    {
      AFBackedUpPreferencesSynchronize();
      goto LABEL_204;
    }
  }
  else if (![v176 count])
  {
    goto LABEL_204;
  }
  v105 = kAFSessionLanguage;
  v106 = [v176 objectForKey:kAFSessionLanguage];
  v185 = v106;
  if (!v106) {
    goto LABEL_180;
  }
  id v107 = v106;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v108 = v107;
  }
  else {
    v108 = 0;
  }
  id v109 = v108;
  if ((AFPreferencesLanguageIsSupported() & 1) == 0)
  {

LABEL_177:
    v110 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v227 = "-[ADCloudKitKeyValueDataStore _mergeDataWithModifiedRecords:deletedRecordIDs:containsAllChanges:completion:]";
      __int16 v228 = 2112;
      v229 = v105;
      __int16 v230 = 2112;
      id v231 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v110, OS_LOG_TYPE_ERROR, "%s Unsupported value set for key (%@) : %@", buf, 0x20u);
    }

    [v176 removeObjectForKey:v105];
LABEL_180:
    id v109 = 0;
    goto LABEL_181;
  }

  if (!v109) {
    goto LABEL_177;
  }
LABEL_181:
  uint64_t v111 = kAFOutputVoice;
  uint64_t v112 = [v176 objectForKey:kAFOutputVoice];
  v179 = (void *)v112;
  if (v112)
  {
    v113 = (void *)v112;
    if (v109)
    {
      v114 = v109;
    }
    else
    {
      v116 = [(NSMutableDictionary *)self->_localPreferenceCache objectForKey:v105];
      sub_100288C4C(v116);
      v114 = (id)objc_claimAutoreleasedReturnValue();
    }
    sub_100288BA4(v113, v114);
    id v117 = (id)objc_claimAutoreleasedReturnValue();
    if (!v117)
    {
      v118 = AFOutputVoiceLanguageForRecognitionLanguage();
      id v117 = objc_msgSend(objc_alloc((Class)AFVoiceInfo), "initWithLanguageCode:gender:isCustom:", v118, +[AFVoiceInfo defaultGenderForOutputVoiceLanguageCode:](AFVoiceInfo, "defaultGenderForOutputVoiceLanguageCode:", v118), 1);
      v119 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(v119, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315906;
        v227 = "-[ADCloudKitKeyValueDataStore _mergeDataWithModifiedRecords:deletedRecordIDs:containsAllChanges:completion:]";
        __int16 v228 = 2112;
        v229 = v114;
        __int16 v230 = 2112;
        id v231 = v113;
        __int16 v232 = 2112;
        CFStringRef v233 = 0;
        _os_log_impl((void *)&_mh_execute_header, v119, OS_LOG_TYPE_INFO, "%s Falling back to default output voice for language (%@) : %@ -> %@", buf, 0x2Au);
      }
    }
    v115 = sub_100288D1C(v117);
    v120 = [v115 dictionaryRepresentation];
    [v176 setObject:v120 forKey:v111];

    if (v109 && v115)
    {
      v121 = +[ADCommandCenter sharedCommandCenter];
      [v121 setQueuedLanguageCode:v109 andQueuedOutputVoice:v115];

      [(NSMutableDictionary *)self->_localPreferenceCache setObject:v109 forKey:v105];
      localPreferenceCache = self->_localPreferenceCache;
      v123 = [v115 dictionaryRepresentation];
      [(NSMutableDictionary *)localPreferenceCache setObject:v123 forKey:v111];

      [v176 removeObjectForKey:v105];
      [v176 removeObjectForKey:v111];
      v124 = +[AFAnalytics sharedAnalytics];
      [v124 logEventWithType:3201 context:&off_100523EC8];
      [v124 logEventWithType:3202 context:&off_100523EF0];
    }
  }
  else
  {
    v115 = 0;
  }
  long long v199 = 0u;
  long long v200 = 0u;
  long long v197 = 0u;
  long long v198 = 0u;
  id v125 = v176;
  id v126 = [v125 countByEnumeratingWithState:&v197 objects:v220 count:16];
  if (v126)
  {
    id v127 = v126;
    uint64_t v128 = *(void *)v198;
    do
    {
      for (k = 0; k != v127; k = (char *)k + 1)
      {
        if (*(void *)v198 != v128) {
          objc_enumerationMutation(v125);
        }
        v130 = *(void **)(*((void *)&v197 + 1) + 8 * (void)k);
        v131 = [v125 objectForKey:v130];
        v132 = +[NSNull null];

        if (v131 == v132)
        {

          [(NSMutableDictionary *)self->_localPreferenceCache removeObjectForKey:v130];
          v131 = 0;
        }
        else
        {
          [(NSMutableDictionary *)self->_localPreferenceCache setObject:v131 forKey:v130];
        }
        sub_10028A740(v131, v130);
      }
      id v127 = [v125 countByEnumeratingWithState:&v197 objects:v220 count:16];
    }
    while (v127);
  }

  v133 = +[ADCloudKitManager sharedManager];
  [v133 ignoreNextNotification:kAFPreferencesDidChangeDarwinNotification];

  v134 = +[AFPreferences sharedPreferences];
  [v134 synchronize];

  os_log_t v71 = log;
  v82 = v174;
  v104 = v177;
LABEL_204:
  if (v180)
  {
    v135 = [v71 objectForKey:kAFSessionLanguage];
    if (!v135)
    {
      uint64_t v219 = objc_opt_class();
      v136 = +[NSArray arrayWithObjects:&v219 count:1];
      v137 = +[NSSet setWithArray:v136];
      v135 = [v175 _ad_dataOfClasses:v137];

      v104 = v177;
    }
    v138 = sub_100288C4C(v135);
    if (v138)
    {
      v218[0] = objc_opt_class();
      v218[1] = objc_opt_class();
      v218[2] = objc_opt_class();
      v139 = +[NSArray arrayWithObjects:v218 count:3];
      v140 = +[NSSet setWithArray:v139];
      v141 = [v180 _ad_dataOfClasses:v140];

      v142 = sub_100288CA4(v141);
      v143 = v142;
      if (v142 && sub_100288E0C(v142, v138))
      {
        v144 = sub_100289D58(v138);
      }
      else
      {
        v144 = 0;
      }

      v104 = v177;
    }
    else
    {
      v144 = 0;
    }
  }
  else
  {
    v144 = 0;
  }
  if (![v71 count] && !v144) {
    goto LABEL_231;
  }
  uint64_t v145 = kAFSessionLanguage;
  uint64_t v146 = [v71 objectForKey:kAFSessionLanguage];

  uint64_t v147 = kAFOutputVoice;
  uint64_t v148 = [v71 objectForKey:kAFOutputVoice];
  uint64_t v149 = v146 | v148;

  if (v149)
  {
    v150 = [(NSMutableDictionary *)self->_localPreferenceCache objectForKey:v145];
    v151 = sub_100288C4C(v150);
    v152 = [(NSMutableDictionary *)self->_localPreferenceCache objectForKey:v147];
    v153 = sub_100288BA4(v152, v151);
    if (v153)
    {
      [v71 setObject:v150 forKey:v145];
      v154 = sub_100288D1C(v153);
      [v154 dictionaryRepresentation];
      v186 = v153;
      v155 = v150;
      v156 = v152;
      v157 = v82;
      v159 = v158 = v151;
      v160 = @"Output Voice v12";
      [log setObject:v159 forKey:@"Output Voice v12"];

      os_log_t v71 = log;
      v151 = v158;
      v82 = v157;
      v152 = v156;
      v150 = v155;
      v153 = v186;
      [log removeObjectForKey:v147];
    }
    else
    {
      loga = AFSiriLogContextDaemon;
      if (os_log_type_enabled(loga, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v227 = "-[ADCloudKitKeyValueDataStore _mergeDataWithModifiedRecords:deletedRecordIDs:containsAllChanges:completion:]";
        __int16 v228 = 2112;
        v229 = v150;
        __int16 v230 = 2112;
        id v231 = v152;
        _os_log_error_impl((void *)&_mh_execute_header, loga, OS_LOG_TYPE_ERROR, "%s Not synching language (%@) and output voice(%@) due to mismatch", buf, 0x20u);
      }

      v217[0] = v145;
      v217[1] = v147;
      v154 = +[NSArray arrayWithObjects:v217 count:2];
      [v71 removeObjectsForKeys:v154];
    }
  }
  if (v144)
  {
    v161 = [v144 dictionaryRepresentation];
    [v71 setObject:v161 forKey:v147];
  }
  v104 = v177;
  if ([v71 count])
  {
    v162 = [v71 allKeys];
    v163 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(v163, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v227 = "-[ADCloudKitKeyValueDataStore _mergeDataWithModifiedRecords:deletedRecordIDs:containsAllChanges:completion:]";
      __int16 v228 = 2112;
      v229 = v162;
      _os_log_impl((void *)&_mh_execute_header, v163, OS_LOG_TYPE_INFO, "%s Saving keys: %@", buf, 0x16u);
    }

    v164 = +[ADCloudKitManager sharedManager];
    v192[0] = _NSConcreteStackBlock;
    v192[1] = 3221225472;
    v192[2] = sub_100304B8C;
    v192[3] = &unk_10050BBE8;
    v165 = v162;
    v193 = v165;
    v194 = self;
    v195 = v71;
    id v196 = v167;
    v166 = v167;
    [v164 saveKeyValueRecordsWithDictionary:v195 mirror:0 completion:v192];

    v104 = v177;
  }
  else
  {
LABEL_231:
    v166 = v167;
    if (v167) {
      (*((void (**)(id, void))v167 + 2))(v167, 0);
    }
  }
}

- (void)mergeDataWithModifiedRecords:(id)a3 deletedRecordIDs:(id)a4 containsAllChanges:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v14 = 136315138;
    CFStringRef v15 = "-[ADCloudKitKeyValueDataStore mergeDataWithModifiedRecords:deletedRecordIDs:containsAllChanges:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v14, 0xCu);
  }
  [(ADCloudKitKeyValueDataStore *)self _mergeDataWithModifiedRecords:v10 deletedRecordIDs:v11 containsAllChanges:v7 completion:v12];
}

- (void)synchronizeKeychainPreferencesWithCompletion:(id)a3
{
  id v4 = (void (**)(id, uint64_t))a3;
  v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    BOOL v33 = "-[ADCloudKitKeyValueDataStore synchronizeKeychainPreferencesWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  v6 = objc_opt_new();
  sub_10028AD98();
  BOOL v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  modificationDateCache = self->_modificationDateCache;
  self->_modificationDateCache = v7;

  v9 = sub_10028A958();
  if ([v9 containsObject:@"User Identifier"])
  {
    id v10 = +[ADPreferences sharedPreferences];
    id v11 = [v10 sharedUserIdentifier];

    id v12 = [(NSMutableDictionary *)self->_localKeychainPreferenceCache objectForKey:@"User Identifier"];
    unsigned __int8 v13 = [v11 isEqual:v12];

    if ((v13 & 1) == 0)
    {
      if (v11)
      {
        [(NSMutableDictionary *)self->_localKeychainPreferenceCache setObject:v11 forKey:@"User Identifier"];
        [v6 setObject:v11 forKey:@"User Identifier"];
      }
      else
      {
        [(NSMutableDictionary *)self->_localPreferenceCache removeObjectForKey:@"User Identifier"];
        int v14 = +[NSNull null];
        [v6 setObject:v14 forKey:@"User Identifier"];
      }
      CFStringRef v15 = self->_modificationDateCache;
      v16 = +[NSDate date];
      [(NSMutableDictionary *)v15 setObject:v16 forKey:@"User Identifier"];
    }
  }
  if ([v9 containsObject:@"Logging User Identifier"])
  {
    v17 = +[ADPreferences sharedPreferences];
    id v18 = [v17 loggingSharedUserIdentifier];

    v19 = [(NSMutableDictionary *)self->_localKeychainPreferenceCache objectForKey:@"Logging User Identifier"];
    unsigned __int8 v20 = [v18 isEqual:v19];

    if ((v20 & 1) == 0)
    {
      if (v18)
      {
        [(NSMutableDictionary *)self->_localKeychainPreferenceCache setObject:v18 forKey:@"Logging User Identifier"];
        [v6 setObject:v18 forKey:@"Logging User Identifier"];
      }
      else
      {
        [(NSMutableDictionary *)self->_localPreferenceCache removeObjectForKey:@"Logging User Identifier"];
        id v21 = +[NSNull null];
        [v6 setObject:v21 forKey:@"Logging User Identifier"];
      }
      id v22 = self->_modificationDateCache;
      uint64_t v23 = +[NSDate date];
      [(NSMutableDictionary *)v22 setObject:v23 forKey:@"Logging User Identifier"];
    }
  }
  if ([v6 count])
  {
    sub_10028A740(self->_modificationDateCache, kAFModificationDates);
    AFBackedUpPreferencesSynchronize();
    v24 = [v6 allKeys];
    v25 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      BOOL v33 = "-[ADCloudKitKeyValueDataStore synchronizeKeychainPreferencesWithCompletion:]";
      __int16 v34 = 2112;
      v35 = v24;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "%s Saving keys: %@", buf, 0x16u);
    }
    v26 = +[ADCloudKitManager sharedManager];
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100305408;
    v28[3] = &unk_10050BBC0;
    id v29 = v24;
    v30 = self;
    id v31 = v6;
    id v27 = v24;
    [v26 saveKeyValueRecordsWithDictionary:v31 mirror:0 completion:v28];
  }
  if (v4) {
    v4[2](v4, 1);
  }
}

- (void)synchronizeWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v115 = "-[ADCloudKitKeyValueDataStore synchronizeWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  AFBackedUpPreferencesSynchronize();
  v6 = sub_10028AA54();
  sub_10028AD98();
  BOOL v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  modificationDateCache = self->_modificationDateCache;
  self->_modificationDateCache = v7;

  v95 = +[NSDate date];
  v96 = objc_opt_new();
  uint64_t v9 = [(NSMutableDictionary *)self->_localPreferenceCache allKeys];
  v93 = (void *)v9;
  if (v9)
  {
    id v10 = +[NSMutableSet setWithArray:v9];
  }
  else
  {
    id v10 = 0;
  }
  uint64_t v94 = (void (**)(void, void))v4;
  long long v111 = 0u;
  long long v112 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  id obj = v6;
  id v11 = [obj countByEnumeratingWithState:&v109 objects:v121 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v110;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v110 != v13) {
          objc_enumerationMutation(obj);
        }
        CFStringRef v15 = *(void **)(*((void *)&v109 + 1) + 8 * i);
        [v10 removeObject:v15];
        v16 = [obj objectForKey:v15];
        v17 = [(NSMutableDictionary *)self->_localPreferenceCache objectForKey:v15];
        unsigned __int8 v18 = sub_10028A5B8(v16, v17, v15);

        if ((v18 & 1) == 0)
        {
          localPreferenceCache = self->_localPreferenceCache;
          if (v16)
          {
            [(NSMutableDictionary *)localPreferenceCache setObject:v16 forKey:v15];
            [v96 setObject:v16 forKey:v15];
          }
          else
          {
            [(NSMutableDictionary *)localPreferenceCache removeObjectForKey:v15];
            unsigned __int8 v20 = +[NSNull null];
            [v96 setObject:v20 forKey:v15];
          }
          [(NSMutableDictionary *)self->_modificationDateCache setObject:v95 forKey:v15];
        }
      }
      id v12 = [obj countByEnumeratingWithState:&v109 objects:v121 count:16];
    }
    while (v12);
  }

  long long v107 = 0u;
  long long v108 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  id v21 = v10;
  id v22 = [v21 countByEnumeratingWithState:&v105 objects:v120 count:16];
  uint64_t v23 = v96;
  if (v22)
  {
    id v24 = v22;
    uint64_t v25 = *(void *)v106;
    do
    {
      for (j = 0; j != v24; j = (char *)j + 1)
      {
        if (*(void *)v106 != v25) {
          objc_enumerationMutation(v21);
        }
        uint64_t v27 = *(void *)(*((void *)&v105 + 1) + 8 * (void)j);
        unsigned __int8 v28 = +[NSNull null];
        [v96 setObject:v28 forKey:v27];
      }
      id v24 = [v21 countByEnumeratingWithState:&v105 objects:v120 count:16];
    }
    while (v24);
  }

  if (![v96 count]) {
    goto LABEL_115;
  }
  uint64_t v29 = kAFSessionLanguage;
  uint64_t v30 = [v96 objectForKey:kAFSessionLanguage];

  uint64_t v31 = kAFOutputVoice;
  uint64_t v32 = [v96 objectForKey:kAFOutputVoice];

  if (self->_hasMergedAllRecords
    || !(v30 | v32)
    || (+[ADPreferences sharedPreferences],
        BOOL v33 = objc_claimAutoreleasedReturnValue(),
        unsigned int v34 = [v33 isUsingDefaultLanguageSettings],
        v33,
        !v34))
  {
    if (v30)
    {
      if (v32)
      {
        int v92 = 1;
        goto LABEL_46;
      }
      v35 = [(NSMutableDictionary *)self->_localPreferenceCache objectForKey:v31];
      if (v35)
      {
        [v96 setObject:v35 forKey:v31];
      }
      else
      {
        v36 = +[NSNull null];
        [v96 setObject:v36 forKey:v31];
      }
      int v92 = 1;
      uint64_t v37 = v31;
    }
    else
    {
      if (!v32) {
        goto LABEL_109;
      }
      v35 = [(NSMutableDictionary *)self->_localPreferenceCache objectForKey:v29];
      if (v35)
      {
        [v96 setObject:v35 forKey:v29];
      }
      else
      {
        v38 = +[NSNull null];
        [v96 setObject:v38 forKey:v29];
      }
      int v92 = 0;
      uint64_t v37 = v29;
    }
    [(NSMutableDictionary *)self->_modificationDateCache setObject:v95 forKey:v37];

LABEL_46:
    v39 = [v96 objectForKey:v29];
    v40 = sub_100288C4C(v39);
    v41 = [v96 objectForKey:v31];
    v42 = sub_100288BA4(v41, v40);
    char v43 = v42;
    if (!v42)
    {
      v53 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v115 = "-[ADCloudKitKeyValueDataStore synchronizeWithCompletion:]";
        __int16 v116 = 2112;
        id v117 = v39;
        __int16 v118 = 2112;
        v119 = v41;
        _os_log_error_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_ERROR, "%s Not synching language (%@) and output voice(%@) due to mismatch", buf, 0x20u);
      }
      v113[0] = v29;
      v113[1] = v31;
      uint64_t v45 = +[NSArray arrayWithObjects:v113 count:2];
      [v96 removeObjectsForKeys:v45];
      char v43 = 0;
      goto LABEL_108;
    }
    v89 = v39;
    uint64_t v91 = v41;
    uint64_t v44 = v31;
    uint64_t v45 = sub_100288D1C(v42);
    uint64_t v46 = [v45 dictionaryRepresentation];
    v47 = @"Output Voice v12";
    v48 = (void *)v46;
    [v96 setObject:v46 forKey:@"Output Voice v12"];

    if (sub_100288E0C(v45, v40))
    {
      if (v92)
      {
        id v49 = v43;
        v50 = sub_100289D58(v40);
        v51 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315650;
          v115 = "-[ADCloudKitKeyValueDataStore synchronizeWithCompletion:]";
          __int16 v116 = 2112;
          id v117 = v40;
          __int16 v118 = 2112;
          v119 = v50;
          _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_INFO, "%s Synching default voice for version 1 sync clients (%@) : %@", buf, 0x20u);
        }
        v52 = objc_msgSend(v50, "dictionaryRepresentation", v89);
        [v96 setObject:v52 forKey:v44];

        char v43 = v49;
        v48 = (void *)v46;
        if ((sub_100289B80(v45, v40) & 1) == 0) {
          goto LABEL_71;
        }
LABEL_60:
        v55 = sub_100289D58(v40);
        id v56 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315650;
          v115 = "-[ADCloudKitKeyValueDataStore synchronizeWithCompletion:]";
          __int16 v116 = 2112;
          id v117 = v40;
          __int16 v118 = 2112;
          v119 = v55;
          _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_INFO, "%s Synching default voice for version 2 sync clients (%@) : %@", buf, 0x20u);
        }
        unsigned __int8 v57 = [v55 dictionaryRepresentation];
        [v96 setObject:v57 forKey:@"Output Voice v2"];

        v39 = v90;
        v48 = (void *)v46;
        if (sub_100289C80(v45, v40))
        {
LABEL_75:
          v61 = v39;
          v62 = sub_100289D58(v40);
          v63 = AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315650;
            v115 = "-[ADCloudKitKeyValueDataStore synchronizeWithCompletion:]";
            __int16 v116 = 2112;
            id v117 = v40;
            __int16 v118 = 2112;
            v119 = v62;
            _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_INFO, "%s Synching default voice for version 3 sync clients (%@) : %@", buf, 0x20u);
          }
          v64 = [v62 dictionaryRepresentation];
          [v96 setObject:v64 forKey:@"Output Voice v3"];

          v39 = v61;
          v48 = (void *)v46;
          if ((sub_10028906C(v45, v40) & 1) == 0) {
            goto LABEL_94;
          }
LABEL_83:
          v66 = v39;
          v67 = sub_100289D58(v40);
          v68 = AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315650;
            v115 = "-[ADCloudKitKeyValueDataStore synchronizeWithCompletion:]";
            __int16 v116 = 2112;
            id v117 = v40;
            __int16 v118 = 2112;
            v119 = v67;
            _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_INFO, "%s Synching default voice for version 4 sync clients (%@) : %@", buf, 0x20u);
          }
          v69 = [v67 dictionaryRepresentation];
          [v96 setObject:v69 forKey:@"Output Voice v4"];

          v39 = v66;
          v48 = (void *)v46;
          if (sub_1002891F0(v45, v40)) {
            goto LABEL_98;
          }
          goto LABEL_101;
        }
        goto LABEL_79;
      }
      unsigned __int8 v58 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v115 = "-[ADCloudKitKeyValueDataStore synchronizeWithCompletion:]";
        __int16 v116 = 2112;
        id v117 = v40;
        __int16 v118 = 2112;
        v119 = v45;
        _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_INFO, "%s Skipping sync of version 1 voice for language (%@) : %@", buf, 0x20u);
      }
      objc_msgSend(v96, "removeObjectForKey:", v44, v89);
      if (sub_100289B80(v45, v40))
      {
LABEL_67:
        v59 = AFSiriLogContextDaemon;
        v39 = v90;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315650;
          v115 = "-[ADCloudKitKeyValueDataStore synchronizeWithCompletion:]";
          __int16 v116 = 2112;
          id v117 = v40;
          __int16 v118 = 2112;
          v119 = v45;
          _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_INFO, "%s Skipping sync of version 2 voice for language (%@) : %@", buf, 0x20u);
        }
        [v96 removeObjectForKey:@"Output Voice v2"];
        if (sub_100289C80(v45, v40)) {
          goto LABEL_87;
        }
        goto LABEL_79;
      }
    }
    else
    {
      v54 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v115 = "-[ADCloudKitKeyValueDataStore synchronizeWithCompletion:]";
        __int16 v116 = 2112;
        id v117 = v40;
        __int16 v118 = 2112;
        v119 = v45;
        _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_INFO, "%s Synching voice for version 1 sync clients as well (%@) : %@", buf, 0x20u);
      }
      objc_msgSend(v96, "setObject:forKey:", v46, v44, v89);
      if (sub_100289B80(v45, v40))
      {
        if (v92) {
          goto LABEL_60;
        }
        goto LABEL_67;
      }
    }
LABEL_71:
    v60 = AFSiriLogContextDaemon;
    v39 = v90;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v115 = "-[ADCloudKitKeyValueDataStore synchronizeWithCompletion:]";
      __int16 v116 = 2112;
      id v117 = v40;
      __int16 v118 = 2112;
      v119 = v45;
      _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_INFO, "%s Synching voice for version 2 sync clients as well (%@) : %@", buf, 0x20u);
    }
    [v96 setObject:v48 forKey:@"Output Voice v2"];
    if (sub_100289C80(v45, v40))
    {
      if (v92) {
        goto LABEL_75;
      }
LABEL_87:
      id v70 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v115 = "-[ADCloudKitKeyValueDataStore synchronizeWithCompletion:]";
        __int16 v116 = 2112;
        id v117 = v40;
        __int16 v118 = 2112;
        v119 = v45;
        _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_INFO, "%s Skipping sync of version 3 voice for language (%@) : %@", buf, 0x20u);
      }
      [v96 removeObjectForKey:@"Output Voice v3"];
      if (sub_10028906C(v45, v40)) {
        goto LABEL_90;
      }
      goto LABEL_94;
    }
LABEL_79:
    v65 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v115 = "-[ADCloudKitKeyValueDataStore synchronizeWithCompletion:]";
      __int16 v116 = 2112;
      id v117 = v40;
      __int16 v118 = 2112;
      v119 = v45;
      _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_INFO, "%s Synching voice for version 3 sync clients as well (%@) : %@", buf, 0x20u);
    }
    [v96 setObject:v48 forKey:@"Output Voice v3"];
    if (sub_10028906C(v45, v40))
    {
      if (v92) {
        goto LABEL_83;
      }
LABEL_90:
      os_log_t v71 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v115 = "-[ADCloudKitKeyValueDataStore synchronizeWithCompletion:]";
        __int16 v116 = 2112;
        id v117 = v40;
        __int16 v118 = 2112;
        v119 = v45;
        _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_INFO, "%s Skipping sync of version 4 voice for language (%@) : %@", buf, 0x20u);
      }
      [v96 removeObjectForKey:@"Output Voice v4"];
      if (sub_1002891F0(v45, v40)) {
        goto LABEL_104;
      }
      goto LABEL_101;
    }
LABEL_94:
    id v72 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v115 = "-[ADCloudKitKeyValueDataStore synchronizeWithCompletion:]";
      __int16 v116 = 2112;
      id v117 = v40;
      __int16 v118 = 2112;
      v119 = v45;
      _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_INFO, "%s Synching voice for version 4 sync clients as well (%@) : %@", buf, 0x20u);
    }
    [v96 setObject:v48 forKey:@"Output Voice v4"];
    if (sub_1002891F0(v45, v40))
    {
      if (v92)
      {
LABEL_98:
        id v73 = v43;
        uint64_t v74 = sub_100289E38(v40);
        v75 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315650;
          v115 = "-[ADCloudKitKeyValueDataStore synchronizeWithCompletion:]";
          __int16 v116 = 2112;
          id v117 = v40;
          __int16 v118 = 2112;
          v119 = v74;
          _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_INFO, "%s Synching default voice for version 5 sync clients (%@) : %@", buf, 0x20u);
        }
        v76 = [v74 dictionaryRepresentation];
        [v96 setObject:v76 forKey:@"Output Voice v5"];

        char v43 = v73;
        v48 = (void *)v46;
LABEL_107:

        v41 = v91;
LABEL_108:

        goto LABEL_109;
      }
LABEL_104:
      v78 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v115 = "-[ADCloudKitKeyValueDataStore synchronizeWithCompletion:]";
        __int16 v116 = 2112;
        id v117 = v40;
        __int16 v118 = 2112;
        v119 = v45;
        _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_INFO, "%s Skipping sync of version 5 voice for language (%@) : %@", buf, 0x20u);
      }
      [v96 removeObjectForKey:@"Output Voice v5"];
      goto LABEL_107;
    }
LABEL_101:
    v77 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v115 = "-[ADCloudKitKeyValueDataStore synchronizeWithCompletion:]";
      __int16 v116 = 2112;
      id v117 = v40;
      __int16 v118 = 2112;
      v119 = v45;
      _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_INFO, "%s Synching voice for version 5 sync clients as well (%@) : %@", buf, 0x20u);
    }
    [v96 setObject:v48 forKey:@"Output Voice v5"];
    goto LABEL_107;
  }
  if (v30) {
    [v96 removeObjectForKey:v29];
  }
  if (v32) {
    [v96 removeObjectForKey:v31];
  }
LABEL_109:
  sub_10028A740(self->_modificationDateCache, kAFModificationDates);
  AFBackedUpPreferencesSynchronize();
  uint64_t v23 = v96;
  if (self->_hasMergedAllRecords && [v96 count])
  {
    v79 = [v96 allKeys];
    v80 = AFSiriLogContextDaemon;
    id v81 = v94;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v115 = "-[ADCloudKitKeyValueDataStore synchronizeWithCompletion:]";
      __int16 v116 = 2112;
      id v117 = v79;
      _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_INFO, "%s Saving keys: %@", buf, 0x16u);
    }
    unsigned __int8 v82 = [(ADCloudKitKeyValueDataStore *)self isMirroredDataStore];
    v83 = +[ADCloudKitManager sharedManager];
    if (v82)
    {
      v98[0] = _NSConcreteStackBlock;
      v98[1] = 3221225472;
      v98[2] = sub_100306AAC;
      v98[3] = &unk_10050D750;
      v84 = &v99;
      id v99 = v79;
      v85 = (id *)&v100;
      uint64_t v100 = v94;
      id v86 = v79;
      [v83 saveKeyValueRecordsWithDictionary:v96 mirror:1 completion:v98];
    }
    else
    {
      v101[0] = _NSConcreteStackBlock;
      v101[1] = 3221225472;
      v101[2] = sub_100306880;
      v101[3] = &unk_10050BBE8;
      v84 = (id *)v102;
      v102[0] = v79;
      v85 = (id *)&v104;
      v104 = v94;
      v102[1] = self;
      id v87 = v96;
      id v103 = v87;
      id v88 = v79;
      [v83 saveKeyValueRecordsWithDictionary:v87 mirror:0 completion:v101];
    }
    goto LABEL_119;
  }
LABEL_115:
  id v81 = v94;
  if (v94) {
    v94[2](v94, 1);
  }
LABEL_119:
}

- (void)setServerChangeToken:(id)a3
{
  id v8 = a3;
  if (![(ADCloudKitKeyValueDataStore *)self isMirroredDataStore])
  {
    if (v8)
    {
      id v4 = objc_msgSend(v8, "ad_archiveTokenToDataWithExceptionBlock:", &stru_10050BB98);
      if (!v4) {
        goto LABEL_7;
      }
    }
    else
    {
      id v4 = 0;
    }
    v5 = +[ADPreferences sharedPreferences];
    [v5 setKeyValueServerChangeToken:v4];

    v6 = +[ADPreferences sharedPreferences];
    [v6 synchronize];

    BOOL v7 = +[NSNotificationCenter defaultCenter];
    [v7 postNotificationName:@"ADCloudKitManagerPreferencesDidSyncNotification" object:0];
  }
LABEL_7:
}

- (CKServerChangeToken)serverChangeToken
{
  if ([(ADCloudKitKeyValueDataStore *)self isMirroredDataStore])
  {
    v2 = 0;
  }
  else
  {
    v3 = +[ADPreferences sharedPreferences];
    id v4 = [v3 keyValueServerChangeToken];

    v2 = +[CKServerChangeToken ad_unarchiveTokenFromData:v4 withExceptionBlock:&stru_10050BB78];
  }
  return (CKServerChangeToken *)v2;
}

- (void)setHasSetUpRecordZoneSubscription:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[ADPreferences sharedPreferences];
  [v4 setHasSetUpKeyValueRecordZoneSubscription:v3];

  id v5 = +[ADPreferences sharedPreferences];
  [v5 synchronize];
}

- (BOOL)hasSetUpRecordZoneSubscription
{
  v2 = +[ADPreferences sharedPreferences];
  unsigned __int8 v3 = [v2 hasSetUpKeyValueRecordZoneSubscription];

  return v3;
}

- (ADCloudKitKeyValueDataStore)init
{
  v15.receiver = self;
  v15.super_class = (Class)ADCloudKitKeyValueDataStore;
  v2 = [(ADCloudKitKeyValueDataStore *)&v15 init];
  if (v2)
  {
    CFStringRef v16 = @"AssistantKeyValueRecord";
    uint64_t v3 = +[NSArray arrayWithObjects:&v16 count:1];
    supportedRecordTypes = v2->_supportedRecordTypes;
    v2->_supportedRecordTypes = (NSArray *)v3;

    AFBackedUpPreferencesSynchronize();
    uint64_t v5 = sub_10028AA54();
    localPreferenceCache = v2->_localPreferenceCache;
    v2->_localPreferenceCache = (NSMutableDictionary *)v5;

    uint64_t v7 = sub_10028AC94();
    localKeychainPreferenceCache = v2->_localKeychainPreferenceCache;
    v2->_localKeychainPreferenceCache = (NSMutableDictionary *)v7;

    uint64_t v9 = sub_10028AD98();
    modificationDateCache = v2->_modificationDateCache;
    v2->_modificationDateCache = (NSMutableDictionary *)v9;

    id v11 = +[AFPreferences sharedPreferences];
    id v12 = [(ADCloudKitKeyValueDataStore *)v2 serverChangeToken];
    v2->_BOOL hasMergedAllRecords = v12 != 0;

    uint64_t v13 = +[ADPreferences sharedPreferences];
    [v13 clearLegacyKeyValueServerChangeTokens];
  }
  return v2;
}

@end