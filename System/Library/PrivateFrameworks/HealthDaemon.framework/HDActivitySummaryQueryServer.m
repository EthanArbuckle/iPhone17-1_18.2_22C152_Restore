@interface HDActivitySummaryQueryServer
+ (Class)queryClass;
+ (id)requiredEntitlements;
- (HDActivitySummaryQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (void)_queue_deliverErrorToClient:(void *)a1;
- (void)_queue_deliverResultsWithActivitySummaries:(uint64_t)a3 isFinalBatch:(uint64_t)a4 clearPendingBatches:(void *)a5 error:;
- (void)_queue_start;
- (void)_queue_stop;
@end

@implementation HDActivitySummaryQueryServer

- (HDActivitySummaryQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HDActivitySummaryQueryServer;
  v11 = [(HDQueryServer *)&v17 initWithUUID:a3 configuration:v10 client:a5 delegate:a6];
  if (v11)
  {
    v11->_deliversUpdates = [v10 shouldDeactivateAfterInitialResults] ^ 1;
    v12 = [(HDQueryServer *)v11 filter];
    v13 = [(HDQueryServer *)v11 profile];
    uint64_t v14 = [v12 predicateWithProfile:v13];
    filterPredicate = v11->_filterPredicate;
    v11->_filterPredicate = (HDSQLitePredicate *)v14;
  }
  return v11;
}

+ (Class)queryClass
{
  return (Class)objc_opt_class();
}

+ (id)requiredEntitlements
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (void)_queue_start
{
  v15.receiver = self;
  v15.super_class = (Class)HDActivitySummaryQueryServer;
  [(HDQueryServer *)&v15 _queue_start];
  queryHelper = self->_queryHelper;
  if (queryHelper)
  {
    [(HDActivitySummaryQueryHelper *)queryHelper start];
  }
  else
  {
    dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
    objc_initWeak(&location, self);
    v5 = [HDActivitySummaryQueryHelper alloc];
    v6 = [(HDQueryServer *)self profile];
    v7 = [(HDQueryServer *)self filter];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __56__HDActivitySummaryQueryServer__setUpInitialQueryHelper__block_invoke;
    v20[3] = &unk_1E62F6158;
    objc_copyWeak(&v22, &location);
    v8 = v4;
    v21 = v8;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __56__HDActivitySummaryQueryServer__setUpInitialQueryHelper__block_invoke_2;
    v18[3] = &unk_1E62F6180;
    objc_copyWeak(&v19, &location);
    v9 = [(HDActivitySummaryQueryHelper *)v5 initWithProfile:v6 filter:v7 batchedInitialResultsHandler:v20 batchedUpdateHandler:v18];
    id v10 = self->_queryHelper;
    self->_queryHelper = v9;

    v17.receiver = self;
    v17.super_class = (Class)HDActivitySummaryQueryServer;
    v11 = [(HDQueryServer *)&v17 configuration];
    v16.receiver = self;
    v16.super_class = (Class)HDActivitySummaryQueryServer;
    v12 = [(HDQueryServer *)&v16 client];
    uint64_t v13 = [v12 hasEntitlement:*MEMORY[0x1E4F2A548]];

    if (v13)
    {
      uint64_t v14 = [v11 shouldIncludeActivitySummaryPrivateProperties];
      uint64_t v13 = [v11 shouldIncludeActivitySummaryStatistics];
    }
    else
    {
      uint64_t v14 = 0;
    }
    [(HDActivitySummaryQueryHelper *)self->_queryHelper setShouldIncludePrivateProperties:v14];
    [(HDActivitySummaryQueryHelper *)self->_queryHelper setShouldIncludeStatistics:v13];
    -[HDActivitySummaryQueryHelper setOrderByDateAscending:](self->_queryHelper, "setOrderByDateAscending:", [v11 orderByDateAscending]);
    -[HDActivitySummaryQueryHelper setLimit:](self->_queryHelper, "setLimit:", [v11 limit]);
    [(HDActivitySummaryQueryHelper *)self->_queryHelper start];
    dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
    [(HDQueryServer *)self setDataCount:[(HDActivitySummaryQueryHelper *)self->_queryHelper enumeratedSummaryCount]];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
}

- (void)_queue_stop
{
  v5.receiver = self;
  v5.super_class = (Class)HDActivitySummaryQueryServer;
  [(HDQueryServer *)&v5 _queue_stop];
  int64_t v3 = [(HDQueryServer *)self queryState];
  queryHelper = self->_queryHelper;
  if (v3 == 3) {
    [(HDActivitySummaryQueryHelper *)queryHelper pause];
  }
  else {
    [(HDActivitySummaryQueryHelper *)queryHelper stop];
  }
}

- (void)_queue_deliverResultsWithActivitySummaries:(uint64_t)a3 isFinalBatch:(uint64_t)a4 clearPendingBatches:(void *)a5 error:
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v18 = a2;
  id v9 = a5;
  id v10 = v9;
  if (a1)
  {
    if (v9)
    {
      -[HDActivitySummaryQueryServer _queue_deliverErrorToClient:](a1, v9);
      goto LABEL_14;
    }
    id v11 = v18;
    v12 = [MEMORY[0x1E4F2ABB8] activitySummaryType];
    id v19 = 0;
    uint64_t v13 = [a1 readAuthorizationStatusForType:v12 error:&v19];
    id v14 = v19;

    if (v13)
    {
      if (([v13 canRead] & 1) == 0)
      {
        if (a1[232])
        {
LABEL_13:

          goto LABEL_14;
        }

        id v11 = (id)MEMORY[0x1E4F1CBF0];
      }
      objc_super v15 = objc_msgSend(a1, "clientProxy", v18);
      objc_super v16 = [a1 queryUUID];
      objc_msgSend(v15, "client_deliverActivitySummaries:isFinalBatch:clearPendingBatches:queryUUID:", v11, a3, a4, v16);

      a1[232] = 1;
    }
    else
    {
      _HKInitializeLogging();
      objc_super v17 = *MEMORY[0x1E4F29EF8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v21 = v14;
        _os_log_error_impl(&dword_1BCB7D000, v17, OS_LOG_TYPE_ERROR, "Failed to retrieve authorization status for activity summary type: %{public}@", buf, 0xCu);
      }
      objc_super v15 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 5, @"Unable to determine authorization.", v18);
      -[HDActivitySummaryQueryServer _queue_deliverErrorToClient:](a1, v15);
    }

    goto LABEL_13;
  }
LABEL_14:
}

