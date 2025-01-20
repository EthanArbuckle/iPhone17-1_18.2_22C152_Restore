@interface HDOntologyUpdateCoordinator
+ (id)_endpointDictionary;
+ (id)_gatedActivityCriteria;
+ (id)_ontologyServerURL;
- (BOOL)performOntologyTransactionForWrite:(BOOL)a3 databaseTransaction:(id)a4 error:(id *)a5 transactionHandler:(id)a6;
- (BOOL)updateOntologyWithShardIdentifier:(id)a3 schemaType:(id)a4 schemaVersion:(int64_t)a5 localShardURL:(id)a6 shardVersion:(int64_t)a7 error:(id *)a8;
- (HDDaemon)daemon;
- (HDKeyValueDomain)_keyValueDomain;
- (HDOntologyFeatureCoordinator)featureCoordinator;
- (HDOntologyManifestUpdater)manifestUpdater;
- (HDOntologyShardDownloader)downloader;
- (HDOntologyShardImporter)importer;
- (HDOntologyShardPruner)pruner;
- (HDOntologyShardRegistry)shardRegistry;
- (HDOntologyUpdateCoordinator)init;
- (HDOntologyUpdateCoordinator)initWithDaemon:(id)a3;
- (HDPrimaryProfile)profile;
- (id)_manifestURL;
- (id)_sessionForOntologyUpdateReason:(id)a1;
- (id)_takeAccessibilityAssertion;
- (id)_takeRegistryAssertion;
- (id)ontologyServerURL;
- (id)unitTesting_willTriggerGatedActivity;
- (uint64_t)_permittedToAutomaticallyUpdateOntology;
- (uint64_t)_setIsRunningTransaction:(uint64_t)a1;
- (void)URLSession:(id)a3 taskIsWaitingForConnectivity:(id)a4;
- (void)_invalidatePreparedAssertions;
- (void)_runOntologyPruner;
- (void)_triggerOntologyUpdateForGatedActivity:(uint64_t)a3 ontologyUpdateReason:(void *)a4 completion:;
- (void)dealloc;
- (void)downloadRequiredShardsWithCompletion:(id)a3;
- (void)lockUpdateLock;
- (void)performPeriodicActivity:(id)a3 completion:(id)a4;
- (void)periodicActivity:(id)a3 configureXPCActivityCriteria:(id)a4;
- (void)profileDidBecomeReady:(id)a3;
- (void)setOntologyServerURL:(id)a3;
- (void)setUnitTesting_willTriggerGatedActivity:(id)a3;
- (void)triggerGatedUpdateWithMaximumDelay:(double)a3 completion:(id)a4;
- (void)unlockUpdateLock;
- (void)updateOntologyWithReason:(int64_t)a3 completion:(id)a4;
- (void)updateOntologyWithShardIdentifier:(id)a3 schemaType:(id)a4 schemaVersion:(int64_t)a5 shardURL:(id)a6 shardVersion:(int64_t)a7 shouldPruneOldShard:(BOOL)a8 reason:(int64_t)a9 completion:(id)a10;
- (void)updateShardRegistryWithCompletion:(id)a3;
@end

@implementation HDOntologyUpdateCoordinator

- (HDOntologyUpdateCoordinator)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDOntologyUpdateCoordinator)initWithDaemon:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)HDOntologyUpdateCoordinator;
  v5 = [(HDOntologyUpdateCoordinator *)&v30 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_daemon, v4);
    v6->_lock._os_unfair_lock_opaque = 0;
    v6->_contentionReductionLock._os_unfair_lock_opaque = 0;
    v7 = NSString;
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    uint64_t v10 = [v7 stringWithFormat:@"%@.%p.isRunningTransaction", v9, v6];
    threadLocalKeyIsRunningTransaction = v6->_threadLocalKeyIsRunningTransaction;
    v6->_threadLocalKeyIsRunningTransaction = (NSString *)v10;

    v12 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    v13 = HKCreateSerialDispatchQueue();
    [(NSOperationQueue *)v12 setUnderlyingQueue:v13];

    [(NSOperationQueue *)v12 setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v12 setQualityOfService:-1];
    updateOperationQueue = v6->_updateOperationQueue;
    v6->_updateOperationQueue = v12;

    v15 = [[HDOntologyFeatureCoordinator alloc] initWithOntologyUpdateCoordinator:v6];
    featureCoordinator = v6->_featureCoordinator;
    v6->_featureCoordinator = v15;

    v17 = [[HDOntologyManifestUpdater alloc] initWithOntologyUpdateCoordinator:v6];
    manifestUpdater = v6->_manifestUpdater;
    v6->_manifestUpdater = v17;

    v19 = [[HDOntologyShardDownloader alloc] initWithOntologyUpdateCoordinator:v6];
    downloader = v6->_downloader;
    v6->_downloader = v19;

    v21 = [[HDOntologyShardImporter alloc] initWithOntologyUpdateCoordinator:v6];
    importer = v6->_importer;
    v6->_importer = v21;

    v23 = [[HDOntologyShardRegistry alloc] initWithOntologyUpdateCoordinator:v6];
    shardRegistry = v6->_shardRegistry;
    v6->_shardRegistry = v23;

    v25 = [[HDOntologyShardPruner alloc] initWithOntologyUpdateCoordinator:v6];
    pruner = v6->_pruner;
    v6->_pruner = v25;

    id WeakRetained = objc_loadWeakRetained((id *)&v6->_daemon);
    v28 = [WeakRetained primaryProfile];
    [v28 registerProfileReadyObserver:v6 queue:0];
  }
  return v6;
}

- (void)dealloc
{
  -[HDOntologyUpdateCoordinator _invalidatePreparedAssertions]((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)HDOntologyUpdateCoordinator;
  [(HDOntologyUpdateCoordinator *)&v3 dealloc];
}

- (void)_invalidatePreparedAssertions
{
  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 48);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    [*(id *)(a1 + 32) invalidate];
    objc_super v3 = *(void **)(a1 + 32);
    *(void *)(a1 + 32) = 0;

    [*(id *)(a1 + 40) invalidate];
    id v4 = *(void **)(a1 + 40);
    *(void *)(a1 + 40) = 0;

    os_unfair_lock_unlock(v2);
  }
}

- (HDPrimaryProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
  objc_super v3 = [WeakRetained primaryProfile];

  return (HDPrimaryProfile *)v3;
}

