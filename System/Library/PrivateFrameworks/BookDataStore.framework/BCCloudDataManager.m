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

- (BCCloudDataManager)initWithCloudDataSource:(id)a3 entityName:(id)a4 notificationName:(id)a5 immutableClass:(Class)a6 mutableClass:(Class)a7 syncManager:(id)a8 cloudKitController:(id)a9
{
  return (BCCloudDataManager *)objc_msgSend_initWithCloudDataSource_entityName_notificationName_immutableClass_mutableClass_syncManager_cloudKitController_dataMapper_(self, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, (uint64_t)a7, (uint64_t)a8, a9, 0);
}

- (BCCloudDataManager)initWithCloudDataSource:(id)a3 entityName:(id)a4 notificationName:(id)a5 immutableClass:(Class)a6 mutableClass:(Class)a7 syncManager:(id)a8 cloudKitController:(id)a9 dataMapper:(id)a10
{
  return (BCCloudDataManager *)objc_msgSend_initWithCloudDataSource_entityName_notificationName_immutableClass_mutableClass_syncManager_cloudKitController_dataMapper_privacyDelegate_(self, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, (uint64_t)a7, (uint64_t)a8, a9, a10, 0);
}

- (BCCloudDataManager)initWithCloudDataSource:(id)a3 entityName:(id)a4 notificationName:(id)a5 immutableClass:(Class)a6 mutableClass:(Class)a7 syncManager:(id)a8 cloudKitController:(id)a9 privacyDelegate:(id)a10
{
  return (BCCloudDataManager *)objc_msgSend_initWithCloudDataSource_entityName_notificationName_immutableClass_mutableClass_syncManager_cloudKitController_dataMapper_privacyDelegate_(self, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, (uint64_t)a7, (uint64_t)a8, a9, 0, a10);
}

- (BCCloudDataManager)initWithCloudDataSource:(id)a3 entityName:(id)a4 notificationName:(id)a5 immutableClass:(Class)a6 mutableClass:(Class)a7 syncManager:(id)a8 cloudKitController:(id)a9 dataMapper:(id)a10 privacyDelegate:(id)a11
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a8;
  id v20 = a9;
  id v88 = a10;
  id v21 = a11;
  v91.receiver = self;
  v91.super_class = (Class)BCCloudDataManager;
  v22 = [(BCCloudDataManager *)&v91 init];
  v23 = v22;
  if (!v22) {
    goto LABEL_12;
  }
  objc_storeStrong((id *)&v22->_dataSource, a3);
  v31 = objc_msgSend_managedObjectContext(v16, v24, v25, v26, v27, v28, v29, v30);
  objc_storeWeak((id *)&v23->_moc, v31);

  uint64_t v39 = objc_msgSend_copy(v17, v32, v33, v34, v35, v36, v37, v38);
  entityName = v23->_entityName;
  v23->_entityName = (NSString *)v39;

  uint64_t v48 = objc_msgSend_copy(v18, v41, v42, v43, v44, v45, v46, v47);
  notificationName = v23->_notificationName;
  v23->_notificationName = (NSString *)v48;

  v23->_immutableClass = a6;
  v23->_mutableClass = a7;
  objc_storeWeak((id *)&v23->_syncManager, v19);
  objc_storeWeak((id *)&v23->_cloudKitController, v20);
  objc_storeStrong((id *)&v23->_dataMapper, a10);
  id WeakRetained = objc_loadWeakRetained((id *)&v23->_moc);

  if (!WeakRetained)
  {
    v51 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v52 = dispatch_queue_create("BookDataStore.DataManagerCallbackQueue", v51);
    responseQueue = v23->_responseQueue;
    v23->_responseQueue = (OS_dispatch_queue *)v52;
  }
  if (BUIsRunningTests())
  {
    v61 = objc_msgSend_nullPrivacyDelegate(BCCloudDataNullPrivacyDelegate, v54, v55, v56, v57, v58, v59, v60);
    objc_storeWeak((id *)&v23->_privacyDelegate, v61);
  }
  else
  {
    if (v21)
    {
      objc_storeWeak((id *)&v23->_privacyDelegate, v21);
      goto LABEL_10;
    }
    v61 = objc_loadWeakRetained((id *)&v23->_cloudKitController);
    v69 = objc_msgSend_privateCloudDatabaseController(v61, v62, v63, v64, v65, v66, v67, v68);
    objc_storeWeak((id *)&v23->_privacyDelegate, v69);
  }
LABEL_10:
  v23->_signalDataChangedTransaction = v23->_notificationName != 0;
  id v70 = objc_loadWeakRetained((id *)&v23->_cloudKitController);
  int v78 = objc_msgSend_didChangeContainer(v70, v71, v72, v73, v74, v75, v76, v77);

  if (v78)
  {
    v89[0] = MEMORY[0x263EF8330];
    v89[1] = 3221225472;
    v89[2] = sub_23611C0C0;
    v89[3] = &unk_264CA2008;
    v90 = v23;
    objc_msgSend_dissociateCloudDataFromSyncWithCompletion_(v90, v79, (uint64_t)v89, v80, v81, v82, v83, v84);
  }
