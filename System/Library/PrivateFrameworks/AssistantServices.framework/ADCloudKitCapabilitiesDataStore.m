@interface ADCloudKitCapabilitiesDataStore
- (ADCloudKitCapabilitiesDataStore)initWithHelper:(id)a3;
- (BOOL)dataStoreIsOnSharedDatabase;
- (BOOL)dataStoreShouldMirrorData;
- (BOOL)hasSetUpRecordZoneSubscription;
- (BOOL)isMirroredDataStore;
- (CKRecordZone)zone;
- (CKServerChangeToken)serverChangeToken;
- (NSArray)supportedRecordTypes;
- (id)_addMissingColumnsForTable:(id)a3 withDescription:(id)a4 inDatabase:(id)a5;
- (id)_databasePath;
- (id)_fetchSQLiteRecordsOwnedByLocalDeviceFromTable:(id)a3;
- (id)_preparedDatabaseWithError:(id *)a3;
- (void)_deleteSQLiteRecordsWithCriterion:(id)a3 inTable:(id)a4;
- (void)_writeSQLiteRecords:(id)a3 toTable:(id)a4;
- (void)fetchDeviceTypesForAllLanguages:(id)a3;
- (void)fetchDeviceTypesForLanguage:(id)a3 completion:(id)a4;
- (void)mergeDataWithModifiedRecords:(id)a3 deletedRecordIDs:(id)a4 containsAllChanges:(BOOL)a5 completion:(id)a6;
- (void)setDataStoreIsOnSharedDatabase:(BOOL)a3;
- (void)setDataStoreShouldMirrorData:(BOOL)a3;
- (void)setHasSetUpRecordZoneSubscription:(BOOL)a3;
- (void)setIsMirroredDataStore:(BOOL)a3;
- (void)setServerChangeToken:(id)a3;
- (void)setZone:(id)a3;
- (void)synchronizeUsingActivity:(id)a3 completion:(id)a4;
- (void)synchronizeWithCompletion:(id)a3;
@end

@implementation ADCloudKitCapabilitiesDataStore

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->supportedRecordTypes, 0);
  objc_storeStrong((id *)&self->serverChangeToken, 0);
  objc_storeStrong((id *)&self->_zone, 0);
  objc_storeStrong((id *)&self->_helper, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

- (NSArray)supportedRecordTypes
{
  return self->supportedRecordTypes;
}

- (void)setServerChangeToken:(id)a3
{
}

- (CKServerChangeToken)serverChangeToken
{
  return self->serverChangeToken;
}

- (void)setHasSetUpRecordZoneSubscription:(BOOL)a3
{
  self->hasSetUpRecordZoneSubscription = a3;
}

- (BOOL)hasSetUpRecordZoneSubscription
{
  return self->hasSetUpRecordZoneSubscription;
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

- (void)fetchDeviceTypesForLanguage:(id)a3 completion:(id)a4
{
  if (a4) {
    (*((void (**)(id, void))a4 + 2))(a4, 0);
  }
}

- (void)fetchDeviceTypesForAllLanguages:(id)a3
{
  if (a3) {
    (*((void (**)(id, void, void))a3 + 2))(a3, 0, 0);
  }
}

- (void)mergeDataWithModifiedRecords:(id)a3 deletedRecordIDs:(id)a4 containsAllChanges:(BOOL)a5 completion:(id)a6
{
  v16 = (void (**)(id, void))a6;
  helper = self->_helper;
  id v10 = a4;
  id v11 = a3;
  v12 = [(_ADCloudKitCapabilitiesDataStoreHelper *)helper tableDescription];
  v13 = [v12 name];

  v14 = [(_ADCloudKitCapabilitiesDataStoreHelper *)self->_helper sqliteRecordsForCKRecords:v11];

  [(ADCloudKitCapabilitiesDataStore *)self _writeSQLiteRecords:v14 toTable:v13];
  v15 = [(_ADCloudKitCapabilitiesDataStoreHelper *)self->_helper deletionCriterionForCKRecordIDs:v10];

  [(ADCloudKitCapabilitiesDataStore *)self _deleteSQLiteRecordsWithCriterion:v15 inTable:v13];
  if (v16) {
    v16[2](v16, 0);
  }
}

- (void)synchronizeUsingActivity:(id)a3 completion:(id)a4
{
}

- (void)synchronizeWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  v6 = +[ADCloudKitManager sharedManager];
  v7 = [(_ADCloudKitCapabilitiesDataStoreHelper *)self->_helper recordZoneName];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001A29D4;
  v10[3] = &unk_10050D750;
  id v11 = v5;
  id v12 = v4;
  id v8 = v4;
  id v9 = v5;
  [v6 saveRecordsWithDictionary:v9 inZone:v7 completion:v10];
}

- (void)_deleteSQLiteRecordsWithCriterion:(id)a3 inTable:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v16 = 0;
  id v8 = [(ADCloudKitCapabilitiesDataStore *)self _preparedDatabaseWithError:&v16];
  id v9 = v16;
  id v10 = v9;
  if (v8)
  {
    id v15 = v9;
    unsigned __int8 v11 = [v8 deleteFromTableWithName:v7 indexedBy:0 criterion:v6 error:&v15];
    id v12 = v15;

    if ((v11 & 1) == 0)
    {
      v13 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v18 = "-[ADCloudKitCapabilitiesDataStore _deleteSQLiteRecordsWithCriterion:inTable:]";
        __int16 v19 = 2112;
        id v20 = v12;
        _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s Failed to delete database records due to error %@", buf, 0x16u);
      }
    }
    id v10 = v12;
  }
  else
  {
    v14 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[ADCloudKitCapabilitiesDataStore _deleteSQLiteRecordsWithCriterion:inTable:]";
      __int16 v19 = 2112;
      id v20 = v10;
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s Failed to prepare database: %@", buf, 0x16u);
    }
  }
}

