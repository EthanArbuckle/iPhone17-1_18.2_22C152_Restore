@interface HDDataAggregator
- (BOOL)didPersistObjects:(id)a3 lastDatum:(id)a4 collector:(id)a5 error:(id *)a6;
- (BOOL)doesDatumPredateDatabaseObliteration:(id)a3;
- (BOOL)persistForCollector:(id)a3 usedDatums:(id)a4 source:(id)a5 device:(id)a6 error:(id *)a7 persistenceHandler:(id)a8;
- (BOOL)persistObjects:(id)a3 usedDatums:(id)a4 collector:(id)a5 source:(id)a6 device:(id)a7 resolveAssociations:(BOOL)a8 error:(id *)a9;
- (HDDataAggregator)initWithDataCollectionManager:(id)a3;
- (HDDataAggregatorConfiguration)configuration;
- (HDDataCollectionManager)dataCollectionManager;
- (HKObjectType)objectType;
- (id)_keyValueDomain;
- (id)allCollectors;
- (id)configurationForCollector:(id)a3;
- (id)diagnosticDescription;
- (void)_considerStartingCollectors;
- (void)_startCollector:(id *)a1;
- (void)daemonReady:(id)a3;
- (void)dataCollector:(id)a3 didChangeState:(id)a4;
- (void)dataCollector:(id)a3 didCollectSensorData:(id)a4 device:(id)a5;
- (void)dataCollector:(id)a3 didCollectSensorData:(id)a4 device:(id)a5 options:(unint64_t)a6;
- (void)recomputeCollectorConfiguration;
- (void)registerDataCollector:(id)a3 state:(id)a4;
- (void)registerSensorDataObserver:(id)a3 queue:(id)a4;
- (void)requestAggregationThroughDate:(id)a3 mode:(int64_t)a4 options:(unint64_t)a5 completion:(id)a6;
- (void)resume;
- (void)setConfiguration:(id)a3;
- (void)unitTest_setLastObliterationDate:(id)a3;
- (void)unregisterDataCollector:(id)a3;
- (void)unregisterSensorDataObserver:(id)a3;
@end

@implementation HDDataAggregator

- (HDDataCollectionManager)dataCollectionManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataCollectionManager);

  return (HDDataCollectionManager *)WeakRetained;
}

- (id)_keyValueDomain
{
  if (a1)
  {
    v1 = NSString;
    v2 = [a1 objectType];
    v3 = [v2 identifier];
    v4 = [v1 stringWithFormat:@"DATA_AGGREGATION-%@", v3];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setConfiguration:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v4 = (HDDataAggregatorConfiguration *)a3;
  os_unfair_lock_lock(&self->_lock);
  lock_configuration = self->_lock_configuration;
  if (lock_configuration == v4 || v4 && [(HDDataAggregatorConfiguration *)lock_configuration isEqual:v4])
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    _HKInitializeLogging();
    v6 = *MEMORY[0x1E4F29F10];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_DEFAULT))
    {
      v7 = self->_lock_configuration;
      int v10 = 138543874;
      v11 = self;
      __int16 v12 = 2114;
      v13 = v7;
      __int16 v14 = 2114;
      v15 = v4;
      _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Aggregator configuration changed from %{public}@ -> %{public}@", (uint8_t *)&v10, 0x20u);
    }
    v8 = (HDDataAggregatorConfiguration *)[(HDDataAggregatorConfiguration *)v4 copy];
    v9 = self->_lock_configuration;
    self->_lock_configuration = v8;

    os_unfair_lock_unlock(&self->_lock);
    -[HDDataAggregator _considerStartingCollectors]((uint64_t)self);
    [(HDDataAggregator *)self recomputeCollectorConfiguration];
  }
}

- (void)dataCollector:(id)a3 didChangeState:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (!v7)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"HDDataAggregator.m", 220, @"Invalid parameter not satisfying: %@", @"collector != nil" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_12:
    __int16 v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"HDDataAggregator.m", 221, @"Invalid parameter not satisfying: %@", @"state != nil" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_12;
  }
LABEL_3:
  os_unfair_lock_lock(&self->_lock);
  int v10 = [(NSMapTable *)self->_lock_collectorRegistry objectForKey:v7];
  v11 = v10;
  if (v10 == v9 || v9 && [v10 isEqual:v9])
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    _HKInitializeLogging();
    __int16 v12 = *MEMORY[0x1E4F29F10];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138544130;
      uint64_t v16 = self;
      __int16 v17 = 2114;
      id v18 = v7;
      __int16 v19 = 2114;
      v20 = v11;
      __int16 v21 = 2114;
      v22 = v9;
      _os_log_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: Collector %{public}@ changed state %{public}@ -> %{public}@", buf, 0x2Au);
    }
    [(NSMapTable *)self->_lock_collectorRegistry setObject:v9 forKey:v7];
    os_unfair_lock_unlock(&self->_lock);
    [(HDDataAggregator *)self recomputeCollectorConfiguration];
  }
}