LABEL_12:

  return v23;
}

- (void)_logError:(id)a3 at:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    v7 = BDSCloudKitLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_2361FCD04();
    }
  }
}

- (void)mq_incrementCloudVersion
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  v8 = objc_msgSend_mq_cloudSyncVersions(self, a2, v2, v3, v4, v5, v6, v7);
  uint64_t v16 = objc_msgSend_cloudVersion(v8, v9, v10, v11, v12, v13, v14, v15);
  objc_msgSend_setCloudVersion_(v8, v17, v16 + 1, v18, v19, v20, v21, v22);
  v23 = BDSCloudKitLog();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    int v31 = 134217984;
    uint64_t v32 = objc_msgSend_cloudVersion(v8, v24, v25, v26, v27, v28, v29, v30);
    _os_log_impl(&dword_2360BC000, v23, OS_LOG_TYPE_DEFAULT, "BCCloudDataManager Incremented cloudSyncVersion to %lld", (uint8_t *)&v31, 0xCu);
  }
}

- (void)startSyncToCKWithSyncManager:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = sub_23611C3C4;
  v14[3] = &unk_264CA26C0;
  id v15 = v6;
  id v16 = v7;
  id v8 = v7;
  id v9 = v6;
  objc_msgSend__dirtyMutableCloudDataWithFetchLimit_synchronous_completion_(self, v10, 64, 0, (uint64_t)v14, v11, v12, v13);
}

- (void)_dirtyMutableCloudDataWithFetchLimit:(unint64_t)a3 synchronous:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v16 = objc_msgSend_moc(self, v9, v10, v11, v12, v13, v14, v15);

  if (v16)
  {
    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = sub_23611C75C;
    aBlock[3] = &unk_264CA26E8;
    objc_copyWeak(v42, &location);
    v42[1] = (id)a3;
    id v41 = v8;
    v24 = _Block_copy(aBlock);
    uint64_t v38 = objc_msgSend_moc(self, v25, v26, v27, v28, v29, v30, v31);
    if (v5) {
      objc_msgSend_performBlockAndWait_(v38, v32, (uint64_t)v24, v33, v34, v35, v36, v37);
    }
    else {
      objc_msgSend_performBlock_(v38, v32, (uint64_t)v24, v33, v34, v35, v36, v37);
    }

    objc_destroyWeak(v42);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v39 = objc_msgSend_responseQueue(self, v17, v18, v19, v20, v21, v22, v23);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_23611C6E8;
    block[3] = &unk_264CA1700;
    id v45 = v8;
    dispatch_async(v39, block);
  }
}

- (void)dirtyMutableCloudDataWithFetchLimit:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = sub_23611CC68;
  v12[3] = &unk_264CA2710;
  id v13 = v6;
  id v7 = v6;
  objc_msgSend__dirtyMutableCloudDataWithFetchLimit_synchronous_completion_(self, v8, a3, 0, (uint64_t)v12, v9, v10, v11);
}

- (id)mq_cloudSyncVersions
{
  uint64_t v9 = objc_msgSend_moc(self, a2, v2, v3, v4, v5, v6, v7);
  id v10 = objc_alloc(MEMORY[0x263EFF260]);
  id v17 = objc_msgSend_initWithEntityName_(v10, v11, @"BCCloudSyncVersions", v12, v13, v14, v15, v16);
  objc_msgSend_setReturnsObjectsAsFaults_(v17, v18, 0, v19, v20, v21, v22, v23);
  objc_msgSend_setFetchLimit_(v17, v24, 1, v25, v26, v27, v28, v29);
  uint64_t v30 = (void *)MEMORY[0x263F08A98];
  uint64_t v38 = objc_msgSend_entityName(self, v31, v32, v33, v34, v35, v36, v37);
  id v45 = objc_msgSend_predicateWithFormat_(v30, v39, @"dataType == %@", v40, v41, v42, v43, v44, v38);
  objc_msgSend_setPredicate_(v17, v46, (uint64_t)v45, v47, v48, v49, v50, v51);

  id v92 = 0;
  uint64_t v57 = objc_msgSend_executeFetchRequest_error_(v9, v52, (uint64_t)v17, (uint64_t)&v92, v53, v54, v55, v56);
  id v58 = v92;
  objc_msgSend__logError_at_(self, v59, (uint64_t)v58, @"mq_cloudSyncVersions", v60, v61, v62, v63);
  uint64_t v76 = objc_msgSend_firstObject(v57, v64, v65, v66, v67, v68, v69, v70);
  if (!v76)
  {
    uint64_t v76 = objc_msgSend_insertNewObjectForEntityForName_inManagedObjectContext_(MEMORY[0x263EFF240], v71, @"BCCloudSyncVersions", (uint64_t)v9, v72, v73, v74, v75);
    uint64_t v84 = objc_msgSend_entityName(self, v77, v78, v79, v80, v81, v82, v83);
    objc_msgSend_setDataType_(v76, v85, (uint64_t)v84, v86, v87, v88, v89, v90);
  }
  return v76;
}