- (BOOL)performOntologyTransactionForWrite:(BOOL)a3 databaseTransaction:(id)a4 error:(id *)a5 transactionHandler:(id)a6
{
  BOOL v8 = a3;
  id v10 = a4;
  id v11 = a6;
  if (v10)
  {
    p_daemon = &self->_daemon;
    id WeakRetained = objc_loadWeakRetained((id *)p_daemon);
    v14 = [WeakRetained ontologyBackingStore];
    id v15 = objc_loadWeakRetained((id *)p_daemon);
    v16 = [v15 primaryProfile];
    v17 = v14;
    BOOL v18 = v8;
    v19 = v16;
    id v20 = v10;
LABEL_5:
    char v22 = [v17 performOntologyTransactionForWrite:v18 profile:v19 databaseTransaction:v20 error:a5 transactionHandler:v11];

    goto LABEL_6;
  }
  if (-[HDOntologyUpdateCoordinator _setIsRunningTransaction:]((uint64_t)self, 1))
  {
    v21 = &self->_daemon;
    id WeakRetained = objc_loadWeakRetained((id *)v21);
    v14 = [WeakRetained ontologyBackingStore];
    id v15 = objc_loadWeakRetained((id *)v21);
    v16 = [v15 primaryProfile];
    v17 = v14;
    BOOL v18 = v8;
    v19 = v16;
    id v20 = 0;
    goto LABEL_5;
  }
  if (self) {
    BOOL v24 = v8;
  }
  else {
    BOOL v24 = 0;
  }
  if (v24) {
    os_unfair_lock_lock(&self->_contentionReductionLock);
  }
  id v29 = objc_loadWeakRetained((id *)&self->_daemon);
  v25 = [v29 primaryProfile];
  v26 = [v25 database];
  if (self)
  {
    v27 = objc_alloc_init(HDMutableDatabaseTransactionContext);
    [(HDMutableDatabaseTransactionContext *)v27 setCacheScope:1];
    os_unfair_lock_lock(&self->_lock);
    v28 = self->_lock_preparedDatabaseAccessibilityAssertion;
    os_unfair_lock_unlock(&self->_lock);
    if (v28) {
      [(HDMutableDatabaseTransactionContext *)v27 addAccessibilityAssertion:v28];
    }
  }
  else
  {
    v27 = 0;
  }
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __111__HDOntologyUpdateCoordinator_performOntologyTransactionForWrite_databaseTransaction_error_transactionHandler___block_invoke;
  v30[3] = &unk_1E630AE50;
  BOOL v33 = v8;
  v30[4] = self;
  id v31 = 0;
  id v32 = v11;
  char v22 = [v26 performWithTransactionContext:v27 error:a5 block:v30];

  -[HDOntologyUpdateCoordinator _setIsRunningTransaction:]((uint64_t)self, 0);
  if (v24) {
    os_unfair_lock_unlock(&self->_contentionReductionLock);
  }

LABEL_6:
  return v22;
}

- (uint64_t)_setIsRunningTransaction:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  id v4 = [MEMORY[0x1E4F29060] currentThread];
  v5 = [v4 threadDictionary];

  v6 = [v5 objectForKeyedSubscript:*(void *)(a1 + 56)];
  uint64_t v7 = [v6 BOOLValue];

  if (a2)
  {
    BOOL v8 = [NSNumber numberWithBool:1];
    [v5 setObject:v8 forKeyedSubscript:*(void *)(a1 + 56)];
  }
  else
  {
    [v5 removeObjectForKey:*(void *)(a1 + 56)];
  }

  return v7;
}

uint64_t __111__HDOntologyUpdateCoordinator_performOntologyTransactionForWrite_databaseTransaction_error_transactionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 80));
  v5 = [WeakRetained ontologyBackingStore];
  uint64_t v6 = *(unsigned __int8 *)(a1 + 56);
  id v7 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 80));
  BOOL v8 = [v7 primaryProfile];
  uint64_t v9 = [v5 performOntologyTransactionForWrite:v6 profile:v8 databaseTransaction:*(void *)(a1 + 40) error:a2 transactionHandler:*(void *)(a1 + 48)];

  return v9;
}

- (void)lockUpdateLock
{
}

- (void)unlockUpdateLock
{
}

- (id)ontologyServerURL
{
  return +[HDOntologyUpdateCoordinator _ontologyServerURL]();
}

+ (id)_ontologyServerURL
{
  self;
  v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v1 = [v0 stringForKey:*MEMORY[0x1E4F2A290]];
  v2 = v1;
  if (v1)
  {
    id v3 = v1;
  }
  else
  {
    HKDefaultOntologyServerBaseURL();
    id v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v4 = v3;

  v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v4];

  return v5;
}

- (void)setOntologyServerURL:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CB18];
  id v4 = a3;
  id v6 = [v3 standardUserDefaults];
  v5 = [v4 absoluteString];

  [v6 setObject:v5 forKey:*MEMORY[0x1E4F2A290]];
}

- (void)updateShardRegistryWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = -[HDOntologyUpdateCoordinator _sessionForOntologyUpdateReason:](self, 1);
  id v6 = [(HDOntologyUpdateCoordinator *)self manifestUpdater];
  id v7 = -[HDOntologyUpdateCoordinator _manifestURL](self);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65__HDOntologyUpdateCoordinator_updateShardRegistryWithCompletion___block_invoke;
  v10[3] = &unk_1E62F70B0;
  id v11 = v5;
  id v12 = v4;
  id v8 = v4;
  id v9 = v5;
  [v6 updateManifestWithURL:v7 session:v9 completion:v10];
}

- (id)_sessionForOntologyUpdateReason:(id)a1
{
  id v2 = a1;
  if (a1)
  {
    id v4 = [MEMORY[0x1E4F18DD0] ephemeralSessionConfiguration];
    v5 = v4;
    if ((a2 & 0xFFFFFFFFFFFFFFFBLL) == 0)
    {
      [v4 setWaitsForConnectivity:1];
      [v5 setTimeoutIntervalForResource:300.0];
    }
    objc_msgSend(v5, "set_sourceApplicationBundleIdentifier:", *MEMORY[0x1E4F2BDC0]);
    id v2 = [MEMORY[0x1E4F18DC0] sessionWithConfiguration:v5 delegate:v2 delegateQueue:0];
  }

  return v2;
}

- (id)_manifestURL
{
  if (a1)
  {
    v1 = [a1 ontologyServerURL];
    id v2 = +[HDOntologyManifestUpdater manifestURLWithBaseURL:v1];
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

void __65__HDOntologyUpdateCoordinator_updateShardRegistryWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a3;
  [v4 invalidateAndCancel];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)downloadRequiredShardsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = -[HDOntologyUpdateCoordinator _sessionForOntologyUpdateReason:](self, 1);
  id v6 = [(HDOntologyUpdateCoordinator *)self downloader];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __68__HDOntologyUpdateCoordinator_downloadRequiredShardsWithCompletion___block_invoke;
  v9[3] = &unk_1E62F70B0;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  [v6 downloadRequiredShardFilesWithSession:v8 completion:v9];
}

void __68__HDOntologyUpdateCoordinator_downloadRequiredShardsWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a3;
  [v4 invalidateAndCancel];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)updateOntologyWithReason:(int64_t)a3 completion:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F29128] UUID];
  id v8 = objc_msgSend(v7, "hk_shortRepresentation");

  id v9 = NSString;
  id v10 = HKStringFromOntologyUpdateReason();
  id v11 = [v9 stringWithFormat:@"%@ %@", v10, v8];

  _HKInitializeLogging();
  id v12 = HKLogHealthOntology();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    char v22 = self;
    __int16 v23 = 2114;
    BOOL v24 = v11;
    _os_log_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: Enqueue ontology update for %{public}@", buf, 0x16u);
  }

  id v13 = objc_alloc(MEMORY[0x1E4F2ABF8]);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __67__HDOntologyUpdateCoordinator_updateOntologyWithReason_completion___block_invoke;
  v17[3] = &unk_1E630AE78;
  v17[4] = self;
  id v18 = v8;
  id v19 = v6;
  int64_t v20 = a3;
  id v14 = v6;
  id v15 = v8;
  v16 = (void *)[v13 initWithName:v11 operationBlock:v17];
  [(NSOperationQueue *)self->_updateOperationQueue addOperation:v16];
}

