@interface DCBGSTaskController
+ (id)sharedInstance;
- (BOOL)registerForTask:(id)a3;
- (BOOL)updateTaskWithIdentifier:(id)a3 withRefreshInterval:(double)a4;
- (NSMutableArray)tasks;
- (NSUserDefaults)defaultsSuite;
- (OS_dispatch_queue)expiryQueue;
- (id)fetchTaskForTaskIdentifier:(id)a3;
- (void)handleTask:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setDefaultsSuite:(id)a3;
- (void)setExpiryQueue:(id)a3;
- (void)setTasks:(id)a3;
@end

@implementation DCBGSTaskController

- (NSMutableArray)tasks
{
  tasks = self->_tasks;
  if (!tasks)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v5 = self->_tasks;
    self->_tasks = v4;

    tasks = self->_tasks;
  }

  return tasks;
}

- (NSUserDefaults)defaultsSuite
{
  defaultsSuite = self->_defaultsSuite;
  if (!defaultsSuite)
  {
    v4 = (NSUserDefaults *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.DeviceCheck"];
    v5 = self->_defaultsSuite;
    self->_defaultsSuite = v4;

    defaultsSuite = self->_defaultsSuite;
  }

  return defaultsSuite;
}

- (OS_dispatch_queue)expiryQueue
{
  expiryQueue = self->_expiryQueue;
  if (!expiryQueue)
  {
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.devicecheck.bgst.expiry", v4);
    v6 = self->_expiryQueue;
    self->_expiryQueue = v5;

    expiryQueue = self->_expiryQueue;
  }

  return expiryQueue;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__DCBGSTaskController_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v2 = (void *)sharedInstance_taskController;

  return v2;
}

uint64_t __37__DCBGSTaskController_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_taskController = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x270F9A758]();
}

- (BOOL)registerForTask:(id)a3
{
  id v4 = a3;
  v5 = [(DCBGSTaskController *)self tasks];
  [v5 addObject:v4];

  v6 = [MEMORY[0x263F29900] sharedScheduler];
  v7 = [v4 taskID];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __39__DCBGSTaskController_registerForTask___block_invoke;
  v13[3] = &unk_264BDC310;
  v13[4] = self;
  uint64_t v8 = [v6 registerForTaskWithIdentifier:v7 usingQueue:0 launchHandler:v13];

  v9 = [(DCBGSTaskController *)self defaultsSuite];
  v10 = [v4 observerID];
  [v9 addObserver:self forKeyPath:v10 options:1 context:0];

  v11 = _DCLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    [(DCBGSTaskController *)v4 registerForTask:v11];
  }

  return v8;
}

void __39__DCBGSTaskController_registerForTask___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _DCLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __39__DCBGSTaskController_registerForTask___block_invoke_cold_1(v3);
  }

  [*(id *)(a1 + 32) handleTask:v3];
}

- (id)fetchTaskForTaskIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = [(DCBGSTaskController *)self tasks];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = [v9 taskID];
        char v11 = [v4 isEqualToString:v10];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)updateTaskWithIdentifier:(id)a3 withRefreshInterval:(double)a4
{
  id v6 = a3;
  uint64_t v7 = [(DCBGSTaskController *)self tasks];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    unint64_t v9 = 0;
    while (1)
    {
      v10 = [(DCBGSTaskController *)self tasks];
      char v11 = [v10 objectAtIndexedSubscript:v9];

      v12 = [v11 taskID];
      int v13 = [v12 isEqualToString:v6];

      if (v13) {
        break;
      }

      ++v9;
      long long v14 = [(DCBGSTaskController *)self tasks];
      unint64_t v15 = [v14 count];

      if (v15 <= v9) {
        goto LABEL_5;
      }
    }
    v17 = _DCLogSystem();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG);
    if (a4 < 300.0)
    {
      if (v18) {
        -[DCBGSTaskController updateTaskWithIdentifier:withRefreshInterval:](v17, a4);
      }
      LOBYTE(self) = 0;
      goto LABEL_28;
    }
    if (v18) {
      -[DCBGSTaskController updateTaskWithIdentifier:withRefreshInterval:].cold.6(v11);
    }

    v19 = [MEMORY[0x263F29900] sharedScheduler];
    v20 = [v11 taskID];
    v17 = [v19 taskRequestForIdentifier:v20];

    if (!v17)
    {
      v24 = _DCLogSystem();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
        -[DCBGSTaskController updateTaskWithIdentifier:withRefreshInterval:](v11);
      }
      LOBYTE(self) = 0;
      goto LABEL_27;
    }
    [v17 setInterval:a4];
    v21 = [NSNumber numberWithDouble:a4];
    [v11 setRefreshInterval:v21];

    v22 = [MEMORY[0x263F29900] sharedScheduler];
    id v29 = 0;
    char v23 = [v22 updateTaskRequest:v17 error:&v29];
    v24 = v29;

    v25 = _DCLogSystem();
    BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG);
    if (v24)
    {
      if (v26) {
        -[DCBGSTaskController updateTaskWithIdentifier:withRefreshInterval:].cold.5(v24);
      }
    }
    else
    {
      if (v23)
      {
        if (v26) {
          -[DCBGSTaskController updateTaskWithIdentifier:withRefreshInterval:](v11);
        }

        v25 = [(DCBGSTaskController *)self tasks];
        [v25 replaceObjectAtIndex:v9 withObject:v11];
        LOBYTE(self) = 1;
        goto LABEL_26;
      }
      if (v26) {
        -[DCBGSTaskController updateTaskWithIdentifier:withRefreshInterval:].cold.4(v25);
      }
    }
    LOBYTE(self) = 0;
