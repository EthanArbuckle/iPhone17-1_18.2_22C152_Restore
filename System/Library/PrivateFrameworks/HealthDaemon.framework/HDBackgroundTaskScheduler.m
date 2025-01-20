@interface HDBackgroundTaskScheduler
- (HDBackgroundTaskScheduler)init;
- (id)taskWithName:(id)a3 forClientNamed:(id)a4;
- (void)_queue_removeTaskWithName:(void *)a3 forClientNamed:;
- (void)addTask:(id)a3 withName:(id)a4 forClientNamed:(id)a5;
- (void)registerClientWithName:(id)a3 taskHandler:(id)a4;
- (void)removeTaskWithName:(id)a3 forClientNamed:(id)a4;
- (void)unregisterClientWithName:(id)a3;
@end

@implementation HDBackgroundTaskScheduler

- (id)taskWithName:(id)a3 forClientNamed:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__41;
  v21 = __Block_byref_object_dispose__41;
  id v22 = 0;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __57__HDBackgroundTaskScheduler_taskWithName_forClientNamed___block_invoke;
  v13[3] = &unk_1E62F90E0;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  v16 = &v17;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, v13);
  id v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);

  return v11;
}

void __57__HDBackgroundTaskScheduler_taskWithName_forClientNamed___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(a1 + 48);
  id v4 = *(id *)(a1 + 40);
  id v5 = v3;
  if (v2)
  {
    id v6 = [*(id *)(v2 + 8) objectForKey:v5];

    if (!v6)
    {
      id v11 = [MEMORY[0x1E4F28B00] currentHandler];
      v12 = [NSString stringWithUTF8String:"-[HDBackgroundTaskScheduler _queue_taskWithName:forClientNamed:]"];
      [v11 handleFailureInFunction:v12, @"HDBackgroundTaskScheduler.m", 306, @"Attempt to get persistent task for unregistered client %@.", v5 file lineNumber description];
    }
    _JobNameFromClientAndTaskNames(v5, v4);
    id v7 = (void *)BackgroundTaskAgentCopyJob();
    if (v7) {
      v8 = -[HDBackgroundTask _initWithJob:]([HDBackgroundTask alloc], v7);
    }
    else {
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }

  uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

- (void)addTask:(id)a3 withName:(id)a4 forClientNamed:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"HDBackgroundTaskScheduler.m", 241, @"Invalid parameter not satisfying: %@", @"task != nil" object file lineNumber description];
  }
  v12 = [v9 endDate];

  if (!v12)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"HDBackgroundTaskScheduler.m", 242, @"Invalid parameter not satisfying: %@", @"task.endDate != nil" object file lineNumber description];
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__HDBackgroundTaskScheduler_addTask_withName_forClientNamed___block_invoke;
  block[3] = &unk_1E62F6A40;
  block[4] = self;
  id v20 = v9;
  id v21 = v10;
  id v22 = v11;
  id v14 = v11;
  id v15 = v10;
  id v16 = v9;
  dispatch_async(queue, block);
}

void __61__HDBackgroundTaskScheduler_addTask_withName_forClientNamed___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  v3 = *(void **)(a1 + 56);
  id v11 = *(id *)(a1 + 48);
  id v4 = v3;
  if (v2)
  {
    id v5 = *(void **)(v2 + 8);
    id v6 = v1;
    id v7 = [v5 objectForKey:v4];

    if (!v7)
    {
      id v9 = [MEMORY[0x1E4F28B00] currentHandler];
      id v10 = [NSString stringWithUTF8String:"-[HDBackgroundTaskScheduler _queue_addTask:withName:forClientNamed:]"];
      [v9 handleFailureInFunction:v10, @"HDBackgroundTaskScheduler.m", 284, @"Attempt to add persistent task for unregistered client %@.", v4 file lineNumber description];
    }
    _JobNameFromClientAndTaskNames(v4, v11);
    if (v6) {
      id v8 = v6[1];
    }
    else {
      id v8 = 0;
    }

    BackgroundTaskAgentAddJob();
  }
}

