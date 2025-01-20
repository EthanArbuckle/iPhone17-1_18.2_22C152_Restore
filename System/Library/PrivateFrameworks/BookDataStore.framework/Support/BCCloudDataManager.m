@interface BCCloudDataManager
- (BCCloudDataManager)initWithCloudDataSource:(id)a3 entityName:(id)a4 notificationName:(id)a5 immutableClass:(Class)a6 mutableClass:(Class)a7 syncManager:(id)a8 cloudKitController:(id)a9;
- (BCCloudDataManager)initWithCloudDataSource:(id)a3 entityName:(id)a4 notificationName:(id)a5 immutableClass:(Class)a6 mutableClass:(Class)a7 syncManager:(id)a8 cloudKitController:(id)a9 dataMapper:(id)a10;
- (BCCloudDataManager)initWithCloudDataSource:(id)a3 entityName:(id)a4 notificationName:(id)a5 immutableClass:(Class)a6 mutableClass:(Class)a7 syncManager:(id)a8 cloudKitController:(id)a9 dataMapper:(id)a10 privacyDelegate:(id)a11;
- (BCCloudDataManager)initWithCloudDataSource:(id)a3 entityName:(id)a4 notificationName:(id)a5 immutableClass:(Class)a6 mutableClass:(Class)a7 syncManager:(id)a8 cloudKitController:(id)a9 privacyDelegate:(id)a10;
- (BCCloudDataMapper)dataMapper;
- (BCCloudDataPrivacyDelegate)privacyDelegate;
- (BCCloudDataSource)dataSource;
- (BCCloudDataSyncProvider)syncManager;
- (BCCloudKitController)cloudKitController;
- (BDSCloudDataManagerMonitor)monitor;
- (BOOL)_isTokenInvalidError:(id)a3;
- (BOOL)signalDataChangedTransaction;
- (Class)immutableClass;
- (Class)mutableClass;
- (NSManagedObjectContext)moc;
- (NSString)entityName;
- (NSString)notificationName;
- (OS_dispatch_queue)responseQueue;
- (id)_fetchHistoryAfterToken:(id)a3 inMoc:(id)a4 error:(id *)a5;
- (id)diagnosticDirtyCloudDataInfos;
- (id)mq_cloudSyncVersions;
- (id)mq_sanitizeError:(id)a3;
- (id)mutableCloudDataWithPredicate:(id)a3 sortDescriptors:(id)a4;
- (void)_dirtyMutableCloudDataWithFetchLimit:(unint64_t)a3 synchronous:(BOOL)a4 completion:(id)a5;
- (void)_logError:(id)a3 at:(id)a4;
- (void)cloudDataWithPredicate:(id)a3 sortDescriptors:(id)a4 completion:(id)a5;
- (void)cloudDatasWithPredicate:(id)a3 completion:(id)a4;
- (void)cloudDatasWithPredicate:(id)a3 sortDescriptors:(id)a4 maximumResultCount:(unint64_t)a5 filter:(id)a6 completion:(id)a7;
- (void)countWithPredicate:(id)a3 completion:(id)a4;
- (void)currentCloudSyncVersions:(id)a3;
- (void)deleteCloudDataForPredicate:(id)a3 completion:(id)a4;
- (void)dirtyMutableCloudDataWithFetchLimit:(unint64_t)a3 completion:(id)a4;
- (void)dissociateCloudDataFromSyncWithCompletion:(id)a3;
- (void)failedRecordIDs:(id)a3 completion:(id)a4;
- (void)fetchCloudDataIncludingDeleted:(BOOL)a3 completion:(id)a4;
- (void)getChangesSince:(id)a3 forEntityClass:(Class)a4 completion:(id)a5;
- (void)hasSaltChangedWithCompletion:(id)a3;
- (void)mq_incrementCloudVersion;
- (void)mq_signalTransactions;
- (void)mutableCloudDataWithPredicate:(id)a3 sortDescriptors:(id)a4 synchronous:(BOOL)a5 completion:(id)a6;
- (void)removeCloudDataForPredicate:(id)a3 completion:(id)a4;
- (void)resolveConflictsForRecords:(id)a3 completion:(id)a4;
- (void)resolveConflictsForRecords:(id)a3 withResolvers:(id)a4 completion:(id)a5;
- (void)resolveConflictsForRecords:(id)a3 withResolvers:(id)a4 mergers:(id)a5 completion:(id)a6;
- (void)resolvedCloudDataForCloudData:(id)a3 predicate:(id)a4 completion:(id)a5;
- (void)resolvedCloudDataForCloudData:(id)a3 withResolvers:(id)a4 mergers:(id)a5 predicate:(id)a6 completion:(id)a7;
- (void)resolvedCloudDataForCloudData:(id)a3 withResolvers:(id)a4 predicate:(id)a5 completion:(id)a6;
- (void)setCloudData:(id)a3 predicate:(id)a4 completion:(id)a5;
- (void)setCloudData:(id)a3 predicate:(id)a4 isEqualCheckIgnoringEmptySalt:(BOOL)a5 completion:(id)a6;
- (void)setCloudData:(id)a3 predicate:(id)a4 mergers:(id)a5 completion:(id)a6;
- (void)setCloudData:(id)a3 predicate:(id)a4 mergers:(id)a5 isEqualCheckIgnoringEmptySalt:(BOOL)a6 completion:(id)a7;
- (void)setCloudData:(id)a3 predicate:(id)a4 propertyIDKey:(id)a5 completion:(id)a6;
- (void)setCloudData:(id)a3 predicate:(id)a4 propertyIDKey:(id)a5 isEqualCheckIgnoringEmptySalt:(BOOL)a6 completion:(id)a7;
- (void)setCloudData:(id)a3 predicate:(id)a4 propertyIDKey:(id)a5 mergers:(id)a6 completion:(id)a7;
- (void)setCloudData:(id)a3 predicate:(id)a4 propertyIDKey:(id)a5 mergers:(id)a6 isEqualCheckIgnoringEmptySalt:(BOOL)a7 completion:(id)a8;
- (void)setCloudKitController:(id)a3;
- (void)setDataMapper:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setEntityName:(id)a3;
- (void)setImmutableClass:(Class)a3;
- (void)setMoc:(id)a3;
- (void)setMonitor:(id)a3;
- (void)setMutableClass:(Class)a3;
- (void)setNotificationName:(id)a3;
- (void)setPrivacyDelegate:(id)a3;
- (void)setResponseQueue:(id)a3;
- (void)setSignalDataChangedTransaction:(BOOL)a3;
- (void)setSyncManager:(id)a3;
- (void)startSyncToCKWithSyncManager:(id)a3 completion:(id)a4;
- (void)transformedCloudDatasWithPredicate:(id)a3 transformer:(id)a4 limit:(int64_t)a5 completion:(id)a6;
- (void)updateSyncGenerationFromCloudData:(id)a3 predicate:(id)a4 propertyIDKey:(id)a5 completion:(id)a6;
@end