void __67__HDOntologyUpdateCoordinator_updateOntologyWithReason_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v5 = *(void *)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __67__HDOntologyUpdateCoordinator_updateOntologyWithReason_completion___block_invoke_2;
  v42[3] = &unk_1E62FB280;
  uint64_t v6 = *(void *)(a1 + 56);
  id v43 = *(id *)(a1 + 48);
  id v44 = v3;
  id v7 = v3;
  id v8 = v4;
  id v9 = v42;
  if (v5)
  {
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    _HKInitializeLogging();
    id v11 = HKLogHealthOntology();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = HKStringFromOntologyUpdateReason();
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v5;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v12;
      *(_WORD *)&buf[22] = 2114;
      v52 = v8;
      _os_log_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Start updating ontology for %{public}@ %{public}@", buf, 0x20u);
    }
    id v13 = v8;

    os_unfair_lock_lock((os_unfair_lock_t)(v5 + 48));
    id v14 = *(id *)(v5 + 32);
    id v15 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = 0;

    id v16 = *(id *)(v5 + 40);
    v17 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = 0;

    os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 48));
    id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (!v14)
    {
      -[HDOntologyUpdateCoordinator _takeAccessibilityAssertion](v5);
      id v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v19 = v9;
    id v41 = v7;
    objc_msgSend(v18, "hk_addNonNilObject:", v14);
    if (!v16)
    {
      -[HDOntologyUpdateCoordinator _takeRegistryAssertion]((void *)v5);
      id v16 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v18, "hk_addNonNilObject:", v16);

    id v20 = [NSString alloc];
    v21 = HKStringFromOntologyUpdateReason();
    char v22 = (void *)[v20 initWithFormat:@"updateStartDate %@", v21];

    __int16 v23 = -[HDOntologyUpdateCoordinator _keyValueDomain](v5);
    BOOL v24 = [MEMORY[0x1E4F1C9C8] date];
    v48[0] = 0;
    char v25 = [v23 setDate:v24 forKey:v22 error:v48];
    id v26 = v48[0];

    if ((v25 & 1) == 0)
    {
      _HKInitializeLogging();
      v27 = HKLogHealthOntology();
      BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_INFO);

      if (v28)
      {
        id v29 = HKLogHealthOntology();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543874;
          *(void *)&uint8_t buf[4] = v5;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v22;
          *(_WORD *)&buf[22] = 2114;
          v52 = v26;
          _os_log_impl(&dword_1BCB7D000, v29, OS_LOG_TYPE_INFO, "%{public}@: Unable to persist %{public}@: %{public}@", buf, 0x20u);
        }
      }
    }

    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __77__HDOntologyUpdateCoordinator__updateOntologyWithReason_updateID_completion___block_invoke;
    v52 = &unk_1E630AEF0;
    uint64_t v53 = v5;
    uint64_t v57 = v6;
    id v30 = v13;
    CFAbsoluteTime v58 = Current;
    id v54 = v30;
    id v55 = v18;
    id v9 = v19;
    id v8 = v13;
    v56 = v9;
    id v31 = v18;
    id v32 = buf;
    BOOL v33 = -[HDOntologyUpdateCoordinator _sessionForOntologyUpdateReason:]((id)v5, v6);
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __71__HDOntologyUpdateCoordinator__runOntologyUpdateWithReason_completion___block_invoke;
    v45[3] = &unk_1E62F70B0;
    id v46 = v33;
    v34 = v32;
    id v47 = v34;
    id v35 = v33;
    v36 = v45;
    v37 = [(id)v5 manifestUpdater];
    v38 = -[HDOntologyUpdateCoordinator _manifestURL]((void *)v5);
    v48[0] = (id)MEMORY[0x1E4F143A8];
    v48[1] = (id)3221225472;
    v48[2] = __79__HDOntologyUpdateCoordinator__runOntologyUpdateWithReason_session_completion___block_invoke;
    v48[3] = &unk_1E630AF18;
    v39 = v36;
    id v50 = v39;
    v48[4] = (id)v5;
    id v40 = v35;
    id v49 = v40;
    [v37 updateManifestWithURL:v38 session:v40 completion:v48];

    id v7 = v41;
  }
}

uint64_t __67__HDOntologyUpdateCoordinator_updateOntologyWithReason_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

- (void)triggerGatedUpdateWithMaximumDelay:(double)a3 completion:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  id v16 = __77__HDOntologyUpdateCoordinator_triggerGatedUpdateWithMaximumDelay_completion___block_invoke;
  v17 = &unk_1E62F70B0;
  id v18 = self;
  id v19 = v6;
  id v7 = v6;
  id v8 = &v14;
  if (self)
  {
    id v9 = _Block_copy(self->_unitTesting_willTriggerGatedActivity);
    id v10 = v9;
    if (v9) {
      (*((void (**)(void *, HDOntologyUpdateCoordinator *, HDXPCGatedActivity *, double))v9 + 2))(v9, self, self->_gatedActivity, a3);
    }

    if (-[HDOntologyUpdateCoordinator _permittedToAutomaticallyUpdateOntology]((uint64_t)self))
    {
      _HKInitializeLogging();
      id v11 = HKLogHealthOntology();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = self;
        *(_WORD *)&buf[12] = 2048;
        *(double *)&buf[14] = a3;
        _os_log_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Trigger gated update with maximum delay %0.3fs", buf, 0x16u);
      }

      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __78__HDOntologyUpdateCoordinator__triggerGatedUpdateWithMaximumDelay_completion___block_invoke;
      v21 = &unk_1E630AF40;
      char v22 = self;
      __int16 v23 = v8;
      id v12 = _Block_copy(buf);
      gatedActivity = self->_gatedActivity;
      if (a3 <= 0.0) {
        -[HDXPCGatedActivity runUngatedWithCompletion:](gatedActivity, "runUngatedWithCompletion:", v12, v14, v15);
      }
      else {
        -[HDXPCGatedActivity requestRunWithMaximumDelay:completion:](gatedActivity, "requestRunWithMaximumDelay:completion:", v12, a3, v14, v15);
      }
    }
    else
    {
      v16((uint64_t)v8, 1, 0);
    }
  }
}

