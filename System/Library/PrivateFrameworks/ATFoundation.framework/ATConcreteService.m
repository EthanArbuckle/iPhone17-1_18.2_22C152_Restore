@interface ATConcreteService
- (ATConcreteService)init;
- (BOOL)run;
- (BOOL)stop;
- (void)messageLinkWasClosed:(id)a3;
- (void)messageLinkWasInitialized:(id)a3;
- (void)messageLinkWasOpened:(id)a3;
@end

@implementation ATConcreteService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signalSource, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)messageLinkWasClosed:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_1D9BC7000, v5, OS_LOG_TYPE_DEFAULT, "message link %{public}@ was closed", (uint8_t *)&v6, 0xCu);
  }

  [(ATService *)self removeMessageLink:v4];
}

- (void)messageLinkWasOpened:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl(&dword_1D9BC7000, v4, OS_LOG_TYPE_DEFAULT, "message link %{public}@ was opened", (uint8_t *)&v5, 0xCu);
  }
}

- (void)messageLinkWasInitialized:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl(&dword_1D9BC7000, v4, OS_LOG_TYPE_DEFAULT, "message link %{public}@ was initialized", (uint8_t *)&v5, 0xCu);
  }
}

- (BOOL)stop
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v8 = self;
    _os_log_impl(&dword_1D9BC7000, v3, OS_LOG_TYPE_DEFAULT, "service %{public}@: stop", buf, 0xCu);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __25__ATConcreteService_stop__block_invoke;
  block[3] = &unk_1E6B8C468;
  block[4] = self;
  dispatch_sync(queue, block);
  return 1;
}

void __25__ATConcreteService_stop__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = objc_msgSend(*(id *)(a1 + 32), "messageLinks", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v6++) close];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  uint64_t v7 = [*(id *)(a1 + 32) messageLinks];
  [v7 removeAllObjects];
}

- (BOOL)run
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v22 = self;
    _os_log_impl(&dword_1D9BC7000, v3, OS_LOG_TYPE_DEFAULT, "service %{public}@: run", buf, 0xCu);
  }

  uint64_t v4 = dispatch_get_global_queue(0, 0);
  uint64_t v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14480], 0x1EuLL, 0, v4);
  signalSource = self->_signalSource;
  self->_signalSource = v5;

  dispatch_source_set_event_handler((dispatch_source_t)self->_signalSource, &__block_literal_global_1679);
  dispatch_resume((dispatch_object_t)self->_signalSource);
  BOOL v7 = 1;
  signal(30, (void (__cdecl *)(int))1);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v8 = [(ATService *)self messageLinks];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(ATConcreteService **)(*((void *)&v16 + 1) + 8 * i);
        if (([(ATConcreteService *)v13 open] & 1) == 0)
        {
          v14 = _ATLogCategoryFramework();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v22 = v13;
            _os_log_impl(&dword_1D9BC7000, v14, OS_LOG_TYPE_ERROR, "failed to open message link %{public}@", buf, 0xCu);
          }

          BOOL v7 = 0;
          goto LABEL_15;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v10) {
        continue;
      }
      break;
    }
    BOOL v7 = 1;
  }
LABEL_15:

  return v7;
}

void __24__ATConcreteService_run__block_invoke()
{
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:*MEMORY[0x1E4F4A250] object:0];
}

- (ATConcreteService)init
{
  v10.receiver = self;
  v10.super_class = (Class)ATConcreteService;
  v2 = [(ATService *)&v10 init];
  if (v2)
  {
    uint64_t v3 = (objc_class *)objc_opt_class();
    Name = class_getName(v3);
    dispatch_queue_t v5 = dispatch_queue_create(Name, 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    BOOL v7 = [MEMORY[0x1E4F28F80] processInfo];
    [v7 systemUptime];
    v2->_startTime = v8;
  }
  return v2;
}

@end