@interface AMSBag
+ (AMSBagCache)bagCache;
+ (id)_bagForProfile:(id)a3 profileVersion:(id)a4 processInfo:(id)a5 accountProvider:(id)a6;
+ (id)bagForProfile:(id)a3 profileVersion:(id)a4;
+ (id)bagForProfile:(id)a3 profileVersion:(id)a4 processInfo:(id)a5;
+ (id)bagForProfile:(id)a3 profileVersion:(id)a4 processInfo:(id)a5 account:(id)a6;
+ (id)sharedPersistenceQueue;
+ (id)sharedPersistenceWithDefaultDirectory;
+ (unint64_t)uninitializedToken;
+ (void)resetBagCache;
- (AMSBag)initWithDataSource:(id)a3;
- (AMSBag)initWithDataSource:(id)a3 persistenceDirectoryURL:(id)a4 persistenceQueue:(id)a5 changeHandlerQueue:(id)a6 shouldConfigureDataSourceHandlers:(BOOL)a7;
- (AMSBag)initWithDataSource:(id)a3 shouldConfigureDataSourceHandlers:(BOOL)a4;
- (AMSBagCachedValueUpdateHandlers)updateHandlers;
- (AMSBagDataSourceProtocol)dataSource;
- (AMSBagUnderlyingData)temporaryPreloadedBagData;
- (AMSBagUnderlyingDataPersistence)persistence;
- (AMSProcessInfo)processInfo;
- (BOOL)isExpired;
- (BOOL)isLoaded;
- (BOOL)persistenceAPIWasCalled;
- (BOOL)persistenceIsEnabled;
- (NSDate)expirationDate;
- (NSString)description;
- (NSString)descriptionExtended;
- (NSString)profile;
- (NSString)profileVersion;
- (OS_dispatch_queue)changeNotificationQueue;
- (OS_dispatch_queue)persistenceQueue;
- (id)BOOLForKey:(id)a3;
- (id)URLForKey:(id)a3;
- (id)URLForKey:(id)a3 account:(id)a4;
- (id)URLFromURLString:(id)a3;
- (id)URLFromURLString:(id)a3 account:(id)a4;
- (id)_availableValuesFromCachedData:(id)a3 keys:(id)a4 partialIdentifier:(id)a5 expirationDate:(id)a6 updateHandler:(id)a7 outToken:(unint64_t *)a8;
- (id)_availableValuesFromPersistedBagData:(id)a3 error:(id)a4 keys:(id)a5 partialIdentifier:(id)a6 updateHandler:(id)a7 outToken:(unint64_t *)a8;
- (id)_initWithDataSource:(id)a3 persistence:(id)a4 persistenceQueue:(id)a5 updateHandlers:(id)a6 shouldConfigureDataSourceHandlers:(BOOL)a7;
- (id)_temporaryDictionary;
- (id)arrayForKey:(id)a3;
- (id)cachedValuesForKeys:(id)a3 observationToken:(unint64_t *)a4 updateHandler:(id)a5;
- (id)dictionaryForKey:(id)a3;
- (id)doubleForKey:(id)a3;
- (id)integerForKey:(id)a3;
- (id)stringForKey:(id)a3;
- (os_unfair_lock_s)updateHandlerConsistencyLock;
- (void)_configureDataSourceHandlers;
- (void)_loadAndPersistBag;
- (void)_persistBagDictionary:(id)a3 withIdentifier:(id)a4 partialIdentifier:(id)a5 expirationDate:(id)a6 onlyIfPreExisting:(BOOL)a7;
- (void)createSnapshotWithCompletion:(id)a3;
- (void)removeObserverWithToken:(unint64_t)a3;
- (void)setDataSource:(id)a3;
- (void)setDefaultValue:(id)a3 forKey:(id)a4;
- (void)setPersistenceAPIWasCalled:(BOOL)a3;
- (void)setProcessInfo:(id)a3;
- (void)setTemporaryPreloadedBagData:(id)a3;
- (void)setUpdateHandlerConsistencyLock:(os_unfair_lock_s)a3;
- (void)waitUntilPersistenceWorkComplete;
@end

@implementation AMSBag

- (NSString)description
{
  v2 = [(AMSBag *)self dataSource];
  v3 = [v2 description];

  return (NSString *)v3;
}

+ (id)_bagForProfile:(id)a3 profileVersion:(id)a4 processInfo:(id)a5 accountProvider:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v11)
  {
    if (v12) {
      goto LABEL_3;
    }
  }
  else
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"AMSBag.mm", 474, @"Unexpected nil reference: %s", "profile");

    if (v12)
    {
LABEL_3:
      if (v14) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  v22 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"AMSBag.mm", 475, @"Unexpected nil reference: %s", "profileVersion");

  if (v14)
  {
LABEL_4:
    if (v13) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  v23 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"AMSBag.mm", 476, @"Unexpected nil reference: %s", "accountProvider");

  if (!v13)
  {
LABEL_5:
    id v13 = +[AMSProcessInfo currentProcess];
  }
LABEL_6:
  v27 = +[AMSBagNetworkDataSource requestPartialIdentifierForClientInfo:v13 profile:v11 profileVersion:v12];
  v26 = [v14 identity];
  v25 = [v13 accountMediaType];
  v15 = [a1 bagCache];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __68__AMSBag__bagForProfile_profileVersion_processInfo_accountProvider___block_invoke;
  v28[3] = &unk_1E559F5B8;
  id v16 = v11;
  id v29 = v16;
  id v17 = v12;
  id v30 = v17;
  id v18 = v13;
  id v31 = v18;
  id v19 = v14;
  id v32 = v19;
  SEL v33 = a2;
  id v34 = a1;
  id v24 = [v15 bagWithIdentifier:v27 accountProviderIdentity:v26 accountMediaType:v25 orCreateUsingBlock:v28];

  return v24;
}

+ (AMSBagCache)bagCache
{
  if (_MergedGlobals_84 != -1) {
    dispatch_once(&_MergedGlobals_84, &__block_literal_global_15);
  }
  v2 = (void *)qword_1EB38D688;
  return (AMSBagCache *)v2;
}

- (void)removeObserverWithToken:(unint64_t)a3
{
  id v4 = [(AMSBag *)self updateHandlers];
  [v4 removeHandlerWithToken:a3];
}

- (void)createSnapshotWithCompletion:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = +[AMSLogConfig sharedConfigOversize];
  if (!v5)
  {
    v5 = +[AMSLogConfig sharedConfig];
  }
  v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (id)objc_opt_class();
    v8 = AMSLogKey();
    *(_DWORD *)buf = 138543874;
    id v18 = v7;
    __int16 v19 = 2114;
    v20 = v8;
    __int16 v21 = 2114;
    v22 = self;
    _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Attempting to create a snapshot. originalBag = %{public}@", buf, 0x20u);
  }
  v9 = AMSLogKey();
  objc_initWeak((id *)buf, self);
  v10 = [(AMSBag *)self dataSource];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __39__AMSBag_createSnapshotWithCompletion___block_invoke;
  v13[3] = &unk_1E559F548;
  objc_copyWeak(&v16, (id *)buf);
  id v11 = v9;
  id v14 = v11;
  id v12 = v4;
  id v15 = v12;
  [v10 loadWithCompletion:v13];

  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);
}

- (id)arrayForKey:(id)a3
{
  id v4 = a3;
  v5 = [AMSBagValue alloc];
  v6 = [(AMSBag *)self dataSource];
  id v7 = [(AMSBagValue *)v5 initWithDataSource:v6 key:v4 valueType:0];

  return v7;
}

- (id)dictionaryForKey:(id)a3
{
  id v4 = a3;
  v5 = [AMSBagValue alloc];
  v6 = [(AMSBag *)self dataSource];
  id v7 = [(AMSBagValue *)v5 initWithDataSource:v6 key:v4 valueType:6];

  return v7;
}

- (id)stringForKey:(id)a3
{
  id v4 = a3;
  v5 = [AMSBagValue alloc];
  v6 = [(AMSBag *)self dataSource];
  id v7 = [(AMSBagValue *)v5 initWithDataSource:v6 key:v4 valueType:4];

  return v7;
}

- (AMSBagDataSourceProtocol)dataSource
{
  return self->_dataSource;
}

- (id)doubleForKey:(id)a3
{
  id v4 = a3;
  v5 = [AMSBagValue alloc];
  v6 = [(AMSBag *)self dataSource];
  id v7 = [(AMSBagValue *)v5 initWithDataSource:v6 key:v4 valueType:2];

  return v7;
}

- (id)BOOLForKey:(id)a3
{
  id v4 = a3;
  v5 = [AMSBagValue alloc];
  v6 = [(AMSBag *)self dataSource];
  id v7 = [(AMSBagValue *)v5 initWithDataSource:v6 key:v4 valueType:1];

  return v7;
}

uint64_t __38__AMSBag__configureDataSourceHandlers__block_invoke_120(uint64_t a1)
{
  return [*(id *)(a1 + 32) setTemporaryPreloadedBagData:0];
}

+ (id)bagForProfile:(id)a3 profileVersion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [(id)objc_opt_class() bagForProfile:v5 profileVersion:v6 processInfo:0];

  return v7;
}

+ (id)bagForProfile:(id)a3 profileVersion:(id)a4 processInfo:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = objc_opt_class();
  id v11 = objc_alloc_init(AMSBagActiveAccountProvider);
  id v12 = [v10 _bagForProfile:v7 profileVersion:v8 processInfo:v9 accountProvider:v11];

  return v12;
}

void __38__AMSBag__configureDataSourceHandlers__block_invoke_122(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"AMSBagChangedNotification" object:*(void *)(a1 + 32) userInfo:*(void *)(a1 + 40)];
}

AMSBag *__68__AMSBag__bagForProfile_profileVersion_processInfo_accountProvider___block_invoke(void *a1)
{
  id v2 = [[AMSBagNetworkDataSource alloc] initWithProfile:a1[4] profileVersion:a1[5] processInfo:a1[6] accountProvider:a1[7]];
  v3 = [[AMSBag alloc] initWithDataSource:v2 shouldConfigureDataSourceHandlers:1];
  id v4 = [(AMSBag *)v3 dataSource];
  [v4 loadWithCompletion:&__block_literal_global_117];

  if (!v3)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a1[8], a1[9], @"AMSBag.mm", 499, @"Unexpected nil reference: %s", "bag");
  }
  return v3;
}

- (AMSBag)initWithDataSource:(id)a3 shouldConfigureDataSourceHandlers:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  if (!v7)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"AMSBag.mm", 121, @"Unexpected nil reference: %s", "dataSource");
  }
  id v8 = +[AMSBag sharedPersistenceWithDefaultDirectory];
  if (v8)
  {
    id v9 = +[AMSBag sharedPersistenceQueue];
  }
  else
  {
    id v9 = 0;
  }
  v10 = objc_alloc_init(AMSBagCachedValueUpdateHandlers);
  id v11 = [(AMSBag *)self _initWithDataSource:v7 persistence:v8 persistenceQueue:v9 updateHandlers:v10 shouldConfigureDataSourceHandlers:v4];

  return v11;
}