LABEL_26:

LABEL_27:
LABEL_28:

    char v16 = 1;
    goto LABEL_29;
  }
LABEL_5:
  char v16 = 0;
LABEL_29:
  char v27 = v16 & self;

  return v27;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7 = a3;
  uint64_t v8 = _DCAALogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[DCBGSTaskController observeValueForKeyPath:ofObject:change:context:]();
  }

  unint64_t v9 = [(DCBGSTaskController *)self tasks];
  uint64_t v10 = [v9 count];

  if (v10)
  {
    unint64_t v11 = 0;
    do
    {
      v12 = [(DCBGSTaskController *)self tasks];
      int v13 = [v12 objectAtIndexedSubscript:v11];
      long long v14 = [v13 observerID];
      int v15 = [v14 isEqualToString:v7];

      if (v15)
      {
        char v16 = [(DCBGSTaskController *)self tasks];
        v17 = [v16 objectAtIndexedSubscript:v11];

        BOOL v18 = [(DCBGSTaskController *)self defaultsSuite];
        uint64_t v19 = [v18 integerForKey:v7];

        v20 = [v17 taskID];
        [(DCBGSTaskController *)self updateTaskWithIdentifier:v20 withRefreshInterval:(double)v19];
      }
      ++v11;
      v21 = [(DCBGSTaskController *)self tasks];
      unint64_t v22 = [v21 count];
    }
    while (v22 > v11);
  }
}

- (void)handleTask:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  char v25 = 0;
  objc_initWeak(&location, v4);
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __34__DCBGSTaskController_handleTask___block_invoke;
  v21[3] = &unk_264BDC360;
  objc_copyWeak(&v22, &location);
  v21[4] = self;
  v21[5] = v24;
  [v4 setExpirationHandler:v21];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v5 = [(DCBGSTaskController *)self tasks];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v5);
        }
        unint64_t v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v10 = [v9 taskID];
        unint64_t v11 = [v4 identifier];
        BOOL v12 = v10 == v11;

        if (v12)
        {
          int v13 = _DCLogSystem();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            id v15 = [v9 taskID];
            uint64_t v16 = [v15 UTF8String];
            *(_DWORD *)buf = 136315138;
            uint64_t v27 = v16;
            _os_log_debug_impl(&dword_2330E6000, v13, OS_LOG_TYPE_DEBUG, "Invoking handler for task. { taskID=%s }", buf, 0xCu);
          }
          long long v14 = [v9 taskHandler];
          ((void (**)(void, id))v14)[2](v14, v4);
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v28 count:16];
    }
    while (v6);
  }

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
  _Block_object_dispose(v24, 8);
}

void __34__DCBGSTaskController_handleTask___block_invoke(uint64_t a1)
{
  v2 = _DCLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __34__DCBGSTaskController_handleTask___block_invoke_cold_1(a1);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  id v3 = [*(id *)(a1 + 32) expiryQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__DCBGSTaskController_handleTask___block_invoke_10;
  block[3] = &unk_264BDC338;
  objc_copyWeak(&v5, (id *)(a1 + 48));
  dispatch_async(v3, block);

  objc_destroyWeak(&v5);
}

void __34__DCBGSTaskController_handleTask___block_invoke_10(uint64_t a1)
{
  v2 = _DCLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __34__DCBGSTaskController_handleTask___block_invoke_10_cold_3(a1);
  }

  id v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v3);
  id v10 = 0;
  char v5 = [WeakRetained setTaskExpiredWithRetryAfter:&v10 error:300.0];
  id v6 = v10;

  if ((v5 & 1) == 0)
  {
    if (v6)
    {
      uint64_t v7 = _DCLogSystem();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        __34__DCBGSTaskController_handleTask___block_invoke_10_cold_2(v6);
      }
    }
    uint64_t v8 = _DCLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __34__DCBGSTaskController_handleTask___block_invoke_10_cold_1(v8);
    }

    id v9 = objc_loadWeakRetained(v3);
    [v9 setTaskCompleted];
  }
}