void __77__HDOntologyUpdateCoordinator_triggerGatedUpdateWithMaximumDelay_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if ((a2 & 1) == 0)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    if (v5)
    {
      _HKInitializeLogging();
      id v6 = HKLogHealthOntology();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v5;
        _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Request fallback update", (uint8_t *)&buf, 0xCu);
      }

      id v7 = *(void **)(v5 + 24);
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      id v10 = __54__HDOntologyUpdateCoordinator__scheduleFallbackUpdate__block_invoke;
      id v11 = &unk_1E630AF68;
      uint64_t v12 = v5;
      [v7 requestRunWithMaximumDelay:&buf completion:10.0];
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (BOOL)updateOntologyWithShardIdentifier:(id)a3 schemaType:(id)a4 schemaVersion:(int64_t)a5 localShardURL:(id)a6 shardVersion:(int64_t)a7 error:(id *)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  if (([v17 isFileURL] & 1) == 0)
  {
    [MEMORY[0x1E4F28B00] currentHandler];
    id v35 = v34 = v15;
    [v35 handleFailureInMethod:a2, self, @"HDOntologyUpdateCoordinator.m", 225, @"Invalid parameter not satisfying: %@", @"localShardURL.isFileURL" object file lineNumber description];

    id v15 = v34;
  }
  id v18 = objc_msgSend(v17, "hk_fileSizeWithError:", a8);
  if (v18)
  {
    int64_t v36 = a5;
    id v19 = v15;
    id v20 = objc_alloc(MEMORY[0x1E4F2B2F8]);
    uint64_t v21 = *MEMORY[0x1E4F29950];
    v37 = a8;
    id v22 = v16;
    __int16 v23 = self;
    int64_t v24 = a7;
    uint64_t v25 = [v18 integerValue];
    id v26 = [MEMORY[0x1E4F1C9C8] date];
    v27 = v20;
    id v15 = v19;
    BOOL v28 = (void *)[v27 initWithIdentifier:v19 schemaType:v22 schemaVersion:v36 availableVersion:v24 availableRegion:v21 availableLocale:0 availableURL:v17 availableChecksum:0 availableSize:v25 date:v26];
    id v29 = (void *)[v28 copyWithDesiredState:3];

    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __123__HDOntologyUpdateCoordinator_updateOntologyWithShardIdentifier_schemaType_schemaVersion_localShardURL_shardVersion_error___block_invoke;
    v38[3] = &unk_1E62F4A30;
    v38[4] = v23;
    id v39 = v29;
    id v30 = v29;
    id v31 = v23;
    id v16 = v22;
    BOOL v32 = [(HDOntologyUpdateCoordinator *)v31 performOntologyTransactionForWrite:1 databaseTransaction:0 error:v37 transactionHandler:v38];
  }
  else
  {
    BOOL v32 = a8 != 0;
  }

  return v32;
}

uint64_t __123__HDOntologyUpdateCoordinator_updateOntologyWithShardIdentifier_schemaType_schemaVersion_localShardURL_shardVersion_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  id v7 = a2;
  if (v5
    && +[HDOntologyShardRegistry insertEntry:transaction:error:](HDOntologyShardRegistry, "insertEntry:transaction:error:", v6, v7, a3)&& ([v5 shardRegistry], v8 = objc_claimAutoreleasedReturnValue(), objc_msgSend(v6, "availableURL"), v9 = objc_claimAutoreleasedReturnValue(), int v10 = objc_msgSend(v8, "copyToStagingDirectoryFileWithLocalURL:entry:error:", v9, v6, a3), v9, v8, v10))
  {
    id v11 = (void *)[v6 copyWithAvailableState:2];

    if (+[HDOntologyShardRegistry insertEntry:transaction:error:](HDOntologyShardRegistry, "insertEntry:transaction:error:", v11, v7, a3)&& ([v5 importer], uint64_t v12 = objc_claimAutoreleasedReturnValue(), v13 = objc_msgSend(v12, "importStagedShardFilesWithError:", a3), v12, v13))
    {
      uint64_t v14 = [v5 shardRegistry];
      id v15 = [v11 identifier];
      id v16 = [v11 schemaType];
      id v25 = 0;
      uint64_t v17 = objc_msgSend(v14, "entryWithIdentifier:schemaType:schemaVersion:entryOut:transaction:error:", v15, v16, objc_msgSend(v11, "schemaVersion"), &v25, v7, a3);
      id v18 = v25;

      if (v17)
      {
        id v19 = [v7 graphDatabase];
        id v20 = [v19 underlyingDatabase];
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __84__HDOntologyUpdateCoordinator__updateOntologyWithLocalShardEntry_transaction_error___block_invoke;
        v22[3] = &unk_1E62F30F8;
        v22[4] = v5;
        id v23 = v18;
        id v24 = v11;
        [v20 onCommit:v22 orRollback:0];
      }
    }
    else
    {
      uint64_t v17 = 0;
    }
  }
  else
  {
    uint64_t v17 = 0;
    id v11 = v6;
  }

  return v17;
}

