@interface HDQueryManager
- (HDDaemon)daemon;
- (HDQueryManager)initWithDaemon:(id)a3;
- (HDQueryManagerUnitTestDelegate)unitTest_delegate;
- (OS_dispatch_queue)unitTest_delegateQueue;
- (_HDProcessQueryCollection)_lock_queryCollectionForBundleIdentifier:(int)a3 createIfNecessary:;
- (id)_monitoringIdentifierForProcess:(uint64_t)a1;
- (id)diagnosticDescription;
- (void)_lock_executeDatabaseAccessBlocks;
- (void)_lock_unregisterQueryServer:(uint64_t)a1;
- (void)_performAsyncWithUnitTestDelegate:(void *)a1;
- (void)dealloc;
- (void)logDiagnostics;
- (void)processWithBundleIdentifier:(id)a3 didTransitionFromState:(unsigned int)a4 toState:(unsigned int)a5;
- (void)scheduleDatabaseAccessForQueryServer:(id)a3 block:(id)a4;
- (void)setUnitTest_delegate:(id)a3;
- (void)setUnitTest_delegateQueue:(id)a3;
- (void)startQueryServer:(id)a3 completion:(id)a4;
- (void)unitTest_suspendWithCount:(unint64_t)a3;
@end

@implementation HDQueryManager

- (HDDaemon)daemon
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);

  return (HDDaemon *)WeakRetained;
}

- (HDQueryManager)initWithDaemon:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HDQueryManager;
  v5 = [(HDQueryManager *)&v13 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_daemon, v4);
    v6->_lock._os_unfair_lock_opaque = 0;
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    queryServersByUUID = v6->_queryServersByUUID;
    v6->_queryServersByUUID = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    queryCollectionsByProcessBundleIdentifier = v6->_queryCollectionsByProcessBundleIdentifier;
    v6->_queryCollectionsByProcessBundleIdentifier = v9;

    v11 = [MEMORY[0x1E4F65CF8] sharedDiagnosticManager];
    [v11 addObject:v6];
  }
  return v6;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F65CF8] sharedDiagnosticManager];
  [v3 removeObject:self];

  v4.receiver = self;
  v4.super_class = (Class)HDQueryManager;
  [(HDQueryManager *)&v4 dealloc];
}

