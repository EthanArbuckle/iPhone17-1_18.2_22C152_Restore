@interface BCCloudAssetDetailManager
- (BCCloudAssetDetailManager)initWithCloudDataSource:(id)a3 cloudKitController:(id)a4;
- (BCCloudDataManager)dataManager;
- (BCCloudDataPrivacyDelegate)privacyDelegate;
- (BCCloudDataSource)assetDetailDataSource;
- (BCCloudDataSyncManager)syncManager;
- (BCCloudKitController)cloudKitController;
- (BOOL)enableCloudSync;
- (id)diagnosticEntityInfos:(BOOL)a3;
- (id)entityName;
- (void)assetDetailForAssetID:(id)a3 completion:(id)a4;
- (void)assetDetailsForAssetIDs:(id)a3 completion:(id)a4;
- (void)currentAssetDetailCloudSyncVersions:(id)a3;
- (void)deleteAssetDetailForAssetID:(id)a3 completion:(id)a4;
- (void)dissociateCloudDataFromSyncWithCompletion:(id)a3;
- (void)fetchAssetDetailsForUnsyncedTastes:(id)a3;
- (void)fetchAssetDetailsIncludingDeleted:(BOOL)a3 completion:(id)a4;
- (void)fetchFinishedAssetCountByYearWithCompletion:(id)a3;
- (void)fetchFinishedDatesByAssetIDForYear:(int64_t)a3 completion:(id)a4;
- (void)getAssetDetailChangesSince:(id)a3 completion:(id)a4;
- (void)hasSaltChangedWithCompletion:(id)a3;
- (void)removeAssetDetailForSaltedHashedRecordIDs:(id)a3 completion:(id)a4;
- (void)resolvedAssetDetailForAssetID:(id)a3 completion:(id)a4;
- (void)setAssetDetail:(id)a3 completion:(id)a4;
- (void)setAssetDetailDataSource:(id)a3;
- (void)setAssetDetails:(id)a3 completion:(id)a4;
- (void)setCloudKitController:(id)a3;
- (void)setDataManager:(id)a3;
- (void)setEnableCloudSync:(BOOL)a3;
- (void)setPrivacyDelegate:(id)a3;
- (void)setSyncManager:(id)a3;
- (void)signalSyncToCKForSyncManager:(id)a3;
- (void)syncManager:(id)a3 failedRecordIDs:(id)a4 completion:(id)a5;
- (void)syncManager:(id)a3 removeCloudDataForIDs:(id)a4 completion:(id)a5;
- (void)syncManager:(id)a3 resolveConflictsForRecords:(id)a4 completion:(id)a5;
- (void)syncManager:(id)a3 startSyncToCKWithCompletion:(id)a4;
- (void)syncManager:(id)a3 updateSyncGenerationFromCloudData:(id)a4 completion:(id)a5;
- (void)updateSyncGenerationFromCloudData:(id)a3 completion:(id)a4;
@end

@implementation BCCloudAssetDetailManager

- (void)getAssetDetailChangesSince:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(BCCloudAssetDetailManager *)self dataManager];
  [v8 getChangesSince:v7 forEntityClass:objc_opt_class() completion:v6];
}

- (BCCloudDataManager)dataManager
{
  return self->_dataManager;
}

- (void)currentAssetDetailCloudSyncVersions:(id)a3
{
  id v4 = a3;
  id v5 = [(BCCloudAssetDetailManager *)self dataManager];
  [v5 currentCloudSyncVersions:v4];
}

- (BCCloudAssetDetailManager)initWithCloudDataSource:(id)a3 cloudKitController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)BCCloudAssetDetailManager;
  v9 = [(BCCloudAssetDetailManager *)&v23 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_assetDetailDataSource, a3);
    objc_storeWeak((id *)&v10->_cloudKitController, v8);
    v11 = [[BCCloudDataSyncManager alloc] initWithCloudKitController:v8];
    syncManager = v10->_syncManager;
    v10->_syncManager = v11;

    [(BCCloudDataSyncManager *)v10->_syncManager setDelegate:v10];
    v13 = [BCCloudDataManager alloc];
    v14 = [(BCCloudAssetDetailManager *)v10 entityName];
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    v17 = v10->_syncManager;
    id WeakRetained = objc_loadWeakRetained((id *)&v10->_cloudKitController);
    v19 = [(BCCloudDataManager *)v13 initWithCloudDataSource:v7 entityName:v14 notificationName:@"BCCloudAssetDetailManagerChanged" immutableClass:v15 mutableClass:v16 syncManager:v17 cloudKitController:WeakRetained];
    dataManager = v10->_dataManager;
    v10->_dataManager = v19;

    v21 = [v8 privateCloudDatabaseController];
    objc_storeWeak((id *)&v10->_privacyDelegate, v21);
  }
  return v10;
}

