@interface BCCloudSecureUserDataManager
+ (void)deleteCloudDataWithCompletion:(id)a3;
- (BCCloudDataManager)dataManager;
- (BCCloudDataSource)secureDataSource;
- (BCCloudDataSyncManager)syncManager;
- (BCCloudSecureUserDataManager)initWithCloudDataSource:(id)a3 cloudKitController:(id)a4;
- (BOOL)enableCloudSync;
- (id)entityName;
- (void)currentCloudSyncVersions:(id)a3;
- (void)deleteUserDatumForKey:(id)a3 completion:(id)a4;
- (void)dissociateCloudDataFromSyncWithCompletion:(id)a3;
- (void)fetchUserDataIncludingDeleted:(BOOL)a3 completion:(id)a4;
- (void)getUserDataChangesSince:(id)a3 completion:(id)a4;
- (void)hasSaltChangedWithCompletion:(id)a3;
- (void)removeUserDataForSaltedHashedRecordIDs:(id)a3 completion:(id)a4;
- (void)resolvedUserDataValueForKey:(id)a3 completion:(id)a4;
- (void)setDataManager:(id)a3;
- (void)setEnableCloudSync:(BOOL)a3;
- (void)setSecureDataSource:(id)a3;
- (void)setSyncManager:(id)a3;
- (void)setUserData:(id)a3 completion:(id)a4;
- (void)setUserDataValue:(id)a3 forKey:(id)a4 completion:(id)a5;
- (void)setUserDatum:(id)a3 completion:(id)a4;
- (void)signalSyncToCKForSyncManager:(id)a3;
- (void)syncManager:(id)a3 failedRecordIDs:(id)a4 completion:(id)a5;
- (void)syncManager:(id)a3 removeCloudDataForIDs:(id)a4 completion:(id)a5;
- (void)syncManager:(id)a3 resolveConflictsForRecords:(id)a4 completion:(id)a5;
- (void)syncManager:(id)a3 startSyncToCKWithCompletion:(id)a4;
- (void)syncManager:(id)a3 updateSyncGenerationFromCloudData:(id)a4 completion:(id)a5;
- (void)updateSyncGenerationFromCloudData:(id)a3 completion:(id)a4;
- (void)userDataValueForKey:(id)a3 completion:(id)a4;
- (void)userDatumForKey:(id)a3 completion:(id)a4;
- (void)userDatumIncludingDeleted:(BOOL)a3 forKey:(id)a4 completion:(id)a5;
@end

@implementation BCCloudSecureUserDataManager

- (void)userDatumForKey:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(BCCloudSecureUserDataManager *)self dataManager];
  v9 = +[NSPredicate predicateWithFormat:@"key = %@ AND (deletedFlag == NULL OR deletedFlag == NO)", v7];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100008EF4;
  v11[3] = &unk_1002617E8;
  id v12 = v6;
  id v10 = v6;
  [v8 cloudDataWithPredicate:v9 sortDescriptors:0 completion:v11];
}

- (BCCloudDataManager)dataManager
{
  return self->_dataManager;
}

- (BCCloudSecureUserDataManager)initWithCloudDataSource:(id)a3 cloudKitController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)BCCloudSecureUserDataManager;
  v9 = [(BCCloudSecureUserDataManager *)&v21 init];
  if (v9)
  {
    id v10 = sub_1000083A0();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Initializing BCCloudAssetManager - Service mode", buf, 2u);
    }

    objc_storeStrong((id *)&v9->_secureDataSource, a3);
    v11 = [[BCCloudDataSyncManager alloc] initWithCloudKitController:v8];
    syncManager = v9->_syncManager;
    v9->_syncManager = v11;

    [(BCCloudDataSyncManager *)v9->_syncManager setDelegate:v9];
    v13 = [BCCloudDataManager alloc];
    v14 = [(BCCloudSecureUserDataManager *)v9 secureDataSource];
    v15 = [(BCCloudSecureUserDataManager *)v9 entityName];
    uint64_t v16 = objc_opt_class();
    v17 = [(BCCloudDataManager *)v13 initWithCloudDataSource:v14 entityName:v15 notificationName:@"BCCloudSecureUserDataManagerChanged" immutableClass:v16 mutableClass:objc_opt_class() syncManager:v9->_syncManager cloudKitController:v8];
    dataManager = v9->_dataManager;
    v9->_dataManager = v17;
  }
  return v9;
}

- (void)hasSaltChangedWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(BCCloudSecureUserDataManager *)self dataManager];
  [v5 hasSaltChangedWithCompletion:v4];
}

- (void)dissociateCloudDataFromSyncWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(BCCloudSecureUserDataManager *)self dataManager];
  [v5 dissociateCloudDataFromSyncWithCompletion:v4];
}

+ (void)deleteCloudDataWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = +[BULogUtilities shared];
  unsigned int v5 = [v4 verboseLoggingEnabled];

  if (v5)
  {
    id v6 = sub_10000CD80();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "\"\\\"BCCloudSecureUserDataManager deleteCloudDataWithCompletion:\\\"\"", v7, 2u);
    }
  }
  +[BCCloudDataSource deleteCloudDataWithCompletion:v3];
}

