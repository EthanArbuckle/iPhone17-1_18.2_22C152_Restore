@interface CALNInMemoryNotificationStorage
- (CALNInMemoryNotificationStorage)init;
- (NSMutableDictionary)recordMap;
- (OS_dispatch_queue)workQueue;
- (id)_notificationRecords;
- (id)notificationRecords;
- (void)_addNotificationRecord:(id)a3;
- (void)_removeNotificationRecordsPassingTest:(id)a3;
- (void)addNotificationRecord:(id)a3;
- (void)addNotificationRecords:(id)a3;
- (void)removeAllNotificationRecords;
- (void)removeNotificationRecordsPassingTest:(id)a3;
@end

@implementation CALNInMemoryNotificationStorage

- (CALNInMemoryNotificationStorage)init
{
  v11.receiver = self;
  v11.super_class = (Class)CALNInMemoryNotificationStorage;
  v2 = [(CALNInMemoryNotificationStorage *)&v11 init];
  if (v2)
  {
    objc_opt_class();
    CalGenerateQualifiedIdentifierWithClassAndSubdomain();
    id v3 = objc_claimAutoreleasedReturnValue();
    v4 = (const char *)[v3 UTF8String];

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create(v4, v5);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v6;

    uint64_t v8 = [MEMORY[0x263EFF9A0] dictionary];
    recordMap = v2->_recordMap;
    v2->_recordMap = (NSMutableDictionary *)v8;
  }
  return v2;
}

- (id)notificationRecords
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__1;
  objc_super v11 = __Block_byref_object_dispose__1;
  id v12 = 0;
  id v3 = [(CALNInMemoryNotificationStorage *)self workQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __54__CALNInMemoryNotificationStorage_notificationRecords__block_invoke;
  v6[3] = &unk_2645C0FA8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __54__CALNInMemoryNotificationStorage_notificationRecords__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _notificationRecords];
  return MEMORY[0x270F9A758]();
}

- (id)_notificationRecords
{
  id v3 = [(CALNInMemoryNotificationStorage *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(CALNInMemoryNotificationStorage *)self recordMap];
  v5 = [v4 allValues];

  return v5;
}

- (void)addNotificationRecord:(id)a3
{
  id v4 = a3;
  v5 = [(CALNInMemoryNotificationStorage *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__CALNInMemoryNotificationStorage_addNotificationRecord___block_invoke;
  v7[3] = &unk_2645C0DC0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

uint64_t __57__CALNInMemoryNotificationStorage_addNotificationRecord___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addNotificationRecord:*(void *)(a1 + 40)];
}

- (void)_addNotificationRecord:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(CALNInMemoryNotificationStorage *)self workQueue];
  dispatch_assert_queue_V2(v5);

  if ([v4 hasAlertContent])
  {
    if ([v4 shouldPresentAlert])
    {
      id v6 = [CALNNotificationIdentifier alloc];
      uint64_t v7 = [v4 sourceIdentifier];
      id v8 = [v4 sourceClientIdentifier];
      uint64_t v9 = [(CALNNotificationIdentifier *)v6 initWithSourceIdentifier:v7 sourceClientIdentifier:v8];

      if (v9)
      {
        v10 = [(CALNInMemoryNotificationStorage *)self recordMap];
        [v10 setObject:v4 forKeyedSubscript:v9];

        objc_super v11 = +[CALNLogSubsystem defaultCategory];
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          id v12 = [v4 sourceIdentifier];
          v13 = [v4 sourceClientIdentifier];
          int v16 = 138543618;
          v17 = v12;
          __int16 v18 = 2114;
          v19 = v13;
          v14 = "Added record, source identifier = %{public}@, source client identifier = %{public}@";
LABEL_13:
          _os_log_impl(&dword_2216BB000, v11, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v16, 0x16u);

          goto LABEL_14;
        }
      }
      else
      {
        objc_super v11 = +[CALNLogSubsystem defaultCategory];
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          id v12 = [v4 sourceIdentifier];
          v13 = [v4 sourceClientIdentifier];
          int v16 = 138543618;
          v17 = v12;
          __int16 v18 = 2114;
          v19 = v13;
          v14 = "Cannot add record because notification identifier could not be created with record's source identifier a"
                "nd record's source client identifier. Record source identifier: %{public}@. Record source client identif"
                "ier: %{public}@.";
          goto LABEL_13;
        }
      }
LABEL_15:

      goto LABEL_16;
    }
    uint64_t v9 = +[CALNLogSubsystem defaultCategory];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v11 = [v4 sourceIdentifier];
      id v12 = [v4 sourceClientIdentifier];
      int v16 = 138543618;
      v17 = v11;
      __int16 v18 = 2114;
      v19 = v12;
      v15 = "Cannot add record that should not be presented, source identifier = %{public}@, source client identifier = %{public}@";
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v9 = +[CALNLogSubsystem defaultCategory];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v11 = [v4 sourceIdentifier];
      id v12 = [v4 sourceClientIdentifier];
      int v16 = 138543618;
      v17 = v11;
      __int16 v18 = 2114;
      v19 = v12;
      v15 = "Cannot add record without alert content, source identifier = %{public}@, source client identifier = %{public}@";