- (void)updateOntologyWithShardIdentifier:(id)a3 schemaType:(id)a4 schemaVersion:(int64_t)a5 shardURL:(id)a6 shardVersion:(int64_t)a7 shouldPruneOldShard:(BOOL)a8 reason:(int64_t)a9 completion:(id)a10
{
  BOOL v10 = a8;
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v18 = a6;
  id v49 = (void (**)(id, uint64_t, void))a10;
  id v51 = 0;
  id v19 = v16;
  id v20 = v17;
  id v50 = v18;
  if (self)
  {
    int64_t v48 = a5;
    if (v10)
    {
      int64_t v21 = a7;
      id v22 = v19;
      id v23 = v20;
      uint64_t v52 = MEMORY[0x1E4F143A8];
      uint64_t v53 = 3221225472;
      id v54 = __91__HDOntologyUpdateCoordinator__pruneOldShardWithIdentifier_schemaType_schemaVersion_error___block_invoke;
      id v55 = &unk_1E6303D58;
      v56 = self;
      id v24 = v22;
      id v57 = v24;
      id v25 = v23;
      id v58 = v25;
      uint64_t v59 = (void **)a5;
      BOOL v26 = [(HDOntologyUpdateCoordinator *)self performOntologyTransactionForWrite:1 databaseTransaction:0 error:&v51 transactionHandler:&v52];
      if (v26) {
        -[HDOntologyUpdateCoordinator _runOntologyPruner](self);
      }

      uint64_t v27 = v26;
    }
    else
    {
      id v28 = v19;
      id v29 = v20;
      v61 = 0;
      v62 = &v61;
      uint64_t v63 = 0x3032000000;
      v64 = __Block_byref_object_copy__175;
      v65 = __Block_byref_object_dispose__175;
      id v66 = 0;
      uint64_t v52 = MEMORY[0x1E4F143A8];
      uint64_t v53 = 3221225472;
      id v54 = __128__HDOntologyUpdateCoordinator__shouldProceedToDownloadAndImportShardWithIdentifier_schemaType_schemaVersion_shardVersion_error___block_invoke;
      id v55 = &unk_1E630AF90;
      v56 = self;
      id v30 = v28;
      id v57 = v30;
      id v31 = v29;
      int64_t v32 = a5;
      id v33 = v31;
      uint64_t v59 = &v61;
      int64_t v60 = v32;
      id v58 = v31;
      if ([(HDOntologyUpdateCoordinator *)self performOntologyTransactionForWrite:0 databaseTransaction:0 error:&v51 transactionHandler:&v52])
      {
        if ([v62[5] availableVersion] >= a7 && objc_msgSend(v62[5], "availableState") == 3)
        {
          int64_t v21 = a7;
          uint64_t v27 = 2;
        }
        else
        {
          int64_t v21 = a7;
          uint64_t v27 = 1;
        }
      }
      else
      {
        int64_t v21 = a7;
        uint64_t v27 = 0;
      }

      _Block_object_dispose(&v61, 8);
    }

    id v34 = v51;
    if (v27 == 2)
    {
      v49[2](v49, 1, 0);
      goto LABEL_18;
    }
    if (v27)
    {
      id v47 = v49;
      id v35 = (objc_class *)MEMORY[0x1E4F2B2F8];
      id v36 = v50;
      id v37 = v20;
      id v38 = v19;
      id v39 = [v35 alloc];
      id v40 = [MEMORY[0x1E4F1C9C8] date];
      id v41 = (void *)[v39 initWithIdentifier:v38 schemaType:v37 schemaVersion:v48 availableVersion:v21 availableRegion:*MEMORY[0x1E4F29950] availableLocale:0 availableURL:v36 availableChecksum:0 availableSize:*MEMORY[0x1E4F2A2D8] date:v40];

      v42 = (void *)[v41 copyWithDesiredState:3];
      id v43 = -[HDOntologyUpdateCoordinator _sessionForOntologyUpdateReason:](self, a9);
      id v44 = [(HDOntologyUpdateCoordinator *)self downloader];
      v61 = v42;
      v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v61 count:1];
      uint64_t v52 = MEMORY[0x1E4F143A8];
      uint64_t v53 = 3221225472;
      id v54 = __148__HDOntologyUpdateCoordinator__downloadStageAndImportEntryWithIdentifier_schemaType_schemaVersion_shardVersion_shardURL_fileSize_reason_completion___block_invoke;
      id v55 = &unk_1E62F69A0;
      id v46 = v47;
      v56 = self;
      id v57 = v46;
      [v44 downloadRequiredShardFilesWithSession:v43 requiredEntries:v45 completion:&v52];

      goto LABEL_18;
    }
  }
  else
  {

    id v34 = 0;
  }
  ((void (**)(id, uint64_t, id))v49)[2](v49, 0, v34);
LABEL_18:
}

- (void)periodicActivity:(id)a3 configureXPCActivityCriteria:(id)a4
{
  id v4 = (const char *)*MEMORY[0x1E4F14138];
  xpc_object_t xdict = a4;
  xpc_dictionary_set_BOOL(xdict, v4, 1);
  xpc_dictionary_set_string(xdict, (const char *)*MEMORY[0x1E4F142C8], (const char *)*MEMORY[0x1E4F142E0]);
  xpc_dictionary_set_BOOL(xdict, (const char *)*MEMORY[0x1E4F14338], 1);
  uint64_t v5 = (const char *)*MEMORY[0x1E4F14288];
  id v6 = +[HDOntologyUpdateCoordinator _endpointDictionary]();
  xpc_dictionary_set_value(xdict, v5, v6);

  xpc_dictionary_set_int64(xdict, (const char *)*MEMORY[0x1E4F14260], 52428800);
  xpc_dictionary_set_BOOL(xdict, (const char *)*MEMORY[0x1E4F14308], 1);
  xpc_dictionary_set_BOOL(xdict, (const char *)*MEMORY[0x1E4F14318], 1);
}

+ (id)_endpointDictionary
{
  self;
  v0 = +[HDOntologyUpdateCoordinator _ontologyServerURL]();
  id v1 = [v0 host];
  id v2 = (const char *)[v1 UTF8String];
  id v3 = [v0 scheme];
  nw_endpoint_t host = nw_endpoint_create_host(v2, (const char *)[v3 UTF8String]);

  uint64_t v5 = (void *)MEMORY[0x1C187C070](host);

  return v5;
}

- (void)performPeriodicActivity:(id)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if (-[HDOntologyUpdateCoordinator _permittedToAutomaticallyUpdateOntology]((uint64_t)self))
  {
    id v6 = +[HKDaemonTransaction transactionWithOwner:self activityName:@"com.apple.healthd.ontology.update"];
    if (self)
    {
      id v7 = -[HDOntologyUpdateCoordinator _takeAccessibilityAssertion]((uint64_t)self);
      id v8 = -[HDOntologyUpdateCoordinator _takeRegistryAssertion](self);
      id v9 = v7;
      id v10 = v8;
      os_unfair_lock_lock(&self->_lock);
      if (v9)
      {
        [(HDAssertion *)self->_lock_preparedDatabaseAccessibilityAssertion invalidate];
        objc_storeStrong((id *)&self->_lock_preparedDatabaseAccessibilityAssertion, v7);
      }
      if (v10)
      {
        [(HDAssertion *)self->_lock_preparedRegistryAssertion invalidate];
        objc_storeStrong((id *)&self->_lock_preparedRegistryAssertion, v8);
      }
      os_unfair_lock_unlock(&self->_lock);
    }
    _HKInitializeLogging();
    id v11 = HKLogHealthOntology();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543362;
      id v20 = self;
      _os_log_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: maintenance operation enqueued", buf, 0xCu);
    }

    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __66__HDOntologyUpdateCoordinator_performPeriodicActivity_completion___block_invoke;
    v16[3] = &unk_1E630AEC8;
    v16[4] = self;
    id v17 = v6;
    id v18 = v5;
    id v12 = v6;
    int v13 = +[HDMaintenanceOperation maintenanceOperationWithName:@"com.apple.healthd.ontology.update" asynchronousBlock:v16];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
    id v15 = [WeakRetained maintenanceWorkCoordinator];
    [v15 enqueueMaintenanceOperation:v13];
  }
  else
  {
    (*((void (**)(id, void, void, double))v5 + 2))(v5, 0, 0, 0.0);
  }
}