- (void)syncManager:(id)a3 startSyncToCKWithCompletion:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if ([(BCCloudSecureUserDataManager *)self enableCloudSync])
  {
    id v7 = [(BCCloudSecureUserDataManager *)self dataManager];
    [v7 startSyncToCKWithSyncManager:v9 completion:v6];
  }
  else
  {
    id v8 = objc_retainBlock(v6);
    id v7 = v8;
    if (v8) {
      (*((void (**)(id))v8 + 2))(v8);
    }
  }
}

- (void)signalSyncToCKForSyncManager:(id)a3
{
  if ([(BCCloudSecureUserDataManager *)self enableCloudSync])
  {
    id v7 = +[BCCloudKitController secureSharedInstance];
    id v4 = [v7 transactionManager];
    unsigned int v5 = [(BCCloudSecureUserDataManager *)self entityName];
    id v6 = [(BCCloudSecureUserDataManager *)self syncManager];
    [v4 signalSyncToCKTransactionForEntityName:v5 syncManager:v6];
  }
}

- (void)syncManager:(id)a3 removeCloudDataForIDs:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if ([(BCCloudSecureUserDataManager *)self enableCloudSync])
  {
    id v9 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v7 count]);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v10 = v7;
    id v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        v14 = 0;
        do
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * (void)v14), "recordName", (void)v18);
          [v9 addObject:v15];

          v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        id v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v12);
    }

    [(BCCloudSecureUserDataManager *)self removeUserDataForSaltedHashedRecordIDs:v9 completion:v8];
  }
  else
  {
    id v16 = objc_retainBlock(v8);
    v17 = v16;
    if (v16) {
      (*((void (**)(id, void, void))v16 + 2))(v16, 0, 0);
    }
  }
}

- (void)syncManager:(id)a3 updateSyncGenerationFromCloudData:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if ([(BCCloudSecureUserDataManager *)self enableCloudSync])
  {
    id v9 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v7 count]);
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v10 = v7;
    id v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v20;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          id v16 = objc_msgSend(v15, "key", (void)v19);
          [v9 setObject:v15 forKey:v16];
        }
        id v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v12);
    }

    [(BCCloudSecureUserDataManager *)self updateSyncGenerationFromCloudData:v9 completion:v8];
  }
  else
  {
    id v17 = objc_retainBlock(v8);
    long long v18 = v17;
    if (v17) {
      (*((void (**)(id, void, void))v17 + 2))(v17, 0, 0);
    }
  }
}

- (void)syncManager:(id)a3 resolveConflictsForRecords:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if ([(BCCloudSecureUserDataManager *)self enableCloudSync])
  {
    id v9 = [(BCCloudSecureUserDataManager *)self dataManager];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100058E98;
    v12[3] = &unk_1002617C0;
    id v13 = v8;
    [v9 resolveConflictsForRecords:v7 completion:v12];
  }
  else
  {
    id v10 = objc_retainBlock(v8);
    id v11 = v10;
    if (v10) {
      (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
    }
  }
}

- (void)syncManager:(id)a3 failedRecordIDs:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if ([(BCCloudSecureUserDataManager *)self enableCloudSync])
  {
    id v9 = [(BCCloudSecureUserDataManager *)self dataManager];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10005900C;
    v12[3] = &unk_100260DE0;
    id v13 = v8;
    [v9 failedRecordIDs:v7 completion:v12];
  }
  else
  {
    id v10 = objc_retainBlock(v8);
    id v11 = v10;
    if (v10) {
      (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
    }
  }
}

- (id)entityName
{
  return @"BCSecureUserDatum";
}

- (void)setEnableCloudSync:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = +[BULogUtilities shared];
  unsigned int v6 = [v5 verboseLoggingEnabled];

  if (v6)
  {
    id v7 = sub_10000CD80();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v8 = @"NO";
      if (v3) {
        CFStringRef v8 = @"YES";
      }
      int v15 = 138412290;
      CFStringRef v16 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "\"\\\"BCCloudSecureUserDataManager #enableCloudSync setEnableCloudSync %@\\\"\"", (uint8_t *)&v15, 0xCu);
    }
  }
  if (self->_enableCloudSync != v3)
  {
    self->_enableCloudSync = v3;
    id v9 = +[BCCloudKitController secureSharedInstance];
    id v10 = [v9 privateCloudDatabaseController];
    id v11 = v10;
    syncManager = self->_syncManager;
    if (v3)
    {
      [v10 addObserver:syncManager recordType:@"SecureUserData"];

      id v9 = +[BCCloudKitController secureSharedInstance];
      id v11 = [v9 transactionManager];
      id v13 = [(BCCloudSecureUserDataManager *)self entityName];
      v14 = [(BCCloudSecureUserDataManager *)self syncManager];
      [v11 signalSyncToCKTransactionForEntityName:v13 syncManager:v14];
    }
    else
    {
      [v10 removeObserver:syncManager recordType:@"SecureUserData"];
    }
  }
}