@implementation BCCloudDataManager

- (void)getChangesSince:(id)a3 forEntityClass:(Class)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = +[BULogUtilities shared];
  unsigned int v11 = [v10 verboseLoggingEnabled];

  if (v11)
  {
    v12 = sub_10000CD80();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = [(BCCloudDataManager *)self entityName];
      *(_DWORD *)buf = 138412546;
      v26 = v13;
      __int16 v27 = 2112;
      id v28 = v8;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "\"\\\"BCCloudDataManager %@ getChangesSince cloudSyncVersions:%@\\\"\"", buf, 0x16u);
    }
  }
  v14 = [(BCCloudDataManager *)self moc];
  BOOL v15 = v14 == 0;

  if (v15)
  {
    v17 = [(BCCloudDataManager *)self responseQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10004C110;
    block[3] = &unk_10025FF28;
    block[4] = self;
    id v24 = v9;
    dispatch_async(v17, block);
  }
  else
  {
    objc_initWeak((id *)buf, self);
    v16 = [(BCCloudDataManager *)self moc];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100007AF4;
    v18[3] = &unk_1002612E8;
    objc_copyWeak(v22, (id *)buf);
    id v19 = v8;
    v20 = self;
    v22[1] = a4;
    id v21 = v9;
    [v16 performBlock:v18];

    objc_destroyWeak(v22);
    objc_destroyWeak((id *)buf);
  }
}

- (void)mutableCloudDataWithPredicate:(id)a3 sortDescriptors:(id)a4 synchronous:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = [(BCCloudDataManager *)self moc];

  if (v13)
  {
    if (v12)
    {
      objc_initWeak(&location, self);
      v17 = _NSConcreteStackBlock;
      uint64_t v18 = 3221225472;
      id v19 = sub_100008A5C;
      v20 = &unk_1002611D0;
      objc_copyWeak(&v24, &location);
      id v21 = v10;
      id v22 = v11;
      id v23 = v12;
      v14 = objc_retainBlock(&v17);
      BOOL v15 = [(BCCloudDataManager *)self moc];
      if (v7) {
        [v15 performBlockAndWait:v14];
      }
      else {
        [v15 performBlock:v14];
      }

      objc_destroyWeak(&v24);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    v16 = [(BCCloudDataManager *)self responseQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100048D70;
    block[3] = &unk_100260330;
    id v27 = v12;
    dispatch_async(v16, block);
  }
}

- (void)cloudDataWithPredicate:(id)a3 sortDescriptors:(id)a4 completion:(id)a5
{
}

- (NSString)entityName
{
  return self->_entityName;
}

- (BCCloudDataPrivacyDelegate)privacyDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_privacyDelegate);
  return (BCCloudDataPrivacyDelegate *)WeakRetained;
}

