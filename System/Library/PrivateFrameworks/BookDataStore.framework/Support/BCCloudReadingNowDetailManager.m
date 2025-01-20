@interface BCCloudReadingNowDetailManager
- (BCCloudDataManager)dataManager;
- (BCCloudDataSource)readingNowDetailDataSource;
- (BCCloudDataSyncManager)syncManager;
- (BCCloudKitController)cloudKitController;
- (BCCloudReadingNowDetailManager)initWithCloudDataSource:(id)a3 cloudKitController:(id)a4;
- (BOOL)enableCloudSync;
- (id)diagnosticEntityInfos:(BOOL)a3;
- (id)entityName;
- (void)currentReadingNowDetailCloudSyncVersions:(id)a3;
- (void)deleteReadingNowDetailForAssetID:(id)a3 completion:(id)a4;
- (void)dissociateCloudDataFromSyncWithCompletion:(id)a3;
- (void)getReadingNowDetailChangesSince:(id)a3 completion:(id)a4;
- (void)getRecentBooksExcludingAssetIDs:(id)a3 completion:(id)a4;
- (void)hasSaltChangedWithCompletion:(id)a3;
- (void)needsReadingNowAssetTypePopulation:(id)a3;
- (void)readingNowDetailsForAssetIDs:(id)a3 completion:(id)a4;
- (void)removeReadingNowDetailForSaltedHashedRecordIDs:(id)a3 completion:(id)a4;
- (void)setCloudKitController:(id)a3;
- (void)setDataManager:(id)a3;
- (void)setDataMonitor:(id)a3;
- (void)setEnableCloudSync:(BOOL)a3;
- (void)setReadingNowDetailDataSource:(id)a3;
- (void)setReadingNowDetails:(id)a3 completion:(id)a4;
- (void)setSyncManager:(id)a3;
- (void)signalSyncToCKForSyncManager:(id)a3;
- (void)syncManager:(id)a3 failedRecordIDs:(id)a4 completion:(id)a5;
- (void)syncManager:(id)a3 removeCloudDataForIDs:(id)a4 completion:(id)a5;
- (void)syncManager:(id)a3 resolveConflictsForRecords:(id)a4 completion:(id)a5;
- (void)syncManager:(id)a3 startSyncToCKWithCompletion:(id)a4;
- (void)syncManager:(id)a3 updateSyncGenerationFromCloudData:(id)a4 completion:(id)a5;
- (void)trackedRreadingNowDetailsInDescendingOrderMaximumResultCount:(unint64_t)a3 filter:(id)a4 completion:(id)a5;
- (void)updateSyncGenerationFromCloudData:(id)a3 completion:(id)a4;
@end

@implementation BCCloudReadingNowDetailManager

- (BCCloudDataManager)dataManager
{
  return self->_dataManager;
}

- (void)currentReadingNowDetailCloudSyncVersions:(id)a3
{
  id v4 = a3;
  id v5 = [(BCCloudReadingNowDetailManager *)self dataManager];
  [v5 currentCloudSyncVersions:v4];
}

- (BCCloudReadingNowDetailManager)initWithCloudDataSource:(id)a3 cloudKitController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)BCCloudReadingNowDetailManager;
  v9 = [(BCCloudReadingNowDetailManager *)&v22 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_readingNowDetailDataSource, a3);
    objc_storeWeak((id *)&v10->_cloudKitController, v8);
    v11 = [[BCCloudDataSyncManager alloc] initWithCloudKitController:v8];
    syncManager = v10->_syncManager;
    v10->_syncManager = v11;

    [(BCCloudDataSyncManager *)v10->_syncManager setDelegate:v10];
    v13 = [BCCloudDataManager alloc];
    v14 = [(BCCloudReadingNowDetailManager *)v10 entityName];
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    v17 = v10->_syncManager;
    id WeakRetained = objc_loadWeakRetained((id *)&v10->_cloudKitController);
    v19 = [(BCCloudDataManager *)v13 initWithCloudDataSource:v7 entityName:v14 notificationName:@"BCCloudReadingNowDetailManagerChanged" immutableClass:v15 mutableClass:v16 syncManager:v17 cloudKitController:WeakRetained];
    dataManager = v10->_dataManager;
    v10->_dataManager = v19;
  }
  return v10;
}

- (void)setDataMonitor:(id)a3
{
  id v4 = a3;
  id v5 = [(BCCloudReadingNowDetailManager *)self dataManager];
  [v5 setMonitor:v4];
}

