@interface BCCloudCollectionDetailManager
- (BCCloudCollectionDetailManager)initWithCloudDataSource:(id)a3 cloudKitController:(id)a4;
- (BCCloudCollectionDetailManager)initWithCloudDataSource:(id)a3 cloudKitController:(id)a4 syncProvider:(id)a5;
- (BCCloudDataManager)dataManager;
- (BCCloudDataSource)collectionDetailDataSource;
- (BCCloudDataSyncProvider)syncManager;
- (BCCloudKitController)cloudKitController;
- (BOOL)enableCloudSync;
- (id)diagnosticEntityInfos:(BOOL)a3;
- (id)entityName;
- (id)mutableCloudDataForRecordID:(id)a3;
- (void)_removeCloudDataForIDs:(id)a3 completion:(id)a4;
- (void)collectionDetailForCollectionID:(id)a3 completion:(id)a4;
- (void)collectionDetailsForCollectionIDs:(id)a3 completion:(id)a4;
- (void)currentCollectionDetailCloudSyncVersions:(id)a3;
- (void)deleteCollectionDetailForCollectionID:(id)a3 completion:(id)a4;
- (void)deleteCollectionDetailForCollectionIDs:(id)a3 completion:(id)a4;
- (void)dissociateCloudDataFromSyncWithCompletion:(id)a3;
- (void)fetchCollectionDetailsIncludingDeleted:(BOOL)a3 completion:(id)a4;
- (void)getCollectionDetailChangesSince:(id)a3 completion:(id)a4;
- (void)hasSaltChangedWithCompletion:(id)a3;
- (void)nextBatchOfMutableCloudDataToSaveToCKWithFetchLimit:(unint64_t)a3 completion:(id)a4;
- (void)removeCollectionDetailForSaltedHashedRecordIDs:(id)a3 completion:(id)a4;
- (void)removedCloudRecordsWithIDs:(id)a3 completion:(id)a4;
- (void)setCloudKitController:(id)a3;
- (void)setCollectionDetail:(id)a3 completion:(id)a4;
- (void)setCollectionDetailDataSource:(id)a3;
- (void)setCollectionDetails:(id)a3 completion:(id)a4;
- (void)setDataManager:(id)a3;
- (void)setEnableCloudSync:(BOOL)a3;
- (void)setEnableCloudSync:(BOOL)a3 completion:(id)a4;
- (void)setSyncManager:(id)a3;
- (void)signalSyncToCKForSyncManager:(id)a3;
- (void)syncManager:(id)a3 failedRecordIDs:(id)a4 completion:(id)a5;
- (void)syncManager:(id)a3 removeCloudDataForIDs:(id)a4 completion:(id)a5;
- (void)syncManager:(id)a3 resolveConflictsForRecords:(id)a4 completion:(id)a5;
- (void)syncManager:(id)a3 startSyncToCKWithCompletion:(id)a4;
- (void)syncManager:(id)a3 updateSyncGenerationFromCloudData:(id)a4 completion:(id)a5;
- (void)syncProvider:(id)a3 failedRecordIDs:(id)a4 completion:(id)a5;
- (void)syncProvider:(id)a3 removeCloudDataForIDs:(id)a4 completion:(id)a5;
- (void)syncProvider:(id)a3 resolveConflictsForRecords:(id)a4 completion:(id)a5;
- (void)syncProvider:(id)a3 updateSyncGenerationFromCloudData:(id)a4 completion:(id)a5;
- (void)updateSyncGenerationFromCloudData:(id)a3 completion:(id)a4;
- (void)updatedCloudRecords:(id)a3 completion:(id)a4;
@end

@implementation BCCloudCollectionDetailManager

- (void)getCollectionDetailChangesSince:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(BCCloudCollectionDetailManager *)self dataManager];
  [v8 getChangesSince:v7 forEntityClass:objc_opt_class() completion:v6];
}

- (BCCloudDataManager)dataManager
{
  return self->_dataManager;
}