- (id)_initWithDataSource:(id)a3 persistence:(id)a4 persistenceQueue:(id)a5 updateHandlers:(id)a6 shouldConfigureDataSourceHandlers:(BOOL)a7
{
  BOOL v30 = a7;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = v16;
  if (v13)
  {
    if (v16) {
      goto LABEL_3;
    }
  }
  else
  {
    v27 = a2;
    id v24 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", v27, self, @"AMSBag.mm", 139, @"Unexpected nil reference: %s", "dataSource");

    a2 = v27;
    if (v17)
    {
LABEL_3:
      if (!v14) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  v28 = a2;
  v25 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", v28, self, @"AMSBag.mm", 140, @"Unexpected nil reference: %s", "updateHandlers");

  a2 = v28;
  if (!v14) {
    goto LABEL_5;
  }
LABEL_4:
  if (!v15)
  {
    SEL v26 = a2;
    uint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:v26 object:self file:@"AMSBag.mm" lineNumber:141 description:@"'persistenceQueue' must be provided if 'persistence' is provided."];
LABEL_16:

    goto LABEL_7;
  }
LABEL_5:
  if (!v14 && v15)
  {
    SEL v29 = a2;
    uint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:v29 object:self file:@"AMSBag.mm" lineNumber:142 description:@"'persistence' must be provided if 'persistenceQueue' is provided."];
    goto LABEL_16;
  }
LABEL_7:
  v31.receiver = self;
  v31.super_class = (Class)AMSBag;
  id v18 = [(AMSBag *)&v31 init];
  if (v18)
  {
    __int16 v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v20 = dispatch_queue_create("com.apple.AppleMediaServices.AMSBag.changeNotificationQueue", v19);
    changeNotificationQueue = v18->_changeNotificationQueue;
    v18->_changeNotificationQueue = (OS_dispatch_queue *)v20;

    objc_storeStrong((id *)&v18->_dataSource, a3);
    objc_storeStrong((id *)&v18->_persistence, a4);
    v18->_persistenceAPIWasCalled = 0;
    objc_storeStrong((id *)&v18->_persistenceQueue, a5);
    v18->_updateHandlerConsistencyLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v18->_updateHandlers, a6);
    if (v30) {
      [(AMSBag *)v18 _configureDataSourceHandlers];
    }
  }

  return v18;
}

- (void)_configureDataSourceHandlers
{
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__AMSBag__configureDataSourceHandlers__block_invoke;
  v7[3] = &unk_1E559F608;
  objc_copyWeak(&v8, &location);
  v3 = [(AMSBag *)self dataSource];
  [v3 setDataSourceChangedHandler:v7];

  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__AMSBag__configureDataSourceHandlers__block_invoke_2;
  v5[3] = &unk_1E559F630;
  objc_copyWeak(&v6, &location);
  BOOL v4 = [(AMSBag *)self dataSource];
  [v4 setDataSourceDataInvalidatedHandler:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

+ (id)sharedPersistenceWithDefaultDirectory
{
  if (qword_1EB38D6A0 != -1) {
    dispatch_once(&qword_1EB38D6A0, &__block_literal_global_45);
  }
  id v2 = (void *)qword_1EB38D6A8;
  return v2;
}

+ (id)sharedPersistenceQueue
{
  if (qword_1EB38D690 != -1) {
    dispatch_once(&qword_1EB38D690, &__block_literal_global_42);
  }
  id v2 = (void *)qword_1EB38D698;
  return v2;
}

- (id)_availableValuesFromCachedData:(id)a3 keys:(id)a4 partialIdentifier:(id)a5 expirationDate:(id)a6 updateHandler:(id)a7 outToken:(unint64_t *)a8
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v36 = a5;
  id v39 = a6;
  v37 = v13;
  id v38 = a7;
  id v15 = (void *)[v14 mutableCopy];
  id v16 = (void *)MEMORY[0x1E4F1CAD0];
  id v17 = [v13 allKeys];
  id v18 = [v16 setWithArray:v17];
  [v15 intersectSet:v18];

  uint64_t v19 = [v15 count];
  v35 = a8;
  uint64_t v20 = [v14 count];
  __int16 v21 = +[AMSLogConfig sharedBagConfig];
  if (!v21)
  {
    __int16 v21 = +[AMSLogConfig sharedConfig];
  }
  v22 = [v21 OSLogObject];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v23 = AMSLogKey();
    id v24 = NSString;
    if (v23)
    {
      uint64_t v25 = objc_opt_class();
      SEL v26 = AMSLogKey();
      v27 = [v24 stringWithFormat:@"%@: [%@] ", v25, v26];
    }
    else
    {
      v27 = [NSString stringWithFormat:@"%@: ", objc_opt_class()];
      SEL v26 = v27;
    }
    v28 = AMSHashIfNeeded(v36);
    *(_DWORD *)buf = 138544130;
    v42 = v27;
    __int16 v43 = 2048;
    uint64_t v44 = v19;
    __int16 v45 = 2048;
    uint64_t v46 = v20;
    __int16 v47 = 2114;
    v48 = v28;
    _os_log_impl(&dword_18D554000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@Returning %lu cached bag values from a total of %lu. partialBagIdentifier = %{public}@", buf, 0x2Au);
    if (v23) {
  }
    }
  SEL v29 = objc_msgSend(v37, "ams_valuesForKeys:", v15);
  BOOL v30 = [MEMORY[0x1E4F1C9C8] now];
  uint64_t v31 = [v39 compare:v30];

  id v32 = +[AMSBagPersistenceMetricsTracker trackerForCachedValuesCallWithRequestedValueCount:cachedValueCount:cachedBagWasExpired:](AMSBagPersistenceMetricsTracker, "trackerForCachedValuesCallWithRequestedValueCount:cachedValueCount:cachedBagWasExpired:", [v14 count], objc_msgSend(v15, "count"), v31 == -1);
  SEL v33 = [(AMSBag *)self updateHandlers];
  unint64_t *v35 = [v33 addHandlerWithKeys:v14 initialValues:v29 metricsTracker:v32 handler:v38];

  [(AMSBag *)self _loadAndPersistBag];
  return v29;
}

- (AMSBagCachedValueUpdateHandlers)updateHandlers
{
  return self->_updateHandlers;
}

- (void)_loadAndPersistBag
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  BOOL v4 = +[AMSLogConfig sharedBagConfig];
  if (!v4)
  {
    BOOL v4 = +[AMSLogConfig sharedConfig];
  }
  id v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = AMSLogKey();
    id v7 = NSString;
    if (v6)
    {
      uint64_t v8 = objc_opt_class();
      uint64_t v2 = AMSLogKey();
      [v7 stringWithFormat:@"%@: [%@] ", v8, v2];
    }
    else
    {
      [NSString stringWithFormat:@"%@: ", objc_opt_class()];
    id v9 = };
    *(_DWORD *)buf = 138543362;
    id v13 = v9;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Calling loadWithCompletion.", buf, 0xCu);
    if (v6)
    {

      id v9 = (void *)v2;
    }
  }
  v10 = [(AMSBag *)self dataSource];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __28__AMSBag__loadAndPersistBag__block_invoke;
  v11[3] = &unk_1E559F520;
  v11[4] = self;
  [v10 loadWithCompletion:v11];
}

void __39__AMSBag_createSnapshotWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v8 = AMSSetLogKey(*(void **)(a1 + 32));
  if (WeakRetained)
  {
    if (v5)
    {
      id v9 = objc_alloc_init(AMSSnapshotBagBuilder);
      v10 = [v5 data];
      [(AMSSnapshotBagBuilder *)v9 setData:v10];

      id v11 = [WeakRetained expirationDate];
      [(AMSSnapshotBagBuilder *)v9 setExpirationDate:v11];

      id v12 = [WeakRetained profile];
      [(AMSSnapshotBagBuilder *)v9 setProfile:v12];

      id v13 = [WeakRetained profileVersion];
      [(AMSSnapshotBagBuilder *)v9 setProfileVersion:v13];

      uint64_t v14 = [WeakRetained processInfo];
      [(AMSSnapshotBagBuilder *)v9 setProcessInfo:v14];

      id v37 = 0;
      id v15 = [(AMSSnapshotBagBuilder *)v9 buildWithError:&v37];
      id v36 = v37;
      if (v15)
      {
        id v16 = +[AMSLogConfig sharedBagConfig];
        if (!v16)
        {
          id v16 = +[AMSLogConfig sharedConfig];
        }
        id v17 = [v16 OSLogObject];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          id v18 = (id)objc_opt_class();
          uint64_t v19 = AMSLogKey();
          *(_DWORD *)buf = 138543618;
          id v39 = v18;
          __int16 v40 = 2114;
          v41 = v19;
          _os_log_impl(&dword_18D554000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successfully created the snapshot.", buf, 0x16u);
        }
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      }
      else
      {
        SEL v29 = +[AMSLogConfig sharedBagConfig];
        if (!v29)
        {
          SEL v29 = +[AMSLogConfig sharedConfig];
        }
        BOOL v30 = [v29 OSLogObject];
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          id v35 = (id)objc_opt_class();
          uint64_t v31 = AMSLogKey();
          id v32 = AMSHashIfNeeded(v6);
          *(_DWORD *)buf = 138543874;
          id v39 = v35;
          __int16 v40 = 2114;
          v41 = v31;
          __int16 v42 = 2114;
          id v43 = v32;
          _os_log_impl(&dword_18D554000, v30, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to create the snapshot. error = %{public}@", buf, 0x20u);
        }
        uint64_t v33 = *(void *)(a1 + 40);
        id v34 = AMSError(205, @"Cannot Create Snapshot", @"We failed to create the snapshot.", v36);
        (*(void (**)(uint64_t, void, void *))(v33 + 16))(v33, 0, v34);
      }
    }
    else
    {
      id v24 = +[AMSLogConfig sharedBagConfig];
      if (!v24)
      {
        id v24 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v25 = [v24 OSLogObject];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        id v26 = (id)objc_opt_class();
        v27 = AMSLogKey();
        *(_DWORD *)buf = 138543874;
        id v39 = v26;
        __int16 v40 = 2114;
        v41 = v27;
        __int16 v42 = 2114;
        id v43 = v6;
        _os_log_impl(&dword_18D554000, v25, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to load the bag. Unable to create a snapshot. error = %{public}@", buf, 0x20u);
      }
      uint64_t v28 = *(void *)(a1 + 40);
      AMSError(205, @"Cannot Create Snapshot", @"We can't create a snapshot because we failed to load the bag.", v6);
      id v9 = (AMSSnapshotBagBuilder *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void, AMSSnapshotBagBuilder *))(v28 + 16))(v28, 0, v9);
    }
  }
  else
  {
    uint64_t v20 = +[AMSLogConfig sharedBagConfig];
    if (!v20)
    {
      uint64_t v20 = +[AMSLogConfig sharedConfig];
    }
    __int16 v21 = [v20 OSLogObject];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = AMSLogKey();
      *(_DWORD *)buf = 138543362;
      id v39 = v22;
      _os_log_impl(&dword_18D554000, v21, OS_LOG_TYPE_ERROR, "AMSBag: [%{public}@] Someone called -[AMSBag createSnapshotWithCompletion:] but didn't hold onto a reference to the original AMSBag.", buf, 0xCu);
    }
    uint64_t v23 = *(void *)(a1 + 40);
    AMSError(0, 0, 0, v6);
    id v9 = (AMSSnapshotBagBuilder *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, AMSSnapshotBagBuilder *))(v23 + 16))(v23, 0, v9);
  }
}

- (NSString)profile
{
  uint64_t v2 = [(AMSBag *)self dataSource];
  v3 = [v2 profile];

  return (NSString *)v3;
}

- (NSString)profileVersion
{
  uint64_t v2 = [(AMSBag *)self dataSource];
  v3 = [v2 profileVersion];

  return (NSString *)v3;
}

- (BOOL)isExpired
{
  uint64_t v2 = [(AMSBag *)self expirationDate];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F1C9C8] date];
    BOOL v4 = [v3 compare:v2] == 1;
  }
  else
  {
    BOOL v4 = 1;
  }

  return v4;
}