- (HDDataAggregator)initWithDataCollectionManager:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HDDataAggregator;
  v5 = [(HDDataAggregator *)&v12 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_dataCollectionManager, v4);
    *(void *)&v6->_lock._os_unfair_lock_opaque = 0;
    uint64_t v7 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    lock_collectorRegistry = v6->_lock_collectorRegistry;
    v6->_lock_collectorRegistry = (NSMapTable *)v7;

    v6->_lock_canStartCollectors = 0;
    uint64_t v9 = +[HDDataAggregatorConfiguration configurationWithLatency:0 interval:0 seriesDuration:0 activeWorkout:*MEMORY[0x1E4F29970] foregroundObserver:*MEMORY[0x1E4F29970] backgroundObserver:*MEMORY[0x1E4F29970]];
    lock_configuration = v6->_lock_configuration;
    v6->_lock_configuration = (HDDataAggregatorConfiguration *)v9;

    atomic_store(0, (unsigned __int8 *)&v6->_hasStartedCollectors);
  }

  return v6;
}

- (void)registerDataCollector:(id)a3 state:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    objc_super v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"HDDataAggregator.m", 157, @"Invalid parameter not satisfying: %@", @"collector != nil" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v13 = [MEMORY[0x1E4F28B00] currentHandler];
  [v13 handleFailureInMethod:a2, self, @"HDDataAggregator.m", 158, @"Invalid parameter not satisfying: %@", @"state != nil" object file lineNumber description];

LABEL_3:
  os_unfair_lock_lock(&self->_lock);
  _HKInitializeLogging();
  int v10 = *MEMORY[0x1E4F29F10];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v15 = self;
    __int16 v16 = 2114;
    id v17 = v7;
    __int16 v18 = 2114;
    __int16 v19 = v9;
    _os_log_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Registered %{public}@ with state %{public}@", buf, 0x20u);
  }
  [(NSMapTable *)self->_lock_collectorRegistry setObject:v9 forKey:v7];
  os_unfair_lock_unlock(&self->_lock);
  -[HDDataAggregator _considerStartingCollectors]((uint64_t)self);
  unsigned __int8 v11 = atomic_load((unsigned __int8 *)&self->_hasStartedCollectors);
  if (v11)
  {
    -[HDDataAggregator _startCollector:]((id *)&self->super.isa, v7);
    [(HDDataAggregator *)self recomputeCollectorConfiguration];
  }
}

- (void)daemonReady:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataCollectionManager);
  v5 = [WeakRetained profile];
  v6 = [v5 database];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __32__HDDataAggregator_daemonReady___block_invoke;
  v7[3] = &unk_1E62F3208;
  v7[4] = self;
  [v6 performWhenDataProtectedByFirstUnlockIsAvailable:v7];
}

uint64_t __32__HDDataAggregator_daemonReady___block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  *(unsigned char *)(*(void *)(a1 + 32) + 33) = 1;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  -[HDDataAggregator _considerStartingCollectors](*(void *)(a1 + 32));
  v2 = *(void **)(a1 + 32);

  return [v2 recomputeCollectorConfiguration];
}

- (void)resume
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataCollectionManager);
  v3 = [WeakRetained profile];
  id v4 = [v3 daemon];
  [v4 registerDaemonReadyObserver:self queue:0];
}