- (void)setTasks:(id)a3
{
}

- (void)setDefaultsSuite:(id)a3
{
}

- (void)setExpiryQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expiryQueue, 0);
  objc_storeStrong((id *)&self->_defaultsSuite, 0);

  objc_storeStrong((id *)&self->_tasks, 0);
}

- (void)registerForTask:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = [a1 taskID];
  [v4 UTF8String];
  OUTLINED_FUNCTION_3();
  __int16 v7 = 1024;
  int v8 = v5;
  _os_log_debug_impl(&dword_2330E6000, a3, OS_LOG_TYPE_DEBUG, "Registered task. { taskID=%s, success=%d }", v6, 0x12u);
}

void __39__DCBGSTaskController_registerForTask___block_invoke_cold_1(void *a1)
{
  v1 = [a1 identifier];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_2330E6000, v2, v3, "System task handler called. { task=%@ }", v4, v5, v6, v7, v8);
}

- (void)updateTaskWithIdentifier:(os_log_t)log withRefreshInterval:(double)a2 .cold.1(os_log_t log, double a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 134218240;
  double v3 = a2;
  __int16 v4 = 1024;
  int v5 = 300;
  _os_log_debug_impl(&dword_2330E6000, log, OS_LOG_TYPE_DEBUG, "Requested refresh interval must be greater than base refresh interval. { refreshInterval=%f, baseRefreshInterval=%d }", (uint8_t *)&v2, 0x12u);
}

- (void)updateTaskWithIdentifier:(void *)a1 withRefreshInterval:.cold.2(void *a1)
{
  id v1 = [a1 taskID];
  [v1 UTF8String];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_2330E6000, v2, v3, "Cannot update to refresh interval, failed to fetch task. { taskID=%s, refreshInterval=%f }", v4, v5, v6, v7, v8);
}

- (void)updateTaskWithIdentifier:(void *)a1 withRefreshInterval:.cold.3(void *a1)
{
  id v1 = [a1 taskID];
  [v1 UTF8String];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_2330E6000, v2, v3, "Updated task. { taskID=%s, refreshInterval=%f }", v4, v5, v6, v7, v8);
}

- (void)updateTaskWithIdentifier:(os_log_t)log withRefreshInterval:.cold.4(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_debug_impl(&dword_2330E6000, log, OS_LOG_TYPE_DEBUG, "Failed to update task.", v1, 2u);
}

- (void)updateTaskWithIdentifier:(void *)a1 withRefreshInterval:.cold.5(void *a1)
{
  id v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_2330E6000, v2, v3, "Failed to update task. { error=%@ }", v4, v5, v6, v7, v8);
}

- (void)updateTaskWithIdentifier:(void *)a1 withRefreshInterval:.cold.6(void *a1)
{
  id v1 = [a1 taskID];
  [v1 UTF8String];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_2330E6000, v2, v3, "Attempting to update task's refresh interval. { taskID=%s, refreshInterval=%f }", v4, v5, v6, v7, v8);
}

- (void)observeValueForKeyPath:ofObject:change:context:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_2330E6000, v0, OS_LOG_TYPE_DEBUG, "Key was changed. { key=%@ }", v1, 0xCu);
}

void __34__DCBGSTaskController_handleTask___block_invoke_cold_1(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v2 = [WeakRetained identifier];
  [v2 UTF8String];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_2330E6000, v3, v4, "Task expiration handler invoked. { taskID=%s }", v5, v6, v7, v8, v9);
}

void __34__DCBGSTaskController_handleTask___block_invoke_10_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 134217984;
  uint64_t v2 = 300;
  _os_log_debug_impl(&dword_2330E6000, log, OS_LOG_TYPE_DEBUG, "Failed to set task expired. { backOff=%lu }", (uint8_t *)&v1, 0xCu);
}

void __34__DCBGSTaskController_handleTask___block_invoke_10_cold_2(void *a1)
{
  int v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_0(&dword_2330E6000, v2, v3, "Failed to set task expired. { error=%@, backOff=%lu }", v4, v5, v6, v7, 2u);
}

void __34__DCBGSTaskController_handleTask___block_invoke_10_cold_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained identifier];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_2330E6000, v3, v4, "Task requested to exit, attempting to mark as expired. { task=%@ }", v5, v6, v7, v8, v9);
}

@end