- (uint64_t)_permittedToAutomaticallyUpdateOntology
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    id v2 = (id *)(result + 80);
    id WeakRetained = objc_loadWeakRetained((id *)(result + 80));
    id v4 = [WeakRetained behavior];
    id v5 = [v4 features];
    char v6 = [v5 shardedOntology];

    if (v6)
    {
      id v7 = objc_loadWeakRetained(v2);
      id v8 = [v7 behavior];
      char v9 = [v8 supportsOntologyDatabaseUpdates];

      if (v9)
      {
        id v10 = objc_loadWeakRetained(v2);
        id v11 = [v10 behavior];
        int v12 = [v11 healthAppNotInstalled];

        if (!v12)
        {
          id v15 = objc_loadWeakRetained(v2);
          id v16 = [v15 behavior];
          if ([v16 isRunningStoreDemoMode])
          {
          }
          else
          {
            id v17 = objc_loadWeakRetained(v2);
            id v18 = [v17 behavior];
            int v19 = [v18 runningInStoreDemoModeF201];

            if (!v19) {
              return 1;
            }
          }
          _HKInitializeLogging();
          int v13 = HKLogHealthOntology();
          if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_17;
          }
          int v20 = 138543362;
          uint64_t v21 = v1;
          uint64_t v14 = "%{public}@: Unable to run ontology update, because device in store demo mode";
          goto LABEL_16;
        }
        _HKInitializeLogging();
        int v13 = HKLogHealthOntology();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          int v20 = 138543362;
          uint64_t v21 = v1;
          uint64_t v14 = "%{public}@: Unable to run ontology update, because Health app is not installed";
LABEL_16:
          _os_log_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v20, 0xCu);
        }
      }
      else
      {
        _HKInitializeLogging();
        int v13 = HKLogHealthOntology();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          int v20 = 138543362;
          uint64_t v21 = v1;
          uint64_t v14 = "%{public}@: Unable to run ontology update, because behavior is not enabled";
          goto LABEL_16;
        }
      }
    }
    else
    {
      _HKInitializeLogging();
      int v13 = HKLogHealthOntology();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 138543362;
        uint64_t v21 = v1;
        uint64_t v14 = "%{public}@: Unable to run ontology update, because feature is not enabled";
        goto LABEL_16;
      }
    }
LABEL_17:

    return 0;
  }
  return result;
}

void __66__HDOntologyUpdateCoordinator_performPeriodicActivity_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = HKLogHealthOntology();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)long long buf = 138543362;
    uint64_t v13 = v5;
    _os_log_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: maintenance operation running", buf, 0xCu);
  }

  char v6 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66__HDOntologyUpdateCoordinator_performPeriodicActivity_completion___block_invoke_326;
  v8[3] = &unk_1E630AEA0;
  id v10 = v3;
  v8[4] = v6;
  id v11 = *(id *)(a1 + 48);
  id v9 = *(id *)(a1 + 40);
  id v7 = v3;
  [v6 updateOntologyWithReason:0 completion:v8];
}

void __66__HDOntologyUpdateCoordinator_performPeriodicActivity_completion___block_invoke_326(uint64_t a1, char a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  -[HDOntologyUpdateCoordinator _invalidatePreparedAssertions](*(void *)(a1 + 32));
  _HKInitializeLogging();
  char v6 = HKLogHealthOntology();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 138543362;
    uint64_t v9 = v7;
    _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: maintenance operation finished", (uint8_t *)&v8, 0xCu);
  }

  if ((a2 & 1) == 0) {
    [*(id *)(*(void *)(a1 + 32) + 8) shouldDefer];
  }
  (*(void (**)(double))(*(void *)(a1 + 56) + 16))(0.0);
  [*(id *)(a1 + 40) invalidate];
}

- (void)profileDidBecomeReady:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
  char v6 = [WeakRetained cacheDeleteCoordinator];
  [v6 registerCacheDeleteProvider:self->_pruner];

  uint64_t v7 = [HDPeriodicActivity alloc];
  id v8 = objc_loadWeakRetained((id *)&self->_daemon);
  uint64_t v9 = [v8 primaryProfile];
  double v10 = (double)(uint64_t)*MEMORY[0x1E4F14238];
  id v11 = HKLogHealthOntology();
  int v12 = [(HDPeriodicActivity *)v7 initWithProfile:v9 name:@"com.apple.healthd.ontology.update" interval:self delegate:v11 loggingCategory:v10];
  periodicActivity = self->_periodicActivity;
  self->_periodicActivity = v12;

  objc_initWeak(&location, self);
  id v14 = objc_alloc(MEMORY[0x1E4F65DC0]);
  id v15 = +[HDOntologyUpdateCoordinator _gatedActivityCriteria]();
  id v16 = HKLogHealthOntology();
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __53__HDOntologyUpdateCoordinator_profileDidBecomeReady___block_invoke;
  v27[3] = &unk_1E62F94B8;
  objc_copyWeak(&v28, &location);
  id v17 = (HDXPCGatedActivity *)[v14 initWithName:@"com.apple.healthd.ontology.gated" criteria:v15 loggingCategory:v16 handler:v27];
  gatedActivity = self->_gatedActivity;
  self->_gatedActivity = v17;

  [(HDXPCGatedActivity *)self->_gatedActivity setRescheduleWhileInProgress:1];
  id v19 = objc_alloc(MEMORY[0x1E4F65DC0]);
  self;
  int v20 = +[HDOntologyUpdateCoordinator _gatedActivityCriteria]();
  uint64_t v21 = +[HDOntologyUpdateCoordinator _endpointDictionary]();
  xpc_dictionary_set_value(v20, (const char *)*MEMORY[0x1E4F14288], v21);

  uint64_t v22 = HKLogHealthOntology();
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __53__HDOntologyUpdateCoordinator_profileDidBecomeReady___block_invoke_2;
  v25[3] = &unk_1E62F94B8;
  objc_copyWeak(&v26, &location);
  id v23 = (HDXPCGatedActivity *)[v19 initWithName:@"com.apple.healthd.ontology.fallback" criteria:v20 loggingCategory:v22 handler:v25];
  fallbackActivity = self->_fallbackActivity;
  self->_fallbackActivity = v23;

  [(HDXPCGatedActivity *)self->_fallbackActivity setRescheduleWhileInProgress:1];
  objc_destroyWeak(&v26);
  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);
}

+ (id)_gatedActivityCriteria
{
  self;
  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_BOOL(empty, (const char *)*MEMORY[0x1E4F14138], 1);
  xpc_dictionary_set_string(empty, (const char *)*MEMORY[0x1E4F142C8], (const char *)*MEMORY[0x1E4F142E0]);
  xpc_dictionary_set_BOOL(empty, (const char *)*MEMORY[0x1E4F14338], 1);
  xpc_dictionary_set_BOOL(empty, (const char *)*MEMORY[0x1E4F14310], 1);

  return empty;
}

void __53__HDOntologyUpdateCoordinator_profileDidBecomeReady___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = (id *)(a1 + 32);
  id v6 = a4;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  -[HDOntologyUpdateCoordinator _triggerOntologyUpdateForGatedActivity:ontologyUpdateReason:completion:](WeakRetained, v7, 3, v6);
}

- (void)_triggerOntologyUpdateForGatedActivity:(uint64_t)a3 ontologyUpdateReason:(void *)a4 completion:
{
  id v7 = a2;
  id v8 = a4;
  if (a1)
  {
    uint64_t v9 = [v7 name];
    double v10 = +[HKDaemonTransaction transactionWithOwner:a1 activityName:v9];

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __102__HDOntologyUpdateCoordinator__triggerOntologyUpdateForGatedActivity_ontologyUpdateReason_completion___block_invoke;
    v12[3] = &unk_1E62FAA10;
    id v13 = v7;
    id v14 = v10;
    id v15 = v8;
    id v11 = v10;
    [a1 updateOntologyWithReason:a3 completion:v12];
  }
}