- (BOOL)signalDataChangedTransaction
{
  return self->_signalDataChangedTransaction;
}

- (id)mq_sanitizeError:(id)a3
{
  if (a3)
  {
    v11[0] = @"CoreDataError";
    v10[0] = NSDebugDescriptionErrorKey;
    v10[1] = @"domain";
    id v3 = a3;
    v4 = [v3 domain];
    v11[1] = v4;
    v10[2] = @"code";
    id v5 = [v3 code];

    v6 = +[NSNumber numberWithInteger:v5];
    v11[2] = v6;
    BOOL v7 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:3];

    id v8 = +[NSError errorWithDomain:@"BDSErrorDomain" code:1002 userInfo:v7];
  }
  else
  {
    id v8 = 0;
  }
  return v8;
}

- (id)mq_cloudSyncVersions
{
  id v3 = [(BCCloudDataManager *)self moc];
  id v4 = [objc_alloc((Class)NSFetchRequest) initWithEntityName:@"BCCloudSyncVersions"];
  [v4 setReturnsObjectsAsFaults:0];
  [v4 setFetchLimit:1];
  id v5 = [(BCCloudDataManager *)self entityName];
  v6 = +[NSPredicate predicateWithFormat:@"dataType == %@", v5];
  [v4 setPredicate:v6];

  id v12 = 0;
  BOOL v7 = [v3 executeFetchRequest:v4 error:&v12];
  id v8 = v12;
  [(BCCloudDataManager *)self _logError:v8 at:@"mq_cloudSyncVersions"];
  id v9 = [v7 firstObject];
  if (!v9)
  {
    id v9 = +[NSEntityDescription insertNewObjectForEntityForName:@"BCCloudSyncVersions" inManagedObjectContext:v3];
    id v10 = [(BCCloudDataManager *)self entityName];
    [v9 setDataType:v10];
  }
  return v9;
}

- (void)_logError:(id)a3 at:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    BOOL v7 = sub_1000083A0();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1001E71D8();
    }
  }
}

- (id)_fetchHistoryAfterToken:(id)a3 inMoc:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = sub_1000083A0();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = [(BCCloudDataManager *)self entityName];
    *(_DWORD *)buf = 138543618;
    id v19 = v11;
    __int16 v20 = 2114;
    id v21 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "BCCloudDataManager %{public}@ getChangesSince _fetchHistoryAfterToken: %{public}@", buf, 0x16u);
  }
  id v12 = +[NSPersistentHistoryChangeRequest fetchHistoryAfterToken:v8];
  [v12 setResultType:5];
  [v12 setFetchBatchSize:1024];
  id v17 = 0;
  v13 = [v9 executeRequest:v12 error:&v17];

  id v14 = v17;
  BOOL v15 = v14;
  if (a5) {
    *a5 = v14;
  }

  return v13;
}

- (void)currentCloudSyncVersions:(id)a3
{
  id v4 = a3;
  id v5 = [(BCCloudDataManager *)self moc];

  if (v5)
  {
    objc_initWeak(&location, self);
    id v6 = [(BCCloudDataManager *)self moc];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100008428;
    v8[3] = &unk_10025FE98;
    objc_copyWeak(&v10, &location);
    id v9 = v4;
    [v6 performBlock:v8];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  else
  {
    BOOL v7 = [(BCCloudDataManager *)self responseQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100045E80;
    block[3] = &unk_100260330;
    id v13 = v4;
    dispatch_async(v7, block);
  }
}

- (NSManagedObjectContext)moc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_moc);
  return (NSManagedObjectContext *)WeakRetained;
}

- (BCCloudDataManager)initWithCloudDataSource:(id)a3 entityName:(id)a4 notificationName:(id)a5 immutableClass:(Class)a6 mutableClass:(Class)a7 syncManager:(id)a8 cloudKitController:(id)a9
{
  return [(BCCloudDataManager *)self initWithCloudDataSource:a3 entityName:a4 notificationName:a5 immutableClass:a6 mutableClass:a7 syncManager:a8 cloudKitController:a9 dataMapper:0];
}