- (void)_writeSQLiteRecords:(id)a3 toTable:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v42 = 0;
  id v8 = [(ADCloudKitCapabilitiesDataStore *)self _preparedDatabaseWithError:&v42];
  id v9 = v42;
  id v10 = v9;
  if (v8)
  {
    id v41 = v9;
    unsigned __int8 v11 = [v8 beginTransactionWithError:&v41];
    id v12 = v41;

    if (v11)
    {
      v31 = v12;
      id v13 = [v6 mutableCopy];
      if ([v13 count])
      {
        v32 = v13;
        do
        {
          if ((unint64_t)[v13 count] >= 0x11)
          {
            objc_msgSend(v13, "subarrayWithRange:", 0, 16);
            id v14 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "removeObjectsInRange:", 0, 16);
          }
          else
          {
            id v14 = [v13 copy];
            [v13 removeAllObjects];
          }
          long long v39 = 0u;
          long long v40 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          id v15 = v14;
          id v16 = [v15 countByEnumeratingWithState:&v37 objects:v51 count:16];
          if (v16)
          {
            id v17 = v16;
            uint64_t v18 = *(void *)v38;
            do
            {
              __int16 v19 = 0;
              do
              {
                if (*(void *)v38 != v18) {
                  objc_enumerationMutation(v15);
                }
                id v20 = *(void **)(*((void *)&v37 + 1) + 8 * (void)v19);
                id v36 = 0;
                unsigned __int8 v21 = [v8 insertIntoTableWithName:v7 record:v20 error:&v36];
                id v22 = v36;
                if ((v21 & 1) == 0)
                {
                  v23 = AFSiriLogContextAnalytics;
                  if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 136315906;
                    v44 = "-[ADCloudKitCapabilitiesDataStore _writeSQLiteRecords:toTable:]";
                    __int16 v45 = 2112;
                    id v46 = v20;
                    __int16 v47 = 2112;
                    id v48 = v7;
                    __int16 v49 = 2112;
                    id v50 = v22;
                    _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%s Failed to insert event record %@ into %@ table due to error %@", buf, 0x2Au);
                  }
                }

                __int16 v19 = (char *)v19 + 1;
              }
              while (v17 != v19);
              id v17 = [v15 countByEnumeratingWithState:&v37 objects:v51 count:16];
            }
            while (v17);
          }

          id v13 = v32;
        }
        while ([v32 count]);
      }
      id v35 = v31;
      unsigned __int8 v24 = [v8 commitTransactionWithError:&v35];
      id v10 = v35;

      if ((v24 & 1) == 0)
      {
        v25 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v44 = "-[ADCloudKitCapabilitiesDataStore _writeSQLiteRecords:toTable:]";
          __int16 v45 = 2112;
          id v46 = v10;
          _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%s Failed to commit database transaction due to error %@", buf, 0x16u);
        }
        id v34 = 0;
        unsigned __int8 v26 = [v8 rollbackTransactionWithError:&v34];
        id v27 = v34;
        if ((v26 & 1) == 0)
        {
          v28 = AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v44 = "-[ADCloudKitCapabilitiesDataStore _writeSQLiteRecords:toTable:]";
            __int16 v45 = 2112;
            id v46 = v27;
            _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%s Failed to rollback database transaction due to error %@", buf, 0x16u);
          }
        }
      }
    }
    else
    {
      v30 = AFSiriLogContextAnalytics;
      if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v44 = "-[ADCloudKitCapabilitiesDataStore _writeSQLiteRecords:toTable:]";
        __int16 v45 = 2112;
        id v46 = v12;
        _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%s Failed to begin database transaction due to error %@", buf, 0x16u);
      }
      id v10 = v12;
    }
  }
  else
  {
    v29 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v44 = "-[ADCloudKitCapabilitiesDataStore _writeSQLiteRecords:toTable:]";
      __int16 v45 = 2112;
      id v46 = v10;
      _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%s Failed to prepare database: %@", buf, 0x16u);
    }
  }
}