- (NSDate)expirationDate
{
  uint64_t v2 = [(AMSBag *)self dataSource];
  v3 = [v2 expirationDate];

  return (NSDate *)v3;
}

- (AMSProcessInfo)processInfo
{
  uint64_t v2 = [(AMSBag *)self dataSource];
  v3 = [v2 processInfo];

  return (AMSProcessInfo *)v3;
}

void __38__AMSBag__configureDataSourceHandlers__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = [WeakRetained persistenceQueue];

    if (v7)
    {
      id v8 = [v6 persistenceQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __38__AMSBag__configureDataSourceHandlers__block_invoke_120;
      block[3] = &unk_1E559F4D0;
      block[4] = v6;
      dispatch_async(v8, block);
    }
    id v9 = +[AMSLogConfig sharedBagConfig];
    if (!v9)
    {
      id v9 = +[AMSLogConfig sharedConfig];
    }
    v10 = [v9 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = AMSLogKey();
      id v12 = NSString;
      if (v11)
      {
        uint64_t v13 = objc_opt_class();
        uint64_t v2 = AMSLogKey();
        [v12 stringWithFormat:@"%@: [%@] ", v13, v2];
      }
      else
      {
        [NSString stringWithFormat:@"%@: ", objc_opt_class()];
      uint64_t v14 = };
      *(_DWORD *)buf = 138543362;
      id v43 = v14;
      _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@The bag changed. Posting a notification.", buf, 0xCu);
      if (v11)
      {

        uint64_t v14 = (void *)v2;
      }
    }
    if ([v6 persistenceIsEnabled]
      && [v6 persistenceAPIWasCalled])
    {
      __int16 v21 = [v4 updatedData];
      v22 = [v4 loadedBagIdentifier];
      uint64_t v23 = [v4 loadedBagPartialIdentifier];
      id v24 = [v4 updatedExpirationDate];
      [v6 _persistBagDictionary:v21 withIdentifier:v22 partialIdentifier:v23 expirationDate:v24 onlyIfPreExisting:1];
    }
    uint64_t v25 = [v6 updateHandlers];
    id v26 = [v4 updatedData];
    v27 = [v4 changedKeys];
    [v25 callHandlersUsingNewBagDictionary:v26 changedKeys:v27];

    v40[0] = @"profile";
    uint64_t v28 = [v6 profile];
    v41[0] = v28;
    v40[1] = @"profileVersion";
    SEL v29 = [v6 profileVersion];
    v41[1] = v29;
    v40[2] = @"changedKeys";
    BOOL v30 = [v4 changedKeys];
    uint64_t v31 = [v30 allObjects];
    v41[2] = v31;
    uint64_t v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:3];
    uint64_t v33 = (void *)[(id)v32 mutableCopy];

    id v34 = [v4 accountIdentifier];
    LOBYTE(v32) = v34 == 0;

    if ((v32 & 1) == 0)
    {
      id v35 = [v4 accountIdentifier];
      [v33 setObject:v35 forKeyedSubscript:@"accountIdentifier"];
    }
    id v36 = [v6 changeNotificationQueue];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __38__AMSBag__configureDataSourceHandlers__block_invoke_122;
    v37[3] = &unk_1E559F5E0;
    v37[4] = v6;
    id v15 = v33;
    id v38 = v15;
    AMSDispatchAsync(v36, v37);
  }
  else
  {
    id v15 = +[AMSLogConfig sharedBagConfig];
    if (!v15)
    {
      id v15 = +[AMSLogConfig sharedConfig];
    }
    id v16 = [v15 OSLogObject];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = AMSLogKey();
      id v18 = NSString;
      objc_opt_class();
      if (v17)
      {
        uint64_t v19 = objc_opt_class();
        uint64_t v2 = AMSLogKey();
        [v18 stringWithFormat:@"%@: [%@] ", v19, v2];
      }
      else
      {
        [v18 stringWithFormat:@"%@: ", objc_opt_class()];
      uint64_t v20 = };
      *(_DWORD *)buf = 138543362;
      id v43 = v20;
      _os_log_impl(&dword_18D554000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@dataSourceChangedHandler was called, but the owning bag was deallocated after the handler was called. No AMSBagChangedNotification will be posted.", buf, 0xCu);
      if (v17)
      {

        uint64_t v20 = (void *)v2;
      }
    }
  }
}