- (BCCloudDataManager)initWithCloudDataSource:(id)a3 entityName:(id)a4 notificationName:(id)a5 immutableClass:(Class)a6 mutableClass:(Class)a7 syncManager:(id)a8 cloudKitController:(id)a9 dataMapper:(id)a10
{
  return [(BCCloudDataManager *)self initWithCloudDataSource:a3 entityName:a4 notificationName:a5 immutableClass:a6 mutableClass:a7 syncManager:a8 cloudKitController:a9 dataMapper:a10 privacyDelegate:0];
}

- (BCCloudDataManager)initWithCloudDataSource:(id)a3 entityName:(id)a4 notificationName:(id)a5 immutableClass:(Class)a6 mutableClass:(Class)a7 syncManager:(id)a8 cloudKitController:(id)a9 privacyDelegate:(id)a10
{
  return [(BCCloudDataManager *)self initWithCloudDataSource:a3 entityName:a4 notificationName:a5 immutableClass:a6 mutableClass:a7 syncManager:a8 cloudKitController:a9 dataMapper:0 privacyDelegate:a10];
}

- (BCCloudDataManager)initWithCloudDataSource:(id)a3 entityName:(id)a4 notificationName:(id)a5 immutableClass:(Class)a6 mutableClass:(Class)a7 syncManager:(id)a8 cloudKitController:(id)a9 dataMapper:(id)a10 privacyDelegate:(id)a11
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a8;
  id v20 = a9;
  id v40 = a10;
  id v21 = a11;
  v43.receiver = self;
  v43.super_class = (Class)BCCloudDataManager;
  id v22 = [(BCCloudDataManager *)&v43 init];
  id v23 = v22;
  if (!v22) {
    goto LABEL_12;
  }
  objc_storeStrong((id *)&v22->_dataSource, a3);
  id v24 = [v16 managedObjectContext];
  objc_storeWeak((id *)&v23->_moc, v24);

  v25 = (NSString *)[v17 copy];
  entityName = v23->_entityName;
  v23->_entityName = v25;

  id v27 = (NSString *)[v18 copy];
  notificationName = v23->_notificationName;
  v23->_notificationName = v27;

  v23->_immutableClass = a6;
  v23->_mutableClass = a7;
  objc_storeWeak((id *)&v23->_syncManager, v19);
  objc_storeWeak((id *)&v23->_cloudKitController, v20);
  objc_storeStrong((id *)&v23->_dataMapper, a10);
  id WeakRetained = objc_loadWeakRetained((id *)&v23->_moc);

  if (!WeakRetained)
  {
    v30 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v31 = dispatch_queue_create("BookDataStore.DataManagerCallbackQueue", v30);
    responseQueue = v23->_responseQueue;
    v23->_responseQueue = (OS_dispatch_queue *)v31;
  }
  if (BUIsRunningTests())
  {
    v33 = +[BCCloudDataNullPrivacyDelegate nullPrivacyDelegate];
    objc_storeWeak((id *)&v23->_privacyDelegate, v33);
  }
  else
  {
    if (v21)
    {
      objc_storeWeak((id *)&v23->_privacyDelegate, v21);
      goto LABEL_10;
    }
    v33 = objc_loadWeakRetained((id *)&v23->_cloudKitController);
    v34 = [v33 privateCloudDatabaseController];
    objc_storeWeak((id *)&v23->_privacyDelegate, v34);
  }
LABEL_10:
  v23->_signalDataChangedTransaction = v23->_notificationName != 0;
  id v35 = objc_loadWeakRetained((id *)&v23->_cloudKitController);
  unsigned int v36 = [v35 didChangeContainer];

  if (v36)
  {
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_100045210;
    v41[3] = &unk_100261018;
    v42 = v23;
    [(BCCloudDataManager *)v42 dissociateCloudDataFromSyncWithCompletion:v41];
  }
LABEL_12:

  return v23;
}

- (void)mq_incrementCloudVersion
{
  v2 = [(BCCloudDataManager *)self mq_cloudSyncVersions];
  objc_msgSend(v2, "setCloudVersion:", (char *)objc_msgSend(v2, "cloudVersion") + 1);
  id v3 = sub_1000083A0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 134217984;
    id v5 = [v2 cloudVersion];
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "BCCloudDataManager Incremented cloudSyncVersion to %lld", (uint8_t *)&v4, 0xCu);
  }
}

- (void)startSyncToCKWithSyncManager:(id)a3 completion:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000454A0;
  v8[3] = &unk_100261068;
  id v9 = a3;
  id v10 = a4;
  id v6 = v10;
  id v7 = v9;
  [(BCCloudDataManager *)self _dirtyMutableCloudDataWithFetchLimit:64 synchronous:0 completion:v8];
}