- (void)startQueryServer:(id)a3 completion:(id)a4
{
  v76[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = +[HKDaemonTransaction transactionWithOwner:self activityName:@"Start"];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__HDQueryManager_startQueryServer_completion___block_invoke;
  aBlock[3] = &unk_1E62F69A0;
  id v69 = v8;
  id v60 = v9;
  id v68 = v60;
  v63 = _Block_copy(aBlock);
  if (v7)
  {
    objc_initWeak(&location, self);
    v64[0] = MEMORY[0x1E4F143A8];
    v64[1] = 3221225472;
    v64[2] = __46__HDQueryManager_startQueryServer_completion___block_invoke_2;
    v64[3] = &unk_1E62F69C8;
    v55 = &v65;
    objc_copyWeak(&v65, &location);
    [v7 setQueryDidFinishHandler:v64];
    v10 = [(HDQueryManager *)self daemon];
    objc_msgSend(v10, "unitTest_queryServerDidInit:", v7);

    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    id v59 = v7;
    id v58 = v63;
    if (!self)
    {
LABEL_33:

      os_unfair_lock_unlock(p_lock);
      objc_destroyWeak(v55);
      objc_destroyWeak(&location);
      goto LABEL_34;
    }
    os_unfair_lock_assert_owner(&self->_lock);
    id v70 = 0;
    id v12 = v59;
    os_unfair_lock_assert_owner(&self->_lock);
    v61 = objc_msgSend(v12, "queryUUID", &v65);
    id v62 = [(NSMutableDictionary *)self->_queryServersByUUID objectForKey:v61];
    objc_super v13 = (os_log_t *)MEMORY[0x1E4F29F90];
    if (v62)
    {
      _HKInitializeLogging();
      v14 = *v13;
      v15 = *v13;
      if (v62 == v12)
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          *(void *)&buf[4] = v12;
          _os_log_error_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_ERROR, "Ignoring duplicate attempt to start query server %{public}@", buf, 0xCu);
        }
        objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:", &v70, 3, @"Attempt to start a query with the same identifier.");
        uint64_t v23 = 0;
        goto LABEL_29;
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = v61;
        _os_log_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_DEFAULT, "Replacing existing query server %{public}@ with a new instance", buf, 0xCu);
      }
      -[HDQueryManager _lock_unregisterQueryServer:]((uint64_t)self, v62);
    }
    v16 = [v12 client];
    v57 = [v16 process];

    v56 = -[HDQueryManager _monitoringIdentifierForProcess:]((uint64_t)self, v57);
    if (!v56)
    {
      _HKInitializeLogging();
      os_log_t v44 = *v13;
      if (os_log_type_enabled(*v13, OS_LOG_TYPE_ERROR))
      {
        v50 = v44;
        v51 = objc_opt_class();
        id v52 = v51;
        v53 = [v57 name];
        int v54 = [v57 processIdentifier];
        *(_DWORD *)buf = 138544130;
        *(void *)&buf[4] = v51;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v61;
        *(_WORD *)&buf[22] = 2112;
        v72 = v53;
        LOWORD(v73) = 1024;
        *(_DWORD *)((char *)&v73 + 2) = v54;
        _os_log_error_impl(&dword_1BCB7D000, v50, OS_LOG_TYPE_ERROR, "Ignoring attempt to start query server of class %{public}@ for UUID %{public}@: process %@ (%d) has no bundle identifier", buf, 0x26u);
      }
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:", &v70, 3, @"Missing process bundle identifier");
      uint64_t v23 = 0;
      goto LABEL_25;
    }
    id v17 = v12;
    id v18 = v56;
    os_unfair_lock_assert_owner(&self->_lock);
    _HKInitializeLogging();
    v19 = *v13;
    if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v17;
      _os_log_debug_impl(&dword_1BCB7D000, v19, OS_LOG_TYPE_DEBUG, "Registering query server %{public}@", buf, 0xCu);
    }
    queryServersByUUID = self->_queryServersByUUID;
    v21 = [v17 queryUUID];
    [(NSMutableDictionary *)queryServersByUUID setObject:v17 forKey:v21];

    uint64_t v22 = -[HDQueryManager _lock_queryCollectionForBundleIdentifier:createIfNecessary:]((uint64_t)self, v18, 1);
    uint64_t v23 = v22;
    if (!v22 || ![*(id *)(v22 + 8) count])
    {
      v24 = [(HDQueryManager *)self daemon];
      v25 = [v24 processStateManager];

      [v25 registerObserver:self forBundleIdentifier:v18];
      v27 = -[HDQueryServerClientState initWithApplicationState:]([HDQueryServerClientState alloc], "initWithApplicationState:", [v25 applicationStateForBundleIdentifier:v18]);
      if (!v23)
      {
LABEL_16:

        id v29 = v17;
        v30 = [v29 clientState];
        char v31 = [v30 isBackgroundRunning];

        if ((v31 & 1) == 0)
        {
          v76[0] = @"queryType";
          v32 = (objc_class *)objc_opt_class();
          v33 = NSStringFromClass(v32);
          *(void *)buf = v33;
          v76[1] = @"queryId";
          v34 = [v29 queryUUID];
          v35 = [v34 UUIDString];
          *(void *)&buf[8] = v35;
          v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v76 count:2];
          v37 = (void *)[v36 mutableCopy];

          v38 = [v29 sampleType];
          v39 = v38;
          if (v38)
          {
            v40 = [v38 description];
            [v37 setObject:v40 forKeyedSubscript:@"dataType"];
          }
          v41 = kHDEventNameQuery;
          v42 = [v29 client];
          HDPowerLogForClient(v41, v42, v37);
        }
LABEL_25:

LABEL_29:
        id v45 = v70;
        if (v23)
        {
          id v46 = *(id *)(v23 + 40);
          v47 = *(NSObject **)(v23 + 24);
          *(void *)buf = MEMORY[0x1E4F143A8];
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = __52__HDQueryManager__lock_startQueryServer_completion___block_invoke_2;
          v72 = &unk_1E62F69F0;
          id v73 = v12;
          id v48 = v58;
          id v74 = v46;
          id v75 = v48;
          id v49 = v46;
          dispatch_async(v47, buf);
        }
        else
        {
          *(void *)buf = MEMORY[0x1E4F143A8];
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = __52__HDQueryManager__lock_startQueryServer_completion___block_invoke;
          v72 = &unk_1E62F3CA8;
          id v74 = v58;
          id v73 = v45;
          HKDispatchAsyncOnGlobalConcurrentQueue();

          id v49 = v74;
        }

        goto LABEL_33;
      }
      objc_setProperty_nonatomic_copy((id)v23, v26, v27, 40);
    }
    v28 = *(void **)(v23 + 8);
    v27 = (HDQueryServerClientState *)v17;
    v25 = [(HDQueryServerClientState *)v27 queryUUID];
    [v28 setObject:v27 forKeyedSubscript:v25];
    goto LABEL_16;
  }
  v43 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a2, @"nil query server"");
  (*((void (**)(void *, void, void *))v63 + 2))(v63, 0, v43);

LABEL_34:
}

uint64_t __46__HDQueryManager_startQueryServer_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  v3 = *(void **)(a1 + 32);

  return [v3 invalidate];
}

void __46__HDQueryManager_startQueryServer_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained(v2);
  if (WeakRetained)
  {
    id v4 = v3;
    os_unfair_lock_lock(WeakRetained + 2);
    -[HDQueryManager _lock_unregisterQueryServer:]((uint64_t)WeakRetained, v4);

    os_unfair_lock_unlock(WeakRetained + 2);
  }
}

uint64_t __52__HDQueryManager__lock_startQueryServer_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __52__HDQueryManager__lock_startQueryServer_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v8 = 0;
  int v3 = [v2 prepareToActivateServerWithError:&v8];
  id v4 = v8;
  v5 = v4;
  uint64_t v6 = *(void *)(a1 + 48);
  if (v3)
  {
    (*(void (**)(void, uint64_t, void))(v6 + 16))(*(void *)(a1 + 48), 1, 0);
  }
  else if (v4)
  {
    (*(void (**)(void, void, id))(v6 + 16))(*(void *)(a1 + 48), 0, v4);
  }
  else
  {
    id v7 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 100, @"Failed to start query with unknown error");
    (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v7);
  }
  [*(id *)(a1 + 32) activateServerWithClientState:*(void *)(a1 + 40) error:v5];
}

