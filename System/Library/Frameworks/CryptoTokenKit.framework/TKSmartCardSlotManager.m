@interface TKSmartCardSlotManager
+ (TKSmartCardSlotManager)defaultManager;
- (BOOL)setupConnection;
- (NSArray)slotNames;
- (TKSmartCardSlot)slotNamed:(NSString *)name;
- (TKSmartCardSlotManager)init;
- (TKSmartCardSlotManager)initWithServer:(id)a3;
- (void)dealloc;
- (void)getSlotWithName:(NSString *)name reply:(void *)reply;
- (void)setSlotWithName:(id)a3 endpoint:(id)a4 type:(id)a5 reply:(id)a6;
@end

@implementation TKSmartCardSlotManager

+ (TKSmartCardSlotManager)defaultManager
{
  id v2 = a1;
  objc_sync_enter(v2);
  if (!defaultManager_manager)
  {
    v3 = objc_alloc_init(TKSmartCardSlotManager);
    v4 = (void *)defaultManager_manager;
    defaultManager_manager = (uint64_t)v3;
  }
  objc_sync_exit(v2);

  v5 = (void *)defaultManager_manager;

  return (TKSmartCardSlotManager *)v5;
}

- (TKSmartCardSlotManager)init
{
  return [(TKSmartCardSlotManager *)self initWithServer:&__block_literal_global_2];
}

id __30__TKSmartCardSlotManager_init__block_invoke()
{
  v0 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.ctkd.slot-client" options:4096];

  return v0;
}

- (TKSmartCardSlotManager)initWithServer:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TKSmartCardSlotManager;
  v5 = [(TKSmartCardSlotManager *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
    endpoints = v5->_endpoints;
    v5->_endpoints = (NSMutableDictionary *)v6;

    dispatch_queue_t v8 = dispatch_queue_create(0, 0);
    slotNamesQueue = v5->_slotNamesQueue;
    v5->_slotNamesQueue = (OS_dispatch_queue *)v8;

    uint64_t v10 = MEMORY[0x1C189CA40](v4);
    id connectionToServer = v5->_connectionToServer;
    v5->_id connectionToServer = (id)v10;

    if (![(TKSmartCardSlotManager *)v5 setupConnection])
    {

      v5 = 0;
    }
  }

  return v5;
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  [WeakRetained invalidate];

  v4.receiver = self;
  v4.super_class = (Class)TKSmartCardSlotManager;
  [(TKSmartCardSlotManager *)&v4 dealloc];
}

- (BOOL)setupConnection
{
  v3 = (*((void (**)(void))self->_connectionToServer + 2))();
  objc_super v4 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1A01C28];
  [v3 setRemoteObjectInterface:v4];

  v5 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F19FA808];
  [v3 setExportedInterface:v5];

  [v3 setExportedObject:self];
  [v3 resume];
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __41__TKSmartCardSlotManager_setupConnection__block_invoke;
  v14[3] = &unk_1E63C8130;
  id v6 = v3;
  id v15 = v6;
  v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:v14];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __41__TKSmartCardSlotManager_setupConnection__block_invoke_14;
  v13[3] = &unk_1E63C8158;
  v13[4] = &v16;
  [v7 reportChangesForSlotType:@"smartcard" reply:v13];

  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __41__TKSmartCardSlotManager_setupConnection__block_invoke_2;
  v10[3] = &unk_1E63C81A8;
  objc_copyWeak(&v11, &location);
  v10[4] = self;
  [v6 setInterruptionHandler:v10];
  if (*((unsigned char *)v17 + 24))
  {
    objc_storeWeak((id *)&self->_connection, v6);
    BOOL v8 = *((unsigned char *)v17 + 24) != 0;
  }
  else
  {
    BOOL v8 = 0;
  }
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  _Block_object_dispose(&v16, 8);
  return v8;
}

void __41__TKSmartCardSlotManager_setupConnection__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_super v4 = TK_LOG_smartcard();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __41__TKSmartCardSlotManager_setupConnection__block_invoke_cold_1(a1);
  }

  [*(id *)(a1 + 32) invalidate];
}

uint64_t __41__TKSmartCardSlotManager_setupConnection__block_invoke_14(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  return result;
}