- (void)requestAggregationThroughDate:(id)a3 mode:(int64_t)a4 options:(unint64_t)a5 completion:(id)a6
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v22 = a3;
  id v20 = a6;
  id v8 = [(HDDataAggregator *)self allCollectors];
  if ([v8 count])
  {
    uint64_t v9 = dispatch_group_create();
    v39[0] = 0;
    v39[1] = v39;
    v39[2] = 0x2020000000;
    char v40 = 1;
    v37[0] = 0;
    v37[1] = v37;
    v37[2] = 0x3032000000;
    v37[3] = __Block_byref_object_copy__129;
    v37[4] = __Block_byref_object_dispose__129;
    id v38 = 0;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id obj = v8;
    uint64_t v10 = [obj countByEnumeratingWithState:&v33 objects:v47 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v34 != v11) {
            objc_enumerationMutation(obj);
          }
          v13 = [*(id *)(*((void *)&v33 + 1) + 8 * i) collector];
          if (objc_opt_respondsToSelector())
          {
            dispatch_group_enter(v9);
            _HKInitializeLogging();
            __int16 v14 = v8;
            v15 = *MEMORY[0x1E4F29F10];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543874;
              v42 = self;
              __int16 v43 = 2114;
              id v44 = v22;
              __int16 v45 = 2114;
              v46 = v13;
              _os_log_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: Requesting collection through %{public}@ from %{public}@", buf, 0x20u);
            }
            v27[0] = MEMORY[0x1E4F143A8];
            v27[1] = 3221225472;
            v27[2] = __74__HDDataAggregator_requestAggregationThroughDate_mode_options_completion___block_invoke;
            v27[3] = &unk_1E6304B40;
            v27[4] = self;
            id v16 = v22;
            id v28 = v16;
            id v17 = v13;
            id v29 = v17;
            v31 = v39;
            v32 = v37;
            v30 = v9;
            [v17 dataAggregator:self requestsCollectionThroughDate:v16 completion:v27];
            id v8 = v14;
          }
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v33 objects:v47 count:16];
      }
      while (v10);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataCollectionManager);
    __int16 v19 = [WeakRetained dataCollectionQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __74__HDDataAggregator_requestAggregationThroughDate_mode_options_completion___block_invoke_284;
    block[3] = &unk_1E6304B68;
    id v24 = v20;
    v25 = v39;
    v26 = v37;
    dispatch_group_notify(v9, v19, block);

    _Block_object_dispose(v37, 8);
    _Block_object_dispose(v39, 8);
  }
  else
  {
    (*((void (**)(id, uint64_t, void))v20 + 2))(v20, 1, 0);
  }
}

void __74__HDDataAggregator_requestAggregationThroughDate_mode_options_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (a2)
  {
    _HKInitializeLogging();
    id v7 = *MEMORY[0x1E4F29F10];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 40);
      uint64_t v10 = *(void *)(a1 + 48);
      int v14 = 138543874;
      uint64_t v15 = v8;
      __int16 v16 = 2114;
      uint64_t v17 = v9;
      __int16 v18 = 2114;
      uint64_t v19 = v10;
      _os_log_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Finished collection through %{public}@ for %{public}@", (uint8_t *)&v14, 0x20u);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    uint64_t v11 = *(void *)(*(void *)(a1 + 72) + 8);
    uint64_t v13 = *(void *)(v11 + 40);
    objc_super v12 = (id *)(v11 + 40);
    if (!v13) {
      objc_storeStrong(v12, a3);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

uint64_t __74__HDDataAggregator_requestAggregationThroughDate_mode_options_completion___block_invoke_284(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[4] + 16))(a1[4], *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24), *(void *)(*(void *)(a1[6] + 8) + 40));
}

- (void)_considerStartingCollectors
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = (__CFString *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    if (*(unsigned char *)(a1 + 33))
    {
      char v3 = 0;
      atomic_compare_exchange_strong((atomic_uchar *volatile)(a1 + 32), (unsigned __int8 *)&v3, 1u);
      if (!v3)
      {
        long long v28 = 0u;
        long long v29 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v4 = *(id *)(a1 + 16);
        uint64_t v5 = [v4 countByEnumeratingWithState:&v26 objects:v31 count:16];
        if (v5)
        {
          uint64_t v6 = v5;
          uint64_t v7 = *(void *)v27;
          do
          {
            for (uint64_t i = 0; i != v6; ++i)
            {
              if (*(void *)v27 != v7) {
                objc_enumerationMutation(v4);
              }
              [(__CFString *)v2 addObject:*(void *)(*((void *)&v26 + 1) + 8 * i)];
            }
            uint64_t v6 = [v4 countByEnumeratingWithState:&v26 objects:v31 count:16];
          }
          while (v6);
        }

        os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
        _HKInitializeLogging();
        uint64_t v9 = *MEMORY[0x1E4F29F10];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          uint64_t v33 = a1;
          __int16 v34 = 2114;
          long long v35 = v2;
          _os_log_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: start collectors: %{public}@", buf, 0x16u);
        }
        long long v24 = 0u;
        long long v25 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        uint64_t v10 = v2;
        uint64_t v11 = [(__CFString *)v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v23;
          do
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v23 != v13) {
                objc_enumerationMutation(v10);
              }
              -[HDDataAggregator _startCollector:]((id *)a1, *(void **)(*((void *)&v22 + 1) + 8 * j));
            }
            uint64_t v12 = [(__CFString *)v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
          }
          while (v12);
        }

        goto LABEL_30;
      }
      unsigned __int8 v19 = atomic_load((unsigned __int8 *)(a1 + 32));
      if ((v19 & 1) == 0)
      {
        _HKInitializeLogging();
        uint64_t v20 = *MEMORY[0x1E4F29F10];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_DEFAULT))
        {
          __int16 v21 = @"YES";
          if ((v3 & 1) == 0) {
            __int16 v21 = @"NO";
          }
          *(_DWORD *)buf = 138543618;
          uint64_t v33 = a1;
          __int16 v34 = 2114;
          long long v35 = v21;
          __int16 v16 = "%{public}@: Unable to set _hasStartedCollectors (%{public}@); not starting";
          uint64_t v17 = v20;
          uint32_t v18 = 22;
          goto LABEL_28;
        }
      }
    }
    else
    {
      _HKInitializeLogging();
      uint64_t v15 = *MEMORY[0x1E4F29F10];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v33 = a1;
        __int16 v16 = "%{public}@: Not yet starting collectors (_canStartCollectors = NO)";
        uint64_t v17 = v15;
        uint32_t v18 = 12;
LABEL_28:
        _os_log_impl(&dword_1BCB7D000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
LABEL_30:
  }
}

