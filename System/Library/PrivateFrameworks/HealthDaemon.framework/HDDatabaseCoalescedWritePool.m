@interface HDDatabaseCoalescedWritePool
- (HDCoalescedTaskPoolQuota)quota;
- (HDDatabaseCoalescedWritePool)init;
- (HDDatabaseCoalescedWritePool)initWithProfile:(id)a3 name:(id)a4 loggingCategory:(id)a5;
- (HDProfile)profile;
- (uint64_t)_performPendingWriteRecords:(void *)a3 transaction:(void *)a4 accessibilityError:(uint64_t)a5 error:;
- (uint64_t)_queue_performPendingWriteOperationsWithError:(uint64_t)a1;
- (void)flushPendingWriteQueueWithCompletion:(id)a3;
- (void)performWriteWithMaximumLatency:(double)a3 block:(id)a4 completion:(id)a5;
- (void)setQuota:(id)a3;
@end

@implementation HDDatabaseCoalescedWritePool

- (HDDatabaseCoalescedWritePool)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDDatabaseCoalescedWritePool)initWithProfile:(id)a3 name:(id)a4 loggingCategory:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v27.receiver = self;
  v27.super_class = (Class)HDDatabaseCoalescedWritePool;
  v11 = [(HDDatabaseCoalescedWritePool *)&v27 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_profile, v8);
    uint64_t v13 = [v9 copy];
    name = v12->_name;
    v12->_name = (NSString *)v13;

    objc_storeStrong((id *)&v12->_loggingCategory, a5);
    uint64_t v15 = HKCreateSerialDispatchQueue();
    writeQueue = v12->_writeQueue;
    v12->_writeQueue = (OS_dispatch_queue *)v15;

    v12->_lock._os_unfair_lock_opaque = 0;
    v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    pendingWriteQueue = v12->_pendingWriteQueue;
    v12->_pendingWriteQueue = v17;

    objc_initWeak(&location, v12);
    id v19 = objc_alloc(MEMORY[0x1E4F2B8C8]);
    v20 = v12->_writeQueue;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __69__HDDatabaseCoalescedWritePool_initWithProfile_name_loggingCategory___block_invoke;
    v24[3] = &unk_1E62F6BD0;
    objc_copyWeak(&v25, &location);
    uint64_t v21 = [v19 initWithMode:1 clock:0 queue:v20 delay:v24 block:0.0];
    pendingWriteOperation = v12->_pendingWriteOperation;
    v12->_pendingWriteOperation = (_HKDelayedOperation *)v21;

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }

  return v12;
}

void __69__HDDatabaseCoalescedWritePool_initWithProfile_name_loggingCategory___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v9 = 0;
    int v1 = -[HDDatabaseCoalescedWritePool _queue_performPendingWriteOperationsWithError:]((uint64_t)WeakRetained, &v9);
    id v2 = v9;
    _HKInitializeLogging();
    v3 = WeakRetained[2];
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);
    if (v1)
    {
      if (v4)
      {
        *(_DWORD *)buf = 138543362;
        v11 = WeakRetained;
        v5 = "%{public}@: Completed scheduled pending write operation.";
        v6 = v3;
        uint32_t v7 = 12;
LABEL_7:
        _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_INFO, v5, buf, v7);
      }
    }
    else if (v4)
    {
      *(_DWORD *)buf = 138543618;
      v11 = WeakRetained;
      __int16 v12 = 2114;
      id v13 = v2;
      v5 = "%{public}@: Scheduled pending write operation failed with error: %{public}@";
      v6 = v3;
      uint32_t v7 = 22;
      goto LABEL_7;
    }
  }
}