- (void)mq_signalTransactions
{
  uint64_t v9 = objc_msgSend_syncManager(self, a2, v2, v3, v4, v5, v6, v7);
  objc_msgSend_signalSyncToCK(v9, v10, v11, v12, v13, v14, v15, v16);

  if (objc_msgSend_signalDataChangedTransaction(self, v17, v18, v19, v20, v21, v22, v23))
  {
    objc_msgSend_cloudKitController(self, v24, v25, v26, v27, v28, v29, v30);
    id v60 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v38 = objc_msgSend_transactionManager(v60, v31, v32, v33, v34, v35, v36, v37);
    uint64_t v46 = objc_msgSend_entityName(self, v39, v40, v41, v42, v43, v44, v45);
    uint64_t v54 = objc_msgSend_notificationName(self, v47, v48, v49, v50, v51, v52, v53);
    objc_msgSend_signalDataChangeTransactionForEntityName_notificationName_(v38, v55, (uint64_t)v46, (uint64_t)v54, v56, v57, v58, v59);
  }
}

- (id)mq_sanitizeError:(id)a3
{
  v41[3] = *MEMORY[0x263EF8340];
  if (a3)
  {
    uint64_t v3 = *MEMORY[0x263F07F80];
    v41[0] = @"CoreDataError";
    v40[0] = v3;
    v40[1] = @"domain";
    id v4 = a3;
    uint64_t v12 = objc_msgSend_domain(v4, v5, v6, v7, v8, v9, v10, v11);
    v41[1] = v12;
    v40[2] = @"code";
    uint64_t v13 = NSNumber;
    uint64_t v21 = objc_msgSend_code(v4, v14, v15, v16, v17, v18, v19, v20);

    uint64_t v28 = objc_msgSend_numberWithInteger_(v13, v22, v21, v23, v24, v25, v26, v27);
    v41[2] = v28;
    uint64_t v33 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v29, (uint64_t)v41, (uint64_t)v40, 3, v30, v31, v32);

    uint64_t v38 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v34, @"BDSErrorDomain", 1002, (uint64_t)v33, v35, v36, v37);
  }
  else
  {
    uint64_t v38 = 0;
  }
  return v38;
}