- (void)_dirtyMutableCloudDataWithFetchLimit:(unint64_t)a3 synchronous:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = [(BCCloudDataManager *)self moc];

  if (v9)
  {
    objc_initWeak(&location, self);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100045838;
    v13[3] = &unk_100261090;
    objc_copyWeak(v15, &location);
    v15[1] = (id)a3;
    id v14 = v8;
    id v10 = objc_retainBlock(v13);
    id v11 = [(BCCloudDataManager *)self moc];
    if (v5) {
      [v11 performBlockAndWait:v10];
    }
    else {
      [v11 performBlock:v10];
    }

    objc_destroyWeak(v15);
    objc_destroyWeak(&location);
  }
  else
  {
    id v12 = [(BCCloudDataManager *)self responseQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000457C4;
    block[3] = &unk_100260330;
    id v18 = v8;
    dispatch_async(v12, block);
  }
}

- (void)dirtyMutableCloudDataWithFetchLimit:(unint64_t)a3 completion:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100045D44;
  v7[3] = &unk_1002610B8;
  id v8 = a4;
  id v6 = v8;
  [(BCCloudDataManager *)self _dirtyMutableCloudDataWithFetchLimit:a3 synchronous:0 completion:v7];
}

- (void)mq_signalTransactions
{
  id v3 = [(BCCloudDataManager *)self syncManager];
  [v3 signalSyncToCK];

  if ([(BCCloudDataManager *)self signalDataChangedTransaction])
  {
    id v7 = [(BCCloudDataManager *)self cloudKitController];
    int v4 = [v7 transactionManager];
    BOOL v5 = [(BCCloudDataManager *)self entityName];
    id v6 = [(BCCloudDataManager *)self notificationName];
    [v4 signalDataChangeTransactionForEntityName:v5 notificationName:v6];
  }
}

- (void)setCloudData:(id)a3 predicate:(id)a4 completion:(id)a5
{
}

- (void)setCloudData:(id)a3 predicate:(id)a4 mergers:(id)a5 completion:(id)a6
{
}

- (void)setCloudData:(id)a3 predicate:(id)a4 isEqualCheckIgnoringEmptySalt:(BOOL)a5 completion:(id)a6
{
}

- (void)setCloudData:(id)a3 predicate:(id)a4 mergers:(id)a5 isEqualCheckIgnoringEmptySalt:(BOOL)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = [(BCCloudDataManager *)self moc];

  if (v16)
  {
    objc_initWeak(&location, self);
    id v17 = [(BCCloudDataManager *)self moc];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100046198;
    v19[3] = &unk_1002610E0;
    objc_copyWeak(&v25, &location);
    id v20 = v12;
    id v21 = v13;
    BOOL v26 = a6;
    id v22 = v14;
    id v23 = self;
    id v24 = v15;
    [v17 performBlock:v19];

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }
  else
  {
    id v18 = [(BCCloudDataManager *)self responseQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100046120;
    block[3] = &unk_100260330;
    id v29 = v15;
    dispatch_async(v18, block);
  }
}

- (void)setCloudData:(id)a3 predicate:(id)a4 propertyIDKey:(id)a5 completion:(id)a6
{
}

- (void)setCloudData:(id)a3 predicate:(id)a4 propertyIDKey:(id)a5 mergers:(id)a6 completion:(id)a7
{
}

- (void)setCloudData:(id)a3 predicate:(id)a4 propertyIDKey:(id)a5 isEqualCheckIgnoringEmptySalt:(BOOL)a6 completion:(id)a7
{
}

- (void)setCloudData:(id)a3 predicate:(id)a4 propertyIDKey:(id)a5 mergers:(id)a6 isEqualCheckIgnoringEmptySalt:(BOOL)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  id v19 = [(BCCloudDataManager *)self moc];

  if (v19)
  {
    objc_initWeak(&location, self);
    id v20 = [(BCCloudDataManager *)self moc];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    id v22[2] = sub_10004692C;
    v22[3] = &unk_100261130;
    objc_copyWeak(&v29, &location);
    id v23 = v15;
    id v24 = v16;
    id v25 = v14;
    BOOL v30 = a7;
    id v26 = v17;
    id v27 = self;
    id v28 = v18;
    [v20 performBlock:v22];

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }
  else
  {
    id v21 = [(BCCloudDataManager *)self responseQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000468B4;
    block[3] = &unk_100260330;
    id v33 = v18;
    dispatch_async(v21, block);
  }
}