- (HDDataAggregatorConfiguration)configuration
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_lock_configuration;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)_startCollector:(id *)a1
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    int CanResumeFromLastSensorDatum = _HDDataCollectorCanResumeFromLastSensorDatum(v3);
    uint64_t v6 = (os_log_t *)MEMORY[0x1E4F29F10];
    if (CanResumeFromLastSensorDatum)
    {
      uint64_t v7 = [HDKeyValueDomain alloc];
      uint64_t v8 = -[HDDataAggregator _keyValueDomain](a1);
      id WeakRetained = objc_loadWeakRetained(a1 + 7);
      uint64_t v10 = [WeakRetained profile];
      uint64_t v11 = [(HDKeyValueDomain *)v7 initWithCategory:0 domainName:v8 profile:v10];

      uint64_t v12 = [v4 identifierForDataAggregator:a1];
      if (!v12)
      {
        long long v22 = [MEMORY[0x1E4F28B00] currentHandler];
        [v22 handleFailureInMethod:sel__startCollector_, a1, @"HDDataAggregator.m", 431, @"%@: Unexpectedly nil collector key when starting %@", a1, v4 object file lineNumber description];
      }
      id v24 = 0;
      uint64_t v13 = [(HDKeyValueDomain *)v11 dataForKey:v12 error:&v24];
      id v14 = v24;

      if (v13)
      {
        uint64_t v15 = objc_opt_class();
        if (objc_opt_respondsToSelector())
        {
          uint64_t v15 = [v4 sensorDatumClassForAggregator:a1];
        }
        else
        {
          _HKInitializeLogging();
          uint32_t v18 = *v6;
          if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543874;
            long long v26 = a1;
            __int16 v27 = 2114;
            uint64_t v28 = (uint64_t)v4;
            __int16 v29 = 2114;
            uint64_t v30 = v15;
            _os_log_error_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_ERROR, "%{public}@: *** Collector %{public}@ does not implement sensorDatumClassForAggregator:! Please implement to silence this warning. Assuming %{public}@.", buf, 0x20u);
          }
        }
        id v23 = v14;
        __int16 v16 = objc_msgSend(MEMORY[0x1E4F28DC0], "hk_unarchivedObjectOfClass:forKey:data:error:", v15, @"sensor_datum", v13, &v23);
        id v19 = v23;

        if (!v16)
        {
          _HKInitializeLogging();
          uint64_t v20 = *v6;
          if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138544130;
            long long v26 = a1;
            __int16 v27 = 2114;
            uint64_t v28 = v15;
            __int16 v29 = 2114;
            uint64_t v30 = (uint64_t)v4;
            __int16 v31 = 2114;
            id v32 = v19;
            _os_log_error_impl(&dword_1BCB7D000, v20, OS_LOG_TYPE_ERROR, "%{public}@: Failed to decode sensor datum of class %{public}@ when starting %{public}@: %{public}@", buf, 0x2Au);
          }
          __int16 v16 = 0;
        }
        id v14 = v19;
      }
      else
      {
        if (v14)
        {
          _HKInitializeLogging();
          uint64_t v17 = *v6;
          if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543874;
            long long v26 = a1;
            __int16 v27 = 2114;
            uint64_t v28 = (uint64_t)v4;
            __int16 v29 = 2114;
            uint64_t v30 = (uint64_t)v14;
            _os_log_error_impl(&dword_1BCB7D000, v17, OS_LOG_TYPE_ERROR, "%{public}@: Failed to retrieve existing context for collector '%{public}@': %{public}@:", buf, 0x20u);
          }
        }
        uint64_t v13 = 0;
        __int16 v16 = 0;
      }
    }
    else
    {
      uint64_t v13 = 0;
      __int16 v16 = 0;
      id v14 = 0;
    }
    _HKInitializeLogging();
    __int16 v21 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      long long v26 = a1;
      __int16 v27 = 2114;
      uint64_t v28 = (uint64_t)v4;
      __int16 v29 = 2112;
      uint64_t v30 = (uint64_t)v16;
      _os_log_impl(&dword_1BCB7D000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: Starting collector %{public}@ with last persisted datum: %@", buf, 0x20u);
    }
    [v4 beginCollectionForDataAggregator:a1 lastPersistedSensorDatum:v16];
  }
}