- (void)currentCloudSyncVersions:(id)a3
{
  id v4 = a3;
  uint64_t v12 = objc_msgSend_moc(self, v5, v6, v7, v8, v9, v10, v11);

  if (v12)
  {
    objc_initWeak(&location, self);
    uint64_t v27 = objc_msgSend_moc(self, v20, v21, v22, v23, v24, v25, v26);
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = sub_23611D258;
    v35[3] = &unk_264CA0AD0;
    objc_copyWeak(&v37, &location);
    id v36 = v4;
    objc_msgSend_performBlock_(v27, v28, (uint64_t)v35, v29, v30, v31, v32, v33);

    objc_destroyWeak(&v37);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v34 = objc_msgSend_responseQueue(self, v13, v14, v15, v16, v17, v18, v19);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_23611D1E8;
    block[3] = &unk_264CA1700;
    id v40 = v4;
    dispatch_async(v34, block);
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
  uint64_t v23 = objc_msgSend_moc(self, v16, v17, v18, v19, v20, v21, v22);

  if (v23)
  {
    objc_initWeak(&location, self);
    uint64_t v38 = objc_msgSend_moc(self, v31, v32, v33, v34, v35, v36, v37);
    v46[0] = MEMORY[0x263EF8330];
    v46[1] = 3221225472;
    v46[2] = sub_23611D684;
    v46[3] = &unk_264CA2738;
    objc_copyWeak(&v52, &location);
    id v47 = v12;
    id v48 = v13;
    BOOL v53 = a6;
    id v49 = v14;
    uint64_t v50 = self;
    id v51 = v15;
    objc_msgSend_performBlock_(v38, v39, (uint64_t)v46, v40, v41, v42, v43, v44);

    objc_destroyWeak(&v52);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v45 = objc_msgSend_responseQueue(self, v24, v25, v26, v27, v28, v29, v30);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_23611D60C;
    block[3] = &unk_264CA1700;
    id v56 = v15;
    dispatch_async(v45, block);
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
  uint64_t v26 = objc_msgSend_moc(self, v19, v20, v21, v22, v23, v24, v25);

  if (v26)
  {
    objc_initWeak(&location, self);
    uint64_t v41 = objc_msgSend_moc(self, v34, v35, v36, v37, v38, v39, v40);
    v49[0] = MEMORY[0x263EF8330];
    v49[1] = 3221225472;
    v49[2] = sub_23611DE18;
    v49[3] = &unk_264CA2788;
    objc_copyWeak(&v56, &location);
    id v50 = v15;
    id v51 = v16;
    id v52 = v14;
    BOOL v57 = a7;
    id v53 = v17;
    uint64_t v54 = self;
    id v55 = v18;
    objc_msgSend_performBlock_(v41, v42, (uint64_t)v49, v43, v44, v45, v46, v47);

    objc_destroyWeak(&v56);
    objc_destroyWeak(&location);
  }
  else
  {
    id v48 = objc_msgSend_responseQueue(self, v27, v28, v29, v30, v31, v32, v33);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_23611DDA0;
    block[3] = &unk_264CA1700;
    id v60 = v18;
    dispatch_async(v48, block);
  }
}

- (void)removeCloudDataForPredicate:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v15 = objc_msgSend_moc(self, v8, v9, v10, v11, v12, v13, v14);

  if (v15)
  {
    objc_initWeak(&location, self);
    uint64_t v30 = objc_msgSend_moc(self, v23, v24, v25, v26, v27, v28, v29);
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = sub_23611EA68;
    v38[3] = &unk_264CA1688;
    objc_copyWeak(&v41, &location);
    id v39 = v6;
    id v40 = v7;
    objc_msgSend_performBlock_(v30, v31, (uint64_t)v38, v32, v33, v34, v35, v36);

    objc_destroyWeak(&v41);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v37 = objc_msgSend_responseQueue(self, v16, v17, v18, v19, v20, v21, v22);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_23611E9F4;
    block[3] = &unk_264CA1700;
    id v44 = v7;
    dispatch_async(v37, block);
  }
}

- (void)updateSyncGenerationFromCloudData:(id)a3 predicate:(id)a4 propertyIDKey:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v21 = objc_msgSend_moc(self, v14, v15, v16, v17, v18, v19, v20);

  if (v21)
  {
    objc_initWeak(&location, self);
    uint64_t v36 = objc_msgSend_moc(self, v29, v30, v31, v32, v33, v34, v35);
    v44[0] = MEMORY[0x263EF8330];
    v44[1] = 3221225472;
    v44[2] = sub_23611F054;
    v44[3] = &unk_264CA27D8;
    objc_copyWeak(&v49, &location);
    id v45 = v11;
    id v46 = v10;
    id v47 = v12;
    id v48 = v13;
    objc_msgSend_performBlock_(v36, v37, (uint64_t)v44, v38, v39, v40, v41, v42);

    objc_destroyWeak(&v49);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v43 = objc_msgSend_responseQueue(self, v22, v23, v24, v25, v26, v27, v28);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_23611EFE0;
    block[3] = &unk_264CA1700;
    id v52 = v13;
    dispatch_async(v43, block);
  }
}

- (void)deleteCloudDataForPredicate:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v15 = objc_msgSend_moc(self, v8, v9, v10, v11, v12, v13, v14);

  if (v15)
  {
    objc_initWeak(&location, self);
    uint64_t v30 = objc_msgSend_moc(self, v23, v24, v25, v26, v27, v28, v29);
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = sub_23611F81C;
    v38[3] = &unk_264CA1688;
    objc_copyWeak(&v41, &location);
    id v39 = v6;
    id v40 = v7;
    objc_msgSend_performBlock_(v30, v31, (uint64_t)v38, v32, v33, v34, v35, v36);

    objc_destroyWeak(&v41);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v37 = objc_msgSend_responseQueue(self, v16, v17, v18, v19, v20, v21, v22);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_23611F7A8;
    block[3] = &unk_264CA1700;
    id v44 = v7;
    dispatch_async(v37, block);
  }
}

- (void)countWithPredicate:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v15 = objc_msgSend_moc(self, v8, v9, v10, v11, v12, v13, v14);

  if (v15)
  {
    if (v7)
    {
      objc_initWeak(&location, self);
      uint64_t v30 = objc_msgSend_moc(self, v23, v24, v25, v26, v27, v28, v29);
      v38[0] = MEMORY[0x263EF8330];
      v38[1] = 3221225472;
      v38[2] = sub_23611FF30;
      v38[3] = &unk_264CA1688;
      objc_copyWeak(&v41, &location);
      id v39 = v6;
      id v40 = v7;
      objc_msgSend_performBlock_(v30, v31, (uint64_t)v38, v32, v33, v34, v35, v36);

      objc_destroyWeak(&v41);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    uint64_t v37 = objc_msgSend_responseQueue(self, v16, v17, v18, v19, v20, v21, v22);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_23611FEBC;
    block[3] = &unk_264CA1700;
    id v44 = v7;
    dispatch_async(v37, block);
  }
}