- (void)removeCloudDataForPredicate:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BCCloudDataManager *)self moc];

  if (v8)
  {
    objc_initWeak(&location, self);
    id v9 = [(BCCloudDataManager *)self moc];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10004757C;
    void v11[3] = &unk_100260278;
    objc_copyWeak(&v14, &location);
    id v12 = v6;
    id v13 = v7;
    [v9 performBlock:v11];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  else
  {
    id v10 = [(BCCloudDataManager *)self responseQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100047508;
    block[3] = &unk_100260330;
    id v17 = v7;
    dispatch_async(v10, block);
  }
}

- (void)updateSyncGenerationFromCloudData:(id)a3 predicate:(id)a4 propertyIDKey:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(BCCloudDataManager *)self moc];

  if (v14)
  {
    objc_initWeak(&location, self);
    id v15 = [(BCCloudDataManager *)self moc];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100047B68;
    v17[3] = &unk_100261180;
    objc_copyWeak(&v22, &location);
    id v18 = v11;
    id v19 = v10;
    id v20 = v12;
    id v21 = v13;
    [v15 performBlock:v17];

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
  else
  {
    id v16 = [(BCCloudDataManager *)self responseQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100047AF4;
    block[3] = &unk_100260330;
    id v25 = v13;
    dispatch_async(v16, block);
  }
}

- (void)deleteCloudDataForPredicate:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BCCloudDataManager *)self moc];

  if (v8)
  {
    objc_initWeak(&location, self);
    id v9 = [(BCCloudDataManager *)self moc];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100048330;
    void v11[3] = &unk_100260278;
    objc_copyWeak(&v14, &location);
    id v12 = v6;
    id v13 = v7;
    [v9 performBlock:v11];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  else
  {
    id v10 = [(BCCloudDataManager *)self responseQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000482BC;
    block[3] = &unk_100260330;
    id v17 = v7;
    dispatch_async(v10, block);
  }
}

- (void)countWithPredicate:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BCCloudDataManager *)self moc];

  if (v8)
  {
    if (v7)
    {
      objc_initWeak(&location, self);
      id v9 = [(BCCloudDataManager *)self moc];
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_100048A44;
      void v11[3] = &unk_100260278;
      objc_copyWeak(&v14, &location);
      id v12 = v6;
      id v13 = v7;
      [v9 performBlock:v11];

      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    id v10 = [(BCCloudDataManager *)self responseQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000489D0;
    block[3] = &unk_100260330;
    id v17 = v7;
    dispatch_async(v10, block);
  }
}

- (id)mutableCloudDataWithPredicate:(id)a3 sortDescriptors:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = sub_100046F90;
  id v15 = sub_100046FA0;
  id v16 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100048D60;
  void v10[3] = &unk_1002611A8;
  v10[4] = &v11;
  [(BCCloudDataManager *)self mutableCloudDataWithPredicate:v6 sortDescriptors:0 synchronous:1 completion:v10];
  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

- (void)cloudDatasWithPredicate:(id)a3 sortDescriptors:(id)a4 maximumResultCount:(unint64_t)a5 filter:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  id v16 = [(BCCloudDataManager *)self moc];

  if (v16)
  {
    if (v15)
    {
      objc_initWeak(&location, self);
      if (a5) {
        unint64_t v17 = a5;
      }
      else {
        unint64_t v17 = -1;
      }
      id v18 = [(BCCloudDataManager *)self moc];

      if (v18)
      {
        id v19 = [(BCCloudDataManager *)self moc];
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_100049088;
        v21[3] = &unk_1002611F8;
        objc_copyWeak(v26, &location);
        id v22 = v12;
        id v23 = v13;
        id v24 = v14;
        v26[1] = (id)v17;
        id v25 = v15;
        [v19 performBlock:v21];

        objc_destroyWeak(v26);
      }
      objc_destroyWeak(&location);
    }
  }
  else
  {
    id v20 = [(BCCloudDataManager *)self responseQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100049010;
    block[3] = &unk_100260330;
    id v29 = v15;
    dispatch_async(v20, block);
  }
}

- (void)cloudDatasWithPredicate:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BCCloudDataManager *)self moc];

  if (v8)
  {
    if (v7)
    {
      objc_initWeak(&location, self);
      id v9 = [(BCCloudDataManager *)self moc];
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_10004970C;
      void v11[3] = &unk_100260278;
      objc_copyWeak(&v14, &location);
      id v12 = v6;
      id v13 = v7;
      [v9 performBlock:v11];

      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    id v10 = [(BCCloudDataManager *)self responseQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100049694;
    block[3] = &unk_100260330;
    id v17 = v7;
    dispatch_async(v10, block);
  }
}

- (void)transformedCloudDatasWithPredicate:(id)a3 transformer:(id)a4 limit:(int64_t)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = [(BCCloudDataManager *)self moc];

  if (v12)
  {
    if (v11)
    {
      objc_initWeak(&location, self);
      id v13 = [(BCCloudDataManager *)self moc];
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      id v15[2] = sub_100049CD8;
      v15[3] = &unk_100261220;
      objc_copyWeak(&v19, &location);
      id v16 = v9;
      id v17 = v10;
      id v18 = v11;
      [v13 performBlock:v15];

      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    id v14 = [(BCCloudDataManager *)self responseQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100049C64;
    block[3] = &unk_100260330;
    id v22 = v11;
    dispatch_async(v14, block);
  }
}

- (void)resolvedCloudDataForCloudData:(id)a3 predicate:(id)a4 completion:(id)a5
{
}

- (void)resolvedCloudDataForCloudData:(id)a3 withResolvers:(id)a4 predicate:(id)a5 completion:(id)a6
{
}

- (void)resolvedCloudDataForCloudData:(id)a3 withResolvers:(id)a4 mergers:(id)a5 predicate:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = [(BCCloudDataManager *)self moc];

  if (v17)
  {
    id v18 = [(BCCloudDataManager *)self privacyDelegate];
    [v12 setPrivacyDelegate:v18];

    id v19 = [v12 systemFields];
    id v20 = [v19 recordID];

    if (v20)
    {
      objc_initWeak(&location, self);
      id v21 = [(BCCloudDataManager *)self syncManager];
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_10004A304;
      v25[3] = &unk_100261270;
      objc_copyWeak(&v31, &location);
      id v26 = v15;
      id v27 = v13;
      id v28 = self;
      id v29 = v14;
      id v30 = v16;
      [v21 fetchRecordForRecordID:v20 completion:v25];

      objc_destroyWeak(&v31);
      objc_destroyWeak(&location);
    }
    else
    {
      id v23 = objc_retainBlock(v16);
      id v24 = v23;
      if (v23) {
        (*((void (**)(id, void, void))v23 + 2))(v23, 0, 0);
      }
    }
  }
  else
  {
    id v22 = [(BCCloudDataManager *)self responseQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10004A290;
    block[3] = &unk_100260330;
    id v34 = v16;
    dispatch_async(v22, block);

    id v20 = v34;
  }
}

- (void)resolveConflictsForRecords:(id)a3 completion:(id)a4
{
}

- (void)resolveConflictsForRecords:(id)a3 withResolvers:(id)a4 completion:(id)a5
{
}

- (void)resolveConflictsForRecords:(id)a3 withResolvers:(id)a4 mergers:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(BCCloudDataManager *)self moc];

  if (v14)
  {
    objc_initWeak(&location, self);
    id v15 = [(BCCloudDataManager *)self moc];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10004AD0C;
    v17[3] = &unk_1002612C0;
    objc_copyWeak(&v23, &location);
    id v18 = v10;
    id v19 = v11;
    id v20 = self;
    id v21 = v12;
    id v22 = v13;
    [v15 performBlock:v17];

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
  else
  {
    id v16 = [(BCCloudDataManager *)self responseQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10004AC94;
    block[3] = &unk_100260330;
    id v26 = v13;
    dispatch_async(v16, block);
  }
}

- (void)failedRecordIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BCCloudDataManager *)self moc];

  if (v8)
  {
    objc_initWeak(&location, self);
    id v9 = [(BCCloudDataManager *)self moc];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10004BCFC;
    void v11[3] = &unk_100260278;
    objc_copyWeak(&v14, &location);
    id v12 = v6;
    id v13 = v7;
    [v9 performBlock:v11];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  else
  {
    id v10 = [(BCCloudDataManager *)self responseQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10004BC88;
    block[3] = &unk_100260330;
    id v17 = v7;
    dispatch_async(v10, block);
  }
}

- (void)fetchCloudDataIncludingDeleted:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  if (a3) {
    +[NSPredicate predicateWithValue:1];
  }
  else {
    +[NSPredicate predicateWithFormat:@"deletedFlag == NO"];
  }
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [(BCCloudDataManager *)self cloudDatasWithPredicate:v7 completion:v6];
}