- (void)removeTaskWithName:(id)a3 forClientNamed:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__HDBackgroundTaskScheduler_removeTaskWithName_forClientNamed___block_invoke;
  block[3] = &unk_1E62F30F8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __63__HDBackgroundTaskScheduler_removeTaskWithName_forClientNamed___block_invoke(uint64_t a1)
{
}

- (void)_queue_removeTaskWithName:(void *)a3 forClientNamed:
{
  id v9 = a2;
  id v5 = a3;
  if (a1)
  {
    id v6 = [*(id *)(a1 + 8) objectForKey:v5];

    if (!v6)
    {
      id v7 = [MEMORY[0x1E4F28B00] currentHandler];
      id v8 = [NSString stringWithUTF8String:"-[HDBackgroundTaskScheduler _queue_removeTaskWithName:forClientNamed:]"];
      [v7 handleFailureInFunction:v8, @"HDBackgroundTaskScheduler.m", 295, @"Attempt to remove persistent task for unregistered client %@.", v5 file lineNumber description];
    }
    _JobNameFromClientAndTaskNames(v5, v9);
    BackgroundTaskAgentRemoveJob();
  }
}

void __33__HDBackgroundTaskScheduler_init__block_invoke(uint64_t a1, NSObject *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v3 = *(id **)(a1 + 32);
  if (v3)
  {
    id v5 = a3;
    id v6 = -[HDBackgroundTask _initWithJob:]([HDBackgroundTask alloc], v5);

    if (!v6)
    {
      _HKInitializeLogging();
      id v11 = HKLogInfrastructure();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446210;
        id v22 = a2;
        _os_log_error_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_ERROR, "Unable to create HDBackgroundTask from job %{public}s", buf, 0xCu);
      }
      goto LABEL_27;
    }
    id v20 = 0;
    id v7 = [NSString stringWithUTF8String:a2];
    id v8 = [MEMORY[0x1E4F28FE8] scannerWithString:v7];
    [v8 setCharactersToBeSkipped:0];
    if ([v8 scanUpToString:@"###" intoString:&v20]
      && [v8 scanString:@"###" intoString:0]
      && ([v8 isAtEnd] & 1) == 0)
    {
      objc_msgSend(v7, "substringFromIndex:", objc_msgSend(v8, "scanLocation"));
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      char v10 = 1;
    }
    else
    {
      id v9 = 0;
      char v10 = 0;
    }

    id v11 = v20;
    id v12 = v9;
    if (v10)
    {
      if ([v6 taskValid])
      {
        if (([v6 taskSatisfied] & 1) == 0)
        {
          _HKInitializeLogging();
          id v13 = HKLogInfrastructure();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543874;
            id v22 = v11;
            __int16 v23 = 2114;
            id v24 = v12;
            __int16 v25 = 2114;
            v26 = v6;
            _os_log_error_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_ERROR, "Task not satisfied, but delivering anyway. Client: %{public}@, Task: %{public}@ %{public}@", buf, 0x20u);
          }
        }
        uint64_t v14 = [v3[1] objectForKeyedSubscript:v11];
        if (v14)
        {
          id v15 = v14;
          -[HDBackgroundTaskScheduler _queue_removeTaskWithName:forClientNamed:]((uint64_t)v3, v12, v11);
          -[HDBackgroundTaskClient deliverTask:taskName:onQueue:]((uint64_t)v15, v6, v12, v3[4]);
        }
        else
        {
          id v19 = [v3[2] objectForKey:v11];
          if (!v19)
          {
            id v19 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
            [v3[2] setObject:v19 forKey:v11];
          }
          [v19 setObject:v6 forKey:v12];

          id v15 = 0;
        }
        goto LABEL_26;
      }
      _HKInitializeLogging();
      id v15 = HKLogInfrastructure();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        id v22 = v11;
        __int16 v23 = 2114;
        id v24 = v12;
        __int16 v25 = 2114;
        v26 = v6;
        id v16 = "Invalid task; not delivering. Please file a Radar on PEP HealthKit. Client: %{public}@, Task: %{public}@ %{public}@";
        uint64_t v17 = v15;
        uint32_t v18 = 32;
        goto LABEL_21;
      }
    }
    else
    {
      _HKInitializeLogging();
      id v15 = HKLogInfrastructure();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446210;
        id v22 = a2;
        id v16 = "Unable to retrieve client and task names from job name %{public}s";
        uint64_t v17 = v15;
        uint32_t v18 = 12;
LABEL_21:
        _os_log_error_impl(&dword_1BCB7D000, v17, OS_LOG_TYPE_ERROR, v16, buf, v18);
      }
    }