- (id)_fetchSQLiteRecordsOwnedByLocalDeviceFromTable:(id)a3
{
  id v4 = a3;
  id v20 = 0;
  id v5 = [(ADCloudKitCapabilitiesDataStore *)self _preparedDatabaseWithError:&v20];
  id v6 = v20;
  if (v5)
  {
    id v7 = +[ADDeviceCircleManager sharedInstance];
    id v8 = [v7 localPeerInfo];
    id v9 = [v8 idsDeviceUniqueIdentifier];

    id v10 = +[SiriCoreSQLiteQueryCriterion isQueryCriterionWithColumnName:@"device_id" value:v9 negation:0];
    unsigned __int8 v11 = sub_1001A33EC(v4, @"device_id");
    id v12 = [(_ADCloudKitCapabilitiesDataStoreHelper *)self->_helper recordBuilder];
    id v19 = v6;
    id v13 = [v5 selectRecordsFromTableWithName:v4 columnNames:0 behavior:0 indexedBy:v11 criterion:v10 order:0 range:0 recordBuilder:v12 error:&v19];
    id v14 = v19;

    if (v14)
    {
      id v15 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        id v22 = "-[ADCloudKitCapabilitiesDataStore _fetchSQLiteRecordsOwnedByLocalDeviceFromTable:]";
        __int16 v23 = 2112;
        id v24 = v14;
        _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s Failed to select database records due to error %@", buf, 0x16u);
      }
      id v16 = 0;
    }
    else
    {
      id v16 = v13;
    }
  }
  else
  {
    id v17 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v22 = "-[ADCloudKitCapabilitiesDataStore _fetchSQLiteRecordsOwnedByLocalDeviceFromTable:]";
      __int16 v23 = 2112;
      id v24 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s Error preparing the database: %@", buf, 0x16u);
    }
    id v16 = 0;
    id v14 = v6;
  }

  return v16;
}