- (void)scheduleDatabaseAccessForQueryServer:(id)a3 block:(id)a4
{
  p_lock = &self->_lock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_lock(p_lock);
  v9 = [_HDQueryDatabaseAccessBlock alloc];
  id v10 = v7;
  id v11 = v8;
  if (v9
    && (v28.receiver = v9,
        v28.super_class = (Class)_HDQueryDatabaseAccessBlock,
        (id v12 = [(HDQueryManager *)&v28 init]) != 0))
  {
    v27 = v12;
    *(CFAbsoluteTime *)&v12->_executingDatabaseAccessBlocks = CFAbsoluteTimeGetCurrent();
    uint64_t v13 = [v10 copy];
    v14 = *(void **)&v27->_lock._os_unfair_lock_opaque;
    *(void *)&v27->_lock._os_unfair_lock_opaque = v13;

    objc_storeWeak((id *)&v27->_queryServersByUUID, v11);
    v15 = [v11 client];
    v16 = [v15 process];
    id v17 = [v16 bundleIdentifier];
    uint64_t v18 = [v17 copy];
    queryCollectionsByProcessBundleIdentifier = v27->_queryCollectionsByProcessBundleIdentifier;
    v27->_queryCollectionsByProcessBundleIdentifier = (NSMutableDictionary *)v18;

    v20 = [v11 configuration];
    v27->_pendingDatabaseAccessBlocks = (NSMutableArray *)[v20 qualityOfService];
  }
  else
  {
    v27 = 0;
  }

  pendingDatabaseAccessBlocks = self->_pendingDatabaseAccessBlocks;
  if (!pendingDatabaseAccessBlocks)
  {
    uint64_t v22 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v23 = self->_pendingDatabaseAccessBlocks;
    self->_pendingDatabaseAccessBlocks = v22;

    pendingDatabaseAccessBlocks = self->_pendingDatabaseAccessBlocks;
  }
  [(NSMutableArray *)pendingDatabaseAccessBlocks addObject:v27];
  int64_t unitTest_suspendCount = self->_unitTest_suspendCount;
  BOOL v25 = unitTest_suspendCount < 1;
  int64_t v26 = unitTest_suspendCount - 1;
  if (!v25) {
    self->_int64_t unitTest_suspendCount = v26;
  }
  -[HDQueryManager _lock_executeDatabaseAccessBlocks]((const os_unfair_lock *)self);
  os_unfair_lock_unlock(p_lock);
}