- (void)cloudDataWithPredicate:(id)a3 sortDescriptors:(id)a4 completion:(id)a5
{
  objc_msgSend_mutableCloudDataWithPredicate_sortDescriptors_synchronous_completion_(self, a2, (uint64_t)a3, (uint64_t)a4, 0, (uint64_t)a5, v5, v6);
}

- (id)mutableCloudDataWithPredicate:(id)a3 sortDescriptors:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = sub_23611E47C;
  uint64_t v18 = sub_23611E48C;
  id v19 = 0;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = sub_236120258;
  v13[3] = &unk_264CA2800;
  v13[4] = &v14;
  objc_msgSend_mutableCloudDataWithPredicate_sortDescriptors_synchronous_completion_(self, v8, (uint64_t)v6, 0, 1, (uint64_t)v13, v9, v10);
  id v11 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v11;
}

- (void)mutableCloudDataWithPredicate:(id)a3 sortDescriptors:(id)a4 synchronous:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v20 = objc_msgSend_moc(self, v13, v14, v15, v16, v17, v18, v19);

  if (v20)
  {
    if (v12)
    {
      objc_initWeak(&location, self);
      uint64_t v44 = MEMORY[0x263EF8330];
      uint64_t v45 = 3221225472;
      id v46 = sub_2361204E8;
      id v47 = &unk_264CA2828;
      objc_copyWeak(&v51, &location);
      id v48 = v10;
      id v49 = v11;
      id v50 = v12;
      uint64_t v28 = _Block_copy(&v44);
      uint64_t v42 = objc_msgSend_moc(self, v29, v30, v31, v32, v33, v34, v35, v44, v45, v46, v47, v48, v49);
      if (v7) {
        objc_msgSend_performBlockAndWait_(v42, v36, (uint64_t)v28, v37, v38, v39, v40, v41);
      }
      else {
        objc_msgSend_performBlock_(v42, v36, (uint64_t)v28, v37, v38, v39, v40, v41);
      }

      objc_destroyWeak(&v51);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    uint64_t v43 = objc_msgSend_responseQueue(self, v21, v22, v23, v24, v25, v26, v27);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_236120474;
    block[3] = &unk_264CA1700;
    id v54 = v12;
    dispatch_async(v43, block);
  }
}

- (void)cloudDatasWithPredicate:(id)a3 sortDescriptors:(id)a4 maximumResultCount:(unint64_t)a5 filter:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  uint64_t v23 = objc_msgSend_moc(self, v16, v17, v18, v19, v20, v21, v22);

  if (v23)
  {
    if (v15)
    {
      objc_initWeak(&location, self);
      if (a5) {
        unint64_t v38 = a5;
      }
      else {
        unint64_t v38 = -1;
      }
      uint64_t v39 = objc_msgSend_moc(self, v31, v32, v33, v34, v35, v36, v37);

      if (v39)
      {
        id v47 = objc_msgSend_moc(self, v40, v41, v42, v43, v44, v45, v46);
        v55[0] = MEMORY[0x263EF8330];
        v55[1] = 3221225472;
        v55[2] = sub_236120A40;
        v55[3] = &unk_264CA2850;
        objc_copyWeak(v60, &location);
        id v56 = v12;
        id v57 = v13;
        id v58 = v14;
        v60[1] = (id)v38;
        id v59 = v15;
        objc_msgSend_performBlock_(v47, v48, (uint64_t)v55, v49, v50, v51, v52, v53);

        objc_destroyWeak(v60);
      }
      objc_destroyWeak(&location);
    }
  }
  else
  {
    id v54 = objc_msgSend_responseQueue(self, v24, v25, v26, v27, v28, v29, v30);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_2361209C8;
    block[3] = &unk_264CA1700;
    id v63 = v15;
    dispatch_async(v54, block);
  }
}

- (void)cloudDatasWithPredicate:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v15 = objc_msgSend_moc(self, v8, v9, v10, v11, v12, v13, v14);

  if (v15)
  {
    if (v7)
    {
      objc_initWeak(&location, self);
      uint64_t v30 = objc_msgSend_moc(self, v23, v24, v25, v26, v27, v28, v29);
      v38[0] = MEMORY[0x263EF8330];
      v38[1] = 3221225472;
      v38[2] = sub_2361210C4;
      v38[3] = &unk_264CA1688;
      objc_copyWeak(&v41, &location);
      id v39 = v6;
      id v40 = v7;
      objc_msgSend_performBlock_(v30, v31, (uint64_t)v38, v32, v33, v34, v35, v36);

      objc_destroyWeak(&v41);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    uint64_t v37 = objc_msgSend_responseQueue(self, v16, v17, v18, v19, v20, v21, v22);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_23612104C;
    block[3] = &unk_264CA1700;
    id v44 = v7;
    dispatch_async(v37, block);
  }
}