- (void)_persistBagDictionary:(id)a3 withIdentifier:(id)a4 partialIdentifier:(id)a5 expirationDate:(id)a6 onlyIfPreExisting:(BOOL)a7
{
  uint64_t v137 = *MEMORY[0x1E4F143B8];
  id v121 = a3;
  id v124 = a4;
  id v122 = a5;
  id v123 = a6;
  id v11 = [(AMSBag *)self persistence];

  if (!v11)
  {
    if (+[AMSUnitTests isRunningUnitTests])
    {
      id v12 = +[AMSLogConfig sharedBagConfig];
      if (!v12)
      {
        id v12 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v13 = [v12 OSLogObject];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        uint64_t v14 = AMSLogKey();
        id v15 = NSString;
        if (v14)
        {
          uint64_t v16 = objc_opt_class();
          uint64_t v118 = AMSLogKey();
          id v17 = [v15 stringWithFormat:@"%@: [%@] ", v16, v118];
          id v18 = (void *)v118;
        }
        else
        {
          id v17 = [NSString stringWithFormat:@"%@: ", objc_opt_class()];
          id v18 = v17;
        }
        id v26 = AMSHashIfNeeded(@"self.persistence");
        v27 = AMSHashIfNeeded(@"persistence was unexpectedly nil.");
        *(_DWORD *)buf = 138543874;
        v132 = v17;
        __int16 v133 = 2114;
        v134 = v26;
        __int16 v135 = 2114;
        v136 = v27;
        _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_ERROR, "%{public}@Assertion failed: %{public}@. Description: %{public}@", buf, 0x20u);
        if (v14) {
      }
        }
      uint64_t v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
      uint64_t v20 = +[AMSLogConfig sharedBagConfig];
      [v19 postNotificationName:@"com.apple.AppleMediaServicesTests.FaultLogged" object:v20 userInfo:0];
    }
    else
    {
      uint64_t v19 = +[AMSLogConfig sharedBagConfig];
      if (!v19)
      {
        uint64_t v19 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v20 = [v19 OSLogObject];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      {
        __int16 v21 = AMSLogKey();
        v22 = NSString;
        if (v21)
        {
          uint64_t v23 = objc_opt_class();
          id v24 = AMSLogKey();
          uint64_t v25 = [v22 stringWithFormat:@"%@: [%@] ", v23, v24];
        }
        else
        {
          uint64_t v25 = [NSString stringWithFormat:@"%@: ", objc_opt_class()];
          id v24 = v25;
        }
        uint64_t v28 = AMSHashIfNeeded(@"self.persistence");
        SEL v29 = AMSHashIfNeeded(@"persistence was unexpectedly nil.");
        *(_DWORD *)buf = 138543874;
        v132 = v25;
        __int16 v133 = 2114;
        v134 = v28;
        __int16 v135 = 2114;
        v136 = v29;
        _os_log_impl(&dword_18D554000, v20, OS_LOG_TYPE_FAULT, "%{public}@Assertion failed: %{public}@. Description: %{public}@", buf, 0x20u);
        if (v21) {
      }
        }
    }
  }
  BOOL v30 = [(AMSBag *)self persistenceQueue];

  if (!v30)
  {
    if (+[AMSUnitTests isRunningUnitTests])
    {
      uint64_t v31 = +[AMSLogConfig sharedBagConfig];
      if (!v31)
      {
        uint64_t v31 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v32 = [v31 OSLogObject];
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        uint64_t v33 = AMSLogKey();
        id v34 = NSString;
        if (v33)
        {
          uint64_t v35 = objc_opt_class();
          v119 = AMSLogKey();
          id v36 = [v34 stringWithFormat:@"%@: [%@] ", v35, v119];
        }
        else
        {
          id v36 = [NSString stringWithFormat:@"%@: ", objc_opt_class()];
          v119 = v36;
        }
        uint64_t v44 = AMSHashIfNeeded(@"self.persistenceQueue");
        __int16 v45 = AMSHashIfNeeded(@"persistenceQueue was unexpectedly nil.");
        *(_DWORD *)buf = 138543874;
        v132 = v36;
        __int16 v133 = 2114;
        v134 = v44;
        __int16 v135 = 2114;
        v136 = v45;
        _os_log_impl(&dword_18D554000, v32, OS_LOG_TYPE_ERROR, "%{public}@Assertion failed: %{public}@. Description: %{public}@", buf, 0x20u);
        if (v33) {
      }
        }
      id v37 = [MEMORY[0x1E4F28EB8] defaultCenter];
      id v38 = +[AMSLogConfig sharedBagConfig];
      [v37 postNotificationName:@"com.apple.AppleMediaServicesTests.FaultLogged" object:v38 userInfo:0];
    }
    else
    {
      id v37 = +[AMSLogConfig sharedBagConfig];
      if (!v37)
      {
        id v37 = +[AMSLogConfig sharedConfig];
      }
      id v38 = [v37 OSLogObject];
      if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
      {
        id v39 = AMSLogKey();
        __int16 v40 = NSString;
        if (v39)
        {
          uint64_t v41 = objc_opt_class();
          __int16 v42 = AMSLogKey();
          id v43 = [v40 stringWithFormat:@"%@: [%@] ", v41, v42];
        }
        else
        {
          id v43 = [NSString stringWithFormat:@"%@: ", objc_opt_class()];
          __int16 v42 = v43;
        }
        uint64_t v46 = AMSHashIfNeeded(@"self.persistenceQueue");
        __int16 v47 = AMSHashIfNeeded(@"persistenceQueue was unexpectedly nil.");
        *(_DWORD *)buf = 138543874;
        v132 = v43;
        __int16 v133 = 2114;
        v134 = v46;
        __int16 v135 = 2114;
        v136 = v47;
        _os_log_impl(&dword_18D554000, v38, OS_LOG_TYPE_FAULT, "%{public}@Assertion failed: %{public}@. Description: %{public}@", buf, 0x20u);
        if (v39) {
      }
        }
    }
  }
  if (v11) {
    BOOL v48 = v30 == 0;
  }
  else {
    BOOL v48 = 1;
  }
  int v49 = !v48;
  v50 = v124;
  if (!v124)
  {
    if (+[AMSUnitTests isRunningUnitTests])
    {
      v51 = +[AMSLogConfig sharedBagConfig];
      if (!v51)
      {
        v51 = +[AMSLogConfig sharedConfig];
      }
      v52 = [v51 OSLogObject];
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      {
        v53 = AMSLogKey();
        v54 = NSString;
        if (v53)
        {
          uint64_t v55 = objc_opt_class();
          v56 = AMSLogKey();
          v57 = [v54 stringWithFormat:@"%@: [%@] ", v55, v56];
        }
        else
        {
          v57 = [NSString stringWithFormat:@"%@: ", objc_opt_class()];
          v56 = v57;
        }
        v65 = AMSHashIfNeeded(@"identifier");
        v66 = AMSHashIfNeeded(@"identifier argument was unexpectedly nil.");
        *(_DWORD *)buf = 138543874;
        v132 = v57;
        __int16 v133 = 2114;
        v134 = v65;
        __int16 v135 = 2114;
        v136 = v66;
        _os_log_impl(&dword_18D554000, v52, OS_LOG_TYPE_ERROR, "%{public}@Assertion failed: %{public}@. Description: %{public}@", buf, 0x20u);
        if (v53) {
      }
        }
      v58 = [MEMORY[0x1E4F28EB8] defaultCenter];
      v59 = +[AMSLogConfig sharedBagConfig];
      [v58 postNotificationName:@"com.apple.AppleMediaServicesTests.FaultLogged" object:v59 userInfo:0];
    }
    else
    {
      v58 = +[AMSLogConfig sharedBagConfig];
      if (!v58)
      {
        v58 = +[AMSLogConfig sharedConfig];
      }
      v59 = [v58 OSLogObject];
      if (os_log_type_enabled(v59, OS_LOG_TYPE_FAULT))
      {
        v60 = AMSLogKey();
        v61 = NSString;
        if (v60)
        {
          uint64_t v62 = objc_opt_class();
          v63 = AMSLogKey();
          v64 = [v61 stringWithFormat:@"%@: [%@] ", v62, v63];
        }
        else
        {
          v64 = [NSString stringWithFormat:@"%@: ", objc_opt_class()];
          v63 = v64;
        }
        v67 = AMSHashIfNeeded(@"identifier");
        v68 = AMSHashIfNeeded(@"identifier argument was unexpectedly nil.");
        *(_DWORD *)buf = 138543874;
        v132 = v64;
        __int16 v133 = 2114;
        v134 = v67;
        __int16 v135 = 2114;
        v136 = v68;
        _os_log_impl(&dword_18D554000, v59, OS_LOG_TYPE_FAULT, "%{public}@Assertion failed: %{public}@. Description: %{public}@", buf, 0x20u);
        if (v60) {
      }
        }
    }

    v50 = 0;
  }
  if (!v50) {
    int v49 = 0;
  }
  v69 = v123;
  if (!v123)
  {
    if (+[AMSUnitTests isRunningUnitTests])
    {
      v70 = +[AMSLogConfig sharedBagConfig];
      if (!v70)
      {
        v70 = +[AMSLogConfig sharedConfig];
      }
      v71 = [v70 OSLogObject];
      if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
      {
        v72 = AMSLogKey();
        v73 = NSString;
        if (v72)
        {
          uint64_t v74 = objc_opt_class();
          v75 = AMSLogKey();
          v76 = [v73 stringWithFormat:@"%@: [%@] ", v74, v75];
        }
        else
        {
          v76 = [NSString stringWithFormat:@"%@: ", objc_opt_class()];
          v75 = v76;
        }
        v84 = AMSHashIfNeeded(@"expirationDate");
        v85 = AMSHashIfNeeded(@"expirationDate argument was unexpectedly nil.");
        *(_DWORD *)buf = 138543874;
        v132 = v76;
        __int16 v133 = 2114;
        v134 = v84;
        __int16 v135 = 2114;
        v136 = v85;
        _os_log_impl(&dword_18D554000, v71, OS_LOG_TYPE_ERROR, "%{public}@Assertion failed: %{public}@. Description: %{public}@", buf, 0x20u);
        if (v72) {
      }
        }
      v77 = [MEMORY[0x1E4F28EB8] defaultCenter];
      v78 = +[AMSLogConfig sharedBagConfig];
      [v77 postNotificationName:@"com.apple.AppleMediaServicesTests.FaultLogged" object:v78 userInfo:0];
    }
    else
    {
      v77 = +[AMSLogConfig sharedBagConfig];
      if (!v77)
      {
        v77 = +[AMSLogConfig sharedConfig];
      }
      v78 = [v77 OSLogObject];
      if (os_log_type_enabled(v78, OS_LOG_TYPE_FAULT))
      {
        v79 = AMSLogKey();
        v80 = NSString;
        if (v79)
        {
          uint64_t v81 = objc_opt_class();
          v82 = AMSLogKey();
          v83 = [v80 stringWithFormat:@"%@: [%@] ", v81, v82];
        }
        else
        {
          v83 = [NSString stringWithFormat:@"%@: ", objc_opt_class()];
          v82 = v83;
        }
        v86 = AMSHashIfNeeded(@"expirationDate");
        v87 = AMSHashIfNeeded(@"expirationDate argument was unexpectedly nil.");
        *(_DWORD *)buf = 138543874;
        v132 = v83;
        __int16 v133 = 2114;
        v134 = v86;
        __int16 v135 = 2114;
        v136 = v87;
        _os_log_impl(&dword_18D554000, v78, OS_LOG_TYPE_FAULT, "%{public}@Assertion failed: %{public}@. Description: %{public}@", buf, 0x20u);
        if (v79) {
      }
        }
    }

    v69 = 0;
    v50 = v124;
  }
  if (v69) {
    int v88 = v49;
  }
  else {
    int v88 = 0;
  }
  if (![v50 length])
  {
    if (+[AMSUnitTests isRunningUnitTests])
    {
      v96 = +[AMSLogConfig sharedBagConfig];
      if (!v96)
      {
        v96 = +[AMSLogConfig sharedConfig];
      }
      v97 = [v96 OSLogObject];
      if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
      {
        v98 = AMSLogKey();
        v99 = NSString;
        if (v98)
        {
          uint64_t v100 = objc_opt_class();
          v101 = AMSLogKey();
          v102 = [v99 stringWithFormat:@"%@: [%@] ", v100, v101];
        }
        else
        {
          v102 = [NSString stringWithFormat:@"%@: ", objc_opt_class()];
          v101 = v102;
        }
        v112 = AMSHashIfNeeded(@"identifier.length > 0");
        v113 = AMSHashIfNeeded(@"'identifier' must be non-empty in order to persist a bag.");
        *(_DWORD *)buf = 138543874;
        v132 = v102;
        __int16 v133 = 2114;
        v134 = v112;
        __int16 v135 = 2114;
        v136 = v113;
        _os_log_impl(&dword_18D554000, v97, OS_LOG_TYPE_ERROR, "%{public}@Assertion failed: %{public}@. Description: %{public}@", buf, 0x20u);
        if (v98) {
      }
        }
      v114 = [MEMORY[0x1E4F28EB8] defaultCenter];
      v115 = +[AMSLogConfig sharedBagConfig];
      [v114 postNotificationName:@"com.apple.AppleMediaServicesTests.FaultLogged" object:v115 userInfo:0];
    }
    else
    {
      v103 = +[AMSLogConfig sharedBagConfig];
      if (!v103)
      {
        v103 = +[AMSLogConfig sharedConfig];
      }
      v104 = [v103 OSLogObject];
      if (os_log_type_enabled(v104, OS_LOG_TYPE_FAULT))
      {
        v105 = AMSLogKey();
        v106 = NSString;
        if (v105)
        {
          uint64_t v107 = objc_opt_class();
          v108 = AMSLogKey();
          v109 = [v106 stringWithFormat:@"%@: [%@] ", v107, v108];
        }
        else
        {
          v109 = [NSString stringWithFormat:@"%@: ", objc_opt_class()];
          v108 = v109;
        }
        v116 = AMSHashIfNeeded(@"identifier.length > 0");
        v117 = AMSHashIfNeeded(@"'identifier' must be non-empty in order to persist a bag.");
        *(_DWORD *)buf = 138543874;
        v132 = v109;
        __int16 v133 = 2114;
        v134 = v116;
        __int16 v135 = 2114;
        v136 = v117;
        _os_log_impl(&dword_18D554000, v104, OS_LOG_TYPE_FAULT, "%{public}@Assertion failed: %{public}@. Description: %{public}@", buf, 0x20u);
        if (v105) {
      }
        }
    }
    goto LABEL_133;
  }
  if (v88)
  {
    v89 = +[AMSLogConfig sharedBagConfig];
    if (!v89)
    {
      v89 = +[AMSLogConfig sharedConfig];
    }
    v90 = [v89 OSLogObject];
    if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
    {
      v91 = AMSLogKey();
      v92 = NSString;
      if (v91)
      {
        uint64_t v93 = objc_opt_class();
        v94 = AMSLogKey();
        v95 = [v92 stringWithFormat:@"%@: [%@] ", v93, v94];
      }
      else
      {
        v95 = [NSString stringWithFormat:@"%@: ", objc_opt_class()];
        v94 = v95;
      }
      v110 = AMSHashIfNeeded(v124);
      *(_DWORD *)buf = 138543618;
      v132 = v95;
      __int16 v133 = 2114;
      v134 = v110;
      _os_log_impl(&dword_18D554000, v90, OS_LOG_TYPE_DEFAULT, "%{public}@Enqueuing async bag persistence. bagIdentifier = %{public}@", buf, 0x16u);
      if (v91) {
    }
      }
    v111 = [(AMSBag *)self persistenceQueue];
    v125[0] = MEMORY[0x1E4F143A8];
    v125[1] = 3221225472;
    v125[2] = __98__AMSBag__persistBagDictionary_withIdentifier_partialIdentifier_expirationDate_onlyIfPreExisting___block_invoke;
    v125[3] = &unk_1E559F658;
    v125[4] = self;
    id v126 = v124;
    id v127 = v123;
    BOOL v130 = a7;
    id v128 = v122;
    id v129 = v121;
    AMSDispatchAsync(v111, v125);

LABEL_133:
    v69 = v123;
  }
}

- (OS_dispatch_queue)persistenceQueue
{
  return self->_persistenceQueue;
}

