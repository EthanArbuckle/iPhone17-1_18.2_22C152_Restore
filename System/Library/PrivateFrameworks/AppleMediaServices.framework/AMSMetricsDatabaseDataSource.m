@interface AMSMetricsDatabaseDataSource
- (AMSMetricsDatabase)database;
- (AMSMetricsDatabaseDataSource)initWithContainerIdentifier:(id)a3;
- (BOOL)removeEvents:(id)a3 error:(id *)a4;
- (BOOL)skipEvents:(id)a3 error:(id *)a4;
- (BOOL)willStartBatchingWithLogKey:(id)a3 error:(id *)a4;
- (NSString)containerIdentifier;
- (NSString)currentLockKey;
- (OS_dispatch_queue)queue;
- (id)enqueueEvents:(id)a3;
- (int64_t)eventCount;
- (void)dealloc;
- (void)didFinishBatching;
- (void)enumerateSortedEventsForTopic:(id)a3 block:(id)a4;
- (void)removeAllEvents;
- (void)setCurrentLockKey:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation AMSMetricsDatabaseDataSource

- (id)enqueueEvents:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(AMSMutableBinaryPromise);
  v6 = [(AMSMetricsDatabaseDataSource *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __46__AMSMetricsDatabaseDataSource_enqueueEvents___block_invoke;
  v15[3] = &unk_1E55A22D0;
  id v16 = v4;
  v17 = self;
  v7 = v5;
  v18 = v7;
  v8 = v15;
  id v9 = v4;
  v10 = AMSLogKey();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __AMSDispatchAsync_block_invoke_4;
  block[3] = &unk_1E559EAE0;
  id v20 = v10;
  id v21 = v8;
  id v11 = v10;
  dispatch_async(v6, block);

  v12 = v18;
  v13 = v7;

  return v13;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

void __46__AMSMetricsDatabaseDataSource_enqueueEvents___block_invoke(id *a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (![a1[4] count]) {
    goto LABEL_8;
  }
  v2 = +[AMSMetricsMemoryDataSource batchesFromEvents:a1[4]];
  v3 = [a1[5] database];
  id v10 = 0;
  [v3 insertEvents:v2 error:&v10];
  id v4 = v10;

  if (v4)
  {
    v5 = +[AMSLogConfig sharedMetricsConfig];
    if (!v5)
    {
      v5 = +[AMSLogConfig sharedConfig];
    }
    v6 = [v5 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = objc_opt_class();
      v8 = AMSLogKey();
      id v9 = AMSLogableError(v4);
      *(_DWORD *)buf = 138543874;
      uint64_t v12 = v7;
      __int16 v13 = 2114;
      v14 = v8;
      __int16 v15 = 2114;
      id v16 = v9;
      _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to insert events. Error = %{public}@", buf, 0x20u);
    }
    [a1[6] finishWithError:v4];
  }
  else
  {
LABEL_8:
    [a1[6] finishWithSuccess];
  }
}

- (AMSMetricsDatabase)database
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = [(AMSMetricsDatabaseDataSource *)self queue];
  dispatch_assert_queue_V2(v3);

  database = self->_database;
  if (!database)
  {
    v5 = [(AMSMetricsDatabaseDataSource *)self containerIdentifier];
    v6 = +[AMSMetricsDatabase sharedDatabaseWithContainerId:v5];
    uint64_t v7 = self->_database;
    self->_database = v6;

    database = self->_database;
    if (!database)
    {
      v8 = +[AMSLogConfig sharedMetricsConfig];
      if (!v8)
      {
        v8 = +[AMSLogConfig sharedConfig];
      }
      id v9 = [v8 OSLogObject];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        uint64_t v10 = objc_opt_class();
        id v11 = AMSLogKey();
        int v13 = 138543618;
        uint64_t v14 = v10;
        __int16 v15 = 2114;
        id v16 = v11;
        _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to initialize metrics database", (uint8_t *)&v13, 0x16u);
      }
      database = self->_database;
    }
  }
  return database;
}

- (NSString)containerIdentifier
{
  return self->_containerIdentifier;
}

- (AMSMetricsDatabaseDataSource)initWithContainerIdentifier:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AMSMetricsDatabaseDataSource;
  v6 = [(AMSMetricsDatabaseDataSource *)&v11 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_containerIdentifier, a3);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.AMSMetricsDatabaseDataSource", 0);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v8;
  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_currentLockKey, 0);
  objc_storeStrong((id *)&self->_containerIdentifier, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)AMSMetricsDatabaseDataSource;
  [(AMSMetricsDatabaseDataSource *)&v2 dealloc];
}