- (void)_lock_executeDatabaseAccessBlocks
{
  if (!a1) {
    return;
  }
  v1 = (os_unfair_lock *)a1;
  uint64_t v2 = a1 + 2;
  os_unfair_lock_assert_owner(a1 + 2);
  if (*(uint64_t *)&v1[14]._os_unfair_lock_opaque > 0
    || (unint64_t)[*(id *)&v1[10]._os_unfair_lock_opaque count] > 2)
  {
    return;
  }
  v43 = v2;
  do
  {
    os_unfair_lock_assert_owner(v2);
    uint64_t v3 = [*(id *)&v1[8]._os_unfair_lock_opaque count];
    if (!v3) {
      return;
    }
    uint64_t v4 = v3;
    os_unfair_lock_assert_owner(v2);
    v5 = [*(id *)&v1[6]._os_unfair_lock_opaque allValues];
    id v45 = objc_msgSend(v5, "hk_mapToSet:", &__block_literal_global_34);

    if (v4 < 1)
    {
LABEL_67:

      return;
    }
    id v6 = 0;
    unint64_t v7 = v4 + 1;
    uint64_t v8 = -1;
    do
    {
      uint64_t v9 = [*(id *)&v1[8]._os_unfair_lock_opaque objectAtIndexedSubscript:v7 - 2];
      id v10 = (void *)v9;
      if (!v9)
      {
        id v12 = 0;
LABEL_11:
        [*(id *)&v1[8]._os_unfair_lock_opaque removeObjectAtIndex:v7 - 2];
        v8 -= v6 != 0;
        goto LABEL_52;
      }
      id WeakRetained = objc_loadWeakRetained((id *)(v9 + 16));
      id v12 = WeakRetained;
      if (!WeakRetained || [WeakRetained _shouldStopProcessingQuery]) {
        goto LABEL_11;
      }
      uint64_t v13 = v10;
      v14 = v13;
      unint64_t v15 = v13[4] + 1;
      BOOL v16 = v15 > 0x22;
      uint64_t v17 = (1 << v15) & 0x404000001;
      BOOL v18 = v16 || v17 == 0;
      if (v18 && *(uint64_t *)&v1[12]._os_unfair_lock_opaque >= 1)
      {

        goto LABEL_52;
      }

      if (!v6) {
        goto LABEL_50;
      }
      uint64_t v44 = v8;
      v19 = v1;
      v20 = v6;
      v21 = v14;
      id v22 = v45;
      int v23 = [v22 containsObject:v20[3]];
      id v46 = v21;
      uint64_t v24 = *((void *)v21 + 3);
      id v6 = v20;
      v1 = v19;
      int v25 = [v22 containsObject:v24];
      if ((v23 & 1) == 0 && v25)
      {
LABEL_49:

LABEL_50:
        v30 = v14;

        id v6 = v30;
        uint64_t v8 = v7 - 2;
        goto LABEL_52;
      }
      if ((v23 ^ 1 | v25) == 1)
      {
        uint64_t v26 = *((void *)v6 + 4);
        if (v26 <= 16)
        {
          if (v26 == -1)
          {
            unint64_t v27 = 3;
          }
          else
          {
            if (v26 != 9) {
              goto LABEL_33;
            }
            unint64_t v27 = 1;
          }
        }
        else
        {
          switch(v26)
          {
            case 17:
              unint64_t v27 = 2;
              break;
            case 33:
              unint64_t v27 = 5;
              break;
            case 25:
              unint64_t v27 = 4;
              break;
            default:
LABEL_33:
              unint64_t v27 = 0;
              break;
          }
        }
        uint64_t v28 = v14[4];
        if (v28 <= 16)
        {
          if (v28 == -1)
          {
            unint64_t v29 = 3;
            goto LABEL_46;
          }
          if (v28 == 9)
          {
            unint64_t v29 = 1;
            goto LABEL_46;
          }
        }
        else
        {
          switch(v28)
          {
            case 17:
              unint64_t v29 = 2;
              goto LABEL_46;
            case 33:
              unint64_t v29 = 5;
              goto LABEL_46;
            case 25:
              unint64_t v29 = 4;
LABEL_46:
              if (v27 < v29 || v27 <= v29 && *((double *)v6 + 5) > v46[5]) {
                goto LABEL_49;
              }
              goto LABEL_51;
          }
        }
        unint64_t v29 = 0;
        goto LABEL_46;
      }
LABEL_51:

      uint64_t v8 = v44;
LABEL_52:

      --v7;
    }
    while (v7 > 1);
    uint64_t v2 = v43;
    if (!v6) {
      goto LABEL_67;
    }
    [*(id *)&v1[8]._os_unfair_lock_opaque removeObjectAtIndex:v8];

    id v31 = objc_loadWeakRetained((id *)v6 + 2);
    uint64_t v32 = [v31 profile];
    v33 = (void *)v32;
    if (v31 && v32 && ([v31 _shouldStopProcessingQuery] & 1) == 0)
    {
      v34 = v6;
      os_unfair_lock_assert_owner(v43);
      v35 = *(void **)&v1[10]._os_unfair_lock_opaque;
      if (!v35)
      {
        id v36 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        v37 = *(void **)&v1[10]._os_unfair_lock_opaque;
        *(void *)&v1[10]._os_unfair_lock_opaque = v36;

        v35 = *(void **)&v1[10]._os_unfair_lock_opaque;
      }
      [v35 addObject:v34];
      unint64_t v38 = v34[4] + 1;
      if (v38 > 0x22 || ((1 << v38) & 0x404000001) == 0) {
        ++*(void *)&v1[12]._os_unfair_lock_opaque;
      }
      id v39 = objc_loadWeakRetained((id *)v6 + 2);
      v52[0] = MEMORY[0x1E4F143A8];
      v52[1] = 3221225472;
      v52[2] = __55__HDQueryManager__lock_willExecuteDatabaseAccessBlock___block_invoke;
      v52[3] = &unk_1E62F6A68;
      v52[4] = v1;
      id v53 = v39;
      id v40 = v39;
      -[HDQueryManager _performAsyncWithUnitTestDelegate:](v1, v52);

      v41 = [v33 database];
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __51__HDQueryManager__lock_executeDatabaseAccessBlocks__block_invoke;
      v47[3] = &unk_1E62F6A40;
      id v48 = v31;
      id v49 = v34;
      id v50 = v41;
      v51 = v1;
      id v42 = v41;
      [v42 performAsynchronously:v47];
    }
  }
  while ((unint64_t)[*(id *)&v1[10]._os_unfair_lock_opaque count] < 3);
}