- (void)transformedCloudDatasWithPredicate:(id)a3 transformer:(id)a4 limit:(int64_t)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  uint64_t v19 = objc_msgSend_moc(self, v12, v13, v14, v15, v16, v17, v18);

  if (v19)
  {
    if (v11)
    {
      objc_initWeak(&location, self);
      uint64_t v34 = objc_msgSend_moc(self, v27, v28, v29, v30, v31, v32, v33);
      v42[0] = MEMORY[0x263EF8330];
      v42[1] = 3221225472;
      id v42[2] = sub_236121690;
      v42[3] = &unk_264CA2878;
      objc_copyWeak(&v46, &location);
      id v43 = v9;
      id v44 = v10;
      id v45 = v11;
      objc_msgSend_performBlock_(v34, v35, (uint64_t)v42, v36, v37, v38, v39, v40);

      objc_destroyWeak(&v46);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    id v41 = objc_msgSend_responseQueue(self, v20, v21, v22, v23, v24, v25, v26);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_23612161C;
    block[3] = &unk_264CA1700;
    id v49 = v11;
    dispatch_async(v41, block);
  }
}

- (void)resolvedCloudDataForCloudData:(id)a3 predicate:(id)a4 completion:(id)a5
{
  objc_msgSend_resolvedCloudDataForCloudData_withResolvers_predicate_completion_(self, a2, (uint64_t)a3, 0, (uint64_t)a4, (uint64_t)a5, v5, v6);
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
  uint64_t v24 = objc_msgSend_moc(self, v17, v18, v19, v20, v21, v22, v23);

  if (v24)
  {
    uint64_t v32 = objc_msgSend_privacyDelegate(self, v25, v26, v27, v28, v29, v30, v31);
    objc_msgSend_setPrivacyDelegate_(v12, v33, (uint64_t)v32, v34, v35, v36, v37, v38);

    id v46 = objc_msgSend_systemFields(v12, v39, v40, v41, v42, v43, v44, v45);
    id v54 = objc_msgSend_recordID(v46, v47, v48, v49, v50, v51, v52, v53);

    if (v54)
    {
      objc_initWeak(&location, self);
      uint64_t v62 = objc_msgSend_syncManager(self, v55, v56, v57, v58, v59, v60, v61);
      v71[0] = MEMORY[0x263EF8330];
      v71[1] = 3221225472;
      v71[2] = sub_236121CBC;
      v71[3] = &unk_264CA28C8;
      objc_copyWeak(&v77, &location);
      id v72 = v15;
      id v73 = v13;
      uint64_t v74 = self;
      id v75 = v14;
      id v76 = v16;
      objc_msgSend_fetchRecordForRecordID_completion_(v62, v63, (uint64_t)v54, (uint64_t)v71, v64, v65, v66, v67);

      objc_destroyWeak(&v77);
      objc_destroyWeak(&location);
    }
    else
    {
      uint64_t v69 = _Block_copy(v16);
      uint64_t v70 = v69;
      if (v69) {
        (*((void (**)(void *, void, void))v69 + 2))(v69, 0, 0);
      }
    }
  }
  else
  {
    uint64_t v68 = objc_msgSend_responseQueue(self, v25, v26, v27, v28, v29, v30, v31);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_236121C48;
    block[3] = &unk_264CA1700;
    id v80 = v16;
    dispatch_async(v68, block);

    id v54 = v80;
  }
}

- (void)resolveConflictsForRecords:(id)a3 completion:(id)a4
{
  objc_msgSend_resolveConflictsForRecords_withResolvers_completion_(self, a2, (uint64_t)a3, 0, (uint64_t)a4, v4, v5, v6);
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
  uint64_t v21 = objc_msgSend_moc(self, v14, v15, v16, v17, v18, v19, v20);

  if (v21)
  {
    objc_initWeak(&location, self);
    uint64_t v36 = objc_msgSend_moc(self, v29, v30, v31, v32, v33, v34, v35);
    v44[0] = MEMORY[0x263EF8330];
    v44[1] = 3221225472;
    v44[2] = sub_2361226C4;
    v44[3] = &unk_264CA2918;
    objc_copyWeak(&v50, &location);
    id v45 = v10;
    id v46 = v11;
    id v47 = self;
    id v48 = v12;
    id v49 = v13;
    objc_msgSend_performBlock_(v36, v37, (uint64_t)v44, v38, v39, v40, v41, v42);

    objc_destroyWeak(&v50);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v43 = objc_msgSend_responseQueue(self, v22, v23, v24, v25, v26, v27, v28);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_23612264C;
    block[3] = &unk_264CA1700;
    id v53 = v13;
    dispatch_async(v43, block);
  }
}

