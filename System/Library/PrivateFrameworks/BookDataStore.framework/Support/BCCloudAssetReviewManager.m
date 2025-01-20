@interface BCCloudAssetReviewManager
- (BCCloudAssetReviewManager)initWithCloudDataSource:(id)a3 cloudKitController:(id)a4;
- (BCCloudDataManager)dataManager;
- (BCCloudDataSource)assetReviewDataSource;
- (BCCloudDataSyncManager)syncManager;
- (BCCloudKitController)cloudKitController;
- (BOOL)enableCloudSync;
- (id)entityName;
- (void)assetReviewForAssetReviewID:(id)a3 completion:(id)a4;
- (void)assetReviewsForAssetReviewIDs:(id)a3 completion:(id)a4;
- (void)deleteAssetReviewForAssetReviewID:(id)a3 completion:(id)a4;
- (void)deleteAssetReviewForAssetReviewIDs:(id)a3 completion:(id)a4;
- (void)dissociateCloudDataFromSyncWithCompletion:(id)a3;
- (void)fetchAssetReviewsForUserID:(id)a3 includingDeleted:(BOOL)a4 completion:(id)a5;
- (void)getAssetReviewChangesSince:(id)a3 completion:(id)a4;
- (void)hasSaltChangedWithCompletion:(id)a3;
- (void)removeAssetReviewsForSaltedHashedRecordIDs:(id)a3 completion:(id)a4;
- (void)setAssetReview:(id)a3 completion:(id)a4;
- (void)setAssetReviewDataSource:(id)a3;
- (void)setAssetReviews:(id)a3 completion:(id)a4;
- (void)setCloudKitController:(id)a3;
- (void)setDataManager:(id)a3;
- (void)setEnableCloudSync:(BOOL)a3;
- (void)setSyncManager:(id)a3;
- (void)signalSyncToCKForSyncManager:(id)a3;
- (void)syncManager:(id)a3 failedRecordIDs:(id)a4 completion:(id)a5;
- (void)syncManager:(id)a3 removeCloudDataForIDs:(id)a4 completion:(id)a5;
- (void)syncManager:(id)a3 resolveConflictsForRecords:(id)a4 completion:(id)a5;
- (void)syncManager:(id)a3 startSyncToCKWithCompletion:(id)a4;
- (void)syncManager:(id)a3 updateSyncGenerationFromCloudData:(id)a4 completion:(id)a5;
- (void)updateSyncGenerationFromCloudData:(id)a3 completion:(id)a4;
@end

@implementation BCCloudAssetReviewManager

- (BCCloudAssetReviewManager)initWithCloudDataSource:(id)a3 cloudKitController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)BCCloudAssetReviewManager;
  v9 = [(BCCloudAssetReviewManager *)&v22 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_assetReviewDataSource, a3);
    objc_storeWeak((id *)&v10->_cloudKitController, v8);
    v11 = [[BCCloudDataSyncManager alloc] initWithCloudKitController:v8];
    syncManager = v10->_syncManager;
    v10->_syncManager = v11;

    [(BCCloudDataSyncManager *)v10->_syncManager setDelegate:v10];
    v13 = [BCCloudDataManager alloc];
    v14 = [(BCCloudAssetReviewManager *)v10 entityName];
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    v17 = v10->_syncManager;
    id WeakRetained = objc_loadWeakRetained((id *)&v10->_cloudKitController);
    v19 = [(BCCloudDataManager *)v13 initWithCloudDataSource:v7 entityName:v14 notificationName:@"BCCloudAssetReviewManagerChanged" immutableClass:v15 mutableClass:v16 syncManager:v17 cloudKitController:WeakRetained];
    dataManager = v10->_dataManager;
    v10->_dataManager = v19;
  }
  return v10;
}

- (void)syncManager:(id)a3 startSyncToCKWithCompletion:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if ([(BCCloudAssetReviewManager *)self enableCloudSync])
  {
    id v7 = [(BCCloudAssetReviewManager *)self dataManager];
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
  if ([(BCCloudAssetReviewManager *)self enableCloudSync])
  {
    id v7 = [(BCCloudAssetReviewManager *)self cloudKitController];
    v4 = [v7 transactionManager];
    v5 = [(BCCloudAssetReviewManager *)self entityName];
    id v6 = [(BCCloudAssetReviewManager *)self syncManager];
    [v4 signalSyncToCKTransactionForEntityName:v5 syncManager:v6];
  }
}

- (void)syncManager:(id)a3 removeCloudDataForIDs:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if ([(BCCloudAssetReviewManager *)self enableCloudSync])
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

    [(BCCloudAssetReviewManager *)self removeAssetReviewsForSaltedHashedRecordIDs:v9 completion:v8];
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
  if ([(BCCloudAssetReviewManager *)self enableCloudSync])
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
          id v16 = objc_msgSend(v15, "assetReviewID", (void)v19);
          [v9 setObject:v15 forKey:v16];
        }
        id v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v12);
    }

    [(BCCloudAssetReviewManager *)self updateSyncGenerationFromCloudData:v9 completion:v8];
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
  if ([(BCCloudAssetReviewManager *)self enableCloudSync])
  {
    id v9 = [(BCCloudAssetReviewManager *)self dataManager];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100063648;
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
  if ([(BCCloudAssetReviewManager *)self enableCloudSync])
  {
    id v9 = [(BCCloudAssetReviewManager *)self dataManager];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000637BC;
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
  return @"BCAssetReview";
}

- (void)setEnableCloudSync:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = +[BULogUtilities shared];
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
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "\"\\\"BCCloudAssetReviewManager #enableCloudSync setEnableCloudSync %@\\\"\"", (uint8_t *)&v15, 0xCu);
    }
  }
  if (self->_enableCloudSync != v3)
  {
    self->_enableCloudSync = v3;
    if (v3)
    {
      id v9 = [(BCCloudAssetReviewManager *)self cloudKitController];
      id v10 = [v9 privateCloudDatabaseController];
      [v10 addObserver:self->_syncManager recordType:@"assetReview"];

      id v11 = [(BCCloudAssetReviewManager *)self cloudKitController];
      id v12 = [v11 transactionManager];
      id v13 = [(BCCloudAssetReviewManager *)self entityName];
      v14 = [(BCCloudAssetReviewManager *)self syncManager];
      [v12 signalSyncToCKTransactionForEntityName:v13 syncManager:v14];
    }
    else
    {
      id v11 = +[BCCloudKitController sharedInstance];
      id v12 = [v11 privateCloudDatabaseController];
      [v12 removeObserver:self->_syncManager recordType:@"assetReview"];
    }
  }
}