void __51__HDQueryManager__lock_executeDatabaseAccessBlocks__block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (os_log_t *)MEMORY[0x1E4F29F90];
  os_signpost_id_t v3 = _HKLogSignpostIDGenerate();
  double Current = CFAbsoluteTimeGetCurrent();
  [*(id *)(a1 + 32) activationTime];
  double v6 = v5;
  double v7 = CFAbsoluteTimeGetCurrent();
  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    double v9 = *(double *)(v8 + 40);
  }
  else {
    double v9 = 0.0;
  }
  _HKInitializeLogging();
  id v10 = *v2;
  if (os_log_type_enabled(*v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543874;
    *(void *)&buf[4] = v11;
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = Current - v6;
    *(_WORD *)&buf[22] = 2048;
    double v29 = v7 - v9;
    _os_log_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_INFO, "%{public}@: Total activation delay: %.3fs, database access delay: %.3fs", buf, 0x20u);
  }
  _HKInitializeLogging();
  os_log_t v12 = *v2;
  if (os_signpost_enabled(*v2))
  {
    uint64_t v13 = v12;
    v14 = v13;
    if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v15;
      _os_signpost_emit_with_name_impl(&dword_1BCB7D000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v3, "query-run", "server=%{public}@", buf, 0xCu);
    }
  }
  BOOL v16 = *(void **)(a1 + 48);
  uint64_t v17 = [*(id *)(a1 + 32) createDatabaseTransactionContext];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __51__HDQueryManager__lock_executeDatabaseAccessBlocks__block_invoke_299;
  v26[3] = &unk_1E62F6A18;
  id v27 = *(id *)(a1 + 40);
  [v16 performWithTransactionContext:v17 error:0 block:v26];

  _HKInitializeLogging();
  os_log_t v18 = *v2;
  if (os_signpost_enabled(*v2))
  {
    v19 = v18;
    v20 = v19;
    if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BCB7D000, v20, OS_SIGNPOST_INTERVAL_END, v3, "query-run", "", buf, 2u);
    }
  }
  uint64_t v21 = *(void *)(a1 + 56);
  id v22 = *(id *)(a1 + 40);
  if (v21)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(v21 + 8));
    [*(id *)(v21 + 40) removeObject:v22];
    if (v22)
    {
      unint64_t v23 = *((void *)v22 + 4) + 1;
      if (v23 > 0x22 || ((1 << v23) & 0x404000001) == 0) {
        --*(void *)(v21 + 48);
      }
      id WeakRetained = objc_loadWeakRetained((id *)v22 + 2);
    }
    else
    {
      id WeakRetained = 0;
    }
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __49__HDQueryManager__didExecuteDatabaseAccessBlock___block_invoke;
    double v29 = COERCE_DOUBLE(&unk_1E62F6A68);
    uint64_t v30 = v21;
    id v31 = WeakRetained;
    id v25 = WeakRetained;
    -[HDQueryManager _performAsyncWithUnitTestDelegate:]((void *)v21, buf);
    -[HDQueryManager _lock_executeDatabaseAccessBlocks](v21);
    os_unfair_lock_unlock((os_unfair_lock_t)(v21 + 8));
  }
}

uint64_t __51__HDQueryManager__lock_executeDatabaseAccessBlocks__block_invoke_299(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    uint64_t v2 = *(void *)(v1 + 8);
  }
  else {
    uint64_t v2 = 0;
  }
  (*(void (**)(void))(v2 + 16))();
  return 1;
}

uint64_t __55__HDQueryManager__lock_willExecuteDatabaseAccessBlock___block_invoke(uint64_t a1, void *a2)
{
  return [a2 queryManager:*(void *)(a1 + 32) willRunQueryServer:*(void *)(a1 + 40)];
}

- (void)_performAsyncWithUnitTestDelegate:(void *)a1
{
  id v3 = a2;
  uint64_t v4 = objc_msgSend(a1, "unitTest_delegate");
  if (v4)
  {
    double v5 = objc_msgSend(a1, "unitTest_delegateQueue");
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __52__HDQueryManager__performAsyncWithUnitTestDelegate___block_invoke;
    v6[3] = &unk_1E62F3CA8;
    id v8 = v3;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
}

uint64_t __49__HDQueryManager__didExecuteDatabaseAccessBlock___block_invoke(uint64_t a1, void *a2)
{
  return [a2 queryManager:*(void *)(a1 + 32) didRunQueryServer:*(void *)(a1 + 40)];
}

- (void)_lock_unregisterQueryServer:(uint64_t)a1
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
  _HKInitializeLogging();
  uint64_t v4 = (os_log_t *)MEMORY[0x1E4F29F90];
  double v5 = *MEMORY[0x1E4F29F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_DEBUG))
  {
    int v18 = 138543362;
    id v19 = v3;
    _os_log_debug_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_DEBUG, "Unregistering query server %{public}@", (uint8_t *)&v18, 0xCu);
  }
  double v6 = [v3 queryUUID];
  id v7 = [*(id *)(a1 + 16) objectForKeyedSubscript:v6];

  if (v7 == v3)
  {
    double v9 = [v3 client];
    id v10 = [v9 process];
    uint64_t v11 = -[HDQueryManager _monitoringIdentifierForProcess:](a1, v10);

    if (v11)
    {
      uint64_t v12 = -[HDQueryManager _lock_queryCollectionForBundleIdentifier:createIfNecessary:](a1, v11, 0);
      uint64_t v13 = (id *)v12;
      if (!v12
        || (v14 = *(void **)(v12 + 8),
            [v3 queryUUID],
            uint64_t v15 = objc_claimAutoreleasedReturnValue(),
            [v14 removeObjectForKey:v15],
            v15,
            ![v13[1] count]))
      {
        BOOL v16 = [(id)a1 daemon];
        uint64_t v17 = [v16 processStateManager];
        [v17 unregisterObserver:a1 forBundleIdentifier:v11];

        [*(id *)(a1 + 24) removeObjectForKey:v11];
      }
    }
    [*(id *)(a1 + 16) removeObjectForKey:v6];
  }
  else
  {
    _HKInitializeLogging();
    id v8 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138543362;
      id v19 = v6;
      _os_log_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_DEFAULT, "Ignoring attempt to unregister untracked query server for %{public}@ ", (uint8_t *)&v18, 0xCu);
    }
  }
}