void __53__HDOntologyUpdateCoordinator_profileDidBecomeReady___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = (id *)(a1 + 32);
  id v6 = a4;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  -[HDOntologyUpdateCoordinator _triggerOntologyUpdateForGatedActivity:ontologyUpdateReason:completion:](WeakRetained, v7, 4, v6);
}

- (void)URLSession:(id)a3 taskIsWaitingForConnectivity:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  _HKInitializeLogging();
  id v6 = HKLogHealthOntology();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v5 currentRequest];
    int v8 = 138543874;
    uint64_t v9 = self;
    __int16 v10 = 2114;
    id v11 = v5;
    __int16 v12 = 2114;
    id v13 = v7;
    _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: waiting for connectivity for task %{public}@ %{public}@", (uint8_t *)&v8, 0x20u);
  }
}

- (HDKeyValueDomain)_keyValueDomain
{
  id v2 = [HDKeyValueDomain alloc];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  id v4 = [WeakRetained primaryProfile];
  id v5 = [(HDKeyValueDomain *)v2 initWithCategory:0 domainName:@"HDOntologyUpdateCoordinator" profile:v4];

  return v5;
}

- (id)_takeAccessibilityAssertion
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  id v3 = [WeakRetained primaryProfile];
  id v4 = [v3 database];
  id v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  id v11 = 0;
  id v7 = [v4 takeAccessibilityAssertionWithOwnerIdentifier:v6 timeout:&v11 error:300.0];
  id v8 = v11;

  if (!v7)
  {
    _HKInitializeLogging();
    uint64_t v9 = HKLogHealthOntology();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543618;
      uint64_t v13 = a1;
      __int16 v14 = 2114;
      id v15 = v8;
      _os_log_error_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_ERROR, "%{public}@ Unable to prepare accessibilityAssertion: %{public}@", buf, 0x16u);
    }
  }

  return v7;
}

- (id)_takeRegistryAssertion
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 shardRegistry];
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v9 = 0;
  id v5 = [v2 takeFileHandleAssertionForOwnerIdentifier:v4 error:&v9];
  id v6 = v9;

  if (!v5)
  {
    _HKInitializeLogging();
    id v7 = HKLogHealthOntology();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543618;
      id v11 = a1;
      __int16 v12 = 2114;
      id v13 = v6;
      _os_log_error_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_ERROR, "%{public}@: Unable to take registry file handle assertion: %{public}@", buf, 0x16u);
    }
  }

  return v5;
}

void __77__HDOntologyUpdateCoordinator__updateOntologyWithReason_updateID_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    id v6 = &stru_1F1728D60;
  }
  else
  {
    id v6 = [NSString stringWithFormat:@", Error: %@", v5];
  }
  _HKInitializeLogging();
  id v7 = HKLogHealthOntology();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    if (a2) {
      id v9 = @"Success";
    }
    else {
      id v9 = @"Failure";
    }
    __int16 v10 = HKStringFromOntologyUpdateReason();
    uint64_t v11 = *(void *)(a1 + 40);
    CFAbsoluteTime v12 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 72);
    *(_DWORD *)long long buf = 138544642;
    uint64_t v45 = v8;
    __int16 v46 = 2114;
    id v47 = v9;
    __int16 v48 = 2114;
    id v49 = v10;
    __int16 v50 = 2114;
    uint64_t v51 = v11;
    __int16 v52 = 2048;
    CFAbsoluteTime v53 = v12;
    __int16 v54 = 2114;
    id v55 = v6;
    _os_log_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ updating ontology for %{public}@ %{public}@ in %0.4fs%{public}@", buf, 0x3Eu);
  }
  uint64_t v13 = *(void *)(a1 + 32);
  id v14 = v5;
  if (v13)
  {
    id v41 = v6;
    id v15 = objc_alloc(MEMORY[0x1E4F1CA60]);
    id v16 = [NSString alloc];
    uint64_t v17 = HKStringFromOntologyUpdateReason();
    id v18 = (void *)v17;
    id v19 = @"FAILURE";
    if (a2) {
      id v19 = @"SUCCESS";
    }
    int v20 = (void *)[v16 initWithFormat:@"updateEndDate %@ %@", v17, v19];
    id v43 = v20;
    uint64_t v21 = [MEMORY[0x1E4F1C9C8] date];
    *(void *)&long long v56 = v21;
    uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v56 forKeys:&v43 count:1];
    id v23 = (__CFString *)[v15 initWithDictionary:v22];

    if ((a2 & 1) == 0)
    {
      id v24 = [v14 description];
      id v25 = [NSString alloc];
      id v26 = HKStringFromOntologyUpdateReason();
      uint64_t v27 = (void *)[v25 initWithFormat:@"updateError %@", v26];
      [(__CFString *)v23 setObject:v24 forKeyedSubscript:v27];
    }
    id v28 = -[HDOntologyUpdateCoordinator _keyValueDomain](v13);
    id v42 = 0;
    char v29 = [v28 setValuesWithDictionary:v23 error:&v42];
    id v30 = v42;
    id v6 = v41;
    if ((v29 & 1) == 0)
    {
      _HKInitializeLogging();
      id v31 = HKLogHealthOntology();
      BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_INFO);

      if (v32)
      {
        id v33 = HKLogHealthOntology();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 138543874;
          uint64_t v45 = v13;
          __int16 v46 = 2114;
          id v47 = v23;
          __int16 v48 = 2114;
          id v49 = v30;
          _os_log_impl(&dword_1BCB7D000, v33, OS_LOG_TYPE_INFO, "%{public}@: Unable to persist %{public}@: %{public}@", buf, 0x20u);
        }
      }
    }
  }
  uint64_t v34 = *(void *)(a1 + 32);
  id v35 = *(id *)(a1 + 48);
  id v36 = v35;
  if (v34)
  {
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    uint64_t v37 = [v35 countByEnumeratingWithState:&v56 objects:buf count:16];
    if (v37)
    {
      uint64_t v38 = v37;
      uint64_t v39 = *(void *)v57;
      do
      {
        uint64_t v40 = 0;
        do
        {
          if (*(void *)v57 != v39) {
            objc_enumerationMutation(v36);
          }
          [*(id *)(*((void *)&v56 + 1) + 8 * v40++) invalidate];
        }
        while (v38 != v40);
        uint64_t v38 = [v36 countByEnumeratingWithState:&v56 objects:buf count:16];
      }
      while (v38);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __71__HDOntologyUpdateCoordinator__runOntologyUpdateWithReason_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a3;
  [v4 invalidateAndCancel];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __79__HDOntologyUpdateCoordinator__runOntologyUpdateWithReason_session_completion___block_invoke(uint64_t a1, char a2)
{
  if (a2)
  {
    id v3 = [*(id *)(a1 + 32) downloader];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __79__HDOntologyUpdateCoordinator__runOntologyUpdateWithReason_session_completion___block_invoke_2;
    v7[3] = &unk_1E62F69A0;
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = *(id *)(a1 + 48);
    v7[4] = *(void *)(a1 + 32);
    id v8 = v5;
    [v3 downloadRequiredShardFilesWithSession:v4 completion:v7];
  }
  else
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v6();
  }
}

void __79__HDOntologyUpdateCoordinator__runOntologyUpdateWithReason_session_completion___block_invoke_2(uint64_t a1, char a2)
{
  if (a2)
  {
    id v3 = [*(id *)(a1 + 32) importer];
    id v6 = 0;
    [v3 importStagedShardFilesWithError:&v6];
    id v4 = v6;

    -[HDOntologyUpdateCoordinator _runOntologyPruner](*(void **)(a1 + 32));
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v5 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v5();
  }
}

- (void)_runOntologyPruner
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v2 = [a1 pruner];
    id v6 = 0;
    char v3 = [v2 pruneOntologyWithOptions:0 error:&v6];
    id v4 = v6;

    if ((v3 & 1) == 0)
    {
      _HKInitializeLogging();
      id v5 = HKLogHealthOntology();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138543618;
        id v8 = a1;
        __int16 v9 = 2114;
        id v10 = v4;
        _os_log_error_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_ERROR, "%{public}@: Error pruning ontology: %{public}@", buf, 0x16u);
      }
    }
  }
}

