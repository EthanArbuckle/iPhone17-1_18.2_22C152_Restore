@interface HDObjectTypeAnchorQueryServer
+ (Class)queryClass;
- (BOOL)_shouldListenForUpdates;
- (BOOL)_shouldObserveAllSampleTypes;
- (HDObjectTypeAnchorQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (uint64_t)_queue_unconditionallyScheduleUpdate;
- (void)_queue_fetchAndDeliver;
- (void)_queue_scheduleUpdate;
- (void)_queue_start;
- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4;
- (void)didAddSamplesOfTypes:(id)a3 anchor:(id)a4;
- (void)samplesJournaled:(id)a3 type:(id)a4;
- (void)samplesOfTypesWereRemoved:(id)a3 anchor:(id)a4;
@end

@implementation HDObjectTypeAnchorQueryServer

- (HDObjectTypeAnchorQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HDObjectTypeAnchorQueryServer;
  v11 = [(HDQueryServer *)&v19 initWithUUID:a3 configuration:a4 client:v10 delegate:a6];
  v12 = v11;
  if (v11)
  {
    v11->_needsRequery = 1;
    v13 = [[HDCoalescedTaskPoolQuota alloc] initWithAvailableQuota:3 maximumQuota:3 refillInterval:1.0 minimumInterval:0.25 lastTrigger:0.0];
    quota = v12->_quota;
    v12->_quota = v13;

    v15 = [v10 profile];
    v16 = [v15 database];
    v17 = [(HDQueryServer *)v12 queryQueue];
    [v16 addProtectedDataObserver:v12 queue:v17];
  }
  return v12;
}

- (void)_queue_fetchAndDeliver
{
  if (a1)
  {
    *(unsigned char *)(a1 + 200) = 0;
    id v13 = 0;
    uint64_t v15 = 0;
    v16 = &v15;
    uint64_t v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__187;
    objc_super v19 = __Block_byref_object_dispose__187;
    id v20 = 0;
    v2 = [(id)a1 profile];
    v3 = [v2 database];
    v4 = +[HDDatabaseTransactionContext contextForReadingProtectedData];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __56__HDObjectTypeAnchorQueryServer__fetchAnchorsWithError___block_invoke;
    v14[3] = &unk_1E62F3DB0;
    v14[4] = a1;
    v14[5] = &v15;
    int v5 = [v3 performTransactionWithContext:v4 error:&v13 block:v14 inaccessibilityHandler:0];

    if (v5) {
      v6 = (void *)v16[5];
    }
    else {
      v6 = 0;
    }
    id v7 = v6;
    _Block_object_dispose(&v15, 8);

    id v8 = v13;
    v9 = v8;
    if (v7)
    {
      if ([v7 isEqual:*(void *)(a1 + 208)])
      {
LABEL_10:

        return;
      }
      objc_storeStrong((id *)(a1 + 208), v6);
      id v10 = [(id)a1 clientProxy];
      v11 = [(id)a1 queryUUID];
      objc_msgSend(v10, "client_deliverAnchor:query:", v7, v11);
    }
    else
    {
      id v12 = v8;
      id v10 = [(id)a1 clientProxy];
      v11 = [(id)a1 queryUUID];
      objc_msgSend(v10, "client_deliverError:forQuery:", v12, v11);
    }
    goto LABEL_10;
  }
}

- (uint64_t)_queue_unconditionallyScheduleUpdate
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    v1 = (void *)result;
    [*(id *)(result + 216) consumeQuota];
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    _HKInitializeLogging();
    v3 = *MEMORY[0x1E4F29F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v6 = v1;
      _os_log_impl(&dword_1BCB7D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Requesting database access for update.", buf, 0xCu);
    }
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __69__HDObjectTypeAnchorQueryServer__queue_unconditionallyScheduleUpdate__block_invoke;
    v4[3] = &unk_1E62F3198;
    v4[4] = v1;
    *(CFAbsoluteTime *)&v4[5] = Current;
    return [v1 scheduleDatabaseAccessOnQueueWithBlock:v4];
  }
  return result;
}

void __69__HDObjectTypeAnchorQueryServer__queue_unconditionallyScheduleUpdate__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x1E4F29F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    v4 = v2;
    CFAbsoluteTime v5 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 40);
    int v6 = 138543618;
    uint64_t v7 = v3;
    __int16 v8 = 2048;
    CFAbsoluteTime v9 = v5;
    _os_log_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Received database access after %0.3lfs.", (uint8_t *)&v6, 0x16u);
  }
  -[HDObjectTypeAnchorQueryServer _queue_fetchAndDeliver](*(void *)(a1 + 32));
}