- (id)_monitoringIdentifierForProcess:(uint64_t)a1
{
  id v3 = a2;
  uint64_t v4 = [v3 bundleIdentifier];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  double v6 = [WeakRetained behavior];
  if (([v6 isAppleWatch] & 1) != 0
    && ([v3 applicationIdentifier], (uint64_t v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v8 = (void *)v7;
    char v9 = [v3 isWidgetKitExtension];

    if (v9) {
      goto LABEL_7;
    }
    [v3 applicationIdentifier];
    v4 = id WeakRetained = v4;
  }
  else
  {
  }
LABEL_7:

  return v4;
}

- (_HDProcessQueryCollection)_lock_queryCollectionForBundleIdentifier:(int)a3 createIfNecessary:
{
  id v5 = a2;
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
    double v6 = [*(id *)(a1 + 24) objectForKeyedSubscript:v5];
    if (v6) {
      BOOL v7 = 1;
    }
    else {
      BOOL v7 = a3 == 0;
    }
    if (!v7)
    {
      double v6 = [_HDProcessQueryCollection alloc];
      id v8 = v5;
      if (v6)
      {
        v18.receiver = v6;
        v18.super_class = (Class)_HDProcessQueryCollection;
        double v6 = (_HDProcessQueryCollection *)objc_msgSendSuper2(&v18, sel_init);
        if (v6)
        {
          uint64_t v9 = HKCreateSerialDispatchQueue();
          queue = v6->_queue;
          v6->_queue = (OS_dispatch_queue *)v9;

          uint64_t v11 = [v8 copy];
          processBundleIdentifier = v6->_processBundleIdentifier;
          v6->_processBundleIdentifier = (NSString *)v11;

          uint64_t v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
          queryServersByUUID = v6->_queryServersByUUID;
          v6->_queryServersByUUID = v13;

          uint64_t v15 = [[HDQueryServerClientState alloc] initWithApplicationState:0];
          clientState = v6->_clientState;
          v6->_clientState = v15;
        }
      }

      [*(id *)(a1 + 24) setObject:v6 forKeyedSubscript:v8];
    }
  }
  else
  {
    double v6 = 0;
  }

  return v6;
}

id __51__HDQueryManager__lock_foregroundBundleIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = a2;
  id v3 = v2;
  if (v2) {
    uint64_t v4 = (void *)v2[5];
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = v4;
  if ([v5 isForeground])
  {
    if (v3) {
      double v6 = (void *)v3[4];
    }
    else {
      double v6 = 0;
    }
    id v7 = v6;
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)processWithBundleIdentifier:(id)a3 didTransitionFromState:(unsigned int)a4 toState:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v26 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[HDQueryManager _lock_queryCollectionForBundleIdentifier:createIfNecessary:]((uint64_t)self, v26, 0);
  id v8 = (id *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
    id v10 = [WeakRetained behavior];
    char v11 = [v10 isAppleWatch];
    if v5 == 4 && (v11)
    {
      uint64_t v12 = [(HDQueryManager *)self daemon];
      uint64_t v13 = [v12 processStateManager];
      int v14 = [v13 isApplicationInExtendedRuntimeSessionForBundleIdentifier:v26];

      uint64_t v5 = v14 ? 8 : 4;
    }
    else
    {
    }
    if ([v8[5] applicationState] != v5)
    {
      uint64_t v15 = [[HDQueryServerClientState alloc] initWithApplicationState:v5];
      objc_setProperty_nonatomic_copy(v8, v16, v15, 40);

      uint64_t v17 = v8;
      if (self)
      {
        os_unfair_lock_assert_owner(&self->_lock);
        id v18 = v17[4];
        id v19 = -[_HDProcessQueryCollection queryServers](v17);
        uint64_t v20 = (void *)[v19 copy];

        id v21 = v8[5];
        id v22 = v17[3];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __67__HDQueryManager__lock_handleClientStateChangeWithQueryCollection___block_invoke;
        block[3] = &unk_1E62F6A40;
        uint64_t v28 = v17;
        id v29 = v18;
        id v30 = v20;
        id v31 = v21;
        id v23 = v21;
        id v24 = v20;
        id v25 = v18;
        dispatch_async(v22, block);
      }
    }
  }
  os_unfair_lock_unlock(p_lock);
}

void __67__HDQueryManager__lock_handleClientStateChangeWithQueryCollection___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __67__HDQueryManager__lock_handleClientStateChangeWithQueryCollection___block_invoke_2;
  v28[3] = &unk_1E62F31C0;
  uint64_t v2 = *(void *)(a1 + 32);
  id v29 = *(id *)(a1 + 40);
  id v30 = *(id *)(a1 + 48);
  id v3 = v28;
  if (v2)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 24));
    -[_HDProcessQueryCollection queue_cancelStateChangeTimer](v2);
    uint64_t v4 = dispatch_get_global_queue(21, 0);
    dispatch_source_t v5 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v4);
    double v6 = *(void **)(v2 + 16);
    *(void *)(v2 + 16) = v5;

    id v7 = *(NSObject **)(v2 + 16);
    dispatch_time_t v8 = dispatch_time(0, 10000000000);
    dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0);
    uint64_t v9 = *(NSObject **)(v2 + 16);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __77___HDProcessQueryCollection_queue_startStateChangeTimerWithInterval_handler___block_invoke;
    handler[3] = &unk_1E62F2F20;
    uint64_t v32 = v3;
    dispatch_source_set_event_handler(v9, handler);
    dispatch_resume(*(dispatch_object_t *)(v2 + 16));
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v10 = *(id *)(a1 + 48);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v34 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v24 + 1) + 8 * v14++) clientStateWillChange:*(void *)(a1 + 56)];
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v34 count:16];
    }
    while (v12);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v15 = *(id *)(a1 + 48);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v20 objects:v33 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v19++), "clientStateDidChange:", *(void *)(a1 + 56), (void)v20);
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v20 objects:v33 count:16];
    }
    while (v17);
  }

  -[_HDProcessQueryCollection queue_cancelStateChangeTimer](*(void *)(a1 + 32));
}