- (id)_addMissingColumnsForTable:(id)a3 withDescription:(id)a4 inDatabase:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v44 = a5;
  id v9 = [v7 columns];
  id v10 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v9 count]);

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  v43 = v7;
  unsigned __int8 v11 = [v7 columns];
  id v12 = [v11 countByEnumeratingWithState:&v54 objects:v68 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v55;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v55 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = [*(id *)(*((void *)&v54 + 1) + 8 * i) name];
        [v10 addObject:v16];
      }
      id v13 = [v11 countByEnumeratingWithState:&v54 objects:v68 count:16];
    }
    while (v13);
  }

  id v17 = [v8 columns];
  uint64_t v18 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v17 count]);

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v42 = v8;
  id v19 = [v8 columns];
  id v20 = [v19 countByEnumeratingWithState:&v50 objects:v67 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v51;
    do
    {
      for (j = 0; j != v21; j = (char *)j + 1)
      {
        if (*(void *)v51 != v22) {
          objc_enumerationMutation(v19);
        }
        id v24 = *(void **)(*((void *)&v50 + 1) + 8 * (void)j);
        v25 = [v24 name];
        unsigned __int8 v26 = [v10 containsObject:v25];

        if ((v26 & 1) == 0) {
          [v18 addObject:v24];
        }
      }
      id v21 = [v19 countByEnumeratingWithState:&v50 objects:v67 count:16];
    }
    while (v21);
  }

  id v27 = [v43 name];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v28 = v18;
  id v29 = [v28 countByEnumeratingWithState:&v46 objects:v66 count:16];
  if (v29)
  {
    id v30 = v29;
    id v31 = 0;
    uint64_t v32 = *(void *)v47;
    while (2)
    {
      v33 = 0;
      id v34 = v31;
      do
      {
        if (*(void *)v47 != v32) {
          objc_enumerationMutation(v28);
        }
        id v35 = *(void **)(*((void *)&v46 + 1) + 8 * (void)v33);
        id v45 = v34;
        unsigned __int8 v36 = [v44 alterTableWithName:v27 addColumn:v35 error:&v45];
        id v31 = v45;

        if ((v36 & 1) == 0)
        {
          long long v37 = (void *)AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
          {
            long long v40 = v37;
            id v41 = [v35 name];
            *(_DWORD *)buf = 136315906;
            v59 = "-[ADCloudKitCapabilitiesDataStore _addMissingColumnsForTable:withDescription:inDatabase:]";
            __int16 v60 = 2112;
            v61 = v41;
            __int16 v62 = 2112;
            v63 = v27;
            __int16 v64 = 2112;
            id v65 = v31;
            _os_log_error_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "%s Failed to add column '%@' to '%@' table with error %@", buf, 0x2Au);
          }
          id v38 = v31;

          goto LABEL_31;
        }
        v33 = (char *)v33 + 1;
        id v34 = v31;
      }
      while (v30 != v33);
      id v30 = [v28 countByEnumeratingWithState:&v46 objects:v66 count:16];
      if (v30) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v31 = 0;
  }

  id v38 = v31;
LABEL_31:

  return v38;
}

- (id)_preparedDatabaseWithError:(id *)a3
{
  if (a3) {
    *a3 = 0;
  }
  database = self->_database;
  if (database) {
    goto LABEL_4;
  }
  location = (id *)&self->_database;
  id v7 = [(ADCloudKitCapabilitiesDataStore *)self _databasePath];
  id v8 = (os_log_t *)&AFSiriLogContextDaemon;
  id v9 = AFSiriLogContextDaemon;
  long long v56 = a3;
  long long v55 = self;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    id v65 = "-[ADCloudKitCapabilitiesDataStore _preparedDatabaseWithError:]";
    __int16 v66 = 2112;
    CFStringRef v67 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%s path: %@", buf, 0x16u);
  }
  id v10 = 0;
  id v11 = 0;
  CFStringRef v12 = 0;
  id v13 = RSSSchemaRSSClientEventMetadata_ptr;
  uint64_t v14 = (os_log_t *)&AFSiriLogContextAnalytics;
  do
  {
    id v15 = v11;
    id v11 = [objc_alloc((Class)v13[394]) initWithPath:v7 dataProtectionClass:2 options:3];

    id v62 = 0;
    unsigned int v16 = [v11 openWithError:&v62];
    id v17 = (__CFString *)v62;
    if (v16)
    {
      uint64_t v18 = +[NSFileManager defaultManager];
      unsigned int v19 = [v18 fileExistsAtPath:v7];

      id v20 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        id v65 = "-[ADCloudKitCapabilitiesDataStore _preparedDatabaseWithError:]";
        __int16 v66 = 2112;
        CFStringRef v67 = v7;
        __int16 v68 = 1024;
        LODWORD(v69) = v19;
        _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "%s Database created at %@: %d", buf, 0x1Cu);
        if (v17) {
          goto LABEL_17;
        }
        goto LABEL_14;
      }