- (BOOL)_isTokenInvalidError:(id)a3
{
  id v3 = a3;
  id v4 = [v3 code];
  BOOL v5 = v4 == (id)134501 || v4 == (id)134301;
  BOOL v8 = 0;
  if (v5)
  {
    id v6 = [v3 domain];
    unsigned __int8 v7 = [v6 isEqualToString:NSCocoaErrorDomain];

    if (v7) {
      BOOL v8 = 1;
    }
  }

  return v8;
}

- (void)dissociateCloudDataFromSyncWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(BCCloudDataManager *)self moc];

  if (v5)
  {
    objc_initWeak(&location, self);
    id v6 = [(BCCloudDataManager *)self moc];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10004C398;
    v8[3] = &unk_10025FE98;
    objc_copyWeak(&v10, &location);
    id v9 = v4;
    [v6 performBlock:v8];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  else
  {
    unsigned __int8 v7 = [(BCCloudDataManager *)self responseQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10004C324;
    block[3] = &unk_100260330;
    id v13 = v4;
    dispatch_async(v7, block);
  }
}

- (void)hasSaltChangedWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = sub_1000083A0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(BCCloudDataManager *)self entityName];
    *(_DWORD *)buf = 138412290;
    id v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "BCCloudDataManager %@ #hasSaltChangedWithCompletion", buf, 0xCu);
  }
  unsigned __int8 v7 = [(BCCloudDataManager *)self moc];
  BOOL v8 = v7 == 0;

  if (v8)
  {
    id v10 = [(BCCloudDataManager *)self responseQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10004CAFC;
    block[3] = &unk_100260330;
    id v15 = v4;
    dispatch_async(v10, block);
  }
  else if (v4)
  {
    objc_initWeak((id *)buf, self);
    id v9 = [(BCCloudDataManager *)self moc];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10004CBC0;
    void v11[3] = &unk_10025FE98;
    objc_copyWeak(&v13, (id *)buf);
    id v12 = v4;
    [v9 performBlock:v11];

    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);
  }
}