LABEL_26:

LABEL_27:
  }
}

- (void)registerClientWithName:(id)a3 taskHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 rangeOfString:@"###"];
  if (v8)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    id v13 = [NSString stringWithUTF8String:"void _ValidateClientName(NSString *__strong)"];
    [v12 handleFailureInFunction:v13, @"HDBackgroundTaskScheduler.m", 368, @"HDBackgroundTaskAgent client name cannot contain the string '%@'", @"###" file lineNumber description];
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__HDBackgroundTaskScheduler_registerClientWithName_taskHandler___block_invoke;
  block[3] = &unk_1E62F4E40;
  block[4] = self;
  id v15 = v6;
  id v16 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(queue, block);
}

void __64__HDBackgroundTaskScheduler_registerClientWithName_taskHandler___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v1 = *(id **)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 48);
  id v3 = *(id *)(a1 + 40);
  id v4 = v2;
  if (v1)
  {
    id v5 = [HDBackgroundTaskClient alloc];
    id v6 = v4;
    id v17 = v4;
    if (v5)
    {
      v22.receiver = v5;
      v22.super_class = (Class)HDBackgroundTaskClient;
      id v5 = (HDBackgroundTaskClient *)objc_msgSendSuper2(&v22, sel_init);
      if (v5)
      {
        uint64_t v7 = [v6 copy];
        id taskHandler = v5->_taskHandler;
        v5->_id taskHandler = (id)v7;
      }
    }

    [v1[1] setObject:v5 forKeyedSubscript:v3];
    id v9 = [v1[2] objectForKey:v3];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v10 = [v9 allKeys];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:&v22 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          id v16 = [v9 objectForKey:v15];
          -[HDBackgroundTaskClient deliverTask:taskName:onQueue:]((uint64_t)v5, v16, v15, v1[4]);
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:&v22 count:16];
      }
      while (v12);
    }

    [v1[2] removeObjectForKey:v3];
    id v4 = v17;
  }
}

- (HDBackgroundTaskScheduler)init
{
  v13.receiver = self;
  v13.super_class = (Class)HDBackgroundTaskScheduler;
  uint64_t v2 = [(HDBackgroundTaskScheduler *)&v13 init];
  if (v2)
  {
    id v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    clients = v2->_clients;
    v2->_clients = v3;

    id v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    tasksQueuedForDelivery = v2->_tasksQueuedForDelivery;
    v2->_tasksQueuedForDelivery = v5;

    uint64_t v7 = HKCreateSerialDispatchQueue();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    uint64_t v9 = HKCreateSerialDispatchQueue();
    clientQueue = v2->_clientQueue;
    v2->_clientQueue = (OS_dispatch_queue *)v9;

    uint64_t v12 = v2;
    BackgroundTaskAgentInit();
  }
  return v2;
}

- (void)unregisterClientWithName:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__HDBackgroundTaskScheduler_unregisterClientWithName___block_invoke;
  v7[3] = &unk_1E62F31C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __54__HDBackgroundTaskScheduler_unregisterClientWithName___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) removeObjectForKey:*(void *)(a1 + 40)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_tasksQueuedForDelivery, 0);

  objc_storeStrong((id *)&self->_clients, 0);
}

@end