- (int64_t)eventCount
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  v3 = [(AMSMetricsDatabaseDataSource *)self queue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __42__AMSMetricsDatabaseDataSource_eventCount__block_invoke;
  v10[3] = &unk_1E559F2A8;
  v10[4] = self;
  v10[5] = &v11;
  id v4 = v10;
  id v5 = v3;
  v6 = AMSLogKey();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __AMSDispatchSync_block_invoke_1;
  block[3] = &unk_1E559EAE0;
  id v16 = v6;
  id v17 = v4;
  id v7 = v6;
  dispatch_sync(v5, block);

  int64_t v8 = v12[3];
  _Block_object_dispose(&v11, 8);
  return v8;
}

void __42__AMSMetricsDatabaseDataSource_eventCount__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  objc_super v2 = [*(id *)(a1 + 32) database];
  id v10 = 0;
  uint64_t v3 = [v2 countAllEventsWithLockKey:0 error:&v10];
  id v4 = v10;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;

  if (v4)
  {
    id v5 = +[AMSLogConfig sharedMetricsConfig];
    if (!v5)
    {
      id v5 = +[AMSLogConfig sharedConfig];
    }
    v6 = [v5 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = objc_opt_class();
      int64_t v8 = AMSLogKey();
      id v9 = AMSLogableError(v4);
      *(_DWORD *)buf = 138543874;
      uint64_t v12 = v7;
      __int16 v13 = 2114;
      uint64_t v14 = v8;
      __int16 v15 = 2114;
      id v16 = v9;
      _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to count events. Error = %{public}@", buf, 0x20u);
    }
  }
}

- (void)removeAllEvents
{
  uint64_t v3 = [(AMSMetricsDatabaseDataSource *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__AMSMetricsDatabaseDataSource_removeAllEvents__block_invoke;
  v7[3] = &unk_1E559EA90;
  v7[4] = self;
  id v4 = v7;
  id v5 = AMSLogKey();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __AMSDispatchAsync_block_invoke_4;
  block[3] = &unk_1E559EAE0;
  id v9 = v5;
  id v10 = v4;
  id v6 = v5;
  dispatch_async(v3, block);
}

void __47__AMSMetricsDatabaseDataSource_removeAllEvents__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v1 = [*(id *)(a1 + 32) database];
  id v8 = 0;
  [v1 dropAllEventsWithLockKey:0 error:&v8];
  id v2 = v8;

  if (v2)
  {
    uint64_t v3 = +[AMSLogConfig sharedMetricsConfig];
    if (!v3)
    {
      uint64_t v3 = +[AMSLogConfig sharedConfig];
    }
    id v4 = [v3 OSLogObject];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = objc_opt_class();
      id v6 = AMSLogKey();
      uint64_t v7 = AMSLogableError(v2);
      *(_DWORD *)buf = 138543874;
      uint64_t v10 = v5;
      __int16 v11 = 2114;
      uint64_t v12 = v6;
      __int16 v13 = 2114;
      uint64_t v14 = v7;
      _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to drop events. Error = %{public}@", buf, 0x20u);
    }
  }
}

- (void)didFinishBatching
{
  uint64_t v3 = [(AMSMetricsDatabaseDataSource *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__AMSMetricsDatabaseDataSource_didFinishBatching__block_invoke;
  v7[3] = &unk_1E559EA90;
  v7[4] = self;
  id v4 = v7;
  uint64_t v5 = AMSLogKey();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __AMSDispatchAsync_block_invoke_4;
  block[3] = &unk_1E559EAE0;
  id v9 = v5;
  id v10 = v4;
  id v6 = v5;
  dispatch_async(v3, block);
}

uint64_t __49__AMSMetricsDatabaseDataSource_didFinishBatching__block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) currentLockKey];

  if (v2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) database];
    id v4 = [*(id *)(a1 + 32) currentLockKey];
    id v12 = 0;
    [v3 unlockAllEventsWithKey:v4 error:&v12];
    id v5 = v12;

    if (v5)
    {
      id v6 = +[AMSLogConfig sharedMetricsConfig];
      if (!v6)
      {
        id v6 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v7 = [v6 OSLogObject];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        id v8 = objc_opt_class();
        id v9 = v8;
        id v10 = AMSLogKey();
        *(_DWORD *)buf = 138543874;
        uint64_t v14 = v8;
        __int16 v15 = 2114;
        id v16 = v10;
        __int16 v17 = 2114;
        id v18 = v5;
        _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error unlocking event. Error = %{public}@", buf, 0x20u);
      }
    }
  }
  return [*(id *)(a1 + 32) setCurrentLockKey:0];
}