- (void)unregisterDataCollector:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"HDDataAggregator.m", 174, @"Invalid parameter not satisfying: %@", @"collector != nil" object file lineNumber description];
  }
  os_unfair_lock_lock(&self->_lock);
  _HKInitializeLogging();
  uint64_t v6 = *MEMORY[0x1E4F29F10];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v10 = self;
    __int16 v11 = 2114;
    id v12 = v5;
    _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Unregistered %{public}@", buf, 0x16u);
  }
  [(NSMapTable *)self->_lock_collectorRegistry removeObjectForKey:v5];
  os_unfair_lock_unlock(&self->_lock);
  unsigned __int8 v7 = atomic_load((unsigned __int8 *)&self->_hasStartedCollectors);
  if (v7) {
    [(HDDataAggregator *)self recomputeCollectorConfiguration];
  }
}

- (id)allCollectors
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_hasStartedCollectors);
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    os_unfair_lock_lock(&self->_lock);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = self->_lock_collectorRegistry;
    uint64_t v6 = [(NSMapTable *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          __int16 v11 = objc_alloc_init(HDDataCollectorRecord);
          -[HDDataCollectorRecord setCollector:](v11, "setCollector:", v10, (void)v14);
          id v12 = [(NSMapTable *)self->_lock_collectorRegistry objectForKey:v10];
          [(HDDataCollectorRecord *)v11 setState:v12];

          [v3 addObject:v11];
        }
        uint64_t v7 = [(NSMapTable *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }

    os_unfair_lock_unlock(&self->_lock);
    [v3 sortUsingComparator:&__block_literal_global_158];
  }
  else
  {
    id v3 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v3;
}

uint64_t __33__HDDataAggregator_allCollectors__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 state];
  uint64_t v6 = [v5 priority];

  uint64_t v7 = [v4 state];

  uint64_t v8 = [v7 priority];
  if (v6 <= v8) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = -1;
  }
  if (v6 < v8) {
    return 1;
  }
  else {
    return v9;
  }
}

- (void)dataCollector:(id)a3 didCollectSensorData:(id)a4 device:(id)a5
{
}

- (void)dataCollector:(id)a3 didCollectSensorData:(id)a4 device:(id)a5 options:(unint64_t)a6
{
  id v8 = a4;
  id v9 = a5;
  if (self)
  {
    sensorDataObservers = self->_sensorDataObservers;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __62__HDDataAggregator__notifySensorDataObservers_device_options___block_invoke;
    v11[3] = &unk_1E6304C50;
    v11[4] = self;
    id v12 = v8;
    id v13 = v9;
    [(HKObserverSet *)sensorDataObservers notifyObservers:v11];
  }
}

- (BOOL)persistObjects:(id)a3 usedDatums:(id)a4 collector:(id)a5 source:(id)a6 device:(id)a7 resolveAssociations:(BOOL)a8 error:(id *)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __96__HDDataAggregator_persistObjects_usedDatums_collector_source_device_resolveAssociations_error___block_invoke;
  v22[3] = &unk_1E6304BB0;
  v22[4] = self;
  id v23 = v15;
  BOOL v26 = a8;
  id v24 = v16;
  id v25 = v17;
  id v18 = v17;
  id v19 = v16;
  id v20 = v15;
  LOBYTE(a7) = [(HDDataAggregator *)self persistForCollector:v18 usedDatums:v19 source:a6 device:a7 error:a9 persistenceHandler:v22];

  return (char)a7;
}

uint64_t __96__HDDataAggregator_persistObjects_usedDatums_collector_source_device_resolveAssociations_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = (id *)(*(void *)(a1 + 32) + 56);
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  id v8 = [WeakRetained profile];
  id v9 = [v8 dataManager];
  int v10 = [v9 insertDataObjects:*(void *)(a1 + 40) withProvenance:v6 creationDate:1 skipInsertionFilter:0 updateSourceOrder:*(unsigned __int8 *)(a1 + 64) resolveAssociations:a3 error:CFAbsoluteTimeGetCurrent()];

  if (!v10) {
    return 0;
  }
  __int16 v11 = *(void **)(a1 + 32);
  uint64_t v12 = *(void *)(a1 + 40);
  id v13 = [*(id *)(a1 + 48) lastObject];
  uint64_t v14 = [v11 didPersistObjects:v12 lastDatum:v13 collector:*(void *)(a1 + 56) error:a3];

  return v14;
}

