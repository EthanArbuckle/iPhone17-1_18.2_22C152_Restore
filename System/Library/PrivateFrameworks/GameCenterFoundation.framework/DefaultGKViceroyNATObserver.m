@interface DefaultGKViceroyNATObserver
+ (id)syncQueue;
- (BOOL)isValidSettings:(id)a3;
- (DefaultGKViceroyNATObserver)init;
- (GKNATObserver)natObserver;
- (OS_dispatch_semaphore)natSemaphore;
- (int)natType;
- (void)NATTypeDidChange:(int)a3;
- (void)_getNATTypeWithNATSettings:(id)a3 completionHandler:(id)a4;
- (void)dealloc;
- (void)getNATTypeWithNATSettings:(id)a3 completionHandler:(id)a4;
- (void)performAsync:(id)a3;
- (void)setNatObserver:(id)a3;
- (void)setNatSemaphore:(id)a3;
- (void)setNatType:(int)a3;
- (void)teardown;
@end

@implementation DefaultGKViceroyNATObserver

- (DefaultGKViceroyNATObserver)init
{
  v8.receiver = self;
  v8.super_class = (Class)DefaultGKViceroyNATObserver;
  v2 = [(DefaultGKViceroyNATObserver *)&v8 init];
  if (v2)
  {
    dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
    natSemaphore = v2->_natSemaphore;
    v2->_natSemaphore = (OS_dispatch_semaphore *)v3;

    v2->_natType = 0;
    v5 = (GKNATObserver *)objc_alloc_init(MEMORY[0x1E4F63B40]);
    natObserver = v2->_natObserver;
    v2->_natObserver = v5;
  }
  return v2;
}

- (void)dealloc
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8(&dword_1C2D22000, v0, v1, "[GKViceroyNATObserver] Deallocating.", v2, v3, v4, v5, v6);
}

+ (id)syncQueue
{
  if (syncQueue_onceToken != -1) {
    dispatch_once(&syncQueue_onceToken, &__block_literal_global_41);
  }
  uint64_t v2 = (void *)syncQueue_sSyncQueue;

  return v2;
}

uint64_t __40__DefaultGKViceroyNATObserver_syncQueue__block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.GameKit.GKViceroyNATObserver.sync", 0);
  uint64_t v1 = syncQueue_sSyncQueue;
  syncQueue_sSyncQueue = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (void)performAsync:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [(id)objc_opt_class() syncQueue];
  dispatch_async(v4, v3);
}

- (void)getNATTypeWithNATSettings:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __75__DefaultGKViceroyNATObserver_getNATTypeWithNATSettings_completionHandler___block_invoke;
  v10[3] = &unk_1E646EA20;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(DefaultGKViceroyNATObserver *)self performAsync:v10];
}

uint64_t __75__DefaultGKViceroyNATObserver_getNATTypeWithNATSettings_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _getNATTypeWithNATSettings:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (BOOL)isValidSettings:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v4 = +[GKViceroyNATConfiguration settingsKeys];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v10 = [v3 objectForKey:v9];

        if (!v10)
        {
          if (!os_log_GKGeneral) {
            id v12 = GKOSLoggers();
          }
          v13 = os_log_GKMatch;
          if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR)) {
            -[DefaultGKViceroyNATObserver isValidSettings:](v9, v13);
          }
          BOOL v11 = 0;
          goto LABEL_15;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 1;
LABEL_15:

  return v11;
}