void __102__HDOntologyUpdateCoordinator__triggerOntologyUpdateForGatedActivity_ontologyUpdateReason_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0) {
    [*(id *)(a1 + 32) shouldDefer];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  [*(id *)(a1 + 40) invalidate];
}

void __78__HDOntologyUpdateCoordinator__triggerGatedUpdateWithMaximumDelay_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = v5;
  if (a2 == 2 && !v5)
  {
    id v6 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 708, @"Activity \"%@\" Deferred", @"com.apple.healthd.ontology.gated");
  }
  _HKInitializeLogging();
  id v7 = HKLogHealthOntology();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    __int16 v9 = HDStringFromGatedActivityResult();
    *(_DWORD *)long long buf = 138543874;
    uint64_t v11 = v8;
    __int16 v12 = 2114;
    uint64_t v13 = v9;
    __int16 v14 = 2114;
    id v15 = v6;
    _os_log_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Gated update result: %{public}@, error: %{public}@", buf, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __54__HDOntologyUpdateCoordinator__scheduleFallbackUpdate__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _HKInitializeLogging();
  id v5 = HKLogHealthOntology();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = HDStringFromGatedActivityResult();
    int v8 = 138543874;
    uint64_t v9 = v6;
    __int16 v10 = 2114;
    uint64_t v11 = v7;
    __int16 v12 = 2114;
    id v13 = v4;
    _os_log_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Fallback update result: %{public}@, error: %{public}@", (uint8_t *)&v8, 0x20u);
  }
}

void __84__HDOntologyUpdateCoordinator__updateOntologyWithLocalShardEntry_transaction_error___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  id v2 = HKLogHealthOntology();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = [*(id *)(a1 + 48) availableURL];
    int v6 = 138543874;
    uint64_t v7 = v3;
    __int16 v8 = 2114;
    uint64_t v9 = v4;
    __int16 v10 = 2114;
    uint64_t v11 = v5;
    _os_log_impl(&dword_1BCB7D000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Imported local shard %{public}@ from %{public}@", (uint8_t *)&v6, 0x20u);
  }
}

uint64_t __91__HDOntologyUpdateCoordinator__pruneOldShardWithIdentifier_schemaType_schemaVersion_error___block_invoke(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = (void *)a1[4];
  id v5 = (void *)a1[5];
  uint64_t v7 = (void *)a1[6];
  uint64_t v6 = a1[7];
  id v8 = a2;
  if (v4)
  {
    id v9 = v7;
    id v10 = v5;
    uint64_t v11 = [v4 shardRegistry];
    id v16 = 0;
    uint64_t v12 = [v11 entryWithIdentifier:v10 schemaType:v9 schemaVersion:v6 entryOut:&v16 transaction:v8 error:a3];

    id v13 = v16;
    if (v12 && v13)
    {
      uint64_t v14 = [v13 copyWithDesiredState:0];

      +[HDOntologyShardRegistry insertEntry:v14 transaction:v8 error:a3];
      id v13 = (id)v14;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

uint64_t __128__HDOntologyUpdateCoordinator__shouldProceedToDownloadAndImportShardWithIdentifier_schemaType_schemaVersion_shardVersion_error___block_invoke(void *a1, void *a2, uint64_t a3)
{
  id v5 = (void *)a1[4];
  id v6 = a2;
  uint64_t v7 = [v5 shardRegistry];
  uint64_t v8 = a1[5];
  uint64_t v9 = a1[6];
  uint64_t v10 = a1[8];
  uint64_t v11 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v11 + 40);
  uint64_t v12 = [v7 entryWithIdentifier:v8 schemaType:v9 schemaVersion:v10 entryOut:&obj transaction:v6 error:a3];

  objc_storeStrong((id *)(v11 + 40), obj);
  return v12;
}

void __148__HDOntologyUpdateCoordinator__downloadStageAndImportEntryWithIdentifier_schemaType_schemaVersion_shardVersion_shardURL_fileSize_reason_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v6 = [*(id *)(a1 + 32) importer];
    id v8 = v5;
    [v6 importStagedShardFilesWithError:&v8];
    id v7 = v8;

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id v5 = v7;
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (HDDaemon)daemon
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);

  return (HDDaemon *)WeakRetained;
}

- (HDOntologyFeatureCoordinator)featureCoordinator
{
  return self->_featureCoordinator;
}

- (HDOntologyManifestUpdater)manifestUpdater
{
  return self->_manifestUpdater;
}

- (HDOntologyShardDownloader)downloader
{
  return self->_downloader;
}

- (HDOntologyShardImporter)importer
{
  return self->_importer;
}

- (HDOntologyShardRegistry)shardRegistry
{
  return self->_shardRegistry;
}

- (HDOntologyShardPruner)pruner
{
  return self->_pruner;
}

- (id)unitTesting_willTriggerGatedActivity
{
  return self->_unitTesting_willTriggerGatedActivity;
}

- (void)setUnitTesting_willTriggerGatedActivity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTesting_willTriggerGatedActivity, 0);
  objc_storeStrong((id *)&self->_pruner, 0);
  objc_storeStrong((id *)&self->_shardRegistry, 0);
  objc_storeStrong((id *)&self->_importer, 0);
  objc_storeStrong((id *)&self->_downloader, 0);
  objc_storeStrong((id *)&self->_manifestUpdater, 0);
  objc_storeStrong((id *)&self->_featureCoordinator, 0);
  objc_destroyWeak((id *)&self->_daemon);
  objc_storeStrong((id *)&self->_updateOperationQueue, 0);
  objc_storeStrong((id *)&self->_threadLocalKeyIsRunningTransaction, 0);
  objc_storeStrong((id *)&self->_lock_preparedRegistryAssertion, 0);
  objc_storeStrong((id *)&self->_lock_preparedDatabaseAccessibilityAssertion, 0);
  objc_storeStrong((id *)&self->_fallbackActivity, 0);
  objc_storeStrong((id *)&self->_gatedActivity, 0);

  objc_storeStrong((id *)&self->_periodicActivity, 0);
}

@end