- (BOOL)persistForCollector:(id)a3 usedDatums:(id)a4 source:(id)a5 device:(id)a6 error:(id *)a7 persistenceHandler:(id)a8
{
  id v14 = a3;
  id v30 = a4;
  id v15 = a5;
  id v16 = a6;
  id v31 = a8;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataCollectionManager);
  id v18 = [WeakRetained profile];

  v57[0] = 0;
  v57[1] = v57;
  v57[2] = 0x3032000000;
  v57[3] = __Block_byref_object_copy__129;
  v57[4] = __Block_byref_object_dispose__129;
  id v58 = 0;
  v55[0] = 0;
  v55[1] = v55;
  v55[2] = 0x3032000000;
  v55[3] = __Block_byref_object_copy__129;
  v55[4] = __Block_byref_object_dispose__129;
  id v56 = 0;
  id v19 = [v18 database];
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __90__HDDataAggregator_persistForCollector_usedDatums_source_device_error_persistenceHandler___block_invoke;
  v48[3] = &unk_1E6304BD8;
  v53 = v57;
  id v20 = v18;
  id v49 = v20;
  id v21 = v15;
  id v50 = v21;
  v51 = self;
  v54 = v55;
  id v22 = v16;
  id v52 = v22;
  BOOL v23 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v19 error:a7 block:v48];

  if (v23)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __90__HDDataAggregator_persistForCollector_usedDatums_source_device_error_persistenceHandler___block_invoke_305;
    aBlock[3] = &unk_1E6304C00;
    id v24 = v20;
    id v43 = v24;
    v46 = v57;
    v47 = v55;
    id v44 = self;
    id v45 = v31;
    id v25 = _Block_copy(aBlock);
    BOOL v26 = [v24 database];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __90__HDDataAggregator_persistForCollector_usedDatums_source_device_error_persistenceHandler___block_invoke_308;
    v37[3] = &unk_1E62F8280;
    id v38 = v14;
    v39 = self;
    id v40 = v30;
    id v41 = v25;
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __90__HDDataAggregator_persistForCollector_usedDatums_source_device_error_persistenceHandler___block_invoke_4;
    v32[3] = &unk_1E6304C28;
    id v27 = v41;
    id v36 = v27;
    id v33 = v38;
    __int16 v34 = self;
    id v35 = v40;
    BOOL v28 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v26 error:a7 block:v37 inaccessibilityHandler:v32];
  }
  else
  {
    BOOL v28 = 0;
  }

  _Block_object_dispose(v55, 8);
  _Block_object_dispose(v57, 8);

  return v28;
}

uint64_t __90__HDDataAggregator_persistForCollector_usedDatums_source_device_error_persistenceHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = [*(id *)(a1 + 32) sourceManager];
  uint64_t v6 = *(void *)(a1 + 40);
  id v26 = 0;
  uint64_t v7 = [v5 sourceEntityForClientSource:v6 createOrUpdateIfNecessary:1 error:&v26];
  id v8 = v26;
  uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
  int v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v7;

  if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    _HKInitializeLogging();
    id v18 = *MEMORY[0x1E4F29F10];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_INFO))
    {
      uint64_t v19 = *(void *)(a1 + 40);
      uint64_t v20 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138543874;
      uint64_t v28 = v19;
      __int16 v29 = 2114;
      uint64_t v30 = v20;
      __int16 v31 = 2114;
      id v32 = v8;
      _os_log_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_INFO, "Failed to retrieve source entity for source '%{public}@' when creating a sample for aggregator '%{public}@': %{public}@", buf, 0x20u);
    }
    id v14 = v8;
    if (!v14) {
      goto LABEL_14;
    }
    if (!a3)
    {
LABEL_13:
      _HKLogDroppedError();
      goto LABEL_14;
    }
LABEL_8:
    id v14 = v14;
    *a3 = v14;
LABEL_14:

    uint64_t v17 = 0;
    goto LABEL_15;
  }

  __int16 v11 = [*(id *)(a1 + 32) deviceManager];
  uint64_t v12 = *(void *)(a1 + 56);
  id v25 = 0;
  uint64_t v13 = [v11 deviceEntityForDevice:v12 error:&v25];
  id v14 = v25;
  uint64_t v15 = *(void *)(*(void *)(a1 + 72) + 8);
  id v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v13;

  if (!*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
  {
    _HKInitializeLogging();
    id v21 = *MEMORY[0x1E4F29F10];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_INFO))
    {
      uint64_t v23 = *(void *)(a1 + 48);
      uint64_t v22 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138543874;
      uint64_t v28 = v22;
      __int16 v29 = 2114;
      uint64_t v30 = v23;
      __int16 v31 = 2114;
      id v32 = v14;
      _os_log_impl(&dword_1BCB7D000, v21, OS_LOG_TYPE_INFO, "Failed to retrieve device entity for device '%{public}@' when creating a sample for aggregator '%{public}@': %{public}@", buf, 0x20u);
    }
    id v14 = v14;
    if (!v14) {
      goto LABEL_14;
    }
    if (!a3) {
      goto LABEL_13;
    }
    goto LABEL_8;
  }
  uint64_t v17 = 1;
