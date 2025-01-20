@interface FMXPCNotificationsUtil
+ (id)sharedInstance;
+ (void)handleDarwinNotificationsWithHandlers:(id)a3;
+ (void)handleDistributedNotificationsWithHandlers:(id)a3;
- (BOOL)isHandlerRegisteredForDarwinNotification:(id)a3;
- (BOOL)isHandlerRegisteredForDistributedNotification:(id)a3;
- (FMXPCNotificationsUtil)init;
- (NSMutableDictionary)darwinNotificationHandlers;
- (NSMutableDictionary)distributedNotificationHandlers;
- (OS_dispatch_queue)modificationQueue;
- (void)_didReceiveDarwinNotification:(id)a3;
- (void)_didReceiveDistributedNotification:(id)a3 withContext:(id)a4;
- (void)deregisterHandlerForDarwinNotification:(id)a3;
- (void)deregisterHandlerForDistributedNotification:(id)a3;
- (void)registerHandler:(id)a3 forDarwinNotification:(id)a4;
- (void)registerHandler:(id)a3 forDistributedNotification:(id)a4;
- (void)setDarwinNotificationHandlers:(id)a3;
- (void)setDistributedNotificationHandlers:(id)a3;
- (void)setModificationQueue:(id)a3;
@end

@implementation FMXPCNotificationsUtil

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_3);
  }
  v2 = (void *)sharedInstance__instance;
  return v2;
}

uint64_t __40__FMXPCNotificationsUtil_sharedInstance__block_invoke()
{
  sharedInstance__instance = objc_alloc_init(FMXPCNotificationsUtil);
  return MEMORY[0x1F41817F8]();
}

+ (void)handleDarwinNotificationsWithHandlers:(id)a3
{
  [a3 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_3];
  v3 = MEMORY[0x1E4F14428];
  xpc_set_event_stream_handler("com.apple.notifyd.matching", v3, &__block_literal_global_9);
}

void __64__FMXPCNotificationsUtil_handleDarwinNotificationsWithHandlers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v19[0] = v4;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = v4;
    }
    else {
      id v6 = 0;
    }
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * v11);
        v13 = +[FMXPCNotificationsUtil sharedInstance];
        [v13 registerHandler:v5 forDarwinNotification:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
}

void __64__FMXPCNotificationsUtil_handleDarwinNotificationsWithHandlers___block_invoke_2(int a1, xpc_object_t xdict)
{
  string = xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x1E4F14560]);
  id v4 = +[FMXPCNotificationsUtil sharedInstance];
  v3 = [NSString stringWithUTF8String:string];
  [v4 _didReceiveDarwinNotification:v3];
}

+ (void)handleDistributedNotificationsWithHandlers:(id)a3
{
  [a3 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_12];
  v3 = MEMORY[0x1E4F14428];
  xpc_set_event_stream_handler("com.apple.distnoted.matching", v3, &__block_literal_global_15);
}

void __69__FMXPCNotificationsUtil_handleDistributedNotificationsWithHandlers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v19[0] = v4;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = v4;
    }
    else {
      id v6 = 0;
    }
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * v11);
        v13 = +[FMXPCNotificationsUtil sharedInstance];
        [v13 registerHandler:v5 forDistributedNotification:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
}

void __69__FMXPCNotificationsUtil_handleDistributedNotificationsWithHandlers___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (const char *)*MEMORY[0x1E4F14560];
  id v3 = a2;
  string = xpc_dictionary_get_string(v3, v2);
  id v6 = +[FMXPCNotificationsUtil sharedInstance];
  id v5 = [NSString stringWithUTF8String:string];
  [v6 _didReceiveDistributedNotification:v5 withContext:v3];
}