- (uint64_t)_queue_performPendingWriteOperationsWithError:(uint64_t)a1
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 32));
  id v4 = *(id *)(a1 + 48);
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v6 = *(void **)(a1 + 48);
  *(void *)(a1 + 48) = v5;

  if ([v4 count]) {
    [*(id *)(a1 + 64) consumeQuota];
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 32));
  if ([v4 count])
  {
    v38 = a2;
    uint32_t v7 = (NSObject **)MEMORY[0x1E4F29F10];
    os_signpost_id_t v8 = _HKLogSignpostIDGenerate();
    _HKInitializeLogging();
    id v9 = *v7;
    if (os_signpost_enabled(v9))
    {
      id v10 = v9;
      v11 = v10;
      if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v49 = [v4 count];
        _os_signpost_emit_with_name_impl(&dword_1BCB7D000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v8, "coalesced-write", "count=%ld", buf, 0xCu);
      }
    }
    __int16 v12 = +[HKDaemonTransaction transactionWithOwner:a1 activityName:*(void *)(a1 + 8)];
    double Current = CFAbsoluteTimeGetCurrent();
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    uint64_t v15 = [WeakRetained database];
    v16 = +[HDDatabaseTransactionContext contextForWritingProtectedData];
    id v47 = 0;
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __78__HDDatabaseCoalescedWritePool__queue_performPendingWriteOperationsWithError___block_invoke;
    v45[3] = &unk_1E62F2AE0;
    v45[4] = a1;
    id v46 = v4;
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __78__HDDatabaseCoalescedWritePool__queue_performPendingWriteOperationsWithError___block_invoke_2;
    v43[3] = &unk_1E62F6C20;
    v43[4] = a1;
    id v17 = v46;
    id v44 = v17;
    uint64_t v18 = [v15 performTransactionWithContext:v16 error:&v47 block:v45 inaccessibilityHandler:v43];
    id v19 = v47;

    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v20 = v17;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v39 objects:v54 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v40;
      do
      {
        uint64_t v24 = 0;
        do
        {
          if (*(void *)v40 != v23) {
            objc_enumerationMutation(v20);
          }
          uint64_t v25 = *(void *)(*((void *)&v39 + 1) + 8 * v24);
          if (v25) {
            uint64_t v26 = *(void *)(v25 + 16);
          }
          else {
            uint64_t v26 = 0;
          }
          (*(void (**)(uint64_t, uint64_t, id))(v26 + 16))(v26, v18, v19);
          ++v24;
        }
        while (v22 != v24);
        uint64_t v27 = [v20 countByEnumeratingWithState:&v39 objects:v54 count:16];
        uint64_t v22 = v27;
      }
      while (v27);
    }

    _HKInitializeLogging();
    v28 = (void *)*MEMORY[0x1E4F29F10];
    if (os_signpost_enabled((os_log_t)*MEMORY[0x1E4F29F10]))
    {
      v29 = v28;
      v30 = v29;
      if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1BCB7D000, v30, OS_SIGNPOST_INTERVAL_END, v8, "coalesced-write", "", buf, 2u);
      }
    }
    _HKInitializeLogging();
    v31 = *(NSObject **)(a1 + 16);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      v32 = v31;
      uint64_t v33 = [v20 count];
      CFAbsoluteTime v34 = CFAbsoluteTimeGetCurrent();
      *(_DWORD *)buf = 138543874;
      uint64_t v49 = a1;
      __int16 v50 = 2048;
      uint64_t v51 = v33;
      __int16 v52 = 2048;
      double v53 = v34 - Current;
      _os_log_impl(&dword_1BCB7D000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@: Completed %ld pending writes in %0.3lfs.", buf, 0x20u);
    }
    [v12 invalidate];
    id v35 = v19;
    v36 = v35;
    if (v35)
    {
      if (v38) {
        void *v38 = v35;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  else
  {
    uint64_t v18 = 1;
  }

  return v18;
}

- (void)performWriteWithMaximumLatency:(double)a3 block:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [_HDDatabasePendingWriteRecord alloc];
  id v11 = v9;
  id v12 = v8;
  if (v10)
  {
    v27.receiver = v10;
    v27.super_class = (Class)_HDDatabasePendingWriteRecord;
    id v10 = [(HDDatabaseCoalescedWritePool *)&v27 init];
    if (v10)
    {
      uint64_t v13 = [v11 copy];
      id writeBlock = v10->_writeBlock;
      v10->_id writeBlock = (id)v13;

      uint64_t v15 = [v12 copy];
      id completion = v10->_completion;
      v10->_id completion = (id)v15;
    }
  }

  quota = self->_quota;
  double v18 = a3;
  if (quota)
  {
    [(HDCoalescedTaskPoolQuota *)quota timeUntilNextAvailableTrigger];
    if (v19 >= a3) {
      double v18 = v19;
    }
    else {
      double v18 = a3;
    }
  }
  os_unfair_lock_lock(&self->_lock);
  [(NSMutableArray *)self->_pendingWriteQueue addObject:v10];
  os_unfair_lock_unlock(&self->_lock);
  id v20 = +[HKDaemonTransaction transactionWithOwner:self activityName:@"PendingWriteOperation"];
  writeQueue = self->_writeQueue;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __80__HDDatabaseCoalescedWritePool_performWriteWithMaximumLatency_block_completion___block_invoke;
  v23[3] = &unk_1E62F6BF8;
  double v25 = a3;
  double v26 = v18;
  v23[4] = self;
  id v24 = v20;
  id v22 = v20;
  dispatch_async(writeQueue, v23);
}