- (void)_queue_scheduleUpdate
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a1 && !*(unsigned char *)(a1 + 200))
  {
    *(unsigned char *)(a1 + 200) = 1;
    [*(id *)(a1 + 216) timeUntilNextAvailableTrigger];
    if (v2 <= 0.0)
    {
      -[HDObjectTypeAnchorQueryServer _queue_unconditionallyScheduleUpdate](a1);
    }
    else
    {
      double v3 = v2;
      _HKInitializeLogging();
      v4 = *MEMORY[0x1E4F29F90];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        uint64_t v10 = a1;
        __int16 v11 = 2048;
        double v12 = v3;
        _os_log_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Scheduling update after %0.3lfs", buf, 0x16u);
      }
      objc_initWeak((id *)buf, (id)a1);
      dispatch_time_t v5 = dispatch_time(0, (uint64_t)(v3 * 1000000000.0));
      int v6 = [(id)a1 queryQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __54__HDObjectTypeAnchorQueryServer__queue_scheduleUpdate__block_invoke;
      block[3] = &unk_1E62F6BD0;
      objc_copyWeak(&v8, (id *)buf);
      dispatch_after(v5, v6, block);

      objc_destroyWeak(&v8);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __54__HDObjectTypeAnchorQueryServer__queue_scheduleUpdate__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[HDObjectTypeAnchorQueryServer _queue_unconditionallyScheduleUpdate]((uint64_t)WeakRetained);
}

uint64_t __56__HDObjectTypeAnchorQueryServer__fetchAnchorsWithError___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  dispatch_time_t v5 = *(void **)(a1 + 32);
  id v6 = a2;
  uint64_t v7 = [v5 profile];
  id v8 = [v7 syncIdentityManager];
  CFAbsoluteTime v9 = [v8 currentSyncIdentity];
  uint64_t v10 = [v9 identity];
  __int16 v11 = [v10 databaseIdentifier];

  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v13 = NSString;
  v14 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  objc_msgSend(v13, "stringWithFormat:", @"WITH RECURSIVE generate_series(value) AS (SELECT 0 UNION ALL SELECT value+1 FROM generate_series WHERE value<%ld) SELECT value, (SELECT MAX(%@) FROM %@ WHERE %@=value) as anchor FROM generate_series WHERE anchor IS NOT NULL;",
    317,
    @"data_id",
    v14,
  uint64_t v15 = @"data_type");

  v16 = [v6 protectedDatabase];

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __56__HDObjectTypeAnchorQueryServer__fetchAnchorsWithError___block_invoke_3;
  v23[3] = &unk_1E62F3D38;
  id v17 = v12;
  id v24 = v17;
  uint64_t v18 = [v16 executeSQL:v15 error:a3 bindingHandler:&__block_literal_global_221 enumerationHandler:v23];

  if (v18)
  {
    uint64_t v19 = [objc_alloc(MEMORY[0x1E4F2B938]) initWithAnchors:v17 databaseIdentifier:v11];
    uint64_t v20 = *(void *)(*(void *)(a1 + 40) + 8);
    v21 = *(void **)(v20 + 40);
    *(void *)(v20 + 40) = v19;
  }
  return v18;
}

uint64_t __56__HDObjectTypeAnchorQueryServer__fetchAnchorsWithError___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = HDSQLiteColumnAsInt64();
  dispatch_time_t v5 = MEMORY[0x1C1879F70](a2, 1);
  id v6 = [MEMORY[0x1E4F2B2C0] dataTypeWithCode:v4];
  if (v6) {
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v6];
  }

  return 1;
}

+ (Class)queryClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_shouldListenForUpdates
{
  return 1;
}

- (BOOL)_shouldObserveAllSampleTypes
{
  return 1;
}

- (void)_queue_start
{
  v3.receiver = self;
  v3.super_class = (Class)HDObjectTypeAnchorQueryServer;
  [(HDQueryServer *)&v3 _queue_start];
  -[HDObjectTypeAnchorQueryServer _queue_fetchAndDeliver]((uint64_t)self);
}

- (void)didAddSamplesOfTypes:(id)a3 anchor:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  id v6 = (void *)*MEMORY[0x1E4F29F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = v6;
    *(_DWORD *)buf = 138543618;
    uint64_t v10 = self;
    __int16 v11 = 2048;
    uint64_t v12 = [v5 count];
    _os_log_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Notified of updated samples (%ld types).", buf, 0x16u);
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__HDObjectTypeAnchorQueryServer_didAddSamplesOfTypes_anchor___block_invoke;
  v8[3] = &unk_1E62F3208;
  v8[4] = self;
  [(HDQueryServer *)self onQueue:v8];
}

void __61__HDObjectTypeAnchorQueryServer_didAddSamplesOfTypes_anchor___block_invoke(uint64_t a1)
{
}

- (void)samplesJournaled:(id)a3 type:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  _HKInitializeLogging();
  id v6 = *MEMORY[0x1E4F29F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    CFAbsoluteTime v9 = self;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Notified of samples journaled (%@).", buf, 0x16u);
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__HDObjectTypeAnchorQueryServer_samplesJournaled_type___block_invoke;
  v7[3] = &unk_1E62F3208;
  v7[4] = self;
  [(HDQueryServer *)self onQueue:v7];
}

void __55__HDObjectTypeAnchorQueryServer_samplesJournaled_type___block_invoke(uint64_t a1)
{
}

- (void)samplesOfTypesWereRemoved:(id)a3 anchor:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  id v6 = (void *)*MEMORY[0x1E4F29F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = v6;
    *(_DWORD *)buf = 138543618;
    __int16 v10 = self;
    __int16 v11 = 2048;
    uint64_t v12 = [v5 count];
    _os_log_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Notified of removed samples (%ld types).", buf, 0x16u);
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66__HDObjectTypeAnchorQueryServer_samplesOfTypesWereRemoved_anchor___block_invoke;
  v8[3] = &unk_1E62F3208;
  v8[4] = self;
  [(HDQueryServer *)self onQueue:v8];
}

void __66__HDObjectTypeAnchorQueryServer_samplesOfTypesWereRemoved_anchor___block_invoke(uint64_t a1)
{
}

- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(HDQueryServer *)self queryQueue];
  dispatch_assert_queue_V2(v6);

  if (v4 && self && self->_needsRequery)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __68__HDObjectTypeAnchorQueryServer__queue_protectedDataBecameAvailable__block_invoke;
    v7[3] = &unk_1E62F3208;
    v7[4] = self;
    [(HDQueryServer *)self scheduleDatabaseAccessOnQueueWithBlock:v7];
  }
}

void __68__HDObjectTypeAnchorQueryServer__queue_protectedDataBecameAvailable__block_invoke(uint64_t a1)
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quota, 0);

  objc_storeStrong((id *)&self->_anchor, 0);
}

@end