- (void)currentCollectionDetailCloudSyncVersions:(id)a3
{
  id v4 = a3;
  id v5 = [(BCCloudCollectionDetailManager *)self dataManager];
  [v5 currentCloudSyncVersions:v4];
}

- (BCCloudCollectionDetailManager)initWithCloudDataSource:(id)a3 cloudKitController:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[_TtC14bookdatastored21BDSSyncEnginePipeline alloc] initWithRecordType:@"collectionDetail" zoneName:@"CollectionZone" delegate:self];
  v9 = [(BCCloudCollectionDetailManager *)self initWithCloudDataSource:v7 cloudKitController:v6 syncProvider:v8];

  return v9;
}

- (BCCloudCollectionDetailManager)initWithCloudDataSource:(id)a3 cloudKitController:(id)a4 syncProvider:(id)a5
{
  id v22 = a3;
  id v9 = a4;
  id v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)BCCloudCollectionDetailManager;
  v11 = [(BCCloudCollectionDetailManager *)&v23 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_collectionDetailDataSource, a3);
    objc_storeStrong((id *)&v12->_syncManager, a5);
    objc_storeWeak((id *)&v12->_cloudKitController, v9);
    v13 = [BCCloudDataManager alloc];
    v14 = [(BCCloudCollectionDetailManager *)v12 entityName];
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    v17 = [(BCCloudCollectionDetailManager *)v12 syncManager];
    v18 = [v10 privacyDelegate];
    v19 = [(BCCloudDataManager *)v13 initWithCloudDataSource:v22 entityName:v14 notificationName:@"BCCloudCollectionDetailManagerChanged" immutableClass:v15 mutableClass:v16 syncManager:v17 cloudKitController:v9 privacyDelegate:v18];
    dataManager = v12->_dataManager;
    v12->_dataManager = v19;
  }
  return v12;
}

- (void)updatedCloudRecords:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BCCloudCollectionDetailManager *)self dataManager];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100075F08;
  v11[3] = &unk_100261FD0;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 resolveConflictsForRecords:v10 completion:v11];
}

- (void)removedCloudRecordsWithIDs:(id)a3 completion:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100076048;
  v7[3] = &unk_100260DE0;
  id v8 = a4;
  id v6 = v8;
  [(BCCloudCollectionDetailManager *)self _removeCloudDataForIDs:a3 completion:v7];
}

- (id)mutableCloudDataForRecordID:(id)a3
{
  id v4 = [a3 recordName];
  id v5 = +[NSPredicate predicateWithFormat:@"saltedHashedID = %@", v4];
  id v6 = [(BCCloudCollectionDetailManager *)self dataManager];
  id v7 = [v6 mutableCloudDataWithPredicate:v5 sortDescriptors:0];

  return v7;
}

- (void)nextBatchOfMutableCloudDataToSaveToCKWithFetchLimit:(unint64_t)a3 completion:(id)a4
{
  id v8 = a4;
  if ([(BCCloudCollectionDetailManager *)self enableCloudSync])
  {
    id v6 = [(BCCloudCollectionDetailManager *)self dataManager];
    [v6 dirtyMutableCloudDataWithFetchLimit:a3 completion:v8];
  }
  else
  {
    id v7 = objc_retainBlock(v8);
    id v6 = v7;
    if (v7) {
      (*((void (**)(id, void))v7 + 2))(v7, 0);
    }
  }
}

- (void)syncManager:(id)a3 startSyncToCKWithCompletion:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if ([(BCCloudCollectionDetailManager *)self enableCloudSync])
  {
    id v7 = [(BCCloudCollectionDetailManager *)self dataManager];
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
  id v7 = a3;
  if ([(BCCloudCollectionDetailManager *)self enableCloudSync])
  {
    id v4 = [(BCCloudCollectionDetailManager *)self cloudKitController];
    id v5 = [v4 transactionManager];
    id v6 = [(BCCloudCollectionDetailManager *)self entityName];
    [v5 signalSyncToCKTransactionForEntityName:v6 syncManager:v7];
  }
}

- (void)syncManager:(id)a3 removeCloudDataForIDs:(id)a4 completion:(id)a5
{
}