- (void)syncManager:(id)a3 startSyncToCKWithCompletion:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if ([(BCCloudReadingNowDetailManager *)self enableCloudSync])
  {
    id v7 = [(BCCloudReadingNowDetailManager *)self dataManager];
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
  if ([(BCCloudReadingNowDetailManager *)self enableCloudSync])
  {
    id v7 = [(BCCloudReadingNowDetailManager *)self cloudKitController];
    id v4 = [v7 transactionManager];
    id v5 = [(BCCloudReadingNowDetailManager *)self entityName];
    id v6 = [(BCCloudReadingNowDetailManager *)self syncManager];
    [v4 signalSyncToCKTransactionForEntityName:v5 syncManager:v6];
  }
}

- (void)syncManager:(id)a3 removeCloudDataForIDs:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if ([(BCCloudReadingNowDetailManager *)self enableCloudSync])
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

    [(BCCloudReadingNowDetailManager *)self removeReadingNowDetailForSaltedHashedRecordIDs:v9 completion:v8];
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
  if ([(BCCloudReadingNowDetailManager *)self enableCloudSync])
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

    [(BCCloudReadingNowDetailManager *)self updateSyncGenerationFromCloudData:v9 completion:v8];
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
  if ([(BCCloudReadingNowDetailManager *)self enableCloudSync])
  {
    id v9 = [(BCCloudReadingNowDetailManager *)self dataManager];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10005EB48;
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
  if ([(BCCloudReadingNowDetailManager *)self enableCloudSync])
  {
    id v9 = [(BCCloudReadingNowDetailManager *)self dataManager];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10005ECBC;
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
  return @"BCReadingNowDetail";
}

- (id)diagnosticEntityInfos:(BOOL)a3
{
  if (a3)
  {
    id v4 = 0;
  }
  else
  {
    id v5 = [(BCCloudReadingNowDetailManager *)self dataManager];
    id v4 = [v5 diagnosticDirtyCloudDataInfos];
  }
  id v6 = [BDSCloudSyncDiagnosticEntityInfo alloc];
  id v7 = [(BCCloudReadingNowDetailManager *)self entityName];
  id v8 = [(BDSCloudSyncDiagnosticEntityInfo *)v6 initWithName:v7 enabledSync:[(BCCloudReadingNowDetailManager *)self enableCloudSync] dirtyCloudDataInfos:v4];

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
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "\"\\\"BCCloudReadingNowDetailManager #enableCloudSync setEnableCloudSync %@\\\"\"", (uint8_t *)&v15, 0xCu);
    }
  }
  if (self->_enableCloudSync != v3)
  {
    self->_enableCloudSync = v3;
    if (v3)
    {
      id v9 = [(BCCloudReadingNowDetailManager *)self cloudKitController];
      id v10 = [v9 privateCloudDatabaseController];
      [v10 addObserver:self->_syncManager recordType:@"readingNowDetail"];

      id v11 = [(BCCloudReadingNowDetailManager *)self cloudKitController];
      id v12 = [v11 transactionManager];
      id v13 = [(BCCloudReadingNowDetailManager *)self entityName];
      v14 = [(BCCloudReadingNowDetailManager *)self syncManager];
      [v12 signalSyncToCKTransactionForEntityName:v13 syncManager:v14];
    }
    else
    {
      id v11 = +[BCCloudKitController sharedInstance];
      id v12 = [v11 privateCloudDatabaseController];
      [v12 removeObserver:self->_syncManager recordType:@"readingNowDetail"];
    }
  }
}

- (void)hasSaltChangedWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(BCCloudReadingNowDetailManager *)self dataManager];
  [v5 hasSaltChangedWithCompletion:v4];
}

- (void)dissociateCloudDataFromSyncWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(BCCloudReadingNowDetailManager *)self dataManager];
  [v5 dissociateCloudDataFromSyncWithCompletion:v4];
}

- (void)setReadingNowDetails:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = sub_10005F3C0;
  v26 = sub_10005F3D0;
  id v27 = +[NSMutableDictionary dictionary];
  CFStringRef v8 = [(BCCloudReadingNowDetailManager *)self readingNowDetailDataSource];
  id v9 = [v8 managedObjectContext];

  if (!v9)
  {
    id v10 = sub_1000083A0();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      sub_1001E8B44(v10);
    }
  }
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10005F3D8;
  v19[3] = &unk_1002609E8;
  id v11 = v6;
  id v20 = v11;
  long long v21 = &v22;
  [v9 performBlockAndWait:v19];
  if ([(id)v23[5] count])
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10005F61C;
    v18[3] = &unk_100261A50;
    v18[4] = &v22;
    id v12 = objc_retainBlock(v18);
    CFStringRef v28 = @"WidgetInfoRelationshipUpdater";
    id v13 = objc_retainBlock(v12);
    v29 = v13;
    v14 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
  }
  else
  {
    v14 = 0;
  }
  int v15 = [(BCCloudReadingNowDetailManager *)self dataManager];
  CFStringRef v16 = [v11 allKeys];
  id v17 = +[NSPredicate predicateWithFormat:@"assetID IN %@", v16];
  [v15 setCloudData:v11 predicate:v17 propertyIDKey:@"assetID" mergers:v14 completion:v7];

  _Block_object_dispose(&v22, 8);
}