- (void)syncManager:(id)a3 startSyncToCKWithCompletion:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if ([(BCCloudAssetDetailManager *)self enableCloudSync])
  {
    id v7 = [(BCCloudAssetDetailManager *)self dataManager];
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
  if ([(BCCloudAssetDetailManager *)self enableCloudSync])
  {
    id v7 = [(BCCloudAssetDetailManager *)self cloudKitController];
    id v4 = [v7 transactionManager];
    id v5 = [(BCCloudAssetDetailManager *)self entityName];
    id v6 = [(BCCloudAssetDetailManager *)self syncManager];
    [v4 signalSyncToCKTransactionForEntityName:v5 syncManager:v6];
  }
}

- (void)syncManager:(id)a3 removeCloudDataForIDs:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if ([(BCCloudAssetDetailManager *)self enableCloudSync])
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
          uint64_t v15 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * (void)v14), "recordName", (void)v18);
          [v9 addObject:v15];

          v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        id v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v12);
    }

    [(BCCloudAssetDetailManager *)self removeAssetDetailForSaltedHashedRecordIDs:v9 completion:v8];
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
  if ([(BCCloudAssetDetailManager *)self enableCloudSync])
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
          uint64_t v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          id v16 = objc_msgSend(v15, "assetID", (void)v19);
          [v9 setObject:v15 forKey:v16];
        }
        id v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v12);
    }

    [(BCCloudAssetDetailManager *)self updateSyncGenerationFromCloudData:v9 completion:v8];
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
  if ([(BCCloudAssetDetailManager *)self enableCloudSync])
  {
    id v9 = [(BCCloudAssetDetailManager *)self dataManager];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10005A704;
    v17[3] = &unk_1002617C0;
    id v18 = v8;
    [v9 resolveConflictsForRecords:v7 completion:v17];

    id v10 = v18;
  }
  else
  {
    id v11 = +[BULogUtilities shared];
    unsigned int v12 = [v11 verboseLoggingEnabled];

    if (v12)
    {
      uint64_t v13 = sub_10000CD80();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v14 = [(BCCloudAssetDetailManager *)self enableCloudSync];
        CFStringRef v15 = @"NO";
        if (v14) {
          CFStringRef v15 = @"YES";
        }
        *(_DWORD *)buf = 138412290;
        CFStringRef v20 = v15;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "\"\\\"#zonefetch BCCloudAssetDetailManager resolveConflictsForRecords ignoring changes for records enableCloudSync:%@\\\"\"", buf, 0xCu);
      }
    }
    id v16 = objc_retainBlock(v8);
    id v10 = v16;
    if (v16) {
      (*((void (**)(id, void, void))v16 + 2))(v16, 0, 0);
    }
  }
}

- (void)syncManager:(id)a3 failedRecordIDs:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if ([(BCCloudAssetDetailManager *)self enableCloudSync])
  {
    id v9 = [(BCCloudAssetDetailManager *)self dataManager];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10005A930;
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
  return @"BCAssetDetail";
}

- (id)diagnosticEntityInfos:(BOOL)a3
{
  if (a3)
  {
    id v4 = 0;
  }
  else
  {
    id v5 = [(BCCloudAssetDetailManager *)self dataManager];
    id v4 = [v5 diagnosticDirtyCloudDataInfos];
  }
  id v6 = [BDSCloudSyncDiagnosticEntityInfo alloc];
  id v7 = [(BCCloudAssetDetailManager *)self entityName];
  id v8 = [(BDSCloudSyncDiagnosticEntityInfo *)v6 initWithName:v7 enabledSync:[(BCCloudAssetDetailManager *)self enableCloudSync] dirtyCloudDataInfos:v4];

  id v11 = v8;
  id v9 = +[NSArray arrayWithObjects:&v11 count:1];

  return v9;
}