- (void)failedRecordIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v15 = objc_msgSend_moc(self, v8, v9, v10, v11, v12, v13, v14);

  if (v15)
  {
    objc_initWeak(&location, self);
    uint64_t v30 = objc_msgSend_moc(self, v23, v24, v25, v26, v27, v28, v29);
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = sub_2361236B4;
    v38[3] = &unk_264CA1688;
    objc_copyWeak(&v41, &location);
    id v39 = v6;
    id v40 = v7;
    objc_msgSend_performBlock_(v30, v31, (uint64_t)v38, v32, v33, v34, v35, v36);

    objc_destroyWeak(&v41);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v37 = objc_msgSend_responseQueue(self, v16, v17, v18, v19, v20, v21, v22);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_236123640;
    block[3] = &unk_264CA1700;
    id v44 = v7;
    dispatch_async(v37, block);
  }
}

- (void)fetchCloudDataIncludingDeleted:(BOOL)a3 completion:(id)a4
{
  id v6 = (void *)MEMORY[0x263F08A98];
  id v13 = a4;
  if (a3) {
    objc_msgSend_predicateWithValue_(v6, v7, 1, v8, v9, v10, v11, v12);
  }
  else {
    objc_msgSend_predicateWithFormat_(v6, v7, @"deletedFlag == NO", v8, v9, v10, v11, v12);
  }
  uint64_t v18 = (char *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_cloudDatasWithPredicate_completion_(self, v18, (uint64_t)v18, (uint64_t)v13, v14, v15, v16, v17);
}

- (id)_fetchHistoryAfterToken:(id)a3 inMoc:(id)a4 error:(id *)a5
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = BDSCloudKitLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v18 = objc_msgSend_entityName(self, v11, v12, v13, v14, v15, v16, v17);
    *(_DWORD *)buf = 138543618;
    id v49 = v18;
    __int16 v50 = 2114;
    id v51 = v8;
    _os_log_impl(&dword_2360BC000, v10, OS_LOG_TYPE_INFO, "BCCloudDataManager %{public}@ getChangesSince _fetchHistoryAfterToken: %{public}@", buf, 0x16u);
  }
  uint64_t v25 = objc_msgSend_fetchHistoryAfterToken_(MEMORY[0x263EFF2F8], v19, (uint64_t)v8, v20, v21, v22, v23, v24);
  objc_msgSend_setResultType_(v25, v26, 5, v27, v28, v29, v30, v31);
  objc_msgSend_setFetchBatchSize_(v25, v32, 1024, v33, v34, v35, v36, v37);
  id v47 = 0;
  uint64_t v43 = objc_msgSend_executeRequest_error_(v9, v38, (uint64_t)v25, (uint64_t)&v47, v39, v40, v41, v42);

  id v44 = v47;
  id v45 = v44;
  if (a5) {
    *a5 = v44;
  }

  return v43;
}

- (BOOL)_isTokenInvalidError:(id)a3
{
  id v3 = a3;
  uint64_t v11 = objc_msgSend_code(v3, v4, v5, v6, v7, v8, v9, v10);
  BOOL v19 = v11 == 134501 || v11 == 134301;
  BOOL v28 = 0;
  if (v19)
  {
    uint64_t v20 = objc_msgSend_domain(v3, v12, v13, v14, v15, v16, v17, v18);
    char isEqualToString = objc_msgSend_isEqualToString_(v20, v21, *MEMORY[0x263F07F70], v22, v23, v24, v25, v26);

    if (isEqualToString) {
      BOOL v28 = 1;
    }
  }

  return v28;
}

- (void)getChangesSince:(id)a3 forEntityClass:(Class)a4 completion:(id)a5
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  uint64_t v17 = objc_msgSend_shared(MEMORY[0x263F2BA58], v10, v11, v12, v13, v14, v15, v16);
  int v25 = objc_msgSend_verboseLoggingEnabled(v17, v18, v19, v20, v21, v22, v23, v24);

  if (v25)
  {
    uint64_t v33 = BDSCloudKitDevelopmentLog();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v41 = objc_msgSend_entityName(self, v34, v35, v36, v37, v38, v39, v40);
      *(_DWORD *)buf = 138412546;
      uint64_t v74 = v41;
      __int16 v75 = 2112;
      id v76 = v8;
      _os_log_impl(&dword_2360BC000, v33, OS_LOG_TYPE_DEFAULT, "\"\\\"BCCloudDataManager %@ getChangesSince cloudSyncVersions:%@\\\"\"", buf, 0x16u);
    }
  }
  uint64_t v42 = objc_msgSend_moc(self, v26, v27, v28, v29, v30, v31, v32);
  BOOL v43 = v42 == 0;

  if (v43)
  {
    uint64_t v65 = objc_msgSend_responseQueue(self, v44, v45, v46, v47, v48, v49, v50);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_236123ED0;
    block[3] = &unk_264CA17F0;
    void block[4] = self;
    id v72 = v9;
    dispatch_async(v65, block);
  }
  else
  {
    objc_initWeak((id *)buf, self);
    uint64_t v58 = objc_msgSend_moc(self, v51, v52, v53, v54, v55, v56, v57);
    v66[0] = MEMORY[0x263EF8330];
    v66[1] = 3221225472;
    v66[2] = sub_236123F54;
    v66[3] = &unk_264CA2940;
    objc_copyWeak(v70, (id *)buf);
    id v67 = v8;
    uint64_t v68 = self;
    v70[1] = a4;
    id v69 = v9;
    objc_msgSend_performBlock_(v58, v59, (uint64_t)v66, v60, v61, v62, v63, v64);

    objc_destroyWeak(v70);
    objc_destroyWeak((id *)buf);
  }
}

- (void)dissociateCloudDataFromSyncWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v12 = objc_msgSend_moc(self, v5, v6, v7, v8, v9, v10, v11);

  if (v12)
  {
    objc_initWeak(&location, self);
    uint64_t v27 = objc_msgSend_moc(self, v20, v21, v22, v23, v24, v25, v26);
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = sub_236124A04;
    v35[3] = &unk_264CA0AD0;
    objc_copyWeak(&v37, &location);
    id v36 = v4;
    objc_msgSend_performBlock_(v27, v28, (uint64_t)v35, v29, v30, v31, v32, v33);

    objc_destroyWeak(&v37);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v34 = objc_msgSend_responseQueue(self, v13, v14, v15, v16, v17, v18, v19);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_236124990;
    block[3] = &unk_264CA1700;
    id v40 = v4;
    dispatch_async(v34, block);
  }
}

- (void)hasSaltChangedWithCompletion:(id)a3
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = BDSCloudKitLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = objc_msgSend_entityName(self, v6, v7, v8, v9, v10, v11, v12);
    *(_DWORD *)buf = 138412290;
    id v51 = v13;
    _os_log_impl(&dword_2360BC000, v5, OS_LOG_TYPE_DEFAULT, "BCCloudDataManager %@ #hasSaltChangedWithCompletion", buf, 0xCu);
  }
  uint64_t v21 = objc_msgSend_moc(self, v14, v15, v16, v17, v18, v19, v20);
  BOOL v22 = v21 == 0;

  if (v22)
  {
    id v44 = objc_msgSend_responseQueue(self, v23, v24, v25, v26, v27, v28, v29);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_236125168;
    block[3] = &unk_264CA1700;
    id v49 = v4;
    dispatch_async(v44, block);
  }
  else if (v4)
  {
    objc_initWeak((id *)buf, self);
    id v37 = objc_msgSend_moc(self, v30, v31, v32, v33, v34, v35, v36);
    v45[0] = MEMORY[0x263EF8330];
    v45[1] = 3221225472;
    v45[2] = sub_23612522C;
    v45[3] = &unk_264CA0AD0;
    objc_copyWeak(&v47, (id *)buf);
    id v46 = v4;
    objc_msgSend_performBlock_(v37, v38, (uint64_t)v45, v39, v40, v41, v42, v43);

    objc_destroyWeak(&v47);
    objc_destroyWeak((id *)buf);
  }
}

- (id)diagnosticDirtyCloudDataInfos
{
  uint64_t v9 = objc_msgSend_moc(self, a2, v2, v3, v4, v5, v6, v7);

  if (v9)
  {
    uint64_t v30 = 0;
    uint64_t v31 = &v30;
    uint64_t v32 = 0x3032000000;
    uint64_t v33 = sub_23611E47C;
    uint64_t v34 = sub_23611E48C;
    id v35 = objc_alloc_init(MEMORY[0x263EFF980]);
    objc_initWeak(&location, self);
    uint64_t v17 = objc_msgSend_moc(self, v10, v11, v12, v13, v14, v15, v16);
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = sub_2361257A0;
    v27[3] = &unk_264CA2990;
    objc_copyWeak(&v28, &location);
    v27[4] = &v30;
    objc_msgSend_performBlockAndWait_(v17, v18, (uint64_t)v27, v19, v20, v21, v22, v23);

    id v24 = (id)v31[5];
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
    _Block_object_dispose(&v30, 8);
  }
  else
  {
    uint64_t v25 = BDSCloudKitLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_2361FCD88();
    }

    id v24 = (id)MEMORY[0x263EFFA68];
  }
  return v24;
}

- (BDSCloudDataManagerMonitor)monitor
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_monitor);
  return (BDSCloudDataManagerMonitor *)WeakRetained;
}

- (void)setMonitor:(id)a3
{
}

- (NSManagedObjectContext)moc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_moc);
  return (NSManagedObjectContext *)WeakRetained;
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

- (NSString)entityName
{
  return self->_entityName;
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

- (BCCloudDataPrivacyDelegate)privacyDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_privacyDelegate);
  return (BCCloudDataPrivacyDelegate *)WeakRetained;
}

- (void)setPrivacyDelegate:(id)a3
{
}

- (BOOL)signalDataChangedTransaction
{
  return self->_signalDataChangedTransaction;
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