LABEL_15:

  return v17;
}

uint64_t __90__HDDataAggregator_persistForCollector_usedDatums_source_device_error_persistenceHandler___block_invoke_305(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = [*(id *)(a1 + 32) dataProvenanceManager];
  id v5 = [v4 localDataProvenanceForSourceEntity:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) version:0 deviceEntity:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];

  uint64_t v6 = *(void *)(a1 + 48);
  id v13 = 0;
  uint64_t v7 = (*(uint64_t (**)(void))(v6 + 16))();
  id v8 = v13;
  if ((v7 & 1) == 0)
  {
    _HKInitializeLogging();
    uint64_t v9 = *MEMORY[0x1E4F29F10];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v15 = v10;
      __int16 v16 = 2114;
      id v17 = v8;
      _os_log_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_INFO, "%{public}@: Persistence failed: %{public}@", buf, 0x16u);
    }
    id v11 = v8;
    if (v11)
    {
      if (a2) {
        *a2 = v11;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  return v7;
}

uint64_t __90__HDDataAggregator_persistForCollector_usedDatums_source_device_error_persistenceHandler___block_invoke_308(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = [v5 databaseForEntityClass:objc_opt_class()];

  if (objc_opt_respondsToSelector())
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __90__HDDataAggregator_persistForCollector_usedDatums_source_device_error_persistenceHandler___block_invoke_2;
    v21[3] = &unk_1E62F30F8;
    id v9 = *(id *)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = *(void **)(a1 + 48);
    id v22 = v9;
    uint64_t v23 = v10;
    id v24 = v11;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __90__HDDataAggregator_persistForCollector_usedDatums_source_device_error_persistenceHandler___block_invoke_3;
    v17[3] = &unk_1E62F30F8;
    id v12 = *(id *)(a1 + 32);
    uint64_t v13 = *(void *)(a1 + 40);
    id v14 = *(void **)(a1 + 48);
    id v18 = v12;
    uint64_t v19 = v13;
    id v20 = v14;
    [v6 onCommit:v21 orRollback:v17];
  }
  uint64_t v15 = (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), a3, v7, v8);

  return v15;
}

uint64_t __90__HDDataAggregator_persistForCollector_usedDatums_source_device_error_persistenceHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) dataAggregator:*(void *)(a1 + 40) didPersistDatums:*(void *)(a1 + 48) success:1 error:0];
}

void __90__HDDataAggregator_persistForCollector_usedDatums_source_device_error_persistenceHandler___block_invoke_3(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 100, @"Database transaction rollback.");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) dataAggregator:*(void *)(a1 + 40) didPersistDatums:*(void *)(a1 + 48) success:0 error:v2];
}

uint64_t __90__HDDataAggregator_persistForCollector_usedDatums_source_device_error_persistenceHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
  id v3 = 0;
  if (objc_opt_respondsToSelector()) {
    [*(id *)(a1 + 32) dataAggregator:*(void *)(a1 + 40) didPersistDatums:*(void *)(a1 + 48) success:v2 error:v3];
  }

  return v2;
}

- (BOOL)didPersistObjects:(id)a3 lastDatum:(id)a4 collector:(id)a5 error:(id *)a6
{
  id v9 = a4;
  id v10 = a5;
  if (_HDDataCollectorCanResumeFromLastSensorDatum(v10))
  {
    id v11 = [HDKeyValueDomain alloc];
    id v12 = -[HDDataAggregator _keyValueDomain](self);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataCollectionManager);
    id v14 = [WeakRetained profile];
    uint64_t v15 = [(HDKeyValueDomain *)v11 initWithCategory:0 domainName:v12 profile:v14];

    __int16 v16 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
    [v16 encodeObject:v9 forKey:@"sensor_datum"];
    id v17 = [v16 encodedData];
    id v18 = [v10 identifierForDataAggregator:self];
    char v19 = [(HDKeyValueDomain *)v15 setData:v17 forKey:v18 error:a6];
  }
  else
  {
    char v19 = 1;
  }

  return v19;
}