- (void)setEnableCloudSync:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[BULogUtilities shared];
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
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "\"\\\"BCCloudAssetDetailManager #enableCloudSync setEnableCloudSync %@\\\"\"", (uint8_t *)&v15, 0xCu);
    }
  }
  if (self->_enableCloudSync != v3)
  {
    self->_enableCloudSync = v3;
    if (v3)
    {
      id v9 = [(BCCloudAssetDetailManager *)self cloudKitController];
      id v10 = [v9 privateCloudDatabaseController];
      [v10 addObserver:self->_syncManager recordType:@"assetDetail"];

      id v11 = [(BCCloudAssetDetailManager *)self cloudKitController];
      unsigned int v12 = [v11 transactionManager];
      id v13 = [(BCCloudAssetDetailManager *)self entityName];
      unsigned int v14 = [(BCCloudAssetDetailManager *)self syncManager];
      [v12 signalSyncToCKTransactionForEntityName:v13 syncManager:v14];
    }
    else
    {
      id v11 = +[BCCloudKitController sharedInstance];
      unsigned int v12 = [v11 privateCloudDatabaseController];
      [v12 removeObserver:self->_syncManager recordType:@"assetDetail"];
    }
  }
}

- (void)hasSaltChangedWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(BCCloudAssetDetailManager *)self dataManager];
  [v5 hasSaltChangedWithCompletion:v4];
}

- (void)dissociateCloudDataFromSyncWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(BCCloudAssetDetailManager *)self dataManager];
  [v5 dissociateCloudDataFromSyncWithCompletion:v4];
}

- (void)setAssetDetail:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v10 = [(BCCloudAssetDetailManager *)self dataManager];
  CFStringRef v8 = [v7 assetID];
  id v9 = +[NSPredicate predicateWithFormat:@"assetID = %@", v8];
  [v10 setCloudData:v7 predicate:v9 completion:v6];
}

- (void)setAssetDetails:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v10 = [(BCCloudAssetDetailManager *)self dataManager];
  CFStringRef v8 = [v7 allKeys];
  id v9 = +[NSPredicate predicateWithFormat:@"assetID IN %@", v8];
  [v10 setCloudData:v7 predicate:v9 propertyIDKey:@"assetID" completion:v6];
}

- (void)removeAssetDetailForSaltedHashedRecordIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    CFStringRef v8 = [(BCCloudAssetDetailManager *)self dataManager];
    id v9 = +[NSPredicate predicateWithFormat:@"saltedHashedID IN %@", v6];
    [v8 removeCloudDataForPredicate:v9 completion:v7];
  }
  else
  {
    id v10 = sub_1000083A0();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1001E84E8(v10);
    }

    CFStringRef v8 = (void (**)(void, void, void))objc_retainBlock(v7);
    if (v8)
    {
      id v11 = +[NSError errorWithDomain:@"BDSErrorDomain" code:1003 userInfo:0];
      ((void (**)(void, void, void *))v8)[2](v8, 0, v11);
    }
  }
}

- (void)updateSyncGenerationFromCloudData:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v10 = [(BCCloudAssetDetailManager *)self dataManager];
  CFStringRef v8 = [v7 allKeys];
  id v9 = +[NSPredicate predicateWithFormat:@"assetID IN %@", v8];
  [v10 updateSyncGenerationFromCloudData:v7 predicate:v9 propertyIDKey:@"assetID" completion:v6];
}

- (void)deleteAssetDetailForAssetID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(BCCloudAssetDetailManager *)self dataManager];
  CFStringRef v8 = +[NSPredicate predicateWithFormat:@"assetID = %@", v7];

  [v9 deleteCloudDataForPredicate:v8 completion:v6];
}

- (void)assetDetailForAssetID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CFStringRef v8 = sub_1000083A0();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Fetching assetDetailForAssetID on assetID:%@", buf, 0xCu);
  }

  id v9 = [(BCCloudAssetDetailManager *)self dataManager];
  id v10 = +[NSPredicate predicateWithFormat:@"assetID = %@ AND (deletedFlag == NULL OR deletedFlag == NO)", v6];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10005B2D8;
  v13[3] = &unk_100261888;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  [v9 cloudDataWithPredicate:v10 sortDescriptors:0 completion:v13];
}