- (void)hasSaltChangedWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(BCCloudAssetReviewManager *)self dataManager];
  [v5 hasSaltChangedWithCompletion:v4];
}

- (void)dissociateCloudDataFromSyncWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(BCCloudAssetReviewManager *)self dataManager];
  [v5 dissociateCloudDataFromSyncWithCompletion:v4];
}

- (void)setAssetReview:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v10 = [(BCCloudAssetReviewManager *)self dataManager];
  CFStringRef v8 = [v7 assetReviewID];
  id v9 = +[NSPredicate predicateWithFormat:@"assetReviewID = %@", v8];
  [v10 setCloudData:v7 predicate:v9 completion:v6];
}

- (void)setAssetReviews:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v10 = [(BCCloudAssetReviewManager *)self dataManager];
  CFStringRef v8 = [v7 allKeys];
  id v9 = +[NSPredicate predicateWithFormat:@"assetReviewID IN %@", v8];
  [v10 setCloudData:v7 predicate:v9 propertyIDKey:@"assetReviewID" completion:v6];
}

- (void)removeAssetReviewsForSaltedHashedRecordIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    CFStringRef v8 = [(BCCloudAssetReviewManager *)self dataManager];
    id v9 = +[NSPredicate predicateWithFormat:@"saltedHashedID IN %@", v6];
    [v8 removeCloudDataForPredicate:v9 completion:v7];
  }
  else
  {
    CFStringRef v8 = sub_1000083A0();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1001E9018(v8);
    }
  }
}

- (void)updateSyncGenerationFromCloudData:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v10 = [(BCCloudAssetReviewManager *)self dataManager];
  CFStringRef v8 = [v7 allKeys];
  id v9 = +[NSPredicate predicateWithFormat:@"assetReviewID IN %@", v8];
  [v10 updateSyncGenerationFromCloudData:v7 predicate:v9 propertyIDKey:@"assetReviewID" completion:v6];
}

- (void)deleteAssetReviewForAssetReviewID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(BCCloudAssetReviewManager *)self dataManager];
  CFStringRef v8 = +[NSPredicate predicateWithFormat:@"assetReviewID = %@", v7];

  [v9 deleteCloudDataForPredicate:v8 completion:v6];
}

- (void)deleteAssetReviewForAssetReviewIDs:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(BCCloudAssetReviewManager *)self dataManager];
  CFStringRef v8 = +[NSPredicate predicateWithFormat:@"assetReviewID IN %@", v7];

  [v9 deleteCloudDataForPredicate:v8 completion:v6];
}

- (void)assetReviewForAssetReviewID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  CFStringRef v8 = [(BCCloudAssetReviewManager *)self dataManager];
  id v9 = +[NSPredicate predicateWithFormat:@"assetReviewID = %@ AND (deletedFlag == NULL OR deletedFlag == NO)", v7];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100064018;
  v11[3] = &unk_1002617E8;
  id v12 = v6;
  id v10 = v6;
  [v8 cloudDataWithPredicate:v9 sortDescriptors:0 completion:v11];
}

- (void)assetReviewsForAssetReviewIDs:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(BCCloudAssetReviewManager *)self dataManager];
  CFStringRef v8 = +[NSPredicate predicateWithFormat:@"assetReviewID IN %@ AND (deletedFlag == NULL OR deletedFlag == NO)", v7];

  [v9 cloudDatasWithPredicate:v8 completion:v6];
}

- (void)fetchAssetReviewsForUserID:(id)a3 includingDeleted:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  if (v5) {
    CFStringRef v9 = @"userID == %@";
  }
  else {
    CFStringRef v9 = @"(deletedFlag == NULL OR deletedFlag == NO) AND userID == %@";
  }
  +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", v9, a3);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id v10 = [(BCCloudAssetReviewManager *)self dataManager];
  [v10 cloudDatasWithPredicate:v11 completion:v8];
}

- (void)getAssetReviewChangesSince:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(BCCloudAssetReviewManager *)self dataManager];
  [v8 getChangesSince:v7 forEntityClass:objc_opt_class() completion:v6];
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

- (BCCloudDataSource)assetReviewDataSource
{
  return self->_assetReviewDataSource;
}

- (void)setAssetReviewDataSource:(id)a3
{
}

- (BCCloudDataSyncManager)syncManager
{
  return self->_syncManager;
}

- (void)setSyncManager:(id)a3
{
}

- (BCCloudDataManager)dataManager
{
  return self->_dataManager;
}

- (void)setDataManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataManager, 0);
  objc_storeStrong((id *)&self->_syncManager, 0);
  objc_storeStrong((id *)&self->_assetReviewDataSource, 0);
  objc_destroyWeak((id *)&self->_cloudKitController);
}

@end