uint64_t __80__HDDatabaseCoalescedWritePool_performWriteWithMaximumLatency_block_completion___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 16);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 56);
    v6 = *(void **)(v2 + 64);
    uint32_t v7 = v3;
    [v6 timeUntilNextAvailableTrigger];
    int v10 = 138544130;
    uint64_t v11 = v2;
    __int16 v12 = 2048;
    uint64_t v13 = v4;
    __int16 v14 = 2048;
    uint64_t v15 = v5;
    __int16 v16 = 2048;
    uint64_t v17 = v8;
    _os_log_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@:Pending Write with requested latency=%0.3lfs, adjusted latency=%0.3lfs, quota=%0.3lfs", (uint8_t *)&v10, 0x2Au);

    uint64_t v2 = *(void *)(a1 + 32);
  }
  [*(id *)(v2 + 40) executeWithDelay:*(double *)(a1 + 56)];
  return [*(id *)(a1 + 40) invalidate];
}

- (void)flushPendingWriteQueueWithCompletion:(id)a3
{
  id v4 = a3;
  writeQueue = self->_writeQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__HDDatabaseCoalescedWritePool_flushPendingWriteQueueWithCompletion___block_invoke;
  v7[3] = &unk_1E62F4928;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(writeQueue, v7);
}

void __69__HDDatabaseCoalescedWritePool_flushPendingWriteQueueWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v4 = 0;
  -[HDDatabaseCoalescedWritePool _queue_performPendingWriteOperationsWithError:](v2, &v4);
  id v3 = v4;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (uint64_t)_performPendingWriteRecords:(void *)a3 transaction:(void *)a4 accessibilityError:(uint64_t)a5 error:
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  if (a1)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v12 = v9;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v23;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v23 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v22 + 1) + 8 * v16);
          if (v17) {
            uint64_t v18 = *(void *)(v17 + 8);
          }
          else {
            uint64_t v18 = 0;
          }
          if (!(*(unsigned int (**)(uint64_t, id, id, uint64_t))(v18 + 16))(v18, v10, v11, a5))
          {
            uint64_t v20 = 0;
            goto LABEL_16;
          }
          ++v16;
        }
        while (v14 != v16);
        uint64_t v19 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
        uint64_t v14 = v19;
      }
      while (v19);
    }
    uint64_t v20 = 1;
LABEL_16:
  }
  else
  {
    uint64_t v20 = 0;
  }

  return v20;
}

uint64_t __78__HDDatabaseCoalescedWritePool__queue_performPendingWriteOperationsWithError___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return -[HDDatabaseCoalescedWritePool _performPendingWriteRecords:transaction:accessibilityError:error:](*(void *)(a1 + 32), *(void **)(a1 + 40), a2, 0, a3);
}

uint64_t __78__HDDatabaseCoalescedWritePool__queue_performPendingWriteOperationsWithError___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  return -[HDDatabaseCoalescedWritePool _performPendingWriteRecords:transaction:accessibilityError:error:](*(void *)(a1 + 32), *(void **)(a1 + 40), 0, a2, a3);
}

- (HDProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);

  return (HDProfile *)WeakRetained;
}

- (HDCoalescedTaskPoolQuota)quota
{
  return self->_quota;
}

- (void)setQuota:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quota, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_pendingWriteQueue, 0);
  objc_storeStrong((id *)&self->_pendingWriteOperation, 0);
  objc_storeStrong((id *)&self->_writeQueue, 0);
  objc_storeStrong((id *)&self->_loggingCategory, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end