- (void)assetDetailsForAssetIDs:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(BCCloudAssetDetailManager *)self dataManager];
  CFStringRef v8 = +[NSPredicate predicateWithFormat:@"assetID IN %@ AND (deletedFlag == NULL OR deletedFlag == NO)", v7];

  [v9 cloudDatasWithPredicate:v8 completion:v6];
}

- (void)resolvedAssetDetailForAssetID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  CFStringRef v8 = [[BCMutableAssetDetail alloc] initWithAssetID:v7];
  id v9 = [(BCCloudAssetDetailManager *)self dataManager];
  id v10 = +[NSPredicate predicateWithFormat:@"assetID = %@", v7];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10005B5C4;
  v12[3] = &unk_1002617E8;
  id v13 = v6;
  id v11 = v6;
  [v9 resolvedCloudDataForCloudData:v8 predicate:v10 completion:v12];
}

- (void)fetchAssetDetailsIncludingDeleted:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(BCCloudAssetDetailManager *)self dataManager];
  [v7 fetchCloudDataIncludingDeleted:v4 completion:v6];
}

- (void)fetchAssetDetailsForUnsyncedTastes:(id)a3
{
  id v4 = a3;
  id v5 = +[NSPredicate predicateWithFormat:@"tasteSyncedToStore != NULL AND tasteSyncedToStore == %@ AND (deletedFlag == NULL OR deletedFlag == NO)", &off_100270600];
  id v6 = [(BCCloudAssetDetailManager *)self dataManager];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10005B7C4;
  v8[3] = &unk_1002618B0;
  id v9 = v4;
  id v7 = v4;
  [v6 cloudDatasWithPredicate:v5 completion:v8];
}

- (void)fetchFinishedDatesByAssetIDForYear:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = objc_alloc_init((Class)NSDateComponents);
  [v7 setYear:a3];
  [v7 setDay:1];
  [v7 setMonth:1];
  CFStringRef v8 = +[NSTimeZone systemTimeZone];
  [v7 setTimeZone:v8];

  id v9 = +[NSCalendar currentCalendar];
  id v10 = [v9 dateFromComponents:v7];

  [v7 setYear:a3 + 1];
  id v11 = +[NSCalendar currentCalendar];
  id v12 = [v11 dateFromComponents:v7];

  id v13 = +[NSPredicate predicateWithFormat:@"isFinished == YES AND (dateFinished >= %@ AND dateFinished < %@)", v10, v12];
  id v14 = [(BCCloudAssetDetailManager *)self dataManager];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10005BAEC;
  v16[3] = &unk_100260D70;
  id v17 = v6;
  id v15 = v6;
  [v14 transformedCloudDatasWithPredicate:v13 transformer:&stru_1002618F0 limit:1000 completion:v16];
}

- (void)fetchFinishedAssetCountByYearWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = +[NSPredicate predicateWithFormat:@"isFinished == YES AND dateFinished != NULL"];
  id v6 = +[NSCalendar currentCalendar];
  id v7 = +[NSMutableDictionary dictionary];
  CFStringRef v8 = [(BCCloudAssetDetailManager *)self dataManager];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10005BEA0;
  v15[3] = &unk_100261918;
  id v16 = v6;
  id v17 = v7;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10005BFC4;
  v12[3] = &unk_100261940;
  id v13 = v17;
  id v14 = v4;
  id v9 = v17;
  id v10 = v4;
  id v11 = v6;
  [v8 transformedCloudDatasWithPredicate:v5 transformer:v15 limit:0 completion:v12];
}

- (BOOL)enableCloudSync
{
  return self->_enableCloudSync;
}

- (BCCloudKitController)cloudKitController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cloudKitController);
  return (BCCloudKitController *)WeakRetained;
}

- (void)setCloudKitController:(id)a3
{
}

- (BCCloudDataSource)assetDetailDataSource
{
  return self->_assetDetailDataSource;
}

- (void)setAssetDetailDataSource:(id)a3
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

- (BCCloudDataPrivacyDelegate)privacyDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_privacyDelegate);
  return (BCCloudDataPrivacyDelegate *)WeakRetained;
}

- (void)setPrivacyDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_privacyDelegate);
  objc_storeStrong((id *)&self->_dataManager, 0);
  objc_storeStrong((id *)&self->_syncManager, 0);
  objc_storeStrong((id *)&self->_assetDetailDataSource, 0);
  objc_destroyWeak((id *)&self->_cloudKitController);
}

@end