- (FMXPCNotificationsUtil)init
{
  v10.receiver = self;
  v10.super_class = (Class)FMXPCNotificationsUtil;
  v2 = [(FMXPCNotificationsUtil *)&v10 init];
  if (v2)
  {
    id v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    darwinNotificationHandlers = v2->_darwinNotificationHandlers;
    v2->_darwinNotificationHandlers = v3;

    id v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    distributedNotificationHandlers = v2->_distributedNotificationHandlers;
    v2->_distributedNotificationHandlers = v5;

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.icloud.FindMyDevice.xpcNotificationsModQueue", 0);
    modificationQueue = v2->_modificationQueue;
    v2->_modificationQueue = (OS_dispatch_queue *)v7;
  }
  return v2;
}

- (BOOL)isHandlerRegisteredForDarwinNotification:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  id v5 = [(FMXPCNotificationsUtil *)self modificationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__FMXPCNotificationsUtil_isHandlerRegisteredForDarwinNotification___block_invoke;
  block[3] = &unk_1E689EB28;
  id v9 = v4;
  objc_super v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

void __67__FMXPCNotificationsUtil_isHandlerRegisteredForDarwinNotification___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) darwinNotificationHandlers];
  v2 = [v3 objectForKeyedSubscript:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v2 != 0;
}

- (void)registerHandler:(id)a3 forDarwinNotification:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  uint64_t v8 = [(FMXPCNotificationsUtil *)self modificationQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __64__FMXPCNotificationsUtil_registerHandler_forDarwinNotification___block_invoke;
  v11[3] = &unk_1E689E8C0;
  objc_copyWeak(&v14, &location);
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __64__FMXPCNotificationsUtil_registerHandler_forDarwinNotification___block_invoke(id *a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v3 = [WeakRetained darwinNotificationHandlers];
  id v4 = [v3 objectForKeyedSubscript:a1[4]];

  if (v4)
  {
    id v5 = LogCategory_Unspecified();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = a1[4];
      int v9 = 138412290;
      id v10 = v6;
      _os_log_impl(&dword_1D0EC4000, v5, OS_LOG_TYPE_INFO, "Trying to register a duplicate handler for notification %@", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    id v7 = (void *)[a1[5] copy];
    uint64_t v8 = [WeakRetained darwinNotificationHandlers];
    [v8 setObject:v7 forKeyedSubscript:a1[4]];

    id v5 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v5, "Notification", (const char *)[a1[4] cStringUsingEncoding:4]);
    [a1[4] cStringUsingEncoding:4];
    xpc_set_event();
  }
}

- (void)deregisterHandlerForDarwinNotification:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(FMXPCNotificationsUtil *)self modificationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__FMXPCNotificationsUtil_deregisterHandlerForDarwinNotification___block_invoke;
  block[3] = &unk_1E689EB50;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __65__FMXPCNotificationsUtil_deregisterHandlerForDarwinNotification___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained darwinNotificationHandlers];
  id v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 32)];

  if (v3)
  {
    id v4 = [WeakRetained darwinNotificationHandlers];
    [v4 removeObjectForKey:*(void *)(a1 + 32)];
  }
  [*(id *)(a1 + 32) cStringUsingEncoding:4];
  xpc_set_event();
}

- (BOOL)isHandlerRegisteredForDistributedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(FMXPCNotificationsUtil *)self distributedNotificationHandlers];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6 != 0;
}

- (void)registerHandler:(id)a3 forDistributedNotification:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(FMXPCNotificationsUtil *)self modificationQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __69__FMXPCNotificationsUtil_registerHandler_forDistributedNotification___block_invoke;
  v11[3] = &unk_1E689E8C0;
  objc_copyWeak(&v14, &location);
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __69__FMXPCNotificationsUtil_registerHandler_forDistributedNotification___block_invoke(id *a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v3 = [WeakRetained distributedNotificationHandlers];
  id v4 = [v3 objectForKeyedSubscript:a1[4]];

  if (v4)
  {
    id v5 = LogCategory_Unspecified();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = a1[4];
      int v9 = 138412290;
      id v10 = v6;
      _os_log_impl(&dword_1D0EC4000, v5, OS_LOG_TYPE_INFO, "Trying to register a duplicate handler for notification %@", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    id v7 = (void *)[a1[5] copy];
    id v8 = [WeakRetained distributedNotificationHandlers];
    [v8 setObject:v7 forKeyedSubscript:a1[4]];

    id v5 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v5, "Name", (const char *)[a1[4] cStringUsingEncoding:4]);
    [a1[4] cStringUsingEncoding:4];
    xpc_set_event();
  }
}