void __67__HDQueryManager__lock_handleClientStateChangeWithQueryCollection___block_invoke_2(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  uint64_t v2 = (void *)*MEMORY[0x1E4F29F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_FAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v3 = *(void **)(a1 + 40);
    dispatch_source_t v5 = v2;
    int v6 = 138412546;
    uint64_t v7 = v4;
    __int16 v8 = 2048;
    uint64_t v9 = [v3 count];
    _os_log_fault_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_FAULT, "Failed to finish client state transition in time for process \"%@\" (%lu queries)", (uint8_t *)&v6, 0x16u);
  }
}

- (id)diagnosticDescription
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = (void *)[(NSMutableArray *)self->_executingDatabaseAccessBlocks copy];
  dispatch_source_t v5 = (void *)[(NSMutableArray *)self->_pendingDatabaseAccessBlocks copy];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  queryCollectionsByProcessBundleIdentifier = self->_queryCollectionsByProcessBundleIdentifier;
  v63[0] = MEMORY[0x1E4F143A8];
  v63[1] = 3221225472;
  v63[2] = __39__HDQueryManager_diagnosticDescription__block_invoke;
  v63[3] = &unk_1E62F6AB0;
  id v46 = v6;
  id v64 = v46;
  [(NSMutableDictionary *)queryCollectionsByProcessBundleIdentifier enumerateKeysAndObjectsUsingBlock:v63];
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v9 = self->_queryCollectionsByProcessBundleIdentifier;
  v61[0] = MEMORY[0x1E4F143A8];
  v61[1] = 3221225472;
  v61[2] = __39__HDQueryManager_diagnosticDescription__block_invoke_2;
  v61[3] = &unk_1E62F6AB0;
  id v45 = v8;
  id v62 = v45;
  [(NSMutableDictionary *)v9 enumerateKeysAndObjectsUsingBlock:v61];
  os_unfair_lock_unlock(p_lock);
  uint64_t v10 = [MEMORY[0x1E4F28E78] stringWithFormat:@"%@ (%ld active queries)", objc_opt_class(), -[NSMutableDictionary count](self->_queryServersByUUID, "count")];
  objc_msgSend(v10, "appendFormat:", @"\nQuery blocks pending:%lu", objc_msgSend(v5, "count"));
  v47 = v5;
  id v48 = v4;
  id v50 = v10;
  if ([v5 count])
  {
    unint64_t v11 = [v5 count];
    uint64_t v12 = 5;
    if (v11 < 5) {
      uint64_t v12 = v11;
    }
    if (v12)
    {
      unint64_t v13 = 0;
      do
      {
        uint64_t v14 = [v5 objectAtIndexedSubscript:v13];
        id v15 = (double *)v14;
        if (v14 && (id WeakRetained = objc_loadWeakRetained((id *)(v14 + 16))) != 0)
        {
          uint64_t v17 = WeakRetained;
          uint64_t v18 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v15[5]];
          uint64_t v52 = objc_opt_class();
          uint64_t v19 = [v17 queryUUID];
          long long v20 = [v19 UUIDString];
          long long v21 = [v17 client];
          long long v22 = [v21 process];
          long long v23 = [v22 bundleIdentifier];
          long long v24 = HKDiagnosticStringFromDate();
          [v50 appendFormat:@"\n%@ %@ %@ created %@", v52, v20, v23, v24];

          uint64_t v10 = v50;
          dispatch_source_t v5 = v47;
          uint64_t v4 = v48;
        }
        else
        {
          [v10 appendString:@"\n<invalidated query>"];
        }

        ++v13;
        unint64_t v25 = [v5 count];
        unint64_t v26 = 5;
        if (v25 < 5) {
          unint64_t v26 = v25;
        }
      }
      while (v13 < v26);
    }
    if ((unint64_t)[v5 count] > 5) {
      objc_msgSend(v10, "appendFormat:", @"\n%lu additional blocks not shown", objc_msgSend(v5, "count") - 5);
    }
  }
  if ([v4 count])
  {
    [v10 appendFormat:@"\nQuery blocks executing:"];
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id obj = v4;
    uint64_t v53 = [obj countByEnumeratingWithState:&v57 objects:v65 count:16];
    if (v53)
    {
      uint64_t v51 = *(void *)v58;
      do
      {
        uint64_t v27 = 0;
        do
        {
          if (*(void *)v58 != v51) {
            objc_enumerationMutation(obj);
          }
          uint64_t v28 = *(void *)(*((void *)&v57 + 1) + 8 * v27);
          if (v28 && (id v29 = objc_loadWeakRetained((id *)(v28 + 16))) != 0)
          {
            id v30 = v29;
            id v31 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:*(double *)(v28 + 40)];
            uint64_t v32 = objc_opt_class();
            v33 = [v30 queryUUID];
            v34 = [v33 UUIDString];
            uint64_t v35 = [v30 client];
            id v36 = [v35 process];
            v37 = [v36 bundleIdentifier];
            unint64_t v38 = HKDiagnosticStringFromDate();
            uint64_t v44 = v32;
            uint64_t v10 = v50;
            [v50 appendFormat:@"\n%@ %@ %@ created %@", v44, v34, v37, v38];
          }
          else
          {
            [v10 appendString:@"\n<invalidated query>"];
          }
          ++v27;
        }
        while (v53 != v27);
        uint64_t v53 = [obj countByEnumeratingWithState:&v57 objects:v65 count:16];
      }
      while (v53);
    }

    dispatch_source_t v5 = v47;
    uint64_t v4 = v48;
  }
  else
  {
    objc_msgSend(v10, "appendFormat:", @"\nQuery blocks executing:%lu", objc_msgSend(v4, "count"));
  }
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __39__HDQueryManager_diagnosticDescription__block_invoke_3;
  v54[3] = &unk_1E62F6AF8;
  id v39 = v10;
  id v55 = v39;
  id v56 = v45;
  id v40 = v45;
  [v46 enumerateKeysAndObjectsUsingBlock:v54];
  v41 = v56;
  id v42 = v39;

  return v42;
}