void __41__TKSmartCardSlotManager_setupConnection__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_super v4 = (id *)WeakRetained;
    objc_sync_enter(v4);
    v5 = NSStringFromSelector(sel_slotNames);
    [v4 willChangeValueForKey:v5];

    [*(id *)(*(void *)(a1 + 32) + 16) removeAllObjects];
    uint64_t v6 = *(void *)(a1 + 32);
    v7 = *(NSObject **)(v6 + 32);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __41__TKSmartCardSlotManager_setupConnection__block_invoke_3;
    block[3] = &unk_1E63C80E0;
    block[4] = v6;
    dispatch_sync(v7, block);
    BOOL v8 = NSStringFromSelector(sel_slotNames);
    [v4 didChangeValueForKey:v8];

    id v9 = objc_loadWeakRetained(v4 + 1);
    [v9 invalidate];

    objc_storeWeak(v4 + 1, 0);
    uint64_t v10 = (const char *)[@"com.apple.ctkd.slot-server-started" UTF8String];
    id v11 = (int *)(*(void *)(a1 + 32) + 48);
    v12 = dispatch_queue_create("server-start-notify-q", 0);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __41__TKSmartCardSlotManager_setupConnection__block_invoke_4;
    handler[3] = &unk_1E63C8180;
    objc_super v13 = v4;
    uint64_t v14 = *(void *)(a1 + 32);
    v26 = v13;
    uint64_t v27 = v14;
    uint32_t v15 = notify_register_dispatch(v10, v11, v12, handler);

    if (v15)
    {
      uint64_t v16 = TK_LOG_smartcard();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        __41__TKSmartCardSlotManager_setupConnection__block_invoke_2_cold_2(v15, v16);
      }
    }
    objc_sync_exit(v13);
  }
  v17 = TK_LOG_smartcard();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    __41__TKSmartCardSlotManager_setupConnection__block_invoke_2_cold_1(v17, v18, v19, v20, v21, v22, v23, v24);
  }
}

void __41__TKSmartCardSlotManager_setupConnection__block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 24);
  *(void *)(v1 + 24) = 0;
}

uint64_t __41__TKSmartCardSlotManager_setupConnection__block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) setupConnection];
  int v2 = *(_DWORD *)(*(void *)(a1 + 40) + 48);

  return notify_cancel(v2);
}

- (NSArray)slotNames
{
  int v2 = self;
  objc_sync_enter(v2);
  id WeakRetained = objc_loadWeakRetained((id *)&v2->_connection);

  if (!WeakRetained) {
    [(TKSmartCardSlotManager *)v2 setupConnection];
  }
  objc_sync_exit(v2);

  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__0;
  v12 = __Block_byref_object_dispose__0;
  id v13 = 0;
  slotNamesQueue = v2->_slotNamesQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__TKSmartCardSlotManager_slotNames__block_invoke;
  v7[3] = &unk_1E63C81D0;
  v7[4] = v2;
  v7[5] = &v8;
  dispatch_sync(slotNamesQueue, v7);
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSArray *)v5;
}

void __35__TKSmartCardSlotManager_slotNames__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 24);
  if (!v3)
  {
    objc_super v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(*(id *)(v2 + 16), "count"));
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = *(id *)(*(void *)(a1 + 32) + 16);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend(v4, "addObject:", *(void *)(*((void *)&v13 + 1) + 8 * v9++), (void)v13);
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }

    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithArray:v4];
    uint64_t v11 = *(void *)(a1 + 32);
    v12 = *(void **)(v11 + 24);
    *(void *)(v11 + 24) = v10;

    id v3 = *(void **)(*(void *)(a1 + 32) + 24);
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v3);
}

- (void)setSlotWithName:(id)a3 endpoint:(id)a4 type:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  long long v13 = (void (**)(void))a6;
  long long v14 = TK_LOG_smartcard();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[TKSmartCardSlotManager setSlotWithName:endpoint:type:reply:]((uint64_t)v10);
  }

  long long v15 = self;
  objc_sync_enter(v15);
  long long v16 = NSStringFromSelector(sel_slotNames);
  [(TKSmartCardSlotManager *)v15 willChangeValueForKey:v16];

  endpoints = v15->_endpoints;
  if (v11) {
    [(NSMutableDictionary *)endpoints setObject:v11 forKey:v10];
  }
  else {
    [(NSMutableDictionary *)endpoints removeObjectForKey:v10];
  }
  slotNamesQueue = v15->_slotNamesQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__TKSmartCardSlotManager_setSlotWithName_endpoint_type_reply___block_invoke;
  block[3] = &unk_1E63C80E0;
  block[4] = v15;
  dispatch_sync(slotNamesQueue, block);
  uint64_t v19 = NSStringFromSelector(sel_slotNames);
  [(TKSmartCardSlotManager *)v15 didChangeValueForKey:v19];

  objc_sync_exit(v15);
  v13[2](v13);
}