- (void)syncProvider:(id)a3 removeCloudDataForIDs:(id)a4 completion:(id)a5
{
}

- (void)_removeCloudDataForIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(BCCloudCollectionDetailManager *)self enableCloudSync])
  {
    id v8 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v6 count]);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v9 = v6;
    id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v18;
      do
      {
        id v13 = 0;
        do
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * (void)v13), "recordName", (void)v17);
          [v8 addObject:v14];

          id v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v11);
    }

    [(BCCloudCollectionDetailManager *)self removeCollectionDetailForSaltedHashedRecordIDs:v8 completion:v7];
  }
  else
  {
    id v15 = objc_retainBlock(v7);
    uint64_t v16 = v15;
    if (v15) {
      (*((void (**)(id, void, void))v15 + 2))(v15, 0, 0);
    }
  }
}

- (void)syncManager:(id)a3 updateSyncGenerationFromCloudData:(id)a4 completion:(id)a5
{
}

- (void)syncProvider:(id)a3 updateSyncGenerationFromCloudData:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if ([(BCCloudCollectionDetailManager *)self enableCloudSync])
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
          id v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          uint64_t v16 = objc_msgSend(v15, "collectionID", (void)v19);
          [v9 setObject:v15 forKey:v16];
        }
        id v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v12);
    }

    [(BCCloudCollectionDetailManager *)self updateSyncGenerationFromCloudData:v9 completion:v8];
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
}

- (void)syncProvider:(id)a3 resolveConflictsForRecords:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if ([(BCCloudCollectionDetailManager *)self enableCloudSync])
  {
    id v9 = [(BCCloudCollectionDetailManager *)self dataManager];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100076780;
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
}

- (void)syncProvider:(id)a3 failedRecordIDs:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if ([(BCCloudCollectionDetailManager *)self enableCloudSync])
  {
    id v9 = [(BCCloudCollectionDetailManager *)self dataManager];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000768F8;
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
  return @"BCCollectionDetail";
}

- (id)diagnosticEntityInfos:(BOOL)a3
{
  if (a3)
  {
    id v4 = 0;
  }
  else
  {
    id v5 = [(BCCloudCollectionDetailManager *)self dataManager];
    id v4 = [v5 diagnosticDirtyCloudDataInfos];
  }
  id v6 = [BDSCloudSyncDiagnosticEntityInfo alloc];
  id v7 = [(BCCloudCollectionDetailManager *)self entityName];
  id v8 = [(BDSCloudSyncDiagnosticEntityInfo *)v6 initWithName:v7 enabledSync:[(BCCloudCollectionDetailManager *)self enableCloudSync] dirtyCloudDataInfos:v4];

  id v11 = v8;
  id v9 = +[NSArray arrayWithObjects:&v11 count:1];

  return v9;
}

- (void)setEnableCloudSync:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = +[BULogUtilities shared];
  unsigned int v8 = [v7 verboseLoggingEnabled];

  if (v8)
  {
    id v9 = sub_10000CD80();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v10 = @"NO";
      if (v4) {
        CFStringRef v10 = @"YES";
      }
      int v15 = 138412290;
      CFStringRef v16 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "\"\\\"BCCloudCollectionDetailManager #enableCloudSync setEnableCloudSync %@\\\"\"", (uint8_t *)&v15, 0xCu);
    }
  }
  if (self->_enableCloudSync != v4)
  {
    self->_enableCloudSync = v4;
    if (v4)
    {
      if (v6)
      {
        id v11 = [(BCCloudCollectionDetailManager *)self cloudKitController];
        id v12 = [v11 transactionManager];
        id v13 = [(BCCloudCollectionDetailManager *)self entityName];
        v14 = [(BCCloudCollectionDetailManager *)self syncManager];
        [v12 signalSyncToCKTransactionForEntityName:v13 syncManager:v14 completion:v6];
      }
      else
      {
        id v11 = [(BCCloudCollectionDetailManager *)self syncManager];
        [v11 signalSyncToCK];
      }
    }
  }
}