- (void)deregisterHandlerForDistributedNotification:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(FMXPCNotificationsUtil *)self modificationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__FMXPCNotificationsUtil_deregisterHandlerForDistributedNotification___block_invoke;
  block[3] = &unk_1E689EB50;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __70__FMXPCNotificationsUtil_deregisterHandlerForDistributedNotification___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained distributedNotificationHandlers];
  id v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 32)];

  if (v3)
  {
    id v4 = [WeakRetained distributedNotificationHandlers];
    [v4 removeObjectForKey:*(void *)(a1 + 32)];
  }
  [*(id *)(a1 + 32) cStringUsingEncoding:4];
  xpc_set_event();
}

- (void)_didReceiveDarwinNotification:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(FMXPCNotificationsUtil *)self modificationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__FMXPCNotificationsUtil__didReceiveDarwinNotification___block_invoke;
  block[3] = &unk_1E689EB50;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __56__FMXPCNotificationsUtil__didReceiveDarwinNotification___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained darwinNotificationHandlers];
  id v4 = [v3 objectForKeyedSubscript:*(void *)(a1 + 32)];

  if (v4)
  {
    id v5 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__FMXPCNotificationsUtil__didReceiveDarwinNotification___block_invoke_2;
    block[3] = &unk_1E689EB78;
    id v9 = v4;
    dispatch_async(v5, block);

    id v6 = v9;
  }
  else
  {
    id v6 = LogCategory_Unspecified();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v11 = v7;
      _os_log_impl(&dword_1D0EC4000, v6, OS_LOG_TYPE_INFO, "Received darwin notification %@ but no handler found", buf, 0xCu);
    }
  }
}

uint64_t __56__FMXPCNotificationsUtil__didReceiveDarwinNotification___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_didReceiveDistributedNotification:(id)a3 withContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(FMXPCNotificationsUtil *)self modificationQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __73__FMXPCNotificationsUtil__didReceiveDistributedNotification_withContext___block_invoke;
  v11[3] = &unk_1E689EBA0;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __73__FMXPCNotificationsUtil__didReceiveDistributedNotification_withContext___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = [WeakRetained distributedNotificationHandlers];
  id v4 = [v3 objectForKeyedSubscript:*(void *)(a1 + 32)];

  if (v4)
  {
    id v5 = dispatch_get_global_queue(0, 0);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __73__FMXPCNotificationsUtil__didReceiveDistributedNotification_withContext___block_invoke_2;
    v8[3] = &unk_1E689E7D0;
    id v10 = v4;
    id v9 = *(id *)(a1 + 40);
    dispatch_async(v5, v8);

    id v6 = v10;
  }
  else
  {
    id v6 = LogCategory_Unspecified();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v12 = v7;
      _os_log_impl(&dword_1D0EC4000, v6, OS_LOG_TYPE_INFO, "Received distributed notification %@ but no handler found", buf, 0xCu);
    }
  }
}

uint64_t __73__FMXPCNotificationsUtil__didReceiveDistributedNotification_withContext___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (NSMutableDictionary)darwinNotificationHandlers
{
  return self->_darwinNotificationHandlers;
}

- (void)setDarwinNotificationHandlers:(id)a3
{
}

- (NSMutableDictionary)distributedNotificationHandlers
{
  return self->_distributedNotificationHandlers;
}

- (void)setDistributedNotificationHandlers:(id)a3
{
}

- (OS_dispatch_queue)modificationQueue
{
  return self->_modificationQueue;
}

- (void)setModificationQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modificationQueue, 0);
  objc_storeStrong((id *)&self->_distributedNotificationHandlers, 0);
  objc_storeStrong((id *)&self->_darwinNotificationHandlers, 0);
}

@end