void __62__TKSmartCardSlotManager_setSlotWithName_endpoint_type_reply___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 24);
  *(void *)(v1 + 24) = 0;
}

- (void)getSlotWithName:(NSString *)name reply:(void *)reply
{
  uint64_t v6 = name;
  uint64_t v7 = reply;
  uint64_t v8 = self;
  objc_sync_enter(v8);
  id WeakRetained = objc_loadWeakRetained((id *)&v8->_connection);

  if (!WeakRetained) {
    [(TKSmartCardSlotManager *)v8 setupConnection];
  }
  objc_sync_exit(v8);

  id v10 = objc_loadWeakRetained((id *)&v8->_connection);
  id v11 = [v10 _queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__TKSmartCardSlotManager_getSlotWithName_reply___block_invoke;
  block[3] = &unk_1E63C8220;
  block[4] = v8;
  long long v15 = v6;
  id v16 = v7;
  id v12 = v7;
  long long v13 = v6;
  dispatch_async(v11, block);
}

void __48__TKSmartCardSlotManager_getSlotWithName_reply___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKey:*(void *)(a1 + 40)];
  if (v2)
  {
    id v3 = objc_alloc_init(TKSmartCardSlot);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __48__TKSmartCardSlotManager_getSlotWithName_reply___block_invoke_2;
    v6[3] = &unk_1E63C81F8;
    id v4 = *(id *)(a1 + 48);
    uint64_t v7 = v3;
    id v8 = v4;
    id v5 = v3;
    [(TKSmartCardSlot *)v5 connectToEndpoint:v2 synchronous:0 reply:v6];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t __48__TKSmartCardSlotManager_getSlotWithName_reply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  if (a2) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = *(void *)(a1 + 32);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v3, v4);
}

- (TKSmartCardSlot)slotNamed:(NSString *)name
{
  uint64_t v4 = name;
  id v5 = self;
  objc_sync_enter(v5);
  id WeakRetained = objc_loadWeakRetained((id *)&v5->_connection);

  if (!WeakRetained) {
    [(TKSmartCardSlotManager *)v5 setupConnection];
  }
  objc_sync_exit(v5);

  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__0;
  uint64_t v20 = __Block_byref_object_dispose__0;
  id v21 = 0;
  id v7 = objc_loadWeakRetained((id *)&v5->_connection);
  id v8 = [v7 _queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__TKSmartCardSlotManager_slotNamed___block_invoke;
  block[3] = &unk_1E63C8248;
  long long v15 = &v16;
  block[4] = v5;
  uint64_t v9 = v4;
  long long v14 = v9;
  dispatch_sync(v8, block);

  if (v17[5])
  {
    id v10 = [TKSmartCardSlot alloc];
    id v11 = [(TKSmartCardSlot *)v10 initWithEndpoint:v17[5] error:0];
  }
  else
  {
    id v11 = 0;
  }

  _Block_object_dispose(&v16, 8);

  return v11;
}

uint64_t __36__TKSmartCardSlotManager_slotNamed___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 16) objectForKey:a1[5]];

  return MEMORY[0x1F41817F8]();
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_connectionToServer, 0);
  objc_storeStrong((id *)&self->_slotNamesQueue, 0);
  objc_storeStrong((id *)&self->_slotNames, 0);
  objc_storeStrong((id *)&self->_endpoints, 0);

  objc_destroyWeak((id *)&self->_connection);
}

void __41__TKSmartCardSlotManager_setupConnection__block_invoke_cold_1(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  int v3 = 138543618;
  uint64_t v4 = v1;
  OUTLINED_FUNCTION_9();
  _os_log_error_impl(&dword_1BED55000, v2, OS_LOG_TYPE_ERROR, "ctk: connecting to slot registration server (%{public}@) failed, error %{public}@", (uint8_t *)&v3, 0x16u);
}

void __41__TKSmartCardSlotManager_setupConnection__block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __41__TKSmartCardSlotManager_setupConnection__block_invoke_2_cold_2(int a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 138412546;
  int v3 = @"com.apple.ctkd.slot-server-started";
  __int16 v4 = 1024;
  int v5 = a1;
  _os_log_error_impl(&dword_1BED55000, a2, OS_LOG_TYPE_ERROR, "registering notification '%@' failed with status %u", (uint8_t *)&v2, 0x12u);
}

- (void)setSlotWithName:(uint64_t)a1 endpoint:type:reply:.cold.1(uint64_t a1)
{
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_2_0(&dword_1BED55000, v1, v2, "got notification for new slot: name=%{public}@, ep=%{public}@", (void)v3, DWORD2(v3));
}

@end