void __39__HDQueryManager_diagnosticDescription__block_invoke(uint64_t a1, void *a2, id *a3)
{
  id v5 = a2;
  -[_HDProcessQueryCollection queryServers](a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
}

uint64_t __39__HDQueryManager_diagnosticDescription__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    a3 = *(void *)(a3 + 40);
  }
  return [*(id *)(a1 + 32) setObject:a3 forKeyedSubscript:a2];
}

void __39__HDQueryManager_diagnosticDescription__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) appendFormat:@"\n\nProcess: %@", v5];
  uint64_t v7 = objc_msgSend(v6, "hk_mapToSet:", &__block_literal_global_350);
  if ([v7 count])
  {
    id v8 = *(void **)(a1 + 32);
    uint64_t v9 = [v7 allObjects];
    uint64_t v10 = [v9 componentsJoinedByString:@", "];
    [v8 appendFormat:@" (%@)", v10];
  }
  unint64_t v11 = [*(id *)(a1 + 40) objectForKeyedSubscript:v5];
  long long v22 = v5;
  if ([v11 isSuspended])
  {
    uint64_t v12 = *(void **)(a1 + 32);
    unint64_t v13 = @" - suspended";
  }
  else
  {
    int v14 = [v11 isForeground];
    uint64_t v12 = *(void **)(a1 + 32);
    if (v14) {
      unint64_t v13 = @" - foreground";
    }
    else {
      unint64_t v13 = @" - background";
    }
  }
  [v12 appendFormat:v13];
  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", @" (%lu queries)", objc_msgSend(v6, "count"));
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v15 = v6;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v24;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(v15);
        }
        long long v20 = *(void **)(a1 + 32);
        long long v21 = [*(id *)(*((void *)&v23 + 1) + 8 * v19) diagnosticDescription];
        [v20 appendFormat:@"\n%@", v21, v22, (void)v23];

        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v17);
  }
}

id __39__HDQueryManager_diagnosticDescription__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2 = NSNumber;
  id v3 = [a2 client];
  uint64_t v4 = [v3 process];
  id v5 = objc_msgSend(v2, "numberWithInt:", objc_msgSend(v4, "processIdentifier"));

  return v5;
}

- (void)logDiagnostics
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(HDQueryManager *)self diagnosticDescription];
  id v3 = [v2 componentsSeparatedByString:@"\n"];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    uint64_t v7 = (os_log_t *)MEMORY[0x1E4F29F90];
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        _HKInitializeLogging();
        uint64_t v10 = *v7;
        if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v16 = v9;
          _os_log_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v17 count:16];
    }
    while (v5);
  }
}

- (void)unitTest_suspendWithCount:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_unitTest_suspendCount)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"HDQueryManager.m", 625, @"Invalid parameter not satisfying: %@", @"_unitTest_suspendCount == 0" object file lineNumber description];
  }
  self->_int64_t unitTest_suspendCount = a3;

  os_unfair_lock_unlock(p_lock);
}

uint64_t __52__HDQueryManager__performAsyncWithUnitTestDelegate___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (OS_dispatch_queue)unitTest_delegateQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 72, 1);
}

- (void)setUnitTest_delegateQueue:(id)a3
{
}

- (HDQueryManagerUnitTestDelegate)unitTest_delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_unitTest_delegate);

  return (HDQueryManagerUnitTestDelegate *)WeakRetained;
}

- (void)setUnitTest_delegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_unitTest_delegate);
  objc_storeStrong((id *)&self->_unitTest_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_daemon);
  objc_storeStrong((id *)&self->_executingDatabaseAccessBlocks, 0);
  objc_storeStrong((id *)&self->_pendingDatabaseAccessBlocks, 0);
  objc_storeStrong((id *)&self->_queryCollectionsByProcessBundleIdentifier, 0);

  objc_storeStrong((id *)&self->_queryServersByUUID, 0);
}

@end