void __98__AMSBag__persistBagDictionary_withIdentifier_partialIdentifier_expirationDate_onlyIfPreExisting___block_invoke(uint64_t a1)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[AMSLogConfig sharedBagConfig];
  if (!v2)
  {
    uint64_t v2 = +[AMSLogConfig sharedConfig];
  }
  v3 = [v2 OSLogObject];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = AMSLogKey();
    id v5 = NSString;
    if (v4)
    {
      uint64_t v6 = objc_opt_class();
      id v7 = AMSLogKey();
      id v8 = [v5 stringWithFormat:@"%@: [%@] ", v6, v7];
    }
    else
    {
      id v8 = [NSString stringWithFormat:@"%@: ", objc_opt_class()];
      id v7 = v8;
    }
    id v9 = AMSHashIfNeeded(*(void **)(a1 + 40));
    *(_DWORD *)buf = 138543618;
    uint64_t v42 = (uint64_t)v8;
    __int16 v43 = 2114;
    id v44 = v9;
    _os_log_impl(&dword_18D554000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@Starting enqueued async bag persistence. bagIdentifier = %{public}@", buf, 0x16u);
    if (v4) {
  }
    }
  v10 = [*(id *)(a1 + 32) persistence];
  uint64_t v11 = *(void *)(a1 + 40);
  id v40 = 0;
  id v12 = [v10 underlyingDataFor:v11 error:&v40];
  id v13 = v40;

  if (v12)
  {
    uint64_t v14 = [v12 expirationDate];
    BOOL v15 = [v14 compare:*(void *)(a1 + 48)] == -1;

    if (!v15)
    {
      uint64_t v16 = +[AMSLogConfig sharedBagConfig];
      if (!v16)
      {
        uint64_t v16 = +[AMSLogConfig sharedConfig];
      }
      id v17 = [v16 OSLogObject];
      if (os_log_type_enabled(&v17->super, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = objc_opt_class();
        uint64_t v19 = AMSLogKey();
        uint64_t v20 = AMSHashIfNeeded(*(void **)(a1 + 40));
        *(_DWORD *)buf = 138543874;
        uint64_t v42 = v18;
        __int16 v43 = 2114;
        id v44 = v19;
        __int16 v45 = 2114;
        uint64_t v46 = v20;
        _os_log_impl(&dword_18D554000, &v17->super, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Bag won't be persisted since the expiration date is earlier than an existing persisted one. bagIdentifier = %{public}@", buf, 0x20u);
      }
      goto LABEL_39;
    }
  }
  if (!v13)
  {
LABEL_23:
    uint64_t v16 = [MEMORY[0x1E4F1CA80] setWithObject:*(void *)(a1 + 56)];
    if (v12)
    {
      id v24 = [v12 aliasKeys];
      [v16 unionSet:v24];
    }
    id v17 = [[AMSBagUnderlyingData alloc] initWithFileKey:*(void *)(a1 + 40) aliasKeys:v16 bagDictionary:*(void *)(a1 + 64) expirationDate:*(void *)(a1 + 48)];

    uint64_t v25 = [*(id *)(a1 + 32) persistence];
    id v39 = 0;
    [v25 persist:v17 error:&v39];
    id v13 = v39;

    if (v13)
    {
      id v26 = +[AMSLogConfig sharedBagConfig];
      if (!v26)
      {
        id v26 = +[AMSLogConfig sharedConfig];
      }
      v27 = [v26 OSLogObject];
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        uint64_t v28 = objc_opt_class();
        AMSLogKey();
        id v29 = (id)objc_claimAutoreleasedReturnValue();
        BOOL v30 = AMSLogableError(v13);
        uint64_t v31 = AMSHashIfNeeded(*(void **)(a1 + 40));
        *(_DWORD *)buf = 138544130;
        uint64_t v42 = v28;
        __int16 v43 = 2114;
        id v44 = v29;
        __int16 v45 = 2114;
        uint64_t v46 = v30;
        __int16 v47 = 2114;
        BOOL v48 = v31;
        _os_log_impl(&dword_18D554000, v27, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to persist bag. error = %{public}@ | bagIdentifier = %{public}@", buf, 0x2Au);
      }
    }
    else
    {
      id v26 = +[AMSLogConfig sharedBagConfig];
      if (!v26)
      {
        id v26 = +[AMSLogConfig sharedConfig];
      }
      v27 = [v26 OSLogObject];
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v36 = objc_opt_class();
        id v37 = AMSLogKey();
        id v38 = AMSHashIfNeeded(*(void **)(a1 + 40));
        *(_DWORD *)buf = 138543874;
        uint64_t v42 = v36;
        __int16 v43 = 2114;
        id v44 = v37;
        __int16 v45 = 2114;
        uint64_t v46 = v38;
        _os_log_impl(&dword_18D554000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successfully persisted bag. bagIdentifier = %{public}@", buf, 0x20u);
      }
    }

    goto LABEL_39;
  }
  if (AMSErrorIsEqual(v13, @"AMSErrorDomain", 7))
  {
    if (*(unsigned char *)(a1 + 72))
    {
      uint64_t v16 = +[AMSLogConfig sharedBagConfig];
      if (!v16)
      {
        uint64_t v16 = +[AMSLogConfig sharedConfig];
      }
      id v17 = [v16 OSLogObject];
      if (os_log_type_enabled(&v17->super, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v21 = objc_opt_class();
        v22 = AMSLogKey();
        uint64_t v23 = AMSHashIfNeeded(*(void **)(a1 + 40));
        *(_DWORD *)buf = 138543874;
        uint64_t v42 = v21;
        __int16 v43 = 2114;
        id v44 = v22;
        __int16 v45 = 2114;
        uint64_t v46 = v23;
        _os_log_impl(&dword_18D554000, &v17->super, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Bag won't be persisted as an existing persisted bag wasn't found. bagIdentifier = %{public}@", buf, 0x20u);
      }
      goto LABEL_39;
    }
    goto LABEL_23;
  }
  uint64_t v16 = +[AMSLogConfig sharedBagConfig];
  if (!v16)
  {
    uint64_t v16 = +[AMSLogConfig sharedConfig];
  }
  id v17 = [v16 OSLogObject];
  if (os_log_type_enabled(&v17->super, OS_LOG_TYPE_ERROR))
  {
    uint64_t v32 = objc_opt_class();
    AMSLogKey();
    id v33 = (id)objc_claimAutoreleasedReturnValue();
    id v34 = AMSLogableError(v13);
    uint64_t v35 = AMSHashIfNeeded(*(void **)(a1 + 40));
    *(_DWORD *)buf = 138544130;
    uint64_t v42 = v32;
    __int16 v43 = 2114;
    id v44 = v33;
    __int16 v45 = 2114;
    uint64_t v46 = v34;
    __int16 v47 = 2114;
    BOOL v48 = v35;
    _os_log_impl(&dword_18D554000, &v17->super, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to load persisted bag. error = %{public}@ | bagIdentifier = %{public}@", buf, 0x2Au);
  }
LABEL_39:
}

- (AMSBagUnderlyingDataPersistence)persistence
{
  return self->_persistence;
}

- (BOOL)persistenceIsEnabled
{
  uint64_t v2 = [(AMSBag *)self persistence];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)persistenceAPIWasCalled
{
  return self->_persistenceAPIWasCalled;
}

- (OS_dispatch_queue)changeNotificationQueue
{
  return self->_changeNotificationQueue;
}

- (id)integerForKey:(id)a3
{
  id v4 = a3;
  id v5 = [AMSBagValue alloc];
  uint64_t v6 = [(AMSBag *)self dataSource];
  id v7 = [(AMSBagValue *)v5 initWithDataSource:v6 key:v4 valueType:3];

  return v7;
}

uint64_t __47__AMSBag_sharedPersistenceWithDefaultDirectory__block_invoke()
{
  qword_1EB38D6A8 = +[AMSBagUnderlyingDataPersistence persistenceWithDefaultDirectory];
  return MEMORY[0x1F41817F8]();
}

uint64_t __18__AMSBag_bagCache__block_invoke()
{
  qword_1EB38D688 = objc_alloc_init(AMSBagCache);
  return MEMORY[0x1F41817F8]();
}

void __28__AMSBag__loadAndPersistBag__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = +[AMSLogConfig sharedBagConfig];
  if (!v8)
  {
    id v8 = +[AMSLogConfig sharedConfig];
  }
  id v9 = [v8 OSLogObject];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v3 = AMSLogKey();
    v10 = NSString;
    if (v3)
    {
      uint64_t v11 = objc_opt_class();
      uint64_t v4 = AMSLogKey();
      [v10 stringWithFormat:@"%@: [%@] ", v11, v4];
    }
    else
    {
      [NSString stringWithFormat:@"%@: ", objc_opt_class()];
    id v12 = };
    *(_DWORD *)buf = 138543362;
    uint64_t v42 = v12;
    _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Handling result of loadWithCompletion.", buf, 0xCu);
    if (v3)
    {

      id v12 = (void *)v4;
    }
  }
  if (a3)
  {
    id v13 = +[AMSLogConfig sharedBagConfig];
    if (!v13)
    {
      id v13 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v14 = [v13 OSLogObject];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      BOOL v15 = AMSLogKey();
      uint64_t v16 = NSString;
      if (v15)
      {
        uint64_t v17 = objc_opt_class();
        uint64_t v18 = AMSLogKey();
        uint64_t v19 = [v16 stringWithFormat:@"%@: [%@] ", v17, v18];
      }
      else
      {
        uint64_t v19 = [NSString stringWithFormat:@"%@: ", objc_opt_class()];
        uint64_t v18 = v19;
      }
      id v34 = [v7 loadedBagIdentifier];
      uint64_t v35 = AMSHashIfNeeded(v34);
      *(_DWORD *)buf = 138543618;
      uint64_t v42 = v19;
      __int16 v43 = 2114;
      id v44 = v35;
      _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to load bag while attempting persistence. bagIdentifier = %{public}@", buf, 0x16u);

      if (v15) {
    }
      }
  }
  else
  {
    uint64_t v20 = [v7 loadedBagIdentifier];
    if (!v20
      || ([v7 loadedBagIdentifier],
          uint64_t v21 = objc_claimAutoreleasedReturnValue(),
          BOOL v22 = [v21 length] == 0,
          v21,
          v20,
          v22))
    {
      id v13 = +[AMSLogConfig sharedBagConfig];
      if (!v13)
      {
        id v13 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v14 = [v13 OSLogObject];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v30 = AMSLogKey();
        uint64_t v31 = NSString;
        if (v30)
        {
          uint64_t v32 = objc_opt_class();
          BOOL v3 = AMSLogKey();
          [v31 stringWithFormat:@"%@: [%@] ", v32, v3];
        }
        else
        {
          [NSString stringWithFormat:@"%@: ", objc_opt_class()];
        id v33 = };
        *(_DWORD *)buf = 138543362;
        uint64_t v42 = v33;
        _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Bag persistence will be skipped as no loadedBagIdentifier was provided.", buf, 0xCu);
        if (v30)
        {

          id v33 = v3;
        }
      }
    }
    else
    {
      uint64_t v23 = +[AMSLogConfig sharedBagConfig];
      if (!v23)
      {
        uint64_t v23 = +[AMSLogConfig sharedConfig];
      }
      id v24 = [v23 OSLogObject];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v25 = AMSLogKey();
        id v26 = NSString;
        if (v25)
        {
          uint64_t v27 = objc_opt_class();
          uint64_t v28 = AMSLogKey();
          id v29 = [v26 stringWithFormat:@"%@: [%@] ", v27, v28];
        }
        else
        {
          id v29 = [NSString stringWithFormat:@"%@: ", objc_opt_class()];
          uint64_t v28 = v29;
        }
        uint64_t v36 = [v7 loadedBagIdentifier];
        id v37 = AMSHashIfNeeded(v36);
        *(_DWORD *)buf = 138543618;
        uint64_t v42 = v29;
        __int16 v43 = 2114;
        id v44 = v37;
        _os_log_impl(&dword_18D554000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@Attempting bag persistence. bagIdentifier = %{public}@", buf, 0x16u);

        if (v25) {
      }
        }

      id v38 = *(void **)(a1 + 32);
      id v13 = [v7 data];
      uint64_t v14 = [v7 loadedBagIdentifier];
      id v39 = [v7 loadedBagPartialIdentifier];
      id v40 = [v7 expirationDate];
      [v38 _persistBagDictionary:v13 withIdentifier:v14 partialIdentifier:v39 expirationDate:v40 onlyIfPreExisting:0];
    }
  }
}

void __32__AMSBag_sharedPersistenceQueue__block_invoke()
{
  uint64_t v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.AppleMediaServices.AMSBag.persistenceQueue", v2);
  v1 = (void *)qword_1EB38D698;
  qword_1EB38D698 = (uint64_t)v0;
}

void __61__AMSBag_cachedValuesForKeys_observationToken_updateHandler___block_invoke_87(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [*(id *)(a1 + 32) temporaryPreloadedBagData];

  if (v3)
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) temporaryPreloadedBagData];
    MEMORY[0x1F41817F8]();
  }
  else
  {
    uint64_t v4 = *(void **)(a1 + 40);
    if (v4 && [v4 length])
    {
      id v5 = [*(id *)(a1 + 32) persistence];
      uint64_t v6 = *(void *)(a1 + 40);
      uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
      id obj = *(id *)(v7 + 40);
      uint64_t v8 = [v5 underlyingDataFor:v6 error:&obj];
      objc_storeStrong((id *)(v7 + 40), obj);
      uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
      v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;

      uint64_t v11 = [*(id *)(a1 + 32) temporaryPreloadedBagData];
      if (v11)
      {
      }
      else if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
      {
        id v12 = +[AMSLogConfig sharedBagConfig];
        if (!v12)
        {
          id v12 = +[AMSLogConfig sharedConfig];
        }
        id v13 = [v12 OSLogObject];
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v14 = AMSLogKey();
          BOOL v15 = NSString;
          if (v14)
          {
            uint64_t v16 = objc_opt_class();
            uint64_t v1 = AMSLogKey();
            [v15 stringWithFormat:@"%@: [%@] ", v16, v1];
          }
          else
          {
            [NSString stringWithFormat:@"%@: ", objc_opt_class()];
          uint64_t v17 = };
          *(_DWORD *)buf = 138543362;
          uint64_t v20 = v17;
          _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Persisted bag data was loaded and will be returned from cachedValuesForKeys: on future calls.", buf, 0xCu);
          if (v14)
          {

            uint64_t v17 = (void *)v1;
          }
        }
        [*(id *)(a1 + 32) setTemporaryPreloadedBagData:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
      }
    }
  }
}