LABEL_10:
      _os_log_impl(&dword_2216BB000, v9, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v16, 0x16u);
LABEL_14:

      goto LABEL_15;
    }
  }
LABEL_16:
}

- (void)addNotificationRecords:(id)a3
{
  id v4 = a3;
  v5 = [(CALNInMemoryNotificationStorage *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__CALNInMemoryNotificationStorage_addNotificationRecords___block_invoke;
  v7[3] = &unk_2645C0DC0;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __58__CALNInMemoryNotificationStorage_addNotificationRecords___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(a1 + 40), "_addNotificationRecord:", *(void *)(*((void *)&v7 + 1) + 8 * v6++), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)removeNotificationRecordsPassingTest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CALNInMemoryNotificationStorage *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __72__CALNInMemoryNotificationStorage_removeNotificationRecordsPassingTest___block_invoke;
  v7[3] = &unk_2645C0FD0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

uint64_t __72__CALNInMemoryNotificationStorage_removeNotificationRecordsPassingTest___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeNotificationRecordsPassingTest:*(void *)(a1 + 40)];
}

- (void)_removeNotificationRecordsPassingTest:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = (unsigned int (**)(id, void *))a3;
  uint64_t v5 = [(CALNInMemoryNotificationStorage *)self workQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v20 = self;
  id v6 = [(CALNInMemoryNotificationStorage *)self recordMap];
  long long v7 = [v6 allValues];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if (v4[2](v4, v13))
        {
          v14 = [CALNNotificationIdentifier alloc];
          v15 = [v13 sourceIdentifier];
          int v16 = [v13 sourceClientIdentifier];
          v17 = [(CALNNotificationIdentifier *)v14 initWithSourceIdentifier:v15 sourceClientIdentifier:v16];

          if (v17)
          {
            __int16 v18 = [(CALNInMemoryNotificationStorage *)v20 recordMap];
            [v18 setObject:0 forKeyedSubscript:v17];

            v19 = +[CALNLogSubsystem calendar];
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543362;
              v26 = v17;
              _os_log_debug_impl(&dword_2216BB000, v19, OS_LOG_TYPE_DEBUG, "Removed notification record with identifier = %{public}@", buf, 0xCu);
            }
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v27 count:16];
    }
    while (v10);
  }
}

- (void)removeAllNotificationRecords
{
  uint64_t v3 = [(CALNInMemoryNotificationStorage *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__CALNInMemoryNotificationStorage_removeAllNotificationRecords__block_invoke;
  block[3] = &unk_2645C0D98;
  block[4] = self;
  dispatch_sync(v3, block);
}

uint64_t __63__CALNInMemoryNotificationStorage_removeAllNotificationRecords__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeNotificationRecordsPassingTest:&__block_literal_global_11];
}

uint64_t __63__CALNInMemoryNotificationStorage_removeAllNotificationRecords__block_invoke_2()
{
  return 1;
}

- (NSMutableDictionary)recordMap
{
  return self->_recordMap;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_recordMap, 0);
}

@end