- (void)_queue_deliverErrorToClient:(void *)a1
{
  id v3 = a2;
  id v5 = [a1 clientProxy];
  dispatch_semaphore_t v4 = [a1 queryUUID];
  objc_msgSend(v5, "client_deliverError:forQuery:", v3, v4);
}

intptr_t __56__HDActivitySummaryQueryServer__setUpInitialQueryHelper__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v9 = (id *)(a1 + 40);
  id v10 = a5;
  id v11 = a2;
  WeakRetained = objc_loadWeakRetained(v9);
  -[HDActivitySummaryQueryServer _queue_deliverResultsWithActivitySummaries:isFinalBatch:clearPendingBatches:error:](WeakRetained, v11, a3, a4, v10);

  uint64_t v13 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v13);
}

void __56__HDActivitySummaryQueryServer__setUpInitialQueryHelper__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  v8 = (id *)(a1 + 32);
  id v9 = a5;
  id v10 = a2;
  WeakRetained = objc_loadWeakRetained(v8);
  -[HDActivitySummaryQueryServer _queue_deliverResultsWithActivitySummaries:isFinalBatch:clearPendingBatches:error:](WeakRetained, v10, a3, a4, v9);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryHelper, 0);

  objc_storeStrong((id *)&self->_filterPredicate, 0);
}

@end