- (void)setTemporaryPreloadedBagData:(id)a3
{
}

- (AMSBagUnderlyingData)temporaryPreloadedBagData
{
  return self->_temporaryPreloadedBagData;
}

- (id)cachedValuesForKeys:(id)a3 observationToken:(unint64_t *)a4 updateHandler:(id)a5
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  uint64_t v62 = v11;
  if (!v10)
  {
    v52 = [MEMORY[0x1E4F28B00] currentHandler];
    [v52 handleFailureInMethod:a2 object:self file:@"AMSBag.mm" lineNumber:236 description:@"The 'keys' set must be provided."];
  }
  if (![v10 count])
  {
    v53 = [MEMORY[0x1E4F28B00] currentHandler];
    [v53 handleFailureInMethod:a2 object:self file:@"AMSBag.mm" lineNumber:237 description:@"The 'keys' set must not be empty."];
  }
  if (objc_msgSend(v10, "ams_allWithTest:", &__block_literal_global_55))
  {
    if (a4) {
      goto LABEL_7;
    }
LABEL_65:
    uint64_t v55 = [MEMORY[0x1E4F28B00] currentHandler];
    [v55 handleFailureInMethod:a2 object:self file:@"AMSBag.mm" lineNumber:241 description:@"An 'outToken' pointer must be provided."];

    if (v11) {
      goto LABEL_8;
    }
    goto LABEL_66;
  }
  v54 = [MEMORY[0x1E4F28B00] currentHandler];
  [v54 handleFailureInMethod:a2 object:self file:@"AMSBag.mm" lineNumber:240 description:@"Every value in the 'keys' set must be a non-empty string."];

  if (!a4) {
    goto LABEL_65;
  }
LABEL_7:
  if (v11) {
    goto LABEL_8;
  }
LABEL_66:
  v56 = [MEMORY[0x1E4F28B00] currentHandler];
  [v56 handleFailureInMethod:a2 object:self file:@"AMSBag.mm" lineNumber:242 description:@"An 'updateHandler' block must be provided."];

LABEL_8:
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__AMSBag_cachedValuesForKeys_observationToken_updateHandler___block_invoke_2;
  aBlock[3] = &unk_1E559F4A8;
  aBlock[4] = self;
  aBlock[5] = a4;
  v60 = (void (**)(void))_Block_copy(aBlock);
  [(AMSBag *)self setPersistenceAPIWasCalled:1];
  os_unfair_lock_lock(&self->_updateHandlerConsistencyLock);
  v82[0] = MEMORY[0x1E4F143A8];
  v82[1] = 3221225472;
  v82[2] = __61__AMSBag_cachedValuesForKeys_observationToken_updateHandler___block_invoke_84;
  v82[3] = &unk_1E559F4D0;
  v82[4] = self;
  id v12 = (void (**)(void))_Block_copy(v82);
  id v13 = [(AMSBag *)self dataSource];
  v61 = [v13 bagLoadingPartialIdentifier];

  uint64_t v14 = [(AMSBag *)self dataSource];
  char v15 = objc_opt_respondsToSelector();

  if (v15)
  {
    id v5 = [(AMSBag *)self dataSource];
    id v81 = 0;
    uint64_t v16 = [v5 loadedValuesForKeys:v10 outExpirationDate:&v81];
    id v17 = v81;

    if (v16)
    {
      id v5 = [(AMSBag *)self _availableValuesFromCachedData:v16 keys:v10 partialIdentifier:v61 expirationDate:v17 updateHandler:v62 outToken:a4];

      goto LABEL_61;
    }
  }
  uint64_t v75 = 0;
  v76 = &v75;
  uint64_t v77 = 0x3032000000;
  v78 = __Block_byref_object_copy__7;
  v79 = __Block_byref_object_dispose__7;
  id v80 = 0;
  uint64_t v69 = 0;
  v70 = &v69;
  uint64_t v71 = 0x3032000000;
  v72 = __Block_byref_object_copy__7;
  v73 = __Block_byref_object_dispose__7;
  id v74 = 0;
  if (![(AMSBag *)self persistenceIsEnabled])
  {
    id v29 = off_1E559C000;
    BOOL v30 = +[AMSLogConfig sharedBagConfig];
    if (!v30)
    {
      BOOL v30 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v31 = [v30 OSLogObject];
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v32 = AMSLogKey();
      id v33 = NSString;
      if (v32)
      {
        uint64_t v34 = objc_opt_class();
        AMSLogKey();
        id v29 = (__objc2_class **)objc_claimAutoreleasedReturnValue();
        [v33 stringWithFormat:@"%@: [%@] ", v34, v29];
      }
      else
      {
        [NSString stringWithFormat:@"%@: ", objc_opt_class()];
      uint64_t v35 = };
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v35;
      _os_log_impl(&dword_18D554000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@Persistence is not enabled. No cached values will be returned from cachedValuesForKeys:.", (uint8_t *)&buf, 0xCu);
      if (v32)
      {

        uint64_t v35 = v29;
      }
    }
    uint64_t v49 = [(AMSBag *)self updateHandlers];
    *a4 = [v49 addHandlerWithKeys:v10 initialValues:MEMORY[0x1E4F1CC08] handler:v62];

    v50 = [(AMSBag *)self dataSource];
    v63[0] = MEMORY[0x1E4F143A8];
    v63[1] = 3221225472;
    v63[2] = __61__AMSBag_cachedValuesForKeys_observationToken_updateHandler___block_invoke_88;
    v63[3] = &unk_1E559F520;
    v63[4] = self;
    [v50 loadWithCompletion:v63];

    id v5 = (void *)MEMORY[0x1E4F1CC08];
    goto LABEL_60;
  }
  uint64_t v18 = [(AMSBag *)self persistenceQueue];
  BOOL v19 = v18 == 0;

  if (v19)
  {
    uint64_t v36 = off_1E559C000;
    if (+[AMSUnitTests isRunningUnitTests])
    {
      id v37 = +[AMSLogConfig sharedBagConfig];
      if (!v37)
      {
        id v37 = +[AMSLogConfig sharedConfig];
      }
      id v38 = [v37 OSLogObject];
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        id v39 = AMSLogKey();
        id v40 = NSString;
        if (v39)
        {
          uint64_t v41 = objc_opt_class();
          uint64_t v58 = AMSLogKey();
          [v40 stringWithFormat:@"%@: [%@] ", v41, v58];
        }
        else
        {
          [NSString stringWithFormat:@"%@: ", objc_opt_class()];
        uint64_t v42 = };
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v42;
        _os_log_impl(&dword_18D554000, v38, OS_LOG_TYPE_ERROR, "%{public}@Persistence was enabled but persisteneQueue was unexpectedly nil. No persisted bag will be loaded.", (uint8_t *)&buf, 0xCu);
        if (v39)
        {

          uint64_t v42 = (void *)v58;
        }
      }
      __int16 v43 = [MEMORY[0x1E4F28EB8] defaultCenter];
      id v44 = +[AMSLogConfig sharedBagConfig];
      [v43 postNotificationName:@"com.apple.AppleMediaServicesTests.FaultLogged" object:v44 userInfo:0];
    }
    else
    {
      __int16 v43 = +[AMSLogConfig sharedBagConfig];
      if (!v43)
      {
        __int16 v43 = +[AMSLogConfig sharedConfig];
      }
      id v44 = [v43 OSLogObject];
      if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
      {
        uint64_t v45 = AMSLogKey();
        uint64_t v46 = NSString;
        if (v45)
        {
          uint64_t v47 = objc_opt_class();
          AMSLogKey();
          uint64_t v36 = (__objc2_class **)objc_claimAutoreleasedReturnValue();
          [v46 stringWithFormat:@"%@: [%@] ", v47, v36];
        }
        else
        {
          [NSString stringWithFormat:@"%@: ", objc_opt_class()];
        BOOL v48 = };
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v48;
        _os_log_impl(&dword_18D554000, v44, OS_LOG_TYPE_FAULT, "%{public}@Persistence was enabled but persisteneQueue was unexpectedly nil. No persisted bag will be loaded.", (uint8_t *)&buf, 0xCu);
        if (v45)
        {

          BOOL v48 = v36;
        }
      }
    }
  }
  else
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v87 = 0x3032000000;
    int v88 = __Block_byref_object_copy__7;
    v89 = __Block_byref_object_dispose__7;
    id v90 = 0;
    uint64_t v20 = [(AMSBag *)self persistenceQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__AMSBag_cachedValuesForKeys_observationToken_updateHandler___block_invoke_87;
    block[3] = &unk_1E559F4F8;
    block[4] = self;
    p_long long buf = &buf;
    id v21 = v61;
    id v65 = v21;
    v67 = &v75;
    v68 = &v69;
    dispatch_sync(v20, block);

    uint64_t v22 = *(void *)(*((void *)&buf + 1) + 40);
    if (v22)
    {
      uint64_t v23 = +[AMSLogConfig sharedBagConfig];
      if (!v23)
      {
        uint64_t v23 = +[AMSLogConfig sharedConfig];
      }
      id v24 = [v23 OSLogObject];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v25 = AMSLogKey();
        id v26 = NSString;
        v59 = (void *)v25;
        if (v25)
        {
          uint64_t v27 = objc_opt_class();
          uint64_t v57 = AMSLogKey();
          [v26 stringWithFormat:@"%@: [%@] ", v27, v57];
        }
        else
        {
          [NSString stringWithFormat:@"%@: ", objc_opt_class()];
        uint64_t v28 = };
        *(_DWORD *)v84 = 138543362;
        v85 = v28;
        _os_log_impl(&dword_18D554000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@Preloaded persisted bag data was found and will be returned from cachedValuesForKeys:.", v84, 0xCu);
        if (v59)
        {

          uint64_t v28 = (void *)v57;
        }
      }
      id v5 = [(AMSBag *)self _availableValuesFromPersistedBagData:*(void *)(*((void *)&buf + 1) + 40) error:0 keys:v10 partialIdentifier:v21 updateHandler:v62 outToken:a4];
    }

    _Block_object_dispose(&buf, 8);
    if (v22) {
      goto LABEL_60;
    }
  }
  id v5 = [(AMSBag *)self _availableValuesFromPersistedBagData:v76[5] error:v70[5] keys:v10 partialIdentifier:v61 updateHandler:v62 outToken:a4];
LABEL_60:
  _Block_object_dispose(&v69, 8);

  _Block_object_dispose(&v75, 8);
LABEL_61:

  v12[2](v12);
  v60[2](v60);

  return v5;
}