- (void)removeReadingNowDetailForSaltedHashedRecordIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    CFStringRef v8 = [(BCCloudReadingNowDetailManager *)self dataManager];
    id v9 = +[NSPredicate predicateWithFormat:@"saltedHashedID IN %@", v6];
    [v8 removeCloudDataForPredicate:v9 completion:v7];
  }
  else
  {
    id v10 = sub_1000083A0();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1001E8C00(v10);
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
  id v10 = [(BCCloudReadingNowDetailManager *)self dataManager];
  CFStringRef v8 = [v7 allKeys];
  id v9 = +[NSPredicate predicateWithFormat:@"assetID IN %@", v8];
  [v10 updateSyncGenerationFromCloudData:v7 predicate:v9 propertyIDKey:@"assetID" completion:v6];
}

- (void)deleteReadingNowDetailForAssetID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(BCCloudReadingNowDetailManager *)self dataManager];
  CFStringRef v8 = +[NSPredicate predicateWithFormat:@"assetID = %@", v7];

  [v9 deleteCloudDataForPredicate:v8 completion:v6];
}

- (void)readingNowDetailsForAssetIDs:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(BCCloudReadingNowDetailManager *)self dataManager];
  CFStringRef v8 = +[NSPredicate predicateWithFormat:@"assetID IN %@ AND (deletedFlag == NULL OR deletedFlag == NO)", v7];

  [v9 cloudDatasWithPredicate:v8 completion:v6];
}

- (void)getReadingNowDetailChangesSince:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(BCCloudReadingNowDetailManager *)self dataManager];
  [v8 getChangesSince:v7 forEntityClass:objc_opt_class() completion:v6];
}

- (void)trackedRreadingNowDetailsInDescendingOrderMaximumResultCount:(unint64_t)a3 filter:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(BCCloudReadingNowDetailManager *)self dataManager];
  id v11 = +[NSPredicate predicateWithFormat:@"isTrackedAsRecent == YES"];
  id v12 = +[NSSortDescriptor sortDescriptorWithKey:@"lastEngagedDate" ascending:0];
  id v20 = v12;
  id v13 = +[NSArray arrayWithObjects:&v20 count:1];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10005FC98;
  v18[3] = &unk_100261A78;
  id v19 = v8;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10005FCA8;
  v16[3] = &unk_1002618B0;
  id v17 = v9;
  id v14 = v9;
  id v15 = v8;
  [v10 cloudDatasWithPredicate:v11 sortDescriptors:v13 maximumResultCount:a3 filter:v18 completion:v16];
}

- (void)getRecentBooksExcludingAssetIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSPredicate predicateWithFormat:@"isTrackedAsRecent == YES"];
  if ([v6 count])
  {
    id v9 = +[NSPredicate predicateWithFormat:@"NOT (assetID IN %@)", v6];
    v21[0] = v9;
    v21[1] = v8;
    id v10 = +[NSArray arrayWithObjects:v21 count:2];
    uint64_t v11 = +[NSCompoundPredicate andPredicateWithSubpredicates:v10];

    id v8 = (void *)v11;
  }
  id v12 = sub_1000083A0();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v18 = v6;
    __int16 v19 = 2112;
    id v20 = v8;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[Widget] getRecentBooksExcludingAssetIDs:%@ predicate %@ ", buf, 0x16u);
  }

  id v13 = [(BCCloudReadingNowDetailManager *)self dataManager];
  id v14 = +[NSSortDescriptor sortDescriptorWithKey:@"lastEngagedDate" ascending:0];
  CFStringRef v16 = v14;
  id v15 = +[NSArray arrayWithObjects:&v16 count:1];
  [v13 cloudDatasWithPredicate:v8 sortDescriptors:v15 maximumResultCount:64 filter:&stru_100261AB8 completion:v7];
}

- (void)needsReadingNowAssetTypePopulation:(id)a3
{
  id v4 = a3;
  id v5 = +[NSPredicate predicateWithFormat:@"(%K == NULL OR %K == %@)", @"cloudAssetType", @"cloudAssetType", &stru_10026BED0];
  id v6 = [(BCCloudReadingNowDetailManager *)self dataManager];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100060058;
  v9[3] = &unk_100261AE0;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  [v6 cloudDatasWithPredicate:v8 completion:v9];
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

- (BCCloudDataSource)readingNowDetailDataSource
{
  return self->_readingNowDetailDataSource;
}

- (void)setReadingNowDetailDataSource:(id)a3
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
  objc_storeStrong((id *)&self->_readingNowDetailDataSource, 0);
  objc_destroyWeak((id *)&self->_cloudKitController);
}

@end