- (void)currentCloudSyncVersions:(id)a3
{
  id v4 = a3;
  id v5 = [(BCCloudSecureUserDataManager *)self dataManager];
  [v5 currentCloudSyncVersions:v4];
}

- (void)setUserDatum:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v10 = [(BCCloudSecureUserDataManager *)self dataManager];
  CFStringRef v8 = [v7 key];
  id v9 = +[NSPredicate predicateWithFormat:@"key = %@", v8];
  [v10 setCloudData:v7 predicate:v9 completion:v6];
}

- (void)setUserData:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v10 = [(BCCloudSecureUserDataManager *)self dataManager];
  CFStringRef v8 = [v7 allKeys];
  id v9 = +[NSPredicate predicateWithFormat:@"key IN %@", v8];
  [v10 setCloudData:v7 predicate:v9 propertyIDKey:@"key" completion:v6];
}

- (void)removeUserDataForSaltedHashedRecordIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    CFStringRef v8 = [(BCCloudSecureUserDataManager *)self dataManager];
    id v9 = +[NSPredicate predicateWithFormat:@"saltedHashedID IN %@", v6];
    [v8 removeCloudDataForPredicate:v9 completion:v7];
  }
  else
  {
    id v10 = sub_1000083A0();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1001E84A4(v10);
    }

    CFStringRef v8 = (void (**)(void, void, void))objc_retainBlock(v7);
    if (v8) {
      v8[2](v8, 1, 0);
    }
  }
}

- (void)updateSyncGenerationFromCloudData:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v10 = [(BCCloudSecureUserDataManager *)self dataManager];
  CFStringRef v8 = [v7 allKeys];
  id v9 = +[NSPredicate predicateWithFormat:@"key IN %@", v8];
  [v10 updateSyncGenerationFromCloudData:v7 predicate:v9 propertyIDKey:@"key" completion:v6];
}

- (void)deleteUserDatumForKey:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(BCCloudSecureUserDataManager *)self dataManager];
  CFStringRef v8 = +[NSPredicate predicateWithFormat:@"key = %@", v7];

  [v9 deleteCloudDataForPredicate:v8 completion:v6];
}

- (void)userDatumIncludingDeleted:(BOOL)a3 forKey:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = a4;
  if (v6)
  {
    id v10 = [(BCCloudSecureUserDataManager *)self dataManager];
    id v11 = +[NSPredicate predicateWithFormat:@"key = %@", v9];

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100059788;
    v12[3] = &unk_1002617E8;
    id v13 = v8;
    [v10 cloudDataWithPredicate:v11 sortDescriptors:0 completion:v12];

    id v9 = v13;
  }
  else
  {
    [(BCCloudSecureUserDataManager *)self userDatumForKey:v9 completion:v8];
  }
}

- (void)fetchUserDataIncludingDeleted:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(BCCloudSecureUserDataManager *)self dataManager];
  [v7 fetchCloudDataIncludingDeleted:v4 completion:v6];
}

- (void)getUserDataChangesSince:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(BCCloudSecureUserDataManager *)self dataManager];
  [v8 getChangesSince:v7 forEntityClass:objc_opt_class() completion:v6];
}

- (void)resolvedUserDataValueForKey:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[BCMutableSecureUserDatum alloc] initWithKey:v7];
  id v9 = [(BCCloudSecureUserDataManager *)self dataManager];
  id v10 = +[NSPredicate predicateWithFormat:@"key = %@", v7];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100059A4C;
  v12[3] = &unk_1002617E8;
  id v13 = v6;
  id v11 = v6;
  [v9 resolvedCloudDataForCloudData:v8 predicate:v10 completion:v12];
}

- (void)userDataValueForKey:(id)a3 completion:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100059BB0;
  v7[3] = &unk_100261810;
  id v8 = a4;
  id v6 = v8;
  [(BCCloudSecureUserDataManager *)self userDatumForKey:a3 completion:v7];
}

- (void)setUserDataValue:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v8 = a3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100059D30;
  v12[3] = &unk_100261860;
  id v13 = a4;
  id v14 = v8;
  int v15 = self;
  id v16 = a5;
  id v9 = v16;
  id v10 = v8;
  id v11 = v13;
  [(BCCloudSecureUserDataManager *)self userDatumForKey:v11 completion:v12];
}

- (BOOL)enableCloudSync
{
  return self->_enableCloudSync;
}

- (BCCloudDataSource)secureDataSource
{
  return self->_secureDataSource;
}

- (void)setSecureDataSource:(id)a3
{
}

- (BCCloudDataSyncManager)syncManager
{
  return self->_syncManager;
}

- (void)setSyncManager:(id)a3
{
}

- (void)setDataManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataManager, 0);
  objc_storeStrong((id *)&self->_syncManager, 0);
  objc_storeStrong((id *)&self->_secureDataSource, 0);
}

@end