void __61__AMSBag_cachedValuesForKeys_observationToken_updateHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = **(void **)(a1 + 40);
  if (v1 == +[AMSBag uninitializedToken])
  {
    BOOL v2 = +[AMSUnitTests isRunningUnitTests];
    uint64_t v3 = +[AMSLogConfig sharedBagConfig];
    uint64_t v4 = (void *)v3;
    if (v2)
    {
      if (!v3)
      {
        uint64_t v4 = +[AMSLogConfig sharedConfig];
      }
      id v5 = [v4 OSLogObject];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        uint64_t v6 = AMSLogKey();
        uint64_t v7 = NSString;
        if (v6)
        {
          uint64_t v8 = objc_opt_class();
          uint64_t v9 = AMSLogKey();
          id v10 = [v7 stringWithFormat:@"%@: [%@] ", v8, v9];
        }
        else
        {
          id v10 = [NSString stringWithFormat:@"%@: ", objc_opt_class()];
          uint64_t v9 = v10;
        }
        id v17 = AMSHashIfNeeded(@"*outToken != AMSBagObservationUninitializedToken");
        uint64_t v18 = AMSHashIfNeeded(@"Expected 'outToken' parameter to be assigned before returning.");
        *(_DWORD *)long long buf = 138543874;
        uint64_t v22 = v10;
        __int16 v23 = 2114;
        id v24 = v17;
        __int16 v25 = 2114;
        id v26 = v18;
        _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_ERROR, "%{public}@Assertion failed: %{public}@. Description: %{public}@", buf, 0x20u);
        if (v6) {
      }
        }
      uint64_t v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
      id v11 = +[AMSLogConfig sharedBagConfig];
      [v4 postNotificationName:@"com.apple.AppleMediaServicesTests.FaultLogged" object:v11 userInfo:0];
    }
    else
    {
      if (!v3)
      {
        uint64_t v4 = +[AMSLogConfig sharedConfig];
      }
      id v11 = [v4 OSLogObject];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        id v12 = AMSLogKey();
        id v13 = NSString;
        if (v12)
        {
          uint64_t v14 = objc_opt_class();
          char v15 = AMSLogKey();
          uint64_t v16 = [v13 stringWithFormat:@"%@: [%@] ", v14, v15];
        }
        else
        {
          uint64_t v16 = [NSString stringWithFormat:@"%@: ", objc_opt_class()];
          char v15 = v16;
        }
        BOOL v19 = AMSHashIfNeeded(@"*outToken != AMSBagObservationUninitializedToken");
        uint64_t v20 = AMSHashIfNeeded(@"Expected 'outToken' parameter to be assigned before returning.");
        *(_DWORD *)long long buf = 138543874;
        uint64_t v22 = v16;
        __int16 v23 = 2114;
        id v24 = v19;
        __int16 v25 = 2114;
        id v26 = v20;
        _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_FAULT, "%{public}@Assertion failed: %{public}@. Description: %{public}@", buf, 0x20u);
        if (v12) {
      }
        }
    }
  }
}

+ (unint64_t)uninitializedToken
{
  return +[AMSBagCachedValueUpdateHandlers uninitializedToken];
}

void __61__AMSBag_cachedValuesForKeys_observationToken_updateHandler___block_invoke_84(uint64_t a1)
{
}

BOOL __61__AMSBag_cachedValuesForKeys_observationToken_updateHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  BOOL v3 = (objc_opt_isKindOfClass() & 1) != 0 && [v2 length] != 0;

  return v3;
}

- (void)setPersistenceAPIWasCalled:(BOOL)a3
{
  self->_persistenceAPIWasCalled = a3;
}

- (id)_availableValuesFromPersistedBagData:(id)a3 error:(id)a4 keys:(id)a5 partialIdentifier:(id)a6 updateHandler:(id)a7 outToken:(unint64_t *)a8
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v54 = a6;
  id v17 = a7;
  v53 = v14;
  if (v15)
  {
    uint64_t v18 = [(AMSBag *)self updateHandlers];
    *a8 = [v18 addHandlerWithKeys:v16 initialValues:MEMORY[0x1E4F1CC08] handler:v17];

    if (AMSErrorIsEqual(v15, @"AMSErrorDomain", 7))
    {
      BOOL v19 = +[AMSLogConfig sharedBagConfig];
      if (!v19)
      {
        BOOL v19 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v20 = [v19 OSLogObject];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        id v21 = AMSLogKey();
        uint64_t v22 = NSString;
        if (v21)
        {
          uint64_t v23 = objc_opt_class();
          id v24 = AMSLogKey();
          __int16 v25 = [v22 stringWithFormat:@"%@: [%@] ", v23, v24];
        }
        else
        {
          __int16 v25 = [NSString stringWithFormat:@"%@: ", objc_opt_class()];
          id v24 = v25;
        }
        id v40 = AMSHashIfNeeded(v54);
        *(_DWORD *)long long buf = 138543618;
        v56 = v25;
        __int16 v57 = 2114;
        uint64_t v58 = v40;
        _os_log_impl(&dword_18D554000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to load persisted bag because one wasn't found on file system. Returning empty dictionary. partialBagIdentifier = %{public}@", buf, 0x16u);
        if (v21) {
      }
        }
    }
    else
    {
      BOOL v19 = +[AMSLogConfig sharedBagConfig];
      if (!v19)
      {
        BOOL v19 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v20 = [v19 OSLogObject];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        id v29 = AMSLogKey();
        BOOL v30 = NSString;
        if (v29)
        {
          uint64_t v31 = objc_opt_class();
          uint64_t v32 = AMSLogKey();
          id v33 = [v30 stringWithFormat:@"%@: [%@] ", v31, v32];
        }
        else
        {
          id v33 = [NSString stringWithFormat:@"%@: ", objc_opt_class()];
          uint64_t v32 = v33;
        }
        uint64_t v41 = AMSHashIfNeeded(v54);
        *(_DWORD *)long long buf = 138543618;
        v56 = v33;
        __int16 v57 = 2114;
        uint64_t v58 = v41;
        _os_log_impl(&dword_18D554000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to load persisted bag for reading cached values. partialBagIdentifier = %{public}@", buf, 0x16u);
        if (v29) {
      }
        }
    }

    [(AMSBag *)self _loadAndPersistBag];
    +[AMSBagPersistenceMetricsTracker trackCachedValuesUnavailableWithRequestedValueCount:](AMSBagPersistenceMetricsTracker, "trackCachedValuesUnavailableWithRequestedValueCount:", [v16 count]);
  }
  else
  {
    if (v14)
    {
      id v26 = [v14 bagDictionary];
      uint64_t v27 = [v14 expirationDate];
      uint64_t v28 = [(AMSBag *)self _availableValuesFromCachedData:v26 keys:v16 partialIdentifier:v54 expirationDate:v27 updateHandler:v17 outToken:a8];

      goto LABEL_32;
    }
    if (v54)
    {
      if (+[AMSUnitTests isRunningUnitTests])
      {
        uint64_t v34 = +[AMSLogConfig sharedBagConfig];
        if (!v34)
        {
          uint64_t v34 = +[AMSLogConfig sharedConfig];
        }
        uint64_t v35 = [v34 OSLogObject];
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          uint64_t v36 = AMSLogKey();
          id v37 = NSString;
          if (v36)
          {
            uint64_t v38 = objc_opt_class();
            AMSLogKey();
            a6 = (id)objc_claimAutoreleasedReturnValue();
            [v37 stringWithFormat:@"%@: [%@] ", v38, a6];
          }
          else
          {
            [NSString stringWithFormat:@"%@: ", objc_opt_class()];
          id v39 = };
          *(_DWORD *)long long buf = 138543362;
          v56 = v39;
          _os_log_impl(&dword_18D554000, v35, OS_LOG_TYPE_ERROR, "%{public}@Unexpectedly received no error or result data. No data will be returned.", buf, 0xCu);
          if (v36)
          {

            id v39 = a6;
          }
        }
        __int16 v43 = [MEMORY[0x1E4F28EB8] defaultCenter];
        id v44 = +[AMSLogConfig sharedBagConfig];
        [v43 postNotificationName:@"com.apple.AppleMediaServicesTests.FaultLogged" object:v44 userInfo:0];
      }
      else
      {
        __int16 v43 = +[AMSLogConfig sharedBagConfig];
        if (!v43)
        {
          __int16 v43 = +[AMSLogConfig sharedConfig];
        }
        id v44 = [v43 OSLogObject];
        if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
        {
          uint64_t v49 = AMSLogKey();
          v50 = NSString;
          if (v49)
          {
            uint64_t v51 = objc_opt_class();
            AMSLogKey();
            a6 = (id)objc_claimAutoreleasedReturnValue();
            [v50 stringWithFormat:@"%@: [%@] ", v51, a6];
          }
          else
          {
            [NSString stringWithFormat:@"%@: ", objc_opt_class()];
          v52 = };
          *(_DWORD *)long long buf = 138543362;
          v56 = v52;
          _os_log_impl(&dword_18D554000, v44, OS_LOG_TYPE_FAULT, "%{public}@Unexpectedly received no error or result data. No data will be returned.", buf, 0xCu);
          if (v49)
          {

            v52 = a6;
          }
        }
      }
    }
    else
    {
      __int16 v43 = +[AMSLogConfig sharedBagConfig];
      if (!v43)
      {
        __int16 v43 = +[AMSLogConfig sharedConfig];
      }
      id v44 = [v43 OSLogObject];
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v45 = AMSLogKey();
        uint64_t v46 = NSString;
        if (v45)
        {
          uint64_t v47 = objc_opt_class();
          AMSLogKey();
          a6 = (id)objc_claimAutoreleasedReturnValue();
          [v46 stringWithFormat:@"%@: [%@] ", v47, a6];
        }
        else
        {
          [NSString stringWithFormat:@"%@: ", objc_opt_class()];
        BOOL v48 = };
        *(_DWORD *)long long buf = 138543362;
        v56 = v48;
        _os_log_impl(&dword_18D554000, v44, OS_LOG_TYPE_DEFAULT, "%{public}@Data source didn't provide a loading identifier. No cached data will be returned.", buf, 0xCu);
        if (v45)
        {

          BOOL v48 = a6;
        }
      }
    }
  }
  uint64_t v28 = (void *)MEMORY[0x1E4F1CC08];
LABEL_32:

  return v28;
}

- (id)URLForKey:(id)a3
{
  id v4 = a3;
  id v5 = [AMSBagValue alloc];
  uint64_t v6 = [(AMSBag *)self dataSource];
  uint64_t v7 = [(AMSBagValue *)v5 initWithDataSource:v6 key:v4 valueType:5];

  return v7;
}

- (AMSBag)initWithDataSource:(id)a3
{
  return [(AMSBag *)self initWithDataSource:a3 shouldConfigureDataSourceHandlers:0];
}

- (AMSBag)initWithDataSource:(id)a3 persistenceDirectoryURL:(id)a4 persistenceQueue:(id)a5 changeHandlerQueue:(id)a6 shouldConfigureDataSourceHandlers:(BOOL)a7
{
  BOOL v7 = a7;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  if (v13)
  {
    if (v14) {
      goto LABEL_3;
    }
  }
  else
  {
    id v21 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"AMSBag.mm", 106, @"Unexpected nil reference: %s", "dataSource");

    if (v14)
    {
LABEL_3:
      if (v15) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"AMSBag.mm", 108, @"Unexpected nil reference: %s", "persistenceQueue");

      if (v16) {
        goto LABEL_5;
      }
LABEL_9:
      id v24 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"AMSBag.mm", 109, @"Unexpected nil reference: %s", "changeHandlerQueue");

      goto LABEL_5;
    }
  }
  uint64_t v22 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"AMSBag.mm", 107, @"Unexpected nil reference: %s", "persistenceDirectoryURL");

  if (!v15) {
    goto LABEL_8;
  }