- (void)_getNATTypeWithNATSettings:(id)a3 completionHandler:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void))a4;
  if ([(DefaultGKViceroyNATObserver *)self natType])
  {
LABEL_2:
    v7[2](v7, [(DefaultGKViceroyNATObserver *)self natType]);
    goto LABEL_20;
  }
  if (v6 && [(DefaultGKViceroyNATObserver *)self isValidSettings:v6])
  {
    if (!os_log_GKGeneral) {
      id v8 = GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG)) {
      -[DefaultGKViceroyNATObserver _getNATTypeWithNATSettings:completionHandler:]();
    }
    +[GKViceroyNATConfiguration applySettings:v6];
    uint64_t v9 = [(DefaultGKViceroyNATObserver *)self natObserver];
    [v9 setDelegate:self];

    natSemaphore = self->_natSemaphore;
    dispatch_time_t v11 = dispatch_time(0, 3000000000);
    if (!dispatch_semaphore_wait(natSemaphore, v11))
    {
      if (!os_log_GKGeneral) {
        id v14 = GKOSLoggers();
      }
      long long v15 = (void *)os_log_GKMatch;
      if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
      {
        long long v16 = NSNumber;
        long long v17 = v15;
        long long v18 = objc_msgSend(v16, "numberWithUnsignedInt:", -[DefaultGKViceroyNATObserver natType](self, "natType"));
        int v19 = 138412290;
        uint64_t v20 = v18;
        _os_log_impl(&dword_1C2D22000, v17, OS_LOG_TYPE_INFO, "[GKViceroyNATObserver] Done waiting for valid NAT type: %@", (uint8_t *)&v19, 0xCu);
      }
      goto LABEL_2;
    }
    if (!os_log_GKGeneral) {
      id v12 = GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR)) {
      -[DefaultGKViceroyNATObserver _getNATTypeWithNATSettings:completionHandler:]();
    }
    v7[2](v7, 0);
    [(DefaultGKViceroyNATObserver *)self teardown];
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v13 = GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR)) {
      -[DefaultGKViceroyNATObserver _getNATTypeWithNATSettings:completionHandler:]();
    }
    v7[2](v7, 0);
  }
LABEL_20:
}

- (void)teardown
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8(&dword_1C2D22000, v0, v1, "[GKViceroyNATObserver] Tearing down.", v2, v3, v4, v5, v6);
}

- (void)NATTypeDidChange:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!os_log_GKGeneral) {
    id v5 = GKOSLoggers();
  }
  uint8_t v6 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    v13[0] = 67109120;
    v13[1] = v3;
    _os_log_impl(&dword_1C2D22000, v6, OS_LOG_TYPE_INFO, "[GKViceroyNATObserver] Received NAT type %d", (uint8_t *)v13, 8u);
  }
  uint64_t v7 = [(DefaultGKViceroyNATObserver *)self natSemaphore];
  intptr_t v8 = dispatch_semaphore_wait(v7, 0);

  if (v8)
  {
    if (v3)
    {
      [(DefaultGKViceroyNATObserver *)self setNatType:v3];
      uint64_t v9 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      [v9 setInteger:v3 forKey:@"natType"];

      v10 = [(DefaultGKViceroyNATObserver *)self natSemaphore];
      dispatch_semaphore_signal(v10);
    }
    else
    {
      if (!os_log_GKGeneral) {
        id v12 = GKOSLoggers();
      }
      if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG)) {
        -[DefaultGKViceroyNATObserver NATTypeDidChange:]();
      }
    }
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v11 = GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG)) {
      -[DefaultGKViceroyNATObserver NATTypeDidChange:]();
    }
    [(DefaultGKViceroyNATObserver *)self teardown];
  }
}

- (GKNATObserver)natObserver
{
  return self->_natObserver;
}

- (void)setNatObserver:(id)a3
{
}

- (OS_dispatch_semaphore)natSemaphore
{
  return self->_natSemaphore;
}

- (void)setNatSemaphore:(id)a3
{
}

- (int)natType
{
  return self->_natType;
}

- (void)setNatType:(int)a3
{
  self->_natType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_natSemaphore, 0);

  objc_storeStrong((id *)&self->_natObserver, 0);
}

- (void)isValidSettings:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1C2D22000, a2, OS_LOG_TYPE_ERROR, "[GKViceroyNATObserver] Missing required setting: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_getNATTypeWithNATSettings:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_1C2D22000, v0, OS_LOG_TYPE_ERROR, "[GKViceroyNATObserver] Invalid settings provided.", v1, 2u);
}

- (void)_getNATTypeWithNATSettings:completionHandler:.cold.2()
{
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_1C2D22000, v0, OS_LOG_TYPE_ERROR, "[GKViceroyNATObserver] Timed out waiting for a valid NAT type.", v1, 2u);
}

- (void)_getNATTypeWithNATSettings:completionHandler:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8(&dword_1C2D22000, v0, v1, "[GKViceroyNATObserver] Applying settings and awaiting a valid NAT type.", v2, v3, v4, v5, v6);
}

- (void)NATTypeDidChange:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8(&dword_1C2D22000, v0, v1, "[GKViceroyNATObserver] Semaphore already signaled. Ignoring.", v2, v3, v4, v5, v6);
}

- (void)NATTypeDidChange:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8(&dword_1C2D22000, v0, v1, "[GKViceroyNATObserver] Received an invalid NAT type. Continuing to wait for a valid NAT type.", v2, v3, v4, v5, v6);
}

@end