- (BOOL)doesDatumPredateDatabaseObliteration:(id)a3
{
  id v4 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__HDDataAggregator_doesDatumPredateDatabaseObliteration___block_invoke;
  block[3] = &unk_1E62F3208;
  void block[4] = self;
  if (qword_1EBA18D98 != -1) {
    dispatch_once(&qword_1EBA18D98, block);
  }
  if (_HDIsUnitTesting)
  {
    id v5 = [v4 dateInterval];
    uint64_t v6 = [v5 startDate];
    p_unitTest_lastObliterationDate = &self->_unitTest_lastObliterationDate;
  }
  else
  {
    if (!_MergedGlobals_216)
    {
      char v8 = 0;
      goto LABEL_8;
    }
    id v5 = [v4 dateInterval];
    uint64_t v6 = [v5 startDate];
    p_unitTest_lastObliterationDate = (NSDate **)&_MergedGlobals_216;
  }
  char v8 = objc_msgSend(v6, "hk_isBeforeDate:", *p_unitTest_lastObliterationDate);

LABEL_8:
  return v8;
}

void __57__HDDataAggregator_doesDatumPredateDatabaseObliteration___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) dataCollectionManager];
  v1 = [v5 profile];
  uint64_t v2 = [v1 database];
  uint64_t v3 = [v2 mostRecentObliterationDate];
  id v4 = (void *)_MergedGlobals_216;
  _MergedGlobals_216 = v3;
}

- (void)unitTest_setLastObliterationDate:(id)a3
{
}

- (HKObjectType)objectType
{
  return 0;
}

void __62__HDDataAggregator__notifySensorDataObservers_device_options___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  id v5 = a2;
  id v6 = [v3 objectType];
  [v5 aggregator:v3 didCollectSensorData:v4 objectType:v6 device:a1[6]];
}

- (void)registerSensorDataObserver:(id)a3 queue:(id)a4
{
  p_lock = &self->_lock;
  id v7 = a4;
  id v11 = a3;
  os_unfair_lock_lock(p_lock);
  if (!self->_sensorDataObservers)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F2B2D0]);
    id v9 = (HKObserverSet *)[v8 initWithName:@"aggregation-sensor-data-observation" loggingCategory:*MEMORY[0x1E4F29F10]];
    sensorDataObservers = self->_sensorDataObservers;
    self->_sensorDataObservers = v9;
  }
  os_unfair_lock_unlock(p_lock);
  [(HKObserverSet *)self->_sensorDataObservers registerObserver:v11 queue:v7];
}

- (void)unregisterSensorDataObserver:(id)a3
{
}

- (void)recomputeCollectorConfiguration
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_t lock = &self->_configurationLock;
  os_unfair_lock_lock(&self->_configurationLock);
  [(HDDataAggregator *)self allCollectors];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [obj countByEnumeratingWithState:&v17 objects:v27 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v18;
    id v6 = (os_log_t *)MEMORY[0x1E4F29F10];
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v9 = [v8 collector];
        id v10 = [(HDDataAggregator *)self configurationForCollector:v9];

        _HKInitializeLogging();
        os_log_t v11 = *v6;
        if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
        {
          id v12 = v11;
          uint64_t v13 = [v8 collector];
          *(_DWORD *)buf = 138543874;
          id v22 = self;
          __int16 v23 = 2114;
          id v24 = v13;
          __int16 v25 = 2114;
          id v26 = v10;
          _os_log_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: wants collection for collector %{public}@ with configuration %{public}@", buf, 0x20u);
        }
        id v14 = [v8 collector];
        [v14 dataAggregator:self wantsCollectionWithConfiguration:v10];
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v17 objects:v27 count:16];
    }
    while (v4);
  }
  os_unfair_lock_unlock(lock);
}

- (id)configurationForCollector:(id)a3
{
  uint64_t v3 = [(HDDataAggregator *)self configuration];
  uint64_t v4 = +[HDDataCollectorConfiguration configurationWithType:1 aggregatorConfiguration:v3];

  return v4;
}

- (id)diagnosticDescription
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  uint64_t v4 = v3;
  unsigned __int8 v5 = atomic_load((unsigned __int8 *)&self->_hasStartedCollectors);
  if (v5) {
    id v6 = @"YES";
  }
  else {
    id v6 = @"NO";
  }
  [v3 appendFormat:@"hasStartedCollectors: %@\n", v6];
  os_unfair_lock_lock(&self->_lock);
  [v4 appendFormat:@"configuration: %@\n", self->_lock_configuration];
  [v4 appendString:@"dataCollectors:\n"];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = [(NSMapTable *)self->_lock_collectorRegistry keyEnumerator];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v13 = [(NSMapTable *)self->_lock_collectorRegistry objectForKey:v12];
        [v4 appendFormat:@"  %@: %@\n", v12, v13];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  os_unfair_lock_unlock(&self->_lock);

  return v4;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataCollectionManager);
  objc_storeStrong((id *)&self->_unitTest_lastObliterationDate, 0);
  objc_storeStrong((id *)&self->_sensorDataObservers, 0);
  objc_storeStrong((id *)&self->_lock_configuration, 0);

  objc_storeStrong((id *)&self->_lock_collectorRegistry, 0);
}

@end