LABEL_4:
  if (!v16) {
    goto LABEL_9;
  }
LABEL_5:
  id v17 = [[AMSBagUnderlyingDataPersistence alloc] initWithDirectoryURL:v14];
  uint64_t v18 = [[AMSBagCachedValueUpdateHandlers alloc] initWithHandlerQueue:v16];
  BOOL v19 = [(AMSBag *)self _initWithDataSource:v13 persistence:v17 persistenceQueue:v15 updateHandlers:v18 shouldConfigureDataSourceHandlers:v7];

  return v19;
}

+ (id)bagForProfile:(id)a3 profileVersion:(id)a4 processInfo:(id)a5 account:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = objc_opt_class();
  id v14 = [[AMSBagFixedAccountProvider alloc] initWithAccount:v12];
  id v15 = [v13 _bagForProfile:v9 profileVersion:v10 processInfo:v11 accountProvider:v14];

  return v15;
}

- (BOOL)isLoaded
{
  id v2 = [(AMSBag *)self dataSource];
  char v3 = [v2 isLoaded];

  return v3;
}

void __61__AMSBag_cachedValuesForKeys_observationToken_updateHandler___block_invoke_88(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    BOOL v7 = +[AMSLogConfig sharedBagConfig];
    if (!v7)
    {
      BOOL v7 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = AMSLogKey();
      id v10 = NSString;
      if (v9)
      {
        uint64_t v11 = objc_opt_class();
        id v12 = AMSLogKey();
        id v13 = [v10 stringWithFormat:@"%@: [%@] ", v11, v12];
      }
      else
      {
        id v13 = [NSString stringWithFormat:@"%@: ", objc_opt_class()];
        id v12 = v13;
      }
      id v21 = [v5 loadedBagIdentifier];
      uint64_t v22 = AMSHashIfNeeded(v21);
      *(_DWORD *)long long buf = 138543618;
      uint64_t v31 = v13;
      __int16 v32 = 2114;
      id v33 = v22;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to load bag. bagIdentifier = %{public}@", buf, 0x16u);

      if (v9) {
    }
      }
  }
  else
  {
    id v14 = +[AMSLogConfig sharedBagConfig];
    if (!v14)
    {
      id v14 = +[AMSLogConfig sharedConfig];
    }
    id v15 = [v14 OSLogObject];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = AMSLogKey();
      id v17 = NSString;
      id v29 = (void *)v16;
      if (v16)
      {
        uint64_t v18 = objc_opt_class();
        BOOL v19 = AMSLogKey();
        uint64_t v20 = [v17 stringWithFormat:@"%@: [%@] ", v18, v19];
      }
      else
      {
        uint64_t v20 = [NSString stringWithFormat:@"%@: ", objc_opt_class()];
        BOOL v19 = v20;
      }
      uint64_t v23 = [v5 loadedBagIdentifier];
      id v24 = AMSHashIfNeeded(v23);
      *(_DWORD *)long long buf = 138543618;
      uint64_t v31 = v20;
      __int16 v32 = 2114;
      id v33 = v24;
      _os_log_impl(&dword_18D554000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@Calling update handlers. bagIdentifier = %{public}@", buf, 0x16u);

      if (v29) {
    }
      }

    BOOL v7 = [*(id *)(a1 + 32) updateHandlers];
    uint64_t v8 = [v5 data];
    __int16 v25 = (void *)MEMORY[0x1E4F1CAD0];
    id v26 = [v5 data];
    uint64_t v27 = [v26 allKeys];
    uint64_t v28 = [v25 setWithArray:v27];
    [v7 callHandlersUsingNewBagDictionary:v8 changedKeys:v28];
  }
}

- (NSString)descriptionExtended
{
  char v3 = [(AMSBag *)self dataSource];
  char v4 = objc_opt_respondsToSelector();

  id v5 = [(AMSBag *)self dataSource];
  id v6 = v5;
  if (v4) {
    [v5 descriptionExtended];
  }
  else {
  BOOL v7 = [v5 description];
  }

  return (NSString *)v7;
}

- (void)setDefaultValue:(id)a3 forKey:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  BOOL v7 = [(AMSBag *)self dataSource];
  [v7 setDefaultValue:v8 forKey:v6];
}

- (id)URLForKey:(id)a3 account:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [AMSBagValue alloc];
  id v9 = [(AMSBag *)self dataSource];
  id v10 = [(AMSBagValue *)v8 initWithDataSource:v9 key:v6 valueType:5 account:v7];

  return v10;
}

- (id)_temporaryDictionary
{
  char v3 = objc_alloc_init(AMSMutablePromise);
  objc_initWeak(&location, self);
  char v4 = [(AMSBag *)self dataSource];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __30__AMSBag__temporaryDictionary__block_invoke;
  v7[3] = &unk_1E559F570;
  objc_copyWeak(&v9, &location);
  void v7[4] = self;
  id v5 = v3;
  id v8 = v5;
  [v4 loadWithCompletion:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v5;
}

void __30__AMSBag__temporaryDictionary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (v5)
  {
    id v8 = *(void **)(a1 + 40);
    id v9 = [v5 data];
    [v8 finishWithResult:v9];
  }
  else
  {
    id v10 = +[AMSLogConfig sharedBagConfig];
    if (!v10)
    {
      id v10 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v11 = [v10 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = (id)objc_opt_class();
      id v13 = AMSLogKey();
      int v16 = 138543618;
      id v17 = v12;
      __int16 v18 = 2114;
      BOOL v19 = v13;
      _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unable to retrieve temporary dictionary because we failed to load the bag.", (uint8_t *)&v16, 0x16u);
    }
    id v14 = *(void **)(a1 + 40);
    id v15 = AMSError(203, @"Bag Load Failed", @"Unable to retrieve temporary dictionary because we failed to load the bag.", v6);
    [v14 finishWithError:v15];
  }
}

void __38__AMSBag__configureDataSourceHandlers__block_invoke_2(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = +[AMSLogConfig sharedBagConfig];
    if (!v2)
    {
      id v2 = +[AMSLogConfig sharedConfig];
    }
    char v3 = [v2 OSLogObject];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = objc_opt_class();
      id v5 = AMSLogKey();
      *(_DWORD *)long long buf = 138543618;
      uint64_t v15 = v4;
      __int16 v16 = 2114;
      id v17 = v5;
      _os_log_impl(&dword_18D554000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] The bag was invalidated. Posting a notification.", buf, 0x16u);
    }
    id v6 = objc_msgSend(WeakRetained, "profile", @"profile");
    v12[1] = @"profileVersion";
    v13[0] = v6;
    id v7 = [WeakRetained profileVersion];
    v13[1] = v7;
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];

    id v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 postNotificationName:@"AMSBagInvalidatedNotification" object:WeakRetained userInfo:v8];
  }
  else
  {
    id v8 = +[AMSLogConfig sharedBagConfig];
    if (!v8)
    {
      id v8 = +[AMSLogConfig sharedConfig];
    }
    id v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = objc_opt_class();
      uint64_t v11 = AMSLogKey();
      *(_DWORD *)long long buf = 138543618;
      uint64_t v15 = v10;
      __int16 v16 = 2114;
      id v17 = v11;
      _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] dataSourceDataInvalidatedHandler was called, but the owning bag was deallocated after the handler was called. No AMSBagInvalidatedNotification will be posted.", buf, 0x16u);
    }
  }
}

+ (void)resetBagCache
{
  id v2 = [a1 bagCache];
  [v2 removeAll];
}

- (void)waitUntilPersistenceWorkComplete
{
  id v2 = self;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  char v3 = [(AMSBag *)self persistenceQueue];

  if (v3)
  {
    uint64_t v4 = [v2 persistenceQueue];
    dispatch_sync(v4, &__block_literal_global_159);

    id v5 = +[AMSLogConfig sharedBagConfig];
    if (!v5)
    {
      id v5 = +[AMSLogConfig sharedConfig];
    }
    id v6 = [v5 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      id v7 = AMSLogKey();
      id v8 = NSString;
      if (v7)
      {
        uint64_t v9 = objc_opt_class();
        id v2 = AMSLogKey();
        [v8 stringWithFormat:@"%@: [%@] ", v9, v2];
      }
      else
      {
        [NSString stringWithFormat:@"%@: ", objc_opt_class()];
      uint64_t v10 = };
      *(_DWORD *)long long buf = 138543362;
      id v12 = v10;
      _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Finished waiting for any pending persistence work.", buf, 0xCu);
      if (v7)
      {

        uint64_t v10 = v2;
      }
    }
  }
}

- (id)URLFromURLString:(id)a3
{
  char v3 = [(AMSBag *)self URLFromURLString:a3 account:0];
  return v3;
}

- (id)URLFromURLString:(id)a3 account:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    id v8 = objc_alloc_init(AMSBagActiveAccountProvider);
    uint64_t v9 = [(AMSBag *)self processInfo];
    uint64_t v10 = [v9 accountMediaType];
    id v7 = [(AMSBagActiveAccountProvider *)v8 bagAccountForAccountMediaType:v10];
  }
  uint64_t v23 = MEMORY[0x1E4F143A8];
  uint64_t v24 = 3221225472;
  __int16 v25 = __35__AMSBag_URLFromURLString_account___block_invoke;
  id v26 = &unk_1E559F680;
  uint64_t v27 = self;
  id v11 = v7;
  id v28 = v11;
  id v12 = +[AMSBagURLParser URLBySubstitutingVariablesInURLString:v6 usingBlock:&v23];
  if (!v12)
  {
    uint64_t v13 = +[AMSLogConfig sharedBagConfig];
    if (!v13)
    {
      uint64_t v13 = +[AMSLogConfig sharedConfig];
    }
    id v14 = [v13 OSLogObject];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = AMSLogKey();
      __int16 v16 = NSString;
      if (v15)
      {
        uint64_t v17 = objc_opt_class();
        uint64_t v18 = AMSLogKey();
        BOOL v19 = [v16 stringWithFormat:@"%@: [%@] ", v17, v18, v23, v24, v25, v26, v27];
      }
      else
      {
        BOOL v19 = [NSString stringWithFormat:@"%@: ", objc_opt_class()];
        uint64_t v18 = v19;
      }
      uint64_t v20 = AMSHashIfNeeded(v6);
      id v21 = AMSHashIfNeeded(v11);
      *(_DWORD *)long long buf = 138543874;
      BOOL v30 = v19;
      __int16 v31 = 2114;
      __int16 v32 = v20;
      __int16 v33 = 2114;
      uint64_t v34 = v21;
      _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to create template-substituted URL. URL = %{public}@ | account = %{public}@", buf, 0x20u);
      if (v15) {
    }
      }
  }

  return v12;
}

id __35__AMSBag_URLFromURLString_account___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) dataSource];
  id v5 = [v4 valueForURLVariable:v3 account:*(void *)(a1 + 40)];

  return v5;
}

- (os_unfair_lock_s)updateHandlerConsistencyLock
{
  return self->_updateHandlerConsistencyLock;
}

- (void)setUpdateHandlerConsistencyLock:(os_unfair_lock_s)a3
{
  self->_updateHandlerConsistencyLock = a3;
}

- (void)setDataSource:(id)a3
{
}

- (void)setProcessInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateHandlers, 0);
  objc_storeStrong((id *)&self->_processInfo, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_temporaryPreloadedBagData, 0);
  objc_storeStrong((id *)&self->_persistence, 0);
  objc_storeStrong((id *)&self->_persistenceQueue, 0);
  objc_storeStrong((id *)&self->_changeNotificationQueue, 0);
}

@end