- (void)setEnableCloudSync:(BOOL)a3
{
}

- (void)hasSaltChangedWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(BCCloudCollectionDetailManager *)self dataManager];
  [v5 hasSaltChangedWithCompletion:v4];
}

- (void)dissociateCloudDataFromSyncWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(BCCloudCollectionDetailManager *)self dataManager];
  [v5 dissociateCloudDataFromSyncWithCompletion:v4];
}

- (void)setCollectionDetail:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v10 = [(BCCloudCollectionDetailManager *)self dataManager];
  unsigned int v8 = [v7 collectionID];
  id v9 = +[NSPredicate predicateWithFormat:@"collectionID = %@", v8];
  [v10 setCloudData:v7 predicate:v9 completion:v6];
}

- (void)setCollectionDetails:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v10 = [(BCCloudCollectionDetailManager *)self dataManager];
  unsigned int v8 = [v7 allKeys];
  id v9 = +[NSPredicate predicateWithFormat:@"collectionID IN %@", v8];
  [v10 setCloudData:v7 predicate:v9 propertyIDKey:@"collectionID" completion:v6];
}

- (void)removeCollectionDetailForSaltedHashedRecordIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    unsigned int v8 = [(BCCloudCollectionDetailManager *)self dataManager];
    id v9 = +[NSPredicate predicateWithFormat:@"saltedHashedID IN %@", v6];
    [v8 removeCloudDataForPredicate:v9 completion:v7];
  }
  else
  {
    id v10 = sub_1000083A0();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1001EA380(v10);
    }

    unsigned int v8 = (void (**)(void, void, void))objc_retainBlock(v7);
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
  id v10 = [(BCCloudCollectionDetailManager *)self dataManager];
  unsigned int v8 = [v7 allKeys];
  id v9 = +[NSPredicate predicateWithFormat:@"collectionID IN %@", v8];
  [v10 updateSyncGenerationFromCloudData:v7 predicate:v9 propertyIDKey:@"collectionID" completion:v6];
}

- (void)deleteCollectionDetailForCollectionID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(BCCloudCollectionDetailManager *)self dataManager];
  unsigned int v8 = +[NSPredicate predicateWithFormat:@"collectionID = %@", v7];

  [v9 deleteCloudDataForPredicate:v8 completion:v6];
}

- (void)deleteCollectionDetailForCollectionIDs:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(BCCloudCollectionDetailManager *)self dataManager];
  unsigned int v8 = +[NSPredicate predicateWithFormat:@"collectionID IN %@", v7];

  [v9 deleteCloudDataForPredicate:v8 completion:v6];
}

- (void)collectionDetailForCollectionID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unsigned int v8 = [(BCCloudCollectionDetailManager *)self dataManager];
  id v9 = +[NSPredicate predicateWithFormat:@"collectionID = %@ AND (deletedFlag == NULL OR deletedFlag == NO)", v7];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100077284;
  v11[3] = &unk_1002617E8;
  id v12 = v6;
  id v10 = v6;
  [v8 cloudDataWithPredicate:v9 sortDescriptors:0 completion:v11];
}

- (void)collectionDetailsForCollectionIDs:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(BCCloudCollectionDetailManager *)self dataManager];
  unsigned int v8 = +[NSPredicate predicateWithFormat:@"collectionID IN %@ AND (deletedFlag == NULL OR deletedFlag == NO)", v7];

  [v9 cloudDatasWithPredicate:v8 completion:v6];
}

- (void)fetchCollectionDetailsIncludingDeleted:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(BCCloudCollectionDetailManager *)self dataManager];
  [v7 fetchCloudDataIncludingDeleted:v4 completion:v6];
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

- (BCCloudDataSource)collectionDetailDataSource
{
  return self->_collectionDetailDataSource;
}

- (void)setCollectionDetailDataSource:(id)a3
{
}

- (BCCloudDataSyncProvider)syncManager
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
  objc_storeStrong((id *)&self->_collectionDetailDataSource, 0);
  objc_destroyWeak((id *)&self->_cloudKitController);
}

@end