LABEL_13:
      if (v17) {
        goto LABEL_17;
      }
      goto LABEL_14;
    }
    id v21 = *v14;
    if (!os_log_type_enabled(*v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    *(_DWORD *)buf = 136315906;
    id v65 = "-[ADCloudKitCapabilitiesDataStore _preparedDatabaseWithError:]";
    __int16 v66 = 2048;
    CFStringRef v67 = v12;
    __int16 v68 = 2112;
    v69 = v7;
    __int16 v70 = 2112;
    v71 = v17;
    _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%s Failed to open capabilities database (retry #%tu) at path %@ with error %@.", buf, 0x2Au);
    if (v17) {
      goto LABEL_17;
    }
LABEL_14:
    id v61 = 0;
    unsigned __int8 v22 = [v11 performIntegrityCheckWithError:&v61];
    id v17 = (__CFString *)v61;
    if ((v22 & 1) == 0 && (__int16 v23 = *v8, os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR)))
    {
      *(_DWORD *)buf = 136315906;
      id v65 = "-[ADCloudKitCapabilitiesDataStore _preparedDatabaseWithError:]";
      __int16 v66 = 2048;
      CFStringRef v67 = v12;
      __int16 v68 = 2112;
      v69 = v7;
      __int16 v70 = 2112;
      v71 = v17;
      _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%s Failed to perform integrity check on capabilities database (retry #%tu) at path %@ with error %@.", buf, 0x2Au);
      if (!v17) {
        goto LABEL_37;
      }
    }
    else if (!v17)
    {
      goto LABEL_37;
    }
LABEL_17:
    [v11 closeWithError:0];
    if (SiriCoreSQLiteDatabaseIsErrorUnrecoverable()
      && (+[NSFileManager defaultManager],
          id v24 = objc_claimAutoreleasedReturnValue(),
          unsigned int v25 = [v24 fileExistsAtPath:v7],
          v24,
          v25))
    {
      unsigned __int8 v26 = v14;
      id v27 = v8;
      id v28 = +[NSFileManager defaultManager];
      __int16 v60 = v17;
      unsigned __int8 v29 = [v28 removeItemAtPath:v7 error:&v60];
      id v10 = v60;

      if (v29)
      {
        id v8 = v27;
      }
      else
      {
        id v8 = v27;
        id v30 = *v27;
        if (os_log_type_enabled(*v27, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315906;
          id v65 = "-[ADCloudKitCapabilitiesDataStore _preparedDatabaseWithError:]";
          __int16 v66 = 2048;
          CFStringRef v67 = v12;
          __int16 v68 = 2112;
          v69 = v7;
          __int16 v70 = 2112;
          v71 = v10;
          _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%s Failed to remove database (retry #%tu) at path %@ due to %@.", buf, 0x2Au);
        }
      }
      uint64_t v14 = v26;
      id v13 = RSSSchemaRSSClientEventMetadata_ptr;
    }
    else
    {
      id v10 = v17;
    }
    CFStringRef v12 = (const __CFString *)((char *)v12 + 1);
  }
  while (v12 != (const __CFString *)3);
  if (!v10)
  {
LABEL_37:
    v33 = [(_ADCloudKitCapabilitiesDataStoreHelper *)v55->_helper tableDescription];
    id v34 = [v33 name];
    id v35 = [v11 fetchTableWithName:v34 error:0];

    if (v35)
    {
      uint64_t v36 = [(ADCloudKitCapabilitiesDataStore *)v55 _addMissingColumnsForTable:v35 withDescription:v33 inDatabase:v11];
      id v10 = (__CFString *)v36;
      long long v37 = v56;
      if (!v56 || !v36)
      {
LABEL_42:
        long long v53 = v35;
        long long v57 = v33;
        id v52 = objc_alloc((Class)SiriCoreSQLiteTableDescription);
        long long v39 = +[SiriCoreSQLiteColumnDescription uniqueTextColumnWithName:@"capabilities_type"];
        v63[0] = v39;
        id v40 = [objc_alloc((Class)SiriCoreSQLiteColumnDescription) initWithName:@"last_sync_date" type:@"REAL" constraints:0];
        v63[1] = v40;
        id v41 = [objc_alloc((Class)SiriCoreSQLiteColumnDescription) initWithName:@"last_sync_os" type:@"TEXT" constraints:0];
        v63[2] = v41;
        id v42 = +[NSArray arrayWithObjects:v63 count:3];
        id v43 = [v52 initWithName:@"metadata" columns:v42 constraints:0];

        id v44 = v43;
        id v45 = [v43 name];
        long long v46 = [v11 fetchTableWithName:v45 error:0];

        if (v46)
        {
          long long v47 = [(ADCloudKitCapabilitiesDataStore *)v55 _addMissingColumnsForTable:v46 withDescription:v43 inDatabase:v11];

          if (v37)
          {
            v33 = v57;
            if (!v47) {
              goto LABEL_52;
            }
LABEL_56:
            long long v47 = v47;
            *long long v37 = v47;
LABEL_57:
            int v32 = 1;
            goto LABEL_58;
          }
        }
        else
        {
          v58 = v10;
          unsigned __int8 v49 = [v11 createTable:v43 error:&v58];
          long long v47 = v58;

          if ((v49 & 1) == 0)
          {
            long long v50 = AFSiriLogContextDaemon;
            if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315650;
              id v65 = "-[ADCloudKitCapabilitiesDataStore _preparedDatabaseWithError:]";
              __int16 v66 = 2112;
              CFStringRef v67 = @"device_capabilities";
              __int16 v68 = 2112;
              v69 = v47;
              _os_log_error_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "%s Failed to create '%@' table with error %@", buf, 0x20u);
            }
            v33 = v57;
            if (!v37) {
              goto LABEL_57;
            }
            goto LABEL_56;
          }
        }
        v33 = v57;
LABEL_52:
        [(_ADCloudKitCapabilitiesDataStoreHelper *)v55->_helper createIndicesForTableInDatabase:v11];
        objc_storeStrong(location, v11);
        int v32 = 0;
LABEL_58:

        id v10 = v47;
        id v35 = v53;
        goto LABEL_59;
      }
    }
    else
    {
      id v59 = 0;
      unsigned __int8 v38 = [v11 createTable:v33 error:&v59];
      id v10 = (__CFString *)v59;
      long long v37 = v56;
      if (v38) {
        goto LABEL_42;
      }
      long long v48 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        id v65 = "-[ADCloudKitCapabilitiesDataStore _preparedDatabaseWithError:]";
        __int16 v66 = 2112;
        CFStringRef v67 = @"device_capabilities";
        __int16 v68 = 2112;
        v69 = v10;
        _os_log_error_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "%s Failed to create '%@' table with error %@", buf, 0x20u);
        if (!v56) {
          goto LABEL_49;
        }
      }
      else if (!v56)
      {
LABEL_49:
        int v32 = 1;
LABEL_59:

        goto LABEL_60;
      }
    }
    id v10 = v10;
    *long long v37 = v10;
    goto LABEL_49;
  }
  id v31 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    id v65 = "-[ADCloudKitCapabilitiesDataStore _preparedDatabaseWithError:]";
    __int16 v66 = 2112;
    CFStringRef v67 = v10;
    _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%s Failed to prepare analytics database due to %@.", buf, 0x16u);
  }
  if (v56)
  {
    id v10 = v10;
    *long long v56 = v10;
  }
  int v32 = 1;
LABEL_60:

  if (!v32)
  {
    database = (SiriCoreSQLiteDatabase *)*location;
LABEL_4:
    id v6 = database;
    goto LABEL_62;
  }
  id v6 = 0;
LABEL_62:
  return v6;
}

- (id)_databasePath
{
  v2 = +[ADAudioFileWriter _savedAudioFilesDirectory]_0();
  v3 = [v2 URLByAppendingPathComponent:@"capabilities.db"];
  id v4 = [v3 path];

  return v4;
}

- (ADCloudKitCapabilitiesDataStore)initWithHelper:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ADCloudKitCapabilitiesDataStore;
  id v6 = [(ADCloudKitCapabilitiesDataStore *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_helper, a3);
  }

  return v7;
}

@end