- (void)enumerateSortedEventsForTopic:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(AMSMetricsDatabaseDataSource *)self queue];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __68__AMSMetricsDatabaseDataSource_enumerateSortedEventsForTopic_block___block_invoke;
  v14[3] = &unk_1E55A0640;
  v14[4] = self;
  id v15 = v6;
  id v16 = v7;
  id v9 = v14;
  id v10 = v7;
  id v11 = v6;
  id v12 = AMSLogKey();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __AMSDispatchSync_block_invoke_1;
  block[3] = &unk_1E559EAE0;
  id v18 = v12;
  id v19 = v9;
  id v13 = v12;
  dispatch_sync(v8, block);
}

void __68__AMSMetricsDatabaseDataSource_enumerateSortedEventsForTopic_block___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) database];
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) currentLockKey];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __68__AMSMetricsDatabaseDataSource_enumerateSortedEventsForTopic_block___block_invoke_2;
  v5[3] = &unk_1E55A43A0;
  id v6 = *(id *)(a1 + 48);
  [v2 enumerateEventsWithTopic:v3 lockKey:v4 objectBlock:v5];
}

uint64_t __68__AMSMetricsDatabaseDataSource_enumerateSortedEventsForTopic_block___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)removeEvents:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__44;
  v22 = __Block_byref_object_dispose__44;
  id v23 = 0;
  id v7 = [(AMSMetricsDatabaseDataSource *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __51__AMSMetricsDatabaseDataSource_removeEvents_error___block_invoke;
  v15[3] = &unk_1E55A4328;
  void v15[4] = self;
  id v8 = v6;
  id v16 = v8;
  __int16 v17 = &v18;
  id v9 = v15;
  id v10 = v7;
  id v11 = AMSLogKey();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __AMSDispatchSync_block_invoke_1;
  block[3] = &unk_1E559EAE0;
  id v25 = v11;
  id v26 = v9;
  id v12 = v11;
  dispatch_sync(v10, block);

  id v13 = (void *)v19[5];
  if (a4 && v13) {
    *a4 = v13;
  }

  _Block_object_dispose(&v18, 8);
  return v13 == 0;
}

void __51__AMSMetricsDatabaseDataSource_removeEvents_error___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) database];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v4 + 40);
  [v2 dropEvents:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
}

- (BOOL)skipEvents:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__44;
  v22 = __Block_byref_object_dispose__44;
  id v23 = 0;
  id v7 = [(AMSMetricsDatabaseDataSource *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __49__AMSMetricsDatabaseDataSource_skipEvents_error___block_invoke;
  v15[3] = &unk_1E55A4328;
  void v15[4] = self;
  id v8 = v6;
  id v16 = v8;
  __int16 v17 = &v18;
  id v9 = v15;
  id v10 = v7;
  id v11 = AMSLogKey();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __AMSDispatchSync_block_invoke_1;
  block[3] = &unk_1E559EAE0;
  id v25 = v11;
  id v26 = v9;
  id v12 = v11;
  dispatch_sync(v10, block);

  id v13 = (void *)v19[5];
  if (a4 && v13) {
    *a4 = v13;
  }

  _Block_object_dispose(&v18, 8);
  return v13 == 0;
}

void __49__AMSMetricsDatabaseDataSource_skipEvents_error___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) database];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v4 + 40);
  [v2 unlockEvents:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
}

- (BOOL)willStartBatchingWithLogKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__44;
  id v19 = __Block_byref_object_dispose__44;
  id v20 = 0;
  id v7 = [(AMSMetricsDatabaseDataSource *)self queue];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __66__AMSMetricsDatabaseDataSource_willStartBatchingWithLogKey_error___block_invoke;
  v14[3] = &unk_1E55A30A0;
  v14[4] = self;
  void v14[5] = &v15;
  id v8 = v14;
  id v9 = v7;
  id v10 = AMSLogKey();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __AMSDispatchSync_block_invoke_1;
  block[3] = &unk_1E559EAE0;
  id v22 = v10;
  id v23 = v8;
  id v11 = v10;
  dispatch_sync(v9, block);

  id v12 = (void *)v16[5];
  if (a4 && v12) {
    *a4 = v12;
  }
  _Block_object_dispose(&v15, 8);

  return v12 == 0;
}

void __66__AMSMetricsDatabaseDataSource_willStartBatchingWithLogKey_error___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) database];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v3 + 40);
  uint64_t v4 = [v2 lockAllEventsWithError:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  [*(id *)(a1 + 32) setCurrentLockKey:v4];
}

- (NSString)currentLockKey
{
  return self->_currentLockKey;
}

- (void)setCurrentLockKey:(id)a3
{
}

- (void)setQueue:(id)a3
{
}

@end