- (id)diagnosticDirtyCloudDataInfos
{
  id v3 = [(BCCloudDataManager *)self moc];

  if (v3)
  {
    uint64_t v11 = 0;
    id v12 = &v11;
    uint64_t v13 = 0x3032000000;
    id v14 = sub_100046F90;
    id v15 = sub_100046FA0;
    id v16 = objc_alloc_init((Class)NSMutableArray);
    objc_initWeak(&location, self);
    id v4 = [(BCCloudDataManager *)self moc];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10004D134;
    v8[3] = &unk_100261338;
    objc_copyWeak(&v9, &location);
    void v8[4] = &v11;
    [v4 performBlockAndWait:v8];

    id v5 = (id)v12[5];
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    id v6 = sub_1000083A0();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1001E725C();
    }

    id v5 = &__NSArray0__struct;
  }
  return v5;
}

- (BDSCloudDataManagerMonitor)monitor
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_monitor);
  return (BDSCloudDataManagerMonitor *)WeakRetained;
}

- (void)setMonitor:(id)a3
{
}

- (void)setMoc:(id)a3
{
}

- (BCCloudDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (OS_dispatch_queue)responseQueue
{
  return self->_responseQueue;
}

- (void)setResponseQueue:(id)a3
{
}

- (void)setEntityName:(id)a3
{
}

- (NSString)notificationName
{
  return self->_notificationName;
}

- (void)setNotificationName:(id)a3
{
}

- (BCCloudDataSyncProvider)syncManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_syncManager);
  return (BCCloudDataSyncProvider *)WeakRetained;
}

- (void)setSyncManager:(id)a3
{
}

- (Class)immutableClass
{
  return self->_immutableClass;
}

- (void)setImmutableClass:(Class)a3
{
  self->_immutableClass = a3;
}

- (Class)mutableClass
{
  return self->_mutableClass;
}

- (void)setMutableClass:(Class)a3
{
  self->_mutableClass = a3;
}

- (void)setPrivacyDelegate:(id)a3
{
}

- (void)setSignalDataChangedTransaction:(BOOL)a3
{
  self->_signalDataChangedTransaction = a3;
}

- (BCCloudKitController)cloudKitController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cloudKitController);
  return (BCCloudKitController *)WeakRetained;
}

- (void)setCloudKitController:(id)a3
{
}

- (BCCloudDataMapper)dataMapper
{
  return self->_dataMapper;
}

- (void)setDataMapper:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataMapper, 0);
  objc_destroyWeak((id *)&self->_cloudKitController);
  objc_destroyWeak((id *)&self->_privacyDelegate);
  objc_destroyWeak((id *)&self->_syncManager);
  objc_storeStrong((id *)&self->_notificationName, 0);
  objc_storeStrong((id *)&self->_entityName, 0);
  objc_storeStrong((id *)&self->_responseQueue, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_destroyWeak((id *)&self->_moc);
  objc_destroyWeak((id *)&self->_monitor);
}

@end